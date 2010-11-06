//@+leo-ver=4-thin
//@+node:zorcanda!.20051207104043:@thin TabCompletion.java
//@@language java
package org.leo.shell.actions;

import org.leo.shell.Documentation;
import org.leo.shell.util.Abbreviation;
import org.leo.shell.util.JSUtilities;
import org.leo.shell.color.JythonColorizer;
import org.python.core.*;
import org.python.parser.*;
import javax.swing.*;
import javax.swing.text.*;
import java.awt.event.ActionEvent;
import java.util.*;

public class TabCompletion extends AbstractAction implements Documentation{


    JTextPane jtc;
    //JythonShell js;
    JythonColorizer jc;
    Abbreviation la;
    Set<String> abbrevs;
    LinkedList<String> cabbrevs;
    public TabCompletion( JTextPane jtc, JythonColorizer jc ){
    
        //this.js = js;
        this.jtc = jtc;
        this.jc = jc;
        la = null;
        abbrevs = new HashSet<String>();
        cabbrevs = new LinkedList<String>();
        final PySystemState pss = Py.getSystemState();
        final PyStringMap psm = (PyStringMap)pss.builtins;
        final PyList pl = psm.keys();
        for( int i = 0; i < pl.__len__(); i ++ )
            abbrevs.add( pl.__getitem__( i ).toString() );
        final String[] kwrds = PythonGrammarConstants.tokenImage;
        for( String s: kwrds ){
            
            s = s.replaceAll( "\\\"", "" );
            if( s.length() == 0 ) continue;
            char c1 = s.charAt( 0 );
            if( Character.isLetter( c1 ) ) abbrevs.add( s );
        
        } 
        abbrevs.add( "__init__" );
        abbrevs.add( "self" );
        
    }
    
    
    public String getDocumentation(){
    
        return "Executing this keystroke will attempt to complete the current word " +
        "against the available python keywords and conventions.  So for example:\n" +
        "cl(Keystroke)\n"+
        "becomes:\n"+
        "class\n" +
        "or:\n" +
        "__i(Keystroke)\n"+
        "becomes:\n" +
        "__init__\n" +
        "If a completion cannot be found, 4 spaces are inserted instead.\n";
    
    }
    
    public void actionPerformed( ActionEvent ae ){

        String word = JSUtilities.getWordStart( jtc );
        int index = JSUtilities.getWordStartIndex( jtc );
        if( word.trim().equals( "" ) ){
             insertTab();
             return;
        }
        if( la != null ){
        
            if( la.spos == index && word.startsWith( la.start ) ){
                
                if( cabbrevs.size() != 0 )
                    nextCompletion( index, la.start );
                else
                    startCompletion( index, la.start );
                
            }
            else startCompletion( index, word );
        
        }
        else startCompletion( index ,word );
    
    }


    //@    @+others
    //@+node:zorcanda!.20051207105850:startCompletion
    private void startCompletion( int spos, String word ){
    
        cabbrevs.clear();
        for( String s: abbrevs ){
            
            if( s.startsWith( word ) ) cabbrevs.add( s );
        
        }
        
        if( cabbrevs.size() != 0 ){
            Collections.sort( cabbrevs );
            String aword = cabbrevs.removeFirst();
            la = new Abbreviation( word, aword, spos );
            insertAbbrev( la );
        }
        else{
        
            la = null;
            insertTab();
        
        }
    
    }
    
    //@-node:zorcanda!.20051207105850:startCompletion
    //@+node:zorcanda!.20051207105850.1:nextCompletion
    public void nextCompletion( int spos, String word ){
    
        String aword = cabbrevs.removeFirst();
        la = new Abbreviation( word, aword, spos );
        insertAbbrev( la );
    
    }
    //@nonl
    //@-node:zorcanda!.20051207105850.1:nextCompletion
    //@+node:zorcanda!.20051207111745:insertAbbrev
    private void insertAbbrev( Abbreviation la ){
    
        try{
    
            DefaultStyledDocument dsd = (DefaultStyledDocument)jtc.getDocument();
            String cword = JSUtilities.getWordStart( jtc );
            int start = JSUtilities.getWordStartIndex( jtc );
            dsd.replace( start, cword.length(), la.current, null );
            if( jc != null )
                jc.colorize( la.current, "", start, start, start + cword.length() );
        
        }
        catch( BadLocationException ble ){}
    
    }
    //@nonl
    //@-node:zorcanda!.20051207111745:insertAbbrev
    //@+node:zorcanda!.20051207114712:insertTab
    private void insertTab(){
    
        Document doc = jtc.getDocument();
        try{
            doc.insertString( jtc.getCaretPosition(), "    ", null );
        }
        catch( BadLocationException ble ){}
    
    }
    //@nonl
    //@-node:zorcanda!.20051207114712:insertTab
    //@-others
}
//@nonl
//@-node:zorcanda!.20051207104043:@thin TabCompletion.java
//@-leo
