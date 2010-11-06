#!/usr/bin/env python2.3
# -*- coding: utf-8 -*-
# -*- test-case-name: LeoNtest -*-
#@+leo-ver=4
#@+node:@file LeoServer.py
#@@first
#@@first
#@@first
#@+at
#     LeoServer the Leo over network server side code.
#@-at
#@@c
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

from twisted.application import service, internet
#from twisted.persisted import sob # used for application object persistance from python scripts, not required here, keep for documentation
from twisted.internet import defer, reactor
from twisted.cred import checkers, portal, credentials, error
from twisted.spread import pb
from twisted.python import failure

import sys, random
#sys.path.append("/usr/local/leo/leo_cvs/leo")
#import leoNodes # could be required in the future

# the collaboration structures, classes and algorithm are developed, contained and tested in another module.
import ConcurrentEditable

dbg = 0 # ;p
simulate_delay_line = 0

#@+others
#@+node:create_application
def create_application(delay_line=0):
    """
    Create a LeoServer
    Used to create the '.tap' file (twisted application file)
    """
    
    if delay_line:
        global simulate_delay_line
        simulate_delay_line = 5 # five seconds max delay
        
    app = service.Application("LeoServer")
    
    #@    << register the PB service >>
    #@+node:<<register the PB service>>
    # -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~
    # Init the LeoService		
    
    the_outline = CollaborativeOutline() # acts also as the LeoRealm, and contain the checker
    r = the_outline
    
    checker = r.checker # should use a better checker
    
    #@<< create the default accounts >>
    #@+node:<< create the default accounts >>
    
    checker.addUser("user1", "pass1")
    the_outline.root_node.permissions["user1"] =  ["Read", "Node_edit", "Tree_edit", "Admin_node"] # can admin only for test issues
    
    #checker.addUser("user2", "pass2")
    # add the permissions # the_outline.root_node.permissions[name] = ['Read', 'Node_edit', 'Tree_edit', 'Admin_node'] 
    
    checker.addUser("admin_user", "admin")
    the_outline.root_node.permissions["admin_user"] = ["Admin_node"]
    
    
    
    
    
    #@-node:<< create the default accounts >>
    #@nl
    
    p = portal.Portal(r)
    p.registerChecker(checker)
    internet.TCPServer(pb.portno, pb.PBServerFactory(p)).setServiceParent(app)
    #@-node:<<register the PB service>>
    #@nl
    #@    << register the Web service >>
    #@+node:<<register the Web service>>
    # -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~
    # Init the LeoWeb service
    
    site = server.Site(LeoServerWeb(the_outline))
    
    internet.TCPServer(pb.portno +1 , site).setServiceParent(app)
    # -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~
    #@-node:<<register the Web service>>
    #@nl
    
    #s    = service.IService(application)
    #sc   = service.IServiceCollection(application)
    #proc = service.IProcess(application)
    #per  = sob.IPersistable(application) # per.save(filename="server.tap") will create a .tap file for daemonizing and persistence

    return app
#@-node:create_application
#@+node:Error classes
class LeoError(pb.Error):
    """
    An Exception ocurred.
    Own error class.
    (also manage some unicode python problems)
    """
    
    def __str__(self,):
        if self.args and (type(self.args[0]) is unicode):
            return self.args[0].encode("utf-8") #return self.args[0].encode("ascii", "replace") 
        elif self.args and ((type(self.args[0]) is str) or isinstance(self.args[0], pb.failure.Failure)):
            return pb.Error.__str__(self) # this is not always safe
        else:
            return str(self.args) 
            
def raiseLeoError(msg, *args, **kws):
    raise LeoError, msg 
    #"%s %s %s" % (msg, args, kws)
    
def raisePathError(path=None, *args, **kws):
    if path:
        raiseLeoError("Could not found the node associated to the path '%s'."%(path), *args, **kws)
    else:
        raiseLeoError("Could not found the node associated to a path (not indicated).", *args, **kws)
    
def raiseMessageError(name='(unknown)'):
    raiseLeoError( "Could not send a message to the user %s"%(name), *args, **kws)
    
class Unauthorized(LeoError):
    pass
#@-node:Error classes
#@+node:class LeoChecker
class LeoChecker:
    """
    An ultra simple Leo checker.
    Implement management methods.
    
    (should be edited in order to be able to persist)
    """
    # look at ./twisted/test/test_newcred.py for hash usage examples
    
    __implements__ = checkers.ICredentialsChecker

    credentialInterfaces = (credentials.IUsernamePassword, credentials.IUsernameHashedPassword)

    def __init__(self, **users):
        self.users = users # users is a dictionary of username->password mapping
        return

    def userExist(self, username):
        return self.users.has_key(username)
        
    def addUser(self, username, password):
        self.users[username] = password
        
    def delUser(self, username):
        del self.users[username]
        
    def setPassword(self, username, password):
        self.users[username] = password

    def _cbPasswordMatch(self, matched, username):
        if matched:
            return username
        else:
            return failure.Failure(error.UnauthorizedLogin("The password of %s did not matched with database." % username))

    def requestAvatarId(self, credential):		
        if credential.username in self.users:
            return defer.maybeDeferred(credential.checkPassword, self.users[credential.username]).addCallback(self._cbPasswordMatch, credential.username)
        else:
            return failure.Failure(error.UnauthorizedLogin("%s is not listed in the authorized users." % credential.username))
#@-node:class LeoChecker
#@+node:class LeoAvatar
class LeoAvatar(pb.Avatar):
    """
    The server side representation of the user.
    There is one avatar instance per client connection to the server
    """
    
    def __init__(self, avatarId, mind, outline=None):
        
        self.Outline = outline # the outline contain a .checker attribute
        self.perspectives = []
        self.mind = mind # store it for later use
        self.avatarId = avatarId
        
        assert mind, LeoError("LeoN strictly require references to the client connecting.")
        
        #pb.Avatar.__init__(self, avatarId, mind) # pb.Avatar has no __init__ method.
        
        return  
    
    def perspective_get_perspective(self, kind, base_node_url):
        """
        """
        perspective = None
        
        if kind == "outline":
            perspective = OutlinePerspective(self.avatarId, base_node_url, self.Outline, self.mind)
           
        elif kind == "admin_outline":
            perspective = AdminOutlinePerspective(self.avatarId, base_node_url, self.Outline, self.mind)
            
        else:
            raiseLeoError("unknown perspective requested")
        
        if perspective:
            self.perspectives.append(perspective) # are there really more than one perspective per avatar ?
        
        return perspective
        
        
    def logout(self,):
        """
        Detach the requested perspectives.
        """
        
        #print "Avatar is login out self.avatarId == %s" % self.avatarId # just for debugging
        
        for t_perspective in self.perspectives:
            t_perspective.logout()
        
        del self.perspectives
            
        return

    
    
    



#@-node:class LeoAvatar
#@+node:class AdminOutlinePerspective
#@+at
# this is the server side representation of the administrator
#@-at
#@@c

