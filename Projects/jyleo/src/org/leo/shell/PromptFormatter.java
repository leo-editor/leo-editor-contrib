//@+leo-ver=4-thin
//@+node:zorcanda!.20051116113941:@thin PromptFormatter.java
//@@language java
package org.leo.shell;

import java.util.*;
import java.awt.Font;
import javax.swing.text.AttributeSet;
import org.leo.shell.color.ColorConfiguration;

public abstract class PromptFormatter{

    public static class ColoredToken{
    
        public String data;
        public AttributeSet atts;
        public ColoredToken( String data, AttributeSet atts ){
        
            this.data = data;
            this.atts = atts;
        
        
        }
        
    
    }
    
    ColorConfiguration cc;
    public PromptFormatter( ColorConfiguration cc ){
    
        this.cc = cc;
    
    }
    public ColorConfiguration getColorConfiguration(){ return cc; }
    public abstract String getPrompt( int linenumber );
    public abstract Iterator<ColoredToken> coloredPrompt( int linenumber );


}
//@nonl
//@-node:zorcanda!.20051116113941:@thin PromptFormatter.java
//@-leo
