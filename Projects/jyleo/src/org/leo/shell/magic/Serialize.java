//@+leo-ver=4-thin
//@+node:zorcanda!.20051114105618:@thin Serialize.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.python.core.*;
import java.io.*;
import javax.swing.text.*;
import javax.swing.*;


public class Serialize implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%serialize"; }
    public String getDescription(){
    
        return "%serialize reference -- this will save the Object referenced by reference as a serialized Object.\n\n"; 
    
    } 

    public boolean handle( String command ){
    
        return command.startsWith( "%serialize" );
    
    }

    public boolean doMagicCommand( String command ){
    
        OutputStream out = js.getStandardOut();
        OutputStream err = js.getStandardErr();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051114105618.1:<<command>>
            
                String process_message = null;
                try{
                
                    final String[] tokens = command.split( "\\s" );
                    if( tokens.length < 2 ){
                    
                        err.write( "Need a reference for %serialize\n".getBytes() );
                        return true;
                    
                    
                    }
                    final String reference = tokens[ 1 ];
                    final PyObject po = js.getPyObject( reference.split( "\\." ) );
                    if( po == null ){
                    
                        err.write( "Not a valid reference\n".getBytes() );
                        return true;
                    
                    }
                    final Object o;
                    boolean pure_java = false;
                    if( po instanceof PyJavaInstance ){
                    
                        o = Py.tojava( po, Class.forName( js.getObjectName( po ) ) ); //po.__class__.__name__ ) );
                        pure_java = true;
                        
                    }
                    else
                        o = po;
                        final ByteArrayOutputStream baos = new ByteArrayOutputStream();
                        final ObjectOutputStream oos = new ObjectOutputStream( baos );
                        oos.writeObject( o );
                        final byte[] ser_object = baos.toByteArray();
                        oos.close();
                        
                        final JFileChooser jfc = new JFileChooser( js.getCurrentWorkingDirectory() );
                        final int approve = jfc.showSaveDialog( js.getShellComponent() );
                        if( approve == jfc.APPROVE_OPTION ){
                        
                            File f = jfc.getSelectedFile();
                            final String name = f.getName();
                            if( !name.endsWith( ".ser" ) ){
                            
                                f = new File( f.getParentFile(), name + ".ser" );
                            
                            }
                            final FileOutputStream fos = new FileOutputStream( f );
                            final BufferedOutputStream bos = new BufferedOutputStream( fos );
                            bos.write( ser_object );
                            bos.close();
            
                        final String type = pure_java? "Java":"Python"; 
                        out.write( String.format( "Serialized %s as %s Object\n" , reference, type ).getBytes() );  
                    
                    }
                
                
                
                }
                catch( final IOException io ){
                
                    process_message = "Problem writing Object out";
                
                }
                catch( final ClassNotFoundException cnfe ){
                
                    process_message = "Could not find Class to do serialization";
                
                }
            
                if( process_message != null ){
                
                    err.write( process_message.getBytes() );
                    
                
                }
            //@nonl
            //@-node:zorcanda!.20051114105618.1:<<command>>
            //@nl
        }
        catch( IOException io ){}
        
        return true;
    
    }



}
//@nonl
//@-node:zorcanda!.20051114105618:@thin Serialize.java
//@-leo
