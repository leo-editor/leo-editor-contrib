#@+leo-ver=4-thin
#@+node:mork.20050127175441.1:@thin leoSwingMenu.py
"""Gui-independent menu handling for Leo.""" 

import leoGlobals as g
import java.io as io
import org.leo.shell.IsolatedJythonClassLoader as ijcl
ld = io.File( g.app.loadDir )
ijcl.addToSearchPath( ld )
ijcl.beginLoading()
  
import string
import sys
import leoMenu
import java
import java.awt as awt
import java.awt.event as aevent
import javax.swing as swing  
import javax.swing.event as sevent
import javax.swing.tree as stree  
import javax.swing.border as sborder 
import java.lang
import pdb
from utilities.DefCallable import DefCallable
False = 0
True = 1

#@+others
#@+node:mork.20050127175441.2:class leoSwingMenu
class leoSwingMenu( leoMenu.leoMenu ):
     
    """The base class for all Leo menus."""

    #@    @+others
    #@+node:mork.20050127175441.3: leoSwingMenu.__init__
    def __init__ (self,frame):
        
        ld = io.File( g.app.loadDir )
        ijcl.addToSearchPath( ld )
        ijcl.beginLoading()
        self.font = frame.top.getFont()
        self.executor = java.util.concurrent.Executors.newCachedThreadPool()
        self.queue = java.util.concurrent.LinkedBlockingQueue()
        self.menu_changer = self.MenuChanger( self.queue )
        self.names_and_commands = {}
        self.keystrokes_and_actions = {}
        leoMenu.leoMenu.__init__( self, frame )
        #self.createLeoSwingPrint()
        #self.defineLeoSwingPrintTable()
        #self.addCommanderSupplemental()
        
        
    
        
        
    
    
    
    #@-node:mork.20050127175441.3: leoSwingMenu.__init__
    #@+node:zorcanda!.20050515211749:class MenuChanger
    class MenuChanger( java.lang.Runnable, java.util.concurrent.Callable ):
        
        def __init__( self, queue ):
            self.queue = queue
            
        def run( self ):
            
            ft = java.util.concurrent.FutureTask( self )
            java.awt.EventQueue.invokeLater( ft )
            
        
        def call( self ):
            
            menu , name , label, enabled = self.queue.take() 
            target = None
            for z in menu.getMenuComponents():
                if hasattr( z, "getText" ) and z.getText() == name:
                    target = z
                    break
            
            
            if target:
                target.setText( label )
                target.setEnabled( enabled )
            
    #@nonl
    #@-node:zorcanda!.20050515211749:class MenuChanger
    #@+node:zorcanda!.20050328114741:print menu stuff...
    #@+others
    #@+node:zorcanda!.20050328104537:defineLeoSwingPrintTable
    def defineLeoSwingPrintTable( self ):
        
        self.printNodeTable= (
        
        ( "Print Current Node" , None, lambda event: self.lsp.printNode() ),
        ( "Print Current Node as HTML", None, lambda event: self.lsp.printNode( type = "HTML" ) ),
        ( "Print Marked Nodes", None, lambda event:  self.lsp.printMarkedNodes() ),
        ( "Print Marked Nodes as HTML", None, lambda event: self.lsp.printNode( type ="HTML" ) ),
        
        )
        
        for z in self.printNodeTable:
            self.names_and_commands[ z[ 0 ] ] = z[ 2 ]
        
    #@nonl
    #@-node:zorcanda!.20050328104537:defineLeoSwingPrintTable
    #@+node:zorcanda!.20050328105609:createLeoSwingPrintMenu
    def createLeoSwingPrintMenu( self ):
        
        fmenu = self.getMenu( "File" )
        
        components = fmenu.getMenuComponents()
        
        x = 0
        for z in components:
            
            if hasattr( z, 'getText' ) and z.getText() == "Recent Files...":
                break
            x += 1
            
        
        spot = x + 1
        
        pmenu = swing.JMenu( "Printing" )
        
        pnodes = swing.JMenu( "Print Nodes" )
        pmenu.add( pnodes )
        for z in self.printNodeTable:
            item = swing.JMenuItem( z[ 0 ] )
            item.actionPerformed = z[ 2 ]
            pnodes.add( item )
            
        sep = swing.JSeparator()
        fmenu.add( sep, spot  )
        fmenu.add( pmenu, spot + 1 )
        
        print_tree = swing.JMenuItem( "Print Tree As Is" )
        print_tree.actionPerformed = self.lsp.printTreeAsIs
        pmenu.add( print_tree )
        self.names_and_commands[ "Print Tree As Is" ] = self.lsp.printTreeAsIs
        print_as_more = swing.JMenuItem( "Print Outline in More Format" )
        print_as_more.actionPerformed = self.lsp.printOutlineAsMore
        self.names_and_commands[ "Print Outline in More Formet" ] = self.lsp.printOutlineAsMore
        pmenu.add( print_as_more )
        
        
        
        
        
    
               
    
        
    
    
    #@-node:zorcanda!.20050328105609:createLeoSwingPrintMenu
    #@+node:zorcanda!.20050325122234:createLeoSwingPrint
    def createLeoSwingPrint( self ):
        
        c = self.c
        import leoSwingPrint
        lsp = leoSwingPrint.leoSwingPrint( c )
        menu = lsp.getAsMenu()
        
        fmenu = self.getMenu( "File" )
        
        components = fmenu.getMenuComponents()
        
        x = 0
        for z in components:
            
            if hasattr( z, 'getText' ) and z.getText() == "Recent Files...":
                break
            x += 1
            
        
        spot = x + 1
        
            
        sep = swing.JSeparator()
        fmenu.add( sep, spot  )
        fmenu.add( menu, spot + 1 )
        
    
    #@-node:zorcanda!.20050325122234:createLeoSwingPrint
    #@-others
    #@-node:zorcanda!.20050328114741:print menu stuff...
    #@+node:zorcanda!.20050328114741.1:plugin menu stuff...
    #@+node:zorcanda!.20050328114741.2:createPluginMenu
    def createPluginMenu( self ):
        
        top = self.getMenu( 'top' )
        oline = self.getMenu( 'Outline' )
        ind = top.getComponentIndex( oline ) + 1
        import leoSwingPluginManager
        self.plugin_menu = pmenu = leoSwingPluginManager.createPluginsMenu()
        #self.plugin_menu = pmenu = swing.JMenu( "Plugins" )
        top.add( pmenu, ind )
        #cpm = swing.JMenuItem( "Plugin Manager" )
        #cpm.actionPerformed = self.createPluginManager
        #pmenu.add( cpm )
        #pmenu.addSeparator()
        
        
        #self.names_and_commands[ "Plugin Manager" ] = self.createPluginManager
        
    
    #@-node:zorcanda!.20050328114741.2:createPluginMenu
    #@+node:zorcanda!.20050330164343:createPluginManager
    def createPluginManager( self, event ):
        
        import leoSwingPluginManager as lspm
        lspm.topLevelMenu()
        
    #@-node:zorcanda!.20050330164343:createPluginManager
    #@+node:zorcanda!.20050425140529:getPluginMenu
    def getPluginMenu( self ):
        
        return self.plugin_menu
    #@-node:zorcanda!.20050425140529:getPluginMenu
    #@-node:zorcanda!.20050328114741.1:plugin menu stuff...
    #@+node:zorcanda!.20050413144058:JythonShell stuff
    #@+others
    #@+node:zorcanda!.20050413144058.1:openJythonShell
    def openJythonShell( self ):
        
        js = ijcl.getJythonShell()
        jd = js.getDelegate()
        config = g.app.config
        c = self.c
        
        import leoSwingFrame
        getColorInstance = leoSwingFrame.getColorInstance 
        
        colorconfig = js.getColorConfiguration()
        color = config.getColor( c, "jyshell_background" )
        colorconfig.setBackgroundColor( getColorInstance( color, awt.Color.WHITE ) )
        
        color = config.getColor( c, "jyshell_foreground" )
        colorconfig.setForegroundColor( getColorInstance( color, awt.Color.GRAY ) )
        
        color = config.getColor( c, "jyshell_keyword" )
        colorconfig.setKeywordColor( getColorInstance( color, awt.Color.GREEN ) )
        
        color = config.getColor( c, "jyshell_local" )
        colorconfig.setLocalColor( getColorInstance( color, awt.Color.ORANGE ) )
        
        color = config.getColor( c, "jyshell_ps1color" )
        colorconfig.setPromptOneColor( getColorInstance( color, awt.Color.BLUE ) )
        
        color = config.getColor( c, "jyshell_ps2color" )
        colorconfig.setPromptTwoColor( getColorInstance( color, awt.Color.GREEN ) )
        
        color = config.getColor( c, "jyshell_syntax" )
        colorconfig.setSyntaxColor( getColorInstance( color, awt.Color.RED ) )
        
        color = config.getColor( c, "jyshell_output" )
        colorconfig.setOutColor( getColorInstance( color, awt.Color.GRAY ) )
        
        color = config.getColor( c, "jyshell_error" )
        colorconfig.setErrColor( getColorInstance( color, awt.Color.RED ) )
        
        family = config.get( c, "jyshell_text_font_family", "family" )
        size = config.get( c, "jyshell_text_font_size", "size" )
        weight = config.get( c, "jyshell_text_font_weight", "weight" )
        slant = None
        font = config.getFontFromParams( c, "jyshell_text_font_family", "jyshell_text_font_size", None, "jyshell_text_font_weight")
        
        use_bgimage = g.app.config.getBool( c, "jyshell_background_image" )
        if use_bgimage:
            
            image_location = g.app.config.getString( c, "jyshell_image_location@as-filedialog" )
            test_if_exists = java.io.File( image_location )
            if test_if_exists.exists():
                ii = swing.ImageIcon( image_location )
                alpha = g.app.config.getFloat( c, "jyshell_background_alpha" )
                js.setBackgroundImage( ii.getImage(), float( alpha ) )
            
        if font:
            js.setFont( font )
            
        js.setVisible( True )
        widget = js.getWidget()
        log = self.c.frame.log    
        self.addMenuToJythonShell( js )
        log.addTab( "JythonShell", widget )
        log.selectTab( widget )
        
        
    #@-node:zorcanda!.20050413144058.1:openJythonShell
    #@+node:zorcanda!.20051206143058:addMenuToJythonShell
    def addMenuToJythonShell( self, js ):
        
        c = self.c
        jd = js.getDelegate()
        jmenu = swing.JMenu( "Leo" )
        jd.addToMenu( jmenu )
        
        e = swing.JMenuItem( "Execute Node As Script" )  
        e.actionPerformed = lambda event, jd = jd: self.fireNodeAsScript( event, jd )
        jmenu.add( e )
        
        p = swing.JMenuItem( "Run Node in Pdb" )
        p.actionPerformed = self.getRunNodeInPdb( c, jd )
        jmenu.add( p )
        
        captext = "Capture Shell Input In Node"
        totext = "Turn Off Shell Input Capture"
        sc = swing.JMenuItem( captext )
        import org.leo.JTextComponentOutputStream as jtcos
        class logcontrol:
            def __init__( self, menu ):
                self.menu = menu
                self.loging = False
                self.ostream = jtcos( c.frame.body.editor.editor )
                
            def __call__( self, event ):  
                menu = self.menu
                loging = self.loging
                if not loging:
                    js.addLogger( self.ostream )
                    menu.setText( totext )
                    self.loging = True
                else:
                    js.removeLogger( self.ostream )
                    menu.setText( captext )
                    self.loging = False
                
        sc.actionPerformed = logcontrol( sc )           
        jmenu.add( sc )
        
        d = swing.JMenuItem( "Detach Shell" )
        class detacher( java.util.concurrent.Callable ):
            
            def __init__( self, menu ):
                self.menu = menu
                self.embeded = True
                js.setCloser( self )
            
            def call( self ):
                
                if self.embeded:
                    log = c.frame.log
                    widget = js.getWidget()
                    log.removeTab( widget )
                else:
                    widget = js.getWidget()
                    parent = widget.getTopLevelAncestor()
                    parent.dispose();
              
            def __call__( self, event ):
                d = self.menu
                text = d.getText()
                if( text == "Detach Shell" ):
                    d.setText( "Retach Shell" )
                    jf = swing.JFrame( "JythonShell" )
                    widget = js.getWidget()
                    log = c.frame.log 
                    log.removeTab( widget )
                    jf.add( widget )
                    jf.setSize( 500, 500 )
                    jf.visible = 1
                    self.embeded = False
                else:
                    d.setText( "Detach Shell" )
                    widget = js.getWidget()
                    parent = widget.getTopLevelAncestor()
                    parent.dispose();
                    log = c.frame.log
                    log.addTab( "JythonShell", widget  )
                    log.selectTab( widget ) 
                    self.embeded = True
                         
        d.actionPerformed = detacher( d )
        jmenu.add( d )    
        
        
        
    #@nonl
    #@-node:zorcanda!.20051206143058:addMenuToJythonShell
    #@+node:zorcanda!.20050416102246:getInsertNodeIntoShell
    def getInsertNodeIntoShell( self, c, jd ):
        
        jm = swing.JMenuItem( "Write Node Into Shell as Reference" )
        def writeNode( event ):
            
            cp = c.currentPosition()
            at = c.atFileCommands 
            c.fileCommands.assignFileIndices()
            at.write(cp.copy(),nosentinels=True,toString=True,scriptWrite=True)
            data = at.stringOutput
            
            jtf = self._GetReferenceName( jd, data )
            jtf.rmv_spot = jd.insertWidget( jtf )
            jtf.requestFocusInWindow()
            
            
        
        jm.actionPerformed = writeNode
        return jm
    #@-node:zorcanda!.20050416102246:getInsertNodeIntoShell
    #@+node:zorcanda!.20050416111601:getInsertReferenceIntoLeo
    def getInsertReferenceIntoLeo( self, jd ):
        
        jmi = swing.JMenuItem( "Insert Reference As Node" )
        
        def action( event ):
            
            jtf = self._GetReferenceAsObject( jd, self.c )
            jtf.rmv_spot = jd.insertWidget( jtf )
            jtf.requestFocusInWindow()
    
        jmi.actionPerformed = action
        return jmi
    #@nonl
    #@-node:zorcanda!.20050416111601:getInsertReferenceIntoLeo
    #@+node:zorcanda!.20050416170113:getRunNodeInPdb
    def getRunNodeInPdb( self, c, jd ):
        
        def runInPdb( event ):
            
            cp = c.currentPosition()
            name = cp.headString()
            name = name.split()[ 0 ]
            at = c.atFileCommands 
            c.fileCommands.assignFileIndices()
            at.write(cp.copy(),nosentinels=True,toString=True,scriptWrite=True)
            data = at.stringOutput
                    
            f = java.io.File.createTempFile( "leopdbrun", None )
            pw = java.io.PrintWriter( f )
            pw.println( "import pdb" )
            pw.println( "pdb.set_trace()" )
            for z in data.split( "\n" ):
                pw.println( z )            
            pw.close()
            f.deleteOnExit()       
            l = java.util.Vector()
            l.add( "execfile( '%s', globals(), locals())" % f.getAbsolutePath() )
            jd.processAsScript( l )
            
    
        return runInPdb      
    #@-node:zorcanda!.20050416170113:getRunNodeInPdb
    #@+node:zorcanda!.20051206141138:fireNodeAsScript
    def fireNodeAsScript( self, event, jd ):
    
        c = self.c        
        cp = c.currentPosition()    
        at = c.atFileCommands 
        c.fileCommands.assignFileIndices()
        at.write(cp.copy(),nosentinels=True,toString=True,scriptWrite=True)
        data = at.stringOutput.split( '\n' ) 
    
    
        l = java.util.Vector()
        for z in data:
            l.add( java.lang.String( z ) )
                
        jd.processAsScript( l )
    #@nonl
    #@-node:zorcanda!.20051206141138:fireNodeAsScript
    #@+node:zorcanda!.20050416103323:class _GetReferenceName
    class _GetReferenceName( swing.JTextField, aevent.KeyListener ):
        
        
        def __init__( self, jd, data ):
            swing.JTextField.__init__( self )
            self.jd = jd
            self.data = data
            border = self.getBorder()
            tborder = sborder.TitledBorder( border )
            tborder.setTitle( "Choose Reference Name:" )
            self.setBorder( tborder )
            self.addKeyListener( self )
            self.rmv_spot = None
        
        def keyPressed( self, event ):
            
            kc = event.getKeyChar();
            if kc == '\n':
                self.execute()
            elif java.lang.Character.isWhitespace( kc ):
                event.consume
                
        def execute( self ):
            
            self.jd.setReference( self.getText(), self.data )
            if self.rmv_spot:
                self.jd.remove( self.rmv_spot)
            self.jd.requestFocusInWindow()
            
        def keyTyped( self, event ):
            
            kc = event.getKeyChar()
            if kc == '\n': return
            elif java.lang.Character.isWhitespace( kc ):
                event.consume()
            
        def keyReleased( self, event ):
            
            kc = event.getKeyChar()
            if kc == '\n': return
            elif java.lang.Character.isWhitespace( kc ):
                event.consume()
                
                
    class _GetReferenceAsObject( _GetReferenceName ):
        
        def __init__( self, jd, c ):
            leoSwingMenu._GetReferenceName.__init__( self, jd, None )
            self.c = c
            border = self.getBorder()
            border.setTitle( "Which Reference To Insert:" )
            
            
        def execute( self ):
            
            ref = self.jd.getReference( self.getText() )
            if ref:
                self.c.beginUpdate()
                pos = self.c.currentPosition()
                npos = pos.insertAfter()
                npos.setHeadString( "Reference: %s" % self.getText() )
                npos.setTnodeText( str( ref ) )
                self.c.endUpdate()
            if self.rmv_spot:
                self.jd.remove( self.rmv_spot )
                      
    #@nonl
    #@-node:zorcanda!.20050416103323:class _GetReferenceName
    #@-others
    #@-node:zorcanda!.20050413144058:JythonShell stuff
    #@+node:zorcanda!.20050918160133:User Guide stuff
    def addUserGuide( self ):
        
        help = self.getMenu( 'Help' )
        c = self.c
        help.addSeparator()
        jmi = swing.JCheckBoxMenuItem( "View User Guide" )
        widgets = []
        def showUserGuide( event ):
            if jmi.getState() and not widgets:
                import leoSwingLeoTutorial
                lswlt = leoSwingLeoTutorial.leoSwingLeoTutorial()
                widget = lswlt.getWidget()
                widgets.append( widget )
                c.frame.body.addTab( "User Guide", widget )
            elif jmi.getState() and widgets:
                widget = widgets[ 0 ]
                c.frame.body.addTab( "User Guide", widget )
            else:
                widget = widgets[ 0 ]
                c.frame.body.removeTab( widget )
            
        
        jmi.actionPerformed = showUserGuide
        help.add( jmi )
    #@-node:zorcanda!.20050918160133:User Guide stuff
    #@+node:zorcanda!.20050813183925:createRecentFilesMenuItems (leoMenu)
    def createRecentFilesMenuItems (self):
        
        c = self.c ; frame = c.frame
        recentFilesMenu = self.getMenu("Recent Files...")
        
        # Delete all previous entries.
        if len( recentFilesMenu.getMenuComponents() ) != 0:
            deferable = lambda :self.delete_range(recentFilesMenu,0,len(c.recentFiles)+2)
            if not swing.SwingUtilities.isEventDispatchThread():
                dc = DefCallable( deferable )
                ft = dc.wrappedAsFutureTask()
                swing.SwingUtilities.invokeAndWait( ft )
            else:
                deferable()
        # Create the first two entries.
        table = (
            ("Clear Recent Files",None,c.clearRecentFiles),
            ("-",None,None))
        self.createMenuEntries(recentFilesMenu,table,init=True)
        
        # Create all the other entries.
        i = 3
        for name in c.recentFiles:
            def callback (event=None,c=c,name=name): # 12/9/03
                c.openRecentFile(name)
            label = "%d %s" % (i-2,g.computeWindowTitle(name))
            self.add_command(recentFilesMenu,label=label,command=callback,underline=0)
            i += 1
    #@nonl
    #@-node:zorcanda!.20050813183925:createRecentFilesMenuItems (leoMenu)
    #@+node:mork.20050127175441.29:oops
    def oops (self):
    
        print "leoMenu oops:", g.callerName(2), "should be overridden in subclass"
    #@nonl
    #@-node:mork.20050127175441.29:oops
    #@+node:mork.20050127175441.84:Must be overridden in menu subclasses
    #@+node:mork.20050127175441.85:9 Routines with Tk spellings
    def add_cascade (self,parent,label,menu,underline):
        
        menu.setText( label )
        
    def add_command (self,menu,**keys):
        
        if keys[ 'label' ] == "Open Python Window":
            keys[ 'command' ] = self.openJythonShell
        
        self.names_and_commands[ keys[ 'label' ] ] = keys[ 'command' ]
                  
        action = self.MenuRunnable( keys[ 'label' ], keys[ 'command' ], self.c, self.executor )
        jmenu = swing.JMenuItem( action )
        if keys.has_key( 'accelerator' ) and keys[ 'accelerator' ]:
            accel = keys[ 'accelerator' ]
            acc_list = accel.split( '+' )
            changeTo = { 'Alt': 'alt', 'Shift':'shift', #translation table
                         'Ctrl':'ctrl', 'UpArrow':'UP', 'DnArrow':'DOWN',
                         '-':'MINUS', '+':'PLUS', '=':'EQUALS',
                         '[':'typed [', ']':'typed ]', '{':'typed {',
                         '}':'typed }', 'Esc':'ESCAPE', '.':'typed .',
                          "`":"typed `", "BkSp":"BACK_SPACE"} #SEE java.awt.event.KeyEvent for further translations
            chg_list = []
            for z in acc_list:
                if z in changeTo:
                    chg_list.append( changeTo[ z ] )
                else:
                    chg_list.append( z )
            accelerator = " ".join( chg_list )
            ks = swing.KeyStroke.getKeyStroke( accelerator )
            if ks:
                self.keystrokes_and_actions[ ks ] = action
                jmenu.setAccelerator( ks )
            else:
                pass
        menu.add( jmenu )
        label = keys[ 'label' ]
        return jmenu
        
    def add_separator(self,menu):
        menu.addSeparator()
        
    def bind (self,bind_shortcut,callback):
        #self.oops() 
        pass
    
    def delete (self,menu,realItemName):
        self.oops()
        
    def delete_range (self,menu,n1,n2):
    
    
        items = menu.getMenuComponents()
        n3 = n1
        components = []
        while 1:
            if n3 == n2:
                break
            item = menu.getMenuComponent( n3 )
            components.append( item )
            n3 += 1
        
        for z in components:
            menu.remove( z )
            
    
    def destroy (self,menu):
        self.oops()
    
    def insert_cascade (self,parent,index,label,menu,underline):
        self.oops()
    
    def new_menu(self,parent,tearoff=0):
        jm = swing.JMenu( "1" )
        #jm = self.LeoMenu( "1" )
        parent.add( jm )
        #jm.setFont( self.font)
        return jm
    
    
    #@-node:mork.20050127175441.85:9 Routines with Tk spellings
    #@+node:mork.20050127175441.86:7 Routines with new spellings
    def createMenuBar (self,frame):
    
        top = frame.top
        self.defineMenuTables()
        topMenu = swing.JMenuBar()
        top.setJMenuBar( topMenu )
        topMenu.setFont( self.font )
        # Do gui-independent stuff.
        self.setMenu("top",topMenu)
        self.createMenusFromTables()
        self.createLeoSwingPrint()
        self.createPluginMenu()
        self.addUserGuide()
        
    def createOpenWithMenuFromTable (self,table):
        self.oops()
    
    def defineMenuCallback(self,command,name):
        return command
        
    def defineOpenWithMenuCallback(self,command):
        self.oops()
        
    def disableMenu (self,menu,name):
        for z in menu.getMenuComponents():
            if hasattr( z, "getText" ) and z.getText() == name:
                z.setEnabled( False )
        
    def enableMenu (self,menu,name,val):
        for z in menu.getMenuComponents():
            if hasattr( z, "getText" ) and z.getText() == name:
                z.setEnabled( bool( val ) )
        
    def setMenuLabel (self,menu,name,label,underline=-1, enabled = 1):
       
        item = ( menu, name, label, enabled )
        self.queue.offer( item )
        self.executor.submit( self.menu_changer )
        
    #@nonl
    #@-node:mork.20050127175441.86:7 Routines with new spellings
    #@+node:zorcanda!.20050515210514:class MenuRunnable
    class MenuRunnable( swing.AbstractAction, java.lang.Runnable): 
            
        def __init__( self, name, command, c , executor):
            swing.AbstractAction.__init__( self, name )
            self.command = command
            self.c = c
            self.name = name
            self.executor = executor
            
        def run( self ):
            self.c.doCommand( self.command, self.name ) #command()
                    
        def actionPerformed( self, aE ):
    
            #print self.command
            #if self.name == 'Save':
            self.executor.submit( self )
                    
            #else:        
            #    se
    #@nonl
    #@-node:zorcanda!.20050515210514:class MenuRunnable
    #@+node:zorcanda!.20050928162801:class MenuExecuteOnSelect
    class MenuExecuteOnSelect( sevent.MenuListener ):
        
        def __init__( self, method ):
            self.method = method
            
        def menuSelected( self, me ):
            self.method()
            
        def menuCanceled( self, me ):
            pass
            
        def menuDeselected( self, me ):
            pass
    #@nonl
    #@-node:zorcanda!.20050928162801:class MenuExecuteOnSelect
    #@+node:zorcanda!.20051017203637:class LeoMenu
    class LeoMenu( swing.JMenu ):
        
        def __init__( self, *args ):
            swing.JMenu.__init__( self, *args )
        
        def add( self, *items ):
            if hasattr( items[ 0 ], "setFont" ):
                items[ 0 ].setFont( self.getFont() )
            return self.super__add( *items )
            
    #@-node:zorcanda!.20051017203637:class LeoMenu
    #@-node:mork.20050127175441.84:Must be overridden in menu subclasses
    #@-others
#@nonl
#@-node:mork.20050127175441.2:class leoSwingMenu
#@-others
#@nonl
#@-node:mork.20050127175441.1:@thin leoSwingMenu.py
#@-leo
