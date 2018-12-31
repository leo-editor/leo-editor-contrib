<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20181231110653.1"><vh>Startup</vh>
<v t="ekr.20181231110658.1"><vh>@settings</vh>
<v t="ekr.20181231110705.1"><vh>@command make-vim-node</vh></v>
</v>
</v>
<v t="ekr.20181231110705.1"></v>
<v t="ekr.20181231110555.1"><vh>Recursive import script</vh></v>
<v t="ekr.20181231110604.2"><vh>@path nerdtree/autoload</vh>
<v t="ekr.20181231110604.3"><vh>@path nerdtree.vim</vh>
<v t="ekr.20181231110852.1"><vh>function! nerdtree#version()</vh></v>
<v t="ekr.20181231110912.1"><vh>" SECTION: General Functions {{{1</vh></v>
<v t="ekr.20181231110917.1"><vh>"FUNCTION: nerdtree#checkForBrowse(dir) {{{2</vh></v>
<v t="ekr.20181231110922.1"><vh>"FUNCTION: s:reuseWin(dir) {{{2</vh></v>
<v t="ekr.20181231110923.1"><vh>" FUNCTION: nerdtree#completeBookmarks(A,L,P) {{{2</vh></v>
<v t="ekr.20181231110925.1"><vh>"FUNCTION: nerdtree#compareNodes(dir) {{{2</vh></v>
<v t="ekr.20181231110927.1"><vh>"FUNCTION: nerdtree#compareNodesBySortKey(n1, n2) {{{2</vh></v>
<v t="ekr.20181231110929.1"><vh>" FUNCTION: nerdtree#deprecated(func, [msg]) {{{2</vh></v>
<v t="ekr.20181231110931.1"><vh>" FUNCTION: nerdtree#exec(cmd) {{{2</vh></v>
<v t="ekr.20181231110934.1"><vh>" FUNCTION: nerdtree#has_opt(options, name) {{{2</vh></v>
<v t="ekr.20181231110936.1"><vh>" FUNCTION: nerdtree#loadClassFiles() {{{2</vh></v>
<v t="ekr.20181231110937.1"><vh>" FUNCTION: nerdtree#postSourceActions() {{{2</vh></v>
<v t="ekr.20181231110939.1"><vh>"FUNCTION: nerdtree#runningWindows(dir) {{{2</vh></v>
<v t="ekr.20181231110941.1"><vh>"FUNCTION: nerdtree#runningCygwin(dir) {{{2</vh></v>
<v t="ekr.20181231110947.1"><vh>" SECTION: View Functions {{{1</vh></v>
<v t="ekr.20181231110958.1"><vh>"FUNCTION: nerdtree#echo  {{{2</vh></v>
<v t="ekr.20181231111000.1"><vh>"FUNCTION: nerdtree#echoError {{{2</vh></v>
<v t="ekr.20181231111001.1"><vh>"FUNCTION: nerdtree#echoWarning {{{2</vh></v>
<v t="ekr.20181231111003.1"><vh>"FUNCTION: nerdtree#renderView {{{2</vh></v>
</v>
<v t="ekr.20181231110604.4"><vh>@path nerdtree\ui_glue.vim</vh>
<v t="ekr.20181231111022.1"><vh>" FUNCTION: nerdtree#ui_glue#createDefaultBindings() {{{1</vh></v>
<v t="ekr.20181231111029.1"><vh>"SECTION: Interface bindings {{{1</vh></v>
<v t="ekr.20181231111032.1"><vh>"FUNCTION: s:activateAll() {{{1</vh></v>
<v t="ekr.20181231111034.1"><vh>" FUNCTION: s:activateDirNode(directoryNode) {{{1</vh></v>
<v t="ekr.20181231111035.1"><vh>"FUNCTION: s:activateFileNode() {{{1</vh></v>
<v t="ekr.20181231111037.1"><vh>"FUNCTION: s:activateBookmark() {{{1</vh></v>
<v t="ekr.20181231111039.1"><vh>" FUNCTION: nerdtree#ui_glue#bookmarkNode(name) {{{1</vh></v>
<v t="ekr.20181231111041.1"><vh>" FUNCTION: s:chCwd(node) {{{1</vh></v>
<v t="ekr.20181231111042.1"><vh>" FUNCTION: s:chRoot(node) {{{1</vh></v>
<v t="ekr.20181231111044.1"><vh>" FUNCTION: s:nerdtree#ui_glue#chRootCwd() {{{1</vh></v>
<v t="ekr.20181231111045.1"><vh>" FUNCTION: nnerdtree#ui_glue#clearBookmarks(bookmarks) {{{1</vh></v>
<v t="ekr.20181231111047.1"><vh>" FUNCTION: s:closeChildren(node) {{{1</vh></v>
<v t="ekr.20181231111049.1"><vh>" FUNCTION: s:closeCurrentDir(node) {{{1</vh></v>
<v t="ekr.20181231111050.1"><vh>" FUNCTION: s:closeTreeWindow() {{{1</vh></v>
<v t="ekr.20181231111052.1"><vh>" FUNCTION: s:deleteBookmark(bookmark) {{{1</vh></v>
<v t="ekr.20181231111053.1"><vh>" FUNCTION: s:displayHelp() {{{1</vh></v>
<v t="ekr.20181231111055.1"><vh>" FUNCTION: s:findAndRevealPath(pathStr) {{{1</vh></v>
<v t="ekr.20181231111057.1"><vh>"FUNCTION: s:handleLeftClick() {{{1</vh></v>
<v t="ekr.20181231111059.1"><vh>" FUNCTION: s:handleMiddleMouse() {{{1</vh></v>
<v t="ekr.20181231111101.1"><vh>" FUNCTION: nerdtree#ui_glue#invokeKeyMap(key) {{{1</vh></v>
<v t="ekr.20181231111103.1"><vh>" FUNCTION: s:jumpToFirstChild(node) {{{1</vh></v>
<v t="ekr.20181231111105.1"><vh>" FUNCTION: s:jumpToLastChild(node) {{{1</vh></v>
<v t="ekr.20181231111106.1"><vh>" FUNCTION: s:jumpToChild(node, last) {{{2</vh></v>
<v t="ekr.20181231111108.1"><vh>" FUNCTION: s:jumpToParent(node) {{{1</vh></v>
<v t="ekr.20181231111109.1"><vh>" FUNCTION: s:jumpToRoot() {{{1</vh></v>
<v t="ekr.20181231111111.1"><vh>" FUNCTION: s:jumpToNextSibling(node) {{{1</vh></v>
<v t="ekr.20181231111112.1"><vh>" FUNCTION: s:jumpToPrevSibling(node) {{{1</vh></v>
<v t="ekr.20181231111114.1"><vh>" FUNCTION: s:jumpToSibling(node, forward) {{{2</vh></v>
<v t="ekr.20181231111116.1"><vh>" FUNCTION: nerdtree#ui_glue#openBookmark(name) {{{1</vh></v>
<v t="ekr.20181231111117.1"><vh>" FUNCTION: s:openHSplit(target) {{{1</vh></v>
<v t="ekr.20181231111119.1"><vh>" FUNCTION: s:openVSplit(target) {{{1</vh></v>
<v t="ekr.20181231111121.1"><vh>" FUNCTION: s:openExplorer(node) {{{1</vh></v>
<v t="ekr.20181231111122.1"><vh>" FUNCTION: s:openInNewTab(target) {{{1</vh></v>
<v t="ekr.20181231111124.1"><vh>" FUNCTION: s:openInNewTabSilent(target) {{{1</vh></v>
<v t="ekr.20181231111126.1"><vh>" FUNCTION: s:openNodeRecursively(node) {{{1</vh></v>
<v t="ekr.20181231111127.1"><vh>"FUNCTION: s:previewNodeCurrent(node) {{{1</vh></v>
<v t="ekr.20181231111129.1"><vh>"FUNCTION: s:previewNodeHSplit(node) {{{1</vh></v>
<v t="ekr.20181231111131.1"><vh>"FUNCTION: s:previewNodeVSplit(node) {{{1</vh></v>
<v t="ekr.20181231111134.1"><vh>" FUNCTION: nerdtree#ui_glue#revealBookmark(name) {{{1</vh></v>
<v t="ekr.20181231111136.1"><vh>" FUNCTION: s:refreshRoot() {{{1</vh></v>
<v t="ekr.20181231111140.1"><vh>" FUNCTION: s:refreshCurrent(node) {{{1</vh></v>
<v t="ekr.20181231111142.1"><vh>" FUNCTION: nerdtree#ui_glue#setupCommands() {{{1</vh></v>
<v t="ekr.20181231111143.1"><vh>" Function: s:SID()   {{{1</vh></v>
<v t="ekr.20181231111146.1"><vh>" FUNCTION: s:toggleIgnoreFilter() {{{1</vh></v>
<v t="ekr.20181231111148.1"><vh>" FUNCTION: s:toggleShowBookmarks() {{{1</vh></v>
<v t="ekr.20181231111149.1"><vh>" FUNCTION: s:toggleShowFiles() {{{1</vh></v>
<v t="ekr.20181231111151.1"><vh>" FUNCTION: s:toggleShowHidden() {{{1</vh></v>
<v t="ekr.20181231111152.1"><vh>" FUNCTION: s:toggleZoom() {{{1</vh></v>
<v t="ekr.20181231111154.1"><vh>" FUNCTION: nerdtree#ui_glue#upDir(preserveState) {{{1</vh></v>
<v t="ekr.20181231111156.1"><vh>" FUNCTION: s:upDirCurrentRootOpen() {{{1</vh></v>
<v t="ekr.20181231111158.1"><vh>" FUNCTION: s:upDirCurrentRootClosed() {{{1</vh></v>
</v>
</v>
<v t="ekr.20181231110604.5"><vh>@path nerdtree/lib/nerdtree</vh>
<v t="ekr.20181231110604.6"><vh>@path bookmark.vim</vh>
<v t="ekr.20181231110604.7"><vh>&lt;&lt; docstring &gt;&gt;</vh></v>
<v t="ekr.20181231110604.8"><vh>Bookmark.activate</vh></v>
<v t="ekr.20181231110604.9"><vh>Bookmark.AddBookmark</vh></v>
<v t="ekr.20181231110604.10"><vh>Bookmark.Bookmarks</vh></v>
<v t="ekr.20181231110604.11"><vh>Bookmark.BookmarkExistsFor</vh></v>
<v t="ekr.20181231110604.12"><vh>Bookmark.BookmarkFor</vh></v>
<v t="ekr.20181231110604.13"><vh>Bookmark.BookmarkNames</vh></v>
<v t="ekr.20181231110604.14"><vh>Bookmark.CacheBookmarks</vh></v>
<v t="ekr.20181231110604.15"><vh>Bookmark.CompareBookmarksByName</vh></v>
<v t="ekr.20181231110604.16"><vh>Bookmark.delete</vh></v>
<v t="ekr.20181231110604.17"><vh>Bookmark.getNode</vh></v>
<v t="ekr.20181231110604.18"><vh>Bookmark.ClearAll</vh></v>
<v t="ekr.20181231110604.19"><vh>Bookmark.GetSelected</vh></v>
<v t="ekr.20181231110604.20"><vh>Bookmark.InvalidBookmarks</vh></v>
<v t="ekr.20181231110604.21"><vh>Bookmark.mustExist</vh></v>
<v t="ekr.20181231110604.22"><vh>Bookmark.New</vh></v>
<v t="ekr.20181231110604.23"><vh>Bookmark.open</vh></v>
<v t="ekr.20181231110604.24"><vh>Bookmark.openInNewTab</vh></v>
<v t="ekr.20181231110604.25"><vh>Bookmark.setPath</vh></v>
<v t="ekr.20181231110604.26"><vh>Bookmark.SortBookmarksList</vh></v>
<v t="ekr.20181231110604.27"><vh>Bookmark.toRoot</vh></v>
<v t="ekr.20181231110604.28"><vh>Bookmark.ToRoot</vh></v>
<v t="ekr.20181231110604.29"><vh>Bookmark.validate</vh></v>
<v t="ekr.20181231110604.30"><vh>Bookmark.Write</vh></v>
</v>
<v t="ekr.20181231110604.31"><vh>@path creator.vim</vh>
<v t="ekr.20181231110604.32"><vh>&lt;&lt; docstring &gt;&gt;</vh></v>
<v t="ekr.20181231110604.33"><vh>" FUNCTION: s:Creator._bindMappings() {{{1</vh></v>
<v t="ekr.20181231110604.34"><vh>" FUNCTION: s:Creator._broadcastInitEvent() {{{1</vh></v>
<v t="ekr.20181231110604.35"><vh>" FUNCTION: s:Creator.BufNamePrefix() {{{1</vh></v>
<v t="ekr.20181231110604.36"><vh>" FUNCTION: s:Creator.CreateTabTree(a:name) {{{1</vh></v>
<v t="ekr.20181231110604.37"><vh>" FUNCTION: s:Creator.createTabTree(a:name) {{{1</vh></v>
<v t="ekr.20181231110604.38"><vh>" FUNCTION: s:Creator.CreateWindowTree(dir) {{{1</vh></v>
<v t="ekr.20181231110604.39"><vh>" FUNCTION: s:Creator.createWindowTree(dir) {{{1</vh></v>
<v t="ekr.20181231110604.40"><vh>" FUNCTION: s:Creator._createNERDTree(path) {{{1</vh></v>
<v t="ekr.20181231110604.41"><vh>" FUNCTION: s:Creator.CreateMirror() {{{1</vh></v>
<v t="ekr.20181231110604.42"><vh>" FUNCTION: s:Creator.createMirror() {{{1</vh></v>
<v t="ekr.20181231110604.43"><vh>" FUNCTION: s:Creator._createTreeWin() {{{1</vh></v>
<v t="ekr.20181231110604.44"><vh>" FUNCTION: s:Creator._isBufHidden(nr) {{{1</vh></v>
<v t="ekr.20181231110604.45"><vh>" FUNCTION: s:Creator.New() {{{1</vh></v>
<v t="ekr.20181231110604.46"><vh>" FUNCTION: s:Creator._nextBufferName() {{{2</vh></v>
<v t="ekr.20181231110604.47"><vh>" FUNCTION: s:Creator._nextBufferNumber() {{{2</vh></v>
<v t="ekr.20181231110604.48"><vh>" FUNCTION: s:Creator._pathForString(str) {{{1</vh></v>
<v t="ekr.20181231110604.49"><vh>" Function: s:Creator._removeTreeBufForTab()   {{{1</vh></v>
<v t="ekr.20181231110604.50"><vh>" FUNCTION: s:Creator._setCommonBufOptions() {{{1</vh></v>
<v t="ekr.20181231110604.51"><vh>" FUNCTION: s:Creator._setupStatusline() {{{1</vh></v>
<v t="ekr.20181231110604.52"><vh>" FUNCTION: s:Creator._tabpagevar(tabnr, var) {{{1</vh></v>
<v t="ekr.20181231110604.53"><vh>" FUNCTION: s:Creator.ToggleTabTree(dir) {{{1</vh></v>
<v t="ekr.20181231110604.54"><vh>" FUNCTION: s:Creator.toggleTabTree(dir) {{{1</vh></v>
<v t="ekr.20181231110604.55"><vh>" Function: s:Creator._uniq(list)   {{{1</vh></v>
</v>
<v t="ekr.20181231110604.56"><vh>@path event.vim</vh></v>
<v t="ekr.20181231110604.57"><vh>@path flag_set.vim</vh>
<v t="ekr.20181231110604.58"><vh>"FUNCTION: FlagSet.addFlag(scope, flag) {{{1</vh></v>
<v t="ekr.20181231110604.59"><vh>"FUNCTION: FlagSet.clearFlags(scope) {{{1</vh></v>
<v t="ekr.20181231110604.60"><vh>"FUNCTION: FlagSet._flagsForScope(scope) {{{1</vh></v>
<v t="ekr.20181231110604.61"><vh>"FUNCTION: FlagSet.New() {{{1</vh></v>
<v t="ekr.20181231110604.62"><vh>"FUNCTION: FlagSet.removeFlag(scope, flag) {{{1</vh></v>
<v t="ekr.20181231110604.63"><vh>"FUNCTION: FlagSet.renderToString() {{{1</vh></v>
</v>
<v t="ekr.20181231110604.64"><vh>@path key_map.vim</vh>
<v t="ekr.20181231110604.65"><vh>"FUNCTION: KeyMap.All() {{{1</vh></v>
<v t="ekr.20181231110604.66"><vh>"FUNCTION: KeyMap.Compare(keyMap1, keyMap2) {{{1</vh></v>
<v t="ekr.20181231110604.67"><vh>"FUNCTION: KeyMap.FindFor(key, scope) {{{1</vh></v>
<v t="ekr.20181231110604.68"><vh>"FUNCTION: KeyMap.BindAll() {{{1</vh></v>
<v t="ekr.20181231110604.69"><vh>"FUNCTION: KeyMap.bind() {{{1</vh></v>
<v t="ekr.20181231110604.70"><vh>"FUNCTION: KeyMap.Remove(key, scope) {{{1</vh></v>
<v t="ekr.20181231110604.71"><vh>"FUNCTION: KeyMap.invoke() {{{1</vh></v>
<v t="ekr.20181231110604.72"><vh>"FUNCTION: KeyMap.Invoke() {{{1</vh></v>
<v t="ekr.20181231110604.73"><vh>"FUNCTION: KeyMap.Create(options) {{{1</vh></v>
<v t="ekr.20181231110604.74"><vh>"FUNCTION: KeyMap.Add(keymap) {{{1</vh></v>
</v>
<v t="ekr.20181231110604.75"><vh>@path menu_controller.vim</vh>
<v t="ekr.20181231110604.76"><vh>"FUNCTION: MenuController.New(menuItems) {{{1</vh></v>
<v t="ekr.20181231110604.77"><vh>" FUNCTION: MenuController.showMenu() {{{1</vh></v>
<v t="ekr.20181231110604.78"><vh>"FUNCTION: MenuController._echoPrompt() {{{1</vh></v>
<v t="ekr.20181231110604.79"><vh>"FUNCTION: MenuController._current(key) {{{1</vh></v>
<v t="ekr.20181231110604.80"><vh>"FUNCTION: MenuController._handleKeypress(key) {{{1</vh></v>
<v t="ekr.20181231110604.81"><vh>"FUNCTION: MenuController._allIndexesFor(shortcut) {{{1</vh></v>
<v t="ekr.20181231110604.82"><vh>"FUNCTION: MenuController._nextIndexFor(shortcut) {{{1</vh></v>
<v t="ekr.20181231110604.83"><vh>"FUNCTION: MenuController._setCmdheight() {{{1</vh></v>
<v t="ekr.20181231110604.84"><vh>"FUNCTION: MenuController._saveOptions() {{{1</vh></v>
<v t="ekr.20181231110604.85"><vh>"FUNCTION: MenuController._restoreOptions() {{{1</vh></v>
<v t="ekr.20181231110604.86"><vh>"FUNCTION: MenuController._cursorDown() {{{1</vh></v>
<v t="ekr.20181231110604.87"><vh>"FUNCTION: MenuController._cursorUp() {{{1</vh></v>
</v>
<v t="ekr.20181231110604.88"><vh>@path menu_item.vim</vh>
<v t="ekr.20181231110604.89"><vh>"FUNCTION: MenuItem.All() {{{1</vh></v>
<v t="ekr.20181231110604.90"><vh>"FUNCTION: MenuItem.AllEnabled() {{{1</vh></v>
<v t="ekr.20181231110604.91"><vh>"FUNCTION: MenuItem.Create(options) {{{1</vh></v>
<v t="ekr.20181231110604.92"><vh>"FUNCTION: MenuItem.CreateSeparator(options) {{{1</vh></v>
<v t="ekr.20181231110604.93"><vh>"FUNCTION: MenuItem.CreateSubmenu(options) {{{1</vh></v>
<v t="ekr.20181231110604.94"><vh>"FUNCTION: MenuItem.enabled() {{{1</vh></v>
<v t="ekr.20181231110604.95"><vh>"FUNCTION: MenuItem.execute() {{{1</vh></v>
<v t="ekr.20181231110604.96"><vh>"FUNCTION: MenuItem.isSeparator() {{{1</vh></v>
<v t="ekr.20181231110604.97"><vh>"FUNCTION: MenuItem.isSubmenu() {{{1</vh></v>
</v>
<v t="ekr.20181231110604.98"><vh>@path nerdtree.vim</vh>
<v t="ekr.20181231110604.99"><vh>"FUNCTION: s:NERDTree.AddPathFilter() {{{1</vh></v>
<v t="ekr.20181231110604.100"><vh>"FUNCTION: s:NERDTree.changeRoot(node) {{{1</vh></v>
<v t="ekr.20181231110604.101"><vh>"FUNCTION: s:NERDTree.Close() {{{1</vh></v>
<v t="ekr.20181231110604.102"><vh>"FUNCTION: s:NERDTree.CloseIfQuitOnOpen() {{{1</vh></v>
<v t="ekr.20181231110604.103"><vh>"FUNCTION: s:NERDTree.CursorToBookmarkTable(){{{1</vh></v>
<v t="ekr.20181231110604.104"><vh>"FUNCTION: s:NERDTree.CursorToTreeWin(){{{1</vh></v>
<v t="ekr.20181231110604.105"><vh>" Function: s:NERDTree.ExistsForBuffer()   {{{1</vh></v>
<v t="ekr.20181231110604.106"><vh>" Function: s:NERDTree.ExistsForTab()   {{{1</vh></v>
<v t="ekr.20181231110604.107"><vh>function! s:NERDTree.ForCurrentBuf()</vh></v>
<v t="ekr.20181231110604.108"><vh>"FUNCTION: s:NERDTree.ForCurrentTab() {{{1</vh></v>
<v t="ekr.20181231110604.109"><vh>"FUNCTION: s:NERDTree.getRoot() {{{1</vh></v>
<v t="ekr.20181231110604.110"><vh>"FUNCTION: s:NERDTree.GetWinNum() {{{1</vh></v>
<v t="ekr.20181231110604.111"><vh>"FUNCTION: s:NERDTree.IsOpen() {{{1</vh></v>
<v t="ekr.20181231110604.112"><vh>"FUNCTION: s:NERDTree.isTabTree() {{{1</vh></v>
<v t="ekr.20181231110604.113"><vh>"FUNCTION: s:NERDTree.isWinTree() {{{1</vh></v>
<v t="ekr.20181231110604.114"><vh>"FUNCTION: s:NERDTree.MustBeOpen() {{{1</vh></v>
<v t="ekr.20181231110604.115"><vh>"FUNCTION: s:NERDTree.New() {{{1</vh></v>
<v t="ekr.20181231110604.116"><vh>"FUNCTION: s:NERDTree.PathFilters() {{{1</vh></v>
<v t="ekr.20181231110604.117"><vh>"FUNCTION: s:NERDTree.previousBuf() {{{1</vh></v>
<v t="ekr.20181231110604.118"><vh>"FUNCTION: s:NERDTree.render() {{{1</vh></v>
</v>
<v t="ekr.20181231110604.119"><vh>@path notifier.vim</vh>
<v t="ekr.20181231110604.120"><vh>function! s:Notifier.AddListener(event, funcname)</vh></v>
<v t="ekr.20181231110604.121"><vh>function! s:Notifier.NotifyListeners(event, path, nerdtree, params)</vh></v>
<v t="ekr.20181231110604.122"><vh>function! s:Notifier.GetListenersMap()</vh></v>
<v t="ekr.20181231110604.123"><vh>function! s:Notifier.GetListenersForEvent(name)</vh></v>
</v>
<v t="ekr.20181231110604.124"><vh>@path opener.vim</vh>
<v t="ekr.20181231110604.125"><vh>" FUNCTION: s:Opener._bufInWindows(bnum) {{{1</vh></v>
<v t="ekr.20181231110604.126"><vh>" FUNCTION: Opener._checkToCloseTree(newtab) {{{1</vh></v>
<v t="ekr.20181231110604.127"><vh>" FUNCTION: s:Opener._firstUsableWindow() {{{1</vh></v>
<v t="ekr.20181231110604.128"><vh>" FUNCTION: Opener._gotoTargetWin() {{{1</vh></v>
<v t="ekr.20181231110604.129"><vh>" FUNCTION: s:Opener._isWindowUsable(winnumber) {{{1</vh></v>
<v t="ekr.20181231110604.130"><vh>" FUNCTION: Opener.New(path, opts) {{{1</vh></v>
<v t="ekr.20181231110604.131"><vh>" FUNCTION: Opener._newSplit() {{{1</vh></v>
<v t="ekr.20181231110604.132"><vh>" FUNCTION: Opener._newVSplit() {{{1</vh></v>
<v t="ekr.20181231110604.133"><vh>" FUNCTION: Opener.open(target) {{{1</vh></v>
<v t="ekr.20181231110604.134"><vh>" FUNCTION: Opener._openFile() {{{1</vh></v>
<v t="ekr.20181231110604.135"><vh>" FUNCTION: Opener._openDirectory(node) {{{1</vh></v>
<v t="ekr.20181231110604.136"><vh>" FUNCTION: Opener._previousWindow() {{{1</vh></v>
<v t="ekr.20181231110604.137"><vh>" FUNCTION: Opener._restoreCursorPos() {{{1</vh></v>
<v t="ekr.20181231110604.138"><vh>" FUNCTION: Opener._reuseWindow() {{{1</vh></v>
<v t="ekr.20181231110604.139"><vh>" FUNCTION: Opener._saveCursorPos() {{{1</vh></v>
</v>
<v t="ekr.20181231110604.140"><vh>@path path.vim</vh>
<v t="ekr.20181231110604.141"><vh>" FUNCTION: Path.AbsolutePathFor(pathStr) {{{1</vh></v>
<v t="ekr.20181231110604.142"><vh>" FUNCTION: Path.bookmarkNames() {{{1</vh></v>
<v t="ekr.20181231110604.143"><vh>" FUNCTION: Path.cacheDisplayString() {{{1</vh></v>
<v t="ekr.20181231110604.144"><vh>" FUNCTION: Path.addDelimiter() {{{1</vh></v>
<v t="ekr.20181231110604.145"><vh>" FUNCTION: Path.changeToDir() {{{1</vh></v>
<v t="ekr.20181231110604.146"><vh>" FUNCTION: Path.compareTo() {{{1</vh></v>
<v t="ekr.20181231110604.147"><vh>" FUNCTION: Path.Create(fullpath) {{{1</vh></v>
<v t="ekr.20181231110604.148"><vh>" FUNCTION: Path.copy(dest) {{{1</vh></v>
<v t="ekr.20181231110604.149"><vh>" FUNCTION: Path.CopyingSupported() {{{1</vh></v>
<v t="ekr.20181231110604.150"><vh>" FUNCTION: Path.createParentDirectories(path) {{{1</vh></v>
<v t="ekr.20181231110604.151"><vh>" FUNCTION: Path.delete() {{{1</vh></v>
<v t="ekr.20181231110604.152"><vh>" FUNCTION: Path.displayString() {{{1</vh></v>
<v t="ekr.20181231110604.153"><vh>" FUNCTION: Path.edit() {{{1</vh></v>
<v t="ekr.20181231110604.154"><vh>" FUNCTION: Path.exists() {{{1</vh></v>
<v t="ekr.20181231110604.155"><vh>" FUNCTION: Path._escChars() {{{1</vh></v>
<v t="ekr.20181231110604.156"><vh>" FUNCTION: Path.getDir() {{{1</vh></v>
<v t="ekr.20181231110604.157"><vh>" FUNCTION: Path.getParent() {{{1</vh></v>
<v t="ekr.20181231110604.158"><vh>" FUNCTION: Path.getLastPathComponent(dirSlash) {{{1</vh></v>
<v t="ekr.20181231110604.159"><vh>" FUNCTION: Path.getSortOrderIndex() {{{1</vh></v>
<v t="ekr.20181231110604.160"><vh>" FUNCTION: Path._splitChunks(path) {{{1</vh></v>
<v t="ekr.20181231110604.161"><vh>" FUNCTION: Path.getSortKey() {{{1</vh></v>
<v t="ekr.20181231110604.162"><vh>" FUNCTION: Path.isHiddenUnder(path) {{{1</vh></v>
<v t="ekr.20181231110604.163"><vh>" FUNCTION: Path.isUnixHiddenFile() {{{1</vh></v>
<v t="ekr.20181231110604.164"><vh>" FUNCTION: Path.isUnixHiddenPath() {{{1</vh></v>
<v t="ekr.20181231110604.165"><vh>" FUNCTION: Path.ignore(nerdtree) {{{1</vh></v>
<v t="ekr.20181231110604.166"><vh>" FUNCTION: Path._ignorePatternMatches(pattern) {{{1</vh></v>
<v t="ekr.20181231110604.167"><vh>" FUNCTION: Path.isAncestor(path) {{{1</vh></v>
<v t="ekr.20181231110604.168"><vh>" FUNCTION: Path.isUnder(path) {{{1</vh></v>
<v t="ekr.20181231110604.169"><vh>" FUNCTION: Path.JoinPathStrings(...) {{{1</vh></v>
<v t="ekr.20181231110604.170"><vh>" FUNCTION: Path.equals() {{{1</vh></v>
<v t="ekr.20181231110604.171"><vh>" FUNCTION: Path.Slash() {{{1</vh></v>
<v t="ekr.20181231110604.172"><vh>" FUNCTION: Path.Resolve() {{{1</vh></v>
<v t="ekr.20181231110604.173"><vh>" FUNCTION: Path.refresh(nerdtree) {{{1</vh></v>
<v t="ekr.20181231110604.174"><vh>" FUNCTION: Path.refreshFlags(nerdtree) {{{1</vh></v>
<v t="ekr.20181231110604.175"><vh>" FUNCTION: Path.rename() {{{1</vh></v>
<v t="ekr.20181231110604.176"><vh>" FUNCTION: Path.str() {{{1</vh></v>
<v t="ekr.20181231110604.177"><vh>" FUNCTION: Path._strForUI() {{{1</vh></v>
<v t="ekr.20181231110604.178"><vh>" FUNCTION: Path._strForCd() {{{1</vh></v>
<v t="ekr.20181231110604.179"><vh>" FUNCTION: Path._strForEdit() {{{1</vh></v>
<v t="ekr.20181231110604.180"><vh>" FUNCTION: Path._strForGlob() {{{1</vh></v>
<v t="ekr.20181231110604.181"><vh>" FUNCTION: Path._str() {{{1</vh></v>
<v t="ekr.20181231110604.182"><vh>" FUNCTION: Path.strTrunk() {{{1</vh></v>
<v t="ekr.20181231110604.183"><vh></vh></v>
</v>
<v t="ekr.20181231110604.184"><vh>@path tree_dir_node.vim</vh>
<v t="ekr.20181231110604.185"><vh>" FUNCTION: TreeDirNode.AbsoluteTreeRoot(){{{1</vh></v>
<v t="ekr.20181231110604.186"><vh>" FUNCTION: TreeDirNode.activate([options]) {{{1</vh></v>
<v t="ekr.20181231110604.187"><vh>" FUNCTION: TreeDirNode.addChild(treenode, inOrder) {{{1</vh></v>
<v t="ekr.20181231110604.188"><vh>" FUNCTION: TreeDirNode.close() {{{1</vh></v>
<v t="ekr.20181231110604.189"><vh>" FUNCTION: TreeDirNode.closeChildren() {{{1</vh></v>
<v t="ekr.20181231110604.190"><vh>" FUNCTION: TreeDirNode.createChild(path, inOrder) {{{1</vh></v>
<v t="ekr.20181231110604.191"><vh>" FUNCTION: TreeDirNode.displayString() {{{1</vh></v>
<v t="ekr.20181231110604.192"><vh>" FUNCTION: TreeDirNode.findNode(path) {{{1</vh></v>
<v t="ekr.20181231110604.193"><vh>" FUNCTION: TreeDirNode.getCascade() {{{1</vh></v>
<v t="ekr.20181231110604.194"><vh>" FUNCTION: TreeDirNode.getCascadeRoot() {{{1</vh></v>
<v t="ekr.20181231110604.195"><vh>" FUNCTION: TreeDirNode.getChildCount() {{{1</vh></v>
<v t="ekr.20181231110604.196"><vh>" FUNCTION: TreeDirNode.getChildByIndex(indx, visible) {{{1</vh></v>
<v t="ekr.20181231110604.197"><vh>" FUNCTION: TreeDirNode.getChildIndex(path) {{{1</vh></v>
<v t="ekr.20181231110604.198"><vh>" FUNCTION: TreeDirNode.getDirChildren() {{{1</vh></v>
<v t="ekr.20181231110604.199"><vh>" FUNCTION: TreeDirNode.GetSelected() {{{1</vh></v>
<v t="ekr.20181231110604.200"><vh>" FUNCTION: TreeDirNode.getVisibleChildCount() {{{1</vh></v>
<v t="ekr.20181231110604.201"><vh>" FUNCTION: TreeDirNode.getVisibleChildren() {{{1</vh></v>
<v t="ekr.20181231110604.202"><vh>" FUNCTION: TreeDirNode.hasVisibleChildren() {{{1</vh></v>
<v t="ekr.20181231110604.203"><vh>" FUNCTION: TreeDirNode.isCascadable() {{{1</vh></v>
<v t="ekr.20181231110604.204"><vh>" FUNCTION: TreeDirNode._initChildren() {{{1</vh></v>
<v t="ekr.20181231110604.205"><vh>" FUNCTION: TreeDirNode.New(path, nerdtree) {{{1</vh></v>
<v t="ekr.20181231110604.206"><vh>" FUNCTION: TreeDirNode.open([options]) {{{1</vh></v>
<v t="ekr.20181231110604.207"><vh>" FUNCTION: TreeDirNode.openAlong([opts]) {{{1</vh></v>
<v t="ekr.20181231110604.208"><vh>" FUNCTION: TreeDirNode.openExplorer() {{{1</vh></v>
<v t="ekr.20181231110604.209"><vh>" FUNCTION: TreeDirNode.openInNewTab(options) {{{1</vh></v>
<v t="ekr.20181231110604.210"><vh>" FUNCTION: TreeDirNode._openInNewTab() {{{1</vh></v>
<v t="ekr.20181231110604.211"><vh>" FUNCTION: TreeDirNode.openRecursively() {{{1</vh></v>
<v t="ekr.20181231110604.212"><vh>" FUNCTION: TreeDirNode.refresh() {{{1</vh></v>
<v t="ekr.20181231110604.213"><vh>" FUNCTION: TreeDirNode.refreshFlags() {{{1</vh></v>
<v t="ekr.20181231110604.214"><vh>" FUNCTION: TreeDirNode.refreshDirFlags() {{{1</vh></v>
<v t="ekr.20181231110604.215"><vh>" FUNCTION: TreeDirNode.reveal(path) {{{1</vh></v>
<v t="ekr.20181231110604.216"><vh></vh></v>
<v t="ekr.20181231110604.217"><vh>" FUNCTION: TreeDirNode.sortChildren() {{{1</vh></v>
<v t="ekr.20181231110604.218"><vh>" FUNCTION: TreeDirNode.toggleOpen([options]) {{{1</vh></v>
<v t="ekr.20181231110604.219"><vh>" FUNCTION: TreeDirNode.transplantChild(newNode) {{{1</vh></v>
</v>
<v t="ekr.20181231110604.220"><vh>@path tree_file_node.vim</vh>
<v t="ekr.20181231110604.221"><vh>" FUNCTION: TreeFileNode.activate(...) {{{1</vh></v>
<v t="ekr.20181231110604.222"><vh>" FUNCTION: TreeFileNode.cacheParent</vh></v>
<v t="ekr.20181231110604.223"><vh>" FUNCTION: TreeFileNode.clearBookmarks() {{{1</vh></v>
<v t="ekr.20181231110604.224"><vh>" FUNCTION: TreeFileNode.copy(dest) {{{1</vh></v>
<v t="ekr.20181231163532.1"><vh>" FUNCTION: TreeFileNode.delete {{{1</vh></v>
<v t="ekr.20181231163518.1"><vh>" FUNCTION: TreeFileNode.displayString() {{{1</vh></v>
<v t="ekr.20181231163535.1"><vh>" FUNCTION: TreeFileNode.findNode(path) {{{1</vh></v>
<v t="ekr.20181231163537.1"><vh>" FUNCTION: TreeFileNode.findSibling(direction) {{{1</vh></v>
<v t="ekr.20181231163539.1"><vh>" FUNCTION: TreeFileNode.getNerdtree(){{{1</vh></v>
<v t="ekr.20181231163541.1"><vh>" FUNCTION: TreeFileNode.GetRootForTab(){{{1</vh></v>
<v t="ekr.20181231163544.1"><vh>" FUNCTION: TreeFileNode.GetSelected() {{{1</vh></v>
<v t="ekr.20181231163547.1"><vh>" FUNCTION: TreeFileNode.isVisible() {{{1</vh></v>
<v t="ekr.20181231163548.1"><vh>" FUNCTION: TreeFileNode.isRoot() {{{1</vh></v>
<v t="ekr.20181231163550.1"><vh>" FUNCTION: TreeFileNode.New(path, nerdtree) {{{1</vh></v>
<v t="ekr.20181231163552.1"><vh>" FUNCTION: TreeFileNode.open() {{{1</vh></v>
<v t="ekr.20181231163554.1"><vh>" FUNCTION: TreeFileNode.openSplit() {{{1</vh></v>
<v t="ekr.20181231163555.1"><vh>" FUNCTION: TreeFileNode.openVSplit() {{{1</vh></v>
<v t="ekr.20181231163558.1"><vh>" FUNCTION: TreeFileNode.openInNewTab(options) {{{1</vh></v>
<v t="ekr.20181231163600.1"><vh>" FUNCTION: TreeFileNode.putCursorHere(isJump, recurseUpward){{{1</vh></v>
<v t="ekr.20181231163602.1"><vh>" FUNCTION: TreeFileNode.refresh() {{{1</vh></v>
<v t="ekr.20181231163603.1"><vh>" FUNCTION: TreeFileNode.refreshFlags() {{{1</vh></v>
<v t="ekr.20181231163605.1"><vh>" FUNCTION: TreeFileNode.rename() {{{1</vh></v>
<v t="ekr.20181231163607.1"><vh>" FUNCTION: TreeFileNode.renderToString {{{1</vh></v>
<v t="ekr.20181231163609.1"><vh>" TreeFileNode._renderToString</vh></v>
</v>
<v t="ekr.20181231110604.225"><vh>@path ui.vim</vh>
<v t="ekr.20181231110604.226"><vh>" FUNCTION: s:UI.centerView() {{{2</vh></v>
<v t="ekr.20181231110604.227"><vh>" FUNCTION: s:UI._dumpHelp  {{{1</vh></v>
<v t="ekr.20181231110604.228"><vh>" FUNCTION: s:UI.new(nerdtree) {{{1</vh></v>
<v t="ekr.20181231110604.229"><vh>" FUNCTION: s:UI.getPath(ln) {{{1</vh></v>
<v t="ekr.20181231110604.230"><vh>" FUNCTION: s:UI.getLineNum(node) {{{1</vh></v>
<v t="ekr.20181231110604.231"><vh>" FUNCTION: s:UI.getLineNum(node) {{{1</vh></v>
<v t="ekr.20181231110604.232"><vh>" FUNCTION: s:UI.getRootLineNum(){{{1</vh></v>
<v t="ekr.20181231110604.233"><vh>" FUNCTION: s:UI.getShowBookmarks() {{{1</vh></v>
<v t="ekr.20181231110604.234"><vh>" FUNCTION: s:UI.getShowFiles() {{{1</vh></v>
<v t="ekr.20181231110604.235"><vh>" FUNCTION: s:UI.getShowHelp() {{{1</vh></v>
<v t="ekr.20181231110604.236"><vh>" FUNCTION: s:UI.getShowHidden() {{{1</vh></v>
<v t="ekr.20181231110604.237"><vh>" FUNCTION: s:UI._indentLevelFor(line) {{{1</vh></v>
<v t="ekr.20181231110604.238"><vh>" FUNCTION: s:UI.IndentWid() {{{1</vh></v>
<v t="ekr.20181231110604.239"><vh>" FUNCTION: s:UI.isIgnoreFilterEnabled() {{{1</vh></v>
<v t="ekr.20181231110604.240"><vh>" FUNCTION: s:UI.isMinimal() {{{1</vh></v>
<v t="ekr.20181231110604.241"><vh>" FUNCTION: s:UI.MarkupReg() {{{1</vh></v>
<v t="ekr.20181231110604.242"><vh>" FUNCTION: s:UI._renderBookmarks {{{1</vh></v>
<v t="ekr.20181231110604.243"><vh>" FUNCTION: s:UI.restoreScreenState() {{{1</vh></v>
<v t="ekr.20181231110604.244"><vh>" FUNCTION: s:UI.saveScreenState() {{{1</vh></v>
<v t="ekr.20181231110604.245"><vh>" FUNCTION: s:UI.setShowHidden(val) {{{1</vh></v>
<v t="ekr.20181231110604.246"><vh>" FUNCTION: s:UI._stripMarkup(line){{{1</vh></v>
<v t="ekr.20181231110604.247"><vh>" FUNCTION: s:UI.render() {{{1</vh></v>
<v t="ekr.20181231110604.248"><vh>" FUNCTION: UI.renderViewSavingPosition {{{1</vh></v>
<v t="ekr.20181231110604.249"><vh>" FUNCTION: s:UI.toggleHelp() {{{1</vh></v>
<v t="ekr.20181231110604.250"><vh>" FUNCTION: s:UI.toggleIgnoreFilter() {{{1</vh></v>
<v t="ekr.20181231110604.251"><vh>" FUNCTION: s:UI.toggleShowBookmarks() {{{1</vh></v>
<v t="ekr.20181231110604.252"><vh>" FUNCTION: s:UI.toggleShowFiles() {{{1</vh></v>
<v t="ekr.20181231110604.253"><vh>" FUNCTION: s:UI.toggleShowHidden() {{{1</vh></v>
<v t="ekr.20181231110604.254"><vh>" FUNCTION: s:UI.toggleZoom() {{{1</vh></v>
<v t="ekr.20181231110604.255"><vh>" FUNCTION: s:UI.UpDirLine() {{{1</vh></v>
</v>
</v>
<v t="ekr.20181231110604.256"><vh>@path nerdtree_plugin</vh>
<v t="ekr.20181231110604.257"><vh>@path exec_menu_item.vim</vh>
<v t="ekr.20181231110604.258"><vh>&lt;&lt;docstring&gt;&gt;</vh></v>
<v t="ekr.20181231110604.259"><vh>&lt;&lt;startup&gt;&gt;</vh></v>
<v t="ekr.20181231111331.1"><vh>function! NERDTreeExecFileActive()</vh></v>
<v t="ekr.20181231111334.1"><vh>function! NERDTreeExecFile()</vh></v>
</v>
<v t="ekr.20181231110604.260"><vh>@path fs_menu.vim</vh>
<v t="ekr.20181231110604.261"><vh>&lt;&lt; docstring &gt;&gt;</vh></v>
<v t="ekr.20181231110604.262"><vh>&lt;&lt; startup &gt;&gt;</vh></v>
<v t="ekr.20181231110604.263"><vh>&lt;&lt; menus &gt;&gt;</vh></v>
<v t="ekr.20181231110604.264"><vh>promptToDelBuffer</vh></v>
<v t="ekr.20181231110604.265"><vh>renameBuffer</vh></v>
<v t="ekr.20181231110604.266"><vh>NERDTreeAddNode</vh></v>
<v t="ekr.20181231110604.267"><vh>NERDTreeMoveNode</vh></v>
<v t="ekr.20181231110604.268"><vh>NERDTreeDeleteNode</vh></v>
<v t="ekr.20181231110604.269"><vh>NERDTreeListNode</vh></v>
<v t="ekr.20181231110604.270"><vh>NERDTreeListNodeWin32</vh></v>
<v t="ekr.20181231110604.271"><vh>NERDTreeCopyNode</vh></v>
<v t="ekr.20181231110604.272"><vh>NERDTreeQuickLook</vh></v>
<v t="ekr.20181231110604.273"><vh>NERDTreeRevealInFinder</vh></v>
<v t="ekr.20181231110604.274"><vh>NERDTreeExecuteFile</vh></v>
<v t="ekr.20181231110604.275"><vh>NERDTreeRevealFileLinux</vh></v>
<v t="ekr.20181231110604.276"><vh>NERDTreeExecuteFileLinux</vh></v>
</v>
<v t="ekr.20181231110604.277"><vh>@path vcs.vim</vh>
<v t="ekr.20181231111402.1"><vh>&lt;&lt; docstring &gt;&gt;</vh></v>
<v t="ekr.20181231111410.1"><vh>" FUNCTION: s:CreateTabTreeVCS(a:name) {{{1</vh></v>
<v t="ekr.20181231111412.1"><vh>" FUNCTION: s:FindParentVCSRoot(a:path) {{{1</vh></v>
</v>
</v>
<v t="ekr.20181231110604.279"><vh>@path nerdtree/plugin/NERD_tree.vim</vh>
<v t="ekr.20181231110604.280"><vh>&lt;&lt; docstring &gt;&gt;</vh></v>
<v t="ekr.20181231110604.281"><vh>&lt;&lt; startup &gt;&gt;</vh></v>
<v t="ekr.20181231110604.282"><vh>initVariable</vh></v>
<v t="ekr.20181231110604.283"><vh>SECTION: Init variable calls and other random constants</vh></v>
<v t="ekr.20181231110604.284"><vh>SECTION: Init variable calls for key mappings</vh></v>
<v t="ekr.20181231110604.285"><vh>SECTION: Load class files</vh></v>
<v t="ekr.20181231110604.286"><vh>SECTION: Commands</vh></v>
<v t="ekr.20181231110604.287"><vh>SECTION: Auto command</vh></v>
<v t="ekr.20181231110604.288"><vh>SECTION: Public API</vh></v>
<v t="ekr.20181231110604.289"><vh>NERDTreeAddMenuSeparator</vh></v>
<v t="ekr.20181231110604.290"><vh>NERDTreeAddSubmenu</vh></v>
<v t="ekr.20181231110604.291"><vh>NERDTreeAddKeyMap</vh></v>
<v t="ekr.20181231110604.292"><vh>NERDTreeRender</vh></v>
<v t="ekr.20181231110604.293"><vh>NERDTreeFocus</vh></v>
<v t="ekr.20181231110604.294"><vh>NERDTreeCWD</vh></v>
<v t="ekr.20181231110604.295"><vh>NERDTreeAddPathFilter</vh></v>
</v>
<v t="ekr.20181231110604.297"><vh>@path nerdtree/syntax/nerdtree.vim</vh></v>
</vnodes>
<tnodes>
<t tx="ekr.20181231110555.1">'''Recursively import all python files in a directory and clean the result.'''
@tabwidth -4 # For a better match.
# g.cls()
c.recursiveImport(
    r'C:\leo.repo\nerdtree',
    kind = '@edit', # '@auto', '@clean', '@nosent','@file',
    add_path = False,
    recursive = True,
    safe_at_file = True,
    theTypes = ['.vim',] # ['.py', '.js','.vue',],
)
# c.expandAllSubheads()
</t>
<t tx="ekr.20181231110604.10">" Class method to get all bookmarks. Lazily initializes the bookmarks global
" variable
function! s:Bookmark.Bookmarks()
    if !exists("g:NERDTreeBookmarks")
        let g:NERDTreeBookmarks = []
    endif
    return g:NERDTreeBookmarks
