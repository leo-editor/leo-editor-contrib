#!/usr/bin/env python2.3
# -*- coding: utf-8 -*-
#@+leo-ver=4
#@+node:@file ConcurrentEditable.py
#@@first
#@@first

#@<<docs>>
#@+node:<<docs>>
#@+others
#@+node:About
"""
This code correspond to an implementation of a Concurrent Editable Text buffer.

The code is strictly based on the works of Chengzheng Sun.

Actually all the function were written in order to follow as much as possible the notation introduced in his papers. So most of the code is procedure oriented and not strictly pythonic.

Search at http://www.researchindex.com for the files:

    operational_transformation_issues_algorithms_achievements.djvu
    sun98achieving.pdf (<- the must)
    sun97generic.pdf (citeseer.nec.jp.com/sun97generic.htm)
    sun98operational.pdf
    sun98reversible.pdf

You need this documents to understand the code.

This file provide a unit test that execute an instance of the example proposed in the reference papers.

There are also the classes named ConcurrentEditableServer/ConcurrentEditableClient that try to implement a 'star' configuration (one server <-> N clients) for the comunications.

I recomend using Leo to explore the code. http://leo.sf.net
"""

#@<<legal declaration>>
#@+node:<< legal declaration >>
#@+at
# LeoN version 0.1.0 alpha, "Feux d'artifice".
# LeoN project. Leo over Network.
# Rodrigo Benenson 2003, 2004. <rodrigo_b at users dot sourceforge dot net>
# http://souvenirs.sf.net, http://leo.sf.net.
# 
# The collaborative editing code is based research papers of Chengzheng Sun.
# 
# This code is released under GNU GPL.
# The license is aviable at 'LeoN.leo/LeoN/Docs/GNU GPL' or in the web 
# http://www.gnu.org .
# 
# ---
# This file is part of LeoN.
# 
# LeoN is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# LeoN is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with LeoN; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# ---
#@-at
#@@c
#@nonl
#@-node:<< legal declaration >>
#@nl
#@nonl
#@-node:About
#@+node:Release status
#@+at
# This file is released as part of the LeoN distribution. Look at the LeoN 
# docs for information of the status of this module.
#@-at
#@@c
#@-node:Release status
#@+node:ConcurrentEditable algorithm explanation
#@+at
# To understand the ConcurrentEditable code you will have to read the works of 
# Chengzheng Sun.
# (http://www.researchindex.com sun98achieving.pdf and related files)
# 
# This is a very short explication of the main concepts behind the algorithm, 
# to have the big pictures while reading the papers.
# 
# Big picture (of base implementation: ConcurrentEditable)
# -----------
# 
# There is a concurrent editable object that receive commands  (operations to 
# realize) associated with the State Vector of the emisor.
# 
# The received command are 'received and delayed to preserve causality' or 
# 'executed'.
# 
# When executed an undo/transform-do/transform-redo scheme is used.
# 
# The transformation of commands (operational transforms) is realized by the 
# GOT algorithm.
# 
# The GOT algorithm use two application specific transformation functions IT, 
# ET (inclusion and exclusion transform, respectively).
# 
# Tadaaa...
#@-at
#@@c
#@-node:ConcurrentEditable algorithm explanation
#@+node:Context (so what?)
#@+at
# so what? -> Why should you care about this code?
# 
# If you want to implement a collaborative text editing software.
# You will need to care about three aspects:
#     - network layer
#     - editor user interface
#     - core logic for collaborative editing
# 
# The python implementation allow a full cross platform usage and a very rapid 
# deployment; considering that there already exist solutions for the network 
# layer (Twisted) and tools to create easilly user interfaces (Tkinter, 
# wxWindows).
# 
# I will enjoy to know about anyone using this code, so please feel free to 
# mail me (see 'legal declaration' node for my email).
#@-at
#@@c
#@-node:Context (so what?)
#@+node:About ConcurrentEditableClient and ConcurrentEditableServer
#@+at
# (A little explication about centralized network, ConcurrentEditableServer 
# and ConcurrentEditableClient)
# 
# The topology suposed in the Chengzheng Sun works is an all-to-all clients 
# connection. This assumption is theoritically correct, in internet (for 
# example) it is supposed that every computer is able to send messages to any 
# other one (under the restriction of the network security configurations).
# 
# Otherwise this figure is not appropiate for a real implementation because it 
# require that every client use his bandwith to talk with every other ones 
# and, more important, it require a distributed logic for login and logout to 
# and ongoing session.
# A distributed logic is complex and will tend to make the implementation 
# error prone and not very responsive when login/logout. So a smart decision 
# between the tradeoffs is required.
# 
# Tradeoffs:
#     - logic complexity
#     - speed of connection and disconnection
#     - memory usage
#     - cpu usage
#     - bandwidth usage
#     - implementation complexity
#     - similarity to original paper
# 
# My original idea was to create an abstraction layer that will hide the 
# existence of the other clients. Each site should be only aware of it own and 
# the server. This was an ideal solution: all the logic complexity is situated 
# on the server, the connection/disconnection is managed by exclusively by the 
# server, the bandwith usage to not grow as more clients connect, the memory 
# usage and cpu on the clients is minimized. The only problem: it cannot be 
# done. It tooks be 2 week of work and fight with the implementation to obtain 
# the necessary indepth to understand that such abstraction could not be done 
# without modifying the algorithm, and this is a too dangerous attempt.
# 
# So another tradeoff equilibrium has to be found.
# Without an abstraction layer every client has to be aware of each others. 
# This make necessary an acknoledgement of every client when a connection or 
# disconnection occurs. Doing this in a distributed scenario where already 
# marked packets are travelling in an unknown order is complex and will tend 
# to provide solutions that blocks the comunication before completion the 
# connection process. Also the logic involved in client references addition 
# and deletion is not minor and would attack the responsiveness of the clients 
# during that process. So after various days of medition I think that I have 
# found a good tradeoff.
# 
# To manage in a better way the bandwith we keep a Client-Server topology, 
# where the Server acts as a mere repeater to send the received operation to 
# every connected client.
# Then the key idea is "to do not decrease the state_vectors". Doing this 
# could be look stupid in a first perspective. But after thinking it a while 
# you maybe will be able to understand how such a barbarity can become a good 
# idea.
# As the state_vectors do not decreases then there are only two cases: the 
# state_vector is increased, a client replace an already disconnected one.
# Both case as extremelly simples in logic cost and are robust to distributed 
# awardness. Using the key idea the conection/disconection logic is 
# centralized in the server and is very fast because it do not require an 
# acknoledge signal from the rest of the clients.
# 
# 
# If client receive an operation with a timestamp (reference state_vector) 
# bigger than it own it will make grow all his references.
# If the server recieve a new client it check for previously liberated client 
# indexes and assign it, else it make grow all his timestamps. If a client 
# disconnect it simply erase his reference in repeatear function.
# If a client emit an operation with a shorter state vector it is because it 
# has received no operations from the new client so it is secure to extend it 
# with zeros.
# Obviously when the last client disconnect from the server, it have the 
# opportunity to clean shi memory and refresh back into it default state 
# vector length.
# 
# As you can see everything become simple and robust. Maybe the bandwith usage 
# is suboptimal, but in most usage cases the wasting marges should be 
# reasonable.
# 
# 
# The schema used for testing the protocol is intensionally similar to the 
# Twisted Spread distributed object system, because I pretend to use it for 
# the first networked subclass. I suppose that any distributed object engine 
# should be able to deal with the required network methods.
# 
#@-at
#@@c
#@-node:About ConcurrentEditableClient and ConcurrentEditableServer
#@-others
#@nonl
#@-node:<<docs>>
#@nl

import unittest

dbg = 0# debug level ;p
        
