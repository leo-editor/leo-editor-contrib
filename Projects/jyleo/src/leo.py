#! /usr/bin/env python
#@+leo-ver=4-thin
#@+node:ekr.20031218072017.2605:@thin leo.py 
#@@first

"""Entry point for Leo in Python."""

#@@language python   
#@@tabwidth -4   

#@<< Import pychecker >>
#@+node:ekr.20031218072017.2606:<< Import pychecker >>
#@@color

# See pycheckrc file in leoDist.leo for a list of erroneous warnings to be suppressed.

if 0: # Set to 1 for lint-like testing. 

    # Note:  Pychecker presently works only on Python 2.3.

    try:
        import pychecker.checker
        # This works.  We may want to set options here...
        # from pychecker import Config 
        print ; print "Warning: pychecker.checker running..." ; print
    except:
        print ; print 'Can not import pychecker' ; print
#@nonl
#@-node:ekr.20031218072017.2606:<< Import pychecker >>
#@nl

# Suppress import errors.
# This module must do strange things with imports.
__pychecker__ = '--no-import --no-reimportself --no-reimport '

# Warning: do not import any Leo modules here!
# Doing so would make g.app invalid in the imported files.
import os
import string
import sys

#@+others
#@+node:orkman.20050213174452:run & allies
def run(fileName=None,*args,**keywords):
    
    """Initialize and run Leo"""
    
    if not isValidPython(): return
    import java
    java.lang.System.setProperty( "swing.boldMetal", "false" )
    #@    << import leoGlobals and leoApp >>
    #@+node:orkman.20050213174452.1:<< import leoGlobals and leoApp >>
    # Import leoGlobals, but do NOT set g.
    try:
        import leoGlobals
    except ImportError:
        print "Error importing leoGlobals.py"
    
    # Create the application object.
    try:
        import leoApp
        leoGlobals.app = leoApp.LeoApp()
    except ImportError:
        print "Error importing leoApp.py"
        
    # NOW we can set g.
    g = leoGlobals
    assert(g.app)
    #@nonl
    #@-node:orkman.20050213174452.1:<< import leoGlobals and leoApp >>
    #@nl
    #@    << compute directories >>
    #@+node:orkman.20050213174452.2:<< compute directories >>
    
    g.app.loadDir = computeLoadDir()
        # Depends on g.app.tkEncoding: uses utf-8 for now.
    
    g.app.homeDir = computeHomeDir()
    
    g.app.extensionsDir = g.os_path_abspath(
        g.os_path_join(g.app.loadDir,'..','extensions'))
    
    g.app.globalConfigDir = computeGlobalConfigDir()
    
    g.app.testDir = g.os_path_abspath(
        g.os_path_join(g.app.loadDir,'..','test'))
    
    #@-node:orkman.20050213174452.2:<< compute directories >>
    #@nl
    script = getBatchScript() # Do early so we can compute verbose next.
    verbose = script is None

    g.app.setLeoID(verbose=verbose) # Force the user to set g.app.leoID.
    #@    << import leoNodes and leoConfig >>
    #@+node:orkman.20050213174452.3:<< import leoNodes and leoConfig >>
    
    try:
        import leoNodes
    except ImportError:
        print "Error importing leoNodes.py"
    
    try:
        import leoConfig
    except ImportError, ie:
        print ie
        print dir( ie )
        print "Error importing leoConfig.py"
        
    
    #@-node:orkman.20050213174452.3:<< import leoNodes and leoConfig >>
    #@nl
    g.app.nodeIndices = leoNodes.nodeIndices(g.app.leoID)
    g.app.config = leoConfig.config()
    fileName = completeFileName(fileName)
    reportDirectories(verbose)
    g.app.config.readSettingsFiles(fileName,verbose) # Must be done after setting g.app.config.
    g.app.setEncoding()
    g.app.config.use_plugins = 1 #must be set or hooks wont fire
    if script:
        createNullGuiWithScript(script)
        fileName = None
    # Load plugins. Plugins may create g.app.gui.
    g.app.addJarsToPath()
    g.doHook("start1")
    if g.app.killed: return # Support for g.app.forceShutdown.
    # Create the default gui if needed.
    if g.app.gui == None:
        g.app.createSwingGui() # Creates global windows.
    # Initialize tracing and statistics.
    #g.init_sherlock(args)
    #g.clear_stats()
    #@    << start psycho >>
    #@+node:orkman.20050213174452.4:<< start psycho >>
    if g.app and g.app.use_psyco:
        try:
            import psyco
            if 0:
                theFile = r"c:\prog\test\psycoLog.txt"
                g.es("psyco now logging to",theFile,color="blue")
                psyco.log(theFile)
                psyco.profile()
            psyco.full()
            g.es("psyco now running",color="blue")
        except ImportError:
            pass
        except:
            print "unexpected exception importing psyco"
            g.es_exception()
    #@nonl
    #@-node:orkman.20050213174452.4:<< start psycho >>
    #@nl
    # Create the main frame.  Show it and all queued messages.
    c,frame = createFrame(fileName)
    if not frame: return
    if g.app.disableSave:
        g.es("disabling save commands",color="red")
    g.app.writeWaitingLog()
    p = c.currentPosition()
    g.doHook("start2",c=c,p=p,v=p,fileName=fileName)
    #g.enableIdleTimeHook()
    #frame.tree.redraw()
    #frame.body.setFocus()
    g.app.initing = False # "idle" hooks may now call g.app.forceShutdown.
    g.app.gui.runMainLoop()
