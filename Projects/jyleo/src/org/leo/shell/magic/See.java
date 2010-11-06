//@+leo-ver=4-thin
//@+node:zorcanda!.20051114114456:@thin See.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import javax.swing.text.*;
import java.io.*;
import java.awt.*;
import javax.swing.*;


public class See implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }

    public String getName(){ return "%see"; }
    public String getDescription(){
    
        return "%see n - this will show any output JPID n has collected.\n"+
    "Placing a reference name after the JPID will place the output in the reference\n\n"; 
    
    } 

    public boolean handle( String command ){
    
        return command.startsWith( "%see" );  
    
    }

    public boolean doMagicCommand( String command ){
        
        OutputStream out = js.getStandardOut();
        OutputStream err = js.getStandardErr();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051114114456.1:<<command>>
            final String[] tokens = command.split( "\\s+" );
            if( tokens.length < 2 ){
                        
                err.write( "%see requires and argument\n".getBytes() );
                return true;
                                
            }
            final String pid = tokens[ 1 ];
            final Integer i;
            try{
                i = Integer.valueOf( pid );
            }
            catch( NumberFormatException nfe ){
                    
                err.write( "%see requires a valid JPID\n".getBytes() );
                return true;
                    
                    
            }
            if( Jpidcore.processes.containsKey( i ) ){
                        
                final Process p = Jpidcore.processes.get( i );
                try{
                    final InputStream is = p.getInputStream();
                    final int available = is.available();
                    if( available == 0 ){
                            
                        out.write( ("JPID " + i + " has no output\n" ).getBytes());
                            
                    }
                    else{
                            
                        final byte[] b = new byte[ available ];
                        is.read( b );
                        final String input = new String( b );
                        if( tokens.length > 2 ){
                                
                            final String reference = tokens[ 2 ];
                            js._pi.set( reference, input );
                            return true;
                            
                        }
                        else{
                            
                            Runnable run = new Runnable(){
                                
                                public void run(){
                                    
                                    JTextComponent jtc = js.getShellComponent();
                                    final Document doc = jtc.getDocument();
                                    final int pos = jtc.getCaretPosition();
                                    final JTextArea see_widget = new JTextArea();
                                    see_widget.setText( input );
                                    see_widget.setCaretPosition( 0 );
                                    final FontMetrics fm = see_widget.getFontMetrics( see_widget.getFont() );
                                    final Dimension size = see_widget.getPreferredSize();
                                    size.height = fm.getHeight() * 5;
                                    final JScrollPane jsp = new JScrollPane( see_widget );
                                    jsp.setPreferredSize( size );
                                    final SimpleAttributeSet sas = new SimpleAttributeSet();
                                    StyleConstants.setComponent( sas, jsp );
                                    try{
                                        doc.insertString( pos, "\n", sas );
                                    }
                                    catch( BadLocationException ble ){}
                                }
                            };
                            SwingUtilities.invokeLater( run );
                            return true;
                            
                        } 
                    }
                }catch( IOException io ){}
                       
                    try{
                                
                        final int status = p.exitValue();
                        out.write( ("JPID " + i +" exited with value of " + status  + "\n").getBytes());
                        Jpidcore.processes.remove( i );
                                
                    }
                    catch( final IllegalThreadStateException itse ){
                                
                        out.write(( "JPID " + i +" still active\n").getBytes() );  
                                
                    }
                            
                    return true;
            
            }
            else{
                        
                err.write( ( pid + " not valid JPID\n" ).getBytes() );
                return true;
                        
            }
            
            
            
            //@-node:zorcanda!.20051114114456.1:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    
    }



}
//@nonl
//@-node:zorcanda!.20051114114456:@thin See.java
//@-leo
