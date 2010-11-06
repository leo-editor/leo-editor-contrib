//@+leo-ver=4-thin
//@+node:zorcanda!.20051031155350:@thin ColorizerRunnable.java
//@@language java
import java.util.*;
import java.io.File;

import java.awt.*;
import java.lang.reflect.InvocationTargetException;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.text.*;
import java.util.concurrent.*;


public class ColorizerRunnable implements Runnable{


    final JTextPane editor;
    final leoEditorKit2.ColorDeterminer cdeterminer;
    final public LinkedList<PositionCarrier> positions;
    final LinkedBlockingQueue<java.util.List> queue;
    final Comparator<PositionCarrier> compare;
    String[] commenttokens;
    static final String sr1 = "<" + "<";
    static final String sr2 = ">" + ">";
    Map<String,Icon> icons;
    Map<String,JComponent> plugins;

    public ColorizerRunnable( JTextPane editor, leoEditorKit2.ColorDeterminer cdeterminer, LinkedBlockingQueue<java.util.List> queue ){
    
        super();
        this.editor = editor;
        this.cdeterminer = cdeterminer;
        this.queue = queue;
        this.positions = new LinkedList<PositionCarrier>();
        compare = new PosComparator();
        icons = new HashMap<String,Icon>();
        plugins = new HashMap<String,JComponent>();
        //JPanel jp = new JPanel();
        //JScrollPane jsp = new JScrollPane( new JTree() );
        //jp.add( jsp );
        //EditorBackgroundMovie ebm = new EditorBackgroundMovie( "/home/brihar/Movies/BladeRunner/BR_DC.mpeg", jp );
        //plugins.put( "testplugin", jp );
        
    }
    
    static class PosComparator implements Comparator<PositionCarrier>{
    
        public int compare( PositionCarrier p1, PositionCarrier p2 ){
        
            int ip1 = p1.pos.getOffset();
            int ip2 = p2.pos.getOffset();
            if( ip1 < ip2 ) return -1;
            else if ( ip1 > ip2 ) return 1;
            return 0;
        
        
        }
    
        public boolean equals( Object o ){ return false; }
    
    }


    //@    @+others
    //@+node:zorcanda!.20051201121336:tokens
    //@+others
    //@+node:zorcanda!.20051201121336.1:Token
    static class Token{
        
        String data;
        AttributeSet sas;
        boolean ignore;
        Token( String data, AttributeSet sas ){
        
            this.data = data;
            this.sas = sas;
            ignore = false;
        }
            
        Token( String data ){
            
            this.data = data;
            ignore = true;
                
        }
            
        public boolean ignore(){ return ignore; }
            
            
        public String toString(){
            
            return data + ", " + sas + "\n";
            
        }
    }
    //@nonl
    //@-node:zorcanda!.20051201121336.1:Token
    //@+node:zorcanda!.20051201121445:TokenRunnable
    class TokenRunnable extends Token implements Runnable{
        
        DefaultStyledDocument doc;
        int location;
        public TokenRunnable(  String data, AttributeSet set ){
            
            super( data, set );
            
        }
            
        public void setDocument( DefaultStyledDocument doc ){
            
            this.doc = doc;
            
        }
            
        public void setLocation( int location ){
            
            this.location = location;
            
        }
        
        public void run(){
            
            try{
                
                doc.replace( location, data.length(), data, sas );
            }
            catch( BadLocationException ble ){}
            
        }
        
    }
    //@nonl
    //@-node:zorcanda!.20051201121445:TokenRunnable
    //@-others
    //@-node:zorcanda!.20051201121336:tokens
    //@+node:zorcanda!.20051031172925:run
    public void run(){
    
        while( true ){
        
        
            try{
            
                java.util.List l = queue.take();
                //System.out.println( l );
                //if( queue.size() > 0 ) System.out.println( queue.size() );
                colorizeline( (Integer)l.get( 0 ), (Integer)l.get( 1 ), l.get( 2 ) );
            
            }
            catch( Exception x ){}
        
        
        }
    
    
    
    
    
    }
    
    //@+at
    //         while 1:
    //             try:
    //                 spots = []
    //                 i = self.queue.take()
    //                 spots.append( i )
    //                 if self.queue.size():
    //                     self.queue.drainTo( spots )
    //                     spot1 = i[ 0 ]
    //                     length = i[ 1 ]
    //                     event = i[ 2 ]
    //                     for z in spots[ 1: ]:
    //                         if z[ 0 ] < spot1:
    //                             spot1 = z[ 0 ]
    //                         else:
    //                             add = z[ 0 ] - spot1
    //                             add += z[ 1 ]
    //                             length += add
    //                     i = ( spot1, length, event )
    // 
    //                 self.colorizeline( i )
    // 
    //             except java.lang.Exception, x:
    //                 print x
    //                 x.printStackTrace()
    //@-at
    //@nonl
    //@-node:zorcanda!.20051031172925:run
    //@+node:zorcanda!.20051031225905:ispossiblecomment
    public boolean ispossiblecomment( String word ){ 
    
        if( word.length() == 0 ) return false;
        for( String s: commenttokens ){
            if( s == null ) return false;
            if( s.startsWith( word ) ) return true;
        
        }
    return false; 
    //@+at
    //     for z in comments:
    //         if z:
    //             if z.startswith( word ): return True
    //     return False
    //@-at
    //@@c
    
    }
    public boolean ispossiblecomment( char c ){ 
    
        String word2 = Character.toString( c );
        for( String s: commenttokens ){
            if( s == null ) return false;
            if( s.startsWith( word2 ) ) return true;
        
        }
        return false; 
    
    
    }
    
    public boolean commentcontains( String word ){
    
        for( String s: commenttokens ){
            if( s == null ) return false;
            if( s.equals( word ) ) return true;
        
        }
        return false;
    
    }
    //@nonl
    //@-node:zorcanda!.20051031225905:ispossiblecomment
    //@+node:zorcanda!.20051102234301:class IgnoreRange
    public static class IgnoreRange{
    
