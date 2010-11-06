//@+leo-ver=4-thin
//@+node:zorcanda!.20051122091833:@thin LineOutputSupresser.java
//@@language java
package org.leo.shell;


public class LineOutputSupresser implements LineListener, Documentation{

    JythonShell js;
    public LineOutputSupresser( JythonShell js ){
    
        this.js = js;
        js.addInteractiveDocumentation( this );
    
    }
    
    public String getDocumentation(){
    
        return "Line output supression:\n"+
        "Terminating an input line with a ; will supress the output "+
        "for the execution of the line.\n";
    
    
    }

    public String lineToExecute( String line ){
    
        if( line.trim().endsWith( ";" ) ) js.supressOutput();
        return line;
    }


}
//@nonl
//@-node:zorcanda!.20051122091833:@thin LineOutputSupresser.java
//@-leo
