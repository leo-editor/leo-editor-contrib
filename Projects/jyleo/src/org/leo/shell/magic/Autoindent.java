//@+leo-ver=4-thin
//@+node:zorcanda!.20051119000118:@thin Autoindent.java
//@@language java
package org.leo.shell.magic;

import org.leo.shell.Documentation;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
import java.io.IOException;
import java.io.OutputStream;


public class Autoindent implements MagicCommand, Documentation{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
        js.addInteractiveDocumentation( this );
    
    }
    
    public String getDocumentation(){
    
        return "Autoindenting:\n"+
        "Autoindenting will indent your next line if the user types "+
        "enter and the line terminates with a ':'.\n"+
        "Toggled on and off with the %autoindent magic command\n";
        
    }
    
    public String getName(){ return "%autoindent"; }
    public String getDescription(){
    
        return "%autoindent --> toggles autoindenting of and on\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().equals( "%autoindent" );
    
    }

    public boolean doMagicCommand( String command ){
        
        OutputStream out = js.getStandardOut();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051119000118.1:<<command>>
            boolean autoindent = js.getAutoindent();
            autoindent = autoindent? false: true;
            js.setAutoindent( autoindent );
            String message = String.format( "Automatic indentation is: %1$s\n", autoindent? "On": "Off" );
            out.write( message.getBytes() );
            //@nonl
            //@-node:zorcanda!.20051119000118.1:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    
    }


}
//@-node:zorcanda!.20051119000118:@thin Autoindent.java
//@-leo
