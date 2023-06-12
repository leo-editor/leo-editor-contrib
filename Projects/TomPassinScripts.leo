<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: https://leo-editor.github.io/leo-editor/leo_toc.html -->
<leo_file xmlns:leo="http://leo-editor.github.io/leo-editor/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="tom.20230509140958.2"><vh>About</vh>
<v t="tom.20230509141627.1"><vh>Author</vh></v>
</v>
<v t="tom.20230509141858.1"><vh>Commands</vh>
<v t="tom.20230509141904.1"><vh>@command tp-gnx-to-clip</vh></v>
<v t="tom.20230509141938.1"><vh>@command tp-unl-to-clip</vh></v>
<v t="tom.20230509142406.1"><vh>@command tp-title-case-selection</vh></v>
<v t="tom.20230509142456.1"><vh>Creating New Outlines From Old</vh>
<v t="tom.20230509142305.1"><vh>@command tp-outline-from-clip</vh></v>
<v t="tom.20230509142325.1"><vh>@command tp-outline-from-node</vh></v>
<v t="tom.20230509142350.1"><vh>@command tp-outline-from-string</vh></v>
</v>
<v t="tom.20230509142550.1"><vh>Indented Lists</vh>
<v t="tom.20230511011156.1"><vh>@command tp-subtree2indented</vh></v>
<v t="tom.20230511011217.1"><vh>@command tp-outline2indented</vh></v>
<v t="tom.20230511011242.1"><vh>@command x-tree-to-indented-list</vh></v>
<v t="tom.20230509143603.1"><vh>@command x-outline-to-indented-list</vh></v>
</v>
<v t="tom.20230509142632.1"><vh>@command tp-delete-tab-by-name</vh></v>
<v t="tom.20230509142716.1"><vh>Counting Nodes And Lines</vh>
<v t="tom.20230509142738.1"><vh>@command x-count-loc</vh></v>
<v t="tom.20230509142747.1"><vh>@command x-count-subtree-nodes</vh></v>
<v t="tom.20230509142754.1"><vh>@command x-count-all-nodes</vh></v>
</v>
<v t="tom.20230509142820.1"><vh>@command x-time-all_positions</vh></v>
</v>
<v t="tom.20230509143647.1"><vh>Buttons</vh>
<v t="tom.20230509143713.1"><vh>@button Show Current Dir</vh></v>
<v t="tom.20230509143740.1"><vh>@button Cmd Window Here</vh></v>
<v t="tom.20230509143747.1"><vh>@button Curr Dir to Clip</vh></v>
<v t="tom.20230509143801.1"><vh>@button Toggle VR3 Tab</vh></v>
<v t="tom.20230509143810.1"><vh>@button RunExtFile</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="tom.20230509140958.2">This outline contains scripts, buttons, and commands that I have found useful.  I install them onto all my outlines by including them in myLeoSettings.leo.

Some commands are prefixed by "tp", so using tab-complete I can immediately scan just my own commands.  This is a helpful practice that I recommend.

Others are prefixed by an "x".  They are scripts I was trying out, and that I found helpful enough to keep.

I create a "local" menu in myLeoSettings,leo to make  some of the commands more easily available, and to remind me what they are.
</t>
<t tx="tom.20230509141627.1">Thomas B. Passin
pub1@tompassin.net</t>
<t tx="tom.20230509141858.1"></t>
<t tx="tom.20230509141904.1">@language python
"""Copy gnx of selected node to clipboard."""

g.app.gui.replaceClipboardWith('gnx:' + p.gnx)

</t>
<t tx="tom.20230509141938.1">"""Copy UNL of current position to clipboard."""
p = c.p
g.app.gui.replaceClipboardWith(p.get_UNL())
</t>
<t tx="tom.20230509142305.1">@language python
from leo.core.leoFileCommands import FastRead as FR
def createOutlineFromClipboard():
    """Create a new outline from the clipboard.

    The clipboard must contain an XML-format Leo outline.
    This can be done by Leo's copy-node command (CTRL-SHIFT-c).
    """

    s  = g.app.gui.getTextFromClipboard()
    if not s.strip():
        g.es('No string in clipboard')
        return

    # Create new outline
    c1 = c.new()

    # Construct tree from outline string
    fr = FR(c1, c1.fileCommands.gnxDict)
    v = fr.readFileFromClipboard(s)
    if not v:
        g.es('Cannot create a node from the clipboard string')
        return

    # Shove new tree into commander of the new outline
    c1.hiddenRootNode = v

    p0 = c1.rootPosition()
    c1.selectPosition(p0)

    # Highlight root node in tree as if we had clicked on it
    g.doHook("headclick1", c=c1, p=p0, event=None)

    c1.setChanged()
    c1.redraw()

createOutlineFromClipboard()</t>
<t tx="tom.20230509142325.1">@language python
from leo.core.leoFileCommands import FastRead as FR

