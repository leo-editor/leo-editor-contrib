#@+leo-ver=4-thin
#@+node:ekr.20031218072017.3439:@thin leoPlugins.py
"""Install and run Leo plugins.

On startup:  
- doPlugins() calls loadHandlers() to import all
  mod_XXXX.py files in the Leo directory.

- Imported files should register hook handlers using the
  registerHandler and registerExclusiveHandler functions.
  Only one "exclusive" function is allowed per hook.

After startup:
- doPlugins() calls doHandlersForTag() to handle the hook.
- The first non-None return is sent back to Leo.
"""

#@@language python
#@@tabwidth -4
#@@pagewidth 80

import leoGlobals as g
import glob
import weakref
import java
import java.lang.ref as ref

handlers = {}
loadedModules = {} # Keys are module names, values are modules.
loadingModuleNameStack = [] # The stack of module names.  Top is the module being loaded.

#@+others
#@+node:ekr.20050102094729:callTagHandler
def callTagHandler (bunch,tag,keywords):
    
    handler = bunch.fn ; 
    moduleName = bunch.moduleName
    
    if tag == 'idle':

        # Make sure all commanders exist.
        for key in ('c','old_c','new_c'):
            c = keywords.get(key)
            if c:
                try:
                    if c.frame not in g.app.windowList:
                        return None # c has (or will be) destroyed.
                except AttributeError:
                    # c has been destroyed: c.frame ivar does not exist.
                    return None
                    
    # Calls to registerHandler from inside the handler belong to moduleName.
    global loadingModuleNameStack
    loadingModuleNameStack.append(moduleName)
    result = handler(tag,keywords)
    loadingModuleNameStack.pop()
    return result
#@-node:ekr.20050102094729:callTagHandler
#@+node:ekr.20031218072017.3442:doHandlersForTag
def doHandlersForTag (tag,keywords):
    
    """Execute all handlers for a given tag, in alphabetical order.
    
    All exceptions are caught by the caller, doHook."""

    global handlers

    if g.app.killed:
        return None

    if handlers.has_key(tag):
        bunches = handlers.get(tag)
        # Execute hooks in some random order.
        # Return if one of them returns a non-None result.
        for bunch in bunches:
            val = callTagHandler(bunch,tag,keywords)
            if val is not None:
                return val

    if handlers.has_key("all"):
        bunches = handlers.get('all')
        for bunch in bunches:
            callTagHandler(bunch.fn,tag,keywords)

    return None
#@nonl
#@-node:ekr.20031218072017.3442:doHandlersForTag
#@+node:ekr.20041001161108:doPlugins
def doPlugins(tag,keywords):
    if g.app.killed:
        return
    if tag == "start1":
        loadHandlers()

    return doHandlersForTag(tag,keywords)
#@nonl
#@-node:ekr.20041001161108:doPlugins
#@+node:ekr.20041111124831:getHandlersForTag
def getHandlersForTag(tags):
    
    import types

    if type(tags) in (types.TupleType,types.ListType):
        result = []
        for tag in tags:
            fn = getHandlersForOneTag(tag) 
            result.append((tag,fn),)
        return result
    else:
        return getHandlersForOneTag(tags)

def getHandlersForOneTag (tag):

    global handlers

    bunch = handlers.get(tag)
    return bunch.fn
#@nonl
#@-node:ekr.20041111124831:getHandlersForTag
#@+node:ekr.20041114113029:getPluginModule
def getPluginModule (moduleName):
    
    global loadedModules
    
    return loadedModules.get(moduleName)
#@nonl
#@-node:ekr.20041114113029:getPluginModule
#@+node:ekr.20041001160216:isLoaded
def isLoaded (name):
    
    return name in g.app.loadedPlugins
