# -*- coding: utf-8 -*-
#@+leo-ver=4-thin
#@+node:ekr.20031218072017.3093:@thin leoGlobals.py
#@@first

"""Global constants, variables and utility functions used throughout Leo."""

#@@language python  
#@@tabwidth -4
#@@pagewidth 80

from __future__ import generators # To make the code work in Python 2.2.

import leoGlobals as g # So code can use g below.

if 0: # Don't import this here: it messes up Leo's startup code.
    import leoTest

import exceptions
import os
import string
import sys
import time
import traceback
import types
import java.lang.System as jsys   

#@<< define general constants >>
#@+node:ekr.20031218072017.3094:<< define general constants >>
body_newline = '\n'
body_ignored_newline = '\r'
#@nonl
#@-node:ekr.20031218072017.3094:<< define general constants >>
#@nl
#@<< define global data structures >>
#@+node:EKR.20040610094819:<< define global data structures >>
# Visible externally so plugins may add to the list of directives.

globalDirectiveList = [
    "color", "comment", "encoding", "header", "ignore", "killcolor",
    "language", "lineending", "nocolor", "noheader", "nowrap",
    "pagewidth", "path", "quiet", "root", "silent",
    "tabwidth", "terse", "unit", "verbose", "wrap"]
#@nonl
#@-node:EKR.20040610094819:<< define global data structures >>
#@nl

app = None # The singleton app object.

#@+others
#@+node:zorcanda!.20050922122429:g.createStandAloneApp
def createStandAloneApp(pluginName=''):
    
    '''Create a version of the g.app object for 'stand-alone' plugins.'''
    
    if not g.app:
        #Tk = g.importExtension('Tkinter',pluginName=pluginName,verbose=True)
        if 1:
            import leoApp, leoGui
            g.app = leoApp.LeoApp()
            #g.app.root = Tk.Tk()
            g.app.gui = leoGui.nullGui('<stand-alone app gui>')
            g.computeStandardDirectories()
    return g.app
#@nonl
#@-node:zorcanda!.20050922122429:g.createStandAloneApp
#@+node:ekr.20031218072017.3095:Checking Leo Files...
#@+node:ekr.20031218072017.822:createTopologyList
def createTopologyList (c=None,root=None,useHeadlines=False):
    
    """Creates a list describing a node and all its descendents"""
    
    if not c: c = g.top()
    if not root: root = c.rootVnode()
    v = root
    if useHeadlines:
        aList = [(v.numberOfChildren(),v.headString()),]
    else:
        aList = [v.numberOfChildren()]
    child = v.firstChild()
    while child:
        aList.append(g.createTopologyList(c,child,useHeadlines))
        child = child.next()
    return aList
#@nonl
#@-node:ekr.20031218072017.822:createTopologyList
#@-node:ekr.20031218072017.3095:Checking Leo Files...
#@+node:ekr.20031218072017.3099:Commands & Directives
#@+node:ekr.20031218072017.1380:Directive utils...
#@+node:EKR.20040504150046.4:g.comment_delims_from_extension
def comment_delims_from_extension(filename):
    
    """
    Return the comment delims corresponding to the filename's extension.

    >>> g.comment_delims_from_extension(".py")
    ('#', None, None)

    >>> g.comment_delims_from_extension(".c")
    ('//', '/*', '*/')
    
    >>> g.comment_delims_from_extension(".html")
    (None, '<!--', '-->')

    """

    root, ext = os.path.splitext(filename)
    if ext == '.tmp':
        root, ext = os.path.splitext(root)
        
    language = g.app.extension_dict.get(ext[1:])
    if ext:
        
        return g.set_delims_from_language(language)
    else:
        g.trace("unknown extension %s" % ext)
        return None,None,None
#@nonl
#@-node:EKR.20040504150046.4:g.comment_delims_from_extension
#@+node:ekr.20031218072017.1381:@language and @comment directives (leoUtils)
#@+node:ekr.20031218072017.1382:set_delims_from_language
# Returns a tuple (single,start,end) of comment delims

def set_delims_from_language(language):

    val = app.language_delims_dict.get(language)
    if val:
        delim1,delim2,delim3 = g.set_delims_from_string(val)
        if delim2 and not delim3:
            return None,delim1,delim2
        else: # 0,1 or 3 params.
            return delim1,delim2,delim3
    else:
        return None, None, None # Indicate that no change should be made
#@-node:ekr.20031218072017.1382:set_delims_from_language
#@+node:ekr.20031218072017.1383:set_delims_from_string
def set_delims_from_string(s):

    """Returns (delim1, delim2, delim2), the delims following the @comment directive.
    
    This code can be called from @languge logic, in which case s can point at @comment"""

    # Skip an optional @comment
    tag = "@comment"
    i = 0
    if g.match_word(s,i,tag):
        i += len(tag)
        
    count = 0 ; delims = [None, None, None]
    while count < 3 and i < len(s):
        i = j = g.skip_ws(s,i)
        while i < len(s) and not g.is_ws(s[i]) and not g.is_nl(s,i):
            i += 1
        if j == i: break
        delims[count] = s[j:i]
        count += 1
        
    # 'rr 09/25/02
    if count == 2: # delims[0] is always the single-line delim.
        delims[2] = delims[1]
        delims[1] = delims[0]
        delims[0] = None

    # 7/8/02: The "REM hack": replace underscores by blanks.
    # 9/25/02: The "perlpod hack": replace double underscores by newlines.
    for i in xrange(0,3):
        if delims[i]:
            delims[i] = string.replace(delims[i],"__",'\n') 
            delims[i] = string.replace(delims[i],'_',' ')

    return delims[0], delims[1], delims[2]
#@nonl
#@-node:ekr.20031218072017.1383:set_delims_from_string
#@+node:ekr.20031218072017.1384:set_language
def set_language(s,i,issue_errors_flag=False):
    
    """Scan the @language directive that appears at s[i:].

    Returns (language, delim1, delim2, delim3)
    """

    tag = "@language"
    # g.trace(g.get_line(s,i))
    assert(i != None)
    assert(g.match_word(s,i,tag))
    i += len(tag) ; i = g.skip_ws(s, i)
    # Get the argument.
    j = i ; i = g.skip_c_id(s,i)
    # Allow tcl/tk.
    arg = string.lower(s[j:i])
    if app.language_delims_dict.get(arg):
        language = arg
        delim1, delim2, delim3 = g.set_delims_from_language(language)
        return language, delim1, delim2, delim3
    
    if issue_errors_flag:
        g.es("ignoring: " + g.get_line(s,i))

    return None, None, None, None,
#@nonl
#@-node:ekr.20031218072017.1384:set_language
#@-node:ekr.20031218072017.1381:@language and @comment directives (leoUtils)
#@+node:ekr.20031218072017.1385:findReference
#@+at 
#@nonl
# We search the descendents of v looking for the definition node matching 
# name.
# There should be exactly one such node (descendents of other definition nodes 
# are not searched).
#@-at
#@@c

def findReference(name,root):

    for p in root.subtree_iter():
        assert(not p==root) #changed from p!=root
        if p.matchHeadline(name) and not p.isAtIgnoreNode():
            return p

    # g.trace("not found:",name,root)
    return root.c.nullPosition()
#@nonl
#@-node:ekr.20031218072017.1385:findReference
#@+node:ekr.20031218072017.1260:get_directives_dict & globalDirectiveList
# The caller passes [root_node] or None as the second arg.  This allows us to distinguish between None and [None].

def get_directives_dict(s,root=None):
    
    """Scans root for @directives found in globalDirectivesList.

    Returns a dict containing pointers to the start of each directive"""

    if root: root_node = root[0]
    dict = {}
    i = 0 ; n = len(s)
    while i < n:
        if s[i] == '@' and i+1 < n:
            #@            << set dict for @ directives >>
            #@+node:ekr.20031218072017.1261:<< set dict for @ directives >>
            j = g.skip_c_id(s,i+1)
            word = s[i+1:j]
            if word in g.globalDirectiveList:
                if dict.has_key(word):
                    # Ignore second value.
                    pass
                    # g.es("Warning: conflicting values for %s" % (word), color="blue")
                else:
                    dict [word] = i
            #@nonl
            #@-node:ekr.20031218072017.1261:<< set dict for @ directives >>
            #@nl
        elif root and g.match(s,i,"<<"):
            #@            << set dict["root"] for noweb * chunks >>
            #@+node:ekr.20031218072017.1262:<< set dict["root"] for noweb * chunks >>
            #@+at 
            #@nonl
            # The following looks for chunk definitions of the form < < * > > 
            # =. If found, we take this to be equivalent to @root filename if 
            # the headline has the form @root filename.
            #@-at
            #@@c
            
            i = g.skip_ws(s,i+2)
            if i < n and s[i] == '*' :
                i = g.skip_ws(s,i+1) # Skip the '*'
                if g.match(s,i,">>="):
                    # < < * > > = implies that @root should appear in the headline.
                    i += 3
                    if root_node:
                        dict["root"]=0 # value not immportant
                    else:
                        g.es(g.angleBrackets("*") + "= requires @root in the headline")
            #@nonl
            #@-node:ekr.20031218072017.1262:<< set dict["root"] for noweb * chunks >>
            #@nl
        i = g.skip_line(s,i)
    return dict
#@nonl
#@-node:ekr.20031218072017.1260:get_directives_dict & globalDirectiveList
#@+node:ekr.20031218072017.1386:getOutputNewline
def getOutputNewline (c=None,name=None):
    
    '''Convert the name of a line ending to the line ending itself.
    
    Priority:
    - Use name if name given
    - Use c.config.output_newline if c given,
    - Otherwise use g.app.config.output_newline.'''
    
    if name: s = name
    elif c:  s = c.config.output_newline
    else:    s = app.config.output_newline

    if not s: s = ''
    s = s.lower()
    if s in ( "nl","lf"): s = '\n'
    elif s == "cr": s = '\r'
    elif s == "platform": s = os.linesep  # 12/2/03: emakital
    elif s == "crlf": s = "\r\n"
    else: s = '\n' # Default for erroneous values.
    return s
#@nonl
#@-node:ekr.20031218072017.1386:getOutputNewline
#@+node:ekr.20031218072017.1387:scanAtEncodingDirective
def scanAtEncodingDirective(s,dict):
    
    """Scan the @encoding directive at s[dict["encoding"]:].

    Returns the encoding name or None if the encoding name is invalid.
    """

    k = dict["encoding"]
    i = g.skip_to_end_of_line(s,k)
    j = len("@encoding")
    encoding = s[k+j:i].strip()
    if g.isValidEncoding(encoding):
        # g.trace(encoding)
        return encoding
    else:
        g.es("invalid @encoding:"+encoding,color="red")
        return None
#@nonl
#@-node:ekr.20031218072017.1387:scanAtEncodingDirective
#@+node:ekr.20031218072017.1388:scanAtLineendingDirective
def scanAtLineendingDirective(s,dict):
    
    """Scan the @lineending directive at s[dict["lineending"]:].

    Returns the actual lineending or None if the name of the lineending is invalid.
    """

    k = dict["lineending"]
    i = g.skip_to_end_of_line(s,k)
    j = len("@lineending")
    j = g.skip_ws(s,j)
    e = s[k+j:i].strip()

    if e in ("cr","crlf","lf","nl","platform"):
        lineending = g.getOutputNewline(name=e)
        # g.trace(e,lineending)
        return lineending
    else:
        # g.es("invalid @lineending directive:"+e,color="red")
        return None
#@nonl
#@-node:ekr.20031218072017.1388:scanAtLineendingDirective
#@+node:ekr.20031218072017.1389:scanAtPagewidthDirective
def scanAtPagewidthDirective(s,dict,issue_error_flag=False):
    
    """Scan the @pagewidth directive at s[dict["pagewidth"]:].

    Returns the value of the width or None if the width is invalid.
    """
    
    k = dict["pagewidth"]
    j = i = k + len("@pagewidth")
    i, val = g.skip_long(s,i)
    if val != None and val > 0:
        # g.trace(val)
        return val
    else:
        if issue_error_flag:
            j = g.skip_to_end_of_line(s,k)
            g.es("ignoring " + s[k:j],color="red")
        return None
#@-node:ekr.20031218072017.1389:scanAtPagewidthDirective
#@+node:ekr.20031218072017.1390:scanAtTabwidthDirective
def scanAtTabwidthDirective(s,dict,issue_error_flag=False):
    
    """Scan the @tabwidth directive at s[dict["tabwidth"]:].

    Returns the value of the width or None if the width is invalid.
    """
    
    k = dict["tabwidth"]
    i = k + len("@tabwidth")
    i, val = g.skip_long(s, i)
    if val != None and val != 0:
        # g.trace(val)
        return val
    else:
        if issue_error_flag:
            i = g.skip_to_end_of_line(s,k)
            g.es("Ignoring " + s[k:i],color="red")
        return None

#@-node:ekr.20031218072017.1390:scanAtTabwidthDirective
#@+node:ekr.20040715155607:scanForAtIgnore
def scanForAtIgnore(c,p):
    
    """Scan position p and its ancestors looking for @ignore directives."""
    
    language = c.target_language

    if c is None or g.top() is None:
        return False # For unit tests.

    for p in p.self_and_parents_iter():
        s = p.bodyString()
        d = g.get_directives_dict(s)
        if d.has_key("ignore"):
            return True

    return False
#@nonl
#@-node:ekr.20040715155607:scanForAtIgnore
#@+node:ekr.20040712084911.1:scanForAtLanguage
def scanForAtLanguage(c,p):
    
    """Scan position p and p's ancestors looking only for @language and @ignore directives.

    Returns the language found, or c.target_language."""
    
    # Unlike the code in x.scanAllDirectives, this code ignores @comment directives.

    if c and p:
        for p in p.self_and_parents_iter():
            s = p.bodyString()
            d = g.get_directives_dict(s)
            if d.has_key("language"):
                k = d["language"]
                language,delim1,delim2,delim3 = g.set_language(s,k)
                return language # Continue looking for @ignore
    if not hasattr( c, 'target_language' ):
        c.target_language = None
    return c.target_language
#@nonl
#@-node:ekr.20040712084911.1:scanForAtLanguage
#@+node:ekr.20031218072017.1391:scanDirectives (utils)
#@+at 
#@nonl
# Perhaps this routine should be the basis of atFile.scanAllDirectives and 
# tangle.scanAllDirectives, but I am loath to make any further to these two 
# already-infamous routines.  Also, this code does not check for @color and 
# @nocolor directives: leoColor.useSyntaxColoring does that.
#@-at
#@@c

def scanDirectives(c,p=None):
    
    """Scan vnode v and v's ancestors looking for directives.

    Returns a dict containing the results, including defaults."""

    if c == None or g.top() == None:
        return {} # For unit tests.
    if p is None:
        p = c.currentPosition()

    #@    << Set local vars >>
    #@+node:ekr.20031218072017.1392:<< Set local vars >>
    page_width = c.page_width
    tab_width  = c.tab_width
    language = c.target_language
    delim1, delim2, delim3 = g.set_delims_from_language(c.target_language)
    path = None
    encoding = None # 2/25/03: This must be none so that the caller can set a proper default.
    lineending = g.getOutputNewline(c=c) # Init from config settings.
    wrap = c.config.getBool("body_pane_wraps")
    #@nonl
    #@-node:ekr.20031218072017.1392:<< Set local vars >>
    #@nl
    old = {}
    pluginsList = [] # 5/17/03: a list of items for use by plugins.
    for p in p.self_and_parents_iter():
        s = p.v.t.bodyString
        dict = g.get_directives_dict(s)
        #@        << Test for @comment and @language >>
        #@+node:ekr.20031218072017.1393:<< Test for @comment and @language >>
        # 1/23/05: Any previous @language or @comment prevents processing up the tree.
        # This code is now like the code in tangle.scanAlldirectives.
        
        if old.has_key("comment") or old.has_key("language"):
            pass
        
        elif dict.has_key("comment"):
            k = dict["comment"]
            delim1,delim2,delim3 = g.set_delims_from_string(s[k:])
        
        elif dict.has_key("language"):
            k = dict["language"]
            language,delim1,delim2,delim3 = g.set_language(s,k)
        #@nonl
        #@-node:ekr.20031218072017.1393:<< Test for @comment and @language >>
        #@nl
        #@        << Test for @encoding >>
        #@+node:ekr.20031218072017.1394:<< Test for @encoding >>
        if not old.has_key("encoding") and dict.has_key("encoding"):
            
            e = g.scanAtEncodingDirective(s,dict)
            if e:
                encoding = e
        #@-node:ekr.20031218072017.1394:<< Test for @encoding >>
        #@nl
        #@        << Test for @lineending >>
        #@+node:ekr.20031218072017.1395:<< Test for @lineending >>
        if not old.has_key("lineending") and dict.has_key("lineending"):
            
            e = g.scanAtLineendingDirective(s,dict)
            if e:
                lineending = e
        #@-node:ekr.20031218072017.1395:<< Test for @lineending >>
        #@nl
        #@        << Test for @pagewidth >>
        #@+node:ekr.20031218072017.1396:<< Test for @pagewidth >>
        if dict.has_key("pagewidth") and not old.has_key("pagewidth"):
            
            w = g.scanAtPagewidthDirective(s,dict)
            if w and w > 0:
                page_width = w
        #@nonl
        #@-node:ekr.20031218072017.1396:<< Test for @pagewidth >>
        #@nl
        #@        << Test for @path >>
        #@+node:ekr.20031218072017.1397:<< Test for @path >>
        if not path and not old.has_key("path") and dict.has_key("path"):
        
            k = dict["path"]
            #@    << compute relative path from s[k:] >>
            #@+node:ekr.20031218072017.1398:<< compute relative path from s[k:] >>
            j = i = k + len("@path")
            i = g.skip_to_end_of_line(s,i)
            path = string.strip(s[j:i])
            
            # Remove leading and trailing delims if they exist.
            if len(path) > 2 and (
                (path[0]=='<' and path[-1] == '>') or
                (path[0]=='"' and path[-1] == '"') ):
                path = path[1:-1]
            
            path = string.strip(path)
            if 0: # 11/14/02: we want a _relative_ path, not an absolute path.
                path = g.os_path_join(app.loadDir,path)
            #@nonl
            #@-node:ekr.20031218072017.1398:<< compute relative path from s[k:] >>
            #@nl
            if path and len(path) > 0:
                base = g.getBaseDirectory(c=c) # returns "" on error.
                path = g.os_path_join(base,path)
                
        #@nonl
        #@-node:ekr.20031218072017.1397:<< Test for @path >>
        #@nl
        #@        << Test for @tabwidth >>
        #@+node:ekr.20031218072017.1399:<< Test for @tabwidth >>
        if dict.has_key("tabwidth") and not old.has_key("tabwidth"):
            
            w = g.scanAtTabwidthDirective(s,dict)
            if w and w != 0:
                tab_width = w
        #@nonl
        #@-node:ekr.20031218072017.1399:<< Test for @tabwidth >>
        #@nl
        #@        << Test for @wrap and @nowrap >>
        #@+node:ekr.20031218072017.1400:<< Test for @wrap and @nowrap >>
        if not old.has_key("wrap") and not old.has_key("nowrap"):
            
            if dict.has_key("wrap"):
                wrap = True
            elif dict.has_key("nowrap"):
                wrap = False
        #@nonl
        #@-node:ekr.20031218072017.1400:<< Test for @wrap and @nowrap >>
        #@nl
        g.doHook("scan-directives",c=c,p=p,v=p,s=s,
            old_dict=old,dict=dict,pluginsList=pluginsList)
        old.update(dict)

    if path == None: path = g.getBaseDirectory(c=c)

    return {
        "delims"    : (delim1,delim2,delim3),
        "encoding"  : encoding,
        "language"  : language,
        "lineending": lineending,
        "pagewidth" : page_width,
        "path"      : path,
        "tabwidth"  : tab_width,
        "pluginsList": pluginsList,
        "wrap"      : wrap }
