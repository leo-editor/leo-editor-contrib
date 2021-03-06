#@+leo-ver=5-thin
#@+node:ville.20110413215331.2589: * @file create_leoq.py
import sqlite3

treefrag_schema = """
drop table if exists blobs;

CREATE TABLE blobs (
 id INTEGER PRIMARY KEY,
 format INTEGER,
 data BLOB
);

drop table if exists nodes;

CREATE TABLE nodes (
 id INTEGER PRIMARY KEY,
 gnx VARCHAR(20),
 
 h TEXT,
 bodyid INTEGER REFERENCES blobs(id)
);

-- 0 is always root node
INSERT INTO nodes (id, h) values (0, '__INVISIBLE_ROOT__');
 
drop table if exists edges;

CREATE TABLE edges (
 a INTEGER NOT NULL REFERENCES nodes(id),
 b INTEGER NOT NULL REFERENCES nodes(id),
 pos INTEGER NOT NULL,
 PRIMARY KEY (a, b, pos)
);
 
CREATE INDEX a_idx ON edges (a);
CREATE INDEX b_idx ON edges (b);
"""

class TreeFrag:
    def __init__(self, dbfile):
        self.conn = sqlite3.connect(dbfile)
        # gnx => node id
        self.gnxs = {}

    def reset_db(self):
        cu = self.conn.cursor()
        cu.executescript(treefrag_schema)
        self.conn.commit()

    def dump_node(self, p):
        
        cu = self.conn.cursor()
        body = sqlite3.Binary(p.b)
        cmd = "insert into blobs (data) values (?)"
        t = (body,)
        cu.execute(cmd, t)
        bod_id = cu.lastrowid
        print "inserted", bod_id
        
        cmd = "insert into nodes (gnx, h, bodyid) values (?, ?, ?)"
        t = p.gnx, p.h, bod_id
        cu.execute(cmd, t)
        node_id = cu.lastrowid
        
        return node_id
        
                
    def write_vnodes(self, c, pos = None):
        """ Write all nodes (no edges) """
        if pos is None:
            it = c.all_unique_nodes()
        else:
            it = pos.unique_subtree()
        for p in it:
            nid = self.dump_node(p)
            self.gnxs[p.gnx] = nid
                        
        if pos:
            self.dump_node(pos)
            
        self.conn.commit()            
            
    def write_edges(self, p):
        chi = p.children()
        par = self.gnxs[p.gnx]
        cu = self.conn.cursor()
        for i, ch in enumerate(chi):
            cmd = "insert into edges (a,b,pos) values (?,?,?)"            
            t = (par, self.gnxs[ch.gnx], i)
            print cmd,t
            cu.execute(cmd,t)
            
    def write_top_edges(self):
        # create edges from "0" (root) to top level nodes
        cu = self.conn.cursor()
        for i, ch in enumerate(c.rootPosition().self_and_siblings()):
            cmd = "insert into edges (a,b,pos) values (0,?,?)"
            t = (self.gnxs[ch.gnx], i)
            print cmd,t
            cu.execute(cmd,t)
        
            
            

    def write_all_edges(self,c):
        all = c.all_unique_positions()
        
        for p in all:
            self.write_edges(p.copy())        

        self.write_top_edges()        
        self.conn.commit()
            
        
def test(c):
    tf = TreeFrag("/home/ville/treefrag.db")
    tf.reset_db()
    print "begin dump"
    tf.write_vnodes(c)       
    tf.write_all_edges(c)
    print "end dump"
    
test(c)

#@-leo