        int start;
        int end;
        public IgnoreRange( int start, int end ){
        
            this.start = start;
            this.end = end;
            
        
        }
        
        public boolean spotafter( int spot ){
        
            return spot >= end;
        
        
        }
        
        public boolean spotbefore( int spot ){
        
            return spot < start;
        
        }
        
        public boolean spotignore( int spot ){
        
            if( spot >= start && spot <= end ) return true;
            return false;
        
        }
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051102234301:class IgnoreRange
    //@+node:zorcanda!.20051031155350.1:colorizeline
    public void colorizeline( int begin, int length, Object type ){
    
    
        //@    <<prolog>>
        //@+node:zorcanda!.20051031161826:<<prolog>>
            final leoEditorKit2.LeoDefaultStyledDocument doc = (leoEditorKit2.LeoDefaultStyledDocument)editor.getDocument();
            Map<String,AttributeSet> ctokens = cdeterminer.getColoredTokens();
            Element e = doc.getParagraphElement( begin );
            Element e2 = doc.getParagraphElement( begin + length );
            final int start = e.getStartOffset();
            final int end = e2.getEndOffset();
            String line = "";
            try{
                line = doc.getText( start, end - start );
            }
            catch( BadLocationException ble ){ return; }
            java.util.List<Token> w_atts = new ArrayList<Token>();
            //String sr1 = "<" + "<";
            //String sr2 = ">" + ">";
            final Map sec_refs = doc._srs;
            commenttokens = cdeterminer.getCommentTokens();
            boolean docing = false;
            String prevtoken = "\n";
        
        
        //@+at
        //         dtype = spots[ 2 ]
        //         begin = spots[ 0 ]
        //         ctokens = self.cdeterminer.getColoredTokens()
        //         e = stext.Utilities.getParagraphElement( self.editor, begin 
        // )
        //         e2 = stext.Utilities.getParagraphElement( self.editor, 
        // spots[ 0 ] + spots[ 1 ] )
        //         start = e.getStartOffset()
        //         end = e2.getEndOffset()
        //         doc = self.editor.getDocument()
        //         line = doc.getText( start, end - start )
        //         w_atts = []
        //         sr1 = "<" + "<"
        //         sr2 = ">" + ">"
        //         sec_refs = doc._srs
        //         comments = self.cdeterminer.getCommentTokens()
        //         docing = False
        //         prevtoken = "\n"
        //@-at
        //@nonl
        //@-node:zorcanda!.20051031161826:<<prolog>>
        //@nl
        JyLeoTokenizer jlt = new JyLeoTokenizer( line, start, commenttokens, doc, positions );
        for( String z: jlt ){
            //System.out.println("'" + z + "'" );
            //@        <<docing>>
            //@+node:zorcanda!.20051031155350.2:<<docing>>
            if( docing ){
                
                w_atts.add( new Token( z ) );
                if( z.equals( "@c" ) ) docing = false;
                prevtoken = z;
                continue;
            
            }
            
            
            
            //@+at
            //             if docing:
            //                 if z != "@c":
            //                     w_atts.append( ( z, "p" ) )
            //                 else:
            //                     docing = False
            //@-at
            //@nonl
            //@-node:zorcanda!.20051031155350.2:<<docing>>
            //@nl
            //@        <<string>>
            //@+node:zorcanda!.20051031155350.3:<<string>>
            if( z.startsWith ( "\"" ) || z.startsWith( "'" ) )
                w_atts.add( new Token( z ) );
            
            //@+at
            //             if z.startswith( '"' ) or z.startswith( "'" ):
            //                 w_atts.append( (  z , "p" ) )
            //@-at
            //@nonl
            //@-node:zorcanda!.20051031155350.3:<<string>>
            //@nl
            //@        <<comment>>
            //@+node:zorcanda!.20051031155350.4:<<comment>>
            else if( iscomment( z, commenttokens ) ) w_atts.add( new Token( z  ) );
            
            //@+at
            //             elif self.iscomment( z, comments ):
            //                 w_atts.append( ( z, "p" ) )
            //@-at
            //@nonl
            //@-node:zorcanda!.20051031155350.4:<<comment>>
            //@nl
            //@        <<section reference>>
            //@+node:zorcanda!.20051031155350.5:<<section reference>>
            else if( z.startsWith( sr1 ) && z.endsWith( sr2 ) ){
            
                String guts = z.substring( 2, z.length() - 2 );
                AttributeSet outer = ctokens.get( "<" + "<" );
                AttributeSet scolor;
                if( sec_refs.containsKey( guts ) )
                    scolor = cdeterminer.getSectionReferenceColor();
                else
                    scolor = cdeterminer.getUndefinedSectionReferenceColor();
            
                w_atts.add( new Token( sr1, outer ) );
                w_atts.add( new Token( guts, scolor ) );
                w_atts.add( new Token( sr2, outer ) );
            
            
            }
            
            
            //@+at
            //             elif z.startswith( sr1 ) and z.endswith( sr2 ):
            //                 guts = z[ 2: -2 ]
            //                 outer = ctokens.get( "<" + "<" )
            //                 if sec_refs.containsKey( guts ):
            //                     scolor = 
            // self.cdeterminer.getSectionReferenceColor()
            //                 else:
            //                     scolor = 
            // self.cdeterminer.getUndefinedSectionReferenceColor()
            //                 w_atts.append( ( sr1, outer ) )
            //                 w_atts.append( ( guts, scolor ) )
            //                 w_atts.append( ( sr2, outer ) )
            //@-at
            //@nonl
            //@-node:zorcanda!.20051031155350.5:<<section reference>>
            //@nl
            //@        <<else>>
            //@+node:zorcanda!.20051031155350.6:<<else>>
            else{
            
                if( isspace( z ) || ! ctokens.containsKey( z ) ){
                    if( z.startsWith( "@image " ) ){
                        SimpleAttributeSet sas = new SimpleAttributeSet();
                        String[] pieces = z.split( "\\s+" );
                        if( pieces.length >= 2 ){
                        
                            String path = pieces[ 1 ];
                            File test = new File( path );
                            if( !icons.containsKey( path ) && test.exists() && test.isFile() ){
                                
                                try{
                                  
                                    ImageIcon ii = new ImageIcon( path );
                                    icons.put( path, ii );
             
                                }
                                catch( Exception x ){ x.printStackTrace(); }
                            
                            }
                            if( icons.containsKey( path ) ){
                            
                                StyleConstants.setIcon( sas, icons.get( path ) );
                            
                            }
                        
                        
                        }
                        Token itoken = new TokenRunnable( z, sas );
                        w_atts.add( itoken );
                    
                    }
                    //@        <<plugins>>
                    //@+node:zorcanda!.20051201121102:<<plugins>>
                    else if( z.startsWith( "@plugin " ) ){
                        SimpleAttributeSet sas = new SimpleAttributeSet();
                        String[] pieces = z.split( "\\s+" );
                        if( pieces.length >= 2 ){
                                
                            String plugin = pieces[ 1 ];
                         
                            if( plugins.containsKey( plugin ) ){
                                
                                StyleConstants.setComponent( sas, plugins.get( plugin ) );
                                    
                            }
                        
                        }
                        Token itoken = new TokenRunnable( z, sas );
                        w_atts.add( itoken );
                            
                    }
                    //@nonl
                    //@-node:zorcanda!.20051201121102:<<plugins>>
                    //@nl
                    else if( !isletterdigit( z ) ) w_atts.add( new Token( z, cdeterminer.getPunctuationColor() ) );
                    else if( isspace( z ) ) w_atts.add( new Token( z  )); 
                    else if( isnumeric( z ) ) w_atts.add( new Token( z, cdeterminer.getNumericColor() ) );
                    else w_atts.add( new Token( z, null ) );
                
                
                }
                else{
                
                    w_atts.add( new Token( z, ctokens.get( z ) ) );
                    if( z.equals( "@" ) && prevtoken.equals( "\n" ) ) docing = true;
                    
                    }
            
            
            }
            
            
            //@+at
            //             else:
            //                 if z.isspace() or not ctokens.containsKey( z ):
            //                     if z in string.punctuation:
            //                         w_atts.append( ( z, 
            // self.cdeterminer.getPunctuationColor() ) )
            //                     elif z.isspace():
            //                         w_atts.append(( z, "p" ))
            //                     elif z.isnumeric():
            //                         nsas = stext.SimpleAttributeSet()
            //                         stext.StyleConstants.setForeground( 
            // nsas, java.awt.Color.ORANGE )
            //                         w_atts.append( ( z, nsas ) )
            //                     else:
            //                         w_atts.append( ( z, None ) )
            //                 else:
            //                     w_atts.append( ( z, ctokens.get( z ) ) )
            //                     if z == "@" and prevtoken.endswith( "\n" ): 
            // docing = True
            //@-at
            //@-node:zorcanda!.20051031155350.6:<<else>>
            //@nl
        
        
            prevtoken = z; 
        
        
        }
    
        SimpleAttributeSet sas = new SimpleAttributeSet();
        StyleConstants.setForeground( sas, editor.getForeground() );
        //System.out.println( w_atts );
        if( positions.size() > 0 ){
            Collections.sort( positions, compare );
            Iterator<PositionCarrier> pi = positions.iterator();
            while( pi.hasNext() ){
                PositionCarrier pc = pi.next();
                boolean ok = pc.isValid( doc );
                if( !ok ){
                
                    pi.remove();
                    int offset = pc.pos.getOffset();
                    if( offset == begin && type == DocumentEvent.EventType.REMOVE ){
            
                        Element re = doc.getParagraphElement( begin );
                        int start2 = re.getStartOffset();
                        colorizeline( start2, doc.getLength() - start2, null );
                        return;
            
                    }
                
                }
                
            }     
            
        }
        int offset1 = -1;
        int offset2 = -1;
        int blength = begin + length;
        boolean ignorecolor = false;
        int ignorenum = -1;
        //@    <<colorize positions>>
        //@+node:zorcanda!.20051031180404:<<colorize positions>>
        //if( positions.size() == 0 ) return;
        //System.out.println( positions );
        AttributeSet scolor = cdeterminer.getStringColor();
        AttributeSet scolor2 = cdeterminer.getDocColor();
        AttributeSet commentcolor = cdeterminer.getCommentColor();
        String coloring = null;
        int colorstart = -1;
        int ignore1 = -1;
        int ignore2 = -1;
        java.util.List<Integer> offsets = new ArrayList<Integer>();
        //@<<iterate>>
        //@+node:zorcanda!.20051031181357:<<iterate>>
        for( PositionCarrier z: positions ){
        
            //System.out.println( z );
            //@    <<part1>>
            //@+node:zorcanda!.20051031181536:<<part1>>
            try{
            
                int offset = z.pos.getOffset();
                if( offset > end && coloring == null ) break;
                //String item = doc.getText( offset, 1 );
                /*if( !z.isValid( doc ) ){
                    positions.remove( z );
                    if( offset == begin && type == DocumentEvent.EventType.REMOVE ){
                    
                        int start2 = Utilities.getRowStart( editor, begin );
                        colorizeline( start2, doc.getLength() - start2, null );
                        return;
                    
                    }
                    continue;
                
                }*/
                if( offsets.contains( offset ) ){
                    positions.remove( z );
                    if( offset == begin && type == DocumentEvent.EventType.REMOVE ){
                        Element er = doc.getParagraphElement( begin );
                        int start2 = er.getStartOffset();
                        colorizeline( start2, doc.getLength() - start2, null );
                        return;       
                    }
                    continue;
                
                }
                offsets.add( offset );
            
            
            }
            catch( Exception x ){ 
                positions.remove( z ); 
                continue;    
            }
            
            
            //@+at
            //             try:
            //                 offset = z[ 0 ].getOffset()
            //                 if offset > end and not coloring:
            //                     #print "RETURNING!!!!!"
            //                     return
            //                 item = doc.getText( z[ 0 ].getOffset(), 1 )
            //                 if item != z[ 1 ]:
            //                     self.positions.remove( z )
            //                     if z[ 0 ].getOffset() == spots[ 0 ] and 
            // dtype == sevent.DocumentEvent.EventType.REMOVE:
            //                         start = stext.Utilities.getRowStart( 
            // self.editor, spots[ 0 ] )
            //                         return self.colorizeline( ( start, 
            // doc.getLength() - start, None ))
            //                     continue
            //                 if z[ 0 ].getOffset() in offsets:
            //                     self.positions.remove( z )
            //                     if dtype == 
            // sevent.DocumentEvent.EventType.REMOVE and z[ 0 ].getOffset() == 
            // spots[ 0 ]:
            //                         start = stext.Utilities.getRowStart( 
            // self.editor, spots[ 0 ] )
            //                         return self.colorizeline( ( start, 
            // doc.getLength() - start, None ))
            //                     continue
            //                 offsets.append( z[ 0 ].getOffset() )
            //             except java.lang.Exception, x:
            //                 self.positions.remove( z )
            //                 continue
            //@-at
            //@nonl
            //@-node:zorcanda!.20051031181536:<<part1>>
            //@nl
            //@    <<part2>>
            //@+node:zorcanda!.20051031181536.1:<<part2>>
            if( coloring == null ){
            
                coloring = z.c;
                colorstart = z.pos.getOffset();
                if( colorstart > ignore1 && colorstart < ignore2 ){
                    coloring = null;
                    continue;
                
                }
                
            
                //@    <<handle possible doc>>
                //@+node:zorcanda!.20051031182951:<<handle possible doc>>
                //System.out.println( "COLRING2:" + coloring );
                if( coloring.equals( "@" ) ){
                
                    try{
                        //int end2 = Utilities.getWordEnd( editor, colorstart + 1 );
                        Element wend = doc.getParagraphElement( colorstart + 1 );
                        String test = doc.getText( colorstart + 1, wend.getEndOffset() - ( colorstart + 1 ) );
                        String[] tokens = test.split( "\\s", 2 );
                        int end2 = colorstart + 1 + tokens[ 0 ].length();
                        Element para = doc.getParagraphElement( colorstart );
                        int start2 = para.getStartOffset();
                        String txt = doc.getText( colorstart, end2 - colorstart ).trim();
                        //System.out.println( "TEXT IS:" + txt );
                        if( !txt.equals( "@" ) || start2 != colorstart ){
                            coloring = null;
                            //System.out.println ("NO COLORING!!" + txt );
                            if( colorstart + 1 == begin && type == DocumentEvent.EventType.REMOVE ){
                                colorizeline(  colorstart, doc.getLength() - colorstart, null );
                                return;
                        
                            }
                    
                    
                        }
                    }
                    catch( BadLocationException ble ){}
                
                }
                
                //@+at
                // if coloring == '@':
                //                     end2 = stext.Utilities.getWordEnd( 
                // self.editor, colorstart + 1 )
                //                     start2 = stext.Utilities.getRowStart( 
                // self.editor, colorstart )
                //                     txt = doc.getText( colorstart , end2 - 
                // colorstart )
                //                     if txt.strip() not in ( "@", ) or 
                // start2 != colorstart:
                //                         coloring = None
                //                         if dtype == 
                // sevent.DocumentEvent.EventType.INSERT and colorstart + 1 == 
                // spots[ 0 ]:
                //                             return self.colorizeline( ( 
                // colorstart, doc.getLength() - colorstart, None ) )
                //@-at
                //@nonl
                //@-node:zorcanda!.20051031182951:<<handle possible doc>>
                //@nl
                //@    <<handle possible comment>>
                //@+node:zorcanda!.20051031183050:<<handle possible comment>>
                else if( coloring != null && ispossiblecomment( coloring ) ){
                    
                    try{   
                        int l1 = commenttokens[ 0 ].length();
                        String txt = doc.getText( colorstart, l1 );
                        if( txt.equals( commenttokens[ 0 ] ) ){
                    
                            Element pe = doc.getParagraphElement( colorstart );
                            int end2 = pe.getEndOffset();
                            doc.setCharacterAttributes( colorstart, end2 - colorstart, commentcolor, true );
                            if( begin >= colorstart && blength <= end2 ) ignorecolor = true;
                            ignore1 = colorstart; ignore2 = end2;
                            coloring = null;
                    
                    
                        }
                        else if ( txt.equals( commenttokens[ 1 ] )  );
                        else coloring = null;
                    }
                    catch( BadLocationException ble ){ return; }
                
                }
                
                
                
                //@+at
                // elif coloring and self.ispossiblecomment( coloring, 
                // comments ):
                //                     l1 = len( comments[ 0 ] )
                //                     txt = doc.getText( colorstart, l1 )
                //                     if txt == comments[ 0 ]:
                //                         e = 
                // stext.Utilities.getParagraphElement( self.editor, 
                // colorstart )
                //                         end2 = e.getEndOffset()
                //                         doc.setCharacterAttributes( 
                // colorstart, end2 - colorstart, commentcolor, 1 )
                //                         ignore1 = colorstart;ignore2 = end2
                //                         coloring = None
                //                     elif txt == comments[ 1 ]:
                //                         pass
                //                     else:
                //                         coloring = None
                //@-at
                //@nonl
                //@-node:zorcanda!.20051031183050:<<handle possible comment>>
                //@nl
                continue;
            }
            //@<<handle string>>
            //@+node:zorcanda!.20051031183050.1:<<handle string>>
            if( coloring.equals( "\"" ) || coloring.equals( "'" ) ){
            
                if( z.c.equals( coloring ) ){
            
                        //System.out.println( "HANDLING COLORING!!" );
                        int eoffset = z.pos.getOffset();
                        int emarker = doc.getParagraphElement( eoffset ).getEndOffset();
                        Element cs = doc.getCharacterElement( colorstart );
                        Element ce = doc.getCharacterElement( eoffset );
                        //try{
                        //System.out.println( doc.getText( colorstart, eoffset + 1 - colorstart ) );
                        //}
                        //catch( BadLocationException ble ){}
                        if( cs.getAttributes().isEqual( scolor ) && ce.getAttributes().isEqual( scolor ) &&
                            ( blength < colorstart || begin > emarker ));
                        else doc.setCharacterAttributes( colorstart, eoffset + 1 - colorstart, scolor, true );
                        if( begin >= colorstart && blength <= eoffset ) ignorecolor = true;
                        if( eoffset < begin && begin < emarker ) ignorenum = eoffset;
                        coloring = null;
                        if( eoffset == begin && type == DocumentEvent.EventType.INSERT ){
                            colorizeline( colorstart, doc.getLength() - colorstart, null );
                            return;
                    
                        }
            
                
                }
            
            }
            
            
            //@+at
            //             if coloring in ( "'", '"' ):
            //                 if z[ 1 ] == coloring:
            //                     eoffset = z[ 0 ].getOffset()
            //                     emarker = stext.Utilities.getRowEnd( 
            // self.editor, eoffset )
            //                     cs = doc.getCharacterElement( colorstart )
            //                     ce = doc.getCharacterElement( eoffset )
            //                     if cs.getAttributes().isEqual( scolor )\
            //                     and ce.getAttributes().isEqual( scolor )\
            //                     and ( begin < colorstart or begin > emarker 
            // ):
            //                         pass
            //                     else:
            //                         doc.setCharacterAttributes( colorstart, 
            // eoffset + 1  - colorstart, scolor, 1 )
            //                     coloring = None
            //                     if dtype == 
            // sevent.DocumentEvent.EventType.INSERT and eoffset == spots[ 0 
            // ]:
            //                         return self.colorizeline( ( colorstart, 
            // doc.getLength() - colorstart, None ) )
            //@-at
            //@nonl
            //@-node:zorcanda!.20051031183050.1:<<handle string>>
            //@nl
            //@<<finish coloring doc>>
            //@+node:zorcanda!.20051031183222:<<finish coloring doc>>
            else if( coloring.equals( "@" ) ){
            
                try{
                
                    int offset = z.pos.getOffset();
                    //int end2 = Utilities.getWordEnd( editor, offset + 1 );
                    Element para = doc.getParagraphElement( offset );
                    int start2 = para.getStartOffset();
                    String text = doc.getText( start2, para.getEndOffset() - start2 );
                    String[] linesplit = text.split( "\\s", 2 );
                    int end2 = start2 + linesplit[ 0 ].length();
                    if( start2 == offset ){
                        String txt = doc.getText( start2, end2 - start2 ).trim();
                        if( txt.equals( "@c" ) ){
                            
                            Element cs = doc.getCharacterElement( colorstart + 1 );
                            Element ce = doc.getCharacterElement( offset -1 );
                            if( begin >= colorstart && blength <= end2 ) ignorecolor = true;
                            if( cs.getAttributes().isEqual( scolor2 ) && ce.getAttributes().isEqual( scolor2 ) &&
                                ( blength < colorstart || begin > end2 ) );
                            else{
                                
                                if( colorstart < begin ){ 
                                    Element pg = doc.getParagraphElement( begin );
                                    if( type == DocumentEvent.EventType.INSERT ){
                                        int starto = pg.getStartOffset();
                                        int endo = pg.getEndOffset();
                                        doc.setCharacterAttributes( starto, endo - starto , scolor2, true );
            
                                    }
                                    else{
                                
                                        int starto = pg.getStartOffset();
                                        doc.setCharacterAttributes( starto, ce.getStartOffset() - starto, scolor2, true );
                                        
                                    }
                                }
                                else{
                                 doc.setCharacterAttributes( cs.getStartOffset(), ce.getEndOffset() - cs.getStartOffset(), scolor2, true );
                                 
                                }
                                if( ctokens.containsKey( txt ) ){
                                    AttributeSet dsas = ctokens.get( txt );
                                    doc.setCharacterAttributes( offset, 2, dsas, true );
                                    doc.setCharacterAttributes( colorstart, 1, dsas, true );
                                }
                            }
                            coloring = null;
                            if( start2 + 1 == begin && type == DocumentEvent.EventType.INSERT ){
                                colorizeline(  start2, doc.getLength() - start2, null );
                                return;
                        
                            }
                        }
                    
                    
                    
                    
                    }
                
                
                
                }
                catch( BadLocationException ble ){}
            
            
            
            
            }
            
            
            
            //@+at
            // elif coloring in( "@", ):
            //                 try:
            //                     offset = z[ 0 ].getOffset()
            //                     end2 = stext.Utilities.getWordEnd( 
            // self.editor, offset + 1 )
            //                     start2 = stext.Utilities.getRowStart( 
            // self.editor, offset )
            //                     if start2 == offset:
            //                         txt = doc.getText( start2 , end2 - 
            // start2 )
            //                         if txt.strip() in ("@c", ):
            //                             cs = doc.getCharacterElement( 
            // colorstart + 1 )
            //                             ce = doc.getCharacterElement( 
            // offset )
            //                             if cs.getAttributes().isEqual( 
            // scolor2 )\
            //                             and ce.getAttributes().isEqual( 
            // scolor2 )\
            //                             and ( begin < colorstart or begin > 
            // end2 ):
            //                                 pass
            //                             else:
            //                                 doc.setCharacterAttributes( 
            // colorstart + 1, offset - colorstart -1, scolor2, 1 )
            //                             coloring = None
            //                             if dtype == 
            // sevent.DocumentEvent.EventType.INSERT and start2 + 1 == spots[ 
            // 0 ]:
            //                                 return self.colorizeline( ( 
            // start2, doc.getLength() - start2, None ) )
            //                 except java.lang.Exception, x:
            //                     pass
            //@-at
            //@nonl
            //@-node:zorcanda!.20051031183222:<<finish coloring doc>>
            //@nl
            //@<<finish coloring comment>>
            //@+node:zorcanda!.20051031183222.1:<<finish coloring comment>>
            else if( coloring != null && ispossiblecomment( coloring ) ){
            
                try{
                    String cend = commenttokens[ 2 ];
                    int offset = z.pos.getOffset();
                    String txt = doc.getText( offset, cend.length() );
                    //System.out.println( txt );
                    if( txt.equals( cend ) ){
                
                        Element cs = doc.getCharacterElement( colorstart );
                        Element ce = doc.getCharacterElement( offset + cend.length() );
                        if( begin >= colorstart && blength <= offset ) ignorecolor = true;
                        if( cs.getAttributes().isEqual( commentcolor ) && ce.getAttributes().isEqual( commentcolor ) &&
                            ( blength < colorstart || begin > offset ) );
                        else
                            doc.setCharacterAttributes( colorstart, ( offset + cend.length() ) -colorstart, commentcolor, true );
                        coloring = null;
                        if( ( offset <= begin && offset + cend.length() >= begin ) && type == DocumentEvent.EventType.INSERT ){
                            colorizeline( offset, doc.getLength() - offset, null );
                            return;
                    
                        }
                
                    }
                }
                catch( BadLocationException ble ){ return; }
            
            
            }
            
            
            
            
            //@+at
            // elif coloring and self.ispossiblecomment( coloring, comments ):
            //                 cend = comments[ 2 ]
            //                 offset = z[ 0 ].getOffset()
            //                 txt = doc.getText( offset, len( cend ) )
            //                 if txt == cend:
            //                     cs = doc.getCharacterElement( colorstart )
            //                     ce = doc.getCharacterElement( offset + len( 
            // cend ) )
            //                     if cs.getAttributes().isEqual( commentcolor 
            // )\
            //                     and ce.getAttributes().isEqual( 
            // commentcolor )\
            //                     and ( begin < colorstart or begin > offset 
            // ):
            //                         pass
            //                     else:
            //                         doc.setCharacterAttributes( colorstart, 
            // (offset + len( cend ) ) -colorstart, commentcolor, 1 )
            //                     coloring = None
            //                     if dtype == 
            // sevent.DocumentEvent.EventType.INSERT and ( offset <= spots[ 0 
            // ] and offset + len( cend ) >= spots[ 0 ] ):
            //                         return self.colorizeline( ( offset, 
            // doc.getLength() - offset, None ) )
            //@-at
            //@-node:zorcanda!.20051031183222.1:<<finish coloring comment>>
            //@nl
            
            
            //@-node:zorcanda!.20051031181536.1:<<part2>>
            //@nl
        
        
        }
        //@<<finish coloring>>
        //@+node:zorcanda!.20051031183222.2:<<finish coloring>>
        if( coloring != null ){
        
            if( coloring.equals( "\"" ) || coloring.equals( "'" ) );
            else if( coloring.equals( "@" ) ){
                
                colorstart += 1;
                scolor = scolor2;
            
            
            }
            else scolor = commentcolor;
            doc.setCharacterAttributes( colorstart, doc.getLength() - colorstart, scolor, true );
            if( colorstart <= begin ) ignorecolor = true;
        
        }
        //@nonl
        //@-node:zorcanda!.20051031183222.2:<<finish coloring>>
        //@nl
        //@nonl
        //@-node:zorcanda!.20051031181357:<<iterate>>
        //@nl
        //@nonl
        //@-node:zorcanda!.20051031180404:<<colorize positions>>
        //@nl
        //System.out.println( "IGNORE? " + ignorecolor );
        if( !ignorecolor ) color( start, w_atts, (leoEditorKit2.LeoDefaultStyledDocument)doc, sas, ignorenum );
            
    
    
    
    }
    //@+at
    // for z in JyLeoTokenizer( line, start, comments, doc, self.positions ):
    //             #print "'%s'" % z
    //             if docing:
    //                 if z != "@c":
    //                     w_atts.append( ( z, "p" ) )
    //                 else:
    //                     docing = False
    //             if z.startswith( '"' ) or z.startswith( "'" ):
    //                 w_atts.append( (  z , "p" ) )
    //             elif self.iscomment( z, comments ):
    //                 w_atts.append( ( z, "p" ) )
    //             elif z.startswith( sr1 ) and z.endswith( sr2 ):
    //                 guts = z[ 2: -2 ]
    //                 outer = ctokens.get( "<" + "<" )
    //                 if sec_refs.containsKey( guts ):
    //                     scolor = 
    // self.cdeterminer.getSectionReferenceColor()
    //                 else:
    //                     scolor = 
    // self.cdeterminer.getUndefinedSectionReferenceColor()
    //                 w_atts.append( ( sr1, outer ) )
    //                 w_atts.append( ( guts, scolor ) )
    //                 w_atts.append( ( sr2, outer ) )
    //             else:
    //                 if z.isspace() or not ctokens.containsKey( z ):
    //                     if z in string.punctuation:
    //                         w_atts.append( ( z, 
    // self.cdeterminer.getPunctuationColor() ) )
    //                     elif z.isspace():
    //                         w_atts.append(( z, "p" ))
    //                     elif z.isnumeric():
    //                         nsas = stext.SimpleAttributeSet()
    //                         stext.StyleConstants.setForeground( nsas, 
    // java.awt.Color.ORANGE )
    //                         w_atts.append( ( z, nsas ) )
    //                     else:
    //                         w_atts.append( ( z, None ) )
    //                 else:
    //                     w_atts.append( ( z, ctokens.get( z ) ) )
    //                     if z == "@" and prevtoken.endswith( "\n" ): docing 
    // = True
    //             prevtoken = z
    //@-at
    //@+node:zorcanda!.20051031180404.1:python code...
    //@+at
    //         copyofp = copy.copy( self.positions )
    //         #print copyofp.__class__
    //         copyofp.sort( self.sortp )
    //         scolor = self.cdeterminer.getStringColor()
    //         scolor2 = self.cdeterminer.getDocColor()
    //         coloring = None
    //         colorstart = -1
    //         #print self.positions
    //         offsets = []
    //         comments = self.cdeterminer.getCommentTokens()
    //         commentcolor = self.cdeterminer.getCommentColor()
    //         #copyofp = copy.copy( self.positions )
    // 
    // 
    //         ignore1 = ignore2 = -1
    //         #print copyofp
    //         for z in copyofp:
    //             try:
    //                 offset = z[ 0 ].getOffset()
    //                 if offset > end and not coloring:
    //                     #print "RETURNING!!!!!"
    //                     return
    //                 item = doc.getText( z[ 0 ].getOffset(), 1 )
    //                 if item != z[ 1 ]:
    //                     self.positions.remove( z )
    //                     if z[ 0 ].getOffset() == spots[ 0 ] and dtype == 
    // sevent.DocumentEvent.EventType.REMOVE:
    //                         start = stext.Utilities.getRowStart( 
    // self.editor, spots[ 0 ] )
    //                         return self.colorizeline( ( start, 
    // doc.getLength() - start, None ))
    //                     continue
    //                 if z[ 0 ].getOffset() in offsets:
    //                     self.positions.remove( z )
    //                     if dtype == sevent.DocumentEvent.EventType.REMOVE 
    // and z[ 0 ].getOffset() == spots[ 0 ]:
    //                         start = stext.Utilities.getRowStart( 
    // self.editor, spots[ 0 ] )
    //                         return self.colorizeline( ( start, 
    // doc.getLength() - start, None ))
    //                     continue
    //                 offsets.append( z[ 0 ].getOffset() )
    //             except java.lang.Exception, x:
    //                 self.positions.remove( z )
    //                 continue
    //             if not coloring:
    //                 coloring = z[ 1 ]
    //                 colorstart = z[ 0 ].getOffset()
    //                 if colorstart > ignore1 and colorstart < ignore2:
    //                     #print "IGNORING %s" % coloring
    //                     coloring = None
    //                     continue
    //                 if coloring == '@':
    //                     end2 = stext.Utilities.getWordEnd( self.editor, 
    // colorstart + 1 )
    //                     start2 = stext.Utilities.getRowStart( self.editor, 
    // colorstart )
    //                     txt = doc.getText( colorstart , end2 - colorstart )
    //                     if txt.strip() not in ( "@", ) or start2 != 
    // colorstart:
    //                         coloring = None
    //                         if dtype == 
    // sevent.DocumentEvent.EventType.INSERT and colorstart + 1 == spots[ 0 ]:
    //                             return self.colorizeline( ( colorstart, 
    // doc.getLength() - colorstart, None ) )
    //                 elif coloring and self.ispossiblecomment( coloring, 
    // comments ):
    //                     l1 = len( comments[ 0 ] )
    //                     txt = doc.getText( colorstart, l1 )
    //                     if txt == comments[ 0 ]:
    //                         e = stext.Utilities.getParagraphElement( 
    // self.editor, colorstart )
    //                         end2 = e.getEndOffset()
    //                         doc.setCharacterAttributes( colorstart, end2 - 
    // colorstart, commentcolor, 1 )
    //                         ignore1 = colorstart;ignore2 = end2
    //                         coloring = None
    //                     elif txt == comments[ 1 ]:
    //                         pass
    //                     else:
    //                         coloring = None
    //                 continue
    //             if coloring in ( "'", '"' ):
    //                 if z[ 1 ] == coloring:
    //                     eoffset = z[ 0 ].getOffset()
    //                     emarker = stext.Utilities.getRowEnd( self.editor, 
    // eoffset )
    //                     cs = doc.getCharacterElement( colorstart )
    //                     ce = doc.getCharacterElement( eoffset )
    //                     if cs.getAttributes().isEqual( scolor )\
    //                     and ce.getAttributes().isEqual( scolor )\
    //                     and ( begin < colorstart or begin > emarker ):
    //                         pass
    //                     else:
    //                         doc.setCharacterAttributes( colorstart, eoffset 
    // + 1  - colorstart, scolor, 1 )
    //                     coloring = None
    //                     if dtype == sevent.DocumentEvent.EventType.INSERT 
    // and eoffset == spots[ 0 ]:
    //                         return self.colorizeline( ( colorstart, 
    // doc.getLength() - colorstart, None ) )
    //             elif coloring in( "@", ):
    //                 try:
    //                     offset = z[ 0 ].getOffset()
    //                     end2 = stext.Utilities.getWordEnd( self.editor, 
    // offset + 1 )
    //                     start2 = stext.Utilities.getRowStart( self.editor, 
    // offset )
    //                     if start2 == offset:
    //                         txt = doc.getText( start2 , end2 - start2 )
    //                         if txt.strip() in ("@c", ):
    //                             cs = doc.getCharacterElement( colorstart + 
    // 1 )
    //                             ce = doc.getCharacterElement( offset )
    //                             if cs.getAttributes().isEqual( scolor2 )\
    //                             and ce.getAttributes().isEqual( scolor2 )\
    //                             and ( begin < colorstart or begin > end2 ):
    //                                 pass
    //                             else:
    //                                 doc.setCharacterAttributes( colorstart 
    // + 1, offset - colorstart -1, scolor2, 1 )
    //                             coloring = None
    //                             if dtype == 
    // sevent.DocumentEvent.EventType.INSERT and start2 + 1 == spots[ 0 ]:
    //                                 return self.colorizeline( ( start2, 
    // doc.getLength() - start2, None ) )
    //                 except java.lang.Exception, x:
    //                     pass
    //             elif coloring and self.ispossiblecomment( coloring, 
    // comments ):
    //                 cend = comments[ 2 ]
    //                 offset = z[ 0 ].getOffset()
    //                 txt = doc.getText( offset, len( cend ) )
    //                 if txt == cend:
    //                     cs = doc.getCharacterElement( colorstart )
    //                     ce = doc.getCharacterElement( offset + len( cend ) 
    // )
    //                     if cs.getAttributes().isEqual( commentcolor )\
    //                     and ce.getAttributes().isEqual( commentcolor )\
    //                     and ( begin < colorstart or begin > offset ):
    //                         pass
    //                     else:
    //                         doc.setCharacterAttributes( colorstart, (offset 
    // + len( cend ) ) -colorstart, commentcolor, 1 )
    //                     coloring = None
    //                     if dtype == sevent.DocumentEvent.EventType.INSERT 
    // and ( offset <= spots[ 0 ] and offset + len( cend ) >= spots[ 0 ] ):
    //                         return self.colorizeline( ( offset, 
    // doc.getLength() - offset, None ) )
    //         if coloring:
    //             if coloring in ( "'", '"' ):
    //                 pass
    //             elif coloring == "@":
    //                 colorstart += 1
    //                 scolor = scolor2
    //             else:
    //                 scolor = commentcolor
    //             doc.setCharacterAttributes( colorstart, doc.getLength() - 
    // colorstart, scolor, 1 )
    //@-at
    //@nonl
    //@-node:zorcanda!.20051031180404.1:python code...
    //@-node:zorcanda!.20051031155350.1:colorizeline
    //@+node:zorcanda!.20051031160521:color
    public void color( int spot, java.util.List<Token> c_atts, final leoEditorKit2.LeoDefaultStyledDocument doc, AttributeSet bsas, int ignore ){
        
        for( Token z: c_atts ){
            final int size = z.data.length();
            if( !z.ignore() && spot > ignore ){
                final AttributeSet sas;
                if( z.sas != null ) sas = z.sas;
                else sas = bsas;
                Element cs = doc.getCharacterElement( spot );
                Element ce = doc.getCharacterElement( spot + size -1 );
                if( !(cs.getAttributes().isEqual( sas ) && ce.getAttributes().isEqual( sas ) ) ){
    
                    if( z instanceof TokenRunnable ){
                    
                        TokenRunnable tr = (TokenRunnable)z;
                        tr.setLocation( spot );
                        tr.setDocument( doc );
                        try{
                            if( EventQueue.isDispatchThread() ) tr.run();
                            else
                                SwingUtilities.invokeAndWait( tr );
                        }
                        catch( InterruptedException ie ){}
                        catch( InvocationTargetException ie ){}
                        
                    }
                    else doc.setCharacterAttributes( spot, size, sas, true );
    
                }
            
            }
            spot += size;
        
        
        }
    
    
    
    
    
    }
    
    
    
    
    
