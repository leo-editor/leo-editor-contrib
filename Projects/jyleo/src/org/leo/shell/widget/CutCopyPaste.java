//@+leo-ver=4-thin
//@+node:zorcanda!.20051117153808:@thin CutCopyPaste.java
//@@language java
package org.leo.shell.widget;

import java.awt.event.*;
import javax.swing.AbstractAction;
import javax.swing.JMenu;
import javax.swing.JPopupMenu;
import javax.swing.text.JTextComponent;

public class CutCopyPaste extends MouseAdapter{

    final JTextComponent jtc;
    public CutCopyPaste( JTextComponent jtc ){
    
        this.jtc = jtc;
        jtc.addMouseListener( this );
    
    
    }

    public void mousePressed( MouseEvent me ){
    
    
        if( me.getButton() == me.BUTTON3 ){
        
            JMenu jm = new JMenu();
            AbstractAction cut = new AbstractAction( "Cut" ){
            
                public void actionPerformed( ActionEvent ae ){
                
                    jtc.cut();
                
                }
            
            };
            AbstractAction copy = new AbstractAction( "Copy" ){
            
                public void actionPerformed( ActionEvent ae ){
                
                    jtc.copy();
                
                }
            
            
            };
            AbstractAction paste = new AbstractAction( "Paste" ){
            
                public void actionPerformed( ActionEvent ae ){
                    
                    jtc.paste();
                
                }
            
            
            };
            jm.add( cut );
            jm.add( copy );
            jm.add( paste );
            JPopupMenu jpm = jm.getPopupMenu();
            jpm.show( jtc, me.getX(), me.getY() );
        
        }
    
    
    
    }



}
//@-node:zorcanda!.20051117153808:@thin CutCopyPaste.java
//@-leo
