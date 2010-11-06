#@+leo-ver=4-thin
#@+node:zorcanda!.20050912152224:@thin leoNodeToXML.py
import leoNodes
import leoGlobals as g
import string

class leoNodeToXML:
    
    def __init__( self, c ):
        self.c = c
        self.leo_file_encoding = c.config.new_leo_file_encoding 
        self.usingClipboard = False
        
    #@    @+others
    #@+node:zorcanda!.20050912152257:newPutLeoOutline
    def newPutLeoOutline( self, the_p ):
        
        
        self.assignFileIndices( the_p.copy() )
        import javax.xml.parsers as jparse
    
        dbf = jparse.DocumentBuilderFactory.newInstance()
        db = dbf.newDocumentBuilder()
        doc = db.newDocument()
    
        leo_file = doc.createElement( "leo_file" )
        doc.appendChild( leo_file )
    
        tnodes = 0 
        #c.clearAllVisited()
        for p in the_p.self_and_subtree_iter( copy = 1):
            t = p.v.t
            if t and not t.isWriteBit():
                t.setWriteBit()
                tnodes += 1
                
        header = doc.createElement( "leo_header" )
        leo_file.appendChild( header )
        header.setAttribute( "file_format", "1" )
        header.setAttribute( "tnodes", str( tnodes ) )
        header.setAttribute( "max_tnode_index", str( tnodes ) )
    
        #c.clearAllVisited()
        for p3 in the_p.self_and_subtree_iter( copy = 1 ):
            p3.v.clearVisited()
            p3.v.t.clearVisited()
            p3.v.t.clearWriteBit()
            
        vnodes = doc.createElement( "vnodes" )
        leo_file.appendChild( vnodes )
        for p in the_p.self_and_subtree_iter( copy = 1 ):
            self.putVnode2( p.copy(), ignored = False, doc = doc, vnode = vnodes )
    
        tnodes_element = doc.createElement( "tnodes" )
        leo_file.appendChild( tnodes_element )
        #if self.usingClipboard: # write the current tree.
        #theIter = c.currentPosition().self_and_subtree_iter()
        theIter = the_p.self_and_subtree_iter( copy = 1 )
        #else: # write everything
        #    theIter = c.allNodes_iter()
        
        tnodes = {}
    
        for p in theIter:
            index = p.v.t.fileIndex
            assert(index)
            tnodes[index] = p.v.t
    
        # Put all tnodes in index order.
        keys = tnodes.keys() ; keys.sort()
        for index in keys:
            # g.trace(index)
            t = tnodes.get(index)
            assert(t)
            # Write only those tnodes whose vnodes were written.
            if t.isWriteBit(): # 5/3/04
                #self.putTnode(t)
                t_element = doc.createElement( "t" )
                tnodes_element.appendChild( t_element )
                gnx = g.app.nodeIndices.toString(t.fileIndex)
                t_element.setAttribute( "tx", gnx )
                if t.bodyString:
                    s = t.bodyString
                    s = string.replace(s, '\r', '')
                    s = string.replace(s, '&', "&amp;")
                    s = string.replace(s, '<', "&lt;")
                    s = string.replace(s, '>', "&gt;")
                    t_element.setTextContent( s )
    
                
        import javax.xml.transform as transform
        tf = transform.TransformerFactory.newInstance()
        trans = tf.newTransformer()
        import javax.xml.transform.dom as tdom
        tsource = tdom.DOMSource( doc )
        import java.io as io
        sw = io.StringWriter()
        import javax.xml.transform.stream as sresult
        sr = sresult.StreamResult( sw )
        trans.transform( tsource, sr )
        data = sw.toString()
        return data
    
    
    # Writes a Leo outline to s in a format suitable for pasting to the clipboard.
    
    def putLeoOutline (self):
    
        self.outputList = [] ; self.outputFile = None
        self.usingClipboard = True
        self.assignFileIndices() # 6/11/03: Must do this for 3.x code.
        self.putProlog()
        self.putClipboardHeader()
        self.putVnodes()
        self.putTnodes()
        self.putPostlog()
        s = ''.join(self.outputList) # 1/8/04: convert the list to a string.
        self.outputList = []
        self.usingClipboard = False
        return s
    
    
    
    #@-node:zorcanda!.20050912152257:newPutLeoOutline
    #@+node:zorcanda!.20050912202104:assignFileIndices & compactFileIndices
    def assignFileIndices (self, p):
        
        """Assign a file index to all tnodes"""
        
        c = self.c ; nodeIndices = g.app.nodeIndices
    
        nodeIndices.setTimestamp() # This call is fairly expensive.
    
        # Assign missing gnx's, converting ints to gnx's.
        # Always assign an (immutable) index, even if the tnode is empty.
        for p2 in p.self_and_subtree_iter( copy = 1 ): #c.allNodes_iter():
            try: # Will fail for None or any pre 4.1 file index.
                theId,time,n = p2.v.t.fileIndex
            except TypeError:
                # Don't convert to string until the actual write.
                p2.v.t.fileIndex = nodeIndices.getNewIndex()
    
        if 0: # debugging:
            for p in c.allNodes_iter():
                g.trace(p.v.t.fileIndex)
    
    # Indices are now immutable, so there is no longer any difference between these two routines.
    compactFileIndices = assignFileIndices
    #@nonl
    #@-node:zorcanda!.20050912202104:assignFileIndices & compactFileIndices
    #@+node:zorcanda!.20050912153034:getVnode2
    def getVnode2( self,parent,back,skip,appendToCurrentStack,appendToTopStack, node ):
        
        c = self.c ; v = None
        setCurrent = setExpanded = setMarked = setOrphan = setTop = False
        tref = -1 ; headline = "" ; tnodeList = None ; attrDict = {} 
        
        #if node.hasAttribute( "C" ): pass
        #if node.hasAttribute( "D" ): pass
        if node.hasAttribute( "E" ): setExpanded = True
        if node.hasAttribute( "M" ): setMarked = True
        if node.hasAttribute( "O" ): setOrphan = True
        if node.hasAttribute( "T" ): setTop = True
        if node.hasAttribute( "V" ): setCurrent = True
    
        
        nl = node.getElementsByTagName( "vh" )
        vh = nl.item( 0 )
        headline = vh.getTextContent()    
        tref = node.getAttribute( "t" )
        vid = None
        if node.hasAttribute( "vid" ):
            vid = node.getAttribute( "vid" )
        if skip:
            v = self.getExistingVnode(tref,headline)
            if vid:
                v.vid = vid
                leoNodes.vid_vnode[ vid ] = v
        if v is None:
            v,skip2 = self.createVnode(parent,back,tref,headline,attrDict)
            if vid:
                v.vid = vid
                leoNodes.vid_vnode[ vid ] = v
            skip = skip or skip2
            if tnodeList:
                v.t.tnodeList = tnodeList # New for 4.0, 4.2: now in tnode.
        
        if setCurrent:
            self.currentVnodeStack = [v]
    
        if setTop:
            self.topVnodeStack = [v]
        
        if setExpanded:
            v.initExpandedBit()
        
        if setMarked:
            v.initMarkedBit() # 3/25/03: Do not call setMarkedBit here!
    
        if setOrphan:
            v.setOrphan()       
                
        parent = v ; back = None
        nchildren = node.getChildNodes()
        for z in xrange( nchildren.length ):
            #while self.matchTag("<v"):
            child = nchildren.item( z )
            if child.getNodeName() == "v":
                append1 = appendToCurrentStack and len(self.currentVnodeStack) == 0
                append2 = appendToTopStack and len(self.topVnodeStack) == 0
                back = self.getVnode2(parent,back,skip,
                    appendToCurrentStack=append1,appendToTopStack=append2, node = child)
                
        if not setCurrent and len(self.currentVnodeStack) > 0 and appendToCurrentStack:
            #g.trace("append current",v)
            self.currentVnodeStack.append(v)
        
        if not setTop and len(self.topVnodeStack) > 0 and appendToTopStack:
            #g.trace("append top",v)
            self.topVnodeStack.append(v)
            
        return v
    
    
    #@-node:zorcanda!.20050912153034:getVnode2
    #@+node:zorcanda!.20050912152326:getLeoOutline2 (from clipboard)
    # This method reads a Leo outline from string s in clipboard format.
    def getLeoOutline2 (self,s,reassignIndices=True):
    
        self.usingClipboard = True
        self.fileBuffer = s ; self.fileIndex = 0
        self.tnodesDict = {}
        self.descendentUnknownAttributesDictList = []
        
        #if not reassignIndices:
        if reassignIndices:
            #@        << recreate tnodesDict >>
            #@+node:zorcanda!.20050912152326.1:<< recreate tnodesDict >>
            nodeIndices = g.app.nodeIndices
            
            self.tnodesDict = {}
            
            for t in self.c.all_unique_tnodes_iter():
                tref = t.fileIndex
                if nodeIndices.isGnx(tref):
                    tref = nodeIndices.toString(tref)
                self.tnodesDict[tref] = t
                
            
                
            if 0:
                print '-'*40
                for key in self.tnodesDict.keys():
                    print key,self.tnodesDict[key]
            #@nonl
            #@-node:zorcanda!.20050912152326.1:<< recreate tnodesDict >>
            #@nl
    
        try:
            import org.xml.sax as sax
            import javax.xml.parsers as jparse
            import java.io as io
            #data = binascii.unhexlify( bdata )
            dbf = jparse.DocumentBuilderFactory.newInstance()
            db = dbf.newDocumentBuilder()
            sr = io.StringReader( s )
            ins = sax.InputSource( sr )
            doc = db.parse( ins )
            leo_file = doc.getDocumentElement()
            cnodes = leo_file.getChildNodes()
            elements = {}
            for z in xrange( cnodes.length ):
                element = cnodes.item( z )
                elements[ element.getNodeName() ] = element
            
            #vnodes = elements[ 'vnodes' ]
            #v = self.getVnodes2( vnodes, reassignIndices )
            #self.getXmlVersionTag() # leo.py 3.0
            #self.getXmlStylesheetTag() # 10/25/02
            #self.getTag("<leo_file>") # <leo_file/> is not valid.
            #self.getClipboardHeader()
            #self.getVnodes(reassignIndices)
            #self.getTnodes()
            #self.getTag("</leo_file>")
            tnodes_element = elements[ 'tnodes' ]
            tchildren = tnodes_element.getElementsByTagName( "t" )
            tnodes = {}
            for z in xrange( tchildren.length ):
                tnode_element = tchildren.item( z )
                tx = tnode_element.getAttribute( "tx" )
                atnode = self.newTnode( tx )
                atnode.bodyString = tnode_element.getTextContent()
                
                
            #v = self.finishPaste(reassignIndices)
            vnodes = elements[ 'vnodes' ]
            v = self.getVnodes2( vnodes, reassignIndices )
            
        except invalidPaste, ip:
            v = None
            g.es("Invalid Paste Retaining Clones",color="blue")
        except BadLeoFile, blf:
            v = None
            g.es("The clipboard is not valid ",color="blue")
        except java.lang.Exception, x:
            print x
            v = None
    
        # Clean up.
        self.fileBuffer = None ; self.fileIndex = 0
        self.usingClipboard = False
        self.tnodesDict = {}
        return v
    #@-node:zorcanda!.20050912152326:getLeoOutline2 (from clipboard)
    #@+node:zorcanda!.20050912153034.1:getVnode2
    def getVnode2( self,parent,back,skip,appendToCurrentStack,appendToTopStack, node ):
        
        c = self.c ; v = None
        setCurrent = setExpanded = setMarked = setOrphan = setTop = False
        tref = -1 ; headline = "" ; tnodeList = None ; attrDict = {} 
        
        #if node.hasAttribute( "C" ): pass
        #if node.hasAttribute( "D" ): pass
        if node.hasAttribute( "E" ): setExpanded = True
        if node.hasAttribute( "M" ): setMarked = True
        if node.hasAttribute( "O" ): setOrphan = True
        if node.hasAttribute( "T" ): setTop = True
        if node.hasAttribute( "V" ): setCurrent = True
    
        
        nl = node.getElementsByTagName( "vh" )
        vh = nl.item( 0 )
        headline = vh.getTextContent()    
        tref = node.getAttribute( "t" )
        vid = None
        if node.hasAttribute( "vid" ):
            vid = node.getAttribute( "vid" )
     
        if skip:
            v = self.getExistingVnode(tref,headline)
            if vid:
                v.vid = vid
                leoNodes.vid_vnode[ vid ] = v
        if v is None:
            if leoNodes.vid_vnode.has_key( vid ):
                v = leoNodes.vid_vnode[ vid ]
                skip = len(v.t.vnodeList) > 1
            else:
                v,skip2 = self.createVnode(parent,back,tref,headline,attrDict)
            if vid:
                v.vid = vid
                leoNodes.vid_vnode[ vid ] = v
            skip = skip or skip2
            if tnodeList:
                v.t.tnodeList = tnodeList # New for 4.0, 4.2: now in tnode.
        
    
        if setCurrent:
            self.currentVnodeStack = [v]
    
        if setTop:
            self.topVnodeStack = [v]
        
        if setExpanded:
            v.initExpandedBit()
        
        if setMarked:
            v.initMarkedBit() # 3/25/03: Do not call setMarkedBit here!
    
        if setOrphan:
            v.setOrphan()       
                
        parent = v ; back = None
        nchildren = node.getChildNodes()
        for z in xrange( nchildren.length ):
            #while self.matchTag("<v"):
            child = nchildren.item( z )
            if child.getNodeName() == "v":
                append1 = appendToCurrentStack and len(self.currentVnodeStack) == 0
                append2 = appendToTopStack and len(self.topVnodeStack) == 0
                back = self.getVnode2(parent,back,skip,
                    appendToCurrentStack=append1,appendToTopStack=append2, node = child)
                
        if not setCurrent and len(self.currentVnodeStack) > 0 and appendToCurrentStack:
            #g.trace("append current",v)
            self.currentVnodeStack.append(v)
        
        if not setTop and len(self.topVnodeStack) > 0 and appendToTopStack:
            #g.trace("append top",v)
            self.topVnodeStack.append(v)
            
        return v
    
    
    #@-node:zorcanda!.20050912153034.1:getVnode2
    #@+node:zorcanda!.20050912152416:getVnodes2
    def getVnodes2 (self, vnodes ,reassignIndices=True):
    
        c = self.c
    
        #if self.getOpenTag("<vnodes>"):
        #    return # <vnodes/> seen.
    
        self.forbiddenTnodes = []
        back = parent = None # This routine _must_ work on vnodes!
        self.currentVnodeStack = []
        self.topVnodeStack = []
            
        #if self.usingClipboard:
        #    oldRoot = c.rootPosition()
        #    oldCurrent = c.currentPosition()
        #    if not reassignIndices:
        #@    << set self.forbiddenTnodes to tnodes than must not be pasted >>
        #@+node:zorcanda!.20050912152416.1:<< set self.forbiddenTnodes to tnodes than must not be pasted >>
        #self.forbiddenTnodes = []
        
        #for p in oldCurrent.self_and_parents_iter():
        #    if p.v.t not in self.forbiddenTnodes:
        #        self.forbiddenTnodes.append(p.v.t)
                
        # g.trace("forbiddenTnodes",self.forbiddenTnodes)
        #@nonl
        #@-node:zorcanda!.20050912152416.1:<< set self.forbiddenTnodes to tnodes than must not be pasted >>
        #@nl
    
        vchildren = vnodes.getChildNodes()
        vs = []
        for x in xrange( vchildren.length ):
            child = vchildren.item( x )
            if child.getNodeName() == 'v':
                vs.append( child )
        
        #while self.matchTag("<v"):
        for z in vs:
            append1 = not self.usingClipboard and len(self.currentVnodeStack) == 0
            append2 = not self.usingClipboard and len(self.topVnodeStack) == 0
            back = self.getVnode2(parent,back,skip=False,
                appendToCurrentStack=append1,appendToTopStack=append2, node = z)
    
        #if self.usingClipboard:
        #    # Link in the pasted nodes after the current position.
        #    newRoot = c.rootPosition()
        #    #c.setRootPosition(oldRoot)
        #    newRoot.v.linkAfter(oldCurrent.v)
        #    newCurrent = oldCurrent.copy()
        #    newCurrent.v = newRoot.v
        #    #c.setCurrentPosition(newCurrent)
        #else:
            #@        << set current and top positions >>
            #@+node:zorcanda!.20050912152416.2:<< set current and top positions >>
            #current = self.convertStackToPosition(self.currentVnodeStack)
            #if current:
            #    c.setCurrentPosition(current)
            #else:
            #    # g.trace(self.currentVnodeStack)
            #    c.setCurrentPosition(c.rootPosition())
                
            # At present this is useless: the drawing code doesn't set the top position properly.
            #top = self.convertStackToPosition(self.topVnodeStack)
            #if top:
            #    c.setTopPosition(top)
            #@nonl
            #@-node:zorcanda!.20050912152416.2:<< set current and top positions >>
            #@nl
            
        pos = leoNodes.position( back, [] )
        #self.getTag("</vnodes>")
        return pos
    #@nonl
    #@-node:zorcanda!.20050912152416:getVnodes2
    #@+node:zorcanda!.20050912152353:finishPaste
    def finishPaste(self,reassignIndices=True):
        
        """Finish pasting an outline from the clipboard.
        
        Retain clone links if reassignIndices is False."""
    
        c = self.c
        current = c.currentPosition()
        #c.beginUpdate()
        #if reassignIndices:
            #@        << reassign tnode indices >>
            #@+node:zorcanda!.20050912152353.1:<< reassign tnode indices >>
            #@+at 
            #@nonl
            # putLeoOutline calls assignFileIndices (when copying nodes) so 
            # that vnode can be associated with tnodes.
            # However, we must _reassign_ the indices here so that no "False 
            # clones" are created.
            #@-at
            #@@c
            
            #current.clearVisitedInTree()
            
            #for p in current.self_and_subtree_iter():
            #    t = p.v.t
            #    if not t.isVisited():
            #        t.setVisited()
            #        self.maxTnodeIndex += 1
            #        t.setFileIndex(self.maxTnodeIndex)
            #@nonl
            #@-node:zorcanda!.20050912152353.1:<< reassign tnode indices >>
            #@nl
        #c.selectVnode(current)
        #c.endUpdate()
        return current
    #@nonl
    #@-node:zorcanda!.20050912152353:finishPaste
    #@+node:zorcanda!.20050912153216:createVnode (changed for 4.2) sets skip
    def createVnode (self,parent,back,tref,headline,attrDict):
        
        # g.trace(parent,headline)
        v = None ; c = self.c
        # Shared tnodes are placed in the file even if empty.
        if tref == -1:
            t = leoNodes.tnode()
        else:
            tref = self.canonicalTnodeIndex(tref)
            t = self.tnodesDict.get(tref)
            if not t: t = self.newTnode(tref)
        if back: # create v after back.
            v = back.insertAfter(t)
        elif parent: # create v as the parent's first child.
            v = parent.insertAsNthChild(0,t)
        else: # create a root vnode
            v = leoNodes.vnode(c,t)
            #v.moveToRoot()
        
        if v not in v.t.vnodeList:
            v.t.vnodeList.append(v) # New in 4.2.
    
        skip = len(v.t.vnodeList) > 1
        v.initHeadString(headline,encoding=self.leo_file_encoding)
    
        #@    << handle unknown vnode attributes >>
        #@+node:zorcanda!.20050912153216.1:<< handle unknown vnode attributes >>
        keys = attrDict.keys()
        if keys:
            v.unknownAttributes = attrDict
        
            if 0: # For debugging.
                s = "unknown attributes for " + v.headString()
                print s ; g.es(s,color="blue")
                for key in keys:
                    s = "%s = %s" % (key,attrDict.get(key))
                    print s ; g.es(s)
        #@nonl
        #@-node:zorcanda!.20050912153216.1:<< handle unknown vnode attributes >>
        #@nl
        # g.trace(skip,tref,v,v.t,len(v.t.vnodeList))
        return v,skip
    #@nonl
    #@-node:zorcanda!.20050912153216:createVnode (changed for 4.2) sets skip
    #@+node:zorcanda!.20050913134122:getExistingVnode
    def getExistingVnode (self,tref,headline):
    
        tref1 = tref
        assert(tref > -1)
        tref = self.canonicalTnodeIndex(tref)
        t = self.tnodesDict.get(tref)
        try:
            return t.vnodeList[0]
        except (IndexError,AttributeError):
            g.es("Missing vnode:",headline,color="red")
            g.es("Probably an outline topology error.")
            # g.trace(tref1,t,t.vnodeList)
            return None
    #@nonl
    #@-node:zorcanda!.20050913134122:getExistingVnode
    #@+node:zorcanda!.20050912202928:newTnode
    def newTnode(self,index):
    
        if self.tnodesDict.has_key(index):
            #g.es("bad tnode index: %s. Using empty text." % str(index))
            return leoNodes.tnode()
        else:
            # Create the tnode.  Use the _original_ index as the key in tnodesDict.
            t = leoNodes.tnode()
            self.tnodesDict[index] = t
        
            if type(index) not in (type(""),type(u"")):
                g.es("newTnode: unexpected index type:",type(index),index,color="red")
            
            # Convert any pre-4.1 index to a gnx.
            theId,time,n = gnx = g.app.nodeIndices.scanGnx(index,0)
            if time != None:
                t.setFileIndex(gnx)
    
            return t
    #@nonl
    #@-node:zorcanda!.20050912202928:newTnode
    #@+node:zorcanda!.20050912153347:canonicalTnodeIndex
    def canonicalTnodeIndex(self,index):
        
        """Convert Tnnn to nnn, leaving gnx's unchanged."""
    
        # index might be Tnnn, nnn, or gnx.
        theId,time,n = g.app.nodeIndices.scanGnx(index,0)
        if time == None: # A pre-4.1 file index.
            if index[0] == "T":
                index = index[1:]
    
        return index
    #@nonl
    #@-node:zorcanda!.20050912153347:canonicalTnodeIndex
    #@+node:zorcanda!.20050912154148:putVnode (3.x and 4.x)
    def putVnode2 (self,p,ignored, doc, vnode ):
    
        """Write a <v> element corresponding to a vnode."""
    
        #print "PV2"
        fc = self ; #c = fc.c ; 
        op = p
        v = p.v
        isThin = p.isAtThinFileNode() 
        isIgnore = False
        if 0: # Wrong: must check all parents.
            ignored = ignored or p.isAtIgnoreNode()
        else:
            for p2 in p.self_and_parents_iter( copy = 1):
                if p2.isAtIgnoreNode():
                    isIgnore = True ; break
        isOrphan = p.isOrphan()
        forceWrite = isIgnore or not isThin or (isThin and isOrphan)
    
    
        v_element = doc.createElement( "v" )
        v_element.setAttribute( "vid", v.vid )
        vnode.appendChild( v_element )
        #ws = doc.createTextNode( "\n%s" % indent )
        #vnode.appendChild( ws )
        #fc.put("<v")
        #@    << Put tnode index >>
        #@+node:zorcanda!.20050912154148.1:<< Put tnode index >>
        if v.t.fileIndex:
            gnx = g.app.nodeIndices.toString(v.t.fileIndex)
            #fc.put(" t=") ; fc.put_in_dquotes(gnx)
            v_element.setAttribute( "t", gnx )
        
            # g.trace(v.t)
            if forceWrite or self.usingClipboard:
                v.t.setWriteBit() # 4.2: Indicate we wrote the body text.
        else:
            g.trace(v.t.fileIndex,v)
            g.es("error writing file(bad v.t.fileIndex)!")
            g.es("try using the Save To command")
        #@nonl
        #@-node:zorcanda!.20050912154148.1:<< Put tnode index >>
        #@nl
        #@    << Put attribute bits >>
        #@+node:zorcanda!.20050912154148.2:<< Put attribute bits >>
        attr = ""
        if p.v.isExpanded(): attr += "E"
        if p.v.isMarked():   attr += "M"
        if p.v.isOrphan():   attr += "O"
        
        if 1: # No longer a bottleneck now that we use p.equal rather than p.__cmp__
            # Almost 30% of the entire writing time came from here!!!
            if p.equal( op ):   attr += "T" # was a bottleneck
            #if c.isCurrentPosition(p):      attr += "V" # was a bottleneck
        
        #if attr: fc.put(' a="%s"' % attr)
        if attr:
            v_element.setAttribute( "a", attr )
            
            
        #@-node:zorcanda!.20050912154148.2:<< Put attribute bits >>
        #@nl
        #@    << Put tnodeList and unKnownAttributes >>
        #@+node:zorcanda!.20050912154148.3:<< Put tnodeList and unKnownAttributes >>
        #@+at
        # # Write the tnodeList only for @file nodes.
        # # New in 4.2: tnode list is in tnode.
        # 
        # if 0: # Debugging.
        #     if v.isAnyAtFileNode():
        #         if hasattr(v.t,"tnodeList"):
        #             g.trace(v.headString(),len(v.t.tnodeList))
        #         else:
        #             g.trace(v.headString(),"no tnodeList")
        # 
        # if hasattr(v.t,"tnodeList") and len(v.t.tnodeList) > 0 and 
        # v.isAnyAtFileNode():
        #     if isThin:
        #         if g.app.unitTesting:
        #             g.app.unitTestDict["warning"] = True
        #         g.es("deleting tnode list for %s" % 
        # p.headString(),color="blue")
        #         # This is safe: cloning can't change the type of this node!
        #         delattr(v.t,"tnodeList")
        #     else:
        #         fc.putTnodeList(v) # New in 4.0
        # 
        # if hasattr(v,"unknownAttributes"): # New in 4.0
        #     self.putUnknownAttributes(v)
        # if p.hasChildren() and not forceWrite and not self.usingClipboard:
        #     # We put the entire tree when using the clipboard, so no need 
        # for this.
        #     self.putDescendentUnknownAttributes(p)
        #     self.putDescendentAttributes(p)
        #@-at
        #@nonl
        #@-node:zorcanda!.20050912154148.3:<< Put tnodeList and unKnownAttributes >>
        #@nl
        #fc.put(">")
        #@    << Write the head text >>
        #@+node:zorcanda!.20050912154148.4:<< Write the head text >>
        headString = p.v.headString()
        
        if headString:
            vh = doc.createElement( "vh" )
            v_element.appendChild( vh )
            vh.setTextContent( headString )
                
            #fc.put("<vh>")
            #fc.putEscapedString(headString)
            #fc.put("</vh>")
        #@-node:zorcanda!.20050912154148.4:<< Write the head text >>
        #@nl
    
        #if not self.usingClipboard:
        #    
        #@nonl
        #@<< issue informational messages >>
        #@+node:zorcanda!.20050912154148.5:<< issue informational messages >>
        if p.isAtThinFileNode and p.isOrphan():
            g.es("Writing erroneous: %s" % p.headString(),color="blue")
            p.clearOrphan()
        
        if 0: # For testing.
            if p.isAtIgnoreNode():
                 for p2 in p.self_and_subtree_iter():
                        if p2.isAtThinFileNode():
                            g.es("Writing @ignore'd: %s" % p2.headString(),color="blue")
        #@nonl
        #@-node:zorcanda!.20050912154148.5:<< issue informational messages >>
        #@nl
    
        # New in 4.2: don't write child nodes of @file-thin trees (except when writing to clipboard)
    
        if p.hasChildren():
            #fc.put_nl()
            # This optimization eliminates all "recursive" copies.
            p.moveToFirstChild()
            while 1:
                fc.putVnode2(p,ignored, doc, v_element )
                if p.hasNext(): p.moveToNext()
                else:           break
            p.moveToParent()
                
    
        #fc.put("</v>") ; fc.put_nl()
    #@nonl
    #@-node:zorcanda!.20050912154148:putVnode (3.x and 4.x)
    #@-others
    
#@-node:zorcanda!.20050912152224:@thin leoNodeToXML.py
#@-leo
