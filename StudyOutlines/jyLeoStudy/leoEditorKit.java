//@+leo-ver=4-thin
//@+node:ekr.20070127142841.1:@thin leoEditorKit.java
//@@language java

import java.text.*;
import javax.swing.text.*;   
import javax.swing.*;
import java.awt.*;  
import java.io.*;
import java.util.*;  
import javax.swing.plaf.basic.*;
import java.util.regex.*;
import java.awt.event.ComponentListener;
import java.awt.event.ComponentEvent;
import java.awt.font.*;
import java.awt.geom.*;
import java.awt.image.BufferedImage;
import java.awt.image.VolatileImage;


public final class leoEditorKit extends StyledEditorKit{

    final ColorDeterminer _cd;
    final ViewFactory vf;
    final JComponent _numbers;
    //@    @+others
    //@+node:ekr.20070127142841.2:leoEditorKit
    public leoEditorKit( ColorDeterminer callback, JComponent numbers  ){
    
    
        vf = this.new LeoViewFactory( callback, numbers );
        _cd = callback;
        _numbers = numbers;
    
    
    }
    
    //@-node:ekr.20070127142841.2:leoEditorKit
    //@+node:ekr.20070127142841.3:clone
    public Object clone(){
    
        Object lek = new leoEditorKit( _cd, _numbers );
        return lek;
    
    
    }
    //@nonl
    //@-node:ekr.20070127142841.3:clone
    //@+node:ekr.20070127142841.4:createDefaultDocument
    public final Document createDefaultDocument(){
    
        final Document d = new LeoDefaultStyledDocument();
        return d;
    
    
    }
    //@nonl
    //@-node:ekr.20070127142841.4:createDefaultDocument
    //@+node:ekr.20070127142841.5:getContentType
    public String getContentType(){
    
        return "text/leo";
    
    
    
    } 
    //@nonl
    //@-node:ekr.20070127142841.5:getContentType
    //@+node:ekr.20070127142841.6:getViewFactory
    public ViewFactory getViewFactory(){
    
    
        return vf;
    
    
    } 
    //@nonl
    //@-node:ekr.20070127142841.6:getViewFactory
    //@+node:ekr.20070127142841.7:class LeoViewFactory
    class LeoViewFactory implements ViewFactory{
    
        
        ColorDeterminer _cd;
        JComponent _numbers;
    
        public LeoViewFactory( final ColorDeterminer cd, final JComponent numbers ){
        
            _cd = cd;
            _numbers = numbers;
        
        }
    
        public final View create( final Element element ){
        
            
            return new LeoView( element , _cd, _numbers );
            //return new WrappedPlainView( element );
        
        }
    
    
    
    
    }
    //@nonl
    //@-node:ekr.20070127142841.7:class LeoViewFactory
    //@+node:ekr.20070127142841.8:class LeoDefaultStyledDocument
    public static final class LeoDefaultStyledDocument extends DefaultStyledDocument{
    
        private PositionSpecification _ps;
        private final String begin = "<<";
        private final String end = ">>";
        public final Map<String,Object> _srs;
    
        public LeoDefaultStyledDocument(){
        
            super();
            _srs = new HashMap< String, Object >();
        
        
        }
    
        public final void setPosition( final PositionSpecification p ){
        
            _ps = p;
            setSectionReferences();
        
        }
    
        public final PositionSpecification getPosition(){
        
        
            return _ps;
        
        
        }
        
        
        
        
        private final void setSectionReferences(){
        
            final Iterator<PositionSpecification> i = _ps.getChildrenIterator();
            final java.util.List<String> srs = new Vector<String>();
            _srs.clear();
            while( i.hasNext() ){
            
                final PositionSpecification p = i.next();
                final String hS = p.headString().trim();
                final int hSlen = hS.length() -2;
                
                if( hS.startsWith( begin ) && hS.endsWith( end ) ) _srs.put( hS.substring( 2, hSlen ) , null );
            
            
            
            
            }
        
        
        }
    
    
    
    }
    //@-node:ekr.20070127142841.8:class LeoDefaultStyledDocument
    //@+node:ekr.20070127142841.9:interface ColorDeterminer
    public static interface ColorDeterminer{
    
        public Map<String, Color> getColoredTokens();
        public boolean underline();
        public Color getUndefinedSectionReferenceColor();
        public Color getSectionReferenceColor();
        public Color getStringColor();
        public Color getCommentColor();
        public Color getDocColor();
        public String[] getCommentTokens();
        public Color getInvisiblesBlock();
        public Color getInvisiblesDot();
        public boolean showInvisibles();
        public int whichInvisible();
        public Color getPunctuationColor();
        public boolean drawrectangle();
        public Color getRectangleColor();
        
    } 
    //@-node:ekr.20070127142841.9:interface ColorDeterminer
    //@+node:ekr.20070127142841.10:class LeoView
    public static final class LeoView extends WrappedPlainView{
    
        final ColorDeterminer _cd; //this determines what words get colored with what.
        final LeoNumberLabel _numbers; //where the line numbers are drawn.
        //final java.util.List< Segment > _segments; //Stores line numbers so we dont have to recompute them all again.
        final java.util.List< char[] > _segments;
        boolean initialized; //This and
        int start_x,start_y; // these are for line drawing.
        final BreakIterator _wordboundary;
        int lastlinenumber = 1;
        //final private Pattern _sfinder;
        //final private Matcher _smatcher;
        //private String begin = "\\<\\<";
        //private String end = "\\>\\>";
        final char[] _dot_char = new char[]{ '.' };
        private final Rectangle _allotment;
        private int _last_count;
        private int _last_height;
        private VolatileImage _vi;
    
        
        final byte _normal = 0;
        final byte _quote = 1;
        final byte _doc = 2;
        final byte _comment = 3;
        final byte _section_reference = 4;
        final byte _undefined_section_reference = 5;
        final byte _keyword = 6;
        final byte _whitespace = 7;
        final byte _punct = 8;
        