class AdminOutlinePerspective(pb.Referenceable):
    """
    This perspective implement the methods required for a remote administration to the Outline.
    Focused on the User accounts and accesses administration.
    One perspective per Administrator connection in the rare case that there is more than One authorizer associated with LeoService.
    
    This perspective manage accounts, acesses and permissions.
    An Authenticater has accounts.
    An account has acesses to certain nodes.
    A node has permissions for certains accounts.
    """
    
    def __init__(self, name, base_node_url, outline, mind):
        #pb.Referenceable.__init__(self) # pb.Referenceable  has no __init__ method
        
        # check the permissions        
        permissions = outline.get_permissions(name, base_node_url)
        assert "Admin_node" in permissions, Unauthorized("Not authorized to admin the node '%s' (local permissions %s)"%( base_node_url, permissions))  
        
        
        self.Outline = outline		# the internal Outline is capitalized because it make reference at the Server instance.
        self.checker = outline.checker
        self.base_path = base_node_url
        self.base_node = self.Outline.get_node(self.base_path)		
              
        self.name   = name
        self.client = mind
        deferred = self.client.callRemote("post_message", 
                                         "LeoServer", 
                                          "%s, you have now access to the Admin Perspective."%(name.capitalize()))
        
        deferred.addErrback(raiseLeoError, "Could not send a message to user %s"%(name))
        
        return

                
    def logout(self,):
        """
        A client is closing his relation with this perspective (i.e. this outline).
        """
        
        print "Admnistrator %s at %s is login out" % (self.name, self.base_path)
        
        return
        
    def absolute_path(self, relative_node_path): 
        """
        transform a relative path to a valid server url
        """
        return self.base_path + '/' + relative_node_path[1:]	

    #@    @+others
    #@+node:accounts
    def remote_create_account(self, name, password):
        """
        Add an account in the same Authorizer that gives the access to the Admin perspective.
        """
        
        # should I check that the name is free ?
        assert not self.checker.userExist(name), LeoError("The user account %s already exist" % name)
        
        self.checker.addUser(name, password)
        
        self.client.callRemote("post_message", "LeoServer", 
                                "An account for %s have been created."%(name.capitalize())).addErrback(raiseMessageError, self.name)
        
        return
    
    
    def remote_change_password(self, name, password):
        """
        Change the password of an existing account.
        """
        
        # should I check that the name is free ?
        assert self.checker.userExist(name), LeoError("The user account %s does not exist (can not change his password)" % name)
        
        self.checker.setPassword(name, password)
        
        self.client.callRemote("post_message", "LeoServer", 
                                "The password of  %s have been edited."%(name.capitalize())).addErrback(raiseMessageError, self.name)
        
        return
    
    
    def remote_delete_account(self, name):
        """
        Delete an account in the same Authorizer that gives the access to the Admin perspective.
        """
        
        self.checker.delUser(name)
        
        # should I delete the permissions in the outline too ? <<<< YES, to avoid false permissions of future users 
        # need to visit the entire outline (ouch !)
        
        
        self.client.callRemote("post_message",  "LeoServer", 
                               "The account %s has been deleted."%(name.capitalize())).addErrback(raiseMessageError, self.name)
        
        return
    
    
    def remote_get_users_list(self,):
        """
        Return the list of existing users name
        """
        return  self.checker.users.keys()
    #@-node:accounts
    #@+node:permissions
    def remote_get_users_permissions(self, rpath):
        """
        Return the dictionnary of the permissions of a node.
        """        
        path = self.absolute_path(rpath)
        t_node = self.Outline.get_node(path)
        assert t_node, LeoError("Could not found the indicated path '%s'" % path)
        return t_node.permissions
    
    
    def remote_get_permissions(self, name, rpath):
        """
        Permissions are related to the aviable actions per node. 
        They also are herited to the subnodes.
        valid permissions are : ['Read', 'Node_edit', 'Tree_edit', 'Admin_node'] 
        """
        # could put here and access check, but will not (in sake of cpu usage)
            
        # get the path node
        path = self.absolute_path(rpath)
        t_node = self.Outline.get_node(path)
        assert t_node, LeoError("Could not found the indicated path '%s'" % path)
        permissions = self.Outline.get_permissions(name, t_node)	
        
        return permissions
    
    
    def remote_delete_permissions(self, name, rpath):
        """
        Erase the permissions of one user in the node. The permissions of upper nodes will be herited (propagated).
        """
        # could put here and access check, but will not (in sake of cpu usage)
            
        # get the path node
        path   = self.absolute_path(rpath)
        t_node = self.Outline.get_node(path)
        assert t_node, LeoError("Could not found the indicated path '%s'" % path)
        
        if t_node.permissions.has_key(name):
            del t_node.permissions[name]
        
        return 
    
    
    def remote_set_permissions(self, name, rpath, permissions):
        """
        Permissions are related to the aviable actions per node. 
        They also are herited to the subnodes.
        valid permissions are : ['Read', 'Node_edit', 'Tree_edit', 'Admin_node'] 
        """
    
        # get the path node
        path   = self.absolute_path(rpath)
        t_node = self.Outline.get_node(path)
        
        if not t_node:
            raisePathError(path)
            
        # check if the requested path is under the admin perspective
        res_node = self.Outline.find_upward(lambda x: self.base_node == x, path)
        if not res_node:
            raiseLeoError("You are not allowed to edit the permissions of this node. (%s)"%(path))
    
            
        if type(permissions) not in [list, tuple]:
            raiseLeoError("Permissions should be a list or a tuple")
    
        for permission in permissions:
            if permission not in ["Read", "Node_edit", "Tree_edit", "Admin_node"]:
                raiseLeoError("Unknown permission '%s'"%(permission))
            
        t_node.permissions[name] = list(permissions)
    
        # check if the user is logged and update his permissions.
        if t_node.users.has_key(name):	
            for t_perspective in t_node.users[name]:
                t_perspective.local_permissions = self.Outline.get_permissions(t_perspective.name, t_perspective.selected_node_path)
                
        self.client.callRemote("post_message", "LeoServer", 
                               "%s permissions have been updated."%(name.capitalize())).addErrback(raiseMessageError, self.name)
        
        return
    
    
    
    
    
    
    #@-node:permissions
    #@-others
    





