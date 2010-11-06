//@+leo-ver=4-thin
//@+node:zorcanda!.20051201220428:@thin Dhist.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.python.core.*;
import java.io.*;


public class Dhist implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%dhist"; }
    public String getDescription(){
        
        return "%dhist: Print your history of visited directories. %dhist -> print full history %dhist n -> print last n entries only %dhist n1 n2 -> print entries between n1 and n2 (n2 not included) This history is automatically maintained by the %cd command, and always available as the global list variable _dh. You can use %cd -<n> to go to directory number <n>.\n\n";   

    
    } 

    public boolean handle( String command ){
    
        return command.startsWith( "%dhist " ) || command.trim().equals( "%dhist" ); 
    
    }

    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051201220446:<<command>>
        
        
        PyList dhistory = js.getDirectoryHistory();
        String[] pieces = command.split( "\\s+" );
        OutputStream out = js.getStandardOut();
        String format = "%1$d: %2$s\n";
        StringBuilder sb = new StringBuilder();
        sb.append( "Directory history (kept in _dh)\n" );
        try{
            if( pieces.length == 1 ){
        
                for( int i = 0; i < dhistory.size(); i++ ){
            
                    String item = dhistory.get( i ).toString();
                    sb.append( String.format( format, i, item ) );    
            
                }
                out.write( sb.toString().getBytes() );
            }
            else if ( pieces.length == 2 ){
            
                int from = Integer.valueOf( pieces[ 1 ] );
                int back = dhistory.size() - from;
                PyList slice = (PyList)dhistory.__getslice__( new PyInteger( back ), new PyInteger( dhistory.size() ), new PyInteger( 1 ) );
                for( int i = 0; i < slice.size(); i++, back++ ){
            
                    String item = slice.get( i ).toString();
                    sb.append( String.format( format, back, item ) );    
            
                }
                out.write( sb.toString().getBytes() );
                return true;
            
            }
            else if( pieces.length == 3 ){
            
                int start = Integer.valueOf( pieces[ 1 ] );
                int end = Integer.valueOf( pieces[ 2 ] );
                PyList slice = (PyList)dhistory.__getslice__( new PyInteger( start ), new PyInteger( end ), new PyInteger( 1 ) );
                for( int i = 0; i < slice.size(); i++, start++ ){
            
                    String item = slice.get( i ).toString();
                    sb.append( String.format( format, start, item ) );    
            
                }
                out.write( sb.toString().getBytes() );
                return true;        
            
            
            
            
            }
        
        
        }
        catch( IOException io ){}
        //@nonl
        //@-node:zorcanda!.20051201220446:<<command>>
        //@nl
        return true;
    
    }



}
//@nonl
//@-node:zorcanda!.20051201220428:@thin Dhist.java
//@-leo
