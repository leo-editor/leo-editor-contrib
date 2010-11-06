//@+leo-ver=4-thin
//@+node:zorcanda!.20050515163457:@thin IteratorDecorator.java
//@@language java

import java.util.Iterator;


public final class IteratorDecorator implements Iterator{

    final PositionIterator _it;
    Object _nx;
    
    public IteratorDecorator( final PositionIterator pi ){
    
    
        _it = pi;
        try{
        
            _nx = pi.next();
        
        }
        catch( final Exception x ){
        
            _nx = null;
        
        }
    
    }

    public final boolean hasNext(){
    
        if( _nx == null ) return false;
        return true;
    
    }

    public final Object next(){
    
        final Object nx = _nx;
        try{
        
            _nx = _it.next();
        
        }
        catch( final Exception x ){
        
            _nx = null;
        
        }
        return nx;
    
    
    }

    public final void remove(){
    
        throw new UnsupportedOperationException();
    
    }

}



//@+at
// class iteratorDecorator( java.util.Iterator ): #this at one time when 
// defined inside a method created a pathological memory leak.
//         def __init__( self, it ):
//             self._it = it
//             try:
//                 self._nx = it.next()
//             except:
//                 self._nx = None
//         def hasNext( self ):
//             if self._nx is None: return False
//             else: return True
//         def next( self ):
//             nx = self._nx
//             try:
//                 self._nx = self._it.next()
//             except:
//                 self._nx = None
//             return nx
//@-at
//@nonl
//@-node:zorcanda!.20050515163457:@thin IteratorDecorator.java
//@-leo