        final String[] doctests1 = new String[]{ "@ ", "@\t", "@\n", "@doc ", "@doc\t", "@doc\n" };
        final String[] doctests2 = new String[]{ "@c ", "@c\t", "@c\n", "@code ", "@code\t", "@code\n" };
        
        final LeoTokenizer _lt =  new LeoTokenizer();
        
        public LeoView( final Element elem, final ColorDeterminer cd, final JComponent numbers ){
    
            super( elem );
            _cd = cd;
            if( numbers != null ){
                _numbers = (LeoNumberLabel)numbers;
                _numbers.setLeoView( this );
            }
            else
                _numbers = null;
            //_segments = new ArrayList< Segment >();
            _segments = new ArrayList< char[] >();
            _wordboundary = BreakIterator.getWordInstance();
            //_sfinder = Pattern.compile( String.format( "%s[^\\n<>]+%s", begin, end ) );
            //_smatcher = _sfinder.matcher( "" );
            //ii = new ImageIcon( "../Icons/Leosplash.GIF" );
            _allotment = new Rectangle();
            
        }
        
        public int getTabSize(){
        
            return 4;
        }
        
        public Map<String, Color> getColoredTokens(){
        
           return _cd.getColoredTokens();    
                
        }
        
    
        
       /* public LeoDefaultStyledDocument getDocument(){
        
            return super.getDocument();
        
        
        } */
        