endfunction</t>
<t tx="ekr.20181231110604.100">function! s:NERDTree.changeRoot(node)
    if a:node.path.isDirectory
        let self.root = a:node
    else
        call a:node.cacheParent()
        let self.root = a:node.parent
    endif

    call self.root.open()

    "change dir to the dir of the new root if instructed to
    if g:NERDTreeChDirMode ==# 2
        call self.root.path.changeToDir()
    endif

    call self.render()
    call self.root.putCursorHere(0, 0)

    silent doautocmd User NERDTreeNewRoot
endfunction</t>
<t tx="ekr.20181231110604.101">"Closes the tab tree window for this tab
function! s:NERDTree.Close()
    if !s:NERDTree.IsOpen()
        return
    endif

    if winnr("$") != 1
        " Use the window ID to identify the currently active window or fall
        " back on the buffer ID if win_getid/win_gotoid are not available, in
        " which case we'll focus an arbitrary window showing the buffer.
        let l:useWinId = exists('*win_getid') &amp;&amp; exists('*win_gotoid')

        if winnr() == s:NERDTree.GetWinNum()
            call nerdtree#exec("wincmd p")
            let l:activeBufOrWin = l:useWinId ? win_getid() : bufnr("")
            call nerdtree#exec("wincmd p")
        else
            let l:activeBufOrWin = l:useWinId ? win_getid() : bufnr("")
        endif

        call nerdtree#exec(s:NERDTree.GetWinNum() . " wincmd w")
        close
        if l:useWinId
            call nerdtree#exec("call win_gotoid(" . l:activeBufOrWin . ")")
        else
            call nerdtree#exec(bufwinnr(l:activeBufOrWin) . " wincmd w")
        endif
    else
        close
    endif
endfunction</t>
<t tx="ekr.20181231110604.102">"FUNCTION: s:NERDTree.CloseIfQuitOnOpen() {{{1
"Closes the NERD tree window if the close on open option is set
function! s:NERDTree.CloseIfQuitOnOpen()
    if g:NERDTreeQuitOnOpen &amp;&amp; s:NERDTree.IsOpen()
        call s:NERDTree.Close()
    endif
endfunction</t>
<t tx="ekr.20181231110604.103">"Places the cursor at the top of the bookmarks table
function! s:NERDTree.CursorToBookmarkTable()
    if !b:NERDTree.ui.getShowBookmarks()
        throw "NERDTree.IllegalOperationError: cant find bookmark table, bookmarks arent active"
    endif

    if g:NERDTreeMinimalUI
        return cursor(1, 2)
    endif

    let rootNodeLine = b:NERDTree.ui.getRootLineNum()

    let line = 1
    while getline(line) !~# '^&gt;-\+Bookmarks-\+$'
        let line = line + 1
        if line &gt;= rootNodeLine
            throw "NERDTree.BookmarkTableNotFoundError: didnt find the bookmarks table"
        endif
    endwhile
    call cursor(line, 2)
endfunction</t>
<t tx="ekr.20181231110604.104">"Places the cursor in the nerd tree window
function! s:NERDTree.CursorToTreeWin()
    call g:NERDTree.MustBeOpen()
    call nerdtree#exec(g:NERDTree.GetWinNum() . "wincmd w")
endfunction</t>
<t tx="ekr.20181231110604.105">" Returns 1 if a nerd tree root exists in the current buffer
function! s:NERDTree.ExistsForBuf()
    return exists("b:NERDTree")
endfunction</t>
<t tx="ekr.20181231110604.106">" Returns 1 if a nerd tree root exists in the current tab
function! s:NERDTree.ExistsForTab()
    if !exists("t:NERDTreeBufName")
        return
    end

    "check b:NERDTree is still there and hasn't been e.g. :bdeleted
    return !empty(getbufvar(bufnr(t:NERDTreeBufName), 'NERDTree'))
endfunction</t>
<t tx="ekr.20181231110604.107">    if s:NERDTree.ExistsForBuf()
        return b:NERDTree
    else
        return {}
    endif
endfunction</t>
<t tx="ekr.20181231110604.108">function! s:NERDTree.ForCurrentTab()
    if !s:NERDTree.ExistsForTab()
        return
    endif

    let bufnr = bufnr(t:NERDTreeBufName)
    return getbufvar(bufnr, "NERDTree")
endfunction</t>
<t tx="ekr.20181231110604.109">function! s:NERDTree.getRoot()
    return self.root
endfunction</t>
<t tx="ekr.20181231110604.11">" class method that returns 1 if a bookmark with the given name is found, 0
" otherwise
function! s:Bookmark.BookmarkExistsFor(name)
    try
        call s:Bookmark.BookmarkFor(a:name)
        return 1
    catch /^NERDTree.BookmarkNotFoundError/
        return 0
    endtry
endfunction</t>
<t tx="ekr.20181231110604.110">"gets the nerd tree window number for this tab
function! s:NERDTree.GetWinNum()
    if exists("t:NERDTreeBufName")
        return bufwinnr(t:NERDTreeBufName)
    endif

    return -1
endfunction</t>
<t tx="ekr.20181231110604.111">function! s:NERDTree.IsOpen()
    return s:NERDTree.GetWinNum() != -1
endfunction</t>
<t tx="ekr.20181231110604.112">function! s:NERDTree.isTabTree()
    return self._type == "tab"
endfunction</t>
<t tx="ekr.20181231110604.113">function! s:NERDTree.isWinTree()
    return self._type == "window"
endfunction</t>
<t tx="ekr.20181231110604.114">function! s:NERDTree.MustBeOpen()
    if !s:NERDTree.IsOpen()
        throw "NERDTree.TreeNotOpen"
    endif
endfunction</t>
<t tx="ekr.20181231110604.115">function! s:NERDTree.New(path, type)
    let newObj = copy(self)
    let newObj.ui = g:NERDTreeUI.New(newObj)
    let newObj.root = g:NERDTreeDirNode.New(a:path, newObj)
    let newObj._type = a:type
    return newObj
endfunction</t>
<t tx="ekr.20181231110604.116">function! s:NERDTree.PathFilters()
    if !exists('s:NERDTree._PathFilters')
        let s:NERDTree._PathFilters = []
    endif
    return s:NERDTree._PathFilters
endfunction</t>
<t tx="ekr.20181231110604.117">function! s:NERDTree.previousBuf()
    return self._previousBuf
endfunction

function! s:NERDTree.setPreviousBuf(bnum)
    let self._previousBuf = a:bnum
endfunction</t>
<t tx="ekr.20181231110604.118">"A convenience function - since this is called often
function! s:NERDTree.render()
    call self.ui.render()
endfunction</t>
<t tx="ekr.20181231110604.119">"CLASS: Notifier
"============================================================

let s:Notifier = {}

@others

let g:NERDTreePathNotifier = deepcopy(s:Notifier)
</t>
<t tx="ekr.20181231110604.12">" Class method that returns the Bookmark object having the specified name.
" Throws "NERDTree.BookmarkNotFoundError" if no Bookmark is found.
function! s:Bookmark.BookmarkFor(name)
    let l:result = {}
    for l:bookmark in s:Bookmark.Bookmarks()
        if l:bookmark.name ==# a:name
            let l:result = l:bookmark
            break
        endif
    endfor
    if empty(l:result)
        throw 'NERDTree.BookmarkNotFoundError: "' . a:name  . '" not found'
    endif
    return l:result
endfunction</t>
<t tx="ekr.20181231110604.120">    let listeners = s:Notifier.GetListenersForEvent(a:event)
    if listeners == []
        let listenersMap = s:Notifier.GetListenersMap()
        let listenersMap[a:event] = listeners
    endif
    call add(listeners, a:funcname)
endfunction</t>
<t tx="ekr.20181231110604.121">    let event = g:NERDTreeEvent.New(a:nerdtree, a:path, a:event, a:params)

    for listener in s:Notifier.GetListenersForEvent(a:event)
        call {listener}(event)
    endfor
endfunction</t>
<t tx="ekr.20181231110604.122">    if !exists("s:refreshListenersMap")
        let s:refreshListenersMap = {}
    endif
    return s:refreshListenersMap
endfunction</t>
<t tx="ekr.20181231110604.123">    let listenersMap = s:Notifier.GetListenersMap()
    return get(listenersMap, a:name, [])
endfunction</t>
<t tx="ekr.20181231110604.124">" ============================================================================
" CLASS: Opener
"
" The Opener class defines an API for "opening" operations.
" ============================================================================

let s:Opener = {}
let g:NERDTreeOpener = s:Opener

@others

" vim: set sw=4 sts=4 et fdm=marker:
</t>
<t tx="ekr.20181231110604.125">" [[STOLEN FROM VTREEEXPLORER.VIM]]
" Determine the number of windows open to this buffer number.
" Care of Yegappan Lakshman.  Thanks!
"
" Args:
" bnum: the subject buffers buffer number
function! s:Opener._bufInWindows(bnum)
    let cnt = 0
    let winnum = 1
    while 1
        let bufnum = winbufnr(winnum)
        if bufnum &lt; 0
            break
        endif
        if bufnum ==# a:bnum
            let cnt = cnt + 1
        endif
        let winnum = winnum + 1
    endwhile

    return cnt
endfunction</t>
<t tx="ekr.20181231110604.126">" Check the class options and global options (i.e. NERDTreeQuitOnOpen) to see
" if the tree should be closed now.
"
" Args:
" a:newtab - boolean. If set, only close the tree now if we are opening the
" target in a new tab. This is needed because we have to close tree before we
" leave the tab
function! s:Opener._checkToCloseTree(newtab)
    if self._keepopen
        return
    endif

    if (a:newtab &amp;&amp; self._where == 't') || !a:newtab
        call g:NERDTree.CloseIfQuitOnOpen()
    endif
endfunction</t>
<t tx="ekr.20181231110604.127">" find the window number of the first normal window
function! s:Opener._firstUsableWindow()
    let i = 1
    while i &lt;= winnr("$")
        let bnum = winbufnr(i)
        if bnum != -1 &amp;&amp; getbufvar(bnum, '&amp;buftype') ==# ''
                    \ &amp;&amp; !getwinvar(i, '&amp;previewwindow')
                    \ &amp;&amp; (!getbufvar(bnum, '&amp;modified') || &amp;hidden)
            return i
        endif

        let i += 1
    endwhile
    return -1
endfunction</t>
<t tx="ekr.20181231110604.128">function! s:Opener._gotoTargetWin()
    if b:NERDTree.isWinTree()
        if self._where == 'v'
            vsplit
        elseif self._where == 'h'
            split
        elseif self._where == 't'
            tabnew
        endif
    else
        call self._checkToCloseTree(1)

        if self._where == 'v'
            call self._newVSplit()
        elseif self._where == 'h'
            call self._newSplit()
        elseif self._where == 't'
            tabnew
        elseif self._where == 'p'
            call self._previousWindow()
        endif

        call self._checkToCloseTree(0)
    endif
endfunction</t>
<t tx="ekr.20181231110604.129">" Returns 0 if opening a file from the tree in the given window requires it to
" be split, 1 otherwise
"
" Args:
" winnumber: the number of the window in question
function! s:Opener._isWindowUsable(winnumber)
    "gotta split if theres only one window (i.e. the NERD tree)
    if winnr("$") ==# 1
        return 0
    endif

    let oldwinnr = winnr()
    call nerdtree#exec(a:winnumber . "wincmd p")
    let specialWindow = getbufvar("%", '&amp;buftype') != '' || getwinvar('%', '&amp;previewwindow')
    let modified = &amp;modified
    call nerdtree#exec(oldwinnr . "wincmd p")

    "if its a special window e.g. quickfix or another explorer plugin then we
    "have to split
    if specialWindow
        return 0
    endif

    if &amp;hidden
        return 1
    endif

    return !modified || self._bufInWindows(winbufnr(a:winnumber)) &gt;= 2
endfunction</t>
<t tx="ekr.20181231110604.13">" Class method to return an array of all bookmark names
function! s:Bookmark.BookmarkNames()
    let names = []
    for i in s:Bookmark.Bookmarks()
        call add(names, i.name)
    endfor
    return names
endfunction</t>
<t tx="ekr.20181231110604.130">" Instantiate a new NERDTreeOpener object.
" Args:
" a:path: the path object that is to be opened
" a:opts: a dictionary containing the following optional keys...
"   'where': specifies whether the node should be opened in new split, in
"            a new tab or, in the last window; takes values "v", "h", or "t"
"   'reuse': if file is already shown in a window, jump there; takes values
"            "all", "currenttab", or empty
"   'keepopen': boolean (0 or 1); if true, the tree window will not be closed
"   'stay': boolean (0 or 1); if true, remain in tree window after opening
function! s:Opener.New(path, opts)
    let l:newOpener = copy(self)

    let l:newOpener._keepopen = nerdtree#has_opt(a:opts, 'keepopen')
    let l:newOpener._nerdtree = b:NERDTree
    let l:newOpener._path = a:path
    let l:newOpener._reuse = has_key(a:opts, 'reuse') ? a:opts['reuse'] : ''
    let l:newOpener._stay = nerdtree#has_opt(a:opts, 'stay')
    let l:newOpener._where = has_key(a:opts, 'where') ? a:opts['where'] : ''

    call l:newOpener._saveCursorPos()

    return l:newOpener