#@nonl
#@+node:orkman.20050213174452.5:isValidPython
def isValidPython():

    message = """\
Leo requires Python 2.2.1 or higher.
You may download Python from http://python.org/download/
"""
    try:
        # This will fail if True/False are not defined.
        import leoGlobals as g
    except ImportError:
        print "isValidPython: can not import leoGlobals"
        return 0
    except:
        print "isValidPytyhon: unexpected exception: import leoGlobals.py as g"
        import traceback ; traceback.print_exc()
        return 0
    try:
        ok = g.CheckVersion(sys.version, "2.2.1")
        if not ok:
            print message
            g.app.gui.runAskOkDialog("Python version error",message=message,text="Exit")
        return ok
    except:
        print "isValidPython: unexpected exception: g.CheckVersion"
        import traceback ; traceback.print_exc()
        return 0
#@nonl
#@-node:orkman.20050213174452.5:isValidPython
#@+node:orkman.20050213174452.6:completeFileName (leo.py)
def completeFileName (fileName):
    
    import leoGlobals as g
    
    if not fileName:
        return None
        
    # This does not depend on config settings.
    fileName = g.os_path_join(os.getcwd(),fileName)

    head,ext = g.os_path_splitext(fileName)
    if not ext:
        fileName = fileName + ".leo"

    return fileName
#@nonl
#@-node:orkman.20050213174452.6:completeFileName (leo.py)
#@+node:orkman.20050213174452.7:computeGlobalConfigDir
def computeGlobalConfigDir():
    
    # None of these suppresses warning about sys.leo_config_directory
    # __pychecker__ = '--no-objattrs --no-modulo1 --no-moddefvalue'
    
    import leoGlobals as g
    
    encoding = startupEncoding()

    try:
        theDir = sys.leo_config_directory
    except AttributeError:
        theDir = g.os_path_join(g.app.loadDir,"..","config")
        
    if theDir:
        theDir = g.os_path_abspath(theDir)
        
    if (
        not theDir or
        not g.os_path_exists(theDir,encoding) or
        not g.os_path_isdir(theDir,encoding)
    ):
        theDir = None
    
    return theDir
#@nonl
#@-node:orkman.20050213174452.7:computeGlobalConfigDir
#@+node:orkman.20050213174452.8:computeHomeDir
def computeHomeDir():
    
    """Returns the user's home directory."""
    
    import leoGlobals as g

    encoding = startupEncoding()
    dotDir = g.os_path_abspath('./',encoding)
    try: #bombs if there isn't a HOME environment variable set
        home = os.getenv('HOME')#,default=dotDir)
    except:
        home = dotDir
        
    if len(home) > 1 and home[0]=='%' and home[-1]=='%':
	    # Get the indirect reference to the true home.
	    home = os.getenv(home[1:-1],default=dotDir)
    
    home = g.os_path_abspath(home,encoding)
    
    if (
        not home or
        not g.os_path_exists(home,encoding) or
        not g.os_path_isdir(home,encoding)
    ):
        home = None

    return home
#@nonl
#@-node:orkman.20050213174452.8:computeHomeDir
#@+node:orkman.20050213174452.9:computeLoadDir
def computeLoadDir():
    
    """Returns the directory containing leo.py."""
    
    import leoGlobals as g

    try:
        import leo
        encoding = startupEncoding()
        path = g.os_path_abspath(leo.__file__,encoding)
        #path = g.os_path_abspath( leoGlobals.__file__, encoding )
        
        if path:
            loadDir = g.os_path_dirname(path,encoding)
        else: loadDir = None
            
        if (
            not loadDir or
            not g.os_path_exists(loadDir,encoding) or
            not g.os_path_isdir(loadDir,encoding)
        ):
            loadDir = os.getcwd()
            print "Using emergency loadDir:",repr(loadDir)
        
        loadDir = g.os_path_abspath(loadDir,encoding)
        # g.es("load dir: %s" % (loadDir),color="blue")
        return loadDir
    except:
        print "Exception getting load directory"
        import traceback ; traceback.print_exc()
        return None
