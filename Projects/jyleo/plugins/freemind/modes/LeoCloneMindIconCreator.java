//@+leo-ver=4-thin
//@+node:zorcanda!.20051108103717.140:@thin LeoCloneMindIconCreator.java
//@@language java
package freemind.modes;

import javax.swing.ImageIcon;

public class LeoCloneMindIconCreator{


    public static MindIcon getCloneIcon( String path ){
    
        MindIcon mi = MindIcon.factory( "clone" );
        ImageIcon ii = new ImageIcon( path );
        mi.setIcon( ii );
        return mi;
    
    }


}
//@nonl
//@-node:zorcanda!.20051108103717.140:@thin LeoCloneMindIconCreator.java
//@-leo
