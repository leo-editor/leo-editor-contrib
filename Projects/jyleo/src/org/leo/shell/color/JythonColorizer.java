//@+leo-ver=4-thin
//@+node:zorcanda!.20051119155132:@thin JythonColorizer.java
//@@language java
package org.leo.shell.color;

import org.python.core.*;
import org.python.util.*;
import org.python.parser.*;
import java.awt.*;
import java.util.*;
import javax.swing.*;
import javax.swing.text.*;


public class JythonColorizer{

    PythonInterpreter _pi;
    JTextPane _jtp;
    boolean colorizing;
    char char_in_charge = 0; 
    java.util.List<String> conventions; 
    ColorConfiguration colorconfig;
    
    LinkedList<PositionHolder> positions; 
    
    public JythonColorizer( PythonInterpreter _pi, JTextPane _jtp, ColorConfiguration cc ){
    
        this._pi = _pi;
        this._jtp = _jtp;
        colorizing = false;
        conventions = new Vector<String>();
        conventions.add( "self" );
        positions = new LinkedList<PositionHolder>();
        colorconfig = cc;
        
    }



    //@    @+others
    //@+node:zorcanda!.20051119155214:colorization
    //@+others
    //@+node:zorcanda!.20051119155214.1:colorize
    public final void colorize( final String line, final String insert, final int insertspot, final int start, final int end ){
    
        try{
    
            final char[] data = line.toCharArray();
            int spot = 0;
            final StringBuilder buffer = new StringBuilder();
            final StyledDocument doc = (StyledDocument)_jtp.getDocument();
            int eol = endOfLine();
            doc.insertString( insertspot, insert , null );
            
            
            for( final char c: data ){
        
                if( !Character.isLetter( c ) ){
            
                    final String test = buffer.toString();
                    boolean local = isLocal( test );
                    boolean kword = isKeyword( test );
                    boolean builtin = isBuiltin( test );
                    boolean convention = isConvention( test );
                
                    if( local || kword || builtin||convention ){
                
                        try{
                    
                            final SimpleAttributeSet sas = new SimpleAttributeSet();
                            if( local )
                                StyleConstants.setForeground( sas, colorconfig.getLocalColor() );//_local );
                            else if( kword )
                                StyleConstants.setForeground( sas, colorconfig.getKeywordColor() );//_kword );
                            else if( builtin )
                                StyleConstants.setForeground( sas, colorconfig.getBuiltinColor() );//_builtin );
                            else if( convention )
                                StyleConstants.setForeground( sas, colorconfig.getConventionColor() );//_convention );
                            
                            
                            //doc.insertString( start + spot - buffer.length(), buffer.toString(), sas );
                            doc.setCharacterAttributes( start+ spot - buffer.length(), buffer.length(), sas, true );
                            SimpleAttributeSet sas2 = new SimpleAttributeSet();
                            if( !Character.isWhitespace( c ) ){
                
                                //sas2 = new SimpleAttributeSet();
                                StyleConstants.setForeground( sas2, colorconfig.getSyntaxColor() );// _synColor );
                            }
                            doc.setCharacterAttributes( start+ spot , 1, sas2, true );
                            //doc.insertString( start + spot , String.valueOf( c ), sas2 );
                            buffer.delete( 0, buffer.length() );
                            spot++;
                            continue;
                    
                        }
                        catch( final Exception x ){
                            x.printStackTrace();
                    
                        }
                    
                
                
                }
                
                SimpleAttributeSet sas3 = new SimpleAttributeSet();
                //doc.insertString( start + spot - buffer.length(), buffer.toString(), null );
                doc.setCharacterAttributes( start+ spot - buffer.length(), buffer.length(), sas3, true );
                SimpleAttributeSet sas = new SimpleAttributeSet();
                if( !Character.isWhitespace( c ) ){
                
                    //sas = new SimpleAttributeSet();
                    StyleConstants.setForeground( sas, Color.RED );
                }
                doc.setCharacterAttributes( start+ spot, 1, sas, true );
                //doc.insertString( start + spot, String.valueOf( c ), sas );
                spot++;
                buffer.delete( 0, buffer.length() );
                
                
                //buffer.append( c );
                continue;
            
            
            }
    
            else buffer.append( c );
            spot++;
        
        }
    
        if( buffer.length() != 0 ){
            
            final String test = buffer.toString();
            boolean local = isLocal( test );
            boolean kword = isKeyword( test );
            boolean builtin = isBuiltin( test );
            boolean convention = isConvention( test );
            SimpleAttributeSet sas = new SimpleAttributeSet();
            if( local || kword || builtin||convention ){
            
                //sas =  new SimpleAttributeSet();
                if( local )
                    StyleConstants.setForeground( sas, colorconfig.getLocalColor() );//_local );
                else if( kword )
                    StyleConstants.setForeground( sas, colorconfig.getKeywordColor() );// _kword );
                else if( builtin )
                    StyleConstants.setForeground( sas, colorconfig.getBuiltinColor() );//_builtin );
                else if( convention )
                    StyleConstants.setForeground( sas, colorconfig.getConventionColor() );// _convention );
            
            
            }
            //doc.insertString( start + ( spot - buffer.length() ), buffer.toString(), sas );
            doc.setCharacterAttributes( start+ ( spot - buffer.length() ), buffer.length(), sas, true );
           } 
        }
        catch( final Exception x ){
            x.printStackTrace();
        
        }
        try{
            Document doc = _jtp.getDocument();
            Element e = Utilities.getParagraphElement( _jtp, end );
            findPositions( start, doc.getText( start, e.getEndOffset() - start ) );
            try{
                colorizeStrings( start , e.getEndOffset() );
            }
            catch( Exception x ){ x.printStackTrace(); }
        }
        catch( BadLocationException ble ){}
    }
    
    
    //@-node:zorcanda!.20051119155214.1:colorize
    //@+node:zorcanda!.20051119155214.2:findPositions
    public void findPositions( int spot, String line ){
    
        DefaultStyledDocument dsd = (DefaultStyledDocument)_jtp.getDocument();
        for( char c: line.toCharArray() ){
        
            if( c == '\'' || c == '"'|| c == '#' ) addPosition( spot, c );
            spot++;
    
        }
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051119155214.2:findPositions
    //@+node:zorcanda!.20051119233050:colorizeStrings
    public void colorizeStrings( int colorizefrom, int colorizeto ){
    
        SimpleAttributeSet sas = new SimpleAttributeSet();
        StyleConstants.setForeground( sas, colorconfig.getStringColor() );
        SimpleAttributeSet comment = new SimpleAttributeSet();
        StyleConstants.setForeground( comment, Color.RED.brighter() );
        StyleConstants.setItalic( comment, true );
        DefaultStyledDocument doc = (DefaultStyledDocument)_jtp.getDocument();
        Iterator<PositionHolder> pi = positions.iterator();
        while( pi.hasNext() ){
        
            PositionHolder ph = pi.next();
            if( !ph.isValid( doc ) ) pi.remove();
        
        }
    
        PHComparator phc = new PHComparator();
        Collections.sort( positions, phc );
        Set<PositionHolder> pcs = phc.getPurgeCandidates();
        Map<PositionHolder, Object> seen = new HashMap<PositionHolder, Object>();
        for( PositionHolder ph: pcs ){
            
            if( seen.containsKey( ph ) ){
             positions.remove( ph );
            }
            else seen.put( ph, null );
        
        }
        
        
        boolean colorizing = false;
        PositionHolder phic = null;
        int ignoreto = -1;
        for( PositionHolder pos: positions ){
        
            int spot = pos.p.getOffset();
            if(!colorizing && ( ignoreto != -1? spot > ignoreto: true) ){
            
                colorizing = true;
                phic = pos;
                if( phic.c.equals( "#" ) ){
                
                    int ignorefrom = phic.p.getOffset();
                    Element e = doc.getParagraphElement( ignorefrom );
                    ignoreto = e.getEndOffset();
                    doc.setCharacterAttributes( ignorefrom, ignoreto - ignorefrom, comment, true );
                    colorizing = false;
                    phic = null;
                
                
                }
                else ignoreto = -1;
                continue;
            
            
            }
            else if( ignoreto != -1 &&  spot < ignoreto ) continue;
            else ignoreto = -1;
            
            if( pos.c.equals( phic.c )) {
            
                int start = phic.p.getOffset();
                int end = pos.p.getOffset();
                if( start < colorizefrom ) start = colorizefrom;
                if( end > colorizeto ) end = colorizeto;
                doc.setCharacterAttributes( start, end + 1 - start , sas, false );  
                colorizing = false;
                phic = null;
            
            
            }
        
        
        }
        if( colorizing ){
        
            int start = phic.p.getOffset();
            int end = doc.getLength();
            if( start < colorizefrom ) start = colorizefrom;
            if( end > colorizeto ) end = colorizeto;
            doc.setCharacterAttributes( start, end - start , sas, false );
        
        
        }
    
    }
    //@nonl
    //@-node:zorcanda!.20051119233050:colorizeStrings
    //@+node:zorcanda!.20051119155214.3:isLocal
    public final boolean isLocal( final String text ){
    
        try{
        
            final Object o = _pi.get( text );
            if( o == null ) return false;
            return true;
        
        
        }
        catch( final Exception x ){
            
            x.printStackTrace();
        
        }
        
        return false;
    
    
    
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051119155214.3:isLocal
    //@+node:zorcanda!.20051119155214.4:isKeyword isBuiltin
    public final boolean isKeyword( final String kword ){
    
    
        final String[] kwrds = PythonGrammarConstants.tokenImage;
        final String kword2 = "\""+kword+"\"";
        for( final String s: kwrds ){
        
            if( s.equals( kword2 ) ) return true;
            
            }
        return false;
        
    }
    
    public final boolean isBuiltin( final String kword ){
            
        PySystemState pss = Py.getSystemState();
        PyStringMap psm = (PyStringMap)pss.builtins;
        return psm.has_key( new PyString( kword ) );
    
    }
    //@nonl
    //@-node:zorcanda!.20051119155214.4:isKeyword isBuiltin
    //@+node:zorcanda!.20051119155214.5:isConvention
    public boolean isConvention( String word ){
    
        return conventions.contains( word );
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051119155214.5:isConvention
    //@-others
    //@nonl
    //@-node:zorcanda!.20051119155214:colorization
    //@+node:zorcanda!.20051119155526:startOfLine endOfLine
    public final int startOfLine(){
    
        
        try{
            
            Element e = Utilities.getParagraphElement( _jtp, _jtp.getCaretPosition() );
            return e.getStartOffset();
            
        
        }
        catch( final Exception x ){
            x.printStackTrace();
        
        }
        
        return 0;
    
    }
    
    
    
    public int endOfLine(){
    
        try{
    
                
            Element e = Utilities.getParagraphElement( _jtp, _jtp.getCaretPosition() );
            return e.getEndOffset() -1;
        
        }
        catch( final Exception x ){
            x.printStackTrace();
        
        }
        return 0;
    
    
    }
    
    //@-node:zorcanda!.20051119155526:startOfLine endOfLine
    //@+node:zorcanda!.20051119232504:addPosition
    public void addPosition( int i, char c ){
    
        Document doc = _jtp.getDocument();
        try{
            Position p = doc.createPosition( i );
            PositionHolder ph = new PositionHolder( p, c );
            if( !positions.contains( ph ) )
                positions.add( ph );
        }
        catch( BadLocationException ble ){}
    }
    //@nonl
    //@-node:zorcanda!.20051119232504:addPosition
    //@+node:zorcanda!.20051119232504.1:class PositionHolder
    public static class PositionHolder{
    
        
        final Position p;
        final String c;
        public PositionHolder( Position p, char c ){
        
            this.p = p;
            this.c = String.valueOf( c );
        
        }
        
        @Override
        public int hashCode(){
        
            int i = 17;
            i = 37 * i + c.hashCode();
            i = 37 * i + p.getOffset();
            return i;
        
        }
        
        @Override
        public boolean equals( Object o ){
        
            if( o == null ) return false;
            if( !( o instanceof PositionHolder ))  return false;
            
            PositionHolder ph = (PositionHolder)o;
            return c.equals( ph.c ) && p.getOffset() == ph.p.getOffset();
        
        
        }
    
        public boolean isValid( Document doc ){
        
            try{
            
                String c2 = doc.getText( p.getOffset(), 1 );
                if( c.equals( c2 ) ) return true;
                else return false;
            
            
            }
            catch( BadLocationException ble ){
            
                return false;
            
            }
        
        
        }
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051119232504.1:class PositionHolder
    //@+node:zorcanda!.20051119233050.1:class PHComparator
    public static class PHComparator implements Comparator<PositionHolder>{
    
        Map<PositionHolder, Object> purgecandidates;
        public PHComparator(){
        
            purgecandidates = new IdentityHashMap<PositionHolder, Object >();
        
        }
    
        public int compare( PositionHolder ph1, PositionHolder ph2 ){
        
            int spot1 = ph1.p.getOffset();
            int spot2 = ph2.p.getOffset();
            if( spot1 > spot2 ) return 1;
            if( spot1 < spot2 ) return -1;
            purgecandidates.put( ph1, null );
            purgecandidates.put( ph2, null );
            return 0;
        
        
        }
    
        public Set<PositionHolder> getPurgeCandidates(){
        
            return purgecandidates.keySet();
        
        }
    
        public boolean equals( Object o ){
        
            if( o == null ) return false;
            if( !(o instanceof PHComparator) ) return false;
            return true;
        
        }
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051119233050.1:class PHComparator
    //@+node:zorcanda!.20051120172340:clearPositions
    public void clearPositions(){
    
        positions.clear();
    
    }
    //@nonl
    //@-node:zorcanda!.20051120172340:clearPositions
    //@-others


}

//@-node:zorcanda!.20051119155132:@thin JythonColorizer.java
//@-leo
