//@+leo-ver=4-thin
//@+node:zorcanda!.20051119001951:@thin Autoquoter.java
//@@language java
package org.leo.shell;
import java.util.regex.*;


public class Autoquoter implements LineListener, Documentation{

    JythonShell js;
    Matcher wsp;
    Matcher pp;
    Matcher transformer;
    public Autoquoter( JythonShell js ){
    
        this.js = js;
        js.addLineListener( this );
        wsp = Pattern.compile( "\\s+" ).matcher( "" );
        pp = Pattern.compile( "\\w+\\(" ).matcher( "" );
    		transformer = Pattern.compile( "(\\w+)+" ).matcher( "" );
        js.addInteractiveDocumentation( this );
    }
    
    public String getDocumentation(){
    
        return "Autoquoting:\n"+
        "Starting an input line with a , will automatically quote "+
        "the parameters passed into a function. An example:\n"+
        "In [0]: ,print a b c\n"+
        "--> print \"a\", \"b\", \"c\"\n"+
        "a b c\n";
    
    
    }

    public String lineToExecute( String line ){
    
        if( line.startsWith( "," ) ){
        
            String line2 = line.substring( 1 );
            wsp.reset( line2 );
            boolean wsm = wsp.find();
            int i1;
            if( wsm ) i1 = wsp.start();
            else i1 = -1;
            pp.reset( line2 );
            boolean pm = pp.find();
            int i2;
            if( pm ) i2 = pp.end();
            else i2 = -1;
                      
            if( i1 != -1 || i2 != -1 ){
            
                String[] pieces;
                if( ( i1 < i2 && i1 != -1 ) || i2 == -1 )
                    pieces = line2.split( "\\s+", 2 );
	            else
                    pieces = line2.split( "\\(", 2 );
                
                if( pieces.length == 2 ){
                
                    String piece1 = pieces[ 0 ];
                    String piece2 = pieces[ 1 ].trim();
                    if( piece2.endsWith( ")" ) ){
                        piece2 = piece2.replaceFirst( "\\s*\\)$", "" );
                        transformer.reset( piece2 );
                        piece2 = transformer.replaceAll( "\"$0\"," );
                        if( piece2.endsWith( "," ) ) piece2 = piece2.substring( 0, piece2.length() -1 );
                        line = String.format( "%1$s( %2$s )", piece1, piece2 );
                    
                    }
                    else{
                        transformer.reset( piece2 );
                        piece2 = transformer.replaceAll( "\"$0\"," ); 
                        if( piece2.endsWith( "," ) ) piece2 = piece2.substring( 0, piece2.length() -1 );
                        line = String.format( "%1$s %2$s", piece1, piece2 );
                        
                    }
                
                
                }
            
            
            }
        
        
        }
        return line;    
    
    
    }

}
//@nonl
//@-node:zorcanda!.20051119001951:@thin Autoquoter.java
//@-leo
