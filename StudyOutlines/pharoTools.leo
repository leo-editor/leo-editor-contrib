<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20190225121958.1"><vh>Notes</vh>
<v t="ekr.20190225121816.1"><vh>Cheat Sheet: Pharo collections</vh></v>
<v t="ekr.20190225121753.1"><vh>Grafoscopio Install Script</vh></v>
</v>
<v t="ekr.20190225121737.1"><vh>LeoNodes (Pharo)</vh>
<v t="ekr.20190225121737.2"><vh>class LeoNodeIndices</vh>
<v t="ekr.20190225121737.3"><vh>@ignore</vh>
<v t="ekr.20190225121737.4"><vh>ni.check_gnx</vh></v>
<v t="ekr.20190225121737.5"><vh>ni.compute_last_index</vh></v>
<v t="ekr.20190225121737.6"><vh>ni.get/setDefaultId</vh></v>
<v t="ekr.20190225121737.7"><vh>ni.getNewIndex</vh></v>
<v t="ekr.20190225121737.8"><vh>ni.new_vnode_helper</vh></v>
<v t="ekr.20190225121737.9"><vh>ni.scanGnx</vh></v>
<v t="ekr.20190225121737.10"><vh>ni.setTimeStamp</vh></v>
<v t="ekr.20190225121737.11"><vh>ni.tupleToString</vh></v>
<v t="ekr.20190225121737.12"><vh>ni.update</vh></v>
<v t="ekr.20190225121737.13"><vh>ni.updateLastIndex</vh></v>
</v>
</v>
<v t="ekr.20190225121737.14"><vh>class LeoPosition</vh>
<v t="ekr.20190225121737.15"><vh>getters</vh></v>
<v t="ekr.20190225121737.16"><vh>setters</vh></v>
<v t="ekr.20190225121737.17"><vh>@ignore position methods</vh>
<v t="ekr.20190225121737.18"><vh> p.ctor &amp; other special methods...</vh>
<v t="ekr.20190225121737.19"><vh> p.initialize</vh></v>
<v t="ekr.20190225121737.20"><vh>p.__eq__ &amp; __ne__</vh></v>
<v t="ekr.20190225121737.21"><vh>p.__ge__ &amp; __le__&amp; __lt__</vh></v>
<v t="ekr.20190225121737.22"><vh>p.__gt__</vh></v>
<v t="ekr.20190225121737.23"><vh>p.__getattr__ (no longer used)</vh></v>
<v t="ekr.20190225121737.24"><vh>p.__nonzero__ &amp; __bool__</vh></v>
<v t="ekr.20190225121737.25"><vh>p.__str__ and p.__repr__</vh></v>
<v t="ekr.20190225121737.26"><vh>p.archivedPosition</vh></v>
<v t="ekr.20190225121737.27"><vh>p.dump</vh></v>
<v t="ekr.20190225121737.28"><vh>p.key &amp; p.sort_key &amp; __hash__</vh></v>
</v>
<v t="ekr.20190225121737.29"><vh>p.File Conversion</vh>
<v t="ekr.20190225121737.30"><vh>p.convertTreeToString</vh></v>
<v t="ekr.20190225121737.31"><vh>p.moreHead</vh></v>
<v t="ekr.20190225121737.32"><vh>p.moreBody</vh></v>
</v>
<v t="ekr.20190225121737.33"><vh>p.generators</vh>
<v t="ekr.20190225121737.34"><vh>p.children</vh></v>
<v t="ekr.20190225121737.35"><vh>p.following_siblings</vh></v>
<v t="ekr.20190225121737.36"><vh>p.nearest_roots</vh></v>
<v t="ekr.20190225121737.37"><vh>p.nearest_unique_roots (aka p.nearest)</vh></v>
<v t="ekr.20190225121737.38"><vh>p.nodes</vh></v>
<v t="ekr.20190225121737.39"><vh>p.parents</vh></v>
<v t="ekr.20190225121737.40"><vh>p.self_and_parents</vh></v>
<v t="ekr.20190225121737.41"><vh>p.self_and_siblings</vh></v>
<v t="ekr.20190225121737.42"><vh>p.self_and_subtree</vh></v>
<v t="ekr.20190225121737.43"><vh>p.subtree</vh></v>
<v t="ekr.20190225121737.44"><vh>p.unique_nodes</vh></v>
<v t="ekr.20190225121737.45"><vh>p.unique_subtree</vh></v>
</v>
<v t="ekr.20190225121737.46"><vh>p.Getters</vh>
<v t="ekr.20190225121737.47"><vh>p.VNode proxies</vh>
<v t="ekr.20190225121737.48"><vh>p.Comparisons</vh></v>
<v t="ekr.20190225121737.49"><vh>p.Headline &amp; body strings</vh></v>
<v t="ekr.20190225121737.50"><vh>p.Status bits</vh></v>
</v>
<v t="ekr.20190225121737.51"><vh>p.children &amp; parents</vh>
<v t="ekr.20190225121737.52"><vh>p.childIndex</vh></v>
<v t="ekr.20190225121737.53"><vh>p.directParents</vh></v>
<v t="ekr.20190225121737.54"><vh>p.hasChildren &amp; p.numberOfChildren</vh></v>
</v>
<v t="ekr.20190225121737.55"><vh>p.getX &amp; VNode compatibility traversal routines</vh></v>
<v t="ekr.20190225121737.56"><vh>p.get_UNL</vh></v>
<v t="ekr.20190225121737.57"><vh>p.hasBack/Next/Parent/ThreadBack</vh>
<v t="ekr.20190225121737.58"><vh>hasThreadNext (the only complex hasX method)</vh></v>
</v>
<v t="ekr.20190225121737.59"><vh>p.findRootPosition</vh></v>
<v t="ekr.20190225121737.60"><vh>p.isAncestorOf</vh></v>
<v t="ekr.20190225121737.61"><vh>p.isCloned</vh></v>
<v t="ekr.20190225121737.62"><vh>p.isRoot</vh></v>
<v t="ekr.20190225121737.63"><vh>p.isVisible (slow)</vh></v>
<v t="ekr.20190225121737.64"><vh>p.level &amp; simpleLevel</vh></v>
<v t="ekr.20190225121737.65"><vh>p.positionAfterDeletedTree</vh></v>
<v t="ekr.20190225121737.66"><vh>p.textOffset</vh></v>
</v>
<v t="ekr.20190225121737.67"><vh>p.isOutsideAtFileTree</vh></v>
<v t="ekr.20190225121737.68"><vh>p.Low level methods</vh>
<v t="ekr.20190225121737.69"><vh>p._adjustPositionBeforeUnlink</vh></v>
<v t="ekr.20190225121737.70"><vh>p._linkAfter</vh></v>
<v t="ekr.20190225121737.71"><vh>p._linkCopiedAfter</vh></v>
<v t="ekr.20190225121737.72"><vh>p._linkAsNthChild</vh></v>
<v t="ekr.20190225121737.73"><vh>p._linkCopiedAsNthChild</vh></v>
<v t="ekr.20190225121737.74"><vh>p._linkAsRoot</vh></v>
<v t="ekr.20190225121737.75"><vh>p._parentVnode</vh></v>
<v t="ekr.20190225121737.76"><vh>p._relinkAsCloneOf</vh></v>
<v t="ekr.20190225121737.77"><vh>p._unlink</vh>
<v t="ekr.20190225121737.78"><vh>p.badUnlink</vh></v>
</v>
</v>
<v t="ekr.20190225121737.79"><vh>p.moveToX</vh>
<v t="ekr.20190225121737.80"><vh>p.moveToBack</vh></v>
<v t="ekr.20190225121737.81"><vh>p.moveToFirstChild</vh></v>
<v t="ekr.20190225121737.82"><vh>p.moveToLastChild</vh></v>
<v t="ekr.20190225121737.83"><vh>p.moveToLastNode</vh></v>
<v t="ekr.20190225121737.84"><vh>p.moveToNext</vh></v>
<v t="ekr.20190225121737.85"><vh>p.moveToNodeAfterTree</vh></v>
<v t="ekr.20190225121737.86"><vh>p.moveToNthChild</vh></v>
<v t="ekr.20190225121737.87"><vh>p.moveToParent</vh></v>
<v t="ekr.20190225121737.88"><vh>p.moveToThreadBack</vh></v>
<v t="ekr.20190225121737.89"><vh>p.moveToThreadNext</vh></v>
<v t="ekr.20190225121737.90"><vh>p.moveToVisBack &amp; helper</vh>
<v t="ekr.20190225121737.91"><vh>checkVisBackLimit</vh></v>
</v>
<v t="ekr.20190225121737.92"><vh>p.moveToVisNext &amp; helper</vh>
<v t="ekr.20190225121737.93"><vh>checkVisNextLimit</vh></v>
</v>
<v t="ekr.20190225121737.94"><vh>p.safeMoveToThreadNext</vh>
<v t="ekr.20190225121737.95"><vh>p.checkChild</vh></v>
</v>
</v>
<v t="ekr.20190225121737.96"><vh>p.Moving, Inserting, Deleting, Cloning, Sorting</vh>
<v t="ekr.20190225121737.97"><vh>p.clone</vh></v>
<v t="ekr.20190225121737.98"><vh>p.copy</vh></v>
<v t="ekr.20190225121737.99"><vh>p.copyTreeAfter, copyTreeTo</vh></v>
<v t="ekr.20190225121737.100"><vh>p.copyWithNewVnodes</vh></v>
<v t="ekr.20190225121737.101"><vh>p.createNodeHierarchy</vh></v>
<v t="ekr.20190225121737.102"><vh>p.deleteAllChildren</vh></v>
<v t="ekr.20190225121737.103"><vh>p.doDelete</vh></v>
<v t="ekr.20190225121737.104"><vh>p.insertAfter</vh></v>
<v t="ekr.20190225121737.105"><vh>p.insertAsLastChild</vh></v>
<v t="ekr.20190225121737.106"><vh>p.insertAsNthChild</vh></v>
<v t="ekr.20190225121737.107"><vh>p.insertBefore (new in Leo 4.11)</vh></v>
<v t="ekr.20190225121737.108"><vh>p.invalidOutline</vh></v>
<v t="ekr.20190225121737.109"><vh>p.moveAfter</vh></v>
<v t="ekr.20190225121737.110"><vh>p.moveToFirst/LastChildOf</vh></v>
<v t="ekr.20190225121737.111"><vh>p.moveToNthChildOf</vh></v>
<v t="ekr.20190225121737.112"><vh>p.moveToRoot</vh></v>
<v t="ekr.20190225121737.113"><vh>p.promote</vh></v>
<v t="ekr.20190225121737.114"><vh>p.validateOutlineWithParent</vh>
<v t="ekr.20190225121737.115"><vh>&lt;&lt; validate parent ivar &gt;&gt;</vh></v>
<v t="ekr.20190225121737.116"><vh>&lt;&lt; validate childIndex ivar &gt;&gt;</vh></v>
<v t="ekr.20190225121737.117"><vh>&lt;&lt; validate x ivar &gt;&gt;</vh></v>
</v>
</v>
<v t="ekr.20190225121737.118"><vh>p.Properties</vh>
<v t="ekr.20190225121737.119"><vh>p.b property</vh></v>
<v t="ekr.20190225121737.120"><vh>p.h property</vh></v>
<v t="ekr.20190225121737.121"><vh>p.gnx property</vh></v>
<v t="ekr.20190225121737.122"><vh>p.script property</vh></v>
<v t="ekr.20190225121737.123"><vh>p.nosentinels property</vh></v>
<v t="ekr.20190225121737.124"><vh>p.u Property (new)</vh></v>
</v>
<v t="ekr.20190225121737.125"><vh>p.Setters</vh>
<v t="ekr.20190225121737.126"><vh>p.VNode proxies</vh>
<v t="ekr.20190225121737.127"><vh>p.contract/expand/isExpanded</vh></v>
<v t="ekr.20190225121737.128"><vh>p.Status bits</vh></v>
<v t="ekr.20190225121737.129"><vh>p.computeIcon &amp; p.setIcon</vh></v>
<v t="ekr.20190225121737.130"><vh>p.setSelection</vh></v>
<v t="ekr.20190225121737.131"><vh>p.restore/saveCursorAndScroll</vh></v>
</v>
<v t="ekr.20190225121737.132"><vh>p.setBodyString &amp; setHeadString</vh></v>
<v t="ekr.20190225121737.133"><vh>p.Visited bits</vh>
<v t="ekr.20190225121737.134"><vh>p.clearVisitedInTree</vh></v>
<v t="ekr.20190225121737.135"><vh>p.clearAllVisitedInTree</vh></v>
</v>
<v t="ekr.20190225121737.136"><vh>p.Dirty bits</vh>
<v t="ekr.20190225121737.137"><vh>p.clearDirty</vh></v>
<v t="ekr.20190225121737.138"><vh>p.findAllPotentiallyDirtyNodes</vh></v>
<v t="ekr.20190225121737.139"><vh>p.inAtIgnoreRange</vh></v>
<v t="ekr.20190225121737.140"><vh>p.setAllAncestorAtFileNodesDirty</vh></v>
<v t="ekr.20190225121737.141"><vh>p.setDirty</vh></v>
</v>
</v>
<v t="ekr.20190225121737.142"><vh>p.Predicates</vh>
<v t="ekr.20190225121737.143"><vh>p.is_at_all &amp; is_at_all_tree</vh></v>
<v t="ekr.20190225121737.144"><vh>p.is_at_ignore &amp; in_at_ignore_tree</vh></v>
</v>
</v>
</v>
<v t="ekr.20190225121737.145"><vh>class LeoVnode</vh>
<v t="ekr.20190225121737.146"><vh>birth</vh></v>
<v t="ekr.20190225121737.147"><vh>getters</vh></v>
<v t="ekr.20190225121737.148"><vh>setters</vh></v>
<v t="ekr.20190225121737.149"><vh>@ignore vnodes</vh>
<v t="ekr.20190225121737.150"><vh>v.Comparisons</vh>
<v t="ekr.20190225121737.151"><vh>v.findAtFileName</vh></v>
<v t="ekr.20190225121737.152"><vh>v.anyAtFileNodeName</vh></v>
<v t="ekr.20190225121737.153"><vh>v.at...FileNodeName</vh></v>
<v t="ekr.20190225121737.154"><vh>v.isAtAllNode</vh></v>
<v t="ekr.20190225121737.155"><vh>v.isAnyAtFileNode</vh></v>
<v t="ekr.20190225121737.156"><vh>v.isAt...FileNode</vh></v>
<v t="ekr.20190225121737.157"><vh>v.isAtIgnoreNode</vh></v>
<v t="ekr.20190225121737.158"><vh>v.isAtOthersNode</vh></v>
<v t="ekr.20190225121737.159"><vh>v.matchHeadline</vh></v>
</v>
<v t="ekr.20190225121737.160"><vh>v.copyTree</vh></v>
<v t="ekr.20190225121737.161"><vh>v.Getters</vh>
<v t="ekr.20190225121737.162"><vh>v.bodyString</vh></v>
<v t="ekr.20190225121737.163"><vh>v.Children</vh>
<v t="ekr.20190225121737.164"><vh>v.firstChild</vh></v>
<v t="ekr.20190225121737.165"><vh>v.hasChildren &amp; hasFirstChild</vh></v>
<v t="ekr.20190225121737.166"><vh>v.lastChild</vh></v>
<v t="ekr.20190225121737.167"><vh>v.nthChild</vh></v>
<v t="ekr.20190225121737.168"><vh>v.numberOfChildren</vh></v>
</v>
<v t="ekr.20190225121737.169"><vh>v.directParents</vh></v>
<v t="ekr.20190225121737.170"><vh>v.hasBody</vh></v>
<v t="ekr.20190225121737.171"><vh>v.headString &amp; v.cleanHeadString</vh></v>
<v t="ekr.20190225121737.172"><vh>v.isNthChildOf</vh></v>
<v t="ekr.20190225121737.173"><vh>v.Status Bits</vh>
<v t="ekr.20190225121737.174"><vh>v.isCloned</vh></v>
<v t="ekr.20190225121737.175"><vh>v.isDirty</vh></v>
<v t="ekr.20190225121737.176"><vh>v.isMarked</vh></v>
<v t="ekr.20190225121737.177"><vh>v.isOrphan</vh></v>
<v t="ekr.20190225121737.178"><vh>v.isSelected</vh></v>
<v t="ekr.20190225121737.179"><vh>v.isTopBitSet</vh></v>
<v t="ekr.20190225121737.180"><vh>v.isVisited</vh></v>
<v t="ekr.20190225121737.181"><vh>v.isWriteBit</vh></v>
<v t="ekr.20190225121737.182"><vh>v.status</vh></v>
</v>
</v>
<v t="ekr.20190225121737.183"><vh>v.Setters</vh>
<v t="ekr.20190225121737.184"><vh> v.Dirty bits</vh>
<v t="ekr.20190225121737.185"><vh>v.clearDirty</vh></v>
<v t="ekr.20190225121737.186"><vh>v.findAllPotentiallyDirtyNodes</vh></v>
<v t="ekr.20190225121737.187"><vh>v.setAllAncestorAtFileNodesDirty</vh></v>
<v t="ekr.20190225121737.188"><vh>v.setDirty</vh></v>
</v>
<v t="ekr.20190225121737.189"><vh> v.Status bits</vh>
<v t="ekr.20190225121737.190"><vh>v.clearClonedBit</vh></v>
<v t="ekr.20190225121737.191"><vh>v.clearMarked</vh></v>
<v t="ekr.20190225121737.192"><vh>v.clearWriteBit</vh></v>
<v t="ekr.20190225121737.193"><vh>v.clearOrphan</vh></v>
<v t="ekr.20190225121737.194"><vh>v.clearVisited</vh></v>
<v t="ekr.20190225121737.195"><vh>v.contract/expand/initExpandedBit/isExpanded</vh></v>
<v t="ekr.20190225121737.196"><vh>v.initStatus</vh></v>
<v t="ekr.20190225121737.197"><vh>v.setClonedBit &amp; initClonedBit</vh></v>
<v t="ekr.20190225121737.198"><vh>v.setMarked &amp; initMarkedBit</vh></v>
<v t="ekr.20190225121737.199"><vh>v.setOrphan</vh></v>
<v t="ekr.20190225121737.200"><vh>v.setSelected</vh></v>
<v t="ekr.20190225121737.201"><vh>v.setVisited</vh></v>
<v t="ekr.20190225121737.202"><vh>v.setWriteBit</vh></v>
</v>
<v t="ekr.20190225121737.203"><vh>v.childrenModified</vh></v>
<v t="ekr.20190225121737.204"><vh>v.computeIcon &amp; setIcon</vh></v>
<v t="ekr.20190225121737.205"><vh>v.contentModified</vh></v>
<v t="ekr.20190225121737.206"><vh>v.restoreCursorAndScroll</vh></v>
<v t="ekr.20190225121737.207"><vh>v.saveCursorAndScroll</vh></v>
<v t="ekr.20190225121737.208"><vh>v.setBodyString &amp; v.setHeadString</vh></v>
<v t="ekr.20190225121737.209"><vh>v.setSelection</vh></v>
</v>
<v t="ekr.20190225121737.210"><vh>v.Inserting &amp; cloning</vh></v>
<v t="ekr.20190225121737.211"><vh>v.Low level methods</vh>
<v t="ekr.20190225121737.212"><vh>v._addCopiedLink</vh></v>
<v t="ekr.20190225121737.213"><vh>v._addLink &amp; _addParentLinks</vh>
<v t="ekr.20190225121737.214"><vh>v._addParentLinks</vh></v>
</v>
<v t="ekr.20190225121737.215"><vh>v._cutLink &amp; _cutParentLinks</vh>
<v t="ekr.20190225121737.216"><vh>v._cutParentLinks</vh></v>
</v>
<v t="ekr.20190225121737.217"><vh>v._deleteAllChildren</vh></v>
<v t="ekr.20190225121737.218"><vh>v._linkAsNthChild</vh></v>
</v>
<v t="ekr.20190225121737.219"><vh>v.Properties</vh>
<v t="ekr.20190225121737.220"><vh>v.b Property</vh></v>
<v t="ekr.20190225121737.221"><vh>v.h property</vh></v>
<v t="ekr.20190225121737.222"><vh>v.u Property</vh></v>
<v t="ekr.20190225121737.223"><vh>v.gnx Property</vh></v>
</v>
</v>
</v>
</v>
<v t="ekr.20190225121333.1"><vh>@button file-out</vh>
<v t="ekr.20190225121333.2"><vh>fo.run</vh></v>
<v t="ekr.20190225121333.3"><vh>fo.file_out &amp; helpers</vh>
<v t="ekr.20190225121333.4"><vh>fo.compute_fn</vh></v>
<v t="ekr.20190225121333.5"><vh>fo.write_file</vh></v>
<v t="ekr.20190225121333.6"><vh>fo.write_node</vh></v>
</v>
</v>
<v t="ekr.20190225121341.1"><vh>@button file-in</vh>
<v t="ekr.20190225121341.2"><vh>fi.is_chunk</vh></v>
<v t="ekr.20190225122134.1"><vh>fi.is_class</vh></v>
<v t="ekr.20190225121341.3"><vh>fi.run</vh></v>
<v t="ekr.20190225121341.4"><vh>fi.read_file</vh></v>
<v t="ekr.20190225121341.5"><vh>fi.read_line</vh>
<v t="ekr.20190225122907.1"><vh>fi.new_class</vh></v>
<v t="ekr.20190225123049.1"><vh>fi.plain_line</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20190225121333.1">'''Convert the marked trees to a .st file.'''

