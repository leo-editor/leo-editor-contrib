#@+leo-ver=4-thin
#@+node:zorcanda!.20051208165033:@thin Slider.py
import javax.swing as swing
import java.awt.event as aevent
import java.awt as awt
import java

class Slider( swing.JPanel, aevent.ActionListener ):
    '''This class slides swing components into view, can be slid in 4 directions:
       right, left, up or down.'''
    
    right = "Right";left="Left";up="Up";down="Down"
    
    def __init__( self, component, direction = right, increments = 20, animateperiod = 1000  ):
        swing.JPanel.__init__( self )
        self.setLayout( awt.GridLayout( 1,1 ) )
        self.component = component
        self.add( component )
        self.increments = increments
        self.resetincrements = increments
        self.percentage = (100/increments) * .01
        self.waitperiod = animateperiod/self.increments
        self.timer = swing.Timer( self.waitperiod, self )
        self.image = None
        self.bgimage = None
        self._parent = None
        self.direction = direction
        self.slidingIn = True
        self.cmp_to_focus = None
        self.setOpaque( True )#We have to call this, native and synth set this property to False as default!
    
    def startRemoving( self ):
        
        myself = self
        class runner( java.lang.Runnable ):
            def run( self ):
                myself.timer = swing.Timer( myself.waitperiod, myself )
                myself.takePictureOfSelf()
                myself.setOpaque( False )
                myself.remove( myself.component )
                myself.increments = myself.resetincrements
                myself.timer.start()
        swing.SwingUtilities.invokeLater( runner() )
        
    def setComponentToFocus( self, widget ):
        self.cmp_to_focus = widget

    def takePictureOfSelf( self ):
        psize = self.getSize()
        bi = awt.image.BufferedImage( psize.width, psize.height, awt.image.BufferedImage.TYPE_INT_RGB )
        g = bi.createGraphics()
        self.super__paint( g )
        g.dispose()
        self.image = bi            
           
    def actionPerformed( self, event ):
        if self.isShowing():
            self.repaint()
        else:
            self.increments -= 1
            self.interpretIncrements()
            
    def interpretIncrements( self ):
        if self.increments == 0:
            self.timer.stop()
            self.timer = None
            if self.slidingIn:
                self.add( self.component )
                if self.cmp_to_focus:
                    self.cmp_to_focus.requestFocus()
                self.slidingIn = False
                self.setOpaque( True )
                self.repaint()
                return
            else:
                parent = self.getParent()
                if parent:
                    parent.remove( self )
                    parent.repaint()
                    return
                                
    def paint( self, g ):
        
        if self.image == None:
            self.takePictureOfSelf()
            self.remove( self.component )
            self.setOpaque( False )
            self.timer.start()
           
        if self.increments != 0:
            try:
                spot = awt.Point( 0, 0 )
                if self.slidingIn:
                    self.slideIn( g, spot )
                else:
                    self.slideOut( g, spot )   
            finally:
                self.increments -= 1
                self.interpretIncrements()
                return

        self.super__paint( g )
        
    #@    @+others
    #@+node:zorcanda!.20051208201313:slideIn
    def slideIn( self, g , spot ):
        if self.direction == self.right:
            a = self.resetincrements - self.increments
            if a == 0: a = 1
            width = int((self.image.getWidth() * self.percentage ) * a )
            height = self.image.getHeight()
            si = self.image.getSubimage( self.image.getWidth() - width , 0,  width  ,height )
            if g:
                g.drawImage( si, spot.x, spot.y, None )
        elif self.direction == self.left:
            a = self.resetincrements - self.increments
            if a == 0: a = 1
            width = int((self.image.getWidth() * self.percentage ) * a )
            height = self.image.getHeight()
            si = self.image.getSubimage( 0 , 0,  width  ,height )
            if g:
                g.drawImage( si, spot.x + ( self.image.getWidth() - width ) , spot.y, None )
        elif self.direction == self.down:
            a = self.resetincrements - self.increments
            if a == 0: a = 1
            height = int((self.image.getHeight() * self.percentage ) * a )
            width = self.image.getWidth()
            si = self.image.getSubimage( 0, self.image.getHeight() - height , width, height )
            if g:
                g.drawImage( si, spot.x, spot.y, None )
        elif self.direction == self.up:
            a = self.resetincrements - self.increments
            if a == 0: a = 1
            height = int((self.image.getHeight() * self.percentage ) * a )
            width = self.image.getWidth()
            si = self.image.getSubimage( 0, 0 , width, height )
            if g:
                g.drawImage( si, spot.x, spot.y + ( self.image.getHeight() - height ), None )       
    #@-node:zorcanda!.20051208201313:slideIn
    #@+node:zorcanda!.20051208202109:slideOut
    def slideOut( self, g , spot ):
        if self.direction == self.right:
            a = self.increments
            width = int((self.image.getWidth() * self.percentage ) * a )
            height = self.image.getHeight()
            si = self.image.getSubimage( self.image.getWidth() - width , 0,  width  ,height )
            if g:
                g.drawImage( si, spot.x, spot.y, None )
        elif self.direction == self.left:
            a = self.increments
            width = int((self.image.getWidth() * self.percentage ) * a )
            height = self.image.getHeight()
            si = self.image.getSubimage( 0 , 0,  width  ,height )
            if g:
                g.drawImage( si, spot.x + ( self.image.getWidth() - width ) , spot.y, None )
        elif self.direction == self.down:
            a = self.increments
            height = int((self.image.getHeight() * self.percentage ) * a )
            width = self.image.getWidth()
            si = self.image.getSubimage( 0, self.image.getHeight() - height , width, height )
            if g:
                g.drawImage( si, spot.x, spot.y, None )
        elif self.direction == self.up:
            a = self.increments
            height = int((self.image.getHeight() * self.percentage ) * a )
            width = self.image.getWidth()
            si = self.image.getSubimage( 0, 0 , width, height )
            if g:
                g.drawImage( si, spot.x, spot.y + ( self.image.getHeight() - height ), None )       
    #@-node:zorcanda!.20051208202109:slideOut
    #@-others
#@-node:zorcanda!.20051208165033:@thin Slider.py
#@-leo
