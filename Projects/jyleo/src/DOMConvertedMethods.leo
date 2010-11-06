<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet ekr_stylesheet?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="31" clone_windows="0"/>
<globals body_outline_ratio="0.5">
	<global_window_position top="26" left="0" height="649" width="1018"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="zorcanda!.20050915130443" a="E"><vh>methods from leoFileCommands.py</vh>
<v t="zorcanda!.20050915130443.1"><vh>reading with dom...</vh>
<v t="zorcanda!.20050915130443.2" a="E"><vh>getLeoFile2</vh>
<v t="zorcanda!.20050915130443.3"><vh>&lt;&lt; read leo header &gt;&gt;</vh></v>
<v t="zorcanda!.20050915130443.4"><vh>&lt;&lt; read globals &gt;&gt;</vh></v>
<v t="zorcanda!.20050915130443.5"><vh>&lt;&lt; read prefs &gt;&gt;</vh></v>
<v t="zorcanda!.20050915130443.6"><vh>&lt;&lt; read find panel settings &gt;&gt;</vh></v>
<v t="zorcanda!.20050915130443.7"><vh>&lt;&lt; build tnodes &gt;&gt;</vh></v>
<v t="zorcanda!.20050915130443.8"><vh>&lt;&lt; build vnodes &gt;&gt;</vh></v>
<v t="zorcanda!.20050915130443.9"><vh>&lt;&lt; expand nodes &gt;&gt;</vh></v>
</v>
<v t="zorcanda!.20050915130443.10"><vh>getVnode2</vh></v>
</v>
<v t="zorcanda!.20050915130443.11" a="TV"><vh>writing with dom...</vh>
<v t="zorcanda!.20050915130443.12" a="E"><vh>write_Leo_file</vh>
<v t="zorcanda!.20050915130443.13"><vh>&lt;&lt; write all @file nodes &gt;&gt;</vh></v>
<v t="zorcanda!.20050915130443.14"><vh>&lt;&lt; return if the .leo file is read-only &gt;&gt;</vh></v>
<v t="zorcanda!.20050915130443.15"><vh>&lt;&lt; create backup file &gt;&gt;</vh></v>
<v t="zorcanda!.20050915130443.16"><vh>&lt;&lt; put the .leo file &gt;&gt;</vh></v>
<v t="zorcanda!.20050915130443.17"><vh>&lt;&lt; delete backup file &gt;&gt;</vh></v>
<v t="zorcanda!.20050915130443.18"><vh>&lt;&lt; delete fileName &gt;&gt;</vh></v>
<v t="zorcanda!.20050915130443.19"><vh>&lt;&lt; rename backupName to fileName &gt;&gt;</vh></v>
</v>
<v t="zorcanda!.20050915130443.20" a="EM"><vh>putVnode2 (3.x and 4.x)</vh>
<v t="zorcanda!.20050915130443.21" a="M"><vh>&lt;&lt; Put tnode index &gt;&gt;</vh></v>
<v t="zorcanda!.20050915130443.22"><vh>&lt;&lt; Put attribute bits &gt;&gt;</vh></v>
<v t="zorcanda!.20050915130443.23"><vh>&lt;&lt; Put tnodeList and unKnownAttributes &gt;&gt;</vh></v>
<v t="zorcanda!.20050915130443.24"><vh>&lt;&lt; Write the head text &gt;&gt;</vh></v>
<v t="zorcanda!.20050915130443.25"><vh>&lt;&lt; issue informational messages &gt;&gt;</vh></v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="zorcanda!.20050915130443">@others
</t>
<t tx="zorcanda!.20050915130443.1">@others
</t>
<t tx="zorcanda!.20050915130443.2">def getLeoFile( self,fileName,readAtFileNodesFlag=True ):
    
    c = self.c
    self.mFileName = c.mFileName
    self.tnodesDict = {}
    self.descendentExpandedList = []
    self.descendentMarksList = []
    self.descendentUnknownAttributesDictList = []
    leoNodes.vid_vnode = {}
    import javax.xml.parsers as jparse
    import java.io as io
    import java
    start = java.lang.System.currentTimeMillis()
    c.loading = True
    try:
        dbf = jparse.DocumentBuilderFactory.newInstance()
        db = dbf.newDocumentBuilder()
        fis = io.FileInputStream( fileName )
        doc = db.parse( fis )
        fis.close()
        doc.normalizeDocument()
        leo_file = doc.getDocumentElement()
        #print leo_file.getTextContent()
        cnodes = leo_file.getChildNodes()
        elements = {}
        for z in xrange( cnodes.length ):
            element = cnodes.item( z )
            elements[ element.getNodeName() ] = element
        
        #c.beginUpdate() 
        &lt;&lt; read leo header &gt;&gt;
        &lt;&lt; read globals &gt;&gt;
        &lt;&lt; read prefs &gt;&gt;
        &lt;&lt; read find panel settings &gt;&gt;
        &lt;&lt; build tnodes &gt;&gt;
        &lt;&lt; build vnodes &gt;&gt;

        current = self.convertStackToPosition(self.currentVnodeStack)
        if current:
            c.setCurrentPosition(current)
        else:
            # g.trace(self.currentVnodeStack)
            c.setCurrentPosition(c.rootPosition())
    
        # At present this is useless: the drawing code doesn't set the top position properly.
        top = self.convertStackToPosition(self.topVnodeStack)
        if top:
            c.setTopPosition(top)
        
        #if elements.has_key( "data" ):
        #    g.doHook( "read-leo-file-data", c=c, delement = elements[ 'data' ], doc = doc )
        ok = 1
        self.ratio = 1.5
    except java.lang.Exception, x:
        print x
        print "WHATDA!!!"
        ok = 0
        self.ratio = 1.5
        pass
    
    
    if ok and readAtFileNodesFlag:
        c.atFileCommands.readAll(c.rootVnode(),partialFlag=False)

    if not c.currentPosition():
        print c.rootPosition()
        c.setCurrentPosition(c.rootPosition())
        
    if elements.has_key( "data" ):
        g.doHook( "read-leo-file-data", c=c, delement = elements[ 'data' ], doc = doc )

    c.selectVnode(c.currentPosition()) # load body pane
    c.loading = False # reenable c.changed
    c.setChanged(c.changed) # Refresh the changed marker.
    self.descendentUnknownAttributesDictList = []
    self.descendentExpandedList = []
    self.descendentMarksList = []
    self.tnodesDict = {}
    &lt;&lt; expand nodes &gt;&gt;
    end = java.lang.System.currentTimeMillis()
    print "TOTAL TIME %s" % ( end - start )
    print "READ FOR %s" % fileName
    return ok, self.ratio

