//@+leo-ver=4-thin
//@+node:zorcanda!.20051117224330:@thin ReverseIncrementalSearch.java
//@@language java
package org.leo.shell.actions;

import java.awt.event.*;
import javax.swing.*;
import javax.swing.text.*;
import java.util.*;
import org.python.core.*;
import org.leo.shell.JythonShell;
import org.leo.shell.Documentation;

public class ReverseIncrementalSearch extends AbstractAction implements KeyListener, Documentation{


    JythonShell js;
    String prelude;
    String prompt;
    boolean searching;
    StringBuilder typed;
    String complete;
    int lastindex;
    public ReverseIncrementalSearch( JythonShell js ){
    
        this.js = js;
        js.getShellComponent().addKeyListener( this );
        prelude = "(reverse-i-search)";
        prompt = "%1$s'%2$s':%3$s";
        searching = false;
        typed = null;
        complete = null;
        lastindex = -1;
    }
    
    public String getDocumentation(){
    
        return "Opens a search prompt. Begin typing and the system searches your history for lines that contain what you ve typed so far, completing as much as it can.\n";
       
    }
    
    
    public void keyPressed( KeyEvent event ){
        
        String opmodifiers = event.getKeyModifiersText( event.getModifiers() );
        if( searching ){
            
            JTextComponent jtc = js.getShellComponent();
            AbstractDocument doc = (AbstractDocument)jtc.getDocument();
            Element pe = doc.getParagraphElement( jtc.getCaretPosition() );
            char c = event.getKeyChar();
            String ktext = KeyEvent.getKeyText( event.getKeyCode() );
            if( opmodifiers.startsWith( "Ctrl" ) || opmodifiers.startsWith( "Alt" ) ) return;
            if( ktext.equals( "Shift" ) ) return;
            if( event.isActionKey() ) return;
            event.consume();
            if( ( Character.isWhitespace( c ) || Character.isLetterOrDigit( c ) ) && c != '\n' ){
                    typed.append( c );
                    try{
                        doc.remove( pe.getStartOffset(), (pe.getEndOffset() -1) - pe.getStartOffset() );
                        String tstring = typed.toString();
                        complete = "";
                        if( !tstring.trim().equals( "" ) ){
                        
                            PyList history = js.history;
                            ListIterator li = history.listIterator( lastindex );
                            while( li.hasPrevious() ){
                                
                                int pi = li.previousIndex();
                                String previous = (String)li.previous();
                                if( previous.indexOf( tstring ) != -1 && !previous.equals( complete ) ){
                                    
                                    lastindex = pi;
                                    complete = previous;
                                    break;
                                
                                }
                                    
                            
                            }
                        
                        
                        }
                        String iline = String.format( prompt, prelude, tstring, complete );
                        doc.insertString( pe.getStartOffset(), iline, null );
                        jtc.setCaretPosition( pe.getStartOffset() + prelude.length() + typed.length() + 1 );          
                    }
                    catch( BadLocationException ble ){}
            
        
                }
                else{
                
                    try{
                        doc.remove( pe.getStartOffset(), (pe.getEndOffset() -1) - pe.getStartOffset() );
                        js.insertPrompt( false );
                        int outputspot = js.getOutputSpot();
                        js.colorize( complete, complete, outputspot, outputspot, outputspot + complete.length() );
                        searching = false;
                    
                    }
                    catch( BadLocationException ble ){}
                
                
                
                }
            }

    }
    
    
    public void keyReleased( KeyEvent event){

        String ktext = KeyEvent.getKeyText( event.getKeyCode() );
        String opmodifiers = event.getKeyModifiersText( event.getModifiers() );
        if( opmodifiers.startsWith( "Ctrl" ) || opmodifiers.startsWith( "Alt" ) ) return;
        if( ktext.equals( "Shift" ) ) return;
        if( searching ) event.consume();
    
    }
    
    public void keyTyped( KeyEvent event ){

        String opmodifiers = event.getKeyModifiersText( event.getModifiers() );
        String ktext = KeyEvent.getKeyText( event.getKeyCode() );
        if( opmodifiers.startsWith( "Ctrl" ) || opmodifiers.startsWith( "Alt" ) ) return;
        if( ktext.equals( "Shift" ) ) return;          
        if( searching ) event.consume();
    
    }

    public void actionPerformed( ActionEvent ae ){
        
        if( searching ){
          
                PyList history = js.history;
                ListIterator li = history.listIterator( lastindex  );
                String lastcomplete = complete;
                String tstring = typed.toString();
                while( li.hasPrevious() ){
                    
                    int pi = li.previousIndex();
                    String previous = (String)li.previous();
                    if( previous.indexOf( tstring ) != -1  && !previous.equals( complete )){
                        
                        lastindex = pi;
                        complete = previous;
                        break;
                                
                    }
                                    
                            
                }
            if( !lastcomplete.equals( complete ) ){
                try{
                        JTextComponent jtc = js.getShellComponent();
                        AbstractDocument doc = (AbstractDocument)jtc.getDocument();
                        Element pe = doc.getParagraphElement( jtc.getCaretPosition() );
                        String iline = String.format( prompt, prelude, tstring, complete );
                        doc.remove( pe.getStartOffset(), (pe.getEndOffset() -1 ) - pe.getStartOffset() );
                        doc.insertString( pe.getStartOffset(), iline, null );
                        jtc.setCaretPosition( pe.getStartOffset() + prelude.length() + typed.length() + 1 ); 
                                 
                }
                catch( BadLocationException ble ){}            
            
            
            }
            return;
                   
        }
        searching = true;
        typed = new StringBuilder();
        JTextComponent jtc = js.getShellComponent();
        AbstractDocument doc = (AbstractDocument)jtc.getDocument();
        Element pe = doc.getParagraphElement( jtc.getCaretPosition() );
        String line = js.get_input( jtc.getCaretPosition() );
        typed.append( line );
        try{
            doc.remove( pe.getStartOffset(), (pe.getEndOffset() -1) - pe.getStartOffset() );
            String tstring = typed.toString();
            complete = "";
            PyList history = js.history;
            lastindex = history.size();
            if( !tstring.trim().equals( "" ) ){

                ListIterator li = history.listIterator( history.size() );
                while( li.hasPrevious() ){
                    
                    int pi = li.previousIndex();       
                    String previous = (String)li.previous();
                    if( previous.indexOf( tstring ) != -1  && !previous.equals( complete )){
                        
                        lastindex = pi;      
                        complete = previous;
                        break;
                                
                    }
                                    
                            
                }
                        
                        
            }
            String iline = String.format( prompt, prelude, tstring, complete );
            doc.insertString( pe.getStartOffset(), iline, null );
            jtc.setCaretPosition( pe.getStartOffset() + prelude.length() + typed.length() + 1 );
        }
        catch(BadLocationException ble ){
            ble.printStackTrace();
            searching = false;
        }
    }


}
//@-node:zorcanda!.20051117224330:@thin ReverseIncrementalSearch.java
//@-leo