#@nonl
#@-node:ekr.20031218072017.1391:scanDirectives (utils)
#@+node:ekr.20041123094807:g.scanForAtSettings
def scanForAtSettings(p):
    
    """Scan position p and its ancestors looking for @settings nodes."""
    
    for p in p.self_and_parents_iter():
        h = p.headString()
        h = g.app.config.canonicalizeSettingName(h)
        if h.startswith("@settings"):
            return True

    return False
#@nonl
#@-node:ekr.20041123094807:g.scanForAtSettings
#@-node:ekr.20031218072017.1380:Directive utils...
#@+node:ekr.20031218072017.2052:g.openWithFileName
#@+at
# def 
# openWithFileName(fileName,old_c,enableLog=True,readAtFileNodesFlag=True):
#     """Create a Leo Frame for the indicated fileName if the file exists."""
# 
#     if not fileName or len(fileName) == 0:
#         return False, None
# 
#     # Create a full normalized path name.
#     # Display the file name with case intact.
#     if 1: # New code, also appears to work.
#         fileName = g.os_path_abspath(fileName)
#     else: # Old code, works.
#         fileName = g.os_path_join(os.getcwd(),fileName)
# 
#     fileName = g.os_path_normpath(fileName)
#     oldFileName = fileName
#     fileName = g.os_path_normcase(fileName)
# 
#     # If the file is already open just bring its window to the front.
#     list = app.windowList
#     for frame in list:
#         fn = g.os_path_normcase(frame.c.mFileName)
#         fn = g.os_path_normpath(fn)
#         if fileName == fn:
#             frame.deiconify()
#             app.setLog(frame.log,"openWithFileName")
#             # g.es("This window already open")
#             return True, frame
#     fileName = oldFileName # Use the idiosyncratic file name.
# 
#     try:
#         # Open the file in binary mode to allow 0x1a in bodies & headlines.
#         theFile = open(fileName,'rb')
#         if theFile:
#             c,frame = app.gui.newLeoCommanderAndFrame(fileName)
#             frame.log.enable(enableLog)
#             if not g.doHook("open1",old_c=old_c,new_c=c,fileName=fileName):
#                 app.setLog(frame.log,"openWithFileName")
#                 app.lockLog()
# frame.c.fileCommands.open(theFile,fileName,readAtFileNodesFlag=readAtFileNodesFlag) 
# # closes file.
#                 app.unlockLog()
#                 for frame in g.app.windowList:
#                     # The recent files list has been updated by 
# menu.updateRecentFiles.
#                     frame.c.config.setRecentFiles(g.app.config.recentFiles)
#             frame.openDirectory = g.os_path_dirname(fileName)
#             g.doHook("open2",old_c=old_c,new_c=frame.c,fileName=fileName)
#             return True, frame
#         else:
#             g.es("can not open: " + fileName,color="red")
#             return False, None
#     except IOError:
#         g.es("can not open: " + fileName, color="blue")
#         return False, None
#     except:
#         if 1:
#             print "exceptions opening:", fileName
#             traceback.print_exc()
#         else:
#             g.es("exceptions opening: " + fileName,color="red")
#             g.es_exception()
#         return False, None
#@-at
#@@c
def openWithFileName(fileName,old_c,enableLog=True,readAtFileNodesFlag=True):
    
    """Create a Leo Frame for the indicated fileName if the file exists."""

    if not fileName or len(fileName) == 0:
        return False, None
        
    def munge(name):
        name = name or ''
        return g.os_path_normpath(name).lower()

    # Create a full, normalized, Unicode path name, preserving case.
    fileName = g.os_path_normpath(g.os_path_abspath(fileName))

    # If the file is already open just bring its window to the front.
    theList = app.windowList
    for frame in theList:
        if munge(fileName) == munge(frame.c.mFileName):
            frame.bringToFront()
            app.setLog(frame.log,"openWithFileName")
            # g.es("This window already open")
            return True, frame
    try:
        # Open the file in binary mode to allow 0x1a in bodies & headlines.
        theFile = open(fileName,'rb')
        c,frame = app.gui.newLeoCommanderAndFrame(fileName)
        frame.log.enable(enableLog)
        g.app.writeWaitingLog() # New in 4.3: write queued log first.
        if not g.doHook("open1",old_c=old_c,c=c,new_c=c,fileName=fileName):
            app.setLog(frame.log,"openWithFileName")
            app.lockLog()
            frame.c.fileCommands.open(
                theFile,fileName,
                readAtFileNodesFlag=readAtFileNodesFlag) # closes file.
            app.unlockLog()
            for frame in g.app.windowList:
                # The recent files list has been updated by menu.updateRecentFiles.
                frame.c.config.setRecentFiles(g.app.config.recentFiles)
        frame.openDirectory = g.os_path_dirname(fileName)
        g.doHook("open2",old_c=old_c,c=c,new_c=frame.c,fileName=fileName)
        return True, frame
    except IOError:
        # Do not use string + here: it will fail for non-ascii strings!
        if not g.app.unitTesting:
            g.es("can not open: %s" % (fileName), color="blue")
        return False, None
    except Exception:
        g.es("exceptions opening: %s" % (fileName),color="red")
        g.es_exception()
        return False, None
#@-node:ekr.20031218072017.2052:g.openWithFileName
#@+node:ekr.20031218072017.3100:wrap_lines
#@+at 
#@nonl
# Important note: this routine need not deal with leading whitespace.  
# Instead, the caller should simply reduce pageWidth by the width of leading 
# whitespace wanted, then add that whitespace to the lines returned here.
# 
# The key to this code is the invarient that line never ends in whitespace.
#@-at
#@@c

def wrap_lines (lines,pageWidth,firstLineWidth=None):

    """Returns a list of lines, consisting of the input lines wrapped to the given pageWidth."""

    if pageWidth < 10:
        pageWidth = 10
        
    # DTHEIN 3-NOV-2002: First line is special
    if not firstLineWidth:
        firstLineWidth = pageWidth
    if firstLineWidth < 10:
        firstLineWidth = 10
    outputLineWidth = firstLineWidth

    # g.trace(lines)
    result = [] # The lines of the result.
    line = "" # The line being formed.  It never ends in whitespace.
    for s in lines:
        i = 0
        while i < len(s):
            assert(len(line) <= outputLineWidth) # DTHEIN 18-JAN-2004
            j = g.skip_ws(s,i)   # ;   ws = s[i:j]
            k = g.skip_non_ws(s,j) ; word = s[j:k]
            assert(k>i)
            i = k
            # DTHEIN 18-JAN-2004: wrap at exactly the text width, 
            # not one character less
            # 
            wordLen = len(word)
            if len(line) > 0 and wordLen > 0: wordLen += len(" ")
            if wordLen + len(line) <= outputLineWidth:
                if wordLen > 0:
                    #@                    << place blank and word on the present line >>
                    #@+node:ekr.20031218072017.3101:<< place blank and word on the present line >>
                    if len(line) == 0:
                        # Just add the word to the start of the line.
                        line = word
                    else:
                        # Add the word, preceeded by a blank.
                        line = " ".join([line,word]) # DTHEIN 18-JAN-2004: better syntax
                    #@nonl
                    #@-node:ekr.20031218072017.3101:<< place blank and word on the present line >>
                    #@nl
                else: pass # discard the trailing whitespace.
            else:
                #@                << place word on a new line >>
                #@+node:ekr.20031218072017.3102:<< place word on a new line >>
                # End the previous line.
                if len(line) > 0:
                    result.append(line)
                    outputLineWidth = pageWidth # DTHEIN 3-NOV-2002: width for remaining lines
                    
                # Discard the whitespace and put the word on a new line.
                line = word
                
                # Careful: the word may be longer than pageWidth.
                if len(line) > pageWidth: # DTHEIN 18-JAN-2004: line can equal pagewidth
                    result.append(line)
                    outputLineWidth = pageWidth # DTHEIN 3-NOV-2002: width for remaining lines
                    line = ""
                #@-node:ekr.20031218072017.3102:<< place word on a new line >>
                #@nl
    if len(line) > 0:
        result.append(line)
    # g.trace(result)
    return result
#@nonl
#@-node:ekr.20031218072017.3100:wrap_lines
#@+node:zorcanda!.20050922122558:Compute directories... (leoGlobals)
#@+node:zorcanda!.20050922122558.1:computeGlobalConfigDir
def computeGlobalConfigDir():
    
    # None of these suppresses warning about sys.leo_config_directory
    # __pychecker__ = '--no-objattrs --no-modulo1 --no-moddefvalue'
    
    import leoGlobals as g
    
    encoding = g.startupEncoding()

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
#@-node:zorcanda!.20050922122558.1:computeGlobalConfigDir
#@+node:zorcanda!.20050922122558.2:computeHomeDir
def computeHomeDir():
    
    """Returns the user's home directory."""
    
    import leoGlobals as g

    encoding = g.startupEncoding()
    # dotDir = g.os_path_abspath('./',encoding)
    try:
        home = os.getenv('HOME')#,default=None)
    except:
        home = None

    if home and len(home) > 1 and home[0]=='%' and home[-1]=='%':
	    # Get the indirect reference to the true home.
	    home = os.getenv(home[1:-1],default=None)

    if home:
        # N.B. This returns the _working_ directory if home is None!
        # This was the source of the 4.3 .leoID.txt problems.
        home = g.os_path_abspath(home,encoding)
        if (
            not g.os_path_exists(home,encoding) or
            not g.os_path_isdir(home,encoding)
        ):
            home = None

    # g.trace(home)
    return home
#@nonl
#@-node:zorcanda!.20050922122558.2:computeHomeDir
#@+node:zorcanda!.20050922122558.3:computeLoadDir
def computeLoadDir():
    
    """Returns the directory containing leo.py."""
    
    import leoGlobals as g

    try:
        import leo
        import sys
        
        # Fix a hangnail: on Windows the drive letter returned by
        # __file__ is randomly upper or lower case!
        # The made for an ugly recent files list.
        path = leo.__file__
        if sys.platform=='win32':
            if len(path) > 2 and path[1]==':':
                # Convert the drive name to upper case.
                path = path[0].upper() + path[1:]
        encoding = g.startupEncoding()
        path = g.os_path_abspath(path,encoding)
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
#@-node:zorcanda!.20050922122558.3:computeLoadDir
#@+node:zorcanda!.20050922122558.4:computeStandardDirectories
def computeStandardDirectories():
    
    '''Set g.app.loadDir, g.app.homeDir and g.app.globalConfigDir.'''
    
    g.app.loadDir = g.computeLoadDir()
        # Depends on g.app.tkEncoding: uses utf-8 for now.
    
    g.app.homeDir = g.computeHomeDir()
    
    g.app.extensionsDir = g.os_path_abspath(
        g.os_path_join(g.app.loadDir,'..','extensions'))
    
    g.app.globalConfigDir = g.computeGlobalConfigDir()
    
    g.app.testDir = g.os_path_abspath(
        g.os_path_join(g.app.loadDir,'..','test'))
        
    g.app.user_xresources_path = g.os_path_join(g.app.homeDir,'.leo_xresources')
#@nonl
#@-node:zorcanda!.20050922122558.4:computeStandardDirectories
#@+node:zorcanda!.20050922122558.5:startupEncoding
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
#@-node:zorcanda!.20050922122558.5:startupEncoding
#@-node:zorcanda!.20050922122558:Compute directories... (leoGlobals)
#@-node:ekr.20031218072017.3099:Commands & Directives
#@+node:ekr.20031218072017.3104:Debugging, Dumping, Timing, Tracing & Sherlock
#@+node:ekr.20031218072017.3105:alert
def alert(message):

    g.es(message)

    #import tkMessageBox CHANGED: there is no TK in JyLeo
    #tkMessageBox.showwarning("Alert", message)
    import javax.swing as swing
    jop = swing.JOptionPane
    jop.showMessageDialog( None, message, "Alert", jop.WARNING_MESSAGE )
    
#@nonl
#@-node:ekr.20031218072017.3105:alert
#@+node:ekr.20031218072017.3107:callerName
def callerName (n=1):

    try: # get the function name from the call stack.
        f1 = sys._getframe(n) # The stack frame, n levels up.
        code1 = f1.f_code # The code object
        return code1.co_name # The code name
    except:
        g.es_exception()
        return "<no caller name>"
#@-node:ekr.20031218072017.3107:callerName
#@+node:ekr.20041105091148:pdb
def pdb ():
    
    """Fall into pdb."""
    
    import pdb
    
    pdb.set_trace()
#@nonl
#@-node:ekr.20041105091148:pdb
#@+node:ekr.20031218072017.3108:Dumps
#@+node:ekr.20031218072017.3109:dump
def dump(s):
    
    out = ""
    for i in s:
        out += str(ord(i)) + ","
    return out
        
def oldDump(s):

    out = ""
    for i in s:
        if i=='\n':
            out += "[" ; out += "n" ; out += "]"
        if i=='\t':
            out += "[" ; out += "t" ; out += "]"
        elif i==' ':
            out += "[" ; out += " " ; out += "]"
        else: out += i
    return out
#@nonl
#@-node:ekr.20031218072017.3109:dump
#@+node:ekr.20031218072017.3110:es_error
def es_error (s,color=None):

    if color is None and g.app.config: # May not exist during initialization.
        color = g.app.config.getColor(None,"log_error_color")
        g.es(s,color=color)
    else:
        g.es(s)
#@nonl
#@-node:ekr.20031218072017.3110:es_error
#@+node:ekr.20031218072017.3111:es_event_exception
def es_event_exception (eventName,full=False):

    g.es("exception handling ", eventName, " event")
    typ,val,tb = sys.exc_info()

    if full:
        errList = traceback.format_exception(typ,val,tb)
    else:
        errList = traceback.format_exception_only(typ,val)

    for i in errList:
        g.es(i)
        
    if not g.stdErrIsRedirected(): # 2/16/04
        traceback.print_exc()
#@nonl
#@-node:ekr.20031218072017.3111:es_event_exception
#@+node:ekr.20031218072017.3112:es_exception
def es_exception (full=True,c=None,color="red"):
    
    typ,val,tb = sys.exc_info()
    
    full = full or g.app.debugSwitch > 0

    if full: lines = traceback.format_exception(typ,val,tb)
    else:    lines = traceback.format_exception_only(typ,val)
        
    fileName,n = g.getLastTracebackFileAndLineNumber()

    for line in lines:
        g.es_error(line,color=color)
        if not g.stdErrIsRedirected():
            print line
            
    if g.app.debugSwitch > 1:
        import pdb ; pdb.set_trace()

    return fileName,n
#@nonl
#@-node:ekr.20031218072017.3112:es_exception
#@+node:ekr.20040731204831:getLastTracebackFileAndLineNumber
def getLastTracebackFileAndLineNumber():
    
    typ,val,tb = sys.exc_info()
    
    if typ is exceptions.SyntaxError:
        # Syntax errors are a special case.
        # extract_tb does _not_ return the proper line number!
        # This code is similar to the code in format_exception_only(!!)
        try:
            msg,(filename, lineno, offset, line) = val
            return filename,lineno
        except:
            g.trace("bad line number")
            return None,0

    else:
        # The proper line number is the second element in the last tuple.
        data = traceback.extract_tb(tb)
        # g.trace(data)
        item = data[-1]
        filename = item[0]
        n = item[1]
        return filename,n
#@nonl
#@-node:ekr.20040731204831:getLastTracebackFileAndLineNumber
#@+node:ekr.20031218072017.3113:printBindings
def print_bindings (name,window):

    bindings = window.bind()
    print
    print "Bindings for", name
    for b in bindings:
        print b
#@nonl
#@-node:ekr.20031218072017.3113:printBindings
#@+node:ekr.20031218072017.3114:printGlobals
def printGlobals(message=None):
    
    # Get the list of globals.
    globs = list(globals())
    globs.sort()
    
    # Print the list.
    if message:
        leader = "-" * 10
        print leader, ' ', message, ' ', leader
    for glob in globs:
        print glob
#@nonl
#@-node:ekr.20031218072017.3114:printGlobals
#@+node:ekr.20031218072017.3115:printLeoModules
def printLeoModules(message=None):
    
    # Create the list.
    mods = []
    for name in sys.modules.keys():
        if name and name[0:3] == "leo":
            mods.append(name)

    # Print the list.
    if message:
        leader = "-" * 10
        print leader, ' ', message, ' ', leader
    mods.sort()
    for m in mods:
        print m,
    print
#@nonl
#@-node:ekr.20031218072017.3115:printLeoModules
#@-node:ekr.20031218072017.3108:Dumps
#@+node:ekr.20031218072017.1317:file/module/plugin_date
def module_date (mod,format=None):
    theFile = g.os_path_join(app.loadDir,mod.__file__)
    root,ext = g.os_path_splitext(theFile) 
    return g.file_date(root + ".py",format=format)

def plugin_date (plugin_mod,format=None):
    theFile = g.os_path_join(app.loadDir,"..","plugins",plugin_mod.__file__)
    root,ext = g.os_path_splitext(theFile) 
    return g.file_date(root + ".py",format=format)

def file_date (theFile,format=None):
    if theFile and len(theFile)and g.os_path_exists(theFile):
        try:
            import time
            n = g.os_path_getmtime(theFile)
            if format == None:
                format = "%m/%d/%y %H:%M:%S"
            return time.strftime(format,time.gmtime(n))
        except (ImportError,NameError):
            pass # Time module is platform dependent.
    return ""
#@-node:ekr.20031218072017.1317:file/module/plugin_date
#@+node:ekr.20031218072017.3121:redirecting stderr and stdout
class redirectClass:
    
    """A class to redirect stdout and stderr."""

    #@    << redirectClass methods >>
    #@+node:ekr.20031218072017.1656:<< redirectClass methods >>
    #@+others
    #@+node:ekr.20041012082437:redirectClass.__init__
    def __init__ (self):
        
        self.old = None
    #@nonl
    #@-node:ekr.20041012082437:redirectClass.__init__
    #@+node:ekr.20041012082437.1:isRedirected
    def isRedirected (self):
    
        return self.old != None
    #@nonl
    #@-node:ekr.20041012082437.1:isRedirected
    #@+node:ekr.20041012082437.2:flush
    # For LeoN: just for compatibility.
    
    def flush(self, *args):
        return 
    
    #@-node:ekr.20041012082437.2:flush
    #@+node:ekr.20041012091252:rawPrint
    def rawPrint (self,s):
    
        if self.old:
            self.old.write(s+'\n')
        else:
            print s
    #@nonl
    #@-node:ekr.20041012091252:rawPrint
    #@+node:ekr.20041012082437.3:redirect
    def redirect (self,stdout=1):
    
        import sys
    
        if g.app.batchMode:
            # Redirection is futile in batch mode.
            return
    
        if not self.old:
            if stdout:
                self.old,sys.stdout = sys.stdout,self
            else:
                self.old,sys.stderr = sys.stderr,self
    #@nonl
    #@-node:ekr.20041012082437.3:redirect
    #@+node:ekr.20041012082437.4:undirect
    def undirect (self,stdout=1):
    
        import sys
    
        if self.old:
            if stdout:
                sys.stdout,self.old = self.old,None
            else:
                sys.stderr,self.old = self.old,None
    #@nonl
    #@-node:ekr.20041012082437.4:undirect
    #@+node:ekr.20041012082437.5:write
    def write(self,s):
    
        if self.old:
            if app.log:
                app.log.put(s)
            else:
                self.old.write(s+'\n')
        else:
            # Can happen when g.batchMode is True.
            print s
    #@nonl
    #@-node:ekr.20041012082437.5:write
    #@-others
    #@nonl
    #@-node:ekr.20031218072017.1656:<< redirectClass methods >>
    #@nl

