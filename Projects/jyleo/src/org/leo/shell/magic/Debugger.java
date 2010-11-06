//@+leo-ver=4-thin
//@+node:zorcanda!.20051114101117:@thin Debugger.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.leo.shell.util.InsertPrompt;
import java.io.*;
import javax.swing.SwingUtilities;
import javax.swing.text.JTextComponent;
import javax.swing.text.Document;
import javax.swing.text.BadLocationException;
import java.util.concurrent.FutureTask;

public class Debugger implements MagicCommand{

    JythonShell js;
    public Debugger(){
    
    
    
    }
    
    public String getName(){
    
        return "%pdb";
    
    }
    public String getDescription(){
    
        return "%pdb -- three forms:\n"+
               "%pdb --> this starts up the Pdb debugger\n"+
               "%pdb filename --> this runs the file under Pdb in the shell\n"+
               "%pdb [on|1|off|0 ] --> this turns automatic startup of Pdb on an exception on and off:\n"+
               "    %pdb on  --> now on\n"+
               "    %pdb off --> now off\n" +
               "    %pdb 1 --> now on\n" +
               "    %pdb 0 --> now off\n\n";
    
    } 

    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    
    }

    public boolean handle( String command ){
    
        return command.startsWith( "%pdb" ); 
    
    
    }
    
    public boolean doMagicCommand( String command ){
        if( command.trim().equals( "%pdb" ) ){
            js.addLineToExecute( "import pdb" );
            js.addLineToExecute( "pdb.set_trace()" );
        }
        else if( command.split( "\\s+" ).length == 2 ){
        
            String[] tokens = command.split( "\\s+" );
            String onoff = tokens[ 1 ];
            if( onoff.equals( "on" ) || onoff.equals( "1" ) ){
        
                js.setPdbOnException( true );
                return true;
        
            } 
            else if ( onoff.equals( "off" ) || onoff.equals( "0" ) ){
        
                js.setPdbOnException( false );
                return true;
        
            }
            final File f = new File( tokens[ 1 ] );
            if( f.exists() ){
        
                try{
                    FileInputStream fis = new FileInputStream( f );
                    String prolog = "import pdb;pdb.set_trace()\n";
                    ByteArrayInputStream bais = new ByteArrayInputStream( prolog.getBytes() );
                    final SequenceInputStream sis = new SequenceInputStream( bais, fis );
                    Runnable run = new Runnable(){
                
                        public void run(){ 
                        
                            js._pi.execfile( sis, f.getName() );
                            InsertPrompt ip = new InsertPrompt( js, false );
                            try{
                                SwingUtilities.invokeAndWait( ip );
                            }
                            catch( Exception x ){}
                        }
            
                    };
                
                    js.execute2( run );
                    return false;
                }
                catch( IOException io ){}
                return true;
            }
            else{
            
                JTextComponent jtc = js.getShellComponent();
                Document doc = jtc.getDocument();
                try{
                    doc.insertString( jtc.getCaretPosition(), f.getName() + " does not exist\n", null );
                }
                catch( BadLocationException ble ){}
                return true;
         
            }
    
        }
        else
            return true;
    
        class StartPdb implements Runnable{
    
            public void run(){
            
                js.execute1( js );
                FutureTask<Boolean> more = new FutureTask<Boolean>( js );
                js.execute1( more );
                try{
                    more.get();
                    InsertPrompt ip = new InsertPrompt( js, false );
                    SwingUtilities.invokeAndWait( ip );
                
                }
                catch( Exception x ){}
            }
        }
        js.execute2( new StartPdb() );
        return false;

    }
}
//@nonl
//@-node:zorcanda!.20051114101117:@thin Debugger.java
//@-leo
