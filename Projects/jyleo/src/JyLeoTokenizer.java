//@+leo-ver=4-thin
//@+node:zorcanda!.20051031112704:@thin JyLeoTokenizer.java
//@@language java
import java.util.*;
import javax.swing.text.*;
import java.util.regex.*;
//import org.python.core.*;

public class JyLeoTokenizer implements Iterator< String >, Iterable<String>{

    String data;
    char[] cdata;
    int beginspot;
    int spot;
    StringBuilder cword;
    String[] commenttokens;
    List<String> yieldproxy;
    List<PositionCarrier> positions;
    Document doc;
    boolean escaping;
    Matcher matcher;
    
    public JyLeoTokenizer( String data, int beginspot, String[] commenttokens, Document doc, List<PositionCarrier> positions ){
    

        this.data = data;
        cdata = data.toCharArray();
        this.beginspot = beginspot -1;
        this.spot = -1;
        this.cword = new StringBuilder();
        this.commenttokens =  commenttokens; //new String[ commenttokens.length ];
        escaping = false;
        yieldproxy = new LinkedList<String>();
        this.doc = doc;
        this.positions = positions;
        Pattern p = Pattern.compile( "\\s+[^\\s]+" );
        matcher = p.matcher( "" );
        
    }
    
    public Iterator<String> iterator(){ return this; }
    
    public boolean hasNext(){
    
        return ( yieldproxy.size() != 0 || spot + 1 < data.length() );
    
    }
    
    public void remove(){}

