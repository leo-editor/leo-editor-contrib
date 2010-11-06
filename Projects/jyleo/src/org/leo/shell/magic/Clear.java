//@+leo-ver=4-thin
//@+node:zorcanda!.20051114133204:@thin Clear.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import javax.swing.text.JTextComponent;
import javax.swing.SwingUtilities;

public class Clear implements MagicCommand{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%clear"; }
    public String getDescription(){
    
        return "%clear -- this clears the shell of all text and starts over with a fresh prompt\n\n"; 
    
    } 

    public boolean handle( String command ){
    
        return command.startsWith( "%clear" );
    
    }

    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051114133204.1:<<command>>
        Runnable run = new Runnable(){
        
            public void run(){
                JTextComponent jtc = js.getShellComponent();
                jtc.setText( "" );
                js.setVisible( true );
            }
        };
        SwingUtilities.invokeLater( run );
        //@nonl
        //@-node:zorcanda!.20051114133204.1:<<command>>
        //@nl
        return true;
    
    }



}
//@nonl
//@-node:zorcanda!.20051114133204:@thin Clear.java
//@-leo
