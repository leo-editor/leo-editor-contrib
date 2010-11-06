//@+leo-ver=4-thin
//@+node:zorcanda!.20051115181444:@thin UpDownArrows.java
//@@language java
package org.leo.shell.actions;

import org.leo.shell.JythonShell;
import org.leo.shell.Documentation;
import javax.swing.*;
import javax.swing.text.*;
import java.awt.event.ActionEvent;


public class UpDownArrows{


    JythonShell js;
    JTextPane jtp;
    int pos;
    int lastsize;
    public UpDownArrows( JythonShell js ){
    
        this.js = js;
        this.jtp = (JTextPane)js.getShellComponent();
        pos = 0;
        lastsize = 0;
    }
    
    private static abstract class DocumentedAction extends AbstractAction implements Documentation{
    
    
    }
    
    public Action getUp(){
    
        return new DocumentedAction(){
        
            public String getDocumentation(){
            
                return "This moves the current line up one item in the history\n" +
                       "By moving, this means the current line is replaced with history item\n";
            
            }
        
            public void actionPerformed( ActionEvent ae ){
            
                processEvent( ae, "Up" );
            
            }
        
        
        };
    
    
    
    }
    
    public Action getDown(){
    
        return new DocumentedAction(){
        
            public String getDocumentation(){
            
                return "This moves the current line down one item in the history\n" +
                       "By moving, this means the current line is replaced with history item\n";
            
            }
        
            public void actionPerformed( ActionEvent ae ){
            
                processEvent( ae, "Down" );
            
            }
        
        
        };
    
    
    
    }


    public void processEvent( ActionEvent event, String which ){

        
        //@        <<body>>
        //@+node:zorcanda!.20051115181549:<<body>>
        if( js.lines.size() != 0 ){
        
            final int size = js.lines.size();
            if( size != lastsize ) pos = size -1;
            lastsize = size;
            boolean blank = false;
            String line = js.lines.get( pos );
            if( which.equals( "Up" ) ){
                 
                if( pos == 0 ) pos = size - 1;
                else
                    pos--;
                    
                
            }
            else{
                    
                if( pos == size - 1 ) pos = 0;
                else
                    pos++;
                
                
            }
            final Document doc = jtp.getDocument();
                
            try{
                
                final int end = js.endOfLine();
                doc.remove( js.getOutputSpot(), end - js.getOutputSpot() );
                js.colorize( line, line, js.getOutputSpot(), js.getOutputSpot(), end );
                    //pos++;
                    
            }
            catch( Exception x ){
                x.printStackTrace();
                
            }
            
            
        }
        //@nonl
        //@-node:zorcanda!.20051115181549:<<body>>
        //@nl
 
    
    }




}
//@nonl
//@-node:zorcanda!.20051115181444:@thin UpDownArrows.java
//@-leo
