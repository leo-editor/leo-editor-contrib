//@+leo-ver=4-thin
//@+node:zorcanda!.20051203174953:@thin Runlog.java
//@@language java
package org.leo.shell.magic; 

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.leo.shell.util.InsertPrompt; 
import java.io.*;
import java.util.*;
import java.util.concurrent.FutureTask;
import java.util.concurrent.ExecutionException;
import javax.swing.SwingUtilities;

public class Runlog implements MagicCommand{

    JythonShell js;
    
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%runlog"; }
    public String getDescription(){
    
        return "%runlog: Run files as logs. Usage: %runlog file1 file2 ... Run the named files (treating them as log files) in sequence inside the interpreter, and return to the prompt. This is much slower than %run because each line is executed in a try/except block, but it allows running files with syntax errors in them.\\n";
    
    } 

    public boolean handle( String command ){
    
        return command.startsWith( "%runlog " );
    
    }


    public boolean doMagicCommand( String command ){
        
        final OutputStream out = js.getStandardOut();
        final OutputStream err = js.getStandardErr();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051203174953.1:<<command>>
            final String[] pieces = command.split( "\\s+" );
            if( pieces.length == 1 ){
            
                err.write( "%runlog requires at least 1 argument, a file to run.  No file given.\n".getBytes() );
                return true;
            
            }
            
            Runnable run = new Runnable(){
            
                public void run(){
                    boolean more = false;
                    for( int i = 1; i < pieces.length; i++ ){
                    
                        try{
                            String file = pieces[ i ];
                            String ftoexecute = null;
                            File f = new File( file );
                            File f2 = new File( js.getCurrentWorkingDirectory(), file );
                            if( f.exists() && f.isFile() ) ftoexecute = f.getAbsolutePath();
                            else if( f2.exists() && f2.isFile() ) ftoexecute = f2.getAbsolutePath();
                            else{
                    
                                err.write( ( "Could not find " + file + ". Continuing execution.\n" ).getBytes() );
                                continue;
                
                            }
                
                            FileInputStream fis = new FileInputStream( new File( ftoexecute ) );
                            BufferedReader br = new BufferedReader( new InputStreamReader( fis ) );
                            String line = null;
                            out.write( ( "Executing File: " + file + "\n" ).getBytes() );
                            while( ( line = br.readLine() ) != null ){
                                try{
                                    
                                    js.addLineToExecute( line );
                                    FutureTask<Boolean> ft = new FutureTask<Boolean>( js );
                                    js.execute1( ft );
                                    more = ft.get();
                                }
                                catch( Exception x ){
                    
                                    err.write( ( "Problem executing: " + line + "\n" ).getBytes() );
                    
                                }
                            }
                        }catch( IOException io ){}
            
                        }
                        InsertPrompt ip = new InsertPrompt( js, more );
                        SwingUtilities.invokeLater( ip );
                    }
                };
            
            Runnable noprompt = new Runnable(){ public void run(){} };
            
            js.setNextPrompt( noprompt );
            js.execute2( run );
            //@nonl
            //@-node:zorcanda!.20051203174953.1:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    
    }
    
    //@    @+others
    //@-others

}
//@nonl
//@-node:zorcanda!.20051203174953:@thin Runlog.java
//@-leo