#@nonl
#@-node:ekr.20041001160216:isLoaded
#@+node:ekr.20031218072017.3440:loadHandlers
def loadHandlers():

    """Load all enabled plugins from the plugins directory"""
    
    plugins_path = g.os_path_join(g.app.loadDir,"..","plugins")
    manager_path = g.os_path_join(plugins_path,"pluginsManager.txt")
    
    files = glob.glob(g.os_path_join(plugins_path,"*.py"))
    #print files
    files = [g.os_path_abspath(theFile) for theFile in files]

    #@    << set enabled_files from pluginsManager.txt >>
    #@+node:ekr.20031218072017.3441:<< set enabled_files from pluginsManager.txt >>
    if not g.os_path_exists(manager_path):
        return
        
    # New in 4.3: The first reference to a plugin in pluginsManager.txt controls.
    enabled_files = []
    disabled_files = []
    try:
        theFile = open(manager_path)
        lines = theFile.readlines()
        for s in lines:
            s = s.strip()
            if s:
                if g.match(s,0,"#"):
                    s = s[1:].strip()
                    # Kludge: ignore comment lines containing a blank or not ending in '.py'.
                    if s and s.find(' ') == -1 and s[-3:] == '.py':
                        path = g.os_path_abspath(g.os_path_join(plugins_path,s))
                        if path not in enabled_files and path not in disabled_files:
                            # print 'disabled',path
                            disabled_files.append(path)
                else:
                    #print g.os_path_join( plugins_path, s )
                    path = g.os_path_abspath(g.os_path_join(plugins_path,s))
                    if path not in enabled_files and path not in disabled_files:
                        # print 'enbled',path
                        enabled_files.append(path)
        theFile.close()
    except IOError:
        g.es("Can not open: " + manager_path)
        # Don't import leoTest initially.  It causes problems.
        import leoTest ; leoTest.fail()
        return
        
    #@-node:ekr.20031218072017.3441:<< set enabled_files from pluginsManager.txt >>
    #@nl
    
    # Load plugins in the order they appear in the enabled_files list.
    if files and enabled_files:
        for theFile in enabled_files:
            if theFile in files:
                loadOnePlugin(theFile)
                
    # Note: g.plugin_signon adds module names to g.app.loadedPlugins 
    if g.app.loadedPlugins:
        g.es("%d plugins loaded" % (len(g.app.loadedPlugins)), color="blue")
#@nonl
#@-node:ekr.20031218072017.3440:loadHandlers
#@+node:ekr.20041113113140:loadOnePlugin
def loadOnePlugin (moduleOrFileName, verbose=False):
    
    global loadedModules
    
    if moduleOrFileName [-3:] == ".py":
        moduleName = moduleOrFileName [:-3]
    else:
        moduleName = moduleOrFileName
    moduleName = g.shortFileName(moduleName)

    if isLoaded(moduleName):
        module = loadedModules.get(moduleName)
        if verbose:
            print 'plugin %s already loaded' % moduleName
        return module

    plugins_path = g.os_path_join(g.app.loadDir,"..","plugins")
    moduleName = g.toUnicode(moduleName,g.app.tkEncoding)
    
    # This import typically results in calls to registerHandler.
    global loadingModuleNameStack
    loadingModuleNameStack.append(moduleName)
    result = g.importFromPath(moduleName,plugins_path)
    if hasattr( result, 'init' ):
        result.init()
    
    loadingModuleNameStack.pop()

    if result:
        loadedModules[moduleName] = result
    
    if verbose:
        if result is None:
            s = 'can not load %s plugin' % moduleName
            print s ; g.es(s,color="blue")
        else:
            print 'loaded %s plugin' % moduleName
    
    return result
#@-node:ekr.20041113113140:loadOnePlugin
#@+node:ekr.20050110191444:printHandlers
def printHandlers (moduleName=None):
    
    if moduleName:
        print 'handlers for %s...' % moduleName
    else:
        print 'all plugin handlers...'

    modules = {}
    for tag in handlers.keys():
        bunches = handlers.get(tag)
        for bunch in bunches:
            name = bunch.moduleName
            tags = modules.get(name,[])
            tags.append(tag)
            modules[name] = tags
    keys = modules.keys()
    keys.sort()
    for key in keys:
        tags = modules.get(key)
        if moduleName in (None,key):
            for tag in tags:
                print '%25s %s' % (tag,key)