#@+others
#@+node:base implementation
#@+at
# Base implementation of the paper concepts. This code do not worry about 
# comunication methods.
#@-at
#@@c
#@-node:base implementation
#@+node:ConcurrentEditable
class ConcurrentEditable:
    """
    This is the core class.
    It instanciate a Site that contain an editable text.
    Will receive and generate operations.
    The implementation is focused on simplicity and paper similarities.
    """
    
    def __init__(self, site_index, num_of_sites):
        """
        if site_index == None then the site is and Observer
        """
       
        warning = "Garbage Collector is disabled, unbounded memory usage."
        #import warnings; warnings.warn(warning, stacklevel=2)
        print "UserWarning:", warning
                
        self.site_index   = site_index
        self.state_vector = [0] * num_of_sites
                
        self.state_vector_table   = [[0]* num_of_sites]* num_of_sites # required by the garbage collector (SVT)
        self.minimum_state_vector = [0]*num_of_sites # required by the garbage collector (MSV)

        if self.site_index:
            self.state_vector_table [self.site_index] = self.state_vector # link with local state_vector
  
        self.HB = [] # history buffer
        self.delayed_operations = [] 

        self.text_buffer = ""
        
        return
        
    def get_text(self):
        """
        """
        
        return self.text_buffer


    #@    @+others
    #@+node:receive operation
    
    def receive_operation(self, t_op, *args, **kw):
        """
        can receive operations receiving an Operation object, or being called as : (type, pos, data, {extra args}) 
        receive an operation to execute
        check if it is causally ready
        if not delay it
        else execute it
        if executed check the delayed buffer to check for operation that now can be operated (and so on until no operation is executable)
        ---
        The workflow is receive->apply->execute
        """
    
        if not isinstance(t_op, Operation):
            try:
                assert len(args) == 2
                t_op = Operation(t_op, args[0], args[1])
                for k in kw:
                    t_op[k] = kw[k]
            except:
                raise "Error on receive_operation arguments (%s, %s, %s)"%(t_op, args, kw)
                
        # receive an operation to execute
        if dbg >=1:
            print "Site %s;%s; '%s'; receiving %s"%(self.site_index, self.state_vector, self.get_text(), t_op)
    
        
        if is_causally_ready(t_op, self): 		# check if it is causally ready
            self.apply(t_op) # execute it (apply to local buffer)
                
            # if executed check the delayed buffer to check for operation that now can be operated
            # (and so on until no operation is executable)			
            
            while 1: # uhhh, dangerous
                for tt_op in self.delayed_operations:
                    if is_causally_ready(tt_op, self): 
                        self.apply(tt_op) 
                        self.delayed_operations.remove(tt_op)
                        break # break the 'for'; go back to 'while 1'
                break # end of while 1
    
        else: # if not delay it
            self.delayed_operations.append(t_op)
        
        if dbg >=1:
            print "Site %s; HB %s"%(self.site_index, self.HB)
            print "Site %s;%s; '%s'; delayed_ops: %s\n"%(self.site_index, self.state_vector, self.get_text(), self.delayed_operations)
    
                
        return
    
    receive_op = receive_operation # alias
        
    #@-node:receive operation
    #@+node:apply
    def apply(self, Onew):
        """
        Algorithm 3: The undo/transform-do/transform-redo scheme (sun98generic)
        
        Given a new causally-ready operation Onew , and HB = [EO1,..., EOm,..., EOn ], the following steps are executed:
        
        1. Undo operations in HB from right to left until an operation EOm is found such that EOm => Onew .
        2. Transform Onew into EOnew by applying the GOT control scheme. Then, do EOnew .
        3. Transform each operation EOm+i in HB[m+1,n] into the new execution form EO'm+i as follows:
            - EO'm+1 := IT (EOm+1, EOnew ).
            - For 2 <= i <= (n - m),
                (1) TO := LET (EOm+i, reverse(HB[m+1,m+i - 1]) );
                (2) EO'm+i := LIT (TO, [EOnew, EO'm+1,..., EO'm+i-1 ]).
            Then, redo EO'm+1, EO'm+2, ..., EO'n , sequentially.
        
        After the execution of the above steps, the contents of the history buffer becomes: HB = [EO1,..., EOm, EOnew, EO'm+1,..., EO'n ].
        ---
        This function manage the History Buffer and update the State Vector Table.
        """
            
        #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>EDIT THIS CODE the garbage collector was disabled, you should enable it and patch it !!<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<	
        assert T(Onew) in ["Insert", "Delete"], "Invalid operation request."
        
        if dbg >=1:
            print "Site %s;%s; '%s'; applying %s"%(self.site_index, self.state_vector, self.get_text(), Onew)
    
    
        HB = self.HB
    
        # 1.
        m = 0 # manage the case HB == []
        undoed = []
        for m in range(len(HB) -1, 0 -1, -1):	 # from right to left
            EOm = HB[m]
            #print "check_total_ordering(%s, %s) => %i"%(EOm, Onew, check_total_ordering(EOm, Onew)) # just for debugging
            if not check_total_ordering(EOm, Onew):
                self.undo(EOm)
                # operations do should not be erased from HB, because they will later be transformed !
                undoed.append(EOm)
            else:
                break
            
        if HB and len(undoed) == len(HB):
            if dbg>=2:
                print "No previous op found !"
            m = -1 # to indicate that no previous op was found
    
        # 2.
        EOnew = GOT( Onew, HB[:m+1]) # pass Onew and HB = [EO1, EO2, ..., EOm ]
        self.execute(EOnew)
        # EOnew will be inserted after step 3 to follow better the paper notation.
        if dbg>=2:
            print "m %i; [EO1, ..., EOm ] %s; HB[m+1:] %s"%(m,  HB[:m+1],  HB[m+1:])
    
        
        # 3.
        if undoed: # if there was an undo, then redo
            if dbg>=1:
                print "Site %s; '%s'; undoed %s; executed %s;"%(self.site_index, self.get_text(), undoed, EOnew) # just for debugging
            EOoL = [] # EO'm+1 List
    
            EOoL.append( IT( HB[m+1], EOnew ) ) 
            for i in range(1, len(undoed)):  # python indexes start from 'zero' (in the paper they start from 'one')
                TO = LET( HB[m+1+i], reverse(HB[m+1: m+i +1])) # paper [m+1,m+i - 1] -> python [m+1:m+i +1]
                EOoL.append( LIT( TO, [EOnew] + EOoL) )
    
            #print "m: %i; len(EOoL) %i;EOoL %s"%(m, len(EOoL), EOoL) # just for debugging
            for i in range(len(EOoL)):			
                t_op = EOoL[i]
                self.execute(t_op)
                HB[m+1+i] = t_op # python indexes start from 'zero'
    
    
        # After the execution of the above steps [...] HB = [EO1,..., EOm, EOnew, EO'm+1,..., EO'n ].
        HB.insert(m + 1, EOnew) # insert into the HB, just after EOm
            
            
        # Update local State vector
        t_index = Onew["source_site"]
        assert t_index < len(self.state_vector), "Received an operation from a source_site outside the state_vector range"
        self.state_vector[t_index] += 1
    
        if EOnew["source_site"] != self.site_index: # local SVT is linked to the local SV
            self.state_vector_table[EOnew["source_site"]] = list(EOnew["timestamp"]) # update state_vector_table (via a list copy)
    
        #if (len(HB) % 10) == 0: # call the garbage collector (over a dummy periodic condition)
            #self.collect_garbage()
    
        return
    #@-node:apply
    #@+node:execute
    def execute(self, EO, splitted_part=0):
        """
        Modify the text buffer.
        The lost information is stored into the operators for future undos.
        """
        
        if EO.get("is_splitted"):
            self.execute(EO["splitted_head"], splitted_part=1)
            self.execute(EO["splitted_tail"], splitted_part=1)
            return
            
        startpos = P(EO)
        data     = EO["data"]
        
        if T(EO) == "Insert":
            self.insert_text(startpos, data, op=EO)
            
        elif T(EO) == "Delete":
            self.delete_text(startpos, data, op=EO)
        else:
            raise " Tried to execute an Unmanaged Operation type"
            
        return
        
    redo = execute # alias
    #@nonl
    #@-node:execute
    #@+node:insert_text
    def insert_text(self, startpos, data, op=None):
        """
        the op argument is used to obtain extra information in some specific posible implementations
        """
            
        self.text_buffer = self.text_buffer[:startpos] + data + self.text_buffer[startpos:]
        
        return
    #@-node:insert_text
    #@+node:delete_text
    def delete_text(self, startpos, length, op=None):
        """
        the op argument is used to obtain extra information in some specific posible implementations
        It is necessary to store there some undo information.
        """
        
        t_text = self.text_buffer
        op["deleted_text"] = t_text[startpos:(startpos+length)]
        self.text_buffer = ''.join(t_text[:startpos] + t_text[(startpos+length):])	
            
        return
    #@nonl
    #@-node:delete_text
    #@+node:undo
    def undo(self, EO):
        """
        Undo an operation. Return the text to his previous state.
        The undo operation supose that EO is the last operation executed over the buffer.
        """
        
        if EO.get("is_splitted"):
            self.undo(EO["splitted_head"])
            self.undo(EO["splitted_tail"])
            return
    
        if T(EO) == "Delete":
            assert EO.has_key("deleted_text"), "Undoable operation (no undo info stored)"
            self.execute( op("Insert", P(EO), EO["deleted_text"]) ) # create the undo operation and execute it
            
        elif T(EO) == "Insert":
            self.execute( op("Delete", P(EO), len(S(EO)) ) ) # create the undo operation and execute it
            
        else:
            raise "Trying to undo an Unmanaged Operation."
        
        
        return
    
    #@-node:undo
    #@+node:collect_garbage
    def collect_garbage(self):
        """
        Algorithm 4. The garbage collection procedure. sun98achieving (page 18, 19, 20).
        Scan HB from left to right. Let EO be the current operation under inspection.
        Suppose that EO was generated at site i and timestamped by SVEO.
            (1) If SVEO [i] <= MSVk[i], then EO is removed from HB and continue scanning.
            (2) Otherwise stop scanning and return.
            
        (The garbage collection procedure can be invoked periodically, or after processing each remote operation/message, or when the number of buffered operations in HB goes beyond a preset threshold value.)
        """
            
        dbg = 1 # just for debugging, delete this line later <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            
        # reference asignations (local aliases)
        HB  = self.HB 
        SVT = self.state_vector_table
        MSV = self.minimum_state_vector
        
        # compute the MSV
        for i in range(len(MSV)):
            MSV[i] = min( [ sv[i] for sv in SVT ] )
        
        if dbg >=1:
            print "Site %s; MSV %s; SVT %s;"%(self.site_index, MSV, SVT)
            
        # collect the garbage
        base_EO = HB[0]
        for EO in HB:
            i    = EO["source_site"]
            SVEO = EO["timestamp"]
            
            condition = reduce(lambda x,y: x+y, [ SVEO[i] <= MSV[i] for i in range(len(SVEO))]) == len(SVEO) # bizare but it works
            
            if condition:
                base_EO = EO
                HB.remove(EO)
                if dbg>=1:
                    print "Site %s; removing %s"%(self.site_index, EO)
    
            else:
                break
                
        
        return Operation(**base_EO) # base EO is necesarry for more complex implementations, returns a copy.
    
    
    def update_SVT(self, site_index, state_vector):
        """
        update_StateVectorTable
        
        sun98achievings.pdf, page 19 paragraph 2.
        If one site happens to be silent for an unusually long period of time, other sites will not know what its state is [a 'mostly observer' site]. Therefore, it is required for a site to broadcast a short state message containing its state vector when it has not generated an operation for a certain period of time and/or after executing a certain number of remote operations. Upon receiving a state message from a remote site r, site k simply updates its rth statve vecor in SVTk withe the piggybacked state vector.
        ---
        This function is used as a remote call to broadcast the state message.
        """
        
        self.state_vector_table[site_index] = state_vector
        
        return
    
    #@-node:collect_garbage
    #@+node:generate operations
    def generate_operation(self, type, pos, data, **kws):
        """
        The site generate an operation, and apply it locally.
        """
        
        t_SV = list(self.state_vector) # copy the list
        t_SV[self.site_index] += 1
        
        t_op = Operation(type, pos, data, t_SV, self.site_index)
        
        for k in kws.keys():
            t_op[k] = kws[k]
            
        if dbg>=1:
            print "Site %s; generating %s"%(self.site_index, t_op)
        
        self.receive_op(t_op)
        
        return t_op
    
    def gen_op(self, type, pos, data, **kws):
        """
        Alias of generate_operation.
        """
        return self.generate_operation(type, pos, data, **kws)
        
        
    def gen_Op(self, type, data, pos, **kws):
        """
        Alias with another parameters order.
        """
        
        return self.gen_op(type, pos, data, **kws)
    #@-node:generate operations
    #@-others
    