#@-node:class AdminOutlinePerspective
#@+node:class OutlinePerspective
class OutlinePerspective(pb.Referenceable):
    """
    This class present a external access to an outline branch.
    This are the method that the client can access in the server space.
    The OutlinePerspective attach itself to the outline
    """
    
    # __init__ is a merge of old init and attach

    def __init__(self, name, base_node_url, outline, clientref):
        #pb.Referenceable.__init__(self) # pb.Referenceable  has no __init__ method
                
        self.Outline  = outline	# the internal Outline is capitalized because it make reference at the Server instance. (so ?)
        if not self.Outline:
            raise LeoError("Cannot attach a client if no CollaborativeOutline instance is attached to the Perpective (bug of the Service).")

        # store the perspective reference Node. Once logged we only have access to the Downside nodes.
        self.base_path = base_node_url
        self.base_node = self.Outline.get_node(base_node_url)
        assert self.base_node, LeoError("Could not found the reference node (base_node_url '%s')"% base_node_url)
        
        self.selected_node  = None
        self.selected_node_path = base_node_url
        self.local_permissions = [] # the permissions associated to the local nodes
        

        self.name     = name
        self.client   = clientref
        self.status   = "online"
        
        # attach to the CollaborativeOutline
        if self.Outline.users.has_key(self.name):
            self.Outline.users[self.name].append(self)
        else:
            self.Outline.users[self.name]= [ self ] # important, the outline manage a dictionary of lists of users perspective (an user user can be logged more than once at different point with one or more clients.)
            
        
        # attach us to the base node        
        if self.base_node.base_node_of.has_key(self.name):
            self.base_node.base_node_of[self.name].append(self)
        else:
            self.base_node.base_node_of[self.name] = [self]
        
        
        # attach us to the selected node
        self.selected_node = self.Outline.get_node(self.base_path)
                
        if self.selected_node.users.has_key(self.name):
            self.selected_node.users[self.name].append(self)
        else:
            self.selected_node.users[self.name] = [self]
            
            

        # set presence
        self.remote_set_presence("online")
        
        
        self.client.callRemote("post_message", "LeoServer", 
                                           "%s, you are welcome to the system."%(self.name.capitalize())).addErrback(raiseMessageError, self.name)
    
        return

        
    def logout(self,):
        """
        A client is closing his relation with this perspective (i.e. this outline).
        """
        
        print "%s at %s is login out." % (self.name, self.base_path)
        
        self.remote_collaborate_out() # collaborate_out (will do nothing if was not collaborating)
            
        #  dettach us from the selected node        
        self.selected_node.users[self.name].remove(self)
        if not self.selected_node.users[self.name]: # if there are no more clients connected
            del self.selected_node.users[self.name]  # forget us name
            
        # dettach from the CollaborativeOutline
        self.Outline.users[self.name].remove(self)
        if not self.Outline.users[self.name]: # if there are no more clients connected
            del self.Outline.users[self.name]  # forget us name
            
        #  dettach us from the base node        
        if self.base_node.base_node_of.has_key(self.name):
            self.base_node.base_node_of[self.name].remove(self)
        if not self.base_node.base_node_of[self.name]:
            del self.base_node.base_node_of[self.name]
        

        
        return
        

    #@    @+others
    #@+node:Own account editing
    def remote_change_password(self, newpassword):
        """
        Let the users change they password.
        """
        
        self.Outline.checker.setPassword(self.name, newpassword)
    
        self.client.callRemote("post_message", "LeoServer", "Own password; updated.").addErrback(raiseMessageError, self.name)		
        return
    #@nonl
    #@-node:Own account editing
    #@+node:Messages and presence methods
    
    def remote_get_actual_users_list(self, ):
        """ 
        Return the list of the logged users and they state.
        """
        
        t_list = map(lambda x: (x, self.outline.users[x].status),self.Outline.users.keys())
        
        return t_list
        
        
    def remote_set_presence(self, state):
        """
        Set the presence of one user 
        """
        
        self.status = state
        
        for t_list in self.Outline.users.values(): # a list of client references
            for t_value in t_list:
                t_value.client.callRemote("post_presence", self.name, state).addErrback(raiseLeoError, "could not post your presence to %s"%(t_value.name))
        
        return
    
    def remote_send_message(self, to, txt):
        """ 
        Send a message to
        """
        
        if to == "_everyone":
            for t_list in self.Outline.users.values():
                for t_value in t_list:
                    t_value.client.callRemote("post_message", self.name, txt).addErrback(raiseMessageError, t_value.name)
            return
    
        if to == "_room":
            for t_list in self.selected_node.users.values():
                for t_value in t_list:
                    t_value.client.callRemote("post_message", self.name, txt).addErrback(raiseMessageError, t_value.name)
            return
        
        
        if not self.Outline.users.has_key(to):
            raise LeoError("The user '%s' is not logged into this outline."%(to))
            #raise LeoError("The user '%s' is not logged into this outline. %s"%(to, str(self.Outline.users))) # just for debugging
        
        for t_perspective in self.Outline.users[to]:
            t_perspective.client.callRemote("post_message", self.name, txt).addErrback(raiseMessageError, self.name)
            
        return
    #@nonl
    #@-node:Messages and presence methods
    #@+node:Outline editing methods
    #@+at
    # Add the logic of the distributed application and then call the native 
    # Outline method.
    #@-at
    #@@c
    
    #@-node:Outline editing methods
    #@+node:helpers functions (data<->outline)
    #@+at
    # Server side, data<->outline transformation
    #@-at
    #@@c
    #@nonl
    #@-node:helpers functions (data<->outline)
    #@+node:outline_to_data
    def outline_to_data(self, parent_node):
        """
        Recieve a node instance and return a list in the format.
        ([node1_instance, node2_instance, ..], [0, 1, 2, [4, 1], 5, 2, 6, ..])
        Clones suboutlines appears only once (node '2' in the previous example) 
        Used as a helper function to construct the data to send.
        parent_node is also included in the result.
        """
            
        # inner helper recursive function ---------------------------
        def level_list(childrens, t_dic):
            t_list = []
            for t_node in childrens:
                if not t_dic.has_key(t_node): # if not in the dic
                    t_dic[t_node] = len(t_dic) # add it, with his index
                    
                t_list.append(t_dic[t_node]) # add the entry
                
                if t_node.childrens and t_dic[t_node] == (len(t_dic) - 1): # if has childrens, and it is the first appearance
                    t_list.append(level_list(t_node.childrens, t_dic)) # add the new level, recursivelly
                
                # lets continue with the actual level 
            
            return t_list # tada... easy
        # end of inner recursive function ----------------------------
        
        t_dic = {parent_node:0}	
        nodes_hierarchy = [0, level_list(parent_node.childrens, t_dic)]
        nodes_list = range(len(t_dic))
        for t_node, pos in t_dic.items():
            nodes_list[pos] = t_node
    
        return (nodes_list, nodes_hierarchy)
    #@nonl
    #@-node:outline_to_data
    #@+node:data_to_outline
    def data_to_outline(self, parent, nodes_list, nodes_hierarchy, t_dic):
        """
        Receive data in the format ([(name, body), (name,body), ...], [0 1 [2 3 1] 4])
        and append the new nodes to the parent.
        If the parent already has childrens, will add them to the last position.
        t_dic contain a map of "already scanned indexes" -> node_instance object. This allow to create the required clones.
        Recursive function.
        """
     
        NodeClass = self.Outline.nodeClass #NodeClass( parent_node=None, position=-1, name="New CollaborativeNode", text=""):
        last_node = parent
        
        for t_item in nodes_hierarchy:
            
            if type(t_item) is int:
              
                if not t_dic.has_key(t_item): # if not already created, create a new node
                    #print t_item, len(nodes_list), nodes_list # just for debugging
                    t_name, t_text = nodes_list[t_item]
                    last_node = NodeClass(parent, position=-1, name=t_name, text=t_text) # new node
                    t_dic[t_item] = last_node
                else: # the node already was created, now we should create a clone of it.
                    twin = t_dic[t_item]
                    self.Outline.create_clone(twin, parent, position=-1) #create_clone(twin, parent, position=-1):
                    last_node = twin 
                    
            elif type(t_item) in [list, tuple]:
                self.data_to_outline(last_node, nodes_list, t_item, t_dic) # recursive call for the next level
                
            else:
                self.es_error("<LeoClient Error> The nodes hierarchy in the uploaded data contain an unmanageable object of type %s"%( type(t_item)))
        
        
        return
    
    
    #@-node:data_to_outline
    #@+node:get outline
    
    def remote_get_outline(self,):
        """
        Return a copy own perspective outline branch.
        The format is
        (["name1", "name2", ..], [0, 1, 2, [4, 1], 5, 6, ..])
        """
        
        base_node = self.Outline.get_node(self.base_path)
        assert base_node, LeoError("Could not find the base_node (base_path '%s')" % self.base_path)
            
        nodes_list, nodes_hierarchy = self.outline_to_data(base_node) # format ([node1_instance, node2_instance, ..], [0, 1, 2, [4, 1], 5, 6, ..])
        nodes_list = map(lambda x:x.name, nodes_list) 
    
        return (nodes_list, nodes_hierarchy) # tada... so easy.
    
    #@-node:get outline
    #@+node:select node
    def remote_select_node(self, path):
        """
        Set us selected node and
        return the content of the selected node.
        """
        
        t_node = self.Outline.get_node(path)
        
        if not t_node:
            raiseLeoError("Could not found the required node. (%s)"%(path))
            return
        
        self.selected_node_path = path
        # if actual node is locked, unlock it
        if self.selected_node.is_locked == self.name:
            self.remote_unlock_selected_node()
            
        # dettach from previous node
        try:
            self.selected_node.users[self.name].remove(self)
        except:
            # we where not attached to the previous node....
            pass
        
        # select the new node
        self.selected_node = t_node
        
        # attach us
        if self.selected_node.users.has_key(self.name):
            self.selected_node.users[self.name].append(self)
        else:
            self.selected_node.users[self.name] = [self]
        
        # obtain the contents of the selected node
        content = self.selected_node.get_text()
        
        return content
    #@-node:select node
    #@+node:Edit tree (class OutlinePerspective)
    #@+at
    # Each instance is responsable of his task, to check permissions and to 
    # propagate the event to the other clients.
    #@-at
    #@@c
    
    def absolute_path(self, relative_node_path): 
        """
        transforme a relative path to a valid server url
        """
        assert type(relative_node_path) is unicode, LeoError("Received relative paths have to be unicode (received type %s)" % type(relative_node_path))
        return self.base_path + relative_node_path[1:]	
    
    
    
    #@-node:Edit tree (class OutlinePerspective)
    #@+node:base operations
    #@+at
    # The set of base operations that allow any desirable tree modification.
    #@-at
    #@@c
    #@nonl
    #@-node:base operations
    #@+node:create_node
    def remote_create_node(self, path, text=u"", position=-1):
        """ 
        The perspective receive relatives paths (relatives to the self perspective).
        The CollaborativeOutline receive absolutes paths.
        """
    
        t_list = self.Outline.path_to_list(self.absolute_path(path))
            
        parent_path, name = t_list[:-1], t_list[-1]
        parent_node       = self.Outline.get_node(parent_path)
        
        if not parent_node:
            raiseLeoError("Could not found the parent of the new node  (%s)"%(parent_path) )
            return
            
        # check if authorized to edit the tree
        local_permissions = self.Outline.get_permissions(self.name, parent_path)
    
        if "Tree_edit" not in local_permissions:
            raise Unauthorized, "You are not allowed to edit this tree. (your local permissions are %s)"%(local_permissions)
            
        # check if the tree is not locked
        # regulation: node creation have no restrictions
    
        # apply	
        self.Outline.create_node(parent_node, name=name, text=text, position=position)
        
            
        # propagate. only two cases, will see it, will not see it. Easy. -:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-
        
        # obtain the perspectives related to this event
        t_dic = self.Outline.get_upward_perspectives(parent_node) # return a dic of 'perspective'->"relative_path"
        
        for t_perspective, t_rpath in t_dic.items():
            t_rpath = "%s/%s" % ( t_rpath, name) 
            t_perspective.client.callRemote("create_node", t_rpath, position) # propagate the event to other clients
    
        
        return
    #@nonl
    #@-node:create_node
    #@+node:create_clone
    def remote_create_clone(self, twin_path, parent_path, position=-1):
        """ 
        The perspective methods receive relatives paths (relatives to the self perspective).
        """
    
        twin_path   = self.absolute_path(twin_path)
        parent_path = self.absolute_path(parent_path)
        
        twin   = self.Outline.get_node(twin_path)
        parent = self.Outline.get_node(parent_path)
    
        # check existance
        assert twin, LeoError("Could not find the twin")
        assert parent, LeoError("Could not find the parent")
    
        # check permissions
        local_permissions = self.Outline.get_permissions(self.name, parent_path)
        if "Tree_edit" not in local_permissions:
            raise Unauthorized, "You are not allowed to edit this tree. (your local permissions are %s)"%(local_permissions)
    
        local_permissions = self.Outline.get_permissions(self.name, twin_path)
        if "Read" not in local_permissions:
            raise Unauthorized, "You are not allowed to read the node to clone. (your local permissions are %s)"%(local_permissions)
    
        # check recursive outline construction
        assert twin != parent and twin not in  self.Outline.get_upward_nodes(parent), LeoError("Recursive graphs are not allowed, Leo(N) only accept Acyclic Graphs.\nTwin node '%s' is parent of the node '%s'." % (twin_path, parent_path))
        
        # create the clone -:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-
        self.Outline.create_clone(twin, parent, position)
        
        # propagate -:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-
        # three cases: will see it, will see it as a node creation, will not see it. simple but non trivial.
        
        twin_perspectives   = self.Outline.get_upward_perspectives(twin)   # return a dic of 'perspective'->"relative_path"    
        parent_perspectives = self.Outline.get_upward_perspectives(parent) # return a dic of 'perspective'->"relative_path"
        
        for t_perspective, t_rpath in parent_perspectives.items():
            if twin_perspectives.has_key(t_perspective): # if user see the parent of new node and the root twin
                # he will see a clone
                t_twin_rpath = twin_perspectives[t_perspective]
                t_perspective.client.callRemote("create_clone", t_rpath, t_twin_rpath, position) # propagate the event to other clients
            else: # only see the parent, but not the original node
                # he will see a new node (not cloned)
                t_rpath = t_rpath + '/' + twin.name
                t_perspective.client.callRemote("create_node", t_rpath, position) # propagate the event to other clients  
    
    
        return
    #@nonl
    #@-node:create_clone
    #@+node:delete_node
    def remote_delete_node(self, node_path):
        """ 
        The perspective receive relatives paths (relatives to the self perspective).
        """
    
        node_path = self.absolute_path(node_path) 
        
        if node_path == "/": #node == self.Outline.root_node:
            raise Unauthorized, "The Root Node is unerasable."
            
        # check if authorized to edit the tree
        local_permissions = self.Outline.get_permissions(self.name, node_path)
        if "Tree_edit" not in local_permissions:
            raise Unauthorized, "You are not allowed to edit this tree. (your local permissions are %s)"%(local_permissions)
    
    
        node = self.Outline.get_node(node_path)
        
        # check if the tree is not locked
        # regulation: only nodes that no one is editing can be erased
        
        # helper recursive function ----
        def check_no_other_users(t_node):
            if t_node.users.values() != [] and t_node.users.values() != [[self]]:
                raiseLeoError("Nodes being edited by other users can not be erased.")
                return
            if t_node.base_node_of:
                raiseLeoError("This node is the base node of %s so it can not be deleted." % t_node.base_node_of.keys() )
                return
            for t_child in t_node.childrens:
                check_no_other_users(t_child)
                        
            return
        # end of helper recursive function ----
        
        check_no_other_users(node) # will raise an exception if there are problems
    
        # obtain the perspectives related to this event (need to do this *before* deleting the node)
        t_dic = self.Outline.get_upward_perspectives(node) # return a dic of 'perspective'->"relative_path"
    
        # apply
        self.Outline.delete_node(node)
    
        # propagate the event to all the interested users: every user that register an access from parent to upstairs
        # only two cases, will see it, will not see it.
            
        for t_perspective, t_rpath in t_dic.items(): 
            t_perspective.client.callRemote("delete_node", t_rpath) # propagate the event to other clients
    
        return
    
    #@-node:delete_node
    #@+node:move_node
        
        
    def remote_move_node(self, node_path, new_path, position=-1):
        """ 
        The perspective receive relatives paths (relatives to the self perspective).
        Allow move, a renaming+move
        """
    
        node_path  = self.absolute_path(node_path)
        new_path   = self.absolute_path(new_path)
        
        try:
            t_list     = filter(lambda x:x, new_path.split('/')) 
            new_parent_lpath = t_list[:-1] #lpath is a list path
            new_parent_path = u'/' + '/'.join(new_parent_lpath)
            new_name   = t_list[-1]
        except:
            LeoError("Could no separate the parent and the new node name. (new_path %s)" % new_path) 
        
        old_name   = filter(lambda x:x, node_path.split('/'))[-1]
    
    
        #@    << check permissions >>
        #@+node:<< check permissions >>
        # check if authorized to edit the tree -:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-
        permissions = self.Outline.get_permissions(self.name , node_path)
        if "Tree_edit" not in permissions:
            raise Unauthorized, "%s not allowed to move the requested node. (permissions %s at '%s')"%(self.name.capitalize(), permissions, node_path)
        
        permissions = self.Outline.get_permissions(self.name , new_parent_path)
        if "Tree_edit" not in permissions:
            raise Unauthorized, "%s not allowed to edit the tree associated to the new node position. (permissions %s at '%s')"%(self.name.capitalize(), permissions, new_parent_path)
        
        
        # check nodes existance -:-:-:-:-:-
        node = self.Outline.get_node(node_path)    
        if not node:
            raiseLeoError("Could not found the node to move (and rename). (node_path '%s')"% node_path)
        
        old_parent_path = '/'.join(node_path.split('/')[:-1])
        old_parent = self.Outline.get_node(old_parent_path)
        assert old_parent, LeoError("Could not find the old parent (parent_path '%s')" % old_parent_path)
        
        
        new_parent = self.Outline.get_node(new_parent_path)
        assert new_parent, LeoError("Could not find the new parent (parent_path '%s')" % new_parent_path)
        
        
        # check recursive outline construction
        assert node != new_parent and node not in self.Outline.get_upward_nodes(new_parent), LeoError("Recursive graphs are not allowed, Leo(N) only accept Acyclic Graphs.\nMoved node '%s' is parent of the destination node '%s'." % (node_path, new_parent_path))
        #@-node:<< check permissions >>
        #@nl
        #@    << check locks >>
        #@+node:<< check locks >>
        # check if the tree is not locked -:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-
        
        
        # regulation: no one has to be editing the node during edition because for some users a node move can be seen as a deletion.
            
        # future regulation: the node and their descendant can only be edited by users that view both the old_path and the new_path. If not some user will see that they actual edition node is deleted, that inasceptable. (too complicated to implement in the first version, KISS)
            
        # helper recursive function ----
        def check_no_other_users(t_node):
            if t_node.users.values() != [] and t_node.users.values() != [[self]]:
                raiseLeoError("Nodes being edited by other users can not be erased. (detected the presence of %s)"%(t_node.users.keys()))
                return
            for t_child in t_node.childrens:
                check_no_other_users(t_child)
                                    
            return
        # end of helper recursive function ----
        
        check_no_other_users(node) # will raise an exception if there are problems
        #@-node:<< check locks >>
        #@nl
        #@    << apply >>
        #@+node:<< apply >>
        
        # apply -:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-
        self.Outline.move_node(node_path, new_parent_path, position = position)
        
        # rename the node, if necessary
        old_name = node.name
        if new_name != old_name: # check renaming
            node.name = new_name
        #@-node:<< apply >>
        #@nl
        #@    << propagate >>
        #@+node:<< propagate >>
        # apply to the other clients -:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-
        # depending on the perspective a move can look as an insertion, a deletion or a move.
        # propagate the event to all the interested users
        # propagation is cpu intensive ...
        
        # obtain the perspectives related to this event
        old_view_dic = self.Outline.get_upward_perspectives(old_parent) # return a dic of 'perspective'->"relative_path"
        new_view_dic = self.Outline.get_upward_perspectives(new_parent) # return a dic of "relative_path" -> [perspectives]
                
        #print "new_parent t_dic", t_dic # just for debugging
        #print "new_view_dic", new_view_dic # just for debugging
        
        outline_list = None # will create it only if required
        
        for t_perspective in new_view_dic.keys(): # users that will see an insertion
            if old_view_dic.has_key(t_perspective): # the user will see a move
                old_rpath = old_view_dic[t_perspective] + '/' + old_name
                new_rpath = new_view_dic[t_perspective] + '/' + new_name
                t_perspective.client.callRemote("move_node", old_rpath, new_rpath, position=position)
                del old_view_dic[t_perspective] # already counted    
            else: # the user will see an insertion
                new_rpath = new_view_dic[t_perspective] + '/' + new_name
                if not outline_list: # if the data have not been obtained calculate it now
                    data = self.Outline.outline_to_data(node)
                    outline_list = (map(lambda x: x[0], data[0]), data[1]) # change ([(name, body), (name,body)], [0 1 [2 3 1] 4]) to ([name, name], [0 1 [2 3 1] 4])
                t_perspective.callRemote("paste_outline", new_rpath, position, outline_list) # send the data to the other clients
            
            
        for t_perspective in old_view_dic.keys(): # the rest of the old users will see a deletion
            old_rpath = old_view_dic[t_perspective] + '/' + old_name
            t_perspective.client.callRemote("delete_node", old_rpath)
            
        #@nonl
        #@-node:<< propagate >>
        #@nl
    
        return
        
    #@-node:move_node
    #@+node:upload outline
    def remote_upload_outline(self, parent_path, position, data):
        """
        This method allow clients to update outlines.
        The clients upload data to the server, this method transform this data in a real outline, and propagate the event.
        The format of data is : ([(name, body), (name,body), ...], [0 1 [2 3 1] 4])
        """
           
        # check if authorized to edit the tree -:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-
        local_permissions = self.Outline.get_permissions(self.name, parent_path)
    
        if "Tree_edit" not in local_permissions:
            raise Unauthorized, "You are not allowed to append branches to this tree. (your local permissions are %s)"%(local_permissions)
    
        # create the local outline -:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-
        parent_node = self.Outline.get_node(parent_path)
        assert parent_node, LeoError("Could not find the parent node where insert the uploaded data (parent_path '%s')" % parent_path)
    
        assert len(data[1])== 2, LeoError("The nodes hierarchy have not the correct format. (a parent node and all his childrens) (len(data[1]) == %i != 2) " % len(data[1]) )
        
        # security check of names with "/" (an error would be too much disastrous)
        data = (map(lambda x: (x[0].replace("/", "&sl;"), x[1]), data[0]), data[1])
        
        # add the first item at the correct position, the rest is recursive,
        t_name, t_text = data[0][data[1][0]]
        t_node = self.Outline.nodeClass(parent_node, position, name=t_name, text=t_text) #NodeClass( parent_node=None, position=-1, name="New CollaborativeNode", text=""):
        t_dic = {data[1][0]:t_node} # index -> node_instance
        
        # now deploy the data in the rest of the t_node childrens
        self.data_to_outline(t_node, data[0], data[1][1], t_dic) # data_to_outline(parent, nodes_list, nodes_hierarchy, t_dic)
        
        
        # propagate the event to the other clients -:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-
        # obtain the outline 
        outline_list = (map(lambda x: x[0], data[0]), data[1]) # change ([(name, body), (name,body)], [0 1 [2 3 1] 4]) to ([name, name], [0 1 [2 3 1] 4])
        
        # send outline to the interested clients 
        # only two cases, will see it, will not see it. Easy.
        
        # obtain the perspectives related to this event
        t_dic = self.Outline.get_upward_perspectives(parent_node) # return a dic of 'perspective'->"relative_path"
        
        for t_perspective, t_rpath in t_dic.items(): 
            t_perspective.client.callRemote("paste_outline", t_rpath, position, outline_list) # send the data to the other clients
                
        return
    #@-node:upload outline
    #@+node:download outline
    def remote_download_outline(self, path):
        """
        Return the data related to a specific outline. This method is called by client that desire to "copy" an online outline.
        Data format,
        (
            ([("node1_name", "node1_text"), ("node2_name", "node2_text"), ..], [0, 1, 2, [4, 1], 5, 6, ..]),
            {1:["user1", "user2"], 5:["user2", "user4"]}
        )
        i.e. outline data plus data of who is editing the copied nodes, very important to warn the user of corrupt, or in edition version.
        """
        
        # transform a local outline to his data representation
        
        base_node = self.Outline.get_node(path)
        assert base_node, LeoError("Could not find the base_node to download (base_node_path '%s')" % path)
        
        nodes_list, nodes_hierarchy = self.outline_to_data(base_node) # format ([node1_instance, node2_instance, ..], [0, 1, 2, [4, 1], 5, 6, ..])
        data = (map(lambda x:(x.name, x.get_text()), nodes_list) , nodes_hierarchy) 
    
    
        warnings = {} #the "being edited by" warnings. {1:["user1", "user2"], 5:["user2", "user4"]} 
        c = 0
        for t_node in nodes_list:
            if t_node.users:
                warnings[c] = t_node.users.keys()
            c+=1
            
            
        return (data, warnings)
    #@-node:download outline
    #@+node:Edit nodes
    # Perspective access to node contents edition methods
    #@nonl
    #@-node:Edit nodes
    #@+node:lock/unlock
    def remote_selected_node_is_locked(self,): # is this method necessary ?
        """
        Used by the client to know who is locking the node.
        """
        
        if self.selected_node:
            return self.selected_node.is_locked
        
        return None
    
    
    def remote_lock_selected_node(self, ):
        """ 
        """
    
        # check the permissions	
        if self.selected_node.is_locked and self.selected_node.is_locked != self.name:
            raiseLeoError("The selected node is already locked by '%s'."%(self.selected_node.is_locked))
                
        self.selected_node.is_locked = self.name
            
        return
        
    def remote_unlock_selected_node(self, ):
        """ 
        """
    
        if self.selected_node.is_locked != self.name:
            raiseLeoError("The selected node is locked by '%s', you can not unlock it."%(self.selected_node.is_locked))
            
        
        self.selected_node.is_locked = None # no one has a lock over this node
        
        return
    #@-node:lock/unlock
    #@+node:update node
    
    
    def remote_update_node(self, path, text): # this method should be generic or only for the selected node
        """ 
        """
    
        node = self.Outline.get_node(path)
            
        # check if it is already locked by you
        if node.is_locked != self.name:
            raiseLeoError("The selected node is locked by '%s', you can not edit it."%(self.selected_node.is_locked))
    
        # apply
        self.Outline.update_node(node, text)
    
        # propagate the event to all the interested users
        for t_value in node.users.values():
            t_value.client.callRemote("update_node", text ).addErrback(raiseLeoError, "could not update the node for user %s"%(t_value.name))		
            
        return	
        
    
    def remote_update_selected_node(self, text): # this method should be generic or only for the selected node
        """ 
        """
    
        # check if it is already locked by you
        if self.selected_node.is_locked != self.name:
            raiseLeoError("The selected node is locked by '%s', you can not edit it."%(self.selected_node.is_locked))
    
        # apply		
        self.Outline.update_node(self.selected_node, text)
    
        # propagate the event to all the interested users
        for t_list in self.selected_node.users.values():
            for t_value in t_list:
                t_value.client.callRemote("update_selected_node", text ).addErrback(raiseLeoError, "could not update the selected node of %s"%(t_value.name))
            
        return	
    #@-node:update node
    #@+node:collaborate in/out
    # Allow external users to start collaborating
    
    
    def remote_collaborate_in(self):
        """
        Login into the collaborative server associated to the selected node
        """
        
        site_index, num_of_sites, base_state_vector, base_text, ops_list = self.selected_node.add_client(self.client)
        
        self.site_index = site_index
        
        return (site_index, num_of_sites, base_state_vector, base_text, ops_list)
    
    
    def remote_collaborate_out(self):
        """
        Logout from the collaborative server associated to the selected node
        """
    
        # logout of the Collaborative Node
        self.selected_node.del_client(self.client)
        
        self.site_index = None
        
        return
        
        
    
    #@-node:collaborate in/out
    #@+node:receive_op
    def remote_receive_op(self, *args, **kws):
        """
        Perspective access to the selected nodes operations
        """
        
        # check if it is already locked by you
        if self.selected_node.is_locked and (self.selected_node.is_locked != self.name):
            raiseLeoError("The selected node is locked by '%s', you can not edit it."%(self.selected_node.is_locked))
            
        if self.site_index == None:
            raiseLeoError("You have not logged in the node, so you are not able to edit it.")
    
        kws["source_site"] = self.site_index # if this perspective manage the call, it has to comes from that source
        kws["who"] = self.name # stamp the operation with us name
        
        # apply		
        self.selected_node.receive_operation(ConcurrentEditable.Operation(*args, **kws))
        return
    #@nonl
    #@-node:receive_op
    #@+node:insert/delete text
    def remote_insert_text(self, startpos, text, timestamp = None):
        """ 
        
        (version will be used for leo step4)
        """
        
        # check if it is already locked by you
        if self.selected_node.is_locked and (self.selected_node.is_locked != self.name):
            raiseLeoError("The selected node is locked by '%s', you can not edit it."%(self.selected_node.is_locked))
            
        if self.site_index == None:
            raiseLeoError("You have not logged in the node, so you are not able to edit it.")
    
        if timestamp == None:
            raiseLeoError("Operation 'insert_text' called without a timestamp.")
            
            
        # apply		
        self.selected_node.receive_operation(ConcurrentEditable.Operation("Insert", startpos, text, timestamp = timestamp, source_site = self.site_index, who= self.name))
        
        # the selected, cnode will propage the event to the related users.
        # cnode : CollaborativeNode, is a ConcurrentEditableServer
            
        return
        
    def remote_delete_text(self, startpos, length, timestamp = None):
        """ 
        """
        
        # check if it is already locked by you
        if self.selected_node.is_locked and (self.selected_node.is_locked != self.name):
            raiseLeoError("The selected node is locked by '%s', you can not edit it."%(self.selected_node.is_locked))
            
        if self.site_index == None:
            raiseLeoError("You have not logged in the node, so you are not able to edit it.")
            
        if timestamp == None:
            raiseLeoError("Operation 'delete_text' called without a timestamp.")
    
            
        if not ( type(startpos) == type(length) and type(startpos) is int):
            raiseLeoError( "Type of the arguments for delete text are incorrect. (expected IntType got %s, %s)"%(type(startpos), type(length) ) )
        
        # apply		
        self.selected_node.receive_operation(ConcurrentEditable.Operation("Delete", startpos, length, timestamp = timestamp, source_site = self.site_index, who= self.name))
        
        # the selected, cnode will propage the event to the related users.
        # cnode : CollaborativeNode, is a ConcurrentEditableServer
        
        return
    
    #@-node:insert/delete text
    #@-others

