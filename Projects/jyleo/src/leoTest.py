#@+leo-ver=4-thin
#@+node:EKR.20040623200709:@thin leoTest.py
'''Classes for Leo's unit testing.

Run the unit tests in test.leo using the Execute Script command.'''  

#@@language python
#@@tabwidth -4

__pychecker__ = '--no-import --no-reimportself --no-reimport'

#@<< leoTest imports >>
#@+node:EKR.20040623200709.2:<< leoTest imports >>
import leoGlobals as g

import leoColor
import leoCommands
import leoFrame
import leoGui
import leoNodes
#import leoTkinterGui

#import compiler
import doctest
import glob
import os
import profile
import pstats
import sys
#import tabnanny
import tokenize
import unittest

try: import timeit
except ImportError: timeit = None

try: import gc
except ImportError: gc = None
#@nonl
#@-node:EKR.20040623200709.2:<< leoTest imports >>
#@nl

if g.app: # Make sure we can import this module stand-alone.
    import leoPlugins
    newAtFile = leoPlugins.isLoaded("___proto_atFile")
else:
    newAtFile = False

#@+others
#@+node:ekr.20040721114839:Support @profile, @suite, @profile, @timer
#@+node:ekr.20040707071542.2:isSuiteNode and isTestNode
def isSuiteNode (p):
    h = p.headString().lower()
    return g.match_word(h,0,"@suite")

def isTestNode (p):
    h = p.headString().lower()
    return g.match_word(h,0,"@test")
#@nonl
#@-node:ekr.20040707071542.2:isSuiteNode and isTestNode
#@+node:ekr.20040707210849:doTests...
def doTests(all):

    c = g.top() ; p1 = p = c.currentPosition()

    g.app.unitTestDict["fail"] = False

    if all: theIter = c.all_positions_iter()
    else:   theIter = p.self_and_subtree_iter()

    changed = c.isChanged()
    suite = unittest.makeSuite(unittest.TestCase)

    for p in theIter:
        if isTestNode(p):
            test = makeTestCase(c,p)
            if test: suite.addTest(test)
        elif isSuiteNode(p):
            test = makeTestSuite(c,p)
            if test: suite.addTest(test)

    # Verbosity: 1: print just dots.
    unittest.TextTestRunner(verbosity=1).run(suite)

    c.setChanged(changed) # Restore changed state.
    c.selectVnode(p1) # N.B. Restore the selected node.
#@nonl
#@+node:ekr.20040707073029:class generalTestCase
class generalTestCase(unittest.TestCase):

    """Create a unit test from a snippet of code."""

    #@    @+others
    #@+node:ekr.20040707073029.1:__init__
    def __init__ (self,c,p):
    
         # Init the base class.
        unittest.TestCase.__init__(self)
    
        self.c = c
        self.p = p.copy()
    #@-node:ekr.20040707073029.1:__init__
    #@+node:ekr.20040809073623: fail
    def fail (self):
    
        """Mark a unit test as having failed."""
    
        import leoGlobals as g
    
        g.app.unitTestDict["fail"] = g.callerName(2)
    #@nonl
    #@-node:ekr.20040809073623: fail
    #@+node:ekr.20040707073029.2:setUp
    def setUp (self):
    
        c = self.c ; p = self.p
    
        g.app.unitTesting = True
        c.selectVnode(p)
    #@nonl
    #@-node:ekr.20040707073029.2:setUp
    #@+node:ekr.20040707073029.3:tearDown
    def tearDown (self):
    
        g.app.unitTesting = False
        # To do: restore the outline.
    #@nonl
    #@-node:ekr.20040707073029.3:tearDown
    #@+node:ekr.20040707073029.4:runTest
    def runTest (self):
    
        c = self.c ; p = self.p
        script = g.getScript(c,p).strip()
        self.assert_(script)
    
        # Now just execute the script.
        # Let unit test handle any errors!
        exec script + '\n' in {} # Use {} to get a pristine environment!
    #@nonl
    #@-node:ekr.20040707073029.4:runTest
    #@+node:ekr.20040707093235:shortDescription
    def shortDescription (self):
    
        return self.p.headString() + '\n'
    #@nonl
    #@-node:ekr.20040707093235:shortDescription
    #@-others
#@nonl
#@-node:ekr.20040707073029:class generalTestCase
#@+node:ekr.20040707213238:makeTestSuite
#@+at 
#@nonl
# This code executes the script in an @suite node.  This code assumes:
# - The script creates a one or more unit tests.
# - The script puts the result in g.app.scriptDict["suite"]
#@-at
#@@c

def makeTestSuite (c,p):

    """Create a suite of test cases by executing the script in an @suite node."""

    h = p.headString()
    script = g.getScript(c,p).strip()
    if not script:
        print "no script in %s" % h
        return None

    try:
        exec script + '\n' in {}
        suite = g.app.scriptDict.get("suite")
        if not suite:
            print "%s script did not set g.app.scriptDict" % h
        return suite
    except:
        g.es_exception()
        return None
#@nonl
#@-node:ekr.20040707213238:makeTestSuite
#@+node:ekr.20040707072447:makeTestCase
def makeTestCase (c,p):

    if p.bodyString().strip():
        return generalTestCase(c,p)
    else:
        return None
#@nonl
#@-node:ekr.20040707072447:makeTestCase
#@-node:ekr.20040707210849:doTests...
#@+node:ekr.20040721113538.1:runProfileOnNode Not used
def runProfileOnNode (p,outputPath,):

    s = p.bodyString().rstrip() + '\n'

    profile.run(s,outputPath)

    stats = pstats.Stats(outputPath)
    stats.strip_dirs()
    stats.sort_stats('cum','file','name')
    stats.print_stats()
#@nonl
#@-node:ekr.20040721113538.1:runProfileOnNode Not used
#@+node:ekr.20040721115051.1:runTimerOnNode Not used
def runTimerOnNode (p,count):

    s = p.bodyString().rstrip() + '\n'
    t = timeit.Timer(s)

    try:
        if count is None:
            count = 1000000
        result = t.timeit(count)
        print "count: %d time: %f %s" % (count,result,p.headString())
    except:
        t.print_exc()
#@nonl
#@-node:ekr.20040721115051.1:runTimerOnNode Not used
#@-node:ekr.20040721114839:Support @profile, @suite, @profile, @timer
#@+node:ekr.20040721144439:run gc
#@+node:ekr.20040721145855:runGC
lastObjectCount = 0
lastObjectsDict = {}
lastTypesDict = {}
lastFunctionsDict = {}

# Adapted from similar code in leoGlobals.g.
def runGc(disable=False):
    
    message = "runGC"

    if gc is None:
        print "@gc: can not import gc"
        return

    gc.enable()
    set_debugGc()
    gc.collect()
    printGc(message=message,onlyPrintChanges=False)
    if disable:
        gc.disable()
    # makeObjectList(message)

runGC = runGc
#@nonl
#@-node:ekr.20040721145855:runGC
#@+node:ekr.20040721145258:enableGc
def set_debugGc ():

    gc.set_debug(
        gc.DEBUG_STATS | # prints statistics.
        # gc.DEBUG_LEAK | # Same as all below.
        # gc.DEBUG_COLLECTABLE
        # gc.DEBUG_UNCOLLECTABLE
        gc.DEBUG_INSTANCES |
        gc.DEBUG_OBJECTS
        # gc.DEBUG_SAVEALL
    )
