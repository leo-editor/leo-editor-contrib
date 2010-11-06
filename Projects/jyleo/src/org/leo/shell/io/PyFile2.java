//@+leo-ver=4-thin
//@+node:zorcanda!.20051115192210:@thin PyFile2.java
//@@language java
package org.leo.shell.io;

import org.leo.shell.JythonShell;
import java.io.*;
import org.python.core.*;



public final class PyFile2 extends PyFile{

    final JythonShell js;
    
    public PyFile2( final InputStream is, final String a, final JythonShell js ){
        super( is, a );
        this.js = js;
        
        }
        
        
    public String readline(){
    

          try{

            js.stdinbarrier.await();
            //if( js.stdinbarrier.getNumberWaiting() == 0 )
            //    js.stdinbarrier.reset();
            String s = js.standardin.take();
            js.resettool.countDown();
            return s;
            
          }
          catch( InterruptedException ie ){ ie.printStackTrace();}
          catch(Exception x ){ x.printStackTrace(); }
          
          return null;
    
    
    }





}

//@-node:zorcanda!.20051115192210:@thin PyFile2.java
//@-leo
