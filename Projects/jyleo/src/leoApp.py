# -*- coding: utf-8 -*-
#@+leo-ver=4-thin
#@+node:ekr.20031218072017.2608:@thin leoApp.py
#@@first

#@@language python
#@@tabwidth -4
#@@pagewidth 80 

import leoGlobals as g 
import os
import sys

class LeoApp:

    """A class representing the Leo application itself.
    
    Ivars of this class are Leo's global variables."""
    
    #@    @+others
    #@+node:ekr.20031218072017.1416:app.__init__
    def __init__(self):
    
        # These ivars are the global vars of this program.
        self.afterHandler = None
        self.batchMode = False # True: run in batch mode.
        self.commandName = None # The name of the command being executed.
        self.config = None # The leoConfig instance.
        self.count = 0 # General purpose debugging count.
        self.debug = False # True: enable extra debugging tests (not used at present).
            # WARNING: this could greatly slow things down.
        self.debugSwitch = 0
            # 0: default behavior
            # 1: full traces in g.es_exception.
            # 2: call pdb.set_trace in g.es_exception, etc.
        self.disableSave = False
        self.globalConfigDir = None # The directory that is assumed to contain the global configuration files.
        self.gui = None # The gui class.
        self.hasOpenWithMenu = False # True: open with plugin has been loaded.
        self.hookError = False # True: suppress further calls to hooks.
        self.hookFunction = None # Application wide hook function.
        self.homeDir = None # The user's home directory.
        self.idle_imported = False # True: we have done an import idle
        self.idleTimeDelay = 100 # Delay in msec between calls to "idle time" hook.
        self.idleTimeHook = False # True: the global idleTimeHookHandler will reshedule itself.
        self.initing = True # True: we are initiing the app.
        self.killed = False # True: we are about to destroy the root window.
        self.leoID = None # The id part of gnx's.
        self.loadDir = None # The directory from which Leo was loaded.
        self.loadedPlugins = [] # List of loaded plugins that have signed on.
        self.log = None # The LeoFrame containing the present log.
        self.logIsLocked = False # True: no changes to log are allowed.
        self.logWaiting = [] # List of messages waiting to go to a log.
        self.menuWarningsGiven = False # True: supress warnings in menu code.
        self.nodeIndices = None # Singleton node indices instance.
        self.numberOfWindows = 0 # Number of opened windows.
        self.openWithFiles = [] # List of data used by Open With command.
        self.openWithFileNum = 0 # Used to generate temp file names for Open With command.
        self.openWithTable = None # The table passed to createOpenWithMenuFromTable.
        self.positions = 0 # Count of the number of positions generated.
        self.quitting = False # True if quitting.  Locks out some events.
        self.realMenuNameDict = {} # Contains translations of menu names and menu item names.
        self.root = None # The hidden main window. Set later.
        self.searchDict = {} # For communication between find/change scripts.
        self.scriptDict = {} # For communication between Execute Script command and scripts.
        self.trace = False # True: enable debugging traces.
        self.tracePositions = False
        self.trace_list = [] # "Sherlock" argument list for tracing().
        self.tkEncoding = "utf-8"
        self.unicodeErrorGiven = True # True: suppres unicode tracebacks.
        self.unitTestDict = {} # For communication between unit tests and code.
        self.unitTesting = False # True if unit testing.
        self.use_psyco = False # Can't be a config param because it is used before config module can be inited.
        self.wantedCommander = None # Used by leoTkinterFrame logic to manage calls to g.app.gui.set_focus.
        self.windowList = [] # Global list of all frames.  Does not include hidden root window.
    
        # Global panels.  Destroyed when Leo ends.
        self.pythonFrame = None
        
        #@    << Define global constants >>
        #@+node:ekr.20031218072017.1417:<< define global constants >>
        self.prolog_string = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
        
        # New in leo.py 3.0
        self.prolog_prefix_string = "<?xml version=\"1.0\" encoding="
        self.prolog_postfix_string = "?>"
        
        # leo.py 3.11
        self.use_unicode = True # True: use new unicode logic.
        #@-node:ekr.20031218072017.1417:<< define global constants >>
        #@nl
        #@    << Define global data structures >>
        #@+node:ekr.20031218072017.368:<< define global data structures >> app
        # Internally, lower case is used for all language names.
        self.language_delims_dict = {
            "ada" : "--",
            "actionscript" : "// /* */", #jason 2003-07-03
            "c" : "// /* */", # C, C++ or objective C.
            "csharp" : "// /* */",	# C#
            "css" : "/* */", # 4/1/04
            "cweb" : "@q@ @>", # Use the "cweb hack"
            "elisp" : ";",
            "forth" : "\\_ _(_ _)", # Use the "REM hack"
            "fortran" : "C",
            "fortran90" : "!",
            "html" : "<!-- -->",
            "java" : "// /* */",
            "latex" : "%",
            "pascal" : "// { }",
            "perl" : "#",
            "perlpod" : "# __=pod__ __=cut__", # 9/25/02: The perlpod hack.
            "php" : "//",
            "plain" : "#", # We must pick something.
            "python" : "#",
            "rapidq" : "'", # fil 2004-march-11
            "rebol" : ";",  # jason 2003-07-03
            "shell" : "#",  # shell scripts
            "tcltk" : "#",
            "ruby": "#",
            "unknown" : "#" } # Set when @comment is seen.
        
        self.language_extension_dict = {
            "ada" : "ads",
            "actionscript" : "as", #jason 2003-07-03
            "c" : "c",
            "css" : "css", # 4/1/04
            "cweb" : "w",
            "elisp" : "el",
            "forth" : "forth",
            "fortran" : "f",
            "fortran90" : "f",
            "html" : "html",
            "java" : "java",
            "latex" : "tex", # 1/8/04
            "noweb" : "nw",
            "pascal" : "p",
            "perl" : "perl",
            "perlpod" : "perl",
            "php" : "php",
            "plain" : "txt",
            "python" : "py",
            "rapidq" : "bas", # fil 2004-march-11
            "rebol" : "r",    # jason 2003-07-03
            "shell" : "sh",   # DS 4/1/04
            "tex" : "tex",
            "tcltk" : "tcl",
            "ruby": "ruby",
            "unknown" : "txt" } # Set when @comment is seen.
            
        self.extension_dict = {
            "ads"   : "ada",
            "adb"   : "ada",
            "as"    : "actionscript",
            "bas"   : "rapidq",
            "c"     : "c",
            "css"   : "css",
            "el"    : "elisp",
            "forth" : "forth",
            "f"     : "fortran90", # or fortran ?
            "html"  : "html",
            "java"  : "java",
            "noweb" : "nw",
            "p"     : "pascal",
            "perl"  : "perl",
            "php"   : "php",
            "py"    : "python",
            "ruby": "ruby",
            "r"     : "rebol",
            "sh"    : "shell",
            "tex"   : "tex",
            "txt"   : "plain",
            "tcl"   : "tcltk",
            "w"     : "cweb" }
        #@-node:ekr.20031218072017.368:<< define global data structures >> app
        #@nl
    #@nonl
    #@-node:ekr.20031218072017.1416:app.__init__
    #@+node:ekr.20031218072017.2609:app.closeLeoWindow
    def closeLeoWindow (self,frame):
        
        """Attempt to close a Leo window.
        
        Return False if the user veto's the close."""
        
        c = frame.c
        
        if c.promptingForClose:
            # There is already a dialog open asking what to do.
            return False
    
        if c.changed:
            c.promptingForClose = True
            veto = frame.promptForSave()
            c.promptingForClose = False
            if veto: return False
    
        g.app.setLog(None) # no log until we reactive a window.
        g.doHook("close-frame",c=c) # This may remove frame from the window list.
        if frame in g.app.windowList:
            g.app.destroyWindow(frame)
        
        if g.app.windowList:
            # Pick a window to activate so we can set the log.
            w = g.app.windowList[0]
            w.deiconify()
            w.lift()
            if w.log and hasattr("setLog", g.app):
                g.app.setLog(w.log)
        else:
            g.app.finishQuit()
    
        return True # The window has been closed.
    #@nonl
    #@-node:ekr.20031218072017.2609:app.closeLeoWindow
    #@+node:ekr.20031218072017.2610:app.createSwingGui
    def createSwingGui (self,fileName=None): # Do NOT omit fileName param: it is used in plugin code.
        
        """A convenience routines for plugins to create the default Tk gui class."""
        
        #import leoTkinterGui # Do this import after app module is fully imported.
        
        import java
        import leoSwingGui
        
        #lock = java.util.concurrent.Semaphore(1)
        class SwingStartUp( java.lang.Runnable ):
            
            #def __init__( self ):
            #    lock.acquire()
            
            def run( self ):
                g.app.gui = leoSwingGui.leoSwingGui()
                #g.app.gui = leoTkinterGui.tkinterGui()
                g.app.root = g.app.gui.createRootWindow()
                g.app.gui.finishCreate()
                #lock.release()
                
                
        su = SwingStartUp()
        java.awt.EventQueue.invokeAndWait( su )
        #lock.acquire()
        #lock.release()
                
        
        
        if 0:
            if fileName:
                print "Tk gui created in", g.shortFileName(fileName)
    #@nonl
    #@-node:ekr.20031218072017.2610:app.createSwingGui
    #@+node:ekr.20031218072017.2612:app.destroyAllOpenWithFiles
    def destroyAllOpenWithFiles (self):
    
        """Try to remove temp files created with the Open With command.
        
        This may fail if the files are still open."""
        
        # We can't use g.es here because the log stream no longer exists.
    
        for theDict in self.openWithFiles[:]: # 7/10/03.
            g.app.destroyOpenWithFileWithDict(theDict)
            
        # Delete the list so the gc can recycle Leo windows!
        g.app.openWithFiles = []
    #@nonl
    #@-node:ekr.20031218072017.2612:app.destroyAllOpenWithFiles
    #@+node:ekr.20031218072017.2613:app.destroyOpenWithFilesForFrame
    def destroyOpenWithFilesForFrame (self,frame):
        
        """Close all "Open With" files associated with frame"""
        
        # Make a copy of the list: it may change in the loop.
        openWithFiles = g.app.openWithFiles
    
        for theDict in openWithFiles[:]: # 6/30/03
            c = theDict.get("c")
            if c.frame == frame:
                g.app.destroyOpenWithFileWithDict(theDict)
    #@-node:ekr.20031218072017.2613:app.destroyOpenWithFilesForFrame
    #@+node:ekr.20031218072017.2614:app.destroyOpenWithFileWithDict
    def destroyOpenWithFileWithDict (self,theDict):
        
        path = theDict.get("path")
        if path and g.os_path_exists(path):
            try:
                os.remove(path)
                print "deleting temp file:", g.shortFileName(path)
            except:
                print "can not delete temp file:", path
                
        # Remove theDict from the list so the gc can recycle the Leo window!
        g.app.openWithFiles.remove(theDict)
    #@nonl
    #@-node:ekr.20031218072017.2614:app.destroyOpenWithFileWithDict
    #@+node:ekr.20031218072017.2615:app.destroyWindow
    def destroyWindow (self,frame):
            
        g.app.destroyOpenWithFilesForFrame(frame)
        if frame in g.app.windowList:
            g.app.windowList.remove(frame)
    
        # force the window to go away now.
        frame.destroySelf()
    #@nonl
    #@-node:ekr.20031218072017.2615:app.destroyWindow
    #@+node:ekr.20031218072017.1732:app.finishQuit
    def finishQuit(self):
        
        # forceShutdown may already have fired the "end1" hook.
        if not g.app.killed:
            g.doHook("end1")
    
        self.destroyAllOpenWithFiles()
        
        if g.app.gui:
            g.app.gui.destroySelf()
            
        g.app.killed = True
            # Disable all further hooks and events.
            # Alas, "idle" events can still be called even after the following code.
    
        if 0: # Do not use g.trace here!
            print "finishQuit",g.app.killed
            
        if g.app.afterHandler:
            # TK bug: This appears to have no effect, at least on Windows.
            # print "finishQuit: cancelling",g.app.afterHandler
            if g.app.gui and g.app.gui.guiName() == "tkinter":
                self.root.after_cancel(g.app.afterHandler)
            g.app.afterHandler = None
    #@nonl
    #@-node:ekr.20031218072017.1732:app.finishQuit
    #@+node:ekr.20031218072017.2616:app.forceShutdown
    def forceShutdown (self):
        
        """Forces an immediate shutdown of Leo at any time.
        
        In particular, may be called from plugins during startup."""
        
        # Wait until everything is quiet before really quitting.
        g.doHook("end1")
        
        self.log = None # Disable writeWaitingLog
        self.killed = True # Disable all further hooks.
        
        for w in self.windowList[:]:
            self.destroyWindow(w)
    
        self.finishQuit()
    #@nonl
    #@-node:ekr.20031218072017.2616:app.forceShutdown
    #@+node:ekr.20031218072017.2617:app.onQuit
    def onQuit (self):
        
        g.app.quitting = True
        
        while g.app.windowList:
            w = g.app.windowList[0]
            if not g.app.closeLeoWindow(w):
                break
    
        g.app.quitting = False # If we get here the quit has been disabled.
    
    
    #@-node:ekr.20031218072017.2617:app.onQuit
    #@+node:ekr.20031218072017.2618:app.setEncoding
    #@+at 
    #@nonl
    # According to Martin v. L�wis, getdefaultlocale() is broken, and cannot 
    # be fixed. The workaround is to copy the g.getpreferredencoding() 
    # function from locale.py in Python 2.3a2.  This function is now in 
    # leoGlobals.py.
    #@-at
    #@@c
    
    def setEncoding (self):
        
        """Set g.app.tkEncoding."""
    
        for (encoding,src) in (
            (self.config.tkEncoding,"config"),
            #(locale.getdefaultlocale()[1],"locale"),
            (g.getpreferredencoding(),"locale"),
            (sys.getdefaultencoding(),"sys"),
            ("utf-8","default")):
        
            if g.isValidEncoding (encoding): # 3/22/03
                self.tkEncoding = encoding
                # g.trace(self.tkEncoding,src)
                break
            elif encoding and len(encoding) > 0:
                g.trace("ignoring invalid ",src," encoding: ",encoding)
                
        color = g.choose(self.tkEncoding=="ascii","red","blue")
    #@nonl
    #@-node:ekr.20031218072017.2618:app.setEncoding
    #@+node:ekr.20031218072017.1978:app.setLeoID
    def setLeoID (self,verbose=True):
    
        tag = ".leoID.txt"
        homeDir = g.app.homeDir
        globalConfigDir = g.app.globalConfigDir
        loadDir = g.app.loadDir
        #@    << return if we can set self.leoID from sys.leoID >>
        #@+node:ekr.20031218072017.1979:<< return if we can set self.leoID from sys.leoID>>
        # This would be set by in Python's sitecustomize.py file.
        
        # 7/2/04: Use hasattr & getattr to suppress pychecker warning.
        # We also have to use a "non-constant" attribute to suppress another warning!
        
        nonConstantAttr = "leoID"
        
        if hasattr(sys,nonConstantAttr):
            g.app.leoID = getattr(sys,nonConstantAttr)
            if verbose:
                g.es("leoID = " + g.app.leoID, color="orange")
            return
        else:
            g.app.leoID = None
        #@nonl
        #@-node:ekr.20031218072017.1979:<< return if we can set self.leoID from sys.leoID>>
        #@nl
        #@    << return if we can set self.leoID from "leoID.txt" >>
        #@+node:ekr.20031218072017.1980:<< return if we can set self.leoID from "leoID.txt" >>
        for theDir in (homeDir,globalConfigDir,loadDir):
            try:
                fn = g.os_path_join(theDir, tag)
                f = open(fn,'r')
                if f:
                    s = f.readline()
                    f.close()
                    if s and len(s) > 0:
                        g.app.leoID = s
                        if verbose:
                            g.es("leoID = " + g.app.leoID, color="red")
                        return
                    else:
                        if verbose:
                            g.es("empty " + tag + " in " + theDir, color = "red")
            except:
                g.app.leoID = None
                
        dirs = []
        
        for theDir in (globalConfigDir,homeDir):
            if theDir not in dirs:
                dirs.append(theDir)
        
        g.es("%s not found in %s" % (tag,repr(dirs)),color="red")
        #@nonl
        #@-node:ekr.20031218072017.1980:<< return if we can set self.leoID from "leoID.txt" >>
        #@nl
    
        #@    << put up a dialog requiring a valid id >>
        #@+node:ekr.20031218072017.1981:<< put up a dialog requiring a valid id >>
        # New in 4.1: get an id for gnx's.  Plugins may set g.app.leoID.
        
        # Create an emergency gui and a Tk root window.
        #g.app.createTkGui("startup")
        g.app.createSwingGui("startup" )
        g.app.gui.runAskLeoIDDialog()
        g.app.gui = None
        
        g.trace(g.app.leoID)
        g.es("leoID=",repr(g.app.leoID),color="blue")
        #@nonl
        #@-node:ekr.20031218072017.1981:<< put up a dialog requiring a valid id >>
        #@nl
        #@    << attempt to create leoID.txt >>
        #@+node:ekr.20031218072017.1982:<< attempt to create leoID.txt >>
        for theDir in (homeDir,globalConfigDir,loadDir):
            try:
                # Look in globalConfigDir first.
                fn = g.os_path_join(theDir, tag)
                f = open(fn,'w')
                if f:
                    f.write(g.app.leoID)
                    f.close()
                    g.es("created leoID.txt in " + theDir, color="red")
                    return
            except IOError, io: print io
        
        dirs = []
        
        for theDir in (globalConfigDir,homeDir,loadDir):
            if theDir not in dirs:
                dirs.append(theDir)
        
        g.es("can not create leoID.txt in %s" % (repr(dirs)), color="red")
        #@nonl
        #@-node:ekr.20031218072017.1982:<< attempt to create leoID.txt >>
        #@nl
        
        # Destroy the emergency gui.
        
    #@-node:ekr.20031218072017.1978:app.setLeoID
    #@+node:ekr.20031218072017.1847:app.setLog, lockLog, unlocklog
    def setLog (self,log,tag=""):
        """set the frame to which log messages will go"""
        
        # print "setLog:",tag,"locked:",self.logIsLocked,log
        if not self.logIsLocked:
            self.log = log
            
    def lockLog(self):
        """Disable changes to the log"""
        self.logIsLocked = True
        
    def unlockLog(self):
        """Enable changes to the log"""
        self.logIsLocked = False
    #@nonl
    #@-node:ekr.20031218072017.1847:app.setLog, lockLog, unlocklog
    #@+node:ekr.20031218072017.2619:app.writeWaitingLog
    def writeWaitingLog (self):
    
        if self.log:
            for s,color in self.logWaiting:
                g.es(s,color=color,newline=0) # The caller must write the newlines.
            self.logWaiting = []
    #@-node:ekr.20031218072017.2619:app.writeWaitingLog
    #@+node:zorcanda!.20050501152421:addJarsToPath
    def addJarsToPath( self ): #change: added for JyLeo
        
        import sys
        import java
        import java.lang as jl
        jpath = g.os_path_join(g.app.loadDir,"..","jars") 
        ppath = g.os_path_join(g.app.loadDir,"..","plugins")
        import os
        psep = os.pathsep
        cp = [ jl.System.getProperty( "java.class.path" ), ]
        #for z in jl.System.getProperty( "java.class.path" ).split( os.pathsep ):
        #    print z
        def visit( args, directory, files, cp = cp ):
            
            for z in files:
                #if z.endswith( ".jar" ):
                sys.path.append( g.os_path_join( directory, z ) )
                #print g.os_path_join( directory, z )
                #cp[ 0 ] = "%s%s%s" %( cp[ 0 ], psep, g.os_path_join( directory, z ) )
                f = java.io.File( g.os_path_join( directory, z ) )
                can_p = f.getCanonicalPath()
                cp[ 0 ] = "%s%s%s" % ( cp[ 0 ], psep, can_p )
                #print f.getCanonicalPath()
        
        import os    
        
        os.path.walk( jpath, visit, None )
        sys.path.append( g.app.loadDir )
        sys.path.append( ppath )
        jl.System.setProperty( "java.class.path", cp[ 0 ] )
        paths = cp[ 0 ].split( ':' )
        #for z in paths:
        #    print z
    #@nonl
    #@-node:zorcanda!.20050501152421:addJarsToPath
    #@-others
#@-node:ekr.20031218072017.2608:@thin leoApp.py
#@-leo