# Create two redirection objects, one for each stream.
redirectStdErrObj = redirectClass()
redirectStdOutObj = redirectClass()

#@<< define convenience methods for redirecting streams >>
#@+node:ekr.20031218072017.3122:<< define convenience methods for redirecting streams >>
#@+others
#@+node:ekr.20041012090942:redirectStderr & redirectStdout
# Redirect streams to the current log window.
def redirectStderr():
    global redirectStdErrObj
    redirectStdErrObj.redirect(stdout=False)

def redirectStdout():
    global redirectStdOutObj
    redirectStdOutObj.redirect()
#@nonl
#@-node:ekr.20041012090942:redirectStderr & redirectStdout
#@+node:ekr.20041012090942.1:restoreStderr & restoreStdout
# Restore standard streams.
def restoreStderr():
    global redirectStdErrObj
    redirectStdErrObj.undirect(stdout=False)
    
def restoreStdout():
    global redirectStdOutObj
    redirectStdOutObj.undirect()
#@nonl
#@-node:ekr.20041012090942.1:restoreStderr & restoreStdout
#@+node:ekr.20041012090942.2:stdErrIsRedirected & stdOutIsRedirected
def stdErrIsRedirected():
    global redirectStdErrObj
    return redirectStdErrObj.isRedirected()
    
def stdOutIsRedirected():
    global redirectStdOutObj
    return redirectStdOutObj.isRedirected()
#@nonl
#@-node:ekr.20041012090942.2:stdErrIsRedirected & stdOutIsRedirected
#@+node:ekr.20041012090942.3:rawPrint
# Send output to original stdout.

def rawPrint(s):

    global redirectStdOutObj

    redirectStdOutObj.rawPrint(s)
#@nonl
#@-node:ekr.20041012090942.3:rawPrint
#@-others
#@nonl
#@-node:ekr.20031218072017.3122:<< define convenience methods for redirecting streams >>
#@nl

if 0: # Test code: may be executed in the child node.
    #@    << test code >>
    #@+node:ekr.20031218072017.3123:<< test code >>
    import leoGlobals as g
    
    print "stdout isRedirected:", g.stdOutIsRedirected()
    print "stderr isRedirected:", g.stdErrIsRedirected()
    
    g.redirectStderr()
    g.redirectStdout()
    
    print "stdout isRedirected:", g.stdOutIsRedirected()
    print "stderr isRedirected:", g.stdErrIsRedirected()
    
    g.restoreStderr()
    
    print "stdout isRedirected:", g.stdOutIsRedirected()
    print "stderr isRedirected:", g.stdErrIsRedirected()
    
    g.restoreStdout()
    
    print "stdout isRedirected:", g.stdOutIsRedirected()
    print "stderr isRedirected:", g.stdErrIsRedirected()
    #@nonl
    #@-node:ekr.20031218072017.3123:<< test code >>
    #@nl
#@nonl
#@-node:ekr.20031218072017.3121:redirecting stderr and stdout
#@+node:ekr.20031218072017.3127:get_line & get_line_after
# Very useful for tracing.

def get_line (s,i):

    nl = ""
    if g.is_nl(s,i):
        i = g.skip_nl(s,i)
        nl = "[nl]"
    j = g.find_line_start(s,i)
    k = g.skip_to_end_of_line(s,i)
    return nl + s[j:k]
    
def get_line_after (s,i):
    
    nl = ""
    if g.is_nl(s,i):
        i = g.skip_nl(s,i)
        nl = "[nl]"
    k = g.skip_to_end_of_line(s,i)
    return nl + s[i:k]
#@-node:ekr.20031218072017.3127:get_line & get_line_after
#@+node:ekr.20031218072017.3128:pause
def pause (s):
    
    print s
    
    i = 0
    while i < 1000000L:
        i += 1
#@nonl
#@-node:ekr.20031218072017.3128:pause
#@+node:ekr.20041224080039:print_dict & dictToString
def print_dict(d,tag=None):
    
    keys = d.keys()
    keys.sort()
    n = 6
    for key in keys:
        if type(key) == type(''):
            n = max(n,len(key))
    if tag:
        print '%s...' % tag
    for key in keys:
        print "%*s: %s" % n,key,d.get(key)

printDict = print_dict

def dictToString(d,tag=None):
    keys = d.keys()
    keys.sort()
    n = 6
    for key in keys:
        if type(key) == type(''):
            n = max(n,len(key))
    lines = ["%*s: %s" % (n,key,d.get(key)) for key in keys]
    s = '\n'.join(lines)
    if tag:
        return '%s...\n%s' % (tag,s)
    else:
        return s
#@nonl
#@-node:ekr.20041224080039:print_dict & dictToString
#@+node:ekr.20041126060136:print_list & listToString
def print_list(aList,tag=None):
    
    if tag:
        print '%s...' % tag
    for e in aList:
        print repr(e)

printList = print_list

def listToString(aList,tag=None):
    
    lines = ["%s" % repr(e) for e in aList]
    s = '\n'.join(lines)
    if tag:
        return '%s...\n%s' % (tag,s)
    else:
        return s
#@nonl
#@-node:ekr.20041126060136:print_list & listToString
#@+node:ekr.20041122153823:print_stack (printStack)
def print_stack():
    
    import traceback
    traceback.print_stack()
    
printStack = print_stack
#@nonl
#@-node:ekr.20041122153823:print_stack (printStack)
#@+node:ekr.20031218072017.3129:Sherlock... (trace)
#@+at 
#@nonl
# Starting with this release, you will see trace statements throughout the 
# code.  The trace function is defined in leoGlobals.py; trace implements much 
# of the functionality of my Sherlock tracing package.  Traces are more 
# convenient than print statements for two reasons: 1) you don't need explicit 
# trace names and 2) you can disable them without recompiling.
# 
# In the following examples, suppose that the call to trace appears in 
# function f.
# 
# g.trace(string) prints string if tracing for f has been enabled.  For 
# example, the following statment prints from s[i] to the end of the line if 
# tracing for f has been enabled.
# 
#   j = g.skip_line(s,i) ; g.trace(s[i:j])
# 
# g.trace(function) exectutes the function if tracing for f has been enabled.  
# For example,
# 
#   g.trace(self.f2)
# 
# You enable and disable tracing by calling g.init_trace(args).  Examples:
# 
#   g.init_trace("+*")         # enable all traces
#   g.init_trace("+a","+b")    # enable traces for a and b
#   g.init_trace(("+a","+b"))  # enable traces for a and b
#   g.init_trace("-a")         # disable tracing for a
#   traces = g.init_trace("?") # return the list of enabled traces
# 
# If two arguments are supplied to trace, the first argument is the 
# "tracepoint name" and the second argument is the "tracepoint action" as 
# shown in the examples above.  If tracing for the tracepoint name is enabled, 
# the tracepoint action is printed (if it is a string) or exectuted (if it is 
# a function name).
# 
# "*" will not match an explicit tracepoint name that starts with a minus 
# sign.  For example,
# 
#   g.trace_tag("-nocolor", self.disable_color)
#@-at
#@+node:ekr.20031218072017.3130:init_sherlock
# Called by startup code.
# Args are all the arguments on the command line.

def init_sherlock (args):
    
    g.init_trace(args,echo=0)
    # g.trace("sys.argv:",sys.argv)
#@nonl
#@-node:ekr.20031218072017.3130:init_sherlock
#@+node:ekr.20031218072017.3131:get_Sherlock_args
#@+at 
#@nonl
# It no args are given we attempt to get them from the "SherlockArgs" file.  
# If there are still no arguments we trace everything.  This default makes 
# tracing much more useful in Python.
#@-at
#@@c

def get_Sherlock_args (args):

    if not args or len(args)==0:
        try:
            fn = g.os_path_join(app.loadDir,"SherlockArgs")
            f = open(fn)
            args = f.readlines()
            f.close()
        except: pass
    elif type(args[0]) == type(("1","2")):
        args = args[0] # strip away the outer tuple.

    # No args means trace everything.
    if not args or len(args)==0: args = ["+*"] 
    # print "get_Sherlock_args:", args
    return args
#@nonl
#@-node:ekr.20031218072017.3131:get_Sherlock_args
#@+node:ekr.20031218072017.3132:init_trace
def init_trace(args,echo=1):

    t = app.trace_list
    args = g.get_Sherlock_args(args)

    for arg in args:
        if arg[0] in string.ascii_letters: prefix = '+'
        else: prefix = arg[0] ; arg = arg[1:]
        
        if prefix == '?':
            print "trace list:", t
        elif prefix == '+' and not arg in t:
            t.append(string.lower(arg))
            if echo:
                print "enabling:", arg
        elif prefix == '-' and arg in t:
            t.remove(string.lower(arg))
            if echo:
                print "disabling:", arg
        else:
            print "ignoring:", prefix + arg
#@nonl
#@-node:ekr.20031218072017.3132:init_trace
#@+node:ekr.20031218072017.2317:trace
# Convert all args to strings.

def trace (*args,**keys):
    
    callers = keys.get("callers",False)
    newline = keys.get("newline",True)
    align =   keys.get("align",0)

    s = ""
    for arg in args:
        if type(arg) == type(u""):
            try:    arg = str(arg)
            except: arg = repr(arg)
        elif type(arg) != type(""):
            arg = repr(arg)
        if len(s) > 0:
            s = s + " " + arg
        else:
            s = arg
    message = s
    try: # get the function name from the call stack.
        f1 = sys._getframe(1) # The stack frame, one level up.
        code1 = f1.f_code # The code object
        name = code1.co_name # The code name
    except: name = ""
    if name == "?":
        name = "<unknown>"

    if callers:
        traceback.print_stack()
        
    if align != 0 and len(name) < abs(align):
        pad = ' ' * (abs(align) - len(name))
        if align > 0: name = name + pad
        else:         name = pad + name

    if newline:
        print name + ": " + message
    else:
        print name + ": " + message,
#@nonl
#@-node:ekr.20031218072017.2317:trace
#@+node:ekr.20031218072017.2318:trace_tag
# Convert all args to strings.
# Print if tracing for name has been enabled.

def trace_tag (name, *args):
    
    s = ""
    for arg in args:
        if type(arg) != type(""):
            arg = repr(arg)
        if len(s) > 0:
            s = s + ", " + arg
        else:
            s = arg
    message = s

    t = app.trace_list
    # tracepoint names starting with '-' must match exactly.
    minus = len(name) > 0 and name[0] == '-'
    if minus: name = name[1:]
    if (not minus and '*' in t) or name.lower() in t:
        s = name + ": " + message
        print s # Traces _always_ get printed.
#@nonl
#@-node:ekr.20031218072017.2318:trace_tag
#@-node:ekr.20031218072017.3129:Sherlock... (trace)
#@+node:ekr.20031218072017.3133:Statistics
#@+node:ekr.20031218072017.3134:clear_stats
def clear_stats():
    
    app.stats = {}
#@-node:ekr.20031218072017.3134:clear_stats
#@+node:ekr.20031218072017.3135:print_stats
def print_stats (name=None):
    
    if name:
        if type(name) != type(""):
            name = repr(name)
    else:
        name = g.callerName(n=2) # Get caller name 2 levels back.
    
    try:
        stats = app.stats
    except:
        print ; print "no statistics at", name ; print
        return
        
    items = stats.items()
    items.sort()
    print ; print "statistics at",name ; print
    for key,value in items:
        print key,value
        
    g.clear_stats()
#@-node:ekr.20031218072017.3135:print_stats
#@+node:ekr.20031218072017.3136:stat
def stat (name=None):

    """Increments the statistic for name in app.stats
    The caller's name is used by default.
    """
    
    if name:
        if type(name) != type(""):
            name = repr(name)
    else:
        name = g.callerName(n=2) # Get caller name 2 levels back.

    try:
        stats = app.stats
    except:
        app.stats = stats = {}

    stats[name] = 1 + stats.get(name,0)
#@-node:ekr.20031218072017.3136:stat
#@-node:ekr.20031218072017.3133:Statistics
#@+node:ekr.20031218072017.3137:Timing
# pychecker bug: pychecker complains that there is no attribute time.clock

def getTime():
    return time.clock()
    
def esDiffTime(message, start):
    g.es("%s %6.3f" % (message,(time.clock()-start)))
    return time.clock()
    
def printDiffTime(message, start):
    print "%s %6.3f" % (message,(time.clock()-start))
    return time.clock()
#@nonl
#@-node:ekr.20031218072017.3137:Timing
#@-node:ekr.20031218072017.3104:Debugging, Dumping, Timing, Tracing & Sherlock
#@+node:ekr.20031218072017.3116:Files & Directories...
#@+node:ekr.20031218072017.3117:create_temp_name
# Returns a temporary file name.

def create_temp_name ():

    import tempfile
    temp = tempfile.mktemp()
    # g.trace(temp)
    return temp
#@nonl
#@-node:ekr.20031218072017.3117:create_temp_name
#@+node:ekr.20031218072017.3118:ensure_extension
def ensure_extension (name, ext):

    theFile, old_ext = g.os_path_splitext(name)
    if len(name) == 0:
        return name # don't add to an empty name.
    elif old_ext and old_ext == ext:
        return name
    else:
        return theFile + ext
#@nonl
#@-node:ekr.20031218072017.3118:ensure_extension
#@+node:EKR.20040504154039:g.is_sentinel
def is_sentinel (line,delims):
    
    #@    << is_sentinel doc tests >>
    #@+node:ekr.20040719161756:<< is_sentinel doc tests >>
    """
    
    Return True if line starts with a sentinel comment.
    
    >>> py_delims = comment_delims_from_extension('.py')
    >>> is_sentinel("#@+node",py_delims)
    True
    >>> is_sentinel("#comment",py_delims)
    False
    
    >>> c_delims = comment_delims_from_extension('.c')
    >>> is_sentinel("//@+node",c_delims)
    True
    >>> is_sentinel("//comment",c_delims)
    False
    
    >>> html_delims = comment_delims_from_extension('.html')
    >>> is_sentinel("<!--@+node-->",html_delims)
    True
    >>> is_sentinel("<!--comment-->",html_delims)
    False
    
    """
    #@nonl
    #@-node:ekr.20040719161756:<< is_sentinel doc tests >>
    #@nl
    
    delim1,delim2,delim3 = delims
    
    line = line.lstrip()

    if delim1:
        return line.startswith(delim1+'@')
    elif delim2 and delim3:
        i = line.find(delim2+'@')
        j = line.find(delim3)
        return 0 == i < j
    else:
        print repr(delims)
        g.es("Can't happen: is_sentinel",color="red")
        return False
#@-node:EKR.20040504154039:g.is_sentinel
#@+node:ekr.20050104135720:Used by tangle code & leoFileCommands
#@+node:ekr.20031218072017.1241:g.update_file_if_changed
# This is part of the tangle code.

def update_file_if_changed(file_name,temp_name):

    """Compares two files.
    
    If they are different, we replace file_name with temp_name.
    Otherwise, we just delete temp_name. Both files should be closed."""

    if g.os_path_exists(file_name):
        import filecmp
        if filecmp.cmp(temp_name, file_name):
            kind = 'unchanged'
            ok = g.utils_remove(temp_name)
        else:
            kind = '***updating'
            mode = g.utils_stat(file_name)
            ok = g.utils_rename(temp_name,file_name,mode)
    else:
        kind = 'creating'
        ok = g.utils_rename(temp_name,file_name)
        
    if ok:
        g.es('%12s: %s' % (kind,file_name))
    else:
        g.es("rename failed: no file created!",color="red")
        g.es(file_name," may be read-only or in use")
#@nonl
#@-node:ekr.20031218072017.1241:g.update_file_if_changed
#@+node:ekr.20050104123726.3:g.utils_remove & test
def utils_remove (fileName,verbose=True):

    try:
        os.remove(fileName)
        return True
    except:
        if verbose:
            g.es("exception removing:" + fileName)
            g.es_exception()
        return False
#@nonl
#@+node:ekr.20050107084901:test_utils_remove
def test_utils_remove():
    
    import leoGlobals as g
    import os
    
    exists = g.os_path_exists
    
    path = g.os_path_join(g.app.testDir,'xyzzy')
    if exists(path):
        os.remove(path)
        
    assert not exists(path)
    assert not g.utils_remove(path,verbose=False)
    
    f = file(path,'w')
    f.write('test')
    f.close()
    
    assert exists(path)
    assert g.utils_remove(path,verbose=True)
    assert not exists(path)
#@-node:ekr.20050107084901:test_utils_remove
#@-node:ekr.20050104123726.3:g.utils_remove & test
#@+node:ekr.20031218072017.1263:g.utils_rename & test
#@<< about os.rename >>
#@+node:ekr.20050104123726.1:<< about os.rename >>
#@+at 
#@nonl
# Here is the Python 2.4 documentation for rename (same as Python 2.3)
# 
# Rename the file or directory src to dst.  If dst is a directory, OSError 
# will be raised.
# 
# On Unix, if dst exists and is a file, it will be removed silently if the 
# user
# has permission. The operation may fail on some Unix flavors if src and dst 
# are
# on different filesystems. If successful, the renaming will be an atomic
# operation (this is a POSIX requirement).
# 
# On Windows, if dst already exists, OSError will be raised even if it is a 
# file;
# there may be no way to implement an atomic rename when dst names an existing
# file.
#@-at
#@nonl
#@-node:ekr.20050104123726.1:<< about os.rename >>
#@nl

def utils_rename(src,dst,mode=None,verbose=True):

    '''Platform independent rename.'''
    
    head,tail=g.os_path_split(dst)
    if head and len(head) > 0:
        g.makeAllNonExistentDirectories(head)
        
    if g.os_path_exists(dst):
        if not g.utils_remove(dst):
            return False
        
    try:
        if 1: # Use rename in all cases.
            os.rename(src,dst)
            if mode:
                g.utils_chmod(dst,mode,verbose)
            return True
        else:
            # This isn't a great solution: distutils.file_util may not exist.
            if sys.platform=="win32":
                os.rename(src,dst)
            else:
                from distutils.file_util import move_file
                move_file(src,dst)
            if mode:
                g.utils_chmod(dst,mode,verbose)
            return True

    except Exception:
        if verbose:
            g.es('Exception renaming %s to %s' % (src,dst),color='red')
            g.es_exception()
        return False
