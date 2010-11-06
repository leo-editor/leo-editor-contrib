//@+leo-ver=4-thin
//@+node:zorcanda!.20051122223726:@thin DorkClassLoader.java
//@@language java
package org.leo.shell;
import java.io.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;

public class DorkClassLoader extends ClassLoader{


    int i;
    Map< String , Class > haveseen;
    public DorkClassLoader(){
    
        haveseen = new HashMap<String, Class>();
    
    }
    
    public DorkClassLoader( ClassLoader parent ){
    
        super( parent );
        haveseen = new HashMap<String, Class>();
    
    }

    public Class loadClass( final String name ) throws ClassNotFoundException{
        
        if( !name.startsWith( "org.leo" ) ) return super.loadClass( name );
        System.out.println( name );
        String newname = name.replaceAll( "\\.", "/" );
        newname += ".class";
        System.out.println( newname );
        InputStream is = getResourceAsStream( newname );
        List<Byte> bytes = new ArrayList<Byte>();
        try{
            while( true ){
        
                int i = is.read();
                if( i == -1 ) break;
                bytes.add( (byte)i );
        
        
            }
        }
        catch(IOException io ){}
        byte[] barray = new byte[ bytes.size() ];
        for( int i = 0; i< barray.length; i ++ )
            barray[ i ] = bytes.get( i );
  
        if( haveseen.containsKey( name ) ){
        
            DorkClassLoader dcl = new DorkClassLoader( this );
            return dcl.loadClass( name );        
        
        }      
        Class c;
        c = defineClass( name , barray, 0, barray.length );
        haveseen.put( name, c );
  
        resolveClass( c );
        return c;
    }

}
//@nonl
//@-node:zorcanda!.20051122223726:@thin DorkClassLoader.java
//@-leo
