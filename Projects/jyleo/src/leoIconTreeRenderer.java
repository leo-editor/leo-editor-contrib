//@+leo-ver=4-thin
//@+node:orkman.20050218182202:@thin leoIconTreeRenderer.java
//@@language java
import java.awt.*;
import java.awt.event.FocusListener;
import java.awt.image.*;
import javax.swing.*;
import javax.swing.tree.*;
import javax.swing.text.*;
import java.util.concurrent.*;
import java.util.*;


public final class leoIconTreeRenderer extends DefaultTreeCellRenderer{

    final Object _root;
    final JLabel _rootComponent;
    static public ImageIcon[] _icons;
    final Color _fg;
    final Color _bg;
    final JTextPane _jta;
    final JTextField _jtf;
    final DefaultStyledDocument doc;
    final JLabel _jl;
    //final Box _box;
    final JPanel _jp;
    JLabel dl;
    boolean do_directive_color;
    boolean do_brackets_color;
    Color directive_color;
    Color brackets_color;
    final Map directives;
    final Font normal_font;
    //Exchanger<String> go;
    
    JPanel _jp2;
    JLabel _image;
    JLabel _image2;
    JLabel _comments;
    
    Icon comment;
    
    public leoIconTreeRenderer( final Object root,
                                final ImageIcon[] icons, 
                                final Color fg, 
                                final Color bg,
                                boolean do_brackets,
                                Color brackets_color,
                                boolean do_directives,
                                Color directive_color,
                                Map directives ){ 
    
        _root = root;
        do_brackets_color = do_brackets;
        this.brackets_color = brackets_color;
        do_directive_color = do_directives;
        this.directive_color = directive_color;
        this.directives = directives;
        _icons = icons;
        _rootComponent = new JLabel();
        _fg = fg;
        _bg = bg;
        _jta = new JTextPane();
        _jta.setOpaque( false );
        _comments = new JLabel();
        normal_font = _jta.getFont();
        _jtf = new JTextField();
        _jtf.setOpaque( false );
        _jl = new JLabel();
        _jl.setOpaque( false );
        FlowLayout fl = new FlowLayout();
        fl.setVgap( 1 );
        fl.setHgap( 0 );
        _jp = new JPanel( fl );
        _jp.add( _jl );
        _jp.add( _comments );
        _jp.add( _jta );
        //_jp.add( _comments );
        _jp.setOpaque( false );
        doc = new DefaultStyledDocument();
        _jta.setDocument( doc );
        
        FlowLayout fl2 = new FlowLayout();
        _jp2 = new JPanel( fl2 );
        fl2.setVgap( 0 );
        fl2.setHgap( 0 );
        _image = new JLabel();
        _image2 = new JLabel();

        _jp2.add( _image );
        _jp2.add( _image2 );
        //_jp.add( _comments );
        _jp2.setOpaque( false );
        //go = new Exchanger<String>();
        //Thread t = new Thread( this );
        //t.setDaemon( true );
        //t.start();
    
    }
    
    public void setCommentIcon( Icon ci ){
    
        comment = ci;
    
    }
    
    public Icon getCommentIcon(){
    
        return comment;
    
    }
    
    public void addFocusListener( FocusListener fl ){
    
        super.addFocusListener( fl );
        _jta.addFocusListener( fl );
        _jp2.addFocusListener( fl );
    
    
    }
    
    public static class JPanel2 extends JPanel{
    
        public JPanel2( LayoutManager lm ){
        
            super( lm );
        
        }
        
        public void paint( Graphics g ){
            
            Graphics2D g2 = (Graphics2D)g;
            g2.setRenderingHint( RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON );
            g2.setRenderingHint( RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON );
            super.paint( g2  );
        
        
        }
    
    
    }    

