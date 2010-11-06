//@+leo-ver=4-thin
//@+node:zorcanda!.20051025184052:@thin leoEditorKit2.java
//@@language java
import javax.swing.*;
import javax.swing.border.*;
import javax.swing.event.*;
import javax.swing.text.*;
import java.lang.ref.*;
import java.util.*;
import java.awt.*;
import java.awt.event.*;
import java.awt.geom.*;
import java.awt.image.*;
import static java.lang.System.*;

public class leoEditorKit2 extends StyledEditorKit{

    
    public leoEditorKit2( JTextPane jtp, ColorDeterminer cd, ImageIcon ii ){
    
        super();
        vf = new StyledViewFactory2( jtp, cd, ii );
    
    }
    
    
    public void setLineWrap( boolean wrap ){
    
        vf.setLineWrap( wrap );
    
    }
    
    public boolean getLineWrap(){
    
        return vf.getLineWrap();
    
    
    }
    
    public Border getBorder(){
    
        LineNumberBorder lnb = new LineNumberBorder( vf.root );
        vf.root.border = lnb;
        return lnb;
    
    }
    
    public Document createDefaultDocument(){
    
        return new LeoDefaultStyledDocument();
    
    }
    
    
    public void fold( Element e ){
    
        vf.fold( e );
    
    }
    
    public void unfold( Element e ){
    
        vf.unfold( e );
    
    }
    
    public void unfold( Position p1, Position p2 ){
    
        vf.unfold( p1, p2 );
    
    
    }
    
    
    public void defoldViews(){
    
        vf.defoldViews();
    
    }
    
    public void fold( Position p1, Position p2 ){
    
        vf.fold( p1, p2 );
    
    }

    public void topfold( Element e ){
    
        vf.topfold( e );
    
    }
    
    public void relayout(){
    
        vf.relayout();
        
    
    }
    
    public boolean isFolded( int x, int y ){
    
        return vf.isFolded( x, y );
    
    }
    
    public int getFoldIconX(){
    
        return vf.getFoldIconX();
    
    }
    
    
    public void showInvisibles( boolean show ){
    
        vf.showInvisibles( show );
    
    }
    
    
    static StyledViewFactory2 vf;// = new StyledViewFactory2();

    public ViewFactory getViewFactory(){
    
        return vf;
    
    }
static class StyledViewFactory2 implements ViewFactory {

        JTextPane jtp;
        ColorDeterminer cd;
        NoWrapBoxView root;
        ImageIcon ii;
        public StyledViewFactory2( JTextPane jtp, ColorDeterminer cd, ImageIcon ii ){
        
            super();
            this.jtp = jtp;
            this.cd = cd;
            this.ii = ii;
        
        }
        
        //@        <<fold methods>>
        //@+node:zorcanda!.20051102122256:<<fold methods>>
        public int getFoldIconX(){
                
            return ii.getIconWidth() + root.getLeftInset();
                
                
        }
        
        public void fold( Element e ){ 
            
            root.resetLineNumbers();
            int i = root.getViewIndexAtPosition( e.getStartOffset() );
            FoldableParagraphView pv = (FoldableParagraphView)root.getView( i );
            pv.fold();
                
                
        }
                
        public void unfold( Element e ){
            
            root.resetLineNumbers();
            int i = root.getViewIndexAtPosition( e.getStartOffset() );
            FoldableParagraphView pv = (FoldableParagraphView)root.getView( i );
            pv.unfold();   
                
        }
                
        public void defoldViews(){
            
            root.resetLineNumbers();
            for( int i = 0; i < root.getViewCount(); i++ ){
                    
                View v = root.getView( i );
                if( v instanceof FoldableParagraphView ){
                        
                    FoldableParagraphView pv = (FoldableParagraphView)v;
                    pv.unfold();
                        
                }
            }
        }
                
        public void unfold( Position p1, Position p2 ){
                
            DefaultStyledDocument dsd = (DefaultStyledDocument)jtp.getDocument();
            Element start = dsd.getParagraphElement( p1.getOffset() );
            Element end = dsd.getParagraphElement( p2.getOffset() );
            ElementIterator ei = new ElementIterator( dsd );
            boolean unfolding = false;
            while( true ){
                
                Element e = ei.next();
                if( e == start ) unfolding = true;
                if( unfolding && e.getClass() == start.getClass() ) unfold( e );
                if( e == end ) break;
                
            }
            relayout();
                
        }
                