</t>
<t tx="zorcanda!.20050915130443.3">self.maxTnodeIndex = 0
self.numberOfTnodes = 0
leo_header = elements[ 'leo_header' ]
if leo_header.hasAttribute( "file_format" ): self.fileFormatNumber = int( leo_header.getAttribute( "file_format" ) )
if leo_header.hasAttribute( "tnodes" ): self.numberOfTnodes = int( leo_header.getAttribute( "tnodes" ) )
if leo_header.hasAttribute( "max_tnode_index" ): self.maxTnodeIndex = int( leo_header.getAttribute( "max_tnode_index" ) )
#if leo_header.hasAttribute( "clone_windows" ): pass

</t>
<t tx="zorcanda!.20050915130443.4">globals = elements[ 'globals' ]
self.ratio = None
y,x,h,w = None, None, None, None
if globals.hasAttribute( "body_outline_ratio" ):
    self.ratio = float( globals.getAttribute( "body_outline_ratio" ) )

gwp = globals.getElementsByTagName( "global_window_position" )
if gwp.length:
    gwp = gwp.item( 0 )
    w = int( gwp.getAttribute( "width" ) )
    h = int( gwp.getAttribute( "height" ) )
    x = int( gwp.getAttribute( "left" ) )
    y = int( gwp.getAttribute( "top" ) )



if self.ratio == None: self.ratio = 0.5
if y == None: y,x,h,w = 50,50,500,700
self.frame.setTopGeometry(w,h,x,y)
self.frame.deiconify()
self.frame.lift()
self.frame.update()

</t>
<t tx="zorcanda!.20050915130443.5"></t>
<t tx="zorcanda!.20050915130443.6">fp_element = elements[ 'find_panel_settings' ]