def createOutlineFromNode():
    """Open a new outline containing the selected node and its subtree.

    The new outline has not been saved or given a filename.
    """
    xml = c.fileCommands.outline_to_clipboard_string(c.p)

    # Create new outline
    c1 = c.new()

    # Construct tree from outline string
    fr = FR(c1, c1.fileCommands.gnxDict)
    v = fr.readFileFromClipboard(xml)
    if not v:
        g.es('Cannot create a node from the clipboard string')
        return

    # Shove new tree into commander of the new outline
    c1.hiddenRootNode = v

    p0 = c1.rootPosition()
    c1.selectPosition(p0)

    # Highlight root node in tree as if we had clicked on it
    g.doHook("headclick1", c=c1, p=p0, event=None)

    c1.setChanged()
    c1.redraw()

createOutlineFromNode()</t>
<t tx="tom.20230509142350.1">@language python
from leo.core.leoFileCommands import FastRead as FR
def openOutlineFromString(s):
    """Create a new outline pane from a string.
    
    The string must contain an XML-format Leo outline.
    """
    # Create new outline
    c1 = c.new()

    # Construct tree from outline string
    fr = FR(c1, c1.fileCommands.gnxDict)
    v = fr.readFileFromClipboard(s)  # Note that we haven't actually used the clipboard

    # Shove new tree into commander of the new outline
    c1.hiddenRootNode = v

    p0 = c1.rootPosition()
    c1.selectPosition(p0)

    # Highlight root node in tree as if we had clicked on it
    g.doHook("headclick1", c=c1, p=p0, event=None)

    c1.setChanged()
    c1.redraw()

# This command won't do anything yet because it only defines a function
# and does not execute it.  To define this with an @command-style
# decorator requires us to pass a string to the function.
# The best way to get such a string is to copy the top-level node
# to the clipboard.</t>
<t tx="tom.20230509142406.1">"""Convert selection or body to title case."""
w = c.frame.body.wrapper
p = c.p
s = p.b
u = c.undoer

start, end = w.getSelectionRange()
use_entire = start == end  # no selection, convert entire body

undoType = 'title-case-body-selection'
undoData = u.beforeChangeNodeContents(p)

if use_entire:
    p.b = s.title()
else:
    sel = s[start:end]
    head, tail = s[:start], s[end:]
    p.b = head + sel.title() + tail

c.setChanged()
p.setDirty()
u.afterChangeNodeContents(p, undoType, undoData)
c.redraw()
</t>
<t tx="tom.20230509142456.1">These commands create new outlines from the current tree or from subtrees of it.</t>
<t tx="tom.20230509142550.1">These commands create indented lists from trees or subtrees.  Mostly these are just indented lists of the headlines, but "x-outline-to-indented-list" includes noed bodies too.

For example, here is (part of) the indented list for leoAst.py:

   @file leoAst.py
      &lt;&lt; leoAst docstring &gt;&gt;
      &lt;&lt; leoAst imports &amp; annotations &gt;&gt;
      &lt;&lt; leoAst data &gt;&gt;
       class LeoGlobals
         LeoGlobals._caller_name
         LeoGlobals.caller
         LeoGlobals.callers
         leoGlobals.es_exception &amp; helper
            LeoGlobals.getLastTracebackFileAndLineNumber
         LeoGlobals.plural
         LeoGlobals.print_obj
         LeoGlobals.short_file_name
         LeoGlobals.split_lines
         LeoGlobals.to_string
         LeoGlobals.to_encoded_string
         LeoGlobals.to_unicode
         LeoGlobals.trace
         LeoGlobals.truncate
       leoAst.py: top-level commands
         command: fstringify_command
         command: fstringify_diff_command
         command: orange_command
         command: orange_diff_command
</t>
<t tx="tom.20230509142632.1">"""Delete named tab from log frame. Get tab name to delete from minbuffer."""

def delete_tab():
    """State 0"""
    k = c.k
    k.setLabelBlue('Tab to delete: ')
    event = {}
    k.get1Arg(event, handler = delete_tab1)

def delete_tab1(event):
    """State 1"""
    k = c.k
    # ----&gt; k.arg contains the argument.
    tabname = k.arg
    log = c.frame.log
    log.deleteTab(tabname)
    # Reset the minibuffer.
    k.clearState()
    k.resetLabel()
    k.showStateAndMode()

delete_tab()
</t>
<t tx="tom.20230509142716.1"></t>
<t tx="tom.20230509142738.1">@language python
"""Count non-blank, non-comment, non-directive lines in subtree.

Only skips line comments, not block comments.
"""
COMMENTS = '#', '@', '//', '--', ';'
p = c.p
loc = 0

for n in p.self_and_subtree():
    lines = [l.lstrip() for l in n.b.splitlines() if l.strip()]
    for line in lines:
        if not line.startswith(COMMENTS):
            loc += 1


