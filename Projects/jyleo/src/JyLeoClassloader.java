//@+leo-ver=4-thin
//@+node:zorcanda!.20051106192717:@thin JyLeoClassloader.java
//@@language java
import java.util.*;
import java.util.jar.*;
import java.io.*;



public class JyLeoClassloader extends ClassLoader{

    Map<String,String> resources;

    public JyLeoClassloader(){
    
        super();
        resources = new HashMap<String,String>();
    
    }
    
    public void addJar( String name ){
    
        try{
            JarFile jf = new JarFile( name );
            Enumeration<JarEntry> contents = jf.entries();
            while( contents.hasMoreElements() ){
        
                JarEntry je = contents.nextElement();
                resources.put( je.getName(), name );
        
        
            }
        }
        catch( IOException io ){}
    
    }

    public void addResource( String name, String location ){
    
        resources.put( name, location );
       
    
    }


    public InputStream getResourceAsStream( String name ){
    
        if( resources.containsKey( name ) ){
        
            String resourcepath = resources.get( name );
            if( resourcepath.endsWith( ".jar" ) ){
            
                try{
                    File f = new File( resourcepath );
                    JarFile jf = new JarFile( f );
                    JarEntry je = jf.getJarEntry( name );
                    return jf.getInputStream( je );
                }
                catch( Exception x ){}
                 byte[] b = new byte[ 0 ];
                return new ByteArrayInputStream( b );
            
            }
            else{
            
                try{
                
                    FileInputStream fis = new FileInputStream( resourcepath );
                    return fis;
                }
                catch( FileNotFoundException fnfe ){}
                catch( IOException io ){}
                
                byte[] b = new byte[ 0 ];
                return new ByteArrayInputStream( b );
            
            
            
            
            }
        
        }
        else return super.getResourceAsStream( name );
    
    
    }

    public byte[] getResourceAsByteArray( String name ){
    
        InputStream is = getResourceAsStream( name );
        List<Byte> data = new ArrayList<Byte>();
        try{
            byte d = (byte)is.read();
            while( d != -1 ){
        
                data.add( d );
                d = (byte)is.read();
        
        
            }
        }
        catch( IOException io ){}
        byte[] b =  new byte[ data.size() ];
        System.arraycopy( data.toArray( new Byte[]{} ), 0, b, 0, b.length );
        return b;
    }

    public Class loadClass( final String name ) throws ClassNotFoundException{
    
        String[] testname = name.split( "." );
        StringBuilder sb = new StringBuilder();
        for( int i = 0; i < testname.length - 1; i ++ ){
        
            sb.append( testname[ i ] );
            if( i != testname.length - 1 ) sb.append( '.' );
        
        
        }
        String newname = sb.toString();
        
        if( resources.containsKey( newname ) ){
            
            byte[] data = getResourceAsByteArray( newname );
            Class c = defineClass( name, data, 0, data.length );
            resolveClass( c );
            return c;
        
        }

        return super.loadClass( name );    
    
    }



}
//@nonl
//@-node:zorcanda!.20051106192717:@thin JyLeoClassloader.java
//@-leo