#@nonl
#@+node:ekr.20050107085710.1:test_utils_rename
def test_utils_rename():

    import leoGlobals as g
    import os
    
    exists = g.os_path_exists
    
    path = g.os_path_join(g.app.testDir,'xyzzy')
    if exists(path):
        os.remove(path)
        
    assert not exists(path)
    assert not g.utils_remove(path,verbose=False)
    
    f = file(path,'w')
    f.write('test')
    f.close()
    
    assert exists(path)
    assert g.utils_remove(path,verbose=True)
    assert not exists(path)
#@nonl
#@-node:ekr.20050107085710.1:test_utils_rename
#@-node:ekr.20031218072017.1263:g.utils_rename & test
#@+node:ekr.20050104124903:g.utils_chmod
def utils_chmod (fileName,mode,verbose=True):
    
    if mode is None:
        return

    try:
        if hasattr( os, 'chmod' ):
            os.chmod(fileName,mode)
        else:
            g.es( "os version does not have chmod method" )
    except:
        if verbose:
            g.es("exception in os.chmod(%s)" % (fileName))
            g.es_exception()
#@nonl
#@-node:ekr.20050104124903:g.utils_chmod
#@+node:ekr.20050104123726.4:g.utils_stat
def utils_stat (fileName):

    '''Return the access mode of named file, removing any setuid, setgid, and sticky bits.'''

    try:
        mode = (os.stat(fileName))[0] & 0777
    except:
        mode = None
        
    return mode
#@nonl
#@-node:ekr.20050104123726.4:g.utils_stat
#@-node:ekr.20050104135720:Used by tangle code & leoFileCommands
#@+node:ekr.20031218072017.1264:getBaseDirectory
# Handles the conventions applying to the "relative_path_base_directory" configuration option.

def getBaseDirectory(c=None):

    base = app.config.relative_path_base_directory

    if base and base == "!":
        base = app.loadDir
    elif base and base == ".":
        base = c.openDirectory

    # g.trace(base)
    if base and len(base) > 0 and g.os_path_isabs(base):
        return base # base need not exist yet.
    else:
        return "" # No relative base given.
#@-node:ekr.20031218072017.1264:getBaseDirectory
#@+node:ekr.20031218072017.3119:makeAllNonExistentDirectories
# This is a generalization of os.makedir.

def makeAllNonExistentDirectories (dir):

    """Attempt to make all non-existent directories"""

    if not app.config.create_nonexistent_directories:
        return None

    dir1 = dir = g.os_path_normpath(dir)

    # Split dir into all its component parts.
    paths = []
    while len(dir) > 0:
        head,tail=g.os_path_split(dir)
        if len(tail) == 0:
            paths.append(head)
            break
        else:
            paths.append(tail)
            dir = head
    path = ""
    paths.reverse()
    for s in paths:
        path = g.os_path_join(path,s)
        if not g.os_path_exists(path):
            try:
                os.mkdir(path)
                g.es("created directory: "+path)
            except:
                g.es("exception creating directory: "+path)
                g.es_exception()
                return None
    return dir1 # All have been created.
#@nonl
#@-node:ekr.20031218072017.3119:makeAllNonExistentDirectories
#@+node:ekr.20031218072017.3120:readlineForceUnixNewline (Steven P. Schaefer)
#@+at 
#@nonl
# Stephen P. Schaefer 9/7/2002
# 
# The Unix readline() routine delivers "\r\n" line end strings verbatim, while 
# the windows versions force the string to use the Unix convention of using 
# only "\n".  This routine causes the Unix readline to do the same.
#@-at
#@@c

def readlineForceUnixNewline(f):

    s = f.readline()
    if len(s) >= 2 and s[-2] == "\r" and s[-1] == "\n":
        s = s[0:-2] + "\n"
    return s
#@-node:ekr.20031218072017.3120:readlineForceUnixNewline (Steven P. Schaefer)
#@+node:ekr.20031218072017.3124:sanitize_filename
def sanitize_filename(s):

    """Prepares string s to be a valid file name:
    
    - substitute '_' whitespace and characters used special path characters.
    - eliminate all other non-alphabetic characters.
    - strip leading and trailing whitespace.
    - return at most 128 characters."""

    result = ""
    for ch in s.strip():
        if ch in string.ascii_letters:
            result += ch
        elif ch in string.whitespace: # Translate whitespace.
            result += '_'
        elif ch in ('.','\\','/',':'): # Translate special path characters.
            result += '_'
    while 1:
        n = len(result)
        result = result.replace('__','_')
        if len(result) == n:
            break
    result = result.strip()
    return result [:128]
#@nonl
#@-node:ekr.20031218072017.3124:sanitize_filename
#@+node:ekr.20031218072017.3125:shortFileName & shortFilename
def shortFileName (fileName):
    
    return g.os_path_basename(fileName)
    
shortFilename = shortFileName
#@nonl
#@-node:ekr.20031218072017.3125:shortFileName & shortFilename
#@-node:ekr.20031218072017.3116:Files & Directories...
#@+node:ekr.20031218072017.1588:Garbage Collection
debugGC = False # Must be true to enable traces below.

lastObjectCount = 0
lastObjectsDict = {}
lastTypesDict = {}
lastFunctionsDict = {}

if debugGC:
    try: 
        import gc
        gc.set_debug(
            gc.DEBUG_STATS | # prints statistics.
            # gc.DEBUG_LEAK | # Same as all below.
            # gc.DEBUG_COLLECTABLE
            # gc.DEBUG_UNCOLLECTABLE
            gc.DEBUG_INSTANCES |
            gc.DEBUG_OBJECTS
            # gc.DEBUG_SAVEALL
        )
    except ImportError:
        traceback.print_exc()

#@+others
#@+node:ekr.20031218072017.1589:clearAllIvars
def clearAllIvars (o):
    
    """Clear all ivars of o, a member of some class."""
    
    o.__dict__.clear()
#@-node:ekr.20031218072017.1589:clearAllIvars
#@+node:ekr.20031218072017.1590:collectGarbage
def collectGarbage(message=None):
    
    if not debugGC: return
    
    if not message:
        message = g.callerName(n=2)
    
    try: gc.collect()
    except: pass
    
    if 0:
        g.printGc(message)
    
    if 1: # This isn't needed unless we want to look at individual objects.
    
        #@        << make a list of the new objects >>
        #@+node:ekr.20031218072017.1591:<< make a list of the new objects >>
        # WARNING: the id trick is not proper because newly allocated objects can have the same address as old objets.
        
        global lastObjectsDict
        objects = gc.get_objects()
        
        newObjects = [o for o in objects if not lastObjectsDict.has_key(id(o))]
        
        lastObjectsDict = {}
        for o in objects:
            lastObjectsDict[id(o)]=o
        #@nonl
        #@-node:ekr.20031218072017.1591:<< make a list of the new objects >>
        #@nl
        print "%25s: %d new, %d total objects" % (message,len(newObjects),len(objects))
#@-node:ekr.20031218072017.1590:collectGarbage
#@+node:ekr.20031218072017.1592:printGc
def printGc(message=None,onlyPrintChanges=False):
    
    if not debugGC: return None
    
    if not message:
        message = g.callerName(n=2)
    
    global lastObjectCount

    try:
        n = len(gc.garbage)
        n2 = len(gc.get_objects())
        delta = n2-lastObjectCount

        print '-' * 30
        print "garbage: %d, objects: %+6d =%7d %s" % (n,delta,n2,message)
        
        #@        << print number of each type of object >>
        #@+node:ekr.20040703054646:<< print number of each type of object >>
        global lastTypesDict
        typesDict = {}
        
        for obj in gc.get_objects():
            n = typesDict.get(type(obj),0)
            typesDict[type(obj)] = n + 1
            
        # Create the union of all the keys.
        keys = typesDict.keys()
        for key in lastTypesDict.keys():
            if key not in keys:
                keys.append(key)
        
        keys.sort()
        for key in keys:
            n1 = lastTypesDict.get(key,0)
            n2 = typesDict.get(key,0)
            delta2 = n2-n1
            if delta2 != 0:
                print "%+6d =%7d %s" % (delta2,n2,key)
            
        lastTypesDict = typesDict
        typesDict = {}
        #@nonl
        #@-node:ekr.20040703054646:<< print number of each type of object >>
        #@nl
        if 0:
            #@            << print added functions >>
            #@+node:ekr.20040703065638:<< print added functions >>
            import types
            import inspect
            
            global lastFunctionsDict
            
            funcDict = {}
            
            for obj in gc.get_objects():
                if type(obj) == types.FunctionType:
                    key = repr(obj) # Don't create a pointer to the object!
                    funcDict[key]=None 
                    if not lastFunctionsDict.has_key(key):
                        print ; print obj
                        args, varargs, varkw,defaults  = inspect.getargspec(obj)
                        print "args", args
                        if varargs: print "varargs",varargs
                        if varkw: print "varkw",varkw
                        if defaults:
                            print "defaults..."
                            for s in defaults: print s
            
            lastFunctionsDict = funcDict
            funcDict = {}
            #@nonl
            #@-node:ekr.20040703065638:<< print added functions >>
            #@nl

        lastObjectCount = n2
        return delta
    except:
        traceback.print_exc()
        return None
#@nonl
#@-node:ekr.20031218072017.1592:printGc
#@+node:ekr.20031218072017.1593:printGcRefs
def printGcRefs (verbose=True):

    refs = gc.get_referrers(app.windowList[0])
    print '-' * 30

    if verbose:
        print "refs of", app.windowList[0]
        for ref in refs:
            print type(ref)
    else:
        print "%d referers" % len(refs)
#@nonl
#@-node:ekr.20031218072017.1593:printGcRefs
#@-others
#@nonl
#@-node:ekr.20031218072017.1588:Garbage Collection
#@+node:ekr.20031218072017.3139:Hooks & plugins (leoGlobals)
#@+node:ekr.20031218072017.1315:idle time functions (leoGlobals)
#@+node:EKR.20040602125018:enableIdleTimeHook
#@+at 
#@nonl
# Enables the "idle" hook.
# After enableIdleTimeHook is called, Leo will call the "idle" hook
# approximately every g.idleTimeDelay milliseconds.
#@-at
#@@c

def enableIdleTimeHook(idleTimeDelay=100):

    if not g.app.idleTimeHook:
        # Start idle-time processing only after the first idle-time event.
        g.app.gui.setIdleTimeHook(g.idleTimeHookHandler)
        g.app.afterHandler = g.idleTimeHookHandler
        
    # 1/4/05: Always update these.
    g.app.idleTimeHook = True
    g.app.idleTimeDelay = idleTimeDelay # Delay in msec.
#@nonl
#@-node:EKR.20040602125018:enableIdleTimeHook
#@+node:EKR.20040602125018.1:disableIdleTimeHook
# Disables the "idle" hook.
def disableIdleTimeHook():
    
    g.app.idleTimeHook = False
#@nonl
#@-node:EKR.20040602125018.1:disableIdleTimeHook
#@+node:EKR.20040602125018.2:idleTimeHookHandler
# An internal routine used to dispatch the "idle" hook.
trace_count = 0

def idleTimeHookHandler(*args,**keys):
    
    if 0: # Do not use g.trace here!
        global trace_count ; trace_count += 1
        if trace_count % 10 == 0:
            for w in g.app.windowList:
                c = w.c
                print "idleTimeHookHandler",trace_count,c.shortFileName()

    # New for Python 2.3: may be called during shutdown.
    if g.app.killed: return
    
    for w in g.app.windowList:
        c = w.c
        # New in 4.2 Beta 3. Do NOT compute c.currentPosition.
        # This would be a MAJOR leak of positions.
        g.doHook("idle",c=c)

    # Requeue this routine after 100 msec.  Faster requeues overload the system.
    if g.app.idleTimeHook:
        g.app.gui.setIdleTimeHookAfterDelay(g.app.idleTimeDelay,g.idleTimeHookHandler)
        # g.app.gui.setIdleTimeHook(g.idleTimeHookHandler)
        g.app.afterHandler = g.idleTimeHookHandler
    else:
        g.app.afterHandler = None
#@-node:EKR.20040602125018.2:idleTimeHookHandler
#@-node:ekr.20031218072017.1315:idle time functions (leoGlobals)
#@+node:ekr.20031218072017.1596:g.doHook
#@+at 
#@nonl
# This global function calls a hook routine.  Hooks are identified by the tag 
# param.
# Returns the value returned by the hook routine, or None if the there is an 
# exception.
# 
# We look for a hook routine in three places:
# 1. g.top().hookFunction
# 2. app.hookFunction
# 3. leoPlugins.doPlugins()
# We set app.hookError on all exceptions.  Scripts may reset app.hookError to 
# try again.
#@-at
#@@c

def doHook(tag,*args,**keywords):
    

    if g.app.killed or g.app.hookError or (g.app.gui and g.app.gui.isNullGui):

        return None
        
    if args:
        # A minor error in Leo's core.
        print "***ignoring args param.  tag = %s" % tag

    if not g.app.config.use_plugins:
        if tag == "start1":
            s = "Plugins disabled: use_plugins is 0"
            print s ; g.es(s,color="blue")
        return None

    # New in 4.2.  We call the idle-time handlers for all open windows.
    c = keywords.get("c")
            
    # Get the hook handler function.  Usually this is doPlugins.
    f = (c and c.hookFunction) or g.app.hookFunction
    if not f:
        import leoPlugins
        g.app.hookFunction = f = leoPlugins.doPlugins

    if 0: # Don't use trace here!
        if 1:
            old_c = keywords.get('old_c')
            if old_c: print 'doHook %24s %s' % (tag,old_c.shortFileName())
        else:
            if tag != "idle": print 'doHook %24s old_c: %s' % (tag,c and c.shortFileName())
        
    try:
        
        # Pass the hook to the hook handler.
        return f(tag,keywords)
    except Exception:
        g.es_exception()
        g.app.hookError = True # Supress this function.
        g.app.idleTimeHook = False # Supress idle-time hook
        return None # No return value
#@nonl
#@-node:ekr.20031218072017.1596:g.doHook
#@+node:ekr.20031218072017.1318:g.plugin_signon
def plugin_signon(module_name,verbose=False):
    
    #exec("import %s ; m = %s" % (module_name,module_name))
    #Why this happens here Im not sure, but it results in
    #2 modules being created in JyLeo
    if verbose: # or g.app.unitTesting:
        g.es("...%s.py v%s: %s" % (
            m.__name__, m.__version__, g.plugin_date(m)))

        print m.__name__, m.__version__
        
    app.loadedPlugins.append(module_name)
#@nonl
#@-node:ekr.20031218072017.1318:g.plugin_signon
#@-node:ekr.20031218072017.3139:Hooks & plugins (leoGlobals)
#@+node:ekr.20031218072017.3145:Most common functions...
# These are guaranteed always to exist for scripts.
#@+node:ekr.20031218072017.3146:app & leoProxy (no longer used)
if 0: # No longer needed with the new import scheme.

    class leoProxy:
    
        """A proxy for the gApp object that can be created before gApp itself.
        
        After gApp is created, both app.x and app().x refer to gApp.x."""
    
        def __getattr__(self,attr):
            return getattr(gApp,attr)
            
        def __setattr__(self,attr,val):
            setattr(gApp,attr,val)
    
        def __call__(self):
            return gApp
            
    # The code can use app.x and app().x to refer to ivars of the leoApp class.
    app = leoProxy()
#@nonl
#@-node:ekr.20031218072017.3146:app & leoProxy (no longer used)
#@+node:ekr.20031218072017.3147:choose
def choose(cond, a, b): # warning: evaluates all arguments

    if cond: return a
    else: return b
#@nonl
#@-node:ekr.20031218072017.3147:choose
#@+node:ekr.20031218072017.1474:es, enl, ecnl
def ecnl():
    g.ecnls(1)

def ecnls(n):
    log = app.log
    if log:
        while log.newlines < n:
            g.enl()

def enl():
    log = app.log
    if log:
        log.newlines += 1
        log.putnl()

def es(s,*args,**keys):
    if app.killed:
        return
    newline = keys.get("newline",True)
    color = keys.get("color",None)
    if type(s) != type("") and type(s) != type(u""): # 1/20/03
        s = repr(s)
    for arg in args:
        if type(arg) != type("") and type(arg) != type(u""): # 1/20/03
            arg = repr(arg)
        s = s + ", " + arg
    if app.batchMode:
        if app.log:
            app.log.put(s)
    else:
        log = app.log
        if log:
            log.put(s,color=color)
            for ch in s:
                if ch == '\n': log.newlines += 1
                else: log.newlines = 0
            if newline:
                g.ecnl() # only valid here
        elif newline:
            app.logWaiting.append((s+'\n',color),) # 2/16/03
            print s
        else:
            app.logWaiting.append((s,color),) # 2/16/03
            print s,
#@nonl
#@-node:ekr.20031218072017.1474:es, enl, ecnl
#@+node:ekr.20031218072017.3148:top
#@+at 
#@nonl
# c.doCommand and frame.OnMenuClick now set app.log, so g.top() will be 
# reliable after any command is executed.
# 
# Note 1: The value of g.top() may change during a new or open command, which 
# may change the routine used to execute the "command1" and "command2" hooks.  
# This is not a bug, and hook routines must be aware of this fact.
#@-at
#@@c

def top():
    
    """Return the commander of the topmost window"""
    
    # Warning: may be called during startup or shutdown when nothing exists.
    try:
        return app.log.c
    except:
        return None
#@nonl
#@-node:ekr.20031218072017.3148:top
#@+node:ekr.20031218072017.3149:trace is defined below
#@-node:ekr.20031218072017.3149:trace is defined below
#@+node:ekr.20031218072017.3150:windows
def windows():
    return app.windowList
#@nonl
#@-node:ekr.20031218072017.3150:windows
#@-node:ekr.20031218072017.3145:Most common functions...
#@+node:ekr.20031218072017.2145:os.path wrappers (leoGlobals.py)
#@+node:ekr.20031218072017.2146:os_path_abspath
def os_path_abspath(path,encoding=None):
    
    """Convert a path to an absolute path."""

    path = g.toUnicodeFileEncoding(path,encoding)
    path = os.path.abspath( path )
    path = g.toUnicodeFileEncoding(path,encoding)
    return path
#@nonl
#@-node:ekr.20031218072017.2146:os_path_abspath
#@+node:ekr.20031218072017.2147:os_path_basename
def os_path_basename(path,encoding=None):
    
    """Normalize the path and convert it to an absolute path."""

    path = g.toUnicodeFileEncoding(path,encoding)

    path = os.path.basename( path )
    
    path = g.toUnicodeFileEncoding(path,encoding)
    
    return path
#@nonl
#@-node:ekr.20031218072017.2147:os_path_basename
#@+node:ekr.20031218072017.2148:os_path_dirname
def os_path_dirname(path,encoding=None):
    
    """Normalize the path and convert it to an absolute path."""

    path = g.toUnicodeFileEncoding(path,encoding)

    path = os.path.dirname( path )
    
    path = g.toUnicodeFileEncoding(path,encoding)
    
    return path
#@nonl
#@-node:ekr.20031218072017.2148:os_path_dirname
#@+node:ekr.20031218072017.2149:os_path_exists
def os_path_exists(path,encoding=None):
    
    """Normalize the path and convert it to an absolute path."""

    path = g.toUnicodeFileEncoding(path,encoding)

    return os.path.exists( path )
#@nonl
#@-node:ekr.20031218072017.2149:os_path_exists
#@+node:ekr.20031218072017.2150:os_path_getmtime
def os_path_getmtime(path,encoding=None):
    
    """Normalize the path and convert it to an absolute path."""

    path = g.toUnicodeFileEncoding(path,encoding)

    return os.path.getmtime(path)
