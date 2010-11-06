//@+leo-ver=4-thin
//@+node:zorcanda!.20051120223225:@thin Reset.java
//@@language java
package org.leo.shell.magic; 

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
import org.leo.shell.util.StringInserter;
import java.util.*;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import javax.swing.text.*;
import javax.swing.*;
import org.python.util.PythonInterpreter;
import java.io.IOException;
import java.io.OutputStream;


public class Reset extends KeyAdapter implements MagicCommand{

    JythonShell js;
    boolean listening;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
        listening = false;
    
    }
    
    public String getName(){ return "%reset"; }
    public String getDescription(){
    
        return "%reset: Resets the namespace by removing all names defined by the user.\n"+
               "Input/Output history are left around in case you need them.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().equals( "%reset" );
    
    }
    public void keyTyped( KeyEvent ke ){ ke.consume(); }
    public void keyReleased( KeyEvent ke ){ ke.consume(); }
    public void keyPressed( KeyEvent ke ){
        
        ke.consume();
        JTextComponent jtc = js.getShellComponent();
        String modifiers = ke.getKeyModifiersText( ke.getModifiers() );
        String text = ke.getKeyText( ke.getKeyCode() );
        boolean removed = false;
        try{

            if( !modifiers.equals( "" ) || !text.equals( "Y" ) );
            else{
                
                List<String> who = js.getWho(); 
                for( String s: who ){
                    
                    String command = String.format( "del %1$s", s );
                    js._pi.exec( command );
                
                }
                who.clear();
                removed = true;
            
            } 
            
            Document doc = jtc.getDocument();
            try{
                
                String trail = "";
                if( !removed ) trail = "Nothing done.";
                String message = String.format( "\n%1$s\n", trail  );
                doc.insertString( jtc.getCaretPosition(), message , null );
            
            }
            catch( BadLocationException ble ){}
            js.insertPrompt( false );
        
        
        
        }
        catch( Exception x ){
        
        
        
        }
        finally{
        
            jtc.removeKeyListener( this );
        
        }
    
    
    }
    

    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051120223225.1:<<command>>
        
        final Runnable run = new Runnable(){
            public void run(){
                
                JTextPane jtp = (JTextPane)js.getShellComponent();
                String message = "Once deleted, variables cannot be recovered. Proceed (y/n)? ";
                try{
        
                    OutputStream out = js.getStandardOut();
                    out.write( message.getBytes() );
                    
                }
                catch( IOException io ){ io.printStackTrace(); }
                listening = true;
                jtp.addKeyListener( Reset.this );
                
            }
        };
        
        js.setNextPrompt( run );
        //@-node:zorcanda!.20051120223225.1:<<command>>
        //@nl
        return false;
    
    }


}
//@-node:zorcanda!.20051120223225:@thin Reset.java
//@-leo
