//@+leo-ver=4-thin
//@+node:zorcanda!.20051121190424:@thin Alias.java
//@@language java
package org.leo.shell.magic; 

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.leo.shell.util.CommandFinder;
import java.io.*;
import java.util.*;
import java.util.regex.Pattern;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import javax.swing.text.*;
import javax.swing.*;

public class Alias implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%alias"; }
    public String getDescription(){
    
        return "%alias: Define an alias for a system command.\n"+
               "%alias alias name cmd  defines  alias name  as an alias for  cmd  Then, typing  alias name params  will execute the system command  cmd params  (from your underlying operating system).\n"+
               "Aliases have lower precedence than magic functions and Python normal variables, so if  foo  is both a Python variable and an alias, the alias can not be executed until  del foo  removes the Python variable.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().startsWith( "%alias" ) || command.trim().equals( "%alias" );
    
    }


    public boolean doMagicCommand( String command ){
    
        OutputStream out = js.getStandardOut();
        OutputStream err = js.getStandardErr();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051121190424.1:<<command>>
            
            String[] args = command.split( "\\s+", 2 );
            if( args.length == 1 ){
                
                String format = "%1$-20s %2$s\n";
                StringBuilder sb = new StringBuilder();
                sb.append( String.format( format, "Alias", "System Command" ) );
                char[] c = new char[ sb.length() - 1 ];
                Arrays.fill( c, '-' );
                sb.append( c ).append( "\n" );
                Iterator<org.leo.shell.alias.Alias> aliases = js.getAliases();
                while( aliases.hasNext() ){
                    org.leo.shell.alias.Alias alias = aliases.next();
                    sb.append( String.format( format, alias.getAliasName(), alias.getName() ) );
                
                }
                sb.append( c ).append( "\n" );
                out.write( sb.toString().getBytes() );
            
            }
            else if( args.length == 2 ){
            
                String[] pieces2 = args[ 1 ].split( "\\s+", 2 );
                boolean created = false;
                if( pieces2.length == 2 ){
                
                    String aliasname = pieces2[ 0 ];
                    String[] cpieces = pieces2[ 1 ].split( "\\s+", 2 );
                    String targetcommand = cpieces[ 0 ];
                    String path = CommandFinder.findCommand( targetcommand, js.getCurrentWorkingDirectory() );
                    if( path != null ){
                        
                        File cfile = new File( path );
                        if( cfile.exists() && cfile.isFile() ){
                            org.leo.shell.alias.Alias alias = new org.leo.shell.alias.Alias( aliasname, cfile.getAbsolutePath(), js );
                            js.addAlias( aliasname, alias ); 
                            created = true;
                            
                        }
                        
                        
                    }
                      
            
                }
                
                if( created ) out.write( "Alias created.\n".getBytes() );
                else out.write( "Could not create alias.\n".getBytes() );
            }
            //@nonl
            //@-node:zorcanda!.20051121190424.1:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    
    }


}
//@nonl
//@-node:zorcanda!.20051121190424:@thin Alias.java
//@-leo
