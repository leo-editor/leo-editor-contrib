//@+leo-ver=4-thin
//@+node:zorcanda!.20051114104943:@thin XSLT.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import org.python.core.*;
import java.io.*;

public class XSLT implements MagicCommand{

    JythonShell js;
    
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }

    public String getName(){ return "%xslt"; }
    public String getDescription(){
    
        return "%xslt reference1 reference2 reference3 -- this allows the user to transform reference2 with the\n"+
    "stylesheet in reference1 putting the result in reference3.\n\n"; 
    
    } 
    
    public boolean handle( String command ){
    
        return command.startsWith( "%xslt" );
    
    }
    
    
    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051114104943.1:<<command>>
            String[] tokens = command.split( "\\s" );
            
            if( tokens.length < 4 ) return true;
            
            PyObject source = js.getPyObject( tokens[ 1 ].split( "\\." ) );
            PyObject xml = js.getPyObject( tokens[ 2 ].split( "\\." ) );
            if( source == null || xml == null ) return true;
            
            StringReader sr = new StringReader( source.toString() ); 
            StreamSource ss = new StreamSource( sr );
            StringReader sr2 = new StringReader( xml.toString() );
            StreamSource ss2 = new StreamSource( sr2 );
        
            try{
            
                TransformerFactory tf = TransformerFactory.newInstance();
            
                Transformer t = tf.newTransformer( ss );
            
                StringWriter sw = new StringWriter();
                StreamResult sresult = new StreamResult( sw );
            
                t.transform( ss2, sresult );
            
                String data = sw.toString();
                js._pi.set( tokens[ 3 ] , data );
            
            }
            catch( TransformerConfigurationException tce ){
            
                tce.printStackTrace();
            
            }
            catch( TransformerException te ){
            
            
                te.printStackTrace();
            
            }
        //@nonl
        //@-node:zorcanda!.20051114104943.1:<<command>>
        //@nl
        return true;
    
    }



}
//@-node:zorcanda!.20051114104943:@thin XSLT.java
//@-leo