endfunction</t>
<t tx="ekr.20181231110604.131">function! s:Opener._newSplit()
    " Save the user's settings for splitbelow and splitright
    let savesplitbelow=&amp;splitbelow
    let savesplitright=&amp;splitright

    " 'there' will be set to a command to move from the split window
    " back to the explorer window
    "
    " 'back' will be set to a command to move from the explorer window
    " back to the newly split window
    "
    " 'right' and 'below' will be set to the settings needed for
    " splitbelow and splitright IF the explorer is the only window.
    "
    let there= g:NERDTreeWinPos ==# "left" ? "wincmd h" : "wincmd l"
    let back = g:NERDTreeWinPos ==# "left" ? "wincmd l" : "wincmd h"
    let right= g:NERDTreeWinPos ==# "left"
    let below=0

    " Attempt to go to adjacent window
    call nerdtree#exec(back)

    let onlyOneWin = (winnr("$") ==# 1)

    " If no adjacent window, set splitright and splitbelow appropriately
    if onlyOneWin
        let &amp;splitright=right
        let &amp;splitbelow=below
    else
        " found adjacent window - invert split direction
        let &amp;splitright=!right
        let &amp;splitbelow=!below
    endif

    let splitMode = onlyOneWin ? "vertical" : ""

    " Open the new window
    try
        exec(splitMode." sp ")
    catch /^Vim\%((\a\+)\)\=:E37/
        call g:NERDTree.CursorToTreeWin()
        throw "NERDTree.FileAlreadyOpenAndModifiedError: ". self._path.str() ." is already open and modified."
    catch /^Vim\%((\a\+)\)\=:/
        "do nothing
    endtry

    "resize the tree window if no other window was open before
    if onlyOneWin
        let size = exists("b:NERDTreeOldWindowSize") ? b:NERDTreeOldWindowSize : g:NERDTreeWinSize
        call nerdtree#exec(there)
        exec("silent ". splitMode ." resize ". size)
        call nerdtree#exec('wincmd p')
    endif

    " Restore splitmode settings
    let &amp;splitbelow=savesplitbelow
    let &amp;splitright=savesplitright
endfunction</t>
<t tx="ekr.20181231110604.132">function! s:Opener._newVSplit()
    let l:winwidth = winwidth('.')

    if winnr('$') == 1
        let l:winwidth = g:NERDTreeWinSize
    endif

    call nerdtree#exec('wincmd p')
    vnew

    let l:currentWindowNumber = winnr()

    " Restore the NERDTree to its original width.
    call g:NERDTree.CursorToTreeWin()
    execute 'silent vertical resize ' . l:winwidth

    call nerdtree#exec(l:currentWindowNumber . 'wincmd w')
endfunction</t>
<t tx="ekr.20181231110604.133">function! s:Opener.open(target)
    if self._path.isDirectory
        call self._openDirectory(a:target)
        return
    endif

    call self._openFile()
endfunction</t>
<t tx="ekr.20181231110604.134">function! s:Opener._openFile()
    if !self._stay &amp;&amp; !g:NERDTreeQuitOnOpen &amp;&amp; exists("b:NERDTreeZoomed") &amp;&amp; b:NERDTreeZoomed
        call b:NERDTree.ui.toggleZoom()
    endif

    if self._reuseWindow()
        return
    endif

    call self._gotoTargetWin()

    if self._stay
        silent call self._path.edit()
        call self._restoreCursorPos()
        return
    endif

    call self._path.edit()
endfunction</t>
<t tx="ekr.20181231110604.135">function! s:Opener._openDirectory(node)
    call self._gotoTargetWin()

    if self._nerdtree.isWinTree()
        call g:NERDTreeCreator.CreateWindowTree(a:node.path.str())
    else
        if empty(self._where)
            call b:NERDTree.changeRoot(a:node)
        elseif self._where == 't'
            call g:NERDTreeCreator.CreateTabTree(a:node.path.str())
        else
            call g:NERDTreeCreator.CreateWindowTree(a:node.path.str())
        endif
    endif

    if self._stay
        call self._restoreCursorPos()
    endif
endfunction</t>
<t tx="ekr.20181231110604.136">function! s:Opener._previousWindow()
    if !self._isWindowUsable(winnr("#")) &amp;&amp; self._firstUsableWindow() ==# -1
        call self._newSplit()
    else
        try
            if !self._isWindowUsable(winnr("#"))
                call nerdtree#exec(self._firstUsableWindow() . "wincmd w")
            else
                call nerdtree#exec('wincmd p')
            endif
        catch /^Vim\%((\a\+)\)\=:E37/
            call g:NERDTree.CursorToTreeWin()
            throw "NERDTree.FileAlreadyOpenAndModifiedError: ". self._path.str() ." is already open and modified."
        catch /^Vim\%((\a\+)\)\=:/
            echo v:exception
        endtry
    endif
endfunction</t>
<t tx="ekr.20181231110604.137">function! s:Opener._restoreCursorPos()
    call nerdtree#exec(self._tabnr . 'tabnext')
    call nerdtree#exec(bufwinnr(self._bufnr) . 'wincmd w')
endfunction</t>
<t tx="ekr.20181231110604.138">" put the cursor in the first window we find for this file
"
" return 1 if we were successful
function! s:Opener._reuseWindow()
    if empty(self._reuse)
        return 0
    endif

    "check the current tab for the window
    let winnr = bufwinnr('^' . self._path.str() . '$')
    if winnr != -1
        call nerdtree#exec(winnr . "wincmd w")
        call self._checkToCloseTree(0)
        return 1
    endif

    if self._reuse == 'currenttab'
        return 0
    endif

    "check other tabs
    let tabnr = self._path.tabnr()
    if tabnr
        call self._checkToCloseTree(1)
        call nerdtree#exec(tabnr . 'tabnext')
        let winnr = bufwinnr('^' . self._path.str() . '$')
        call nerdtree#exec(winnr . "wincmd w")
        return 1
    endif

    return 0
endfunction</t>
<t tx="ekr.20181231110604.139">function! s:Opener._saveCursorPos()
    let self._bufnr = bufnr("")
    let self._tabnr = tabpagenr()
endfunction</t>
<t tx="ekr.20181231110604.14">" Class method to read all bookmarks from the bookmarks file initialize
" bookmark objects for each one.
"
" Args:
" silent - dont echo an error msg if invalid bookmarks are found
function! s:Bookmark.CacheBookmarks(silent)
    if filereadable(g:NERDTreeBookmarksFile)
        let g:NERDTreeBookmarks = []
        let g:NERDTreeInvalidBookmarks = []
        let bookmarkStrings = readfile(g:NERDTreeBookmarksFile)
        let invalidBookmarksFound = 0
        for i in bookmarkStrings

            "ignore blank lines
            if i != ''

                let name = substitute(i, '^\(.\{-}\) .*$', '\1', '')
                let path = substitute(i, '^.\{-} \(.*\)$', '\1', '')
                let path = fnamemodify(path, ':p')

                try
                    let bookmark = s:Bookmark.New(name, g:NERDTreePath.New(path))
                    call add(g:NERDTreeBookmarks, bookmark)
                catch /^NERDTree.InvalidArgumentsError/
                    call add(g:NERDTreeInvalidBookmarks, i)
                    let invalidBookmarksFound += 1
                endtry
            endif
        endfor
        if invalidBookmarksFound
            call s:Bookmark.Write()
            if !a:silent
                call nerdtree#echo(invalidBookmarksFound . " invalid bookmarks were read. See :help NERDTreeInvalidBookmarks for info.")
            endif
        endif
    endif
endfunction</t>
<t tx="ekr.20181231110604.140">" ============================================================================
" CLASS: Path
"
" The Path class provides an abstracted representation of a file system
" pathname.  Various operations on pathnames are provided and a number of
" representations of a given path name can be accessed here.
" ============================================================================

let s:Path = {}
let g:NERDTreePath = s:Path

@others

" vim: set sw=4 sts=4 et fdm=marker:
</t>
<t tx="ekr.20181231110604.141">function! s:Path.AbsolutePathFor(pathStr)
    let l:prependWorkingDir = 0

    if nerdtree#runningWindows()
        let l:prependWorkingDir = a:pathStr !~# '^.:\(\\\|\/\)' &amp;&amp; a:pathStr !~# '^\(\\\\\|\/\/\)'
    else
        let l:prependWorkingDir = a:pathStr !~# '^/'
    endif

    let l:result = a:pathStr

    if l:prependWorkingDir
        let l:result = getcwd() . s:Path.Slash() . a:pathStr
    endif

    return l:result
endfunction</t>
<t tx="ekr.20181231110604.142">function! s:Path.bookmarkNames()
    if !exists("self._bookmarkNames")
        call self.cacheDisplayString()
    endif
    return self._bookmarkNames
endfunction</t>
<t tx="ekr.20181231110604.143">function! s:Path.cacheDisplayString() abort
    let self.cachedDisplayString = g:NERDTreeNodeDelimiter . self.getLastPathComponent(1)

    if self.isExecutable
        let self.cachedDisplayString = self.addDelimiter(self.cachedDisplayString) . '*'
    endif

    let self._bookmarkNames = []
    for i in g:NERDTreeBookmark.Bookmarks()
        if i.path.equals(self)
            call add(self._bookmarkNames, i.name)
        endif
    endfor
    if !empty(self._bookmarkNames) &amp;&amp; g:NERDTreeMarkBookmarks == 1
        let self.cachedDisplayString = self.addDelimiter(self.cachedDisplayString) . ' {' . join(self._bookmarkNames) . '}'
    endif

    if self.isSymLink
        let self.cachedDisplayString = self.addDelimiter(self.cachedDisplayString) . ' -&gt; ' . self.symLinkDest
    endif

    if self.isReadOnly
        let self.cachedDisplayString = self.addDelimiter(self.cachedDisplayString) . ' ['.g:NERDTreeGlyphReadOnly.']'
    endif
endfunction</t>
<t tx="ekr.20181231110604.144">function! s:Path.addDelimiter(line)
    if a:line =~# '\(.*' . g:NERDTreeNodeDelimiter . '\)\{2}'
        return a:line
    else
        return a:line . g:NERDTreeNodeDelimiter
    endif
endfunction</t>
<t tx="ekr.20181231110604.145">function! s:Path.changeToDir()
    let dir = self.str({'format': 'Cd'})
    if self.isDirectory ==# 0
        let dir = self.getParent().str({'format': 'Cd'})
    endif

    try
        execute "cd " . dir
        call nerdtree#echo("CWD is now: " . getcwd())
    catch
        throw "NERDTree.PathChangeError: cannot change CWD to " . dir
    endtry
endfunction</t>
<t tx="ekr.20181231110604.146">"
" Compares this Path to the given path and returns 0 if they are equal, -1 if
" this Path is "less than" the given path, or 1 if it is "greater".
"
" Args:
" path: the path object to compare this to
"
" Return:
" 1, -1 or 0
function! s:Path.compareTo(path)
    let thisPath = self.getLastPathComponent(1)
    let thatPath = a:path.getLastPathComponent(1)

    "if the paths are the same then clearly we return 0
    if thisPath ==# thatPath
        return 0
    endif

    let thisSS = self.getSortOrderIndex()
    let thatSS = a:path.getSortOrderIndex()

    "compare the sort sequences, if they are different then the return
    "value is easy
    if thisSS &lt; thatSS
        return -1
    elseif thisSS &gt; thatSS
        return 1
    else
        if !g:NERDTreeSortHiddenFirst
            let thisPath = substitute(thisPath, '^[._]', '', '')
            let thatPath = substitute(thatPath, '^[._]', '', '')
        endif
        "if the sort sequences are the same then compare the paths
        "alphabetically
        let pathCompare = g:NERDTreeCaseSensitiveSort ? thisPath &lt;# thatPath : thisPath &lt;? thatPath
        if pathCompare
            return -1
        else
            return 1
        endif
    endif
endfunction</t>
<t tx="ekr.20181231110604.147">"
" Factory method.
"
" Creates a path object with the given path. The path is also created on the
" filesystem. If the path already exists, a NERDTree.Path.Exists exception is
" thrown. If any other errors occur, a NERDTree.Path exception is thrown.
"
" Args:
" fullpath: the full filesystem path to the file/dir to create
function! s:Path.Create(fullpath)
    "bail if the a:fullpath already exists
    if isdirectory(a:fullpath) || filereadable(a:fullpath)
        throw "NERDTree.CreatePathError: Directory Exists: '" . a:fullpath . "'"
    endif

    try

        "if it ends with a slash, assume its a dir create it
        if a:fullpath =~# '\(\\\|\/\)$'
            "whack the trailing slash off the end if it exists
            let fullpath = substitute(a:fullpath, '\(\\\|\/\)$', '', '')

            call mkdir(fullpath, 'p')

        "assume its a file and create
        else
            call s:Path.createParentDirectories(a:fullpath)
            call writefile([], a:fullpath)
        endif
    catch
        throw "NERDTree.CreatePathError: Could not create path: '" . a:fullpath . "'"
    endtry

    return s:Path.New(a:fullpath)
endfunction</t>
<t tx="ekr.20181231110604.148">"
" Copies the file/dir represented by this Path to the given location
"
" Args:
" dest: the location to copy this dir/file to
function! s:Path.copy(dest)
    if !s:Path.CopyingSupported()
        throw "NERDTree.CopyingNotSupportedError: Copying is not supported on this OS"
    endif

    call s:Path.createParentDirectories(a:dest)

    if exists('g:NERDTreeCopyCmd')
        let cmd_prefix = g:NERDTreeCopyCmd
    else
        let cmd_prefix = (self.isDirectory ? g:NERDTreeCopyDirCmd : g:NERDTreeCopyFileCmd)
    endif

    let cmd = cmd_prefix . " " . escape(self.str(), self._escChars()) . " " . escape(a:dest, self._escChars())
    let success = system(cmd)
    if v:shell_error != 0
        throw "NERDTree.CopyError: Could not copy ''". self.str() ."'' to: '" . a:dest . "'"
    endif
endfunction</t>
<t tx="ekr.20181231110604.149">"
" returns 1 if copying is supported for this OS
function! s:Path.CopyingSupported()
    return exists('g:NERDTreeCopyCmd') || (exists('g:NERDTreeCopyDirCmd') &amp;&amp; exists('g:NERDTreeCopyFileCmd'))
endfunction

" FUNCTION: Path.copyingWillOverwrite(dest) {{{1
"
" returns 1 if copy this path to the given location will cause files to
" overwritten
"
" Args:
" dest: the location this path will be copied to
function! s:Path.copyingWillOverwrite(dest)
    if filereadable(a:dest)
        return 1
    endif

    if isdirectory(a:dest)
        let path = s:Path.JoinPathStrings(a:dest, self.getLastPathComponent(0))
        if filereadable(path)
            return 1
        endif
    endif
endfunction</t>
<t tx="ekr.20181231110604.15">" Class method that indicates the relative position of two bookmarks when
" placed in alphabetical order by name. Case-sensitivity is determined by an
" option. Supports the "s:Bookmark.SortBookmarksList()" method.
function! s:Bookmark.CompareBookmarksByName(firstBookmark, secondBookmark)
    let l:result = 0
    if g:NERDTreeBookmarksSort == 1
        if a:firstBookmark.name &lt;? a:secondBookmark.name
            let l:result = -1
        elseif a:firstBookmark.name &gt;? a:secondBookmark.name
            let l:result = 1
        endif
    elseif g:NERDTreeBookmarksSort == 2
        if a:firstBookmark.name &lt;# a:secondBookmark.name
            let l:result = -1
        elseif a:firstBookmark.name &gt;# a:secondBookmark.name
            let l:result = 1
        endif
    endif
    return l:result
endfunction</t>
<t tx="ekr.20181231110604.150">"
" create parent directories for this path if needed
" without throwing any errors if those directories already exist
"
" Args:
" path: full path of the node whose parent directories may need to be created
function! s:Path.createParentDirectories(path)
    let dir_path = fnamemodify(a:path, ':h')
    if !isdirectory(dir_path)
        call mkdir(dir_path, 'p')
    endif
endfunction</t>
<t tx="ekr.20181231110604.151">"
" Deletes the file or directory represented by this path.
"
" Throws NERDTree.Path.Deletion exceptions
function! s:Path.delete()
    if self.isDirectory

        let cmd = g:NERDTreeRemoveDirCmd . self.str({'escape': 1})
        let success = system(cmd)

        if v:shell_error != 0
            throw "NERDTree.PathDeletionError: Could not delete directory: '" . self.str() . "'"
        endif
    else
        if exists('g:NERDTreeRemoveFileCmd')
            let cmd = g:NERDTreeRemoveFileCmd . self.str({'escape': 1})
            let success = system(cmd)
        else
            let success = delete(self.str())
        endif

        if success != 0
            throw "NERDTree.PathDeletionError: Could not delete file: '" . self.str() . "'"
        endif
    endif

    "delete all bookmarks for this path
    for i in self.bookmarkNames()
        let bookmark = g:NERDTreeBookmark.BookmarkFor(i)
        call bookmark.delete()
    endfor
endfunction</t>
<t tx="ekr.20181231110604.152">"
" Returns a string that specifies how the path should be represented as a
" string
function! s:Path.displayString()
    if self.cachedDisplayString ==# ""
        call self.cacheDisplayString()
    endif

    return self.cachedDisplayString
endfunction</t>
<t tx="ekr.20181231110604.153">function! s:Path.edit()
    exec "edit " . self.str({'format': 'Edit'})
endfunction

" FUNCTION: Path.extractDriveLetter(fullpath) {{{1
"
" If running windows, cache the drive letter for this path
function! s:Path.extractDriveLetter(fullpath)
    if nerdtree#runningWindows()
        if a:fullpath =~ '^\(\\\\\|\/\/\)'
            "For network shares, the 'drive' consists of the first two parts of the path, i.e. \\boxname\share
            let self.drive = substitute(a:fullpath, '^\(\(\\\\\|\/\/\)[^\\\/]*\(\\\|\/\)[^\\\/]*\).*', '\1', '')
            let self.drive = substitute(self.drive, '/', '\', "g")
        else
            let self.drive = substitute(a:fullpath, '\(^[a-zA-Z]:\).*', '\1', '')
        endif
    else
        let self.drive = ''
    endif

endfunction</t>
<t tx="ekr.20181231110604.154">" return 1 if this path points to a location that is readable or is a directory
function! s:Path.exists()
    let p = self.str()
    return filereadable(p) || isdirectory(p)
endfunction</t>
<t tx="ekr.20181231110604.155">function! s:Path._escChars()
    if nerdtree#runningWindows()
        return " `\|\"#%&amp;,?()\*^&lt;&gt;$"
    endif

    return " \\`\|\"#%&amp;,?()\*^&lt;&gt;[]$"
endfunction</t>
<t tx="ekr.20181231110604.156">"
" Returns this path if it is a directory, else this paths parent.
"
" Return:
" a Path object
function! s:Path.getDir()
    if self.isDirectory
        return self
    else
        return self.getParent()
    endif
endfunction</t>
<t tx="ekr.20181231110604.157">"
" Returns a new path object for this paths parent
"
" Return:
" a new Path object
function! s:Path.getParent()
    if nerdtree#runningWindows()
        let path = self.drive . '\' . join(self.pathSegments[0:-2], '\')
    else
        let path = '/'. join(self.pathSegments[0:-2], '/')
    endif

    return s:Path.New(path)
endfunction</t>
<t tx="ekr.20181231110604.158">"
" Gets the last part of this path.
"
" Args:
" dirSlash: if 1 then a trailing slash will be added to the returned value for
" directory nodes.
function! s:Path.getLastPathComponent(dirSlash)
    if empty(self.pathSegments)
        return ''
    endif
    let toReturn = self.pathSegments[-1]
    if a:dirSlash &amp;&amp; self.isDirectory
        let toReturn = toReturn . '/'
    endif
    return toReturn
endfunction</t>
<t tx="ekr.20181231110604.159">" returns the index of the pattern in g:NERDTreeSortOrder that this path matches
function! s:Path.getSortOrderIndex()
    let i = 0
    while i &lt; len(g:NERDTreeSortOrder)
        if  self.getLastPathComponent(1) =~# g:NERDTreeSortOrder[i]
            return i
        endif
        let i = i + 1
    endwhile

    return index(g:NERDTreeSortOrder, '*')
endfunction</t>
<t tx="ekr.20181231110604.16">" Delete this bookmark. If the node for this bookmark is under the current
" root, then recache bookmarks for its Path object
function! s:Bookmark.delete()
    call remove(s:Bookmark.Bookmarks(), index(s:Bookmark.Bookmarks(), self))
    call s:Bookmark.Write()
endfunction</t>
<t tx="ekr.20181231110604.160">" returns a list of path chunks
function! s:Path._splitChunks(path)
    let chunks = split(a:path, '\(\D\+\|\d\+\)\zs')
    let i = 0
    while i &lt; len(chunks)
        "convert number literals to numbers
        if match(chunks[i], '^\d\+$') == 0
            let chunks[i] = str2nr(chunks[i])
        endif
        let i = i + 1
    endwhile
    return chunks
endfunction</t>
<t tx="ekr.20181231110604.161">" returns a key used in compare function for sorting
function! s:Path.getSortKey()
    let l:ascending = index(g:NERDTreeSortOrder,'[[timestamp]]')
    let l:descending = index(g:NERDTreeSortOrder,'[[-timestamp]]')
    if !exists("self._sortKey") || g:NERDTreeSortOrder !=# g:NERDTreeOldSortOrder || l:ascending &gt;= 0 || l:descending &gt;= 0
        let self._sortKey = [self.getSortOrderIndex()]

        if l:descending &gt;= 0
            call insert(self._sortKey, -getftime(self.str()), l:descending == 0 ? 0 : len(self._sortKey))
        elseif l:ascending &gt;= 0
            call insert(self._sortKey, getftime(self.str()), l:ascending == 0 ? 0 : len(self._sortKey))
        endif

        let path = self.getLastPathComponent(1)
        if !g:NERDTreeSortHiddenFirst
            let path = substitute(path, '^[._]', '', '')
        endif
        if !g:NERDTreeCaseSensitiveSort
            let path = tolower(path)
        endif

        call extend(self._sortKey, (g:NERDTreeNaturalSort ? self._splitChunks(path) : [path]))
    endif
    return self._sortKey
endfunction</t>
<t tx="ekr.20181231110604.162">function! s:Path.isHiddenUnder(path)

    if !self.isUnder(a:path)
        return 0
    endif

    let l:startIndex = len(a:path.pathSegments)
    let l:segments = self.pathSegments[l:startIndex : ]

    for l:segment in l:segments

        if l:segment =~# '^\.'
            return 1
        endif
    endfor

    return 0
endfunction</t>
<t tx="ekr.20181231110604.163">" check for unix hidden files
function! s:Path.isUnixHiddenFile()
    return self.getLastPathComponent(0) =~# '^\.'
endfunction</t>
<t tx="ekr.20181231110604.164">" check for unix path with hidden components
function! s:Path.isUnixHiddenPath()
    if self.getLastPathComponent(0) =~# '^\.'
        return 1
    else
        for segment in self.pathSegments
            if segment =~# '^\.'
                return 1
            endif
        endfor
        return 0
    endif
endfunction</t>
<t tx="ekr.20181231110604.165">" returns true if this path should be ignored
function! s:Path.ignore(nerdtree)
    "filter out the user specified paths to ignore
    if a:nerdtree.ui.isIgnoreFilterEnabled()
        for i in g:NERDTreeIgnore
            if self._ignorePatternMatches(i)
                return 1
            endif
        endfor

        for callback in g:NERDTree.PathFilters()
            if {callback}({'path': self, 'nerdtree': a:nerdtree})
                return 1
            endif
        endfor
    endif

    "dont show hidden files unless instructed to
    if !a:nerdtree.ui.getShowHidden() &amp;&amp; self.isUnixHiddenFile()
        return 1
    endif

    if a:nerdtree.ui.getShowFiles() ==# 0 &amp;&amp; self.isDirectory ==# 0
        return 1
    endif

    return 0
endfunction</t>
<t tx="ekr.20181231110604.166">" returns true if this path matches the given ignore pattern
function! s:Path._ignorePatternMatches(pattern)
    let pat = a:pattern
    if strpart(pat,len(pat)-7) == '[[dir]]'
        if !self.isDirectory
            return 0
        endif
        let pat = strpart(pat,0, len(pat)-7)
    elseif strpart(pat,len(pat)-8) == '[[file]]'
        if self.isDirectory
            return 0
        endif
        let pat = strpart(pat,0, len(pat)-8)
    endif

    return self.getLastPathComponent(0) =~# pat
endfunction</t>
<t tx="ekr.20181231110604.167">" return 1 if this path is somewhere above the given path in the filesystem.
"
" a:path should be a dir
function! s:Path.isAncestor(path)
    if !self.isDirectory
        return 0
    endif

    let this = self.str()
    let that = a:path.str()
    return stridx(that, this) == 0
endfunction</t>
<t tx="ekr.20181231110604.168">" return 1 if this path is somewhere under the given path in the filesystem.
function! s:Path.isUnder(path)
    if a:path.isDirectory == 0
        return 0
    endif

    let this = self.str()
    let that = a:path.str()
    return stridx(this, that . s:Path.Slash()) == 0
endfunction</t>
<t tx="ekr.20181231110604.169">function! s:Path.JoinPathStrings(...)
    let components = []
    for i in a:000
        let components = extend(components, split(i, '/'))
    endfor
    return '/' . join(components, '/')
endfunction</t>
<t tx="ekr.20181231110604.17">" Returns the tree node object associated with this Bookmark.
" Throws "NERDTree.BookmarkedNodeNotFoundError" if the node is not found.
"
" Args:
" searchFromAbsoluteRoot: boolean flag, search from the highest cached node
"   if true and from the current tree root if false
function! s:Bookmark.getNode(nerdtree, searchFromAbsoluteRoot)
    if a:searchFromAbsoluteRoot
        let l:searchRoot = a:nerdtree.root.AbsoluteTreeRoot()
    else
        let l:searchRoot = a:nerdtree.root
    endif
    let l:targetNode = l:searchRoot.findNode(self.path)
    if empty(l:targetNode)
        throw 'NERDTree.BookmarkedNodeNotFoundError: node for bookmark "' . self.name . '" not found'
    endif
    return l:targetNode
endfunction</t>
<t tx="ekr.20181231110604.170">"
" Determines whether 2 path objects are "equal".
" They are equal if the paths they represent are the same
"
" Args:
" path: the other path obj to compare this with
function! s:Path.equals(path)
    return self.str() ==# a:path.str()
endfunction

" FUNCTION: Path.New(pathStr) {{{1
function! s:Path.New(pathStr)
    let l:newPath = copy(self)

    call l:newPath.readInfoFromDisk(s:Path.AbsolutePathFor(a:pathStr))

    let l:newPath.cachedDisplayString = ''
    let l:newPath.flagSet = g:NERDTreeFlagSet.New()

    return l:newPath
endfunction</t>
<t tx="ekr.20181231110604.171">" Return the path separator used by the underlying file system.  Special
" consideration is taken for the use of the 'shellslash' option on Windows
" systems.
function! s:Path.Slash()

    if nerdtree#runningWindows()
        if exists('+shellslash') &amp;&amp; &amp;shellslash
            return '/'
        endif

        return '\'
    endif

    return '/'
endfunction</t>
<t tx="ekr.20181231110604.172">" Invoke the vim resolve() function and return the result
" This is necessary because in some versions of vim resolve() removes trailing
" slashes while in other versions it doesn't.  This always removes the trailing
" slash
function! s:Path.Resolve(path)
    let tmp = resolve(a:path)
    return tmp =~# '.\+/$' ? substitute(tmp, '/$', '', '') : tmp
endfunction

" FUNCTION: Path.readInfoFromDisk(fullpath) {{{1
"
"
" Throws NERDTree.Path.InvalidArguments exception.
function! s:Path.readInfoFromDisk(fullpath)
    call self.extractDriveLetter(a:fullpath)

    let fullpath = s:Path.WinToUnixPath(a:fullpath)

    if getftype(fullpath) ==# "fifo"
        throw "NERDTree.InvalidFiletypeError: Cant handle FIFO files: " . a:fullpath
    endif

    let self.pathSegments = filter(split(fullpath, '/'), '!empty(v:val)')

    let self.isReadOnly = 0
    if isdirectory(a:fullpath)
        let self.isDirectory = 1
    elseif filereadable(a:fullpath)
        let self.isDirectory = 0
        let self.isReadOnly = filewritable(a:fullpath) ==# 0
    else
        throw "NERDTree.InvalidArgumentsError: Invalid path = " . a:fullpath
    endif

    let self.isExecutable = 0
    if !self.isDirectory
        let self.isExecutable = getfperm(a:fullpath) =~# 'x'
    endif

    "grab the last part of the path (minus the trailing slash)
    let lastPathComponent = self.getLastPathComponent(0)

    "get the path to the new node with the parent dir fully resolved
    let hardPath = s:Path.Resolve(self.strTrunk()) . '/' . lastPathComponent

    "if  the last part of the path is a symlink then flag it as such
    let self.isSymLink = (s:Path.Resolve(hardPath) != hardPath)
    if self.isSymLink
        let self.symLinkDest = s:Path.Resolve(fullpath)

        "if the link is a dir then slap a / on the end of its dest
        if isdirectory(self.symLinkDest)

            "we always wanna treat MS windows shortcuts as files for
            "simplicity
            if hardPath !~# '\.lnk$'

                let self.symLinkDest = self.symLinkDest . '/'
            endif
        endif
    endif
endfunction</t>
<t tx="ekr.20181231110604.173">function! s:Path.refresh(nerdtree)
    call self.readInfoFromDisk(self.str())
    call g:NERDTreePathNotifier.NotifyListeners('refresh', self, a:nerdtree, {})
    call self.cacheDisplayString()
endfunction</t>
<t tx="ekr.20181231110604.174">function! s:Path.refreshFlags(nerdtree)
    call g:NERDTreePathNotifier.NotifyListeners('refreshFlags', self, a:nerdtree, {})
    call self.cacheDisplayString()
endfunction</t>
<t tx="ekr.20181231110604.175">"
" Renames this node on the filesystem
function! s:Path.rename(newPath)
    if a:newPath ==# ''
        throw "NERDTree.InvalidArgumentsError: Invalid newPath for renaming = ". a:newPath
    endif

    call s:Path.createParentDirectories(a:newPath)

    let success =  rename(self.str(), a:newPath)
    if success != 0
        throw "NERDTree.PathRenameError: Could not rename: '" . self.str() . "'" . 'to:' . a:newPath
    endif
    call self.readInfoFromDisk(a:newPath)

    for i in self.bookmarkNames()
        let b = g:NERDTreeBookmark.BookmarkFor(i)
        call b.setPath(copy(self))
    endfor
    call g:NERDTreeBookmark.Write()
endfunction</t>
<t tx="ekr.20181231110604.176">" Return a string representation of this Path object.
"
" Args:
" This function takes a single dictionary (optional) with keys and values that
" specify how the returned pathname should be formatted.
"
" The dictionary may have the following keys:
"  'format'
"  'escape'
"  'truncateTo'
"
" The 'format' key may have a value of:
"  'Cd' - a string to be used with ":cd" and similar commands
"  'Edit' - a string to be used with ":edit" and similar commands
"  'UI' - a string to be displayed in the NERDTree user interface
"
" The 'escape' key, if specified, will cause the output to be escaped with
" Vim's internal "shellescape()" function.
"
" The 'truncateTo' key shortens the length of the path to that given by the
" value associated with 'truncateTo'. A '&lt;' is prepended.
function! s:Path.str(...)
    let options = a:0 ? a:1 : {}
    let toReturn = ""

    if has_key(options, 'format')
        let format = options['format']
        if has_key(self, '_strFor' . format)
            exec 'let toReturn = self._strFor' . format . '()'
        else
            throw 'NERDTree.UnknownFormatError: unknown format "'. format .'"'
        endif
    else
        let toReturn = self._str()
    endif

    if nerdtree#has_opt(options, 'escape')
        let toReturn = shellescape(toReturn)
    endif

    if has_key(options, 'truncateTo')
        let limit = options['truncateTo']
        if strdisplaywidth(toReturn) &gt; limit-1
            while strdisplaywidth(toReturn) &gt; limit-1 &amp;&amp; strchars(toReturn) &gt; 0
                let toReturn = substitute(toReturn, '^.', '', '')
            endwhile
            if len(split(toReturn, '/')) &gt; 1
                let toReturn = '&lt;/' . join(split(toReturn, '/')[1:], '/') . '/'
            else
                let toReturn = '&lt;' . toReturn
            endif
        endif
    endif

    return toReturn
endfunction</t>
<t tx="ekr.20181231110604.177">function! s:Path._strForUI()
    let toReturn = '/' . join(self.pathSegments, '/')
    if self.isDirectory &amp;&amp; toReturn != '/'
        let toReturn  = toReturn . '/'
    endif
    return toReturn
endfunction</t>
<t tx="ekr.20181231110604.178">" Return a string representation of this Path that is suitable for use as an
" argument to Vim's internal ":cd" command.
function! s:Path._strForCd()
    return fnameescape(self.str())
endfunction</t>
<t tx="ekr.20181231110604.179">" Return a string representation of this Path that is suitable for use as an
" argument to Vim's internal ":edit" command.
function! s:Path._strForEdit()

    " Make the path relative to the current working directory, if possible.
    let l:result = fnamemodify(self.str(), ':.')

    " On Windows, the drive letter may be removed by "fnamemodify()".  Add it
    " back, if necessary.
    if nerdtree#runningWindows() &amp;&amp; l:result[0] == s:Path.Slash()
        let l:result = self.drive . l:result
    endif

    let l:result = fnameescape(l:result)

    if empty(l:result)
        let l:result = '.'
    endif

    return l:result
endfunction</t>
<t tx="ekr.20181231110604.18">" Class method to delete all bookmarks.
function! s:Bookmark.ClearAll()
    for i in s:Bookmark.Bookmarks()
        call i.delete()
    endfor
    call s:Bookmark.Write()
endfunction

" FUNCTION: Bookmark.GetNodeForName(name, searchFromAbsoluteRoot, nerdtree) {{{1
" Class method that returns the tree node object for the Bookmark with the
" given name. Throws "NERDTree.BookmarkNotFoundError" if a Bookmark with the
" name does not exist. Throws "NERDTree.BookmarkedNodeNotFoundError" if a
" tree node for the named Bookmark could not be found.
function! s:Bookmark.GetNodeForName(name, searchFromAbsoluteRoot, nerdtree)
    let l:bookmark = s:Bookmark.BookmarkFor(a:name)
    return l:bookmark.getNode(a:nerdtree, a:searchFromAbsoluteRoot)
endfunction</t>
<t tx="ekr.20181231110604.180">function! s:Path._strForGlob()
    let lead = s:Path.Slash()

    "if we are running windows then slap a drive letter on the front
    if nerdtree#runningWindows()
        let lead = self.drive . '\'
    endif

    let toReturn = lead . join(self.pathSegments, s:Path.Slash())

    if !nerdtree#runningWindows()
        let toReturn = escape(toReturn, self._escChars())
    endif
    return toReturn
endfunction</t>
<t tx="ekr.20181231110604.181">" Return the absolute pathname associated with this Path object.  The pathname
" returned is appropriate for the underlying file system.
function! s:Path._str()
    let l:separator = s:Path.Slash()
    let l:leader = l:separator

    if nerdtree#runningWindows()
        let l:leader = self.drive . l:separator
    endif

    return l:leader . join(self.pathSegments, l:separator)
endfunction</t>
<t tx="ekr.20181231110604.182">" Gets the path without the last segment on the end.
function! s:Path.strTrunk()
    return self.drive . '/' . join(self.pathSegments[0:-2], '/')
endfunction

" FUNCTION: Path.tabnr() {{{1
" return the number of the first tab that is displaying this file
"
" return 0 if no tab was found
function! s:Path.tabnr()
    let str = self.str()
    for t in range(tabpagenr('$'))
        for b in tabpagebuflist(t+1)
            if str ==# expand('#' . b . ':p')
                return t+1
            endif
        endfor
    endfor
    return 0
endfunction</t>
<t tx="ekr.20181231110604.183">" FUNCTION: Path.WinToUnixPath(pathstr){{{1
" Takes in a windows path and returns the unix equiv
"
" A class level method
"
" Args:
" pathstr: the windows path to convert
function! s:Path.WinToUnixPath(pathstr)
    if !nerdtree#runningWindows()
        return a:pathstr
    endif

    let toReturn = a:pathstr

    "remove the x:\ of the front
    let toReturn = substitute(toReturn, '^.*:\(\\\|/\)\?', '/', "")

    "remove the \\ network share from the front
    let toReturn = substitute(toReturn, '^\(\\\\\|\/\/\)[^\\\/]*\(\\\|\/\)[^\\\/]*\(\\\|\/\)\?', '/', "")

    "convert all \ chars to /
    let toReturn = substitute(toReturn, '\', '/', "g")

    return toReturn
endfunction</t>
<t tx="ekr.20181231110604.184">" ============================================================================
" CLASS: TreeDirNode
"
" A subclass of NERDTreeFileNode.
"
" The 'composite' part of the file/dir composite.
" ============================================================================

let s:TreeDirNode = copy(g:NERDTreeFileNode)
let g:NERDTreeDirNode = s:TreeDirNode

@others

" vim: set sw=4 sts=4 et fdm=marker:
</t>
<t tx="ekr.20181231110604.185">" Class method that returns the highest cached ancestor of the current root.
function! s:TreeDirNode.AbsoluteTreeRoot()
    let currentNode = b:NERDTree.root
    while currentNode.parent != {}
        let currentNode = currentNode.parent
    endwhile
    return currentNode
endfunction</t>
<t tx="ekr.20181231110604.186">function! s:TreeDirNode.activate(...)
    let l:options = (a:0 &gt; 0) ? a:1 : {}

    call self.toggleOpen(l:options)

    " Note that we only re-render the NERDTree for this node if we did NOT
    " create a new node and render it in a new window or tab.  In the latter
    " case, rendering the NERDTree for this node could overwrite the text of
    " the new NERDTree!
    if !has_key(l:options, 'where') || empty(l:options['where'])
        call self.getNerdtree().render()
        call self.putCursorHere(0, 0)
    endif
endfunction</t>
<t tx="ekr.20181231110604.187">" Adds the given treenode to the list of children for this node
"
" Args:
" -treenode: the node to add
" -inOrder: 1 if the new node should be inserted in sorted order
function! s:TreeDirNode.addChild(treenode, inOrder)
    call add(self.children, a:treenode)
    let a:treenode.parent = self

    if a:inOrder
        call self.sortChildren()
    endif
endfunction</t>
<t tx="ekr.20181231110604.188">" Mark this TreeDirNode as closed.
function! s:TreeDirNode.close()

    " Close all directories in this directory node's cascade. This is
    " necessary to ensure consistency when cascades are rendered.
    for l:dirNode in self.getCascade()
        let l:dirNode.isOpen = 0
    endfor
endfunction</t>
<t tx="ekr.20181231110604.189">" Recursively close any directory nodes that are descendants of this node.
function! s:TreeDirNode.closeChildren()
    for l:child in self.children
        if l:child.path.isDirectory
            call l:child.close()
            call l:child.closeChildren()
        endif
    endfor
endfunction</t>
<t tx="ekr.20181231110604.19">" returns the Bookmark the cursor is over, or {}
function! s:Bookmark.GetSelected()
    let line = getline(".")
    let name = substitute(line, '^&gt;\(.\{-}\) .\+$', '\1', '')
    if name != line
        try
            return s:Bookmark.BookmarkFor(name)
        catch /^NERDTree.BookmarkNotFoundError/
            return {}
        endtry
    endif
    return {}
endfunction</t>
<t tx="ekr.20181231110604.190">" Instantiates a new child node for this node with the given path. The new
" nodes parent is set to this node.
"
" Args:
" path: a Path object that this node will represent/contain
" inOrder: 1 if the new node should be inserted in sorted order
"
" Returns:
" the newly created node
function! s:TreeDirNode.createChild(path, inOrder)
    let newTreeNode = g:NERDTreeFileNode.New(a:path, self.getNerdtree())
    call self.addChild(newTreeNode, a:inOrder)
    return newTreeNode
endfunction</t>
<t tx="ekr.20181231110604.191">" Assemble and return a string that can represent this TreeDirNode object in
" the NERDTree window.
function! s:TreeDirNode.displayString()
    let l:result = ''

    " Build a label that identifies this TreeDirNode.
    let l:label = ''
    let l:cascade = self.getCascade()
    for l:dirNode in l:cascade
        let l:next = l:dirNode.path.displayString()
        let l:label .= l:label == '' ? l:next : substitute(l:next,'^.','','')
    endfor

    " Select the appropriate open/closed status indicator symbol.
    if l:cascade[-1].isOpen
        let l:symbol = g:NERDTreeDirArrowCollapsible
    else
        let l:symbol = g:NERDTreeDirArrowExpandable
    endif

    let l:flags = l:cascade[-1].path.flagSet.renderToString()

    let l:result = l:symbol . ' ' . l:flags . l:label
    return l:result
endfunction</t>
<t tx="ekr.20181231110604.192">" Will find one of the children (recursively) that has the given path
"
" Args:
" path: a path object
unlet s:TreeDirNode.findNode
function! s:TreeDirNode.findNode(path)
    if a:path.equals(self.path)
        return self
    endif
    if stridx(a:path.str(), self.path.str(), 0) ==# -1
        return {}
    endif

    if self.path.isDirectory
        for i in self.children
            let retVal = i.findNode(a:path)
            if retVal != {}
                return retVal
            endif
        endfor
    endif
    return {}
endfunction</t>
<t tx="ekr.20181231110604.193">" Return an array of dir nodes (starting from self) that can be cascade opened.
function! s:TreeDirNode.getCascade()
    if !self.isCascadable()
        return [self]
    endif

    let vc = self.getVisibleChildren()
    let visChild = vc[0]

    return [self] + visChild.getCascade()
endfunction</t>
<t tx="ekr.20181231110604.194">" Return the first directory node in the cascade in which this directory node
" is rendered.
function! s:TreeDirNode.getCascadeRoot()

    " Don't search above the current NERDTree root node.
    if self.isRoot()
        return self
    endif

    let l:cascadeRoot = self
    let l:parent = self.parent

    while !empty(l:parent) &amp;&amp; !l:parent.isRoot()

        if index(l:parent.getCascade(), self) == -1
            break
        endif

        let l:cascadeRoot = l:parent
        let l:parent = l:parent.parent
    endwhile

    return l:cascadeRoot
endfunction</t>
<t tx="ekr.20181231110604.195">" Returns the number of children this node has
function! s:TreeDirNode.getChildCount()
    return len(self.children)
endfunction

" FUNCTION: TreeDirNode.getChild(path) {{{1
" Returns child node of this node that has the given path or {} if no such node
" exists.
"
" This function doesnt not recurse into child dir nodes
"
" Args:
" path: a path object
function! s:TreeDirNode.getChild(path)
    if stridx(a:path.str(), self.path.str(), 0) ==# -1
        return {}
    endif

    let index = self.getChildIndex(a:path)
    if index ==# -1
        return {}
    else
        return self.children[index]
    endif

endfunction</t>
<t tx="ekr.20181231110604.196">" returns the child at the given index
"
" Args:
" indx: the index to get the child from
" visible: 1 if only the visible children array should be used, 0 if all the
" children should be searched.
function! s:TreeDirNode.getChildByIndex(indx, visible)
    let array_to_search = a:visible? self.getVisibleChildren() : self.children
    if a:indx &gt; len(array_to_search)
        throw "NERDTree.InvalidArgumentsError: Index is out of bounds."
    endif
    return array_to_search[a:indx]
endfunction</t>
<t tx="ekr.20181231110604.197">" Returns the index of the child node of this node that has the given path or
" -1 if no such node exists.
"
" This function doesnt not recurse into child dir nodes
"
" Args:
" path: a path object
function! s:TreeDirNode.getChildIndex(path)
    if stridx(a:path.str(), self.path.str(), 0) ==# -1
        return -1
    endif

    "do a binary search for the child
    let a = 0
    let z = self.getChildCount()
    while a &lt; z
        let mid = (a+z)/2
        let diff = a:path.compareTo(self.children[mid].path)

        if diff ==# -1
            let z = mid
        elseif diff ==# 1
            let a = mid+1
        else
            return mid
        endif
    endwhile
    return -1
endfunction</t>
<t tx="ekr.20181231110604.198">" Return a list of all child nodes from "self.children" that are of type
" TreeDirNode. This function supports http://github.com/scrooloose/nerdtree-project-plugin.git.
function! s:TreeDirNode.getDirChildren()
    return filter(copy(self.children), 'v:val.path.isDirectory == 1')
endfunction

" FUNCTION: TreeDirNode._glob(pattern, all) {{{1
" Return a list of strings naming the descendants of the directory in this
" TreeDirNode object that match the specified glob pattern.
"
" Args:
" pattern: (string) the glob pattern to apply
" all: (0 or 1) if 1, include "." and ".." if they match "pattern"; if 0,
"      always exclude them
"
" Note: If the pathnames in the result list are below the working directory,
" they are returned as pathnames relative to that directory. This is because
" this function, internally, attempts to obey 'wildignore' rules that use
" relative paths.
function! s:TreeDirNode._glob(pattern, all)

    " Construct a path specification such that "globpath()" will return
    " relative pathnames, if possible.
    if self.path.str() == getcwd()
        let l:pathSpec = ','
    else
        let l:pathSpec = escape(fnamemodify(self.path.str({'format': 'Glob'}), ':.'), ',')

        " On Windows, the drive letter may be removed by "fnamemodify()".
        if nerdtree#runningWindows() &amp;&amp; l:pathSpec[0] == g:NERDTreePath.Slash()
            let l:pathSpec = self.path.drive . l:pathSpec
        endif
    endif

    let l:globList = []

    " See ":h version7.txt" and ":h version8.txt" for details on the
    " development of the "glob()" and "globpath()" functions.
    if v:version &gt; 704 || (v:version == 704 &amp;&amp; has('patch654'))
        let l:globList = globpath(l:pathSpec, a:pattern, !g:NERDTreeRespectWildIgnore, 1, 0)
    elseif v:version == 704 &amp;&amp; has('patch279')
        let l:globList = globpath(l:pathSpec, a:pattern, !g:NERDTreeRespectWildIgnore, 1)
    elseif v:version &gt; 702 || (v:version == 702 &amp;&amp; has('patch051'))
        let l:globString = globpath(l:pathSpec, a:pattern, !g:NERDTreeRespectWildIgnore)
        let l:globList = split(l:globString, "\n")
    else
        let l:globString = globpath(l:pathSpec, a:pattern)
        let l:globList = split(l:globString, "\n")
    endif

    " If "a:all" is false, filter "." and ".." from the output.
    if !a:all
        let l:toRemove = []

        for l:file in l:globList
            let l:tail = fnamemodify(l:file, ':t')

            " If l:file has a trailing slash, then its :tail will be ''. Use
            " :h to drop the slash and the empty string after it; then use :t
            " to get the directory name.
            if l:tail == ''
                let l:tail = fnamemodify(l:file, ':h:t')
            endif

            if l:tail == '.' || l:tail == '..'
                call add(l:toRemove, l:file)
                if len(l:toRemove) == 2
                    break
                endif
            endif
        endfor

        for l:file in l:toRemove
            call remove(l:globList, index(l:globList, l:file))
        endfor
    endif

    return l:globList
endfunction</t>
<t tx="ekr.20181231110604.199">" Returns the current node if it is a dir node, or else returns the current
" nodes parent
unlet s:TreeDirNode.GetSelected
function! s:TreeDirNode.GetSelected()
    let currentDir = g:NERDTreeFileNode.GetSelected()
    if currentDir != {} &amp;&amp; !currentDir.isRoot()
        if currentDir.path.isDirectory ==# 0
            let currentDir = currentDir.parent
        endif
    endif
    return currentDir
endfunction</t>
<t tx="ekr.20181231110604.2"></t>
<t tx="ekr.20181231110604.20">" Class method to get all invalid bookmark strings read from the bookmarks
" file
function! s:Bookmark.InvalidBookmarks()
    if !exists("g:NERDTreeInvalidBookmarks")
        let g:NERDTreeInvalidBookmarks = []
    endif
    return g:NERDTreeInvalidBookmarks
endfunction</t>
<t tx="ekr.20181231110604.200">" Returns the number of visible children this node has
function! s:TreeDirNode.getVisibleChildCount()
    return len(self.getVisibleChildren())
endfunction</t>
<t tx="ekr.20181231110604.201">" Returns a list of children to display for this node, in the correct order
"
" Return:
" an array of treenodes
function! s:TreeDirNode.getVisibleChildren()
    let toReturn = []
    for i in self.children
        if i.path.ignore(self.getNerdtree()) ==# 0
            call add(toReturn, i)
        endif
    endfor
    return toReturn
endfunction</t>
<t tx="ekr.20181231110604.202">" returns 1 if this node has any childre, 0 otherwise..
function! s:TreeDirNode.hasVisibleChildren()
    return self.getVisibleChildCount() != 0
endfunction</t>
<t tx="ekr.20181231110604.203">" true if this dir has only one visible child that is also a dir
" false if this dir is bookmarked or symlinked. Why? Two reasons:
"  1. If cascaded, we don't know which dir is bookmarked or is a symlink.
"  2. If the parent is a symlink or is bookmarked, you end up with unparsable
"     text, and NERDTree cannot get the path of any child node.
function! s:TreeDirNode.isCascadable()
    if g:NERDTreeCascadeSingleChildDir == 0
        return 0
    endif

    if self.path.isSymLink
        return 0
    endif

    for i in g:NERDTreeBookmark.Bookmarks()
        if i.path.equals(self.path)
            return 0
        endif
    endfor

    let c = self.getVisibleChildren()
    return len(c) == 1 &amp;&amp; c[0].path.isDirectory
endfunction</t>
<t tx="ekr.20181231110604.204">" Removes all childen from this node and re-reads them
"
" Args:
" silent: 1 if the function should not echo any "please wait" messages for
" large directories
"
" Return: the number of child nodes read
function! s:TreeDirNode._initChildren(silent)
    "remove all the current child nodes
    let self.children = []

    let files = self._glob('*', 1) + self._glob('.*', 0)

    if !a:silent &amp;&amp; len(files) &gt; g:NERDTreeNotificationThreshold
        call nerdtree#echo("Please wait, caching a large dir ...")
    endif

    let invalidFilesFound = 0
    for i in files
        try
            let path = g:NERDTreePath.New(i)
            call self.createChild(path, 0)
            call g:NERDTreePathNotifier.NotifyListeners('init', path, self.getNerdtree(), {})
        catch /^NERDTree.\(InvalidArguments\|InvalidFiletype\)Error/
            let invalidFilesFound += 1
        endtry
    endfor

    call self.sortChildren()

    if !a:silent &amp;&amp; len(files) &gt; g:NERDTreeNotificationThreshold
        call nerdtree#echo("Please wait, caching a large dir ... DONE (". self.getChildCount() ." nodes cached).")
    endif

    if invalidFilesFound
        call nerdtree#echoWarning(invalidFilesFound . " file(s) could not be loaded into the NERD tree")
    endif
    return self.getChildCount()
endfunction</t>
<t tx="ekr.20181231110604.205">" Return a new TreeDirNode object with the given path and parent.
"
" Args:
" path: dir that the node represents
" nerdtree: the tree the node belongs to
function! s:TreeDirNode.New(path, nerdtree)
    if a:path.isDirectory != 1
        throw "NERDTree.InvalidArgumentsError: A TreeDirNode object must be instantiated with a directory Path object."
    endif

    let newTreeNode = copy(self)
    let newTreeNode.path = a:path

    let newTreeNode.isOpen = 0
    let newTreeNode.children = []

    let newTreeNode.parent = {}
    let newTreeNode._nerdtree = a:nerdtree

    return newTreeNode
endfunction</t>
<t tx="ekr.20181231110604.206">" Open this directory node in the current tree or elsewhere if special options
" are provided. Return 0 if options were processed. Otherwise, return the
" number of new cached nodes.
function! s:TreeDirNode.open(...)
    let l:options = a:0 ? a:1 : {}

    " If special options were specified, process them and return.
    if has_key(l:options, 'where') &amp;&amp; !empty(l:options['where'])
        let l:opener = g:NERDTreeOpener.New(self.path, l:options)
        call l:opener.open(self)
        return 0
    endif

    " Open any ancestors of this node that render within the same cascade.
    let l:parent = self.parent
    while !empty(l:parent) &amp;&amp; !l:parent.isRoot()
        if index(l:parent.getCascade(), self) &gt;= 0
            let l:parent.isOpen = 1
            let l:parent = l:parent.parent
        else
            break
        endif
    endwhile

    let self.isOpen = 1

    let l:numChildrenCached = 0
    if empty(self.children)
        let l:numChildrenCached = self._initChildren(0)
    endif

    return l:numChildrenCached
endfunction</t>
<t tx="ekr.20181231110604.207">" recursive open the dir if it has only one directory child.
"
" return the level of opened directories.
function! s:TreeDirNode.openAlong(...)
    let opts = a:0 ? a:1 : {}
    let level = 0

    let node = self
    while node.path.isDirectory
        call node.open(opts)
        let level += 1
        if node.getVisibleChildCount() == 1
            let node = node.getChildByIndex(0, 1)
        else
            break
        endif
    endwhile
    return level
endfunction</t>
<t tx="ekr.20181231110604.208">" Open an explorer window for this node in the previous window. The explorer
" can be a NERDTree window or a netrw window.
function! s:TreeDirNode.openExplorer()
    call self.open({'where': 'p'})
endfunction</t>
<t tx="ekr.20181231110604.209">unlet s:TreeDirNode.openInNewTab
function! s:TreeDirNode.openInNewTab(options)
    call nerdtree#deprecated('TreeDirNode.openInNewTab', 'is deprecated, use open() instead')
    call self.open({'where': 't'})
endfunction</t>
<t tx="ekr.20181231110604.21">function! s:Bookmark.mustExist()
    if !self.path.exists()
        call s:Bookmark.CacheBookmarks(1)
        throw "NERDTree.BookmarkPointsToInvalidLocationError: the bookmark \"".
            \ self.name ."\" points to a non existing location: \"". self.path.str()
    endif
endfunction</t>
<t tx="ekr.20181231110604.210">function! s:TreeDirNode._openInNewTab()
    tabnew
    call g:NERDTreeCreator.CreateTabTree(self.path.str())
endfunction</t>
<t tx="ekr.20181231110604.211">" Open this directory node and any descendant directory nodes whose pathnames
" are not ignored.
function! s:TreeDirNode.openRecursively()
    silent call self.open()

    for l:child in self.children
        if l:child.path.isDirectory &amp;&amp; !l:child.path.ignore(l:child.getNerdtree())
            call l:child.openRecursively()
        endif
    endfor
endfunction</t>
<t tx="ekr.20181231110604.212">function! s:TreeDirNode.refresh()
    call self.path.refresh(self.getNerdtree())

    "if this node was ever opened, refresh its children
    if self.isOpen || !empty(self.children)
        let files = self._glob('*', 1) + self._glob('.*', 0)
        let newChildNodes = []
        let invalidFilesFound = 0
        for i in files
            try
                "create a new path and see if it exists in this nodes children
                let path = g:NERDTreePath.New(i)
                let newNode = self.getChild(path)
                if newNode != {}
                    call newNode.refresh()
                    call add(newChildNodes, newNode)

                "the node doesnt exist so create it
                else
                    let newNode = g:NERDTreeFileNode.New(path, self.getNerdtree())
                    let newNode.parent = self
                    call add(newChildNodes, newNode)
                endif
            catch /^NERDTree.\(InvalidArguments\|InvalidFiletype\)Error/
                let invalidFilesFound = 1
            endtry
        endfor

        "swap this nodes children out for the children we just read/refreshed
        let self.children = newChildNodes
        call self.sortChildren()

        if invalidFilesFound
            call nerdtree#echoWarning("some files could not be loaded into the NERD tree")
        endif
    endif
endfunction</t>
<t tx="ekr.20181231110604.213">unlet s:TreeDirNode.refreshFlags
function! s:TreeDirNode.refreshFlags()
    call self.path.refreshFlags(self.getNerdtree())
    for i in self.children
        call i.refreshFlags()
    endfor
endfunction</t>
<t tx="ekr.20181231110604.214">function! s:TreeDirNode.refreshDirFlags()
    call self.path.refreshFlags(self.getNerdtree())
endfunction</t>
<t tx="ekr.20181231110604.215">" reveal the given path, i.e. cache and open all treenodes needed to display it
" in the UI
" Returns the revealed node
function! s:TreeDirNode.reveal(path, ...)
    let opts = a:0 ? a:1 : {}

    if !a:path.isUnder(self.path)
        throw "NERDTree.InvalidArgumentsError: " . a:path.str() . " should be under " . self.path.str()
    endif

    call self.open()

    if self.path.equals(a:path.getParent())
        let n = self.findNode(a:path)
        if has_key(opts, "open")
            call n.open()
        endif
        return n
    endif

    let p = a:path
    while !p.getParent().equals(self.path)
        let p = p.getParent()
    endwhile

    let n = self.findNode(p)
    return n.reveal(a:path, opts)
endfunction</t>
<t tx="ekr.20181231110604.216">" FUNCTION: TreeDirNode.removeChild(treenode) {{{1
" Remove the given treenode from "self.children".
" Throws "NERDTree.ChildNotFoundError" if the node is not found.
"
" Args:
" treenode: the node object to remove
function! s:TreeDirNode.removeChild(treenode)
    for i in range(0, self.getChildCount()-1)
        if self.children[i].equals(a:treenode)
            call remove(self.children, i)
            return
        endif
    endfor

    throw "NERDTree.ChildNotFoundError: child node was not found"
endfunction</t>
<t tx="ekr.20181231110604.217">" Sort "self.children" by alphabetical order and directory priority.
function! s:TreeDirNode.sortChildren()
    if count(g:NERDTreeSortOrder, '*') &lt; 1
        call add(g:NERDTreeSortOrder, '*')
    endif
    let CompareFunc = function("nerdtree#compareNodesBySortKey")
    call sort(self.children, CompareFunc)
    let g:NERDTreeOldSortOrder = g:NERDTreeSortOrder
endfunction</t>
<t tx="ekr.20181231110604.218">" Opens this directory if it is closed and vice versa
function! s:TreeDirNode.toggleOpen(...)
    let opts = a:0 ? a:1 : {}
    if self.isOpen ==# 1
        call self.close()
    else
        if g:NERDTreeCascadeOpenSingleChildDir == 0
            call self.open(opts)
        else
            call self.openAlong(opts)
        endif
    endif
endfunction</t>
<t tx="ekr.20181231110604.219">" Replaces the child of this with the given node (where the child node's full
" path matches a:newNode's fullpath). The search for the matching node is
" non-recursive
"
" Arg:
" newNode: the node to graft into the tree
function! s:TreeDirNode.transplantChild(newNode)
    for i in range(0, self.getChildCount()-1)
        if self.children[i].equals(a:newNode)
            let self.children[i] = a:newNode
            let a:newNode.parent = self
            break
        endif
    endfor
endfunction</t>
<t tx="ekr.20181231110604.22">" Create a new bookmark object with the given name and path object
function! s:Bookmark.New(name, path)
    if a:name =~# ' '
        throw "NERDTree.IllegalBookmarkNameError: illegal name:" . a:name
    endif

    let newBookmark = copy(self)
    let newBookmark.name = a:name
    let newBookmark.path = a:path
    return newBookmark
endfunction</t>
<t tx="ekr.20181231110604.220">" ============================================================================
" CLASS: TreeFileNode
"
" This class is the parent of the "TreeDirNode" class and is the "Component"
" part of the composite design pattern between the NERDTree node classes.
" ============================================================================


let s:TreeFileNode = {}
let g:NERDTreeFileNode = s:TreeFileNode

@others

" vim: set sw=4 sts=4 et fdm=marker:
</t>
<t tx="ekr.20181231110604.221">function! s:TreeFileNode.activate(...)
    call self.open(a:0 ? a:1 : {})
endfunction

" FUNCTION: TreeFileNode.bookmark(name) {{{1
" bookmark this node with a:name
function! s:TreeFileNode.bookmark(name)

    " if a bookmark exists with the same name and the node is cached then save
    " it so we can update its display string
    let oldMarkedNode = {}
    try
        let oldMarkedNode = g:NERDTreeBookmark.GetNodeForName(a:name, 1, self.getNerdtree())
    catch /^NERDTree.BookmarkNotFoundError/
    catch /^NERDTree.BookmarkedNodeNotFoundError/
    endtry

    call g:NERDTreeBookmark.AddBookmark(a:name, self.path)
    call self.path.cacheDisplayString()
    call g:NERDTreeBookmark.Write()

    if !empty(oldMarkedNode)
        call oldMarkedNode.path.cacheDisplayString()
    endif
endfunction</t>
<t tx="ekr.20181231110604.222">" FUNCTION: TreeFileNode.cacheParent() {{{1
" initializes self.parent if it isnt already
function! s:TreeFileNode.cacheParent()
    if empty(self.parent)
        let parentPath = self.path.getParent()
        if parentPath.equals(self.path)
            throw "NERDTree.CannotCacheParentError: already at root"
        endif
        let self.parent = s:TreeFileNode.New(parentPath, self.getNerdtree())
    endif
endfunction</t>
<t tx="ekr.20181231110604.223">function! s:TreeFileNode.clearBookmarks()
    for i in g:NERDTreeBookmark.Bookmarks()
        if i.path.equals(self.path)
            call i.delete()
        end
    endfor
    call self.path.cacheDisplayString()
endfunction</t>
<t tx="ekr.20181231110604.224">function! s:TreeFileNode.copy(dest)
    call self.path.copy(a:dest)
    let newPath = g:NERDTreePath.New(a:dest)
    let parent = self.getNerdtree().root.findNode(newPath.getParent())
    if !empty(parent)
        call parent.refresh()
        return parent.findNode(newPath)
    else
        return {}
    endif
endfunction</t>
<t tx="ekr.20181231110604.225">" ============================================================================
" CLASS: UI
" ============================================================================

let s:UI = {}
let g:NERDTreeUI = s:UI

" vim: set sw=4 sts=4 et fdm=marker:
</t>
<t tx="ekr.20181231110604.226">" centers the nerd tree window around the cursor (provided the nerd tree
" options permit)
function! s:UI.centerView()
    if g:NERDTreeAutoCenter
        let current_line = winline()
        let lines_to_top = current_line
        let lines_to_bottom = winheight(g:NERDTree.GetWinNum()) - current_line
        if lines_to_top &lt; g:NERDTreeAutoCenterThreshold || lines_to_bottom &lt; g:NERDTreeAutoCenterThreshold
            normal! zz
        endif
    endif
endfunction</t>
<t tx="ekr.20181231110604.227">" FUNCTION: s:UI._dumpHelp  {{{1
" prints out the quick help
function! s:UI._dumpHelp()
    if self.getShowHelp()
        let help  = "\" NERDTree (" . nerdtree#version() . ") quickhelp~\n"
        let help .= "\" ============================\n"
        let help .= "\" File node mappings~\n"
        let help .= "\" ". (g:NERDTreeMouseMode ==# 3 ? "single" : "double") ."-click,\n"
        let help .= "\" &lt;CR&gt;,\n"
        if self.nerdtree.isTabTree()
            let help .= "\" ". g:NERDTreeMapActivateNode .": open in prev window\n"
        else
            let help .= "\" ". g:NERDTreeMapActivateNode .": open in current window\n"
        endif
        if self.nerdtree.isTabTree()
            let help .= "\" ". g:NERDTreeMapPreview .": preview\n"
        endif
        let help .= "\" ". g:NERDTreeMapOpenInTab.": open in new tab\n"
        let help .= "\" ". g:NERDTreeMapOpenInTabSilent .": open in new tab silently\n"
        let help .= "\" middle-click,\n"
        let help .= "\" ". g:NERDTreeMapOpenSplit .": open split\n"
        let help .= "\" ". g:NERDTreeMapPreviewSplit .": preview split\n"
        let help .= "\" ". g:NERDTreeMapOpenVSplit .": open vsplit\n"
        let help .= "\" ". g:NERDTreeMapPreviewVSplit .": preview vsplit\n"

        let help .= "\"\n\" ----------------------------\n"
        let help .= "\" Directory node mappings~\n"
        let help .= "\" ". (g:NERDTreeMouseMode ==# 1 ? "double" : "single") ."-click,\n"
        let help .= "\" ". g:NERDTreeMapActivateNode .": open &amp; close node\n"
        let help .= "\" ". g:NERDTreeMapOpenRecursively .": recursively open node\n"
        let help .= "\" ". g:NERDTreeMapOpenInTab.": open in new tab\n"
        let help .= "\" ". g:NERDTreeMapOpenInTabSilent .": open in new tab silently\n"
        let help .= "\" ". g:NERDTreeMapCloseDir .": close parent of node\n"
        let help .= "\" ". g:NERDTreeMapCloseChildren .": close all child nodes of\n"
        let help .= "\"    current node recursively\n"
        let help .= "\" middle-click,\n"
        let help .= "\" ". g:NERDTreeMapOpenExpl.": explore selected dir\n"

        let help .= "\"\n\" ----------------------------\n"
        let help .= "\" Bookmark table mappings~\n"
        let help .= "\" double-click,\n"
        let help .= "\" ". g:NERDTreeMapActivateNode .": open bookmark\n"
        let help .= "\" ". g:NERDTreeMapOpenInTab.": open in new tab\n"
        let help .= "\" ". g:NERDTreeMapOpenInTabSilent .": open in new tab silently\n"
        let help .= "\" ". g:NERDTreeMapDeleteBookmark .": delete bookmark\n"

        let help .= "\"\n\" ----------------------------\n"
        let help .= "\" Tree navigation mappings~\n"
        let help .= "\" ". g:NERDTreeMapJumpRoot .": go to root\n"
        let help .= "\" ". g:NERDTreeMapJumpParent .": go to parent\n"
        let help .= "\" ". g:NERDTreeMapJumpFirstChild  .": go to first child\n"
        let help .= "\" ". g:NERDTreeMapJumpLastChild   .": go to last child\n"
        let help .= "\" ". g:NERDTreeMapJumpNextSibling .": go to next sibling\n"
        let help .= "\" ". g:NERDTreeMapJumpPrevSibling .": go to prev sibling\n"

        let help .= "\"\n\" ----------------------------\n"
        let help .= "\" Filesystem mappings~\n"
        let help .= "\" ". g:NERDTreeMapChangeRoot .": change tree root to the\n"
        let help .= "\"    selected dir\n"
        let help .= "\" ". g:NERDTreeMapUpdir .": move tree root up a dir\n"
        let help .= "\" ". g:NERDTreeMapUpdirKeepOpen .": move tree root up a dir\n"
        let help .= "\"    but leave old root open\n"
        let help .= "\" ". g:NERDTreeMapRefresh .": refresh cursor dir\n"
        let help .= "\" ". g:NERDTreeMapRefreshRoot .": refresh current root\n"
        let help .= "\" ". g:NERDTreeMapMenu .": Show menu\n"
        let help .= "\" ". g:NERDTreeMapChdir .":change the CWD to the\n"
        let help .= "\"    selected dir\n"
        let help .= "\" ". g:NERDTreeMapCWD .":change tree root to CWD\n"

        let help .= "\"\n\" ----------------------------\n"
        let help .= "\" Tree filtering mappings~\n"
        let help .= "\" ". g:NERDTreeMapToggleHidden .": hidden files (" . (self.getShowHidden() ? "on" : "off") . ")\n"
        let help .= "\" ". g:NERDTreeMapToggleFilters .": file filters (" . (self.isIgnoreFilterEnabled() ? "on" : "off") . ")\n"
        let help .= "\" ". g:NERDTreeMapToggleFiles .": files (" . (self.getShowFiles() ? "on" : "off") . ")\n"
        let help .= "\" ". g:NERDTreeMapToggleBookmarks .": bookmarks (" . (self.getShowBookmarks() ? "on" : "off") . ")\n"

        " add quickhelp entries for each custom key map
        let help .= "\"\n\" ----------------------------\n"
        let help .= "\" Custom mappings~\n"
        for i in g:NERDTreeKeyMap.All()
            if !empty(i.quickhelpText)
                let help .= "\" ". i.key .": ". i.quickhelpText ."\n"
            endif
        endfor

        let help .= "\"\n\" ----------------------------\n"
        let help .= "\" Other mappings~\n"
        let help .= "\" ". g:NERDTreeMapQuit .": Close the NERDTree window\n"
        let help .= "\" ". g:NERDTreeMapToggleZoom .": Zoom (maximize-minimize)\n"
        let help .= "\"    the NERDTree window\n"
        let help .= "\" ". g:NERDTreeMapHelp .": toggle help\n"
        let help .= "\"\n\" ----------------------------\n"
        let help .= "\" Bookmark commands~\n"
        let help .= "\" :Bookmark [&lt;name&gt;]\n"
        let help .= "\" :BookmarkToRoot &lt;name&gt;\n"
        let help .= "\" :RevealBookmark &lt;name&gt;\n"
        let help .= "\" :OpenBookmark &lt;name&gt;\n"
        let help .= "\" :ClearBookmarks [&lt;names&gt;]\n"
        let help .= "\" :ClearAllBookmarks\n"
        silent! put =help
    elseif !self.isMinimal()
        let help ="\" Press ". g:NERDTreeMapHelp ." for help\n"
        silent! put =help
    endif
endfunction</t>
<t tx="ekr.20181231110604.228">" FUNCTION: s:UI.new(nerdtree) {{{1
function! s:UI.New(nerdtree)
    let newObj = copy(self)
    let newObj.nerdtree = a:nerdtree
    let newObj._showHelp = 0
    let newObj._ignoreEnabled = 1
    let newObj._showFiles = g:NERDTreeShowFiles
    let newObj._showHidden = g:NERDTreeShowHidden
    let newObj._showBookmarks = g:NERDTreeShowBookmarks

    return newObj
endfunction
</t>
<t tx="ekr.20181231110604.229">" FUNCTION: s:UI.getPath(ln) {{{1
" number.  If the "up a dir" line is selected, return the "Path" object for
" the parent of the root.  Return the empty dictionary if the given line
" does not reference a tree node.
function! s:UI.getPath(ln)
    let line = getline(a:ln)

    let rootLine = self.getRootLineNum()

    if a:ln == rootLine
        return self.nerdtree.root.path
    endif

    if line ==# s:UI.UpDirLine()
        return self.nerdtree.root.path.getParent()
    endif

    if a:ln &lt; rootLine
        return {}
    endif

    let indent = self._indentLevelFor(line)

    " remove the tree parts and the leading space
    let curFile = self._stripMarkup(line)

    let dir = ""
    let lnum = a:ln
    while lnum &gt; 0
        let lnum = lnum - 1
        let curLine = getline(lnum)
        let curLineStripped = self._stripMarkup(curLine)

        " have we reached the top of the tree?
        if lnum == rootLine
            let dir = self.nerdtree.root.path.str({'format': 'UI'}) . dir
            break
        endif
        if curLineStripped =~# '/$'
            let lpindent = self._indentLevelFor(curLine)
            if lpindent &lt; indent
                let indent = indent - 1

                let dir = substitute (curLineStripped,'^\\', "", "") . dir
                continue
            endif
        endif
    endwhile
    let curFile = self.nerdtree.root.path.drive . dir . curFile
    let toReturn = g:NERDTreePath.New(curFile)
    return toReturn
endfunction</t>
<t tx="ekr.20181231110604.23">"Args:
"
"nerdtree: the tree to load open the bookmark in
"
"A dictionary containing the following keys (all optional):
"  'where': Specifies whether the node should be opened in new split/tab or in
"           the previous window. Can be either 'v' (vertical split), 'h'
"           (horizontal split), 't' (new tab) or 'p' (previous window).
"  'reuse': if a window is displaying the file then jump the cursor there
"  'keepopen': dont close the tree window
"  'stay': open the file, but keep the cursor in the tree win
"
function! s:Bookmark.open(nerdtree, ...)
    let opts = a:0 ? a:1 : {}

    if self.path.isDirectory &amp;&amp; !has_key(opts, 'where')
        call self.toRoot(a:nerdtree)
    else
        let opener = g:NERDTreeOpener.New(self.path, opts)
        call opener.open(self)
    endif
endfunction</t>
<t tx="ekr.20181231110604.230"></t>
<t tx="ekr.20181231110604.231">" FUNCTION: s:UI.getLineNum(node) {{{1
" Return the line number where the given node is rendered.  Return -1 if the
" given node is not visible.
function! s:UI.getLineNum(node)

    if a:node.isRoot()
        return self.getRootLineNum()
    endif

    let l:pathComponents = [substitute(self.nerdtree.root.path.str({'format': 'UI'}), '/\s*$', '', '')]
    let l:currentPathComponent = 1

    let l:fullPath = a:node.path.str({'format': 'UI'})

    for l:lineNumber in range(self.getRootLineNum() + 1, line('$'))
        let l:currentLine = getline(l:lineNumber)
        let l:indentLevel = self._indentLevelFor(l:currentLine)

        if l:indentLevel != l:currentPathComponent
            continue
        endif

        let l:currentLine = self._stripMarkup(l:currentLine)
        let l:currentPath =  join(l:pathComponents, '/') . '/' . l:currentLine

        " Directories: If the current path "starts with" the full path, then
        " either the paths are equal or the line is a cascade containing the
        " full path.
        if l:fullPath[-1:] == '/' &amp;&amp; stridx(l:currentPath, l:fullPath) == 0
            return l:lineNumber
        endif

        " Files: The paths must exactly match.
        if l:fullPath ==# l:currentPath
            return l:lineNumber
        endif

        " Otherwise: If the full path starts with the current path and the
        " current path is a directory, we add a new path component.
        if stridx(l:fullPath, l:currentPath) == 0 &amp;&amp; l:currentPath[-1:] == '/'
            let l:currentLine = substitute(l:currentLine, '/\s*$', '', '')
            call add(l:pathComponents, l:currentLine)
            let l:currentPathComponent += 1
        endif
    endfor

    return -1
endfunction</t>
<t tx="ekr.20181231110604.232">" gets the line number of the root node
function! s:UI.getRootLineNum()
    let rootLine = 1
    while getline(rootLine) !~# '^\(/\|&lt;\)'
        let rootLine = rootLine + 1
    endwhile
    return rootLine
endfunction</t>
<t tx="ekr.20181231110604.233">function! s:UI.getShowBookmarks()
    return self._showBookmarks
endfunction</t>
<t tx="ekr.20181231110604.234">function! s:UI.getShowFiles()
    return self._showFiles
endfunction</t>
<t tx="ekr.20181231110604.235">function! s:UI.getShowHelp()
    return self._showHelp
endfunction</t>
<t tx="ekr.20181231110604.236">function! s:UI.getShowHidden()
    return self._showHidden
endfunction</t>
<t tx="ekr.20181231110604.237">function! s:UI._indentLevelFor(line)
    " have to do this work around because match() returns bytes, not chars
    let numLeadBytes = match(a:line, '\M\[^ '.g:NERDTreeDirArrowExpandable.g:NERDTreeDirArrowCollapsible.']')
    " The next line is a backward-compatible workaround for strchars(a:line(0:numLeadBytes-1]). strchars() is in 7.3+
    let leadChars = len(split(a:line[0:numLeadBytes-1], '\zs'))

    return leadChars / s:UI.IndentWid()
endfunction</t>
<t tx="ekr.20181231110604.238">function! s:UI.IndentWid()
    return 2
endfunction</t>
<t tx="ekr.20181231110604.239">function! s:UI.isIgnoreFilterEnabled()
    return self._ignoreEnabled == 1
endfunction</t>
<t tx="ekr.20181231110604.24">" Create a new bookmark object with the given name and path object
function! s:Bookmark.openInNewTab(options)
    call nerdtree#deprecated('Bookmark.openInNewTab', 'is deprecated, use open() instead')
    call self.open(a:options)
endfunction</t>
<t tx="ekr.20181231110604.240">function! s:UI.isMinimal()
    return g:NERDTreeMinimalUI
endfunction</t>
<t tx="ekr.20181231110604.241">function! s:UI.MarkupReg()
    return '^ *['.g:NERDTreeDirArrowExpandable.g:NERDTreeDirArrowCollapsible.']\? '
endfunction</t>
<t tx="ekr.20181231110604.242">function! s:UI._renderBookmarks()

    if !self.isMinimal()
        call setline(line(".")+1, "&gt;----------Bookmarks----------")
        call cursor(line(".")+1, col("."))
    endif

    if g:NERDTreeBookmarksSort == 1 || g:NERDTreeBookmarksSort == 2
        call g:NERDTreeBookmark.SortBookmarksList()
    endif

    for i in g:NERDTreeBookmark.Bookmarks()
        call setline(line(".")+1, i.str())
        call cursor(line(".")+1, col("."))
    endfor

    call setline(line(".")+1, '')
    call cursor(line(".")+1, col("."))
endfunction</t>
<t tx="ekr.20181231110604.243">"
" Sets the screen state back to what it was when nerdtree#saveScreenState was last
" called.
"
" Assumes the cursor is in the NERDTree window
function! s:UI.restoreScreenState()
    if !has_key(self, '_screenState')
        return
    endif
    exec("silent vertical resize " . self._screenState['oldWindowSize'])

    let old_scrolloff=&amp;scrolloff
    let &amp;scrolloff=0
    call cursor(self._screenState['oldTopLine'], 0)
    normal! zt
    call setpos(".", self._screenState['oldPos'])
    let &amp;scrolloff=old_scrolloff
endfunction</t>
<t tx="ekr.20181231110604.244">" Saves the current cursor position in the current buffer and the window
" scroll position
function! s:UI.saveScreenState()
    let win = winnr()
    call g:NERDTree.CursorToTreeWin()
    let self._screenState = {}
    let self._screenState['oldPos'] = getpos(".")
    let self._screenState['oldTopLine'] = line("w0")
    let self._screenState['oldWindowSize']= winwidth("")
    call nerdtree#exec(win . "wincmd w")
endfunction</t>
<t tx="ekr.20181231110604.245">function! s:UI.setShowHidden(val)
    let self._showHidden = a:val
endfunction</t>
<t tx="ekr.20181231110604.246">" find the filename in the given line, and return it.
"
" Args:
" line: the subject line
function! s:UI._stripMarkup(line)
    let l:line = substitute(a:line, '^.\{-}' . g:NERDTreeNodeDelimiter, '', '')
    return substitute(l:line, g:NERDTreeNodeDelimiter.'.*$', '', '')
endfunction</t>
<t tx="ekr.20181231110604.247">function! s:UI.render()
    setlocal noreadonly modifiable

    " remember the top line of the buffer and the current line so we can
    " restore the view exactly how it was
    let curLine = line(".")
    let curCol = col(".")
    let topLine = line("w0")

    " delete all lines in the buffer (being careful not to clobber a register)
    silent 1,$delete _

    call self._dumpHelp()

    " delete the blank line before the help and add one after it
    if !self.isMinimal()
        call setline(line(".")+1, "")
        call cursor(line(".")+1, col("."))
    endif

    if self.getShowBookmarks()
        call self._renderBookmarks()
    endif

    " add the 'up a dir' line
    if !self.isMinimal()
        call setline(line(".")+1, s:UI.UpDirLine())
        call cursor(line(".")+1, col("."))
    endif

    " draw the header line
    let header = self.nerdtree.root.path.str({'format': 'UI', 'truncateTo': winwidth(0)})
    call setline(line(".")+1, header)
    call cursor(line(".")+1, col("."))

    " draw the tree
    silent put =self.nerdtree.root.renderToString()

    " delete the blank line at the top of the buffer
    silent 1,1delete _

    " restore the view
    let old_scrolloff=&amp;scrolloff
    let &amp;scrolloff=0
    call cursor(topLine, 1)
    normal! zt
    call cursor(curLine, curCol)
    let &amp;scrolloff = old_scrolloff

    setlocal readonly nomodifiable
endfunction</t>
<t tx="ekr.20181231110604.248">" Renders the tree and ensures the cursor stays on the current node or the
" current nodes parent if it is no longer available upon re-rendering
function! s:UI.renderViewSavingPosition()
    let currentNode = g:NERDTreeFileNode.GetSelected()

    " go up the tree till we find a node that will be visible or till we run
    " out of nodes
    while currentNode != {} &amp;&amp; !currentNode.isVisible() &amp;&amp; !currentNode.isRoot()
        let currentNode = currentNode.parent
    endwhile

    call self.render()

    if currentNode != {}
        call currentNode.putCursorHere(0, 0)
    endif
endfunction</t>
<t tx="ekr.20181231110604.249">function! s:UI.toggleHelp()
    let self._showHelp = !self._showHelp
endfunction</t>
<t tx="ekr.20181231110604.25">" FUNCTION: Bookmark.setPath(path) {{{1
" makes this bookmark point to the given path
function! s:Bookmark.setPath(path)
    let self.path = a:path
endfunction</t>
<t tx="ekr.20181231110604.250">" toggles the use of the NERDTreeIgnore option
function! s:UI.toggleIgnoreFilter()
    let self._ignoreEnabled = !self._ignoreEnabled
    call self.renderViewSavingPosition()
    call self.centerView()
endfunction</t>
<t tx="ekr.20181231110604.251">" Toggle the visibility of the Bookmark table.
function! s:UI.toggleShowBookmarks()
    let self._showBookmarks = !self._showBookmarks

    if self.getShowBookmarks()
        call self.nerdtree.render()
        call g:NERDTree.CursorToBookmarkTable()
    else

        if empty(g:NERDTreeFileNode.GetSelected())
            call b:NERDTree.root.putCursorHere(0, 0)
            normal! 0
        endif

        call self.renderViewSavingPosition()
    endif

    call self.centerView()
endfunction</t>
<t tx="ekr.20181231110604.252">" toggles the display of hidden files
function! s:UI.toggleShowFiles()
    let self._showFiles = !self._showFiles
    call self.renderViewSavingPosition()
    call self.centerView()
endfunction</t>
<t tx="ekr.20181231110604.253">" toggles the display of hidden files
function! s:UI.toggleShowHidden()
    let self._showHidden = !self._showHidden
    call self.renderViewSavingPosition()
    call self.centerView()
endfunction</t>
<t tx="ekr.20181231110604.254">" zoom (maximize/minimize) the NERDTree window
function! s:UI.toggleZoom()
    if exists("b:NERDTreeZoomed") &amp;&amp; b:NERDTreeZoomed
        let size = exists("b:NERDTreeOldWindowSize") ? b:NERDTreeOldWindowSize : g:NERDTreeWinSize
        exec "silent vertical resize ". size
        let b:NERDTreeZoomed = 0
    else
        exec "vertical resize"
        let b:NERDTreeZoomed = 1
    endif
endfunction</t>
<t tx="ekr.20181231110604.255">function! s:UI.UpDirLine()
    return '.. (up a dir)'
endfunction</t>
<t tx="ekr.20181231110604.256"></t>
<t tx="ekr.20181231110604.257">&lt;&lt;docstring&gt;&gt;
&lt;&lt;startup&gt;&gt;
@others</t>
<t tx="ekr.20181231110604.258">" ============================================================================
" File:        exec_menuitem.vim
" Description: plugin for NERD Tree that provides an execute file menu item
" Maintainer:  Martin Grenfell &lt;martin.grenfell at gmail dot com&gt;
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================</t>
<t tx="ekr.20181231110604.259">if exists("g:loaded_nerdtree_exec_menuitem")
    finish
endif
let g:loaded_nerdtree_exec_menuitem = 1

call NERDTreeAddMenuItem({
            \ 'text': '(!)Execute file',
            \ 'shortcut': '!',
            \ 'callback': 'NERDTreeExecFile',
            \ 'isActiveCallback': 'NERDTreeExecFileActive' })</t>
<t tx="ekr.20181231110604.26">" Class method that sorts the global list of bookmarks alphabetically by name.
" Note that case-sensitivity is determined by a user option.
function! s:Bookmark.SortBookmarksList()
    call sort(s:Bookmark.Bookmarks(), s:Bookmark.CompareBookmarksByName, s:Bookmark)
endfunction

" FUNCTION: Bookmark.str() {{{1
" Get the string that should be rendered in the view for this bookmark
function! s:Bookmark.str()
    let pathStrMaxLen = winwidth(g:NERDTree.GetWinNum()) - 4 - strdisplaywidth(self.name)
    if &amp;nu
        let pathStrMaxLen = pathStrMaxLen - &amp;numberwidth
    endif

    let pathStr = self.path.str({'format': 'UI'})
    if strdisplaywidth(pathStr) &gt; pathStrMaxLen
        while strdisplaywidth(pathStr) &gt; pathStrMaxLen &amp;&amp; strchars(pathStr) &gt; 0
            let pathStr = substitute(pathStr, '^.', '', '')
        endwhile
        let pathStr = '&lt;' . pathStr
    endif
    return '&gt;' . self.name . ' ' . pathStr
endfunction</t>
<t tx="ekr.20181231110604.260">&lt;&lt;docstring&gt;&gt;
&lt;&lt; startup &gt;&gt;
&lt;&lt; menus &gt;&gt;

@others

" vim: set sw=4 sts=4 et fdm=marker:

</t>
<t tx="ekr.20181231110604.261">" ============================================================================
" File:        fs_menu.vim
" Description: plugin for the NERD Tree that provides a file system menu
" Maintainer:  Martin Grenfell &lt;martin.grenfell at gmail dot com&gt;
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================
</t>
<t tx="ekr.20181231110604.262">
if exists("g:loaded_nerdtree_fs_menu")
    finish
endif
let g:loaded_nerdtree_fs_menu = 1

"Automatically delete the buffer after deleting or renaming a file
if !exists("g:NERDTreeAutoDeleteBuffer")
    let g:NERDTreeAutoDeleteBuffer = 0
endif</t>
<t tx="ekr.20181231110604.263">
call NERDTreeAddMenuItem({'text': '(a)dd a childnode', 'shortcut': 'a', 'callback': 'NERDTreeAddNode'})
call NERDTreeAddMenuItem({'text': '(m)ove the current node', 'shortcut': 'm', 'callback': 'NERDTreeMoveNode'})
call NERDTreeAddMenuItem({'text': '(d)elete the current node', 'shortcut': 'd', 'callback': 'NERDTreeDeleteNode'})

if has("gui_mac") || has("gui_macvim") || has("mac")
    call NERDTreeAddMenuItem({'text': '(r)eveal in Finder the current node', 'shortcut': 'r', 'callback': 'NERDTreeRevealInFinder'})
    call NERDTreeAddMenuItem({'text': '(o)pen the current node with system editor', 'shortcut': 'o', 'callback': 'NERDTreeExecuteFile'})
    call NERDTreeAddMenuItem({'text': '(q)uicklook the current node', 'shortcut': 'q', 'callback': 'NERDTreeQuickLook'})
endif

if executable("xdg-open")
    call NERDTreeAddMenuItem({'text': '(r)eveal the current node in file manager', 'shortcut': 'r', 'callback': 'NERDTreeRevealFileLinux'})
    call NERDTreeAddMenuItem({'text': '(o)pen the current node with system editor', 'shortcut': 'o', 'callback': 'NERDTreeExecuteFileLinux'})
endif

if g:NERDTreePath.CopyingSupported()
    call NERDTreeAddMenuItem({'text': '(c)opy the current node', 'shortcut': 'c', 'callback': 'NERDTreeCopyNode'})
endif

if has("unix") || has("osx")
    call NERDTreeAddMenuItem({'text': '(l)ist the current node', 'shortcut': 'l', 'callback': 'NERDTreeListNode'})
else
    call NERDTreeAddMenuItem({'text': '(l)ist the current node', 'shortcut': 'l', 'callback': 'NERDTreeListNodeWin32'})
endif</t>
<t tx="ekr.20181231110604.264">"FUNCTION: s:promptToDelBuffer(bufnum, msg){{{1
"prints out the given msg and, if the user responds by pushing 'y' then the
"buffer with the given bufnum is deleted
"
"Args:
"bufnum: the buffer that may be deleted
"msg: a message that will be echoed to the user asking them if they wish to
"     del the buffer
function! s:promptToDelBuffer(bufnum, msg)
    echo a:msg
    if g:NERDTreeAutoDeleteBuffer || nr2char(getchar()) ==# 'y'
        " 1. ensure that all windows which display the just deleted filename
        " now display an empty buffer (so a layout is preserved).
        " Is not it better to close single tabs with this file only ?
        let s:originalTabNumber = tabpagenr()
        let s:originalWindowNumber = winnr()
        " Go to the next buffer in buffer list if at least one extra buffer is listed
        " Otherwise open a new empty buffer
        if v:version &gt;= 800
            let l:listedBufferCount = len(getbufinfo({'buflisted':1}))
        elseif v:version &gt;= 702
            let l:listedBufferCount = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
        else
            " Ignore buffer count in this case to make sure we keep the old
            " behavior
            let l:listedBufferCount = 0
        endif
        if l:listedBufferCount &gt; 1
            exec "tabdo windo if winbufnr(0) == " . a:bufnum . " | exec ':bnext! ' | endif"
        else
            exec "tabdo windo if winbufnr(0) == " . a:bufnum . " | exec ':enew! ' | endif"
        endif
        exec "tabnext " . s:originalTabNumber
        exec s:originalWindowNumber . "wincmd w"
        " 3. We don't need a previous buffer anymore
        exec "bwipeout! " . a:bufnum
    endif
endfunction

</t>
<t tx="ekr.20181231110604.265">"FUNCTION: s:renameBuffer(bufNum, newNodeName, isDirectory){{{1
"The buffer with the given bufNum is replaced with a new one
"
"Args:
"bufNum: the buffer that may be deleted
"newNodeName: the name given to the renamed node
"isDirectory: determines how to do the create the new filenames
function! s:renameBuffer(bufNum, newNodeName, isDirectory)
    if a:isDirectory
        let quotedFileName = fnameescape(a:newNodeName . '/' . fnamemodify(bufname(a:bufNum),':t'))
        let editStr = g:NERDTreePath.New(a:newNodeName . '/' . fnamemodify(bufname(a:bufNum),':t')).str({'format': 'Edit'})
    else
        let quotedFileName = fnameescape(a:newNodeName)
        let editStr = g:NERDTreePath.New(a:newNodeName).str({'format': 'Edit'})
    endif
    " 1. ensure that a new buffer is loaded
    exec "badd " . quotedFileName
    " 2. ensure that all windows which display the just deleted filename
    " display a buffer for a new filename.
    let s:originalTabNumber = tabpagenr()
    let s:originalWindowNumber = winnr()
    exec "tabdo windo if winbufnr(0) == " . a:bufNum . " | exec ':e! " . editStr . "' | endif"
    exec "tabnext " . s:originalTabNumber
    exec s:originalWindowNumber . "wincmd w"
    " 3. We don't need a previous buffer anymore
    exec "bwipeout! " . a:bufNum
endfunction
</t>
<t tx="ekr.20181231110604.266">"FUNCTION: NERDTreeAddNode(){{{1
function! NERDTreeAddNode()
    let curDirNode = g:NERDTreeDirNode.GetSelected()

    let newNodeName = input("Add a childnode\n".
                          \ "==========================================================\n".
                          \ "Enter the dir/file name to be created. Dirs end with a '/'\n" .
                          \ "", curDirNode.path.str() . g:NERDTreePath.Slash(), "file")

    if newNodeName ==# ''
        call nerdtree#echo("Node Creation Aborted.")
        return
    endif

    try
        let newPath = g:NERDTreePath.Create(newNodeName)
        let parentNode = b:NERDTree.root.findNode(newPath.getParent())

        let newTreeNode = g:NERDTreeFileNode.New(newPath, b:NERDTree)
        " Emptying g:NERDTreeOldSortOrder forces the sort to
        " recalculate the cached sortKey so nodes sort correctly.
        let g:NERDTreeOldSortOrder = []
        if empty(parentNode)
            call b:NERDTree.root.refresh()
            call b:NERDTree.render()
        elseif parentNode.isOpen || !empty(parentNode.children)
            call parentNode.addChild(newTreeNode, 1)
            call NERDTreeRender()
            call newTreeNode.putCursorHere(1, 0)
        endif
    catch /^NERDTree/
        call nerdtree#echoWarning("Node Not Created.")
    endtry
endfunction

</t>
<t tx="ekr.20181231110604.267">"FUNCTION: NERDTreeMoveNode(){{{1
function! NERDTreeMoveNode()
    let curNode = g:NERDTreeFileNode.GetSelected()
    let newNodePath = input("Rename the current node\n" .
                          \ "==========================================================\n" .
                          \ "Enter the new path for the node:                          \n" .
                          \ "", curNode.path.str(), "file")

    if newNodePath ==# ''
        call nerdtree#echo("Node Renaming Aborted.")
        return
    endif

    try
        if curNode.path.isDirectory
            let l:openBuffers = filter(range(1,bufnr("$")),'bufexists(v:val) &amp;&amp; fnamemodify(bufname(v:val),":p") =~# curNode.path.str() . "/.*"')
        else
            let l:openBuffers = filter(range(1,bufnr("$")),'bufexists(v:val) &amp;&amp; fnamemodify(bufname(v:val),":p") ==# curNode.path.str()')
        endif

        call curNode.rename(newNodePath)
        " Emptying g:NERDTreeOldSortOrder forces the sort to
        " recalculate the cached sortKey so nodes sort correctly.
        let g:NERDTreeOldSortOrder = []
        call b:NERDTree.root.refresh()
        call NERDTreeRender()

        " If the file node is open, or files under the directory node are
        " open, ask the user if they want to replace the file(s) with the
        " renamed files.
        if !empty(l:openBuffers)
            if curNode.path.isDirectory
                echo "\nDirectory renamed.\n\nFiles with the old directory name are open in buffers " . join(l:openBuffers, ', ') . ". Replace these buffers with the new files? (yN)"
            else
                echo "\nFile renamed.\n\nThe old file is open in buffer " . l:openBuffers[0] . ". Replace this buffer with the new file? (yN)"
            endif
            if g:NERDTreeAutoDeleteBuffer || nr2char(getchar()) ==# 'y'
                for bufNum in l:openBuffers
                    call s:renameBuffer(bufNum, newNodePath, curNode.path.isDirectory)
                endfor
            endif
        endif

        call curNode.putCursorHere(1, 0)

        redraw
    catch /^NERDTree/
        call nerdtree#echoWarning("Node Not Renamed.")
    endtry
endfunction

</t>
<t tx="ekr.20181231110604.268">" FUNCTION: NERDTreeDeleteNode() {{{1
function! NERDTreeDeleteNode()
    let currentNode = g:NERDTreeFileNode.GetSelected()
    let confirmed = 0

    if currentNode.path.isDirectory &amp;&amp; ((currentNode.isOpen &amp;&amp; currentNode.getChildCount() &gt; 0) ||
                                      \ (len(currentNode._glob('*', 1)) &gt; 0))
        let choice =input("Delete the current node\n" .
                         \ "==========================================================\n" .
                         \ "STOP! Directory is not empty! To delete, type 'yes'\n" .
                         \ "" . currentNode.path.str() . ": ")
        let confirmed = choice ==# 'yes'
    else
        echo "Delete the current node\n" .
           \ "==========================================================\n".
           \ "Are you sure you wish to delete the node:\n" .
           \ "" . currentNode.path.str() . " (yN):"
        let choice = nr2char(getchar())
        let confirmed = choice ==# 'y'
    endif


    if confirmed
        try
            call currentNode.delete()
            call NERDTreeRender()

            "if the node is open in a buffer, ask the user if they want to
            "close that buffer
            let bufnum = bufnr("^".currentNode.path.str()."$")
            if buflisted(bufnum)
                let prompt = "\nNode deleted.\n\nThe file is open in buffer ". bufnum . (bufwinnr(bufnum) ==# -1 ? " (hidden)" : "") .". Delete this buffer? (yN)"
                call s:promptToDelBuffer(bufnum, prompt)
            endif

            redraw
        catch /^NERDTree/
            call nerdtree#echoWarning("Could not remove node")
        endtry
    else
        call nerdtree#echo("delete aborted")
    endif

endfunction

</t>
<t tx="ekr.20181231110604.269">" FUNCTION: NERDTreeListNode() {{{1
function! NERDTreeListNode()
    let treenode = g:NERDTreeFileNode.GetSelected()
    if !empty(treenode)
        let s:uname = system("uname")
        let stat_cmd = 'stat -c "%s" '

        if s:uname =~? "Darwin"
            let stat_cmd = 'stat -f "%z" '
        endif

        let cmd = 'size=$(' . stat_cmd . shellescape(treenode.path.str()) . ') &amp;&amp; ' .
        \         'size_with_commas=$(echo $size | sed -e :a -e "s/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/;ta") &amp;&amp; ' .
        \         'ls -ld ' . shellescape(treenode.path.str()) . ' | sed -e "s/ $size / $size_with_commas /"'

        let metadata = split(system(cmd),'\n')
        call nerdtree#echo(metadata[0])
    else
        call nerdtree#echo("No information available")
    endif
endfunction

</t>
<t tx="ekr.20181231110604.27">" Set the root of the given NERDTree to the node for this Bookmark. If a node
" for this Bookmark does not exist, a new one is initialized.
function! s:Bookmark.toRoot(nerdtree)
    if self.validate()
        try
            let l:targetNode = self.getNode(a:nerdtree, 1)
            call l:targetNode.closeChildren()
        catch /^NERDTree.BookmarkedNodeNotFoundError/
            let l:targetNode = g:NERDTreeFileNode.New(s:Bookmark.BookmarkFor(self.name).path, a:nerdtree)
        endtry
        call a:nerdtree.changeRoot(l:targetNode)
    endif
endfunction</t>
<t tx="ekr.20181231110604.270">" FUNCTION: NERDTreeListNodeWin32() {{{1
function! NERDTreeListNodeWin32()
    let l:node = g:NERDTreeFileNode.GetSelected()

    if !empty(l:node)
        let l:path = l:node.path.str()
        call nerdtree#echo(printf("%s:%s  MOD:%s  BYTES:%d  PERMISSIONS:%s",
                    \ toupper(getftype(l:path)),
                    \ fnamemodify(l:path, ':t'),
                    \ strftime("%c", getftime(l:path)),
                    \ getfsize(l:path),
                    \ getfperm(l:path)))
        return
    endif

    call nerdtree#echo('node not recognized')
endfunction

</t>
<t tx="ekr.20181231110604.271">" FUNCTION: NERDTreeCopyNode() {{{1
function! NERDTreeCopyNode()
    let currentNode = g:NERDTreeFileNode.GetSelected()
    let newNodePath = input("Copy the current node\n" .
                          \ "==========================================================\n" .
                          \ "Enter the new path to copy the node to:                   \n" .
                          \ "", currentNode.path.str(), "file")

    if newNodePath != ""
        "strip trailing slash
        let newNodePath = substitute(newNodePath, '\/$', '', '')

        let confirmed = 1
        if currentNode.path.copyingWillOverwrite(newNodePath)
            call nerdtree#echo("Warning: copying may overwrite files! Continue? (yN)")
            let choice = nr2char(getchar())
            let confirmed = choice ==# 'y'
        endif

        if confirmed
            try
                let newNode = currentNode.copy(newNodePath)
                " Emptying g:NERDTreeOldSortOrder forces the sort to
                " recalculate the cached sortKey so nodes sort correctly.
                let g:NERDTreeOldSortOrder = []
                if empty(newNode)
                    call b:NERDTree.root.refresh()
                    call b:NERDTree.render()
                else
                    call NERDTreeRender()
                    call newNode.putCursorHere(0, 0)
                endif
            catch /^NERDTree/
                call nerdtree#echoWarning("Could not copy node")
            endtry
        endif
    else
        call nerdtree#echo("Copy aborted.")
    endif
    redraw
endfunction

</t>
<t tx="ekr.20181231110604.272">" FUNCTION: NERDTreeQuickLook() {{{1
function! NERDTreeQuickLook()
    let treenode = g:NERDTreeFileNode.GetSelected()
    if treenode != {}
        call system("qlmanage -p 2&gt;/dev/null '" . treenode.path.str() . "'")
    endif
endfunction

</t>
<t tx="ekr.20181231110604.273">" FUNCTION: NERDTreeRevealInFinder() {{{1
function! NERDTreeRevealInFinder()
    let treenode = g:NERDTreeFileNode.GetSelected()
    if treenode != {}
        call system("open -R '" . treenode.path.str() . "'")
    endif
endfunction

</t>
<t tx="ekr.20181231110604.274">" FUNCTION: NERDTreeExecuteFile() {{{1
function! NERDTreeExecuteFile()
    let treenode = g:NERDTreeFileNode.GetSelected()
    if treenode != {}
        call system("open '" . treenode.path.str() . "'")
    endif
endfunction

</t>
<t tx="ekr.20181231110604.275">" FUNCTION: NERDTreeRevealFileLinux() {{{1
function! NERDTreeRevealFileLinux()
    let treenode = g:NERDTreeFileNode.GetSelected()
    let parentnode = treenode.parent
    if parentnode != {}
        call system("xdg-open '" . parentnode.path.str() . "' &amp;")
    endif
endfunction

</t>
<t tx="ekr.20181231110604.276">" FUNCTION: NERDTreeExecuteFileLinux() {{{1
function! NERDTreeExecuteFileLinux()
    let treenode = g:NERDTreeFileNode.GetSelected()
    if treenode != {}
        call system("xdg-open '" . treenode.path.str() . "' &amp;")
    endif
endfunction

</t>
<t tx="ekr.20181231110604.277">&lt;&lt; docstring &gt;&gt;

command! -n=? -complete=dir -bar NERDTreeVCS :call &lt;SID&gt;CreateTabTreeVCS('&lt;args&gt;')

@others</t>
<t tx="ekr.20181231110604.279">&lt;&lt; docstring &gt;&gt;
&lt;&lt; startup &gt;&gt;
@others

" SECTION: Post Source Actions {{{1
call nerdtree#postSourceActions()

"reset &amp;cpo back to users setting
let &amp;cpo = s:old_cpo

" vim: set sw=4 sts=4 et fdm=marker:
</t>
<t tx="ekr.20181231110604.28">" Class method that makes the Bookmark with the given name the root of
" specified NERDTree.
function! s:Bookmark.ToRoot(name, nerdtree)
    let l:bookmark = s:Bookmark.BookmarkFor(a:name)
    call l:bookmark.toRoot(a:nerdtree)
endfunction</t>
<t tx="ekr.20181231110604.280">" ============================================================================
" File:        NERD_tree.vim
" Maintainer:  Martin Grenfell &lt;martin.grenfell at gmail dot com&gt;
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================
"
" SECTION: Script init stuff {{{1
"============================================================</t>
<t tx="ekr.20181231110604.281">if exists("loaded_nerd_tree")
    finish
endif
if v:version &lt; 700
    echoerr "NERDTree: this plugin requires vim &gt;= 7. DOWNLOAD IT! You'll thank me later!"
    finish
endif
let loaded_nerd_tree = 1

"for line continuation - i.e dont want C in &amp;cpo
let s:old_cpo = &amp;cpo
set cpo&amp;vim
</t>
<t tx="ekr.20181231110604.282">"Function: s:initVariable() function {{{2
"This function is used to initialise a given variable to a given value. The
"variable is only initialised if it does not exist prior
"
"Args:
"var: the name of the var to be initialised
"value: the value to initialise var to
"
"Returns:
"1 if the var is set, 0 otherwise
function! s:initVariable(var, value)
    if !exists(a:var)
        exec 'let ' . a:var . ' = ' . "'" . substitute(a:value, "'", "''", "g") . "'"
        return 1
    endif
    return 0
endfunction

</t>
<t tx="ekr.20181231110604.283">"SECTION: Init variable calls and other random constants {{{2
call s:initVariable("g:NERDTreeAutoCenter", 1)
call s:initVariable("g:NERDTreeAutoCenterThreshold", 3)
call s:initVariable("g:NERDTreeCaseSensitiveSort", 0)
call s:initVariable("g:NERDTreeNaturalSort", 0)
call s:initVariable("g:NERDTreeSortHiddenFirst", 1)
call s:initVariable("g:NERDTreeChDirMode", 0)
call s:initVariable("g:NERDTreeCreatePrefix", "silent")
call s:initVariable("g:NERDTreeMinimalUI", 0)
if !exists("g:NERDTreeIgnore")
    let g:NERDTreeIgnore = ['\~$']
endif

call s:initVariable("g:NERDTreeBookmarksFile", expand('$HOME') . '/.NERDTreeBookmarks')
call s:initVariable("g:NERDTreeBookmarksSort", 1)
call s:initVariable("g:NERDTreeHighlightCursorline", 1)
call s:initVariable("g:NERDTreeHijackNetrw", 1)
call s:initVariable('g:NERDTreeMarkBookmarks', 1)
call s:initVariable("g:NERDTreeMouseMode", 1)
call s:initVariable("g:NERDTreeNotificationThreshold", 100)
call s:initVariable("g:NERDTreeQuitOnOpen", 0)
call s:initVariable("g:NERDTreeRespectWildIgnore", 0)
call s:initVariable("g:NERDTreeShowBookmarks", 0)
call s:initVariable("g:NERDTreeShowFiles", 1)
call s:initVariable("g:NERDTreeShowHidden", 0)
call s:initVariable("g:NERDTreeShowLineNumbers", 0)
call s:initVariable("g:NERDTreeSortDirs", 1)

if !nerdtree#runningWindows() &amp;&amp; !nerdtree#runningCygwin()
    call s:initVariable("g:NERDTreeDirArrowExpandable", "▸")
    call s:initVariable("g:NERDTreeDirArrowCollapsible", "▾")
else
    call s:initVariable("g:NERDTreeDirArrowExpandable", "+")
    call s:initVariable("g:NERDTreeDirArrowCollapsible", "~")
endif
call s:initVariable("g:NERDTreeCascadeOpenSingleChildDir", 1)
call s:initVariable("g:NERDTreeCascadeSingleChildDir", 1)

if !exists("g:NERDTreeSortOrder")
    let g:NERDTreeSortOrder = ['\/$', '*', '\.swp$',  '\.bak$', '\~$']
endif
let g:NERDTreeOldSortOrder = []

call s:initVariable("g:NERDTreeGlyphReadOnly", "RO")

" ASCII 7: bell non-printing character used to delimit items in the tree's nodes.
call s:initVariable("g:NERDTreeNodeDelimiter", "\x07")

if !exists('g:NERDTreeStatusline')

    "the exists() crap here is a hack to stop vim spazzing out when
    "loading a session that was created with an open nerd tree. It spazzes
    "because it doesnt store b:NERDTree(its a b: var, and its a hash)
    let g:NERDTreeStatusline = "%{exists('b:NERDTree')?b:NERDTree.root.path.str():''}"

endif
call s:initVariable("g:NERDTreeWinPos", "left")
call s:initVariable("g:NERDTreeWinSize", 31)

"init the shell commands that will be used to copy nodes, and remove dir trees
"
"Note: the space after the command is important
if nerdtree#runningWindows()
    call s:initVariable("g:NERDTreeRemoveDirCmd", 'rmdir /s /q ')
    call s:initVariable("g:NERDTreeCopyDirCmd", 'xcopy /s /e /i /y /q ')
    call s:initVariable("g:NERDTreeCopyFileCmd", 'copy /y ')
else
    call s:initVariable("g:NERDTreeRemoveDirCmd", 'rm -rf ')
    call s:initVariable("g:NERDTreeCopyCmd", 'cp -r ')
endif


</t>
<t tx="ekr.20181231110604.284">"SECTION: Init variable calls for key mappings {{{2
call s:initVariable("g:NERDTreeMapActivateNode", "o")
call s:initVariable("g:NERDTreeMapChangeRoot", "C")
call s:initVariable("g:NERDTreeMapChdir", "cd")
call s:initVariable("g:NERDTreeMapCloseChildren", "X")
call s:initVariable("g:NERDTreeMapCloseDir", "x")
call s:initVariable("g:NERDTreeMapDeleteBookmark", "D")
call s:initVariable("g:NERDTreeMapMenu", "m")
call s:initVariable("g:NERDTreeMapHelp", "?")
call s:initVariable("g:NERDTreeMapJumpFirstChild", "K")
call s:initVariable("g:NERDTreeMapJumpLastChild", "J")
call s:initVariable("g:NERDTreeMapJumpNextSibling", "&lt;C-j&gt;")
call s:initVariable("g:NERDTreeMapJumpParent", "p")
call s:initVariable("g:NERDTreeMapJumpPrevSibling", "&lt;C-k&gt;")
call s:initVariable("g:NERDTreeMapJumpRoot", "P")
call s:initVariable("g:NERDTreeMapOpenExpl", "e")
call s:initVariable("g:NERDTreeMapOpenInTab", "t")
call s:initVariable("g:NERDTreeMapOpenInTabSilent", "T")
call s:initVariable("g:NERDTreeMapOpenRecursively", "O")
call s:initVariable("g:NERDTreeMapOpenSplit", "i")
call s:initVariable("g:NERDTreeMapOpenVSplit", "s")
call s:initVariable("g:NERDTreeMapPreview", "g" . NERDTreeMapActivateNode)
call s:initVariable("g:NERDTreeMapPreviewSplit", "g" . NERDTreeMapOpenSplit)
call s:initVariable("g:NERDTreeMapPreviewVSplit", "g" . NERDTreeMapOpenVSplit)
call s:initVariable("g:NERDTreeMapQuit", "q")
call s:initVariable("g:NERDTreeMapRefresh", "r")
call s:initVariable("g:NERDTreeMapRefreshRoot", "R")
call s:initVariable("g:NERDTreeMapToggleBookmarks", "B")
call s:initVariable("g:NERDTreeMapToggleFiles", "F")
call s:initVariable("g:NERDTreeMapToggleFilters", "f")
call s:initVariable("g:NERDTreeMapToggleHidden", "I")
call s:initVariable("g:NERDTreeMapToggleZoom", "A")
call s:initVariable("g:NERDTreeMapUpdir", "u")
call s:initVariable("g:NERDTreeMapUpdirKeepOpen", "U")
call s:initVariable("g:NERDTreeMapCWD", "CD")
call s:initVariable("g:NERDTreeMenuDown", "j")
call s:initVariable("g:NERDTreeMenuUp", "k")

</t>
<t tx="ekr.20181231110604.285">"SECTION: Load class files{{{2
call nerdtree#loadClassFiles()

</t>
<t tx="ekr.20181231110604.286">" SECTION: Commands {{{1
"============================================================
call nerdtree#ui_glue#setupCommands()

</t>
<t tx="ekr.20181231110604.287">" SECTION: Auto commands {{{1
"============================================================
augroup NERDTree
    "Save the cursor position whenever we close the nerd tree
    exec "autocmd BufLeave ". g:NERDTreeCreator.BufNamePrefix() ."* if g:NERDTree.IsOpen() | call b:NERDTree.ui.saveScreenState() | endif"

    "disallow insert mode in the NERDTree
    exec "autocmd BufEnter ". g:NERDTreeCreator.BufNamePrefix() ."* stopinsert"
augroup END

if g:NERDTreeHijackNetrw
    augroup NERDTreeHijackNetrw
        autocmd VimEnter * silent! autocmd! FileExplorer
        au BufEnter,VimEnter * call nerdtree#checkForBrowse(expand("&lt;amatch&gt;"))
    augroup END
endif

</t>
<t tx="ekr.20181231110604.288">" SECTION: Public API {{{1
"============================================================
function! NERDTreeAddMenuItem(options)
    call g:NERDTreeMenuItem.Create(a:options)
endfunction

</t>
<t tx="ekr.20181231110604.289">function! NERDTreeAddMenuSeparator(...)
    let opts = a:0 ? a:1 : {}
    call g:NERDTreeMenuItem.CreateSeparator(opts)
endfunction

</t>
<t tx="ekr.20181231110604.29">function! s:Bookmark.validate()
    if self.path.exists()
        return 1
    else
        call s:Bookmark.CacheBookmarks(1)
        call nerdtree#echo(self.name . "now points to an invalid location. See :help NERDTreeInvalidBookmarks for info.")
        return 0
    endif
endfunction</t>
<t tx="ekr.20181231110604.290">function! NERDTreeAddSubmenu(options)
    return g:NERDTreeMenuItem.Create(a:options)
endfunction

</t>
<t tx="ekr.20181231110604.291">function! NERDTreeAddKeyMap(options)
    call g:NERDTreeKeyMap.Create(a:options)
endfunction

</t>
<t tx="ekr.20181231110604.292">function! NERDTreeRender()
    call nerdtree#renderView()
endfunction

</t>
<t tx="ekr.20181231110604.293">function! NERDTreeFocus()
    if g:NERDTree.IsOpen()
        call g:NERDTree.CursorToTreeWin()
    else
        call g:NERDTreeCreator.ToggleTabTree("")
    endif
endfunction

</t>
<t tx="ekr.20181231110604.294">function! NERDTreeCWD()

    if empty(getcwd())
        call nerdtree#echoWarning('current directory does not exist')
        return
    endif

    try
        let l:cwdPath = g:NERDTreePath.New(getcwd())
    catch /^NERDTree.InvalidArgumentsError/
        call nerdtree#echoWarning('current directory does not exist')
        return
    endtry

    call NERDTreeFocus()

    if b:NERDTree.root.path.equals(l:cwdPath)
        return
    endif

    let l:newRoot = g:NERDTreeFileNode.New(l:cwdPath, b:NERDTree)
    call b:NERDTree.changeRoot(l:newRoot)
    normal! ^
endfunction

</t>
<t tx="ekr.20181231110604.295">function! NERDTreeAddPathFilter(callback)
    call g:NERDTree.AddPathFilter(a:callback)
endfunction
</t>
<t tx="ekr.20181231110604.297">let s:tree_up_dir_line = '.. (up a dir)'
syn match NERDTreeIgnore #\~#
exec 'syn match NERDTreeIgnore #\['.g:NERDTreeGlyphReadOnly.'\]#'

"highlighting for the .. (up dir) line at the top of the tree
execute "syn match NERDTreeUp #\\V". s:tree_up_dir_line ."#"

"quickhelp syntax elements
syn match NERDTreeHelpKey #" \{1,2\}[^ ]*:#ms=s+2,me=e-1
syn match NERDTreeHelpKey #" \{1,2\}[^ ]*,#ms=s+2,me=e-1
syn match NERDTreeHelpTitle #" .*\~$#ms=s+2,me=e-1
syn match NERDTreeToggleOn #(on)#ms=s+1,he=e-1
syn match NERDTreeToggleOff #(off)#ms=e-3,me=e-1
syn match NERDTreeHelpCommand #" :.\{-}\&gt;#hs=s+3
syn match NERDTreeHelp  #^".*# contains=NERDTreeHelpKey,NERDTreeHelpTitle,NERDTreeIgnore,NERDTreeToggleOff,NERDTreeToggleOn,NERDTreeHelpCommand

"highlighting for sym links
syn match NERDTreeLinkTarget #-&gt;.*# containedin=NERDTreeDir,NERDTreeFile
syn match NERDTreeLinkFile #.* -&gt;#me=e-3 containedin=NERDTreeFile
syn match NERDTreeLinkDir #.*/ -&gt;#me=e-3 containedin=NERDTreeDir

"highlighing for directory nodes and file nodes
syn match NERDTreeDirSlash #/# containedin=NERDTreeDir

exec 'syn match NERDTreeClosable #' . escape(g:NERDTreeDirArrowCollapsible, '~') . '\ze .*/# containedin=NERDTreeDir,NERDTreeFile'
exec 'syn match NERDTreeOpenable #' . escape(g:NERDTreeDirArrowExpandable, '~') . '\ze .*/# containedin=NERDTreeDir,NERDTreeFile'

let s:dirArrows = escape(g:NERDTreeDirArrowCollapsible, '~]\-').escape(g:NERDTreeDirArrowExpandable, '~]\-')
exec 'syn match NERDTreeDir #[^'.s:dirArrows.' ].*/#'
syn match NERDTreeExecFile  #^ .*\*\($\| \)# contains=NERDTreeRO,NERDTreeBookmark
exec 'syn match NERDTreeFile  #^[^"\.'.s:dirArrows.'] *[^'.s:dirArrows.']*# contains=NERDTreeLink,NERDTreeRO,NERDTreeBookmark,NERDTreeExecFile'

"highlighting for readonly files
exec 'syn match NERDTreeRO # *\zs.*\ze \['.g:NERDTreeGlyphReadOnly.'\]# contains=NERDTreeIgnore,NERDTreeBookmark,NERDTreeFile'

syn match NERDTreeFlags #^ *\zs\[[^\]]*\]# containedin=NERDTreeFile,NERDTreeExecFile
syn match NERDTreeFlags #\[[^\]]*\]# containedin=NERDTreeDir

"highlighing to conceal the delimiter around the file/dir name
if has("conceal")
    exec 'syn match NERDTreeNodeDelimiters #\%d' . char2nr(g:NERDTreeNodeDelimiter) . '# conceal containedin=ALL'
    setlocal conceallevel=3 concealcursor=nvic
else
    exec 'syn match NERDTreeNodeDelimiters #\%d' . char2nr(g:NERDTreeNodeDelimiter) . '# containedin=ALL'
    hi! link NERDTreeNodeDelimiters Ignore
endif

syn match NERDTreeCWD #^[&lt;/].*$#

"highlighting for bookmarks
syn match NERDTreeBookmark # {.*}#hs=s+1

"highlighting for the bookmarks table
syn match NERDTreeBookmarksLeader #^&gt;#
syn match NERDTreeBookmarksHeader #^&gt;-\+Bookmarks-\+$# contains=NERDTreeBookmarksLeader
syn match NERDTreeBookmarkName #^&gt;.\{-} #he=e-1 contains=NERDTreeBookmarksLeader
syn match NERDTreeBookmark #^&gt;.*$# contains=NERDTreeBookmarksLeader,NERDTreeBookmarkName,NERDTreeBookmarksHeader

hi def link NERDTreePart Special
hi def link NERDTreePartFile Type
hi def link NERDTreeExecFile Title
hi def link NERDTreeDirSlash Identifier

hi def link NERDTreeBookmarksHeader statement
hi def link NERDTreeBookmarksLeader ignore
hi def link NERDTreeBookmarkName Identifier
hi def link NERDTreeBookmark normal

hi def link NERDTreeHelp String
hi def link NERDTreeHelpKey Identifier
hi def link NERDTreeHelpCommand Identifier
hi def link NERDTreeHelpTitle Macro
hi def link NERDTreeToggleOn Question
hi def link NERDTreeToggleOff WarningMsg

hi def link NERDTreeLinkTarget Type
hi def link NERDTreeLinkFile Macro
hi def link NERDTreeLinkDir Macro

hi def link NERDTreeDir Directory
hi def link NERDTreeUp Directory
hi def link NERDTreeFile Normal
hi def link NERDTreeCWD Statement
hi def link NERDTreeOpenable Directory
hi def link NERDTreeClosable Directory
hi def link NERDTreeIgnore ignore
hi def link NERDTreeRO WarningMsg
hi def link NERDTreeBookmark Statement
hi def link NERDTreeFlags Number

hi def link NERDTreeCurrentNode Search
</t>
<t tx="ekr.20181231110604.3">if exists("g:loaded_nerdtree_autoload")
    finish
endif
let g:loaded_nerdtree_autoload = 1

@others

" vim: set sw=4 sts=4 et fdm=marker:
</t>
<t tx="ekr.20181231110604.30">" Class method to write all bookmarks to the bookmarks file
function! s:Bookmark.Write()
    let bookmarkStrings = []
    for i in s:Bookmark.Bookmarks()
        call add(bookmarkStrings, i.name . ' ' . fnamemodify(i.path.str(), ':~'))
    endfor

    "add a blank line before the invalid ones
    call add(bookmarkStrings, "")

    for j in s:Bookmark.InvalidBookmarks()
        call add(bookmarkStrings, j)
    endfor

    try
        call writefile(bookmarkStrings, g:NERDTreeBookmarksFile)
    catch
        call nerdtree#echoError("Failed to write bookmarks file. Make sure g:NERDTreeBookmarksFile points to a valid location.")
    endtry
endfunction</t>
<t tx="ekr.20181231110604.31">&lt;&lt; docstring &gt;&gt;

let s:Creator = {}
let g:NERDTreeCreator = s:Creator

@others

" vim: set sw=4 sts=4 et fdm=marker:
</t>
<t tx="ekr.20181231110604.32">" ============================================================================
" CLASS: Creator
"
" This class is responsible for creating NERDTree instances.  The new NERDTree
" may be a tab tree, a window tree, or a mirrored tree.  In the process of
" creating a NERDTree, it sets up all of the window and buffer options and key
" mappings etc.
" ============================================================================</t>
<t tx="ekr.20181231110604.33">function! s:Creator._bindMappings()
    "make &lt;cr&gt; do the same as the activate node mapping
    nnoremap &lt;silent&gt; &lt;buffer&gt; &lt;cr&gt; :call nerdtree#ui_glue#invokeKeyMap(g:NERDTreeMapActivateNode)&lt;cr&gt;

    call g:NERDTreeKeyMap.BindAll()

    command! -buffer -nargs=? Bookmark :call nerdtree#ui_glue#bookmarkNode('&lt;args&gt;')
    command! -buffer -complete=customlist,nerdtree#completeBookmarks -nargs=1 RevealBookmark :call nerdtree#ui_glue#revealBookmark('&lt;args&gt;')
    command! -buffer -complete=customlist,nerdtree#completeBookmarks -nargs=1 OpenBookmark call nerdtree#ui_glue#openBookmark('&lt;args&gt;')
    command! -buffer -complete=customlist,nerdtree#completeBookmarks -nargs=* ClearBookmarks call nerdtree#ui_glue#clearBookmarks('&lt;args&gt;')
    command! -buffer -complete=customlist,nerdtree#completeBookmarks -nargs=+ BookmarkToRoot call g:NERDTreeBookmark.ToRoot('&lt;args&gt;', b:NERDTree)
    command! -buffer -nargs=0 ClearAllBookmarks call g:NERDTreeBookmark.ClearAll() &lt;bar&gt; call b:NERDTree.render()
    command! -buffer -nargs=0 ReadBookmarks call g:NERDTreeBookmark.CacheBookmarks(0) &lt;bar&gt; call b:NERDTree.render()
    command! -buffer -nargs=0 WriteBookmarks call g:NERDTreeBookmark.Write()
endfunction</t>
<t tx="ekr.20181231110604.34">function! s:Creator._broadcastInitEvent()
    silent doautocmd User NERDTreeInit
endfunction</t>
<t tx="ekr.20181231110604.35">function! s:Creator.BufNamePrefix()
    return 'NERD_tree_'
endfunction</t>
<t tx="ekr.20181231110604.36">function! s:Creator.CreateTabTree(name)
    let creator = s:Creator.New()
    call creator.createTabTree(a:name)
endfunction</t>
<t tx="ekr.20181231110604.37">" name: the name of a bookmark or a directory
function! s:Creator.createTabTree(name)
    let l:path = self._pathForString(a:name)

    " Abort if an exception was thrown (i.e., if the bookmark or directory
    " does not exist).
    if empty(l:path)
        return
    endif

    " Obey the user's preferences for changing the working directory.
    if g:NERDTreeChDirMode != 0
        call l:path.changeToDir()
    endif

    if g:NERDTree.ExistsForTab()
        call g:NERDTree.Close()
        call self._removeTreeBufForTab()
    endif

    call self._createTreeWin()
    call self._createNERDTree(l:path, 'tab')
    call b:NERDTree.render()
    call b:NERDTree.root.putCursorHere(0, 0)

    call self._broadcastInitEvent()
endfunction</t>
<t tx="ekr.20181231110604.38">function! s:Creator.CreateWindowTree(dir)
    let creator = s:Creator.New()
    call creator.createWindowTree(a:dir)
endfunction</t>
<t tx="ekr.20181231110604.39">function! s:Creator.createWindowTree(dir)
    try
        let path = g:NERDTreePath.New(a:dir)
    catch /^NERDTree.InvalidArgumentsError/
        call nerdtree#echo("Invalid directory name:" . a:name)
        return
    endtry

    "we want the directory buffer to disappear when we do the :edit below
    setlocal bufhidden=wipe

    let previousBuf = expand("#")

    "we need a unique name for each window tree buffer to ensure they are
    "all independent
    exec g:NERDTreeCreatePrefix . " edit " . self._nextBufferName()

    call self._createNERDTree(path, "window")
    let b:NERDTree._previousBuf = bufnr(previousBuf)
    call self._setCommonBufOptions()

    call b:NERDTree.render()

    call self._broadcastInitEvent()
endfunction</t>
<t tx="ekr.20181231110604.4">if exists("g:loaded_nerdtree_ui_glue_autoload")
    finish
endif
let g:loaded_nerdtree_ui_glue_autoload = 1

" vim: set sw=4 sts=4 et fdm=marker:
</t>
<t tx="ekr.20181231110604.40">function! s:Creator._createNERDTree(path, type)
    let b:NERDTree = g:NERDTree.New(a:path, a:type)

    " TODO: This assignment is kept for compatibility reasons.  Many other
    " plugins use "b:NERDTreeRoot" instead of "b:NERDTree.root".  Remove this
    " assignment in the future.
    let b:NERDTreeRoot = b:NERDTree.root

    call b:NERDTree.root.open()
endfunction</t>
<t tx="ekr.20181231110604.41">function! s:Creator.CreateMirror()
    let creator = s:Creator.New()
    call creator.createMirror()
endfunction</t>
<t tx="ekr.20181231110604.42">function! s:Creator.createMirror()
    "get the names off all the nerd tree buffers
    let treeBufNames = []
    for i in range(1, tabpagenr("$"))
        let nextName = self._tabpagevar(i, 'NERDTreeBufName')
        if nextName != -1 &amp;&amp; (!exists("t:NERDTreeBufName") || nextName != t:NERDTreeBufName)
            call add(treeBufNames, nextName)
        endif
    endfor
    let treeBufNames = self._uniq(treeBufNames)

    "map the option names (that the user will be prompted with) to the nerd
    "tree buffer names
    let options = {}
    let i = 0
    while i &lt; len(treeBufNames)
        let bufName = treeBufNames[i]
        let treeRoot = getbufvar(bufName, "NERDTree").root
        let options[i+1 . '. ' . treeRoot.path.str() . '  (buf name: ' . bufName . ')'] = bufName
        let i = i + 1
    endwhile

    "work out which tree to mirror, if there is more than 1 then ask the user
    let bufferName = ''
    if len(keys(options)) &gt; 1
        let choices = ["Choose a tree to mirror"]
        let choices = extend(choices, sort(keys(options)))
        let choice = inputlist(choices)
        if choice &lt; 1 || choice &gt; len(options) || choice ==# ''
            return
        endif

        let bufferName = options[sort(keys(options))[choice-1]]
    elseif len(keys(options)) ==# 1
        let bufferName = values(options)[0]
    else
        call nerdtree#echo("No trees to mirror")
        return
    endif

    if g:NERDTree.ExistsForTab() &amp;&amp; g:NERDTree.IsOpen()
        call g:NERDTree.Close()
    endif

    let t:NERDTreeBufName = bufferName
    call self._createTreeWin()
    exec 'buffer ' .  bufferName
    if !&amp;hidden
        call b:NERDTree.render()
    endif
endfunction</t>
<t tx="ekr.20181231110604.43">" Initialize the NERDTree window.  Open the window, size it properly, set all
" local options, etc.
function! s:Creator._createTreeWin()
    let l:splitLocation = g:NERDTreeWinPos ==# 'left' ? 'topleft ' : 'botright '
    let l:splitSize = g:NERDTreeWinSize

    if !g:NERDTree.ExistsForTab()
        let t:NERDTreeBufName = self._nextBufferName()
        silent! execute l:splitLocation . 'vertical ' . l:splitSize . ' new'
        silent! execute 'edit ' . t:NERDTreeBufName
    else
        silent! execute l:splitLocation . 'vertical ' . l:splitSize . ' split'
        silent! execute 'buffer ' . t:NERDTreeBufName
    endif

    call self._setCommonBufOptions()

    if has('patch-7.4.1925')
        clearjumps
    endif

    setlocal winfixwidth
endfunction</t>
<t tx="ekr.20181231110604.44">function! s:Creator._isBufHidden(nr)
    redir =&gt; bufs
    silent ls!
    redir END

    return bufs =~ a:nr . '..h'
endfunction</t>
<t tx="ekr.20181231110604.45">function! s:Creator.New()
    let newCreator = copy(self)
    return newCreator
endfunction</t>
<t tx="ekr.20181231110604.46">" returns the buffer name for the next nerd tree
function! s:Creator._nextBufferName()
    let name = s:Creator.BufNamePrefix() . self._nextBufferNumber()
    return name
endfunction</t>
<t tx="ekr.20181231110604.47">" the number to add to the nerd tree buffer name to make the buf name unique
function! s:Creator._nextBufferNumber()
    if !exists("s:Creator._NextBufNum")
        let s:Creator._NextBufNum = 1
    else
        let s:Creator._NextBufNum += 1
    endif

    return s:Creator._NextBufNum
endfunction</t>
<t tx="ekr.20181231110604.48">" find a bookmark or adirectory for the given string
function! s:Creator._pathForString(str)
    let path = {}
    if g:NERDTreeBookmark.BookmarkExistsFor(a:str)
        let path = g:NERDTreeBookmark.BookmarkFor(a:str).path
    else
        let dir = a:str ==# '' ? getcwd() : a:str

        "hack to get an absolute path if a relative path is given
        if dir =~# '^\.'
            let dir = getcwd() . g:NERDTreePath.Slash() . dir
        endif
        let dir = g:NERDTreePath.Resolve(dir)

        try
            let path = g:NERDTreePath.New(dir)
        catch /^NERDTree.InvalidArgumentsError/
            call nerdtree#echo("No bookmark or directory found for: " . a:str)
            return {}
        endtry
    endif
    if !path.isDirectory
        let path = path.getParent()
    endif

    return path
endfunction</t>
<t tx="ekr.20181231110604.49">function! s:Creator._removeTreeBufForTab()
    let buf = bufnr(t:NERDTreeBufName)

    "if &amp;hidden is not set then it will already be gone
    if buf != -1

        "nerdtree buf may be mirrored/displayed elsewhere
        if self._isBufHidden(buf)
            exec "bwipeout " . buf
        endif

    endif

    unlet t:NERDTreeBufName
endfunction</t>
<t tx="ekr.20181231110604.5"></t>
<t tx="ekr.20181231110604.50">function! s:Creator._setCommonBufOptions()

    " Options for a non-file/control buffer.
    setlocal bufhidden=hide
    setlocal buftype=nofile
    setlocal noswapfile

    " Options for controlling buffer/window appearance.
    setlocal foldcolumn=0
    setlocal foldmethod=manual
    setlocal nobuflisted
    setlocal nofoldenable
    setlocal nolist
    setlocal nospell
    setlocal nowrap

    if g:NERDTreeShowLineNumbers
        setlocal nu
    else
        setlocal nonu
        if v:version &gt;= 703
            setlocal nornu
        endif
    endif

    iabc &lt;buffer&gt;

    if g:NERDTreeHighlightCursorline
        setlocal cursorline
    endif

    call self._setupStatusline()
    call self._bindMappings()

    setlocal filetype=nerdtree
endfunction</t>
<t tx="ekr.20181231110604.51">function! s:Creator._setupStatusline()
    if g:NERDTreeStatusline != -1
        let &amp;l:statusline = g:NERDTreeStatusline
    endif
endfunction</t>
<t tx="ekr.20181231110604.52">function! s:Creator._tabpagevar(tabnr, var)
    let currentTab = tabpagenr()
    let old_ei = &amp;ei
    set ei=all

    exec "tabnext " . a:tabnr
    let v = -1
    if exists('t:' . a:var)
        exec 'let v = t:' . a:var
    endif
    exec "tabnext " . currentTab

    let &amp;ei = old_ei

    return v
endfunction</t>
<t tx="ekr.20181231110604.53">function! s:Creator.ToggleTabTree(dir)
    let creator = s:Creator.New()
    call creator.toggleTabTree(a:dir)
endfunction</t>
<t tx="ekr.20181231110604.54">" Toggles the NERD tree. I.e the NERD tree is open, it is closed, if it is
" closed it is restored or initialized (if it doesnt exist)
"
" Args:
" dir: the full path for the root node (is only used if the NERD tree is being
" initialized.
function! s:Creator.toggleTabTree(dir)
    if g:NERDTree.ExistsForTab()
        if !g:NERDTree.IsOpen()
            call self._createTreeWin()
            if !&amp;hidden
                call b:NERDTree.render()
            endif
            call b:NERDTree.ui.restoreScreenState()
        else
            call g:NERDTree.Close()
        endif
    else
        call self.createTabTree(a:dir)
    endif
endfunction</t>
<t tx="ekr.20181231110604.55">" returns a:list without duplicates
function! s:Creator._uniq(list)
  let uniqlist = []
  for elem in a:list
    if index(uniqlist, elem) ==# -1
      let uniqlist += [elem]
    endif
  endfor
  return uniqlist
endfunction</t>
<t tx="ekr.20181231110604.56">"CLASS: Event
"============================================================

let s:Event = {}
let g:NERDTreeEvent = s:Event

function! s:Event.New(nerdtree, subject, action, params) abort
    let newObj = copy(self)
    let newObj.nerdtree = a:nerdtree
    let newObj.subject = a:subject
    let newObj.action = a:action
    let newObj.params = a:params
    return newObj
endfunction
</t>
<t tx="ekr.20181231110604.57">"CLASS: FlagSet
"============================================================

let s:FlagSet = {}
let g:NERDTreeFlagSet = s:FlagSet

@others

" vim: set sw=4 sts=4 et fdm=marker:
</t>
<t tx="ekr.20181231110604.58">function! s:FlagSet.addFlag(scope, flag)
    let flags = self._flagsForScope(a:scope)
    if index(flags, a:flag) == -1
        call add(flags, a:flag)
    end
endfunction</t>
<t tx="ekr.20181231110604.59">function! s:FlagSet.clearFlags(scope)
    let self._flags[a:scope] = []
endfunction</t>
<t tx="ekr.20181231110604.6">&lt;&lt; docstring &gt;&gt;

let s:Bookmark = {}
let g:NERDTreeBookmark = s:Bookmark

@others

" vim: set sw=4 sts=4 et fdm=marker:
</t>
<t tx="ekr.20181231110604.60">function! s:FlagSet._flagsForScope(scope)
    if !has_key(self._flags, a:scope)
        let self._flags[a:scope] = []
    endif
    return self._flags[a:scope]
endfunction</t>
<t tx="ekr.20181231110604.61">function! s:FlagSet.New()
    let newObj = copy(self)
    let newObj._flags = {}
    return newObj
endfunction</t>
<t tx="ekr.20181231110604.62">function! s:FlagSet.removeFlag(scope, flag)
    let flags = self._flagsForScope(a:scope)

    let i = index(flags, a:flag)
    if i &gt;= 0
        call remove(flags, i)
    endif
endfunction</t>
<t tx="ekr.20181231110604.63">function! s:FlagSet.renderToString()
    let flagstring = ""
    for i in values(self._flags)
        let flagstring .= join(i)
    endfor

    if len(flagstring) == 0
        return ""
    endif

    return '[' . flagstring . ']'
endfunction</t>
<t tx="ekr.20181231110604.64">"CLASS: KeyMap
"============================================================

let s:KeyMap = {}
let g:NERDTreeKeyMap = s:KeyMap
let s:keyMaps = {}

@others

" vim: set sw=4 sts=4 et fdm=marker:
</t>
<t tx="ekr.20181231110604.65">function! s:KeyMap.All()
    let sortedKeyMaps = values(s:keyMaps)
    call sort(sortedKeyMaps, s:KeyMap.Compare, s:KeyMap)

    return sortedKeyMaps
endfunction</t>
<t tx="ekr.20181231110604.66">function! s:KeyMap.Compare(keyMap1, keyMap2)

    if a:keyMap1.key &gt;? a:keyMap2.key
        return 1
    endif

    if a:keyMap1.key &lt;? a:keyMap2.key
        return -1
    endif

    return 0
endfunction</t>
<t tx="ekr.20181231110604.67">function! s:KeyMap.FindFor(key, scope)
    return get(s:keyMaps, a:key . a:scope, {})
endfunction</t>
<t tx="ekr.20181231110604.68">function! s:KeyMap.BindAll()
    for i in values(s:keyMaps)
        call i.bind()
    endfor
endfunction</t>
<t tx="ekr.20181231110604.69">function! s:KeyMap.bind()
    " If the key sequence we're trying to map contains any '&lt;&gt;' notation, we
    " must replace each of the '&lt;' characters with '&lt;lt&gt;' to ensure the string
    " is not translated into its corresponding keycode during the later part
    " of the map command below
    " :he &lt;&gt;
    let specialNotationRegex = '\m&lt;\([[:alnum:]_-]\+&gt;\)'
    if self.key =~# specialNotationRegex
        let keymapInvokeString = substitute(self.key, specialNotationRegex, '&lt;lt&gt;\1', 'g')
    else
        let keymapInvokeString = self.key
    endif

    let premap = self.key == "&lt;LeftRelease&gt;" ? " &lt;LeftRelease&gt;" : " "

    exec 'nnoremap &lt;buffer&gt; &lt;silent&gt; '. self.key . premap . ':call nerdtree#ui_glue#invokeKeyMap("'. keymapInvokeString .'")&lt;cr&gt;'
endfunction</t>
<t tx="ekr.20181231110604.7">" CLASS: Bookmark
"
" The Bookmark class serves two purposes:
"   (1) It is the top-level prototype for new, concrete Bookmark objects.
"   (2) It provides an interface for client code to query and manipulate the
"       global list of Bookmark objects within the current Vim session.
" ============================================================================</t>
<t tx="ekr.20181231110604.70">function! s:KeyMap.Remove(key, scope)
    return remove(s:keyMaps, a:key . a:scope)
endfunction</t>
<t tx="ekr.20181231110604.71">"Call the KeyMaps callback function
function! s:KeyMap.invoke(...)
    let Callback = function(self.callback)
    if a:0
        call Callback(a:1)
    else
        call Callback()
    endif
endfunction</t>
<t tx="ekr.20181231110604.72">"Find a keymapping for a:key and the current scope invoke it.
"
"Scope is determined as follows:
"   * if the cursor is on a dir node then "DirNode"
"   * if the cursor is on a file node then "FileNode"
"   * if the cursor is on a bookmark then "Bookmark"
"
"If a keymap has the scope of "all" then it will be called if no other keymap
"is found for a:key and the scope.
function! s:KeyMap.Invoke(key)

    "required because clicking the command window below another window still
    "invokes the &lt;LeftRelease&gt; mapping - but changes the window cursor
    "is in first
    "
    "TODO: remove this check when the vim bug is fixed
    if !g:NERDTree.ExistsForBuf()
        return {}
    endif

    let node = g:NERDTreeFileNode.GetSelected()
    if !empty(node)

        "try file node
        if !node.path.isDirectory
            let km = s:KeyMap.FindFor(a:key, "FileNode")
            if !empty(km)
                return km.invoke(node)
            endif
        endif

        "try dir node
        if node.path.isDirectory
            let km = s:KeyMap.FindFor(a:key, "DirNode")
            if !empty(km)
                return km.invoke(node)
            endif
        endif

        "try generic node
        let km = s:KeyMap.FindFor(a:key, "Node")
        if !empty(km)
            return km.invoke(node)
        endif

    endif

    "try bookmark
    let bm = g:NERDTreeBookmark.GetSelected()
    if !empty(bm)
        let km = s:KeyMap.FindFor(a:key, "Bookmark")
        if !empty(km)
            return km.invoke(bm)
        endif
    endif

    "try all
    let km = s:KeyMap.FindFor(a:key, "all")
    if !empty(km)
        return km.invoke()
    endif
endfunction</t>
<t tx="ekr.20181231110604.73">function! s:KeyMap.Create(options)
    let opts = extend({'scope': 'all', 'quickhelpText': ''}, copy(a:options))

    "dont override other mappings unless the 'override' option is given
    if get(opts, 'override', 0) == 0 &amp;&amp; !empty(s:KeyMap.FindFor(opts['key'], opts['scope']))
        return
    end

    let newKeyMap = copy(self)
    let newKeyMap.key = opts['key']
    let newKeyMap.quickhelpText = opts['quickhelpText']
    let newKeyMap.callback = opts['callback']
    let newKeyMap.scope = opts['scope']

    call s:KeyMap.Add(newKeyMap)
endfunction</t>
<t tx="ekr.20181231110604.74">function! s:KeyMap.Add(keymap)
    let s:keyMaps[a:keymap.key . a:keymap.scope] = a:keymap
endfunction</t>
<t tx="ekr.20181231110604.75">"CLASS: MenuController
"============================================================

let s:MenuController = {}
let g:NERDTreeMenuController = s:MenuController

@others

" vim: set sw=4 sts=4 et fdm=marker:
</t>
<t tx="ekr.20181231110604.76">"create a new menu controller that operates on the given menu items
function! s:MenuController.New(menuItems)
    let newMenuController =  copy(self)
    if a:menuItems[0].isSeparator()
        let newMenuController.menuItems = a:menuItems[1:-1]
    else
        let newMenuController.menuItems = a:menuItems
    endif
    return newMenuController
endfunction</t>
<t tx="ekr.20181231110604.77">" Enter the main loop of the NERDTree menu, prompting the user to select
" a menu item.
function! s:MenuController.showMenu()
    call self._saveOptions()

    try
        let self.selection = 0
        let l:done = 0

        while !l:done
            redraw!
            call self._echoPrompt()

            let l:key = nr2char(getchar())
            let l:done = self._handleKeypress(l:key)
        endwhile
    finally
        call self._restoreOptions()

        " Redraw when "Ctrl-C" or "Esc" is received.
        if !l:done || self.selection == -1
            redraw!
        endif
    endtry

    if self.selection != -1
        let l:m = self._current()
        call l:m.execute()
    endif
endfunction</t>
<t tx="ekr.20181231110604.78">function! s:MenuController._echoPrompt()
    echo "NERDTree Menu. Use " . g:NERDTreeMenuDown . "/" . g:NERDTreeMenuUp . "/enter and the shortcuts indicated"
    echo "=========================================================="

    for i in range(0, len(self.menuItems)-1)
        if self.selection == i
            echo "&gt; " . self.menuItems[i].text
        else
            echo "  " . self.menuItems[i].text
        endif
    endfor
endfunction</t>
<t tx="ekr.20181231110604.79">"get the MenuItem that is currently selected
function! s:MenuController._current()
    return self.menuItems[self.selection]
endfunction</t>
<t tx="ekr.20181231110604.8">function! s:Bookmark.activate(nerdtree, ...)
    call self.open(a:nerdtree, a:0 ? a:1 : {})
endfunction</t>
<t tx="ekr.20181231110604.80">"change the selection (if appropriate) and return 1 if the user has made
"their choice, 0 otherwise
function! s:MenuController._handleKeypress(key)
    if a:key == g:NERDTreeMenuDown
        call self._cursorDown()
    elseif a:key == g:NERDTreeMenuUp
        call self._cursorUp()
    elseif a:key == nr2char(27) "escape
        let self.selection = -1
        return 1
    elseif a:key == "\r" || a:key == "\n" "enter and ctrl-j
        return 1
    else
        let index = self._nextIndexFor(a:key)
        if index != -1
            let self.selection = index
            if len(self._allIndexesFor(a:key)) == 1
                return 1
            endif
        endif
    endif

    return 0
endfunction</t>
<t tx="ekr.20181231110604.81">"get indexes to all menu items with the given shortcut
function! s:MenuController._allIndexesFor(shortcut)
    let toReturn = []

    for i in range(0, len(self.menuItems)-1)
        if self.menuItems[i].shortcut == a:shortcut
            call add(toReturn, i)
        endif
    endfor

    return toReturn
endfunction</t>
<t tx="ekr.20181231110604.82">"get the index to the next menu item with the given shortcut, starts from the
"current cursor location and wraps around to the top again if need be
function! s:MenuController._nextIndexFor(shortcut)
    for i in range(self.selection+1, len(self.menuItems)-1)
        if self.menuItems[i].shortcut == a:shortcut
            return i
        endif
    endfor

    for i in range(0, self.selection)
        if self.menuItems[i].shortcut == a:shortcut
            return i
        endif
    endfor

    return -1
endfunction</t>
<t tx="ekr.20181231110604.83">"sets &amp;cmdheight to whatever is needed to display the menu
function! s:MenuController._setCmdheight()
    let &amp;cmdheight = len(self.menuItems) + 3
endfunction</t>
<t tx="ekr.20181231110604.84">"set any vim options that are required to make the menu work (saving their old
"values)
function! s:MenuController._saveOptions()
    let self._oldLazyredraw = &amp;lazyredraw
    let self._oldCmdheight = &amp;cmdheight
    set nolazyredraw
    call self._setCmdheight()
endfunction</t>
<t tx="ekr.20181231110604.85">"restore the options we saved in _saveOptions()
function! s:MenuController._restoreOptions()
    let &amp;cmdheight = self._oldCmdheight
    let &amp;lazyredraw = self._oldLazyredraw
endfunction</t>
<t tx="ekr.20181231110604.86">"move the cursor to the next menu item, skipping separators
function! s:MenuController._cursorDown()
    let done = 0
    while !done
        if self.selection &lt; len(self.menuItems)-1
            let self.selection += 1
        else
            let self.selection = 0
        endif

        if !self._current().isSeparator()
            let done = 1
        endif
    endwhile
endfunction</t>
<t tx="ekr.20181231110604.87">"move the cursor to the previous menu item, skipping separators
function! s:MenuController._cursorUp()
    let done = 0
    while !done
        if self.selection &gt; 0
            let self.selection -= 1
        else
            let self.selection = len(self.menuItems)-1
        endif

        if !self._current().isSeparator()
            let done = 1
        endif
    endwhile
endfunction</t>
<t tx="ekr.20181231110604.88">"CLASS: MenuItem
"============================================================

let s:MenuItem = {}
let g:NERDTreeMenuItem = s:MenuItem

@others

" vim: set sw=4 sts=4 et fdm=marker:
</t>
<t tx="ekr.20181231110604.89">"get all top level menu items
function! s:MenuItem.All()
    if !exists("s:menuItems")
        let s:menuItems = []
    endif
    return s:menuItems
endfunction</t>
<t tx="ekr.20181231110604.9">" Class method to add a new bookmark to the list, if a previous bookmark exists
" with the same name, just update the path for that bookmark
function! s:Bookmark.AddBookmark(name, path)
    for i in s:Bookmark.Bookmarks()
        if i.name ==# a:name
            let i.path = a:path
            return
        endif
    endfor
    call add(s:Bookmark.Bookmarks(), s:Bookmark.New(a:name, a:path))
endfunction</t>
<t tx="ekr.20181231110604.90">"get all top level menu items that are currently enabled
function! s:MenuItem.AllEnabled()
    let toReturn = []
    for i in s:MenuItem.All()
        if i.enabled()
            call add(toReturn, i)
        endif
    endfor
    return toReturn
endfunction</t>
<t tx="ekr.20181231110604.91">"make a new menu item and add it to the global list
function! s:MenuItem.Create(options)
    let newMenuItem = copy(self)

    let newMenuItem.text = a:options['text']
    let newMenuItem.shortcut = a:options['shortcut']
    let newMenuItem.children = []

    let newMenuItem.isActiveCallback = -1
    if has_key(a:options, 'isActiveCallback')
        let newMenuItem.isActiveCallback = a:options['isActiveCallback']
    endif

    let newMenuItem.callback = -1
    if has_key(a:options, 'callback')
        let newMenuItem.callback = a:options['callback']
    endif

    if has_key(a:options, 'parent')
        call add(a:options['parent'].children, newMenuItem)
    else
        call add(s:MenuItem.All(), newMenuItem)
    endif

    return newMenuItem
endfunction</t>
<t tx="ekr.20181231110604.92">"make a new separator menu item and add it to the global list
function! s:MenuItem.CreateSeparator(options)
    let standard_options = { 'text': '--------------------',
                \ 'shortcut': -1,
                \ 'callback': -1 }
    let options = extend(a:options, standard_options, "force")

    return s:MenuItem.Create(options)
endfunction</t>
<t tx="ekr.20181231110604.93">"make a new submenu and add it to global list
function! s:MenuItem.CreateSubmenu(options)
    let standard_options = { 'callback': -1 }
    let options = extend(a:options, standard_options, "force")

    return s:MenuItem.Create(options)
endfunction</t>
<t tx="ekr.20181231110604.94">"return 1 if this menu item should be displayed
"
"delegates off to the isActiveCallback, and defaults to 1 if no callback was
"specified
function! s:MenuItem.enabled()
    if self.isActiveCallback != -1
        return {self.isActiveCallback}()
    endif
    return 1
endfunction</t>
<t tx="ekr.20181231110604.95">"perform the action behind this menu item, if this menuitem has children then
"display a new menu for them, otherwise deletegate off to the menuitem's
"callback
function! s:MenuItem.execute()
    if len(self.children)
        let mc = g:NERDTreeMenuController.New(self.children)
        call mc.showMenu()
    else
        if self.callback != -1
            call {self.callback}()
        endif
    endif
endfunction</t>
<t tx="ekr.20181231110604.96">"return 1 if this menuitem is a separator
function! s:MenuItem.isSeparator()
    return self.callback == -1 &amp;&amp; self.children == []
endfunction</t>
<t tx="ekr.20181231110604.97">"return 1 if this menuitem is a submenu
function! s:MenuItem.isSubmenu()
    return self.callback == -1 &amp;&amp; !empty(self.children)
endfunction</t>
<t tx="ekr.20181231110604.98">"CLASS: NERDTree
"============================================================

let s:NERDTree = {}
let g:NERDTree = s:NERDTree

@others

" vim: set sw=4 sts=4 et fdm=marker:
</t>
<t tx="ekr.20181231110604.99">function! s:NERDTree.AddPathFilter(callback)
    call add(s:NERDTree.PathFilters(), a:callback)
endfunction</t>
<t tx="ekr.20181231110653.1"></t>
<t tx="ekr.20181231110658.1"></t>
<t tx="ekr.20181231110705.1">'''
Select from the cursor to a line starting with "endfunction",
then do 'extract' command.
'''
s = c.p.b
w = c.frame.body.wrapper
i = w.getInsertPoint()
target = '\nendfunction'
j = s.find(target, i)
if j &gt; -1:
    j += len(target)
    j = g.skip_line(s,j)
    w.setSelectionRange(i, j, insert=i)
    c.frame.body.wrapper.setSelectionRange(i, j, insert=i)
    c.k.simulateCommand('extract')
</t>
<t tx="ekr.20181231110852.1">    return '5.0.0'
endfunction</t>
<t tx="ekr.20181231110912.1">"============================================================</t>
<t tx="ekr.20181231110917.1">"inits a window tree in the current buffer if appropriate
function! nerdtree#checkForBrowse(dir)
    if !isdirectory(a:dir)
        return
    endif

    if s:reuseWin(a:dir)
        return
    endif

    call g:NERDTreeCreator.CreateWindowTree(a:dir)
endfunction</t>
<t tx="ekr.20181231110922.1">"finds a NERDTree buffer with root of dir, and opens it.
function! s:reuseWin(dir) abort
    let path = g:NERDTreePath.New(fnamemodify(a:dir, ":p"))

    for i in range(1, bufnr("$"))
        unlet! nt
        let nt = getbufvar(i, "NERDTree")
        if empty(nt)
            continue
        endif

        if nt.isWinTree() &amp;&amp; nt.root.path.equals(path)
            call nt.setPreviousBuf(bufnr("#"))
            exec "buffer " . i
            return 1
        endif
    endfor

    return 0
endfunction</t>
<t tx="ekr.20181231110923.1">" completion function for the bookmark commands
function! nerdtree#completeBookmarks(A,L,P)
    return filter(g:NERDTreeBookmark.BookmarkNames(), 'v:val =~# "^' . a:A . '"')
endfunction</t>
<t tx="ekr.20181231110925.1">function! nerdtree#compareNodes(n1, n2)
    return a:n1.path.compareTo(a:n2.path)
endfunction</t>
<t tx="ekr.20181231110927.1">function! nerdtree#compareNodesBySortKey(n1, n2)
    let sortKey1 = a:n1.path.getSortKey()
    let sortKey2 = a:n2.path.getSortKey()
    let i = 0
    while i &lt; min([len(sortKey1), len(sortKey2)])
        " Compare chunks upto common length.
        " If chunks have different type, the one which has
        " integer type is the lesser.
        if type(sortKey1[i]) == type(sortKey2[i])
            if sortKey1[i] &lt;# sortKey2[i]
                return - 1
            elseif sortKey1[i] &gt;# sortKey2[i]
                return 1
            endif
        elseif type(sortKey1[i]) == v:t_number
            return -1
        elseif type(sortKey2[i]) == v:t_number
            return 1
        endif
        let i = i + 1
    endwhile

    " Keys are identical upto common length.
    " The key which has smaller chunks is the lesser one.
    if len(sortKey1) &lt; len(sortKey2)
        return -1
    elseif len(sortKey1) &gt; len(sortKey2)
        return 1
    else
        return 0
    endif
endfunction</t>
<t tx="ekr.20181231110929.1">" Issue a deprecation warning for a:func. If a second arg is given, use this
" as the deprecation message
function! nerdtree#deprecated(func, ...)
    let msg = a:0 ? a:func . ' ' . a:1 : a:func . ' is deprecated'

    if !exists('s:deprecationWarnings')
        let s:deprecationWarnings = {}
    endif
    if !has_key(s:deprecationWarnings, a:func)
        let s:deprecationWarnings[a:func] = 1
        echomsg msg
    endif
endfunction</t>
<t tx="ekr.20181231110931.1">" Same as :exec cmd but with eventignore set for the duration
" to disable the autocommands used by NERDTree (BufEnter,
" BufLeave and VimEnter)
function! nerdtree#exec(cmd)
    let old_ei = &amp;ei
    set ei=BufEnter,BufLeave,VimEnter
    exec a:cmd
    let &amp;ei = old_ei
endfunction</t>
<t tx="ekr.20181231110934.1">function! nerdtree#has_opt(options, name)
    return has_key(a:options, a:name) &amp;&amp; a:options[a:name] == 1
endfunction</t>
<t tx="ekr.20181231110936.1">function! nerdtree#loadClassFiles()
    runtime lib/nerdtree/path.vim
    runtime lib/nerdtree/menu_controller.vim
    runtime lib/nerdtree/menu_item.vim
    runtime lib/nerdtree/key_map.vim
    runtime lib/nerdtree/bookmark.vim
    runtime lib/nerdtree/tree_file_node.vim
    runtime lib/nerdtree/tree_dir_node.vim
    runtime lib/nerdtree/opener.vim
    runtime lib/nerdtree/creator.vim
    runtime lib/nerdtree/flag_set.vim
    runtime lib/nerdtree/nerdtree.vim
    runtime lib/nerdtree/ui.vim
    runtime lib/nerdtree/event.vim
    runtime lib/nerdtree/notifier.vim
endfunction</t>
<t tx="ekr.20181231110937.1">function! nerdtree#postSourceActions()
    call g:NERDTreeBookmark.CacheBookmarks(1)
    call nerdtree#ui_glue#createDefaultBindings()

    "load all nerdtree plugins
    runtime! nerdtree_plugin/**/*.vim
endfunction</t>
<t tx="ekr.20181231110939.1">function! nerdtree#runningWindows()
    return has("win16") || has("win32") || has("win64")
endfunction</t>
<t tx="ekr.20181231110941.1">function! nerdtree#runningCygwin()
    return has("win32unix")
endfunction</t>
<t tx="ekr.20181231110947.1">"============================================================</t>
<t tx="ekr.20181231110958.1">"A wrapper for :echo. Appends 'NERDTree:' on the front of all messages
"
"Args:
"msg: the message to echo
function! nerdtree#echo(msg)
    redraw
    echomsg "NERDTree: " . a:msg
endfunction</t>
<t tx="ekr.20181231111000.1">"Wrapper for nerdtree#echo, sets the message type to errormsg for this message
"Args:
"msg: the message to echo
function! nerdtree#echoError(msg)
    echohl errormsg
    call nerdtree#echo(a:msg)
    echohl normal
endfunction</t>
<t tx="ekr.20181231111001.1">"Wrapper for nerdtree#echo, sets the message type to warningmsg for this message
"Args:
"msg: the message to echo
function! nerdtree#echoWarning(msg)
    echohl warningmsg
    call nerdtree#echo(a:msg)
    echohl normal
endfunction</t>
<t tx="ekr.20181231111003.1">function! nerdtree#renderView()
    call b:NERDTree.render()
endfunction</t>
<t tx="ekr.20181231111022.1">function! nerdtree#ui_glue#createDefaultBindings()
    let s = '&lt;SNR&gt;' . s:SID() . '_'

    call NERDTreeAddKeyMap({ 'key': '&lt;MiddleMouse&gt;', 'scope': 'all', 'callback': s . 'handleMiddleMouse' })
    call NERDTreeAddKeyMap({ 'key': '&lt;LeftRelease&gt;', 'scope': "all", 'callback': s."handleLeftClick" })
    call NERDTreeAddKeyMap({ 'key': '&lt;2-LeftMouse&gt;', 'scope': "DirNode", 'callback': s."activateDirNode" })
    call NERDTreeAddKeyMap({ 'key': '&lt;2-LeftMouse&gt;', 'scope': "FileNode", 'callback': s."activateFileNode" })
    call NERDTreeAddKeyMap({ 'key': '&lt;2-LeftMouse&gt;', 'scope': "Bookmark", 'callback': s."activateBookmark" })
    call NERDTreeAddKeyMap({ 'key': '&lt;2-LeftMouse&gt;', 'scope': "all", 'callback': s."activateAll" })


    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapActivateNode, 'scope': "DirNode", 'callback': s."activateDirNode" })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapActivateNode, 'scope': "FileNode", 'callback': s."activateFileNode" })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapActivateNode, 'scope': "Bookmark", 'callback': s."activateBookmark" })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapActivateNode, 'scope': "all", 'callback': s."activateAll" })

    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapOpenSplit, 'scope': "Node", 'callback': s."openHSplit" })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapOpenVSplit, 'scope': "Node", 'callback': s."openVSplit" })

    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapPreview, 'scope': "Node", 'callback': s."previewNodeCurrent" })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapPreviewVSplit, 'scope': "Node", 'callback': s."previewNodeVSplit" })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapPreviewSplit, 'scope': "Node", 'callback': s."previewNodeHSplit" })

    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapOpenRecursively, 'scope': "DirNode", 'callback': s."openNodeRecursively" })

    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapUpdir, 'scope': 'all', 'callback': s . 'upDirCurrentRootClosed' })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapUpdirKeepOpen, 'scope': 'all', 'callback': s . 'upDirCurrentRootOpen' })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapChangeRoot, 'scope': 'Node', 'callback': s . 'chRoot' })

    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapChdir, 'scope': "Node", 'callback': s."chCwd" })

    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapQuit, 'scope': "all", 'callback': s."closeTreeWindow" })

    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapCWD, 'scope': "all", 'callback': "nerdtree#ui_glue#chRootCwd" })

    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapRefreshRoot, 'scope': "all", 'callback': s."refreshRoot" })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapRefresh, 'scope': "Node", 'callback': s."refreshCurrent" })

    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapHelp, 'scope': "all", 'callback': s."displayHelp" })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapToggleZoom, 'scope': "all", 'callback': s."toggleZoom" })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapToggleHidden, 'scope': "all", 'callback': s."toggleShowHidden" })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapToggleFilters, 'scope': "all", 'callback': s."toggleIgnoreFilter" })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapToggleFiles, 'scope': "all", 'callback': s."toggleShowFiles" })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapToggleBookmarks, 'scope': "all", 'callback': s."toggleShowBookmarks" })

    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapCloseDir, 'scope': "Node", 'callback': s."closeCurrentDir" })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapCloseChildren, 'scope': "DirNode", 'callback': s."closeChildren" })

    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapMenu, 'scope': "Node", 'callback': s."showMenu" })

    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapJumpParent, 'scope': "Node", 'callback': s."jumpToParent" })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapJumpFirstChild, 'scope': "Node", 'callback': s."jumpToFirstChild" })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapJumpLastChild, 'scope': "Node", 'callback': s."jumpToLastChild" })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapJumpRoot, 'scope': "all", 'callback': s."jumpToRoot" })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapJumpNextSibling, 'scope': "Node", 'callback': s."jumpToNextSibling" })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapJumpPrevSibling, 'scope': "Node", 'callback': s."jumpToPrevSibling" })

    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapOpenInTab, 'scope': 'Node', 'callback': s . 'openInNewTab' })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapOpenInTabSilent, 'scope': 'Node', 'callback': s . 'openInNewTabSilent' })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapOpenInTab, 'scope': 'Bookmark', 'callback': s . 'openInNewTab' })
    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapOpenInTabSilent, 'scope': 'Bookmark', 'callback': s . 'openInNewTabSilent' })

    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapOpenExpl, 'scope': "DirNode", 'callback': s."openExplorer" })

    call NERDTreeAddKeyMap({ 'key': g:NERDTreeMapDeleteBookmark, 'scope': "Bookmark", 'callback': s."deleteBookmark" })
