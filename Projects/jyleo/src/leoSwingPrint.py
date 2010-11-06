#@+leo-ver=4-thin
#@+node:zorcanda!.20050325114421:@thin leoSwingPrint.py
import javax.print as jprint
import javax.print.attribute as jatt
import javax.print.event as jevent
import javax.swing as swing
import java.lang as jlang
import java.io as io
import java.util as util
import java.util.jar as jar
import java
import javax.imageio as imio
import javax.imageio.stream as imstream
import leoGlobals as g
from utilities.DefCallable import DefCallable
jfree_ok = 0
jfree_loaded = 0
try:
    pass
    #import org.jfree.report as jreport
    #import org.jfree.report.modules.gui.base as jbase
    #import org.jfree.report.elementfactory.TextFieldElementFactory as factory
    #import org.jfree.ui.FloatDimension as FloatDimension
    #jfree_ok = 1
    
except:
    pass

    
#@<<JFreeReportClassLoader>>
#@+node:zorcanda!.20051107123858:<<JFreeReportClassLoader>>
import ClassLoaderBase
class JFreeReportClassLoader( ClassLoaderBase ):
    
    def __init__( self ):
        jlang.ClassLoader.__init__( self )
        self.jars = []
        self.loaded = {}
        
    def walkAndAdd( self, path ):
        
        import os.path
        os.path.walk( path, self.callback, path )
    
    def callback( self, arg, dirpath, namelist ):

        path = dirpath[ len( arg ): ]
        if path.startswith( "/jfreereport" ):
            for z in namelist:
                if z.endswith( ".jar" ):
                    self.addJar( "%s/%s" % ( dirpath, z ) )
                    
        
    
            


#@-node:zorcanda!.20051107123858:<<JFreeReportClassLoader>>
#@nl
try:
    jfcl = JFreeReportClassLoader()
    f = io.File( g.app.loadDir )
    pf = f.getParent()
    jf = io.File( pf, "jars" )
    jfcl.walkAndAdd( jf.getAbsolutePath() )

    def loadJFreeReport():
        rv = { "JFreeReportBoot": "org.jfree.report.JFreeReportBoot",
                "JFreeReport": "org.jfree.report.JFreeReport",
                "factory": "org.jfree.report.elementfactory.TextFieldElementFactory",
                "FloatDimension" : "org.jfree.ui.FloatDimension",
                "ElementAlignment" : "org.jfree.report.ElementAlignment",
                "PreviewFrame" : "org.jfree.report.modules.gui.base.PreviewFrame" }
                
        for z in rv.keys():
            clazz = jfcl.loadClass( rv[ z ] )
            jfcl.resolve( clazz )
            rv[ z ] = clazz

        JFreeReportBoot = rv[ "JFreeReportBoot" ]
        instance = JFreeReportBoot.getInstance()
        instance.start()
        return rv

    dc = DefCallable( loadJFreeReport )
    ft = dc.wrappedAsFutureTask()
    nwthread = jlang.Thread( ft )
    nwthread.setContextClassLoader( jfcl )
    nwthread.start()
    rv = ft.get()
    globals().update( rv )
    jfree_ok = 1 
except java.lang.Exception, x:
    jfree_ok = 0

