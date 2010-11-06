<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet ekr_stylesheet?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="1553" clone_windows="0"/>
<globals body_outline_ratio="0.5">
	<global_window_position top="155" left="383" height="600" width="800"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20041228094925"><vh>Early Milestones</vh>
<v t="ekr.20041228094925.1"><vh>02/03/02 Leo 0.08 released</vh></v>
<v t="ekr.20041228094925.2"><vh>12/17/01 ** Leo 0.05 released</vh></v>
<v t="ekr.20041228094925.3"><vh>12/16/01 Leo becomes functional</vh></v>
<v t="ekr.20041228094925.4"><vh>12/13/01 Syntax coloring works</vh></v>
<v t="ekr.20041228094925.5"><vh>12/09/01 Tree now drawn properly</vh></v>
<v t="ekr.20041228094925.6"><vh>12/05/01 Tree works with Tkinter</vh></v>
<v t="ekr.20041228094925.7"><vh>11/10/01 ** began conversion to tk</vh></v>
<v t="ekr.20041228094925.8"><vh>10/26/01 First successful read of .leo file w/ @file nodes</vh></v>
<v t="ekr.20041228094925.9"><vh>9/29/01 c2py: Totally in love with Python</vh></v>
<v t="ekr.20041228094925.10"><vh>ca. 9/1/01 began work on wxPython version of Leo</vh></v>
</v>
<v t="ekr.20040403120433" a="TV"><vh>Diary</vh>
<v t="ekr.20041023132837.1"><vh>2004</vh>
<v t="ekr.20041023132837.2"><vh>June 2004</vh>
<v t="ekr.20041023132837.3"><vh>6/3</vh>
<v t="ekr.20041023132837.4"><vh>Dimmed selection-only radio button in Find Panel</vh></v>
</v>
</v>
<v t="ekr.20041023132837.5"><vh>May 2004</vh>
<v t="ekr.20041023132837.6"><vh>5/19</vh>
<v t="ekr.20041023132837.7"><vh>Fixed @file read bug</vh></v>
<v t="ekr.20041023132837.8"><vh>Removed leoPluginsRef.leo from manifest.in</vh></v>
</v>
<v t="ekr.20041023132837.9"><vh>5/18 Released 4.2 a2</vh></v>
<v t="ekr.20041023132837.10"><vh>5/3 Made sure file indices are always assigned when writing files.</vh></v>
</v>
<v t="ekr.20041023132837.11"><vh>March 2004</vh>
<v t="ekr.20041023132837.12"><vh>4/30</vh>
<v t="ekr.20041023132837.13"><vh>Convert all plugins to g. style</vh></v>
<v t="ekr.20041023132837.14"><vh>Modified g. conversion script so it can be run anywhere</vh></v>
</v>
<v t="ekr.20041023132837.15"><vh>4/27</vh>
<v t="ekr.20041023132837.16"><vh>Added unit tests for batch mode</vh></v>
<v t="ekr.20041023132837.17"><vh>Added useNullUndoer option to nullFrame class</vh></v>
</v>
<v t="ekr.20041023132837.18"><vh>4/26</vh>
<v t="ekr.20041023132837.19"><vh>Removed v.iterators</vh></v>
<v t="ekr.20041023132837.20"><vh>Disambiguted clones while selecting</vh></v>
<v t="ekr.20041023132837.21"><vh>Added code to restore top and current positions</vh></v>
<v t="ekr.20041023132837.22"><vh>Fixed bug in find.changeSelection</vh></v>
<v t="ekr.20041023132837.23"><vh>Converted vnodes, tnodes and positions to new-style classes</vh></v>
<v t="ekr.20041023132837.24"><vh>Removed verbose option from setAllAncestorAtFileNodesDirty</vh></v>
<v t="ekr.20041023132837.25"><vh>Eliminated calls to p.__cmp__(None)</vh></v>
<v t="ekr.20041023132837.26"><vh>Converted vnode,tnode,position classes to new-style classes</vh></v>
<v t="ekr.20041023132837.27"><vh>Improved the speed of isAnyAtFileNode</vh></v>
</v>
<v t="ekr.20041023132837.28"><vh>4/25 Released 4.2 a1</vh>
<v t="ekr.20041023132837.29"><vh>Fix three major performance bugs</vh></v>
<v t="ekr.20041023132837.30"><vh>Removed all  back quotes</vh></v>
</v>
<v t="ekr.20041023132837.31"><vh>3/22</vh>
<v t="ekr.20041023132837.32"><vh>Replaced joinList by vnodeList</vh></v>
</v>
<v t="ekr.20041023132837.33"><vh>3/14</vh>
<v t="ekr.20041023132837.34"><vh>Added asserts when g.app.debug is true</vh></v>
<v t="ekr.20041023132837.35"><vh>HUGE AHA: greatly simplified p.nodeAfter and p.threadNext</vh></v>
</v>
<v t="ekr.20041023132837.36"><vh>3/12</vh>
<v t="ekr.20041023132837.37"><vh>Fixed nasty bug in p.linkAsRoot</vh></v>
<v t="ekr.20041023132837.38"><vh>Fixed and tested the script to replace x by g.x</vh></v>
<v t="ekr.20041023132837.39"><vh>Added c.allNodes_iter</vh></v>
<v t="ekr.20041023132837.40"><vh>Replaced porv by p</vh></v>
<v t="ekr.20041023132837.41"><vh>Removed g.sharedNodes ivar and related code</vh></v>
</v>
<v t="ekr.20041023132837.42"><vh>3/11</vh>
<v t="ekr.20041023132837.43"><vh>Got Save To command working</vh></v>
<v t="ekr.20041023132837.44"><vh>Added new iters</vh></v>
<v t="ekr.20041023132837.45"><vh>Added copy param to all position iterators</vh></v>
</v>
<v t="ekr.20041023132837.46"><vh>3/9 All calls to tag_bind must use a copy of position</vh></v>
<v t="ekr.20041023132837.47"><vh>3/6 Realized that position proxies are now efficient</vh></v>
<v t="ekr.20041023132837.48"><vh>3/4 Realized that iterators make the position class safe</vh></v>
<v t="ekr.20041023132837.49"><vh>3/5</vh>
<v t="ekr.20041023132837.50"><vh>Replaced x by g.x for all x in leoGlobals</vh></v>
<v t="ekr.20041023132837.51"><vh>Replaced app proxy class from leoGlobals by app global var</vh></v>
<v t="ekr.20041023132837.52"><vh>Replaced true,false by True,False</vh></v>
</v>
</v>
<v t="ekr.20041023132837.53"><vh>February 2004</vh>
<v t="ekr.20041023132837.54"><vh>2/16</vh>
<v t="ekr.20041023132837.55"><vh>Restored Toggle Angle Bracket command (without shortcut)</vh></v>
<v t="ekr.20041023132837.56"><vh>Changed Undo/Redo messages</vh></v>
</v>
<v t="ekr.20041023132837.57"><vh>2/1</vh>
<v t="ekr.20041023132837.58"><vh>Fixed bugs in Script-Find/change and improved documentation</vh></v>
</v>
</v>
<v t="ekr.20041023132837.59"><vh>January 2004</vh>
<v t="ekr.20041023132837.60"><vh>1/30</vh>
<v t="ekr.20041023132837.61"><vh>Added script to look for blanks preceding tabs in leading whitespace</vh></v>
<v t="ekr.20041023132837.62"><vh>Fixed several bugs</vh></v>
</v>
<v t="ekr.20041023132837.63"><vh>1/29</vh>
<v t="ekr.20041023132837.64"><vh>Only mark ancestor @file nodes dirty when creating,moving,changing nodes</vh></v>
<v t="ekr.20041023132837.65"><vh>fixed bugs: see 4.1 rc4 projects for details</vh></v>
</v>
<v t="ekr.20041023132837.66"><vh>1/26</vh>
<v t="ekr.20041023132837.67"><vh>Properly handle exceptions in commands</vh></v>
<v t="ekr.20041023132837.68"><vh>Eliminated control-v bug on various platforms</vh></v>
<v t="ekr.20041023132837.69"><vh>Added Dave Hein's Reformat Paragraph code.</vh></v>
<v t="ekr.20041023132837.70"><vh>Fixed Move Up bug involving clones</vh></v>
</v>
<v t="ekr.20041023132837.71"><vh>1/8</vh>
<v t="ekr.20041023132837.72"><vh>Esc hides the Find panel</vh></v>
<v t="ekr.20041023132837.73"><vh>Return in Find panel simuatest the Find button</vh></v>
<v t="ekr.20041023132837.74"><vh>Fixed huge performance bug in cut/copy nodes.</vh></v>
<v t="ekr.20041023132837.75"><vh>Improved sample code for batch mode in LeoDocs.leo</vh></v>
<v t="ekr.20041023132837.76"><vh>Removed a complex assert in colorizer</vh></v>
<v t="ekr.20041023132837.77"><vh>Change file extenstion for LaTeX files from .latext to .tex</vh></v>
</v>
<v t="ekr.20041023132837.78"><vh>1/6 Enable drawing after exceptions</vh></v>
<v t="ekr.20041023132837.79"><vh>1/5</vh>
<v t="ekr.20041023132837.80"><vh>Import now creates @root-code</vh></v>
<v t="ekr.20041023132837.81"><vh>Added sys.platform to signon message in log pane</vh></v>
<v t="ekr.20041023132837.82"><vh>Added test/test.leo to all distributions</vh></v>
<v t="ekr.20041023132837.83"><vh>Added LP link to Leo's site</vh></v>
</v>
</v>
</v>
<v t="ekr.20040403120534"><vh>2003</vh>
<v t="ekr.20040403120534.1"><vh>December 2003</vh>
<v t="ekr.20040403120534.2"><vh>12/19</vh>
<v t="ekr.20040403120534.3"><vh>Released 4.1 rc3</vh></v>
<v t="ekr.20040403120534.4"><vh>All unittests pass (but only with tkinterGui)</vh></v>
<v t="ekr.20040403120534.5"><vh>Added nullObject class to leoGlobals.py</vh></v>
<v t="ekr.20040403120534.6"><vh>Fixed serious problem reading 3.x files</vh></v>
</v>
<v t="ekr.20040403120534.7"><vh>12/18</vh>
<v t="ekr.20040403120534.8"><vh>Fixed crasher in 3.x version of scanText</vh></v>
<v t="ekr.20040403120534.9"><vh>Released 4.1 rc2</vh></v>
<v t="ekr.20040403120534.10"><vh>Added year to timestamp</vh></v>
<v t="ekr.20040403120534.11"><vh>Fixed bug in getInsertLines</vh></v>
</v>
<v t="ekr.20040403120534.12"><vh>12/17</vh>
<v t="ekr.20040403120534.13"><vh>Unittests for import don't alter test.leo</vh></v>
</v>
<v t="ekr.20040403120534.14"><vh>12/15</vh>
<v t="ekr.20040403120534.15"><vh>Supported default font sizes for all panes</vh></v>
<v t="ekr.20040403120534.16"><vh>Changed format of timestamps</vh></v>
<v t="ekr.20040403120534.17"><vh>Changed *.* to * in dialogs</vh></v>
<v t="ekr.20040403120534.18"><vh>Released 4.1 rc1</vh></v>
<v t="ekr.20040403120534.19"><vh>All unit tests now pass (import tests leave stuff behind)</vh></v>
<v t="ekr.20040403120534.20"><vh>Don't warn about missing path when writing scripts</vh></v>
<v t="ekr.20040403120534.21"><vh>Set default font size to None in leoConfig.txt.</vh></v>
</v>
<v t="ekr.20040403120534.22"><vh>12/13</vh>
<v t="ekr.20040403120534.23"><vh>Completed move code in leoTest.py</vh></v>
<v t="ekr.20040403120534.24"><vh>Moved encoding messages so they don't appear in batch mode</vh></v>
<v t="ekr.20040403120534.25"><vh>Autoclean outline on save &amp; executeScript does not set tnodeList</vh></v>
<v t="ekr.20040403120534.26"><vh>Patched scanPythonClass to put class docstrings in class nodes</vh></v>
</v>
<v t="ekr.20040403120534.27"><vh>12/11</vh>
<v t="ekr.20040403120534.28"><vh>Fixed big performance bug in removeSentinelLines</vh></v>
<v t="ekr.20040403120534.29"><vh>Call leoTest.fail in when import/export routines can't open a file</vh></v>
<v t="ekr.20040403120534.30"><vh>created unitTestGui class</vh></v>
</v>
<v t="ekr.20040403120534.31"><vh>12/09</vh>
<v t="ekr.20040403120534.32"><vh>Leo now allows @ignore nodes and orphan nodes in @file-nosent trees</vh></v>
<v t="ekr.20040403120534.33"><vh>Looked at report of import bug</vh></v>
</v>
<v t="ekr.20040403120534.34"><vh>12/08</vh>
<v t="ekr.20040403120534.35"><vh>Investigated &amp; fixed copy/paste bugs</vh></v>
</v>
<v t="ekr.20040403120534.36"><vh>12/07</vh>
<v t="ekr.20040403120534.37"><vh>Corrected counts when replacing tabs/blanks</vh></v>
<v t="ekr.20040403120534.38"><vh>Added file open dialog to Import Derived Files command</vh></v>
<v t="ekr.20040403120534.39"><vh>Made sure that Reformat Paragraph makes the new insertion point visible</vh></v>
<v t="ekr.20040403120534.40"><vh>Changed logControl to logCtrl</vh></v>
</v>
<v t="ekr.20040403120534.41"><vh>12/06</vh>
<v t="ekr.20040403120534.42"><vh>Fixed bug when untangling html</vh></v>
<v t="ekr.20040403120534.43"><vh>Fixed clone-dragging bug</vh></v>
<v t="ekr.20040403120534.44"><vh>Load plugins dynamically using pluginsManager.txt</vh></v>
</v>
<v t="ekr.20040403120534.45"><vh>12/05</vh>
<v t="ekr.20040403120534.46"><vh>Ran pychecker</vh></v>
</v>
<v t="ekr.20040403120534.47"><vh>12/04</vh>
<v t="ekr.20040403120534.48"><vh>Created and read paths with chinese characters in folder and file names</vh></v>
<v t="ekr.20040403120534.49"><vh>Fixed all remaining bugs (except duplicate tnode index)</vh></v>
</v>
<v t="ekr.20040403120534.50"><vh>12/03</vh>
<v t="ekr.20040403120534.51"><vh>Replaced c.OpenWithFileName by global openWithFileName</vh></v>
<v t="ekr.20040403120534.52"><vh>Fixed dangerous bug in Convert Blanks command</vh></v>
<v t="ekr.20040403120534.53"><vh>Added the mod_tempfname plugin</vh></v>
</v>
<v t="ekr.20040403120534.54"><vh>12/01</vh>
<v t="ekr.20040403120534.55"><vh>Update recent files in newLeoCommanderAndFrame</vh></v>
</v>
</v>
<v t="ekr.20040403120534.56"><vh>November 2003</vh>
<v t="ekr.20040403120534.57"><vh>11/23 Released 4.1 beta 5 to cvs only</vh>
<v t="ekr.20040403120534.58"><vh>Replaced app.batchLog with app.log</vh></v>
<v t="ekr.20040403120534.59"><vh>Fixed Undo Change All (in headlines) problem</vh></v>
<v t="ekr.20040403120534.60"><vh>Added defensive code to prevent crash in colorizer</vh></v>
<v t="ekr.20040403120534.61"><vh>Removed annoying Go To Line Number "error" message.</vh></v>
<v t="ekr.20040403120534.62"><vh>Fixed duplicate shortcut message when creating a popup menu</vh></v>
<v t="ekr.20040403120534.63"><vh>Made newTnode more robust</vh></v>
<v t="ekr.20040403120534.64"><vh>Fixed crashers in extract and extract section</vh></v>
<v t="ekr.20040403120534.65"><vh>Fixed bug in putRefLine</vh></v>
<v t="ekr.20040403120534.66"><vh>Tested --script from command line</vh></v>
</v>
<v t="ekr.20040403120534.67"><vh>11/22</vh>
<v t="ekr.20040403120534.68"><vh>Moved batch plugin into Leo's core.</vh></v>
<v t="ekr.20040403120534.69"><vh>Added nullUndoer class</vh></v>
<v t="ekr.20040403120534.70"><vh>Disabled Edit Body/Headline commands in batch mode</vh></v>
<v t="ekr.20040403120534.71"><vh>Added app.batchMode ivar</vh></v>
<v t="ekr.20040403120534.72"><vh>Added enable/disable methods to nullLog</vh></v>
<v t="ekr.20040403120534.73"><vh>Created  v.scriptSetBodyString</vh></v>
</v>
<v t="ekr.20040403120534.74"><vh>11/20 released 4.1 beta 4</vh>
<v t="ekr.20040403120534.75"><vh>created null frame,log,body,tree,menu,gui classes</vh></v>
</v>
<v t="ekr.20040403120534.76"><vh>11/19</vh>
<v t="ekr.20040403120534.77"><vh>Initialize write routines properly in Execute Script command</vh></v>
<v t="ekr.20040403120534.78"><vh>Leo now generates reference properly when more than one on the same line</vh></v>
<v t="ekr.20040403120534.79"><vh>Fixed several reorg bugs in leoPlugins.leo</vh></v>
<v t="ekr.20040403120534.80"><vh>Allow all Leo constructs in Execute Script command</vh></v>
<v t="ekr.20040403120534.81"><vh>Protected all tk code in leoPlugins.leo</vh></v>
<v t="ekr.20040403120534.82"><vh>Fixed reorg problem in the nav bar</vh></v>
<v t="ekr.20040403120534.83"><vh>Wrapped all calls to os.path</vh></v>
<v t="ekr.20040403120534.84"><vh>Convert doc sections to doc strings</vh></v>
</v>
<v t="ekr.20040403120534.85"><vh>11/18 released 4.1 beta 3</vh>
<v t="ekr.20040403120534.86"><vh>Fixed bug in initScriptFind</vh></v>
<v t="ekr.20040403120534.87"><vh>released 4.1b3</vh></v>
</v>
<v t="ekr.20040403120534.88"><vh>11/17</vh>
<v t="ekr.20040403120534.89"><vh>Fixed all problems reported by Pychecker</vh></v>
<v t="ekr.20040403120534.90"><vh>Fixed new crasher in batch change commands</vh></v>
<v t="ekr.20040403120534.91"><vh>Fixed new crasher in Show Invisibles command</vh></v>
<v t="ekr.20040403120534.92"><vh>Fixed (new?) unbounded recursion in Go To Next Clone command</vh></v>
<v t="ekr.20040403120534.93"><vh>Fixed (new?) crasher in Abort Edit Headline command</vh></v>
<v t="ekr.20040403120534.94"><vh>Fixed new crashers when opening popup menu</vh></v>
<v t="ekr.20040403120534.95"><vh>Fixed new crasher in Font panel</vh></v>
<v t="ekr.20040403120534.96"><vh>Import traceback only as needed</vh></v>
<v t="ekr.20040403120534.97"><vh>Fixed bug that caused new headlines not to be selected</vh></v>
<v t="ekr.20040403120534.98"><vh>getSelectionLines now returns the insertion line if no selection</vh></v>
<v t="ekr.20040403120534.99"><vh>Replaced c.body and c.log by c.frame.body &amp; c.frame.log</vh></v>
</v>
<v t="ekr.20040403120534.100"><vh>11/16</vh>
<v t="ekr.20040403120534.101"><vh>Reorg is now complete!</vh></v>
<v t="ekr.20040403120534.102"><vh>Moved menu utilities to leoMenu class</vh></v>
<v t="ekr.20040403120534.103"><vh>Removed all redirectors from frame to body</vh></v>
<v t="ekr.20040403120534.104"><vh>Simplified menu bindings</vh></v>
<v t="ekr.20040403120534.105"><vh>Fixed Find Matching Brackets command</vh></v>
</v>
<v t="ekr.20040403120534.106"><vh>11/15</vh>
<v t="ekr.20040403120534.107"><vh>Fixed problem with whole-word searches</vh></v>
<v t="ekr.20040403120534.108"><vh>Fixed problem with attaching icons to dialogs</vh></v>
<v t="ekr.20040403120534.109"><vh>Fixed crasher in Toggle Active Pane command</vh></v>
</v>
<v t="ekr.20040403120534.110"><vh>11/13</vh>
<v t="ekr.20040403120534.111"><vh>wx gui plugin now works again</vh></v>
<v t="ekr.20040403120534.112"><vh>Finished reorg</vh></v>
</v>
<v t="ekr.20040403120534.113"><vh>11/12</vh>
<v t="ekr.20040403120534.114"><vh>Created app.gui.utils class</vh></v>
<v t="ekr.20040403120534.115"><vh>Created base classes for color, compare, find, font &amp; prefs panels</vh></v>
<v t="ekr.20040403120534.116"><vh>Fixed Recent Files regression</vh></v>
</v>
<v t="ekr.20040403120534.117"><vh>11/10</vh>
<v t="ekr.20040403120534.118"><vh>Continued major reorg</vh></v>
<v t="ekr.20040403120534.119"><vh>Added redirection routines to leoFrame class</vh></v>
</v>
<v t="ekr.20040403120534.120"><vh>11/9</vh>
<v t="ekr.20040403120534.121"><vh>Reorganized the code to use leoMenu and leoTkinterMenu classes</vh></v>
<v t="ekr.20040403120534.122"><vh>Fixed LaTeX syntax coloring bug</vh></v>
<v t="ekr.20040403120534.123"><vh>Implemented a limited form of the Selection Only find/change commands</vh></v>
<v t="ekr.20040403120534.124"><vh>Created unit tests to run Check Outline command</vh></v>
</v>
<v t="ekr.20040403120534.125"><vh>11/8</vh>
<v t="ekr.20040403120534.126"><vh>Created Page Count script</vh></v>
</v>
<v t="ekr.20040403120534.127"><vh>11/7 4.1 beta 1 released</vh>
<v t="ekr.20040403120534.128"><vh>Fixed crasher in computeLoadDir</vh></v>
<v t="ekr.20040403120534.129"><vh>Fixed a real bug in the Change, Then Find command</vh></v>
<v t="ekr.20040403120534.130"><vh>Cleaned up Pychecker complaints</vh></v>
<v t="ekr.20040403120534.131"><vh>Released 4.1 beta 1</vh></v>
</v>
<v t="ekr.20040403120534.132"><vh>11/6</vh>
<v t="ekr.20040403120534.133"><vh>Create initScriptFind</vh></v>
<v t="ekr.20040403120534.134"><vh>Added support for undo</vh></v>
<v t="ekr.20040403120534.135"><vh>Yes, a script change checkbox IS a good idea</vh></v>
</v>
<v t="ekr.20040403120534.136"><vh>11/5</vh>
<v t="ekr.20040403120534.137"><vh>Got script search/change working (!!)</vh>
<v t="ekr.20040403120534.138"><vh>find script</vh></v>
</v>
<v t="ekr.20040403120534.139"><vh>Fixed Serious Undo Change All bug</vh></v>
<v t="ekr.20040403120534.140"><vh>Leo now ignores unknown prefs and find prefs</vh></v>
<v t="ekr.20040403120534.141"><vh>Leo now writes node_only find prefs</vh></v>
<v t="ekr.20040403120534.142"><vh>Fixed first node-only find bug</vh></v>
</v>
<v t="ekr.20040403120534.143"><vh>11/4</vh>
<v t="ekr.20040403120534.144"><vh>Fixed bug involving 0x1a characters in body text.</vh></v>
<v t="ekr.20040403120534.145"><vh>Added Check Outline command</vh></v>
<v t="ekr.20040403120534.146"><vh>Added Hoist/De-Hoist commands</vh></v>
</v>
<v t="ekr.20040403120534.147"><vh>11/3</vh>
<v t="ekr.20040403120534.148"><vh>Leo now does an auto-save only if files have actually been changed.</vh></v>
<v t="ekr.20040403120534.149"><vh>Changed all .leo files to use the -ko cvs option</vh></v>
</v>
<v t="ekr.20040403120534.150"><vh>11/2</vh>
<v t="ekr.20040403120534.151"><vh>Added use_gnx config setting</vh></v>
<v t="ekr.20040403120534.152"><vh>Converted to using gnx</vh></v>
</v>
</v>
<v t="ekr.20040403120534.153"><vh>October 2003</vh>
<v t="ekr.20040403120534.154"><vh>10/31</vh>
<v t="ekr.20040403120534.155"><vh>Added bindings to app.gui.root to catch all control keys</vh></v>
<v t="ekr.20040403120534.156"><vh>Added config_encoding setting</vh></v>
</v>
<v t="ekr.20040403120534.157"><vh>10/27</vh>
<v t="ekr.20040403120534.158"><vh>Colorizer now uses c.body routines</vh></v>
<v t="ekr.20040403120534.159"><vh>Replaced frame.top by frame in call to set_focus</vh></v>
<v t="ekr.20040403120534.160"><vh>Replace calls to after and after_idle by app.gui calls.</vh></v>
<v t="ekr.20040403120534.161"><vh>Removed app.root from all non-gui code</vh></v>
</v>
<v t="ekr.20040403120534.162"><vh>10/26 code reorg</vh>
<v t="ekr.20040403120534.163"><vh>Replaced all references to leoDialog by corresponding app.gui calls</vh></v>
<v t="ekr.20040403120534.164"><vh>Moved color panels into leoTkinterColorPanels.py</vh></v>
<v t="ekr.20040403120534.165"><vh>Replaced all direct references to color panels by corresponding appl.gui calls</vh></v>
<v t="ekr.20040403120534.166"><vh>Replaced all direct references to find panel by corresponding appl.gui calls</vh></v>
</v>
<v t="ekr.20040403120534.167"><vh>10/25</vh>
<v t="ekr.20040403120534.168"><vh>Made tnode indices immutable: fixed bad copy/paste bug</vh></v>
<v t="ekr.20040403120534.169"><vh>Fixed crasher with bad pattern match patterns</vh></v>
<v t="ekr.20040403120534.170"><vh>Fixed bug in Go To Line Number command</vh></v>
<v t="ekr.20040403120534.171"><vh>Disabled startup traces</vh></v>
<v t="ekr.20040403120534.172"><vh>Fixed plugin problems (now fixed in 4.0.2 and 4.1)</vh></v>
<v t="ekr.20040403120534.173"><vh>Cleaned up the reformatParagraph code</vh></v>
<v t="ekr.20040403120534.174"><vh>Removed kludge from setSelectionAreas</vh></v>
</v>
<v t="ekr.20040403120534.175"><vh>10/24</vh>
<v t="ekr.20040403120534.176"><vh>Completed new version of reformatParagraph</vh></v>
<v t="ekr.20040403120534.177"><vh>Rewrote findBoundParagraph using splitLines</vh></v>
<v t="ekr.20040403120534.178"><vh>Rewrote getInsertLines (leoTkinterBody)</vh></v>
<v t="ekr.20040403120534.179"><vh>Wrote splitLines &amp; joinLines utilities</vh></v>
<v t="ekr.20040403120534.180"><vh>Fixed problem with indent/undent</vh></v>
</v>
<v t="ekr.20040403120534.181"><vh>10/22</vh>
<v t="ekr.20040403120534.182"><vh>Fixed crasher in onOpenWithFileName</vh></v>
</v>
<v t="ekr.20040403120534.183"><vh>10/19</vh>
<v t="ekr.20040403120534.184"><vh>Made app.forceShutdown work in "idle" hook</vh></v>
<v t="ekr.20040403120534.185"><vh>Properly enable green back arrow in nav bar</vh></v>
</v>
<v t="ekr.20040403120534.186"><vh>10/17</vh>
<v t="ekr.20040403120534.187"><vh>Renamed .body to .bodyCtrl</vh></v>
<v t="ekr.20040403120534.188"><vh>Create leoTkinterLog  &amp; leoTkinterBody classes</vh></v>
<v t="ekr.20040403120534.189"><vh>Created frame.destroySelf routine</vh></v>
<v t="ekr.20040403120534.190"><vh>Eliminated all references to frame.top outside of LeoTkinterFrame class</vh></v>
<v t="ekr.20040403120534.191"><vh>tree.drawIcon now injects v.iconx and v.iconv ivars</vh></v>
<v t="ekr.20040403120534.192"><vh>Began gui reorg</vh></v>
<v t="ekr.20040403120534.193"><vh>4.0 final released</vh></v>
</v>
<v t="ekr.20040403120534.194"><vh>10/16</vh>
<v t="ekr.20040403120534.195"><vh>Created app.forceShutdown</vh></v>
<v t="ekr.20040403120534.196"><vh>Fixed more bugs in undoReplace: all undo tests now pass</vh></v>
</v>
<v t="ekr.20040403120534.197"><vh>10/15</vh>
<v t="ekr.20040403120534.198"><vh>Added several plugins and scripts to leoPlugins.leo</vh></v>
<v t="ekr.20040403120534.199"><vh>Removed "invalid @lineending directive" warning</vh></v>
<v t="ekr.20040403120534.200"><vh>Added support so plugins can force Leo to quit during startup</vh></v>
<v t="ekr.20040403120534.201"><vh>Fixed bug in removeSentinelsCommand</vh></v>
<v t="ekr.20040403120534.202"><vh>Improved Go To Line Number command</vh></v>
<v t="ekr.20040403120534.203"><vh>Improved confusing error message from Go To Line Number command</vh></v>
</v>
<v t="ekr.20040403120534.204"><vh>10/14</vh>
<v t="ekr.20040403120534.205"><vh>Added redirect_execute_script_output_to_log_pane setting</vh></v>
<v t="ekr.20040403120534.206"><vh>Speed up clone operation by calling initAllCloneBitsInTree</vh></v>
<v t="ekr.20040403120534.207"><vh>Several undo changes &amp; bug fixes</vh></v>
</v>
<v t="ekr.20040403120534.208"><vh>10/13 Released 4.0 beta 4</vh></v>
<v t="ekr.20040403120534.209"><vh>10/10</vh>
<v t="ekr.20040403120534.210"><vh>Added var or const prefixes when importing elisp</vh></v>
<v t="ekr.20040403120534.211"><vh>Added support for elisp colorising</vh></v>
<v t="ekr.20040403120534.212"><vh>Fixed bug in c.clone</vh></v>
<v t="ekr.20040403120534.213"><vh>Created hint messages for Extract Section &amp; Extract Section Names commands</vh></v>
<v t="ekr.20040403120534.214"><vh>changed string.letters to string.ascii_letters throughout</vh></v>
<v t="ekr.20040403120534.215"><vh>Fixed bug in bracket scanner</vh></v>
</v>
<v t="ekr.20040403120534.216"><vh>10/9 Released 4.0 beta 3</vh>
<v t="ekr.20040403120534.217"><vh>Added support for importing elisp (.el) files</vh></v>
<v t="ekr.20040403120534.218"><vh>Force a complete recolor after any cut/paste or corresponding undo/redo</vh></v>
<v t="ekr.20040403120534.219"><vh>Improved 4.0 version of Go To Line Number command</vh></v>
<v t="ekr.20040403120534.220"><vh>Released 4.0 beta 3</vh></v>
</v>
<v t="ekr.20040403120534.221"><vh>10/8</vh>
<v t="ekr.20040403120534.222"><vh>Fixed long-standing clone-mark bug</vh></v>
<v t="ekr.20040403120534.223"><vh>Added support for unknown tnode and vnode attributes</vh></v>
<v t="ekr.20040403120534.224"><vh>Fixed bug in gui destroy logic</vh></v>
<v t="ekr.20040403120534.225"><vh>Changed c.frame.mFileName to c.mFileName in plugins.leo</vh></v>
</v>
<v t="ekr.20040403120534.226"><vh>10/7</vh>
<v t="ekr.20040403120534.227"><vh>Fixed crash in sentinelName</vh></v>
<v t="ekr.20040403120534.228"><vh>Added __setattr__ method to leoProxy class</vh></v>
<v t="ekr.20040403120534.229"><vh>Reenabled orphans &amp; ignored test in new write logic</vh></v>
<v t="ekr.20040403120534.230"><vh>Cleaned up version code and added build number to signon</vh></v>
</v>
<v t="ekr.20040403120534.231"><vh>10/6</vh>
<v t="ekr.20040403120534.232"><vh>Converted the code to use newLeoCommanderAndFrame</vh></v>
<v t="ekr.20040403120534.233"><vh>Added better error message in setDefaultIcon</vh></v>
</v>
<v t="ekr.20040403120534.234"><vh>10/3 Released 4.0 beta 2</vh>
<v t="ekr.20040403120534.235"><vh>Released 4.0 beta 2</vh></v>
<v t="ekr.20040403120534.236"><vh>Fixed problem setting loadDir in startup logic</vh></v>
</v>
<v t="ekr.20040403120534.237"><vh>10/2</vh>
<v t="ekr.20040403120534.238"><vh>Still problems making Read @file Nodes undoable</vh></v>
<v t="ekr.20040403120534.239"><vh>Import Derived File command is now undoable</vh></v>
<v t="ekr.20040403120534.240"><vh>Moved Clear Recent Files menu item into Recent Files menu</vh></v>
<v t="ekr.20040403120534.241"><vh>Fixed bugs involving find params</vh></v>
<v t="ekr.20040403120534.242"><vh>Fixed Python Import bug</vh></v>
</v>
<v t="ekr.20040403120534.243"><vh>10/1</vh>
<v t="ekr.20040403120534.244"><vh>Added support for two new settings affecting drags</vh></v>
<v t="ekr.20040403120534.245"><vh>Marked changed nodes &amp; make the @file node and the outline dirty.</vh></v>
<v t="ekr.20040403120534.246"><vh>Fixed Go To Outline command so it doesn't crash: More work needed.</vh></v>
<v t="ekr.20040403120534.247"><vh>Ensured newlines before all sentinels in @rawfile</vh></v>
<v t="ekr.20040403120534.248"><vh>Fixed @rawfile write problem</vh></v>
</v>
</v>
<v t="ekr.20040403120534.249"><vh>Sept 2003</vh>
<v t="ekr.20040403120534.250"><vh>9/30</vh>
<v t="ekr.20040403120534.251"><vh>Removed unused v arg from writeOld/NewDerivedFiles</vh></v>
<v t="ekr.20040403120534.252"><vh>Removed unused nosentinels arg from writeNewDerivedFiles</vh></v>
<v t="ekr.20040403120534.253"><vh>Removed putLeadingNewlineFlag arg from putSentinel</vh></v>
<v t="ekr.20040403120534.254"><vh>Renamed new scanText to scanText4</vh></v>
<v t="ekr.20040403120534.255"><vh>Removed many Pychecker warnings</vh>
<v t="ekr.20040403120534.256"><vh>Details</vh></v>
</v>
<v t="ekr.20040403120534.257"><vh>Added better log message for Convert All Tabs/Blanks commands</vh></v>
<v t="ekr.20040403120534.258"><vh>Created leoProxy class and simplified the code</vh></v>
</v>
<v t="ekr.20040403120534.259"><vh>9/29</vh>
<v t="ekr.20040403120534.260"><vh>A "gotcha" re using global app var</vh></v>
<v t="ekr.20040403120534.261"><vh>Added crucial defensive checks in v.headString() and v.bodySting()</vh></v>
<v t="ekr.20040403120534.262"><vh>Fixed several more unicode bugs</vh></v>
<v t="ekr.20040403120534.263"><vh>Removed setApp function</vh></v>
</v>
<v t="ekr.20040403120534.264"><vh>9/28</vh>
<v t="ekr.20040403120534.265"><vh>Added many calls to toUnicode.  Marked with 9/28/03</vh></v>
<v t="ekr.20040403120534.266"><vh>trace now always prints arguments.</vh></v>
<v t="ekr.20040403120534.267"><vh>Rewrote icon code so it doesn't use PIL or tkIcon in Python 2.3</vh></v>
</v>
<v t="ekr.20040403120534.268"><vh>9/27 </vh>
<v t="ekr.20040403120534.269"><vh>Defined dialog and icons routines in tkinterGui and leoGui</vh></v>
<v t="ekr.20040403120534.270"><vh>Defined focus routines in tkinterGui and leoGui</vh></v>
<v t="ekr.20040403120534.271"><vh>Replaced app.runMainLoop with app.gui.runMainLoop</vh></v>
<v t="ekr.20040403120534.272"><vh>Created leoGui base class for tkinterGui class</vh></v>
<v t="ekr.20040403120534.273"><vh>Moved all gui startup logic into tkingerGui class</vh></v>
</v>
<v t="ekr.20040403120534.274"><vh>9/26 4.0 beta 1 released</vh>
<v t="ekr.20040403120534.275"><vh>changed default for config.write_old_format_derived_files</vh></v>
</v>
<v t="ekr.20040403120534.276"><vh>9/22</vh>
<v t="ekr.20040403120534.277"><vh>Changed leoConfig.txt so we write 3.x derived files if leoConfig.txt does not exist</vh></v>
<v t="ekr.20040403120534.278"><vh>writeAll and writeMissing now return a count of the written files</vh></v>
<v t="ekr.20040403120534.279"><vh>getLeoFile computes joinLists before reading derived files</vh></v>
<v t="ekr.20040403120534.280"><vh>Fixed putCode so @raw test passes</vh></v>
<v t="ekr.20040403120534.281"><vh>4.x code passes @delims test</vh></v>
</v>
<v t="ekr.20040403120534.282"><vh>9/21</vh>
<v t="ekr.20040403120534.283"><vh>Import derived file command now works for both 3.x and 4.x files</vh></v>
<v t="ekr.20040403120534.284"><vh>Test @file-nosent</vh></v>
<v t="ekr.20040403120534.285"><vh>Enclosed top-level read/write code in try/except</vh></v>
<v t="ekr.20040403120534.286"><vh>findChild now handles bad tnodeList indices without crashing</vh></v>
<v t="ekr.20040403120534.287"><vh>Fixed bugs in @+doc and @+at sentinels.</vh></v>
<v t="ekr.20040403120534.288"><vh>Removed Write 3.x Outline command</vh></v>
<v t="ekr.20040403120534.289"><vh>Auto-save on Write 3.x derived files.</vh></v>
<v t="ekr.20040403120534.290"><vh>Put section references only if not in raw mode</vh></v>
</v>
<v t="ekr.20040403120534.291"><vh>9/20 4.0 code works &amp; integrated with LeoPy.leo !!</vh>
<v t="ekr.20040403120534.292"><vh>Started merging of plugin code with leoAtFile.py</vh></v>
<v t="ekr.20040403120534.293"><vh>Fixed problems with @doc parts</vh></v>
<v t="ekr.20040403120534.294"><vh>Write @file Nodes does auto-save if we are writing new-format files</vh></v>
<v t="ekr.20040403120534.295"><vh>Changed Wirte 3.x/4x Derived File so they write multiple files</vh></v>
<v t="ekr.20040403120534.296"><vh>Fixed @last bug by using same code as in 3.x</vh></v>
<v t="ekr.20040403120534.297"><vh>Write 4.x Derived File command auto-saves outline</vh></v>
<v t="ekr.20040403120534.298"><vh>Fixed (?) @last newline bug</vh></v>
<v t="ekr.20040403120534.299"><vh>Removed all using_gnx ivars</vh></v>
<v t="ekr.20040403120534.300"><vh>Write code now clears tnodeList attribute before writing</vh></v>
<v t="ekr.20040403120534.301"><vh>Removed "not undoable" message from Read @file Nodes command</vh></v>
<v t="ekr.20040403120534.302"><vh>Removed app.use_gnx ivar</vh></v>
<v t="ekr.20040403120534.303"><vh>Set using_gnx in top_df.write_all</vh></v>
<v t="ekr.20040403120534.304"><vh>Created top_df.oldWrite and top_df.newWrite</vh></v>
<v t="ekr.20040403120534.305"><vh>Added test for unvisited nodes in read logic</vh></v>
</v>
<v t="ekr.20040403120534.306"><vh>9/19</vh>
<v t="ekr.20040403120534.307"><vh>Major reorganization of leoAtFile.py</vh></v>
<v t="ekr.20040403120534.308"><vh>Moved code from leoPlugins.leo to LeoPy.leo</vh></v>
<v t="ekr.20040403120534.309"><vh>Tested splitting very long doc words.</vh></v>
<v t="ekr.20040403120534.310"><vh>Removed @ws stuff</vh></v>
<v t="ekr.20040403120534.311"><vh>Fixed bug related to @last</vh></v>
<v t="ekr.20040403120534.312"><vh>Added Write 3.x Format Derived File command.</vh></v>
<v t="ekr.20040403120534.313"><vh>Added Clear Recent Files command</vh></v>
<v t="ekr.20040403120534.314"><vh>Added write_old_format_derived_files option</vh></v>
<v t="ekr.20040403120534.315"><vh>Removed @ws stuff</vh></v>
</v>
<v t="ekr.20040403120534.316"><vh>9/18</vh>
<v t="ekr.20040403120534.317"><vh>Fixed some (all?) problems with tnodeList</vh></v>
<v t="ekr.20040403120534.318"><vh>All files now pass the file-compare (semantic test)</vh></v>
<v t="ekr.20040403120534.319"><vh>Fixed @others bug</vh></v>
</v>
<v t="ekr.20040403120534.320"><vh>9/17</vh>
<v t="ekr.20040403120534.321"><vh>Wrote compare script</vh></v>
<v t="ekr.20040403120534.322"><vh>Wrote Import Derived File command</vh></v>
</v>
<v t="ekr.20040403120534.323"><vh>9/16</vh>
<v t="ekr.20040403120534.324"><vh>Changed how @ws sentinel works</vh></v>
<v t="ekr.20040403120534.325"><vh>Properly indent @nl sentinels</vh></v>
<v t="ekr.20040403120534.326"><vh>Fixed bugs in putting doc parts</vh></v>
<v t="ekr.20040403120534.327"><vh>Fixed bugs in readLastDocLine</vh></v>
</v>
<v t="ekr.20040403120534.328"><vh>9/14</vh>
<v t="ekr.20040403120534.329"><vh>Added ignoreOldSentinel to warn about 3.x sentinels</vh></v>
<v t="ekr.20040403120534.330"><vh>Milestone: first successful use of hidden machinery</vh></v>
<v t="ekr.20040403120534.331"><vh>Added support for tnodeList tag in fileCommands.getVnode</vh></v>
<v t="ekr.20040403120534.332"><vh>Rewrote createChild and renamed it to findChild</vh></v>
<v t="ekr.20040403120534.333"><vh>Added check to see whether read is the same as the write.</vh></v>
<v t="ekr.20040403120534.334"><vh>Added support for tnodeList</vh></v>
</v>
<v t="ekr.20040403120534.335"><vh>9/13 work on 4.0 read code</vh></v>
</v>
<v t="ekr.20040403120534.338"><vh>August 2003</vh>
<v t="ekr.20040403120534.339"><vh>8/30 Added horizontal scrollbar in body pane when @nowrap in effect</vh></v>
<v t="ekr.20040403120534.340"><vh>8/29 Removed Open Python Window command</vh></v>
<v t="ekr.20040403120534.341"><vh>8/28</vh>
<v t="ekr.20040403120534.342"><vh>Added encoding comments to leoGlobals.py and french plugins</vh></v>
<v t="ekr.20040403120534.343"><vh>Tested with Python 2.3</vh></v>
</v>
<v t="ekr.20040403120534.344"><vh>8/27 Recycle window objects only if more than one window open</vh></v>
</v>
<v t="ekr.20040403120534.345"><vh>July 2003</vh>
<v t="ekr.20040403120534.346"><vh>7/25 Improved Leo's FAQ</vh></v>
<v t="ekr.20040403120534.347"><vh>7/24</vh>
<v t="ekr.20040403120534.348"><vh>Fixed Linux install scripts</vh></v>
<v t="ekr.20040403120534.349"><vh>Changed default new window size in leoConfig.py to match leoConfig.txt</vh></v>
<v t="ekr.20040403120534.350"><vh>Added Help Wanted section to the main todo list</vh></v>
</v>
<v t="ekr.20040403120534.351"><vh>7/22</vh>
<v t="ekr.20040403120534.352"><vh>Called setDefaultDirectoryForNewFiles from all variants of the Save command</vh></v>
<v t="ekr.20040403120534.353"><vh>Added new hook for LeoN in the startup code</vh></v>
</v>
<v t="ekr.20040403120534.354"><vh>7/19 Fixed shortcut bug</vh></v>
<v t="ekr.20040403120534.355"><vh>7/18: Released 3.12 final</vh></v>
<v t="ekr.20040403120534.356"><vh>7/18:  Added preliminary wxWindows project</vh></v>
<v t="ekr.20040403120534.357"><vh>7/16</vh>
<v t="ekr.20040403120534.358"><vh>Finished unit testing of colorizer</vh></v>
<v t="ekr.20040403120534.359"><vh>Allow minus signs in rebol keywords</vh></v>
</v>
<v t="ekr.20040403120534.360"><vh>7/13</vh>
<v t="ekr.20040403120534.361"><vh>Fixed double-click bug on startup</vh></v>
<v t="ekr.20040403120534.362"><vh>Simplified startup logic</vh></v>
<v t="ekr.20040403120534.363"><vh>Created new screen shot on Leo's web site</vh></v>
</v>
<v t="ekr.20040403120534.364"><vh>7/11</vh>
<v t="ekr.20040403120534.365"><vh>Fixed reporting bug in convertAllTabs/Blanks</vh></v>
<v t="ekr.20040403120534.366"><vh>Removed c.copyTree and v.copyNode and rewrote v.copyTree</vh></v>
<v t="ekr.20040403120534.367"><vh>Fixed bugs involving undoing entire trees.</vh></v>
</v>
<v t="ekr.20040403120534.368"><vh>7/10</vh>
<v t="ekr.20040403120534.369"><vh>Improved (I hope) dragging code</vh></v>
<v t="ekr.20040403120534.370"><vh>Added support for actionscript and rebol</vh></v>
</v>
<v t="ekr.20040403120534.371"><vh>7/7</vh>
<v t="ekr.20040403120534.372"><vh>Improved how headlines are edited</vh></v>
<v t="ekr.20040403120534.373"><vh>Created separate leoPlugins.leo</vh></v>
<v t="ekr.20040403120534.374"><vh>(Checked all code involving getTextSelection)</vh></v>
</v>
<v t="ekr.20040403120534.375"><vh>Undo/redo now restore selection and insert point</vh></v>
<v t="ekr.20040403120534.376"><vh>Fixed still more Open With problems</vh></v>
</v>
<v t="ekr.20040403120534.377"><vh>June 2003</vh>
<v t="ekr.20040403120534.378"><vh>6/30</vh>
<v t="ekr.20040403120534.379"><vh>lift dialogs when they are deiconified</vh></v>
<v t="ekr.20040403120534.380"><vh>Fixed another bug in createOpenWithTempFile</vh></v>
<v t="ekr.20040403120534.381"><vh>Fixed missing log messages bug</vh></v>
<v t="ekr.20040403120534.382"><vh>Changed destroyOpenWithFilesForFrame and createOpenWithTempFile</vh></v>
</v>
<v t="ekr.20040403120534.383"><vh>6/29</vh>
<v t="ekr.20040403120534.384"><vh>Added doc strings for most classes.</vh></v>
<v t="ekr.20040403120534.385"><vh>Redefined all major classes so they can be overridden by plugins</vh></v>
<v t="ekr.20040403120534.386"><vh>Improved spell-check plugin</vh></v>
</v>
<v t="ekr.20040403120534.387"><vh>6/28 3.12 beta 1 released</vh>
<v t="ekr.20040403120534.388"><vh>Rewrote distribution scripts to handle new directory organization</vh></v>
<v t="ekr.20040403120534.389"><vh>Fixed three bugs reported by pychecker</vh></v>
</v>
<v t="ekr.20040403120534.390"><vh>6/27 Rewrote callbacks in createMenuEntries</vh></v>
<v t="ekr.20040403120534.391"><vh>6/24 Added @wrap and @nowrap directives</vh></v>
<v t="ekr.20040403120534.392"><vh>6/22</vh>
<v t="ekr.20040403120534.393"><vh>Investigated new Open With problem</vh></v>
<v t="ekr.20040403120534.394"><vh>Added special case to idle_body_key to handle delete key</vh></v>
<v t="ekr.20040403120534.395"><vh>atFile.scanText no longer strips leading whitespace from headlines</vh></v>
<v t="ekr.20040403120534.396"><vh>Made window bigger when opening Leo from leo.py</vh></v>
</v>
<v t="ekr.20040403120534.397"><vh>6/21 Completed all gc cleanup tasks</vh></v>
<v t="ekr.20040403120534.398"><vh>6/19</vh>
<v t="ekr.20040403120534.399"><vh>Moved all window closing code into app class</vh></v>
<v t="ekr.20040403120534.400"><vh>Removed all destroy routines</vh></v>
<v t="ekr.20040403120534.401"><vh>Removed all 4.0 debris</vh></v>
</v>
<v t="ekr.20040403120534.402"><vh>6/18</vh>
<v t="ekr.20040403120534.403"><vh>Scanned for fractional height/width params.  None remain.</vh></v>
<v t="ekr.20040403120534.404"><vh>Removed unused fractional widths from leoFind ctor</vh></v>
<v t="ekr.20040403120534.405"><vh>Set initial_window_width to 150 in leoConfig</vh></v>
</v>
<v t="ekr.20040403120534.406"><vh>6/16 Fixed _huge_ leak in Tk.Canvas</vh></v>
<v t="ekr.20040403120534.407"><vh>6/10 Implemented incremental redrawing</vh></v>
<v t="ekr.20040403120534.408"><vh>6/8 Resolved copying issue</vh></v>
<v t="ekr.20040403120534.409"><vh>6/1 Removed improper clones</vh></v>
</v>
<v t="ekr.20040403120534.410"><vh>May 2003</vh>
<v t="ekr.20040403120534.411"><vh>5/31</vh>
<v t="ekr.20040403120534.412"><vh>Disabled cut/paste of outlines</vh></v>
</v>
<v t="ekr.20040403120534.413"><vh>5/23</vh>
<v t="ekr.20040403120534.414"><vh>Added "close-frame" &amp; "destroy-all-global-windows" hook code to destroy nav windows</vh></v>
<v t="ekr.20040403120534.415"><vh>Added titles to Recent and Marks dialogs.</vh></v>
<v t="ekr.20040403120534.416"><vh>Added "close-frame" and "destroy-all-global-windows" hooks</vh></v>
</v>
<v t="ekr.20040403120534.417"><vh>5/22</vh>
<v t="ekr.20040403120534.418"><vh>Rewrote the nav_buttons plugin using classes</vh></v>
<v t="ekr.20040403120534.419"><vh>Completed nav_buttons plugin</vh></v>
</v>
<v t="ekr.20040403120534.420"><vh>5/22 ** nav_buttons plugin!</vh>
<v t="ekr.20040403120534.421"><vh>Created nav_buttons plugin</vh></v>
<v t="ekr.20040403120534.422"><vh>use string.zfill instead of aString.zfill in color_markup plugin</vh></v>
</v>
<v t="ekr.20040403120534.423"><vh>5/21</vh>
<v t="ekr.20040403120534.424"><vh>Experiments with startup scripts</vh></v>
</v>
<v t="ekr.20040403120534.425"><vh>5/20 ** Added Icon &amp; Status areas</vh>
<v t="ekr.20040403120534.426"><vh>Added idle handler to update the row/col indicator in the status area</vh></v>
<v t="ekr.20040403120534.427"><vh>Added convenience routines for icon &amp; status areas</vh></v>
<v t="ekr.20040403120534.428"><vh>Disable non-functional parts of Find panel</vh></v>
<v t="ekr.20040403120534.429"><vh>Selected find text on entry to find panel</vh></v>
<v t="ekr.20040403120534.430"><vh>Added icon/status areas.  REMOVED MAJOR KLUDGE</vh></v>
</v>
<v t="ekr.20040403120534.431"><vh>5/19</vh>
<v t="ekr.20040403120534.432"><vh>Partially cleaned up leoFind class</vh></v>
<v t="ekr.20040403120534.433"><vh>TO DO: Convenience routines</vh></v>
<v t="ekr.20040403120534.434"><vh>Removed checkForLeoCustomize &amp; related logic</vh></v>
<v t="ekr.20040403120534.435"><vh>Documented new stub hooks</vh></v>
</v>
<v t="ekr.20040403120534.436"><vh>5/18</vh>
<v t="ekr.20040403120534.437"><vh>Added support for bolditalic and italicbold</vh></v>
<v t="ekr.20040403120534.438"><vh>Rewrote logic involving images.</vh></v>
</v>
<v t="ekr.20040403120534.439"><vh>5/17</vh>
<v t="ekr.20040403120534.440"><vh>Simplified startup code</vh></v>
<v t="ekr.20040403120534.441"><vh>Created the add_directives plugin</vh></v>
<v t="ekr.20040403120534.442"><vh>Created "scan-directives" hook in scanDirectives</vh></v>
<v t="ekr.20040403120534.443"><vh>Created "init-color-markup" hook</vh></v>
<v t="ekr.20040403120534.444"><vh>Fixed recent bug in colorizer</vh></v>
</v>
<v t="ekr.20040403120534.445"><vh>5/16</vh>
<v t="ekr.20040403120534.446"><vh>Improved how Leo loads plugins</vh></v>
<v t="ekr.20040403120534.447"><vh>Cleaned up some hooks</vh></v>
<v t="ekr.20040403120534.448"><vh>Created plugin to handle markup in body pane</vh></v>
<v t="ekr.20040403120534.449"><vh>Added stub hooks for cutomizing the drawing of the outline</vh></v>
<v t="ekr.20040403120534.450"><vh>Removed toggle &lt;&lt; &gt;&gt; command</vh></v>
</v>
<v t="ekr.20040403120534.451"><vh>5/15 stub hooks</vh>
<v t="ekr.20040403120534.452"><vh>Created the plugin and script menu plugins</vh></v>
<v t="ekr.20040403120534.453"><vh>Breakthough: stub hooks &amp; alphabetical order</vh></v>
</v>
<v t="ekr.20040403120534.454"><vh>5/13</vh>
<v t="ekr.20040403120534.455"><vh>Progress report 5/13/03: please read</vh></v>
<v t="ekr.20040403120534.456"><vh>Merged devel folder into main cvs folder</vh></v>
<v t="ekr.20040403120534.457"><vh>Updated version number to 4.0 alpha 1</vh></v>
<v t="ekr.20040403120534.458"><vh>Removed __init__ from files managed by LeoPy.leo</vh></v>
<v t="ekr.20040403120534.459"><vh>Use @ignore for all scripts</vh></v>
</v>
<v t="ekr.20040403120534.460"><vh>5/12</vh>
<v t="ekr.20040403120534.461"><vh>Reorganized Leo folder: big change to cvs</vh></v>
<v t="ekr.20040403120534.462"><vh>Investigated strange behavior of log pane during Open commands</vh></v>
</v>
<v t="ekr.20040403120534.463"><vh>5/4</vh>
<v t="ekr.20040403120534.464"><vh>Gathered statistics for threadNext</vh></v>
<v t="ekr.20040403120534.465"><vh>defined funcToMethod in leoGlobals.py</vh></v>
<v t="ekr.20040403120534.466"><vh>Experimented with precomputing threadNext and threadBack when linking nodes</vh></v>
<v t="ekr.20040403120534.467"><vh>Experimented with using v.mChildren to represent children</vh></v>
<v t="ekr.20040403120534.468"><vh>Changed OnIconDoubleClick to allow @url url comments</vh></v>
<v t="ekr.20040403120534.469"><vh>atFile code now use _permanent_ fileCommands.tnodesDict</vh></v>
<v t="ekr.20040403120534.470"><vh>Improved and tested checkForPossiblyBrokenLinks</vh></v>
<v t="ekr.20040403120534.471"><vh>Cleaned up atFile.read code</vh></v>
<v t="ekr.20040403120534.472"><vh>Cleaned up getVnode code</vh></v>
<v t="ekr.20040403120534.473"><vh>Added headString arg to tnode ctor</vh></v>
<v t="ekr.20040403120534.474"><vh>Moved createTopologyList to leoGlobals.py</vh></v>
</v>
<v t="ekr.20040403120534.475"><vh>5/3</vh>
<v t="ekr.20040403120534.476"><vh>Many changes to file reading code</vh></v>
<v t="ekr.20040403120534.477"><vh>Created scripts to check outline for clone &amp; joinList errors</vh></v>
<v t="ekr.20040403120534.478"><vh>Moved headlines into tnodes</vh></v>
<v t="ekr.20040403120534.479"><vh>Second rewrite of v.joinNodeTo</vh></v>
</v>
<v t="ekr.20040403120534.480"><vh>5/2</vh>
<v t="ekr.20040403120534.481"><vh>updateRecentFiles does nothing on Null filenames</vh></v>
<v t="ekr.20040403120534.482"><vh>Major change: rewrote joinList code and move joinLists to tnodes</vh></v>
</v>
<v t="ekr.20040403120534.483"><vh>5/1</vh>
<v t="ekr.20040403120534.484"><vh>Fixed bug when userID != defaultID</vh></v>
<v t="ekr.20040403120534.485"><vh>Made lines following @+t and @+v look like sentinels</vh></v>
<v t="ekr.20040403120534.486"><vh>Checked that Leo 3.11 can read new .leo files</vh></v>
<v t="ekr.20040403120534.487"><vh>Made sure leo works without leoID.txt when use_gnx is false</vh></v>
<v t="ekr.20040403120534.488"><vh>Optimized how Leo allocates t.gnx</vh></v>
</v>
</v>
<v t="ekr.20040403120534.489"><vh>April 2003</vh>
<v t="ekr.20040403120534.490"><vh>4/20</vh>
<v t="ekr.20040403120534.491"><vh>Removed vnx fields from vnodes and +v sentinels</vh></v>
<v t="ekr.20040403120534.492"><vh>Put getpreferredencoding code in try: except blocks</vh></v>
<v t="ekr.20040403120534.493"><vh>Made sure that code works on old files when a.use_gnx is true</vh></v>
<v t="ekr.20040403120534.494"><vh>Replaced fileCommands.getT by self.tnodesDict.get</vh></v>
</v>
<v t="ekr.20040403120534.495"><vh>4/29 Transition to 4.0 .leo files</vh>
<v t="ekr.20040403120534.496"><vh>Allocate gnx's only when needed (when writing files)</vh></v>
<v t="ekr.20040403120534.497"><vh>4.0 code writes tnodes even if they have no body text</vh></v>
<v t="ekr.20040403120534.498"><vh>4.0 code writes tnx="tnx" instead of t="index" in vnodes and tnodes</vh></v>
<v t="ekr.20040403120534.499"><vh>Write vnx and tnx instead of gnx in vnodes and tnodes</vh></v>
<v t="ekr.20040403120534.500"><vh>Made use_pre_4pt0_file_formats setting functional</vh></v>
</v>
<v t="ekr.20040403120534.501"><vh>4/28</vh>
<v t="ekr.20040403120534.502"><vh>Use tuples instead of dicts in nodeIndices class</vh></v>
<v t="ekr.20040403120534.503"><vh>Added code to remove gnx id if it matches default_gnx_id</vh></v>
<v t="ekr.20040403120534.504"><vh>Added code to read/write default_gnx_id field in globals section</vh></v>
<v t="ekr.20040403120534.505"><vh>Added code to write gnx attribute of tnodes and vnodes</vh></v>
<v t="ekr.20040403120534.506"><vh>Added code to read gnx attribute of tnodes and vnodes</vh></v>
<v t="ekr.20040403120534.507"><vh>Added old and new to list of valid @file options</vh></v>
<v t="ekr.20040403120534.508"><vh>Added use_pre_4pt0_file_formats config option</vh></v>
<v t="ekr.20040403120534.509"><vh>Added Write Old Format Outline command to Export menu</vh></v>
</v>
<v t="ekr.20040403120534.510"><vh>4/27</vh>
<v t="ekr.20040403120534.511"><vh>Made read-only messages red</vh></v>
<v t="ekr.20040403120534.512"><vh>4.x code always writes @+t sentinels even for empty nodes</vh></v>
<v t="ekr.20040403120534.513"><vh>Created gnx's in vnode and tnode ctors</vh></v>
</v>
<v t="ekr.20040403120534.514"><vh>4/27 3.11 final released</vh></v>
<v t="ekr.20040403120534.515"><vh>4/26</vh>
<v t="ekr.20040403120534.516"><vh>Greatly simplified Plugins menu code using list comprehensions</vh></v>
<v t="ekr.20040403120534.517"><vh>Added 4.0 code to atFile.read that deletes all children of root</vh></v>
<v t="ekr.20040403120534.518"><vh>Fixed bug that prevented email line in About Leo from working</vh></v>
<v t="ekr.20040403120534.519"><vh>Prepared for 3.11 final: updated dates and urls</vh></v>
<v t="ekr.20040403120534.520"><vh>Fixed various bugs reported by Pychecker</vh></v>
</v>
<v t="ekr.20040403120534.521"><vh>4/24</vh>
<v t="ekr.20040403120534.522"><vh>Added support for @lineending directive</vh></v>
<v t="ekr.20040403120534.523"><vh>Created utility routines for scanAllDirectives and scanDirectives</vh></v>
<v t="ekr.20040403120534.524"><vh>Fixed bug in skip_long</vh></v>
</v>
<v t="ekr.20040403120534.525"><vh>4/23 Improved dialog that gets id for leoID.txt</vh></v>
<v t="ekr.20040403120534.526"><vh>4/22 Added getpreferredencoding to leoGlobals.py</vh></v>
<v t="ekr.20040403120534.527"><vh>4/21 Added patch by Davide Salomoni to OnIconDoubleClick</vh></v>
<v t="ekr.20040403120534.528"><vh>4/20 Removed all __del__ methods</vh></v>
<v t="ekr.20040403120534.529"><vh>4/5 Removed write_clone_indices &amp; use_relative_node_indices config ivars</vh></v>
<v t="ekr.20040403120534.530"><vh>4/5 Added thin_at_file_trees &amp; load_derived_files_immediately options</vh></v>
<v t="ekr.20040403120534.531"><vh>4/4 Added call to c.redraw() in fileCommands.readAtFileNodes</vh></v>
<v t="ekr.20040403120534.532"><vh>4/4 Fixed unicode bugs when Tangling and Untangling</vh></v>
<v t="ekr.20040403120534.533"><vh>4/3 Eliminated caught exception in frame.setTabWidth</vh></v>
</v>
<v t="ekr.20040403120534.534"><vh>March 2003</vh>
<v t="ekr.20040403120534.535"><vh>3/30 Don't write gnx for ending sentinels</vh></v>
<v t="ekr.20040403120534.536"><vh>3/30 Added code to handle afterref sentinels</vh></v>
<v t="ekr.20040403120534.537"><vh>3/29 New read logic passes its first test</vh></v>
<v t="ekr.20040403120534.538"><vh>3/28 Use scanText as a base for 4.0 read logic</vh></v>
<v t="ekr.20040403120534.539"><vh>3/26</vh>
<v t="ekr.20040403120534.540"><vh>Installer now creates plugins directory</vh></v>
<v t="ekr.20040403120534.541"><vh>Improved scrolling when moving right</vh>
<v t="ekr.20040403120534.542"><vh>Test</vh>
<v t="ekr.20040403120534.543"><vh>NewHeadline</vh></v>
<v t="ekr.20040403120534.544"><vh>NewHeadline</vh></v>
<v t="ekr.20040403120534.545"><vh>NewHeadline</vh></v>
<v t="ekr.20040403120534.546"><vh>NewHeadline</vh></v>
<v t="ekr.20040403120534.547"><vh>NewHeadline</vh></v>
<v t="ekr.20040403120534.548"><vh>NewHeadline</vh></v>
<v t="ekr.20040403120534.549"><vh>NewHeadline</vh></v>
<v t="ekr.20040403120534.550"><vh>NewHeadline</vh></v>
<v t="ekr.20040403120534.551"><vh>NewHeadline</vh></v>
<v t="ekr.20040403120534.552"><vh>NewHeadline</vh></v>
<v t="ekr.20040403120534.553"><vh>NewHeadline</vh></v>
<v t="ekr.20040403120534.554"><vh>NewHeadline</vh></v>
<v t="ekr.20040403120534.555"><vh>NewHeadline</vh></v>
<v t="ekr.20040403120534.556"><vh>NewHeadline</vh></v>
<v t="ekr.20040403120534.557"><vh>NewHeadline</vh></v>
<v t="ekr.20040403120534.558"><vh>NewHeadline</vh></v>
<v t="ekr.20040403120534.559"><vh>NewHeadline</vh></v>
</v>
</v>
<v t="ekr.20040403120534.560"><vh>3/26 Removed duplicate redraws when renaming nodes</vh></v>
</v>
<v t="ekr.20040403120534.561"><vh>3/25 Created frame.setWindowTitle and associated logic</vh></v>
<v t="ekr.20040403120534.562"><vh>3/22</vh>
<v t="ekr.20040403120534.563"><vh>3/22 Added support for body/headline_gmt_time settings</vh></v>
<v t="ekr.20040403120534.564"><vh>3/22 Allow color param when queuing messages to log pane</vh></v>
<v t="ekr.20040403120534.565"><vh>3/22 Check for valid encoding when setting app().tkEncoding</vh></v>
</v>
<v t="ekr.20040403120534.566"><vh>3/18</vh>
<v t="ekr.20040403120534.567"><vh>3/18 Use app().tkEncoding to convert to unicode in log pane</vh></v>
<v t="ekr.20040403120534.568"><vh>3/18 Tangle now supports output_newline option</vh></v>
</v>
<v t="ekr.20040403120534.569"><vh>3/17 Fixed bugs in promote/demote</vh></v>
<v t="ekr.20040403120534.570"><vh>3/8</vh>
<v t="ekr.20040403120534.571"><vh>3/8 Full recolor after paste</vh></v>
<v t="ekr.20040403120534.572"><vh>3/8 Put file name first in window title</vh></v>
<v t="ekr.20040403120534.573"><vh>3/8 Added calls to toEncodedString before many calls to write</vh></v>
</v>
<v t="ekr.20040403120534.574"><vh>3/7</vh>
<v t="ekr.20040403120534.575"><vh>3/7 Fixed huge performance bug in v.unjoinNode</vh></v>
<v t="ekr.20040403120534.576"><vh>3/7 Added statistics gathering routines to leoGlobals.py</vh></v>
</v>
</v>
<v t="ekr.20040403120534.577"><vh>Feb 2003</vh>
<v t="ekr.20040403120534.578"><vh>2/26 3.11b3 released</vh></v>
<v t="ekr.20040403120534.579"><vh>2/20 Reinstated Expand All command</vh></v>
<v t="ekr.20040403120534.580"><vh>2/18 Fixed auto-indent for python</vh></v>
<v t="ekr.20040403120534.581"><vh>2/17 Fixed minor Import @root bugs</vh></v>
<v t="ekr.20040403120534.582"><vh>02/17 3.11b1 released</vh></v>
<v t="ekr.20040403120534.583"><vh>02/11</vh>
<v t="ekr.20040403120534.584"><vh>Fixed crasher in canFindMatchingBracket</vh></v>
<v t="ekr.20040403120534.585"><vh>Removed odious locks on customizeLeo.py</vh></v>
<v t="ekr.20040403120534.586"><vh>Fixed control-V bug for Linux</vh></v>
</v>
<v t="ekr.20040403120534.587"><vh>02/08</vh>
<v t="ekr.20040403120534.588"><vh>Major reorganization of hooks</vh></v>
<v t="ekr.20040403120534.589"><vh>Fixed bug: double-clicking icon set the cursor to the hand</vh></v>
<v t="ekr.20040403120534.590"><vh>Fixed bug: v.OnEndDrag fires event only if dragging</vh></v>
</v>
<v t="ekr.20040403120534.591"><vh>02/07</vh>
<v t="ekr.20040403120534.592"><vh>replaced c.contractVnode and c.expandVnode</vh></v>
</v>
<v t="ekr.20040403120534.593"><vh>02/04</vh>
<v t="ekr.20040403120534.594"><vh>Fixed "% (greenOgre)" config bug</vh></v>
</v>
<v t="ekr.20040403120534.595"><vh>02/02</vh>
<v t="ekr.20040403120534.596"><vh>Added code to scroll partially visible headlines when they are selected</vh></v>
</v>
<v t="ekr.20040403120534.597"><vh>02/01</vh>
<v t="ekr.20040403120534.598"><vh>Added code to allow sorting of top-level nodes</vh></v>
<v t="ekr.20040403120534.599"><vh>Hacked atFile.writeAll to allow multiple writes of cloned nodes</vh></v>
<v t="ekr.20040403120534.600"><vh>Removed redundant code from v.set/clearDirty routines</vh></v>
</v>
</v>
<v t="ekr.20040403120534.601"><vh>Jan 2003</vh>
<v t="ekr.20040403120534.602"><vh>01/31</vh>
<v t="ekr.20040403120534.603"><vh>Udated recent files menu when saving a new .leo file</vh></v>
<v t="ekr.20040403120534.604"><vh>Prefs dialog close button equivalent to cancel</vh></v>
<v t="ekr.20040403120534.605"><vh>Fixed about hooks typo</vh></v>
<v t="ekr.20040403120534.606"><vh>New Go To First/Last/Parent/Prev Sibling/Next Sibling commands</vh></v>
<v t="ekr.20040403120534.607"><vh>Major improvements to expand/contract commands</vh></v>
</v>
<v t="ekr.20040403120534.608"><vh>1/30</vh>
<v t="ekr.20040403120534.609"><vh>Create Toggle Angle Brackets command</vh></v>
<v t="ekr.20040403120534.610"><vh>Created Insert Body/Headline Time/Date routines</vh></v>
<v t="ekr.20040403120534.611"><vh>Added "Replace tabs with spaces" checkbox in Prefs panel</vh></v>
<v t="ekr.20040403120534.612"><vh>Made Find button the default button in the Find panel</vh></v>
<v t="ekr.20040403120534.613"><vh>Allowed @comment with @language plain</vh></v>
</v>
<v t="ekr.20040403120534.614"><vh>1/29</vh>
<v t="ekr.20040403120534.615"><vh>Added "save1" and "save2" hooks</vh></v>
<v t="ekr.20040403120534.616"><vh>Added disabled support for @folder to customizeLeo.py</vh></v>
<v t="ekr.20040403120534.617"><vh>Added support for Show Invisible color options</vh></v>
<v t="ekr.20040403120534.618"><vh>Added support for look_for_control_drag_on_mouse_down option</vh></v>
</v>
<v t="ekr.20040403120534.619"><vh>1/25</vh>
<v t="ekr.20040403120534.620"><vh>Fixed problem with block comments</vh>
<v t="ekr.20040403120534.621"><vh>Report</vh></v>
<v t="ekr.20040403120534.622"><vh>Reply</vh></v>
</v>
</v>
<v t="ekr.20040403120534.623"><vh>1/24</vh>
<v t="ekr.20040403120534.624"><vh>Fixed problem with cutting &amp; pasting nodes</vh></v>
<v t="ekr.20040403120534.625"><vh>Removed potential hang in frame.OnOpenWith</vh></v>
<v t="ekr.20040403120534.626"><vh>Added support for body_insertion_cursor_color setting</vh></v>
<v t="ekr.20040403120534.627"><vh>Fixed unicode in Tangle logic</vh></v>
</v>
<v t="ekr.20040403120534.628"><vh>1/23 Completed transition to unicode</vh></v>
<v t="ekr.20040403120534.629"><vh>1/21 Encode find/change strings as utf-8 in leoConfig.txt</vh></v>
<v t="ekr.20040403120534.630"><vh>1/20 Began conversion to unicode internally</vh></v>
<v t="ekr.20040403120534.631"><vh>1/18</vh>
<v t="ekr.20040403120534.632"><vh>Worked around True/False problems in Python 2.3 a1</vh></v>
</v>
<v t="ekr.20040403120534.633"><vh>1/7</vh>
<v t="ekr.20040403120534.634"><vh>Added colon to list of bad characters removed by sanitize_filename</vh></v>
</v>
</v>
</v>
<v t="ekr.20040403120534.635"><vh>2002</vh>
<v t="ekr.20040403120534.636"><vh>Dec 2002</vh>
<v t="ekr.20040403120534.637"><vh>12/18</vh>
<v t="ekr.20040403120534.638"><vh>Added event=event to handleLeoHook</vh></v>
<v t="ekr.20040403120534.639"><vh>Demoted up/down arrow stuff to a disabled hook for now.</vh></v>
</v>
<v t="ekr.20040403120534.640"><vh>12/17</vh>
<v t="ekr.20040403120534.641"><vh>Created tree.moveUpDown</vh></v>
</v>
<v t="ekr.20040403120534.642"><vh>112/16</vh>
<v t="ekr.20040403120534.643"><vh>Replaced string.x(s...) by s.x(...)</vh></v>
<v t="ekr.20040403120534.644"><vh>Improved es and trace, added trace_tag</vh></v>
<v t="ekr.20040403120534.645"><vh>Fixed crasher in undo logic</vh></v>
<v t="ekr.20040403120534.646"><vh>Reset the canvas cursor by brute force</vh></v>
<v t="ekr.20040403120534.647"><vh>Tried to prevent "stuck" drag cursor</vh></v>
<v t="ekr.20040403120534.648"><vh>Reviewed all calls to handleLeoHook </vh></v>
<v t="ekr.20040403120534.649"><vh>Fixed pychecker problems</vh></v>
</v>
<v t="ekr.20040403120534.650"><vh>12/14/02 3.10 released</vh></v>
<v t="ekr.20040403120534.651"><vh>12/12</vh>
<v t="ekr.20040403120534.652"><vh>Added "missing" event hooks</vh></v>
</v>
<v t="ekr.20040403120534.653"><vh>12/11</vh>
<v t="ekr.20040403120534.654"><vh>Fixed major bug in Execute Script command</vh></v>
</v>
<v t="ekr.20040403120534.655"><vh>12/10</vh>
<v t="ekr.20040403120534.656"><vh>Added convenience routines to redirect stderr and stdout</vh></v>
</v>
<v t="ekr.20040403120534.657"><vh>12/8</vh>
<v t="ekr.20040403120534.658"><vh>wrote redirectPrintToLog &amp; restorePrintFromLog</vh></v>
<v t="ekr.20040403120534.659"><vh>Fixed @nsf bug reported by Travers A. Hough</vh></v>
<v t="ekr.20040403120534.660"><vh>Discovered bugs in undoReplace logic</vh></v>
</v>
<v t="ekr.20040403120534.661"><vh>12/7</vh>
<v t="ekr.20040403120534.662"><vh>Fixed undo bug</vh></v>
</v>
<v t="ekr.20040403120534.663"><vh>12/6</vh>
<v t="ekr.20040403120534.664"><vh>Fixed reversion involving @comment &amp; @language together</vh></v>
<v t="ekr.20040403120534.665"><vh>major revision of the menu code</vh></v>
</v>
<v t="ekr.20040403120534.666"><vh>12/4</vh>
<v t="ekr.20040403120534.667"><vh>Fixed path problem in paths passed to tangle_done.py</vh></v>
<v t="ekr.20040403120534.668"><vh>Fixed Recent Files command</vh></v>
<v t="ekr.20040403120534.669"><vh>Fixed problems with Open With code in customizeLeo.py</vh></v>
<v t="ekr.20040403120534.670"><vh>Fixed crasher in colorizeAnyLanguage</vh></v>
<v t="ekr.20040403120534.671"><vh>Fixed major memory leak</vh></v>
<v t="ekr.20040403120534.672"><vh>Changed shortcut to Find Previous so Alt - F4 closes Leo</vh></v>
<v t="ekr.20040403120534.673"><vh>Changed url of help file</vh></v>
<v t="ekr.20040403120534.674"><vh>Removed backquotes from most print statements</vh></v>
<v t="ekr.20040403120534.675"><vh>Removed synonyms from leoImport.py and leoTangle.py</vh></v>
</v>
<v t="ekr.20040403120534.676"><vh>12/3</vh>
<v t="ekr.20040403120534.677"><vh>Converted leoConfig.py to use @root-code</vh></v>
<v t="ekr.20040403120534.678"><vh>Added @file &amp; @root options</vh></v>
<v t="ekr.20040403120534.679"><vh>Fixed a bug in Untangle</vh></v>
<v t="ekr.20040403120534.680"><vh>Decided not to do utils_normpath</vh></v>
</v>
</v>
<v t="ekr.20040403120534.681"><vh>Nov 2002</vh>
<v t="ekr.20040403120534.682"><vh>11/25</vh>
<v t="ekr.20040403120534.683"><vh>Improved Leo's window icon</vh></v>
<v t="ekr.20040403120534.684"><vh>cleaned up config code relating to find settings</vh></v>
<v t="ekr.20040403120534.685"><vh>Added Node only option to find menu</vh></v>
<v t="ekr.20040403120534.686"><vh>Added Export Headlines command</vh></v>
</v>
<v t="ekr.20040403120534.687"><vh>11/21</vh>
<v t="ekr.20040403120534.688"><vh>Fixed bug in colorizeAnyLine</vh></v>
<v t="ekr.20040403120534.689"><vh>Improved undo for Edit Body commands</vh></v>
</v>
<v t="ekr.20040403120534.690"><vh>11/20</vh>
<v t="ekr.20040403120534.691"><vh>Fixed unicode bugs</vh></v>
</v>
<v t="ekr.20040403120534.692"><vh>11/19</vh>
<v t="ekr.20040403120534.693"><vh>Changed use_configureLeo_dot_py to use_customizeLeo_dot_py</vh></v>
<v t="ekr.20040403120534.694"><vh>Create all non-existent directories using makeAllNonExistentDirectories</vh></v>
<v t="ekr.20040403120534.695"><vh>Made sure all open calls are in try blocks.</vh></v>
<v t="ekr.20040403120534.696"><vh>Recolor entire pane if @color or @nocolor change</vh></v>
<v t="ekr.20040403120534.697"><vh>Changed the lamda used to define the Recent Files callback</vh></v>
<v t="ekr.20040403120534.698"><vh>Added "openwith", "recentfiles" and "@url" hooks</vh></v>
<v t="ekr.20040403120534.699"><vh>Fixed big leak in undo</vh></v>
<v t="ekr.20040403120534.700"><vh>Properly save and restore selection range for undo.</vh></v>
<v t="ekr.20040403120534.701"><vh>Fixed bug that caused a backspace in an empty body text to insert a newline.</vh></v>
<v t="ekr.20040403120534.702"><vh>Made Undo bulletproof</vh></v>
<v t="ekr.20040403120534.703"><vh>Removed code in tree.select that removed trailing newlines</vh></v>
</v>
<v t="ekr.20040403120534.704"><vh>11/18</vh>
<v t="ekr.20040403120534.705"><vh>Added Open with entries to popup menus</vh></v>
<v t="ekr.20040403120534.706"><vh>Added David McNab's auto-indent patch (smart_auto_indent option)</vh></v>
</v>
<v t="ekr.20040403120534.707"><vh>11/17</vh>
<v t="ekr.20040403120534.708"><vh>Added "headkey1" and "headkey2" hooks</vh></v>
</v>
<v t="ekr.20040403120534.709"><vh>11/16</vh>
<v t="ekr.20040403120534.710"><vh>added enableIdleTimeHook, disableIdleTimeHook, idleTimeHookHandler</vh></v>
<v t="ekr.20040403120534.711"><vh>Completed first draft of Go To Line Number command</vh></v>
</v>
<v t="ekr.20040403120534.712"><vh>11/15</vh>
<v t="ekr.20040403120534.713"><vh>Added Go To Line Number command</vh></v>
<v t="ekr.20040403120534.714"><vh>Rewrote syntax coloring for cweb</vh></v>
</v>
<v t="ekr.20040403120534.715"><vh>11/14</vh>
<v t="ekr.20040403120534.716"><vh>Fixed bug in atFile.scanAllDirectives involving @language</vh></v>
</v>
<v t="ekr.20040403120534.717"><vh>11/13</vh>
<v t="ekr.20040403120534.718"><vh>Added keywords parameter to customizeLeo</vh></v>
<v t="ekr.20040403120534.719"><vh>Implemented the use_configureLeo_dot_py option</vh></v>
<v t="ekr.20040403120534.720"><vh>Released first public draft of incremental undo</vh></v>
</v>
<v t="ekr.20040403120534.721"><vh>11/10</vh>
<v t="ekr.20040403120534.722"><vh>Correctly colors Pascal's "private" and "uses" keywords</vh></v>
</v>
<v t="ekr.20040403120534.723"><vh>11/9</vh>
<v t="ekr.20040403120534.724"><vh>Fixed blunder in undo/redraw code</vh></v>
<v t="ekr.20040403120534.725"><vh>Fixed Dave Hein's @language issue</vh></v>
<v t="ekr.20040403120534.726"><vh>Completed incremental syntax coloring</vh></v>
</v>
<v t="ekr.20040403120534.727"><vh>11/8</vh>
<v t="ekr.20040403120534.728"><vh>Worked on incremental syntax coloring</vh></v>
<v t="ekr.20040403120534.729"><vh>Changed leoCustomize.py to customizeLeo.py to make distribution easier.</vh></v>
<v t="ekr.20040403120534.730"><vh>Warn if @node leoCustomize.py is not @ignored</vh></v>
<v t="ekr.20040403120534.731"><vh>Execute script no longer supports @pythonscript</vh></v>
<v t="ekr.20040403120534.732"><vh>Added example of how to customize individual .leo files safely in leoCustomize.py</vh></v>
<v t="ekr.20040403120534.733"><vh>Added frame.longFileName and shortFileName methods</vh></v>
</v>
<v t="ekr.20040403120534.734"><vh>11/7</vh>
<v t="ekr.20040403120534.735"><vh>Prompt when writing leoCustomize.py</vh></v>
<v t="ekr.20040403120534.736"><vh>Disabled the "virus-word" in leCustomize.py</vh></v>
</v>
<v t="ekr.20040403120534.737"><vh>11/6</vh>
<v t="ekr.20040403120534.738"><vh>Fixed a major bug in top()</vh>
<v t="ekr.20040403120534.739"><vh>top</vh></v>
</v>
<v t="ekr.20040403120534.740"><vh>Implemented per-window hook scheme</vh></v>
</v>
<v t="ekr.20040403120534.741"><vh>11/5</vh>
<v t="ekr.20040403120534.742"><vh>Fixed bug in cweb coloring, made latex work more like cweb</vh></v>
<v t="ekr.20040403120534.743"><vh>Added app().realMenuName logic</vh></v>
<v t="ekr.20040403120534.744"><vh>Added "open1", "open2", "menu1" and "menu2" hooks</vh></v>
<v t="ekr.20040403120534.745"><vh>Completed generalization of menu code</vh></v>
</v>
<v t="ekr.20040403120534.746"><vh>11/4</vh>
<v t="ekr.20040403120534.747"><vh>Replaced all frame menu ivars with frame.menus dict</vh></v>
<v t="ekr.20040403120534.748"><vh>Generalized how commands are called</vh></v>
<v t="ekr.20040403120534.749"><vh>Added general-purpose hook handling</vh></v>
<v t="ekr.20040403120534.750"><vh>Use original leading whitespace when reformatting paragraphs</vh></v>
<v t="ekr.20040403120534.751"><vh>Use scanDirectives in Convert All Blanks/Tabs commands</vh></v>
<v t="ekr.20040403120534.752"><vh>Incorporated Dave Hein's recent changes</vh></v>
</v>
<v t="ekr.20040403120534.753"><vh>11/3</vh>
<v t="ekr.20040403120534.754"><vh>Implemented @pythonscript and Execute Script</vh></v>
</v>
<v t="ekr.20040403120534.755"><vh>11/2</vh>
<v t="ekr.20040403120534.756"><vh>Fixed bugs when importing Java files.</vh></v>
<v t="ekr.20040403120534.757"><vh>Fixed important bug in find_line_start</vh></v>
</v>
<v t="ekr.20040403120534.758"><vh>1/11</vh>
<v t="ekr.20040403120534.759"><vh>Fixed cweb hack using Jonathon Gilligan's patches</vh></v>
</v>
<v t="ekr.20040403120534.760"><vh>(reducing name polution)</vh></v>
</v>
<v t="ekr.20040403120534.761"><vh>Oct 2002</vh>
<v t="ekr.20040403120534.762"><vh>10/30</vh>
<v t="ekr.20040403120534.763"><vh>Applied cweb hack to all sentinels</vh></v>
<v t="ekr.20040403120534.764"><vh>raw cweb mode in @root trees</vh></v>
<v t="ekr.20040403120534.765"><vh>simplified Reformat Paragraph command</vh></v>
</v>
<v t="ekr.20040403120534.766"><vh>10/29 Released 3.8</vh>
<v t="ekr.20040403120534.767"><vh>10/28</vh>
<v t="ekr.20040403120534.768"><vh>Don't recognize @*, @&lt; or @( in cweb mode</vh></v>
<v t="ekr.20040403120534.769"><vh>Completed documentation for 3.8</vh></v>
</v>
<v t="ekr.20040403120534.770"><vh>10/27</vh>
<v t="ekr.20040403120534.771"><vh>Fixed problems report by Pychecker</vh></v>
<v t="ekr.20040403120534.772"><vh>Fixed path bugs in tangle.scanAllDirectives</vh></v>
<v t="ekr.20040403120534.773"><vh>Changed path_directive_creates_directories to create_nonexistent_directories</vh></v>
</v>
<v t="ekr.20040403120534.774"><vh>10/26</vh>
<v t="ekr.20040403120534.775"><vh>Fixed foo.leo bug</vh></v>
<v t="ekr.20040403120534.776"><vh>Worked around Control-T bug</vh></v>
<v t="ekr.20040403120534.777"><vh>Reset hand cursor after failed drag</vh></v>
</v>
<v t="ekr.20040403120534.778"><vh>10/25</vh>
<v t="ekr.20040403120534.779"><vh>Used dicts to speed up checkMoveWithParentWithWarning</vh></v>
<v t="ekr.20040403120534.780"><vh>Created reloadAll in leoGlobals.py</vh></v>
<v t="ekr.20040403120534.781"><vh>Allow noweb section refs in @file cweb code</vh></v>
<v t="ekr.20040403120534.782"><vh>Added support for &lt;?xml-stylesheet...?&gt; line</vh></v>
<v t="ekr.20040403120534.783"><vh>Documented @rawfile and @silentfile</vh></v>
</v>
<v t="ekr.20040403120534.784"><vh>10/24</vh>
<v t="ekr.20040403120534.785"><vh>Fixed cweb sentinel bug</vh></v>
</v>
<v t="ekr.20040403120534.786"><vh>10/23</vh>
<v t="ekr.20040403120534.787"><vh>Completed first draft of new @rawfile and @silentfile</vh></v>
<v t="ekr.20040403120534.788"><vh>Discovered that gti's _are_ possible</vh></v>
<v t="ekr.20040403120534.789"><vh>Finished cweb hack</vh></v>
<v t="ekr.20040403120534.790"><vh>Fixed @delims "round trip" bug</vh></v>
<v t="ekr.20040403120534.791"><vh>Fixed bug involving menu pastes in headlines</vh></v>
</v>
<v t="ekr.20040403120534.792"><vh>10/19</vh>
<v t="ekr.20040403120534.793"><vh>Fixed import to @root problems</vh></v>
</v>
<v t="ekr.20040403120534.794"><vh>10/18</vh>
<v t="ekr.20040403120534.795"><vh>Completed handling of output_initial_comment option</vh></v>
<v t="ekr.20040403120534.796"><vh>Fixed block-comment bug in Java and HTML</vh></v>
<v t="ekr.20040403120534.797"><vh>Use // as single-line comment in Java</vh></v>
</v>
<v t="ekr.20040403120534.798"><vh>10/17</vh>
<v t="ekr.20040403120534.799"><vh>Allow @comment and @language to coexist</vh></v>
<v t="ekr.20040403120534.800"><vh>Match routines all return false if pattern is None or empty</vh></v>
<v t="ekr.20040403120534.801"><vh>Colorizer now recognizes comments after preprocessor directives</vh></v>
<v t="ekr.20040403120534.802"><vh>Corrected reversion in set_delims_from_string</vh></v>
</v>
<v t="ekr.20040403120534.803"><vh>10/16</vh>
<v t="ekr.20040403120534.804"><vh>Added support for forth language comments</vh></v>
<v t="ekr.20040403120534.805"><vh>Fixed another crasher in scanAllDirectives</vh></v>
<v t="ekr.20040403120534.806"><vh>Fixed assert failure in putBodyPart</vh></v>
<v t="ekr.20040403120534.807"><vh>Fixed crasher in scanAllDirectives</vh></v>
</v>
<v t="ekr.20040403120534.808"><vh>10/15</vh>
<v t="ekr.20040403120534.809"><vh>Added @raw support</vh></v>
<v t="ekr.20040403120534.810"><vh>Changed names of commands in help menu and corresponding entries in leoConfig.leo</vh></v>
<v t="ekr.20040403120534.811"><vh>Updated docs for recent features</vh></v>
</v>
<v t="ekr.20040403120534.812"><vh>10/14</vh>
<v t="ekr.20040403120534.813"><vh>All export commands now use output_newline option</vh></v>
<v t="ekr.20040403120534.814"><vh>Forced focus to body pane after ending headline edit</vh></v>
<v t="ekr.20040403120534.815"><vh>wrote "finished" after write @file nodes command</vh></v>
<v t="ekr.20040403120534.816"><vh>Use @@ sentinels only for real Leo directives</vh></v>
</v>
<v t="ekr.20040403120534.817"><vh>10/13 Rewrote colorizer using dispatch dict</vh></v>
<v t="ekr.20040403120534.818"><vh>10/12</vh>
<v t="ekr.20040403120534.819"><vh>Added Configuration Options item to help menu</vh></v>
</v>
<v t="ekr.20040403120534.820"><vh>10/11</vh>
<v t="ekr.20040403120534.821"><vh>added code to support output_newline option</vh></v>
<v t="ekr.20040403120534.822"><vh>Fixed reversion in file write code</vh></v>
<v t="ekr.20040403120534.823"><vh>Greatly simplified leoConfig.py</vh></v>
<v t="ekr.20040403120534.824"><vh>Completed support for @quiet</vh></v>
<v t="ekr.20040403120534.825"><vh>Syntax color perl's alarm function</vh></v>
</v>
<v t="ekr.20040403120534.826"><vh>10/10</vh>
<v t="ekr.20040403120534.827"><vh>Removed language bits</vh></v>
<v t="ekr.20040403120534.828"><vh>Removed directive bits</vh></v>
<v t="ekr.20040403120534.829"><vh>Used @q and @&gt; as sentinels in cweb mode</vh></v>
</v>
<v t="ekr.20040403120534.830"><vh>10/9 (after 3.7 released)</vh>
<v t="ekr.20040403120534.831"><vh>fixed Unicode bug in setBodyStringOrPane</vh></v>
<v t="ekr.20040403120534.832"><vh>Created es_exception</vh></v>
<v t="ekr.20040403120534.833"><vh>Added support for @rawfile (fixed bug in endEditLabel)</vh></v>
</v>
</v>
<v t="ekr.20040403120534.834"><vh>10/09 Released 3.7</vh>
<v t="ekr.20040403120534.835"><vh>10/8 Ran pychecker</vh></v>
<v t="ekr.20040403120534.836"><vh>10/7 Improved error messages for Unicode errors</vh></v>
<v t="ekr.20040403120534.837"><vh>10/6 leoOpen sets file name if it doesn't exist</vh></v>
<v t="ekr.20040403120534.838"><vh>10/5 Leo now closes an empty window when opening a recent file</vh></v>
<v t="ekr.20040403120534.839"><vh>10/4</vh>
<v t="ekr.20040403120534.840"><vh>Improved handling of Latin-1 encoding</vh></v>
<v t="ekr.20040403120534.841"><vh>Initialize all "config" section params to valid values</vh></v>
</v>
<v t="ekr.20040403120534.842"><vh>10/3</vh>
<v t="ekr.20040403120534.843"><vh>Removed all calls to decode</vh></v>
<v t="ekr.20040403120534.844"><vh>Got information about encode/decode</vh>
<v t="ekr.20040403120534.845"><vh>From  Martin v. Löwis (use unicode to interface with tk)</vh></v>
</v>
<v t="ekr.20040403120534.846"><vh>Fixed Find previous bug</vh></v>
<v t="ekr.20040403120534.847"><vh>Retained file modes when tangling and writing derived files</vh></v>
<v t="ekr.20040403120534.848"><vh>Added remove_sentinels_extension option</vh></v>
</v>
<v t="ekr.20040403120534.849"><vh>10/2 Changed find to findr when scanning @@ sentinels</vh></v>
</v>
</v>
<v t="ekr.20040403120534.850"><vh>Sept 2002</vh>
<v t="ekr.20040403120534.851"><vh>9/27</vh>
<v t="ekr.20040403120534.852"><vh>Removed extra newline following @+leo directive</vh></v>
</v>
<v t="ekr.20040403120534.853"><vh>9/26</vh>
<v t="ekr.20040403120534.854"><vh>"Relative" node indices aren't</vh></v>
<v t="ekr.20040403120534.855"><vh>Eliminated writing clone indices!</vh></v>
<v t="ekr.20040403120534.856"><vh>Allowed reads and writes of cloned @file nodes</vh></v>
</v>
<v t="ekr.20040403120534.857"><vh>9/25</vh>
<v t="ekr.20040403120534.858"><vh>Added perlpod hack</vh></v>
<v t="ekr.20040403120534.859"><vh>Added getBaseDirectory and used it to resolve relative paths</vh></v>
<v t="ekr.20040403120534.860"><vh>Removed bodyKeepsFocus logic in leoTree.py</vh></v>
<v t="ekr.20040403120534.861"><vh>Added code to various scanAllDirectives routines to create paths</vh></v>
<v t="ekr.20040403120534.862"><vh>Created "path_directive_creates_directories" option</vh></v>
</v>
<v t="ekr.20040403120534.863"><vh>9/24</vh>
<v t="ekr.20040403120534.864"><vh>"Mysterious" changes to files were due to setting Page Width = 80</vh></v>
<v t="ekr.20040403120534.865"><vh>Added code to configure headline colors</vh></v>
<v t="ekr.20040403120534.866"><vh>Made the About Leo dialog non-modal</vh></v>
<v t="ekr.20040403120534.867"><vh>Fixed bug that disabled all shortcuts</vh></v>
<v t="ekr.20040403120534.868"><vh>Added support for Esc in shortcuts</vh></v>
<v t="ekr.20040403120534.869"><vh>Added End Edit Headline and Abort Edit Headline commands</vh></v>
<v t="ekr.20040403120534.870"><vh>Fixed undo cloned headline bug</vh></v>
</v>
<v t="ekr.20040403120534.871"><vh>9/23 Finished user-configurable shortcuts</vh></v>
<v t="ekr.20040403120534.872"><vh>9/21</vh>
<v t="ekr.20040403120534.873"><vh>Fixed colorizing for "while" in C</vh></v>
<v t="ekr.20040403120534.874"><vh>Leo now remembers insert point always</vh></v>
</v>
<v t="ekr.20040403120534.875"><vh>9/20 Fixed tab problems</vh></v>
<v t="ekr.20040403120534.876"><vh>9/19 Removed setup.py from binary distribution</vh></v>
<v t="ekr.20040403120534.877"><vh>9/18 New file code: end of cursed newlines.</vh>
<v t="ekr.20040403120534.878"><vh>Write only \n (Linux newlines) in derived files and .leo files</vh></v>
<v t="ekr.20040403120534.879"><vh>Major change to atFile::read code</vh></v>
</v>
<v t="ekr.20040403120534.880"><vh>9/15</vh>
<v t="ekr.20040403120534.881"><vh>Added self=self to lambda definitions to keep Python 2.1 happy</vh></v>
<v t="ekr.20040403120534.882"><vh>Folded all CVS changes into this file</vh></v>
</v>
<v t="ekr.20040403120534.883"><vh>9/14 Added secondary pane ratios to leoConfig.txt</vh></v>
<v t="ekr.20040403120534.884"><vh>9/13</vh>
<v t="ekr.20040403120534.885"><vh>Folded Steven P. Schaefer's @first in @root code.</vh></v>
<v t="ekr.20040403120534.886"><vh>Fixed "Unselected Ctrl-[ four times" bug</vh></v>
<v t="ekr.20040403120534.887"><vh>Investigated reported font settings bug: works for me</vh></v>
<v t="ekr.20040403120534.888"><vh>Incorporated Dave Heins code into getBodyLines</vh></v>
</v>
<v t="ekr.20040403120534.889"><vh>9/12</vh>
<v t="ekr.20040403120534.890"><vh>Fixed bug in updateBodyPane affecting Edit Body commands</vh></v>
<v t="ekr.20040403120534.891"><vh>Suggested ISO-8859-15 instead of ISO-8859-1 in leoConfig.leo</vh></v>
<v t="ekr.20040403120534.892"><vh>Generated PKG-INFO in Version Stuff section</vh></v>
<v t="ekr.20040403120534.893"><vh>Fixed @language plain # bug.</vh></v>
<v t="ekr.20040403120534.894"><vh>Improved enabling of menu items in popup menus</vh></v>
<v t="ekr.20040403120534.895"><vh>Fixed @language plain single-quote bug</vh></v>
<v t="ekr.20040403120534.896"><vh>Incorporated Dave Hein's "wrapping in doc part" bug fix</vh></v>
<v t="ekr.20040403120534.897"><vh>Changed accelerator of Go To Next Changed to Alt-D</vh></v>
</v>
<v t="ekr.20040403120534.898"><vh>9/11 Released 3.6</vh>
<v t="ekr.20040403120534.899"><vh>9/11 Hacked colorizeAnyLanguage to support all PHP constructs</vh></v>
<v t="ekr.20040403120534.900"><vh>9/11 Implemented @last</vh></v>
</v>
<v t="ekr.20040403120534.901"><vh>9/9</vh>
<v t="ekr.20040403120534.902"><vh>Removed most error messages in atFile::read logic</vh></v>
<v t="ekr.20040403120534.903"><vh>Integrated changes in PHP changes into this file</vh></v>
</v>
<v t="ekr.20040403120534.904"><vh>9/7</vh>
<v t="ekr.20040403120534.905"><vh>9/7 and later: started to design the "Resolve CVS Conflicts command"</vh></v>
<v t="ekr.20040403120534.906"><vh>Dave Hein: added new code to make Python window work on Linux.</vh></v>
</v>
<v t="ekr.20040403120534.907"><vh>9/5 Fixed bugs in @path logic in tangle.scanAllDirectives</vh></v>
<v t="ekr.20040403120534.908"><vh>9/4</vh>
<v t="ekr.20040403120534.909"><vh>Tomaz Ficko: Added support for MouseWheel (Linux only)</vh></v>
<v t="ekr.20040403120534.910"><vh>Steven P. Schaefer: Fixed cursed newline bug for Linux</vh></v>
</v>
<v t="ekr.20040403120534.911"><vh>9/3</vh>
<v t="ekr.20040403120534.912"><vh>Experimented with CVS Revision keyword in About box.</vh></v>
<v t="ekr.20040403120534.913"><vh>Added Match Brackets command</vh></v>
<v t="ekr.20040403120534.914"><vh>Added shortcuts for Read/Write @file Nodes commands</vh></v>
</v>
<v t="ekr.20040403120534.915"><vh>9/2</vh>
<v t="ekr.20040403120534.916"><vh>Steven P. Schaefer: Improved handling of directives in @root trees</vh></v>
<v t="ekr.20040403120534.917"><vh>Dave Hein: added CheckVersion to leoUtils.py</vh></v>
<v t="ekr.20040403120534.918"><vh>Dave Hein: fixed Tk 8.4 problem in Prefs Panel</vh></v>
<v t="ekr.20040403120534.919"><vh>Body pane now gets focus after Go Back/Next</vh></v>
<v t="ekr.20040403120534.920"><vh>Changed leoTangle.scanAllDirectives</vh></v>
<v t="ekr.20040403120534.921"><vh>Leo now remembers scrollbar positions</vh></v>
<v t="ekr.20040403120534.922"><vh>Removed windows newlines in leoConfig.update</vh></v>
<v t="ekr.20040403120534.923"><vh>Improved call to os.path.join in leoApp.finishCreate</vh></v>
</v>
<v t="ekr.20040403120534.924"><vh>9/1</vh>
<v t="ekr.20040403120534.925"><vh>Saved edit position of tnodes</vh></v>
<v t="ekr.20040403120534.926"><vh>Investigated @language for @root trees</vh></v>
<v t="ekr.20040403120534.927"><vh>Fixed missing headline bug on startup</vh></v>
<v t="ekr.20040403120534.928"><vh>Changed all os.rename to utils_rename</vh></v>
<v t="ekr.20040403120534.929"><vh>Changed mode in leoConfig::update</vh></v>
</v>
</v>
<v t="ekr.20040403120534.930"><vh>Aug 2002</vh>
<v t="ekr.20040403120534.931"><vh>8/24</vh>
<v t="ekr.20040403120534.932"><vh>Added version to url for online tutorial</vh></v>
<v t="ekr.20040403120534.933"><vh>Improved About Leo dialog</vh></v>
<v t="ekr.20040403120534.934"><vh>Improved dowloading of sbooks.chm</vh></v>
</v>
<v t="ekr.20040403120534.935"><vh>8/15</vh>
<v t="ekr.20040403120534.936"><vh>prototyped window icons in Tk</vh></v>
<v t="ekr.20040403120534.937"><vh>Attempted to make mouse wheel functional in tree pane</vh></v>
<v t="ekr.20040403120534.938"><vh>Rewrote About Leo dialog with icon &amp; hyperlinks</vh></v>
<v t="ekr.20040403120534.939"><vh>Improved download dialog in Help-Tutorial command</vh></v>
</v>
<v t="ekr.20040403120534.940"><vh>8/14 Released 3.5</vh>
<v t="ekr.20040403120534.941"><vh>Corrected wrapping in log window when horizontal scrollbar is present</vh></v>
<v t="ekr.20040403120534.942"><vh>Released 3.5</vh></v>
<v t="ekr.20040403120534.943"><vh>Added log_pane_wraps and outline_pane_scrolls_horizontally params</vh></v>
<v t="ekr.20040403120534.944"><vh>Fixed Tangle logic</vh></v>
</v>
<v t="ekr.20040403120534.945"><vh>8/13 Bugs, bugs, bugs</vh>
<v t="ekr.20040403120534.946"><vh>called cf.flush in leoConfig.update</vh></v>
<v t="ekr.20040403120534.947"><vh>Open url's from help menu</vh></v>
<v t="ekr.20040403120534.948"><vh>Rewrote path logic</vh></v>
<v t="ekr.20040403120534.949"><vh>Warn on read-only files</vh></v>
<v t="ekr.20040403120534.950"><vh>Hacked on leoAtFile.scanAllDirectives to fix directory problem</vh></v>
<v t="ekr.20040403120534.951"><vh>Fixed (?) cursed newline bug in leoAtFile</vh></v>
</v>
<v t="ekr.20040403120534.952"><vh>8/11 Released 3.4</vh>
<v t="ekr.20040403120534.953"><vh>Fixed crasher when leoConfig.txt does not exist</vh></v>
<v t="ekr.20040403120534.954"><vh>Fixed bug in leoFileCommands.readOutlineOnly</vh></v>
<v t="ekr.20040403120534.955"><vh>Wrote importFiles script in leoImport.leo</vh></v>
<v t="ekr.20040403120534.956"><vh>Released 3.4</vh></v>
<v t="ekr.20040403120534.957"><vh>Syntax colorer now honors @comment</vh></v>
</v>
<v t="ekr.20040403120534.958"><vh>8/10</vh>
<v t="ekr.20040403120534.959"><vh>Added save_clears_undo_buffer configuration option</vh></v>
<v t="ekr.20040403120534.960"><vh>Improved Recent Files menu</vh></v>
</v>
<v t="ekr.20040403120534.961"><vh>8/9 Fixed Unicode Bugs</vh></v>
<v t="ekr.20040403120534.962"><vh>8/6</vh>
<v t="ekr.20040403120534.963"><vh>Corrected problems with find/prefs settings</vh></v>
<v t="ekr.20040403120534.964"><vh>created leoConfig.leo</vh></v>
<v t="ekr.20040403120534.965"><vh>Fixed a bug in config.setDict (!) (This fixes font problems)</vh></v>
<v t="ekr.20040403120534.966"><vh>Leo writes split direction to leoConfig.txt</vh></v>
<v t="ekr.20040403120534.967"><vh>Leo writes prefs if leoConfig.txt is read-only</vh></v>
</v>
<v t="ekr.20040403120534.968"><vh>8/5 Leo honors pane ratio stored in .leo files</vh></v>
<v t="ekr.20040403120534.969"><vh>8/4</vh>
<v t="ekr.20040403120534.970"><vh>Improved highlighting of whitespace</vh></v>
<v t="ekr.20040403120534.971"><vh>Fixed revert problems in font panel</vh></v>
<v t="ekr.20040403120534.972"><vh>Added @ignore to "raw" imported files</vh></v>
<v t="ekr.20040403120534.973"><vh>Remove Sentinels command now uses .txt extension instead of .tmp</vh></v>
<v t="ekr.20040403120534.974"><vh>Added log message for Remove Sentinels command</vh></v>
<v t="ekr.20040403120534.975"><vh>Corrected spelling of limit_directory_search_extenstion </vh></v>
<v t="ekr.20040403120534.976"><vh>Fixed wandering insertion point bug</vh></v>
</v>
<v t="ekr.20040403120534.977"><vh>8/3</vh>
<v t="ekr.20040403120534.978"><vh>looked for backticks</vh></v>
<v t="ekr.20040403120534.979"><vh>Cleaned up files using nested compares</vh></v>
<v t="ekr.20040403120534.980"><vh>Fixed another clone bug: created setAncestorsOfClonedNodesInTreeDirty</vh></v>
<v t="ekr.20040403120534.981"><vh>Released 3.3</vh></v>
</v>
<v t="ekr.20040403120534.982"><vh>8/2</vh>
<v t="ekr.20040403120534.983"><vh>Leo supports Unicode !!</vh></v>
<v t="ekr.20040403120534.984"><vh>changed skip_long to handle negative values</vh></v>
<v t="ekr.20040403120534.985"><vh>initialized atFile.default_directory to None</vh></v>
<v t="ekr.20040403120534.986"><vh>eliminated both presentLanguage and targetLanguage ivars from leoAtFile</vh></v>
<v t="ekr.20040403120534.987"><vh>Removed default param from set_language</vh></v>
</v>
<v t="ekr.20040403120534.988"><vh>8/1</vh>
<v t="ekr.20040403120534.989"><vh>Fixed crasher in leoTangle.putDoc</vh></v>
<v t="ekr.20040403120534.990"><vh>Fixed problems with negative tab widths</vh></v>
<v t="ekr.20040403120534.991"><vh>Fixed the "delims botch"</vh></v>
<v t="ekr.20040403120534.992"><vh>Made 'additional_body_text_border' setting functional</vh></v>
<v t="ekr.20040403120534.993"><vh>Made 'body_pane_wraps' setting functional</vh></v>
<v t="ekr.20040403120534.994"><vh>Fixed config tables</vh></v>
<v t="ekr.20040403120534.995"><vh>Initialized leoAtFile properly</vh></v>
</v>
</v>
<v t="ekr.20040403120534.996"><vh>July 2002</vh>
<v t="ekr.20040403120534.997"><vh>7/30 Fixed many bugs in Color panel</vh></v>
<v t="ekr.20040403120534.998"><vh>7/30 Proved that Leo handles nested @others directives properly</vh>
<v t="ekr.20040403120534.999"><vh>Proof that nested @others directives are valid</vh></v>
</v>
<v t="ekr.20040403120534.1000"><vh>7/29</vh>
<v t="ekr.20040403120534.1001"><vh>7/29 Fixed bug in skip_pp_if and added skip_pp_part</vh></v>
<v t="ekr.20040403120534.1002"><vh>7/29 Added @ignore to the root of all imported trees</vh></v>
<v t="ekr.20040403120534.1003"><vh>7/29 Fixed bug in scanPythonDef.&lt;&lt; skip the Python def &gt;&gt;</vh></v>
<v t="ekr.20040403120534.1004"><vh>7/29 Improved import of classes</vh></v>
<v t="ekr.20040403120534.1005"><vh>7/29 Relaxed the rules for @others: allowed @others within @others tree</vh></v>
<v t="ekr.20040403120534.1006"><vh>7/29 Added glossary entries</vh></v>
<v t="ekr.20040403120534.1007"><vh>7/29 Fixed crasher in Prefs onCancel</vh></v>
<v t="ekr.20040403120534.1008"><vh>7/29 Fixed problems with Outline/Move/Select Go commands</vh></v>
<v t="ekr.20040403120534.1009"><vh>7/29 Added email address &amp; URL to About Leo dialog</vh></v>
<v t="ekr.20040403120534.1010"><vh>7/29 Fixed import bug</vh></v>
</v>
<v t="ekr.20040403120534.1011"><vh>7/27 Continued comments for lines ending in \</vh></v>
<v t="ekr.20040403120534.1012"><vh>7/24 Added @file disStats.py</vh></v>
<v t="ekr.20040403120534.1013"><vh>7/24 Added leo.profile()</vh></v>
<v t="ekr.20040403120534.1014"><vh>7/20 Released 3.1</vh>
<v t="ekr.20040403120534.1015"><vh>7/20 Finished Compare panel code, including using leoConfig.txt params</vh></v>
</v>
<v t="ekr.20040403120534.1016"><vh>7/19</vh>
<v t="ekr.20040403120534.1017"><vh>7/19 Leo now adds path to Idle automatically</vh></v>
<v t="ekr.20040403120534.1018"><vh>7/19 Fixed bug that caused leo.py not to run</vh></v>
<v t="ekr.20040403120534.1019"><vh>7/19 Completed the visual design of the Compare panel</vh></v>
</v>
<v t="ekr.20040403120534.1020"><vh>7/18</vh>
<v t="ekr.20040403120534.1021"><vh>7/18 Revised leoCompare.py</vh></v>
<v t="ekr.20040403120534.1022"><vh>7/18 Changed precedence scheme for preferences</vh></v>
<v t="ekr.20040403120534.1023"><vh>7/18 Added support for @language tcl/tk</vh></v>
<v t="ekr.20040403120534.1024"><vh>7/18 Fixed major bugs in skip_long &amp; tangle.scanAllDirectives!</vh></v>
</v>
<v t="ekr.20040403120534.1025"><vh>7/17</vh>
<v t="ekr.20040403120534.1026"><vh>7/17 v.moreBody now only escapes first non-blank character on a line</vh></v>
<v t="ekr.20040403120534.1027"><vh>7/17 Told where to download Python 2.2 and Tk 8.3 In 2.2 required dialog</vh>
<v t="ekr.20040403120534.1028"><vh>7/17 Added optional text param to leoDialog.askOk</vh></v>
<v t="ekr.20040403120534.1029"><vh>7/17 Tried closing Leo window during a long write</vh></v>
<v t="ekr.20040403120534.1030"><vh>7/17 The compare window is important!</vh></v>
</v>
</v>
<v t="ekr.20040403120534.1031"><vh>7/16 Released 3.0</vh>
<v t="ekr.20040403120534.1032"><vh>7/16 Added leoConfig.txt to manifest</vh></v>
<v t="ekr.20040403120534.1033"><vh>7/16 Did spellcheck on LeoDocs.leo using MS Word</vh></v>
<v t="ekr.20040403120534.1034"><vh>7/16 Fixed autoscrolling so it can stop</vh></v>
<v t="ekr.20040403120534.1035"><vh>7/16 Ran pychecker</vh></v>
<v t="ekr.20040403120534.1036"><vh>7/16 Called traceback.print_exc for all serious exceptions</vh></v>
</v>
<v t="ekr.20040403120534.1037"><vh>7/15 Leo code complete</vh>
<v t="ekr.20040403120534.1038"><vh>7/15 Adjusted tree to handle larger font size</vh></v>
<v t="ekr.20040403120534.1039"><vh>7/15 Make Convert All Blanks and Convert All Tabs undoable</vh></v>
<v t="ekr.20040403120534.1040"><vh>7/15 ** Speeded up autoscrolling enough to be useful</vh></v>
<v t="ekr.20040403120534.1041"><vh>7/15 New windows now open using config params.</vh></v>
<v t="ekr.20040403120534.1042"><vh>7/15 Cleaned up how windows are opened</vh></v>
<v t="ekr.20040403120534.1043"><vh>7/15 Fixed bug that disabled window positioning!</vh></v>
<v t="ekr.20040403120534.1044"><vh>7/15 Changed config getters to get from defaults</vh></v>
<v t="ekr.20040403120534.1045"><vh>7/15 Added code to support font prefs.</vh></v>
<v t="ekr.20040403120534.1046"><vh>7/15 Added frame code to support non-modal panes</vh></v>
</v>
<v t="ekr.20040403120534.1047"><vh>Earlier</vh>
<v t="ekr.20040403120534.1048"><vh>7/14</vh>
<v t="ekr.20040403120534.1049"><vh>7/13 Added default tables to config module</vh></v>
<v t="ekr.20040403120534.1050"><vh>7/13 Added name picker to color panel</vh></v>
<v t="ekr.20040403120534.1051"><vh>7/13 Finished handlers for Font frame</vh></v>
</v>
<v t="ekr.20040403120534.1052"><vh>7/12</vh>
<v t="ekr.20040403120534.1053"><vh>7/12 Font &amp; color panels need not be modal !</vh></v>
<v t="ekr.20040403120534.1054"><vh>7/12 Finished Tk work on Font frame</vh></v>
</v>
<v t="ekr.20040403120534.1055"><vh>7/11</vh>
<v t="ekr.20040403120534.1056"><vh>7/11 Fixed syntax coloring bug</vh></v>
<v t="ekr.20040403120534.1057"><vh>7/11 Lots of work on preferences and color panel</vh></v>
</v>
<v t="ekr.20040403120534.1058"><vh>7/10 File (and clipboard) format changed!</vh>
<v t="ekr.20040403120534.1059"><vh>7/10 Allowed "ISO-8859-1" specification</vh></v>
<v t="ekr.20040403120534.1060"><vh>7/10 Warn and abort if not Python 2.2 or above</vh></v>
<v t="ekr.20040403120534.1061"><vh>7/10 app.finishCreate checks for Python 2.2 or higher</vh></v>
<v t="ekr.20040403120534.1062"><vh>7/10 Cleaned up Recent Files menu code</vh></v>
<v t="ekr.20040403120534.1063"><vh>7/10 All panels now have labeled frames and grooved borders</vh></v>
<v t="ekr.20040403120534.1064"><vh>7/10 Created leoFontPanel.py and added leoColorPanel class to leoColor.py</vh></v>
</v>
<v t="ekr.20040403120534.1065"><vh>7/9 Created create_labeled_frame and Font and Colors panels</vh></v>
<v t="ekr.20040403120534.1066"><vh>7/8</vh>
<v t="ekr.20040403120534.1067"><vh>7/8 Improved syntax coloring</vh></v>
<v t="ekr.20040403120534.1068"><vh>7/8 The REM hack &amp; fixed crasher</vh></v>
<v t="ekr.20040403120534.1069"><vh>7/8 Fixed crasher in atFile.scanAllDirectives</vh></v>
<v t="ekr.20040403120534.1070"><vh>7/8 Finished Toggle Split Direction</vh></v>
</v>
</v>
<v t="ekr.20040403120534.1071"><vh>leo.py 2.5 and earlier</vh>
<v t="ekr.20040403120534.1072"><vh>7/7</vh>
<v t="ekr.20040403120534.1073"><vh>7/7 Fixed crashers when undoing or redoing moves</vh></v>
<v t="ekr.20040403120534.1074"><vh>7/7 Updated LeoDocs.leo and Leo's web site</vh></v>
<v t="ekr.20040403120534.1075"><vh>7/7 Released 2.5 and updated CVS</vh></v>
</v>
<v t="ekr.20040403120534.1076"><vh>7/6 version 2.5 is now code complete</vh>
<v t="ekr.20040403120534.1077"><vh>7/6 Improved Import to @root</vh></v>
<v t="ekr.20040403120534.1078"><vh>7/6 Fixed Import bug: empty classes and nested classes</vh></v>
<v t="ekr.20040403120534.1079"><vh>7/6 Fixed Import bug that caused orphan nodes</vh></v>
<v t="ekr.20040403120534.1080"><vh>7/6 Fixed Import bug that caused duplicate class lines.</vh></v>
<v t="ekr.20040403120534.1081"><vh>7/6 Renamed Font to Set Font... and Syntax Coloring... to Set Colors...</vh></v>
<v t="ekr.20040403120534.1082"><vh>7/6 Created c.initJoinedCloneBits</vh></v>
<v t="ekr.20040403120534.1083"><vh>7/6 Verified that undo works</vh></v>
</v>
<v t="ekr.20040403120534.1084"><vh>7/5</vh>
<v t="ekr.20040403120534.1085"><vh>7/5 Made extract commands undoable &amp; simplified undo.</vh></v>
<v t="ekr.20040403120534.1086"><vh>7/5 Made import commands undoable.</vh></v>
<v t="ekr.20040403120534.1087"><vh>7/5 Discovered traceback module</vh></v>
<v t="ekr.20040403120534.1088"><vh>7/5 Made Cascade command functional</vh></v>
<v t="ekr.20040403120534.1089"><vh>7/5 Enabled Minimize All command</vh></v>
<v t="ekr.20040403120534.1090"><vh>7/5 Forced syntax coloring after extract commands</vh></v>
</v>
<v t="ekr.20040403120534.1091"><vh>7/4</vh>
<v t="ekr.20040403120534.1092"><vh>7/4 Find/Change settings can be overridden by leoConfig.txt</vh></v>
<v t="ekr.20040403120534.1093"><vh>7/4 Invalid directories are no longer errors in leoAtFiles.scanAllDirectives</vh></v>
<v t="ekr.20040403120534.1094"><vh>7/4 Prefs now can be overridden by leoConfig.txt</vh></v>
</v>
<v t="ekr.20040403120534.1095"><vh>7/3</vh>
<v t="ekr.20040403120534.1096"><vh>7/3 Added Convert All Blanks and Convert All Tabs commands</vh></v>
<v t="ekr.20040403120534.1097"><vh>7/3 Added Convert Tabs command</vh></v>
<v t="ekr.20040403120534.1098"><vh>7/3 Changed tabs to blanks when tab width is negative</vh></v>
<v t="ekr.20040403120534.1099"><vh>7/3 Changed c.tab/page_width to self.tab/page_width in leoAtFile.py</vh></v>
<v t="ekr.20040403120534.1100"><vh>7/3 Added OK, Cancel, Revert buttons to Prefs panel</vh></v>
<v t="ekr.20040403120534.1101"><vh>7/3 Added window name to Prefs title</vh></v>
<v t="ekr.20040403120534.1102"><vh>7/3 Added @language python to all @file nodes</vh></v>
</v>
<v t="ekr.20040403120534.1103"><vh>7/2</vh>
<v t="ekr.20040403120534.1104"><vh>7/2 Changed defaultextension from "x" to ".x"</vh></v>
<v t="ekr.20040403120534.1105"><vh>7/2 Made prefs a modal dialog</vh></v>
<v t="ekr.20040403120534.1106"><vh>7/2 About c.defaultDirectory</vh></v>
<v t="ekr.20040403120534.1107"><vh>7/2 Changed Save and Save As...</vh></v>
<v t="ekr.20040403120534.1108"><vh>7/2 Fixed crashers in Remove Sentinels command</vh></v>
<v t="ekr.20040403120534.1109"><vh>7/2 Fixed crasher in import.scanAllDirectives)</vh></v>
<v t="ekr.20040403120534.1110"><vh>7/2 Hacked code so tab width works</vh></v>
<v t="ekr.20040403120534.1111"><vh>7/2 Fixed doc problems</vh>
<v t="ekr.20040403120534.1112"><vh>Demote docs</vh></v>
<v t="ekr.20040403120534.1113"><vh>Open/Close log window docs</vh></v>
<v t="ekr.20040403120534.1114"><vh>Insert Headline docs</vh></v>
<v t="ekr.20040403120534.1115"><vh>Extract Section docs</vh></v>
<v t="ekr.20040403120534.1116"><vh>Syntax Coloring... &amp; Font...</vh></v>
</v>
</v>
<v t="ekr.20040403120534.1117"><vh>7/1 Cut/Paste now works properly</vh></v>
</v>
</v>
<v t="ekr.20040403120534.1118"><vh>June 2002	</vh>
<v t="ekr.20040403120534.1119"><vh>06/22 Implemented Recent Files menu &amp; leoConfig.py</vh></v>
<v t="ekr.20040403120534.1120"><vh>06/19 Removed assert from st_enter_root_name</vh></v>
<v t="ekr.20040403120534.1121"><vh>06/18 Improved error recovery when writing .leo files</vh></v>
<v t="ekr.20040403120534.1122"><vh>06/16 Changed leo.py so Leo can open files when files are double-clicked</vh></v>
<v t="ekr.20040403120534.1123"><vh>06/16 Finished updating LeoDocs.leo to match Leo's web site</vh></v>
<v t="ekr.20040403120534.1124"><vh>06/15 Fixed the control-I and control-H bugs</vh></v>
<v t="ekr.20040403120534.1125"><vh>06/15 Double clicking in a headline now selects a word</vh></v>
<v t="ekr.20040403120534.1126"><vh>06/15 Implemented Drag and Drop</vh></v>
<v t="ekr.20040403120534.1127"><vh>06/04 Changed atFile.scanAllDirectives to use c.openDirectory as default</vh></v>
<v t="ekr.20040403120534.1128"><vh>06/03 Changed cursor to double arrow when cursor is over splitter bars</vh></v>
<v t="ekr.20040403120534.1129"><vh>06/02 Bug fix in es in leoGlobals</vh></v>
<v t="ekr.20040403120534.1130"><vh>06/02 Tried and failed to call wm_iconbitmap</vh></v>
</v>
<v t="ekr.20040403120534.1131"><vh>May 2002</vh>
<v t="ekr.20040403120534.1132"><vh>5/30/02 Move theory of operation sections back into this outline</vh></v>
<v t="ekr.20040403120534.1133"><vh>5/27/02 Undo move down doesn't always work</vh></v>
<v t="ekr.20040403120534.1134"><vh>5/27/02 Fixed bugs involving changing roots</vh></v>
<v t="ekr.20040403120534.1135"><vh>5/27/02 Handled unicode error in leoFileCommands::put</vh></v>
<v t="ekr.20040403120534.1136"><vh>5/13/02 LeoPy.leo corrupted</vh></v>
</v>
<v t="ekr.20040403120534.1137"><vh>April 2002</vh>
<v t="ekr.20040403120534.1138"><vh>4/27/02 Started Remove Sentinels command</vh></v>
<v t="ekr.20040403120534.1139"><vh>4/27/02 Changes to Export Noweb command</vh></v>
<v t="ekr.20040403120534.1140"><vh>4/25/02 Added code to os()</vh></v>
<v t="ekr.20040403120534.1141"><vh>4/7/02 Added frame.outlineToNowebDefaultFileName ivar</vh></v>
<v t="ekr.20040403120534.1142"><vh>4/7/02 Replaced &lt;&lt;*&gt;&gt;= with &lt;&lt;fileName&gt;&gt;= whenever possible</vh></v>
<v t="ekr.20040403120534.1143"><vh>4/7/02 Added code to make @ defs not start a doc part</vh></v>
<v t="ekr.20040403120534.1144"><vh>4/7/02 Added warnings for all non-undoable import commands</vh></v>
</v>
<v t="ekr.20040403120534.1145"><vh>March 2002</vh>
<v t="ekr.20040403120534.1146"><vh>3/16 Fixed moves up to root postion</vh></v>
<v t="ekr.20040403120534.1147"><vh>3/16 Simplified syntax colorer for docState</vh></v>
<v t="ekr.20040403120534.1148"><vh>3/10 Rewrote skipLeadingComments</vh></v>
<v t="ekr.20040403120534.1149"><vh>3/08 Modified colorer for CWEB</vh></v>
<v t="ekr.20040403120534.1150"><vh>3/07 Color strings green</vh></v>
<v t="ekr.20040403120534.1151"><vh>3/07 Rewrote importWebCommand and its allies</vh></v>
<v t="ekr.20040403120534.1152"><vh>3/06 Import/Export commands</vh>
<v t="ekr.20040403120534.1153"><vh>3/06 Outline To Noweb works (as well as it is going to)</vh></v>
<v t="ekr.20040403120534.1154"><vh>3/06 Flatten Outline and Import Flattened Outline work</vh></v>
<v t="ekr.20040403120534.1155"><vh>3/06 Python, C, Java and Pascal Imports now work</vh></v>
</v>
<v t="ekr.20040403120534.1156"><vh>3/05 Import commands, colorizer, clear IDLE breakpoints</vh>
<v t="ekr.20040403120534.1157"><vh>3/05 Import commands, colorizer</vh></v>
<v t="ekr.20040403120534.1158"><vh>3/05 Added ability to clear breakpoints in IDLE</vh></v>
</v>
<v t="ekr.20040403120534.1159"><vh>3/04 Released leo.py 2.0 and Borland v2.6</vh>
<v t="ekr.20040403120534.1160"><vh>3/04 Improved read error messages.</vh></v>
<v t="ekr.20040403120534.1161"><vh>3/04 Untangle calls v.trimTrailingLines only for changed nodes</vh></v>
<v t="ekr.20040403120534.1162"><vh>3/04 changed v.setBodyStringOrPane</vh></v>
<v t="ekr.20040403120534.1163"><vh>3/04 Added finished messages for Tangle/Untangle</vh></v>
</v>
<v t="ekr.20040403120534.1164"><vh>3/03 Fixed Untangle, </vh>
<v t="ekr.20040403120534.1165"><vh>3/03 Created readme files</vh></v>
<v t="ekr.20040403120534.1166"><vh>3/03 Fixed Untangle bug</vh></v>
</v>
<v t="ekr.20040403120534.1167"><vh>3/02 Finished Undo, Preparing for release</vh>
<v t="ekr.20040403120534.1168"><vh>3/02 Created distutils files to distribute Borland Leo</vh></v>
<v t="ekr.20040403120534.1169"><vh>3/02 Created release notes for Borland v2.6</vh></v>
<v t="ekr.20040403120534.1170"><vh>3/02 Documented new commands and features</vh></v>
<v t="ekr.20040403120534.1171"><vh>3/02 Fixed all pychecker complaints against leoImport.py</vh></v>
<v t="ekr.20040403120534.1172"><vh>3/02 Added @space to Utils &amp; Tangle/Untangle code in LeoCB</vh></v>
<v t="ekr.20040403120534.1173"><vh>3/02 Completed Undo Change All</vh></v>
</v>
<v t="ekr.20040403120534.1174"><vh>3/01 Finished Tangle, Finished v2.6, etc.</vh>
<v t="ekr.20040403120534.1175"><vh>3/01 Completely supress all auto-indent in @nocolor mode</vh></v>
<v t="ekr.20040403120534.1176"><vh>3/01 Tangle now works exactly like LeoCB Tangle</vh></v>
<v t="ekr.20040403120534.1177"><vh>3/01 Finished Borland version 2.6</vh></v>
</v>
</v>
<v t="ekr.20040403120534.1178"><vh>Feb 2002</vh>
<v t="ekr.20040403120534.1179"><vh>2/28 Small fixes</vh>
<v t="ekr.20040403120534.1180"><vh>Tangle now treats @c like @code</vh></v>
<v t="ekr.20040403120534.1181"><vh>Changed is_special_bits</vh></v>
<v t="ekr.20040403120534.1182"><vh>Installed Johansson patches</vh></v>
</v>
<v t="ekr.20040403120534.1183"><vh>2/27 pychecker(!), colorizer bug</vh>
<v t="ekr.20040403120534.1184"><vh>2/27 Fixed bug in colorizer</vh></v>
<v t="ekr.20040403120534.1185"><vh>2/27 Discovered pychecker (several bug fixes)</vh>
<v t="ekr.20040403120534.1186"><vh>Fixed bug in Mark Changed Roots</vh></v>
<v t="ekr.20040403120534.1187"><vh>Fixed bug in scanText related to @delims sentinel</vh></v>
<v t="ekr.20040403120534.1188"><vh>Fixed bug in write</vh></v>
<v t="ekr.20040403120534.1189"><vh>Fixed bugs in leoFileCommands</vh></v>
<v t="ekr.20040403120534.1190"><vh>Fixed bugs in leoNodes</vh></v>
<v t="ekr.20040403120534.1191"><vh>Fixed bugs in leoTangle</vh></v>
</v>
</v>
<v t="ekr.20040403120534.1192"><vh>2/26 LeoCB can read compressed derived files</vh></v>
<v t="ekr.20040403120534.1193"><vh>2/25 Fixed IDLE, added verbatimAfterRef sentinel</vh>
<v t="ekr.20040403120534.1194"><vh>2/25 Fixed breakpoints in IDLE</vh></v>
<v t="ekr.20040403120534.1195"><vh>2/25 Added verbatimAfterRef sentinel</vh></v>
</v>
<v t="ekr.20040403120534.1196"><vh>2/24 suppressing newlines</vh></v>
<v t="ekr.20040403120534.1197"><vh>2/23 Untangle, colorizer bug</vh>
<v t="ekr.20040403120534.1198"><vh>2/23 Debugging untangle: fixed leading single-comments bug</vh></v>
<v t="ekr.20040403120534.1199"><vh>2/23 Fixed small colorizing bug</vh></v>
</v>
<v t="ekr.20040403120534.1200"><vh>2/22 askOKCancel dialog, suppressing auto-indent.</vh>
<v t="ekr.20040403120534.1201"><vh>2/22 Created askOkCancel dialog for Read @file Nodes</vh></v>
<v t="ekr.20040403120534.1202"><vh>2/22 Supressed auto-indent in @nocolor mode.</vh></v>
</v>
<v t="ekr.20040403120534.1203"><vh>2/20 and 2/21 Debugged Untangle</vh></v>
<v t="ekr.20040403120534.1204"><vh>2/19 Improved Unlimited Undo</vh></v>
<v t="ekr.20040403120534.1205"><vh>2/18 Unlimited Undo works</vh></v>
<v t="ekr.20040403120534.1206"><vh>2/16 Syntax coloring</vh>
<v t="ekr.20040403120534.1207"><vh>2/16 Fixed bugs in colorAnyLanguage</vh></v>
<v t="ekr.20040403120534.1208"><vh>2/16 Finished adding keywords for colorAnyLanguage</vh></v>
</v>
<v t="ekr.20040403120534.1209"><vh>2/15 Syntax coloring, undo, @space bug</vh>
<v t="ekr.20040403120534.1210"><vh>02/15 Created colorAnyLanguage</vh></v>
<v t="ekr.20040403120534.1211"><vh>02/15 Fixed @space bug</vh></v>
<v t="ekr.20040403120534.1212"><vh>02/15 Bug fix: section definition lines now end coloring for doc parts</vh></v>
<v t="ekr.20040403120534.1213"><vh>02/15 Finished Limited undo.</vh></v>
<v t="ekr.20040403120534.1214"><vh>02/15 Added files to manifest</vh></v>
</v>
<v t="ekr.20040403120534.1215"><vh>02/14 CVS</vh>
<v t="ekr.20040403120534.1216"><vh>02/14 Fixed Undo problems</vh></v>
<v t="ekr.20040403120534.1217"><vh>02/14 Checked out Leo from CVS</vh></v>
<v t="ekr.20040403120534.1218"><vh>02/14 Cant mend clones, How to use CVS</vh>
<v t="ekr.20040403120534.1219"><vh>CVS: Making a virtue out of necessity</vh></v>
<v t="ekr.20040403120534.1220"><vh>Ooops: Leo can't mend clone links!</vh></v>
<v t="ekr.20040403120534.1221"><vh>Completed Mending dialog</vh></v>
</v>
</v>
<v t="ekr.20040403120534.1222"><vh>02/13 Mending clone links, undo</vh>
<v t="ekr.20040403120534.1223"><vh>Made the undo class partly functional</vh></v>
<v t="ekr.20040403120534.1224"><vh>Created menu utilities</vh></v>
<v t="ekr.20040403120534.1225"><vh>Fixed bug in Extract and Extract Section commands</vh></v>
</v>
<v t="ekr.20040403120534.1226"><vh>02/12 Minor fixes</vh>
<v t="ekr.20040403120534.1227"><vh>Studied the DnD code</vh></v>
<v t="ekr.20040403120534.1228"><vh>Cleared tab and space tags in colorizePython</vh></v>
<v t="ekr.20040403120534.1229"><vh>Made headlines longer</vh></v>
<v t="ekr.20040403120534.1230"><vh>Cleaned code</vh></v>
</v>
<v t="ekr.20040403120534.1231"><vh>02/11 experiments</vh>
<v t="ekr.20040403120534.1232"><vh>created sortSequence utility</vh></v>
<v t="ekr.20040403120534.1233"><vh>experimented with inspect</vh></v>
</v>
<v t="ekr.20040403120534.1234"><vh>02/10 1.0 released</vh>
<v t="ekr.20040403120534.1235"><vh>Removed "from x import *" from reload_all() and OnOpenPythonWindow'</vh></v>
<v t="ekr.20040403120534.1236"><vh>Released 1.0</vh></v>
<v t="ekr.20040403120534.1237"><vh>Added Contract Parent (Alt-0)</vh></v>
<v t="ekr.20040403120534.1238"><vh>Fixed bugs in Prefs panel</vh></v>
</v>
<v t="ekr.20040403120534.1239"><vh>02/09 Preparing for release</vh>
<v t="ekr.20040403120534.1240"><vh>02/09 Got clean import of leoImport.py</vh></v>
<v t="ekr.20040403120534.1241"><vh>02/09 Created do-nothing leoUndo.py</vh></v>
<v t="ekr.20040403120534.1242"><vh>02/09 Updated current language properly in Prefs panel</vh></v>
<v t="ekr.20040403120534.1243"><vh>02/09 Re-marked @file nodes dirty on write errors</vh></v>
<v t="ekr.20040403120534.1244"><vh>02/09 Prefs Panel stick to current window</vh></v>
<v t="ekr.20040403120534.1245"><vh>02/09 Tangle passes full regression test</vh></v>
<v t="ekr.20040403120534.1246"><vh>02/09 Added Sort Siblings</vh></v>
</v>
<v t="ekr.20040403120534.1247"><vh>02/08 Regression testing</vh>
<v t="ekr.20040403120534.1248"><vh>02/08 Found Tangle problem</vh></v>
<v t="ekr.20040403120534.1249"><vh>02/08 Cleaned up leoCompare.py</vh></v>
<v t="ekr.20040403120534.1250"><vh>02/08 @c in Tangled files</vh></v>
<v t="ekr.20040403120534.1251"><vh>02/08 Testing wiped out files!</vh></v>
</v>
<v t="ekr.20040403120534.1252"><vh>02/07 New commands and bug fixes</vh>
<v t="ekr.20040403120534.1253"><vh>02/07 Possible reversion</vh></v>
<v t="ekr.20040403120534.1254"><vh>02/07 Converted Import Files code</vh></v>
<v t="ekr.20040403120534.1255"><vh>02/07 Search suboutline only now applies to Search/ChangeAll</vh></v>
<v t="ekr.20040403120534.1256"><vh>02/07 Fixed bug in search()</vh></v>
<v t="ekr.20040403120534.1257"><vh>02/07 Fixed bug: @others wasn't colored unless at left margin.</vh></v>
<v t="ekr.20040403120534.1258"><vh>02/07 * Added indent and undent commands</vh></v>
<v t="ekr.20040403120534.1259"><vh>02/07 * Improved idle_body_key</vh></v>
</v>
<v t="ekr.20040403120534.1260"><vh>02/06 Finished commands</vh>
<v t="ekr.20040403120534.1261"><vh>02/06 Rewrote and tested all Edit Body commands</vh></v>
<v t="ekr.20040403120534.1262"><vh>02/06 Rewrote and tested Convert Blanks command</vh></v>
<v t="ekr.20040403120534.1263"><vh>02/06 Removed Print and Page Setup commands</vh></v>
<v t="ekr.20040403120534.1264"><vh>02/06 * Implemented View All Characters</vh></v>
<v t="ekr.20040403120534.1265"><vh>02/06 Got the arrow binding right</vh></v>
<v t="ekr.20040403120534.1266"><vh>02/06 finished Delete command</vh></v>
<v t="ekr.20040403120534.1267"><vh>02/06 created tree.onBodyChanged</vh></v>
<v t="ekr.20040403120534.1268"><vh>02/06 rewrote and tested Revert</vh></v>
<v t="ekr.20040403120534.1269"><vh>02/06 created leoDialog.yesNo</vh></v>
</v>
<v t="ekr.20040403120534.1270"><vh>2/05 More bug fixes</vh>
<v t="ekr.20040403120534.1271"><vh>02/05 * Extended Sherlock</vh></v>
<v t="ekr.20040403120534.1272"><vh>02/05 * Properly enabled and disabled all menu items</vh></v>
<v t="ekr.20040403120534.1273"><vh>02/05 Got special accelerator keys working</vh></v>
<v t="ekr.20040403120534.1274"><vh>02/05 GoTo commands now working</vh></v>
<v t="ekr.20040403120534.1275"><vh>02/05 Got Alt-keys working</vh></v>
<v t="ekr.20040403120534.1276"><vh>02/05 Made es and trace safer during quit</vh></v>
<v t="ekr.20040403120534.1277"><vh>02/05 Fixed bugs in Search Headline and Find, Then Change</vh></v>
<v t="ekr.20040403120534.1278"><vh>02/05 Do not eliminate begin/endUpdate!</vh></v>
</v>
<v t="ekr.20040403120534.1279"><vh>02/04 Many bug fixes &amp; some big improvements</vh>
<v t="ekr.20040403120534.1280"><vh>02/04 Fixed Change command in headline</vh></v>
<v t="ekr.20040403120534.1281"><vh>02/04 A kludgy way to cut &amp; paste between Leo &amp; Leo.py</vh></v>
<v t="ekr.20040403120534.1282"><vh>02/04 Ended all event handlers with return "break"</vh></v>
<v t="ekr.20040403120534.1283"><vh>02/04 Changed Insert Node accelerator from Control-K to Control-I</vh></v>
<v t="ekr.20040403120534.1284"><vh>02/04 Implemented Toggle Active Pane</vh></v>
<v t="ekr.20040403120534.1285"><vh>02/04 ** Overrode default text keys</vh></v>
<v t="ekr.20040403120534.1286"><vh>02/04 Documented control characters used in the body pane.</vh></v>
<v t="ekr.20040403120534.1287"><vh>02/04 ** Breakthrough regarding events and accelerators</vh></v>
<v t="ekr.20040403120534.1288"><vh>02/04 Implemented Select All command</vh></v>
<v t="ekr.20040403120534.1289"><vh>02/04 created OnBodyDoubleClick and allies</vh></v>
<v t="ekr.20040403120534.1290"><vh>02/04 create setTextSelelection utility</vh></v>
<v t="ekr.20040403120534.1291"><vh>02/04 Created Sort command</vh></v>
<v t="ekr.20040403120534.1292"><vh>02/04 Fixed Tangle Marked and Tangle All commands</vh></v>
</v>
<v t="ekr.20040403120534.1293"><vh>02/03 Created shortcuts for opening LeoPy.leo</vh></v>
<v t="ekr.20040403120534.1294"><vh>02/03 Released 0.08</vh></v>
<v t="ekr.20040403120534.1295"><vh>02/02 Fixing Bugs</vh>
<v t="ekr.20040403120534.1296"><vh>02/02 Fixed bugs in outline-only and whole-word searches &amp; is_c_id</vh></v>
<v t="ekr.20040403120534.1297"><vh>02/02 ** Drawing breakthroughs</vh></v>
<v t="ekr.20040403120534.1298"><vh>02/02 Fixed control-d bug</vh></v>
<v t="ekr.20040403120534.1299"><vh>02/02 ** About redrawing</vh></v>
</v>
<v t="ekr.20040403120534.1300"><vh>02/01 Fixing bugs</vh>
<v t="ekr.20040403120534.1301"><vh>02/01 Test tangle path errors</vh></v>
<v t="ekr.20040403120534.1302"><vh>02/01 ** started tree.makeVisible &amp; tree.scrollTo</vh></v>
<v t="ekr.20040403120534.1303"><vh>02/01 ** used distutils</vh></v>
</v>
</v>
<v t="ekr.20040403120534.1304"><vh>Jan 2002</vh>
<v t="ekr.20040403120534.1305"><vh>01/31 Preparing for release...</vh>
<v t="ekr.20040403120534.1306"><vh>** 01/31 leo.py now tangles better than LeoCB</vh></v>
<v t="ekr.20040403120534.1307"><vh>01/31 Created open script in leo.py</vh></v>
<v t="ekr.20040403120534.1308"><vh>01/31 Fixed suboutline only logic</vh></v>
<v t="ekr.20040403120534.1309"><vh>01/31 Tested directory logic</vh></v>
<v t="ekr.20040403120534.1310"><vh>01/31 replaced frame.defaultDirectory by c.tangle_directory</vh></v>
</v>
<v t="ekr.20040403120534.1311"><vh>01/30 Major improvements...</vh>
<v t="ekr.20040403120534.1312"><vh>01/30 ** May have solved the load path problem</vh></v>
<v t="ekr.20040403120534.1313"><vh>01/30 ** Rewrote path logic: removed all calls to os.chdir</vh></v>
<v t="ekr.20040403120534.1314"><vh>01/30 ** Fixed major bug causing @file read errors</vh></v>
<v t="ekr.20040403120534.1315"><vh>01/30 ** Changed how directories are handled</vh></v>
</v>
<v t="ekr.20040403120534.1316"><vh>01/29 Improved Paste Node command</vh></v>
<v t="ekr.20040403120534.1317"><vh>01/28 Generalized trace to allow function args</vh></v>
<v t="ekr.20040403120534.1318"><vh>01/28 Found source of Find performance bug</vh></v>
<v t="ekr.20040403120534.1319"><vh>01/25 Found one source of misreads</vh></v>
<v t="ekr.20040403120534.1320"><vh>01/24 Implemented Sherlock: init_trace and trace</vh></v>
<v t="ekr.20040403120534.1321"><vh>01/22 More work on leoTangle.py</vh></v>
<v t="ekr.20040403120534.1322"><vh>01/21 Started workon leoTangle.py</vh></v>
<v t="ekr.20040403120534.1323"><vh>01/20</vh>
<v t="ekr.20040403120534.1324"><vh>01/20 Lost clones into leoColor.py</vh></v>
<v t="ekr.20040403120534.1325"><vh>01/20 Implemented hyperlinks</vh></v>
</v>
<v t="ekr.20040403120534.1326"><vh>01/18 Completed Change all command</vh></v>
<v t="ekr.20040403120534.1327"><vh>01/17</vh>
<v t="ekr.20040403120534.1328"><vh>01/17 Breakthrough: tree.redraw_now</vh></v>
<v t="ekr.20040403120534.1329"><vh>01/17 much work on Find class</vh></v>
<v t="ekr.20040403120534.1330"><vh>01/17 v.edit_text defined only if v is visible</vh></v>
</v>
<v t="ekr.20040403120534.1331"><vh>01/16</vh>
<v t="ekr.20040403120534.1332"><vh>01/16 Fixed idle_headline logic</vh></v>
<v t="ekr.20040403120534.1333"><vh>01/16 Lost data in outline (not derived files)</vh></v>
<v t="ekr.20040403120534.1334"><vh>01/16 Fixed minor find/change bugs and removed batch checkbox</vh></v>
<v t="ekr.20040403120534.1335"><vh>01/16 Breakthrough re event handlers!</vh></v>
</v>
<v t="ekr.20040403120534.1336"><vh>01/15 Find/Change</vh>
<v t="ekr.20040403120534.1337"><vh>01/15 ** Completed find/change commands</vh></v>
<v t="ekr.20040403120534.1338"><vh>01/15 Converted headline from Tk.Entry to Tk.Text</vh></v>
</v>
<v t="ekr.20040403120534.1339"><vh>01/14</vh>
<v t="ekr.20040403120534.1340"><vh>01/14 Fixed bug: cancelling dialog wrote .leo</vh></v>
<v t="ekr.20040403120534.1341"><vh>01/14 Got basic Find commands to work</vh></v>
<v t="ekr.20040403120534.1342"><vh>01/14 Fixed Save To bug</vh></v>
<v t="ekr.20040403120534.1343"><vh>01/14 Added log messages for saves</vh></v>
<v t="ekr.20040403120534.1344"><vh>01/14 Always recompute file indices on saves</vh></v>
<v t="ekr.20040403120534.1345"><vh>01/14 Reduced width of log window</vh></v>
</v>
<v t="ekr.20040403120534.1346"><vh>01/13</vh>
<v t="ekr.20040403120534.1347"><vh>01/13 exec statement simplifies code</vh></v>
<v t="ekr.20040403120534.1348"><vh>01/13 Prefs/Find settings now functional</vh></v>
</v>
<v t="ekr.20040403120534.1349"><vh>01/11</vh>
<v t="ekr.20040403120534.1350"><vh>01/11 Replaced globals with app() ivars</vh></v>
<v t="ekr.20040403120534.1351"><vh>01/11 New memory management: created c/v/tree/frame destroy routines</vh></v>
<v t="ekr.20040403120534.1352"><vh>01/11 About destroy routines: eliminating circular references</vh></v>
<v t="ekr.20040403120534.1353"><vh>01/11 disabled c.setChanged while loading</vh></v>
<v t="ekr.20040403120534.1354"><vh>01/11 Eliminated ?? error message on exit</vh></v>
<v t="ekr.20040403120534.1355"><vh>01/11 created leoFrame.__del__</vh></v>
</v>
<v t="ekr.20040403120534.1356"><vh>01/10</vh>
<v t="ekr.20040403120534.1357"><vh>01/10 Worked on Quit error messages</vh></v>
<v t="ekr.20040403120534.1358"><vh>01/10 Released v 0.07</vh></v>
<v t="ekr.20040403120534.1359"><vh>01/10 Tested c2py on Borland</vh></v>
</v>
<v t="ekr.20040403120534.1360"><vh>01/09</vh>
<v t="ekr.20040403120534.1361"><vh>01/09 Wrote and debugged leo1to2 scripts !</vh></v>
<v t="ekr.20040403120534.1362"><vh>01/09 Made Python window functional !</vh></v>
<v t="ekr.20040403120534.1363"><vh>01/09 Added auto indent</vh></v>
</v>
<v t="ekr.20040403120534.1364"><vh>01/08</vh>
<v t="ekr.20040403120534.1365"><vh>01/08 bodyKeepsFocus logic</vh></v>
<v t="ekr.20040403120534.1366"><vh>01/08 Fixed bug: no doesn't abort a Quit command</vh></v>
<v t="ekr.20040403120534.1367"><vh>01/08 Fixed bug: changing clones didn't mark joined dirty.</vh></v>
<v t="ekr.20040403120534.1368"><vh>01/08 Got cut/copy/paste working</vh></v>
<v t="ekr.20040403120534.1369"><vh>01/08 Fixed reooloring problem</vh></v>
<v t="ekr.20040403120534.1370"><vh>01/08 Added Help-Leo Documentation command</vh></v>
<v t="ekr.20040403120534.1371"><vh>01/08 Save commands now ensure .leo extension</vh></v>
<v t="ekr.20040403120534.1372"><vh>01/08 Still no joy with canvas border</vh></v>
<v t="ekr.20040403120534.1373"><vh>01/08 Expermented with window icons</vh></v>
<v t="ekr.20040403120534.1374"><vh>01/08 Increased size of open windows</vh></v>
<v t="ekr.20040403120534.1375"><vh>01/08 Improved look of prefs panel</vh></v>
<v t="ekr.20040403120534.1376"><vh>01/08 Made progress towards "Show invisibles"</vh></v>
<v t="ekr.20040403120534.1377"><vh>01/08 @ignore now colored properly</vh></v>
<v t="ekr.20040403120534.1378"><vh>01/08 @color and @nocolor are now inherited</vh></v>
</v>
<v t="ekr.20040403120534.1379"><vh>01/07</vh>
<v t="ekr.20040403120534.1380"><vh>01/07 Fixed some bugs in Move Up and Move Down commands</vh></v>
<v t="ekr.20040403120534.1381"><vh>01/07 Fixed loss-of-data on insert command</vh></v>
<v t="ekr.20040403120534.1382"><vh>01/07 tab width</vh></v>
</v>
<v t="ekr.20040403120534.1383"><vh>01/06</vh>
<v t="ekr.20040403120534.1384"><vh>01/06 borders again</vh></v>
<v t="ekr.20040403120534.1385"><vh>01/06 editing and selecting</vh></v>
</v>
</v>
</v>
<v t="ekr.20040403120534.1386"><vh>2001</vh>
<v t="ekr.20040403120534.1387"><vh>Dec 2001</vh>
<v t="ekr.20040403120534.1388"><vh>12/20/01 Fixed Linux problems</vh></v>
<v t="ekr.20040403120534.1389"><vh>12/19/01 Improved LeoDocs.leo</vh></v>
<v t="ekr.20040403120534.1390"><vh>12/18/01 Improved Leo2 documentation</vh></v>
<v t="ekr.20040403120534.1391"><vh>12/17/01 ** Leo 0.05 released</vh></v>
<v t="ekr.20040403120534.1392"><vh>12/16/01 Found the source of the file mismatches</vh></v>
<v t="ekr.20040403120534.1393"><vh>12/16/01 Created directory compare routines</vh></v>
<v t="ekr.20040403120534.1394"><vh>12/15/01 Leo is operational</vh></v>
<v t="ekr.20040403120534.1395"><vh>12/15/01 Fixed bug in scanText</vh></v>
<v t="ekr.20040403120534.1396"><vh>12/15/01 Fixed bug in putBodyPart</vh></v>
<v t="ekr.20040403120534.1397"><vh>12/15/01 Fixed lookahead code in scanText, scanDoc</vh></v>
<v t="ekr.20040403120534.1398"><vh>12/14/01 Created leoCompare.py</vh></v>
<v t="ekr.20040403120534.1399"><vh>12/14/01 Create leoDialog.py</vh></v>
<v t="ekr.20040403120534.1400"><vh>12/14/01 Fixed minor problems</vh></v>
<v t="ekr.20040403120534.1401"><vh>12/13/01 Fixed several clone bugs</vh></v>
<v t="ekr.20040403120534.1402"><vh>12/13/01 Aha: we can eliminate v.setIcon !</vh></v>
<v t="ekr.20040403120534.1403"><vh>12/13/01 ** Fixed bottleneck with endupdate(flag)</vh></v>
<v t="ekr.20040403120534.1404"><vh>12/13/01 ** Syntax coloring now works</vh></v>
<v t="ekr.20040403120534.1405"><vh>12/12/01 Cut/copy/paste of nodes now done using internal clipboard</vh></v>
<v t="ekr.20040403120534.1406"><vh>12/12/01 Fixed insert, move, clone and delete commands</vh></v>
<v t="ekr.20040403120534.1407"><vh>12/12/01 Looked into Tk &amp; Python clipboard commands</vh></v>
<v t="ekr.20040403120534.1408"><vh>12/11/01 Menu accelerators</vh></v>
<v t="ekr.20040403120534.1409"><vh>12/11/01 Properly initialized the file in getLeoFile</vh></v>
<v t="ekr.20040403120534.1410"><vh>12/10/01 Got accellerators working</vh></v>
<v t="ekr.20040403120534.1411"><vh>12/10/01 Simplified icon handling, tree.redraw</vh></v>
<v t="ekr.20040403120534.1412"><vh>12/10/01 Used idle-time handler to work around event problems</vh></v>
<v t="ekr.20040403120534.1413"><vh>12/09/01 Problems with canvas border</vh></v>
<v t="ekr.20040403120534.1414"><vh>12/09/01 Tree now drawn properly</vh></v>
<v t="ekr.20040403120534.1415"><vh>12/08/01 Progress with selection</vh></v>
<v t="ekr.20040403120534.1416"><vh>12/07/01 Small improvements</vh></v>
<v t="ekr.20040403120534.1417"><vh>12/07/01 Tree now contains labels for editing</vh></v>
<v t="ekr.20040403120534.1418"><vh>12/06/01 Open/Close events now handled properly</vh></v>
<v t="ekr.20040403120534.1419"><vh>12/06/01 Tree drawn correctly, slowly</vh></v>
<v t="ekr.20040403120534.1420"><vh>12/04/01 Create .gif icons</vh></v>
<v t="ekr.20040403120534.1421"><vh>12/04/01 replaced dvnodes with vnodes!</vh></v>
<v t="ekr.20040403120534.1422"><vh>12/04/01 read code is now fast enough!</vh></v>
<v t="ekr.20040403120534.1423"><vh>12/04/01 tree starts to work</vh></v>
<v t="ekr.20040403120534.1424"><vh>12/01/01</vh></v>
</v>
<v t="ekr.20040403120534.1425"><vh>Nov 2001</vh>
<v t="ekr.20040403120534.1426"><vh>11/15/01 Created do-nothing tk app using Tkinter</vh></v>
<v t="ekr.20040403120534.1427"><vh>11/15/01 added -padx to log window</vh></v>
<v t="ekr.20040403120534.1428"><vh>11/13/01 Speeding up reads</vh></v>
<v t="ekr.20040403120534.1429"><vh>11/11/01 Design of tree class</vh></v>
<v t="ekr.20040403120534.1430"><vh>11/10/01 began conversion to tk</vh></v>
<v t="ekr.20040403120534.1431"><vh>11/10/01 es outputs newline</vh></v>
<v t="ekr.20040403120534.1432"><vh>11/10/01 fixed bug in putDocPart</vh></v>
<v t="ekr.20040403120534.1433"><vh>11/10/01 added code for @delims</vh></v>
<v t="ekr.20040403120534.1434"><vh>11/10/01 got @first working</vh></v>
<v t="ekr.20040403120534.1435"><vh>11/09/01 moved all globals into class</vh></v>
<v t="ekr.20040403120534.1436"><vh>11/09/01 fixed bugs in write logic</vh></v>
<v t="ekr.20040403120534.1437"><vh>11/09/01 fixed bugs read logic</vh></v>
<v t="ekr.20040403120534.1438"><vh>11/06/01 created Leo window using Tk</vh></v>
</v>
<v t="ekr.20040403120534.1439"><vh>Oct 2001</vh>
<v t="ekr.20040403120534.1440"><vh>11/01/01 Write code works except for comments</vh></v>
<v t="ekr.20040403120534.1441"><vh>10/31/01 Added Read/write submenu</vh></v>
<v t="ekr.20040403120534.1442"><vh>10/31/01 Fixed write code</vh></v>
<v t="ekr.20040403120534.1443"><vh>10/26/01 Read code is slow</vh></v>
<v t="ekr.20040403120534.1444"><vh>10/26/01 Read/write code now works</vh></v>
<v t="ekr.20040403120534.1445"><vh>10/11/01 Outline commands now work</vh></v>
<v t="ekr.20040403120534.1446"><vh>10/11/01 Removed redundant getters</vh></v>
<v t="ekr.20040403120534.1447"><vh>10/10/01 Debugged Commands, nodes, fileCommands</vh></v>
<v t="ekr.20040403120534.1448"><vh>10/08/01 design of leoFileCommands</vh></v>
<v t="ekr.20040403120534.1449"><vh>10/07/01 removed info and tagList classes</vh></v>
<v t="ekr.20040403120534.1450"><vh>10/05/01 c2py fixes, speedTest</vh></v>
<v t="ekr.20040403120534.1451"><vh>10/02/01 through 1/10/4</vh></v>
<v t="ekr.20040403120534.1452"><vh>10/01/01 fxed bugs in c2py</vh></v>
<v t="ekr.20040403120534.1453"><vh>10/01/01 c2py in leo</vh></v>
</v>
<v t="ekr.20040403120534.1454"><vh>Sept 2001</vh>
<v t="ekr.20040403120534.1455"><vh>9/30/01 documented c2py</vh></v>
<v t="ekr.20040403120534.1456"><vh>9/29/01 c2py.py</vh></v>
<v t="ekr.20040403120534.1457"><vh>9/25/01 Idle has trees &amp; syntax coloring</vh></v>
<v t="ekr.20040403120534.1458"><vh>9/14/01</vh></v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20040403120433"></t>
<t tx="ekr.20040403120534"></t>
<t tx="ekr.20040403120534.1"></t>
<t tx="ekr.20040403120534.2"></t>
<t tx="ekr.20040403120534.3"></t>
<t tx="ekr.20040403120534.4">The nullGui class is not ready for prime time yet.</t>
<t tx="ekr.20040403120534.5">Useful for unit testing.</t>
<t tx="ekr.20040403120534.6"></t>
<t tx="ekr.20040403120534.7"></t>
<t tx="ekr.20040403120534.8">Added at = self</t>
<t tx="ekr.20040403120534.9"></t>
<t tx="ekr.20040403120534.10"></t>
<t tx="ekr.20040403120534.11">This affects only the Reformat Paragraph command.</t>
<t tx="ekr.20040403120534.12"></t>
<t tx="ekr.20040403120534.13"></t>
<t tx="ekr.20040403120534.14"></t>
<t tx="ekr.20040403120534.15"></t>
<t tx="ekr.20040403120534.16">@nocolor

Leo now uses yymmddhhmmss as the format of timestamps.  This is good for sorting chronologically.</t>
<t tx="ekr.20040403120534.17">Using * shows files like readme that don't have a file extension.</t>
<t tx="ekr.20040403120534.18"></t>
<t tx="ekr.20040403120534.19"></t>
<t tx="ekr.20040403120534.20">The fix is to add a scripting arg to atFile.scanAllDirectives.</t>
<t tx="ekr.20040403120534.21">Also removed a confusing traceback.</t>
<t tx="ekr.20040403120534.22"></t>
<t tx="ekr.20040403120534.23">Found a batch-mode bug: the meaning of moves depends on whether nodes are expanded.  This won't be good in batch mode.</t>
<t tx="ekr.20040403120534.24"></t>
<t tx="ekr.20040403120534.25">It turns out that executing a script was setting the tnodeList for the node if the node had section refs!  This was the source of the ongoing mystery about why some nodes had tnodeLists.  Resolving this mystery puts Leo's read/write code on a firmer foundation.

This was tricky to make sure that tnodeList's are created and written only when necessary:

- The fileCommands.putVnode writes tnodeList only for @file nodes.
  (and only non-empty tnodeList's)

- new_df.write clears at.root.tnodeList when writing a script.

- c.checkOutline (and the related script) does not consider that an empty tnodeList is an error.</t>
<t tx="ekr.20040403120534.26"></t>
<t tx="ekr.20040403120534.27"></t>
<t tx="ekr.20040403120534.28">Replaced string concatenation with list operations.</t>
<t tx="ekr.20040403120534.29"></t>
<t tx="ekr.20040403120534.30">Dialogs return a predefined value.</t>
<t tx="ekr.20040403120534.31"></t>
<t tx="ekr.20040403120534.32"></t>
<t tx="ekr.20040403120534.33"># Line 1108: _multiples = [(2., Numeric.log10(2.)), (5., Numeric.log10(5.))]

I suspect this was a file that contained both tabs and spaces.</t>
<t tx="ekr.20040403120534.34"></t>
<t tx="ekr.20040403120534.35">My conclusion at present is that the problem lies with 4.0.4, not 4.1.  I can see nothing seriously wrong with the present code:

- Missing tnodeList errors are possible when @file nodes are cloned when converting from 3.x to 4.x.  The tnodeList probably should have been made part of tnodes, not vnodes; it's too late to change now.

- Missing tnodeList errors are not serious: Leo will recover as usual.

- The copy/paste code had a few bugs that I corrected today.  I doubt whether these would have caused major problems.

In short, the present code appears to be reasonably solid.  I should withdraw the 4.0.4 code asap.</t>
<t tx="ekr.20040403120534.36"></t>
<t tx="ekr.20040403120534.37"></t>
<t tx="ekr.20040403120534.38">The old way always surprised me.

To make this work I disabled checks in the read logic if at.importing is true</t>
<t tx="ekr.20040403120534.39"></t>
<t tx="ekr.20040403120534.40"></t>
<t tx="ekr.20040403120534.41"></t>
<t tx="ekr.20040403120534.42">Only double-quoted strings are valid in html.  A lone single-quote caused a cascade of mismatched comments.</t>
<t tx="ekr.20040403120534.43">This has been around ever since the dragging code was created.</t>
<t tx="ekr.20040403120534.44">Plugins are now loaded in the order in which they appear in pluginsManager.txt.

Removed all "compile-time" enabling/disabling code from leoPlugins.leo.

The only such checks that remain are checks to see if Tkinter can be imported, and other similar checks.
</t>
<t tx="ekr.20040403120534.45"></t>
<t tx="ekr.20040403120534.46">The only change was that replaceClipboardWith now no longer returns a value.</t>
<t tx="ekr.20040403120534.47"></t>
<t tx="ekr.20040403120534.48"></t>
<t tx="ekr.20040403120534.49"></t>
<t tx="ekr.20040403120534.50"></t>
<t tx="ekr.20040403120534.51"></t>
<t tx="ekr.20040403120534.52">getBodyLines must set head = tail = None when lines is expanded to include everything.

This probably affects several other commands.</t>
<t tx="ekr.20040403120534.53"></t>
<t tx="ekr.20040403120534.54"></t>
<t tx="ekr.20040403120534.55">This fixes several related bugs:  updateRecentFiles was not being called except when openWithFileName was called.</t>
<t tx="ekr.20040403120534.56"></t>
<t tx="ekr.20040403120534.57"></t>
<t tx="ekr.20040403120534.58">app.batchLog was completely redundant.</t>
<t tx="ekr.20040403120534.59"></t>
<t tx="ekr.20040403120534.60"></t>
<t tx="ekr.20040403120534.61">The command seems to work well enough when we get this message.</t>
<t tx="ekr.20040403120534.62">Apparently I added shortcuts to the popup menu for the first time recently.

The "duplicate binding" logic would complain if popups actually tried to bind the shortcuts.

The fix: to add a dontBind param to createMenuEntries and set that param when creating the popup menu.</t>
<t tx="ekr.20040403120534.63">Replaced asserts with warnings.</t>
<t tx="ekr.20040403120534.64">Renaming bodyCtrl to body conflicted with a previous var named body.</t>
<t tx="ekr.20040403120534.65">putRefLine must return if putRefAt finds an error.</t>
<t tx="ekr.20040403120534.66">This "real" test exposed several problems:

- Only --script was recognized, not -script.
- Created global app.batchLog var.
- Changes to nullLog.__init__
	- inits app.batchLog if app.batchMode is true.
	- inits app.batchLog if app.batchMode is true (only if app.batchLog not inited).
- trace now _always_ uses print.  This prevents problems with traces in nullLog.
- es now uses app.batchLog.put if app.batchMode is true.
- nullGui.runMainLoop prints nothing unless app.batchLog is enabled.</t>
<t tx="ekr.20040403120534.67"></t>
<t tx="ekr.20040403120534.68"></t>
<t tx="ekr.20040403120534.69"></t>
<t tx="ekr.20040403120534.70"></t>
<t tx="ekr.20040403120534.71"></t>
<t tx="ekr.20040403120534.72"></t>
<t tx="ekr.20040403120534.73">This is a convenience routine for scripts.  It does not update the body pane.</t>
<t tx="ekr.20040403120534.74"></t>
<t tx="ekr.20040403120534.75">These exposed some further problems with the reorg.
</t>
<t tx="ekr.20040403120534.76"></t>
<t tx="ekr.20040403120534.77">Must call </t>
<t tx="ekr.20040403120534.78"></t>
<t tx="ekr.20040403120534.79">@nocolor

- (fixed) I noticed this in leoConfig.leo: config_encoding = iso-8859-1

- (fixed) ImportError: No module named leoDialog.

- (fixed) TypeError: about() takes exactly 2 arguments (1 given) (plugin_menu plugin)

- (fixed) mod_spelling plugin: several bugs.</t>
<t tx="ekr.20040403120534.80">It was very easy to do: just use the atFile.write to write into a file-like object.

The only other complication: we temporarily replace the root's body text with just the selected text.

Created app.scriptDict to communicate between the Execute Script command and the scripts being executed.

app.script["script1"] contains the original script.

app.script["script2"] contains the preprocessed script.  This will contain Leo sentinel lines.</t>
<t tx="ekr.20040403120534.81">Moved @others inside if "tk and 1:"</t>
<t tx="ekr.20040403120534.82"></t>
<t tx="ekr.20040403120534.83">This is a necessary precondition to supporting Unicode file and directory names properly.  It's not at all clear whether this is sufficient.  Anyway, these routines help clean up the code.

I took care that scripts import only those os_path_xxx routines that are necessary.  However, this process could have introduced bugs.</t>
<t tx="ekr.20040403120534.84">The find &amp; change scripts show the power of Leo's new script find/change commands.

Getting these scripts correct was a bit tricky.</t>
<t tx="ekr.20040403120534.85"></t>
<t tx="ekr.20040403120534.86"></t>
<t tx="ekr.20040403120534.87"></t>
<t tx="ekr.20040403120534.88"></t>
<t tx="ekr.20040403120534.89"></t>
<t tx="ekr.20040403120534.90"></t>
<t tx="ekr.20040403120534.91"></t>
<t tx="ekr.20040403120534.92"></t>
<t tx="ekr.20040403120534.93"></t>
<t tx="ekr.20040403120534.94">Due to moving and renaming some commands routines.</t>
<t tx="ekr.20040403120534.95">A simple bug due to the reorg.</t>
<t tx="ekr.20040403120534.96"></t>
<t tx="ekr.20040403120534.97">The new setEditVnode setter didn't set the global.</t>
<t tx="ekr.20040403120534.98">This is much more natural than the old way.</t>
<t tx="ekr.20040403120534.99">This removes a bit of a kludge.</t>
<t tx="ekr.20040403120534.100"></t>
<t tx="ekr.20040403120534.101">The biggest Aha was getting rid of redirection routines.

I could get rid of the tree redicrection routines if I used a proper tree class.  It's probably not worth it...</t>
<t tx="ekr.20040403120534.102">Moved get/setRealMenuName &amp; setRealMenuNamesFromTable.

It is really satisfying to get rid of these globals.  It makes the leoGlobals file much stronger.</t>
<t tx="ekr.20040403120534.103">These were hardly used anyway, and getting rid of them greatly clarifies the code.

These may create small problems in plugins...</t>
<t tx="ekr.20040403120534.104">- Key insight 1:  menus must belong to frames, _not_ to a gui.

- Key insight 2:  frame.menu.getFrame is gui-independed, so no need to "redirect"

- Key insight 3:  We prefer "binding" routines to "redirection" routines.

	Redirection routines just cause confusion and unnecessary work.

- Moved all global menu routines into gui-specific classes.

	This is an application of insight 3.  We want to bind things, not redirect calls.

- Moved all gui menu routines into gui-specfic classes.

	Same principle at work.  Much less work.

- Key insight 4:  Leo's core always calls frame.menu.x, _not_ app.gui.menu.x.

	For one thing, menu code must be frame-dependent, so a general app.gui.menu method WILL NOT WORK.

- Eliminated all frame "redirection" routines relating to menus.

I am very pleased with the result.  The new code is simpler and much less confusion.</t>
<t tx="ekr.20040403120534.105">There was a name colision between the code that used to be in the Frame class.</t>
<t tx="ekr.20040403120534.106"></t>
<t tx="ekr.20040403120534.107">Another problems due to the reorg.

Whole word searches did not succeed if the pattern was at the start or end of body text.

The getCharBeforeIndex and getCharAfterIndex routines must check for start and end of text.

While I was at it, I changed is_c_id so that it returns false if the argument is None.</t>
<t tx="ekr.20040403120534.108">Apparently this must be done after creating the dialog.</t>
<t tx="ekr.20040403120534.109">This was the result of the reorg.</t>
<t tx="ekr.20040403120534.110"></t>
<t tx="ekr.20040403120534.111"></t>
<t tx="ekr.20040403120534.112">- Eliminated app.gui.utils class (all code in app.gui class).

- Eliminated Focus routines in leoGlobals.py (now in app.gui class).</t>
<t tx="ekr.20040403120534.113"></t>
<t tx="ekr.20040403120534.114">At long last I realized that the gui-specific app.gui class should have an associated utils class to handle gui-specific routines that used to be in leoGlobals.py.

The pattern is:

	gu = app.gui.utils
	...
	gu.xxx(args)

It would be possible to define all the body wrapper methods in terms of the app.gui.utils class.  However, these routines naturally belong in the gui-specific class, so not as much is gained by doing this as might be imagined at first.

Anyway, the road is now clear to rewrite the wx gui plugin.  It will probably take only a few hours to do this!</t>
<t tx="ekr.20040403120534.115">This went remarkably smoothly.

The separation of gui-dependent from gui-independent code was usually trivial.

The Find classes were a bit harder: I created about a dozen tkinter wrapper routines so that all the utils could be moved into the base class.  This means that all the find logic is in the base class, and implementing a wx Find panel will be very easy.

The app.gui routines no longer require a "run" routine.  Instead, calling app.gui.createXPanel creates the panel and runs it.  All panels now support a "bringToFront" routine that is called to make the panel visible when the panel already exists.</t>
<t tx="ekr.20040403120534.116">- Moved recentFiles ivar from frame class to commands class.

- updateRecentFiles must call app.config.setRecentFiles with self.recentFiles as the arg, not c.recentFiles.</t>
<t tx="ekr.20040403120534.117"></t>
<t tx="ekr.20040403120534.118">What I did:

- Created wrappers for tk calls in core.
	- Removed all tk calls in undoRedoText
- Created wrappers for all tk calls in leoTkinterFrame
	(exception) OnInsertHeadlineTime uses v.edit_text
- Moved gui-independent commands code from leoTkinterFrame to leoFrame.
	No changes were needed!
- Changed x.commands to x.c for all classes x.
- Eliminated intermediate event handlers in frame class.
- Removed event param from all commands handlers.
	- Exception: the cut/copy/paste handlers must have an event param.
-Moved all non-gui commands into commands class.
	- Removed all frame routines that called commands.
	**There is now a clear separation between gui-dependent routines in leoFrame subclasses
	  and gui-independent routines in Commands class.
- Created stub routines for gui-dependent routines in leoFrame class</t>
<t tx="ekr.20040403120534.119">Rather than calling oops, it is so much more intelligent to call the corresponding bodyCtrl routine!</t>
<t tx="ekr.20040403120534.120"></t>
<t tx="ekr.20040403120534.121">This was very easy.  Almost all the menu code is now gui-independent.  This will make implementing the wx gui plugin _much_ easier.</t>
<t tx="ekr.20040403120534.122">Leo was mistaking the escaped percentile sign "\%" (backslash followed by
percentile) for the LaTeX comment delimiter (plain percentile sign).

The fix was:

1. Add "\\%" to the list of LaTeX keywords.
2. Create latex_special_keyword_characters = "@(){}%"
3. Use latex_special_keyword_characters when scanning for possible LaTeX keywords.
</t>
<t tx="ekr.20040403120534.123">The problem is that a successful search _must_ reset the selection range, so there isn't much point to this command.  Moreover, the Find All and Change All commands would loop if they aren't equivalent to the Find and Change commands when this option is in effect.  All in all, an almost useless option.  Too bad.</t>
<t tx="ekr.20040403120534.124"></t>
<t tx="ekr.20040403120534.125"></t>
<t tx="ekr.20040403120534.126">LeoPy.leo, The "Code" part only:

nodes,lines,pages, 2398, 79524, 2070

leoPlugins.leo:  Plugins &amp; scripts

nodes,lines,pages, 403, 10880, 298

LeoDocs.leo:  Users Guide

nodes,lines,pages, 379, 44606, 967</t>
<t tx="ekr.20040403120534.127"></t>
<t tx="ekr.20040403120534.128">"mbcs" probably will work only on Windows!</t>
<t tx="ekr.20040403120534.129">A recent change was done incorrectly.  There is no "find()" method: I changed it to findNext().</t>
<t tx="ekr.20040403120534.130"></t>
<t tx="ekr.20040403120534.131"></t>
<t tx="ekr.20040403120534.132"></t>
<t tx="ekr.20040403120534.133">A useful little utility to set up script-find/change.</t>
<t tx="ekr.20040403120534.134">This involved fixing a bug in idle_body_key so that the oldText param is honored if present.</t>
<t tx="ekr.20040403120534.135">The Script Change checkbox will have a few uses:

- It is replacement for a script that replaces the selection with text.  Yes, this script would be easy to write, but why not write it for the user?

Leo will execute a "default change script" when the Script Change checkbox is checked.  Simple and effective.</t>
<t tx="ekr.20040403120534.136"></t>
<t tx="ekr.20040403120534.137">Yes, we really do need script-based find/change.  The reason is that the find panel (and the associated find commands) is really the only good place to allow the user to do an interactive search.  Without this feature, all interactive find/change scripts would have to duplicate all the work of the find/change commands.

Still to do: help scripts do undo.

Conventions enforced by Leo:

- The app.searchDict ivar can be used for communication between find &amp; change scripts.
- app.searchDict["type"] contains either "find", "change", "findAll" or "changeAll".
- The Find All command executes the find script only once unless the script sets
  app.searchDict["Continue"] = true  (similarly for the change all command.
- The Find Then Change command executes the find command followed by the change command.
- The Change Script command supports undo if app.searchDict has the following entry after the script executes:
	{ "v" : v, "oldText" : oldText, "newText" : s }
	A "keys" key is an optional keyword dict to be passed to setUndoParams.

Leo actually doesn't do much:

- Leo doesn't clear app.searchDict.
	- However, a _script_ can
		a) init itself and
		b) bring up the find window (Eureka!)
- The find script is repsonsible for traversing the tree.
- The find script is responsible for highlighting the found text
  or otherwise indicating to the change script what the found text was.
  For example, the re find script can set app.searchDict["m"] to the match object.
- The find script must communicate with the change script.  Leo does nothing.
- The change script must change the text, usually by using v.setBodyStringOrPane.</t>
<t tx="ekr.20040403120534.138">@color

# Example showing how a script can init the Find panel

script = """from leoGlobals import *
c = top() ; v = c.currentVnode()
print `v`
v = v.threadNext()
c.selectVnode(v)"""

from leoGlobals import *
app.searchDict = {} # Communication between search &amp; change scripts
c = top()
c.script_search_flag = true
c.find_text = script
app.findFrame.init(c)
c.frame.OnFindPanel()
</t>
<t tx="ekr.20040403120534.139">Undoing Change All cleared the body pane.

The fix was simple: call setUndoParams instead of setUndoTypingParams in batchChange.</t>
<t tx="ekr.20040403120534.140"></t>
<t tx="ekr.20040403120534.141"></t>
<t tx="ekr.20040403120534.142">The node-only option wasn't working due to a bug in createFrame.

There still may be a problem with the interaction between Node-only,Change All and Undo.</t>
<t tx="ekr.20040403120534.143"></t>
<t tx="ekr.20040403120534.144">The fix was to open files with 'rb' instead of 'r'.  This probably should be done in more places.</t>
<t tx="ekr.20040403120534.145">This command checks for unused tnodeLists and checks the topology of all clones.</t>
<t tx="ekr.20040403120534.146">Hoisting itself is easy.  The biggest challenge was preventing moves outside the hoisted area, which would too confusing.</t>
<t tx="ekr.20040403120534.147"></t>
<t tx="ekr.20040403120534.148">- Added df.fileChanged flag.  This is set by replaceTargetFileIfDifferent.

- Separated the "written" logic from the "changed" logic.  We do an auto-save only if something has actually been changed.  The "written" logic is used to warn if a tree contains no @file nodes.</t>
<t tx="ekr.20040403120534.149"></t>
<t tx="ekr.20040403120534.150"></t>
<t tx="ekr.20040403120534.151">This is required for compatibility with Leo 3.x versions.</t>
<t tx="ekr.20040403120534.152">app.use_gnx controls whether we generate full gnx's or not.  At present there is no setting for this, so 4.1 really defines a new file format.

There was some weirdness: assignFileIndices didn't actually assign all file indices!  As a hack, putTnodeList also assigns file indices.  The mystery is solved.  Leo only clears the tnodeList of roots when writing, so once a non-root node gets a tnode list it can stay a long time.  Probably should clear all non-root tnode lists, and this would slow things down.

Perhaps a script could do the job?</t>
<t tx="ekr.20040403120534.153"></t>
<t tx="ekr.20040403120534.154"></t>
<t tx="ekr.20040403120534.155">The state of frame.controlKeyIsDown is not always correct.  I added bindings to the hidden root window to try to catch this.  This may not be a good idea...</t>
<t tx="ekr.20040403120534.156">- Added config_encoding setting to specify the encoding of leoConfig.txt.
- Converted all options to Unicode when reading leoConfig.txt.
- Converted all options to config.config_encoding when writing leoConfig.txt.</t>
<t tx="ekr.20040403120534.157"></t>
<t tx="ekr.20040403120534.158">- Replaced all references in colorizer to bodyCtrl by body.x.
- Removed colorizer.bodyCtrl ivar.
- Created colorizer.body ivar.</t>
<t tx="ekr.20040403120534.159">This removes all possibility that call set_focus from Leo's core will cause problems.

Actually though, Leo's core calls no focus routines, so there should be no problems.</t>
<t tx="ekr.20040403120534.160"></t>
<t tx="ekr.20040403120534.161">Create new Idle-time and clipboard routines in leoGui and leoTkinterGui classes.  Also updated wx plugin.</t>
<t tx="ekr.20040403120534.162"></t>
<t tx="ekr.20040403120534.163"></t>
<t tx="ekr.20040403120534.164"></t>
<t tx="ekr.20040403120534.165"></t>
<t tx="ekr.20040403120534.166"></t>
<t tx="ekr.20040403120534.167"></t>
<t tx="ekr.20040403120534.168">What I did:

- assignFileIndices &amp; compactFileIndices now are identical.

- putVnode now assigns vnode indices to _all_ tnodes.
	(not all of them may be written, but that doesn't matter)

- putVnode no longer writes the "C" (cloned) attribute.

- finishPaste now _reallocates_ tnode indices in all pasted nodes.  This fixes a major copy/paste bug.  Failure to do this would have created "false clones": hidden clones that would show up when the file was read again.</t>
<t tx="ekr.20040403120534.169"></t>
<t tx="ekr.20040403120534.170">The root wasn't being set properly because of a missing break statement.</t>
<t tx="ekr.20040403120534.171"></t>
<t tx="ekr.20040403120534.172"># Changed col= to column= in several places.
# Changed @file to @file-nosent mod_autosave.ini.</t>
<t tx="ekr.20040403120534.173">The code now uses updateBodyPane as before.</t>
<t tx="ekr.20040403120534.174">We don't have to mess with the ending selection for reformatParagraph because the shift commands now properly restore the selection.</t>
<t tx="ekr.20040403120534.175"></t>
<t tx="ekr.20040403120534.176">This is a bit kludgy, due to Tk weirdnesses.  I don't think it can be helped...</t>
<t tx="ekr.20040403120534.177"></t>
<t tx="ekr.20040403120534.178">This now preserves trailing newlines correctly.  Far from intuitive.</t>
<t tx="ekr.20040403120534.179">Unlike using string.split and string.join, these preserve the state of the trailing newline.</t>
<t tx="ekr.20040403120534.180">Added -1c in setSelectionAreas and getSelectionLines.

Tk's selection mechanism isn't great here.  I want to select to the end of the line, and if I specifing x lineend the cursor actually gets placed at the start of the next line!</t>
<t tx="ekr.20040403120534.181"></t>
<t tx="ekr.20040403120534.182">The code was mistakenly calling frame.destroySelf() if the file could not be opened.  This is always wrong.

While I was at it, I added an except IOError: clause that simply reports that the file could not be opened.

I really should create a wrapper for file to handle the except IOError: case...</t>
<t tx="ekr.20040403120534.183"></t>
<t tx="ekr.20040403120534.184">"idle" hooks must test app.initing before calling app.forceShutdown().
</t>
<t tx="ekr.20040403120534.185"></t>
<t tx="ekr.20040403120534.186"></t>
<t tx="ekr.20040403120534.187">This will allow me to define frame.body as an instance of the leoTkinterBody class.</t>
<t tx="ekr.20040403120534.188"></t>
<t tx="ekr.20040403120534.189">This removes some of the frame details from the app class.

As a result, several app methods went away.</t>
<t tx="ekr.20040403120534.190">- Added new getters and setters to leoTkinterFrame.

- The following classes will soon become tkinter classes, so references to top are not important:

LeoColorPanel, LeoColorNamePanel, leoCompare, leoDialog, leoFind, leoFont, leoPrefs</t>
<t tx="ekr.20040403120534.191">- Removed v.iconx and vicony from Leo's core.
	- Added default args in tree.drawIcon() so Leo's core doesn't know about the ivars.

- tree.drawIcon is now the only routine that accesses these ivars!</t>
<t tx="ekr.20040403120534.192">
- tkinterTree now injects callbacks into vnode class.
- leoFrame.py now contains base classes named leoFrame, leoBody, leoLog and leoTree.
- Renamed present LeoFrame class to leoTkinterFrame and move it to leoTkinterFrame.py.
- Renamed present leoTree class to leoTkinterTree and move it to leoTkinterTree.py.</t>
<t tx="ekr.20040403120534.193"></t>
<t tx="ekr.20040403120534.194"></t>
<t tx="ekr.20040403120534.195"></t>
<t tx="ekr.20040403120534.196">- Simplified undoReplace code &amp; removed asserts.
- The text param is no longer used and could be removed.

Undo tests:

(passed) Read @file Nodes.
(passed) Import Derived Files

(passed) Extract Section
(passed) Extract Section Names.
(passed) Extract

(passed) Convert Tabs &amp; Convert All Tabs.
</t>
<t tx="ekr.20040403120534.197"></t>
<t tx="ekr.20040403120534.198"></t>
<t tx="ekr.20040403120534.199">This is too distracting while typing the directive.</t>
<t tx="ekr.20040403120534.200">@nocolor

The following appears in run() in leo.py:

@color

doHook("start1")
if app.killed: return # 10/15/03: allows the plugin to kill the app.</t>
<t tx="ekr.20040403120534.201">This command was not taking into account the optional -ver= part of the @+leo sentinel.</t>
<t tx="ekr.20040403120534.202">The command now looks at joined nodes if no ancestor @file node.</t>
<t tx="ekr.20040403120534.203"></t>
<t tx="ekr.20040403120534.204"></t>
<t tx="ekr.20040403120534.205"></t>
<t tx="ekr.20040403120534.206"></t>
<t tx="ekr.20040403120534.207">- Replaced all calls to v.copyTree related to undo by c.undoer.saveTree.

- Hacked u.undoReplace to handle tuple returned by u.saveTree.

- Fixed bugs in Convert All Blanks and Convert All Tabs routines.
	- These routines call convertBlanks and convertTabs as helpers.
	- Added arg to convertBlanks and convertTabs controlling whether these routines set undo state.
</t>
<t tx="ekr.20040403120534.208"></t>
<t tx="ekr.20040403120534.209"></t>
<t tx="ekr.20040403120534.210"></t>
<t tx="ekr.20040403120534.211">@language elisp
@color

(defun abc 'a "abc
xyz" cons)</t>
<t tx="ekr.20040403120534.212">Must call c.initAllCloneBits.</t>
<t tx="ekr.20040403120534.213"></t>
<t tx="ekr.20040403120534.214">This is a temporary expedient.  Probably using ch.isalpha() would be better</t>
<t tx="ekr.20040403120534.215">When doing a back scan we must test for the start of the text _after_ looking for brackets.</t>
<t tx="ekr.20040403120534.216"></t>
<t tx="ekr.20040403120534.217"></t>
<t tx="ekr.20040403120534.218">This was tricky to get right:

- There are several calls to after_idle(idle_body_key), so which gets scheduled is a matter of timing.  To handle that I added the tree.forceFullRedraw() routine.

- The undo/redo code also recolors the text.  Added a new param to undoRedoText so that it could force a full redraw after cut/paste.
</t>
<t tx="ekr.20040403120534.219">The new code is now guaranteed to go to the proper node of the outline.  However, @doc parts may disrupt line counts within a node.</t>
<t tx="ekr.20040403120534.220"></t>
<t tx="ekr.20040403120534.221"></t>
<t tx="ekr.20040403120534.222">Somehow a number of calls to c.initJoinedCloneBits got omitted.</t>
<t tx="ekr.20040403120534.223">vnode attributes would typically be used for things like marks or additional icons.

tnode attributes would typically be used for anything associated with shared headline or body text.</t>
<t tx="ekr.20040403120534.224">tkinterGui.destroy must call frame.top.destroy.</t>
<t tx="ekr.20040403120534.225"></t>
<t tx="ekr.20040403120534.226"></t>
<t tx="ekr.20040403120534.227">The code was attempting to reference an ivar.  I placed sentinelNameDict inside sentinelName() and referenced it directly.</t>
<t tx="ekr.20040403120534.228">This is required so that attributes get set in the leoApp object rather than the proxy object.</t>
<t tx="ekr.20040403120534.229"></t>
<t tx="ekr.20040403120534.230"></t>
<t tx="ekr.20040403120534.231"></t>
<t tx="ekr.20040403120534.232">This is a big step forward.  newLeoCommanderAndFrame provides a place to explore the complexities of initializing LeoFrames and their commanders.

newLeoCommanderAndFrame does the following.  Order is _crucial_:

- first creates an "empty" frame first to pass to the commanders.  This was an Aha!
- then creates the commander and all subcommanders.
- then calls the new frame.finishCreate routine to create the actual frames.
- finally calls c.undoer.clearUndoState(), which requires that menus have already been created.

The present code should be moved to the tkinterGui class.</t>
<t tx="ekr.20040403120534.233">Leo now warns if it can't find either the Icons directory or the LeoApp16.ico icon in that directory.</t>
<t tx="ekr.20040403120534.234"></t>
<t tx="ekr.20040403120534.235"></t>
<t tx="ekr.20040403120534.236"></t>
<t tx="ekr.20040403120534.237"></t>
<t tx="ekr.20040403120534.238"></t>
<t tx="ekr.20040403120534.239"></t>
<t tx="ekr.20040403120534.240">This is much more natural and less cluttered.</t>
<t tx="ekr.20040403120534.241">There were bugs involving the c.pattern_match_flag and c.suboutline_only_flag.

The present code is way too fragil and clumsy.  I plan to rewrite it completely when the configuration logic is redone.

Also, the present code using only a single copy of leoConfig.txt, so changing a setting in one .leo file may change settings in other .leo files.</t>
<t tx="ekr.20040403120534.242">@nocolor

Class level-code after the method definitions was dropped:

@color

class someclass:
	def __init__(self):
		pass

	# this code is dropped
	class_var = None

def some_proc():
	pass</t>
<t tx="ekr.20040403120534.243"></t>
<t tx="ekr.20040403120534.244">allow_clone_drags = 1
# 1: Allows control-dragging to create clones.
# 0: All drags move nodes.
# See also: look_for_control_drag_on_mouse_down
# Setting this setting to 0 allows Leo to be used on Aqua.

enable_drag_messages = 1
# 1: Tell whether drags will move nodes or clone nodes.
# 0: Don't issue such messages.</t>
<t tx="ekr.20040403120534.245">The read code now clears the dirty bit in the root vnode before looking for changed text.

While I was at it, I moved some of the dirty bit logic into getLeoFile.  This makes all read commands work the same.</t>
<t tx="ekr.20040403120534.246">Fixed Go To Outline command so it doesn't crash on 4.0 files.  More work is needed:

- There are "off-by-one" errors.
- It is possible that a complete rewrite in the 4.0 case would be significantly better.</t>
<t tx="ekr.20040403120534.247">This was easy: just write a newline and an @nonl sentinel if the text does not end in a newline.

Compare with the messy 3.x code: a huge simplification.</t>
<t tx="ekr.20040403120534.248">The reason this was so strange is that the at.sentinels ivar was not initialized properly, either in the the old or new classes.  Usually this ivar is set properly (to true) because the _preceding_ file is an @file node that does init the ivar to true.

So the fix was just to set self.sentinel = true in new_df.rawWrite and old_df.rawWrite</t>
<t tx="ekr.20040403120534.249"></t>
<t tx="ekr.20040403120534.250"></t>
<t tx="ekr.20040403120534.251">Again, this wasn't an error, and it was confusing.</t>
<t tx="ekr.20040403120534.252">This wasn't a bug, but it was quite confusing.</t>
<t tx="ekr.20040403120534.253">This avoids overriding the base putSentinel routine with a routine with a different signature.

This argument was never used anyway.</t>
<t tx="ekr.20040403120534.254">This avoids overriding the base scanText routine with a routine with a different signature.</t>
<t tx="ekr.20040403120534.255">leo.py

- Added leoDialog and traceback to import list.
- Removed app args from createFrame and initSherlock.

leoApp

- Changed tList = [] to tDict = {}
- Removed app.finishCreate.

- leoCommands

- Removed some unused local vars in Convert Blanks/Tabs and Reformat Paragraph commands.

leoCompare

- Removed import leoApp, leoCommands from run() method.

leoFileCommands

- Removed unused self.a ivar.
- Removed unused first line below in getPrefs:
	s = string.lower(name)
	language = string.replace(name,"/","")

leoFrame:

- removed some imports from inside createNewMenu and deleteMenuItem.  Plugins should not need these.

- Removed unused vars:
	changed: &lt;&lt; read optional version param &gt;&gt;
	changed: old_df.readOpenFile
	changed: scanText
	changed: &lt;&lt; Test for @path &gt;&gt;
	changed: &lt;&lt; compute relative path from s[k:] &gt;&gt;
	changed: putDocPart (3.x)
	changed: putCodePart &amp; allies
	changed: new_df.readOpenFile
	changed: nodeSentinelText
	changed: &lt;&lt; write then entire @file tree &gt;&gt; (4.x)

leoGlobals:

- Removed unused vars in
	scanAtTabwidthDirective,skip_braces,skip_php_braces,skip_pp_part,isValidEncoding
	&lt;&lt; Set local vars &gt;&gt;
	&lt;&lt; compute relative path from s[k:] &gt;&gt;

leoGui

- Changed self.defaultFont to app.config.defaultFont in getFontFromParams.
- Added leoFrame to import list.

leoNodes

- Fixed real bug in appendStringToBody.
	- The code used none instead of None: changed test just to if not s: return

leoPlugins

- Removed import sys from loadHanders()

leoTree

- Disabled unused call to canvas.find_closest in OnContinueDrag.  Maybe this will help performance?</t>
<t tx="ekr.20040403120534.256">Fixed:

c:\prog\leoCVS\leo\src\leoFileCommands.py:814: Local variable (config) not used
c:\prog\leoCVS\leo\src\leoImport.py:994: Local variable (c) not used
c:\prog\leoCVS\leo\src\leoCompare.py:707: Local variable (c) not used
c:\prog\leoCVS\leo\src\leoCompare.py:707: Local variable (cmp) not used
c:\prog\leoCVS\leo\src\leoFontPanel.py:155: Local variable (c) not used
c:\prog\leoCVS\leo\src\leoApp.py:224: Local variable (tList) not used
c:\prog\leoCVS\leo\src\leoTree.py:1512: Parameter (v) not used (createPopupMenu)
c:\prog\leoCVS\leo\src\leoTree.py:1603: Parameter (v) not used (showPopupMenu)
c:\prog\leoCVS\leo\src\leoApp.py:365: No module attribute (leoID) found (remove app.setLeoId)</t>
<t tx="ekr.20040403120534.257"></t>
<t tx="ekr.20040403120534.258">- Changed app().x to app.x everywhere.

- Changed a.x to app.x everywhere, and eliminated the assignments a = app()

This paves the way to use the app.gui.x pattern more widely.

I did this now so that I could check this with Pychecker: I must run Pychecker anyway so this kills two birds with one stone.
</t>
<t tx="ekr.20040403120534.259"></t>
<t tx="ekr.20040403120534.260">The reason app() is needed is that it's definition doesn't change, even though what it returns does change during startup.

The problem with using a global app var is that from leoGlobals import * picks up and _caches_ the _uninitialized_ value.  Setting leoGlobals.app in the startup logic does not affect all the cached values.

The only way to prevent this would be be avoid importing any of Leo's modules until after the app object has been created.  This looks impossible, and it would be very brittle even if it were possible.

I _really_ would like from leoGlobals import app to work, but how to delay the import until later?</t>
<t tx="ekr.20040403120534.261">These routines now do the following:

1. Print a warning message if their internal string representation is not a unicode string.

2. Convert their results to unicode.</t>
<t tx="ekr.20040403120534.262">The tnode ctor now ensures that headline and body text are converted to Unicode using app.tkEncoding.</t>
<t tx="ekr.20040403120534.263">This was never needed, and removing it prepares to change app from a function to a global var.
</t>
<t tx="ekr.20040403120534.264"></t>
<t tx="ekr.20040403120534.265">1. Called getAllText in the following routines:

colorizeAnyLanguage
convertAllBlanks,convertAllTabs,extract,extractSection,extractSectionNames
OnExecuteScript

2. Called getSelectedText in the following routines:

OnExecuteScript

3. Called x = toUnicode(s,app().tkEncoding) in the following routines after a call to t.get(...)

bound_paragraph,getBodyLines,reformatParagraph
OnReturnKey
OnFindMatchingBracket,findMatchingBracket
updateStatusRowCol
changeAll,findAll
&lt;&lt; test for whole word match &gt;&gt;</t>
<t tx="ekr.20040403120534.266">Previously, nothing was printed if </t>
<t tx="ekr.20040403120534.267">Created new LeoApp16.ico icon w.wm_iconbitmap().

The old code still works with Python 2.2.</t>
<t tx="ekr.20040403120534.268"></t>
<t tx="ekr.20040403120534.269">All the real code has now been moved from leoGlobals.py to leoGui.py.</t>
<t tx="ekr.20040403120534.270"></t>
<t tx="ekr.20040403120534.271"></t>
<t tx="ekr.20040403120534.272">This is the foundation for "foreign" guis.</t>
<t tx="ekr.20040403120534.273"></t>
<t tx="ekr.20040403120534.274"></t>
<t tx="ekr.20040403120534.275">After the 4.0 beta 1 release I changed the default so that _new_ format derived files are written if leoConfig.txt does not exist.</t>
<t tx="ekr.20040403120534.276"></t>
<t tx="ekr.20040403120534.277"></t>
<t tx="ekr.20040403120534.278">This allows the caller to do an auto-save only if something was really written.</t>
<t tx="ekr.20040403120534.279">When I first tried to open LeoPy.leo after writing all @file nodes (With the Write @file Nodes command) I got a

"No joinList for tnode" message.

What I did:

1. Error recovery worked perfectly.  No damage was done!

2. getLeoFile must call setAllJoinLinks _before_ reading @file nodes so that findChild will see a valid joinList.

	- This is perfectly safe in 4.0 because reading _never_ creates vnodes or alters vnode links.

3. writeAtFileNodes now does an auto-save.</t>
<t tx="ekr.20040403120534.280"></t>
<t tx="ekr.20040403120534.281"></t>
<t tx="ekr.20040403120534.282"></t>
<t tx="ekr.20040403120534.283"></t>
<t tx="ekr.20040403120534.284">The output is the same in both the old and new versions.</t>
<t tx="ekr.20040403120534.285"></t>
<t tx="ekr.20040403120534.286">findChild now calls at.readError when t.joinList is None so reading will stop immediately without crashing.</t>
<t tx="ekr.20040403120534.287">@+doc and @+at sentinels indicate trailing whitespace.

It is crucial that whitespace is _always_ handled correctly.</t>
<t tx="ekr.20040403120534.288">This didn't do anything...</t>
<t tx="ekr.20040403120534.289">Must be done to clear tnodeList in the .leo file.  This allows the user to create a 3.x compatible .leo file.</t>
<t tx="ekr.20040403120534.290"></t>
<t tx="ekr.20040403120534.291"></t>
<t tx="ekr.20040403120534.292">I was surprised that the top-level class was a subclass of oldDerivedFile.  This isn't really good.

The first step of separating the class was to make the sentinel constants global to the module.  This required substantial changes.

After that, I separated the atFile class just by providing the initIvars and readLine routines.  To make readLine work I had to init self.encoding.  That's all!

Derived classes must follow base classes in the module, so I changed the top-level node to force the correct order regardless of node order.</t>
<t tx="ekr.20040403120534.293">Changed made:

1. Look ahead in putDocLine to preserve additional leading whitespace.
2. Do _not_ eliminate newline in readLastDocLine.  That must be done only by @nonl logic.

Note:  The code can not do a perfect job of restoring whitespace: it can not distinguish between @ and @space on a line by itself.  However, this construction is rare, and there really is no difference between them.</t>
<t tx="ekr.20040403120534.294"></t>
<t tx="ekr.20040403120534.295">The code calls at.writeAll(writeAtFileNodesFlag=true) to write all nodes in the selected tree.</t>
<t tx="ekr.20040403120534.296">Handling @first and @last is actually quite subtle, and the old code handles the job correctly.

getAtFirstLastLines simply couldn't cut it.  Thanks again to Dave Hein.</t>
<t tx="ekr.20040403120534.297">This must be done to preserve the tnodeList.</t>
<t tx="ekr.20040403120534.298">This code hasn't been tested yet.

- Don't change body text if a) @last and b) only difference is last newline.</t>
<t tx="ekr.20040403120534.299">This is a big step forward:  it eliminates some nasty modes.

- scanHeader returns flag instead of setting ivar.
- Write code uses config.write_old_format_derived_files.</t>
<t tx="ekr.20040403120534.300">Both the old and new write code does this.</t>
<t tx="ekr.20040403120534.301">This is too annoying during testing.</t>
<t tx="ekr.20040403120534.302">We no longer need this: the write_old_format_derived_files setting is enough to disable new writes.

In other words, the transition to 4.0 has begun!</t>
<t tx="ekr.20040403120534.303">This is the clean way of setting the default using the config.write_old_format_derived_files setting.</t>
<t tx="ekr.20040403120534.304">This is the clean way of forcing writes using old or new format.</t>
<t tx="ekr.20040403120534.305">findChild(4.0) and createNthChild (3.x) both now call v.t.setVisited.  The code in top_df.read warns if any non-empty node is unvisited.

This check, and the check that headlines match pretty much guarantees that out-of-synch outlines will generate errors.  In that case, there is no need a gnx timestamp in @+leo sentinels!</t>
<t tx="ekr.20040403120534.306"></t>
<t tx="ekr.20040403120534.307">These changes made in leoPlugins.leo (use_gnx) first.  They will be moved into LeoPy.leo soon.

What I did:
	- Removed gnx's for now (maybe forever?)
	- Eliminated use_gnx and using_gnx code from new read code.
	- All old read/write routines pass.
	- Fixed a bug in old write code(!!) @verbatim was not output correctly!
	- Created top_df.scanDefaultDirectory and top_df.error.
		- We must have this in order to open files in the proper directory.
	- Replaced calls to at.init_ivars by df.init_ivars
	- Created new_df.raw_write
	- Create top_df write routines.
	- Created class topLevelDerivedFileCommands
	- Created class oldDerivedFile
	- Created class newDerivedFile(oldDerivedFile)
	- Removed all error recovery logic from old read code.
	- Replaced structureErrors ivar with errors ivar.
	- Old read code now sets t.tempBodyString.
	- Move all common read code into top_df.read.
</t>
<t tx="ekr.20040403120534.308">- Moved setLeoID into leoApp.py
- Moved nodeIndices class into leoNodes.py.
- Moved askLeoID into leoDialogs.py
- Eliminated myTnode class.
- Moved myFrame methods into leoFrame.py and eliminated myFrame.
</t>
<t tx="ekr.20040403120534.309"></t>
<t tx="ekr.20040403120534.310"></t>
<t tx="ekr.20040403120534.311"></t>
<t tx="ekr.20040403120534.312"></t>
<t tx="ekr.20040403120534.313"></t>
<t tx="ekr.20040403120534.314"></t>
<t tx="ekr.20040403120534.315"></t>
<t tx="ekr.20040403120534.316"></t>
<t tx="ekr.20040403120534.317">tnodeList must be a list of tnodes, _not_ a list of tnode indices.

Indices may be reassigned, tnodes won't.

The _only_ place that an index is proper is in the file format itelf.</t>
<t tx="ekr.20040403120534.318">The script is called "Script to compare 3.x and 4.x derived files" in test.leo.
</t>
<t tx="ekr.20040403120534.319">The bug was in directiveKind.  There are two ways for the code to recognize @others.  After inserting the second way, I mistakenly commented out the first way (by commenting out @others in the table).</t>
<t tx="ekr.20040403120534.320"></t>
<t tx="ekr.20040403120534.321"></t>
<t tx="ekr.20040403120534.322"></t>
<t tx="ekr.20040403120534.323"></t>
<t tx="ekr.20040403120534.324">The new version of putLeadInSentinel works as follows:

1. It calls at.putIndent(at.indent) followed by the leading whitespace in the outline line.

The effect of this is

a) to align the @ws sentinel with the following sentinel and
b) to preserve the "spelling" of the leading whitespace on the line.

2. N.B. The calls to putLeadInSentinel happen _before_ at.indent is changed as the result of the leading whitespace. 

Again, this is so that putLeadInSentinel can preserve the spelling of whitespace.

3. The contribution of the @ws sentinel is the _difference_ between the value of at.indent when the @ws sentinel is being read and the actual whitespace on the line.  Again, we do this to make the derived file look better.</t>
<t tx="ekr.20040403120534.325">This makes the @nl look better, and has no other effect.</t>
<t tx="ekr.20040403120534.326">- Special case code for blank lines.
- Created putBlankDocLine.</t>
<t tx="ekr.20040403120534.327"></t>
<t tx="ekr.20040403120534.328"></t>
<t tx="ekr.20040403120534.329"></t>
<t tx="ekr.20040403120534.330"></t>
<t tx="ekr.20040403120534.331">I added this code to the "main" line for upward compatibility with 4.0.  The main line code does nothing with the new tnodeList attribute as yet.</t>
<t tx="ekr.20040403120534.332">This method now uses the tnode list to find the indicated tnode.  It also checks the headline.</t>
<t tx="ekr.20040403120534.333"></t>
<t tx="ekr.20040403120534.334">The code that reads the new tnodeList attribute of vnodes is contained in the "main line" code, i.e., in LeoPy.leo.  This means that Leo will always be able to read (and ignore) the tnodeList attribute.

The code that writes the attribute is part of the use_gnx plugin.

The tnodeList returns a tnode, not a vnode, so it makes sense to keep track of at.t not at.v.
</t>
<t tx="ekr.20040403120534.335">- The new code now hanles the basic cases properly.

- Added @nl sentinel to indicate whether a section ref should be followed by a newline.

- The read code now sets v.t.tempBodyString instead of call v.setBodyStringOrPane.  This is a major advance in error recovery:  nothing at all changes if errors happen.

What I did earlier:
	- Removed @+body and @-body
	- Don't write organizer nodes in @others</t>
<t tx="ekr.20040403120534.338"></t>
<t tx="ekr.20040403120534.339"></t>
<t tx="ekr.20040403120534.340">This has been changed in Python 2.3 and it probably wasn't ever a good idea...</t>
<t tx="ekr.20040403120534.341"></t>
<t tx="ekr.20040403120534.342">This removes a warning new in Python 2.3.
</t>
<t tx="ekr.20040403120534.343"></t>
<t tx="ekr.20040403120534.344"></t>
<t tx="ekr.20040403120534.345"></t>
<t tx="ekr.20040403120534.346">However, no change was required to cutomizing.html.  In other words, the online description of plugins and hooks was already good.</t>
<t tx="ekr.20040403120534.347"></t>
<t tx="ekr.20040403120534.348">@nocolor

Put install/uninstall in base directory of distribution

Put leo-script.txt goes in ./scripts/install/leo-script.txt
</t>
<t tx="ekr.20040403120534.349">The new values are:

"initial_window_height" : 600, # 7/24/03: In pixels.
"initial_window_width" :  800, # 7/24/03: In pixels.</t>
<t tx="ekr.20040403120534.350"></t>
<t tx="ekr.20040403120534.351"></t>
<t tx="ekr.20040403120534.352"></t>
<t tx="ekr.20040403120534.353"></t>
<t tx="ekr.20040403120534.354">There was no way to remove a default shortcut so that no shortcut was used.

The problem:

You attempted to remove a shortcut merely by removing an entry in the shortcuts section of leoConfig.leo/.txt.  That doesn't work:  the default shortcut remained and conflicted with a new shortcut.  BTW, Leo does need defaults for when leoConfig.txt does not exist.

The workaround:

Specify in leoConfig.leo/.txt some shortcut to override the conflicting shortcuts.
The proper fixes (now on cvs):

1. Leo now sends a warning both to the console window (if any) and to the log pane when it detects a duplicate shortcut.

2. Leo now allows leoConfig.txt to remove the shortcut for a command by specifying None (case doesn't matter) as the value of the shortcut.</t>
<t tx="ekr.20040403120534.355"></t>
<t tx="ekr.20040403120534.356"></t>
<t tx="ekr.20040403120534.357"></t>
<t tx="ekr.20040403120534.358">These aren't great tests, and they do show that now exceptions are thrown in the colorizer.</t>
<t tx="ekr.20040403120534.359">Also fixed some bugs (missing commas) in the list of rebol keywords.</t>
<t tx="ekr.20040403120534.360"></t>
<t tx="ekr.20040403120534.361">This was a most irritating bug.

The problem was in tree.OnDeactivate.  The calls to tree.endEditLabel() and tree. self.dimEditLabel() were interfering with the double-click logic.

What I did:

- Changed tree.OnDeactivate so that it only tried to deactivate the headline if the focus was previously in the tree.  Simple, effective.

- Added get_focus to leoGlobals.py.

- Removed unused frame.active and frame.activeFrame ivars.
	
- Changed set_focus so it only call widget.focus_set if there has been a real change in focus.
	- This has no effect, and could cause problems due to bad params being passed.</t>
<t tx="ekr.20040403120534.362">Added openWithFileName to leoGlobals.py.

	- This allows startup code to create a frame without an existing frame.
	- frame.OpenWithFileName now just calls this global.

Changed startup code so that:

	- Only one window is ever created on startup.
	- Windows are not witdrawn when they are created.</t>
<t tx="ekr.20040403120534.363">This shows Leo's nav buttons and status line.</t>
<t tx="ekr.20040403120534.364"></t>
<t tx="ekr.20040403120534.365">Fixed minor bugs in convertAllBlanks and convertAllTabs (reported no change when there was a change.)</t>
<t tx="ekr.20040403120534.366">This constitutes a major changes to Leo's fundamental vnode code.  

v.copyTree now creates a free-standing tree that may be linked into an existing outline using any of the v.linkX routines.  This is a major simplification that was long overdue.

N.B.  Copied trees share tnodes with the original code.  It would be easy to make this optional, and at present all code expects tnodes to be shared.

N.B.  Nodes of the copied trees are _not_ joined to the original tree.  That is, the copied vnodes v do not appear in v.t.joinList.
</t>
<t tx="ekr.20040403120534.367">The following commands are affected:

Convert All Blanks, Convert All Tabs, Extract, Extract Names, Extract Section.

What I did:

- Rewrote undoer.undoReplace.
	- It is not enough to call createDependents or destroyDependents.
	- 

- Called setUndoParams with oldText, newText, oldSel, newSel params.
</t>
<t tx="ekr.20040403120534.368"></t>
<t tx="ekr.20040403120534.369">The new code assumes nothing about when event handlers get called.</t>
<t tx="ekr.20040403120534.370"></t>
<t tx="ekr.20040403120534.371"></t>
<t tx="ekr.20040403120534.372">- added set_focus and force_focus utilities for better tracing.
- changed drawText so it calls setNormalLabelState when v == editVnode.
	idle_redraw no longer interferes with the headline being edited.
- setNormalLabelState now selects all text and calls set_focus.
- added callers keyword param to trace.
- simplified c.insertHeadline: it no longer has to avoid redraws.</t>
<t tx="ekr.20040403120534.373">This must be done to plug a major security hole.
</t>
<t tx="ekr.20040403120534.374"></t>
<t tx="ekr.20040403120534.375">This was pretty easy.  What I did:

- Changed getTextSelection so that it returns a tuple (insert,insert) instead of (None,None) if the selection range is empty.  This does most of the work!  However, the changeSelection code must now explicitly test to see whether start==end

- Pass an oldSel param to most calls of onBodyChanged.

- Added a newSel param to onBodyChanged and idle_body_key.

- Forced the focus to the body pane after pressing undo/redo buttons in the Spell Checker.  This makes the selection visible.</t>
<t tx="ekr.20040403120534.376">Shift-Control-O was causing a crash.  Not surprising since it had no business in call OnOpenWith.

What I did:
	
- removed event param from OnOpenWith.
- Created an Open With Submenu in &lt;&lt; create the top-level file entries &gt;&gt;
	This has the effect of not allowing a shortcut for this menu.
- Use app().hasOpenWithMenu to enable or disable Open With menu.
- Removed Shift-Control-O setting in leoConfig.leo/.txt.</t>
<t tx="ekr.20040403120534.377"></t>
<t tx="ekr.20040403120534.378"></t>
<t tx="ekr.20040403120534.379">Made this change to the Color, Compare, Font, Prefs and Spelling panels.  However, this doesn't set the focus as I would like.</t>
<t tx="ekr.20040403120534.380">dict was being altered in a loop where it shouldn't be.  Changed the name of the var in the loop from dict to d.</t>
<t tx="ekr.20040403120534.381">Symptom: Sometimes the "reading" messages would not appear when reading an outline.

Cause: Several event handlers are called at unpredictable times during the load process.  These may try to reset the log.

Solution:

- create app.setLog, app.lockLog and app.unlocklog methods.
- call app.lockLog before opening an outline.</t>
<t tx="ekr.20040403120534.382">Changed destroyOpenWithFilesForFrame and createOpenWithTempFile so they don't loop on a list that is being modified.</t>
<t tx="ekr.20040403120534.383"></t>
<t tx="ekr.20040403120534.384"></t>
<t tx="ekr.20040403120534.385">@color

# Commanders and subcommanders.
class Commands (baseCommands): pass
class atFile (baseAtFile): pass
class fileCommands (baseFileCommands): pass
class leoImportCommands (baseLeoImportCommands): pass
class tangleCommands (baseTangleCommands): pass

# Helper classes.
class colorizer (baseColorizer): pass
class config (baseConfig): pass
class undoer (baseUndoer): pass

# Key data classes.
class LeoFrame (baseLeoFrame): pass
class leoTree (baseLeoTree): pass
class tnode (baseTnode): pass
class vnode (baseVnode): pass

# Dialogs and other panels
class leoColorPanel (baseLeoColorPanel): pass
class leoColorNamePanel(baseLeoColorNamePanel): pass
class leoComparePanel (baseLeoComparePanel): pass
class leoCompare (baseLeoCompare): pass
class leoFontPanel (baseLeoFontPanel): pass
class leoDialog (baseLeoDialog): pass
class LeoPrefs (baseLeoPrefs): pass
</t>
<t tx="ekr.20040403120534.386">- Made functions into class methods.
- Make sure to close pipes after every command.
- Rewrite local dictionary in alph order.
</t>
<t tx="ekr.20040403120534.387"></t>
<t tx="ekr.20040403120534.388">At present setup.py must be run from the top level leo directory.  Hopefully this will be fixed.

Also, the linux install script won't work.
</t>
<t tx="ekr.20040403120534.389">c:\prog\leoCVS\leo\src\leoAtFile.py:2791: Format string argument count (1) doesn't match arguments (2)

c:\prog\leoCVS\leo\src\leoFrame.py:976: No global (a) found

This may have been the cause of some problems with the log panel.

c:\prog\leoCVS\leo\src\leoNodes.py:1174: Parameter (encoding) not used

This may have been the cause of some "unicode" problems.</t>
<t tx="ekr.20040403120534.390">The old code had no chance of working.  I think I actually understand what is happening now...</t>
<t tx="ekr.20040403120534.391">The body_pane_wraps setting is used if neither of these directives is in effect.
</t>
<t tx="ekr.20040403120534.392"></t>
<t tx="ekr.20040403120534.393">Added code to check for errors in the table passed to createOpenWithMenuFromTable.</t>
<t tx="ekr.20040403120534.394">We have to do the &lt;&lt; set removeTrailing &gt;&gt; logic when the delete key is pressed, and that wasn't happening.

The new code now remembers properly when the user deletes a trailing newline.</t>
<t tx="ekr.20040403120534.395"></t>
<t tx="ekr.20040403120534.396">created frame.setInitialWindowGeometry.</t>
<t tx="ekr.20040403120534.397">1. Added destroy routines for all major classes

This allows most window objects to be garbage collected when a window closes.  In practice it is _very_ difficult to remove all references to all window objects.  Breaking those links "by hand" in the destroy routines is a more pragmatic approach.

The big drawback is that destroy methods must be updated when a new ivar is added to a ctor that refers to other objects.  In practice, such ivars aren't added often.

With these new routines in place Leo does, in fact, recycle most objects from windows when a window closes.  This plugs the last (relatively minor) leak in Leo.

2. Created a _general_ way of clearing all ivars of an object.

o.__dict__.clear() does the job!

3. Remvoed all destroy routines, replacing them by app.destroyAllWindowObjects().

This is a simple, effective, pragmatic approach, and it doesn't require changes when new ivars are added to ivars!</t>
<t tx="ekr.20040403120534.398"></t>
<t tx="ekr.20040403120534.399"></t>
<t tx="ekr.20040403120534.400">These are not needed now that Python has a gc that can recover cycles.

Everything should go away because:

- app().windowList no longer points to a frame.
- frame.top.destroy() eliminates all the Tk pointers.</t>
<t tx="ekr.20040403120534.401">I did the following:

- Searched for use_gnx, using_gnx, use_pre_4pt0_file_formats.
- Removed all 4.0 constants from &lt;&lt; atFile constants &gt;&gt;
- Removed the setting corresponding to use_pre_4pt0_file_formats config ivar.

As I was doing this I moved routines and code snippets into the Abandoned Code from 4.0 node.

This is a major step forward for Leo!  The code base is mostly back to 3.10 days, with some improvements to vnodes and tnodes.</t>
<t tx="ekr.20040403120534.402"></t>
<t tx="ekr.20040403120534.403"></t>
<t tx="ekr.20040403120534.404">Fractions cause problems in some locales.  The height/width params weren't used anyway!
</t>
<t tx="ekr.20040403120534.405">This was all that was needed to correct the problem with new windows.</t>
<t tx="ekr.20040403120534.406">- Added self.widgets list and associated logic in deleteBindings.

We can't rely on the Tk.Widget to delete the associated Python objects!

- Added printGarbage routine to leoGlobals.py.</t>
<t tx="ekr.20040403120534.407">This is significant for two reasons:

1.  It shows how to reduce the number of Tk widgets allocated to a constant (linear in size of the canvas).

2.  It shows that incremental drawing could be used with vxnodes.

This code took a lot of work.  Issues involving the scrollbar resulted in a two-pass drawing algorithm.  The first pass populates the canvas.  The second pass sets the visible area properly after the scrollbar is set properly.

The visual appearance of scrolling appears identical, regardless of whether incremental allocation is used.  This is an important result.

To enable incremental allocation of Tk widgets during redraws, set self.allocateOnlyVisibleNodes = true in tree.__init__.

Pros:
	
- substantially reduces the number of Tk widgets that get allocated.

Cons:
	
- More complex code (it appears solid)
- A two-pass screen redrawing algorithm (it appears fast enough)
- Not all nodes become visible immediately when sliding the scrollbar.
	This is mostly likely because the actual redrawing of the screen happens at idle time.</t>
<t tx="ekr.20040403120534.408">The new code is simple, elegant, efficient, flexible.  A good day.</t>
<t tx="ekr.20040403120534.409">Here are the results from running checkClones2Links script on this file:

multipleTargetsInDerivedFiles: 8

(fixed) class nodeIndices      (improperly duplicated in leoAtFile.py)
(fixed) frame.OpenWithFileName (improperly duplicated in Recent Files submenu)
(fixed) recentButtonCallback   (improperly duplicated in Mark/Goto submenu)

-- Used several times in same derived file.  Will this be valid in LeoN?

&lt;&lt; Append any unused text to the parent's body text &gt;&gt; (used several times in leoImport.py)
&lt;&lt; Check both parts for @ comment conventions &gt;&gt; (used several times in leoTangle.py)
&lt;&lt; Compare single characters &gt;&gt; (used several times in leoTangle.py)
&lt;&lt; Set the default directory &gt;&gt; (used several times in leoAtFile.py)

-- Used (properly) in two different derived files:

replacePatterns (used on purpose in setup.py and postSetup.py)

clonedAtFileNodes: 9

@file ../plugins/add_directives.py
@file ../plugins/french_fm.py
@file ../plugins/open_with.py
@file ../plugins/vim.py
@file ../plugins/xemacs.py
@file c:\prog\test\multiple.txt
@file-nosent nosentCloneTest.txt
@silentfile ../doc/PKG-INFO.TXT
@silentfile ../doc/README.TXT
</t>
<t tx="ekr.20040403120534.410"></t>
<t tx="ekr.20040403120534.411"></t>
<t tx="ekr.20040403120534.412">This code is extremely dangerous at present.</t>
<t tx="ekr.20040403120534.413"></t>
<t tx="ekr.20040403120534.414"></t>
<t tx="ekr.20040403120534.415"></t>
<t tx="ekr.20040403120534.416"></t>
<t tx="ekr.20040403120534.417"></t>
<t tx="ekr.20040403120534.418">This completely eliminates namespace polution and also simplifies tree.select.</t>
<t tx="ekr.20040403120534.419">Nav plugin now warns if icons do not exist.

Leo now destroys the Recent Nodes dialog when user hit the close button at the top of the window.

Leo updates the Recent Nodes panel only if it is visible.</t>
<t tx="ekr.20040403120534.420"></t>
<t tx="ekr.20040403120534.421">Created new nav_buttons plugin.  This plugin adds 4 new buttons to the icon area at the top of each Leo window:

- Back and Forward arrows that work like a typical web browser.  Clicking the back arrow button takes you to the last node in the tree you visited.  Clicking the forward arrow button moves you forward.  The forward arrow button is dimmed unless you have clicked the back arrow button recently.

- The Recent button opens a non-modal dialog showing all the nodes you have visited recently.  This dialog is updated cleanly by the tree.select method.  You will see this entries change dynamically.  There are buttons in this dialog for clearing individual entries or clearing all entries.  Double-clicking any entry in this dialog takes you to that node, as does clicking the Go button.

The entries in the Recent Nodes pane do _not_ correspond to the order implied by the Forward and Back arrows.  Rather, the most recently visited node is on top, followed by the next most recently visited node, and so on, with the additional feature that nodes appear only once in the list.

- The Marks button opens a non-modal dialog showing all marked nodes in the tree.  Marking or unmarking nodes in the tree adds or deletes entries from this dialog.  Double-clicking any entry in this dialog takes you to that node, as does clicking the Go button.

I think the Marks dialog will be more useful for most people, for the following reasons:
1. You get to choose the nodes that appear in the dialog (using the Mark and Unmark commands)
2. The nodes appear in outline order.

In addition, hypertext links now enabled by default.  Control-click any section reference to go to its definition.  I changed the colorer so that it does _not_ underline active hyperlinks in section reference.  If a section reference is underlined, it means the definition does _not_ exist.  Otherwise the section reference _does_ exist and control-clicking the reference takes you to the defining node in one of its descendents.

Still to do: extending the color_markup plugin so that it underlines hypertext links in comments, """ python strings and doc parts.

It was great fun doing this project: plugins rule!  However, I am not really convinced that these dialogs are actually going to get used all that much.  For me, gathering nodes together using clones is by far the best way to make sense of a complex project.

Anyway, the code looks robust and fairly complete.  I have no plans for any more hacking, though all sorts of additions are fairly obvious, including more buttons in the Marks window. 

What I did:

leoColor.py

- Hypertext links now enabled by default.  Control-click any section reference to go to its definition.

- Leo no longer underlines active hypertext links. 

- To do: http hypertext links in color_markup plugin?

leoCommands.py

- Added c.beadList &amp; c.beadPointer to implement browser-style forward and back buttons.  Adding these ivars to the commands class is reasonable because the Forward &amp; Back commands are now official Leo commands.

The logic for the Forward &amp; Back commands is similar to the "bead" scheme used by undo.  However, it is completely separate.  In particular, these commands are careful to check that a node actually exists in the present tree before going to it!  And the Recent Nodes dialog removes nodes that do not presently exist using the v.exists method.

- Added optional updateBeadList param to c.selectVnode.  This adds flexibility to how the Forward &amp; Back commands work: I'm not sure that Leo uses this flexibility at present.

leoDialog.py

Added three new classes to support Recent nodes and Marks listboxes: class listBoxDialog and two derived classes:
	
- class recentSectionsDialog (listBoxDialog):
- class marksDialog (listBoxDialog):

leoFrame.py

- Initialized bead logic in frame.__init__.  This is a kludge.  Beads should be a separate class.

- Added support for existing graphics to addIconButton. (different names for keyword args).

- Added Go Back and Go Forward commands (and related logic) renaming the old commands to Go To Prev Node and Go To Next Node.

leoNodes.py

- Added exists method.  This method is used to check (quickly!) whether v is in c's tree.  We need this logic because undo may have altered nodes that appear on the bead list.

leoTree.py

- Added support for Forward &amp; Back commands to tree.select after select2 hook.

- Added select3 so that plugins can call their own code following this new code.</t>
<t tx="ekr.20040403120534.422">Apparaently the zfill string method was added in Python 2.2.2.</t>
<t tx="ekr.20040403120534.423"></t>
<t tx="ekr.20040403120534.424">@color

I am uneasy about the security implications of having Leo execute script x if it is passed a "script:x" parameter.  Perhaps I am being over-cautious.

Anyway, there is no need for this machinery.  To create reference file for unit testing call leoUnitTest.createReferenceFiles in the old copy of Leo.  This only needs to be done once.

@color

if 0: # Just run this from the reference copy of Leo.
	import leoUnitTest
	leoUnitTest.createReferenceFiles()

if 0: # Not needed.  It does work, though.

	from leoGlobals import *
	import os

	os.spawnl(os.P_NOWAIT,"c:/python22/python.exe",
		"-i c:/prog/leoCVS/leo/src/leo.py",
		"script:leoUnitTest,createReferenceFiles")</t>
<t tx="ekr.20040403120534.425"></t>
<t tx="ekr.20040403120534.426">Using an idle hooks completely simplifies the code, and it means that Leo never slows down to update the area.</t>
<t tx="ekr.20040403120534.427"></t>
<t tx="ekr.20040403120534.428"></t>
<t tx="ekr.20040403120534.429"></t>
<t tx="ekr.20040403120534.430">Removed the ancient kludge for forcing the height &amp; width of f.  The code in leoFileCommands.getGlobals now works!

The reason that Leo was opening small windows without the height &amp; width params is that getGlobals was telling it to do so!

Changed leoConfig.leo/.txt to use 75 and 200 for the initial height and width.</t>
<t tx="ekr.20040403120534.431"></t>
<t tx="ekr.20040403120534.432">I replaced all the ivars with a dict and several lists.  This is much more clean.  However, the same idea isn't so good for the commands class: using individual ivars is much simpler.  Similar remarks apply to the Prefs panel.</t>
<t tx="ekr.20040403120534.433">destroyIconFrame
createIconFrame
insertButtonInIconFrame</t>
<t tx="ekr.20040403120534.434">This affect the Write Missing @file Nodes command.</t>
<t tx="ekr.20040403120534.435"></t>
<t tx="ekr.20040403120534.436"></t>
<t tx="ekr.20040403120534.437"></t>
<t tx="ekr.20040403120534.438">The new code uses three passes in colorizeAnyLanguage!

Pass 0:  The normal code.

insertWiki picture sets colorer.redoColoring = true if it is ever called in pass 0.  This ensures that the following two passes will be called.  If the body contains no images, the new code is equivalent to the old.

Pass 1:  Insert graphics into the body text.

We do this in a separate pass to simplify the following kludge.

Pass 2:  Insert dummy characters and recolor the text.

Images take up a real index, yet the get routine does not return any character for them!  We insert dummy blanks in s at the positions corresponding to each image to keep everything in synch.  We then recolor the line normally.

This three-pass algorithm appears to be robust.  In particular, it handles the following special cases:

- The user can invalidate an image name, requiring a full redraw.

- The user can delete an image itself, leaving the markup unchanged.  The image will reappear the next time Leo does a full redraw.

- An image may appear twice in the body text.

- The user may edit any line not containing a graphic without invoking passes 1 and 2.</t>
<t tx="ekr.20040403120534.439">	- Fixed bug: continued """ weren't colored properly when @markup wiki not in effect!

</t>
<t tx="ekr.20040403120534.440">There is now only a single entry point into Leo: the run() routine.

This routine uses an optional fileName arg.</t>
<t tx="ekr.20040403120534.441">- This supports the @markup wiki directive.

- It can add arbitrarily many directives.</t>
<t tx="ekr.20040403120534.442">Not yet: user directives for leoAtFile.py or leoTangle.py.</t>
<t tx="ekr.20040403120534.443">Created "init-color-markup" hook for use of markup plugins.

This allows the colorizer to completely recolor a node when the @markup directive changes.</t>
<t tx="ekr.20040403120534.444">Continued """ weren't colored properly when @markup wiki not in effect!
</t>
<t tx="ekr.20040403120534.445"></t>
<t tx="ekr.20040403120534.446">1.  Leo now scans all .py files in the plugins folder when looking for plugins.

Filenames need not start with mod_, and Leo scans only the plugins folder.

2. Replaced detailed loading message with a summary of the number of files loaded &amp; examined.

3. Added importFromPath in leoGlobals.py.

This encapsulates a lot of details, and makes it unnecessary to alter sys.path.

</t>
<t tx="ekr.20040403120534.447">1.  Changed handleLeoHook to doHook.

2. Changed most instances of:

  if doHook(...) == None:

to:

	if not doHook(...)

This works provided that doHook does not return a "significant" value.</t>
<t tx="ekr.20040403120534.448">- Converted wiki code to a plugin.  No need for config settings!

- Added code to parse wiki stuff in doc parts and comments.</t>
<t tx="ekr.20040403120534.449">Added the following stub hooks for customizing the outline pane:

	drawBox   doHook("draw-outine-box",tree=self,v=v,x=x,y=y)
	drawIcon  doHook("draw-outline-icon",tree=self,v=v,x=x,y=y)
	drawNode  doHook("draw-outline-node",tree=self,v=v,x=x,y=y)
	drawText  doHook("draw-outline-text-box",tree=self,v=v,x=x,y=y)
	drawTree  doHook("draw-sub-outline",tree=self,v=v,x=x,y=y,h=h,level=level)
	redraw    doHook("redraw-entire-outline",c=self.commands)

Conceivably it would be better for a plugin just to replace these routines.</t>
<t tx="ekr.20040403120534.450">I have found this command to be highly annoying and unwanted.</t>
<t tx="ekr.20040403120534.451"></t>
<t tx="ekr.20040403120534.452"></t>
<t tx="ekr.20040403120534.453">- Load plugins and execute hooks in alphabetical order.

- Created "new" hook.  Somewhat useful.

Created "create-optional-menus" hook: extremely useful.  The first stub hook.</t>
<t tx="ekr.20040403120534.454"></t>
<t tx="ekr.20040403120534.455">

Early this morning I uploaded the new 4.0 code base to cvs.  This is an important milestone in Leo's history.  I urge anyone using code on cvs to at least skim through this long posting.

1.  Code on cvs is safe and stable

AT PRESENT, the code on cvs reads and writes 3.x files just as before.   The code appears stable, which is not surprising because the new code is based on the old.  Very few changes were needed to handle the new file formats.  These changes are enabled when app().use_gnx is true. app().use_gnx is false on cvs now.

I think the present cvs code is safe and stable.  However, I _strongly_ recommend that you assume otherwise:  Please make backups of any files or folders affected by the new cvs code.

Most of the work required to read and write 4.x .leo and derived files is complete; there are only a few days work left before the transition to 4.x formats.  I do NOT recommend that you enable the new code; some file format changes are in store.  You will be warned when the transition to the new file formats happens on cvs.  This will be another major event: all sentinels will change.

2.  Code bases have merged

The code on cvs merges the 3.x and 4.x code bases.  In retrospect, I regret splitting the development.  It really didn't help.  In any event, there will be no more splits in development.

With the merged code base, one can easily imaging releasing both 3.x versions and 4.0 beta versions in parallel.  Indeed, the only difference between the two versions would be the setting of app().use_gnx.  Also note that even in the 4.0 final version you will be able to write 3.x files.  Just set use_pre_4pt0_file_formats = 1 in leoConfig.txt.

The latest cvs code assumes that leo folders contain the config, doc,  plugins, scripts and src subfolders.  The new version of the installer script, leo.nsi, found in LeoPy.leo, creates these folders.  See the diary entry for 5/12 in LeoPy.leo for a list of the changes made to support the new directory structure.

3.  Improved code base &amp; new invariant

I took the opportunity afforded by 4.0 to clean up the old code base in several important ways.  First, the new code uses proper Python lists to represent join lists.  This greatly clarifies the relevant sections of code, and may even provide a performance boost.  Secondly, tnodes now contain both headline and body text.   This change creates an important invariant:  vnodes with the same vnx's always point to tnodes with the same tnx's.  This invariant is vital to resolving conflicts properly.

4.  Prototype of graphics &amp; styled text

leoColor.py contains a prototype of code that allows wiki-style markup in body panes.  This is important work, because it tests Tk's abilities to handle styling and graphics in the highly dynamic environment that is Leo's body pane.  Some details:

- There are a few bugs left to fix, and it is clear that this prototype is a great success.  The combination of Python and Tk are easily up to the job.  The programming details are interesting, and not interesting enough to discuss here :-)  Look at the topic called (Graphics &amp; Styled Text: Wiki format) in LeoPy.leo if you are curious.

- The code that handles the wiki formatting is disabled at present on cvs.  To enable it, just change if 1: to if 0: in doWikiText.  It is quite safe to do so: the syntax colorer catches all exceptions.  The worst that can happen is that some of your text won't be colored properly.

- The present code only handles wiki markup in Python triple-quoted strings denoted by three double quotes.  Because wiki markup uses single quotes, it does not seem prudent to allow wiki formatting in ''' strings.  Still to do: allow wiki markup in doc parts and comments.  This will be easy enough.

- doWikiText at present only handles the following markup:

    __bold__,
    ''italics'' (two single quotes, not a single double quote!)
   {picture file=&lt;filename&gt;}
   ~~&lt;color specifier&gt;~~ 

To repeat: using wiki markup to denote styling and graphics is merely a prototyping expedient.  I'm not sure how to represent such information.  The great advantage of a text-based specification is that it doesn't change the rest of Leo _at all_.  In particular, I had a nice aha: we can use the Show Invisibles command to show or hide the wiki text.  When invisibles are hidden, all you see are the _effects_ of the wiki markup.  When invisibles are visible, you see the markup plus their effects.  No need for extra commands.

- rst is another alternative to wiki format.  I'll soon start another thread to discuss the pros &amp; cons.  Please don't vote here.

- Instead of the present hand-written parser, Leo should use an "official" parser for whatever markup is chosen.  However, this can wait.

5. To do

There are significant additional work to do before 4.0 final.  After 4.0 alpha 1 comes out (maybe in a week?), I plan to rewrite the code that reads .leo files.  The new code will use an xml parser (probably sax) to read .leo files rather than the present hand-written mess.  I have fairly high hopes that sax will significantly speed up the reading of .leo files themselves.  Note, however, that such tools can _not_ be used to read derived files because derived files are not xml files.

Edward</t>
<t tx="ekr.20040403120534.456">This required folder-by-folder copies, so it was potentially error prone.</t>
<t tx="ekr.20040403120534.457"></t>
<t tx="ekr.20040403120534.458">This cleans up the list of files being read.</t>
<t tx="ekr.20040403120534.459">These don't change often enough to warrant reading every time.</t>
<t tx="ekr.20040403120534.460"></t>
<t tx="ekr.20040403120534.461">1. Created config, doc, examples, plugins, scripts, src, test &amp; tools folders.  This really clarifies matters.

2. Removed the following files:

- nsi.leo file.  This was a duplicate of code in LeoPy.leo.  
- The following unused .bat files: bdist.bat, go.bat, help.bat, sdist.bat.
- The two resource files: leo.rc and leo.res.  These are for Delphi!

3. These changes required changes to:

- Actual code.  The following commands were affected:
	- The About Leo dialog (path to icon in dialog).
	- Tree drawing code (path to icons)
	- Open LeoDocs.leo and Open leoConfig.leo commands in help dialog.
	- Initialization in leoConfig.py.

Note: Tangle/Untangle will find tangle_done.py and untangle_done.py provided that the scripts folder is in sys.path.

- The leo.nsi script that creates leoinstall.exe.  This required considerable amount of work.

- Paths specified in @file nodes.

- All files in cvs.  The attic contains all the old files.  cvs contains new 1.1 versions of all code.  This is most unfortunate.  However, the cvs code started out with the 3.11.1 code base, so 4.0 changes will be visible.
</t>
<t tx="ekr.20040403120534.462">Sometimes the reading: @file messages were not showing up during Open commands. Perhaps the are differences in the events that caused app().log to be set to None, or to be set before the Tk text widget was initialized.  Could problems with configuration show up like this?  Or maybe it was just a weird Windoze bug...

Added code to force setting of app().log in OpenWithFileName.

If this bug shows itself again I'll add print code to show the following:

- The frame associated with app().log.
- The events that set app().log to something _other than_ None.</t>
<t tx="ekr.20040403120534.463"></t>
<t tx="ekr.20040403120534.464">Saving LeoPy.leo generated 46740 calls to v.threadNext!

It looks like optimizing threadNext would be useful.
There seems to be no need to optimize threadBack.</t>
<t tx="ekr.20040403120534.465"></t>
<t tx="ekr.20040403120534.466"></t>
<t tx="ekr.20040403120534.467">What I did:

- Replaced mFirstChild with mChildren.
- Partially replaced mBack and mNext fields.
- Assumed the existence of c.frame.dummyChildren array.

I abaondoned this code for the following reasons:

- The new code might be slower than the old code!

- mBack, mNext and mFirstChild will take less space than mChildren.

- Precomputing threadNext() and maybe threadBack() may be _much_ faster.</t>
<t tx="ekr.20040403120534.468"></t>
<t tx="ekr.20040403120534.469">In 4.0 we must have a single, global (per-outline) tnodesDict so that all joined vnodes in fact use the same tnode.

This dict must never be reinitialized!

*** N.B.: we create the sharing of the common tnode first, then create the join link later, at the end of getLeo2 or other top-level read routines.

</t>
<t tx="ekr.20040403120534.470">This actually may have found one broken clone.  It certainly did find a copy of code.</t>
<t tx="ekr.20040403120534.471">nodeAfterTree was being called too often.

Used same logic to delete tree after read errors that was used to delete tree when using gnx.  The old code called doDelete, and that was the cause of huge delays when there were read errors.

Removed the &lt;&lt; Handle all status bits &gt;&gt; logic from atFile.read.  There is no need for this!  The fileCommands logic sets the current node logic.</t>
<t tx="ekr.20040403120534.472">Eliminated awkward dummy nodes.</t>
<t tx="ekr.20040403120534.473"></t>
<t tx="ekr.20040403120534.474"></t>
<t tx="ekr.20040403120534.475"></t>
<t tx="ekr.20040403120534.476">What I did:

- Created fileCommands.setAllJoinLinks to create or update all join links.

- The fileCommands.getLeoFile and fileCommands.readAtFileNodes now contain:

self.setAllJoinLinks(c.rootVnode())
c.initAllCloneBits()

** Removed the code equivalent to setAllJoinLinks from atFile.read.

** Removed the code that scans the entire vnode tree for the current &amp; top attributes.
	The code _must_ set these without rescanning an entire derived file!

- Added atFileNodesFlag=true param to getLeoFile.

- Added partialFlag=false param to atFile.readAll.</t>
<t tx="ekr.20040403120534.477">More checks would be good.</t>
<t tx="ekr.20040403120534.478">This was easy to do because most code uses the v.headString() getter.
</t>
<t tx="ekr.20040403120534.479">The first version didn't work, and caused clones not to work!

This could have caused a major mess with Leo.py, but I reverted to a previous copy and I believe no clone links have been damaged.</t>
<t tx="ekr.20040403120534.480"></t>
<t tx="ekr.20040403120534.481">I'm not sure how an empty filename got passed to this routine, and it did happen.</t>
<t tx="ekr.20040403120534.482">See the (Rewriting joinList code) project for full details.

Examining the code revealed that the undoReplace code does not work.  This is a long-standing bug!

</t>
<t tx="ekr.20040403120534.483"></t>
<t tx="ekr.20040403120534.484">Leo was using the defaultID when creating new gnx's.  We must always use app().userID when creating new gnx's!

- Added userID ivar to node indices class.
- Removed the id arg to getNewIndex.</t>
<t tx="ekr.20040403120534.485">We do this to discourage users from messing with such lines.

Leo writes bogus @space "sentinels" following @+v and @+t sentinels, and readLinesToNextSentinel looks for such lines while scanning without calling sentinelKind.

Perhaps readLinesToNextSentinel should be called readLinesToNextRealSentinel ;-)</t>
<t tx="ekr.20040403120534.486"></t>
<t tx="ekr.20040403120534.487"></t>
<t tx="ekr.20040403120534.488">What I did:

- created nodeIndices.setTimestamp() routine.

This sets the new timeString ivar.  This saves a large number of calls to time.strftime.
All write routines should call setTimestamp once.

- created assignAllGnx method.  The compact/AssignFileIndices methods call this if use_gnx is true.

This ensures that all fileCommands write code assigns gnx's.

Also, Leo doesn't needlessly compute file indices when use_gnx is true.

- Assert's will fail in the fileCommands write code if we try to write a node without a gnx.

- The atFile.write code allocates t.gnx if needed.

This may be needed for the Write @file Nodes command.</t>
<t tx="ekr.20040403120534.489"></t>
<t tx="ekr.20040403120534.490"></t>
<t tx="ekr.20040403120534.491">I left in the commented out code that reads these fields, just in case we come across old .leo files with them in.  This code should be removed completely soon.

What I did:

For reading/writing .leo files:

- Removed gnx arg from createChild.
- Removed the code that allocates v.gnx.
- Removed the code that reads and writes the vnx= field.
- Removed v.getGnx

For reading/writing derived files:

- Removed the code that reads the gnx field in @+v sentinel lines.
- Called putSentinel instead of putSentinelAndGnx when writing vnodes in derived files.</t>
<t tx="ekr.20040403120534.492">This should minimize any pain on Linux systems.</t>
<t tx="ekr.20040403120534.493">I want to make sure that the proper read code is executed when reading _old_ .leo files when a.use_gnx is true.

I checked to make sure that node indices are resolved properly in all cases.  They are because self.tnodesDict is used regardless of a.use_gnx.

I also did a search on .use_gnx and in all cases the code will handle old .leo files even when use_gnx is true.</t>
<t tx="ekr.20040403120534.494">This makes the code clearer and cleaner.  I wrote getT before knowing about dict.get.</t>
<t tx="ekr.20040403120534.495"></t>
<t tx="ekr.20040403120534.496">This is far simpler than trying to figure out whether to allocate them beforehand.

Added code to do this when writing both .leo files and derived files.
</t>
<t tx="ekr.20040403120534.497"></t>
<t tx="ekr.20040403120534.498">The read code handles both txn and t attributes for compatibility wity old files.</t>
<t tx="ekr.20040403120534.499">We want to be specific because v elements will have both vnx and tnx fields.  The tnx field is about to replace the old tx field.</t>
<t tx="ekr.20040403120534.500">It sets app().use_gnx = false.</t>
<t tx="ekr.20040403120534.501"></t>
<t tx="ekr.20040403120534.502">This was a vain attempt to speed up the code.  Apparently the problem is elsewhere.  However, the new code is much simpler, so I'll stay with it.</t>
<t tx="ekr.20040403120534.503">This substantially reduces the size and clutter of .leo files.</t>
<t tx="ekr.20040403120534.504"></t>
<t tx="ekr.20040403120534.505"></t>
<t tx="ekr.20040403120534.506"></t>
<t tx="ekr.20040403120534.507"></t>
<t tx="ekr.20040403120534.508">This should be false if you plan to upload changes to Leo's cvs site.</t>
<t tx="ekr.20040403120534.509">This command is needed, I think, so that people can continue to use older versions of Leo.</t>
<t tx="ekr.20040403120534.510"></t>
<t tx="ekr.20040403120534.511"></t>
<t tx="ekr.20040403120534.512">This is required to be able to recognize shared nodes.
</t>
<t tx="ekr.20040403120534.513">The nodes are created by default, and we must be very careful to share tnodes properly.

The present code probably does this, but we must be ever vigilant.</t>
<t tx="ekr.20040403120534.514"></t>
<t tx="ekr.20040403120534.515"></t>
<t tx="ekr.20040403120534.516">List comprehensions are present in Python 2.0 or above.</t>
<t tx="ekr.20040403120534.517"></t>
<t tx="ekr.20040403120534.518"></t>
<t tx="ekr.20040403120534.519"></t>
<t tx="ekr.20040403120534.520">Fixed bug in handleLinesFollowingSentinel:
c:\prog\LeoCVS\leo\leoAtFile.py:482: No global (i) found
Removed i arg from rfind.

Fixed bug in definition of BadLeoFile:
c:\prog\LeoCVS\leo\leoFileCommands.py:27: Base class (exceptions.Exception) __init__() not called
Added call to Exception.__init__(self,message)

Fixed bug in askYesNoCancel
c:\prog\LeoCVS\leo\leoDialog.py:283: Variable (no) used before being set.
Disabled defaultButton logic.  New code would have to be thoroughly tested.

Removing unused routine: setDefaultLoc.
c:\prog\LeoCVS\leo\leoNodes.py:2581: No class attribute (defaultLoc) found

Fixed bug in put: changed a to app()
c:\prog\leoCvs\leo\leoFrame.py:4973: No global (a) found
</t>
<t tx="ekr.20040403120534.521"></t>
<t tx="ekr.20040403120534.522">@nocolor

I have just uploaded code to cvs that supports a new @lineending directive.  This directive allows you to specify the line endings for individual derived files.  This directive will override the output_newline setting in leoConfig.txt.  Note that @lineending _never_ affects the line endings in .leo files themselves:  we must have consistent line endings in .leo files!  See below for more details.

More importantly, I have "cleaned up" the code in the vital tangle.scanAllDirectives, atFile.scanAllDirectives and the scanDirectives global function by factoring out code to global helper functions.  Normally this should have been done at the start of a release cycle, not at the end, but I got carried away :-)

So please test this new code by writing all your files with the Write @file Nodes command and the Tangle all command.

I'll delay 3.11 final just a little longer to make sure I haven't done something really stupid, though I have reviewed the cvs change logs carefully (and found a few minor mistakes in the process).  I promise this will be the last changes to 3.11 (except for bug fixes) before 3.11 final finally goes out the door.

Anyway, the valid forms of the new @lineending directive are:

@lineending nl         (the default, Linux)
@lineending cr         (Mac)
@lineending crlf       (Windows)
@lineending lf          (same as nl, not recommended)
@lineending platform (same as platform value for output_newline setting in leoConfig.txt)

Edward</t>
<t tx="ekr.20040403120534.523">These utilities simplify and regularize scanning for the @encoding, @lineending, @pagewidth and @tabwidth directives for atFile.scanAllDirectives, tangle.scanAllDirectives and scanDirectives.

This is a partial solution for the problem of duplicated code in these routines.</t>
<t tx="ekr.20040403120534.524">skip_long was throwing an exception if there were no valid digits following a + or - sign.</t>
<t tx="ekr.20040403120534.525">- Enabled ok button only if 4 or more characters.
- Message now says that 4 or more characters are required.</t>
<t tx="ekr.20040403120534.526">Browsing the comp.lang.python yesturday I found that there are serious problems with Python's getdefaultlocale() routine.  Martin v. Löwis says "getdefaultlocale() is broken, and cannot be fixed", though he does suggest the following workaround:

leoGlobals.py uses locale.getpreferredencoding to define getpreferredencoding if locale.getpreferredencoding exists (it is new in Python 2.3alpha).  Otherwise, Leo uses the code copied from the 2.3a2 version of Python to define getpreferredencoding.  Either way, leoGlobals.py now defines getpreferredencoding and Leo uses getpreferredencoding rather than getdefaultlocale.</t>
<t tx="ekr.20040403120534.527">This adds http:\\ to url's if needed.</t>
<t tx="ekr.20040403120534.528">I had completely misunderstood __del__ methods!  __del__ methods _disable_ the gc's ability to collect circular garbage (!!) and so __del__ methods will _never_ be called (!!)

BTW, when deleting an entire Leo window Leo calls various destroy methods to unlink items.  This allows the garbage collector to collect all data structures.  Because of unlimited undo only these destroy methods have the potential for creating "real" garbage.</t>
<t tx="ekr.20040403120534.529"></t>
<t tx="ekr.20040403120534.530"></t>
<t tx="ekr.20040403120534.531"></t>
<t tx="ekr.20040403120534.532">- tangle.scanAllDirectives was not setting self.encoding when handling @encoding.
- tangle.scanAllDirectives wasn't scanning the @encoding line properly.
- fixed crashers in Tangle and Untangle logic.</t>
<t tx="ekr.20040403120534.533">After opening the Python window the call to tkFont() threw a (caught) exception on every call to frame.setTabWidth.  The fix was to add the optional root param.</t>
<t tx="ekr.20040403120534.534"></t>
<t tx="ekr.20040403120534.535">This makes the output look much better.  Only time will tell whether cvs likes this way...</t>
<t tx="ekr.20040403120534.536">- Added comments param to handleLinesFollowingSentinel.

- Hacked readLinesToNextSentinel so it accepts the first line even if it looks like a sentinel.
  This won't handle all cvs conflicts perfectly, but perfection isn't possible anyway...</t>
<t tx="ekr.20040403120534.537">- wrote readLinesToNextSentinel and handleLinesFollowingSentinel.
- added optional nextLine param to scanText to handle look-ahead.</t>
<t tx="ekr.20040403120534.538">I spent several days on a false start. My first try was to create a new version
of scanText called scanGnxText. This dispatched routines to handle 4.x
sentinels. There were several big problems with this approach:

- Much of scanGnxText was identical to scanText.

- Using separate routines to do the work meant that ivars had to be used for
communication between the routines rather than the local vars.

- Instead of using recursion to handle nested sentinels, scanGnxText had to
manage explicit stacks. This was so ugly...

This morning I threw in the towel. Rather than do all this extra work in the
name of "elegance" I simply added a few new cases to the old scanText. The
result is that all the old code works exactly as before, and the new code gets
to use the old tested code.

While I was at it, I made the following changes:

- Renumbered the constants in leoAtFile. Some of these numbers were duplicates,
which might have caused problems, though apparently it did not.

- Removed the "implicit child index" logic from scanText. This was never used.

BTW, the write logic always used the old logic as a starting point. The present
4.0 write code was up and running in a couple of hours.

Other notes:

- Setting app().use_gnx to true enables two commands in the Read/Write menu
that test the new code. I don't recommend doing this: there are plenty of
problems yet... app().use_gnx will be false for all 3.x releases.

- The present code uses id(v) as a dummy global node index (gnx). This will be
changed very soon.

- Still to do: the code in leoFileCommands to read and write "mark" elements.
This isn't essential, and without this no marks will be remembered in derived
files. I must also handle the process of telling Leo the user's cvs id. This
will probably involve reading leoId.txt.</t>
<t tx="ekr.20040403120534.539"></t>
<t tx="ekr.20040403120534.540">I had forgotten to compile leo.nsi.</t>
<t tx="ekr.20040403120534.541">The children of this node are a test of this.</t>
<t tx="ekr.20040403120534.542"></t>
<t tx="ekr.20040403120534.543"></t>
<t tx="ekr.20040403120534.544"></t>
<t tx="ekr.20040403120534.545"></t>
<t tx="ekr.20040403120534.546"></t>
<t tx="ekr.20040403120534.547"></t>
<t tx="ekr.20040403120534.548"></t>
<t tx="ekr.20040403120534.549"></t>
<t tx="ekr.20040403120534.550"></t>
<t tx="ekr.20040403120534.551"></t>
<t tx="ekr.20040403120534.552"></t>
<t tx="ekr.20040403120534.553"></t>
<t tx="ekr.20040403120534.554"></t>
<t tx="ekr.20040403120534.555"></t>
<t tx="ekr.20040403120534.556"></t>
<t tx="ekr.20040403120534.557"></t>
<t tx="ekr.20040403120534.558"></t>
<t tx="ekr.20040403120534.559"></t>
<t tx="ekr.20040403120534.560">Changed redraw_now to force_redraw in tree select routines.</t>
<t tx="ekr.20040403120534.561"></t>
<t tx="ekr.20040403120534.562"></t>
<t tx="ekr.20040403120534.563">This allows time to be expressed as local time or gmttime.</t>
<t tx="ekr.20040403120534.564"></t>
<t tx="ekr.20040403120534.565"></t>
<t tx="ekr.20040403120534.566"></t>
<t tx="ekr.20040403120534.567"></t>
<t tx="ekr.20040403120534.568"></t>
<t tx="ekr.20040403120534.569">These were long-standing bugs.</t>
<t tx="ekr.20040403120534.570"></t>
<t tx="ekr.20040403120534.571"></t>
<t tx="ekr.20040403120534.572">This makes the file name easier to see in the Windows task bar.
</t>
<t tx="ekr.20040403120534.573">This fixes several bugs.</t>
<t tx="ekr.20040403120534.574"></t>
<t tx="ekr.20040403120534.575">Every call to v.unjoinNode was calling c.clearAllVistied.

Fixing this bug will allow me not to use inodes &amp; locations for the foreseeable future.</t>
<t tx="ekr.20040403120534.576"></t>
<t tx="ekr.20040403120534.577"></t>
<t tx="ekr.20040403120534.578"></t>
<t tx="ekr.20040403120534.579"></t>
<t tx="ekr.20040403120534.580">scanColorDirectives now returns self.language.</t>
<t tx="ekr.20040403120534.581"></t>
<t tx="ekr.20040403120534.582"></t>
<t tx="ekr.20040403120534.583"></t>
<t tx="ekr.20040403120534.584"></t>
<t tx="ekr.20040403120534.585">@nocolor

1. Put customizeLeo.py on cvs.  I don't particularly see why this file should be much more dangerous than any other file.

2. Remove the @ignore directive from the ancestor of @file customizeLeo.py.

3. Remove the warning when customizeLeo.py is written.  However, I shall _insert_ a lock that prevents customizeLeo.py from being written unless use_customize_leo_dot_py = 1 in leoConfig.txt.

Leo will write a message to the log if customizeLeo.py is dirty but was not written because of the setting in leoConfig.txt.
</t>
<t tx="ekr.20040403120534.586"></t>
<t tx="ekr.20040403120534.587"></t>
<t tx="ekr.20040403120534.588">Simplified and regularized hooks:

- replaced "event1" and "event2" hooks with 'regular' hooks.
	* Much easier to understand.
- added "iconrclick" hooks.
- added "bodyrclick" hooks.
- added "dragging" hooks.
	* These are called when drag hook called while already dragging.
- added "hyperenter" and "hyperleave" hooks.
	* These only fire if use_hyperlinks = 1 in leoConfig.txt.
- removed "activate" and "deactivate" hooks.
	* These were not reliable.
- almost all hooks have c,v arguments now.
- "command" hooks now return "undo" and "redo" rather than "cantundo" and "cantredo"

Improved code:

- improved the tracing of hooks in customizeLeo.py.
- the tracing code also checks to make sure that most hooks have c,v keywords.
- created es_event_exception().
- put all event handlers in try/except blocks that call es_event_exception on errors.</t>
<t tx="ekr.20040403120534.589">The fix was to set the hand cursor in </t>
<t tx="ekr.20040403120534.590">v.OnEndDrag can be called even though tree.dragging is false.  </t>
<t tx="ekr.20040403120534.591"></t>
<t tx="ekr.20040403120534.592">replaced c.contractVnode by v.contract.
replaced c.expandVnode by v.expand.

This was mostly done earlier, but wasn't done completely.  Not doing so completely caused exceptions in the promote, demote and import commands.</t>
<t tx="ekr.20040403120534.593"></t>
<t tx="ekr.20040403120534.594">added raw=1 to all calls to config.get in leoConfig.py.</t>
<t tx="ekr.20040403120534.595"></t>
<t tx="ekr.20040403120534.596"></t>
<t tx="ekr.20040403120534.597"></t>
<t tx="ekr.20040403120534.598"></t>
<t tx="ekr.20040403120534.599">This can be useful when clones are in the range of different @path directives.</t>
<t tx="ekr.20040403120534.600">Dirty bits are kept in tnodes, so setting/clearing a dirty bit in a node v does the same in all nodes joined to v.

Also, made setDirtyDeleted equivalent to setDirty, which means that setAncestorsOfClonedNodesInTreeDirty is no longer used.  This is a bizarre routine:  I have no idea why it should be needed.</t>
<t tx="ekr.20040403120534.601"></t>
<t tx="ekr.20040403120534.602"></t>
<t tx="ekr.20040403120534.603">Previously saving a new file did not result update the Recent Files menu.

Created frame.updateRecentFiles routine and called it from openWithFileName and all Save routines.</t>
<t tx="ekr.20040403120534.604">In the preferences dialog the close button is now equivalent to the Cancel button.

While I was at it, I eliminated OnClosePrefsFrame.  The OnCancel routine works just fine.
</t>
<t tx="ekr.20040403120534.605">There was a typo in the documentation of chapter 8, "About hooks". In the hook table the "when called" column of "headkey1" and "headkey2" says "before/after *body* keystrokes", instead of "headline keystrokes".

Fixed in LeoPy.leo, LeoDocs.leo and on the web site.</t>
<t tx="ekr.20040403120534.606">These were easy to do and they may be of real help to some people in some situations.</t>
<t tx="ekr.20040403120534.607">I have just uploaded a major improvement to Leo's expand/contract routines.
This came about as the result of a request by Travers A. Hough.

His comment was that it would be better to have the Expand To Level n commands
work only on the presently selected outline: "Having Expand" commands that work
only on a suboutline...would most likely be what the programmer really wanted."
Indeed, this is correct. I'm not sure why I didn't see this earlier.

As I played with the expand/contract commands it gradually became apparent that
the new way of doing things makes a number of existing or requested commands
obsolete:

1. I redefined Expand To Level 1 to mean contract the presently selected
outline. So there is no need for a Contract Present Node command (!)

2. Expand To Level 2 now does what the requested Expand Present Node command
would have done. Moreover, this command eliminates the need for the old
Contract Subheads command!

3. Expand to Level 3 now does what the old Expand Subheads command did!

4. With all these commands now gone (without sacrificing anything!) it became
possible to consolidate the Expand and Contract submenus into a single
Expand/Contract submenu. This is a pretty big win, in fact, because it shows in
one place all the shortcuts that cause expansion and contraction.

As requested, I changed the Contract All command to select the topmost ancestor
of the presently selected node if that node becomes invisible as the result of
the contraction. This eliminates what was in fact quite irritating behavior.

It is truly unusual that a feature request should spark both wholesale
simplifications and an increase in power, and that is what has happened. In
this area, I think, as perhaps in no other, Leo's way of handling outlines is
now clearly superior to how the great MORE outliner worked.</t>
<t tx="ekr.20040403120534.608"></t>
<t tx="ekr.20040403120534.609"></t>
<t tx="ekr.20040403120534.610"></t>
<t tx="ekr.20040403120534.611"></t>
<t tx="ekr.20040403120534.612">In other words, the Pressing the Enter key in the Find panel executes the Find Next command.
</t>
<t tx="ekr.20040403120534.613"></t>
<t tx="ekr.20040403120534.614"></t>
<t tx="ekr.20040403120534.615">These are just conveniences, so the user doesn't have to check for save, saveas and saveto command hooks.</t>
<t tx="ekr.20040403120534.616"></t>
<t tx="ekr.20040403120534.617"></t>
<t tx="ekr.20040403120534.618"></t>
<t tx="ekr.20040403120534.619"></t>
<t tx="ekr.20040403120534.620">In the unusual case that a language has no single-line comment delimiter, Leo will remove the block delimiters from the headline text in node sentinels.  createNthChild must take this into account by doing a second comparison of headlines if the normal comparison fails.  If the second comparison of headlines succeeds we assume that we should use the headline from the outline instead of the derived file.  I believe some kind of kludge like this will also be required for 4.0.

This is kludgy, and I don't know what else to do.</t>
<t tx="ekr.20040403120534.621">@nocolor

Read and respond to this message at: 
https://sourceforge.net/forum/message.php?msg_id=1806338
By: stwerff
Open Discussion 12/23/02

There seems to be a problem to find the correct vnode when there is a double
comment given:

vnode not found in outline: exp_definitions*)

The finish comment seems to interfere with the @+node:

(*@+node:1::exp_definitions*)

Jurjen

</t>
<t tx="ekr.20040403120534.622">@nocolor

I see. This is an interesting hole. This problem only arises with languages such as html that have
paired comment delims _and_ that have no single-line comment delimiter. 

The only solution seems to me to remove either just the closing comment delim or both comment
delims from the headline text of +-node sentinels. Do you agree? I'll make the change today.
</t>
<t tx="ekr.20040403120534.623"></t>
<t tx="ekr.20040403120534.624">leoFileCommands.put was recently changed, and the following code was accidentally omitted:

	elif self.outputString != None: # Write to a string
		self.outputString += s</t>
<t tx="ekr.20040403120534.625">Re-enabled the following code in
&lt;&lt; set path to the full pathname of a temp file using ext &gt;&gt;

a.openWithFileNum += 1</t>
<t tx="ekr.20040403120534.626">This allows Leo to be used with a black background.</t>
<t tx="ekr.20040403120534.627">changed s.self to s,self in tangle.os.</t>
<t tx="ekr.20040403120534.628">The error reporting code is still highly experimental.  In particular, encoding errors in headlines may generate many redundant messages as sentinel lines are written.

Here is what I did:

Phase I: get body text working with utf-8.
	done: accept @+leo,encoding=&lt;the_encoding&gt; when reading derived files.
	done: always use &lt;?xml version="1.0" encoding="UTF-8"&gt;
	done: Read and write .leo files using utf-8 encoding. (It's always been this way).
	done: convert body text to unicode when reading .leo files.
	done: ensure unicode in body key handler.

Phase II: get find/change working with utf-8.
	done:  don't call repr on unicode strings in es().
	done: convert from utf-8 to unicode when reading find/change params in leoConfig.txt
	done: encode unicode to utf-8 before writing find/change params in leoConfig.txt.

Phase III: support @encode.  Test with iso-8859-1 and utf-8 encodings.
	done: Colorize @encoding.
	done: Recognize @encoding in various scanDirectives routines.
	done: Add self.encoding ivars to atFile and Tangle classes.
	done: Write -encoding=x. in @+leo header
	done: Write derived files using atFile.self.encoding
	done: Use unicode for all headline text.
	done: Read derived files using atFile.self.encoding.
	done: Add leo_file_encoding to leoFileCommands class.
	done: Initialize leo_file_encoding when reading .leo file
	done: Use leo_file_encoding when reading tnode and vnode text.
	done: Use leo_file_encoding when writing tnode and vnode text.
	done: Create config.new_leo_file_encoding.
	done: Create config.default_derived_file_encoding.
	done: Use default_derived_file_encoding when writing derived files.
	done: Use new_leo_file_encoding when creating new .leo files.

Phase IV: Use unicode everywhere
	done: @encoding on import/export
	done: @encoding on tangle/untangle

Phase V: cleanup
	done: replace fnW by fn.  replace pathW by path.
	done: assert unicode type when writing derived files.
	done: remove unused unicode utilities
	done: remove or replace all instances of xml_version_string.
	done: create toUnicode and toString utils.
	done: change test+unicode to toUnicode
	done: change test+encode to toString
	done: create isValidEncoding
	- better error reporting</t>
<t tx="ekr.20040403120534.629">I don't believe there is a great need for other encodings in leoConfig.txt and I don't plan to support anything but utf-8 encoding in leoConfig.txt.</t>
<t tx="ekr.20040403120534.630"></t>
<t tx="ekr.20040403120534.631"></t>
<t tx="ekr.20040403120534.632">The fix was to set true = 1 ; false = 0 in leoGlobals.py.</t>
<t tx="ekr.20040403120534.633"></t>
<t tx="ekr.20040403120534.634">This corrects a hang in the Open With command.
</t>
<t tx="ekr.20040403120534.635"></t>
<t tx="ekr.20040403120534.636"></t>
<t tx="ekr.20040403120534.637"></t>
<t tx="ekr.20040403120534.638">@ Please add "event=event" to the parameter list when calling handleLeoHook() from event handlers. 

I'm trying to add a menu item to the popup menu and am trying to use "event1"
for "headPopup" to do so.

I need to replace the OnPopup method with my custom method.  But I find that
I need the event object in order to do so.  However, the calls to handleLeoHook
(in event handler methods) do not pass the event object.

It seems like a good idea to pass the event as one of the keywords for event1
and event2.</t>
<t tx="ekr.20040403120534.639"></t>
<t tx="ekr.20040403120534.640"></t>
<t tx="ekr.20040403120534.641">It's actually working, but it's work is being undone by a previous binding.</t>
<t tx="ekr.20040403120534.642"></t>
<t tx="ekr.20040403120534.643">This was done in c2py.py, leoAtFile.py and leoColor.py.

I actually think this was foolish to do, regardless of how much "cleaner" the code looks.  The problem is that it is not at all easy to test.  I think this kind of thing should wait until has a full regression testing suite.</t>
<t tx="ekr.20040403120534.644">What I did:

- es, trace &amp; trace_tag take a variable number of args.
- es, trace &amp; trace_tag convert to string using repr as needed.
- move init_sherlock to leoGlobals where it belongs.
- init_sherlock now takes an echo param.
- only trace_tag takes a "tracepoint" arg.</t>
<t tx="ekr.20040403120534.645">redoMenuLabel and undoMenuLabel must be initialized in the ctor, _not_ in clearUndoState.
</t>
<t tx="ekr.20040403120534.646">The self.oldcursor logic wasn't working reliably.
</t>
<t tx="ekr.20040403120534.647"></t>
<t tx="ekr.20040403120534.648">In most case the "x2" hook is always called, whether or not the "x1" hook overrides the default code.

The only time this can possibly make a difference is when the "x1" hook actually does override, so the issue of whether or not this is a good idea is almost always moot.</t>
<t tx="ekr.20040403120534.649">@nocolor

The following are real problems that should be cleaned up:

c:\prog\leoCvs\leo\leoApp.py:293: Object (d) has no attribute (testDialogs)

	(done) remove app.testDialogs

c:\prog\LeoCVS\leo\leoFileCommands.py:342: No class attribute (getCollapsedOpenTag) found

	(done) change getCollapsedOpenTag to getOpenTag

c:\prog\LeoCVS\leo\leoFileCommands.py:525: Catching a non-Exception object (BadLeoFile)
c:\prog\LeoCVS\leo\leoFileCommands.py:583: Catching a non-Exception object (BadLeoFile)

	(done) derive class BadLeoFile from Execption

(done) c:\prog\LeoCVS\leo\leoUndo.py:134: No class attribute (redoMenuLabel) found
(done) c:\prog\LeoCVS\leo\leoUndo.py:138: No class attribute (undoMenuLabel) found
(done) c:\prog\LeoCVS\leo\leoUndo.py:320: No class attribute (commands) found
(done) c:\prog\LeoCVS\leo\leoUndo.py:394: No class attribute (debug_print) found
(done) c:\prog\LeoCVS\leo\leoUndo.py:423: No class attribute (new_undo) found
(done) c:\prog\LeoCVS\leo\leoUndo.py:424: No class attribute (debug) found
(done) c:\prog\LeoCVS\leo\leoUndo.py:430: No class attribute (old_mem) found
(done) c:\prog\LeoCVS\leo\leoUndo.py:433: No class attribute (new_mem) found

	These arise because we refer to both self.x and u.x.
	to do: change self.x to u.x.

c:\prog\LeoCVS\leo\leoCompare.py:425: No class attribute (makeWhitespaceVisible) found

(done) changed self.makeWhitespaceVisible to cmp.makeWhitespaceVisible</t>
<t tx="ekr.20040403120534.650"></t>
<t tx="ekr.20040403120534.651"></t>
<t tx="ekr.20040403120534.652"></t>
<t tx="ekr.20040403120534.653"></t>
<t tx="ekr.20040403120534.654">We must do

exec s in {}

NOT

exec s in __builtins__

Passing __builtins__ to exec is the _worst possible_ thing to do, because it pollutes the only truly global namespace FOREVER.</t>
<t tx="ekr.20040403120534.655"></t>
<t tx="ekr.20040403120534.656"></t>
<t tx="ekr.20040403120534.657"></t>
<t tx="ekr.20040403120534.658"></t>
<t tx="ekr.20040403120534.659">What I did:
	
- added self.trace ivar to trace write logic.

- changed the following sections of putCodePart:

1. &lt;&lt; put the line &gt;&gt;
	Buffered characters to make tracing easier. (reduces calls to self.os)
	Don't write trailing indentation if not writing sentinels.

2. &lt;&lt; handle @others &gt;&gt;
	Skip the newline after @others if we aren't putting sentinels.
</t>
<t tx="ekr.20040403120534.660">The present code properly handles undo/redo for operations that copy trees, but copying trees itself causes problems for further undoes.  I've disabled further undos, as was done previously, but this is a pity.

To fix this, we may have to hack on the beads to indicated that a copy has been made.  No doubt about it: copying trees is tricky.</t>
<t tx="ekr.20040403120534.661"></t>
<t tx="ekr.20040403120534.662">This bug was created recently by the new underline/realMenuName logic.  We must not set the undo/redoRealMenuName ivars in clearUndoState: that should only be done when actually setting the menu names.</t>
<t tx="ekr.20040403120534.663"></t>
<t tx="ekr.20040403120534.664">The fix was made to atFile.scanAllDirectives() and leoGlobals.scanDirectives()
tangle.scanAllDirectives() was not affected.

# Reversion fix: 12/06/02: We must use elif here, not if.
elif not old.has_key("language") and dict.has_key("language"):</t>
<t tx="ekr.20040403120534.665">Completed a major revision of the menu handling code to handle underlined menus.  The new code has a chance of working with translated menus.


What I did:

- Added app()./frame.setRealMenuNamesFromTable() convenience methods.
- Use underline param to specify underlined characters in menu names.
- Translate &amp; to underline index before removing &amp;.
- Alt-E conflicts with Edit menu: changed to Alt+Shift+E
- Added f.get/setMenu (canonicalize menu names)
- Used realMenuNames for undo/redo.
- Disabled Can't Undo, Can't Redo.
</t>
<t tx="ekr.20040403120534.666"></t>
<t tx="ekr.20040403120534.667"></t>
<t tx="ekr.20040403120534.668">The lambda functions for callbacks were not working properly.  While I was at it I simplified the code</t>
<t tx="ekr.20040403120534.669">The original bug report:

"The sample code to invoke idle via "Open With" does not work if leo 
is installed in a path with a blank, for example "program files/leo". 
On windows, the pathname needs to be quoted in this case."

I did not find this to be the case.  However, there were problems with the sample Open With code in customizeLeo.py and I corrected these.
</t>
<t tx="ekr.20040403120534.670">We scanning for the initial state we must make sure that i &lt; old_len and i &lt; new_len.</t>
<t tx="ekr.20040403120534.671">This was reported by David LeBlanc and fixed with major hints from Chad Netzer.
</t>
<t tx="ekr.20040403120534.672">Apparently the F4 shortcuts interferes with the Alt-F4 shortcut.</t>
<t tx="ekr.20040403120534.673">The content formerly on evisa.com, including the Leo tutorials is now on 3dtree.com.</t>
<t tx="ekr.20040403120534.674"></t>
<t tx="ekr.20040403120534.675">Use keyword params instead of synonym constants.

- import
	- removed dont_indent_refs and indent_refs synonyms.

- tangle
	- removed verbose and brief synonyms to st_dump.
	- left other flags alone: they are complex.</t>
<t tx="ekr.20040403120534.676"></t>
<t tx="ekr.20040403120534.677"></t>
<t tx="ekr.20040403120534.678">Added options for @file and @root.

The options to @root are more important (and potentially more buggy).  For the first time Leo allows you to choose whether body text in @root trees will start in code mode or doc mode by default.  Ever since I created @file trees I've regretted the choice of making doc mode the default.  Just last week I realized I'm not stuck with that old choice.

This is a little tricky, so please pay attention :-)

1. @root-doc filename and @root-code filename specify that body text is assumed to start in doc mode or code mode respectively.  The options (-doc and -code) must follow @root immediately with no intervening whitespace.  In effect, @root-code and @root-doc are two new directives.  (They aren't syntax colored yet: they will be today or tomorrow.)

2. These @root options override the new at_root_bodies_start_in_doc_mode option in leoConfig.py.  This option affects only @root trees without options.  Such "plain" @root trees are now deprecated, which only means that it is now better style to use either @root-code or @root-doc.  The reason is simple: the meaning of plain @root trees will depend on the at_root_bodies_start_in_doc_mode option, and that isn't good.

3. By default, at_root_bodies_start_in_doc_mode = 1 for compatibility for old @root trees.  I actually don't think this option is good for much; I created it before I created @root-doc and @root-code, and I decided it wouldn't hurt to leave it in.  Anyway, you now have complete flexibility about how @root works, and in particular you can make @root work just like @file.

Only minor changes were made to the Tangle and Untangle code, and the new code appears to work.  However, it has not been extensively tested.  I would like to get 3.9.1 out the door this week so the latest "official" version of Leo won't crash when PIL or tkIcon are not present.  So please report any problems with the new code immediately.</t>
<t tx="ekr.20040403120534.679">Untangle was warning about a missing section if the section had only an @doc part.</t>
<t tx="ekr.20040403120534.680">There is a good reason why os.path.normpath does not mess with slashes on Linux, and there is no reason to create another routine to do so.
</t>
<t tx="ekr.20040403120534.681"></t>
<t tx="ekr.20040403120534.682"></t>
<t tx="ekr.20040403120534.683">Used .gif file so transparency info used by tkIcon code.
Rewrote tkIcon code so it doesn't try to resize the icon.
Created custom 16x16 LeoWin.gif.</t>
<t tx="ekr.20040403120534.684">The code now uses the list leoConfig.ivars to generate exec statements that do the work.  This makes it possible to add ivars to leoConfig.ivars without changing code in leoConfig.py.
</t>
<t tx="ekr.20040403120534.685">It might be beter if the Suboutline Only and Node Only checkboxes were Radio buttons, but then we would need yet another radio button to say "Search Entire Outline", which is a bit pedantic.

Note that Node Only takes precedence over Suboutline Only if they are both checked.</t>
<t tx="ekr.20040403120534.686">This works just like the Flatten Outline command except it writes only headlines.</t>
<t tx="ekr.20040403120534.687"></t>
<t tx="ekr.20040403120534.688">The code that checks whether leading and trailing have been supplied must check against None.  Otherwise, a leading or trailing value of zero will cause middle_lines to be miscalculated.</t>
<t tx="ekr.20040403120534.689">The commands now remember the scroll position so the screen doesn't hope around.</t>
<t tx="ekr.20040403120534.690"></t>
<t tx="ekr.20040403120534.691">Created the long-overdue convertUnicodeToString utility.</t>
<t tx="ekr.20040403120534.692"></t>
<t tx="ekr.20040403120534.693"></t>
<t tx="ekr.20040403120534.694">This is called from atFile.scanAllDirectives, tangle.scanAllDirectives and utils_rename.</t>
<t tx="ekr.20040403120534.695"></t>
<t tx="ekr.20040403120534.696">@ test

@nocolor

@ test

@color</t>
<t tx="ekr.20040403120534.697">This may or may not solve a crash under Python 2.1.</t>
<t tx="ekr.20040403120534.698"></t>
<t tx="ekr.20040403120534.699">Leo now ensures that u.oldText and u.newText are set to None when using the new undo scheme.  This means that Python now has a chance of reclaiming much more memory.</t>
<t tx="ekr.20040403120534.700"></t>
<t tx="ekr.20040403120534.701"></t>
<t tx="ekr.20040403120534.702">Leo now forces a full update and redraw if there is a mismatch between the expected value and the result calculated from the Tk.Text widget.  This is safe, and won't happen often.</t>
<t tx="ekr.20040403120534.703">This was making it impossible to specify trailing newlines.  It also seems to have helped undo.</t>
<t tx="ekr.20040403120534.704"></t>
<t tx="ekr.20040403120534.705"></t>
<t tx="ekr.20040403120534.706"></t>
<t tx="ekr.20040403120534.707"></t>
<t tx="ekr.20040403120534.708"></t>
<t tx="ekr.20040403120534.709"></t>
<t tx="ekr.20040403120534.710">We can't use after_idle because that completely overloads the system.  On my machine a delay of 500-1000 msec between calls would be sufficient to handle most "periodic" tasks.</t>
<t tx="ekr.20040403120534.711">It's not perfect, and it will do for now.</t>
<t tx="ekr.20040403120534.712"></t>
<t tx="ekr.20040403120534.713"></t>
<t tx="ekr.20040403120534.714">Noweb section refs and defs _are_ valid in cweb mode!
Allow LaTex coloring in cweb @space, @* and @** doc parts.</t>
<t tx="ekr.20040403120534.715"></t>
<t tx="ekr.20040403120534.716">Cweb prefs panel setting was overriding @language python (!)</t>
<t tx="ekr.20040403120534.717"></t>
<t tx="ekr.20040403120534.718">This makes it much easier to pass parameters to hooks.
</t>
<t tx="ekr.20040403120534.719"></t>
<t tx="ekr.20040403120534.720"></t>
<t tx="ekr.20040403120534.721"></t>
<t tx="ekr.20040403120534.722">@language pascal
@color

private
uses</t>
<t tx="ekr.20040403120534.723"></t>
<t tx="ekr.20040403120534.724">We can only suppress redraws in undo/redo under very special conditions, namely that we are undoing typing in the same node.

The recent code will leave the screen in the wrong state!</t>
<t tx="ekr.20040403120534.725"></t>
<t tx="ekr.20040403120534.726">Eliminated the self.delim ivar.  This can't be set correctly when coloring incrementally.

Realized that full, non-incremental coloring must _always_ be done when switching nodes.  Even if we move from one cloned node to another, the context can be different:  different @color, @nocolor, @language and @comment directives may be in effect.

Used incremental syntax coloring when undoing.  This speed up undo tremendously.</t>
<t tx="ekr.20040403120534.727"></t>
<t tx="ekr.20040403120534.728"></t>
<t tx="ekr.20040403120534.729"></t>
<t tx="ekr.20040403120534.730"></t>
<t tx="ekr.20040403120534.731">The principle is this: people should see the scripts they are executed.
</t>
<t tx="ekr.20040403120534.732"></t>
<t tx="ekr.20040403120534.733"></t>
<t tx="ekr.20040403120534.734"></t>
<t tx="ekr.20040403120534.735"></t>
<t tx="ekr.20040403120534.736"></t>
<t tx="ekr.20040403120534.737"></t>
<t tx="ekr.20040403120534.738">@color

@ See the actual code in the child node for complete notes.</t>
<t tx="ekr.20040403120534.739">@ frame.doCommand and frame.OnMenuClick now set app.log, so top() will be reliable after any command is executed.

Note 1: The value of top() may change during a new or open command, which may change the routine used to execute the "command1" and "command2" hooks.  This is not a bug, and hook routines must be aware of this fact.
@c

def top():
	
	"""Return the commander of the topmost window"""
	
	# Warning: may be called during startup or shutdown when nothing exists.
	try:
		return app.log.commands
	except:
		return None</t>
<t tx="ekr.20040403120534.740"></t>
<t tx="ekr.20040403120534.741"></t>
<t tx="ekr.20040403120534.742">The old code jumped through hoops not to duplicate code.  The new code just uses a new doAtKeyword routine.</t>
<t tx="ekr.20040403120534.743">The key invarient:  frame.menus contains _untranslated_ names.  The translated names are used only in the label param to the Tk.menu routines.</t>
<t tx="ekr.20040403120534.744">The menu hooks make it easy to customize menus.

The open hooks make it easy to perform custom actions when opening already-existing files.</t>
<t tx="ekr.20040403120534.745">Finished convenience routines.

Used createNewMenu to create Leo's menus.</t>
<t tx="ekr.20040403120534.746"></t>
<t tx="ekr.20040403120534.747">This will allow users to create new menus without creating new ivars, an important generalization.

self.menus["top"] represents the top-level menu.  All other menus are represented by their menu name.</t>
<t tx="ekr.20040403120534.748">This is long overdue:

- put the entire command in a try: except: block.
- eliminates the need for return "break"
- provides the natural place for hooks.

It was quite easy now that we have createMenuEntries.</t>
<t tx="ekr.20040403120534.749">At present, only the start1, start2 and end1 hooks are handled, and many more could be added easily.</t>
<t tx="ekr.20040403120534.750"></t>
<t tx="ekr.20040403120534.751"></t>
<t tx="ekr.20040403120534.752"></t>
<t tx="ekr.20040403120534.753"></t>
<t tx="ekr.20040403120534.754">This was almost too easy :-)</t>
<t tx="ekr.20040403120534.755"></t>
<t tx="ekr.20040403120534.756">Leo no longer massages comments when importing Java files.

There was a bug in massageBody that prevented text from being undented properly.  There was a bug in find_line_start (!!) that caused the start of the _previous_ line to be found if s[i] was a newline.  It's amazing that these bugs were undiscovered for so long.

Treat interface like class.</t>
<t tx="ekr.20040403120534.757">It was moving past the present line if the s[i] was a newline.

This caused problems in the Java scanner, and could also cause problems in other places.</t>
<t tx="ekr.20040403120534.758"></t>
<t tx="ekr.20040403120534.759">The trailing @ in @q@ "doubles" the first @ in a sentinel, so putSentinel should not do this, and sentinelKind needs no special code to test for sentinels.

The tcweb.py script tests cweb files.  Invoke as follows:

python tcweb.py file1 file2...</t>
<t tx="ekr.20040403120534.760">@ What I did:
	
- Changed g to geom or glob.
- Removed print_stack.
- Moved alert, handleLeoHook &amp; unloadAll to leoUtils.
- Moved all leoUtils routines into leoGlobals.py.
- Removed all instances of "from leoUtils import *"
- Removed "script functions" from leo.py: getCommands, topCommands, topCommand.
	These are no longer used anywhere in the code.
- Made the prolog_xxx constants ivars of leoApp.
- Made language_delims_dict and language_extension_dict ivars of leoApp.

I have decided to leave the present scheme pretty much in place,
except to move the variables in leoGlobals.py to leoApp.py.

This will allow us to say the following:
	
1. any function f() is defined in leoGlobals.py.
2. any variable v not of the form x.f is a local variable.


</t>
<t tx="ekr.20040403120534.761"></t>
<t tx="ekr.20040403120534.762"></t>
<t tx="ekr.20040403120534.763">We must double _all_ @ signs following the @q@, so, e.g., a @@color sentinel gets turned into @q@@@@@color@&gt;.

This is easy to do in putSentinel, but a bit harder to undo:

1. sentinelKind locally adjusts the string in cweb mode.
2. skipSentinelStart skips both @@ signs in cweb mode.
3. All sections in scanText that deal with variable text must change @@ to @ within that text.</t>
<t tx="ekr.20040403120534.764"></t>
<t tx="ekr.20040403120534.765">Only rarely does a routine as elegant as wrap_lines come along.</t>
<t tx="ekr.20040403120534.766"></t>
<t tx="ekr.20040403120534.767"></t>
<t tx="ekr.20040403120534.768"></t>
<t tx="ekr.20040403120534.769"></t>
<t tx="ekr.20040403120534.770"></t>
<t tx="ekr.20040403120534.771">Added return "break" to body and headline key handlers.
Added unreachable return 0 to end of findMatchingBracket.</t>
<t tx="ekr.20040403120534.772">@nocolor

This is miserable code to get just right because there are so many paths through the code.  In addition, making informative error messages is a bit tricky too.

Changes made:

1. Removed unhelpful warnings about non-existent paths.  Only errors are given now.
2. Added logic to set self.root_name if it has not already been set.  Without this, it is impossible to test for relative filenames in @root directives, and errors happen only after tangling is complete, which is quite confusing.
3. Added error messages when a "computed" file name does not exist.
4. Removed unused self.default_directory ivar from leoTangle.py.
5. Set self.tangle_directory ivar to base directory when @root node specifies a relative directory.  This is required so the later code will try to create the proper file.
6. Renamed the path_directive_creates_directories option to create_nonexistent_directories.  This makes clearer what is going on.
</t>
<t tx="ekr.20040403120534.773">The old name was too misleading.</t>
<t tx="ekr.20040403120534.774"></t>
<t tx="ekr.20040403120534.775">Leo was not warning about orphan nodes in cweb mode.

There was new code in atFile.write _not_ to check for orphan nodes in cweb mode.  I just removed the test for language=="cweb".</t>
<t tx="ekr.20040403120534.776">The present code explicitly eliminates control-T processing in headlines, which means that control-T does not switch panes when editing headline text.  Control-T _does_ switch panes in all other cases.

This appears to be another Tk bug.</t>
<t tx="ekr.20040403120534.777"></t>
<t tx="ekr.20040403120534.778"></t>
<t tx="ekr.20040403120534.779">The old code scanned the moved tree once for every parent.  The new code scans the tree only once.  This can result in a significant speedup.</t>
<t tx="ekr.20040403120534.780">This is taken from Python Cookbook.
It's not clear how useful this is with Tk programs.</t>
<t tx="ekr.20040403120534.781">1. Eliminated special-case code (putCWEB) in atFile.write code.
2. Changed directiveKind so it returns noDirective for @space and @c when language=="cweb".
3. Changed colorizer to recognize both cweb and noweb section definitions and references when language == "cweb"</t>
<t tx="ekr.20040403120534.782">Leo preserves the &lt;?xml-stylesheet...?&gt; line if it is already present in the .leo file.

Otherwise, Leo writes a &lt;?xml-stylesheet...?&gt; line only if the stylesheet option is present in the configuration file.  The stylesheet option specifies s in &lt;?xml-stylesheet s?&gt;</t>
<t tx="ekr.20040403120534.783"></t>
<t tx="ekr.20040403120534.784"></t>
<t tx="ekr.20040403120534.785">Changed find to rfind in &lt;&lt; Set headline and ref &gt;&gt;</t>
<t tx="ekr.20040403120534.786"></t>
<t tx="ekr.20040403120534.787">scanAllDirectives just about must be called on the root of the tree, so directives are recognized.  Not @first or @last though.</t>
<t tx="ekr.20040403120534.788">The aha, just concatenate a unique user id with any local timestamp.</t>
<t tx="ekr.20040403120534.789">This may complete raw cweb mode.</t>
<t tx="ekr.20040403120534.790">It appears that nobody ever used @delims in @file trees!</t>
<t tx="ekr.20040403120534.791">Only shortcut pastes worked before.</t>
<t tx="ekr.20040403120534.792"></t>
<t tx="ekr.20040403120534.793">1. Changed "c" to "." in

methodKind = choose(self.fileType==".c","functions","methods")

2. Added self.rootLine logic to add @root self.fileName when importing to @root nodes.</t>
<t tx="ekr.20040403120534.794"></t>
<t tx="ekr.20040403120534.795"></t>
<t tx="ekr.20040403120534.796">Previously, Java only had block comments, and the ending delim wasn't being removed from doc parts.</t>
<t tx="ekr.20040403120534.797"></t>
<t tx="ekr.20040403120534.798"></t>
<t tx="ekr.20040403120534.799">As usual, I am leary of changing the Untangle logic.

To be effective, the @comment directive should follow the @language directive.</t>
<t tx="ekr.20040403120534.800"></t>
<t tx="ekr.20040403120534.801"></t>
<t tx="ekr.20040403120534.802"></t>
<t tx="ekr.20040403120534.803"></t>
<t tx="ekr.20040403120534.804"></t>
<t tx="ekr.20040403120534.805">The warning for "unknown language" had an unbound var.</t>
<t tx="ekr.20040403120534.806">The new code must check for @raw and @end_raw directives.</t>
<t tx="ekr.20040403120534.807">The &lt;&lt; Set path from @file node &gt;&gt; code was assuming that v.isAtFileNode() was non-Null.  This is no longer true with @rawfile.  The traceback was:

 File "c:\prog\leoCvs\leo\leoAtFile.py", line 424, in scanAllDirectives
    name = v.atFileNodeName()
AttributeError: 'NoneType' object has no attribute 'atFileNodeName'

The correct code is:

if v.isAtFileNode():
	name = v.atFileNodeName()
else:
	name = v.atRawFileNodeName()

dir = choose(name,os.path.dirname(name),None)</t>
<t tx="ekr.20040403120534.808"></t>
<t tx="ekr.20040403120534.809"></t>
<t tx="ekr.20040403120534.810"></t>
<t tx="ekr.20040403120534.811"></t>
<t tx="ekr.20040403120534.812"></t>
<t tx="ekr.20040403120534.813"></t>
<t tx="ekr.20040403120534.814">A small convenience urgently requested.</t>
<t tx="ekr.20040403120534.815">It wasn't always completely clear when the command was complete.</t>
<t tx="ekr.20040403120534.816">atFile.directiveKind returned miscDirective on _any_ line that starts with @.</t>
<t tx="ekr.20040403120534.817">This entailed using lots of ivars for communication between routines.</t>
<t tx="ekr.20040403120534.818"></t>
<t tx="ekr.20040403120534.819"></t>
<t tx="ekr.20040403120534.820"></t>
<t tx="ekr.20040403120534.821"></t>
<t tx="ekr.20040403120534.822">A recent change was not writing language names properly (double quotes were ommitted) in the &lt;preferences&gt; element of .leo files.</t>
<t tx="ekr.20040403120534.823">The new code is much simpler and more rational than the old, without affecting the defaults that are delivered by the module.

In addition, fixed a but that was causing most new params not to be written.</t>
<t tx="ekr.20040403120534.824">This directive only applies to @root trees.  Like @silent, it inhibits untangling.</t>
<t tx="ekr.20040403120534.825">Added missing comma before the keyword.</t>
<t tx="ekr.20040403120534.826"></t>
<t tx="ekr.20040403120534.827">Another major reorganization.</t>
<t tx="ekr.20040403120534.828">This was a major reorganization.</t>
<t tx="ekr.20040403120534.829"></t>
<t tx="ekr.20040403120534.830"></t>
<t tx="ekr.20040403120534.831"></t>
<t tx="ekr.20040403120534.832">Replaced almost all calls to traceback.print_exc by calls to es_exception.</t>
<t tx="ekr.20040403120534.833">We call scanAllDirectives on the _parent_ node, so no directives are recognized in the @rawfile tree itself, and directives _are_ recognized in ancestor nodes.  atFile::writeAll has new logic that recognizes @ignore in ancestors of @rawfile nodes, but not in @rawfile nodes themselves.

Writing the file was easy; updating the screen was harder.  We must redraw the screen whenever a headline changes, regardless of whether a node is joined to another.  The reason is that we must redraw the dirty bits of ancestor @file and @rawfile nodes.</t>
<t tx="ekr.20040403120534.834"></t>
<t tx="ekr.20040403120534.835">Removed v22 var from leoApp.py.
Removed ch3 var from getCwebWord() in leoColor.py
Removed self and name args from go function in leoCompare.py.
Added from leoUtils import * and from leoGlobals import * to leoCompare.py
Removed ok from onCompareFiles in leoCompare.py
Removed c from setAncestorsOfClonedNodesInTreeDirty in leoNodes.py
Removed import leoPrefs from leoAtFile.py
Moved unused assignment to top into #if 0 block in open in leoFileCommands.py
Removed unused name var from scanPHPText in leoImport.py
Bug fix: changed tangle_state to self in several places in root_attributes.__repr__
Bug fix: converted represent_print_bits to a method
	(It was indented as a method under class root_attributes)
Removed language,single_comment_string,start_comment_string,end_comment_string params from st_enter in leoTangle.py.
Bug fix (Major?): restored code to return part number at end of st_enter.
Latent bug fix: changed self.font to font in tree.setLineHeight.
Bug fix: all paths through idle_body_key and idle_head_key now return "break"
Removed topMenu var from tree.OnPopup.
Removed config var from leoFrame.__init__
Latent bug fix: changed editHeadlineMenu to self.editHeadlineMenu in leoFrame.__init__ 
Real bug fix: changed editHeadlineMenu to self.editHeadlineMenu in leoFrame.__del__
	(This affects how storage is freed)
Removed interp var from leoPyShellMain.</t>
<t tx="ekr.20040403120534.836"></t>
<t tx="ekr.20040403120534.837">Asumming that python and tcl are installed, It shouldn't take familiarity with python to be able to use leo. I want to be able to type

leo foo

and have leo start up on a new [outline] named foo.leo, or open the existing one if it's there.</t>
<t tx="ekr.20040403120534.838"></t>
<t tx="ekr.20040403120534.839"></t>
<t tx="ekr.20040403120534.840">Leo now does the following: 

1. Leo checks all characters that are entered (via typing or via paste) into headline and body text to see whether they can be represented in the encoding specified in leoConfig.txt. 

2. Leo issues a message and _disallows_ the entry of the character if it can't be represented in the encoding specified in leoConfig.txt. 

In practice, this draconian behavior shouldn't be too much of a nuisance, at least temporarily. Note that _all_ characters are valid in UTF-8 encoding, so the present version of Leo will allow you to specify all characters if you must. But the Latin-1 (iso-8859-1) encoding, being a one-byte encoding, limits you to at most 256 separate characters. 

In 3.8 I plan to allow you to use _all_ Unicode characters, regardless of encoding, by using so-called character references.  This will require some reorganization of the present code, so I don't want to delay 3.7 to handle them.</t>
<t tx="ekr.20040403120534.841">It is much more convenient to set these to proper defaults than it would be for the callers to do so.  Nevertheless, perhaps the caller should do so, but not now...</t>
<t tx="ekr.20040403120534.842"></t>
<t tx="ekr.20040403120534.843">This makes the present code compatible with Python 2.1.</t>
<t tx="ekr.20040403120534.844">I needed this clarification.</t>
<t tx="ekr.20040403120534.845">&gt; # Tk always uses utf-8 encoding.

You may get that impression, but it is slightly wrong. It is more
reliable if you pass Unicode strings to Tk, instead of UTF-8 encoded
byte strings.

For a byte string, Tk will guess the encoding. If it looks like UTF-8,
it is taken treated UTF-8. Otherwise, it is treated as the locale's
encoding. Unfortunately, if you ever manage to mix the two, you get
byte salad that you can't ever chew. By using Unicode strings to
interface with Tk only, you can avoid those problems.

&gt; print `s`,"tk"
&gt; s = s.encode("utf-8") # result is a string.
&gt; print `s`,"utf-8"
&gt; s = s.decode(xml_encoding) # result is unicode.
&gt; s = s.encode(xml_encoding) # result is a string.

Since xml_encoding is iso-8859-1, you are making a mistake here. You
have UTF-8 data, but you are decoding them as Latin-1. This will
succeed, but it will give an incorrect result. It will succeed since
iso-8859-1 is an single-byte code where every byte value is valid.
That means an arbitrary byte sequence can be interpreted as Latin-1,
but for many byte sequences, the resulting string is non-sense
(mojibake, as the Japanese say).

&gt; BTW, with out the first encode/decode pair I can take exceptions in
&gt; the last encode.

Nevertheless, this is the correct processing. If you have a Unicode
object, as originally obtained from Tk, you should encode as Latin-1
using

s = s.encode("iso-8859-1")

Now, for this specific string (u'a\u0102\xdf\xc9\n'), you will get a
Unicode error. The reason is that one character (\u0102) is not
supported in Latin-1 - this encoding supports only the first 256
Unicode characters.

So, when saving this as XML, the proper representation would be

'a&amp;#x102;\xdf\xc9\n'

i.e. you'll have to use a character reference. Python 2.2 does not
support generating such text very well - you'll have to catch the
Unicode error yourself, find the offending character, encode it as a
character reference, and encode all other characters as requested.

Alternatively, you can refuse encoding a document in a certain
encoding (such as Latin-1), and fall back to UTF-8.

PEP 293 (http://www.python.org/peps/pep-0293.html) will provide a
mechanism to generate character references more conveniently - in
Python 2.3, you can specify

  s.encode('iso-8859-1',errors='xmlcharrefreplace')

HTH,
Martin</t>
<t tx="ekr.20040403120534.846">The Find Previous command could not go to previous nodes.</t>
<t tx="ekr.20040403120534.847"></t>
<t tx="ekr.20040403120534.848">It would be good to have a prefix option too.</t>
<t tx="ekr.20040403120534.849">This fix was suggested by Rich Ries.  The original report follows:

I found the culprit; it's in the node &lt;&lt; scan @@ &gt;&gt; that reads: 

k = string.find(s,self.endSentinelComment,i) 

This means it stops at the FIRST endSentinelComment, which is the "*/". The rest of the line (with the correct "*/") gets chucked. Changing the line to: 

k = string.rfind(s,self.endSentinelComment,i) 

(note the "r" before "find") seems to fix the problem. 
</t>
<t tx="ekr.20040403120534.850"></t>
<t tx="ekr.20040403120534.851"></t>
<t tx="ekr.20040403120534.852">The new code in putOpenLeoSentinel follows the example of putSentinel.</t>
<t tx="ekr.20040403120534.853"></t>
<t tx="ekr.20040403120534.854">They are simply relative representations of absolute indices, and so are basically useless.</t>
<t tx="ekr.20040403120534.855">This is a huge step, and I hope it is forward. In any event, the change is simple and reversable.

I am now considering whether to use relative node indices instead of absolute node indices.

These would have the form +n and -n.  This would eliminate the cascade of changes when nodes were inserted.  The key question is whether the read logic can handle them.  I believe it can, with just a single ivar.</t>
<t tx="ekr.20040403120534.856">Amazingly, the only change required to allow reads and writes of cloned @file nodes was to eliminate the error in updateCloneIndices.  I also fixed a bug: set self.errors = 0 in atFile.read.</t>
<t tx="ekr.20040403120534.857"></t>
<t tx="ekr.20040403120534.858">The upshot: both =pod and =cut must be preceded and followed by blank lines.  The simple tests have this.

Added perlpod hack to set_delims_from_string and changed delims to use double underscores in set_delims_from_language.</t>
<t tx="ekr.20040403120534.859">This affects @path, @file and @root code.  This is probably the code with the most separate paths in all of Leo.  I would be amazed if there were no bugs here, and it does seem mostly to work.

The getBaseDirectory utility routine implements the relative_path_base_directory option:

"!" means relative to leo.py
"." means relative to .leo file.
anything else should be absolute path.</t>
<t tx="ekr.20040403120534.860">This was just too horrible to keep straight, and bodyKeepsFocus should always be true anyway.</t>
<t tx="ekr.20040403120534.861"></t>
<t tx="ekr.20040403120534.862"></t>
<t tx="ekr.20040403120534.863"></t>
<t tx="ekr.20040403120534.864"></t>
<t tx="ekr.20040403120534.865"></t>
<t tx="ekr.20040403120534.866"></t>
<t tx="ekr.20040403120534.867"></t>
<t tx="ekr.20040403120534.868"></t>
<t tx="ekr.20040403120534.869"></t>
<t tx="ekr.20040403120534.870">It looks like the undo command does not fully undo changes to cloned nodes. Follow these steps to experience this effect: 

1) clone a node (same effect whether @file / @root or other) 
2) change the headline of either node. 
3) Edit-&gt;Undo change Headline (or ctrl-Z) 

Only the node that was changed will go back to the original headline. The undo command appears to be the problem since it does not properly undo changes to all cloned nodes' headlines. </t>
<t tx="ekr.20040403120534.871">The new code is much more elegant than the old, and does a better job of reporting errors.

One new restriction has been imposed: at most one shortcut can be associated with a command.  If one really wanted to have two shortcuts, one would have to use two different command names.

In particular, there is now only one shortcut for the Find Next command.  This should not be a problem.

It is now possible to bind the arrow keys as desired.  See the complete discussion in leoConfig.leo.

Note that all bindings are made both to the body pane and the top-level pane. This keeps things consistent.</t>
<t tx="ekr.20040403120534.872"></t>
<t tx="ekr.20040403120534.873">There was a missing comma.</t>
<t tx="ekr.20040403120534.874">It was remembering it only if set as the result of a keystroke.  The present code is redundant, but what the heck.</t>
<t tx="ekr.20040403120534.875">1. Use the present body font in frame.setTabWidth.

2. Do not call frame.setTabWidth in setCommandsIvars.  Just set the ivar.  This fixes the following bug:

"If you set the @tabwidth to something other than the Preference value, you'll
see the body displayed appropriately.  However, if you do a Ctrl-s to save the
leo file, the body is redisplayed using the Preferences setting -- of course,
clicking on another node and then back to the original node displays with the
correct tab setting again.  The redisplay on save must not go through precisely
the same body display logic."
</t>
<t tx="ekr.20040403120534.876">This was too confusing to users.</t>
<t tx="ekr.20040403120534.877"></t>
<t tx="ekr.20040403120534.878">This was done simply by opening derived files and .leo files in "wb" mode.</t>
<t tx="ekr.20040403120534.879">Essentially I moved the code that updates body text from the @+node logic to the @+body logic.

This can not be completely correct.  It breaks verbatimAfterRef

From the forum message:

I have just uploaded a major change to the logic that reads derived files. Indeed, this is the first change to that logic that has ever been made since I first invented @file trees. This change is needed to correct a bug reported by Rich Ries involving referencing a section defined in a grandchild of the referencing node. 

WARNING: although this code is similar to previous code, and passes all the tests that I can think of, you
should still consider this code experimental for a while. 

The problem: Body text was being updated as the result of @+node sentinels rather than @+body sentinels.
This was stupid, as extra @+node sentinels are often generated when no body text is generated. The result is
that the body text was being cleared. 

The fix: I simply moved the code that creates body text from the @+node logic to the @+body logic in
scanText. This was relatively straightforward, and I do have some hopes that everything will once again be rock
solid. However, the context in which this code is executing is obviously changed (that is, after all, the whole
point), so no guarantees can be given at this point. 

Everything appears to work (all files derived from this file appear to be OK), and this code must be considered experimental for now.</t>
<t tx="ekr.20040403120534.880"></t>
<t tx="ekr.20040403120534.881">At this point there are no known issues with Leo and Python 2.1.

Python 2.1 gave the following warnings when importing Leo:

Python 2.1.3 (#35, Apr  8 2002, 17:47:50) [MSC 32 bit (Intel)] on win32
Type "copyright", "credits" or "license" for more information.
&gt;&gt;&gt; import leo

leoFrame.py:197: SyntaxWarning: local name 'self' in 'createMenuBar' shadows use of 'self' as
global in nested scope 'lambda'
  def createMenuBar(self, top):

leoFrame.py:1262: SyntaxWarning: local name 'self' in 'OpenWithFileName' shadows use of 'self' as
global in nested scope
 'lambda'
  def OpenWithFileName(self, fileName):

leoColor.py:1367: SyntaxWarning: local name 'self' in 'run' shadows use of 'self' as
global in nested scope 'lambda'
  def run (self):
</t>
<t tx="ekr.20040403120534.882"></t>
<t tx="ekr.20040403120534.883"></t>
<t tx="ekr.20040403120534.884"></t>
<t tx="ekr.20040403120534.885"></t>
<t tx="ekr.20040403120534.886">It was just a matter of binding some unbound vars to defaults.</t>
<t tx="ekr.20040403120534.887">- The font settings in leoConfig.txt are not active when I open Leo. They instantly activate when opening the Edit|Set Font... dialog, without having to click anything in said dialog. Then, once the .leo file is saved, the problem goes away.</t>
<t tx="ekr.20040403120534.888"></t>
<t tx="ekr.20040403120534.889"></t>
<t tx="ekr.20040403120534.890">This code improperly removed trailing whitespace, including newlines, from the "middle" text.  Clearly this is wrong, regardless of what other effects it might have.

Affected commands are indent, dedent, extract and extract section.</t>
<t tx="ekr.20040403120534.891"></t>
<t tx="ekr.20040403120534.892">This makes it convenient to update the version number in this file properly.</t>
<t tx="ekr.20040403120534.893"></t>
<t tx="ekr.20040403120534.894">We now look through the entire tree looking for @root and @file nodes.</t>
<t tx="ekr.20040403120534.895">single quote colorized text in plain text mode.  This was due to missing parentheses.</t>
<t tx="ekr.20040403120534.896"></t>
<t tx="ekr.20040403120534.897"></t>
<t tx="ekr.20040403120534.898"></t>
<t tx="ekr.20040403120534.899"></t>
<t tx="ekr.20040403120534.900"></t>
<t tx="ekr.20040403120534.901"></t>
<t tx="ekr.20040403120534.902">CVS conflict files produce so many error messages that these errors are useless.</t>
<t tx="ekr.20040403120534.903">1. Created a new sandbox and updated CVS into it.  This did not update LeoPy.leo.
2. Opened LeoPY.leo.  There were read errors in leoImport.py and leoUtils.py.
3. Used diff on CVS to determine which routines had been added to these files.
4. Cut and pasted from updated LeoPy.leo to my "real" copy of LeoPy.leo.

This is most annoying, though it is helpful to pay attention to the added code.

The read errors themselves are useless, and I removed them.

I forgot to do an update first, so after I opened LeoPy.leo with Read Outline Only, saving all files with Write @file Nodes reverted Dave Hein's changes.  So I reloaded them from the temporary sandbox.  This is very bad.</t>
<t tx="ekr.20040403120534.904"></t>
<t tx="ekr.20040403120534.905"></t>
<t tx="ekr.20040403120534.906"></t>
<t tx="ekr.20040403120534.907">The code is now functionally identical to the similar code in atFile.scanAllDirectives.  The old code did not handle relative paths properly in all cases.</t>
<t tx="ekr.20040403120534.908"></t>
<t tx="ekr.20040403120534.909">This code crashes on some Windows systems, including my XP system.  It may work on Win98.</t>
<t tx="ekr.20040403120534.910">This involved calling readlineForceUnixNewline instead of readline in the atFile:read logic.</t>
<t tx="ekr.20040403120534.911"></t>
<t tx="ekr.20040403120534.912"></t>
<t tx="ekr.20040403120534.913"></t>
<t tx="ekr.20040403120534.914"></t>
<t tx="ekr.20040403120534.915"></t>
<t tx="ekr.20040403120534.916">Only the last directive was in effect in @root trees.  The new code allows node-by-node control.</t>
<t tx="ekr.20040403120534.917">This routine does a better job of checking the Tk version than the old code in leoApp.py</t>
<t tx="ekr.20040403120534.918">With Tk/Tcl 8.4, the Preferences window is empty (no buttons, fields, labels). 

Tcl 8.4 complains about using "col" in the grid() calls.</t>
<t tx="ekr.20040403120534.919">Removed calls to c.frame.canvas.focus_force() selectThreadBack/Next, selectVisBack/Next.

I have no idea why this code was there originally.</t>
<t tx="ekr.20040403120534.920">This may or may not fix Rich Reis's problems.</t>
<t tx="ekr.20040403120534.921">How did I ever live without this?</t>
<t tx="ekr.20040403120534.922"></t>
<t tx="ekr.20040403120534.923">Changed:

bitmap_name = os.path.join(self.loadDir,"Icons\LeoApp.ico") 

to:

bitmap_name = os.path.join(self.loadDir,"Icons","LeoApp.ico") 
</t>
<t tx="ekr.20040403120534.924"></t>
<t tx="ekr.20040403120534.925">&gt; I'd love to open a node and be in the same place as when I was last there.
</t>
<t tx="ekr.20040403120534.926">Everything appears to be working properly.</t>
<t tx="ekr.20040403120534.927">When starting Leo with no arguments the 'NewHeadline' node was not displayed. </t>
<t tx="ekr.20040403120534.928">os.rename can fail on some Linux systems.</t>
<t tx="ekr.20040403120534.929">@nocolor

The new code is as follows.  This is extremely ugly, and I'm not sure there is any workaround.  The problem is that open is really just a stand-in for C's fopen routine, and the mode param is not uniform across platforms.

@color

# 9/1/02: apparently Linux requires w+ and XP requires w.
mode = choose(sys.platform=="win32","w","w+")
cf = open(self.configFileName,mode)</t>
<t tx="ekr.20040403120534.930"></t>
<t tx="ekr.20040403120534.931"></t>
<t tx="ekr.20040403120534.932">This will allow Joe Orr to keep track of hits.</t>
<t tx="ekr.20040403120534.933">The cursor now changes to an arrow when it moves over a link.</t>
<t tx="ekr.20040403120534.934">1.  The link now takes the user to the SourceForge download page.
2.  Called os.setcwd(app().loadDir) to set the working directory for the download.</t>
<t tx="ekr.20040403120534.935"></t>
<t tx="ekr.20040403120534.936">This is still not working, and I am beginning to doubt that it can be done.

Notes:

1. In Tk terminology, bitmaps are 2-color only.  Most .bmp files must be considered _photo_ files.
2. I have figured out how to read .bmp and .gif files using image create photo.
3. All tests were run using tcl/tk 8.3.4, and wm iconbitmap has never worked.</t>
<t tx="ekr.20040403120534.937">It already works in the other panes, but the recommended code crashes tk83.dll!</t>
<t tx="ekr.20040403120534.938"></t>
<t tx="ekr.20040403120534.939"></t>
<t tx="ekr.20040403120534.940"></t>
<t tx="ekr.20040403120534.941"></t>
<t tx="ekr.20040403120534.942"></t>
<t tx="ekr.20040403120534.943"></t>
<t tx="ekr.20040403120534.944">There were a couple of botches in the new code:

1. leoTangle.scanAllDirectives should not issue any warning when it sees a relative path name in the @root directive.  (Which is the only place it will see it).  This is not an error.

2. leoTangle.pathError would create an exception when called.</t>
<t tx="ekr.20040403120534.945"></t>
<t tx="ekr.20040403120534.946"></t>
<t tx="ekr.20040403120534.947">Amazing!</t>
<t tx="ekr.20040403120534.948">1. Simplified the path logic in the various scanAllDirectives routines.

2. Distinguished between absolute and relative paths.  Relative paths do _not_ set the global defaults: they are handled by the file open logic which does os.path.join(default_path,file_name).

The logic is still quite complex, and for the first time the code may be simple enough to work.</t>
<t tx="ekr.20040403120534.949">This should end most of the confusion.</t>
<t tx="ekr.20040403120534.950">There are several problems here:

1. os.path.join(dir,file) won't work if both dir and file contain a partial path name.  I'm not sure whether this is a bug--there is probably no behavior that makes sense in all cases.

2. Unless os.path.join works above there is no way to see whether the directory is valid.</t>
<t tx="ekr.20040403120534.951">Removed '\r' characters when reading.  The write logic is unchanged, which makes the changes slightly safer.</t>
<t tx="ekr.20040403120534.952"></t>
<t tx="ekr.20040403120534.953"></t>
<t tx="ekr.20040403120534.954">An arg got dropped out when I added a flag.</t>
<t tx="ekr.20040403120534.955">Found several bugs while doing so.  What else is new...

Use this script as follows:

- Select the node under which you want the imported files to appear.
- Open the Python window within Leo.
- Type the following in the Python window:

import leoImport
dir = "c:/prog/test"  # or some other directory
type = ".py"  # Type of files you want to import, or None for all files.
leoImport.importFiles(dir,type)</t>
<t tx="ekr.20040403120534.956"></t>
<t tx="ekr.20040403120534.957"></t>
<t tx="ekr.20040403120534.958"></t>
<t tx="ekr.20040403120534.959"></t>
<t tx="ekr.20040403120534.960">The new code properly deletes previous entries regardless of case or path separators.</t>
<t tx="ekr.20040403120534.961">Changed idle_body_key and idle_head_key so the old values are also checked for Unicode strings.  I don't understand why that is needed, and after a cut and paste operation it is needed.

Also fixed Tangle's version of the os routine.

Also changed the assertion and converted to unicode in tnode::setTnodeText.</t>
<t tx="ekr.20040403120534.962"></t>
<t tx="ekr.20040403120534.963">The calls to config.setX in the put routines in leoFileCommands.py were happening _after_ the calls to config.update().  There is not need to call the config.set routines in putPrefs and putFindSettings provided we do the following in write_LEO_file:

	c.setIvarsFromFind()
	config.setConfigFindIvars(c)
	c.setIvarsFromPrefs()
	config.setCommandsIvars(c)
	config.update()</t>
<t tx="ekr.20040403120534.964">This creates leoConfig.txt</t>
<t tx="ekr.20040403120534.965">The old code was totally brain dead.  If a setting was missing or "ignore" it could never be set!!  Sheesh.  This is a major bug because _all_ writes to leoConfig.txt go throught this routine.</t>
<t tx="ekr.20040403120534.966"></t>
<t tx="ekr.20040403120534.967">Otherwise there is no way to change the prefs!</t>
<t tx="ekr.20040403120534.968">There were a couple of bugs here.

Note that the ratio (whichever the direction) is stored in the .leo file.  The initial_splitter_orientation setting in leoConfig.txt applies to _all_ files.  The initial_vertical_ratio and the corresponding initial_horizontal_ratio  apply only to new files, so are essentially useless.

Yes, this is pretty stupid; it's the result of not wanting to add more stuff to Leo's file format.</t>
<t tx="ekr.20040403120534.969"></t>
<t tx="ekr.20040403120534.970">This makes selected text look much better and makes Show Invisibles look much better as well.  

This was not easy to do.  Apparently tag settings interfer with the Tk.Text settings.  I have not found a way to specify the selectbackground color for tags.  The only way I could get things to work is only define whitespace tags when in showInvisibles mode.</t>
<t tx="ekr.20040403120534.971">Added setRevertVars to update revert settings.  This is called from __init__ and onOk.</t>
<t tx="ekr.20040403120534.972">This is consistent with what the Import commands do for the other file types.  It's also much safer.</t>
<t tx="ekr.20040403120534.973">.tmp files disappear On Windows XP after Leo exits!</t>
<t tx="ekr.20040403120534.974"></t>
<t tx="ekr.20040403120534.975">The new spelling is to limit_directory_search_extension.  Note that this affects the valid entries in leoConfig.txt.</t>
<t tx="ekr.20040403120534.976">Repeated double-clicking (without intervening single-click) caused the selection to move to the left.</t>
<t tx="ekr.20040403120534.977"></t>
<t tx="ekr.20040403120534.978">We must remove backticks from messages that might contain unicode characters so they will print properly.  There were only a few instances, and they are all error messages that hardly ever get executed, so I hope I was careful putting them in.  I should be able to find them all by looking for '"'.</t>
<t tx="ekr.20040403120534.979">Simplified leoCompare.py and leoTangle.py.</t>
<t tx="ekr.20040403120534.980">Now at last it is clear why Leo hasn't been writing derived files affected by clones.  It's not enough to mark v dirty.  We must mark all the cloned nodes of v's tree dirty as well.

However, we only need do this when a node is deleted, and we definitely do _not_ want to do this otherwise, for that would mark far too many nodes dirty.  To get around this, we leave v.setDirty() as it was, and use the new code only in v.setDirtyDeleted.

Note that the undo and redo cases handle this automatically because they call c.doDelete.</t>
<t tx="ekr.20040403120534.981"></t>
<t tx="ekr.20040403120534.982"></t>
<t tx="ekr.20040403120534.983">Amazing.  All that was needed was some code to force conversion on write, and code in the event handlers to convert "real" unicode to UTF-8.  We are talking about 10 lines of code!

There was a problem in leoFind.findNext: it was backquoting the search string when reporting search failures.  Removing the back quotes made the message appear properly.

What was needed was simply to do:

	if type(s) == types.UnicodeType:
		xml_encoding = app().config.xml_version_string
		s = s.encode(xml_encoding)

On the string s gotten from the Text widgets in the event handlers.

As a defensive measure, I also changed the write code in two places to:

	try:
		self.outputFile.write(s)
	except UnicodeError: # This might never happen.
		xml_encoding = app().config.xml_version_string
		s = s.encode(xml_encoding)
		self.outputFile.write(s)

The old code wrote `s` instead of s.encode(xml_encoding).</t>
<t tx="ekr.20040403120534.984">Also changed the calling code to check for val != None and val &gt; 0 or val != 0.  The only callers of skip_long are the various places that handle the @pagewidth and @tabwidth code.  Negative tab widths are allowed, but not negative page widths.</t>
<t tx="ekr.20040403120534.985">Initializing to something else was preventing a lot of code from being used!

Retested the @path logic.  Everything seems good.</t>
<t tx="ekr.20040403120534.986">These were used only to set the delim1, delim2 and delim3 locals in atFile.scanAllDirectives.  Getting rid of these two useless ivars greatly clarifies the code.</t>
<t tx="ekr.20040403120534.987">This is weird.  set_language would set the delims to the default_language delims if the lanuage was "default"</t>
<t tx="ekr.20040403120534.988"></t>
<t tx="ekr.20040403120534.989">We can't use choose because both branches are evaluated.

self.single_comment_string was never None before because all languages had either 1 or 3 delims.  But Java now has only 2 delims to force block comments.</t>
<t tx="ekr.20040403120534.990">The same bug appeared in leoAtFile.putIndent and leoTangle.put_leading_ws.  These routines should not do w = abs(tab_width) before the test.  I was confused that n (the desired indentation) might be negative.

Anyway, as a defensive measure, I used ' ' * abs(n) and '\t' * abs(n) in the routines in leoAtFile and leoTangle that put tabs and spaces.

Also, changed n / w to int(n/w) to avoid problems with future division.</t>
<t tx="ekr.20040403120534.991">1. The botch was this: set_delims_from_language used to return
	delim1 = start_block_comment_string
	delim2 = end_block_comment_string
if there were only two delims.  But the callers thought that delim1 was _always_ the single_comment_string.

This actually never caused problems with @language, because all languages had either 1 or 3 delimiters.  However, it appeared when I forced block comments in Java by using only two delims.  And it could always have caused problems when people used the @comment directive.

2. Issued a warning and do nothing when no delims specified with @comment.  This could have caused crashes.

3. set_delims_from_string no longer returns hard-coded defaults.  Instead it returns None.  Callers must now beware, but this is the correct action to take.</t>
<t tx="ekr.20040403120534.992">The change was made to leoFrame.py::reconfigurePanes.</t>
<t tx="ekr.20040403120534.993"></t>
<t tx="ekr.20040403120534.994">If a name table has only one name, it must be defined like

name = ("x",)

rather than

name = ("x")

This affected the following options:

"read_only"
"xml_version_string"
"limit_count"
"body_pane_wraps"</t>
<t tx="ekr.20040403120534.995">1. Removed the following ivars.  They were never used.

self.singleCommentString = "#"
self.startCommentString = ""
self.endCommentString = ""

2. Initialized the following ivars to None in the ctor:

self.default_directory = None
self.page_width = None
self.tab_width  = None
self.presentLanguage = None
self.targetLanguage = None
self.startSentinelComment = None
self.endSentinelComment = None

This makes clear that they are really initialized in leoAtFile.scanAllDirectives.

3. Renamed leoAtFile.scanAllDirectives.&lt;&lt; Set delims to default values &gt;&gt; to &lt;&lt; Set ivars &gt;&gt;.  It's contents is now:

if 1: # 8/2/02
	self.page_width = self.commands.page_width
	self.tab_width = self.commands.tab_width
	self.presentLanguage = self.targetLanguage = c.target_language
else:
	self.page_width = leoPrefs.default_page_width
	self.tab_width = leoPrefs.default_tab_width
	self.presentLanguage = self.targetLanguage = leoPrefs.default_target_language
	
self.default_directory = leoPrefs.default_default_directory
delim1, delim2, delim3 = set_delims_from_language(self.presentLanguage)</t>
<t tx="ekr.20040403120534.996"></t>
<t tx="ekr.20040403120534.997">There were many, many problems in the old color panel.

- Completely revised the Revert logic in the main Color panel.
- The color name picker now reverts properly.
- Color names and color swatches are now properly updated in all cases.
  As a result, there is no need to write color values to the log window.
- Used str(name) rather than `name` to eliminate quotation marks around color names and values.
- The color picker now shows the value of the present color, not the revert color.
- Increased the width of name buttons to handle long color names.
</t>
<t tx="ekr.20040403120534.998">See the child node for a proof.</t>
<t tx="ekr.20040403120534.999">@nocolor

The test code shows that all normal cases are handled correctly.  Nevertheless, we must prove that Leo can properly read and write @file nodes with nested @others directives.

Writing:

putAtOthers writes all nodes to be generated by @others.  inAtOthers returns false if the node has already been visited.  Nodes will not be visited when expanding the "outer" or "upper" @others, and will be visited thereafter.  Thus, nodes will be written at most once.

putAtOthers writes only sibling nodes and nodes descending from sibling nodes.  The expansion of inner @others nodes will never include parent nodes.  The expansion of an @others directive at @file node will write all unwritten nodes in the @file node.

In short,

1. all nodes in the "range" of an @others directive are written once and only once.
2. all nodes in the "range" of an @others directive are written enclosed in @+-others sentinels.
3. No orpan nodes are written.

Reading:

The read logic is unchanged.  Everything will work as before.  In particular, note that @+-others sentinels create trees under nodes containing the @others directive, just as before.  The read logic naturally handles nesting!</t>
<t tx="ekr.20040403120534.1000"></t>
<t tx="ekr.20040403120534.1001">The bug was testing for ifdef instead of #ifdef at the start of skip_pp_if.  However, I thought the bug might be related to something else, so I ended up being much more careful about brace levels in different branches of an #if statement.  The result was the skip_pp_part routine.</t>
<t tx="ekr.20040403120534.1002">I think this is most reasonable: we don't wan't people generating files from imported files unless they take some positive action.</t>
<t tx="ekr.20040403120534.1003">This bug caused following defs to be included in the current def if the line ended in a comment that was followed immediately by another def.</t>
<t tx="ekr.20040403120534.1004">I wanted to generate the following if a class declaration is in a separate node:

class x:
	@others

Instead of:

class x:
	&lt;&lt; class x methods &gt;&gt;

+ &lt;&lt; class x methods &gt;&gt;
@others

This doesn't work at first: all nodes under class x become orphans.  However, the new version of 
</t>
<t tx="ekr.20040403120534.1005">In order to make the new import code work, I have _experimentally_ allowed a change to how leoAtFile writes code.  This is the first such change in about a year.

The old code in leoAtFile.inAtOthers did not write nodes in @others trees if such nodes descended from another @others node.  The new code allows such nodes.  Apparently the write code handles this case just fine and the old restriction was unnecessary...</t>
<t tx="ekr.20040403120534.1006">Added entries for default target language, outline, promote and demote.</t>
<t tx="ekr.20040403120534.1007">The code now makes sure that c.target_language and related vars are not None.  This should fix the problem, and I wouldn't bet my life on it.</t>
<t tx="ekr.20040403120534.1008">It's too confusing to have arrow keys mean different things in different panes.

For one thing, we want to leave the focus in the body pane after the first click in the outline pane, but that means that the arrow keys must still be functional in the _body_ pane!

Alas, all the various combinations of key bindings of arrow keys appear to do something; there are none left to use for moving around in the outline pane.  So we are stuck with poor shortcuts.</t>
<t tx="ekr.20040403120534.1009"></t>
<t tx="ekr.20040403120534.1010">The @others directive was appearing before &lt;&lt; declarations &gt;&gt; reference.

The bug report and the fix were from Walter H. Rauser.</t>
<t tx="ekr.20040403120534.1011"></t>
<t tx="ekr.20040403120534.1012">I used the dis module as a base.  It was remarkably easy.  All I needed was

1. dis.opname, the names of the opcodes and
2. some code in the dis module to use as a starting point.</t>
<t tx="ekr.20040403120534.1013">The performance of Leo is as I expected.  In particular, reading files is the biggest bottleneck, and scanning string.find, isAtFileNode, is_ws, etc. are called frequently.</t>
<t tx="ekr.20040403120534.1014"></t>
<t tx="ekr.20040403120534.1015"></t>
<t tx="ekr.20040403120534.1016"></t>
<t tx="ekr.20040403120534.1017">@nocolor

Bernhard Mulder suggested the following code for adding the path to idle to sys.path.  I used this code with only trivial modifications.  I retained the previous error handling code in case there are further exceptions...

@color

try: 
	import idle 
except: 
	executable_dir = os.path.split(sys.executable)[0]
	idledir=os.path.join(executable_dir, "tools/idle") 
	sys.path.append(idledir)
</t>
<t tx="ekr.20040403120534.1018">The fix was to put a call to frame.top.deiconify() in run() right after the call to the frame ctor.

Apparently I only use openLeo.py to open Leo.</t>
<t tx="ekr.20040403120534.1019">The Compare panel is much easier to use than the old scripts in leoCompare.py.</t>
<t tx="ekr.20040403120534.1020"></t>
<t tx="ekr.20040403120534.1021">It is remarkable how recasting the code as two classes clarifies and fortifies the code.</t>
<t tx="ekr.20040403120534.1022">@nocolor

The new rules allow leo.py 3.1 to read and write .leo files more like leo.py 2.x when there is no leoConfig.txt file.  The scheme used in leo.py 3.0 meant that preferences were _never_ written to .leo files.  It's advantage was that all defaults were specified in:

	leoConfig.&lt;&lt; define default tables for settings &gt;&gt;

I think the present scheme is more natural, but we shall see...

In effect, Leo sets and gets various options in the following order of precedence:

1. Use explicit settings in leoConfig.txt if they exist.

2. Use defaults for leoConfig.txt, but only if leoConfig.txt exists.  These defaults are found in:

	leoConfig.&lt;&lt; define default tables for settings &gt;&gt;

3. Use settings in .leo files if leoConfig.txt does not exist.

4. If leoConfig.txt does not exist, and the .leo file does not specify a setting, use hard-coded settings in the various classes, just as leo.py 2.x did.

Added the config.configsExist ivar to tell whether leoConfig.txt exists (as far as Leo is concerned).</t>
<t tx="ekr.20040403120534.1023">Also added tcl keywords for syntax coloring.</t>
<t tx="ekr.20040403120534.1024">The @pagewidth, @tabwidth and @language directives could not have worked while tangling!  Apparently nobody has every used these directives in @root trees!

1. Apparently, skip_long had never been executed successfully (!!)  Indeed, it computed the value of a string character by character using (s[i] - '0') which has no chance of ever working!

2. The code in tangle.scanAllDirectives that handles @pagewidth and @tabwidth could not have ever worked. is_special_bits sets the dict entries for "page_width" and "tab_width", but tangle.scanAllDirectives looks for dict["pagewidth"] and dict["tab_width"], both of which will cause exceptions!

3. The code in tangle.scanAllDirectives that handles @language failed to set the self.x copies of the c.x ivars relating to language! This bug may have dated from fairly recent times when I changed the tangle code to use the self.x ivars rather than the c.x ivars.</t>
<t tx="ekr.20040403120534.1025"></t>
<t tx="ekr.20040403120534.1026">This affects Flatten Outline and Import Flattened Outline.</t>
<t tx="ekr.20040403120534.1027">While I was at it, I made a few minor changes to leoDialog.py.

1.  Added padx and pady padding in dialogs.
2.  Added text="OK" param to AskOk.
3.  Used center_dialog utility in leoDialog.center.

The leoDialog code is still ugly, but not ugly enough to fix.</t>
<t tx="ekr.20040403120534.1028"></t>
<t tx="ekr.20040403120534.1029">I wanted to see if this would corrupt any derived files by interrupting the write.  I doubted that this would be so: events do not work like interrupts.

What happened was that the pending event seemed to slow the writing, and all derived files were written correctly.</t>
<t tx="ekr.20040403120534.1030">The answer to the question, "why not just improve compare scripts?" is that people rarely use scripts.  A compare window would be much more convenient.  And convenience matters here: it is very important that people feel comfortable importing and exporing files.</t>
<t tx="ekr.20040403120534.1031"></t>
<t tx="ekr.20040403120534.1032"></t>
<t tx="ekr.20040403120534.1033">Found many spelling errors and repeated words.</t>
<t tx="ekr.20040403120534.1034">We can't just keep getting the x,y coordinates from the event, because then we can't stop.</t>
<t tx="ekr.20040403120534.1035">All files now pass.  I changed the followoing:

	leoAtFile.py:   found bug: unbound c in read()
	leoColor.py:    removed import keyword
	leoCommands.py: removed unused vars from Convert Blanks.
</t>
<t tx="ekr.20040403120534.1036"></t>
<t tx="ekr.20040403120534.1037"></t>
<t tx="ekr.20040403120534.1038">It was amazingly easy to do this.  We need only compute self.line_height from self.font.metrics().</t>
<t tx="ekr.20040403120534.1039">Also fixed a but that resulted in Convert Tabs being undoable.</t>
<t tx="ekr.20040403120534.1040">There were several important optimizations:

1. OnDrag precomputes self.numberOfVisibleNodes().
2. Eliminate all calls to findVnodeWithIconId() in OnContinueDrag.</t>
<t tx="ekr.20040403120534.1041">Including the split direction and split ration.

Leo now uses all configuration settings from leoConfig.txt.</t>
<t tx="ekr.20040403120534.1042">Just putting a call to update() in leoFileCommands.getGlobals() does 90% of what we want.  Moving the calls to

	frame.top.deiconify()
	frame.top.lift()
	
from OpenWithFileName to getGlobals gets us to 99% of perfection.  There is a tiny flash when the frame created in leoFrame.__init__ is drawn then withdrawn.

The last 1% is accomplished by withdrawing the newly-created frame in frame.__init__.  With this last change there is no perceptable flash when a window is opened.  Of course, all callers of frame.__init__ must now call deiconify as needed.

Trying not to create a frame at all until its size is known would be much, much harder, because the frame and commands classes initialize each other.
</t>
<t tx="ekr.20040403120534.1043">The bug was in leoFileCommands.getGlobals.

This was a _really_ irritating bug.  Now windows open where they were when closed.</t>
<t tx="ekr.20040403120534.1044">This saves the "user" code a lot of work.

Note: if leoConfig.txt does not exist, the default tables in the section called:

&lt;&lt; define default tables for settings &gt;&gt;

in leoConfig.py take effect, so modifying these tables is yet another way of managing preferences.</t>
<t tx="ekr.20040403120534.1045"></t>
<t tx="ekr.20040403120534.1046">The present code works wether we destroy the prefs, font and color panels when we close them, or just withdraw them.  It is best to withdraw them, because this preserves their location on the screen when we bring them back.

Some things to keep in mind about this code:

1.  There must be code in frame.OnCloseLeoEvent to destroy these frames if present.  The reason is that these are now non-modal frames, so they could still be open when we close the Leo window that "owns" them.
This is true Regardless of whether these frames are withdrawn or destroyed when closed.

2.  Since the window are no longer modal, we might try creating them after they exist.  In that case, we must simply deiconify the panel, even if we destroy panels when they are closed.

In both cases, we _must_ maintain ivars accurately telling whether the panels have been created or not.  These ivars are owned by the leoFrame class.  They are created by leoFrame when creating a frame, and set to Null by panel code if panels are destroyed when closed.  Since the leoFrame class owns these ivars, a cleaner way would be to create a frameDestroy method for each kind of panel.  But that borders on the pedantic...</t>
<t tx="ekr.20040403120534.1047"></t>
<t tx="ekr.20040403120534.1048"></t>
<t tx="ekr.20040403120534.1049">so code can say getXparam("name") and always get a proper value.</t>
<t tx="ekr.20040403120534.1050">This was easy to do and useful.</t>
<t tx="ekr.20040403120534.1051">This was much more work than it "ought" to have been, due mainly to the fact that Tk.ListBox does not have a callback for changed selection.  So the selection becomes active only on a double-click or a change to the size or bold or italics boxes.

The present frame seems to handle all cases properly and without surprise.  The code to do so is tricky.</t>
<t tx="ekr.20040403120534.1052"></t>
<t tx="ekr.20040403120534.1053">All that is needed is that each Font and Color panel be firmly connected to a particular Leo window.  In fact, we must have separate Font &amp; Color panels for each Leo window.  The point isn't that we want all these window: in practice there is almost always just one Leo around. The point is that we can eliminate the irritation of modal windows!

This insight also applies to the Preferences panel.  It's not so important for the Find/Change window.</t>
<t tx="ekr.20040403120534.1054">This was a _huge_ amount of work.  I am quite proud of the result.  The present font panel is much more elegant and less cluttered than the examples I have looked at.  Indeed, the font panel pack a lot of power in a very small space.  I think this is really elegant design.

I spent hours and hours experimenting with different looks.  I finally realized that there is no need for radiobuttons:  they just add clutter.  More importantly, there is no need for an example frame!  The entire Leo window becomes an example.</t>
<t tx="ekr.20040403120534.1055"></t>
<t tx="ekr.20040403120534.1056">Leo keywords were mostly being coloring under the keyword settings.</t>
<t tx="ekr.20040403120534.1057">Using Ok, Cancel &amp; Revert buttons is _much_ better than Ok, Apply, Cancel because changes are made instantly.  The only problem is that the modal dialog makes it impossible to change text.  But with just a little foresight the user could create a "test" document beforehand.</t>
<t tx="ekr.20040403120534.1058"></t>
<t tx="ekr.20040403120534.1059">Leo now uses the xml_version_string configuration setting, if present, to override the UTF-8 setting used in all previous versions of Leo.  The usual value of the setting is = ISO-8859-1.  This effective changes Leo's file format: older versions of Leo will not be able to read the new files.

If the setting does not exist, whatever value is present in the .leo file will be written when the file is written.  For new files, a value of ISO-8859-1 will be used when this setting is not present.

Notice that this also affects what is written to the clipboard.</t>
<t tx="ekr.20040403120534.1060"></t>
<t tx="ekr.20040403120534.1061"></t>
<t tx="ekr.20040403120534.1062">Used the following to bind callbac:

@color

for i in xrange(len(self.recentFiles)):
	name = self.recentFiles[i]
	callback = lambda n=i: self.OnOpenRecentFile(n)
	recentFilesMenu.add_command(label=name,command=callback)
	
@nocolor
</t>
<t tx="ekr.20040403120534.1063"></t>
<t tx="ekr.20040403120534.1064"></t>
<t tx="ekr.20040403120534.1065"></t>
<t tx="ekr.20040403120534.1066"></t>
<t tx="ekr.20040403120534.1067">1. The @comment directive no longer suppresses syntax coloring.

2. Directives (but not doc parts) are colored when @language plain is in effect.  The user can, as always, suppress all coloring by using @nocolor.

The new rules are much more natural than the old, and much less confusing.</t>
<t tx="ekr.20040403120534.1068">This was a bit of a fiasco.  I updated CVS without a real test.  Hopefully I'll learn from this.

Anyway, the REM hack is as follows:  Leo will convert underscores in the @comment directives to significant spaces.  For example,

@comment REM_

causes the comment delimiter to be "REM " (Note the trailing space).

I originally inserted a skip_space in sentinelKind where the comment was "Do not skip spaces here!".  However, I eventually settled on a better solution, namely making spaces significant in scanHeader. To quote from scanHeader:

"Leading whitespace is now significant here before the @+leo.  This is part of the "REM hack".  We do this so that sentinelKind need not skip whitespace following self.startSentinelComment.  This is correct: we want to be as restrictive as possible about what is recognized as a sentinel.  This minimizes false matches."</t>
<t tx="ekr.20040403120534.1069">The "comment" code was looking for "language", not "comment" in dict.</t>
<t tx="ekr.20040403120534.1070">I'm proud of the code: it is simpler, clearer and more general than the previous code.

There were several important breakthroughs:

1. The old divideSplitter routine had hard binding to various panes.  This was wrong.  The new divideAnySplitter routine uses params for all frames, so it can be general.

2. The key invariant is that self.splitVerticalFlag tells the alignment of the main splitter.  Getting clear about this was crucial to making everything work.  I could then split the old divideSplitter routine into divideLeoSplitter and divideAnySplitter.  Once that happened, everything just worked when I changed self.splitVerticalFlag from true to false in frame.__init__ (!!)

3. We shouldn't ever delete any frames when toggling the split direction.  It's just too hard to reinitialize them.  The key to making this happen are:

a) the calls to pack_forget and
b) creating placeSplitter from the old createSplitter (now createLeoSplitter) code.

4. The key invariant allows us to define onDragMainSplitBar and onDragMainSplitBar instead of the old onDragVSplitBar and onDragHSplitBar. The new routines work regardless of split direction, so we don't have to rebind the split bars when the split direction changes.</t>
<t tx="ekr.20040403120534.1071"></t>
<t tx="ekr.20040403120534.1072"></t>
<t tx="ekr.20040403120534.1073">Change c.initJoinedCloneBit to c.initJoinedCloneBits.</t>
<t tx="ekr.20040403120534.1074"></t>
<t tx="ekr.20040403120534.1075"></t>
<t tx="ekr.20040403120534.1076"></t>
<t tx="ekr.20040403120534.1077">Added @root node to root of tree and eliminated @language and @others directives.</t>
<t tx="ekr.20040403120534.1078">Importing a Python file containing classes without methods results in nested classes.  A workaround is to insert a dummy method in each class.

The fix was to define classIndent and defIndent variables, and to ensure that we break on equality with these values.  Also changed code to generate reference to methods only if methods or nested classes were seen.

There is still a minor bug:  The following

class A:
	pass

Puts the pass statement in &lt;&lt; class A declarations &gt;&gt;.  This bug is not so easy to fix, and it is easy to correct by hand.</t>
<t tx="ekr.20040403120534.1079">Importing the following file creates orphan nodes for declaration.

import sys # This line becomes an orphaned node
class C:
    xyz = 'xyz' # This line becomes an orphaned node
    def __init__(self):
        pass

The fix was in &lt;&lt; Create a child node for declarations &gt;&gt;.</t>
<t tx="ekr.20040403120534.1080">Importing the following script

class C:
    def __init__(self):
        pass

created an outline with class C appearing in two nodes, something like:

class C:
        class C:
                def __init__(self):
                    pass

The fix was to &lt;&lt; Append a reference to class_vnode's methods &gt;&gt;.</t>
<t tx="ekr.20040403120534.1081"></t>
<t tx="ekr.20040403120534.1082">This fixes a bug involving clone bits, and is much faster than calling c.initAllCloneBits.  The code involves c.moveOutlineRight and similar code in the undo and redo logic.</t>
<t tx="ekr.20040403120534.1083">Verified that u.undoReplace will handle all clones properly.  c.copyTree simply makes copies of all tnodes after v.copyTree has actually copied the tree.  These are really simple and elegant routines.</t>
<t tx="ekr.20040403120534.1084"></t>
<t tx="ekr.20040403120534.1085">The new "replace" paradigm greatly simplifies complex undo.  The ahas:

1. swap_links is a very simple way of replacing trees.
2. The caller of swap_links can easily redo join lists and clone info.
3. We need to use new tnodes in copied trees.  This hasn't been done yet.
4. Undo and redo use exactly the same code.</t>
<t tx="ekr.20040403120534.1086">The aha is this: the import commands are in essence nothing but an insertion of a tree rather than a single node, so exactly the same code will work for undo and redo!</t>
<t tx="ekr.20040403120534.1087">@ It is often useful to print a traceback message when a try block unexpected fails.  This can be done as follows:
@color

import traceback
try:
	...
except:
	# traceback.print_exc()
	pass</t>
<t tx="ekr.20040403120534.1088"></t>
<t tx="ekr.20040403120534.1089"></t>
<t tx="ekr.20040403120534.1090"></t>
<t tx="ekr.20040403120534.1091"></t>
<t tx="ekr.20040403120534.1092"></t>
<t tx="ekr.20040403120534.1093">This is important, because it means that invalid entries in, say, the Default Tangle Directory preference will no longer abort an attempted read.</t>
<t tx="ekr.20040403120534.1094">This is a little tricky.  The general rules are:

1. Settings in the [override .leo file prefs] section of leoConfig.txt override similar settings that exist in the &lt;preferences&gt; element in .leo files.

2. You may cancel this overriding by using "ignore" (without the quotes) as the value of a setting in leoConfig.txt.  For example:

[override .leo file prefs]
tab_width = ignore

In this example, Leo will use the tab width in each .leo file, or a default value if it doesn't exist.

3. Leo won't write overridden settings to .leo files.

The actual rules are as follows:

1. If a setting is not found in either the [override .leo file prefs] section of leoConfig.txt or the preferences section of the .leo file, Leo uses a default, hard-coded value.

2. When reading a .leo file, Leo will use settings in the [override .leo file prefs] section of leoConfig.txt unless the value of the setting is "ignore" (without the quotes).  Case is insignificant when specifying the value of default_target_language.

3. When writing leoConfig.txt, Leo will write settings in the [override .leo file prefs] section of leoConfig.txt if the setting exists in leoConfig.txt and its value is not "ignore" (without the quotes).

4. When Leo saves a .leo file, Leo updates leoConfig.txt (using rule 3) and Leo will write a Preferences setting to the .leo file only if the setting will not be written to leoConfig.txt using rule 3.  NB: this rule does not change Leo's file format because all atrributes of the &lt;preferences&gt; element have always been optional.

5. Leo will update leoConfig.txt (using rule 3) whenever the user closes the Preferences Panel successfully.

As the result of these rules, changes made in the Preferences Panel will become permanent immediately if the the setting will be written under rule 3.  Otherwise, the change will become permanent when any .leo file is saved.

I believe these rules are flexible and good.</t>
<t tx="ekr.20040403120534.1095"></t>
<t tx="ekr.20040403120534.1096">These commands convert an entire tree.</t>
<t tx="ekr.20040403120534.1097"></t>
<t tx="ekr.20040403120534.1098"></t>
<t tx="ekr.20040403120534.1099">It is important not to change the c. copies of these ivars.</t>
<t tx="ekr.20040403120534.1100">These are actually quite nice to have, and they are possible only because we have a modal dialog.</t>
<t tx="ekr.20040403120534.1101">This makes it absolutely clear what is happening.</t>
<t tx="ekr.20040403120534.1102">Added @language to all @file nodes.  This is good style.</t>
<t tx="ekr.20040403120534.1103"></t>
<t tx="ekr.20040403120534.1104">Gary Herron suggested this change.  This affects a number of commands.  Apparently this makes a difference in Linux...</t>
<t tx="ekr.20040403120534.1105">This allows us to remove the c.setIvarsFromPrefs routine.  I have left it in as a reminder of what needed to be done formerly.

Removed app().prefs and all references to it.</t>
<t tx="ekr.20040403120534.1106">This variable should _not_ be eliminated!  It is needed when reading the .leo file for the first time.</t>
<t tx="ekr.20040403120534.1107">These commands now set self.mFileName only if the dialog succeeds.  This is much more natural.</t>
<t tx="ekr.20040403120534.1108"></t>
<t tx="ekr.20040403120534.1109">This was a weird one.  I have no idea what I was thinking about!  Using c.openDirectory makes absolutely no sense.  Probably the c.openDirectory ivar should go away!</t>
<t tx="ekr.20040403120534.1110">The whole preferences issue needs rethinking and reworking...</t>
<t tx="ekr.20040403120534.1111"></t>
<t tx="ekr.20040403120534.1112">DEMOTE:

  Doc: The Demote command makes all the siblings of a node children of
  the node.

  Reality: Not quite: it makes all sibilings WHICH FOLLOW a node into
  children
</t>
<t tx="ekr.20040403120534.1113">LOG WINDOW:

  Doc: The Open Log Window command opens the window, and the Close Log
  Window command closes it.  Only one of these commands is present in
  the Window menu at any time.

  Reality: These don't seem to exist.
</t>
<t tx="ekr.20040403120534.1114">INSERT HEADLINE:

  Doc: The Insert Headline command inserts a new headline as the next
  sibling of the currently selected headline.  If the root headline is
  selected, this command inserts the new headline as the first child
  of the root.

  Reality: Insert Headline appears to insert a child if the current
  headline has any children, and it appears to insert a sibling
  otherwise.
</t>
<t tx="ekr.20040403120534.1115">EXTRACT SECTION COMMAND:

  Doc: The Extract Section command creates a new node ...

  Reality: The menu item is highlighted (no mater what the first line
  contains), but NOTHING HAPPENS (no mater what the first line
  contains).

Leo.py works correctly.  Fixed docs.</t>
<t tx="ekr.20040403120534.1116">SYNTAX COLORING

  Is never highlighted so can't be used


FONT PANEL:

  Is never highlighted so can't be used

</t>
<t tx="ekr.20040403120534.1117">At long last cut/paste works properly!

1.  The way to get the contents of the clipboard is:

s = app().root.selection_get(selection="CLIPBOARD")

The following does _not_ work:

s = app().root.selection_get(selection="clipboard")

2.  Added stringIsValidMoreFile and convertMoreStringToOutlineAfter to leoImport.py.  These routines just convert the string to an array and call stringsAreValidMoreFile and convertMoreStringsToOutlineAfter.

3.  Removed app().clipboard ivar.</t>
<t tx="ekr.20040403120534.1118"></t>
<t tx="ekr.20040403120534.1119">Once again, things are easier with Python than I expect.  The ConfigParser class is quite nice: it gives a flexible framework for all kinds of preferences.  It would be good to move most, if not all, preferences into this framework.

Note: we no longer need to change the format of .leo files to handle new kinds of preferences!  Indeed, we can just define new sections of leoConfig.txt!

Leo reads and writes leoConfig.txt.  Leo looks first in sys.leo_config_directory.  If that has not been set in sitecustomize.py, then Leo looks in app().loaddir.

</t>
<t tx="ekr.20040403120534.1120">This assert isn't useful and doesn't have to be true.</t>
<t tx="ekr.20040403120534.1121">Added code to recover the old .leo file if the write fails.  We create a backup (.bak) file by renaming the .leo file if it exists.  If there is a write error, we rename the .bak file back to .leo.  Otherwise, we just delete the .bak file.</t>
<t tx="ekr.20040403120534.1122">This was so easy...It should have been done ages ago.</t>
<t tx="ekr.20040403120534.1123">LeoDocs.leo now matches Leo's web site as closely as possible.  At this point, I consider Leo's documentation completely finished.</t>
<t tx="ekr.20040403120534.1124">The solutions to the control-H bug was to call v.edit_text.focus_force() in tree.editLabel().

Adding a call to es() in endEditLabel() makes everything work, at least on XP, but this is too strange.  I finaly fixed the problem by having c.insertHeadline call c.endUpdate(false) followed by c.tree.redraw_now().  This is pretty kludgy. Apparently the call to c.endUpdate() was redrawing the outline after the headline had been selected, with the usual bad results.  </t>
<t tx="ekr.20040403120534.1125">I removed a binding that resulted in double-clicks in headlines expanding or contracting nodes.  You can expand or contract headlines now by double-clicking a node's headline or by clicking its plus/minus box.

This change was requested by Bill Drissel.</t>
<t tx="ekr.20040403120534.1126">I have spent quite a bit of time on getting dragging to work as smoothly as possible.  This has been made more difficult because I know of know way of reading the state of the mouse button without generating a mouse-moved event.

To start a drag, press the main (left) mouse button while the cursor is over the icon for a node.  The cursor will change to a hand icon. Continuing to drag the mouse will scroll the outline pane if the hand cursor moves above or below the outline pane.  If you release the mouse button while the hand cursor is above another icon, Leo will move the dragged node after the node over which the cursor rests.  If you release the mouse button when the hand cursor is not over an icon, Leo will print "not moved" and leave the outline pane as it is.  This can result in the dragged node not being visible on the screen, but it seems less alarming not to force the current node to become visible as that would undo any scrolling that has just been done.

As usual, there are a number of details.  

1. Leo only allows dragging from one icon to another.  In particular, you can't move a node to the first child of another node unless that node is already expanded.   I experimented with automatically open nodes when the cursor moves over an unexpanded node with children.  However, this was highly confusing.  It seems less alarming to expand and contract nodes explicitly. 

2. Leo scrolls the outline pane as the result of mouse-moved events, so to continue scrolling you must keep moving the mouse.  I experimented with scrolling the outline pane whenever the cursor is dragged outside it, but the results are not good.  There was a noticable delay between releasing the cursors and halting the scrolling.  The present code is simpler and more likely to work on all platforms.</t>
<t tx="ekr.20040403120534.1127">Note that tangle.scanAllDirectives already did this.</t>
<t tx="ekr.20040403120534.1128"></t>
<t tx="ekr.20040403120534.1129">es() failed if log is None because log.newlines does not exist.  The new code alters log.newlines only if log is not None.</t>
<t tx="ekr.20040403120534.1130">Leo takes an exception.  It may be because tcl 8.3.4+ is required.  The download tcl is 8.3.4.2, but I'm not sure what version is included in Python 2.2.1.</t>
<t tx="ekr.20040403120534.1131"></t>
<t tx="ekr.20040403120534.1132">In particular, the theory of operation for Tangle and Untangle was eliminated by mistake several months ago.</t>
<t tx="ekr.20040403120534.1133"></t>
<t tx="ekr.20040403120534.1134">There were two problems in this area.  First, v.moveToRoot wasn't preserving the tree when a node was moved to the root.  This caused nodes to disappear.  Second, the code wasn't taking care to change c.tree.rootVnode as needed when nodes moved up or down.

Several important routines had to be changed.  v.moveAfter and v.moveToNthChild now are careful to set c.tree.rootVnode if the root changes.  I hacked v.moveToRoot and v.linkAsRoot so that they update c.tree.rootVnode only if the oldRoot param is not None.  This allows the init code to work properly, and allows the v.moveToRoot routine to properly link in the rest of the tree.  The undo and redo code now use the new param to v.moveToRoot.</t>
<t tx="ekr.20040403120534.1135">@nocolor

The new code isn't great, and it seems to solve the immediate problem.

@color

try: # 5/27/02: We can get Unicode strings here via cut/paste.
	try:
		self.outputFile.write(s)
	except UnicodeError:
		self.outputFile.write(`s`)
except:
	es("error writing:" + `s`)</t>
<t tx="ekr.20040403120534.1136">After creating some clone nodes with the Borland version of Leo, LeoPy.leo was corrupted.  Reading the damaged file with Read Outline Only works, so apparently the problem involves the clone indices in the derived files.

The problem was that not all the code in atFile::updateCloneIndices got copied back to the Borland code.  In particular, clone indices were not cleared before being reassigned!</t>
<t tx="ekr.20040403120534.1137"></t>
<t tx="ekr.20040403120534.1138">Added skip_matching_delims utility function.</t>
<t tx="ekr.20040403120534.1139">Removed extra whitespace between sections.

Fixed bug in convertCodePartToWeb: added code to skip @file line.</t>
<t tx="ekr.20040403120534.1140">This was an attempt (probably futile) to fix a crash in cut/paste logic.</t>
<t tx="ekr.20040403120534.1141">This allows the the last filename used to be the default for the Outline To Noweb dialog.</t>
<t tx="ekr.20040403120534.1142">We generate &lt;&lt;*&gt;&gt;= only if no file name is given in @root or @file.  The old code always generated * for @root.

Also, changed &lt;&lt; append head_ref &gt;&gt; so that @c generates &lt;&lt;fileName&gt;&gt;= instead of &lt;&lt;*&gt;&gt;= whenever possible.</t>
<t tx="ekr.20040403120534.1143">I rewrote isDocStart.</t>
<t tx="ekr.20040403120534.1144"></t>
<t tx="ekr.20040403120534.1145"></t>
<t tx="ekr.20040403120534.1146">Moving an outline up before the "root" node hung in v.setDirty.

The fix was in c.moveOutlineUp: we must call v.moveToRoot, followed by back.moveAfter.  To make this work, v.moveToRoot must leave the mFirstChild link unchanged.

Fixes were also needed in undo.undo() and undo.redo() to handle this special case.</t>
<t tx="ekr.20040403120534.1147">This fixed a bug that caused Leo to hang when syntax coloring noweb code with the CWEB syntax colorer.</t>
<t tx="ekr.20040403120534.1148">This routine must take into account the kind of file being imported.</t>
<t tx="ekr.20040403120534.1149">There are many details here.  The present code handles substantial code well, and looks good.</t>
<t tx="ekr.20040403120534.1150">The green used by IDLE looks really good to me.</t>
<t tx="ekr.20040403120534.1151">The code now purports to work for both CWEB and noweb files.</t>
<t tx="ekr.20040403120534.1152"></t>
<t tx="ekr.20040403120534.1153">Outline To Noweb creates &lt;&lt; * &gt;&gt; sections when it doesn't know what name to give something.  This may be partially correct, or entirely wrong.</t>
<t tx="ekr.20040403120534.1154">Please note that the same mechanisms work unchnaged for both @root and @file trees.</t>
<t tx="ekr.20040403120534.1155">I hacked the Python and Java code (hacks on hacks) to insert nodes to carry @others commands when generating @file trees.  The Python code now handles nested classes fairly well.

At this point I'm not sure what is a bigger kludge, the "parsing" parts or the "code generation" parts.  I really don't want to do full parsing here, but the present code is pretty wild.  OTOH, it works.

Fixed bug in skip_pascal_string.

Split the Import Files command into Import To @file and Import To @root.</t>
<t tx="ekr.20040403120534.1156"></t>
<t tx="ekr.20040403120534.1157">Debugged the Import Files command for .py files.  The main problems were getting the params to the scanPythonX routines correct: these were just transcription problems.

Fixed 2 bugs in the colorizer: it wasn't handling Python triple strings or C preprocessor directives properly.

Fixed a bug in skip_python_string.  It was returning the start of the ending delim, not past it.</t>
<t tx="ekr.20040403120534.1158">It only took an hour.  I am amazed this hasn't been done long ago.</t>
<t tx="ekr.20040403120534.1159"></t>
<t tx="ekr.20040403120534.1160">Issue the "reading:" message only if the file can be opened.
Eliminated the #--- error reading x" message before read errors.</t>
<t tx="ekr.20040403120534.1161">Added a return value to update_def so that skip_body can tell if a node has been changed.  skip_body now calls v.trimTrailingLines only if the node has changed.</t>
<t tx="ekr.20040403120534.1162">Untangle was setting the pane changed even when not reporting any changes.  This was due to a call to v.trimTrailingLines.  Changed v.setBodyStringOrPane so that it calls c.setChanged and v.setDirty only if the new text is different from the old, but this doesn't completely solve the problem.</t>
<t tx="ekr.20040403120534.1163">These are helpful in leo.py because the commands are slower than in LeoCB.</t>
<t tx="ekr.20040403120534.1164"></t>
<t tx="ekr.20040403120534.1165"></t>
<t tx="ekr.20040403120534.1166">The code mistakenly set part to zero before calling update_def, with the result that the wrong parts were compared.  This simple blunder took several hours to find.</t>
<t tx="ekr.20040403120534.1167"></t>
<t tx="ekr.20040403120534.1168"></t>
<t tx="ekr.20040403120534.1169"></t>
<t tx="ekr.20040403120534.1170">Documented new file format, unlimited undo/redo, auto indent, Contract Parent and Sort Siblings commands.</t>
<t tx="ekr.20040403120534.1171">Note: this code is still untested and very likely has major bugs.</t>
<t tx="ekr.20040403120534.1172">I did this to reasssure myself that such changes were benign, and they are: all files Tangle and Untangle as before.  Also, @space (or @doc) is needed at the start of all doc parts so that Leo2 will syntax color them properly.

This took quite a bit of time, and I really should do this for all of LeoCB.leo, or alternatively, convert all of LeoCB.leo to @file trees.  I'll probably leave this as an exercise for someone else to do ;-)  Actually, the proper way to do this is probably to write a Python script.</t>
<t tx="ekr.20040403120534.1173">The code is straightforward.</t>
<t tx="ekr.20040403120534.1174"></t>
<t tx="ekr.20040403120534.1175"></t>
<t tx="ekr.20040403120534.1176">Fixed &lt;&lt; Scan and define an @code defininition &gt;&gt; and &lt;&lt; Scan and define a section definition &gt;&gt; in skip_body.  The calls to skip_code were setting k, not i.  I'm not sure how Tangle could ever have worked before.  Perhaps a reversion of some kind.

With these fixes, all files are tangled identically by LeoCB and leo.py.

Removed trailing lines in code part in st_enter.  With this change almost all files compare identical except those containing (!newline).  Fixed a bug in put_section which caused whitespace not to be properly output after (!newline).  With this fix leo.py tangles all files in tangleTest.leo exactly the same as LeoCB!</t>
<t tx="ekr.20040403120534.1177">One bug remains in the Borland version and will probably never be fixed: Preferences settings do not stick to windows.  This is a result of using the arg_xxx vars rather than ivars.</t>
<t tx="ekr.20040403120534.1178"></t>
<t tx="ekr.20040403120534.1179"></t>
<t tx="ekr.20040403120534.1180">It is intolerable to have misleading syntax coloring.  The syntax colorer treats @c just like @code.  Tangle must do the same.</t>
<t tx="ekr.20040403120534.1181">Made the root arg optional.  If present it is a list with one element and is_special_bits checks for @root.  We pass a list of one element to is_special_bits so we can distinguish between None and [None].

Removed @owncolor code.</t>
<t tx="ekr.20040403120534.1182">In leoFrame.py: make the font size platform-dependent.
In leoTree.py: use os.path.join to join Icons and file names.</t>
<t tx="ekr.20040403120534.1183"></t>
<t tx="ekr.20040403120534.1184">''' wasn't handled like """</t>
<t tx="ekr.20040403120534.1185">pychecker is a marvelous tool.  It fixes most of the problems that compilers fix.</t>
<t tx="ekr.20040403120534.1186">Caught by pychecker:  the call to special_bits was missing the i param.  This would cause a fault when executed.</t>
<t tx="ekr.20040403120534.1187">changed mStartSentinelComment to self.startSentinelComment.
changed mEndSentinelComment to self.endSentinelComment.</t>
<t tx="ekr.20040403120534.1188">changed writeError to self.writeError.</t>
<t tx="ekr.20040403120534.1189">Changed message to self.message in BadLeoFile.__init__.

Changed param to es in getTnode().</t>
<t tx="ekr.20040403120534.1190">Initialized s to "" in moreHead.

Note: v.trimTrailingLines does nothing(!)

removed v.saveOutlineWithLevel.  This uses dvnodes and is old, old code.

removed v.setThreadLinks.  This was a bad idea that should have gone away a long time ago.</t>
<t tx="ekr.20040403120534.1191">x Changed all arg_ vars to ivars in scanAllDirectives:
	arg_present_language --&gt; self.language
	arg_tab_width --&gt; self.tab_width
	arg_page_width --&gt; self.page_width
	arg_use_header_flag -&gt; self.use_header_flag
	These will affect the @comment and @language directives!
x Changed set_root_delims() to self.set_root_delims()
x Changed end_sentinel_len to len(end_sentinel)
x Changed sentinel_end to self.sentinel_end in scanDerivedFile.
x Added c = self.commands in massage_block_comment. (This routine is never used, though).
x Removed extra param to match in put_section.
x Initialized code = None in skip_body.
x Initialized path in untangleRoot before error messages that use path.
x Used marked_flag properly in untangleMarked.</t>
<t tx="ekr.20040403120534.1192">A weird one: LeoCB was removing the last character (typically half of a cr-lf combination), probably in the mistaken belief that it was an end-of-file character.  Geeze:  how do C++ programs ever work when you have to deal with minutia like eof marks and 2-character newlines.  Tk has really spoiled me.

I added code to leo.py to ensure that even compressed derived files end in a newline, which will help.</t>
<t tx="ekr.20040403120534.1193"></t>
<t tx="ekr.20040403120534.1194">Emailed Guido.  He indicated that the fix just involves filenames, so I took a look at it immediately.  Used Leo to study the code and made a simple fix.</t>
<t tx="ekr.20040403120534.1195">This fixes a serious hole in Leo:  The read logic would crash (report corrupted sentinels) if what follows a reference looked like a sentinel line!</t>
<t tx="ekr.20040403120534.1196">It turns out to be easy to suppress newlines between sentinels.  It is a bit harder to make the read logic work properly.

By single-stepping through the Borland code (which also fails when newlines are suppressed) I see that there is logic in scanText that checks for a non-blank line after a +body sentinel!  By adding a check to see that the next line is not another sentinel line we can make the read logic work properly.

I wonder: suppose the text after a reference looks like a sentinel?  What happens then?</t>
<t tx="ekr.20040403120534.1197"></t>
<t tx="ekr.20040403120534.1198">Fixed a bug that for all languages (like Python and Perl) that do not have block comments.  The change was to update_def.</t>
<t tx="ekr.20040403120534.1199">Three characters were colored blue at the start of a section def in:
  &lt;&lt;name&gt;&gt;=
The fix was to change k to 2 in one spot.</t>
<t tx="ekr.20040403120534.1200"></t>
<t tx="ekr.20040403120534.1201">This is the only undoable command.  Now it puts up a dialog saying that.</t>
<t tx="ekr.20040403120534.1202"></t>
<t tx="ekr.20040403120534.1203"></t>
<t tx="ekr.20040403120534.1204">Optimize Undo Typing by suppressing the "oldText" entry in the dict if the previous entry was "Typing" and the vnode match.  This optimization saves almost half the space used in the bead list!

Verified that the Change All and Read @file Nodes commands call clearUndoState().

The "Cut", "Copy", "Delete", "Change", "Convert Blanks", "Indent", "Undent" are now undoable.  The only change was a new param to the body key handler.

Created onBodyWillChange event handler.  We must distinguish between commands like "Find, Then Change", which must call onBodyChanged, and commands like "Cut" and "Paste" that must call onBodyWillChange.  The former commands have already changed the body text, and that change must be captured immediately.  The latter commands have not changed the body text, and that change may only be captured at idle time.

Keystrokes in the headline are now undoable.</t>
<t tx="ekr.20040403120534.1205">The code is hardly more complex than the old limited code.  In many places it is simpler.

The code now saves only the "optional" ivars that are non-None.  This should be an important space optimization for "Undo Typing".

While messing with Undo in the body pane I realized I could simplify idle_body_key a bit.  I believe this is important.</t>
<t tx="ekr.20040403120534.1206"></t>
<t tx="ekr.20040403120534.1207">alt-v now work in @nocolor mode.</t>
<t tx="ekr.20040403120534.1208"></t>
<t tx="ekr.20040403120534.1209"></t>
<t tx="ekr.20040403120534.1210">Almost all of the logic is language independent!

Added keywords for c,pascal,perl &amp; python.</t>
<t tx="ekr.20040403120534.1211">skip_doc must test for actual strings, not the return value from token_type.</t>
<t tx="ekr.20040403120534.1212">This was a fix to the syntax colorer only.

Also colored the equal sign in &lt;&lt;name&gt;&gt;=.</t>
<t tx="ekr.20040403120534.1213">Added undoers for Cut/Past Node commands and Sort commands.

Apparently the Copy Node command has no undo consequences.

Added calls to clearUndoState for Read and Import commands.  Actually, the Import commands could easily be undone: they are just like insert commands.

Decided not to clear the undo state after Save commands.  Do so is confusing and seems pointless.  I may revisit this issue when implementing Unlimited Undo.</t>
<t tx="ekr.20040403120534.1214">These are not present in the CVS tree.  They should be.

c2py.py, openLeo.py, tangle_done.py, untangle_done.py, __init__.py.</t>
<t tx="ekr.20040403120534.1215"></t>
<t tx="ekr.20040403120534.1216">Most problems had to do with changing c.undoX to c.undoer.undoX or u.undoX.

Everything with an undoer now works.

Cut/Copy/Paste Nodes have no undoers.
Sort commands have no undoers.</t>
<t tx="ekr.20040403120534.1217">Apparently WinCVS is set up appropriately.  Remember to use my corrct password

Did a checkout from the create menu and everything went well!</t>
<t tx="ekr.20040403120534.1218"></t>
<t tx="ekr.20040403120534.1219">It is clear that broken clone links can't be mended automatically.  That is, Leo can't be made significantly more CVS friendly.  That being so, let us consider how to use CVS with Leo.

Our goal is this: we don't want clone links to break when we check derived files into or out of the repository.  In general, clone links will break whenever we a read derived file from a .leo file different from the .leo file that created it.  So to meet our goal we must obey the following rules:

Rules for using Leo files with CVS:
	
1. All derived files in a particular revision in the CVS repository must be generated by a single .leo file. Call that file the _generating_ .leo file (for the revision as a whole and for each derived file in particular).
	
2. When we check out files from the repository we must check out the generating .leo file in addition to the derived files that we are checking out.

3. When we check in files to the repository we must check in the single .leo file that generated the derived files that we are checking in.

4. When CVS detect update conflicts in derived files, developers must resolve those conflicts in a "merged" .leo file.  All derived files that are later checked in must be derived from this .leo file.  When creating this merged .leo files, developers should take care to retain clone links.  

These rules make a virtue out of necessity.  I always envisioned that update conflicts would have to be resolved in .leo files rather than derived files.  What I now see is that this is the also the only way to prevent clone links from being broken.</t>
<t tx="ekr.20040403120534.1220">Just after I completed the Mending Dialog I realized that the concept behind this dialog was fatally flawed: cloned nodes must have the same structure!

Indeed, at the time the Mend Clone dialog is put up, the user would have no way of knowing whether any joins made sense.  Conceivably Leo could test for structural simularity, and in that case this dialog would be useless.  Note: many read errors arise from structural mismatches; clones could never be mended properly in those cases.

About the only situation in which mending would be possible is if the only differences between trees were outline differences.  This suggests that we don't test headline text at all and just rely on structure identity.</t>
<t tx="ekr.20040403120534.1221">This dialog returns a list of pairs of names.  It is up to the caller to associate the names with vnodes.</t>
<t tx="ekr.20040403120534.1222"></t>
<t tx="ekr.20040403120534.1223"></t>
<t tx="ekr.20040403120534.1224">Moved these out of the frame class: the undo class also uses them.</t>
<t tx="ekr.20040403120534.1225">We want to remove only the leading whitespace present on the first line, not all leading whitespace!

Also, the Extract Section command was deleting the section reference line.

I could have sworn I tested these commands.  Apparently not.</t>
<t tx="ekr.20040403120534.1226"></t>
<t tx="ekr.20040403120534.1227">It appears that DnD will be straightforward: probably less then 100 lines of code!</t>
<t tx="ekr.20040403120534.1228">Removed "blank" and "tab" tags on entry.  I thought I did this!  Anyway, it remains to be seen whether this has any effect on the "disappearing" selection bug.

I did some perfunctory tests on the various find/change commands and everything appears to be working well.  We shall see...</t>
<t tx="ekr.20040403120534.1229">Made headlines longer in tree.headWidth(). Sometimes the right edge of a headline was being cut off.  This must be a Tk bug, and the workaround is easy enough.</t>
<t tx="ekr.20040403120534.1230">Cleaned up the code in several ways.  Some of these have been bugging me for a while.

Yesturday I realized that the proper time to clean up code is just _after_ a release.  That way the new code will be thoroughly tested before the next release.

c.tree.currentVnode -&gt; c.currentVnode()
Used keyword.iskeyword() in leoColor.py to test whether a word is a Python keyword.
Used string.endswith() in Import code.
Renamed is_c_word() to match_c_word() to be compatible with the match and match_word names.</t>
<t tx="ekr.20040403120534.1231"></t>
<t tx="ekr.20040403120534.1232">This is used in v.sortChildren and in leoImport.sort testing routine.  Apparently the latest code is about the best that can be done.  Passing a param to the list.sort() routine might seem elegant, and apparently it is slow.  Also, it is not clear how to pass the "n" param to the sort routine. I might challenge the net to do better, but the present code works and is fast, general, elegant and clear.</t>
<t tx="ekr.20040403120534.1233">Experimented with using Python's inspect module.  However, it doesn't provide nearly the level of parsing needed for Leo's import commands.  We need access to the entire parse tree.  It is probably possible...</t>
<t tx="ekr.20040403120534.1234"></t>
<t tx="ekr.20040403120534.1235">Removing from leoUtils import * from reload_all() will cause problems.  The only workaround appears to quit Python when modifying leoUtils.  Sigh.</t>
<t tx="ekr.20040403120534.1236"></t>
<t tx="ekr.20040403120534.1237">This is a really useful command!</t>
<t tx="ekr.20040403120534.1238">This is quite tricky code.  To capture changed values we typically must set a commands method that calls an idle routine. We can't capture the values by binding Button clicks because values haven't changed yet, or so it seems.

Anyway, the preferences panel settings now appear to "stick" to the presently active window.

The print_prefs routine was vital to sorting out what was happening.</t>
<t tx="ekr.20040403120534.1239"></t>
<t tx="ekr.20040403120534.1240">Now the real work begins.</t>
<t tx="ekr.20040403120534.1241">This will serve as a start for CVS.</t>
<t tx="ekr.20040403120534.1242">Added commands handler for all radio buttons.  There was a timing problem: it took 2 clicks to set the current language.  Also added code to recolor the body pane immediately.</t>
<t tx="ekr.20040403120534.1243">It is vital that @file nodes remain dirty until they are written without errors.  Otherwise, a Save command will succeeed without warning, and a later read may cause the dreaded "clones have been cleared" message.</t>
<t tx="ekr.20040403120534.1244">The settings in the Preferences panel now "stick" to the current window.  This turns out to be very important for Tangling: I ran into serious problems with Tangling to the wrong directory when more than one window was open.</t>
<t tx="ekr.20040403120534.1245"></t>
<t tx="ekr.20040403120534.1246">This turns out to be more useful than Sort Children.</t>
<t tx="ekr.20040403120534.1247"></t>
<t tx="ekr.20040403120534.1248">All the "Tangle" Constants must be defined in the same place.  It turns out that leoUtils no longer use any of these constants anyway, so I moved them to leoTangle where they have always belonged.

scanError() is now the only part of leoUtils that uses Tangle data.  It accesses the commands instances using the top() function.  A kludge...

In any event, when I split them I also defined some new values, so values from leoGlobals.py overlapped with values from leoTangle.py.  It is a good thing I caught the problem now...</t>
<t tx="ekr.20040403120534.1249"></t>
<t tx="ekr.20040403120534.1250">Moved the tangle constants into the tangle class.

Changed header to self.header in an error message in scanAllDirective.

The source of the "mismatch" in Utils.h was that somehow I inserted @c into the root of Utils.h, which should produce errors, and eventually it did.</t>
<t tx="ekr.20040403120534.1251">I reset the default tangle directory while doing regression testing, then saved LeoPy.leo.  This destroyed files LeoPy directory, I'm not sure how, so I had to revert.  All looks well now.</t>
<t tx="ekr.20040403120534.1252"></t>
<t tx="ekr.20040403120534.1253">There was a problem with a global change command.  I'll have to do a full regression test of Tangle.  This would be a good time to use the new whitespace utility routines.</t>
<t tx="ekr.20040403120534.1254"></t>
<t tx="ekr.20040403120534.1255">This was the result of a Change All disaster.</t>
<t tx="ekr.20040403120534.1256">We have to update s_text as well as c.body so that another call to search on the same line will find the updated text.</t>
<t tx="ekr.20040403120534.1257"></t>
<t tx="ekr.20040403120534.1258"></t>
<t tx="ekr.20040403120534.1259">Newlines now set the dirty bit.

We increase auto indent after a colon.  This should happen only for Python mode...</t>
<t tx="ekr.20040403120534.1260"></t>
<t tx="ekr.20040403120534.1261">Once again, I am astounded at how easy this is.</t>
<t tx="ekr.20040403120534.1262">Convert Blanks now converts the entire body pane if there is no selected text.</t>
<t tx="ekr.20040403120534.1263">It is doubtful that leo.py will ever support a Print command directly.  Rather, users can use export commands to create text files that may then be formatted and printed as desired.  Tk does provide print support.</t>
<t tx="ekr.20040403120534.1264">Only blanks and tabs are shown, and they not very well.

What we need is a font that shows blanks and tabs as descent symbols for blanks, tabs and newlines.</t>
<t tx="ekr.20040403120534.1265">The key is that two things have to happen:

1. Menu items should be enabled only when focus is in the canvas pane.
2. Bindings for for the outline commands should be added only to the canvas pane.</t>
<t tx="ekr.20040403120534.1266"></t>
<t tx="ekr.20040403120534.1267">A useful convenience method that makes it much clearer what is going on.</t>
<t tx="ekr.20040403120534.1268"></t>
<t tx="ekr.20040403120534.1269"></t>
<t tx="ekr.20040403120534.1270"></t>
<t tx="ekr.20040403120534.1271">Sherlock attempts to read the file SherlockArgs.  If found, each line is assumed to be a separate sherlock argument.

However, the main improvement is defaulting empty arguments to "+*".  This makes tracing as easy to use as print statements.

Could trace accept multiple arguments, just like print?  No: we would lose the ability to specify tracepoints by default.  There is no need to duplicate print!</t>
<t tx="ekr.20040403120534.1272">Very easy to do, compared with other systems.</t>
<t tx="ekr.20040403120534.1273">This should solve some compatibility problems.</t>
<t tx="ekr.20040403120534.1274"></t>
<t tx="ekr.20040403120534.1275">Alt-1 refers to Alt-Button-1, not Alt-Key-1 (!)</t>
<t tx="ekr.20040403120534.1276">Changed frame.put routines so that they return during quitting.

Also removed trace statements from __del__ routines.</t>
<t tx="ekr.20040403120534.1277">We must be careful to enclose all find/change code in c.beginUpdate/c.endUpdate(false) so a redraw after the call to tree.redraw_now() in find.showSuccess won't deselect the headline text.

It would be elegant to cancel any pending redraw in tree.redraw_now, and that does not seem to work.

Because we don't always redraw the screen, we must update icons "by hand" by calling c.tree.drawIcon.

It is very tricky to compute self.in_headline correctly.

Perhaps a more sensible approach would be to have the tree.redraw routine save and restore the editing status and selection of the current headline.  However, the present code works and minimizes redraws, so there isn't much incentive...</t>
<t tx="ekr.20040403120534.1278">The idea was that if all drawing happens at idle time we could do the following:

	Eliminate all c.beginUpdate()
	Eliminate all c.endUpdate(false)
	Replace c.endUpdate() with c.redraw()
	Replace c.endUpdate(flag) with if flag: c.redraw()
	
However, the find command needs to _prohibit_ drawing, and there doesn't seem to be a clean way to do this, so using c.endUpdate(false) seems to be needed.

In other words, without c.endUpdate(false) we would need c.cancelDrawing(), and this doesn't seem any cleaner than the present code.</t>
<t tx="ekr.20040403120534.1279"></t>
<t tx="ekr.20040403120534.1280">I messed things up when I "optimized" the redraw code.  The Find code must redraw the screen _before_ making selections in the headline--otherwise the headline becomes inactive.</t>
<t tx="ekr.20040403120534.1281">Altered the Cut/Copy routines so they set Leo's internal clipboard (app().clipboard).  So to cut from LeoCB to leo.py do the following:

Copy the tree in LeoCB.
Paste the tree into empty body text of leo.py.
Select all the body text and paste.
Move to the tree view, and do a Paste Node.

Yes, this is very clumsy, but how often do we want to transfer information between LeoCB and leo.py?</t>
<t tx="ekr.20040403120534.1282">This is defensive programming.  Only a few event handlers override body handlers:  These include Control-I, Control-T and Control-D.

Exception: the command handlers for cut/copy/paste must _not_ return "break"!  The actual work is done by the Tk.Text widget.</t>
<t tx="ekr.20040403120534.1283"></t>
<t tx="ekr.20040403120534.1284">Now that event handlers return "break" they can do things involving focus that they could not do before.</t>
<t tx="ekr.20040403120534.1285">This is done in frame.createAccelerators().  For the first time leo.py handles keystrokes properly!

We could override _all_ body pane keys, and this would be dangerous until all event handlers return "break."  Indeed, doing so would create duplicate bindings, one for frame.top and one for frame.body, so without a "break" the command would be done twice!</t>
<t tx="ekr.20040403120534.1286"></t>
<t tx="ekr.20040403120534.1287">Event scripts need only return the string "break" to inhibit all further event processing!  This is what I have been missing all along, and it was staring me right in the face.  Sheesh.

This eliminates the need for several kludgy workarounds:
	The double-click event handler no longer needs to wait till idle time.
	The c.moveDown routine no longer needs to call c.select.

Another breakthrough.  Way down at the bottom of the Tk.Text documentation I discovered a list of all the key bindings defined by default in Text widgets.  This includes Control-O, which explains why body text sometimes had blanks lines inserted at the top. (Amazingly, Control-O never seems to have split lines, purely by luck.)

I can now use control-I to insert nodes again!</t>
<t tx="ekr.20040403120534.1288">This is similar to the double-click logic!</t>
<t tx="ekr.20040403120534.1289">We must compute the word to be selected before the Tk.Text widget does its default double-click handling, then actually select the text at idle-time.</t>
<t tx="ekr.20040403120534.1290"></t>
<t tx="ekr.20040403120534.1291">The code was easy to write and worked the first time.  I love Python.  I chose to ignore case in the comparison.

A more elegant solution would be to define a v.__cmp__ method, but the present code is clear enough and works.</t>
<t tx="ekr.20040403120534.1292">Fixed the Tangle Marked command.  It had numerous problems.

The code that executes Leo_done.bat and Leo_un.bat didn't work.  Now these options specify Python scripts to execute, and these scripts are passed a list of filenames that were tangled or untangled.</t>
<t tx="ekr.20040403120534.1293">Created go.bat and openLeo.py.  These simplify the process of starting leo.  Just open a console window and type go.

Added "c:\prog\LeoPy\LeoPy.leo" as default to filename argument to leo.open().</t>
<t tx="ekr.20040403120534.1294"></t>
<t tx="ekr.20040403120534.1295"></t>
<t tx="ekr.20040403120534.1296">The whole-word search only fails if there are two consecutive "in-word" characters at the beginning or end of the supposed match.

Added some logic to make suboutline-only searches work correctly.

In the process, discovered a bug in is_c_id.  It was testing for blank instead of underscore!</t>
<t tx="ekr.20040403120534.1297">tree.select now calls tree.recolor_now instead of tree.recolor.  The result is much better than before.

Did add the tree.updateScheduled ivar and logic.  This ensures that only one redraw ever happens at idle time.  It seems like the body text is drawn much faster now.  This may have been a big performance bug!

At present the performance of leo.py seems excellent.</t>
<t tx="ekr.20040403120534.1298">When the "Move Down" command did nothing the control-d ate the character at the cursor!  The workaround is to have c.moveOutlineDown call c.selectVnode(v) even if nothing happens.  This forces the body text to be restored.</t>
<t tx="ekr.20040403120534.1299">c.makeVisible and even c.beginUpdate/c.endUpdate can be eliminated!  Indeed, the tree class can work as follows:

1. All ancestors of the current node are expanded at the start of tree.redraw.
2. The current node is scrolled into view at the end of tree.redraw.

We want to do the expansion of nodes before drawing so offsets are computed properly.  We must do scrolling after idle tasks are complete so Tk.Scrollbar.get() will return proper values.

Note: we still may want to inhibit drawing even though all drawing happens at idle time.  We don't really need begin/endUpdate to do that:  just keep a flag and call c.redraw() only if the flag is true.

I'm not going to eliminate c.beginUpdate/c.endUpdate just yet.</t>
<t tx="ekr.20040403120534.1300"></t>
<t tx="ekr.20040403120534.1301">Eliminated redundant error messages.
All path problems now generate an error.  This seems safest.</t>
<t tx="ekr.20040403120534.1302">tree.makeVisible and tree.scrollTo are called before the tree is redrawn, so we can't get accurate measurements from the canvas class.  I created tree.yoffset() and tree.lastVisible() to get proper measurements.  The final code is deceptively simple; it took several hours to get it all right.

This is an important step forward because now the screen is drawn properly during interactive search commands.  It would have been intolerable to release Leo with only partly functional Find commands.

There are still "policy" questions about when and how to scroll.  The present code doesn't work smoothly in all cases.  It may be that the Tk.canvas.yview routine doesn nothing in certain unexpected situations.</t>
<t tx="ekr.20040403120534.1303">I have spent several pleasant hours preparing setup.py, manifest.in and sdist.bat.

Create a source distribution (.zip file) by running sdist.bat from c:\prog\LeoPy.

I have not been able to create a .gzip file yet.</t>
<t tx="ekr.20040403120534.1304"></t>
<t tx="ekr.20040403120534.1305"></t>
<t tx="ekr.20040403120534.1306">There was an assignment kind = kind in the section &lt;&lt; set kind for directive &gt;&gt;, so @chapter, @section were never recognized.  Amazingly, this blunder did not seem to affect anything else.

With this this bug fixed, all files in LeoCB.leo are tangled the same by LeoCB and leo.py, except for the first line and whitespace.  The first line is different because LeoCB puts slashes differently than leo.py.

When ignoring only trailing whitespace and blank lines, we see that LeoCB and leo.py differ in how they output (!newline).  LeoCB outputs a single space before (!newline) in put_section(), so this is what leo.py must do as well.

With this bugs fixed, the only differences between LeoCB.leo and leo.py involve leading and trailing whitespace and blank lines.  Tangle works!  Actually, leo.py now does a better job than LeoCB, for the following reasons:

1. leo.py does a good job of deleting trailing blank lines in sections, and this should simplify Untangle.
2. leo.py does a better job of putting leading whitespace than LeoCB, because leo.py more accurately computes the effective width of leading whitespace than does LeoCB.</t>
<t tx="ekr.20040403120534.1307">This allows us to open a file when leo starts.  From the Python interpreter do the following:

import leo
fn = "c:\prog\LeoPy\LeoPy.leo"
leo.open(fn)

The open script is the companion to the run and go scripts.  leo.run() just runs leo.  leo.go() reloads all modules before running. For reasons that I don't fully understand, leo.go() does not always handle leoUtils properly: it is sometimes necessary to do

from leoUtils import *</t>
<t tx="ekr.20040403120534.1308">Actually, clicking on another node should probably reset the "wrap_node", but it doesn't.  Only changing something in the Find panel does that.</t>
<t tx="ekr.20040403120534.1309">Tested paths when Leo invoked directly.
Tested explicit paths in @file nodes
Tested paths in prefs panel.
Tested paths in @path directive.
Tested no path anywhere.

As a result, changed writeError by error in atFile.scanAllDirectives.</t>
<t tx="ekr.20040403120534.1310">frame.defaultDirectory was never being used.</t>
<t tx="ekr.20040403120534.1311"></t>
<t tx="ekr.20040403120534.1312">It appears that putting the following in app.finishCreate will work:

	import leo
	loaddir = os.path.dirname(leo.__file__)

Apparently we can not reference leo.__file__ reliably until leo has been completely imported.  The workaround is to do so in app.finishCreate.  This is a bit mysterious, and it appears to work.</t>
<t tx="ekr.20040403120534.1313">The new path philosophy is as follows:

1. Leo will not call os.chdir except possibly after file dialogs that are not cancelled.  This will leave the file system's current directory (returned by os.getcwd()) unchanged by tangling, importing, reading or writing.

2. Commands that access files (tangling, untangling, reading, writing, importing) call either os.getcwd(), atFile.scanAllDirectives or tangle.scanAllDirectives to set appropriate ivars indicating what the proper default directory will be.

3. These commands open a file as follows, where self.default_directory is set in step 2:

	fn = os.path.join(self.default_directory, fileName)
	f = open(fn,...)</t>
<t tx="ekr.20040403120534.1314">@file trees were not being marked as dirty when cloned headlines outside those trees were changed.  This definitely would have caused errors while reading @file trees!  Fixing this bug is a big step forward.

The fix was to to have v.setDirty() ensure that all cloned nodes are set dirty and that all ancestor @file nodes are set dirty.  I eliminated v.setDirtyJoined() entirely, and eliminated all calls to v.setAncestorAtFileNodeDirty() outside of v.setDirty().  The result is much safer, cleaner and simpler code.

As a side effect, nodes now become dirty when they move.</t>
<t tx="ekr.20040403120534.1315">leo.py used to call chdir from many places to indicate which default directory should be in effect.  That was wrong. From now on, leo.py will call chdir only file dialogs return without being cancelled, that is, for Open, Save and Import commands.

Otherwise, directives will set ivars, and the code will compute full path names using
os.path.join(directory_ivar, pathname).  The neat thing about this is that if pathname already contains a full path name it will override the path in directory_ivar.

For example, the Tangle code now writes the final file like this:

	file_name = os.path.join(self.tangle_directory,section.name)
	... # tangle into temp file
	update_file_if_changed(file_name,temp_name)

This works properly whether or not section.name contains a full path name.</t>
<t tx="ekr.20040403120534.1316">If the present node is expanded, the Paste Nodes command now pastes the pasted node as the first child of the present node, rather than as the next sibling of the present node.</t>
<t tx="ekr.20040403120534.1317">trace(a) prints a if s is a string and executes a() if a is a function.</t>
<t tx="ekr.20040403120534.1318">The symptom of the bug was that it was taking a _long_ time to close windows after doing many interactive find commands.  Actually, it was redrawing the tree that was the real problem.

Disable the recycling of nodes made no difference.  By removing code I isolated the performance bug to the call to tree.redraw in find.showSuccess().  This was very good news, as it meant that the bug was in the tree code rather than in Tk or Tkinter.

The bug was caused by "extra" links to the Tk.text widgets in the vnode, specifically, the v.box_id, v.edit_text_id, v.icon_id and v.box_id ivars.  These links apparently created permanent references that prevented widgets from being deallocated when the tree was redrawn, so a large number of widgets and their binding had to be deleted when the tree was deleted.

The fix was just to eliminate these vnode ivars entirely: they were not being used!  The v.edit_text ivar could not be eliminated, so I added a call to self.edit_text.destroy() just before reallocating.  Perhaps just moving the edit_text would be better than destroying and reallocating it, but that wouldn't be so easy because of the call to self.canvas.destroy("all").</t>
<t tx="ekr.20040403120534.1319">If a clone problem is reported, the @file node is not marked dirty again, so if we save the .leo file and then quit the problem will still exist in the derived file.

This happened in Borland Leo, so it is clear if it is a problem in leo.py.

I recovered by doing a Read Outline Only.</t>
<t tx="ekr.20040403120534.1320"></t>
<t tx="ekr.20040403120534.1321">Moved Tangle utils into Tangle leoTangle.py.  These should be methods because they deal with tangle ivars.

Separated utils that call scanError from other utils.</t>
<t tx="ekr.20040403120534.1322"></t>
<t tx="ekr.20040403120534.1323"></t>
<t tx="ekr.20040403120534.1324">This happened after deleting a clone outside of the tree for @file leoColor.py.  I am not sure of the exact sequence.  Perhaps LeoCB was involved.</t>
<t tx="ekr.20040403120534.1325">This was pretty easy.  I think underlining hyperlinked section references looks good.

Still to do:

1. We need browser-style navigation: forward, up, back, home.

2. We may have to change things for Leo1.</t>
<t tx="ekr.20040403120534.1326"></t>
<t tx="ekr.20040403120534.1327"></t>
<t tx="ekr.20040403120534.1328">I finally realized why c.redraw and c.endUpdate wiped out the edit status:

1.  tree.redraw does not preserve the edit status (it probably should)
2.  tree.redraw only causes queuing of the redraw.  It doesn't happen immediately.

This was causing problems in find.show_success.  My quick fix was to create tree.redraw_now, and then to restore the status as needed.  Another, probably better, way would be to have tree.redraw restore edit status.  Duh.

However, in this case tree.redraw_now is exactly what is needed, so I feel a bit less stupid...</t>
<t tx="ekr.20040403120534.1329">There are a huge number of details to get exactly correct.  It appears that the code is close to working.</t>
<t tx="ekr.20040403120534.1330">I finally realized that v.edit_text is defined only if v is visible on the screen, that is, only if all of v's ancestors are expanded.</t>
<t tx="ekr.20040403120534.1331"></t>
<t tx="ekr.20040403120534.1332">Previously, cloned headlines were not updated in unison.  This could have been the source of some apparent "lost data".  It is remarkable how complex this logic is.

I finally chose to do a redraw in tree.endUpdate() to force headlines in synch.  We can't typically just do a redraw() in idle_headline because that messes up the editing state of v.edit_text.

I also fixed a bug in idle_body that caused control-Q to call c.setChanged() again.  The new code just sees whether the code has caused the text to change: it does not need the value of ch to do that.

idle_headline also now handles all details of marking nodes dirty.  This used to be done partly in undimHeadline.</t>
<t tx="ekr.20040403120534.1333">I made terrible blunder: I eliminated a commands ivar that was involved in writing, so the write failed and wiped out the .leo file.  Since I didn't have a recent backup .leo file, I lost todays notes.

Let this be a lesson to myself:

1.  Backup .leo files _are_ useful for backing up ouline only data.
2.  Make backup of entire LeoPy folder when there are problems.  I came very close to all of today's programming work, which would have been hard to bear.</t>
<t tx="ekr.20040403120534.1334"></t>
<t tx="ekr.20040403120534.1335">We don't need to keep track of the status of control or alt keys!  Instead, we let idle_body_key and idle_head_key compare the old with the new value.  They do nothing on a match.

An important point:  idle_body_key must make sure that v == c.currentVnode.  If it doesn't make this check we will lose data when the user types Control-K to create a new node.

The new code also takes care not to allow any newlines in headline text.</t>
<t tx="ekr.20040403120534.1336"></t>
<t tx="ekr.20040403120534.1337">This code is _vastly_ superior to the Borland code, for several reasons:

1.  Unlike the Borland code, the Python code uses no "state" variables.  This not only greatly simplifies the code, it makes it possible to restart incremental searches after the user has changed nodes or changed postion in body text.

Instead of using state variables in the find class, the code uses the c.currentVnode and the "insert" and "sel" tags of the Tk.text widgets.  This automatically ensures that the state of the search matches the state of the outline and body panes!

2. At last!  I know how to restart incremental searches without using state variables.  The trick is _not_ to call c.endEditing() in the setup routines, so set_in_headline() can use c.tree.editVnode to see if we are editing a headline.  If so, we start there.  OTOH, select_next_v _does_ call c.endEditing() and c.editVnode() to force c.tree.editVnode to have the proper value.

3. Leo now uses Tk.Text widgets for both headline and body text.  This eliminates all the special case code that selects between headline and body searches.  Moreover, the same regular expressions are now used for searches in both headlines and body text.  I doubt I could ever have produced bug-free code without this simplification.</t>
<t tx="ekr.20040403120534.1338">This hugely simplfies the find/change commands, and makes them more capable.

This also solves the "Control-K" problem in headlines.</t>
<t tx="ekr.20040403120534.1339"></t>
<t tx="ekr.20040403120534.1340">The ensure_extension routine was adding a .leo extension, thereby defeating the test for an empty file name.</t>
<t tx="ekr.20040403120534.1341">This code is much cleaner than the Borland code.  The search commands keep almost no state variables now: we always search from the present location.  This hugely simplifies the logic, and makes the code do what is expected more often.

In particular, is no longer any "first_v" or "first_position" state.  The various find and change commands will save the present state on entry, and restore that state if no finds are found.  This "local" save/restore makes much clearer what is happening.

Still to do: searching in headlines.</t>
<t tx="ekr.20040403120534.1342">The save message immediately showed a Save bug.  After doing a Save To, a following Save command used the Save To file name!  This explains why some saves "didn't take".</t>
<t tx="ekr.20040403120534.1343"></t>
<t tx="ekr.20040403120534.1344"></t>
<t tx="ekr.20040403120534.1345">This probably should depend on the size of the window, and at present it does not.</t>
<t tx="ekr.20040403120534.1346"></t>
<t tx="ekr.20040403120534.1347">I have a new toy: Python's exec statement.  This allows one to have all the flexibility found in tcl scripts.  For example, one can treat the name of variables as variables themselves.  Building statements from strings isn't quite as simple as in tcl, but the effect is exactly the same.

The added flexibily is useful when loading and saving many variables, as in the prefs and find code.  For example:

ivars = [ "tangle_batch_flag", "untangle_batch_flag",
	"use_header_flag", "output_doc_flag",
	"tangle_directory", "page_width", "tab_width" ]
	
for var in ivars:
	exec("self." + var + " = c." + var)  # self.var = c.var
	
This exec statement expresses the pattern directly.  Moreover, once the ivars list is defined many similar exec statements are possible.  Using the % operator might be even clearer:

	exec("self.%s = c.%s" % (var,var))</t>
<t tx="ekr.20040403120534.1348">This is tedious code, and Tk makes it much simpler than with other systems.</t>
<t tx="ekr.20040403120534.1349"></t>
<t tx="ekr.20040403120534.1350">Replaced global with app().idle_imported.

Replaced global with fileCommands..  This fixed a big memory botch: previously a new dummy vnode was allocated for every vnode created!

Replaced es_newline global with app().log.es_newline, i.e., frame.es_newline.  This is better than before because each log stream has its own count.</t>
<t tx="ekr.20040403120534.1351">These allow us to reclaim memory when closing a window.  It also showed a that we are wasting lots of space allocating dummy vnodes in the read logic.

With these routines in place, all __del__ routines are eventually being called, which indicates that all circular references are being destroyed by the destroy() routines.  Note that it is _not_ necessary to do any of the following:  del v, del tree, del commands or del frame.  Setting the pointers to None is enough.

Added tree.vnode_alloc_list.  v.__init__ adds items to this list.  tree.destroy removes items from this list.  This is an elegant and powerful solution: all vnodes will be reclaimed eventually, and we don't need to worry about reclaiming them while the window is open.  In particular, this avoids all problems with undo.

Added two new app() ivars to control memory management and tracing.
	self.deleteOnClose	# true: delete all frame objects when a frame closes.
	self.printDel		# true: enable prints in __del__ routines</t>
<t tx="ekr.20040403120534.1352">The frame dtor is never being called because (I think) of circular references throughout the vnode, commands and frame classes.  There are several possible approaches:

1.  Ignore the problem completely.  This makes a lot of sense, for several reasons.
	A: Memory is not an issue, and reclaiming memory at termination time doesn't help!
	B: Memory reclamation can legitimately be called a Python implementation issue.
	C: It takes time and memory to reclaim memory.
	D: Errors in reclaiming memory can lead to intermittent crashes.
	
2.  Create destroy() routine for vnodes, tnodes, commands and frames.  These routines would eliminate links between nodes, thereby freeing Python's references.  The frame.destroy() routine would also call self.top.destroy() to force the closing of the frame's window.  The destroy() routine would also do a del self to reduce the reference count of the object.

Note:  deleting vnodes and tnodes is tricky because of undo.  By far the safest course of action is never to delete these nodes until a window closes.  The easy way to do this is put every vnode in a vnode allocation list, an ivar of the tree class.  Calling tree.destroy() would do the following:

	for v in self.vnode_alloc_list:
		v.destroy()
		del v
		
With this structure in place, the __del__ routines would do nothing.  We could insert a print statement in the routines to show when the routines are actually called.  This would indicate whether circular references remain.</t>
<t tx="ekr.20040403120534.1353">The old code marked the loading headline as changed.  Added c.loading ivar to disable update of window title during loading.</t>
<t tx="ekr.20040403120534.1354">This happens when a save is quickly followed by a quit.  I can get this error when in the Python window, which is reassuring, I suppose.

frame in app().windowList trick doesn't work: very weird.

I enclosed the code in idle_redraw() in a try/except block.  I'm not sure whether this will cure all problems, but it seems like it should.</t>
<t tx="ekr.20040403120534.1355">The old code never got around to deleting the frame, tree and commands objects.

However, del self just decrements the reference count; it does not guarantee that self.__del__ is called.  In fact, it doesn't seem that __del_ is _ever_ called!  So much for cleaning up memory.

There may be a bug here, or perhaps this is just a weirdness of usint Tk or Tkinter.  At this point I haven't a clue.</t>
<t tx="ekr.20040403120534.1356"></t>
<t tx="ekr.20040403120534.1357">This is a strange one.  The problem happens when a save is quickly followed by a quit.  It appears that there is a fault in idle_redraw(), even when the code is locked out with if self in app().windowList.  This is very weird.  Even stranger is that the error traceback never happens when the Python window is opened first (so it stays open).</t>
<t tx="ekr.20040403120534.1358"></t>
<t tx="ekr.20040403120534.1359">Tested c2py.leo1to2() on LeoCB.  The script now works on both Borland and leo.py.

There is a problem with the v.commands method on Borland. The workaround was to pass the value from top() to convertLeo1to2(v,c).</t>
<t tx="ekr.20040403120534.1360"></t>
<t tx="ekr.20040403120534.1361">Once again, I am making faster progress with Python than expected.  Amazing.</t>
<t tx="ekr.20040403120534.1362">I just imported idle and voila: the IDLE IDE is available!

I did have to add r"c:\Python21\Tools\Idle" to sys.path.  I also removed the wxPython stuff from the path: they interfered with the include.

I added a few top-level functions to leo.py that were described in the scripting documentation.

I added the public commands and vnodes methods described in the scripting documentation.  Several of these routines had names that conflicted with ivars.  In those cases I changed x to mX.  The changed vnode ivars were back, firstChild, headString, next and parent.

I also added several vnode and commands methods that were described in the documentation but that did not presently exist.  Like c.findRoot, c.currentVnode, etc.

The script c2py.convertLeoTree(v) appears to work, so leo.py appears to be largely compatible with scripting in LeoCB.</t>
<t tx="ekr.20040403120534.1363"></t>
<t tx="ekr.20040403120534.1364"></t>
<t tx="ekr.20040403120534.1365">I spent almost an entire day messing with focus issues.  There are two choices:

1.  If tree.bodyKeepsFocus is true the body pane will always have focus unless we are editing a headline.  The current headline is highlighted in grey to indicate the tree has no focus.

2.  If tree.bodyKeepsFocus is false the body pane will not have focus if we select a headline by clicking on it.  In that case the curren headline will be white text on a dark blue background.  When focus shifts to the body pane, the current headline will be greyed.

After much experimentation, it seems that the first way is more convenient, though slightly less accurate as far as visual protocol goes.  I think the convenience of having focus in the body pane (where it is useful) outweighs the small visual incongruity of having the current headline be grayed even when the tree canvas is selected.

Warning: Using frame.getFocus() is much less good than using the tree.active flag, because we can edit a headline with at most two clicks.  That is not true when using frame.getFocus()

The bodyKeepsFocus logic affects all routines that alter the highlighting of headlines.</t>
<t tx="ekr.20040403120534.1366">Changed OnCloseLeoEvent so it returns not veto.</t>
<t tx="ekr.20040403120534.1367">TThe body handler didn't call setDirtyJoined.  Changed setDirtyJoined so it returns a redraw flag.</t>
<t tx="ekr.20040403120534.1368">Added virtual_event_name utility to generate &lt; &lt; name &gt; &gt;.  Sigh.

The OnCut, OnCopy and OnPaste routines just call the body key event handler to do syntax coloring and set the various dirty/changed bits.

There is a small glitch: choosing cut/copy/paste "by hand" from the menu doesn't work when the focus is in an edit label in a headline.  I'm not sure how to fix this and it is extremely minor anyway.</t>
<t tx="ekr.20040403120534.1369">Added v param to tree.recolor so we don't assume that v is the current vnode.</t>
<t tx="ekr.20040403120534.1370"></t>
<t tx="ekr.20040403120534.1371"></t>
<t tx="ekr.20040403120534.1372">I tried several options, with no luck: selectborderwidth, selectbackground, selectforground.</t>
<t tx="ekr.20040403120534.1373">Added code to leo.py to set the window icon.  Alas, the documentation is poor enough so that I don't know what the arguments to iconbitmap should be.</t>
<t tx="ekr.20040403120534.1374">I tried a lot of experiments in fileCommands.getGlobals(), and it is still not possible to set the height and width of the top level window properly.  It is still too large, and its size does not depend on the requrested width.

Note that the size of the window is set in createSplitter, by setting the size of a Frame object.  Perhaps this is interfering with matters.

The present situation is poor, but tolerable.</t>
<t tx="ekr.20040403120534.1375">Changed bd="2m" to bd=2.  This makes a big difference in how the panel looks.</t>
<t tx="ekr.20040403120534.1376">The syntax colorers can use tag_config to show tabs and spaces.  This isn't perfect (it doesn't look good now) and does not work for newlines.  It may be better than nothing, however.</t>
<t tx="ekr.20040403120534.1377">I just forgot to add it to the list of @keywords.</t>
<t tx="ekr.20040403120534.1378"></t>
<t tx="ekr.20040403120534.1379"></t>
<t tx="ekr.20040403120534.1380">These "bugs" may be appearing because these commands are always enabled in the menu.  In any case, the fixes were straightforward.</t>
<t tx="ekr.20040403120534.1381">The problem was that the body key handler was being scheduled before the new node was inserted and being called at idle time after the new node was inserted, so the body text disappeared.  The fix was to disabling scheduling if control or alt keys are down.</t>
<t tx="ekr.20040403120534.1382">All it took was the following:

font = tkFont.Font(family="Courier",size=9)
tabw = font.measure("    ")
self.body = body = Tk.Text(...font=font,tabs=tabw...)

This hard codes tabs as 4 spaces.  Later I'll make it more general.</t>
<t tx="ekr.20040403120534.1383"></t>
<t tx="ekr.20040403120534.1384">I am getting closer to getting the look of the splitter panes just right.  Setting bg="white",relief="flat",bd=0 in createSplitter helps quite a bit.

The problem with the tree pane is clearly in the Canvas widget.  If that widget is not packed the pane looks fine.  There seems to be no way to eliminate the canvas's border, and no way to prevent the border from being overwritten by the Entry widget.

Maybe there is a way: the problem may be that Entry widgets are embedded in their own windows...</t>
<t tx="ekr.20040403120534.1385">I will use leo.py from now on to develop leo.py.  It is the only way to really get the bugs out.

Changed the code that computes the length of the edit box for headlines.  We always use len(v.headString) now.  This still does not quite work properly, but it is better.

Fixed a bug in the selection logic.  The colors for the previous headline are changed only if the previous is not the same as the current.  This can happen if we click in the icon or plus/minus icon of the current headline.

Added the v.iconx and v.icony ivars so the tree.OnHeadlineKey routine can just redraw the cursor in place if it needs to change.  This is a workaround to a problem that I haven't been able to solve: namely, how to force the cursor to be visible again after the headline loses focus.  This is more than a little kludgy, especially after creating the elegant endUpdate mechanisim.  OTOH, it may point a way towards incremental redrawing of the screen.</t>
<t tx="ekr.20040403120534.1386"></t>
<t tx="ekr.20040403120534.1387"></t>
<t tx="ekr.20040403120534.1388">Changed "darkblue" to "DarkBlue".  The colors known to Tk are listed at
	http://tcl.activestate.com/man/tcl8.4/TkCmd/colors.htm 

Changed print_stack() to Print statements in es() logic.  This was more confusing than helpful.

Eliminated some accelerators (Linux only)

Added loaddir code to leo.py.
</t>
<t tx="ekr.20040403120534.1389">Added many terms to the Glossary.

Improved description of Leo2.  Partially merged Leo1 and Leo2 documentation.  It still isn't perfect.</t>
<t tx="ekr.20040403120534.1390">Probably very few people could understand the description of Leo2.</t>
<t tx="ekr.20040403120534.1391">I fixed the "last" serious bug in this version.  What was happening was that the clone information in leoFileCommands.py and leoCommands.py was alternatively being written and not being written.  The fix was to v.joinNodeTo:  there was a bug that was fixed in the Borland version that had not been fixed in this version.</t>
<t tx="ekr.20040403120534.1392">It turns out the updateCloneIndices routines in both LeoCB and leo.py are slightly buggy.  Both can increment indices multiple times for the same tnode.  In addition, LeoCB computes indices for parts of the tree beyond the actual tree, so that would increase the indices further, which is why the LeoCB version sometimes has a larger clone indices.

Neither of these "bugs" really makes a difference.  In either case, nodes are joined properly.

To "minimize" the clone indices we would do the following:

	index = 0
	v = root
	# Zero all indices.
	while v and v != next:
		v.t.cloneIndex = 0
	# Set clone index only if it has not already been set.
	while v and v != next:
		if v.t.cloneIndex == 0 and v.isCloned() and v.shouldBeClone():
			index += 1
			v.t.cloneIndex = index
		v = v.threadNext()
		
This might be just slightly slower than the "wasteful" way.</t>
<t tx="ekr.20040403120534.1393">The directory compare routines in the Python lib do not seem to exist.  The new routines compare only .py files.</t>
<t tx="ekr.20040403120534.1394"></t>
<t tx="ekr.20040403120534.1395">The lineIndent var was not set properly in &lt;&lt; Set lineIndent, linep and leading_ws &gt;&gt;, with the result that some sections contained extra leading whitespace in their body parts.

With this bug fixed, leo.py reads and writes all files correctly!</t>
<t tx="ekr.20040403120534.1396">Fixed a bug that was causing the last newline of doc parts to be deleted.  The problem was that string.rstrip() also strips newlines!  With this bug fixed it appears that Leo.py can read and write @file nodes just like Leo2CB does.

Created the removeTrailingWs() in leoUtils that strips trailing blanks and tabs.</t>
<t tx="ekr.20040403120534.1397">Rewrote the code in scanText and scanDoc that figures out where sentinels start.

The new nextLine and nextKind vars clarify what is going on.  When a non-sentinel line is output, the trailing newline is part of a sentinel if and only if nextKind is some kind of sentinel.

I'm not convinced the code in scanDoc is correct...

</t>
<t tx="ekr.20040403120534.1398">This is a very useful comparison tool.  It allows me to compare whitespace easily.</t>
<t tx="ekr.20040403120534.1399">This puts up a model dialog.  The hardest part was writing the code that centers the dialog on the screen.  Sheesh.</t>
<t tx="ekr.20040403120534.1400">I fixed many minor problems in preparation for releasing the first usable version of Leo.py.</t>
<t tx="ekr.20040403120534.1401">These bugs were simple transcription errors; they do not occur in LeoCB.

v.childIndex() was always returning 0, so naturally v.createDependents() was not working well.

Added a call to v.unlink() in v.destroyDependents.  The call to v.destroyTree() no longer does anything.</t>
<t tx="ekr.20040403120534.1402">We no longer need setIcon!!  Indeed, setIcon just calls c.redraw(), so as long as the callers enclose code in beginUpdate/endUpdate all will be well.  This eliminates a _major_ mess, and will result in further simplifications: we no longer need the distinction between the setX and initX routines!</t>
<t tx="ekr.20040403120534.1403">It turned out that tree.idle_body_key was the bottleneck, _not_ syntax coloring!

What was happening was this:  tree.redraw was being called on _every_ keystroke, and that was causing a huge amount of memory allocation and deallocation.  After a while everything ground to a halt.

The fix was very clever: I added a flag to c.endUpdate and tree.endUpdate, true by default.  tree.redraw is called only if count==0 and flag==true. So calling endUpdate(false) prevents all redraws from happening in a range of code.  This is a wonderful addition to the beginUpdate/endUpdate pattern.

Both tree.idle_body_key and v.setAncestorAtFileNodeDirty use this pattern.  The result is that tree.redraw() is called only when the icon really and truly must change.
</t>
<t tx="ekr.20040403120534.1404">Amazing.  I wrote some dummy code last night, read up on indices this morning, and got everything to work in a couple of hours. The result is very fast: no optimization is needed for Leo. I love Tkinter!

Added c.recolor and tree.recolor routines.  This hooks should be called whenever the body text changes.  Apparently there is no "OnTextChanged" event in Tk.</t>
<t tx="ekr.20040403120534.1405">Implementing this was trivial: we use a app.clipboard ivar, a string.  Using an internal clipboard means that we can't inadvertantly paste the XML representation of a string into body text.</t>
<t tx="ekr.20040403120534.1406">The only major step left before releasing a functional version of Leo is to check the @file write code.
</t>
<t tx="ekr.20040403120534.1407">The Tk clipboard handling is confusing: there are routines for clearing and setting the clipboard, but no obvious way to get the contents of the clipboard.  I could use an internal clipboard (part of the LeoApp class) for leo nodes, which would work pretty well.  If I did that I might want other commands: cut, copy and paste between node clipboard and the text widgets...

There doesn't seem to be any Python support for the clipboard, which is weird.</t>
<t tx="ekr.20040403120534.1408">This is a tedious task, no matter how it is done.</t>
<t tx="ekr.20040403120534.1409">Simplified the code that sets the current vnode and initializes icons.  Having tree.redraw update icons automatically helps a lot.

Added tree.initing hack to disable endEditLabel from marking the tree as changed. Actually, this probably isn't necessary, as top.title probably won't be redrawn until idle time anyway.</t>
<t tx="ekr.20040403120534.1410">Here is how to get accelerators working:

fileMenu.add_command(label="New", accelerator="Ctrl+N", command=self.OnNew)
self.top.bind("&lt;Control-n&gt;", self.OnNew)

Warning: using top.bind_all would not work well with multiple windows.

The accelerator="Ctrl+N" option merely sets the menu text(!).  The bind_all method actually does the work.  BTW, I had to change (self) to (self,event=None) in all the command handlers.  When an accelerator is used the handler is called with two args.  When the menu is used the handler is called with only one arg.

IDLE shows how to be a bit more clever with initialization.  I probably should study the Idle code and be clever ;-)  IDLE also use the configuration data base, and I probably should study that too.</t>
<t tx="ekr.20040403120534.1411">There are now just two routines, v.computeIcon() and v.setIcon().

v.setIcon just does c.tree.redraw() (!)

c.tree.redraw() now does nothing if the update count &gt; 0, so this is safe. Moreover, we can now enclose any code in c.beginUpdate()/c.endUpdate() without worry.

This is the way it is written in the Book.</t>
<t tx="ekr.20040403120534.1412">The &lt;Key&gt; event is called _before_ the body text is updated, so it is not possible to properly update syntax coloring, icons or tnodes there.  Instead, the &lt;Key&gt; event handler just registers an idle-time event to do the real work.  Very simple!</t>
<t tx="ekr.20040403120534.1413">The canvas widget appears to have an improper 1 or 2 pixel gray border.  I have worked around this by limiting the size of the Tk.Entry widget: expanding it only when editing is enabled.</t>
<t tx="ekr.20040403120534.1414"></t>
<t tx="ekr.20040403120534.1415">Following the IDLE code lead me astray.  IDLE does not allow the headline text to be edited!  At last some of the confusion is gone.</t>
<t tx="ekr.20040403120534.1416">openWithFileName now shows the window before loading, so that reading messages become visible.  To do this, we call app().root.update().

Made leoFrames bigger: this is done in createSplitter(!)</t>
<t tx="ekr.20040403120534.1417"></t>
<t tx="ekr.20040403120534.1418">We close the initial open window if it has not been changed.

app.quit() now closes the hidden root window to close the app.

Close processing now calls the close event handler.

There are no bugs as in wxWindows!  Everything is straightforward.</t>
<t tx="ekr.20040403120534.1419">I have rewritten the code to draw the tree, and it seems to work reliably.  However, expanding an entire tree is slow, and redrawing the tree is also slow is many nodes are visible.  I'm not sure what is causing this...

Disabling drawNode speeds up the redraw greatly.
Disabling only tags also speeds up the redraw greatly.  Indeed, way too many tags appear to be created...

Still to do: I have not been able to create edit windows in the canvas properly...</t>
<t tx="ekr.20040403120534.1420">I'm not sure whether Tkinter can read .bmp icons, so I created .gif icons, which work well.</t>
<t tx="ekr.20040403120534.1421">Rewrote v.restoreOutlineFromDVnodes.  It is now very simple because undo no longer creates dvnodes; vnodes now contain all tree information.  So when we "delete" a tree we just unlink and unjoin it, and when we "restore a tree we just relink and rejoin it.  It is truly amazing how simple the tree code now is.</t>
<t tx="ekr.20040403120534.1422">It now takes about 3 seconds to read this file, rather than the 9+ seconds needed by wxPython!  Apparently the wxPython tree class was very slow.

The _old_ bottleneck was as follows:
	Most of the time is spent in atFile scanning code
		.. c.clearAllVisited is very slow(!!) because it clears the entire tree.
			c.clearAllVisited takes about 1/3 time of the entire scanning phase (!!)
		.. Reading the file itself, is very fast, scanning in atFile::read is slow.
		.. es calls are fast.
</t>
<t tx="ekr.20040403120534.1423">A milestone.  It is now possible to read a .leo file and to draw the tree at least partially.  Most of the conversion to Tkinter has now been completed.

I removed vnode and commands getters that merely returned ivars.  Also converted wxWindows calls to Tk calls.  It is remarkable how easily the changes went.  
</t>
<t tx="ekr.20040403120534.1424">Converted all Tk prototype code to Tkinter.  It was straightforward for the most part.  The Leo window works: scrollbars work and the text panes work.  However, the tree pane is a text pane at present.

Copied menu code from Leo.py version 0.04.  Somehow the old code was lost, I have no idea why.  The copied code is wxWindows code, so it will have to be rewritten for Python.  Still, it is much easier to use the properly converted Python code.  Perhaps I deleted the code thinking that it would all have to be rewritten.  If so, that was a minor mistake.</t>
<t tx="ekr.20040403120534.1425"></t>
<t tx="ekr.20040403120534.1426">The use_tk global indicates whether Leo will use wxPython or Tkinter.  The next step is to transliterate the Tk code that creates the Leo window into Tkinter.</t>
<t tx="ekr.20040403120534.1427">After much experimentation, adding a -padx param to the log window pane seems like the only way to handle the width of the vertical scroll bar.  Without this extra padding, the scroll bar obscures the left edge of the log window.</t>
<t tx="ekr.20040403120534.1428">It simplifies and speeds up the code to use file.readline to process lines as a unit.  This way I never have to scan to the end of a line.  However, it turns out that scanning is not really the bottleneck.  In addition, we no longer read entire derived files into memory at once.

BTW, it may be possible to use readline() in the getLeoFile logic as well.  I have no idea whether this would help or not.

The problem is the _second_ half of atFile::read, that is, after the derived file has been completely scanned and all vnodes have been created!  Apparently, something (maybe shouldBeClone?) involved with setting bits is horribly slow.  I'm not sure why earlier testing didn't show this problem.  I must have been mistaken somehow in my earlier conclusions.

This actually is very good news.  It means that the raw file code is good enough as it is.  Note:  reading derived files will not slow down when I switch to Tk because we don't create vnodes unless there are file errors!

I have just found that a single call to c.clearAllVisited() in read() _substantially_ slows down the read!  Amazing.

Create v.clearVisitedInTree() and v.clearAllVisitedInTree()</t>
<t tx="ekr.20040403120534.1429">@nocolor
@ignore

This is a _very_ easy class.

Ivars
	self.root: the root vnode
	self.update: update count
		tree::beginUpdate increments.  tree::endUpdate decrements.
		Disable redraw if &gt; 0
		Redraw when falls to 0.
	self.selected: the selected vnode
	self.top the top vnode on the screen (needed?)

Tree methods know about vnodes(!) Greatly simplifies both tree and vnode classes.
tree:endUpdate does nothing if self.update &gt; 0
	User code should not call tree::redraw directly.
	Most tree methods call redraw
Insert methods create a vnode, set links and redraw.
Move methods just set links and redraw
Commands methods enclose complex operations in tree.beginUpdate/endUpdate, as they do now.
tree::delete(v) just unlinks v's tree
	vnodes are not deleted until window goes away: unlimited undo!
	v.threadNext ivar makes deleting a list trivial.

vnodes

vnodes contain headString, expanded, firstChild, parent, back, next and threadNext ivars
	tree::getThreadNext() used to set v.threadNext
	no need for dvnodes: vnodes contain all undo info!


		</t>
<t tx="ekr.20040403120534.1430">added use_tk constant in leoGlobals.</t>
<t tx="ekr.20040403120534.1431">es now outputs a newline, which makes most uses of enl and ecnl superfluous.  We can do this be string concatenation is so easy.</t>
<t tx="ekr.20040403120534.1432">There was a transliteration error in computing the line to be output which mangled long lines.</t>
<t tx="ekr.20040403120534.1433">This code has not been tested.</t>
<t tx="ekr.20040403120534.1434">There was a bug in sentinelKind.  skip_c_id won't handle @@, so @@ must be handled separately.</t>
<t tx="ekr.20040403120534.1435">It is not possible to access global _variables_ using from leoGlobals import * because that creates copies of the data.  The new way is simpler and more modular.

Revised how the prefs panel works.  The new code just sets the prefs ivars.  It is up to the caller to access the prefs panel as needed. Added tab_width preference and prefs.tab_width ivar.  This should have been done long ago.</t>
<t tx="ekr.20040403120534.1436">Fixed problems with at_xxx_ptr globals.  The problem that from leoGlobals import * doesn't work, so I changed is_special_bits so it returns a dictionary containing name:value pairs rather than setting globals.

Fixed many problems in scanAllDirectives involving paths.  Also rewrote the code in atFile::write that opens files.

At this point leo.py can read and write files except files containing @first.
</t>
<t tx="ekr.20040403120534.1437">.. initAllCloneBits had several errors.
.. self.structureErrors wasn't being initialized in atFile::Read
.. createNthChild must mark nodes as visited to suppress unvisited node logic later.
.. Added log messages any time self.structureErrors is incremented in createNthChild

At this point leo.py can read a simple test file properly, except files containing @first.</t>
<t tx="ekr.20040403120534.1438">It wasn't too hard to create a proper splitter window.  After that, creating a Leo window was trivial.</t>
<t tx="ekr.20040403120534.1439"></t>
<t tx="ekr.20040403120534.1440">I am beginning to think that globals should _never_ be used.

The @language bug appears to be a problem of not setting globals properly.</t>
<t tx="ekr.20040403120534.1441"></t>
<t tx="ekr.20040403120534.1442">Added assert in tnode::setTnodeText that we are getting a string.  This assert was not always true before I added a call to listToString in &lt;&lt; copy new_out to child's body t't' in scanText.</t>
<t tx="ekr.20040403120534.1443">The read code is slow.  I'll have to see why.

3 seconds with read doing nothing (reads leoPy.leo)
5 seconds with read reading files but not scanning them.
9 seconds with read fully enabled.

Therefore:

3 sec to read and scan LeoPy.leo
2 sec for reading all derived files
4 sec to scan all derived files.

So scanning derived files is pretty slow.

BTW, LeoCB can do everything in about 2 sec.
</t>
<t tx="ekr.20040403120534.1444">There was the usual assortment of minor problems.

.. The write code was writing flags using `flag`, and this fails if false is None.
.. Added code to make sure None is never passed to wxFileDialog as a file name.  I wonder if this could have caused problems earlier.  Once again, the C++ code is shown to be radically unsafe.

.. I think false should be defined as 0, not None.  There are several advantages:

1.  not 0 == not None, so various tests work as before.
2.  `0` is very different from `None`, and this affects the file format.

I'll make this change.  Hope it works ;-)</t>
<t tx="ekr.20040403120534.1445">A major milestone:  the read command works and so do most outline commands.  It is now clear that reading a file is fast enough so that no further work is required!

The main problems today:

1.  The code must use the test: id and id.IsOk().  Failure to make _both_ tests will cause the code to fail, possibly in an unbounded loop.  This was ultimately the problem with the Move Down command:  the threadNext code didn't make these test.  I finally called wxGetThreadNext inside threadNext and that solved the problem.

2.  I added the self.changing lockout in the LeoFrame OnTextUpdate handler so that tnodes would not be erroneously updated while switching tnodes.  The new code seems simple and robust.</t>
<t tx="ekr.20040403120534.1446">A case can be made for getters of the form:

	def getX():
		return x
		
In particular, they are a reaonable place to put asserts.  However, such getters do not seem good style in Python because all ivars are public anyway.  Moreover, getters like

	def x():
		return x
		
are invalid in Python, so there is a problem.  The simplest approach seems to be to get rid of all such redundant getters, and that is what I have just done.  Note that assert's aren't so important in wxPython, because nothing bad can happen anyway.</t>
<t tx="ekr.20040403120534.1447">This was a very interesting experience, for the following reason.

1.  The weakness of a non-compiled language is that problems don't show up until code is actually executed.
2.  Python is very safe.  The only real problem are unbounded loops.
3.  In particular, the continue statement will _always_ loop in Python unless progress the loop variable is incremented.  So care must be taken when translating C for loops into Python while loops.
4.  Even without the ability to set breakpoints (which means that single-stepping is impossible in wxPython!) it wasn't too hard to trace with print statements.  Amazing.
5.  The biggest mess came with getters that return an ivar of the same name.  I'll sleep on this, and I think the thing to do is get rid of the getter entirely:  convert x.getY() x.Y.
6.  Defining constants in a class is nice: they are accessed by class name.  For example: vnode.dirtyBit.

Status:
1.  The outline is being read in correctly.
2.  The atFile::read logic hasn't been tested.
3.  The body pane (and probably all the tnode text) is not being set properly.
4.  It is possible that we might be able to get rid of join lists!  They are used:
	a) To update the headline text
	b) For shouldBeClone.
	We could replace join lists by a reference count and temporary join lists.
	This could be really cool, and I'll have to think about this more...
	</t>
<t tx="ekr.20040403120534.1448">Created leoFileCommands.py.  We use com=self.mCommands to access the "real" commander for this class.  It would be wrong to make fileCommands a subclass of Commands; we must have exactly one commander per frame so that mCurrentVnode, mRootVnode, etc. are updated properly.

In short, the ivars of fileCommands are mFrame, mCommands and any ivars used exclusively by fileCommands.  This pattern will be used to create outlineCommands.py, findCommands.py, etc.</t>
<t tx="ekr.20040403120534.1449">The info class was confusing.  All the ivars from that class now become ivars in the fileCommands class.  The mTnodes array is now a Python dict, so there is no need for the mNumberOfTnodes or mMaxTnodeIndex ivars!  The new clode is _much_ clearer.  A major victory.</t>
<t tx="ekr.20040403120534.1450">Fixed several bugs in c2py.

Greatly simplified handlePossibleFunctionHeader; there is no need to compute a delta there:  we munge the head, args and body separately, then replace the original all at once with the new lists.  This is bullet proof.

Fixed some bugs in safeReplace and matchWord.

Fixed bugs in convertCStringToPython that caused skipDoc and skipCode to be called in the wrong places.  That was really messing things up!

Tested the speed of tests by writing speedTest.  This is so much fun!</t>
<t tx="ekr.20040403120534.1451">I have been happily converting, with the help of c2py, Leo's C++ code to python.  The new code is far, far easier to understand.</t>
<t tx="ekr.20040403120534.1452">Fixed several bugs in c2py:

1. removeExcessWS was sometimes skipping past a newline, thereby removing leading whitespace in the following line.  This made it look like the code for "if", "while" and "for" was bad.

2. the function scanning code had several bugs.  Added new code to ignore "if", "while" and "for" code.  Added new code to ignore # lines (preprocessor directives).  Added the firstOpen variable to eliminate scanning later.  This is pretty tricky code.

3. Added code to replace " . " by "." and "\t " by "\t".

4. Fixed skipPastWord so it handles underscores and digits.  This helped a lot ;-)

5. @code was not always properly converted to @c.

I think I will leave c2py as is for now.  It has the following rough edges:

1.  I don't know how to break long scripts.
2.  c2py doesn't handle : initializers in constructors well; they inhibit processing of the initializer.
3.  c2py doesn't place self. in all the places it is needed.  I'm not sure there is an elegant way to do this...</t>
<t tx="ekr.20040403120534.1453">Worked on c2py.  As documented in LeoCB.leo, had to add a __cmp__ routine in leo.py so that vnodes compare equal properly.  Fixed some minor bugs in c2py.

We now have two separate routines called leo.py.  The one used by LeoCB and LeoWX is the python expression evaluator.  The leo.py in LeoPy is the top level of leo.py.

Added signed, unsigned and bool to the list of type names.</t>
<t tx="ekr.20040403120534.1454"></t>
<t tx="ekr.20040403120534.1455">Documented the theory of operation of c2py.  This is a remarkably simple program!  Converting from string to list representation turns out to be a very good choice.</t>
<t tx="ekr.20040403120534.1456">For the last two days I have been working on c2py.py.  I am totally in love with Python.  Everything is so much easier:  Automatic debugging, no declarations, no types, no compilation. Great data structures. Even without single stepping the debugging is easy.

All major aspects of c2py are now complete.</t>
<t tx="ekr.20040403120534.1457">It has been staring me right in the face.  Idle.py supports tree views and syntax coloring!  All I need do is adapt the Idle code for Leo.  The only remaining piece of the puzzle is a good splitter window (and splitter events?)
</t>
<t tx="ekr.20040403120534.1458">All menu work is now complete, with stubs for many calls to Commands routines...
The Python menu is functional.
The Find Panel can be opened.
The Find Panel can be opened.

Still to do:
	Icons for outline
	Nodes classes
	Commands classes:
		outline commands
		file commands,
		find commands,
		tangle/untangle commands</t>
<t tx="ekr.20041023132837.1"></t>
<t tx="ekr.20041023132837.2"></t>
<t tx="ekr.20041023132837.3"></t>
<t tx="ekr.20041023132837.4"></t>
<t tx="ekr.20041023132837.5"></t>
<t tx="ekr.20041023132837.6"></t>
<t tx="ekr.20041023132837.7">atFile.scanAllDirectives was overriding the delim computed by scanHeader.

The fix was to add a reading param to scanAllDirectives that suppresses the scan for delims.</t>
<t tx="ekr.20041023132837.8"></t>
<t tx="ekr.20041023132837.9"></t>
<t tx="ekr.20041023132837.10">- Moved call to assignFileIndices into write_Leo_file.
- Called assignFileIndices in writeAtFileNodes, writeDirtyAtFileNodes, writeMissingAtFileNodes</t>
<t tx="ekr.20041023132837.11">Otherwise the tree-drawing code will change the position!</t>
<t tx="ekr.20041023132837.12"></t>
<t tx="ekr.20041023132837.13">What I did:

1. Converted the following ivars by hand:

app -&gt; g.app
globalDirectiveList -&gt; g.globalDirectiveList

2.  Replaced Tkinter by tk:

try: import Tkinter as Tk
except ImportError: Tk = None

3. Replaced "from leoPlugins import *" by import leoPlugins.
	- Replaced registerHandler by leoPlugins.registerHandler.</t>
<t tx="ekr.20041023132837.14">@nocolor 

Create the list of functions in leoGlobals.py.
	OR:  create the list by importing leoGlobals.py and looking at g.__dict__
Put this list in the script.</t>
<t tx="ekr.20041023132837.15"></t>
<t tx="ekr.20041023132837.16"></t>
<t tx="ekr.20041023132837.17"></t>
<t tx="ekr.20041023132837.18"></t>
<t tx="ekr.20041023132837.19"></t>
<t tx="ekr.20041023132837.20">See notes in project.  This was very clever code.</t>
<t tx="ekr.20041023132837.21">- created convertStackToPosition.
- created getExistingVnode.
- Major hack to getVnode.
</t>
<t tx="ekr.20041023132837.22">Moved a call to c.frame.tree.drawIcon(v) so that the icon will, in fact, be redrawn.

This was apparently an old bug.</t>
<t tx="ekr.20041023132837.23">This requires Python 2.2, as does iterators.</t>
<t tx="ekr.20041023132837.24">The setDirty logic is now about as clean as it can be.</t>
<t tx="ekr.20041023132837.25">- Changed readAll so it uses c.nullPosition by default.
- Test p is None in scanDirectives.

These two changes _might_ be enough to ensure the arg to p.__cmp__ is always a position in Leo's _core_.  However, user code is a different matter!

The coding style is to use: "if p is None:" rather than "if p == None:".  However, there is no way to enforce that style, so I have left the test against None in p.__cmp__.

Use the p.equal method when speed is crucial.</t>
<t tx="ekr.20041023132837.26"></t>
<t tx="ekr.20041023132837.27">This is a time-critical routine.</t>
<t tx="ekr.20041023132837.28"></t>
<t tx="ekr.20041023132837.29">1. Reduced copies of positions in drawTree.

Allocated copies in drawTree rather than in drawBox, drawIcon and drawText.  This reduces the number of copies by one third.

2. Eliminated extraneous positions in fileCommands read logic.

This was due to calling v.setMarked rather than v.initMarked, which calls c.doHook.  I don't know why this allocates so many positions, and it does.

3. Sped up fileCommands write logic by 30% (or more?)

This was a weird one.  p.__cmp__ is up to 10 times slower than p.equal.  I don't think there is any recursive code in p.__cmp__, and I suppose there might be...</t>
<t tx="ekr.20041023132837.30"></t>
<t tx="ekr.20041023132837.31"></t>
<t tx="ekr.20041023132837.32"></t>
<t tx="ekr.20041023132837.33"></t>
<t tx="ekr.20041023132837.34">These assert that the old or simple ways of computing positions and levels are equivalent to the optimized ways.

These assertions significantly slow down moves.  This shows that the optimized code truly is essential.</t>
<t tx="ekr.20041023132837.35"></t>
<t tx="ekr.20041023132837.36"></t>
<t tx="ekr.20041023132837.37">The code set a _next field to a position instead of a vnode.</t>
<t tx="ekr.20041023132837.38">Changes since the last cvs update:
	
- Disables changes if not a complete word.
- Disables changes if preceded by prefix:
	- Running this script twice is now safe.
- Disables changes if preceded by "def " or "."
- Added replace parameter for safety.
</t>
<t tx="ekr.20041023132837.39"></t>
<t tx="ekr.20041023132837.40"></t>
<t tx="ekr.20041023132837.41">Removed all code governed by "if not g.sharedNodes".
</t>
<t tx="ekr.20041023132837.42"></t>
<t tx="ekr.20041023132837.43">I started the transition to "pure" position code.

That is, I started eliminating code in "not g.sharedNodes" parts.  I did this because doing things "both ways" doesn't make any sense: much easier to change code.</t>
<t tx="ekr.20041023132837.44">self_and_siblings_iter()
self_and_parents_iter()
</t>
<t tx="ekr.20041023132837.45">This allows the user to choose a "safe mode".  It is off by default.</t>
<t tx="ekr.20041023132837.46"></t>
<t tx="ekr.20041023132837.47">We _can_ make the Leo compatible with old scripts !!!

1. Iterators replace most calls to next(), threadNext() etc., so any _other_ calls to there routines do _not_ have to be efficient:

2. In other words, iterators are the place to "optimize" tree traversals.

3. I added proxies to the position class so that p.x() is valid almost anywhere that v.x() is valid.

The only exceptions is that the v.linkX and v.unlink routines should only be called explicitly from the position class.

4.  I shall define porv.setCurrentVnode() and porv.currentVnode () in terms of porv.setCurrentPosition and porv.currentPosition.

This will deal with positions or vnodes as appropriate.

5. Added t ivar to position class:  self.t = self.v.t

Therefore, almost all code should continue to work!
</t>
<t tx="ekr.20041023132837.48"></t>
<t tx="ekr.20041023132837.49"></t>
<t tx="ekr.20041023132837.50"></t>
<t tx="ekr.20041023132837.51"></t>
<t tx="ekr.20041023132837.52"></t>
<t tx="ekr.20041023132837.53"></t>
<t tx="ekr.20041023132837.54"></t>
<t tx="ekr.20041023132837.55">Changed leoConfig.leo, and the popup menu.

By: sbeards ( Scott Beardsley ) 
 BUG: Toggle brackets via Ctrl+B   
2004-02-11 17:21  

The ToggleAngleBrackets keyboard command (Ctrl+B) doesn't seem to be working at all. </t>
<t tx="ekr.20041023132837.56">Changed Undo/Redo messages:

- Insert Outline to Insert Node.
- Delete Outline to Delete Node.
- Clone to Clone Node.

This is a real code change: it affects the undo/redo logic.

BTW, some way should be found to translate these (and all other text as well!!).</t>
<t tx="ekr.20041023132837.57"></t>
<t tx="ekr.20041023132837.58"></t>
<t tx="ekr.20041023132837.59">
</t>
<t tx="ekr.20041023132837.60"></t>
<t tx="ekr.20041023132837.61"></t>
<t tx="ekr.20041023132837.62">- Fixed Dan Winkler's bug with CashRegister.ss.

- Possibly fixed the "Zope Sprint" bug.

- Ensure trailing newline in scripts.

- Fixed indent problem in leoTkinterGui.py.

- Fixed several problems in the Convert All Blanks/Tabs commands.

- Give shorter message when saving a read-only file fails.
  This is a bit of a kludge.  Only time will tell if it works acceptably.

- Leo no longer writes "empty" attributes like a="".  This arose because Leo no longer writes cloned attributes.

- Added some code to save and restore the "top" vnode, but this really is useless at present: the "top" vnode is a function of the scroll state, and that is a Tk-dependent value.  The only proper way of computing the top node would be to look at the scroll state, and this I don't care to do now.

</t>
<t tx="ekr.20041023132837.63"></t>
<t tx="ekr.20041023132837.64">This is correct and more accurate.

- Created v.setAllAncestorAtFileNodesDirty.

- Call v.setAllAncestorAtFileNodesDirty instead of v.setDirty.

- "Duplicate" calls to v.setAllAncestorAtFileNodesDirty are needed just as with v.setDirty.

- This change affects drags, moves, clones, insert, delete, sorting.</t>
<t tx="ekr.20041023132837.65"></t>
<t tx="ekr.20041023132837.66"></t>
<t tx="ekr.20041023132837.67">c.doCommand calls tree.redrawAfterException on exceptions.  This works because doCommand is itself _not_ contained in any begin/endUpdate pair, so setting self.updateCount = 0 in tree.redrawAfterException will work.</t>
<t tx="ekr.20041023132837.68">Changed:

if sys.platform not in ("linux1","linux2"):

to:

if sys.platform not in ("darwin",freebsd4","freebsd5","linux1","linux2"):

in:

&lt; &lt; set bind_shortcut and menu_shortcut using accel &gt; &gt;</t>
<t tx="ekr.20041023132837.69"></t>
<t tx="ekr.20041023132837.70">The fix was to insert code to test for a special case.

I wonder what this code would look like in the shared-tnode world?
</t>
<t tx="ekr.20041023132837.71"></t>
<t tx="ekr.20041023132837.72"></t>
<t tx="ekr.20041023132837.73">This is so handy.</t>
<t tx="ekr.20041023132837.74"></t>
<t tx="ekr.20041023132837.75"></t>
<t tx="ekr.20041023132837.76">The assertion

assert(i == new_len)

in &lt; &lt; initialize new states &gt; &gt; has caused no end of troubles.  The new code eliminates the assertion by brute force.  It has never been clear why the assert has failed, and it does so rarely.  However, the very worst that can happen is that some lines aren't colored properly, so it's not a big deal.</t>
<t tx="ekr.20041023132837.77"></t>
<t tx="ekr.20041023132837.78">Created tree.enableDrawingAfterException and called it in es_exception.</t>
<t tx="ekr.20041023132837.79"></t>
<t tx="ekr.20041023132837.80"></t>
<t tx="ekr.20041023132837.81"></t>
<t tx="ekr.20041023132837.82"></t>
<t tx="ekr.20041023132837.83"></t>
<t tx="ekr.20041228094925"></t>
<t tx="ekr.20041228094925.1"></t>
<t tx="ekr.20041228094925.2"></t>
<t tx="ekr.20041228094925.3">leo.py reads and writes exactly like LeoCB</t>
<t tx="ekr.20041228094925.4">Amazing.  I wrote some dummy code last night, read up on indices this morning, and got everything to work in a couple of hours. The result is very fast: no optimization is needed for Leo. I love Tkinter!

Added c.recolor and tree.recolor routines.  This hooks should be called whenever the body text changes.  Apparently there is no "OnTextChanged" event in Tk.</t>
<t tx="ekr.20041228094925.5"></t>
<t tx="ekr.20041228094925.6"></t>
<t tx="ekr.20041228094925.7">This marked my complete frustration with wxLeo and wxPython, and the real beginning of the work on leo.py.</t>
<t tx="ekr.20041228094925.8"></t>
<t tx="ekr.20041228094925.9">I am totally in love with Python.  Everything is so much easier:  Automatic debugging, no declarations, no types, no compilation. Great data structures. Even without single stepping the debugging is easy.

All major aspects of c2py are now complete.</t>
<t tx="ekr.20041228094925.10">I am not sure exactly when this happened.  The details apparently have been lost.  There was a time when I was experimenting with Python and wxPython, and a time when I was working on wxWindows version of Leo.</t>
</tnodes>
</leo_file>
