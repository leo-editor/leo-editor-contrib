#!/usr/bin/env python2.3
# -*- coding: utf-8 -*-
# -*- test-case-name: LeoNtest -*-
#@+leo-ver=4
#@+node:@file LeoClient.py
#@@first
#@@first
#@@first
#@+at
#     LeoClient the Leo over network client side code.
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

import sys, os

from Tkinter import *
from Tkconstants import *
import tkMessageBox

# misc modules
import colorsys, random

from twisted.spread import pb
from twisted.cred import checkers, portal, credentials
from twisted.internet import reactor

# the collaboration structures, classes and algorithm are developed, contained and tested in another module.
from ConcurrentEditable import ConcurrentEditableClient, ConcurrentEditable, Operation

from LeoServer import Copy_cnode, CollaborativeNode #for colaborative node class definition
from LeoServer import LeoError # used to trap errors

class Received_cnode(pb.RemoteCopy, CollaborativeNode): # the jelly received will be reconstructed on this class
    pass

pb.setUnjellyableForClass(Copy_cnode, Received_cnode)

#@+others
#@+node:Plugin
#@+at
# 
# The code for merging installing the Plugin can be found at mod_LeoN.py
# 
# Here are all the related methods, and  ugly tricks.
#@-at
#@@c

try:
    from leoPlugins import *
    from leoGlobals import *
    import leoTree
    import leoNodes
    import leoUndo
except:
    # not running as a plugin, probably used for tests or for the server code.
    
    # create a dummy leoNodes
    class struct:
        pass
    
    leoNodes = struct()
    leoNodes.baseVnode = struct
    # end of dummy leoNodes
    
    # dummy leoTree
    #leoTree = None
    
else:
    pass
#@-node:Plugin
#@+node:class leoN_vnode
class leoN_vnode(leoNodes.baseVnode):
    """
    Custom vnode class with extra methods.
    """
    
    #@    @+others
    #@+node:isOnline
    def isOnline(self):
        """ 
        return true if the node is online (connected over the network)
        """
        
        return hasattr(self, "client") and self.client.perspective
    #@nonl
    #@-node:isOnline
    #@-others

#@-node:class leoN_vnode
#@+node:onStart1 (replace the mainloop)
def onStart1(tag, keywords):
    """
    Overwrite Leo's MainLoop and finishQuit to manage the Twisted reactor.
    
    # the first thing that we need to do is to install us in the Tkinter loop.
    from twisted.internet import tksupport
    root = app().root
    # Install the Reactor support
    tksupport.install(root)

    from twisted.internet import reactor
    import leon
    leon.mainloop = reactor.run # overwrite the mainloop function
    """

    # the first thing that we need to do is to install us in the Tkinter loop.
    from twisted.internet import tksupport
    from twisted.internet import reactor
        
    root = app().gui.root
    # Install the Reactor support
    tksupport.install(root)
    
    #root.protocol('WM_DELETE_WINDOW', reactor.stop) # not a good idea because already overwritten, has to intercept finishQuit
    
    #@    @+others
    #@+node:runMainLoop
    def runMainLoop(*args):
        """the LeoN mainloop"""
        print "starting LeoN."
        reactor.run()
        return
    #@nonl
    #@-node:runMainLoop
    #@+node:destroySelf
    def destroySelf(self):
    
        if 0: # Works in Python 2.1 and 2.2.  Leaves Python window open.
            self.root.destroy()
            
        else: # Works in Python 2.3.  Closes Python window.
            self.root.quit()
            
        reactor.stop() # stop everything <<<<<<<<<<<<<
        return
    #@-node:destroySelf
    #@-others

    app().gui.runMainLoop = runMainLoop # overwrite the mainloop function
    funcToMethod(app().gui, destroySelf, "destroySelf" ) # overwrite the exit function     #app().gui.destroySelf = destroySelf  
    
    return




#@+at
# """This module integrates Tkinter with twisted.internet's mainloop.
# 
# API Stability: semi-stable
# 
# Maintainer: U{Itamar Shtull-Trauring<mailto:twisted@itamarst.org>}
# 
# To use, do::
# 
#     | tksupport.install(rootWidget)
# 
# and then run your reactor as usual - do *not* call Tk's mainloop(),
# use Twisted's regular mechanism for running the event loop.
# 
# Likewise, to stop your program you will need to stop Twisted's
# event loop. For example, if you want closing your root widget to
# stop Twisted::
# 
#     | root.protocol('WM_DELETE_WINDOW', reactor.stop)
# 
# """
#@-at
#@@c
#@-node:onStart1 (replace the mainloop)
#@+node:onStart2 (brute force hooks)
def onStart2(tag, keywords):
    """
    Do a trick onto the log frame to allow insertion of the chat bar.
    Install some modified routines to manage the users actions (outline manipulation). 
    This are ugly incompatible tricks (only one plugin can do this without corrupting the action)
    """
    # tryck to allow chat bar insertion
    log = top().frame.log.logCtrl
    log['height'] = 1
    log['width' ] = 10
    
    # install the body tags
    body = top().frame.body.bodyCtrl
    if os.name == "posix":
        body.tag_config("to_send", relief= RAISED, borderwidth=4, background= "beige")# work fine in Linux
    else:
        body.tag_config("to_send", bg= "beige") # will it work in Windows ?

    #print "keywords@Start2 %s"%(keywords) # just for debugging

    # install the redefinitions
        
    c = keywords['c']

    # Hook setUndoParams. Store the original method and replace by local version
    import leoUndo
    leoUndo.undoer.original_setUndoParams = leoUndo.undoer.setUndoParams 
    funcToMethod(setUndoParams, leoUndo.undoer, "setUndoParams" )

    # Hook drawText. Store the original method and replace by local version
    # "draw-outline-text-box"  yes         start of tree.drawText    tree,v,x,y (note 6) <<<< COUlD USE INSTEAD ?
    import leoTkinterTree
    leoTkinterTree.leoTkinterTree.original_drawText = leoTkinterTree.leoTkinterTree.drawText
    funcToMethod(drawText, leoTkinterTree.leoTkinterTree, "drawText") # does not work , why ?
    
    # Hook OnBodyKey. Store the original method and replace by local version
    from leoTkinterFrame import leoTkinterBody
    leoTkinterBody.original_onBodyKey = leoTkinterBody.onBodyKey
    funcToMethod(onBodyKey, leoTkinterBody, "onBodyKey" )
    # need to reinstall the hook
    c.frame.body.bodyCtrl.bind("<Key>", c.frame.body.onBodyKey) # how to do not overwrite other binding, but erasing previous OnBodyKey ?

    # Hook idle_body_key. Store the original method and replace by local version
    leoTkinterBody.original_idle_body_key = leoTkinterBody.idle_body_key
    funcToMethod(idle_body_key, leoTkinterBody, "idle_body_key" )
        
    # Say Hello
    frame = top().frame
    frame.clearStatusLine()
    frame.putStatusLine("Welcome to LeoN")
    return

#@+others
#@+node:setUndoParams (principal outline actions hook) (LeoClient/Plugin/onStart2/)
def setUndoParams (self_object, undo_type, v, **keywords):
    """
    This is a Leon hook to parse all the actions realized over the outline.
    """
    
    #es( "undo_type: %s, v: %s, keywords: %s"% (undo_type, v, keywords), color="yellow") # just for debugging	
    
    d = self_object.original_setUndoParams(undo_type, v, **keywords)

    if v.isOnline():
        v.client.parse_outline_action(d)
    elif d and d.has_key("parent") and d["parent"].isOnline():
        d["parent"].client.parse_outline_action(d)        
    
        
    return d


#@-node:setUndoParams (principal outline actions hook) (LeoClient/Plugin/onStart2/)
#@+node:onBodyKey
def onBodyKey (self,event):
    """
    Handle any key press event in the body pane.
    LeoN also utilize the actual tags. This method is called before the key operation is efectued.
    """

    c = self.c ; v = c.currentVnode() ; ch = event.char
    oldSel = self.getTextSelection()
    
    if 0:
        self.keyCount += 1
        if ch and len(ch)>0: print "%4d %s" % (self.keyCount,repr(ch))    
        
    tags_ranges = {}
    #tag_names = c.frame.body.bodyCtrl.tag_names() # there are to many tags commonly tag names (see bellow)
    tag_names = ["to_send"]

    for t_name in tag_names:
        tags_ranges[t_name] = self.bodyCtrl.tag_ranges(t_name)
        
    #es("tag names %s tags_tanges %s"%(c.frame.body.bodyCtrl.tag_names(), tags_ranges), color="orange")
    
    # We must execute this even if len(ch) > 0 to delete spurious trailing newlines.
    self.bodyCtrl.after_idle(self.idle_body_key, v,oldSel,"Typing",ch, None, None, None, tags_ranges)
    
    return
    
    
# there are to many tags commonly tag names ('sel', 'to_send', 'comment', 'cwebName', 'string', 'keyword', 'docPart', 'pp', 'nameBrackets', 'leoKeyword', 'link', 'latexBackground', 'name', 'latexModeBackground', 'latexModeKeyword', 'latexKeyword', 'elide', 'bold', 'italic', 'bolditalic', 'blank') tags_tanges {'comment': (), 'cwebName': (), 'string': (), 'keyword': (), 'latexBackground': (), 'docPart': (), 'pp': (), 'elide': (), 'nameBrackets': (), 'leoKeyword': (), 'latexModeKeyword': (), 'latexKeyword': (), 'bold': (), 'link': (), 'blank': ('1.4', '1.5', '1.7', '1.8', '1.11', '1.12', '1.16', '1.17', '1.24', '1.25', '1.27', '1.28', '2.4', '2.5', '2.8', '2.9', '2.14', '2.15', '2.19', '2.20', '3.7', '3.8', '3.12', '3.13', '3.16', '3.17'), 'italic': (), 'to_send': (), 'bolditalic': (), 'sel': (), 'latexModeBackground': (), 'name': ()}
#@nonl
#@-node:onBodyKey
#@+node:idle_body_key (hook caller of ClientNode.fill_body)
def idle_body_key (self,v,oldSel,undoType,ch=None,oldYview=None,newSel=None,oldText=None,oldTagsRanges={}):	
    """
    Input parameters are different from original..
    
    Update the body pane at idle time.
    We consider the body tags as part of the state vector.
    """

    old_text = v.bodyString() # deduced from the original_idle_body_key internals logic
    
    # setUndoTypingParams is called in the idle_body_key method
    # call the original method
    self.original_idle_body_key(v,oldSel,undoType,ch=ch,oldYview=oldYview,newSel=newSel,oldText=oldText)
    
    k = dict(c=self.c,v=v,ch=ch,undoType=undoType, oldTagsRanges=oldTagsRanges, \
             oldText=oldText,oldYview=oldYview,oldSel=oldSel,newSel=newSel,)
    #es("idle_body_key %s" % k, color="orange") # just for debugging
    
    k["oldText"] = old_text # set the oldText variable
    
    # if 'online' and collaborating call the ClientNode fill_body method # this operation was previously made in onBodyKey2
    if v.isOnline() and v.client.is_collaborating():
        v.client.client_node.fill_body(k)
    
    return #"break"
#@nonl
#@-node:idle_body_key (hook caller of ClientNode.fill_body)
#@+node:drawText
def drawText(self,v,x,y):
    """
    This function create the text widget were the headstring of a vnode is edited.
    This hook add a convenient binding to this object.
    """
    
    old_name = v.headString()
    
    ret_val = self.original_drawText(v,x,y)	
    
    #text_widget = v.edit_text # on Leo 3.11
    #text_widget = v.edit_text() # on Leo 3.12
    text_widget = v.edit_text() # on Leo 4.1
    
    text_widget.bind("<FocusOut>", lambda event: node_renamed(v, old_name, v.headString()) )
    #text_widget.bind("<FocusOut>", lambda event: es("%s renamed as  %s"%(old_name, v.headString()), color="yellow"), "+") # for debuging	
    
    return ret_val
#@-node:drawText
#@+node:node_renamed (LeoClient/Plugin/onStart2/drawText/)
def node_renamed(v, old_name, new_name):
    """
    Check if it is necesarry to execute a new call.
    """
    
    if old_name != new_name and v.isOnline(): # it is necessary
    
        # we "undo" the event
        v.setHeadString(old_name)
        v.c.redraw()
        
        # protect the leoServer node
        if old_name.startswith("@leoServer"):
            v.client.es_error("LeoServer root node can not be renamed while online.")
            return
            
        # protect the system of void names
        if not new_name:
            from random import randrange
            new_name = "unamed node %c" % randrange(97,122)
            v.client.es("Online nodes require a non void name.\nWill automaticaly rename as '%s'" % new_name, color="gray")

            
        # will create a false undo action and post it to the client
        d = {}
        d["undoType"] = "Rename"
        d["v"]        = v
        d["parent"]		 = v.parent()
        d["oldParent"]= d["parent"]
        d["n"]        = v.childIndex()
        d["oldHeadString"] = old_name
        d["headString"]    = new_name
        
        v.client.parse_outline_action(d) # process this action
    
        #v.client.es("%s renamed as  %s"%(old_name, new_name), color="yellow")
    
    return
    

#@-node:node_renamed (LeoClient/Plugin/onStart2/drawText/)
#@-others
#@-node:onStart2 (brute force hooks)
#@+node:onIcondclick2 (connect or disconnect)
def onIcondclick2(tag, keywords):
    """
    connect or disconnect to the server
    """
    
    v = keywords.get("v")
    h = v.headString()

    
    if match_word(h,0,"@leoServer"):	
        if v.isOnline():
            v.client.es("Disconnecting.")
            v.client.disconnect()
        elif not getattr(v, "client", None): # check if not already processing a connection request.
            #@            <<connect to the server>>
            #@+node:<< connect to the server >>
            
            v.client = LeoClient(v) # a remote refenceable object.
            
            assert ':' in h, "Malformed server url. server:port:/url"
            
            # obtain the server description
            t_list = h[len("@leoServer"):].split(":")
            path = t_list[-1].strip()
            server = t_list[0].strip()
            if len(t_list) == 3:
                port = int(t_list[1])
            else:
                port = pb.portno #default port
            
            # obtain the login information
            try:
                t_res = v.t.bodyString.find("@login ")
                assert t_res != -1
                login, password = map(lambda x:x.strip(), (v.t.bodyString[t_res:].split('\n')[0])[len("@login "):].split(":"))
            except:	
                v.client.es_error("Could not found the '@login nickname:password' directive in the node body.")
                return
            
            v.client.es("Entering into LeoServer %s:%i:%s"%(server, port, path), color="gray")
            
            v.client.connect(server, port, path, login, password)
            
            #@-node:<< connect to the server >>
            #@nl
        
    return
