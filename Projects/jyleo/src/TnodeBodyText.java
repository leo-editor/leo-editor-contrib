//@+leo-ver=4-thin
//@+node:zorcanda!.20050609085552:@thin TnodeBodyText.java
//@@language java
import java.util.*;

public final class TnodeBodyText{

    final public StringBuilder _body;
    public String _headString;
    //private int accesses = 0;
    public TnodeBodyText( final String body ){
    
        _body = new StringBuilder();
        _body.append( body );
    
    }

    public final void delete( final int start, final int end ){ 
    
        _body.delete( start, end ); 
        final int length = _body.length();
        if( length < _body.capacity()/2 )
            _body.trimToSize();
    
    }
    public final void deleteCharAt( final int index ){ 
    
        _body.deleteCharAt( index ); 
        
    }
    
    public final void insert( final int index, final String x ){
    
        _body.insert( index, x );
        
     
     }
    public final String toString(){ 
        
        //accesses++;
        //System.out.println( accesses );
        //if( accesses > 400 )
        //    Thread.currentThread().dumpStack();
        return _body.toString();
         
    }
    public void setText( final Object o ){
        
        _body.setLength( 0 );
        _body.append( o );
    
    }
    
    public final int length(){
    
        return _body.length();
    
    
    }
    
    
    //@    @+others
    //@+node:zorcanda!.20050613113218:headString methods
    public final String getHeadString(){
    
        //accesses++;
        //System.out.println( "getting hs " + accesses );
        return _headString;
    
    }
    
    public final void setHeadString( final String head ){
    
        _headString = head;
    
    
    }
    //@nonl
    //@-node:zorcanda!.20050613113218:headString methods
    //@-others
    
}
//@nonl
//@-node:zorcanda!.20050609085552:@thin TnodeBodyText.java
//@-leo
