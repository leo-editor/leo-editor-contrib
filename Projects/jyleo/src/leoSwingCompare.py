#@+leo-ver=4-thin
#@+node:zorcanda!.20050409133836:@thin leoSwingCompare.py
#@@language python
#@@tabwidth -4
#@@pagewidth 80  

"""Leo's base compare class."""

import leoGlobals as g
import filecmp
import os
import string

#@+others
#@+node:zorcanda!.20050409133836.1:choose
def choose(cond, a, b): # warning: evaluates all arguments

    if cond: return a
    else: return b
#@-node:zorcanda!.20050409133836.1:choose
#@+node:zorcanda!.20050409133836.2:go
def go ():

    compare = leoCompare(
        commands = None,
        
        appendOutput = True,

        ignoreBlankLines = True,
        ignoreFirstLine1 = False,
        ignoreFirstLine2 = False,
        ignoreInteriorWhitespace = False,
        ignoreLeadingWhitespace = True,
        ignoreSentinelLines = False,
        
        limitCount = 9, # Zero means don't stop.
        limitToExtension = ".py",  # For directory compares.
        makeWhitespaceVisible = True,
        
        printBothMatches = False,
        printMatches = False,
        printMismatches = True,
        printTrailingMismatches = False,

        outputFileName = None)

    if 1: # Compare all files in Tangle test directories

        path1 = "c:\\prog\\test\\tangleTest\\"
        path2 = "c:\\prog\\test\\tangleTestCB\\"
        compare.compare_directories(path1,path2)

    else: # Compare two files.

        name1 = "c:\\prog\\test\\compare1.txt"
        name2 = "c:\\prog\\test\\compare2.txt"
        compare.compare_files(name1,name2)
