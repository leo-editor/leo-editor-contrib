<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20190225121314.3"><vh>Pharo tools</vh></v>
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
<v t="ekr.20190225121341.3"><vh>fi.run</vh></v>
<v t="ekr.20190225121341.4"><vh>fi.read_file</vh></v>
<v t="ekr.20190225121341.5"><vh>fi.read_line</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20190225121314.3"></t>
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
<t tx="ekr.20190225121341.2"># !GrafoscopioNode methodsFor: 'adding' stamp: 'OffrayLuna 11/30/2017 12:45'!
# !ManifestGrafoscopio class methodsFor: 'code-critics' stamp: 'OffrayLuna 10/7/2016 20:34'!

chunk_pat = re.compile(r"\!(\w+)\s+(class\s*)?methodsFor:\s+\'(\w+)\'\s+stamp:\s+\'(\w+)\s+(.*)\'\!")

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
    
    is_chunk, class_name, is_class_method, organizer_name, user_name = self.is_chunk(line)
    if not is_chunk:
        if not self.class_parent:
            self.class_parent = self.parent.insertAsLastChild()
            self.p = None
        if not self.p:
            if self.organizer_p:
                self.p = self.organizer_p.insertAsLastChild()
                self.p.h = '' ###
            else:
                self.p = self.class_parent.copy()
        if line.strip() and self.p and not self.p.h:
            self.p.h = line.strip()
        self.p.b = self.p.b + line
        return
    #
    # Clean up the previous node.
    if self.p:
        self.p.b = self.p.b.strip()+'\n'
        self.p = None
    #
    # Allocate a new class node if necessary.
    old_class_name = self.class_parent and self.class_parent.h
    if old_class_name != class_name:
        g.trace('CLASS', class_name)
        self.class_parent = self.parent.insertAsLastChild()
        self.class_parent.h = class_name
        self.p = None
        self.organizer_p = None
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
</tnodes>
</leo_file>
