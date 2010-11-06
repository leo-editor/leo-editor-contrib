//@+leo-ver=4-thin
//@+node:zorcanda!.20051202120242:@thin Pushd.java
//@@language java
package org.leo.shell.magic; 

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
import java.io.*;

public class Pushd implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%pushd"; }
    public String getDescription(){
    
        return "%pushd: Place the passed in directory on stack and change directory to it. Usage: %pushd [ dirname ] %pushd with no arguments does a %pushd to your home directory.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().equals( "%pushd" ) || command.startsWith( "%pushd " );
    
    }


    public boolean doMagicCommand( String command ){
    
        //@        <<command>>
        //@+node:zorcanda!.20051202120242.1:<<command>>
        OutputStream out = js.getStandardOut();
        OutputStream err = js.getStandardErr();
        try{
        
            String[] pieces = command.split( "\\s+" );
            if( pieces.length == 1 ){
                
                String home = System.getenv( "HOME" );
                if( home != null ){
                    File fhome = new File( home );
                    if( pushD( fhome ) ){
                    
                        return true;
                        
                    }
                    else{
                    
                        if( !fhome.exists() ) err.write( "HOME environment variable invalid\n".getBytes() );
                        else err.write( "HOME environment variable does not point to a directory\n".getBytes() );
                        return true;
                        
                    }
                }
                else{
                    
                    err.write( "HOME environment variable does not exists, can't switch to HOME\n".getBytes() );
                    return true;
                
                }
            
            }
            else if( pieces.length == 2 ){
            
                String nwdirectory = pieces[ 1 ];
                File f = new File( nwdirectory );
                if( pushD( f ) ){
                    
                    return true;
                
                }
                else{
                
                    if( !f.exists() ) err.write( (nwdirectory + " does not exist\n").getBytes() );
                    else err.write( (nwdirectory + " is not a directory.\n").getBytes() );
                    return true;
                
                }
            
            
            
            
            
            }
            else{
            
                err.write( "Command does not follow proper format\n".getBytes() );
                return true;
            
            }
        
        
        
        }
        catch( IOException io ){}
        //@nonl
        //@-node:zorcanda!.20051202120242.1:<<command>>
        //@nl
        return true;
    
    }
    
    //@    @+others
    //@+node:zorcanda!.20051202122109:pushD
    private boolean pushD( File f ){
        
        OutputStream out = js.getStandardOut();
        try{
            if( f.exists() && f.isDirectory() ){
                
                File cwd = js.getCurrentWorkingDirectory();
                if( cwd.equals( f ) ){
                    
                    out.write( "Already there!\n".getBytes() );
                    return true;
                
                
                }
                js.pushDStack( f );
                String message = "%1$s is now the Current Working Directory\n";
                out.write( String.format( message, f ).getBytes() );
                return true;
            }
            else return false;
        }
        catch( IOException io ){ return false; }
        
    }
    //@nonl
    //@-node:zorcanda!.20051202122109:pushD
    //@-others

}
//@nonl
//@-node:zorcanda!.20051202120242:@thin Pushd.java
//@-leo
