//@+leo-ver=4-thin
//@+node:zorcanda!.20051121192758:@thin Rehashx.java
//@@language java
package org.leo.shell.magic; 

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
import java.io.File;
import java.util.*; 
import java.util.regex.Pattern;


public class Rehashx implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%rehashx"; }
    public String getDescription(){
    
        return "%rehashx: Update the alias table with all executable files in $PATH. This version explicitly checks that every entry in $PATH is a file, so it is slower than %rehash.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().equals( "%rehashx" );
    
    }


    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051121192758.1:<<command>>
        String path = System.getenv( "PATH" );
        String psep = System.getProperty( "path.separator" );
        String[] paths = path.split( Pattern.quote(psep) );
        //build up system aliases
        for( String p: paths ){
            
            File f = new File( p );
            if( f.exists() && f.isDirectory() ){
            
                    File[] files = f.listFiles();
                    for( File f2: files ){
                        if( f2.isFile() ){
                            org.leo.shell.alias.Alias alias = new org.leo.shell.alias.Alias( f2.getName(), f2.getAbsolutePath(), js );
                            js.addAlias( alias.getAliasName(), alias );
                        }
                    }
            
            }
        }
        //@nonl
        //@-node:zorcanda!.20051121192758.1:<<command>>
        //@nl
        return true;
    
    }


}
//@nonl
//@-node:zorcanda!.20051121192758:@thin Rehashx.java
//@-leo
