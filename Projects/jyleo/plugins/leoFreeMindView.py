#@+leo-ver=4-thin
#@+node:zorcanda!.20051108103717.1:@thin leoFreeMindView.py
import leoGlobals as g
import java
try:
    import MindMapClassLoader
    mmcl = MindMapClassLoader.getMindMapClassLoader()
    java.lang.Thread.currentThread().setContextClassLoader( mmcl )
    jpath = g.os_path_join( g.app.loadDir,"..","jars")
    mmcl.walkAndAdd( jpath )
    pdir = g.os_path_join( g.app.loadDir, "..", "plugins" )
    lcmic = g.os_path_join( pdir, "freemind", "modes", "LeoCloneMindIconCreator.class" )
    mmcl.addResource(  "freemind.modes.LeoCloneMindIconCreator", lcmic )
    mmcl.addResource( "LeoNodeAdapter", "%s/%s" % ( pdir, "LeoNodeAdapter.class" ) )
    mmcl.addResource( "LeoEdgeAdapter", "%s/%s" % ( pdir, "LeoEdgeAdapter.class" ) )
    mmcl.addResource( "FreeLeoMind", "%s/%s" % ( pdir, "FreeLeoMind.class" ) )
    mmcl.addResource( "FreeLeoMind$1", "%s/%s" % ( pdir, "FreeLeoMind$1.class" ) )
    mmcl.addResource( "FreeLeoMind$Controller2", "%s/%s" % ( pdir, "FreeLeoMind$Controller2.class" ) )
    mmcl.addResource( "FreeLeoMind$HookFactory3", "%s/%s" % ( pdir, "FreeLeoMind$HookFactory3.class" ) )
    mmcl.addResource( "FreeLeoMindMap", "%s/%s" % ( pdir, "FreeLeoMindMap.class" ) )  
    mmcl.addResource( "org.leo.ImageJPanel", "%s/%s" % ( g.app.loadDir, "/org/leo/ImageJPanel.class" ) )
    globald = globals()
    mmcl.importClass( "freemind.modes.LeoCloneMindIconCreator", "LeoCloneMindIconCreator", globald )
    mmcl.importClass( "LeoNodeAdapter", "LeoNodeAdapter", globald )
    mmcl.importClass( "LeoEdgeAdapter", "LeoEdgeAdapter", globald )
    mmcl.importClass( "FreeLeoMind", "FreeLeoMind", globald )
    mmcl.importClass( "FreeLeoMind$Controller2", "Controller2", globald )
    mmcl.importClass( "FreeLeoMindMap", "FreeLeoMindMap", globald )
    mmcl.importClass( "freemind.modes.MindMapLinkRegistry", "MindMapLinkRegistry", globald )
    mmcl.importClass( "freemind.modes.mindmapmode.MindMapNodeModel", "MindMapNodeModel", globald )
    mmcl.importClass( "freemind.modes.mindmapmode.MindMapArrowLinkModel", "MindMapArrowLinkModel", globald )
    mmcl.importClass( "freemind.modes.actions.PasteAction", "PasteAction", globald )
    mmcl.importClass( "freemind.modes.actions.NewChildAction", "NewChildAction", globald )
    mmcl.importClass( "freemind.modes.actions.DeleteChildAction", "DeleteChildAction", globald )
    mmcl.importClass( "freemind.modes.actions.CopySingleAction", "CopySingleAction", globald )
    mmcl.importClass( "freemind.controller.NodeDropListener", "NodeDropListener", globald )
    mmcl.importClass( "freemind.modes.actions.NodeUpAction", "NodeUpAction", globald )
    mmcl.importClass( "freemind.modes.NodeDownAction", "NodeDownAction", globald )
    mmcl.importClass( "freemind.modes.actions.RemoveAllIconsAction", "RemoveAllIconsAction", globald )
    mmcl.importClass( "freemind.view.mindmapview.BubbleNodeView", "BubbleNodeView", globald )
    mmcl.importClass( "freemind.modes.mindmapmode.MindMapEdgeModel", "MindMapEdgeModel", globald )
    # mmcl.importClass( "freemind.modes.mindmapmode.MindMapMapModel", "MindMapMapModel", globald )
    mmcl.importClass( "freemind.main.FreeMindMain", "FreeMindMain", globald )
    #mmcl.importClass( "javax.xml.bind.JAXBContext", "JAXBContext", globald )
except Exception, x:
    x.printStackTrace()

import org.python.core.Py as Py
system_state = Py.getSystemState()
old_classloader = system_state.getClassLoader()
system_state.setClassLoader( mmcl )
#import freemind.main as main
#import freemind
#import freemind.modes as modes
#import freemind.modes.LeoCloneMindIconCreator as LeoCloneMindIconCreator
#import freemind.view.mindmapview as mmv
#import freemind.view as view
import javax.swing as swing
import javax.swing.tree as stree
import javax.imageio as imageio 
import java
import java.util as util
import javax.swing.event as sevent
import EditorBackground
#import LeoNodeAdapter
#import LeoEdgeAdapter
#import FreeLeoMind
#import FreeLeoMindMap
import leoNodes
import jarray
import java.awt.dnd as dnd
import leoGlobals as g
import copy
import leoSwingFrame

#@+others
#@+node:zorcanda!.20051108103717.2:leoOutlineAdapter
class leoOutlineAdapter( FreeLeoMindMap , util.Observer ):
    
    
    def __init__( self, c, fn ):
        
        self.c = c
        self.map_expansion_to_outline = g.app.config.getBool( c, 'mindmap_map_expand-close_to_outline' )
        self.initial_expansion = g.app.config.getString( c, 'mindmap_initial_expansion' )
        self.expand_to_level = g.app.config.getInt( c, 'mindmap_initial_expansion_level' )
        self.fn = fn
        self._real_root = c.rootPosition().v
        self._last_left = 0
        rrua = self._real_root.getUnknownAttributes()
        if rrua.has_key( "mm_root" ):
            self.root_uas = rrua[ "mm_root" ]
        else:
            self.root_uas = {}
            rrua[ "mm_root" ] = self.root_uas
        
        self.nlistener = NodeSelectionListener( c )
        ndl = leoDropListener( fn.getController(), c )
        fn.getController().setNodeDropListener( ndl )
        mc = fn.getController().getModeController()
        pup = mc.getPopupMenu()
        
            
        self.paste = paste = leoPasteAction( mc, self )
        pup.addPopupMenuListener( leoCloneAction( mc, self ) )
        #for z in pup.getComponents():
        #    if hasattr( z, 'getText' ) and z.getText() == "File":
        #        pup.remove( z )
        
        self.last_copy = None
        self._root = self.createRoot()
        self.v_to_node = {}
        self.newId = 0
        
        try:
            FreeLeoMindMap.__init__( self, self._root, fn )
            nodes = self.generateMap( initial = 1)
        except Exception, x:
            print x
        self.alterPasteAction( mc, paste )
        mc.newChild = leoNewChildAction( mc, self )
        mc.deleteChild = leoDeleteChildAction( mc, self )
        mc.copySingle = leoCopySingleAction( mc, self )
        mc.nodeUp = leoNodeUpAction( mc, self )
        mc.nodeDown = leoNodeDownAction( mc, self )
        mc.removeAllIconsAction = leoRemoveAllIconsAction( mc, mc.unknwonIconAction, self )
        self.reg = reg = self.super__getLinkRegistry()
        self.rdec = RegistryDecorator2( self.reg, self )
        self.generateLinks()
        self.attached = False

         
    
    def getLinkRegistry( self ):
        return self.rdec
    
    def changeNode( self, node, text ):
        self.super__changeNode( node, text )

    
    
        
    #@    @+others
    #@+node:zorcanda!.20051108103717.3:regenerateLinks
    def regenerateLinks( self, node, node2 ):
        
        
        rdec = self.rdec
        links = self.rdec.getAllLinks( node2 )
    
        
        aR = self.asyncReregister( rdec, self.last_links, self.fn )
        swing.SwingUtilities.invokeLater( aR )
            
        self.last_links = None
    
    
    class asyncReregister( java.lang.Runnable ):
        def __init__( self, rdec, links, fn ):
            self.rdec = rdec
            self.links = links
            self.fn = fn
            
        def run( self ):
            if self.links:
                for z in self.links:
                    t = z.getTarget()
                    s = z.getSource()
                    
                    
                    if( self.rdec.getLabel( z.getTarget()) == None):
                        #call registry to give new label
                        self.rdec.registerLinkTarget( z.getTarget())
                    
                    z.setUniqueID( self.rdec.generateUniqueLinkID( z.getUniqueID() ))
                    z.setDestinationLabel( self.rdec.getLabel( z.getTarget() ))
                    self.rdec.registerLink( z )
                    mc = self.fn.getController().getModeController()
                    mc.nodeChanged( z.getTarget() )
                    mc.nodeChanged( z.getSource() )
    
    #@-node:zorcanda!.20051108103717.3:regenerateLinks
    #@+node:zorcanda!.20051108103717.4:lastLeft
    def setLastLeft( self, left ):
        self._last_left = left
        
    def getLastLeft( self ):
        return self._last_left
    #@nonl
    #@-node:zorcanda!.20051108103717.4:lastLeft
    #@+node:zorcanda!.20051108103717.5:copy
    def copy( self, *args ):
            
        if args and args[ 0 ].__class__ == leoMindMapNode2:
            self.last_copy = self.getFrame().getView().getSelectedNodesSortedByY()
            self.last_links = {}
            self.last_hooks = {}
            self.last_parents = {}
            self.last_cloned = []
            for z in self.last_copy:
                self.recursiveBuildLinksList( z, self.last_links )
                self.last_links[ z ] = self.rdec.getAllLinks( z )
                self.last_hooks[ z ] = z.getHooks().toArray()
                self.last_parents[ z ] = z.getParent()
                if z.p.isCloned():        
                    self.last_cloned.append( z )
                    
                
            self.paste.setLast( ( self.last_copy, self.last_links, self.last_hooks, self.last_parents ) )
        rv = self.super__copy( *args )
        return rv
    #@nonl
    #@-node:zorcanda!.20051108103717.5:copy
    #@+node:zorcanda!.20051108103717.6:generateMap
    def generateMap( self, initial = 0 ):
        
        
        
        rp = self.c.rootPosition()
        parents_nodes = {}
        newnodes = []
        self.loading = 1
        iter = rp.allNodes_iter( copy = True )
        c = self.c
        
        #g.app.config.getInt( c, 'mindmap_initial_expansion_level' )
        #style = g.app.config.getString( c, "mindmap_node_style" )
        #self._root.setStyle( style )
        #clones = []
        leoMindMapNode2.expand_to_outline = self.map_expansion_to_outline
        for z in iter:
        
            x = leoMindMapNode2( z, self.fn, self.nlistener, self )
            
                
            parents_nodes[ z ] = x
            parent = z.getParent()
            #if z.isCloned():
            #    clones.append( x )
                              
            if z.level() == 0:
                cc = self._root.getChildCount()
                self._root.insert( x, cc )
            else:
                cc = parents_nodes[ parent ].getChildCount()
                parents_nodes[parent].insert( x, cc )
            
            if self.initial_expansion == 'direct':
                if z.numberOfChildren():
                    if z.isExpanded():
                        x.setFolded( 0 )
                    else:
                        x.setFolded( 1 )
            else:
                if z.numberOfChildren():
                    if ( z.level() + 1 ) <= self.expand_to_level:
                        x.setFolded( 0 )
                    else:
                        x.setFolded( 1 )
        
        #while clones:
        #    clone = clones.pop()
        #    potentials = []
        #    for z in clones:
        #        if z.v.t == clone.v.t:
        #            potentials.append( z )
        #    parent = clone.p.getParent()
        #    for z in potentials:
        #        if z.p.v == clone.p.v:
        #            clones.remove( z )
                    
        
        
        self.loading = 0           
        return newnodes
    
    #@-node:zorcanda!.20051108103717.6:generateMap
    #@+node:zorcanda!.20051108103717.7:generateLinks
    def generateLinks( self ):
        
    
        lr = self.getLinkRegistry()
        for z in leoMindMapNode2.linkregister:
    
            st = leoMindMapNode2.linkregister[ z ]
            lr.registerLinkTarget( st.target, z )
            arrow = modes.mindmapmode.MindMapArrowLinkModel( st.source, st.target, self.fn )
            arrow.setColor( st.color )
            arrow.setStyle( st.style )
            arrow.setStartInclination( st.sincl )
            arrow.setEndInclination( st.eincl )
            arrow.setUniqueID( st.uid )
            if st.sarrow == "None":
                st.sarrow = None
            arrow.setStartArrow( st.sarrow )
            if st.earrow == "None":
                st.earrow = None
            arrow.setEndArrow( st.earrow )
            if st.dlabel == "None" or st.dlabel == None:
                st.dlabel = ""
            arrow.setDestinationLabel( st.dlabel )
            lr.registerLink( arrow )
    #@-node:zorcanda!.20051108103717.7:generateLinks
    #@+node:zorcanda!.20051108103717.8:recursiveBuildLinksList
    def recursiveBuildLinksList( self, parent, lnks ):
        
        #v = parent.p.v
        children = parent.childList()
        for z in children:
            lnks[ z.p.v ] = self.rdec.getAllLinks( z )
            self.recursiveBuildLinksList( z, lnks )
            
        
    #@nonl
    #@-node:zorcanda!.20051108103717.8:recursiveBuildLinksList
    #@+node:zorcanda!.20051108103717.9:createRoot
    def createRoot( self ):
            
        c = self.c
        color = g.app.config.getColor( c, "mindmap_node_bg_color" )
        bg = leoSwingFrame.getColorInstance( color, java.awt.Color.WHITE )
        
        class root( leoBaseMindMapNode ):
            def __init__( self, name, t, dic ):
                
                leoBaseMindMapNode.__init__( self, name, t, dic )
                color = g.app.config.getColor( c, "mindmap_node_bg_color" )
                bg = leoSwingFrame.getColorInstance( color, java.awt.Color.WHITE )
                self.setBackgroundColor( bg )
                color = g.app.config.getColor( c, "mindmap_node_color" )
                cl = leoSwingFrame.getColorInstance( color, java.awt.Color.BLACK )
                self.setColor( cl )
                config = g.app.config
                font = config.getFontFromParams( c, "mindmap_text_font_family", "mindmap_text_font_size", None, "mindmap_text_font_weight")
                self.setFont( font )
                bold = config.getBool( c, "mindmap_node_bold" )
                self.setBold( int(bold) )
                italic = config.getBool( c, "mindmap_node_italic" )
                self.setItalic( int(italic) )
                underlined = config.getBool( c, "mindmap_node_underlined" )
                self.setUnderlined( int(underlined) )
                self.initialize()
                if self.uAs.has_key( 'mm_utext' ):
                    txt = self.uAs[ 'mm_utext' ]
                    self.setUserObject( txt )
                
            def getParent( self ):
                return None
                
            def setUserObject( self, o ):
                
                self.uAs[ 'mm_utext' ] = str( o )
                return self.super__setUserObject( o )
                
            def isRoot( self ):
                return 1
                
            def setParent( self ):
                pass
                
    
                
                
        rt = root( "New Leo Mindmap", self.fn, self.root_uas )
        rt.mm = self
        style = g.app.config.getString( c, "mindmap_node_style" )
        rt.setStyle( style )
        return rt
    
    
    #@-node:zorcanda!.20051108103717.9:createRoot
    #@+node:zorcanda!.20051108103717.10:getRootNode
    def getRootNode( self ):
        
        for z in self._root.getChildren():
            if z.p.isRoot():
                return z
    #@nonl
    #@-node:zorcanda!.20051108103717.10:getRootNode
    #@+node:zorcanda!.20051108103717.11:reload_outline
    def reload_outline( self ):
            
        mc = self.fn.getController().getModeController()
        mc.nodeChanged( self._root )
        for z in self.c.rootPosition().self_and_siblings_iter( copy = 1 ):
            try:
                for x in self._root.getChildren():
                    if x.v == z.v:
                        x.p = z.copy()
                        self.rebuildPositions( x, z.copy() )
            except java.lang.Exception, x:
                x.printStackTrace()
        
        self.recursiveChange( self._root )
        return
        
    
    #@-node:zorcanda!.20051108103717.11:reload_outline
    #@+node:zorcanda!.20051108103717.12:rebuildPositions
    def rebuildPositions( self, node, p ):
        
        children = node.getChildren()
        mc = self.fn.getController().getModeController()
        for z in p.children_iter( copy = 1 ):
            ci = z.childIndex()
            node2 = children.get( ci )
            node2.p = z
            node2.v = z.v
    
            self.rebuildPositions( node2 , z )
        
    #@-node:zorcanda!.20051108103717.12:rebuildPositions
    #@+node:zorcanda!.20051108103717.13:recursiveChange
    def recursiveChange( self, node ):
        
        mc = self.fn.getController().getModeController()
        for z in node.getChildren():
            z.super__setUserObject( z.getText() )
            mc.nodeChanged( z )
            self.recursiveChange( z )
    #@nonl
    #@-node:zorcanda!.20051108103717.13:recursiveChange
    #@+node:zorcanda!.20051108103717.14:getNodeForVnode
    def getNodeForVnode( self, p ):
        
        v = p.v
        if self.v_to_node.has_key( v ):
            return self.v_to_node[ v ]
        else:
            x = leoMindMapNode2( z, self.fn, self.nlistener, self )
            self.v_to_node[ v ] = x
            return x
    #@nonl
    #@-node:zorcanda!.20051108103717.14:getNodeForVnode
    #@-others
 
    
    def setViewers( self, viewer ):
        
        for z in leoMindMapNode.nodes.values():
            bviewer = BV2( z, viewer )
            z.setViewer( bviewer )
            viewer.add( bviewer )
            bviewer.setLocation( 400, 100 )
            bviewer.setText( z.getText() )


    #@    <<MindMap specific>>
    #@+node:zorcanda!.20051108103717.15:<<MindMap specific>>
    #@+others
    #@+node:zorcanda!.20051108103717.16:changeNode
    #void changeNode(MindMapNode node, String newText);
    #    //nodeChanged has moved to the modeController. (fc, 2.5.2004)
    
    def changeNode2( self, node, newText ):
        
        print newText
        print node
        
    #@-node:zorcanda!.20051108103717.16:changeNode
    #@+node:zorcanda!.20051108103717.17:nodeChanged
    #void nodeChanged(TreeNode node);
    def nodeChanged2( self, node ):
        
        print node
    #@nonl
    #@-node:zorcanda!.20051108103717.17:nodeChanged
    #@+node:zorcanda!.20051108103717.18:cut, copy, copySIngle
    #Transferable cut(MindMapNode node);
    #
    #Transferable copy(MindMapNode node);#
    #
    #    // ^ Is copy with node really needed? It seems to me, that no.
    #Transferable copy(); 
    #Transferable copySingle();
    #/**
    #* @param selectedNodes
    #* @param inPlainText typically this is null. AN alternative is node.toString(); if there is only one node.
    #* @return
    #*/
    #public Transferable copy(List selectedNodes, String inPlainText);
    
    def cut2( self, node ):
        pass
        
    def copy2( self, *args):
        pass
        
    def copySingle2( self ):
        pass
    #@nonl
    #@-node:zorcanda!.20051108103717.18:cut, copy, copySIngle
    #@+node:zorcanda!.20051108103717.19:getAsPlainText getAsRDFText
    #String getAsPlainText(List mindMapNodes);
    #String getAsRTF(List mindMapNodes);
    
    #def getAsPlainText( self, mindMapNodes ):
    #    pass
        
    #def getAsRTF( self, mindMapNodes ):
    #    pass
    #@nonl
    #@-node:zorcanda!.20051108103717.19:getAsPlainText getAsRDFText
    #@+node:zorcanda!.20051108103717.20:insertNodeInto
    #void insertNodeInto(
    #		MindMapNode newChild,
    #			MindMapNode parent,
    #			int index);
    
    def insertNodeInto2( self, newChild, parent, index ):
        pass
        print newChild
    #@-node:zorcanda!.20051108103717.20:insertNodeInto
    #@+node:zorcanda!.20051108103717.21:getFile, getURL, xml
    #  /**
    #     * Returns the file name of the map edited or null if not possible.
    #     */
    #    File getFile();
    #
    #    /**
    #     * Return URL of the map (whether as local file or a web location)
    #     */
    #    URL getURL() throws MalformedURLException;
    #    
    #    /** writes the content of the map to a writer.
    #	 * @param fileout
    #	 * @throws IOException
    #	 */
    #	void getXml(Writer fileout) throws IOException;
    def getFile2( self ):
        pass
        
    def getURL2( self ):
        pass
        
    def getXML2( self, writer ):
        pass
    #@nonl
    #@-node:zorcanda!.20051108103717.21:getFile, getURL, xml
    #@+node:zorcanda!.20051108103717.22:background color
    #Color getBackgroundColor();
        
    #void setBackgroundColor(Color color);
    
    def getBackgroundColor2( self ):
        
        return self._bg_color
        
    def setBackgroundColor2( self, color ):
        
        self._bg_color = color
    #@nonl
    #@-node:zorcanda!.20051108103717.22:background color
    #@+node:zorcanda!.20051108103717.23:registry, destroy, isReadOnly
    #MindMapLinkRegistry getLinkRegistry();
    
       
    #    /**
    #     * Destroy everything you have created upon opening.  
    #     */
    #    void destroy();
    
    #    boolean isReadOnly();
    
    
    def getLinkRegistry2( self ):
        #print 'getLinkRegistry'
        return self._link_registry
        #pass
        
        
    #def destroy( self ):
    #    pass
        
    #def isReadOnly( self ):
    #    pass
        
    #@-node:zorcanda!.20051108103717.23:registry, destroy, isReadOnly
    #@+node:zorcanda!.20051108103717.24:getRestorable
    def getRestoreable2( self ):
        return "ZONKABONKA"
        
        
    def isReadOnly( self ):
        return 0
        
        
    def getParentNode2( self ):
        print "GETTING PARENT!!"
        return None
    #@nonl
    #@-node:zorcanda!.20051108103717.24:getRestorable
    #@-others
    
    #@+at
    # void changeNode(MindMapNode node, String newText);
    #     //nodeChanged has moved to the modeController. (fc, 2.5.2004)
    # void nodeChanged(TreeNode node);
    # 
    # Transferable cut(MindMapNode node);
    # 
    # Transferable copy(MindMapNode node);
    # 
    #     // ^ Is copy with node really needed? It seems to me, that no.
    # Transferable copy();
    # Transferable copySingle();
    # /**
    # * @param selectedNodes
    # * @param inPlainText typically this is null. AN alternative is 
    # node.toString(); if there is only one node.
    # * @return
    # */
    # public Transferable copy(List selectedNodes, String inPlainText);
    # String getAsPlainText(List mindMapNodes);
    # String getAsRTF(List mindMapNodes);
    # 
    # void insertNodeInto(
    # 		MindMapNode newChild,
    # 			MindMapNode parent,
    # 			int index);
    # 
    # //    void paste(Transferable t, MindMapNode parent);
    # //    /** @param isLeft determines, whether or not the node is placed on 
    # the left or right. **/
    # //    void paste(Transferable t, MindMapNode target, boolean asSibling, 
    # boolean isLeft);
    # //
    #     //    void paste(MindMapNode node, MindMapNode parent);
    # 
    # 
    #     /**
    #      * Returns the file name of the map edited or null if not possible.
    #      */
    #     File getFile();
    # 
    #     /**
    #      * Return URL of the map (whether as local file or a web location)
    #      */
    #     URL getURL() throws MalformedURLException;
    #     /** writes the content of the map to a writer.
    # 	 * @param fileout
    # 	 * @throws IOException
    # 	 */
    # 	void getXml(Writer fileout) throws IOException;
    # 
    #     /**
    #      * Returns a string that may be given to the modes restore()
    #      * to get this map again. The Mode must take care that
    #      * two different maps don't give the same restoreable
    #      * key.
    #      */
    #     String getRestoreable();
    # 
    #     Object[] getPathToRoot( TreeNode node );
    # 
    #     Color getBackgroundColor();
    #     void setBackgroundColor(Color color);
    # 
    # 
    #     /** @return returns the link registry associated with this mode, or 
    # null, if no registry is present.*/
    #     MindMapLinkRegistry getLinkRegistry();
    # 
    #     /**
    #      * Destroy everything you have created upon opening.
    #      */
    #     void destroy();
    # 
    #     boolean isReadOnly();
    # 
    # // (PN)
    #@-at
    #@-node:zorcanda!.20051108103717.15:<<MindMap specific>>
    #@nl
    	

        
    def paste( self, *args ):
        return self.super__paste( *args )
        
    def cut( self, *args ):
        return self.super__cut( *args )
                    
    def getRoot( self ):
        return self._root


    def isLeaf2( self, node ):
        print "Leaf? %s" % obj
        return self.super__isLeaf( obj )
        
    def getChild2( self, parent, index ):
        print "getChild? %s" % parent
        return self.super__getChild( parent, index )
        
    def getChildCount2( self, node ):
        print "GETTING CCOUTN %s" % node
        return self.super__getChildCount( node )
        
    def getIndexOfChild2( self, parent, child ):
        print "GETTING INDEX! %s" % child
        return self.super__getIndexOfChild( parent, child )

    #def asMapNode( self, p ):
    #    
    #    #print leoMindMapNode.nodes
    #    if leoMindMapNode.nodes.has_key( p.v ):
    #        return leoMindMapNode.nodes[ p.v ]
    #    else:
    #        return leoMindMapNode( p, self.fn, self._root, self._link_registry )
    

            
    
    #@    <<some methods>>
    #@+node:zorcanda!.20051108103717.25:<<some methods>>
    #void setColor(Color color);
    
    #// fc, 06.10.2003:
    #/** Is a vector of MindIcon s*/
    #Vector getIcons();
    
    #void   addIcon(MindIcon icon);
    
    #/* @return returns the new amount of icons.*/
    #int   removeLastIcon();
    #// end, fc, 24.9.2003
    
    #// clouds, fc, 08.11.2003:
    #MindMapCloud getCloud();
    #void setCloud( MindMapCloud cloud );
    #// end clouds.
            
    #//fc, 24.2.2004: background color:
    #Color getBackgroundColor(           );
    #void  setBackgroundColor(Color color);
    
    #def getBackgroundColor( self):
    #    return self._bg_color
    
    #def setBackgroundColor( self, color ):
    #    self._bg_color = color
        
    #def getCloud( self ):
    #    return self._cloud
    
    #def setCloud( self, cloud ):
    #    self._cloud = cloud
        
    #def getIcons( self ):
    #    return self._icons
        
    #def addIcon( self, icon ):
    #    self._icons.add( icon )
        
    #def removeLastIcon( self ):
    #    
    #    self._icons.remove( self._icons.lastElement() )
    #    return self._icons.length()
        
    def setColor( self, color ):
        self._color = color
        
    def getColor( self ):
        return self._color
        
    #def getStateIcons( self ):
    #    
    #    return self._sicons
        
    #def setStateIcon( self, key, icon ):
    #    self._sicons.put( key, icon )
        
    #@-node:zorcanda!.20051108103717.25:<<some methods>>
    #@nl






