//@+leo-ver=4-thin
//@+node:zorcanda!.20051007210141:@thin PositionJTree2.java
//@@language java
import java.util.*;
import javax.swing.*;
import javax.swing.tree.*;

public abstract class PositionJTree2 extends JTree{


    public PositionJTree2( TreeModel tm ){
    
        super( tm );
    
    
    }
    
    public TreePath getPathToRoot( Object o ){ return null; }
    public abstract PositionSpecification getRootPosition();
    
    public Enumeration<TreePath> getExpandedDescendants( final TreePath path ){
        
        System.out.println( "BOOODAA!" );
        getRootPosition();
        return null;
    
    }    



    
    }





//@-node:zorcanda!.20051007210141:@thin PositionJTree2.java
//@-leo
