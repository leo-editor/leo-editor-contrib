//@+leo-ver=4-thin
//@+node:zorcanda!.20051115172817:@thin RemoveLine.java
//@@language java
package org.leo.shell.actions;

import org.leo.shell.JythonShell;
import org.leo.shell.Documentation; 
import javax.swing.*;
import javax.swing.text.*;
import java.awt.event.ActionEvent;


public class RemoveLine extends AbstractAction implements Documentation{

    JTextPane jtp;
    JythonShell js;
    public RemoveLine( JythonShell js ){
    
        this.jtp = (JTextPane)js.getShellComponent();
        this.js = js;
    
    }
    
    public String getDocumentation(){
    
        return "Removes all text from the prompt to the end of the line.\n";
    
    }
    
    public void actionPerformed( ActionEvent ae ){

        //event.consume();
        final AbstractDocument doc = (AbstractDocument)jtp.getDocument();
        final int cp = jtp.getCaretPosition();
        Element p = doc.getParagraphElement( cp );
        int end = p.getEndOffset() -1;
        try{
            doc.remove( js.getOutputSpot(), end - js.getOutputSpot() );
        }
        catch( BadLocationException ble ){}
    
    }




}
//@nonl
//@-node:zorcanda!.20051115172817:@thin RemoveLine.java
//@-leo
