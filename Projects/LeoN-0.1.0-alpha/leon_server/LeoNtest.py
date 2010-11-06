#!/usr/bin/env python2.3
# -*- coding: utf-8 -*-
#@+leo-ver=4
#@+node:@file LeoNtest.py
#@@first
#@@first

#@+at
# Automatic tests for the Leo over Network code.
#@-at
#@@c

#@<< legal declaration >>
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

#@<< LeoNtest docs >>
#@+node:<< LeoNtest docs >> (about LeoN tests)
#@+at
# Probably the third most important element for sucessfull code development 
# are the tests.
# The test suite for LeoN is centralized the "LeoNtest.py" script.
# 
# Both CollaborativeOutline and LeoServer provide they own automated unit 
# tests.
# 
# CollaborativeOutline execute a test similar to the original paper typical 
# example.
# LeoServer execute a test between a raised server and a SimpleClient object 
# (that only print the command received). The correctness of the execution can 
# be checked if no error is raised, if the printed information is consistent 
# and if the webpage publishing is consistent too.
# 
# LeoClient tests are more difficults, because they require network events.
# By the moment I have not figured a clean way to get the defered objects of 
# the client side.
# The file "LeoNtest.leo" provide a simple demo outline and some executable 
# nodes.
# The executable nodes allow to automatize some predefined actions on the 
# client. By the moment we use a timing system to be sure that the network 
# event has been realized.
# Client side tests are somewhat incipients.
# 
# LeoNtest.py will supose that the his directory contain an executable file 
# named "leon.py" that correspond to a symbolic link to the "leo.py" file a 
# Leo distribution that has already LeoN installed and enabled.
# 
# Use "LeoNtest.py -h" to see the options of the tests execution. ("usage" 
# child node)
#@-at
#@@c
#@nonl
#@-node:<< LeoNtest docs >> (about LeoN tests)
#@nl
#@<< usage >>
#@+node:<< usage >>
#@@color 
#@@language python
# LeoNtest.py usage string

usage= \
"""
Understood options:
    'no_server', run only the concurrent editable tests;
    'just_server', ommit the concurrent editable tests;
    '1', run server tests and open one client;
    '2', run server tests and open two clients;
    'save_tap', if run the server test, will create a '.tap' twisted server file at shutdown;
    'help' or '-h', show this help message
    if no option, will run all tests.
    
Example:
    'LeoNtest.py 1 save_tap'
"""
#@-node:<< usage >>
#@nl

#@+at
# Usefull classes to test the core client <-> server comunication.
#@-at
#@@c

from twisted.trial.unittest import deferredResult
#from twisted.trial import unittest; #from twisted.trial.unittest import TestCase as TwistedTestCase
import unittest


from twisted.spread import pb
from twisted.cred import credentials
from twisted.internet import reactor

import os, signal
import sys


#@+others
#@+node:unittest doc
#@+at
# The Twisted tricks,
# 
# from twisted.trial import unittest
# result = unittest.deferredResult(theDeferred)
# reactor.iterate() # execute all pending tasks, and return
#@-at
#@@c


#@+at
# class TestCase(__builtin__.object)
#         A class whose instances are single test cases.
# By default, the test code itself should be placed in a method named
# 'runTest'.
# If the fixture may be used for many test cases, create as
# many test methods as are needed. When instantiating such a TestCase
# subclass, specify in the constructor arguments the name of the test method
# that the instance is to execute.
# Test authors should subclass TestCase for their own tests. Construction
# and deconstruction of the test's environment ('fixture') can be
# implemented by overriding the 'setUp' and 'tearDown' methods respectively.
# If it is necessary to override the __init__ method, the base class
# __init__ method must always be called. It is important that subclasses
# should not change the signature of their __init__ method, since instances
# of the classes are instantiated automatically by parts of the framework
# in order to be run.
#@-at
#@@c


#@+at
#     import unittest
#     class IntegerArithmenticTestCase(unittest.TestCase):
#         def testAdd(self):  ## test method names begin 'test*'
#             assertEquals((1 + 2), 3)
#             assertEquals(0 + 1, 1)
#         def testMultiply(self):
#             assertEquals((0 * 10), 0)
#             assertEquals((5 * 8), 40)
#     if __name__ == '__main__':
#         unittest.main()
#@-at
#@@c	
        