endfunction</t>
<t tx="ekr.20181231111029.1">"============================================================</t>
<t tx="ekr.20181231111032.1">"handle the user activating the updir line
function! s:activateAll()
    if getline(".") ==# g:NERDTreeUI.UpDirLine()
        return nerdtree#ui_glue#upDir(0)
    endif
endfunction</t>
<t tx="ekr.20181231111034.1">function! s:activateDirNode(directoryNode)

    if a:directoryNode.isRoot() &amp;&amp; a:directoryNode.isOpen
        call nerdtree#echo('cannot close tree root')
        return
    endif

    call a:directoryNode.activate()
endfunction</t>
<t tx="ekr.20181231111035.1">"handle the user activating a tree node
function! s:activateFileNode(node)
    call a:node.activate({'reuse': 'all', 'where': 'p'})
endfunction</t>
<t tx="ekr.20181231111037.1">"handle the user activating a bookmark
function! s:activateBookmark(bm)
    call a:bm.activate(b:NERDTree, !a:bm.path.isDirectory ? {'where': 'p'} : {})
endfunction</t>
<t tx="ekr.20181231111039.1">" Associate the current node with the given name
function! nerdtree#ui_glue#bookmarkNode(...)
    let currentNode = g:NERDTreeFileNode.GetSelected()
    if currentNode != {}
        let name = a:1
        if empty(name)
            let name = currentNode.path.getLastPathComponent(0)
        endif
        try
            call currentNode.bookmark(name)
            call b:NERDTree.render()
        catch /^NERDTree.IllegalBookmarkNameError/
            call nerdtree#echo("bookmark names must not contain spaces")
        endtry
    else
        call nerdtree#echo("select a node first")
    endif
