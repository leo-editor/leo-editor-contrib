//@+leo-ver=4-thin
//@+node:zorcanda!.20051120201216:@thin ColorEvent.java
//@@language java
package org.leo.shell.color; 

import java.util.EventObject;
import static org.leo.shell.color.ColorConfiguration.ColorConstant;

public class ColorEvent extends EventObject{

    
    ColorConstant constant;
    public ColorEvent( Object source, ColorConstant colorconstant ){
    
        super( source );
        constant = colorconstant;
    
    }

    public ColorConstant getColorConstant(){ return constant;}

}
//@nonl
//@-node:zorcanda!.20051120201216:@thin ColorEvent.java
//@-leo
