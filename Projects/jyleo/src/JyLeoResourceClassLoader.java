//@+leo-ver=4-thin
//@+node:zorcanda!.20051107094913:@thin JyLeoResourceClassLoader.java
//@@language java
import java.io.*;
import java.util.*;
import java.net.MalformedURLException;
import java.net.URL;

public class JyLeoResourceClassLoader extends ClassLoader{

    File rdirectory;
    File fclassdirectory;
    
    String fakeclassname = "FakeClass";
    Class fakeclass;

    static class FakeClass{}
    
    
    public JyLeoResourceClassLoader( File rdirectory, File fclassdirectory ){
    
        this.rdirectory = rdirectory;
        this.fclassdirectory = fclassdirectory;
    
    }
    
    public URL getResource( String name ){
    
        File f = new File( rdirectory, name );
        if( f.exists() ){
        
            try{
                return f.toURL();
            }
            catch( MalformedURLException mur ){}
         
        
        }
        return super.getResource( name );
    
    
    }
    
    public InputStream getResourceAsStream( String name ){
    
    
        File f = new File( rdirectory, name );
        if( f.exists() ){
        
            try{
            
                FileInputStream fis = new FileInputStream( f );
                return fis;
            
            }
            catch( FileNotFoundException fnfe ){}
        
        
        }
    
        return super.getResourceAsStream( name );
    
    }

    public Class getFakeClass(){
    
        File fclass = new File( fclassdirectory, "FakeClass.class" );
        List<Byte> data = new ArrayList<Byte>();
        try{
        
            FileInputStream fis = new FileInputStream( fclass );
            byte d = (byte)fis.read();
            while( d != -1 ){
        
                data.add( d );
                d = (byte)fis.read();
        
        
            }
        }
        catch( FileNotFoundException fnfe ){}
        catch( IOException io ){}
        byte[] b =  new byte[ data.size() ];
        for( int i = 0; i < data.size(); i++ ){
        
            b[ i ] = data.get( i );
        
        }
        fakeclass = defineClass( fakeclassname, b, 0, b.length );
        resolveClass( fakeclass );
        return fakeclass;
    
    }



}
//@nonl
//@-node:zorcanda!.20051107094913:@thin JyLeoResourceClassLoader.java
//@-leo
