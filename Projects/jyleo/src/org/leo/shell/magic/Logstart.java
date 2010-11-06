//@+leo-ver=4-thin
//@+node:zorcanda!.20051203130354:@thin Logstart.java
//@@language java
package org.leo.shell.magic; 

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
import org.python.core.PyList;
import java.io.*;
import java.nio.channels.*;
import java.util.*;

public class Logstart implements MagicCommand{

    JythonShell js;
    
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%logstart"; }
    public String getDescription(){
    
        return "%logstart: Start logging anywhere in a session. %logstart [log name [log mode]] If no name is given, it defaults to a file named  jythonshell.log  in your current directory, in  rotate  mode (see below).  %logstart name  saves to file  name  in  backup  mode. It saves your history up to that point and then continues logging. %logstart takes a second optional parameter: logging mode. This can be one of (note that the modes are given unquoted): over: overwrite existing log. backup: rename (if exists) to name and start name. append: well, that says it. rotate: create rotating logs name.1 , name.2 , etc.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.startsWith( "%logstart " ) || command.trim().equals( "%logstart" );
    
    }


    public boolean doMagicCommand( String command ){
        
        OutputStream out = js.getStandardOut();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051203130458:<<command>>
            String[] pieces = command.split( "\\s+" );
            File log;
            final String nwlog;
            List<String> options = new ArrayList<String>( 4 );
            String[] soptions = new String[]{ "over", "backup", "append", "rotate" };
            Collections.addAll( options, soptions );
            String option = "backup";
            if( pieces.length >= 2 && !options.contains( pieces[ 1 ] ) ){
            
                File cwd = js.getCurrentWorkingDirectory();
                nwlog = pieces[ 1 ];
                log = new File( cwd, nwlog );
                if( pieces.length == 3 && options.contains( pieces[ 2 ] ) ) option = pieces[ 2 ];
            
            }
            else{
                
                File directory = js.getCurrentWorkingDirectory();
                log = new File( directory, "jythonshell.log" );
                nwlog = "jythonshell.log";
                if( pieces.length == 2 && options.contains( pieces[ 1 ] ) ) option = pieces[ 1 ];
                
            }
            
            if( option.equals( "backup" ) ){
                
                String absolutepath = log.getAbsolutePath();
                File rnfile = new File( log.getAbsolutePath() + "~" );
                if( log.exists() && log.isFile() ) log.renameTo( rnfile );
                log = new File( absolutepath );
            
            
            }
            else if ( option.equals( "over" ) ){
            
                if( log.exists() && log.isFile() ) log.delete();
            
            }
            else if ( option.equals( "rotate" ) && log.exists() && log.isFile() ){
            
                 File parent = log.getParentFile();
                	File[] files = parent.listFiles( new RotateFilter( log.getName() ) );
                 int number = 0;
                 for( File f: files ){
                 
                    String name = f.getName();
                    if( name.endsWith( "~" ) ){
                    
                        name = name.substring( 0, name.length() -1 );
                        String[] npieces = name.split( "\\." );
                        String pnum = npieces[ npieces.length -1 ];
                        try{
                        
                            int i = Integer.valueOf( pnum );
                            if( i > number ) number = i;
                        
                        }
                        catch( NumberFormatException nfe ){}
                    
                    }
                 
                 }
                 String absolutepath = log.getAbsolutePath();
                 String rotatename = "%1$s.%2$d~";
                 rotatename = String.format( rotatename, absolutepath, ++number );
                 File changeTo = new File( rotatename );
                 log.renameTo( changeTo );
                 log = new File( absolutepath );
            
            
            }
            
            
            final OutputStream os;
            if( option.equals( "append" ) ){
                
                RandomAccessFile raf = new RandomAccessFile( log, "rw" );
                FileChannel fc = raf.getChannel();
                fc.position( log.length() );
                os = Channels.newOutputStream( fc );
            
            }
            else os = new FileOutputStream( log );
            
            Logcore.logstreams.put( nwlog, os );
            js.addLogger( os );
            Logcore.logging = true;
            
            PyList history = js.history;
            for( int i = 0; i < history.size(); i++ ){
                
                os.write( history.get( i ).toString().getBytes() );
                os.write( "\n".getBytes() );
                
            }
            out.write( ("Logging has started, log is located at: " + log.getAbsolutePath() + "\n" ).getBytes() );
            
            
            //@-node:zorcanda!.20051203130458:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    
    }
    
    //@    @+others
    //@+node:zorcanda!.20051203144641:static class RotateFilter
    public static class RotateFilter implements FilenameFilter{
    
        String prefix;
        public RotateFilter( String prefix ){
        
            this.prefix = prefix;
        
        }
        
        public boolean accept( File parent, String name ){
        
            if( name.startsWith( prefix ) ) return true;
            return false;
        
        }
    
    }
    //@nonl
    //@-node:zorcanda!.20051203144641:static class RotateFilter
    //@-others

}
//@nonl
//@-node:zorcanda!.20051203130354:@thin Logstart.java
//@-leo