endfunction</t>
<t tx="ekr.20181231111041.1">function! s:chCwd(node)
    try
        call a:node.path.changeToDir()
    catch /^NERDTree.PathChangeError/
        call nerdtree#echoWarning("could not change cwd")
    endtry
endfunction</t>
<t tx="ekr.20181231111042.1">" changes the current root to the selected one
function! s:chRoot(node)
    call b:NERDTree.changeRoot(a:node)
endfunction</t>
<t tx="ekr.20181231111044.1">" Change the NERDTree root to match the current working directory.
function! nerdtree#ui_glue#chRootCwd()
    NERDTreeCWD
endfunction</t>
<t tx="ekr.20181231111045.1">function! nerdtree#ui_glue#clearBookmarks(bookmarks)
    if a:bookmarks ==# ''
        let currentNode = g:NERDTreeFileNode.GetSelected()
        if currentNode != {}
            call currentNode.clearBookmarks()
        endif
    else
        for name in split(a:bookmarks, ' ')
            let bookmark = g:NERDTreeBookmark.BookmarkFor(name)
            call bookmark.delete()
        endfor
    endif
    call b:NERDTree.root.refresh()
    call b:NERDTree.render()
endfunction</t>
<t tx="ekr.20181231111047.1">" closes all childnodes of the current node
function! s:closeChildren(node)
    call a:node.closeChildren()
    call b:NERDTree.render()
    call a:node.putCursorHere(0, 0)
