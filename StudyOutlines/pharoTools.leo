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
<v t="ekr.20190225121341.5"><vh>fi.read_line &amp; helpers</vh>
<v t="ekr.20190225122907.1"><vh>fi.new_class</vh></v>
<v t="ekr.20190225123049.1"><vh>fi.plain_line</vh></v>
</v>
</v>
<v t="ekr.20190225130807.1"><vh>Grafoscopio.st</vh>
<v t="ekr.20190225130807.2"><vh>FileUtils</vh>
<v t="ekr.20190225130807.3"><vh>utilities</vh>
<v t="ekr.20190225130807.4"><vh>createFilesNamed: fileNames endingWith: fileExtension intoFolder: aFolder</vh></v>
</v>
</v>
<v t="ekr.20190225130808.1"><vh>GrafoscopioNode</vh>
<v t="ekr.20190225130808.2"><vh>adding</vh>
<v t="ekr.20190225130808.3"><vh>addNode: aNode</vh></v>
</v>
<v t="ekr.20190225130808.4"><vh>utility</vh>
<v t="ekr.20190225130808.5"><vh>pandocOptionsPrettyYaml</vh></v>
<v t="ekr.20190225130808.6"><vh>pandocOptions</vh></v>
<v t="ekr.20190225130808.7"><vh>replaceAccentedHTMLChars</vh></v>
<v t="ekr.20190225130808.8"><vh>removeLeadingLineNumbersSized: anInteger</vh></v>
<v t="ekr.20190225130808.9"><vh>deleteReferencesToRoot: aRootNode</vh></v>
<v t="ekr.20190225130808.10"><vh>find: aString andReplaceWith: anotherString</vh></v>
</v>
<v t="ekr.20190225130808.11"><vh>initialization</vh>
<v t="ekr.20190225130808.12"><vh>becomeDefaultTree</vh></v>
<v t="ekr.20190225130808.13"><vh>initialize</vh></v>
<v t="ekr.20190225130808.14"><vh>becomeDefaultTestTree</vh></v>
</v>
<v t="ekr.20190225130808.15"><vh>accessing</vh>
<v t="ekr.20190225130808.16"><vh>output: anObject</vh></v>
<v t="ekr.20190225130808.17"><vh>parent: aNode</vh></v>
<v t="ekr.20190225130808.18"><vh>output</vh></v>
<v t="ekr.20190225130808.19"><vh>isEmpty</vh></v>
<v t="ekr.20190225130808.20"><vh>content: anObject</vh></v>
<v t="ekr.20190225130808.21"><vh>lastNetLink</vh></v>
<v t="ekr.20190225130808.22"><vh>tagAs: aTag</vh></v>
<v t="ekr.20190225130808.23"><vh>headers</vh></v>
<v t="ekr.20190225130808.24"><vh>tags: aCollection</vh></v>
<v t="ekr.20190225130808.25"><vh>saveContent: anObject</vh></v>
<v t="ekr.20190225130808.26"><vh>asText</vh></v>
<v t="ekr.20190225130808.27"><vh>ancestorsAll</vh></v>
<v t="ekr.20190225130808.28"><vh>key</vh></v>
<v t="ekr.20190225130808.29"><vh>key: aUniqueKey</vh></v>
<v t="ekr.20190225130808.30"><vh>content</vh></v>
<v t="ekr.20190225130808.31"><vh>children</vh></v>
<v t="ekr.20190225130808.32"><vh>body</vh></v>
<v t="ekr.20190225130808.33"><vh>lastLink</vh></v>
<v t="ekr.20190225130808.34"><vh>parent</vh></v>
<v t="ekr.20190225130808.35"><vh>ancestors</vh></v>
<v t="ekr.20190225130808.36"><vh>title</vh></v>
<v t="ekr.20190225130808.37"><vh>links: anObject</vh></v>
<v t="ekr.20190225130808.38"><vh>level: anInteger</vh></v>
<v t="ekr.20190225130808.39"><vh>header</vh></v>
<v t="ekr.20190225130808.40"><vh>specModelClass</vh></v>
<v t="ekr.20190225130808.41"><vh>hasChildren</vh></v>
<v t="ekr.20190225130808.42"><vh>root</vh></v>
<v t="ekr.20190225130808.43"><vh>level</vh></v>
<v t="ekr.20190225130808.44"><vh>children: aCollection</vh></v>
<v t="ekr.20190225130808.45"><vh>body: anObject</vh></v>
</v>
<v t="ekr.20190225130808.46"><vh>operation</vh>
<v t="ekr.20190225130808.47"><vh>localFilesLinks</vh></v>
<v t="ekr.20190225130808.48"><vh>addLink: anUrl</vh></v>
<v t="ekr.20190225130808.49"><vh>htmlToMarkdownSubtree</vh></v>
<v t="ekr.20190225130808.50"><vh>metadata</vh></v>
<v t="ekr.20190225130808.51"><vh>preorderTraversal</vh></v>
<v t="ekr.20190225130808.52"><vh>linksToMarkdownFile</vh></v>
<v t="ekr.20190225130808.53"><vh>toggleCodeText</vh></v>
<v t="ekr.20190225130808.54"><vh>surfaceCopy</vh></v>
<v t="ekr.20190225130808.55"><vh>selectMarkdownSubtreesToExport</vh></v>
<v t="ekr.20190225130808.56"><vh>htmlToMarkdown</vh></v>
<v t="ekr.20190225130808.57"><vh>visitLastLink</vh></v>
<v t="ekr.20190225130808.58"><vh>subtreeCopy</vh></v>
<v t="ekr.20190225130808.59"><vh>isTaggedAs: aString</vh></v>
<v t="ekr.20190225130808.60"><vh>checksum</vh></v>
</v>
<v t="ekr.20190225130808.61"><vh>movement</vh>
<v t="ekr.20190225130808.62"><vh>moveAfter</vh></v>
<v t="ekr.20190225130808.63"><vh>moveBefore</vh></v>
<v t="ekr.20190225130808.64"><vh>demote</vh></v>
<v t="ekr.20190225130808.65"><vh>promote</vh></v>
</v>
<v t="ekr.20190225130808.66"><vh>importing</vh>
<v t="ekr.20190225130808.67"><vh>importHtmlLink</vh></v>
<v t="ekr.20190225130808.68"><vh>importPlaygroundLink</vh></v>
<v t="ekr.20190225130808.69"><vh>uploadBodyFrom: fileLocator filteredFor: selectedLink</vh></v>
</v>
<v t="ekr.20190225130808.70"><vh>exporting</vh>
<v t="ekr.20190225130808.71"><vh>headerAsMarkdownInto: aStream</vh></v>
<v t="ekr.20190225130808.72"><vh>bodyAsMarkdownInto: aStream</vh></v>
<v t="ekr.20190225130808.73"><vh>hasAncestorHeaderWith: aSpecialWord</vh></v>
<v t="ekr.20190225130808.74"><vh>footnoteAsMarkdownInto: aStream</vh></v>
<v t="ekr.20190225130808.75"><vh>hasAncestorTaggedAs: aSpecialWord</vh></v>
<v t="ekr.20190225130808.76"><vh>markdownContent</vh></v>
<v t="ekr.20190225130808.77"><vh>exportPreambleTo: aStream</vh></v>
<v t="ekr.20190225130808.78"><vh>margin</vh></v>
<v t="ekr.20190225130808.79"><vh>exportCodeBlockTo: aStream</vh></v>
<v t="ekr.20190225130808.80"><vh>publish</vh></v>
<v t="ekr.20190225130808.81"><vh>itemAsMarkdownInto: aStream</vh></v>
<v t="ekr.20190225130808.82"><vh>asSton</vh></v>
<v t="ekr.20190225130808.83"><vh>exportCodeOutputTo: aStream</vh></v>
<v t="ekr.20190225130808.84"><vh>margins</vh></v>
<v t="ekr.20190225130808.85"><vh>exportCodeNodeTo: aStream</vh></v>
<v t="ekr.20190225130808.86"><vh>exportLaTeXCodeBlockTo: aStream</vh></v>
<v t="ekr.20190225130808.87"><vh>flatten</vh></v>
<v t="ekr.20190225130808.88"><vh>metadataAsYamlIn: markdownStream</vh></v>
<v t="ekr.20190225130808.89"><vh>bodyAsCode</vh></v>
<v t="ekr.20190225130808.90"><vh>asMarkdown</vh></v>
</v>
<v t="ekr.20190225130808.91"><vh>utility</vh>
<v t="ekr.20190225130808.92"><vh>contentProviders</vh></v>
<v t="ekr.20190225130808.93"><vh>specialWords</vh></v>
<v t="ekr.20190225130808.94"><vh>cleanTreeRootReferences</vh></v>
</v>
<v t="ekr.20190225130808.95"><vh>accessing</vh>
<v t="ekr.20190225130808.96"><vh>clipboard</vh></v>
<v t="ekr.20190225130808.97"><vh>clipboard: anObject</vh></v>
</v>
</v>
<v t="ekr.20190225130808.98"><vh>GrafoscopioNodeTest</vh>
<v t="ekr.20190225130808.99"><vh>tests-utility</vh>
<v t="ekr.20190225130808.100"><vh>testRemoveLeadingLineNumbersSized</vh></v>
</v>
<v t="ekr.20190225130808.101"><vh>tests</vh>
<v t="ekr.20190225130808.102"><vh>testInitializeIsOk</vh></v>
<v t="ekr.20190225130808.103"><vh>dummyHtml</vh></v>
<v t="ekr.20190225130808.104"><vh>testAddingChildren</vh></v>
<v t="ekr.20190225130808.105"><vh>testDemoteNode</vh></v>
<v t="ekr.20190225130808.106"><vh>testHasMarkdownSubtreesToExport</vh></v>
<v t="ekr.20190225130808.107"><vh>testPromoteNode</vh></v>
<v t="ekr.20190225130808.108"><vh>testRemovingChildren</vh></v>
<v t="ekr.20190225130808.109"><vh>testFindAndReplace</vh></v>
</v>
</v>
<v t="ekr.20190225130808.110"><vh>MindMap</vh></v>
<v t="ekr.20190225130808.111"><vh>Pandoc</vh>
<v t="ekr.20190225130808.112"><vh>utility</vh>
<v t="ekr.20190225130808.113"><vh>extractImagesInUnixFor: aFileReference withFilter: aLuaFilter</vh></v>
<v t="ekr.20190225130808.114"><vh>luaFilters</vh></v>
</v>
<v t="ekr.20190225130808.115"><vh>converters</vh>
<v t="ekr.20190225130808.116"><vh>htmlToMarkdown: inputFile</vh></v>
</v>
<v t="ekr.20190225130808.117"><vh>accessing</vh>
<v t="ekr.20190225130808.118"><vh>executable</vh></v>
<v t="ekr.20190225130808.119"><vh>executable: aFileReference</vh></v>
<v t="ekr.20190225130808.120"><vh>executableLocation</vh></v>
</v>
</v>
<v t="ekr.20190225130808.121"><vh>FontAwesomeIcons</vh></v>
<v t="ekr.20190225130808.122"><vh>GfUIHelpers</vh>
<v t="ekr.20190225130808.123"><vh>updating</vh>
<v t="ekr.20190225130808.124"><vh>updateSystem</vh></v>
<v t="ekr.20190225130808.125"><vh>updateUI</vh></v>
<v t="ekr.20190225130808.126"><vh>updateDataviz</vh></v>
<v t="ekr.20190225130808.127"><vh>updateGrafoscopio</vh></v>
<v t="ekr.20190225130808.128"><vh>updateRecentNotebooksWith: aFileReference</vh></v>
<v t="ekr.20190225130808.129"><vh>updateDatavizUI</vh></v>
<v t="ekr.20190225130808.130"><vh>updatePrerrequisitesScript</vh></v>
<v t="ekr.20190225130808.131"><vh>updateGrafoscopioUI</vh></v>
</v>
<v t="ekr.20190225130808.132"><vh>adding</vh>
<v t="ekr.20190225130808.133"><vh>addToHelpMenu: aGrafoscopioNotebook</vh></v>
</v>
<v t="ekr.20190225130808.134"><vh>accessing</vh>
<v t="ekr.20190225130808.135"><vh>recentNotebooks</vh></v>
</v>
</v>
<v t="ekr.20190225130808.136"><vh>GfWorldMenu</vh>
<v t="ekr.20190225130808.137"><vh>updating</vh>
<v t="ekr.20190225130808.138"><vh>updateRecentNotebooksWith: aFileReference</vh></v>
</v>
</v>
<v t="ekr.20190225130808.139"><vh>GrafoscopioButtonModel</vh>
<v t="ekr.20190225130808.140"><vh>initalize</vh>
<v t="ekr.20190225130808.141"><vh>initializeWidgets</vh></v>
</v>
<v t="ekr.20190225130808.142"><vh>api</vh>
<v t="ekr.20190225130808.143"><vh>content: anAssoc</vh></v>
</v>
<v t="ekr.20190225130808.144"><vh>accessing</vh>
<v t="ekr.20190225130808.145"><vh>replace: anObject</vh></v>
<v t="ekr.20190225130808.146"><vh>button: anObject</vh></v>
<v t="ekr.20190225130808.147"><vh>find: anObject</vh></v>
<v t="ekr.20190225130808.148"><vh>replace</vh></v>
<v t="ekr.20190225130808.149"><vh>ok</vh></v>
<v t="ekr.20190225130808.150"><vh>find</vh></v>
<v t="ekr.20190225130808.151"><vh>body</vh></v>
<v t="ekr.20190225130808.152"><vh>ok: anObject</vh></v>
<v t="ekr.20190225130808.153"><vh>cancel: anObject</vh></v>
<v t="ekr.20190225130808.154"><vh>button</vh></v>
<v t="ekr.20190225130808.155"><vh>cancel</vh></v>
</v>
<v t="ekr.20190225130808.156"><vh>specs</vh>
<v t="ekr.20190225130808.157"><vh>defaultSpec</vh></v>
</v>
</v>
<v t="ekr.20190225130808.158"><vh>GrafoscopioCodeModel</vh>
<v t="ekr.20190225130808.159"><vh>accessing</vh>
<v t="ekr.20190225130808.160"><vh>body</vh></v>
<v t="ekr.20190225130808.161"><vh>body: anObject</vh></v>
</v>
<v t="ekr.20190225130808.162"><vh>API</vh>
<v t="ekr.20190225130808.163"><vh>content: aGrafoscopioNodeContent</vh></v>
</v>
<v t="ekr.20190225130808.164"><vh>initialization</vh>
<v t="ekr.20190225130808.165"><vh>initializeWidgets</vh></v>
</v>
<v t="ekr.20190225130808.166"><vh>specs</vh>
<v t="ekr.20190225130808.167"><vh>defaultSpec</vh></v>
</v>
</v>
<v t="ekr.20190225130808.168"><vh>GrafoscopioLinksList</vh>
<v t="ekr.20190225130808.169"><vh>accessing</vh>
<v t="ekr.20190225130808.170"><vh>links</vh></v>
<v t="ekr.20190225130808.171"><vh>content: aGrafoscopioNode</vh></v>
<v t="ekr.20190225130808.172"><vh>links: anObject</vh></v>
</v>
<v t="ekr.20190225130808.173"><vh>api</vh>
<v t="ekr.20190225130808.174"><vh>title</vh></v>
</v>
<v t="ekr.20190225130808.175"><vh>initialization</vh>
<v t="ekr.20190225130808.176"><vh>initializeWidgets</vh></v>
</v>
<v t="ekr.20190225130808.177"><vh>api-events</vh>
<v t="ekr.20190225130808.178"><vh>whenSelectedItemChanged: aBlock</vh></v>
</v>
<v t="ekr.20190225130808.179"><vh>specs</vh>
<v t="ekr.20190225130808.180"><vh>defaultSpec</vh></v>
</v>
</v>
<v t="ekr.20190225130808.181"><vh>GrafoscopioLinkstModel</vh></v>
<v t="ekr.20190225130808.182"><vh>GrafoscopioNotebook</vh>
<v t="ekr.20190225130808.183"><vh>operation</vh>
<v t="ekr.20190225130808.184"><vh>htmlToMarkdownSubtree</vh></v>
<v t="ekr.20190225130808.185"><vh>updateBodyFor: aNodeContainer</vh></v>
<v t="ekr.20190225130808.186"><vh>visitNodeLink</vh></v>
<v t="ekr.20190225130808.187"><vh>importLinkContent</vh></v>
<v t="ekr.20190225130808.188"><vh>htmlToMarkdown</vh></v>
<v t="ekr.20190225130808.189"><vh>debugWithSelector: aSymbol</vh></v>
<v t="ekr.20190225130808.190"><vh>currentNodeContent</vh></v>
<v t="ekr.20190225130808.191"><vh>currentNode</vh></v>
<v t="ekr.20190225130808.192"><vh>autoSaveBodyOf: aNode</vh></v>
</v>
<v t="ekr.20190225130808.193"><vh>accessing</vh>
<v t="ekr.20190225130808.194"><vh>links</vh></v>
<v t="ekr.20190225130808.195"><vh>workingFile</vh></v>
<v t="ekr.20190225130808.196"><vh>notebook</vh></v>
<v t="ekr.20190225130808.197"><vh>tree</vh></v>
<v t="ekr.20190225130808.198"><vh>imagesList: anObject</vh></v>
<v t="ekr.20190225130808.199"><vh>header</vh></v>
<v t="ekr.20190225130808.200"><vh>header: anObject</vh></v>
<v t="ekr.20190225130808.201"><vh>body</vh></v>
<v t="ekr.20190225130808.202"><vh>links: anObject</vh></v>
<v t="ekr.20190225130808.203"><vh>debugMessage: aGrafoscopioNodeSelector</vh></v>
<v t="ekr.20190225130808.204"><vh>windowMainMenu: anObject</vh></v>
<v t="ekr.20190225130808.205"><vh>debugMessage</vh></v>
<v t="ekr.20190225130808.206"><vh>tree: anObject</vh></v>
<v t="ekr.20190225130808.207"><vh>windowMainMenu</vh></v>
<v t="ekr.20190225130808.208"><vh>imagesList</vh></v>
<v t="ekr.20190225130808.209"><vh>notebook: anObject</vh></v>
<v t="ekr.20190225130808.210"><vh>workingFile: aFileReference</vh></v>
<v t="ekr.20190225130808.211"><vh>body: anObject</vh></v>
</v>
<v t="ekr.20190225130808.212"><vh>persistence</vh>
<v t="ekr.20190225130808.213"><vh>markdownFile</vh></v>
<v t="ekr.20190225130808.214"><vh>openDefault</vh></v>
<v t="ekr.20190225130808.215"><vh>subtreeAsMarkdown</vh></v>
<v t="ekr.20190225130808.216"><vh>exportAllSubtreesAsMarkdow</vh></v>
<v t="ekr.20190225130808.217"><vh>openFromFileSelector</vh></v>
<v t="ekr.20190225130808.218"><vh>exportNode: aGrafoscopioNode asMarkdownIn: aFile</vh></v>
<v t="ekr.20190225130808.219"><vh>loadFromFile: aFileReference</vh></v>
<v t="ekr.20190225130808.220"><vh>exportAsPDF</vh></v>
<v t="ekr.20190225130808.221"><vh>openFromUrl: url</vh></v>
<v t="ekr.20190225130808.222"><vh>pdfFile</vh></v>
<v t="ekr.20190225130808.223"><vh>exportAsSton: aNotebook on: aFileStream</vh></v>
<v t="ekr.20190225130808.224"><vh>saveWorkingNotebook</vh></v>
<v t="ekr.20190225130808.225"><vh>openFromUrlUI</vh></v>
<v t="ekr.20190225130808.226"><vh>exportAsMarkdown</vh></v>
<v t="ekr.20190225130808.227"><vh>saveToFile: aFileReference</vh></v>
<v t="ekr.20190225130808.228"><vh>subtreeAsMarkdownFor: aNode</vh></v>
<v t="ekr.20190225130808.229"><vh>saveToFileUI</vh></v>
<v t="ekr.20190225130808.230"><vh>exportAsHTML</vh></v>
<v t="ekr.20190225130808.231"><vh>exportAsLaTeX</vh></v>
<v t="ekr.20190225130808.232"><vh>openFromFile: aFileReference</vh></v>
</v>
<v t="ekr.20190225130808.233"><vh>api</vh>
<v t="ekr.20190225130808.234"><vh>notebookContent: aTree</vh></v>
<v t="ekr.20190225130808.235"><vh>extent</vh></v>
</v>
<v t="ekr.20190225130808.236"><vh>private</vh>
<v t="ekr.20190225130808.237"><vh>okToChange</vh></v>
</v>
<v t="ekr.20190225130808.238"><vh>initialization</vh>
<v t="ekr.20190225130808.239"><vh>notebookSubMenu</vh></v>
<v t="ekr.20190225130808.240"><vh>initializeDefaultTest</vh></v>
<v t="ekr.20190225130808.241"><vh>initializePresenter</vh></v>
<v t="ekr.20190225130808.242"><vh>initialize</vh></v>
<v t="ekr.20190225130808.243"><vh>projectSubMenu</vh></v>
<v t="ekr.20190225130808.244"><vh>initializeWidgets</vh></v>
<v t="ekr.20190225130808.245"><vh>topBar</vh></v>
</v>
<v t="ekr.20190225130808.246"><vh>utilities</vh>
<v t="ekr.20190225130808.247"><vh>metadata</vh></v>
<v t="ekr.20190225130808.248"><vh>pandocOptions</vh></v>
<v t="ekr.20190225130808.249"><vh>defineDebugMessageUI</vh></v>
<v t="ekr.20190225130808.250"><vh>addCommandFrom: dictionary into: stream</vh></v>
<v t="ekr.20190225130808.251"><vh>navigateRelativePathFor: aFileString</vh></v>
<v t="ekr.20190225130808.252"><vh>markdownFileChecksum</vh></v>
<v t="ekr.20190225130808.253"><vh>pandocOptionsComputed</vh></v>
<v t="ekr.20190225130808.254"><vh>listImagesUI</vh></v>
<v t="ekr.20190225130808.255"><vh>checksum</vh></v>
<v t="ekr.20190225130808.256"><vh>markdownFileChecksumUpto: anInteger</vh></v>
</v>
<v t="ekr.20190225130808.257"><vh>utility</vh>
<v t="ekr.20190225130808.258"><vh>SHA1For: aFile is: aSHA1String</vh></v>
</v>
<v t="ekr.20190225130808.259"><vh>specs</vh>
<v t="ekr.20190225130808.260"><vh>defaultSpec</vh></v>
</v>
</v>
<v t="ekr.20190225130808.261"><vh>GrafoscopioNotebookTest</vh></v>
<v t="ekr.20190225130808.262"><vh>GrafoscopioReplace</vh>
<v t="ekr.20190225130808.263"><vh>initialization</vh>
<v t="ekr.20190225130808.264"><vh>initializePresenter</vh></v>
<v t="ekr.20190225130808.265"><vh>initializeWidgets</vh></v>
<v t="ekr.20190225130808.266"><vh>returnValues</vh></v>
</v>
<v t="ekr.20190225130808.267"><vh>private</vh>
<v t="ekr.20190225130808.268"><vh>okToChange</vh></v>
</v>
<v t="ekr.20190225130808.269"><vh>accessing</vh>
<v t="ekr.20190225130808.270"><vh>find</vh></v>
<v t="ekr.20190225130808.271"><vh>cancel</vh></v>
<v t="ekr.20190225130808.272"><vh>ok</vh></v>
<v t="ekr.20190225130808.273"><vh>replace</vh></v>
<v t="ekr.20190225130808.274"><vh>cancel: anObject</vh></v>
<v t="ekr.20190225130808.275"><vh>find: anObject</vh></v>
<v t="ekr.20190225130808.276"><vh>replace: anObject</vh></v>
<v t="ekr.20190225130808.277"><vh>ok: anObject</vh></v>
</v>
<v t="ekr.20190225130808.278"><vh>api</vh>
<v t="ekr.20190225130808.279"><vh>title</vh></v>
</v>
<v t="ekr.20190225130808.280"><vh>specs</vh>
<v t="ekr.20190225130808.281"><vh>defaultSpec</vh></v>
</v>
</v>
<v t="ekr.20190225130808.282"><vh>GrafoscopioTextModel</vh>
<v t="ekr.20190225130808.283"><vh>API</vh>
<v t="ekr.20190225130808.284"><vh>content: aGrafoscopioNodeContent</vh></v>
</v>
<v t="ekr.20190225130808.285"><vh>accessing</vh>
<v t="ekr.20190225130808.286"><vh>body</vh></v>
<v t="ekr.20190225130808.287"><vh>body: anObject</vh></v>
</v>
<v t="ekr.20190225130808.288"><vh>initialization</vh>
<v t="ekr.20190225130808.289"><vh>initializeWidgets</vh></v>
</v>
<v t="ekr.20190225130808.290"><vh>specs</vh>
<v t="ekr.20190225130808.291"><vh>defaultSpec</vh></v>
</v>
</v>
<v t="ekr.20190225130808.292"><vh>MendaIcons</vh>
<v t="ekr.20190225130808.293"><vh>gt-inspector</vh>
<v t="ekr.20190225130808.294"><vh>gtInspectorIconsIn: composite</vh></v>
</v>
<v t="ekr.20190225130808.295"><vh>initialization</vh>
<v t="ekr.20190225130808.296"><vh>initializeIcons</vh></v>
<v t="ekr.20190225130808.297"><vh>initialize</vh></v>
<v t="ekr.20190225130808.298"><vh>iconSelectors</vh></v>
</v>
</v>
<v t="ekr.20190225130808.299"><vh>GrafoscopioDocs</vh>
<v t="ekr.20190225130808.300"><vh>initialization</vh>
<v t="ekr.20190225130808.301"><vh>initialize</vh></v>
<v t="ekr.20190225130808.302"><vh>initialize</vh></v>
</v>
<v t="ekr.20190225130808.303"><vh>operation</vh>
<v t="ekr.20190225130808.304"><vh>manual</vh></v>
<v t="ekr.20190225130808.305"><vh>openPDFManual</vh></v>
<v t="ekr.20190225130808.306"><vh>devNotes</vh></v>
<v t="ekr.20190225130808.307"><vh>tutorial</vh></v>
</v>
</v>
<v t="ekr.20190225130808.308"><vh>ManifestGrafoscopio</vh>
<v t="ekr.20190225130808.309"><vh>code-critics</vh>
<v t="ekr.20190225130808.310"><vh>ruleRBClassNameInSelectorRuleV1FalsePositive</vh></v>
<v t="ekr.20190225130808.311"><vh>ruleRBBooleanPrecedenceRuleV1FalsePositive</vh></v>
<v t="ekr.20190225130808.312"><vh>ruleRBStringConcatenationRuleV1FalsePositive</vh></v>
<v t="ekr.20190225130808.313"><vh>ruleRBEqualsTrueRuleV1FalsePositive</vh></v>
<v t="ekr.20190225130808.314"><vh>ruleRBSentNotImplementedRuleV1FalsePositive</vh></v>
<v t="ekr.20190225130808.315"><vh>ruleRBCascadedNextPutAllsRuleV1FalsePositive</vh></v>
<v t="ekr.20190225130808.316"><vh>ruleRBShouldntRaiseErrorRuleV1FalsePositive</vh></v>
<v t="ekr.20190225130808.317"><vh>ruleSmTMethodTestedRuleV1FalsePositive</vh></v>
<v t="ekr.20190225130808.318"><vh>ruleRBLongMethodsRuleV1FalsePositive</vh></v>
<v t="ekr.20190225130808.319"><vh>ruleRBBadMessageRuleV1FalsePositive</vh></v>
<v t="ekr.20190225130808.320"><vh>ruleRBAssignmentInIfTrueRuleV1FalsePositive</vh></v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20190225121333.1">'''Convert the marked trees to a .st file.'''

