//@+leo-ver=4-thin
//@+node:zorcanda!.20051204172344:@thin PasteAsScript.java
//@@language java
package org.leo.shell.actions;

import org.leo.shell.JythonShell;
import org.leo.shell.Documentation;
import javax.swing.AbstractAction;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.Clipboard;
import java.awt.Toolkit;
import java.util.List;
import java.util.Arrays;
import java.awt.event.ActionEvent; 


public class PasteAsScript extends AbstractAction implements Documentation{


    JythonShell js;
    public PasteAsScript( JythonShell js ){
        
        super( "Paste As Script" );
        this.js = js;
    
    }

    public String getDocumentation(){
    
        return "This pastes the clipboard's contents as a script into the shell.\n";
    
    }

    public void actionPerformed( ActionEvent ae ){

        try{
                
            final Clipboard system = Toolkit.getDefaultToolkit().getSystemClipboard();
            final String data = (String)system.getData( DataFlavor.stringFlavor );
            final String[] lines = data.split( "\n" );
            final java.util.List<String> script = Arrays.asList( lines );
            js.processScript( script );
                    
        }
        catch( final Exception x ){}

    
    }

}
//@nonl
//@-node:zorcanda!.20051204172344:@thin PasteAsScript.java
//@-leo
