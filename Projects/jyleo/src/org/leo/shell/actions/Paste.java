//@+leo-ver=4-thin
//@+node:zorcanda!.20051204173522:@thin Paste.java
//@@language java
package org.leo.shell.actions;

import org.leo.shell.JythonShell;
import org.leo.shell.Documentation;
import javax.swing.AbstractAction;
import java.awt.event.ActionEvent; 


public class Paste extends AbstractAction implements Documentation{


    JythonShell js;
    public Paste( JythonShell js ){
        
        super( "Paste" );
        this.js = js;
    
    }

    public String getDocumentation(){
    
        return "This pastes the clipboard's contents into the shell.\n";
    
    }

    public void actionPerformed( ActionEvent ae ){

        js.getShellComponent().paste();
    
    }

}
//@nonl
//@-node:zorcanda!.20051204173522:@thin Paste.java
//@-leo