#@-node:onIcondclick2 (connect or disconnect)
#@+node:onUnselect1 (collaborate out if necessary)
def onUnselect1 (tag, keywords):
    """
    Check if node flushing is necessary.
    Check if node disconnection is necessary.
    """
    
    old_v = keywords["old_v"]
    
    if old_v and old_v.isOnline():
        
        # flush the old node
        
        old_v = keywords["old_v"]
        old_v.client.flush_body(all=1)
        old_v.clearDirty() # network nodes never get dirty...

        # disconnect from the old node
        if getattr(old_v.client, "client_node"): # if connected and collaborating (client_node is the ConcurrentEditableClient ClientNode LeoClient instance)
            old_v.client.collaborate_out() # disconnect from the actual node

    return
#@nonl
#@-node:onUnselect1 (collaborate out if necessary)
#@+node:onSelect1
def onSelect1 (tag, keywords):
    """
    This is an important hook.
    Update the log panel as a chat window if necessary.
    Download the content of the actual node and 
    """
    
    v     = keywords.get("new_v")
    old_v = keywords.get("old_v")
    
    if v != old_v and v.isOnline() and not v.headString().startswith("@leoServer") and not v.client.undoing:
        #@        <<change node selection>>
        #@+node:<< change node selection >>
        #onUnselect manage the old node flushing
        
        
        # obtain the new path
        
        t_list = []
        
        path = v.client.get_node_path(v)
        
        # do remote call
        #v.client.es("selecting node '%s'" % path, color="yellow") # just for debugging
        v.client.perspective.callRemote("select_node", path).addCallback(v.client.new_node_selection, path, v).addErrback(v.client.exception)
        
        #@-node:<< change node selection >>
        #@nl
            
                
    #@    <<install/deinstall chat bar>>
    #@+node:<< install/deinstall chat bar >>
    # install/deinstall the chat bar if necessary		
        
    old_is_connected = 0
    new_is_connected = 0
    
    if v.isOnline():
        new_is_connected = 1
    
    if old_v and old_v.isOnline():
        old_is_connected = 1
    
    if new_is_connected and old_is_connected:
        if v.client == old_v.client: # still on the same branch
            # do nothing
            old_is_connected = 0 
            new_is_connected = 0
            
    
    if old_is_connected:
        old_v.client.chat_bar.pack_forget() # hide old chat bar
        
    if new_is_connected:
        v.client.chat_bar.pack(side=BOTTOM, fill=X) # show new chat bar
    #@-node:<< install/deinstall chat bar >>
    #@nl
            
    return

#@-node:onSelect1
#@+node:onBodykey1 (collaborate in if necessary)
def onBodykey1(tag, keywords):
    """
    check or requesting node locking
    if a networked node, if required flush the "to_send" strings.
    """	
    
    v = keywords["v"]
    
    if v.isOnline():
        #v.client.es("Value of v.client.client_node: %s"% v.client.client_node, color="yellow") # just for debugging
        
        # check if already collaborating or not (or at least trying to connect or not)
        if not v.client.client_node: # << this line is correct
            if keywords["undoType"] == "Typing" and keywords["ch"]: # if entered some text or deleted any element
                keywords["c"].frame.body.bodyCtrl.mark_set("insert", keywords["oldSel"][0]) # keep the Insert mark in his original place.
                v.client.collaborate_in()	# collaborate_in will connect, create a ClientNode instance and keep the index mark inplace.
                return 1 # "break" # avoid the char insertion
        
    return # have to return None to validate the keystroke
#@-node:onBodykey1 (collaborate in if necessary)
#@+node:on show-popup-menu (add networked nodes commands)
def onShowPopupMenu(tag, keywords):
    """
    doHook("show-popup-menu",c=c,v=v,event=event)
    Insert two entries to the popup menu
    """
    
    v = keywords['v']
    
    if v.isOnline(): # if node is connected to the server
        
        c = keywords['c']
        menu = c.frame.tree.popupMenu
        
        menu.insert_separator(0)
        
        if v.headString().startswith("@leoServer"):	# if it the connection root node
            menu.insert_command(0, label="Disconnect from leoServer", command = v.client.OnDisconnect)
            
        menu.insert_command(0, label="Admin networked node", command= lambda event=None: v.client.OnAdmin(v=v))
        
        #v.client.es("Inserting the Admin option to the menu", color="yellow") # just for debugging
    
    elif match_word(keywords['v'].headString(), 0, "@leoServer"):	

        menu = keywords['c'].tree.popupMenu
        menu.insert_separator(0)
        menu.insert_command(0, label="Connect to leoServer", command = 	(lambda event=None: onIcondclick2(tag, keywords) ) )
            
    return
    

#@+at
# def OnHeadlineRightClick(self,event=None):
#     try:
#         v = self ; c = v.commands
#         if not doHook("headrclick1",c=c,v=v,event=event):
#             self.commands.tree.OnActivate(self)
#             self.commands.tree.OnPopup(self,event)
#         doHook("headrclick2",c=c,v=v,event=event)
#     except:
#         es_event_exception("headrclick")
# 
#@-at
#@@c

#@+at
# def OnPopup (self,v,event):
# 
#     """Handle right-clicks in the outline."""
# 
#     # Note: "headrclick" hooks handled by vnode callback routine.
# 
#     if event != None:
#         c = self.commands
#         if not doHook("create-popup-menu",c=c,v=v,event=event):
#             self.createPopupMenu(v,event)
#         if not doHook("enable-popup-menu-items",c=c,v=v,event=event):
#             self.enablePopupMenuItems(v,event)
#         if not doHook("show-popup-menu",c=c,v=v,event=event):
#             self.showPopupMenu(v,event)
# 
#     return "break"
#@-at
#@@c
#@-node:on show-popup-menu (add networked nodes commands)
#@+node:on draw-outline-text-box
def onDrawOutlineTextBox(tag, keywords):
    """
    This function create the text widget were the headstring of a vnode is edited.
    This hook add a convenient binding to this object.
    
    This method is assotiated with the "draw-outline-text-box" plugins hook.
    # "draw-outline-text-box"  yes         start of tree.drawText    tree,v,x,y (note 6)
    """
    #tree,v,x,y
    
    es("DrawText called")
    tree = keywords["tree"]; v = keywords["v"]; x = keywords["x"]; y = keywords["y"]
        
    old_name = v.headString()
    
    ret_val = tree.drawText(v,x,y)	
    
    #@    @+others
    #@+node:rename_callback
    
    def rename_callback(v, old_name, new_name):
        """
        Check if it is necesarry to execute a new call.
        """
        
        if old_name != new_name and v.isOnline(): # it is necessary
        
            # will create a false undo action and post it to the client
            d = {}
            d["undoType"] = "Rename"
            d["v"]        = v
            d["parent"]		 = v.parent()
            d["oldParent"]= d["parent"]
            d["n"]        = v.childIndex()
            d["oldHeadString"] = old_name
            d["HeadString"]    = new_name
            
            v.client.parse_outline_action(d) # process this action
        
            v.client.es(" %s renamed as  %s"%(old_name, v.headString()), color="yellow")
        
        return
        
    
    #@-node:rename_callback
    #@-others
    
    #text_widget = v.edit_text # on Leo 3.11
    #text_widget = v.edit_text() # on Leo 3.12
    text_widget = v.edit_text() # ??? on Leo 4.1 ???
    
    text_widget.bind("<FocusOut>", lambda event: rename_callback(v, old_name, v.headString()) )
    text_widget.bind("<FocusOut>", lambda event: es(" %s renamed as  %s"%(old_name, v.headString()), color="yellow"), "+") # for debuging	

    
    if ret_val == None:
        ret_val = "override" # Anything other than None overrides.
    return ret_val

#@-node:on draw-outline-text-box
#@+node:beforeCommand (restrict commands execution)
def beforeCommand(tag,keywords):
    """
    Limit command execution over online nodes.
    This hook is attached to the "command1" plugins event.
    """
    
    #es("Calling command %s %s" % (keywords.get("label"), keywords), color="yellow") # just for debugging
    
    v = keywords.get("v")

    if v and v.isOnline():
        managed_commands = ["copynode","pastenode", "insertnode", "clonenode", "deletenode", \
                            "moveright","moveleft","movedown","moveup",\
                            "cut","copy","paste",]
        if keywords.get("label") in managed_commands: # if in the set of managed commands
            return # will execute the command normally
        else:
            v.client.es("The command '%s' is not managed for online nodes." % keywords.get("label"), color="red")
            return "override" # Anything other than None overrides.
    
    # else just quit # if not online, just quit
    return # will execute the command normally
 
        
#@-node:beforeCommand (restrict commands execution)
#@+node:afterCommand (manage some unusual commands)
def afterCommand(tag,keywords):
    """
    Parse after execution, hooked with command2
    Here some hardcoded tricks to manage unusual commands (with special internal logic or behaviour)
    """
    
    #es("Called command %s %s" % (keywords.get("label"), keywords), color="yellow") # just for debugging
    label = keywords.get("label")
    if label == "copynode":
        #@        << copy node >>
        #@+node:<< copy node >>
        # generate a call to the parse outline action function
        v = keywords["v"]
        if v.isOnline():
            v.client.es("Copied a node that is online, calling parse outline action", color="gray")
            d = {}
            d["undoType"] = "Copy Outline"
            d["v"] = v
            v.client.parse_outline_action(d)
        #@nonl
        #@-node:<< copy node >>
        #@nl
    if label == "deletenode":
        #@        << delete node >>
        #@+node:<< delete node >>
        # ugly hardcoding, made here because can not make it just before parse_outline_action, during setUndoParams
        
        t_vnode = keywords.get("v", None)
        if t_vnode and t_vnode.isOnline():
            t_vnode.client.undoing = 1
            t_vnode.c.undoer.undo() # undo operation
            t_vnode.client.undoing = 0
            #<<< should reselect the actual selection (download selected node content) ?
        #@nonl
        #@-node:<< delete node >>
        #@nl
        
    return
#@nonl
#@-node:afterCommand (manage some unusual commands)
#@+node:class LeoClient

