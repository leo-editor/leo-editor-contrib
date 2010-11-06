//@+leo-ver=4-thin
//@+node:zorcanda!.20051114174617:@thin Lsmagic.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import java.io.OutputStream;
import java.io.IOException;

public class Lsmagic implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%lsmagic"; }
    public String getDescription(){
    
        return "%lsmagic --> returns the current available set of magic commands\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().equals( "%lsmagic" );
    
    }

    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051114174617.1:<<command>>
        StringBuilder sb = new StringBuilder();
        for( MagicCommand mc: js.mcommands )
            sb.append( mc.getName() ).append( " " );
        
        sb.append( "\n" );
        OutputStream out = js.getStandardOut();
        try{
            out.write( "Available magic commands:\n".getBytes() );
            out.write( sb.toString().getBytes() );
        }
        catch( IOException io ){}
        return true;
        //@nonl
        //@-node:zorcanda!.20051114174617.1:<<command>>
        //@nl
    
    }



}
//@nonl
//@-node:zorcanda!.20051114174617:@thin Lsmagic.java
//@-leo