        public void fold( Position p1, Position p2 ){
            
            DefaultStyledDocument dsd = (DefaultStyledDocument)jtp.getDocument();
            Element start = dsd.getParagraphElement( p1.getOffset() );
            Element end = dsd.getParagraphElement( p2.getOffset() );
            ElementIterator ei = new ElementIterator( dsd );
            boolean unfolding = false;
            while( true ){
                
                Element e = ei.next();
                if( e == start ) unfolding = true;
                if( unfolding && e.getClass() == start.getClass() ){
                         
                if( e == start ) topfold(e);
                else fold( e );
                            
                        
            }
            if( e == end ) break;
                
            }
            relayout();        
                
                
                
        }
                
        public void topfold( Element e ){
        
        	root.resetLineNumbers();
            int i = root.getViewIndexAtPosition( e.getStartOffset() );
            FoldableParagraphView pv = (FoldableParagraphView)root.getView( i );
            pv.topfold();
            //WeakReference<ParagraphView2> wr = new WeakReference<ParagraphView2>( pv );
            //folded.add( wr );       
                
                
        }
                
        public boolean isFolded( int x, int y ){
                
            if( root == null ) return false;
            int spot = jtp.viewToModel( new Point( x, y ) );
            int i = root.getViewIndex( spot, Position.Bias.Forward );
            View v = root.getView( i );
            if( v instanceof FoldableParagraphView ){
                    
            FoldableParagraphView pv2 = (FoldableParagraphView)v;
            return pv2.isTopFolded();
                    
                    
            }
            return false;
                
        }
        //@nonl
        //@-node:zorcanda!.20051102122256:<<fold methods>>
        //@nl
        
        public void setLineWrap( boolean wrap ){
        
            root.setLineWrap( wrap );
        
        
        }
        
        public boolean getLineWrap(){
        
        
            return root.getLineWrap();
            
        
        }
        
        
        public void showInvisibles( boolean show ){
        
            root.show_invisibles = show;
        
        
        }
        
        public void relayout(){
        
            if( root != null ){
                 root.layoutChanged( View.Y_AXIS );
                 root.layoutChanged( View.X_AXIS );
                 jtp.repaint();    
                
            }
        
        }
        
        
        //@        <<create>>
        //@+node:zorcanda!.20051102120953:<<create>>
        public View create(Element elem) {
        
            String kind = elem.getName();
        	if (kind != null) {
        	
                if (kind.equals(AbstractDocument.ContentElementName)) {
                    return new InvisiblesDrawingLabelView( elem, cd, root );
        		} else if (kind.equals(AbstractDocument.ParagraphElementName)) {
                        FoldableParagraphView rv = new FoldableParagraphView( elem, ii, cd, root );
                        return rv;
        		} else if (kind.equals(AbstractDocument.SectionElementName)) {
                    return ( root = new NoWrapBoxView( elem, View.Y_AXIS, jtp, cd, ii ) );
        		} else if (kind.equals(StyleConstants.ComponentElementName)) {
        		    return new ComponentView(elem);
        		} else if (kind.equals(StyleConstants.IconElementName)) {
        
                    return new IconView(elem);
        		}
        	    }
        	
        	    // default to text display
                return new InvisiblesDrawingLabelView(elem, cd, root);
        
        	}
        //@-node:zorcanda!.20051102120953:<<create>>
        //@nl
    
        

}

    //@    @+others
    //@+node:zorcanda!.20051102105133:class NoWrapBoxView
    static class NoWrapBoxView extends BoxView{
    
        JTextPane jtp; 
        boolean useln;
        Color fg;
        Color bg;
        Color cl;
        ColorDeterminer cd;
        public boolean show_invisibles;
        public boolean wrap;
        LineNumberBorder border;
        BufferedImage bi;
        ImageIcon ii;
        boolean dump;
        public int lnlstart, lnlend, lnlpos, lnlpos2;
        Rectangle lastvisible_rect;
        
        public NoWrapBoxView( Element elem, int axis, JTextPane jtp, ColorDeterminer cd, ImageIcon ii){
        
            super( elem, axis );
            this.jtp = jtp;
            useln = cd.useLineNumbers();
            fg = cd.getLineNumberForeground();
            bg = cd.getLineNumberBackground();
            cl = cd.getCurrentLineNumberForeground();
            this.cd = cd;
            wrap = true;
            this.ii = ii;
            bi = new BufferedImage( 10, 10, BufferedImage.TYPE_INT_RGB );
            lastvisible_rect = new Rectangle( 0,0,0,0 );
            
        }
        
        public void resetLineNumbers(){
        
            lnlstart = lnlend = lnlpos = lnlpos2 = -1;
        
        
        }
    
        //@    @+others
        //@+node:zorcanda!.20051103113240:layout
        