#@nonl
#@-node:orkman.20050213174452.9:computeLoadDir
#@+node:orkman.20050213174452.10:startupEncoding
def startupEncoding ():
    
    import leoGlobals as g
    import sys
    
    if sys.platform=="win32": # "mbcs" exists only on Windows.
        encoding = "mbcs"
    elif sys.platform=="dawwin":
        encoding = "utf-8"
    else:
        encoding = g.app.tkEncoding
        
    return encoding
#@nonl
#@-node:orkman.20050213174452.10:startupEncoding
#@+node:orkman.20050213174452.11:createFrame (leo.py)
def createFrame (fileName):
    
    """Create a LeoFrame during Leo's startup process."""
    
    import leoGlobals as g
    #import java
    #import java.util.concurrent as concur
    # g.trace(g.app.tkEncoding,fileName)

    # Try to create a frame for the file.
    #class CreateCommander( concur.Callable ):
        
    #    def call( self ):
    if fileName:
        if g.os_path_exists(fileName):
            ok, frame = g.openWithFileName(fileName,None)
            if ok:
                return frame.c,frame
    
            # Create a new frame & indicate it is the startup window.
    c,frame = g.app.gui.newLeoCommanderAndFrame(fileName=fileName)
    frame.setInitialWindowGeometry()
    frame.startupWindow = True
    #        return c, frame
            
    #ft = concur.FutureTask( CreateCommander() )
    #java.awt.EventQueue.invokeAndWait( ft )
    #c,frame = ft.get()
    
    # Report the failure to open the file.
    if fileName:
        g.es("File not found: " + fileName)

    return c,frame
#@-node:orkman.20050213174452.11:createFrame (leo.py)
#@+node:orkman.20050213174452.12:createNullGuiWithScript (leo.py)
def createNullGuiWithScript (script):
    
    import leoGlobals as g
    import leoGui
    
    g.app.batchMode = True
    g.app.gui = leoGui.nullGui("nullGui")
    if not g.app.root:
        g.app.root = g.app.gui.createRootWindow()
    g.app.gui.finishCreate()
    g.app.gui.setScript(script)
#@-node:orkman.20050213174452.12:createNullGuiWithScript (leo.py)
#@+node:orkman.20050213174452.13:getBatchScript
def getBatchScript ():
    
    import leoGlobals as g
    
    name = None ; i = 1 # Skip the dummy first arg.
    while i + 1 < len(sys.argv):
        arg = sys.argv[i].strip().lower()
        if arg in ("--script","-script"):
            name = sys.argv[i+1].strip() ; break
        i += 1

    if not name:
        return None
    name = g.os_path_join(g.app.loadDir,name)
    try:
        f = None
        try:
            f = open(name,'r')
            script = f.read()
            # g.trace("script",script)
        except IOError:
            g.es("can not open script file: " + name, color="red")
            script = None
    finally:
        if f: f.close()
        return script
#@nonl
#@-node:orkman.20050213174452.13:getBatchScript
#@+node:orkman.20050213174452.14:reportDirectories
def reportDirectories(verbose):
    
    import leoGlobals as g
   
    if verbose:
        for kind,theDir in (
            ("global config",g.app.globalConfigDir),
            ("home",g.app.homeDir),
        ):
            g.es("%s dir: %s" % (kind,theDir),color="blue")
#@nonl
#@-node:orkman.20050213174452.14:reportDirectories
#@-node:orkman.20050213174452:run & allies
#@+node:ekr.20031218072017.2607:profile
#@+at 
#@nonl
# To gather statistics, do the following in a Python window, not idle:
# 
#     import leo
#     leo.profile()  (this runs leo)
#     load leoDocs.leo (it is very slow)
#     quit Leo.
#@-at
#@@c

def profile ():
    
    """Gather and print statistics about Leo"""

    import profile, pstats
    
    name = "c:/prog/test/leoProfile.txt"
    profile.run('leo.run()',name)

    p = pstats.Stats(name)
    p.strip_dirs()
    p.sort_stats('cum','file','name')
    p.print_stats()
#@nonl
#@-node:ekr.20031218072017.2607:profile
#@-others

if __name__ == "__main__":
    if len(sys.argv) > 1:
        if sys.platform=="win32": # Windows
            fileName = string.join(sys.argv[1:],' ')
        else:
            fileName = sys.argv[1]
        run(fileName)
    else:
        run()
#@nonl
#@-node:ekr.20031218072017.2605:@thin leo.py 
#@-leo
