//@+leo-ver=4-thin
//@+node:zorcanda!.20051115174418:@thin EndOfLine.java
//@@language java
package org.leo.shell.actions;

import org.leo.shell.JythonShell;
import org.leo.shell.Documentation; 
import javax.swing.*;
import javax.swing.text.*;
import java.awt.event.ActionEvent;


public class EndOfLine extends AbstractAction implements Documentation{

    JTextPane jtp;
    JythonShell js;
    public EndOfLine( JythonShell js ){
    
        this.jtp = (JTextPane)js.getShellComponent();
        this.js = js;
    
    }

    public String getDocumentation(){
    
        return "Moves current position to the end of the line.\n";
    
    }


    public void actionPerformed( ActionEvent ae ){

        
        final int end = js.endOfLine();
        jtp.setCaretPosition( end );
 
    
    }




}
//@nonl
//@-node:zorcanda!.20051115174418:@thin EndOfLine.java
//@-leo