#@-node:zorcanda!.20051108103717.2:leoOutlineAdapter
#@+node:zorcanda!.20051108103717.26:RegistryDecorator
class RegistryDecorator( MindMapLinkRegistry ):
    
    def __init__( self, reg, loa ):
        self.reg = reg
        self.loa = loa
        
    def registerLinkTarget( self, *target ):
        
        return self.reg.registerLinkTarget( *target )
        
    def deregisterLinkTarget( self, target ):
        
        return self.reg.deregisterLinkTarget( target )
        
    def getState( self, target ):
        
        return self.reg.getState( target )
        
    def getLabel( self, label ):
        
        return self.reg.getLabel( label )
        
    def generateUniqueID( self, target ):
        
        return self.reg.generateUniqueID( target )
    
    #def generateUniqueLinkId( self, proposedID):
    #    return self.reg.generateUniqueLinkId( proposedId )
        
    def generateUniqueLinkID( self, proposedID ):
        return self.reg.generateUniqueLinkID( proposedID )
        
    def getTargetForID( self, id ):
        return self.reg.getTargetForID( id )
        
    def getLinkForID( self, id ):
        return self.reg.getLinkForID( id )
        
    def cutNode( self, node ):
        return self.reg.cutNode( node )
        
    def getCuttedNode( self, oldTargetID):
        return self.reg.getCuttedNode( oldTargetID )
    
    def clearCuttedNodeBuffer( self ):
        return self.reg.clearCuttedNodeBuffer()
        
    def registerLink( self, link):
        
        id = link.getUniqueID()
        source = link.getSource()
        target = link.getTarget()
        
        if source:
            source._addSourceLink( id )
            link.setSource( source )
        
        if target:
            target._addTargetLink( id )
            link.setTarget( target )
    
        if link.__class__ != LinkDecorator:
            ld = LinkDecorator( link )
        else:
            ld = link
    
        rv = self.reg.registerLink( ld )
        #source._updateLink( ld.getUniqueID(), ld )
        return rv
        
    def deregisterLink( self, link):
        
        source = link.getSource()
        target = link.getTarget()
        id = link.getUniqueID()

        source._removeSourceLink( id )
        target._removeTargetLink( id )

        return self.reg.deregisterLink( link )
        
    def getAllSources( self, target):

        return self.reg.getAllSources( target )
        
    def getAllLinks( self, node):

        rv = self.reg.getAllLinks( node )
        return rv
        
    def getAllLinksIntoMe(self, target):
        return self.reg.getAllLinksIntoMe( target )
        
    def getAllLinksFromMe( self, source):
        return self.reg.getAllLinksFromMe( source )
#@+at
# package freemind.modes;
# 
# import freemind.modes.MindMapNode;
# import freemind.modes.MindMapLink;
# import java.util.Vector;
# 
# /** Interface for the registry, which manages the ids of nodes and the 
# existing links in a map.
#     Thus, this interface is bound to a map model, because other maps have a 
# different registry.*/
# public interface MindMapLinkRegistry {
# ////////////////////////////////////////////////////////////////////////////////////////
#     ////   State 
# Model                                                                 /////
# ////////////////////////////////////////////////////////////////////////////////////////
#     /** State parent interface.*/
#     public interface ID_BasicState {
#         /** Returns null for many states.*/
#         public String getID();
#         public String toString();
#     };
#     /** This state interface expresses the state that a node is blank (i.e. 
# without an id, normal state).*/
#     public interface ID_Blank extends ID_BasicState {};
#     /** This state interface expresses the state that a node has an ID, but 
# is abstract.*/
#     public interface ID_UsedState extends ID_BasicState {
#         public MindMapNode getTarget();
#     };
#     /** This state interface expresses the state that a node has an ID.*/
#     public interface ID_Registered extends ID_UsedState {
#     };
# //     /** This state interface expresses the state that a node was recently 
# cutted and waits to be inserted at another place.
# //         After inserting the states changes to ID_Registered.
# //     */
# //     public interface ID_Pending extends ID_UsedState {
# //     };
# 
#     /** The main method. Registeres a node with a new (or an existing) 
# node-id. If the state of the id is pending,
#      then it is set to registered again.
#     */
#     public ID_Registered registerLinkTarget(MindMapNode target);
#     /** The second variant of the main method. The difference is that here 
# an ID is proposed, but has not to be taken, though.
#     */
#     public ID_Registered registerLinkTarget(MindMapNode target, String 
# proposedID);
#     public void        deregisterLinkTarget(MindMapNode target)
#         throws java.lang.IllegalArgumentException;
#     public ID_BasicState getState(MindMapNode node);
#     public String getLabel(MindMapNode target);
#     /** This can be used, if the id has to be known, before a node can be 
# labled. */
# 	public String generateUniqueID(String proposedID);
#     /** Reverses the getLabel method: searches for a node with the id given 
# as the argument.*/
#     public MindMapNode getTargetForID(String ID);
#     /** This can be used, if the id has to be known, before a link can be 
# labled. */
# 	public String generateUniqueLinkID(String proposedID);
#     /** Reverses the getUniqueID method: searches for a link with the id 
# given as the argument.*/
#     public MindMapLink getLinkForID(String ID);
# //     /** Method to keep track of the targets associated to a target node. 
# This method also sets the new id to the target.
# //         Moreover, it is not required that the target node is already 
# registered. This will be done on the fly.*/
#     /** Removes links to all nodes beginning from target with its 
# children.*/
#     public void        cutNode(MindMapNode target);
#     /** Clears the set of recent cutted nodes.*/
#     public void clearCuttedNodeBuffer();
#     /** @return returns all links that have been cutted out recently.*/
#     public Vector /* of MindMapLink s*/  getCuttedNode(String oldTargetID);
#     public void   registerLink(MindMapLink link);
#     public void deregisterLink(MindMapLink link);
# 
#     /** Returns a Vector of Nodes that point to the given node.*/
#     public Vector /* of MindMapNode s */ getAllSources(MindMapNode target);
#     /** @return returns all links from or to this node.*/
#     public Vector /* of MindMapLink s */ getAllLinks(MindMapNode node);
#     /** @return returns all links to this node.*/
#     public Vector /* of MindMapLink s */ getAllLinksIntoMe(MindMapNode 
# target);
#     /** @return returns all links from this node.*/
#     public Vector /* of MindMapLink s */ getAllLinksFromMe(MindMapNode 
# source);
# 
# 
# }
# 
#@-at
#@-node:zorcanda!.20051108103717.26:RegistryDecorator
#@+node:zorcanda!.20051108103717.27:RegistryDecorator2
class RegistryDecorator2( MindMapLinkRegistry ):
    
    
    def __init__( self, reg, loa ):
        self.reg = reg
        self.loa = loa
        self.registered_ltargets = {} #intended for vnode...
        
    def registerLinkTarget( self, *target ):
        
        return self.reg.registerLinkTarget( *target )
        
    def deregisterLinkTarget( self, target ):
        
        print target
        return self.reg.deregisterLinkTarget( target )
        
    def getState( self, target ):
        
        return self.reg.getState( target )
        
    def getLabel( self, label ):
        
        return self.reg.getLabel( label )
        
    def generateUniqueID( self, target ):
        
        return self.reg.generateUniqueID( target )
    
    #def generateUniqueLinkId( self, proposedID):
    #    return self.reg.generateUniqueLinkId( proposedId )
        
    def generateUniqueLinkID( self, proposedID ):
        return self.reg.generateUniqueLinkID( proposedID )
        
    def getTargetForID( self, id ):
        return self.reg.getTargetForID( id )
        
    def getLinkForID( self, id ):
        return self.reg.getLinkForID( id )
        
    def cutNode( self, node ):
        return self.reg.cutNode( node )
        
    def getCuttedNode( self, oldTargetID):
        return self.reg.getCuttedNode( oldTargetID )
    
    def clearCuttedNodeBuffer( self ):
        return self.reg.clearCuttedNodeBuffer()
        
    def registerLink( self, link):
        
        swing.JOptionPane.showMessageDialog( None, "Graphical Links Are Not Allowed" )
        return
        id = link.getUniqueID()
        source = link.getSource()
        target = link.getTarget()
        print source, target
        if hasattr( source, 'v' ):
            print "SOURCE %s" % source.v
        if hasattr( target, 'v' ):
            print "Target %s" % target.v 
        
        
        if source:
            source._addSourceLink( id )
            link.setSource( source )
        
        if target:
            target._addTargetLink( id )
            link.setTarget( target )
    
        if link.__class__ != LinkDecorator:
            ld = LinkDecorator( link )
        else:
            ld = link
    
        rv = self.reg.registerLink( ld )
        #source._updateLink( ld.getUniqueID(), ld )
        return rv
        
    def deregisterLink( self, link):
        
        source = link.getSource()
        target = link.getTarget()
        id = link.getUniqueID()

        source._removeSourceLink( id )
        target._removeTargetLink( id )

        return self.reg.deregisterLink( link )
        
    def getAllSources( self, target):

        return self.reg.getAllSources( target )
        
    def getAllLinks( self, node):

        rv = self.reg.getAllLinks( node )
        return rv
        
    def getAllLinksIntoMe(self, target):
        return self.reg.getAllLinksIntoMe( target )
        
    def getAllLinksFromMe( self, source):
        return self.reg.getAllLinksFromMe( source )
