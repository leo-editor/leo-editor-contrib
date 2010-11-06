//@+leo-ver=4-thin
//@+node:zorcanda!.20051121103634:@thin ScriptExecutor.java
//@@language java
package org.leo.shell.util;

import org.leo.shell.JythonShell;
import java.util.*;
import java.util.concurrent.*;
import javax.swing.*;

public class ScriptExecutor implements Callable<Boolean>{

    List<String> script;
    JythonShell js;
    public ScriptExecutor( JythonShell js, List<String> script ){
    
        this.script = script;
        this.js = js;
    
    } 
    
    public FutureTask<Boolean> submit(){
        //this method should be called to submit the ScriptExecutor, it ensures that it is on the right queue
        //no need to deadlock if accidentaly misused...
        FutureTask<Boolean> ft = new FutureTask<Boolean>( this );
        js.execute2( ft );
        return ft;
    
    }
    
    public Boolean call(){
    
        js.setAutoindent( false );
        try{
            for( String s: script ){
                
                String s2 = s;
                if( s2.startsWith( ">>>" ) || s2.startsWith( "..." ) )
                    s2 = s2.substring( 3 );        
                js.addLineToExecute( s2 );
                if( !s.endsWith( "\n" ) ) s += '\n';
                AddLine al = new AddLine( js, s, true );
                SwingUtilities.invokeAndWait( al );
                FutureTask<Boolean> rv = new FutureTask<Boolean>( js );
                js.execute1( rv );
                final boolean more = rv.get();
                InsertPrompt ip = new InsertPrompt( js, more );
                SwingUtilities.invokeAndWait( ip );                    
            }
        }
        catch( Exception x ){ return false;}               
        finally{
            js.setAutoindent( true );
        }
        return true;
    }
    
}
//@-node:zorcanda!.20051121103634:@thin ScriptExecutor.java
//@-leo