        public void layout2( int width, int height ){
            
            if( wrap ){
              final Rectangle vrec = jtp.getVisibleRect();
              super.layout( vrec.width , height );
              
            }
            else super.layout( width, height );
        
            
        }
        //@-node:zorcanda!.20051103113240:layout
        //@+node:zorcanda!.20051110140407:modelToView
        public Shape modelToView(int p0, Position.Bias b0, int p1, Position.Bias b1, Shape a) throws BadLocationException{
        
            return super.modelToView( p0, b0, p1, b1, a );
        
        }  
        
        public Shape modelToView( int p0, Shape a, Position.Bias bias ) throws BadLocationException{
        
            Shape s = super.modelToView( p0, a, bias );
            int vi = getViewIndex( p0, Position.Bias.Forward );
            View view = getView( vi );
            if( view instanceof FoldableParagraphView ){
                FoldableParagraphView fpv = (FoldableParagraphView)view;
                if( fpv.isFolded() ){
            
                    int height = (int)fpv.getPreferredSpan( Y_AXIS );
                    int width = (int)fpv.getPreferredSpan( X_AXIS );
                    //eturn new Rectangle( 0, 0, width, height );
                    Rectangle bounds = s.getBounds();
                    if( wrap ){
                        Rectangle visrect = jtp.getVisibleRect();
                        bounds.width= visrect.width;
                
                    }
                    else bounds.width= width;
                    bounds.height = height;
                    return bounds;
            
                }
            }
        
            return s;
        }
        
        
        public Shape getChildAllocation( int pos , Shape a ){
        
            //System.out.println( "GETCA!" );
           // int vi = getViewIndex( pos, Position.Bias.Forward );
           // FoldableParagraphView fpv = (FoldableParagraphView)getView( vi );
           // if( fpv.isFolded() ){
            
          //      int height = (int)fpv.getPreferredSpan( Y_AXIS );
           //     int width = (int)fpv.getPreferredSpan( X_AXIS );
           //     return new Rectangle( 0, 0, width, height );
            
           // }
            return super.getChildAllocation( pos, a );
        
        }
        //@nonl
        //@-node:zorcanda!.20051110140407:modelToView
        //@+node:zorcanda!.20051105092205:getPreferredSpan
        @Override
        public float getPreferredSpan( int axis ){
        
            float rv = super.getPreferredSpan( axis );
            return rv;
        
        }
        //@nonl
        //@-node:zorcanda!.20051105092205:getPreferredSpan
        //@+node:zorcanda!.20051105110340:getMinimumSpan
        @Override
        public float getMinimumSpan( int axis ){
        
            if( wrap ) return super.getMinimumSpan( axis );
            return getPreferredSpan( axis );
        
        
        }
        //@nonl
        //@-node:zorcanda!.20051105110340:getMinimumSpan
        //@+node:zorcanda!.20051103113804:getLeftInset
        @Override
        public short getLeftInset(){
            
            return super.getLeftInset();
            
        }
        //@nonl
        //@-node:zorcanda!.20051103113804:getLeftInset
        //@+node:zorcanda!.20051103234124:getInsets
        public Insets getInsets(){
        
            try{
                int vc = getViewCount();
                Graphics g = getGraphics();
                FontMetrics fm = g.getFontMetrics();
                String s = Integer.toString( vc );
                int swidth = (fm.stringWidth( s ) + 1);
                g.dispose();
                Insets ins = new Insets( 0, swidth  ,0 , 0 );
                return ins;
            }
            catch( Exception x ){}
            return new Insets( 0, 0, 0, 0 );
        
        }
        //@nonl
        //@-node:zorcanda!.20051103234124:getInsets
        //@+node:zorcanda!.20051103234124.1:paintNumbers
        public void paintNumbers(  Graphics g10 , int width , JComponent translation , boolean force ){
                
                Rectangle r2 = jtp.getVisibleRect();
                if( !force && !r2.equals( lastvisible_rect ) ) force = true;
                lastvisible_rect = r2;
                Insets insets = jtp.getInsets();
                int insetadd = insets.top + insets.bottom;
                int boxheight = r2.height + insetadd;
                int vstart = -1; int vend = -1; int vindex = -1; 
                if( width != bi.getWidth() || boxheight != bi.getHeight() ){
                    
                    bi = new BufferedImage( width, boxheight , BufferedImage.TYPE_INT_RGB );
                    
                }
                Graphics2D g = (Graphics2D)bi.getGraphics();
                g.setFont( jtp.getFont() );
                try{
                
                    g.setColor( bg );
                    g.fillRect( 0, 0, width , boxheight  );
                    Rectangle vRect = new Rectangle( r2 );
                    vRect.x = 0;
                
                    final int start = jtp.viewToModel( new Point( vRect.x, vRect.y ) );
                    int end;
                    try{
                        end = jtp.viewToModel( new Point( vRect.x, vRect.y + vRect.height ) );
                    }
                    catch( Exception x ){
                        
                        end = getViewCount();
                
                    }
        
                    vstart = getViewIndexAtPosition( start );
                    vend = getViewIndexAtPosition( end ) + 1;
        
        
                    int cp = jtp.getCaretPosition();
                    vindex = getViewIndex( cp , Position.Bias.Forward );
                    int vindex2 = getView( vindex ).getViewIndex( cp, Position.Bias.Forward );
                    boolean reset = false;
                    try{
                        if( !force ){
                            //AbstractDocument doc = (AbstractDocument )jtp.getDocument();
                            //Element e = doc.getParagraphElement( cp );
                            if( vindex == lnlpos && vindex2 == lnlpos2 && vstart == lnlstart && vend == lnlend ){
        
                                 return;
                            }
                            else{ force = true; reset = true;}
                        }
                    }
                    finally{
                        if( reset ){
                            lnlpos = vindex; lnlpos2 = vindex2; lnlstart = vstart; lnlend = vend;      
                        } 
                        
                    }
                    
                    
                    
                    Rectangle cr = new Rectangle( 0, 0 , 0, 0 );
                    try{
                        cr = modelToView( cp, cr, Position.Bias.Forward ).getBounds();
                    }
                    catch( BadLocationException ble ){}
                    //final ParagraphView cparagraph = (ParagraphView)getViewAtPoint( cr.x, cr.y, new Rectangle( 0,0,0,0 ) );
                    final View cparagraph = getViewAtPoint( cr.x, cr.y, new Rectangle( 0,0,0,0 )) ;
                    final int cindex = cparagraph.getViewIndex( cp, Position.Bias.Forward );
                    
                    cr = SwingUtilities.convertRectangle( jtp, cr, translation );
                    int y1 = cr.y;
                    int y2 = cr.y + cr.height;
            
                    int amount = vend - vstart;
                    int y = vRect.y;
                    g.setColor( fg );
                    g.setRenderingHint( RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON );
                    FontMetrics fm = g.getFontMetrics();
                    int height = fm.getHeight();
                    for( int i = 0; i < amount; i++ ){
                    
                        Rectangle alot = new Rectangle( 0, 0, 0, 0 );
                        Shape s3 = getChildAllocation( vstart, alot );
                        Rectangle spot = s3.getBounds();
                        //FoldableParagraphView pv = (FoldableParagraphView)getViewAtPoint( spot.x, spot.y, new Rectangle( 0,0,0,0 ) );
                        View pv = getViewAtPoint( spot.x, spot.y, new Rectangle( 0,0,0,0 ) );
                        final int iterateby = pv.getViewCount() - 1;
                        spot = SwingUtilities.convertRectangle( jtp, spot, translation );
                        int yspot = spot.y + height;
                        if( spot.width != 0 && spot.height != 0 ){
                        
                            if( vindex != vstart || ( spot.y < y1 || spot.y > y2 ) )
                                g.drawString( Integer.toString( vstart + 1) ,1 , yspot );
                            else{
                        
                                g.setColor( cl );
                                g.drawString( Integer.toString( vstart + 1) , 1 , yspot );
                                g.setColor( fg );
                        
                            }   
                            
                            
                        }
                        if( iterateby > 0 && !( pv instanceof FoldableParagraphView && !((FoldableParagraphView)pv).isFolded()) ){
                            boolean cview = pv == cparagraph;
                            for( int j = 1; j <= iterateby; j++ ){
                                
                                Shape dotspot = pv.getChildAllocation( j, new Rectangle( 0, 0,0,0 ) );
                                Rectangle bounds = dotspot.getBounds();
                                yspot += bounds.height;
                                if( cview && cindex == j ){
                                    
                                    g.setColor( cl );
                                    g.drawString( ".", 1, yspot );
                                    g.setColor( fg );
                                
                            
                                }
                                else
                                    g.drawString( ".", 1, yspot );                
                        
                            }
                    
                    
                        }
                        vstart++;
                
                    }
        
            }
            finally{
                if( force )
                    g10.drawImage( bi, 0, 0, null );
        
            }
        
        
        }
        //@nonl
        //@-node:zorcanda!.20051103234124.1:paintNumbers
        //@+node:zorcanda!.20051103113352:paint
            @Override
            public void paint( Graphics g, Shape r ){ 
            
                //Thread.currentThread().dumpStack();
                super.paint( g, r );
                int sstart = jtp.getSelectionStart();
                int send = jtp.getSelectionEnd();
                if( sstart != send && cd.drawrectangle() ){ //visual rectangles..., not too hard to do :)
                
                	   try{
                        Rectangle start = new Rectangle( 0, 0 , 0 , 0 );
                        start = modelToView( sstart, start, Position.Bias.Forward ).getBounds();
                        Rectangle end = new Rectangle( 0, 0, 0 , 0 );
                        end = modelToView( send, end, Position.Bias.Forward ).getBounds();
                        g.setColor( cd.getRectangleColor() );
                        g.drawRect( start.x + 3, start.y + 3, end.x - start.x, (( end.y + end.height ) - start.y ) - 3 );
                    }
                    catch( BadLocationException ble ){}
                
                
                }
                if( border != null ){
                     border.paint();
                     //border.paintNow();
                     //Graphics g2 = border.getGraphics();
                     //g2.setClip( g.getClip() );
                     //Graphics g2 = g.create();
                     //Insets s = getInsets();
                     //g2.translate( -s.left, 0 );
                     //g2.setClip( g.getClip() );
                     //paintNumbers( g.getClip().getBounds(), g2 );
                     
                }
                if(useln) return;
                g.setColor( bg );
                JTextComponent jtp = (JTextComponent)getContainer();
                Rectangle r2 = g.getClip().getBounds();///jtp.getVisibleRect();
                ///Rectangle r3 = jtp.getVisibleRect()
                g.fillRect( 0, r2.y, getLeftInset(), r2.height );
                Rectangle vRect = r2;
                //vRect = g.getClip().getBounds();
                final int start = jtp.viewToModel( new Point( vRect.x, vRect.y ) );
                final int end = jtp.viewToModel( new Point( vRect.x, vRect.y + vRect.height ) );
        
                int vstart = getViewIndexAtPosition( start );
                final int vend = getViewIndexAtPosition( end ) + 1;
        
        
                int cp = jtp.getCaretPosition();
                int vindex = getViewIndex( cp , Position.Bias.Forward );
                Rectangle cr = new Rectangle( 0, 0 , 0, 0 );
                try{
                    cr = modelToView( cp, cr, Position.Bias.Forward ).getBounds();
                }
                catch( BadLocationException ble ){}
                int y1 = cr.y;
                int y2 = cr.y + cr.height;
            
                int amount = vend - vstart;
                int y = vRect.y;
                g.setColor( fg );
                g.setFont( getContainer().getFont() );
                Graphics2D g2 = (Graphics2D)g;
                g2.setRenderingHint( RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON );
                FontMetrics fm = g.getFontMetrics();
                int height = fm.getHeight();
                for( int i = 0; i < amount; i++ ){
                    
                    Rectangle alot = new Rectangle( 0, 0, 0, 0 );
                    Shape s3 = getChildAllocation( vstart, alot );
                    Rectangle spot = s3.getBounds();
                    int divide = spot.height/height;
                    int yspot = spot.y + height;
                    if( spot.width != 0 && spot.height != 0 ){
                        
                        if( vindex != vstart || ( yspot < y1 || yspot > y2 ) )
                            g.drawString( Integer.toString( vstart + 1) ,1 , yspot );
                        else{
                        
                            g.setColor( cl );
                            g.drawString( Integer.toString( vstart + 1) ,1 , yspot );
                            g.setColor( fg );
                        
                        }   
                    
                    }
                    if( divide > 1 ){
        
                        int add = spot.height/divide;
                        for( int j = 0; j < divide -1; j++ ){
                        
                            yspot += add;
                            if( yspot >= y1 && yspot <= y2 ){
                                g.setColor( cl );
                                g.drawString( ".", 0, yspot );
                                g.setColor( fg );
                                
                            
                            }
                            else
                                g.drawString( ".", 0, yspot );                
                        
                        }
                    
                    
                    }
                    vstart++;
                
                }
                /*
                Dimension d = jtp.getSize();
                short bottom = getBottomInset();
                Rectangle size = new Rectangle( 0, 0, d.width, d.height );
                size.y = size.height - bottom;
                size.height = bottom;
                Rectangle bounds = g.getClip().getBounds();
                if( !size.intersects( bounds ) || !hasFootNode() ) return;
                g.setColor( cd.getFootNodeBackgroundColor() );
                g.fillRect( size.x, size.y, size.width, size.height );
                g.setColor( Color.BLACK );
                g.drawLine( size.x, size.y, size.x + size.width, size.y );
                String footnode = getFootNodeString();
                g.setColor( cd.getFootNodeForegroundColor() );
                int x = 0; int y3 = size.y + fm.getHeight();
                for( char c: footnode.toCharArray() ){
                    
                    if ( c == '\t' ){
                    
                        g.drawString( "    ", x, y3 );
                        x += fm.stringWidth( "    " );
                    
                    
                    }
                    else{
                        g.drawString( Character.toString( c ), x, y3 );
                        x += fm.stringWidth( Character.toString( c ) );
                    
                    }
                    if( x >= size.width || c == '\n' ){
                    
                        x = 0;
                        y3 += fm.getHeight();
                    
                    }
                
                
                } */
        
            
            }
        //@-node:zorcanda!.20051103113352:paint
        //@+node:zorcanda!.20051104181308:linewraping
        public void setLineWrap( boolean wrap ){
        
            this.wrap = wrap;
            int amount = getViewCount();
            for( int i = 0; i < amount; i ++ ){
            
                View v = getView( i );
                preferenceChanged( v, true, true );
            
            
            }
            
            layoutChanged( View.Y_AXIS );
            layoutChanged( View.X_AXIS ); 
            jtp.repaint();    
                        
        
        }
        