#@nonl
#@-node:ekr.20040721145258:enableGc
#@+node:ekr.20040721144439.3:makeObjectList
def makeObjectList(message):

    # WARNING: this id trick is not proper: newly allocated objects can have the same address as old objects.
    global lastObjectsDict
    objects = gc.get_objects()

    newObjects = [o for o in objects if not lastObjectsDict.has_key(id(o))]

    lastObjectsDict = {}
    for o in objects:
        lastObjectsDict[id(o)]=o

    print "%25s: %d new, %d total objects" % (message,len(newObjects),len(objects))
#@nonl
#@-node:ekr.20040721144439.3:makeObjectList
#@+node:ekr.20040721144439.5:printGc
def printGc(message=None,onlyPrintChanges=False):

    if not message:
        message = g.callerName(n=2)

    global lastObjectCount

    n = len(gc.garbage)
    n2 = len(gc.get_objects())
    delta = n2-lastObjectCount

    print '-' * 30
    print "garbage: %d" % n
    print "%6d =%7d %s" % (delta,n2,"totals")

    #@    << print number of each type of object >>
    #@+node:ekr.20040721144439.6:<< print number of each type of object >>
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
    #@-node:ekr.20040721144439.6:<< print number of each type of object >>
    #@nl
    if 0:
        #@        << print added functions >>
        #@+node:ekr.20040721144439.7:<< print added functions >>
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
        #@-node:ekr.20040721144439.7:<< print added functions >>
        #@nl

    lastObjectCount = n2
    return delta
#@nonl
#@-node:ekr.20040721144439.5:printGc
#@+node:ekr.20040721144439.8:printGcRefs
def printGcRefs (verbose=True):

    refs = gc.get_referrers(g.app.windowList[0])
    print '-' * 30

    if verbose:
        print "refs of", g.app.windowList[0]
        for ref in refs:
            print type(ref)
    else:
        print "%d referrers" % len(refs)
#@nonl
#@-node:ekr.20040721144439.8:printGcRefs
#@-node:ekr.20040721144439:run gc
#@+node:EKR.20040623223148: class testUtils
class testUtils:

    """Common utility routines used by unit tests."""

    #@    @+others
    #@+node:EKR.20040623223148.1:compareOutlines
    def compareOutlines (self,root1,root2,compareHeadlines=True):
    
        """Compares two outlines, making sure that their topologies,
        content and join lists are equivalent"""
    
        p2 = root2.copy() ; ok = True
        for p1 in root1.self_and_subtree_iter():
            ok = (
                p1 and p2 and
                p1.numberOfChildren() == p2.numberOfChildren() and
                (not compareHeadlines or (p1.headString() == p2.headString())) and
                p1.bodyString() == p2.bodyString() and
                p1.isCloned()   == p2.isCloned()
            )
            if not ok: break
            p2.moveToThreadNext()
    
        if 0:
            if not ok:
                g.trace("p1",p1.bodyString())
                g.trace("p2",p2.bodyString())
        return ok
    #@nonl
    #@-node:EKR.20040623223148.1:compareOutlines
    #@+node:EKR.20040623223148.2:Finding nodes...
    #@+node:EKR.20040623223148.3:findChildrenOf
    def findChildrenOf (self,root):
    
        return [p.copy() for p in root.children_iter()]
    #@-node:EKR.20040623223148.3:findChildrenOf
    #@+node:EKR.20040623223148.4:findSubnodesOf
    def findSubnodesOf (self,root):
    
        return [p.copy() for p in root.subtree_iter()]
    #@nonl
    #@-node:EKR.20040623223148.4:findSubnodesOf
    #@+node:EKR.20040623223148.5:findNodeInRootTree
    def findRootNode (self,p):
    
        """Return the root of p's tree."""
    
        while p and p.hasParent():
            p.moveToParent()
        return p
    #@nonl
    #@-node:EKR.20040623223148.5:findNodeInRootTree
    #@+node:EKR.20040623223148.6:findNodeInTree
    def findNodeInTree(self,p,headline):
    
        """Search for a node in p's tree matching the given headline."""
    
        c = p.c
        for p in p.subtree_iter():
            h = headline.strip().lower()
            if p.headString().strip().lower() == h:
                return p.copy()
        return c.nullPosition()
    #@nonl
    #@-node:EKR.20040623223148.6:findNodeInTree
    #@+node:EKR.20040623223148.7:findNodeAnywhere
    def findNodeAnywhere(self,c,headline):
    
        for p in c.allNodes_iter():
            h = headline.strip().lower()
            if p.headString().strip().lower() == h:
                return p.copy()
        return c.nullPosition()
    #@nonl
    #@-node:EKR.20040623223148.7:findNodeAnywhere
    #@+node:EKR.20040623223148.8:findUnitTestNode (To Be Deleted)
    def findUnitTestNode (self,unitTestName):
    
        c = g.top() ; root = c.rootPosition()
    
        for p in root.self_and_siblings_iter():
            h = p.headString().lower()
            if g.match(h,0,"unit testing"):
                break
    
        if p:
            for p in p.children_iter():
                h = p.headString()
                if g.match(h,0,"Unit test scripts"):
                    break
    
        if p:
            for p in p.children_iter():
                h = p.headString()
                if g.match(h,0,unitTestName):
                    return p
    
        return c.nullPosition()
    #@nonl
    #@-node:EKR.20040623223148.8:findUnitTestNode (To Be Deleted)
    #@-node:EKR.20040623223148.2:Finding nodes...
    #@+node:EKR.20040623223148.9:numberOfClonesInOutline
    def numberOfClonesInOutline (self):
    
        """Returns the number of cloned nodes in an outline"""
    
        c = g.top() ; n = 0
        for p in c.allNodes_iter():
            if p.isCloned():
                n += 1
        return n
    #@nonl
    #@-node:EKR.20040623223148.9:numberOfClonesInOutline
    #@+node:EKR.20040623223148.10:numberOfNodesInOutline
    def numberOfNodesInOutline (self):
    
        """Returns the total number of nodes in an outline"""
    
        c = g.top() ; n = 0
        for p in c.allNodes_iter():
            n += 1
        return n
    
    #@-node:EKR.20040623223148.10:numberOfNodesInOutline
    #@+node:EKR.20040623223148.11:replaceOutline
    def replaceOutline (self,c,outline1,outline2):
    
        """Replace outline1 by a copy of outline 2,
    
        retaining the headline of outline1."""
    
        u = self
        h = outline1.headString()
        copy = outline2.copyTreeAfter()
        copy.initHeadString(h)
        copy.unlink()
        copy.linkAfter(outline1)
        outline1.doDelete(copy)
    #@nonl
    #@-node:EKR.20040623223148.11:replaceOutline
    #@+node:ekr.20040716073021:testUtils.writeNode/sToNode
    #@+node:ekr.20040716144643:writeNodesToNode
    def writeNodesToNode (self,c,input,output,sentinels=True):
    
        result = []
        for p in input.self_and_subtree_iter():
            s = self.writeNodeToString(c,p,sentinels)
            result.append(s)
        result = ''.join(result)
        output.scriptSetBodyString (result)
    #@nonl
    #@-node:ekr.20040716144643:writeNodesToNode
    #@+node:ekr.20040716143229:writeNodeToNode
    def writeNodeToNode (self,c,input,output,sentinels=True):
    
        """Do an atFile.write the input tree to the body text of the output node."""
    
        s = self.writeNodeToString(c,input,sentinels)
    
        output.scriptSetBodyString (s)
    #@nonl
    #@-node:ekr.20040716143229:writeNodeToNode
    #@+node:ekr.20040717070500:writeNodeToString
    def writeNodeToString (self,c,input,sentinels):
    
        """Return an atFile.write of the input tree to a string."""
    
        df = c.atFileCommands
        nodeIndices = g.app.nodeIndices
    
        # Assign input.v.t.fileIndex
        nodeIndices.setTimestamp()
        for p in input.self_and_subtree_iter():
            try:
                theId,time,n = p.v.t.fileIndex
            except TypeError:
                p.v.t.fileIndex = nodeIndices.getNewIndex()
    
        # Write the file to a string.
        df.write(input,thinFile=True,nosentinels= not sentinels,toString=True)
        s = df.stringOutput
    
        return s
    #@nonl
    #@-node:ekr.20040717070500:writeNodeToString
    #@-node:ekr.20040716073021:testUtils.writeNode/sToNode
    #@+node:ekr.20040716092802:testUtils.compareIgnoringNodeNames
    def compareIgnoringNodeNames (self,s1,s2,delims,verbose=False):
    
        # Compare text containing sentinels, but ignore differences in @+-nodes.
    
        ## if marker[-1] == '@': marker = marker[:-1]
    
        delim1,delim2,delim3 = delims
    
        lines1 = g.splitLines(s1)
        lines2 = g.splitLines(s2)
        if len(lines1) != len(lines2):
            if verbose: g.trace("Different number of lines")
            return False
    
        for i in xrange(len(lines2)):
            line1 = lines1[i]
            line2 = lines2[i]
            if line1 == line2:
                continue
            else:
                n1 = g.skip_ws(line1,0)
                n2 = g.skip_ws(line2,0)
                if (
                    not g.match(line1,n1,delim1) or
                    not g.match(line2,n2,delim1)
                ):
                    if verbose: g.trace("Mismatched non-sentinel lines")
                    return False
                n1 += len(delim1)
                n2 += len(delim1)
                if g.match(line1,n1,"@+node") and g.match(line2,n2,"@+node"):
                    continue
                if g.match(line1,n1,"@-node") and g.match(line2,n2,"@-node"):
                    continue
                else:
                    if verbose:
                        g.trace("Mismatched sentinel lines",delim1)
                        g.trace("line1:",repr(line1))
                        g.trace("line2:",repr(line2))
                    return False
        return True
    #@nonl
    #@-node:ekr.20040716092802:testUtils.compareIgnoringNodeNames
    #@-others