#@-node:class OutlinePerspective
#@+node:class CollaborativeOutline
class CollaborativeOutline:
    """
    This class group the methods necesarry to manipulate an outline.
    This class is core element of the LeoServer.
    There is one and only one CollaborativeOutline per LeoService.
    One machine can host more than one LeoService.
    
    This class try to reuse as much as possible the Leo logic.
    
    This class also acts as the server Realm (because the logic are very coupled).
    A realm is an interface which connects your universe of business objects to the authentication system.
    
    This class also *contains* the checker.
    """
    
    __implements__ = (portal.IRealm,)
    
    def __init__(self, checker=None):
        """
        """
        
        self.checker = LeoChecker()
        
        self.users = {} # the dictionnary  ['name'] = [perspectives] of all the online users and their actual perspectives (an user can log more than once at different or equal access points) #this is a public element
        
        from LeoServer import Copy_cnode # to avoid the __main__.Copy_cnode error
        self.nodeClass = Copy_cnode #leoNodes.vnode #Copy_cnode #the cnodes will be copied to the clients
        
        # create the first entry
        self.root_node = self.nodeClass(name="/", text=u"This is the root_node. You should not delete me.")
                
        return


    #@    @+others
    #@+node:requestAvatar (CollaborativeOutline.requestAvatar)
    def requestAvatar(self, avatarId, mind, *interfaces):
        """
        The user have been authenticated and it is requesting an Avatar.
        """
        if pb.IPerspective not in interfaces:
            raise NotImplementedError	
        
        avatar = LeoAvatar(avatarId, mind, self) # one avatar instance per conection
    
        return pb.IPerspective, avatar , avatar.logout # implemented interface reference, interface instance, logout method
    
    #@-node:requestAvatar (CollaborativeOutline.requestAvatar)
    #@+node:Navigation 
    #@+at
    # Helper functions to find and access to the nodes
    #@-at
    #@@c
    #@-node:Navigation 
    #@+node:path_to_list
    def path_to_list(self, path):
        """
        Get a path and return a list of nodes names
        """
    
        if type(path) is unicode:
            path = [u'/'] + filter(lambda x:x, path.split('/') ) # suposed to be an url, eliminate the '' nodes #os.path.normpath(path).split('/')
        elif not type(path) is list:
            raiseLeoError("Unmanaged type of path given '%s' is %s"%(path, type(path)))
        
        return path
    #@nonl
    #@-node:path_to_list
    #@+node:get_node
    def get_node(self, path):
        """
        Return the node object associated to a path.
        Accept urls or a list of nodes names.
        """
        
        t_node = self.root_node 
        
        for p in self.path_to_list(path)[1:]:
            old_node = t_node
            for children in t_node.childrens:
                if children.name == p:
                    t_node = children
                    break
            if t_node == old_node: # if no matching children was found
                return None
                #raiseLeoError("Could not found the node associated to that path. (probably path was edited)")
        
        return t_node # eureka
    #@-node:get_node
    #@+node:find_upward
    def find_upward(self, condition, start_node_path):
        """
        Find the first node that match the condition, starting from start_node and going upward.
        The start_node_path specify the actual clones branch.
        We supose the path  normalized
        """
        
        t_node = self.get_node(start_node_path) # start node
        
        assert t_node, LeoError("Could not find the start_node_path '%s'" % start_node_path)
        
        if t_node and condition(t_node): # test the start
            return t_node
        # else
        t_list = self.path_to_list(start_node_path)[:-1]  # ['/', 'p1', 'p2', 'node_name'][:-1] == ['/', 'p1', 'p2']
        t_list.reverse() # t_list == ['p2', 'p1', '/']
        
        for t_parent_name in t_list:          
            if t_node and condition(t_node):
                return t_node
            last_t_node = t_node
            for t_parent in t_node.parents:
                if t_parent.name == t_parent_name:
                    t_node = t_parent # lets test the parent for condition
                    break # break the for t_node.parents, and go back to the for parent_name in t_list
            if last_t_node == t_node: # did not found a parent named t_parent_name
                return None
    
        if t_node and condition(t_node): # t_node now is the root node
            return t_node
        # else
        return None
    #@nonl
    #@-node:find_upward
    #@+node:get upward nodes (CollaborativeOutline/Navigation)
    def get_upward_nodes(self, base_node_instance):
        """
        Return a list of all the updward nodes.
        This is a 'clones award' function.
        """
        
        # helper recursive function -:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-
        def upward_nodes(base_node, t_dic):
            """
            t_dic store the allready scanned nodes, to avoid redundancies
            """
            if t_dic.has_key(base_node):
                t_list = [base_node]
                t_dic[base_node] += 1
            else:
                t_dic[base_node] = 0
                t_list = []
                
            for t_parent in base_node.parents:
                t_list.extend(upward_nodes(t_parent, t_dic))
                
            return t_list
        # end of helper recursive function -:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-
        
        return upward_nodes(base_node_instance, {})
    #@nonl
    #@-node:get upward nodes (CollaborativeOutline/Navigation)
    #@+node:get upward perspectives (CollaborativeOutline/Navigation)
    def get_upward_perspectives(self, base_node_instance):
        """
        Return a list of all the connected perpectives, upward, with they relative path to the base node.
        Return a dictionary of 'perspective'->"relative_path"
        This function is very used for events propagation.
        This is a 'clones award' function.
        """
        # we have to choice one valid url per perspective, and avoid perspectives redundancies.
        
        
        # helper recursive function -:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-
        def upward_perspectives(base_node, t_path, t_dic):
            """
            t_dic store the result. t_path allow the construction of the different paths
            """
            t_path = "%s/%s" % (base_node.name, t_path)
            
            #base_node.base_node_of is a map of ['names'] => [perspectives]
            perspectives = reduce(lambda x,y: x+y, base_node.base_node_of.values(), [])
    
            if perspectives: # make grow the dic as necesarry
                for t_perspective in perspectives:
                    t_dic[t_perspective] = t_path # the perspective instance is supposed to be repeated (coud add assert not t_dic.has_key(t_perspective), "error")
                
            for t_parent in base_node.parents:
                
                #assert t_parent != base_node, "Pathological parent<->children relation detected, operation aborted."
                if t_parent == base_node:
                    raiseLeoError("Pathological parent<->children relation detected, operation aborted. base_node '%s' is himself base_node.parents member" % base_node.name)
                    
                upward_perspectives(t_parent, t_path, t_dic)
    
                
            return t_dic
        # end of helper recursive function -:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-
        
        return upward_perspectives(base_node_instance, u"", {})
    #@-node:get upward perspectives (CollaborativeOutline/Navigation)
    #@+node:Users permissions
    def get_permissions(self, name, node_path): 
        """
        Return the permissions list for the user 'name' that is valid for the node 'ref_node'.
        Return the first permission reference to that user
        """
        t_node = self.find_upward(lambda x: x.permissions.has_key(name), node_path)
        
        if not t_node:
            res = []
        else:
            res = t_node.permissions[name]
        
        return res
    #@-node:Users permissions
    #@+node:Edit tree (create, delete, move nodes)
    
    def create_node(self, parent, name="New_node", text="", position=-1):
        """ 
        """
        
        new_node = self.nodeClass(parent, position=position, name=name, text=text) # it attach by itself to the parent
        
        return
        
    
    def create_clone(self, twin, parent, position=-1):
        """ 
        parameters are node instances
        """
        
        if position < 0:
            position = len(parent.childrens) + 1 + position
        
        parent.childrens.insert(position, twin) 
        twin.parents.append(parent)
     
        return # tada... so easy...
    
        
    def delete_node(self, node):
        """ 
        """
        
        if node == self.root_node:
            raise Unauthorized, "The Root Node is unerasable."
        
        # eliminate parent references
        for t_parent in node.parents:
            t_parent.childrens.remove(node)
            
        del node # delete the object
    
        return
        
    def move_node(self, node_path, new_parent_path, position = -1):
        """ 
        Move the node.
        Need paths because, there is an ambiguity on which parent the node has to dettach. The path has no ambiguity.
        """
            
        if node_path == '/': #node == self.root_node
            raise Unauthorized, "The Root Node is unamovable."
    
        new_parent = self.get_node(new_parent_path)
        assert new_parent, LeoError("Could not find the new parent (parent_path '%s')" % new_parent_path)
            
        # check that position exists
        if len(new_parent.childrens) < position:
            raiseLeoError("Trying to move at an unexisting position. len(new_parent.childrens) == %i, requested position == %i "% ( len(new_parent.childrens), position))
        
        # dettach from actual parent
        node = self.get_node(node_path)
        assert node, LeoError("Could not find the node to move (node_path '%s')" % node_path)
        
        parent_path = self.path_to_list(node_path)[:-1] 
        parent = self.get_node(parent_path)
        assert parent, LeoError("Could not find the parent (parent_path '%s')" % parent_path)
        
        if parent == new_parent: # if there was no real move
            return
        
        parent.childrens.remove(node) # detach only from his direct parent
            
        # attach to new parent at position
        if position < 0:
            position = len(new_parent.childrens) + 1 + position
        
        new_parent.childrens.insert(position, node)
    
        # new parent in the moved node
        node.parents.remove(parent) # delete old
        node.parents.append(new_parent) # add new one
        
        return
        
    
    
    #@-node:Edit tree (create, delete, move nodes)
    #@-others
    
        
    def get_outline(self, outline_path):
        """ 
        Return a copy of the outline object.
        Return a hierarchy of outlines. (use PbCopyable properpty)
        """
        raise NotImplementedError 
        # need to implement a getCopyState 
        # need to separate nodes static content from dinamic content. Bad !
        # should create a copy of the data, and send that classes...
        # not required to exist in the actual system implementation and design
        # probably will never be implemented ...
        return self.root_node
        
        

