//@+leo-ver=4-thin
//@+node:zorcanda!.20051128145737:@thin MessageBorder.java
//@@language java
package org.leo.shell.widget;

import java.awt.*;
import javax.swing.border.Border;

public class MessageBorder implements Border{

    Insets ins;
    String message;
    public MessageBorder( String message ){
    
        this.message = message;
    
    }    


    public Insets getBorderInsets( Component c ){
    
        if( ins == null ){
            Graphics g = c.getGraphics();
            FontMetrics fm = g.getFontMetrics();
            int height = fm.getHeight();
            g.dispose();
            ins = new Insets( 0, 0, height, 0 ); 
        }
        return ins;
    }
    
    public boolean isBorderOpaque(){ return true; }


    public void paintBorder(Component c, Graphics g, int x, int y, int width, int height){
    
        g.setColor( Color.WHITE );
        g.fillRect( 0, y + height - ins.bottom, width, y + height );
        g.setColor( c.getForeground() );
        FontMetrics fm = g.getFontMetrics();
        g.drawString( message , 0, y + height - fm.getDescent() );
    
    }

}
//@nonl
//@-node:zorcanda!.20051128145737:@thin MessageBorder.java
//@-leo
