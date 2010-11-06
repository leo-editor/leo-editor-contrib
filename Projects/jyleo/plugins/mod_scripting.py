#@+leo-ver=4-thin
#@+node:EKR.20040613213623:@thin mod_scripting.py
#@<< docstring >>
#@+node:ekr.20050130155124:<< docstring >>
"""A plugin to create script buttons and @button, @plugin and @script nodes.

This plugin puts two buttons in the icon area: a button called 'run Script' and
a button called 'script Button'.

The 'run Script' button is simply another way of doing the Execute Script
command: it executes the selected text of the presently selected node, or the
entire text if no text is selected.

The 'script Button' button creates another button in the icon area every time
you push it. The name of the button is the headline of the presently selected
node. Hitting this _new_ button executes the button's script.

For example, to run a script on any part of an outline do the following:

1.  Select the node containing the script.
2.  Press the scriptButton button.  This will create a new button, call it X.
3.  Select the node on which you want to run the script.
4.  Push button X.

That's all.  You can delete a script button by right-clicking on it.

This plugin optionally scans for @button nodes, @plugin nodes and @script nodes
whenever a .leo file is opened.

- @button nodes create script buttons.
- @plugin nodes cause plugins to be loaded.
- @script nodes cause a script to be executed when opening a .leo file.

Such nodes may be security risks. This plugin scans for such nodes only if the
corresponding atButtonNodes, atPluginNodes, and atScriptNodes constants are set
to True in this plugin.

Notes:
    
- This plugin is based on ideas from e's dynabutton plugin.
    
- The bindLate option in this file determines whether changing the text of the
node will affect what script gets executed when a script button is pressed. The
default (recommended) setting is True, in which case the script that gets
executed is the present contents of the node used to create the script button.
If bindLate is False, the original script is used whenever you press the script
button."""
#@nonl
#@-node:ekr.20050130155124:<< docstring >>
#@nl
#@<< imports >>
#@+node:EKR.20040613215415:<< imports >>
import leoGlobals as g
import leoPlugins

#Tk = g.importExtension('Tkinter',pluginName=__name__,verbose=True)
import javax.swing as swing
import java.awt.event as aevent
from utilities.DefCallable import DefCallable

import sys
import java
#@-node:EKR.20040613215415:<< imports >>
#@nl

__version__ = "0.10"
#@<< version history >>
#@+node:ekr.20040908094021:<< version history >>
#@+at
# 
# 0.3 EKR:
#     - Don't mess with button sizes or fonts on MacOs/darwin
# 0.4 EKR:
#     -Added support for @button, @script and @plugin.
# 0.5 EKR:
#     - Added patch by Davide Salomoni: added start2 hook and related code.
# 0.5 EKR:
#     - Use g.importExtention to import Tk.
# 0.6.1 EKR:
#     - Add much better docstring.
# 0.7 EKR:
#     - Added support for 'removeMe' hack.
#         Buttons can asked to be removed by setting 
# s.app.scriptDict['removeMe'] = True.
# 0.8 EKR:
#     - c.disableCommandsMessage disables buttons.
# 0.9 EKR:
#     - Added init, onCreate.
#     - Created scriptingController class.
# 0.10 EKR:
#     - Changed 'new_c' logic to 'c' logic.
#@-at
#@nonl
#@-node:ekr.20040908094021:<< version history >>
#@nl

bindLate = True
    # True (recommended) bind script when script is executed.
    # Allows you to change the script after creating the script button.
    # False: Bind script when button is created.
atButtonNodes = True
    # True: adds a button for every @button node.
atPluginNodes = False
    # True: dynamically loads plugins in @plugins nodes when a window is created.
atScriptNodes = False
    # True: dynamically executes script in @script nodes when a window is created.  DANGEROUS!
maxButtonSize = 18
    # Maximum length of button names.

#@+others
#@+node:ekr.20050302082838:init
def init ():
    
    #ok = Tk and not g.app.unitTesting
    ok = 1
    
    if ok:
        #if g.app.gui is None:
        #    g.app.createTkGui(__file__)
            
        #ok = g.app.gui.guiName() == "tkinter"

        if ok:
            # Note: call onCreate _after_ reading the .leo file.
            # That is, the 'after-create-leo-frame' hook is too early!
            #import java
            leoPlugins.registerHandler( ("start2", "new", "open2") ,onCreate)
            g.plugin_signon(__name__)
        
    return ok
