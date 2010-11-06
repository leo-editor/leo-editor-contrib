//@+leo-ver=4-thin
//@+node:zorcanda!.20051120231840:@thin SupressOutput.java
//@@language java
package org.leo.shell.actions;

import org.leo.shell.JythonShell;
import org.leo.shell.Documentation;
import javax.swing.*;
import javax.swing.text.*;
import java.awt.event.ActionEvent; 


public class SupressOutput extends AbstractAction implements Documentation{


    JythonShell js;
    public SupressOutput( JythonShell js ){
    
        this.js = js;
    
    }

    public String getDocumentation(){
    
        return "This suppresses the current output for the duration of the execution statement.\n" +
               "This is useful in cases where there is a tremendous amout of output occuring and the user decides that he no longer wishes to see all of it.\n" +
               "For gigantic outputs, this can be a shell saver.\n";
    
    }

    public void actionPerformed( ActionEvent ae ){

        js.supressOutput();
    
    }

}
//@nonl
//@-node:zorcanda!.20051120231840:@thin SupressOutput.java
//@-leo