#@nonl
#@-node:EKR.20040623223148: class testUtils
#@+node:EKR.20040623200709.15: fail
def fail ():

    """Mark a unit test as having failed."""

    import leoGlobals as g

    g.app.unitTestDict["fail"] = g.callerName(2)
#@nonl
#@-node:EKR.20040623200709.15: fail
#@+node:ekr.20040707154621:leoTest.runLeoTest
def runLeoTest(path,verbose=False,full=False):

    c = g.top() ; frame = None ; ok = False
    old_gui = g.app.gui

    try:
        g.app.unitTesting = True
        ok, frame = g.openWithFileName(path,c,enableLog=False)
        assert(ok and frame)
        errors = frame.c.checkOutline(verbose=verbose,unittest=True,full=full)
        assert(errors == 0)
        ok = True
    finally:
        g.app.gui = old_gui
        if frame and frame.c != c:
            g.app.closeLeoWindow(frame.c.frame)
        g.app.unitTesting = False
        c.frame.top.update()

    if not ok: raise
#@nonl
#@-node:ekr.20040707154621:leoTest.runLeoTest
#@+node:ekr.20040708145036:Specific to particular unit tests...
#@+node:ekr.20040707140849.5:at-File test code (leoTest.py)
def runAtFileTest(c,p):

    """Common code for testing output of @file, @thin, etc."""

    at = c.atFileCommands
    child1 = p.firstChild()
    child2 = child1.next()
    h1 = child1.headString().lower().strip()
    h2 = child2.headString().lower().strip()
    assert(g.match(h1,0,"#@"))
    assert(g.match(h2,0,"output"))
    expected = child2.bodyString()

    # Compute the type from child1's headline.
    j = g.skip_c_id(h1,2)
    theType = h1[1:j]
    assert theType in ("@file","@thin","@nosent","@noref","@asis"), "bad type: %s" % type

    thinFile = theType == "@thin"
    nosentinels = theType in ("@asis","@nosent")

    if theType == "@asis":
        at.asisWrite(child1,toString=True)
    elif theType == "@noref":
        at.norefWrite(child1,toString=True)
    else:
        at.write(child1,thinFile=thinFile,nosentinels=nosentinels,toString=True)
    try:
        result = g.toUnicode(at.stringOutput,"ascii")
        assert(result == expected)
    except AssertionError:
        #@        << dump result and expected >>
        #@+node:ekr.20040707141957:<< dump result and expected >>
        print ; print '-' * 20
        print "result..."
        for line in g.splitLines(result):
            print "%3d" % len(line),repr(line)
        print '-' * 20
        print "expected..."
        for line in g.splitLines(expected):
            print "%3d" % len(line),repr(line)
        print '-' * 20
        #@nonl
        #@-node:ekr.20040707141957:<< dump result and expected >>
        #@nl
        raise
#@nonl
#@-node:ekr.20040707140849.5:at-File test code (leoTest.py)
#@+node:ekr.20040708074710:Reformat Paragraph test code (leoTest.py)
# DTHEIN 2004.01.11: Added unit tests for reformatParagraph
#@nonl
#@+node:ekr.20040708074710.1:makeReformatParagraphSuite
# DTHEIN 2004.01.11: Added method
def makeReformatParagraphSuite(*args,**keys):

    """makeReformatParagraphSuite() -> suite

    Create a Reformat Paragraph test for each of the 
    unit tests in the reformatParagraphTestCase class."""

    if 1: # Add all 'test' methods to the suite.
        return unittest.makeSuite(reformatParagraphTestCase,'test')
    else:
        suite = unittest.TestSuite()
        suite.addTest(reformatParagraphTestCase("testNoTrailingNewline"))
        suite.addTest(reformatParagraphTestCase("testTrailingNewline"))
        suite.addTest(reformatParagraphTestCase("testMixedLineLengths"))
        suite.addTest(reformatParagraphTestCase("testMixedLinesWithLeadingWS"))
        suite.addTest(reformatParagraphTestCase("testNoChangeRequired"))
        suite.addTest(reformatParagraphTestCase("testHonorLeadingWS"))
        suite.addTest(reformatParagraphTestCase("testHonorLeadingWSVar1"))
        suite.addTest(reformatParagraphTestCase("testSimpleHangingIndent"))
        suite.addTest(reformatParagraphTestCase("testSimpleHangingIndentVar1"))
        suite.addTest(reformatParagraphTestCase("testSimpleHangingIndentVar2"))
        suite.addTest(reformatParagraphTestCase("testMultiParagraph"))
        suite.addTest(reformatParagraphTestCase("testMultiParagraphWithList"))
        suite.addTest(reformatParagraphTestCase("testDirectiveBreaksParagraph"))
        suite.addTest(reformatParagraphTestCase("testWithLeadingWSOnEmptyLines"))
        return suite