#@-node:class CollaborativeOutline
#@+node:class CollaborativeNode
class CollaborativeNode(ConcurrentEditable.ConcurrentEditableServer):
    """
    cnodes are persistents.
    CollaborativeNode are store object, that keep name, text, parent and children references; 
    and dynamic object, that manage concurrentedition sessions. 
    """
    
    def __init__(self, parent_node=None, position=-1, name=u"New CollaborativeNode", text=u""):

        # instanciate the concurrent editable server
        ConcurrentEditable.ConcurrentEditableServer.__init__(self, text= text)
        
        # node data
        self.name = name
        
        # node hierarchy
        if parent_node:
            self.parents = [parent_node]
        else:
            self.parents = []
        self.childrens = []
        
        if parent_node:
            parent_node.add_children(self, position=position)
            
        # node users management.
        self.users      = {} # the user that are visiting this node now (not persistent)
        self.base_node_of = {} # ['name'] = [Perspectives] the user that are visiting this node now (not persistent)
        self.permissions = {} # a ['name'] = [ Permisions ]  dictionary. (very persistent)
        # valid permissions are : ['Read', 'Node_edit', 'Tree_edit'] 
        
        #lock / unlock variable
        self.is_locked = None # normally store the user "name"
        
        
        return
    
    
    def __str__(self,):
        """
        What to show when a node is printed.
        """
        
        t_string = "\nNode name: '%s'\nNode content: '%s'\n"%( self.name, self.get_text())
        
        return t_string
        
    #@    @+others
    #@+node:add/del clients
    # a public method herited from ConcurrentEditable, look there
    # add_client, del_client, get_clients
    #@nonl
    #@-node:add/del clients
    #@+node:Edit tree
    def add_children(self, node, position=-1):
        """ 
        """
        
        # check that position exists
        if len(self.childrens) < position:
            raiseLeoError("Trying to add a node at an unexisting position. len(new_parent.childrens) == %i, requested position == %i "% ( len(self.childrens), position))
        
        # attach to new parent at position
        if position < 0:
            position = len(self.childrens) + 1 + position
        
        self.childrens.insert(position, node) # add the children node
    
        return
        
    def delete_children(self, name):
        """ 
        """
        self.childrens = filter(lambda x: x.name != name, self.childrens)
        return
    #@-node:Edit tree
    #@+node:Network operations
    #@+at
    # This are the only methods of ConcurrentEditable.ConcurrentEditableServer 
    # that truly require to be implemented (are virtual methods) because they 
    # are dependent of the network comunication implementation.
    #@-at
    #@@c
    #@-node:Network operations
    #@+node:send operation
    
    def send_operation(self, site_index, t_op):
        """
        This function is called by apply.
        This method should be overwritten for real network transmision. 
        Test implementation is presented here.
        I repeat, This method should be overwritten to send the object over the network.
        """
        
        perspective = self.indexed_sites[site_index]
        if not perspective: # perspective can be None if the site_index slot is aviable
            return # nothing to do
            
        if 0: # dummy code
            if dbg>=1: print "send_op; sending to S%s %s"%(site_index, t_op)
            global sent_test_operations
            sent_test_operations.append(t_op)
            
        else: # real implementation
                    
            if t_op["type"] == "Insert":
                t_function_name = "insert_text"
            elif t_op["type"] == "Delete":
                t_function_name = "delete_text"
            else:
                raise LeoError("Unknown operation type")
            
            
            if not simulate_delay_line:	# send the operation
                deffered = perspective.callRemote( t_function_name, t_op["pos"], t_op["data"], 
                                                                      timestamp = t_op["timestamp"], source_site = t_op["source_site"],
                                                                      who = t_op.get("who", None)
                                                                     )
                deffered.addErrback(raiseLeoError, "could not send the operation %s to the site S%s"%(t_op, site_index))
            else:
                def do_it(*args):
                    """
                    Dummy callback
                    """
                    deffered = self.indexed_sites[site_index].callRemote( t_function_name, t_op["pos"], t_op["data"], 
                                                                          timestamp = t_op["timestamp"], source_site = t_op["source_site"],
                                                                          who = t_op.get("who", None)
                                                                         )
                    deffered.addErrback(raiseLeoError, "could not send the operation %s to the site S%s"%(t_op, site_index))
                    return
                    
                max_time = simulate_delay_line
                defer.Deferred().setTimeout(random.random()*max_time, do_it) #create a delay before the call
                
            # end of real implementation
            
        return
    #@nonl
    #@-node:send operation
    #@+node:send text
    def send_text(self, site_index, new_text):
        """
        This method should be overwritten for a networked implementation.
        Here only code for testing.
        I repeat, This method should be overwritten to send the object over the network.
        """
    
        assert type(new_text) is unicode, LeoError("Text data is managed as unicode data")
        
        if 0: # dummy code
            if dbg>=1: print "send_text; setting S%s base text as '%s'"%(site_index, new_text)
            # dummy no delay implementation, obviously should be overwritten for real network transmisions.
            self.indexed_sites[site_index].set_text(new_text) 
            
        else: # real implementation
            deffered = self.indexed_sites[site_index].callRemote( "set_text", new_text )
            deffered.addErrback(raiseLeoError, "could not send the new text to set into the site S%s (text: '%s')"%(site_index, new_text))
            
            # end of real implementation
            
        return
    
    #@-node:send text
    #@+node:Persistence
        
    #def __getstate__(self,): # should implement this to control the persistence of the outline.
    # """should disconnect every client and then persist"""
    #	return
    #@nonl
    #@-node:Persistence
    #@-others
    

