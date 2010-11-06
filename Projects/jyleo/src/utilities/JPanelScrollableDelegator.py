#@+leo-ver=4-thin
#@+node:zorcanda!.20051102201318:@thin JPanelScrollableDelegator.py
import javax.swing as swing
import java

class JPanelScrollableDelegator( swing.JPanel, swing.Scrollable ):
    
    def __init__( self ):
        swing.JPanel.__init__( self )
        self.delegator = None
        self.setLayout( java.awt.GridLayout( 1, 1 ) )
        
    def setDelegator( self, widget ):
        self.delegator = widget
        
    def getPreferredScrollableViewportSize( self ):
        #print "PREFFERED!"
        #return self.getParent().getSize()
        #parent = self.getParent()
        #return parent.getViewPort().getViewSize()
        #return java.awt.Dimension( 1000, 1000 )
        #return self.delegator.getSize()
        #print self.getParent().getSize()
        #print self.getParent().getPreferredSize()
        return self.delegator.getPreferredScrollableViewportSize()
        
    def getScrollableBlockIncrement( self, visibleRect, orientation, direction):
        #print "SCROLLBI!"
        return self.delegator.getScrollableBlockIncrement( visibleRect, orientation, direction )
        
    def getScrollableTracksViewportHeight( self ):
        print "SCTVH!"
        parent = self.getParent()
        print parent.getSize(), self.delegator.getSize()
        #print getVisibleRect()
        return self.delegator.getScrollableTracksViewportHeight()
        #return False
        
    def getScrollableTracksViewportWidth( self ):
        print "SCTVW"
        parent = self.getParent()
        #print getVisibleRect()
        print parent.getSize(), self.delegator.getSize()
        return self.delegator.getScrollableTracksViewportWidth()
        #return False
        
    def getScrollableUnitIncrement( self, visibleRect, orientation, direction):
        #print "GSUI!"
        return self.delegator.getScrollableUnitIncrement( visibleRect, orientation, direction )

 
#@nonl
#@-node:zorcanda!.20051102201318:@thin JPanelScrollableDelegator.py
#@-leo