endfunction</t>
<t tx="ekr.20181231111049.1">" Close the parent directory of the current node.
function! s:closeCurrentDir(node)

    if a:node.isRoot()
        call nerdtree#echo('cannot close parent of tree root')
        return
    endif

    let l:parent = a:node.parent

    while l:parent.isCascadable()
        let l:parent = l:parent.parent
    endwhile

    if l:parent.isRoot()
        call nerdtree#echo('cannot close tree root')
        return
    endif

    call l:parent.close()
    call b:NERDTree.render()
    call l:parent.putCursorHere(0, 0)
endfunction</t>
<t tx="ekr.20181231111050.1">" close the tree window
function! s:closeTreeWindow()
    if b:NERDTree.isWinTree() &amp;&amp; b:NERDTree.previousBuf() != -1
        exec "buffer " . b:NERDTree.previousBuf()
    else
        if winnr("$") &gt; 1
            call g:NERDTree.Close()
        else
            call nerdtree#echo("Cannot close last window")
        endif
    endif
endfunction</t>
<t tx="ekr.20181231111052.1">" Prompt the user to confirm the deletion of the selected bookmark.
function! s:deleteBookmark(bookmark)
    let l:message = "Delete the bookmark \"" . a:bookmark.name
                \ . "\" from the bookmark list?"

    let l:choices = "&amp;Yes\n&amp;No"

    echo | redraw
    let l:selection = confirm(l:message, l:choices, 1, 'Warning')

    if l:selection != 1
        call nerdtree#echo('bookmark not deleted')
        return
    endif

    try
        call a:bookmark.delete()
        silent call b:NERDTree.root.refresh()
        call b:NERDTree.render()
        echo | redraw
    catch /^NERDTree/
        call nerdtree#echoWarning('could not remove bookmark')
    endtry
