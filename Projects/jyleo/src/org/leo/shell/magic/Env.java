//@+leo-ver=4-thin
//@+node:zorcanda!.20051117152006:@thin Env.java
//@@language java
package org.leo.shell.magic;

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
import org.leo.shell.widget.CutCopyPaste; 
import java.util.*;
import java.awt.*;
import javax.swing.event.*;
import javax.swing.*;
import javax.swing.text.*;
import javax.swing.tree.TreePath;

public class Env implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%env"; }
    public String getDescription(){
    
        return "%env --> List environment variables.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().equals( "%env" );
    
    }

    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051117152006.1:<<command>>
        final Map<String,String> env = System.getenv();
        Vector<String> keys = new Vector<String>( env.keySet() );
        
        JTree jtree = new JTree( keys );
        JScrollPane jsp = new JScrollPane( jtree );
        final JTextPane jtp = new JTextPane();
        new CutCopyPaste( jtp );
        JScrollPane jsp2 = new JScrollPane( jtp );
        JPanel container = new JPanel( new GridLayout( 1,2 ) );
        container.add( jsp ); container.add( jsp2 );
        TreeSelectionListener tsl = new TreeSelectionListener(){
        
            public void valueChanged(TreeSelectionEvent e){
            
                TreePath tp = e.getPath();
                Object o = tp.getLastPathComponent();
                String value = env.get( o.toString() );
                jtp.setText( value );
            
            }
        
        };
        jtree.addTreeSelectionListener( tsl );
        final SimpleAttributeSet sas = new SimpleAttributeSet();
        StyleConstants.setComponent( sas, container );
        final JTextComponent jtc = js.getShellComponent();
        Graphics g = jtc.getGraphics();
        FontMetrics fm = g.getFontMetrics();
        int height = fm.getHeight();
        g.dispose();
        Dimension psize = container.getPreferredSize();
        psize.height = height * 10;
        container.setPreferredSize( psize );
        final Document doc = jtc.getDocument();
        Runnable run = new Runnable(){
        
            public void run(){
                try{
        
                    doc.insertString( jtc.getCaretPosition(), "\n", sas );
        
                }
                catch( BadLocationException ble ){}
            }
        };
        SwingUtilities.invokeLater( run );
        
        
        
        
        //@-node:zorcanda!.20051117152006.1:<<command>>
        //@nl
        return true;
    
    }


}
//@nonl
//@-node:zorcanda!.20051117152006:@thin Env.java
//@-leo