#@+at
# TestSuite = unittest.TestSuite()
# TestSuite.addTest(unittest.FunctionTestCase(TestConcurrentEditable1))
# TestSuite.addTest(unittest.FunctionTestCase(TestConcurrentEditable2))
# TestSuite.addTest(unittest.FunctionTestCase(TestConcurrentEditableServer))
# unittest.TextTestRunner(verbosity).run(TestSuite)
#@-at
#@@c

#@+at
# class IntegerArithmenticTestCase(unittest.TestCase):
#     """
#     A dummy test case, to test unittest
#     """
#     def setUp(self):
#         print "setup called"
#         return
#     def tearDown(self):
#         print "teardown called"
#         return
# 
#     def runTest(self):
#         print "runTest: I run the test"
#         return
#     def _testMultiply(self):
#         print "mult"
#         #print "dir(self)", dir(self)
#         self.assertEquals((0 * 10), 0)
#         self.assertEquals((5 * 8), 40)
#     def _testAdd(self):
#         print "add"
#         self.assertEquals((1 + 2), 3)
#         self.assertEquals(0 + 1, 1)
# if __name__ == "__main__":
#     unittest.main()
#     sys.exit(0)
#@-at
#@@c
#@-node:unittest doc
#@+node:deprecated_code
#@+at	
# print "Start of test."
# pid = os.fork() # how to do the same in Windows ?
# 
# if pid == 0:
#     # I'm the children
#     # start the server
# 
#     import LeoServer
#     print "Starting server."
#     server_app = LeoServer.main(save=0, delay_line=0, run=0)
#     print "Server finished."
# else:
#     # I'm the parent
#     #print "waiting one seconds."
#     #import time
#     #time.sleep(1)
#     os.kill(pid, signal.SIGTERM)
#     print "End of LeoNtesting."
#@-at
#@@c
#@nonl
#@-node:deprecated_code
#@+node:class TestServer
class TestServer(unittest.TestCase): #(TwistedTestCase): #(unittest.TestCase):
    """
    This class implement a state machine for testing the server and the client functionallities.
    
    One test enable the following step !
    """
    
    def __init__(self, server_app):
        
        unittest.TestCase.__init__(self)
        
        self.sever_app = server_app
        return
    
    def setUp(self):
        """
        Make 'run' the LeoServer application
        """
        from twisted.application import service
        print "Starting LeoServer services."
        app = LeoServer.create_application()
        s   = service.IService(self.sever_app)
        s.startService()
        reactor.iterate() # execute all pending tasks, and return
 
        return
        
    def tearDown(self):
        """
        End of test
        """
        #Disconnect users.
        # End Of Test
        
        try:	
            del self.user1_outline
            del self.p_admin_user
            del self.p_user1
            del self.p_user2
        except:
            pass
                
        #reactor.stop() # not a good idea
        #raise KeyboardInterrupt
        return
                
    def runTest(self,):

        # Start the tests		
        # call the other methods, in the "correct" order.
        
        # admin tests
        self._testAdminLogin()
        self._testAdminCreateAccounts()
        self._testAdminLogout()
        
        self._testUsersLogin()
        self._testChat()
        self._testUsersPresence()
        
        self._testNodeOperations()
        self._testTreeUploadDownload()
        self._testCollaboration()
        
        print "waiting one seconds."; import time; time.sleep(1) # give time to the server to flush all his tasks
        
        self._testUsersLogout()
        
        return
    
    #@    @+others
    #@+node:Admin tests
    def _testAdminLogin(self):
        """
        The admin user login
        """
    
        #Login the admin
        t_factory = pb.PBClientFactory()
        reactor.connectTCP("localhost", pb.portno, t_factory, timeout = 10)	
        t_client = simpleLeoClient()
        deferred = t_factory.login(credentials.UsernamePassword("admin_user", "admin"), t_client) #user, pw, 
        result = deferred_result(deferred) 	
        #        deferred_result(deferred) : wait for deferred to occur (reactor.iterate until it return), and return the value or raise an exception
        self.avatar_admin_user = result
        
        
        # request the admin perspective to the "/" node
        deferred = self.avatar_admin_user.callRemote("get_perspective", "admin_outline", u"/")
        result = deferred_result(deferred)
            
        #Store admin_user perspective.		
        self.p_admin_user = result
    
        return
    
    def _testAdminCreateAccounts(self):
        """
        The admin create some accounts
        """
    
        #Create user2
        deferred = self.p_admin_user.callRemote("create_account", "user2", "pass2")
        result = deferred_result(deferred)
    
    
        #setup the permissions for user2	
        deferred =		self.p_admin_user.callRemote("set_permissions", "user2", u"/", ["Read", "Node_edit", "Tree_edit"]) #everything except, Admin_node
        result = deferred_result(deferred)
        
        return
        
        
    def _testAdminLogout(self):
        """
        The admin user logout
        """
        
        print "Disconnecting the Admin user"
        self.avatar_admin_user.broker.transport.loseConnection()
        
        return
    #@-node:Admin tests
    #@+node:Users tests
            
    def _testUsersLogin(self):
        """
        User 1 and User2 login
        """
        
        #Login user1.
        self.user1_factory = t_factory = pb.PBClientFactory()
        reactor.connectTCP("localhost", pb.portno, t_factory, timeout = 10)
        deferred = t_factory.login(credentials.UsernamePassword("user1", "pass1"), simpleLeoClient(name="user1")) 
        self.avatar_user1 = result = deferred_result(deferred)
                                  
        # request the perspective to the "/" node
        deferred = self.avatar_user1.callRemote("get_perspective", "outline", u"/")
        self.p_user1 = result = deferred_result(deferred)
    
        
        #Login user2.		
        self.user2_factory = t_factory = pb.PBClientFactory()
        reactor.connectTCP("localhost", pb.portno, t_factory, timeout = 10)
        deferred = t_factory.login(credentials.UsernamePassword("user2", "pass2"), simpleLeoClient(name="user2")) 
        self.avatar_user2 = result = deferred_result(deferred)
                                  
        # request the perspective to the "/" node
        deferred = self.avatar_user2.callRemote("get_perspective", "outline", u"/")
        self.p_user2 = result = deferred_result(deferred)
    
        return
        
    def _testChat(self):
        """
        Users1 and User2 do a chat
        """		
    
        ##User 2 send message to user1.
        deferred = self.p_user2.callRemote("send_message", "user1", "Hello user1")
        result = deferred_result(deferred)
        
        #User 2 send a messsage to the _room
        deferred = self.p_user2.callRemote("send_message", "_room", "Hello there in the room")
        result = deferred_result(deferred)
        
        return
    
    
    def _testUsersPresence(self):
        """
        User can broadcast they presence
        """
        
        #User1 set his persence
        deferred = self.p_user1.callRemote("set_presence","working")
        result = deferred_result(deferred)
        
        return
    
    def _testUsersLogout(self):
        """
        Users logout
        """
    
        #print ">>Omitting users logout<<"; return
        
        print "User1 disconnecting"
        self.avatar_user1.broker.transport.loseConnection()
        
        print "User2 disconnecting"
        self.avatar_user2.broker.transport.loseConnection()
        
        
        return
    
    #@-node:Users tests
    #@+node:Outline tests
    #@+others
    #@+node:test node operations
    
    def _testNodeOperations(self):
        """
        Users create and move nodes
        """
        
        #User1 request the outline.
        deferred = self.p_user1.callRemote("get_outline")
        result = deferred_result(deferred)
            
        #Obtain user1 outline.
        self.user1_outline =  result # it is an outline
        print 'UserOne outline,',  self.user1_outline
        
        #User1 create test_node1
        deferred = self.p_user1.callRemote("create_node", u"/test_node1", text=u"This is the node created by user1\ntest for paragraphs\nanother test for paragraphs.\n\nQuién dijo que no podían usarse tildes? \n")
        result = deferred_result(deferred)
        
        #User2 create test_node2
        deferred = self.p_user2.callRemote("create_node",u"/tèst_node2", text=u"This is the node created by user2")		
        result = deferred_result(deferred)
            
        #User1 move test_node2 under test_node1
        deferred = self.p_user1.callRemote("move_node",u"/tèst_node2", u"/test_node1/tèst_node2", position=-1 )
        result = deferred_result(deferred)
        
        #User2 select test_node2 
        deferred = self.p_user2.callRemote("select_node",u"/test_node1/tèst_node2")
        result = deferred_result(deferred)
        
        print "Content of the selected node: '%s'"%(result)
        #User2 lock test_node2 
                    
        #An user create a node
        deferred = self.p_user1.callRemote("create_node", u"/test_node1/tèst_node2/temporal_node")
        result = deferred_result(deferred)
        
        #Move a node from one place to another
        deferred = self.p_user2.callRemote("move_node", u"/test_node1/tèst_node2/temporal_node", u"/test_node1/temporal_node")
        result = deferred_result(deferred)
        
        #An user delete a node
        deferred = self.p_user1.callRemote("delete_node", u"/test_node1/temporal_node")
        result = deferred_result(deferred)		
    
        #User1 create a clone
        deferred = self.p_user1.callRemote("create_clone",u"/test_node1/tèst_node2", u"/", position=-1 )
        result = deferred_result(deferred)
        
        #User2 obtain the clone contents
        deferred = self.p_user2.callRemote("select_node",u"/")
        result = deferred_result(deferred)    
        print "Content of the selected node: '%s'"%(result)
    
        return
    #@-node:test node operations
    #@+node:test upload/download nodes
        
    def _testTreeUploadDownload(self):
        """
        Users upload a tree (with clones) and download it
        """
        # user1 upload, user2 download; then we compare
    
        # User1 request the outline.
        deferred = self.p_user1.callRemote("get_outline")
        result = deferred_result(deferred)
        
        # Obtain user1 outline.
        self.user1_outline =  result # it is an outline
        print 'UserOne refreshed outline,',  self.user1_outline
        
    
        # user1 Upload data
        parent_path = u"/tèst_node2" # that is a clone node
        position = -1 # append to under the last child
        data = ([(u"dnö&sl;\\de1",u""),(u"dnode2",u""),(u"dnod€/\\3",u""),(u"dnode4",u"")], [0,[1, 3,[2, 1], 1, 2, 3, 1]]) 
        # node3 include  an intentional client side bug, to check server side robustness
        deferred = self.p_user1.callRemote("upload_outline", parent_path, position, data) 
        result = deferred_result(deferred)
    
        # user2 Download data
        deferred = self.p_user1.callRemote("download_outline", u"/tèst_node2/dnö&sl;\\de1")
        result = deferred_result(deferred)
        result_data, warnings = result
        
        def hrf(nodes_list, nodes_hierarchy):
            """
            helper recursive function, replace the node hierarchy by a data node hierarchy, to make data comparable
            """
            t_list = []
            for t_item in nodes_hierarchy:
                if type(t_item) is int:
                    t_node = nodes_list[t_item]
                    t_list.append((t_node[0].replace("/", "&sl;"), t_node[1]))
                elif type(t_item) is list:
                    t_list.append(hrf(nodes_list, t_item))
                else:
                    raise "Nodes hierarchy element type error %s %s" % (type(t_item), t_item)
            return t_list
    
        #print data; print result_data # just for debugging
             
        data = hrf(data[0], data[1])
        result_data = hrf(result_data[0], result_data[1])
        
        #print data; print result_data # just for debugging
        
        self.assertEqual(data, result_data) # upload and download data should preserve his integrity
        
        return
        
    
    
    #@-node:test upload/download nodes
    #@-others
    #@-node:Outline tests
    #@+node:Collaboration tests
    def _testCollaboration(self):
        """
        Users use a node to colaborate
        """		
            
        deferred = self.p_user2.callRemote("collaborate_in")
        result = deferred_result(deferred)
        print "<user2> results of collaborate_in :", result
            
        #User2 edit test_node2 
        deferred = self.p_user2.callRemote("insert_text", 0, u"This node was edited by user2.", [1])
        result = deferred_result(deferred)
        
        #User2 unlock test_node2 
        deferred = self.p_user2.callRemote("collaborate_out")
        result = deferred_result(deferred)
    
    
        #User1 select test_node2 		
        deferred = self.p_user1.callRemote("select_node",u"/test_node1/tèst_node2")
        content = result = deferred_result(deferred)
        
        #User1 lock test_node2 
        print "<user1> content of the selected node: '%s'"%(content)
        
        n = len(content.split('\n')[0]) # will delete the first line.
        
        deferred = self.p_user1.callRemote("collaborate_in")
        result = deferred_result(deferred)
        
        #User1 edit test_node2 
        print "<user1> will delete text in", 0, " to " , n
        deferred = self.p_user1.callRemote("delete_text", 0, n, [1]) 
        result = deferred_result(deferred)
        
        #User1 unlock test_node2 
        deferred = self.p_user1.callRemote("collaborate_out")
        result = deferred_result(deferred)
        
        deferred = self.p_user1.callRemote("select_node",u"/test_node1/tèst_node2")
        result = deferred_result(deferred)
        print "<user1> received after selecting /test_node1/tèst_node2:", result
        
        deferred = self.p_user1.callRemote("collaborate_in")
        result = deferred_result(deferred)		
        print "<user1> received after collaborate_in :", result
        
        deferred = self.p_user2.callRemote("select_node",u"/test_node1/tèst_node2")
        result = deferred_result(deferred)
        print "<user2> received after selecting /test_node1/tèst_node2:", result
        
        deferred = self.p_user2.callRemote("collaborate_in")
        result = deferred_result(deferred)		
        print "<user2> received after collaborate_in :", result
        
        deferred = self.p_user2.callRemote("insert_text", 0, u"ÄBCD", [2,1])
        result = deferred_result(deferred)
    
        deferred = self.p_user1.callRemote("insert_text", 0, u"ÉFG\n", [2,0])
        result = deferred_result(deferred)
    
        return
    #@nonl
    #@-node:Collaboration tests
    #@-others
