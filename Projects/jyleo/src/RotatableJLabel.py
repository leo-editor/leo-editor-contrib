#@+leo-ver=4-thin
#@+node:zorcanda!.20051113153110:@thin RotatableJLabel.py
import javax.swing as swing
import java


class RotatableJLabel( swing.JLabel ):
    
    def __init__( self, t ):
        self._rotate = False
        swing.JLabel.__init__( self, t )
    
    
    def rotateIt( self ):
        if self._rotate: self.rotate = False
        else:
            self._rotate = True            
    
    def getPreferredSize( self ):
        
        psize = self.super__getPreferredSize()
        if self._rotate:
            w = psize.width
            h = psize.height
            psize.height = w
            psize.width= h
        return psize
    
    def paintComponent( self, g ):
        
        transform = g.getTransform()
        if self._rotate:
            radians = java.lang.Math.toRadians( 90.0 )
            print radians
            print java.lang.Math.toRadians( -90.0 )
            g.rotate( radians )
            g.setColor( self.getForeground() )
            g.setRenderingHint( java.awt.RenderingHints.KEY_TEXT_ANTIALIASING, java.awt.RenderingHints.VALUE_TEXT_ANTIALIAS_ON )
            #g.drawString( self.getText(), 1, -1 )
            fm = g.getFontMetrics()
            x = 1
            for z in self.getText():
                print z
                size = fm.stringWidth( z )
                #print size, fm.getHeight()
                bi = java.awt.image.BufferedImage(  size, fm.getHeight()  , java.awt.image.BufferedImage.TYPE_INT_RGB )
                g2 = bi.getGraphics()
                #g2.rotate( radians )
                g2.setColor( java.awt.Color.GREEN )
                g2.fillRect( 0, 0, bi.getHeight(), bi.getWidth() )
                #g2.setColor( self.getForeground() )
                #g2.drawString( z, 0, size )
                #g2.rotate( radians )
                #g2.setColor( self.getForeground() )
                #g2.drawString( z, 0, 0 )
                #g.rotate( -radians, x, 1 )
                #g.drawString( z, x, 0 )
                g.drawImage( bi, x, -bi.getHeight() , None )
                x += size
        self.super__paintComponent( g )
        g.setTransform( transform )
        
        
        
if __name__ == "__main__":
    
    jf = swing.JFrame()
    jp = swing.JPanel()
    jf.add( jp )
    rjl = RotatableJLabel( "MOOOOO Is Goood For you!!!!!!" )
    jp.add( rjl )
    jf.visible = 1
    rjl.rotateIt()
    lm = swing.border.LineBorder( java.awt.Color.RED )
    #rjl.setBorder( lm )
        
        
        
#@nonl
#@-node:zorcanda!.20051113153110:@thin RotatableJLabel.py
#@-leo