class Controller:
    
    def __init__(self, c):
        self.c = c

    @others
    
Controller(c).run()
</t>
<t tx="ekr.20190225121333.2">def run(self):
    c = self.c
    for p in c.all_positions():
        if p.isMarked() and p.h.startswith('class'):
            self.file_out(p)
</t>
<t tx="ekr.20190225121333.3">def file_out(self, p):
    '''Convert p's tree to an .st file.'''
    fn = self.compute_fn(p)
    g.es_print('creating:', fn)
    with open(fn, 'w') as f:
        self.write_file(f, p)
</t>
<t tx="ekr.20190225121333.4">def compute_fn(self, p):
    assert p.h.startswith('class')
    fn = p.h[5:].strip()+'.st'
    fn = g.os_path_finalize_join(r'c:\test', fn)
    return fn
</t>
<t tx="ekr.20190225121333.5">def write_file(self, f, p):
    '''Write p's tree to the open file f.'''
    after = p.nodeAfterTree()
    while p and p != after:
        if p.h.startswith('@ignore'):
            p.moveToNodeAfterTree()
        else:
            self.write_node(f, p)
            p.moveToThreadNext()
</t>
<t tx="ekr.20190225121333.6">def write_node(self, f, p):
    '''Write a single node to the open file f.'''
    f.write('"%s"\n\n' % p.h)
    f.write(p.b.strip() + '\n\n')
</t>
<t tx="ekr.20190225121341.1">'''Convert an .st file to a Leo outline.'''
g.cls()
import re
fn = 'c:/test/Grafoscopio.st'
assert g.os_path_exists(fn), repr(fn)

class Controller:
    
    def __init__(self, c, fn):
        self.c = c
        self.fn = fn
        # State ivars
        self.class_parent = None
            # Parent for all organizer nodes for currently-scanned class.
        self.organizer_p = None
            # Parent of all nodes with organizer given by self.organizer_p.h
        self.p = None
            # The node presently being scanned.
        self.parent = None
            # Parent of all class nodes.

    @others
    
Controller(c, fn).run()
</t>
<t tx="ekr.20190225121341.2"># Examples:
    # !GrafoscopioNode methodsFor: 'adding' stamp: 'OffrayLuna 11/30/2017 12:45'!
    # !ManifestGrafoscopio class methodsFor: 'code-critics' stamp: 'OffrayLuna 10/7/2016 20:34'!

chunk_pat = re.compile(r"\!(\w+)\s+(class)?\s*methodsFor:\s*'([\w-]+)\'\s+stamp:\s+\'(\w+)\s+(.*)\'\!")

def is_chunk(self, line):
    m = self.chunk_pat.match(line)
    if m:
        class_name = m.group(1)
        is_class_method = m.group(2) or ''
        organizer_name = m.group(3)
        user_name = m.group(4)
        return True, class_name, is_class_method, organizer_name, user_name
    else:
        return False, None, None, None, None
</t>
<t tx="ekr.20190225121341.3">def run(self):
    # Create the parent node.
    c = self.c
    last = c.lastTopLevel()
    self.parent = last.insertAfter()
    self.parent.h = g.shortFileName(self.fn)
    self.parent.b = '@language pharo\n\n'
    self.p = self.parent.copy()
    with open(self.fn, 'r') as f:
        s = f.read()
    self.read_file(s)
    c.redraw()
</t>
<t tx="ekr.20190225121341.4">def read_file(self, lines):
    for line in g.splitLines(lines):
        self.read_line(line)</t>
<t tx="ekr.20190225121341.5">def read_line(self, line):
    
    class_name, super_class_name = self.is_class(line)
    if class_name:
        self.new_class(class_name)
        self.plain_line(line)
        return
    is_chunk, class_name, is_class_method, organizer_name, user_name = self.is_chunk(line)
    if not is_chunk:
        self.plain_line(line)
        return
    #
    # A new chunk: Clean up the previous node.
    if self.p:
        self.p.b = self.p.b.strip()+'\n'
        self.p = None
    #
    # Allocate a new class node if necessary.
    old_class_name = self.class_parent and self.class_parent.h
    if old_class_name != class_name:
        g.trace('UNEXPECTED CLASS', class_name)
        self.new_class(class_name)
        return
    #
    # Allocate a new organizer node if necessary.
    old_organizer_name = self.organizer_p and self.organizer_p.h
    if old_organizer_name != organizer_name:
        # g.trace('ORGANIZER', organizer_name)
        self.organizer_p = self.class_parent.insertAsLastChild()
        self.organizer_p.h = organizer_name
        self.p = None
        return
    #
    # Allocate a new node to hold all lines of the chunk.
    self.p = self.organizer_p.insertAsLastChild()
    self.p.h = ''</t>
<t tx="ekr.20190225121737.1">@language pharo

"Leo's fundamental data classes, written in Pharo"
</t>
<t tx="ekr.20190225121737.10">def setTimestamp(self):
    """Set the timestamp string to be used by getNewIndex until further notice"""
    self.timeString = time.strftime(
        "%Y%m%d%H%M%S", # Help comparisons; avoid y2k problems.
        time.localtime())

setTimeStamp = setTimestamp
</t>
<t tx="ekr.20190225121737.100">def copyWithNewVnodes(self, copyMarked=False):
    '''
    Return an **unliked** copy of p with a new vnode v.
    The new vnode is complete copy of v and all its descendants.
    '''
    p = self
    return Position(v=p.v.copyTree(copyMarked))
</t>
<t tx="ekr.20190225121737.101">def createNodeHierarchy(self, heads, forcecreate=False):
    ''' Create the proper hierarchy of nodes with headlines defined in
        'heads' as children of the current position

        params:
        heads - list of headlines in order to create, i.e. ['foo','bar','baz']
                will create:
                  self
                  -foo
                  --bar
                  ---baz
        forcecreate - If False (default), will not create nodes unless they don't exist
                      If True, will create nodes regardless of existing nodes
        returns the final position ('baz' in the above example)
    '''
    c = self.v.context
    return c.createNodeHierarchy(heads, parent=self, forcecreate=forcecreate)
</t>
<t tx="ekr.20190225121737.102">def deleteAllChildren(self):
    '''
    Delete all children of the receiver and set p.dirty().
    '''
    p = self
    p.setDirty() # Mark @file nodes dirty!
    while p.hasChildren():
        p.firstChild().doDelete()
</t>
<t tx="ekr.20190225121737.103">def doDelete(self, newNode=None):
    """
    Deletes position p from the outline.
    
    This is the main delete routine.
    It deletes the receiver's entire tree from the screen.
    Because of the undo command we never actually delete vnodes.
    """
    p = self
    p.setDirty() # Mark @file nodes dirty!
    sib = p.copy()
    while sib.hasNext():
        sib.moveToNext()
        if sib == newNode:
            # Adjust newNode._childIndex if newNode is a following sibling of p.
            newNode._childIndex -= 1
            break
    p._unlink()
