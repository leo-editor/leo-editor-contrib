//@+leo-ver=4-thin
//@+node:zorcanda!.20051114092815:@thin MagicCommand.java
//@@language java
package org.leo.shell;


public interface MagicCommand{


    public void setJythonShell( JythonShell shell );
    public boolean handle( String command );
    public boolean doMagicCommand( String command );
    public String getName();
    public String getDescription();



}
//@nonl
//@-node:zorcanda!.20051114092815:@thin MagicCommand.java
//@-leo
