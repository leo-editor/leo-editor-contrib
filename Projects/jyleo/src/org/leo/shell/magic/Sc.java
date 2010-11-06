//@+leo-ver=4-thin
//@+node:zorcanda!.20051119101703:@thin Sc.java
//@@language java
package org.leo.shell.magic;

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.leo.shell.util.*;
import java.io.*;
import java.util.List;
import org.python.core.PyList;

public class Sc implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%sc"; }
    public String getDescription(){
    
        return "Shell capture - execute a shell command and capture its output. %sc [options] varname=command\n will run the given command and will then update the user s interactive namespace with a variable called varname, containing the value of the call. Your command can contain shell wildcards, pipes, etc.\nThe  =  sign in the syntax is mandatory, and the variable name you supply must follow Python s standard conventions for valid names.\nOptions:\n -l: list output. Split the output on newlines into a list before assigning it to the given variable. By default the output is stored as a single string.\n -v: verbose. Print the contents of the variable.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().startsWith( "%sc" );
    
    }

    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051119101703.1:<<command>>
        String[] pieces = command.split( "\\s+", 2 );
        if( pieces.length == 2 ){
        
            String piece2 = pieces[ 1 ];
            boolean list = false;
            boolean verbose = false;
            String[] testpiece = piece2.split( "\\s+" );
            if( testpiece.length > 2 ){
                
                if( testpiece[ 0 ].equals( "-l" ) || testpiece[ 1 ].equals( "-l" ) ){
                
                    list = true;
                    piece2 = piece2.replaceFirst( "\\-l", "" );
                }
                if( testpiece[ 0 ].equals( "-v" ) || testpiece[ 1 ].equals( "-v" ) ){
                
                    verbose = true;
                    piece2 = piece2.replaceFirst( "\\-v", "" );
                }
            
            }
            final String[] pieces2 = piece2.split( "\\s*=\\s*", 2 );
            if( pieces2.length == 2 ){
                
                pieces2[ 1 ] = js.checkForJythonReference( pieces2[ 1 ] );
                List<String> slpieces = CommandLineParser.parseCommandLine( pieces2[ 1 ] );
                String[] lpieces = slpieces.toArray( new String[]{} );
                lpieces[ 0 ] = CommandFinder.findCommand( lpieces[ 0 ], js.getCurrentWorkingDirectory() );
                final ProcessBuilder pb = new ProcessBuilder( lpieces );
                pb.redirectErrorStream( true );
                pb.directory( js.getCurrentWorkingDirectory() );
                final StringBuilder sb = new StringBuilder();
                final boolean fverbose = verbose; final boolean flist = list;
                Runnable run = new Runnable(){
                
                    public void run(){
                        try{
                            Process process = pb.start();
                            InputStream is = process.getInputStream();
                            BufferedReader br = new BufferedReader( new InputStreamReader( is ) );
                            String data = null;
                            while( ( data = br.readLine() ) != null ) sb.append( data ).append( "\n" );
                    
                        } 
                        catch( IOException io ){}
                        Object stash;
                        if( flist ){
                    
                    
                            PyList pl = new PyList();
                            for( String s: sb.toString().split( "\n" ) )
                                pl.add( s ); 
                            stash = pl;
                
                        }
                        else stash = sb.toString();
        
                        js._pi.set( pieces2[ 0 ].trim(), stash );
                        if( fverbose ){
                
                            String execline = String.format( "print %1$s", pieces2[ 0 ] );
                            js.addLineToExecute( execline );
                            js.execute1( js );
                
                
                        }
                        InsertPrompt ip = new InsertPrompt( js, false );
                        js.execute1( ip );
                    }
                };
                js.execute2( run );
                
            }
            else return badFormat();
        
        }
        else return badFormat();
        //@nonl
        //@-node:zorcanda!.20051119101703.1:<<command>>
        //@nl
        return false;
    
    }
    
    public boolean badFormat(){
    
        OutputStream os = js.getStandardErr();
        try{
        
            os.write( "Bad format, no command executed\n".getBytes() );
        
        }
        catch( IOException io ){}
        return true;    
    
    }


}
//@nonl
//@-node:zorcanda!.20051119101703:@thin Sc.java
//@-leo