#@nonl
#@-node:ekr.20031218072017.2150:os_path_getmtime
#@+node:ekr.20031218072017.2151:os_path_isabs
def os_path_isabs(path,encoding=None):
    
    """Normalize the path and convert it to an absolute path."""

    path = g.toUnicodeFileEncoding(path,encoding)

    return os.path.isabs(path)
#@nonl
#@-node:ekr.20031218072017.2151:os_path_isabs
#@+node:ekr.20031218072017.2152:os_path_isdir
def os_path_isdir(path,encoding=None):
    
    """Normalize the path and convert it to an absolute path."""

    path = g.toUnicodeFileEncoding(path,encoding)

    return os.path.isdir(path)
#@nonl
#@-node:ekr.20031218072017.2152:os_path_isdir
#@+node:ekr.20031218072017.2153:os_path_isfile
def os_path_isfile(path,encoding=None):
    
    """Normalize the path and convert it to an absolute path."""

    path = g.toUnicodeFileEncoding(path,encoding)

    return os.path.isfile(path)
#@nonl
#@-node:ekr.20031218072017.2153:os_path_isfile
#@+node:ekr.20031218072017.2154:os_path_join
def os_path_join(*args,**keys):
    
    encoding = keys.get("encoding")

    uargs = [g.toUnicodeFileEncoding(arg,encoding) for arg in args]
    
    # Note:  This is exactly the same convention as used by getBaseDirectory.
    if uargs and uargs[0] == '!!':
        uargs[0] = g.app.loadDir
    elif uargs and uargs[0] == '.':
        c = keys.get('c')
        if c and c.openDirectory:
            uargs[0] = c.openDirectory
            g.trace(c.openDirectory)

    path = os.path.join(*uargs)
    
    path = g.toUnicodeFileEncoding(path,encoding)

    return path
#@nonl
#@-node:ekr.20031218072017.2154:os_path_join
#@+node:ekr.20031218072017.2155:os_path_norm NOT USED
if 0:  # A bad idea.
    
    def os_path_norm(path,encoding=None):
    
        """Normalize both the path and the case."""
    
        path = g.toUnicodeFileEncoding(path,encoding)
    
        path = os.path.normcase(path)
        path = os.path.normpath(path)
        
        path = g.toUnicodeFileEncoding(path,encoding)
        
        return path
#@nonl
#@-node:ekr.20031218072017.2155:os_path_norm NOT USED
#@+node:ekr.20041115103456:os_path_normabs NOT USED
if 0: # A bad idea.

    def os_path_normabs (path,encoding=None):
    
        """Convert the file name to a fully normalized absolute path.
        
        There is no exact analog to this in os.path"""
        
        path = g.os_path_abspath(path,encoding = encoding)
        path = g.os_path_norm(path,encoding = encoding)
    
        return path
#@nonl
#@-node:ekr.20041115103456:os_path_normabs NOT USED
#@+node:ekr.20031218072017.2156:os_path_normcase
def os_path_normcase(path,encoding=None):
    
    """Normalize the path's case."""

    path = g.toUnicodeFileEncoding(path,encoding)

    path = os.path.normcase(path)
    
    path = g.toUnicodeFileEncoding(path,encoding)
    
    return path
#@nonl
#@-node:ekr.20031218072017.2156:os_path_normcase
#@+node:ekr.20031218072017.2157:os_path_normpath
def os_path_normpath(path,encoding=None):
    
    """Normalize the path."""

    path = g.toUnicodeFileEncoding(path,encoding)

    path = os.path.normpath(path)
    
    path = g.toUnicodeFileEncoding(path,encoding)
    
    return path
#@nonl
#@-node:ekr.20031218072017.2157:os_path_normpath
#@+node:ekr.20031218072017.2158:os_path_split
def os_path_split(path,encoding=None):
    
    path = g.toUnicodeFileEncoding(path,encoding)

    head,tail = os.path.split(path)

    head = g.toUnicodeFileEncoding(head,encoding)
    tail = g.toUnicodeFileEncoding(tail,encoding)

    return head,tail
#@nonl
#@-node:ekr.20031218072017.2158:os_path_split
#@+node:ekr.20031218072017.2159:os_path_splitext
def os_path_splitext(path,encoding=None):

    path = g.toUnicodeFileEncoding(path,encoding)

    head,tail = os.path.splitext(path)

    head = g.toUnicodeFileEncoding(head,encoding)
    tail = g.toUnicodeFileEncoding(tail,encoding)

    return head,tail
#@nonl
#@-node:ekr.20031218072017.2159:os_path_splitext
#@+node:ekr.20031218072017.2160:toUnicodeFileEncoding
def toUnicodeFileEncoding(path,encoding):

    if not encoding:
        if sys.platform == "win32":
            encoding = "mbcs"
        else:
            encoding = app.tkEncoding

    return g.toUnicode(path,encoding)
#@nonl
#@-node:ekr.20031218072017.2160:toUnicodeFileEncoding
#@-node:ekr.20031218072017.2145:os.path wrappers (leoGlobals.py)
#@+node:ekr.20031218072017.3151:Scanning...
#@+node:ekr.20031218072017.3152:g.scanAtFileOptions (used in 3.x read code)
def scanAtFileOptions (h,err_flag=False):
    
    assert(g.match(h,0,"@file"))
    i = len("@file")
    atFileType = "@file"
    optionsList = []

    while g.match(h,i,'-'):
        #@        << scan another @file option >>
        #@+node:ekr.20031218072017.3153:<< scan another @file option >>
        i += 1 ; err = -1
        
        if g.match_word(h,i,"asis"):
            if atFileType == "@file":
                atFileType = "@silentfile"
            elif err_flag:
                g.es("using -asis option in:" + h)
        elif g.match(h,i,"noref"): # Just match the prefix.
            if atFileType == "@file":
                atFileType = "@rawfile"
            elif atFileType == "@nosentinelsfile":
                atFileType = "@silentfile"
            elif err_flag:
                g.es("ignoring redundant -noref in:" + h)
        elif g.match(h,i,"nosent"): # Just match the prefix.
            if atFileType == "@file":
                atFileType = "@nosentinelsfile"
            elif atFileType == "@rawfile":
                atFileType = "@silentfile"
            elif err_flag:
                g.es("ignoring redundant -nosent in:" + h)
        elif g.match_word(h,i,"thin"):
            if atFileType == "@file":
                atFileType = "@thinfile"
            elif err_flag:
                g.es("using -thin option in:" + h)
        else:
            if 0: # doesn't work
                for option in ("fat","new","now","old","thin","wait"):
                    if g.match_word(h,i,option):
                        optionsList.append(option)
                if len(option) == 0:
                    err = i-1
        # Scan to the next minus sign.
        while i < len(h) and h[i] not in (' ','\t','-'):
            i += 1
        if err > -1:
            g.es("unknown option:" + h[err:i] + " in " + h)
        #@nonl
        #@-node:ekr.20031218072017.3153:<< scan another @file option >>
        #@nl
        
    # Convert atFileType to a list of options.
    for fileType,option in (
        ("@silentfile","asis"),
        ("@nosentinelsfile","nosent"),
        ("@rawfile","noref"),
        ("@thinfile","thin")
    ):
        if atFileType == fileType and option not in optionsList:
            optionsList.append(option)
            
    # g.trace(atFileType,optionsList)

    return i,atFileType,optionsList
#@nonl
#@-node:ekr.20031218072017.3152:g.scanAtFileOptions (used in 3.x read code)
#@+node:ekr.20031218072017.3154:scanAtRootOptions
def scanAtRootOptions (s,i,err_flag=False):
    
    assert(g.match(s,i,"@root"))
    i += len("@root")
    mode = None 
    while g.match(s,i,'-'):
        #@        << scan another @root option >>
        #@+node:ekr.20031218072017.3155:<< scan another @root option >>
        i += 1 ; err = -1
        
        if g.match_word(s,i,"code"): # Just match the prefix.
            if not mode: mode = "code"
            elif err_flag: g.es("modes conflict in:" + g.get_line(s,i))
        elif g.match(s,i,"doc"): # Just match the prefix.
            if not mode: mode = "doc"
            elif err_flag: g.es("modes conflict in:" + g.get_line(s,i))
        else:
            err = i-1
            
        # Scan to the next minus sign.
        while i < len(s) and s[i] not in (' ','\t','-'):
            i += 1
        
        if err > -1 and err_flag:
            g.es("unknown option:" + s[err:i] + " in " + g.get_line(s,i))
        #@nonl
        #@-node:ekr.20031218072017.3155:<< scan another @root option >>
        #@nl

    if mode == None:
        doc = app.config.at_root_bodies_start_in_doc_mode
        mode = g.choose(doc,"doc","code")
    return i,mode
#@nonl
#@-node:ekr.20031218072017.3154:scanAtRootOptions
#@+node:ekr.20031218072017.3156:scanError
# It seems dubious to bump the Tangle error count here.  OTOH, it really doesn't hurt.

def scanError(s):

    """Bump the error count in the tangle command."""

    g.top().tangleCommands.errors += 1

    g.es(s)
#@nonl
#@-node:ekr.20031218072017.3156:scanError
#@+node:ekr.20031218072017.3157:scanf
# A quick and dirty sscanf.  Understands only %s and %d.

def scanf (s,pat):
    import re
    count = pat.count("%s") + pat.count("%d")
    pat = pat.replace("%s","(\S+)")
    pat = pat.replace("%d","(\d+)")
    parts = re.split(pat,s)
    result = []
    for part in parts:
        if len(part) > 0 and len(result) < count:
            result.append(part)
    # g.trace("scanf returns:",result)
    return result
    
if 0: # testing
    g.scanf("1.0","%d.%d",)
#@nonl
#@-node:ekr.20031218072017.3157:scanf
#@+node:ekr.20031218072017.3158:Scanners: calling scanError
#@+at 
#@nonl
# These scanners all call g.scanError() directly or indirectly, so they will 
# call g.es() if they find an error.  g.scanError() also bumps 
# c.tangleCommands.errors, which is harmless if we aren't tangling, and useful 
# if we are.
# 
# These routines are called by the Import routines and the Tangle routines.
#@-at
#@+node:ekr.20031218072017.3159:skip_block_comment
# Scans past a block comment (an old_style C comment).

def skip_block_comment (s,i):

    assert(g.match(s,i,"/*"))
    j = i ; i += 2 ; n = len(s)
    
    k = string.find(s,"*/",i)
    if k == -1:
        g.scanError("Run on block comment: " + s[j:i])
        return n
    else: return k + 2
#@nonl
#@-node:ekr.20031218072017.3159:skip_block_comment
#@+node:ekr.20031218072017.3160:skip_braces
#@+at 
#@nonl
# This code is called only from the import logic, so we are allowed to try 
# some tricks.  In particular, we assume all braces are matched in #if blocks.
#@-at
#@@c

def skip_braces(s,i):

    """Skips from the opening to the matching brace.
    
    If no matching is found i is set to len(s)"""

    # start = g.get_line(s,i)
    assert(g.match(s,i,'{'))
    level = 0 ; n = len(s)
    while i < n:
        c = s[i]
        if c == '{':
            level += 1 ; i += 1
        elif c == '}':
            level -= 1
            if level <= 0: return i
            i += 1
        elif c == '\'' or c == '"': i = g.skip_string(s,i)
        elif g.match(s,i,'//'): i = g.skip_to_end_of_line(s,i)
        elif g.match(s,i,'/*'): i = g.skip_block_comment(s,i)
        # 7/29/02: be more careful handling conditional code.
        elif g.match_word(s,i,"#if") or g.match_word(s,i,"#ifdef") or g.match_word(s,i,"#ifndef"):
            i,delta = g.skip_pp_if(s,i)
            level += delta
        else: i += 1
    return i
#@-node:ekr.20031218072017.3160:skip_braces
#@+node:ekr.20031218072017.3161:skip_php_braces (Dave Hein)
#@+at 
#@nonl
# 08-SEP-2002 DTHEIN: Added for PHP import support
# Skips from the opening to the matching . If no matching is found i is set to 
# len(s).
# 
# This code is called only from the import logic, and only for PHP imports.
#@-at
#@@c

def skip_php_braces(s,i):

    # start = g.get_line(s,i)
    assert(g.match(s,i,'{'))
    level = 0 ; n = len(s)
    while i < n:
        c = s[i]
        if c == '{':
            level += 1 ; i += 1
        elif c == '}':
            level -= 1
            if level <= 0: return i + 1
            i += 1
        elif c == '\'' or c == '"': i = g.skip_string(s,i)
        elif g.match(s,i,"<<<"): i = g.skip_heredoc_string(s,i)
        elif g.match(s,i,'//') or g.match(s,i,'#'): i = g.skip_to_end_of_line(s,i)
        elif g.match(s,i,'/*'): i = g.skip_block_comment(s,i)
        else: i += 1
    return i
#@nonl
#@-node:ekr.20031218072017.3161:skip_php_braces (Dave Hein)
#@+node:ekr.20031218072017.3162:skip_parens
def skip_parens(s,i):

    """Skips from the opening ( to the matching ).
    
    If no matching is found i is set to len(s)"""

    level = 0 ; n = len(s)
    assert(g.match(s,i,'('))
    while i < n:
        c = s[i]
        if c == '(':
            level += 1 ; i += 1
        elif c == ')':
            level -= 1
            if level <= 0:  return i
            i += 1
        elif c == '\'' or c == '"': i = g.skip_string(s,i)
        elif g.match(s,i,"//"): i = g.skip_to_end_of_line(s,i)
        elif g.match(s,i,"/*"): i = g.skip_block_comment(s,i)
        else: i += 1
    return i
#@nonl
#@-node:ekr.20031218072017.3162:skip_parens
#@+node:ekr.20031218072017.3163:skip_pascal_begin_end
def skip_pascal_begin_end(s,i):

    """Skips from begin to matching end.
    If found, i points to the end. Otherwise, i >= len(s)
    The end keyword matches begin, case, class, record, and try."""

    assert(g.match_c_word(s,i,"begin"))
    level = 1 ; i = g.skip_c_id(s,i) # Skip the opening begin.
    while i < len(s):
        ch = s[i]
        if ch =='{' : i = g.skip_pascal_braces(s,i)
        elif ch =='"' or ch == '\'': i = g.skip_pascal_string(s,i)
        elif g.match(s,i,"//"): i = g.skip_line(s,i)
        elif g.match(s,i,"(*"): i = g.skip_pascal_block_comment(s,i)
        elif g.match_c_word(s,i,"end"):
            level -= 1 ;
            if level == 0:
                # lines = s[i1:i+3] ; g.trace('\n' + lines + '\n')
                return i
            else: i = g.skip_c_id(s,i)
        elif g.is_c_id(ch):
            j = i ; i = g.skip_c_id(s,i) ; name = s[j:i]
            if name in ["begin", "case", "class", "record", "try"]:
                level += 1
        else: i += 1
    return i
#@-node:ekr.20031218072017.3163:skip_pascal_begin_end
#@+node:ekr.20031218072017.3164:skip_pascal_block_comment
# Scans past a pascal comment delimited by (* and *).

def skip_pascal_block_comment(s,i):
    
    j = i
    assert(g.match(s,i,"(*"))
    i = string.find(s,"*)",i)
    if i > -1: return i + 2
    else:
        g.scanError("Run on comment" + s[j:i])
        return len(s)

#   n = len(s)
#   while i < n:
#       if g.match(s,i,"*)"): return i + 2
#       i += 1
#   g.scanError("Run on comment" + s[j:i])
#   return i
#@nonl
#@-node:ekr.20031218072017.3164:skip_pascal_block_comment
#@+node:ekr.20031218072017.3165:skip_pascal_string : called by tangle
def skip_pascal_string(s,i):

    j = i ; delim = s[i] ; i += 1
    assert(delim == '"' or delim == '\'')

    while i < len(s):
        if s[i] == delim:
            return i + 1
        else: i += 1

    g.scanError("Run on string: " + s[j:i])
    return i
#@nonl
#@-node:ekr.20031218072017.3165:skip_pascal_string : called by tangle
#@+node:ekr.20031218072017.3166:skip_heredoc_string : called by php import (Dave Hein)
#@+at 
#@nonl
# 08-SEP-2002 DTHEIN:  added function skip_heredoc_string
# A heredoc string in PHP looks like:
# 
#   <<<EOS
#   This is my string.
#   It is mine. I own it.
#   No one else has it.
#   EOS
# 
# It begins with <<< plus a token (naming same as PHP variable names).
# It ends with the token on a line by itself (must start in first position.
# 
#@-at
#@@c
def skip_heredoc_string(s,i):
    
    import re
    
    j = i
    assert(g.match(s,i,"<<<"))
    m = re.match("\<\<\<([a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*)", s[i:])
    if (None == m):
        i += 3
        return i

    # 14-SEP-2002 DTHEIN: needed to add \n to find word, not just string
    delim = m.group(1) + '\n' 
    
    i = g.skip_line(s,i) # 14-SEP-2002 DTHEIN: look after \n, not before
    n = len(s)
    while i < n and not g.match(s,i,delim):
        i = g.skip_line(s,i) # 14-SEP-2002 DTHEIN: move past \n
        
    if i >= n:
        g.scanError("Run on string: " + s[j:i])
    elif g.match(s,i,delim):
        i += len(delim)
    return i
#@-node:ekr.20031218072017.3166:skip_heredoc_string : called by php import (Dave Hein)
#@+node:ekr.20031218072017.3167:skip_pp_directive
# Now handles continuation lines and block comments.

def skip_pp_directive(s,i):

    while i < len(s):
        if g.is_nl(s,i):
            if g.escaped(s,i): i = g.skip_nl(s,i)
            else: break
        elif g.match(s,i,"//"): i = g.skip_to_end_of_line(s,i)
        elif g.match(s,i,"/*"): i = g.skip_block_comment(s,i)
        else: i += 1
    return i
#@nonl
#@-node:ekr.20031218072017.3167:skip_pp_directive
#@+node:ekr.20031218072017.3168:skip_pp_if
# Skips an entire if or if def statement, including any nested statements.

def skip_pp_if(s,i):
    
    start_line = g.get_line(s,i) # used for error messages.
    # g.trace(start_line)

    assert(
        g.match_word(s,i,"#if") or
        g.match_word(s,i,"#ifdef") or
        g.match_word(s,i,"#ifndef"))

    i = g.skip_line(s,i)
    i,delta1 = g.skip_pp_part(s,i)
    i = g.skip_ws(s,i)
    if g.match_word(s,i,"#else"):
        i = g.skip_line(s,i)
        i = g.skip_ws(s,i)
        i,delta2 = g.skip_pp_part(s,i)
        if delta1 != delta2:
            g.es("#if and #else parts have different braces: " + start_line)
    i = g.skip_ws(s,i)
    if g.match_word(s,i,"#endif"):
        i = g.skip_line(s,i)
    else:
        g.es("no matching #endif: " + start_line)

    # g.trace(delta1,start_line)
    return i,delta1
#@-node:ekr.20031218072017.3168:skip_pp_if
#@+node:ekr.20031218072017.3169:skip_pp_part
# Skip to an #else or #endif.  The caller has eaten the #if, #ifdef, #ifndef or #else

