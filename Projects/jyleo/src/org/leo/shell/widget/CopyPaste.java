//@+leo-ver=4-thin
//@+node:zorcanda!.20051115195219.1:@thin CopyPaste.java
//@@language java
package org.leo.shell.widget;

import org.leo.shell.JythonShell;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.text.*;

public class CopyPaste extends MouseAdapter{

    final JTextPane _jtp;
    final JPopupMenu _jpm;
    final JythonShell _js; 
    public CopyPaste( final JTextPane jtp, final JythonShell js ){
        super();
        _jtp = jtp;
        _js = js;
        _jpm = createPopup();
        _jtp.addMouseListener( this );
    
    }

    public final JPopupMenu createPopup(){
    
        final JPopupMenu jpm = new JPopupMenu();
        final AbstractAction copy = new AbstractAction( "Copy" ){
        
            public final void actionPerformed( final ActionEvent ae ){
            
                CopyPaste.this._jtp.copy();
            
            }
        
        
        };
        jpm.add( copy );
        final AbstractAction paste = new AbstractAction( "Paste" ){
        
            public final void actionPerformed( final ActionEvent ae ){
            
                CopyPaste.this._jtp.paste();
            
            }
        
        
        };      
        jpm.add( paste );
        
        final Action pasteasscript = _js.getPasteAsScript();
        jpm.add( pasteasscript );
        final AbstractAction select = new AbstractAction( "Select All" ){
        
            public final void actionPerformed( final ActionEvent ae ){
            
                CopyPaste.this._jtp.selectAll();
            
            }
        
        
        };      
        jpm.add( select );        
        return jpm;
    
    
    }

    public final void mousePressed( final MouseEvent me ){
    
        if( me.getButton() == me.BUTTON3 ){
        
            _jpm.show( me.getComponent(), me.getX(), me.getY() );
        
        
        }
    
    
    
    }


}
//@-node:zorcanda!.20051115195219.1:@thin CopyPaste.java
//@-leo
