//@+leo-ver=4-thin
//@+node:zorcanda!.20051203212414:@thin ObjectWildCard.java
//@@language java
package org.leo.shell;

import org.python.core.PyList;
import org.python.core.PyObject;
import org.python.core.__builtin__;
import org.python.core.PyStringMap;
import org.python.core.PyType;
import org.python.core.PyString;
import org.python.core.PyDictionary;
import java.util.*;
import java.io.IOException;
import java.io.OutputStream;


public class ObjectWildCard implements LineListener, Documentation{

    JythonShell js;
    public ObjectWildCard( JythonShell js ){
    
        this.js = js;
        js.addLineListener( this );
        js.addInteractiveDocumentation( this );
    
    }
    
    public String getDocumentation(){
    
        return "Object Wildcards:\n"+
        "Typing ? followed by a reference or a chain of references, and ending in * " +
        "will show all matches that have reference names that start with the terminating token.\n"+
        "For example:\n"+
        "?a.b.ca*\n"+
        "if 'b' has these attributes canga, cata and casta then a list will be printed like so:\n"+
        "[ canga, cata, casta ]\n"+
        "This is a good and quick way to narrow in on specific reference names.\n"+
        "Additionaly if the user passes in a a type after the '*' will filter out those objects that do "+
        "not match the type passed in, an Example:\n"+
        "?a.b.c* str\n" +
        "will return only the attributes that start with c and are of type str\n";
    
    }

    public String lineToExecute( String line ){
        
        String[] lpieces = line.split( "\\s+" );
        if( lpieces.length == 0 ) return line;
        String type = null;
        if( lpieces.length > 1 ) type = lpieces[ 1 ];
        String lpiece1 = lpieces[ 0 ];
        if( lpiece1.startsWith( "?" ) && lpiece1.endsWith( "*" ) ){
            String nwline = lpiece1.substring( 1, lpiece1.length() -1 );
            String[] pieces = nwline.split( "\\." );
            String wildcard = pieces[ pieces.length -1 ];
            PyList pl= null;
            PyStringMap pm = (PyStringMap)js._pi.getLocals();
            PyDictionary pd = new PyDictionary();
            for( Object x: pm.keys() ){
                
                PyString x2 = new PyString((String)x );
                PyObject value = pm.get( x2 );
                pd.__setitem__( x2 , value );
            
            
            }
            String[] pieces2 = new String[ pieces.length -1 ];
            System.arraycopy( pieces, 0, pieces2, 0, pieces2.length );
            PyObject pybase = js.getPyObject( pieces2  );
            if( pybase != null ){
                pd = new PyDictionary();
                PyList pdir = (PyList)pybase.__dir__();
                for( Object o: pdir ){
                    try{
                        PyString s = new PyString((String)o);
                        PyObject value = __builtin__.getattr( pybase, s );
                        pd.__setitem__( s, value );
                    }
                    catch( Exception x ){ /*blasted doc attribute */}
                
                }
                
            }     
            if( pybase ==  null && pieces2.length != 0 ){
                cantResolve( line );
                return null;    
            }
            
            if( type != null )
                pl = filter( pd, type );
            else
                pl = pd.keys();
            
            
            
            PyList output = new PyList();
            for( int i = 0; i < pl.size(); i ++ ){
            
                String sform = pl.get( i ).toString();
                if( sform.startsWith( wildcard ) ) output.add( sform );
            
            }
            
            Collections.sort( output );
            try{
                
                OutputStream out = js.getStandardOut();
                out.write( output.toString().getBytes() );
                out.write( "\n".getBytes() );
                return null;
            
            }
            catch( IOException io ){}
            
        }
        return line;


    }
    
    public PyList filter( PyDictionary pm, String type ){
        
        PyList keep = new PyList();
        for( Object _key: pm.keys() ){
            PyString key = new PyString( (String)_key );            
            PyObject po = (PyObject)pm.get( key );
            PyType pt = __builtin__.type( po );
            if( pt.fastGetName().equals( type ) ) keep.insert( 0, key );
                    
        }
        return keep;        
    
    }
    
    private void cantResolve( String line ){
        try{
            OutputStream err = js.getStandardErr();
            err.write( ( "Can't find resolve " + line + ".\n" ).getBytes() );
        }
        catch( IOException io ){}        
    
    }

}
//@nonl
//@-node:zorcanda!.20051203212414:@thin ObjectWildCard.java
//@-leo
