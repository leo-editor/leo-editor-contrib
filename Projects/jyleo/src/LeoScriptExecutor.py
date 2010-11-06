#@+leo-ver=4-thin
#@+node:zorcanda!.20050911194625:@thin LeoScriptExecutor.py
#@@language python
import leoGlobals as g


class LeoScriptExecutor:
    
    def __init__( self , c):
        self.handlers = {}
        g.doHook( "script_executor_created", lse = self, c = c )
    
    def executeScript( self, language, p, script ):
        
        if self.handlers.has_key( language ):
            self.handlers[ language ]( p,script )
            return 1
        else:
            return 0
            
    def addHandler( self, language, handler ):
        self.handlers[ language ] = handler
    
#@-node:zorcanda!.20050911194625:@thin LeoScriptExecutor.py
#@-leo
