//@+leo-ver=4-thin
//@+node:zorcanda!.20051103202851:@thin leoTableViewEditorKit.java
//@@language java
import javax.swing.*;
import javax.swing.text.*;
import java.lang.ref.*;
import java.util.*;
import java.awt.*;
import java.awt.event.*;
import java.awt.geom.*;

public class leoTableViewEditorKit extends StyledEditorKit{

    
    public leoTableViewEditorKit(){
    
        super();
        vf = new StyledViewFactory2();
    
    }
    
    
    
    static StyledViewFactory2 vf;// = new StyledViewFactory2();

    public ViewFactory getViewFactory(){
    
        return vf;
    
    }
    
    static class StyledViewFactory2 implements ViewFactory {

        TestTableView ttv;
        public StyledViewFactory2(){
        
            super();

        }
        
      
        
        //@        <<create>>
        //@+node:zorcanda!.20051103202851.1:<<create>>
        public View create(Element elem) {
        
            String kind = elem.getName();
        	if (kind != null) {
        	
                if (kind.equals(AbstractDocument.ContentElementName)) {
                    return new LabelView( elem );
        		} else if (kind.equals(AbstractDocument.ParagraphElementName)) {
                        //ParagraphView rv = new ParagraphView( elem );
                        return ttv.createTableRow( elem );
                        //return rv;
        		} else if (kind.equals(AbstractDocument.SectionElementName)) {
                    return ( ttv = new TestTableView( elem ) );
        		} else if (kind.equals(StyleConstants.ComponentElementName)) {
        		    return new ComponentView(elem);
        		} else if (kind.equals(StyleConstants.IconElementName)) {
        		    return new IconView(elem);
        		}
        	    }
        	
        	    // default to text display
                return new LabelView(elem );
        
        	}
        //@-node:zorcanda!.20051103202851.1:<<create>>
        //@nl
    
    }
    
    //@    @+others
    //@+node:zorcanda!.20051103202851.2:class TestTableView
    public static class TestTableView extends TableView{
    
        public TestTableView( Element e ){
        
            super( e );
        
        }
        
    //@verbatim
        //@Override
        //public void layout( int width , int height ){
        
        //    Rectangle vrec = ((JComponent)getContainer()).getVisibleRect(); 
            //System.out.println( vrec );
            //System.out.println( width + " " + height );
        //    super.layout( vrec.width, height );
        
       // }
        
        //@    <<table row>>
        //@+node:zorcanda!.20051103220533:<<table row>>
        public class TableRow2 extends TableView.TableRow{
        
        
            public TableRow2( Element e ){
                super( e );
            
            
            
            }
        
            public void layoutMajorAxis( int targetspan, int axis, int[] offsets, int[] spans ){
                
                System.out.println( "MAJOR AXIS!!! "  + offsets.length + " " + spans.length  + " " + getViewCount());
                
                //offsets[ 0 ] = 0;
                //spans[ 0 ] = targetspan;
                super.layoutMajorAxis( targetspan, axis, offsets, spans );
            
            }
        
            public void layoutMinorAxis( int targetspan, int axis, int[] offsets, int[] spans ){
                
                System.out.println( "MinOR AXIS!!! "  + offsets.length + " " + spans.length + " " + getViewCount() );
                //offsets[ 0 ] = 0;
                //spans[ 0 ] = targetspan;
                super.layoutMinorAxis( targetspan, axis, offsets, spans );
            
            }
        
        
        
        }
        //@nonl
        //@-node:zorcanda!.20051103220533:<<table row>>
        //@nl
    
        public TableView.TableRow createTableRow( Element e ){
            
            System.out.println( "TABLE ROW!" );
            return new TableRow2( e );
            //return super.createTableRow( e );
        
        }
        
        public void layoutColumns( int targetSpan,
                                 int[] offsets,
                                 int[] spans,
                                 SizeRequirements[] reqs){
            
            System.out.println( "TARGETSPAN:" + targetSpan );
            System.out.println( "SPANSDIVIDE:" + targetSpan/spans.length );                     
            super.layoutColumns( targetSpan, offsets, spans, reqs );
                                 
                                 
        }
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051103202851.2:class TestTableView
    //@-others
    
    public static void main( String[] args ){
    
        JTextPane jtp = new JTextPane();
        JScrollPane jsp = new JScrollPane( jtp );
        leoTableViewEditorKit ltvek = new leoTableViewEditorKit();
        jtp.setEditorKit( ltvek );
        Document doc = jtp.getDocument();
        try{
            doc.insertString( 0, "Mooo OOOOrrrr GOOOO\n", null );
            doc.insertString( 0, "Mooo OOOOxx GOOOO\n", null );
            doc.insertString( 0, "Mooo OOOObbb GOOOO\n", null );
            
        }
        catch( BadLocationException ble ){}
        JFrame jf = new JFrame();
        jf.add( jsp );
        jf.pack();
        jf.setVisible( true );
    
    
    
    
    
    }
    
}
//@nonl
//@-node:zorcanda!.20051103202851:@thin leoTableViewEditorKit.java
//@-leo
