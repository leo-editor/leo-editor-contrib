//@+leo-ver=4-thin
//@+node:zorcanda!.20051121194231:@thin Unalias.java
//@@language java
package org.leo.shell.magic; 

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 


public class Unalias implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%unalias"; }
    public String getDescription(){
    
        return "%unalias: Remove an alias\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().startsWith( "%unalias" );
    
    }


    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051121194231.1:<<command>>
        String[] pieces = command.split( "\\s+" );
        if( pieces.length == 2 ){
        
            js.removeAlias( pieces[ 1 ] );
        
        
        }
        //@nonl
        //@-node:zorcanda!.20051121194231.1:<<command>>
        //@nl
        return true;
    
    }


}
//@nonl
//@-node:zorcanda!.20051121194231:@thin Unalias.java
//@-leo
