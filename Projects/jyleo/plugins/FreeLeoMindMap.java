//@+leo-ver=4-thin
//@+node:zorcanda!.20051108103717:@thin FreeLeoMindMap.java
//@@language java


import freemind.modes.mindmapmode.*;
import freemind.modes.actions.*;
import freemind.modes.*;
import freemind.main.*;
import javax.swing.tree.*;


public class FreeLeoMindMap extends MindMapMapModel{


    public FreeLeoMindMap( MindMapNodeModel mmnm, FreeMindMain main ){
    
        super( mmnm, main );
    
    
    }
    
    public void alterPasteAction( ControllerAdapter ca, PasteAction pa ){
    
        ca.paste = pa;
    
    }
    
    public Object getEditAction( ControllerAdapter ca ){
    
        return ca.edit;
    
    }

    public void reload( TreeNode node ){
    
        super.reload( node );
    
    }




}
//@nonl
//@-node:zorcanda!.20051108103717:@thin FreeLeoMindMap.java
//@-leo
