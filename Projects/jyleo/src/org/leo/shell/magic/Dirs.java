//@+leo-ver=4-thin
//@+node:zorcanda!.20051202092511:@thin Dirs.java
//@@language java
package org.leo.shell.magic; 

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
import org.python.core.PyList;


public class Dirs implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%dirs"; }
    public String getDescription(){
    
        return "%dirs: Return the current directory stack.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().equals( "%dirs" );
    
    }


    public boolean doMagicCommand( String command ){
    
        //@        <<command>>
        //@+node:zorcanda!.20051202092511.1:<<command>>
        
        PyList dstack = js.getDirectoryStack();
        js._pi.set( "_", dstack );
        js._pi.push( "_" );
        return false;
        //@nonl
        //@-node:zorcanda!.20051202092511.1:<<command>>
        //@nl
    
    }
    
    //@    @+others
    //@-others

}
//@nonl
//@-node:zorcanda!.20051202092511:@thin Dirs.java
//@-leo
