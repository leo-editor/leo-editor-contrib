//@+leo-ver=4-thin
//@+node:zorcanda!.20051204152126:@thin Iuse.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.leo.shell.widget.Pager;
import javax.swing.text.JTextComponent;
import javax.swing.SwingUtilities;

public class Iuse implements MagicCommand{

    JythonShell js;
    Pager pager;
    
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%iuse"; }
    public String getDescription(){
    
        return "%iuse --> displays JythonShell interactive features in a pager.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.equals( "%iuse" );
    
    }

    public boolean doMagicCommand( String command ){
    
        Runnable run = new Runnable(){
            public void run(){
                //@                <<command>>
                //@+node:zorcanda!.20051204152126.1:<<command>>
                String description = js.getInteractiveDescriptions();
                if( !js.containsNamedWidget( "Interactive Use" ) ){
                    
                    JTextComponent jc = js.getShellComponent();
                    pager = new Pager( js, jc.getForeground(), jc.getBackground(), jc.getFont() );
                    js.addWidget( pager.getBaseWidget(), "Interactive Use" );
                
                }
                
                pager.setText( description );
                js.moveWidgetToFront( "Interactive Use" );   
                pager.requestFocus();
                
                //@-node:zorcanda!.20051204152126.1:<<command>>
                //@nl
            }
        };
        SwingUtilities.invokeLater( run );
        return true;
    }



}
//@nonl
//@-node:zorcanda!.20051204152126:@thin Iuse.java
//@-leo
