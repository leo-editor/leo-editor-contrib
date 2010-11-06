#@+leo-ver=4-thin
#@+node:zorcanda!.20050907152331:@thin DefCallable.py
#@@language python

import java.util.concurrent as concurrent


class DefCallable( concurrent.Callable ):
    
    def __init__( self, method ):
        self.method = method
        
    def call( self ):
        return self.method()
        
    
    def wrappedAsFutureTask( self ):
        return concurrent.FutureTask( self )



    
    

#@-node:zorcanda!.20050907152331:@thin DefCallable.py
#@-leo
