//@+leo-ver=4-thin
//@+node:zorcanda!.20051118235735:@thin Autocall.java
//@@language java
package org.leo.shell.magic;

import org.leo.shell.JythonShell;
import org.leo.shell.Documentation;
import org.leo.shell.MagicCommand; 
import java.io.IOException;
import java.io.OutputStream;


public class Autocall implements MagicCommand,Documentation{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
        js.addInteractiveDocumentation( this );
    
    }
    
    public String getDocumentation(){
    
        return "Autocalling:\n"+
        "Autocalling will provide parenthesis when calling a function. So for example:"+
        "dir a\n"+
        "becomes:\n"+
        "dir( a )\n"+
        "This feature is toggled on and off with the %autocall magic command\n";    
    
    }
    
    public String getName(){ return "%autocall"; }
    public String getDescription(){
    
        return "%autocall --> toggles autocalling of and on\n"+
                "Autocalling is the ability to do something like this:\n"+
                "dir a\n"+
                "Instead of dir( a ).\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().equals( "%autocall" );
    
    }

    public boolean doMagicCommand( String command ){
        
        OutputStream out = js.getStandardOut();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051118235735.1:<<command>>
            boolean autocall = js.getAutocall();
            autocall = autocall? false: true;
            js.setAutocall( autocall );
            String message = String.format( "Automatic calling is: %1$s\n", autocall? "On": "Off" );
            out.write( message.getBytes() );
            //@nonl
            //@-node:zorcanda!.20051118235735.1:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    
    }


}
//@nonl
//@-node:zorcanda!.20051118235735:@thin Autocall.java
//@-leo
