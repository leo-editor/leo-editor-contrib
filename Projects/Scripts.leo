<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="maphew.20191202130954.1"><vh>Read me</vh></v>
<v t="maphew.20191202130937.2"><vh>Scripts</vh>
<v t="maphew.20191202131227.1"><vh>@clean search-dirs-for-text.py</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="maphew.20191202130937.2">@path scripts
</t>
<t tx="maphew.20191202130954.1">Some scripts people have made with/for Leo.

There's probably a thread or two on the mailing list about them.</t>
<t tx="maphew.20191202131227.1">@language python
''' Search folder tree for the specified pattern

Windows only at present.

matt wilkie &lt;maphew@gmail.com&gt; Nov 2019
'''
import os
import shlex
import subprocess

# what to search for
pattern="dist.leo"
    #Todo: make this a parameter or prompt!

g.es_print('='*40)
g.es_print('Running search-dirs-for-string')

searchdir=os.path.join(g.app.loadDir, '../../*')

command = f'findstr -i -s -p "{pattern}" {searchdir}'
    # windows specific cmd

#g.es_print(shlex.split(command))  # debug

p = subprocess.run(shlex.split(command), 
        shell=True,
        stdout=subprocess.PIPE,
        stderr=None)

out = p.stdout
#err = p.stderr()
lines = [g.toUnicode(z) for z in g.splitLines(out or [])]
lines = [os.path.relpath(z, searchdir[:-2]) for z in lines]
    # Remove Leo app dir prefix, less noise

p2 = c.p.insertAfter()
p2.h = f"Find results: {pattern}"
p2.b = f"""--- Matches for {pattern} under:
--- {searchdir}

{''.join(lines)}
"""
c.selectPosition(p2)
c.redraw()
g.es_print('Results in next node')

'''Sources:

Run shell command and capture results:
LeoPyRef.leo#Found:shlex.split(command)--&gt;g.execGitCommand

Put results into new node and redraw (EKR):
https://groups.google.com/d/topic/leo-editor/s16fP2pcxqM/discussion

Removing a path prefix (Mitch):
https://stackoverflow.com/questions/8693024/how-to-remove-a-path-prefix-in-python
'''
### Scrabpbook ###
#dir of the Leo file we're in right now
#   leo-editor/leo/dist
#g.es_print(g.os_path_dirname(c.fileName()))
</t>
</tnodes>
</leo_file>