#@nonl
#@-node:ekr.20050110191444:printHandlers
#@+node:ekr.20031218072017.3444:registerExclusiveHandler
def registerExclusiveHandler(tags, fn):
    
    """ Register one or more exclusive handlers"""
    
    import types
    
    if type(tags) in (types.TupleType,types.ListType):
        for tag in tags:
            registerOneExclusiveHandler(tag,fn)
    else:
        registerOneExclusiveHandler(tags,fn)
            
def registerOneExclusiveHandler(tag, fn):
    
    """Register one exclusive handler"""
    
    global handlers, loadingModuleNameStack
    try:
        moduleName = loadingModuleNameStack[-1]
    except IndexError:
        moduleName = '<no module>'
    
    if 0:
        if g.app.unitTesting: print
        print '%6s %15s %25s %s' % (g.app.unitTesting,moduleName,tag,fn.__name__)
    
    if g.app.unitTesting: return

    if handlers.has_key(tag):
        g.es("*** Two exclusive handlers for '%s'" % tag)
    else:
        bunch = g.Bunch(fn=fn,moduleName=moduleName,tag='handler')
        handlers = [bunch]
#@nonl
#@-node:ekr.20031218072017.3444:registerExclusiveHandler
#@+node:ekr.20031218072017.3443:registerHandler
def registerHandler(tags,fn ):
    
    """ Register one or more handlers"""

    import types

    if type(tags) in (types.TupleType,types.ListType):
        for tag in tags:
            registerOneHandler(tag,fn)
    else:
        registerOneHandler(tags,fn )

def registerOneHandler(tag,fn ):
    
    """Register one handler"""
    
    global handlers, loadingModuleNameStack
    try:
        moduleName = loadingModuleNameStack[-1]
    except IndexError:
        moduleName = '<no module>'
    
    if 0:
        if g.app.unitTesting: print
        print '%6s %15s %25s %s' % (g.app.unitTesting,moduleName,tag,fn.__name__)

    items = handlers.get(tag,[])
    if fn not in items:
        bunch = g.Bunch(fn=fn,moduleName=moduleName,tag='handler')
        items.append(bunch)
        
    # g.trace(tag) ; g.printList(items)
    handlers[tag] = items
#@nonl
#@-node:ekr.20031218072017.3443:registerHandler
#@+node:ekr.20050110182317:unloadOnePlugin
def unloadOnePlugin (moduleOrFileName,verbose=False):
    
    if moduleOrFileName [-3:] == ".py":
        moduleName = moduleOrFileName [:-3]
    else:
        moduleName = moduleOrFileName
    moduleName = g.shortFileName(moduleName)

    if moduleName in g.app.loadedPlugins:
        if verbose:
            print 'unloading',moduleName
        g.app.loadedPlugins.remove(moduleName)
        
    for tag in handlers.keys():
        bunches = handlers.get(tag)
        bunches = [bunch for bunch in bunches if bunch.moduleName != moduleName]
        handlers[tag] = bunches
#@nonl
#@-node:ekr.20050110182317:unloadOnePlugin
#@+node:ekr.20041111123313:unregisterHandler
def unregisterHandler(tags,fn):
    
    import types

    if type(tags) in (types.TupleType,types.ListType):
        for tag in tags:
            unregisterOneHandler(tag,fn)
    else:
        unregisterOneHandler(tags,fn)

def unregisterOneHandler (tag,fn):

    global handlers
    
    if 1: # New code
        bunches = handlers.get(tag)
        bunches = [bunch for bunch in bunches if bunch.fn != fn]
        handlers[tag] = bunches
    else:
        fn_list = handlers.get(tag)
        if fn_list:
            while fn in fn_list:
                fn_list.remove(fn)
            handlers[tag] = fn_list
            # g.trace(handlers.get(tag))
#@nonl
#@-node:ekr.20041111123313:unregisterHandler
#@-others
#@-node:ekr.20031218072017.3439:@thin leoPlugins.py
#@-leo
