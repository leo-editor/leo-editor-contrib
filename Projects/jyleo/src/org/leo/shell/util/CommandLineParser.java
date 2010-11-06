//@+leo-ver=4-thin
//@+node:zorcanda!.20051122113356:@thin CommandLineParser.java
//@@language java
package org.leo.shell.util;
import java.util.*;

public class CommandLineParser{


    public static List<String> parseCommandLine( String line ){
    
        List<String> args = new LinkedList<String>();
        boolean stringing = false;
        char schar = '\'';
        StringBuilder sb = new StringBuilder();
        for( char c: line.toCharArray() ){
            if( stringing ){
            
                sb.append( c );
                if( c == schar ){
                
                    stringing = false;
                    if( sb.length() > 2 ){
                    
                        sb.deleteCharAt( 0 );
                        sb.deleteCharAt( sb.length() -1 );
                    
                    }
                    args.add( sb.toString() );                
                    sb = new StringBuilder();
                    
                } 
                continue;
            
            }
            if( Character.isWhitespace( c ) ){
            
                if( sb.length() != 0 ){
                
                    args.add( sb.toString() );
                    sb = new StringBuilder();
                    continue;
                
                }
            
            }
            sb.append( c );
            if( c == '"' || c == '\'' ){
             schar = c;
             stringing = true;
            }
        }
        if( sb.length() > 0 ) args.add( sb.toString() );    
        return args;
    
    
    }



}
//@nonl
//@-node:zorcanda!.20051122113356:@thin CommandLineParser.java
//@-leo