def skip_pp_part(s,i):

    # g.trace(g.get_line(s,i))

    delta = 0
    while i < len(s):
        c = s[i]
        if 0:
            if c == '\n':
                g.trace(delta,g.get_line(s,i))
        if g.match_word(s,i,"#if") or g.match_word(s,i,"#ifdef") or g.match_word(s,i,"#ifndef"):
            i,delta1 = g.skip_pp_if(s,i)
            delta += delta1
        elif g.match_word(s,i,"#else") or g.match_word(s,i,"#endif"):
            return i,delta
        elif c == '\'' or c == '"': i = g.skip_string(s,i)
        elif c == '{':
            delta += 1 ; i += 1
        elif c == '}':
            delta -= 1 ; i += 1
        elif g.match(s,i,"//"): i = g.skip_line(s,i)
        elif g.match(s,i,"/*"): i = g.skip_block_comment(s,i)
        else: i += 1
    return i,delta
#@nonl
#@-node:ekr.20031218072017.3169:skip_pp_part
#@+node:ekr.20031218072017.3170:skip_python_string
def skip_python_string(s,i):

    if g.match(s,i,"'''") or g.match(s,i,'"""'):
        j = i ; delim = s[i]*3 ; i += 3
        k = string.find(s,delim,i)
        if k > -1: return k+3
        g.scanError("Run on triple quoted string: " + s[j:i])
        return len(s)
    else:
        return g.skip_string(s,i)
#@nonl
#@-node:ekr.20031218072017.3170:skip_python_string
#@+node:ekr.20031218072017.2369:skip_string : called by tangle
def skip_string(s,i):
    
    j = i ; delim = s[i] ; i += 1
    assert(delim == '"' or delim == '\'')
    
    n = len(s)
    while i < n and s[i] != delim:
        if s[i] == '\\' : i += 2
        else: i += 1

    if i >= n:
        g.scanError("Run on string: " + s[j:i])
    elif s[i] == delim:
        i += 1

    # g.trace(s[j:i])
    return i
#@-node:ekr.20031218072017.2369:skip_string : called by tangle
#@+node:ekr.20031218072017.3171:skip_to_semicolon
# Skips to the next semicolon that is not in a comment or a string.

def skip_to_semicolon(s,i):

    n = len(s)
    while i < n:
        c = s[i]
        if c == ';': return i
        elif c == '\'' or c == '"' : i = g.skip_string(s,i)
        elif g.match(s,i,"//"): i = g.skip_to_end_of_line(s,i)
        elif g.match(s,i,"/*"): i = g.skip_block_comment(s,i)
        else: i += 1
    return i
#@nonl
#@-node:ekr.20031218072017.3171:skip_to_semicolon
#@+node:ekr.20031218072017.3172:skip_typedef
def skip_typedef(s,i):

    n = len(s)
    while i < n and g.is_c_id(s[i]):
        i = g.skip_c_id(s,i)
        i = g.skip_ws_and_nl(s,i)
    if g.match(s,i,'{'):
        i = g.skip_braces(s,i)
        i = g.skip_to_semicolon(s,i)
    return i
#@nonl
#@-node:ekr.20031218072017.3172:skip_typedef
#@-node:ekr.20031218072017.3158:Scanners: calling scanError
#@+node:ekr.20031218072017.3173:Scanners: no error messages
#@+node:ekr.20031218072017.3174:escaped
# Returns True if s[i] is preceded by an odd number of backslashes.

def escaped(s,i):

    count = 0
    while i-1 >= 0 and s[i-1] == '\\':
        count += 1
        i -= 1
    return (count%2) == 1
#@nonl
#@-node:ekr.20031218072017.3174:escaped
#@+node:ekr.20031218072017.3175:find_line_start
def find_line_start(s,i):

    # bug fix: 11/2/02: change i to i+1 in rfind
    i = string.rfind(s,'\n',0,i+1) # Finds the highest index in the range.
    if i == -1: return 0
    else: return i + 1
#@nonl
#@-node:ekr.20031218072017.3175:find_line_start
#@+node:ekr.20031218072017.3176:find_on_line
def find_on_line(s,i,pattern):

    # j = g.skip_line(s,i) ; g.trace(s[i:j])
    j = string.find(s,'\n',i)
    if j == -1: j = len(s)
    k = string.find(s,pattern,i,j)
    if k > -1: return k
    else: return None
#@nonl
#@-node:ekr.20031218072017.3176:find_on_line
#@+node:ekr.20031218072017.3177:is_c_id
def is_c_id(ch):

    return ch and (ch in string.ascii_letters or ch in string.digits or ch == '_')
#@-node:ekr.20031218072017.3177:is_c_id
#@+node:ekr.20031218072017.3178:is_nl
def is_nl(s,i):

    return i < len(s) and (s[i] == '\n' or s[i] == '\r')
#@nonl
#@-node:ekr.20031218072017.3178:is_nl
#@+node:ekr.20031218072017.3179:is_special
# We no longer require that the directive appear befor any @c directive or section definition.

def is_special(s,i,directive):

    """Return True if the body text contains the @ directive."""

    # j = g.skip_line(s,i) ; g.trace(s[i:j],':',directive)
    assert (directive and directive [0] == '@' )

    # 10/23/02: all directives except @others must start the line.
    skip_flag = directive in ("@others","@all")
    while i < len(s):
        if g.match_word(s,i,directive):
            return True, i
        else:
            i = g.skip_line(s,i)
            if skip_flag:
                i = g.skip_ws(s,i)
    return False, -1
#@nonl
#@-node:ekr.20031218072017.3179:is_special
#@+node:ekr.20031218072017.3180:is_ws & is_ws_or_nl
def is_ws(c):

    return c == '\t' or c == ' '
    
def is_ws_or_nl(s,i):

    return g.is_nl(s,i) or (i < len(s) and g.is_ws(s[i]))
#@nonl
#@-node:ekr.20031218072017.3180:is_ws & is_ws_or_nl
#@+node:ekr.20031218072017.3181:match
# Warning: this code makes no assumptions about what follows pattern.

def match(s,i,pattern):
    #print 'pattern is: %s' % pattern
    #s2 = s[ i: i + len( pattern ) ]
    #print '%s , %s, %s, %s, %s' %( pattern, s2, s2 == pattern , len( s2 ), len( pattern ))
    #print s[ i: i + len( pattern ) ] == s
    #print jsys.currentTimeMillis()
    return s and pattern and s[ i: i + len( pattern ) ] == pattern # string.find(s,pattern,i,i+len(pattern)) == i  #s[ i: i + len( pattern ) ] == s
    #print jsys.currentTimeMillis()
    #print '-----between----'
    #print jsys.currentTimeMillis()
    #res2 = es= s and pattern and string.find(s,pattern,i,i+len(pattern)) == i  #s[ i: i + len( pattern ) ] == s
    #print jsys.currentTimeMillis()
    # print '------end------'
    #return res
    #print "X is  %s " % x
    #return x
#@nonl
#@-node:ekr.20031218072017.3181:match
#@+node:ekr.20031218072017.3182:match_c_word
def match_c_word (s,i,name):

    if name == None: return False
    n = len(name)
    if n == 0: return False
    return name == s[i:i+n] and (i+n == len(s) or not g.is_c_id(s[i+n]))
#@nonl
#@-node:ekr.20031218072017.3182:match_c_word
#@+node:ekr.20031218072017.3183:match_ignoring_case
def match_ignoring_case(s1,s2):

    if s1 == None or s2 == None: return False
    return string.lower(s1) == string.lower(s2)
#@nonl
#@-node:ekr.20031218072017.3183:match_ignoring_case
#@+node:ekr.20031218072017.3184:match_word
def match_word(s,i,pattern):

    if pattern == None: return False
    j = len(pattern)
    if j == 0: return False
    if s[ i: i + j ] != pattern:
        return False
    #if string.find(s,pattern,i,i+j) != i:
    #    return False
    if i+j >= len(s):
        return True
    c = s[i+j]
    return not( c.isalnum() or c == '_' )
    #return not (c in string.ascii_letters or c in string.digits or c == '_')
#@nonl
#@-node:ekr.20031218072017.3184:match_word
#@+node:ekr.20031218072017.3185:skip_blank_lines
def skip_blank_lines(s,i):

    while i < len(s):
        if g.is_nl(s,i) :
            i = g.skip_nl(s,i)
        elif g.is_ws(s[i]):
            j = g.skip_ws(s,i)
            if g.is_nl(s,j):
                i = j
            else: break
        else: break
    return i
#@nonl
#@-node:ekr.20031218072017.3185:skip_blank_lines
#@+node:ekr.20031218072017.3186:skip_c_id
def skip_c_id(s,i):

    n = len(s)
    while i < n:
        c = s[i]
        if c in string.ascii_letters or c in string.digits or c == '_':
            i += 1
        else: break
    return i
#@nonl
#@-node:ekr.20031218072017.3186:skip_c_id
#@+node:ekr.20040705195048:skip_id
def skip_id(s,i,chars=None):

    n = len(s)
    while i < n:
        ch = s[i]
        if ch in string.ascii_letters or ch in string.digits or ch == '_':
            i += 1
        elif chars and ch in chars:
            i += 1
        else: break
    return i
#@-node:ekr.20040705195048:skip_id
#@+node:ekr.20031218072017.3187:skip_line, skip_to_end_of_line
#@+at 
#@nonl
# These methods skip to the next newline, regardless of whether the newline 
# may be preceeded by a backslash. Consequently, they should be used only when 
# we know that we are not in a preprocessor directive or string.
#@-at
#@@c

def skip_line (s,i):

    i = string.find(s,'\n',i)
    if i == -1: return len(s)
    else: return i + 1
        
def skip_to_end_of_line (s,i):

    i = string.find(s,'\n',i)
    if i == -1: return len(s)
    else: return i
#@nonl
#@-node:ekr.20031218072017.3187:skip_line, skip_to_end_of_line
#@+node:ekr.20031218072017.3188:skip_long
def skip_long(s,i):
    
    """Scan s[i:] for a valid int.
    Return (i, val) or (i, None) if s[i] does not point at a number.
    """

    digits = string.digits
    val = 0
    i = g.skip_ws(s,i)
    n = len(s)
    if i >= n or s[i] not in "+-" + digits:
        return i, None
    # Rewritten: 7/18/02.
    j = i
    if s[i] in '+-':    # whr allow sign if first digit
        i +=1
    while i < n and s[i] in digits:
        i += 1
    try: # 4/24/03: There may be no digits, which would raise an exception.
        val = int(s[j:i])
        return i, val
    except:
        return i,None
#@-node:ekr.20031218072017.3188:skip_long
#@+node:ekr.20031218072017.3189:skip_matching_delims
def skip_matching_delims(s,i,delim1,delim2):
    
    assert(g.match(s,i,delim1))

    i += len(delim1)
    k = string.find(s,delim2,i)
    if k == -1:
        return len(s)
    else:
        return k + len(delim2)
#@nonl
#@-node:ekr.20031218072017.3189:skip_matching_delims
#@+node:ekr.20031218072017.3190:skip_nl
# We need this function because different systems have different end-of-line conventions.

def skip_nl (s,i):

    """Skips a single "logical" end-of-line character."""

    if g.match(s,i,"\r\n"): return i + 2
    elif g.match(s,i,'\n') or g.match(s,i,'\r'): return i + 1
    else: return i
#@nonl
#@-node:ekr.20031218072017.3190:skip_nl
#@+node:ekr.20031218072017.3191:skip_non_ws
def skip_non_ws (s,i):

    n = len(s)
    while i < n and not g.is_ws(s[i]):
        i += 1
    return i
#@nonl
#@-node:ekr.20031218072017.3191:skip_non_ws
#@+node:ekr.20031218072017.3192:skip_pascal_braces
# Skips from the opening { to the matching }.

def skip_pascal_braces(s,i):

    # No constructs are recognized inside Pascal block comments!
    k = string.find(s,'}',i)
    if i == -1: return len(s)
    else: return k
#@nonl
#@-node:ekr.20031218072017.3192:skip_pascal_braces
#@+node:ekr.20031218072017.3193:skip_to_char
def skip_to_char(s,i,ch):
    
    j = string.find(s,ch,i)
    if j == -1:
        return len(s),s[i:]
    else:
        return j,s[i:j]
#@-node:ekr.20031218072017.3193:skip_to_char
#@+node:ekr.20031218072017.3194:skip_ws, skip_ws_and_nl
def skip_ws(s,i):

    n = len(s)
    while i < n and g.is_ws(s[i]):      
        i += 1
    return i
    
def skip_ws_and_nl(s,i):

    n = len(s)
    while i < n and (g.is_ws(s[i]) or g.is_nl(s,i)):
        i += 1
    return i
#@nonl
#@-node:ekr.20031218072017.3194:skip_ws, skip_ws_and_nl
#@-node:ekr.20031218072017.3173:Scanners: no error messages
#@+node:ekr.20031218072017.3195:splitLines & joinLines
def splitLines (s):
    
    """Split s into lines, preserving the number of lines and the ending of the last line."""
    
    if s:
        return s.splitlines(True) # This is a Python string function!
    else:
        return []

def joinLines (aList):
    
    return ''.join(aList)
#@nonl
#@-node:ekr.20031218072017.3195:splitLines & joinLines
#@-node:ekr.20031218072017.3151:Scanning...
#@+node:ekr.20040327103735.2:Script Tools (leoGlobals.py)
#@+node:ekr.20031218072017.2418:g.initScriptFind (set up dialog)
def initScriptFind(findHeadline,changeHeadline=None,firstNode=None,
    script_search=True,script_change=True):
    
    import leoTest
    import leoGlobals as g
    
    # Find the scripts.
    c = g.top() ; p = c.currentPosition()
    u = leoTest.testUtils()
    find_p = u.findNodeInTree(p,findHeadline)
    if find_p:
        find_text = find_p.bodyString()
    else:
        g.es("no Find script node",color="red")
        return
    if changeHeadline:
        change_p = u.findNodeInTree(p,changeHeadline)
    else:
        change_p = None
    if change_p:
        change_text = change_p.bodyString()
    else:
        change_text = ""
    # print find_p,change_p
    
    # Initialize the find panel.
    c.script_search_flag = script_search
    c.script_change_flag = script_change and change_text
    if script_search:
        c.find_text = find_text.strip() + "\n"
    else:
        c.find_text = find_text
    if script_change:
        c.change_text = change_text.strip() + "\n"
    else:
        c.change_text = change_text
    c.frame.findPanel.init(c)
    c.showFindPanel()
#@nonl
#@-node:ekr.20031218072017.2418:g.initScriptFind (set up dialog)
#@+node:ekr.20040321065415:g.findNodeInTree, findNodeAnywhere, findTopLevelNode
def findNodeInTree(p,headline):

    """Search for a node in v's tree matching the given headline."""
    
    c = p.c
    for p in p.subtree_iter():
        if p.headString().strip() == headline.strip():
            return p.copy()
    return c.nullPosition()

def findNodeAnywhere(headline):
    
    c = g.top()
    for p in c.allNodes_iter():
        if p.headString().strip() == headline.strip():
            return p.copy()
    return c.nullPosition()
    
def findTopLevelNode(headline):
    
    c = g.top()
    for p in c.rootPosition().self_and_siblings_iter():
        if p.headString().strip() == headline.strip():
            return p.copy()
    return c.nullPosition()
#@nonl
#@-node:ekr.20040321065415:g.findNodeInTree, findNodeAnywhere, findTopLevelNode
#@-node:ekr.20040327103735.2:Script Tools (leoGlobals.py)
#@+node:ekr.20031218072017.1498:Unicode utils...
#@+node:ekr.20031218072017.1499:isUnicode
def isUnicode(s):
    
    return s is None or type(s) == type(u' ')
#@nonl
#@-node:ekr.20031218072017.1499:isUnicode
#@+node:ekr.20031218072017.1500:isValidEncoding
def isValidEncoding (encoding):
    
    try:
        if len(encoding) == 0:
            return False
        unicode("a",encoding)
        return True
    except:
        return False
#@-node:ekr.20031218072017.1500:isValidEncoding
#@+node:ekr.20031218072017.1501:reportBadChars
def reportBadChars (s,encoding):
    
    errors = 0
    if type(s) == type(u""):
        for ch in s:
            try: ch.encode(encoding,"strict")
            except: errors += 1
        if errors:
            # traceback.print_stack()
            g.es("%d errors converting %s to %s" % 
                (errors, s.encode(encoding,"replace"),encoding))

    elif type(s) == type(""):
        for ch in s:
            try: unicode(ch,encoding,"strict")
            except: errors += 1
        if errors:
            g.es("%d errors converting %s (%s encoding) to unicode" % 
                (errors, unicode(s,encoding,"replace"),encoding)) # 10/23/03
#@nonl
#@-node:ekr.20031218072017.1501:reportBadChars
#@+node:ekr.20031218072017.1502:toUnicode & toEncodedString
def toUnicode (s,encoding,reportErrors=False):
    
    if s is None:
        s = u""
    if type(s) == type(""):
        try:
            s = unicode(s,encoding,"strict")
        except:
            if reportErrors:
                g.reportBadChars(s,encoding)
            s = unicode(s,encoding,"replace")
    return ""+s
    #return s
    
def toEncodedString (s,encoding,reportErrors=False):

    if type(s) == type(u""):
        try:
            s = s.encode(encoding,"strict")
        except:
            if reportErrors:
                g.reportBadChars(s,encoding)
            s = s.encode(encoding,"replace")
    return s
#@nonl
#@-node:ekr.20031218072017.1502:toUnicode & toEncodedString
#@+node:ekr.20031218072017.1503:getpreferredencoding from 2.3a2
try:
    # Use Python's version of getpreferredencoding if it exists.
    # It is new in Python 2.3.
    import locale
    getpreferredencoding = locale.getpreferredencoding
except:
    # Use code copied from locale.py in Python 2.3alpha2.
    if sys.platform in ('win32', 'darwin', 'mac'):
        #@        << define getpreferredencoding using _locale >>
        #@+node:ekr.20031218072017.1504:<< define getpreferredencoding using _locale >>
        # On Win32, this will return the ANSI code page
        # On the Mac, it should return the system encoding;
        # it might return "ascii" instead.
        
        def getpreferredencoding(do_setlocale = True):
            """Return the charset that the user is likely using."""
            try:
                import _locale
                return _locale._getdefaultlocale()[1]
            except:
                return None
        #@nonl
        #@-node:ekr.20031218072017.1504:<< define getpreferredencoding using _locale >>
        #@nl
    else:
        #@        << define getpreferredencoding for *nix >>
        #@+node:ekr.20031218072017.1505:<< define getpreferredencoding for *nix >>
        # On Unix, if CODESET is available, use that.
        try:
            local.CODESET
        except NameError:
            # Fall back to parsing environment variables :-(
            def getpreferredencoding(do_setlocale = True):
                """Return the charset that the user is likely using,
                by looking at environment variables."""
                try:
                    return locale.getdefaultlocale()[1]
                except:
                    return None
        else:
            def getpreferredencoding(do_setlocale = True):
                """Return the charset that the user is likely using,
                according to the system configuration."""
                try:
                    if do_setlocale:
                        oldloc = locale.setlocale(LC_CTYPE)
                        locale.setlocale(LC_CTYPE, "")
                        result = locale.nl_langinfo(CODESET)
                        locale.setlocale(LC_CTYPE, oldloc)
                        return result
                    else:
                        return locale.nl_langinfo(CODESET)
                except:
                    return None
        #@nonl
        #@-node:ekr.20031218072017.1505:<< define getpreferredencoding for *nix >>
        #@nl
