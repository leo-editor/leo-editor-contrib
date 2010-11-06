//@+leo-ver=4-thin
//@+node:zorcanda!.20051115154911.1:@thin DeleteToEndOfLine.java
//@@language java
package org.leo.shell.actions;

import org.leo.shell.JythonShell;
import org.leo.shell.Documentation;
import javax.swing.*;
import javax.swing.text.*;
import java.awt.event.ActionEvent;


public class DeleteToEndOfLine extends AbstractAction implements Documentation{

    JTextPane jtp;
    public DeleteToEndOfLine( JTextPane jtp ){
    
        this.jtp = jtp;
    
    }

    public String getDocumentation(){
    
        return "Removes all text from current position to end of the line.\n";
    
    }


    public void actionPerformed( ActionEvent ae ){

        final AbstractDocument doc = (AbstractDocument)jtp.getDocument();
        final int cp = jtp.getCaretPosition();
        Element p = doc.getParagraphElement( cp );
        int end = p.getEndOffset();
        try{
            doc.remove( cp, ( end -1 ) - cp );
        }
        catch( BadLocationException ble ){}
    
    }




}
//@nonl
//@-node:zorcanda!.20051115154911.1:@thin DeleteToEndOfLine.java
//@-leo