#@-node:ConcurrentEditable
#@+node:operations relations
#@+at
# Function defined over the operation that return boolean values
#@-at
#@@c
#@-node:operations relations
#@+node:causally-ready

def is_causally_ready(t_O, t_site):
    """
    Definition 5: Conditions for executing remote operations

    Let O be an operation generated at site s and timestamped by SVo . O is causally-ready for execution at site d (d != s) with a state vector SVd only if the following conditions are satisfied:
        1. SVo [s] = SVd [s] + 1, and
        2. SVo [i] <= SVd [i], for all i in {0,1, ..., N - 1} and i != s.
    """
    
    SVd = t_site.state_vector
    SVo = t_O["timestamp"]
    s   = t_O["source_site"]
    
    assert len(SVd) == len(SVo), "State vectors are not comparable (len(SVd) == %i, len(SVo) == %i; SVd: local site state_vector %s, SVo: operation timestamp %s)"%(len(SVd), len(SVo), SVd, t_O)
      
    assert len(SVd) == len(SVo), "State vectors are not comparable (len(SVd) == %i, len(SVo) == %i)"%(len(SVd), len(SVo)) 
    assert type(s) is int, "The operation has no source site (%s)"%(t_O)
    
    # 1.
    condition1 = ( SVo[s] == SVd[s] + 1 )
    
    #2.
    condition2 = 1
    for i in range(len(SVd)):
        if i == s: continue
        condition2 = condition2 and (SVo[i] <= SVd[i])
    
    
    return condition1 and condition2
#@-node:causally-ready
#@+node:total ordering relation

def check_total_ordering(Oa, Ob):
    """
    Check if Oa => Ob.
    Definition 6: Total ordering relation "=>"
    
    Given two operations Oa and Ob, generated at sites i and j and timestamped by SVOa and SVOb, respectively, then Oa => O b, iff:
        1. sum(SVOa) < sum(SVOb), or
        2. i < j when sum(SVOa) = sum(SVOb),
    
    where sum(SV) = $\sum_{i=0}^{N-1} SV[i]$.	
    """
    
    sum = lambda t_list: reduce(lambda x,y: x+y, t_list)
    
    SVOa = Oa["timestamp"]
    SVOb = Ob["timestamp"]
    
    assert SVOa and SVOb, "can not check operations without timestamp. (Oa:%s; Ob:%s)"%(Oa, Ob)
    
    # 1.
    condition1 = sum(SVOa) < sum(SVOb)
    
    #2.
    i = Oa["source_site"]
    j = Ob["source_site"]
    
    condition2 = (sum(SVOa) == sum(SVOb)) and (i < j)
        
    return condition1 or condition2
#@-node:total ordering relation
#@+node:dependent or independent
#@+at
# Definition 1: Causal ordering relation "->"
# 
# Given two operations Oa and Ob , generated at sites i and j, then Oa -> Ob , 
# iff:
#     1. i = j and the generation of Oa happened before the generation of Ob , 
# or
#     2. i != j and the execution of Oa at site j happened before the 
# generation of Ob , or
#     3. there exists an operation Ox, such that Oa -> Ox and Ox -> Ob.
# 
# Definition 2: Dependent and independent operations
# 
# Given any two operations Oa and Ob.
#     1. Ob is said to be dependent on Oa iff Oa -> Ob.
#     2. Oa and Ob are said to be independent (or concurrent) iff neither Oa 
# -> Ob , nor Ob -> Oa , which is expressed as Oa || Ob.
# 
# (nor == not or; 0,0 => 1 , 0 else)
# 
#@-at
#@@c

def are_dependent(Oa,Ob):
    """
    Implement a less than strict check. Will return true if (Oa->Ob) or if there is a Ox such as (Oa->Ox and Ox->Ob)
    
    After reading in detail the papers I propose:
    Oa -> Ob iff :
        if i==j: return SVoa[i] < SVob[i]
        else:    return SVoa[i] <= SVob[i]
    """
    
    i = Oa["source_site"]
    j = Ob["source_site"]
    
    
    if i == j:
        return Oa["timestamp"][i] <  Ob["timestamp"][i]
    else:
        return Oa["timestamp"][i] <= Ob["timestamp"][i]
    
    return
    

def are_concurrent(Oa,Ob):
    """
    Check if both operations are independent (or concurrent)
    
    return Oa->Ob nor Ob->Oa
    (nor == not or; 0,0 => 1 , 0 else)
    """	
    return not (are_dependent(Oa,Ob) or are_dependent(Ob,Oa) )
    
    
are_independent = are_concurrent # just an alias
#@-node:dependent or independent
#@+node:GOT

def GOT( Onew, HB):
    """ 
    GOT: Generic Operation Transform
    Algorithm 2: The GOT control scheme (sun98generic)

    Given a new causally-ready operation Onew , and HB = [EO1 , EO2, ..., EOm ]. The following steps are executed to obtain EOnew :
    
    1. Scanning the HB from left to right to find the first operation EOk such that EOk || Onew (EOk and Onew are concurrent (or independent)). If no such an operation EOk is found, then EOnew := Onew.
    
    2. Otherwise, search the range of HB[k+1,m] to find all operations which are causally preceding Onew, and let EOL denote these operations. If EOL = [ ], then EOnew := LIT (Onew , HB[k,m]).
    
    3. Otherwise, suppose EOL = [EOc1, ..., EOcr ], the following steps are executed:
        (a) Get EOL' = [EO'c1, ..., EO'cr ] as follows:
            i. EO'c1 := LET (EOc1, reverse(HB[k, c1 - 1]) ):
            ii. For 2 <= i <= r,
                TO := LET (EOci , reverse(HB[k, ci - 1]) );
                EO'ci := LIT (TO, [EO'c1, ..., EO'ci-1]).
        (b) O'new := LET (Onew, reverse(EOL') ).
        (c) EOnew := LIT (O'new, HB[k,m]).
    """
    
    EOnew = Onew # the default result
    
    for k in range(len(HB)):
        EOk = HB[k]
        if are_concurrent(EOk, Onew): 
            EOL = HB[k+1:]; c1 = k+1 
            if EOL == []:
                EOnew = LIT(Onew, HB[k:])
            else:
                # (a) i.
                r = len(EOL) 
                
                EOLl = range(r) # EOLl <=> EOL'
                #print "GOT (a) i.; r %s; (k,c1 - 1) %s; len(HB) %s"%(r, (k,c1 - 1), len(HB)) # just for debugging
                
                EOLl[0] = LET(EOL[0], reverse(HB[k:c1 - 1 +1])) # +1 because in paper notation ranges are incluse, incluse ('[]'); while python they are incluse, exclusive ('[)')
                
                # (a) ii.
                for i in range(1,r):
                    TO = LET(EOL[i], reverse(HB[k: c1 + i - 1 + 1]))
                    EOLl[i] = LIT(TO, EOLl[1:i-1+1])
                
                # (b)
                Oonew = LET(Onew, reverse(EOLl))
                
                # (c)
                EOnew = LIT(Oonew, HB[k:])
            
    return EOnew
#@nonl
#@-node:GOT
#@+node:Transformations
def LIT(O, OL):
    """
    Inclusion transform over a list
    """
    if OL==[]:
        Oo = O
    else:
        Oo = LIT(IT(O, OL[0]), OL[1:])
    
    return Oo
    
def LET(O, OL):
    """
    Exclusion transform over a list
    """
    if OL==[]:
        Oo = O
    else:
        Oo = LET(ET(O, OL[0]), OL[1:])
    
    return Oo
    

def reverse(in_list):
    """
    Helper function used to have a compact notation.
    """
    
    t_list = list(in_list) # create a copy
    t_list.reverse() # in place operator
    
    return t_list