#@-node:ekr.20031218072017.1503:getpreferredencoding from 2.3a2
#@-node:ekr.20031218072017.1498:Unicode utils...
#@+node:EKR.20040612114220:Utility classes, functions & objects...
#@+node:ekr.20031218072017.3140: List utilities...
#@+node:ekr.20031218072017.3141:appendToList
def appendToList(out, s):

    for i in s:
        out.append(i)
#@nonl
#@-node:ekr.20031218072017.3141:appendToList
#@+node:ekr.20031218072017.3142:flattenList
def flattenList (theList):

    result = []
    for item in theList:
        if type(item) == types.ListType:
            result.extend(g.flattenList(item))
        else:
            result.append(item)
    return result
#@nonl
#@-node:ekr.20031218072017.3142:flattenList
#@-node:ekr.20031218072017.3140: List utilities...
#@+node:ekr.20031218072017.3106:angleBrackets & virtual_event_name
# Returns < < s > >

def angleBrackets(s):

    return ( "<<" + s +
        ">>") # must be on a separate line.

virtual_event_name = angleBrackets
#@nonl
#@-node:ekr.20031218072017.3106:angleBrackets & virtual_event_name
#@+node:ekr.20031218072017.3097:CheckVersion (Dave Hein)
#@+at
# g.CheckVersion() is a generic version checker.  Assumes a
# version string of up to four parts, or tokens, with
# leftmost token being most significant and each token
# becoming less signficant in sequence to the right.
# 
# RETURN VALUE
# 
# 1 if comparison is True
# 0 if comparison is False
# 
# PARAMETERS
# 
# version: the version string to be tested
# againstVersion: the reference version string to be
#               compared against
# condition: can be any of "==", "!=", ">=", "<=", ">", or "<"
# stringCompare: whether to test a token using only the
#              leading integer of the token, or using the
#              entire token string.  For example, a value
#              of "0.0.1.0" means that we use the integer
#              value of the first, second, and fourth
#              tokens, but we use a string compare for the
#              third version token.
# delimiter: the character that separates the tokens in the
#          version strings.
# 
# The comparison uses the precision of the version string
# with the least number of tokens.  For example a test of
# "8.4" against "8.3.3" would just compare the first two
# tokens.
# 
# The version strings are limited to a maximum of 4 tokens.
#@-at
#@@c

def CheckVersion( version, againstVersion, condition=">=", stringCompare="0.0.0.0", delimiter='.' ):
    import sre  # Unicode-aware regular expressions
    #
    # tokenize the stringCompare flags
    compareFlag = string.split( stringCompare, '.' )
    #
    # tokenize the version strings
    testVersion = string.split( version, delimiter )
    testAgainst = string.split( againstVersion, delimiter )
    #
    # find the 'precision' of the comparison
    tokenCount = 4
    if tokenCount > len(testAgainst):
        tokenCount = len(testAgainst)
    if tokenCount > len(testVersion):
        tokenCount = len(testVersion)
    #
    # Apply the stringCompare flags
    justInteger = sre.compile("^[0-9]+")
    for i in range(tokenCount):
        if "0" == compareFlag[i]:
            m = justInteger.match( testVersion[i] )
            testVersion[i] = m.group()
            m = justInteger.match( testAgainst[i] )
            testAgainst[i] = m.group()
        elif "1" != compareFlag[i]:
            errMsg = "stringCompare argument must be of " +\
                 "the form \"x.x.x.x\" where each " +\
                 "'x' is either '0' or '1'."
            raise EnvironmentError,errMsg
    #
    # Compare the versions
    if condition == ">=":
        for i in range(tokenCount):
            if testVersion[i] < testAgainst[i]:
                return 0
            if testVersion[i] > testAgainst[i]:
                return 1 # it was greater than
        return 1 # it was equal
    if condition == ">":
        for i in range(tokenCount):
            if testVersion[i] < testAgainst[i]:
                return 0
            if testVersion[i] > testAgainst[i]:
                return 1 # it was greater than
        return 0 # it was equal
    if condition == "==":
        for i in range(tokenCount):
            if testVersion[i] != testAgainst[i]:
                return 0 # any token was not equal
        return 1 # every token was equal
    if condition == "!=":
        for i in range(tokenCount):
            if testVersion[i] != testAgainst[i]:
                return 1 # any token was not equal
        return 0 # every token was equal
    if condition == "<":
        for i in range(tokenCount):
            if testVersion[i] >= testAgainst[i]:
                return 0
            if testVersion[i] < testAgainst[i]:
                return 1 # it was less than
        return 0 # it was equal
    if condition == "<=":
        for i in range(tokenCount):
            if testVersion[i] > testAgainst[i]:
                return 0
            if testVersion[i] < testAgainst[i]:
                return 1 # it was less than
        return 1 # it was equal
    #
    # didn't find a condition that we expected.
    raise EnvironmentError,"condition must be one of '>=', '>', '==', '!=', '<', or '<='."
#@nonl
#@-node:ekr.20031218072017.3097:CheckVersion (Dave Hein)
#@+node:ekr.20031218072017.3098:class Bunch
#@+at 
#@nonl
# From The Python Cookbook:  Often we want to just collect a bunch of stuff 
# together, naming each item of the bunch; a dictionary's OK for that, but a 
# small do-nothing class is even handier, and prettier to use.
# 
# Create a Bunch whenever you want to group a few variables:
# 
#     point = Bunch(datum=y, squared=y*y, coord=x)
# 
# You can read/write the named attributes you just created, add others, del 
# some of them, etc:
#     if point.squared > threshold:
#         point.isok = True
#@-at
#@@c

import operator

class Bunch:
    
    """A class that represents a colection of things.
    
    Especially useful for representing a collection of related variables."""
    
    def __init__(self,**keywords):
        self.__dict__.update (keywords)
        
    def __repr__(self):
        return self.toString()

    def ivars(self):
        return self.__dict__.keys()
        
    def toString(self):
        tag = self.__dict__.get('tag')
        entries = ["%s: %s" % (key,str(self.__dict__.get(key)))
            for key in self.ivars() if key != 'tag']
        if tag:
            return "Bunch(tag=%s)...\n%s\n" % (tag,'\n'.join(entries))
        else:
            return "Bunch...\n%s\n" % '\n'.join(entries)

    if 0:
        def __setitem__ (self,key,value):
            '''Support aBunch[key] = val'''
            return operator.setitem(self.__dict__,key,value)
            
        def __getitem__ (self,key):
            '''Support aBunch[key]'''
            return operator.getitem(self.__dict__,key)
        
bunch = Bunch
#@nonl
#@-node:ekr.20031218072017.3098:class Bunch
#@+node:EKR.20040504150046:class mulderUpdateAlgorithm (leoGlobals)
import difflib,shutil

class mulderUpdateAlgorithm:
    
    """A class to update derived files using
    diffs in files without sentinels.
    """
    
    #@    @+others
    #@+node:EKR.20040504150046.3:__init__
    def __init__ (self,testing=False,verbose=False):
        
        self.testing = testing
        self.verbose = False
        self.do_backups = False
    #@nonl
    #@-node:EKR.20040504150046.3:__init__
    #@+node:EKR.20040504150046.9:copy_sentinels
    #@+at 
    #@nonl
    # This script retains _all_ sentinels.  If lines are replaced, or deleted,
    # we restore deleted sentinel lines by checking for gaps in the mapping.
    #@-at
    #@@c
    
    def copy_sentinels (self,write_lines,fat_lines,fat_pos,mapping,startline,endline):
        """
        
        Copy sentinel lines from fat_lines to write_lines.
    
        Copy all sentinels _after_ the current reader postion up to,
        but not including, mapping[endline].
    
        """
    
        j_last = mapping[startline]
        i = startline + 1
        while i <= endline:
            j = mapping[i]
            if j_last + 1 != j:
                fat_pos = j_last + 1
                # Copy the deleted sentinels that comprise the gap.
                while fat_pos < j:
                    line = fat_lines[fat_pos]
                    write_lines.append(line)
                    if self.testing and self.verbose: print "Copy sentinel:",fat_pos,line,
                    fat_pos += 1
            j_last = j ; i += 1
    
        fat_pos = mapping[endline]
        return fat_pos
    #@nonl
    #@-node:EKR.20040504150046.9:copy_sentinels
    #@+node:EKR.20040504155109:copy_time
    def copy_time(self,sourcefilename,targetfilename):
        
        """
        Set the target file's modification time to
        that of the source file.
        """
    
        st = os.stat(sourcefilename)
    
        if hasattr(os, 'utime'):
            os.utime(targetfilename, (st.st_atime, st.st_mtime))
        elif hasattr(os, 'mtime'):
            os.mtime(targetfilename, st.st_mtime)
        else:
            g.trace("Can not set modification time")
    #@nonl
    #@-node:EKR.20040504155109:copy_time
    #@+node:EKR.20040504150046.6:create_mapping
    def create_mapping (self,lines,delims):
        """
    
        'lines' is a list of lines of a file with sentinels.
     
        Returns:
    
        result: lines with all sentinels removed.
    
        mapping: a list such that result[mapping[i]] == lines[i]
        for all i in range(len(result))
    
        """
        
        if not lines:
            return [],[]
    
        # Create mapping and set i to the index of the last non-sentinel line.
        mapping = []
        for i in xrange(len(lines)):
            if not g.is_sentinel(lines[i],delims):
                mapping.append(i)
    
        # Create a last mapping entry for copy_sentinels.
        mapping.append(i)
        
        # Use removeSentinelsFromLines to handle @nonl properly.
        stripped_lines = self.removeSentinelsFromLines(lines,delims)
    
        return stripped_lines, mapping
    #@nonl
    #@-node:EKR.20040504150046.6:create_mapping
    #@+node:EKR.20040505080156:Get or remove sentinel lines
    # These routines originally were part of push_filter & push_filter_lines.
    #@nonl
    #@+node:EKR.20040505081121:separateSentinelsFromFile/Lines
    def separateSentinelsFromFile (self,filename):
        
        """Separate the lines of the file into a tuple of two lists,
        containing the sentinel and non-sentinel lines of the file."""
        
        lines = file(filename).readlines()
        delims = g.comment_delims_from_extension(filename)
        
        return self.separateSentinelsFromLines(lines,delims)
        
    def separateSentinelsFromLines (self,lines,delims):
        
        """Separate lines (a list of lines) into a tuple of two lists,
        containing the sentinel and non-sentinel lines of the original list."""
        
        strippedLines = self.removeSentinelsFromLines(lines,delims)
        sentinelLines = self.getSentinelsFromLines(lines,delims)
        
        return strippedLines,sentinelLines
    #@nonl
    #@-node:EKR.20040505081121:separateSentinelsFromFile/Lines
    #@+node:EKR.20040505080156.2:removeSentinelsFromFile/Lines
    def removeSentinelsFromFile (self,filename):
        
        """Return a copy of file with all sentinels removed."""
        
        lines = file(filename).readlines()
        delims = g.comment_delims_from_extension(filename)
        
        return removeSentinelsFromLines(lines,delims)
        
    def removeSentinelsFromLines (self,lines,delims):
    
        """Return a copy of lines with all sentinels removed."""
        
        delim1,delim2,delim3 = delims
        result = [] ; last_nosent_i = -1
        for i in xrange(len(lines)):
            if not g.is_sentinel(lines[i],delims):
                result.append(lines[i])
                last_nosent_i = i
        #@    << remove the newline from result[-1] if line[i] is followed by @nonl >>
        #@+node:ekr.20040716105102:<< remove the newline from result[-1] if line[i] is followed by @nonl >>
        i = last_nosent_i
        
        if i + 1 < len(lines):
        
            line = lines[i+1]
            j = g.skip_ws(line,0)
        
            if match(line,j,delim1):
                j += len(delim1)
        
                if g.match(line,j,"@nonl"):
                    line = lines[i]
                    if line[-1] == '\n':
                        assert(result[-1] == line)
                        result[-1] = line[:-1]
        #@nonl
        #@-node:ekr.20040716105102:<< remove the newline from result[-1] if line[i] is followed by @nonl >>
        #@nl
        return result
    #@nonl
    #@-node:EKR.20040505080156.2:removeSentinelsFromFile/Lines
    #@+node:EKR.20040505080156.3:getSentinelsFromFile/Lines
    def getSentinelsFromFile (self,filename,delims):
        
        """Returns all sentinels lines in a file."""
        
        lines = file(filename).readlines()
        delims = g.comment_delims_from_extension(filename)
    
        return getSentinelsFromLines(lines,delims)
        
    def getSentinelsFromLines (self,lines,delims):
        
        """Returns all sentinels lines in lines."""
        
        return [line for line in lines if g.is_sentinel(line,delims)]
    #@nonl
    #@-node:EKR.20040505080156.3:getSentinelsFromFile/Lines
    #@-node:EKR.20040505080156:Get or remove sentinel lines
    #@+node:EKR.20040504150046.10:propagateDiffsToSentinelsFile
    def propagateDiffsToSentinelsFile(self,sourcefilename,targetfilename):
        
        #@    << init propagateDiffsToSentinelsFile vars >>
        #@+node:EKR.20040504150046.11:<< init propagateDiffsToSentinelsFile vars >>
        # Get the sentinel comment delims.
        delims = self.comment_delims_from_extension(sourcefilename)
        if not delims:
            return
        
        try:
            # Create the readers.
            sfile = file(sourcefilename)
            tfile = file(targetfilename)
            
            fat_lines = sfile.readlines() # Contains sentinels.
            j_lines   = tfile.readlines() # No sentinels.
            
            i_lines,mapping = self.create_mapping(fat_lines,delims)
            
            sfile.close()
            tfile.close()
        except:
            g.es_exception("can not open files")
            return
        #@nonl
        #@-node:EKR.20040504150046.11:<< init propagateDiffsToSentinelsFile vars >>
        #@nl
        
        write_lines = self.propagateDiffsToSentinelsLines(
            i_lines,j_lines,fat_lines,mapping)
            
        # Update _source_ file if it is not the same as write_lines.
        written = self.write_if_changed(write_lines,targetfilename,sourcefilename)
        if written:
            #@        << paranoia check>>
            #@+node:EKR.20040504150046.12:<<paranoia check>>
            # Check that 'push' will re-create the changed file.
            strippedLines,sentinel_lines = self.separateSentinelsFromFile(sourcefilename)
            
            if strippedLines != j_lines:
                self.report_mismatch(strippedLines, j_lines,
                    "Propagating diffs did not work as expected",
                    "Content of sourcefile:",
                    "Content of modified file:")
            
            # Check that no sentinels got lost.
            fat_sentinel_lines = self.getSentinelsFromLines(fat_lines,delims)
            
            if sentinel_lines != fat_sentinel_lines:
                self.report_mismatch(sentinel_lines,fat_sentinel_lines,
                    "Propagating diffs modified sentinel lines:",
                    "Current sentinel lines:",
                    "Old sentinel lines:")
            #@nonl
            #@-node:EKR.20040504150046.12:<<paranoia check>>
            #@nl
    #@nonl
    #@-node:EKR.20040504150046.10:propagateDiffsToSentinelsFile
    #@+node:EKR.20040504145804.1:propagateDiffsToSentinelsLines (called from perfect import)
    def propagateDiffsToSentinelsLines (self,
        i_lines,j_lines,fat_lines,mapping):
        
        """Compare the 'i_lines' with 'j_lines' and propagate the diffs back into
        'write_lines' making sure that all sentinels of 'fat_lines' are copied.
    
        i/j_lines have no sentinels.  fat_lines does."""
    
        #@    << init propagateDiffsToSentinelsLines vars >>
        #@+node:EKR.20040504145804.2:<< init propagateDiffsToSentinelsLines vars >>
        # Indices into i_lines, j_lines & fat_lines.
        i_pos = j_pos = fat_pos = 0
        
        # These vars check that all ranges returned by get_opcodes() are contiguous.
        i2_old = j2_old = -1
        
        # Create the output lines.
        write_lines = []
        
        matcher = difflib.SequenceMatcher(None,i_lines,j_lines)
        
        testing = self.testing
        verbose = self.verbose
        #@nonl
        #@-node:EKR.20040504145804.2:<< init propagateDiffsToSentinelsLines vars >>
        #@nl
        #@    << copy the sentinels at the beginning of the file >>
        #@+node:EKR.20040504145804.3:<< copy the sentinels at the beginning of the file >>
        while fat_pos < mapping[0]:
        
            line = fat_lines[fat_pos]
            write_lines.append(line)
            if testing:
                print "copy initial line",fat_pos,line,
            fat_pos += 1
        #@-node:EKR.20040504145804.3:<< copy the sentinels at the beginning of the file >>
        #@nl
        for tag, i1, i2, j1, j2 in matcher.get_opcodes():
            if testing:
                if verbose: print
                print "Opcode %7s %3d %3d %3d %3d" % (tag,i1,i2,j1,j2)
                if verbose: print
            #@        << update and check the loop invariant >>
            #@+node:EKR.20040504145804.4:<< update and check the loop invariant>>
            # We need the ranges returned by get_opcodes to completely cover the source lines being compared.
            # We also need the ranges not to overlap.
            
            assert(i2_old in (-1,i1))
            assert(j2_old in (-1,j1))
            
            i2_old = i2 ; j2_old = j2
            
            # Check the loop invariants.
            assert i_pos == i1
            assert j_pos == j1
            assert fat_pos == mapping[i1]
            
            if 0: # not yet.
                if testing: # A bit costly.
                    t_sourcelines,t_sentinel_lines = push_filter_lines(write_lines, delims)
                    # Check that we have all the modifications so far.
                    assert t_sourcelines == j_lines[:j1],"t_sourcelines == j_lines[:j1]"
                    # Check that we kept all sentinels so far.
                    assert t_sentinel_lines == push_filter_lines(fat_lines[:fat_pos], delims)[1]
            #@nonl
            #@-node:EKR.20040504145804.4:<< update and check the loop invariant>>
            #@nl
            if tag == 'equal':
                #@            << handle 'equal' tag >>
                #@+node:EKR.20040504145804.5:<< handle 'equal' tag >>
                # Copy the lines, including sentinels.
                while fat_pos <= mapping[i2-1]:
                    line = fat_lines[fat_pos]
                    if 0: # too verbose.
                        if testing: print "Equal: copying ", line,
                    write_lines.append(line)
                    fat_pos += 1
                
                if testing and verbose:
                    print "Equal: synch i", i_pos,i2
                    print "Equal: synch j", j_pos,j2
                
                i_pos = i2
                j_pos = j2
                
                # Copy the sentinels which might follow the lines.       
                fat_pos = self.copy_sentinels(write_lines,fat_lines,fat_pos,mapping,i2-1,i2)
                #@nonl
                #@-node:EKR.20040504145804.5:<< handle 'equal' tag >>
                #@nl
            elif tag == 'replace':
                #@            << handle 'replace' tag >>
                #@+node:EKR.20040504145804.6:<< handle 'replace' tag >>
                #@+at 
                #@nonl
                # Replace lines that may span sentinels.
                # 
                # For now, we put all the new contents after the first 
                # sentinel.
                # 
                # A more complex approach: run the difflib across the 
                # different lines and try to
                # construct a mapping changed line => orignal line.
                #@-at
                #@@c
                
                while j_pos < j2:
                    line = j_lines[j_pos]
                    if testing:
                        print "Replace i:",i_pos,repr(i_lines[i_pos])
                        print "Replace j:",j_pos,repr(line)
                        i_pos += 1
                
                    write_lines.append(line)
                    j_pos += 1
                
                i_pos = i2
                
                # Copy the sentinels which might be between the changed code.         
                fat_pos = self.copy_sentinels(write_lines,fat_lines,fat_pos,mapping,i1,i2)
                #@nonl
                #@-node:EKR.20040504145804.6:<< handle 'replace' tag >>
                #@nl
            elif tag == 'delete':
                #@            << handle 'delete' tag >>
                #@+node:EKR.20040504145804.7:<< handle 'delete' tag >>
                if testing and verbose:
                    print "delete: i",i_pos,i1
                    print "delete: j",j_pos,j1
                
                j_pos = j2
                i_pos = i2
                
                # Restore any deleted sentinels.
                fat_pos = self.copy_sentinels(write_lines,fat_lines,fat_pos,mapping,i1,i2)
                #@nonl
                #@-node:EKR.20040504145804.7:<< handle 'delete' tag >>
                #@nl
            elif tag == 'insert':
                #@            << handle 'insert' tag >>
                #@+node:EKR.20040504145804.8:<< handle 'insert' tag >>
                while j_pos < j2:
                    line = j_lines[j_pos]
                    if testing: print "Insert:", line,
                    write_lines.append(line)
                    j_pos += 1
                
                # The input streams are already in synch.
                #@nonl
                #@-node:EKR.20040504145804.8:<< handle 'insert' tag >>
                #@nl
            else: assert 0,"bad tag"
        #@    << copy the sentinels at the end of the file >>
        #@+node:EKR.20040504145804.9:<< copy the sentinels at the end of the file >>
        while fat_pos < len(fat_lines):
        
            line = fat_lines[fat_pos]
            write_lines.append(line)
            if testing:
                print "Append last line",line
            fat_pos += 1
        #@-node:EKR.20040504145804.9:<< copy the sentinels at the end of the file >>
        #@nl
        return write_lines
    #@nonl
    #@-node:EKR.20040504145804.1:propagateDiffsToSentinelsLines (called from perfect import)
    #@+node:EKR.20040504150046.5:report_mismatch
    def report_mismatch (self,lines1,lines2,message,lines1_message,lines2_message):
    
        """
        Generate a report when something goes wrong.
        """
    
        print '='*20
        print message
        
        if 0:
            print lines1_message
            print '-'*20
            for line in lines1:
              print line,
             
            print '='*20
        
            print lines2_message
            print '-'*20
            for line in lines2:
                print line,
    #@nonl
    #@-node:EKR.20040504150046.5:report_mismatch
    #@+node:ekr.20040718101315:stripWhitespaceFromBlankLines(before_lines)
    def stripWhitespaceFromBlankLines (self,lines):
        
        # All backslashes must be doubled.
    
        """Strip blanks and tabs from lines containing only blanks and tabs.
        
        >>> import leoGlobals as g
        >>> s = "a\\n \\t\\n\\t\\t \\t\\nb"
        >>> theLines = g.splitLines(s)
        >>> theLines
        ['a\\n', ' \\t\\n', '\\t\\t \\t\\n', 'b']
        >>> g.mulderUpdateAlgorithm().stripWhitespaceFromBlankLines(theLines)
        ['a\\n', '\\n', '\\n', 'b']
        """
    
        for i in xrange(len(lines)):
            stripped_line = lines[i].lstrip(" \t")
            if stripped_line in ('\n',''):
                lines[i] = stripped_line
                
        return lines
    #@nonl
    #@-node:ekr.20040718101315:stripWhitespaceFromBlankLines(before_lines)
    #@+node:EKR.20040504160820:write_if_changed
    def write_if_changed(self,lines,sourcefilename,targetfilename):
        """
        
        Replaces target file if it is not the same as 'lines',
        and makes the modification date of target file the same as the source file.
        
        Optionally backs up the overwritten file.
    
        """
        
        copy = not os.path.exists(targetfilename) or lines != file(targetfilename).readlines()
            
        if self.testing:
            if copy:
                print "Writing",targetfilename,"without sentinals"
            else:
                print "Files are identical"
    
        if copy:
            if self.do_backups:
                #@            << make backup file >>
                #@+node:EKR.20040504160820.1:<< make backup file >>
                if os.path.exists(targetfilename):
                    count = 0
                    backupname = "%s.~%s~" % (targetfilename,count)
                    while os.path.exists(backupname):
                        count += 1
                        backupname = "%s.~%s~" % (targetfilename,count)
                    os.rename(targetfilename, backupname)
                    if testing:
                        print "backup file in ", backupname
                #@nonl
                #@-node:EKR.20040504160820.1:<< make backup file >>
                #@nl
            outfile = open(targetfilename, "w")
            for line in lines:
                outfile.write(line)
            outfile.close()
            self.copy_time(sourcefilename,targetfilename)
        return copy
    #@-node:EKR.20040504160820:write_if_changed
    #@-others
    