class Copy_cnode(pb.Copyable, CollaborativeNode):
    """
    This subclass allow to send copies of the object over the net wires. (Jellysable)
    (used for a test idea)
    """
    pass
#@-node:class CollaborativeNode
#@+node:Web (LeoServer.py)
#@@language python
#@+at
# This are the class definitions used to render us beauty outline over the 
# WWW.
# 
# The web rendering is done using the Woven component of Twisted.
# Look at the twisted documentation to see how to use Woven.
#@-at
#@@c

from twisted.python import components
from twisted.web.woven import page, interfaces, model, widgets
from twisted.web import server, microdom, static



#@-node:Web (LeoServer.py)
#@+node:Pages classes
class LeoServerWeb(page.Page):
    """
    The front page of the LeoServer.
    """
    
    templateFile = "LeoServerWeb.xhtml"
    templateDirectory ="./templates/"
    
    #def wchild_LeoStyle(self, request):
    #	return static.File("./templates/LeoStyle.css")
        
    def render(self, request):
        request.setHeader("Content-type", "text/html; charset=utf-8")
        return page.Page.render(self, request)
        
    def getDynamicChild(self, name, request):
        
        name = unicode(name, "utf-8")
        try:
            child = LeoNodeWeb( model.adaptToIModel( filter(lambda x:x.name == name, self.model.original.root_node.childrens)[0] ) )
        except:
            child = None
            
        return child
        
    