#@nonl
#@-node:ekr.20040708074710.1:makeReformatParagraphSuite
#@+node:ekr.20040708074710.2:class reformatParagraphTestCase (TestCase)
# DTHEIN 2004.01.11: Added class
class reformatParagraphTestCase(unittest.TestCase):

    """Unit tests for Leo's reformat paragraph command."""

    #@    @+others
    #@+node:ekr.20040809073137: fail
    def fail (self):
    
        """Mark a unit test as having failed."""
    
        import leoGlobals as g
    
        g.app.unitTestDict["fail"] = g.callerName(2)
    #@nonl
    #@-node:ekr.20040809073137: fail
    #@+node:ekr.20040708074710.3:setUp
    # DTHEIN 2004.01.11: Added method
    def setUp(self):
    
        testsName = "Reformat Paragraph tests"
        codeName = "Reformat Paragraph test code (leoTest.py)"
    
        self.u = u = testUtils()
        self.c = c = g.top()
        self.current_v = c.currentVnode()
        self.old_v = c.currentVnode()
        # root = u.findRootNode(self.current_v)
        root = u.findNodeAnywhere(c,testsName) # EKR: 7/8/04
        if not root: print "Can not find", testsName
        self.temp_v = temp_v = u.findNodeInTree(root,"tempNode")
        if not temp_v: print "Can not find tempNode"
        assert(temp_v)
        self.tempChild_v = None
        # self.dataParent_v = u.findNodeInTree(root,"reformatParagraphsTests")
        self.dataParent_v = u.findNodeAnywhere(c,testsName) # EKR: 7/8/04
        if not self.dataParent_v:
            print "Can not find", codeName
        assert(self.dataParent_v)
        self.before_v = None
        self.after_v = None
        self.case_v = None
        self.wasChanged = self.c.changed
    #@nonl
    #@-node:ekr.20040708074710.3:setUp
    #@+node:ekr.20040708074710.4:tearDown
    # DTHEIN 2004.01.11: Added method
    def tearDown(self):
    
        c = self.c ; temp_v = self.temp_v
    
        # clear the temp node and mark it unchanged
        temp_v.setTnodeText("",g.app.tkEncoding)
        temp_v.clearDirty()
    
        if not self.wasChanged:
            c.setChanged (False)
    
        # Delete all children of temp node.
        while temp_v.firstChild():
            temp_v.firstChild().doDelete(temp_v)
    
        # make the original node the current node
        c.selectVnode(self.old_v)
    #@nonl
    #@-node:ekr.20040708074710.4:tearDown
    #@+node:ekr.20040708074710.5:testNoTrailingNewline
    # DTHEIN 2004.01.11: Added method
    def testNoTrailingNewline(self):
    
        self.singleParagraphTest("testNoTrailingNewline",2,24)
    #@-node:ekr.20040708074710.5:testNoTrailingNewline
    #@+node:ekr.20040708074710.6:testTrailingNewline
    # DTHEIN 2004.01.11: Added method
    def testTrailingNewline(self):
    
        self.singleParagraphTest("testTrailingNewline",3,0)
    #@-node:ekr.20040708074710.6:testTrailingNewline
    #@+node:ekr.20040708074710.7:testMixedLineLengths
    # DTHEIN 2004.01.11: Added method
    def testMixedLineLengths(self):
    
        self.singleParagraphTest("testMixedLineLengths",4,10)
    #@-node:ekr.20040708074710.7:testMixedLineLengths
    #@+node:ekr.20040708074710.8:testMixedLinesWithLeadingWS
    # DTHEIN 2004.01.11: Added method
    def testMixedLinesWithLeadingWS(self):
    
        self.singleParagraphTest("testMixedLinesWithLeadingWS",4,12)
    #@-node:ekr.20040708074710.8:testMixedLinesWithLeadingWS
    #@+node:ekr.20040708074710.9:testNoChangeRequired
    # DTHEIN 2004.01.11: Added method
    def testNoChangeRequired(self):
    
        self.singleParagraphTest("testNoChangeRequired",1,28)
    #@-node:ekr.20040708074710.9:testNoChangeRequired
    #@+node:ekr.20040708074710.10:testHonorLeadingWS
    # DTHEIN 2004.01.11: Added method
    def testHonorLeadingWS(self):
    
        self.singleParagraphTest("testHonorLeadingWS",5,16)
    #@-node:ekr.20040708074710.10:testHonorLeadingWS
    #@+node:ekr.20040708074710.11:testHonorLeadingWSVar1
    # DTHEIN 2004.01.11: Added method
    def testHonorLeadingWSVar1(self):
    
        self.singleParagraphTest("testHonorLeadingWSVar1",5,16)
    #@-node:ekr.20040708074710.11:testHonorLeadingWSVar1
    #@+node:ekr.20040708074710.12:testSimpleHangingIndent
    # DTHEIN 2004.01.11: Added method
    def testSimpleHangingIndent(self):
    
        self.singleParagraphTest("testSimpleHangingIndent",5,8)
    #@-node:ekr.20040708074710.12:testSimpleHangingIndent
    #@+node:ekr.20040708074710.13:testSimpleHangingIndentVar1
    # DTHEIN 2004.01.11: Added method
    def testSimpleHangingIndentVar1(self):
    
        self.singleParagraphTest("testSimpleHangingIndentVar1",5,8)
    #@-node:ekr.20040708074710.13:testSimpleHangingIndentVar1
    #@+node:ekr.20040708074710.14:testSimpleHangingIndentVar2
    # DTHEIN 2004.01.11: Added method
    def testSimpleHangingIndentVar2(self):
    
        self.singleParagraphTest("testSimpleHangingIndentVar2",5,8)
    #@-node:ekr.20040708074710.14:testSimpleHangingIndentVar2
    #@+node:ekr.20040708074710.15:testMultiParagraph
    # DTHEIN 2004.01.11: Added method
    def testMultiParagraph(self):
    
        # Locate the test data
        #
        self.getCaseDataNodes("testMultiParagraph")
    
        # Setup the temp node
        #
        self.copyBeforeToTemp()
    
        # reformat the paragraph and check insertion cursor position
        #
        self.c.reformatParagraph()
        self.checkPosition(13,0)
    
        # Keep going, in the same manner
        #
        self.c.reformatParagraph()
        self.checkPosition(25,0)
        self.c.reformatParagraph()
        self.checkPosition(32,11)
    
        # Compare the computed result to the reference result.
        self.checkText()
    #@-node:ekr.20040708074710.15:testMultiParagraph
    #@+node:ekr.20040708074710.16:testMultiParagraphWithList
    # DTHEIN 2004.01.11: Added method
    def testMultiParagraphWithList(self):
    
        # Locate the test data
        #
        self.getCaseDataNodes("testMultiParagraphWithList")
    
        # Setup the temp node
        #
        self.copyBeforeToTemp()
    
        # reformat the paragraph and check insertion cursor position
        #
        self.c.reformatParagraph()
        self.checkPosition(4,0)
    
        # Keep going, in the same manner
        #
        self.c.reformatParagraph()
        self.checkPosition(7,0)
        self.c.reformatParagraph()
        self.checkPosition(10,0)
        self.c.reformatParagraph()
        self.checkPosition(13,0)
        self.c.reformatParagraph()
        self.checkPosition(14,18)
    
        # Compare the computed result to the reference result.
        self.checkText()
    #@-node:ekr.20040708074710.16:testMultiParagraphWithList
    #@+node:ekr.20040708074710.17:testDirectiveBreaksParagraph
    # DTHEIN 2004.01.11: Added method
    def testDirectiveBreaksParagraph(self):
    
        # Locate the test data
        #
        self.getCaseDataNodes("testDirectiveBreaksParagraph")
    
        # Setup the temp node
        #
        self.copyBeforeToTemp()
    
        # reformat the paragraph and check insertion cursor position
        #
        self.c.reformatParagraph()
        self.checkPosition(13,0) # at next paragraph
    
        # Keep going, in the same manner
        #
        self.c.reformatParagraph()
        self.checkPosition(25,0) # at next paragraph
    
        self.c.reformatParagraph()
        self.checkPosition(32,11)
    
        # Compare the computed result to the reference result.
        self.checkText()
    #@-node:ekr.20040708074710.17:testDirectiveBreaksParagraph
    #@+node:ekr.20040708074710.18:testWithLeadingWSOnEmptyLines
    # DTHEIN 2004.01.11: Added method
    def testWithLeadingWSOnEmptyLines(self):
    
        # Locate the test data
        #
        self.getCaseDataNodes("testWithLeadingWSOnEmptyLines")
    
        # Setup the temp node
        #
        self.copyBeforeToTemp()
    
        # reformat the paragraph and check insertion cursor position
        #
        self.c.reformatParagraph()
        self.checkPosition(4,0)
    
        # Keep going, in the same manner
        #
        self.c.reformatParagraph()
        self.checkPosition(7,0)
        self.c.reformatParagraph()
        self.checkPosition(10,0)
        self.c.reformatParagraph()
        self.checkPosition(13,0)
        self.c.reformatParagraph()
        self.checkPosition(14,18)
    
        # Compare the computed result to the reference result.
        self.checkText()
    #@-node:ekr.20040708074710.18:testWithLeadingWSOnEmptyLines
    #@+node:ekr.20040708074710.19:singleParagraphTest
    # DTHEIN 2004.01.11: Added method
    def singleParagraphTest(self,caseName,finalRow,finalCol):
    
        # Locate the test data
        #
        self.getCaseDataNodes(caseName)
    
        # Setup the temp node
        #
        self.copyBeforeToTemp()
    
        # reformat the paragraph
        #
        self.c.reformatParagraph()
    
        # Compare the computed result to the reference result.
        self.checkText()
        self.checkPosition(finalRow,finalCol)
    
    #@-node:ekr.20040708074710.19:singleParagraphTest
    #@+node:ekr.20040708074710.20:checkPosition
    # DTHEIN 2004.01.11: Added method
    def checkPosition(self,expRow,expCol):
    
        row,col = self.getRowCol()
        self.failUnlessEqual(expCol,col,
            "Current position is (" + str(row) + "," + str(col) 
            + ");  expected cursor to be at column " + str(expCol) + ".")
        self.failUnlessEqual(expRow,row,
            "Current position is (" + str(row) + "," + str(col) 
            + ");  expected cursor to be at line " + str(expRow) + ".")
    #@-node:ekr.20040708074710.20:checkPosition
    #@+node:ekr.20040708074710.21:checkText
    # DTHEIN 2004.01.11: Added method
    def checkText(self):
    
        new_text = self.tempChild_v.bodyString()
        ref_text = self.after_v.bodyString()
        newLines = new_text.splitlines(1)
        refLines = ref_text.splitlines(1)
        newLinesCount = len(newLines)
        refLinesCount = len(refLines)
        for i in range(min(newLinesCount,refLinesCount)):
            self.failUnlessEqual(newLines[i],refLines[i],
                "Mismatch on line " + str(i) + "."
                + "\nExpected text: " + `refLines[i]`
                + "\n  Actual text: "	+ `newLines[i]`)
        self.failUnlessEqual(newLinesCount,refLinesCount,
            "Expected " + str(refLinesCount) + " lines, but "
            + "received " + str(newLinesCount) + " lines.")
    #@nonl
    #@-node:ekr.20040708074710.21:checkText
    #@+node:ekr.20040708074710.22:copyBeforeToTemp
    # DTHEIN 2004.01.11: Added method
    # Warning: this is Tk-specific code.
    #
    def copyBeforeToTemp(self):
    
        # local variables for class fields, for ease
        # of reading and ease of typing.
        #	
        c = self.c ; temp_v = self.temp_v
    
        # Delete all children of temp node.
        #
        while temp_v.firstChild():
            temp_v.firstChild().doDelete(temp_v)
    
        # Copy the test case node text to the temp node
        #
        text = self.case_v.bodyString()
        temp_v.setTnodeText(text,g.app.tkEncoding)
    
        # create the child node that holds the text
        #
        t = leoNodes.tnode(headString="tempChildNode")
        self.tempChild_v = self.temp_v.insertAsNthChild(0,t)
    
        # copy the before text to the temp text
        #
        text = self.before_v.bodyString()
        self.tempChild_v.setTnodeText(text,g.app.tkEncoding)
    
        # make the temp child node current, and put the
        # cursor at the beginning
        #
        c.selectVnode(self.tempChild_v)
        c.frame.body.setInsertPointToStartOfLine( 0 )
        c.frame.body.setTextSelection(None,None)
        #g.app.gui.setInsertPoint(t,"1.0")
        #g.app.gui.setTextSelection(t,"1.0","1.0")
    #@-node:ekr.20040708074710.22:copyBeforeToTemp
    #@+node:ekr.20040708074710.23:getCaseDataNodes
    # DTHEIN 2004.01.11: Added method
    def getCaseDataNodes(self,caseNodeName):
    
        self.case_v = self.u.findNodeInTree(self.dataParent_v,caseNodeName)
        self.before_v = self.u.findNodeInTree(self.case_v,"before")
        self.after_v  = self.u.findNodeInTree(self.case_v,"after")
    #@-node:ekr.20040708074710.23:getCaseDataNodes
    #@+node:ekr.20040708074710.24:getRowCol
    # DTHEIN 2004.01.11: Added method
    def getRowCol(self):
    
        # local variables for class fields, for ease
        # of reading and ease of typing.
        #	
        c = self.c ; body = c.frame.body.bodyCtrl ; gui = g.app.gui
        tab_width = c.frame.tab_width
    
        # Get the Tkinter row col position of the insert cursor
        #	
        index = body.index("insert")
        row,col = gui.getindex(body,index)
    
        # Adjust col position for tabs
        #
        if col > 0:
            s = body.get("%d.0" % (row),index)
            s = g.toUnicode(s,g.app.tkEncoding)
            col = g.computeWidth(s,tab_width)
    
        return (row,col)
    #@-node:ekr.20040708074710.24:getRowCol
    #@-others
