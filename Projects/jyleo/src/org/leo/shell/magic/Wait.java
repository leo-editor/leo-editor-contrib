//@+leo-ver=4-thin
//@+node:zorcanda!.20051114125834:@thin Wait.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import java.io.*;
import org.python.core.*;

public class Wait implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%wait"; }
    public String getDescription(){
    
        return "%wait n - this will cause the JythonShell to suspend until JPID n has finished.\n\n"; 
    
    } 

    public boolean handle( String command ){
    
        return command.startsWith( "%wait " );
    
    }

    public boolean doMagicCommand( String command ){
        
        OutputStream out = js.getStandardOut();
        OutputStream err = js.getStandardErr();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051114125834.1:<<command>>
            try{
                
                final String[] tokens = command.split( "\\s+" );
                if( tokens.length < 2 ){
                    
                    err.write( "%wait requires a JPID\n".getBytes() );
                    return true;
                    
                    
                }    
                final Integer i;
                try{
                    
                    i = Integer.valueOf( tokens[ 1 ] );
                    
                }
                catch( NumberFormatException nfe ){
                    
                    err.write( ( tokens[ 1 ] + " is not a number\n" ).getBytes() );
                    return true;
                        
                }
                if( !Jpidcore.processes.containsKey( i ) ){
                    
                    err.write( (i + " is not a valid JPID\n").getBytes() );
                    return true;
                    
                    
                }
                
                final Process p = Jpidcore.processes.get( i );
                p.waitFor();
                Jpidcore.processes.remove( i );
                out.write( ("JPID " + i + " has finished\n").getBytes() );
                return true;
                    
            }
            
            catch( final InterruptedException ie ){
                ie.printStackTrace();
                
            }
            //@nonl
            //@-node:zorcanda!.20051114125834.1:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    
    }



}
//@nonl
//@-node:zorcanda!.20051114125834:@thin Wait.java
//@-leo
