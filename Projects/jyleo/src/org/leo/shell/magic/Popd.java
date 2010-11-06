//@+leo-ver=4-thin
//@+node:zorcanda!.20051202115349:@thin Popd.java
//@@language java
package org.leo.shell.magic; 

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
import java.io.*;

public class Popd implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%popd"; }
    public String getDescription(){
    
        return "%popd: Change to directory popped o  the top of the stack.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().equals( "%popd" );
    
    }


    public boolean doMagicCommand( String command ){
    
        //@        <<command>>
        //@+node:zorcanda!.20051202115349.1:<<command>>
        OutputStream out = js.getStandardOut();
        OutputStream err = js.getStandardErr();
        try{
        
            String directory = js.popDStack();
            if( directory == null ){
            
                err.write( "Can't pop the directory stack\n".getBytes() );
                return true;
            
            }
            directory = js.getTopOfDStack();
            File f = new File( directory );
            if( f.exists() && f.isDirectory() ){
        
                js.setCurrentWorkingDirectory( f );
                String message = "Current working directory is now %1$s\n";
                out.write( String.format( message, f ).getBytes() );
        
            }
            else{
                
                if( !f.exists() )
                    err.write( "Directory returned from the stack, does not exits\n".getBytes() );
                else
                    err.write( "Item returned from the stack is not a directory\n".getBytes() );
            }
        }
        catch( IOException io ){}
        //@nonl
        //@-node:zorcanda!.20051202115349.1:<<command>>
        //@nl
        return true;
    
    }
    
    //@    @+others
    //@-others

}
//@nonl
//@-node:zorcanda!.20051202115349:@thin Popd.java
//@-leo