base_dir = r'c:\test'

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
    fn = g.os_path_finalize_join(base_dir, fn)
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
    '''Read the next line of the input.'''
    class_name, super_class_name = self.is_class(line)
    if class_name:
        # A new class declaration.
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
        # probably should not happen.
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
<t tx="ekr.20190225130807.1">@language pharo

</t>
<t tx="ekr.20190225130807.2">Object subclass: #FileUtils
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-Model'!
!FileUtils commentStamp: 'OffrayLuna 1/1/2017 21:41' prior: 0!
I provide some convenience functionality to work with files.!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

FileUtils class
	instanceVariableNames: ''!
</t>
<t tx="ekr.20190225130807.3"></t>
<t tx="ekr.20190225130807.4">createFilesNamed: fileNames endingWith: fileExtension intoFolder: aFolder
	
	| createdFiles fullFileName existingFiles typedFileName |
	createdFiles := OrderedCollection new.
	existingFiles := OrderedCollection new.
	fileNames do: [ :eachFile | 
		typedFileName := eachFile, fileExtension.
		fullFileName := aFolder / typedFileName.
		fullFileName exists
			ifFalse: [ 
				fullFileName ensureCreateFile.
				createdFiles add: fullFileName basename ]
			ifTrue: [existingFiles add: fullFileName basename ]].
	^ (Dictionary new  
			at: 'created files' put: createdFiles;
			at: 'existing files' put: existingFiles;
			yourself)


</t>
<t tx="ekr.20190225130808.1">Object subclass: #GrafoscopioNode
	instanceVariableNames: 'header headers key icon body tags children parent node level nodesInPreorder links output'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-Model'!
!GrafoscopioNode commentStamp: '&lt;historical&gt;' prior: 0!
An UbakyeNode is and administrator of all node operations in a tree.

Instance Variables
	node:		&lt;Object&gt;

node
	- xxxxx
!
</t>
<t tx="ekr.20190225130808.10">find: aString andReplaceWith: anotherString
	anotherString ifNil: [ ^ self ].
	self body: ((self body) copyReplaceAll: aString with: anotherString)
</t>
<t tx="ekr.20190225130808.100">testRemoveLeadingLineNumbersSized
	| copiedCode testNode |
	copiedCode := '
 1var tree = d3.layout.tree()
 2    .sort(null)
 3    .size([size.height, size.width - maxLabelLength*options.fontSize])
 4    .children(function(d)
 5    {
 6        return (!!d.contents || d.contents.length === 0) ? null : d.contents;
 7    });
 8
 9var nodes = tree.nodes(treeData);
10var links = tree.links(nodes);
11  '.
	testNode := GrafoscopioNode new
		body: copiedCode.
	testNode removeLeadingLineNumbersSized: 3.
	self assert: testNode body equals: '
var tree = d3.layout.tree()
    .sort(null)
    .size([size.height, size.width - maxLabelLength*options.fontSize])
    .children(function(d)
    {
        return (!!d.contents || d.contents.length === 0) ? null : d.contents;
    });

var nodes = tree.nodes(treeData);
var links = tree.links(nodes);
  
'
</t>
<t tx="ekr.20190225130808.101"></t>
<t tx="ekr.20190225130808.102">testInitializeIsOk
	self shouldnt: [ GrafoscopioNode new ] raise: Error
</t>
<t tx="ekr.20190225130808.103">dummyHtml
	| txt |
	txt := '&lt;html&gt; &lt;body&gt; &lt;img src="/web/files/pharo-logo-small.png"&gt;
			&lt;img src="https://pharo.org/web/files/pharo.png"&gt;
			&lt;/body&gt;&lt;/html&gt;'.
	^ txt
</t>
<t tx="ekr.20190225130808.104">testAddingChildren
	| tree nnode orig | 
	tree := GrafoscopioNode new becomeDefaultTestTree.
	nnode := GrafoscopioNode new.
	orig := tree children size.
	tree addNode: nnode.
	self assert: tree children size equals: orig + 1.
</t>
<t tx="ekr.20190225130808.105">testDemoteNode
	| tree child1 child2 | 
	tree := GrafoscopioNode new.
	child1 := GrafoscopioNode new.
	child2 := GrafoscopioNode new.
	tree 
		addNode: child1;
		addNode: child2.
	child2 demote.
	self assert: child2 level equals: child1 level + 1
</t>
<t tx="ekr.20190225130808.106">testHasMarkdownSubtreesToExport
	"Because becomeDefaultTestTree contains at least one non empty 'links' object that
	points to a relative path in the file system, ending in '.md' or '.markdown' the
	result of this test is true.
	Please see look #becomeDefaultTestTree message to see the details that makes this test true."
	| tree | 
	tree := GrafoscopioNode new becomeDefaultTestTree.
	self assert: tree selectMarkdownSubtreesToExport isNotEmpty equals: true.
</t>
<t tx="ekr.20190225130808.107">testPromoteNode
	| tree child1 child2 | 
	tree := GrafoscopioNode new.
	child1 := GrafoscopioNode new.
	child2 := GrafoscopioNode new.
	tree addNode: child1.
	child1 addNode: child2.
	child2 promote.
	self assert: child2 level equals: child1 level
</t>
<t tx="ekr.20190225130808.108">testRemovingChildren
	| tree orig | 
	tree := GrafoscopioNode new becomeDefaultTestTree.
	orig := tree children size.
	orig &gt; 0 ifTrue: [ tree removeNode: (tree children at: 1) ].
	self assert: tree children size equals: orig - 1.
</t>
<t tx="ekr.20190225130808.109">testFindAndReplace
	| tree | 
	tree := GrafoscopioNode new.
	tree body: 'I''m only a test node.'.
	tree find: 'only' andReplaceWith: 'JUST'.
	self assert: (tree body findString: 'JUST') &gt; 0.
	


</t>
<t tx="ekr.20190225130808.11"></t>
<t tx="ekr.20190225130808.110">Object subclass: #MindMap
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-Model'!
!MindMap commentStamp: 'OffrayLuna 12/13/2017 13:04' prior: 0!
I provide support for minmapping Freemind import and d3js export.
In the future I'll plan to support exporting from Grafoscopio notebooks
to javascript enabled web presentations.!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

MindMap class
	instanceVariableNames: ''!

!MindMap class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/13/2017 17:13'!
d3TreeDemoData
	"I'm demo data for the tutorial contain at: https://blog.pixelingene.com/2011/07/building-a-tree-diagram-in-d3-js/"
	^ 'var treeData = {
    name: "/",
    contents: [
        {
            name: "Applications",
            contents: [
                { name: "Mail.app" },
                { name: "iPhoto.app" },
                { name: "Keynote.app" },
                { name: "iTunes.app" },
                { name: "XCode.app" },
                { name: "Numbers.app" },
                { name: "Pages.app" }
            ]
        },
        {
            name: "System",
            contents: []
        },
        {
            name: "Library",
            contents: [
                {
                    name: "Application Support",
                    contents: [
                        { name: "Adobe" },
                        { name: "Apple" },
                        { name: "Google" },
                        { name: "Microsoft" }
                    ]
                },
                {
                    name: "Languages",
                    contents: [
                        { name: "Ruby" },
                        { name: "Python" },
                        { name: "Javascript" },
                        { name: "C#" }
                    ]
                },
                {
                    name: "Developer",
                    contents: [
                        { name: "4.2" },
                        { name: "4.3" },
                        { name: "5.0" },
                        { name: "Documentation" }
                    ]
                }
            ]
        },
        {
            name: "opt",
            contents: []
        },
        {
            name: "Users",
            contents: [
                { name: "pavanpodila" },
                { name: "admin" },
                { name: "test-user" }
            ]
        }
    ]
};'

!MindMap class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/13/2017 18:39'!
d3TreeUpdater
	^ 'function update (source) { 
			// Compute the new tree layout.
			var nodes = tree.nodes(root).reverse(),
				links = tree.links(nodes);
				
			// Normalize for fixed-depth.
			nodes.forEach(function(d) { d.y = d.depth * 180 });
			
			// Declare the nodes
			var node = svg.selectAll("g.node")
				.data(nodes, function(d) { return d.id || (d.id = ++i); });
			
			// Enter the nodes.
			var nodeEnter = node.enter().append("g")
				.attr("class", "node")
				.attr("transform", function(d) { 
				 	return "translate(" + d.y + "," + d.x + ")";});
					
			nodeEnter.append("circle")
				.attr("r",10)
				.style("fill", "#fff");
				
			nodeEnter.append("text")
				.attr("x", function (d) { 
				 return d.children || d._children ? -13 : 13; })
				.attr("dy", ".35em")
				.attr("text-anchor", function(d) { 
				 return d.children || d._children ? "end" : "start"; })
				.text(function(d) { return d.name; })
				.style ("fill-opacity", 1);
				
			// Declare the links
			var link = svg.selectAll("path.link")
				.data(links, function(d) { return d.targed.id });
				
			// Enter the links.
			link.enter().insert("path","g")
				.attr("class", "link")
				.attr("d", diagonal);
			
	}'

!MindMap class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/13/2017 17:44'!
d3CSS
	"I define the nodes geometrical form, their text and the links between them."
	^ ' .node circle {
   fill: #fff;
   stroke: steelblue;
   stroke-width: 3px;
 }

 .node text { font: 12px sans-serif; }

 .link {
   fill: none;
   stroke: #ccc;
   stroke-width: 2px;
 }'

!MindMap class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/13/2017 17:55'!
d3TreeDiagramProperties
	^ 'var margin = {top: 20, right: 120, bottom: 20, left: 120},
 width = 960 - margin.right - margin.left,
 height = 500 - margin.top - margin.bottom;
 
var i = 0;

var tree = d3.layout.tree()
 .size([height, width]);'

!MindMap class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/13/2017 18:03'!
d3SVGAppender
	"I append the SVG working area to the body of our web page and create a group elements 
	(&lt;g&gt;) that will contain the SVG objects (the nodes, text and links)"

	^'var svg = d3.select("body").append("svg")
 .attr("width", width + margin.right + margin.left)
 .attr("height", height + margin.top + margin.bottom)
  .append("g")
 .attr("transform", "translate(" + margin.left + "," + margin.top + ")");'

!MindMap class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/13/2017 18:24'!
d3TreeUpdaterCaller
	^ 'update(root)'

!MindMap class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/13/2017 18:11'!
d3TreeRootDefinition
	"For an excellent explanation on whi this, look at:
	http://www.d3noob.org/2014/01/tree-diagrams-in-d3js_11.html"
	^ 'root = treeData[0];'

!MindMap class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/13/2017 17:57'!
d3TreeLinksDrawerFunction
	^ 'var diagonal = d3.svg.diagonal()
 .projection(function(d) { return [d.y, d.x]; });'


</t>
<t tx="ekr.20190225130808.111">Object subclass: #Pandoc
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-Model'!
!Pandoc commentStamp: 'OffrayLuna 12/6/2017 15:43' prior: 0!
I model the interaction between Pandoc and Grafoscopio.!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Pandoc class
	instanceVariableNames: 'executable'!
</t>
<t tx="ekr.20190225130808.112"></t>
<t tx="ekr.20190225130808.113">extractImagesInUnixFor: aFileReference withFilter: aLuaFilter
	"I use Pandoc Lua scripting capabilities to extract al images links in aFileReference"

	OSSUnixSubprocess new
	command: 'pandoc';
	arguments: {aFileReference fullName .  '--lua-filter=',aLuaFilter fullName };
	redirectStdout;
	redirectStderr;
	runAndWaitOnExitDo: [ :process :outString :errString |
		process isSuccess
			ifTrue: [ 
				^ ((Soup fromString: outString) findAllTags: 'td') collect: [ :each | each next ] ]
			ifFalse: [
				"OSSUnixProcessExitStatus has a nice #printOn: "
				Transcript show: 'Command exit with error status: ', process exitStatusInterpreter printString; cr.
				Transcript show: 'Stderr contents: ', errString.
			]
	]
