//@+leo-ver=4-thin
//@+node:zorcanda!.20051108121227:@thin LeoNodeAdapter.java
//@@language java

import freemind.modes.*;
import freemind.main.*;
import freemind.modes.mindmapmode.MindMapNodeModel;
import java.util.List;


public class LeoNodeAdapter extends MindMapNodeModel{


    public LeoNodeAdapter( Object uo, FreeMindMain fmf){
    
        super( uo, fmf );
    
    
    }

    public MindMapNode basicCopy(){
    
        return null;
    
    }
    
    
    public void clearChildren(){
    
        children.clear();
    
    }
    
    public List getChildren(){
    
        return children;
    
    }

}
//@nonl
//@-node:zorcanda!.20051108121227:@thin LeoNodeAdapter.java
//@-leo
