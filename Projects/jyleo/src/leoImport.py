#@+leo-ver=4-thin
#@+node:ekr.20031218072017.3206:@thin leoImport.py
#@@language python
#@@tabwidth -4
#@@pagewidth 80  

import leoGlobals as g
import leoTest # Support for unit tests.
import string

class baseLeoImportCommands:
    """The base class for Leo's import commands."""
    #@    @+others
    #@+node:ekr.20031218072017.3207:import.__init__
    def __init__ (self,c):
    
        self.c = c
        
        # New in 4.3: honor any tabwidth directive in effect when importing files.
        self.tabwidth =  c.tab_width
    
        # Set by ImportFilesFommand.
        self.treeType = "@file" # "@root" or "@file"
        # Set by ImportWebCommand.
        self.webType = "@noweb" # "cweb" or "noweb"
    
        # Set by create_outline.
        self.fileName = None # The original file name, say x.cpp
        self.methodName = None # x, as in < < x methods > > =
        self.fileType = None # ".py", ".c", etc.
        self.rootLine = "" # Empty or @root + self.fileName
    
        # Support of output_newline option
        self.output_newline = g.getOutputNewline(c=c)
        
        # Used by Importers.
        self.web_st = []
        self.encoding = g.app.tkEncoding # 2/25/03: was "utf-8"
    #@nonl
    #@-node:ekr.20031218072017.3207:import.__init__
    #@+node:ekr.20031218072017.3209:Import
    #@+node:ekr.20031218072017.3210:createOutline
    def createOutline (self,fileName,parent):
    
        c = self.c ; current = c.currentVnode()
        junk,self.fileName = g.os_path_split(fileName)
        self.methodName,ext = g.os_path_splitext(self.fileName)
        self.fileType = ext
        self.setEncoding()
        # g.trace(self.fileName,self.fileType)
        # All file types except the following just get copied to the parent node.
        ext = ext.lower()
        appendFileFlag = ext not in (
            ".c", ".cpp", ".cxx", ".el", ".java", ".pas", ".py", ".pyw", ".php")
        #@    << Read file into s >>
        #@+node:ekr.20031218072017.3211:<< Read file into s >>
        try:
            theFile = open(fileName)
            s = theFile.read()
            s = g.toUnicode(s,self.encoding)
            theFile.close()
        except IOError:
            g.es("can not open " + fileName)
            leoTest.fail()
            return None
        #@nonl
        #@-node:ekr.20031218072017.3211:<< Read file into s >>
        #@nl
        # Create the top-level headline.
        v = parent.insertAsLastChild()
        c.undoer.setUndoParams("Import",v,select=current)
        if self.treeType == "@file":
            v.initHeadString("@file " + fileName)
        else:
            v.initHeadString(fileName)
            
        self.rootLine = g.choose(self.treeType=="@file","","@root-code "+self.fileName+'\n')
    
        if appendFileFlag:
            body = "@ignore\n"
            if ext in (".html",".htm"): body += "@language html\n"
            if ext in (".txt",".text"): body += "@nocolor\n"
            v.setBodyStringOrPane(body + self.rootLine + s)
        elif ext in (".c", ".cpp", ".cxx"):
            self.scanCText(s,v)
        elif ext == ".el":
            self.scanElispText(s,v)
        elif ext in (".fs", ".fi"):
            self.scanForthText(s,v)
        elif ext == ".java":
            self.scanJavaText(s,v,True) #outer level
        elif ext == ".pas":
            self.scanPascalText(s,v)
        elif ext in (".py", ".pyw"):
            self.scanPythonText(s,v)
        elif ext == ".php":
            self.scanPHPText(s,v) # 08-SEP-2002 DTHEIN
        else:
            g.es("createOutline: can't happen")
        return v
    #@nonl
    #@-node:ekr.20031218072017.3210:createOutline
    #@+node:ekr.20041126042730:getTabWidth
    def getTabWidth (self):
        
        d = g.scanDirectives(self.c)
        w = d.get("tabwidth")
        if w not in (0,None):
            return w
        else:
            return self.c.tab_width
    #@nonl
    #@-node:ekr.20041126042730:getTabWidth
    #@+node:ekr.20031218072017.1810:importDerivedFiles
    def importDerivedFiles (self,parent,paths):
        
        c = self.c ; at = c.atFileCommands
        current = c.currentVnode()
        self.tab_width = self.getTabWidth() # New in 4.3.
        c.beginUpdate()
        
        for fileName in paths:
            #@        << set isThin if fileName is a thin derived file >>
            #@+node:ekr.20040930135204:<< set isThin if fileName is a thin derived file >>
            fileName = g.os_path_normpath(fileName)
            
            try:
                theFile = open(fileName,'rb')
                isThin = at.scanHeaderForThin(theFile,fileName)
                theFile.close()
            except IOError:
                isThin = False
            #@nonl
            #@-node:ekr.20040930135204:<< set isThin if fileName is a thin derived file >>
            #@nl
            v = parent.insertAfter()
            if isThin:
                
                at.forceGnxOnPosition( v )
                v.initHeadString("@thin " + fileName)
                c.undoer.setUndoParams("Import",v,select=current)
                at.read(v,thinFile=True)
    
            else:
                v.initHeadString("Imported @file " + fileName)
                c.undoer.setUndoParams("Import",v,select=current)
                at.read(v,importFileName=fileName)
            c.selectVnode(v)
            v.expand()
    
        c.endUpdate()
    #@-node:ekr.20031218072017.1810:importDerivedFiles
    #@+node:ekr.20031218072017.3212:importFilesCommand
    def importFilesCommand (self,files,treeType,
        perfectImport=True,testing=False,verbose=False):
    
        c = self.c
        if c == None: return
        v = current = c.currentVnode()
        if current == None: return
        if len(files) < 1: return
        self.tab_width = self.getTabWidth() # New in 4.3.
        self.treeType = treeType
        c.beginUpdate()
        if 1: # range of update...
            if len(files) == 2:
                #@            << Create a parent for two files having a common prefix >>
                #@+node:ekr.20031218072017.3213:<< Create a parent for two files having a common prefix >>
                #@+at 
                #@nonl
                # The two filenames have a common prefix everything before the 
                # last period is the same.  For example, x.h and x.cpp.
                #@-at
                #@@c
                
                name0 = files[0]
                name1 = files[1]
                prefix0, junk = g.os_path_splitext(name0)
                prefix1, junk = g.os_path_splitext(name1)
                if len(prefix0) > 0 and prefix0 == prefix1:
                    current = current.insertAsLastChild()
                    junk, nameExt = g.os_path_split(prefix1)
                    name,ext = g.os_path_splitext(prefix1)
                    current.initHeadString(name)
                #@nonl
                #@-node:ekr.20031218072017.3213:<< Create a parent for two files having a common prefix >>
                #@nl
            for fileName in files:
                v = self.createOutline(fileName,current)
                if v: # createOutline may fail.
                    perfectImport = False ###
                    testing = True; verbose = True
                    if perfectImport and treeType == "@file": # Can't correct @root trees.
                        self.perfectImport(fileName,v,testing=testing,verbose=verbose,verify=False)
                    else:
                        g.es("imported " + fileName,color="blue")
                    v.contract()
                    v.setDirty()
                    c.setChanged(True)
            c.validateOutline()
            current.expand()
        c.endUpdate()
        c.selectVnode(current)
    #@nonl
    #@-node:ekr.20031218072017.3212:importFilesCommand
    #@+node:ekr.20031218072017.3214:importFlattenedOutline & allies
    #@+node:ekr.20031218072017.3215:convertMoreString/StringsToOutlineAfter
    # Used by paste logic.
    
    def convertMoreStringToOutlineAfter (self,s,firstVnode):
        s = string.replace(s,"\r","")
        strings = string.split(s,"\n")
        return self.convertMoreStringsToOutlineAfter(strings,firstVnode)
    
    # Almost all the time spent in this command is spent here.
    
    def convertMoreStringsToOutlineAfter (self,strings,firstVnode):
        
        __pychecker__ = '--no-objattrs' # suppress bad warnings re lastVnode.
    
        c = self.c
        if len(strings) == 0: return None
        if not self.stringsAreValidMoreFile(strings): return None
        c.beginUpdate()
        firstLevel, junk = self.moreHeadlineLevel(strings[0])
        lastLevel = -1 ; theRoot = lastVnode = None
        index = 0
        while index < len(strings):
            progress = index
            s = strings[index]
            level, newFlag = self.moreHeadlineLevel(s)
            level -= firstLevel
            if level >= 0:
                #@            << Link a new vnode v into the outline >>
                #@+node:ekr.20031218072017.3216:<< Link a new vnode v into the outline >>
                assert(level >= 0)
                if lastVnode is None:
                    # g.trace(firstVnode)
                    theRoot = v = firstVnode.insertAfter()
                elif level == lastLevel:
                    v = lastVnode.insertAfter()
                elif level == lastLevel + 1:
                    v = lastVnode.insertAsNthChild(0)
                else:
                    assert(level < lastLevel)
                    while level < lastLevel:
                        lastLevel -= 1
                        lastVnode = lastVnode.parent()
                        assert(lastVnode)
                        assert(lastLevel >= 0)
                    v = lastVnode.insertAfter()
                lastVnode = v
                lastLevel = level
                #@nonl
                #@-node:ekr.20031218072017.3216:<< Link a new vnode v into the outline >>
                #@nl
                #@            << Set the headline string, skipping over the leader >>
                #@+node:ekr.20031218072017.3217:<< Set the headline string, skipping over the leader >>
                j = 0
                while g.match(s,j,'\t'):
                    j += 1
                if g.match(s,j,"+ ") or g.match(s,j,"- "):
                    j += 2
                
                v.initHeadString(s[j:])
                #@nonl
                #@-node:ekr.20031218072017.3217:<< Set the headline string, skipping over the leader >>
                #@nl
                #@            << Count the number of following body lines >>
                #@+node:ekr.20031218072017.3218:<< Count the number of following body lines >>
                bodyLines = 0
                index += 1 # Skip the headline.
                while index < len(strings):
                    s = strings[index]
                    level, junk = self.moreHeadlineLevel(s)
                    level -= firstLevel
                    if level >= 0:
                        break
                    # Remove first backslash of the body line.
                    if g.match(s,0,'\\'):
                        strings[index] = s[1:]
                    bodyLines += 1
                    index += 1
                #@nonl
                #@-node:ekr.20031218072017.3218:<< Count the number of following body lines >>
                #@nl
                #@            << Add the lines to the body text of v >>
                #@+node:ekr.20031218072017.3219:<< Add the lines to the body text of v >>
                if bodyLines > 0:
                    body = ""
                    n = index - bodyLines
                    while n < index:
                        body += strings[n]
                        if n != index - 1:
                            body += "\n"
                        n += 1
                    v.setTnodeText(body)
                #@nonl
                #@-node:ekr.20031218072017.3219:<< Add the lines to the body text of v >>
                #@nl
                v.setDirty()
            else: index += 1
            assert progress < index
        if theRoot:
            theRoot.setDirty()
            c.setChanged(True)
        c.endUpdate()
        return theRoot
    #@nonl
    #@-node:ekr.20031218072017.3215:convertMoreString/StringsToOutlineAfter
    #@+node:ekr.20031218072017.3220:importFlattenedOutline
    # On entry,files contains at most one file to convert.
    def importFlattenedOutline (self,files):
    
        c = self.c ; current = c.currentVnode()
        if current == None: return
        if len(files) < 1: return
        self.setEncoding()
        fileName = files[0]
        #@    << Read the file into array >>
        #@+node:ekr.20031218072017.3221:<< Read the file into array >>
        try:
            theFile = open(fileName)
            s = theFile.read()
            s = string.replace(s,"\r","")
            s = g.toUnicode(s,self.encoding)
            array = string.split(s,"\n")
            theFile.close()
        except IOError:
            g.es("Can not open " + fileName, color="blue")
            leoTest.fail()
            return
        #@-node:ekr.20031218072017.3221:<< Read the file into array >>
        #@nl
        # Convert the string to an outline and insert it after the current node.
        newVnode = self.convertMoreStringsToOutlineAfter(array,current)
        if newVnode:
            c.undoer.setUndoParams("Import",newVnode,select=current)
            c.endEditing()
            c.validateOutline()
            c.editPosition(newVnode)
            newVnode.setDirty()
            c.setChanged(True)
        else:
            g.es(fileName + " is not a valid MORE file.")
    #@nonl
    #@-node:ekr.20031218072017.3220:importFlattenedOutline
    #@+node:ekr.20031218072017.3222:moreHeadlineLevel
    # return the headline level of s,or -1 if the string is not a MORE headline.
    def moreHeadlineLevel (self,s):
    
        level = 0 ; i = 0
        while g.match(s,i,'\t'):
            level += 1
            i += 1
        plusFlag = g.choose(g.match(s,i,"+"),True,False)
        if g.match(s,i,"+ ") or g.match(s,i,"- "):
            return level, plusFlag
        else:
            return -1, plusFlag
    #@nonl
    #@-node:ekr.20031218072017.3222:moreHeadlineLevel
    #@+node:ekr.20031218072017.3223:stringIs/stringsAreValidMoreFile
    # Used by paste logic.
    
    def stringIsValidMoreFile (self,s):
        
        s = string.replace(s,"\r","")
        strings = string.split(s,"\n")
        return self.stringsAreValidMoreFile(strings)
    
    def stringsAreValidMoreFile (self,strings):
    
        if len(strings) < 1: return False
        level1, plusFlag = self.moreHeadlineLevel(strings[0])
        if level1 == -1: return False
        # Check the level of all headlines.
        i = 0 ; 	lastLevel = level1
        while i < len(strings):
            s = strings[i] ; i += 1
            level, newFlag = self.moreHeadlineLevel(s)
            if level > 0:
                if level < level1 or level > lastLevel + 1:
                    return False # improper level.
                elif level > lastLevel and plusFlag == False:
                    return False # parent of this node has no children.
                elif level == lastLevel and plusFlag == True:
                    return False # last node has missing child.
                else:
                    lastLevel = level
                    plusFlag = newFlag
        return True
    #@nonl
    #@-node:ekr.20031218072017.3223:stringIs/stringsAreValidMoreFile
    #@-node:ekr.20031218072017.3214:importFlattenedOutline & allies
    #@+node:ekr.20031218072017.3224:importWebCommand & allies
    #@+node:ekr.20031218072017.3225:createOutlineFromWeb
    def createOutlineFromWeb (self,path,parent):
    
        c = self.c ; current = c.currentVnode()
        junk, fileName = g.os_path_split(path)
        # Create the top-level headline.
        v = parent.insertAsLastChild()
        c.undoer.setUndoParams("Import",v,select=current)
        v.initHeadString(fileName)
        if self.webType=="cweb":
            v.setBodyStringOrPane("@ignore\n" + self.rootLine + "@language cweb")
    
        # Scan the file, creating one section for each function definition.
        self.scanWebFile(path,v)
        return v
    #@nonl
    #@-node:ekr.20031218072017.3225:createOutlineFromWeb
    #@+node:ekr.20031218072017.3226:importWebCommand
    def importWebCommand (self,files,webType):
    
        c = self.c ; current = c.currentVnode()
        if current == None: return
        if not files: return
        self.tab_width = self.getTabWidth() # New in 4.3.
        self.webType = webType
    
        c.beginUpdate()
        for fileName in files:
            v = self.createOutlineFromWeb(fileName,current)
            v.contract()
            v.setDirty()
            c.setChanged(True)
        c.selectVnode(current)
        c.endUpdate()
    #@nonl
    #@-node:ekr.20031218072017.3226:importWebCommand
    #@+node:ekr.20031218072017.3227:findFunctionDef
    def findFunctionDef (self,s,i):
        
        # Look at the next non-blank line for a function name.
        i = g.skip_ws_and_nl(s,i)
        k = g.skip_line(s,i)
        name = None
        while i < k:
            if g.is_c_id(s[i]):
                j = i ; i = g.skip_c_id(s,i) ; name = s[j:i]
            elif s[i] == '(':
                if name: return name
                else: break
            else: i += 1
        return None
    #@nonl
    #@-node:ekr.20031218072017.3227:findFunctionDef
    #@+node:ekr.20031218072017.3228:scanBodyForHeadline
    #@+at 
    #@nonl
    # This method returns the proper headline text.
    # 
    # 1. If s contains a section def, return the section ref.
    # 2. cweb only: if s contains @c, return the function name following the 
    # @c.
    # 3. cweb only: if s contains @d name, returns @d name.
    # 4. Otherwise, returns "@"
    #@-at
    #@@c
    
    def scanBodyForHeadline (self,s):
        
        if self.webType == "cweb":
            #@        << scan cweb body for headline >>
            #@+node:ekr.20031218072017.3229:<< scan cweb body for headline >>
            i = 0
            while i < len(s):
                i = g.skip_ws_and_nl(s,i)
                # line = g.get_line(s,i) ; g.trace(line)
                # Allow constructs such as @ @c, or @ @<.
                if self.isDocStart(s,i):
                    i += 2 ; i = g.skip_ws(s,i)
                if g.match(s,i,"@d") or g.match(s,i,"@f"):
                    # Look for a macro name.
                    directive = s[i:i+2]
                    i = g.skip_ws(s,i+2) # skip the @d or @f
                    if i < len(s) and g.is_c_id(s[i]):
                        j = i ; g.skip_c_id(s,i) ; return s[j:i]
                    else: return directive
                elif g.match(s,i,"@c") or g.match(s,i,"@p"):
                    # Look for a function def.
                    name = self.findFunctionDef(s,i+2)
                    return g.choose(name,name,"outer function")
                elif g.match(s,i,"@<"):
                    # Look for a section def.
                    # A small bug: the section def must end on this line.
                    j = i ; k = g.find_on_line(s,i,"@>")
                    if k > -1 and (g.match(s,k+2,"+=") or g.match(s,k+2,"=")):
                        return s[j:k+2] # return the section ref.
                i = g.skip_line(s,i)
            #@nonl
            #@-node:ekr.20031218072017.3229:<< scan cweb body for headline >>
            #@nl
        else:
            #@        << scan noweb body for headline >>
            #@+node:ekr.20031218072017.3230:<< scan noweb body for headline >>
            i = 0
            while i < len(s):
                i = g.skip_ws_and_nl(s,i)
                # line = g.get_line(s,i) ; g.trace(line)
                if g.match(s,i,"<<"):
                    k = g.find_on_line(s,i,">>=")
                    if k > -1:
                        ref = s[i:k+2]
                        name = string.strip(s[i+2:k])
                        if name != "@others":
                            return ref
                else:
                    name = self.findFunctionDef(s,i)
                    if name:
                        return name
                i = g.skip_line(s,i)
            #@nonl
            #@-node:ekr.20031218072017.3230:<< scan noweb body for headline >>
            #@nl
        return "@" # default.
    #@nonl
    #@-node:ekr.20031218072017.3228:scanBodyForHeadline
    #@+node:ekr.20031218072017.3231:scanWebFile (handles limbo)
    def scanWebFile (self,fileName,parent):
    
        theType = self.webType
        lb = g.choose(theType=="cweb","@<","<<")
        rb = g.choose(theType=="cweb","@>",">>")
    
        try: # Read the file into s.
            f = open(fileName)
            s = f.read()
        except:
            g.es("Can not import " + fileName, color="blue")
            return
    
        #@    << Create a symbol table of all section names >>
        #@+node:ekr.20031218072017.3232:<< Create a symbol table of all section names >>
        i = 0 ; 	self.web_st = []
        while i < len(s):
            i = g.skip_ws_and_nl(s,i)
            # line = g.get_line(s,i) ; g.trace(line)
            if self.isDocStart(s,i):
                if theType == "cweb": i += 2
                else: i = g.skip_line(s,i)
            elif theType == "cweb" and g.match(s,i,"@@"):
                i += 2
            elif g.match(s,i,lb):
                i += 2 ; j = i ; k = g.find_on_line(s,j,rb)
                if k > -1: self.cstEnter(s[j:k])
            else: i += 1
        
        # g.trace(self.cstDump())
        #@nonl
        #@-node:ekr.20031218072017.3232:<< Create a symbol table of all section names >>
        #@nl
        #@    << Create nodes for limbo text and the root section >>
        #@+node:ekr.20031218072017.3233:<< Create nodes for limbo text and the root section >>
        i = 0
        while i < len(s):
            i = g.skip_ws_and_nl(s,i)
            if self.isModuleStart(s,i) or g.match(s,i,lb):
                break
            else: i = g.skip_line(s,i)
            
        j = g.skip_ws(s,0)
        if j < i:
            self.createHeadline(parent,"@ " + s[j:i],"Limbo")
        
        j = i
        if g.match(s,i,lb):
            while i < len(s):
                i = g.skip_ws_and_nl(s,i)
                if self.isModuleStart(s,i):
                    break
                else: i = g.skip_line(s,i)
            self.createHeadline(parent,s[j:i],g.angleBrackets(" @ "))
            
        # g.trace(g.get_line(s,i))
        #@nonl
        #@-node:ekr.20031218072017.3233:<< Create nodes for limbo text and the root section >>
        #@nl
        while i < len(s):
            progress = i
            #@        << Create a node for the next module >>
            #@+node:ekr.20031218072017.3234:<< Create a node for the next module >>
            if theType=="cweb":
                assert(self.isModuleStart(s,i))
                start = i
                if self.isDocStart(s,i):
                    i += 2
                    while i < len(s):
                        i = g.skip_ws_and_nl(s,i)
                        if self.isModuleStart(s,i): break
                        else: i = g.skip_line(s,i)
                #@    << Handle cweb @d, @f, @c and @p directives >>
                #@+node:ekr.20031218072017.3235:<< Handle cweb @d, @f, @c and @p directives >>
                if g.match(s,i,"@d") or g.match(s,i,"@f"):
                    i += 2 ; i = g.skip_line(s,i)
                    # Place all @d and @f directives in the same node.
                    while i < len(s):
                        i = g.skip_ws_and_nl(s,i)
                        if g.match(s,i,"@d") or g.match(s,i,"@f"): i = g.skip_line(s,i)
                        else: break
                    i = g.skip_ws_and_nl(s,i)
                    
                while i < len(s) and not self.isModuleStart(s,i):
                    i = g.skip_line(s,i)
                    i = g.skip_ws_and_nl(s,i)
                
                if g.match(s,i,"@c") or g.match(s,i,"@p"):
                    i += 2 ; 
                    while i < len(s):
                        i = g.skip_line(s,i)
                        i = g.skip_ws_and_nl(s,i)
                        if self.isModuleStart(s,i):
                            break
                #@nonl
                #@-node:ekr.20031218072017.3235:<< Handle cweb @d, @f, @c and @p directives >>
                #@nl
            else:
                assert(self.isDocStart(s,i)) # isModuleStart == isDocStart for noweb.
                start = i ; i = g.skip_line(s,i)
                while i < len(s):
                    i = g.skip_ws_and_nl(s,i)
                    if self.isDocStart(s,i): break
                    else: i = g.skip_line(s,i)
                
            body = s[start:i]
            body = self.massageWebBody(body)
            headline = self.scanBodyForHeadline(body)
            self.createHeadline(parent,body,headline)
            #@nonl
            #@-node:ekr.20031218072017.3234:<< Create a node for the next module >>
            #@nl
            assert(progress < i)
    #@nonl
    #@-node:ekr.20031218072017.3231:scanWebFile (handles limbo)
    #@+node:ekr.20031218072017.3236:Symbol table
    #@+node:ekr.20031218072017.3237:cstCanonicalize
    # We canonicalize strings before looking them up, but strings are entered in the form they are first encountered.
    
    def cstCanonicalize (self,s,lower=True):
        
        if lower:
            s = string.lower(s)
        s = string.replace(s,"\t"," ")
        s = string.replace(s,"\r","")
        s = string.replace(s,"\n"," ")
        s = string.replace(s,"  "," ")
        s = string.strip(s)
        return s
    #@nonl
    #@-node:ekr.20031218072017.3237:cstCanonicalize
    #@+node:ekr.20031218072017.3238:cstDump
    def cstDump (self):
    
        self.web_st.sort()
        s = "Web Symbol Table...\n\n"
        for name in self.web_st:
            s += name + "\n"
        return s
    #@nonl
    #@-node:ekr.20031218072017.3238:cstDump
    #@+node:ekr.20031218072017.3239:cstEnter
    # We only enter the section name into the symbol table if the ... convention is not used.
    
    def cstEnter (self,s):
    
        # Don't enter names that end in "..."
        s = string.rstrip(s)
        if s.endswith("..."): return
        
        # Put the section name in the symbol table, retaining capitalization.
        lower = self.cstCanonicalize(s,True)  # do lower
        upper = self.cstCanonicalize(s,False) # don't lower.
        for name in self.web_st:
            if string.lower(name) == lower:
                return
        self.web_st.append(upper)
    #@nonl
    #@-node:ekr.20031218072017.3239:cstEnter
    #@+node:ekr.20031218072017.3240:cstLookup
    # This method returns a string if the indicated string is a prefix of an entry in the web_st.
    
    def cstLookup (self,target):
        
        # Do nothing if the ... convention is not used.
        target = string.strip(target)
        if not target.endswith("..."): return target
        # Canonicalize the target name, and remove the trailing "..."
        ctarget = target[:-3]
        ctarget = self.cstCanonicalize(ctarget)
        ctarget = string.strip(ctarget)
        found = False ; result = target
        for s in self.web_st:
            cs = self.cstCanonicalize(s)
            if cs[:len(ctarget)] == ctarget:
                if found:
                    g.es("****** " + target + ": is also a prefix of: " + s)
                else:
                    found = True ; result = s
                    # g.es("replacing: " + target + " with: " + s)
        return result
    #@nonl
    #@-node:ekr.20031218072017.3240:cstLookup
    #@-node:ekr.20031218072017.3236:Symbol table
    #@-node:ekr.20031218072017.3224:importWebCommand & allies
    #@+node:EKR.20040506075328.2:perfectImport
    def perfectImport (self,fileName,p,testing=False,verbose=False,convertBlankLines=True,verify=True):
        
        #@    << about this algorithm >>
        #@+node:ekr.20040717112739:<< about this algorithm >>
        #@@nocolor
        #@+at
        # 
        # This algorithm corrects the result of an Import To @file command so 
        # that it is guaranteed that the result of writing the imported file 
        # will be identical to the original file except for any sentinels that 
        # have been inserted.
        # 
        # On entry, p points to the newly imported outline.
        # 
        # We correct the outline by applying Bernhard Mulder's algorithm.
        # 
        # 1.  We use the atFile.write code to write the newly imported outline 
        # to a string s.  This string contains represents a thin derived file, 
        # so it can be used to recreate then entire outline structure without 
        # any other information.
        # 
        # Splitting s into lines creates the fat_lines argument to mu methods.
        # 
        # 2. We make corrections to fat_lines using Mulder's algorithm.  The 
        # corrected fat_lines represents the corrected outline.  To do this, 
        # we set the arguments as follows:
        # 
        # - i_lines: fat_lines stripped of sentinels
        # - j_lines to the lines of the original imported file.
        # 
        # The algorithm updates fat_lines using diffs between i_lines and 
        # j_lines.
        # 
        # 3. Mulder's algorithm doesn't specify which nodes have been 
        # changed.  In fact, it Mulder's algorithm doesn't really understand 
        # nodes at all.  Therefore, if we want to mark changed nodes we do so 
        # by comparing the original version of the imported outline with the 
        # corrected version of the outline.
        #@-at
        #@nonl
        #@-node:ekr.20040717112739:<< about this algorithm >>
        #@nl
        c = p.c ; root = p.copy()
        at = c.atFileCommands
        if testing:
            #@        << clear all dirty bits >>
            #@+node:ekr.20040716065356:<< clear all dirty bits >>
            for p2 in p.self_and_subtree_iter():
                p2.clearDirty()
            #@nonl
            #@-node:ekr.20040716065356:<< clear all dirty bits >>
            #@nl
        #@    << Assign file indices >>
        #@+node:ekr.20040716064333:<< Assign file indices  >>
        nodeIndices = g.app.nodeIndices
        
        nodeIndices.setTimestamp()
        
        for p2 in root.self_and_subtree_iter():
            try: # Will fail for None or any pre 4.1 file index.
                theId,time,n = p2.v.t.fileIndex
            except TypeError:
                p2.v.t.fileIndex = nodeIndices.getNewIndex()
        #@nonl
        #@-node:ekr.20040716064333:<< Assign file indices  >>
        #@nl
        #@    << Write root's tree to to string s >>
        #@+node:ekr.20040716064333.1:<< Write root's tree to to string s >>
        at.write(root,thinFile=True,toString=True)
        s = at.stringOutput
        if not s: return
        #@-node:ekr.20040716064333.1:<< Write root's tree to to string s >>
        #@nl
    
        # Set up the data for the algorithm.
        mu = g.mulderUpdateAlgorithm(testing=testing,verbose=verbose)
        delims = g.comment_delims_from_extension(fileName)
        fat_lines = g.splitLines(s) # Keep the line endings.
        i_lines,mapping = mu.create_mapping(fat_lines,delims)
        j_lines = file(fileName).readlines()
        
        # Correct write_lines using the algorihm.
        if i_lines != j_lines:
            if verbose:
                g.es("Running Perfect Import",color="blue")
            write_lines = mu.propagateDiffsToSentinelsLines(i_lines,j_lines,fat_lines,mapping)
            if 1: # For testing.
                #@            << put the corrected fat lines in a new node >>
                #@+node:ekr.20040717132539:<< put the corrected fat lines in a new node >>
                write_lines_node = root.insertAfter()
                write_lines_node.initHeadString("write_lines")
                s = ''.join(write_lines)
                write_lines_node.scriptSetBodyString(s,encoding=g.app.tkEncoding)
                #@nonl
                #@-node:ekr.20040717132539:<< put the corrected fat lines in a new node >>
                #@nl
            #@        << correct root's tree using write_lines >>
            #@+node:ekr.20040717113036:<< correct root's tree using write_lines >>
            #@+at 
            #@nonl
            # Notes:
            # 1. This code must overwrite the newly-imported tree because the 
            # gnx's in
            # write_lines refer to those nodes.
            # 
            # 2. The code in readEndNode now reports when nodes change during 
            # importing. This
            # code also marks changed nodes.
            #@-at
            #@@c
            
            try:   
                at.correctedLines = 0
                at.targetFileName = "<perfectImport string-file>"
                at.inputFile = fo = g.fileLikeObject()
                at.file = fo # Strange, that this is needed.  Should be cleaned up.
                for line in write_lines:
                    fo.write(line)
                firstLines,junk,junk = c.atFileCommands.scanHeader(fo,at.targetFileName)
                # To do: pass params to readEndNode.
                at.readOpenFile(root,fo,firstLines,perfectImportRoot=root)
                n = at.correctedLines
                if verbose:
                    g.es("%d marked node%s corrected" % (n,g.choose(n==1,'','s')),color="blue")
            except:
                g.es("Exception in Perfect Import",color="red")
                g.es_exception()
                s = None
            #@nonl
            #@-node:ekr.20040717113036:<< correct root's tree using write_lines >>
            #@nl
        if verify:
            #@        << verify that writing the tree would produce the original file >>
            #@+node:ekr.20040718035658:<< verify that writing the tree would produce the original file >>
            try:
                # Read the original file into before_lines.
                before = file(fileName)
                before_lines = before.readlines()
                before.close()
                
                # Write the tree into after_lines.
                at.write(root,thinFile=True,toString=True)
                after_lines1 = g.splitLines(at.stringOutput)
                
                # Strip sentinels from after_lines and compare.
                after_lines = mu.removeSentinelsFromLines(after_lines1,delims)
                
                # A major kludge: Leo can not represent unindented blank lines in indented nodes!
                # We ignore the problem here by stripping whitespace from blank lines.
                # We shall need output options to handle such lines.
                if convertBlankLines:
                    mu.stripWhitespaceFromBlankLines(before_lines)
                    mu.stripWhitespaceFromBlankLines(after_lines)
                if before_lines == after_lines:
                    if verbose:
                        g.es("Perfect Import verified",color="blue")
                else:
                    leoTest.fail()
                    if verbose:
                        g.es("Perfect Import failed verification test!",color="red")
                        #@            << dump the files >>
                        #@+node:ekr.20040718045423:<< dump the files >>
                        print len(before_lines),len(after_lines)
                        
                        if len(before_lines)==len(after_lines):
                            for i in xrange(len(before_lines)):
                                extra = 3
                                if before_lines[i] != after_lines[i]:
                                    j = max(0,i-extra)
                                    print '-' * 20
                                    while j < i + extra + 1:
                                        leader = g.choose(i == j,"* ","  ")
                                        print "%s%3d" % (leader,j), repr(before_lines[j])
                                        print "%s%3d" % (leader,j), repr(after_lines[j])
                                        j += 1
                        else:
                            for i in xrange(min(len(before_lines),len(after_lines))):
                                if before_lines[i] != after_lines[i]:
                                    extra = 5
                                    print "first mismatch at line %d" % i
                                    print "printing %d lines after mismatch" % extra
                                    print "before..."
                                    for j in xrange(i+1+extra):
                                        print "%3d" % j, repr(before_lines[j])
                                    print
                                    print "after..."
                                    for k in xrange(1+extra):
                                        print "%3d" % (i+k), repr(after_lines[i+k])
                                    print
                                    print "with sentinels"
                                    j = 0 ; k = 0
                                    while k < i + 1 + extra:
                                        print "%3d" % k,repr(after_lines1[j])
                                        if not g.is_sentinel(after_lines1[j],delims):
                                            k += 1
                                        j += 1
                                    break
                        #@nonl
                        #@-node:ekr.20040718045423:<< dump the files >>
                        #@nl
            except IOError:
                g.es("Can not reopen %s!" % fileName,color="red")
                leoTest.fail()
            #@nonl
            #@-node:ekr.20040718035658:<< verify that writing the tree would produce the original file >>
            #@nl
    #@nonl
    #@-node:EKR.20040506075328.2:perfectImport
    #@+node:ekr.20031218072017.3241:Scanners for createOutline
    #@+node:ekr.20031218072017.2256:Python scanners
    #@+node:ekr.20031218072017.2257:scanPythonClass
    def scanPythonClass (self,s,i,start,parent):
    
        """Creates a child node c of parent for the class, and children of c for each def in the class."""
    
        # g.trace("self.tab_width",self.tab_width)
        # g.trace(g.get_line(s,i))
        classIndent = self.getLeadingIndent(s,i)
        #@    << set classname and headline, or return i >>
        #@+node:ekr.20031218072017.2258:<< set classname and headline, or return i >>
        # Skip to the class name.
        i = g.skip_ws(s,i)
        i = g.skip_c_id(s,i) # skip "class"
        i = g.skip_ws_and_nl(s,i)
        if i < len(s) and g.is_c_id(s[i]):
            j = i ; i = g.skip_c_id(s,i)
            classname = s[j:i]
            headline = "class " + classname
        else:
            return i
        #@nonl
        #@-node:ekr.20031218072017.2258:<< set classname and headline, or return i >>
        #@nl
        i = g.skip_line(s,i) # Skip the class line.
        #@    << create class_vnode >>
        #@+node:ekr.20031218072017.2259:<< create class_vnode  >>
        # Create the section name using the old value of self.methodName.
        if  self.treeType == "@file":
            prefix = ""
        else:
            prefix = g.angleBrackets(" " + self.methodName + " methods ") + "=\n\n"
            self.methodsSeen = True
        
        # i points just after the class line.
        
        # Add a docstring to the class node.
        docStringSeen = False
        j = g.skip_ws_and_nl(s,i)
        if g.match(s,j,'"""') or g.match(s,j,"'''"):
            j = g.skip_python_string(s,j)
            if j != len(s): # No scanning error.
                i = j ; docStringSeen = True
        
        body = s[start:i]
        body = self.undentBody(body)
        if docStringSeen: body = body + '\n'
        class_vnode = self.createHeadline(parent,prefix + body,headline)
        #@nonl
        #@-node:ekr.20031218072017.2259:<< create class_vnode  >>
        #@nl
        savedMethodName = self.methodName
        self.methodName = headline
        # Create a node for leading declarations of the class.
        i = self.scanPythonDecls(s,i,class_vnode,classIndent,indent_parent_ref_flag=True)
        #@    << create nodes for all defs of the class >>
        #@+node:ekr.20031218072017.2260:<< create nodes for all defs of the class >>
        indent =  self.getLeadingIndent(s,i)
        start = i = g.skip_blank_lines(s,i)
        parent_vnode = None
        # g.trace(classIndent)
        while i < len(s) and indent > classIndent:
            progress = i
            if g.is_nl(s,i):
                backslashNewline = i > 0 and g.match(s,i-1,"\\\n")
                j = g.skip_nl(s,i)
                if not backslashNewline:
                    indent = self.getLeadingIndent(s,j)
                    if indent > classIndent: i = j
                    else: break
                else: i = j
            elif g.match_c_word(s,i,"def"):
                if not parent_vnode:
                    #@            << create parent_vnode >>
                    #@+node:ekr.20031218072017.2261:<< create parent_vnode >>
                    # This must be done after the declaration reference is generated.
                    if self.treeType == "@file":
                        class_vnode.appendStringToBody("\t@others\n")
                    else:
                        ref = g.angleBrackets(" class " + classname + " methods ")
                        class_vnode.appendStringToBody("\t" + ref + "\n\n")
                    parent_vnode = class_vnode
                    #@nonl
                    #@-node:ekr.20031218072017.2261:<< create parent_vnode >>
                    #@nl
                i = start = self.scanPythonDef(s,i,start,parent_vnode)
                indent = self.getLeadingIndent(s,i)
            elif g.match_c_word(s,i,"class"):
                if not parent_vnode:
                    #@            << create parent_vnode >>
                    #@+node:ekr.20031218072017.2261:<< create parent_vnode >>
                    # This must be done after the declaration reference is generated.
                    if self.treeType == "@file":
                        class_vnode.appendStringToBody("\t@others\n")
                    else:
                        ref = g.angleBrackets(" class " + classname + " methods ")
                        class_vnode.appendStringToBody("\t" + ref + "\n\n")
                    parent_vnode = class_vnode
                    #@nonl
                    #@-node:ekr.20031218072017.2261:<< create parent_vnode >>
                    #@nl
                i = start = self.scanPythonClass(s,i,start,parent_vnode)
                indent = self.getLeadingIndent(s,i)
            elif s[i] == '#': i = g.skip_to_end_of_line(s,i)
            elif s[i] == '"' or s[i] == '\'': i = g.skip_python_string(s,i)
            else: i += 1
            assert(progress < i)
        #@nonl
        #@-node:ekr.20031218072017.2260:<< create nodes for all defs of the class >>
        #@nl
        #@    << append any other class material >>
        #@+node:ekr.20031218072017.2262:<< append any other class material >>
        s2 = s[start:i]
        if s2:
            class_vnode.appendStringToBody(s2)
        #@nonl
        #@-node:ekr.20031218072017.2262:<< append any other class material >>
        #@nl
        self.methodName = savedMethodName
        return i
    #@-node:ekr.20031218072017.2257:scanPythonClass
    #@+node:ekr.20031218072017.2263:scanPythonDef
    def scanPythonDef (self,s,i,start,parent):
    
        """Creates a node of parent for the def."""
    
        # g.trace(g.get_line(s,i))
        #@    << set headline or return i >>
        #@+node:ekr.20031218072017.2264:<< set headline or return i >>
        i = g.skip_ws(s,i)
        i = g.skip_c_id(s,i) # Skip the "def"
        i = g.skip_ws_and_nl(s,i)
        if i < len(s) and g.is_c_id(s[i]):
            j = i ; i = g.skip_c_id(s,i)
            headline = s[j:i]
            # g.trace("headline:" + headline)
        else: return i
        #@nonl
        #@-node:ekr.20031218072017.2264:<< set headline or return i >>
        #@nl
        #@    << skip the Python def >>
        #@+node:ekr.20031218072017.2265:<< skip the Python def >>
        # Set defIndent to the indentation of the def line.
        defIndent = self.getLeadingIndent(s,start)
        i = g.skip_line(s,i) # Skip the def line.
        indent = self.getLeadingIndent(s,i)
        #g.trace(defIndent,indent)
        #g.trace(g.get_line(s,i))
        while i < len(s) and indent > defIndent:
            progress = i
            ch = s[i]
            if g.is_nl(s,i):
                backslashNewline = i > 0 and g.match(s,i-1,"\\\n")
                i = g.skip_nl(s,i)
                if not backslashNewline:
                    indent = self.getLeadingIndent(s,i)
                    if indent <= defIndent:
                        break
            elif ch == '#':
                i = g.skip_to_end_of_line(s,i) # 7/29/02
            elif ch == '"' or ch == '\'':
                i = g.skip_python_string(s,i)
            else: i += 1
            assert(progress < i)
        #@nonl
        #@-node:ekr.20031218072017.2265:<< skip the Python def >>
        #@nl
        # Create the def node.
        savedMethodName = self.methodName
        self.methodName = headline
        #@    << Create def node >>
        #@+node:ekr.20031218072017.2266:<< Create def node >>
        # Create the prefix line for @root trees.
        if self.treeType == "@file":
            prefix = ""
        else:
            prefix = g.angleBrackets(" " + savedMethodName + " methods ") + "=\n\n"
            self.methodsSeen = True
        
        # Create body.
        start = g.skip_blank_lines(s,start)
        body = s[start:i]
        body = self.undentBody(body)
        
        # Create the node.
        self.createHeadline(parent,prefix + body,headline)
        
        #@-node:ekr.20031218072017.2266:<< Create def node >>
        #@nl
        self.methodName = savedMethodName
        return i
    #@-node:ekr.20031218072017.2263:scanPythonDef
    #@+node:ekr.20031218072017.2267:scanPythonDecls
    def scanPythonDecls (self,s,i,parent,indent,indent_parent_ref_flag=True):
        
        done = False ; start = i
        while not done and i < len(s):
            progress = i
            # g.trace(g.get_line(s,i))
            ch = s[i]
            if ch == '\n':
                backslashNewline = i > 0 and g.match(s,i-1,"\\\n")
                i = g.skip_nl(s,i)
                # 2/14/03: break on lesser indention.
                j = g.skip_ws(s,i)
                if not g.is_nl(s,j) and not g.match(s,j,"#") and not backslashNewline:
                    lineIndent = self.getLeadingIndent(s,i)
                    if lineIndent <= indent:
                        break
            elif ch == '#': i = g.skip_to_end_of_line(s,i)
            elif ch == '"' or ch == '\'':
                i = g.skip_python_string(s,i)
            elif g.is_c_id(ch):
                #@            << break on def or class >>
                #@+node:ekr.20031218072017.2268:<< break on def or class >>
                if g.match_c_word(s,i,"def") or g.match_c_word(s,i,"class"):
                    i = g.find_line_start(s,i)
                    done = True
                    break
                else:
                    i = g.skip_c_id(s,i)
                #@nonl
                #@-node:ekr.20031218072017.2268:<< break on def or class >>
                #@nl
            else: i += 1
            assert(progress < i)
        j = g.skip_blank_lines(s,start)
        if g.is_nl(s,j): j = g.skip_nl(s,j)
        if j < i:
            #@        << Create a child node for declarations >>
            #@+node:ekr.20031218072017.2269:<< Create a child node for declarations >>
            headline = ref = g.angleBrackets(" " + self.methodName + " declarations ")
            leading_tab = g.choose(indent_parent_ref_flag,"\t","")
            
            # Append the reference to the parent's body.
            parent.appendStringToBody(leading_tab + ref + "\n") # 7/6/02
            
            # Create the node for the decls.
            body = self.undentBody(s[j:i])
            if self.treeType == "@root":
                body = "@code\n\n" + body
            self.createHeadline(parent,body,headline)
            #@nonl
            #@-node:ekr.20031218072017.2269:<< Create a child node for declarations >>
            #@nl
        return i
    #@nonl
    #@-node:ekr.20031218072017.2267:scanPythonDecls
    #@+node:ekr.20031218072017.2270:scanPythonText
    # See the comments for scanCText for what the text looks like.
    
    def scanPythonText (self,s,parent):
    
        """Creates a child of parent for each Python function definition seen."""
    
        decls_seen = False ; start = i = 0
        self.methodsSeen = False
        while i < len(s):
            progress = i
            # g.trace(g.get_line(s,i))
            ch = s[i]
            if ch == '\n' or ch == '\r': i = g.skip_nl(s,i)
            elif ch == '#': i = g.skip_to_end_of_line(s,i)
            elif ch == '"' or ch == '\'': i = g.skip_python_string(s,i)
            elif g.is_c_id(ch):
                #@            << handle possible Python function or class >>
                #@+node:ekr.20031218072017.2271:<< handle possible Python function or class >>
                if g.match_c_word(s,i,"def") or g.match_word(s,i,"class"):
                    isDef = g.match_c_word(s,i,"def")
                    if not decls_seen:
                        parent.appendStringToBody("@ignore\n" + self.rootLine + "@language python\n")
                        i = start = self.scanPythonDecls(s,start,parent,-1,indent_parent_ref_flag=False)
                        decls_seen = True
                        if self.treeType == "@file": # 7/29/02
                            parent.appendStringToBody("@others\n") # 7/29/02
                    if isDef:
                        i = start = self.scanPythonDef(s,i,start,parent)
                    else:
                        i = start = self.scanPythonClass(s,i,start,parent)
                else:
                    i = g.skip_c_id(s,i)
                #@nonl
                #@-node:ekr.20031218072017.2271:<< handle possible Python function or class >>
                #@nl
            else: i += 1
            assert(progress < i)
        if not decls_seen: # 2/17/03
            parent.appendStringToBody("@ignore\n" + self.rootLine + "@language python\n")
        #@    << Append a reference to the methods of this file >>
        #@+node:ekr.20031218072017.2272:<< Append a reference to the methods of this file >>
        if self.treeType == "@root" and self.methodsSeen:
            parent.appendStringToBody(
                g.angleBrackets(" " + self.methodName + " methods ") + "\n\n")
        #@nonl
        #@-node:ekr.20031218072017.2272:<< Append a reference to the methods of this file >>
        #@nl
        #@    << Append any unused python text to the parent's body text >>
        #@+node:ekr.20031218072017.2273:<< Append any unused python text to the parent's body text >>
        # Do nothing if only whitespace is left.
        i = start ; i = g.skip_ws_and_nl(s,i)
        if i < len(s):
            parent.appendStringToBody(s[start:])
        #@nonl
        #@-node:ekr.20031218072017.2273:<< Append any unused python text to the parent's body text >>
        #@nl
    #@nonl
    #@-node:ekr.20031218072017.2270:scanPythonText
    #@-node:ekr.20031218072017.2256:Python scanners
    #@+node:ekr.20031218072017.3250:scanCText
    # Creates a child of parent for each C function definition seen.
    
    def scanCText (self,s,parent):
    
        #@    << define scanCText vars >>
        #@+node:ekr.20031218072017.3251:<< define scanCText vars >>
        c = self.c
        include_seen = method_seen = False
        methodKind = g.choose(self.fileType==".c","functions","methods")
        lparen = None   # Non-null if '(' seen at outer level.
        scan_start = function_start = 0
        name = None
        i = 0
        #@nonl
        #@-node:ekr.20031218072017.3251:<< define scanCText vars >>
        #@nl
        while i < len(s):
            # line = g.get_line(s,i) ; g.trace(line)
            ch = s[i]
            # These cases skip tokens.
            if ch == '/':
                #@            << handle possible C comments >>
                #@+node:ekr.20031218072017.3260:<< handle possible C comments >>
                if g.match(s,i,"//"):
                    i = g.skip_line(s,i)
                elif g.match(s,i,"/*"):
                    i = g.skip_block_comment(s,i)
                else:
                    i += 1
                #@nonl
                #@-node:ekr.20031218072017.3260:<< handle possible C comments >>
                #@nl
            elif ch == '"' or ch == '\'':
                i = g.skip_string(s,i)
            # These cases help determine where functions start.
            elif ch == '=':
                #@            << handle equal sign in C >>
                #@+node:ekr.20031218072017.3261:<< handle equal sign in C>>
                #@+at 
                #@nonl
                # We can not be seeing a function definition when we find an 
                # equal sign at the top level. Equal signs inside parentheses 
                # are handled by the open paren logic.
                #@-at
                #@@c
                
                i += 1 # skip the '='
                function_start = None # We can't be in a function.
                lparen = None   # We have not seen an argument list yet.
                i = g.skip_ws(s,i) # 6/9/04
                if g.match(s,i,'{'):
                    i = g.skip_braces(s,i)
                #@nonl
                #@-node:ekr.20031218072017.3261:<< handle equal sign in C>>
                #@nl
            elif ch == '(':
                #@            << handle open paren in C >>
                #@+node:ekr.20031218072017.3262:<< handle open paren in C >>
                lparen = i
                # This will skip any equal signs inside the paren.
                i = g.skip_parens(s,i)
                if g.match(s,i,')'):
                    i += 1
                    i = g.skip_ws_and_nl(s,i)
                    if g.match(s,i,';'):
                        lparen = None # not a function definition.
                else: lparen = None
                #@nonl
                #@-node:ekr.20031218072017.3262:<< handle open paren in C >>
                #@nl
            elif ch == ';':
                #@            << handle semicolon in C >>
                #@+node:ekr.20031218072017.3263:<< handle semicolon in C >>
                #@+at 
                #@nonl
                # A semicolon signals the end of a declaration, thereby 
                # potentially starting the _next_ function defintion.   
                # Declarations end a function definition unless we have 
                # already seen a parenthesis, in which case we are seeing an 
                # old-style function definition.
                #@-at
                #@@c
                
                i += 1 # skip the semicolon.
                if lparen == None:
                    function_start = i + 1 # The semicolon ends the declaration.
                #@nonl
                #@-node:ekr.20031218072017.3263:<< handle semicolon in C >>
                #@nl
            # These cases and the default case can create child nodes.
            elif ch == '#':
                #@            << handle # sign >>
                #@+node:ekr.20031218072017.3252:<< handle # sign >>
                # if statements may contain function definitions.
                i += 1  # Skip the '#'
                if not include_seen and g.match_c_word(s,i,"include"):
                    include_seen = True
                    #@    << create a child node for all #include statements >>
                    #@+node:ekr.20031218072017.3253:<< create a child node for all #include statements >>
                    # Scan back to the start of the line.
                    include_start = i = g.find_line_start(s,i)
                    
                    # Scan to the next line that is neither blank nor and #include.
                    i = g.skip_pp_directive(s,i)
                    i = g.skip_nl(s,i)
                    include_end = i
                    while i < len(s):
                        i = g.skip_ws_and_nl(s,i)
                        if g.match_c_word(s,i,"#include"):
                            i = g.skip_pp_directive(s,i)
                            i = g.skip_nl(s,i)
                            include_end = i
                        elif i + 2 < len(s) and s[i] == '\\':
                            # Handle possible comment.
                            if s[i+1] == '\\':
                                i = g.skip_to_end_of_line(s,i)
                            elif s[i+1] == '*':
                                i = g.skip_block_comment(s,i + 2)
                            else:
                                i = include_end ; break
                        else:
                            i = include_end ; break
                            
                    
                    headline = g.angleBrackets(" " + self.methodName + " #includes ")
                    body = s[include_start:include_end]
                    body = self.undentBody(body)
                    prefix = g.choose(self.treeType == "@file","","@code\n\n")
                    self.createHeadline(parent,prefix + body,headline)
                    parent.appendStringToBody("@ignore\n" + self.rootLine + "@language c\n")
                    
                    # Append any previous text to the parent's body.
                    save_ip = i ; i = scan_start
                    while i < include_start and g.is_ws_or_nl(s,i):
                        i += 1
                    if i < include_start:
                        parent.appendStringToBody(s[i:include_start])
                    scan_start = function_start = i = save_ip
                    # Append the headline to the parent's body.
                    parent.appendStringToBody(headline + "\n")
                    #@nonl
                    #@-node:ekr.20031218072017.3253:<< create a child node for all #include statements >>
                    #@nl
                else:
                    j = i
                    i = g.skip_pp_directive(s,i)
                #@nonl
                #@-node:ekr.20031218072017.3252:<< handle # sign >>
                #@nl
            elif ch == '{':
                #@            << handle open curly bracket in C >>
                #@+node:ekr.20031218072017.3254:<< handle open curly bracket in C >> (scans function)
                j = i = g.skip_braces(s,i) # Skip all inner blocks.
                
                # This may fail if #if's contain unmatched curly braces.
                if (g.match(s,i,'}') and lparen and name and function_start):
                    # Point i _after_ the last character of the function.
                    i += 1
                    if g.is_nl(s,i):
                        i = g.skip_nl(s,i)
                    function_end = i
                    if method_seen:
                        # Include everything after the last function.
                        function_start = scan_start 
                    else:
                        #@        << create a declaration node >>
                        #@+node:ekr.20031218072017.3255:<< create a declaration node >>
                        save_ip = i
                        i = scan_start
                        while i < function_start and g.is_ws_or_nl(s,i):
                            i += 1
                        if i < function_start:
                            headline = g.angleBrackets(" " + self.methodName + " declarations ")
                            # Append the headline to the parent's body.
                            parent.appendStringToBody(headline + "\n")
                            decls = s[scan_start:function_start]
                            decls = self.undentBody(decls)
                            if self.treeType == "@file":
                                body = decls
                            else:
                                body = "@code\n\n" + decls
                            self.createHeadline(parent,body,headline)
                        i = save_ip
                        scan_start = i
                        #@nonl
                        #@-node:ekr.20031218072017.3255:<< create a declaration node >>
                        #@nl
                        #@        << append C function/method reference to parent node >>
                        #@+node:ekr.20031218072017.3256:<< append C function/method reference to parent node >>
                        if self.treeType == "@file":
                            parent.appendStringToBody("@others\n")
                        else:
                            cweb = c.target_language == "cweb"
                            lb = g.choose(cweb,"@<","<<")
                            rb = g.choose(cweb,"@>",">>")
                            parent.appendStringToBody(
                                lb + " " + self.methodName + " " + methodKind + " " + rb + "\n")
                        #@nonl
                        #@-node:ekr.20031218072017.3256:<< append C function/method reference to parent node >>
                        #@nl
                    headline = name
                    body = s[function_start:function_end]
                    body = self.massageBody(body,"functions")
                    self.createHeadline(parent,body,headline)
                    
                    method_seen = True
                    scan_start = function_start = i # Set the start of the _next_ function.
                    lparen = None
                else:
                    i += 1
                #@nonl
                #@-node:ekr.20031218072017.3254:<< handle open curly bracket in C >> (scans function)
                #@nl
            elif g.is_c_id(ch):
                #@            << handle id, class, typedef, struct, union, namespace >>
                #@+node:ekr.20031218072017.3257:<< handle id, class, typedef, struct, union, namespace >>
                if g.match_c_word(s,i,"typedef"):
                    i = g.skip_typedef(s,i)
                    lparen = None
                elif g.match_c_word(s,i,"struct"):
                    i = g.skip_typedef(s,i)
                    # lparen = None ;  # This can appear in an argument list.
                elif g.match_c_word(s,i,"union"):
                    i = g.skip_typedef(s,i)
                    # lparen = None ;  # This can appear in an argument list.
                elif g.match_c_word(s,i,"namespace"):
                    g.trace("namespace")
                    #@    << create children for the namespace >>
                    #@+node:ekr.20031218072017.3258:<< create children for the namespace >>
                    #@+at 
                    #@nonl
                    # Namesspaces change the self.moduleName and recursively 
                    # call self function with a text covering only the range 
                    # of the namespace. This effectively changes the 
                    # definition line of any created child nodes. The 
                    # namespace is written to the top level.
                    #@-at
                    #@@c
                    
                    # skip the "namespace" keyword.
                    i += len("namespace")
                    i = g.skip_ws_and_nl(s,i)
                    # Skip the namespace name.
                    namespace_name_start = i
                    namespace_name_end = None
                    if i < len(s) and g.is_c_id(s[i]):
                        i = g.skip_c_id(s,i)
                        namespace_name_end = i - 1
                    else: namespace_name_start = None
                    # Skip the '{'
                    i = g.skip_ws_and_nl(s,i)
                    if g.match(s,i,'{') and namespace_name_start:
                        # g.trace(s[i],s[namespace_name_start:namespace_name_end+1])
                        inner_ip = i + 1
                        i = g.skip_braces(s,i)
                        if g.match(s,i,'}'):
                            # Append everything so far to the body.
                            if inner_ip > scan_start:
                                parent.appendStringToBody(s[scan_start:inner_ip])
                            # Save and change self.moduleName to namespaceName
                            savedMethodName = self.methodName
                            namespaceName = s[namespace_name_start:namespace_name_end+1]
                            self.methodName = "namespace " + namespaceName
                            # Recursively call this function .
                            self.scanCText(s[inner_ip:],parent)
                            # Restore self.moduleName and continue scanning.
                            self.methodName = savedMethodName
                            scan_start = function_start = i
                    #@nonl
                    #@-node:ekr.20031218072017.3258:<< create children for the namespace >>
                    #@nl
                # elif g.match_c_word(s,i,"class"):
                    # < < create children for the class > >
                else:
                    # Remember the last name before an open parenthesis.
                    if lparen == None:
                        j = i ; i = g.skip_c_id(s,i) ; name = s[j:i]
                    else:
                        i = g.skip_c_id(s,i)
                    #@    << test for operator keyword >>
                    #@+node:ekr.20031218072017.3259:<< test for operator keyword >>
                    # We treat a C++ a construct such as operator + as a function name.
                    if g.match(name,0,"operator"):
                        j = i
                        i = g.skip_ws(s,i) # Don't allow newline in headline.
                        if (i < len(s) and not g.is_c_id(s[i]) and
                            s[i]!=' ' and s[i]!='\n' and s[i]!='\r'):
                            while (i < len(s) and not g.is_c_id(s[i]) and
                                s[i]!=' ' and s[i]!='\n' and s[i] != '\r'):
                                i += 1
                            name = s[j:i] # extend the name.
                    #@nonl
                    #@-node:ekr.20031218072017.3259:<< test for operator keyword >>
                    #@nl
                #@-node:ekr.20031218072017.3257:<< handle id, class, typedef, struct, union, namespace >>
                #@nl
            else: i += 1
        #@    << Append any unused text to the parent's body text >>
        #@+node:ekr.20031218072017.3264:<< Append any unused text to the parent's body text >>
        # Used by C, Java and Pascal parsers.
        # Do nothing if only whitespace is left.
        
        i = g.skip_ws_and_nl(s,scan_start)
        if i < len(s):
            parent.appendStringToBody(s[scan_start:])
        #@nonl
        #@-node:ekr.20031218072017.3264:<< Append any unused text to the parent's body text >>
        #@nl
    #@nonl
    #@-node:ekr.20031218072017.3250:scanCText
    #@+node:ekr.20031218072017.3265:scanElispText & allies
    def scanElispText(self,s,v):
        
        c = self.c
        v.appendStringToBody("@ignore\n@language elisp\n")
        i = 0 ; start = 0
        while i < len(s):
            progress = i
            ch = s[i] ; # g.trace(g.get_line(s,i))
            if ch == ';':
                i = g.skip_line(s,i)
            elif ch == '(':
                j = self.skipElispParens(s,i)
                k = g.skip_ws(s,i+1)
                if g.match_word(s,k,"defun") or g.match_word(s,k,"defconst") or g.match_word(s,k,"defvar"):
                    data = s[start:i]
                    if data.strip():
                        self.createElispDataNode(v,data)
                    self.createElispFunction(v,s[i:j+1])
                    start = j+1
                i = j
            else:
                i += 1
            assert(progress < i)
        data = s[start:len(s)]
        if data.strip():
            self.createElispDataNode(v,data)
    #@nonl
    #@+node:ekr.20031218072017.3266:skipElispParens
    def skipElispParens (self,s,i):
        
        level = 0 ; n = len(s)
        assert(g.match(s,i,'('))
        
        while i < n:
            c = s[i]
            if c == '(':
                level += 1 ; i += 1
            elif c == ')':
                level -= 1
                if level <= 0:
                    return i
                i += 1
            elif c == '"': i = g.skip_string(s,i) # Single-quotes are not strings.
            elif g.match(s,i,";"):  i = g.skip_line(s,i)
            else: i += 1
        return i
    #@-node:ekr.20031218072017.3266:skipElispParens
    #@+node:ekr.20031218072017.3267:skipElispId
    def skipElispId (self,s,i):
    
        n = len(s)
        while i < n:
            c = s[i]
            if c in string.ascii_letters or c in string.digits or c == '-':
                i += 1
            else: break
        return i
    #@nonl
    #@-node:ekr.20031218072017.3267:skipElispId
    #@+node:ekr.20031218072017.3268:createElispFunction
    def createElispFunction (self,v,s):
        
        body = s
        i = 1 # Skip the '('
        i = g.skip_ws(s,i)
    
        # Set the prefix in the headline.
        assert(g.match(s,i,"defun") or g.match_word(s,i,"defconst") or g.match_word(s,i,"defvar"))
        if g.match_word(s,i,"defconst"):
            prefix = "const "
        elif g.match_word(s,i,"defvar"):
            prefix = "var "
        else:
            prefix = ""
    
        # Skip the "defun" or "defconst" or "defvar"
        i = self.skipElispId(s,i)
        
        # Get the following id.
        i = g.skip_ws(s,i)
        j = self.skipElispId(s,i)
        theId = prefix + s[i:j]
    
        self.createHeadline(v,body,theId)
    #@-node:ekr.20031218072017.3268:createElispFunction
    #@+node:ekr.20031218072017.3269:createElispDataNode
    def createElispDataNode (self,v,s):
        
        data = s
        # g.trace(len(data))
        
        # Skip blank lines and comment lines.
        i = 0
        while i < len(s):
            i = g.skip_ws_and_nl(s,i)
            if g.match(s,i,';'):
                i = g.skip_line(s,i)
            else: break
    
        # Find the next id, probably prefixed by an open paren.
        if g.match(s,i,"("):
            i = g.skip_ws(s,i+1)
        j = self.skipElispId(s,i)
        theId = s[i:j]
        if not theId:
            theId = "unnamed data"
    
        self.createHeadline(v,data,theId)
    #@nonl
    #@-node:ekr.20031218072017.3269:createElispDataNode
    #@-node:ekr.20031218072017.3265:scanElispText & allies
    #@+node:ekr.20041107094641:scanForthText
    def scanForthText (self,s,parent):
        
        """Minimal forth scanner - leave it to user to create nodes as they see fit."""
    
        parent.setBodyStringOrPane("@ignore\n" + "@language forth\n" + self.rootLine + s)
    #@nonl
    #@-node:ekr.20041107094641:scanForthText
    #@+node:ekr.20031218072017.3270:scanJavaText
    # Creates a child of parent for each Java function definition seen.
    
    def scanJavaText (self,s,parent,outerFlag): # True if at outer level.
    
        #@    << define scanJavaText vars >>
        #@+node:ekr.20031218072017.3271:<< define scanJavaText vars >>
        method_seen = False
        class_seen = False # True: class keyword seen at outer level.
        interface_seen = False # True: interface keyword seen at outer level.
        lparen = None  # not None if '(' seen at outer level.
        scan_start = 0
        name = None
        function_start = 0 # g.choose(outerFlag, None, 0)
        i = 0
        #@nonl
        #@-node:ekr.20031218072017.3271:<< define scanJavaText vars >>
        #@nl
        # if not outerFlag: g.trace("inner:",s)
        while i < len(s):
            # g.trace(g.get_line(s,i))
            ch = s[i]
            # These cases skip tokens.
            if ch == '/':
                #@            << handle possible Java comments >>
                #@+node:ekr.20031218072017.3277:<< handle possible Java comments >>
                if g.match(s,i,"//"):
                    i = g.skip_line(s,i)
                elif g.match(s,i,"/*"):
                    i = g.skip_block_comment(s,i)
                else:
                    i += 1
                #@nonl
                #@-node:ekr.20031218072017.3277:<< handle possible Java comments >>
                #@nl
            elif ch == '"' or ch == '\'': i = g.skip_string(s,i)
            # These cases help determine where functions start.
            elif ch == '=':
                #@            << handle equal sign in Java >>
                #@+node:ekr.20031218072017.3278:<< handle equal sign in Java >>
                #@+at 
                #@nonl
                # We can not be seeing a function definition when we find an 
                # equal sign at the top level. Equal signs inside parentheses 
                # are handled by the open paren logic.
                #@-at
                #@@c
                
                i += 1 # skip the '='
                function_start = 0 # 3/23/03: (bug fix: was None) We can't be in a function.
                lparen = None   # We have not seen an argument list yet.
                if g.match(s,i,'='):
                    i = g.skip_braces(s,i)
                #@nonl
                #@-node:ekr.20031218072017.3278:<< handle equal sign in Java >>
                #@nl
            elif ch == '(':
                #@            << handle open paren in Java >>
                #@+node:ekr.20031218072017.3279:<< handle open paren in Java >>
                lparen = i
                # This will skip any equal signs inside the paren.
                i = g.skip_parens(s,i)
                if g.match(s,i,')'):
                    i += 1
                    i = g.skip_ws_and_nl(s,i)
                    if g.match(s,i,';'):
                        lparen = None # not a function definition.
                else: lparen = None
                #@nonl
                #@-node:ekr.20031218072017.3279:<< handle open paren in Java >>
                #@nl
            elif ch == ';':
                #@            << handle semicolon in Java >>
                #@+node:ekr.20031218072017.3280:<< handle semicolon in Java >>
                #@+at 
                #@nonl
                # A semicolon signals the end of a declaration, thereby 
                # potentially starting the _next_ function defintion.   
                # Declarations end a function definition unless we have 
                # already seen a parenthesis, in which case we are seeing an 
                # old-style function definition.
                #@-at
                #@@c
                
                i += 1 # skip the semicolon.
                if lparen == None:
                    function_start = i + 1 # The semicolon ends the declaration.
                #@nonl
                #@-node:ekr.20031218072017.3280:<< handle semicolon in Java >>
                #@nl
                class_seen = False
            # These cases can create child nodes.
            elif ch == '{':
                #@            << handle open curly bracket in Java >>
                #@+node:ekr.20031218072017.3272:<< handle open curly bracket in Java >>
                brace_ip1 = i
                i = g.skip_braces(s,i) # Skip all inner blocks.
                brace_ip2 = i
                
                if not g.match (s,i,'}'):
                    g.es("unmatched '{'")
                elif not name:
                    i += 1
                elif (outerFlag and (class_seen or interface_seen)) or (not outerFlag and lparen):
                    # g.trace("starting:",name)
                    # g.trace("outerFlag:",outerFlag)
                    # g.trace("lparen:",lparen)
                    # g.trace("class_seen:",class_seen)
                    # g.trace("scan_start:",g.get_line_after(s,scan_start))
                    # g.trace("func_start:",g.get_line_after(s,function_start))
                    # g.trace("s:",g.get_line(s,i))
                
                    # Point i _after_ the last character of the method.
                    i += 1
                    if g.is_nl(s,i):
                        i = g.skip_nl(s,i)
                    function_end = i
                    headline = name
                    if outerFlag:
                        leader = "" ; decl_leader = ""
                        if class_seen:
                            headline = "class " + headline
                            methodKind = "classes"
                        else:
                            headline = "interface " + headline
                            methodKind = "interfaces"
                    else:
                        leader = "\t" # Indent only inner references.
                        decl_leader = "\n"  # Declaration leader for inner references.
                        methodKind = "methods"
                    if method_seen:
                        # Include everything after the last fucntion.
                        function_start = scan_start
                    else:
                        #@        << create a Java declaration node >>
                        #@+node:ekr.20031218072017.3273:<< create a Java declaration node >>
                        save_ip = i
                        i = scan_start
                        while i < function_start and g.is_ws_or_nl(s,i):
                            i += 1
                            
                        if outerFlag:
                            parent.appendStringToBody("@ignore\n" + self.rootLine + "@language java\n")
                        
                        if i < function_start:
                            decl_headline = g.angleBrackets(" " + self.methodName + " declarations ")
                        
                            # Append the headline to the parent's body.
                            parent.appendStringToBody(decl_leader + leader + decl_headline + "\n")
                            scan_start = g.find_line_start(s,scan_start) # Backtrack so we remove leading whitespace.
                            decls = s[scan_start:function_start]
                            decls = self.undentBody(decls)
                            body = g.choose(self.treeType == "@file",decls,"@code\n\n" + decls)
                            self.createHeadline(parent,body,decl_headline)
                        
                        i = save_ip
                        scan_start = i
                        #@nonl
                        #@-node:ekr.20031218072017.3273:<< create a Java declaration node >>
                        #@nl
                        #@        << append Java method reference to parent node >>
                        #@+node:ekr.20031218072017.3274:<< append Java method reference to parent node >>
                        if self.treeType == "@file":
                            if outerFlag:
                                parent.appendStringToBody("\n@others\n")
                            else:
                                parent.appendStringToBody("\n\t@others\n")
                        else:
                            kind = g.choose(outerFlag,"classes","methods")
                            ref_name = g.angleBrackets(" " + self.methodName + " " + kind + " ")
                            parent.appendStringToBody(leader + ref_name + "\n")
                        #@nonl
                        #@-node:ekr.20031218072017.3274:<< append Java method reference to parent node >>
                        #@nl
                    if outerFlag: # Create a class.
                        # Backtrack so we remove leading whitespace.
                        function_start = g.find_line_start(s,function_start)
                        body = s[function_start:brace_ip1+1]
                        body = self.massageBody(body,methodKind)
                        v = self.createHeadline(parent,body,headline)
                        #@        << recursively scan the text >>
                        #@+node:ekr.20031218072017.3275:<< recursively scan the text >>
                        # These mark the points in the present function.
                        # g.trace("recursive scan:",g.get_line(s,brace_ip1+ 1))
                        oldMethodName = self.methodName
                        self.methodName = headline
                        self.scanJavaText(s[brace_ip1+1:brace_ip2], # Don't include either brace.
                            v,False) # inner level
                        self.methodName = oldMethodName
                        #@-node:ekr.20031218072017.3275:<< recursively scan the text >>
                        #@nl
                        # Append the brace to the parent.
                        v.appendStringToBody("}")
                        i = brace_ip2 + 1 # Start after the closing brace.
                    else: # Create a method.
                        # Backtrack so we remove leading whitespace.
                        function_start = g.find_line_start(s,function_start)
                        body = s[function_start:function_end]
                        body = self.massageBody(body,methodKind)
                        self.createHeadline(parent,body,headline)
                        i = function_end
                    method_seen = True
                    scan_start = function_start = i # Set the start of the _next_ function.
                    lparen = None ; class_seen = False
                else: i += 1
                #@nonl
                #@-node:ekr.20031218072017.3272:<< handle open curly bracket in Java >>
                #@nl
            elif g.is_c_id(s[i]):
                #@            << skip and remember the Java id >>
                #@+node:ekr.20031218072017.3276:<< skip and remember the Java id >>
                if g.match_c_word(s,i,"class") or g.match_c_word(s,i,"interface"):
                    if g.match_c_word(s,i,"class"):
                        class_seen = True
                    else:
                        interface_seen = True
                    i = g.skip_c_id(s,i) # Skip the class or interface keyword.
                    i = g.skip_ws_and_nl(s,i)
                    if i < len(s) and g.is_c_id(s[i]):
                        # Remember the class or interface name.
                        j = i ; i = g.skip_c_id(s,i) ; name = s[j:i]
                else:
                    j = i ; i = g.skip_c_id(s,i)
                    if not lparen and not class_seen:
                        name = s[j:i] # Remember the name.
                #@nonl
                #@-node:ekr.20031218072017.3276:<< skip and remember the Java id >>
                #@nl
            else: i += 1
        #@    << Append any unused text to the parent's body text >>
        #@+node:ekr.20031218072017.3264:<< Append any unused text to the parent's body text >>
        # Used by C, Java and Pascal parsers.
        # Do nothing if only whitespace is left.
        
        i = g.skip_ws_and_nl(s,scan_start)
        if i < len(s):
            parent.appendStringToBody(s[scan_start:])
        #@nonl
        #@-node:ekr.20031218072017.3264:<< Append any unused text to the parent's body text >>
        #@nl
    #@nonl
    #@-node:ekr.20031218072017.3270:scanJavaText
    #@+node:ekr.20031218072017.3281:scanPascalText
    # Creates a child of parent for each Pascal function definition seen.
    
    def scanPascalText (self,s,parent):
    
        method_seen = False ; methodKind = "methods"
        scan_start = function_start = i = 0
        name = None
        while i < len(s):
            # line = g.get_line(s,i) ; g.trace(line)
            ch = s[i]
            if ch == '{': i = g.skip_pascal_braces(s,i)
            elif ch == '"' or ch == '\'': i = g.skip_pascal_string(s,i)
            elif g.match(s,i,"//"): i = g.skip_to_end_of_line(s,i)
            elif g.match(s,i,"(*"): i = g.skip_pascal_block_comment(s,i)
            elif g.is_c_id(s[i]):
                #@            << handle possible Pascal function >>
                #@+node:ekr.20031218072017.3282:<< handle possible Pascal function >>
                if g.match_c_word(s,i,"begin"):
                    i = g.skip_pascal_begin_end(s,i)
                    if g.match_c_word(s,i,"end"):
                        i = g.skip_c_id(s,i)
                elif (g.match_c_word(s,i,"function")  or g.match_c_word(s,i,"procedure") or
                    g.match_c_word(s,i,"constructor") or g.match_c_word(s,i,"destructor")):
                
                    # line = g.get_line(s,i) ; g.trace(line)
                    
                    start = i
                    i = g.skip_c_id(s,i)
                    i = g.skip_ws_and_nl(s,i)
                    #@    << remember the function name, or continue >>
                    #@+node:ekr.20031218072017.3285:<< remember the function name, or continue >>
                    if i < len(s) and g.is_c_id(s[i]):
                        j = i ; i = g.skip_c_id(s,i)
                        while i + 1 < len(s) and s[i] == '.' and g.is_c_id(s[i+1]):
                            i += 1 ; j = i
                            i = g.skip_c_id(s,i)
                        name = s[j:i]
                    else: continue
                    #@nonl
                    #@-node:ekr.20031218072017.3285:<< remember the function name, or continue >>
                    #@nl
                    #@    << skip the function definition, or continue >>
                    #@+node:ekr.20031218072017.3286:<< skip the function definition, or continue >>
                    #@<< skip past the semicolon >>
                    #@+node:ekr.20031218072017.3287:<< skip past the semicolon >>
                    while i < len(s) and s[i] != ';':
                        # The paremeter list may contain "inner" semicolons.
                        if s[i] == '(':
                            i = g.skip_parens(s,i)
                            if g.match(s,i,')'):
                                i += 1
                            else: break
                        else: i += 1
                    if g.match(s,i,';'):
                        i += 1
                    i = g.skip_ws_and_nl(s,i)
                    
                    if g.match_c_word(s,i,"var"):
                        # Skip to the next begin.
                        i = g.skip_c_id(s,i)
                        done = False
                        while i < len(s) and not done:
                            ch = s[i]
                            if ch == '{': i = g.skip_pascal_braces(s,i)
                            elif g.match(s,i,"//"): i = g.skip_to_end_of_line(s,i)
                            elif g.match(s,i,"(*"): i = g.skip_pascal_block_comment(s,i)
                            elif g.is_c_id(ch):
                                if g.match_c_word(s,i,"begin"): done = True
                                else: i = g.skip_c_id(s,i)
                            elif ch == '"' or ch == '\'': i = g.skip_pascal_string(s,i)
                            else: i += 1
                    #@nonl
                    #@-node:ekr.20031218072017.3287:<< skip past the semicolon >>
                    #@nl
                    
                    if not g.match_c_word(s,i,"begin"):
                        continue
                    # Skip to the matching end.
                    i = g.skip_pascal_begin_end(s,i)
                    if g.match_c_word(s,i,"end"):
                        i = g.skip_c_id(s,i)
                        i = g.skip_ws_and_nl(s,i)
                        if g.match(s,i,';'):
                            i += 1
                        i = g.skip_ws(s,i)
                        if g.is_nl(s,i):
                            i = g.skip_nl(s,i)
                    else: continue
                    #@nonl
                    #@-node:ekr.20031218072017.3286:<< skip the function definition, or continue >>
                    #@nl
                    if not method_seen:
                        method_seen = True
                        #@        << create a child node for leading declarations >>
                        #@+node:ekr.20031218072017.3283:<< create a child node for leading declarations >>
                        save_ip = i
                        i = scan_start
                        while i < start and g.is_ws_or_nl(s,i):
                            i += 1
                        if i < start:
                            parent.appendStringToBody("@ignore\n" + self.rootLine + "@language pascal\n")
                            headline = g.angleBrackets(self.methodName + " declarations ")
                            # Append the headline to the parent's body.
                            parent.appendStringToBody(headline + "\n")
                            if self.treeType == "@file":
                                body = s[scan_start:start]
                            else:
                                body = "@code\n\n" + s[scan_start:start]
                            body = self.undentBody(body)
                            self.createHeadline(parent,body,headline)
                        i = save_ip
                        scan_start = i
                        #@nonl
                        #@-node:ekr.20031218072017.3283:<< create a child node for leading declarations >>
                        #@nl
                        #@        << append noweb method reference to the parent node >>
                        #@+node:ekr.20031218072017.3288:<< append noweb method reference to the parent node >>
                        # Append the headline to the parent's body.
                        if self.treeType == "@file":
                            parent.appendStringToBody("@others\n")
                        else:
                            parent.appendStringToBody(
                                g.angleBrackets(" " + self.methodName + " methods ") + "\n")
                        #@nonl
                        #@-node:ekr.20031218072017.3288:<< append noweb method reference to the parent node >>
                        #@nl
                        function_start = start
                    else: function_start = scan_start
                    #@    << create a child node for the function >>
                    #@+node:ekr.20031218072017.3284:<< create a child node for the function >>
                    # Point i _after_ the last character of the function.
                    i = g.skip_ws(s,i)
                    if g.is_nl(s,i):
                        i = g.skip_nl(s,i)
                    function_end = i
                    headline = name
                    body = s[function_start:function_end]
                    body = self.massageBody(body,methodKind)
                    self.createHeadline(parent,body,headline)
                    scan_start = i
                    #@nonl
                    #@-node:ekr.20031218072017.3284:<< create a child node for the function >>
                    #@nl
                else: i = g.skip_c_id(s,i)
                #@nonl
                #@-node:ekr.20031218072017.3282:<< handle possible Pascal function >>
                #@nl
            else: i += 1
        #@    << Append any unused text to the parent's body text >>
        #@+node:ekr.20031218072017.3264:<< Append any unused text to the parent's body text >>
        # Used by C, Java and Pascal parsers.
        # Do nothing if only whitespace is left.
        
        i = g.skip_ws_and_nl(s,scan_start)
        if i < len(s):
            parent.appendStringToBody(s[scan_start:])
        #@nonl
        #@-node:ekr.20031218072017.3264:<< Append any unused text to the parent's body text >>
        #@nl
    #@nonl
    #@-node:ekr.20031218072017.3281:scanPascalText
    #@+node:ekr.20031218072017.3242:scanPHPText (Dave Hein)
    # 08-SEP-2002 DTHEIN: Added for PHP import support.
    #
    # PHP uses both # and // as line comments, and /* */ as block comments
    
    def scanPHPText (self,s,parent):
    
        """Creates a child of parent for each class and function definition seen."""
    
        import re
        #@    << Append file if not pure PHP >>
        #@+node:ekr.20031218072017.3243:<< Append file if not pure PHP >>
        # If the file does not begin with <?php or end with ?> then
        # it is simply appended like a generic import would do.
        
        s.strip() # Remove inadvertent whitespace.
        
        if (
            not (
                s.startswith("<?P") or
                s.startswith("<?p") or
                s.startswith("<?=") or
                s.startswith("<?\n") or
                s.startswith("<?\r") or
                s.startswith("<? ") or
                s.startswith("<?\t")
            ) or not (
                s.endswith("?>\n") or
                s.endswith("?>\r") or
                s.endswith("?>\r\n")
            )
        ):
            g.es("File seems to be mixed HTML and PHP; importing as plain text file.")
            parent.setBodyStringOrPane("@ignore\n" + self.rootLine + s)
            return
        #@nonl
        #@-node:ekr.20031218072017.3243:<< Append file if not pure PHP >>
        #@nl
    
        #@    << define scanPHPText vars >>
        #@+node:ekr.20031218072017.3244:<< define scanPHPText vars >>
        scan_start = 0
        class_start = 0
        function_start = 0
        i = 0
        class_body = ""
        class_node = ""
        phpClassName = re.compile("class\s+([a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*)")
        phpFunctionName = re.compile("function\s+([a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*)")
        
        # 14-SEP-2002 DTHEIN: added these 2 variables to allow use of @first/last
        startOfCode = s.find("\n") + 1 # this should be the line containing the initial <?php
        endOfCode = s.rfind("?>") # this should be the line containing the last ?>
        #@-node:ekr.20031218072017.3244:<< define scanPHPText vars >>
        #@nl
        # 14-SEP-2002 DTHEIN: Make leading <?php use the @first directive
        parent.appendStringToBody("@first ")	
        parent.appendStringToBody(s[:startOfCode])
        scan_start = i = startOfCode
        while i < endOfCode:
            # line = g.get_line(s,i) ; g.trace(line)
            ch = s[i]
            # These cases skip tokens.
            if ch == '/' or ch == '#':
                #@            << handle possible PHP comments >>
                #@+node:ekr.20031218072017.3246:<< handle possible PHP comments >>
                if g.match(s,i,"//"):
                    i = g.skip_line(s,i)
                elif g.match(s,i,"#"):
                    i = g.skip_line(s,i)
                elif g.match(s,i,"/*"):
                    i = g.skip_block_comment(s,i)
                else:
                    i += 1
                #@nonl
                #@-node:ekr.20031218072017.3246:<< handle possible PHP comments >>
                #@nl
            elif ch == '<':
                #@            << handle possible heredoc string >>
                #@+node:ekr.20031218072017.3245:<< handle possible heredoc string >>
                if g.match(s,i,"<<<"):
                    i = g.skip_heredoc_string(s,i)
                else:
                    i += 1
                #@-node:ekr.20031218072017.3245:<< handle possible heredoc string >>
                #@nl
            elif ch == '"' or ch == '\'':
                i = g.skip_string(s,i)
            # These cases help determine where functions start.
            # FIXME: probably want to capture 'var's as class member data
            elif ch == 'f' or ch =='c':
                #@            << handle possible class or function >>
                #@+node:ekr.20031218072017.3247:<< handle possible class or function >>
                #@+at 
                #@nonl
                # In PHP, all functions are typeless and start with the 
                # keyword "function;  all classes start with the keyword 
                # class.
                # 
                # Functions can be nested, but we don't handle that right now 
                # (I don't think it is a common practice anyway).
                #@-at
                #@@c
                if g.match(s,i,"function "):
                    #we want to make the function a subnode of either the @file node or a class node
                    # 1. get the function name
                    # 2. make a reference in the parent
                    # 3. create the child node, and dump the function in it.
                    function_start = i
                    m = phpFunctionName.match(s[i:])
                    if (None == m): # function keyword without function name
                        i += len("function ")
                    else:
                        headline = g.angleBrackets(" function " + m.group(1) + " ")
                        # find the end of the function
                        openingBrace = s.find('{',i)
                        function_end = g.skip_php_braces(s,openingBrace)
                        function_end = g.skip_to_end_of_line(s,function_end - 1) + 1 # include the line end
                        # Insert skipped text into parent's body.
                        if class_start:
                            class_body += s[scan_start:function_start]
                        else:
                            parent.appendStringToBody(s[scan_start:function_start])
                        # Append the headline to the parent's body.
                        if class_start:
                            class_body += (headline + "\n")
                        else:
                            parent.appendStringToBody(headline + "\n")
                        # Backup to capture leading whitespace (for undent purposes)
                        while (function_start > 0) and (s[function_start - 1] in [" ", "\t"]):
                            function_start -= 1
                        # Get the body and undent it
                        function_body = s[function_start:function_end]
                        function_body = self.undentBody(function_body)
                        if self.treeType != "@file":
                            function_body = "@code\n\n" + function_body
                        # Create the new node
                        if class_start:
                            self.createHeadline(class_node,function_body,headline)
                        else:
                            self.createHeadline(parent,function_body,headline)
                        i = function_end
                        scan_start = i
                        function_end = 0
                        function_start = 0 #done with this function
                        function_body = ""
                        
                elif g.match(s,i,"class "):
                    # we want to make the class a subnode of the @file node
                    # 1. get the class name
                    # 2. make a reference in the parent
                    # 3. create the child node and dump the function in it
                    class_start = i
                    class_body = ""
                    m = phpClassName.match(s[i:])
                    if (None == m): # class keyword without class name
                        i += len("class ")
                    else:
                        # Insert skipped text into parent's body.
                        parent.appendStringToBody(s[scan_start:class_start])
                        # create the headline name
                        headline = g.angleBrackets(" class " + m.group(1) + " ")
                        # find the place to start looking for methods (functions)
                        openingBrace = s.find('{',i)
                        # find the end of the class
                        class_end = g.skip_php_braces(s,openingBrace)
                        class_end = g.skip_to_end_of_line(s,class_end - 1) + 1 # include the line end
                        # Append the headline to the parent's body.
                        parent.appendStringToBody(headline + "\n")
                        # Backup to capture leading whitespace (for undent purposes)
                        while (class_start > 0) and (s[class_start - 1] in [" ", "\t"]):
                            class_start -= 1
                        scan_start = class_start
                        # Create the new node
                        class_node = self.createHeadline(parent,"",headline)
                        i = openingBrace
                    
                else:
                    i += 1
                #@nonl
                #@-node:ekr.20031218072017.3247:<< handle possible class or function >>
                #@nl
            elif class_start and (ch == '}'):
                #@            << handle end of class >>
                #@+node:ekr.20031218072017.3248:<< handle end of class >>
                # Capture the rest of the body
                class_body += s[scan_start:class_end]
                # insert the class node's body
                if self.treeType != "@file":
                    class_body = "@code\n\n" + class_body
                class_body = self.undentBody(class_body)
                class_node.appendStringToBody(class_body)
                # reset the indices
                i = class_end
                scan_start = i
                class_end = 0
                class_start = 0 #done with this class
                class_body=""
                #@-node:ekr.20031218072017.3248:<< handle end of class >>
                #@nl
            else: i += 1
        #@    << Append any unused text to the parent's body text >>
        #@+node:ekr.20031218072017.3249:<< Append any unused text to the parent's body text >>
        parent.appendStringToBody(s[scan_start:endOfCode])
        #@-node:ekr.20031218072017.3249:<< Append any unused text to the parent's body text >>
        #@nl
        # 14-SEP-2002 DTHEIN: Make leading <?php use the @first directive
        parent.appendStringToBody("@last ")	
        parent.appendStringToBody(s[endOfCode:])
    #@nonl
    #@-node:ekr.20031218072017.3242:scanPHPText (Dave Hein)
    #@-node:ekr.20031218072017.3241:Scanners for createOutline
    #@-node:ekr.20031218072017.3209:Import
    #@+node:ekr.20031218072017.3289:Export
    #@+node:ekr.20031218072017.3290:convertCodePartToWeb
    # Headlines not containing a section reference are ignored in noweb and generate index index in cweb.
    
    def convertCodePartToWeb (self,s,i,v,result):
    
        # g.trace(g.get_line(s,i))
        c = self.c ; nl = self.output_newline
        lb = g.choose(self.webType=="cweb","@<","<<")
        rb = g.choose(self.webType=="cweb","@>",">>")
        h = string.strip(v.headString())
        #@    << put v's headline ref in head_ref >>
        #@+node:ekr.20031218072017.3291:<< put v's headline ref in head_ref>>
        #@+at 
        #@nonl
        # We look for either noweb or cweb brackets. head_ref does not include 
        # these brackets.
        #@-at
        #@@c
        
        head_ref = None
        j = 0
        if g.match(h,j,"<<"):
            k = string.find(h,">>",j)
        elif g.match(h,j,"<@"):
            k = string.find(h,"@>",j)
        else:
            k = -1
        
        if k > -1:
            head_ref = string.strip(h[j+2:k])
            if len(head_ref) == 0:
                head_ref = None
        #@nonl
        #@-node:ekr.20031218072017.3291:<< put v's headline ref in head_ref>>
        #@nl
        #@    << put name following @root or @file in file_name >>
        #@+node:ekr.20031218072017.3292:<< put name following @root or @file in file_name >>
        if g.match(h,0,"@file") or g.match(h,0,"@root"):
            line = h[5:]
            line = string.strip(line)
            #@    << set file_name >>
            #@+node:ekr.20031218072017.3293:<< Set file_name >>
            # set j & k so line[j:k] is the file name.
            # g.trace(line)
            
            if g.match(line,0,"<"):
                j = 1 ; k = string.find(line,">",1)
            elif g.match(line,0,'"'):
                j = 1 ; k = string.find(line,'"',1)
            else:
                j = 0 ; k = string.find(line," ",0)
            if k == -1:
                k = len(line)
            
            file_name = string.strip(line[j:k])
            if file_name and len(file_name) == 0:
                file_name = None
            #@nonl
            #@-node:ekr.20031218072017.3293:<< Set file_name >>
            #@nl
        else:
            file_name = line = None
        #@-node:ekr.20031218072017.3292:<< put name following @root or @file in file_name >>
        #@nl
        if g.match_word(s,i,"@root"):
            i = g.skip_line(s,i)
            #@        << append ref to file_name >>
            #@+node:ekr.20031218072017.3294:<< append ref to file_name >>
            if self.webType == "cweb":
                if not file_name:
                    result += "@<root@>=" + nl
                else:
                    result += "@(" + file_name + "@>" + nl # @(...@> denotes a file.
            else:
                if not file_name:
                    file_name = "*"
                result += lb + file_name + rb + "=" + nl
            #@-node:ekr.20031218072017.3294:<< append ref to file_name >>
            #@nl
        elif g.match_word(s,i,"@c") or g.match_word(s,i,"@code"):
            i = g.skip_line(s,i)
            #@        << append head_ref >>
            #@+node:ekr.20031218072017.3295:<< append head_ref >>
            if self.webType == "cweb":
                if not head_ref:
                    result += "@^" + h + "@>" + nl # Convert the headline to an index entry.
                    result += "@c" + nl # @c denotes a new section.
                else: 
                    escaped_head_ref = string.replace(head_ref,"@","@@")
                    result += "@<" + escaped_head_ref + "@>=" + nl
            else:
                if not head_ref:
                    if v == c.currentVnode():
                        head_ref = g.choose(file_name,file_name,"*")
                    else:
                        head_ref = "@others"
            
                result += lb + head_ref + rb + "=" + nl
            #@nonl
            #@-node:ekr.20031218072017.3295:<< append head_ref >>
            #@nl
        elif g.match_word(h,0,"@file"):
            # Only do this if nothing else matches.
            #@        << append ref to file_name >>
            #@+node:ekr.20031218072017.3294:<< append ref to file_name >>
            if self.webType == "cweb":
                if not file_name:
                    result += "@<root@>=" + nl
                else:
                    result += "@(" + file_name + "@>" + nl # @(...@> denotes a file.
            else:
                if not file_name:
                    file_name = "*"
                result += lb + file_name + rb + "=" + nl
            #@-node:ekr.20031218072017.3294:<< append ref to file_name >>
            #@nl
            i = g.skip_line(s,i) # 4/28/02
        else:
            #@        << append head_ref >>
            #@+node:ekr.20031218072017.3295:<< append head_ref >>
            if self.webType == "cweb":
                if not head_ref:
                    result += "@^" + h + "@>" + nl # Convert the headline to an index entry.
                    result += "@c" + nl # @c denotes a new section.
                else: 
                    escaped_head_ref = string.replace(head_ref,"@","@@")
                    result += "@<" + escaped_head_ref + "@>=" + nl
            else:
                if not head_ref:
                    if v == c.currentVnode():
                        head_ref = g.choose(file_name,file_name,"*")
                    else:
                        head_ref = "@others"
            
                result += lb + head_ref + rb + "=" + nl
            #@nonl
            #@-node:ekr.20031218072017.3295:<< append head_ref >>
            #@nl
        i,result = self.copyPart(s,i,result)
        return i, string.strip(result) + nl
        
    #@+at 
    #@nonl
    # %defs a b c
    #@-at
    #@nonl
    #@-node:ekr.20031218072017.3290:convertCodePartToWeb
    #@+node:ekr.20031218072017.3296:convertDocPartToWeb (handle @ %def)
    def convertDocPartToWeb (self,s,i,result):
        
        nl = self.output_newline
    
        # g.trace(g.get_line(s,i))
        if g.match_word(s,i,"@doc"):
            i = g.skip_line(s,i)
        elif g.match(s,i,"@ ") or g.match(s,i,"@\t") or g.match(s,i,"@*"):
            i += 2
        elif g.match(s,i,"@\n"):
            i += 1
        i = g.skip_ws_and_nl(s,i)
        i, result2 = self.copyPart(s,i,"")
        if len(result2) > 0:
            # Break lines after periods.
            result2 = string.replace(result2,".  ","." + nl)
            result2 = string.replace(result2,". ","." + nl)
            result += nl+"@"+nl+string.strip(result2)+nl+nl
        else:
            # All nodes should start with '@', even if the doc part is empty.
            result += g.choose(self.webType=="cweb",nl+"@ ",nl+"@"+nl)
        return i, result
    #@nonl
    #@-node:ekr.20031218072017.3296:convertDocPartToWeb (handle @ %def)
    #@+node:ekr.20031218072017.3297:convertVnodeToWeb
    #@+at 
    #@nonl
    # This code converts a vnode to noweb text as follows:
    # 
    # Convert @doc to @
    # Convert @root or @code to << name >>=, assuming the headline contains << 
    # name >>
    # Ignore other directives
    # Format doc parts so they fit in pagewidth columns.
    # Output code parts as is.
    #@-at
    #@@c
    
    def convertVnodeToWeb (self,v):
    
        c = self.c
        if not v or not c: return ""
        startInCode = not c.config.at_root_bodies_start_in_doc_mode
        nl = self.output_newline
        s = v.bodyString()
        lb = g.choose(self.webType=="cweb","@<","<<")
        i = 0 ; result = "" ; docSeen = False
        while i < len(s):
            progress = i
            # g.trace(g.get_line(s,i))
            i = g.skip_ws_and_nl(s,i)
            if self.isDocStart(s,i) or g.match_word(s,i,"@doc"):
                i,result = self.convertDocPartToWeb(s,i,result)
                docSeen = True
            elif (g.match_word(s,i,"@code") or g.match_word(s,i,"@root") or
                g.match_word(s,i,"@c") or g.match(s,i,lb)):
                #@            << Supply a missing doc part >>
                #@+node:ekr.20031218072017.3298:<< Supply a missing doc part >>
                if not docSeen:
                    docSeen = True
                    result += g.choose(self.webType=="cweb",nl+"@ ",nl+"@"+nl)
                #@nonl
                #@-node:ekr.20031218072017.3298:<< Supply a missing doc part >>
                #@nl
                i,result = self.convertCodePartToWeb(s,i,v,result)
            elif self.treeType == "@file" or startInCode:
                #@            << Supply a missing doc part >>
                #@+node:ekr.20031218072017.3298:<< Supply a missing doc part >>
                if not docSeen:
                    docSeen = True
                    result += g.choose(self.webType=="cweb",nl+"@ ",nl+"@"+nl)
                #@nonl
                #@-node:ekr.20031218072017.3298:<< Supply a missing doc part >>
                #@nl
                i,result = self.convertCodePartToWeb(s,i,v,result)
            else:
                i,result = self.convertDocPartToWeb(s,i,result)
                docSeen = True
            assert(progress < i)
        result = string.strip(result)
        if len(result) > 0:
            result += nl
        return result
    #@nonl
    #@-node:ekr.20031218072017.3297:convertVnodeToWeb
    #@+node:ekr.20031218072017.3299:copyPart
    # Copies characters to result until the end of the present section is seen.
    
    def copyPart (self,s,i,result):
    
        # g.trace(g.get_line(s,i))
        lb = g.choose(self.webType=="cweb","@<","<<")
        rb = g.choose(self.webType=="cweb","@>",">>")
        theType = self.webType
        while i < len(s):
            progress = j = i # We should be at the start of a line here.
            i = g.skip_nl(s,i) ; i = g.skip_ws(s,i)
            if self.isDocStart(s,i):
                return i, result
            if (g.match_word(s,i,"@doc") or
                g.match_word(s,i,"@c") or
                g.match_word(s,i,"@root") or
                g.match_word(s,i,"@code")): # 2/25/03
                return i, result
            elif (g.match(s,i,"<<") and # must be on separate lines.
                g.find_on_line(s,i,">>=") > -1):
                return i, result
            else:
                # Copy the entire line, escaping '@' and
                # Converting @others to < < @ others > >
                i = g.skip_line(s,j) ; line = s[j:i]
                if theType == "cweb":
                    line = string.replace(line,"@","@@")
                else:
                    j = g.skip_ws(line,0)
                    if g.match(line,j,"@others"):
                        line = string.replace(line,"@others",lb + "@others" + rb)
                    elif g.match(line,0,"@"):
                        # Special case: do not escape @ %defs.
                        k = g.skip_ws(line,1)
                        if not g.match(line,k,"%defs"):
                            line = "@" + line
                result += line
            assert(progress < i)
        return i, string.rstrip(result)
    #@nonl
    #@-node:ekr.20031218072017.3299:copyPart
    #@+node:ekr.20031218072017.1462:exportHeadlines
    def exportHeadlines (self,fileName):
        
        c = self.c ; nl = self.output_newline
        p = c.currentPosition()
        if not p: return
        self.setEncoding()
        firstLevel = p.level()
        mode = c.config.output_newline
        mode = g.choose(mode=="platform",'w','wb')
        try:
            theFile = open(fileName,mode)
        except IOError:
            g.es("Can not open " + fileName,color="blue")
            leoTest.fail()
            return
        for p in p.self_and_subtree_iter():
            head = p.moreHead(firstLevel,useVerticalBar=True)
            head = g.toEncodedString(head,self.encoding,reportErrors=True)
            theFile.write(head + nl)
        theFile.close()
    #@nonl
    #@-node:ekr.20031218072017.1462:exportHeadlines
    #@+node:ekr.20031218072017.1147:flattenOutline
    def flattenOutline (self,fileName):
    
        c = self.c ; nl = self.output_newline
        p = c.currentVnode()
        if not p: return
        self.setEncoding()
        firstLevel = p.level()
    
        # 10/14/02: support for output_newline setting.
        mode = c.config.output_newline
        mode = g.choose(mode=="platform",'w','wb')
        try:
            theFile = open(fileName,mode)
        except IOError:
            g.es("Can not open " + fileName,color="blue")
            leoTest.fail()
            return
        
        for p in p.self_and_subtree_iter():
            head = p.moreHead(firstLevel)
            head = g.toEncodedString(head,self.encoding,reportErrors=True)
            theFile.write(head + nl)
            body = p.moreBody() # Inserts escapes.
            if len(body) > 0:
                body = g.toEncodedString(body,self.encoding,reportErrors=True)
                theFile.write(body + nl)
        theFile.close()
    #@nonl
    #@-node:ekr.20031218072017.1147:flattenOutline
    #@+node:ekr.20031218072017.1148:outlineToWeb
    def outlineToWeb (self,fileName,webType):
    
        c = self.c ; nl = self.output_newline
        current = c.currentPosition()
        if not current: return
        self.setEncoding()
        self.webType = webType
        # 10/14/02: support for output_newline setting.
        mode = c.config.output_newline
        mode = g.choose(mode=="platform",'w','wb')
        try:
            theFile = open(fileName,mode)
        except IOError:
            g.es("Can not open " + fileName,color="blue")
            leoTest.fail()
            return
    
        self.treeType = "@file"
        # Set self.treeType to @root if p or an ancestor is an @root node.
        for p in current.parents_iter():
            flag,junk = g.is_special(p.bodyString(),0,"@root")
            if flag:
                self.treeType = "@root"
                break
        for p in current.self_and_subtree_iter():
            s = self.convertVnodeToWeb(p)
            if len(s) > 0:
                s = g.toEncodedString(s,self.encoding,reportErrors=True)
                theFile.write(s)
                if s[-1] != '\n': theFile.write(nl)
        theFile.close()
    #@nonl
    #@-node:ekr.20031218072017.1148:outlineToWeb
    #@+node:ekr.20031218072017.3300:removeSentinelsCommand
    def removeSentinelsCommand (self,paths):
        
        c = self.c
    
        self.setEncoding()
    
        for fileName in paths:
    
            path, self.fileName = g.os_path_split(fileName)
            #@        << Read file into s >>
            #@+node:ekr.20031218072017.3301:<< Read file into s >>
            try:
                theFile = open(fileName)
                s = theFile.read()
                s = g.toUnicode(s,self.encoding)
                theFile.close()
            except IOError:
                g.es("can not open " + fileName, color="blue")
                leoTest.fail()
                return
            #@nonl
            #@-node:ekr.20031218072017.3301:<< Read file into s >>
            #@nl
            #@        << set delims from the header line >>
            #@+node:ekr.20031218072017.3302:<< set delims from the header line >>
            # Skip any non @+leo lines.
            i = 0
            while i < len(s) and not g.find_on_line(s,i,"@+leo"):
                i = g.skip_line(s,i)
            
            # Get the comment delims from the @+leo sentinel line.
            at = self.c.atFileCommands
            j = g.skip_line(s,i) ; line = s[i:j]
            
            valid,new_df,start_delim,end_delim,derivedFileIsThin = at.parseLeoSentinel(line)
            if not valid:
                g.es("invalid @+leo sentinel in " + fileName)
                return
            
            if end_delim:
                line_delim = None
            else:
                line_delim,start_delim = start_delim,None
            #@nonl
            #@-node:ekr.20031218072017.3302:<< set delims from the header line >>
            #@nl
            # g.trace("line: '%s', start: '%s', end: '%s'" % (line_delim,start_delim,end_delim))
            s = self.removeSentinelLines(s,line_delim,start_delim,end_delim)
            ext = c.config.remove_sentinels_extension
            if not ext:
                ext = ".txt"
            if ext[0] == '.':
                newFileName = g.os_path_join(path,fileName+ext)
            else:
                head,ext2 = g.os_path_splitext(fileName) 
                newFileName = g.os_path_join(path,head+ext+ext2)
            #@        << Write s into newFileName >>
            #@+node:ekr.20031218072017.1149:<< Write s into newFileName >>
            try:
                mode = c.config.output_newline
                mode = g.choose(mode=="platform",'w','wb')
                theFile = open(newFileName,mode)
                s = g.toEncodedString(s,self.encoding,reportErrors=True)
                theFile.write(s)
                theFile.close()
                g.es("created: " + newFileName)
            except:
                g.es("exception creating: " + newFileName)
                g.es_exception()
            #@nonl
            #@-node:ekr.20031218072017.1149:<< Write s into newFileName >>
            #@nl
    #@nonl
    #@-node:ekr.20031218072017.3300:removeSentinelsCommand
    #@+node:ekr.20031218072017.3303:removeSentinelLines
    #@+at 
    #@nonl
    # Properly removes all sentinel lines in s.  Only leading single-line 
    # comments may be sentinels.
    # 
    # line_delim, start_delim and end_delim are the comment delimiters.
    #@-at
    #@@c
    
    def removeSentinelLines(self,s,line_delim,start_delim,end_delim):
    
        i = 0 ; result = [] ; nlSeen = True
        while i < len(s):
            # g.trace(i,nlSeen,g.get_line_after(s,i))
            start = i # The start of the next syntax element.
            if nlSeen or g.is_nl(s,i):
                nlSeen = False
                #@            << handle possible sentinel >>
                #@+node:ekr.20031218072017.3304:<< handle possible sentinel >>
                if g.is_nl(s,i):
                    i = g.skip_nl(s,i)
                    nlSeen = True
                i = g.skip_ws(s,i)
                # g.trace(i,g.get_line(s,i))
                if line_delim:
                    if g.match(s,i,line_delim):
                        j = i+len(line_delim)
                        if g.match(s,j,"@"):
                            i = g.skip_line(s,i)
                            nlSeen = True
                            continue # Remove the entire sentinel line, including the newline.
                        else:
                            i = g.skip_to_end_of_line(s,i)
                elif start_delim:
                    if g.match(s,i,start_delim):
                        j = i+len(start_delim)
                        i = g.skip_matching_delims(s,i,start_delim,end_delim)
                        if g.match(s,j,"@"):
                            continue # Remove the sentinel
                elif nlSeen and start < i:
                    # Put the newline that was at the start of this line.
                    result.append(s[start:i])
                    continue
                #@nonl
                #@-node:ekr.20031218072017.3304:<< handle possible sentinel >>
                #@nl
            if line_delim and g.match(s,i,line_delim):
                i = g.skip_to_end_of_line(s,i)
            elif start_delim and end_delim and g.match(s,i,start_delim):
                i = g.skip_matching_delims(s,i,start_delim,end_delim)
            elif g.match(s,i,"'") or g.match(s,i,'"'):
                i = g.skip_string(s,i)
            else:
                i += 1
            assert(i == 0 or start<i)
            result.append(s[start:i])# 12/11/03: hugely faster than string concatenation.
    
        result = ''.join(result)
        return result
    #@nonl
    #@-node:ekr.20031218072017.3303:removeSentinelLines
    #@+node:ekr.20031218072017.1464:weave
    def weave (self,filename):
        
        c = self.c ; nl = self.output_newline
        p = c.currentPosition()
        if not p: return
        self.setEncoding()
        #@    << open filename to f, or return >>
        #@+node:ekr.20031218072017.1150:<< open filename to f, or return >>
        try:
            # 10/14/02: support for output_newline setting.
            mode = c.config.output_newline
            mode = g.choose(mode=="platform",'w','wb')
            f = open(filename,mode)
            if not f: return
        except:
            g.es("exception opening:" + filename)
            g.es_exception()
            return
        #@nonl
        #@-node:ekr.20031218072017.1150:<< open filename to f, or return >>
        #@nl
        for p in p.self_and_subtree_iter():
            s = p.bodyString()
            s2 = string.strip(s)
            if s2 and len(s2) > 0:
                f.write("-" * 60) ; f.write(nl)
                #@            << write the context of p to f >>
                #@+node:ekr.20031218072017.1465:<< write the context of p to f >>
                # write the headlines of p, p's parent and p's grandparent.
                context = [] ; p2 = p.copy()
                for i in xrange(3):
                    if not p2: break
                    context.append(p2.headString())
                    p2.moveToParent()
                
                context.reverse()
                indent = ""
                for line in context:
                    f.write(indent)
                    indent += '\t'
                    line = g.toEncodedString(line,self.encoding,reportErrors=True)
                    f.write(line)
                    f.write(nl)
                #@nonl
                #@-node:ekr.20031218072017.1465:<< write the context of p to f >>
                #@nl
                f.write("-" * 60) ; f.write(nl)
                s = g.toEncodedString(s,self.encoding,reportErrors=True)
                f.write(string.rstrip(s) + nl)
        f.flush()
        f.close()
    #@nonl
    #@-node:ekr.20031218072017.1464:weave
    #@-node:ekr.20031218072017.3289:Export
    #@+node:ekr.20031218072017.3305:Utilities
    #@+node:ekr.20031218072017.3306:createHeadline
    def createHeadline (self,parent,body,headline):
    
        # g.trace("parent,headline:",parent,headline)
        # Create the vnode.
        v = parent.insertAsLastChild()
        v.initHeadString(headline,self.encoding)
        # Set the body.
        if len(body) > 0:
            v.setBodyStringOrPane(body,self.encoding)
        return v
    #@nonl
    #@-node:ekr.20031218072017.3306:createHeadline
    #@+node:ekr.20031218072017.3307:error
    def error (self,s): g.es(s)
    #@nonl
    #@-node:ekr.20031218072017.3307:error
    #@+node:ekr.20031218072017.3308:getLeadingIndent
    def getLeadingIndent (self,s,i):
    
        """Return the leading whitespace of a line, ignoring blank and comment lines."""
    
        c = self.c
        i = g.find_line_start(s,i)
        while i < len(s):
            # g.trace(g.get_line(s,i))
            j = g.skip_ws(s,i) # Bug fix: 2/14/03
            if g.is_nl(s,j) or g.match(s,j,"#"): # Bug fix: 2/14/03
                i = g.skip_line(s,i) # ignore blank lines and comment lines.
            else:
                i, width = g.skip_leading_ws_with_indent(s,i,self.tab_width)
                # g.trace("returns:",width)
                return width
        # g.trace("returns:0")
        return 0
    #@nonl
    #@-node:ekr.20031218072017.3308:getLeadingIndent
    #@+node:ekr.20031218072017.3309:isDocStart and isModuleStart
    # The start of a document part or module in a noweb or cweb file.
    # Exporters may have to test for @doc as well.
    
    def isDocStart (self,s,i):
        
        if not g.match(s,i,"@"):
            return False
    
        j = g.skip_ws(s,i+1)
        if g.match(s,j,"%defs"):
            return False
        elif self.webType == "cweb" and g.match(s,i,"@*"):
            return True
        else:
            return g.match(s,i,"@ ") or g.match(s,i,"@\t") or g.match(s,i,"@\n")
    
    def isModuleStart (self,s,i):
    
        if self.isDocStart(s,i):
            return True
        else:
            return self.webType == "cweb" and (
                g.match(s,i,"@c") or g.match(s,i,"@p") or
                g.match(s,i,"@d") or g.match(s,i,"@f"))
    #@-node:ekr.20031218072017.3309:isDocStart and isModuleStart
    #@+node:ekr.20031218072017.3310:massageBody
    def massageBody (self,s,methodKind):
        
        # g.trace(s)
        # g.trace(g.get_line(s,0))
        c = self.c
        if self.treeType == "@file":
            if self.fileType == ".py": # 7/31/02: was "py"
                return self.undentBody(s)
            else:
                newBody, comment = self.skipLeadingComments(s)
                newBody = self.undentBody(newBody)
                newLine = g.choose(g.is_nl(newBody,0),"\n","\n\n")
                if len(comment) > 0:
                    return comment + "\n@c" + newLine + newBody
                else:
                    return newBody
        else:
            # Inserts < < self.methodName methodKind > > =
            cweb = self.fileType == "c" and not c.use_noweb_flag
            lb = g.choose(cweb,"@<","<<")
            rb = g.choose(cweb,"@>=",">>=")
            intro = lb + " " + self.methodName + " " + methodKind + " " + rb
            if self.fileType == ".py": # 7/31/02: was "py"
                newBody = self.undentBody(s)
                newLine = g.choose(g.is_nl(newBody,0),"\n","\n\n")
                return intro + newLine + newBody
            else:
                newBody, comment = self.skipLeadingComments(s)
                newBody = self.undentBody(newBody)
                newLine = g.choose(g.is_nl(newBody,0),"\n","\n\n")
                if len(comment) > 0:
                    return comment + "\n" + intro + newLine + newBody
                else:
                    return intro + newLine + newBody
    #@nonl
    #@-node:ekr.20031218072017.3310:massageBody
    #@+node:ekr.20031218072017.3311:massageComment
    def massageComment (self,s):
    
        """Returns s with all runs of whitespace and newlines converted to a single blank.
        
        Also removes leading and trailing whitespace."""
    
        # g.trace(g.get_line(s,0))
        s = string.strip(s)
        s = string.replace(s,"\n"," ")
        s = string.replace(s,"\r"," ")
        s = string.replace(s,"\t"," ")
        s = string.replace(s,"  "," ")
        s = string.strip(s)
        return s
    #@nonl
    #@-node:ekr.20031218072017.3311:massageComment
    #@+node:ekr.20031218072017.3312:massageWebBody
    def massageWebBody (self,s):
    
        theType = self.webType
        lb = g.choose(theType=="cweb","@<","<<")
        rb = g.choose(theType=="cweb","@>",">>")
        #@    << Remove most newlines from @space and @* sections >>
        #@+node:ekr.20031218072017.3313:<< Remove most newlines from @space and @* sections >>
        i = 0
        while i < len(s):
            i = g.skip_ws_and_nl(s,i)
            if self.isDocStart(s,i):
                # Scan to end of the doc part.
                if g.match(s,i,"@ %def"):
                    # Don't remove the newline following %def
                    i = g.skip_line(s,i) ; start = end = i
                else:
                    start = end = i ; i += 2
                while i < len(s):
                    i = g.skip_ws_and_nl(s,i)
                    if self.isModuleStart(s,i) or g.match(s,i,lb):
                        end = i ; break
                    elif theType == "cweb": i += 1
                    else: i = g.skip_to_end_of_line(s,i)
                # Remove newlines from start to end.
                doc = s[start:end]
                doc = string.replace(doc,"\n"," ")
                doc = string.replace(doc,"\r","")
                doc = string.strip(doc)
                if doc and len(doc) > 0:
                    if doc == "@":
                        doc = g.choose(self.webType=="cweb", "@ ","@\n")
                    else:
                        doc += "\n\n"
                    # g.trace("new doc:",doc)
                    s = s[:start] + doc + s[end:]
                    i = start + len(doc)
            else: i = g.skip_line(s,i)
        #@nonl
        #@-node:ekr.20031218072017.3313:<< Remove most newlines from @space and @* sections >>
        #@nl
        #@    << Replace abbreviated names with full names >>
        #@+node:ekr.20031218072017.3314:<< Replace abbreviated names with full names >>
        i = 0
        while i < len(s):
            # g.trace(g.get_line(s,i))
            if g.match(s,i,lb):
                i += 2 ; j = i ; k = g.find_on_line(s,j,rb)
                if k > -1:
                    name = s[j:k]
                    name2 = self.cstLookup(name)
                    if name != name2:
                        # Replace name by name2 in s.
                        # g.trace("replacing %s by %s" % (name,name2))
                        s = s[:j] + name2 + s[k:]
                        i = j + len(name2)
            i = g.skip_line(s,i)
        #@nonl
        #@-node:ekr.20031218072017.3314:<< Replace abbreviated names with full names >>
        #@nl
        s = string.rstrip(s)
        return s
    #@nonl
    #@-node:ekr.20031218072017.3312:massageWebBody
    #@+node:ekr.20031218072017.1463:setEncoding
    def setEncoding (self):
        
        # scanDirectives checks the encoding: may return None.
        theDict = g.scanDirectives(self.c)
        encoding = theDict.get("encoding")
        if encoding and g.isValidEncoding(encoding):
            self.encoding = encoding
        else:
            self.encoding = g.app.tkEncoding # 2/25/03
    
        # print self.encoding
    #@-node:ekr.20031218072017.1463:setEncoding
    #@+node:ekr.20031218072017.3315:skipLeadingComments
    def skipLeadingComments (self,s):
    
        """Skips all leading comments in s, returning the remaining body text and the massaged comment text.
    
        Returns (body, comment)"""
    
        # g.trace(g.get_line(s,0))
        s_original = s
        s = string.lstrip(s)
        i = 0 ; comment = ""
        if self.fileType in [".c", ".cpp"]: # 11/2/02: don't mess with java comments.
            #@        << scan for C-style comments >>
            #@+node:ekr.20031218072017.3316:<< scan for C-style comments >>
            while i < len(s):
                if g.match(s,i,"//"): # Handle a C++ comment.
                    while g.match(s,i,'/'):
                        i += 1
                    j = i ; i = g.skip_line(s,i)
                    comment = comment + self.massageComment(s[j:i]) + "\n"
                    # 8/2/02: Preserve leading whitespace for undentBody
                    i = g.skip_ws(s,i)
                    i = g.skip_blank_lines(s,i)
                elif g.match(s,i,"/*"): # Handle a block C comment.
                    j = i + 2 ; i = g.skip_block_comment (s,i)
                    k = g.choose(g.match(s,i-2,"*/"),i-2,i)
                    if self.fileType == ".java":
                        # 8/2/02: a hack: add leading whitespace then remove it.
                        comment = self.undentBody(comment)
                        comment2 = ' ' * 2 + s[j:k]
                        comment2 = self.undentBody(comment2)
                        comment = comment + comment2 + "\n"
                    else:
                        comment = comment + self.massageComment(s[j:k]) + "\n"
                    # 8/2/02: Preserve leading whitespace for undentBody
                    i = g.skip_ws(s,i)
                    i = g.skip_blank_lines(s,i)
                else: break
            #@nonl
            #@-node:ekr.20031218072017.3316:<< scan for C-style comments >>
            #@nl
        elif self.fileType == ".pas":
            #@        << scan for Pascal comments >>
            #@+node:ekr.20031218072017.3317:<< scan for Pascal comments >>
            while i < len(s):
                if g.match(s,i,"//"): # Handle a Pascal line comment.
                    while g.match(s,i,'/'):
                        i += 1
                    j = i ; i = g.skip_line(s,i)
                    comment = comment + self.massageComment(s[j:i]) + "\n"
                    # 8/2/02: Preserve leading whitespace for undentBody
                    i = g.skip_ws(s,i)
                    i = g.skip_blank_lines(s,i)
                elif g.match(s,i,'(*'):
                    j = i + 1 ; i = g.skip_pascal_block_comment(s,i)
                    comment = comment + self.massageComment(s[j:i]) + "\n"
                    # 8/2/02: Preserve leading whitespace for undentBody
                    i = g.skip_ws(s,i)
                    i = g.skip_blank_lines(s,i)
                else: break
            #@nonl
            #@-node:ekr.20031218072017.3317:<< scan for Pascal comments >>
            #@nl
        elif self.fileType == ".py":
            #@        << scan for Python comments >>
            #@+node:ekr.20031218072017.3318:<< scan for Python comments >>
            while i < len(s) and g.match(s,i,'#'):
                j = i + 1 ; i = g.skip_line(s,i)
                comment = self.undentBody(comment)
                comment = comment + self.massageComment(s[j:i]) + "\n"
                # 8/2/02: Preserve leading whitespace for undentBody
                i = g.skip_ws(s,i)
                i = g.skip_blank_lines(s,i)
            #@nonl
            #@-node:ekr.20031218072017.3318:<< scan for Python comments >>
            #@nl
        comment = string.strip(comment)
        if len(comment) == 0:
            return s_original, "" # Bug fix: 11/2/02: don't skip leading whitespace!
        elif self.treeType == "@file":
            return s[i:], "@ " + comment
        else:
            return s[i:], "@ " + comment + "\n"
    #@nonl
    #@-node:ekr.20031218072017.3315:skipLeadingComments
    #@+node:ekr.20031218072017.3319:undentBody
    # We look at the first line to determine how much leading whitespace to delete.
    
    def undentBody (self,s):
    
        """Removes extra leading indentation from all lines."""
    
        # g.trace(s)
        c = self.c
        i = 0 ; result = ""
        # Copy an @code line as is.
        if g.match(s,i,"@code"):
            j = i ; i = g.skip_line(s,i) # don't use get_line: it is only for dumping.
            result += s[j:i]
        # Calculate the amount to be removed from each line.
        undent = self.getLeadingIndent(s,i)
        if undent == 0: return s
        while i < len(s):
            j = i ; i = g.skip_line(s,i) # don't use get_line: it is only for dumping.
            line = s[j:i]
            # g.trace(line)
            line = g.removeLeadingWhitespace(line,undent,self.tab_width)
            result += line
        return result
    #@nonl
    #@-node:ekr.20031218072017.3319:undentBody
    #@-node:ekr.20031218072017.3305:Utilities
    #@-others
    
class leoImportCommands (baseLeoImportCommands):
    """A class that implements Leo's import commands."""
    pass
#@nonl
#@-node:ekr.20031218072017.3206:@thin leoImport.py
#@-leo
