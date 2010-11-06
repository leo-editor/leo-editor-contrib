//@+leo-ver=4-thin
//@+node:zorcanda!.20051108121227.1:@thin LeoEdgeAdapter.java
//@@language java
import java.awt.Stroke;
import freemind.modes.*;
import freemind.main.*;
import freemind.modes.mindmapmode.*;


public class LeoEdgeAdapter extends MindMapEdgeModel{ 


    public LeoEdgeAdapter( MindMapNode mmn, FreeMindMain main ){
    
        super( mmn, main );
    
    }

    public void setStroke( Stroke s ){
    
        stroke = s;
    
    
    }



}
//@nonl
//@-node:zorcanda!.20051108121227.1:@thin LeoEdgeAdapter.java
//@-leo