</t>
<t tx="ekr.20190225121737.104">def insertAfter(self):
    """
    Inserts a new position after self.

    Returns the newly created position.
    """
    p = self; context = p.v.context
    p2 = self.copy()
    p2.v = VNode(context=context)
    p2.v.iconVal = 0
    p2._linkAfter(p)
    return p2
</t>
<t tx="ekr.20190225121737.105">def insertAsLastChild(self):
    """Inserts a new VNode as the last child of self.

    Returns the newly created position."""
    p = self
    n = p.numberOfChildren()
    return p.insertAsNthChild(n)
</t>
<t tx="ekr.20190225121737.106">def insertAsNthChild(self, n):
    """
    Inserts a new node as the the nth child of self.
    self must have at least n-1 children.

    Returns the newly created position.
    """
    p = self; context = p.v.context
    p2 = self.copy()
    p2.v = VNode(context=context)
    p2.v.iconVal = 0
    p2._linkAsNthChild(p, n)
    return p2
</t>
<t tx="ekr.20190225121737.107">def insertBefore(self):
    '''Inserts a new position before self.

    Returns the newly created position.

    '''
    p = self
    parent = p.parent()
    if p.hasBack():
        back = p.getBack()
        p = back.insertAfter()
    elif parent:
        p = parent.insertAsNthChild(0)
    else:
        p = p.insertAfter()
        p.moveToRoot(oldRoot=p)
    return p
</t>
<t tx="ekr.20190225121737.108">def invalidOutline(self, message):
    p = self
    if p.hasParent():
        node = p.parent()
    else:
        node = p
    p.v.context.alert("invalid outline: %s\n%s" % (message, node))
</t>
<t tx="ekr.20190225121737.109">def moveAfter(self, a):
    """Move a position after position a."""
    p = self # Do NOT copy the position!
    a._adjustPositionBeforeUnlink(p)
    p._unlink()
    p._linkAfter(a)
    return p
</t>
<t tx="ekr.20190225121737.11">def tupleToString(self, aTuple):
    '''
    Convert a gnx tuple returned by scanGnx
    to its string representation.
    '''
    theId, t, n = aTuple
    # This logic must match the existing logic so that
    # previously written gnx's can be found.
    if n in (None, 0, '',):
        s = "%s.%s" % (theId, t)
    else:
        s = "%s.%s.%s" % (theId, t, n)
    return g.toUnicode(s)
</t>
<t tx="ekr.20190225121737.110">def moveToFirstChildOf(self, parent):
    """Move a position to the first child of parent."""
    p = self # Do NOT copy the position!
    return p.moveToNthChildOf(parent, 0) # Major bug fix: 2011/12/04

def moveToLastChildOf(self, parent):
    """Move a position to the last child of parent."""
    p = self # Do NOT copy the position!
    n = parent.numberOfChildren()
    if p.parent() == parent:
        n -= 1 # 2011/12/10: Another bug fix.
    return p.moveToNthChildOf(parent, n) # Major bug fix: 2011/12/04
</t>
<t tx="ekr.20190225121737.111">def moveToNthChildOf(self, parent, n):
    """Move a position to the nth child of parent."""
    p = self # Do NOT copy the position!
    parent._adjustPositionBeforeUnlink(p)
    p._unlink()
    p._linkAsNthChild(parent, n)
    return p
</t>
<t tx="ekr.20190225121737.112">def moveToRoot(self, oldRoot=None):
    '''Moves a position to the root position.

    Important: oldRoot must the previous root position if it exists.'''
    p = self # Do NOT copy the position!
    if oldRoot:
        oldRoot._adjustPositionBeforeUnlink(p)
    p._unlink()
    p._linkAsRoot(oldRoot)
    return p
</t>
<t tx="ekr.20190225121737.113">def promote(self):
    '''A low-level promote helper.'''
    p = self # Do NOT copy the position.
    parent_v = p._parentVnode()
    children = p.v.children
    # Add the children to parent_v's children.
    n = p.childIndex() + 1
    z = parent_v.children[:]
    parent_v.children = z[: n]
    parent_v.children.extend(children)
    parent_v.children.extend(z[n:])
    # Remove v's children.
    p.v.children = []
    # Adjust the parent links in the moved children.
    # There is no need to adjust descendant links.
    for child in children:
        child.parents.remove(p.v)
        child.parents.append(parent_v)
</t>
<t tx="ekr.20190225121737.114"># This routine checks the structure of the receiver's tree.

def validateOutlineWithParent(self, pv):
    p = self
    result = True # optimists get only unpleasant surprises.
    parent = p.getParent()
    childIndex = p._childIndex
    &lt;&lt; validate parent ivar &gt;&gt;
    &lt;&lt; validate childIndex ivar &gt;&gt;
    &lt;&lt; validate x ivar &gt;&gt;
    # Recursively validate all the children.
    for child in p.children():
        r = child.validateOutlineWithParent(p)
        if not r: result = False
    return result
</t>
<t tx="ekr.20190225121737.115">if parent != pv:
    p.invalidOutline("Invalid parent link: " + repr(parent))
</t>
<t tx="ekr.20190225121737.116">if pv:
    if childIndex &lt; 0:
        p.invalidOutline("missing childIndex" + childIndex)
    elif childIndex &gt;= pv.numberOfChildren():
        p.invalidOutline("missing children entry for index: " + childIndex)
elif childIndex &lt; 0:
    p.invalidOutline("negative childIndex" + childIndex)
</t>
<t tx="ekr.20190225121737.117">if not p.v and pv:
    self.invalidOutline("Empty t")
</t>
<t tx="ekr.20190225121737.118"></t>
<t tx="ekr.20190225121737.119">def __get_b(self):
    '''Return the body text of a position.'''
    p = self
    return p.bodyString()

def __set_b(self, val):
    '''
    Set the body text of a position.

    **Warning: the p.b = whatever is *expensive* because it calls
    c.setBodyString().

    Usually, code *should* this setter, despite its cost, because it
    update's Leo's outline pane properly. Calling c.redraw() is *not*
    enough.

    This performance gotcha becomes important for repetitive commands, like
    cff, replace-all and recursive import. In such situations, code should
    use p.v.b instead of p.b.
    '''
    p = self; c = p.v and p.v.context
    if c:
        c.setBodyString(p, val)
        # Warning: c.setBodyString is *expensive*.

b = property(
    __get_b, __set_b,
    doc="position body string property")
</t>
<t tx="ekr.20190225121737.12">def update(self):
    '''Update self.timeString and self.lastIndex'''
    t_s = time.strftime("%Y%m%d%H%M%S", time.localtime())
    if self.timeString == t_s:
        self.lastIndex += 1
    else:
        self.lastIndex = 1
        self.timeString = t_s
    return t_s
</t>
<t tx="ekr.20190225121737.120">def __get_h(self):
    p = self
    return p.headString()

def __set_h(self, val):
    '''
    Set the headline text of a position.

    **Warning: the p.h = whatever is *expensive* because it calls
    c.setHeadString().

    Usually, code *should* this setter, despite its cost, because it
    update's Leo's outline pane properly. Calling c.redraw() is *not*
    enough.

    This performance gotcha becomes important for repetitive commands, like
    cff, replace-all and recursive import. In such situations, code should
    use p.v.h instead of p.h.
    '''
    p = self; c = p.v and p.v.context
    if c:
        c.setHeadString(p, val)
        # Warning: c.setHeadString is *expensive*.

h = property(
    __get_h, __set_h,
    doc="position property returning the headline string")
</t>
<t tx="ekr.20190225121737.121">def __get_gnx(self):
    p = self
    return p.v.fileIndex

gnx = property(
    __get_gnx, # __set_gnx,
    doc="position gnx property")
</t>
<t tx="ekr.20190225121737.122">def __get_script(self):
    p = self
    return g.getScript(p.v.context, p,
        useSelectedText=False, # Always return the entire expansion.
        forcePythonSentinels=True,
        useSentinels=False)

script = property(
    __get_script, # __set_script,
    doc="position property returning the script formed by p and its descendants")
</t>
<t tx="ekr.20190225121737.123">def __get_nosentinels(self):
    p = self
    return ''.join([z for z in g.splitLines(p.b) if not g.isDirective(z)])

nosentinels = property(
    __get_nosentinels, # __set_nosentinels
    doc="position property returning the body text without sentinels")
</t>
<t tx="ekr.20190225121737.124">def __get_u(self):
    p = self
    return p.v.u

def __set_u(self, val):
    p = self
    p.v.u = val

u = property(
    __get_u, __set_u,
    doc="p.u property")
</t>
<t tx="ekr.20190225121737.125"></t>
<t tx="ekr.20190225121737.126"></t>
<t tx="ekr.20190225121737.127">def contract(self):
    '''Contract p.v and clear p.v.expandedPositions list.'''
    p, v = self, self.v
    v.expandedPositions = [z for z in v.expandedPositions if z != p]
    v.contract()

def expand(self):
    p = self
    v = self.v
    v.expandedPositions = [z for z in v.expandedPositions if z != p]
    for p2 in v.expandedPositions:
        if p == p2:
            break
    else:
        v.expandedPositions.append(p.copy())
    v.expand()

def isExpanded(self):
    p = self
    if p.isCloned():
        c = p.v.context
        return c.shouldBeExpanded(p)
    else:
        return p.v.isExpanded()
</t>
<t tx="ekr.20190225121737.128"># Clone bits are no longer used.
# Dirty bits are handled carefully by the position class.

def clearMarked(self): return self.v.clearMarked()

def clearOrphan(self): return self.v.clearOrphan()

def clearVisited(self): return self.v.clearVisited()

def initExpandedBit(self): return self.v.initExpandedBit()

def initMarkedBit(self): return self.v.initMarkedBit()

def initStatus(self, status): return self.v.initStatus(status)

def setMarked(self): return self.v.setMarked()

def setOrphan(self): return self.v.setOrphan()

def setSelected(self): return self.v.setSelected()

def setVisited(self): return self.v.setVisited()
</t>
<t tx="ekr.20190225121737.129">def computeIcon(self):
    return self.v.computeIcon()

def setIcon(self):
    pass # Compatibility routine for old scripts
</t>
<t tx="ekr.20190225121737.13">def updateLastIndex(self, gnx):
    '''Update ni.lastIndex if the gnx affects it.'''
    id_, t, n = self.scanGnx(gnx)
    if not id_ or (n is not 0 and not n):
        return # the gnx is not well formed or n in ('',None)
    if id_ == self.userId and t == self.timeString:
        try:
            n = int(n)
            if n &gt; self.lastIndex:
                self.lastIndex = n
                g.trace(gnx, '--&gt;', n)
        except Exception:
            g.trace('can not happen', repr(n))
</t>
<t tx="ekr.20190225121737.130">def setSelection(self, start, length):
    return self.v.setSelection(start, length)
</t>
<t tx="ekr.20190225121737.131">def restoreCursorAndScroll(self):
    self.v.restoreCursorAndScroll()

def saveCursorAndScroll(self):
    self.v.saveCursorAndScroll()
</t>
<t tx="ekr.20190225121737.132">def setBodyString(self, s):
    p = self
    return p.v.setBodyString(s)

initBodyString = setBodyString
setTnodeText = setBodyString
scriptSetBodyString = setBodyString

def initHeadString(self, s):
    p = self
    p.v.initHeadString(s)

def setHeadString(self, s):
    p = self
    p.v.initHeadString(s)
    # Note: p.setDirty is expensive.
    p.setDirty()
</t>
<t tx="ekr.20190225121737.133"></t>
<t tx="ekr.20190225121737.134"># Compatibility routine for scripts.

def clearVisitedInTree(self):
    for p in self.self_and_subtree(copy=False):
        p.clearVisited()
</t>
<t tx="ekr.20190225121737.135">def clearAllVisitedInTree(self):
    for p in self.self_and_subtree(copy=False):
        p.v.clearVisited()
        p.v.clearWriteBit()
</t>
<t tx="ekr.20190225121737.136"></t>
<t tx="ekr.20190225121737.137">def clearDirty(self):
    '''(p) Set p.v dirty.'''
    p = self
    p.v.clearDirty()
</t>
<t tx="ekr.20190225121737.138">def findAllPotentiallyDirtyNodes(self):
    p = self
    return p.v.findAllPotentiallyDirtyNodes()
</t>
<t tx="ekr.20190225121737.139">def inAtIgnoreRange(self):
    """Returns True if position p or one of p's parents is an @ignore node."""
    p = self
    for p in p.self_and_parents(copy=False):
        if p.isAtIgnoreNode():
            return True
    return False
</t>
<t tx="ekr.20190225121737.14">Object subclass: LeoPosition
    instanceVariableNames: 'childIndex stack v'
    classVariableNames: ''
    package: 'Leo'.

initialize childIndex: anInt stack: aStack v: aVnode
    "Create a new position with the given childIndex and parent stack."
    self
        childIndex := anInt;
        stack :=stack;
        v := v.
</t>
<t tx="ekr.20190225121737.140">def setAllAncestorAtFileNodesDirty(self, setDescendentsDirty=False):

    p = self
    dirtyVnodeList = []
    # Calculate all nodes that are joined to p or parents of such nodes.
    nodes = p.findAllPotentiallyDirtyNodes()
    if setDescendentsDirty:
        # **Important**: only mark _direct_ descendents of nodes.
        # Using the findAllPotentiallyDirtyNodes algorithm would mark way too many nodes.
        for p2 in p.subtree():
            # Only @thin nodes need to be marked.
            if p2.v not in nodes and p2.isAnyAtFileNode():
                    # Bug fix: 2011/07/05: was p2.isAtThinFileNode():
                nodes.append(p2.v)
    dirtyVnodeList = [v for v in nodes
        if not v.isDirty() and v.isAnyAtFileNode()]
    for v in dirtyVnodeList:
        v.setDirty()
    return dirtyVnodeList
