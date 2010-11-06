#@+leo-ver=4-thin
#@+node:zorcanda!.20051108105622:@thin MindMapClassLoader.py
import ClassLoaderBase
import java
import os

mmclinstance = None
def getMindMapClassLoader():
    global mmclinstance
    if mmclinstance == None:
        mmclinstance = MindMapClassLoader()
    return mmclinstance

class MindMapClassLoader( ClassLoaderBase ):
    

        
    
    def __init__( self ):
        ClassLoaderBase.__init__( self )
        self.fm_home_set = False
        
    def importClass( self, name, pyname, globaldict ):
        
        clazz = self.loadClass( name )
        self.resolve( clazz )
        globaldict[ pyname ] = clazz
        
    def walkAndAdd( self, path ):
        
        import os.path
        os.path.walk( path, self.callback, path )
    
    def callback( self, arg, dirpath, namelist ):

        path = dirpath[ len( arg ): ]
        if path.startswith( "/freemind" ) or path.startswith( "/.freemind" ):
            if not self.fm_home_set:
                java.lang.System.setProperty( "freemind.base.dir", arg )
                java.lang.System.setProperty( "freemind.base.dir2", arg )
                java.lang.System.setProperty( "java.class.path", dirpath )
                self.addSearchPath( dirpath )
                self.fm_home_set = True
            for z in namelist:
                if z.endswith( ".jar" ):
                    self.addJar( "%s/%s" % ( dirpath, z ) ) 

        
    
#@nonl
#@-node:zorcanda!.20051108105622:@thin MindMapClassLoader.py
#@-leo
