//@+leo-ver=4-thin
//@+node:zorcanda!.20051210112735:@thin JSUtilities.java
//@@language java
package org.leo.shell.util;

import javax.swing.*;
import javax.swing.text.*;

public class JSUtilities{


    //@    @+others
    //@+node:zorcanda!.20051210112735.1:wordStart
    static public String getWordStart( JTextPane _jtp ){
    
        int cp = _jtp.getCaretPosition();
        DefaultStyledDocument doc = (DefaultStyledDocument)_jtp.getDocument();
        Element p = doc.getParagraphElement( cp );
        try{
            String line = doc.getText( p.getStartOffset(), cp - p.getStartOffset() );
            StringBuilder sb = new StringBuilder( line );
            sb.reverse();
            StringBuilder word = new StringBuilder();
            for( final char c: sb.toString().toCharArray() ){
        
                if( !Character.isLetterOrDigit( c ) && c != '_' ) break;
                word.append( c );
        
            }    
            word.reverse();
            return word.toString();
        }
        catch( BadLocationException ble ){}
        return "";
        
    }
    
    static public int getWordStartIndex( JTextPane _jtp ){
    
        int cp = _jtp.getCaretPosition();
        DefaultStyledDocument doc = (DefaultStyledDocument)_jtp.getDocument();
        Element p = doc.getParagraphElement( cp );
        try{
            String line = doc.getText( p.getStartOffset(), cp - p.getStartOffset() );
            StringBuilder sb = new StringBuilder( line );
            sb.reverse();
            for( final char c: sb.toString().toCharArray() ){
        
                if( !Character.isLetterOrDigit( c ) && c != '_' ) break;
                cp--;
        
            }    
            return cp;
        }
        catch( BadLocationException ble ){}
        return -1;
        
    }
    //@nonl
    //@-node:zorcanda!.20051210112735.1:wordStart
    //@-others





}
//@nonl
//@-node:zorcanda!.20051210112735:@thin JSUtilities.java
//@-leo