endfunction</t>
<t tx="ekr.20181231111053.1">" toggles the help display
function! s:displayHelp()
    call b:NERDTree.ui.toggleHelp()
    call b:NERDTree.render()
    call b:NERDTree.ui.centerView()
endfunction</t>
<t tx="ekr.20181231111055.1">function! s:findAndRevealPath(pathStr)
    let l:pathStr = !empty(a:pathStr) ? a:pathStr : expand('%:p')

    if empty(l:pathStr)
        call nerdtree#echoWarning('no file for the current buffer')
        return
    endif

    try
        let l:pathStr = g:NERDTreePath.Resolve(l:pathStr)
        let l:pathObj = g:NERDTreePath.New(l:pathStr)
    catch /^NERDTree.InvalidArgumentsError/
        call nerdtree#echoWarning('invalid path')
        return
    endtry

    if !g:NERDTree.ExistsForTab()
        try
            let l:cwd = g:NERDTreePath.New(getcwd())
        catch /^NERDTree.InvalidArgumentsError/
            call nerdtree#echo('current directory does not exist.')
            let l:cwd = l:pathObj.getParent()
        endtry

        if l:pathObj.isUnder(l:cwd)
            call g:NERDTreeCreator.CreateTabTree(l:cwd.str())
        else
            call g:NERDTreeCreator.CreateTabTree(l:pathObj.getParent().str())
        endif
    else
        NERDTreeFocus

        if !l:pathObj.isUnder(b:NERDTree.root.path)
            call s:chRoot(g:NERDTreeDirNode.New(l:pathObj.getParent(), b:NERDTree))
        endif
    endif

    if l:pathObj.isHiddenUnder(b:NERDTree.root.path)
        call b:NERDTree.ui.setShowHidden(1)
    endif

    let l:node = b:NERDTree.root.reveal(l:pathObj)
    call b:NERDTree.render()
    call l:node.putCursorHere(1, 0)
