//@+leo-ver=4-thin
//@+node:zorcanda!.20051121130625.1:@thin StartOfLine.java
//@@language java

package org.leo.shell.magic.editor;

import javax.swing.AbstractAction;
import javax.swing.text.*;
import java.awt.event.ActionEvent;


public class StartOfLine extends AbstractAction{


    public void actionPerformed( ActionEvent ae ){
    
        try{
            JTextComponent jtc = (JTextComponent)ae.getSource();
            int spot = Utilities.getRowStart( jtc, jtc.getCaretPosition() );
            jtc.setCaretPosition( spot );
        }
        catch( BadLocationException ble ){}    
    
    
    }


}
//@nonl
//@-node:zorcanda!.20051121130625.1:@thin StartOfLine.java
//@-leo
