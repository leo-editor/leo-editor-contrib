//@+leo-ver=4-thin
//@+node:zorcanda!.20051121155957.1:@thin Alias.java
//@@language java
package org.leo.shell.alias;

import org.leo.shell.JythonShell;
import org.python.core.*;
import java.io.*;
import java.util.*;

public class Alias{

    String path;
    ProcessBuilder pb;
    JythonShell js;
    String name;
    String aliasname;
    public Alias( String aliasname, String commandpath, JythonShell js ){
        
        this.aliasname = aliasname;
        path = commandpath;
        pb = new ProcessBuilder();
        this.js = js;
        name = null;
    }
    
    public String getAliasName(){
    
        return aliasname;
    
    }
    
    public String getName(){
    
        if( name == null ){
            File f = new File( path );
            name = f.getName();
        }
        return name;
    }

    public Object __call__( PyObject ... args ){
    
        OutputStream stdout = js.getStandardOut();
        LinkedList<String> execute = new LinkedList<String>();
        execute.add( getName() );
        for( PyObject po: args ){
            String arg = po.toString();
            if( arg.equals( "" ) ) continue;
            execute.add( arg );
        }
        pb = pb.command( execute );
        try{
            Process p = pb.start();
            BufferedReader br = new BufferedReader( new InputStreamReader( p.getInputStream() ) );
            while( true ){
            
                String output = br.readLine();
                if( output == null ) break;
                stdout.write( output.getBytes() );
                stdout.write( "\n".getBytes() );
           
            }
        }
        catch( IOException io ){}
        catch( Exception x ){}
        return null;
    }

} 
//@-node:zorcanda!.20051121155957.1:@thin Alias.java
//@-leo
