#@+leo-ver=4-thin
#@+node:zorcanda!.20051109152837:@thin leoMindMap2.py
#@@language python

import freemind.modes.MindMap
import freemind.modes.MapAdapter
import javax.swing.tree as tree
import LeoNodeAdapter
import leoGlobals as g
import leoSwingFrame
import java
import java.awt as awt
import javax.swing.event as sevent

class leoMindMap2( freemind.modes.MapAdapter ):
    
    def __init__( self, c, fn ):
        print fn
        print fn.getJFrame()
        freemind.modes.MapAdapter.__init__( self, fn )
        print fn
        self.c = c
        self.fn = fn
        self.root_uas = {}
        self._root = self.createRoot()
        self.listeners = []
    
    def reload( self, *args ):
        
        if args:
            self.super__reload( args )
        else:
            self.super__reload( self._root )
            
    def begin( self ):
        indices = []
        for z in xrange( self.c.rootPosition().numberOfChildren() ):
            indices.append( z )
        self.nodesWereInserted( self._root, indices )
            
    def addTreeModelListener2( self, listener ):
        print "ATML"
        self.listeners.append( listener )
        
    def nodesWereInserted( self, node, indices ):
        
        self.super__nodesWereInserted( node, indices )
        
    def getChild( self, parent, index ):
        print "GC"
        return parent.getNthChild( index )
        
    def getChildCount( self, p ):
        print "CC"
        return p.numberOfChildren()
        
    def getIndexOfChild( self, p, child ):
        print "INDEX"
        for z in xrange( p.numberOfChildren ):
            nchild = p.getNthChild( z )
            if nchild == child: return z
        
    def getRoot( self ):
        print "ROOT"
        return self._root
        
    def isLeaf( self, p ):
        print "LEAF"
        return p.numberOfChildren()
        
    def removeTreeModelListener2( self, listener ):
        print "REMOVE TML"
        self.listeners.remove( listener )
        
    def valueForPathChanged2( self, path, newvalue ):
        pass
     
    #MindMap ....
    def destroy( self ): pass
    def isReadOnly( self ): return False
    def getLinkRegistry( self ): return None
    def setBackgroundColor( self, color ): pass
    def getBackgroundColor( self ): return awt.Color.WHITE
    def getPathToRoot( self, node ):
        print node
        print "RELOADING!!!!!!!"
        #tp = tree.TreePath( self._root  )
        tp = [ node ]
        print "RETURNING  %s" % tp
        return tp
        
    def getRestoreable( self ): return ""
    def getXml( self, writer ): pass
    def getURL( self ): return None
    def getFile( self ): return None
    def insertNodeInto( self, parent, child , index ): pass
    def getAsRTF( self, nodes ): return ""
    def getAsPlainText( self, nodes ): return ""
    def copy( self, *args ): return ""
    def copySingle( self ): return ""
    def cut( self, node ): return ""
    def nodeChanged( self, node ): 
        print "nodeChanged!"
        return ""
    def changeNode( self, node, text ): print "change NODE!"
    
    #@    @+others
    #@+node:zorcanda!.20051109154211:createRoot
    def createRoot( self ):
            
        c = self.c
        color = g.app.config.getColor( c, "mindmap_node_bg_color" )
        bg = leoSwingFrame.getColorInstance( color, java.awt.Color.WHITE )
        
        class root( leoBaseMindMapNode ):
            def __init__( self, name, t, dic ):
                
                leoBaseMindMapNode.__init__( self, name, t, dic )
                self.c = c
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
                
            def getChildCount( self ):
                print "GETTING CHILD COUNT!!!"
                i = 0
                for z in self.c.rootPosition().self_and_siblings_iter( copy = 1 ):
                    i += 1
                return i
                
            def children( self ):
                print "CHILDREN!!!"
                return self.super__children()
                
                
        rt = root( "New Leo Mindmap", self.fn, self.root_uas )
        rt.mm = self
        style = g.app.config.getString( c, "mindmap_node_style" )
        rt.setStyle( style )
        return rt
    
    
    #@-node:zorcanda!.20051109154211:createRoot
    #@-others
    
#@<<leoBaseMindMapNode>>
#@+node:zorcanda!.20051109154317:<<leoBaseMindMapNode>>
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
    #@+node:zorcanda!.20051109154317.1:uA specific
    def __setUA( self, name, value ):
        #uAs = self.p.v.getUnknownAttributes()
        uAs = self.uAs
        uAs[ name ] = value  
    #@nonl
    #@-node:zorcanda!.20051109154317.1:uA specific
    #@+node:zorcanda!.20051109154317.2:setters
    #@+others
    #@+node:zorcanda!.20051109154317.3:setUserObject
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
    #@-node:zorcanda!.20051109154317.3:setUserObject
    #@+node:zorcanda!.20051109154317.4:setBackgroundColor
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
    #@-node:zorcanda!.20051109154317.4:setBackgroundColor
    #@+node:zorcanda!.20051109154317.5:setColor
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
    #@-node:zorcanda!.20051109154317.5:setColor
    #@+node:zorcanda!.20051109154317.6:setStyle
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
    #@-node:zorcanda!.20051109154317.6:setStyle
    #@+node:zorcanda!.20051109154317.7:setBold
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
    #@-node:zorcanda!.20051109154317.7:setBold
    #@+node:zorcanda!.20051109154317.8:setItalic
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
    #@-node:zorcanda!.20051109154317.8:setItalic
    #@+node:zorcanda!.20051109154317.9:setUnderlined
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
    #@-node:zorcanda!.20051109154317.9:setUnderlined
    #@+node:zorcanda!.20051109154317.10:setFontSize
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
    #@-node:zorcanda!.20051109154317.10:setFontSize
    #@+node:zorcanda!.20051109154317.11:setFontFamilyName
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
    
    
    #@-node:zorcanda!.20051109154317.11:setFontFamilyName
    #@+node:zorcanda!.20051109154317.12:setAdditionalInfo
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
    #@-node:zorcanda!.20051109154317.12:setAdditionalInfo
    #@+node:zorcanda!.20051109154317.13:setText
    def setText2( self, text ):
    
        #print "SETTING TO %s" % text
        self.p.setHeadStringOrHeadline( text )
        #for z in self.p.v._mm_nodes:
        #    print z.getViewer()
        #    z.getViewer().repaint()
    #@nonl
    #@-node:zorcanda!.20051109154317.13:setText
    #@-others
    #@-node:zorcanda!.20051109154317.2:setters
    #@+node:zorcanda!.20051109154317.14:icons
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
    #@-node:zorcanda!.20051109154317.14:icons
    #@-others
#@nonl
#@-node:zorcanda!.20051109154317:<<leoBaseMindMapNode>>
#@nl
                                 

#@-node:zorcanda!.20051109152837:@thin leoMindMap2.py
#@-leo
