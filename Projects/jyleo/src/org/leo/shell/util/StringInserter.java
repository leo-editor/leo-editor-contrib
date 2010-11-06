//@+leo-ver=4-thin
//@+node:zorcanda!.20051115192531:@thin StringInserter.java
//@@language java
package org.leo.shell.util;

import org.leo.shell.JythonShell; 
import javax.swing.*;
import javax.swing.text.*;


public class StringInserter implements Runnable{
    
        String sb;
        JTextPane jtp;
        SimpleAttributeSet sas;
        JythonShell js;
        
        public StringInserter( String sb, JTextPane jtp, SimpleAttributeSet sas, JythonShell js ){
        
            this.sb = sb;
            this.jtp = jtp;
            this.sas = sas;
            this.js = js;
        
        }
    
        public void run(){
        
            try{
                int spot = jtp.getCaretPosition();
                DefaultStyledDocument doc = (DefaultStyledDocument)jtp.getDocument();
                doc.insertString( spot, sb, sas );
                //js.outputspot = spot + sb.length();
                js.setOutputSpot( spot + sb.length() );
                doc.setParagraphAttributes( spot , 0, sas, false );
                
            }
            catch( BadLocationException ble ){}
        
        
        
        }
        
    
    }
//@nonl
//@-node:zorcanda!.20051115192531:@thin StringInserter.java
//@-leo