        public final void paint2( final Graphics g, final Shape r ){
        
            super.paint( g, r );
    //@+at
    //         //Image i = ii.getImage();   //for future enhancement-- the 
    // user will be able to specify an image background.
    //         //g.drawImage( i, 0, 0, Color.WHITE, null );
    //         final LeoDefaultStyledDocument ldsd = 
    // (LeoDefaultStyledDocument)getDocument();
    //         //if( ldsd._srs.size() == 0 ) return;
    //         final JTextComponent jtc = (JTextComponent)getContainer();
    //         try{
    //         final String txt = ldsd.getText( 0, ldsd.getLength() );
    //         if( !txt.contains( ">>" ) && !txt.contains( "<<" ) ) return; 
    // //no need to do anything if these tokens dont exist.
    //         _smatcher.reset( txt.substring( 0, _sregions.length ) );
    //         final Graphics2D g2 = (Graphics2D)g;
    //         final Graphics2D g3 = (Graphics2D)jtc.getGraphics(); //this one 
    // takes drawing priority.
    //         //g2.setColor( Color.RED );
    // 
    //         final FontRenderContext frc = g2.getFontRenderContext();
    //         final Font f = g2.getFont();
    //         final FontMetrics fm = g2.getFontMetrics();
    //         final int subtract;
    //         if( fm.getHeight() >= start_y ){
    //             //subtract = fm.getHeight() - start_y;
    //             subtract = fm.getDescent();
    // 
    //             }
    //         else{
    //             subtract = -( start_y - fm.getHeight() );
    //             }
    //         final int cspot = jtc.getCaretPosition(); //from here to:
    //         final int lstart = Utilities.getRowStart( jtc, cspot ); // line 
    // start
    //         final int lend = Utilities.getRowEnd( jtc, cspot ); // line end
    //         final Rectangle cline = jtc.modelToView( lstart );
    //         final Rectangle cend = jtc.modelToView( lend ); //here is used 
    // to determine which Graphics object to use.
    //         //g3.setColor( jtc.getBackground() );//from here to:
    //         //final int cy = cline.y + cline.height;
    //         //final Dimension jsize = jtc.getSize();
    //         //g3.drawLine( cline.x, cy, cline.x + jsize.width , cy );
    //         //g3.setColor( Color.RED );//here, these code lines wipe out 
    // any lines drawn with g3.  Otherwise they stick with backspacing and 
    // tabbing.
    //         //final String txt = ldsd.getText( 0, ldsd.getLength() );
    //         final boolean underline = _cd.underline();
    //         final Color undefined = 
    // _cd.getUndefinedSectionReferenceColor();
    //         final Color defined = _cd.getSectionReferenceColor();
    //         int next = 0;
    //         while( _smatcher.find( next ) ){
    // 
    //             final int s = _smatcher.start() + 2;
    //             final int end = next = _smatcher.end() -2;
    //             if( _sregions[ s ] != 0 && _sregions[ end ] != 0 ) 
    // continue;
    //             final String pat = txt.substring( s , end  );
    //             final Rectangle pos1 = jtc.modelToView( s );
    //             final Rectangle pos2 = jtc.modelToView( end );
    //             //final Rectangle2D bounds = f.getStringBounds( pat, frc );
    //             final char[] data = pat.toCharArray();
    //             final int ny = (int)( pos1.y + pos1.height - subtract );//+ 
    // fm.getHeight() ); // bounds.getHeight() );
    //             //final Rectangle bounds2 = new Rectangle( 
    // (int)bounds.getWidth(), (int)bounds.getHeight() );
    //             //bounds2.x = pos1.x;
    //             //bounds2.y = ny - bounds2.height;
    //             //System.out.println( bounds2 );
    //             //System.out.println( jtc.getBackground() );
    //             //g2.setColor( jtc.getBackground() );
    //             //g2.fill( bounds2 );
    //             //g2.setColor( Color.RED );
    //             //drawLine( s, end, g2, pos1.x, ny );
    //             final boolean isSR = ldsd._srs.containsKey( pat );
    //             if( isSR )
    //                 g2.setColor( defined );
    //             else
    //                 g2.setColor( undefined );
    //             Utilities.drawTabbedText( new Segment( data, 0, data.length 
    // ), pos1.x, ny , g2, this, s );
    //             //if( ldsd._srs.containsKey( pat ) ) continue; //a match! 
    // no need to draw a unmatched line.
    //             if( isSR ) continue;
    //             else if( underline )
    //                 g2.drawLine( pos1.x, ny, pos2.x, ny );
    //             //final int y =  ny + 3; //pos1.y + pos1.height + 1;
    //             /*if( s >= lstart && end <= lend )
    //                 g2.drawLine( pos1.x, y, pos2.x, y ); //if its the 
    // current line we need to use g3 or it doesnt show up.  g3 takes priority 
    // it appears over the others.
    //             else
    //                 g2.drawLine( pos1.x, y, pos2.x, y ); //otherwise we use 
    // this one.
    //             */
    //         }
    // 
    //         }
    //         catch( Exception x ){}
    //        // super.paint( g, r );
    //@-at
    //@@c
        }
     
        
        //@    @+others
        //@+node:ekr.20070127142841.11:defineRegions
        private final byte[] defineRegions(  final String text, final int from, final int to ){
        
            
            final String[] ctKs = _cd.getCommentTokens();
            final String comment_token = ctKs[ 0 ];
            final String block_comment_start = ctKs[ 1 ];    
            final String block_comment_end = ctKs[ 2 ];    
            final LeoDefaultStyledDocument ldsd = (LeoDefaultStyledDocument)getDocument();
        
            final char[] ctxt = text.toCharArray();  
            final byte[] isString = new byte[ to ];
            //System.out.println( "F " + from + " T " + to );
            //System.out.println( isString.length );
            boolean yes = false;
            char last = 0;
            char last_char='\n';
            
            //final boolean textGTarray = ctxt.length > isString.length? true: false;
            
            boolean comment = false;
            for( int i = 0; i < to; i++ ){
            
                char c = ctxt[ i ];
                if( c=='@' && last_char=='\n' && !comment  ){
               
                    last_char = c;
                    //comment = true;
                    //isString[ i ] = 0;
                    final String docTest = text.substring( i );
                    //final String[] doctests = new String[]{ "@ ", "@\t", "@\n", "@doc ", "@doc\t", "@doc\n" }; //order is important here        
                    for( final String test: doctests1 ){
                    
                        if( docTest.startsWith( test ) ){
                            
                            final int tlen = test.length();
                            final int rlen = ( i + tlen ) >= isString.length? isString.length - ( i + 1 ) : tlen;
                            Arrays.fill( isString, i, i + rlen , _normal );
                            comment = true;
                            i += tlen - 1;
                            last_char = test.charAt( tlen - 1 );
                            break;
                        
                        }
                            
                    
                    
                    }
                    
                    continue;
                
                
                }
                else if( comment ){
                       
                    isString[ i ] = _doc;
                    
                    if( last_char =='\n' && c == '@' ){
                    
                        final String docTest = text.substring( i );
                        //final String[] doctests = new String[]{ "@c ", "@c\t", "@c\n", "@code ", "@code\t", "@code\n" }; //order is important here        
                        for( final String test: doctests2 ){
                    
                            if( docTest.startsWith( test ) ){
            	                   
                                final int tlen = test.length();
                                final int rlen =  ( i + tlen ) >= isString.length?  isString.length - ( i + 1 ): tlen;
                                Arrays.fill( isString, i, i + rlen , _normal );
                                comment = false;
                                i += tlen - 1;
                                c = test.charAt( tlen - 1 );
                                break;
                        
                        }                    
                    
                    
                    }
                     
                     
                
                    }
                    last_char=c;
                    continue;
                
                }
                else if( comment_token != null && text.startsWith( comment_token, i ) ){
                
                    int spot = text.indexOf( '\n', i );
                    if( spot == -1 || spot > isString.length - 1) spot = isString.length -1;
                    spot = spot - i;
                    Arrays.fill( isString, i, i + spot, _comment );
                    i += spot;
                    last_char = text.charAt( i );
                    continue;
                
                }
                else if( block_comment_start != null && text.startsWith( block_comment_start, i ) ){
                
                    int spot = text.indexOf( block_comment_end, i );
                    if( spot == -1 || spot > isString.length - 1){
                    
                        spot = isString.length - 1;
                        //spot = spot - i;
                        Arrays.fill( isString, i, spot, _comment );
                        i = spot;
                    }
                    else{
                    
                        Arrays.fill( isString, i, spot, _comment );
                        i = spot;
                    
                    
                    }
                    last_char = text.charAt( i );
                    continue;
                
                
                }
                else if( last == 0 && c == '<' &&  last_char == '<' ){
                
                    int spot1 = text.indexOf( '\n', i );
                    int spot2 = text.indexOf( ">>", i );
                    if( ( spot1 != -1 && spot1 < spot2 ) || spot2 == -1 ){
        
                        isString[ i ] = 0;
                        continue;
                    
                    }
        
                    final String pat = text.substring( i + 1, spot2  );
                    final boolean isSR = ldsd._srs.containsKey( pat );
                    final byte which = isSR ? _section_reference : _undefined_section_reference;
                    if( spot2  > isString.length ){
                        spot2 = isString.length - 1;
                        Arrays.fill( isString, i + 1  , spot2, which );
                        i = spot2;
                        }
                    else{
                        
                        Arrays.fill( isString, i + 1, spot2, which );
                        i =  spot2 + 1 ;
                    
                    
                    }
                    last_char = '>';
                    continue;
                
                
                
                }
                else if( c == '\'' && last != '"' ){
        
                    last_char = c;
                    if( yes ){
                    
                     yes = false;
                     last = 0;
        
                     
                     }
                    else{
                    
                     yes= true;
                     last = '\'';
                    
                    
                    }
                    isString[ i ] = _quote;
                    continue;
                
                
                }
                else if( c =='"' && last !='\'' ){
                    last_char=c;
                    if( yes ){
                    
                         yes = false;
                         last = 0;
                         
                         }
                    else{
                    
                         yes= true;
                         last = '"';
                         
                         
                         }
                    
                    isString[ i ] = _quote;
                    continue;
                
                
                
                }
                last_char = c;
                if( yes ) isString[ i ] = _quote;
                else; // isString[ i ] = 0;
            
            
            }
        
            final int length = to - from;
            final byte sregion[] = new byte[ length ];
            System.arraycopy( isString, from, sregion, 0, length );
            return sregion;
        
        }
        
