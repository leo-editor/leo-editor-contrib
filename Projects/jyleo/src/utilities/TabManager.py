#@+leo-ver=4-thin
#@+node:zorcanda!.20050920161520:@thin TabManager.py
import javax.swing as swing
import java

class TabManager:
    
    def __init__( self, switch_on_add = 1 ):
        self.jtp = swing.JTabbedPane()
        self.base = swing.JPanel( java.awt.GridLayout( 1, 1 ) )
        self.count = 0
        self.components_names = java.util.WeakHashMap()
        self.switch_on_add = switch_on_add
        
    def tabsToTop( self ): self.jtp.setTabPlacement( self.jtp.TOP )
    def tabsToBottom( self ): self.jtp.setTabPlacement( self.jtp.BOTTOM )
    def tabsToRight( self ): self.jtp.setTabPlacement( self.jtp.RIGHT )
    def tabsToLeft( self ): self.jtp.setTabPlacement( self.jtp.LEFT )
        
    def getCurrentTab( self ):
        
        return self.jtp.getSelectedComponent()
        
    def select( self, component ):
        self.jtp.setSelectedComponent( component )
        
    def holdsComponent( self, component ):
        if self.components_names.containsKey( component ):
            return 1
        return 0
        
    def add( self, name, component, switch=True ):
        
        self.components_names[ component ] = name
        if self.count == 0:
            self.base.add( component )
            self.count += 1
        elif self.count == 1:
            children = self.base.getComponents()
            child = children[ 0 ]
            cname = self.components_names[ child ]
            self.jtp.addTab( cname, child )
            self.jtp.addTab( name, component )
            self.base.add( self.jtp )
            if self.switch_on_add and switch:
                self.jtp.setSelectedComponent( component )
            self.count += 1
        else:
            self.jtp.addTab( name, component )
            if self.switch_on_add:
                self.jtp.setSelectedComponent( component )
            self.count += 1
            
    def remove( self, component ):
        
        if self.count:
            parent = component.getParent()
            parent.remove( component )
            self.count -= 1
            del self.components_names[ component ]
            if self.count == 1:
                self.base.remove( self.jtp )
                nwcomponent = self.jtp.getComponentAt( 0 )
                self.base.add( nwcomponent )

            
#@nonl
#@-node:zorcanda!.20050920161520:@thin TabManager.py
#@-leo
