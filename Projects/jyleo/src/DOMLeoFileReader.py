#@+leo-ver=4-thin
#@+node:zorcanda!.20050908210137:@thin DOMLeoFileReader.py
import javax.xml.parsers as jparse
import java.io as io



def read( filename ):
    
    dbf = jparse.DocumentBuilderFactory.newInstance()
    db = dbf.newDocumentBuilder()
    fis = io.FileInputStream( filename )
    doc = db.parse( fis )
    fis.close()
    doc.normalizeDocument()
    leo_file = doc.getDocumentElement()
    print leo_file
    print "-------"
    #de.normalizeDocument()
    print "-------"
    cnodes = leo_file.getChildNodes()
    nodes = {}
    for z in xrange( cnodes.length ):
        node = cnodes.item( z )
        print node
        nodes[ node.getNodeName() ] = node
        
    
    tnodes = nodes[ 'tnodes' ]
    tchildren = tnodes.getChildNodes()
    tnodes2 = {}
    for z in xrange( tchildren.length ):
        tnode = tchildren.item( z )
        if tnode.getNodeName() == 't':
            #print tnode
            print tnode.getTextContent()
            atts = tnode.getAttributes()
            print atts.getNamedItem( "tx" ).getTextContent()
            tx = atts.getNamedItem( "tx" ).getTextContent()
            tnodes2[ tx ] = tnode.getTextContent()
    
    print tnodes2
    
    #do vnodes
    
    vnodes = nodes[ 'vnodes' ]
    vchildren = vnodes.getChildNodes()
    for z in xrange( vchildren.length ):
        #print vchildren.item( z )
        item = vchildren.item( z )
        if item.getNodeName() == 'v':
            recursiveWalkV( item, tnodes2 )
            

def recursiveWalkV( v, tnodes2 ):
    
    clist = v.getChildNodes()
    atts = v.getAttributes()
    print "atts is %s" % atts
    print "V t is %s" % atts.getNamedItem( "t" ).getTextContent()
    print "Tnodes2 has %s" % tnodes2.has_key( atts.getNamedItem( "t" ).getTextContent() )
    for z in xrange( clist.length ):
        node = clist.item( z )
        if node.getNodeName() == "vh":
            print "vh is %s" % node.getTextContent()
        elif node.getNodeName() == "v":
            print "DESCENT!"
            recursiveWalkV( node, tnodes2 )
        
        

if __name__ == "__main__":
    import sys
    arg2 = sys.argv[ 1 ]
    read( arg2 )
#@nonl
#@-node:zorcanda!.20050908210137:@thin DOMLeoFileReader.py
#@-leo