        //@-node:ekr.20070127142841.11:defineRegions
        //@+node:ekr.20070127142841.12:setTokenType
        private final void setTokenType( final int type, final Token t ){
        
            switch( type ){
                    
                        case _quote:
                            t.type = _quote;
                            break;
                        case _doc:
                            t.type = _doc;
                            break;
                        case _comment:
                            t.type = _comment;
            	               break;
                        case _section_reference:
                            t.type = _section_reference;
                            break;
                        case _undefined_section_reference:
                            t.type = _undefined_section_reference;
                            break;
                 
                 
                    }
        
        
        }
        //@nonl
        //@-node:ekr.20070127142841.12:setTokenType
        //@+node:ekr.20070127142841.13:drawSelectedText
        public final int drawSelectedText( final Graphics g, final int x, final int y, final int p0, final int p1){
        
            int rvalue = 0;
            try{
            
            rvalue = super.drawSelectedText( g, x, y, p0, p1 );
            final JTextComponent c = (JTextComponent)getContainer();
            //final Graphics2D g2d = (Graphics2D)c.getGraphics();
            final int start = c.getSelectionStart();
            final int end = c.getSelectionEnd();
            if( start != end && _cd.drawrectangle() ){
            
              
                
                    final Rectangle srec = c.modelToView( start );
                    final Rectangle erec = c.modelToView( end );
                    g.setColor( _cd.getRectangleColor() );
                    final FontMetrics fm = g.getFontMetrics();
                    g.drawRect( srec.x, srec.y, ( erec.x - srec.x ), ( erec.y - srec.y ) + fm.getHeight() - 1  );
            
              
                
            
            }
            }
            catch( Exception ex ){
                
                ex.printStackTrace();
            
            
            }
            return rvalue;
        }
        //@nonl
        //@-node:ekr.20070127142841.13:drawSelectedText
        //@+node:ekr.20070127142841.14:drawUnselectedText
        public final int drawUnselectedText( final Graphics g, final int x, final int y, final int p0, final int p1 ) throws BadLocationException{
        
            //if( true )
            //    return super.drawUnselectedText( g, x,y,p0, p1 );
            if( !initialized ){
                
                initialized = true; 
                start_x = x;
                start_y = y;
                
                
            }
            
            
            final Document doc = getDocument();
            final int len = p1 - p0;
            final String txt = doc.getText( p0, len );
            final char[] ctxt = txt.toCharArray();   
               
            _wordboundary.setText( txt );
            final java.util.List< Token > tokens = new Vector< Token >();
                
            //int start = _wordboundary.first();
            int start = 0;
            _lt.setText( txt );
            char last_c = 0;
            char[] last_ca = null;
            final byte[] sregion = defineRegions( doc.getText( 0, doc.getLength() ), p0 , p1 );
            Map<String, Color> ctokens = getColoredTokens();
            _lt.setOperators( ctokens );
            //for (int end = _wordboundary.next(); end != BreakIterator.DONE; start = end, end = _wordboundary.next()) {
            for( int end = _lt.next(); end != -1; start = end, end = _lt.next() ){
                
                //System.out.println( "START is " + start + " END is " + end );
                StringBuilder s = new StringBuilder( end - start );
                //System.out.println( "SB length is " + s.length() );
                s.append( ctxt, start, end - start );
                //System.out.println( "SB2 length is " + s.length() );
                //String s = txt.substring( start, end ); //will consider going to just char array access, but this is easier to think about.
                if( s.length() == 1 ){
                    final char c = s.charAt( 0 );
                    if(( c == '<' || c == '>' ) && last_c == c ){
                    
                        char[] data = new char[]{ c, last_c };
                        if( !Arrays.equals( last_ca, data ) ){
                            tokens.remove( tokens.size() - 1 );
                            final Segment seg = new Segment( data, 0, 2 );
                            final Token t = new Token( seg, false, false );
                            final byte start_region = sregion[ start ];
                            final byte end_region = sregion[ end -1 ];
                            //if( start_region == 2 && end_region == 2 ) t.isDocPart = true;
                            //else if( start_region == 1 && end_region == 1 ) t.isString = true;
                            //System.out.println( "START2 " + start_region + " END2 " + end_region + "  " + t._s.toString() );
                            if( start_region == end_region ) setTokenType( start_region, t );
                            tokens.add( t );
                            last_ca = data;
                            continue;
                            }
                    }
             
                
                
                
                }
                
                final int __slen = s.length();
                //System.out.println( "SLEN is " + __slen );
                char[] ca = new char[ __slen ];                //char[] ca = s.toCharArray();
                s.getChars( 0, __slen, ca, 0 );
                //char sc = ca[ 0 ]; //The first character determines colorization properties of the string
                final char sc =  ca[ 0 ]; //   s.charAt( 0 );
                boolean isws = false;
                boolean ispunct = false;
                boolean start_comment = false;
                last_c = s.charAt( 0 );
                if( Character.isWhitespace( sc ) ) isws = true;
                else if( !Character.isLetterOrDigit( sc ) && sc != '@' ) ispunct = true;
                /*else if( sc == '@'){ //This part is convuluted because of just one char!  well, one char plus possible others.
                        final int next =  _lt.next();//#_wordboundary.next(); //This could be the end so we do a little checking, no need to error on -1        
                        System.out.println( "NEXT is " + next );
                        if( next !=  -1 ){ //BreakIterator.DONE ){
                            
                            final int __slen2 = next - start;
                            s = new StringBuilder( __slen2 );//s = txt.substring( start, next );
                            s.append( ctxt, start, __slen2 );
                        
                        }
                        else{
                        
                            //s = txt.substring( start ); //this means its at the end
                            final int __slen2 = ctxt.length - start;
                            s = new StringBuilder( __slen2 );
                            s.append( ctxt, start, __slen2 );
                            
                            }
                        
                        final int slen = s.length();
                        
                        if( slen > 1 && Character.isLetterOrDigit( s.charAt( 1 ) ) ){
                            
                            final int length = s.length();
                            ca = new char[ length ];
                            s.getChars( 0, length , ca, 0 );
                            //ca = s.toCharArray(); //we want it if its a character or digit, not another symbol
                            System.out.println( "END IS NOW " + next );
                            end = next;
                            }
                        else if( slen > 1 )
                            _lt.previous();
                            //_wordboundary.previous(); //if its a symbol and if there is more data well move back to the previous spot.
                  
                  
                  
                 }*/
                 
                 
                 final Segment s2 = new Segment( ca, 0, ca.length );
                 //if( ispunct && __slen > 1 ) ispunct = false;
                 final Token t = new Token( s2, isws, ispunct );
                 final byte start_region = sregion[ start ];
                 //System.out.println( "END is " + end );
                 final byte end_region = sregion[ end -1 ];
                 if( start_region == end_region ) setTokenType( start_region, t );
                 if( ctokens.containsKey( s2.toString() ) )
                    t.type = _keyword;
                 
                 last_ca = ca;
                 //if(
                 tokens.add( t );
                  
                 }
                
                
            int nwx = x;
            //Map<String, Color> ctokens = getColoredTokens();
            nwx = drawTokens( tokens, g, nwx, y, p0, ctokens ); // doing the loop in the method seems to have speed things up nicely.
            if( _numbers != null )
                _numbers.repaint(); // repaint the line number bar. 
            return nwx;
        
            }
        
        
        //@-node:ekr.20070127142841.14:drawUnselectedText
        //@+node:ekr.20070127142841.15:drawTokens
        private final int drawTokens( 
                                final java.util.List< Token > tokens , 
                                final Graphics g, 
                                final int x, 
                                final int y, 
                                final int mark, 
                                final Map< String, Color> ctokens ){
                                
            final Color foreground = getContainer().getForeground();
            final Color string_color = _cd.getStringColor();
            final Color doc_color = _cd.getDocColor();
            final Color comment_color = _cd.getCommentColor();
            final boolean underline = _cd.underline();
            final Color undefined = _cd.getUndefinedSectionReferenceColor();
            final Color defined = _cd.getSectionReferenceColor();
            final boolean show_invisibles = _cd.showInvisibles();
            final Color invisibleDot = _cd.getInvisiblesDot();
            final Color invisibleBlock = _cd.getInvisiblesBlock();
            final int which_invisible = _cd.whichInvisible();
            final Color punctuationColor = _cd.getPunctuationColor();
            
            int location = x;
            for( final Token t: tokens ){
            
                final Color c = g.getColor();
                switch( t.type ){
                
                    case _doc:
                        g.setColor( doc_color );
                        break;
                    case _comment:
                        g.setColor( comment_color );
                        break;
                    case _quote:
                        g.setColor( string_color );
                        break;
                    case _section_reference:
                        g.setColor( defined );
                        break;
                    case _undefined_section_reference:
                        g.setColor( undefined );
                        if( underline ){
                        
                            final int width = Utilities.getTabbedTextWidth( t._s, g.getFontMetrics(), location, this, 0 );
                            g.drawLine( location, y, location + width, y );
                            
                            }
                        break;
                    case _whitespace:
                        if( show_invisibles ){
                            final FontMetrics fm = g.getFontMetrics();
                            final int i_width = Utilities.getTabbedTextWidth( t._s, fm, location, this, 0 );
                            if( which_invisible == 1 ){
                        
                                g.setColor( invisibleBlock );
                                final int i_height = fm.getHeight();
                                g.fillRect( location, y - i_height , i_width, i_height );
                                
                            }
                            else{
                            
                                int nlocation = location;
                                final int stoppoint = location + i_width;
                                final int add = fm.stringWidth( "." );
                                Segment tab = new Segment( new char[]{ '\t' }, 0, 1 );
                                final int add2 = Utilities.getTabbedTextWidth( tab, fm, nlocation, this, 0 );
                                g.setColor( invisibleDot );
                                for( final char wsc: t._s.toString().toCharArray() ){
                            
                                    //g.drawString( ".", nlocation, y );
                                    g.drawOval( nlocation, y - add , add,add );
                                    if( wsc == '\t' )
                                        nlocation += add2;
                                    else
                                        nlocation += add;
                        
                                }
                            }
                        }
                        break;
                    case _punct:
                        g.setColor( punctuationColor );
                        break;
                    default:
                        final String tstring = t._s.toString();
                        if( ctokens.containsKey( tstring ) )
                            g.setColor( ctokens.get( tstring ) );
                        else
                            g.setColor( foreground );
            
                
                
                }
                /*if( t.isDocPart )
                    g.setColor( doc_color );
                else if( t.isComment )
                    g.setColor( comment_color );
                else if( t.isString )
                    g.setColor( string_color );
                else if ( t.isSection )
                    g.setColor( defined );
                else if( t.isUndefinedSection )
                    g.setColor( undefined );
                else if( ctokens.containsKey( t._s.toString() ) )
                    g.setColor( ctokens.get( t._s.toString() ) );
                else if( t._whitespace );
                else if( t._punct )
                     g.setColor( Color.RED );
                else
                    g.setColor( foreground );
                 
                */
        
                location =  Utilities.drawTabbedText( t._s , location ,y ,g, this, mark );
                g.setColor( c );
                //return location;
                
                }
                return location;
            
        }
        //@nonl
        //@-node:ekr.20070127142841.15:drawTokens
        //@+node:ekr.20070127142841.16:paintNumbers
        private final void paintNumbers( final Graphics g, final LeoNumberLabel lnl ){
            
            try{
                final Graphics2D g2;
                
                //@        << count and build numbers >>
                //@+node:ekr.20070127142841.17:<< count and build numbers >>
                //final Document doc = getDocument();
                //final String txt = doc.getText( 0, doc.getLength() );
                //final char[] count = txt.toCharArray();
                //int ncount = 1; //we always have 1 line to draw a number for 
                
                //JTextPane _jtp = (JTextPane)getContainer();
                //int pos = _jtp.getCaretPosition();
                //pos = txt.substring( 0, pos ).lastIndexOf( "\n" );
                //if( pos == -1 ) pos = 0;
                
                
                //int snum = 0;
                /*for( int i = 0; i < count.length; i ++ ){
                
                    if( count[ i ] == '\n' ){
                    
                        if( i == pos ){
                
                            snum = ncount;
                         
                         }
                        ncount++;
                    
                    
                    }
                
                
                }     */
                
                final int ncount = getViewCount();
                int size = _segments.size();
                if( ncount > size ){ //if we need to add a Segment to the cache, we make it and add it.
                        
                    int add = ncount - size;
                    while( add != 0 ){
                            
                        size++;
                        //String num = size + "\n";
                        //char[] nc = num.toCharArray();
                        char[] nc = String.valueOf( size ).toCharArray();
                        _segments.add( nc );
                        //_segments.add( new Segment( nc, 0, nc.length ) );
                        add--;
                            
                    }
                            
                        
                }
                
                
                JTextPane _jtp = (JTextPane)getContainer();
                g.setFont( _jtp.getFont() );
                int swidth = g.getFontMetrics().stringWidth( String.valueOf( ncount ) );
                //swidth += swidth/3;
                final Dimension d = lnl.getSize();
                //final Dimension od = getContainer().getSize();
                if( d.width != swidth ){  //resize LeoNumberLabel so it will be large enought to display the numbers.
                    d.width = swidth;
                    lnl.setSize( d );
                }
                
                final Point p = lnl.getLocation();
                final Rectangle vRect = lnl.getVisibleRect();
                if( _vi != null && _vi.contentsLost() ){
                
                    final Graphics2D g2d = _vi.createGraphics();
                    final int result = _vi.validate( g2d.getDeviceConfiguration() );
                    if( result != _vi.IMAGE_RESTORED ){
                         _vi.flush();
                         _vi = null;
                        
                    }
                
                }
                
                
                final int height = getHeight();
                final int _vi_height = vRect.height * 2;
                //if( ( height != _last_height || ncount > _last_count ) || _vi == null ){//|| _vi.contentsLost() ){
                if( _vi != null && ( _vi.getHeight() != _vi_height || _vi.getWidth() != d.width ) ){
                    
                    
                    _vi.flush();
                    _vi = lnl.createVolatileImage( vRect.width, _vi_height  );
                
                    }
                else if( _vi == null ) _vi = lnl.createVolatileImage( vRect.width, _vi_height  );
                    
                
                g2 = (Graphics2D)_vi.getGraphics();
                g2.setColor( lnl._background ); //give a background, could be any color
                g2.fillRect( 0, p.y, vRect.width, _vi_height );
                _last_count = ncount;
                _last_height = height;
                
                //}
                //else{
                    
                 //   g.drawImage( _vi, 0, vRect.y, vRect.width, vRect.height, null ); 
                    //g.drawImage( _vi, 0, vRect.y, vRect.width, vRect.height, 0, 0, vRect.width, vRect.height, null );
                    //g.drawImage( _vi, 0, 0, _vi.getWidth(), _vi.getHeight()/2 , null );
                 //   g2 = g;
                    
                //}
                
                
                        
                //@nonl
                //@-node:ekr.20070127142841.17:<< count and build numbers >>
                //@nl
                //@        << determine visible numbers >>
                //@+node:ekr.20070127142841.18:<< determine visible numbers >>
                
                //JTextPane _jtp = (JTextPane)getContainer();
                //final int start = viewToModel( (float)vRect.x, (float)vRect.y, new Rectangle(), new Position.Bias[]{ Position.Bias.Forward } );
                //final int end = viewToModel( (float)vRect.x , (float)vRect.y + vRect.height, new Rectangle(), new Position.Bias[]{ Position.Bias.Forward } );
                
                //System.out.println( vRect );
                final int start = _jtp.viewToModel( new Point( vRect.x, vRect.y ) );
                final int end = _jtp.viewToModel( new Point( vRect.x, vRect.y + vRect.height ) );
                
                int vstart = getViewIndexAtPosition( start );
                final int vend = getViewIndexAtPosition( end ) + 1;
                if( ( vend - vstart ) > _segments.size() ){
                
                 g2.dispose();
                 return; //without this check, an Exception gets thrown occasionally.
                 
                 }
                
                
                //System.out.println( "START IS " + start + " END IS " + end );
                //@nonl
                //@-node:ekr.20070127142841.18:<< determine visible numbers >>
                //@nl
                //@        << determine current line >>
                //@+node:ekr.20070127142841.19:<< determine current line >>
                /*JTextPane _jtp = (JTextPane)getContainer();
                int pos = _jtp.getCaretPosition();
                pos = txt.substring( 0, pos ).lastIndexOf( "\n" );
                if( pos == -1 ) pos = 0;
                else pos++;
                //pos = Utilities.getRowStart(  _jtp, pos );
                Rectangle cspot = _jtp.modelToView( pos );
                */
                /*final Font for_g = _jtp.getFont();
                g.setFont( for_g );
                g2.setFont( for_g );
                final int y_base = g.getFontMetrics().getHeight(); */
                
                
                
                
                
                
                
                /*
                int ywhere = cspot.y / y_base; //start_y; //this simple division replaced 15 lines of code!
                final int increment = cspot.y %  y_base;   //start_y;
                if( increment > y_base/2 ){//start_y/2 ){///if the remainder is large enough, it is pointing at the next number 
                
                    ywhere++;
                    
                    
                    }*/
                //lastlinenumber = ywhere;
                //final Segment posSegment = _segments.get( ywhere );
                //int ywhere = snum;
                
                
                //JTextPane _jtp = (JTextPane)getContainer();
                int pos = _jtp.getCaretPosition();
                if( pos == -1 ) pos = 0;
                int ywhere = getViewIndexAtPosition( pos );
                
                //System.out.println( "YHERE IS " + ywhere );
                final char[] posSegment = _segments.get( ywhere );
                int segnum = ywhere; //+ 1; //segnum is matched against the counter num, it needs to be based off of a 1 start position to get equality.
                
                
                final Font for_g = _jtp.getFont();
                g.setFont( for_g );
                g2.setFont( for_g );
                final int y_base = g.getFontMetrics().getHeight();
                
                //@-node:ekr.20070127142841.19:<< determine current line >>
                //@nl
                //@        << paint colored numbers >>
                //@+node:ekr.20070127142841.20:<< paint colored numbers >>
                //int num = 0; //This gives us a position on the y-axis.
                g2.setColor( lnl._foreground );
                //g2.setPaintMode();
                //int ncount2 = ncount -1 ;
                
                //System.out.println( "Vstart " + vstart + " Vend " + vend + "  SIze " + _segments.size() );
                final java.util.List< char[] > __segments = _segments.subList( vstart, vend );
                //g2.setRenderingHint( RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON );
                for( final char[] s: __segments ){
                
                    //if( ncount > 810 ) System.out.print( new String( s ) ); 
                    //final int y_position = start_y + y_base * num;
                    //View v1 = getView( vstart );
                    //vstart++;
                    _allotment.x = _allotment.y = _allotment.height =  _allotment.width = 0;
                    final Shape s3 = getChildAllocation( vstart, _allotment );
                    if( s3 == null ) return; // This protects us from a bomb if the current line isnt showing
                    final Rectangle bounds = s3.getBounds();
                    final int y_position = ( bounds.y + start_y ) - vRect.y;
                    vstart++;
                    g2.drawChars(  s , 0, s.length, 0, y_position );
                    //offset += s.array.length;
                    _allotment.x = _allotment.y = _allotment.height =  _allotment.width = 0;
                    final View v = getViewAtPoint( 0, bounds.y, _allotment ); // y_position, _allotment );
                    final int mspan = (int)v.getMaximumSpan( this.Y_AXIS );
                    //final int pspan = (int)v.getPreferredSpan( this.Y_AXIS );
                    //System.out.println( mspan + ":" + pspan + "," + v.getStartOffset() + "," + v.getEndOffset() + " " + v.getElement() + " " + v.hashCode() );
                    //Document doc = v.getDocument();
                    //String text = doc.getText(  v.getStartOffset(), v.getEndOffset() - v.getStartOffset() );
                    //System.out.println( text );
                    //if( mspan != pspan )
                    //    System.out.println( "Mismatch in span " + mspan + " " + pspan );
                    //_allotment.x = _allotment.y = _allotment.height =  _allotment.width = 0;
                    if( mspan > y_base ){
                        final FontMetrics _fm = g2.getFontMetrics();
                        final int inc_height = _fm.getHeight();
                        final int amount = mspan/y_base -1;
                        for( int i = 1 ; i <= amount; i++ ){
                
                            g2.drawChars( _dot_char, 0, 1, 0, y_position + ( i * inc_height ) );//    start_y + y_base * num );
                        
                        
                        }
                    
                    
                    }
                    //if( num == ncount2 ) break; //no need to keep drawing if we only have a certain amount of lines to show.
                    //num++;
                        
                    } 
                   // g.drawImage( _vi, 0, 0, _vi.getWidth(), _vi.getHeight()/2, null );
                    //g.drawImage( _vi, 0, vRect.y, vRect.width, vRect.y + vRect.height, 0, 0, vRect.width, vRect.y + vRect.height, null );
                
                Graphics2D _g = (Graphics2D)g;
                //_g.setRenderingHint( RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON );
                _g.drawImage( _vi, 0, vRect.y , _vi.getWidth(), _vi.getHeight(), null );   //vRect.width, vRect.height, null );
                
                    
                _g.setColor( lnl._current );
                _allotment.x = _allotment.y = _allotment.height =  _allotment.width = 0;
                final Shape s = getChildAllocation( ywhere, _allotment );
                final Rectangle r = s.getBounds();
                _g.drawChars( posSegment, 0, posSegment.length, 0, r.y + start_y ); //+ y_base * segnum );
                //g.drawChars( posSegment, 0, posSegment.length, start_x, start_y + y_base * segnum );
                //Utilities.drawTabbedText( posSegment , start_x, start_y * segnum, g, null, cur_offset );
                g2.dispose();
                //@nonl
                //@-node:ekr.20070127142841.20:<< paint colored numbers >>
                //@nl
                
                
                
            }
            catch( Exception x ){ System.out.println( x );
                                  x.printStackTrace(); }
            
            
        }        
        //@-node:ekr.20070127142841.16:paintNumbers
        //@+node:ekr.20070127142841.21:class Token
        final class Token{
            //A class to hold drawing data in.
            //final boolean _whitespace;
            //final boolean _punct;
            final Segment _s;
            //boolean isString;
            //boolean isDocPart;
            //boolean isComment;
            //boolean isSection;
            //boolean isUndefinedSection;
            byte type;
                
