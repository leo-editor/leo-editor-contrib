//@+leo-ver=4-thin
//@+node:zorcanda!.20051114111812:@thin Clean.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import java.io.*;


public class Clean implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%clean"; }
    public String getDescription(){
    
        return "%clean - this will destroy all JPIDs\n\n"; 
    
    } 

    public boolean handle( String command ){
    
        return command.equals( "%clean" );
    
    }

    public boolean doMagicCommand( String command ){
    
        OutputStream out = js.getStandardOut();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051114111812.1:<<command>>
            for( final Process p: Jpidcore.processes.values() ){
                    
                p.destroy();
                    
                    
            }
            
            out.write( String.format( "%s Processes destroyed\n", Jpidcore.processes.size() ).getBytes() );
            Jpidcore.processes.clear();
            
            
            
            
            //@-node:zorcanda!.20051114111812.1:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    
    }



}
//@nonl
//@-node:zorcanda!.20051114111812:@thin Clean.java
//@-leo
