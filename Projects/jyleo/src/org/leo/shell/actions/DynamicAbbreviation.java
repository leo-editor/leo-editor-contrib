//@+leo-ver=4-thin
//@+node:zorcanda!.20051115175216:@thin DynamicAbbreviation.java
//@@language java
package org.leo.shell.actions;

import org.leo.shell.JythonShell;
import org.leo.shell.Documentation; 
import javax.swing.*;
import java.awt.event.ActionEvent;


public class DynamicAbbreviation extends AbstractAction implements Documentation{


    JythonShell js;
    public DynamicAbbreviation( JythonShell js ){
    
        this.js = js;
    
    }
    
    public String getDocumentation(){
    
        return "Dynamic Abbreviations:\n" +
        "-----------------------\n" +
        "Executing will dynamically expand a prefix to matching\n"+
        "words already entered within the interpreter.  For example:\n"+
        "cactus\n"+
        "cac( keystroke ) will expand cac to cactus.\n" +
        "This will cycle through all matches to cac within the buffer upon repeated execution.\n";
    
    }

    public void actionPerformed( ActionEvent ae ){

        
        js.dynamicAbbreviation();
 
    
    }




}
//@nonl
//@-node:zorcanda!.20051115175216:@thin DynamicAbbreviation.java
//@-leo