@
    if self.getOpenTag("&lt;find_panel_settings"):
        return # &lt;find_panel_settings/&gt; seen.
    # New in 4.3: ignore all pre-4.3 find settings.
    while 1:
        if   self.matchTag("batch="):           self.getDqBool()
        elif self.matchTag("ignore_case="):     self.getDqBool()
        elif self.matchTag("mark_changes="):    self.getDqBool()
        elif self.matchTag("mark_finds="):      self.getDqBool()
        elif self.matchTag("node_only="):       self.getDqBool()
        elif self.matchTag("pattern_match="):   self.getDqBool()
        elif self.matchTag("reverse="):         self.getDqBool()
        elif self.matchTag("script_change="):   self.getDqBool()
        elif self.matchTag("script_search="):   self.getDqBool()
        elif self.matchTag("search_headline="): self.getDqBool()
        elif self.matchTag("search_body="):     self.getDqBool()
        elif self.matchTag("selection_only="):  self.getDqBool()
        elif self.matchTag("suboutline_only="): self.getDqBool()
        elif self.matchTag("whole_word="):      self.getDqBool()
        elif self.matchTag("wrap="):            self.getDqBool()
        elif self.matchTag("&gt;"): break
        else: self.getUnknownTag() # Ignore all other tags.
    # Allow only &lt;find_string&gt; or &lt;find_string/&gt;
    if self.getOpenTag("&lt;find_string&gt;"):
        pass
    else:
        self.getEscapedString() ; self.getTag("&lt;/find_string&gt;")
    # Allow only &lt;change_string&gt; or &lt;change_string/&gt;
    if self.getOpenTag("&lt;change_string&gt;"):
        pass
    else:
        self.getEscapedString() ; self.getTag("&lt;/change_string&gt;")
    self.getTag("&lt;/find_panel_settings&gt;")</t>
<t tx="zorcanda!.20050915130443.7">tnodes_element = elements[ 'tnodes' ]
tchildren = tnodes_element.getElementsByTagName( "t" )
tnodes = {}
for z in xrange( tchildren.length ):
    tnode_element = tchildren.item( z )
    tx = tnode_element.getAttribute( "tx" )
    atnode = self.newTnode( tx )
    atnode.bodyString = tnode_element.getTextContent()
    tatts = tnode_element.getAttributes()
    tatts.removeNamedItem( "tx" )
    if tatts.length:
        atnode.unknownAttributes = {}
        for z2 in xrange( tatts.length ):
            tatt = tatts.item( z2 )
            tname = tatt.getNodeName()
            val = tatt.getNodeValue()
            try:
                binString = binascii.unhexlify(val)
                val2 = pickle.loads(binString)
                atnode.unknownAttributes[ tname ] = val2
            except:
                atnode.unknownAttributes[ tname ] = val
                

</t>
<t tx="zorcanda!.20050915130443.8">vnodes_elements = elements[ 'vnodes' ]
cnodes = vnodes_elements.getChildNodes()
vnodes = []
for z in xrange( cnodes.length ):
    item = cnodes.item( z )
    if item.getNodeName() == "v":
        vnodes.append( item )
    
back = parent = None # This routine _must_ work on vnodes!
self.currentVnodeStack = []
self.topVnodeStack = []

for _vnode in vnodes:
    vh = _vnode.getElementsByTagName( "vh" )
    append1 = len(self.currentVnodeStack) == 0
    append2 = len(self.topVnodeStack) == 0
    back = self.getVnode2(parent,back,skip=False,
            appendToCurrentStack=append1,appendToTopStack=append2, node = _vnode)
</t>
<t tx="zorcanda!.20050915130443.9">marks = {} ; expanded = {}
for gnx in self.descendentExpandedList:
    #print gnx
    t = self.tnodesDict.get(gnx)
    if t: 
        expanded[t]=t

