//@+leo-ver=4-thin
//@+node:zorcanda!.20051203132240.2:@thin Logon.java
//@@language java
package org.leo.shell.magic; 

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
import java.io.*;
import java.util.Collection;

public class Logon implements MagicCommand{

    JythonShell js;
    
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%logon"; }
    public String getDescription(){
    
        return "%logon: Restart logging. This function is for restarting logging which you ve temporarily stopped with %logoff. For starting logging for the first time, you must use the %logstart function, which allows you to specify an optional log filename.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().equals( "%logon" );
    
    }


    public boolean doMagicCommand( String command ){
        
        OutputStream out = js.getStandardOut();
        OutputStream err = js.getStandardErr();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051203132240.3:<<command>>
            if( Logcore.logstreams.size() == 0 ){
            
                err.write( "Logging has not been started, use Logstart.\n".getBytes() );
            
            }
            else if( Logcore.logging == true ){
            
                err.write( "Logging already occuring, operation can't restore anything.\n".getBytes() );
            
            }
            else{
            
                Collection<OutputStream> streams = Logcore.logstreams.values();
                for( OutputStream os: streams )
                    js.addLogger( os );
                    
                Logcore.logging = true;
                out.write( "Logging has been resumed.\n".getBytes() );
            
            
            }
            
            //@-node:zorcanda!.20051203132240.3:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    
    }
    
    //@    @+others
    //@-others

}
//@nonl
//@-node:zorcanda!.20051203132240.2:@thin Logon.java
//@-leo
