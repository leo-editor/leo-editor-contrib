//@+leo-ver=4-thin
//@+node:zorcanda!.20050309184057:@thin EditorBackground.java
//@@language java

import javax.swing.JComponent;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.GraphicsEnvironment;
import java.awt.GraphicsConfiguration;
import java.awt.GraphicsDevice;
import java.awt.Dimension;
import java.awt.Image;
import java.awt.ImageCapabilities;
import java.awt.AlphaComposite;
import java.awt.image.VolatileImage;



public final class EditorBackground extends JComponent{

    VolatileImage _image;
    Image _backup;
    AlphaComposite _ac;
    int _height;
    int _width;

    public EditorBackground( final Image image, final int width, final int height, float alpha ){
    
        super();
        /* _height = height;
        _width = width;
        GraphicsDevice gd = GraphicsEnvironment.getLocalGraphicsEnvironment().getDefaultScreenDevice();
        GraphicsConfiguration gc = gd.getDefaultConfiguration();
        _image = gc.createCompatibleVolatileImage( _width, _height );
        //ImageCapabilities ic = _image.getCapabilities();
        //System.out.println( "TRUE VOLATILE " + ic.isTrueVolatile() );
        ///System.out.println( "Is ACCELERATED " + ic.isAccelerated() );
        _backup = image;
        //_ac = AlphaComposite.getInstance( AlphaComposite.SRC_OVER, .2f );
        if( alpha > 1.0f ) alpha = 1.0f;
        _ac = AlphaComposite.getInstance( AlphaComposite.SRC_OVER, alpha );
        renderVI();*/
        setBackground( image, width, height, alpha );
    
    }
    
    public void setBackground( final Image image, final int width, final int height, float alpha ){
    
        _height = height;
        _width = width;
        GraphicsDevice gd = GraphicsEnvironment.getLocalGraphicsEnvironment().getDefaultScreenDevice();
        GraphicsConfiguration gc = gd.getDefaultConfiguration();
        _image = gc.createCompatibleVolatileImage( _width, _height );
        //ImageCapabilities ic = _image.getCapabilities();
        //System.out.println( "TRUE VOLATILE " + ic.isTrueVolatile() );
        ///System.out.println( "Is ACCELERATED " + ic.isAccelerated() );
        _backup = image;
        //_ac = AlphaComposite.getInstance( AlphaComposite.SRC_OVER, .2f );
        if( alpha > 1.0f ) alpha = 1.0f;
        _ac = AlphaComposite.getInstance( AlphaComposite.SRC_OVER, alpha );
        renderVI();    
    
    
    
    }

    public final void paint( final Graphics g ){
    
        final Graphics2D g2 = (Graphics2D)g;
        final Dimension size = getSize();
        //g2.setComposite( _ac );
        if( _image.contentsLost() ){
        
            final Graphics2D g2d = _image.createGraphics();
            final int result = _image.validate( g2d.getDeviceConfiguration() );
            if( result != _image.IMAGE_RESTORED ) renderVI();
            g2d.dispose();
        
        }
        g2.drawImage( _image, 0, 0, size.width, size.height , null);
            
    
    }

    private final void renderVI(){
    
        //System.out.println( "G2D is " + _image );    
        final Graphics2D g2d = _image.createGraphics();
        g2d.setComposite( _ac );
        g2d.drawImage( _backup, 0, 0, _width, _height , null );
        g2d.dispose();
    
    
    }

}
//@nonl
//@-node:zorcanda!.20050309184057:@thin EditorBackground.java
//@-leo
