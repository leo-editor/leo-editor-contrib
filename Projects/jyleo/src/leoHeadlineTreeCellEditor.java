//@+leo-ver=4-thin
//@+node:zorcanda!.20050411083353:@thin leoHeadlineTreeCellEditor.java
//@@language java

import javax.swing.plaf.*;
import javax.swing.tree.*;
import javax.swing.text.*;
import javax.swing.*;
import javax.swing.border.*;
import java.awt.*;
import java.awt.geom.*;
import java.awt.event.*;
import java.util.EventObject;
import javax.swing.event.*;
import java.util.*;
import java.io.*;



public final class leoHeadlineTreeCellEditor extends KeyAdapter implements TreeCellEditor, DocumentListener{

    public final JTextField _jta;
    private final JLabel _jb;
    private final JPanel _bg;
    private final CommanderSpecification _cs;
    private final Color _ef;
    private final Color _eb;
    private final java.util.List< CellEditorListener > _listeners;
    private final Icon _icon;
    private final JLabel _left;
    private Font _font;
    JTree tree;
    Dimension startsize;
    

    
    public leoHeadlineTreeCellEditor( CommanderSpecification cs ,
                                      final Color edit_foreground,
                                      final Color edit_background, 
                                      Icon icon ){
    
        _cs = cs;
        _ef = edit_foreground;
        _eb = edit_background;
        _icon = icon;
        //SpringLayout sl = new SpringLayout();
        FlowLayout fl = new FlowLayout( FlowLayout.LEFT, 0, 0 );
        _bg = new JPanel( fl );
        _left = new JLabel();
        _bg.add( _left );
        //sl.putConstraint( sl.NORTH, _left, 0, sl.NORTH, _bg );
        //sl.putConstraint( sl.WEST, _left, 0, sl.WEST, _bg );        
        _jb =  new JLabel();
        if( _icon != null ){
        
         _jb.setIcon( _icon );
         _jb.setOpaque( false );
         _bg.setOpaque( false );
         
        }
        else
            _jb.setText( "E" );
        _jb.setToolTipText( "Configure The Headline" );
        _bg.add( _jb );
        //sl.putConstraint( sl.NORTH, _jb, 0, sl.NORTH, _bg );
        //sl.putConstraint( sl.WEST, _jb, 0, sl.EAST, _left );
        
        _jta = new JTextField2();
        _jta.addKeyListener( this );
        _jta.getDocument().addDocumentListener( this );
        _jb.addMouseListener( new HeadlineListener( _jta, cs ) );
        _bg.add( _jta );
        //sl.putConstraint( sl.NORTH, _jta, 0, sl.NORTH, _bg );
        //sl.putConstraint( sl.WEST, _jta, 0, sl.EAST, _jb );
        //sl.putConstraint( sl.SOUTH, _jb, 0, sl.SOUTH, _jta );
        //sl.putConstraint( sl.SOUTH, _bg, 0, sl.SOUTH, _jta );
        //sl.putConstraint( sl.EAST, _bg, 0, sl.EAST, _jta );
        _listeners = new Vector< CellEditorListener >();
    
    }

public final void requestFocusInWindow(){


    _jta.requestFocusInWindow();


}

public final void setFont( Font f ){


    _font = f;


}


public final void setFocusTraversalPolicy( final FocusTraversalPolicy ftp ){

    _jta.setFocusTraversalPolicy( ftp );


}


public final Component getTreeCellEditorComponent(final JTree tree,
                                     final Object value,
                                     final boolean isSelected,
                                     final boolean expanded,
                                     final boolean leaf,
                                     final int row){
                                     
            this.tree = tree;
            startsize = tree.getPreferredSize();    
            final PositionSpecification ps = _cs.currentPosition();
            //System.out.println( value );
            //System.out.println( ps );
            final Color foreground = ps.getForeground();
            final Color background = ps.getBackground();
            final int icon = ps.computeIconFromV();  
    
            Icon i = ps.getIcon();
            if( i == null )
                i = leoIconTreeRenderer._icons[ icon ];
            _left.setIcon( i );
            Font f;
            if( ( f = ps.getFont() ) != null )
                _jta.setFont( f );
            else     
                _jta.setFont( _font );         
            _jta.setText( value.toString() );
            //_jta.setMaximumSize( _jta.getPreferredSize() );
            //_jta.setMinimumSize( _jta.getPreferredSize() );
            _jta.setForeground( _ef );
            _jta.setBackground( _eb );
            if( foreground != null )
                _jta.setForeground( foreground );
            if( background != null ) 
                _jta.setBackground( background );
            
            //setBackgroundSize();
            //_bg.invalidate();
            final Runnable run = new Runnable(){
            
                public final void run(){ resetSize(); }
            
            
            };

            //_bg.setSize( _bg.getPreferredSize() );
            SwingUtilities.invokeLater( run );
            return _bg;                  
                                
                                     
                                     }