#@nonl
#@-node:ekr.20040708074710.2:class reformatParagraphTestCase (TestCase)
#@-node:ekr.20040708074710:Reformat Paragraph test code (leoTest.py)
#@+node:ekr.20040708111644:Edit Body test code (leoTest.py)
#@+node:ekr.20040707140849.11: makeEditBodySuite
def makeEditBodySuite():

    """Create an Edit Body test for every descendant of testParentHeadline.."""

    c = g.top() ; p = c.currentPosition()
    u = testUtils()
    data_p = u.findNodeInTree(p,"editBodyTests")
    assert(data_p)
    temp_p = u.findNodeInTree(data_p,"tempNode")
    assert(temp_p)

    # Create the suite and add all test cases.
    suite = unittest.makeSuite(unittest.TestCase)

    for p in data_p.children_iter():
        if p.headString()=="tempNode": continue # TempNode now in data tree.
        before = u.findNodeInTree(p,"before")
        after  = u.findNodeInTree(p,"after")
        sel    = u.findNodeInTree(p,"selection")
        ins    = u.findNodeInTree(p,"insert")
        if before and after:
            test = editBodyTestCase(c,p,before,after,sel,ins,temp_p)
            suite.addTest(test)
        else:
            print 'missing "before" or "after" for', p.headString()

    return suite
