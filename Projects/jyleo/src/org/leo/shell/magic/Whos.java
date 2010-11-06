//@+leo-ver=4-thin
//@+node:zorcanda!.20051118223213:@thin Whos.java
//@@language java
package org.leo.shell.magic;

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
import java.awt.Dimension;
import java.util.*;
import javax.swing.text.*;
import javax.swing.table.*;
import javax.swing.*;
import org.python.core.*;


public class Whos implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%whos"; }
    public String getDescription(){
    
        return "%whos --> this command prints out a table of identifiers that have been defined interactively\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().equals( "%whos" );
    
    }

    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051118223213.1:<<command>>
        
        
        List<String> who = js.getWho();
        Collections.sort( who );
        final JTextComponent jtc = js.getShellComponent();
        final Document doc = jtc.getDocument();
        Vector<String> name = new Vector<String>();
        Vector<String> type = new Vector<String>();
        Vector<String> repr = new Vector<String>();
        Iterator<String> names = who.iterator();
        while( names.hasNext() ){
        
            String name2 = names.next();
            try{
                PyObject po = js._pi.get( name2 );
                if( po == null || po == Py.None ) names.remove();
                else{
                
                    Object o = __builtin__.getattr( __builtin__.type( po ), new PyString( "__name__" ) );
                    Object o2 =  __builtin__.repr( po );
                    name.add( name2 ); type.add( o.toString() ); repr.add( o2.toString() );
                
                
                } 
        
            }
            catch( Exception x ){}
        
        }
        DefaultTableModel dtm = new DefaultTableModel();
        dtm.addColumn( "Variable", name );
        dtm.addColumn( "Type", type );
        dtm.addColumn( "Data/Info", repr );
        JTable jt = new JTable( dtm );
        JScrollPane jsp = new JScrollPane( jt );
        int height = jt.getRowHeight() * 5;
        Dimension d = jsp.getPreferredSize();
        d.height = height;
        jsp.setPreferredSize( d );
        final SimpleAttributeSet sas = new SimpleAttributeSet();
        StyleConstants.setComponent( sas, jsp );
        
        Runnable run = new Runnable(){
        
            public void run(){
                try{
                    doc.insertString( jtc.getCaretPosition(), "\n", sas );
                }
                catch(BadLocationException ble ){}
            }
        };
        SwingUtilities.invokeLater( run );
        //@nonl
        //@-node:zorcanda!.20051118223213.1:<<command>>
        //@nl
        return true;
    
    }


}
//@nonl
//@-node:zorcanda!.20051118223213:@thin Whos.java
//@-leo