        public boolean getLineWrap(){ return wrap; }
        //@-node:zorcanda!.20051104181308:linewraping
        //@+node:zorcanda!.20051103113502:getNextVisualPositionFrom
            @Override
            public int getNextVisualPositionFrom( int pos,
                                             Position.Bias b, 
                                             Shape a,
                                             int direction,
                                             Position.Bias[] biasRet)
                                       throws BadLocationException{
                
                                      
                while( true ){  
                              
                    pos = super.getNextVisualPositionFrom( pos, b, a, direction, biasRet );
                    View v =getView( getViewIndexAtPosition( pos ) );
                    if( v instanceof FoldableParagraphView ){
                        FoldableParagraphView pv2 = (FoldableParagraphView)v;
                        if( !pv2.isFolded() || pv2.isTopFolded() || pos == -1 )
                            return pos;
                            
                    }
                    else return pos;
                
                }                     
                
            
            }
        //@nonl
        //@-node:zorcanda!.20051103113502:getNextVisualPositionFrom
        //@+node:zorcanda!.20051103113533:getViewIndexAtPosition
            @Override
            public int getViewIndexAtPosition( int ind ){
            
                return super.getViewIndexAtPosition( ind );
            
            } 
        //@nonl
        //@-node:zorcanda!.20051103113533:getViewIndexAtPosition
        //@+node:zorcanda!.20051103113804.1:footnode stuff... might be deleted...
        
         
            public boolean hasFootNode(){  return cd.hasFootNodes(); }
            public String getFootNodeString(){ return cd.getFootNodes(); }
            