#@nonl
#@-node:Transformations
#@+node:IT

def IT (Oa, Ob):
    """
    Inclusion Transform.
    Return a transformed Oa, named Ooa, such that the impact of the independent operation Ob (against Oa) is efectively included into Oa.
    Also define the timestamp of the virtual operation.
    """

    if Check_RA(Oa):
        #print "Check_BO(\n\t%s, \n\t%s \n)\t\t=> %s"%(Oa, Ob, Check_BO(Oa, Ob)) # just for debugging
        if Check_BO(Oa, Ob):
             Ooa = Convert_AA(Oa, Ob)
        else:
             Ooa = Oa 
    elif T(Oa) == "Insert" and T(Ob) == "Insert":
         Ooa = IT_II(Oa, Ob)
    elif T(Oa) == "Insert" and T(Ob) == "Delete":
        Ooa = IT_ID(Oa, Ob)
    elif T(Oa) == "Delete" and T(Ob) == "Insert":
        Ooa = IT_DI(Oa, Ob)
    else: # if T(Oa) == "Delete" and T(Ob) == "Delete"
        Ooa = IT_DD(Oa, Ob)
        
    
    Ooa["source_site"] = Oa["source_site"]
    Ooa["timestamp"]   = list(Oa["timestamp"]) # copy
    
    if dbg>=2:	
        print "IT(\n\t%s, \n\t%s\n)\t\t=> %s;"%(Oa, Ob,Ooa) # just for debugging
        
    return Ooa


def IT_II(Oa, Ob):

    if P (Oa) < P (Ob):
        Ooa = Oa
    else:
        Ooa = Op( "Insert", S(Oa), P(Oa) + L(Ob) )
        
    return Ooa


def IT_ID(Oa, Ob):

    if P(Oa) <= P(Ob):
        Ooa = Oa 
    elif P(Oa) > ( P(Ob) + L(Ob) ):
        Ooa = Op( "Insert",  S(Oa), P(Oa) - L(Ob) )
    else:
        Ooa = Op( "Insert",  S(Oa), P(Ob) )
        
        Save_LI(Ooa, Oa, Ob )
        
    return Ooa

def IT_DI(Oa, Ob):

    if P(Ob) >= (P(Oa) + L(Oa)):
        Ooa = Oa 
    elif P(Oa) >= P(Ob):
        Ooa = Op( "Delete",  L(Oa), P(Oa) + L(Ob) )
    else: 
        Ooa = Splitted( 
                        Op( "Delete", P(Ob) - P(Oa)          , P(Oa)         ),
                        Op( "Delete", L(Oa) - (P(Ob) - P(Oa)), P(Ob) + L(Ob) ) )
    return Ooa

def IT_DD(Oa, Ob):

    if P (Ob) >= (P(Oa) + L(Oa)):
        Ooa = Oa 
    elif P(Oa) >= (P(Ob) + L(Ob)):
        Ooa = Op( "Delete", L(Oa), P(Oa) - L(Ob) )
    else:
        if P(Ob) >= P(Oa) and (P(Oa) + L(Oa)) <= (P(Ob) + L(Ob)):
            Ooa = Op( "Delete", 0, P(Oa) )
        elif P(Ob) <= P(Oa) and (P(Oa) + L(Oa)) > (P(Ob) + L(Ob)):
            Ooa = Op( "Delete", P(Oa) + L(Oa) - (P(Ob)+ L(Ob)), P (Ob) )
        elif P(Ob) > P(Oa) and (P(Ob) + L(Ob)) >= (P(Oa) + L(Oa)):
            Ooa = Op( "Delete", P(Ob) - P (Oa), P(Oa) )
        else:
            Ooa = Op( "Delete", L(Oa) - L(Ob), P(Oa) )
            
        Save_LI(Ooa, Oa, Ob) # this is in the first 'else' # this is a guess
            
    return Ooa



#@-node:IT
#@+node:ET
def ET(Oa, Ob):
    """
    Exclusion Transform.
    Transform Oa against its causally preceding operation Ob to produce Ooa in such a way that Ob's impact on Oa is excluded.
    Also define the timestamp of the virtual operation.
    """
    
    if Check_RA(Oa):
        Ooa = Oa
    elif T(Oa) == "Insert" and T(Ob) == "Insert":
        Ooa = ET_II(Oa, Ob)
    elif T(Oa) == "Insert" and T(Ob) == "Delete":
        Ooa = ET_ID(Oa, Ob)
    elif T(Oa) == "Delete" and T(Ob) == "Insert":
        Ooa = ET_DI(Oa, Ob)
    else: # if T(Oa) == "Delete" and T(Ob) == "Delete":
        Ooa = ET_DD(Oa, Ob)
        
    
    Ooa["source_site"] = Oa["source_site"]
    Ooa["timestamp"]   = list(Oa["timestamp"]) # copy
    
    if dbg>=2:		
        print "ET(\n\t%s, \n\t%s\n)\t\t=> %s;"%(Oa, Ob,Ooa) # just for debugging
    
    return Ooa

def ET_II(Oa, Ob):

    if P(Oa) <= P(Ob) :
        Ooa = Oa
    elif P(Oa) >= (P(Ob) + L(Ob)):
        Ooa = Op( "Insert",  S(Oa), P(Oa) - L(Ob) )
    else:
        Ooa = Op( "Insert",  S(Oa), P(Oa) - P(Ob) )
        Save_RA(Ooa, Ob)
        
    return Ooa

def ET_ID(Oa, Ob):

    if Check_LI(Oa, Ob):
        Ooa = Recover_LI(Oa)
    elif P(Oa) <= P(Ob):
        Ooa= Oa
    else:
        Ooa= Op( "Insert", S(Oa), P(Oa) + L(Ob) )

    return Ooa
    
    
def ET_DI(Oa, Ob):

    if(P(Oa) + L(Oa)) <= P(Ob):
        Ooa = Oa
    elif P(Oa) >= (P(Ob) + L(Ob)):
        Ooa = Op( "Delete", L(Oa), P(Oa) - L(Ob) )
    else:
        if P(Ob) <= P(Oa) and (P(Oa) + L(Oa))  <= (P(Ob) + L(Ob)):
            Ooa = Op( "Delete", L(Oa), P(Oa) - P(Ob) )
        elif P(Ob) <= P(Oa) and ((P(Oa) + L(Oa)) > (P(Ob) + L(Ob))):
            Ooa = Splitted ( Op( "Delete",  P(Ob) + L(Ob) - P(Oa)         ,(P(Oa) - P(Ob)) ),
                                         Op( "Delete", (P(Oa) + L(Oa))-(P(Ob) + L(Ob)), P(Ob)          ) )
        elif P(Oa) < P(Ob) and ((P(Ob) + L(Ob)) <= (P(Oa) + L(Oa))):
            Ooa = Splitted( Op( "Delete", L(Ob)        , 0     ), 
                            Op( "Delete", L(Oa) - L(Ob), P(Oa) ) )
        else:
            Ooa = Splitted( Op( "Delete", P(Oa) + L(Oa) - P(Ob), 0     ), 
                            Op( "Delete", P(Ob) - P(Oa)        , P(Oa) ) )
        
        Save_RA(Ooa, Ob) # this is in the first 'else' # this is a guess
            
    return Ooa



def ET_DD(Oa, Ob):

    if Check_LI(Oa, Ob):
        Ooa = Recover_LI(Oa)
    elif P(Ob) >= (P(Oa) + L(Oa)):
        Ooa = Oa
    elif P(Oa) >= P(Ob) :
        Ooa = Op( "Delete", L(Oa), P(Oa) + L(Ob))
    else :
        Ooa = Splitted( Op( "Delete", P(Ob) - P(Oa)         , P(Oa)         ),
                        Op( "Delete", L(Oa) -(P(Ob) - P(Oa)), P(Ob) + L(Ob) ) )
    return Ooa

#@-node:ET
#@+node:Operation
class Operation(dict):
    """
    simple object that encapsulate the information and methods related to the operations.
    it is a dictionary with extra methods.
    """
    
    def __init__(self, _type=None, pos=None, data=None, timestamp=None, source_site=None, **kws):
        
        d = self
        
        d["type"] = str(_type)
        d["pos"]  = pos
        assert type(data) in [unicode, int], "Data has to be unicode or integer."
        d["data"] = data # text or len
            
        d["timestamp"]   = timestamp
        d["source_site"] = source_site
        
        for k in kws.keys():
            d[k] = kws[k]
                    
        return

    def __eq__(self, other): 
        """
        The papers do not explain how to manage the TimeStamp of the operations during transforms and do not explain which operations are considered to be equivalents.
        Studying in detail the sequence of transformations that the example generate:
            LIT(ET(O4, ET(EO2, EO1)), [EO1, EO2])
        I deduce that the first approach of using Operations class instances is wrong. Doing that Transformation mutate the operators passed is wrong too.
        If during transform the timestamp are preserved then timestamp and source_site are the unique identifiers of a operation. Then IT(EO, EOx) == ET(EO, EOx) == EO; this is not intuitive but it works.
        ----
        x==y calls x.__eq__(y)
        """
        
        assert isinstance(other, Operation), "Only operations instances can be compared (was comparing %s with %s)"%(self, other)
        
        return (self["source_site"] == other["source_site"]) and (self["timestamp"] == other["timestamp"])

    def __repr__(self):
        """
        """
        return "%s"%(str(self))
        
    def __str__(self):
        """
        """
        
        t_keys = filter(lambda x: x not in ["type", "pos", "data", "source_site", "timestamp"], self.keys())
        
        t_string = ""
        
        if self.has_key("source_site") and self.get("timestamp") :
            t_string += "from S%s%s "%(self["source_site"], self["timestamp"])
            
        if type(self["data"]) is unicode:
            t_data = "'%s'"%(self["data"].encode("utf-8", "replace")) # utf-8 ? are you crazy hardcoding this ?
        else:
            t_data = self["data"]
            
        t_string += "%s@%s:%s"%(self["type"], self["pos"], t_data)
         
        for k in t_keys:
            t_data = self[k]
            if type(t_data) is unicode:
                t_data = t_data.encode("utf-8", "replace") # utf-8 ? are you crazy hardcoding this ?
            t_string += ", %s:'%s'"%(k, t_data)
            
        return "{%s}"% t_string
        
    def set_timestamp(self, t_SV):
        """
        Save a state vector as the timestamp.
        """
        
        self["timestamp"] = t_SV
        return
        
    def get_timestamp(self):
        """
        return the state vector used as the timestamp.
        """
        return self.get("timestamp")
    
        
