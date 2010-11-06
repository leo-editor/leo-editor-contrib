//@+leo-ver=4-thin
//@+node:zorcanda!.20051115194127:@thin AddLine.java
//@@language java
package org.leo.shell.util;

import org.leo.shell.JythonShell;
import javax.swing.JTextPane;
import javax.swing.text.*;

public class AddLine implements Runnable{

    JythonShell js;
    String line;
    boolean colorize;
    public AddLine( JythonShell js, String line, boolean colorize ){
    
        this.js = js;
        this.line = line;
        this.colorize = colorize;
    }

    public void run(){
    
        JTextComponent jtc = js.getShellComponent();
        Document doc = jtc.getDocument();
        try{

            int outputspot = js.getOutputSpot();
            doc.insertString( outputspot, line, null );
            if( colorize ){
                
                Element e = Utilities.getParagraphElement( jtc, outputspot );
                js.colorize( line, "", outputspot, outputspot, e.getEndOffset() );
            
            }
        }
        catch( BadLocationException ble ){}
        
    }



}
//@nonl
//@-node:zorcanda!.20051115194127:@thin AddLine.java
//@-leo