#@-node:class TestServer
#@+node:class simpleLeoClient
class simpleLeoClient(pb.Referenceable):
    """
    Methods that the server can access on the client location.
    This class is used to do the unit tests.
    """

    def __init__(self, name='me'):
        """
        The init is suposed to connect the plugin to a runing Leo program.
        """
        
        # init normally
        # pb.Referenceable.__init__(self) # Referenceable has no init
        
        self.name = name
        
        # create the interfaces
        perspective_methods = [ \
        'post_message',
        'post_presence',
        'create_node',
        'create_clone',
        #'update_node',# deprecated
        'delete_node',
        'move_node',
        'paste_outline',
        'set_cursor_position',
        'set_text',
        'insert_text',
        'delete_text' ]

        # prepend can be 'remote_', 'view_', or 'perspective_'
        for t_method in perspective_methods:
            setattr(self, 'remote_'+ t_method, getattr(self, t_method)) 



        self.outline = None # the local outline
        
        return


    def es(self, text, color=None):
        """
        print some text
        """
        print "<client %s>" % self.name, text
        return
    
    def post_message(self, sender, txt):
        """
        Print on the client screen the recieved message.
        """	
        print "<%s to %s>"%(sender, self.name), txt
        
        return
    
        
    def post_presence(self, who, state):
        """ 
        Update the state of someone.
        """
        print "<LeoServer to %s> %s is %s"%(self.name, who, state)
        return
        
    def create_node(self, node_path, position=-1):
        """ 
        Add a node to the local outline.
        """
        print "<%s>"% self.name, "Creating node ", node_path, "position", position
        
        return
        
        
    def create_clone(self, twin_path, parent_path, position=-1):
        """ 
        Add a node to the local outline.
        """
        print "<%s>"% self.name, "Creating clone of %s at %s %i" % ( twin_path, parent_path, position )
        
        return

