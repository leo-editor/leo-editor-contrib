#@+leo-ver=4-thin
#@+node:zorcanda!.20051117192717:@thin SplitMenuTest.py
import javax.swing as swing
import javax.swing.border as sborder
import java.awt as awt
import java.awt.event as aevent

class fl( aevent.MouseAdapter ):
    def __init__( self, item ):
        aevent.MouseAdapter.__init__( self )
        self.item = item
        
    def mouseEntered( self, event ):
        print "FOCUS GAING"
        self.item.setBorder( sborder.LineBorder( awt.Color.BLACK ) )
    def mouseExited( self, event ):
        print "FOCUS LOST"
        self.item.setBorder( None )
        
class Border2( sborder.Border ):
    def __init__( self ):
        pass
        
    def getBorderInsets( self, c ):
        insets = awt.Insets( 0, 15, 0, 0 )
        return insets
    def isBorderOpaque( self ): return True
    def paintBorder( self, c, g, x, y, width, height):
        
        gp = awt.GradientPaint( 0.0, 0.0, awt.Color.BLUE, 0.0, 1.0 * height, awt.Color.CYAN )
        paint = g.getPaint()
        g.setPaint( gp )
        #g.setColor( awt.Color.BLUE )
        g.fillRect( 1, 1, 13, height -2 )
        g.setPaint( paint )
        
class JMenu2( swing.JMenu ):
    def __init__( self ):
        swing.JMenu.__init__( self )
        self.widget = None
        pu = self.getPopupMenu()
        pu.setBackground( awt.Color.ORANGE )
        tborder = sborder.TitledBorder( "Yup" )
        pu.setBorder( Border2() )
        
    def setWidget( self, widget ):
        self.widget = widget
    
    def getPreferredSize( self ):
        
        ps = self.super__getPreferredSize();
        size = self.widget.getSize()
        ps.height = size.height
        return ps
       
    def getPopupMenuOrigin( self ):
        rv = self.super__getPopupMenuOrigin()
        l1 = self.widget.getLocation()
        l2 = self.getLocation()
        rv.x = rv.x - ( l2.x - l1.x ) 
        return rv
        

jf = swing.JFrame()
jmb = swing.JMenuBar()
jf.setJMenuBar( jmb )
jmb2 = swing.JMenuBar()
jb = swing.JButton( "mobers" )
jb.setBorder( None )
jb.setVerticalTextPosition( jb.BOTTOM )
print jb.getBorder()
jb.setOpaque( False )
jb.setBackground( awt.Color.ORANGE )
jmb2.add( jb )
jm = JMenu2()
jm.setBackground( awt.Color.ORANGE )
jm.setOpaque( False )
jm.setWidget( jb )
jmb2.add( jm )
jmb2.setBackground( awt.Color.ORANGE )
slayout = swing.SpringLayout()
jmb2.setLayout( slayout )
slayout.putConstraint( slayout.WEST, jb, 0, slayout.WEST, jmb2 )
slayout.putConstraint( slayout.SOUTH, jmb2, 0, slayout.SOUTH, jb )

slayout.putConstraint( slayout.WEST, jm, 0, slayout.EAST, jb )
slayout.putConstraint( slayout.NORTH, jm, 0, slayout.NORTH, jb )
slayout.putConstraint( slayout.SOUTH, jm, 0, slayout.SOUTH, jb )
slayout.putConstraint( slayout.EAST, jmb2, 0, slayout.EAST, jm )
slayout.putConstraint( slayout.NORTH, jmb2, 0, slayout.NORTH, jb )


#jmb.add( jmb2 )
jmb3 = swing.JMenuBar()
jmb3.add( jmb2 )
jf.add( jmb3 )
ii = swing.ImageIcon( "/home/brihar/jyportLeo/arrow.gif" )
ii2 = swing.ImageIcon( "/home/brihar/jyportLeo/moveup.gif" )
jb.setIcon( ii2 )
jb.setVerticalTextPosition( jb.BOTTOM ) 
jb.setHorizontalTextPosition( jb.CENTER )
jmi = swing.JMenuItem( "BORK" )
jm.add( jmi )
jm.setIcon( ii )
#jm.addMouseListener( fl( jm ) )
#jm.setFocusable( True )
#jm.setRolloverEnabled( 1 )
#jm.setFocusPainted( True )
#jm.setBorder( sborder.LineBorder( awt.Color.BLACK ) )
jm2 = swing.JMenu( "GOOD" )
jm.add( jm2 )

jf.visible = 1
#@nonl
#@-node:zorcanda!.20051117192717:@thin SplitMenuTest.py
#@-leo
