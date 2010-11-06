//@+leo-ver=4-thin
//@+node:zorcanda!.20051115192051:@thin JSOutputStream.java
//@@language java
package org.leo.shell.io;

import org.leo.shell.JythonShell; 
import org.leo.shell.util.StringInserter;
import java.awt.EventQueue;
import javax.swing.*;
import javax.swing.text.*;
import java.io.*;
import java.lang.reflect.InvocationTargetException;

public class JSOutputStream extends OutputStream{

    JTextPane jtp;
    SimpleAttributeSet sas;
    JythonShell js;
    byte[] bout;
    boolean bonce;
    boolean supress;
	public JSOutputStream( JTextPane jtp, SimpleAttributeSet sas, JythonShell js ){
    
        super();
        this.jtp = jtp;
        this.js = js;
        this.sas = sas;
        bout = new byte[ 2 ];
        supress = false;
    }
    
    public void supress(){ supress = true;}
    public void liberate(){ supress = false;}
    public void close(){};
    public void flush(){};
    public void write( byte[] b ){
        
        if( supress ) return;
        byte[] b2 = new byte[ b.length ];
        System.arraycopy( b, 0, b2, 0, b.length );
        String s = new String( b2 );
        if( EventQueue.isDispatchThread() ){
        
            try{
            
                Document doc = jtp.getDocument();
                doc.insertString( jtp.getCaretPosition(), s, sas );
            
            }
            catch( BadLocationException ble ){}
        
        }
        else{
            StringInserter si = new StringInserter( s, jtp, sas, js );
            try{
                SwingUtilities.invokeAndWait( si );
            }
            catch( InvocationTargetException ite ){}
            catch( InterruptedException ie ){}
        }
    
    
    }
    
    public void write( byte[] b, int start, int length ){
        
        if( supress ) return;
        byte[] b2 = new byte[ length ];
        System.arraycopy( b, start, b2, 0, length );
        String s = new String( b2 );
        if( EventQueue.isDispatchThread() ){
        
            try{
            
                Document doc = jtp.getDocument();
                doc.insertString( jtp.getCaretPosition(), s, sas );
            
            }
            catch( BadLocationException ble ){}
        
        }
        else{
            StringInserter si = new StringInserter( s, jtp, sas, js );
            try{
                SwingUtilities.invokeAndWait( si );
            }
            catch( InvocationTargetException ite ){}
            catch( InterruptedException ie ){}
        }
    
    }
    
    public void write( int b ){
        
        if( supress) return;
        if( bonce ){
        
            bout[ 1 ] = (byte)b;
            if( EventQueue.isDispatchThread() ){
        
                try{
            
                    Document doc = jtp.getDocument();
                    doc.insertString( jtp.getCaretPosition(), new String( bout ), sas );
            
                }
                catch( BadLocationException ble ){}
                bout = new byte[ 2 ];
                bonce = false;
        
            }
            else{
                StringInserter si = new StringInserter( new String( bout ), jtp, sas, js );
                try{
                    SwingUtilities.invokeAndWait( si );           
                }
                catch( InvocationTargetException ite ){}
                catch( InterruptedException ie ){}
                bout = new byte[ 2 ];
                bonce = false;
            }     
        
        }
        else{
        
            bout[ 0 ] = (byte)b;
            bonce = true;
        }
    
    }


}
//@nonl
//@-node:zorcanda!.20051115192051:@thin JSOutputStream.java
//@-leo