# end of class Operation

#@+at
# Dummy function to shortcut the code.
#@-at
#@@c

def Op(type, data, pos): # this one has a diferent parameters order
    """
    Return an instance of the Operation Object.
    """
    return Operation(type, pos, data)
    
def op(type, pos, data):
    """
    Return an instance of the Operation Object.
    """
    return Operation(type, pos, data)


#@+at
# Simple function used in the algorithm (enhance readability and paper 
# notation matching)
#@-at
#@@c

def T(O):
    """
    Return the type of operation ("Insert" or "Delete")
    """
    return O["type"]
        
    
def P(O):
    """
    Return the position where the operation is executed.
    """
    return O["pos"]


def L(O):
    """
    Return length of the deletion operation.
    For safness if the operation is no a deletion it return the length of the inserted text. (stricly it should raise an error...)
    """
    
    data = O["data"] # speed-up
    assert data != None, "Operation has no data! (%s in %s)"%(data, O)
    
    if type(data) is int:
        return data
    else:
        return len(data)


def S(O):
    """
    Return the string that the insert operation is trying to insert.
    """
    
    assert type(O["data"]) is unicode, "S(O) is only valid for Insertion operation."
        
    return O["data"]
    
#@-node:Operation
#@+node:Splitted

def Splitted(O1, O2):
    """
    Return an operation that is splitted. (this should considered in function 'execute' and 'undo')
    """
    
    assert T(O1) == T(O2), "Splitted operations are of different types, this is not sane."
    assert not (O1.get("is_splitted") or O1.get("is_splitted") ), "Recursive splitted operation not yet supported" 
        
    Oo = Operation(T(O1))
    Oo["is_splitted"] = 1
    Oo["splitted_head"] = O1
    Oo["splitted_tail"] = O2
    
    
    if P(O1) < P(O2):
        Oo["pos"] =  P(O1)
        Oo["data"] =  ( P(O2) + L(O2) ) - P(O1)
    elif P(O1) > P(O2):
        Oo["pos"] = P(O2)
        Oo["data"] = ( P(O1) + L(O1) ) - P(O2)
    else:
        raise "Weird split P(O1) == P(O2) (%s,%s)"%(O1, O2)
        
    return Oo



#@-node:Splitted
#@+node:Lost Information
#@+at
# LI refers to "Lost Information".
#@-at
#@@c
        
    
def Check_LI(Oa, Ob):
    """
    Ob was involved in a information lossing operation that afected Oa ?
    """
    
    return 	Oa.get("LI_base_op") == Ob
    
    
def Save_LI(Oaa, Oa, Ob):
    """
    Store in Oaa the information related to the paremeters of Oa and the reference to Ob.
    
    One operation can only store one and only one information lose.
    """
    
    copy_Oa = op(Oa["type"], Oa["pos"], Oa["data"] )
    
    Oaa["lost_information"]     = copy_Oa
    Oaa["LI_base_op"]      = Ob
    
    return


def Recover_LI(Oa):
    """
    >>>>>>>>>>>>>>>>>DID NOT FOUND SPECIFICATION (this could cause horrible errors)<<<<<<<<<<<<<<<<<<
    """
    
    return 	Oa["lost_information"]
#@-node:Lost Information
#@+node:Relative Address
    
def Check_RA(Oa):
    """
    Is Oa relatively addressed ?
    """
    
    return Oa.has_key("relatively_addressed") and Oa["relatively_addressed"]
    
    
def Save_RA(Oa, Ob):
    """
    Stores the information to mark Oa as having a relative address to over Ob.
    """
    
    #print "called Save_RA(%s, %s)"%(Oa, Ob) # just for debugging
    
    Oa["relatively_addressed"] = 1
    Oa["base_operation"] = Ob
    Oa["delta_pos"] = P(Oa) - P(Ob) # Abis = P(Obbis) + A.delta_pos
    
    return
    
def Check_BO(Oa, Ob):
    """
    Ob is the base operation of Oa ? (in the relative address context)
    """
    
    #Ox = Oa.get("base_operation")
    #return (Ox["source_site"] == Ob["source_site"]) and (Ox["timestamp"] == Ob["timestamp"])
    
    return Ob == Oa.get("base_operation") # look at the definition of __eq__ in the Operation class
    

def Convert_AA(Oa, Ob):
    """
    Obtain Oaa, which is an absolute address operation based on Oa, over the relative position of Ob.
    """
    
    assert Check_BO(Oa,Ob), "Convert_AA: Ob is not the base_operation of Oa"
    
    #print "called Convert_AA(%s, %s)"%(Oa, Ob) # just for debugging
    
    Oaa = op( Oa["type"],	Oa["delta_pos"] + Ob["pos"], Oa["data"] )
    
    return Oaa