g.es(loc, f'lines of code in "{p.h}"')</t>
<t tx="tom.20230509142747.1">"""Count all nodes in currently selected subtree."""
g.es(len(list(p.self_and_subtree())))</t>
<t tx="tom.20230509142754.1">"""Count nodes in outline."""
g.es(len(list(c.all_positions())))</t>
<t tx="tom.20230509142820.1">import time

def loop_to_time(event = None):
    n = 0
    for p in c.all_positions():
        n += 1
    return n

REPS = 100
t0 = time.time_ns()
for n in range(REPS):
    positions = loop_to_time()
t1 = time.time_ns()

g.es((t1 - t0)/(1e6 * REPS), 'ms per rep', '# positions:', positions )</t>
<t tx="tom.20230509143603.1">@language python
"""Place indented list for a subtree, including the bodies, in clipboard."""

TABSIZE = ' ' * 4

indented = ''
lines = []
for x in c.all_positions():
    indent = TABSIZE * (x.level() - 1)
    lines.append(indent + x.h)
    lines.append(indent + '=' * len(x.h))
    body_rows = x.b.split('\n')
    lines.append(indent + f'\n{indent}'.join(body_rows))

text = '\n'.join(lines)
g.app.gui.replaceClipboardWith(text)
</t>
<t tx="tom.20230509143647.1"></t>
<t tx="tom.20230509143713.1">@language python
"""Open directory for a node, respecting any @path directives and "~"."""

import os
from subprocess import run

pth = g.fullPath(c, p)
if pth:
    direc, _ = os.path.split(pth)
else:
    direc = g.scanAllAtPathDirectives(c, p)
direc = os.path.normpath(direc)

if g.os_path_exists(direc):
    term = 'explorer.exe' if g.isWindows else 'xdg-open'
    run([term, direc])
else:
    g.es(f"Path {direc} doesn't exist")
</t>
<t tx="tom.20230509143740.1">@language python
"""Open command window at current directory. Expands "~"."""

import os.path as osp
from subprocess import run

pth = g.fullPath(c, p)
if pth:
    direc, _ = osp.split(pth)
else:
    direc = g.scanAllAtPathDirectives(c, p)

direc = osp.normpath(direc)

if g.os_path_exists(direc):
    if g.isWindows:
        cmd = f'start cmd.exe /K "cd {direc}"'
        run(cmd, shell=True)
    else:
        cmd = 'x-terminal-emulator'
        run(cmd, cwd=direc)
else:
    g.es(f"Path {direc} doesn't exist", color='red')
</t>
<t tx="tom.20230509143747.1">@language python
"""Copy the path of the current node to the clipboard.

Includes the effect of @path directives.
"""

import pyperclip
import os

pth = g.fullPath(c, p)
if pth:
    direc, _ = os.path.split(pth)
else:
    direc = g.scanAllAtPathDirectives(c, p)
direc = os.path.normpath(direc)

if g.os_path_exists(direc):
    pyperclip.copy(direc)
else:
    g.es(f"Path {direc} doesn't exist")

</t>
<t tx="tom.20230509143801.1">c.executeMinibufferCommand('vr3-toggle-tab')
</t>
<t tx="tom.20230509143810.1">c.executeMinibufferCommand('execute-external-file')</t>
<t tx="tom.20230511011156.1">@language python

"""Put an indented list of tree nodes into clipboard.

The list includes the selected node and its subtree.
Only the headlines are copied.
"""
TABSIZE = ' ' * 4

p = c.p
tree = p.self_and_subtree()

indented = ''
level0 = p.level()
for x in tree:
    indent = TABSIZE * (x.level() - level0)
    indented += indent + x.v.h + '\n'

g.app.gui.replaceClipboardWith(indented)
</t>
<t tx="tom.20230511011217.1">@language python

"""Create an indented list for a subtree, including the body."""
TABSIZE = ' ' * 4

p = c.p
tree = p.self_and_subtree()

indented = ''
level0 = p.level()
for x in tree:
    indent = TABSIZE * (x.level() - level0)
    indented += indent + x.h + '\n' 
    indented += indent + '=' * len(x.h) + '\n'
    body_rows = x.b.split('\n')
    indented += indent + f'\n{indent}'.join(body_rows) + '\n'
#return indented

g.app.gui.replaceClipboardWith(indented)
</t>
<t tx="tom.20230511011242.1">@language python

"""Put an indented list of tree nodes into clipboard.

The list includes the selected node and its subtree.
Only the headlines are copied.
"""
TABSIZE = ' ' * 4

p = c.p
tree = p.self_and_subtree()

indented = ''
level0 = p.level()
for x in tree:
    indent = TABSIZE * (x.level() - level0)
    indented += indent + x.v.h + '\n'
g.app.gui.replaceClipboardWith(indented)
</t>
</tnodes>
</leo_file>
