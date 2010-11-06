//@+leo-ver=4-thin
//@+node:zorcanda!.20051117180849:@thin SearchInputHistory.java
//@@language java
package org.leo.shell.actions;

import org.leo.shell.JythonShell;
import org.leo.shell.Documentation;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.text.*;
import java.util.*;
import org.python.core.*;


public class SearchInputHistory extends KeyAdapter{


    JythonShell js;
    int spot;
    String current;
    public SearchInputHistory( JythonShell js ){
    
        this.js = js;
        js.getShellComponent().addKeyListener( this );
        int spot = -1;
        current = null;
    }
    
    public String getDocumentation(){
    
        return "Opens a search prompt. Begin typing and the system searches your history for lines that contain what you ve typed so far, completing as much as it can.";  
    
    }
    
    public void keyPressed( KeyEvent event ){
    
        String opmodifiers = event.getKeyModifiersText( event.getModifiers() );
        if( !opmodifiers.equals( "" ) ) return;
        spot = -1;
        current = null;
    
    }
    
    private static abstract class DocumentedAction extends AbstractAction implements Documentation{}
    
    
    public Action getPreviousUp(){
    
        return new DocumentedAction(){
        
            public String getDocumentation(){
            
                return "Start typing, and then use this keystroke to search upwards through only the history items that match what you ve typed so far. If you use this keystroke at a blank prompt, they just behave like normal arrow keys.\n";
            
            
            }
        
            public void actionPerformed( ActionEvent ae ){
            
                processRequest( ae, "Up" );
            
            }
        
        
        
        };
    
    
    }
    
    public Action getNextDown(){
    
        return new DocumentedAction(){

            public String getDocumentation(){
            
                return "Start typing, and then use this keystroke to search downwards only through the history items that match what you ve typed so far. If you use this keystroke at a blank prompt, they just behave like normal arrow keys.\n";
            
            
            }
        
            public void actionPerformed( ActionEvent ae ){
            
                processRequest( ae, "Down" );
            
            }
        
        
        };
    
    
    }
    
    
    public void processRequest( ActionEvent ae, String which ){
    
        //@        <<process>>
        //@+node:zorcanda!.20051117180849.1:<<process>>
        JTextComponent jtc = js.getShellComponent();
        AbstractDocument doc = (AbstractDocument)jtc.getDocument();
        int outputspot = js.getOutputSpot();
        int cp = jtc.getCaretPosition();
        String input = js.get_input( cp );
        Element e = doc.getParagraphElement( cp );
        if( input.trim().equals( "" ) ) return;
        PyList history = js.history;
        if( history.size() == 0 ) return;
        if( which.equals( "Up" ) ){
            
            if( current != null && input.startsWith( current ) ){
            
                ListIterator li = history.listIterator( spot );
                while( li.hasPrevious() ){
                    
                    spot = li.previousIndex();
                    String previous = (String)li.previous();
                    if( previous.equals( input ) ) continue; 
                    if( previous.startsWith( current ) ){
                        try{
                            doc.remove( outputspot, e.getEndOffset() - outputspot -1 );
                            js.colorize( previous, previous, outputspot, outputspot, outputspot + previous.length() ); 
                        }
                        catch( BadLocationException ble ){}
                        return;                      
                    }
                
                }
            
            }
            else{
            
                current = input;
                ListIterator li = history.listIterator( history.size() );
                while( li.hasPrevious() ){
                
                    spot = li.previousIndex();
                    String previous = (String)li.previous();
                    if( previous.equals( input ) ) continue;
                    if( previous.startsWith( current ) ){
                        
                        try{
                            doc.remove( outputspot, e.getEndOffset() - outputspot -1 );
                            js.colorize( previous, previous, outputspot, outputspot, outputspot + previous.length() );
                        }
                        catch( BadLocationException ble ){ ble.printStackTrace(); }
                        return;
                    
                    }
                }
            }
        
        }
        else{
            if( current != null && input.startsWith( current ) ){
            
                ListIterator li = history.listIterator( spot );
                while( li.hasNext() ){ 
                    
                    spot = li.nextIndex();
                    String next = (String)li.next();
                    if( next.equals( input ) ) continue;
                    if( next.startsWith( current ) ){
                        try{
                            doc.remove( outputspot, e.getEndOffset() - outputspot -1 );
                            js.colorize( next, next, outputspot, outputspot, outputspot + next.length() ); 
                        }
                        catch( BadLocationException ble ){}
                        return;                      
                    }
                
                }
            
            }
            else{
            
                current = input;
                ListIterator li = history.listIterator();
                while( li.hasNext() ){
                
                    spot = li.nextIndex();
                    String next = (String)li.next();
                    if( next.equals( input ) ) continue; 
                    if( next.startsWith( current ) ){
                        
                        try{
                            doc.remove( outputspot, e.getEndOffset() - outputspot -1 );
                            js.colorize( next, next, outputspot, outputspot, outputspot + next.length() );
                        }
                        catch( BadLocationException ble ){ ble.printStackTrace(); }
                        return;
                    
                    }
                }
            }
        
        }
        //@nonl
        //@-node:zorcanda!.20051117180849.1:<<process>>
        //@nl
    
    
    }


}
//@-node:zorcanda!.20051117180849:@thin SearchInputHistory.java
//@-leo
