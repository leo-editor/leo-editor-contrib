//@+leo-ver=4-thin
//@+node:zorcanda!.20051114115012:@thin Cd.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import java.io.*;

public class Cd implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%cd"; }
    public String getDescription(){
    
        return "%cd  - this will change the Jython Shells current working directory\n"+ 
    ".. signifies going to the parent, and absolute path will change the\n"+
    "directory to the path and a relative path will change to the path\n\n"; 
    
    } 

    public boolean handle( String command ){
    
        return command.startsWith( "%cd " ); 
    
    }

    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051114115012.1:<<command>>
        
            OutputStream out = js.getStandardOut();
            OutputStream err = js.getStandardErr();
            try{
            
                final String[] tokens = command.split( "\\s+" );
                if( tokens.length < 2 ){
                    
                    //doc.insertString( pos, "%cd requires a directory to operate\n", null );
                    err.write( "%cd requires a directory or bookmark to operate\n".getBytes() );
                    
                    
                }
                else{
                
                    final String path = tokens[ 1 ];
                    File cwd = js.getCurrentWorkingDirectory();
                    if( path.equals( ".." ) ){
                        cwd = cwd.getParentFile();
                        js.setCurrentWorkingDirectory( cwd );
                        
                        }
                    else if( path.equals( "-b" ) ){
                    
                        if( tokens.length == 3 ){
                        
                            String bmstring = tokens[ 2 ];
                            File bmark = js.getBookmark( bmstring );
                            if( bmark.exists() && bmark.isDirectory() ){
                            
                                cwd = bmark;
                                js.setCurrentWorkingDirectory( bmark );
                            
                            }
                            else{
                            
                                if( !bmark.exists() ) err.write( "Bookmark's directory does not exist.\n".getBytes() );
                                else err.write( "Bookmark is not a directory\n".getBytes() );
                                return true;
                            
                            }
                        
                        
                        }
                        else{
                            
                            err.write( "-b switch requires a bookmark name.\n".getBytes() );
                            return true;
                        
                        }
                    
                    }
                    else if( path.matches( "\\-\\d+" ) ){
                    
                        String digits = path.substring( 1 );
                        int histnum = Integer.valueOf( digits );
                        String directory = js.getDirectoryHistryEntryN( histnum );
                        if( directory != null ){
                        
                            File f = new File( directory );
                            if( f.exists() && f.isDirectory() ){
                            
                                js.setCurrentWorkingDirectory( f );
                                cwd = f;
                            
                            
                            }
                            else{
                            
                                err.write( "The requested directory does not exist in history.\n".getBytes() );
                                return true;
                            
                            }
                        
                        
                        
                        }
                        else{
                        
                            err.write( "The requested directory does not exist in history.\n".getBytes() );
                            return true;
                        
                        }
                    
                    
                    }
                    else if ( path.equals( "-:" ) ){
                    
                        String directory = js.getDirectoryHistryEntryN( -1 );
                        if( directory != null ){
                        
                            File f = new File( directory );
                            if( f.exists() && f.isDirectory() ){
                            
                                js.setCurrentWorkingDirectory( f );
                                cwd = f;
                            
                            
                            }
                            else{
                            
                                err.write( "The requested directory does not exist in history.\n".getBytes() );
                                return true;
                            
                            }
                        }
                    
                    
                    }
                    else{
                        
                        final File ndir;
                        if( path.startsWith( "/" ) )
                            ndir = new File( path );
                        else
                            ndir = new File( cwd, path );
                            
                        if( ndir.exists() && ndir.isDirectory() ){
                            js.setCurrentWorkingDirectory( ndir );
                            cwd = ndir;
                            
                            }
                        else{
                            
                            File bmark = js.getBookmark( path );
                            if( bmark != null ){
                            
                                js.setCurrentWorkingDirectory( bmark );
                                cwd = bmark;
                            
                            }
                            else{
                                //doc.insertString( pos, ndir.getAbsolutePath() + " not valid directory\n", null );
                                err.write( (ndir.getAbsolutePath() + " not valid directory\n").getBytes() );
                                return true; 
                            }
                                
                        }
                    }
                    
                    //doc.insertString( pos, "CWD is now: " + cwd.getAbsolutePath() + "\n" , null );
                    out.write( ("CWD is now: " + cwd.getAbsolutePath() + "\n").getBytes() );
        
                }
            }
            //catch( final BadLocationException ble ){
            //    ble.printStackTrace();
                //visualException( ble.toString() );
        
            //}
            catch( IOException io ){}
        
        //@-node:zorcanda!.20051114115012.1:<<command>>
        //@nl
        return true;
    
    }



}
//@nonl
//@-node:zorcanda!.20051114115012:@thin Cd.java
//@-leo
