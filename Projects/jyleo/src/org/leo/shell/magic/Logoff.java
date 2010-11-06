//@+leo-ver=4-thin
//@+node:zorcanda!.20051203132240:@thin Logoff.java
//@@language java
package org.leo.shell.magic; 

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
import java.io.*;
import java.util.Collection;

public class Logoff implements MagicCommand{

    JythonShell js;
    
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%logoff"; }
    public String getDescription(){
    
        return "%logoff: Temporarily stop logging. You must have previously started logging.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().equals( "%logoff" );
    
    }


    public boolean doMagicCommand( String command ){
        
        OutputStream out = js.getStandardOut();
        OutputStream err = js.getStandardErr();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051203132240.1:<<command>>
            if( Logcore.logstreams.size() == 0 ){
            
                err.write( "Logging has not started, nothing to turn off.\n".getBytes() );
            
            
            }
            else if( Logcore.logging == false ){
            
                err.write( "Logging has been suspended, nothing to turn off.\n".getBytes() );
            
            }
            else{
            
                Collection<OutputStream> streams = Logcore.logstreams.values();
                for( OutputStream os: streams )
                    js.removeLogger( os );
                Logcore.logging = false;
                out.write( "Loggin has been suspended\n".getBytes() );
            
            }
            
            //@-node:zorcanda!.20051203132240.1:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    
    }
    
    //@    @+others
    //@-others

}
//@nonl
//@-node:zorcanda!.20051203132240:@thin Logoff.java
//@-leo
