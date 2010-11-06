//@+leo-ver=4-thin
//@+node:zorcanda!.20051114104215:@thin Threads.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import java.util.*;
import javax.swing.*;
import java.awt.*;
import javax.swing.event.*;
import javax.swing.text.*;
import javax.swing.table.*;



public class Threads implements MagicCommand{


    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%threads"; }
    public String getDescription(){
    
        return "%threads -- shows the threads running and the state they are in.  Selecting a thread results in\n"+
    "the stack of the thread being shown.\n\n"; 
    
    } 

    public boolean handle( String command ){
    
        return command.equals( "%threads" );
    
    }
    
    
    public boolean doMagicCommand( String command ) {
    
        //@        <<command>>
        //@+node:zorcanda!.20051114104215.1:<<command>>
            final Map< Thread, StackTraceElement[] > m = Thread.getAllStackTraces(); 
            
            Set<Thread> s = m.keySet();
            final Vector< Vector> v = new Vector< Vector >();
            final Map<String, Thread> stmap = new HashMap<String, Thread>();
            for( final Thread td: s ){
            
                Vector<String> t = new Vector<String>();
                t.add( td.toString() );
                stmap.put( td.toString(), td );
                t.add( td.getState().toString() );
                v.add( t );
            
            
            }
            
            Vector<String> names = new Vector< String >();
            names.add( "Thread" );
            names.add( "State" );
            final JPanel jp = new JPanel();
            jp.setLayout( new BorderLayout() );
            DefaultTableModel dtm = new DefaultTableModel( v, names );
            final JTable threads = new JTable( dtm );
            threads.setSelectionMode( ListSelectionModel.SINGLE_SELECTION );
            int height = threads.getRowHeight();
            int nwheight = height * 6;
            JScrollPane jsp1 = new JScrollPane( threads );
            jp.add( jsp1, BorderLayout.NORTH );
            Dimension nsize = jsp1.getPreferredSize();
            nsize.height = nwheight;
            jsp1.setPreferredSize( nsize );
            DefaultTableModel fake = new DefaultTableModel();
            fake.addColumn( "Stack" , new Object[]{} );
            final JTable stack = new JTable( fake );
            stack.setSelectionMode( ListSelectionModel.SINGLE_SELECTION );
            JScrollPane jsp2 = new JScrollPane( stack );
            JPanel jp2 = new JPanel( new BorderLayout() );
            jp2.add( jsp2, BorderLayout.CENTER );
            jsp2.setPreferredSize( nsize );
            jp.add( jp2 , BorderLayout.SOUTH );
            
            ListSelectionListener lsl = new ListSelectionListener(){
            
                public final void valueChanged( final ListSelectionEvent lse ){
                
                    int index = lse.getFirstIndex();
                    Vector<String> thread = v.get( index );
                    String thread_name = thread.get( 0 );
                    Thread _thread = stmap.get( thread_name );
                    StackTraceElement[] ste = _thread.getStackTrace();
                    DefaultTableModel dtm = new DefaultTableModel();
                    dtm.addColumn( "Stack", ste );    
                    stack.setModel( dtm );
                
                }
                
            
            };
            threads.getSelectionModel().addListSelectionListener( lsl );
            
            Runnable inserttable = new Runnable(){
            
                public void run(){
                    try{
                        SimpleAttributeSet sas = new SimpleAttributeSet();
                        StyleConstants.setComponent( sas, jp );
                        JTextComponent jtc = js.getShellComponent();
                        Document doc = jtc.getDocument();
                        doc.insertString( jtc.getCaretPosition(), "\n", sas );   
                    }
                    catch( BadLocationException ble ){}
                }
            };
            SwingUtilities.invokeLater( inserttable );
        //@-node:zorcanda!.20051114104215.1:<<command>>
        //@nl
        return true;
    
    }




}
//@nonl
//@-node:zorcanda!.20051114104215:@thin Threads.java
//@-leo
