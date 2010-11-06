//@+leo-ver=4-thin
//@+node:zorcanda!.20051203161122:@thin Bgprocess.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.leo.shell.util.CommandFinder;
import org.leo.shell.util.CommandLineParser;
import java.io.*;
import java.util.List;


public class Bgprocess implements MagicCommand{

    JythonShell js;
    int process_counter;
    public Bgprocess(){
    
        process_counter = 0;
    
    }
    
    
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }

    public String getName(){ return "%bgprocess"; }
    public String getDescription(){
    
        return "%bgprocess command args --> this will run a system process in the background.\n"+
               "It can be identified and interacted with via the JPID that is returned upon complention of the magic command.\n"+
               "See: %see,%kill,%ps,%clean, %wait and %send for magic commands to interact with the JPID.\n\n";
    } 

    public boolean handle( String command ){
    
        return command.startsWith( "%bgprocess " );  
    
    }

    public boolean doMagicCommand( String command ){
        
        OutputStream out = js.getStandardOut();
        OutputStream err = js.getStandardErr();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051203161122.1:<<command>>
            String[] pieces = command.split( "\\s+", 2 );
            pieces[ 1 ] = js.checkForJythonReference( pieces[ 1 ] );
            List<String> slpieces = CommandLineParser.parseCommandLine( pieces[ 1 ] );
            String[] lpieces = slpieces.toArray( new String[]{} );
            File cwd = js.getCurrentWorkingDirectory();
            lpieces[ 0 ] = CommandFinder.findCommand( lpieces[ 0 ], cwd );
            final ProcessBuilder pb = new ProcessBuilder( lpieces );
            pb.directory( cwd );
            final Process p = pb.start();
            process_counter++;
            Jpidcore.processes.put( process_counter, p );
            Jpidcore.pbuilders.put( p, pb );
            out.write( ( "JPID: " + process_counter + "\n" ).getBytes() );
            //@nonl
            //@-node:zorcanda!.20051203161122.1:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    
    }



}
//@nonl
//@-node:zorcanda!.20051203161122:@thin Bgprocess.java
//@-leo