#@nonl
#@-node:ekr.20040707140849.11: makeEditBodySuite
#@+node:ekr.20040707140849.12:class editBodyTestCase
class editBodyTestCase(unittest.TestCase):

    """Data-driven unit tests for Leo's edit body commands."""

    #@    @+others
    #@+node:ekr.20040707140849.13:__init__
    def __init__ (self,c,parent,before,after,sel,ins,temp_v):
    
        # Init the base class.
        unittest.TestCase.__init__(self)
    
        self.u = testUtils()
    
        self.c = c
        self.parent = parent.copy()
        self.before = before.copy()
        self.after  = after.copy()
        self.sel    = sel.copy() # Two lines giving the selection range in tk coordinates.
        self.ins    = ins.copy() # One line giving the insert point in tk coordinate.
        self.temp_v = temp_v.copy()
    #@nonl
    #@+node:ekr.20040809073457: fail
    def fail (self):
    
        """Mark a unit test as having failed."""
    
        import leoGlobals as g
    
        g.app.unitTestDict["fail"] = g.callerName(2)
    #@nonl
    #@-node:ekr.20040809073457: fail
    #@-node:ekr.20040707140849.13:__init__
    #@+node:ekr.20040707140849.14:editBody
    def editBody (self):
    
        c = self.c ; u = self.u
    
        # Compute the result in temp_v.bodyString()
        commandName = self.parent.headString()
        # g.trace(commandName)
        command = getattr(c,commandName)
        command()
    
        if 1:
            assert(u.compareOutlines(self.temp_v,self.after,compareHeadlines=False))
            c.undoer.undo()
            assert(u.compareOutlines(self.temp_v,self.before,compareHeadlines=False))
            c.undoer.redo()
            assert(u.compareOutlines(self.temp_v,self.after,compareHeadlines=False))
            c.undoer.undo()
            assert(u.compareOutlines(self.temp_v,self.before,compareHeadlines=False))
    #@-node:ekr.20040707140849.14:editBody
    #@+node:ekr.20040707140849.16:tearDown
    def tearDown (self):
    
        c = self.c ; temp_v = self.temp_v
    
        c.selectVnode(temp_v)
        temp_v.setTnodeText("",g.app.tkEncoding)
        temp_v.clearDirty()
    
        # Delete all children of temp node.
        while temp_v.firstChild():
            temp_v.firstChild().doDelete(temp_v)
    #@nonl
    #@-node:ekr.20040707140849.16:tearDown
    #@+node:ekr.20040707140849.17:setUp
    # Warning: this is Tk-specific code.
    
    def setUp(self,*args,**keys):
    
        c = self.c ; temp_v = self.temp_v
    
        # Delete all children of temp node.
        while temp_v.firstChild():
            temp_v.firstChild().doDelete(temp_v)
    
        text = self.before.bodyString()
    
        temp_v.setTnodeText(text,g.app.tkEncoding)
        c.selectVnode(self.temp_v) # 7/8/04
    
        t = c.frame.body.bodyCtrl
        if self.sel:
            s = str(self.sel.bodyString()) # Can't be unicode.
            lines = s.split('\n')
            g.app.gui.setTextSelection(t,lines[0],lines[1])
    
        if self.ins:
            s = str(self.ins.bodyString()) # Can't be unicode.
            lines = s.split('\n')
            g.trace(lines)
            g.app.gui.setInsertPoint(t,lines[0])
    
        if not self.sel and not self.ins:
            g.app.gui.setInsertPoint(t,"1.0")
            g.app.gui.setTextSelection(t,"1.0","1.0")
    #@nonl
    #@-node:ekr.20040707140849.17:setUp
    #@+node:ekr.20040707140849.18:runTest
    def runTest(self):
    
        self.editBody()
    #@nonl
    #@-node:ekr.20040707140849.18:runTest
    #@-others
#@nonl
#@-node:ekr.20040707140849.12:class editBodyTestCase
#@-node:ekr.20040708111644:Edit Body test code (leoTest.py)
#@+node:ekr.20040708173707:Import/Export test code (leoTest.py)
#@+node:ekr.20040707140849.27:makeImportExportSuite
def makeImportExportSuite(parentHeadline,doImport):

    """Create an Import/Export test for every descendant of testParentHeadline.."""

    c = g.top() ; v = c.currentVnode()
    u = testUtils()

    parent = u.findNodeAnywhere(c,parentHeadline)
    assert(parent)
    temp = u.findNodeInTree(parent,"tempNode")
    assert(temp)

    # Create the suite and add all test cases.
    suite = unittest.makeSuite(unittest.TestCase)

    for p in parent.children_iter(copy=True):
        if p == temp: continue
        dialog = u.findNodeInTree(p,"dialog")
        assert(dialog)
        test = importExportTestCase(c,p,dialog,temp,doImport)
        suite.addTest(test)

    return suite
