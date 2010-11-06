//@+leo-ver=4-thin
//@+node:zorcanda!.20051121124855:@thin TripleQuotes.java
//@@language java
package org.leo.shell.actions;

import org.leo.shell.JythonShell;
import org.leo.shell.Documentation;
import javax.swing.*;
import javax.swing.text.*;
import java.awt.event.ActionEvent; 


public class TripleQuotes extends AbstractAction implements Documentation{


    JythonShell js;
    public TripleQuotes( JythonShell js ){
    
        this.js = js;
    
    }

    public String getDocumentation(){
    
        return "This places triple quotes around the text on the current line.\n";
    
    }

    public void actionPerformed( ActionEvent ae ){

        JTextComponent jtc = js.getShellComponent();
        Document doc = jtc.getDocument();
        
        int outputspot = js.getOutputSpot();
        Element e = Utilities.getParagraphElement( jtc, outputspot );
        int end = e.getEndOffset();
        try{
    
            int wordstart = Utilities.getNextWord( jtc, outputspot -1 );
            if( wordstart >= end ) return;
            doc.insertString( wordstart, "'''", null );
            doc.insertString( e.getEndOffset() -1 , "'''", null ); 
            //final String line, final String insert, final int insertspot, final int start, final int end 
            js.colorize( js.get_input( outputspot ), "", outputspot, outputspot, e.getEndOffset() );
    }
    catch( BadLocationException ble ){}


    
    }

}
//@nonl
//@-node:zorcanda!.20051121124855:@thin TripleQuotes.java
//@-leo
