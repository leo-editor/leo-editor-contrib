//@+leo-ver=4-thin
//@+node:zorcanda!.20051114115810:@thin Ls.java
//@@language java
package org.leo.shell.magic;

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.leo.shell.widget.UneditableTableModel;
import javax.swing.text.*;
import java.io.*;
import java.awt.*;
import javax.swing.*;
import javax.swing.table.*;
import java.util.*;

public class Ls implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%ls"; }
    public String getDescription(){
    
        return "%ls - this will show the contents of the current working directory\n"+
    "Placing a reference name after %ls will put a java array of File instances\n\n"+
    "in the reference: %ls a #a now holds a java array of File instances\n\n"; 
    
    } 

    public boolean handle( String command ){
    
        return ( command.startsWith( "%ls " ) || command.trim().equals( "%ls" ) );
    
    }

    public boolean doMagicCommand( final String command ){
    
        Runnable run = new Runnable(){
            public void run(){
                //@                <<command>>
                //@+node:zorcanda!.20051114115810.1:<<command>>
                JTextComponent jtc = js.getShellComponent();
                final Document doc = jtc.getDocument();
                final int pos = jtc.getCaretPosition();
                try{
                        
                    File cwd = js.getCurrentWorkingDirectory();
                    final String[] tokens = command.split( "\\s+" );
                    if( tokens.length >= 2 ){
                        
                        final File[] files = cwd.listFiles();
                        final String reference = tokens[ 1 ];
                        js._pi.set( reference, files );
                        return;
                        
                        
                    }
                        
                    final String[] names = cwd.list();
                    final Map< String, File > fm = new HashMap< String, File >();
                    for( final File f: cwd.listFiles() ){
                        
                        fm.put( f.getName(), f );
                            
                    }
                    Arrays.sort( names );
                    final Vector< String > files = new Vector< String >();
                    final Vector< String > type = new Vector< String >();
                    final Vector< Long > length = new Vector< Long>();
                    final Vector< Date > modified = new Vector< Date >();
                    final Vector< Boolean> read = new Vector< Boolean >();
                    final Vector< Boolean> write = new Vector< Boolean >();   
                    for( final String name: names ){
                        
                        final File f = fm.get( name );
                        files.add( name );
                        if( f.isFile() )
                            type.add( "File" );
                        else if( f.isDirectory() )
                            type.add( "Directory" );
                        else if( f.isHidden() )
                            type.add( "Hidden" );
                        else 
                            type.add( "Unknown" );
                        
                        length.add( f.length() );
                        modified.add( new Date( f.lastModified() ) );
                        read.add( f.canRead() );
                        write.add( f.canWrite() );
                            
                    }
                        
                        
                    final DefaultTableModel dtm = new UneditableTableModel();
                    dtm.addColumn( "File", names );
                    dtm.addColumn( "Type", type );
                    dtm.addColumn( "Size", length );
                    dtm.addColumn( "Modified", modified );
                    dtm.addColumn( "Read", read );
                    dtm.addColumn( "Write", write );
                        
                    final JTable jt = new JTable( dtm );
                    jt.setAutoResizeMode( jt.AUTO_RESIZE_OFF );
                    final int height = jt.getRowHeight();
                    final Dimension size = jt.getPreferredSize();
                    size.height = height * 6;
                    final JScrollPane jsp = new JScrollPane( jt );
                    jsp.setPreferredSize( size );
                    final SimpleAttributeSet sas = new SimpleAttributeSet();
                    StyleConstants.setComponent( sas, jsp );
                    doc.insertString( pos, "\n" , sas );
                    
                }
                catch( final BadLocationException ble ){
                    
                    ble.printStackTrace();
                    //visualException( ble.toString() );
                }
                //@nonl
                //@-node:zorcanda!.20051114115810.1:<<command>>
                //@nl
            }
        };
        SwingUtilities.invokeLater( run );
        return true;
    
    }



}
//@nonl
//@-node:zorcanda!.20051114115810:@thin Ls.java
//@-leo