expandset = java.util.HashSet()
#print "EXPANDING!!!"
for p in c.all_positions_iter():
    #if marks.get(p.v.t):
    #    p.v.initMarkedBit()
    #    #expandset.add( p.copy() )
    #    # This was the problem: was p.setMark.
    #    # There was a big performance bug in the mark hook in the Node Navigator plugin.
    if p.isExpanded(): #CHANGED: added since there are 2 mechanisms in place
        expandset.add( p.copy() )
        #print "ADD1 %s" % p
        #    #apparently there are 2 mechanisms in place to expand a position-vnode-tnode
        #    #One happens in the getVnode method, actually both happen, one is done via a method
        #    #call the other is done by inclusion in a list.  Quite maddening! :D
        #    tree = self.c.frame.tree
        #    if hasattr( tree, 'tree_reloader' ):
        #        tree.tree_reloader.expand( p.copy() )
    if expanded.get(p.v.t):
        #tree = self.c.frame.tree
        #if hasattr( tree, 'tree_reloader' ):
        #    tree.tree_reloader.expand( p.copy() ) #CHANGED: so the tree will register outlines already open
        p.expand()
        #print "ADD2 %s" % p
        expandset.add( p.copy() )
if hasattr( c.frame.tree, "tree_reloader" ):
    c.frame.tree.tree_reloader.addExpandedSet( expandset )
            </t>
<t tx="zorcanda!.20050915130443.10">def getVnode2( self,parent,back,skip,appendToCurrentStack,appendToTopStack, node ): #node is the &lt;v&gt; element.
    
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
    vid = tref
    #if node.hasAttribute( "vid" ):
    #    vid = node.getAttribute( "vid" )
 
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
    
    if v:
        atts = node.getAttributes()
        v.unknownAttributes = {}
        for x in xrange( atts.length ):
            item = atts.item( x )
            name = item.getNodeName()
            if name == 'vid' or name == 't': continue
            value = item.getNodeValue()
            try:
                binString = binascii.unhexlify(value)
                val2 = pickle.loads(binString)
                v.unknownAttributes[ name ] = val2
            except:
                v.unknownAttributes[ name ] = value
            
    
    
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
        #while self.matchTag("&lt;v"):
        child = nchildren.item( z )
        if child.getNodeName() == "v":
            append1 = appendToCurrentStack and len(self.currentVnodeStack) == 0
            append2 = appendToTopStack and len(self.topVnodeStack) == 0
            back = self.getVnode2(parent,back,skip,
                appendToCurrentStack=append1,appendToTopStack=append2, node = child)
            
    if not setCurrent and len(self.currentVnodeStack) &gt; 0 and appendToCurrentStack:
        #g.trace("append current",v)
        self.currentVnodeStack.append(v)
    
    if not setTop and len(self.topVnodeStack) &gt; 0 and appendToTopStack:
        #g.trace("append top",v)
        self.topVnodeStack.append(v)
        
    return v


</t>
<t tx="zorcanda!.20050915130443.11">@
In write_Leo_file, I believe the main change is in the 'put the .lef file' node.  Its really one long section that was a series of calls to methods in leoFileCommands.

putVnode2... a converted putVnode
@c



@others
</t>
<t tx="zorcanda!.20050915130443.12">def write_Leo_file(self,fileName,outlineOnlyFlag):

    c = self.c
    self.assignFileIndices()
    if not outlineOnlyFlag:
        # Update .leoRecentFiles.txt if possible.
        g.app.config.writeRecentFilesFile(c)  
        &lt;&lt; write all @file nodes &gt;&gt;
    &lt;&lt; return if the .leo file is read-only &gt;&gt;
    try:
        theActualFile = None
        &lt;&lt; create backup file &gt;&gt;
        self.mFileName = fileName
        self.outputFile = cStringIO.StringIO() # or g.fileLikeObject()
        theActualFile = open(fileName, 'wb')
        &lt;&lt; put the .leo file &gt;&gt;
        #theActualFile.write(self.outputFile.getvalue())
        theActualFile.write( data )
        theActualFile.close()
        self.outputFile = None
        &lt;&lt; delete backup file &gt;&gt;
        return True
    except Exception:
        g.es("exception writing: " + fileName)
        g.es_exception(full=False)
        if theActualFile: theActualFile.close()
        self.outputFile = None
        &lt;&lt; delete fileName &gt;&gt;
        &lt;&lt; rename backupName to fileName &gt;&gt;
        return False

write_LEO_file = write_Leo_file # For compatibility with old plugins.</t>
<t tx="zorcanda!.20050915130443.13">try:
    # Write all @file nodes and set orphan bits.
    c.atFileCommands.writeAll()
except Exception:
    g.es_error("exception writing derived files")
    g.es_exception()
    return False</t>