#@+at
#     def update_node(self, node_path, content):
#         """
# 
#         """
# 
#         print "Updating the content of the node ", node_path
#         print content
# 
#         return
#@-at
#@@c
        
    def delete_node(self, node_path):
        """ 
        
        """
        
        print "<%s>"% self.name, "Erasing the local node ", node_path
        return
        
    def move_node(self, node_path, new_node_path, position=-1):
        """ 
        Allow moving and renaming nodes.
        """
        
        print "<%s>"% self.name, "Moving node from %s to %s, position %i"%(node_path, new_node_path, position)
        return


    def paste_outline(self, *args):
        """ 
        insert an outline
        """
        
        print "<%s>"% self.name, "pasting the received outline at %s pos %s" % (args[0], args[1])
        #data = args[2]
        return

        
    def set_cursor_position(self, who, line, col):
        """ 
        Define the new position of someone cursor
        """
        
        return


    def set_text(self, text):
        """
        """
        
        print "<%s>"% self.name, "Setting text as:\n'%s'" % text
        
        return
        
    def insert_text(self, *args, **kws):
        """ 
        Some one insert text on the actual node
        """
        
        print "<%s>"% self.name, "Insert text %s %s"%(args, kws)

        return
        
    def delete_text(self, *args, **kws):
        """ 
        Some one delete text on the actual node
        """
        
        print "<%s>"% self.name, "Delete text %s %s"%(args, kws)
                
        return
