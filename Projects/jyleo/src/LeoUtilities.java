//@+leo-ver=4-thin
//@+node:zorcanda!.20050609162345:@thin LeoUtilities.java
//@@language java

import java.util.regex.*;
import java.util.Vector;
import java.util.Iterator;
import javax.swing.text.*;

public final class LeoUtilities{


    static final Pattern language = Pattern.compile( "^@language\\s+(\\w+)" );
    static final Matcher language_matcher = language.matcher( "" );
    static final Pattern auto = Pattern.compile( "(\\w+)\\.(\\w+)" );
    static final Matcher auto_matcher = auto.matcher( "" );

    //@    @+others
    //@+node:zorcanda!.20050609162345.1:scanForLanguage
    public final static String scanForLanguage( final PositionSpecification ps ){
    
        final Iterator<PositionSpecification> it =  ps.getSelfAndParentsIterator();
        while( it.hasNext()){
        
            final PositionSpecification ps2 = it.next();
            final StringBuilder body = ps2.getTnodeBodyText()._body;
            language_matcher.reset( body );
            if( language_matcher.find() )
                return language_matcher.group( 1 );
        
        
        }
    
        return "python";
        
    
    }
    //@nonl
    //@-node:zorcanda!.20050609162345.1:scanForLanguage
    //@+node:zorcanda!.20050615132419:scanForLanguageOnLine
    public final static String scanForLanguageOnLine( final JTextComponent jtc ){
    
    
        try{
        
            if( ! jtc.isShowing() ) return null;
            final int cp = jtc.getCaretPosition();
            if( cp < 0 ) return null;
            final AbstractDocument doc = (AbstractDocument)jtc.getDocument();
            //final int start  = Utilities.getRowStart( jtc, cp );
            //final int end = Utilities.getRowEnd( jtc, cp );
            Element e = doc.getParagraphElement( cp );
            final int start = e.getStartOffset();
            final int end = e.getEndOffset();
            if( start == end ) return null;
            final String txt = doc.getText( start, end - start );
            if( txt.length() == 0 ) return null;
            if( txt.charAt( 0 ) != '@' ) return null;
            if( !txt.startsWith( "@language" ) ) return null;
            final String scantext = txt.substring( 9 ).trim();
            final char[] ca = scantext.toCharArray();
            final StringBuilder sb = new StringBuilder( ca.length );
            for( final char c: ca ){
            
                if( Character.isWhitespace( c ) ) break;
                sb.append( c );
            
            }
            
            return sb.toString();
            
        
        }
        catch( Exception ble ){}
        return null;
    
    
    
    }
    //@nonl
    //@-node:zorcanda!.20050615132419:scanForLanguageOnLine
    //@+node:zorcanda!.20050612231615:scanFor
    public final static Vector<String[]> scanFor( final Matcher[] matchers, final TnodeBodyText tnt ){
    
        Vector<String[]> found = new Vector< String[] >();
        
        final StringBuilder sb = tnt._body;
        for( Matcher m : matchers ){
        
            m.reset( sb );
            while( m.find()){
            
                String[] f = new String[]{ m.group( 0 ), m.group( 1 ) };
                found.add( f );
            
            
            }
                
        
        
        
        }
        
        return found;
        
        
    }
    //@nonl
    //@-node:zorcanda!.20050612231615:scanFor
    //@+node:zorcanda!.20050613101224:scanForAutoCompleter
    public final static Vector< String[] > scanForAutoCompleter( final TnodeBodyText tnt ){
    
    
        final Vector< String[] > found = new Vector< String[] >();
        final StringBuilder sb = tnt._body;
        auto_matcher.reset( sb );
        while( auto_matcher.find() ){
        
            final String[] f = new String[]{ auto_matcher.group( 1 ), auto_matcher.group( 2 ) };
            found.add( f );
        
        }
    
        return found;
    
    }
    //@-node:zorcanda!.20050613101224:scanForAutoCompleter
    //@-others
    




}
//@nonl
//@-node:zorcanda!.20050609162345:@thin LeoUtilities.java
//@-leo