            Token( final Segment s, final boolean ws,final boolean punct ){
                
                _s = s;
                if( ws )
                    type = _whitespace;
                if( punct)
                    type = _punct;
                //_whitespace = ws;
                //_punct = punct;
                
                
            }
            
            
        }
        //@nonl
        //@-node:ekr.20070127142841.21:class Token
        //@+node:ekr.20070127142841.22:class LeoTokenizer
        static class LeoTokenizer{
        
            String _text;
            char[] _data;
            int _current;
            int _previous;
            Map<String,Color> _operators;
            
            public void setText( String text ){
            
                _text = text;
                _data = text.toCharArray();
                _current = 0;  
                _previous = 0;  
            
            
            }
            
            public void setOperators( Map<String,Color> operators ){
            
                _operators = operators;
            
            }
            
            public int previous(){
            
                _current = _previous;
                return _current;
            
            }
        
            public int next(){
            
                //System.out.println( "DATA Length " + _data.length );
                if( _data.length == 0 ) return -1;
                else if( _current >= _data.length ) return -1;
                else if( _current == -1 ) return -1;
                
                final int startchar = _data[ _current ];
                if( !Character.isLetterOrDigit( startchar ) && !Character.isWhitespace( startchar ) 
                    && startchar != '@' && startchar != '_' ){
                    
                    //int rv = ++_current;
                    //;
                    //return rv;
                    StringBuilder sb = new StringBuilder();
                    int start = _current;
                    char sc = _data[ start ];
                    if( sc == '\'' || sc == '"' ){
                    
                        _previous = _current;
                        _current = ++start;
                        return start;
                    
                    
                    }
                    for( ; start < _data.length; start ++ ){
                        
                        char c = _data[ start ];
                        
                        /*if( c == '"' || c == '\'' && c == sc && start != _current ){
                        
                            int ostart = start;
                            start++;
                            _previous = _current;
                            _current = start;
                            //if( start >= _data.length )
                            //    _current = -1;
                            System.out.println( "RETURNING TOKENS "  + " " + _data[ ostart ] + " " + start + " " + _data.length );
                            return _current;
                        
                        
                        } */
                        
                        if( (_operators.containsKey( sb.toString() ) && !_operators.containsKey( sb.toString() + c ) ) ){
                        
                            //if( Character.isLetterOrDigit( c ) || Character.isWhitespace( c ) ){
                                _previous = _current;
                                _current = start;
                                return start;
                            
                            //}
                            //else{
                                
                            //    _previous = _current;
                            //    _current = ++start;
                            //    return _current;
                            
                            
                            
                            //}
                        
                        
                        }
                        else if( Character.isLetterOrDigit( c ) || Character.isWhitespace( c ) || 
                                !_operators.containsKey( String.valueOf( c ) ) ){
                            
                            _previous = _current;
                            if( start == _current ) start ++;
                            _current = start;
                            //System.out.println( "SB is " + sb.toString() );
                            return start;
                        
                        } 
        
                        sb.append( c );
                
                    }
                    _previous = _current;
                    //int rv = ++_current;
                    //return rv;
                    _current = start;
                    return start;
                
                }
                if( Character.isWhitespace( startchar ) ){
                    int start = _current;
                    for( ; start < _data.length; start ++ ){
                        
                        char c = _data[ start ];
                        if( !Character.isWhitespace( c ) ){
                        
                            _previous = _current;
                            _current = start;
                            return start;
                        
                        } 
                
                
                
                    }
                    _previous = _current;
                    _current = start;
                    return start;
                }
                
                
                
                int start = _current;
                for( ; start < _data.length; start ++ ){
                
                    char c = _data[ start ];
                    if( !Character.isLetterOrDigit( c ) && c != '@' && c != '_' ){
                        
                        _previous = _current;
                        _current = start;
                        return start;
                    
                    }
                
                
                
                }
                _previous = _current;
                _current = start;
                return start;
            
            
            
            }
        
        
        
        
        }
        //@nonl
        //@-node:ekr.20070127142841.22:class LeoTokenizer
        //@-others
        
        
    
    }
    
    
    
