//@+leo-ver=4-thin
//@+node:zorcanda!.20051117145613:@thin R.java
//@@language java
package org.leo.shell.magic;

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.leo.shell.LineListener;
import javax.swing.SwingUtilities;
import org.python.core.PyInteger;
import org.python.core.PyString;

public class R implements MagicCommand, LineListener{
    
    String replacement;
    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
        js.addHistoryLineListener( this );
    
    }
    
    public String lineToExecute( String line ){
    
        if( replacement != null ){
            line = replacement;
            replacement = null;
        }
        return line;
        
    }
    
    public String getName(){ return "%r"; }
    public String getDescription(){
    
        return "%r --> repeat last input.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().equals( "%r" );
    
    }

    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051117145613.1:<<command>>
        if( js.history.size() != 0 ){
            Object o = js.history.__getitem__( -1 );
            final String s = o.toString();
            if( s.startsWith( "%" ) )js.magicCommand( s );
            else js._pi.push( s );
            replacement = s;
            
        }
        //@-node:zorcanda!.20051117145613.1:<<command>>
        //@nl
        return false;
    
    }


}
//@nonl
//@-node:zorcanda!.20051117145613:@thin R.java
//@-leo