#@-node:Relative Address
#@+node:centralized network
#@+at
# I had a first attemp to create a virtual Server-Client only comunication 
# between different clients. But this approach seems to have failed.
# So now I'm going to implement a less optimal system, but hundred of times 
# easier.
# The idea is very easy.
# The clients then the operations to the client and the server send them to 
# all the other clients.
# The server is an Observer, applying locally the operations but never 
# generating one.
# 
# With this approach the client addition process is slower and a little more 
# complicated. Also the operations packet grow a little as there are more 
# clients connected to a node.
# The advantage is that this systems still reducing the bandwith usage of each 
# client and it do not add any special logic to the base case.
#@-at
#@@c
#@-node:centralized network
#@+node:ConcurrentEditableServer
class ConcurrentEditableServer(ConcurrentEditable):
    """
    Simple Observer and operations repeater.
    It manage all the conection/disconnection syncronization problems.
    """
    
    def __init__(self, text=u""):
        """
        """
        
        assert type(text) is unicode, "Internal text data is managed as unicode data. Tried to initialize the ConcurrentEditableServer node with data %s '%s'" % (type(text), text)
        
        # init the internal ConcurrentEditable
        ConcurrentEditable.__init__(self, None, 0) # (self, site_index, num_of_sites)
        
        self.connected_sites = {} # the mapping between the connected sites and they site_index
        self.indexed_sites   = {} # the reverse map of connected_sites
        
        self.text_buffer = text
        self.base_text   = text
        self.base_state_vector = list(self.state_vector) # a copy # base_state_vector is the state associated to the base_text
        return
        
        
    def generate_operation(self, type, pos, data, **kws):
        """
        Explicit censure.
        """
        raise "The server is an observer it should never generate an operation.0"
        return
    
    
    #@    @+others
    #@+node:add/del clients
    def add_client(self, client_perspective):
        """
        Register the client to the clients list. 
        Assign a client index. 
        Expand the history buffer timestamps and the SVT timestamps (this mean; all the stored timestamps). Take care to expand the timestamps of the operation embedded into other ones (RA, LI, etc...).
        Return the tuple (site_index, len(self.state_vector), self.base_state_vector, self.base_text, ops_list)
        """
    
        if dbg>=1:
            print "Adding client to server."
            print "Server HB %s"%self.HB
    
                
        # register the client
        if client_perspective in 	self.connected_sites.keys():
            raise "Client already connected, addition rejected."
            return
        
        # assign a site index
        site_index = None
        for i in range(len(self.state_vector)):
            if self.indexed_sites[i] == None:
                site_index = i
                break
            
        if site_index == None: # could not found an aviable slot
            site_index = len(self.state_vector) # a new entry at the end of the list
            
        # register the site
        self.connected_sites[client_perspective] = site_index 
        self.indexed_sites[site_index] = client_perspective
        
    
        if site_index == len(self.state_vector): # expand the references only if required.
        
            # expand the vectors and matrices
            extra = [0]
            self.state_vector.extend(extra)
            
            for t_vector in self.state_vector_table:
                if t_vector != self.state_vector:
                    t_vector.extend(extra)
                
            self.state_vector_table.append([0]*len(self.state_vector))
            self.minimum_state_vector.extend(extra)
            self.base_state_vector.extend(extra)
        
            #print "self.state_vector %s self.state_vector_table %s self.minimum_state_vector %s"%(self.state_vector, self.state_vector_table, self.minimum_state_vector) # just for debugging
            #print "Server HB %s" % self.HB # just for debugging
            
            assert len(self.state_vector) == len(self.state_vector_table) == len(self.minimum_state_vector)
        
            # expand the operations timestamp in the HB and in the delayed_operations stack
            for t_op in (self.HB + self.delayed_operations):
                t_op["timestamp"].extend(extra)
                
                if t_op.get("base_operation"): # RA: relative address
                    t_op["base_operation"]["timestamp"].extend(extra)
                    
                if t_op.get("splitted_head") and t_op.get("splitted_tail") : # Splitted
                    t_op["splitted_head"]["timestamp"].extend(extra)			
                    t_op["splitted_tail"]["timestamp"].extend(extra)			
                    
                if t_op.get("lost_information"): # LI: lost information
                    t_op["lost_information"].get("timestamp", []).extend(extra)
                    t_op["LI_base_op" ].get("timestamp", []).extend(extra)
            
        # end of references expantions -----------
        
        # compute an updated base_text
        self.compute_base_text()
        # self.base_state_vector stores the state vector that corresponds to base_text
        
        # send all the necesarry data
        ops_list = []
        for t_Op in self.HB: # send the operations in the HB
            ops_list.append(dict(Operation(**t_Op)))  # copy, pass a a dict 
            
        if dbg>=1:
            print	 "ops_list", ops_list
            print "Now we have %s clients connected."%(len(self.connected_sites))
            print "Server HB %s"%self.HB
            print
                
        return (site_index, len(self.state_vector), self.base_state_vector, self.base_text, ops_list)
    
    
            
    def del_client(self, client_perspective):
        """
        The inverse of add_client.
        """
        
        if not self.connected_sites.has_key(client_perspective):
            return # if not connected, nothing to disconnect
        
        # delete the client
        i = self.connected_sites[client_perspective]
        
        self.indexed_sites[i] = None # mark for future reuses
        del self.connected_sites[client_perspective]
                        
        if len(self.indexed_sites) == 0: # there are no more clients connected
            # clean up the node
            self.HB = []
            self.base_text = self.get_text()
            #>>>>>>>ADD CODE HERE (what is missing?)<<<<<<<<<<<<<
            
        return
    
    
    
    def get_clients(self):
        """
        Return the list of perpspectives of the actual clients collaborating in the node.
        """
        
        return self.connected_sites.keys()
    #@nonl
    #@-node:add/del clients
    #@+node:receive operation
    
    def receive_operation(self, in_op, *args, **kw):
        """
        adapt the state_vectors lenghts
        """
    
        timestamp = (isinstance(in_op, Operation) and in_op.get("timestamp") ) or kw.get("timestamp")
        
        # if the client is unaware of the new client, it is because if has not received a message from it
        timestamp = timestamp + [0]*(len(self.state_vector) - len(timestamp)) # extend with zeros
        
        if dbg >= 2:
            print
            print "S%s receiving op %s"%( self.site_index, [in_op, args, kw])
            print "Extending the received op: ", len(self.state_vector) - len(timestamp), "(self.state_vector, timestamp)", (self.state_vector, timestamp) # <<<<<<<<<<<<<<<<<<<<<<< COMMENT THIS LINE
            print  "Server HB", self.HB # <<<<<<<<<<<<<<<<<<<<<<< COMMENT THIS LINE
            print
    
        
        if isinstance(in_op, Operation):
            in_op["timestamp"] = timestamp
        else:
            kw["timestamp"] = timestamp
    
    
        ConcurrentEditable.receive_operation(self, in_op, *args, **kw) # receive the operation
                
        return
    
    receive_op = receive_operation # alias
    #@-node:receive operation
    #@+node:apply
    def apply(self, Onew):
        """
        Send to all the other users and Apply locally .
        """
        
        # first send to other users to enhance responsiveness
        for t_index in range(len(self.state_vector)):
            if t_index == Onew["source_site"]: continue # do not send back to the emisor	
            self.send_operation(t_index, Onew) # send it
    
        
        ConcurrentEditable.apply(self, Onew) # apply localy
        
        return 
    
    
    
    #@-node:apply
    #@+node:collect_garbage
    def collect_garbage(self):
        """
        Calls the parent method but we store the base_state_vector.
        """
        
        base_EO = ConcurrentEditable.collect_garbage(self)
        self.base_state_vector = base_EO["timestamp"]
        
        return
    
    
    #@-node:collect_garbage
    #@+node:base text
    def compute_base_text(self):
        """
        The base text is the text underlying the operations in the history buffer. Could be created from the operation cleaned by the garbage collector or is text that persisted from other sessions.
        """
        for t_op in reverse(self.HB):
            self.undo(t_op)
        
        self.base_text = self.get_text() # base text is the text created by the erased operations (erased by the garbage collector or when the node was alone)
        
        for t_op in self.HB:
            self.redo(t_op)
            
        return
    #@nonl
    #@-node:base text
    #@+node:network methods
    #@+at
    # This method have to be overwritten for network transfers support.
    #@-at
    #@@c
    #@-node:network methods
    #@+node:send operation
    
    def send_operation(self, site_index, t_op):
        """
        This function is called by apply.
        This method should be overwritten for real network transmision. 
        Test implementation is presented here.
        I repeat, This method should be overwritten to send the object over the network.
        """
        
        if 1:
            if dbg>=1: print "send_op; sending to S%s %s"%(site_index, t_op)
            global sent_test_operations
            sent_test_operations.append(t_op)
            
        return
    #@-node:send operation
    #@+node:send text
    def send_text(self, site_index, new_text):
        """
        This method should be overwritten for a networked implementation.
        Here only code for testing.
        I repeat, This method should be overwritten to send the object over the network.
        """
        
        if 1:
            if dbg>=1: print "send_text; setting S%s base text as '%s'"%(site_index, new_text)
            # dummy no delay implementation, obviously should be overwritten for real network transmisions.
            self.indexed_sites[site_index].set_text(new_text) 
        
        return
    #@nonl
    #@-node:send text
    #@-others
    
