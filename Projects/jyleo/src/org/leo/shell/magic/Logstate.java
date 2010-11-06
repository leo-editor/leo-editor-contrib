//@+leo-ver=4-thin
//@+node:zorcanda!.20051203134428:@thin Logstate.java
//@@language java
package org.leo.shell.magic; 

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
import java.io.*;

public class Logstate implements MagicCommand{

    JythonShell js;
    
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%logstate"; }
    public String getDescription(){
    
        return "%logstate: Print the status of the logging system.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().equals( "%logstate" );
    
    }


    public boolean doMagicCommand( String command ){
        
        OutputStream out = js.getStandardOut();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051203134428.1:<<command>>
            if( Logcore.logstreams.size() == 0 )out.write( "Logging has not been activated.\n".getBytes() );
            else if( Logcore.logging == true )out.write( "Logging has been activated and is On.\n".getBytes() );
            else out.write( "Logging has been activated and is Off.\n".getBytes() );
            //@-node:zorcanda!.20051203134428.1:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    
    }
    
    //@    @+others
    //@-others

}
//@nonl
//@-node:zorcanda!.20051203134428:@thin Logstate.java
//@-leo