class LeoClient(pb.Referenceable):
    """
    This class contain all the logic related to LeoN on the client side.
    It implement the relation between the LeoServer the LeoClient logic and the Leo Gui logic.
    It define some methods that the server can access on the client location.
    """
    
    def __init__(self, root_vnode):
        """
        The init is suposed to connect the plugin to a runing Leo program.
        """
        
        self.outline = None # the local outline
        self.perspective = None
        self.base_path = None
        self.root_vnode = root_vnode
        
        self.has_lock = 0 # local indicator for lock / unlock
        self.undoing  = 0 # helper variable to manage issues during undo operations
        self.client_node = None # the local ConcurrentEditableNode
                    
        # printing functions
        # asign own methods, maybe necessary for extensions. Example: non-log panel integration
        self.es = lambda text, color="gray": color!= "yellow" and es(text, color=color) # hide debug messages
        #self.es = lambda text, color="gray": es(text, color=color) # just for debugging
        self.es_error = self.es_exception = es_error
        
        # create the chat bar, that will be inserted - deleted on the log pane.
        
        self.chat_bar = self.create_chat_bar()
        
        
        # define the network accessable methods
        
        # init normally
        # pb.Referenceable.__init__(self) # Referenceable has no init
        
        # create the interface
        perspective_methods = [ \
        'post_message',
        'post_presence',
        'create_node',
        'create_clone',
        'delete_node',
        'move_node',
        'paste_outline',
        'set_cursor_position',
        'insert_text',
        'delete_text',
        'set_text' ]

        # prepend can be 'remote_', 'view_', or 'perspective_'
        for t_method in perspective_methods:
            setattr(self, 'remote_'+ t_method, getattr(self, t_method)) 
        return
        
    
    #@    @+others
    #@+node:exception
    def exception(self, error):
        """
        'error' should be a Failure (or subclass) holding the MyError exception, 
        error.{type , getErrorMessage, __class__, getBriefTraceback, getTraceback}
        """	
        
        #error.trap(LeoError) # to manage silently that exceptions
        #raise error # raise the remote error, short error message (brief traceback)
        
        # "<Error!> Got a remote Exception\n<%s><%s> %s " 
        self.es_error( "<Error!><%s>\n%s"%(error.type, error.getErrorMessage()) )
        self.es_error( "<Debug> %s"% error.getTraceback()) # only for debugging
        return
    
    
    
    #@-node:exception
    #@+node:connection/disconnection
    #@+others
    #@+node:connection
    def connect(self, server, port, path, login, password):
        """
        Start a new connection.
        """
        
        if self.perspective:
            es_error("Already connected to a server (%s). Error on previous disconnection."%(self.perspective))
            return
        
        self.base_path = path
        self.login    = login
        self.name     = self.login
        self.password = password
        self.server   = server
        self.port     = port
        
        service = "LeoOutline"
        
        path  = path.encode("utf-8")  # to avoid unicode problems
        login = login.encode("utf-8") # to avoid unicode problems 
        
        #self.es("trying to connect %s %s at %s %s on %s %s"%(login, password, server, port, service, path), color="yellow") # for debugging
        
        
        t_factory = pb.PBClientFactory()
        reactor.connectTCP(server, port, t_factory, timeout = 10)
        t_factory.login(credentials.UsernamePassword(login, password), self).addCallbacks(self.request_perspective, self.not_connected)
        
        return
    
    
    def request_perspective(self, avatar):
        """
        After login request access to the outline perspective
        """
        self.avatar = avatar
        avatar.callRemote("get_perspective", "outline", self.base_path).addCallbacks(self.connected, self.not_connected)
        return
    
    def not_connected(self, reason):
        """
        If connection failed.
        """
        self.exception(reason) 
        
        # destroy myself
        if hasattr(self.root_vnode, "client"):
            del self.root_vnode.client # will python alarm itself ?
        
        return	
        
        
    def connected(self, perspective):
        """
        We have just logged in.
        """
        
        if not perspective:
            self.es_error("Could not connect to the server.")
            return
    
        if self.perspective:
            es_error("Already connected to a server (%s). Error on previous disconnection."%(self.perspective))
            return
            
        self.perspective = perspective
        self.perspective.notifyOnDisconnect(self.disconnect)
        
        self.es ("Successfully connected to the server.", color="gray")
        
        # if we are over the recently connected outline
        if self.root_vnode == top().currentVnode(): 
            self.chat_bar.pack(side=BOTTOM, fill=X) # show new chat bar
        
        # resquest the outline
        deferred = self.perspective.callRemote("get_outline")
        deferred.addCallback(self.outline_received, self.root_vnode).addErrback(self.exception)
        
        return
    #@-node:connection
    #@+node:disconnection
    def OnDisconnect(self, event=None):
        """
        Manage the Tk event
        """
        
        self.disconnect()
        return
        
        
    def disconnect(self, *args):
        """
        
        """
        
        # send the final message
        try: 
            self.perspective.broker.transport.loseConnection() # this mean 	self.perspective.disconnect()
        except:
            pass
        # delete the perspective 
        self.perspective = None
        
        # delete the outline
        try:
            t_child = self.root_vnode.firstChild() 
            if t_child:
                t_child.doDelete(t_child.parent())           
        except:
            pass # fails at the shutdown, don't care # <<<< should I care ?
            
        try:
            # hide the chat bar
            self.chat_bar.pack_forget() 
        except:
            pass # could fail if the Tkinter interface was already shut down
        
        # notify the user
        if args:
            self.es_error("You lost the connection at '%s:%s'."%(self.server, self.base_path))
        else:
            self.es("Connection at '%s:%s' finished"%(self.server, self.base_path))
        
        # destroy myself
        if hasattr(self.root_vnode, "client"):
            del self.root_vnode.client # will python alarm itself ?
        
        return
    
    
    #@-node:disconnection
    #@-others
    #@nonl
    #@-node:connection/disconnection
    #@+node:collaborate_in/out (class LeoClient)
    # this function enable / disable the ablity of the local client to collaborate into a node.
    
    def collaborate_in(self,):
        """
        Login into the CollaborativeNode
        """
        
        self.es("Requesting access to the collaborative node.", color="gray")
        self.client_node = ClientNode(self)
            
        self.client_node.connect_to_server(self.perspective)
        
        return
        
    
    def collaborate_out(self,):
        """
        Logout out of the CollaborativeNode
        """
        
        self.client_node.disconnect_from_server()
    
        self.client_node = None # ouch !
            
        return
        
    
    def is_collaborating(self,):
        """
        return true if the client is actually managing a concurrent editable session (in the selected vnode)
        """
        return self.client_node and self.client_node.connected 
    #@nonl
    #@-node:collaborate_in/out (class LeoClient)
    #@+node:messages and presence
    
    def post_message(self, sender, txt):
        """
        Print on the client screen the recieved message.
        """	
        
        self.es( "<%s> %s"%(sender, txt), color="blue" )
        
        return
    
        
    def post_presence(self, who, state):
        """ 
        Update the state of someone.
        """
        
        self.es ("%s is %s"%(who, state), color="green")
        return
    #@-node:messages and presence
    #@+node:chat_bar
    def create_chat_bar(self,):
        """
        Create the chat_bar widget that is a posteriori inserted or extirped from the log panel.
        The chat bar allow smart text entry, users selection and users entry.
        """
            
        if os.name == "posix"	:
            parent = top().frame.split2Pane2 # work fine in Linux
        else:
            parent = top().frame.log.logCtrl # work fine in windows
                
        bar = Frame( parent, borderwidth=1,relief=SUNKEN)
        
        Label(bar, text="To: ").pack(side = LEFT)
        
    
        #self.name_menu = name_menu = Label(bar,  foreground="blue", background= bar["background"]) 
        self.name_menu = name_menu = Entry(bar, foreground="blue", background= bar["background"], relief= FLAT, width=1) 
        self.name_menu.bind("<Leave>",    lambda event: name_menu.config(width=len(name_menu.get())))
        self.name_menu.bind("<FocusOut>", lambda event: name_menu.config(width=len(name_menu.get())))
        
        
        self.set_chat_bar_name("_room")
        name_menu.pack(side = LEFT)
        
        
        # the names menu
        self.name_list_menu = name_list_menu = Menu(bar)
        name_list_menu.add_command(label="_room",     command= lambda: self.set_chat_bar_name("_room"))
        name_list_menu.add_command(label="_everyone", command= lambda: self.set_chat_bar_name("_everyone"))
        name_list_menu.add_separator()
    
        # the popup attach
        #self.name_menu.bind("<Button>", lambda event: self.name_list_menu.post(event.x_root, event.y_root) )	
        self.name_menu.bind("<Button-3>", lambda event: self.name_list_menu.post(event.x_root, event.y_root) )	
        
        # the entry is a text widget of fixed heigth 1. The '\n' keystroke is related to a function call. then users can send lines, and have an history.
    
        log = top().frame.log.logCtrl
        text = Text(bar, height=1, background = log["background"], font = log["font"] )
        text.pack(side=RIGHT, fill=X, expand=1)
        text.bind("<Return>", self.onChattextEntry )
    
        return bar
        
    def set_chat_bar_name(self, new_name):
        """
        Store an show the new sendee
        """
        
    
        #self.name_menu["text"] = new_name
    
        self.name_menu.delete("0", END)
        self.name_menu.insert("0", new_name)				
        self.name_menu["width"] = len(new_name)
        
        return
        
    
    def onChattextEntry(self, event):
        """
        Obtain the last line in the text widget.
        Put the cursor at the end of the widget.
        Send the message.
        
        The event callback is called *before* that the key modify the text widget.
        """
        
        text = event.widget
    
        txt = text.get("insert linestart", "insert lineend")  # extract the actual line
        #es("Try of txt : '%s'"%(txt), color="yellow")
    
        # ensure that the cursor is on the last line, and that there is only one blank line at the end (new entry...)
        text.mark_set("insert", "end")	
        if text.get("insert - 1 chars") == '\n':
            text.delete("insert - 1 chars")
        
        
        if txt[0] == '/':
            if txt.startswith("/presence"):
                t_list = txt.split(' ')
                if len(t_list) >= 2:
                    status = ' '.join(t_list[1:])
                    self.perspective.callRemote("set_presence", status)
                else:
                    self.es("Set your status online (dummy demo command by the moment).\ Example: '/presence happy coding'", color="gray")
                    
            elif txt.startswith("/help"):
                self.es("Actual defined commands are:\n'/help','/presence', (sorry, nothing else by now)\nRead 'LeoN.leo/Docs/users help/Chat bar usage' for more details.", color="gray")
                
            else:
                cmd = txt.split(' ')[0]
                self.es_error("Unknown command '%s'; message not sent.\nUse '/help' to get some guidance."%(cmd))	
        else:
            #to = self.name_menu["text"]
            to = self.name_menu.get()
            self.perspective.callRemote("send_message", to, txt).addErrback(self.exception)
        
        return
    
    #@-node:chat_bar
    #@+node:outline (class LeoClient)
    #@+others
    #@+node:path methods
    def path_to_list(self, path):
        """
        Get a path and return a list of nodes names
        """
    
        if type(path) is list:
            return path
            
        assert type(path) is unicode, "Unmanaged type of path given '%s' is %s"%(path, type(path))
        
        path = [u'/'] + map(lambda y:y.replace("&sl;", "/"), filter(lambda x:x, path.split('/') )) 
        # suposed to be an url, eliminate the '' nodes and replace the &sl; (slash) escapes
            
        return path
        
    def get_node(self, relative_path):
        """
        Helper function to obtain a vnode from his relative path.
        """
    
        node_path = self.path_to_list(relative_path)
        
        #self.es("get_node path %s"%(node_path), color="yellow") # just for debugging
        
        t_node = self.root_vnode.firstChild() # t_node is a temporal node, not a tnode (text node)
    
        for name in node_path:
            while t_node and t_node.headString() != name:
                #self.es("get_node iteration t_node.headString() == %s"%(t_node.headString()), color="yellow") # just for debugging
                t_node = t_node.threadNext()
                #self.es("get_node iteration t_node.next() == %s"%(t_node), color="yellow") # just for debugging
        
        return t_node
        
    
    def get_node_path(self, vnode):
        """
        Helper function to obtain the relative path of a vnode.
        """
        
        t_list = []
        t_vnode = vnode
        
        while t_vnode and t_vnode.isOnline():
            t_list.insert(0, t_vnode.headString().replace("/", "&sl;")) # to avoid '/' problems
            t_vnode = t_vnode.parent()
        
        t_path = u'/' + '/'.join(t_list[2:]) # avoid the  '@leoServer' and the reference path name
        
        assert type(t_path) is unicode, "Paths require to be unicode data"
        
        return t_path
        
    
    def split_path(self, node_path):
        """
        Separate a path in the parent path and the node name. Named as an analogy of os.path.split.
        Return a tuple (parent_path, node_name)
        """
        
        try:
            t_list = filter(lambda x:x, node_path.split('/') )
            node_name   = t_list[-1].replace("&sl;", "/")
            parent_path = u'/' + '/'.join(t_list[:-1])
        except:
            t_message = "Error when separating the parent path and the node name. path '%s'" % node_path
            self.es_error(t_message)
            raise t_message
    
        return parent_path, node_name
    #@-node:path methods
    #@+node:helper functions (data<->outline)
    #@+at
    # Client side, data<->outline transformation
    #@-at
    #@@c
    #@nonl
    #@-node:helper functions (data<->outline)
    #@+node:data_to_outline
    def data_to_outline(self, parent, nodes_list, nodes_hierarchy, t_dic):
        """
        Create the outline described by data, and attach it to the parent.  
        The data include the vnode names and the existence of clones.
        Receive data in the format (["name1", "name2", ..], [0, 1, 2, [4, 1], 5, 6, ..])
        and append the new nodes to the parent.
        If the parent already has childrens, will add them to the last position.
        t_dic contain a map of "already scanned indexes" -> node_instance object. This allow to create the required clones.
        Recursive function.
        """
    
        last_node = parent
        
        for t_item in nodes_hierarchy:
            
            if type(t_item) is int:
              
                if not t_dic.has_key(t_item): # if not already created, create a new node
                
                    if type(nodes_list[t_item]) is tuple:
                        t_name, t_text = nodes_list[t_item]
                    else:
                        t_name = nodes_list[t_item]
                        t_text = None
                    
                    t_name = t_name.replace("&sl;", "/")                
                    t_vnode = parent.insertAsLastChild() # n=-1
                    t_vnode.setHeadStringOrHeadline(t_name)			
                    if t_text:
                        t_vnode.setBodyStringOrPane (t_text)
        
                    t_vnode.client = self
                    
                    last_node = t_vnode
                    t_dic[t_item] = t_vnode
                    
                else: # the node already was created, now we should create a clone of it.
                    twin = t_dic[t_item]
                    
                    #clone (self,back) return clone vnode Creates a clone of back and insert it as the next sibling of back.
                    t_vnode = twin.clone(twin) 
                    #moveToNthChildOf (self, p, n) "Moves the receiver to the nth child of p"
                    #t_vnode.moveToNthChildOf(parent, parent.numberOfChildren()) 
                    t_vnode.moveAfter(parent.lastChild())
    
                    # attach the LeoClient references. Need to mark every node under the twin, as online nodes are marked at the vnode level, not at the tnode level. (was that a smart choice ?)
                    t_vnode.client = self # attach the LeoClient reference
                    reference_level = t_vnode.level()
                    tt_vnode = t_vnode.threadNext()
                    while tt_vnode and tt_vnode.level() > reference_level: # level calculus is slow but not very used
                        tt_vnode.client = self
                        tt_vnode = tt_vnode.threadNext()
                    
                    # mark the last_node created
                    last_node = twin 
                                    
            elif type(t_item) in [list, tuple]: # sub lists are sublevels
                self.data_to_outline(last_node, nodes_list, t_item, t_dic) # recursive call for the next level
                
            else:
                self.es_exception("<LeoClient Error> The nodes hierarchy in the uploaded data contain an unmanageable object of type %s"%( type(t_item)))
                #self.es("nodes_hierarchy %s" % nodes_hierarchy, color="yellow") # just for debugging
                return
           
        return
    #@nonl
    #@-node:data_to_outline
    #@+node:outline_to_data
    def outline_to_data(self, parent):
        """
        Explore an outline of vnodes and create a strucure of list and tuples that contain all the data.
        Used to upload and entire outline.
        Format: ([(Name, Text), (Name, Text), (Name, Text)], [0 1 1 [2 [1] 2]])
        ie, a list of nodes and then a hierarchy of nodes that allow clones.	(nodes_list, nodes_hierarchy)
        Clones suboutlines appears only once (node '2' in the previous example) 
        """
    
        # inner helper recursive function ---------------------------
        def level_list(firstchild, t_dic):
            t_list = []	
            old_v = None
            v = firstchild
            while v:
                if not t_dic.get(v.t): # look if a
                    t_dic[v.t] = len(t_dic) # add to the dict (python arguments are references to the objects)
    
                t_list.append(t_dic[v.t])
                    
                if v.firstChild() and t_dic[v.t] == (len(t_dic) - 1): # if has childrens, and it is the first appearance
                    t_list.append(level_list(v.firstChild(), t_dic))
                
                v = v.next()
                    
            return t_list
        # end of inner recursive function ----------------------------
        
        t_dic = {parent.t:0}	
        nodes_hierarchy = [0, level_list(parent.firstChild(), t_dic)]
        nodes_list = range(len(t_dic))
        for t, pos in t_dic.items():
            t_name, t_text  = t.headString, t.bodyString
            t_name = t_name.replace("/", "&sl;")
            nodes_list[pos] = (t_name, t_text)
        
        return (nodes_list, nodes_hierarchy)
    #@-node:outline_to_data
    #@+node:parse outline action (cut, copy, paste, move, etc...)
    #@+at
    # We have to drive every node that is inserted into the outline.
    # This can be:
    #     - Dragging (=> moving)
    #     - moving
    #     - Pasting
    #     - Inserting node
    # 
    # We have to drive every node that is deleted from the outline.
    # This can be:
    #     - dragging (=> moving)
    #     - moving
    #     - cutting
    #     - deleting
    #@-at
    #@@c
    
    def parse_outline_action(self, d):
        """
        This function recieve the dictionnary created by the undoer to register an user action.
        Parse_action is charged to translate all the outline related actions.
        This function generate the equivalent remote call and undo the action. The server will later propagate the event back to this client.
        
        As Copy Outline does not generate undoer action, a fake call is generated to this function, in order to keep coherence.
        The 'Rename' action is also generated by the leon client plugin.
        """
        
        #self.es("parse_outline_action %s" % str(d), color="yellow") # just for debugging
    
        t_type   = d.get("undoType", None)
        t_parent = d.get("parent", None)
                
        # parent, n
        # oldParent, oldN
        
        if t_type in ['Drag', 'Move Up', 'Move Down', 'Move Left', 'Move Right', 'Rename']: # move
            #@        << move node >>
            #@+node:<< move node >>
            #self.es("Move %s" % d, color="yellow") # just for debugging
            
            aborted_move = 0
            if d["parent"].isOnline() and d["oldParent"].isOnline(): # check that moves are between online nodes
                
                # more checks
                if t_type.startswith("Move "):
                    if d.has_key("back") and not d["back"].isOnline():
                        aborted_move = 1
                    if d.has_key("oldBack") and not d["oldBack"].isOnline():
                        aborted_move = 1
                        
                if d["parent"].headString().startswith("@leoServer"): # if root node
                    aborted_move = 1        
                        
                if aborted_move:
                    pass
                              
                elif t_type == "Rename": # a LeoN special one, which add 'oldHeadString' and 'headString' special keys
                    
                    old_path = self.get_node_path(d["oldParent"]) + '/' + d["oldHeadString"].replace("/", "&sl;")
                    new_path = self.get_node_path(d["parent"]   ) + '/' + d["headString"].replace("/", "&sl;")
                    new_position = d["n"] 
                else:
                    old_path = self.get_node_path(d["oldParent"]) + '/' + d["v"].headString().replace("/", "&sl;")
                    new_path = self.get_node_path(d["parent"]   ) + '/' + d["v"].headString().replace("/", "&sl;")
                    new_position = d["n"] 
                
                if not aborted_move:
                    deferred = self.perspective.callRemote("move_node", old_path, new_path, new_position)
                    #deferred.addCallback(lambda *args: self.es("requested a node move", color="gray"))
                    deferred.addErrback(self.exception)
            else:
                aborted_move = 1
                
            if aborted_move:
                self.es_error("Moves between online and local nodes are not yet managed.\nTo upload or download outlines use the copy/paste commands.\n'%s' is %s, '%s' is %s" % (d["parent"].headString(),    (d["parent"].isOnline()    and "online") or "offline", 
                                                  d["oldParent"].headString(), (d["oldParent"].isOnline() and "online") or "offline") )
            
            #@-node:<< move node >>
            #@nl
            
        elif t_type in ['Insert Outline']: # create
            #@        << create node >>
            #@+node:<< create node >>
            t_path = self.get_node_path( d ["parent"] ) + '/' + d["v"].headString().replace("/", "&sl;")
            t_position = d["n"]
            deferred = self.perspective.callRemote("create_node", t_path, position = t_position)
            #deferred.addCallback(lambda *args: self.es("requested the creation of the node %s"%(t_path), color="gray"))
            deferred.addErrback(self.exception)
            #@-node:<< create node >>
            #@nl
                    
        elif t_type in ['Clone']: # clone
            #@        << create clone >>
            #@+node:<< create clone >>
            # create a clone
            twin_path   = self.get_node_path(d["back"])  # 'back' or v= d["v"]; v.client = self; twin_path = self.get_node_path(v)
            parent_path = self.get_node_path(d["parent"])
            position    = d["n"] 
            
            deferred = self.perspective.callRemote("create_clone", twin_path, parent_path, position)
            #deferred.addCallback(lambda *args: self.es("requested a node move", color="gray"))
            deferred.addErrback(self.exception)
            
            
            # {'undoType': 'Clone', 'n': 4, 'back': <v 143143628:u'Yet another node.'>, 'parent': <v 143141764:u'Test for LeoN'>, 'v': <v 142447388:u'Yet another node.'>}
            # 'v' is the just new created clone, back is his twin
            #@nonl
            #@-node:<< create clone >>
            #@nl
            
        elif t_type in ['Cut Node', 'Delete Outline']: # delete        
            #@        << delete outline >>
            #@+node:<< delete outline >>
            t_path = self.get_node_path(d["v"]) 
            deferred = self.perspective.callRemote("delete_node", t_path)
            # the server will later generate a propagation of the event
            #deferred.addCallback(lambda *args: self.es("requested the deletion of the node %s"%(t_path), color="gray"))
            deferred.addErrback(self.exception)
            #@-node:<< delete outline >>
            #@nl
    
        elif t_type in ['Paste Node']: # paste an outline
           #@       << paste outline >>
           #@+node:<< paste outline >> (upload)
           # we convert the outline to the correct format
           data = self.outline_to_data(d["v"])
           url  = self.get_node_path(d["parent"])
           
           #self.es("Pasted data: %s\n at %s %i" %(data, url, d["n"]), color="yellow") # just for debugging
           
           # and send the data
           t_position =  d["n"] 
           df = self.perspective.callRemote("upload_outline", url, t_position, data) 
           df.addCallback(self.outline_uploaded, d["parent"], d["n"], data)
           df.addErrback(self.exception) 
           
           
           #{'undoType': 'Paste Node', 'n': 6, 'back': <v 142447388:u'Yet another node.'>, 'parent': <v 143141764:u'Test for LeoN'>, 'v': <v 142268324:u'Yet another node.'>}
           
           
           #@-node:<< paste outline >> (upload)
           #@nl
    
        elif t_type in ['Copy Outline']: # download the outline
            #@        << copy outline >>
            #@+node:<< copy outline >> (download)
            # obtain the url, download the data, and translate it to the correct format to put it in the copy buffer 
            # do the remote call and attach the callback
            
            
            t_path = self.get_node_path(d["v"]) 
            
            deferred = self.perspective.callRemote("download_outline", t_path)
            deferred.addCallback(self.outline_downloaded)
            deferred.addErrback(self.exception)
            
            self.es("Started outline download, please wait...\n%s" % t_path,color="gray")
            #@-node:<< copy outline >> (download)
            #@nl
        
        elif t_type in ['Change Headline']: # method that are managed in other ways
            # change headline is managed by a special callback, as a move node.
            pass
            
        else:
            self.es_error("Unmanaged operation %s; %s"%(t_type, str(d)))
            pass
    
    
        # undo the action, very important !
        # Copy Outline has no undo
        # Change Headline and Rename are managed by special code, not usual undo
        # Delete Outline need to undo afterCommand, not during command
        if t_type not in ["Copy Outline", "Change Headline", "Rename", "Delete Outline"]:
            self.undoing = 1 # helper variable to solve some undo operations issues (example, intermediary nodes selection)
            top().undoer.undo()
            self.undoing = 0
            #<<< should reselect the actual selection (download selected node content) ?
    
        return		
    
    
    # {'undoType': 'Insert Outline', 'parent': <v 143141764:u'Test for LeoN'>, 'v': <v 142537468:'NewHeadline'>, 'back': <v 143143628:u'Yet another node.'>, 'select': <v 143143628:u'Yet another node.'>, 'n': 4}
    
    
    # {'undoType': 'Clone', 'n': 4, 'back': <v 143143628:u'Yet another node.'>, 'parent': <v 143141764:u'Test for LeoN'>, 'v': <v 142447388:u'Yet another node.'>}
    
    # {'oldBack': <v 143143628:u'Yet another node.'>, 'undoType': 'Drag', 'oldParent': <v 143141764:u'Test for LeoN'>, 'parent': <v 143141764:u'Test for LeoN'>, 'v': <v 142447388:u'Yet another node.'>, 'oldN': 4, 'back': <v 142537468:'NewHeadline'>, 'n': 5}
    
    #{'undoType': 'Paste Node', 'n': 6, 'back': <v 142447388:u'Yet another node.'>, 'parent': <v 143141764:u'Test for LeoN'>, 'v': <v 142268324:u'Yet another node.'>}
    
    
    #{'undoType': 'Cut Node', 'parent': <v 142747876:u'Test for LeoN'>, 'v': <v 142041900:u'Yet another node.'>, 'back': <v 142750764:u'another node'>, 'select': <v 142750764:u'another node'>, 'n': 2}
    
    #{'undoType': 'Delete Outline', 'parent': <v 142747876:u'Test for LeoN'>, 'v': <v 140676380:u'Yet another node.'>, 'back': <v 142041900:u'Yet another node.'>, 'select': <v 142041900:u'Yet another node.'>, 'n': 3}
    
    
    #{'undoType': 'Paste Node', 'parent': <v 142747876:u'Test for LeoN'>, 'v': <v 140676380:u'Yet another node.'>, 'back': <v 142041900:u'Yet another node.'>, 'select': <v 142750764:u'another node'>, 'n': 3}
    
    
    
    
    
    
    
    #@-node:parse outline action (cut, copy, paste, move, etc...)
    #@+node:deferred callbacks (received elements)
    # function called as a deffered callback
    # (you will need to look were in the code this methods are attached to a callback)
    #@nonl
    #@-node:deferred callbacks (received elements)
    #@+node:new node selection (when selecting online nodes)
    
        
    def new_node_selection(self, content, path, t_vnode):
        """
        This is the callback for "select_node". Select_node return the content of the new selected node. So we update the body string.
        """
    
        #self.es("Received the content of the new selected node.", color="gray")    
        self.es("Received '%s'" % path, color="gray")    
        
        # erase old lock
        self.has_lock = 0
        
        # t_vnode correspond to the node where the request was made
        c = t_vnode.c
        
        # update his data
        insert_pos = c.frame.body.bodyCtrl.index("insert")
        t_vnode.setBodyStringOrPane(content) # will change the selection and the insert point
        c.frame.body.bodyCtrl.tag_remove("sel", "1.0", "end") #c.frame.body.setTextSelection(None) # erase any selection
        c.frame.body.bodyCtrl.mark_set("insert", insert_pos)
        
        # delete the actual client instance
        self.client_node = None # client_node is related to real time collaboration management
        
        return
    
    #@-node:new node selection (when selecting online nodes)
    #@+node:outline received (at connection)
    
    def outline_received(self, data, t_parent):
        """
        At connection we receive an outline.
        data is the outline data.
        t_parent is a vnode instance where to attach the received outline
        """
          
        self.paste_outline(t_parent, -1, data) #paste_outline(self, relative_path, position, data) (relative_path can be the parent instance)
       
        return
    #@nonl
    #@-node:outline received (at connection)
    #@+node:outline uploaded (at paste)
    def outline_uploaded(self, ret, parent, n, data):
        """
        Callback of callRemote(upload_outline)
        """
        # should create the outline	
        #outline_list = (map(lambda x: x[0], data[0]), data[1]) # change ([(name, body), (name,body)], [0 1 [2 3 1] 4]) to ([name, name], [0 1 [2 3 1] 4])
        #self.data_to_outline(parent, n, outline_list) # will wait loop backward reception
        
        self.es("Outline successfully uploaded and published. (will appear in some seconds)") # notify the user
        return
    #@nonl
    #@-node:outline uploaded (at paste)
    #@+node:outline downloaded (when copying)
    def outline_downloaded(self, data):
        """
        Receive outline data.
        """
        
        #self.es(data, color="yellow") # just for debugging
        
        nodes_data, users_warning = data
        nodes_names, nodes_hierarchy = nodes_data
            
        for t_key, t_users_list in users_warning.items():
            t_node_name = nodes_names[t_key][0]
            self.es("Warning, %s are actually editing the downloaded node %s" % (t_users_list, t_node_name), color="blue")
           
        # use data to construct a local outline, copy it, and then delete it
        c = top()
        last_vnode = c.currentVnode()
        t_parent = c.rootVnode()
        # will create the outline in the  last position of the root node
        self.data_to_outline(t_parent, nodes_names, nodes_hierarchy, {}) #(parent, nodes_list, nodes_hierarchy, t_dic) 
        t_node = t_parent.lastChild()
        del t_node.client # delete the client reference to avoid repetitive event at copyOutline call
        c.selectVnode(t_node) # select the new outline
        c.copyOutline() # copy, make it aviable in the copy buffer 
        c.deleteOutline() # delete
        c.selectVnode(last_vnode)# get back the selection
        
        self.es("Requested outline successfully downloaded, aviable in the copy/paste buffer.\nPaste it as desired.")
        
        return
    
    
    #@-node:outline downloaded (when copying)
    #@+node:edit tree
    #@+at
    # All this methods are remote accessable (remote_* aliases created at 
    # class instanciation (__init__ method)).
    #@-at
    #@@c
    
    #@+others
    #@+node:create node
    def create_node(self, node_path, position):
        """ 
        Add a node to the local outline.
        """
    
        parent_path, name = self.split_path(node_path)
        
        t_parent = self.get_node(parent_path)
        
        if not t_parent:
            self.es_error("Tree sync broken. Could not found the requested parent node %s."%(parent_path))
            return
            
        t_vnode = t_parent.insertAsNthChild (position)
    
        t_vnode.setHeadStringOrHeadline(name)			
    
        t_vnode.client = self # attach the LeoClient reference
            
        self.es ("Creating node %s"%( node_path), color="gray" )
        
        return
    
    #@-node:create node
    #@+node:create clone
    def create_clone(self, parent_rpath, twin_rpath, position):
        """ 
        Clone a node in the local outline
        """
        
    #    parent_path, node_name = self.split_path(node_path)       
    #    assert node_name == twin_path.split('/')[-1], "Node and Twin name are not equal."
        
        parent = self.get_node(parent_rpath)
        
        if not parent:
            self.es_error("Tree sync broken. Could not found the requested parent node %s."%(parent_rpath))
            return
    
        twin = self.get_node(twin_rpath)
        
        if not twin:
            self.es_error("Tree sync broken. Could not found the requested twin node %s."%(twin_rpath))
            return
            
        self.es("Creating clone of '%s' at '%s' position %i"%(twin_rpath, parent_rpath, position), color="gray")
        
        #clone (self,back) return clone vnode Creates a clone of back and insert it as the next sibling of back.
        t_vnode = twin.clone(twin) 
        #moveToNthChildOf (self, p, n) "Moves the receiver to the nth child of p"
        t_vnode.moveToNthChildOf(parent, position) 
        # should call c.initAllCloneBitsInTree(vnode) ?
        
        t_vnode.client = self # attach the LeoClient reference
    
        t_vnode.c.redraw() # redraw the outline
        return
    
    
    
    #@-node:create clone
    #@+node:delete node
    def delete_node(self, node_path):
        """ 
        Delete a local node.    
        """
        
        t_node = self.get_node(node_path)
        
        if not t_node:
            self.es_error("Tree sync broken. Could not found the requested node %s."%(node_path))
            return
    
        new_selection = t_node.parent() 
        t_node.doDelete( new_selection ) #def doDelete (self, newVnode): # newVnode is the new selection
    
        self.es( "Erasing the local node %s"%(node_path), color="gray" )
        
        return
        
    #@nonl
    #@-node:delete node
    #@+node:move node
    def move_node(self, node_path, new_node_path, position):
        """ 
        Allow moving and renaming nodes.
        """
        
        # get the target node 
        t_node = self.get_node(node_path)	 # t_node is a temporal node, not a tnode (text node)
                
        if not t_node:
            self.es_error("Tree sync broken. Could not found the requested node %s."%(node_path))
            return
           
        old_parent_path, old_name = self.split_path(node_path)
        old_position = t_node.childIndex()
        
        # get new parent
        new_parent_path, new_name = self.split_path(new_node_path)            
        t_parent = self.get_node(new_parent_path)
    
        if not t_parent:
            self.es_error("Tree sync broken. Could not found the requested node %s."%(new_parent_path))
            return
                
        # move 
        if position < 0	:
            position = t_parent.numberOfChildren() + 1 + position 
        
        t_node.moveToNthChildOf(t_parent, position)
                    
        # check renaming
        if old_name != new_name:
            t_node.setHeadString(new_name)
    
    
        t_node.client = self # attach the LeoClient reference
        
        
        # require a tree redraw
        t_node.c.frame.tree.redraw_now()
        
        if old_parent_path != new_parent_path:
            self.es ( "Moving node from %s to %s, position %i"%(node_path, new_node_path, position), color = "gray" )
        elif old_name != new_name:
            self.es ( "Renaming node '%s' as '%s'"%(old_name, new_name), color = "gray" )
        elif old_position != position:
            self.es ( "Changing position of node '%s' from %i to position %i"%(new_name,old_position, position), color = "gray" )
        else:
            self.es ( "Moving node from %s to %s, position %i"%(node_path, new_node_path, position), color = "gray" )
    
        return
    
    #@-node:move node
    #@+node:paste outline
    def paste_outline(self, parent_rpath, position, data):
        """
        parent_rpath is a relative path
        Remote callable function. 
        Insert an outline at some point of the local tree.
        parent_rpath can be a string or the parent node instance.
        This function expect to receive outline data only.
        """
            
        if type(parent_rpath) in [unicode, list]:
            t_parent = self.get_node(parent_rpath)
            if not t_parent:
                self.es_error("Could not find the node asociated to the local path '%s'" % relative_path)
                return
        else:
            t_parent = parent_rpath # suposed to be a parent instance
        
        nodes_names, nodes_hierarchy = data
        
        assert (type(nodes_hierarchy[0]) is int) and (type(nodes_hierarchy[1]) is not int), "Expected a 'one node and his childrens' node hierarchy. \n(received %s)" % nodes_hierarchy
        assert type(nodes_names[0]) in [str, unicode], "Expected a list of nodes names, but received a list of %s.\n Ensure that the data correspond to an outline description." % type(nodes_names[0])
        
        # add the first node
        if position == -1:
            t_vnode = t_parent.insertAsLastChild()
        else:
            t_vnode = t_parent.insertAsNthChild(position)
        
        t_vnode.setHeadStringOrHeadline(nodes_names[nodes_hierarchy[0]])			
        t_vnode.client = self
    
        nodes_hierarchy = nodes_hierarchy[1:]
        
        # call a recursive function to build the rest of the outline
        self.data_to_outline(t_vnode, nodes_names, nodes_hierarchy, {}) #(parent, nodes_list, nodes_hierarchy, t_dic)
    
        # update the cloned icons
        c = top()
        c.initAllCloneBitsInTree(t_vnode)            
        return
        
    #@-node:paste outline
    #@+node:edit node (class LeoClient/outline/edit tree)
    #@+at
    # dummy perspective passes to the local ClientNode
    #@-at
    #@@c
    
    def set_cursor_position(self, *args, **kws):
        if self.client_node: # <<<< is this condition enough ?
            return self.client_node.set_cursor_position(*args, **kws)
            
        return
    
    def fill_body(self, *args, **kws):
        if self.client_node:
            return self.client_node.fill_body(*args, **kws)
        return
        
    def flush_body(self, *args, **kws):
        if self.client_node:
            return self.client_node.flush_body(*args, **kws)
        return
    
    
    def insert_text(self, startpos, text, timestamp = None, source_site = None, **kws):
        """
        """
        
        assert type(text) is unicode, "received data has to be unicode data"
        
        self.client_node.receive_operation(Operation("Insert", startpos, text, timestamp = timestamp, source_site = source_site, **kws))
    
        return
        
    
    def delete_text(self, startpos, length, timestamp = None, source_site = None, **kws):
        """
        """
        
        self.client_node.receive_operation(Operation("Delete", startpos, length, timestamp = timestamp, source_site = source_site, **kws))
    
        return
        
        
    def set_text(self, new_text):
        """
        """
        
        assert type(text) is unicode, "received data has to be unicode data"
        
        self.client_node.set_text(new_text)
        return
    #@-node:edit node (class LeoClient/outline/edit tree)
    #@-others
    
    #@-node:edit tree
    #@-others
    #@nonl
    #@-node:outline (class LeoClient)
    #@+node:admin perspective (LeoClient.OnAdmin)
    def OnAdmin(self, event=None, v=None):
        """
        The user request access to the admin perspective.
        """
        
        assert v != None
            
        # try to get the perspective
        self.es("Requesting access to the Admin Perspective", color="gray")
        
        self.AdminGui = LeoNAdminGui(self, v) # create a LeoN administration Gui
        
        # the AdminGui has it own life...
        
        return
    
    #@-node:admin perspective (LeoClient.OnAdmin)
    #@-others
    
        
    


