//@+leo-ver=4-thin
//@+node:zorcanda!.20050906165511:@thin LeoCompoundEdit.java
//@@language java

import javax.swing.undo.*;
import java.util.Vector;

public class LeoCompoundEdit extends CompoundEdit{

    String __name;

    public LeoCompoundEdit( String name ){
    
        __name = name;
    
    
    }
    
    public String getPresentationName(){
    
        return __name;
    
    }

    public String getRedoPresentationName(){
    
        return "Redo " + __name;
    
    }

    public String getUndoPresentationName(){
    
        return "Undo " + __name;
    
    }
    
    public final Vector<UndoableEdit> getEdits(){
    
        return edits;
    
    
    }


}
//@nonl
//@-node:zorcanda!.20050906165511:@thin LeoCompoundEdit.java
//@-leo