    //@    @+others
    //@+node:zorcanda!.20051031120707:isSpace
    public boolean isSpace( StringBuilder sb ){
        
        if( sb.length() == 0 ) return false;
        for( int i = 0; i < sb.length(); i++ )
            if( !Character.isWhitespace( sb.charAt( i ) ) ) return false; 
    
        return true;
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051031120707:isSpace
    //@+node:zorcanda!.20051031121044:ispossiblecomment
    public boolean ispossiblecomment( StringBuilder word ){ 
    
        if( word.length() == 0 ) return false;
        String word2 = word.toString();
        for( String s: commenttokens ){
            if( s == null ) return false;
            if( s.startsWith( word2 ) ) return true;
        
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
    //@-node:zorcanda!.20051031121044:ispossiblecomment
    //@+node:zorcanda!.20051031121120:addPosition
    public void addPosition( int i, char c ){
    
        boolean ok = true;
        List<PositionCarrier> positions2 = new ArrayList<PositionCarrier>();
        positions2.addAll( positions );
        for( PositionCarrier p: positions2 ){
        
            int offset = p.pos.getOffset();
            char c2 = p.c.charAt( 0 );
            if( i == offset && c2 == c ){
                ok = false;
                break;
            
            
            }
            else if( i == offset && c != c2 ){
                //System.out.println( "REMOVING " + o + "for " + i + " " + c );
                 positions.remove( p );
                 
            }
        
        }
        if( ok ){
        
            try{
                
                Position pos = doc.createPosition( i );
                PositionCarrier pc = new PositionCarrier( pos , Character.toString( c ) );
                positions.add( pc );
                //System.out.println( "POSITIONS NOW:" + positions );
                
            }
            catch( BadLocationException ble ){}
            
        
        }
    
    
    }
    //@+at
    //     ok = True
    //     #oset = z[ 0 ].getOffset()
    //     #start = java.lang.System.currentTimeMillis()
    //     for z in copy.copy( self.positions ):
    //         oset = z[ 0 ].getOffset()
    //         c2 = z[ 1 ]
    //         if i == oset and c2 == c:
    //             ok = False
    //             break
    //         elif i == oset and c2 != c:
    //             self.positions.remove( z )
    //     if ok:
    //         data2 = ( doc.createPosition( i ), c )
    //         self.positions.append( data2 )
    // 
    //@-at
    //@-node:zorcanda!.20051031121120:addPosition
    //@+node:zorcanda!.20051031113003:next
    public String next(){
    
        while( spot + 1 < cdata.length || yieldproxy.size() != 0 ){
            if( yieldproxy.size() != 0 ){
            
                return yieldproxy.remove( 0 );
                
            }
            spot += 1;
            beginspot += 1;
            //System.out.println( "CWORD:" + cword );
            char z = cdata[ spot ];
            //@        <<escape test>>
            //@+node:zorcanda!.20051031114159:<<escape test>>
            if( z == '\\' || escaping ){
                
                if( escaping ){
                    
                    cword.append( z );
                    String rv = cword.toString();
                    cword = new StringBuilder();
                    escaping = false;
                    return rv;
                        
                    
                }
                else{
                    
                    cword.append( z );
                    escaping = true;
                    continue;
                
                }
                    
            }
            //@nonl
            //@-node:zorcanda!.20051031114159:<<escape test>>
            //@nl
            if( z == '@' || z == '"' || z == '\'' )
                addPosition( beginspot, z );
            //@        <<string test>>
            //@+node:zorcanda!.20051031114936:<<string test>>
            if( z == '"' || z == '\'' ){
            
                yieldproxy.add( cword.toString() );
                cword = new StringBuilder();
                
                int dspot = spot + 1;
                int i = -1;
                //@    <<loop>>
                //@+node:zorcanda!.20051031153958:<<loop>>
                while( true ){
                    
                    i = data.indexOf( z, dspot );
                    if( i != -1 ){
                        
                        if( cdata[ i -1 ] == '\\' ){
                                
                            dspot += 1;
                            if( dspot > cdata.length ) break;
                            continue;
                            
                        }
                        else break;
                        
                        
                    }
                    else break;    
                    
                }
                //@nonl
                //@-node:zorcanda!.20051031153958:<<loop>>
                //@nl
                if( i == -1 ){
                    
                    //int ospot = spot;
                    //spot = cdata.length;
                    //return data.substring( ospot );
                    yieldproxy.add( Character.toString( z ) );
                    continue;
                
                
                }
                else{
                
                    String rv2 = data.substring( spot, i + 1 );
                    addPosition( beginspot + rv2.length() -1, z );
                    cword = new StringBuilder();
                    spot += rv2.length() - 1;
                    beginspot += rv2.length() -1;
                    yieldproxy.add( rv2 );
                    continue;
                
                }
            
            }
            
            //@+at
            //         if z in ( '"', "'" ):
            //             yield cword
            //             cword = ""
            //             dspot = spot + 1
            //             while 1:
            //                 #print "DSPOTIN!!!"
            //                 i = data.find( z, dspot )
            //                 if i != -1:
            //                     if data[ i -1 ] == "\\":
            //                         dspot = i + 1
            //                         if dspot >= len( data ):
            //                             i == -1
            //                             break
            //                         continue
            //                     else: break
            //                 else: break
            //             if i == -1:
            //                 yield data[ spot: ]
            //                 ignore = True
            //                 break
            //             else:
            //                 rv = data[ spot : i + 1 ]
            //                 self.addPosition( beginspot + len( rv ) -1, z, 
            // doc )
            //                 yield rv
            //                 cword = ""
            //                 spot += len( rv ) - 1
            //                 beginspot += len( rv ) -1
            //                 continue
            // 
            // 
            //@-at
            //@-node:zorcanda!.20051031114936:<<string test>>
            //@nl
            //@        <<section reference test>>
            //@+node:zorcanda!.20051031115829:<<section reference test>>
            else if( z == '<' ){
            
                if( spot + 1 < cdata.length ){
                
                    char test = cdata[ spot + 1 ];
                    int i;
                    if( test == '<' )
                        i = spot;
                    else
                        i = -1;
                    //int i = data.indexOf( "<<", spot );
                    if( i != spot ){
                        
                        String rv = cword.toString();
                        cword = new StringBuilder();
                        yieldproxy.add( Character.toString( z ) );
                        return rv;      
                    
                    }
                    else{
                        
                        int i2 = data.indexOf( ">>", spot );
                        int i3 = data.indexOf( "\n", spot );
                        if( i2 == -1 || i3 < i2 ){
                            
                            String rv = cword.toString();
                            cword = new StringBuilder();
                            yieldproxy.add( Character.toString( z ) );
                            return rv;
                        
                        
                        
                        }
                        else{
                        
                            String rv = data.substring( i, i2 + 2 );
                            yieldproxy.add( rv );
                            spot +=  rv.length() - 1;
                            beginspot += rv.length() - 1;
                            String rv2 = cword.toString();
                            cword = new StringBuilder();
                            return rv2;
                        
                        
                        }
                    
                    
                    }
                
                
                
                
                }
            
            
            
            
            
            
            
            
            
            }
            
            //@-node:zorcanda!.20051031115829:<<section reference test>>
            //@nl
            //@        <<space test1>>
            //@+node:zorcanda!.20051031210841:<<space test1>>
            else if( isSpace( cword ) && !Character.isWhitespace( z ) ){
            
                String rv = cword.toString();
                cword = new StringBuilder();
                cword.append( z );
                return rv;
            
            
            }
            //@nonl
            //@-node:zorcanda!.20051031210841:<<space test1>>
            //@nl
            //@        <<space test2>>
            //@+node:zorcanda!.20051031120707.1:<<space test2>>
            else if( Character.isWhitespace( z ) && isSpace( cword ) );
            //@nonl
            //@-node:zorcanda!.20051031120707.1:<<space test2>>
            //@nl
            //@        <<directive test>>
            //@+node:zorcanda!.20051031120824:<<directive test>>
            else if( z == '@' && cword.length() == 0 );// System.out.println( "DIRECTIVE!!!" );
            /*else if( cword.length() == 1 && cword.charAt( 0 ) == '@' && Character.isWhitespace( z ) ){
            
            
                int i = data.indexOf( "@c", spot );
                if( i != -1 ){
                    
                    int atspot = i - spot;
                    addPosition( beginspot + atspot, '@' );
                    cword.append( z );
                    cword.append( data.substring( spot + 1, i + 2 ) );
                    String rv = cword.toString();
                    cword = new StringBuilder();
                    int add = ( i + 2 ) - spot;
                    spot += add;
                    beginspot += add;
                    return rv;    
                
                
                }
            
                cword.append( z );
                cword.append( data.substring( spot + 1 ) );
                String rv = cword.toString();
                cword = new StringBuilder();
                spot = cdata.length;
                return rv;
            
            }*/
            //@nonl
            //@-node:zorcanda!.20051031120824:<<directive test>>
            //@nl
            //@        <<comment test>>
            //@+node:zorcanda!.20051031120921:<<comment test>>
            else if( ispossiblecomment( cword ) && ispossiblecomment( z ) );
            //@nonl
            //@-node:zorcanda!.20051031120921:<<comment test>>
            //@nl
            //@        <<comment test2>>
            //@+node:zorcanda!.20051031121109:<<comment test2>>
            else if( commentcontains( cword.toString() ) ){
            
                String cwstring = cword.toString();
                //@    <<test1>>
                //@+node:zorcanda!.20051031130210:<<test1>>
                if( cwstring.equals( commenttokens[ 0 ] ) ){
                    
                    int i = data.indexOf( '\n', spot );
                    String addon;
                    if( i == -1 )
                        addon = data.substring( spot );
                    else
                        addon = data.substring( spot, i );
                        
                    addPosition( beginspot - cword.length(), cword.charAt( 0 ) );
                    cword.append( addon );
                    if( i == -1 ) beginspot = cdata.length + 1;
                    else{
                        beginspot += addon.length() - 1;
                        spot += addon.length() -1; 
                        
                    }
                    String rv = cword.toString();
                    cword = new StringBuilder();
                    return rv;
                    
                }
                
                //@+at
                // 
                //                 i = data.find( "\n", spot )
                //                 addon = ""
                //                 if i == -1:
                //                     addon = data[ spot: ]
                //                 else:
                //                     addon = data[ spot:i]
                //                 self.addPosition( ( beginspot - len( cword 
                // ) ), cword[ 0 ], doc )
                //                 cword += addon
                //                 if i == -1:
                //                     beginspot = len( data ) + 1
                //                 else:
                //                     beginspot += len( addon ) -1
                //                     spot += len( addon ) -1
                //                 yield cword
                //                 cword = ""
                //                 continue
                //@-at
                //@nonl
                //@-node:zorcanda!.20051031130210:<<test1>>
                //@nl
                //@    <<test2>>
                //@+node:zorcanda!.20051031130210.1:<<test2>>
                else if( cwstring.equals( commenttokens[ 1 ] ) ){
                
                    int i = data.indexOf( commenttokens[ 2 ], spot );
                    String addon;
                    if( i == -1 ) addon = data.substring( spot );
                    else addon = data.substring( spot, i + commenttokens[ 2 ].length() );
                    addPosition( beginspot - cword.length(), cword.charAt( 0 ) );
                    if( i != -1 ) addPosition( i +( beginspot - spot ), commenttokens[ 2 ].charAt( 0 ) );
                    
                    cword.append( addon );
                    if( i == -1 ) spot = beginspot = cdata.length +1;
                    else{
                    
                        int addi = ( i - spot ) + commenttokens[ 2 ].length() -1;
                        beginspot += addi;
                        spot += addi;
                    
                    
                    }
                    String rv = cword.toString();
                    cword = new StringBuilder();
                    return rv;
                
                
                }
                
                //@+at
                // i = data.find( ctokens[ 2 ], spot )
                //                 addon = ""
                //                 if i == -1:
                //                     addon = data[ spot: ]
                //                 else:
                //                     addon = data[ spot:i + len( ctokens[ 2 
                // ] ) ]
                //                 self.addPosition( ( beginspot - len( cword 
                // ) ), cword[ 0 ], doc )
                //                 if i != -1:
                //                     self.addPosition( i , ctokens[ 2 ][ 0 
                // ], doc )
                //                 cword += addon
                //                 if i == -1:
                //                     beginspot = len( data ) + 1
                //                 else:
                //                     beginspot += len( addon ) -1
                //                     spot += len( addon ) -1
                //                 yield cword
                //                 cword = ""
                //                 continue
                //@-at
                //@nonl
                //@-node:zorcanda!.20051031130210.1:<<test2>>
                //@nl
                //@    <<test3>>
                //@+node:zorcanda!.20051101103854:<<test3>>
                else if( cwstring.equals( commenttokens[ 2 ] ) ){
                
                    addPosition( beginspot - commenttokens[ 2 ].length(), cwstring.charAt( 0 ) );
                    cword = new StringBuilder();
                    cword.append( z );
                    return cwstring;
                
                }
                //@nonl
                //@-node:zorcanda!.20051101103854:<<test3>>
                //@nl
            
            }
            //@nonl
            //@-node:zorcanda!.20051031121109:<<comment test2>>
            //@nl
            //@        <<alphanum test>>
            //@+node:zorcanda!.20051031121208:<<alphanum test>>
            else if( !Character.isLetterOrDigit( z ) ){
            
                String rv = cword.toString();
                if( (rv + z).equals( "@image " ) ){
                
                    int endofline = data.indexOf( "\n", spot );
                    String nwline = data.substring( spot , endofline );
                    matcher.reset( nwline );
                    if( matcher.find() ){
                        //System.out.println( "FIND!!!!" );
                        nwline = nwline.substring( matcher.start(), matcher.end() );
                        //System.out.println( nwline );
                    
                    }
                    rv +=  nwline;
                    //System.out.println( "RV is:'" + rv + "'" );
                    beginspot += nwline.length() -1;
                    spot += nwline.length() -1;
                    cword = new StringBuilder();
                    return rv;
                
                }
                else if( (rv + z).equals( "@plugin " ) ){
                
                    int endofline = data.indexOf( "\n", spot );
                    String nwline = data.substring( spot , endofline );
                    rv += nwline;
                    beginspot += nwline.length() -1;
                    spot += nwline.length() -1;
                    cword = new StringBuilder();
                    return rv;
                
                
                
                
                }
                cword = new StringBuilder();
                if( !ispossiblecomment( z ) ){
                    yieldproxy.add( Character.toString( z )) ;
                
                }
                else cword.append( z );
                return rv;
            
            
            }
            //@-node:zorcanda!.20051031121208:<<alphanum test>>
            //@nl
            
            cword.append( z );
            //System.out.println( "CWORD END:" + cword );
        }
    
        return cword.toString();
    
    }
    
    
    //@-node:zorcanda!.20051031113003:next
    //@+node:zorcanda!.20051031113003.1:tokenizer
    //@+at
    // def tokenize( self, data, beginspot):
    //     cword = ""
    //     spot = -1
    //     beginspot -= 1
    //     ignore = False
    //     doc = self.editor.getDocument()
    //     ctokens = self.cdeterminer.getCommentTokens()
    //     #print ctokens
    //     escaping = False
    //     for x in xrange( len(data) ):
    //         spot += 1
    //         beginspot += 1
    //         if spot >= len( data ): break
    //         z = data[ spot ]
    //         #print z, cword
    //         if z == "\\" or escaping:
    //             #print "ESCAPE!!! %s" % cword
    //             if escaping:
    //                 cword += z
    //                 yield cword
    //                 cword = ""
    //                 escaping = False
    //                 continue
    //             else:
    //                 escaping = True
    //                 cword += z
    //                 continue
    //         if z in ( "@", '"',"'" ):
    //             self.addPosition( beginspot, z, doc )
    //         if z in ( '"', "'" ):
    //             yield cword
    //             cword = ""
    //             dspot = spot + 1
    //             while 1:
    //                 #print "DSPOTIN!!!"
    //                 i = data.find( z, dspot )
    //                 if i != -1:
    //                     if data[ i -1 ] == "\\":
    //                         dspot = i + 1
    //                         if dspot >= len( data ):
    //                             i == -1
    //                             break
    //                         continue
    //                     else: break
    //                 else: break
    //             if i == -1:
    //                 yield data[ spot: ]
    //                 ignore = True
    //                 break
    //             else:
    //                 rv = data[ spot : i + 1 ]
    //                 self.addPosition( beginspot + len( rv ) -1, z, doc )
    //                 yield rv
    //                 cword = ""
    //                 spot += len( rv ) - 1
    //                 beginspot += len( rv ) -1
    //                 continue
    //         elif z == '<':
    //             if spot < len( data ):
    //                 i = data.find( "<<", spot  )
    //                 if i !=  spot:
    //                     yield cword
    //                     yield z
    //                     cword = ""
    //                     continue
    //                 else:
    //                     i2 = data.find( ">>", spot )
    //                     if i2 == -1:
    //                         yield cword
    //                         yield z
    //                         cword = ""
    //                         continue
    //                     else:
    //                         rv = data[ i: i2 + 2 ]
    //                         yield cword
    //                         yield rv
    //                         spot += len( rv ) - 1
    //                         beginspot += len( rv ) - 1
    //                         cword = ""
    //                         continue
    //         elif cword.isspace() and not z.isspace():
    //             yield cword
    //             cword = ""
    //         elif z.isspace() and cword.isspace():
    //             pass
    //         elif z == '@' and cword == '':
    //             pass
    //         elif self.ispossiblecomment( cword, ctokens ) and 
    // self.ispossiblecomment( z , ctokens ):
    //             pass
    //         elif cword in ctokens and not self.ispossiblecomment( z, 
    // ctokens ):
    //             if cword == ctokens[ 0 ]:
    //                 i = data.find( "\n", spot )
    //                 addon = ""
    //                 if i == -1:
    //                     addon = data[ spot: ]
    //                 else:
    //                     addon = data[ spot:i]
    //                 self.addPosition( ( beginspot - len( cword ) ), cword[ 
    // 0 ], doc )
    //                 cword += addon
    //                 if i == -1:
    //                     beginspot = len( data ) + 1
    //                 else:
    //                     beginspot += len( addon ) -1
    //                     spot += len( addon ) -1
    //                 yield cword
    //                 cword = ""
    //                 continue
    //             if cword == ctokens[ 1 ]:
    //                 i = data.find( ctokens[ 2 ], spot )
    //                 addon = ""
    //                 if i == -1:
    //                     addon = data[ spot: ]
    //                 else:
    //                     addon = data[ spot:i + len( ctokens[ 2 ] ) ]
    //                 self.addPosition( ( beginspot - len( cword ) ), cword[ 
    // 0 ], doc )
    //                 if i != -1:
    //                     self.addPosition( i , ctokens[ 2 ][ 0 ], doc )
    //                 cword += addon
    //                 if i == -1:
    //                     beginspot = len( data ) + 1
    //                 else:
    //                     beginspot += len( addon ) -1
    //                     spot += len( addon ) -1
    //                 yield cword
    //                 cword = ""
    //                 continue
    //             self.addPosition( ( beginspot - len( cword ) ), cword[ 0 ], 
    // doc )
    //             cword = ""
    //         elif not z.isalnum():
    //             yield cword
    //             if not self.ispossiblecomment( z, ctokens ):
    //                 yield z
    //                 cword = ""
    //                 continue
    //             else:
    //                 cword = ""
    //         cword += z
    //     if not ignore:
    //         yield cword
    //@-at
    //@-node:zorcanda!.20051031113003.1:tokenizer
    //@-others


}
//@nonl
//@-node:zorcanda!.20051031112704:@thin JyLeoTokenizer.java
//@-leo
