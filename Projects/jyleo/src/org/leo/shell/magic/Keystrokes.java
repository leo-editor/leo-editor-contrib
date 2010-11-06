//@+leo-ver=4-thin
//@+node:zorcanda!.20051201133733:@thin Keystrokes.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.leo.shell.widget.Pager;
import javax.swing.text.JTextComponent;
import javax.swing.SwingUtilities;



public class Keystrokes implements MagicCommand{

    JythonShell js;
    Pager pager;
    
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%keystrokes"; }
    public String getDescription(){
    
        return "%keystrokes --> displays JythonShell keystrokes and what they do in a pager.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.equals( "%keystrokes" );
    
    }

    public boolean doMagicCommand( String command ){
    
        Runnable run = new Runnable(){
            public void run(){
                //@                <<command>>
                //@+node:zorcanda!.20051201133733.1:<<command>>
                String description = js.getKeystrokeDescriptions();
                if( !js.containsNamedWidget( "Keystrokes" ) ){
                    
                    JTextComponent jtc = js.getShellComponent();
                    pager = new Pager( js, jtc.getForeground(), jtc.getBackground(), jtc.getFont() );
                    js.addWidget( pager.getBaseWidget(), "Keystrokes" );
                
                }
                
                pager.setText( description );
                js.moveWidgetToFront( "Keystrokes" ); 
                pager.requestFocus(); 
                 
                
                //@-node:zorcanda!.20051201133733.1:<<command>>
                //@nl
            }
        };
        SwingUtilities.invokeLater( run );
        return true;
    }



}
//@nonl
//@-node:zorcanda!.20051201133733:@thin Keystrokes.java
//@-leo
