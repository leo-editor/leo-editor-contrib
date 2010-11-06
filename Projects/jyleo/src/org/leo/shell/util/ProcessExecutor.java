//@+leo-ver=4-thin
//@+node:zorcanda!.20051128193806:@thin ProcessExecutor.java
//@@language java
package org.leo.shell.util;

import javax.swing.SwingUtilities;
import java.util.LinkedList;
import java.util.List;
import java.io.*;
import java.util.regex.Pattern;
import org.leo.shell.JythonShell;
import org.leo.shell.util.InsertPrompt;
import org.python.core.PyObject;


public class ProcessExecutor implements Runnable{


    JythonShell js;
    String command;
    File wdirectory;
    public ProcessExecutor( JythonShell js, String command, File wdirectory ){
    
        this.js = js;
        this.command = command;
        this.wdirectory = wdirectory;
    }
    

    public void run(){
        
        command = js.checkForJythonReference( command );
        List<String> cllist = CommandLineParser.parseCommandLine( command );
        String[] pieces = cllist.toArray( new String[]{} );
        String cmdpath = CommandFinder.findCommand( pieces[ 0 ], js.getCurrentWorkingDirectory() );
        OutputStream os = js.getStandardOut();
        if( cmdpath != null ){
            
            LinkedList<String> cmd = new LinkedList<String>();
            cmd.add( cmdpath );
            if( pieces.length > 1 )
                for( int i = 1; i < pieces.length; i++ ) cmd.add( pieces[ i ] );
            
            ProcessBuilder pb = new ProcessBuilder( cmd );
            pb.redirectErrorStream( true );
            pb.directory( wdirectory );
            try{
                Process process = pb.start();
                InputStream is = process.getInputStream();
                BufferedReader br = new BufferedReader( new InputStreamReader( is ) );
                String output = null;
                while( ( output = br.readLine() ) != null ){
                     os.write( output.getBytes() );
                     os.write( "\n".getBytes() );
                }
            }
            catch( IOException io ){ io.printStackTrace();}
        
        }
        else{
        
            try{
                String message = String.format( "Can't find command '%1$s' on PATH, no execution.\n", pieces[ 0 ] );
                os.write( message.getBytes() );
                
            }
            catch( IOException io ){}
        
        
        }
    
        InsertPrompt ip = new InsertPrompt( js, false );
        SwingUtilities.invokeLater( ip );
    
    }




}
//@nonl
//@-node:zorcanda!.20051128193806:@thin ProcessExecutor.java
//@-leo
