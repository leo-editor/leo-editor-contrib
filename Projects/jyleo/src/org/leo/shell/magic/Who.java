//@+leo-ver=4-thin
//@+node:zorcanda!.20051118222818:@thin Who.java
//@@language java
package org.leo.shell.magic;

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
import java.util.*;
import java.io.*;
import org.python.core.*;


public class Who implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%who"; }
    public String getDescription(){
    
        return "%who --> this command prints out a list of identifiers that have been defined interactively\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().equals( "%who" );
    
    }

    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051118222818.1:<<command>>
        
        
        List<String> who = js.getWho();
        Collections.sort( who );
        StringBuilder sb = new StringBuilder();
        Iterator<String> it = who.iterator();
        while( it.hasNext() ){
        
            try{
                String s = it.next();
                Object o = js._pi.get( s );
                if( o == null || o == Py.None ) it.remove();
                else sb.append( s ).append( " " );
            }
            catch( Exception x ){
            
                it.remove();
            
            }
        
        }
        sb.append( "\n" );
        OutputStream os = js.getStandardOut();
        try{
            os.write( sb.toString().getBytes() );
        }
        catch( IOException io ){}
        //@-node:zorcanda!.20051118222818.1:<<command>>
        //@nl
        return true;
    
    }


}
//@nonl
//@-node:zorcanda!.20051118222818:@thin Who.java
//@-leo