#@-node:class LeoClient
#@+node:class ClientNode

class ClientNode(ConcurrentEditableClient):
    """
    The client side of the selected node.
    This is a dynamic component.
    
    This class is instanciated when the user start to collaborate in a node. 
    It manage all the ConcurrentEdition Logic. 
    This is the class that concentrate the LeoN interaction with the panel body. The implementation is dependent of the Gui system.
    This is the class that generate all the operations to be sent to the server, and it the the one that process the received operations.
    As this is a child class, most of the ConcurrentEditable logic is not here but in the parents. This class overwrite and extend his parent with Gui dependents methods.
    """
    
    def __init__(self, LeoClient_instance):
        """
        """
        # local ConcurrentEditable will be initialized during connection process.
        
        # initialize the extra attributes		
        self.leo_client  = LeoClient_instance # stores a reference to the leo client.
        for t_name in ["name", "es", "perspective", "exception"]: # attach some attributes and methods
            setattr(self, t_name, getattr(self.leo_client, t_name))
        
        self.text_widget = top().frame.body.bodyCtrl
            
        self.deletion_buffer = () # helper variable store a cumulative erasure (successive delete or insert commands) in the tuple (startpos, len)
        self.last_node_dirty_text = [] # helper variable, that fill_node user when the selection has changed. Will be deprecated in step4.
        
        return
    
    
    #@    @+others
    #@+node:connect to/disconnect from server
    def connect_to_server(self, server_perspective):
        """
        Connect to the server.
        """
        
        self.server_perspective = server_perspective
        deffered = self.server_perspective.callRemote("collaborate_in")
        deffered.addCallback(self.connected)
        deffered.addErrback(self.leo_client.exception)
                                
        return
    
    
    def connected(self, ret_tuple):
        """
        Callback for the connection procedure.
        """
        insert_index = self.text_widget.index("insert")
        
        site_index, num_of_sites, base_state_vector, base_text, ops_list = ret_tuple
            
        # init the internal ConcurrentEditable		
        ConcurrentEditable.__init__(self, site_index, num_of_sites) # site_index, num_of_sites # the clients has site_index 1, thus state_vector == [server, client]
    
        self.set_text(base_text)
    
        self.state_vector = base_state_vector # <<<< is this a correct idea ?
    
        self.es("Base state vector %s"% base_state_vector, color="yellow") # just for debugging
        self.es("Received ops_list (len == %s) %s"%( len(ops_list), ops_list), color="yellow") # just for debugging
            
        for t_dict in ops_list: #ops_list is a list of dictionaries that define a list of operations
            self.receive_operation(Operation(**t_dict))	# instanciate and receive
        
        self.es("Setting the index mark back to his initial location: %s"% (insert_index),color="yellow")
        
        self.text_widget.mark_set("insert", insert_index) # try to keep the insert mark at the same place
        
        t_vnode = top().currentVnode()
        t_path  = "%s:%i:%s" % (t_vnode.client.server, t_vnode.client.port, t_vnode.client.get_node_path(t_vnode) )
        self.es("Connected to '%s' as S%s (num_of_sites %s)"%(t_path, site_index, num_of_sites))
        
        self.es("HB after the connection %s"% self.HB, color="yellow") # just for debugging
        self.es("delayed_operations after the connection %s"% self.delayed_operations, color="yellow") # just for debugging
        self.es("self.state_vector %s" % self.state_vector, color="yellow") # just for debugging
    
    
        self.connected = 1 # indicate the success
        return
        
    
    def disconnect_from_server(self):
        """
        Disconnect from the server.
        """
    
        deffered = self.server_perspective.callRemote("collaborate_out")
        deffered.addCallback(self.disconnected)
        deffered.addErrback(self.leo_client.exception)
        
        return
    
    def disconnected(self, *args):
        """
        Actions to be done by the ClientNode after his disconnection.
        """
        
        self.connected = 0 # indicate the end of the connection
        
        # what should I do here ?, do I need to do something ?
        self.leo_client.es("Disconnected from the old node.", color="gray") # just to do something
        
        return
    
    
    #@-node:connect to/disconnect from server
    #@+node:edit node content (class ClientNode)
    #@+at
    # This methods edit the client node text, presenting the gui results.
    # Essentially this method take care of allowing the user to input text 
    # while receiving operations and solve the unicode inconsistencies between 
    # Tkinter and the python string manipulation.
    # 
    # Unmanaged text in the text_widget is marked as "to_send".
    #@-at
    #@@c
    
    
    def set_cursor_position(self, who, pos):
        """ 
        Define the new position of someone cursor, so the local user can suspect future editions of the camarades. Used as a visual feedback of other user actions.
        """
        
        raise "Not yet implemented."
        
        return
    #@nonl
    #@-node:edit node content (class ClientNode)
    #@+node:set text
    def set_text(self, new_text):
        """
        Blindly overwrite the text of this site. (including the "to_send" elements)
        """
        
        self.es( "Calling set_text '%s'"%(new_text), color="yellow" ) # for debugging
        
        # maintain an unicode buffer equivalent
        ConcurrentEditableClient.set_text(self, new_text)
            
        # clean up the body
        self.text_widget.delete("1.0", END)
        
        # insert the new text
        self.insert_text(0, new_text, op={"source_site":self.site_index})
        
        return
    
    
    
    #@-node:set text
    #@+node:insert text
    def insert_text(self, startpos, text, op={}):
        """ 
        Some one insert text on the actual node.
        Should insert text only counting non "to_send" locations.
        """
        
        if op.get("avoid"):
            self.es( "AutoInsertion is avoiyed", color="yellow") # for debugging
            del op["avoid"] # I hope this will edit the operation stored in the HB
            self.es("HB after operation avoyance %s"% self.HB, color="yellow") # just for debugging
            return
    
            
        text_widget = self.text_widget
            
        t_startpos = startpos
    
        # convert the insertion point, considering the "to_send" elements
        ranges = text_widget.tag_ranges("to_send") # ranges are text indexes
        
        for i in range(0, len(ranges), 2):
            # convert text indexes to numerical values
            start =          len(text_widget.get("1.0",     ranges[i]  ))
            stop  =  start + len(text_widget.get(ranges[i], ranges[i+1]))
            
            if start < startpos:
                startpos += stop - start # make the startpos include the unsent local text.
            if start >= startpos:
                break
            # else: continue
    
        startpos = "1.0 + %i chars"%(startpos)
                    
        self.es("Insert text: input starpos %s, real startpos %s. to_send ranges %s"%(t_startpos, startpos, ranges), color="yellow")
        
        # now startpos is a "line.column" index that consider the correct location
                
                
        if op["source_site"] == self.site_index: # if it is a confirmation
            who = None
        else:
            who = op.get("who")
        
        if who and who != self.name:
                
            # check if the who tag exists
            if who not in text_widget.tag_names(): # this is slowww <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< (how to do it fast?)
                # find a new color (fixed saturation and value. tint is random)(this ensure us to have only 'pleasant' background colors)						
                r,b,g = map(lambda x: int(x*255), colorsys.hsv_to_rgb( random.Random().random(), 
                                                                        0.30 , # thee important value (0 white, 1.0 intense color)
                                                                        1.0
                                                                      ))			
                t_color = "#%02x%02x%02x"%(r,g,b)
                
                text_widget.tag_config(who, background = t_color)
                text_widget.tag_bind(who, "<Button-1>", lambda event: self.es("Text inserted by %s"%(who), color=t_color))
            # end of new tag
            
            text_widget.insert(startpos, text, who)
            
        else: # no 'who', just insert the text
        
            text_widget.insert(startpos, text)
        
        self.es( "%s insert at %s the content '%s'"%(who, startpos, text), color="yellow" ) # for debugging
        
        return
    
    #@-node:insert text
    #@+node:delete text
    def delete_text(self, startpos, length, op={}):
        """ 
        Some one delete text on the actual node.
        Should delete text in  non "to_send" locations.
        Delete only remote solicitations, local text was already deleted.
        """
    
        if op.get("avoid"):
            self.es( "AutoDeletion is avoiyed", color="yellow") # for debugging
            del op["avoid"] # I hope this will edit the operation stored in the HB
            self.es("HB after operation avoyance %s"% self.HB, color="yellow") # just for debugging
    
            return
    
    
        text_widget = self.text_widget
        
        # convert the starting and end points, considering the "to_send" elements
        ranges = text_widget.tag_ranges("to_send") # return a list of index tuples
        
        for i in range(0, len(ranges), 2):
            # convert text indexes to numerical values
            start =          len(text_widget.get("1.0",     ranges[i]  ))
            stop  =  start + len(text_widget.get(ranges[i], ranges[i+1]))
            
            if start < startpos:
                startpos += (stop - start) # make the startpos include the unsent local text.
                
            if start >= startpos:
                ranges = ranges[i:] # store the rest (including actual pos)
                break
            # else: continue
            
                        
        self.es( "Deleting text at %s len %s"%(startpos, length), color="yellow" ) # for debugging
        
        # delete the text avoiying the "to_send" elements. 
        deleted_text = ""
        offset = 0
        for i in range(0, len(ranges), 2): #ranges contain the indexes of the rest of the "to_send" elements
            # convert text indexes to numerical values
            range_start =                len(text_widget.get("1.0", "%s - %i chars"%(ranges[i], offset)  ))
            range_stop  =  range_start + len(text_widget.get( "%s - %i chars"%(ranges[i], offset), "%s - %i chars"%(ranges[i+1], offset))) 
            
            if startpos + length >= range_start: # there is an overlapping
                            
                t_start = "1.0 + %i chars"%(startpos)
                t_stop  = "1.0 + %i chars"%(range_start)
    
                deleted_text += text_widget.get(t_start, t_stop)  # necessary for algorithm internal undo/redo	operations
                text_widget.delete(t_start, t_stop)
                
                length  -= range_start - startpos
                offset  += range_start - startpos
                startpos = range_stop - (range_start - startpos) # <<<<<<<<< this line is wrong
                # continue
                self.es( "continuing deletion at %s len %s"%(startpos, length), color="yellow" ) # for debugging
            else:
                break
            # end of for
    
        # the last one is direct (or the only one if no ranges==[])
        if length > 0:
            t_start = "1.0 + %i chars"%(startpos)
            t_stop  = "1.0 + %i chars"%(startpos + length)
    
            deleted_text += text_widget.get(t_start, t_stop)  # necessary for algorithm internal undo/redo	operations
            text_widget.delete(t_start, t_stop)
        #end of last deletion
        
        # keep the deleted text for future operation undo
        op["deleted_text"] = deleted_text
        
        return
        
    #@-node:delete text
    #@+node:send operation
    def send_operation(self, op_type, pos, data):
        """
        Apply locally and then send the operation to the central server.
        """
        
        if op_type == "insert_text":
            op_type = "Insert"
            data = toUnicode(data, app().tkEncoding) # convert data to unicode
            #assert type(data) is unicode, "The data to send has to be unicode data"
            # DEPRECATED LINE #data = toUnicode(data, app().tkEncoding).encode("utf-8") # care about Unicode problems
        elif op_type == "delete_text":
            op_type = "Delete"
            
        else:
            raise "Unknown op_type '%s'"%op_type
        
        # apply locally
        self.gen_op(op_type, pos, data, avoid=1) # will avoid the effects the first time.
        
        # send to the server
        self.perspective.callRemote("receive_op", op_type, pos, data, self.state_vector ).addErrback(self.exception)
        
        return
    
    #@-node:send operation
    #@+node:fill body
    def fill_body(self, keywords):
        """
        Process each new key received in the body.
        Attached to OnBodyKey2 (well, really on idle_on_body_key). All params are passed as a keyword.
        Manage insertions, deletions, suppresions, range text overwrite and paste operations.
        
        Note that OnBodyKey2 is called for evey key, but not necesarrely inmediatelly after the key was pressed. The TextWidget contents can have changed since.
            
        fill_body has to mark the to_send chars and trigger the proper delete_text calls.
        This function is associated to the flush_body method, that will check the to_send chars, and send them when proper.
        """
        
        v  = keywords["v"]			
        c  = keywords["c"]		
        ch = keywords["ch"]
        old_sel    = keywords["oldSel"] # (first, last)
        old_text   = keywords["oldText"] or ""
        undo_type  = keywords["undoType"]
        old_insert = old_sel[0]
        old_tags_ranges    = keywords["oldTagsRanges"]	# defined by LeoN
        old_to_send_ranges = old_tags_ranges.get("to_send")
    
        #self.es("fill_body keywords %s"%(keywords), color="yellow") # just for debugging
        #trace("onbodykey2 keywords %s"%(keywords)) # just for debugging
        #if c.undoer.beads: self.es("last bead %s" % c.undoer.beads[c.undoer.bead], color="yellow") # just for debugging
    
    
        # some local helpers functions	
        #@    << def index_to_list>>
        #@+node:<< def index_to_list >>
        def index_to_list(val):
            """
            Convert a Tkinter string index to a list of two integer elements [line, column].
            """
            if type(val) is str:
                return map(int, val.split("."))
            else:
                return val
            
        def list_to_index(val):
            """
            Convert [line, column] list to a Tkinter index.
            """
            return "%i.%i"%tuple(val)
        #@nonl
        #@-node:<< def index_to_list >>
        #@nl
        #@    << def in_range>>
        #@+node:<< def in_range >>
        def in_range(index, ranges):
            """
            return true if the index is in the range. false else.
            the true value returned is the (start, end) tuple corresponding to the range that covers the indicated index.
            """
            
            index =  index_to_list(index)
            
            for i in range(0, len(ranges), 2):	
                start  = index_to_list(ranges[i])
                stop   = index_to_list(ranges[i+1])
        
                if start <= index and index <= stop:
                    return list_to_index(start), list_to_index(stop)
                else:
                    continue
        
            return None # did not found the index in a range
        
        #@-node:<< def in_range >>
        #@nl
        #@    << def range_to_pos_and_length >>
        #@+node:<< def range_to_pos_and_length >>
        def range_to_pos_and_length(start, stop, text):
            """
            Convert a Tkinter range to a (length, position) index (used for the Operations definition).
            """
                
            start = index_to_list(start)
            stop  = index_to_list(stop)
            
            assert text, "The text parameter is %s, this argument is indispensable." % text
                
            if type(text) is unicode:
                text = text.split("\n")
            
            assert type(text[0]) is unicode, "Text data has to be unicode, to be comparable with the tkinter indexes."
            
            # Tkinter count the lines from 1 to N and the columns from zero to N
            
            pos    = start[1] + reduce(lambda x,y: len(y) + x, text[:start[0]-1], 0) + (start[0]-1) # columns + rows lenght + "\n" chars
            length = stop [1] - start[1] + reduce(lambda x,y: len(y) + x, text[start[0]-1:stop[0]-1], 0) + (stop[0] - start[0]) # stop columns - start columns + rows length + "\n" chars
            
            #print "\nrange_to_pos_length(start=%s, stop=%s, some_text) => pos, length == %s, %s"%( start, stop, pos, length) # just for debugging
            
            return pos, length
        #@-node:<< def range_to_pos_and_length >>
        #@nl
        
        if old_sel and old_sel[0] != old_sel[1] and ch: # text was overwritten	(pressed a key while having a non void selection)
            #@        << text was overwritten >>
            #@+node:<< text was overwritten >>
            # (should check which overwritten text was already sent)
            # and should create a sequence of deletion operations
            
            
            self.es("text was overwritten %s; c.undoer.oldMiddleLines %s [0]"%(old_sel, c.undoer.oldMiddleLines), color="yellow")
            
            # need to define the lists:
            #	- text_deletion_ranges
            #   - to_send_deletion_ranges
            
            # has as input:
            #   - old_to_send_ranges
            #   - old_sel
            #   - old_text
                
            #print "old_sel", old_sel
            #print "old_to_send_ranges", old_to_send_ranges
            
            old_sel =	map(index_to_list, old_sel)
            ranges =	old_to_send_ranges
            t_ranges = [] # will keep the list of to_send ranges that are embedded in the old_sel range.
            
            # first we prune the to_send_ranges to get only the ranges of interest
            if not ranges:
                ranges=[]
            i = 0 # if ranges is []
            for i in range(0, len(ranges), 2):	
                start  = index_to_list(ranges[i])
                stop   = index_to_list(ranges[i+1])
                # search the initial range
                
                if start >= old_sel[0]: # found the initial range
                    break # lets continue with a new logic
                elif  stop >= old_sel[0]:
                    t_ranges.append(old_sel[0])
                    t_ranges.append(min(stop, old_sel[1]))
                    i += 2
                    break
                else:
                    continue
            
            for i in range(i, len(ranges), 2):	# starting from last point
                start  = index_to_list(ranges[i])
                stop   = index_to_list(ranges[i+1])	
                
                if start <= old_sel[1]: 
                    t_ranges.append(start)
                else:
                    break # job finished
                    
                if stop <= old_sel[1]:
                    t_ranges.append(stop)
                else:
                    t_ranges.append(old_sel[1])
                    break # job finished
                
            # now we convert the data to lineal ranges and check the valid deletion ranges	
            ranges = to_send_deletion_ranges = t_ranges
            #print "to_send_deletion_ranges", to_send_deletion_ranges
            ranges.insert(0, old_sel[0])
            ranges.append(old_sel[1])
            t_ranges = []
            for i in range(0, len(ranges), 2):	
                t_ranges.append( range_to_pos_and_length(ranges[i], ranges[i+1], old_text) )
            
            ranges   = t_ranges
            t_ranges = []
            t_ranges = filter(lambda x: x[1] > 0, ranges) # if length > 0, keep it
            
            text_deletion_ranges = t_ranges # text_deletion_ranges is a list of (pos, length) tuples that indicates the text areas that where deleted.
            self.es( "text_deletion_ranges %s"%text_deletion_ranges, color="yellow") # just for debugging
            
            # send the deletion operations
            for pos, length in text_deletion_ranges:
                deferred = self.send_operation("delete_text", pos, length)
                
            # mark the overwriter char					
            if ch not in ['\x7f', '\x08']:
                c.frame.body.bodyCtrl.tag_add("to_send",  old_insert)		
            #@-node:<< text was overwritten >>
            #@nl
        elif ch in ['\x7f', '\x08']: 
            #@        << suppression or deletion >>
            #@+node:<< suppression or deletion >>
            # suppression or deletion 
            # if the operation was applied in a to_send char, we omit it,
            # else we add it to the deletion buffer, that will be latter send over the network.
            # the idea is: we sum any deletion operation until any other key is pressed, then we send it.
            
            has_to_delete = None
            ranges = old_to_send_ranges
            if ch == '\x7f': #key Suppr, a suppression
                t_index = old_insert
                t_range = in_range(t_index, ranges) # return the range which touch the index
                if t_range and t_index != t_range[1]:
                    v.client.es("supressed a to_send char", color="yellow")
                    # nothing more to do
                    has_to_delete = None
                else: 
                    # suppressed text
                    delta = 0
                    has_to_delete = 1
                    
            elif ch == '\x08': #key, '\x08' # delete, a deletion
                t_index = old_insert
                t_range = in_range(t_index, ranges) # return the range which touch the index
                if t_range and t_index != t_range[0]:
                    v.client.es("deleted a to_send char", color="yellow")
                    # nothing more to do
                    has_to_delete = None
                else: 
                    # deleted text
                    delta = -1
                    has_to_delete = 1
            
            
            if has_to_delete:
                # at his point the deletion was efectued over a non to_send char, and it need to be registered in the deletion buffer.
                # we register sequences of deletion or suppr key, if the user press any other key, deletion_buffer will be flushed by flush body. If the deletion_buffer was not flushed that means that the last key that was pressed is a deletion or suppression key.
                
                if v.client.client_node.deletion_buffer: # updating a deletion buffer
                    #@        << update the deletion buffer >>
                    #@+node:<< update the deletion buffer >>
                    startpos, t_len = v.client.client_node.deletion_buffer
                    startpos += delta				
                    t_len += 1
                    v.client.client_node.deletion_buffer = (startpos, t_len)
                    
                    #self.es("fill body: updated the deletion buffer [startpos, len] == %s" % ([startpos, t_len]), color="yellow" ) # just for debugging
                    #@nonl
                    #@-node:<< update the deletion buffer >>
                    #@nl
                else: # need to create a new deletion buffer
                    #@        << create a new deletion buffer >>
                    #@+node:<< create a new deletion buffer >>
                    # obtain the startpos; omiting the old_to_send ranges
                    
                    old_insert = index_to_list(old_insert)
                        
                    if t_range: # if the old_insert touch a range
                        # t_range store the range that touch us index. We know that the ranges are ordered from little to bigger. So we cut the old_to_send_ranges list (but including the touching range).		
                        # convert the tuple of "line.column" indexes to a list of indexes.
                        iter_ranges = iter(ranges)
                        ranges= []
                        for t_index in iter_ranges:
                            ranges.append((t_index, iter_ranges.next()))
                        ranges = ranges[:ranges.index(index_to_list(t_range)) + 1]
                    else:
                        # we gonna have to search the ranges, knowing that they do not touch us index
                        t_ranges = []
                        for i in range(0, len(ranges), 2):	
                            stop   = index_to_list(ranges[i+1])
                            if old_insert > stop:
                                start  = index_to_list(ranges[i])
                                t_ranges.append((start, stop))
                                
                        ranges = t_ranges
                        
                    # now we have the list of "to_send" ranges that are found in the range ["1.0", "insert"]
                    
                    # we convert it to a [(pos, lenght), (pos, length), ...] form
                    old_text = old_text.split("\n")
                    t_ranges = []
                    for t_range in ranges:	
                        t_ranges.append( range_to_pos_and_length(t_range[0], t_range[1], old_text) )
                    
                    # we obtain the linear startpos
                    t_startpos  = old_insert[1] + reduce(lambda x,y: len(y) + x, old_text[:old_insert[0]-1], 0) + (old_insert[0]-1) # columns + rows length + "\n" chars
                    
                    
                    # and finally we obtain the real startpos by eliminating the to_send ranges.
                    startpos = t_startpos
                    for pos, length in t_ranges:
                        if pos < t_startpos:
                            startpos -= min(length, t_startpos - pos)
                    
                    # so we create the deletion_buffer !		
                    startpos += delta				
                    t_len = 1
                    v.client.client_node.deletion_buffer = (startpos, t_len)
                    
                    #self.es("fill body: created a new deletion buffer [startpos, len] == %s"%([startpos, t_len]), color="yellow" ) # just for debugging
                    #@-node:<< create a new deletion buffer >>
                    #@nl
            #@-node:<< suppression or deletion >>
            #@nl
        elif undo_type == "Typing" and ch: 
            #@        << "normal" keys>>
            #@+node:<< "normal" keys >>
            # a 'normal' key was typed
            # the flush command is called for every key OnBodyKey1
            # the flush command check the deletion buffer and flush it as necessary
                                
            for tag in c.frame.body.bodyCtrl.tag_names(): #clean up any other tag
                if tag not in ["sel", "to_send"]:
                    c.frame.body.bodyCtrl.tag_remove(tag, old_insert)
                    
            # mark the actual chars					
            c.frame.body.bodyCtrl.tag_add("to_send",  old_insert)		
            
            #v.client.es("%s"%(ch), color="yellow") # just for debugging
            #@nonl
            #@-node:<< "normal" keys >>
            #@nl
        elif undo_type == "Paste":
            #@        << text paste >>
            #@+node:<< text paste >>
            
            
            # some text was pasted in the body
                    
            # get the old_star and old_end indexes
            
            old_paste_start  = keywords["oldSel"][0]
            old_paste_stop   = keywords["newSel"][0]
            
            # mark the inserted chars					
            c.frame.body.tag_add("to_send",  old_paste_start, old_paste_stop)		
            
            
            # tadaa!
            #@nonl
            #@-node:<< text paste >>
            #@nl
        else: 
            # non text insertion keys (move arrow, page up, etc...)
            pass
            #if ch and len(ch) > 0: v.client.es("unmanaged key %c" % ch, color="yellow") # just for debugging
            #v.client.es("unmanaged key of type %s"%(undo_type), color="yellow") # just for debugging
            
                
        self.flush_body(keywords) # send the unsent data and clean up what is necesarry.
        
        return
    #@nonl
    #@-node:fill body
    #@+node:flush body
    def flush_body(self, keywords={}, all=0):
        """
        Send all the "to_send" that acomplish the criteria, send the operation related to the deletion buffer if necessary.
        This is the function that normally generate the operations to be sent (sometimes fill_body create some of them).
        This function is called at the end of fill_body and by idle_body_key if the user press non editing keys.
        """
        
        #self.es("flush_body: being called", color="yellow") # just for debugging
                    
        #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>EDIT THIS CODE should include a deffered.timeout operation that calls flush(all)<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        # can it be done ? what happens whith the arguments ?
        # flush(all) has to disable a future recall
        # flush without all enable a future recall
        # 
        # def deferred_flush(*args):
        #	if v.isOnline():
        #		how to ensure that I will flush the correct body ? hmm.... problem
        # if v.getattr("deferred_flush_call") and v.deferred_flush_call.active(): 
        #	v.deferred_flush_call.reset(5)
        #else:
        #	v.deferred_flush_call = c = defer.Deferred().setTimeout(5, lambda *args: v.client)
        # <<<<<<<<<<<<<<<<<<<<<<<<<<< end of experimental code
    
        undo_type       = keywords.get("undoType")
        ch              = keywords.get("ch")
        
        if self.deletion_buffer:
            if ((undo_type == "Typing" and ch not in ['\x7f', '\x08']) or all):  # at the end of a chunk deletion, that is, the user was deleting (using delete or suppr) but now he has pressed any other key, so we have to send the operation.
            
                # flush the deletion buffer
                deferred = self.send_operation("delete_text", self.deletion_buffer[0], self.deletion_buffer[1])
                
                self.es("deletion_buffer executed with value (%i %i)"%(self.deletion_buffer[0], self.deletion_buffer[1]), color="yellow") # just for debugging
                                
                self.deletion_buffer = ()	
        
            
    
        # flush the insertions
        text = self.text_widget
        #ranges = old_tags_ranges
        # flush body does not require to care about the past, only about the present.
        ranges = self.text_widget.tag_ranges("to_send")
        insert_index= "insert"
        
        for i in range(0, len(ranges), 2):	
            start  = ranges[i]
            stop   = ranges[i+1]
            t_text = None 
    
            # self.es("(%s,%s)"%(start, stop), color="yellow") # for debugging
                    
            # conditions for text flushing -~-~-~-~-~-~-~-~-~-~
            tt_text = text.get("%s - 2 chars"%(stop), stop)
            
            if len(tt_text) == 2 and tt_text[1] in [' ', '\n'] and tt_text[0] != tt_text[1]: # when the user finish a word and insert a space or an enter.
                t_text = text.get(start, stop)		
    
            elif (		text.compare(insert_index, "<", "%s - 5  chars"%(start)) 
                or  text.compare(insert_index, ">", "%s + 5  chars"%(stop) ) ): # if we are 5 chars away from a chunk
                t_text = text.get(start, stop)
                
            elif (   text.compare(insert_index, ">", "%s + 1 lines"%(stop) )
                  or text.compare(insert_index, "<", "%s - 1 lines"%(start)) ) : # if we are 1 lines away from a chunk
                t_text = text.get(start, stop)
    
            elif (   text.compare(stop,   ">", "%s + 2 lines"%(start) )
                  or text.compare(stop,   ">", "%s + 30 chars"%(start)) ) : # if the chunk has more than 2 lines or is bigger than 30 chars.
                t_text = text.get(start, stop)
    
                
            elif all: # if we have to flush every dirty char
                t_text = text.get(start, stop)
                self.last_node_dirty_text.append(t_text)
                
            # check if the conditions trigered some text flushing  -~-~-~-~-~-~-~-~-~-~
    
        
            if t_text:
                #self.es(t_text, color="orange") # for debugging
                #self.es("flush_body, flushing the range (%s,%s)"%(start, stop), color="yellow") # for debugging
                
                # transform the start index to a lineal index
                startpos = len(text.get("1.0", start))
                
                # remove the tags
                text.tag_remove("to_send", start, stop)
                
                # send the data
                self.send_operation("insert_text", startpos, t_text)
                
        return
    #@-node:flush body
    #@-others




