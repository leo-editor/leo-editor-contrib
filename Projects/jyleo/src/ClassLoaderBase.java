//@+leo-ver=4-thin
//@+node:zorcanda!.20051107154721:@thin ClassLoaderBase.java
//@@language java
import java.io.*;
import java.util.jar.*;
import java.util.*;
import java.net.*;

public class ClassLoaderBase extends ClassLoader{

    List<JarFile> jars;
    Map<String,String> resources;
    List<String> searchpaths;
    
    public ClassLoaderBase(){
    
        jars = new ArrayList<JarFile>();
        searchpaths = new ArrayList<String>();
        resources = new HashMap<String,String>();
    
    }

    public void resolve( Class c ){
    
        resolveClass( c );
    
    }

    public Class findLoadedClass2( String name ){
    
        return findLoadedClass( name );
    
    
    }
    
    public Class getClassFromResource( String name ){
    
        List<Byte> data = new ArrayList<Byte>();
        try{
            //System.out.println( name );
            //System.out.println( resources.get( name ) );
            InputStream ins = getResourceAsStream( name );
            //System.out.println( ins );
            while( true ){
                    
                    int i = ins.read();
                    if( i == -1 ) break;
                    byte b = (byte)i;
                    data.add( b );
                
                }
                ins.close(); 
        
        
        }
        catch( IOException io ){ return null;}
        byte[] bdata = new byte[ data.size() ];
        for( int i = 0; i < bdata.length; i ++ ) bdata[ i ] = data.get( i );
        Class c = defineClass( name, bdata, 0, bdata.length );
        return c;
    
    
    }    


    public Class loadClass( String name ) throws ClassNotFoundException{
        
        //System.out.println( "LOADING:" + name );
        Class c = findLoadedClass( name );
        if( c != null ) return c;
        //System.out.println( "TRYING RESOURCE!" );
        if( resources.containsKey( name ) ){
             c = getClassFromResource( name );
             if( c != null ) return c;
        }
        //System.out.println( "TRYING JAR!" );
        c = getClassFromJar( name );
        if( c != null ) return c;
        //System.out.println( "LODING FROM SUPER!" );
        return super.loadClass( name );
    
    
    
    }
    
    public void addResource( String name, String location ){
    
        resources.put( name, location );
    
    
    }
    
    @Override
    public URL getResource( String name ){
    
        //System.out.println( "URRRLLLLLLL GETTTING RESOURCE!!!!:" + name );
        if( resources.containsKey( name ) ){
            
            File f = new File( resources.get( name ) );
            try{
                return f.toURL();
            }
            catch( MalformedURLException mue ){}
        
        }
        for( String s: searchpaths ){
        
            File f = new File( s );
            String[] children = f.list();
            for( String child: children ){
            
                if( child.equals( name ) ){
                
                    try{
                        File target = new File( f, name );
                        return target.toURL();
                    }
                    catch( MalformedURLException mue ){}
                
                }
            
            
            }
        }
        for( JarFile jf: jars ){
            
            JarEntry je = jf.getJarEntry( name );
            if( je != null ){
             //System.out.println( "A HIT!@!!!!" );
             String jurl = "jar:file:" + jf.getName() + "!/" + name;
             //System.out.println( jurl );
             try{
                return new URL( jurl );
             }
             catch( MalformedURLException mue ){  return null;}
             
             }
            
        }
        //System.out.println( "I DID NOT FIND " + name );
        URL rv = super.getResource( name );
        //System.out.println( "I DID FIND THIS: " + rv );
        return rv;
    
    }
    
    @Override
    public InputStream getResourceAsStream( String name ){
        
        if( name == null ) return null;
        //System.out.println( "GETTING RESOURCE!!!" + name );
        if( resources.containsKey( name ) ){
        
            try{
                File f = new File( resources.get( name ) );
                FileInputStream fis = new FileInputStream( f );
                return fis;
            }
            catch( FileNotFoundException fnfe ){ System.out.println( fnfe );}
        
        }
        for( String s: searchpaths ){
        
            //System.out.println( s );
            File f = new File( s );
            String[] children = f.list();
            for( String child: children ){
            
                if( child.equals( name ) ){
                
                    try{
                        File target = new File( f, name );
                        FileInputStream fis = new FileInputStream( target );
                        return fis;
                    }
                    catch( FileNotFoundException fnfe ){}
                
                }
            
            
            }
        
        
        
        }
        for( JarFile jf: jars ){
            
            JarEntry je = jf.getJarEntry( name );
            if( je != null ){
                
                try{
                    InputStream ins = jf.getInputStream( je );
                    return ins;
                }
                catch( IOException io ){}
            
            
            }
        
        
        }
        //System.out.println( "I DID NOT FIND " + name );
        return super.getResourceAsStream( name );
    
    
    }
    
    public void addSearchPath( String path ){
    
        searchpaths.add( path );
    
    
    }
    
