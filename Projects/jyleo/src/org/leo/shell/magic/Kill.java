//@+leo-ver=4-thin
//@+node:zorcanda!.20051114130124:@thin Kill.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import javax.swing.text.*;
import java.io.*;
import org.python.core.*;
//import java.awt.*;
//import javax.swing.*;
//import javax.swing.table.*;
//import java.util.*;

public class Kill implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%kill"; }
    public String getDescription(){
    
        return "%kill n - this will cause JPID n to be destroyed.\n\n"; 
    
    } 

    public boolean handle( String command ){
    
        return command.startsWith( "%kill" );
    
    }

    public boolean doMagicCommand( String command ){
    
        OutputStream out = js.getStandardOut();
        OutputStream err = js.getStandardErr();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051114130124.1:<<command>>
            final String[] tokens = command.split( "\\s+" );
            if( tokens.length < 2 ){
                err.write( "%kill requires a JPID\n".getBytes() );
                return true;
            }    
            final Integer i;
            try{
                    
                i = Integer.valueOf( tokens[ 1 ] );
                        
            }
            catch( NumberFormatException nfe ){
                    
                err.write( ( tokens[ 1 ] + " is not a number\n").getBytes() );
                return true;
                    
            }
            if( !Jpidcore.processes.containsKey( i ) ){
                    
                err.write( ( i + " is not a valid JPID\n").getBytes() );
                return false;
                      
            }
            final Process p = Jpidcore.processes.get( i );
            p.destroy();
            Jpidcore.processes.remove( i );
            out.write( ( "JPID " + i + " has been removed\n" ).getBytes() );
            //@-node:zorcanda!.20051114130124.1:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    
    }



}
//@nonl
//@-node:zorcanda!.20051114130124:@thin Kill.java
//@-leo