#@+at
# package freemind.modes;
# 
# import freemind.modes.MindMapNode;
# import freemind.modes.MindMapLink;
# import java.util.Vector;
# 
# /** Interface for the registry, which manages the ids of nodes and the 
# existing links in a map.
#     Thus, this interface is bound to a map model, because other maps have a 
# different registry.*/
# public interface MindMapLinkRegistry {
# ////////////////////////////////////////////////////////////////////////////////////////
#     ////   State 
# Model                                                                 /////
# ////////////////////////////////////////////////////////////////////////////////////////
#     /** State parent interface.*/
#     public interface ID_BasicState {
#         /** Returns null for many states.*/
#         public String getID();
#         public String toString();
#     };
#     /** This state interface expresses the state that a node is blank (i.e. 
# without an id, normal state).*/
#     public interface ID_Blank extends ID_BasicState {};
#     /** This state interface expresses the state that a node has an ID, but 
# is abstract.*/
#     public interface ID_UsedState extends ID_BasicState {
#         public MindMapNode getTarget();
#     };
#     /** This state interface expresses the state that a node has an ID.*/
#     public interface ID_Registered extends ID_UsedState {
#     };
# //     /** This state interface expresses the state that a node was recently 
# cutted and waits to be inserted at another place.
# //         After inserting the states changes to ID_Registered.
# //     */
# //     public interface ID_Pending extends ID_UsedState {
# //     };
# 
#     /** The main method. Registeres a node with a new (or an existing) 
# node-id. If the state of the id is pending,
#      then it is set to registered again.
#     */
#     public ID_Registered registerLinkTarget(MindMapNode target);
#     /** The second variant of the main method. The difference is that here 
# an ID is proposed, but has not to be taken, though.
#     */
#     public ID_Registered registerLinkTarget(MindMapNode target, String 
# proposedID);
#     public void        deregisterLinkTarget(MindMapNode target)
#         throws java.lang.IllegalArgumentException;
#     public ID_BasicState getState(MindMapNode node);
#     public String getLabel(MindMapNode target);
#     /** This can be used, if the id has to be known, before a node can be 
# labled. */
# 	public String generateUniqueID(String proposedID);
#     /** Reverses the getLabel method: searches for a node with the id given 
# as the argument.*/
#     public MindMapNode getTargetForID(String ID);
#     /** This can be used, if the id has to be known, before a link can be 
# labled. */
# 	public String generateUniqueLinkID(String proposedID);
#     /** Reverses the getUniqueID method: searches for a link with the id 
# given as the argument.*/
#     public MindMapLink getLinkForID(String ID);
# //     /** Method to keep track of the targets associated to a target node. 
# This method also sets the new id to the target.
# //         Moreover, it is not required that the target node is already 
# registered. This will be done on the fly.*/
#     /** Removes links to all nodes beginning from target with its 
# children.*/
#     public void        cutNode(MindMapNode target);
#     /** Clears the set of recent cutted nodes.*/
#     public void clearCuttedNodeBuffer();
#     /** @return returns all links that have been cutted out recently.*/
#     public Vector /* of MindMapLink s*/  getCuttedNode(String oldTargetID);
#     public void   registerLink(MindMapLink link);
#     public void deregisterLink(MindMapLink link);
# 
#     /** Returns a Vector of Nodes that point to the given node.*/
#     public Vector /* of MindMapNode s */ getAllSources(MindMapNode target);
#     /** @return returns all links from or to this node.*/
#     public Vector /* of MindMapLink s */ getAllLinks(MindMapNode node);
#     /** @return returns all links to this node.*/
#     public Vector /* of MindMapLink s */ getAllLinksIntoMe(MindMapNode 
# target);
#     /** @return returns all links from this node.*/
#     public Vector /* of MindMapLink s */ getAllLinksFromMe(MindMapNode 
# source);
# 
# 
# }
# 
#@-at
#@-node:zorcanda!.20051108103717.27:RegistryDecorator2
#@+node:zorcanda!.20051108103717.28:resizer --keeps components sized right
class resizer( sevent.ChangeListener ):
    '''This class keeps the Editor size in sync with the JLayeredPane. 
       It also sets where the line numbers go and where, if present,
       a background image goes.'''
    def __init__( self, view, background ):

        self.viewPort = view.getViewport()
        self.background = background
        self.view = view
    


           

    def stateChanged( self, event ):
        
        parent = self.background.getParent()
        bounds = parent.getBounds()
        self.background.setBounds( bounds )
        return
        #print "RESIZING %s" % event
        visRect = self.viewPort.getViewRect()
        #visRect = self.viewPort.getViewSize() 
        #print "-------"
        #print visRect      
        visRect.x = 0
        visRect.y = 0
        visRect2 = swing.SwingUtilities.convertRectangle( self.viewPort, visRect, self.background.getParent() )     
        #print visRect2
        self.background.setSize( visRect2.width, visRect2.height )
        #self.background.setLocation( visRect.x , visRect.y )
        self.background.setLocation( visRect2.x, visRect2.y )
#@-node:zorcanda!.20051108103717.28:resizer --keeps components sized right
#@+node:zorcanda!.20051108103717.29:leoMindMapNode
class leoMindMapNode( MindMapNodeModel ):
    
    nodes = {}
    ix = 0
    
    def __init__( self, pos, fn , root, lr ):
        MindMapNodeModel.__init__( self, fn )
        self.pos = pos
        self.v = pos.v
        self._root = root
        leoMindMapNode.ix += 1
        leoMindMapNode.nodes[ self.v ] = self
        self._sicons = java.util.Vector()
        self._color = java.awt.Color.GREEN
        self._icons = java.util.TreeMap()
        self._cloud = None
        self._bg_color = java.awt.Color.RED
        #edge = modes.mindmapmode.MindMapEdgeModel( self, fn )
        edge = LeoEdgeAdapter( self, fn )   
        edge.setStyle( 'bezier' )
        edge.setColor( java.awt.Color.GREEN )
        edge.setStroke( java.awt.BasicStroke() )
        #edge.setStyle( 
        self.setEdge( edge )
        self.setText( pos.headString() )
        self._viewer = None
        #lr = fn.getController().getLinkRegistry()
        lr.registerLinkTarget( self, self.ugu )
        #print "Viewer is %s" % self.getViewer()
        self.setViewer( fn.getView() )
        self.setFolded( 0 )
        self._font = java.awt.Font("Arial", java.awt.Font.BOLD, 18)
        #print "LEFT? %s" % self.getLeft()
        
        #bviewer = view.mindmapview.BubbleNodeView( self, fn.getController().getView() )
        #self.setViewer( bviewer )
        
    #@    <<java interface>>
    #@+node:zorcanda!.20051108103717.30:<<java interface>>
    #@+at
    # 
    # this.lastModifiedAt = lastModifiedAt;
    # }
    # }
    # public static final String STYLE_BUBBLE = "bubble";
    # public static final String STYLE_FORK = "fork";
    # public static final String STYLE_COMBINED = "combined";
    # public static final String STYLE_AS_PARENT = "as_parent";
    # static final int AUTO = -1;
    # 
    # String getText();
    # void setText(String text);
    # /**
    # * @return returns the unique id of the node. It is generated using the 
    # LinkRegistry.
    # */
    # String getObjectId(ModeController controller);
    # /** @return returns a ListIterator of all children of the node if the 
    # node is unfolded.
    # * EMPTY_LIST_ITERATOR otherwise. * */
    # ListIterator childrenFolded();
    # 
    # /** @return returns a ListIterator of all (and not only the unfolded 
    # ones!!) children of the node.
    # * */
    # ListIterator childrenUnfolded();
    # 
    # boolean hasChildren();
    # 
    # /** @return -1 if the argument childNode is not a child. */
    # int getChildPosition(MindMapNode childNode);
    # 
    # MindMapNode getPreferredChild();
    # void setPreferredChild(MindMapNode node);
    # int getNodeLevel();
    # 
    # String getLink();
    # /** returns a short textual description of the text contained in the 
    # node.
    # *  Html is filtered out. */
    # String getShortText(ModeController controller);
    # 
    # MindMapEdge getEdge();
    # 
    # Color getColor();
    # 
    # String getStyle();
    # /** currently the style may be one of MindMapNode.STYLE_BUBBLE or 
    # MindMapNode.STYLE_FORK.*/
    # void setStyle(String style);
    # 
    # MindMapNode getParentNode();
    # 
    # boolean isBold();
    # 
    # boolean isItalic();
    # 
    # boolean isUnderlined();
    # 
    # Font getFont();
    # String getFontSize();
    # String getFontFamilyName();
    # NodeView getViewer();
    # 
    # void setViewer( NodeView viewer );
    # 
    # String toString();
    # TreePath getPath();
    # boolean isDescendantOf(MindMapNode node);
    # boolean isRoot();
    # 
    # boolean isFolded();
    # 
    # freemind.main.Tools.BooleanHolder isLeft();
    # /** Root is on the right side.* @return
    # */
    # boolean isOneLeftSideOfRoot();
    # void setLeft(boolean isLeft);
    # 
    # void setFolded(boolean folded);
    # 
    # void setFont(Font font);
    # void setShiftY(int y);
    # int getShiftY();
    # int calcShiftY();
    # 
    # void setVGap(int i);
    # int getVGap();
    # int calcVGap();
    # void setHGap(int i);
    # int getHGap();
    # void setLink(String link);
    # 
    # void setFontSize(int fontSize);
    # 
    # void setColor(Color color);
    # 
    # // fc, 06.10.2003:
    # /** Is a vector of MindIcon s*/
    # Vector getIcons();
    # 
    # void   addIcon(MindIcon icon);
    # 
    # /* @return returns the new amount of icons.*/
    # int   removeLastIcon();
    # // end, fc, 24.9.2003
    # 
    # // clouds, fc, 08.11.2003:
    # MindMapCloud getCloud();
    # void setCloud( MindMapCloud cloud );
    # // end clouds.
    # //fc, 24.2.2004: background color:
    # Color getBackgroundColor(           );
    # void  setBackgroundColor(Color color);
    # 
    # //hooks, fc 28.2.2004:
    # List getHooks();
    # Collection getActivatedHooks();
    # /** Adds the hook to the list of hooks to my node.
    # *  Does not invoke the hook!
    # * @param hook
    # * @return returns the input parameter hook
    # */
    # PermanentNodeHook addHook(PermanentNodeHook hook);
    # void invokeHook(NodeHook hook);
    # /** Removes the hook from the activated hooks, calls shutdown method of 
    # the hook and removes the
    # * hook from allHook belonging to the node afterwards. */
    # void removeHook(PermanentNodeHook hook);
    # //end hooks
    # //tooltips,fc 29.2.2004
    # void setToolTip(String key, String tip);
    # java.util.Map getToolTip();
    # //additional info, fc, 15.12.2004
    # /** This method can be used to store non-visual additions to a node.
    # * Currently, it is used for encrypted nodes to store the encrypted 
    # content.
    # * @param info
    # */
    # void setAdditionalInfo(String info);
    # public String getAdditionalInfo();
    # MindMapNode shallowCopy();
    # public XMLElement save(Writer writer, MindMapLinkRegistry registry) 
    # throws IOException;
    # // fc, 10.2.2005:
    # /** State icons are icons that are not saved. They indicate that
    # *  this node is special.
    # * @return
    # */
    # SortedMap getStateIcons();
    # 
    # /**
    # * @param key
    # * @param icon use null to remove the state icon. Then it is not
    # * required, that the key already exists.
    # */
    # void   setStateIcon(String key, ImageIcon icon);
    # //fc, 11.4.2005:
    # HistoryInformation getHistoryInformation();
    # void setHistoryInformation(HistoryInformation historyInformation);
    # }
    #@-at
    #@nonl
    #@-node:zorcanda!.20051108103717.30:<<java interface>>
    #@nl
    #@    @+others
    #@+node:zorcanda!.20051108103717.31:getattr
    def __getattr__( self, attr ):
        print "LMN %s" % attr
        if self.__dict__.has_key( attr ):
            return self.__dict__[ attr ]
        else:
            return self.__dict__[ 'pos' ][ attr]
            
            
    def __repr__( self ):
        return self.getText()
    #@nonl
    #@-node:zorcanda!.20051108103717.31:getattr
    #@+node:zorcanda!.20051108103717.32:getText setText
    #String getText();
    #    void setText(String text);
    
    def getText( self ):
        return self.v.headString()
        
    def setText( self, text ):
        self.v.t.setTnodeText( text )
        v = self.getViewer()
        if v:
            v.setText( text ) 
    #@-node:zorcanda!.20051108103717.32:getText setText
    #@+node:zorcanda!.20051108103717.33:getParentNode()
    def getParentNode( self ):
        
        #print self.pos.level()
        if self.pos.level() == 0:
            return self._root
            
        else:
            v = self.pos.getParent().v
            return leoMindMapNode.nodes[ v ]
    #@-node:zorcanda!.20051108103717.33:getParentNode()
    #@+node:zorcanda!.20051108103717.34:getStyle
    def getStyle( self ):
        print "STYLING!"
        return "bubble" 
        
    def setStyle( self, _string ):
        
        print "SETTING STYLE!"
    #@nonl
    #@-node:zorcanda!.20051108103717.34:getStyle
    #@+node:zorcanda!.20051108103717.35:getNodeID
    #/**
    #	 * @return returns the unique id of the node. It is generated using the LinkRegistry.
    #	 */
    #	String getObjectId(ModeController controller);
    
    def getObjectID( self, modecontroller ):
        return modecontroller.getNodeID( self )
        
    #@nonl
    #@-node:zorcanda!.20051108103717.35:getNodeID
    #@+node:zorcanda!.20051108103717.36:childrenFolded
    #ListIterator childrenFolded();
    
    #def childrenFolded( self ):
    #    pass
    #@-node:zorcanda!.20051108103717.36:childrenFolded
    #@+node:zorcanda!.20051108103717.37:childrenUnfolded
    # /** @return returns a ListIterator of all (and not only the unfolded ones!!) children of the node. 
    #     * */
    #    ListIterator childrenUnfolded();
    
    #def childrenUnfolded( self ):
    #    pass
        
    #@-node:zorcanda!.20051108103717.37:childrenUnfolded
    #@+node:zorcanda!.20051108103717.38:childIndexes
    #boolean hasChildren();
    #
    #	/** @return -1 if the argument childNode is not a child. */
    #    int getChildPosition(MindMapNode childNode);
    
    def hasChildren( self ):
        
        return self.pos.numberOfChildren()
        
    
    def getChildPosition( self, childNode ):
        
        print "GETTING CPOSITION!"
        return self.pos.childIndex( childNode.pos )
        
    def getFont( self ):
        print "GETTING FONT"
        return None
        
    def setFont( self, font ):
        print font
        self._font = font
    #@nonl
    #@-node:zorcanda!.20051108103717.38:childIndexes
    #@+node:zorcanda!.20051108103717.39:preferred child
    #MindMapNode getPreferredChild();
    #    void setPreferredChild(MindMapNode node);
    
    #def getPreferredChild( self ):
    #    pass
        
    #def setPreferredChild( self, node ):
    #    pass
        
        
    #@-node:zorcanda!.20051108103717.39:preferred child
    #@+node:zorcanda!.20051108103717.40:node level, isRoot
    #int getNodeLevel();
    
    def getNodeLevel( self ):
        
        print "GET NLEVEL"
        return self.pos.level() + 1
        
    
    
    def isRoot( self ):
        
        return 0
        
    #@-node:zorcanda!.20051108103717.40:node level, isRoot
    #@+node:zorcanda!.20051108103717.41:setViewer getViewer
    #NodeView getViewer();
    
    #void setViewer( NodeView viewer );
    
    #def getViewer( self ):
    #    print "GRABBING VIEW for %s" % self
    #    print self._viewer
    #    java.lang.Thread.currentThread().dumpStack()
    #    return self._viewer
        
    #def setViewer( self, viewer ):
    #    self._viewer = viewer
    #@-node:zorcanda!.20051108103717.41:setViewer getViewer
    #@+node:zorcanda!.20051108103717.42:some methods
    #void setColor(Color color);
    
    #// fc, 06.10.2003:
    #/** Is a vector of MindIcon s*/
    #Vector getIcons();
    
    #void   addIcon(MindIcon icon);
    
    #/* @return returns the new amount of icons.*/
    #int   removeLastIcon();
    #// end, fc, 24.9.2003
    
    #// clouds, fc, 08.11.2003:
    #MindMapCloud getCloud();
    #void setCloud( MindMapCloud cloud );
    #// end clouds.
            
    #//fc, 24.2.2004: background color:
    #Color getBackgroundColor(           );
    #void  setBackgroundColor(Color color);
    
    def getBackgroundColor( self ):
        return self._bg_color
    
    def setBackgroundColor( self, color ):
        self._bg_color = color
        
    def getCloud( self ):
        return self._cloud
    
    def setCloud( self, cloud ):
        self._cloud = cloud
        
    #def getIcons( self ):
    #    return self._icons
        
    #def addIcon( self, icon ):
    #    self._icons.add( icon )
        
    #def removeLastIcon( self ):
    #    
    #    self._icons.remove( self._icons.lastElement() )
    #    return self._icons.length()
        
    def setColor( self, color ):
        self._color = color
        
    def getColor( self ):
        return self._color
        
    #@-node:zorcanda!.20051108103717.42:some methods
    #@+node:zorcanda!.20051108103717.43:some more methods
    #SortedMap getStateIcons();
    #
    #/**
    #* @param key
    #* @param icon use null to remove the state icon. Then it is not 
    #* required, that the key already exists.
    #*/
    #void   setStateIcon(String key, ImageIcon icon);
    
    
    #def getStateIcons( self ):
        
    #    return self._sicons
        
    #def setStateIcon( self, key, icon ):
    #    self._sicons.put( key, icon )
    #@nonl
    #@-node:zorcanda!.20051108103717.43:some more methods
    #@+node:zorcanda!.20051108103717.44:isDescendantOf
    def isDescendantOf( self, node ):
        print "Descend of %s" % node
        return 1
        
        
    def getLink( self ):
        #print "GETTING LINL %s" % self.ugu
        #return "ughuhu"
        return self.ugu
        
    
    def toString( self ):
        #print "TOOO STRING %s" % self.pos.headString()
        return self.pos.headString()
    #@nonl
    #@-node:zorcanda!.20051108103717.44:isDescendantOf
    #@-others
    