</t>
<t tx="ekr.20190225130808.114">luaFilters
	"I define the location of set of scripts, that allows to change the default behaviour of Pandoc
	and/or the processing of supported markup languages. 
	
	For more information about Lua filters see:
	
	https://pandoc.org/lua-filters.html
	"

	| filters |
	filters := OrderedCollection new.
	filters 
		add: 'http://mutabit.com/repos.fossil/dataweek/doc/tip/Artefactos/Scripts/image-links.lua'.
	^ filters
</t>
<t tx="ekr.20190225130808.115"></t>
<t tx="ekr.20190225130808.116">htmlToMarkdown: inputFile
	
	| outputFile |
	outputFile := FileLocator temp / 'body.md'.
	outputFile ensureDelete.
	outputFile ensureCreateFile.
	OSSUnixSubprocess new
		command: 'pandoc';
		arguments: {'-f'. 'html'. '-t'. 'markdown'. '--atx-headers'. inputFile fullName. 
			'--output'. outputFile fullName  };
	redirectStdout;
	redirectStderr;
	runAndWaitOnExitDo: [ :process :outString :errString |
		process isSuccess
			ifTrue: [ ^ outputFile contents ]
			ifFalse: [ ^inputFile contents ]
	]
</t>
<t tx="ekr.20190225130808.117"></t>
<t tx="ekr.20190225130808.118">executable
	^ executable ifNil: [ self executableLocation ]
</t>
<t tx="ekr.20190225130808.119">executable: aFileReference
	executable := aFileReference
</t>
<t tx="ekr.20190225130808.12">becomeDefaultTree
	"I create a starting tree for all Grafoscopio notebooks with just one textual node as child."
	| node1 |
	self class new.
	self
		level: 0;
		header: 'Arbol principal';
		tagAs: 'cÃ³digo'.	
	node1 := self class new
		header: 'Node 1';
		body:  '';
		tagAs: 'text'.	
	self addNode: node1.
	^ self
</t>
<t tx="ekr.20190225130808.120">executableLocation
	| location |
	location := '/usr/bin/pandoc'.
	location asFileReference exists
		ifTrue: [ ^ location ]
		ifFalse: [ self definePandocExecutable ]


!Pandoc class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/6/2017 18:25'!
downloadLuaFilters
	self luaFilters do: [ :filter | | filterUrl |
		filterUrl := filter asUrl.
		(FileLocator temp asFileReference / (filterUrl segments last)) exists
			ifFalse: [ 
				ZnClient new
					url:  filterUrl;
					downloadTo: FileLocator temp ] ]

!Pandoc class methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 10/3/2018 10:00'!
listImagesFrom: aFileReference
	"I provide a list of all images contained in aFile."
	| filter commandString outputString |
	filter := FileLocator temp asFileReference / 'image-links.lua'.
	filter exists ifFalse: [ self downloadLuaFilters ].
	commandString := 'pandoc ', aFileReference fullName, ' --lua-filter=',filter fullName.
	Smalltalk platformName = 'unix'
		ifTrue: [ ^ self extractImagesInUnixFor: aFileReference withFilter: filter  ].
	Smalltalk platformName = 'Win32'
		ifTrue: [ self ].
</t>
<t tx="ekr.20190225130808.121">Object subclass: #FontAwesomeIcons
	instanceVariableNames: 'icons'
	classVariableNames: 'Current'
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!FontAwesomeIcons commentStamp: 'OffrayLuna 9/9/2015 21:36' prior: 0!
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

I'm FontAwesomeIcons, a custom selection of some icons in this font family used for the GUI of grafoscopio.

For the Responsibility part: Three sentences about my main responsibility, what I'm doing, what services do I offer.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- what is the way to create instances is a plus.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	icons:		&lt;Object&gt;


    Implementation Points!


!FontAwesomeIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
tagsIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/FontAwesome/Png/tags.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAANCAYAAACgu+4kAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAAXRJREFUKJGN0j1Mk1EYxfH/edRFSKijH4kTJBgTJ0cGTdxE
TKyUGAfFSQcKUl3taIjIh3EUTJzaAoORwUGdmUlMXB1ktSaQGNp7HOyrgG8jZ733+d1zc69G
y9NvsC6RRbZhIxQLtkdtX5DjSW1x5hM5CdBtxGnjLUQf6IzQDSfXWu30EvTF4fdjE49GugCA
Wa8vPLuIufO3CSePRnxspzQr+3UKGnlIdGoPlMqV84ihfasdpJX8XLCch0RnZz/SJlD+p2OG
tNNcHhLA57y7dUOwl/YiKk48vCLFuuDYfyGz1Urp8pHQJNK4SUXZZqz8+GqS1w6DGL/j29fr
OnX2O6b1+9XhsIixbyX0M8Sa8Ys/AEBpqjJsa7ULYtt3JTexGoZX5070PtgHANycnL4mYuUA
YsO4TTNwHWlpsNBzv1qtpjh4TGN+9q1JRcPuntr3Av8IXAeWs2HIfn5OSlOVYayntmeON3tr
O4XtD4KNwUJPJRsG+AVxqr+5c/rf8wAAAABJRU5ErkJggg=='

!FontAwesomeIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
copyIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/FontAwesome/Png/copy.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA2UlEQVR4nJXQIU6DQRAF4K+F
4DAYVFHlBEgctQgScL0DCbp3wKNJOAIXQDcEC5iqQoNsA4KkiO6GJX92/p+XvGxm983bN8Mv
+rjFOnFYMNchbvCNSWooUTXopfMalxhjipfiLRucYg9bxf0zXCXBJP1yUkmwxhyviTN8wVsh
yHwsms/wiSUuivu8m3BBR1hglH5tGGxXGmGAO5zjIdBVE9xrjnb8nwQjHBb1ymaJfxAZ7NjM
HSIbHLQJIzxpzpoZYdim6WTQ7xayjmiJ7x1SLHrB4y72Www+fgBc9T/67LlhnQAAAABJRU5E
rkJggg=='

!FontAwesomeIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
html5IconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/FontAwesome/Png/html5.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA+UlEQVR4nK3Tv0oDQRDH8c9J
BMFKJGIXBBtFwc7SUlDfwpewEewsbQQL8QHsA2lSiK2NCFr4Av4hjYigVSxuV/bWjRhxYJhl
9uY7v9m9rdR2ikm/tx7OoRUSO5gfA3AfFxMhPo9RDE85ICZ2Uf3gNzkgjhAVzIV4hJlC58Vc
cQ5oh7iJpb+MEBUsF+Snh/wNkI9QsqjuFe+jABu4xgDDxFcS+Ff30ggDrOEs6/6YKGgA8kOc
DfEQV+jgMoDb2bcNm0rkHqv/zOmwt4o93IX9kxIAXjTn/sBDlhviYBRgH7eFguhv6GI9LaoK
oA62sYUF9NWv70Jyff9mnwBsQJo0owsMAAAAAElFTkSuQmCC'

!FontAwesomeIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
tagIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/FontAwesome/Png/tag.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAmUlEQVR4nKXPMQ4BQRSA4U9D
oeIgKsdwAUfARSSiUTmExgUcYU8gGoVGpZFIGM0WG5mxM0zyMpni/zKPP0+nvleYNN4BZyxx
yIGedfQ5L8xygIA7RhjjUYoEXNFDH7fIT+ZtQMARpy/rJJFLIorNIgasC4Ao0sW+EJn+i2xi
q+QiFQYxIAepMEzFbUhWnEKK4iayxe6XOOu8ARtNbaMQ63x5AAAAAElFTkSuQmCC'

!FontAwesomeIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
pasteIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/FontAwesome/Png/paste.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAqUlEQVR4nK3TTQrBQRzG8c/I
yk6SsrAilk5hYWfjWA6hXICycwtLByDJ2upvgZrG6+BbU7+3nnnmVxNQuDDC2j09LK5xB5u4
WY7iUpLH9ZcUGaedrZ4wznWQzh0wQfjWwRB9TF33lStwwABHzFG5WfvkCfsH/Vl4MBgToriC
ZpS3sMxxkNJGkbuDO/4isPtFoIwu6km9hdUvwg2cvP8bu/BMAVXU3ly0PQOGrUCXHk1emQAA
AABJRU5ErkJggg=='

!FontAwesomeIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
cutIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/FontAwesome/Png/cut.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABOUlEQVR4nNXSzyvlYRTH8Rcu
N5dmIt2FX4VpJktRUpKssB//wGSDUsrCahYzuykaGyk/YiFlb2VhYWVhYaUkKxsbTSYSYfE9
V3e+EQub+dRTz4/zvM85n+fhHXSNhxhX+IHSV+50IVNYbKAKn7EeoO8vXOyNmHFsolFMirWD
89TeFyxhEuXoxjI+ZPAVFZjHX+SRQz3uMINbTOMCoxEzinsYwlGRDw/4iX2s4VNUkcUvDD/X
Wwna0Y8WLGI7snSgGatx9o8KTn4MQB6VqA1ITuL4IP5E76dpyBQuUy0shGmHElPLI3YSs+HZ
k+4kb98QlewGMIsyfMMKOiO+B1toKgDmimC5yHqSqjIb2efRhrqAtGbQhxHJs41JXB9JAW7w
G9WYkHygY5zBQfR9jz0MpE16i2ok7v+HegQfqT9MAMiDKwAAAABJRU5ErkJggg=='


!FontAwesomeIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 9/10/2015 11:13'!
html5Icon
	"Private - Generated method"
	^Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self html5IconContents readStream)

!FontAwesomeIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 9/10/2015 11:13'!
tagIcon
	"Private - Generated method"
	^Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self tagIconContents readStream)

!FontAwesomeIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 9/10/2015 11:13'!
cutIcon
	"Private - Generated method"
	^Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self cutIconContents readStream)

!FontAwesomeIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 9/10/2015 11:13'!
pasteIcon
	"Private - Generated method"
	^Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self pasteIconContents readStream)

!FontAwesomeIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:34'!
tagsIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self tagsIconContents base64Decoded readStream)

!FontAwesomeIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 9/10/2015 11:13'!
copyIcon
	"Private - Generated method"
	^Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self copyIconContents readStream)


</t>
<t tx="ekr.20190225130808.122">DynamicComposablePresenter subclass: #GfUIHelpers
	instanceVariableNames: 'windowMainMenu tree nodeHeader nodeBody'
	classVariableNames: 'dockingBar recentNotebooks'
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!GfUIHelpers commentStamp: 'OffrayLuna 6/26/2016 21:33' prior: 0!
I'm the Graphical User Interface for Grafoscopio environment. 

My main responsability is to provide grafoscopio with a docking bar
with menu options for open, browse notebooks, update the system
and its components and the help menu.
!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GfUIHelpers class
	instanceVariableNames: 'dockingBar recentNotebooks helpMenu'!

!GfUIHelpers class methodsFor: 'graphical interface' stamp: 'OffrayLuna 5/3/2017 10:15'!
messageAbout
	"I show the author(s), license, sponsors and main contributors to the project 
	and point to further documentation on the web"
	LongMessageDialogWindow new
		entryText: 
			'_.:| Grafoscopio |:._', 
			(String with: Character cr),
			'(c) Copyright 2014-2017 by Offray Vladimir Luna CÃ¡rdenas',
			(String with: Character cr),
			'Covered under MIT license.',
			(String with: Character cr),
			(String with: Character cr),
			'[ Sponsors ]',
			(String with: Character cr),
			'mutabiT | www.mutabit.com  ',
			(String with: Character cr),		
			'HiTec Lab, FundaciÃ³n Universitaria Los Libertadores | www.ulibertadores.edu.co  ',
			(String with: Character cr),
			(String with: Character cr),
			'[ Thanks to ]',
			(String with: Character cr),
			'HackBo, Hackerspace Bogota | http://hackbo.co',
			(String with: Character cr),
			'// Regular workshops attendees \\ 
					Rafael Medida, IvÃ¡n Pulido, Camilo Hurtado',
			(String with: Character cr),
			'// Coffe talk (mostly about grafoscopio) \\
		Yanneth Gil, AndrÃ©s CalderÃ³n, Luis Alejandro Bernal',
			(String with: Character cr),
			'// Pharo, Moose and Agile Visualization communities \\
		Tudor Girba, Alexandre Bergel, Nicolai Hess, Peter UhnÃ¡k, Milton Mamani  ',
			(String with: Character cr),
			'// Family support while writing, coding &amp; travelling (among others!!) \\ 
		Divian Luna, Hilda CÃ¡rdenas',
			(String with: Character cr),
			(String with: Character cr),
				'For further details and versions go to:',
			(String with: Character cr),		
			(String with: Character cr),		
			'http://mutabit.com/grafoscopio';
		title: 'About Grafoscopio';
		open.

!GfUIHelpers class methodsFor: 'graphical interface' stamp: 'OffrayLuna 2/18/2019 16:21'!
openFromRecentlyUsed	
	"Opens a recent notebooks list"
	| selection recentNotebooksReversed |

	self recentNotebooks
		ifNotEmpty: [
			recentNotebooksReversed := recentNotebooks reversed. 
			selection := UIManager default 
					chooseFrom: recentNotebooksReversed title: 'Choose a notebook...'.
			selection &gt; 0
				ifTrue: [ GrafoscopioNotebook new openFromFile: (recentNotebooksReversed at: selection)]
				ifFalse: [ self inform: 'No notebook selected!!' ]
		]
		ifEmpty: [self messageNoRecentDocuments]	
	



!GfUIHelpers class methodsFor: 'graphical interface' stamp: 'OffrayLuna 5/3/2017 10:03'!
messageNotImplementedYet
	"Shows that a feature is not implemeted and point to further documentation on the web"

	UIManager default abort: 
		'This functionality is not implemented yet!!', 
		(String with: Character cr),
		'For more information about future releases, please visit:   ',
		(String with: Character cr),
		(String with: Character cr), 
		'http://mutabit.com/grafoscopio',
		(String with: Character cr),
		(String with: Character cr)
		title: 'To be implemented'.

!GfUIHelpers class methodsFor: 'graphical interface' stamp: 'OffrayLuna 2/15/2019 09:33'!
messageNoRecentDocuments
	"Shows that a feature is not implemeted and point to further documentation on the web"

	UIManager default abort: 
		'Recent documents list is emtpy.', 
		(String with: Character cr),
		'To fill it, open a document using the Grafoscopio menu option at the top bar:',
		(String with: Character cr),
		(String with: Character cr), 
		'"Launch &gt; Notebook from file..."',
		(String with: Character cr),
		(String with: Character cr)
		title: 'No recent documents'.
</t>
<t tx="ekr.20190225130808.123"></t>
<t tx="ekr.20190225130808.124">updateSystem
	| tmp1 |
	tmp1 := UIManager default
		question: 'Do you wish to update all Grafoscopio and its co-dependencies ?'
		title: 'Grafoscopio update'.
	tmp1
		ifNotNil: [ tmp1
				ifTrue: [
					self
						updateGrafoscopio;
						updateDataviz.
					GrafoscopioDocumentation updateAll.
					self inform: 'System update finished.' ]]
</t>
<t tx="ekr.20190225130808.125">updateUI
	"I update the User Interface (UI) with new versions of the docking bar or logos where available. 
	I'm helpful while testing new functionality that should be expossed to the user via the UI"
	self start.
	(World submorphs select: [ :each | each class = DockingBarMorph ]) 
		allButFirstDo: [ :bar | bar delete ].
</t>
<t tx="ekr.20190225130808.126">updateDataviz
	"I update the Dataviz package with new versions of itself take from the source code
	repository. 
	DataViz contains Data visualization helpers"
	Gofer it 
 	  	smalltalkhubUser: 'Offray' project: 'Dataviz';
  	  	configurationOf: 'Dataviz';
	  	load.
	self inform: 'Dataviz package update finished.'
</t>
<t tx="ekr.20190225130808.127">updateGrafoscopio
	"Updates Grafoscopio with new versions of itself take from the source code repository and 
	reloads the User Interface"
	Gofer new 
		smalltalkhubUser: 'Offray' project: 'Grafoscopio';
   		package: 'Grafoscopio';
    	load.
	GrafoscopioUtils update.
</t>
<t tx="ekr.20190225130808.128">updateRecentNotebooksWith: aFileReference
	(self recentNotebooks includes: aFileReference) 
		ifFalse: [self recentNotebooks add: aFileReference].
</t>
<t tx="ekr.20190225130808.129">updateDatavizUI
	"I'm the User Interface for updating the Dataviz package with new versions of itself 
	take from the source code repository"
	| update |	
	update := (UIManager default 
						confirm: 
							'Dataviz is data visualization package, with several', String cr,
							'Domain Specific Examples, like Panama Papers, Twitter Data Selfies.', 
							String cr, 'Do you want to update it?'
						label: 'Update Dataviz package'). 
	update ifFalse: [ ^ self ].
	self updateDataviz
</t>
<t tx="ekr.20190225130808.13">initialize
	"I create a empty new node"
	
	super initialize.
	self 
		header: 'newHeader';
		tagAs: 'text';
		body: '';
		level: 0
</t>
<t tx="ekr.20190225130808.130">updatePrerrequisitesScript
	"Updates the system prerequisites with new versions of itself take from the source code repository"
	
	"Visualization library (which also makes main menu loadable)"
	Gofer it
		smalltalkhubUser: 'ObjectProfile' project: 'Roassal2';
    	configurationOf: 'Roassal2';
    	loadStable.

	"Support for the STON format used in file persistance for grafoscopio notebooks"
	Gofer new 
		smalltalkhubUser: 'SvenVanCaekenberghe' project: 'STON';
		configurationOf: 'Ston';
		loadBleedingEdge.

	"Moose and Roassal integration"
	Gofer new
		smalltalkhubUser: 'Moose' project: 'Glamour';
		package: 'Glamour-Tools';
		package: 'Glamour-Roassal2-Presentations';
		load.
	
	Gofer new
		smalltalkhubUser: 'Moose' project: 'GToolkit';
		package: 'GT-InspectorExtensions-CoreRoassal';
		load.
		
	"Fast Table support"
	Gofer it 
    smalltalkhubUser: 'estebanlm' project: 'FastTable';
    package: 'FastTable';
    load.

	"Integration with external tools"
	Gofer new 
	   	smalltalkhubUser: 'Offray' project: 'Grafoscopio';
 	   	package: 'Grafoscopio-ExternalTools';
  	  	load.

	"HTML scrapping"
	Gofer new 
 	  	smalltalkhubUser: 'PharoExtras' project: 'Soup';
  	  	configurationOf: 'Soup';
   	  	loadStable.
	
	"SQLite support"
	Gofer new
    url: 'http://smalltalkhub.com/mc/PharoExtras/NBSQLite3/main';
    package: 'NBSQLite3';
    load.

	Gofer new
    url: 'http://smalltalkhub.com/mc/PharoExtras/NBSQLite3/main';
    package: 'NBSQLite3-Examples';
    load.
	
	"Support for Operative System integration"
	Gofer new
		squeaksource: 'OSProcess';
		package: 'OSProcess';
		load.
		
	Gofer new
		squeaksource: 'CommandShell';
		package: 'CommandShell-Piping';
		load.
		
	"Bibliographic support"
	Gofer new 
		squeaksource: 'Citezen';
     	package: 'ConfigurationOfCitezen';
     	load.
</t>
<t tx="ekr.20190225130808.131">updateGrafoscopioUI
	"Updates Grafoscopio with new versions of itself take from the source code repository and 
	the User Interface"
	| update |
	
	update := (UIManager default 
						confirm: 'Do you wish to update Grafoscopio?' 
						label: 'Grafoscopio update').
	update ifFalse: [ ^ self ].
	self updateGrafoscopio.
	GrafoscopioUtils update.
	self updateUI.
	self inform: 'Grafoscopio update finished'
