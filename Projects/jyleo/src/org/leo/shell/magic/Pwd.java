//@+leo-ver=4-thin
//@+node:zorcanda!.20051114112536:@thin Pwd.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import java.io.*;


public class Pwd implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%pwd"; }
    public String getDescription(){
    
        return "%pwd - this shows the Jython Shells current working directory\n"+
    "Following the %pwd with a reference will set the reference to a\n"+
    "java.io.File instance, which represents the current directory\n\n"; 
    
    } 

    public boolean handle( String command ){
    
        return command.startsWith( "%pwd " ) || command.trim().equals( "%pwd" ); 
    
    }

    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051114112536.1:<<command>>
        OutputStream out = js.getStandardOut();
        try{
            File cwd = js.getCurrentWorkingDirectory();
            final String[] tokens = command.split( "\\s+" );
            if( tokens.length > 1 ){
                    
                final String reference = tokens[ 1 ];
                js._pi.set( reference, new File( cwd.getAbsolutePath() ) );
                return true;
                
                
            }
            else out.write( (cwd.getAbsolutePath()+"\n" ).getBytes() );
        
        
        }
        catch( final IOException io ){
                
                io.printStackTrace();
        
        }
        //@-node:zorcanda!.20051114112536.1:<<command>>
        //@nl
        return true;
    
    }



}
//@nonl
//@-node:zorcanda!.20051114112536:@thin Pwd.java
//@-leo