#@-node:zorcanda!.20051108103717.29:leoMindMapNode
#@+node:zorcanda!.20051108103717.45:leoBaseMindMapNode
class leoBaseMindMapNode( LeoNodeAdapter ):
    
    
    def __init__( self, p, t, uAs ):
        LeoNodeAdapter.__init__( self, p, t )
        self.uAs = uAs
        self.p = p
        self.t = t
     
    def initialize( self ):
        uAs = self.uAs   
        if uAs.has_key( 'mm_icons' ):
            mm_icons = uAs[ 'mm_icons' ]
            for z in mm_icons:
                mi = modes.MindIcon.factory( z )
                self.addIcon( mi )
        if uAs.has_key( 'mm_fontsize' ):
            fs = uAs[ 'mm_fontsize' ]
            self.setFontSize( int( fs ) )
        if uAs.has_key( 'mm_italic' ):
            ital = uAs[ 'mm_italic' ]
            self.setItalic( ital )
        if uAs.has_key( 'mm_bold' ):
            bold = uAs[ 'mm_bold' ]
            self.setBold( bold )
        if uAs.has_key( 'mm_underline' ):
            underline = uAs[ 'mm_underline' ]
            self.setUnderlined( underline )
        if uAs.has_key( 'mm_cloud' ):
            cloud = uAs[ 'mm_cloud' ]
            if cloud:
                cld = modes.mindmapmode.MindMapCloudModel( self, self.t )
                self.setCloud( cld ) 
        if uAs.has_key( 'mm_style' ):
            style = uAs[ 'mm_style' ]
            self.setStyle( style )
        if uAs.has_key( 'mm_bgcolor' ):
            color = uAs[ 'mm_bgcolor' ]
            bcolor = java.awt.Color( color )
            self.setBackgroundColor( bcolor )
        if uAs.has_key( 'mm_color' ):
            color = uAs[ 'mm_color' ]
            color = java.awt.Color( color )
            self.setColor( color )
        if uAs.has_key( 'mm_vgap' ):
            gap = uAs[ 'mm_vgap' ]
            self.setVGap( gap )
        if uAs.has_key( 'mm_hgap' ):
            gap = uAs[ 'mm_hgap' ]
            self.setHGap( gap )
        if uAs.has_key( 'mm_link' ):
            link = uAs[ 'mm_link' ]
            self.setLink( link )
        if uAs.has_key( 'mm_shifty' ):
            y = uAs[ 'mm_shifty' ]
            self.setShiftY( y )
        if uAs.has_key( 'mm_ffname' ):
            ffname = uAs[ 'mm_ffname' ]
            self.setFontFamilyName( ffname )
        if uAs.has_key( 'mm_uainfo' ):
            uainfo = uAs[ 'mm_uainfo' ]
            return self.super__setAdditionalInfo( uainfo )
        if uAs.has_key( 'mm_ttip' ):
            dic = uAs[ 'mm_ttip' ]
            for z in dic:
                self.setToolTip( z,dic[z] )
        if uAs.has_key( 'mm_left' ):
            left = uAs[ 'mm_left' ]
            self.setLeft( left )
        if uAs.has_key( 'mm_slinks' ):
            slink = uAs[ 'mm_slinks' ]

            for z in slink:

                if leoMindMapNode2.linkregister.has_key( z ):

                    a_st = leoMindMapNode2.linkregister[ z ]
                    a_st.source = self
                else:

                    a_st = self.st()
                    a_st.source = self
                    leoMindMapNode2.linkregister[ z ] = a_st
                dic = slink[ z ]
                if dic:

                    a_st.color = java.awt.Color( int( dic[ 'color' ] ) )
                    a_st.style = dic[ 'style' ]
                    a_st.stroke = dic[ 'stroke' ]
                    a_st.sarrow = dic[ 'sarrow' ]
                    a_st.uid = dic[ 'uid' ]
                    if a_st.sarrow == "None":
                        a_st.sarrow = None
                    a_st.earrow = dic[ 'earrow' ]
                    if a_st.earrow == "None":
                        a_st.earrow = None
                    a_st.dlabel = dic[ 'dlabel' ]
                    si = dic[ 'sincl' ]
                    if si:
                        x, y = si
                        a_st.sincl = java.awt.Point( int(x), int(y) )
                    else:
                        a_st.sincl = None
                    ei = dic[ 'eincl' ]
                    if ei:
                        x, y = ei
                        a_st.eincl = java.awt.Point( int(x), int(y) )
                    else:
                        a_st.eincl = None
                
        if uAs.has_key( 'mm_tlinks' ) :
            
            tlink = uAs[ 'mm_tlinks' ]
            for z in tlink:
                if leoMindMapNode2.linkregister.has_key( z ):
                    leoMindMapNode2.linkregister[ z ].target = self
                else:
                    a_st = self.st()
                    a_st.target = self
                    leoMindMapNode2.linkregister[ z ] = a_st
        if uAs.has_key( "mm_hooks" ):
            hooks = uAs[ 'mm_hooks' ]
            for z in hooks:
                clazz = java.lang.Class.forName( z )
                nh = clazz.newInstance()
                nh.setController( t.getController().getModeController() )
                nh.setName( hooks[ z ] )
                self.addHook( nh )
                self.invokeHook( nh )
    
    #@    @+others
    #@+node:zorcanda!.20051108103717.46:uA specific
    def __setUA( self, name, value ):
        #uAs = self.p.v.getUnknownAttributes()
        uAs = self.uAs
        uAs[ name ] = value  
    #@nonl
    #@-node:zorcanda!.20051108103717.46:uA specific
    #@+node:zorcanda!.20051108103717.47:setters
    #@+others
    #@+node:zorcanda!.20051108103717.48:setUserObject
    def setUserObject( self, o ):
        
        mc = self.t.getController().getModeController()
        if hasattr( self, 'oc' ):
            self.p.c.beginUpdate()
            self.p.v.t.headString = o
            for z in self.oc.nodes:
                z.super__setUserObject( o )
                viewer = z.getViewer()
                if viewer:
                    mc.nodeChanged( z )
                    #viewer.setText( str( o ) )
            self.p.c.endUpdate()
            
    #@nonl
    #@-node:zorcanda!.20051108103717.48:setUserObject
    #@+node:zorcanda!.20051108103717.49:setBackgroundColor
    def setBackgroundColor( self, color ):
        
        mc = self.t.getController().getModeController()
        self.__setUA( 'mm_bgcolor', color.getRGB() )
        if hasattr( self, 'oc' ):
            for z in self.oc.nodes:
                if z == self: continue
                if z.v != self.v:
                    z.__setUA( 'mm_bgcolor', color )
                viewer = z.getViewer()
                if viewer:
                    z.super__setBackgroundColor( color )
                    mc.nodeChanged( z )
                
        self.super__setBackgroundColor( color )
    #@-node:zorcanda!.20051108103717.49:setBackgroundColor
    #@+node:zorcanda!.20051108103717.50:setColor
    def setColor( self, color ):
        
        mc = self.t.getController().getModeController()
        self.__setUA( 'mm_color', color.getRGB() )
        if hasattr( self, 'oc' ):
            for z in self.oc.nodes:
                if z == self: continue
                if z.v != self.v:
                    z.__setUA( 'mm_color', color )
                viewer = z.getViewer()
                if viewer:
                    z.super__setColor( color )
                    mc.nodeChanged( z )
                
        self.super__setColor( color )
    #@nonl
    #@-node:zorcanda!.20051108103717.50:setColor
    #@+node:zorcanda!.20051108103717.51:setStyle
    def setStyle( self, style ):
        
        mc = self.t.getController().getModeController()
        self.__setUA( 'mm_style', style )
        if hasattr( self, 'oc' ):
            for z in self.oc.nodes:
                if z == self: continue
                if z.v != self.v:
                    z.__setUA( 'mm_style', style )
                viewer = z.getViewer()
                if viewer:
                    z.super__setStyle( style )
                    mc.nodeChanged( z )
                
        return self.super__setStyle( style )
    #@nonl
    #@-node:zorcanda!.20051108103717.51:setStyle
    #@+node:zorcanda!.20051108103717.52:setBold
    def setBold( self, bld ):
        
        
        mc = self.t.getController().getModeController() 
        self.__setUA( 'mm_bold' , bld )
        if hasattr( self, 'oc' ):
            for z in self.oc.nodes:
                if z == self: continue
                if z.v != self.v:
                    z.__setUA( 'mm_bold', bld )
                viewer = z.getViewer()
                if viewer:
                    z.super__setBold( bld )
                    mc.nodeChanged( z )
        
        
        return self.super__setBold( bld )
    #@-node:zorcanda!.20051108103717.52:setBold
    #@+node:zorcanda!.20051108103717.53:setItalic
    def setItalic( self, ital ):
        
        
        mc = self.t.getController().getModeController()
        self.__setUA( 'mm_italic', ital )
        if hasattr( self, 'oc' ):
            for z in self.oc.nodes:
                if z == self: continue
                if z.v != self.v:
                    z.__setUA( 'mm_italic', ital )
                viewer = z.getViewer()
                if viewer:
                    z.super__setItalic( ital )
                    mc.nodeChanged( z )
        
        
        return self.super__setItalic( ital )
    #@-node:zorcanda!.20051108103717.53:setItalic
    #@+node:zorcanda!.20051108103717.54:setUnderlined
    def setUnderlined( self, under ):
        
        mc = self.t.getController().getModeController()
        self.__setUA( 'mm_underline', under )
        if hasattr( self, 'oc' ):
            for z in self.oc.nodes:
                if z == self: continue
                if z.v != self.v:
                    z.__setUA( 'mm_underline', under )
                viewer = z.getViewer()
                if viewer:
                    z.super__setUnderlined( under )
                    mc.nodeChanged( z )
        
        
        return self.super__setUnderlined( under )
    #@-node:zorcanda!.20051108103717.54:setUnderlined
    #@+node:zorcanda!.20051108103717.55:setFontSize
    def setFontSize( self, size ):
         
        mc = self.t.getController().getModeController()   
        self.__setUA( 'mm_fontsize', size )
        if hasattr( self, 'oc' ):
            for z in self.oc.nodes:
                if z == self: continue
                if z.v != self.v:
                    z.__setUA( 'mm_fontsize', size )
                viewer = z.getViewer()
                if viewer:
                    z.super__setFontSize( size )
                    mc.nodeChanged( z )    
            
        return self.super__setFontSize( size )
    #@-node:zorcanda!.20051108103717.55:setFontSize
    #@+node:zorcanda!.20051108103717.56:setFontFamilyName
    def setFontFamilyName( self, name ):
    
        mc = self.t.getController().getModeController()
        self.__setUA( 'mm_ffname', name )
        if hasattr( self, 'oc' ):
            for z in self.oc.nodes:
                if z == self: continue
                if z.v != self.v:
                    z.__setUA( 'mm_ffname', name )
                viewer = z.getViewer()
                if viewer:
                    z.super__setFontFamilyName( name )
                    mc.nodeChanged( z )     
        
        return self.super__setFontFamilyName( name )
    
    
    #@-node:zorcanda!.20051108103717.56:setFontFamilyName
    #@+node:zorcanda!.20051108103717.57:setAdditionalInfo
    def setAdditionalInfo( self, info ):
        
        mc = self.t.getController().getModeController()    
        self.__setUA( 'mm_uainfo', info )
        if hasattr( self, 'oc' ):
            for z in self.oc.nodes:
                if z == self: continue
                if z.v != self.v:
                    z.__setUA( 'mm_uainfo', info )
                viewer = z.getViewer()
                if viewer:
                    z.super__setAdditionalInfo( info )
                    mc.nodeChanged( z )     
        
        return self.super__setAdditionalInfo( info )
    #@nonl
    #@-node:zorcanda!.20051108103717.57:setAdditionalInfo
    #@+node:zorcanda!.20051108103717.58:setText
    def setText2( self, text ):
    
        #print "SETTING TO %s" % text
        self.p.setHeadStringOrHeadline( text )
        #for z in self.p.v._mm_nodes:
        #    print z.getViewer()
        #    z.getViewer().repaint()
    #@nonl
    #@-node:zorcanda!.20051108103717.58:setText
    #@-others
    #@-node:zorcanda!.20051108103717.47:setters
    #@+node:zorcanda!.20051108103717.59:icons
    def removeLastIcon( self ):
        
        mc = None
        if hasattr( self, 'mm' ):
            mc = self.mm.fn.getController().getModeController()
        self.super__removeLastIcon()
        self.syncIcons()
        if mc:
            mc.nodeChanged( self )
    
    
    
    def getIcons( self ):
        rv = self.super__getIcons()
        
        return rv
        
    def addIcon( self, icon ):
        
        mc = None
        if hasattr( self, 'mm' ):
            mc = self.mm.fn.getController().getModeController()
        self.super__addIcon( icon )
        self.syncIcons()
        if mc:
            mc.nodeChanged( self )
    
            
    def syncIcons( self ):
        icons = self.getIcons()
        #uAs = self.p.v.getUnknownAttributes()
        uAs = self.uAs
        mmicons = []
        for z in icons:
            if z.getName() != "clone":
                mmicons.append( z.getName() )
        uAs[ 'mm_icons' ] = mmicons
    #@nonl
    #@-node:zorcanda!.20051108103717.59:icons
    #@-others
#@nonl
#@-node:zorcanda!.20051108103717.45:leoBaseMindMapNode
#@+node:zorcanda!.20051108103717.60:leoMindMapNode2
class leoMindMapNode2( leoBaseMindMapNode, dnd.DropTargetListener ):
    
    linkregister = {}
    
    path = g.os_path_join( g.app.loadDir,"..","Icons/nodebar", "clone.gif")
    clone_mi = LeoCloneMindIconCreator.getCloneIcon( path )
    expand_to_outline = 1
    
    #@    <<class st>>
    #@+node:zorcanda!.20051108103717.61:<<class st>>
    class st:
        def __init__( self ):
            self.source = None
            self.target = None
            self.color = None
            self.style = None
            self.stroke = None
            self.sincl = None
            self.eincl = None
            self.sarrow = None
            self.earrow = None
            self.dlabel = None
            self.uid = None
    #@nonl
    #@-node:zorcanda!.20051108103717.61:<<class st>>
    #@nl

    
    def __init__( self, p , t , nlistener , mm):
 
        self.p = p.copy()
        self.block = None
        self.ignore = 0
        self.updating = 0
        self.startup = 1
        self._icons = java.util.Vector()
        #LeoNodeAdapter.__init__( self, p, t )
        leoBaseMindMapNode.__init__( self, p, t, p.v.getUnknownAttributes() )
        c = p.c
        color = g.app.config.getColor( c, "mindmap_node_bg_color" )
        bg = leoSwingFrame.getColorInstance( color, java.awt.Color.WHITE )
        self.setBackgroundColor( bg )
        color = g.app.config.getColor( c, "mindmap_node_color" )
        cl = leoSwingFrame.getColorInstance( color, java.awt.Color.BLACK )
        self.setColor( cl )
        config = g.app.config
        font = config.getFontFromParams( c, "mindmap_text_font_family", "mindmap_text_font_size", None, "mindmap_text_font_weight")
        self.setFont( font )
        bold = config.getBool( c, "mindmap_node_bold" )
        self.setBold( int(bold) )
        italic = config.getBool( c, "mindmap_node_italic" )
        self.setItalic( int(italic) )
        underlined = config.getBool( c, "mindmap_node_underlined" )
        self.setUnderlined( int(underlined) )
        
        
        self.dec_edge = None
        self.setEdge( self.EdgeDecorator( self, t ) )

        self.t = t

        assert( mm.__class__ == leoOutlineAdapter )
        self.mm = mm
        self.nlistener = nlistener
        self.v = v = p.v
        if ObservingContainer.containers.has_key( v.t ):
            self.oc = ObservingContainer.containers[ v.t ]

        else:
            self.oc = ObservingContainer( v , mm, t, nlistener )

        self.oc.addTo( self )
        self.initialize()