</t>
<t tx="ekr.20190225130808.132"></t>
<t tx="ekr.20190225130808.133">addToHelpMenu: aGrafoscopioNotebook 
	| metadata nbFile |
	metadata := aGrafoscopioNotebook metadata.
	nbFile := aGrafoscopioNotebook workingFile.
	(metadata at: 'showOnHelp' ifAbsent: [ ^ self ])
		ifTrue: [ 
			self helpMenu submorphs 
				detect: [ :s | s contents = (metadata at: 'shortTitle') ] 
				ifFound: [ 
					self inform: 
						'The notebook: ', String cr,
						nbFile fullName, String cr, 
						' needs another shortTitle to be added to the docking bar Help Menu.' ] 
				ifNone: [ 
					self helpMenu
						add: (metadata at: 'shortTitle')
						target: [ GrafoscopioNotebook open: nbFile ]
						selector: #value ] ].
	self updateUI
</t>
<t tx="ekr.20190225130808.134"></t>
<t tx="ekr.20190225130808.135">recentNotebooks
	^ recentNotebooks ifNil: [recentNotebooks := OrderedCollection new ]


</t>
<t tx="ekr.20190225130808.136">Object subclass: #GfWorldMenu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!GfWorldMenu commentStamp: 'OffrayLuna 2/13/2019 12:30' prior: 0!
I define the Grafoscopio main menu presented in the Pharo World.!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GfWorldMenu class
	instanceVariableNames: 'recentNotebooks'!

!GfWorldMenu class methodsFor: 'world menu' stamp: 'OffrayLuna 2/14/2019 10:53'!
mainMenuItemsOn: aBuilder
	"I add the main Grafoscopio menu to the Pharo World."
	&lt;worldMenu&gt;
	
	(aBuilder item: #Grafoscopio)
		label: 'Grafoscopio';
		order: 1;
		with: [ 
			(aBuilder item: #GfLaunch; label: 'Launch') target: self.
			(aBuilder item: #GfUpdate; label: 'Update') target: self.
			(aBuilder item: #GfHelpAndDocs; label: 'Help &amp; Docs') target: self. ]

!GfWorldMenu class methodsFor: 'world menu' stamp: 'OffrayLuna 2/14/2019 12:36'!
helpMenuOn: aBuilder
	&lt;worldMenu&gt;
	
	(aBuilder item: #GfManual)
		label: 'Manual';
		order: 1;
		parent: #GfHelpAndDocs;
		action: [ GrafoscopioNotebook open: GrafoscopioDocs manual ].
	(aBuilder item: #GfManualPDF)
		label: 'Manual (PDF)';
		order: 2;
		parent: #GfHelpAndDocs;
		action: [ GrafoscopioDocs openPDFManual ].
	(aBuilder item: #GfHelpDataviz)
		label: 'Dataviz';
		order: 3;
		parent: #GfHelpAndDocs;
		action: [ GrafoscopioNotebook open: DatavizDocs introNotebook ].
	(aBuilder item: #GfHelpDevNotes)
		label: 'Devs''s notes';
		order: 4;
		parent: #GfHelpAndDocs;
		action: [ GrafoscopioNotebook open: GrafoscopioDocs devNotes ].
	(aBuilder item: #GfHelpAbout)
		label: 'About Grafoscopio';
		order: 5;
		parent: #GfHelpAndDocs;
		action: [ GfUIHelpers messageAbout ].		

!GfWorldMenu class methodsFor: 'world menu' stamp: 'OffrayLuna 2/14/2019 12:36'!
updateMenuOn: aBuilder
	&lt;worldMenu&gt;
	
	(aBuilder item: #GfUpdateGrafoscopio)
		label: 'Grafoscopio';
		order: 1;
		parent: #GfUpdate;
		action: [ GfUIHelpers updateGrafoscopioUI ].
	(aBuilder item: #GfUpdateDocs)
		label: 'Documentation';
		order: 2;
		parent: #GfUpdate;
		action: [ GrafoscopioDocumentation updateAllUI ].
	(aBuilder item: #GfUpdateDataviz)
		label: 'DataViz package';
		order: 3;
		parent: #GfUpdate;
		action: [ GfUIHelpers updateDatavizUI ].
	(aBuilder item: #GfUpdateAll)
		label: 'All the system';
		order: 4;
		parent: #GfUpdate;
		action: [ GfUIHelpers updateSystem ].

!GfWorldMenu class methodsFor: 'world menu' stamp: 'OffrayLuna 2/15/2019 09:28'!
launchMenuOn: aBuilder
	&lt;worldMenu&gt;
	
	(aBuilder item: #'New notebook')
		label: 'New notebook';
		order: 1;
		parent: #GfLaunch;
		action: [ GrafoscopioNotebook new openDefault ].
	(aBuilder item: #'Notebook from file...')
		label: 'Notebook from file...';
		order: 2;
		parent: #GfLaunch;
		action: [ GrafoscopioNotebook new openFromFileSelector ].
	(aBuilder item: #'Notebook from the Internet...')
		label: 'Notebook from the Internet...';
		order: 3;
		parent: #GfLaunch;
		action: [ GrafoscopioNotebook new openFromUrlUI ].
	(aBuilder item: #recentNotebooks)
		label: 'Recent notebooks...';
		order: 4;
		parent: #GfLaunch;
		action: [ GfUIHelpers openFromRecentlyUsed ].
</t>
<t tx="ekr.20190225130808.137"></t>
<t tx="ekr.20190225130808.138">updateRecentNotebooksWith: aFileReference
	(self recentNotebooks includes: aFileReference) 
		ifFalse: [self recentNotebooks add: aFileReference].


</t>
<t tx="ekr.20190225130808.139">ComposableModel subclass: #GrafoscopioButtonModel
	instanceVariableNames: 'button'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!GrafoscopioButtonModel commentStamp: 'OffrayLuna 5/26/2017 10:20' prior: 0!
I'm just a prototype of how morphic buttons can be embedded
inside a Grafoscopio notebook UI via Spec.
I'm not used in the actual UI, but I'm more a remainder of directions
to explore.!
</t>
<t tx="ekr.20190225130808.14">becomeDefaultTestTree
	| node1 node2 node3 node4 |
	self 
		level: 0; 
		header: 'Arbol principal'.	
	node1 := self class new
		header: 'Markup';
		body:  'I am &lt;b&gt;just a node with markup&lt;/b&gt;';
		tagAs: 'text';
		links: 'temp.md';
		level: 1.
	node2 := self class new
		header: '%output Code';
		tagAs: 'cÃ³digo';
		body:  '(ConfigurationOfGrafoscopio&gt;&gt;#version14:) sourceCode'.
	node3 := self class new
		header: '%invisible';
		tagAs: 'text';
		body:  '&lt;i&gt;Just testing&lt;/i&gt;'.
	node1 addNode: node3.
	node4 := self class new
		header: 'Something';
		tagAs: 'text';
		body:  '&lt;h1&gt;else&lt;/h1&gt;'.
	node1 addNode: node4.
	node1 addNode: node2.
	self 
		addNode: node1.
</t>
<t tx="ekr.20190225130808.140"></t>
<t tx="ekr.20190225130808.141">initializeWidgets
	button := self newButton.
</t>
<t tx="ekr.20190225130808.142"></t>
<t tx="ekr.20190225130808.143">content: anAssoc
	button label: anAssoc key.
	button action: anAssoc value.
</t>
<t tx="ekr.20190225130808.144"></t>
<t tx="ekr.20190225130808.145">replace: anObject
	replace := anObject
</t>
<t tx="ekr.20190225130808.146">button: anObject
	button := anObject
</t>
<t tx="ekr.20190225130808.147">find: anObject
	find := anObject
</t>
<t tx="ekr.20190225130808.148">replace
	^ replace
</t>
<t tx="ekr.20190225130808.149">ok
	^ ok
</t>
<t tx="ekr.20190225130808.15"></t>
<t tx="ekr.20190225130808.150">find
	^ find
</t>
<t tx="ekr.20190225130808.151">body
	^ self button
</t>
<t tx="ekr.20190225130808.152">ok: anObject
	ok := anObject
</t>
<t tx="ekr.20190225130808.153">cancel: anObject
	cancel := anObject
</t>
<t tx="ekr.20190225130808.154">button
	^ button
</t>
<t tx="ekr.20190225130808.155">cancel
	^ cancel

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GrafoscopioButtonModel class
	instanceVariableNames: ''!
</t>
<t tx="ekr.20190225130808.156"></t>
<t tx="ekr.20190225130808.157">defaultSpec

	^ SpecLayout composed add: #button


</t>
<t tx="ekr.20190225130808.158">ComposableModel subclass: #GrafoscopioCodeModel
	instanceVariableNames: 'body'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!GrafoscopioCodeModel commentStamp: 'OffrayLuna 5/26/2017 10:22' prior: 0!
I represent a Pharo code node inside a Grafoscopio notebook as a 
embedded interactive Playground.!
</t>
<t tx="ekr.20190225130808.159"></t>
<t tx="ekr.20190225130808.16">output: anObject
	output := anObject
</t>
<t tx="ekr.20190225130808.160">body
	^ body
</t>
<t tx="ekr.20190225130808.161">body: anObject
	body := anObject


!GrafoscopioCodeModel methodsFor: 'as yet unclassified' stamp: 'EduardoRiesco 12/2/2017 16:49'!
extractHtmlImages
	"comment stating purpose of message"
	|imgSoup imgHost imgList src|

	imgList := Set new.
	imgSoup := Soup fromString: self body.
	(imgSoup findAllTags: 'img') do: [ :each|	
			src := (each attributeAt: 'src') asUrl.
			(src host) ifNil: [src host: self links last asUrl removeLastPathSegment].
			imgList add: src. 
			"imgList add: (each attributeAt: 'src') asUrl."
	
	  "OSProcess waitForCommand: 'wget ', (each attributeAt: 'src')."
	"imgHost := self links last removeLastPathSegment."
	
	"imgPath:= ((each attributeAt: 'src') asUrl). "
	"ZnEasy getJpeg: (imgHost , imgPath) asUrl."
	
	"OSProcess waitForCommand: ('mkdir ', imgPath)."
	
	"Transcript  show: ' wget ', imgPath , '/',(each attributeAt: 'src').	"
	]. 
	^imgList .
</t>
<t tx="ekr.20190225130808.162"></t>
<t tx="ekr.20190225130808.163">content: aGrafoscopioNodeContent

	body
		presentationClass: GTPlayground
		startOn: (GTPlayPage new saveContent: aGrafoscopioNodeContent)
</t>
<t tx="ekr.20190225130808.164"></t>
<t tx="ekr.20190225130808.165">initializeWidgets

	body := GlamourPresentationModel new.

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GrafoscopioCodeModel class
	instanceVariableNames: ''!
</t>
<t tx="ekr.20190225130808.166"></t>
<t tx="ekr.20190225130808.167">defaultSpec

	^ SpecLayout composed add: #body


</t>
<t tx="ekr.20190225130808.168">ComposableModel subclass: #GrafoscopioLinksList
	instanceVariableNames: 'links'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!GrafoscopioLinksList commentStamp: 'OffrayLuna 1/3/2019 22:11' prior: 0!
I model the links of a GrafoscopioNode.

I'm responsable for showing the links and selecting them.!
</t>
<t tx="ekr.20190225130808.169"></t>
<t tx="ekr.20190225130808.17">parent: aNode
	"A parent is a node that has the current node in its children"
	aNode ifNil: [ 
		parent := aNode.
		^self ]. 
	aNode parent = self ifTrue: [ ^ self ].
	parent := aNode.
	(aNode children includes: self) 
		ifFalse: [ aNode addNode: self ]
</t>
<t tx="ekr.20190225130808.170">links
	^ links
</t>
<t tx="ekr.20190225130808.171">content: aGrafoscopioNode
	links items: aGrafoscopioNode links
</t>
<t tx="ekr.20190225130808.172">links: anObject
	links := anObject
</t>
<t tx="ekr.20190225130808.173"></t>
<t tx="ekr.20190225130808.174">title
	^ 'Node links list'
</t>
<t tx="ekr.20190225130808.175"></t>
<t tx="ekr.20190225130808.176">initializeWidgets
	links := self newList.
	self focusOrder add: links
</t>
<t tx="ekr.20190225130808.177"></t>
<t tx="ekr.20190225130808.178">whenSelectedItemChanged: aBlock
	links whenSelectedItemChanged: aBlock

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GrafoscopioLinksList class
	instanceVariableNames: ''!
</t>
<t tx="ekr.20190225130808.179"></t>
<t tx="ekr.20190225130808.18">output
	(self isTaggedAs: 'cÃ³digo') ifFalse: [ ^ self ].
	self body ifNil: [ ^ nil ].
	^ (Compiler evaluate: self body)
</t>
<t tx="ekr.20190225130808.180">defaultSpec
	^ SpecLayout composed
		add: #links;
		yourself 


</t>
<t tx="ekr.20190225130808.181">ComposableModel subclass: #GrafoscopioLinkstModel
	instanceVariableNames: 'links'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!

</t>
<t tx="ekr.20190225130808.182">ComposableModel subclass: #GrafoscopioNotebook
	instanceVariableNames: 'tree header body links windowMainMenu workingFile notebook debugMessage imagesList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!GrafoscopioNotebook commentStamp: 'johanfabry 5/12/2016 11:13' prior: 0!
I am a Grafoscopio Notebook.

Example:
| testTree nb |
testTree := GrafoscopioNode new becomeDefaultTestTree.
nb := GrafoscopioNotebook new.
nb notebookContent: testTree.
nb openWithSpec !


!GrafoscopioNotebook methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 9/17/2017 13:57'!
findAndReplace
	| currentNode replaceGUI findString replaceString |
	currentNode := tree highlightedItem content.
	replaceGUI := GrafoscopioReplace new.
	replaceGUI openWithSpec.
	replaceGUI ok
		on: [  ] 
		do: [ 
			findString := replaceGUI returnValues at: 'find'.
			replaceString := replaceGUI returnValues at: 'replace'.
			currentNode find: findString andReplaceWith: replaceString. ]
	

!GrafoscopioNotebook methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 1/4/2019 19:18'!
linksList
	| currentNode |
	currentNode := tree highlightedItem content.
	GrafoscopioLinksList new
		content: currentNode;
		openWithSpec
	

!GrafoscopioNotebook methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 12/6/2017 19:07'!
importImages
	self imagesList: (Pandoc listImagesFrom: self markdownFile).
	self inform: 'All notebook images has been imported.', String cr, 'Now you can list and download them.'

!GrafoscopioNotebook methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 10/4/2018 08:03'!
downloadImages
	"I download all images in a notebook into a local folder that respects relative paths.
	So if a image refers to http://mysite.com/uploads/chap1/myimage.png, it will be stored
	into: 'uploads/chap1/myimage.png' in the same folder where the notebook is stored.
	This is helpful for notebooks conversions that expect to have local images in particular
	locations."

	| parentFolder |
	parentFolder := self workingFile parent.
	self.
	^ self imagesList do: [ :each | | relativePathString link |
		link := each contents asUrl.
		relativePathString := link directory.
		relativePathString ifNotEmpty: [ 
			GrafoscopioUtils ensureCreateDirectory: relativePathString into: parentFolder ]]

!GrafoscopioNotebook methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 1/4/2019 17:34'!
wrapBodyLines
	self currentNodeContent wrapBodyLines.
	self updateBodyFor: self currentNode
</t>
<t tx="ekr.20190225130808.183"></t>
<t tx="ekr.20190225130808.184">htmlToMarkdownSubtree
	self currentNodeContent htmlToMarkdownSubtree.
	self updateBodyFor: self currentNode
</t>
<t tx="ekr.20190225130808.185">updateBodyFor: aNodeContainer
	| aNode |
	self needRebuild: false.
	tree needRebuild: false.
	body needRebuild: true.
	aNode := aNodeContainer content.
	header text: aNode header.
	body := self instantiate: aNode specModelClass new.
	body content: aNode body.
	links text: aNode lastLink.
	self autoSaveBodyOf: aNode.
	self buildWithSpecLayout: self class defaultSpec
</t>
<t tx="ekr.20190225130808.186">visitNodeLink
	
	tree highlightedItem content visitLastLink.
</t>
<t tx="ekr.20190225130808.187">importLinkContent
	"I see if a node header is an url located at 'http://ws.stfx.eu', wich means that is a shared
	workspace, and convert the node body to an interactive playground"
	| currentNode nodeContent |
	currentNode := tree highlightedItem.
	currentNode ifNil: [ ^ self ].
	nodeContent := currentNode content.
	nodeContent importPlaygroundLink.
	nodeContent importHtmlLink.
	self updateBodyFor: currentNode
</t>
<t tx="ekr.20190225130808.188">htmlToMarkdown
	self currentNodeContent htmlToMarkdown.
	self updateBodyFor: self currentNode
</t>
<t tx="ekr.20190225130808.189">debugWithSelector: aSymbol
	"I invoke a message to debug in the current node. In the future the debugging scope can be changed to
	include different elements instead of the current node."
	| currentNode nodeContent |
	currentNode := tree highlightedItem.
	currentNode ifNil: [ ^ self ].
	nodeContent := currentNode content.
	^ (nodeContent perform: aSymbol asSymbol) inspect
</t>
<t tx="ekr.20190225130808.19">isEmpty
	body ifNil: [ ^ true ] ifNotNil: [ ^ false ]
</t>
<t tx="ekr.20190225130808.190">currentNodeContent
	^ self currentNode content
</t>
<t tx="ekr.20190225130808.191">currentNode
	| currentNode |
	currentNode := tree highlightedItem.
	currentNode ifNil: [ ^ self ].
	^ currentNode
</t>
<t tx="ekr.20190225130808.192">autoSaveBodyOf: aNode
	| playground |
	body body class = TextModel
		ifTrue: [ body body whenTextChanged: [ :arg | aNode body: arg ] ].
	body body class = GlamourPresentationModel
		ifFalse: [ ^ self ].
	playground := body body glmPres.
	playground
		onChangeOfPort: #text
			act: [ :x | aNode body: (x pane port: #text) value ]";		
		onChangeOfPort: #activePresentation
			act: [ aNode output: aNode processOutput ]"
</t>
<t tx="ekr.20190225130808.193"></t>
<t tx="ekr.20190225130808.194">links
	^ links
</t>
<t tx="ekr.20190225130808.195">workingFile
	^ workingFile
</t>
<t tx="ekr.20190225130808.196">notebook
	^ notebook
</t>
<t tx="ekr.20190225130808.197">tree
	^ tree
</t>
<t tx="ekr.20190225130808.198">imagesList: anObject
	imagesList := anObject
</t>
<t tx="ekr.20190225130808.199">header
	^ header
</t>
<t tx="ekr.20190225130808.2"></t>
<t tx="ekr.20190225130808.20">content: anObject
	"Sets the receivers body to the given object"
	body := anObject
</t>
<t tx="ekr.20190225130808.200">header: anObject
	header := anObject
</t>
<t tx="ekr.20190225130808.201">body
	^ body
</t>
<t tx="ekr.20190225130808.202">links: anObject
	links := anObject
</t>
<t tx="ekr.20190225130808.203">debugMessage: aGrafoscopioNodeSelector
	"I define a message that can be used for debugging purposes in the current notebook."
	debugMessage := aGrafoscopioNodeSelector
</t>
<t tx="ekr.20190225130808.204">windowMainMenu: anObject
	windowMainMenu := anObject
</t>
<t tx="ekr.20190225130808.205">debugMessage
	^ debugMessage ifNil: [ self defineDebugMessageUI ]
</t>
<t tx="ekr.20190225130808.206">tree: anObject
	tree := anObject
</t>
<t tx="ekr.20190225130808.207">windowMainMenu
	^ windowMainMenu
</t>
<t tx="ekr.20190225130808.208">imagesList
	imagesList ifNil: [ ^ #('No images list for this notebook') ].
	^ imagesList
</t>
<t tx="ekr.20190225130808.209">notebook: anObject
	notebook := anObject
</t>
<t tx="ekr.20190225130808.21">lastNetLink
	^ self links detect: [ :l | l asZnUrl isURL ]
</t>
<t tx="ekr.20190225130808.210">workingFile: aFileReference
	workingFile := aFileReference.
</t>
<t tx="ekr.20190225130808.211">body: anObject
	body := anObject
</t>
<t tx="ekr.20190225130808.212"></t>
<t tx="ekr.20190225130808.213">markdownFile
	"I define the location of the markdown file where the notebook will be exported"
	| markdownFile |
	markdownFile := (((workingFile parent) / workingFile basenameWithoutExtension) fullName, '.markdown') asFileReference.
	^ markdownFile
</t>
<t tx="ekr.20190225130808.214">openDefault
"I open a new default notebook"

	^ self class new openWithSpec.
</t>
<t tx="ekr.20190225130808.215">subtreeAsMarkdown
	| currentNode |
	currentNode := tree highlightedItem content.
	self inform: ('Exported as: ', String cr, (self subtreeAsMarkdownFor: currentNode) fullName )
</t>
<t tx="ekr.20190225130808.216">exportAllSubtreesAsMarkdow
	| toBeExported |
	toBeExported := self notebook selectMarkdownSubtreesToExport.
	toBeExported ifEmpty: [ ^ self ].
	toBeExported do: [ :each | self subtreeAsMarkdownFor: each ].
	self inform: toBeExported size asString , ' exported markdown subtrees.'
</t>
<t tx="ekr.20190225130808.217">openFromFileSelector
	
	| file nb |
	file := UIManager default 
						chooseExistingFileReference:'Choose a file'
						extensions: #('ston')
						path: FileLocator documents.
	file ifNil: [
		self inform: 'No file selected'.
		^ self ].
	self workingFile: file.
	nb := self class new.
	nb openFromFile: self workingFile.
	GfUIHelpers updateRecentNotebooksWith: workingFile
</t>
<t tx="ekr.20190225130808.218">exportNode: aGrafoscopioNode asMarkdownIn: aFile
	"I export the current tree/document to a markdown file"
	aFile ensureDelete.
	aFile 
		ensureCreateFile;
		writeStreamDo: [:stream | 
			stream 
				nextPutAll: 
					('---', String cr,
					'exportedFrom: ', self checksum, String cr) withInternetLineEndings.
			aGrafoscopioNode metadataAsYamlIn: stream.
			stream 
				nextPutAll: 
					('---', String cr, String cr) withInternetLineEndings,
					aGrafoscopioNode asMarkdown ].
		self inform: 'Exported as: ', String cr, aFile fullName
</t>
<t tx="ekr.20190225130808.219">loadFromFile: aFileReference
	"I load the contents of aFileReference into a GrafoscopioNotebook, without opening it."
	(aFileReference basename endsWith: 'ston') ifFalse: [ ^ self ].
	self workingFile: aFileReference.
	self notebook: ((STON fromString: self workingFile contents) at: 1) parent.
	self title: self workingFile basenameWithIndicator, ' | Grafoscopio notebook'.
	self notebookContent: self notebook.
</t>
<t tx="ekr.20190225130808.22">tagAs: aTag
	"Tags the recipient node with aTag (string). For the moment we will have only one tag. 
	In the future we will have several and there will be rules to know how tags interact with 
	each other"

	aTag = 'cÃ³digo' ifTrue: [ ^ self toggleCodeText ].
	(self tags includes: aTag)
		ifFalse: [ self tags add: aTag ].
	^ self
</t>
<t tx="ekr.20190225130808.220">exportAsPDF
	"I export the current tree/document to a PDF file, using pandoc and LaTeX external apps.
	The latex engine used is xelatex, to minimize errors and warnings related with UTF8 support.
	I suppose all them are already installed and defined in the system."
	| pandocCommonCommand  |
	self markdownFile exists ifFalse: [ self exportAsMarkdown ].	
	self pdfFile ensureDelete.
	pandocCommonCommand := 'pandoc ', self pandocOptionsComputed, ' ', self markdownFile fullName, 
		' --output ', self pdfFile fullName.
	Smalltalk platformName = 'unix' 
		ifTrue: [ ExternalOSProcess command: 'cd ', self markdownFile parent fullName,'; ', pandocCommonCommand ].
	Smalltalk platformName = 'Win32' 
		ifTrue: [ WinProcess createProcess: pandocCommonCommand ].
	self inform: ('File exported as: ', String cr, self pdfFile fullName)
</t>
<t tx="ekr.20190225130808.221">openFromUrl: url
"Opens a tree from a file named aFileName"

	| fileName sanitized |
	sanitized := GrafoscopioUtils sanitize: url.
	fileName := sanitized segments last.
	GrafoscopioUtils
		downloadingFrom: sanitized 
		withMessage:  'Downloading document...'
		into: FileLocator temp.
	self class new openFromFile: (FileLocator temp / fileName)
</t>
<t tx="ekr.20190225130808.222">pdfFile
	"I define the location of the markdown file where the notebook will be exported"
	| pdfFile |
	pdfFile := (self markdownFile parent fullName,'/', self markdownFile basenameWithoutExtension, '.pdf') asFileReference.
	^ pdfFile.
</t>
<t tx="ekr.20190225130808.223">exportAsSton: aNotebook on: aFileStream
	aNotebook flatten.
    (STON writer on: aFileStream)
		newLine: String crlf;	
      	prettyPrint: true;
		keepNewLines: true;
      	nextPut: aNotebook children
</t>
<t tx="ekr.20190225130808.224">saveWorkingNotebook
	"Saves the current tree to the user predefined file location used when he/she opened it."
	self workingFile 
		ifNil: [ self saveToFileUI ] 
		ifNotNil: [ self saveToFile: workingFile ].
	GfUIHelpers updateRecentNotebooksWith: workingFile
</t>
<t tx="ekr.20190225130808.225">openFromUrlUI
	"This method generates the UI for the openFromUrl: method, it asks for a URL from the user"

	| fileUrl |
	"GrafoscopioBrowser configureSettings."
	fileUrl := UIManager default 
							textEntry: 'Enter the URL' 
							title: 'Open notebook from URL'.						
	fileUrl isNil ifTrue: [ ^nil ].
	self class new openFromUrl: fileUrl
</t>
<t tx="ekr.20190225130808.226">exportAsMarkdown
	"I export the current working  tree/document to a markdown file."
	workingFile
		ifNil: [ self inform: 'File NOT exported. Please save the notebook on hard drive first' ]
		ifNotNil: [ self exportNode: (self notebook)  asMarkdownIn: (self markdownFile) ]
</t>
<t tx="ekr.20190225130808.227">saveToFile: aFileReference
	"I save the current tree/document to a file."

	aFileReference ifNil: [ self inform: 'No file selected for saving. Save NOT done.'. ^ self ].
	workingFile := aFileReference.
	self workingFile ensureDelete.
	self workingFile writeStreamDo: [:stream | 
		self exportAsSton: self notebook on: stream ].
	self title: self workingFile basenameWithIndicator, ' | Grafoscopio notebook'.
	self inform: ('File saved at: ', String cr, self workingFile fullName).
	GfUIHelpers updateRecentNotebooksWith: aFileReference.
</t>
<t tx="ekr.20190225130808.228">subtreeAsMarkdownFor: aNode
	| exportedFile |
	aNode links ifEmpty: [ ^ self ].
	exportedFile:= self navigateRelativePathFor: aNode links last.
	exportedFile class = GrafoscopioNotebook  ifTrue: [ ^ self ].
	self exportNode: aNode  asMarkdownIn: exportedFile.
	^ exportedFile
</t>
<t tx="ekr.20190225130808.229">saveToFileUI

	| file |
	
	file := UIManager default
		chooseForSaveFileReference: 'Export notebook to file as...'
		extensions: #('ston')
		path: (workingFile ifNotNil: [ workingFile parent ] ifNil: [ FileLocator documents ]  ).
	file 
		ifNil: [ self inform: 'Export cancelled'. ^ self ] 
		ifNotNil:[self saveToFile: file].
</t>
<t tx="ekr.20190225130808.23">headers
	"Returns the headers of the receiver children"
	^ headers := self children collect: [:currentNode | currentNode header ]
</t>
<t tx="ekr.20190225130808.230">exportAsHTML
	"I export the current tree/document to a HTML file, using pandoc external app.
	I suppose pandoc is already installed and available in the system."
	| htmlFile |
	self markdownFile exists ifTrue: [ self markdownFile delete ].
	self exportAsMarkdown.
	htmlFile := self markdownFile parent fullName,'/', self markdownFile basenameWithoutExtension, '.html'.
	htmlFile asFileReference exists ifTrue: [ htmlFile asFileReference delete ].
	Smalltalk platformName = 'unix' 
		ifTrue: [
			OSSUnixSubprocess new 
				command: 'pandoc'; 
				arguments: {'--standalone'. self markdownFile fullName. '--output' . htmlFile};
				redirectStdout;
				runAndWaitOnExitDo: [ :process :outString :errString |
					process isSuccess 
						ifTrue: [ self inform: ('File exported as: ', String cr, htmlFile) ]
						ifFalse: [ self inform: 'Exportation unsuccesful. Please review that you have
							installed Pandoc and have used the exportation options properly.' ]]].
	Smalltalk platformName = 'Win32' 
		ifTrue: [WinProcess createProcess: 'pandoc --standalone ', self markdownFile fullName, ' -o ', htmlFile].
</t>
<t tx="ekr.20190225130808.231">exportAsLaTeX
	"I export the current tree/document to a LaTeX file, using pandoc external app.
	I suppose pandoc is already installed and available in the system."
	| texFile |
	self markdownFile exists ifTrue: [ self markdownFile delete ].
	"self exportAsMarkdown.""&lt;- This violates the separation of concenrs. Markdown exportation should
	be explicit. There is still the issue of how to deal with desynchronization between a notebook 
	which has unsaved changes as markdown.... TO BE REVIWED!!"
	texFile := self markdownFile parent fullName,'/', self markdownFile basenameWithoutExtension, '.tex'.
	texFile asFileReference exists ifTrue: [ texFile asFileReference delete ].
	OSProcess command: 'pandoc --standalone ', self markdownFile fullName, ' -o ', texFile.
	self inform: ('File exported as: ', String cr, texFile).
</t>
<t tx="ekr.20190225130808.232">openFromFile: aFileReference
							
	self loadFromFile: aFileReference.
	^ self openWithSpec.
</t>
<t tx="ekr.20190225130808.233"></t>
<t tx="ekr.20190225130808.234">notebookContent: aTree

	| nodeBlock |
	nodeBlock:= [:gfcNode | |node|
    	node := TreeNodeModel new.
    	node 
		hasChildren: [ gfcNode children isNotEmpty ];
    		children: [ gfcNode children collect: [:subNode | nodeBlock value: subNode ]];
     		content: gfcNode].
	tree roots: (aTree children collect:[ :gfcNode | nodeBlock value: gfcNode])
</t>
<t tx="ekr.20190225130808.235">extent
	^900@500
</t>
<t tx="ekr.20190225130808.236"></t>
<t tx="ekr.20190225130808.237">okToChange
	^ true
</t>
<t tx="ekr.20190225130808.238"></t>
<t tx="ekr.20190225130808.239">notebookSubMenu
	^ MenuModel new
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: 'Save';
						icon: (Smalltalk ui icons iconNamed: #smallSave);
						shortcut: $s command;
						action: [ self saveWorkingNotebook ] ].
			group
				addItem: [ :item | 
					item
						name: 'Save as...';
						icon: (Smalltalk ui icons iconNamed: #smallSaveAs);
						action: [ self saveToFileUI ] ].
			group
				addItem: [ :item | 
					item
						name: 'Import images';
						icon: (Smalltalk ui icons iconNamed: #processBrowser);
						action: [ self importImages ] ].
			group
				addItem: [ :item | 
					item
						name: 'See images list';
						icon: (Smalltalk ui icons iconNamed: #processBrowser);
						action: [ self listImagesUI ] ].
			group
				addItem: [ :item | 
					item
						name: 'Download images';
						icon: (Smalltalk ui icons iconNamed: #processBrowser);
						action: [ self downloadImages ] ].
			group
				addItem: [ :item | 
					item
						name: 'Export as markdown';
						icon: (Smalltalk ui icons iconNamed: #smallSaveAs);
						action: [ self exportAsMarkdown ] ].
			group
				addItem: [ :item | 
					item
						name: 'Export as html';
						icon: (Smalltalk ui icons iconNamed: #smallWindow);
						action: [ self exportAsHTML ] ].
			group
				addItem: [ :item | 
					item
						name: 'Export as LaTeX';
						icon: (Smalltalk ui icons iconNamed: #smallPrint);
						action: [ self exportAsLaTeX ] ].
			group
				addItem: [ :item | 
					item
						name: 'Export as pdf';
						icon: (Smalltalk ui icons iconNamed: #smallPrint);
						action: [ self exportAsPDF ] ].
			group
				addItem: [ :item | 
					item
						name: 'See html';
						icon:
							(self iconNamed: #smallInspectIt);
						action: [ self inform: 'To be implemented...' ] ].
			group
				addItem: [ :item | 
					item
						name: 'See pdf';
						icon: (Smalltalk ui icons iconNamed: #smallInspectIt);
						action: [ self inform: 'To be implemented...' ] ].
			group
				addItem: [ :item | 
					item
						name: 'Define debug message...';
						icon: Smalltalk ui icons glamorousBug;
						action: [ self defineDebugMessageUI ] ] ]
</t>
<t tx="ekr.20190225130808.24">tags: aCollection 
	tags := aCollection
</t>
<t tx="ekr.20190225130808.240">initializeDefaultTest
	super initialize.
	self
		notebook: (GrafoscopioNode new becomeDefaultTestTree);
		title: ' New test | Grafoscopio notebook'.
	self notebookContent: self notebook.
</t>
<t tx="ekr.20190225130808.241">initializePresenter
	tree whenHighlightedItemChanged: [ :item | 
		tree highlightedItem ifNotNil: [self updateBodyFor: item]].
	tree whenTreeUpdated: [ :item | item ifNotNil: [self updateBodyFor: item]].
	header whenTextChanged: [ :arg |
		(tree highlightedItem content header) = arg
			ifFalse: [ 
				tree highlightedItem content header: arg.
				tree roots: tree roots]].
	links whenTextChanged: [ :arg | tree highlightedItem content addLink: arg ]
</t>
<t tx="ekr.20190225130808.242">initialize	
	super initialize.
	self
		notebook: (GrafoscopioNode new becomeDefaultTree);
		title: ' New | Grafoscopio notebook'.
	self notebookContent: self notebook.
</t>
<t tx="ekr.20190225130808.243">projectSubMenu
	
	^ MenuModel new
		addGroup: [ :group |
			group addItem: [ :item |
				item 
					name: 'Activate remote repository...';
					icon: Smalltalk ui icons smallPushpinIcon;
					action: [ self inform: 'To be implemented ...' ] ].
						group addItem: [ :item |
				item 
					name: 'Activate local repository...';
					icon: Smalltalk ui icons homeIcon;
					action: [ self inform: 'To be implemented ...' ] ].	
			group addItem: [ :item |
				item 
					name: 'Add file...';
					icon: Smalltalk ui icons newerPackagesAvailableIcon;
					action: [ self inform: 'To be implemented ...' ] ].
			group addItem: [ :item |
				item 
					name: 'Delete file...';
					icon: Smalltalk ui icons packageDeleteIcon;
					action: [ self inform: 'To be implemented ...' ] ].
			group addItem: [ :item |
				item 
					name: 'Commit to repository';
					icon: Smalltalk ui icons smallScreenshotIcon;
					action: [ self inform: 'To be implemented ...' ] ]. 
			group addItem: [ :item |
				item 
					name: 'Credentials';
					icon: Smalltalk ui icons userIcon;
					action: [ self inform: 'To be implemented ...' ] ]	]
</t>
<t tx="ekr.20190225130808.244">initializeWidgets
	windowMainMenu := self topBar.
	header := self newTextInput.
	header autoAccept: true.
	body := self newText.
	body disable.
	body text: '&lt;- Select a node'.
	links := self newTextInput.
	tree := TreeModel new.
	tree 
		childrenBlock: [:node | node children];
		displayBlock: [:node | node title ].
	self focusOrder 
		add: tree;
		add: header;
		add: body;
		add: links.
	self askOkToClose: true.
</t>
<t tx="ekr.20190225130808.245">topBar
	^ MenuModel new
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: 'Notebook';
						icon: (self iconNamed: #smallObjects);
						subMenu: self notebookSubMenu ].
			group
				addItem: [ :item | 
					item
						name: 'Project';
						icon: (self iconNamed: #catalog);
						subMenu: self projectSubMenu ] ];
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Save notebook';
						icon: (self iconNamed: #glamorousSave);
						action: [ self saveWorkingNotebook ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Export all markdown subtrees';
						icon: (self iconNamed: #glamorousMore);
						action: [ self exportAllSubtreesAsMarkdow ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Cut';
						icon: (self iconNamed: #smallCut);
						action: [ self cutNodeToClipboard ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Copy';
						icon: (self iconNamed: #smallCopy);
						action: [ self copyNodeToClipboard ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Paste';
						icon: (self iconNamed: #smallPaste);
						action: [ self pasteNodeFromClipboard ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Find &amp; Replace';
						icon: (self iconNamed: #smallFind);
						action: [ self findAndReplace ] ] ];
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Add node';
						icon: MendaIcons new plusIcon;
						action: [ self addNode ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Delete node';
						icon: MendaIcons new minusIcon;
						action: [ self removeNode ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Move node up';
						icon: MendaIcons new arrowUpIcon;
						action: [ self moveNodeBefore ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Move node down';
						icon: MendaIcons new arrowDownIcon;
						action: [ self moveNodeAfter ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Move node left';
						icon: MendaIcons new arrowLeftIcon;
						action: [ self promoteNode ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Move node right';
						icon: MendaIcons new arrowRightIcon;
						action: [ self demoteNode ] ] ];
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Toggle: code &lt;--&gt; text';
						icon: MendaIcons new smalltalkCodeIcon;
						action: [ self toggleCodeNode ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'List node links';
						icon: (self iconNamed: #tinyMenu);
						action: [ self linksList ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Visit link';
						icon: (self iconNamed: #glamorousRight);
						action: [ self visitNodeLink ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Import link content';
						icon: (self iconNamed: #glamorousRefresh);
						action: [ self importLinkContent ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'HTML to Markdown';
						icon: (self iconNamed: #smallProfile);
						action: [ self htmlToMarkdown ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'HTML to Markdown subtree';
						icon: (self iconNamed: #hierarchy);
						action: [ self htmlToMarkdownSubtree ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Tag as...';
						icon: MendaIcons new tagAddIcon;
						action: [ self inform: 'To be implemented...' ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Untag ....';
						icon: MendaIcons new tagMinusIcon;
						action: [ self inform: 'To be implemented...' ] ].
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Edit tags...';
						icon: FontAwesomeIcons new tagsIcon;
						action: [ self inform: 'To be implemented...' ] ] ];
		addGroup: [ :debug | 
			debug
				addItem: [ :item | 
					item
						name: nil;
						description: 'Debug';
						icon:
							(self iconNamed: #glamorousBug);
						action: [ self debugWithSelector: self debugMessage ] ] ]
</t>
<t tx="ekr.20190225130808.246"></t>
<t tx="ekr.20190225130808.247">metadata
	^ self notebook metadata
</t>
<t tx="ekr.20190225130808.248">pandocOptions
	^ self notebook pandocOptions
</t>
<t tx="ekr.20190225130808.249">defineDebugMessageUI
	| answer |
	answer := UIManager default 
		request: 'Define debug message to be send to a selected node in this notebook.' 
		initialAnswer: 'messageNoDebugSelector'.
	self debugMessage: answer
</t>
<t tx="ekr.20190225130808.25">saveContent: anObject
	"Sets the receivers body to the given object"
	
	body := anObject
</t>
<t tx="ekr.20190225130808.250">addCommandFrom: dictionary into: stream
	dictionary keysAndValuesDo: [ :k :v |
		k = 'thisNotebook' 
			ifTrue: [ 
				stream nextPutAll: (GrafoscopioUtils perform: v on: self) ]]
</t>
<t tx="ekr.20190225130808.251">navigateRelativePathFor: aFileString
	"Given a relative path according to location of the notebook's workingFile, 
	I navigate to that file if exist and create it, including subdirectories if it does not exist.
	If the relative path is located in a subdirectory that shares the route with the notebooks working
	file, it must start with the folders name,
	without using './' to point the same shared root "

	| finalLocation pathSegments  |
	aFileString ifEmpty: [ ^ self ].
	aFileString asUrl host ifNotNil: [ ^self ].
	finalLocation := workingFile parent.
	pathSegments := aFileString splitOn: '/'.
	pathSegments allButLastDo: [ :segment | 
		(segment = '..') 
			ifTrue: [ finalLocation := finalLocation parent ]
			ifFalse: [
				finalLocation := finalLocation / segment.
				finalLocation exists ifFalse: [ finalLocation ensureCreateDirectory ]]].
	finalLocation := finalLocation / (pathSegments last).
	finalLocation exists ifFalse: [ finalLocation ensureCreateFile ].
	^ finalLocation
</t>
<t tx="ekr.20190225130808.252">markdownFileChecksum
	self workingFile ifNil: [ ^ self ].
	self workingFile contents = '' ifTrue: [ ^ self ]. 
	^ GrafoscopioUtils checksumFor: self markdownFile
</t>
<t tx="ekr.20190225130808.253">pandocOptionsComputed
	"I convert the pandoc options array into a single line that can be used with the pandoc command."

	| result |
	result := '' writeStream.
	self pandocOptions ifNil: [ ^ '' ].
	self pandocOptions
		do: [ :option |
			option isDictionary 
				ifTrue: [ 
					self addCommandFrom: option into: result  ]
				ifFalse: [
					result
						nextPutAll: option] ].
	^ result contents
</t>
<t tx="ekr.20190225130808.254">listImagesUI
	ListModel new
		title: 'Images files list';
		items: self imagesList ;
		openWithSpec
</t>
<t tx="ekr.20190225130808.255">checksum
	"I return the checksum (crypto hash) of the workingFile where this notebook is being stored.
	I'm useful for data provenance and traceability of derivated files coming from this source
	notebook."
	self workingFile ifNil: [ ^ self ].
	self workingFile contents = '' ifTrue: [ ^ self ]. 
	^ GrafoscopioUtils checksumFor: self workingFile
</t>
<t tx="ekr.20190225130808.256">markdownFileChecksumUpto: anInteger
	"I cut the markdownFileCheckup upto a given integer. 
	Type coersion is needed, because this message argument can be read from a string in %metadata nodes.
	Maybe the way used by playgrounds to import text as commands can be useful here."
	^ self markdownFileChecksum copyFrom: 1 to: anInteger asInteger.


!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 12/17/2016 18:57'!
cutNodeToClipboard
	self copyNodeToClipboard; removeNode.

!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 9/9/2016 11:13'!
demoteNode
	| editedNode |
	editedNode := tree highlightedItem content.
	editedNode demote.
	self notebookContent: notebook.

!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 12/17/2016 18:49'!
copyNodeToClipboard
	tree highlightedItem content copyToClipboard.
	self notebookContent: notebook.

!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 8/28/2017 14:01'!
addNode
	self currentNodeContent addNodeAfterMe.
	self notebookContent: notebook.

!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 9/9/2016 11:14'!
promoteNode
	| editedNote |
	editedNote := tree selectedItem content.
	editedNote promote.
	self notebookContent: notebook

!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 12/17/2016 18:49'!
pasteNodeFromClipboard
	tree highlightedItem content pasteFromClipboard.
	self notebookContent: notebook.

!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 9/9/2016 11:20'!
moveNodeBefore
	| editedNode |
	editedNode := tree highlightedItem content.
	editedNode moveBefore.
	self notebookContent: notebook

!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 8/4/2017 11:45'!
toggleCodeNode
	| currentNode |
	currentNode := tree highlightedItem.
	currentNode content toggleCodeText.
	self updateBodyFor: currentNode.

!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 9/9/2016 11:20'!
removeNode
	| contentToDelete parentContent newSelectedContent children |
	contentToDelete := tree selectedItem content.
	parentContent := contentToDelete parent.
	children := parentContent children.
	children size &gt; 1 
		ifTrue: [ 
			children last = contentToDelete 
				ifTrue: [ newSelectedContent := children at: (children size - 1) ]
		]
		ifFalse: [ newSelectedContent := parentContent ].
	contentToDelete parent removeNode: contentToDelete.
	self notebookContent: notebook

!GrafoscopioNotebook methodsFor: 'editing nodes' stamp: 'OffrayLuna 9/9/2016 11:19'!
moveNodeAfter
	| editedNode |
	editedNode := tree selectedItem content.
	editedNode moveAfter.
	self notebookContent: notebook

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GrafoscopioNotebook class
	instanceVariableNames: ''!

!GrafoscopioNotebook class methodsFor: 'instance creation' stamp: 'OffrayLuna 7/6/2017 18:10'!
open: aFileReference
	self newDefault openFromFile: aFileReference 

!GrafoscopioNotebook class methodsFor: 'instance creation' stamp: 'OffrayLuna 7/6/2017 18:09'!
newDefault
	^ self new.
</t>
<t tx="ekr.20190225130808.257"></t>
<t tx="ekr.20190225130808.258">SHA1For: aFile is: aSHA1String 
	"I verify that a file has the same signature that the one in a given string,
	returning true in that case or false otherwise"
 	^ (SHA1 new hashMessage: aFile asFileReference binaryReadStream contents) hex = aSHA1String
</t>
<t tx="ekr.20190225130808.259"></t>
<t tx="ekr.20190225130808.26">asText
	^ self body
</t>
<t tx="ekr.20190225130808.260">defaultSpec

	^ SpecLayout composed
		newColumn: [:tcol|
			tcol newRow: [ :wrow | wrow add: #windowMainMenu ] height: (self toolbarHeight);
					newRow: [:row |
						row newColumn: [ :tc |
							tc add: #tree
								] width: 300.
						row newColumn: [ :bc |
							bc newRow: [ :bcr | bcr add: #header ] height: self toolbarHeight.
							bc add: #body; add: #links height: self toolbarHeight ]]]


</t>
<t tx="ekr.20190225130808.261">TestCase subclass: #GrafoscopioNotebookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!GrafoscopioNotebookTest commentStamp: 'OffrayLuna 5/8/2017 10:05' prior: 0!
I test the main functionality of the GrafoscopioNode class.!


</t>
<t tx="ekr.20190225130808.262">ComposableModel subclass: #GrafoscopioReplace
	instanceVariableNames: 'find replace ok cancel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!GrafoscopioReplace commentStamp: 'OffrayLuna 9/9/2017 19:40' prior: 0!
I'm a tool for finding and replacing text ocurrences in notebook
nodes. !
</t>
<t tx="ekr.20190225130808.263"></t>
<t tx="ekr.20190225130808.264">initializePresenter
	"Here we need to deal with changes in the OK button to send messages about the
	state of the 'find' and 'replace' variables or do nothing if 'Cancel' is pressed."
	ok whenStateChangedDo: [ 
			Transcript show: 'OK Clicked!!' ]
</t>
<t tx="ekr.20190225130808.265">initializeWidgets
	find := self newTextInput
		ghostText: 'Text to find...';
		autoAccept: true.
	replace := self newTextInput
		ghostText: 'Text to replace...';
		autoAccept: true.
	ok := self newButton
		label: 'OK';
		state: false;
		action: [
			ok state: true.
			self window close. ] .
	cancel := self newButton
		label: 'Cancel';
		action: [
			cancel state: true. 
			self window close ].
	self focusOrder
		add: find;
		add: replace;
		add: ok;
		add: cancel.
	self askOkToClose: true
</t>
<t tx="ekr.20190225130808.266">returnValues
	self ok state
		ifFalse: [ ^ self ] 
		ifTrue: [^ Dictionary new
			at: 'find' put: find getText;
			at: 'replace' put: replace getText;
			yourself]
</t>
<t tx="ekr.20190225130808.267"></t>
<t tx="ekr.20190225130808.268">okToChange
	^ true
</t>
<t tx="ekr.20190225130808.269"></t>
<t tx="ekr.20190225130808.27">ancestorsAll
	"I return a collection of all the nodes wich are ancestors of the receiver node"
	| currentNode ancestors |
	
	currentNode := self.
	ancestors := OrderedCollection new.
	[ currentNode parent notNil and: [ currentNode level &gt; 0 ] ]
		whileTrue: [ 
			ancestors add: currentNode parent.
			currentNode := currentNode parent].
	ancestors := ancestors reversed.
   ^ ancestors
</t>
<t tx="ekr.20190225130808.270">find
	^ find
</t>
<t tx="ekr.20190225130808.271">cancel
	^ cancel
</t>
<t tx="ekr.20190225130808.272">ok
	^ ok
</t>
<t tx="ekr.20190225130808.273">replace
	^ replace
</t>
<t tx="ekr.20190225130808.274">cancel: anObject
	cancel := anObject
</t>
<t tx="ekr.20190225130808.275">find: anObject
	find := anObject
</t>
<t tx="ekr.20190225130808.276">replace: anObject
	replace := anObject
</t>
<t tx="ekr.20190225130808.277">ok: anObject
	ok := anObject
</t>
<t tx="ekr.20190225130808.278"></t>
<t tx="ekr.20190225130808.279">title
	^ 'Find &amp; Replace'

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GrafoscopioReplace class
	instanceVariableNames: ''!
</t>
<t tx="ekr.20190225130808.28">key 	
	"Returns a unique key identifying the receiver in the help system"	
	^key
</t>
<t tx="ekr.20190225130808.280"></t>
<t tx="ekr.20190225130808.281">defaultSpec
	^ SpecLayout composed
		newColumn: [ :column | 
			column 
				add: #find; 
				add: #replace;
				newRow: [ :row | row add: #ok; add: #cancel ] height: self toolbarHeight ];
		yourself


</t>
<t tx="ekr.20190225130808.282">ComposableModel subclass: #GrafoscopioTextModel
	instanceVariableNames: 'body'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!GrafoscopioTextModel commentStamp: 'OffrayLuna 5/26/2017 10:23' prior: 0!
I represent a text node inside a Grafoscopio notebook.
Usually my content is markdown text.!
</t>
<t tx="ekr.20190225130808.283"></t>
<t tx="ekr.20190225130808.284">content: aGrafoscopioNodeContent
	body text: aGrafoscopioNodeContent
</t>
<t tx="ekr.20190225130808.285"></t>
<t tx="ekr.20190225130808.286">body
	^ body
</t>
<t tx="ekr.20190225130808.287">body: anObject
	body := anObject
</t>
<t tx="ekr.20190225130808.288"></t>
<t tx="ekr.20190225130808.289">initializeWidgets

	body := self newText.
	body beForText.
	body autoAccept: true.

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GrafoscopioTextModel class
	instanceVariableNames: ''!
</t>
<t tx="ekr.20190225130808.29">key: aUniqueKey
	"Sets a unique key identifying the receiver in the help system"	
	key := aUniqueKey
</t>
<t tx="ekr.20190225130808.290"></t>
<t tx="ekr.20190225130808.291">defaultSpec

	^ SpecLayout composed add: #body


</t>
<t tx="ekr.20190225130808.292">Object subclass: #MendaIcons
	instanceVariableNames: 'icons'
	classVariableNames: 'Current'
	poolDictionaries: ''
	category: 'Grafoscopio-UI'!
!MendaIcons commentStamp: 'OffrayLuna 9/7/2015 12:31' prior: 0!
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

I'm MendaIcons the provider of this icons on this environment.

My main responsibility is to support some menda icons insideCallback pharo environment, for that I convert and package png images to the pharo image.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- what is the way to create instances is a plus.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points!
</t>
<t tx="ekr.20190225130808.293"></t>
<t tx="ekr.20190225130808.294">gtInspectorIconsIn: composite
	&lt;gtInspectorPresentationOrder: 40&gt;
	composite list 
		title: 'Icons';
		display: [ 
			self iconSelectors asSortedCollection 
				collect: [ :each | each -&gt; (self perform: each) ] ];
		icon: [ :each | each value ];
		format: [ :each | each key ]


!MendaIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:33'!
arrowRightIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self arrowRightIconContents base64Decoded readStream)

!MendaIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:30'!
arrowDownIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self arrowDownIconContents base64Decoded readStream)

!MendaIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:34'!
tagMinusIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self tagMinusIconContents base64Decoded readStream)

!MendaIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:29'!
minusIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self minusIconContents base64Decoded readStream)

!MendaIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:33'!
smalltalkCodeIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self smalltalkCodeIconContents base64Decoded readStream)

!MendaIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:28'!
plusIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self plusIconContents base64Decoded readStream)

!MendaIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:31'!
arrowUpIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self arrowUpIconContents base64Decoded readStream)

!MendaIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:33'!
tagAddIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self tagAddIconContents base64Decoded readStream)

!MendaIcons methodsFor: 'accessing - icons' stamp: 'OffrayLuna 2/13/2019 13:32'!
arrowLeftIcon
	"Private - Generated method"
	^Form fromBinaryStream: (self arrowLeftIconContents base64Decoded readStream)


!MendaIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
tagAddIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/Menda/Png/tagAdd.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAATFJREFUKJF90DFPAjEcBfD3GuByGg1qiH4FRyOrDhjipl9B
HR25+whu0NldJ0dmHJ2c1U0HY6KigKLJwYE8F8GjAf5Jk+bf/tq+slwunwDIwymSNgiCmtsf
lgGQJ7nrDklVa21xFgQASGpKOpXU/bvRn4VNYn4RhuExgKvEc6fiJDyqVCqXAApO1onYJDZ4
JHdI0j19EjYkraRoUo71zXcsZOOJmJJgrS1KqpL0k3B77xG31zk0Xv7bkiKS+5QEAGM4X3hG
OvODldUOvj4yiLsG9zfLqD/NAcBA0sEIJvFSrusbI2xsveLhLovPhofvdhpxJzUgeVgqlc6S
v4ogCGok91tvXtSs++j1DNotD826P4ZGGd0a3jy/2PPjKIV+34yhqdDJ7LloJkzgtTAMz921
X92gun92K18+AAAAAElFTkSuQmCC'

!MendaIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
arrowLeftIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/Menda/Png/arrowLeft.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAOCAYAAAASVl2WAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAAK1JREFUGJV9kcFpAmEQhb835rpo2giYHsSLBQhiH3NLCf/+
20XIRexAy7CLkAKEfZ42xNXswJy+j4H3Bts821rr0jayzXhqrTvbn8DHgzBASd+2VzEFM/MS
UxAgpiDArGmafyFA2L5KMjCz/TJOFJl5tL0H5hFxLqW83wkAmXkYJEmnv9JvikGStJB06rpu
CTw22bbtVtKX7Z+IWN8VNbr02vf95umjbFNKebPNDbaypHslWRyiAAAAAElFTkSuQmCC'

!MendaIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
arrowRightIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/Menda/Png/arrowRight.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAOCAYAAAASVl2WAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAAMVJREFUGJV9kTFqw0AQRf/M2pWsQK4RMDit2lTpDSbXkFCV
I6xW13AZcK20ukAgOYb7IPTSxMFWLH8YGHgPZpgRoJTSGtC1Cnmev0ra933/VRTFpyZxMzsA
RzPbN02z/SeUZfnh7k9zkkvSLclPzZxkwMXMtm3X4zi+m9k98OKaZBiGpZktAMzs+0JIKT2G
EDpgBeyqqjosziHQSVoBu7qu3/6WjDFufmF+DiUpZFm2cfdO0t0Uni75DFyFkiRAMcaHuWf9
APv6mfGc3+HbAAAAAElFTkSuQmCC'

!MendaIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
arrowDownIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/Menda/Png/arrowDown.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAA4AAAAICAYAAADJEc7MAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAALJJREFUGJV9zjEKwkAUBND5i3ZaeJBAcgavIIjX2GwK8QbZ
/bmGjSDYaq5gE/Aa9hIyNkZkXf0w1fCGD5IIIexUNSOJf6nrOvfeb0lCXuBK8m6MWVprOyTO
e5+LSAtgDiA31tqO5EZEFsMwtE3TZDFS1WJEJNfOuZsBAOfc4RdW1YLkZURVVR0BQEi+l0MI
KxHZj2/3fT81xpxj9AVjLCITkrMYJWGEmUI/4Qd+lGV5SvVPkLiZ0qKAa5MAAAAASUVORK5C
YII='

!MendaIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
arrowUpIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/Menda/Png/arrowUp.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAA4AAAAICAYAAADJEc7MAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAAJRJREFUGJWNy8EJQjEQBNCdVGAdwtca/LYg2EdIsIjNliHi
xQ6sQfRgF4L/LOx4EnJIPg7MaeaBpLRiZnuSn5TSpbWHGXQEcC6l7P6CFXqJyATg1MKhh0hu
AGx7OPRQSukZY7y7+9jCoYd+h5zzw91Hku8aw8wGd7+1UB1VXQG4AliQXAtJUdWDqi5JylzN
bFDVTFK+Zz+PhDBK0j8AAAAASUVORK5CYII='

!MendaIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
plusIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/Menda/Png/plus.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAAKVJREFUKJHVkjEOgkAQRd9suIFcxUhvZeJpCA2FhoJ2uYyN
nEE9CZ5hP4WQkHVJjIWJv5r5839m83dMEjG6ritCCO3U1lVV3WJN9uYCJOVmtgcws01K41Lk
J/i90bz3haQ84rfAeaob4LEcShqyEEI7B7GCJsH1Xz81A+o4ckm7eZOZnYD7cu6ce1rqALz3
R+AyGQ9lWV5jzR/949qtDkAPryBSmhE5/jJyCd+z1gAAAABJRU5ErkJggg=='

!MendaIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
smalltalkCodeIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/Menda/Png/smalltalkCode.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAAQhJREFUKJHtkrFOw0AQRGfOJ1FdkSB6pLgN+QAaJCQkfsS1
ZbcUDm18EvK/UOQPEA1ROiy+gDQBdxz20BwSsiho0jHV7urN7BbLuq4fJc0kbUn2xpiboige
6rq+JdmXZblcrVbnJJeSLMk5ydZKmpGckrwAAEl3AEDyTNInABhjTgBckkRkUkNyG5vTJEkm
zrk1RnLO3SdJMhmGIY2hGyupJwlr7Vue5/uxCQCyLAsA9t57G5f05jfwL/o3HsJo4xshhHDs
vbdd171XVfXxE2qa5iiE4ABMv32G5BwAjDEvAHbOuatxegjhGsAOwHMcLSzJVlJKciOpjwAA
PAHoY/0qaR2vW0hqvwBnzXKb8TsomwAAAABJRU5ErkJggg=='

!MendaIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
tagMinusIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/Menda/Png/tagMinus.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAAPhJREFUKJGF0bFKQzEUBuD/D9Zy3RQKPsh9gkpx7Cuoo+NN
HqHbvZm76+TYuY4+gqubIDg4iFBbaP8u9ZIcrrcHAiHJl5NzwrquZwBKmCAZvfdLu/4XDkBJ
8toOSYsY46QPAgAkfUmaS1ofMhZ92CXzpxDCPYCX5Ln/4hTeNU3zDGBsau3ELjkwJHlFkvb2
LuxIRkmrrjr6MCUhxjiRtCBZHLtA0orklJIAIMPl+AOD020G3l4v8Pl+BgA7STctTPH5aF04
pwz+fA+w+T3ZkbytquohgzazeWWLgPw7AADe+yXJqWlYhtrmdEWSeWhRL0zwZQjh0e7tAVcM
m6R0vbZ+AAAAAElFTkSuQmCC'

!MendaIcons methodsFor: 'private - contents' stamp: 'OffrayLuna 9/10/2015 11:13'!
minusIconContents
	"Private - Method generated with the content of the file File @ /home/offray/Programas/Grafoscopio/Dev/Common/Icons/Menda/Png/minus.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAA4AAAADCAYAAACj1j4PAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAOxAAADsQBlSsOGwAAADhJREFUCJlj7O7uDmNgYEhjIAEwMTFNZ2FkZJRjYGBwJkXj
379/t7D8////AQMDw05SNDIwMDwEANK6DIovD6CyAAAAAElFTkSuQmCC'
</t>
<t tx="ekr.20190225130808.295"></t>
<t tx="ekr.20190225130808.296">initializeIcons
	icons := LRUCache new 
		maximumWeight: 64;
		factory: [ :key | self perform: key ];
		yourself
</t>
<t tx="ekr.20190225130808.297">initialize
	super initialize.
	self initializeIcons
</t>
<t tx="ekr.20190225130808.298">iconSelectors
	^ self class selectors select: [ :each | '*Icon' match: each asString ]

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

MendaIcons class
	instanceVariableNames: ''!

!MendaIcons class methodsFor: 'instance creation' stamp: 'OffrayLuna 9/9/2015 20:18'!
current
	^ Current ifNil: [ Current := self new ]
</t>
<t tx="ekr.20190225130808.299">GrafoscopioDocumentation subclass: #GrafoscopioDocs
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio'!
!GrafoscopioDocs commentStamp: 'OffrayLuna 7/4/2017 14:58' prior: 0!
I define the documentation for the Grafoscopio package.!
</t>
<t tx="ekr.20190225130808.3">addNode: aNode
	"Adds the given node to the receivers collection of children, and sets this object as the parent
	 of the node"
	"aNode parent = self ifTrue: [ ^ self ]."
	self children add: aNode.
	aNode level: (self level) + 1.
	aNode parent: self.
	^aNode
</t>
<t tx="ekr.20190225130808.30">content
	"Returns the receivers body"
	^ body
</t>
<t tx="ekr.20190225130808.300"></t>
<t tx="ekr.20190225130808.301">initialize
	"I model the important documents that belong to the Grafoscopio documentation.
	When more documents become more mature and usable, I will include them."

	super initialize.
	name := 'grafoscopio'. 
	repository := (FossilRepo new remote: 'http://mutabit.com/repos.fossil/grafoscopio').
	localPlace := FileLocator workingDirectory asFileReference /'Grafoscopio'.
	self 
		addDocument: 'Docs/Es/Tutoriales/tutorial.ston';
		addDocument: 'Docs/En/Books/Manual/manual.ston';
		addDocument: 'Docs/En/Books/Manual/manual.pdf';
		addDocument: 'Docs/En/Books/DataActivism/techniques-for-datactivism.ston';
		addDocument: 'Docs/En/dev-notes.ston';
		addDocument: 'Docs/En/Books/SpecIUFramework/spec-ui-framework.ston'.

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GrafoscopioDocs class
	instanceVariableNames: ''!
</t>
<t tx="ekr.20190225130808.302">initialize
	self update
</t>
<t tx="ekr.20190225130808.303"></t>
<t tx="ekr.20190225130808.304">manual
	"I'm just an alias to ease the operation. I need to know wich is the index of the notebook
	I want to open, as defined on  method."
	| docs |
	docs := self newDefault. 
	^ (docs localPlace fullName, '/', (docs documents at: 2)) asFileReference.
</t>
<t tx="ekr.20190225130808.305">openPDFManual
	"I open the documentation in PDF format."
	| pdfManual |
	pdfManual := FileLocator imageDirectory asFileReference / 'Grafoscopio/Docs/En/Books/Manual/manual.pdf'. 
	WebBrowser openOn: pdfManual fullName.
</t>
<t tx="ekr.20190225130808.306">devNotes
	"I'm just an alias to ease the operation. I need to know wich is the index of the notebook
	I want to return, as defined on instance initialize method"
	| docs |
	docs := self newDefault. 
	^ (docs localPlace fullName, '/', (docs documents at: 3)) asFileReference.
</t>
<t tx="ekr.20190225130808.307">tutorial
	"I'm just an alias to ease the operation. I need to know wich is the index of the notebook
	I want to return, as defined on instance initialize method"
	| docs |
	docs := self newDefault. 
	^ (docs localPlace fullName, '/', (docs documents at: 1)) asFileReference.


</t>
<t tx="ekr.20190225130808.308">PackageManifest subclass: #ManifestGrafoscopio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio'!
!ManifestGrafoscopio commentStamp: '&lt;historical&gt;' prior: 0!
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

ManifestGrafoscopio class
	instanceVariableNames: ''!
</t>
<t tx="ekr.20190225130808.309"></t>
<t tx="ekr.20190225130808.31">children 
	"Returns the receivers list of children"
	^ children ifNil: [ children := OrderedCollection new ]
</t>
<t tx="ekr.20190225130808.310">ruleRBClassNameInSelectorRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#'Documentation class' #current #true)) #'2016-10-07T19:39:23.013722-05:00') )
</t>
<t tx="ekr.20190225130808.311">ruleRBBooleanPrecedenceRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#'GrafoscopioNode class' #cleanTreeRootReferences #true)) #'2017-03-27T22:18:17.447627-05:00') )
</t>
<t tx="ekr.20190225130808.312">ruleRBStringConcatenationRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#'FileUtils class' #createFilesNamed:endingWith:intoFolder: #true)) #'2017-01-01T21:48:26.712639-05:00') )
</t>
<t tx="ekr.20190225130808.313">ruleRBEqualsTrueRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#'GrafoscopioDocumentation class' #listOutdated #true)) #'2016-10-09T10:16:31.841951-05:00') #(#(#RGMethodDefinition #(#'GrafoscopioDocumentation class' #listOutdatedDocsIn: #true)) #'2017-04-05T17:50:59.032741-05:00') )
</t>
<t tx="ekr.20190225130808.314">ruleRBSentNotImplementedRuleV1FalsePositive
	^ #(#(#(#RGMetaclassDefinition #(#'GrafoscopioGUI class' #GfUIHelpers)) #'2015-12-23T10:38:16.706667-05:00') #(#(#RGClassDefinition #(#GfUIHelpers)) #'2016-01-06T18:53:45.844051-05:00') #(#(#RGMethodDefinition #(#GrafoscopioNotebook #topBar #false)) #'2016-12-17T18:51:40.617924-05:00') )
</t>
<t tx="ekr.20190225130808.315">ruleRBCascadedNextPutAllsRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#GrafoscopioNode #metadataAsYamlIn: #false)) #'2017-04-20T19:01:59.286212-05:00') )
</t>
<t tx="ekr.20190225130808.316">ruleRBShouldntRaiseErrorRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#GrafoscopioNodeTest #testInitializeIsOk #false)) #'2017-01-31T12:49:28.199769-05:00') )
</t>
<t tx="ekr.20190225130808.317">ruleSmTMethodTestedRuleV1FalsePositive
	^ #(#(#(#RGClassDefinition #(#GrafoscopioNode)) #'2017-10-31T19:59:03.294735-05:00') )
</t>
<t tx="ekr.20190225130808.318">ruleRBLongMethodsRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#GrafoscopioNotebook #topBar #false)) #'2016-12-17T18:51:33.99062-05:00') #(#(#RGMethodDefinition #(#GrafoscopioNotebook #notebookSubMenu #false)) #'2017-02-02T11:43:53.106456-05:00') )
</t>
<t tx="ekr.20190225130808.319">ruleRBBadMessageRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#'GrafoscopioDocumentation class' #openNotebookFrom:At: #true)) #'2017-04-05T18:01:21.892153-05:00') )
</t>
<t tx="ekr.20190225130808.32">body
	"Returns the receivers body"
	^ body

ancestorsHeaders
	"Returns the headers of all the ancestors of the node. 
	Maybe this and 'headers' should be integrated, so both act on a collection of children instead of 
	having two separate methods"
	| currentNode ancestors |
	
	currentNode := self.
	ancestors := OrderedCollection new.
	(self level - 1) 
		timesRepeat: [ 
			ancestors add: currentNode parent.
			currentNode := currentNode parent.].
	ancestors := ancestors reversed.
   ^ ancestors collect: [:ancestor | ancestor header ] 	

links
	"I model local or remote links that are associated to a particular node."
	^ links ifNil: [ ^ links := OrderedCollection new ]

tags 
	"I returns the receiver tags."
	| migration |
	tags isString 
		ifTrue: [ 
			migration := tags.
			tags := OrderedCollection new.
			self tagAs: migration ].
	tags ifNil: [ 
		tags := OrderedCollection new.
		self tagAs: 'text' ].
	^ tags

icon 
 	"Returns the receivers icon"
	^icon

header: anObject
	"Sets the receivers header"
	header := anObject 

icon: aSymbol
	"Sets the receivers icon"
	
	icon := aSymbol
</t>
<t tx="ekr.20190225130808.320">ruleRBAssignmentInIfTrueRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#GrafoscopioNode #embedNodes #false)) #'2017-02-16T20:07:02.600781-05:00') #(#(#RGMethodDefinition #(#GrafoscopioNotebook #navigateRelativePathFor: #false)) #'2017-03-28T22:30:53.541042-05:00') )

GrafoscopioDocs initialize!</t>
<t tx="ekr.20190225130808.33">lastLink
	self links ifNil: [ ^ '' ].
	self links ifEmpty: [ ^ '' ].
	^ self links last
</t>
<t tx="ekr.20190225130808.34">parent
	"Returns the parent of the current node"
	^ parent
</t>
<t tx="ekr.20190225130808.35">ancestors
	"I return a collection of all the nodes wich are ancestors of the receiver node"
	| currentNode ancestors |
	
	currentNode := self.
	ancestors := OrderedCollection new.
	[ currentNode parent notNil and: [ currentNode level &gt; 0 ] ]
		whileTrue: [ 
			ancestors add: currentNode parent.
			currentNode := currentNode parent].
	ancestors := ancestors reversed.
   ^ ancestors
</t>
<t tx="ekr.20190225130808.36">title
	"Returns the receiver header"
	
	^ header
</t>
<t tx="ekr.20190225130808.37">links: anObject
	self links add: anObject
</t>
<t tx="ekr.20190225130808.38">level: anInteger
	"Sets the node level in a hierarchy. The only node with level 0 is the root node and from there levels increase
	 in 1 for its direct children, 2 for its grand children and so on. Silibings nodes has the same level"	
		
	level := anInteger
</t>
<t tx="ekr.20190225130808.39">header
	"Returns the receiver header"
	
	^ header
</t>
<t tx="ekr.20190225130808.4"></t>
<t tx="ekr.20190225130808.40">specModelClass

	(self isTaggedAs: 'cÃ³digo') ifTrue: [^GrafoscopioCodeModel].
	(self isTaggedAs: 'johan') ifTrue:[^GrafoscopioButtonModel].
	"por defecto"
	^ GrafoscopioTextModel
</t>
<t tx="ekr.20190225130808.41">hasChildren
	(self children size &gt; 0)
		ifTrue: [ ^true ]
		ifFalse: [ ^false ]
</t>
<t tx="ekr.20190225130808.42">root
	"I return the root node of the Grafoscopio tree, i.e the common ancestor of all other nodes"
	self level = 0 
		ifFalse: [ ^ self ancestors first ].
	^ self
</t>
<t tx="ekr.20190225130808.43">level 	
	"Returns the level of the node. See the setter message for details"	
		
	^level
</t>
<t tx="ekr.20190225130808.44">children: aCollection
	"Sets the receivers children"
	
	aCollection do: [:currentNode | currentNode parent: self  ].
	children := aCollection.
</t>
<t tx="ekr.20190225130808.45">body: anObject
	"Sets the receivers body to the given object"
	
	body := anObject
</t>
<t tx="ekr.20190225130808.46"></t>
<t tx="ekr.20190225130808.47">localFilesLinks
	"I collect all the links that point to the local file system. Because is supposed that
	links contains only references to remote URL or local files, anything that is not a URL is
	treated as a loca file link."
	^ self links collect: [ :l | l asZnUrl host isNil ]
</t>
<t tx="ekr.20190225130808.48">addLink: anUrl
	"anUrl is a string"

	(self links includes: anUrl) 
		ifFalse: [ self links add: anUrl ]
</t>
<t tx="ekr.20190225130808.49">htmlToMarkdownSubtree
	"I convert self and childern nodes body from HTML format to Pandoc's Markdown."
	 self preorderTraversal do: [ :each | each htmlToMarkdown ]
</t>
<t tx="ekr.20190225130808.5">pandocOptionsPrettyYaml
	"I convert pandoc options, if present into an indented Yaml block."
	| yamlOutput pretyOutput |
	pretyOutput := STON toStringPretty: self pandocOptions.
	yamlOutput := '' writeStream.
	yamlOutput 
		nextPutAll:
			'|';
			lf.
	pretyOutput linesDo: [ :line | 
		yamlOutput 
			nextPutAll:
				'    ', line;
				lf   ].
	^ yamlOutput contents
</t>
<t tx="ekr.20190225130808.50">metadata
	| mnode |
	mnode := self root preorderTraversal 
		detect: [ :n | n headerStartsWith: '%metadata' ]
		ifNone: [ ^ nil ].
	^ mnode output.
</t>
<t tx="ekr.20190225130808.51">preorderTraversal
	nodesInPreorder := OrderedCollection new.
	self visitedGoTo: nodesInPreorder.
	^ nodesInPreorder.
</t>
<t tx="ekr.20190225130808.52">linksToMarkdownFile
	"I detect if the links contains any reference to a file ending in '.md' or '.markdown'"
	self links 
		ifNotNil: [ 
			self links 
				detect: [:l | (l endsWith: '.md') or: [ l endsWith: '.markdown']]
					ifFound: [ ^ true ]
					ifNone: [^ false]].
	^ false
</t>
<t tx="ekr.20190225130808.53">toggleCodeText
	"Some tags are exclusionary. 
	For example a node can not be tagged as text and as 'code' (cÃ³digo) simultaneosly.
	In that case, I replace the ocurrence of one tag by the other to warranty that both are not 
	in the same node."
	(self isTaggedAs: 'text')
		ifTrue: [ ^ self tags replaceAll: 'text' with: 'cÃ³digo'].
	(self isTaggedAs: 'cÃ³digo')
		ifTrue: [ ^ self tags replaceAll: 'cÃ³digo' with: 'text' ].
</t>
<t tx="ekr.20190225130808.54">surfaceCopy
	"I copy the most relevant values of the receiver. I'm useful to avoid copying references
	to the rest of the container tree, which could end in copying the whole tree."
	| newNode |
	newNode := self class new.
	^ newNode
		header: self header;
		body: self body;
		tags: self tags.
</t>
<t tx="ekr.20190225130808.55">selectMarkdownSubtreesToExport
	^ (self root preorderTraversal) select: [ :each | each linksToMarkdownFile ].
</t>
<t tx="ekr.20190225130808.56">htmlToMarkdown
	"I convert the node body from HTML format to Pandoc's Markdown."
	| htmlFile |	
	(self isTaggedAs: 'cÃ³digo' ) ifTrue: [ ^self ].
	((self headerStartsWith: '%invisible') "or:[self hasAncestorHeaderWith: '%invisible']") 
		ifTrue: [ ^self ].
	htmlFile := FileLocator temp asFileReference / 'body.html'.
	htmlFile ensureCreateFile.
	htmlFile writeStreamDo: [:out | out nextPutAll: self body ].
	Smalltalk platformName = 'unix'
		ifTrue: [ self body: (Pandoc htmlToMarkdown: htmlFile) ].
	Smalltalk platformName = 'Win32'
		ifTrue: [ self shouldBeImplemented ].
	htmlFile ensureDelete.
</t>
<t tx="ekr.20190225130808.57">visitLastLink
	self lastLink = '' 
		ifTrue: [ self inform: 'This node has no associated links to visit'. ^ self ].
	[WebBrowser openOn: self lastLink] fork
</t>
<t tx="ekr.20190225130808.58">subtreeCopy
	"I return the same node if its subtree only contains the receiver, or a copy of the receivers
	subtree, in other cases."
	| linearSubtree linearSubtreeCopy |
	linearSubtree := self preorderTraversal. 
	linearSubtreeCopy := OrderedCollection new.
	linearSubtree do: [ :cn | linearSubtreeCopy add: cn surfaceCopy ].
	linearSubtreeCopy allButFirst doWithIndex: [ :n :i | | parentPos |
		parentPos := linearSubtree indexOf: (linearSubtree at: i+1) parent.
		n parent: (linearSubtreeCopy at: parentPos) ].
	^ linearSubtreeCopy at: 1.
</t>
<t tx="ekr.20190225130808.59">isTaggedAs: aString
	self tags ifEmpty: [ self tagAs: 'text' ].
	^ self tags includes: aString
</t>
<t tx="ekr.20190225130808.6">pandocOptions
	self metadata ifNil: [ ^ nil ].
	self metadata at: 'pandocOptions' ifAbsent: [ ^ '' ].
	^ self metadata at: 'pandocOptions'
</t>
<t tx="ekr.20190225130808.60">checksum
	"I return the SHA1SUM of the current tree. I'm used to test changes on the contents
	and for traceability of how the document tree is converted to other formats, as markdown."
	^ (SHA1 new hashMessage: self root flatten asSton) hex


!GrafoscopioNode methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 1/4/2019 17:34'!
wrapBodyLines
		"I convert the node body from HTML format to Pandoc's Markdown."
	| bodyFile |	
	(self isTaggedAs: 'cÃ³digo' ) ifTrue: [ ^self ].
	bodyFile := FileLocator temp asFileReference / 'body.txt'.
	bodyFile ensureCreateFile.
	bodyFile writeStreamDo: [:out | out nextPutAll: self body ].
	Smalltalk platformName = 'unix'
		ifTrue: [ self body: (self wrapBodyLinesFor: bodyFile) ].
	Smalltalk platformName = 'Win32'
		ifTrue: [ self shouldBeImplemented ].
	bodyFile ensureDelete.

!GrafoscopioNode methodsFor: 'as yet unclassified' stamp: 'OffrayLuna 1/4/2019 17:34'!
wrapBodyLinesFor: inputFile 
	| outputFile |
	outputFile := FileLocator temp / 'body.tmp.txt'.
	outputFile ensureDelete.
	outputFile ensureCreateFile.
	OSSUnixSubprocess new
		command: 'fold';
		arguments: {'-sw'.  '80'. inputFile fullName. outputFile fullName};
	redirectStdout;
	redirectStderr;
	runAndWaitOnExitDo: [ :process :outString :errString |
		process isSuccess
			ifTrue: [ ^ outString  ]
			ifFalse: [ 
				self inform: errString.
				^inputFile contents ]
	]


!GrafoscopioNode methodsFor: 'add/remove nodes' stamp: 'OffrayLuna 8/9/2016 15:35'!
addNodeAfterMe
	"Adds a generic node after the given node so they become slibings of the same parent"
	| genericNode |
	genericNode := self class new header: 'newNode'; body: ''.
	self parent children add: genericNode after: self.
	genericNode parent: self parent.
	genericNode level: self level.
	^ genericNode
	

!GrafoscopioNode methodsFor: 'add/remove nodes' stamp: 'OffrayLuna 10/31/2014 21:48'!
visitedGoTo: aCollection
	"Stores the current node in a collection and recursively stores its children"

	aCollection add: self.
	(self children isNotEmpty) &amp; ((self header findString: '#invisible')=1) not
		ifTrue: [ (self children) do: [ :eachNode | eachNode visitedGoTo: aCollection]].

		

!GrafoscopioNode methodsFor: 'add/remove nodes' stamp: 'OffrayLuna 1/31/2017 19:30'!
removeNode: aNode
	(self children includes: aNode)
		ifTrue: [ self children remove: aNode ]
		ifFalse: [ self inform: 'The node doesn''t belong to this node children' ]
	
	

!GrafoscopioNode methodsFor: 'add/remove nodes' stamp: 'OffrayLuna 11/30/2017 13:03'!
copyToClipboard	
	self class clipboard: self subtreeCopy.
	
	

!GrafoscopioNode methodsFor: 'add/remove nodes' stamp: 'OffrayLuna 3/27/2017 16:50'!
pasteFromClipboard
	| clipchild |	
	self class clipboard 
		ifNotNil: [ 
			clipchild := self class clipboard.
			self addNode: clipchild.
			clipchild  ]
		ifNil: [ self inform: 'Cache is emtpy. Pleas cut/copy a node before pasting' ]
	

!GrafoscopioNode methodsFor: 'add/remove nodes' stamp: 'OffrayLuna 8/16/2014 18:08'!
removeLastNode
	"Adds the given node to the receivers collection of children, and sets this object as the parent
	 of the node"
	
	self children removeLast.
</t>
<t tx="ekr.20190225130808.61"></t>
<t tx="ekr.20190225130808.62">moveAfter
	"Moves the current node a place before in the children collection where is located"
	| collection index successor |
	collection := self parent children.
	index := collection indexOf: self.
	(index between: 1 and: collection size - 1)
		ifTrue: [
			successor := collection after: self.
			collection at: index + 1 put: self.
			collection at: index  put: successor]
</t>
<t tx="ekr.20190225130808.63">moveBefore
	"Moves the current node a place before in the children collection where is located"
	| collection index predecessor |
	collection := self parent children.
	index := collection indexOf: self.
	(index between: 2 and: collection size)
		ifTrue: [
			predecessor := collection before: self.
			collection at: index -1 put: self.
			collection at: index  put: predecessor]
</t>
<t tx="ekr.20190225130808.64">demote
	"I move the current node down in the hierachy, making it a children of its current previous 
	slibing"
	
	| collection index predecessor |
	collection := self parent children.
	index := collection indexOf: self.
	(index between: 2 and: collection size)
		ifTrue: [ predecessor := collection before: self.
			collection remove: self.
			predecessor addNode: self]
</t>
<t tx="ekr.20190225130808.65">promote
	"Moves the current node up in the hierachy, making it a slibing of its current parent"
	| collection grandparent |
	collection := self parent children.
	grandparent := self parent parent.
	collection isNotNil &amp; grandparent isNotNil 
		ifTrue: [ 
			(grandparent children) add: self after: (self parent).
			self level: (self parent) level.
			self parent: grandparent.
			collection remove: self.]
</t>
<t tx="ekr.20190225130808.66"></t>
<t tx="ekr.20190225130808.67">importHtmlLink
	"I take the last link and import its contents in node body. "
	| selectedLink downloadedContent |
	self links last asUrl host = 'ws.stfx.eu' ifTrue: [ ^ self ].
	selectedLink := self links last.
	downloadedContent := (GrafoscopioUtils 
		downloadingFrom: selectedLink 
		withMessage: 'Downloading node contents...' 
		into: FileLocator temp). 
	self uploadBodyFrom: downloadedContent filteredFor: selectedLink.
</t>
<t tx="ekr.20190225130808.68">importPlaygroundLink
	"I take the last link and import its contents in node body. 
	Last links should be hosted in http://zn.stfx.eu/"
	self links last asUrl host = 'ws.stfx.eu' ifFalse: [ ^ self ].
	self
		body: (ZnClient new get: self links last);
		tagAs: 'cÃ³digo'.
</t>
<t tx="ekr.20190225130808.69">uploadBodyFrom: fileLocator filteredFor: selectedLink
	(self linksFilters contains: selectedLink)
		ifFalse: [ self body: fileLocator contents ]
</t>
<t tx="ekr.20190225130808.7">replaceAccentedHTMLChars
	self body: (self body copyReplaceAll: '&amp;iacute;' with: 'Ã­' )
</t>
<t tx="ekr.20190225130808.70"></t>
<t tx="ekr.20190225130808.71">headerAsMarkdownInto: aStream
	"I export the header as markdown using the level inside the tree to determine hierarchy
	and replacing all line endings to make them Internet friendly"
	self level timesRepeat: [ aStream nextPutAll: '#' ].
		aStream nextPutAll: ' '. 
		aStream nextPutAll: (self header copyReplaceTokens: #cr with: #lf); crlf; crlf.
</t>
<t tx="ekr.20190225130808.72">bodyAsMarkdownInto: aStream
	"I export the header as markdown using the level inside the tree to determine hierarchy
	and replacing all line endings to make them Internet friendly".
	self embeddedNodes ifNotNil: [ aStream nextPutAll: (self embedNodes contents asString withInternetLineEndings); crlf; crlf].
</t>
<t tx="ekr.20190225130808.73">hasAncestorHeaderWith: aSpecialWord
	"Looks if the receptor node has an ancestor with a header with 'aSpecialWord' as the only or the first word"
	
	^ (self ancestorsHeaders includes: aSpecialWord) | ((self ancestorsHeaders collect: [:eachHeader | (eachHeader findTokens: $  ) at: 1 ]) includes: aSpecialWord)
</t>
<t tx="ekr.20190225130808.74">footnoteAsMarkdownInto: aStream
	"I export a node with %footnode in its header for valid Pandoc's markdown
	and replace all line endings to make them Internet friendly.
	Maybe I should include the condition about my own header, instead of leaving it to markdownCotent..."
	aStream nextPutAll: ('[^',(self header copyReplaceAll: '%footnote ' with: ''),']: ' ); lf.
	self body contents withInternetLineEndings 
		linesDo: [ :line | aStream nextPutAll: '    ', line; lf ].
	aStream nextPutAll: String lf.
</t>
<t tx="ekr.20190225130808.75">hasAncestorTaggedAs: aSpecialWord
	"Looks if the receptor node has an ancestor with a header with 'aSpecialWord' in its tags"
	
	self ancestors detect: [:eachAncestor | eachAncestor tags includes: aSpecialWord ] 
		ifFound: [^true ] 
		ifNone: [^false ].
</t>
<t tx="ekr.20190225130808.76">markdownContent
	"I extract the markdown of a node using body as content, header as title and level as
	 hierarchical level of the title.
	 If special nodes types are present, that use %keywords in its header or body I convert them
	 into proper markup"
	| markdownStream |
	markdownStream := '' writeStream.
	(self class specialWords includes: self header) not 
	&amp; (self class specialWords includes: ((self header findTokens: $ ) at: 1)) not 
	&amp; (self isTaggedAs: 'cÃ³digo') not 
	&amp; (self hasAncestorHeaderWith: '%invisible') not
		ifTrue: [    
				self headerAsMarkdownInto: markdownStream.
				self bodyAsMarkdownInto: markdownStream ].
	(self headerStartsWith: '%idea')
		ifTrue: [ self bodyAsMarkdownInto: markdownStream ].	
	(self headerStartsWith: '%item')
		ifTrue: [ self itemAsMarkdownInto: markdownStream ].
	(self headerStartsWith: '%footnote')
		ifTrue: [ self footnoteAsMarkdownInto: markdownStream ].	
	((self isTaggedAs: 'cÃ³digo') 
	and: [(self hasAncestorHeaderWith: '%invisible') not 
	 		&amp; (self headerStartsWith: '%embed') not ]) 
				ifTrue: [ self exportCodeNodeTo: markdownStream ].
	^ markdownStream contents
</t>
<t tx="ekr.20190225130808.77">exportPreambleTo: aStream
	"comment stating purpose of message"
	| configDict |
	(self header = '%config')
		ifTrue: [ 
			configDict := STON fromString: (self body).
			aStream nextPutAll: 'title: ', (configDict at: 'title'); lf.
			aStream nextPutAll: 'author: ', ((configDict at: 'author') at: 'given'), ' ', ((configDict at: 'author') at: 'family'); lf.
			aStream nextPutAll: 'bibliography: ', (configDict at: 'bibliography'); lf.
			aStream nextPutAll: 'abstract: ', '|'; lf; nextPutAll: (configDict at: 'abstract'); lf]
</t>
<t tx="ekr.20190225130808.78">margin
	"I define the same margin of the page used for PDF exportations"

	^'2 cm'
</t>
<t tx="ekr.20190225130808.79">exportCodeBlockTo: aStream
	"I convert the content of a node taged as 'cÃ³digo' (code) as pandoc markdown and put it 
	into aStream."
	aStream nextPutAll:  ('~~~{.numberLines}'); lf.
	aStream nextPutAll: (self body contents asString withInternetLineEndings); lf.
	aStream nextPutAll:  ('~~~'); lf;lf.
	^aStream contents
</t>
<t tx="ekr.20190225130808.8">removeLeadingLineNumbersSized: anInteger
	| cleanBody |
	cleanBody := ''.
	self body lines do: [ :line | | cleanLine |
		line size &gt;= anInteger 
			ifTrue: [ cleanLine := line copyFrom: anInteger to: line size. ]
			ifFalse: [ cleanLine := '' ].
		cleanBody := cleanBody, cleanLine, String cr  ].
	self body: cleanBody asString.
</t>
<t tx="ekr.20190225130808.80">publish
	| publishedUrl |
	(self confirm: 'Publish playground content to the cloud?')
        ifFalse: [ ^ self ].
    self content ifEmpty: [ 
        self inform: 'Nothing was published because the playground is empty'.
        ^ self ].
    Clipboard clipboardText: (publishedUrl := (GTUrlProvider new post: self content) asString).
    self inform: publishedUrl , ' was published and the url was copied to clipboard'
</t>
<t tx="ekr.20190225130808.81">itemAsMarkdownInto: aStream
	"I export a node with %item in its header as valid Pandoc's markdown
	and replace all line endings to make them Internet friendly.
	Maybe I should include the condition about my own header, instead of leaving it to markdownContent..."

	| lines |
	lines := self body contents asString withInternetLineEndings lines.
	lines ifEmpty: [ ^ self ].
	aStream
		nextPutAll: '  - ';
		nextPutAll: lines first;
		lf.
	lines
		allButFirstDo: [ :line | 
			aStream
				nextPutAll: '    ';
				nextPutAll: line;
				lf ].
	aStream nextPutAll: String lf
</t>
<t tx="ekr.20190225130808.82">asSton
	"Exports current tree as STON format"
	| stonOutput |
	
	stonOutput := '' writeStream.
	self flatten.
	stonOutput nextPutAll:  (STON toStringPretty: self children).	
	^stonOutput contents
</t>
<t tx="ekr.20190225130808.83">exportCodeOutputTo: aStream
	"I convert the output of a node taged as 'cÃ³digo' (code) as pandoc markdown and 
	put it into aStream."
	(self headerStartsWith: '%metadata') ifTrue: [ ^ self ].
	aStream nextPutAll:  ('~~~{.numberLines}'); lf.
	aStream nextPutAll: (self output asString withInternetLineEndings); lf.
	aStream nextPutAll:  ('~~~'); lf;lf.
	^aStream contents
</t>
<t tx="ekr.20190225130808.84">margins
	"I define each individual margin of the page used for PDF exportations"

	| margins |
	margins := Dictionary new
		add: 'top' -&gt; '3 cm';
		add: 'bottom' -&gt; '3 cm';
		add: 'left' -&gt; '2 cm';
		add: 'right' -&gt; '2 cm';
		yourself.
	^ margins
</t>
<t tx="ekr.20190225130808.85">exportCodeNodeTo: aStream
	"I convert the content of a node taged as 'cÃ³digo' (code) as pandoc markdown 
	and put it into aStream."
	((self headerStartsWith: '%output') or: [ self headerStartsWith: '%metadata' ])
		ifTrue: [ self exportCodeOutputTo: aStream ]
		ifFalse: [ self exportCodeBlockTo: aStream ]
</t>
<t tx="ekr.20190225130808.86">exportLaTeXCodeBlockTo: aStream
	"I convert the content of a node taged as 'cÃ³digo' (code) as pandoc markdown and put it 
	into aStream.
	The code block is decorated with LaTeX commands for proper syntax highlighting using pygments.
	Pdf exportation requires the installation of pygments and minted package for latex"
	aStream nextPutAll:  ('\begin{minted}{smalltalk}'); lf.
	aStream nextPutAll: (self body contents asString withInternetLineEndings); lf.
	aStream nextPutAll: '\end{minted}';lf;lf.
	^aStream contents
</t>
<t tx="ekr.20190225130808.87">flatten
	"I traverse the tree looking for node bodies containing 'Text' objects and transform them to
	their string content, so space is saved and storage format is DVCS friendly while serializing 
	them to STON"
	
	(self preorderTraversal) do: [ :eachNode | 
			(eachNode body class = Text)
				ifTrue: [eachNode body: (eachNode body asString)]]
</t>
<t tx="ekr.20190225130808.88">metadataAsYamlIn: markdownStream
	"I convert the first '%metadata' node into a YAML preamble contents to be used by Pandoc 
	exportation."
	self metadata
		ifNil: [ markdownStream nextPutAll: String crlf. ] 
		ifNotNil: [
			self metadata
				keysAndValuesDo: [ :k :v | 
					k = 'pandocOptions'
						ifTrue: [ 
							markdownStream 
								nextPutAll: 
									(k, ': ', self pandocOptionsPrettyYaml) ]
						ifFalse: [
							markdownStream
								nextPutAll: 
									(k , ': ' , v asString) withInternetLineEndings;
									lf] ]].
		markdownStream 
			nextPutAll: String cr, String cr.
</t>
<t tx="ekr.20190225130808.89">bodyAsCode
	"I return the node body with proper decorators added to show them as raw code"
	| codeBody |
	codeBody := '' writeStream.
	codeBody 
		nextPutAll:  '~~~{.numberLines}'; lf;
		nextPutAll: (self body contents asString withInternetLineEndings); lf;
	   nextPutAll:  '~~~'; lf; lf.
	^ codeBody contents
</t>
<t tx="ekr.20190225130808.9">deleteReferencesToRoot: aRootNode

	| sparseTree |
	sparseTree := self preorderTraversal.
</t>
<t tx="ekr.20190225130808.90">asMarkdown
	"I export children of the current node as pandoc markdown, using special nodes
	 accoding to tags.
	 Early version... tags processing should be vastly improved"
	| markdownOutput |
	
	markdownOutput := '' writeStream.
	"self metadataAsYamlIn: markdownOutput."
	(self preorderTraversal) do: [ :eachNode | 
		(eachNode level &gt; 0) 
			ifTrue: [(eachNode hasAncestorTaggedAs: 'invisible') 
						| (eachNode tags includes: 'invisible')
							ifFalse: [  
									markdownOutput nextPutAll: (eachNode markdownContent) ]]].
	^ markdownOutput contents


!GrafoscopioNode methodsFor: 'instance creation' stamp: 'OffrayLuna 7/21/2014 11:23'!
newNode
	node := Dictionary newFrom: { 
		#header -&gt; 'newHeadline'.
		#body -&gt; ''.
		#children -&gt; #()}.
	 ^ node.
	


!GrafoscopioNode methodsFor: 'custom markup' stamp: 'OffrayLuna 2/13/2017 22:49'!
headerStartsWith: aString
	^ (self header findString: aString) = 1

!GrafoscopioNode methodsFor: 'custom markup' stamp: 'OffrayLuna 2/14/2017 18:16'!
embeddedNodes
	^ self children select: [:each | each headerStartsWith: '%embed']

!GrafoscopioNode methodsFor: 'custom markup' stamp: 'OffrayLuna 2/16/2017 21:58'!
embedAll
	"This is just a previous part of the messy markDownContent. The %embed-all keyword should be revaluated.
	By default a node embeds all its children. Any non-embedable content should be under a %invisible node"
	"(temporalBody includesSubstring: '%embed-all')
						ifFalse: [ ]
						ifTrue: [
							self embeddedNodes do: [ :each | 
								temporalBody := temporalBody copyReplaceAll: '%embed-all' with: (each body, (String with: Character cr), 
																																		'%embed-all')].
							temporalBody := temporalBody copyReplaceAll: '%embed-all' with: '']"
	

!GrafoscopioNode methodsFor: 'custom markup' stamp: 'OffrayLuna 8/4/2017 12:02'!
embedNodes
	"I find any ocurrence of '%embed a node header' in the body of a node and replace it
	by the children which have such header.
	Using embedded nodes is useful to change the order in which children appear into parents body,
	while exporting"
	| temporalBody |
	temporalBody := self body.
	self embeddedNodes ifNotNil: [ self embeddedNodes do: [ :each | 
			(each isTaggedAs: 'cÃ³digo')
				ifFalse: [temporalBody := temporalBody copyReplaceAll: (each header) with: each body]
				ifTrue: [temporalBody := temporalBody copyReplaceAll: (each header) with: each bodyAsCode]]].
	^ temporalBody

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

GrafoscopioNode class
	instanceVariableNames: 'clipboard'!
</t>
<t tx="ekr.20190225130808.91"></t>
<t tx="ekr.20190225130808.92">contentProviders
	"I list the domains of certain providers that are treated specially, because they
	store and offer content like Smalltalk playgrounds or source code, that can be used
	in particular ways while importing or exporting content in a node."

	^ Dictionary new 
	  at: 'playgrounds' put: #('ws.stfx.eu');
	  at: 'fossil' put: #('mutabit.com/repos.fossil');
	  at: 'etherpads' put: #('pad.tupale.co' );
	  yourself.
</t>
<t tx="ekr.20190225130808.93">specialWords
	"I return a list of word that were used in the first versions of Grafoscopio to mark node
	headers to indicate special ways to handle them and their node contents.
	Previous versions of first notebooks stored in Grafoscopio using this convention should be 
	migrated to newer versions where tags are used for the same function with simpler code"

	^ #('%config' '%abstract' '%invisible' '%idea' '%footnote' '%metadata' '%output' '%embed' '%item').
</t>
<t tx="ekr.20190225130808.94">cleanTreeRootReferences

	| ref |
	clipboard ifNil: [ ^ self ].
	clipboard children ifNil: [ ^ self ].
	clipboard preorderTraversal allButFirstDo: [ :n |
			ref := n.
			n level - 1 timesRepeat: [ ref := ref parent ].
			ref parent = clipboard parent ifTrue: [ ref parent: nil ]].
	clipboard parent: nil.
</t>
<t tx="ekr.20190225130808.95"></t>
<t tx="ekr.20190225130808.96">clipboard
	^ clipboard
</t>
<t tx="ekr.20190225130808.97">clipboard: anObject
	clipboard := anObject


</t>
<t tx="ekr.20190225130808.98">TestCase subclass: #GrafoscopioNodeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Grafoscopio-Model'!
!GrafoscopioNodeTest commentStamp: 'OffrayLuna 1/31/2017 12:38' prior: 0!
I test the main functionality of the GrafoscopioNode class.!
</t>
<t tx="ekr.20190225130808.99"></t>
</tnodes>
</leo_file>
