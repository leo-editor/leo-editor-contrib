//@+leo-ver=4-thin
//@+node:zorcanda!.20051114230839:@thin Url.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import javax.swing.text.*;
import java.nio.*;
import java.io.*;
import org.python.util.*;
import java.net.*;
import java.util.*;
import java.util.concurrent.*;

public class Url implements MagicCommand{

    JythonShell js;
    ExecutorService executor;
    public Url(){
    
        executor = Executors.newCachedThreadPool();
    
    }
    
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%url"; }
    public String getDescription(){
    
        return "%url --> loads data from a url into a reference.\n" + 
                "Usage:\n"+
                "%url ref http://python.org\n" + 
                "This will take the data at 'http://python.org' and place it in ref\n\n";
    
    } 

    public boolean handle( String command ){
    
        return (command.startsWith( "%url " ) );
    
    }

    public boolean doMagicCommand( String command ){
    
        OutputStream err = js.getStandardErr();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051114231039:<<command>>
            String[] parts = command.split( "\\s+" );
            if( parts.length != 3 ) err.write( "Bad %url form, needs 2 parameters".getBytes() );
            else{
                Downloader download = new Downloader( parts[ 2 ], parts[ 1 ], js._pi );
                executor.submit( download );
            }
            //@nonl
            //@-node:zorcanda!.20051114231039:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    }

    public static class Downloader implements Runnable{
    
        PythonInterpreter pi;
        String reference;
        String url;
        public Downloader( String url, String reference, PythonInterpreter pi ){
        
            this.url = url;
            this.reference = reference;
            this.pi = pi;
            pi.set( reference, "Not finished loading...." );
        
        
        }
    
        public void run(){
    
            try{    
                
                URL location = new URL( url );
                InputStream ins = location.openStream();
                long total = 0l;
                byte[] data = new byte[ 1024 ];
                ArrayList<byte[]> barrays = new ArrayList<byte[]>();
                while( true ){
                
                    int amount = ins.read( data );
                    if( amount == -1 ) break;
                    total += amount;
                    byte[] data2 = new byte[ amount ];
                    System.arraycopy( data, 0, data2, 0, data2.length );
                    barrays.add( data2 );
                
                }
                ByteBuffer bb = ByteBuffer.allocate( (int)total );
                for( byte[] ba: barrays ) bb.put( ba );
                bb.position( 0 );                
                pi.set( reference, bb );
    
            }
            catch( MalformedURLException mue ){
                
                pi.set( reference, mue );
                
                
            }
            catch( IOException io ){
            
                pi.set( reference, io );
            
            }
        
        }
    
    
    
    }

}
//@nonl
//@-node:zorcanda!.20051114230839:@thin Url.java
//@-leo
