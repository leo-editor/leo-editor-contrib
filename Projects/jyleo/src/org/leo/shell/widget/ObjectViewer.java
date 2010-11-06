//@+leo-ver=4-thin
//@+node:zorcanda!.20051117114153:@thin ObjectViewer.java
//@@language java
package org.leo.shell.widget;

import java.awt.*;
import javax.swing.*;
import javax.swing.table.*;
import javax.swing.border.*;
import javax.swing.text.*;
import java.util.Map;
import java.util.Vector;

public class ObjectViewer extends JPanel{ 

    final JTextField clazz;
    final JTextArea doc_string;
    final JTable bases;
    final JTable attributes;
    final JTable methods;
    //final JTable fields;

    public ObjectViewer(){
    
        super();
        //setLayout( new GridLayout( 1, 3 ) );
        setLayout( new BorderLayout() );
        //Box container = Box.createVerticalBox();
        //add( container );
        //setBackground( Color.BLACK );
        //final SpringLayout sl = new SpringLayout();
        //setLayout( sl );
        clazz = new JTextField();
        clazz.setEditable( false );
        titleBorder( "Class:", clazz );
        //JPanel jp1 = new JPanel();
        //jp1.add( clazz );
        add( clazz, BorderLayout.NORTH );
        //sl.putConstraint( sl.NORTH, clazz, 0, sl.NORTH, this );
        //sl.putConstraint( sl.WEST, clazz, 0, sl.WEST, this );
        //sl.putConstraint( sl.EAST, clazz, 0, sl.EAST, this );
        
        JPanel dandb = new JPanel( new GridLayout( 1, 2 ) );
        doc_string = new JTextArea();
        //dandb.add( doc_string );
        doc_string.setEditable( false );
        JScrollPane djsp = new JScrollPane( doc_string );
        dandb.add( djsp );
        titleBorder( "DocString:", djsp );
        bases = new JTable();
        bases.setTableHeader( null );
        JScrollPane bjsp = new JScrollPane( bases );
        titleBorder( "Base Classes:", bjsp );
        dandb.add( bjsp );
        add( dandb, BorderLayout.CENTER );
        //sl.putConstraint( sl.NORTH, djsp ,5, sl.SOUTH, clazz );
        //sl.putConstraint( sl.WEST, djsp , 0, sl.WEST, this );
        //sl.putConstraint( sl.EAST, djsp , 0, sl.EAST, this );
        
        //final JPanel lists = new JPanel( new FlowLayout() );
        final JTabbedPane jtp = new JTabbedPane();
        //lists.setOpaque( false );
        add( jtp, BorderLayout.SOUTH );
        attributes = new JTable();
        Dimension size = jtp.getPreferredSize();
        size.height = attributes.getRowHeight() * 5;
        dandb.setPreferredSize( size );
        //jtp.setPreferredSize( size );
        JScrollPane ajs = new JScrollPane( attributes );
        ajs.setPreferredSize( size );
        jtp.add( "Attributes", ajs );
        //fields = new JTable();
        //JScrollPane fjs = new JScrollPane( fields );
        //fjs.setPreferredSize( size );
        //jtp.add( "Java Fields", fjs );
        methods = new JTable();
        //methods.setAutoResizeMode( methods.AUTO_RESIZE_OFF );
        JScrollPane mjs = new JScrollPane( methods );
        mjs.setPreferredSize( size );
        jtp.add( "Methods/Functions", mjs );
    
    
    }


    //@    @+others
    //@+node:zorcanda!.20051117114153.1:titleBorder
    private final void titleBorder( final String title, final JComponent jc ){
    
        final Border b = jc.getBorder();
        final TitledBorder tb = new TitledBorder( b );
        tb.setTitle( title );
        jc.setBorder( tb );
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051117114153.1:titleBorder
    //@+node:zorcanda!.20051117114153.2:setClassName
    public final void setClassName( final String name ){
    
        clazz.setText( name );
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051117114153.2:setClassName
    //@+node:zorcanda!.20051117114153.3:setBases
    public final void setBases( final Vector bses ){
    
        DefaultTableModel dtm = new UneditableTableModel();
        dtm.addColumn( "Bases", bses );
        bases.setModel( dtm );
    
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051117114153.3:setBases
    //@+node:zorcanda!.20051117114153.4:setDocString
    public final void setDocString( final String doc ){
    
        doc_string.setText( doc );
        doc_string.setCaretPosition( 0 );
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051117114153.4:setDocString
    //@+node:zorcanda!.20051117114153.5:setJythonAttributes
    public final void setJythonAttributes( final Map< String, Vector<String> > columns ){
    
        //attributes.setListData( atts );
        DefaultTableModel dtm = new UneditableTableModel( );
        for( String key: columns.keySet() )
            dtm.addColumn( key, columns.get( key ) );
        attributes.setModel( dtm );
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051117114153.5:setJythonAttributes
    //@+node:zorcanda!.20051117114153.6:setJavaMethods
    public final void setJavaMethods( final Map< String, Vector<String>> columns ){
    
        //methods.setListData( meths );
        final DefaultTableModel dtm = new UneditableTableModel();
        for( String key: columns.keySet() )
            dtm.addColumn( key, columns.get( key ) );
        methods.setModel( dtm );
        methods.doLayout();
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051117114153.6:setJavaMethods
    //@+node:zorcanda!.20051117114153.7:setJavaFields
    public final void setJavaFields( final Map< String, Vector<String>> columns ){
    
        //fields.setListData( field );
         final DefaultTableModel dtm = new UneditableTableModel();
         for( String key: columns.keySet() )
            dtm.addColumn( key, columns.get( key ) );
         //fields.setModel( dtm );
    
    }
    //@nonl
    //@-node:zorcanda!.20051117114153.7:setJavaFields
    //@-others



}
//@nonl
//@-node:zorcanda!.20051117114153:@thin ObjectViewer.java
//@-leo