endfunction</t>
<t tx="ekr.20181231111057.1">"Checks if the click should open the current node
function! s:handleLeftClick()
    let currentNode = g:NERDTreeFileNode.GetSelected()
    if currentNode != {}

        "the dir arrows are multibyte chars, and vim's string functions only
        "deal with single bytes - so split the line up with the hack below and
        "take the line substring manually
        let line = split(getline(line(".")), '\zs')
        let startToCur = ""
        for i in range(0,len(line)-1)
            let startToCur .= line[i]
        endfor

        if currentNode.path.isDirectory
            if startToCur =~# g:NERDTreeUI.MarkupReg() &amp;&amp; startToCur =~# '[+~'.g:NERDTreeDirArrowExpandable.g:NERDTreeDirArrowCollapsible.'] \?$'
                call currentNode.activate()
                return
            endif
        endif

        if (g:NERDTreeMouseMode ==# 2 &amp;&amp; currentNode.path.isDirectory) || g:NERDTreeMouseMode ==# 3
            let char = strpart(startToCur, strlen(startToCur)-1, 1)
            if char !~# g:NERDTreeUI.MarkupReg()
                if currentNode.path.isDirectory
                    call currentNode.activate()
                else
                    call currentNode.activate({'reuse': 'all', 'where': 'p'})
                endif
                return
            endif
        endif
    endif
endfunction</t>
<t tx="ekr.20181231111059.1">function! s:handleMiddleMouse()

    " A middle mouse click does not automatically position the cursor as one
    " would expect. Forcing the execution of a regular left mouse click here
    " fixes this problem.
    execute "normal! \&lt;LeftMouse&gt;"

    let l:currentNode = g:NERDTreeFileNode.GetSelected()
    if empty(l:currentNode)
        call nerdtree#echoError('use the pointer to select a node')
        return
    endif

    if l:currentNode.path.isDirectory
        call l:currentNode.openExplorer()
    else
        call l:currentNode.open({'where': 'h'})
    endif
endfunction</t>
<t tx="ekr.20181231111101.1">"this is needed since I cant figure out how to invoke dict functions from a
"key map
function! nerdtree#ui_glue#invokeKeyMap(key)
    call g:NERDTreeKeyMap.Invoke(a:key)
endfunction</t>
<t tx="ekr.20181231111103.1">function! s:jumpToFirstChild(node)
    call s:jumpToChild(a:node, 0)
endfunction</t>
<t tx="ekr.20181231111105.1">function! s:jumpToLastChild(node)
    call s:jumpToChild(a:node, 1)
endfunction</t>
<t tx="ekr.20181231111106.1">" Jump to the first or last child node at the same file system level.
"
" Args:
" node: the node on which the cursor currently sits
" last: 1 (true) if jumping to last child, 0 (false) if jumping to first
function! s:jumpToChild(node, last)
    let l:node = a:node.path.isDirectory ? a:node.getCascadeRoot() : a:node

    if l:node.isRoot()
        return
    endif

    let l:parent = l:node.parent
    let l:children = l:parent.getVisibleChildren()

    let l:target = a:last ? l:children[len(l:children) - 1] : l:children[0]

    call l:target.putCursorHere(1, 0)
    call b:NERDTree.ui.centerView()
endfunction</t>
<t tx="ekr.20181231111108.1">" Move the cursor to the parent of the specified node.  For a cascade, move to
" the parent of the cascade's first node.  At the root node, do nothing.
function! s:jumpToParent(node)
    let l:node = a:node.path.isDirectory ? a:node.getCascadeRoot() : a:node

    if l:node.isRoot()
        return
    endif

    if empty(l:node.parent)
        call nerdtree#echo('could not jump to parent node')
        return
    endif

    call l:node.parent.putCursorHere(1, 0)
    call b:NERDTree.ui.centerView()
endfunction</t>
<t tx="ekr.20181231111109.1">" moves the cursor to the root node
function! s:jumpToRoot()
    call b:NERDTree.root.putCursorHere(1, 0)
    call b:NERDTree.ui.centerView()
endfunction</t>
<t tx="ekr.20181231111111.1">function! s:jumpToNextSibling(node)
    call s:jumpToSibling(a:node, 1)
endfunction</t>
<t tx="ekr.20181231111112.1">function! s:jumpToPrevSibling(node)
    call s:jumpToSibling(a:node, 0)
endfunction</t>
<t tx="ekr.20181231111114.1">" Move the cursor to the next or previous node at the same file system level.
"
" Args:
" node: the node on which the cursor currently sits
" forward: 0 to jump to previous sibling, 1 to jump to next sibling
function! s:jumpToSibling(node, forward)
    let l:node = a:node.path.isDirectory ? a:node.getCascadeRoot() : a:node
    let l:sibling = l:node.findSibling(a:forward)

    if empty(l:sibling)
        return
    endif

    call l:sibling.putCursorHere(1, 0)
    call b:NERDTree.ui.centerView()
endfunction</t>
<t tx="ekr.20181231111116.1">" Open the Bookmark that has the specified name. This function provides the
" implementation for the ":OpenBookmark" command.
function! nerdtree#ui_glue#openBookmark(name)
    try
        let l:bookmark = g:NERDTreeBookmark.BookmarkFor(a:name)
    catch /^NERDTree.BookmarkNotFoundError/
        call nerdtree#echoError('bookmark "' . a:name . '" not found')
        return
    endtry
    if l:bookmark.path.isDirectory
        call l:bookmark.open(b:NERDTree)
    else
        call l:bookmark.open(b:NERDTree, {'where': 'p'})
    endif
endfunction</t>
<t tx="ekr.20181231111117.1">function! s:openHSplit(target)
    call a:target.activate({'where': 'h'})
endfunction</t>
<t tx="ekr.20181231111119.1">function! s:openVSplit(target)
    call a:target.activate({'where': 'v'})
endfunction</t>
<t tx="ekr.20181231111121.1">function! s:openExplorer(node)
    call a:node.openExplorer()
endfunction</t>
<t tx="ekr.20181231111122.1">function! s:openInNewTab(target)
    let l:opener = g:NERDTreeOpener.New(a:target.path, {'where': 't'})
    call l:opener.open(a:target)
endfunction</t>
<t tx="ekr.20181231111124.1">function! s:openInNewTabSilent(target)
    let l:opener = g:NERDTreeOpener.New(a:target.path, {'where': 't', 'stay': 1})
    call l:opener.open(a:target)
endfunction</t>
<t tx="ekr.20181231111126.1">function! s:openNodeRecursively(node)
    call nerdtree#echo("Recursively opening node. Please wait...")
    call a:node.openRecursively()
    call b:NERDTree.render()
    redraw
    call nerdtree#echo("Recursively opening node. Please wait... DONE")
endfunction</t>
<t tx="ekr.20181231111127.1">function! s:previewNodeCurrent(node)
    call a:node.open({'stay': 1, 'where': 'p', 'keepopen': 1})
endfunction</t>
<t tx="ekr.20181231111129.1">function! s:previewNodeHSplit(node)
    call a:node.open({'stay': 1, 'where': 'h', 'keepopen': 1})
endfunction</t>
<t tx="ekr.20181231111131.1">function! s:previewNodeVSplit(node)
    call a:node.open({'stay': 1, 'where': 'v', 'keepopen': 1})
endfunction</t>
<t tx="ekr.20181231111134.1">" put the cursor on the node associate with the given name
function! nerdtree#ui_glue#revealBookmark(name)
    try
        let targetNode = g:NERDTreeBookmark.GetNodeForName(a:name, 0, b:NERDTree)
        call targetNode.putCursorHere(0, 1)
    catch /^NERDTree.BookmarkNotFoundError/
        call nerdtree#echo("Bookmark isnt cached under the current root")
    endtry
endfunction</t>
<t tx="ekr.20181231111136.1">" Reloads the current root. All nodes below this will be lost and the root dir
" will be reloaded.
function! s:refreshRoot()
    if !g:NERDTree.IsOpen()
        return
    endif
    call nerdtree#echo("Refreshing the root node. This could take a while...")

    let l:curWin = winnr()
    call nerdtree#exec(g:NERDTree.GetWinNum() . "wincmd w")
    call b:NERDTree.root.refresh()
    call b:NERDTree.render()
    redraw
    call nerdtree#exec(l:curWin . "wincmd w")
    call nerdtree#echo("Refreshing the root node. This could take a while... DONE")
endfunction</t>
<t tx="ekr.20181231111140.1">" refreshes the root for the current node
function! s:refreshCurrent(node)
    let node = a:node
    if !node.path.isDirectory
        let node = node.parent
    endif

    call nerdtree#echo("Refreshing node. This could take a while...")
    call node.refresh()
    call b:NERDTree.render()
    redraw
    call nerdtree#echo("Refreshing node. This could take a while... DONE")
endfunction</t>
<t tx="ekr.20181231111142.1">function! nerdtree#ui_glue#setupCommands()
    command! -n=? -complete=dir -bar NERDTree :call g:NERDTreeCreator.CreateTabTree('&lt;args&gt;')
    command! -n=? -complete=dir -bar NERDTreeToggle :call g:NERDTreeCreator.ToggleTabTree('&lt;args&gt;')
    command! -n=0 -bar NERDTreeClose :call g:NERDTree.Close()
    command! -n=1 -complete=customlist,nerdtree#completeBookmarks -bar NERDTreeFromBookmark call g:NERDTreeCreator.CreateTabTree('&lt;args&gt;')
    command! -n=0 -bar NERDTreeMirror call g:NERDTreeCreator.CreateMirror()
    command! -n=? -complete=file -bar NERDTreeFind call s:findAndRevealPath('&lt;args&gt;')
    command! -n=0 -bar NERDTreeRefreshRoot call s:refreshRoot()
    command! -n=0 -bar NERDTreeFocus call NERDTreeFocus()
    command! -n=0 -bar NERDTreeCWD call NERDTreeCWD()
endfunction</t>
<t tx="ekr.20181231111143.1">function s:SID()
    if !exists("s:sid")
        let s:sid = matchstr(expand('&lt;sfile&gt;'), '&lt;SNR&gt;\zs\d\+\ze_SID$')
    endif
    return s:sid
endfun

" FUNCTION: s:showMenu(node) {{{1
function! s:showMenu(node)
    let mc = g:NERDTreeMenuController.New(g:NERDTreeMenuItem.AllEnabled())
    call mc.showMenu()
endfunction</t>
<t tx="ekr.20181231111146.1">function! s:toggleIgnoreFilter()
    call b:NERDTree.ui.toggleIgnoreFilter()
endfunction</t>
<t tx="ekr.20181231111148.1">function! s:toggleShowBookmarks()
    call b:NERDTree.ui.toggleShowBookmarks()
endfunction</t>
<t tx="ekr.20181231111149.1">function! s:toggleShowFiles()
    call b:NERDTree.ui.toggleShowFiles()
endfunction</t>
<t tx="ekr.20181231111151.1">" toggles the display of hidden files
function! s:toggleShowHidden()
    call b:NERDTree.ui.toggleShowHidden()
endfunction</t>
<t tx="ekr.20181231111152.1">function! s:toggleZoom()
    call b:NERDTree.ui.toggleZoom()
endfunction</t>
<t tx="ekr.20181231111154.1">" Move the NERDTree up one level.
"
" Args:
" preserveState: if 1, the current root is left open when the new tree is
" rendered; if 0, the current root node is closed
function! nerdtree#ui_glue#upDir(preserveState)

    try
        call b:NERDTree.root.cacheParent()
    catch /^NERDTree.CannotCacheParentError/
        call nerdtree#echo('already at root directory')
        return
    endtry

    let l:oldRoot = b:NERDTree.root
    let l:newRoot = b:NERDTree.root.parent

    call l:newRoot.open()
    call l:newRoot.transplantChild(l:oldRoot)

    if !a:preserveState
        call l:oldRoot.close()
    endif

    call b:NERDTree.changeRoot(l:newRoot)
    call l:oldRoot.putCursorHere(0, 0)
endfunction</t>
<t tx="ekr.20181231111156.1">function! s:upDirCurrentRootOpen()
    call nerdtree#ui_glue#upDir(1)
endfunction</t>
<t tx="ekr.20181231111158.1">function! s:upDirCurrentRootClosed()
    call nerdtree#ui_glue#upDir(0)
endfunction</t>
<t tx="ekr.20181231111331.1">function! NERDTreeExecFileActive()
    let node = g:NERDTreeFileNode.GetSelected()
    return !node.path.isDirectory &amp;&amp; node.path.isExecutable
endfunction</t>
<t tx="ekr.20181231111334.1">function! NERDTreeExecFile()
    let treenode = g:NERDTreeFileNode.GetSelected()
    echo "==========================================================\n"
    echo "Complete the command to execute (add arguments etc):\n"
    let cmd = treenode.path.str({'escape': 1})
    let cmd = input(':!', cmd . ' ')
    if cmd != ''
        exec ':!' . cmd
    else
        echo "Aborted"
    endif
endfunction</t>
<t tx="ekr.20181231111402.1">" ============================================================================
" File:        vcs.vim
" Description: NERDTree plugin that provides a command to open on the root of
"              a version control system repository.
" Maintainer:  Phil Runninger
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================</t>
<t tx="ekr.20181231111410.1">function! s:CreateTabTreeVCS(name)
    let l:path = g:NERDTreeCreator._pathForString(a:name)
    let l:path = s:FindParentVCSRoot(l:path)
    call g:NERDTreeCreator.createTabTree(empty(l:path) ? "" : l:path._str())
endfunction</t>
<t tx="ekr.20181231111412.1">" Finds the root version control system folder of the given path. If a:path is
" not part of a repository, return the original path.
function! s:FindParentVCSRoot(path)
    let l:path = a:path
    while !empty(l:path) &amp;&amp;
        \ l:path._str() !~ '^\(\a:\\\|\/\)$' &amp;&amp;
        \ !isdirectory(l:path._str() . '/.git') &amp;&amp;
        \ !isdirectory(l:path._str() . '/.svn') &amp;&amp;
        \ !isdirectory(l:path._str() . '/.hg') &amp;&amp;
        \ !isdirectory(l:path._str() . '/.bzr') &amp;&amp;
        \ !isdirectory(l:path._str() . '/_darcs')
        let l:path = l:path.getParent()
    endwhile
    return (empty(l:path) || l:path._str() =~ '^\(\a:\\\|\/\)$') ? a:path : l:path
endfunction</t>
<t tx="ekr.20181231163518.1">" FUNCTION: TreeFileNode.displayString() {{{1
"
" Returns a string that specifies how the node should be represented as a
" string
"
" Return:
" a string that can be used in the view to represent this node
function! s:TreeFileNode.displayString()
    return self.path.flagSet.renderToString() . self.path.displayString()
endfunction</t>
<t tx="ekr.20181231163532.1">" Removes this node from the tree and calls the Delete method for its path obj
function! s:TreeFileNode.delete()
    call self.path.delete()
    call self.parent.removeChild(self)
" FUNCTION: TreeFileNode.equals(treenode) {{{1
"
" Compares this treenode to the input treenode and returns 1 if they are the
" same node.
"
" Use this method instead of ==  because sometimes when the treenodes contain
" many children, vim seg faults when doing ==
"
" Args:
" treenode: the other treenode to compare to
function! s:TreeFileNode.equals(treenode)
    return self.path.str() ==# a:treenode.path.str()
endfunction</t>
<t tx="ekr.20181231163535.1">" Returns self if this node.path.Equals the given path.
" Returns {} if not equal.
"
" Args:
" path: the path object to compare against
function! s:TreeFileNode.findNode(path)
    if a:path.equals(self.path)
        return self
    endif
    return {}
endfunction</t>
<t tx="ekr.20181231163537.1">" Find the next or previous sibling of this node.
"
" Args:
" direction: 0 for previous, 1 for next
"
" Return:
" The next/previous TreeFileNode object or an empty dictionary if not found.
function! s:TreeFileNode.findSibling(direction)

    " There can be no siblings if there is no parent.
    if empty(self.parent)
        return {}
    endif

    let l:nodeIndex = self.parent.getChildIndex(self.path)

    if l:nodeIndex == -1
        return {}
    endif

    " Get the next index to begin the search.
    let l:nodeIndex += a:direction ? 1 : -1

    while 0 &lt;= l:nodeIndex &amp;&amp; l:nodeIndex &lt; self.parent.getChildCount()

        " Return the next node if it is not ignored.
        if !self.parent.children[l:nodeIndex].path.ignore(self.getNerdtree())
            return self.parent.children[l:nodeIndex]
        endif

        let l:nodeIndex += a:direction ? 1 : -1
    endwhile

    return {}
endfunction</t>
<t tx="ekr.20181231163539.1">function! s:TreeFileNode.getNerdtree()
    return self._nerdtree
endfunction</t>
<t tx="ekr.20181231163541.1">" get the root node for this tab
function! s:TreeFileNode.GetRootForTab()
    if g:NERDTree.ExistsForTab()
        return getbufvar(t:NERDTreeBufName, 'NERDTree').root
    end
    return {}
endfunction</t>
<t tx="ekr.20181231163544.1">" If the cursor is currently positioned on a tree node, return the node.
" Otherwise, return the empty dictionary.
function! s:TreeFileNode.GetSelected()

    try
        let l:path = b:NERDTree.ui.getPath(line('.'))

        if empty(l:path)
            return {}
        endif

        return b:NERDTree.root.findNode(l:path)
    catch
        return {}
    endtry
endfunction</t>
<t tx="ekr.20181231163547.1">" returns 1 if this node should be visible according to the tree filters and
" hidden file filters (and their on/off status)
function! s:TreeFileNode.isVisible()
    return !self.path.ignore(self.getNerdtree())
endfunction</t>
<t tx="ekr.20181231163548.1">function! s:TreeFileNode.isRoot()
    if !g:NERDTree.ExistsForBuf()
        throw "NERDTree.NoTreeError: No tree exists for the current buffer"
    endif

    return self.equals(self.getNerdtree().root)
endfunction</t>
<t tx="ekr.20181231163550.1">" Returns a new TreeNode object with the given path and parent
"
" Args:
" path: file/dir that the node represents
" nerdtree: the tree the node belongs to
function! s:TreeFileNode.New(path, nerdtree)
    if a:path.isDirectory
        return g:NERDTreeDirNode.New(a:path, a:nerdtree)
    else
        let newTreeNode = copy(self)
        let newTreeNode.path = a:path
        let newTreeNode.parent = {}
        let newTreeNode._nerdtree = a:nerdtree
        return newTreeNode
    endif
endfunction</t>
<t tx="ekr.20181231163552.1">function! s:TreeFileNode.open(...)
    let opts = a:0 ? a:1 : {}
    let opener = g:NERDTreeOpener.New(self.path, opts)
    call opener.open(self)
endfunction</t>
<t tx="ekr.20181231163554.1">" Open this node in a new window
function! s:TreeFileNode.openSplit()
    call nerdtree#deprecated('TreeFileNode.openSplit', 'is deprecated, use .open() instead.')
    call self.open({'where': 'h'})
endfunction</t>
<t tx="ekr.20181231163555.1">" Open this node in a new vertical window
function! s:TreeFileNode.openVSplit()
    call nerdtree#deprecated('TreeFileNode.openVSplit', 'is deprecated, use .open() instead.')
    call self.open({'where': 'v'})
endfunction</t>
<t tx="ekr.20181231163558.1">function! s:TreeFileNode.openInNewTab(options)
    call nerdtree#deprecated('TreeFileNode.openinNewTab', 'is deprecated, use .open() instead.')
    call self.open(extend({'where': 't'}, a:options))
endfunction</t>
<t tx="ekr.20181231163600.1">" Places the cursor on the line number this node is rendered on
"
" Args:
" isJump: 1 if this cursor movement should be counted as a jump by vim
" recurseUpward: try to put the cursor on the parent if the this node isnt
" visible
function! s:TreeFileNode.putCursorHere(isJump, recurseUpward)
    let ln = self.getNerdtree().ui.getLineNum(self)
    if ln != -1
        if a:isJump
            mark '
        endif
        call cursor(ln, col("."))
    else
        if a:recurseUpward
            let node = self
            while node != {} &amp;&amp; self.getNerdtree().ui.getLineNum(node) ==# -1
                let node = node.parent
                call node.open()
            endwhile
            call self._nerdtree.render()
            call node.putCursorHere(a:isJump, 0)
        endif
    endif
endfunction</t>
<t tx="ekr.20181231163602.1">function! s:TreeFileNode.refresh()
    call self.path.refresh(self.getNerdtree())
endfunction</t>
<t tx="ekr.20181231163603.1">function! s:TreeFileNode.refreshFlags()
    call self.path.refreshFlags(self.getNerdtree())
endfunction</t>
<t tx="ekr.20181231163605.1">" Calls the rename method for this nodes path obj
function! s:TreeFileNode.rename(newName)
    let newName = substitute(a:newName, '\(\\\|\/\)$', '', '')
    call self.path.rename(newName)
    call self.parent.removeChild(self)

    let parentPath = self.path.getParent()
    let newParent = self.getNerdtree().root.findNode(parentPath)

    if newParent != {}
        call newParent.createChild(self.path, 1)
        call newParent.refresh()
    endif
endfunction</t>
<t tx="ekr.20181231163607.1">" returns a string representation for this tree to be rendered in the view
function! s:TreeFileNode.renderToString()
    return self._renderToString(0, 0)
endfunction</t>
<t tx="ekr.20181231163609.1">" depth: the current depth in the tree for this call
" drawText: 1 if we should actually draw the line for this node (if 0 then the
" child nodes are rendered only)
" for each depth in the tree
function! s:TreeFileNode._renderToString(depth, drawText)
    let output = ""
    if a:drawText ==# 1

        let treeParts = repeat('  ', a:depth - 1)

        if !self.path.isDirectory
            let treeParts = treeParts . '  '
        endif

        let line = treeParts . self.displayString()

        let output = output . line . "\n"
    endif

    " if the node is an open dir, draw its children
    if self.path.isDirectory ==# 1 &amp;&amp; self.isOpen ==# 1

        let childNodesToDraw = self.getVisibleChildren()

        if self.isCascadable() &amp;&amp; a:depth &gt; 0

            let output = output . childNodesToDraw[0]._renderToString(a:depth, 0)

        elseif len(childNodesToDraw) &gt; 0
            for i in childNodesToDraw
                let output = output . i._renderToString(a:depth + 1, 1)
            endfor
        endif
    endif

    return output
endfunction</t>
</tnodes>
</leo_file>