#@+at        
#         uAs = v.getUnknownAttributes()
#         if uAs.has_key( 'mm_icons' ):
#             mm_icons = uAs[ 'mm_icons' ]
#             for z in mm_icons:
#                 mi = modes.MindIcon.factory( z )
#                 self.addIcon( mi )
#         if uAs.has_key( 'mm_fontsize' ):
#             fs = uAs[ 'mm_fontsize' ]
#             self.setFontSize( int( fs ) )
#         if uAs.has_key( 'mm_italic' ):
#             ital = uAs[ 'mm_italic' ]
#             self.setItalic( ital )
#         if uAs.has_key( 'mm_bold' ):
#             bold = uAs[ 'mm_bold' ]
#             self.setBold( bold )
#         if uAs.has_key( 'mm_underline' ):
#             underline = uAs[ 'mm_underline' ]
#             self.setUnderlined( underline )
#         if uAs.has_key( 'mm_cloud' ):
#             cloud = uAs[ 'mm_cloud' ]
#             if cloud:
#                 cld = modes.mindmapmode.MindMapCloudModel( self, self.t )
#                 self.setCloud( cld )
#         if uAs.has_key( 'mm_style' ):
#             style = uAs[ 'mm_style' ]
#             self.setStyle( style )
#         if uAs.has_key( 'mm_bgcolor' ):
#             color = uAs[ 'mm_bgcolor' ]
#             bcolor = java.awt.Color( color )
#             self.setBackgroundColor( bcolor )
#         if uAs.has_key( 'mm_color' ):
#             color = uAs[ 'mm_color' ]
#             color = java.awt.Color( color )
#             self.setColor( color )
#         if uAs.has_key( 'mm_vgap' ):
#             gap = uAs[ 'mm_vgap' ]
#             self.setVGap( gap )
#         if uAs.has_key( 'mm_hgap' ):
#             gap = uAs[ 'mm_hgap' ]
#             self.setHGap( gap )
#         if uAs.has_key( 'mm_link' ):
#             link = uAs[ 'mm_link' ]
#             self.setLink( link )
#         if uAs.has_key( 'mm_shifty' ):
#             y = uAs[ 'mm_shifty' ]
#             self.setShiftY( y )
#         if uAs.has_key( 'mm_ffname' ):
#             ffname = uAs[ 'mm_ffname' ]
#             self.setFontFamilyName( ffname )
#         if uAs.has_key( 'mm_uainfo' ):
#             uainfo = uAs[ 'mm_uainfo' ]
#             return self.super__setAdditionalInfo( uainfo )
#         if uAs.has_key( 'mm_ttip' ):
#             dic = uAs[ 'mm_ttip' ]
#             for z in dic:
#                 self.setToolTip( z,dic[z] )
#         if uAs.has_key( 'mm_left' ):
#             left = uAs[ 'mm_left' ]
#             self.setLeft( left )
#         if uAs.has_key( 'mm_slinks' ):
#             slink = uAs[ 'mm_slinks' ]
# 
#             for z in slink:
# 
#                 if leoMindMapNode2.linkregister.has_key( z ):
# 
#                     a_st = leoMindMapNode2.linkregister[ z ]
#                     a_st.source = self
#                 else:
# 
#                     a_st = self.st()
#                     a_st.source = self
#                     leoMindMapNode2.linkregister[ z ] = a_st
#                 dic = slink[ z ]
#                 if dic:
# 
#                     a_st.color = java.awt.Color( int( dic[ 'color' ] ) )
#                     a_st.style = dic[ 'style' ]
#                     a_st.stroke = dic[ 'stroke' ]
#                     a_st.sarrow = dic[ 'sarrow' ]
#                     a_st.uid = dic[ 'uid' ]
#                     if a_st.sarrow == "None":
#                         a_st.sarrow = None
#                     a_st.earrow = dic[ 'earrow' ]
#                     if a_st.earrow == "None":
#                         a_st.earrow = None
#                     a_st.dlabel = dic[ 'dlabel' ]
#                     si = dic[ 'sincl' ]
#                     if si:
#                         x, y = si
#                         a_st.sincl = java.awt.Point( int(x), int(y) )
#                     else:
#                         a_st.sincl = None
#                     ei = dic[ 'eincl' ]
#                     if ei:
#                         x, y = ei
#                         a_st.eincl = java.awt.Point( int(x), int(y) )
#                     else:
#                         a_st.eincl = None
#         if uAs.has_key( 'mm_tlinks' ) :
#             tlink = uAs[ 'mm_tlinks' ]
#             for z in tlink:
#                 if leoMindMapNode2.linkregister.has_key( z ):
#                     leoMindMapNode2.linkregister[ z ].target = self
#                 else:
#                     a_st = self.st()
#                     a_st.target = self
#                     leoMindMapNode2.linkregister[ z ] = a_st
#         if uAs.has_key( "mm_hooks" ):
#             hooks = uAs[ 'mm_hooks' ]
#             for z in hooks:
#                 clazz = java.lang.Class.forName( z )
#                 nh = clazz.newInstance()
#                 nh.setController( t.getController().getModeController() )
#                 nh.setName( hooks[ z ] )
#                 self.addHook( nh )
#                 self.invokeHook( nh )
#@-at
#@@c
        self.startup = 0                
        
                
    #void setToolTip(String key, String tip);
    def setToolTip( self, key , tip ):

        uA = self.p.v.getUnknownAttributes()
        if uA.has_key( 'mm_ttip' ):
            dic = uA[ 'mm_ttip' ]
        else:
            dic = {}
            uA[ 'mm_ttip' ] = dic
            
        if tip:
            dic[ key ] = tip
        else:
            del dic[ 'mm_ttip' ][ key ]
            
        return self.super__setToolTip( key, tip )
        
    def _addSourceLink( self, link ):
        uAs = self.p.v.getUnknownAttributes()
        if uAs.has_key( 'mm_slinks' ):
            slink = uAs[ 'mm_slinks' ]
        else:
            slink = {}
            uAs[ 'mm_slinks' ] = slink

        slink[ link ] = {}
        
    def _removeSourceLink( self, link ):

        uAs = self.p.v.getUnknownAttributes()
        if uAs.has_key( 'mm_slinks' ) and uAs[ 'mm_slinks' ].has_key( link ):
            del uAs[ 'mm_slinks'][ link ]
        
    def _addTargetLink( self, link ):
        uAs = self.p.v.getUnknownAttributes()
        if uAs.has_key( 'mm_tlinks' ):
            tlink = uAs[ 'mm_tlinks' ]
        else:
            tlink = {}
            uAs[ 'mm_tlinks' ] = tlink

        tlink[ link ] = {}
        
    def _updateLink( self, link, rlink ):
        
        
        uAs = self.p.v.getUnknownAttributes()
        if uAs.has_key( 'mm_tlinks' ):
            tlinks = uAs[ 'mm_tlinks' ]
            if tlinks.has_key( link ):
                self._dumpLinkData( rlink, tlinks[ link ] )
                
        if uAs.has_key( 'mm_slinks' ):
            slinks = uAs[ 'mm_slinks' ]
            if slinks.has_key( link ):
                self._dumpLinkData( rlink, slinks[ link ] )
                
            
    def _removeTargetLink( self, link ):
        
        uAs = self.p.v.getUnknownAttributes()
        if uAs.has_key( 'mm_tlinks' ) and uAs[ 'mm_tlinks' ].has_key( link ):
            del uAs[ 'mm_tlinks' ][ link ]


    
    def setShiftY( self, y ):
        self.__setUA( 'mm_shifty', y )
        return self.super__setShiftY( y )
    
    def setLink( self, link ):
        self.__setUA( 'mm_link', link )
        return self.super__setLink( link )
    
    def setVGap( self, gap ):
        self.__setUA( 'mm_vgap', gap )
        return self.super__setVGap( gap )
    
    def setHGap( self, gap ):
        self.__setUA( 'mm_hgap', gap )
        return self.super__setHGap( gap )
    
    
    def addHook( self, hook):

        uAs = self.p.v.getUnknownAttributes()
        if uAs.has_key( 'mm_hooks' ):
            hooks = uAs[ 'mm_hooks' ]
        else:
            hooks = {}
            uAs[ 'mm_hooks' ] = hooks
        hc = str( hook.__class__ )
        if not hc in hooks:
            hooks[ hc ] = hook.getName()

        return self.super__addHook( hook )
        
    def removeHook( self, hook):
        

        uAs = self.p.v.getUnknownAttributes()
        hooks = uAs[ 'mm_hooks' ]

        del hooks[ str( hook.__class__ )  ]
        return self.super__removeHook( hook )
        
    def setCloud( self, cloud ):
        
        if cloud:
            self.__setUA( 'mm_cloud', 1 )
        else:
            self.__setUA( 'mm_cloud', 0 )
        return self.super__setCloud( cloud )
    
    
    def __setUA( self, name, value ):
        uAs = self.p.v.getUnknownAttributes()
        uAs[ name ] = value      
        
                
    def basicCopy( self ):

        t = self.p.v.t
        t2 = leoNodes.tnode( t.bodyString, t.headString )
        v2 = leoNodes.vnode( self.p.c, t2 )
        p2 = leoNodes.position( v2, [] )
        return leoMindMapNode2( p2, self.t, self.nlistener, self.mm )    
        
    def shallowCopy( self ):

        return self.super__shallowCopy()
                        
        
    def getText( self ):
        
        return self.p.headString()
        
    def childrenFolded( self ):
        
        fd = self.super__childrenFolded()
        return fd
        
    def childrenUnfolded( self ):
        
        return self.super__childrenUnfolded()
        
    def childList( self ):
        cl = []
        cf = self.childrenFolded()
        for z in cf:
            cl.append( z )
        cu = self.childrenUnfolded()
        for z in cu:
            cl.append( z )
        return cl
        
    def setParent( self, arg ):

        return self.super__setParent( arg )
        
    def setLeft( self, left ):
        self.__setUA( "mm_left", left )
        return self.super__setLeft( left )
        

    
    #@    @+others
    #@+node:zorcanda!.20051108103717.62:inClonedTree
    def inClonedTree( self ):
        
        for z in self.p.self_and_parents_iter( copy= 1):
            if z.isCloned():
                return 1
                
        return 0
    #@nonl
    #@-node:zorcanda!.20051108103717.62:inClonedTree
    #@+node:zorcanda!.20051108103717.63:icons
    def removeLastIcon( self ):
        
        mc = self.t.getController().getModeController()
        icons = self.oc.icons
        if icons:
            icon = icons.lastElement()
            if icon == leoMindMapNode2.clone_mi:
                pass
            else:
                #icons.remove( icon )
                icons.removeElementAt( icons.size() -1 )
        for z in self.oc.nodes:
            mc.nodeChanged( z )
        self.syncIcons()
    
    
    
    def getIcons( self ):
        #rv = self.super__getIcons()
        #print rv.__class__ 
        rv = self.oc.icons
        if self.p.isCloned() and leoMindMapNode2.clone_mi not in rv:
            rv.add( 0, leoMindMapNode2.clone_mi)            
        if not self.p.isCloned() and leoMindMapNode2.clone_mi in rv:
            rv.remove( leoMindMapNode2.clone_mi )
        return rv
        
    def addIcon( self, icon ):
    
        mc = self.t.getController().getModeController()
        if self.startup:
            #self.super__addIcon( icon )
            self.oc.icons.add( icon )
        else:
            self.oc.icons.add( icon )
            for z in self.oc.nodes:
                #z.super__addIcon( icon )
                #z._icons.add( icon )
                viewer = z.getViewer()
                if viewer:
                    #viewer.repaint()
                    mc.nodeChanged( z )
        self.syncIcons()
    
            
    def syncIcons( self ):
        icons = self.getIcons()
        uAs = self.p.v.getUnknownAttributes()
        mmicons = []
        for z in icons:
            if z.getName() != "clone":
                mmicons.append( z.getName() )
        uAs[ 'mm_icons' ] = mmicons
    #@nonl
    #@-node:zorcanda!.20051108103717.63:icons
    #@+node:zorcanda!.20051108103717.64:copyForClones
    def copyForClones( self, node ):
        
        p = node.p
        first = None
        parents_nodes = {}
        for z in p.self_and_subtree_iter( copy = 1 ):
            
            x = leoMindMapNode2( z, self.t, self.nlistener, self.mm )
            #if z.isCloned():
            #    cid = java.lang.System.currentTimeMillis()
            #    z.cloneid = cid
            #    for nz in x.oc.nodes:
            #        if nz.p.getParent().v and x.p.getParent().v:
            #            if nz.p.getParent().v.t == x.p.getParent().v.t:
            #                nz.cloneid = cid
            parents_nodes[ z ] = x
            parent = z.getParent()
            if not first:
                first = x
                continue                 
    
            #print parent
            pnode = parents_nodes[ parent ]
            x.ignore = 1
            #print "INSERTING %s %s" % ( x, pnode )
            #self.mm.insertNodeInto( x, pnode )
            pnode.insert( x, -1 )
            x.ignore = 0
            
        return first
        
    #@nonl
    #@-node:zorcanda!.20051108103717.64:copyForClones
    #@+node:zorcanda!.20051108103717.65:setters
    #@+others
    #@+node:zorcanda!.20051108103717.66:setUserObject
    def setUserObject( self, o ):
        
        mc = self.t.getController().getModeController()
        self.p.c.beginUpdate()
        self.p.v.t.headString = o
        for z in self.oc.nodes:
            z.super__setUserObject( o )
            viewer = z.getViewer()
            if viewer:
                mc.nodeChanged( z )
                #viewer.setText( str( o ) )
        self.p.c.endUpdate()
            
    #@nonl
    #@-node:zorcanda!.20051108103717.66:setUserObject
    #@+node:zorcanda!.20051108103717.67:setBackgroundColor
    def setBackgroundColor( self, color ):
        
        if self.startup:
            return self.super__setBackgroundColor( color )
        mc = self.t.getController().getModeController()
        if color:
            self.__setUA( 'mm_bgcolor', color.getRGB() )
        for z in self.oc.nodes:
            if z == self: continue
            if z.v != self.v:
                z.__setUA( 'mm_bgcolor', color )
            viewer = z.getViewer()
            if viewer:
                z.super__setBackgroundColor( color )
                mc.nodeChanged( z )
                
        self.super__setBackgroundColor( color )
    #@-node:zorcanda!.20051108103717.67:setBackgroundColor
    #@+node:zorcanda!.20051108103717.68:setColor
    def setColor( self, color ):
        
        if self.startup:
            return self.super__setColor( color )
        
        mc = self.t.getController().getModeController()
        self.__setUA( 'mm_color', color.getRGB() )
        for z in self.oc.nodes:
            if z == self: continue
            if z.v != self.v:
                z.__setUA( 'mm_color', color )
            viewer = z.getViewer()
            if viewer:
                z.super__setColor( color )
                mc.nodeChanged( z )
                
        self.super__setColor( color )
    #@nonl
    #@-node:zorcanda!.20051108103717.68:setColor
    #@+node:zorcanda!.20051108103717.69:setStyle
    def setStyle( self, style ):
        
        mc = self.t.getController().getModeController()
        self.__setUA( 'mm_style', style )
        for z in self.oc.nodes:
            if z == self: continue
            if z.v != self.v:
                z.__setUA( 'mm_style', style )
            viewer = z.getViewer()
            if viewer:
                z.super__setStyle( style )
                mc.nodeChanged( z )
                
        return self.super__setStyle( style )
    #@nonl
    #@-node:zorcanda!.20051108103717.69:setStyle
    #@+node:zorcanda!.20051108103717.70:setBold
    def setBold( self, bld ):
        
        if self.startup:
            return self.super__setBold( bld )
        
        mc = self.t.getController().getModeController() 
        self.__setUA( 'mm_bold' , bld )
        for z in self.oc.nodes:
            if z == self: continue
            if z.v != self.v:
                z.__setUA( 'mm_bold', bld )
            viewer = z.getViewer()
            if viewer:
                z.super__setBold( bld )
                mc.nodeChanged( z )
        
        
        return self.super__setBold( bld )
    #@-node:zorcanda!.20051108103717.70:setBold
    #@+node:zorcanda!.20051108103717.71:setItalic
    def setItalic( self, ital ):
        
        if self.startup:
            return self.super__setItalic( ital )
         
        mc = self.t.getController().getModeController()
        self.__setUA( 'mm_italic', ital )
        for z in self.oc.nodes:
            if z == self: continue
            if z.v != self.v:
                z.__setUA( 'mm_italic', ital )
            viewer = z.getViewer()
            if viewer:
                z.super__setItalic( ital )
                mc.nodeChanged( z )
        
        
        return self.super__setItalic( ital )
    #@-node:zorcanda!.20051108103717.71:setItalic
    #@+node:zorcanda!.20051108103717.72:setUnderlined
    def setUnderlined( self, under ):
        
        if self.startup:
            return self.super__setUnderlined( under )
            
        mc = self.t.getController().getModeController()
        self.__setUA( 'mm_underline', under )
        for z in self.oc.nodes:
            if z == self: continue
            if z.v != self.v:
                z.__setUA( 'mm_underline', under )
            viewer = z.getViewer()
            if viewer:
                z.super__setUnderlined( under )
                mc.nodeChanged( z )
        
        
        return self.super__setUnderlined( under )
    
    #@-node:zorcanda!.20051108103717.72:setUnderlined
    #@+node:zorcanda!.20051108103717.73:setFontSize
    def setFontSize( self, size ):
        
        if self.startup:
            return self.super__setFontSize( size )
            
        mc = self.t.getController().getModeController()   
        self.__setUA( 'mm_fontsize', size )
        for z in self.oc.nodes:
            if z == self: continue
            if z.v != self.v:
                z.__setUA( 'mm_fontsize', size )
            viewer = z.getViewer()
            if viewer:
                z.super__setFontSize( size )
                mc.nodeChanged( z )    
            
        return self.super__setFontSize( size )
    
    #@-node:zorcanda!.20051108103717.73:setFontSize
    #@+node:zorcanda!.20051108103717.74:setFontFamilyName
    def setFontFamilyName( self, name ):
    
        if self.startup:
            return self.super__setFontFamilyName( name )
            
        mc = self.t.getController().getModeController()
        self.__setUA( 'mm_ffname', name )
        for z in self.oc.nodes:
            if z == self: continue
            if z.v != self.v:
                z.__setUA( 'mm_ffname', name )
            viewer = z.getViewer()
            if viewer:
                z.super__setFontFamilyName( name )
                mc.nodeChanged( z )     
        
        return self.super__setFontFamilyName( name )
    
    
    
    #@-node:zorcanda!.20051108103717.74:setFontFamilyName
    #@+node:zorcanda!.20051108103717.75:setAdditionalInfo
    def setAdditionalInfo( self, info ):
        
        mc = self.t.getController().getModeController()    
        self.__setUA( 'mm_uainfo', info )
        for z in self.oc.nodes:
            if z == self: continue
            if z.v != self.v:
                z.__setUA( 'mm_uainfo', info )
            viewer = z.getViewer()
            if viewer:
                z.super__setAdditionalInfo( info )
                mc.nodeChanged( z )     
        
        return self.super__setAdditionalInfo( info )
    #@nonl
    #@-node:zorcanda!.20051108103717.75:setAdditionalInfo
    #@+node:zorcanda!.20051108103717.76:setText
    def setText( self, text ):
    
        #print "SETTING TO %s" % text
        self.p.setHeadStringOrHeadline( text )
        #for z in self.p.v._mm_nodes:
        #    print z.getViewer()
        #    z.getViewer().repaint()
    #@nonl
    #@-node:zorcanda!.20051108103717.76:setText
    #@-others
    #@-node:zorcanda!.20051108103717.65:setters
    #@+node:zorcanda!.20051108103717.77:_dumpLinkData
    def _dumpLinkData( self, link, dic ):
            
        color = link.getColor()
        style = link.getStyle()
        stroke = link.getStroke()
        sincl = link.getStartInclination()
        eincl = link.getEndInclination()
        earrow = link.getEndArrow()
        sarrow = link.getStartArrow()
        dlabel = link.getDestinationLabel()
        uid = link.getUniqueID()
        dic[ 'color' ] = color.getRGB()
        dic[ 'style' ] = style
        dic[ 'stroke' ] = stroke
        dic[ 'sarrow' ] = sarrow
        dic[ 'earrow' ] = earrow
        dic[ 'dlabel' ] = dlabel
        dic [ 'uid' ] = uid
        if sincl:
            dic[ 'sincl' ] = ( sincl.getX(), sincl.getY() )
        else:
            dic[ 'sincl' ] = None
        if eincl:
            dic[ 'eincl' ] = ( eincl.getX(), sincl.getY() )
        else:
            dic[ 'eincl' ] = None
    #@-node:zorcanda!.20051108103717.77:_dumpLinkData
    #@+node:zorcanda!.20051108103717.78:DropTargetListener interface
    #dragEnter(DropTargetDragEvent dtde)  
    #dragExit(DropTargetEvent dte) 
    #dragOver(DropTargetDragEvent dtde) 
    #drop(DropTargetDropEvent dtde) 
    #dropActionChanged(DropTargetDragEvent dtde)
    
    def dragEnter( self, dtde ):
        pass
        
    def dragExit( self, dte ):
        pass
        
    def dragOver( self, dte ):
        pass
        
    def drop( self, dtde ):
        
        dtc = dtde.getDropTargetContext()
        dt = dtc.getDropTarget()
        c = dt.getComponent()
    
        
    def dropActionChanged( self, event ):
        pass 
    #@nonl
    #@-node:zorcanda!.20051108103717.78:DropTargetListener interface
    #@+node:zorcanda!.20051108103717.79:viewer
    def setViewer( self, viewer ):
        
        if viewer:
            viewer.addMouseListener( self.nlistener )
            #dt = dnd.DropTarget( viewer, self )
            #dt.setActive( 1 )
        return self.super__setViewer( viewer )
    #@nonl
    #@-node:zorcanda!.20051108103717.79:viewer
    #@+node:zorcanda!.20051108103717.80:isRoot
    #@+at
    # def isRoot( self ):
    #     #print "I AM ROOT? %s" % self.super__isRoot()
    #     if self.super__isRoot():
    #         print "I AM THE ROOT!"
    #     return 0
    #@-at
    #@nonl
    #@-node:zorcanda!.20051108103717.80:isRoot
    #@+node:zorcanda!.20051108103717.81:folded
    def isFolded( self ):
    
        #return self.p.numberOfChildren() and not self.p.isExpanded()
        return self.super__isFolded()
            
            
    def setFolded( self, fold ):
        
        if self.expand_to_outline:
            mc = self.t.getController().getModeController()
            prt = self.p.c.frame.tree.posTM.getPathToRoot( self.p.copy() )
            if fold:
                self.p.c.frame.tree.jtree.collapsePath( prt )
            else:
                self.p.c.frame.tree.jtree.expandPath( prt )
            #for z in self.oc.nodes:
            #    print "AM I me? %s" %( z == self )
            #    #if z != self and z.v == self.v:
            #    #    print "FOLDING!!!! %s" % z
            #    ##    z.super__setFolded( fold )
            #    #    mc.nodeStructureChanged( z )
                    
            #print "FOLDING %s %s" % ( fold, self.p.headString() )  
        return self.super__setFolded( fold )
    #@-node:zorcanda!.20051108103717.81:folded
    #@+node:zorcanda!.20051108103717.82:EdgeDecorator
    class EdgeDecorator( MindMapEdgeModel ):
        
        def __init__( self, node, frame ):
            self.ignore = 1
            MindMapEdgeModel.__init__( self, node, frame )
            #self.ignore = 0
            self.node = node       
            uAs = node.p.v.getUnknownAttributes()
            if uAs.has_key( 'mm_edge' ):
                edge = uAs[ 'mm_edge' ]
                #print edge
                color = edge[ 'color' ]
                self.setColor( java.awt.Color( int( color ) ) )
                self.setStyle( edge[ 'style' ] )
                #print self.getStyle()
                #print "WIDTH %s" % edge[ 'width' ]
                self.setWidth( int(edge[ 'width' ]) )
            self.ignore = 0
            
        def setWidth( self, width ):
            #print "Setting width"
            rv = self.super__setWidth( width )
            self.__update()
            return rv
            
        def getWidth( self ):
            #java.lang.System.err.println( "GETTING WIDTH FOR %s
            #if not self.getTarget().getParent().isRoot():
            #    java.lang.System.err.println( "GETTING WIDTH FOR %s  SOURCE of %s "  % (self.node.p, self.getTarget().getParent().p ) )
            return self.super__getWidth()
        
        #def getStyle( self ):
        #    return self.super__getStyle()
            
        def setStyle( self, style ):
                   
            rv = self.super__setStyle( style )
            self.__update()
            return rv
        
        #def getColor( self ):
        #    return self.super__getColor()
            
        def setColor( self, color ):
            rv = self.super__setColor( color )
            self.__update()
            return rv    
                    
        #def getTarget( self ):
        #    return self.super__getTarget()
            
        def setTarget( self, target ):
            #print "I Am %s Target is %s" %( self.node.p, target )
            return self.super__setTarget( target )
        
        #def getRealWidth( self ):
        #    return self.super__getRealWidth()
            
        #def save():
        #    return self.super__save()
            
        def __update( self ):
            
            if self.ignore: return
            uAs = self.node.p.v.getUnknownAttributes()
            if uAs.has_key( 'mm_edge' ):
                edge = uAs[ 'mm_edge' ]
            else:
                edge = {}
                uAs[ 'mm_edge' ] = edge
                
            
            edge[ 'color' ] = self.getColor().getRGB()
            #print "WIDTH %s" % self.getWidth()
            edge[ 'width' ] = self.getWidth()
            edge[ 'style' ] = self.getStyle()
            
                
            
    #@nonl
    #@-node:zorcanda!.20051108103717.82:EdgeDecorator
    #@+node:zorcanda!.20051108103717.83:setExpansionToOutline
    def setExpansionToOutline( self, bool ):
        self._expansion_to_outline = bool
        
    def getExpansionToOutline( self ):
        return self._expansion_to_outline
        
    #@-node:zorcanda!.20051108103717.83:setExpansionToOutline
    #@-others
