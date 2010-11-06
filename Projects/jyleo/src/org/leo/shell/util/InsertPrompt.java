//@+leo-ver=4-thin
//@+node:zorcanda!.20051115193957:@thin InsertPrompt.java
//@@language java
package org.leo.shell.util;

import org.leo.shell.JythonShell;

public class InsertPrompt implements Runnable{

    JythonShell js;
    boolean more;
    public InsertPrompt( JythonShell js, boolean more ){
    
        this.js = js;
        this.more = more;
    
    }

    public void run(){ js.insertPrompt( more ); }



}
//@nonl
//@-node:zorcanda!.20051115193957:@thin InsertPrompt.java
//@-leo
