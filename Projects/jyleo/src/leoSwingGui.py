
#@+leo-ver=4-thin
#@+node:mork.20050127125058.146:@thin leoSwingGui.py
#@@first

"""A module containing the base leoGui class.       

This class and its subclasses hides the details of which gui is actually being used.
Leo's core calls this class to allocate all gui objects.

Plugins may define their own gui classes by setting g.app.gui."""

import leoGlobals as g
#import leoFrame # for null gui.        
#import leoGui
from utilities.DefCallable import DefCallable
import java.awt.datatransfer as dtfr 
import java.awt as awt
import java.awt.event as aevent
import java.io 
import java.lang.System as jsys
import javax.swing as swing
import javax.swing.border as sborder
import javax.swing.event as sevent
import java.text as text
import java

True = 1
False = 0

class GCEveryOneMinute( java.lang.Thread ):
    
    def __init__( self ):
        java.lang.Thread.__init__( self )
        
    def run( self ):
        
        while 1:
            java.lang.System.gc()
            self.sleep( 60000 )

gct = GCEveryOneMinute()
gct.start()


#@+others
#@+node:mork.20050127125058.147:class leoSwingGui
class leoSwingGui:
    
    """The base class of all gui classes.
    
    Subclasses are expected to override all do-nothing methods of this class."""
    

    
    #@    @+others
    #@+node:mork.20050127125058.148:app.gui Birth & death
    #@+node:mork.20050127125058.149: leoGui.__init__
    def __init__ (self):
        
        # g.trace("leoGui",guiName)
        #leoGui.leoGui.__init__( self, "swing" )
        self.leoIcon = None
        self.mGuiName = "swing"
        self.mainLoop = None
        self.root = None
        self.utils = None
        self.isNullGui = False
        self.ex = java.util.concurrent.Executors.newSingleThreadScheduledExecutor()
        self.startup_tasks = java.util.ArrayList()
        self.laflistener = self.LAFChangeListener()
        swing.UIManager.addPropertyChangeListener( self.laflistener )
    #@-node:mork.20050127125058.149: leoGui.__init__
    #@+node:mork.20050127125058.150:newLeoCommanderAndFrame (gui-independent)
    def newLeoCommanderAndFrame(self,fileName, updateRecentFiles = True):
        
        """Create a commander and its view frame for the Leo main window."""
        
        import leoCommands
        
        if not fileName: fileName = ""
        #@    << compute the window title >>
        #@+node:mork.20050127125058.151:<< compute the window title >>
        # Set the window title and fileName
        if fileName:
            title = g.computeWindowTitle(fileName)
        else:
            s = "untitled"
            n = g.app.numberOfWindows
            if n > 0:
                s += str(n)
            title = g.computeWindowTitle(s)
            g.app.numberOfWindows = n+1
        
        #@-node:mork.20050127125058.151:<< compute the window title >>
        #@nl
    #@+at
    #     if not splashseen:
    #         #self.splash = splash = swing.JWindow()
    #         #splash.setBackground( awt.Color.ORANGE )
    #         #dimension = awt.Dimension( 500, 500 )
    #         #splash.setPreferredSize( dimension )
    #         #splash.setSize( 500, 500 )
    #         #ii = swing.ImageIcon( "../Icons/Leosplash.GIF" )
    #         #image = swing.JLabel( ii )
    #         #image.setBackground( awt.Color.ORANGE )
    #         #splash.add( image )
    #         #self.splashlabel = swing.JLabel( "BORKERS ar fUN" )
    #         #splash.add( self.splashlabel, awt.BorderLayout.SOUTH )
    #         w, h = self._calculateCenteredPosition( splash )
    #         splash.setLocation( w, h )
    #         splash.visible = True
    #@-at
    #@@c
        # Create an unfinished frame to pass to the commanders.
        class Create( java.util.concurrent.Callable ):
            
            def call( self ):
                frame = g.app.gui.createLeoFrame(title)
                c = leoCommands.Commands( frame, fileName )
                frame.finishCreate( c )
                return c, frame
        
        creator = java.util.concurrent.FutureTask( Create() )
        java.awt.EventQueue.invokeAndWait( creator )
        c, frame = creator.get()
        self.c = c       
        # Create the commander and its subcommanders.
        #self.c = c = leoCommands.Commands(frame,fileName)
        
        # Finish creating the frame
        
        
        
        #frame.finishCreate(c)
        
        # Finish initing the subcommanders.
        #c.undoer.clearUndoState() # Menus must exist at this point.
        
        #c.updateRecentFiles(fileName) # 12/01/03
        c.undoer.clearUndoState() # Menus must exist at this point.
        
        if updateRecentFiles:
            c.updateRecentFiles(fileName)
        
        g.doHook("after-create-leo-frame",c=c)
        return c,frame
    #@nonl
    #@-node:mork.20050127125058.150:newLeoCommanderAndFrame (gui-independent)
    #@+node:mork.20050127125058.152:stubs
    #@+node:mork.20050127125058.153:createRootWindow
    def createRootWindow(self):
    
        """Create the hidden root window for the gui.
        
        Nothing needs to be done if the root window need not exist."""
    
        jf = swing.JFrame()
        return jf
        
        
    #@-node:mork.20050127125058.153:createRootWindow
    #@+node:mork.20050127125058.154:destroySelf
    def destroySelf (self):
    
        #self.oops()
        pass
    #@nonl
    #@-node:mork.20050127125058.154:destroySelf
    #@+node:mork.20050127125058.155:finishCreate
    def finishCreate (self):
    
        """Do any remaining chores after the root window has been created."""
        #pass
        #self.c.frame.setTitle( self.c.mFileName )
        pass
        
        
    #@-node:mork.20050127125058.155:finishCreate
    #@+node:mork.20050127125058.156:killGui
    def killGui(self,exitFlag=True):
    
        """Destroy the gui.
        
        The entire Leo application should terminate if exitFlag is True."""
    
        pass
    #@nonl
    #@-node:mork.20050127125058.156:killGui
    #@+node:mork.20050127125058.157:recreateRootWindow
    def recreateRootWindow(self):
    
        """Create the hidden root window of the gui
        after a previous gui has terminated with killGui(False)."""
    
        pass
    #@nonl
    #@-node:mork.20050127125058.157:recreateRootWindow
    #@+node:mork.20050127125058.158:runMainLoop
    def runMainLoop(self):
        """Run the gui's main loop."""
        
        def rml():
            self.c.frame.tree.doneLoading()
            self.c.frame.top.visible = True
            self.c.frame.jsp1.setDividerLocation( .75 )
            self.c.frame.jsp2.setDividerLocation( .5 )
            self.c.selectPosition( self.c.currentPosition() )
            self.c.frame.body.editor.editor.setCaretPosition( 0 ) #otherwise the caret is at the end, yuck.
            dc = DefCallable( self.ex.shutdown )
            self.startup_tasks.add( dc )
            for z in self.startup_tasks:
                self.ex.submit( z )
            
            def hide():
                splash.hide()
            dc = DefCallable( hide )
            ft = dc.wrappedAsFutureTask()
            java.awt.EventQueue.invokeLater( ft )
                
            
        dc = DefCallable( rml )
        ft = dc.wrappedAsFutureTask()    
        java.awt.EventQueue.invokeLater( ft )
        
    #@-node:mork.20050127125058.158:runMainLoop
    #@-node:mork.20050127125058.152:stubs
    #@+node:orkman.20050201205818:outputToSplash
    #@-node:orkman.20050201205818:outputToSplash
    #@-node:mork.20050127125058.148:app.gui Birth & death
    #@+node:mork.20050127125058.159:app.gui dialogs
    def runAboutLeoDialog(self,version,theCopyright,url,email):
        """Create and run Leo's About Leo dialog."""
        dialog = self._getDialog( "About Leo" )
        cpane = dialog.getContentPane()
        data = "%s\n%s\n\n%s\n\n%s" % ( version, theCopyright, url, email )
        jtc = swing.JTextArea()
        jtc.setText( data )
        jtc.setEditable( False )
        dialog.add( jtc )
        class cl_act( swing.AbstractAction ):
            def __init__( self, dialog ):
                swing.AbstractAction.__init__( self, "Close" )
                self.dialog = dialog
            
            def actionPerformed( self, aE ):
                self.dialog.dispose()
        button = swing.JButton( cl_act( dialog ) )
        jbp = swing.JPanel()
        jbp.add( button )
        dialog.add( jbp, awt.BorderLayout.SOUTH )
        dialog.pack()
        w, h = self._calculateCenteredPosition( dialog )
        dialog.setLocation( w, h )
        dialog.setAlwaysOnTop( 1 )
        dialog.visible = 1
        
    def runAskLeoIDDialog(self):
        """Create and run a dialog to get g.app.LeoID."""
        message = (
            "leoID.txt not found\n\n" +
            "Please enter an id that identifies you uniquely.\n" +
            "Your cvs login name is a good choice.\n\n" +
            "Your id must contain only letters and numbers\n" +
            "and must be at least 3 characters in length.") 
            
        dialog = swing.JDialog()
        dialog.title = "Create a Leo ID"
        dialog.modal = 1
        cpane = dialog.getContentPane()
        jta = swing.JTextArea()
        jta.setText( message )
        jta.editable = 0
        cpane.add( jta, awt.BorderLayout.NORTH )
        jtf = swing.JTextField()
        jp = swing.JPanel()
        jp.setBorder( sborder.TitledBorder( "Your ID:" ) )
        gbl = awt.GridBagLayout()
        jp.setLayout( gbl )
        gbc = awt.GridBagConstraints()
        gbc.fill = 1
        gbc.weightx =1
        gbc.weighty = 1
        gbl.setConstraints( jtf, gbc )
        jp.add( jtf )
        cpane.add( jp, awt.BorderLayout.CENTER )
        class _OK( swing.AbstractAction ):
            def __init__( self ):
                swing.AbstractAction.__init__( self, "OK" )
                
            def actionPerformed( self, ae ):
                dialog.dispose()
        jb = swing.JButton( _OK()  )
        
        jb.setEnabled( False )
        jpanel2 = swing.JPanel()
        jpanel2.add(jb )
        cpane.add( jpanel2, awt.BorderLayout.SOUTH )
        class _Enabler( sevent.DocumentListener ):
            
            def __init__( self ):
                pass
                
            def changedUpdate( self, de ):
                pass
                
            def insertUpdate( self, de ):
                
                l = de.getDocument().getLength()
                if l >= 3: jb.setEnabled( True )
                
            def removeUpdate( self, de ):
                
                l = de.getDocument().getLength()
                if l <3: jb.setEnabled( False )
        jtf.getDocument().addDocumentListener( _Enabler() )       
        dialog.pack()
        w, h = self._calculateCenteredPosition( dialog )
        dialog.setLocation( w, h )
        dialog.setAlwaysOnTop( 1 )
        splash.toBack()
        dialog.visible = 1
        g.app.leoID = jtf.getText()
        splash.toFront()
    
    def runAskOkDialog(self,title,message=None,text="Ok"):
        """Create and run an askOK dialog ."""
        self.oops()
    
    def runAskOkCancelNumberDialog(self,title,message):
        """Create and run askOkCancelNumber dialog ."""
        dialog = self._getDialog( title )
        cpane = dialog.getContentPane()
        holder = swing.JPanel()
        gbl = awt.GridBagLayout()
        holder.setLayout( gbl )
        gbc = awt.GridBagConstraints()
        gbc.fill = 1
        gbc.weightx = 1
        gbc.weighty = 1
        jtf = swing.JTextField()
        gbl.setConstraints( jtf, gbc )
        holder.add( jtf )
        tborder = sborder.TitledBorder( message )
        holder.setBorder( tborder )
        cpane.add( holder )
        class _Search( swing.AbstractAction ):
            source = None
            def __init__( self, dialog, message ):
                swing.AbstractAction.__init__( self, message )
                self.dialog= dialog
                self.message = message
                
            def actionPerformed( self, ae ):
                _Search.source = ae.getSource()
                self.dialog.dispose()
        
        jb = swing.JButton( _Search( dialog, "Ok" ) )
        jb2 = swing.JButton( _Search( dialog, "Cancel" ) )
        class _Enter( aevent.ActionListener ):
            def __init__( self, ok_but ):
                self.ok_but = ok_but
                
            def actionPerformed( self, aE ):
                _Search.source = self.ok_but
                dialog.dispose()
                
        jtf.addActionListener( _Enter( jb ) )
        class _AcceptOnlyNumbers( aevent.KeyAdapter ):
            
            def __init__( self  ):
                aevent.KeyAdapter.__init__( self )
                self.consume = False
                
            def keyPressed( self, ke ):
                
                kc = ke.getKeyCode()
                if kc in ( ke.VK_ENTER, ke.VK_BACK_SPACE ): return
                c = ke.getKeyChar()
                if not java.lang.Character.isDigit( c ):
                    self.consume = True 
                    ke.consume()
                
            def keyReleased( self, ke ):
                if self.consume:
                    self.consume = False
                    ke.consume()
                    
            def keyTyped( self, ke ):
                if self.consume:
                    ke.consume()
                
        jtf.addKeyListener( _AcceptOnlyNumbers() )
        bottom = swing.JPanel()
        bottom.add( jb, awt.BorderLayout.WEST )
        bottom.add( jb2, awt.BorderLayout.EAST )
        cpane.add( bottom, awt.BorderLayout.SOUTH )
        dialog.pack()
        w, h = self._calculateCenteredPosition( dialog )
        dialog.setLocation( w, h )
        dialog.setAlwaysOnTop( 1 )
        dialog.setVisible( True )
        if _Search.source is jb:
            return int( jtf.getText() )
        else:
            return -1
    
    def runAskYesNoDialog(self,title,message=None):
        """Create and run an askYesNo dialog."""
        self.oops()
    
    def runAskYesNoCancelDialog(self,title,
        message=None,yesMessage="Yes",noMessage="No",defaultButton="Yes"):
        """Create and run an askYesNoCancel dialog ."""
    
        dialog = self._getDialog( title )
        class yno( swing.AbstractAction ):
            
            source = None
            def __init__( self, dialog, name ):
                swing.AbstractAction.__init__( self, name )
                self.dialog = dialog
                
            def actionPerformed( self, aE ):
                yno.source = aE.getSource()
                self.dialog.dispose()
                
        cpane = dialog.getContentPane()
        cpane.add( swing.JLabel( message ), awt.BorderLayout.NORTH )
        jp = swing.JPanel()
        cpane.add( jp, awt.BorderLayout.SOUTH )
        
        yes = swing.JButton( yno( dialog, yesMessage ) )
        no = swing.JButton( yno( dialog, noMessage ) )
        cancel = swing.JButton( yno( dialog, "Cancel" ) )
        jp.add( yes )
        jp.add( no )
        jp.add( cancel )
        dialog.pack()
        w, h = self._calculateCenteredPosition( dialog )
        dialog.setLocation( w, h )
        dialog.setAlwaysOnTop( 1 )
        dialog.setVisible( True )
        if yno.source is yes:
            return 'yes'
        elif yno.source is no:
            return 'no'
        elif yno.source is cancel:
            return "cancel"
        else:
            if defaultButton == 'Yes': return 'yes'
            else: return 'cancel'
            
    def _getDialog( self, title ):
        
        jdialog = swing.JDialog( self.c.frame.top, title, True )
        jdialog.getContentPane().setName( "Leodialog" )
        return jdialog
        
    def _getScreenPositionForDialog( self ):
    
        #tk = self.c.frame.top.getToolkit()
        tk = awt.Toolkit.getDefaultToolkit()
        dim = tk.getScreenSize()
        h = dim.height/2
        w = dim.width/2
        return h, w
        
    def _calculateCenteredPosition( self, widget ):
    
        size = widget.getPreferredSize()
        height = size.height/2
        width = size.width/2
        h,w = self._getScreenPositionForDialog()
        height = h - height
        width = w - width
        return width, height
    
        
            
        
    #@nonl
    #@-node:mork.20050127125058.159:app.gui dialogs
    #@+node:mork.20050127125058.160:app.gui file dialogs
    class FileTypesFilter( swing.filechooser.FileFilter ):
        def __init__( self, filetypes ):
            swing.filechooser.FileFilter.__init__( self )
            self.filetypes = filetypes
            
        def accept( self, fvar ):
            name = fvar.getName()
            ftype = self.filetypes[ 1 ]
            ftype = ftype.strip( "*" )
            if name.endswith( ftype ): return True
            return False
        
        def getDescription( self ):
            return self.filetypes[ 0 ]
    
    
    def runOpenFileDialog(self,title,filetypes,defaultextension,multiple=False):
    
        """Create and run an open file dialog ."""
    
        import os
        fd = swing.JFileChooser( os.getcwd() )
        if filetypes:
            for x in fd.getChoosableFileFilters():
                fd.removeChoosableFileFilter( x )
        if filetypes:
            first = None
            for z in filetypes:
                filter = self.FileTypesFilter( z )
                if first is None: first = filter
                fd.addChoosableFileFilter( filter )
            if first:
                fd.setFileFilter( first )
        ok = fd.showOpenDialog( None )
        if ok == fd.APPROVE_OPTION:
            f = fd.getSelectedFile()
            st = f.toString()
            if multiple:
                st = ( st , )
            return st
        
    
    def runSaveFileDialog(self,initialfile,title,filetypes,defaultextension):
    
        """Create and run a save file dialog ."""
        import os
        #self.oops()
        fd = swing.JFileChooser( os.getcwd() )
        if filetypes:
            for x in fd.getChoosableFileFilters():
                fd.removeChoosableFileFilter( x )
        if filetypes:
            first = None
            for z in filetypes:
                filter = self.FileTypesFilter( z )
                if first is None: first = filter
                fd.addChoosableFileFilter( filter )
            if first:
                fd.setFileFilter( first )
        ok = fd.showSaveDialog( None )
        if ok == fd.APPROVE_OPTION:
            f = fd.getSelectedFile()
            st = f.toString()
            if not st.endswith( defaultextension ):
                st = st + defaultextension
            return st
    #@nonl
    #@-node:mork.20050127125058.160:app.gui file dialogs
    #@+node:mork.20050127125058.161:app.gui panels
    def createColorPanel(self,c):
        """Create Color panel."""
        self.oops()
        
    def createComparePanel(self,c):
        """Create Compare panel."""
        import leoSwingComparePanel
        return leoSwingComparePanel.leoSwingComparePanel( c )
        
        
    def createFindPanel(self):
        """Create a hidden Find panel."""
        self.oops()
    
    def createFontPanel(self,c):
        """Create a Font panel."""
        self.oops()
        
    def createLeoFrame(self,title):
        """Create a new Leo frame."""
        import leoSwingFrame
        lsf = leoSwingFrame.leoSwingFrame( self )
        return lsf
        
    def createPrefsPanel(self,c):
        """Create a Prefs panel."""
        return swing.JFrame()
    #@-node:mork.20050127125058.161:app.gui panels
    #@+node:mork.20050127125058.162:app.gui utils
    #@+at 
    #@nonl
    # Subclasses are expected to subclass all of the following methods.
    # 
    # These are all do-nothing methods: callers are expected to check for None 
    # returns.
    # 
    # The type of commander passed to methods depends on the type of frame or 
    # dialog being created.  The commander may be a Commands instance or one 
    # of its subcommanders.
    #@-at
    #@nonl
    #@+node:mork.20050127125058.163:Clipboard
    class cBoardOwner( dtfr.ClipboardOwner ):
    
    
        def lostOwnership( self, clipboard, contents ):
            pass
            
            
    
    class LeoTransferable( dtfr.Transferable ): 
        '''This class exists primarily so that the system can detect when a valid
           leoxml tree has been placed in the system clipboard.  It enables the enabling/disabling
           of "paste node"'''
        def __init__( self, data, dataflavor ):
            
            self.data = data
            self.dataflavors = [ dtfr.DataFlavor.stringFlavor ]
            if dataflavor:
                self.dataflavors.append( dtfr.DataFlavor( dataflavor ) )
            self.dataflavor = dataflavor
        
        def getTransferData( self, dflavor ):
            
            if dflavor.getRepresentationClass() == java.lang.String:
                return java.lang.String( self.data )
            elif dflavor.getRepresentationClass() == java.io.InputStream:
                ba = java.lang.String( self.data ).getBytes()
                return java.io.ByteArrayInputStream( ba )
        
        def getTransferDataFlavors( self ):
            return self.dataflavors 
            
        def isDataFlavorSupported( self, flavor ):
            
            if flavor == dtfr.DataFlavor.stringFlavor: return True
            elif str( flavor.getMimeType() ) == self.dataflavor: return True
            return False    
    
    
    def replaceClipboardWith (self,s, dflavor = None):
        
        #tk = self.c.frame.top.getToolkit()
        tk = java.awt.Toolkit.getDefaultToolkit()
        cp = tk.getSystemClipboard()
        cBO = self.cBoardOwner()
        #ss = dtfr.StringSelection( s )
        ss = self.LeoTransferable( s, dflavor )
        cp.setContents( ss, cBO )
        
    
    def getTextFromClipboard (self):
        
        #tk = self.c.frame.top.getToolkit()
        tk = java.awt.Toolkit.getDefaultToolkit()
        cp = tk.getSystemClipboard()
        contents = cp.getContents( self )
        dflavor = dtfr.DataFlavor.selectBestTextFlavor( contents.getTransferDataFlavors() )
        if not dflavor:
            return None
        reader = dflavor.getReaderForText( contents )
        breader = java.io.BufferedReader( reader )
        txt = []
        try:
            while 1:
                stxt = breader.readLine()
                if stxt != None:
                    txt.append( stxt )
                else:
                    return '\n'.join( txt )
        except:
            return '\n'.join( txt )
    
    
        
        
    #@-node:mork.20050127125058.163:Clipboard
    #@+node:mork.20050127125058.164:Dialog utils
    def attachLeoIcon (self,window):
        """Attach the Leo icon to a window."""
        
        sicon = g.os_path_join( g.app.loadDir,"..","Icons","Leoapp.GIF")
        #ii = swing.ImageIcon( "../Icons/Leosplash.GIF" )
        ii = swing.ImageIcon( sicon )
        window.setIconImage( ii.getImage() )
        
    def center_dialog(self,dialog):
        """Center a dialog."""
        spot = self._calculateCenteredPosition( dialog )
        dialog.setLocation( spot[ 0 ], spot[ 1 ] )
            
    def create_labeled_frame (self,parent,caption=None,relief="groove",bd=2,padx=0,pady=0):
        """Create a labeled frame."""
        
        w = swing.JPanel()
        parent.add( w )
        if caption:
            border = w.getBorder()
            tborder = sborder.TitledBorder( border )
            tborder.setTitle( caption )
            w.setBorder( tborder )
        
        sl = swing.SpringLayout()
        w.setLayout( sl )
        f = swing.JPanel()
        w.add( f )
        sl.putConstraint( sl.NORTH, f, 5, sl.NORTH, w )
        sl.putConstraint( sl.WEST, f, 5, sl.WEST, w )
        sl.putConstraint( sl.SOUTH, w, 5, sl.SOUTH, f )
        sl.putConstraint( sl.EAST, w, 5, sl.EAST, f )
        
        return w, f
        
        
    def get_window_info (self,window):
        """Return the window information."""
        self.oops()
    
    #@-node:mork.20050127125058.164:Dialog utils
    #@+node:mork.20050127125058.165:Font
    def getFontFromParams(self,family,size,slant,weight,defaultSize=12):
        
        pass
        # self.oops()
    #@nonl
    #@-node:mork.20050127125058.165:Font
    #@+node:mork.20050127125058.166:Focus
    def get_focus(self,frame):
    
        """Return the widget that has focus, or the body widget if None."""
    
        self.oops()
            
    def set_focus(self,commander,widget):
    
        """Set the focus of the widget in the given commander if it needs to be changed."""
    
        widget.requestFocusInWindow()
    #@nonl
    #@-node:mork.20050127125058.166:Focus
    #@+node:mork.20050127125058.167:Index
    def firstIndex (self):
    
        self.oops()
        
    def lastIndex (self):
    
        self.oops()
        
    def moveIndexForward(self,t,index,n):
    
        self.oops()
        
    def moveIndexToNextLine(self,t,index):
    
        self.oops()
    #@nonl
    #@-node:mork.20050127125058.167:Index
    #@+node:mork.20050127125058.168:Idle time
    def setIdleTimeHook (self,idleTimeHookHandler,*args,**keys):
        
        pass # Not an error.
        
    def setIdleTimeHookAfterDelay (self,delay,idleTimeHookHandler,*args,**keys):
        
       pass # Not an error.
    #@-node:mork.20050127125058.168:Idle time
    #@-node:mork.20050127125058.162:app.gui utils
    #@+node:mork.20050127125058.169:guiName
    def guiName(self):
        
        try:
            return self.mGuiName
        except:
            return "invalid gui name"
    #@nonl
    #@-node:mork.20050127125058.169:guiName
    #@+node:mork.20050127125058.170:oops
    def oops (self):
        
        print "leoGui oops", g.callerName(2), "should be overridden in subclass"
    #@nonl
    #@-node:mork.20050127125058.170:oops
    #@+node:orkman.20050201170707:insertPoints --had to be added
    def getInsertPoint( self, t ):
        
        return t.getCaretPosition()
        
        
    def setInsertPoint( self, t, pos ):
        #pass
        #return t.setCaretPosition( pos )
        t.setCaretPosition( pos )
        
    def getSelectionRange( self, t ):
        
        s = t.getSelectedText()
        s = "%s" % s
        return s
        
    def setTextSelection( self, t, start, end ):
        
        t.setSelectionStart( start )
        t.setSelectionEnd( end )
        
    def setSelectionRange(  self, t, n1, n2 ):
        return g.app.gui.setTextSelection( t, n1, n2 )
        
        
    def getTextSelection( self, t ):
        
        
        return ( t.getSelectionStart(), t.getSelectionEnd() )
    #@nonl
    #@-node:orkman.20050201170707:insertPoints --had to be added
    #@+node:orkman.20050202123406:makeIndexVisible --had to be added
    def makeIndexVisible(self,t,index):
    
        print t
        print index
        #return t.see(index) 
    #@nonl
    #@-node:orkman.20050202123406:makeIndexVisible --had to be added
    #@+node:orkman.20050202124416:moveIndexForward & moveIndexToNextLine -- had to be added
    def moveIndexForward(self,t,index,n):
        
        t = self.c.frame.body.editor.editor 
        #print index
        #print n
        #print t
        t.setCaretPosition( index[ 1 ] )
        #newpos = t.index("%s+%dc" % (index,n))
        if len( t.getText() ) <= ( index[ 1 ] ): return None
        else:
            return index[ 1 ]
        #return g.choose(t.compare(newpos,"==","end"),None,newpos)
        
    def moveIndexToNextLine(self,t,index):
        pass
        #newpos = t.index("%s linestart + 1lines" % (index))
        
        #return g.choose(t.compare(newpos,"==","end"),None,newpos)
    #@nonl
    #@-node:orkman.20050202124416:moveIndexForward & moveIndexToNextLine -- had to be added
    #@+node:zorcanda!.20050528212439:addStartupTask
    def addStartupTask( self, task ):
        '''Adds a task to the collection of tasks that are
           executed upon startup'''
        
        self.startup_tasks.add( task )
        
    #@nonl
    #@-node:zorcanda!.20050528212439:addStartupTask
    #@+node:zorcanda!.20050307153748:getFontFromParams
    def getFontFromParams( self, family,size,slant,weight):
        
        #print family, size, slant, weight
        
        if size in ( 'None', None ):
            size = 12
        else:
            size = int( size )
            
        if weight in ( 'None', None):
            weight = awt.Font.PLAIN
        else:
            weight = weight
            weights = weight.split( "and" )
            nweight = None
            for z in weights:
                z = z.strip()
                #print z
                if not hasattr( awt.Font, z ): continue
                w2 = getattr( awt.Font, z )
                if nweight:
                    nweight = nweight|w2
                else:
                    nweight = w2
            weight = nweight
            
        if family in ( 'None', None ):
            family = 'Helvetica'
        else:
            #family = family[ 1 ]
            pass
            
        #print family, size, slant, weight    
        f = awt.Font( family, weight, size )
        return f    
        
    #@-node:zorcanda!.20050307153748:getFontFromParams
    #@+node:zorcanda!.20050530115036:Look And Feel Changes
    #@+others
    #@+node:zorcanda!.20050530113917:addLAFListener
    def addLAFListener( self, component ):
        self.laflistener.addComponent( component )
        
    #@-node:zorcanda!.20050530113917:addLAFListener
    #@+node:zorcanda!.20050530112830:class LAFChangeListener
    class LAFChangeListener( java.beans.PropertyChangeListener ):
        
        def __init__( self ):
            self.changers = []
            
        
        def addComponent( self, component ):
            ref = java.lang.ref.WeakReference( component )
            self.changers.append( ref )
            
        def propertyChange( self, event ):
            if event.getPropertyName() == 'lookAndFeel':
                for z in self.changers:
                    component = z.get()
                    if component:
                        swing.SwingUtilities.updateComponentTreeUI( component )
    #@nonl
    #@-node:zorcanda!.20050530112830:class LAFChangeListener
    #@-others
    #@-node:zorcanda!.20050530115036:Look And Feel Changes
    #@+node:zorcanda!.20050331121405:had to be added
    #@+others
    #@+node:zorcanda!.20050331121405.1:replaceSelectionRangeWithText
    def replaceSelectionRangeWithText( self, t, start, end, change ):
        
    
        if t:
            doc = t.getDocument()
            doc.replace( start, end - start, change, None )
        
    
    #@-node:zorcanda!.20050331121405.1:replaceSelectionRangeWithText
    #@+node:zorcanda!.20050331121606:setSelectionRangeWithLength
    def setSelectionRangeWithLength( self, t, start, length ):
        
        
        if t:
            t.setSelectionStart( start )
            t.setSelectionEnd( start + length )
    #@-node:zorcanda!.20050331121606:setSelectionRangeWithLength
    #@+node:zorcanda!.20050404103735:compareIndices
    def compareIndices( self, st, pos, which, pos2 ):
        
        if which == '>':
            
            return int( pos ) > int( pos2 )
            
        elif which == '<':
            
            return int( pos ) < int( pos2 )
        
    #@-node:zorcanda!.20050404103735:compareIndices
    #@+node:zorcanda!.20050404104003:getAllText
    def getAllText( self,st ):
        
        print st
        doc = st.getDocument()
        return doc.getText( 0, doc.getLength() )
    #@nonl
    #@-node:zorcanda!.20050404104003:getAllText
    #@-others
    #@-node:zorcanda!.20050331121405:had to be added
    #@-others