<t tx="zorcanda!.20050915130443.14"># self.read_only is not valid for Save As and Save To commands.

if g.os_path_exists(fileName):
    try:
        if not os.access(fileName,os.W_OK):
            g.es("can not create: read only: " + fileName,color="red")
            return False
    except:
        pass # os.access() may not exist on all platforms.</t>
<t tx="zorcanda!.20050915130443.15"># rename fileName to fileName.bak if fileName exists.
if g.os_path_exists(fileName):
    backupName = g.os_path_join(g.app.loadDir,fileName)
    backupName = fileName + ".bak"
    if g.os_path_exists(backupName):
        g.utils_remove(backupName)
    ok = g.utils_rename(fileName,backupName)
    if not ok:
        if self.read_only:
            g.es("read only",color="red")
        return False
else:
    backupName = None</t>
<t tx="zorcanda!.20050915130443.16">import javax.xml.parsers as jparse

dbf = jparse.DocumentBuilderFactory.newInstance()
db = dbf.newDocumentBuilder()
doc = db.newDocument()
def nl( element, doc = doc, indent = 0 ):
    if indent:
        wsi = " " * indent
    else:
        wsi = ""
    tn = doc.createTextNode( "\n%s" % wsi  )
    element.appendChild( tn )
    
#de = doc.getDocumentElement()
#nl( de )
leo_file = doc.createElement( "leo_file" )
#nl( doc )
doc.appendChild( leo_file )
nl( leo_file, indent = 4 )

tnodes = 0 ; clone_windows = 0 
header = doc.createElement( "leo_header" )
leo_file.appendChild( header )
nl( leo_file )
header.setAttribute( "file_format", "2" )
header.setAttribute( "tnodes", str( tnodes ) )
header.setAttribute( "max_tnode_index", str( self.maxTnodeIndex ) )
header.setAttribute( "clone_windows", str( clone_windows ) )


globals = doc.createElement( "globals" )
nl( globals )
nl( leo_file, indent = 4 )
leo_file.appendChild( globals )
globals.setAttribute( "body_outline_ratio", str( c.frame.ratio ) )

global_window_position = doc.createElement( "global_window_position" )
globals.appendChild( global_window_position )
width,height,left,top = c.frame.get_window_info()
global_window_position.setAttribute( "top", str( top ) )
global_window_position.setAttribute( "left", str( left ) )
global_window_position.setAttribute( "height", str( height ) )
global_window_position.setAttribute( "width", str( width ) )

nl( globals )
top = left = height = width = 0 # no longer used
global_log_window_position = doc.createElement( "global_log_window_position" )
globals.appendChild( global_log_window_position )
global_log_window_position.setAttribute( "top", str( top ) )
global_log_window_position.setAttribute( "left", str( left ) )
global_log_window_position.setAttribute( "height", str( height ) )
global_log_window_position.setAttribute( "width", str( width ) )

preferences = doc.createElement( "preferences" )
nl( leo_file )
leo_file.appendChild( preferences )

find_panel_settings = doc.createElement( "find_panel_settings" )
nl( leo_file )
leo_file.appendChild( find_panel_settings )
data = doc.createElement( "data" ) #here the general data area where Im putting the pickled undo manager is created
nl( leo_file )
leo_file.appendChild( data )


c.clearAllVisited()
vnodes = doc.createElement( "vnodes" )
nl( leo_file )
leo_file.appendChild( vnodes )
nl( leo_file )
self.currentPosition = c.currentPosition() 
self.topPosition     = c.topPosition()
for p in c.rootPosition().self_and_siblings_iter():
    self.putVnode2( p, ignored = False, doc = doc, vnode = vnodes )
    


tnodes_element = doc.createElement( "tnodes" )
nl( leo_file )
leo_file.appendChild( tnodes_element )
nl( leo_file )
if self.usingClipboard: # write the current tree.
    theIter = c.currentPosition().self_and_subtree_iter()
