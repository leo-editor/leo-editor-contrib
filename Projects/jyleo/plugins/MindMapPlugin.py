#@+leo-ver=4-thin
#@+node:zorcanda!.20051108103639:@thin MindMapPlugin.py
'''This is the plugin to enable the MindMap plugin functionality.  Enable this module.'''
import leoGlobals as g
from utilities.DefCallable import DefCallable
import java
import javax.swing as swing
import javax.swing.event as sevent

class MindMapManager:
    
    def __init__( self, c, view_controls ):
        self.c = c
        self.loaded = 0
        self.mindmap = None
        self.view_controls = view_controls
        self.base = view_controls.addControl( "MindMap", self.attach, self.detach )
        self.base.setLayout( java.awt.GridLayout( 1, 1 ) )
    
    
    def detach( self ):
        self.mm.detach()    
    
    def attach( self ):
    
        ft = None
        if not self.mindmap:
            self.createMindMap()
            if self.mindmap:
                self.base.add( self.mindmap )
                self.mm.attach()
            else:
                return
        elif hasattr( self, 'mm' ):
            dc = DefCallable( self.mm.reload_outline )
            ft = dc.wrappedAsFutureTask()
        
    
        if self.mindmap:        
            if ft:
                print "ATTACH AGAIN!!!"
                self.mm.attach()
                swing.SwingUtilities.invokeLater( ft )
            
    def createMindMap( self ):
        
        import org.python.core.Py as Py
        system_state = Py.getSystemState()
        sscl = system_state.getClassLoader()
        try:
            try:
                ccl = java.lang.Thread.currentThread().getContextClassLoader()
                cpath = java.lang.System.getProperty( "java.class.path" )
            
                import leoFreeMindView
            
                #Each of these 3 calls play a pivotal role in loading the system
                java.lang.System.setProperty( "java.class.path", "" )
                java.lang.Thread.currentThread().setContextClassLoader( leoFreeMindView.mmcl )
                system_state.setClassLoader( leoFreeMindView.mmcl )
                
                self.mm = leoFreeMindView.mindmap( self.c )
                self.mindmap = self.mm.mindmapview
                ml = MListener( self.mm._free_leo_mind.updateMenus )
                self.mm._free_leo_mind.getMainMenu().addMenuListener( ml )
                
            except java.lang.Exception, x:
                x.printStackTrace()
                swing.JOptionPane.showMessageDialog( None, "Cant Load MindMap View." )
        finally:   
            java.lang.System.setProperty( "java.class.path", cpath )
            java.lang.Thread.currentThread().setContextClassLoader( ccl )
            system_state.setClassLoader( sscl )
        
        
        
    

def addMindMapView( tag, args ):
    try:
        view_controls = args[ 'view_controls' ]
        c = args[ 'c' ]
        mm = MindMapManager( c, view_controls )
        
    except java.lang.Exception,x:
        x.printStackTrace()

def init():	
    import leoPlugins
    leoPlugins.registerHandler( "swingtreecreated", addMindMapView )
    g.plugin_signon( __name__)
    
    
#@+others
#@+node:zorcanda!.20051109124959:MListener
class MListener( sevent.MenuListener ):
    def __init__( self, command ):
        self.command = command
                
    def menuSelected( self, event ):
        self.command()
                
    def menuDeselected( self, event ): pass
    def menuCanceled( self, event ): pass
#@nonl
#@-node:zorcanda!.20051109124959:MListener
#@-others
#@-node:zorcanda!.20051108103639:@thin MindMapPlugin.py
#@-leo
