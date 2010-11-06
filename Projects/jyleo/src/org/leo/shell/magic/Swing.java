//@+leo-ver=4-thin
//@+node:zorcanda!.20051114112036:@thin Swing.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import javax.swing.text.*;
import javax.swing.*;
import java.io.*;


public class Swing implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){
    
        return "%swing";
    
    }
    public String getDescription(){
    
        return "%swing reference -- this will place the reference into the editor if the reference\n"+
    "is a JComponent subclass.  Useful for quick gazing of what a Swing component looks like.\n\n"; 
    
    } 

    public boolean handle( String command ){
    
        return command.startsWith( "%swing" );
    
    }

    public boolean doMagicCommand( String command ){
        
        OutputStream err = js.getStandardErr();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051114112036.1:<<command>>
            final String[] tokens = command.split( "\\s+" );
            if( tokens.length  < 2 ){
                    
                err.write( "Need a reference for %swing\n".getBytes());
                return true;
                    
                    
            }
            final String reference = tokens[ 1 ];
            Object o = null;
            try{
                    
                o = js._pi.get( reference, JComponent.class );
                    
            }
            catch( final  NullPointerException x ){}
            catch( final Exception e ){
                    
                o = "Exception";
                    
            }
            if( o == null ){
                    
                err.write( "Reference refers to nothing\n".getBytes() );
                return true;
                    
            }
            else if( !(o instanceof JComponent) ){
                    
                err.write( "Reference not a JComponent\n".getBytes() );
                return true;
                        
            }
            
            final Object o2 = o;
            Runnable run = new Runnable(){
                    
                public void run(){
                    
                    JTextComponent jtc = js.getShellComponent();
                    final Document doc = jtc.getDocument();
                    final int pos = jtc.getCaretPosition();            
                    final SimpleAttributeSet sas = new SimpleAttributeSet();
                    StyleConstants.setComponent( sas, (JComponent)o2 );
                    try{
                        doc.insertString( pos, "\n", sas );
                    }
                    catch( BadLocationException ble ){}
                }
                        
            };
            SwingUtilities.invokeLater( run );
                
            //@-node:zorcanda!.20051114112036.1:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    
    }



}
//@nonl
//@-node:zorcanda!.20051114112036:@thin Swing.java
//@-leo