#@-node:ekr.20040707140849.27:makeImportExportSuite
#@+node:ekr.20040707140849.28:class importExportTestCase
class importExportTestCase(unittest.TestCase):

    """Data-driven unit tests for Leo's edit body commands."""

    #@    @+others
    #@+node:ekr.20040707140849.29:__init__
    def __init__ (self,c,v,dialog,temp_v,doImport):
    
        # Init the base class.
        unittest.TestCase.__init__(self)
    
        self.c = c
        self.dialog = dialog
        self.v = v
        self.temp_v = temp_v
    
        self.gui = None
        self.wasChanged = c.changed
        self.fileName = ""
        self.doImport = doImport
    
        self.old_v = c.currentVnode()
    #@nonl
    #@-node:ekr.20040707140849.29:__init__
    #@+node:ekr.20040809073457.1: fail
    def fail (self):
    
        """Mark a unit test as having failed."""
    
        import leoGlobals as g
    
        g.app.unitTestDict["fail"] = g.callerName(2)
    #@nonl
    #@-node:ekr.20040809073457.1: fail
    #@+node:ekr.20040707140849.30:importExport
    def importExport (self):
    
        c = self.c ; v = self.v
    
        g.app.unitTestDict = {}
    
        commandName = v.headString()
        command = getattr(c,commandName) # Will fail if command does not exist.
        command()
    
        failedMethod = g.app.unitTestDict.get("fail")
        self.failIf(failedMethod,failedMethod)
    #@nonl
    #@-node:ekr.20040707140849.30:importExport
    #@+node:ekr.20040707140849.31:runTest
    def runTest(self):
    
        # """Import Export Test Case"""
    
        self.importExport()
    #@nonl
    #@-node:ekr.20040707140849.31:runTest
    #@+node:ekr.20040707140849.32:setUp
    def setUp(self,*args,**keys):
    
        c = self.c ; temp_v = self.temp_v ; d = self.dialog
    
        temp_v.setTnodeText('',g.app.tkEncoding)
    
        # Create a node under temp_v.
        child = temp_v.insertAsLastChild()
        assert(child)
        child.setHeadString("import test: " + self.v.headString())
        c.selectVnode(child)
    
        assert(d)
        s = d.bodyString()
        lines = s.split('\n')
        name = lines[0]
        fileName = lines[1]
    
        self.fileName = fileName = g.os_path_join(g.app.loadDir,"..",fileName)
    
        if self.doImport:
            theDict = {name: [fileName]}
        else:
            theDict = {name: fileName}
    
        g.app.unitTesting = True
        self.gui = leoGui.unitTestGui(theDict,trace=False)
    
    #@-node:ekr.20040707140849.32:setUp
    #@+node:ekr.20040707140849.33:shortDescription
    def shortDescription (self):
    
        try:
            return "ImportExportTestCase: %s %s" % (self.v.headString(),self.fileName)
        except:
            return "ImportExportTestCase"
    #@nonl
    #@-node:ekr.20040707140849.33:shortDescription
    #@+node:ekr.20040707140849.34:tearDown
    def tearDown (self):
    
        c = self.c ; temp_v = self.temp_v
    
        if self.gui:
            self.gui.destroySelf()
            self.gui = None
    
        temp_v.setTnodeText("",g.app.tkEncoding)
        temp_v.clearDirty()
    
        if not self.wasChanged:
            c.setChanged (False)
    
        if 1: # Delete all children of temp node.
            while temp_v.firstChild():
                temp_v.firstChild().doDelete(temp_v)
    
        c.selectVnode(self.old_v)
        g.app.unitTesting = False
    #@nonl
    #@-node:ekr.20040707140849.34:tearDown
    #@-others
#@nonl
#@-node:ekr.20040707140849.28:class importExportTestCase
#@-node:ekr.20040708173707:Import/Export test code (leoTest.py)
#@+node:ekr.20040716140617:Perfect Import test code (leoTest.py)
#@+node:ekr.20040717074817:About the Perfect Import tests
#@@killcolor
#@+at
# 
# This code assumes that the test code contains child nodes with the following 
# headlines:
# 
# -input          Contains the "before" tree, without sentinels
# -input-after    Contains the "after" tree, without sentinels.
# 
# These two nodes define what the test means.
# 
# The following nodes must also exist.  The test code sets their contents as 
# follows:
# 
# -output-sent        The result of writing the -input tree, with sentinels.
# -output-after-sent  The result of writing the -input-after tree, with 
# sentinels.
# -i_lines            The i_lines list created by mu.create_mapping
# -j_lines            The j_lines list created by stripping sentinels from 
# -input-after's tree.
# -result             The result of running mu.propagateDiffsToSentinelsLines, 
# containing sentinels.
# 
# A test passes if and only if the body of -result matches the body of 
# output-after-sent, ignoring the details of @+node and @-node sentinels.
#@-at
#@nonl
#@-node:ekr.20040717074817:About the Perfect Import tests
#@+node:ekr.20040716140617.1:runPerfectImportTest
def runPerfectImportTest(c,p,
    testing=False,verbose=False,
    ignoreSentinelsInCompare=False):
        
    __pychecker__ = '--no-shadowbuiltin' # input is a builtin.

    # The contents of the "-input" and "-input-after" nodes define the changes.

    c = g.top() ; p = c.currentPosition()
    u = testUtils()

    input           = u.findNodeInTree(p,"-input")              # i file: before the change.
    input_ins       = u.findNodeInTree(p,"-input-after")        # j file: after the change.
    output_sent     = u.findNodeInTree(p,"-output-sent")        # fat file -> i file.
    out_after_sent  = u.findNodeInTree(p,"-output-after-sent")  # Should match result.
    result          = u.findNodeInTree(p,"-result")
    ilines          = u.findNodeInTree(p,"-i_lines")
    jlines          = u.findNodeInTree(p,"-j_lines")

    # Create the output nodes containing sentinels from the original input.
    u.writeNodesToNode(c,input,output_sent,sentinels=True)
    u.writeNodesToNode(c,input_ins,out_after_sent,sentinels=True)

    mu = g.mulderUpdateAlgorithm(testing=testing,verbose=verbose)
    delims = g.comment_delims_from_extension("foo.py")

    fat_lines = g.splitLines(output_sent.bodyString())
    i_lines,mapping = mu.create_mapping(fat_lines,delims)
    if input_ins.hasChildren():
        # Get the lines by stripping sentinels from -output-after-sent node.
        lines = g.splitLines(out_after_sent.bodyString()) 
        j_lines = mu.removeSentinelsFromLines(lines,delims)
    else:
        j_lines = g.splitLines(input_ins.bodyString()) 

    # For viewing...
    ilines.scriptSetBodyString(''.join(i_lines))
    jlines.scriptSetBodyString(''.join(j_lines))
    if ilines.bodyString() != input.bodyString():
        if not ignoreSentinelsInCompare:
            print "i_lines != input !"

    # Put the resulting lines (with sentinels) into the -result node.
    lines = mu.propagateDiffsToSentinelsLines(i_lines,j_lines,fat_lines,mapping)
    result.scriptSetBodyString(''.join(lines))

    if ignoreSentinelsInCompare:
        sList = []
        for s in (result.bodyString(),out_after_sent.bodyString()):
            lines = g.splitLines(s)
            lines = mu.removeSentinelsFromLines(lines,delims)
            sList.append(''.join(lines))
        return sList[0] == sList[1]
    else:
        return u.compareIgnoringNodeNames(
            result.bodyString(),
            out_after_sent.bodyString(),
            delims,verbose=True)
#@nonl
#@-node:ekr.20040716140617.1:runPerfectImportTest
#@-node:ekr.20040716140617:Perfect Import test code (leoTest.py)
#@+node:ekr.20040801140146:Plugin tests... (leoTest.py)
#@+node:ekr.20040801145719:getAllPluginFilenames
def getAllPluginFilenames ():

    path = g.os_path_join(g.app.loadDir,"..","plugins")

    files = glob.glob(g.os_path_join(path,"*.py"))
    files = [g.os_path_abspath(f) for f in files]
    files.sort()
    return files
