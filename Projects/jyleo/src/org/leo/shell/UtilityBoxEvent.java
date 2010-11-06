//@+leo-ver=4-thin
//@+node:zorcanda!.20051128185119.1:@thin UtilityBoxEvent.java
//@@language java
package org.leo.shell;

import java.util.EventObject;

public class UtilityBoxEvent extends EventObject{

    public static enum UBEventType{
    
        Shown, Close
    
    
    }
    
    UBEventType ubet;
    public UtilityBoxEvent( Object source, UBEventType ubet ){
    
        super( source );
        this.ubet = ubet;
    
    }

    public UBEventType getEventType(){ return ubet; }


}
//@nonl
//@-node:zorcanda!.20051128185119.1:@thin UtilityBoxEvent.java
//@-leo