else: # write everything
    theIter = c.allNodes_iter()
    
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
        nl( tnodes_element )
        tnodes_element.appendChild( t_element )
        gnx = g.app.nodeIndices.toString(t.fileIndex)
        t_element.setAttribute( "tx", gnx )
        if t.bodyString:
            t_element.setTextContent( self.xmlEscape( t.bodyString ) )
        if hasattr( t, 'unknownAttributes' ):
            uAs = t.unknownAttributes
            for key in uAs.keys():
                val = uAs[ key ]
                try:
                    if hasattr( val, 'getPickleProxy' ):
                        val = val.getPickleProxy()
                    try:
                        # Protocol argument is new in Python 2.3
                        # Use protocol 1 for compatibility with bin.
                        s = pickle.dumps(val,protocol=1)
                    except TypeError:
                        s = pickle.dumps(val,bin=True)
                    #key,binascii.hexlify(s)
                    t_element.setAttribute( key, binascii.hexlify( s ) )
                except:
                    g.es("ignoring non-pickleable attribute %s in %s" % (key, t ),color="blue")

nl( tnodes_element )

g.doHook( "write-leo-file-data", c = c, delement = data, doc = doc ) #I notify listeners so they can add data to the &lt;data&gt; element... should it be hidden behind a class?
            
import javax.xml.transform as transform
import javax.xml.transform.dom as tdom
import java.io as io
import javax.xml.transform.stream as sresult
tf = transform.TransformerFactory.newInstance()
trans = tf.newTransformer()
tsource = tdom.DOMSource( doc )
sw = io.StringWriter()
sr = sresult.StreamResult( sw )
trans.transform( tsource, sr )
data = sw.toString()



@
if self.usingClipboard: # write the current tree.
    theIter = c.currentPosition().self_and_subtree_iter()
else: # write everything
    theIter = c.allNodes_iter()

# Populate tnodes
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
        self.putTnode(t)




@
self.putProlog()
self.putHeader()
self.putGlobals()
self.putPrefs()
self.putFindSettings()
#start = g.getTime()
self.putVnodes()
#start = g.printDiffTime("vnodes ",start)
self.putTnodes()
#start = g.printDiffTime("tnodes ",start)
self.putPostlog()


</t>
<t tx="zorcanda!.20050915130443.17">if backupName and g.os_path_exists(backupName):

    self.deleteFileWithMessage(backupName,'backup')</t>
<t tx="zorcanda!.20050915130443.18">if fileName and g.os_path_exists(fileName):
    self.deleteFileWithMessage(fileName,'')
</t>
<t tx="zorcanda!.20050915130443.19">if backupName:
    g.es("restoring " + fileName + " from " + backupName)
    g.utils_rename(backupName,fileName)</t>
<t tx="zorcanda!.20050915130443.20">def putVnode2 (self,p,ignored, doc, vnode ): #doc is the document from which we create elements for the doc.  'doc' probably should be just an attribute of the leoFileCommands instance.  vnode is the 'v' element, its passed so we can append to it.

    """Write a &lt;v&gt; element corresponding to a vnode."""

    fc = self ; c = fc.c ; v = p.v
    isThin = p.isAtThinFileNode()
    isIgnore = False
    if 0: # Wrong: must check all parents.
        ignored = ignored or p.isAtIgnoreNode()
    else:
        for p2 in p.self_and_parents_iter():
            if p2.isAtIgnoreNode():
                isIgnore = True ; break
    isOrphan = p.isOrphan()
    forceWrite = isIgnore or not isThin or (isThin and isOrphan)


    v_element = doc.createElement( "v" )
    v_element.setAttribute( "vid", v.vid )
    indent = " " * p.level()
    if p.isRoot():
        ws = doc.createTextNode( "\n" )
    elif p.level() == 0:
        ws = None
    else:
        ws = doc.createTextNode( "\n%s" % indent )
    if ws:
        vnode.appendChild( ws )
    vnode.appendChild( v_element )
    ws = vnode.getPreviousSibling()
    ws = ws.cloneNode( 0 )
    vnode.appendChild( ws )
    #ws = doc.createTextNode( "\n%s" % indent )
    #vnode.appendChild( ws )
    #fc.put("&lt;v")
    &lt;&lt; Put tnode index &gt;&gt;
    &lt;&lt; Put attribute bits &gt;&gt;
    &lt;&lt; Put tnodeList and unKnownAttributes &gt;&gt;
    #fc.put("&gt;")
    &lt;&lt; Write the head text &gt;&gt;

    if not self.usingClipboard:
        &lt;&lt; issue informational messages &gt;&gt;

   # New in 4.2: don't write child nodes of @file-thin trees (except when writing to clipboard)
    if p.hasChildren():
        if forceWrite or self.usingClipboard:
            #fc.put_nl()
            # This optimization eliminates all "recursive" copies.
            p.moveToFirstChild()
            while 1:
                fc.putVnode2(p,ignored, doc, v_element )
                if p.hasNext(): p.moveToNext()
                else:           break
            p.moveToParent()
            

    #fc.put("&lt;/v&gt;") ; fc.put_nl()</t>
