//@+leo-ver=4-thin
//@+node:zorcanda!.20051117120412:@thin P.java
//@@language java
package org.leo.shell.magic;

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;

public class P implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%p"; }
    public String getDescription(){
    
        return "%p --> a shortcut for 'print'\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().startsWith( "%p " );
    
    }

    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051117120412.1:<<command>>
        String newcommand = command.replaceFirst( "\\%p", "print" );
        js._pi.exec( newcommand );
        //@-node:zorcanda!.20051117120412.1:<<command>>
        //@nl
        return false;
    
    }


}
//@nonl
//@-node:zorcanda!.20051117120412:@thin P.java
//@-leo
