//@+leo-ver=4-thin
//@+node:zorcanda!.20051114125454:@thin Send.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
//import javax.swing.text.*;
import java.io.*;
import org.python.core.*;
//import java.awt.*;
//import javax.swing.*;
//import javax.swing.table.*;
//import java.util.*;

public class Send implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%send"; }
    public String getDescription(){
    
        return "%send n reference - this will send the JPID n as input the data in the Jython reference.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.startsWith( "%send" );
    
    }

    public boolean doMagicCommand( String command ){
        
        OutputStream out = js.getStandardOut();
        OutputStream err = js.getStandardErr();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051114125454.1:<<command>>
            final String[] tokens = command.split( "\\s+" );
            if( tokens.length < 3 ){
                    
                err.write( "%send requires a JPID and a Jython reference\n".getBytes() );
                return true;
                    
                    
            }    
            final Integer i;
            try{
                    
                i = Integer.valueOf( tokens[ 1 ] );
                        
            }
            catch( NumberFormatException nfe ){
                    
                err.write( (tokens[ 1 ] + " is not a number\n").getBytes() );
                return true;
                    
            }
            if( !Jpidcore.processes.containsKey( i )){
                    
                err.write( (i + " is not a valid JPID\n").getBytes() );
                return true;
                    
            }
            
            final Process p = Jpidcore.processes.get( i );
            final PyObject po = js._pi.get( tokens[ 2 ] );
            final OutputStream os = p.getOutputStream();
            final String s = po.toString();
            os.write( s.getBytes() );
            //p.destroy();
            //processes.remove( i );
            out.write( ("JPID " + i + " has been sent " + tokens[ 2 ] + "\n").getBytes() );
            return true;
            //@-node:zorcanda!.20051114125454.1:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    
    }



}
//@nonl
//@-node:zorcanda!.20051114125454:@thin Send.java
//@-leo
