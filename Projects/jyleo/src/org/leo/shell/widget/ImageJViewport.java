//@+leo-ver=4-thin
//@+node:zorcanda!.20051117114653:@thin ImageJViewport.java
//@@language java
package org.leo.shell.widget;

import javax.swing.*;
import java.awt.*;

public class ImageJViewport extends JViewport{

    Image image;
    Image last_image;
    AlphaComposite alpha;
    Rectangle lastDimensions;
    
    public ImageJViewport(){
    
       super();
       alpha = AlphaComposite.getInstance( AlphaComposite.SRC_OVER, 1.0f );
       image = null;
       last_image = null;
       lastDimensions = new Rectangle( 0, 0, 0, 0 );
       setScrollMode( BLIT_SCROLL_MODE );
           
    }
    
    public void setImage( Image image ){
    
        this.image = image;
    
    }
    
    public void setAlpha( float alpha ){
    
        this.alpha = AlphaComposite.getInstance( AlphaComposite.SRC_OVER, alpha );
    
    }


    public void paintComponent( Graphics g ){
        
        //super.paintComponent( g );
        if( image != null ){
            Graphics2D g2 = (Graphics2D)g;
            Rectangle vrec = getVisibleRect();
            if( !vrec.equals( lastDimensions ) ){
            
                lastDimensions = vrec;
                last_image = image.getScaledInstance( vrec.width, vrec.height, Image.SCALE_REPLICATE );
            
            }
            Composite composite = g2.getComposite();
            g2.setComposite( alpha );
            g2.drawImage( last_image, vrec.x, vrec.y, Color.WHITE, null );
            g2.setComposite( composite );
            return;
        
        }
        super.paintComponent( g );
    
    
    }


}
//@-node:zorcanda!.20051117114653:@thin ImageJViewport.java
//@-leo
