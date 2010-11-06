//@+leo-ver=4-thin
//@+node:zorcanda!.20051119110400:@thin Who_ls.java
//@@language java
package org.leo.shell.magic;

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
import org.leo.shell.util.InsertPrompt;
import java.util.*;
import org.python.core.*;


public class Who_ls implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%who_ls"; }
    public String getDescription(){
    
        return "%who_ls: Return a sorted list of all interactive variables. If arguments are given, only variables of types matching these arguments are returned.\n"+
        "Usage examples:\n"+
        "%who_ls\n"+
        "%who_ls str int  #this prints out variables whose type is str and int\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().startsWith( "%who_ls" );
    
    }

    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051119113407:<<command>>
        String[] pieces = command.split( "\\s+" );
        String[] stypes = new String[ pieces.length -1 ];
        System.arraycopy( pieces, 1, stypes, 0, stypes.length );
        java.util.List<String> types = Arrays.asList( stypes );
        
        List<String> who = js.getWho();
        Collections.sort( who );
        PyList rv = new PyList();
        Iterator<String> it = who.iterator();
        while( it.hasNext() ){
        
            try{
                String s = it.next();
                PyObject o = js._pi.get( s );
                if( types.size() != 0 && o != null ){
                
                    Object o2 = __builtin__.getattr( __builtin__.type( o ), new PyString( "__name__" ) );
                    String s2 = o2.toString();
                    if( types.contains( s2 ) ) rv.add( o );
                
                
                }
                else if ( o != null ) rv.add( o );
                if( o == null ) it.remove();
                
            }
            catch( Exception x ){
            
                it.remove();
            
            }
        
        }
        rv.sort();
        PyObject repr = __builtin__.repr( rv );
        String execute = repr.toString();
        js._pi.push( execute );
        
        
        //@-node:zorcanda!.20051119113407:<<command>>
        //@nl
        return false;
    
    }


}
//@nonl
//@-node:zorcanda!.20051119110400:@thin Who_ls.java
//@-leo
