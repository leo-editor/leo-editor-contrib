#@+leo-ver=4-thin
#@+node:ekr.20031218072017.2810:@thin leoCommands.py
#@@language python
#@@tabwidth -4
#@@pagewidth 80  

from __future__ import generators # To make the code work in Python 2.2.

#@<< imports >>
#@+node:ekr.20040712045933:<< imports  >>
import leoGlobals as g

if g.app and g.app.use_psyco:
    # print "enabled psyco classes",__file__
    try: from psyco.classes import *
    except ImportError: pass

import leoAtFile
import leoConfig
import leoFileCommands
import leoImport
import leoNodes
import leoTangle
#import leoUndo
#import leoSwingUndo
import CommanderSpecification
import weakref
#import compiler # for Check Python command
import os
#import parser # needed only for weird Python 2.2 parser errors.
import string
import sys
import tempfile
#import tabnanny # for Check Python command
import token    # for Check Python command
import tokenize # for Check Python command
#@nonl
#@-node:ekr.20040712045933:<< imports  >>
#@nl

#@+others
#@+node:ekr.20041118104831:class commands
class baseCommands( CommanderSpecification ):
    """The base class for Leo's main commander."""
    #@    @+others
    #@+node:ekr.20031218072017.2811: c.Birth & death
    #@+node:ekr.20031218072017.2812:c.__init__
    def __init__(self,frame,fileName):
    
        c = self
        
        # Init ivars with self.x instead of c.x to keep Pychecker happy
        self.frame = frame
        self.mFileName = fileName
            # Do _not_ use os_path_norm: it converts an empty path to '.' (!!)
        import Chapters
        self.chapters = Chapters.Chapters( c )
        # g.trace(c) # Do this after setting c.mFileName.
        c.initIvars()
    
        # initialize the sub-commanders
        self.fileCommands = leoFileCommands.fileCommands(c)
        self.atFileCommands = leoAtFile.atFile(c)
        self.importCommands = leoImport.leoImportCommands(c)
        self.tangleCommands = leoTangle.tangleCommands(c)
        #import Chapters
        #self.chapters = Chapters.Chapters( c )
        
    
        #if 0 and g.debugGC:
        #    print ; print "*** using Null undoer ***" ; print
        #    self.undoer = leoUndo.nullUndoer(self)
        #else:
        #    #self.undoer = leoUndo.undoer(self)
        #    self.undoer = leoSwingUndo.leoSwingUndo( self )
            
        import LeoScriptExecutor
        self.script_handler = LeoScriptExecutor.LeoScriptExecutor( self )
            
    #@nonl
    #@-node:ekr.20031218072017.2812:c.__init__
    #@+node:ekr.20040731071037:c.initIvars
    def initIvars(self):
    
        c = self
        #@    << initialize ivars >>
        #@+node:ekr.20031218072017.2813:<< initialize ivars >>
        self._currentPosition = self.nullPosition()
        self._rootPosition    = self.nullPosition()
        self._topPosition     = self.nullPosition()
        
        # per-document info...
        self.disableCommandsMessage = ''
            # The presence of this message disables all commands.
        self.hookFunction = None
        self.openDirectory = None
        
        self.expansionLevel = 0  # The expansion level of this outline.
        self.expansionNode = None # The last node we expanded or contracted.
        self.changed = False # True if any data has been changed since the last save.
        self.loading = False # True if we are loading a file: disables c.setChanged()
        self.outlineToNowebDefaultFileName = "noweb.nw" # For Outline To Noweb dialog.
        self.promptingForClose = False # To lock out additional closing dialogs.
        
        # For tangle/untangle
        self.tangle_errors = 0
        
        # Global options
        self.page_width = 132
        self.tab_width = -4
        self.tangle_batch_flag = False
        self.untangle_batch_flag = False
        # Default Tangle options
        self.tangle_directory = ""
        self.use_header_flag = False
        self.output_doc_flag = False
        # Default Target Language
        self.target_language = "python" # 8/11/02: Required if leoConfig.txt does not exist.
        
        # These are defined here, and updated by the tree.select()
        self.beadList = [] # list of vnodes for the Back and Forward commands.
        self.beadPointer = -1 # present item in the list.
        self.visitedList = [] # list of vnodes for the Nodes dialog.
        
        # For hoist/dehoist commands.
        #self.hoistStack = []
            # Stack of nodes to be root of drawn tree.
            # Affects drawing routines and find commands.
        self.recentFiles = [] # List of recent files
        
        self.showInvisibles = False #added for JLeo
        self.invisibleWatchers = []
        #@nonl
        #@-node:ekr.20031218072017.2813:<< initialize ivars >>
        #@nl
        self.config = configSettings(c)
        g.app.config.setIvarsFromSettings(c)
    #@nonl
    #@-node:ekr.20040731071037:c.initIvars
    #@+node:ekr.20031218072017.2814:c.__repr__ & __str__
    def __repr__ (self):
        
        return "Commander %d: %s" % (id(self),repr(self.mFileName))
            
    __str__ = __repr__
    
    #@-node:ekr.20031218072017.2814:c.__repr__ & __str__
    #@+node:ekr.20041130173135:c.hash
    def hash (self):
    
        c = self
        if c.mFileName:
            return g.os_path_abspath(c.mFileName).lower()
        else:
            return 0
    #@nonl
    #@-node:ekr.20041130173135:c.hash
    #@-node:ekr.20031218072017.2811: c.Birth & death
    #@+node:ekr.20031218072017.2817: doCommand
    def doCommand (self,command,label,event=None):
    
        """Execute the given command, invoking hooks and catching exceptions.
        
        The code assumes that the "command1" hook has completely handled the command if
        g.doHook("command1") returns False.
        This provides a simple mechanism for overriding commands."""
        
        c = self ; p = c.currentPosition()
    
        # A horrible kludge: set g.app.log to cover for a possibly missing activate event.
        g.app.setLog(c.frame.log,"doCommand")
        
        # The presence of this message disables all commands.
        if c.disableCommandsMessage:
            g.es(c.disableCommandsMessage,color='blue')
            return 'break' # Inhibit all other handlers.
    
    
        if label == "cantredo": label = "redo"
        if label == "cantundo": label = "undo"
        g.app.commandName = label
     
        if not g.doHook("command1",c=c,p=p,v=p,label=label):
            try:
                
                command()
            except:
                g.es("exception executing command")
             
                g.es_exception(c=c)
                c.frame.tree.redrawAfterException() # 1/26/04
        
        c = g.top() # 6/17/04: The command can change the commander.
        if c:
            p = c.currentPosition()
            g.doHook("command2",c=c,p=p,v=p,label=label)
                
        return "break" # Inhibit all other handlers.
    #@nonl
    #@-node:ekr.20031218072017.2817: doCommand
    #@+node:orkman.20050220131748:added for CommanderSpecification
       
       
    #public Integer acquirePage_width();
    
    
    
    def acquirePage_width( self ):
        return self.page_width
        
    def acquireTab_width( self ):
        return self.tab_width
        
    def acquireTarget_language( self ):
        return self.target_language
        
    def acquireDefault_derived_file_encoding( self ):
        return self.config.default_derived_file_encoding
        
    def acquireOutputNewline( self ):
        return g.getOutputNewline( c = self )
        
    
    #public String acquireOs_path_dirname( String name );
    def acquireOs_path_dirname( self, name ):
        return g.os_path_dirname( name )
    
    #public Integer acquireTab_width();
    #public String acquireTarget_language();
    #public String acquireDefault_derived_file_encoding();
    
    def g_os_path_isabs( self, dir ):
        return g.os_path_isabs( dir )
        
    def g_os_path_exists( self, dir ):
        return g.os_path_exists( dir )
        
    def g_makeAllNonExistentDirectorys( self, dir ):
        return g.makeAllNonExistentDirectories( dir )
        
    def g_get_directives_dict( self, s ):
        import java.util
        d = g.get_directives_dict( s )
        m = java.util.HashMap()
        for z in d:
            m.put( z, d[ z ] )
        return m
    
    
    def g_isValidEncoding( self, s ):
        return g.isValidEncoding( s )
    #public Boolean g_os_path_isabs( String dir );
    #public Boolean g_os_path_exists( String dir );
    #public String g_makeAllNonExistendDirectories( String dir );
    
    
    #@+at
    #     public String g_getBaseDirectory();
    #     public String g_os_path_join( String base, String path );
    #     public String g_scanAtEncodingDirective( String s, Map theDict );
    #     public String g_scanAtLineendingDirective( String s, Map theDict);
    #     public Integer g_scanAtPagewidthDirective( String s,Map theDict, 
    # boolean issue_error_flag);
    #     public Integer g_scanAtTabwidthDirective( String s,Map theDict, 
    # boolean issue_error_flag);
    #     public String[] g_set_language( String language );
    #     public void g_trace();
    #@-at
    #@@c
    def g_getBaseDirectory( self ):
        return g.getBaseDirectory( c = self )
        
        
    def g_os_path_join( self, base, path ):
        #print 'base is %s path is %s' % ( base, path )
        return g.os_path_join( base, path )
        
    def g_scanAtEncodingDirective( self, s, theDict ):
        return g.scanAtEncodingDirective( s, theDict )
        
    def g_scanAtLineendingDirective( self, s, theDict ):
        return g.scanAtLineendingDirective( s, theDict )
    
    def g_scanAtPagewidthDirective( self, s, theDict, issue_error_flag ):
        return g.scanAtPagewidthDirective( s, theDict, issue_error_flag=issue_error_flag )
        
    #@+at
    #     public Integer g_scanAtTabwidthDirective( String s,Map theDict, 
    # boolean issue_error_flag);
    #     public String[] g_set_language( String language );
    #     public void g_trace();
    #@-at
    #@@c
    def g_scanAtTabwidthDirective( self, s, theDict, issue_error_flag ):
        return g.scanAtTabwidthDirective( s, theDict, issue_error_flag=issue_error_flag )
        
    def g_set_language( self, language, k ):
        return g.set_language( language, k ) 
        
        
    def g_trace( self ):
        return g.trace()
        
        
    def g_fileLikeObject( self ):
        return g.fileLikeObject()
        
    #@+at
    # (c.tangle_directory,c.frame.openDirectory,c.openDirectory):
    #         public Boolean hasFrame();
    #     public String acquireTangle_directory();
    #     public String acquireFrOpenDirectory();
    #     public String acquireOpenDirectory();
    #@-at
    #@@c
    
    
    def hasFrame( self ):
        if self.frame: return True
        else: return False
        
    def acquireTangle_directory( self ):
        return self.tangle_directory
        
    def acquireFrOpenDirectory( self ):
        return self.frame.openDirectory
        
    def acquireOpenDirectory( self ):
        return self.openDirectory
    
        
    
    
    
    #@-node:orkman.20050220131748:added for CommanderSpecification
    #@+node:zorcanda!.20050928093629:def __getattr__
    def __getattr__( self, name ):
        
        if name == 'hoistStack':
            chapters = self.__dict__[ 'chapters' ]
            cc = chapters.current_chapter
            return cc.hoistStack
        elif name == "undoer":
            #print "GETTING UNDOER!"
            chapters = self.__dict__[ 'chapters' ]
            cc = chapters.current_chapter
            return cc.undoer
        else:
            if self.__dict__.has_key[ name ]:
                return self.__dict__[ name ]
            else:
                raise AttributeException     
    
    def __setattr__( self, name, value ):
        
        if name == "hoistStack":
            chapters = self.__dict__[ 'chapters' ]
            cc = chapters.current_chapter
            cc.hoistStack = value
        else:
            self.__dict__[ name ] = value
    
    #@-node:zorcanda!.20050928093629:def __getattr__
    #@+node:zorcanda!.20051214221019:added for jyleo
    #@+others
    #@+node:zorcanda!.20051214221019.1:addInvisibleWatcher
    def addInvisibleWatcher( self, watcher ):
        weakwatcher = weakref.proxy( watcher )
        self.invisibleWatchers.append( weakwatcher )
    #@nonl
    #@-node:zorcanda!.20051214221019.1:addInvisibleWatcher
    #@-others
    #@nonl
    #@-node:zorcanda!.20051214221019:added for jyleo
    #@+node:ekr.20031218072017.2582: version & signon stuff
    #@+node:ekr.20040629121554:getBuildNumber
    def getBuildNumber(self):
        c = self
        return c.ver[10:-1] # Strip off "(dollar)Revision" and the trailing "$"
    #@nonl
    #@-node:ekr.20040629121554:getBuildNumber
    #@+node:ekr.20040629121554.1:getSignOnLine (Contains hard-coded version info)
    def getSignOnLine (self):
        c = self
        return "Leo 4.3 alpha 1, build %s, January 24, 2005" % c.getBuildNumber()
    #@-node:ekr.20040629121554.1:getSignOnLine (Contains hard-coded version info)
    #@+node:ekr.20040629121554.2:initVersion
    def initVersion (self):
        c = self
        c.ver = "$Revision: 1.208 $" # CVS updates this.
    #@nonl
    #@-node:ekr.20040629121554.2:initVersion
    #@+node:ekr.20040629121554.3:signOnWithVersion
    def signOnWithVersion (self):
    
        c = self
        color = c.config.getColor("log_error_color")
        signon = c.getSignOnLine()
        n1,n2,n3,junk,junk=sys.version_info
        #tkLevel = c.frame.top.getvar("tk_patchLevel")
        
        g.es("Leo Log Window...",color=color)
        g.es(signon)
        #g.es("Python %d.%d.%d, Tk %s, %s" % (n1,n2,n3,tkLevel,sys.platform))
        g.enl()
    #@nonl
    #@-node:ekr.20040629121554.3:signOnWithVersion
    #@-node:ekr.20031218072017.2582: version & signon stuff
    #@+node:ekr.20040312090934:c.iterators
    #@+node:EKR.20040529091232:c.all_positions_iter == allNodes_iter
    def allNodes_iter(self,copy=False):
        
        c = self
        return c.rootPosition().allNodes_iter(copy)
        
    all_positions_iter = allNodes_iter
    #@nonl
    #@-node:EKR.20040529091232:c.all_positions_iter == allNodes_iter
    #@+node:EKR.20040529091232.1:c.all_tnodes_iter
    def all_tnodes_iter(self):
        
        c = self
        for p in c.all_positions_iter():
            yield p.v.t
    
        # return c.rootPosition().all_tnodes_iter(all=True)
    #@nonl
    #@-node:EKR.20040529091232.1:c.all_tnodes_iter
    #@+node:EKR.20040529091232.2:c.all_unique_tnodes_iter
    def all_unique_tnodes_iter(self):
        
        c = self ; marks = {}
        
        for p in c.all_positions_iter():
            if not p.v.t in marks:
                marks[p.v.t] = p.v.t
                yield p.v.t
    #@nonl
    #@-node:EKR.20040529091232.2:c.all_unique_tnodes_iter
    #@+node:EKR.20040529091232.3:c.all_vnodes_iter
    def all_vnodes_iter(self):
        
        c = self
        for p in c.all_positions_iter():
            yield p.v
    #@nonl
    #@-node:EKR.20040529091232.3:c.all_vnodes_iter
    #@+node:EKR.20040529091232.4:c.all_unique_vnodes_iter
    def all_unique_vnodes_iter(self):
        
        c = self ; marks = {}
        for p in c.all_positions_iter():
            if not p.v in marks:
                marks[p.v] = p.v
                yield p.v
    #@nonl
    #@-node:EKR.20040529091232.4:c.all_unique_vnodes_iter
    #@-node:ekr.20040312090934:c.iterators
    #@+node:ekr.20031218072017.2818:Command handlers...
    #@+node:ekr.20031218072017.2819:File Menu
    #@+node:ekr.20031218072017.2820:top level
    #@+node:ekr.20031218072017.1623:new
    def new (self):
    
        c,frame = g.app.gui.newLeoCommanderAndFrame(fileName=None)
        
        # 5/16/03: Needed for hooks.
        g.doHook("new",old_c=self,new_c=c)
        
        # Use the config params to set the size and location of the window.
        frame.setInitialWindowGeometry()
        frame.deiconify()
        frame.lift()
        frame.resizePanesToRatio(frame.ratio,frame.secondary_ratio) # Resize the _new_ frame.
        
        c.beginUpdate()
        if 1: # within update
            t = leoNodes.tnode()
            v = leoNodes.vnode(c,t)
            p = leoNodes.position(v,[])
            v.initHeadString("NewHeadline")
            v.moveToRoot()
            c.editPosition(p)
        c.endUpdate()
    
        frame.body.setFocus()
        return c # For unit test.
    #@nonl
    #@-node:ekr.20031218072017.1623:new
    #@+node:ekr.20031218072017.2821:open
    def open(self):
    
        c = self
        #@    << Set closeFlag if the only open window is empty >>
        #@+node:ekr.20031218072017.2822:<< Set closeFlag if the only open window is empty >>
        #@+at 
        #@nonl
        # If this is the only open window was opened when the app started, and 
        # the window has never been written to or saved, then we will 
        # automatically close that window if this open command completes 
        # successfully.
        #@-at
        #@@c
            
        closeFlag = (
            c.frame.startupWindow==True and # The window was open on startup
            c.changed==False and c.frame.saved==False and # The window has never been changed
            g.app.numberOfWindows == 1) # Only one untitled window has ever been opened
        #@-node:ekr.20031218072017.2822:<< Set closeFlag if the only open window is empty >>
        #@nl
    
        fileName = g.app.gui.runOpenFileDialog(
            title="Open",
            filetypes=[("Leo files", "*.leo"), ("All files", "*")],
            defaultextension=".leo")
    
        if fileName and len(fileName) > 0:
            ok, frame = g.openWithFileName(fileName,c)
            if ok and closeFlag:
                g.app.destroyWindow(c.frame)
    #@nonl
    #@-node:ekr.20031218072017.2821:open
    #@+node:ekr.20031218072017.2823:openWith and allies
    def openWith(self,data=None):
    
        """This routine handles the items in the Open With... menu.
    
        These items can only be created by createOpenWithMenuFromTable().
        Typically this would be done from the "open2" hook.
        
        New in 4.3: The "os.spawnv" now works. You may specify arguments to spawnv
        using a list, e.g.:
            
        openWith("os.spawnv", ["c:/prog.exe","--parm1","frog","--switch2"], None)
        """
        
        c = self ; v = c.currentVnode()
        if not data or len(data) != 3: return # 6/22/03
        try:
            openType,arg,ext=data
            if not g.doHook("openwith1",c=c,p=v,v=v,openType=openType,arg=arg,ext=ext):
                #@            << set ext based on the present language >>
                #@+node:ekr.20031218072017.2824:<< set ext based on the present language >>
                if not ext:
                    theDict = g.scanDirectives(c)
                    language = theDict.get("language")
                    ext = g.app.language_extension_dict.get(language)
                    # print language,ext
                    if ext == None:
                        ext = "txt"
                    
                if ext[0] != ".":
                    ext = "."+ext
                    
                # print "ext",ext
                #@nonl
                #@-node:ekr.20031218072017.2824:<< set ext based on the present language >>
                #@nl
                #@            << create or reopen temp file, testing for conflicting changes >>
                #@+node:ekr.20031218072017.2825:<< create or reopen temp file, testing for conflicting changes >>
                theDict = None ; path = None
                #@<< set dict and path if a temp file already refers to v.t >>
                #@+node:ekr.20031218072017.2826:<<set dict and path if a temp file already refers to v.t >>
                searchPath = c.openWithTempFilePath(v,ext)
                
                if g.os_path_exists(searchPath):
                    for theDict in g.app.openWithFiles:
                        if v == theDict.get("v") and searchPath == theDict.get("path"):
                            path = searchPath
                            break
                #@-node:ekr.20031218072017.2826:<<set dict and path if a temp file already refers to v.t >>
                #@nl
                if path:
                    #@    << create or recreate temp file as needed >>
                    #@+node:ekr.20031218072017.2827:<< create or recreate temp file as needed >>
                    #@+at 
                    #@nonl
                    # We test for changes in both v and the temp file:
                    # 
                    # - If only v's body text has changed, we recreate the 
                    # temp file.
                    # - If only the temp file has changed, do nothing here.
                    # - If both have changed we must prompt the user to see 
                    # which code to use.
                    #@-at
                    #@@c
                    
                    encoding = theDict.get("encoding")
                    old_body = theDict.get("body")
                    new_body = v.bodyString()
                    new_body = g.toEncodedString(new_body,encoding,reportErrors=True)
                    
                    old_time = theDict.get("time")
                    try:
                        new_time = g.os_path_getmtime(path)
                    except:
                        new_time = None
                        
                    body_changed = old_body != new_body
                    temp_changed = old_time != new_time
                    
                    if body_changed and temp_changed:
                        #@    << Raise dialog about conflict and set result >>
                        #@+node:ekr.20031218072017.2828:<< Raise dialog about conflict and set result >>
                        message = (
                            "Conflicting changes in outline and temp file\n\n" +
                            "Do you want to use the code in the outline or the temp file?\n\n")
                        
                        result = g.app.gui.runAskYesNoCancelDialog(
                            "Conflict!", message,
                            yesMessage = "Outline",
                            noMessage = "File",
                            defaultButton = "Cancel")
                        #@nonl
                        #@-node:ekr.20031218072017.2828:<< Raise dialog about conflict and set result >>
                        #@nl
                        if result == "cancel": return
                        rewrite = result == "outline"
                    else:
                        rewrite = body_changed
                            
                    if rewrite:
                        path = c.createOpenWithTempFile(v,ext)
                    else:
                        g.es("reopening: " + g.shortFileName(path),color="blue")
                    #@nonl
                    #@-node:ekr.20031218072017.2827:<< create or recreate temp file as needed >>
                    #@nl
                else:
                    path = c.createOpenWithTempFile(v,ext)
                
                if not path:
                    return # An error has occured.
                #@nonl
                #@-node:ekr.20031218072017.2825:<< create or reopen temp file, testing for conflicting changes >>
                #@nl
                #@            << execute a command to open path in external editor >>
                #@+node:ekr.20031218072017.2829:<< execute a command to open path in external editor >>
                try:
                    if arg == None: arg = ""
                    shortPath = path # g.shortFileName(path)
                    if openType == "os.system":
                        command = "os.system(%s)" % (arg+shortPath)
                        os.system(arg+path)
                    elif openType == "os.startfile":
                        command = "os.startfile(%s)" % (arg+shortPath)
                        os.startfile(arg+path)
                    elif openType == "exec":
                        command = "exec(%s)" % (arg+shortPath)
                        exec arg+path in {} # 12/11/02
                    elif openType == "os.spawnl":
                        filename = g.os_path_basename(arg)
                        command = "os.spawnl(%s,%s,%s)" % (arg,filename,shortPath)
                        apply(os.spawnl,(os.P_NOWAIT,arg,filename,path))
                    elif openType == "os.spawnv":
                        if 1: # New code allows args to spawnv.
                            filename = os.path.basename(arg[0]) 
                            vtuple = arg[1:] 
                            vtuple.append(path)
                            command = "os.spawnv(%s,%s)" % (arg[0],repr(vtuple))
                            apply(os.spawnv,(os.P_NOWAIT,arg[0],vtuple)) # Bug fix: 1/21/05
                        else:
                            filename = g.os_path_basename(arg)
                            command = "os.spawnv("+arg+",("+filename+','+ shortPath+"))"
                            apply(os.spawnv,(os.P_NOWAIT,arg,(filename,path)))
                    else:
                        command="bad command:"+str(openType)
                    # This seems a bit redundant.
                    # g.es(command)
                except:
                    g.es("exception executing: "+command)
                    g.es_exception()
                #@nonl
                #@-node:ekr.20031218072017.2829:<< execute a command to open path in external editor >>
                #@nl
            g.doHook("openwith2",c=c,p=v,v=v,openType=openType,arg=arg,ext=ext)
        except:
            g.es("exception in openWith")
            g.es_exception()
    
        return "break"
    #@+node:ekr.20031218072017.2830:createOpenWithTempFile
    def createOpenWithTempFile (self, v, ext):
        
        c = self
        path = c.openWithTempFilePath(v,ext)
        try:
            if g.os_path_exists(path):
                g.es("recreating:  " + g.shortFileName(path),color="red")
            else:
                g.es("creating:  " + g.shortFileName(path),color="blue")
            theFile = open(path,"w")
            # 3/7/03: convert s to whatever encoding is in effect.
            s = v.bodyString()
            theDict = g.scanDirectives(c,p=v)
            encoding = theDict.get("encoding",None)
            if encoding == None:
                encoding = c.config.default_derived_file_encoding
            s = g.toEncodedString(s,encoding,reportErrors=True) 
            theFile.write(s)
            theFile.flush()
            theFile.close()
            try:    time = g.os_path_getmtime(path)
            except: time = None
            # g.es("time: " + str(time))
            # 4/22/03: add body and encoding entries to dict for later comparisons.
            theDict = {"body":s, "c":c, "encoding":encoding, "f":theFile, "path":path, "time":time, "v":v}
            #@        << remove previous entry from app.openWithFiles if it exists >>
            #@+node:ekr.20031218072017.2831:<< remove previous entry from app.openWithFiles if it exists >>
            for d in g.app.openWithFiles[:]: # 6/30/03
                v2 = d.get("v")
                if v.t == v2.t:
                    print "removing previous entry in g.app.openWithFiles for",v
                    g.app.openWithFiles.remove(d)
            #@nonl
            #@-node:ekr.20031218072017.2831:<< remove previous entry from app.openWithFiles if it exists >>
            #@afterref
 # 4/22/03
            g.app.openWithFiles.append(theDict)
            return path
        except:
            theFile = None
            g.es("exception creating temp file",color="red")
            g.es_exception()
            return None
    #@nonl
    #@-node:ekr.20031218072017.2830:createOpenWithTempFile
    #@+node:ekr.20031218072017.2832:openWithTempFilePath
    def openWithTempFilePath (self,v,ext):
        
        """Return the path to the temp file corresponding to v and ext."""
    
        name = "LeoTemp_" + str(id(v.t)) + '_' + g.sanitize_filename(v.headString()) + ext
        name = g.toUnicode(name,g.app.tkEncoding) # 10/20/03
    
        td = g.os_path_abspath(tempfile.gettempdir())
        path = g.os_path_join(td,name)
        
        # print "openWithTempFilePath",path
        return path
    #@nonl
    #@-node:ekr.20031218072017.2832:openWithTempFilePath
    #@-node:ekr.20031218072017.2823:openWith and allies
    #@+node:ekr.20031218072017.2833:close
    def close(self):
        
        """Handle the File-Close command."""
    
        g.app.closeLeoWindow(self.frame)
    #@nonl
    #@-node:ekr.20031218072017.2833:close
    #@+node:ekr.20031218072017.2834:save
    def save(self):
    
        c = self
        
        if g.app.disableSave:
            g.es("Save commands disabled",color="purple")
            return
        
        # Make sure we never pass None to the ctor.
        if not c.mFileName:
            c.frame.title = ""
            c.mFileName = ""
    
        if c.mFileName != "":
            # Calls c.setChanged(False) if no error.
            c.fileCommands.save(c.mFileName) 
            return
    
        fileName = g.app.gui.runSaveFileDialog(
            initialfile = c.mFileName,
            title="Save",
            filetypes=[("Leo files", "*.leo")],
            defaultextension=".leo")
    
        if fileName:
            # 7/2/02: don't change mFileName until the dialog has suceeded.
            c.mFileName = g.ensure_extension(fileName, ".leo")
            c.frame.title = c.mFileName
            c.frame.setTitle(g.computeWindowTitle(c.mFileName))
            c.fileCommands.save(c.mFileName)
            c.updateRecentFiles(c.mFileName)
            if g.app.config.getBool( c, "lock_open_files" ):
                if not c.frame.hasReceiver():
                    import java
                    of = java.io.File( fileName )
                    fis = java.io.RandomAccessFile( of, "rw" )
                    channel = fis.getChannel()
                    lock = channel.tryLock()
                    if lock:
                        c._lock = lock
                    c.frame.startReceiver()
                
    #@nonl
    #@-node:ekr.20031218072017.2834:save
    #@+node:ekr.20031218072017.2835:saveAs
    def saveAs(self):
        
        c = self
        
        if g.app.disableSave:
            g.es("Save commands disabled",color="purple")
            return
    
        # Make sure we never pass None to the ctor.
        if not c.mFileName:
            c.frame.title = ""
    
        fileName = g.app.gui.runSaveFileDialog(
            initialfile = c.mFileName,
            title="Save As",
            filetypes=[("Leo files", "*.leo")],
            defaultextension=".leo")
    
        if fileName:
            # 7/2/02: don't change mFileName until the dialog has suceeded.
            c.mFileName = g.ensure_extension(fileName, ".leo")
            c.frame.title = c.mFileName
            c.frame.setTitle(g.computeWindowTitle(c.mFileName))
            # Calls c.setChanged(False) if no error.
            c.fileCommands.saveAs(c.mFileName)
            c.updateRecentFiles(c.mFileName)
    #@nonl
    #@-node:ekr.20031218072017.2835:saveAs
    #@+node:ekr.20031218072017.2836:saveTo
    def saveTo(self):
        
        c = self
        
        if g.app.disableSave:
            g.es("Save commands disabled",color="purple")
            return
    
        # Make sure we never pass None to the ctor.
        if not c.mFileName:
            c.frame.title = ""
    
        # set local fileName, _not_ c.mFileName
        fileName = g.app.gui.runSaveFileDialog(
            initialfile = c.mFileName,
            title="Save To",
            filetypes=[("Leo files", "*.leo")],
            defaultextension=".leo")
    
        if fileName:
            fileName = g.ensure_extension(fileName, ".leo")
            c.fileCommands.saveTo(fileName)
            c.updateRecentFiles(c.mFileName)
    #@nonl
    #@-node:ekr.20031218072017.2836:saveTo
    #@+node:ekr.20031218072017.2837:revert
    def revert(self):
        
        c = self
    
        # Make sure the user wants to Revert.
        if not c.mFileName:
            return
            
        reply = g.app.gui.runAskYesNoDialog("Revert",
            "Revert to previous version of " + c.mFileName + "?")
    
        if reply=="no":
            return
    
        # Kludge: rename this frame so openWithFileName won't think it is open.
        fileName = c.mFileName ; c.mFileName = ""
    
        # Create a new frame before deleting this frame.
        ok, frame = g.openWithFileName(fileName,c)
        if ok:
            frame.deiconify()
            g.app.destroyWindow(c.frame)
        else:
            c.mFileName = fileName
    #@-node:ekr.20031218072017.2837:revert
    #@-node:ekr.20031218072017.2820:top level
    #@+node:ekr.20031218072017.2079:Recent Files submenu & allies
    #@+node:ekr.20031218072017.2080:clearRecentFiles
    #def clearRecentFiles (self):
    #    
    #    """Clear the recent files list, then add the present file."""
    #
    #    c = self ; f = c.frame
    #    
    #    recentFilesMenu = f.menu.getMenu("Recent Files...")
    #    f.menu.delete_range(recentFilesMenu,0,len(c.recentFiles))
    #    
    #    c.recentFiles = []
    #    f.menu.createRecentFilesMenuItems()
    #    c.updateRecentFiles(c.mFileName)
    #    c.config.setRecentFiles(c.recentFiles)
        
    def clearRecentFiles (self): 
        
        """Clear the recent files list, then add the present file."""
    
        c = self ; f = c.frame ; u = c.undoer
        
        bunch = u.beforeClearRecentFiles()
        
        recentFilesMenu = f.menu.getMenu("Recent Files...")
        f.menu.delete_range(recentFilesMenu,0,len(c.recentFiles))
        
        c.recentFiles = []
        g.app.config.recentFiles = [] # New in Leo 4.3.
        f.menu.createRecentFilesMenuItems()
        c.updateRecentFiles(c.fileName())
        
        g.app.config.appendToRecentFiles(c.recentFiles)
        
        u.afterClearRecentFiles(bunch)
    #@nonl
    #@-node:ekr.20031218072017.2080:clearRecentFiles
    #@+node:ekr.20031218072017.2081:openRecentFile
    def openRecentFile(self,name=None):
        
        if not name: return
    
        c = self ; v = c.currentVnode()
        #@    << Set closeFlag if the only open window is empty >>
        #@+node:ekr.20031218072017.2082:<< Set closeFlag if the only open window is empty >>
        #@+at 
        #@nonl
        # If this is the only open window was opened when the app started, and 
        # the window has never been written to or saved, then we will 
        # automatically close that window if this open command completes 
        # successfully.
        #@-at
        #@@c
            
        closeFlag = (
            c.frame.startupWindow==True and # The window was open on startup
            c.changed==False and c.frame.saved==False and # The window has never been changed
            g.app.numberOfWindows == 1) # Only one untitled window has ever been opened
        #@nonl
        #@-node:ekr.20031218072017.2082:<< Set closeFlag if the only open window is empty >>
        #@nl
        
        fileName = name
        if not g.doHook("recentfiles1",c=c,p=v,v=v,fileName=fileName,closeFlag=closeFlag):
            ok, frame = g.openWithFileName(fileName,c)
            if ok and closeFlag:
                g.app.destroyWindow(c.frame) # 12/12/03
                g.app.setLog(frame.log,"openRecentFile") # Sets the log stream for g.es()
                c = frame.c # 6/10/04: Switch to the new commander so the "recentfiles2" hook doesn't crash.
    
        g.doHook("recentfiles2",c=c,p=v,v=v,fileName=fileName,closeFlag=closeFlag)
    #@-node:ekr.20031218072017.2081:openRecentFile
    #@+node:ekr.20031218072017.2083:c.updateRecentFiles
    #@+at
    # def updateRecentFiles (self,fileName):
    #     """Create the RecentFiles menu.  May be called with Null 
    # fileName."""
    #     if g.app.unitTesting: return
    # 
    #     # Update the recent files list in all windows.
    #     if fileName:
    #         compareFileName = 
    # g.os_path_normpath(g.os_path_abspath(fileName))
    #         self.recentFiles.insert(0,fileName)
    #         self.frame.menu.createRecentFilesMenuItems()
    #         # g.trace(fileName)
    #         for frame in g.app.windowList:
    #             c = frame.c
    #             # Remove all versions of the file name.
    #             for name in c.recentFiles:
    #                 if compareFileName == 
    # g.os_path_normpath(g.os_path_abspath(name)):
    #                     c.recentFiles.remove(name)
    #             c.recentFiles.insert(0,fileName)
    #             # g.trace(fileName)
    #             # Recreate the Recent Files menu.
    #             #frame.menu.createRecentFilesMenuItems()
    #     else:
    #         for frame in g.app.windowList:
    #             pass
    #             #frame.menu.createRecentFilesMenuItems()
    #@-at
    #@@c
    def updateRecentFiles (self,fileName):
        
        """Create the RecentFiles menu.  May be called with Null fileName."""
        
        if g.app.unitTesting: return
        
        def munge(name):
            name = name or ''
            return g.os_path_normpath(name).lower()
    
        # Update the recent files list in all windows. 
        if fileName:
            compareFileName = munge(fileName)
            # g.trace(fileName)
            for frame in g.app.windowList:
                c = frame.c
                # Remove all versions of the file name.
                for name in c.recentFiles:
                    if compareFileName == munge(name):
                        c.recentFiles.remove(name)
                c.recentFiles.insert(0,fileName)
                # g.trace(fileName)
                # Recreate the Recent Files menu.
                frame.menu.createRecentFilesMenuItems()
        else:
            for frame in g.app.windowList:
                frame.menu.createRecentFilesMenuItems()
    #@nonl
    #@-node:ekr.20031218072017.2083:c.updateRecentFiles
    #@-node:ekr.20031218072017.2079:Recent Files submenu & allies
    #@+node:ekr.20031218072017.2838:Read/Write submenu
    #@+node:ekr.20031218072017.2839:readOutlineOnly
    def readOutlineOnly (self):
    
        fileName = g.app.gui.runOpenFileDialog(
            title="Read Outline Only",
            filetypes=[("Leo files", "*.leo"), ("All files", "*")],
            defaultextension=".leo")
    
        if not fileName:
            return
    
        try:
            theFile = open(fileName,'r')
            c,frame = g.app.gui.newLeoCommanderAndFrame(fileName)
            frame.deiconify()
            frame.lift()
            g.app.root.update() # Force a screen redraw immediately.
            c.fileCommands.readOutlineOnly(theFile,fileName) # closes file.
        except:
            g.es("can not open:" + fileName)
    #@nonl
    #@-node:ekr.20031218072017.2839:readOutlineOnly
    #@+node:ekr.20031218072017.1839:readAtFileNodes
    def readAtFileNodes (self):
    
        c = self ; v = c.currentVnode()
    
        # Create copy for undo.
        v_copy = c.undoer.saveTree(v)
        oldText = c.frame.body.getAllText()
        oldSel = c.frame.body.getTextSelection()
    
        c.fileCommands.readAtFileNodes()
    
        newText = c.frame.body.getAllText()
        newSel = c.frame.body.getTextSelection()
    
        c.undoer.setUndoParams("Read @file Nodes",
            v,select=v,oldTree=v_copy,
            oldText=oldText,newText=newText,
            oldSel=oldSel,newSel=newSel)
    #@nonl
    #@-node:ekr.20031218072017.1839:readAtFileNodes
    #@+node:ekr.20031218072017.2840:4.0 Commands
    #@+node:ekr.20031218072017.1809:importDerivedFile
    def importDerivedFile (self):
        
        """Create a new outline from a 4.0 derived file."""
        
        c = self ; frame = c.frame ; v = c.currentVnode()
        
        types = [
            ("All files","*"),
            ("C/C++ files","*.c"),
            ("C/C++ files","*.cpp"),
            ("C/C++ files","*.h"),
            ("C/C++ files","*.hpp"),
            ("Java files","*.java"),
            ("Pascal files","*.pas"),
            ("Python files","*.py") ]
        
        names = g.app.gui.runOpenFileDialog(
            title="Import Derived File",
            filetypes=types,
            defaultextension=".py",
            multiple=True)
    
        if names:
            c.importCommands.importDerivedFiles(v,names)
    #@nonl
    #@-node:ekr.20031218072017.1809:importDerivedFile
    #@-node:ekr.20031218072017.2840:4.0 Commands
    #@-node:ekr.20031218072017.2838:Read/Write submenu
    #@+node:ekr.20031218072017.2841:Tangle submenu
    #@+node:ekr.20031218072017.2842:tangleAll
    def tangleAll(self):
        
        c = self
        c.tangleCommands.tangleAll()
    #@-node:ekr.20031218072017.2842:tangleAll
    #@+node:ekr.20031218072017.2843:tangleMarked
    def tangleMarked(self):
    
        c = self
        c.tangleCommands.tangleMarked()
    #@-node:ekr.20031218072017.2843:tangleMarked
    #@+node:ekr.20031218072017.2844:tangle
    def tangle (self):
    
        c = self
        c.tangleCommands.tangle()
    #@nonl
    #@-node:ekr.20031218072017.2844:tangle
    #@-node:ekr.20031218072017.2841:Tangle submenu
    #@+node:ekr.20031218072017.2845:Untangle submenu
    #@+node:ekr.20031218072017.2846:untangleAll
    def untangleAll(self):
    
        c = self
        c.tangleCommands.untangleAll()
        c.undoer.clearUndoState()
    #@-node:ekr.20031218072017.2846:untangleAll
    #@+node:ekr.20031218072017.2847:untangleMarked
    def untangleMarked(self):
    
        c = self
        c.tangleCommands.untangleMarked()
        c.undoer.clearUndoState()
    #@-node:ekr.20031218072017.2847:untangleMarked
    #@+node:ekr.20031218072017.2848:untangle
    def untangle(self):
    
        c = self
        c.tangleCommands.untangle()
        c.undoer.clearUndoState()
    #@-node:ekr.20031218072017.2848:untangle
    #@-node:ekr.20031218072017.2845:Untangle submenu
    #@+node:ekr.20031218072017.2849:Import&Export submenu
    #@+node:ekr.20031218072017.2850:exportHeadlines
    def exportHeadlines (self):
        
        c = self
    
        filetypes = [("Text files", "*.txt"),("All files", "*")]
    
        fileName = g.app.gui.runSaveFileDialog(
            initialfile="headlines.txt",
            title="Export Headlines",
            filetypes=filetypes,
            defaultextension=".txt")
    
        if fileName and len(fileName) > 0:
            c.importCommands.exportHeadlines(fileName)
    
    #@-node:ekr.20031218072017.2850:exportHeadlines
    #@+node:ekr.20031218072017.2851:flattenOutline
    def flattenOutline (self):
        
        c = self
    
        filetypes = [("Text files", "*.txt"),("All files", "*")]
    
        fileName = g.app.gui.runSaveFileDialog(
            initialfile="flat.txt",
            title="Flatten Outline",
            filetypes=filetypes,
            defaultextension=".txt")
    
        if fileName and len(fileName) > 0:
            c.importCommands.flattenOutline(fileName)
    
    #@-node:ekr.20031218072017.2851:flattenOutline
    #@+node:ekr.20031218072017.2852:importAtRoot
    def importAtRoot (self):
        
        c = self
        
        types = [
            ("All files","*"),
            ("C/C++ files","*.c"),
            ("C/C++ files","*.cpp"),
            ("C/C++ files","*.h"),
            ("C/C++ files","*.hpp"),
            ("Java files","*.java"),
            ("Pascal files","*.pas"),
            ("Python files","*.py") ]
    
        names = g.app.gui.runOpenFileDialog(
            title="Import To @root",
            filetypes=types,
            defaultextension=".py",
            multiple=True)
    
        if names:
            c.importCommands.importFilesCommand (names,"@root")
    #@-node:ekr.20031218072017.2852:importAtRoot
    #@+node:ekr.20031218072017.2853:importAtFile
    def importAtFile (self):
        
        c = self
    
        types = [
            ("All files","*"),
            ("C/C++ files","*.c"),
            ("C/C++ files","*.cpp"),
            ("C/C++ files","*.h"),
            ("C/C++ files","*.hpp"),
            ("Java files","*.java"),
            ("Pascal files","*.pas"),
            ("Python files","*.py") ]
    
        names = g.app.gui.runOpenFileDialog(
            title="Import To @file",
            filetypes=types,
            defaultextension=".py",
            multiple=True)
    
        if names:
            c.importCommands.importFilesCommand(names,"@file")
    #@nonl
    #@-node:ekr.20031218072017.2853:importAtFile
    #@+node:ekr.20031218072017.2854:importCWEBFiles
    def importCWEBFiles (self):
        
        c = self
        
        filetypes = [
            ("CWEB files", "*.w"),
            ("Text files", "*.txt"),
            ("All files", "*")]
    
        names = g.app.gui.runOpenFileDialog(
            title="Import CWEB Files",
            filetypes=filetypes,
            defaultextension=".w",
            multiple=True)
    
        if names:
            c.importCommands.importWebCommand(names,"cweb")
    #@-node:ekr.20031218072017.2854:importCWEBFiles
    #@+node:ekr.20031218072017.2855:importFlattenedOutline
    def importFlattenedOutline (self):
        
        c = self
        
        types = [("Text files","*.txt"), ("All files","*")]
    
        names = g.app.gui.runOpenFileDialog(
            title="Import MORE Text",
            filetypes=types,
            defaultextension=".py",
            multiple=True)
    
        if names:
            c.importCommands.importFlattenedOutline(names)
    #@-node:ekr.20031218072017.2855:importFlattenedOutline
    #@+node:ekr.20031218072017.2856:importNowebFiles
    def importNowebFiles (self):
        
        c = self
    
        filetypes = [
            ("Noweb files", "*.nw"),
            ("Text files", "*.txt"),
            ("All files", "*")]
    
        names = g.app.gui.runOpenFileDialog(
            title="Import Noweb Files",
            filetypes=filetypes,
            defaultextension=".nw",
            multiple=True)
    
        if names:
            c.importCommands.importWebCommand(names,"noweb")
    #@-node:ekr.20031218072017.2856:importNowebFiles
    #@+node:ekr.20031218072017.2857:outlineToCWEB
    def outlineToCWEB (self):
        
        c = self
    
        filetypes=[
            ("CWEB files", "*.w"),
            ("Text files", "*.txt"),
            ("All files", "*")]
    
        fileName = g.app.gui.runSaveFileDialog(
            initialfile="cweb.w",
            title="Outline To CWEB",
            filetypes=filetypes,
            defaultextension=".w")
    
        if fileName and len(fileName) > 0:
            c.importCommands.outlineToWeb(fileName,"cweb")
    
    #@-node:ekr.20031218072017.2857:outlineToCWEB
    #@+node:ekr.20031218072017.2858:outlineToNoweb
    def outlineToNoweb (self):
        
        c = self
        
        filetypes=[
            ("Noweb files", "*.nw"),
            ("Text files", "*.txt"),
            ("All files", "*")]
    
        fileName = g.app.gui.runSaveFileDialog(
            initialfile=self.outlineToNowebDefaultFileName,
            title="Outline To Noweb",
            filetypes=filetypes,
            defaultextension=".nw")
    
        if fileName and len(fileName) > 0:
            c.importCommands.outlineToWeb(fileName,"noweb")
            c.outlineToNowebDefaultFileName = fileName
    
    #@-node:ekr.20031218072017.2858:outlineToNoweb
    #@+node:ekr.20031218072017.2859:removeSentinels
    def removeSentinels (self):
        
        c = self
        
        types = [
            ("All files","*"),
            ("C/C++ files","*.c"),
            ("C/C++ files","*.cpp"),
            ("C/C++ files","*.h"),
            ("C/C++ files","*.hpp"),
            ("Java files","*.java"),
            ("Pascal files","*.pas"),
            ("Python files","*.py") ]
    
        names = g.app.gui.runOpenFileDialog(
            title="Remove Sentinels",
            filetypes=types,
            defaultextension=".py",
            multiple=True)
    
        if names:
            c.importCommands.removeSentinelsCommand (names)
    #@nonl
    #@-node:ekr.20031218072017.2859:removeSentinels
    #@+node:ekr.20031218072017.2860:weave
    def weave (self):
        
        c = self
    
        filetypes = [("Text files", "*.txt"),("All files", "*")]
    
        fileName = g.app.gui.runSaveFileDialog(
            initialfile="weave.txt",
            title="Weave",
            filetypes=filetypes,
            defaultextension=".txt")
    
        if fileName and len(fileName) > 0:
            c.importCommands.weave(fileName)
    #@-node:ekr.20031218072017.2860:weave
    #@-node:ekr.20031218072017.2849:Import&Export submenu
    #@-node:ekr.20031218072017.2819:File Menu
    #@+node:ekr.20031218072017.2861:Edit Menu...
    #@+node:ekr.20031218072017.2862:Edit top level
    #@+node:ekr.20031218072017.2863:delete
    def delete(self):
    
        c = self ; v = c.currentVnode()
        
        # 6/11/04: Don't assume the body has focus.
        try:
            body = c.frame.body ; bodyCtrl = body.bodyCtrl
            w = bodyCtrl.focus_get()
            if w == bodyCtrl:
                oldSel = body.getTextSelection()
                body.deleteTextSelection()
                body.onBodyChanged(v,"Delete",oldSel=oldSel)
            else:
                # Assume we are changing a headline...
                # This works even if the assumption is incorrect.
                body.deleteTextSelection(w)
                c.frame.tree.onHeadChanged(v)
        except:
            # import traceback ; traceback.print_exc()
            pass
    #@nonl
    #@-node:ekr.20031218072017.2863:delete
    #@+node:ekr.20031218072017.2140:c.executeScript
    def executeScript(self,p=None,script=None,useSelectedText=True, language = None):
    
        """This executes body text as a Python script.
        
        We execute the selected text, or the entire body text if no text is selected."""
        
        c = self ; error = False ; s = None ; script1 = script
        print "EXECUTE SCRIPT!!!"
        if not p:
            lp = self.currentPosition()
        else:
            lp = p
        
        if not language:
            language = g.scanForAtLanguage( self, lp )
            
        if not script:
            script = g.getScript(c,p,useSelectedText=useSelectedText)
        
        rv = self.script_handler.executeScript( language, lp, script )
        if rv:
            return
        
        #@    << redirect output >>
        #@+node:ekr.20031218072017.2143:<< redirect output >>
        if c.config.redirect_execute_script_output_to_log_pane:
        
            g.redirectStdout() # Redirect stdout
            g.redirectStderr() # Redirect stderr
        #@nonl
        #@-node:ekr.20031218072017.2143:<< redirect output >>
        #@nl
        # g.trace(script)
        if script:
            script = script.strip()
        if script:
            # 9/14/04: Temporarily add the open directory to sys.path.
            sys.path.insert(0,c.frame.openDirectory)
            script += '\n' # Make sure we end the script properly.
            try:
                exec script in {} # Use {} to get a pristine environment!
                #@            << unredirect output >>
                #@+node:EKR.20040627100424:<< unredirect output >>
                if c.config.redirect_execute_script_output_to_log_pane:
                
                    g.restoreStderr()
                    g.restoreStdout()
                #@nonl
                #@-node:EKR.20040627100424:<< unredirect output >>
                #@nl
                if not script1:
                    g.es("end of script",color="purple")
            except:
                #@            << unredirect output >>
                #@+node:EKR.20040627100424:<< unredirect output >>
                if c.config.redirect_execute_script_output_to_log_pane:
                
                    g.restoreStderr()
                    g.restoreStdout()
                #@nonl
                #@-node:EKR.20040627100424:<< unredirect output >>
                #@nl
                g.es("exception executing script ")
                fileName,n = g.es_exception(full=False,c=c)
                if fileName not in (None,"<string>"):
                    g.es("exception in file %s, line: %d" % (fileName,n))
                if p and not script1 and fileName == "<string>":
                    c.goToScriptLineNumber(p,script,n)
                else:
                    #@                << dump the lines of script near the error >>
                    #@+node:EKR.20040612215018:<< dump the lines of script near the error >>
                    if g.os_path_exists(fileName):
                        f = file(fileName)
                        lines = f.readlines()
                        f.close()
                    else:
                        lines = g.splitLines(script)
                    
                    s = '-' * 20
                    print s; g.es(s)
                    
                    if 1:
                        # Just print the error line.
                        try:
                            s = "%s line %d: %s" % (fileName,n,lines[n-1])
                            print s, ; g.es(s,newline=False)
                        except IndexError:
                            s = "%s line %d" % (fileName,n)
                            print s, ; g.es(s,newline=False)
                    else:
                        i = max(0,n-2)
                        j = min(n+2,len(lines))
                        # g.trace(n,i,j)
                        while i < j:
                            ch = g.choose(i==n-1,'*',' ')
                            s = "%s line %d: %s" % (ch,i+1,lines[i])
                            print s, ; g.es(s,newline=False)
                            i += 1
                    #@nonl
                    #@-node:EKR.20040612215018:<< dump the lines of script near the error >>
                    #@nl
                c.frame.tree.redrawAfterException()
            del sys.path[0]
        elif not error:
            #@        << unredirect output >>
            #@+node:EKR.20040627100424:<< unredirect output >>
            if c.config.redirect_execute_script_output_to_log_pane:
            
                g.restoreStderr()
                g.restoreStdout()
            #@nonl
            #@-node:EKR.20040627100424:<< unredirect output >>
            #@nl
            g.es("no script selected",color="blue")
            
        # Force a redraw _after_ all messages have been output.
        c.redraw() 
    #@nonl
    #@-node:ekr.20031218072017.2140:c.executeScript
    #@+node:ekr.20031218072017.2864:goToLineNumber & allies
    def goToLineNumber (self,root=None,lines=None,n=None,scriptFind=False):
    
        c = self ; p = c.currentPosition()
        root1 = root
        if root is None:
            #@        << set root >>
            #@+node:ekr.20031218072017.2865:<< set root >>
            # First look for ancestor @file node.
            fileName = None
            for p in p.self_and_parents_iter():
                fileName = p.anyAtFileNodeName()
                if fileName: break
            
            # New in 4.2: Search the entire tree for joined nodes.
            if not fileName:
                p1 = c.currentPosition()
                for p in c.all_positions_iter():
                    if p.v.t == p1.v.t and not p == p1: #CHANGED from p !=
                        # Found a joined position.
                        for p in p.self_and_parents_iter():
                            fileName = p.anyAtFileNodeName()
                            # New in 4.2 b3: ignore @all nodes.
                            if fileName and not p.isAtAllNode(): break
                    if fileName: break
            
            if fileName:
                root = p.copy()
            else:
                # New in 4.2.1: assume the c.currentPosition is the root of a script.
                root = c.currentPosition()
                g.es("No ancestor @file node: using script line numbers", color="blue")
                scriptFind = True
                lines = g.getScript (c,root,useSelectedText=False)
                lines = g.splitLines(lines)
                if 0:
                    for line in lines:
                        print line,
            #@nonl
            #@-node:ekr.20031218072017.2865:<< set root >>
            #@nl
        if lines is None:
            #@        << read the file into lines >>
            #@+node:ekr.20031218072017.2866:<< read the file into lines >>
            # 1/26/03: calculate the full path.
            d = g.scanDirectives(c)
            path = d.get("path")
            
            fileName = g.os_path_join(path,fileName)
            
            try:
                lines=self.gotoLineNumberOpen(fileName) # bwm
            except:
                g.es("not found: " + fileName)
                return
            #@nonl
            #@-node:ekr.20031218072017.2866:<< read the file into lines >>
            #@nl
        if n is None:
            #@        << get n, the line number, from a dialog >>
            #@+node:ekr.20031218072017.2867:<< get n, the line number, from a dialog >>
            n = g.app.gui.runAskOkCancelNumberDialog("Enter Line Number","Line number:")
            if n == -1:
                return
            #@nonl
            #@-node:ekr.20031218072017.2867:<< get n, the line number, from a dialog >>
            #@nl
            n = self.applyLineNumberMappingIfAny(n) #bwm
        if n==1:
            p = root ; n2 = 1 ; found = True
        elif n >= len(lines):
            p = root ; found = False
            n2 = p.bodyString().count('\n')
        elif root.isAtAsisFileNode():
            #@        << count outline lines, setting p,n2,found >>
            #@+node:ekr.20031218072017.2868:<< count outline lines, setting p,n2,found >> (@file-nosent only)
            p = lastv = root
            prev = 0 ; found = False
            
            for p in p.self_and_subtree_iter():
                lastv = p.copy()
                s = p.bodyString()
                lines = s.count('\n')
                if len(s) > 0 and s[-1] != '\n':
                    lines += 1
                # print lines,prev,p
                if prev + lines >= n:
                    found = True ; break
                prev += lines
            
            p = lastv
            n2 = max(1,n-prev)
            #@nonl
            #@-node:ekr.20031218072017.2868:<< count outline lines, setting p,n2,found >> (@file-nosent only)
            #@nl
        else:
            vnodeName,childIndex,gnx,n2,delim = self.convertLineToVnodeNameIndexLine(lines,n,root,scriptFind)
            found = True
            if not vnodeName:
                g.es("error handling: " + root.headString())
                return
            #@        << set p to the node given by vnodeName, etc. >>
            #@+node:ekr.20031218072017.2869:<< set p to the node given by vnodeName, etc. >>
            if scriptFind:
                #@    << just scan for the node name >>
                #@+node:ekr.20041111093404:<< just scan for the node name >>
                # This is safe enough because clones are not much of an issue.
                found = False
                for p in root.self_and_subtree_iter():
                    if p.matchHeadline(vnodeName):
                        found = True ; break
                #@nonl
                #@-node:ekr.20041111093404:<< just scan for the node name >>
                #@nl
            elif gnx:
                #@    << 4.2: get node from gnx >>
                #@+node:EKR.20040609110138:<< 4.2: get node from gnx >>
                found = False
                gnx = g.app.nodeIndices.scanGnx(gnx,0)
                
                # g.trace(vnodeName)
                # g.trace(gnx)
                
                for p in root.self_and_subtree_iter():
                    if p.matchHeadline(vnodeName):
                        # g.trace(p.v.t.fileIndex)
                        if p.v.t.fileIndex == gnx:
                            found = True ; break
                
                if not found:
                    g.es("not found: " + vnodeName, color="red")
                    return
                #@nonl
                #@-node:EKR.20040609110138:<< 4.2: get node from gnx >>
                #@nl
            elif childIndex == -1:
                #@    << 4.x: scan for the node using tnodeList and n >>
                #@+node:ekr.20031218072017.2870:<< 4.x: scan for the node using tnodeList and n >>
                # This is about the best that can be done without replicating the entire atFile write logic.
                
                ok = True
                
                if not hasattr(root.v.t,"tnodeList"):
                    s = "no child index for " + root.headString()
                    print s ; g.es(s, color="red")
                    ok = False
                
                if ok:
                    tnodeList = root.v.t.tnodeList
                    #@    << set tnodeIndex to the number of +node sentinels before line n >>
                    #@+node:ekr.20031218072017.2871:<< set tnodeIndex to the number of +node sentinels before line n >>
                    tnodeIndex = -1 # Don't count the @file node.
                    scanned = 0 # count of lines scanned.
                    
                    for s in lines:
                        if scanned >= n:
                            break
                        i = g.skip_ws(s,0)
                        if g.match(s,i,delim):
                            i += len(delim)
                            if g.match(s,i,"+node"):
                                # g.trace(tnodeIndex,s.rstrip())
                                tnodeIndex += 1
                        scanned += 1
                    #@nonl
                    #@-node:ekr.20031218072017.2871:<< set tnodeIndex to the number of +node sentinels before line n >>
                    #@nl
                    tnodeIndex = max(0,tnodeIndex)
                    #@    << set p to the first vnode whose tnode is tnodeList[tnodeIndex] or set ok = False >>
                    #@+node:ekr.20031218072017.2872:<< set p to the first vnode whose tnode is tnodeList[tnodeIndex] or set ok = false >>
                    #@+at 
                    #@nonl
                    # We use the tnodeList to find a _tnode_ corresponding to 
                    # the proper node, so the user will for sure be editing 
                    # the proper text, even if several nodes happen to have 
                    # the same headline.  This is really all that we need.
                    # 
                    # However, this code has no good way of distinguishing 
                    # between different cloned vnodes in the file: they all 
                    # have the same tnode.  So this code just picks p = 
                    # t.vnodeList[0] and leaves it at that.
                    # 
                    # The only way to do better is to scan the outline, 
                    # replicating the write logic to determine which vnode 
                    # created the given line.  That's way too difficult, and 
                    # it would create an unwanted dependency in this code.
                    #@-at
                    #@@c
                    
                    # g.trace("tnodeIndex",tnodeIndex)
                    if tnodeIndex < len(tnodeList):
                        t = tnodeList[tnodeIndex]
                        # Find the first vnode whose tnode is t.
                        found = False
                        for p in root.self_and_subtree_iter():
                            if p.v.t == t:
                                found = True ; break
                        if not found:
                            s = "tnode not found for " + vnodeName
                            print s ; g.es(s, color="red") ; ok = False
                        elif p.headString().strip() != vnodeName:
                            if 0: # Apparently this error doesn't prevent a later scan for working properly.
                                s = "Mismatched vnodeName\nExpecting: %s\n got: %s" % (p.headString(),vnodeName)
                                print s ; g.es(s, color="red")
                            ok = False
                    else:
                        if root1 is None: # Kludge: disable this message when called by goToScriptLineNumber.
                            s = "Invalid computed tnodeIndex: %d" % tnodeIndex
                            print s ; g.es(s, color = "red")
                        ok = False
                    #@nonl
                    #@-node:ekr.20031218072017.2872:<< set p to the first vnode whose tnode is tnodeList[tnodeIndex] or set ok = false >>
                    #@nl
                            
                if not ok:
                    # Fall back to the old logic.
                    #@    << set p to the first node whose headline matches vnodeName >>
                    #@+node:ekr.20031218072017.2873:<< set p to the first node whose headline matches vnodeName >>
                    found = False
                    for p in root.self_and_subtree_iter():
                        if p.matchHeadline(vnodeName):
                            found = True ; break
                    
                    if not found:
                        s = "not found: " + vnodeName
                        print s ; g.es(s, color="red")
                        return
                    #@nonl
                    #@-node:ekr.20031218072017.2873:<< set p to the first node whose headline matches vnodeName >>
                    #@nl
                #@nonl
                #@-node:ekr.20031218072017.2870:<< 4.x: scan for the node using tnodeList and n >>
                #@nl
            else:
                #@    << 3.x: scan for the node with the given childIndex >>
                #@+node:ekr.20031218072017.2874:<< 3.x: scan for the node with the given childIndex >>
                found = False
                for p in root.self_and_subtree_iter():
                    if p.matchHeadline(vnodeName):
                        if childIndex <= 0 or p.childIndex() + 1 == childIndex:
                            found = True ; break
                
                if not found:
                    g.es("not found: " + vnodeName, color="red")
                    return
                #@nonl
                #@-node:ekr.20031218072017.2874:<< 3.x: scan for the node with the given childIndex >>
                #@nl
            #@nonl
            #@-node:ekr.20031218072017.2869:<< set p to the node given by vnodeName, etc. >>
            #@nl
        #@    << select p and make it visible >>
        #@+node:ekr.20031218072017.2875:<< select p and make it visible >>
        c.beginUpdate()
        c.frame.tree.expandAllAncestors(p)
        c.selectVnode(p)
        c.endUpdate()
        #@nonl
        #@-node:ekr.20031218072017.2875:<< select p and make it visible >>
        #@nl
        #@    << put the cursor on line n2 of the body text >>
        #@+node:ekr.20031218072017.2876:<< put the cursor on line n2 of the body text >>
        if found:
            c.frame.body.setInsertPointToStartOfLine(n2-1)
        else:
            c.frame.body.setInsertionPointToEnd()
            g.es("%d lines" % len(lines), color="blue")
        
        c.frame.body.makeInsertPointVisible()
        #@nonl
        #@-node:ekr.20031218072017.2876:<< put the cursor on line n2 of the body text >>
        #@nl
    #@nonl
    #@+node:ekr.20031218072017.2877:convertLineToVnodeNameIndexLine
    #@+at 
    #@nonl
    # We count "real" lines in the derived files, ignoring all sentinels that 
    # do not arise from source lines.  When the indicated line is found, we 
    # scan backwards for an @+body line, get the vnode's name from that line 
    # and set p to the indicated vnode.  This will fail if vnode names have 
    # been changed, and that can't be helped.
    # 
    # Returns (vnodeName,offset)
    # 
    # vnodeName: the name found in the previous @+body sentinel.
    # offset: the offset within p of the desired line.
    #@-at
    #@@c
    
    def convertLineToVnodeNameIndexLine (self,lines,n,root,scriptFind):
        
        """Convert a line number n to a vnode name, (child index or gnx) and line number."""
    
        c = self ; at = c.atFileCommands
        childIndex = 0 ; gnx = None ; newDerivedFile = False
        thinFile = root.isAtThinFileNode()
        #@    << set delim, leoLine from the @+leo line >>
        #@+node:ekr.20031218072017.2878:<< set delim, leoLine from the @+leo line >>
        # Find the @+leo line.
        tag = "@+leo"
        i = 0 
        while i < len(lines) and lines[i].find(tag)==-1:
            i += 1
        leoLine = i # Index of the line containing the leo sentinel
        
        if leoLine < len(lines):
            s = lines[leoLine]
            valid,newDerivedFile,start,end,derivedFileIsThin = at.parseLeoSentinel(s)
            if valid: delim = start + '@'
            else:     delim = None
        else:
            delim = None
        #@-node:ekr.20031218072017.2878:<< set delim, leoLine from the @+leo line >>
        #@nl
        if not delim:
            g.es("bad @+leo sentinel")
            return None,None,None,None,None
        #@    << scan back to @+node, setting offset,nodeSentinelLine >>
        #@+node:ekr.20031218072017.2879:<< scan back to  @+node, setting offset,nodeSentinelLine >>
        offset = 0 # This is essentially the Tk line number.
        nodeSentinelLine = -1
        line = n - 1
        while line >= 0:
            s = lines[line]
            # g.trace(s)
            i = g.skip_ws(s,0)
            if g.match(s,i,delim):
                #@        << handle delim while scanning backward >>
                #@+node:ekr.20031218072017.2880:<< handle delim while scanning backward >>
                if line == n:
                    g.es("line "+str(n)+" is a sentinel line")
                i += len(delim)
                
                if g.match(s,i,"-node"):
                    # The end of a nested section.
                    line = self.skipToMatchingNodeSentinel(lines,line,delim)
                elif g.match(s,i,"+node"):
                    nodeSentinelLine = line
                    break
                elif g.match(s,i,"<<") or g.match(s,i,"@first"):
                    offset += 1 # Count these as a "real" lines.
                #@nonl
                #@-node:ekr.20031218072017.2880:<< handle delim while scanning backward >>
                #@nl
            else:
                offset += 1 # Assume the line is real.  A dubious assumption.
            line -= 1
        #@nonl
        #@-node:ekr.20031218072017.2879:<< scan back to  @+node, setting offset,nodeSentinelLine >>
        #@nl
        if nodeSentinelLine == -1:
            # The line precedes the first @+node sentinel
            # g.trace("before first line")
            return root.headString(),0,gnx,1,delim # 10/13/03
        s = lines[nodeSentinelLine]
        # g.trace(s)
        #@    << set vnodeName and (childIndex or gnx) from s >>
        #@+node:ekr.20031218072017.2881:<< set vnodeName and (childIndex or gnx) from s >>
        if scriptFind:
            # The vnode name follows the first ':'
            i = s.find(':',i)
            if i > -1:
                vnodeName = s[i+1:].strip()
            childIndex = -1
        elif newDerivedFile:
            i = 0
            if thinFile:
                # gnx is lies between the first and second ':':
                i = s.find(':',i)
                if i > 0:
                    i += 1
                    j = s.find(':',i)
                    if j > 0:
                        gnx = s[i:j]
                    else: i = len(s)
                else: i = len(s)
            # vnode name is everything following the first or second':'
            # childIndex is -1 as a flag for later code.
            i = s.find(':',i)
            if i > -1: vnodeName = s[i+1:].strip()
            else: vnodeName = None
            childIndex = -1
        else:
            # vnode name is everything following the third ':'
            i = 0 ; colons = 0
            while i < len(s) and colons < 3:
                if s[i] == ':':
                    colons += 1
                    if colons == 1 and i+1 < len(s) and s[i+1] in string.digits:
                        junk,childIndex = g.skip_long(s,i+1)
                i += 1
            vnodeName = s[i:].strip()
            
        # g.trace("gnx",gnx,"vnodeName:",vnodeName)
        if not vnodeName:
            vnodeName = None
            g.es("bad @+node sentinel")
        #@nonl
        #@-node:ekr.20031218072017.2881:<< set vnodeName and (childIndex or gnx) from s >>
        #@nl
        # g.trace("childIndex,offset",childIndex,offset,vnodeName)
        return vnodeName,childIndex,gnx,offset,delim
    #@-node:ekr.20031218072017.2877:convertLineToVnodeNameIndexLine
    #@+node:ekr.20031218072017.2882:skipToMatchingNodeSentinel
    def skipToMatchingNodeSentinel (self,lines,n,delim):
        
        s = lines[n]
        i = g.skip_ws(s,0)
        assert(g.match(s,i,delim))
        i += len(delim)
        if g.match(s,i,"+node"):
            start="+node" ; end="-node" ; delta=1
        else:
            assert(g.match(s,i,"-node"))
            start="-node" ; end="+node" ; delta=-1
        # Scan to matching @+-node delim.
        n += delta ; level = 0
        while 0 <= n < len(lines):
            s = lines[n] ; i = g.skip_ws(s,0)
            if g.match(s,i,delim):
                i += len(delim)
                if g.match(s,i,start):
                    level += 1
                elif g.match(s,i,end):
                    if level == 0: break
                    else: level -= 1
            n += delta
            
        # g.trace(n)
        return n
    #@nonl
    #@-node:ekr.20031218072017.2882:skipToMatchingNodeSentinel
    #@-node:ekr.20031218072017.2864:goToLineNumber & allies
    #@+node:bwmulder.20041231211219:gotoLineNumberOpen
    def gotoLineNumberOpen(self, *args, **kw):
        """
        Hook for mod_shadow plugin.
        """
        theFile = open(*args, **kw)
        lines = theFile.readlines()
        theFile.close()
        return lines
    #@nonl
    #@-node:bwmulder.20041231211219:gotoLineNumberOpen
    #@+node:bwmulder.20041231211219.1:applyLineNumberMappingIfAny
    def applyLineNumberMappingIfAny(self, n):
        """
        Hook for mod_shadow plugin.
        """
        return n
    #@nonl
    #@-node:bwmulder.20041231211219.1:applyLineNumberMappingIfAny
    #@+node:EKR.20040612232221:goToScriptLineNumber
    def goToScriptLineNumber (self,root,script,n):
    
        """Go to line n of a script."""
    
        c = self
        
        # g.trace(n,root)
        
        lines = g.splitLines(script)
        c.goToLineNumber(root=root,lines=lines,n=n,scriptFind=True)
    #@nonl
    #@-node:EKR.20040612232221:goToScriptLineNumber
    #@+node:ekr.20031218072017.2088:fontPanel
    def fontPanel(self):
        
        c = self ; frame = c.frame
    
        if not frame.fontPanel:
            frame.fontPanel = g.app.gui.createFontPanel(c)
            
        frame.fontPanel.bringToFront()
    #@nonl
    #@-node:ekr.20031218072017.2088:fontPanel
    #@+node:ekr.20031218072017.2090:colorPanel
    def colorPanel(self):
        
        c = self ; frame = c.frame
    
        if not frame.colorPanel:
            frame.colorPanel = g.app.gui.createColorPanel(c)
            
        frame.colorPanel.bringToFront()
    #@nonl
    #@-node:ekr.20031218072017.2090:colorPanel
    #@+node:ekr.20031218072017.2883:viewAllCharacters
    def viewAllCharacters (self, event=None):
    
        c = self ; frame = c.frame
        p = c.currentPosition()
        #colorizer = frame.body.getColorizer()
    
        #colorizer.showInvisibles = g.choose(colorizer.showInvisibles,0,1) #changed for JLeo
        self.showInvisibles = g.choose( self.showInvisibles, False, True )
        for z in self.invisibleWatchers:
            try:
                z.notify()
            except:
                pass
        # It is much easier to change the menu name here than in the menu updater.
        menu = frame.menu.getMenu("Edit")
        #if colorizer.showInvisibles:
        if self.showInvisibles:
            frame.menu.setMenuLabel(menu,"Show Invisibles","Hide Invisibles")
        else:
            frame.menu.setMenuLabel(menu,"Hide Invisibles","Show Invisibles")
    
        c.frame.body.recolor_now(p)
    #@nonl
    #@-node:ekr.20031218072017.2883:viewAllCharacters
    #@+node:ekr.20031218072017.2086:preferences
    def preferences(self):
        
        '''Replace the body pane by the preferences setters.'''
        
        c = self
        
        if 1: # New code
        
            leoConfig.settingsController(c,replaceBody=False)
            
        else: # Old code...
            # Show the Preferences Panel, creating it if necessary.
            frame = c.frame
        
            if not frame.prefsPanel:
                frame.prefsPanel = g.app.gui.createPrefsPanel(c)
                
            frame.prefsPanel.bringToFront()
    #@nonl
    #@-node:ekr.20031218072017.2086:preferences
    #@-node:ekr.20031218072017.2862:Edit top level
    #@+node:ekr.20031218072017.2884:Edit Body submenu
    #@+node:ekr.20031218072017.1704:convertAllBlanks
    def convertAllBlanks (self):
        
        c = self ; body = c.frame.body ; v = current = c.currentVnode()
        
        if g.app.batchMode:
            c.notValidInBatchMode("Convert All Blanks")
            return
        next = v.nodeAfterTree()
        theDict = g.scanDirectives(c)
        tabWidth  = theDict.get("tabwidth")
        # Create copy for undo.
        v_copy = c.undoer.saveTree(v)
        oldText = body.getAllText()
        oldSel = body.getTextSelection()
        count = 0
        while v and v != next:
            if v == current:
                if c.convertBlanks(setUndoParams=False):
                    count += 1 ; v.setDirty()
            else:
                changed = False ; result = []
                text = v.t.bodyString
                assert(g.isUnicode(text))
                lines = string.split(text, '\n')
                for line in lines:
                    s = g.optimizeLeadingWhitespace(line,tabWidth)
                    if s != line: changed = True
                    result.append(s)
                if changed:
                    count += 1 ; v.setDirty()
                    result = string.join(result,'\n')
                    v.setTnodeText(result)
            v = v.threadNext()
        if count > 0:
            newText = body.getAllText()
            newSel = body.getTextSelection()
            c.undoer.setUndoParams("Convert All Blanks",
                current,select=current,oldTree=v_copy,
                oldText=oldText,newText=newText,
                oldSel=oldSel,newSel=newSel)
        g.es("blanks converted to tabs in %d nodes" % count)
    #@nonl
    #@-node:ekr.20031218072017.1704:convertAllBlanks
    #@+node:ekr.20031218072017.1705:convertAllTabs
    def convertAllTabs (self):
    
        c = self ; body = c.frame.body ; v = current = c.currentVnode()
        
        if g.app.batchMode:
            c.notValidInBatchMode("Convert All Tabs")
            return
        next = v.nodeAfterTree()
        theDict = g.scanDirectives(c)
        tabWidth  = theDict.get("tabwidth")
        # Create copy for undo.
        v_copy = c.undoer.saveTree(v)
        oldText = body.getAllText()
        oldSel = body.getTextSelection()
        count = 0
        while v and v != next:
            if v == current:
                if self.convertTabs(setUndoParams=False):
                    count += 1 ; v.setDirty()
            else:
                result = [] ; changed = False
                text = v.t.bodyString
                assert(g.isUnicode(text))
                lines = string.split(text, '\n')
                for line in lines:
                    i,w = g.skip_leading_ws_with_indent(line,0,tabWidth)
                    s = g.computeLeadingWhitespace(w,-abs(tabWidth)) + line[i:] # use negative width.
                    if s != line: changed = True
                    result.append(s)
                if changed:
                    count += 1 ; v.setDirty()
                    result = string.join(result,'\n')
                    v.setTnodeText(result)
            v = v.threadNext()
        if count > 0:
            newText = body.getAllText()
            newSel = body.getTextSelection() # 7/11/03
            c.undoer.setUndoParams("Convert All Tabs",
                current,select=current,oldTree=v_copy,
                oldText=oldText,newText=newText,
                oldSel=oldSel,newSel=newSel)
        g.es("tabs converted to blanks in %d nodes" % count)
    #@nonl
    #@-node:ekr.20031218072017.1705:convertAllTabs
    #@+node:ekr.20031218072017.1821:convertBlanks
    def convertBlanks (self,setUndoParams=True):
    
        c = self ; body = c.frame.body
        
        if g.app.batchMode:
            c.notValidInBatchMode("Convert Blanks")
            return False
    
        head,lines,tail,oldSel,oldYview = c.getBodyLines(expandSelection=True)
        result = [] ; changed = False
    
        # Use the relative @tabwidth, not the global one.
        theDict = g.scanDirectives(c)
        tabWidth  = theDict.get("tabwidth")
        if not tabWidth: return False
    
        for line in lines:
            s = g.optimizeLeadingWhitespace(line,tabWidth)
            if s != line: changed = True
            result.append(s)
    
        if changed:
            result = string.join(result,'\n')
            undoType = g.choose(setUndoParams,"Convert Blanks",None)
            c.updateBodyPane(head,result,tail,undoType,oldSel,oldYview) # Handles undo
    
        return changed
    #@nonl
    #@-node:ekr.20031218072017.1821:convertBlanks
    #@+node:ekr.20031218072017.1822:convertTabs
    def convertTabs (self,setUndoParams=True):
    
        c = self ; body = c.frame.body
        
        if g.app.batchMode:
            c.notValidInBatchMode("Convert Tabs")
            return False
    
        head,lines,tail,oldSel,oldYview = self.getBodyLines(expandSelection=True)
        result = [] ; changed = False
        
        # Use the relative @tabwidth, not the global one.
        theDict = g.scanDirectives(c)
        tabWidth  = theDict.get("tabwidth")
        if not tabWidth: return False
    
        for line in lines:
            i,w = g.skip_leading_ws_with_indent(line,0,tabWidth)
            s = g.computeLeadingWhitespace(w,-abs(tabWidth)) + line[i:] # use negative width.
            if s != line: changed = True
            result.append(s)
    
        if changed:
            result = string.join(result,'\n')
            undoType = g.choose(setUndoParams,"Convert Tabs",None)
            c.updateBodyPane(head,result,tail,undoType,oldSel,oldYview) # Handles undo
            
        return changed
    #@-node:ekr.20031218072017.1822:convertTabs
    #@+node:ekr.20031218072017.1823:createLastChildNode
    def createLastChildNode (self,parent,headline,body):
        
        c = self
        if body and len(body) > 0:
            body = string.rstrip(body)
        if not body or len(body) == 0:
            body = ""
        v = parent.insertAsLastChild()
        v.initHeadString(headline)
        v.setTnodeText(body)
        v.setDirty()
        c.validateOutline()
    #@nonl
    #@-node:ekr.20031218072017.1823:createLastChildNode
    #@+node:ekr.20031218072017.1824:dedentBody
    def dedentBody (self):
        
        c = self ; p = c.currentPosition()
        
        if g.app.batchMode:
            c.notValidInBatchMode("Unindent")
            return
    
        d = g.scanDirectives(c,p) # Support @tab_width directive properly.
        tab_width = d.get("tabwidth",c.tab_width)
        head,lines,tail,oldSel,oldYview = self.getBodyLines()
        result = [] ; changed = False
        for line in lines:
            i, width = g.skip_leading_ws_with_indent(line,0,tab_width)
            s = g.computeLeadingWhitespace(width-abs(tab_width),tab_width) + line[i:]
            if s != line: changed = True
            result.append(s)
    
        if changed:
            result = string.join(result,'\n')
            c.updateBodyPane(head,result,tail,"Undent",oldSel,oldYview)
    #@nonl
    #@-node:ekr.20031218072017.1824:dedentBody
    #@+node:ekr.20031218072017.1706:extract
    def extract(self):
        
        c = self ; body = c.frame.body ; current = v = c.currentVnode()
        
        if g.app.batchMode:
            c.notValidInBatchMode("Extract")
            return
        
        head,lines,tail,oldSel,oldYview = self.getBodyLines()
        if not lines: return
        headline = lines[0] ; del lines[0]
        junk, ws = g.skip_leading_ws_with_indent(headline,0,c.tab_width)
        # Create copy for undo.
        v_copy = c.undoer.saveTree(v)
        oldText = body.getAllText()
        oldSel = body.getTextSelection()
        #@    << Set headline for extract >>
        #@+node:ekr.20031218072017.1707:<< Set headline for extract >>
        headline = string.strip(headline)
        while len(headline) > 0 and headline[0] == '/':
            headline = headline[1:]
        headline = string.strip(headline)
        #@nonl
        #@-node:ekr.20031218072017.1707:<< Set headline for extract >>
        #@nl
        # Remove leading whitespace from all body lines.
        result = []
        for line in lines:
            # Remove the whitespace on the first line
            line = g.removeLeadingWhitespace(line,ws,c.tab_width)
            result.append(line)
        # Create a new node from lines.
        newBody = string.join(result,'\n') # 11/23/03
        if head and len(head) > 0:
            head = string.rstrip(head)
        c.beginUpdate()
        if 1: # update range...
            c.createLastChildNode(v,headline,newBody) # 11/23/03
            undoType =  "Can't Undo" # 12/8/02: None enables further undoes, but there are bugs now.
            c.updateBodyPane(head,None,tail,undoType,oldSel,oldYview,setSel=False)
            newText = body.getAllText()
            newSel = body.getTextSelection() # 7/11/03
            c.undoer.setUndoParams("Extract",
                v,select=current,oldTree=v_copy,
                oldText=oldText,newText=newText,
                oldSel=oldSel,newSel=newSel)
        c.endUpdate()
    #@nonl
    #@-node:ekr.20031218072017.1706:extract
    #@+node:ekr.20031218072017.1708:extractSection
    def extractSection(self):
    
        c = self ; body = c.frame.body ; current = v = c.currentVnode()
        
        if g.app.batchMode:
            c.notValidInBatchMode("Extract Section")
            return
    
        head,lines,tail,oldSel,oldYview = self.getBodyLines()
        if not lines: return
        headline = lines[0] ; del lines[0]
        junk, ws = g.skip_leading_ws_with_indent(headline,0,c.tab_width)
        line1 = "\n" + headline
        # Create copy for undo.
        v_copy = c.undoer.saveTree(v)
        oldText = body.getAllText()
        oldSel = body.getTextSelection()
        #@    << Set headline for extractSection >>
        #@+node:ekr.20031218072017.1709:<< Set headline for extractSection >>
        if 0: # I have no idea why this was being done.
            while len(headline) > 0 and headline[0] == '/':
                headline = headline[1:]
        
        headline = headline.strip()
        
        if len(headline) < 5:
            oops = True
        else:
            head1 = headline[0:2] == '<<'
            head2 = headline[0:2] == '@<'
            tail1 = headline[-2:] == '>>'
            tail2 = headline[-2:] == '@>'
            oops = not (head1 and tail1) and not (head2 and tail2)
        
        if oops:
            g.es("Selected text should start with a section name",color="blue")
            return
        #@nonl
        #@-node:ekr.20031218072017.1709:<< Set headline for extractSection >>
        #@nl
        # Remove leading whitespace from all body lines.
        result = []
        for line in lines:
            # Remove the whitespace on the first line
            line = g.removeLeadingWhitespace(line,ws,c.tab_width)
            result.append(line)
        # Create a new node from lines.
        newBody = string.join(result,'\n')
        if head and len(head) > 0:
            head = string.rstrip(head)
        c.beginUpdate()
        if 1: # update range...
            c.createLastChildNode(v,headline,newBody)
            # g.trace(v)
            undoType = None # Set undo params later.
            c.updateBodyPane(head+line1,None,tail,undoType,oldSel,oldYview,setSel=False)
            newText = body.getAllText()
            newSel = body.getTextSelection()
            c.undoer.setUndoParams("Extract Section",v,
                select=current,oldTree=v_copy,
                oldText=oldText,newText=newText,
                oldSel=oldSel,newSel=newSel)
        c.endUpdate()
    #@nonl
    #@-node:ekr.20031218072017.1708:extractSection
    #@+node:ekr.20031218072017.1710:extractSectionNames
    def extractSectionNames(self):
    
        c = self ; body = c.frame.body ; current = v = c.currentVnode()
        
        if g.app.batchMode:
            c.notValidInBatchMode("Extract Section Names")
            return
    
        head,lines,tail,oldSel,oldYview = self.getBodyLines()
        if not lines: return
        # Create copy for undo.
        v_copy = c.undoer.saveTree(v)
        # No change to body or selection of this node.
        oldText = newText = body.getAllText()
        i, j = oldSel = newSel = body.getTextSelection()
        c.beginUpdate()
        if 1: # update range...
            found = False
            for s in lines:
                #@            << Find the next section name >>
                #@+node:ekr.20031218072017.1711:<< Find the next section name >>
                head1 = string.find(s,"<<")
                if head1 > -1:
                    head2 = string.find(s,">>",head1)
                else:
                    head1 = string.find(s,"@<")
                    if head1 > -1:
                        head2 = string.find(s,"@>",head1)
                        
                if head1 == -1 or head2 == -1 or head1 > head2:
                    name = None
                else:
                    name = s[head1:head2+2]
                #@nonl
                #@-node:ekr.20031218072017.1711:<< Find the next section name >>
                #@nl
                if name:
                    self.createLastChildNode(v,name,None)
                    found = True
            c.selectVnode(v)
            c.validateOutline()
            if not found:
                g.es("Selected text should contain one or more section names",color="blue")
        c.endUpdate()
        # No change to body or selection
        c.undoer.setUndoParams("Extract Names",
            v,select=current,oldTree=v_copy,
            oldText=oldText,newText=newText,
            oldSel=oldSel,newSel=newSel)
        # Restore the selection.
        body.setTextSelection(oldSel)
        body.setFocus()
    #@nonl
    #@-node:ekr.20031218072017.1710:extractSectionNames
    #@+node:ekr.20031218072017.1825:findBoundParagraph
    def findBoundParagraph (self):
        
        c = self
        head,ins,tail = c.frame.body.getInsertLines()
    
        if not ins or ins.isspace() or ins[0] == '@':
            return None,None,None,None # DTHEIN 18-JAN-2004
            
        head_lines = g.splitLines(head)
        tail_lines = g.splitLines(tail)
    
        if 0:
            #@        << trace head_lines, ins, tail_lines >>
            #@+node:ekr.20031218072017.1826:<< trace head_lines, ins, tail_lines >>
            if 0:
                print ; print "head_lines"
                for line in head_lines: print line
                print ; print "ins", ins
                print ; print "tail_lines"
                for line in tail_lines: print line
            else:
                g.es("head_lines: ",head_lines)
                g.es("ins: ",ins)
                g.es("tail_lines: ",tail_lines)
            #@nonl
            #@-node:ekr.20031218072017.1826:<< trace head_lines, ins, tail_lines >>
            #@nl
    
        # Scan backwards.
        i = len(head_lines)
        while i > 0:
            i -= 1
            line = head_lines[i]
            if len(line) == 0 or line.isspace() or line[0] == '@':
                i += 1 ; break
    
        pre_para_lines = head_lines[:i]
        para_head_lines = head_lines[i:]
    
        # Scan forwards.
        i = 0
        trailingNL = False # DTHEIN 18-JAN-2004: properly capture terminating NL
        while i < len(tail_lines):
            line = tail_lines[i]
            if len(line) == 0 or line.isspace() or line[0] == '@':
                trailingNL = line.endswith(u'\n') or line.startswith(u'@') # DTHEIN 21-JAN-2004
                break
            i += 1
            
    #	para_tail_lines = tail_lines[:i]
        para_tail_lines = tail_lines[:i]
        post_para_lines = tail_lines[i:]
        
        head = g.joinLines(pre_para_lines)
        result = para_head_lines 
        result.extend([ins])
        result.extend(para_tail_lines)
        tail = g.joinLines(post_para_lines)
    
        # DTHEIN 18-JAN-2004: added trailingNL to return value list
        return head,result,tail,trailingNL # string, list, string, bool
    #@nonl
    #@-node:ekr.20031218072017.1825:findBoundParagraph
    #@+node:ekr.20031218072017.1827:findMatchingBracket
    def findMatchingBracket (self):
        
        c = self ; body = c.frame.body
        
        if g.app.batchMode:
            c.notValidInBatchMode("Match Brackets")
            return
    
        brackets = "()[]{}<>"
        ch1 = body.getCharBeforeInsertPoint()
        ch2 = body.getCharAtInsertPoint()
    
        # Prefer to match the character to the left of the cursor.
        if ch1 in brackets:
            ch = ch1 ; index = body.getBeforeInsertionPoint()
        elif ch2 in brackets:
            ch = ch2 ; index = body.getInsertionPoint()
        else:
            return
        
    
        index2 = self.findSingleMatchingBracket(ch,index)
        if index2:
            if body.compareIndices(index,"<=",index2):
                adj_index = body.adjustIndex(index2,1)
                body.setInsertionPoint( adj_index )
                body.setTextSelection(index,adj_index)
            else:
                adj_index = body.adjustIndex(index,1)
                body.setInsertionPoint( adj_index )
                body.setTextSelection(index2,adj_index)
            adj_index = body.adjustIndex(index2,1)
            #body.setInsertionPoint(adj_index) #CHANGED: moved into if and else, caused items to be unselected
            body.makeIndexVisible(adj_index)
        else:
            g.es("unmatched '%s'",ch)
    #@nonl
    #@+node:ekr.20031218072017.1828:findMatchingBracket
    # To do: replace comments with blanks before scanning.
    # Test  unmatched())
    def findSingleMatchingBracket(self,ch,index):
        
        c = self ; body = c.frame.body
        open_brackets  = "([{<" ; close_brackets = ")]}>"
        brackets = open_brackets + close_brackets
        matching_brackets = close_brackets + open_brackets
        forward = ch in open_brackets
        # Find the character matching the initial bracket.
        for n in xrange(len(brackets)):
            if ch == brackets[n]:
                match_ch = matching_brackets[n]
                break
        level = 0
        while 1:
            if forward and body.compareIndices(index,">=","end"):
                # g.trace("not found")
                return None
            ch2 = body.getCharAtIndex(index)
            if ch2 == ch:
                level += 1 #; g.trace(level,index)
            if ch2 == match_ch:
                level -= 1 #; g.trace(level,index)
                if level <= 0:
                    return index
            if not forward and body.compareIndices(index,"<=","1.0"):
                # g.trace("not found")
                return None
            adj = g.choose(forward,1,-1)
            index = body.adjustIndex(index,adj)
        return 0 # unreachable: keeps pychecker happy.
    # Test  (
    # ([(x){y}]))
    # Test  ((x)(unmatched
    #@nonl
    #@-node:ekr.20031218072017.1828:findMatchingBracket
    #@-node:ekr.20031218072017.1827:findMatchingBracket
    #@+node:ekr.20031218072017.1829:getBodyLines
    def getBodyLines (self,expandSelection=False):
    
        c = self ; body = c.frame.body
        oldVview = body.getYScrollPosition()
        oldSel   = body.getTextSelection()
    
        if expandSelection: # 12/3/03
            lines = body.getAllText()
            head = tail = None
        else:
            # Note: lines is the entire line containing the insert point if no selection.
            head,lines,tail = body.getSelectionLines()
    
        lines = string.split(lines,'\n') # It would be better to use splitLines.
    
        return head,lines,tail,oldSel,oldVview
    #@nonl
    #@-node:ekr.20031218072017.1829:getBodyLines
    #@+node:ekr.20031218072017.1830:indentBody
    def indentBody (self):
    
        c = self ; p = c.currentPosition()
        
        if g.app.batchMode:
            c.notValidInBatchMode("Indent")
            return
    
        d = g.scanDirectives(c,p) # Support @tab_width directive properly.
        tab_width = d.get("tabwidth",c.tab_width)
        head,lines,tail,oldSel,oldYview = self.getBodyLines()
        result = [] ; changed = False
        for line in lines:
            i, width = g.skip_leading_ws_with_indent(line,0,tab_width)
            s = g.computeLeadingWhitespace(width+abs(tab_width),tab_width) + line[i:]
            if s != line: changed = True
            result.append(s)
        if changed:
            result = string.join(result,'\n')
            c.updateBodyPane(head,result,tail,"Indent",oldSel,oldYview)
    #@nonl
    #@-node:ekr.20031218072017.1830:indentBody
    #@+node:ekr.20031218072017.1831:insertBodyTime & allies
    def insertBodyTime (self):
        
        c = self ; v = c.currentVnode()
        
        if g.app.batchMode:
            c.notValidInBatchMode("xxx")
            return
        
        oldSel = c.frame.body.getTextSelection()
        c.frame.body.deleteTextSelection() # Works if nothing is selected.
        s = self.getTime(body=True)
        c.frame.body.insertAtInsertPoint(s)
        c.frame.body.onBodyChanged(v,"Typing",oldSel=oldSel)
    #@nonl
    #@+node:ekr.20031218072017.1832:getTime
    def getTime (self,body=True):
    
        c = self
        default_format =  "%m/%d/%Y %H:%M:%S" # E.g., 1/30/2003 8:31:55
        
        # Try to get the format string from leoConfig.txt.
        if body:
            format = c.config.getString("body_time_format_string")
            gmt    = c.config.getString("body_gmt_time")
        else:
            format = c.config.getString("headline_time_format_string")
            gmt     = c.config.getString("headline_gmt_time")
    
        if format == None:
            format = default_format
    
        try:
            import time
            if gmt:
                s = time.strftime(format,time.gmtime())
            else:
                s = time.strftime(format,time.localtime())
        except (ImportError, NameError):
            g.es("time.strftime not available on this platform",color="blue")
            return ""
        except:
            g.es_exception() # Probably a bad format string in leoConfig.txt.
            s = time.strftime(default_format,time.gmtime())
        return s
    #@-node:ekr.20031218072017.1832:getTime
    #@-node:ekr.20031218072017.1831:insertBodyTime & allies
    #@+node:ekr.20050312114529:insert/removeComments
    #@+node:ekr.20050312114529.1:addComments
    #@-node:ekr.20050312114529.1:addComments
    #@+node:ekr.20050312114529.2:deleteComments
    #@-node:ekr.20050312114529.2:deleteComments
    #@-node:ekr.20050312114529:insert/removeComments
    #@+node:ekr.20031218072017.1833:reformatParagraph
    def reformatParagraph(self):
    
        """Reformat a text paragraph in a Tk.Text widget
    
    Wraps the concatenated text to present page width setting. Leading tabs are
    sized to present tab width setting. First and second line of original text is
    used to determine leading whitespace in reformatted text. Hanging indentation
    is honored.
    
    Paragraph is bound by start of body, end of body, blank lines, and lines
    starting with "@". Paragraph is selected by position of current insertion
    cursor."""
    
        c = self ; body = c.frame.body ; v = c.currentVnode()
        
        if g.app.batchMode:
            c.notValidInBatchMode("xxx")
            return
    
        if body.hasTextSelection():
            g.es("Text selection inhibits Reformat Paragraph",color="blue")
            return
    
        #@    << compute vars for reformatParagraph >>
        #@+node:ekr.20031218072017.1834:<< compute vars for reformatParagraph >>
        theDict = g.scanDirectives(c)
        pageWidth = theDict.get("pagewidth")
        tabWidth  = theDict.get("tabwidth")
        
        original = body.getAllText()
        oldSel   = body.getTextSelection()
        oldYview = body.getYScrollPosition()
        head,lines,tail,trailingNL = c.findBoundParagraph() # DTHEIN 18-JAN-2004: add trailingNL
        #@nonl
        #@-node:ekr.20031218072017.1834:<< compute vars for reformatParagraph >>
        #@nl
        if lines:
            #@        << compute the leading whitespace >>
            #@+node:ekr.20031218072017.1835:<< compute the leading whitespace >>
            indents = [0,0] ; leading_ws = ["",""]
            
            for i in (0,1):
                if i < len(lines):
                    # Use the original, non-optimized leading whitespace.
                    leading_ws[i] = ws = g.get_leading_ws(lines[i])
                    indents[i] = g.computeWidth(ws,tabWidth)
                    
            indents[1] = max(indents)
            if len(lines) == 1:
                leading_ws[1] = leading_ws[0]
            #@-node:ekr.20031218072017.1835:<< compute the leading whitespace >>
            #@nl
            #@        << compute the result of wrapping all lines >>
            #@+node:ekr.20031218072017.1836:<< compute the result of wrapping all lines >>
            # Remember whether the last line ended with a newline.
            lastLine = lines[-1]
            if 0: # DTHEIN 18-JAN-2004: removed because findBoundParagraph now gives trailingNL
                trailingNL = lastLine and lastLine[-1] == '\n'
            
            # Remove any trailing newlines for wraplines.
            lines = [line[:-1] for line in lines[:-1]]
            if lastLine and not trailingNL:
                lastLine = lastLine[:-1]
            lines.extend([lastLine])
            
            # Wrap the lines, decreasing the page width by indent.
            result = g.wrap_lines(lines,
                pageWidth-indents[1],
                pageWidth-indents[0])
            
            # DTHEIN 	18-JAN-2004
            # prefix with the leading whitespace, if any
            paddedResult = []
            paddedResult.append(leading_ws[0] + result[0])
            for line in result[1:]:
                paddedResult.append(leading_ws[1] + line)
            
            # Convert the result to a string.
            result = '\n'.join(paddedResult) # DTHEIN 	18-JAN-2004: use paddedResult
            if 0: # DTHEIN 18-JAN-2004:  No need to do this.
                if trailingNL:
                    result += '\n'
            #@-node:ekr.20031218072017.1836:<< compute the result of wrapping all lines >>
            #@nl
            #@        << update the body, selection & undo state >>
            #@+node:ekr.20031218072017.1837:<< update the body, selection & undo state >>
            sel_start, sel_end = body.setSelectionAreas(head,result,tail)
            
            changed = original != head + result + tail
            undoType = g.choose(changed,"Reformat Paragraph",None)
            body.onBodyChanged(v,undoType,oldSel=oldSel,oldYview=oldYview)
            
            # Advance the selection to the next paragraph.
            newSel = sel_end, sel_end
            body.setTextSelection(newSel)
            body.makeIndexVisible(sel_end)
            
            c.recolor()
            #@nonl
            #@-node:ekr.20031218072017.1837:<< update the body, selection & undo state >>
            #@nl
    #@nonl
    #@-node:ekr.20031218072017.1833:reformatParagraph
    #@+node:ekr.20031218072017.1838:updateBodyPane (handles changeNodeContents)
    def updateBodyPane (self,head,middle,tail,undoType,oldSel,oldYview,setSel=True):
        
        c = self ; body = c.frame.body ; v = c.currentVnode()
    
        # Update the text and notify the event handler.
        body.setSelectionAreas(head,middle,tail)
    
        if setSel:
            body.setTextSelection(oldSel)
    
        body.onBodyChanged(v,undoType,oldSel=oldSel,oldYview=oldYview)
    
        # Update the changed mark and icon.
        c.setChanged(True)
        c.beginUpdate()
        if not v.isDirty():
            v.setDirty()
        c.endUpdate()
    
        # Scroll as necessary.
        if oldYview:
            body.setYScrollPosition(oldYview)
        else:
            body.makeInsertPointVisible()
    
        body.setFocus()
        c.recolor()
    #@nonl
    #@-node:ekr.20031218072017.1838:updateBodyPane (handles changeNodeContents)
    #@-node:ekr.20031218072017.2884:Edit Body submenu
    #@+node:ekr.20031218072017.2885:Edit Headline submenu
    #@+node:ekr.20031218072017.2886:editHeadline
    def editHeadline(self):
        
        c = self ; tree = c.frame.tree
        
        if g.app.batchMode:
            c.notValidInBatchMode("Edit Headline")
            return
    
        tree.editLabel(c.currentPosition())
    #@nonl
    #@-node:ekr.20031218072017.2886:editHeadline
    #@+node:ekr.20031218072017.2290:toggleAngleBrackets
    def toggleAngleBrackets (self):
        
        c = self ; v = c.currentVnode()
        
        if g.app.batchMode:
            c.notValidInBatchMode("Toggle Angle Brackets")
            return
    
        s = v.headString().strip()
        if (s[0:2] == "<<"
            or s[-2:] == ">>"): # Must be on separate line.
            if s[0:2] == "<<": s = s[2:]
            if s[-2:] == ">>": s = s[:-2]
            s = s.strip()
        else:
            s = g.angleBrackets(' ' + s + ' ')
        
        v.setHeadString( s )
        c.frame.tree.editLabel(v)
        #This tries to delete the body text of the editor!
        #if v.edit_text():
        #    v.edit_text().delete("1.0","end")
        #    v.edit_text().insert("1.0",s)
        #    c.frame.tree.onHeadChanged(v)
    #@-node:ekr.20031218072017.2290:toggleAngleBrackets
    #@-node:ekr.20031218072017.2885:Edit Headline submenu
    #@+node:ekr.20031218072017.2887:Find submenu (frame methods)
    #@+node:ekr.20031218072017.2888:showFindPanel
    def showFindPanel(self):
    
        c = self
        
        if not c.frame.findPanel:
            c.frame.findPanel = g.app.gui.createFindPanel(c)
    
        c.frame.findPanel.bringToFront()
    #@nonl
    #@-node:ekr.20031218072017.2888:showFindPanel
    #@+node:ekr.20031218072017.2889:findNext
    def findNext(self):
    
        c = self
        
        if not c.frame.findPanel:
            c.frame.findPanel = g.app.gui.createFindPanel(c)
    
        c.frame.findPanel.findNextCommand(c)
    #@-node:ekr.20031218072017.2889:findNext
    #@+node:ekr.20031218072017.2890:findPrevious
    def findPrevious(self):
    
        c = self
        
        if not c.frame.findPanel:
            c.frame.findPanel = g.app.gui.createFindPanel(c)
    
        c.frame.findPanel.findPreviousCommand(c)
    #@-node:ekr.20031218072017.2890:findPrevious
    #@+node:ekr.20031218072017.2891:replace
    def replace(self):
    
        c = self
        
        if not c.frame.findPanel:
            c.frame.findPanel = g.app.gui.createFindPanel(c)
    
        c.frame.findPanel.changeCommand(c)
    #@-node:ekr.20031218072017.2891:replace
    #@+node:ekr.20031218072017.2892:replaceThenFind
    def replaceThenFind(self):
    
        c = self
        
        if not c.frame.findPanel:
            c.frame.findPanel = g.app.gui.createFindPanel(c)
    
        c.frame.findPanel.changeThenFindCommand(c)
    #@-node:ekr.20031218072017.2892:replaceThenFind
    #@-node:ekr.20031218072017.2887:Find submenu (frame methods)
    #@+node:ekr.20031218072017.2893:notValidInBatchMode
    def notValidInBatchMode(self, commandName):
        
        g.es("%s command is not valid in batch mode" % commandName)
    #@-node:ekr.20031218072017.2893:notValidInBatchMode
    #@-node:ekr.20031218072017.2861:Edit Menu...
    #@+node:ekr.20031218072017.2894:Outline menu...
    #@+node:ekr.20031218072017.2895: Top Level...
    #@+node:ekr.20031218072017.1548:Cut & Paste Outlines
    #@+node:ekr.20031218072017.1549:cutOutline
    def cutOutline(self):
    
        c = self
        if c.canDeleteHeadline():
            c.copyOutline()
            c.deleteOutline("Cut Node")
            c.recolor()
    #@nonl
    #@-node:ekr.20031218072017.1549:cutOutline
    #@+node:ekr.20031218072017.1550:copyOutline
    def copyOutline(self):
    
        # Copying an outline has no undo consequences.
        c = self
        c.endEditing()
        c.fileCommands.assignFileIndices()
        s = c.fileCommands.putLeoOutline()
        g.app.gui.replaceClipboardWith(s, dflavor = "leo/xml" )
    #@nonl
    #@-node:ekr.20031218072017.1550:copyOutline
    #@+node:ekr.20031218072017.1551:pasteOutline
    # To cut and paste between apps, just copy into an empty body first, then copy to Leo's clipboard.
    
    def pasteOutline(self,reassignIndices=True):
    
        c = self ; current = c.currentPosition()
        
        s = g.app.gui.getTextFromClipboard()
        
    
        if not s or not c.canPasteOutline(s):
            return # This should never happen.
    
        isLeo = g.match(s,0,g.app.prolog_prefix_string)
    
        if isLeo:
            p = c.fileCommands.getLeoOutline(s,reassignIndices)
        else:
            p = c.importCommands.convertMoreStringToOutlineAfter(s,current)
            
        if p:
            c.endEditing()
            c.beginUpdate()
            if 1: # inside update...
                c.validateOutline()
                c.selectVnode(p)
                p.setDirty()
                c.setChanged(True)
                # paste as first child if back is expanded.
                back = p.back()
                if back and back.isExpanded():
                    p.moveToNthChildOf(back,0)
                c.undoer.setUndoParams("Paste Node",p)
            c.endUpdate()
            if back and back.isExpanded():
                back.v.notifyObservers( leoNodes.InsertChild( back.copy(), p.copy() ) )
            elif back:
                back.v.notifyObservers( leoNodes.InsertAfter( back.copy(), p.copy() ) )
                #back.v.n
                #parent = p.getParent()
                #parent.v.notifyObservers( leoNodes.InsertChild( parent.copy(), p.copy() ) )
            c.recolor()
    #@nonl
    #@-node:ekr.20031218072017.1551:pasteOutline
    #@+node:EKR.20040610130943:pasteOutlineRetainingClones
    def pasteOutlineRetainingClones (self):
        
        c = self
        
        return c.pasteOutline(reassignIndices=False)
    #@nonl
    #@-node:EKR.20040610130943:pasteOutlineRetainingClones
    #@-node:ekr.20031218072017.1548:Cut & Paste Outlines
    #@+node:ekr.20031218072017.2028:Hoist & dehoist & enablers
    def dehoist(self):
    
        c = self ; p = c.currentPosition()
        #hs = c.chapters.current_chapter.hoistStack
        if p and c.canDehoist():
            c.undoer.setUndoParams("De-Hoist",p)
            bunch = c.hoistStack.pop()
            #bunch = hs.pop()
            if bunch.expanded: p.expand()
            else:              p.contract()
            c.redraw()
            c.frame.clearStatusLine()
            c.beginUpdate()
            c.endUpdate()
            g.doHook( "dehoist-executed", c = self )
            if c.hoistStack:
                #if hs:
                #bunch = hs[ -1 ]
                bunch = c.hoistStack[-1]
                c.frame.putStatusLine("Hoist: " + bunch.p.headString())
            else:
                c.frame.putStatusLine("No hoist")
    
    def hoist(self):
    
        c = self ; p = c.currentPosition()
        #hs = c.chapters.current_chapter.hoistStack
        
        if p and c.canHoist():
            c.undoer.setUndoParams("Hoist",p)
            # New in 4.2: remember expansion state.
            bunch = g.Bunch(p=p.copy(),expanded=p.isExpanded())
            print bunch
            c.hoistStack.append(bunch)
            #hs.append( bunch )
            p.expand()
            c.beginUpdate()
            c.endUpdate()
            c.redraw()
            c.frame.clearStatusLine()
            c.frame.putStatusLine("Hoist: " + p.headString())
            g.doHook( "hoist-executed", c = self )
            
    #@-node:ekr.20031218072017.2028:Hoist & dehoist & enablers
    #@+node:ekr.20031218072017.1759:Insert, Delete & Clone (Commands)
    #@+node:ekr.20031218072017.1760:c.checkMoveWithParentWithWarning
    def checkMoveWithParentWithWarning (self,root,parent,warningFlag):
        
        """Return False if root or any of root's descedents is a clone of
        parent or any of parents ancestors."""
    
        message = "Illegal move or drag: no clone may contain a clone of itself"
    
        # g.trace("root",root,"parent",parent)
        clonedTnodes = {}
        for ancestor in parent.self_and_parents_iter():
            if ancestor.isCloned():
                t = ancestor.v.t
                clonedTnodes[t] = t
        
        if not clonedTnodes:
            return True
    
        for p in root.self_and_subtree_iter():
            if p.isCloned() and clonedTnodes.get(p.v.t):
                if warningFlag:
                    g.alert(message)
                return False
        return True
    #@nonl
    #@-node:ekr.20031218072017.1760:c.checkMoveWithParentWithWarning
    #@+node:ekr.20031218072017.1193:c.deleteOutline
    def deleteOutline (self,op_name="Delete Node"):
        
        """Deletes the current position.
        
        Does nothing if the outline would become empty."""
    
        c = self ; p = c.currentPosition()
        if not p: return
        # If vBack is NULL we are at the top level,
        # the next node should be v.next(), _not_ v.visNext();
        if p.hasVisBack(): newNode = p.visBack()
        else:              newNode = p.next()
        if not newNode: return
    
        c.endEditing() # Make sure we capture the headline for Undo.
        c.beginUpdate()
        if 1: # update...
            p.setAllAncestorAtFileNodesDirty()
            c.undoer.setUndoParams(op_name,p,select=newNode)
            p.doDelete(newNode)
            c.setChanged(True)
        c.endUpdate()
        c.validateOutline()
    #@nonl
    #@-node:ekr.20031218072017.1193:c.deleteOutline
    #@+node:ekr.20031218072017.1761:c.insertHeadline
    # Inserts a vnode after the current vnode.  All details are handled by the vnode class.
    
    def insertHeadline (self,op_name="Insert Node"):
    
        
        c = self ; p = c.currentPosition()
        hasChildren = p.hasChildren()
        isExpanded  = p.isExpanded()
        if not p: return
    
        c.beginUpdate()
        if 1: # inside update...
            if (
                # 1/31/04: Make sure new node is visible when hoisting.
                (hasChildren and isExpanded) or
                (c.hoistStack and p == c.hoistStack[-1].p)
            ):
                p = p.insertAsNthChild(0)
            else:
                p = p.insertAfter()
            c.undoer.setUndoParams(op_name,p,select=p)
            c.selectVnode(p)
            c.editPosition(p)
            p.setAllAncestorAtFileNodesDirty()
            c.setChanged(True)
    
    
        c.endUpdate()
    #@-node:ekr.20031218072017.1761:c.insertHeadline
    #@+node:ekr.20031218072017.1762:c.clone
    def clone (self):
    
        c = self
        p = c.currentPosition()
        if not p: return
        
        c.beginUpdate()
        if 1: # update...
            clone = p.clone(p)
            clone.setAllAncestorAtFileNodesDirty()
            c.setChanged(True)
            if c.validateOutline():
                c.selectVnode(clone)
                c.undoer.setUndoParams("Clone Node",clone)
        c.endUpdate() # updates all icons
    #@nonl
    #@-node:ekr.20031218072017.1762:c.clone
    #@+node:ekr.20031218072017.1765:c.validateOutline
    # Makes sure all nodes are valid.
    
    def validateOutline (self):
    
        c = self
        
        if not g.app.debug:
            return True
    
        root = c.rootPosition()
        parent = c.nullPosition()
    
        if root:
            return root.validateOutlineWithParent(parent)
        else:
            return True
    #@nonl
    #@-node:ekr.20031218072017.1765:c.validateOutline
    #@-node:ekr.20031218072017.1759:Insert, Delete & Clone (Commands)
    #@+node:ekr.20031218072017.1188:c.sortChildren, sortSiblings
    def sortChildren(self):
    
        c = self ; v = c.currentVnode()
        if not v or not v.hasChildren(): return
        #@    << Set the undo info for sortChildren >>
        #@+node:ekr.20031218072017.1189:<< Set the undo info for sortChildren >>
        # Get the present list of children.
        children = []
        child = v.firstChild()
        while child:
            children.append(child)
            child = child.next()
        c.undoer.setUndoParams("Sort Children",v,sort=children)
        #@nonl
        #@-node:ekr.20031218072017.1189:<< Set the undo info for sortChildren >>
        #@nl
        c.beginUpdate()
        c.endEditing()
        v.sortChildren()
        # v.setDirty()
        v.setAllAncestorAtFileNodesDirty() # 1/12/04
        c.setChanged(True)
        c.endUpdate()
        
    def sortSiblings (self):
        
        c = self ; v = c.currentVnode()
        if not v: return
        parent = v.parent()
        if not parent:
            c.sortTopLevel()
        else:
            #@        << Set the undo info for sortSiblings >>
            #@+node:ekr.20031218072017.1190:<< Set the undo info for sortSiblings >>
            # Get the present list of siblings.
            sibs = []
            sib = parent.firstChild()
            while sib:
                sibs.append(sib)
                sib = sib.next()
            c.undoer.setUndoParams("Sort Siblings",v,sort=sibs)
            #@nonl
            #@-node:ekr.20031218072017.1190:<< Set the undo info for sortSiblings >>
            #@nl
            c.beginUpdate()
            c.endEditing()
            parent.sortChildren()
            # parent.setDirty()
            parent.setAllAncestorAtFileNodesDirty() # 1/12/04
            c.setChanged(True)
            c.endUpdate()
    #@nonl
    #@-node:ekr.20031218072017.1188:c.sortChildren, sortSiblings
    #@+node:ekr.20031218072017.2896:c.sortTopLevel
    def sortTopLevel (self):
        
        # Create a list of position, headline tuples
        c = self ; root = c.rootPosition()
        if not root: return
        #@    << Set the undo info for sortTopLevel >>
        #@+node:ekr.20031218072017.2897:<< Set the undo info for sortTopLevel >>
        # Get the present list of children.
        sibs = []
        
        for sib in root.self_and_siblings_iter(copy=True):
            sibs.append(sib)
            
        c.undoer.setUndoParams("Sort Top Level",root,sort=sibs)
        #@nonl
        #@-node:ekr.20031218072017.2897:<< Set the undo info for sortTopLevel >>
        #@nl
        pairs = []
        
        for p in root.self_and_siblings_iter(copy=True):
            #pairs.append((p.headString().lower(),p),)
            #pairs.append( p.headString().lower() )
            # pdict[ p.headString().lower() ] = p
            pairs.append( p )
        # Sort the list on the headlines.
        def sort_positions( a, b ):
            ahs = a.headString().lower()
            bhs = b.headString().lower()
            if ahs > bhs: return 1
            elif ahs == bhs: return 0
            else: return -1
            
        pairs.sort( sort_positions )
        
        sortedNodes = [ ( x.headString().lower(), x ) for x in pairs ]
        # Move the nodes
        c.beginUpdate()
        h,p = sortedNodes[0]
        #if p != root:
        
        if not p == root:
            p.setAllAncestorAtFileNodesDirty()
            p.moveToRoot(oldRoot=root)
            p.setAllAncestorAtFileNodesDirty()
        for h,next in sortedNodes[1:]:
            next.moveAfter(p)
            p = next
        if 0:
            g.trace("-----moving done")
            for p in c.rootPosition().self_and_siblings_iter():
                print p,p.v
        c.endUpdate()
    #@-node:ekr.20031218072017.2896:c.sortTopLevel
    #@-node:ekr.20031218072017.2895: Top Level...
    #@+node:ekr.20040711135959.2:Check Outline submenu...
    #@+node:ekr.20031218072017.2072:c.checkOutline
    def checkOutline (self,verbose=True,unittest=False,full=True):
        
        """Report any possible clone errors in the outline.
        
        Remove any unused tnodeLists."""
        
        c = self ; count = 1 ; errors = 0
        isTkinter = g.app.gui and g.app.gui.guiName() == "tkinter"
    
        if full and not unittest:
            g.es("all tests enabled: this may take awhile",color="blue")
    
        p = c.rootPosition()
        #@    << assert equivalence of lastVisible methods >>
        #@+node:ekr.20040314062338:<< assert equivalence of lastVisible methods >>
        if 0:
            g.app.debug = True
        
            p1 = p.oldLastVisible()
            p2 = p.lastVisible()
            
            if p1 != p2:
                print "oldLastVisible",p1
                print "   lastVisible",p2
            
            assert p1 and p2 and p1 == p2, "oldLastVisible==lastVisible"
            assert p1.isVisible() and p2.isVisible(), "p1.isVisible() and p2.isVisible()"
            
            g.app.debug = False
        #@nonl
        #@-node:ekr.20040314062338:<< assert equivalence of lastVisible methods >>
        #@nl
        for p in c.allNodes_iter():
            try:
                count += 1
                #@            << remove unused tnodeList >>
                #@+node:ekr.20040313150633:<< remove unused tnodeList >>
                # Empty tnodeLists are not errors.
                v = p.v
                
                # New in 4.2: tnode list is in tnode.
                if hasattr(v.t,"tnodeList") and len(v.t.tnodeList) > 0 and not v.isAnyAtFileNode():
                    if 0:
                        s = "deleting tnodeList for " + repr(v)
                        print ; print s ; g.es(s,color="blue")
                    delattr(v.t,"tnodeList")
                #@nonl
                #@-node:ekr.20040313150633:<< remove unused tnodeList >>
                #@nl
                if full: # Unit tests usually set this false.
                    #@                << do full tests >>
                    #@+node:ekr.20040323155951:<< do full tests >>
                    if not unittest:
                        if count % 100 == 0:
                            g.es('.',newline=False)
                        if count % 2000 == 0:
                            g.enl()
                    
                    #@+others
                    #@+node:ekr.20040314035615:assert consistency of threadNext & threadBack links
                    threadBack = p.threadBack()
                    threadNext = p.threadNext()
                    
                    if threadBack:
                        assert p == threadBack.threadNext(), "p==threadBack.threadNext"
                    
                    if threadNext:
                        assert p == threadNext.threadBack(), "p==threadNext.threadBack"
                    #@nonl
                    #@-node:ekr.20040314035615:assert consistency of threadNext & threadBack links
                    #@+node:ekr.20040314035615.1:assert consistency of next and back links
                    back = p.back()
                    next = p.next()
                    
                    if back:
                        assert p == back.next(), "p==back.next"
                            
                    if next:
                        assert p == next.back(), "p==next.back"
                    #@nonl
                    #@-node:ekr.20040314035615.1:assert consistency of next and back links
                    #@+node:ekr.20040314035615.2:assert consistency of parent and child links
                    if p.hasParent():
                        n = p.childIndex()
                        assert p == p.parent().moveToNthChild(n), "p==parent.moveToNthChild"
                        
                    for child in p.children_iter():
                        assert p == child.parent(), "p==child.parent"
                    
                    if p.hasNext():
                        assert p.next().parent() == p.parent(), "next.parent==parent"
                        
                    if p.hasBack():
                        assert p.back().parent() == p.parent(), "back.parent==parent"
                    #@nonl
                    #@-node:ekr.20040314035615.2:assert consistency of parent and child links
                    #@+node:ekr.20040323155951.1:assert consistency of directParents and parent
                    if p.hasParent():
                        t = p.parent().v.t
                        for v in p.directParents():
                            try:
                                assert v.t == t
                            except:
                                print "p",p
                                print "p.directParents",p.directParents()
                                print "v",v
                                print "v.t",v.t
                                print "t = p.parent().v.t",t
                                raise AssertionError,"v.t == t"
                    #@-node:ekr.20040323155951.1:assert consistency of directParents and parent
                    #@+node:ekr.20040323161837:assert consistency of p.v.t.vnodeList, & v.parents for cloned nodes
                    if p.isCloned():
                        parents = p.v.t.vnodeList
                        for child in p.children_iter():
                            vparents = child.directParents()
                            assert len(parents) == len(vparents), "len(parents) == len(vparents)"
                            for parent in parents:
                                assert parent in vparents, "parent in vparents"
                            for parent in vparents:
                                assert parent in parents, "parent in parents"
                    #@nonl
                    #@-node:ekr.20040323161837:assert consistency of p.v.t.vnodeList, & v.parents for cloned nodes
                    #@+node:ekr.20040323162707:assert that clones actually share subtrees
                    if p.isCloned() and p.hasChildren():
                        childv = p.firstChild().v
                        assert childv == p.v.t._firstChild, "childv == p.v.t._firstChild"
                        assert id(childv) == id(p.v.t._firstChild), "id(childv) == id(p.v.t._firstChild)"
                        for v in p.v.t.vnodeList:
                            assert v.t._firstChild == childv, "v.t._firstChild == childv"
                            assert id(v.t._firstChild) == id(childv), "id(v.t._firstChild) == id(childv)"
                    #@nonl
                    #@-node:ekr.20040323162707:assert that clones actually share subtrees
                    #@+node:ekr.20040314043623:assert consistency of vnodeList
                    vnodeList = p.v.t.vnodeList
                        
                    for v in vnodeList:
                        
                        try:
                            assert v.t == p.v.t
                        except AssertionError:
                            print "p",p
                            print "v",v
                            print "p.v",p.v
                            print "v.t",v.t
                            print "p.v.t",p.v.t
                            raise AssertionError, "v.t == p.v.t"
                    
                        if p.v.isCloned():
                            assert v.isCloned(), "v.isCloned"
                            assert len(vnodeList) > 1, "len(vnodeList) > 1"
                        else:
                            assert not v.isCloned(), "not v.isCloned"
                            assert len(vnodeList) == 1, "len(vnodeList) == 1"
                    #@nonl
                    #@-node:ekr.20040314043623:assert consistency of vnodeList
                    #@+node:ekr.20040731053740:assert that p.headString() matches p.edit_text.get
                    # Not a great test: it only tests visible nodes.
                    # This test may fail if a joined node is being editred.
                    
                    if isTkinter:
                        t = p.edit_text()
                        if t:
                            s = t.get("1.0","end")
                            assert p.headString().strip() == s.strip(), "May fail if joined node is being edited"
                    #@nonl
                    #@-node:ekr.20040731053740:assert that p.headString() matches p.edit_text.get
                    #@-others
                    #@nonl
                    #@-node:ekr.20040323155951:<< do full tests >>
                    #@nl
            except AssertionError,message:
                errors += 1
                #@            << give test failed message >>
                #@+node:ekr.20040314044652:<< give test failed message >>
                s = "test failed: %s %s" % (message,repr(p))
                print s ; print
                g.es(s,color="red")
                #@nonl
                #@-node:ekr.20040314044652:<< give test failed message >>
                #@nl
        if verbose or not unittest:
            #@        << print summary message >>
            #@+node:ekr.20040314043900:<<print summary message >>
            if full:
                print
                g.enl()
            
            s = "%d nodes checked, %d errors" % (count,errors)
            if errors or verbose:
                print s ; g.es(s,color="red")
            elif verbose:
                g.es(s,color="green")
            #@nonl
            #@-node:ekr.20040314043900:<<print summary message >>
            #@nl
        return errors
    #@nonl
    #@-node:ekr.20031218072017.2072:c.checkOutline
    #@+node:ekr.20040723094220:Check Outline commands & allies
    #@+node:ekr.20040723094220.1:checkAllPythonCode
    def checkAllPythonCode(self,unittest=False,ignoreAtIgnore=True):
        
        c = self ; count = 0 ; result = "ok"
    
        for p in c.all_positions_iter():
            
            count += 1
            if not unittest:
                #@            << print dots >>
                #@+node:ekr.20040723094220.2:<< print dots >>
                if count % 100 == 0:
                    g.es('.',newline=False)
                
                if count % 2000 == 0:
                    g.enl()
                #@nonl
                #@-node:ekr.20040723094220.2:<< print dots >>
                #@nl
    
            if g.scanForAtLanguage(c,p) == "python":
                if not g.scanForAtSettings(p) and (not ignoreAtIgnore or not g.scanForAtIgnore(c,p)):
                    try:
                        c.checkPythonNode(p,unittest)
                    except (SyntaxError,tokenize.TokenError,tabnanny.NannyNag):
                        result = "error" # Continue to check.
                    except:
                        import traceback ; traceback.print_exc()
                        return "surprise" # abort
                    if unittest and result != "ok":
                        print "Syntax error in %s" % p.headString()
                        return result # End the unit test: it has failed.
                
        if not unittest:
            g.es("Check complete",color="blue")
            
        return result
    #@nonl
    #@-node:ekr.20040723094220.1:checkAllPythonCode
    #@+node:ekr.20040723094220.3:checkPythonCode
    def checkPythonCode (self,unittest=False,ignoreAtIgnore=True,suppressErrors=False):
        
        c = self ; count = 0 ; result = "ok"
        
        if not unittest:
            g.es("checking Python code   ")
        
        for p in c.currentPosition().self_and_subtree_iter():
            
            count += 1
            if not unittest:
                #@            << print dots >>
                #@+node:ekr.20040723094220.4:<< print dots >>
                if count % 100 == 0:
                    g.es('.',newline=False)
                
                if count % 2000 == 0:
                    g.enl()
                #@nonl
                #@-node:ekr.20040723094220.4:<< print dots >>
                #@nl
    
            if g.scanForAtLanguage(c,p) == "python":
                if not ignoreAtIgnore or not g.scanForAtIgnore(c,p):
                    try:
                        c.checkPythonNode(p,unittest,suppressErrors)
                    except (parser.ParserError,SyntaxError,tokenize.TokenError,tabnanny.NannyNag):
                        result = "error" # Continue to check.
                    except:
                        g.es("surprise in checkPythonNode")
                        g.es_exception()
                        return "surprise" # abort
    
        if not unittest:
            g.es("Check complete",color="blue")
            
        # We _can_ return a result for unit tests because we aren't using doCommand.
        return result
    #@nonl
    #@-node:ekr.20040723094220.3:checkPythonCode
    #@+node:ekr.20040723094220.5:checkPythonNode
    def checkPythonNode (self,p,unittest=False,suppressErrors=False):
    
        c = self
        
        h = p.headString()
        # We must call getScript so that we can ignore directives and section references.
        body = g.getScript(c,p.copy())
        if not body: return
    
        try:
            compiler.parse(body + '\n')
        except (parser.ParserError,SyntaxError):
            if not suppressErrors:
                s = "Syntax error in: %s" % h
                print s ; g.es(s,color="blue")
            if unittest: raise
            else:
                g.es_exception(full=False,color="black")
                p.setMarked()
    
        c.tabNannyNode(p,h,body,unittest,suppressErrors)
    #@nonl
    #@-node:ekr.20040723094220.5:checkPythonNode
    #@+node:ekr.20040723094220.6:tabNannyNode
    # This code is based on tabnanny.check.
    
    def tabNannyNode (self,p,headline,body,unittest=False,suppressErrors=False):
    
        """Check indentation using tabnanny."""
    
        try:
            # readline = g.readLinesGenerator(body).next
            readline = g.readLinesClass(body).next
            tabnanny.process_tokens(tokenize.generate_tokens(readline))
            return
            
        except parser.ParserError, msg:
            if not suppressErrors:
                g.es("ParserError in %s" % headline,color="blue")
                g.es(str(msg))
            
        except tokenize.TokenError, msg:
            if not suppressErrors:
                g.es("TokenError in %s" % headline,color="blue")
                g.es(str(msg))
    
        except tabnanny.NannyNag, nag:
            if not suppressErrors:
                badline = nag.get_lineno()
                line    = nag.get_line()
                message = nag.get_msg()
                g.es("Indentation error in %s, line %d" % (headline, badline),color="blue")
                g.es(message)
                g.es("offending line:\n%s" % repr(str(line))[1:-1])
            
        except:
            g.trace("unexpected exception")
            g.es_exception()
    
        if unittest: raise
        else: p.setMarked()
    #@nonl
    #@-node:ekr.20040723094220.6:tabNannyNode
    #@-node:ekr.20040723094220:Check Outline commands & allies
    #@+node:ekr.20040412060927:c.dumpOutline
    def dumpOutline (self):
        
        """ Dump all nodes in the outline."""
        
        c = self
    
        for p in c.allNodes_iter():
            p.dump()
    #@nonl
    #@-node:ekr.20040412060927:c.dumpOutline
    #@+node:ekr.20040711135959.1:Pretty Print commands
    #@+node:ekr.20040712053025:prettyPrintAllPythonCode
    def prettyPrintAllPythonCode (self,dump=False):
    
        c = self ; pp = c.prettyPrinter(c)
    
        for p in c.all_positions_iter():
            
            # Unlike scanDirectives, scanForAtLanguage ignores @comment.
            if g.scanForAtLanguage(c,p) == "python":
    
                pp.prettyPrintNode(p,dump=dump)
                
        pp.endUndo()
    #@nonl
    #@-node:ekr.20040712053025:prettyPrintAllPythonCode
    #@+node:ekr.20040712053025.1:prettyPrintPythonCode
    def prettyPrintPythonCode (self,p=None,dump=False):
    
        c = self
        
        if p: root = p.copy()
        else: root = c.currentPosition();
        
        pp = c.prettyPrinter(c)
        
        for p in root.self_and_subtree_iter():
            
            # Unlike scanDirectives, scanForAtLanguage ignores @comment.
            if g.scanForAtLanguage(c,p) == "python":
        
                pp.prettyPrintNode(p,dump=dump)
              
        pp.endUndo()
    #@nonl
    #@-node:ekr.20040712053025.1:prettyPrintPythonCode
    #@+node:ekr.20040711135244.5:class prettyPrinter
    class prettyPrinter:
        
        #@    @+others
        #@+node:ekr.20040711135244.6:__init__
        def __init__ (self,c):
            
            self.array = [] # List of strings comprising the line being accumulated.
            self.bracketLevel = 0
            self.c = c
            self.changed = False
            self.dumping = False
            self.erow = self.ecol = 0 # The ending row/col of the token.
            self.line = 0 # Same as self.srow
            self.lines = [] # List of lines.
            self.name = None
            self.p = c.currentPosition()
            self.parenLevel = 0
            self.prevName = None
            self.s = None # The string containing the line.
            self.srow = self.scol = 0 # The starting row/col of the token.
            self.startline = True # True: the token starts a line.
            self.tracing = False
        
            #@    << define dispatch dict >>
            #@+node:ekr.20041021100850:<< define dispatch dict >>
            self.dispatchDict = {
                
                "comment":    self.doMultiLine,
                "dedent":     self.doDedent,
                "endmarker":  self.doEndMarker,
                "errortoken": self.doErrorToken,
                "indent":     self.doIndent,
                "name":       self.doName,
                "newline":    self.doNewline,
                "nl" :        self.doNewline,
                "number":     self.doNumber,
                "op":         self.doOp,
                "string":     self.doMultiLine,
            }
            #@nonl
            #@-node:ekr.20041021100850:<< define dispatch dict >>
            #@nl
        #@nonl
        #@-node:ekr.20040711135244.6:__init__
        #@+node:ekr.20040713093048:clear
        def clear (self):
            self.lines = []
        #@nonl
        #@-node:ekr.20040713093048:clear
        #@+node:ekr.20040713064323:dumpLines
        def dumpLines (self,p,lines):
        
            encoding = g.app.tkEncoding
            
            print ; print '-'*10, p.headString()
            
            if 0:
                for line in lines:
                    line2 = g.toEncodedString(line,encoding,reportErrors=True)
                    print line2, # Don't add a trailing newline!
            else:
                for i in xrange(len(lines)):
                    line = lines[i]
                    line = g.toEncodedString(line,encoding,reportErrors=True)
                    print "%3d" % i, repr(lines[i])
        #@nonl
        #@-node:ekr.20040713064323:dumpLines
        #@+node:ekr.20040711135244.7:dumpToken
        def dumpToken (self,token5tuple):
        
            t1,t2,t3,t4,t5 = token5tuple
            srow,scol = t3 ; erow,ecol = t4
            line = str(t5) # can fail
            name = token.tok_name[t1].lower()
            val = str(t2) # can fail
        
            startLine = self.line != srow
            if startLine:
                print "----- line",srow,repr(line)
            self.line = srow
        
            print "%10s (%2d,%2d) %-8s" % (name,scol,ecol,repr(val))
        #@nonl
        #@-node:ekr.20040711135244.7:dumpToken
        #@+node:ekr.20040713091855:endUndo
        def endUndo (self):
            
            c = self.c
            
            if self.changed:
        
                # Tag the end of the command.
                c.undoer.setUndoParams("Pretty Print",self.p)
        #@nonl
        #@-node:ekr.20040713091855:endUndo
        #@+node:ekr.20040711135244.8:get
        def get (self):
            
            return self.lines
        #@nonl
        #@-node:ekr.20040711135244.8:get
        #@+node:ekr.20040711135244.4:prettyPrintNode
        def prettyPrintNode(self,p,dump):
        
            c = self.c
            h = p.headString()
            s = p.bodyString()
            if not s: return
            
            readlines = g.readLinesGenerator(s).next
        
            try:
                self.clear()
                for token5tuple in tokenize.generate_tokens(readlines):
                    self.putToken(token5tuple)
                lines = self.get()
        
            except tokenize.TokenError:
                g.es("Error pretty-printing %s.  Not changed." % h, color="blue")
                return
        
            if dump:
                self.dumpLines(p,lines)
            else:
                self.replaceBody(p,lines)
        #@nonl
        #@-node:ekr.20040711135244.4:prettyPrintNode
        #@+node:ekr.20040711135244.9:put
        def put (self,s,strip=True):
            
            """Put s to self.array, and strip trailing whitespace if strip is True."""
            
            if self.array and strip:
                prev = self.array[-1]
                if len(self.array) == 1:
                    if prev.rstrip():
                        # Stripping trailing whitespace doesn't strip leading whitespace.
                        self.array[-1] = prev.rstrip()
                else:
                    # The previous entry isn't leading whitespace, so we can strip whitespace.
                    self.array[-1] = prev.rstrip()
        
            self.array.append(s)
        #@nonl
        #@-node:ekr.20040711135244.9:put
        #@+node:ekr.20041021104237:putArray
        def putArray (self):
            
            """Add the next line by joining all the strings is self.array"""
            
            self.lines.append(''.join(self.array))
            self.array = []
        #@nonl
        #@-node:ekr.20041021104237:putArray
        #@+node:ekr.20040711135244.10:putNormalToken & allies
        def putNormalToken (self,token5tuple):
        
            t1,t2,t3,t4,t5 = token5tuple
            self.name = token.tok_name[t1].lower() # The token type
            self.val = t2  # the token string
            self.srow,self.scol = t3 # row & col where the token begins in the source.
            self.erow,self.ecol = t4 # row & col where the token ends in the source.
            self.s = t5 # The line containing the token.
            self.startLine = self.line != self.srow
            self.line = self.srow
        
            if self.startLine:
                self.doStartLine()
        
            f = self.dispatchDict.get(self.name,self.oops)
            self.trace()
            f()
        #@nonl
        #@+node:ekr.20041021102938:doEndMarker
        def doEndMarker (self):
            
            self.putArray()
        #@nonl
        #@-node:ekr.20041021102938:doEndMarker
        #@+node:ekr.20041021102340.1:doErrorToken
        def doErrorToken (self):
            
            self.array.append(self.val)
        
            # This code is executed for versions of Python earlier than 2.4
            if self.val == '@':
                # Preserve whitespace after @.
                i = g.skip_ws(self.s,self.scol+1)
                ws = self.s[self.scol+1:i]
                if ws:
                    self.array.append(ws)
        #@nonl
        #@-node:ekr.20041021102340.1:doErrorToken
        #@+node:ekr.20041021102340.2:doIndent & doDedent
        def doDedent (self):
            
            pass
            
        def doIndent (self):
            
            self.array.append(self.val)
        #@-node:ekr.20041021102340.2:doIndent & doDedent
        #@+node:ekr.20041021102340:doMultiLine
        def doMultiLine (self):
            
            # These may span lines, so duplicate the end-of-line logic.
            lines = g.splitLines(self.val)
            for line in lines:
                self.array.append(line)
                if line and line[-1] == '\n':
                    self.putArray()
                    
            # Suppress start-of-line logic.
            self.line = self.erow
        #@nonl
        #@-node:ekr.20041021102340:doMultiLine
        #@+node:ekr.20041021101911.5:doName
        def doName(self):
        
            self.array.append("%s " % self.val)
            if self.prevName == "def": # A personal idiosyncracy.
                self.array.append(' ') # Retain the blank before '('.
            self.prevName = self.val
        #@-node:ekr.20041021101911.5:doName
        #@+node:ekr.20041021101911.3:doNewline
        def doNewline (self):
            
            self.array.append('\n')
            self.putArray()
        #@nonl
        #@-node:ekr.20041021101911.3:doNewline
        #@+node:ekr.20041021101911.6:doNumber
        def doNumber (self):
        
            self.array.append(self.val)
        #@-node:ekr.20041021101911.6:doNumber
        #@+node:ekr.20040711135244.11:doOp
        def doOp (self):
            
            val = self.val
            
            # New in Python 2.4: '@' is an operator, not an error token.
            if self.val == '@':
                self.array.append(self.val)
                # Preserve whitespace after @.
                i = g.skip_ws(self.s,self.scol+1)
                ws = self.s[self.scol+1:i]
                if ws: self.array.append(ws)
            elif val == '(':
                self.parenLevel += 1
                self.put(val)
            elif val == ')':
                self.parenLevel -= 1
                self.put(val)
            elif val == '=':
                if self.parenLevel > 0: self.put('=')
                else:                   self.put(' = ')
            elif val == ',':
                if self.parenLevel > 0: self.put(',')
                else:                   self.put(', ')
            elif val == ';':
                self.put(" ; ")
            else:
                self.put(val)
        #@nonl
        #@-node:ekr.20040711135244.11:doOp
        #@+node:ekr.20041021112219:doStartLine
        def doStartLine (self):
            
            before = self.s[0:self.scol]
            i = g.skip_ws(before,0)
            self.ws = self.s[0:i]
             
            if self.ws:
                self.array.append(self.ws)
        #@nonl
        #@-node:ekr.20041021112219:doStartLine
        #@+node:ekr.20041021101911.1:oops
        def oops(self):
            
            print "unknown PrettyPrinting code: %s" % (self.name)
        #@nonl
        #@-node:ekr.20041021101911.1:oops
        #@+node:ekr.20041021101911.2:trace
        def trace(self):
            
            if self.tracing:
        
                g.trace("%10s: %s" % (
                    self.name,
                    repr(g.toEncodedString(self.val,"utf-8"))
                ))
        #@nonl
        #@-node:ekr.20041021101911.2:trace
        #@-node:ekr.20040711135244.10:putNormalToken & allies
        #@+node:ekr.20040711135244.12:putToken
        def putToken (self,token5tuple):
            
            if self.dumping:
                self.dumpToken(token5tuple)
            else:
                self.putNormalToken(token5tuple)
        #@nonl
        #@-node:ekr.20040711135244.12:putToken
        #@+node:ekr.20040713070356:replaceBody
        def replaceBody (self,p,lines):
            
            c = self.c
            
            sel = c.frame.body.getInsertionPoint()
            oldBody = p.bodyString()
            body = string.join(lines,'')
            
            p.setBodyStringOrPane(body)
            
            if not self.changed:
        
                # Tag the start of the command.
                c.undoer.setUndoParams("Pretty Print",self.p) 
                self.changed = True
            
            self.c.undoer.setUndoParams("Change",p,
                oldText=oldBody,newText=body,oldSel=sel, newSel=sel)
        #@nonl
        #@-node:ekr.20040713070356:replaceBody
        #@-others
    #@nonl
    #@-node:ekr.20040711135244.5:class prettyPrinter
    #@-node:ekr.20040711135959.1:Pretty Print commands
    #@-node:ekr.20040711135959.2:Check Outline submenu...
    #@+node:ekr.20031218072017.2898:Expand & Contract...
    #@+node:ekr.20031218072017.2899:Commands
    #Changes:
    #Added code so the expansions would be tracked by JLEO--- minor, but wide changes in this node
    #@+node:ekr.20031218072017.2900:contractAllHeadlines
    def contractAllHeadlines (self):
    
        c = self
        
        c.beginUpdate()
        if 1: # update...
            for p in c.allNodes_iter():
                p.contract()
            # Select the topmost ancestor of the presently selected node.
            p = c.currentPosition()
            while p and p.hasParent():
                p.moveToParent()
            c.selectVnode(p)
        c.endUpdate()
    
        c.expansionLevel = 1 # Reset expansion level.
    #@nonl
    #@-node:ekr.20031218072017.2900:contractAllHeadlines
    #@+node:ekr.20031218072017.2901:contractNode
    def contractNode (self):
        
        c = self ; v = c.currentVnode()
        
        c.beginUpdate()
        v.contract()
        c.endUpdate()
    #@-node:ekr.20031218072017.2901:contractNode
    #@+node:ekr.20040930064232:contractNodeOrGoToParent
    def contractNodeOrGoToParent(self):
        
        """Simulate the left Arrow Key in folder of Windows Explorer."""
    
        c = self ; v = c.currentVnode()
     
        if v.hasChildren() and v.isExpanded():
            c.contractNode()
        elif v.hasParent():
            c.goToParent()
    #@nonl
    #@-node:ekr.20040930064232:contractNodeOrGoToParent
    #@+node:ekr.20031218072017.2902:contractParent
    def contractParent (self):
        
        c = self ; v = c.currentVnode()
        parent = v.parent()
        if not parent: return
        
        c.beginUpdate()
        c.selectVnode(parent)
        parent.contract()
        c.endUpdate()
    #@nonl
    #@-node:ekr.20031218072017.2902:contractParent
    #@+node:ekr.20031218072017.2903:expandAllHeadlines
    def expandAllHeadlines(self):
    
        c = self ; v = root = c.rootVnode()
        c.beginUpdate()
        while v:
            c.expandSubtree(v)
            v = v.next()
        c.selectVnode(root)
        c.endUpdate()
        c.expansionLevel = 0 # Reset expansion level.
    #@nonl
    #@-node:ekr.20031218072017.2903:expandAllHeadlines
    #@+node:ekr.20031218072017.2904:expandAllSubheads
    def expandAllSubheads (self):
    
        c = self ; v = c.currentVnode()
        if not v: return
    
        child = v.firstChild()
        c.beginUpdate()
        c.expandSubtree(v)
        while child:
            c.expandSubtree(child)
            child = child.next()
        c.selectVnode(v)
        c.endUpdate()
    #@nonl
    #@-node:ekr.20031218072017.2904:expandAllSubheads
    #@+node:ekr.20031218072017.2905:expandLevel1..9
    def expandLevel1 (self): self.expandToLevel(1)
    def expandLevel2 (self): self.expandToLevel(2)
    def expandLevel3 (self): self.expandToLevel(3)
    def expandLevel4 (self): self.expandToLevel(4)
    def expandLevel5 (self): self.expandToLevel(5)
    def expandLevel6 (self): self.expandToLevel(6)
    def expandLevel7 (self): self.expandToLevel(7)
    def expandLevel8 (self): self.expandToLevel(8)
    def expandLevel9 (self): self.expandToLevel(9)
    #@-node:ekr.20031218072017.2905:expandLevel1..9
    #@+node:ekr.20031218072017.2906:expandNextLevel
    def expandNextLevel (self):
    
        c = self ; v = c.currentVnode()
        
        # 1/31/02: Expansion levels are now local to a particular tree.
        if c.expansionNode != v:
            c.expansionLevel = 1
            c.expansionNode = v
            
        self.expandToLevel(c.expansionLevel + 1)
    #@-node:ekr.20031218072017.2906:expandNextLevel
    #@+node:ekr.20031218072017.2907:expandNode
    def expandNode (self):
        
        c = self ; v = c.currentVnode()
        
        c.beginUpdate()
        v.expand()
        c.frame.tree.tree_reloader.expand( v )
        c.endUpdate()
    
    #@-node:ekr.20031218072017.2907:expandNode
    #@+node:ekr.20040930064232.1:expandNodeOrGoToFirstChild
    def expandNodeOrGoToFirstChild(self):
        
        """Simulate the Right Arrow Key in folder of Windows Explorer."""
    
        c = self ; v = c.currentVnode()
        if not v.hasChildren(): return
    
        if v.isExpanded():
            c.beginUpdate()
            c.selectVnode(v.firstChild())
            c.endUpdate()
        else:
            c.expandNode()
    #@nonl
    #@-node:ekr.20040930064232.1:expandNodeOrGoToFirstChild
    #@+node:ekr.20031218072017.2908:expandPrevLevel
    def expandPrevLevel (self):
    
        c = self ; v = c.currentVnode()
        
        # 1/31/02: Expansion levels are now local to a particular tree.
        if c.expansionNode != v:
            c.expansionLevel = 1
            c.expansionNode = v
            
        self.expandToLevel(max(1,c.expansionLevel - 1))
    #@-node:ekr.20031218072017.2908:expandPrevLevel
    #@-node:ekr.20031218072017.2899:Commands
    #@+node:ekr.20031218072017.2909:Utilities
    #@+node:ekr.20031218072017.2910:contractSubtree
    def contractSubtree (self,p):
    
        for p in p.subtree_iter():
            p.contract()
    #@nonl
    #@-node:ekr.20031218072017.2910:contractSubtree
    #@+node:ekr.20031218072017.2911:expandSubtree
    def expandSubtree (self,v):
    
        c = self
        last = v.lastNode()
        tree_reloader = c.frame.tree.tree_reloader
        while v and v != last:
            v.expand()
            tree_reloader.expand( v )
            v = v.threadNext()
        c.redraw()
    #@nonl
    #@-node:ekr.20031218072017.2911:expandSubtree
    #@+node:ekr.20031218072017.2912:expandToLevel
    def expandToLevel (self,level):
    
        c = self
        c.beginUpdate()
        
        tree_reloader = c.frame.tree.tree_reloader
        if 1: # 1/31/03: The expansion is local to the present node.
            v = c.currentVnode() ; n = v.level()
            after = v.nodeAfterTree()
            while v and v != after:
                if v.level() - n + 1 < level:
                    v.expand()
                    tree_reloader.expand( v )
                else:
                    v.contract()
                v = v.threadNext()
        else: # The expansion is global
            # Start the recursion.
            # First contract everything.
            c.contractAllHeadlines()
            v = c.rootVnode()
            while v:
                c.expandTreeToLevelFromLevel(v,level,1)
                v = v.next()
        c.expansionLevel = level
        c.expansionNode = c.currentVnode()
        c.endUpdate()
    #@nonl
    #@-node:ekr.20031218072017.2912:expandToLevel
    #@-node:ekr.20031218072017.2909:Utilities
    #@-node:ekr.20031218072017.2898:Expand & Contract...
    #@+node:ekr.20031218072017.2913:Goto
    #@+node:ekr.20031218072017.1628:goNextVisitedNode
    def goNextVisitedNode(self):
        
        c = self
    
        while c.beadPointer + 1 < len(c.beadList):
            c.beadPointer += 1
            v = c.beadList[c.beadPointer]
            if v.exists(c):
                c.beginUpdate()
                c.frame.tree.expandAllAncestors(v)
                c.selectVnode(v,updateBeadList=False)
                c.endUpdate()
                c.frame.tree.idle_scrollTo(v)
                return
    #@nonl
    #@-node:ekr.20031218072017.1628:goNextVisitedNode
    #@+node:ekr.20031218072017.1627:goPrevVisitedNode
    def goPrevVisitedNode(self):
        
        c = self
    
        while c.beadPointer > 0:
            c.beadPointer -= 1
            v = c.beadList[c.beadPointer]
            if v.exists(c):
                c.beginUpdate()
                c.frame.tree.expandAllAncestors(v)
                c.selectVnode(v,updateBeadList=False)
                c.endUpdate()
                c.frame.tree.idle_scrollTo(v)
                return
    #@-node:ekr.20031218072017.1627:goPrevVisitedNode
    #@+node:ekr.20031218072017.2914:goToFirstNode
    def goToFirstNode(self):
        
        c = self
        v = c.rootVnode()
        if v:
            c.beginUpdate()
            c.selectVnode(v)
            c.endUpdate()
    #@nonl
    #@-node:ekr.20031218072017.2914:goToFirstNode
    #@+node:ekr.20031218072017.2915:goToLastNode
    def goToLastNode(self):
        
        c = self
        v = c.rootVnode()
        while v and v.threadNext():
            v = v.threadNext()
        if v:
            c.beginUpdate()
            c.frame.tree.expandAllAncestors(v)
            c.selectVnode(v)
            c.endUpdate()
    
    #@-node:ekr.20031218072017.2915:goToLastNode
    #@+node:ekr.20031218072017.2916:goToNextClone
    def goToNextClone(self):
    
        c = self ; current = c.currentVnode()
        if not current: return
        if not current.isCloned(): return
    
        v = current.threadNext()
        while v and v.t != current.t:
            v = v.threadNext()
            
        if not v:
            # Wrap around.
            v = c.rootVnode()
            while v and v != current and v.t != current.t:
                v = v.threadNext()
    
        if v:
            c.beginUpdate()
            c.endEditing()
            c.selectVnode(v)
            c.endUpdate()
    #@nonl
    #@-node:ekr.20031218072017.2916:goToNextClone
    #@+node:ekr.20031218072017.2917:goToNextDirtyHeadline
    def goToNextDirtyHeadline (self):
    
        c = self ; current = c.currentVnode()
        if not current: return
    
        v = current.threadNext()
        while v and not v.isDirty():
            v = v.threadNext()
    
        if not v:
            # Wrap around.
            v = c.rootVnode()
            while v and not v.isDirty():
                v = v.threadNext()
    
        if v:
            c.selectVnode(v)
        else:
            g.es("done",color="blue")
    #@nonl
    #@-node:ekr.20031218072017.2917:goToNextDirtyHeadline
    #@+node:ekr.20031218072017.2918:goToNextMarkedHeadline
    def goToNextMarkedHeadline(self):
    
        c = self ; current = c.currentVnode()
        if not current: return
    
        v = current.threadNext()
        while v and not v.isMarked():
            v = v.threadNext()
    
        if v:
            c.beginUpdate()
            c.endEditing()
            c.selectVnode(v)
            c.endUpdate()
        else:
            g.es("done",color="blue")
    #@nonl
    #@-node:ekr.20031218072017.2918:goToNextMarkedHeadline
    #@+node:ekr.20031218072017.2919:goToNextSibling
    def goToNextSibling(self):
        
        c = self
        v = c.currentVnode()
        if not v: return
        next = v.next()
        if next:
            c.beginUpdate()
            c.selectVnode(next)
            c.endUpdate()
    #@nonl
    #@-node:ekr.20031218072017.2919:goToNextSibling
    #@+node:ekr.20031218072017.2920:goToParent
    def goToParent(self):
        
        c = self
        v = c.currentVnode()
        if not v: return
        p = v.parent()
        if p:
            c.beginUpdate()
            c.selectVnode(p)
            c.endUpdate()
    #@-node:ekr.20031218072017.2920:goToParent
    #@+node:ekr.20031218072017.2921:goToPrevSibling
    def goToPrevSibling(self):
        
        c = self
        v = c.currentVnode()
        if not v: return
        back = v.back()
        if back:
            c.beginUpdate()
            c.selectVnode(back)
            c.endUpdate()
    #@-node:ekr.20031218072017.2921:goToPrevSibling
    #@-node:ekr.20031218072017.2913:Goto
    #@+node:ekr.20031218072017.2922:Mark...
    #@+node:ekr.20031218072017.2923:markChangedHeadlines
    def markChangedHeadlines (self): 
    
        c = self ; v = c.rootVnode()
        c.beginUpdate()
        while v:
            if v.isDirty()and not v.isMarked():
                v.setMarked()
                c.setChanged(True)
            v = v.threadNext()
        c.endUpdate()
        g.es("done",color="blue")
    #@-node:ekr.20031218072017.2923:markChangedHeadlines
    #@+node:ekr.20031218072017.2924:markChangedRoots
    def markChangedRoots (self):
    
        c = self ; v = c.rootVnode()
        c.beginUpdate()
        while v:
            if v.isDirty()and not v.isMarked():
                s = v.bodyString()
                flag, i = g.is_special(s,0,"@root")
                if flag:
                    v.setMarked()
                    c.setChanged(True)
            v = v.threadNext()
        c.endUpdate()
        g.es("done",color="blue")
    #@nonl
    #@-node:ekr.20031218072017.2924:markChangedRoots
    #@+node:ekr.20031218072017.2925:markAllAtFileNodesDirty
    def markAllAtFileNodesDirty (self):
    
        c = self ; v = c.rootVnode()
        c.beginUpdate()
        while v:
            if v.isAtFileNode()and not v.isDirty():
                v.setDirty()
                v = v.nodeAfterTree()
            else: v = v.threadNext()
        c.endUpdate()
    #@nonl
    #@-node:ekr.20031218072017.2925:markAllAtFileNodesDirty
    #@+node:ekr.20031218072017.2926:markAtFileNodesDirty
    def markAtFileNodesDirty (self):
    
        c = self
        v = c.currentVnode()
        if not v: return
        after = v.nodeAfterTree()
        c.beginUpdate()
        while v and v != after:
            if v.isAtFileNode() and not v.isDirty():
                v.setDirty()
                v = v.nodeAfterTree()
            else: v = v.threadNext()
        c.endUpdate()
    #@nonl
    #@-node:ekr.20031218072017.2926:markAtFileNodesDirty
    #@+node:ekr.20031218072017.2927:markClones
    def markClones (self):
    
        c = self ; current = v = c.currentVnode()
        if not v: return
        if not v.isCloned(): return
        
        v = c.rootVnode()
        c.beginUpdate()
        while v:
            if v.t == current.t:
                v.setMarked()
            v = v.threadNext()
        c.endUpdate()
    #@nonl
    #@-node:ekr.20031218072017.2927:markClones
    #@+node:ekr.20031218072017.2928:markHeadline
    def markHeadline (self):
    
        c = self ; v = c.currentVnode()
        if not v: return
    
        c.beginUpdate()
        if v.isMarked():
            v.clearMarked()
        else:
            v.setMarked()
            v.setDirty()
            if 0: # 4/3/04: Marking a headline is a minor operation.
                c.setChanged(True)
        c.endUpdate()
    #@nonl
    #@-node:ekr.20031218072017.2928:markHeadline
    #@+node:ekr.20031218072017.2929:markSubheads
    def markSubheads(self):
    
        c = self ; v = c.currentVnode()
        if not v: return
    
        child = v.firstChild()
        c.beginUpdate()
        while child:
            if not child.isMarked():
                child.setMarked()
                child.setDirty()
                c.setChanged(True)
            child = child.next()
        c.endUpdate()
    #@nonl
    #@-node:ekr.20031218072017.2929:markSubheads
    #@+node:ekr.20031218072017.2930:unmarkAll
    def unmarkAll(self):
    
        c = self ; v = c.rootVnode()
        c.beginUpdate()
        while v:
            if v.isMarked():
                v.clearMarked()
                v.setDirty()
                c.setChanged(True)
            v = v.threadNext()
        c.endUpdate()
    #@nonl
    #@-node:ekr.20031218072017.2930:unmarkAll
    #@-node:ekr.20031218072017.2922:Mark...
    #@+node:ekr.20031218072017.1766:Move... (Commands)
    #@+node:ekr.20031218072017.1767:demote
    def demote(self):
    
        c = self ; p = c.currentPosition()
        if not p or not p.hasNext(): return
    
        last = p.lastChild()
        # Make sure all the moves will be valid.
        for child in p.children_iter():
            if not c.checkMoveWithParentWithWarning(child,p,True):
                return
        c.beginUpdate()
        if 1: # update...
            c.endEditing()
            while p.hasNext(): # Do not use iterator here.
                child = p.next()
                child.moveToNthChildOf(p,p.numberOfChildren())
            p.expand()
            c.selectVnode(p)
            # Even if p is an @ignore node there is no need to mark the demoted children dirty.
            p.setAllAncestorAtFileNodesDirty()
            c.setChanged(True)
        c.endUpdate()
        c.undoer.setUndoParams("Demote",p,lastChild=last)
        c.updateSyntaxColorer(p) # Moving can change syntax coloring.
    #@-node:ekr.20031218072017.1767:demote
    #@+node:ekr.20031218072017.1768:moveOutlineDown
    #@+at 
    #@nonl
    # Moving down is more tricky than moving up; we can't move p to be a child 
    # of itself.  An important optimization:  we don't have to call 
    # checkMoveWithParentWithWarning() if the parent of the moved node remains 
    # the same.
    #@-at
    #@@c
    
    def moveOutlineDown(self):
    
        c = self ; p = c.currentPosition()
        if not p: return
    
        if not c.canMoveOutlineDown(): # 11/4/03: Support for hoist.
            if c.hoistStack: g.es("Can't move node out of hoisted outline",color="blue")
            return
            
        inAtIgnoreRange = p.inAtIgnoreRange()
        # Set next to the node after which p will be moved.
        next = p.visNext()
        while next and p.isAncestorOf(next):
            next = next.visNext()
        if not next: return
        c.beginUpdate()
        if 1: # update...
            c.endEditing()
            p.setAllAncestorAtFileNodesDirty()
            #@        << Move v down >>
            #@+node:ekr.20031218072017.1769:<< Move v down >>
            # Remember both the before state and the after state for undo/redo
            oldBack = p.back()
            oldParent = p.parent()
            oldN = p.childIndex()
            
            if next.hasChildren() and next.isExpanded():
                # Attempt to move p to the first child of next.
                if c.checkMoveWithParentWithWarning(p,next,True):
                    p.moveToNthChildOf(next,0)
                    c.undoer.setUndoParams("Move Down",p,
                        oldBack=oldBack,oldParent=oldParent,oldN=oldN)
            else:
                # Attempt to move p after next.
                if c.checkMoveWithParentWithWarning(p,next.parent(),True):
                    p.moveAfter(next)
                    c.undoer.setUndoParams("Move Down",p,
                        oldBack=oldBack,oldParent=oldParent,oldN=oldN)
            #@nonl
            #@-node:ekr.20031218072017.1769:<< Move v down >>
            #@nl
            if inAtIgnoreRange and not p.inAtIgnoreRange():
                # The moved nodes have just become newly unignored.
                p.setDirty() # Mark descendent @thin nodes dirty.
            else: # No need to mark descendents dirty.
                p.setAllAncestorAtFileNodesDirty()
            c.selectVnode(p)
            c.setChanged(True)
        c.endUpdate()
        c.updateSyntaxColorer(p) # Moving can change syntax coloring.
    #@nonl
    #@-node:ekr.20031218072017.1768:moveOutlineDown
    #@+node:ekr.20031218072017.1770:moveOutlineLeft
    def moveOutlineLeft(self):
        
        c = self ; p = c.currentPosition()
        if not p: return
    
        if not c.canMoveOutlineLeft(): # 11/4/03: Support for hoist.
            if c.hoistStack: g.es("Can't move node out of hoisted outline",color="blue")
            return
        
        if not p.hasParent(): return
        # Remember both the before state and the after state for undo/redo
        inAtIgnoreRange = p.inAtIgnoreRange()
        parent = p.parent()
        oldBack = p.back()
        oldParent = p.parent()
        oldN = p.childIndex()
        c.beginUpdate()
        if 1: # update...
            c.endEditing()
            p.setAllAncestorAtFileNodesDirty()
            p.moveAfter(parent)
            c.undoer.setUndoParams("Move Left",p,
                oldBack=oldBack,oldParent=oldParent,oldN=oldN)
            if inAtIgnoreRange and not p.inAtIgnoreRange():
                # The moved nodes have just become newly unignored.
                p.setDirty() # Mark descendent @thin nodes dirty.
            else: # No need to mark descendents dirty.
                p.setAllAncestorAtFileNodesDirty()
            c.selectVnode(p)
            c.setChanged(True)
        c.endUpdate()
        c.updateSyntaxColorer(p) # Moving can change syntax coloring.
    #@-node:ekr.20031218072017.1770:moveOutlineLeft
    #@+node:ekr.20031218072017.1771:moveOutlineRight
    def moveOutlineRight(self):
        
        c = self ; p = c.currentPosition()
        if not p: return
        
        if not c.canMoveOutlineRight(): # 11/4/03: Support for hoist.
            if c.hoistStack: g.es("Can't move node out of hoisted outline",color="blue")
            return
        
        if not p.hasBack: return
        back = p.back()
        if not c.checkMoveWithParentWithWarning(p,back,True): return
    
        # Remember both the before state and the after state for undo/redo
        oldBack = back
        oldParent = p.parent()
        oldN = p.childIndex()
        c.beginUpdate()
        if 1: # update...
            c.endEditing()
            p.setAllAncestorAtFileNodesDirty()
            n = back.numberOfChildren()
            p.moveToNthChildOf(back,n)
            c.undoer.setUndoParams("Move Right",p,
                oldBack=oldBack,oldParent=oldParent,oldN=oldN)
            # Moving an outline right can never bring it outside the range of @ignore.
            p.setAllAncestorAtFileNodesDirty()
            c.selectVnode(p)
            c.setChanged(True)
        c.endUpdate()
        c.updateSyntaxColorer(p) # Moving can change syntax coloring.
    #@nonl
    #@-node:ekr.20031218072017.1771:moveOutlineRight
    #@+node:ekr.20031218072017.1772:moveOutlineUp
    def moveOutlineUp(self):
    
        c = self ; p = c.currentPosition()
        if not p: return
    
        if not c.canMoveOutlineUp(): # 11/4/03: Support for hoist.
            if c.hoistStack: g.es("Can't move node out of hoisted outline",color="blue")
            return
        back = p.visBack()
        if not back: return
        inAtIgnoreRange = p.inAtIgnoreRange()
        back2 = back.visBack()
        # A weird special case: just select back2.
        if back2 and p.v in back2.v.t.vnodeList:
            # g.trace('-'*20,"no move, selecting visBack")
            c.selectVnode(back2)
            return
        c = self
        c.beginUpdate()
        if 1: # update...
            c.endEditing()
            p.setAllAncestorAtFileNodesDirty()
            #@        << Move v up >>
            #@+node:ekr.20031218072017.1773:<< Move v up >>
            # Remember both the before state and the after state for undo/redo
            oldBack = p.back()
            oldParent = p.parent()
            oldN = p.childIndex()
            if 0:
                g.trace("visBack",back)
                g.trace("visBack2",back2)
                g.trace("oldParent",oldParent)
                g.trace("back2.hasChildren",back2.hasChildren())
                g.trace("back2.isExpanded",back2.isExpanded())
            
            if not back2:
                # p will be the new root node
                p.moveToRoot(c.rootVnode())
                c.undoer.setUndoParams("Move Up",p,
                    oldBack=oldBack,oldParent=oldParent,oldN=oldN)
            elif back2.hasChildren() and back2.isExpanded():
                if c.checkMoveWithParentWithWarning(p,back2,True):
                    p.moveToNthChildOf(back2,0)
                    c.undoer.setUndoParams("Move Up",p,
                        oldBack=oldBack,oldParent=oldParent,oldN=oldN)
            elif c.checkMoveWithParentWithWarning(p,back2.parent(),True):
                # Insert after back2.
                p.moveAfter(back2)
                c.undoer.setUndoParams("Move Up",p,
                    oldBack=oldBack,oldParent=oldParent,oldN=oldN)
            #@nonl
            #@-node:ekr.20031218072017.1773:<< Move v up >>
            #@nl
            if inAtIgnoreRange and not p.inAtIgnoreRange():
                # The moved nodes have just become newly unignored.
                p.setDirty() # Mark descendent @thin nodes dirty.
            else: # No need to mark descendents dirty.
                p.setAllAncestorAtFileNodesDirty()
            c.selectVnode(p)
            c.setChanged(True)
        c.endUpdate()
        c.updateSyntaxColorer(p) # Moving can change syntax coloring.
    #@nonl
    #@-node:ekr.20031218072017.1772:moveOutlineUp
    #@+node:ekr.20031218072017.1774:promote
    def promote(self):
    
        c = self ; p = c.currentPosition()
        if not p or not p.hasChildren(): return
    
        last = p.lastChild()
        isAtIgnoreNode = p.isAtIgnoreNode()
        inAtIgnoreRange = p.inAtIgnoreRange()
        c.beginUpdate()
        if 1: # update...
            c.endEditing()
            after = p
            while p.hasChildren(): # Don't use an iterator.
                child = p.firstChild()
                child.moveAfter(after)
                after = child
            if not inAtIgnoreRange and isAtIgnoreNode:
                # The promoted nodes have just become newly unignored.
                p.setDirty() # Mark descendent @thin nodes dirty.
            else: # No need to mark descendents dirty.
                p.setAllAncestorAtFileNodesDirty()
            c.setChanged(True)
            c.selectVnode(p)
        c.endUpdate()
        c.undoer.setUndoParams("Promote",p,lastChild=last)
        c.updateSyntaxColorer(p) # Moving can change syntax coloring.
    #@nonl
    #@-node:ekr.20031218072017.1774:promote
    #@-node:ekr.20031218072017.1766:Move... (Commands)
    #@-node:ekr.20031218072017.2894:Outline menu...
    #@+node:ekr.20031218072017.2931:Window Menu
    #@+node:ekr.20031218072017.2092:openCompareWindow
    def openCompareWindow (self):
        
        c = self ; frame = c.frame
        
        if not frame.comparePanel:
            frame.comparePanel = g.app.gui.createComparePanel(c)
    
        frame.comparePanel.bringToFront()
    #@nonl
    #@-node:ekr.20031218072017.2092:openCompareWindow
    #@+node:ekr.20031218072017.2932:openPythonWindow (Dave Hein)
    def openPythonWindow(self):
    
    
        if sys.platform == "linux2":
            #@        << open idle in Linux >>
            #@+node:ekr.20031218072017.2933:<< open idle in Linux >>
            # 09-SEP-2002 DHEIN: Open Python window under linux
            
            try:
                pathToLeo = g.os_path_join(g.app.loadDir,"leo.py")
                sys.argv = [pathToLeo]
                from idlelib import idle
                if g.app.idle_imported:
                    reload(idle)
                g.app.idle_imported = True
            except:
                try:
                    g.es("idlelib could not be imported.")
                    g.es("Probably IDLE is not installed.")
                    g.es("Run Tools/idle/setup.py to build idlelib.")
                    g.es("Can not import idle")
                    g.es_exception() # This can fail!!
                except: pass
            #@-node:ekr.20031218072017.2933:<< open idle in Linux >>
            #@nl
        else:
            #@        << open idle in Windows >>
            #@+node:ekr.20031218072017.2934:<< open idle in Windows >>
            # Initialize argv: the -t option sets the title of the Idle interp window.
            sys.argv = ["leo"] # ,"-t","Leo"]
            
            ok = False
            if g.CheckVersion(sys.version,"2.3"):
                #@    << Try to open idle in Python 2.3 systems >>
                #@+node:ekr.20031218072017.2936:<< Try to open idle in Python 2.3 systems >>
                try:
                    idle_dir = None
                    
                    import idlelib.PyShell
                
                    if g.app.idle_imported:
                        reload(idle)
                        g.app.idle_imported = True
                        
                    idlelib.PyShell.main()
                    ok = True
                
                except:
                    ok = False
                    g.es_exception()
                #@nonl
                #@-node:ekr.20031218072017.2936:<< Try to open idle in Python 2.3 systems >>
                #@nl
            else:
                #@    << Try to open idle in Python 2.2 systems >>
                #@+node:ekr.20031218072017.2935:<< Try to open idle in Python 2.2 systems>>
                try:
                    executable_dir = g.os_path_dirname(sys.executable)
                    idle_dir = g.os_path_join(executable_dir,"Tools","idle")
                
                    # 1/29/04: sys.path doesn't handle unicode in 2.2.
                    idle_dir = str(idle_dir) # May throw an exception.
                
                    # 1/29/04: must add idle_dir to sys.path even when using importFromPath.
                    if idle_dir not in sys.path:
                        sys.path.insert(0,idle_dir)
                
                    if 1:
                        import PyShell
                    else: # Works, but is not better than import.
                        PyShell = g.importFromPath("PyShell",idle_dir)
                
                    if g.app.idle_imported:
                        reload(idle)
                        g.app.idle_imported = True
                        
                    if 1: # Mostly works, but causes problems when opening other .leo files.
                        PyShell.main()
                    else: # Doesn't work: destroys all of Leo when Idle closes.
                        self.leoPyShellMain()
                    ok = True
                except ImportError:
                    ok = False
                    g.es_exception()
                #@nonl
                #@-node:ekr.20031218072017.2935:<< Try to open idle in Python 2.2 systems>>
                #@nl
            
            if not ok:
                g.es("Can not import idle")
                if idle_dir and idle_dir not in sys.path:
                    g.es("Please add '%s' to sys.path" % idle_dir)
            #@nonl
            #@-node:ekr.20031218072017.2934:<< open idle in Windows >>
            #@nl
    #@+node:ekr.20031218072017.2937:leoPyShellMain
    #@+at 
    #@nonl
    # The key parts of Pyshell.main(), but using Leo's root window instead of 
    # a new Tk root window.
    # 
    # This does _not_ work well.  Using Leo's root window means that Idle will 
    # shut down Leo without warning when the Idle window is closed!
    #@-at
    #@@c
    
    def leoPyShellMain(self):
        
        import PyShell
        root = g.app.root
        PyShell.fixwordbreaks(root)
        flist = PyShell.PyShellFileList(root)
        shell = PyShell.PyShell(flist)
        flist.pyshell = shell
        shell.begin()
    #@nonl
    #@-node:ekr.20031218072017.2937:leoPyShellMain
    #@-node:ekr.20031218072017.2932:openPythonWindow (Dave Hein)
    #@-node:ekr.20031218072017.2931:Window Menu
    #@+node:ekr.20031218072017.2938:Help Menu
    #@+node:ekr.20031218072017.2939:about (version number & date)
    def about(self):
        
        c = self
        
        # Don't use triple-quoted strings or continued strings here.
        # Doing so would add unwanted leading tabs.
        version = c.getSignOnLine() + "\n\n"
        theCopyright = (
            "Copyright 1999-2004 by Edward K. Ream\n" +
            "All Rights Reserved\n" +
            "Leo is distributed under the Python License")
        url = "http://webpages.charter.net/edreamleo/front.html"
        email = "edreamleo@charter.net"
    
        g.app.gui.runAboutLeoDialog(version,theCopyright,url,email)
    #@nonl
    #@-node:ekr.20031218072017.2939:about (version number & date)
    #@+node:ekr.20031218072017.2940:leoDocumentation
    def leoDocumentation (self):
        
        c = self
    
        fileName = g.os_path_join(g.app.loadDir,"..","doc","LeoDocs.leo")
    
        try:
            g.openWithFileName(fileName,c)
        except:
            g.es("not found: LeoDocs.leo")
    #@-node:ekr.20031218072017.2940:leoDocumentation
    #@+node:ekr.20031218072017.2941:leoHome
    def leoHome (self):
        
        import webbrowser
    
        url = "http://webpages.charter.net/edreamleo/front.html"
        try:
            webbrowser.open_new(url)
        except:
            g.es("not found: " + url)
    #@nonl
    #@-node:ekr.20031218072017.2941:leoHome
    #@+node:ekr.20031218072017.2942:leoTutorial (version number)
    def leoTutorial (self):
        
        import webbrowser
    
        if 1: # new url
            url = "http://www.3dtree.com/ev/e/sbooks/leo/sbframetoc_ie.htm"
        else:
            url = "http://www.evisa.com/e/sbooks/leo/sbframetoc_ie.htm"
        try:
            webbrowser.open_new(url)
        except:
            g.es("not found: " + url)
    #@nonl
    #@-node:ekr.20031218072017.2942:leoTutorial (version number)
    #@+node:ekr.20031218072017.2943:leoConfig
    def leoConfig (self):
    
        # 4/21/03 new code suggested by fBechmann@web.de
        c = self
        loadDir = g.app.loadDir
        configDir = g.app.globalConfigDir
    
        # Look in configDir first.
        fileName = g.os_path_join(configDir, "leoConfig.leo")
    
        ok, frame = g.openWithFileName(fileName,c)
        if not ok:
            if configDir == loadDir:
                g.es("leoConfig.leo not found in " + loadDir)
            else:
                # Look in loadDir second.
                fileName = g.os_path_join(loadDir,"leoConfig.leo")
    
                ok, frame = g.openWithFileName(fileName,c)
                if not ok:
                    g.es("leoConfig.leo not found in " + configDir + " or " + loadDir)
    #@nonl
    #@-node:ekr.20031218072017.2943:leoConfig
    #@-node:ekr.20031218072017.2938:Help Menu
    #@-node:ekr.20031218072017.2818:Command handlers...
    #@+node:ekr.20031218072017.2945:Dragging (commands)
    #@+node:ekr.20031218072017.2353:c.dragAfter
    def dragAfter(self,v,after):
    
        c = self
        if not c.checkMoveWithParentWithWarning(v,after.parent(),True): return
        # Remember both the before state and the after state for undo/redo
        inAtIgnoreRange = v.inAtIgnoreRange()
        oldBack = v.back()
        oldParent = v.parent()
        oldN = v.childIndex()
        c.beginUpdate()
        if 1: # inside update...
            c.endEditing()
            # v.setDirty()
            v.setAllAncestorAtFileNodesDirty() # 1/12/04
            v.moveAfter(after)
            c.undoer.setUndoParams("Drag",v,
                oldBack=oldBack,oldParent=oldParent,oldN=oldN)
            if inAtIgnoreRange and not v.inAtIgnoreRange():
                # The moved nodes have just become newly unignored.
                v.setDirty() # Mark descendent @thin nodes dirty.
            else: # No need to mark descendents dirty.
                v.setAllAncestorAtFileNodesDirty()
            c.selectVnode(v)
            c.setChanged(True)
        c.endUpdate()
        c.updateSyntaxColorer(v) # Dragging can change syntax coloring.
    #@nonl
    #@-node:ekr.20031218072017.2353:c.dragAfter
    #@+node:ekr.20031218072017.2946:c.dragCloneToNthChildOf (changed in 3.11.1)
    def dragCloneToNthChildOf (self,v,parent,n):
    
        c = self
        c.beginUpdate()
        if 1: # Update range...
            # g.trace("v,parent,n:",v.headString(),parent.headString(),n)
            clone = v.clone(v) # Creates clone & dependents, does not set undo.
            if not c.checkMoveWithParentWithWarning(clone,parent,True):
                clone.doDelete(v) # Destroys clone and makes v the current node.
                c.endUpdate(False) # Nothing has changed.
                return
            # Remember both the before state and the after state for undo/redo
            inAtIgnoreRange = v.inAtIgnoreRange()
            oldBack = v.back()
            oldParent = v.parent()
            oldN = v.childIndex()
            c.endEditing()
            # clone.setDirty()
            clone.setAllAncestorAtFileNodesDirty() # 1/12/04
            clone.moveToNthChildOf(parent,n)
            c.undoer.setUndoParams("Drag & Clone",clone,
                oldBack=oldBack,oldParent=oldParent,oldN=oldN,oldV=v)
            if inAtIgnoreRange and not v.inAtIgnoreRange():
                # The moved nodes have just become newly unignored.
                v.setDirty() # Mark descendent @thin nodes dirty.
            else: # No need to mark descendents dirty.
                v.setAllAncestorAtFileNodesDirty()
            c.selectVnode(clone)
            c.setChanged(True)
            c.endUpdate()
        c.updateSyntaxColorer(clone) # Dragging can change syntax coloring.
    #@nonl
    #@-node:ekr.20031218072017.2946:c.dragCloneToNthChildOf (changed in 3.11.1)
    #@+node:ekr.20031218072017.2947:c.dragToNthChildOf
    def dragToNthChildOf(self,v,parent,n):
    
        c = self
        if not c.checkMoveWithParentWithWarning(v,parent,True): return
        # Remember both the before state and the after state for undo/redo
        inAtIgnoreRange = v.inAtIgnoreRange()
        oldBack = v.back()
        oldParent = v.parent()
        oldN = v.childIndex()
        c.beginUpdate()
        if 1: # inside update...
            c.endEditing()
            v.setAllAncestorAtFileNodesDirty()
            v.moveToNthChildOf(parent,n)
            c.undoer.setUndoParams("Drag",v,
                oldBack=oldBack,oldParent=oldParent,oldN=oldN)
            if inAtIgnoreRange and not v.inAtIgnoreRange():
                # The moved nodes have just become newly unignored.
                v.setDirty() # Mark descendent @thin nodes dirty.
            else: # No need to mark descendents dirty.
                v.setAllAncestorAtFileNodesDirty()
            c.selectVnode(v)
            c.setChanged(True)
        c.endUpdate()
        c.updateSyntaxColorer(v) # Dragging can change syntax coloring.
    #@nonl
    #@-node:ekr.20031218072017.2947:c.dragToNthChildOf
    #@+node:ekr.20031218072017.2948:c.dragCloneAfter
    def dragCloneAfter (self,v,after):
    
        c = self
        c.beginUpdate()
        if 1: # Update range...
            clone = v.clone(v) # Creates clone.  Does not set undo.
            # g.trace("v,after:",v.headString(),after.headString())
            if not c.checkMoveWithParentWithWarning(clone,after.parent(),True):
                g.trace("invalid clone move")
                clone.doDelete(v) # Destroys clone & dependents. Makes v the current node.
                c.endUpdate(False) # Nothing has changed.
                return
            # Remember both the before state and the after state for undo/redo
            inAtIgnoreRange = clone.inAtIgnoreRange()
            oldBack = v.back()
            oldParent = v.parent()
            oldN = v.childIndex()
            c.endEditing()
            clone.setAllAncestorAtFileNodesDirty()
            clone.moveAfter(after)
            c.undoer.setUndoParams("Drag & Clone",clone,
                oldBack=oldBack,oldParent=oldParent,oldN=oldN,oldV=v)
            if inAtIgnoreRange and not clone.inAtIgnoreRange():
                # The moved node have just become newly unignored.
                clone.setDirty() # Mark descendent @thin nodes dirty.
            else: # No need to mark descendents dirty.
                clone.setAllAncestorAtFileNodesDirty()
            c.selectVnode(clone)
            c.setChanged(True)
        c.endUpdate()
        c.updateSyntaxColorer(clone) # Dragging can change syntax coloring.
    #@nonl
    #@-node:ekr.20031218072017.2948:c.dragCloneAfter
    #@-node:ekr.20031218072017.2945:Dragging (commands)
    #@+node:ekr.20031218072017.2949:Drawing Utilities (commands)
    #@+node:ekr.20031218072017.2950:beginUpdate
    def beginUpdate(self):
    
        self.frame.tree.beginUpdate()
        
    BeginUpdate = beginUpdate # Compatibility with old scripts
    #@nonl
    #@-node:ekr.20031218072017.2950:beginUpdate
    #@+node:ekr.20031218072017.2951:bringToFront
    def bringToFront(self):
    
        self.frame.deiconify()
    
    BringToFront = bringToFront # Compatibility with old scripts
    #@nonl
    #@-node:ekr.20031218072017.2951:bringToFront
    #@+node:ekr.20031218072017.2952:endUpdate
    def endUpdate(self, flag=True ):
        
        self.frame.tree.endUpdate(flag)
        
    EndUpdate = endUpdate # Compatibility with old scripts
    #@nonl
    #@-node:ekr.20031218072017.2952:endUpdate
    #@+node:ekr.20031218072017.2953:recolor
    def recolor(self):
    
        c = self
    
        c.frame.body.recolor(c.currentVnode())
    #@nonl
    #@-node:ekr.20031218072017.2953:recolor
    #@+node:ekr.20031218072017.2954:redraw & repaint
    def redraw(self):
    
        self.frame.tree.redraw()
        
    # Compatibility with old scripts
    Redraw = redraw 
    repaint = redraw
    Repaint = redraw
    #@nonl
    #@-node:ekr.20031218072017.2954:redraw & repaint
    #@-node:ekr.20031218072017.2949:Drawing Utilities (commands)
    #@+node:ekr.20031218072017.2955:Enabling Menu Items
    #@+node:ekr.20040323172420:Slow routines: no longer used
    #@+node:ekr.20031218072017.2966:canGoToNextDirtyHeadline (slow)
    def canGoToNextDirtyHeadline (self):
        
        c = self ; current = c.currentPosition()
    
        for p in c.allNodes_iter():
            if not p == current and p.isDirty(): #changed from p !=
                return True
        
        return False
    #@nonl
    #@-node:ekr.20031218072017.2966:canGoToNextDirtyHeadline (slow)
    #@+node:ekr.20031218072017.2967:canGoToNextMarkedHeadline (slow)
    def canGoToNextMarkedHeadline (self):
        
        c = self ; current = c.currentPosition()
            
        for p in c.allNodes_iter():
            if not p == current and p.isMarked(): #CHANGED: from p!=
                return True
    
        return False
    #@-node:ekr.20031218072017.2967:canGoToNextMarkedHeadline (slow)
    #@+node:ekr.20031218072017.2968:canMarkChangedHeadline (slow)
    def canMarkChangedHeadlines (self):
        
        c = self
        
        for p in c.allNodes_iter():
            if p.isDirty():
                return True
        
        return False
    #@nonl
    #@-node:ekr.20031218072017.2968:canMarkChangedHeadline (slow)
    #@+node:ekr.20031218072017.2969:canMarkChangedRoots (slow)
    def canMarkChangedRoots (self):
        
        c = self
        
        for p in c.allNodes_iter():
            if p.isDirty and p.isAnyAtFileNode():
                return True
    
        return False
    #@nonl
    #@-node:ekr.20031218072017.2969:canMarkChangedRoots (slow)
    #@-node:ekr.20040323172420:Slow routines: no longer used
    #@+node:ekr.20040131170659:canClone (new for hoist)
    def canClone (self):
    
        c = self
        
        if c.hoistStack:
            current = c.currentPosition()
            bunch = c.hoistStack[-1]
            return current != bunch.p
        else:
            return True
    #@nonl
    #@-node:ekr.20040131170659:canClone (new for hoist)
    #@+node:ekr.20031218072017.2956:canContractAllHeadlines
    def canContractAllHeadlines (self):
        
        c = self
        
        for p in c.allNodes_iter():
            if p.isExpanded():
                return True
    
        return False
    #@nonl
    #@-node:ekr.20031218072017.2956:canContractAllHeadlines
    #@+node:ekr.20031218072017.2957:canContractAllSubheads
    def canContractAllSubheads (self):
    
        c = self ; current = c.currentPosition()
        
        for p in current.subtree_iter():
            if not p == current and p.isExpanded(): #CHANGED: from p !=
                return True
    
        return False
    #@nonl
    #@-node:ekr.20031218072017.2957:canContractAllSubheads
    #@+node:ekr.20031218072017.2958:canContractParent
    def canContractParent (self):
    
        c = self
        return c.currentPosition().parent()
    #@nonl
    #@-node:ekr.20031218072017.2958:canContractParent
    #@+node:ekr.20031218072017.2959:canContractSubheads
    def canContractSubheads (self):
        
        c = self ; current = c.currentPosition()
    
        for child in current.children_iter():
            if child.isExpanded():
                return True
            
        return False
    #@nonl
    #@-node:ekr.20031218072017.2959:canContractSubheads
    #@+node:ekr.20031218072017.2960:canCutOutline & canDeleteHeadline
    def canDeleteHeadline (self):
        
        c = self ; p = c.currentPosition()
    
        return p.hasParent() or p.hasThreadBack() or p.hasNext()
    
    canCutOutline = canDeleteHeadline
    #@nonl
    #@-node:ekr.20031218072017.2960:canCutOutline & canDeleteHeadline
    #@+node:ekr.20031218072017.2961:canDemote
    def canDemote (self):
    
        c = self
        return c.currentPosition().hasNext()
    #@nonl
    #@-node:ekr.20031218072017.2961:canDemote
    #@+node:ekr.20031218072017.2962:canExpandAllHeadlines
    def canExpandAllHeadlines (self):
        
        c = self
        
        for p in c.allNodes_iter():
            if not p.isExpanded():
                return True
    
        return False
    #@-node:ekr.20031218072017.2962:canExpandAllHeadlines
    #@+node:ekr.20031218072017.2963:canExpandAllSubheads
    def canExpandAllSubheads (self):
    
        c = self
        
        for p in c.currentPosition().subtree_iter():
            if not p.isExpanded():
                return True
            
        return False
    #@nonl
    #@-node:ekr.20031218072017.2963:canExpandAllSubheads
    #@+node:ekr.20031218072017.2964:canExpandSubheads
    def canExpandSubheads (self):
    
        c = self ; current = c.currentPosition()
        
        for p in current.children_iter():
            if not p == current and not p.isExpanded(): #CHANGED: from p !=
                return True
    
        return False
    #@nonl
    #@-node:ekr.20031218072017.2964:canExpandSubheads
    #@+node:ekr.20031218072017.2287:canExtract, canExtractSection & canExtractSectionNames
    def canExtract (self):
    
        c = self ; body = c.frame.body
        return body and body.hasTextSelection()
        
    canExtractSectionNames = canExtract
            
    def canExtractSection (self):
        
        __pychecker__ = '--no-implicitreturns' # Suppress bad warning.
    
        c = self ; body = c.frame.body
        if not body: return False
        
        s = body.getSelectedText()
        if not s: return False
    
        line = g.get_line(s,0)
        i1 = line.find("<<")
        j1 = line.find(">>")
        i2 = line.find("@<")
        j2 = line.find("@>")
        return -1 < i1 < j1 or -1 < i2 < j2
    #@nonl
    #@-node:ekr.20031218072017.2287:canExtract, canExtractSection & canExtractSectionNames
    #@+node:ekr.20031218072017.2965:canFindMatchingBracket
    def canFindMatchingBracket (self):
        
        c = self ; brackets = "()[]{}"
        c1 = c.frame.body.getCharAtInsertPoint()
        c2 = c.frame.body.getCharBeforeInsertPoint()
        return (c1 and c1 in brackets) or (c2 and c2 in brackets)
    #@nonl
    #@-node:ekr.20031218072017.2965:canFindMatchingBracket
    #@+node:ekr.20040303165342:canHoist & canDehoist
    def canDehoist(self):
        
        return len(self.hoistStack) > 0
        #return len( self.chapters.current_chapter.hoistStack ) > 0
            
    def canHoist(self):
        
        c = self
        
        # N.B.  This is called at idle time, so minimizing positions is crucial!
        #hs = c.chapters.current_chapter.hoistStack
        if c.hoistStack:
            #if hs:
            #bunch = hs[ -1 ]
            bunch = c.hoistStack[-1]
            return bunch.p and not bunch.p.isCurrentPosition()
        elif c.currentPositionIsRootPosition():
            return c.currentPositionHasNext()
        else:
            return True
    #@nonl
    #@-node:ekr.20040303165342:canHoist & canDehoist
    #@+node:ekr.20031218072017.2970:canMoveOutlineDown
    def canMoveOutlineDown (self):
    
        c = self ; current = c.currentPosition()
            
        p = current.visNext()
        while p and current.isAncestorOf(p):
            p.moveToVisNext()
    
        if c.hoistStack:
            bunch = c.hoistStack[-1]
            return p and not p == bunch.p and bunch.p.isAncestorOf(p) #CHANGED: from p!=
        else:
            return p
    #@nonl
    #@-node:ekr.20031218072017.2970:canMoveOutlineDown
    #@+node:ekr.20031218072017.2971:canMoveOutlineLeft
    def canMoveOutlineLeft (self):
    
        c = self ; p = c.currentPosition()
    
        if c.hoistStack:
            bunch = c.hoistStack[-1]
            if p and p.hasParent():
                p.moveToParent()
                return not p == bunch.p and bunch.p.isAncestorOf(p) #CHANGED p !=
            else:
                return False
        else:
            return p and p.hasParent()
    #@nonl
    #@-node:ekr.20031218072017.2971:canMoveOutlineLeft
    #@+node:ekr.20031218072017.2972:canMoveOutlineRight
    def canMoveOutlineRight (self):
    
        c = self ; p = c.currentPosition()
        
        if c.hoistStack:
            bunch = c.hoistStack[-1]
            return p and p.hasBack() and not p == bunch.p #CHANGED: p !=
        else:
            return p and p.hasBack()
    #@nonl
    #@-node:ekr.20031218072017.2972:canMoveOutlineRight
    #@+node:ekr.20031218072017.2973:canMoveOutlineUp
    def canMoveOutlineUp (self):
    
        c = self ; p = c.currentPosition()
        if not p: return False
        
        pback = p.visBack()
        if not pback: return False
    
        if c.hoistStack:
            bunch = c.hoistStack[-1]
            return not bunch.p == p and bunch.p.isAncestorOf(pback) #CHANGED p !=
        else:
            return True
    #@nonl
    #@-node:ekr.20031218072017.2973:canMoveOutlineUp
    #@+node:ekr.20031218072017.2974:canPasteOutline
    def canPasteOutline (self,s=None):
    
        c = self
        if s == None:
            s = g.app.gui.getTextFromClipboard()
        if not s:
            return False
    
        # g.trace(s)
        if g.match(s,0,g.app.prolog_prefix_string):
            return True
        elif len(s) > 0:
            return c.importCommands.stringIsValidMoreFile(s)
        else:
            return False
    #@nonl
    #@-node:ekr.20031218072017.2974:canPasteOutline
    #@+node:ekr.20031218072017.2975:canPromote
    def canPromote (self):
    
        c = self ; v = c.currentVnode()
        return v and v.hasChildren()
    #@nonl
    #@-node:ekr.20031218072017.2975:canPromote
    #@+node:ekr.20031218072017.2976:canRevert
    def canRevert (self):
    
        # c.mFileName will be "untitled" for unsaved files.
        c = self
        return (c.frame and c.mFileName and c.isChanged())
    #@nonl
    #@-node:ekr.20031218072017.2976:canRevert
    #@+node:ekr.20031218072017.2977:canSelect....
    # 7/29/02: The shortcuts for these commands are now unique.
    
    def canSelectThreadBack (self):
        c = self ; p = c.currentPosition()
        return p.hasThreadBack()
        
    def canSelectThreadNext (self):
        c = self ; p = c.currentPosition()
        return p.hasThreadNext()
    
    def canSelectVisBack (self):
        c = self ; p = c.currentPosition()
        return p.hasVisBack()
        
    def canSelectVisNext (self):
        c = self ; p = c.currentPosition()
        return p.hasVisNext()
    #@nonl
    #@-node:ekr.20031218072017.2977:canSelect....
    #@+node:ekr.20031218072017.2978:canShiftBodyLeft/Right
    def canShiftBodyLeft (self):
    
        c = self ; body = c.frame.body
        return body and body.getAllText()
    
    canShiftBodyRight = canShiftBodyLeft
    #@nonl
    #@-node:ekr.20031218072017.2978:canShiftBodyLeft/Right
    #@+node:ekr.20031218072017.2979:canSortChildren, canSortSiblings
    def canSortChildren (self):
        
        c = self ; p = c.currentPosition()
        return p and p.hasChildren()
    
    def canSortSiblings (self):
    
        c = self ; p = c.currentPosition()
        return p and (p.hasNext() or p.hasBack())
    #@nonl
    #@-node:ekr.20031218072017.2979:canSortChildren, canSortSiblings
    #@+node:ekr.20031218072017.2980:canUndo & canRedo
    def canUndo (self):
    
        c = self
        return c.undoer.canUndo()
        
    def canRedo (self):
    
        c = self
        return c.undoer.canRedo()
    #@nonl
    #@-node:ekr.20031218072017.2980:canUndo & canRedo
    #@+node:ekr.20031218072017.2981:canUnmarkAll
    def canUnmarkAll (self):
        
        c = self
        
        for p in c.allNodes_iter():
            if p.isMarked():
                return True
    
        return False
    #@nonl
    #@-node:ekr.20031218072017.2981:canUnmarkAll
    #@-node:ekr.20031218072017.2955:Enabling Menu Items
    #@+node:ekr.20031218072017.2982:Getters & Setters
    #@+node:ekr.20031218072017.2984:c.clearAllMarked
    def clearAllMarked (self):
    
        c = self
    
        for p in c.allNodes_iter():
            p.v.clearMarked()
    #@nonl
    #@-node:ekr.20031218072017.2984:c.clearAllMarked
    #@+node:ekr.20031218072017.2985:c.clearAllVisited
    def clearAllVisited (self):
    
        c = self
    
        for p in c.allNodes_iter():
            p.v.clearVisited()
            p.v.t.clearVisited()
            p.v.t.clearWriteBit()
    #@-node:ekr.20031218072017.2985:c.clearAllVisited
    #@+node:ekr.20031218072017.2983:c.currentPosition & c.setCurrentPosition
    #@+node:ekr.20040803140033:currentPosition
    def currentPosition (self,copy=True):
        
        """Return the presently selected position."""
        
        c = self
        cp = self.chapters.getCurrentPosition()
        #if c._currentPosition:
        if cp:
            if copy:
                return cp.copy()
                #return c._currentPosition.copy() # Must make a second copy now.
            else:
                # The caller MUST copy the position if it is passed to any other method.
                # At present no core method uses copy = False.
                g.trace("copy=False")
                return cp
                #return c._currentPosition
        else:
            return c.nullPosition()
        
    # For compatibiility with old scripts.
    currentVnode = currentPosition
    #@nonl
    #@-node:ekr.20040803140033:currentPosition
    #@+node:ekr.20040803140033.1:setCurrentPosition
    def setCurrentPosition (self,p):
        
        """Set the presently selected position."""
        
        c = self
        
        if p:
            cp = self.chapters.getCurrentPosition()
            #if p.equal(c._currentPosition):
            #    pass # We have already made a copy.
            if p.equal( cp ):
                pass
            else: # Must make a copy _now_
                #c._currentPosition = p.copy()
                self.chapters.setCurrentPosition( p.copy())  
        else:
            self.chapters.setCurrentPosition( None )
            #c._currentPosition = None
        
    # For compatibiility with old scripts.
    setCurrentVnode = setCurrentPosition
    #@nonl
    #@-node:ekr.20040803140033.1:setCurrentPosition
    #@-node:ekr.20031218072017.2983:c.currentPosition & c.setCurrentPosition
    #@+node:ekr.20031218072017.2986:c.fileName & shortFileName
    # Compatibility with scripts
    
    def fileName (self):
    
        return self.mFileName
    
    def shortFileName (self):
        
        return g.shortFileName(self.mFileName)
    
    shortFilename = shortFileName
    #@nonl
    #@-node:ekr.20031218072017.2986:c.fileName & shortFileName
    #@+node:ekr.20031218072017.2987:c.isChanged
    def isChanged (self):
    
        return self.changed
    #@nonl
    #@-node:ekr.20031218072017.2987:c.isChanged
    #@+node:ekr.20040803112200:c.is...Position
    #@+node:ekr.20040803155551:c.currentPositionIsRootPosition
    def currentPositionIsRootPosition (self):
        
        """Return True if the current position is the root position.
        
        This method is called during idle time, so not generating positions
        here fixes a major leak.
        """
        
        c = self
        
        return (
            c._currentPosition and c._rootPosition and
            c._currentPosition == c._rootPosition)
            
    #@nonl
    #@-node:ekr.20040803155551:c.currentPositionIsRootPosition
    #@+node:ekr.20040803160656:c.currentPositionHasNext
    def currentPositionHasNext (self):
        
        """Return True if the current position is the root position.
        
        This method is called during idle time, so not generating positions
        here fixes a major leak.
        """
        
        c = self ; current = c._currentPosition 
        
        return current and current.hasNext()
    #@nonl
    #@-node:ekr.20040803160656:c.currentPositionHasNext
    #@+node:ekr.20040803112450:c.isCurrentPosition
    def isCurrentPosition (self,p):
        
        """
        >>> c = g.top() ; p = c.currentPosition()
        >>> n = g.app.positions
        >>> assert c.isCurrentPosition(None) is False
        >>> assert c.isCurrentPosition(p) is True
        >>> assert g.app.positions == n
        >>> 
        """
        
        c = self
        
        if p is None or c._currentPosition is None:
            return False
        else:
            return p.isEqual(c._currentPosition)
    #@nonl
    #@-node:ekr.20040803112450:c.isCurrentPosition
    #@+node:ekr.20040803112450.1:c.isRootPosition
    def isRootPosition (self,p):
        
        """
        >>> c = g.top() ; p = c.rootPosition()
        >>> n = g.app.positions
        >>> assert c.isRootPosition(None) is False
        >>> assert c.isRootPosition(p) is True
        >>> assert g.app.positions == n
        >>> 
        """
        
        c = self
        
        if p is None or c._rootPosition is None:
            return False
        else:
            return p.isEqual(c._rootPosition)
    #@nonl
    #@-node:ekr.20040803112450.1:c.isRootPosition
    #@-node:ekr.20040803112200:c.is...Position
    #@+node:ekr.20040311094927:c.nullPosition
    def nullPosition (self):
        
        return leoNodes.position(None,[])
    #@nonl
    #@-node:ekr.20040311094927:c.nullPosition
    #@+node:ekr.20031218072017.2988:c.rootPosition & c.setRootPosition
    #@+node:ekr.20040803140033.2:rootPosition
    def rootPosition(self):
        
        """Return the root position."""
        
        c = self
        rp = self.chapters.getRootPosition()
        if rp:
            return rp.copy()
        else:
            return c.nullPosition()
        
        #if self._rootPosition:
        #    return self._rootPosition.copy()
        #else:
        #    return  c.nullPosition()
    
    # For compatibiility with old scripts.
    rootVnode = rootPosition
    #@nonl
    #@-node:ekr.20040803140033.2:rootPosition
    #@+node:ekr.20040803140033.3:setRootPosition
    def setRootPosition(self,p):
        
        """Set the root positioin."""
    
        c = self
        
        
        if p:
            
            rp = self.chapters.getRootPosition()
            if p.equal( rp ):
                pass
            else:
                self.chapters.setRootPosition( p )
    
            #if p.equal(c._rootPosition):
            #    pass # We have already made a copy.
            #else:
            #    # We must make a copy _now_.
            #    c._rootPosition = p.copy()
        else:
            self.chapters.setRootPosition( None )
            #c._rootPosition = None
        
    
        
    # For compatibiility with old scripts.
    setRootVnode = setRootPosition
    #@nonl
    #@-node:ekr.20040803140033.3:setRootPosition
    #@-node:ekr.20031218072017.2988:c.rootPosition & c.setRootPosition
    #@+node:ekr.20031218072017.2989:c.setChanged
    def setChanged2( self,changedFlag ):
        self.changed = changedFlag
    
    def setChanged (self,changedFlag):
    
        c = self
        if not c.frame: return
        # import traceback ; traceback.print_stack()
    
        # Clear all dirty bits _before_ setting the caption.
        # 9/15/01 Clear all dirty bits except orphaned @file nodes
        if not changedFlag:
            # g.trace("clearing all dirty bits")
            for p in c.allNodes_iter():
                if p.isDirty() and not (p.isAtFileNode() or p.isAtNorefFileNode()):
                    p.clearDirty()
        # Update all derived changed markers.
        c.changed = changedFlag
        s = c.frame.getTitle()
        if len(s) > 2 and not c.loading: # don't update while loading.
            if changedFlag:
                # import traceback ; traceback.print_stack()
                if s [0] != '*': c.frame.setTitle("* " + s)
            else:
                if s[0:2]=="* ": c.frame.setTitle(s[2:])
    #@nonl
    #@-node:ekr.20031218072017.2989:c.setChanged
    #@+node:ekr.20040311173238:c.topPosition & c.setTopPosition
    def topPosition(self):
        
        """Return the root position."""
        
        c = self
        
        if c._topPosition:
            return c._topPosition.copy()
        else:
            return c.nullPosition()
    
    def setTopPosition(self,p):
        
        """Set the root positioin."""
        
        c = self
    
        if p:
            c._topPosition = p.copy()
        else:
            c._topPosition = None
        
    # Define these for compatibiility with old scripts.
    topVnode = topPosition
    setTopVnode = setTopPosition
    #@nonl
    #@-node:ekr.20040311173238:c.topPosition & c.setTopPosition
    #@-node:ekr.20031218072017.2982:Getters & Setters
    #@+node:ekr.20031218072017.2990:Selecting & Updating (commands)
    #@+node:ekr.20031218072017.2991:c.editVnode (calls tree.editLabel)
    # Selects v: sets the focus to p and edits p.
    
    def editPosition(self,p):
    
        c = self
    
        if p:
            c.selectVnode(p)
            c.frame.tree.editLabel(p)
    #@nonl
    #@-node:ekr.20031218072017.2991:c.editVnode (calls tree.editLabel)
    #@+node:ekr.20031218072017.2992:endEditing (calls tree.endEditLabel)
    # Ends the editing in the outline.
    
    def endEditing(self):
    
        self.frame.tree.endEditLabel()
    #@-node:ekr.20031218072017.2992:endEditing (calls tree.endEditLabel)
    #@+node:ekr.20031218072017.2993:selectThreadBack
    def selectThreadBack(self):
    
        c = self ; current = c.currentVnode()
        if not current: return
        
        v = current.threadBack()
        if v:
            c.beginUpdate()
            c.selectVnode(v)
            c.endUpdate()
    #@-node:ekr.20031218072017.2993:selectThreadBack
    #@+node:ekr.20031218072017.2994:selectThreadNext
    def selectThreadNext(self):
    
        c = self ; current = c.currentVnode()
        if not current: return
    
        v = current.threadNext()
        if v:
            c.beginUpdate()
            c.selectVnode(v)
            c.endUpdate()
    #@nonl
    #@-node:ekr.20031218072017.2994:selectThreadNext
    #@+node:ekr.20031218072017.2995:selectVisBack
    # This has an up arrow for a control key.
    
    def selectVisBack(self):
    
        c = self ; current = c.currentVnode()
        if not current: return
    
        v = current.visBack()
        if v:
            c.beginUpdate()
            c.selectVnode(v)
            c.endUpdate()
    #@nonl
    #@-node:ekr.20031218072017.2995:selectVisBack
    #@+node:ekr.20031218072017.2996:selectVisNext
    def selectVisNext(self):
    
        c = self ; current = c.currentVnode()
        if not current: return
        
        v = current.visNext()
        if v:
            c.beginUpdate()
            c.selectVnode(v)
            c.endUpdate()
    #@-node:ekr.20031218072017.2996:selectVisNext
    #@+node:ekr.20031218072017.2997:selectVnode & selectPosition (calls tree.select)
    def selectVnode(self,p,updateBeadList=True):
        
        """Select a new vnode."""
    
        # All updating and "synching" of nodes are now done in the event handlers!
        c = self
        c.frame.tree.endEditLabel()
        c.frame.tree.select(p,updateBeadList)
        c.frame.body.setFocus()
        self.editing = False
        
    selectPosition = selectVnode
    #@nonl
    #@-node:ekr.20031218072017.2997:selectVnode & selectPosition (calls tree.select)
    #@+node:ekr.20031218072017.2998:selectVnodeWithEditing
    # Selects the given node and enables editing of the headline if editFlag is True.
    
    def selectVnodeWithEditing(self,v,editFlag):
    
        c = self
        if editFlag:
            c.editPosition(v)
        else:
            c.selectVnode(v)
    
    selectPositionWithEditing = selectVnodeWithEditing
    #@nonl
    #@-node:ekr.20031218072017.2998:selectVnodeWithEditing
    #@-node:ekr.20031218072017.2990:Selecting & Updating (commands)
    #@+node:ekr.20031218072017.2999:Syntax coloring interface
    #@+at 
    #@nonl
    # These routines provide a convenient interface to the syntax colorer.
    #@-at
    #@+node:ekr.20031218072017.3000:updateSyntaxColorer
    def updateSyntaxColorer(self,v):
    
        self.frame.body.updateSyntaxColorer(v)
    #@-node:ekr.20031218072017.3000:updateSyntaxColorer
    #@-node:ekr.20031218072017.2999:Syntax coloring interface
    #@-others