#@nonl
#@-node:ekr.20040801145719:getAllPluginFilenames
#@+node:ekr.20040801124822:testPlugin (no longer used)
def oldTestPlugin (fileName,verbose=False):
        
    path = g.os_path_join(g.app.loadDir,"..","plugins")
    path = g.os_path_abspath(path)
    
    g.app.unitTesting = True
    
    try:

        module = g.importFromPath(fileName,path)
        assert module, "Can not import %s" % path
        
        # Run any unit tests in the module itself.
        if hasattr(module,"unitTest"):
            if verbose:
                g.trace("Executing unitTest in plugins/%s..." % fileName)
    
            module.unitTest(verbose=verbose)
            
    finally:
        g.app.unitTesting = False
#@nonl
#@-node:ekr.20040801124822:testPlugin (no longer used)
#@+node:ekr.20040801135348:checkFileSyntax
def checkFileSyntax (fileName,s):
    
    try:
        compiler.parse(s + '\n')
    except SyntaxError:
        g.es("Syntax error in: %s" % fileName,color="blue")
        g.es_exception(full=False,color="black")
        raise
#@nonl
#@-node:ekr.20040801135348:checkFileSyntax
#@+node:ekr.20040801135348.1:checkFileTabs
def checkFileTabs (fileName,s):

    try:
        readline = g.readLinesClass(s).next
        tabnanny.process_tokens(tokenize.generate_tokens(readline))

    except tokenize.TokenError, msg:
        s = "Token error in %s" % fileName
        print s ; g.es(s,color="blue")
        s = str(msg)
        print s ; g.es(s)
        assert 0, "test failed"

    except tabnanny.NannyNag, nag:
        badline = nag.get_lineno()
        line    = nag.get_line()
        message = nag.get_msg()
        s = "Indentation error in %s, line %d" % (fileName, badline)
        print s ; g.es(s,color="blue")
        print message ; g.es(message)
        s = "offending line:\n%s" % repr(str(line))[1:-1]
        print s ; g.es(s)
        assert 0, "test failed"

    except:
        s = "unexpected exception"
        print s ; g.trace(s)
        g.es_exception()
        assert 0, "test failed"
#@nonl
#@-node:ekr.20040801135348.1:checkFileTabs
#@-node:ekr.20040801140146:Plugin tests... (leoTest.py)
#@-node:ekr.20040708145036:Specific to particular unit tests...
#@+node:ekr.20040710184602:Test of doctest
#@+node:ekr.20040710183515:factorial
def factorial(n):
    """Return the factorial of n, an exact integer >= 0.

    If the result is small enough to fit in an int, return an int.
    Else return a long.

    >>> [factorial(n) for n in range(6)]
    [1, 1, 2, 6, 24, 120]
    >>> [factorial(long(n)) for n in range(6)]
    [1, 1, 2, 6, 24, 120]
    >>> factorial(30)
    265252859812191058636308480000000L
    >>> factorial(30L)
    265252859812191058636308480000000L
    >>> factorial(-1)
    Traceback (most recent call last):
        ...
    ValueError: n must be >= 0

    Factorials of floats are OK, but the float must be an exact integer:
    >>> factorial(30.1)
    Traceback (most recent call last):
        ...
    ValueError: n must be exact integer
    >>> factorial(30.0)
    265252859812191058636308480000000L

    It must also not be ridiculously large:
    >>> factorial(1e100)
    Traceback (most recent call last):
        ...
    OverflowError: n too large
    """

    import math
    if not n >= 0:
        raise ValueError("n must be >= 0")
    if math.floor(n) != n:
        raise ValueError("n must be exact integer")
    if n+1 == n:  # catch a value like 1e300
        raise OverflowError("n too large")
    result = 1
    factor = 2
    while factor <= n:
        try:
            result *= factor
        except OverflowError:
            result *= long(factor)
        factor += 1
    return result
#@nonl
#@-node:ekr.20040710183515:factorial
#@-node:ekr.20040710184602:Test of doctest
#@+node:ekr.20040711043551:Docutils stuff
#@+node:ekr.20040711042449:createUnitTestsFromDoctests
def createUnitTestsFromDoctests (modules,verbose=True):

    created = False # True if suite is non-empty.

    suite = unittest.makeSuite(unittest.TestCase)

    for module in list(modules):
        # New in Python 4.2: n may be zero.
        try:
            test = doctest.DocTestSuite(module)
            n = test.countTestCases()
            if n > 0:
                suite.addTest(test)
                created = True
                if verbose:
                    print "found %2d doctests for %s" % (n,module.__name__)
        except ValueError:
            pass # No tests found.

    return g.choose(created,suite,None)
#@nonl
#@-node:ekr.20040711042449:createUnitTestsFromDoctests
#@+node:ekr.20040711052911.1:findAllAtFileNodes
def findAllAtFileNodes(c):

    paths = []

    for p in c.all_positions_iter():
        name = p.anyAtFileNodeName()
        if name:
            head,tail = g.os_path_split(name)
            filename,ext = g.os_path_splitext(tail)
            if ext == ".py":
                path = g.os_path_join(g.app.loadDir,name)
                path = g.os_path_abspath(path)
                paths.append(path)

    return paths
#@nonl
#@-node:ekr.20040711052911.1:findAllAtFileNodes
#@+node:ekr.20040711052911:importAllModulesInPathList
def importAllModulesInPathList(paths):

    paths = list(paths)
    modules = []

    for path in paths:
        module = safeImportModule(path)
        if module:
            modules.append(module)

    return modules
#@-node:ekr.20040711052911:importAllModulesInPathList
#@+node:ekr.20040711043551.1:importAllModulesInPath
def importAllModulesInPath (path):

    path = g.os_path_abspath(path)

    if not g.os_path_exists(path):
        g.es("path does not exist: %s" % path)
        return []

    path2 = g.os_path_join(path,"leo*.py")
    files = glob.glob(path2)
    modules = []

    for theFile in files:
        module = safeImportModule(theFile)
        if module:
            modules.append(module)

    return modules
#@-node:ekr.20040711043551.1:importAllModulesInPath
#@+node:ekr.20040711061551:safeImportModule
#@+at 
#@nonl
# Warning: do NOT use g.importFromPath here!
# 
# g.importFromPath uses imp.load_module, and that is equivalent to reload!
# reloading Leo files while running will crash Leo.
#@-at
#@@c

def safeImportModule (fileName):

    fileName = g.os_path_abspath(fileName)
    head,tail = g.os_path_split(fileName)
    moduleName,ext = g.os_path_splitext(tail)

    if ext == ".py":
        try:
            return __import__(moduleName)
        except ImportError:
            return None
    else:
        print "Not a .py file:",fileName
        return None
#@nonl
#@-node:ekr.20040711061551:safeImportModule
#@-node:ekr.20040711043551:Docutils stuff
#@+node:ekr.20050106081120:Test of doTestRoutinesInModule
#@+node:ekr.20050106081120.1:test_dummy & dummyTestCase
def test_dummy():
    import leoGlobals as g
    g.trace()
    # raise SyntaxError

class dummyTestClass: # NOT a TestCase.
    def test_one (self):
        import leoGlobals as g
        g.trace(self)
#@nonl
#@-node:ekr.20050106081120.1:test_dummy & dummyTestCase
#@-node:ekr.20050106081120:Test of doTestRoutinesInModule
#@-others
#@nonl
#@-node:EKR.20040623200709:@thin leoTest.py
#@-leo