class LeoNodeWeb(page.Page):
    """
    One node in the huge outline.
    """
    
    templateFile = "LeoNodeWeb.xhtml"
    templateDirectory = "./templates/"

    #def wchild_LeoStyle(self, request):
    #	return static.File("./templates/LeoStyle.css")

    def render(self, request):
        request.setHeader("Content-type", "text/html; charset=utf-8")
        return page.Page.render(self, request)

    def getDynamicChild(self, name, request):
        
        name = unicode(name, "utf-8")
        try:
            child = LeoNodeWeb( model.adaptToIModel( filter(lambda x:x.name == name, self.model.original.childrens)[0] ) )
        except:
            child = None
            
        return child

#@-node:Pages classes
#@+node:Model adaptator
#@+at
# We define an adaptator to let Woven access the CollaborativeOutline model.
#@-at
#@@c

def get_node_name(t_node):
    """
    Helper function that normalize a node name to publish it via web
    """
    return t_node.name.encode("utf-8").replace("&sl;", "/")
    
class CollaborativeOutlineModel(model.MethodModel):
    """
    Model for the outline structure. The root node.
    
    When the MyDataModel adapter is wrapped around an instance
    of MyData, the original MyData instance will be stored in 'original'
    """
    
    def wmfactory_childrens(self, request):
        return map(lambda x: model.Link(x.name.encode("utf-8"), get_node_name(x)), self.original.root_node.childrens)
    
    def wmfactory_name(self, request):
        return get_node_name(self.original.root_node)
    
    def wmfactory_text(self, request):
        return self.original.root_node.get_text().encode("utf-8")
    
    def wmfactory_online_users(self, request):
        return self.original.users.keys()
            
    def wmfactory_users(self, request):
        ret = []
        for k in self.original.root_node.users.keys():
            num = len(self.original.root_node.users[k])
            if num > 1:
                ret.append('%s (%i)'%(str(k), num) )
            else:
                ret.append(str(k))
        return ret

    
