//@+leo-ver=4-thin
//@+node:zorcanda!.20051114115227:@thin Ps.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import javax.swing.text.*;
import java.io.*;
import java.awt.*;
import javax.swing.*;
import javax.swing.table.*;
import java.util.*;

public class Ps implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%ps"; }
    public String getDescription(){
    
        return "%ps - this will print out all JPID's the JythonShell has collected.\n" +
    "Placing a reference name after %ps will put a java Set of Processes in the reference:\n"+
    "%ps a   #a now holds a Set of Processes\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.startsWith( "%ps" );  
    
    }

    public boolean doMagicCommand( String cmd ){
        
        OutputStream out = js.getStandardOut();
        OutputStream err = js.getStandardErr();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051114115447:<<command>>
            final DefaultTableModel dtm = new DefaultTableModel();
            final Vector< String > jpid = new Vector< String >();
            final Vector< String > command = new Vector< String >();
            final Vector< String > status = new Vector< String >();
            if( Jpidcore.processes.size() == 0 ){
                    
                err.write( "No JPIDs To View\n".getBytes() );
                return true;
                    
            }
            final String[] tokens = cmd.split( "\\s+" );
            if( tokens.length >= 2 ){
                    
                final String reference = tokens[ 1 ];
                js._pi.set( reference, Jpidcore.processes.values() );
                return true;
                        
            }
            for( final Integer i: Jpidcore.processes.keySet() ){
                    
                final Process p = Jpidcore.processes.get( i );
                final ProcessBuilder pb = Jpidcore.pbuilders.get( p );
                jpid.add( i.toString() );
                final java.util.List< String > l = pb.command();
                final StringBuilder sb = new StringBuilder();
                for( final String s: l )
                    sb.append( s ).append( " " );
                command.add( sb.toString() );
                try{
                    final Integer ev = p.exitValue();
                    status.add( "Exited with: " + ev );
                        
                }
                catch( final IllegalThreadStateException itse ){
                            
                    status.add( "Active" );
                        
                }
                    
                    
            }
            
            dtm.addColumn( "JPID", jpid );
            dtm.addColumn( "Command", command );
            dtm.addColumn( "Status", status );
            final JTable table = new JTable( dtm );
            final int height = table.getRowHeight();
            final Dimension d = table.getPreferredSize();
            d.height = height * 5;
            final JScrollPane jsp = new JScrollPane( table );
            jsp.setPreferredSize( d );
            final SimpleAttributeSet sas = new SimpleAttributeSet();
            StyleConstants.setComponent( sas, jsp );
            Runnable run = new Runnable(){
            
                public void run(){
                
                    try{
                        JTextComponent jtc = js.getShellComponent();
                        final Document doc = jtc.getDocument();
                        final int pos = jtc.getCaretPosition();
                        doc.insertString( pos, "\n", sas );
                    
                    }
                    catch( final BadLocationException ble ){
                        ble.printStackTrace();
                    }
                }
            };
            SwingUtilities.invokeLater( run );
            //@-node:zorcanda!.20051114115447:<<command>>
            //@nl
        }
        catch(IOException io ){}
        return true;
    
    }



}
//@nonl
//@-node:zorcanda!.20051114115227:@thin Ps.java
//@-leo
