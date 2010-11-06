#@+leo-ver=4-thin
#@+node:zorcanda!.20050804212319:@thin CutCopyPaste.py
import java
import javax.swing as swing
import java.awt.event as aevent


class CutCopyPaste( aevent.MouseAdapter ):
    
    def __init__( self, jtp ):
        aevent.MouseAdapter.__init__( self )
        self.jtp = jtp
        self.ccp = swing.JPopupMenu()
        cut = swing.JMenuItem( "Cut" )
        cut.actionPerformed = lambda event : jtp.cut()
        self.ccp.add( cut )
        copy = swing.JMenuItem( "Copy" )
        copy.actionPerformed = lambda event : jtp.copy()
        self.ccp.add( copy )
        paste = swing.JMenuItem( "Paste" )
        paste.actionPerformed = lambda event: jtp.paste()
        self.ccp.add( paste )
        jtp.addMouseListener( self )
    
    
    def _paste( self ):
        
        dtk = java.awt.Toolkit.getDefaultToolkit()
        cb = dtk.getSystemClipboard()
        df = cb.getAvailableDataFlavors()
        for z in df:
            print z
        
       
    def mousePressed( self, event ):
        
        if event.getButton() == event.BUTTON3:
            self.summon_ccp( event )
            
    
    def summon_ccp( self, event ):
        
        self.ccp.show( event.getSource(), event.getX(), event.getY() )
#@-node:zorcanda!.20050804212319:@thin CutCopyPaste.py
#@-leo