class Commands (baseCommands):
    """A class that implements most of Leo's commands."""
    pass
#@nonl
#@-node:ekr.20041118104831:class commands
#@+node:ekr.20041118104831.1:class configSettings
class configSettings:
    
    """A class to hold config settings for commanders."""
    
    #@    @+others
    #@+node:ekr.20041118104831.2:configSettings.__init__
    def __init__ (self,c):
        
        self.c = c
        
        self.defaultBodyFontSize = g.app.config.defaultBodyFontSize
        self.defaultLogFontSize  = g.app.config.defaultLogFontSize
        self.defaultTreeFontSize = g.app.config.defaultTreeFontSize
        
        for ivar in g.app.config.encodingIvarsDict.keys():
            if ivar != '_hash':
                self.initEncoding(ivar)
            
        for ivar in g.app.config.ivarsDict.keys():
            if ivar != '_hash':
                self.initIvar(ivar)
    #@nonl
    #@+node:ekr.20041118104240:initIvar
    def initIvar(self,ivarName):
        
        munge = g.app.config.canonicalizeSettingName
    
        bunch = g.app.config.ivarsDict.get(munge(ivarName))
        ivar = bunch.ivar ; val = bunch.val
    
        # g.trace(self.c.hash(),bunch.toString())
    
        setattr(self,ivar,val)
    #@nonl
    #@-node:ekr.20041118104240:initIvar
    #@+node:ekr.20041118104414:initEncoding
    def initEncoding (self,encodingName):
        
        munge = g.app.config.canonicalizeSettingName
    
        bunch = g.app.config.encodingIvarsDict.get(munge(encodingName))
        ivar = bunch.ivar ; encoding = bunch.encoding
    
        # g.trace(bunch.toString())
        setattr(self,ivar,encoding)
    
        if encoding and not g.isValidEncoding(encoding):
            g.es("bad %s: %s" % (encodingName,encoding))
    #@nonl
    #@-node:ekr.20041118104414:initEncoding
    #@-node:ekr.20041118104831.2:configSettings.__init__
    #@+node:ekr.20041118053731:Getters
    def getFontFromParams(self,family,size,slant,weight,defaultSize=12,tag="configSetting"):
        return g.app.config.getFontFromParams(self.c,
            family,size,slant,weight,defaultSize=defaultSize,tag=tag)
    
    def getRecentFiles (self):
        return g.app.config.getRecentFiles(self.c)
    
    def get(self,setting,theType):
        return g.app.config.get(self.c,setting,theType)
    
    def getBool      (self,setting): return g.app.config.getBool     (self.c,setting)
    def getColor     (self,setting): return g.app.config.getColor    (self.c,setting)
    def getDirectory (self,setting): return g.app.config.getDirectory(self.c,setting)
    def getInt       (self,setting): return g.app.config.getInt      (self.c,setting)
    def getFloat     (self,setting): return g.app.config.getFloat    (self.c,setting)
    def getFontDict  (self,setting): return g.app.config.getFontDict (self.c,setting)
    def getLanguage  (self,setting): return g.app.config.getLanguage (self.c,setting)
    def getRatio     (self,setting): return g.app.config.getRatio    (self.c,setting)
    def getShortcut  (self,setting): return g.app.config.getShortcut (self.c,setting)
    def getString    (self,setting): return g.app.config.getString   (self.c,setting)
    #@nonl
    #@-node:ekr.20041118053731:Getters
    #@+node:ekr.20041118195812:Setters...
    #@+node:ekr.20041118195812.3:setRecentFiles (configSettings)
    def setRecentFiles (self,files):
        
        c = self.c
        
        # Append the files to the global list.
        g.app.config.appendToRecentFiles(files)
        
        # Do nothing if there is no @settings tree or no @recent-files node.
        p = g.app.config.findSettingsPosition(c,"@recent-files")
        if not p:
            # g.trace("no @recent-files node for ",c.mFileName)
            return
    
        # g.trace("updating @recent-files for ",c.mFileName)
        
        # Update the @recent-files entry, leaving c's changed status untouched.
        oldText = p.bodyString()
        changed = c.isChanged()
        newText = '\n'.join(files)
        p.setBodyStringOrPane(newText,encoding=g.app.tkEncoding)
        c.setChanged(changed)
        c.undoer.setUndoTypingParams(p,'Clear Recent Files',
            oldText,newText,oldSel=None,newSel=None)
    #@nonl
    #@-node:ekr.20041118195812.3:setRecentFiles (configSettings)
    #@+node:ekr.20041118195812.2:set & setString
    def set (self,p,setting,val):
        
        return g.app.config.setString(self.c,setting,val)
        
    setString = set
    #@nonl
    #@-node:ekr.20041118195812.2:set & setString
    #@-node:ekr.20041118195812:Setters...
    #@-others
#@nonl
#@-node:ekr.20041118104831.1:class configSettings
#@-others
#@nonl
#@-node:ekr.20031218072017.2810:@thin leoCommands.py
#@-leo
