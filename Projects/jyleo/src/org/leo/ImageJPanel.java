//@+leo-ver=4-thin
//@+node:zorcanda!.20051108223332.1:@thin ImageJPanel.java
//@@language java
package org.leo;
import javax.swing.*;
import java.awt.*;

public class ImageJPanel extends JPanel{

    Image image;
    Image last_image;
    AlphaComposite alpha;
    Rectangle lastDimensions;
    
    public ImageJPanel(){
    
       super();
       alpha = AlphaComposite.getInstance( AlphaComposite.SRC_OVER, 1.0f );
       image = null;
       last_image = null;
       lastDimensions = new Rectangle( 0, 0, 0, 0 );
           
    }
    
    public void setImage( Image image ){
    
        this.image = image;
    
    }
    
    public void setAlpha( float alpha ){
    
        this.alpha = AlphaComposite.getInstance( AlphaComposite.SRC_OVER, alpha );
    
    }


    public void paintComponent( Graphics g ){
        
        super.paintComponent( g );
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
        
        }
    
    
    
    }


}



//@-node:zorcanda!.20051108223332.1:@thin ImageJPanel.java
//@-leo