<t tx="zorcanda!.20050915130443.21">if v.t.fileIndex:
    gnx = g.app.nodeIndices.toString(v.t.fileIndex)
    #fc.put(" t=") ; fc.put_in_dquotes(gnx)
    v_element.setAttribute( "t", gnx )
    v.vid = gnx
    leoNodes.vid_vnode[ gnx ] = v #we set the vid for the node in the vid_node dic, this may not need to happen here, but has to happen in the read
    # g.trace(v.t)
    if forceWrite or self.usingClipboard:
        v.t.setWriteBit() # 4.2: Indicate we wrote the body text.
else:
    g.trace(v.t.fileIndex,v)
    g.es("error writing file(bad v.t.fileIndex)!")
    g.es("try using the Save To command")</t>
<t tx="zorcanda!.20050915130443.22">attr = ""
if p.v.isExpanded(): attr += "E"
if p.v.isMarked():   attr += "M"
if p.v.isOrphan():   attr += "O"

if 1: # No longer a bottleneck now that we use p.equal rather than p.__cmp__
    # Almost 30% of the entire writing time came from here!!!
    if p.equal(self.topPosition):   attr += "T" # was a bottleneck
    if c.isCurrentPosition(p):      attr += "V" # was a bottleneck

#if attr: fc.put(' a="%s"' % attr)
if attr:
    v_element.setAttribute( "a", attr )</t>
<t tx="zorcanda!.20050915130443.23"># I haven't converted this part... shouldn't be too tough

@
# Write the tnodeList only for @file nodes.
# New in 4.2: tnode list is in tnode.

if 0: # Debugging.
    if v.isAnyAtFileNode():
        if hasattr(v.t,"tnodeList"):
            g.trace(v.headString(),len(v.t.tnodeList))
        else:
            g.trace(v.headString(),"no tnodeList")

if hasattr(v.t,"tnodeList") and len(v.t.tnodeList) &gt; 0 and v.isAnyAtFileNode():
    if isThin:
        if g.app.unitTesting:
            g.app.unitTestDict["warning"] = True
        g.es("deleting tnode list for %s" % p.headString(),color="blue")
        # This is safe: cloning can't change the type of this node!
        delattr(v.t,"tnodeList")
    else:
        fc.putTnodeList(v) # New in 4.0

if hasattr(v,"unknownAttributes"): # New in 4.0
    self.putUnknownAttributes(v)
if p.hasChildren() and not forceWrite and not self.usingClipboard:
    # We put the entire tree when using the clipboard, so no need for this.
    self.putDescendentUnknownAttributes(p)
    self.putDescendentAttributes(p)</t>
<t tx="zorcanda!.20050915130443.24">headString = p.v.headString()

if headString:
    vh = doc.createElement( "vh" )
    indent = " " * ( p.level() + 1 )
    ws = doc.createTextNode( "\n%s" % indent )
    v_element.appendChild( ws )
    v_element.appendChild( vh )
    vh.setTextContent( headString )
    if p.numberOfChildren() == 0:
        ws = doc.createTextNode( "\n%s" % indent[ : -1 ] )
        v_element.appendChild( ws )
        
    #fc.put("&lt;vh&gt;")
    #fc.putEscapedString(headString)
    #fc.put("&lt;/vh&gt;")
</t>
<t tx="zorcanda!.20050915130443.25">if p.isAtThinFileNode and p.isOrphan():
    g.es("Writing erroneous: %s" % p.headString(),color="blue")
    p.clearOrphan()

if 0: # For testing.
    if p.isAtIgnoreNode():
         for p2 in p.self_and_subtree_iter():
                if p2.isAtThinFileNode():
                    g.es("Writing @ignore'd: %s" % p2.headString(),color="blue")</t>
</tnodes>
</leo_file>
