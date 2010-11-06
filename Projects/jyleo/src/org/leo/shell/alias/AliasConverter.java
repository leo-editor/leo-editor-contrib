//@+leo-ver=4-thin
//@+node:zorcanda!.20051121164532:@thin AliasConverter.java
//@@language java
package org.leo.shell.alias;

import org.leo.shell.LineListener;
import org.leo.shell.JythonShell;
import org.python.core.*;
import java.util.Map;
import java.util.regex.*;

public class AliasConverter implements LineListener{

    Map<String,Alias> aliasmap;
    Matcher match;
    JythonShell js;
    public AliasConverter( JythonShell js, Map<String,Alias> aliasmap ){
    
        this.aliasmap = aliasmap;
        match = Pattern.compile( "\\w+" ).matcher( "" );
        this.js = js;
        
    }
    
    public String lineToExecute( String line ){
        
    
        if( js.isMagicCommand( line ) ) return line;
        match.reset( line );
        if(!match.find() ) return line;
        int start = match.start();
        int end = match.end();
        String piece = line.substring( start, end );
        if( js.getPyObject( new String[]{ piece } ) != null ) return line;
        boolean ok = true;
        PySystemState pss = Py.getSystemState();
        PyStringMap psm = (PyStringMap)pss.builtins;
        if( js._pi.get( piece ) != null ) ok = false;
        else if( psm.has_key( new PyString( piece ) ) ) ok = false;
        
        if( aliasmap.containsKey( piece ) && ok ){
        
            String beginstring = line.substring( 0, start );
            String endpiece = line.substring( end );
            String[] pieces = endpiece.trim().split( "\\s+" );
            StringBuilder sb = new StringBuilder();
            for( String s: pieces ){
            
                if( ( s.startsWith( "$" ) && s.length() > 1 ) && ! s.startsWith( "$$" )) sb.append( s.substring( 1 ) ).append( ',' );
                else if( s.startsWith( "$$" ) ){
                
                    String s2 = s.replaceFirst( "\\$\\$", "" );
                    String senv = System.getenv( s2 );
                    sb.append( "'" ).append( senv ).append( "'" ).append( ',' );
                
                }
                else
                    sb.append( '"' ).append( s ).append( '"' ).append( ',' );
            
            
            }
            if( sb.charAt( sb.length() -1 ) == ',' ) sb.deleteCharAt( sb.length() -1 );
            line = String.format( "%1$s__aliasmap[ '%2$s' ]( %3$s )", beginstring, piece, sb.toString() );
        
        }
        return line;
        
        
    }

}
//@-node:zorcanda!.20051121164532:@thin AliasConverter.java
//@-leo
