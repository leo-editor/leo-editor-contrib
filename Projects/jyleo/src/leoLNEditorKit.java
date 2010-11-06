//@+leo-ver=4-thin
//@+node:orkman.20050209094014:@thin leoLNEditorKit.java
//@@language java

import javax.swing.text.*; 
import java.awt.font.*;    
import javax.swing.*;
import java.awt.*;
import java.io.*;
import java.util.*; 
import javax.swing.plaf.basic.*;


public class leoLNEditorKit extends StyledEditorKit{

    ViewFactory vf;
    JTextPane _jtp;
    //@    @+others
    //@+node:orkman.20050209094021:leoLNEditorKit
    public leoLNEditorKit( JTextPane jtp ){
    
    
        vf = this.new LeoLNViewFactory( jtp );
        _jtp = jtp;
    
    
    }
    
    //@-node:orkman.20050209094021:leoLNEditorKit
    //@+node:orkman.20050209094027:clone
    public Object clone(){
    
        Object lek = new leoLNEditorKit( _jtp );
        return lek;
    
    
    }
    //@nonl
    //@-node:orkman.20050209094027:clone
    //@+node:orkman.20050209094032:getContentType
    public String getContentType(){
    
        return "text/leo";
    
    
    
    } 
    //@nonl
    //@-node:orkman.20050209094032:getContentType
    //@+node:orkman.20050209094038:getViewFactory
    public ViewFactory getViewFactory(){
    
    
        return vf;
    
    
    } 
    //@nonl
    //@-node:orkman.20050209094038:getViewFactory
    //@+node:orkman.20050209094450:class LeoLNViewFactory
    class LeoLNViewFactory implements ViewFactory{
    
        
        JTextPane _jtp;
        public LeoLNViewFactory( JTextPane jtp ){
        
            _jtp = jtp;
        
        }
    
        public View create( Element element ){
        
        
            return new LeoLNView( element, _jtp );
        
        }
    
    
    
    
    }
    //@nonl
    //@-node:orkman.20050209094450:class LeoLNViewFactory
    //@+node:orkman.20050209094139:class LeoLNView
    public static class LeoLNView extends WrappedPlainView{
    
        int start_x;
        int start_y;
        boolean initialized = false;
        java.util.List< Segment> _segments;
        JTextPane _jtp;
        
        public LeoLNView( Element elem, JTextPane jtp ){
    
            super( elem );
            _segments = new ArrayList< Segment >();
            _jtp = jtp;
            //ii = new ImageIcon( "../Icons/Leosplash.GIF" );
    
        }
        
        public int getTabSize(){
        
            return 1;
        }
        
        public void paint( Graphics g, Shape r ){
        
            if( ! initialized )
                super.paint( g, r );
            else
                paintAll( g );
        
        
        }
        
        private void paintAll( Graphics g ){
        
            try{
    
            g.setColor( Color.RED );
            Document doc = getDocument();
            String txt = doc.getText( 0, doc.getLength() );
            char[] count = txt.toCharArray();
            int ncount = 1;
            int pos = _jtp.getCaretPosition();
            Rectangle cspot = _jtp.modelToView( pos );
    
            for( char x: count )
                if( x == '\n' ) ncount++;
            
         
            int size = _segments.size();
            if( ncount > size ){
            
                int add = ncount - size;
                while( add != 0 ){
                
                    size++;
                    String num = size + "\n";
                    char[] nc = num.toCharArray();
                    _segments.add( new Segment( nc, 0, nc.length ) );
                    add--;
                
                }
                
            
            }
            /*Segment[] segs = new Segment[ ncount ];
            for( int i = 0, n = 1; i < ncount; i ++ , n ++ ){
                
                String num = n + "\n";
                char[] nc = num.toCharArray();
                segs[ i ] = new Segment( nc, 0, nc.length );
            //    System.out.println( "ADDING SEGMENT " + segs[ i ] );
            
            
            }*/
            int num = 1;
            int offset = 0;
            for( Segment s: _segments ){
    
                Utilities.drawTabbedText( s, start_x, start_y * num , g, null, offset );
                offset += s.array.length;
                if( num == ncount ) break;
                num++;
            
            }        
            
            
            
            }
            catch( Exception x ){ }
        
        
        
        
        }
        
        public int drawUnselectedText( Graphics g, int x, int y, int p0, int p1 ) throws BadLocationException{
        
            //Image i = ii.getImage();   //for future enhancement-- the user will be able to specify an image background.
            //g.drawImage( i, 0, 0, Color.WHITE, null );
            //super.paint( g, r );
            if( !initialized ){
            
                initialized = true;
                start_x = x;
                start_y = y;
            
            
            }
            g.setColor( Color.RED );
            Document doc = getDocument();
            String txt = doc.getText( 0, p1 );
            String[] split = txt.split( "\n" );
            System.out.println( "P1 is " + p0 + "P2 " + p1 );
            String n = split.length+"\n";
            char[] c = n.toCharArray();
            //char[] c = new char[]{ '1','\n' };
            Segment s = new Segment( c, 0, c.length );
            System.out.println( "Y   IS  " + y );
            y = start_y * split.length;
            int x2 = Utilities.drawTabbedText( s, start_x, y, g, null, p0 );
            //System.out.println( "FONT SIZE IS " + g.getFont().getSize() );
            //Graphics2D g2 = (Graphics2D)g;
            //Font f = g.getFont();
            //LineMetrics lm = f.getLineMetrics( "1234567890", g2.getFontRenderContext() );
            //System.out.println( "LINE HEIGHT IS " + lm.getHeight() + " " + lm.getAscent() + " " + lm.getDescent() );
            //Document doc = getDocument();
            //String txt = doc.getText( 0, doc.getLength() );
            //System.out.println( "y is " + y + " x is " + x );
            //System.out.println( doc.getText( p0, p1 - p0 ) );
            //String[] data = txt.split( "\n" );
            //System.out.println( data.length );
            //List segments = new Vector( data.length );
            //Segment[] segs = new Segment[ data.length ];
            //for( int i = 0, n = 1; i < data.length; i ++ , n ++ ){
            //    
            //    String num = n + "\n";
            //    char[] nc = num.toCharArray();
            //    segs[ i ] = new Segment( nc, 0, nc.length );
            //    System.out.println( "ADDING SEGMENT " + segs[ i ] );
            
            
            //}
            //int x = 0;
            //int offset = 0;
            //for( Segment s: segs ){
            
    
           //     x = Utilities.drawTabbedText( s, x, y , g, null, offset );
            //    offset += s.array.length;
            //    System.out.println( "X is   " + x );
            
           // }
            
    
            return x;
        
        }
    
       /** public int drawUnselectedText( Graphics g, int x, int y, int p0, int p1 ) throws BadLocationException{
    
    
            Document doc = getDocument();
            int len = p1 - p0;
            String txt = doc.getText( p0, len );
            System.out.println( txt );
            
            return x;
    
        }*/
        
        
        /**private int drawToken( Token t , Graphics g, int x, int y, int mark, Map< String, Color> ctokens ){
        
             int location =  Utilities.drawTabbedText( t._s ,x,y ,g, this, mark );
            g.setColor( c );
            return location;
        
        }*/
    
    
    
    
    }
    //@-node:orkman.20050209094139:class LeoLNView
    //@-others



}
//@nonl
//@-node:orkman.20050209094014:@thin leoLNEditorKit.java
//@-leo
