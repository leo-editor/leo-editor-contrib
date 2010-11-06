//@+leo-ver=4-thin
//@+node:zorcanda!.20051201145516:@thin Bookmark.java
//@@language java
package org.leo.shell.magic; 

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
//import org.python.core.*;
import java.io.*;
import java.util.*; 
//import java.util.regex.Pattern; 
//import javax.swing.SwingUtilities;


public class Bookmark implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%bookmark"; }
    public String getDescription(){
    
        return "%bookmark <name> - set bookmark to current dir %bookmark <name> <dir> - set bookmark to <dir> %bookmark -l - list all bookmarks %bookmark -d <name> - remove bookmark %bookmark -r - remove all bookmarks You can later on access a bookmarked folder with: %cd -b <name> or simply  %cd <name>  if there is no directory called <name> AND there is such a bookmark defined.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().startsWith( "%bookmark " );
    
    }


    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051201145516.1:<<command>>
        
        String[] args = command.split( "\\s+" );
        OutputStream out = js.getStandardOut();
        OutputStream err = js.getStandardErr();
        try{
            if( args.length > 1 ){
        
                if( args.length == 2 ){
            
                    if( args[ 1 ].equals( "-l" )){
                
                        Iterator<Map.Entry<String,File>> bmarks = js.getBookmarks();
                        String format = "%1$s : %2$s\n";
                        StringBuilder sb = new StringBuilder();
                        sb.append( "Bookmarks:\n" );
                        while( bmarks.hasNext() ){
                    
                            Map.Entry<String,File> bm = bmarks.next();
                            String sfbmark = String.format( format, bm.getKey(), bm.getValue() );
                            sb.append( sfbmark );
                    
                        }
                        out.write( sb.toString().getBytes() );
        
                
                    }
                    else if( args[ 1 ].equals( "-r" ) ){
                
                        js.clearBookmarks();
                        out.write( "Bookmarks have been cleared.\n".getBytes() );
                
                    }
                    else{
                
                        File cwd = js.getCurrentWorkingDirectory();
                        js.addBookmark( args[ 1 ], cwd );
                        String message = String.format( "Bookmark %1$s has been added.\n", args[ 1 ] );
                        out.write( message.getBytes() );
            
                    }
            
                }
                else if( args.length == 3 ){
            
                    String arg1 = args[ 1 ];
                    String arg2 = args[ 2 ];
                    if( arg1.equals( "-d" ) ){
                    
                        js.removeBookmark( arg2 );
                        String message = String.format( "Bookmark %1$s has been removed.\n", arg2 );
                        out.write( message.getBytes() );
                
                    }
                    else{
                
                        File f = new File( arg2 );
                        if( f.exists() && f.isDirectory() ){
                    
                            js.addBookmark( arg1, f );
                            String message = String.format( "Bookmark %1$s has been added\n", arg1 );
                            out.write( message.getBytes() );
        
                        }
                        else{
                    
                            if( !f.exists() ){
                            
                                String message = String.format( "Directory %1$s does not exist.\n", arg2 );
                                err.write( message.getBytes() );
                            
                            
                            }
                            else{
                                
                               String message = String.format( "%1$s is not a directory.\n", arg2 );
                               err.write( message.getBytes() ); 
                                
                            
                            }
                             
                    
                    }
                
                }
            
            
            
            }
        
        
        
            }
            else err.write( "%bookmark requires arguments, none given.\n".getBytes() );
            
        }
        catch( IOException io ){}//we do this like this, because there are soo many times it can happen!!!
        //@nonl
        //@-node:zorcanda!.20051201145516.1:<<command>>
        //@nl
        return true;
    
    }
    
    //@    @+others
    //@-others

}
//@nonl
//@-node:zorcanda!.20051201145516:@thin Bookmark.java
//@-leo
