//@+leo-ver=4-thin
//@+node:zorcanda!.20051031194657:@thin PositionCarrier.java
//@@language java
import javax.swing.text.*;


public class PositionCarrier{
    public Position pos;
    public String c;
    public PositionCarrier( Position pos, String c ){
    
        this.pos = pos;
        this.c = c;
    
    
    }
    
    public String toString(){
    
        return pos + ", " + c;
    
    }
    
    public boolean equals( Object o ){
    
        if( o == null || !(o instanceof PositionCarrier) ) return false;
        PositionCarrier pc = (PositionCarrier)o;
        return pos.getOffset() == pc.pos.getOffset() && c.equals( pc.c );
    
    }
    
    public boolean isValid( Document doc ){
    
        try{
            String text = doc.getText( pos.getOffset(), 1 );
            return text.equals( c );      
        }
        catch( BadLocationException ble ){}
        return false;
    
    }




}
//@nonl
//@-node:zorcanda!.20051031194657:@thin PositionCarrier.java
//@-leo
