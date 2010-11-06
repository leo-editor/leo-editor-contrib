//@+leo-ver=4-thin
//@+node:zorcanda!.20051116191026:@thin Pdoc.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.python.core.*; 
import java.io.IOException;
import java.io.OutputStream;

public class Pdoc implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%pdoc"; }
    public String getDescription(){
    
        return "%pdoc --> prints out the doc string of the passed in object if one can be found,\n"+
               "otherwise does nothing.\n"+
               "usage:\n"+
               "%pdoc ref  # could be a module, a method, an object, etcc...\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().startsWith( "%pdoc " );
    
    }

    public boolean doMagicCommand( String command ){
    
        OutputStream out = js.getStandardOut();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051116191026.1:<<command>>
            String[] pieces = command.split( "\\s+" );
            if( pieces.length == 2 ){
            
                PyObject po = js.getPyObject( pieces[ 1 ].split( "\\." ) );
                if( po != null ){
                    
                    PyString psdoc = new PyString( "__doc__" );
                    if( !__builtin__.hasattr( po, psdoc ) ) return true;
                    PyObject doc = __builtin__.getattr( po, psdoc );
                    if( doc != null ){
            
                        String dstring = doc.toString();
                        if( !dstring.endsWith( "\n" ) ) dstring += "\n";
                        out.write( dstring.getBytes() );
            
                    
                    }
                
                
                
                }
            
            
            }
            //@nonl
            //@-node:zorcanda!.20051116191026.1:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    
    }

    //@    @+others
    //@-others

}
//@nonl
//@-node:zorcanda!.20051116191026:@thin Pdoc.java
//@-leo
