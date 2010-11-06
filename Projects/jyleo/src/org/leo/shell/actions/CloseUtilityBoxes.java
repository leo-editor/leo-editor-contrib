//@+leo-ver=4-thin
//@+node:zorcanda!.20051128184238:@thin CloseUtilityBoxes.java
//@@language java
package org.leo.shell.actions;

import org.leo.shell.JythonShell;
import org.leo.shell.Documentation;
import javax.swing.*;
import javax.swing.text.*;
import java.awt.event.ActionEvent; 


public class CloseUtilityBoxes extends AbstractAction implements Documentation{


    JythonShell js;
    public CloseUtilityBoxes( JythonShell js ){
    
        this.js = js;
    
    }

    public String getDocumentation(){
    
        return "This closes utility boxes like the autocompleter or calltips help.\n";
    
    }

    public void actionPerformed( ActionEvent ae ){

        js.closeUtilityBoxes();

    
    }

}
//@nonl
//@-node:zorcanda!.20051128184238:@thin CloseUtilityBoxes.java
//@-leo
