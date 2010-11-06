//@+leo-ver=4-thin
//@+node:zorcanda!.20051204164445:@thin UnifiedHelp.java
//@@language java
package org.leo.shell;

import org.leo.shell.widget.Pager;
import javax.swing.SwingUtilities;
import javax.swing.text.JTextComponent;

public class UnifiedHelp implements LineListener, Documentation{

    JythonShell js;
    Pager pager;
    public UnifiedHelp( JythonShell js ){
    
        this.js = js;
        js.addLineListener( this );
        js.addInteractiveDocumentation( this );
    
    }
    
    public String getDocumentation(){
    
        return "? --> Shows the documentation available about keystrokes, magic commands and interactive features.\n";
    
    }

    public String lineToExecute( String line ){
        
        if( line.trim().equals( "?" ) ){
        
            Runnable run = new Runnable(){
                public void run(){
                    String description = js.getUnifiedHelp();
                    if( !js.containsNamedWidget( "Help" ) ){
    
                        JTextComponent jtc = js.getShellComponent();
                        pager = new Pager( js, jtc.getForeground(), jtc.getBackground(), jtc.getFont() );
                        js.addWidget( pager.getBaseWidget(), "Help" );

                    }

                    pager.setText( description );
                    js.moveWidgetToFront( "Help" ); 
                    pager.requestFocus();             
                    
                }
            };
            SwingUtilities.invokeLater( run );
            return null;
        }    
    
        return line;
    }

}
//@nonl
//@-node:zorcanda!.20051204164445:@thin UnifiedHelp.java
//@-leo