    public final Component getTreeCellRendererComponent( final JTree tree, final Object value, 
                                                         final boolean sel, final boolean expanded,
                                                         final boolean leaf, final int row,
                                                         final boolean hasFocus ){
        Color bg = null;
        Color fg = null;  
                      
        boolean bold = false;
        boolean italic = false;                                               
                                                         
        if( value == _root ) return _rootComponent;
        else{
        
            final PositionSpecification p = (PositionSpecification)value;
            final int icon = p.computeIconFromV();
            ImageIcon current = _icons[ icon ];
            ImageIcon current2 = p.getIcon();
            //if( p.tnodeHasUA( "__commentaries" ) )
            //    _comments.setIcon( comment );
            //else
             //   _comments.setIcon( null );
            
            if( current2 != null ){
             
             current = current2;
             
             
             }
            
            _jl.setIcon( current );
            setClosedIcon( current );
            setOpenIcon( current );
            setLeafIcon( current );
            
            ImageIcon ii = p.getImage();
            if( ii != null ){
            
            
                _image.setIcon( current );
                _image2.setIcon( ii );
                return _jp2;
            
            
            
            }
            
            try{
            
                SimpleAttributeSet sas = new SimpleAttributeSet();
                
                if( !sel ){
                
                    bg = p.getBackground();
                    if( bg == null ) bg = _bg;
                    _jta.setBackground( bg );
                    fg = p.getForeground();
                    if( fg == null ) fg = _fg;
                    _jta.setForeground( fg );
                
                }
                else{
                
                    _jta.setForeground( _jta.getSelectedTextColor() );
                    _jta.setBackground( _jta.getSelectionColor() );
                
                
                
                }
                
                StyleConstants.setBackground( sas, _jta.getBackground() );
                StyleConstants.setForeground( sas, _jta.getForeground() );
                
                
                if( p.getUnderline() )
                    StyleConstants.setUnderline( sas, true );
                if( p.getStrikeThrough() )
                    StyleConstants.setStrikeThrough( sas, true );
                if( p.getItalic() ){
                    
                    italic = true;
                    StyleConstants.setItalic( sas, true );
                    
                    }
                if( p.getBold() ){
                    bold = true;
                    StyleConstants.setBold( sas, true );
                    
                }
                Font f;
                if( ( f= p.getFont() ) != null ){
                
                    _jta.setFont( f );
                    _jtf.setFont( f );
                
                
                }
                else{
                
                    //_jta.setFont( normal_font );
                    //_jtf.setFont( normal_font );
                    _jta.setFont( getFont() );
                    _jtf.setFont( getFont() );
                
                
                
                }
                
                
                SimpleAttributeSet sas2 = new SimpleAttributeSet( sas );
                //System.out.println( value.getClass() );
                PositionSpecification ps = (PositionSpecification)value;
                TnodeBodyText tnt = ps.getTnodeBodyText();
                String headline = tnt.getHeadString(); //value.toString();
                //String headline = value.toString();
                String check = headline.trim();
                String start = "";
                String end = "";
                
                //go.exchange( null );
                //go.exchange( null );
                if( do_brackets_color && check.startsWith( "<"+ "<" ) && check.endsWith( ">" +">" ) ){
                
                    int i = headline.indexOf( "<" + "<" );
                    int i2 = headline.lastIndexOf( ">" + ">" );
                    start = headline.substring( 0, i + 2 );
                    end = headline.substring( i2 );
                    headline = headline.substring( i + 2, i2 );
                    StyleConstants.setForeground( sas2, brackets_color );
                
                
                }
                else if ( do_directive_color ){
                
                    final String[] tokens = check.split( "\\s" );
                    if( directives.containsKey( tokens[ 0 ] ) ){
                    
                        int i = headline.indexOf( tokens[ 0 ] );
                        int len = tokens[ 0 ].length();
                        start = headline.substring( 0, i + len );
                        headline = headline.substring( i + len );
                        StyleConstants.setForeground( sas2, directive_color );
                    
                    
                    }
                              
                
                }
                
                //final Thread cwriter = doc.getCurrentWriter2();
                //final Thread current = Thread.currentThread();
                //if( cwriter != null ) return this;

                doc.remove( 0, doc.getLength() );
                doc.insertString( 0, start, sas2 );
                doc.insertString( _jta.getCaretPosition() , headline, sas );
                doc.insertString( _jta.getCaretPosition(), end, sas2 );
                    
            
                
            }
            catch( Exception x ){
            
                System.out.println( x );
               // x.printStackTrace();
            
            }
        

        
                
        
        }                                                     
        
        //Component c = super.getTreeCellRendererComponent( tree, value, sel, expanded, leaf, row, hasFocus );                                       //setBackgroundNonSelectionColor( bg );
        //setForeground( fg );
        
        //_jp.setSize( _jta.getPreferredSize() );
        _jtf.setText( _jta.getText() );
        Dimension ps = _jtf.getPreferredSize();
        Dimension ps2 = _jta.getPreferredSize();
        ps2.height = ps.height;
        Font f = _jta.getFont();
        int which = 0;
        if( bold )
            which |= f.BOLD;
        if( italic )
            which |= f.ITALIC;
        if( which != 0 ) f = f.deriveFont( which );
            
        FontMetrics fm = _jta.getFontMetrics( f );
        ps2.width =  fm.stringWidth( _jta.getText() ) + _jta.getMargin().left + _jta.getMargin().right; 
        _jta.setPreferredSize( ps2 );
        //_jta.revalidate();
        
        //System.out.println( ps2 );
        //System.out.println( tree.getRowHeight()) ;
        //if( tree.getRowHeight() < ps2.height )
        //     tree.setRowHeight( ps2.height );
        //_jta.setMinimumSize( ps2 );
        
        
        return _jp;
        //return c;        
                                                         
                                                         
                                                         
    }