#@-node:mork.20050127125058.147:class leoSwingGui
#@+node:orkman.20050201210431:splash
class LeoSplash( java.lang.Runnable ):
    
    def run( self ):
        self.splash = splash = swing.JWindow()
        splash.setAlwaysOnTop( 1 )
        cpane = splash.getContentPane()
        rp = splash.getRootPane()
        tb = sborder.TitledBorder( "Leo" )
        tb.setTitleJustification( tb.CENTER )
        rp.setBorder( tb )
        splash.setBackground( awt.Color.ORANGE )
        dimension = awt.Dimension( 400, 400 )
        splash.setPreferredSize( dimension )
        splash.setSize( 400, 400 )
        
        sicon = g.os_path_join( g.app.loadDir ,"..","Icons","Leosplash.GIF")
        #ii = swing.ImageIcon( "../Icons/Leosplash.GIF" )
        ii = swing.ImageIcon( sicon )
        image = swing.JLabel( ii )
        image.setBackground( awt.Color.ORANGE )
        cpane.add( image )
        self.splashlabel = splashlabel = swing.JLabel( "Leo Starting...." )
        splashlabel.setBackground( awt.Color.ORANGE )
        splashlabel.setForeground( awt.Color.BLUE )
        cpane.add( splashlabel, awt.BorderLayout.SOUTH )
        w, h = self._calculateCenteredPosition( splash )
        splash.setLocation( w, h )
        splash.visible = True
        
    def _calculateCenteredPosition( self, widget ):

        size = widget.getPreferredSize()
        height = size.height/2
        width = size.width/2
        h,w = self._getScreenPositionForDialog()
        height = h - height
        width = w - width
        return width, height
        
    def _getScreenPositionForDialog( self ):

        #tk = self.c.frame.top.getToolkit()
        tk = awt.Toolkit.getDefaultToolkit()
        dim = tk.getScreenSize()
        h = dim.height/2
        w = dim.width/2
        return h, w   
        
    def setText( self, text ):  
        self.splashlabel.setText( text )
    
    def hide( self ):
        self.splash.visible = 0
        
    def toBack( self ):
        if self.splash.visible:
            self.splash.toBack()
    
    def toFront( self ):
        if self.splash.visible:
            self.splash.setAlwaysOnTop( 1 )
            self.splash.toFront()
    
    def isVisible( self ):
        return self.splash.visible
        
splash = LeoSplash()
java.awt.EventQueue.invokeAndWait( splash )
#@nonl
#@-node:orkman.20050201210431:splash
#@-others
#@nonl
#@-node:mork.20050127125058.146:@thin leoSwingGui.py
#@-leo
