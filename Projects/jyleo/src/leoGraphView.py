#@+leo-ver=4-thin
#@+node:zorcanda!.20050523094436:@thin leoGraphView.py
#@@language python

import org.jgraph as jg
import org.jgraph.graph as graph
import javax.swing as swing
import java

class leoGraphView:
    
    def __init__( self, c ):
    
        self.cp = c.currentPosition().copy()
        self.cs = graph.ConnectionSet()    
        self.dgm = graph.DefaultGraphModel()
        parent  = self.walkChildren()
        self.dgm.insert( parent , java.util.Hashtable(), self.cs, None, None )
        jf = swing.JFrame()
        jg1 = jg.JGraph( self.dgm )
        jg1.setSize( 1000, 1000 )
        print jg1.getSize()
        print "BENDABLE %s" % jg1.isBendable()
        jg1.setDragEnabled( 0 )
        jsp = swing.JScrollPane( jg1 )
        jf.add( jsp )
        jf.visible = 1
    
    def walkChildren( self ):
        
        items = []
        parents = {}
        cp = self.cp
        cs = self.cs
        parent = graph.DefaultGraphCell( cp.headString() )
        p1 = graph.DefaultPort( "" )
        atts = p1.getAttributes()
        print graph.GraphConstants.getLabelPosition( atts )
        #graph.GraphConstants.setLabelPosition( atts, java.awt.Point( 500, 500 ) )
        graph.GraphConstants.setBounds( atts, java.awt.Rectangle( 500, 500, 100, 100 ) )
        p1.changeAttributes( atts ) 
        parents[ cp ] = p1
        parent.add( p1 )
        items.append( parent )
        for z in cp.subtree_iter( copy = True ):
            child = graph.DefaultGraphCell( z.headString() )
            p2 = graph.DefaultPort( "" )
            atts = p2.getAttributes()
            graph.GraphConstants.setDisconnectable( atts, 0 )
            p2.changeAttributes( atts )
            parents[ z ] = p2
            _parent = z.getParent()
            #print child
            #print _parent
            #print parents
            p3 = parents[ _parent ]
            child.add( p2 )
            edge = graph.DefaultEdge( str( z.childIndex() ) )
            atts = edge.getAttributes()
            graph.GraphConstants.setLineStyle( atts, graph.GraphConstants.STYLE_BEZIER )
            graph.GraphConstants.setAutoSize( atts, 1 )
            graph.GraphConstants.setLineEnd( atts, graph.GraphConstants.ARROW_CLASSIC )
            edge.changeAttributes( atts )
            cs.connect( edge, p2, p3 )
            items.extend( [ child, edge ] ) 
         
        #return parent    
        return items    
#@nonl
#@-node:zorcanda!.20050523094436:@thin leoGraphView.py
#@-leo