#@-node:ConcurrentEditableServer
#@+node:ConcurrentEditableClient
class ConcurrentEditableClient(ConcurrentEditable):
    """
    Just a normal ConcurrentEditable but with a special garbage collector, because the Server can send operations from the past (normal client are suposed to do not do that). So the Client garbage collector is triggered by the Server.
    """
    
    def __init__(self, server_perspective=None):
        """
        """
        
        self.connected = 0 # status variable to indicate when the connection is ready (used in real world subclasses)
        
        if server_perspective:
            self.connect_to_server(server_perspective)
            
        return
        
    #@    @+others
    #@+node:network methods
    #@+at
    # This method have to be overwritten for network transfers support.
    #@-at
    #@@c
    #@-node:network methods
    #@+node:connect to server
    def connect_to_server(self, server_reference):
        """
        Connect to the server.
        Dummy implementation for testing purpose. This method should be overwritten to manage network methods.
        """
        
        site_index, num_of_sites, base_state_vector, base_text, ops_list = server_reference.add_client(self)
        
        # init the internal ConcurrentEditable		
        ConcurrentEditable.__init__(self, site_index, num_of_sites) # site_index, num_of_sites # the clients has site_index 1, thus state_vector == [server, client]
            
        self.set_text(base_text)
        
        self.state_vector = list(base_state_vector) # copy the data # <<<<<<<<<<< is this a correct idea ?
        
        for t_dict in ops_list: #ops_list is a list of dictionaries that define a list of operations
            self.receive_operation(Operation(**t_dict))	# instanciate and receive
        
        self.connected = 1
        return
    #@-node:connect to server
    #@+node:add/del clients
    def add_a_client(self):
        """
        Add one client more
        """
        self.set_num_of_clients(len(self.state_vector)+1)
        return
    
    
    def set_num_of_clients(self, num_of_clients):
        """
        Adapt the local vector to the num of clients
        
        Expand the history buffer timestamps and the SVT timestamps (this mean; all the stored timestamps). Take care to expand the timestamps of the operation embedded into other ones (RA, LI, etc...).
        """
    
        assert (num_of_clients - len(self.state_vector)) >= 0
        
        extra = [0]*(num_of_clients - len(self.state_vector))
        
        if not extra: # nothing to add
            return 
            
        # expand the vectors and matrices
        self.state_vector.extend(extra)
        
        for t_vector in self.state_vector_table:
            if t_vector != self.state_vector:
                t_vector.extend(extra)
            
        self.state_vector_table.append([0]*len(self.state_vector))
        self.minimum_state_vector.extend(extra)
    
        #print "self.state_vector %s self.state_vector_table %s self.minimum_state_vector %s"%(self.state_vector, self.state_vector_table, self.minimum_state_vector) # just for debugging
        #print "Server HB %s" % self.HB # just for debugging
        
        assert len(self.state_vector) == len(self.state_vector_table) == len(self.minimum_state_vector)
    
        # expand the operations timestamp in the HB and in the delayed_operations stack
        for t_op in (self.HB + self.delayed_operations):
            t_op["timestamp"].extend(extra)
            
            if t_op.get("base_operation"): # RA: relative address
                t_op["base_operation"]["timestamp"].extend(extra)
                
            if t_op.get("splitted_head") and t_op.get("splitted_tail") : # Splitted
                t_op["splitted_head"]["timestamp"].extend(extra)			
                t_op["splitted_tail"]["timestamp"].extend(extra)			
                
            if t_op.get("lost_information"): # LI: lost information
                t_op["lost_information"].get("timestamp", []).extend(extra)
                t_op["LI_base_op" ].get("timestamp", []).extend(extra)
        
    
        if dbg>=1:
            print "S%s; len(self.state_vector) == %s"%(self.site_index, len(self.state_vector))
        return
        
    
            
    def del_client(self, client_index):
        """
        Eliminate the reference in the state_vectors of one specific client that has disconnected.
        """
        
        i = client_index
        
        # update the site_index mapping ----
            
        # shrink the vectors and matrices
        shrink = lambda x: hasattr(x, "__delslice__") and x.__delslice__(i, i+1) # delete the 'i'th item
        
        shrink(self.state_vector)
        
        for t_vector in self.state_vector_table:
            shrink(t_vector)
            
        shrink(self.state_vector_table)
        shrink(self.minimum_state_vector)
    
        # shrink the operations timestamp in the HB
        for t_op in self.HB:
            shrink(t_op["timestamp"])
            
            if t_op.get("base_operation"): # RA: relative address
                shrink(t_op["base_operation"]["timestamp"])
                
            if t_op.get("splitted_head") and t_op.get("splitted_tail"): # Splitted
                shrink(t_op["splitted_head"]["timestamp"])			
                shrink(t_op["splitted_tail"]["timestamp"])			
                
            if t_op.get("lost_information"): # LI: lost information
                try:
                    shrink(t_op["lost_information"].get("timestamp"))
                except:
                    pass
                try:
                    shrink(t_op["LI_base_op" ].get("timestamp"))
                except:
                    pass
                    
        
        return
            
    
    
    
    #@-node:add/del clients
    #@+node:receive operation
    def receive_operation(self, in_op, *args, **kw):
        """
        check if the operation timestamp correspond to the local num_of_sites
        """
    
        timestamp = (isinstance(in_op, Operation) and in_op.get("timestamp") ) or kw.get("timestamp")
        
        if dbg >= 2:
            print
            print "S%s receiving op %s"%( self.site_index, [in_op, args, kw])
            print "Extending the received op: ", len(self.state_vector) - len(timestamp), "(self.state_vector, timestamp)", (self.state_vector, timestamp) # <<<<<<<<<<<<<<<<<<<<<<< COMMENT THIS LINE
            print "Client HB", self.HB # <<<<<<<<<<<<<<<<<<<<<<< COMMENT THIS LINE
            print "Client delayed_operations", self.delayed_operations
            print
        
        
        if len(timestamp) > len(self.state_vector):
            self.set_num_of_clients(len(timestamp)) # adapt the length of the state vectors
        elif len(timestamp) < len(self.state_vector):
            timestamp = (isinstance(in_op, Operation) and in_op.get("timestamp") ) or kw.get("timestamp")
    
            # if the client is unaware of the new client, it is because if has not received a message from it
            timestamp = timestamp + [0]*(len(self.state_vector) - len(timestamp)) # extend with zeros
    
            if isinstance(in_op, Operation):
                in_op["timestamp"] = timestamp
            else:
                kw["timestamp"] = timestamp
                
        # end of elif --------------
    
        for t_op in self.HB:
            if t_op["timestamp"] == timestamp:
                print "<strange> Strange network conditions have created a twin message reception. Will be omited. (twin: %s, recieved: %s)"%(t_op, str((in_op, args, kw)))
                return
    
        ConcurrentEditable.receive_operation(self, in_op, *args, **kw) # receive the operation
                
        return
    
    receive_op = receive_operation # alias
        
    
    #@-node:receive operation
    #@+node:generate operations
    def generate_operation(self, type, pos, data, **kws):
        """
        The site generate an operation, and apply it locally.
        """
        
        # create and apply
        t_op = ConcurrentEditable.generate_operation(self, type, pos, data, **kws)
    
        # overwrite source_site to give a reference (instead of a dummy number)
        ret_op = Operation(**t_op) # copy the operation
        
        return ret_op
    #@nonl
    #@-node:generate operations
    #@+node:set text
    def set_text(self, new_text):
        """
        Blindly overwrite the text of this site.
        """
        
        self.text_buffer = new_text
        
        return
    #@nonl
    #@-node:set text
    #@-others
#@-node:ConcurrentEditableClient
#@+node:Tests
#@+at
# The unit tests for concurrent editions.
#@-at
#@@c


def get_test_suite():
    """
    run the tests
    """
    
    global dbg
    dbg = 0
    
    if 0: # hand made unittest 
        print "Starting tests"
        TestConcurrentEditable1()
        print "-"	* 30
        TestConcurrentEditable2()
        print "-"	* 30	
        TestConcurrentEditableServer()
        print "end of tests"
        return

    TestSuite = unittest.TestSuite()
    TestSuite.addTest(unittest.FunctionTestCase(TestConcurrentEditable1))
    TestSuite.addTest(unittest.FunctionTestCase(TestConcurrentEditable2))
    TestSuite.addTest(unittest.FunctionTestCase(TestConcurrentEditableServer))
        
    return TestSuite
#@nonl
#@-node:Tests
#@+node:TestConcurrentEditable1

def TestConcurrentEditable1():
    """
    The test case that we gonna use for debugging is the same case presented at "A generic operation transformation scheme for consistency maintenance in real-time cooperative editing systems", Fig 1; wich suggest an interesing scenario.
    Here the operatations are:
        - O1 Insert 0 "ABC"
        - O2 Insert O "BCD"
        - O3 Delete 1 2
        - O4 Insert 2 "c"
    So the final result should be "ABCcD" in the three sites.
    
    Site 0: (generate O1) O1 O2 O4 O3
    Site 1: (gen O2) O2 O1 (gen O3) O3 O4
    Site 2: O2 (gen 04) 03 01
    
    The event sequence is:
        S0(O1);S1(O2);S2O2;S1O1;S0O2;S2(O4);S0O4;S1(03);S2O3;S0O3;S1O4;S2O1. 
        
    It also test the garbage collector as indicated in the figure 3 of sun98achieving.pdf, page 20.
    """
    
    print "-"*15
    print "Read docstring of TestConcurrentEditable1 for more info about this test.\n"
    
    # Create three site instances
    num_sites = 3
    site0 = ConcurrentEditable(0, num_sites) # site_index, num_of_sites
    site1 = ConcurrentEditable(1, num_sites)
    site2 = ConcurrentEditable(2, num_sites)
    
    # Apply the operations in each site (following the order of the picture)
    
    O1 = site0.gen_op("Insert", 0, u"ABC", dbg_name="O1")  # generate and apply locally the operation
    O2 = site1.gen_Op("Insert", u"BCD", 0, dbg_name="O2") # test the alias
    site2.receive_op(O2)
    site1.receive_op(O1)
    site0.receive_op(O2)
    O4 = site2.gen_op("Insert", 2, u"c", dbg_name="O4") 
    site0.receive_op(O4)			
    #print "\ntest blocked..."; return # please erase this line
    O3 = site1.gen_op("Delete", 1, 2, dbg_name="O3")
    site2.receive_op(O3)
    site0.receive_op(O3)
    site1.receive_op(O4)			
    site2.receive_op(O1)
    
    
    if dbg>=4:
        for t_op in [ O1, O2, O3, O4]:
            print t_op
            
    if 1:
        # this messages are the same of figure 3. sun98achieving.pdf, page 20.
        site1.update_SVT(0, site0.state_vector) # message to put to date the other sites
        site2.update_SVT(0, site0.state_vector)

        site0.collect_garbage()
        site1.collect_garbage()
        site2.collect_garbage()
    

    
    if dbg>=1:
        print "\nFinal HBs"
        for t_site in [site0, site1, site2]:
            print "Site %s;%s;HB %s"%(t_site.site_index, t_site.state_vector, t_site.HB)
    
    # Show the final result at each site (expecting "ABCC'D")

    res_text = lambda x: "OK."*x or "FAILED."*(not x)

    print "\nFinal results:"	
    
    success = 1
    for t_site in [site0, site1, site2]:
        t_res = (t_site.get_text() == u"ABCcD" and not t_site.delayed_operations)
        success = success and t_res
        print "Site %s;%s; '%s'; delayed_ops: %s; %s"%(t_site.site_index, t_site.state_vector, t_site.get_text(), t_site.delayed_operations, res_text(t_res))


    if success:
        print "\nTest successfull."
    else:
        print "\nTest FAILED. Expecting the same result at the three sites: 'ABCcD', and no delayed operations left in the buffer."


    return success
#@-node:TestConcurrentEditable1
#@+node:TestConcurrentEditable2