#@-node:class ClientNode
#@+node:class LeoNAdminGui
#@+at
# LeoN Admininistration User Interface
# 
# LeoN provide:
#     - networked outlines
#     - web publishing
#     - chat bar
#     - and an interface to administrate the users
# 
# This last aspect is implemented in this branch of the code.
# 
# Look also at LeoN/LeoClient/class LeoClient/admin perspective/
#@-at
#@@c


            
class LeoNAdminGui(Toplevel):
    """
    This class give a nice access to the admin perspective.
    This class is also the AdminDialog and all the related methods.
    """
    
    
    
    def __init__(self, leoclient, v_node):
        """
        Try to access to the admin perspective.
        If success create the interface.
        """

        self.client = leoclient
                
        self.es("Warning, being implemented")

        # define the path
        t_path = self.client.get_node_path(v_node)
        self.node_path = t_path

        #tkSimpleDialog.Dialog.__init__(self, app().root, title="Admin interface") # create the dialog
                    
        # request the admin perspective to the node
        d = self.client.avatar.callRemote("get_perspective", "admin_outline", t_path)
        #d.addCallbacks(self.connected, lambda reason: self.selected_user_var.set("ERROR, could not connect <%s> %s" % (reason.type, reason.getErrorMessage()))) 							 
        
        d.addCallbacks(self.connected, self.client.exception) 							 
        
        return
        
        
    def __del__(self):
        """
        """
       
        return
        
    
    def connected(self, perspective):
        """
        We have just logged in.
        """
    
        if not perspective:
            self.es_error("Could not connect to the server.")
            return
            
        self.perspective = perspective
        
        self.es ("Successfully connected to the administration service.", color="gray")
        
        self.build_dialog() # create the dialog
          
        # download the data     
        self.get_users_list()        
        self.get_users_permissions() 
        return
        
    
    def disconnect(self,):
        
        self.client.es("End of admin gui.", color="gray")
        
        self.client.es("Perspective disconnection not yet implemented.", color="red") #<<< what to do and how to do this ?
        return

    def es(self, text, color="gray"):
        """
        Messages to the user
        """
        try:
            self.info_string.set(text)    
        except:
            pass
            
        self.client.es(text, color=color)	# print messages method 
            
        return
    #@    @+others
    #@+node:build dialog
    #@+at
    # Methods stolen from tkSimpleDialog.Dialog, jejeje...
    #@-at
    #@@c
    
    def build_dialog(self):
        """
        Create and initialize a dialog.
        """
        
        title="Admin interface"
        self.parent = parent = app().root
            
        Toplevel.__init__(self, parent)
        #self.transient(parent)
    
        if title:
            self.title(title)
    
        self.result = None
    
        #body = Frame(self)
        #self.initial_focus = self.body(body)
        ret = self.body(self)
        self.initial_focus = ret #actually is None !
        #body.pack(padx=5, pady=5)
    
    
        self.grab_set()
    
        if not self.initial_focus:
            self.initial_focus = self
    
        self.protocol("WM_DELETE_WINDOW", self.destroy)
    
        if self.parent != None:
            self.geometry("+%d+%d" % (parent.winfo_rootx()+50, parent.winfo_rooty()+50))
    
        #self.initial_focus.focus_set()
    
        #self.es("Now wait for the window.") # just for debugging
        #self.wait_window(self) 
        
        return
    
    def destroy(self, event=None):
        '''Destroy the window'''
        # put focus back to the parent window
        if self.parent is not None:
            self.parent.focus_set()
            
        self.initial_focus = None
        Toplevel.destroy(self)
        
        self.disconnect()
        return
    #@-node:build dialog
    #@+node:body
    def body(self, base_frame):
        """
        build the dialog body. create the tkwindow.
        """
    
        users_accounts_frame = Frame(base_frame, relief=RIDGE, borderwidth= 1)
        users_accounts_frame.grid(row=2, column=0, sticky=N) 
        master = users_accounts_frame
        #@    << users accounts frame >>
        #@+node:<< users accounts frame >>
        frame = Frame(master, relief=FLAT, borderwidth= 1)
        frame.grid()
        
        Label(frame, text="Users accounts (on the server)").grid(row=0, columnspan=2, sticky=W)
            
        frame0 = Frame(frame, relief= GROOVE, borderwidth = 2)
        frame0.grid(row=1, column=1, sticky=W + E + N, padx=5, pady=5)
        
        #@<< users list >>
        #@+node:<< users list >>
        # Add to node
        self.add_user_entry_button = Button(frame0, text="Add user entry >>>", command= self.add_user_entry)
        self.add_user_entry_button.grid(row=0, column=0, columnspan=2, sticky=E)
        self.add_user_entry_button.config(state=DISABLED)
        
        
        # users list
        s = Scrollbar(frame0, orient=VERTICAL)
        self.users_listbox = users_listbox = Listbox(frame0, yscrollcommand=s.set)
        s.config(command = users_listbox.yview)
        users_listbox.grid(row=1, column=0, sticky=N+S)
        s.grid(row=1, column=1, sticky=N+S)
        
        self.users_list = None # the data element
        users_listbox.insert(END, "Please wait...")
        users_listbox.insert(END, "Downloading users list...")
        users_listbox.bind("<Button>", self.on_user_selection)
        
        
        
        #@-node:<< users list >>
        #@afterref
 # on frame0
        
            
        # frame 1
        frame1 = Frame(frame, relief= GROOVE, borderwidth = 2)
        frame1.grid(row=1, column=0, sticky=W + E + N, padx=5, pady=5)
        
        #@<< users accounts actions >>
        #@+node:<< users accounts actions >>
        
        
        # delete user
        self.delete_account_button = Button(frame1, text="Delete the selected account", command= self.delete_account )
        self.delete_account_button.grid(row=0, column=0, sticky=E)
        self.delete_account_button.config(state=DISABLED)
        
        # change password
        frame_a = Frame(frame1, relief= GROOVE, borderwidth = 2)
        frame_a.grid(row=1, column=0, sticky=W + E, padx=5, pady=5)
        
        Label(frame_a, text="Password").grid(row=1, column=0, sticky=W)
        self.new_password_entry = Entry(frame_a, show='*')
        self.new_password_entry.grid(row=1, column=1, sticky=E)
        
        Label(frame_a, text="Confirm").grid(row=2, column=0, sticky=W)
        self.new_password_confirm_entry = Entry(frame_a, show='*')
        self.new_password_confirm_entry.grid(row=2, column=1, sticky=E)
        
        self.change_password_button = Button(frame_a, text="Change Account's Password", command= self.change_password)
        self.change_password_button.grid(row=4, column=1, sticky=E)
        self.change_password_button.config(state=DISABLED)
        
        # create new account
        
        frame_b = Frame(frame1, relief= GROOVE, borderwidth = 2)
        frame_b.grid(row=2, column=0, sticky=W + E, padx=5, pady=5)
        
        Label(frame_b, text="Username").grid(row=0, column=0, sticky=W)
        self.username_entry = Entry(frame_b)
        self.username_entry.grid(row=0, column=1, sticky=E)
        
        Label(frame_b, text="Password").grid(row=1, column=0, sticky=W)
        self.password_entry = Entry(frame_b, show='*')
        self.password_entry.grid(row=1, column=1, sticky=E)
        
        Label(frame_b, text="Confirm").grid(row=2, column=0, sticky=W)
        self.confirm_password_entry = Entry(frame_b, show='*')
        self.confirm_password_entry.grid(row=2, column=1, sticky=E)
        
        Button(frame_b, text="Add an account", command= self.add_account).grid(row=3, column=1, sticky=E)
        #@-node:<< users accounts actions >>
        #@nl
        
        #@-node:<< users accounts frame >>
        #@nl
        
        node_permissions_frame = Frame(base_frame, relief=RIDGE, borderwidth= 1)
        node_permissions_frame.grid(row=2, column=1, sticky=N) 
        master = node_permissions_frame
        #@    << node permissions frame >>
        #@+node:<< node permissions frame >>
        
        
        Label(master, text="Node permissions").grid(row=0, column=0, columnspan=2, sticky=W)
        
        Label(master, text="path:").grid(row=1, column=0, sticky=W)
        Label(master, text=self.node_path, foreground="green3", justify=LEFT).grid(row=1, column=1, sticky=W)
        
        frame = Frame(master, relief=GROOVE, borderwidth= 2)
        frame.grid(row=3, column=0, columnspan=2, sticky = N+S, ipadx=3, ipady=3)
        
        Label(master, text="(non defined permissions are herited)").grid(row=4, column=0, columnspan=2, sticky=S+W+E)
            
        # ------------------------
        
        self.selected_user_var = selected_user = StringVar()
        selected_user.set("Please wait...")
        #selected_user.set("Click to select an User") #will set this after get_users_permisssions
        
        # the names menu
        self.users_menu = Menu(frame)
        
        # users will be set this after get_users_permisssions
        #for t_name in ["user1", "user2", "user_etc.."]:
        #    self.users_menu.add_command(label=t_name, command= lambda a_name=t_name: selected_user.set(a_name) )	# 'a_name' is required to copy the value, NOT the reference.
        
        self.users_menu.add_separator()
        
        # the button
        Label(frame, text="User:").grid(row=12, sticky=W)
        selected_user_button =  Button(frame, textvariable= selected_user, relief=FLAT, foreground="blue" )
        selected_user_button.bind("<Button>", lambda event: self.users_menu.post(event.x_root, event.y_root))
        selected_user_button.grid(row=12, column=1, sticky=W)
        
        # ----------------------------
        # ['Read', 'Node_edit', 'Tree_edit', 'Admin_node']
        self.check_buttons = {}
        v = IntVar()
        self.check_buttons["Read"]=Checkbutton(frame, text="Read/Access", variable=v, command=lambda e=None: self.es("Checkbutton switched (read/access)") )
        self.check_buttons["Read"].var = v
        self.check_buttons["Read"].grid(row=13, columnspan=2, sticky=W)
        
        v = IntVar()
        self.check_buttons["Node_edit"] = Checkbutton(frame, text="Node edit", variable=v, command=lambda e=None: self.es("Checkbutton switched (node)") )
        self.check_buttons["Node_edit"].var = v
        self.check_buttons["Node_edit"].grid(row=14, columnspan=2, sticky=W)
        
        v = IntVar()
        self.check_buttons["Tree_edit"] = Checkbutton(frame, text="Tree edit", variable=v, command=lambda e=None: self.es("Checkbutton switched (tree)") )
        self.check_buttons["Tree_edit"].var = v
        self.check_buttons["Tree_edit"].grid(row=15, columnspan=2, sticky=W)
        
        v = IntVar()
        self.check_buttons["Admin_node"] = Checkbutton(frame, text="Admin node", variable=v, command=lambda e=None: self.es("Checkbutton switched (admin)") )
        self.check_buttons["Admin_node"].var = v
        self.check_buttons["Admin_node"].grid(row=16, columnspan=2, sticky=W)
        
        Button(frame, text="Save Changes", command= self.set_permissions).grid(row=17, column=1, sticky=E)
        Label(frame, text="").grid(row=18, column=0, columnspan=2) # insert a vertical space
        Button(frame, text="Delete user permissions", command= self.delete_user_permissions ).grid(row=19, column=1, sticky=E)
        
        
        #@-node:<< node permissions frame >>
        #@nl
        
        # the infor string
        self.info_string = StringVar()
        Label(base_frame, textvariable= self.info_string, relief= GROOVE).grid(row=3, columnspan=2, sticky=W+E) 
        self.info_string.set("here info text.")
    
        # the help button
        Button(base_frame, text="Help", command= self.show_help, relief=FLAT ).grid(row=4, columnspan=2, sticky=E)
            
        return
    
    
    #@-node:body
    #@+node:dialog methods
    #@+at
    # methods that realize the commands triggered by the dialog interface.
    #@-at
    #@@c
    
    
    def exception(self, reason):
        """
        Dialog exception
        """
        self.info_string.set("ERROR (see main window)")
        self.client.exception(reason)
        return
    #@-node:dialog methods
    #@+node:show help
    # help is defined at the class level; to avoid leo identation problems
    #@<< admingui help >>
    #@+node:<< admingui help >> (for administrators)
    #@@color
    #@@language python
    # this is the documentation that will see the end user, give a description of the panel and his usage
    # this is part of the code, do not delete the "help" definition and the """ elements.
    help = \
    """
    
    The administration gui allow you to do two things:
        - Define the permissions of each user at each node
        - Define the accounts of the server, defined by they name and password.
    
    The accounts are defined at the server level. The permissions are defined at a per node level.
        
    Thus the interface is separated in two areas, the left pane -the users accounts- and the right pane -the node permissions-.
    
    The left pane present the list of the defined accounts, and interfaces to create new accounts, to change passwords and to delete some accounts. Be carefull, there is no undo! 
    
    Creating an account for an user is not enough to allow it to access the server, you need to define his permissions at the access point.
    
    The right pane allow you to you the edit the per node per user permissions.
    The LeoN permissions system is similar to the Zope permissions system.
    
    If a node contain no permissions information about an user, they permissions will be herited from uper nodes. So defining the permissions for the root node will be valid for all the nodes of the system. To change the permissions in a branch, edit the permissions of the root node of the branch.
    
    You have to understand that adding permissions for a user at a node and leaving in blank the options indicate that you are Prohibiting all those permissions for that user, starting from that node and in the suboutline.
    
    The admin gui allow you to edit the permissions of the node where you raised the dialog.
    You can add users permissions using the "Add user entry >>>" button, that will add an entry in the node permissions list.
    
    You can edit the different permissions of the node by selecting different users via the  "User:" combobox, click over the user name and a choice list will appear. Remember to press the "Save Changes" button to confirm the modifications.
    
    The button "Delete users permissions" will eliminate the entry at that node, and the permissions for that user at that node will be searched upward in the server outline.
    
    If no permissions entry are found for an user, by default he will have no permissions at (thus it will not be able to connect to the server).
    
    Remember to define the permissions of the users recently created. 
    Avoid defining permissions in every node, if would become difficult to maintain. Try to always edit the permissions at the project root nodes.
    
    The users accounts and their permissions are persisted in the server '.tap' file.
    
    Read/Access: allow the users to retreive the node body content and connect at that point.
    Node edit:   allow to enter in collaborative mode and edit the node body content.
    Tree edit:   allow to insert, move and delete nodes in the outlines. 
    Admin node:  allow to edit the permissions of that node, and the accounts of the server (allow access to this dialog).
    
    Note: be aware that in the actual version the server/client connections are not encrypted. Thus all the data, including the passwords are transmited in a easy to deduce binary format. Do not transfer sensible data over insecure network.
    """
    
    
    #@+others
    #@-others
    #@nonl
    #@-node:<< admingui help >> (for administrators)
    #@afterref
 # define 'help' (at the class level)
    
    def show_help(self, event=None):
        """
        Show a help window.
        """
    
        from ScrolledText import ScrolledText
        top = Toplevel(self)
        top.title("Help about the Admin Window")
        t = ScrolledText(top, wrap=WORD, padx=50); t.pack(expand=1, fill=BOTH)
        t.insert("1.0", self.help) # insert the content
        Button(top, text="Close", command= top.destroy).pack()
        top.protocol("WM_DELETE_WINDOW", top.destroy)
    
        self.wait_window(top) # show
        
        #tkMessageBox.showinfo(title="Help about admin gui usage", message= help)
        return
    #@nonl
    #@-node:show help
    #@+node:get users list
    def get_users_list(self,):
        """
        Retrieve the list of defined users accounts 
        """
        self.perspective.callRemote("get_users_list").addCallbacks(self.got_users_list, self.exception)
        self.info_string.set("Downloading the users accounts data. Please wait.")
        return
        
    def got_users_list(self, users_list):
        """
        Receive the users list and update the listbox
        """
        self.info_string.set("Users accounts data downloaded.")    
        
        self.users_list = users_list
        
        users_list.sort() # put in alphabetical order
        
        self.users_listbox.delete(0, END) # deleteing everything
        
        for t_user in users_list:
            self.users_listbox.insert(END, t_user) # insert every users
        
        return
    
    
    
    
    #@-node:get users list
    #@+node:on user selection
    def on_user_selection(self, event=None):
        """
        React when a user account is selected
        """
        
        if self.users_list == None:
            return # no real data aviable
            
        self.add_user_entry_button.config(state= NORMAL)
        self.delete_account_button.config(state= NORMAL)
        self.change_password_button.config(state= NORMAL)
        return
    #@nonl
    #@-node:on user selection
    #@+node:add user entry
    def add_user_entry(self, event=None):
        """
        Add an entry of the selected node. Will define void permissions for that user.
        """
        
        t_list = self.users_listbox.curselection()
        if not t_list:
            self.es("You have to select an user account to add to the node permissions.")
            return
    
        listbox_index = t_list[0]        
        username = self.users_listbox.get(listbox_index)
    
        if self.permissions_data.has_key(username):
            self.es("The user %s already has permissions defined for this node." % username)
            return    
    
        self.es("Adding user permissions...")
        # the remote methods use relative paths
        self.perspective.callRemote("set_permissions", username, u"/", []).addCallback(self.has_added_permissions, username).addErrback(self.exception)
        return
        
        
        
    def has_added_permissions(self, ret, username):
        """
        Callback, add the entry in the node permissions gui
        """
         
        # add the new entry
        self.permissions_data[username] =  [] # names-> permissions list
        
        # ReConstruct the ComboBox, the names menu
        self.users_menu.delete(0, END) # delete the old entires self.users_menu.delete(start, stop)
        self.users_menu.add_separator()
        
        # users will be set this after get_users_permisssions
        t_list = self.permissions_data.keys(); t_list.sort() # add in alphabetical order
        for t_name in t_list:
            self.users_menu.add_command(label=t_name, command= lambda a_name=t_name: self.select_user_permissions(a_name) )	# 'a_name' is required to copy the value, NOT the reference.
            
        self.select_user_permissions(username) # show the new entry    
          
        self.es("Void permissions for %s in the reference node where added. Please edit them." % username)
                     
        return
    
    
    
    
    #@-node:add user entry
    #@+node:add account
    def add_account(self, event=None):
        """
        Allow to the administrator to create new user accounts on the server.    
        """
        username = self.username_entry.get()
        password = self.password_entry.get()
        confirm_password = self.confirm_password_entry.get()
    
        # ARE HERE UNICODE ISSUES ? SHOULD convert from tk encoding to utf-8 ? hmmm...
        
        if len(username) < 3:
            self.es("The username is too short, please choose a longer one.")
            return
        
        if len(password) < 3:
            self.es("The password is too short, please choose a longer one.")
            return
        
        if password != confirm_password:
            self.es("Password and confirmation of new account does not match. Please reenter them.")
            return
        
        if username in self.users_list:
            self.es("The user %s already exist." % username)
            return
        
        self.perspective.callRemote("create_account", username, password).addCallback(self.has_added_account, username).addErrback(self.exception)
        
        return
        
    def has_added_account(self, ret, username):
        """
        Callback
        """
        
        # add to the local users list
        self.users_list.append(username)
        self.users_list.sort() # put in alphabetical order
        
        self.users_listbox.delete(0, END) # deleting everything
        for t_user in self.users_list:
            self.users_listbox.insert(END, t_user) # insert every users
            
        self.es("The account for %s was succesfully created." % username)
        
        return
    
    
    
    
    
    #@-node:add account
    #@+node:change password
    def change_password(self, event=None):
        """
        Change the password of an existing account.
        """
        
        t_list = self.users_listbox.curselection()
        if not t_list:
            self.es("You have to select an user account in order to change his password.")
            return
    
        listbox_index = t_list[0]        
        username = self.users_listbox.get(listbox_index)
       
        password = self.new_password_entry.get() 
        confirm_password = self.new_password_confirm_entry.get()
    
        # ARE HERE UNICODE ISSUES ? SHOULD convert from tk encoding to utf-8 ? hmmm...
        
        
        if len(password) < 3:
            self.es("The password is too short, please choose a longer one.")
            return
        
        if password != confirm_password:
            self.es("Password and confirmation of new account does not match. Please reenter them.")
            return
        
        if username not in self.users_list:
            self.es("The user %s does not exist. (bizarre error)" % username)
            return
        
        self.perspective.callRemote("change_password", username, password).addCallback(self.has_changed_password, username).addErrback(self.exception)
            
        return
        
        
    def has_changed_password(self, ret, username):
        """
        Callback
        """
        
        self.es("The password of %s was succesfully edited." % username)
        return
    
    #@-node:change password
    #@+node:delete account
    
    def delete_account(self, event=None):
        """
        Delete the account in the system
        """
            
        t_list = self.users_listbox.curselection()
        if not t_list:
            self.es("You have to select an user account to delete.")
            return
    
        listbox_index = t_list[0]        
        username = self.users_listbox.get(listbox_index)
                    
        result = tkMessageBox.askyesno(title="Delete an account", message="Are you sure that you want to delete the access of %s to the server ?\nTHERE IS NO UNDO !"%(username))
        
        if result:
            self.es("Deleting user account...")
            d = self.perspective.callRemote("delete_account", username)
            d.addCallback(self.has_deleted_an_account, username, listbox_index)
            d.addErrback(self.exception)
        else:
            self.es("Deletion canceled.")
        
        return 
        
    def has_deleted_an_account(self, ret, username, listbox_index):
        """
        Callback
        """
          
        assert username == self.users_listbox.get(listbox_index) # if user force the interface, this can go wrong (I know how to destroy the world...)
        
        # delete the users list reference
        self.users_listbox.delete(listbox_index) 
        
        # delete from users node permissions menu
        if self.permissions_data.has_key(username): 
        
            del self.permissions_data[username]
            
            # ReConstruct the ComboBox, the names menu
            self.reconstruct_names_combobox(self.permissions_data.keys())    
    
            
        self.es("User %s deleted from the system." % username)
        
        return
    #@-node:delete account
    #@+node:reconstruct names combobox
    def reconstruct_names_combobox(self, names_list):
        """
        helper gui methods that reconstruct the combobox, the combobox allow to select a user to edit his local node permissions
        """
        
        if not getattr(self,"users_menu", None):
            return
            
        self.users_menu.delete(0, END) # delete the old entires self.users_menu.delete(start, stop)
        self.users_menu.add_separator()
        
        # users will be set this after get_users_permisssions
        t_list = names_list 
        t_list.sort() # add in alphabetical order
        for t_name in t_list:
            self.users_menu.add_command(label=t_name, command= lambda a_name=t_name: self.select_user_permissions(a_name) )	# 'a_name' is required to copy the value, NOT the reference.
                    
        for t_button in self.check_buttons.values():
            t_button["state"] = DISABLED   
            
        if t_list:
            self.selected_user_var.set("Click to select an User") 
        else:
            self.selected_user_var.set("No users permissions on this node") 
    
        return
    #@nonl
    #@-node:reconstruct names combobox
    #@+node:get users permissions
    def get_users_permissions(self,):
        """
        Retrieve the permissions dictionary of the node
        """
        # the remote methods use relative paths
        self.perspective.callRemote("get_users_permissions", u"/").addCallbacks(self.got_users_permissions, self.exception)
        self.info_string.set("Downloading the users permissions data. Please wait.")
        return
        
    def got_users_permissions(self, permissions_dict):
        """
        Receive the permissions dict and update the menu
        """
        self.info_string.set("Users permissions data downloaded.")    
        
        self.permissions_data =  permissions_dict # names-> permissions list
        
        # ReConstruct the ComboBox, the names menu
        self.reconstruct_names_combobox(self.permissions_data.keys())
        
        return
    
    
    #@-node:get users permissions
    #@+node:select user permissions
    def select_user_permissions(self, username):
        """
        Update the window when a new user has been selected
        """
            
        self.selected_user_var.set(username) # users combobox
        
        if not self.permissions_data.has_key(username):
                self.info_string.set("No data aviable for user '%s'"% username)
                for t_button in self.check_buttons.values():
                    t_button["state"] = DISABLED   
                return
        
        for t_button in self.check_buttons.values():
            t_button["state"] = NORMAL  
            t_button.deselect() # everything off
            
         
        for t_name in self.permissions_data[username]:
            self.check_buttons[t_name].select() # put on the correct items
            
    
        self.es("Permissions of the user %s." % username)   
        
        return
    
    
    #@-node:select user permissions
    #@+node:set permissions
    def set_permissions(self, event=None):
        
        username = self.selected_user_var.get()
        
        if username not in self.permissions_data.keys():
            self.es("You have to select the user to edit.")
            return
                
        permissions = []
        for t_key, t_button in self.check_buttons.items():
            if t_button.var.get():
                permissions.append(t_key)
        
        #self.es("permissions == %s" % permissions) #just for debugging
    
        # the remote methods use relative paths
        self.es("Updating user permissions...")
        self.perspective.callRemote("set_permissions", username, u"/", permissions).addCallback(self.has_set_permissions, username).addErrback(self.exception)
        return
        
        
        
    def has_set_permissions(self, ret, username):
         
         self.es("Permissions of %s where updated." % username)
             
         return
    #@-node:set permissions
    #@+node:delete user permissions
    
    def delete_user_permissions(self, event=None):
        """
        Delete the permissions of a user in the reference node. Now upward permissions will apply to that node.
        """
        
        username = self.selected_user_var.get()
        
        if username not in self.permissions_data.keys():
            self.es("You have to select the user to delete.")
            return
                
        result = tkMessageBox.askyesno(title="Delete an account", message="Are you sure that you want to delete the permissions of %s in the node '%s' ?\nUpper node permissions will be propagated.\nTHERE IS NO UNDO !"%(username, self.node_path))
        
        if result:
            self.es("Deleting user permissions...")
            d = self.perspective.callRemote("delete_permissions", username, u"/") # the remote methods use relative paths
            d.addCallback(self.has_deleted_user_permissions, username)
            d.addErrback(self.exception)
        else:
            self.es("Deletion canceled.")
        
        return 
        
    def has_deleted_user_permissions(self, ret, username):
        """
        Callback
        """
        
        # delete from users node permissions menu
        if self.permissions_data.has_key(username): 
        
            del self.permissions_data[username]
    
            # ReConstruct the ComboBox, the names menu
            self.reconstruct_names_combobox(self.permissions_data.keys())    
        
        self.es("Permissions of user %s deleted from the reference node." % username)
        
        return
    
    
    
    
    #@-node:delete user permissions
    #@-others


#@-node:class LeoNAdminGui
#@-others


#@+at
# Some tests for this module are aviable at the LeoNtest.leo file, as 
# executable nodes that execute automated sequences of operations.
# Run "./LeoNtest.py 1" or "./LeoNtest.py 2" to setup a test bed of one or two 
# clients.
#@-at
#@@c

#@-node:@file LeoClient.py
#@-leo
