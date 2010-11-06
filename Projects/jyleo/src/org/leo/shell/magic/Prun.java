//@+leo-ver=4-thin
//@+node:zorcanda!.20051114103416:@thin Prun.java
//@@language java
package org.leo.shell.magic;

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.leo.shell.util.InsertPrompt;
import java.util.concurrent.FutureTask;
import java.util.concurrent.ExecutionException;
import javax.swing.SwingUtilities;
import java.lang.reflect.InvocationTargetException;


public class Prun implements MagicCommand{

    JythonShell js;
    
    public String getName(){ return "%prun"; }
    public String getDescription(){
    
        return "%prun -- executes a statement entered on the same line in the profile module:\n %profile statement \n\n"; 
    
    } 

    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }


    public boolean handle( String command ){
    
        return command.startsWith( "%prun " );
    
    
    }
    
    public boolean doMagicCommand( String command ){
    
        //@        <<command>>
        //@+node:zorcanda!.20051114103416.1:<<command>>
            String line = command.substring( 5 ).trim();
            String nwcommand = "import profile;profile.run('"+line +"')";
            js.addLineToExecute( nwcommand );
            class StartProfile implements Runnable{
            
                public void run(){
                    
                    FutureTask<Boolean> more = new FutureTask<Boolean>( js );
                    js.execute1( more );
                    InsertPrompt ip = new InsertPrompt( js, false );
                    try{
                        more.get();
                        SwingUtilities.invokeAndWait( ip );
                    }
                    catch( InterruptedException ie ){}
                    catch( InvocationTargetException ite ){}
                    catch( ExecutionException ee ){}
                }
            }
            js.execute2( new StartProfile() );
            return false;
        //@nonl
        //@-node:zorcanda!.20051114103416.1:<<command>>
        //@nl
    
    
    }



}
//@nonl
//@-node:zorcanda!.20051114103416:@thin Prun.java
//@-leo
