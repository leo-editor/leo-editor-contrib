//@+leo-ver=4-thin
//@+node:zorcanda!.20050830145654:@thin LeoSwingColorizer.java
//@@language java

import java.text.*;
import javax.swing.text.*;



public final class LeoSwingColorizer{

    //final ColorDeterminer _callback;
    
    public LeoSwingColorizer(){
    
        //_callback = callback;
    
    }

    //@    @+others
    //@+node:zorcanda!.20050830150155:setAttributes
    //@-node:zorcanda!.20050830150155:setAttributes
    //@+node:zorcanda!.20050830150155.1:colorize
    public final void colorize( final StyledDocument doc ){
    
        try{
        
        final String txt = doc.getText( 0, doc.getLength() );
        final BreakIterator bi = BreakIterator.getWordInstance();
        bi.setText( txt );
        int start = bi.first();
        for( int end = bi.next(); end != BreakIterator.DONE; start = end, end = bi.next() ){
        
            final String word = txt.substring( start, end );
            System.out.println( word );
            if( word.equals("def") ){
            
                SimpleAttributeSet sas = new SimpleAttributeSet();
                StyleConstants.setForeground( sas, java.awt.Color.RED );
                doc.setCharacterAttributes( start, end - start, sas, true );
            
            
            }
        
        }
    
        }
        catch( Exception x ){
            x.printStackTrace();
        
        
        }
    
    
    }
    //@nonl
    //@-node:zorcanda!.20050830150155.1:colorize
    //@-others

}
//@nonl
//@-node:zorcanda!.20050830145654:@thin LeoSwingColorizer.java
//@-leo