#@-node:zorcanda!.20051108103717.60:leoMindMapNode2
#@+node:zorcanda!.20051108103717.84:Actions
#@+others
#@+node:zorcanda!.20051108103717.85:leoPasteAction
class leoPasteAction( PasteAction ):
    
    def __init__( self , ca, mm ):
        PasteAction.__init__( self, ca )
        self.mm = mm
    
    
    def actionPerformed( self, event ):

        target = self.mm.fn.getController().getView().getSelected().getModel()
        self.truePaste( target )
          
    def paste( self, *args ):
        

        
        parent = args[ 1 ]
        last = self.last[ 0 ]
        last_links = self.last[ 1 ]
        last_hooks = self.last[ 2 ]
        last_parents = self.last[ 3 ]
        c = last[ 0 ].p.c
        c.beginUpdate()
        pi = java.awt.MouseInfo.getPointerInfo()
        loc = pi.getLocation()
        viewer = parent.getViewer()           
        swing.SwingUtilities.convertPointFromScreen( loc, viewer ) 

        for z in last:       
            
            left = viewer.dropPosition( loc.x )
            z.setLeft( left )
            self.mm.setLastLeft( left )
            
            if parent.__class__ != leoMindMapNode2: #parent.isRoot():
                root = c.rootPosition().copy()

                if root == z.p:
                    #self.mm.insertNodeInto( z, parent, 0 )
                    for x in root.self_and_siblings_iter( copy = 1 ):
                        pass
                    if x != root:
                        root.moveAfter( x )
                    else:
                        self.mm.insertNodeInto( z, parent, 0)
                        
                else:
                    
                    #p = z.p.moveAfter( root )
                    for rps in root.self_and_siblings_iter( copy = 1 ):
                        pass
                    if rps == z.p:
                        rps = z.p.back().copy()
                    p = z.p.moveAfter( rps )
                    z.p = p.copy()
            
            else:
                
                if c.checkMoveWithParentWithWarning(z.p, parent.p,True):
 
                    p = z.p.moveToLastChildOf( parent.p )
                    z.p = p.copy()
                else:
                    
            
                    continue
    
            hooks = last_hooks[ z ]
            for x in hooks:
                x.setNode( z )
                clazz = x.getClass()
                nh = clazz.newInstance()
                nh.setController( z.t.getController().getModeController() )
                nh.setName( x.getName() )
                z.addHook( nh )
                z.invokeHook( nh )
            
        c.endUpdate()
        for z in last_links:
            links = last_links[ z ]
            for x in links:
                self.mm.rdec.registerLink( x )
        self.last = None
        
        
    def setLast( self, last ):
        self.last = last
        
    #@    @+others
    #@+node:zorcanda!.20051108103717.86:truePaste
    def truePaste( self, target ):
        
        last = self.last[ 0 ]
        c = self.mm.c
        cp = c.currentPosition()
        root = 0
        if target.__class__ != leoMindMapNode2: #target.isRoot():
            p = c.rootPosition()
            root = 1
        else:
            p = target.p
        c.beginUpdate()
        for z in last:
            zp = z.p
            if len( self.last ) > 1:
                c.setCurrentPosition( zp )
                s = c.fileCommands.putLeoOutline()
                np = c.fileCommands.getLeoOutline(s,1)            
                x = leoMindMapNode2( np, self.mm.fn, self.mm.nlistener, self.mm )
                self.recursiveAdd( np , x )
                if root:
                    np = np.moveAfter( p )
                else:
                    np = np.moveToLastChildOf( p )
                x.p = np.copy()
            else:
                bc = z.basicCopy()
                bp = bc.p
                p = bp.moveToLastChildOf( p )
                bc.p = p.copy()
            
        
        c.setCurrentPosition( cp )
        c.endUpdate()
    #@-node:zorcanda!.20051108103717.86:truePaste
    #@+node:zorcanda!.20051108103717.87:recursiveAdd
    def recursiveAdd( self, np, lmmn2 ):
        
        for z in np.children_iter( copy = 1 ):
                
            lmmn2c = leoMindMapNode2( z, self.mm.fn, self.mm.nlistener, self.mm )
            lmmn2.insert( lmmn2c, -1 )
            self.recursiveAdd( z, lmmn2c )
    #@nonl
    #@-node:zorcanda!.20051108103717.87:recursiveAdd
    #@-others
    

#@-node:zorcanda!.20051108103717.85:leoPasteAction
#@+node:zorcanda!.20051108103717.88:leoNewChildAction
class leoNewChildAction( NewChildAction ):
    
    def __init__( self, mc, mm ):
        NewChildAction.__init__( self, mc )
        self.mc = mc
        self.mm = mm
        
        
    def addNew( self, target, mode, e ):
        
    
        parent = target
        
        if parent.__class__ != leoMindMapNode2: #parent.isRoot():
            c = self.mm.c
            p = c.rootPosition()
        else:
            c = parent.p.c
            p = parent.p
        
        c.beginUpdate()
    
        if mode == self.mc.NEW_CHILD:
            if p.isRoot() and parent.__class__ != leoMindMapNode2:
                nw = p.insertAfter()
            else:
                nw = p.insertAsLastChild()
        elif mode == self.mc.NEW_SIBLING_BEFORE:
            nw = p.insertAfter()
            p.moveAfter( nw )       
        else:
            nw = p.insertAfter()
            
                  
        c.endUpdate() 
#@nonl
#@-node:zorcanda!.20051108103717.88:leoNewChildAction
#@+node:zorcanda!.20051108103717.89:leoDeleteChildAction
class leoDeleteChildAction( DeleteChildAction ):
    
    def __init__( self, mc, mm ):
        DeleteChildAction.__init__( self, mc )
        self.mc = mc
        self.mm = mm
        
    def deleteNode( self, node ):

        rv = self.super__deleteNode( node )
        p = node.p
        c = p.c
        c.beginUpdate()
        p.doDelete( p.getParent() )      
        c.endUpdate()
        return rv
        
    def actionPerformed( self, event ):

        target = self.mm.fn.getController().getView().getSelected().getModel()
        p = target.p
        c = p.c
        c.beginUpdate()
        p.doDelete( p.getParent() )
        c.endUpdate()
        
#@nonl
#@-node:zorcanda!.20051108103717.89:leoDeleteChildAction
#@+node:zorcanda!.20051108103717.90:leoCopySingleAction
class leoCopySingleAction( CopySingleAction ):
    
    def __init__( self, mc, mm ):
        CopySingleAction.__init__( self, mc )
        self.mc = mc
        self.mm = mm
        
    
    def actionPerformed( self, event ):
        
        target = self.mm.fn.getController().getView().getSelected().getModel()
        self.mm.paste.setLast( ( ( target,), ) )

#@-node:zorcanda!.20051108103717.90:leoCopySingleAction
#@+node:zorcanda!.20051108103717.91:leoDropListener
class leoDropListener( NodeDropListener ):
    
    def __init__( self, controller, c ):
        print self
        print controller
        NodeDropListener.__init__( self, controller )
        self.con = controller
        self.c = c
        
    def drop( self, event ):
        
        node = event.getDropTargetContext().getComponent().getModel()
        selected = self.con.getView().getSelected().getModel()
        reject = 0

        if node.__class__ != leoMindMapNode2:
            pass
        else:
            target_p = node.p
            drop_p = selected.p
            if target_p.v != drop_p.v and target_p.c.checkMoveWithParentWithWarning( drop_p.copy(), target_p.copy(), 1 ):
                pass
            else:
                reject = 1
        
        if not reject:
            return self.super__drop( event )
        else:
            event.rejectDrop()
#@nonl
#@-node:zorcanda!.20051108103717.91:leoDropListener
#@+node:zorcanda!.20051108103717.92:leoNodeUpAction
class leoNodeUpAction( NodeUpAction ):
    
    def __init__( self, mc, mm ):
        NodeUpAction.__init__( self, mc )
        self.mc = mc
        self.mm = mm
        
    
    def moveNodes( self, selected, selecteds, directions ):
        
        node = selected

        p = selected.p
        back = p.getBack()
        c = p.c
        if p.level() != 0:
            if back:
                c.beginUpdate()
                back.moveAfter( p.copy() )
                c.endUpdate()
        else:
            #if p.isRoot():
            #    pass
            #else:
            #children = self.mm._real_root.getChildren()
            children = self.mm._root.getChildren()
            left = []
            right = []
            node = None
            for z in children:
                if p.v == z.v:
                    node = z
                if z.isOneLeftSideOfRoot():
                    left.append( z )
                else:
                    right.append( z )
                    
            isleft = node.isOneLeftSideOfRoot()
            if isleft:
                index = left.index( node )
                if index == 0:
                    above = None
                else:
                    above = left[ index - 1 ]
            else:
                index = right.index( node )
                if index == 0:
                    above = None
                else:
                    above = right[ index - 1 ]
            if above:
                c.beginUpdate()
                #back.moveAfter( p.copy() )
                if isleft:
                    self.mm.setLastLeft( 1 )
                else:
                    self.mm.setLastLeft( 0 )
                above.p.moveAfter( p.copy() )
                c.endUpdate()
        
