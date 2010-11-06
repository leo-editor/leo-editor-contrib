<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet ekr_test?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5">
	<global_window_position top="30" left="317" height="978" width="898"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20091005201118.1840"><vh>@chapters</vh></v>
<v t="ekr.20091005201118.1842"><vh>create-at-auto-nodes</vh></v>
<v t="ekr.20091005201118.1839" a="E"><vh>@path c:\prog\patternmatching</vh>
<v t="ekr.20091005201506.1570"><vh>Markup patterns</vh>
<v t="ekr.20091005201118.1848"><vh>@thin text2html.py</vh></v>
<v t="ekr.20091005201118.1849"><vh>@thin text2latex.py</vh></v>
</v>
<v t="ekr.20091005201118.1843"><vh>@thin MatchingInput.py</vh></v>
<v t="ekr.20091005201506.1569"><vh>Non-backtracking</vh>
<v t="ekr.20091005201118.1845"><vh>@thin patterns_nb.py</vh></v>
<v t="ekr.20091005201118.1847"><vh>@thin patternusers_nb.py</vh></v>
<v t="ekr.20091005201118.1851"><vh>@thin textpatterns_nb.py</vh></v>
</v>
<v t="ekr.20091005201506.1568" a="E"><vh>Backtracking</vh>
<v t="ekr.20091005201118.1846"><vh>@thin patternusers_b.py</vh></v>
<v t="ekr.20091005201118.1850" a="E"
expanded="ekr.20091005201506.1549,"><vh>@thin textpatterns_b.py</vh></v>
<v t="ekr.20091005201118.1844"><vh>@thin patterns_b.py</vh></v>
</v>
</v>
<v t="ekr.20091005213130.1574"><vh>Examples</vh></v>
</vnodes>
<tnodes>
<t tx="ekr.20091005201118.1839"></t>
<t tx="ekr.20091005201118.1840" str_leo_pos="2,3,1,5,0"></t>
<t tx="ekr.20091005201118.1842"># A script to create @auto nodes from all .py files in a directory.

import glob,os

reallyCreate = True
baseDir = r'c:\prog\patternmatching'
dirs = (r'',)
g.pr('-----')

for theDir in dirs:
    pattern = g.os_path_join(baseDir,theDir,'*.py')
    files = glob.glob(pattern)
    g.pr(pattern)
    # g.pr(g.listToString(files))
    for name in files:
        h = '@auto %s' % (name[len(baseDir) + 1:].strip())
        g.pr('creating',h)
        if reallyCreate:
            child = p.insertAsLastChild()
            child.initHeadString(h)</t>
<t tx="ekr.20091005201506.1568"></t>
<t tx="ekr.20091005201506.1569"></t>
<t tx="ekr.20091005201506.1570"></t>
<t tx="ekr.20091005213130.1574">import sys
import string
path = r'c:\python25\lib\site-customize\matching'
if path not in sys.path: sys.path.append(path)
from matching.patterns_b import *
from matching.textpatterns_b import *
from matching.MatchingInput import *

print '*' * 20
subject = MatchingInput ("abcdefgh23;ijklmn")
while True:
    if subject ^ AnyOfP (string.letters) [4] &gt;&gt; "four letters":
       print "found four letters: \"" + subject ["four letters"] + "\""
    elif subject ^ AnyOfP (string.digits) [2:] &gt;&gt; "the digits" &amp; IsP (";"):
       print "found two or more digits followed by a semicolon: \"" + \
             subject ["the digits"] + "\""
    elif subject ^ AnyOfP (string.letters) [1:3] &gt;&gt; "1 2 3 letters":
       print "found less than four letters: \"" + \
             subject ["1 2 3 letters"] + "\""
    else: break
</t>
</tnodes>
</leo_file>
