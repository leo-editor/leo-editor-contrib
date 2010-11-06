#@+leo-ver=4-thin
#@+node:zorcanda!.20050911195922:@thin JRubyIntegration.py
"""JavaIntegration adds scripting support for the JRuby, which is a Java based Ruby
language interpreter.  Google for JRuby and download.  Install jar in
jars directory"""
import leoGlobals as g
import java

class JRubyHandler:
    
    def __init__( self, c ):
        import org.jruby as jruby
        self.Ruby = jruby.Ruby.getDefaultInstance()
        self.c = c
        
    def __call__( self, p, script ):
        
        import java
        print script
        start = java.lang.System.currentTimeMillis()
        try:
            self.Ruby.evalScript( script )
        except java.lang.Exception, x:
            print x
            print dir( x )
            x.printStackTrace()
            print self.Ruby.getSourceLine()
            n = self.Ruby.getSourceLine()
            self.c.goToScriptLineNumber(p,script,n)
            print "WENT TO %s" % n
            
        end = java.lang.System.currentTimeMillis()
        print "TOTAL TIME %s" % ( end - start )
        


def addHandler( tag, kwords ):
    
    lse = kwords[ 'lse' ]
    c = kwords[ 'c' ]
    jrhandler = JRubyHandler( c )
    lse.addHandler( "ruby", jrhandler )


def init():	
    import leoPlugins
    leoPlugins.registerHandler( "script_executor_created", addHandler )
    g.plugin_signon( __name__)
#@nonl
#@-node:zorcanda!.20050911195922:@thin JRubyIntegration.py
#@-leo