    //@    @+others
    //@+node:zorcanda!.20050411083909:addCellEditorListener
    public final void addCellEditorListener( final CellEditorListener l){
    
        _listeners.add( l );
    
    }
    //@nonl
    //@-node:zorcanda!.20050411083909:addCellEditorListener
    //@+node:zorcanda!.20050411083909.1:cancelCellEditing
    public final void cancelCellEditing(){
        
        tree.setPreferredSize( null );
        final ChangeEvent ce = new ChangeEvent( this );
        for( final CellEditorListener cel: _listeners )
            cel.editingCanceled( ce );
    
    
    }
    //@nonl
    //@-node:zorcanda!.20050411083909.1:cancelCellEditing
    //@+node:zorcanda!.20050411083909.2:getCellEditorValue
    public final Object getCellEditorValue(){
    
    
        return _jta.getText();
    
    
    }
    //@nonl
    //@-node:zorcanda!.20050411083909.2:getCellEditorValue
    //@+node:zorcanda!.20050411083909.3:isCellEditable
    public final boolean isCellEditable( final EventObject event ){
    
        return true;
    
    
    }
    //@nonl
    //@-node:zorcanda!.20050411083909.3:isCellEditable
    //@+node:zorcanda!.20050411083940:removeCellEditorListener
    public final void removeCellEditorListener( final CellEditorListener cel ){
    
        _listeners.remove( cel );
    
    
    }
    //@nonl
    //@-node:zorcanda!.20050411083940:removeCellEditorListener
    //@+node:zorcanda!.20050411084045:shouldSelectCell
    public final boolean shouldSelectCell( final EventObject eo ){
    
        return true;
    
    
    }
    //@nonl
    //@-node:zorcanda!.20050411084045:shouldSelectCell
    //@+node:zorcanda!.20050411084045.1:stopCellEditing
    public final boolean stopCellEditing(){
    
        tree.setPreferredSize( null );
        final ChangeEvent ce = new ChangeEvent( this );
        for( final CellEditorListener cel: _listeners )
            cel.editingStopped( ce );
        _cs.beginUpdate();
        _cs.endUpdate();
        return true;
    
    }
    //@nonl
    //@-node:zorcanda!.20050411084045.1:stopCellEditing
    //@+node:zorcanda!.20050412192437:setBackgroundSize
    private final void setBackgroundSize(){
        
        final Dimension size = _jta.getPreferredSize();
        final Dimension lsize = _jb.getPreferredSize();
        size.width = size.width + lsize.width;
        //System.out.println( size );
        //System.out.println( "SIZE " + _jta.getSize() );
        _bg.setPreferredSize( size );
        _bg.setMinimumSize( size );
    
    }
    //@nonl
    //@-node:zorcanda!.20050412192437:setBackgroundSize
    //@+node:zorcanda!.20050411110409:keyPressed
    public final  void keyPressed( final KeyEvent event ){
    
        final char k = event.getKeyChar();
        if( k == '\n' ){
        
            event.consume();
            stopCellEditing();
            return;
        
        
        }
    
        final JTextField source = (JTextField)event.getSource();
        Dimension size = source.getSize();
    	Rectangle vrect1 = tree.getVisibleRect();
        int x = source.getX();
        Point dp = SwingUtilities.convertPoint( source, x, 0, tree );
        int totalw = dp.x + size.width;
        Dimension d= tree.getSize();
        ComponentUI ui = tree.getUI();
        Dimension uips = ui.getPreferredSize( tree );
        if( d.width < totalw ){
            d.width = totalw;
            d.height = uips.height;
            tree.setPreferredSize( d );
            tree.treeDidChange();
            
        }
        else if( vrect1.width > totalw ){
            
            if( tree.isPreferredSizeSet() ){
                tree.setPreferredSize( null );
                tree.treeDidChange();
            }
        
        }
        final DefaultCaret dc = (DefaultCaret)source.getCaret();
        final Point p = dc.getMagicCaretPosition();
        if( p != null ){
            
            final Point p2 = SwingUtilities.convertPoint( source, p, tree );
            final Rectangle r = new Rectangle( p2.x - 5, p2.y, (int)dc.getWidth() + 5, (int)dc.getHeight() );
            Rectangle vrect2 = tree.getVisibleRect();
            class Scroller implements Runnable{
            
                public void run(){
    
                    tree.scrollRectToVisible( r );
                }
            
            }
            if( !vrect2.contains( r ) ){
                Runnable run = new Scroller();
                SwingUtilities.invokeLater( run );
            
            }
        }
    
    }
    //@nonl
    //@-node:zorcanda!.20050411110409:keyPressed
    //@+node:zorcanda!.20051103155234:getHeadline
    public String getHeadline(){
    
        return _jta.getText();
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051103155234:getHeadline
    //@+node:zorcanda!.20050420093849:DocumentListener
    public final void	changedUpdate( final DocumentEvent e){
    
    
    
    }
    
    
    public final void insertUpdate( final DocumentEvent e){
    
        resetSize();
    
    }
    
    
    public final void removeUpdate( final DocumentEvent e ){
    
        resetSize();
    
    }
    
    
    private final void resetSize(){
    
        //final Container parent = _bg;//_bg.getParent();
        //if( parent == null ) return;
    
        _bg.doLayout(); //essential call to calculate the new size, otherwise psize does not reflect the text change...
        final Dimension size = _bg.getPreferredSize();
        _bg.setSize( size );
        //size.width += _jb.getPreferredSize().width;
        //final Insets i = _jta.getInsets();
        //size.width += i.right + i.left + 5;
        //_bg.invalidate();
        //parent.setSize( size );
        //parent.invalidate(); //mark it as invalid...
        //parent.getParent().validate();// so the JTree will recompute it at validation time...
        _bg.revalidate();
    
    }  
    //@nonl
    //@-node:zorcanda!.20050420093849:DocumentListener
    //@+node:zorcanda!.20050411091801:HeadlineListener
    public static final class HeadlineListener extends MouseAdapter{
    
        final JTextComponent _jtc;
        final CommanderSpecification _cs;
        public HeadlineListener( final JTextComponent jtc, CommanderSpecification cs ){
            super();
            _jtc = jtc;
            _cs = cs;
            
        }
    
        public void mousePressed( final MouseEvent me ){
        
            if( me.getButton() == me.BUTTON1 ){
            
                final HeadlineManipulator hm = new HeadlineManipulator( _cs, _jtc );
            
            
            }
        
        
        
        }
    
        //@    @+others
        //@-others
    
    
    }
    //@-node:zorcanda!.20050411091801:HeadlineListener
    //@+node:zorcanda!.20051112204909:JPanel2
        
        public static class JPanel2 extends JPanel{
            
            public JPanel2( LayoutManager2 lm2 ){
            
                super( lm2 );
            
            }
            
        
            public void paintChildren2( Graphics g ){
            
                Graphics2D g2 = (Graphics2D)g;
                AffineTransform transform = g2.getTransform();
                if( transform.getScaleX() != 2.0f ) g2.scale( 2.0, 2.0 );
                super.paintChildren( g2 );
                g2.setTransform( transform );
            
            
            
            }
            
    
            
            public void paintComponent2( Graphics g ){
                //Thread.currentThread().dumpStack();
                Graphics2D g2 = (Graphics2D)g;
                AffineTransform transform = g2.getTransform();
                if( transform.getScaleX() != 2.0f ) g2.scale( 2.0, 2.0 );
                super.paintComponent( g2 );
                g2.setTransform( transform );
            
            
            
            }
        
        
        }
            
        
        public static class JTextField2 extends JTextField{
            
            
            protected Graphics getComponentGraphics2( Graphics g ){
            
                Graphics2D g2 = (Graphics2D)super.getComponentGraphics( g );
                Rectangle r = g2.getClip().getBounds();
                //g2.translate( r.x * 2, r.y * 2 );
                g2.scale( 2.0f, 2.0f );
                //System.out.println( "GCG!" );
                return g2;
            
            }    
          
            public void paintImmediately2( Rectangle r ){
            
                System.out.println( "PM NOW!!!" ); 
                RepaintManager2 rm2 = (RepaintManager2)RepaintManager.currentManager( this );
                rm2.scale();
                super.paintImmediately( r );
            
            }
            
        
            public void paintImmediately2( int x, int y, int w, int h ){
                
                if( true ) return;
                System.out.println( "PM NOW2!!!!" );  
                RepaintManager rm2 = (RepaintManager2)RepaintManager.currentManager( this );
                //x = x * 2;
                //y = y * 2;
                w = w * 2;
                h = h * 2;
                Component jc = this;
                while( !(jc.getParent() instanceof Window) ){
                
                    jc = jc.getParent();
                
                }
                System.out.println( jc );
                Image i = rm2.getVolatileOffscreenBuffer( jc, w, h);
                Graphics2D g = (Graphics2D)i.getGraphics();
                g.scale( 2.0, 2.0 );
                paint( g );
                Graphics g2 = getGraphics();
                g2.drawImage( i, x * 2, y * 2, null );
                //rm2.scale();       
                //super.paintImmediately( x,y,w,h );
            
            }
    
            public void paintComponent2( Graphics g ){
            
                //System.out.println( getParent().getParent() );
                Graphics2D g2 = (Graphics2D)g;
                System.out.println( "JTF!!! " + g2.getTransform().getScaleX() );
                //g2.setRenderingHint( RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON );
                //g2.setRenderingHint( RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON );
                AffineTransform t = g2.getTransform();
                if( t.getScaleX() != 2.0 )
                    g2.scale( 2.0, 2.0 );
                super.paintComponent( g2  );
                g2.setTransform( t );
                Thread.currentThread().dumpStack();
            
            }
        
        
        }    
    //@nonl
    //@-node:zorcanda!.20051112204909:JPanel2
    //@+node:zorcanda!.20050412164945:class HeadlineManipulator
    public final static class HeadlineManipulator{
    
        final CommanderSpecification _cs;
        final PositionSpecification _ps;
        final JFrame _top;
        final JTabbedPane _jtp;
        final JTextComponent _jtc;
        byte[] _data;
        
        public HeadlineManipulator( final CommanderSpecification cs, final JTextComponent jtc ){
        
            super();
            _jtc = jtc;
            _cs = cs;
            _ps = _cs.currentPosition();
            _top = new JFrame();
            _jtp = new JTabbedPane();
            _top.add( _jtp );
            _top.setDefaultCloseOperation( WindowConstants.DISPOSE_ON_CLOSE );
            _top.setTitle( "Configure Headline: " + _ps );
            addForeground();
            addBackground();
            addFont();
            addImage();
            final AbstractAction aa = new AbstractAction( "Close" ){
            
                public final void actionPerformed( final ActionEvent ae ){
                
                    _top.setVisible( false );
                    _top.dispose();
                    _jtc.requestFocusInWindow();
                
                }
            
            
            };
            final JButton close = new JButton( aa );
            JPanel bottom = new JPanel();
            bottom.add( close );
            _top.add( bottom, BorderLayout.SOUTH );
            
            _top.pack();
            final Dimension psize = _top.getPreferredSize();
            final Dimension ssize = Toolkit.getDefaultToolkit().getScreenSize();
            int h_x = ssize.width/2;
            int h_y = ssize.height/2;
            h_x = h_x - psize.width/2;
            h_y = h_y - psize.height/2;
            _top.setLocation( h_x, h_y );
            _top.setVisible( true );
        
        
        }
    
        //@    @+others
        //@+node:zorcanda!.20050412164945.1:addForeground
        private final void addForeground(){
        
            final JPanel panel = new JPanel( new BorderLayout() );
            final JColorChooser _foreground = new JColorChooser( _jtc.getForeground() );
            panel.add( _foreground, BorderLayout.CENTER );
            final JPanel panel2 = new JPanel( new FlowLayout() );
            panel.add( panel2, BorderLayout.SOUTH );
            final AbstractAction aa = new AbstractAction( "Set Foreground Color" ){
            
                public final void actionPerformed( final ActionEvent ae ){
                
                    _ps.setForeground( _foreground.getColor() );
                    _cs.beginUpdate();
                    _cs.endUpdate();
                
                }   
            
            };
            final JButton set_color = new JButton( aa );
            panel2.add( set_color );
            final AbstractAction aa2 = new AbstractAction( "Clear Foreground Color" ){
            
                public final void actionPerformed( final ActionEvent ae ){
                
                    _ps.setForeground( null );
                    _cs.beginUpdate();
                    _cs.endUpdate();
                
                }
            
            
            };
            final JButton clear_foreground = new JButton( aa2 );
            panel2.add( clear_foreground );
            
            
            _jtp.addTab( "Foreground", panel );
            
        
        }
        //@nonl
        //@-node:zorcanda!.20050412164945.1:addForeground
        //@+node:zorcanda!.20050412164945.2:addBackground
        private final void addBackground(){
        
            final JPanel panel = new JPanel( new BorderLayout() );
            final JColorChooser _background = new JColorChooser( _jtc.getForeground() );
            _jtp.addTab( "Background", _background );
            panel.add( _background, BorderLayout.CENTER );
            final JPanel panel2 = new JPanel( new FlowLayout() );
            panel.add( panel2, BorderLayout.SOUTH );
            final AbstractAction aa = new AbstractAction( "Set Background Color" ){
            
                public final void actionPerformed( final ActionEvent ae ){
                
                    _ps.setBackground( _background.getColor() );
                    _cs.beginUpdate();
                    _cs.endUpdate();
                
                
                }   
            
            };
            final JButton set_color = new JButton( aa );
            panel2.add( set_color );
            final AbstractAction aa2 = new AbstractAction( "Clear Background Color" ){
            
                public final void actionPerformed( final ActionEvent ae ){
                
                    _ps.setBackground( null );
                    _cs.beginUpdate();
                    _cs.endUpdate();
                
                }
            
            
            };
            final JButton clear_foreground = new JButton( aa2 );
            panel2.add( clear_foreground );
            
            
            _jtp.addTab( "Background", panel );
        
        }
        //@nonl
        //@-node:zorcanda!.20050412164945.2:addBackground
        //@+node:zorcanda!.20050412164945.3:addFont
        private final void addFont(){
        
            final SpringLayout sl = new SpringLayout();
            final JPanel fonts = new JPanel( sl );
            _jtp.addTab( "Font", fonts );
            final GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
            final String[] name = ge.getAvailableFontFamilyNames();
            final Object[] names = new Object[ name.length ];
            System.arraycopy( name, 0, names, 0, name.length );
                    
            final Font cfont = _ps.getFont();
            final JList jl = new JList( names );
            jl.setSelectionMode( ListSelectionModel.SINGLE_SELECTION );
            if( cfont != null )
                jl.setSelectedValue( cfont.getName() , true );
            else
                jl.setSelectedIndex( 0 );
            final JScrollPane jsp  = new JScrollPane( jl );
            final Border b = jsp.getBorder();
            final TitledBorder tb = new TitledBorder( b );
            tb.setTitle( "Fonts" );
            jsp.setBorder( tb );
            fonts.add( jsp );
            sl.putConstraint( sl.NORTH, jsp, 5, sl.NORTH, fonts );
            sl.putConstraint( sl.WEST, jsp, 5, sl.WEST, fonts );
            sl.putConstraint( sl.EAST, fonts, 5, sl.EAST, jsp );
                    
                    
            final KeyAdapter ka = new KeyAdapter(){        
                    
                public void keyPressed( final KeyEvent event ){
                        
                    final char c = event.getKeyChar();
                    if( !Character.isDigit( c ) ) event.consume();    
                        
                }
                        
                public final void keyReleased( final KeyEvent event ){
                        
                    final char c = event.getKeyChar();
                    if( !Character.isDigit( c ) ) event.consume();     
                        
                }
                        
                public final void keyTyped( final KeyEvent event ){
                        
                    final char c = event.getKeyChar();
                    if( !Character.isDigit( c ) ) event.consume();
                             
                }
                    
                    
            };
            final JSpinner size = new JSpinner( new SpinnerNumberModel( 0, 0, Integer.MAX_VALUE, 1 ) );
            JSpinner.NumberEditor ne = new JSpinner.NumberEditor( size );
            size.setEditor( ne );
            if( cfont != null ) size.setValue( cfont.getSize() );
            Border b2 = size.getBorder();
            TitledBorder tb2 = new TitledBorder( b2 );
            tb2.setTitle( "Size" );
            size.setBorder( tb2 );
            ne.getTextField().addKeyListener( ka );
            size.setMaximumSize( size.getPreferredSize() );
            fonts.add( size );
            sl.putConstraint( sl.NORTH, size, 5, sl.SOUTH, jsp );
            
            JPanel buttons2 = new JPanel( new GridLayout( 2, 2 ) );
            final JCheckBox bold = new JCheckBox( "Bold" );
            if( _ps.getBold() ) bold.setSelected( true );
            buttons2.add( bold );
            final JCheckBox italic = new JCheckBox( "Italic" );
            if( _ps.getItalic() ) italic.setSelected( true );
            buttons2.add( italic );
            final JCheckBox underline = new JCheckBox( "underline" );
            if( _ps.getUnderline() ) underline.setSelected( true );
            buttons2.add( underline );
            final JCheckBox strikethrough = new JCheckBox( "strikethrough" );
            if( _ps.getStrikeThrough() ) strikethrough.setSelected( true );
            buttons2.add( strikethrough );
            fonts.add( buttons2 );
            sl.putConstraint( sl.NORTH, buttons2, 5, sl.SOUTH, jsp );
            sl.putConstraint( sl.WEST, buttons2, 5, sl.EAST, size );
            
                 
            String characters = "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ1234567890";
            final JTextField preview = new JTextField( characters );
            preview.setBackground( Color.WHITE );
            preview.setForeground( Color.BLACK );
            JScrollPane presp = new JScrollPane( preview );
            Border b3 = presp.getBorder();
            TitledBorder tb3 = new TitledBorder( b3 );
            tb3.setTitle( "Font preview" );
            presp.setBorder( tb3 );
            fonts.add( presp );
            sl.putConstraint( sl.NORTH, presp, 5, sl.SOUTH, size );
            sl.putConstraint( sl.EAST, presp, 5, sl.EAST, fonts );
            sl.putConstraint( sl.WEST, presp, 5, sl.WEST, fonts );
            final ListSelectionListener lsl = new ListSelectionListener(){        
                    
                public void valueChanged( final ListSelectionEvent lse ){
                        
                    String family = (String)jl.getSelectedValue();
                    int sz = (Integer)size.getValue();
                    Font f = Font.decode( family + "-" + sz );
                    preview.setFont( f );
                        
                        
                }
                    
                    
            };
            ChangeListener cl = new ChangeListener(){ 
            
                public void stateChanged( ChangeEvent ce ){ 
                        lsl.valueChanged( null ); 
                        
                        }
            };
            jl.addListSelectionListener( lsl );
            size.addChangeListener( cl );
            
            JPanel buttons = new JPanel( new FlowLayout() );     
            final AbstractAction aa = new AbstractAction( "Set Font" ){
            
                public final void actionPerformed( final ActionEvent ae ){
                
                    _ps.setUnderline( underline.isSelected() );
                    _ps.setStrikeThrough( strikethrough.isSelected() );
                    _ps.setItalic( italic.isSelected() );
                    _ps.setBold( bold.isSelected() );
                    String font = (String )jl.getSelectedValue();
                    int sz = (Integer)size.getValue();
                    final Font f = Font.decode( font + "-" + sz );
                    _ps.setFont( f );
                    _cs.beginUpdate();
                    _cs.endUpdate();
                
                }
            
            
            };
            JButton set_font = new JButton( aa );
            buttons.add( set_font );
            
            final AbstractAction aa2 = new AbstractAction( "Clear Font" ){
            
                public final void actionPerformed( final ActionEvent ae ){
                
                    _ps.setBold( false );
                    _ps.setItalic( false );
                    _ps.setStrikeThrough( false );
                    _ps.setUnderline( false );
                    _ps.setFont( null );
                    _cs.beginUpdate();
                    _cs.endUpdate();
                
                }
            
            
            
            };
            
            JButton clear_font = new JButton( aa2 );
            buttons.add( clear_font );
            
            fonts.add( buttons );
            sl.putConstraint( sl.NORTH, buttons, 5, sl.SOUTH, presp );
            sl.putConstraint( sl.SOUTH, fonts, 5, sl.SOUTH, buttons );
                     
        
        }
        //@-node:zorcanda!.20050412164945.3:addFont
        //@+node:zorcanda!.20050412164945.4:addImage
        private final void addImage(){
        
            final JPanel image = new JPanel();
            _jtp.addTab( "Image", image );
            final SpringLayout sl2 = new SpringLayout();
            image.setLayout( sl2 );
            final JTextField jtf3 = new JTextField( 30 );
            final Border b4 = jtf3.getBorder();
            final TitledBorder tb4 = new TitledBorder( b4 );
            tb4.setTitle( "Path to Image:" );
            jtf3.setBorder( tb4 );
            final JLabel _image = new JLabel();
            jtf3.setMaximumSize( jtf3.getPreferredSize() );
                    
            image.add( jtf3 );
            sl2.putConstraint( sl2.NORTH, jtf3, 5, sl2.NORTH, image );
            sl2.putConstraint( sl2.WEST, jtf3, 5, sl2.WEST, image );        
            final AbstractAction aa3 = new AbstractAction( "Browse" ){
                    
                public final void actionPerformed( final ActionEvent ae ){
                        
                    final JFileChooser jfc = new JFileChooser();
                    final int result = jfc.showOpenDialog( _top.getContentPane() );
                    if( result == jfc.APPROVE_OPTION ){
                            
                        try{
                                
                            final File path = jfc.getSelectedFile();
                            final String abpath = path.getAbsolutePath();
                            jtf3.setText( abpath );
                            final FileInputStream fis = new FileInputStream( path );
                            long len = path.length();
                            _data = new byte[ (int)len ];
                            int start = 0;
                            while( len != 0 ){
                                    
                                final int amount = fis.read( _data, start, (int)(len - start) );
                                start += amount;
                                len -= amount;
                                
                                }
                                
                                
                            //ImageIcon ii = new ImageIcon( data );
                            //data = data;
                            _image.setIcon( new ImageIcon( _data ) );
        
                        }
                        catch( final IOException io ){}
                            
                            
                            }
                        }            
                    
            };
                    final JButton jb3 = new JButton( aa3 );
                    image.add( jb3 );
                    sl2.putConstraint( sl2.NORTH, jb3, 5, sl2.NORTH, image );
                    sl2.putConstraint( sl2.WEST, jb3, 0, sl2.EAST, jtf3 );
                    sl2.putConstraint( sl2.EAST, image, 5, sl2.EAST, jb3 );
                    
                    final JPanel _iholder = new JPanel();
                    _iholder.add( _image );
                    final JScrollPane jsp3 = new JScrollPane( _iholder );
                    final Border b5 = jsp3.getBorder();
                    final TitledBorder tb5 = new TitledBorder( b5 );
                    tb5.setTitle( "Image Preview" );
                    jsp3.setBorder( tb5 );
                    image.add( jsp3 );
                    sl2.putConstraint( sl2.NORTH, jsp3 , 5, sl2.SOUTH, jtf3 );
                    sl2.putConstraint( sl2.EAST, jsp3, 5, sl2.EAST, image );
                    sl2.putConstraint( sl2.WEST, jsp3, 5, sl2.WEST, image );
                    
                    final AbstractAction a4 = new AbstractAction( "Add Image" ){
                    
                        public final void actionPerformed( final ActionEvent ae ){
                        
                            //ImageIcon i = (ImageIcon)_image.getIcon();
                            if( _data != null ){
                                
                                   _ps.setImage( _data );    
                                   _cs.beginUpdate();
                                   _cs.endUpdate();
                                
                                }    
                        
                        
                        }
                    
                    
                    };
                    final JButton add_image = new JButton( a4 );
                    image.add( add_image );
                    sl2.putConstraint( sl2.NORTH, add_image,5 , sl2.SOUTH, jsp3 );
                    sl2.putConstraint( sl2.SOUTH, image, 5, sl2.SOUTH, add_image );
                    final AbstractAction a5 = new AbstractAction( "Remove Current Image" ){
                    
                        public final void actionPerformed( final ActionEvent ae ){
                        
                            _ps.setImage( null );
                            _cs.beginUpdate();
                            _cs.endUpdate();
                        
                        }
                    
                    
                    
                    };
            final JButton rci = new JButton( a5 );
            image.add( rci );
            sl2.putConstraint( sl2.NORTH, rci ,5 , sl2.SOUTH, jsp3 );
            sl2.putConstraint( sl2.WEST, rci, 5, sl2.EAST, add_image ); 
                    
        
        
        
        
        }
        //@nonl
        //@-node:zorcanda!.20050412164945.4:addImage
        //@-others
    
    
    
    
    
    
    }
    
    
    
    //@-node:zorcanda!.20050412164945:class HeadlineManipulator
    //@-others
    



}


//@-node:zorcanda!.20050411083353:@thin leoHeadlineTreeCellEditor.java
//@-leo