    //@-node:ekr.20070127142841.10:class LeoView
    //@+node:ekr.20070127142841.23:class LeoNumberLabel
    public static final class LeoNumberLabel extends JComponent{
        //This class is used for line numbers in the editor. 
        LeoView _lv;
        Color _background;
        Color _foreground;
        Color _current;
    
        public LeoNumberLabel( Color background, Color foreground, Color current){
        
        
            super();
            _background = background;
            _foreground = foreground;
            _current = current;
            setUI( null );
            setBackground( background );
        
        }
        
        public final void setLeoView( final LeoView lv ){
        
        
            _lv = lv;
        
        
        }
        
    
        public final void paint( final Graphics g ){
        
            //super.paint( g );  // no need to paint the component since all we are doing is drawing a black box with numbers in it.
            /*final Dimension d = getSize();
            final Point p = getLocation();
            g.setColor( _background ); //give a background, could be any color
            g.fillRect( p.x, p.y, d.width, d.height );
            g.setColor( _foreground ); */
            _lv.paintNumbers( g, this );
            
        
        
        }
    
    
        public final void setSize( final Dimension d ){
        
            super.setSize( d );
            final Container con = getParent();
            final ComponentListener[] cl = con.getComponentListeners();
            final ComponentEvent notify = new ComponentEvent( con, ComponentEvent.COMPONENT_RESIZED );
            for( final ComponentListener c: cl )
                c.componentResized( notify );
                
        
        
        }
        
        public final void setBackground( final Color bg ){
        
            _background = bg;
        
        }
        
        public final void setForeground( final Color fg ){
        
            _foreground = fg;
        
        }
        
        public final void setCurrent( final Color current ){
        
            _current = current;
        
        }
        
    
    }
    //@nonl
    //@-node:ekr.20070127142841.23:class LeoNumberLabel
    //@-others



}
//@nonl
//@-node:ekr.20070127142841.1:@thin leoEditorKit.java
//@-leo
