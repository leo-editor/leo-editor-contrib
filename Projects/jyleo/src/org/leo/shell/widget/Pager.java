//@+leo-ver=4-thin
//@+node:zorcanda!.20051204160958:@thin Pager.java
//@@language java
package org.leo.shell.widget;  

import org.leo.shell.JythonShell;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import javax.swing.*;

public class Pager{

    JTextPane jtp;
    JScrollPane jsp;
    JythonShell js;
    
    public Pager( final JythonShell js, Color foreground, Color background, Font f ){
  
        this.js = js;
        jtp = new JTextPane();
        jtp.setForeground( foreground );
        jtp.setBackground( background );
        jtp.setCaretColor( foreground );
        jtp.setFont( f );
        jsp = new JScrollPane( jtp );
        MessageBorder mb = new MessageBorder( "Control-q to return to the Shell." );
        jsp.setViewportBorder( mb );
        Action a = new AbstractAction(){
        
            public void actionPerformed( ActionEvent ae ){ 
                js.moveWidgetToFront( "Shell" );
                js.getShellComponent().requestFocus();
            }
        
        };
        KeyStroke ks = KeyStroke.getKeyStroke( "control Q" );
        InputMap im = jtp.getInputMap();
        ActionMap am = jtp.getActionMap();
        im.put( ks, "cq" );
        am.put( "cq", a );
        
    }
    
    public void setText( String s ){
    
        jtp.setText( s );
        jtp.setCaretPosition( 0 );
    
    }
    
    public void requestFocus(){ jtp.requestFocus(); }    

    public JComponent getBaseWidget(){ return jsp; }
        
}
//@-node:zorcanda!.20051204160958:@thin Pager.java
//@-leo
