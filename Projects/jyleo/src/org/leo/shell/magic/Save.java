//@+leo-ver=4-thin
//@+node:zorcanda!.20051117170814:@thin Save.java
//@@language java
package org.leo.shell.magic;

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
import org.leo.shell.widget.CutCopyPaste; 
import java.util.*;
import java.io.*;
import javax.swing.text.*;
import javax.swing.*;

public class Save implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%save"; }
    public String getDescription(){
    
        return "%save filename n1:n2 n3:n4 ... n5 .. n6 ... This function uses the same syntax as %macro for line extraction, but instead of creating a macro it saves the resulting string to the filename you specify. It adds a  .py  extension to the file if you don t do so yourself, and it asks for confirmation before overwriting existing files.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().startsWith( "%save " );
    
    }

    public boolean doMagicCommand( String command ){
        
        OutputStream out = js.getStandardOut();
        OutputStream err = js.getStandardErr();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051117170814.1:<<command>>
            List<String> history = js.history;
            String[] chunks = command.split( "\\s+" , 3 );
            if( chunks.length != 3 ){
                String message = "%save requires form: %save macroname n1:n2 n3:n4 ... n5 n6\n";
                err.write( message.getBytes() );
                return false;
            
            }
            
            String fname = chunks[ 1 ];
            java.util.List<String> savelines = js.processHistoryString( chunks[ 2 ] );
            
            if( savelines.size() != 0 ){
            
                JTextComponent jtc = js.getShellComponent();
                Document doc = jtc.getDocument();
            
                try{
                    File cwd = js.getCurrentWorkingDirectory();
                    if( !fname.endsWith( ".py" ) ) fname += ".py";
                    File filespot = new File( cwd, fname );
                    if( filespot.exists() ){
                    
                       String message = String.format( "%1$s exists, do you wish to Overwrite?", filespot.getName() );
                       int result =  JOptionPane.showConfirmDialog( jtc, message, "Overwrite?", JOptionPane.YES_NO_OPTION );
                       if( result == JOptionPane.NO_OPTION ){
                       
                            return true;
                       
                       }
                    
                    }
                    FileOutputStream fos = new FileOutputStream( filespot );
                    for( String s: savelines ){
                        
                        fos.write( s.getBytes() );
                        if( !s.endsWith( "\n" ) ) fos.write( "\n".getBytes() );
                    }
                    fos.close();
                    String message = String.format( "%1$s saved\n", filespot );
                    out.write( message.getBytes() );
                        
            
                }
                catch( IOException io ){ err.write( io.toString().getBytes() ); };
                
            
            }
            //@nonl
            //@-node:zorcanda!.20051117170814.1:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
    
    }


}
//@nonl
//@-node:zorcanda!.20051117170814:@thin Save.java
//@-leo
