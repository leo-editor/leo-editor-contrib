//@+leo-ver=4-thin
//@+node:zorcanda!.20051129115446:@thin CommandFinder.java
//@@language java
package org.leo.shell.util;

import java.io.File;
import java.util.regex.Pattern;

public class CommandFinder{


    public static String findCommand( String command, File cwd ){
        
        
        File firsttest = new File( cwd, command );
        if( firsttest.exists() && firsttest.isFile() ) return firsttest.getAbsolutePath();
        File secondtest = new File( command );
        if( secondtest.exists() && secondtest.isFile() ) return secondtest.getAbsolutePath();
        String path = System.getenv( "PATH" );
        String[] paths = path.split( Pattern.quote( System.getProperty( "path.separator" ) ) );
        String cmdpath = null;
        breakhere:
        for( String apath: paths ){
        
            File f = new File( apath, command );
            if( f.exists() && f.isFile()){
            
                cmdpath = f.getAbsolutePath();
                break breakhere;
            
            }       
        
        }    
        
        return cmdpath;
    
    }



}
//@nonl
//@-node:zorcanda!.20051129115446:@thin CommandFinder.java
//@-leo