def TestConcurrentEditable2():
    """
    Second test is similar to Test1 but with other operations. Try to test other code areas (i.e. Lost Information cases)
    
    The test case that we gonna use for debugging is the same case presented at "A generic operation transformation scheme for consistency maintenance in real-time cooperative editing systems", Fig 1; wich suggest an interesing scenario.
    Here the operatations are:
        - O1 Insert 0 "ABC"
        - O2 Insert O "BCD"
        - O3 Insert 5 "c"
        - O4 Delete 0 3
    So the final result should be ABCc in the three sites.
    
    Site 0: (generate O1) O1 O2 O4 O3
    Site 1: (gen O2) O2 O1 (gen O3) O3 O4
    Site 2: O2 (gen 04) 03 01
    
    The event sequence is:
        S0(O1);S1(O2);S2O2;S1O1;S0O2;S2(O4);S0O4;S1(03);S2O3;S0O3;S1O4;S2O1. 
        
    It also test the garbage collector as indicated in the figure 3 of sun98achieving.pdf, page 20.
    """
    
    print "-"*15
    print "Read docstring of TestConcurrentEditable2 for more info about this test.\n"
    
    # Create three site instances
    num_sites = 3
    site0 = ConcurrentEditable(0, num_sites) # site_index, num_of_sites
    site1 = ConcurrentEditable(1, num_sites)
    site2 = ConcurrentEditable(2, num_sites)
    
    # Apply the operations in each site (following the order of the picture)
    
    O1 = site0.gen_op("Insert", 0, u"ABC", dbg_name="O1")  # generate and apply locally the operation
    O2 = site1.gen_Op("Insert", u"BCD", 0, dbg_name="O2") # test alias
    site2.receive_op(O2)
    site1.receive_op(O1)
    site0.receive_op(O2)
    O4 = site2.gen_op("Delete", 0, 3, dbg_name="O3")
    site0.receive_op(O4)			
    #print "\ntest blocked..."; return # please erase this line
    O3 = site1.gen_op("Insert", 5, u"c", dbg_name="O4")
    site2.receive_op(O3)
    site0.receive_op(O3)
    site1.receive_op(O4)			
    site2.receive_op(O1)
    
    if 1:
        # this messages are the same of figure 3. sun98achieving.pdf, page 20.
        site1.update_SVT(0, site0.state_vector) # message to put to date the other sites
        site2.update_SVT(0, site0.state_vector)

        site0.collect_garbage()
        site1.collect_garbage()
        site2.collect_garbage()
    
    if dbg>=4:
        for t_op in [ O1, O2, O3, O4]:
            print t_op
    
    if dbg>=1:
        print "\nFinal HBs"
        for t_site in [site0, site1, site2]:
            print "Site %s;%s;HB %s"%(t_site.site_index, t_site.state_vector, t_site.HB)
    
    # Show the final result at each site (expecting "ABCC'D")

    res_text = lambda x: "OK."*x or "FAILED."*(not x)

    print "\nFinal results:"	
    
    success = 1
    for t_site in [site0, site1, site2]:
        t_res = (t_site.get_text() == u"ABCc" and not t_site.delayed_operations)
        success = success and t_res
        print "Site %s;%s; '%s'; delayed_ops: %s; %s"%(t_site.site_index, t_site.state_vector, t_site.get_text(), t_site.delayed_operations, res_text(t_res))


    if success:
        print "\nTest successfull."
    else:
        print "\nTest FAILED. Expecting the same result at the three sites: 'ABCc', and no delayed operations left in the buffer."


    return success
#@-node:TestConcurrentEditable2
#@+node:TestConcurrentEditableServer

def TestConcurrentEditableServer():
    """
    Run almost exactly the same case of TestConcurrentEditable1 but using a Star network; with one central server and three clients connecting to it.
    """
    
    global dbg
    dbg = 0 #1 # ;P
    
    # when dbg==1 this is a __very__ verbose test, but it allow a good tracking of every event.
    
    print "-"*15
    print "Read docstring of TestConcurrentEditableServer for more info about this test.\n"
    
    # creates server
    server = ConcurrentEditableServer()
    
    # connect site 0 and 1
    site0 = ConcurrentEditableClient(server)
    site1 = ConcurrentEditableClient(server)
    
    global sent_test_operations; 	sent_test_operations = [] # used for delaying the transmissions in the test
    
    # start editions
    # Apply the operations in each site (following the order of the picture)
    O1 = site0.gen_op("Insert", 0, u"ABC", dbg_name="O1", gen_site="0") # generate and apply locally the operation
    O2 = site1.gen_Op("Insert", u"BCD", 0, dbg_name="O2", gen_site="1") # test the alias

    # O*_toS* is an operation that was sent by the server to the client. This object is delayed to simulate delays in the transmissions lines.
    # the order of reception of commands is similar of the TestConcurrentEditable1
    server.receive_op(O2); 
    if dbg>=1: print "sent_test_operations %s\n"%sent_test_operations
    [O2_toS0] = sent_test_operations; sent_test_operations = []	
    server.receive_operation(O1);
    if dbg>=1: print "sent_test_operations %s\n"%sent_test_operations
    [O1_toS1] = sent_test_operations; sent_test_operations = []	
    
    # connect site 2 (to test connection during sessions)
    site2 = ConcurrentEditableClient()	
    site2.connect_to_server(server)
    
    if dbg>=1:
        print
        print "Server; %s; '%s'; HB %s"%(server.state_vector, server.get_text(), server.HB )
        print "Site 0; %s; '%s'; HB %s"%( site0.state_vector,  site0.get_text(),  site0.HB )
        print "Site 1; %s; '%s'; HB %s"%( site1.state_vector,  site1.get_text(),  site1.HB )
        print "Site 2; %s; '%s'; HB %s"%( site2.state_vector,  site2.get_text(),  site2.HB )
        print
    
    sent_test_operations = []
    
    # continue editions
    site1.receive_op(O1_toS1) # receive delayed operations sent by the server
    site0.receive_op(O2_toS0)
    O4 = site2.gen_op("Insert", 2, u"c", dbg_name="O4", gen_site="2") 
    server.receive_op(O4); O4_toS0, O4_toS1 = sent_test_operations; 
    if dbg>=1: print "sent_test_operations %s\n"%sent_test_operations
    sent_test_operations = []	

    
    # test disconnection and site_index reusage (for reconnetion connection)
    if dbg>=1: 
        print "\nDisconnectiong S2"
        
    server.del_client(site2)	
    if dbg>=1: print "\nReconnection S2"
    site2 = ConcurrentEditableClient()	
    site2.connect_to_server(server)
    if dbg>=1: 
        print "Site2 after reconnecting"
        print "Site 2; %s; '%s'; HB %s"%( site2.state_vector,  site2.get_text(),  site2.HB )
        print
    
    site0.receive_op(O4_toS0)
    O3 = site1.gen_op("Delete", 1, 2, dbg_name="O3", gen_site="1")
    server.receive_op(O3);	
    if dbg>=1: print "sent_test_operations %s\n"%sent_test_operations
    O3_toS0, O3_toS2 = sent_test_operations; sent_test_operations = []	
    site2.receive_op(O3_toS2)
    site0.receive_op(O3_toS0)
    site1.receive_op(O4_toS1)
    
    # Original sequence------------------
    #O1 = site0.gen_op("Insert", 0, u"ABC", dbg_name="O1")  # generate and apply locally the operation
    #O2 = site1.gen_Op("Insert", u"BCD", 0, dbg_name="O2") # test alias
    #site2.receive_op(O2)
    #site1.receive_op(O1)
    #site0.receive_op(O2)
    #O4 = site2.gen_op("Delete", 0, 3, dbg_name="O3")
    #site0.receive_op(O4)			
    #print "\ntest blocked..."; return # please erase this line
    #O3 = site1.gen_op("Insert", 5, u"c", dbg_name="O4")
    #site2.receive_op(O3)
    #site0.receive_op(O3)
    #site1.receive_op(O4)			
    #site2.receive_op(O1)
    # ------------------

    if dbg>=1:	
        print
        print "Server; %s; '%s'; HB %s"%(server.state_vector, server.get_text(), server.HB )
        print "Site 0; %s; '%s'; HB %s"%( site0.state_vector,  site0.get_text(),  site0.HB )
        print "Site 1; %s; '%s'; HB %s"%( site1.state_vector,  site1.get_text(),  site1.HB )
        print "Site 2; %s; '%s'; HB %s"%( site2.state_vector,  site2.get_text(),  site2.HB )
        print
        
    
    if dbg>=1:
        print "\nDirty HBs"
        for t_site in [server, site0, site1, site2]:
            print "Site %s;%s;HB %s; delayed_ops %s"%(t_site.site_index, t_site.state_vector, t_site.HB, t_site.delayed_operations)
        print
            
    if 1:
        # this messages are the same of figure 3. sun98achieving.pdf, page 20.
        site1.update_SVT(0, site0.state_vector) # message to put to date the other sites
        site2.update_SVT(0, site0.state_vector)
        if dbg>=1: print "Manually collecting the garbage in all sites"
        server.collect_garbage()
        site0.collect_garbage()
        site1.collect_garbage()
        site2.collect_garbage()
    
    # --------	
    # disconnect
    if dbg>=1: print "Disconnecting the three sites."
    server.del_client(site0)	
    server.del_client(site1)	
    server.del_client(site2)	
    # --------------
        
    
    if dbg>=1:
        print "\nFinal HBs"
        for t_site in [server, site0, site1, site2]:
            print "Site %s;%s;HB %s; delayed_ops %s"%(t_site.site_index, t_site.state_vector, t_site.HB, t_site.delayed_operations)
    
    # Show the final result at each site (expecting "ABCC'D")

    res_text = lambda x: "OK."*x or "FAILED."*(not x)

    print "\nFinal results:"	
    
    success = 1
    for t_site in [server, site0, site1, site2]:
        t_res = (t_site.get_text() == u"AcBCD" and not t_site.delayed_operations)
        success = success and t_res
        print "Site %s;%s; '%s'; delayed_ops: %s; %s"%(t_site.site_index, t_site.state_vector, t_site.get_text(), t_site.delayed_operations, res_text(t_res))


    if success:
        print "\nTest successfull."
    else:
        print "\nTest FAILED. Expecting the same result at the three sites: 'AcBCD', and no delayed operations left in the buffer."


    return success

    return 1
#@-node:TestConcurrentEditableServer
#@-others


if __name__ == "__main__":

    unittest.TextTestRunner().run(get_test_suite())

#@-node:@file ConcurrentEditable.py
#@-leo