</t>
<t tx="ekr.20190225121737.141">def setDirty(self, setDescendentsDirty=True):
    '''
    Mark a node and all ancestor @file nodes dirty.

    **Warning**: p.setDirty() is *expensive* because it calls
    p.setAllAncestorAtFileNodesDirty().

    Usually, code *should* this setter, despite its cost, because it
    update's Leo's outline pane properly. Calling c.redraw() is *not*
    enough.
    '''
    p = self; dirtyVnodeList = []
    if not p.v.isDirty():
        p.v.setDirty()
        dirtyVnodeList.append(p.v)
    # Important: this must be called even if p.v is already dirty.
    # Typing can change the @ignore state!
    dirtyVnodeList2 = p.setAllAncestorAtFileNodesDirty(setDescendentsDirty)
    dirtyVnodeList.extend(dirtyVnodeList2)
    return dirtyVnodeList
</t>
<t tx="ekr.20190225121737.142"></t>
<t tx="ekr.20190225121737.143">def is_at_all(self):
    '''Return True if p.b contains an @all directive.'''
    p = self
    return (
        p.isAnyAtFileNode() and
        any([g.match_word(s, 0, '@all') for s in g.splitLines(p.b)]))

def in_at_all_tree(self):
    '''Return True if p or one of p's ancestors is an @all node.'''
    p = self
    for p in p.self_and_parents(copy=False):
        if p.is_at_all():
            return True
    return False
</t>
<t tx="ekr.20190225121737.144">def is_at_ignore(self):
    '''Return True if p is an @ignore node.'''
    p = self
    return g.match_word(p.h, 0, '@ignore')

def in_at_ignore_tree(self):
    '''Return True if p or one of p's ancestors is an @ignore node.'''
    p = self
    for p in p.self_and_parents(copy=False):
        if g.match_word(p.h, 0, '@ignore'):
            return True
    return False
</t>
<t tx="ekr.20190225121737.145">Object subclass: LeoVnode
    "Vnodes contain all data in Leo."
    instanceVariableNames: 
        'body children fileIndex head iconVal parents', "context"
            "Archived."
        "isCloned isExpanded isMarked isSelected isTop" 
            "Archived bits"
        "isDirty isOrphanBit isRichText isVisited"
            "Not archived bits."
        "'expandedPositions insertSpot scrollBarSpot selectionLength',"
            "Not archived."
    classVariableNames: ''
    package: 'Leo'.

</t>
<t tx="ekr.20190225121737.146">initialize
    super initialize.
    self
        body: '';
        children: OrderedCollection new;
        "gnx: nil;"
        head: 'newHeadline';
        iconVal: 0;
        parents: OrderedCollection new.
        
newNode
    ^ LeoVnode new gnx: NodeIndices newGnx

newNodeWithGnx: aGnx
    ^ LeoVnode new gnx: aGnx
</t>
<t tx="ekr.20190225121737.147">body ^body.

children ^children.

gnx ^gnx.

head ^head.
    
parents ^parents.
</t>
<t tx="ekr.20190225121737.148">body: aString
    body := aString

children: anOrderedCollection
    children := anOrderedCollection
    
insertChild: aVnode at: anInt
    children insert: aVnode at: anInt

gnx: aGnx
    gnx := aGnx

head: aString
    head := aString

parents: anOrderedCollection
    parents := anOrderedCollection
</t>
<t tx="ekr.20190225121737.149"></t>
<t tx="ekr.20190225121737.15">childIndex
    ^childIndex.

stack
    ^stack.

v
    ^v.
</t>
<t tx="ekr.20190225121737.150"></t>
<t tx="ekr.20190225121737.151">def findAtFileName(self, names, h=''):
    '''Return the name following one of the names in nameList or ""'''
    # Allow h argument for unit testing.
    if not h:
        h = self.headString()
    if not g.match(h, 0, '@'):
        return ""
    i = g.skip_id(h, 1, '-')
    word = h[: i]
    if word in names and g.match_word(h, 0, word):
        name = h[i:].strip()
        return name
    else:
        return ""
</t>
<t tx="ekr.20190225121737.152">def anyAtFileNodeName(self):
    """Return the file name following an @file node or an empty string."""
    return (
        self.findAtFileName(g.app.atAutoNames) or
        self.findAtFileName(g.app.atFileNames))
</t>
<t tx="ekr.20190225121737.153"># These return the filename following @xxx, in v.headString.
# Return the the empty string if v is not an @xxx node.

def atAutoNodeName(self, h=None):
    return self.findAtFileName(g.app.atAutoNames, h=h)
# Retain this special case as part of the "escape hatch".
# That is, we fall back on code in leoRst.py if no
# importer or writer for reStructuredText exists.

def atAutoRstNodeName(self, h=None):
    names = ("@auto-rst",)
    return self.findAtFileName(names, h=h)

def atCleanNodeName(self):
    names = ("@clean",)
    return self.findAtFileName(names)

def atEditNodeName(self):
    names = ("@edit",)
    return self.findAtFileName(names)

def atFileNodeName(self):
    names = ("@file", "@thin")
        # Fix #403.
    return self.findAtFileName(names)

def atNoSentinelsFileNodeName(self):
    names = ("@nosent", "@file-nosent",)
    return self.findAtFileName(names)

def atRstFileNodeName(self):
    names = ("@rst",)
    return self.findAtFileName(names)

def atShadowFileNodeName(self):
    names = ("@shadow",)
    return self.findAtFileName(names)

def atSilentFileNodeName(self):
    names = ("@asis", "@file-asis",)
    return self.findAtFileName(names)

def atThinFileNodeName(self):
    names = ("@thin", "@file-thin",)
    return self.findAtFileName(names)
# New names, less confusing

atNoSentFileNodeName = atNoSentinelsFileNodeName
atAsisFileNodeName = atSilentFileNodeName
</t>
<t tx="ekr.20190225121737.154">def isAtAllNode(self):
    """Returns True if the receiver contains @others in its body at the start of a line."""
    flag, i = g.is_special(self._bodyString, "@all")
    return flag
</t>
<t tx="ekr.20190225121737.155">def isAnyAtFileNode(self):
    """Return True if v is any kind of @file or related node."""
    # This routine should be as fast as possible.
    # It is called once for every VNode when writing a file.
    h = self.headString()
    return h and h[0] == '@' and self.anyAtFileNodeName()
</t>
<t tx="ekr.20190225121737.156">def isAtAutoNode(self):
    return bool(self.atAutoNodeName())

def isAtAutoRstNode(self):
    return bool(self.atAutoRstNodeName())

def isAtCleanNode(self):
    return bool(self.atCleanNodeName())

def isAtEditNode(self):
    return bool(self.atEditNodeName())

def isAtFileNode(self):
    return bool(self.atFileNodeName())

def isAtRstFileNode(self):
    return bool(self.atRstFileNodeName())

def isAtNoSentinelsFileNode(self):
    return bool(self.atNoSentinelsFileNodeName())

def isAtSilentFileNode(self): # @file-asis
    return bool(self.atSilentFileNodeName())

def isAtShadowFileNode(self):
    return bool(self.atShadowFileNodeName())

def isAtThinFileNode(self):
    return bool(self.atThinFileNodeName())
# New names, less confusing:

isAtNoSentFileNode = isAtNoSentinelsFileNode
isAtAsisFileNode = isAtSilentFileNode
</t>
<t tx="ekr.20190225121737.157">def isAtIgnoreNode(self):
    """Returns True if the receiver contains @ignore in its body at the start of a line.

    or if the headline starts with @ignore."""
    # v = self
    # 2011/10/08: honor @ignore in headlines.  Sheesh.
    if g.match_word(self._headString, 0, '@ignore'):
        return True
    else:
        flag, i = g.is_special(self._bodyString, "@ignore")
        return flag
</t>
<t tx="ekr.20190225121737.158">def isAtOthersNode(self):
    """Returns True if the receiver contains @others in its body at the start of a line."""
    flag, i = g.is_special(self._bodyString, "@others")
    return flag
</t>
<t tx="ekr.20190225121737.159">def matchHeadline(self, pattern):
    """Returns True if the headline matches the pattern ignoring whitespace and case.

    The headline may contain characters following the successfully matched pattern."""
    v = self
    h = g.toUnicode(v.headString())
    h = h.lower().replace(' ', '').replace('\t', '')
    h = h.lstrip('.') # 2013/04/05. Allow leading period before section names.
    pattern = g.toUnicode(pattern)
    pattern = pattern.lower().replace(' ', '').replace('\t', '')
    return h.startswith(pattern)
</t>
<t tx="ekr.20190225121737.16">childIndex: anInt
    childIndex := anInt.

stack: anOrderedCollection
    stack := anOrderedCollection.

v: aVnode
    v := aVnode.
</t>
<t tx="ekr.20190225121737.160">def copyTree(self, copyMarked=False):
    '''
    Return an all-new tree of vnodes that are copies of self and all its
    descendants.

    **Important**: the v.parents ivar must be [] for all nodes.
    v._addParentLinks will set all parents.
    '''
    v = self
    # Allocate a new vnode and gnx with empty children &amp; parents.
    v2 = VNode(context=v.context, gnx=None)
    assert v2.parents == [], v2.parents
    assert v2.gnx
    assert v.gnx != v2.gnx
    # Copy vnode fields. Do **not** set v2.parents.
    v2._headString = g.toUnicode(v._headString, reportErrors=True) # 2017/01/24
    v2._bodyString = g.toUnicode(v._bodyString, reportErrors=True) # 2017/01/24
    v2.u = copy.deepcopy(v.u)
    if copyMarked and v.isMarked():
        v2.setMarked()
    # Recursively copy all descendant vnodes.
    for child in v.children:
        v2.children.append(child.copyTree(copyMarked))
    return v2
</t>
<t tx="ekr.20190225121737.161"></t>
<t tx="ekr.20190225121737.162">body_unicode_warning = False

def bodyString(self):
    # This message should never be printed and we want to avoid crashing here!
    if g.isUnicode(self._bodyString):
        return self._bodyString
    else:
        if not self.body_unicode_warning:
            self.body_unicode_warning = True
            g.internalError('not unicode:', repr(self._bodyString), self._headString)
        return g.toUnicode(self._bodyString)

getBody = bodyString
    # Deprecated, but here for compatibility.
</t>
<t tx="ekr.20190225121737.163"></t>
<t tx="ekr.20190225121737.164">def firstChild(self):
    v = self
    return v.children and v.children[0]
</t>
<t tx="ekr.20190225121737.165">def hasChildren(self):
    v = self
    return len(v.children) &gt; 0

hasFirstChild = hasChildren
</t>
<t tx="ekr.20190225121737.166">def lastChild(self):
    v = self
    return v.children[-1] if v.children else None
</t>
<t tx="ekr.20190225121737.167"># childIndex and nthChild are zero-based.

def nthChild(self, n):
    v = self
    if 0 &lt;= n &lt; len(v.children):
        return v.children[n]
    else:
        return None
</t>
<t tx="ekr.20190225121737.168">def numberOfChildren(self):
    v = self
    return len(v.children)
</t>
<t tx="ekr.20190225121737.169">def directParents(self):
    """(New in 4.2) Return a list of all direct parent vnodes of a VNode.

    This is NOT the same as the list of ancestors of the VNode."""
    v = self
    return v.parents
</t>
<t tx="ekr.20190225121737.17"></t>
<t tx="ekr.20190225121737.170">def hasBody(self):
    '''Return True if this VNode contains body text.'''
    s = self._bodyString
    return s and len(s) &gt; 0
</t>
<t tx="ekr.20190225121737.171">head_unicode_warning = False

def headString(self):
    """Return the headline string."""
    # This message should never be printed and we want to avoid crashing here!
    if not g.isString(self._headString):
        if not self.head_unicode_warning:
            self.head_unicode_warning = True
            g.internalError('not a string', repr(self._headString))
    # Make _sure_ we return a unicode string.
    return g.toUnicode(self._headString)

def cleanHeadString(self):
    s = self._headString
    if g.isPython3:
        return s
    else:
        return g.toEncodedString(s, "ascii") # Replaces non-ascii characters by '?'
</t>
<t tx="ekr.20190225121737.172">def isNthChildOf(self, n, parent_v):
    '''Return True if v is the n'th child of parent_v.'''
    v = self
    children = parent_v and parent_v.children
    return children and 0 &lt;= n &lt; len(children) and children[n] == v
</t>
<t tx="ekr.20190225121737.173"></t>
<t tx="ekr.20190225121737.174">def isCloned(self):
    return len(self.parents) &gt; 1
</t>
<t tx="ekr.20190225121737.175">def isDirty(self):
    return (self.statusBits &amp; self.dirtyBit) != 0
</t>
<t tx="ekr.20190225121737.176">def isMarked(self):
    return (self.statusBits &amp; VNode.markedBit) != 0
</t>
<t tx="ekr.20190225121737.177">def isOrphan(self):
    return (self.statusBits &amp; VNode.orphanBit) != 0
</t>
<t tx="ekr.20190225121737.178">def isSelected(self):
    return (self.statusBits &amp; VNode.selectedBit) != 0
</t>
<t tx="ekr.20190225121737.179">def isTopBitSet(self):
    return (self.statusBits &amp; self.topBit) != 0
</t>
<t tx="ekr.20190225121737.18"></t>
<t tx="ekr.20190225121737.180">def isVisited(self):
    return (self.statusBits &amp; VNode.visitedBit) != 0
</t>
<t tx="ekr.20190225121737.181">def isWriteBit(self):
    v = self
    return (v.statusBits &amp; v.writeBit) != 0
</t>
<t tx="ekr.20190225121737.182">def status(self):
    return self.statusBits
</t>
<t tx="ekr.20190225121737.183"></t>
<t tx="ekr.20190225121737.184"></t>
<t tx="ekr.20190225121737.185">def clearDirty(self):
    '''Clear the vnode dirty bit.'''
    v = self
    v.statusBits &amp;= ~v.dirtyBit
</t>
<t tx="ekr.20190225121737.186">def findAllPotentiallyDirtyNodes(self):

    v = self; c = v.context
    # Set the starting nodes.
    nodes = []
    newNodes = [v]
    # Add nodes until no more are added.
    while newNodes:
        addedNodes = []
        nodes.extend(newNodes)
        for v in newNodes:
            for v2 in v.parents:
                if v2 not in nodes and v2 not in addedNodes:
                    addedNodes.append(v2)
        newNodes = addedNodes[:]
    # Remove the hidden VNode.
    if c.hiddenRootNode in nodes:
        nodes.remove(c.hiddenRootNode)
    return nodes