    //@+at
    // def color( self, spot, c_atts, doc, bsas ):
    // 
    //     for z in c_atts:
    //         size = len( z[ 0 ] )
    //         #print "COLOR:'%s', %s, '%s', %s" % (z[ 0 ], self.spot, 
    // self.doc.getText( self.spot, size ) , size )
    //         sas = z[ 1 ]
    //         if not sas: sas = bsas
    //         try:
    //             cs = doc.getCharacterElement( spot )
    //             ce = doc.getCharacterElement( spot + size -1 )
    //             if sas != "p" and not ( cs.getAttributes().isEqual( sas ) 
    // and ce.getAttributes().isEqual( sas ) ):
    //                 doc.setCharacterAttributes( spot, size, sas , 1 )
    //             #else:
    //             #    print "pass %s" % sas
    //         except java.lang.Exception:
    //             pass
    //         spot += size
    //@-at
    //@-node:zorcanda!.20051031160521:color
    //@+node:zorcanda!.20051031160836:isspace and isletterdigit
    public boolean isspace( String s ){
    
        for( char c: s.toCharArray() ){
        
            if( !Character.isWhitespace( c ) ) return false;
        
        
        }
    
        return true;
    
    }
    
    public boolean isnumeric( String s ){
    
        for( char c: s.toCharArray() ){
        
            if( !Character.isDigit( c ) ) return false;
        
        
        }
    
        return true;
    
    
    
    }
    
    
    public boolean isletterdigit( String s ){
    
        for( char c: s.toCharArray() ){
        
            if( Character.isLetterOrDigit( c ) || Character.isWhitespace( c ) ) continue;
            return false;
        
        }
    
        return true;
    
    
    
    }
    
    public boolean iscomment( String word, String[] comments ){
    
        for( String s: comments ){
            
            if( s == null ) return false;
            else if( word.startsWith( s ) ) return true;
        
        }
    
        return false;
    
    }
    //@nonl
    //@-node:zorcanda!.20051031160836:isspace and isletterdigit
    //@+node:zorcanda!.20051130161206:class ImmutableAttributeSet
    //@+at
    // public static class ImmutableAttributeSet implements AttributeSet{
    // 
    //     AttributeSet guts;
    //     public ImmutableAttributeSet( AttributeSet guts ){
    //         this.guts = guts;
    //     }
    // 	public boolean containsAttribute(Object name, Object value){
    //         return guts.containsAttribute( name, value );
    //     }
    //     public boolean containsAttributes(AttributeSet attributes){
    //         return guts.containsAttributes( attributes );
    //     }
    // 
    // 
    // 
    // 
    // 
    // }
    //@-at
    //@nonl
    //@-node:zorcanda!.20051130161206:class ImmutableAttributeSet
    //@-others


}
//@nonl
//@-node:zorcanda!.20051031155350:@thin ColorizerRunnable.java
//@-leo