#@nonl
#@-node:class simpleLeoClient
#@+node:def deferred_result
def deferred_result(d):
    """
    Shorcut to obtain more verbose errors
    """
    d.addErrback(exception)
    return deferredResult(d)
    
    

def exception(reason):
    """
    'reason' should be a Failure (or subclass) holding the MyError exception, reason.(type , getErrorMessage, __class__)
    """
    
    #print dir(reason)
    raise "%s %s"%(reason.__class__, reason.type), reason.getErrorMessage() + '\n' + reason.getTraceback()
    #reactor.stop()  # "http://locahost:8788 still up for inspection."
    return
    
#@-node:def deferred_result
#@-others

if __name__ == "__main__":
    
    if ("help" in sys.argv) or ("-h" in sys.argv):
        print usage
        sys.exit(0)
        
    print "Start of tests."
    the_test_suite = unittest.TestSuite()
   
    if not reduce(lambda x,y: x + (y in sys.argv), ["1", "2", "just_server"], 0): # non of that options are in sys.argv
        # run the ConcurrentEditable tests (instead of waiting one second...)
        import ConcurrentEditable
        t_test_suite = ConcurrentEditable.get_test_suite() # run the default tests
        the_test_suite.addTest(t_test_suite)


    if "no_server" in sys.argv:
        print "Omiting server tests"
        unittest.TextTestRunner().run(the_test_suite)	
        sys.exit(0)
    
        
    # create the server application
    import LeoServer
    server_app = LeoServer.create_application(delay_line=0)	

    # create the server testsuite
    the_test_suite.addTest(TestServer(server_app))
    
    unittest.TextTestRunner().run(the_test_suite)	
    
    
    print "End of LeoNtest."
    
    # let the server running
    print "Look at http://localhost:8788 for the results"
    
    if ("1" in sys.argv) or ("2" in sys.argv):
        os.system("./leon.py LeoNtest.leo &") # LeoNtest.leo contain nodes for automatic test sequence execution on the clien side.
        
    if "2" in sys.argv:
        os.system("./leon.py LeoNtest.leo &") # run a second instance
        
    
    reactor.run() # keep the LeoServer running
    
    if "save_tap" in sys.argv:
        from twisted.persisted import sob
        per  = sob.IPersistable(server_app)
        from twisted.application import service
        t_filename = "%s-shutdown.tap" % service.IService(server_app).name
        print "Creating the %s file." % t_filename
        print "'.tap' files are executed with 'twistd'.\n'twistd -f %s' for normal usage. 'twistd -nf %s' for debugging.\nSee 'twistd' help for avanced options" % (t_filename, t_filename)
        per.save(filename= t_filename)

    print "Finishing the LeoNtest services."
#@nonl
#@-node:@file LeoNtest.py
#@-leo