</t>
<t tx="ekr.20190225121737.187"># Unlike p.setAllAncestorAtFileNodesDirty,
# there is no setDescendentsDirty arg.

def setAllAncestorAtFileNodesDirty(self):

    v = self
    dirtyVnodeList = []
    # Calculate all nodes that are joined to p or parents of such nodes.
    nodes = v.findAllPotentiallyDirtyNodes()
    dirtyVnodeList = [v for v in nodes
        if not v.isDirty() and v.isAnyAtFileNode()]
    for v in dirtyVnodeList:
        v.setDirty() # Do not call p.setDirty here!
    return dirtyVnodeList
</t>
<t tx="ekr.20190225121737.188">def setDirty(self):
    '''Set the vnode dirty bit.'''
    self.statusBits |= self.dirtyBit
</t>
<t tx="ekr.20190225121737.189"></t>
<t tx="ekr.20190225121737.19">initialize '(self, v, childIndex=0, stack=None)'
    "Create a new position with the given childIndex and parent stack."
    self._childIndex = childIndex
    self.v = v
    "stack entries are tuples (v,childIndex)"
    if stack:
        self.stack = stack[:] # Creating a copy here is safest and best.
    else:
        self.stack = []
    g.app.positions += 1
</t>
<t tx="ekr.20190225121737.190">def clearClonedBit(self):
    self.statusBits &amp;= ~self.clonedBit
</t>
<t tx="ekr.20190225121737.191">def clearMarked(self):
    self.statusBits &amp;= ~self.markedBit
</t>
<t tx="ekr.20190225121737.192">def clearWriteBit(self):
    self.statusBits &amp;= ~self.writeBit
</t>
<t tx="ekr.20190225121737.193">def clearOrphan(self):
    # if self.h.startswith('@file'): g.trace(self.h,g.callers())
    self.statusBits &amp;= ~self.orphanBit
</t>
<t tx="ekr.20190225121737.194">def clearVisited(self):
    self.statusBits &amp;= ~self.visitedBit
</t>
<t tx="ekr.20190225121737.195">def contract(self):
    '''Contract the node.'''
    self.statusBits &amp;= ~self.expandedBit

def expand(self):
    '''Expand the node.'''
    self.statusBits |= self.expandedBit

def initExpandedBit(self):
    '''Init self.statusBits.'''
    self.statusBits |= self.expandedBit

def isExpanded(self):
    '''Return True if the VNode expansion bit is set.'''
    return (self.statusBits &amp; self.expandedBit) != 0
</t>
<t tx="ekr.20190225121737.196">def initStatus(self, status):
    self.statusBits = status
</t>
<t tx="ekr.20190225121737.197">def setClonedBit(self):
    self.statusBits |= self.clonedBit

def initClonedBit(self, val):
    if val:
        self.statusBits |= self.clonedBit
    else:
        self.statusBits &amp;= ~self.clonedBit
</t>
<t tx="ekr.20190225121737.198">def setMarked(self):
    self.statusBits |= self.markedBit

def initMarkedBit(self):
    self.statusBits |= self.markedBit
</t>
<t tx="ekr.20190225121737.199">def setOrphan(self):
    '''Set the vnode's orphan bit.'''
    self.statusBits |= self.orphanBit
</t>
<t tx="ekr.20190225121737.2">Object subclass: #LeoNodeIndices
    "A class managing global node indices (gnx's)."
    instanceVariableNames: 'defaultId lastIndex stack timeString userId'
    classVariableNames: 'totalIndices'
    package: 'Leo'.

initialize id: aUserId
    "A class returning gnx's for the given user"
    super initialize.
    self
        lastIndex: 0;
        timeString: self timeString:; "### valid to use self??"
        userId: aUserId.

lastIndex
    ^lastIndex

userid
    ^userId

userId: anId;

timeString:
    ^ 'a dummy timestamp' "###"
</t>
<t tx="ekr.20190225121737.20">def __eq__(self, p2):
    """Return True if two positions are equivalent."""
    p1 = self
    # Don't use g.trace: it might call p.__eq__ or p.__ne__.
    if not isinstance(p2, Position):
        return False
    if p2 is None or p2.v is None:
        return p1.v is None
    elif isinstance(p2, self.__class__):
        return (p1.v == p2.v and
            p1._childIndex == p2._childIndex and
            p1.stack == p2.stack)
    else:
        # Do this only after testing for None.
        return NotImplemented

def __ne__(self, p2):
    """Return True if two postions are not equivalent."""
    return not self.__eq__(p2) # For possible use in Python 2.x.
</t>
<t tx="ekr.20190225121737.200"># This only sets the selected bit.

def setSelected(self):
    self.statusBits |= self.selectedBit
</t>
<t tx="ekr.20190225121737.201"># Compatibility routine for scripts

def setVisited(self):
    self.statusBits |= self.visitedBit
</t>
<t tx="ekr.20190225121737.202">def setWriteBit(self):
    self.statusBits |= self.writeBit
</t>
<t tx="ekr.20190225121737.203">def childrenModified(self):
    g.childrenModifiedSet.add(self)
</t>
<t tx="ekr.20190225121737.204">def computeIcon(self):
    val = 0; v = self
    if v.hasBody(): val += 1
    if v.isMarked(): val += 2
    if v.isCloned(): val += 4
    if v.isDirty(): val += 8
    return val

def setIcon(self):
    pass # Compatibility routine for old scripts
</t>
<t tx="ekr.20190225121737.205">def contentModified(self):
    g.contentModifiedSet.add(self)
</t>
<t tx="ekr.20190225121737.206"># Called only by LeoTree.selectHelper.

def restoreCursorAndScroll(self):
    '''Restore the cursor position and scroll so it is visible.'''
    traceTime = False and not g.unitTesting
    v = self
    ins = v.insertSpot
    # start, n = v.selectionStart, v.selectionLength
    spot = v.scrollBarSpot
    body = self.context.frame.body
    w = body.wrapper
    # Fix bug 981849: incorrect body content shown.
    if ins is None: ins = 0
    # This is very expensive for large text.
    if traceTime: t1 = time.time()
    if hasattr(body.wrapper, 'setInsertPoint'):
        w.setInsertPoint(ins)
    if traceTime:
        delta_t = time.time() - t1
        if delta_t &gt; 0.1: g.trace('%2.3f sec' % (delta_t))
    # Override any changes to the scrollbar setting that might
    # have been done above by w.setSelectionRange or w.setInsertPoint.
    if spot is not None:
        w.setYScrollPosition(spot)
        v.scrollBarSpot = spot
    # Never call w.see here.
</t>
<t tx="ekr.20190225121737.207">def saveCursorAndScroll(self):

    v = self; c = v.context
    w = c.frame.body
    if not w:
        return
    try:
        v.scrollBarSpot = w.getYScrollPosition()
        v.insertSpot = w.getInsertPoint()
    except AttributeError:
        # 2011/03/21: w may not support the high-level interface.
        pass
</t>
<t tx="ekr.20190225121737.208">unicode_warning_given = False

def setBodyString(self, s):
    v = self
    if g.isUnicode(s):
        v._bodyString = s
    else:
        try:
            v._bodyString = g.toUnicode(s, reportErrors=True)
        except Exception:
            if not self.unicode_warning_given:
                self.unicode_warning_given = True
                g.internalError(s)
                g.es_exception()
    sig.emit(self.context, 'body_changed', self)

def setHeadString(self, s):
    # Fix bug: https://bugs.launchpad.net/leo-editor/+bug/1245535
    # API allows headlines to contain newlines.
    v = self
    if g.isUnicode(s):
        v._headString = s.replace('\n','')
    else:
        try:
            s = g.toUnicode(s, reportErrors=True)
            v._headString = s.replace('\n','')
        except Exception:
            if not self.unicode_warning_given:
                self.unicode_warning_given = True
                g.internalError(s)
                g.es_exception()

initBodyString = setBodyString
initHeadString = setHeadString
setHeadText = setHeadString
setTnodeText = setBodyString
</t>
<t tx="ekr.20190225121737.209">def setSelection(self, start, length):
    v = self
    v.selectionStart = start
    v.selectionLength = length
</t>
<t tx="ekr.20190225121737.21">def __ge__(self, other):
    return self.__eq__(other) or self.__gt__(other)

def __le__(self, other):
    return self.__eq__(other) or self.__lt__(other)

def __lt__(self, other):
    return not self.__eq__(other) and not self.__gt__(other)
</t>
<t tx="ekr.20190225121737.210">def cloneAsNthChild(self, parent_v, n):
    # Does not check for illegal clones!
    v = self
    v._linkAsNthChild(parent_v, n)
    return v

def insertAsFirstChild(self):
    v = self
    return v.insertAsNthChild(0)

def insertAsLastChild(self):
    v = self
    return v.insertAsNthChild(len(v.children))

def insertAsNthChild(self, n):
    v = self
    assert 0 &lt;= n &lt;= len(v.children)
    v2 = VNode(v.context)
    v2._linkAsNthChild(v, n)
    assert v.children[n] == v2
    return v2
</t>
<t tx="ekr.20190225121737.211"></t>
<t tx="ekr.20190225121737.212">def _addCopiedLink(self, childIndex, parent_v):
    '''Adjust links after adding a link to v.'''
    v = self
    v.context.frame.tree.generation += 1
    parent_v.childrenModified()
        # For a plugin.
    # Update parent_v.children &amp; v.parents.
    parent_v.children.insert(childIndex, v)
    v.parents.append(parent_v)
    # Set zodb changed flags.
    v._p_changed = 1
    parent_v._p_changed = 1
</t>
<t tx="ekr.20190225121737.213">def _addLink(self, childIndex, parent_v):
    '''Adjust links after adding a link to v.'''
    v = self
    v.context.frame.tree.generation += 1
    parent_v.childrenModified()
        # For a plugin.
    # Update parent_v.children &amp; v.parents.
    parent_v.children.insert(childIndex, v)
    v.parents.append(parent_v)
    # Set zodb changed flags.
    v._p_changed = 1
    parent_v._p_changed = 1
    # If v has only one parent, we adjust all
    # the parents links in the descendant tree.
    # This handles clones properly when undoing a delete.
    if len(v.parents) == 1:
        for child in v.children:
            child._addParentLinks(parent=v)
</t>
<t tx="ekr.20190225121737.214">def _addParentLinks(self, parent):

    v = self
    v.parents.append(parent)
    if len(v.parents) == 1:
        for child in v.children:
            child._addParentLinks(parent=v)
</t>
<t tx="ekr.20190225121737.215">def _cutLink(self, childIndex, parent_v):
    '''Adjust links after cutting a link to v.'''
    v = self
    v.context.frame.tree.generation += 1
    parent_v.childrenModified()
    assert parent_v.children[childIndex] == v
    del parent_v.children[childIndex]
    if parent_v in v.parents:
        try:
            v.parents.remove(parent_v)
        except ValueError:
            g.internalError('%s not in parents of %s' % (parent_v, v))
            g.trace('v.parents:')
            g.printObj(v.parents)
    v._p_changed = 1
    parent_v._p_changed = 1
    # If v has no more parents, we adjust all
    # the parent links in the descendant tree.
    # This handles clones properly when deleting a tree.
    if not v.parents:
        for child in v.children:
            child._cutParentLinks(parent=v)
</t>
<t tx="ekr.20190225121737.216">def _cutParentLinks(self, parent):

    v = self
    v.parents.remove(parent)
    if not v.parents:
        for child in v.children:
            child._cutParentLinks(parent=v)
</t>
<t tx="ekr.20190225121737.217">def _deleteAllChildren(self):
    '''
    Delete all children of self.
    
    This is a low-level method, used by the read code.
    It is not intended as a general replacement for p.doDelete().
    '''
    v = self
    for v2 in v.children:
        try:
            v2.parents.remove(v)
        except ValueError:
            g.internalError('%s not in parents of %s' % (v, v2))
            g.trace('v2.parents:')
            g.printObj(v2.parents)
    v.children = []
</t>
<t tx="ekr.20190225121737.218">def _linkAsNthChild(self, parent_v, n):
    """Links self as the n'th child of VNode pv"""
    v = self # The child node.
    v._addLink(n, parent_v)
</t>
<t tx="ekr.20190225121737.219"></t>
<t tx="ekr.20190225121737.22">def __gt__(self, other):
    '''Return True if self appears after other in outline order.'''
    stack1, stack2 = self.stack, other.stack
    n1, n2 = len(stack1), len(stack2); n = min(n1, n2)
    # Compare the common part of the stacks.
    for item1, item2 in zip(stack1, stack2):
        v1, x1 = item1; v2, x2 = item2
        if x1 &gt; x2: return True
        elif x1 &lt; x2: return False
    # Finish the comparison.
    if n1 == n2:
        x1, x2 = self._childIndex, other._childIndex
        return x1 &gt; x2
    elif n1 &lt; n2:
        x1 = self._childIndex; v2, x2 = other.stack[n]
        return x1 &gt; x2
    else: # n1 &gt; n2
        # 2011/07/28: Bug fix suggested by SegundoBob.
        x1 = other._childIndex; v2, x2 = self.stack[n]
        return x2 &gt;= x1
</t>
<t tx="ekr.20190225121737.220">def __get_b(self):
    v = self
    return v.bodyString()

def __set_b(self, val):
    v = self
    v.setBodyString(val)

b = property(
    __get_b, __set_b,
    doc="VNode body string property")
</t>
<t tx="ekr.20190225121737.221">def __get_h(self):
    v = self
    return v.headString()

def __set_h(self, val):
    v = self
    v.setHeadString(val)

h = property(
    __get_h, __set_h,
    doc="VNode headline string property")
</t>
<t tx="ekr.20190225121737.222">def __get_u(self):
    v = self
    # Wrong: return getattr(v, 'unknownAttributes', {})
    # It is does not set v.unknownAttributes, which can cause problems.
    if not hasattr(v, 'unknownAttributes'):
        v.unknownAttributes = {}
    return v.unknownAttributes

def __set_u(self, val):
    v = self
    if val is None:
        if hasattr(v, 'unknownAttributes'):
            delattr(v, 'unknownAttributes')
    elif isinstance(val, dict):
        v.unknownAttributes = val
    else:
        raise ValueError