    public Class getClassFromJar( String name ){
        

        String[] path = name.split( "\\." );
        StringBuilder sb = new StringBuilder();
        for( String s: path ){
        
            sb.append( s ).append( '/' );
        
        }

        sb.deleteCharAt( sb.length() - 1 );
        sb.append( ".class" );
        String newpath = sb.toString();
        //System.out.println( "LOOKING FOR:" + newpath );
        JarFile jf = null;
        JarEntry je = null;
        for( JarFile j: jars ){
            je = j.getJarEntry( newpath );
            if( je != null ){
            
                jf = j;
                break;
            
            
            }
        
        
        }
        if( je != null ){
            
            List<Byte> data = new ArrayList<Byte>();
            //System.out.println( "SIZE : " + je.getSize() );
            try{
                InputStream ins = jf.getInputStream( je );
                while( true ){
                    
                    int i = ins.read();
                    if( i == -1 ) break;
                    byte b = (byte)i;
                    data.add( b );
                
                }
                ins.close();
        
            }
            catch(IOException io ){}
            //System.out.println( data.size() );
            byte[] bdata = new byte[ data.size() ];
            for( int i = 0; i < bdata.length; i ++ ) bdata[ i ] = data.get( i );
            //System.out.println( "FOUND:" + newpath );
            //System.out.println( "PREPARING TO LOAD:" + name );
            if( name.startsWith( "org.xml.sax" ) ){
                //System.out.println( "RETURNING NULL!" );
                return null;
                
            }
            Class c = defineClass( name, bdata, 0, bdata.length );
            return c;
        
        }
        
        
       return null; 
    
    }
    
    public void addJar( String name ){
    
        File f = new File( name );
        if( f.exists() && !f.isDirectory() ){
            try{
                jars.add( new JarFile( f ) );
            }
            catch(IOException io ){ System.out.println( io );}
        }
    
    }


}
/*

//@<<JFreeReportClassLoader>>
//@+node:zorcanda!.20051107155109:<<JFreeReportClassLoader>>
import ClassLoaderBase
class JFreeReportClassLoader( ClassLoaderBase ):
    
    def __init__( self ):
        jlang.ClassLoader.__init__( self )
        self.jars = []
        self.loaded = {}
        
    def walkAndAdd( self, path ):
        
        import os.path
        os.path.walk( path, self.callback, path )
    
    def callback( self, arg, dirpath, namelist ):
        print arg
        print dirpath
        print namelist
        print "PATH %s " % dirpath[ len( arg ): ]
        path = dirpath[ len( arg ): ]
        if path.startswith( "/jfreereport" ):
            print "ADDING!!!"
            for z in namelist:
                if z.endswith( ".jar" ):
                    self.addJar( "%s/%s" % ( dirpath, z ) )
        
    
    def addJar( self, jarfile ):
        print jarfile
        f = io.File( jarfile )
        if f.exists() and not f.isDirectory():
            self.jars.append( jar.JarFile( f ) )
    
    def getClassFromJar( self, classname, resolve = False ):
        
        #print "RESOLVE? %s" % resolve
        if self.loaded.has_key( classname ): return self.loaded[ classname ]
        
        path = classname.split( "." )
        name =  '/'.join( path ) +".class"
        #print name
        for z in self.jars:
            #print z
            je = z.getJarEntry( name )
            if je:
                jar = z
                break
            
        if je:
            #print "JE HIT!!!"
            ins = jar.getInputStream( je )
            data = []
            while 1:
                byte = ins.read()
                if byte == -1: break
                data.append( jlang.Integer( byte ).byteValue() )
            import jarray
            bdata = jarray.array( data, 'b' )
            print "Defining %s" % classname
            clazz = self.defineClass(  classname, bdata, 0, len( bdata ) )
            #print "PAST DEFINE!"
            self.loaded[ classname ] = clazz
            if resolve:
                #print "RESOLVING!"
                self.resolveClass( clazz )
            print "Returning %s " % clazz 
            return clazz
        return None
    
    def resolveClass( self, clazz ):
        self.super__resolveClass( clazz )
    
    def defineClass( self, *args ):
        return self.super__defineClass( *args )   
        
    def loadClass( self, *name ):
        
        #print name
        clazz = self.findLoadedClass2( name[ 0 ] )
        if clazz: return clazz
        if self.loaded.has_key( name[ 0 ] ): return self.loaded[ name[ 0 ] ]
        clazz = self.getClassFromJar( *name )
        #print "CLASSSS!!! %s" % clazz
        if clazz:
            self.loaded[ name[ 0 ] ] = clazz 
            return clazz
        else:
            #print "DOING A SUPER CALL! %s" % name[ 0 ]
            return self.super__loadClass( *name )
            

//@-node:zorcanda!.20051107155109:<<JFreeReportClassLoader>>
//@nl
*/
//@-node:zorcanda!.20051107154721:@thin ClassLoaderBase.java
//@-leo
