//@+leo-ver=4-thin
//@+node:zorcanda!.20051117134127:@thin ZoneViewEditorKit.java
//@@language java;
package org.leo.shell.widget;

import java.awt.Dimension;
import javax.swing.*;
import javax.swing.text.*;


public class ZoneViewEditorKit extends StyledEditorKit{

    ViewFactory vf;
    
    public ViewFactory getViewFactory(){
        
        if( vf == null ) vf = new ZoneViewFactory();
        return vf;

    }


    public static class ZoneViewFactory implements ViewFactory{


        public View create( Element elem ){
    
            String kind = elem.getName();
	        if (kind != null) {
		    if (kind.equals(AbstractDocument.ContentElementName)) {
                    return new LabelView(elem);
		    } else if (kind.equals(AbstractDocument.ParagraphElementName)) {
		        return new ParagraphView(elem);
		    } else if (kind.equals(AbstractDocument.SectionElementName)) {
		        //return new BoxView(elem, View.Y_AXIS);
                ZoneView zv = new ZoneView( elem, View.Y_AXIS );
                return zv;
		    } else if (kind.equals(StyleConstants.ComponentElementName)) {
		        return new ComponentView(elem);
		    } else if (kind.equals(StyleConstants.IconElementName)) {
		        return new IconView(elem);
		}
	    }
	
	    // default to text display
        return new LabelView(elem);    
    
  
    }


}

    public static void main( String[] args ){
    
        Runnable run = new Runnable(){
        
        public void run(){
            JTextPane jtp = new JTextPane();
            jtp.setEditorKit( new ZoneViewEditorKit() );
            JScrollPane jsp = new JScrollPane( jtp );
            JFrame jf = new JFrame();
            jf.add( jsp );
            jf.setSize( new Dimension( 500, 500 ) );
            jf.setVisible( true );
            //jtp.setEditorKit( new ZoneViewEditorKit() );
            }
        };
        SwingUtilities.invokeLater( run );
    
    }

}
//@nonl
//@-node:zorcanda!.20051117134127:@thin ZoneViewEditorKit.java
//@-leo