#@nonl
#@-node:zorcanda!.20050409133836.2:go
#@+node:zorcanda!.20050409133836.3:class leoCompare
class baseLeoCompare:
    """The base class for Leo's compare code."""
    #@    @+others
    #@+node:zorcanda!.20050409133836.4:compare.__init__
    # All these ivars are known to the leoComparePanel class.
    
    def __init__ (self,
    
        # Keyword arguments are much convenient and more clear for scripts.
        commands = None,
        
        appendOutput = False,
    
        ignoreBlankLines = True,
        ignoreFirstLine1 = False,
        ignoreFirstLine2 = False,
        ignoreInteriorWhitespace = False,
        ignoreLeadingWhitespace = True,
        ignoreSentinelLines = False,
    
        limitCount = 0, # Zero means don't stop.
        limitToExtension = ".py",  # For directory compares.
        makeWhitespaceVisible = True,
    
        printBothMatches = False,
        printMatches = False,
        printMismatches = True,
        printTrailingMismatches = False,
    
        outputFileName = None ):
            
        # It is more convenient for the leoComparePanel to set these directly.
        self.c = commands
        
        self.appendOutput = appendOutput
    
        self.ignoreBlankLines = ignoreBlankLines
        self.ignoreFirstLine1 = ignoreFirstLine1
        self.ignoreFirstLine2 = ignoreFirstLine2
        self.ignoreInteriorWhitespace = ignoreInteriorWhitespace
        self.ignoreLeadingWhitespace = ignoreLeadingWhitespace
        self.ignoreSentinelLines = ignoreSentinelLines
    
        self.limitCount = limitCount
        self.limitToExtension = limitToExtension
    
        self.printBothMatches = printBothMatches
        self.printMatches = printMatches
        self.printMismatches = printMismatches
        self.printTrailingMismatches = printTrailingMismatches
        
        # For communication between methods...
        self.outputFileName = outputFileName
        self.fileName1 = None 
        self.fileName2 = None
        # Open files...
        self.outputFile = None
    #@nonl
    #@-node:zorcanda!.20050409133836.4:compare.__init__
    #@+node:zorcanda!.20050409133836.5:compare_directories (entry)
    # We ignore the filename portion of path1 and path2 if it exists.
    
    def compare_directories (self,path1,path2):
        
        # Ignore everything except the directory name.
        dir1 = g.os_path_dirname(path1)
        dir2 = g.os_path_dirname(path2)
        dir1 = g.os_path_normpath(dir1)
        dir2 = g.os_path_normpath(dir2)
        
        if dir1 == dir2:
            self.show("Directory names are identical.\nPlease pick distinct directories.")
            return
            
        try:
            list1 = os.listdir(dir1)
        except:
            self.show("invalid directory:" + dir1)
            return
        try:
            list2 = os.listdir(dir2)
        except:
            self.show("invalid directory:" + dir2)
            return
            
        if self.outputFileName:
            self.openOutputFile()
        ok = self.outputFileName == None or self.outputFile
        if not ok:
            return
    
        # Create files and files2, the lists of files to be compared.
        files1 = []
        files2 = []
        for f in list1:
            junk, ext = g.os_path_splitext(f)
            if self.limitToExtension:
                if ext == self.limitToExtension:
                    files1.append(f)
            else:
                files1.append(f)
        for f in list2:
            junk, ext = g.os_path_splitext(f)
            if self.limitToExtension:
                if ext == self.limitToExtension:
                    files2.append(f)
            else:
                files2.append(f)
    
        # Compare the files and set the yes, no and fail lists.
        yes = [] ; no = [] ; fail = []
        for f1 in files1:
            head,f2 = g.os_path_split(f1)
            if f2 in files2:
                try:
                    name1 = g.os_path_join(dir1,f1)
                    name2 = g.os_path_join(dir2,f2)
                    val = filecmp.cmp(name1,name2,0)
                    if val: yes.append(f1)
                    else:    no.append(f1)
                except:
                    self.show("exception in filecmp.cmp")
                    g.es_exception()
                    fail.append(f1)
            else:
                fail.append(f1)
        
        # Print the results.
        for kind, files in (
            ("----- matches --------",yes),
            ("----- mismatches -----",no),
            ("----- not found ------",fail)):
            self.show(kind)
            for f in files:
                self.show(f)
        
        if self.outputFile:
            self.outputFile.close()
            self.outputFile = None
    #@nonl
    #@-node:zorcanda!.20050409133836.5:compare_directories (entry)
    #@+node:zorcanda!.20050409133836.6:compare_files (entry)
    def compare_files (self, name1, name2):
        
        if name1 == name2:
            self.show("File names are identical.\nPlease pick distinct files.")
            return
    
        f1 = f2 = None
        try:
            f1 = self.doOpen(name1)
            f2 = self.doOpen(name2)
            if self.outputFileName:
                self.openOutputFile()
            ok = self.outputFileName == None or self.outputFile
            ok = g.choose(ok and ok != 0,1,0)
            if f1 and f2 and ok: # Don't compare if there is an error opening the output file.
                self.compare_open_files(f1,f2,name1,name2)
        except:
            self.show("exception comparing files")
            g.es_exception()
        try:
            if f1: f1.close()
            if f2: f2.close()
            if self.outputFile:
                self.outputFile.close() ; self.outputFile = None
        except:
            self.show("exception closing files")
            g.es_exception()
    #@nonl
    #@-node:zorcanda!.20050409133836.6:compare_files (entry)
    #@+node:zorcanda!.20050409133836.7:compare_lines
    def compare_lines (self,s1,s2):
        
        if self.ignoreLeadingWhitespace:
            s1 = string.lstrip(s1)
            s2 = string.lstrip(s2)
    
        if self.ignoreInteriorWhitespace:
            k1 = g.skip_ws(s1,0)
            k2 = g.skip_ws(s2,0)
            ws1 = s1[:k1]
            ws2 = s2[:k2]
            tail1 = s1[k1:]
            tail2 = s2[k2:]
            tail1 = string.replace(tail1," ","")
            tail1 = string.replace(tail1,"\t","")
            tail2 = string.replace(tail2," ","")
            tail2 = string.replace(tail2,"\t","")
            s1 = ws1 + tail1
            s2 = ws2 + tail2
    
        return s1 == s2
    #@nonl
    #@-node:zorcanda!.20050409133836.7:compare_lines
    #@+node:zorcanda!.20050409133836.8:compare_open_files
    def compare_open_files (self, f1, f2, name1, name2):
    
        # self.show("compare_open_files")
        lines1 = 0 ; lines2 = 0 ; mismatches = 0 ; printTrailing = True
        sentinelComment1 = sentinelComment2 = None
        if self.openOutputFile():
            self.show("1: " + name1)
            self.show("2: " + name2)
            self.show("")
        s1 = s2 = None
        #@    << handle opening lines >>
        #@+node:zorcanda!.20050409133836.9:<< handle opening lines >>
        if self.ignoreSentinelLines:
            
            s1 = g.readlineForceUnixNewline(f1) ; lines1 += 1
            s2 = g.readlineForceUnixNewline(f2) ; lines2 += 1
            # Note: isLeoHeader may return None.
            sentinelComment1 = self.isLeoHeader(s1)
            sentinelComment2 = self.isLeoHeader(s2)
            if not sentinelComment1: self.show("no @+leo line for " + name1)
            if not sentinelComment2: self.show("no @+leo line for " + name2)
                
        if self.ignoreFirstLine1:
            if s1 == None:
                g.readlineForceUnixNewline(f1) ; lines1 += 1
            s1 = None
        
        if self.ignoreFirstLine2:
            if s2 == None:
                g.readlineForceUnixNewline(f2) ; lines2 += 1
            s2 = None
        #@nonl
        #@-node:zorcanda!.20050409133836.9:<< handle opening lines >>
        #@nl
        while 1:
            if s1 == None:
                s1 = g.readlineForceUnixNewline(f1) ; lines1 += 1
            if s2 == None:
                s2 = g.readlineForceUnixNewline(f2) ; lines2 += 1
            #@        << ignore blank lines and/or sentinels >>
            #@+node:zorcanda!.20050409133836.10:<< ignore blank lines and/or sentinels >>
            # Completely empty strings denotes end-of-file.
            if s1 and len(s1) > 0:
                if self.ignoreBlankLines and len(string.strip(s1)) == 0:
                    s1 = None ; continue
                    
                if self.ignoreSentinelLines and sentinelComment1 and self.isSentinel(s1,sentinelComment1):
                    s1 = None ; continue
            
            if s2 and len(s2) > 0:
                if self.ignoreBlankLines and len(string.strip(s2)) == 0:
                    s2 = None ; continue
            
                if self.ignoreSentinelLines and sentinelComment2 and self.isSentinel(s2,sentinelComment2):
                    s2 = None ; continue
            #@-node:zorcanda!.20050409133836.10:<< ignore blank lines and/or sentinels >>
            #@nl
            n1 = len(s1) ; n2 = len(s2)
            if n1==0 and n2 != 0: self.show("1.eof***:")
            if n2==0 and n1 != 0: self.show("2.eof***:")
            if n1==0 or n2==0: break
            match = self.compare_lines(s1,s2)
            if not match: mismatches += 1
            #@        << print matches and/or mismatches >>
            #@+node:zorcanda!.20050409133836.11:<< print matches and/or mismatches >>
            if self.limitCount == 0 or mismatches <= self.limitCount:
            
                if match and self.printMatches:
                    
                    if self.printBothMatches:
                        self.dump(string.rjust("1." + str(lines1),6) + ' :',s1)
                        self.dump(string.rjust("2." + str(lines2),6) + ' :',s2)
                    else:
                        self.dump(string.rjust(       str(lines1),6) + ' :',s1)
                
                if not match and self.printMismatches:
                    
                    self.dump(string.rjust("1." + str(lines1),6) + '*:',s1)
                    self.dump(string.rjust("2." + str(lines2),6) + '*:',s2)
            #@nonl
            #@-node:zorcanda!.20050409133836.11:<< print matches and/or mismatches >>
            #@nl
            #@        << warn if mismatch limit reached >>
            #@+node:zorcanda!.20050409133836.12:<< warn if mismatch limit reached >>
            if self.limitCount > 0 and mismatches >= self.limitCount:
                
                if printTrailing:
                    self.show("")
                    self.show("limit count reached")
                    self.show("")
                    printTrailing = False
            #@nonl
            #@-node:zorcanda!.20050409133836.12:<< warn if mismatch limit reached >>
            #@nl
            s1 = s2 = None # force a read of both lines.
        #@    << handle reporting after at least one eof is seen >>
        #@+node:zorcanda!.20050409133836.13:<< handle reporting after at least one eof is seen >>
        if n1 > 0: 
            lines1 += self.dumpToEndOfFile("1.",f1,s1,lines1,printTrailing)
            
        if n2 > 0:
            lines2 += self.dumpToEndOfFile("2.",f2,s2,lines2,printTrailing)
        
        self.show("")
        self.show("lines1:" + str(lines1))
        self.show("lines2:" + str(lines2))
        self.show("mismatches:" + str(mismatches))
        #@nonl
        #@-node:zorcanda!.20050409133836.13:<< handle reporting after at least one eof is seen >>
        #@nl
    #@nonl
    #@-node:zorcanda!.20050409133836.8:compare_open_files
    #@+node:zorcanda!.20050409133836.14:filecmp
    def filecmp (self,f1,f2):
    
        val = filecmp.cmp(f1,f2)
        if 1:
            if val: self.show("equal")
            else:   self.show("*** not equal")
        else:
            self.show("filecmp.cmp returns:")
            if val: self.show(str(val)+ " (equal)")
            else:   self.show(str(val) + " (not equal)")
        return val
    #@nonl
    #@-node:zorcanda!.20050409133836.14:filecmp
    #@+node:zorcanda!.20050409133836.15:utils...
    #@+node:zorcanda!.20050409133836.16:doOpen
    def doOpen (self,name):
    
        try:
            f = open(name,'r')
            return f
        except:
            self.show("can not open:" + '"' + name + '"')
            return None
    #@nonl
    #@-node:zorcanda!.20050409133836.16:doOpen
    #@+node:zorcanda!.20050409133836.17:dump
    def dump (self,tag,s):
    
        compare = self ; out = tag
    
        for ch in s[:-1]: # don't print the newline
        
            if compare.makeWhitespaceVisible:
                if ch == '\t':
                    out += "[" ; out += "t" ; out += "]"
                elif ch == ' ':
                    out += "[" ; out += " " ; out += "]"
                else: out += ch
            else:
                if 1:
                    out += ch
                else: # I don't know why I thought this was a good idea ;-)
                    if ch == '\t' or ch == ' ':
                        out += ' '
                    else:
                        out += ch
    
        self.show(out)
    #@nonl
    #@-node:zorcanda!.20050409133836.17:dump
    #@+node:zorcanda!.20050409133836.18:dumpToEndOfFile
    def dumpToEndOfFile (self,tag,f,s,line,printTrailing):
    
        trailingLines = 0
        while 1:
            if not s:
                s = g.readlineForceUnixNewline(f)
            if len(s) == 0: break
            trailingLines += 1
            if self.printTrailingMismatches and printTrailing:
                tag2 = string.rjust(tag + str(line),6) + "+:"
                self.dump(tag2,s)
            s = None
    
        self.show(tag + str(trailingLines) + " trailing lines")
        return trailingLines
    #@nonl
    #@-node:zorcanda!.20050409133836.18:dumpToEndOfFile
    #@+node:zorcanda!.20050409133836.19:isLeoHeader & isSentinel
    #@+at 
    #@nonl
    # These methods are based on atFile.scanHeader().  They are simpler 
    # because we only care about the starting sentinel comment: any line 
    # starting with the starting sentinel comment is presumed to be a sentinel 
    # line.
    #@-at
    #@@c
    
    def isLeoHeader (self,s):
    
        tag = "@+leo"
        j = string.find(s,tag)
        if j > 0:
            i = g.skip_ws(s,0)
            if i < j: return s[i:j]
            else: return None
        else: return None
            
    def isSentinel (self,s,sentinelComment):
    
        i = g.skip_ws(s,0)
        return g.match(s,i,sentinelComment)
    #@nonl
    #@-node:zorcanda!.20050409133836.19:isLeoHeader & isSentinel
    #@+node:zorcanda!.20050409133836.20:openOutputFile (compare)
    def openOutputFile (self):
        
        if self.outputFileName == None:
            return
        theDir,name = g.os_path_split(self.outputFileName)
        if len(theDir) == 0:
            self.show("empty output directory")
            return
        if len(name) == 0:
            self.show("empty output file name")
            return
        if not g.os_path_exists(theDir):
            self.show("output directory not found: " + theDir)
        else:
            try:
                if self.appendOutput:
                    self.show("appending to " + self.outputFileName)
                    self.outputFile = open(self.outputFileName,"ab")
                else:
                    self.show("writing to " + self.outputFileName)
                    self.outputFile = open(self.outputFileName,"wb")
            except:
                self.outputFile = None
                self.show("exception opening output file")
                g.es_exception()
    #@nonl
    #@-node:zorcanda!.20050409133836.20:openOutputFile (compare)
    #@+node:zorcanda!.20050409133836.21:show
    def show (self,s):
        
        # print s
        if self.outputFile:
            self.outputFile.write(s + '\n')
        elif self.c:
            g.es(s)
        else:
            print s
            print
    #@nonl
    #@-node:zorcanda!.20050409133836.21:show
    #@+node:zorcanda!.20050409133836.22:showIvars
    def showIvars (self):
        
        self.show("fileName1:"        + str(self.fileName1))
        self.show("fileName2:"        + str(self.fileName2))
        self.show("outputFileName:"   + str(self.outputFileName))
        self.show("limitToExtension:" + str(self.limitToExtension))
        self.show("")
    
        self.show("ignoreBlankLines:"         + str(self.ignoreBlankLines))
        self.show("ignoreFirstLine1:"         + str(self.ignoreFirstLine1))
        self.show("ignoreFirstLine2:"         + str(self.ignoreFirstLine2))
        self.show("ignoreInteriorWhitespace:" + str(self.ignoreInteriorWhitespace))
        self.show("ignoreLeadingWhitespace:"  + str(self.ignoreLeadingWhitespace))
        self.show("ignoreSentinelLines:"      + str(self.ignoreSentinelLines))
        self.show("")
        
        self.show("limitCount:"              + str(self.limitCount))
        self.show("printMatches:"            + str(self.printMatches))
        self.show("printMismatches:"         + str(self.printMismatches))
        self.show("printTrailingMismatches:" + str(self.printTrailingMismatches))
    #@nonl
    #@-node:zorcanda!.20050409133836.22:showIvars
    #@-node:zorcanda!.20050409133836.15:utils...
    #@-others
    
class leoCompare (baseLeoCompare):
    """A class containing Leo's compare code."""
    pass
#@nonl
#@-node:zorcanda!.20050409133836.3:class leoCompare
#@-others
#@nonl
#@-node:zorcanda!.20050409133836:@thin leoSwingCompare.py
#@-leo