            public int calculateStringHeight( String data, FontMetrics fm ){
                
                int x = 0; int y = 0;
                int width = (int)getContainer().getSize().getWidth();
                //System.out.println( getContainer().getSize() );
                //System.out.println( jtp.getSize() );
                if( width == 0 ) return 0;
                //System.out.println( "WIDTH " + width );
                for( char c: data.toCharArray() ){
                
                    //g.drawString( Character.toString( c ), x, y );
                    if( c == '\t' )
                        x += fm.stringWidth( "    " );
                    else
                        x += fm.stringWidth( Character.toString( c ) );
                    if( x >= width || c == '\n' ){
                    
                        x = 0;
                        y += fm.getHeight();
                        //System.out.println( "Y now:" + y );
                    
                    }
                
                
                }    
                //System.out.println( "RETURNING " + y );
                return y + fm.getHeight();
            
            
            }    
        //@nonl
        //@-node:zorcanda!.20051103113804.1:footnode stuff... might be deleted...
        //@-others
    
        
    
    }
    //@-node:zorcanda!.20051102105133:class NoWrapBoxView
    //@+node:zorcanda!.20051102105231:class InvisiblesDrawingLabelView
    static class InvisiblesDrawingLabelView extends LabelView implements InvisiblesObserver{
    
        ColorDeterminer cd; 
        boolean showrectangles;
        NoWrapBoxView root;
        public InvisiblesDrawingLabelView( Element elem , ColorDeterminer cd, NoWrapBoxView root){
        
            super( elem );
            this.cd = cd;
            this.root = root;
            //cd.addInvisiblesObserver( this );
            
        
        }
        