class CollaborativeNodeModel(model.MethodModel):
    """
    Model for the nodes of the outline. The subnodes.
    
    When the MyDataModel adapter is wrapped around an instance
    of MyData, the original MyData instance will be stored in 'original'
    """
    
    def wmfactory_title(self, request):
        return self.wmfactory_name(request)
        
    def wmfactory_name(self, request):
        return get_node_name(self.original)
        
    def wmfactory_content(self, request):
        return self.wmfactory_text(request)

    def wmfactory_text(self, request):
        return self.original.get_text().encode("utf-8")

    def wmfactory_HB(self, request):
        return map(lambda x: str(x), self.original.HB) 
        
    def wmfactory_delayed_operations(self, request):
        return map(lambda x: str(x), self.original.delayed_operations)

    def wmfactory_base_text(self, request):
        return self.original.base_text.encode("utf-8")

    def wmfactory_MSV(self, request):
        return self.original.minimum_state_vector

    def wmfactory_users(self, request):
        return self.wmfactory_editing_users(request)
            
            
    def wmfactory_editing_users(self, request):
        """
        return the list of the name of the users collaborating in this node.
        """
        
        clients = self.original.get_clients() # a list of client perspectives
        users = self.original.users # dictionary that map names to OutlinePerspectives
                
        names = filter(lambda k: filter(lambda x: x.client in clients, users[k]), users.keys())
        
        return names


    def wmfactory_visiting_users(self, request):
        """
        return the list of the users visiting this node (via LeoN, not via web)
        """
        ret = []
        for k in self.original.users.keys():
            num = len(self.original.users[k])
            if num > 1:
                ret.append('%s (%i)'%(str(k), num) )
            else:
                ret.append(str(k))
        return ret

    def wmfactory_permissions(self, request):
        return self.original.permissions
        
    def wmfactory_childrens(self, request):
        return map(lambda x: model.Link(x.name.encode("utf-8"), get_node_name(x)), self.original.childrens)
    
    def wmfactory_parents(self, request):
        # will only return back, but indicate that there are more possible parents
        # one node, a priori, have not "one url", but has many, urls. As we can not choice, do not show it.
        # ideally, only the direct parent should be show as a link, the rest as plain text. <<<
        return map(lambda x: model.Link( "..", get_node_name(x)), self.original.parents)

    
components.registerAdapter(CollaborativeOutlineModel, CollaborativeOutline, interfaces.IModel)
components.registerAdapter(CollaborativeNodeModel,    CollaborativeNode,    interfaces.IModel)
#@nonl
#@-node:Model adaptator
#@-others


if __name__ == '__main__':
    print "Starting LeoServer, without persistence nor logs.\n(use 'LeoServer.tac' for real server usage)"
    app = create_application()
    s   = service.IService(app)
    s.startService()
    reactor.run()
    print "LeoServer finished."

#@-node:@file LeoServer.py
#@-leo