    //@    @+others
    //@-others


}



//@+at
// class lsrender( stree.DefaultTreeCellRenderer ):
//     def __init__( self, c ):
//         stree.DefaultTreeCellRenderer.__init__( self )
//         self.c = c
//         self.images = {}
//         for z in xrange( 16 ):
//             num = z
//             if num < 10:
//                 num = "0%s" % num
//             self.images[ z ] = swing.ImageIcon( "../Icons/box%s.GIF" % num 
// )
// 
//         self.openN = swing.ImageIcon( "../Icons/minusnode.GIF" )
//         self.closedN = swing.ImageIcon( "../Icons/plusnode.GIF" )
//         self._rootComponent = swing.JLabel()
//         self.normalcolor = awt.Color.WHITE
//         self.curColor = self.getBackgroundSelectionColor()
//         #self.null = swing.JLabel()
//     def getTreeCellRendererComponent( self, tree, value, sel, expanded, 
// leaf, row, hasFocus ):
//         #if value.__class__ == leoNodes.position and value.v != None :
//         #if hasattr( value, 'v' ) and len( self.c.hoistStack ) != 0:
//         #    hN = self.c.hoistStack[ -1 ][ 0 ].copy()
//         #    if hN == value: row = 0
//         #    elif not hN.isAncestorOf( value ):
//         #         value = self.null
//         #         return None
//         #         #return self.null
//         if hasattr( value, "v" ):# and value != self.null:
//             icon = value.v.computeIcon()
//             image = self.images[ icon ]
//             self.setOpenIcon( image )
//             self.setClosedIcon( image )
//             self.setLeafIcon( image )
//             #self.setSelectedIcon( image )
//             cp = value.c.currentPosition()
//             if cp == value:
//                 self.setBackgroundNonSelectionColor( self.curColor )
//             else:
//                 self.setBackgroundNonSelectionColor( self.normalcolor )
//         else:
//             return self._rootComponent
//         tcr = stree.DefaultTreeCellRenderer.getTreeCellRendererComponent( 
// self, tree, value, sel, expanded, leaf, row, hasFocus )
//         return tcr
// 
// 
// 
//@-at
//@-node:orkman.20050218182202:@thin leoIconTreeRenderer.java
//@-leo
