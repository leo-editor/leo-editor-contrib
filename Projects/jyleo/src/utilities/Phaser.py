#@+leo-ver=4-thin
#@+node:zorcanda!.20051208141646:@thin Phaser.py
import javax.swing as swing
import java.awt.event as aevent
import java.awt as awt
import java

class Phaser( swing.JPanel, aevent.ActionListener ):
    '''This class gradually phases a component into the gui when added.
       Also does phasing out if requested.'''
       
    def __init__( self, component ):
        swing.JPanel.__init__( self, awt.GridLayout( 1,1 ) )
        self.add( component )
        self.component = component
        self.increments = 20
        self.waitperiod = 1000/self.increments
        self.timer = swing.Timer( self.waitperiod, self )
        self.timer.start()
        self.image = None
        self.cmp_to_focus = None 
        self.phasingIn = True
        self.setOpaque( True )

    def setComponentToFocus( self, widget ):
        self.cmp_to_focus = widget 
        
    def phaseRemove( self ):
        
        myself = self
        class runner( java.lang.Runnable ):
            def run( self ):
                myself.timer = swing.Timer( myself.waitperiod, myself )
                myself.takePictureOfSelf()
                myself.setOpaque( False )
                myself.remove( myself.component )
                myself.increments = 20
                myself.timer.start()
        swing.SwingUtilities.invokeLater( runner() )
        
    def takePictureOfSelf( self ):
        psize = self.getSize()
        bi = awt.image.BufferedImage( psize.width, psize.height, awt.image.BufferedImage.TYPE_INT_RGB )
        g = bi.createGraphics()
        self.super__paint( g )
        g.dispose()
        self.image = bi        
            
    def actionPerformed( self, event ):

        self.repaint()
            
    def paint( self, g ):
        
        if self.image == None:
            self.takePictureOfSelf()
            self.setOpaque( False )
            self.remove( self.component )
            self.timer.start()
            
        if self.increments != 0:
            if self.phasingIn:
                self.phaseIn( g )
                return
            else: 
                self.phaseOut( g )
                return
                
        if self.component.getParent() is None:
            self.add( self.component )  
            if self.cmp_to_focus:
                self.cmp_to_focus.requestFocus()      
        self.super__paint( g )
        
    #@    @+others
    #@+node:zorcanda!.20051209201211:phaseIn
    def phaseIn( self, g ):
        
        alpha = 1.0/self.increments 
        self.increments -= 1
        if self.increments == 0:
            self.timer.stop()
            self.phasingIn = False
            self.setOpaque( True )
            self.repaint()
        ac = awt.AlphaComposite.getInstance( awt.AlphaComposite.SRC_OVER, alpha )
        composite = g.getComposite()
        g.setComposite( ac )
        g.drawImage( self.image, 0, 0, None )
        g.setComposite( composite )
        return    
    #@-node:zorcanda!.20051209201211:phaseIn
    #@+node:zorcanda!.20051209201328:phaseOut
    def phaseOut( self, g ):
        
        
        alpha = self.increments * .05
        self.increments -= 1
        if self.increments == 0:
            self.timer.stop()
            self.phasingIn = False
            self.getParent().remove( self )
            return
        ac = awt.AlphaComposite.getInstance( awt.AlphaComposite.SRC_OVER, alpha )
        composite = g.getComposite()
        g.setComposite( ac )
        g.drawImage( self.image, 0, 0, None )
        g.setComposite( composite )
        return   
    #@nonl
    #@-node:zorcanda!.20051209201328:phaseOut
    #@-others
    



#@-node:zorcanda!.20051208141646:@thin Phaser.py
#@-leo
