//@+leo-ver=4-thin
//@+node:zorcanda!.20051121192619:@thin Rehash.java
//@@language java
package org.leo.shell.magic; 

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
import java.io.File;
import java.util.*; 
import java.util.regex.Pattern;


public class Rehash implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%rehash"; }
    public String getDescription(){
    
        return "%rehash: Update the alias table with all entries in $PATH. This version does no checks on execute permissions or whether the contents of $PATH are truly files (instead of directories or something else).\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().equals( "%rehash" );
    
    }


    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051121192619.1:<<command>>
        String path = System.getenv( "PATH" );
        String psep = System.getProperty( "path.separator" );
        String[] paths = path.split( Pattern.quote(psep) );
        //build up system aliases
        for( String p: paths ){
            
            File f = new File( p );
            if( f.exists() && f.isDirectory() ){
            
                    File[] files = f.listFiles();
                    for( File f2: files ){
                
                        org.leo.shell.alias.Alias alias = new org.leo.shell.alias.Alias( f2.getName(), f2.getAbsolutePath(), js );
                        js.addAlias( alias.getAliasName(), alias );
                        
                    }
            
            }
        }
        //@nonl
        //@-node:zorcanda!.20051121192619.1:<<command>>
        //@nl
        return true;
    
    }


}
//@nonl
//@-node:zorcanda!.20051121192619:@thin Rehash.java
//@-leo
