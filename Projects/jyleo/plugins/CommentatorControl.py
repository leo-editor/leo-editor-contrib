#@+leo-ver=4-thin
#@+node:zorcanda!.20050907145317:@thin CommentatorControl.py
import leoGlobals as g
import leoSwingFrame
from utilities.DefCallable import DefCallable
import java
import javax.swing as swing
import javax.swing.event as sevent
import java.awt.event as aevent
import java.awt as awt
import javax.imageio as imageio
from utilities.CutCopyPaste import CutCopyPaste
import EditorBackground


def addCommentary( tag, kwords ):
    
    c = kwords[ 'c' ]
    log = kwords[ 'log' ]
    
    commentator = Commentator( c, log._jtp, 1 )
    log.addTab( "Commentaries", commentator )

def init():	
    import leoPlugins
    leoPlugins.registerHandler( "leoswinglogcreated", addCommentary )
    g.plugin_signon( __name__)
    

#@+others
#@+node:zorcanda!.20050907145317.1:Commentator
class Commentator( swing.JPanel , aevent.ItemListener, sevent.DocumentListener ):
    
    #@    @+others
    #@+node:zorcanda!.20050907145317.2:__init__
    def __init__( self, c , jtab, i ):
        swing.JPanel.__init__( self )
        self.c = c
        self.createWidgets()
        self.tdata = self.CommentTableModel()
        #self.slist.setModel( self.tdata )
        #self.slist.getSelectionModel().addListSelectionListener( self )
        self.commentarea.getDocument().addDocumentListener( self )
        #print self.slist.getCellEditor()
        #self.slist.getDefaultEditor( java.lang.Object.__class__ ).addCellEditorListener( self )
        import leoPlugins
        leoPlugins.registerHandler( "select1", self.nodeSelected )
        self.jtab = jtab
        self.i = i
        
        self.icon = swing.ImageIcon( g.os_path_join( g.app.loadDir, "..", "Icons", "Cloud24.gif" ) )
        
        
    
    
    #@-node:zorcanda!.20050907145317.2:__init__
    #@+node:zorcanda!.20050907145317.3:createWidgets
    def createWidgets( self ):
        
    
        blayout = java.awt.BorderLayout()
        self.setLayout( blayout )
        #hbox = swing.JPanel( java.awt.GridLayout( 1, 2 ) )
        #tcontainer = swing.JPanel( java.awt.BorderLayout() )
        #self.slist = slist = swing.JTable()
        #slist.getSelectionModel().setSelectionMode( swing.ListSelectionModel.SINGLE_SELECTION )
        #rh = slist.getRowHeight()
        #pvs = slist.getPreferredScrollableViewportSize()
        #pvs2 = pvs.clone()
        #pvs2.height = rh * 5
        #slist.setPreferredScrollableViewportSize( pvs2 )
        #lsp = swing.JScrollPane( slist )
        #tcontainer.add( lsp, java.awt.BorderLayout.CENTER )
        #hbox.add( tcontainer )
    
        
        
        self.commentarea = commentarea = swing.JTextPane()
        #self.__configureEditor()
        CutCopyPaste( commentarea )
        self.csp = csp = swing.JScrollPane( commentarea )
        self.backdrop = swing.JPanel()
        overlay = swing.OverlayLayout( self.backdrop )
        self.backdrop.setLayout( overlay )
        self.backdrop.add( csp )
        mb_ca = swing.JPanel( java.awt.BorderLayout() )
        mb_ca.add( self.backdrop, java.awt.BorderLayout.CENTER )
        mb = swing.JMenuBar()
        #jm = swing.JMenu( "Options" )
        #mb.add( jm )
        #jmi = swing.JCheckBoxMenuItem( "Show Comments In Outline" )
        #jm.add( jmi )
        #jmi.setState( 1 )
        #jmi.actionPerformed = self.__showCommentsInOutline
        mb_ca.add( mb, java.awt.BorderLayout.NORTH )
        #hbox.add( mb_ca )
        #self.add( hbox, java.awt.BorderLayout.CENTER )
        self.add( mb_ca )
        self.__configureEditor()
        #jm.add( tcontainer )
        #jm2 = swing.JMenu( "Commentaries" )
        
        #jm2.add( tcontainer )
        #mb.add( jm2 )
        
        aballoon = swing.ImageIcon( g.os_path_join( g.app.loadDir, "..", "Icons", "AddTBalloon.gif" ) )
        sballoon = swing.ImageIcon( g.os_path_join( g.app.loadDir, "..", "Icons", "SubtractTBalloon.gif" ) )
        #bpanel = swing.JPanel()
        add = swing.JMenuItem( "Add Comment", aballoon )
        add.setToolTipText( "Add Comment" )
        add.actionPerformed = self.addComment
        remove = swing.JMenuItem( "Remove Comment", sballoon )
        remove.setToolTipText( "Remove Comment" )
        remove.actionPerformed = self.removeComment
        #bpanel.add( add )
        #bpanel.add( remove )
        #tcontainer.add( bpanel, java.awt.BorderLayout.SOUTH )
        jm2 = swing.JMenu( "Commentaries" )
        jmi = swing.JCheckBoxMenuItem( "Show Comments In Outline" )
        jm2.add( jmi )
        jmi.setState( 1 )
        jmi.actionPerformed = self.__showCommentsInOutline
        jm2.add( add )
        jm2.add( remove )
        #jm2.add( tcontainer )
        mb.add( jm2 )
        
        self.ccbmodel = self.CommentCBModel( self )
        self.jcb = jcb = swing.JComboBox( self.ccbmodel )
        #print jcb.getEditor().getEditorComponent().__class__.__bases__
        self.jcb.getEditor().getEditorComponent().getDocument().addDocumentListener( self.ccbmodel )
        jcb.addItemListener( self )
        jcb.setEditable( 1 )
        mb.add( jcb )
    
        
        
    #@nonl
    #@-node:zorcanda!.20050907145317.3:createWidgets
    #@+node:zorcanda!.20050907145317.4:__configureEditor
    def __configureEditor( self, notification = None, handback = None ):
        
        config = g.app.config
        c = self.c  
        family = config.get( c, "commentary_text_font_family", "family" )
        size = config.get( c, "commentary_text_font_size", "size" )
        weight = config.get( c, "commentary_text_font_weight", "weight" )
        slant = None
        font = config.getFontFromParams( c, "commentary_text_font_family", "commentary_text_font_size", None, "commentary_text_font_weight")
        
        if font:
            self.commentarea.setFont( font )
            
        
        fg = g.app.config.getColor( c, 'commentary_text_foreground_color' )
        bg = g.app.config.getColor( c, 'commentary_text_background_color' )
        sc = g.app.config.getColor( c, 'commentary_selection_color' )
        stc = g.app.config.getColor( c, 'commentary_text_selected_color' )
        
        fg = leoSwingFrame.getColorInstance( fg, awt.Color.GRAY )
        bg = leoSwingFrame.getColorInstance( bg, awt.Color.WHITE )
        sc = leoSwingFrame.getColorInstance( sc, awt.Color.GREEN )
        stc = leoSwingFrame.getColorInstance( stc, awt.Color.WHITE )
        self.commentarea.setForeground( fg )
        self.commentarea.setBackground( bg )
        self.commentarea.setSelectionColor( sc )
        self.commentarea.setSelectedTextColor( stc )
        
        ctfc = g.app.config.getColor( c, 'commentary_table_foreground_color' )
        ctbc = g.app.config.getColor( c, 'commentary_table_background_color' )
        ctsbc = g.app.config.getColor( c, 'commentary_table_selected_background_color' )
        ctsfc = g.app.config.getColor( c, 'commentary_table_selected_foreground_color' )
        ctgc = g.app.config.getColor( c, 'commentary_table_grid_color' )
        
        ctfc = leoSwingFrame.getColorInstance( ctfc, awt.Color.BLUE )
        ctbc = leoSwingFrame.getColorInstance( ctbc, awt.Color.WHITE )
        ctsbc = leoSwingFrame.getColorInstance( ctsbc, awt.Color.GREEN )
        ctsfc = leoSwingFrame.getColorInstance( ctsfc, awt.Color.RED )
        ctgc = leoSwingFrame.getColorInstance( ctgc, awt.Color.GRAY )
        
        self.setBackgroundImage()
        #slist = self.slist
        #slist.setForeground( ctfc )
        #slist.setBackground( ctbc )
        #slist.setSelectionBackground( ctsbc )
        #slist.setSelectionForeground( ctsfc )
        #slist.setGridColor( ctgc )
        
        #font = config.getFontFromParams( c, "commentary_table_font_family", "commentary_table_font_size", None, "commentary_table_font_weight")
        
        #if font:
        #    slist.setFont( font )
        
        
    #@-node:zorcanda!.20050907145317.4:__configureEditor
    #@+node:zorcanda!.20050907145317.5:addComment
    def addComment( self, event ):
        
        t = self.t
        if hasattr( t, "unknownAttributes" ):
            uAs = t.unknownAttributes
        else:
            t.unknownAttributes = {}
            uAs = t.unknownAttributes
        
        update = 0
        if uAs.has_key( "__commentaries" ):
            __commentaries = uAs[ "__commentaries" ]
            if not __commentaries:
                update = 1
        else:
            __commentaries = []
            uAs[ "__commentaries" ] = __commentaries
            update = 1
        
        comment = {}
        comment[ 'headline' ] = "new commentary"
        comment[ 'comments' ] = ""
        __commentaries.append( comment )
        self.__setData( __commentaries )
        #self.c_comment = comment
        if update:
            self.c.beginUpdate()
            self.c.endUpdate()
        #event.consume()
        return
        
        
        
    
    
    #@-node:zorcanda!.20050907145317.5:addComment
    #@+node:zorcanda!.20050907145317.6:removeComment
    def removeComment( self, event ):
        
        i = self.slist.getSelectedRow()
        if i != -1:
            
            uAs = self.t.unknownAttributes
            __commentaries = uAs[ '__commentaries' ]
            item = __commentaries[ i ]
            __commentaries.remove( item )
            self.c_comment = None
            self.__setData( __commentaries )
            if not __commentaries:
                self.c.beginUpdate()
                self.c.endUpdate()
                
        #event.consume()   
    #@nonl
    #@-node:zorcanda!.20050907145317.6:removeComment
    #@+node:zorcanda!.20050907145317.7:nodeSelected
    def nodeSelected( self, *args ):
        
        values = args[ 1 ]
        n_p = values[ "new_p" ]
        self.c_comment = None
        if hasattr( n_p, "v" ):
            t = n_p.t
            self.t = t
            
            if hasattr( t, "unknownAttributes" ):
                uAs = t.unknownAttributes
                if uAs.has_key( "__commentaries" ):
                    __commentaries = uAs[ "__commentaries" ]
                    
                    #self.tdata.setDataVector( [ __commentaries, ], [ "commentaries" ] )
                    print "Ua class is %s" % __commentaries.__class__
                    clater = lambda : self.__setData( __commentaries )
                    dc = DefCallable( clater )
                    ft = dc.wrappedAsFutureTask()
                    swing.SwingUtilities.invokeLater( ft )
                    return
                    
                    
        else:
            self.t = None
            
        sc = lambda : self.__setData( [] )
        dc = DefCallable( sc )
        ft = dc.wrappedAsFutureTask()
        swing.SwingUtilities.invokeLater( ft )
        return
        
        
    #@nonl
    #@-node:zorcanda!.20050907145317.7:nodeSelected
    #@+node:zorcanda!.20050907145317.8:documentListener
    def changedEvent( self, event ):
        pass
        
    
    def insertUpdate( self, event ):
        self.__sync()
        
        
    def removeUpdate( self, event ):
        self.__sync()
        
        
    def __sync( self ):
        
        ca = self.commentarea
        txt = ca.getText()
        if self.c_comment:
            self.c_comment.setComments( txt )
    #@-node:zorcanda!.20050907145317.8:documentListener
    #@+node:zorcanda!.20050907145317.9:itemStateChanged
    def itemStateChanged( self, event ):
        
        source = event.getSource()
        #findx = source.getMinSelectionIndex()
        #if findx != -1 and self.tdata.comments:
        #    self.commentarea.setEnabled( 1 )
        #    item = self.tdata.getValueAt( findx, 0 )
        #    comment = self.tdata.comments[ findx ]
        #    self.c_comment = comment
        #    self.commentarea.setText( comment.comments )
        #    self.commentarea.setCaretPosition( 0 )
        #    return
        item = event.getItem()
        if item:
            print "item is %s" % item
            self.commentarea.setEnabled( 1 )
            #item = self.tdata.getValueAt( findx, 0 )
            #comment = self.tdata.comments[ findx ]
            self.c_comment = item
            self.commentarea.setText( item.getComments() )
            self.commentarea.setCaretPosition( 0 )
            self.jcb.getEditor().setItem( item )
            return
            
        self.c_comment = None
        self.commentarea.setText( "" )
        self.commentarea.setEnabled( 0 )
    
        
    
    #@-node:zorcanda!.20050907145317.9:itemStateChanged
    #@+node:zorcanda!.20050907145317.10:__showCommentsInOutline
    def __showCommentsInOutline( self, event ):
        
        tree = self.c.frame.tree
        if tree.renderer.getCommentIcon():
            tree.renderer.setCommentIcon( None )
        else:
            tree.renderer.setCommentIcon( tree.commenticon )
            
        self.c.beginUpdate()
        self.c.endUpdate()
    #@-node:zorcanda!.20050907145317.10:__showCommentsInOutline
    #@+node:zorcanda!.20050907145317.11:__setData
    def __setData( self, data ):
        
        
        self.ccbmodel.setComments( data )
        if data:
            self.jtab.setIconAt( self.i, self.icon )
            self.jcb.setSelectedIndex( 0 )
            self.c_comment = self.ccbmodel.comments[ 0 ]
        else:
            self.jtab.setIconAt( self.i, None )
            self.c_comment = None
        
        if not data:
            
            editor = self.jcb.getEditor()
            editor.setItem( "" )
            self.commentarea.setText( "" )
            self.commentarea.setEnabled( 0 )
            
        
    
    
    
    
    #@-node:zorcanda!.20050907145317.11:__setData
    #@+node:zorcanda!.20050907145317.12:class CommentTableModel
    class CommentTableModel( swing.table.TableModel ):
        
        def __init__( self ):
            self.listners = []
            self.comments = []
        
        def setComments( self, comments ):
            self.comments = comments
            
            tme = sevent.TableModelEvent( self )
            for z in self.listners:
                
                z.tableChanged( tme )
    
        
          
        def addTableModelListener( self, lisn ):
            self.listners.append( lisn )
            
        def getColumnClass( self, column ):
            return java.lang.String
            
        def getColumnCount( self ):
            return 1
            
        def getColumnName( self, col ):
            
            return "commentaries"
    
            
        def getRowCount( self ):
            
            return len( self.comments )
            
        def getValueAt( self, row, col ):
            
            print self.comments
            print self.comments[ row ]
            return self.comments[ row ].getHeadline()
            
                
            
        def isCellEditable( self, row, column ):
            
            return 1
        
            
        def removeTableModelListener( self, lsn ):
            self.lsners.remove( lsn )
            
        def setValueAt( self, value, row, col ):
            
            print self.comments
            print self.comments[ row ]
            self.comments[ row ].setHeadline( str( value ) )
            
            
    #@-node:zorcanda!.20050907145317.12:class CommentTableModel
    #@+node:zorcanda!.20050907145317.13:class CommentCBModel
    class CommentCBModel( swing.ComboBoxModel, sevent.DocumentListener ):
        
        def __init__( self, commentator ):
            
            self.listners = []
            self.comments = []
            self.sitem = None
            self.commentator = commentator
            #self._sbcomments = []
            
        def setComments( self, comments ):
            #self.comments = comments
            self.comments = []
            for z in comments:
                print z
                commentary = Commentary( z )
                self.comments.append( commentary )
                
            tme = sevent.ListDataEvent( self, 0, 0, sevent.ListDataEvent.CONTENTS_CHANGED )
            for z in self.listners:            
                z.contentsChanged( tme )
    
            
        def getSelectedItem( self ):
            return self.sitem
            
        def setSelectedItem( self, obj ):
            self.sitem = obj
            print "Setting %s" % obj
            self.commentator.c_comment = obj
            
        def getSize( self ):
            return len( self.comments )
            
        def getElementAt( self, i ):
            return self.comments[ i ]
            
        def addListDataListener( self, lisner ):
            self.listners.append( lisner )
            
        def removeListDataListener( self, lisner ):
            self.listners.remove( lisner )
        
        
        def changedUpdate( self, event ):
            pass
            
        def insertUpdate( self, event ):
            self._sync( event )
            
        def removeUpdate( self, event ):
            self._sync( event )
            
        def _sync( self, event ):
            
            doc = event.getDocument()
            if self.commentator.c_comment:
                print self.commentator.c_comment
                txt = doc.getText(0, doc.getLength() )
                self.commentator.c_comment.setHeadline( txt )
        
            
            
            
    
    #@-node:zorcanda!.20050907145317.13:class CommentCBModel
    #@+node:zorcanda!.20050907145317.14:setBackgroundImage
    def setBackgroundImage( self, notification = None, handback = None ):
        
        c = self.c
        
    
        use_background = g.app.config.getBool( c, "commentor_use_background_image" )    
        if not use_background:
            return
            
        alpha = g.app.config.getFloat( c, "commentor_background_alpha" )
        if alpha == None: alpha = 1.0
        image_path = g.app.config.getString( c, "commentor_image_location@as-filedialog" )
        if image_path:
            imfile = java.io.File( image_path ) 
            if imfile.exists():
                bimage = imageio.ImageIO.read( imfile )
                if not hasattr( self, '_background' ): 
                    self._background = EditorBackground( bimage, bimage.getWidth(), bimage.getHeight(), alpha )
                    #self.layeredpane.add( self.background, self.layeredpane.DEFAULT_LAYER )
                    #self.logBackPane.add( self.background )
                    self.backdrop.add( self._background )
                    self.csp.getViewport().addChangeListener( self.resizer( self.csp, self._background ) )
                    #self._vport.addChangeListener( self._resizer )
                    #self.editor.setOpaque( False )
                    #self.jtree.setOpaque( False )
                    #self.jpanel.setOpaque( False )
                    #self.jspane.setOpaque( False )
                    #self.jspane.getViewport().setOpaque( False )
                    ##self.logCtrl.setOpaque( False )
                    self.csp.getViewport().setOpaque( False )
                    self.csp.setOpaque( False )
                    self.commentarea.setOpaque( False )
                    g.app.config.manager.addNotificationDef( "commentor_background_alpha", self.setBackgroundImage )
                    g.app.config.manager.addNotificationDef( "commentor_image_location@as-filedialog", self.setBackgroundImage )
                      
                else:
                    self._background.setBackground( bimage, bimage.getWidth(), bimage.getHeight(), alpha )
                    self._background.repaint()
    
    
    
    #@-node:zorcanda!.20050907145317.14:setBackgroundImage
    #@+node:zorcanda!.20050907145317.15:resizer --keeps components sized right
    class resizer( sevent.ChangeListener ):
        '''This class keeps the Editor size in sync with the JLayeredPane. 
           It also sets where the line numbers go and where, if present,
           a background image goes.'''
        def __init__( self, view, background ):
    
            self.viewPort = view.getViewport()
            self.background = background
            self.view = view
        
    
    
               
    
        def stateChanged( self, event ):
            
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
    #@-node:zorcanda!.20050907145317.15:resizer --keeps components sized right
    #@-others
    
#@-node:zorcanda!.20050907145317.1:Commentator
#@+node:zorcanda!.20050907145317.16:class Commentary
class Commentary( java.lang.Object ):
    
    def __init__( self, dic ):
        
        self.dic = dic
        #self.headline = "new commentary"
        #self.comments = ""
        
    
    def setComments( self, txt ):
        #self.comments = txt
        self.dic[ 'comments' ] = txt
        
    def setHeadline( self, hl ):
        self.dic[ 'headline' ] = hl
        
    
    def getComments( self ):
        return self.dic[ 'comments' ]
        
    def getHeadline( self ):
        return self.dic[ 'headline' ]
        
    def toString( self ):
        print "RETURNING MY NEW TITLE!!!"
        return self.dic[ 'headline' ]
#@-node:zorcanda!.20050907145317.16:class Commentary
#@-others
#@nonl
#@-node:zorcanda!.20050907145317:@thin CommentatorControl.py
#@-leo