u = property(
    __get_u, __set_u,
    doc="VNode u property")
</t>
<t tx="ekr.20190225121737.223">def __get_gnx(self):
    v = self
    return v.fileIndex

gnx = property(
    __get_gnx, # __set_gnx,
    doc="VNode gnx property")
</t>
<t tx="ekr.20190225121737.23"># No longer used.  All code must now be aware of the one-node world.
# def __getattr__ (self,attr):
    # """Convert references to p.t into references to p.v."""
    # if attr=="t":
        # return self.v
    # else:
        # # New in 4.3: _silently_ raise the attribute error.
        # # This allows plugin code to use hasattr(p,attr) !
        # if 0:
            # print("unknown position attribute: %s" % attr)
            # import traceback ; traceback.print_stack()
        # raise AttributeError(attr)
</t>
<t tx="ekr.20190225121737.24">@
Tests such as 'if p' or 'if not p' are the _only_ correct ways to test
whether a position p is valid. In particular, tests like 'if p is
None' or 'if p is not None' will not work properly.
@c
if g.isPython3:

    def __bool__(self):
        """Return True if a position is valid."""
        # Tracing this appears to cause unbounded prints.
        # print("__bool__",self.v and self.v.cleanHeadString())
        return self.v is not None

else:

    def __nonzero__(self):
        """Return True if a position is valid."""
        return self.v is not None
</t>
<t tx="ekr.20190225121737.25">def __str__(self):
    p = self
    if p.v:
        return "&lt;pos %d childIndex: %d lvl: %d key: %s %s&gt;" % (
            id(p), p._childIndex, p.level(), p.key(), p.cleanHeadString())
    else:
        return "&lt;pos %d [%d] None&gt;" % (id(p), len(p.stack))

__repr__ = __str__
</t>
<t tx="ekr.20190225121737.26">def archivedPosition(self, root_p=None):
    '''Return a representation of a position suitable for use in .leo files.'''
    p = self
    if root_p is None:
        aList = [z._childIndex for z in p.self_and_parents()]
    else:
        aList = []
        for z in p.self_and_parents(copy=False):
            if z == root_p:
                aList.append(0)
                break
            else:
                aList.append(z._childIndex)
    aList.reverse()
    return aList
</t>
<t tx="ekr.20190225121737.27">def dumpLink(self, link):
    return link if link else "&lt;none&gt;"

def dump(self, label=""):
    p = self
    if p.v:
        p.v.dump() # Don't print a label
</t>
<t tx="ekr.20190225121737.28">def key(self):
    p = self
    # For unified nodes we must include a complete key,
    # so we can distinguish between clones.
    result = []
    for z in p.stack:
        v, childIndex = z
        result.append('%s:%s' % (id(v), childIndex))
    result.append('%s:%s' % (id(p.v), p._childIndex))
    return '.'.join(result)

def sort_key(self, p):
    return [int(s.split(':')[1]) for s in p.key().split('.')]
# This has makes positions hashable, at long long last.

#def __hash__(self):
#    return sum([z[1] for z in self.stack])
__hash__ = None
</t>
<t tx="ekr.20190225121737.29">@
- convertTreeToString and moreHead can't be VNode methods because they uses level().
- moreBody could be anywhere: it may as well be a postion method.
</t>
<t tx="ekr.20190225121737.3"></t>
<t tx="ekr.20190225121737.30">def convertTreeToString(self):
    """Convert a positions  suboutline to a string in MORE format."""
    p = self; level1 = p.level()
    array = []
    for p in p.self_and_subtree(copy=False):
        array.append(p.moreHead(level1) + '\n')
        body = p.moreBody()
        if body:
            array.append(body + '\n')
    return ''.join(array)
</t>
<t tx="ekr.20190225121737.31">def moreHead(self, firstLevel, useVerticalBar=False):
    """Return the headline string in MORE format."""
    # useVerticalBar is unused, but it would be useful in over-ridden methods.
    p = self
    level = self.level() - firstLevel
    plusMinus = "+" if p.hasChildren() else "-"
    return "%s%s %s" % ('\t' * level, plusMinus, p.h)
</t>
<t tx="ekr.20190225121737.32">@
    + test line
    - test line
    \ test line
    test line +
    test line -
    test line \
    More lines...
@c

def moreBody(self):
    """Returns the body string in MORE format.

    Inserts a backslash before any leading plus, minus or backslash."""
    p = self; array = []
    lines = p.b.split('\n')
    for s in lines:
        i = g.skip_ws(s, 0)
        if i &lt; len(s) and s[i] in ('+', '-', '\\'):
            s = s[: i] + '\\' + s[i:]
        array.append(s)
    return '\n'.join(array)
</t>
<t tx="ekr.20190225121737.33"></t>
<t tx="ekr.20190225121737.34">def children(self, copy=True):
    '''Yield all child positions of p.'''
    p = self
    p = p.firstChild()
    while p:
        yield p.copy() if copy else p
        p.moveToNext()

# Compatibility with old code...
children_iter = children
</t>
<t tx="ekr.20190225121737.35">def following_siblings(self, copy=True):
    '''Yield all siblings positions that follow p, not including p.'''
    p = self
    p = p.next()
    while p:
        yield p.copy() if copy else p
        p.moveToNext()

# Compatibility with old code...
following_siblings_iter = following_siblings
</t>
<t tx="ekr.20190225121737.36">def nearest_roots(self, copy=True, predicate=None):
    '''
    A generator yielding all the root positions "near" p1 = self that
    satisfy the given predicate. p.isAnyAtFileNode is the default
    predicate.

    The search first proceeds up the p's tree. If a root is found, this
    generator yields just that root.

    Otherwise, the generator yields all nodes in p.subtree() that satisfy
    the predicate. Once a root is found, the generator skips its subtree.
    '''
    if predicate is None:

        # pylint: disable=function-redefined
        def predicate(p):
            return p.isAnyAtFileNode()

    # First, look up the tree.
    p1 = self
    for p in p1.self_and_parents(copy=False):
        if predicate(p):
            yield p.copy() if copy else p
            return
    # Next, look for all .md files in the tree.
    after = p1.nodeAfterTree()
    p = p1
    while p and p != after:
        if predicate(p):
            yield p.copy() if copy else p
            p.moveToNodeAfterTree()
        else:
            p.moveToThreadNext()

</t>
<t tx="ekr.20190225121737.37">def nearest_unique_roots(self, copy=True, predicate=None):
    '''
    A generator yielding all unique root positions "near" p1 = self that
    satisfy the given predicate. p.isAnyAtFileNode is the default
    predicate.

    The search first proceeds up the p's tree. If a root is found, this
    generator yields just that root.

    Otherwise, the generator yields all unique nodes in p.subtree() that
    satisfy the predicate. Once a root is found, the generator skips its
    subtree.
    '''
    if predicate is None:

        # pylint: disable=function-redefined
        def predicate(p):
            return p.isAnyAtFileNode()

    # First, look up the tree.
    p1 = self
    for p in p1.self_and_parents(copy=False):
        if predicate(p):
            yield p.copy() if copy else p
            return
    # Next, look for all unique .md files in the tree.
    seen = set()
    after = p1.nodeAfterTree()
    p = p1
    while p and p != after:
        if predicate(p):
            if p.v not in seen:
                seen.add(p.v)
                yield p.copy() if copy else p
            p.moveToNodeAfterTree()
        else:
            p.moveToThreadNext()

nearest = nearest_unique_roots
</t>
<t tx="ekr.20190225121737.38">def nodes(self):
    '''Yield p.v and all vnodes in p's subtree.'''
    p = self
    p = p.copy()
    after = p.nodeAfterTree()
    while p and p != after: # bug fix: 2013/10/12
        yield p.v
        p.moveToThreadNext()
# Compatibility with old code.

tnodes_iter = nodes
vnodes_iter = nodes
</t>
<t tx="ekr.20190225121737.39">def parents(self, copy=True):
    '''Yield all parent positions of p.'''
    p = self
    p = p.parent()
    while p:
        yield p.copy() if copy else p
        p.moveToParent()

# Compatibility with old code...
parents_iter = parents
</t>
<t tx="ekr.20190225121737.4">def check_gnx(self, c, gnx, v):
    '''Check that no vnode exists with the given gnx in fc.gnxDict.'''
    fc = c.fileCommands
    if gnx == 'hidden-root-vnode-gnx':
        # No longer an error.
        # fast.readWithElementTree always generates a nominal hidden vnode.
        return 
    v2 = fc.gnxDict.get(gnx)
    if v2 and v2 != v:
        g.internalError(
            'getNewIndex: gnx clash %s\n v: %s\nv2: %s' % (gnx, v, v2))
</t>
<t tx="ekr.20190225121737.40">def self_and_parents(self, copy=True):
    '''Yield p and all parent positions of p.'''
    p = self
    p = p.copy()
    while p:
        yield p.copy() if copy else p
        p.moveToParent()

# Compatibility with old code...
self_and_parents_iter = self_and_parents
</t>
<t tx="ekr.20190225121737.41">def self_and_siblings(self, copy=True):
    '''Yield all sibling positions of p including p.'''
    p = self
    p = p.copy()
    while p.hasBack():
        p.moveToBack()
    while p:
        yield p.copy() if copy else p
        p.moveToNext()

# Compatibility with old code...
self_and_siblings_iter = self_and_siblings
</t>
<t tx="ekr.20190225121737.42">def self_and_subtree(self, copy=True):
    '''Yield p and all positions in p's subtree.'''
    p = self
    p = p.copy()
    after = p.nodeAfterTree()
    while p and p != after:
        yield p.copy() if copy else p
        p.moveToThreadNext()

# Compatibility with old code...
self_and_subtree_iter = self_and_subtree
</t>
<t tx="ekr.20190225121737.43">def subtree(self, copy=True):
    '''Yield all positions in p's subtree, but not p.'''
    p = self
    p = p.copy()
    after = p.nodeAfterTree()
    p.moveToThreadNext()
    while p and p != after:
        yield p.copy() if copy else p
        p.moveToThreadNext()

# Compatibility with old code...
subtree_iter = subtree
</t>
<t tx="ekr.20190225121737.44">def unique_nodes(self):
    '''Yield p.v and all unique vnodes in p's subtree.'''
    p = self
    seen = set()
    for p in p.self_and_subtree(copy=False):
        if p.v not in seen:
            seen.add(p.v)
            yield p.v
# Compatibility with old code.

unique_tnodes_iter = unique_nodes
unique_vnodes_iter = unique_nodes
</t>
<t tx="ekr.20190225121737.45">def unique_subtree(self, copy=True):
    '''Yield p and all other unique positions in p's subtree.'''
    p = self
    seen = set()
    for p in p.subtree():
        if p.v not in seen:
            seen.add(p.v)
            # Fixed bug 1255208: p.unique_subtree returns vnodes, not positions.
            yield p.copy() if copy else p

# Compatibility with old code...
subtree_with_unique_tnodes_iter = unique_subtree
subtree_with_unique_vnodes_iter = unique_subtree
</t>
<t tx="ekr.20190225121737.46"></t>
<t tx="ekr.20190225121737.47"></t>
<t tx="ekr.20190225121737.48">def anyAtFileNodeName(self): return self.v.anyAtFileNodeName()

def atAutoNodeName(self): return self.v.atAutoNodeName()

def atCleanNodeName(self): return self.v.atCleanNodeName()

def atEditNodeName(self): return self.v.atEditNodeName()

def atFileNodeName(self): return self.v.atFileNodeName()

def atNoSentinelsFileNodeName(self): return self.v.atNoSentinelsFileNodeName()
# def atRawFileNodeName         (self): return self.v.atRawFileNodeName()

def atShadowFileNodeName(self): return self.v.atShadowFileNodeName()

def atSilentFileNodeName(self): return self.v.atSilentFileNodeName()

def atThinFileNodeName(self): return self.v.atThinFileNodeName()
# New names, less confusing
atNoSentFileNodeName = atNoSentinelsFileNodeName
atAsisFileNodeName = atSilentFileNodeName

def isAnyAtFileNode(self): return self.v.isAnyAtFileNode()

def isAtAllNode(self): return self.v.isAtAllNode()

def isAtAutoNode(self): return self.v.isAtAutoNode()

def isAtAutoRstNode(self): return self.v.isAtAutoRstNode()

def isAtCleanNode(self): return self.v.isAtCleanNode()

def isAtEditNode(self): return self.v.isAtEditNode()

def isAtFileNode(self): return self.v.isAtFileNode()

def isAtIgnoreNode(self): return self.v.isAtIgnoreNode()

def isAtNoSentinelsFileNode(self): return self.v.isAtNoSentinelsFileNode()

def isAtOthersNode(self): return self.v.isAtOthersNode()

def isAtRstFileNode(self): return self.v.isAtRstFileNode()

def isAtSilentFileNode(self): return self.v.isAtSilentFileNode()

def isAtShadowFileNode(self): return self.v.isAtShadowFileNode()

def isAtThinFileNode(self): return self.v.isAtThinFileNode()
# New names, less confusing:
isAtNoSentFileNode = isAtNoSentinelsFileNode
isAtAsisFileNode = isAtSilentFileNode
# Utilities.

def matchHeadline(self, pattern): return self.v.matchHeadline(pattern)
</t>
<t tx="ekr.20190225121737.49">def bodyString(self):
    return self.v.bodyString()

def headString(self):
    return self.v.headString()

def cleanHeadString(self):
    return self.v.cleanHeadString()
</t>
<t tx="ekr.20190225121737.5">def compute_last_index(self, c):
    '''Scan the entire leo outline to compute ni.last_index.'''
    ni = self
    # Partial, experimental, fix for #658.
    # Do not change self.lastIndex here!
        # self.lastIndex = 0
    for v in c.all_unique_nodes():
        gnx = v.fileIndex
        if gnx:
            id_, t, n = self.scanGnx(gnx)
            if t == ni.timeString and n is not None:
                try:
                    n = int(n)
                    self.lastIndex = max(self.lastIndex, n)
                except Exception:
                    g.es_exception()
                    self.lastIndex += 1
</t>
<t tx="ekr.20190225121737.50">def isDirty(self): return self.v.isDirty()

def isMarked(self): return self.v.isMarked()

def isOrphan(self): return self.v.isOrphan()

def isSelected(self): return self.v.isSelected()