#@-node:zorcanda!.20051108103717.92:leoNodeUpAction
#@+node:zorcanda!.20051108103717.93:leoDownAction
class leoNodeDownAction( NodeDownAction ):
    
    def __init__( self, mc, mm ):
        NodeDownAction.__init__( self, mc )
        self.mc = mc
        self.mm = mm
        
    
    def actionPerformed( self, event ):
        
        node = self.mc.getSelected()
        p = node.p
        next = p.getNext()
        c = p.c
        if next:
            if p.level() != 1:
                c.beginUpdate()
                p.copy().moveAfter( next )
                c.endUpdate()
            else:
                children = self.mm._root.getChildren()
                left = []
                right = []
                node = None
                for z in children:
                    if p.v == z.v:
                        node = z
                    if z.isOneLeftSideOfRoot():
                        left.append( z )
                    else:
                        right.append( z )
                    
                isleft = node.isOneLeftSideOfRoot()
                if isleft:
                    index = left.index( node )
                    if index == 0:
                        above = None
                    else:
                        above = left[ index - 1 ]
                else:
                    index = right.index( node )
                    if index == 0:
                        above = None
                    else:
                        above = right[ index - 1 ]
                    
                if above:
                    c.beginUpdate()
                    #back.moveAfter( p.copy() )
                    if isleft:
                        self.mm.setLastLeft( 1 )
                    else:
                        self.mm.setLastLeft( 0 )
                    p.copy().moveAfter( above.p.copy() )
                    #above.p.moveAfter( p.copy() )
                    c.endUpdate()

#@-node:zorcanda!.20051108103717.93:leoDownAction
#@+node:zorcanda!.20051108103717.94:leoCloneAction
class leoCloneAction( swing.AbstractAction , swing.event.PopupMenuListener ):
    
    def __init__( self, mc, mm ):
        
        path = g.os_path_join( g.app.loadDir,"..","Icons/nodebar", "clone.gif")
        ii = swing.ImageIcon( path )
        swing.AbstractAction.__init__( self, "Clone Node", ii )
        self.mc = mc
        self.mm = mm
        self.jmi = swing.JMenuItem( self )
        
    def actionPerformed( self , event ):
        
        node = self.mc.getSelected()
        if node.__class__ != leoMindMapNode2: return
        p = node.p
        c = p.c
        c.beginUpdate()
        p.clone( p )
        c.endUpdate()
    
    def popupMenuCanceled( self, e):
        pass
    
    def popupMenuWillBecomeInvisible( self, e):
        pass
        
    def popupMenuWillBecomeVisible( self, e ):
        
        pup = e.getSource()
        cmps = pup.getComponents()
        paste = None
        for z in cmps:
            if z.__class__ == swing.JMenuItem and z.getText() == "Paste":
                paste = z
            elif z.__class__ == swing.JMenu and z.getText() == "Insert":
                components = z.getMenuComponents()
                if components:
                    for x in components[ 1: ]:
                        z.remove( x )
            if z == self.jmi: 
                return
        
        if paste:
            i = pup.getComponentIndex( paste )
            pup.insert( self.jmi, i + 1 )
#@nonl
#@-node:zorcanda!.20051108103717.94:leoCloneAction
#@+node:zorcanda!.20051108103717.95:leoRemoveAllIconsAction
class leoRemoveAllIconsAction( RemoveAllIconsAction ):
    
    def __init__( self, mc, ua,  mm ):
        RemoveAllIconsAction.__init__( self, mc, ua )
        self.mc = mc
        self.mm = mm
    
    
    def act( self, action ):
        
        target = self.mm.fn.getController().getView().getSelected().getModel()
        if not target.isRoot() and target.p.isCloned():
            while len( target.getIcons() ) != 1:
                target.removeLastIcon()           
        else:
            while target.getIcons():
                target.removeLastIcon()
    
    #def actionPerformed( self, event ):
    #    
    #    target = self.mm.fn.getController().getView().getSelected().getModel()
    #    #bc = target.basicCopy()
    #    self.mm.paste.setLast( ( ( target,), ) )
#@-node:zorcanda!.20051108103717.95:leoRemoveAllIconsAction
#@-others
#@-node:zorcanda!.20051108103717.84:Actions
#@+node:zorcanda!.20051108103717.96:LinkDecorator


class LinkDecorator( MindMapArrowLinkModel ):
    
    
    def __init__( self, link ):
        MindMapArrowLinkModel.__init__( self, link.getSource(), link.getTarget(), link.getFrame() )
        self.link = link
        
    
    def getColor( self ):
        return self.link.getColor()
        
    def setColor( self, color ):
        rv = self.link.setColor( color )
        self._update()
        return rv
        
    def getStyle( self ):
        return self.link.getStyle()
        
    def setStyle( self, style ):
        rv = self.link.setStyle( style )
        self._update()
        return rv
        
    def getStroke( self ):
        return self.link.getStroke()

    
    def setStroke( self, stroke ):
        rv = self.link.setStroke( stroke )
        self._update()
        return rv
    
    def toString( self ):
        return self.link.toString()
        
    def getTarget( self ):
        return self.link.getTarget()
        
    def setTarget( self, target ):
        return self.link.setTarget( target )
        
    def getSource( self ):
        return self.link.getSource()
        
    def setSource( self, source ):
        return self.link.setSource( source )
    
    def getUniqueID( self ):
        return self.link.getUniqueID()
    
    def setUniqueID( self, id ):
        return self.link.setUniqueID( id )
    
    def getDestinationLabel( self ):
        return self.link.getDestinationLabel()
        
    
        
    def getReferenceText( self ):
        return self.link.getReferenceText()
        
    def setReferenceText( self, text ):
        return self.link.setReferenceText( text )
        
    def setStartInclination( self, point ):
        rv = self.link.setStartInclination( point )
        self._update()
        return rv
    
    def getStartInclination( self ):
        return self.link.getStartInclination()
        
    def setEndInclination( self, point ):
        rv = self.link.setEndInclination( point )
        self._update()
        return rv
        
    def getEndInclination( self ):
        return self.link.getEndInclination()
        
    def setStartArrow( self, arrow ):
        rv = self.link.setStartArrow( arrow )
        self._update()
        return rv
        
    def getStartArrow( self ):
        return self.link.getStartArrow()
        
    def setEndArrow( self, arrow ):
        rv = self.link.setEndArrow( arrow )
        self._update()
        return rv
    
    def getEndArrow( self ):
        return self.link.getEndArrow()
        
    def setDestinationLabel( self, label ):
        rv = self.link.setDestinationLabel( label )
        self._update()
        return rv
        
    def _update( self ):
        source = self.link.getSource()
        source._updateLink( self.getUniqueID(), self.link )
    
    def clone( self ):
        return self.link.clone()
        
    def hashCode( self ):
        return self.link.hashCode()


#@+at
# import freemind.modes.MindMapLine;
# import freemind.modes.MindMapNode;
# import java.awt.Color;
# import java.awt.Stroke;
# 
# public interface MindMapLink extends MindMapLine {
# 
#     //     public Color getColor();
#     //     public String getStyle();
#     //     public Stroke getStroke();
#     //     public int getWidth();
#     //     public String toString();
# 
#     String getDestinationLabel();
#     String getReferenceText();
# 
#     MindMapNode getTarget();
#     MindMapNode getSource();
#     /** The id is automatically set on creation. Is saved and restored. */
#     String getUniqueID();
# //     public Object clone();
# 
# }
#@-at
#@nonl
#@-node:zorcanda!.20051108103717.96:LinkDecorator
#@+node:zorcanda!.20051108103717.97:ObservingContainer
class ObservingContainer( java.util.Observer ):
    
    
    containers = {}
    random = java.util.Random()
    
    def __init__( self, v , mm, t, nlistener):
        self.v = v
        self.mm = mm
        self.t = t
        self.nlistener = nlistener
        self.v.addObserver( self )
        self.nodes = []
        ObservingContainer.containers[ v.t ] = self
        self.vees = []
        self.vees.append( v )
        self.icons = java.util.Vector()
        
        
        
    def getFirstNode( self, v ):
        return ObservingContainer.containers[ v.t ].nodes[ 0 ]
    
    
    def addTo( self, node ):
        
        v = node.v
        if v not in self.vees:
            self.vees.append( v )
            v.addObserver( self )
        self.nodes.append( node )
        
    #@    @+others
    #@+node:zorcanda!.20051108103717.98:Observer interface
    def update( self, obj, arg ):
        
        #if self.mm.fn.getController().getView().isShowing():
        #    return
        
        
        #if not self.mm.attached: return
        if arg.__class__ == leoNodes.MoveAfter:
            self.moveAfter( arg )
        elif arg.__class__ == leoNodes.MoveChild:
            self.moveChild( arg )
        elif arg.__class__ == leoNodes.InsertAfter:
            self.insertAfter( arg )
        elif arg.__class__ == leoNodes.InsertChild:
            self.insertChild( arg )
        elif arg.__class__ == leoNodes.Clone:
            self.clone( arg )
        elif arg.__class__ == leoNodes.Delete:
            self.delete( arg )
      
        #self.updating = 0
        rv = self.mm.c.rootPosition().v
        
        
        if rv != self.mm._real_root:
            
            ua = self.mm._real_root.getUnknownAttributes()
            del ua[ "mm_root" ]
            self.mm._real_root = rv
            ua = self.mm._real_root.getUnknownAttributes()
            ua[ "mm_root" ] = self.mm.root_uas
        
    #@+others
    #@+node:zorcanda!.20051108103717.99:moveAfter
    def moveAfter( self, arg ):
        
        back = arg.back
        p = arg.p
        
        #parent = back.getParent()
        parent = p.getParent()
        if p.level() == 0:
            nwparent = self.mm.getRoot()
            #for z in self.nodes:
            #    if z.v == p.v:
            #         nid = java.lang.System.currentTimeMillis()
            #        cc = nwparent.getChildCount()
            #        self.mm.insertNodeInto( z, nwparent, cc )
            #        z.p = p.copy()
            #        z.cloneid = nid
            #        self.giveCloneIDtoChildren( z, nid )
            #        self.rebuildPositions( z, p.copy() )
            #        return
        else:
            nwparent = self.getFirstNode( parent.v )
        
        #if nwparent.isRoot() and p.level() == 0:
        #    last_cloned = self.mm.fn.getController().getView().getSelected().getModel()
        #    self.mm.removeNodeFromParent( last_cloned )
        #else:
        if 1:
            for z in self.nodes:
                if z.getParent() and not z.p.isCloned():
                    self.mm.removeNodeFromParent( z )
                elif z.getParent() and z.p.isCloned():
                    self.processCloneRemove( z, p )
        
        self.insertMass( nwparent, self.nodes, p, p.childIndex() )
        
    #@-node:zorcanda!.20051108103717.99:moveAfter
    #@+node:zorcanda!.20051108103717.100:moveChild
    def moveChild( self, arg ):
        
        parent = arg.parent
        child = arg.child
        
        #nwparent = self.getFirstNode( parent.v )
        nwparent = None
        nodes = ObservingContainer.containers[ parent.v.t ].nodes
        for z in nodes: #self.nodes:
            if z.v == parent.v:
                nwparent = z
                break
            else:
                z = None
        
        
        if nwparent == None and child.level() == 0:
        
            nwparent == self.mm._root
    
    
        for z in self.nodes:
            
            if z.getParent() and not z.p.isCloned():
                self.mm.removeNodeFromParent( z )
            elif z.getParent() and z.p.isCloned():
                self.processCloneRemove( z , child )
        
        
        #x = leoMindMapNode2( child, self.t, self.nlistener, self.mm )
        #x.oc.nodes.remove( x )
        #x = x.copyForClones( x )
        nwparent.p = parent.copy()
        nwparent.v = parent.v
        self.insertMass( nwparent, self.nodes, child , child.childIndex() )
    
    #@-node:zorcanda!.20051108103717.100:moveChild
    #@+node:zorcanda!.20051108103717.101:insertChild
    def insertChild( self,arg ):
        
        parent = arg.parent
        child = arg.child
        
        pnode = None
        #pnode = self.getFirstNode( parent.v )
        for z in self.nodes:
            if z.v == parent.v:
                pnode = z
                break
            else:
                z = None
        
        pnode.p = parent.copy()
        pnode.v = parent.v
        
        x = leoMindMapNode2( child, self.t, self.nlistener, self.mm )
        x.oc.nodes.remove( x )
        x = x.copyForClones( x )
        rv = self.insertMass( pnode, x.oc.nodes, child, child.childIndex() )
    
        if len( rv ) == 1:
            try:        
                view = rv[ 0 ].getViewer()
                if not view.isShowing():
                    return
                mc = self.mm.fn.getController().getModeController()
                mc.select( rv[ 0 ] )
            
                ea = self.mm.getEditAction( mc )
                ea.actionPerformed( None )
                fld = rv[ 0 ].isFolded()
                ea.editLater( rv[ 0 ].getViewer(), None, None, 0 , fld ,0 )
            except java.lang.Exception, x:
                pass
    
    #@-node:zorcanda!.20051108103717.101:insertChild
    #@+node:zorcanda!.20051108103717.102:insertAfter
    def insertAfter( self, arg ):
        
        back = arg.back
        nw_p = arg.nw_p
        
        parent = back.getParent()
        if not parent:
            nwparent = self.mm.getRoot()
        else:
            nwparent = self.getFirstNode( parent.v )
        
        x = leoMindMapNode2( nw_p, self.t, self.nlistener, self.mm )
        x.oc.nodes.remove( x )
        x = x.copyForClones( x )
        rv = self.insertMass( nwparent, x.oc.nodes, nw_p, nw_p.childIndex() )
        if len( rv ) == 1:
            try:
                view = rv[ 0 ].getViewer()
                if not view.isShowing():
                    return
                mc = self.mm.fn.getController().getModeController()
                mc.select( rv[ 0 ] )
                ea = self.mm.getEditAction( mc )
                ea.actionPerformed( None )
                fld = rv[ 0 ].isFolded()
                ea.editLater( rv[ 0 ].getViewer(), None, None, 0 , fld ,0 )
            except java.lang.Exception, x:
                pass
    #@-node:zorcanda!.20051108103717.102:insertAfter
    #@+node:zorcanda!.20051108103717.103:delete
    def delete( self, arg ):
        
        
        deleted = arg.deleted
        isClone = arg.isClone
        if isClone:
            lc = self.mm.fn.getController().getView().getSelected().getModel()
            for z in self.nodes:
                if z.v == lc.v:
                    self.mm.removeNodeFromParent( z )
        
        else:
            for z in self.nodes:
                if z.getParent():
                    self.mm.removeNodeFromParent( z )
                    
        
        nodes = self.nodes[ : ]
        for z in nodes:
            if not z.getParent():
                self.nodes.remove( z )
        
        mc = self.mm.fn.getController().getModeController()
        for z in self.nodes:
            if z.getViewer():
                mc.nodeChanged( z )
                
    #@-node:zorcanda!.20051108103717.103:delete
    #@+node:zorcanda!.20051108103717.104:clone
    def clone( self, arg ):
        
        prototype = arg.prototype
        clone = arg.clone
        
        nodes = copy.copy( self.nodes )
        lc = self.mm.fn.getController().getView().getSelected().getModel()
        nwparent = lc.getParent()
        
        if nwparent == None or clone.level() == 0 or nwparent.v != clone.getParent().v:
            parent = clone.getParent()
            
            if hasattr( parent, 'v' ) and hasattr( parent.v, 't' ):
                nodes = ObservingContainer.containers[ parent.v.t ].nodes
                for z in nodes:
                    if z.p == parent:
                        nwparent = z
                        break
            else:
                nwparent = self.mm._root
                
        index = clone.childIndex()
    
        x = leoMindMapNode2( clone, self.t, self.nlistener, self.mm )
        if nwparent.__class__ != leoMindMapNode2:
            nwparent = self.mm._root
            x = leoMindMapNode2( clone, self.t, self.nlistener, self.mm )
            x = x.copyForClones( x )
            
            self.mm.insertNodeInto( x, nwparent, index )
            #self.giveCloneIDtoChildren( nwparent , nid )
        else:
            for z in nwparent.oc.nodes:
                if self.checkConnection( z ):
                
                    child = z.p.getNthChild( index )
                    
                    x = leoMindMapNode2( child, self.t, self.nlistener, self.mm )
                    x = x.copyForClones( x )
                    self.mm.insertNodeInto( x, z, index )
                    #self.giveCloneIDtoChildren( z, nid )
                    
    
        self.mm.reload_outline()
        mc = self.mm.fn.getController().getModeController()
        for z in self.nodes[ : ]:
            if not z.getParent():
                self.nodes.remove( z )
            else:
                mc.nodeChanged( z.getParent() )
                
        self.last_cloned = []
                
                
    
        
    
    #@-node:zorcanda!.20051108103717.104:clone
    #@+node:zorcanda!.20051108103717.105:insertMass
    def insertMass( self, target, child_nodes, p , spot = None ):
        
        rv = []
        mc = self.mm.fn.getController().getModeController()
        nodes = copy.copy( child_nodes )
        #nid = java.lang.System.currentTimeMillis()
        if target.__class__ != leoMindMapNode2:
    
            while nodes:
                child = nodes.pop()
                if not child.getParent(): break  
                child = None
            if not child:
                x = leoMindMapNode2( p, self.t, self.nlistener, self.mm )
                child = x.copyForClones( x )
            cc = target.getChildCount()
            if spot != None:
                cc = spot
            
    
            self.mm.insertNodeInto( child, target, cc )
            rv.append( child )
            #self.rebuildPositions( child, child.c.rootPosition() )
            self.checkValidity( child )
            rp = child.p.c.rootPosition()
    
            for z in rp.self_and_siblings_iter( copy = 1 ):
                
                if z == p:
                    
                    break
                z = None
            
    
            child.p = z.copy()
            self.rebuildPositions( child, z.copy() )
            #mc.nodeChanged( child )
            mc.nodeChanged( target )
    
            #for z in target.getChildren():
            #    mc.nodeChanged( z )
            #mc.moveNodeAction.moveNodeTo( child, child.getVGap() , child.getHGap(), child.getShiftY()  )
        
        else:
            tnodes = copy.copy( target.oc.nodes )
            for z in tnodes:
                if self.checkConnection( z ):
                    if nodes:
                        child = None
                        while nodes:
                            child = nodes.pop()
                            if not child.getParent() and child.v == p.v:
                                
                                break  
                            child = None
                        if not child:
                            
                            child = child_nodes[ 0 ].copyForClones( child_nodes[ 0 ] )
                            
                    else:
                        
                        child = child_nodes[ 0 ].copyForClones( child_nodes[ 0 ] )
                
                    cc = z.getChildCount()
                    #if cc != 0:
                    #    cc = cc - 1
                    #x = leoMindMapNode2( , self.t, self.nlistener, self.mm )
                    #x = x.copyForClones( x )
            
                    if z.getViewer():
                        
                        self.checkValidity( child )
                        if spot != None:
                            cc = spot
                        
                        if z.isRoot():
                            ll = self.mm.getLastLeft()
                            child.setLeft( ll )
                    
                        self.mm.insertNodeInto( child, z, cc )
                        self.rebuildPositions( z, z.p )
                        z.setFolded( 0 )
                        if z.isRoot():
                            ll = self.mm.getLastLeft()
                            child.setLeft( ll )              
                        mc.nodeStructureChanged( z )                    
                        rv.append( child )
                    else:
                        target.oc.nodes.remove( z )
                else:
                    target.oc.nodes.remove( z )
        nodes = child_nodes[ : ]
        for z in nodes:
            if not z.getParent():
                child_nodes.remove( z )
    
        #children = self.mm._root.getChildren().clone()
        #for z in children:
        #    self.mm.removeNodeFromParent( z )
        #for z in children:
        #    self.mm.insertNodeInto( z, self.mm._root, children.indexOf( z ) )  
        #mc.nodeChanged( self.mm._root ) 
        self.mm.last_cloned = []  
        return rv        
    #@nonl
    #@-node:zorcanda!.20051108103717.105:insertMass
    #@+node:zorcanda!.20051108103717.106:rebuildPositions
    def rebuildPositions( self, node, p ):
        
        children = node.getChildren()
        #for n in xrange( children.size() ):
        #    child = children.get( n )
        #    pos = p.getNthChild( n )
        #    print "Node c is %s Child is %s" % ( child.v.headString(), pos.headString() )
        #print "Node size %s Position size %s" % ( children.size(), p.numberOfChildren() )
        #print "Node name is %s, p is %s" % ( node.v.headString(), p.headString() )
        #print "NEXT %s   BACK %s " % ( p.back(), p.next() )
        #print "NEXT2 %s BACK2 %s " % ( p.v._back, p.v._next )
        #for n in xrange( p.numberOfChildren() ):
        for z in p.children_iter( copy = 1 ):
            #z = p.getNthChild( n ).copy()
            #print z.headString()
            ci = z.childIndex()
            #ci = n
            #ci = p. 
            #print "nth child is %s" % p.getNthChild( ci ).headString()
            node2 = children.get( ci )
            node2.p = z.copy()
            node2.v = z.v
            self.rebuildPositions( node2 , z.copy() )
    #@nonl
    #@-node:zorcanda!.20051108103717.106:rebuildPositions
    #@+node:zorcanda!.20051108103717.107:checkConnection
    def checkConnection( self, node ):
        
        
        while node:
            node = node.getParent()
            if node and node.__class__ != leoMindMapNode2: return 1
        
        
        return 0
        
        
    #@nonl
    #@-node:zorcanda!.20051108103717.107:checkConnection
    #@+node:zorcanda!.20051108103717.108:checkValidity
    def checkValidity( self, node ):
        
        for z in node.getChildren():
            if not z.p.isValid():
                print "INVALID NODE %s %s" % ( z, z.p.headString() )
            self.checkValidity( z )
    #@nonl
    #@-node:zorcanda!.20051108103717.108:checkValidity
    #@+node:zorcanda!.20051108103717.109:processCloneRemove
    def processCloneRemove( self, node, clone = None ):
        
        #visible = self.mm.fn.getController().getView().getSelected().getModel()
        #print visible
    #@+at
    #     if visible and visible.__class__ == leoMindMapNode2:
    #         print "IN THE IF!"
    #         if hasattr( self.mm , "last_cloned" ) and self.mm.last_cloned:
    #             lc = self.mm.last_cloned
    #             last_cloned = lc[ 0 ]
    #             id = last_cloned.cloneid
    #             p = lc[ 0 ].p.getParent()
    #             lcp = lc[ 0 ].getParent()
    #         else:
    #             last_cloned = 
    # self.mm.fn.getController().getView().getSelected().getModel()
    #             lc = [ last_cloned ,]
    #             id = last_cloned.cloneid
    #             p = last_cloned.p.getParent()
    #             lcp = last_cloned.getParent()
    #     else:
    #         print "IN THE ELSE"
    #         for z in self.nodes:
    #             if z.v == clone.v and z.getParent():
    #                 self.mm.removeNodeFromParent( z )
    #         return
    #@-at
    #@@c  
        mc = self.mm.fn.getController().getModeController()
        for z in self.nodes:
            parent = z.getParent()
            if z.v == clone.v and parent:
                self.mm.removeNodeFromParent( z )
            if parent:
                if parent.getChildren().size() == 0:
                    parent.setFolded( 0 )
                    mc.nodeChanged( parent )
                
        return
    
        
        if lcp and lcp.__class__ != leoMindMapNode2 and node in lc:
            self.mm.removeNodeFromParent( node )
            return
        elif lcp and lcp.__class__ != leoMindMapNode2:
            return
            
        if node in lc:
            self.mm.removeNodeFromParent( node )
        elif node.cloneid == id:
            self.mm.removeNodeFromParent( node )
    
    
    
    #@-node:zorcanda!.20051108103717.109:processCloneRemove
    #@+node:zorcanda!.20051108103717.110:giveCloneIDtoChildren
    def giveCloneIDtoChildren( self, node, id ):
        
        #id = id + 1
        for z in node.getChildren():
            if z.p.isCloned():
                cindex = z.p.childIndex() + 1
                
                nid = id + cindex  + 1
                for x in z.oc.nodes:
                    
                    if x == z: continue
                    if x.cloneid == z.cloneid:
                        x.cloneid = nid
                z.cloneid = nid
            
            
            self.giveCloneIDtoChildren( z, id )
    #@nonl
    #@-node:zorcanda!.20051108103717.110:giveCloneIDtoChildren
    #@-others
       
        
    
    
    
    #@-node:zorcanda!.20051108103717.98:Observer interface
    #@-others
        
