#@+leo-ver=4-thin
#@+node:zorcanda!.20051214203351:@thin WeakMethod.py
#@@language python
import java.lang.ref as ref


class WeakMethod:
    
    def __init__( self, obj, methname ):
        
        self.obj = ref.WeakReference( obj )
        self.methname = methname
        
    def __call__( self, *args ):
        
        obj = self.obj.get()
        if not obj:
            return None
        #print obj
        try:
            meth = getattr( obj, self.methname )
        except Exception, x:
            print "NO METHOD!"
            return None
        return meth( *args )
    
        
#@nonl
#@-node:zorcanda!.20051214203351:@thin WeakMethod.py
#@-leo