        public void setInvisiblesState( boolean state ){
        
            showrectangles = state;
        
        }
        
        
        
        
        
    
    
        public float getPreferredSpan( int axis ){
        
            if( axis == View.X_AXIS ){
            
                TabExpander ex = getTabExpander();
                if( ex == null ){
                
                    ex = ( TabExpander)this.getParent().getParent();
                    getTabbedSpan( 0, ex );
                
                
                }
            
            
            
            
            }
                    return super.getPreferredSpan( axis );
        
        }
    
            public void paint( Graphics g, Shape r ){
            
                super.paint( g, r );
                if( !root.show_invisibles ) return;
                //if( true )return;
                int start = getStartOffset();
                int end = getEndOffset();
                String txt = null;
                try{
                
                    txt = getDocument().getText( start, end - start );
                
                }
                catch( Exception x ){}
                if( txt == null ) return;
                GlyphPainter gp = getGlyphPainter();
                for( char c: txt.toCharArray() ){
                    //System.out.println( c );
                    if( Character.isWhitespace( c ) && c != '\n' ){
                    
                        try{
                            Rectangle s2 = (Rectangle)gp.modelToView( this, start, Position.Bias.Forward, r );
                            final FontMetrics fm = g.getFontMetrics();
                            Segment s = new Segment( new char[]{ c }, 0, 1 );
                            final int add = Utilities.getTabbedTextWidth( s, fm, s2.x, getTabExpander(), start );
                            final int which_invisible = cd.whichInvisible(); 
                            if( which_invisible == 1 ){
                                g.setColor( cd.getInvisiblesBlock() );
                                g.fillRect( s2.x, s2.y, add, s2.height ); 
                            }
                            else{
                                g.setColor( cd.getInvisiblesDot() );
                                g.drawOval( s2.x, (int)(s2.y + ( s2.height -1 - add )) , add, add );                        
                            
                            }
                        }
                        catch( BadLocationException ble ){}
                    
                    }
                    
                    start++;
                
                }
                
            }
    }     
    //@nonl
    //@-node:zorcanda!.20051102105231:class InvisiblesDrawingLabelView
    //@+node:zorcanda!.20051025184144:class LeoDefaultStyledDocument
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
    //@-node:zorcanda!.20051025184144:class LeoDefaultStyledDocument
    //@+node:zorcanda!.20051027154854:class FoldableParagraphView
    
