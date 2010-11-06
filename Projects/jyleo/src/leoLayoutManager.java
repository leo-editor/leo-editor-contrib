//@+leo-ver=4-thin
//@+node:orkman.20050208103155:@thin leoLayoutManager.java
//@@language java

import java.awt.*;   


public class leoLayoutManager extends FlowLayout{

Component _special; 

public leoLayoutManager( Component special ){
    super();
    _special = special;


}


public void	layoutContainer(Container parent){

    Point p = _special.getLocation();
    super.layoutContainer( parent );
    _special.setLocation( p );



}






}
//@nonl
//@-node:orkman.20050208103155:@thin leoLayoutManager.java
//@-leo
