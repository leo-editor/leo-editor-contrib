//@+leo-ver=4-thin
//@+node:zorcanda!.20051204173611:@thin Copy.java
//@@language java
package org.leo.shell.actions;

import org.leo.shell.JythonShell;
import org.leo.shell.Documentation;
import javax.swing.AbstractAction;
import java.awt.event.ActionEvent; 


public class Copy extends AbstractAction implements Documentation{


    JythonShell js;
    public Copy( JythonShell js ){
        
        super( "Copy" );
        this.js = js;
    
    }

    public String getDocumentation(){
    
        return "This copies the shell's current selection.\n";
    
    }

    public void actionPerformed( ActionEvent ae ){

        js.getShellComponent().copy();
    
    }

}
//@nonl
//@-node:zorcanda!.20051204173611:@thin Copy.java
//@-leo
