//@+leo-ver=4-thin
//@+node:zorcanda!.20051114111331:@thin Deserialize.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.python.core.*;
import org.python.util.*;
import java.io.*;
import javax.swing.text.*;
import javax.swing.*;


public class Deserialize implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%deserialize"; }
    public String getDescription(){
    
        return "%deserialize reference -- this will allow the user to deserialize an Object stored on disk into\n"+
    "the reference.\n\n"; 
    
    } 

    public boolean handle( String command ){
    
        return command.startsWith( "%deserialize" );
    
    }

    public boolean doMagicCommand( String command ){
        
        OutputStream out = js.getStandardOut();
        OutputStream err = js.getStandardErr();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051114111331.1:<<command>>
            
                
                try{
                
                    final String[] tokens = command.split( "\\s" );
                    if( tokens.length < 2 ){
                        
                        err.write( "%deserialize requires a reference".getBytes() );
                        return true;
                    }
                    
                    final String reference = tokens[ 1 ];
                    final JFileChooser jfc = new JFileChooser( js.getCurrentWorkingDirectory() );
                    final int approve = jfc.showOpenDialog( js.getShellComponent() );
                    if( approve == jfc.APPROVE_OPTION ){
                    
                        final File f = jfc.getSelectedFile();
                        final FileInputStream fis = new FileInputStream( f );
                        final ObjectInputStream ois = new PythonObjectInputStream( fis );
                        final Object o = ois.readObject();
                        js._pi.set( reference , o );
                        out.write( String.format( "%s has been set to %s\n", reference, o ).getBytes() );
                    
                    }
                
                
                
                }
                catch( final ClassNotFoundException cnfe ){
                    
                    cnfe.printStackTrace();
                    err.write( (cnfe + "\n" ).getBytes() );
                    //visualException( cnfe.toString() );
                
                }
            //@-node:zorcanda!.20051114111331.1:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    
    }



}
//@nonl
//@-node:zorcanda!.20051114111331:@thin Deserialize.java
//@-leo
