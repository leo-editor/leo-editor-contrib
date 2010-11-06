//@+leo-ver=4-thin
//@+node:zorcanda!.20051115174341:@thin StartOfLine.java
//@@language java
package org.leo.shell.actions;

import org.leo.shell.JythonShell;
import org.leo.shell.Documentation;
import javax.swing.*;
import javax.swing.text.*;
import java.awt.event.ActionEvent;


public class StartOfLine extends AbstractAction implements Documentation{

    JTextPane jtp;
    JythonShell js;
    public StartOfLine( JythonShell js ){
    
        this.jtp = (JTextPane)js.getShellComponent();
        this.js = js;
    
    }

    public String getDocumentation(){
    
        return "Moves current position to the end of the prompt.\n";
    
    }

    public void actionPerformed( ActionEvent ae ){


        final int start = js.getOutputSpot();
        jtp.setCaretPosition( start );
 
    
    }




}
//@nonl
//@-node:zorcanda!.20051115174341:@thin StartOfLine.java
//@-leo