def isTopBitSet(self): return self.v.isTopBitSet()

def isVisited(self): return self.v.isVisited()

def status(self): return self.v.status()
</t>
<t tx="ekr.20190225121737.51"></t>
<t tx="ekr.20190225121737.52"># This used to be time-critical code.

def childIndex(self):
    p = self
    return p._childIndex
</t>
<t tx="ekr.20190225121737.53">def directParents(self):
    return self.v.directParents()
</t>
<t tx="ekr.20190225121737.54">def hasChildren(self):
    p = self
    return len(p.v.children) &gt; 0

hasFirstChild = hasChildren

def numberOfChildren(self):
    p = self
    return len(p.v.children)
</t>
<t tx="ekr.20190225121737.55"># These methods are useful abbreviations.
# Warning: they make copies of positions, so they should be used _sparingly_

def getBack(self): return self.copy().moveToBack()

def getFirstChild(self): return self.copy().moveToFirstChild()

def getLastChild(self): return self.copy().moveToLastChild()

def getLastNode(self): return self.copy().moveToLastNode()
# def getLastVisible   (self): return self.copy().moveToLastVisible()

def getNext(self): return self.copy().moveToNext()

def getNodeAfterTree(self): return self.copy().moveToNodeAfterTree()

def getNthChild(self, n): return self.copy().moveToNthChild(n)

def getParent(self): return self.copy().moveToParent()

def getThreadBack(self): return self.copy().moveToThreadBack()

def getThreadNext(self): return self.copy().moveToThreadNext()
# New in Leo 4.4.3 b2: add c args.

def getVisBack(self, c): return self.copy().moveToVisBack(c)

def getVisNext(self, c): return self.copy().moveToVisNext(c)
# These are efficient enough now that iterators are the normal way to traverse the tree!
back = getBack
firstChild = getFirstChild
lastChild = getLastChild
lastNode = getLastNode
# lastVisible   = getLastVisible # New in 4.2 (was in tk tree code).
next = getNext
nodeAfterTree = getNodeAfterTree
nthChild = getNthChild
parent = getParent
threadBack = getThreadBack
threadNext = getThreadNext
visBack = getVisBack
visNext = getVisNext
# New in Leo 4.4.3:
hasVisBack = visBack
hasVisNext = visNext
</t>
<t tx="ekr.20190225121737.56">def get_UNL(self, with_file=True, with_proto=False, with_index=True, with_count=False):
    """
    with_file=True - include path to Leo file
    with_proto=False - include 'file://'
    with_index - include ',x' at end where x is child index in parent
    with_count - include ',x,y' at end where y zero based count of same headlines
    """
    aList = []
    for i in self.self_and_parents(copy=False):
        if with_index or with_count:
            count = 0
            ind = 0
            p = i.copy()
            while p.hasBack():
                ind = ind + 1
                p.moveToBack()
                if i.h == p.h:
                    count = count + 1
            aList.append(i.h.replace('--&gt;', '--%3E') + ":" + str(ind))
                # g.recursiveUNLFind and sf.copy_to_my_settings undo this replacement.
            if count or with_count:
                aList[-1] = aList[-1] + "," + str(count)
        else:
            aList.append(i.h.replace('--&gt;', '--%3E'))
                # g.recursiveUNLFind  and sf.copy_to_my_settings undo this replacement.
    UNL = '--&gt;'.join(reversed(aList))
    if with_proto:
        # return ("file://%s#%s" % (self.v.context.fileName(), UNL)).replace(' ', '%20')
        s = "unl:" + "//%s#%s" % (self.v.context.fileName(), UNL)
        return s.replace(' ', '%20')
    elif with_file:
        return ("%s#%s" % (self.v.context.fileName(), UNL))
    else:
        return UNL
</t>
<t tx="ekr.20190225121737.57">def hasBack(self):
    p = self
    return p.v and p._childIndex &gt; 0

def hasNext(self):
    p = self
    try:
        parent_v = p._parentVnode()
            # Returns None if p.v is None.
        return p.v and parent_v and p._childIndex + 1 &lt; len(parent_v.children)
    except Exception:
        g.trace('*** Unexpected exception')
        g.es_exception()
        return None

def hasParent(self):
    p = self
    return p.v and p.stack

def hasThreadBack(self):
    p = self
    return p.hasParent() or p.hasBack()
        # Much cheaper than computing the actual value.
</t>
<t tx="ekr.20190225121737.58">def hasThreadNext(self):
    p = self
    if not p.v: return False
    if p.hasChildren() or p.hasNext(): return True
    n = len(p.stack) - 1
    while n &gt;= 0:
        v, childIndex = p.stack[n]
        # See how many children v's parent has.
        if n == 0:
            parent_v = v.context.hiddenRootNode
        else:
            parent_v, junk = p.stack[n - 1]
        if len(parent_v.children) &gt; childIndex + 1:
            # v has a next sibling.
            return True
        n -= 1
    return False
</t>
<t tx="ekr.20190225121737.59">def findRootPosition(self):
    # 2011/02/25: always use c.rootPosition
    p = self
    c = p.v.context
    return c.rootPosition()
</t>
<t tx="ekr.20190225121737.6"># These are used by the FileCommands read/write code.

def getDefaultId(self):
    """Return the id to be used by default in all gnx's"""
    return self.defaultId

def setDefaultId(self, theId):
    """Set the id to be used by default in all gnx's"""
    self.defaultId = theId
</t>
<t tx="ekr.20190225121737.60">def isAncestorOf(self, p2):
    '''Return True if p is one of the direct ancestors of p2.'''
    p = self
    c = p.v.context
    if not c.positionExists(p2):
        return False
    for z in p2.stack:
        # 2013/12/25: bug fix: test childIndices.
        # This is required for the new per-position expansion scheme.
        parent_v, parent_childIndex = z
        if parent_v == p.v and parent_childIndex == p._childIndex:
            return True
    return False
</t>
<t tx="ekr.20190225121737.61">def isCloned(self):
    p = self
    return p.v.isCloned()
</t>
<t tx="ekr.20190225121737.62">def isRoot(self):
    p = self
    return not p.hasParent() and not p.hasBack()
</t>
<t tx="ekr.20190225121737.63">def isVisible(self, c):
    '''Return True if p is visible in c's outline.'''
    p = self

    def visible(p, root=None):
        for parent in p.parents(copy=False):
            if parent and parent == root:
                # Fix bug: https://github.com/leo-editor/leo-editor/issues/12
                return True
            if not c.shouldBeExpanded(parent):
                return False
        return True

    if c.hoistStack:
        root = c.hoistStack[-1].p
        if p == root:
            # Fix bug: https://github.com/leo-editor/leo-editor/issues/12
            return True
        else:
            return root.isAncestorOf(p) and visible(p, root=root)
    else:
        for root in c.rootPosition().self_and_siblings(copy=False):
            if root == p or root.isAncestorOf(p):
                return visible(p)
        return False
</t>
<t tx="ekr.20190225121737.64">def level(self):
    '''Return the number of p's parents.'''
    p = self
    return len(p.stack) if p.v else 0

simpleLevel = level
</t>
<t tx="ekr.20190225121737.65">def positionAfterDeletedTree(self):
    '''Return the position corresponding to p.nodeAfterTree() after this node is
    deleted. This will be p.nodeAfterTree() unless p.next() exists.

    This method allows scripts to traverse an outline, deleting nodes during the
    traversal. The pattern is::

        p = c.rootPosition()
        while p:
        if &lt;delete p?&gt;:
            next = p.positionAfterDeletedTree()
            p.doDelete()
            p = next
        else:
            p.moveToThreadNext()

    This method also allows scripts to *move* nodes during a traversal, **provided**
    that nodes are moved to a "safe" spot so that moving a node does not change the
    position of any other nodes.

    For example, the move-marked-nodes command first creates a **move node**, called
    'Clones of marked nodes'. All moved nodes become children of this move node.
    **Inserting** these nodes as children of the "move node" does not change the
    positions of other nodes. **Deleting** these nodes *may* change the position of
    nodes, but the pattern above handles this complication cleanly.
    '''
    p = self
    next = p.next()
    if next:
        # The new position will be the same as p, except for p.v.
        p = p.copy()
        p.v = next.v
        return p
    else:
        return p.nodeAfterTree()
</t>
<t tx="ekr.20190225121737.66">def textOffset(self):
    '''
    Return the fcol offset of self.
    Return None if p is has no ancestor @&lt;file&gt; node.
    http://tinyurl.com/5nescw
    '''
    p = self
    found, offset = False, 0
    for p in p.self_and_parents(copy=False):
        if p.isAnyAtFileNode():
            # Ignore parent of @&lt;file&gt; node.
            found = True
            break
        parent = p.parent()
        if not parent:
            break
        # If p is a section definition, search the parent for the reference.
        # Otherwise, search the parent for @others.
        h = p.h.strip()
        i = h.find('&lt;&lt;')
        j = h.find('&gt;&gt;')
        target = h[i: j + 2] if -1 &lt; i &lt; j else '@others'
        for s in parent.b.split('\n'):
            if s.find(target) &gt; -1:
                offset += g.skip_ws(s, 0)
                break
    return offset if found else None
</t>
<t tx="ekr.20190225121737.67">def isOutsideAnyAtFileTree(self):
    '''Select the first clone of target that is outside any @file node.'''
    p = self
    for parent in p.self_and_parents(copy=False):
        if parent.isAnyAtFileNode():
            return False
    return True
</t>
<t tx="ekr.20190225121737.68"># These methods are only for the use of low-level code
# in leoNodes.py, leoFileCommands.py and leoUndo.py.
</t>
<t tx="ekr.20190225121737.69">def _adjustPositionBeforeUnlink(self, p2):
    '''Adjust position p before unlinking p2.'''
    # p will change if p2 is a previous sibling of p or
    # p2 is a previous sibling of any ancestor of p.
    p = self; sib = p.copy()
    # A special case for previous siblings.
    # Adjust p._childIndex, not the stack's childIndex.
    while sib.hasBack():
        sib.moveToBack()
        if sib == p2:
            p._childIndex -= 1
            return
    # Adjust p's stack.
    stack = []; changed = False; i = 0
    while i &lt; len(p.stack):
        v, childIndex = p.stack[i]
        p3 = Position(v=v, childIndex=childIndex, stack=stack[: i])
        while p3:
            if p2 == p3:
                # 2011/02/25: compare full positions, not just vnodes.
                # A match with the to-be-moved node.
                stack.append((v, childIndex - 1),)
                changed = True
                break # terminate only the inner loop.
            p3.moveToBack()
        else:
            stack.append((v, childIndex),)
        i += 1
    if changed:
        p.stack = stack
</t>
<t tx="ekr.20190225121737.7">def getNewIndex(self, v, cached=False):
    '''
    Create a new gnx for v or an empty string if the hold flag is set.
    **Important**: the method must allocate a new gnx even if v.fileIndex exists.
    '''
    if v is None:
        g.internalError('getNewIndex: v is None')
        return ''
    c = v.context
    fc = c.fileCommands
    t_s = self.update()
        # Updates self.lastTime and self.lastIndex.
    gnx = g.toUnicode("%s.%s.%d" % (self.userId, t_s, self.lastIndex))
    v.fileIndex = gnx
    self.check_gnx(c, gnx, v)
    fc.gnxDict[gnx] = v
    return gnx
</t>
<t tx="ekr.20190225121737.70">def _linkAfter(self, p_after):
    '''Link self after p_after.'''
    p = self
    parent_v = p_after._parentVnode()
    p.stack = p_after.stack[:]
    p._childIndex = p_after._childIndex + 1
    child = p.v
    n = p_after._childIndex + 1
    child._addLink(n, parent_v)
</t>
<t tx="ekr.20190225121737.71">def _linkCopiedAfter(self, p_after):
    '''Link self, a newly copied tree, after p_after.'''
    p = self
    parent_v = p_after._parentVnode()
    p.stack = p_after.stack[:]
    p._childIndex = p_after._childIndex + 1
    child = p.v
    n = p_after._childIndex + 1
    child._addCopiedLink(n, parent_v)
</t>
<t tx="ekr.20190225121737.72">def _linkAsNthChild(self, parent, n):
    '''Link self as the n'th child of the parent.'''
    p = self
    parent_v = parent.v
    p.stack = parent.stack[:]
    p.stack.append((parent_v, parent._childIndex),)
    p._childIndex = n
    child = p.v
    child._addLink(n, parent_v)
    
</t>
<t tx="ekr.20190225121737.73">def _linkCopiedAsNthChild(self, parent, n):
    '''Link a copied self as the n'th child of the parent.'''
    p = self
    parent_v = parent.v
    p.stack = parent.stack[:]
    p.stack.append((parent_v, parent._childIndex),)
    p._childIndex = n
    child = p.v
    child._addCopiedLink(n, parent_v)
</t>
<t tx="ekr.20190225121737.74">def _linkAsRoot(self, oldRoot):
    """Link self as the root node."""
    p = self
    assert(p.v)
    hiddenRootNode = p.v.context.hiddenRootNode
    # if oldRoot: oldRootNode = oldRoot.v
    # else:       oldRootNode = None
    # Init the ivars.
    p.stack = []
    p._childIndex = 0
    parent_v = hiddenRootNode
    child = p.v
    if not oldRoot: parent_v.children = []
    child._addLink(0, parent_v)
    return p
</t>
<t tx="ekr.20190225121737.75">def _parentVnode(self):
    '''Return the parent VNode.
    Return the hiddenRootNode if there is no other parent.'''
    p = self
    if p.v:
        data = p.stack and p.stack[-1]
        if data:
            v, junk = data
            return v
        else:
            return p.v.context.hiddenRootNode
    else:
        return None
</t>
<t tx="ekr.20190225121737.76">def _relinkAsCloneOf(self, p2):
    '''A low-level method to replace p.v by a p2.v.'''
    p = self
    v, v2 = p.v, p2.v
    parent_v = p._parentVnode()
    if not parent_v:
        g.internalError('no parent_v', p)
        return
    if parent_v.children[p._childIndex] == v:
        parent_v.children[p._childIndex] = v2
        v2.parents.append(parent_v)
        # p.v no longer truly exists.
        # p.v = p2.v
    else:
        g.internalError(
            'parent_v.children[childIndex] != v',
            p, parent_v.children, p._childIndex, v)