    static public class FoldableParagraphView extends ParagraphView{
    
        boolean folded;
        boolean topfolded;
        ImageIcon ii;
        ColorDeterminer cd;
        NoWrapBoxView root;
        Image image;
        public FoldableParagraphView( Element e, ImageIcon ii, ColorDeterminer cd , NoWrapBoxView root){
            super( e );
            folded = false;
            topfolded = false;
            this.ii = ii;
            this.cd = cd;
            this.root = root;
            image = null;
        }
        
        
        public void setImage( Image image ){
        
            this.image = image;
        
        }
        
        public void fold(){ 
            folded = true; 
            topfolded = false;   
            root.preferenceChanged( this, true, true ); 
        }
        public void unfold(){ 
            folded = false;  
            topfolded = false;
            root.preferenceChanged( this, true, true );
             }
             
        public void topfold(){ 
                            
            topfolded = true; 
            root.preferenceChanged( this, true, true );
        
        }
        public boolean isFolded() { return folded || topfolded; }
        public boolean isTopFolded(){ return topfolded; }
        
    
        @Override
        public void paint( Graphics g, Shape r ){
        
            if( topfolded ){
                
                    Rectangle r2 = r.getBounds();
                    JComponent jc = (JComponent)getContainer();
                    ((Graphics2D)g).setRenderingHint( RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON );
                    g.setColor( cd.getFoldedBackgroundColor() );
                    g.setFont( jc.getFont() );
                    String data = "";
                    try{
                        Document doc = getDocument();
                        Element e = getElement();
                        int start = e.getStartOffset();
                        int end = e.getEndOffset();
                        data = doc.getText( start, end - start );
    
                    }
                    catch( BadLocationException ble ){}
                    Insets ins = jc.getInsets();
                    g.fillRect( 0, r2.y, jc.getSize().width, r2.height );
                    g.drawImage( ii.getImage(), ins.left , r2.y , null ); 
                    g.setColor( cd.getFoldedForegroundColor() );
                    g.drawString( data + "...", ii.getIconWidth() + ins.left , r2.y + ii.getIconHeight() );
                    return;
            }
            else if( folded ) return;
            else if( image != null ){
                
                g.drawImage( image, 0, 0, null );
                return;
            
            
            }
            super.paint( g, r );
        
        
        }
    
