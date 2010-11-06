#@+leo-ver=4-thin
#@+node:zorcanda!.20050917120209:@thin leoSwingLeoTutorial.py
import javax.swing as swing
import java
import java.net as net
import javax.swing.text as stext
import javax.swing.text.html as html
import javax.swing.text.html.parser as phtml
import javax.xml.parsers as jparse
import javax.xml.transform as transform
import javax.xml.transform.dom as tdom
import javax.xml.transform.stream as stream
import java.io as io
import leoGlobals as g
from utilities.DoNothingEntityResolver import DoNothingEntityResolver

ACTIVATED = swing.event.HyperlinkEvent.EventType.ACTIVATED
ENTERED = swing.event.HyperlinkEvent.EventType.ENTERED
EXITED = swing.event.HyperlinkEvent.EventType.EXITED 


        
class leoSwingLeoTutorial:
    
    def __init__( self ):
        
        self.cached_pages = {}
        self.seen_elements =[]
        self.entered = []
        dbf = jparse.DocumentBuilderFactory.newInstance()        
        dbf.setValidating( 0 )
        dbf.setIgnoringComments( 1 )
        self.documentBuilder = dbf.newDocumentBuilder()
        self.documentBuilder.setEntityResolver( DoNothingEntityResolver() )
        self.htmlPane = swing.JEditorPane( "text/html", "" , editable = 0, hyperlinkUpdate = self.followHyperlink )
        self.jsp = swing.JScrollPane( self.htmlPane )
        self.html_dir = g.os_path_join( g.app.loadDir ,"..","doc","html", "leo_TOC.html" )
        self.fakeDoc = html.HTMLDocument()
        ifile = io.File( self.html_dir )
        self.homeUrl = url = ifile.getCanonicalFile().toURL()
        self.setPage( url )

        
    def getWidget( self ):
        return self.jsp
        
    def goHome( self ):
        url = self.homeUrl
        the_file = url.getFile()
        self.htmlPane.setDocument( self.cached_pages[ the_file ] )
        
    def setPage( self, url ):
        
        ref = url.getRef()
        protocol = url.getProtocol()
        the_file = url.getFile()
        
        
        if protocol != "file" or the_file.endswith( "front.html" ):
            url = self.homeUrl
            the_file = url.getFile()
            
        if self.cached_pages.has_key( the_file ):
            if self.htmlPane.getDocument() != self.cached_pages[ the_file ]: # or ref:
                #self.htmlPane.setDocument( self.fakeDoc )
                self.htmlPane.setDocument( self.cached_pages[ the_file ] )
        else:
            
            try:
                doc = self.documentBuilder.parse( url.getContent() )
            except java.lang.Exception, x:
                x.printStackTrace()
                return self.goHome()
                
            style = doc.getElementsByTagName( "style" )
            style_list = []
            for x in xrange( style.length ):
                node = style.item( x )
                style_list.append( node )
            for x2 in style_list:
                parent = x2.getParentNode()
                parent.removeChild( x2 )


            meta = doc.getElementsByTagName( "meta" )
            meta_list = []
            for x3 in xrange( meta.length ):
                mnode = meta.item( x3 )
                meta_list.append( mnode )
            for x4 in meta_list:
                parent = x4.getParentNode()
                parent.removeChild( x4 )
                
                
                
            trans = transform.TransformerFactory.newInstance().newTransformer()
            dsource = tdom.DOMSource( doc )
            sw = io.StringWriter()
            sr = stream.StreamResult( sw )
            trans.transform( dsource, sr )
            ekit = self.htmlPane.getEditorKit().clone()
            s = sw.toString()
            spot = s.find( "\n" )
            s = s[ spot: ] # remove the xml prolog... 
            sr = io.StringReader( s )
            hdoc = ekit.createDefaultDocument()            
            hdoc.setBase( url )
            try:
                ekit.read( sr, hdoc, 0 )
            except java.lang.Exception, x:
                x.printStackTrace()
                return self.goHome()
            
            self.cached_pages[ the_file ] = hdoc
            self.htmlPane.setDocument( hdoc )
    
        if ref:
            self.htmlPane.scrollToReference( ref )    
        
    def colorizeHyperlinks( self ):
        '''do to the fact that exited, entered and activated dont execute in the 
           order that is needed we must keep track of what has happened to which element
           and colorize the elements based off of their history'''
        for z in self.entered:
            doc = z.getDocument()
            start = z.getStartOffset()
            end = z.getEndOffset()
            sas = stext.SimpleAttributeSet()
            if z in self.seen_elements:
                stext.StyleConstants.setForeground( sas, java.awt.Color.RED )
            else:
                stext.StyleConstants.setForeground( sas, java.awt.Color.BLUE )
            doc.setCharacterAttributes( start, end - start, sas , 0 )
            #doc.setParagraphAttributes( start, end - start, sas , 0 )
        self.entered = []
        
    def followHyperlink( self, hlEvent ):
        aset = element = hlEvent.getSourceElement()
        doc = element.getDocument()
        start = element.getStartOffset()
        end = element.getEndOffset()
        
        if hlEvent.eventType == ACTIVATED:
            url = hlEvent.URL    
            self.seen_elements.append( element )
            self.colorizeHyperlinks()
            self.setPage( url )             
        elif hlEvent.eventType == ENTERED:
            self.colorizeHyperlinks()
            self.entered.append( element )
            aset = stext.SimpleAttributeSet()
            stext.StyleConstants.setForeground( aset, java.awt.Color.GREEN )
            doc.setCharacterAttributes( start, end - start, aset, 0 )
            #doc.setParagraphAttributes( start, end - start, aset, 0 )
        elif hlEvent.eventType == EXITED:
            self.colorizeHyperlinks()
#@-node:zorcanda!.20050917120209:@thin leoSwingLeoTutorial.py
#@-leo
