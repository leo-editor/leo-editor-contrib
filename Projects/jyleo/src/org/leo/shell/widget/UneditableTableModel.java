//@+leo-ver=4-thin
//@+node:zorcanda!.20051115195557:@thin UneditableTableModel.java
//@@language java
package org.leo.shell.widget;

import javax.swing.table.DefaultTableModel;

/* a relatively silly thing to have a class for*/
public class UneditableTableModel extends DefaultTableModel{


    public UneditableTableModel(){
        super();
    
    
    }
    
    public final boolean isCellEditable( final int row, final int column ){
    
        return false;
    
    
    }



}
//@nonl
//@-node:zorcanda!.20051115195557:@thin UneditableTableModel.java
//@-leo
