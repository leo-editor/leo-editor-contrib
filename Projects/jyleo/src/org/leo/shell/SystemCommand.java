//@+leo-ver=4-thin
//@+node:zorcanda!.20051204131250:@thin SystemCommand.java
//@@language java
package org.leo.shell;

import java.util.*;
import java.io.IOException;
import java.io.OutputStream;
import org.leo.shell.util.ProcessExecutor;

public class SystemCommand implements LineListener, Documentation{

    JythonShell js;
    public SystemCommand( JythonShell js ){
    
        this.js = js;
        js.addQuietLineListener( this );
        js.addInteractiveDocumentation( this );
    
    }
    
    public String getDocumentation(){
    
        return "System access:\n"+
        "Typing ! at the command prompt followed by the system command\n" +
        "you wish to execute will start the command as a process and return\n"+
        "Typing !! is the same as typing %sx, see %sx documentation for more info\n";
    
    }

    public String lineToExecute( String line ){
        
        if( line.startsWith( "!" )){
            
            if( line.startsWith( "!!" ) ) line = line.replaceFirst( "\\!\\!|", "%sx " );//we can use a line listener here
            else{
                js.setNextPrompt( new Runnable(){ public void run(){} } );
                ProcessExecutor pe = new ProcessExecutor( js , line.substring( 1 ).trim(), js.getCurrentWorkingDirectory() );
                js.execute2( pe );
                return null;
            }
        
        
        }    
    
        return line;
    }

}
//@nonl
//@-node:zorcanda!.20051204131250:@thin SystemCommand.java
//@-leo