#@-node:zorcanda!.20051108103717.97:ObservingContainer
#@+node:zorcanda!.20051108103717.111:leoFreeMindMain
class leoFreeMindMain( FreeMindMain ):
    
    
    #@    <<java interface>>
    #@+node:zorcanda!.20051108103717.112:<<java interface>>
    #@+at
    # 
    # public JFrame getJFrame();
    # public boolean isApplet();
    # 
    # public MapView getView();
    # 
    # public void setView(MapView view);
    # 
    # public Controller getController();
    # 
    # public void setWaitingCursor(boolean waiting);
    # 
    # public File getPatternsFile();
    # 
    # public MenuBar getFreeMindMenuBar();
    # 
    # /**Returns the ResourceBundle with the current language*/
    # public ResourceBundle getResources();
    # 
    # public String getResourceString(String key) ;
    # 
    # public Container getContentPane();
    # public void out (String msg);
    # 
    # public void err (String msg);
    # 
    # /**
    # * Open url in WWW browser. This method hides some differences between 
    # operating systems.
    # */
    # public void openDocument(URL location) throws Exception;
    # 
    # /**remove this!*/
    # public void repaint();
    # 
    # public URL getResource(String name);
    # 
    # public int getIntProperty(String key, int defaultValue);
    # /** @return returns the list of all properties. */
    # public Properties getProperties();
    # 
    # public String getProperty(String key);
    # 
    # public void setProperty(String key, String value);
    # 
    # public void saveProperties();
    # 
    # /** Returns the path to the directory the freemind auto properties are 
    # in, or null, if not present.*/
    # public String getFreemindDirectory();
    # 
    # public JLayeredPane getLayeredPane();
    # 
    # public Container getViewport();
    # 
    # public void setTitle(String title);
    # 
    # // to keep last win size (PN)
    # public int getWinHeight();
    # public int getWinWidth();
    # public int getWinState();
    # 
    # // version info:
    # public String getFreemindVersion();
    # 
    # /* To obtain a logging element, ask here. */
    # public java.util.logging.Logger getLogger(String forClass);
    # 
    # /**
    # * @return
    # */
    # public HookFactory getHookFactory();
    # public JPanel getSouthPanel();
    #@-at
    #@nonl
    #@-node:zorcanda!.20051108103717.112:<<java interface>>
    #@nl
    #@    @+others
    #@+node:zorcanda!.20051108103717.113:__init__
    def __init__( self, c ):
        
        self.c = c
        self._jframe = swing.JFrame()
        
    #@-node:zorcanda!.20051108103717.113:__init__
    #@+node:zorcanda!.20051108103717.114:getFrame
    #public JFrame getJFrame();
    def getJFrame( self ):
        
        return self._jframe
        
        
    
    #@-node:zorcanda!.20051108103717.114:getFrame
    #@+node:zorcanda!.20051108103717.115:isApplet
    # public boolean isApplet();
    
    def isApplet( self ):
        return 0
        
    #@-node:zorcanda!.20051108103717.115:isApplet
    #@+node:zorcanda!.20051108103717.116:getView
    # public MapView getView();
    
    def getView( self ):
        pass
        
    #@-node:zorcanda!.20051108103717.116:getView
    #@+node:zorcanda!.20051108103717.117:getController
    #public Controller getController();
    
    def getController( self ):
        pass
        
    #@-node:zorcanda!.20051108103717.117:getController
    #@+node:zorcanda!.20051108103717.118:setWaitingCursor
    #public void setWaitingCursor(boolean waiting);
    
    def setWaitingCursor( self, waiting ):
        pass
    #@nonl
    #@-node:zorcanda!.20051108103717.118:setWaitingCursor
    #@+node:zorcanda!.20051108103717.119:getPatternsFile
    #public File getPatternsFile();
    
    def getPatternsFile( self ):
        pass
        
    #@-node:zorcanda!.20051108103717.119:getPatternsFile
    #@+node:zorcanda!.20051108103717.120:getFreeMindMenuBar
    #public MenuBar getFreeMindMenuBar();
    
    def getFreeMindMenuBar( self ):
        pass
        
    #@-node:zorcanda!.20051108103717.120:getFreeMindMenuBar
    #@+node:zorcanda!.20051108103717.121:getResources
    #public ResourceBundle getResources();
    
    def getResources( self ):
        pass
    #@nonl
    #@-node:zorcanda!.20051108103717.121:getResources
    #@+node:zorcanda!.20051108103717.122:getResourceString
    #public String getResourceString(String key) ;
    
    def getResourceString( self, key ):
        pass
    #@nonl
    #@-node:zorcanda!.20051108103717.122:getResourceString
    #@+node:zorcanda!.20051108103717.123:getContentPane
    #public Container getContentPane();
    
    def getContentPane( self ):
        
        return self._jframe.getContentPane()
        
    #@-node:zorcanda!.20051108103717.123:getContentPane
    #@+node:zorcanda!.20051108103717.124:out ,err
    #    public void out (String msg);
    
    #    public void err (String msg);
    
    
    def out( self, msg ):
        
        print msg
        
        
    def err( self, msg ):
        
        print msg
    #@nonl
    #@-node:zorcanda!.20051108103717.124:out ,err
    #@+node:zorcanda!.20051108103717.125:openDocument
    # /**
    #     * Open url in WWW browser. This method hides some differences between operating systems.
    #     */
    #    public void openDocument(URL location) throws Exception;
    
    
    def openDocument( self , url ):
        pass
        
        
    #@-node:zorcanda!.20051108103717.125:openDocument
    #@+node:zorcanda!.20051108103717.126:repaint
    #public void repaint();
    
    def repaint( self ):
        
        self._jframe.getContentPane().repaint()
        
        
    
    #@-node:zorcanda!.20051108103717.126:repaint
    #@+node:zorcanda!.20051108103717.127:getResource
    #public URL getResource(String name);
    
    def getResource( self, name ):
        pass
        
    #@-node:zorcanda!.20051108103717.127:getResource
    #@-others
#@nonl
#@-node:zorcanda!.20051108103717.111:leoFreeMindMain
#@+node:zorcanda!.20051108103717.128:class BV2
class BV2( BubbleNodeView ):
    
    
    def __init__( self, ag1, ag2 ):
        
        BubbleNodeView.__init__( self, ag1, ag2 )
        
    #def paint( self, g ):
    #    #print "Painting .... %s" % self
    #    self.super__paint( g )
#@nonl
#@-node:zorcanda!.20051108103717.128:class BV2
#@+node:zorcanda!.20051108103717.129:NodeSelectionListener
class NodeSelectionListener( java.awt.event.MouseAdapter ):
    
    def __init__( self, c ):
        java.awt.event.MouseAdapter.__init__( self )
        self.c = c
        
    def mouseEntered( self, event ):

        source = event.getSource()
        model = source.getModel()
        #if model.__class__ == leoMindMapNode2:
        #    p = model.p
        #    self.c.selectPosition( p.copy() )
    
    
    def mousePressed( self, event ):
        source = event.getSource()
        model = source.getModel()
        if model.__class__ == leoMindMapNode2:
            p = model.p
            cp = self.c.currentPosition()
            if p != cp:
                self.c.selectPosition( p.copy() )
                event.consume()
                
    def mouseClicked( self, event ):
        source = event.getSource()
        model = source.getModel()
        if model.__class__ == leoMindMapNode2:
            p = model.p
            cp = self.c.currentPosition()
            if p == cp:
                cc = event.getClickCount()
                print "CLICK COUNT %s" % cc
                
#@nonl
#@-node:zorcanda!.20051108103717.129:NodeSelectionListener
#@+node:zorcanda!.20051108103717.130:class v_id
class v_id:
    
    ids = []
    
    def __init__( self, v ):
        self.v = v
        self.ids.append( v )
        self.vid = self.ids.count( v )
#@nonl
#@-node:zorcanda!.20051108103717.130:class v_id
#@+node:zorcanda!.20051108103717.131:createKey
def createKey( p ):
    

    v1 = p.v
    parent = p.getParent()
    if parent.v == None:
        v2 = p.v
    else:
        v2 = parent.v

    return ( v1, v2 )
#@nonl
#@-node:zorcanda!.20051108103717.131:createKey
#@-others

class mindmap:
    
    def __init__( self, c ):
        self.c = c
        self._free_leo_mind = fn = FreeLeoMind( c.frame.top )
        self.lOA = leoOutlineAdapter( c, fn )
        #import leoMindMap2
        #self.lOA = leoMindMap2.leoMindMap2( c, fn )
        ctrl = fn.getController().getMode().getController()
        ctrl.setLeftToolbarVisible( 0 )
        ctrl.setToolbarVisible( 0 )
        mmodule = fn.getController().getMapModuleManager()
        mmodule.newMapModule( self.lOA )
        cp1 = fn.getContentPane()
        self.mindmapview = cp1
        ctrl.getView().moveToRoot()
        self.setBackgroundImage()
    
    def attach( self ):
        self.lOA.attached = True
        
    def detach( self ):
        self.lOA.attached = False
        
    def reload_outline( self ):
        self.lOA.reload_outline()
        #self.lOA.generateMap()
        
    def setBackgroundImage( self, notification = None, handback = None ):
    
        c = self.c
    

        use_background = g.app.config.getBool( c, "mindmap_use_background_image" )
        cpane = self._free_leo_mind.getContentPane()
        jscrollpane = self._free_leo_mind.getScrollPane()    
        if not use_background:
            cpane.setImage( None )
            jscrollpane.setOpaque( True )
            viewport = jscrollpane.getViewport()
            viewport.setOpaque( True )
            viewport.getView().setOpaque( True )
            return
        
        alpha = g.app.config.getFloat( c, "mindmap_background_alpha" )
        if alpha == None: alpha = 1.0
        image_path = g.app.config.getString( c, "mindmap_image_location@as-filedialog" )
        if image_path:
            imfile = java.io.File( image_path ) 
            if imfile.exists():
                bimage = imageio.ImageIO.read( imfile )
                cpane.setImage( bimage )
                cpane.setAlpha( alpha )
                jscrollpane.setOpaque( False )
                viewport = jscrollpane.getViewport()
                viewport.setOpaque( False )
                viewport.getView().setOpaque( False )
                g.app.config.manager.addNotificationDef( "mindmap_background_alpha", self.setBackgroundImage )
                g.app.config.manager.addNotificationDef( "mindmap_image_location@as-filedialog", self.setBackgroundImage )

#@-node:zorcanda!.20051108103717.1:@thin leoFreeMindView.py
#@-leo
