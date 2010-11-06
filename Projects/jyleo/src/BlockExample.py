import javax.swing as swing
import javax.swing.text as stext
import javax.swing.event as sevent
import java.awt.event as aevent

jf = swing.JFrame()
jtp = swing.JTextPane()
jsp = swing.JScrollPane( jtp )
jf.add( jsp )

class doc1( sevent.DocumentListener ):
    
    
    def removeUpdate( self, event ):
        
        print stext.Utilities.getRowStart( jtp, event.getOffset() )
        
    def changeUpdate( self, event ):
        #print event
        pass
        
    def insertUpdate( self, event ):
        #print event
        pass
        
class kp( aevent.KeyAdapter ):
    
    def __init__( self ):
        aevent.KeyAdapter.__init__( self )
            
    def keyPressed( self, event ):
        
        #event.consume()
        kc = event.getKeyChar()
        print kc
        if kc == 'x':
            event.consume()
            cp = jtp.getCaretPosition()
            rs = stext.Utilities.getRowStart( jtp, cp )
            re = stext.Utilities.getRowEnd( jtp, cp )
            rs1 = stext.Utilities.getRowStart( jtp, re + 1 )
            re1 = stext.Utilities.getRowEnd( jtp, re + 1 )
            doc = jtp.getDocument()
            line1 = doc.getText( rs, re - rs )
            line2 = doc.getText( rs1, re1- rs1 )
            doc.replace( rs1, re1 - rs1, line1, None )
            doc.replace( rs, re - rs, line2, None )
            
            
        
jtp.getDocument().addDocumentListener( doc1() )
jtp.addKeyListener( kp() )
jf.size = ( 400, 400 )
jf.visible = 1
