<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet ekr_test?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20110301090127.13995"><vh>Command-line scripts</vh>
<v t="ekr.20110301090127.13996"><vh>docs</vh>
<v t="ekr.20110301090127.13997"><vh>sn</vh></v>
<v t="ekr.20110301090127.13998"><vh>led</vh></v>
<v t="ekr.20110301090127.13999"><vh>led 2</vh></v>
</v>
<v t="ekr.20110301090127.14000"><vh>led</vh></v>
<v t="ekr.20110301090127.14001"><vh>lo</vh></v>
<v t="ekr.20110301090127.14002"><vh>sn</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20110301090127.13995"></t>
<t tx="ekr.20110301090127.13996">@language rest

Two use cases spring to mind:

Leo is already running (somewhere on my desktop) with 2-3 leo files loaded in
tabs. I'm working in a console, and I want to edit a file in the current
directory: `led foo.py` causes the running leo to create '@edit foo.py' and pop
to the front with it loaded. Vs. finding the running version of leo, then
navigating through the open file dialog to the directory I'm already in in the
shell window.

And of course with the new sticknotes plugin, set up a window manager hotkey to
pop open a new stickynote from the running leo to jot something down.

======

Since I'm making it a two-way protocol (you can execute scripts in leo, and get
results back), any kind of command line application will be possible. Something
like having leo operations in shell pipeline or shell scripts will make sense.

e.g. you could do

make | leopaste "compilation results for tuesday"

Or

leocat | grep "frobbo"

which could allow you to navigate around leo outline and press some
kind of "paste" button to dump the current node to stdout.

These are somewhat psychedelic for now, but lots of Leo is about
imagination ;-).

======

</t>
<t tx="ekr.20110301090127.13997">You can type(*), either in a shell window or the window manager's
command line entry area, "sn lisa from accounting", and a node called
"lisa from accounting" with an initial contents recording the current
time is created at the top of the leo commander which started the
server.  A stickynote window for editing that node pops up and becomes
active.  If you just type "sn" a default node name of the current time
is used.  Also a read-only attribute is set so the created date is
shown if you're running the edit_attribs.py plugin ;-)

(*) assuming you call the script 'sn' and put it on your path.
</t>
<t tx="ekr.20110301090127.13998">Here is a quick hack at a script to edit (or create and edit) a file in leo
from the command line.

 - note the ugly sys.path.append, you don't need that line if you have
  leo installed, but I only run it from bzr

 - it attempts to find a previous editing of the file in leo, but it
  could easily miss it leading you to have multiple edits of the same
  file in leo, take care, or delete the @edit node when you're done
  editing

I've wanted to be able to pop up a file in leo like this for ages.  Now
this script, called 'led' and made executable and placed on the path,
will replace 'e', my emacs invocation script.

...which is interesting I guess, that what was keeping me from
replacing emacs almost completely with leo is not leo itself, but how
leo's invoked to edit a simple file from the command line.

Apart from nxml-mode, emacs's validating xml editing mode, I can't
think what I'll use emacs for now.
</t>
<t tx="ekr.20110301090127.13999">It's probably of little benefit to people who work with mouse, menus,
and icons all the time.

But if you do everything from the command line (i.e. your OS's shell),
then it makes moving things into leo much smoother.

Suppose I've run leo and checked my todo items for the day, and now
leo's buried under some other window and I'm working in the shell in
some directory I've just created where I've just unzipped something and
now I want to edit a file that was in the .zip.

I can either
 - find the leo window
 - insert a node
 - active the open file dialog
 - navigate to the directory containing this file
 - select the file
 - and finally do the editing I want to do
or, with Ville's communication to the running leo
 - enter on the command line `led foo.txt`
 - and do the editing I want to do

where led is a script which causes the running leo to create an @edit
node containing foo.txt and pop to the front with the node selected.

Previously I was much more likely to use emacs, just because it was
easier to invoke that way from the command line.

So, opening files, creating sticky notes, invoking leo to handle output
from grep or diff or whatever - all these things are better now.

=====

The corresponding point and click process for this scenario is

a) select &gt; r-click &gt; Edit with Leo
b) or drag'n'drop from folder to Leo icon on task bar (or window if visible)

In short, I see this being a productivity boost for all users.
</t>
<t tx="ekr.20110301090127.14000">#!/usr/bin/python

'''Edit a file in leo from the command line, adds an @edit node at the top of
the outline of the first commander in the leo instance.'''

import sys
sys.path.append("/home/tbrown/Desktop/Package/leo/bzr/leo.repo/trunk")
from leo.external import lproto
import os

addr = open(os.path.expanduser('~/.leo/leoserv_sockname')).read()
pc  = lproto.LProtoClient(addr)
pc.send("""
import os
fn = %s
c = g.app.commanders()[0]
h = "@edit "+fn
n = g.findNodeAnywhere(c, h)
if not n:
 n = c.rootPosition().insertAfter()
 n.moveToRoot(c.rootPosition())
 n.h = h
 if os.path.isfile(fn):
     n.b = file(fn).read()
c.selectPosition(n)
c.redraw()
c.bringToFront()
""" % repr(os.path.join(os.getcwd(), sys.argv[1])) )
</t>
<t tx="ekr.20110301090127.14001">#!/usr/bin/python

'''Load a .leo file from the command line into a running leo instance.'''

import sys
sys.path.append("/home/tbrown/Desktop/Package/leo/bzr/leo.repo/trunk")
from leo.external import lproto
import os

addr = open(os.path.expanduser('~/.leo/leoserv_sockname')).read()
pc  = lproto.LProtoClient(addr)
pc.send("""
c = g.app.commanders()[0]
g.openWithFileName(%s, c)
""" % repr(os.path.join(os.getcwd(), sys.argv[1])) )
</t>
<t tx="ekr.20110301090127.14002">#!/usr/bin/python

'''Sticky note tie-in from command line/toolbar icon to take quick notes using
a running leo.'''

import sys
sys.path.append("/home/tbrown/Desktop/Package/leo/bzr/leo.repo/trunk")
from leo.external import lproto
import os
import time
import sys

addr = open(os.path.expanduser('~/.leo/leoserv_sockname')).read()
pc  = lproto.LProtoClient(addr)
cmd="""
c = g.app.commanders()[0]
n = c.rootPosition().insertAfter()
n.moveToRoot(c.rootPosition())
n.h = "{timestamp}"
n.b = '''{content}\n\n# {timestamp}'''
c.selectPosition(n)
c.redraw()
c.k.simulateCommand('stickynote')
""".format(timestamp=time.asctime(), content=' '.join(sys.argv[1:]))
pc.send(cmd)
# print cmd
</t>
</tnodes>
</leo_file>
