#@+leo-ver=4-thin
#@+node:zorcanda!.20050914142813:@thin JavaIntegration.py
"""JavaIntegration adds scripting support for the BeanShell, which is a Java
language interpreter.  Google for BeanShell Java and download.  Install jar in
jars directory"""

import leoGlobals as g
import java

class JavaHandler:
    
    def __init__( self, c ):
        import bsh
        self.Java = bsh.Interpreter()
        self.c = c
        
    def __call__( self, p, script ):
        
        import java
        print script
        start = java.lang.System.currentTimeMillis()
        try:
            self.Java.eval( script )
        except java.lang.Exception, x:
            x.printStackTrace()

            
        end = java.lang.System.currentTimeMillis()
        


def addHandler( tag, kwords ):
    
    lse = kwords[ 'lse' ]
    c = kwords[ 'c' ]
    jrhandler = JavaHandler( c )
    lse.addHandler( "java", jrhandler )


def init():	
    import leoPlugins
    leoPlugins.registerHandler( "script_executor_created", addHandler )
    g.plugin_signon( __name__)
#@nonl
#@-node:zorcanda!.20050914142813:@thin JavaIntegration.py
#@-leo