def doMulderUpdateAlgorithm(sourcefilename,targetfilename):

    mu = mulderUpdateAlgorithm()

    mu.pull_source(sourcefilename,targetfilename)
    mu.copy_time(targetfilename,sourcefilename)
#@nonl
#@-node:EKR.20040504150046:class mulderUpdateAlgorithm (leoGlobals)
#@+node:ekr.20031219074948.1:class nullObject
# From the Python cookbook, recipe 5.23

class nullObject:
    
    """An object that does nothing, and does it very well."""
    
    def __init__   (self,*args,**keys): pass
    def __call__   (self,*args,**keys): return self
    
    def __repr__   (self): return "nullObject"
    
    def __nonzero__ (self): return 0
    
    def __delattr__(self,attr):     return self
    def __getattr__(self,attr):     return self
    def __setattr__(self,attr,val): return self
#@nonl
#@-node:ekr.20031219074948.1:class nullObject
#@+node:ekr.20031218072017.3144:g,makeDict
# From the Python cookbook.

def makeDict(**keys):
    
    """Returns a Python dictionary from using the optional keyword arguments."""

    return keys
#@nonl
#@-node:ekr.20031218072017.3144:g,makeDict
#@+node:ekr.20031218072017.3103:g.computeWindowTitle
def computeWindowTitle (fileName):

    if fileName == None:
        return "untitled"
    else:
        path,fn = g.os_path_split(fileName)
        if path:
            title = fn + " in " + path
        else:
            title = fn
        return title
#@nonl
#@-node:ekr.20031218072017.3103:g.computeWindowTitle
#@+node:ekr.20031218072017.3138:g.executeScript
def executeScript (name):
    
    """Execute a script whose short python file name is given"""
    
    mod_name,ext = g.os_path_splitext(name)
    theFile = None
    try:
        # This code is in effect an import or a reload.
        # This allows the user to modify scripts without leaving Leo.
        import imp
        theFile,filename,description = imp.find_module(mod_name)
        imp.load_module(mod_name,theFile,filename,description)
    except:
        g.es("Exception executing " + name,color="red")
        g.es_exception()

    if theFile:
        theFile.close()

#@-node:ekr.20031218072017.3138:g.executeScript
#@+node:ekr.20040331083824.1:g.fileLikeObject
# Note: we could use StringIo for this.

class fileLikeObject:

    """Define a file-like object for redirecting writes to a string.
    
    The caller is responsible for handling newlines correctly."""

    def __init__(self,fromString=None):
        # New in 4.2.1: allow the file to be inited from string s.
        if fromString: self.list = g.splitLines(fromString) # Must preserve newlines!
        else: self.list = []
        self.ptr = 0

    def clear (self):   self.list = []

    def close (self): pass
    def flush (self): pass

    def get (self):
        return ''.join(self.list)
        
    def readline(self): # New for read-from-string (readOpenFile).
        if self.ptr < len(self.list):
            line = self.list[self.ptr]
            # g.trace(repr(line))
            self.ptr += 1
            return line
        else: return ""

    def write (self,s):
        if s: self.list.append(s)
#@nonl
#@-node:ekr.20040331083824.1:g.fileLikeObject
#@+node:ekr.20031218072017.3126:g.funcToMethod
#@+at 
#@nonl
# The following is taken from page 188 of the Python Cookbook.
# 
# The following method allows you to add a function as a method of any class.  
# That is, it converts the function to a method of the class.  The method just 
# added is available instantly to all existing instances of the class, and to 
# all instances created in the future.
# 
# The function's first argument should be self.
# 
# The newly created method has the same name as the function unless the 
# optional name argument is supplied, in which case that name is used as the 
# method name.
#@-at
#@@c

def funcToMethod(f,theClass,name=None):

    setattr(theClass,name or f.__name__,f)
    # g.trace(name)
#@nonl
#@-node:ekr.20031218072017.3126:g.funcToMethod
#@+node:EKR.20040614071102.1:g.getScript
def getScript (c,p,useSelectedText=True):

    if not p: p = c.currentPosition()
    old_body = p.bodyString()

    try:
        script = ''
        # Allow p not to be the present position.
        if p == c.currentPosition():
            if useSelectedText and c.frame.body.hasTextSelection():
                # Temporarily replace v's body text with just the selected text.
                s = c.frame.body.getSelectedText()
                p.v.setTnodeText(s)
            else:
                s = c.frame.body.getAllText()
        else:
            s = p.bodyString()
    
        if s.strip():
            g.app.scriptDict["script1"]=s
            at = c.atFileCommands
            c.fileCommands.assignFileIndices()
            at.write(p.copy(),nosentinels=True,toString=True,scriptWrite=True)
            script = at.stringOutput
            # g.trace(script)
            g.app.scriptDict["script2"]=script
            error = len(script) == 0
    except:
        s = "unexpected exception"
        print s ; g.es(s)
        g.es_exception()
        script = ''

    p.v.setTnodeText(old_body)
    return script
#@nonl
#@-node:EKR.20040614071102.1:g.getScript
#@+node:ekr.20041219095213:import wrappers
#@+at 
#@nonl
# 1/6/05: The problem with Tkinter is that imp.load_module is equivalent to 
# reload.
# 
# The solutions is easy: simply return sys.modules.get(moduleName) if 
# moduleName is in sys.modules!
#@-at
#@nonl
#@+node:ekr.20040917061619:g.cantImport
def cantImport (moduleName,pluginName=None,verbose=True):
    
    """Print a "Can't Import" message and return None."""

    # g.trace(verbose,moduleName,repr(pluginName))
    # if not pluginName: g.printStack()
    
    if verbose and not g.app.unitTesting:
        s = "Can not import %s" % moduleName
        if pluginName: s += " from plugin %s" % pluginName
        print s ; g.es(s,color="blue")

    return None
#@nonl
#@-node:ekr.20040917061619:g.cantImport
#@+node:ekr.20041219095213.1:g.importModule
def importModule (moduleName,pluginName=None,verbose=False):

    '''Try to import a module as Python's import command does.

    moduleName is the module's name, without file extension.'''
    
    module = sys.modules.get(moduleName)
    if not module:
        try:
            theFile = None
            import imp
            try:
                data = imp.find_module(moduleName) # This can open the file.
                theFile,pathname,description = data
                module = imp.load_module(moduleName,theFile,pathname,description)
            except ImportError:
                g.cantImport(moduleName,pluginName=pluginName,verbose=verbose)
            except Exception:
                g.es("unexpected exception in g.import",color='blue')
                g.es_exception()
        # Put no return statements before here!
        finally:
            if theFile: theFile.close()
    return module
#@nonl
#@-node:ekr.20041219095213.1:g.importModule
#@+node:ekr.20041219071407:g.importExtension
def importExtension (moduleName,pluginName=None,verbose=False):

    '''Try to import a module.  If that fails,
    try to import the module from Leo's extensions directory.

    moduleName is the module's name, without file extension.'''
    
    # g.trace(verbose,moduleName,pluginName)
    
    module = g.importModule(moduleName,pluginName=pluginName,verbose=False)

    if not module:
        module = g.importFromPath(moduleName,g.app.extensionsDir,
            pluginName=pluginName,verbose=verbose)

    return module
#@nonl
#@-node:ekr.20041219071407:g.importExtension
#@+node:zorcanda!.20050718101829:g.importFromPath
def importFromPath (name,path,pluginName=None,verbose=False):
    
    fn = g.shortFileName(name)
    moduleName,ext = g.os_path_splitext(fn)
    path = g.os_path_normpath(path)
    path = g.toEncodedString(path,app.tkEncoding)
    
    # g.trace(verbose,name,pluginName)
    module = sys.modules.get(moduleName)
    if not module:
        try:
            theFile = None
            import imp
            try:
                data = imp.find_module(moduleName,[path]) # This can open the file.
                theFile,pathname,description = data
                module = imp.load_module(moduleName,theFile,pathname,description)
            except ImportError:
                pass
            except Exception:
                g.es("unexpected exception in g.importFromPath",color='blue')
                g.es_exception()
        # Put no return statements before here!
        finally: 
            if theFile: theFile.close()
        
    if not module:
        g.cantImport(moduleName,pluginName=pluginName,verbose=verbose)

    return module
#@nonl
#@-node:zorcanda!.20050718101829:g.importFromPath
#@-node:ekr.20041219095213:import wrappers
#@+node:ekr.20040629162023:readLines class and generator
#@+node:EKR.20040612114220.3:g.readLinesGenerator
def readLinesGenerator(s):

    for line in g.splitLines(s):
        # g.trace(repr(line))
        yield line
    yield ''
#@nonl
#@-node:EKR.20040612114220.3:g.readLinesGenerator
#@+node:EKR.20040612114220.4:class readLinesClass
class readLinesClass:
    
    """A class whose next method provides a readline method for Python's tokenize module."""

    def __init__ (self,s):
        self.lines = g.splitLines(s)
        self.i = 0

    def next(self):
        if self.i < len(self.lines):
            line = self.lines[self.i]
            self.i += 1
        else:
            line = ''
        # g.trace(repr(line))
        return line
#@nonl
#@-node:EKR.20040612114220.4:class readLinesClass
#@-node:ekr.20040629162023:readLines class and generator
#@-node:EKR.20040612114220:Utility classes, functions & objects...
#@+node:ekr.20031218072017.3197:Whitespace...
#@+node:ekr.20031218072017.3198:computeLeadingWhitespace
# Returns optimized whitespace corresponding to width with the indicated tab_width.

def computeLeadingWhitespace (width, tab_width):

    if width <= 0:
        return ""
    if tab_width > 1:
        tabs   = width / tab_width
        blanks = width % tab_width
        return ('\t' * tabs) + (' ' * blanks)
    else: # 7/3/02: negative tab width always gets converted to blanks.
        return (' ' * width)
#@nonl
#@-node:ekr.20031218072017.3198:computeLeadingWhitespace
#@+node:ekr.20031218072017.3199:computeWidth
# Returns the width of s, assuming s starts a line, with indicated tab_width.

def computeWidth (s, tab_width):
        
    w = 0
    for ch in s:
        if ch == '\t':
            w += (abs(tab_width) - (w % abs(tab_width)))
        else:
            w += 1
    return w
#@nonl
#@-node:ekr.20031218072017.3199:computeWidth
#@+node:ekr.20031218072017.3200:get_leading_ws
def get_leading_ws(s):
    
    """Returns the leading whitespace of 's'."""

    i = 0 ; n = len(s)
    while i < n and s[i] in (' ','\t'):
        i += 1
    return s[0:i]
#@-node:ekr.20031218072017.3200:get_leading_ws
#@+node:ekr.20031218072017.3201:optimizeLeadingWhitespace
# Optimize leading whitespace in s with the given tab_width.

def optimizeLeadingWhitespace (line,tab_width):

    i, width = g.skip_leading_ws_with_indent(line,0,tab_width)
    s = g.computeLeadingWhitespace(width,tab_width) + line[i:]
    return s
#@nonl
#@-node:ekr.20031218072017.3201:optimizeLeadingWhitespace
#@+node:ekr.20040723093558:regularizeTrailingNewlines
#@+at
# 
# The caller should call g.stripBlankLines before calling this routine if 
# desired.
# 
# This routine does _not_ simply call rstrip(): that would delete all trailing 
# whitespace-only lines, and in some cases that would change the meaning of 
# program or data.
# 
#@-at
#@@c

def regularizeTrailingNewlines(s,kind):
    
    """Kind is 'asis', 'zero' or 'one'."""
    
    pass
#@nonl
#@-node:ekr.20040723093558:regularizeTrailingNewlines
#@+node:ekr.20031218072017.3202:removeLeadingWhitespace
# Remove whitespace up to first_ws wide in s, given tab_width, the width of a tab.

def removeLeadingWhitespace (s,first_ws,tab_width):

    j = 0 ; ws = 0
    for ch in s:
        if ws >= first_ws:
            break
        elif ch == ' ':
            j += 1 ; ws += 1
        elif ch == '\t':
            j += 1 ; ws += (abs(tab_width) - (ws % abs(tab_width)))
        else: break
    if j > 0:
        s = s[j:]
    return s
#@nonl
#@-node:ekr.20031218072017.3202:removeLeadingWhitespace
#@+node:ekr.20031218072017.3203:removeTrailingWs
# Warning: string.rstrip also removes newlines!

def removeTrailingWs(s):

    j = len(s)-1
    while j >= 0 and (s[j] == ' ' or s[j] == '\t'):
        j -= 1
    return s[:j+1]
#@-node:ekr.20031218072017.3203:removeTrailingWs
#@+node:ekr.20031218072017.3204:skip_leading_ws
# Skips leading up to width leading whitespace.

def skip_leading_ws(s,i,ws,tab_width):

    count = 0
    while count < ws and i < len(s):
        ch = s[i]
        if ch == ' ':
            count += 1
            i += 1
        elif ch == '\t':
            count += (abs(tab_width) - (count % abs(tab_width)))
            i += 1
        else: break

    return i
#@nonl
#@-node:ekr.20031218072017.3204:skip_leading_ws
#@+node:ekr.20031218072017.3205:skip_leading_ws_with_indent
def skip_leading_ws_with_indent(s,i,tab_width):

    """Skips leading whitespace and returns (i, indent), 
    
    - i points after the whitespace
    - indent is the width of the whitespace, assuming tab_width wide tabs."""

    count = 0 ; n = len(s)
    while i < n:
        ch = s[i]
        if ch == ' ':
            count += 1
            i += 1
        elif ch == '\t':
            count += (abs(tab_width) - (count % abs(tab_width)))
            i += 1
        else: break

    return i, count
#@nonl
#@-node:ekr.20031218072017.3205:skip_leading_ws_with_indent
#@+node:ekr.20040723093558.1:stripBlankLines
def stripBlankLines(s):
    
    lines = g.splitLines(s)

    for i in xrange(len(lines)):

        line = lines[i]
        j = g.skip_ws(line,0)
        if j >= len(line):
            lines[i] = ''
            # g.trace("%4d %s" % (i,repr(lines[i])))
        elif line[j] == '\n':
            lines[i] = '\n'
            # g.trace("%4d %s" % (i,repr(lines[i])))
            
    return ''.join(lines)
#@-node:ekr.20040723093558.1:stripBlankLines
#@-node:ekr.20031218072017.3197:Whitespace...
#@-others
#@-node:ekr.20031218072017.3093:@thin leoGlobals.py
#@-leo
