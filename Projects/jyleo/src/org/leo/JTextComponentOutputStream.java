//@+leo-ver=4-thin
//@+node:zorcanda!.20051203121856:@thin JTextComponentOutputStream.java
//@@language java
package org.leo;

import java.awt.EventQueue;
import javax.swing.*;
import javax.swing.text.*;
import java.io.*;
import java.lang.reflect.InvocationTargetException;

public class JTextComponentOutputStream extends OutputStream{

    public static class StringInserter implements Runnable{
    
        JTextComponent jtc;
        String s;
        public StringInserter( JTextComponent jtc, String s ){
            
            this.jtc = jtc;
            this.s = s;
        
        }
        
        public void run(){
        
          try{
            
                Document doc = jtc.getDocument();
                doc.insertString( jtc.getCaretPosition(), s, null );
            
          }
          catch( BadLocationException ble ){}        
        
        
        }
    
    
    
    }

    JTextComponent jtp;
    byte[] bout;
    boolean bonce;
	public JTextComponentOutputStream( JTextComponent jtp ){
    
        super();
        this.jtp = jtp;
        bout = new byte[ 2 ];

    }
    

    public void close(){};
    public void flush(){};
    public void write( byte[] b ){
        
        byte[] b2 = new byte[ b.length ];
        System.arraycopy( b, 0, b2, 0, b.length );
        String s = new String( b2 );
        if( EventQueue.isDispatchThread() ){
        
            try{
            
                Document doc = jtp.getDocument();
                doc.insertString( jtp.getCaretPosition(), s, null );
            
            }
            catch( BadLocationException ble ){}
        
        }
        else{
            StringInserter si = new StringInserter( jtp, s );
            try{
                SwingUtilities.invokeAndWait( si );
            }
            catch( InvocationTargetException ite ){}
            catch( InterruptedException ie ){}
        }
    
    
    }
    
    public void write( byte[] b, int start, int length ){
        
        byte[] b2 = new byte[ length ];
        System.arraycopy( b, start, b2, 0, length );
        String s = new String( b2 );
        if( EventQueue.isDispatchThread() ){
        
            try{
            
                Document doc = jtp.getDocument();
                doc.insertString( jtp.getCaretPosition(), s, null );
            
            }
            catch( BadLocationException ble ){}
        
        }
        else{
            StringInserter si = new StringInserter( jtp, s );
            try{
                SwingUtilities.invokeAndWait( si );
            }
            catch( InvocationTargetException ite ){}
            catch( InterruptedException ie ){}
        }
    
    }
    
    public void write( int b ){
        
        if( bonce ){
        
            bout[ 1 ] = (byte)b;
            if( EventQueue.isDispatchThread() ){
        
                try{
            
                    Document doc = jtp.getDocument();
                    doc.insertString( jtp.getCaretPosition(), new String( bout ), null);
            
                }
                catch( BadLocationException ble ){}
                bout = new byte[ 2 ];
                bonce = false;
        
            }
            else{
                StringInserter si = new StringInserter( jtp, new String( bout ) );
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
//@-node:zorcanda!.20051203121856:@thin JTextComponentOutputStream.java
//@-leo