</t>
<t tx="ekr.20190225121737.77">def _unlink(self):
    '''Unlink the receiver p from the tree.'''
    p = self; n = p._childIndex
    parent_v = p._parentVnode()
        # returns None if p.v is None
    child = p.v
    assert(p.v)
    assert(parent_v)
    # Delete the child.
    if (0 &lt;= n &lt; len(parent_v.children) and
        parent_v.children[n] == child
    ):
        # This is the only call to v._cutlink.
        child._cutLink(n, parent_v)
    else:
        self.badUnlink(parent_v, n, child)
</t>
<t tx="ekr.20190225121737.78">def badUnlink(self, parent_v, n, child):
    
    if 0 &lt;= n &lt; len(parent_v.children):
        g.trace('**can not happen: children[%s] != p.v' % (n))
        g.trace('parent_v.children...\n',
            g.listToString(parent_v.children))
        g.trace('parent_v', parent_v)
        g.trace('parent_v.children[n]', parent_v.children[n])
        g.trace('child', child)
        g.trace('** callers:', g.callers())
        if g.app.unitTesting: assert False, 'children[%s] != p.v'
    else:
        g.trace('**can not happen: bad child index: %s, len(children): %s' % (
            n, len(parent_v.children)))
        g.trace('parent_v.children...\n',
            g.listToString(parent_v.children))
        g.trace('parent_v', parent_v, 'child', child)
        g.trace('** callers:', g.callers())
        if g.app.unitTesting: assert False, 'bad child index: %s' % (n)
</t>
<t tx="ekr.20190225121737.79">@ These routines change self to a new position "in place".
That is, these methods must _never_ call p.copy().

When moving to a nonexistent position, these routines simply set p.v = None,
leaving the p.stack unchanged. This allows the caller to "undo" the effect of
the invalid move by simply restoring the previous value of p.v.

These routines all return self on exit so the following kind of code will work:
    after = p.copy().moveToNodeAfterTree()
</t>
<t tx="ekr.20190225121737.8">def new_vnode_helper(self, c, gnx, v):
    '''Handle all gnx-related tasks for VNode.__init__.'''
    ni = self
    if gnx:
        v.fileIndex = gnx
        ni.check_gnx(c, gnx, v)
        c.fileCommands.gnxDict[gnx] = v
    else:
        v.fileIndex = ni.getNewIndex(v)
</t>
<t tx="ekr.20190225121737.80">def moveToBack(self):
    """Move self to its previous sibling."""
    p = self; n = p._childIndex
    parent_v = p._parentVnode()
        # Returns None if p.v is None.
    # Do not assume n is in range: this is used by positionExists.
    if parent_v and p.v and 0 &lt; n &lt;= len(parent_v.children):
        p._childIndex -= 1
        p.v = parent_v.children[n - 1]
    else:
        p.v = None
    return p
</t>
<t tx="ekr.20190225121737.81">def moveToFirstChild(self):
    """Move a position to it's first child's position."""
    p = self
    if p.v and p.v.children:
        p.stack.append((p.v, p._childIndex),)
        p.v = p.v.children[0]
        p._childIndex = 0
    else:
        p.v = None
    return p
</t>
<t tx="ekr.20190225121737.82">def moveToLastChild(self):
    """Move a position to it's last child's position."""
    p = self
    if p.v and p.v.children:
        p.stack.append((p.v, p._childIndex),)
        n = len(p.v.children)
        p.v = p.v.children[n - 1]
        p._childIndex = n - 1
    else:
        p.v = None
    return p
</t>
<t tx="ekr.20190225121737.83">def moveToLastNode(self):
    """Move a position to last node of its tree.

    N.B. Returns p if p has no children."""
    p = self
    # Huge improvement for 4.2.
    while p.hasChildren():
        p.moveToLastChild()
    return p
</t>
<t tx="ekr.20190225121737.84">def moveToNext(self):
    """Move a position to its next sibling."""
    p = self; n = p._childIndex
    parent_v = p._parentVnode()
        # Returns None if p.v is None.
    if not p.v:
        g.trace('no p.v:', p, g.callers())
    if p.v and parent_v and len(parent_v.children) &gt; n + 1:
        p._childIndex = n + 1
        p.v = parent_v.children[n + 1]
    else:
        p.v = None
    return p
</t>
<t tx="ekr.20190225121737.85">def moveToNodeAfterTree(self):
    """Move a position to the node after the position's tree."""
    p = self
    while p:
        if p.hasNext():
            p.moveToNext()
            break
        p.moveToParent()
    return p
</t>
<t tx="ekr.20190225121737.86">def moveToNthChild(self, n):
    p = self
    if p.v and len(p.v.children) &gt; n:
        p.stack.append((p.v, p._childIndex),)
        p.v = p.v.children[n]
        p._childIndex = n
    else:
        p.v = None
    return p
</t>
<t tx="ekr.20190225121737.87">def moveToParent(self):
    """Move a position to its parent position."""
    p = self
    if p.v and p.stack:
        p.v, p._childIndex = p.stack.pop()
    else:
        p.v = None
    return p
</t>
<t tx="ekr.20190225121737.88">def moveToThreadBack(self):
    """Move a position to it's threadBack position."""
    p = self
    if p.hasBack():
        p.moveToBack()
        p.moveToLastNode()
    else:
        p.moveToParent()
    return p
</t>
<t tx="ekr.20190225121737.89">def moveToThreadNext(self):
    """Move a position to threadNext position."""
    p = self
    if p.v:
        if p.v.children:
            p.moveToFirstChild()
        elif p.hasNext():
            p.moveToNext()
        else:
            p.moveToParent()
            while p:
                if p.hasNext():
                    p.moveToNext()
                    break #found
                p.moveToParent()
            # not found.
    return p
</t>
<t tx="ekr.20190225121737.9">def scanGnx(self, s, i=0):
    """Create a gnx from its string representation."""
    if not g.isString(s):
        g.error("scanGnx: unexpected index type:", type(s), '', s)
        return None, None, None
    s = s.strip()
    theId, t, n = None, None, None
    i, theId = g.skip_to_char(s, i, '.')
    if g.match(s, i, '.'):
        i, t = g.skip_to_char(s, i + 1, '.')
        if g.match(s, i, '.'):
            i, n = g.skip_to_char(s, i + 1, '.')
    # Use self.defaultId for missing id entries.
    if not theId:
        theId = self.defaultId
    return theId, t, n
</t>
<t tx="ekr.20190225121737.90">def moveToVisBack(self, c):
    """Move a position to the position of the previous visible node."""
    p = self
    limit, limitIsVisible = c.visLimit()
    while p:
        # Short-circuit if possible.
        back = p.back()
        if back and back.hasChildren() and back.isExpanded():
            p.moveToThreadBack()
        elif back:
            p.moveToBack()
        else:
            p.moveToParent() # Same as p.moveToThreadBack()
        if p:
            if limit:
                done, val = self.checkVisBackLimit(limit, limitIsVisible, p)
                if done:
                    return val # A position or None
            if p.isVisible(c):
                return p
    return p
</t>
<t tx="ekr.20190225121737.91">def checkVisBackLimit(self, limit, limitIsVisible, p):
    '''Return done, p or None'''
    c = p.v.context
    if limit == p:
        if limitIsVisible and p.isVisible(c):
            return True, p
        else:
            return True, None
    elif limit.isAncestorOf(p):
        return False, None
    else:
        return True, None

</t>
<t tx="ekr.20190225121737.92">def moveToVisNext(self, c):
    """Move a position to the position of the next visible node."""
    p = self
    limit, limitIsVisible = c.visLimit()
    while p:
        if p.hasChildren():
            if p.isExpanded():
                p.moveToFirstChild()
            else:
                p.moveToNodeAfterTree()
        elif p.hasNext():
            p.moveToNext()
        else:
            p.moveToThreadNext()
        if p:
            if limit and self.checkVisNextLimit(limit,p):
                return None
            if p.isVisible(c):
                return p
    return p
</t>
<t tx="ekr.20190225121737.93">def checkVisNextLimit(self, limit, p):
    '''Return True is p is outside limit of visible nodes.'''
    return limit != p and not limit.isAncestorOf(p)
</t>
<t tx="ekr.20190225121737.94">def safeMoveToThreadNext(self):
    '''
    Move a position to threadNext position.
    Issue an error if any vnode is an ancestor of itself.
    '''
    p = self
    if p.v:
        child_v = p.v.children and p.v.children[0]
        if child_v:
            for parent in p.self_and_parents(copy=False):
                if child_v == parent.v:
                    g.app.structure_errors += 1
                    g.error('vnode: %s is its own parent' % child_v)
                    # Allocating a new vnode would be difficult.
                    # Just remove child_v from parent.v.children.
                    parent.v.children = [
                        v2 for v2 in parent.v.children if not v2 == child_v]
                    if parent.v in child_v.parents:
                        child_v.parents.remove(parent.v)
                    # Try not to hang.
                    p.moveToParent()
                    break
                elif child_v.fileIndex == parent.v.fileIndex:
                    g.app.structure_errors += 1
                    g.error('duplicate gnx: %r v: %s parent: %s' % (
                        child_v.fileIndex, child_v, parent.v))
                    child_v.fileIndex = g.app.nodeIndices.getNewIndex(v=child_v)
                    assert child_v.gnx != parent.v.gnx
                    # Should be ok to continue.
                    p.moveToFirstChild()
                    break
            else:
                p.moveToFirstChild()
        elif p.hasNext():
            p.moveToNext()
        else:
            p.moveToParent()
            while p:
                if p.hasNext():
                    p.moveToNext()
                    break # found
                p.moveToParent()
            # not found.
    return p
</t>
<t tx="ekr.20190225121737.95"></t>
<t tx="ekr.20190225121737.96"></t>
<t tx="ekr.20190225121737.97">def clone(self):
    """Create a clone of back.

    Returns the newly created position."""
    p = self
    p2 = p.copy() # Do *not* copy the VNode!
    p2._linkAfter(p) # This should "just work"
    return p2
</t>
<t tx="ekr.20190225121737.98">def copy(self):
    """"Return an independent copy of a position."""
    return Position(self.v, self._childIndex, self.stack)
</t>
<t tx="ekr.20190225121737.99"># These used by unit tests, by the group_operations plugin,
# and by the files-compare-leo-files command.

# To do: use v.copyTree instead.

def copyTreeAfter(self, copyGnxs=False):
    '''Copy p and insert it after itself.'''
    p = self
    p2 = p.insertAfter()
    p.copyTreeFromSelfTo(p2, copyGnxs=copyGnxs)
    return p2

def copyTreeFromSelfTo(self, p2, copyGnxs=False):
    p = self
    p2.v._headString = g.toUnicode(p.h, reportErrors=True) # 2017/01/24
    p2.v._bodyString = g.toUnicode(p.b, reportErrors=True) # 2017/01/24
    # Fix bug 1019794: p.copyTreeFromSelfTo, should deepcopy p.v.u.
    p2.v.u = copy.deepcopy(p.v.u)
    # 2017/08/20: Add support for copyGnx's keyword arg.
    if copyGnxs:
        p2.v.fileIndex = p.v.fileIndex
    # 2009/10/02: no need to copy arg to iter
    for child in p.children():
        child2 = p2.insertAsLastChild()
        child.copyTreeFromSelfTo(child2, copyGnxs=copyGnxs)
</t>
<t tx="ekr.20190225121753.1">@language smalltalk

"From https://mutabit.com/repos.fossil/grafoscopio/doc/tip/readme.md.html#overview/quickstart"

Metacello new 
  smalltalkhubUser: 'Offray' project: 'Grafoscopio'; 
  configuration: 'Grafoscopio'; 
load. </t>
<t tx="ekr.20190225121816.1">@language pharo
@tabwidth -2

https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/book-result/Collections/Collections.html

"Identity* uses == instead of ="
"Plugable* uses arbitrary equivalence relation"
Object
  Collection
    HashedCollection
      Bag "Accepts duplicates."
        IdentityBag
      Dictionary
        IdentityDictionary
        PlugableDictionary
        KeyedTree
      Set
        IdentitySet
        PlugableSet
    SequenceableCollection
      ArrayedCollection
        Array "Heterogeous. Not growable."
          ByteArray
          CharacterArray
        Interval "Not growable. Not mutable. No at:put:"
        LinkedList "Not indexable: no at:. no put:"
          "Elements must conform to the Link accessing protocol."
        OrderedCollection
          SortedCollection
        String "Only characters"
          ByteString 
          
Protocol      Methods
--------      -------	
accessing     size, capacity, at:, at:put: 	
testing       isEmpty, includes:, contains:, occurrencesOf: 	
adding        add:, addAll:
removing      remove:, remove:ifAbsent:, removeAll:
enumerating   do:, collect:, select:, reject:
              detect:, detect:ifNone:, inject:into:
converting    asArray, asBag, asSet, asOrderedCollection,
              asSortedCollection, asSortedCollection:
creation      with: ... with:with:with:with:, withAll:
</t>
<t tx="ekr.20190225121958.1"></t>
<t tx="ekr.20190225122134.1"># Example: Object subclass: #FileUtils

class_pat = re.compile(r"(\w+)\s+subclass:\s+#(\w+)")

def is_class(self, line):
    m = self.class_pat.match(line)
    if m:
        super_class_name = m.group(1)
        class_name = m.group(2)
        return class_name, super_class_name
    return None, None
</t>
<t tx="ekr.20190225122907.1">def new_class(self, class_name):
    g.trace('CLASS', class_name)
    self.class_parent = self.parent.insertAsLastChild()
    self.class_parent.h = class_name
    self.p = None
    self.organizer_p = None</t>
<t tx="ekr.20190225123049.1">def plain_line(self, line):
    '''Handle a plain line.'''
    if not self.class_parent:
        self.class_parent = self.parent.insertAsLastChild()
        self.p = None
    if not self.p:
        if self.organizer_p:
            self.p = self.organizer_p.insertAsLastChild()
            self.p.h = ''
        else:
            self.p = self.class_parent.copy()
    if line.strip() and self.p and not self.p.h:
        self.p.h = line.strip()
    self.p.b = self.p.b + line</t>
</tnodes>
</leo_file>