#@nonl
#@-node:ekr.20050302082838:init
#@+node:EKR.20040613215415.2:onCreate
c_to_controllers = []
def onCreate (tag, keys):

    """Handle the onCreate event in the mod_scripting plugin."""
    if keys.has_key( "c" ):
        c = keys.get('c')
    elif keys.has_key( "new_c" ):
        c = keys.get( "new_c" )
    else:
        c = None
        
    if c and c not in c_to_controllers:
        sc = scriptingController(c)
        c_to_controllers.append( c )
        sc.createAllButtons()
#@nonl
#@-node:EKR.20040613215415.2:onCreate
#@+node:ekr.20050302082838.1:class scriptingController
class scriptingController:
    
    #@    @+others
    #@+node:ekr.20050302082838.2: ctor
    def __init__ (self,c):
        
        self.c = c
        self.d = {}
        self.buttons = 0
        self.scanned = False
    #@nonl
    #@-node:ekr.20050302082838.2: ctor
    #@+node:zorcanda!.20051019152045:class ButtonRemover
    class ButtonRemover( aevent.MouseAdapter ):
        
        def __init__( self, button ):
            aevent.MouseAdapter.__init__( self )
            self.button = button
            
        def mousePressed( self, event ):
            
            if event.getButton() == event.BUTTON3:
                parent = self.button.getParent()
                parent.remove( self.button )
                parent.repaint()
                
    #@-node:zorcanda!.20051019152045:class ButtonRemover
    #@+node:ekr.20050308105005:createAllButtons
    def createAllButtons (self):
    
        global atButtonNodes,atPluginNodes,atScriptNodes
        
        c = self.c
    
        if not self.scanned: # Not really needed, but can't hurt.
            self.scanned = True
            self.createStandardButtons()
    
            # scan for user-defined nodes.
            for p in c.allNodes_iter():
                if atButtonNodes and p.headString().startswith("@button"):
                    self.createDynamicButton(p)
                if atPluginNodes and p.headString().startswith("@plugin"):
                    self.loadPlugin(p)
                if atScriptNodes and p.headString().startswith("@script"):
                    self.executeScriptNode(p)
    #@nonl
    #@-node:ekr.20050308105005:createAllButtons
    #@+node:ekr.20041001184024:createDynamicButton
    def createDynamicButton (self,p):
        
        tag = "@button"
        c = self.c ; p = p.copy()
        text = p.headString()
        assert(g.match(text,0,tag))
        key = text = text[len(tag):].strip()
        #script = g.getScript(c,p,useSelectedText=False)
        language = g.scanForAtLanguage( self, p.copy() )
        script = g.getScript(c,p,useSelectedText= False)
        buttonText = text[:maxButtonSize]
    
        statusLine = "Script button: %s" % text
        bg = 'LightSteelBlue1'
        b = c.frame.addIconButton(text=buttonText)
        
        #@    << define callbacks for dynamic buttons >>
        #@+node:ekr.20041001185413:<< define callbacks for dynamic buttons >>
        def deleteButtonCallback(event=None,self=self,key=key):
            self.deleteButton(key)
            
        def execCommandCallback (event=None,self=self,b=b,script=script,buttonText=buttonText, language = language):
            c = self.c
            if c.disableCommandsMessage:
                g.es(c.disableCommandsMessage,color='blue')
            else:
                g.app.scriptDict = {}
                if not language:
                    language = "python"
                c.executeScript(script=script, language = language)
                # A useful hack: remove the button if the script asks to be removed.
                # In particular, this will remove the spelling button if it can't be inited.
                if g.app.scriptDict.get('removeMe'):
                    g.es("Removing '%s' button at its request" % (buttonText))
                    b.pack_forget()
            
        def mouseEnterCallback(event=None,self=self,statusLine=statusLine):
            self.mouseEnter(statusLine)
            
        def mouseLeaveCallback(event=None,self=self):
            self.mouseLeave()
        #@nonl
        #@-node:ekr.20041001185413:<< define callbacks for dynamic buttons >>
        #@nl
    
        if not b: return
        self.d [key] = b
        #if sys.platform == "win32":
        #    width = int(len(text) * 0.9)
        #   b.configure(width=width,font=('verdana',7,'bold'),bg=bg)
        #b.configure(command=execCommandCallback)
        b.actionPerformed = execCommandCallback
        b.addMouseListener( self.ButtonRemover( b ) )
        #b.bind('<3>',deleteButtonCallback)
        #b.bind('<Enter>', mouseEnterCallback)
        #b.bind('<Leave>', mouseLeaveCallback)
    #@-node:ekr.20041001184024:createDynamicButton
    #@+node:ekr.20041001183818:createStandardButtons
    def createStandardButtons(self):
    
        c = self.c ; p = c.currentPosition() ; h = p.headString()
        script = p.bodyString()
    
        #@    << define execCommand >>
        #@+node:EKR.20040618091543.1:<< define execCommand >>
        def execCommand (event=None):
        
            c = self.c
            c.executeScript(c.currentPosition(),useSelectedText=True)
        #@nonl
        #@-node:EKR.20040618091543.1:<< define execCommand >>
        #@nl
        #@    << define addScriptButtonCommand >>
        #@+node:EKR.20040618091543.2:<< define addScriptButtonCommand >>
        def addScriptButtonCommand (event=None,self=self):
            # Create permanent bindings for callbacks.
            c = self.c ; p = c.currentPosition()
            self.buttons += 1
            # New in 4.2.1: always use the entire body string.
            script = g.getScript(c,p,useSelectedText=False)
            h = p.headString().strip()
            buttonName = key = "Script %d" % self.buttons
            # Strip @button off the name.
            tag = "@button"
            if h.startswith(tag):
                h = h[len(tag):].strip()
            if not h: return
            text = h
            statusMessage = "Run script: %s" % text
            buttonText = text[:maxButtonSize]
            # Create the button.
            b = c.frame.addIconButton(text=buttonText)
            #@    << define callbacks for addScriptButton >>
            #@+node:EKR.20040613231552:<< define callbacks for addScriptButton >>
            def deleteButtonCallback(event=None,self=self,buttonName=buttonName):
                self.deleteButton(buttonName)
                
            def commandCallback(event=None,self=self,b=b,p=p.copy(),script=script,statusMessage=statusMessage ):
                global bindLate
                c = self.c
                if c.disableCommandsMessage:
                    g.es(c.disableCommandsMessage,color='blue')
                else:
                    if script is None: script = ""
                    c.frame.clearStatusLine()
                    c.frame.putStatusLine("Executing %s..." % statusMessage)
                    g.app.scriptDict = {}
                    if bindLate:
                        # New in 4.2.1: always use the entire body string.
                        script = g.getScript(c,p,useSelectedText=False)
                    if script:
                        language = g.scanForAtLanguage( self, p.copy() )
                        if not language:
                            language = "python"
                        c.executeScript(script=script, language = language)
                    else:
                        g.es("No script selected",color="blue")
                        
                    # A useful hack: remove the button if the script asks to be removed.
                    # In particular, this will remove the spelling button if it can't be inited.
                    if g.app.scriptDict.get('removeMe'):
                        g.es("Removing '%s' button at its request" % (buttonText))
                        b.pack_forget()
                
            def mouseEnterCallback(event=None,self=self,statusMessage=statusMessage):
                self.mouseEnter(statusMessage)
                
            def mouseLeaveCallback(event=None,self=self):
                self.mouseLeave()
            #@nonl
            #@-node:EKR.20040613231552:<< define callbacks for addScriptButton >>
            #@nl
            self.d [key] = b
            #if sys.platform == "win32":
            #    width = int(len(buttonText) * 0.9)
            #    b.configure(width=width,font=('verdana',7,'bold'))
            #    b.configure(bg='MistyRose1')
            b.actionPerformed = commandCallback
            b.addMouseListener( self.ButtonRemover( b ) )
            #b.configure(command=commandCallback)
            #b.bind('<3>',deleteButtonCallback)
            #b.bind('<Enter>', mouseEnterCallback)
            #b.bind('<Leave>', mouseLeaveCallback)
        #@nonl
        #@-node:EKR.20040618091543.2:<< define addScriptButtonCommand >>
        #@nl
        
        runStatusLine = 'Run script: %s' % h
        makeStatusLine = 'Make script button for: %s' % h
        
        for key,text,command,statusLine,bg in (
            ("execButton","Run Script",execCommand,runStatusLine,'MistyRose1'),
            ("addScriptButton","Script Button",addScriptButtonCommand,makeStatusLine,"#ffffcc")
        ):
            #@        << define callbacks for standard buttons >>
            #@+node:EKR.20040614000551:<< define callbacks for standard buttons >>
            def deleteButtonCallback(event=None,self=self,key=key):
                self.deleteButton(key)
                
            def mouseEnterCallback(event=None,self=self,statusLine=statusLine):
                self.mouseEnter(statusLine)
            
            def mouseLeaveCallback(event=None,self=self):
                self.mouseLeave()
            #@nonl
            #@-node:EKR.20040614000551:<< define callbacks for standard buttons >>
            #@nl
            b = c.frame.addIconButton(text=text)
            self.d [key] = b
            #if sys.platform == "win32":
            #    width = int(len(text) * 0.9)
            #    b.configure(width=width,font=('verdana',7,'bold'),bg=bg)
            b.actionPerformed = command
            #b.configure(command=command)
            #b.bind('<Enter>', mouseEnterCallback)
            #b.bind('<Leave>', mouseLeaveCallback)
    #@nonl
    #@-node:ekr.20041001183818:createStandardButtons
    #@+node:EKR.20040614002229:deleteButton
    def deleteButton(self,key):
        
        """Delete the button at self.d[key]."""
    
        button = self.d.get(key)
        #if button:
        #    button.pack_forget()
        #    # button.destroy()
        parent = button.getParent()
        if parent:
            parent.remove( button )
    #@nonl
    #@-node:EKR.20040614002229:deleteButton
    #@+node:ekr.20041001203145:executeScriptNode
    def executeScriptNode (self,p):
        
        global atPluginNodes
        
        c = self.c
        tag = "@script"
        h = p.headString()
        assert(g.match(h,0,tag))
        name = h[len(tag):].strip()
    
        if atPluginNodes:
            g.es("executing script %s" % (name),color="blue")
            c.executeScript(p,useSelectedText=False)
        else:
            g.es("disabled @script: %s" % (name),color="blue")
    #@nonl
    #@-node:ekr.20041001203145:executeScriptNode
    #@+node:ekr.20041001202905:loadPlugin
    def loadPlugin (self,p):
        
        global atPluginNodes
        
        c = self.c
        tag = "@plugin"
        h = p.headString()
        assert(g.match(h,0,tag))
        
        # Get the name of the module.
        theFile = h[len(tag):].strip()
        if theFile[-3:] == ".py":
            theFile = theFile[:-3]
        theFile = g.toUnicode(theFile,g.app.tkEncoding)
        
        if not atPluginNodes:
            g.es("disabled @plugin: %s" % (theFile),color="blue")
        elif theFile in g.app.loadedPlugins:
            g.es("plugin already loaded: %s" % (theFile),color="blue")
        else:
            plugins_path = g.os_path_join(g.app.loadDir,"..","plugins")
            theModule = g.importFromPath(theFile,plugins_path,
                pluginName=__name__,verbose=False)
            if theModule:
                g.es("plugin loaded: %s" % (theFile),color="blue")
                g.app.loadedPlugins.append(theFile)
            else:
                g.es("can not load plugin: %s" % (theFile),color="blue")
    #@nonl
    #@-node:ekr.20041001202905:loadPlugin
    #@+node:EKR.20040618091543:mouseEnter/Leave
    def mouseEnter(self,status):
    
        self.c.frame.clearStatusLine()
        self.c.frame.putStatusLine(status)
        
    def mouseLeave(self):
    
        self.c.frame.clearStatusLine()
    #@nonl
    #@-node:EKR.20040618091543:mouseEnter/Leave
    #@-others
#@nonl
#@-node:ekr.20050302082838.1:class scriptingController
#@-others
#@nonl
#@-node:EKR.20040613213623:@thin mod_scripting.py
#@-leo
