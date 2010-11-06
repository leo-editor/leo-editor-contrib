//@+leo-ver=4-thin
//@+node:zorcanda!.20051119102720:@thin Sx.java
//@@language java
package org.leo.shell.magic;

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.leo.shell.util.*;
import java.util.regex.Pattern;
import java.io.*;
import java.util.concurrent.*;
import java.util.List;
import org.python.core.PyList;

public class Sx implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%sx"; }
    public String getDescription(){ 
    
        return "%sx --> will run the given command using commands.getoutput(), and return the result formatted as a list (split on  ). Since the output is returned , it will be stored in ipython s regular output cache Out[N] and in the   N  automatic variables.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().startsWith( "%sx" );
    
    }

    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051119102720.1:<<command>>
        String nwcommand = command.replaceFirst( Pattern.quote( "%sx" ), "" ).trim();
        nwcommand = js.checkForJythonReference( nwcommand );
        List<String> cmdline = CommandLineParser.parseCommandLine( nwcommand );
        String[] pieces = cmdline.toArray( new String[]{} );
        pieces[ 0 ] = CommandFinder.findCommand( pieces[ 0 ], js.getCurrentWorkingDirectory() );
        final ProcessBuilder pb = new ProcessBuilder( pieces );
        pb.redirectErrorStream( true );
        pb.directory( js.getCurrentWorkingDirectory() );
        final PyList output = new PyList();
        Runnable run = new Runnable(){
        
            public void run(){
                try{
                    Process process = pb.start();
                    InputStream is = process.getInputStream();
                    BufferedReader br = new BufferedReader( new InputStreamReader( is ) );
                    String data = null;
                    while( ( data = br.readLine() ) != null ) output.add( data );
                    br.close();
        
                }
                catch( IOException io ){}
        
                js._pi.set( "_", output );
                js._pi.push( "_" );
        
            }
        };
        FutureTask<String> ft = new FutureTask<String>( run, "Ok" );
        js.execute2( ft );
        try{
            ft.get();
        }
        catch( ExecutionException ee ){}
        catch( InterruptedException ie ){}
        //@nonl
        //@-node:zorcanda!.20051119102720.1:<<command>>
        //@nl
        return false;
    
    }


}
//@nonl
//@-node:zorcanda!.20051119102720:@thin Sx.java
//@-leo