class leoSwingPrint:
    '''a class that prints Outline data'''
    
    #@    @+others
    #@+node:zorcanda!.20050325114421.1:__init__
    def __init__( self, c ):
        
        self.c = c
        
    #@-node:zorcanda!.20050325114421.1:__init__
    #@+node:zorcanda!.20050811125351:getAsMenu
    def getAsMenu( self ):
        
        disabled_text = "Disabled --> JFreeReport not loaded"
        main = swing.JMenu( "Printing and Exporting" )
        jmi = swing.JMenuItem( "Print/Export Node" )
        jmi.actionPerformed = self.printNode
        jmi.setToolTipText( "Writes out Node and Subnodes into one Document" )
        if not jfree_ok:
            jmi.setEnabled( 0 )
            jmi.setToolTipText( disabled_text )
        main.add( jmi )
        jmi = swing.JMenuItem( "Print/Export Outline As More" )
        jmi.actionPerformed = self.printOutlineAsMore
        jmi.setToolTipText( "Writes out Outline in More format" )
        if not jfree_ok:
            jmi.setEnabled( 0 )
            jmi.setToolTipText( disabled_text )
        main.add( jmi )
        jmi = swing.JMenuItem( "Print Tree As Is" )
        jmi.actionPerformed = self.printTreeAsIs
        jmi.setToolTipText( "Prints out an Image of the Outline" )
        main.add( jmi )
        return main
    #@nonl
    #@-node:zorcanda!.20050811125351:getAsMenu
    #@+node:zorcanda!.20050419193324:printers
    #@+at
    # These nodes create the data that is sent
    # to the sender methods
    #@-at
    #@@c
    
    #@+others
    #@+node:zorcanda!.20050326160516:printMarkedNodes
    def printMarkedNodes( self, type = jprint.DocFlavor.STRING.TEXT_PLAIN ):
        
        marked_nodes = []
        
        c = self.c
        rp = c.rootPosition()
        for z in rp.allNodes_iter( copy = True ):
            if z.isMarked():
                marked_nodes.append( z )
                
                
        strings = []
        at = c.atFileCommands
        c.fileCommands.assignFileIndices()
        for z in marked_nodes:
            at.write(z.copy(),nosentinels=True,toString=True,scriptWrite=True)
            data = at.stringOutput
            strings.append( data )
            
        
        ndata = '\n'.join( strings )
        self.sendStringToPrinter( ndata , type = type )
        
    
    #@-node:zorcanda!.20050326160516:printMarkedNodes
    #@+node:zorcanda!.20050325115459:printNode
    def printNode( self, type= None  ):
        
        c = self.c
        cp = c.currentPosition()
        
        at = c.atFileCommands 
        c.fileCommands.assignFileIndices()
        at.write(cp.copy(),nosentinels=True,toString=True,scriptWrite=True)
    
        data = at.stringOutput
        return self.sendStringToJFreeReport( cp.headString(), data )
        
    
    
    
        
        
    
    
    #@-node:zorcanda!.20050325115459:printNode
    #@+node:zorcanda!.20050419163733:printTreeAsIs
    def printTreeAsIs( self , *args ):
        
        jtree = self.c.frame.tree.jtree
        jsize = jtree.getSize()
        
        bi = java.awt.image.BufferedImage( jsize.width, jsize.height, java.awt.image.BufferedImage.TYPE_3BYTE_BGR )
        graphics = bi.getGraphics()
        jtree.paint( graphics )
        graphics.dispose()
        
        
        baos = java.io.ByteArrayOutputStream()
        ifos = imstream.MemoryCacheImageOutputStream( baos )
        #ifos = imstream.FileImageOutputStream( java.io.File( "tree.jpeg" ) )
        writers = imio.ImageIO.getImageWritersBySuffix( "jpeg" )
        writer = None
        for z in writers:
            writer = z
            break
            
        writer.setOutput( ifos )
        writer.write( bi )
        jtree.repaint()
        #ifos.close()
        ba = baos.toByteArray()
        ifos.close()
        self.sendByteArrayToPrinter( ba )
        
        
        
    
    #@-node:zorcanda!.20050419163733:printTreeAsIs
    #@+node:zorcanda!.20050419181658:printOutlineAsMore
    def printOutlineAsMore( self, *args ):
    
        p = self.c.rootPosition()
        nodes = []
        for v in p.allNodes_iter( copy = True): 
            head = v.moreHead( 0 )
            s = head +'\n'
            body = v.moreBody() # Inserts escapes.
            s += body
            nodes.append( s )
            
        
        wholestring = '\n'.join( nodes )
        #self.sendStringToPrinter( wholestring )
        self.sendStringToJFreeReport( "", wholestring )
        
        
    #@nonl
    #@-node:zorcanda!.20050419181658:printOutlineAsMore
    #@-others
    #@-node:zorcanda!.20050419193324:printers
    #@+node:zorcanda!.20050419193324.1:senders
    #@+at
    # These nodes send different types of data to the printer,
    # if they can find one that works for the type
    #@-at
    #@@c
    
    #@+others
    #@+node:zorcanda!.20050811124256:sendStringToJFreeReport
    def sendStringToJFreeReport( self, title, data ):
        
        if not jfree_ok:
            swing.JOptionPane.showMessageDialog( "JyLeo could not load JFreeReport.  Printing Aborted" )
            return
        
        dtm = swing.table.DefaultTableModel()
        dtm.addColumn( "Data" )
        for z in data.split( '\n' ):
            dtm.addRow( [ z, ] )
               
        jfr = JFreeReport()
        tf = factory() #.TextFieldElementFactory()
        tf.setName( "t1" )
        tf.setAbsolutePosition( java.awt.geom.Point2D.Float(0, 0));
        pd = jfr.getPageDefinition()
        tf.setMinimumSize( FloatDimension( pd.getWidth() , 12));
        tf.setColor(java.awt.Color.black);
        tf.setHorizontalAlignment(ElementAlignment.LEFT);
        tf.setVerticalAlignment( ElementAlignment.MIDDLE);
        tf.setFieldname("Data")
        element = tf.createElement()
        element.setDynamicContent( 1 )
        jfr.getItemBand().addElement( element )
        jfr.setName( title )
        jfr.setData( dtm )
        cthread = jlang.Thread.currentThread()
        ccl = cthread.getContextClassLoader()
        cthread.setContextClassLoader( jfcl )
        pf = PreviewFrame( jfr )
        pf.pack()
        g.app.gui.center_dialog( pf )
        pf.setExtendedState( pf.MAXIMIZED_BOTH )
        pf.setVisible( 1 )
        cthread.setContextClassLoader( ccl )
        return    
    
    
    
    #@-node:zorcanda!.20050811124256:sendStringToJFreeReport
    #@+node:zorcanda!.20050326154258:sendStringToPrinter
    def sendStringToPrinter( self, data , type = jprint.DocFlavor.BYTE_ARRAY.TEXT_PLAIN_HOST ):
        
        hatt = jatt.HashDocAttributeSet()
        type = jprint.DocFlavor.INPUT_STREAM.AUTOSENSE
        bais = java.io.ByteArrayInputStream( jlang.String( data ).getBytes( "US-ASCII" ) )
        sdoc = jprint.SimpleDoc( bais, type , hatt )
        pservices = jprint.PrintServiceLookup.lookupPrintServices( type , hatt )
        print pservices
        
        if pservices:
            hpattset = jatt.HashPrintRequestAttributeSet()
            ps = jprint.ServiceUI.printDialog( None, 50, 50, pservices, pservices[ 0 ], type , hpattset )
            if ps:
                dpj = ps.createPrintJob()
                dpj.addPrintJobListener( self.PrintJobReporter() )
                try:
                    dpj.print( sdoc, hpattset )
                except jlang.Exception, x:
                    g.es( "Could not execute print job", color='red' )
        else:
            g.es( "Could not find printer for type %s" % type, color='red' )
    #@nonl
    #@-node:zorcanda!.20050326154258:sendStringToPrinter
    #@+node:zorcanda!.20050419170345:sendByteArrayToPrinter
    def sendByteArrayToPrinter( self, data, type = jprint.DocFlavor.BYTE_ARRAY.JPEG ):
        
        hatt = jatt.HashDocAttributeSet()
        sdoc = jprint.SimpleDoc( data , type , hatt )
        pservices = jprint.PrintServiceLookup.lookupPrintServices( type , hatt )
        
        if pservices:
            hpattset = jatt.HashPrintRequestAttributeSet()
            ps = jprint.ServiceUI.printDialog( None, 50, 50, pservices, pservices[ 0 ], type, hpattset )
            if ps:
                dpj = ps.createPrintJob()
                dpj.addPrintJobListener( self.PrintJobReporter() )
                try:
                    dpj.print( sdoc, hpattset )
                except jlang.Exception, x:
                    g.es( "Could not execute print job", color='red' )    
                    
        else:
            g.es( "Could not find printer for type %s" % type, color = 'red' )
    #@-node:zorcanda!.20050419170345:sendByteArrayToPrinter
    #@-others
    #@-node:zorcanda!.20050419193324.1:senders
    #@+node:zorcanda!.20050326154930:class PrintJobReporter
    class PrintJobReporter( jevent.PrintJobListener ):
        '''A Class that reports on how well a Print Job is doing'''
        def __init__( self ):
            pass
            #jevent.PrintJobListener.__init__( self )
                
                
        def printDataTransferCompleted( self, pje):
        
            g.es( "Printing has started...", color='blue' )
            
        def printJobCanceled( self, pje):
            
            g.es( "Printing has been canceled", color='red' )
            
        def printJobCompleted( self, pje):
            
            g.es( "Printing has completed", color='blue' )
            
        def printJobFailed( self, pje):
            
            g.es( "Printing has failed", color='red' )
            
        def printJobNoMoreEvents( self, pje):
            pass
            #g.es( "No more events" )
            
        def printJobRequiresAttention( self, pje):
            
            g.es( "Print job requires attention", color='red' )
            
    #@-node:zorcanda!.20050326154930:class PrintJobReporter
    #@+node:zorcanda!.20050325142820:class LeoPageable
    #@+at
    # class LeoPageable( jprint.Pageable, jprint.Printable ):
    #     def __init__( self, page_data, font ):
    #         self._page_data = page_data
    #         self._font = font
    #     def getNumberOfPages( self ):
    #         return self.UNKNOWN_NUMBER_OF_PAGES
    #     def getPageFormat( self, i ):
    #         return jprint.PageFormat.PORTRAIT
    #     def getPrintable( self, i ):
    #         return self
    # 
    #     def print( self, graphics, pageFormat,pageIndex):
    #         graphics.translate( pageFormat.getImageableX(), 
    # pageFormat.getImageableY() )
    #         graphics.setFont( self._font )
    #         fm = graphics.getFontMetrics()
    #         height = fm.getHeight()
    #         iheight = pageFormat.getImageableHeight()
    #         lines_per_page = iheight/height
    #         nstart = 0
    #         for z in self._page_data:
    #             g.drawString( jlang.String( z ), 0, nstart )
    #             nstart += 1
    #             if nstart == lines_per_page:
    #                 return
    #@-at
    #@-node:zorcanda!.20050325142820:class LeoPageable
    #@+node:zorcanda!.20050810174530:a simple test
    #@+at
    # This code will show what the 'default' service provides in terms of 
    # printing
    # 
    # import javax.print as pr
    # ps1 = pr.PrintServiceLookup
    # ds = ps1.lookupDefaultPrintService()
    # ds.getSupportedDocFlavors()
    #@-at
    #@-node:zorcanda!.20050810174530:a simple test
    #@-others
#@nonl
#@-node:zorcanda!.20050325114421:@thin leoSwingPrint.py
#@-leo