        @Override
        public float getMinimumSpan( int axis ){
            
            if( topfolded ){
             
             if( axis == X_AXIS ) return super.getMinimumSpan( axis ); //getFoldedWidth();
             return ii.getIconHeight();
             
            }
            else if( folded ){
                
                if( axis == X_AXIS ) return 0.0f;     
                return 0.0f;
            
            
            }
            else if( image != null ){
            
                if( axis == X_AXIS ) return image.getWidth( null );
                return image.getHeight( null );
            
            }
            return super.getMinimumSpan( axis );
        
        }
    
        @Override
        public float getMaximumSpan( int axis ){
        
            if( topfolded ){
             
                if( axis == X_AXIS ) return super.getMaximumSpan( axis ); //return getFoldedWidth();  
             return ii.getIconHeight();
             
            }
            else if( folded ){
            
                if( axis == X_AXIS ) return 0.0f;        
                return 0.0f;
            
            
            }
            return super.getMaximumSpan( axis );
        
        
        }
        
        @Override
        public float getPreferredSpan( int axis ){
        
            if( topfolded ){
                if( axis == X_AXIS ) return super.getPreferredSpan( axis ); //return getFoldedWidth();      
             return ii.getIconHeight();
            }
            else if( folded ){
            
                if( axis == X_AXIS ) return 0.0f;         
                return 0.0f;
            
            
            }
            return super.getPreferredSpan( axis );
        
        
        }
        
        /*@Override
        public void changedUpdate( DocumentEvent de, Shape a, ViewFactory vf ){
        
            Document doc = de.getDocument();
            System.out.println( getElement() );
            DocumentEvent.ElementChange ec = de.getChange( getElement() );
            System.out.println( ec );
            try{
            
                System.out.println( "FPVCHANGE:" + doc.getText( de.getOffset(), de.getLength() ) );
                
            }
            catch( BadLocationException ble ){}
        
            super.changedUpdate( de, a, vf );
        }*/
    
    }
    //@-node:zorcanda!.20051027154854:class FoldableParagraphView
    //@+node:zorcanda!.20051103234030:class LineNumberBorder
    public static class LineNumberBorder implements Border{
    
        NoWrapBoxView nwbv;
        JComponent jc;
        public Insets i;
        
        public LineNumberBorder( NoWrapBoxView nwbv ){
        
            this.nwbv = nwbv;
        
        
        }
        
        public void paint(){
    
            Graphics g = null;
            try{
                g = jc.getGraphics();
                nwbv.paintNumbers( g, i.left, jc, false );
    
            }
            catch(Exception x ){ x.printStackTrace();}
            finally{
            
                if( g != null ) g.dispose();
            
            }
        
        
        
        }
    
        public Insets getBorderInsets( Component c ){
        
            if( c == null );
                this.jc =(JComponent)c;
            
            i = nwbv.getInsets();
            return i;
        
        
        
        }
    
    
        public boolean isBorderOpaque(){ return true; }
    
        
        public void paintBorder(Component c, Graphics g, int x, int y, int width, int height){
            
        
            try{
    
                Insets i = getBorderInsets( c );
                nwbv.paintNumbers( g , i.left , jc, true );
            }
            catch( Exception ex ){}
        
        
        }
    
    }
    //@nonl
    //@-node:zorcanda!.20051103234030:class LineNumberBorder
    //@+node:zorcanda!.20051027165305:interface ColorDeterminer
    public static interface ColorDeterminer{
    
        public Map<String, AttributeSet > getColoredTokens();
        public boolean underline();
        public AttributeSet getUndefinedSectionReferenceColor();
        public AttributeSet getSectionReferenceColor();
        public AttributeSet getStringColor();
        public AttributeSet getCommentColor();
        public AttributeSet getDocColor();
        public AttributeSet getNumericColor();
        public String[] getCommentTokens();
        public Color getInvisiblesBlock();
        public Color getInvisiblesDot();
        public boolean showInvisibles();
        public int whichInvisible();
        public AttributeSet getPunctuationColor();
        public boolean drawrectangle();
        public Color getRectangleColor();
        public Color getFoldedBackgroundColor();
        public Color getFoldedForegroundColor();
        public boolean useLineNumbers();
        public Color getLineNumberForeground();
        public Color getCurrentLineNumberForeground();
        public Color getLineNumberBackground();
        public Color getFootNodeBackgroundColor();
        public Color getFootNodeForegroundColor();
        public boolean hasFootNodes();
        public String getFootNodes();
        
    } 
    
    public static interface InvisiblesObserver{
    
        public void setInvisiblesState( boolean state );
    
    }
    
    
    //@-node:zorcanda!.20051027165305:interface ColorDeterminer
    //@-others
    
    
}
//@nonl
//@-node:zorcanda!.20051025184052:@thin leoEditorKit2.java
//@-leo
