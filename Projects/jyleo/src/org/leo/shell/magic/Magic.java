//@+leo-ver=4-thin
//@+node:zorcanda!.20051114182223:@thin Magic.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.leo.shell.widget.Pager;
import javax.swing.text.JTextComponent;
import javax.swing.SwingUtilities;
import java.io.IOException;
import java.io.OutputStream;


public class Magic implements MagicCommand{

    JythonShell js;
    Pager pager;
    
    
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%magic"; }
    public String getDescription(){
    
        return "%magic --> invoke like so:\n"+
        "%magic --> this prints out the description of the magic commands\n" +
        "%magic %magiccommandname\n" +
        "And the usuage/description of the specific magic command will be printed out\n\n";
    
    } 

    public boolean handle( String command ){
    
        return (command.startsWith( "%magic " ) || command.trim().equals( "%magic" ) );
    
    }

    public boolean doMagicCommand( String command ){
        
        OutputStream out = js.getStandardOut();
        OutputStream err = js.getStandardErr();
        try{
            //@            <<command>>
            //@+node:zorcanda!.20051114182236:<<command>>
            String[] chunks = command.split( "\\s+" );
            if( chunks.length == 1 ){
            
                String description = js.getMagicDescriptions();
                if( !js.containsNamedWidget( "Magic" ) ){
                
                    JTextComponent jc = js.getShellComponent();
                    pager = new Pager( js, jc.getForeground(), jc.getBackground(), jc.getFont() );
                    js.addWidget( pager.getBaseWidget(), "Magic" );
                    
                }
                pager.setText( description );
                js.moveWidgetToFront( "Magic" );
                pager.requestFocus();    
                return true;
            }
            else if( chunks.length == 2 ){
            
                String name = chunks[ 1 ];
                MagicCommand target = null;
                for( MagicCommand mc: js.mcommands ){
                
                    if( mc.getName().equals( name ) ){
                        target = mc;
                        break;        
                    }
                
                }
                if( target != null ){
                    
                    String description = target.getDescription();
                    out.write( description.getBytes() );   
                }
                else err.write( "Magic command not found\n".getBytes() );
            
            
            }
            else err.write( "Bad format for %magic\n".getBytes() );
            //@-node:zorcanda!.20051114182236:<<command>>
            //@nl
        }
        catch( IOException io ){}
        return true;
        
    }



}
//@nonl
//@-node:zorcanda!.20051114182223:@thin Magic.java
//@-leo
