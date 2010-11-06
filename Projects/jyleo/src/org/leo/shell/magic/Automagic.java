//@+leo-ver=4-thin
//@+node:zorcanda!.20051203115652:@thin Automagic.java
//@@language java
package org.leo.shell.magic; 

import org.leo.shell.Documentation;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
import java.io.*;

public class Automagic implements MagicCommand, Documentation{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
        js.addInteractiveDocumentation( this );
    
    }
    
    public String getDocumentation(){
    
        return "Automagic:\n"+
        "Automagic is simply being able to call magic commands without the '%' character.\n"+
        "This is toggled on and off with the %automagic magic command.\n";
    }
    
    public String getName(){ return "%automagic"; }
    public String getDescription(){
    
        return "%automagic: Make magic functions callable without having to type the initial %. Toggles on/o  (when o , you must call it as %automagic, of course). Note that magic functions have lowest priority, so if there s a variable whose name collides with that of a magic fn, automagic won t work for that function (you get the variable instead). However, if you delete the variable (del var), the previously shadowed magic function becomes visible to automagic again.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().equals( "%automagic" );
    
    }


    public boolean doMagicCommand( String command ){
    
        //@        <<command>>
        //@+node:zorcanda!.20051203115652.1:<<command>>
        OutputStream out = js.getStandardOut();
        try{
            
            boolean status = js.getAutomagic();
            if( status ){
            
                js.setAutomagic( false );
                out.write( "Automagic is OFF, % prefix IS needed for magic functions.\n".getBytes() );
            
            }
            else{
                
                js.setAutomagic( true );
                out.write( "Automagic is ON, % prefix NOT needed for magic functions.\n".getBytes() );
            
            
            }
        
        }
        catch( IOException io ){}
        //@nonl
        //@-node:zorcanda!.20051203115652.1:<<command>>
        //@nl
        return true;
    
    }
    
    //@    @+others
    //@-others

}
//@nonl
//@-node:zorcanda!.20051203115652:@thin Automagic.java
//@-leo
