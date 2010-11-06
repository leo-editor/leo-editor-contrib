#@+leo-ver=4-thin
#@+node:zorcanda!.20050924193446:@thin Chapters.py
from __future__ import generators
import java
import java.awt as awt
import java.awt.event as aevent
import javax.swing as swing
import javax.swing.event as sevent
import javax.swing.tree as stree
import java.util.concurrent.locks as locks
import leoNodes
import leoGlobals as g
import leoSwingUndo
import javax.swing.undo as undo
from utilities.DefCallable import DefCallable
from utilities.Phaser import Phaser
from utilities.Slider import Slider
from leoSwingFrame import leoSwingTree


class Chapters( sevent.ChangeListener ):
    
    def __init__( self, c ):
        
        self.c = c
        self.book = None
        path = g.os_path_join( g.app.loadDir,"..","Icons", "x.png" )
        self.icon = swing.ImageIcon( path )
        self.popup = self.ChaptersPopup( self )
        self.chapters = {}
        self.trees_chapters = {}
        self.current_chapter = self.Chapter()
        self.chapterlist = []
        #let's skip adding the first chapter
        #self.chapterlist.append( self.current_chapter )
        self.current_chapter.setUndoer( leoSwingUndo.leoSwingUndo( c ) )
        self.updateLock = locks.ReentrantLock() #this increase by 1 for each lock call. -1 for each unlock.  If it becomes 0, the lock is released
        self.chaptersIterationBlocked = 0
        self.chaptersundoer = undo.UndoManager()
        self.chaptersPromptingForRemove = False
        
    
    def getChapter( self ):
        return self.current_chapter
    
    def startPromptingForRemove( self ):
        self.chaptersPromptingForRemove = True
        
    def stopPromptingForRemove( self ):
        self.chaptersPromptingForRemove = False
    
    def isPromptingForRemove( self ):
        return self.chaptersPromptingForRemove
    
    
    
    def disablePopup( self ):
        self.popup.disable()
        
    def enablePopup( self ):
        self.popup.enable()
    
    def beginUpdate( self ):
        self.updateLock.lock()
        
    def endUpdate( self ):
        self.updateLock.unlock()
    
    def getWidget( self ):
        if self.book is None: # We defer creating until here because otherwise the book variable might miss a L&F change
            self.book = swing.JTabbedPane()
            self.book.addMouseListener( self.popup )
            ssm = self.book.getModel()
            ssm.addChangeListener( self )
        return self.book
        
    def getSelectedChapter( self ):
        return self.current_chapter
    
    def getSelectedChapterWidget( self ):
        
        return self.book.getSelectedComponent()
    
    #@    @+others
    #@+node:zorcanda!.20051212152956:What are Chapters?
    #@+at
    # Chapters simply put are multiple Outlines within the Leo instance.  The 
    # definition doesn't stop there though since having more than one Outline 
    # defines an interaction model between these Outlines.  It is better to 
    # think of it like so:
    #     An Outline is composed of at least 1 Chapter.
    #     A writen Outline with multiple Chapters should be indistinguishable 
    # from an Outline with one Chapter.  The only mark is that the roots will 
    # have a uA marking them as belonging to a specific Chapter.
    #     So at read time, the Outline is read in then broken into its 
    # separate Chapters.
    #     At write time, the Outline is reconstituted as one Outline during 
    # output.  The reunification is only realised on disk.  Internally we use 
    # magic unfication iterators that give the write process a sense that it 
    # is writing one outline.  These special iterators mean that there is a 
    # low impact upon the write code.  Much of it has stayed the same except 
    # that it now uses a different iterator.
    #@-at
    #@-node:zorcanda!.20051212152956:What are Chapters?
    #@+node:zorcanda!.20051211163618:Things A Developer should know about Chapters
    #@+at
    # Observation 1: Do not start a beginUpdate in one chapter and finish it 
    # with a endUpdate in another chapter.  You will lose your ability to work 
    # with the outline/chapter where the beginUpdate started.  I have seen 
    # this happen, so let this be a warning to you.  I guess a protective fix 
    # against this would be to keep track of which chapter an endUpdate 
    # belongs to.  Hence doing a beginUpdate in one chapter followed by and 
    # endUpdate in another chapter would target the first chapter.  Im unsure 
    # if this would work, but it is a thought that may make the implementation 
    # more robust.
    # 
    # Observation 2: root positions should not become stale.  Since we 
    # aggresively copy everytime the root or current position is asked for 
    # from the chapter, the main copy should never change unless it is 
    # explicitly set.
    # 
    # Observation 3: Sliders and Phasers work better than dialogs with 
    # Chapters.  Ive found it disruptive when working with Chapters to 
    # suddenly have a dialog pop up grabbing my attention away from the 
    # Chapter Im working on.  Hence Ive moved informational and querying of 
    # the user primarily to Sliders.  Not only does it attach a question or 
    # notification to a Chapter better it also is very nice animation to 
    # observe.  Keeping our focus on the Chapter in question is essential!
    # 
    # Observation 4: We use the doHook mechanism to notify listeners that the 
    # current chapter has changed.  This makes it easy to monitor the changing 
    # of chapters, but the devloper must ensure that the chapter belongs to 
    # the chapters instance he is interested in.  Hence the commander is 
    # passed in as well.  If you are interested in the a specific Chapters 
    # instance the Commander should be enough to discern which chapters the 
    # chapter belongs to.  See the Node "A Note about Chapters and 
    # Commanders".
    # 
    # 
    # 
    # 
    # 
    #@-at
    #@-node:zorcanda!.20051211163618:Things A Developer should know about Chapters
    #@+node:zorcanda!.20051212152956.1:A Note about Chapters and Commanders
    #@+at
    # Chapters Swing takes the lessons learned from past Chapters plugins and 
    # simplifies the implementation by making the Chapters instance the 
    # provider of the root, current and top positions.  The Command is no 
    # longer in charge of this and will delegate the:
    #     getCurrentPosition() # or is it c.currentPosition()? :D
    #     getTopPosition()
    #     getRootPosition()
    # 
    # to the Chapters instance.  Each Commander now has a Chapters instance 
    # upon instantiation.
    # 
    # Also setting the variables will be delegated to the Chapters instance, 
    # which in turn delegates to a Chapter instance.
    # 
    # Hence we can keep the Commander interface and just restructure the 
    # internals and Chapters are now available.
    #@-at
    #@nonl
    #@-node:zorcanda!.20051212152956.1:A Note about Chapters and Commanders
    #@+node:zorcanda!.20050925110720:commander delegates
    def setRootPosition( self, p ):
        
        #if self.loading: return
        if p:
            p = p.copy()
        if self.current_chapter:
            self.current_chapter.setRootPosition( p )
        #self.roots[ self.current_chapter ] = p
    
    
    def getRootPosition( self ):
        
        #if self.loading: return
        if self.current_chapter:
            return self.current_chapter.getRootPosition()
        return None   
        #return self.roots[ self.current_chapter ].copy()
        #rv = self.roots.get( self.current_chapter, None )
        #if rv: rv = rv.copy()
        #return rv
        
        
    def setCurrentPosition( self, p ):
        
        #if self.loading: return    
        if p:
            p = p.copy()
        if self.current_chapter:
            self.current_chapter.setCurrentPosition( p )   
        #self.currentPositions[ self.current_chapter ] = p
            
        
    def getCurrentPosition( self ):
        
        #if self.loading: return
        if self.current_chapter:
            return self.current_chapter.getCurrentPosition()
        return None
            
        #return self.currentPositions[ self.current_chapter ].copy()
        #rv = self.currentPositions.get( self.current_chapter, None )
        #if rv: rv = rv.copy()
        #return rv
        
        
    
    #@-node:zorcanda!.20050925110720:commander delegates
    #@+node:zorcanda!.20050924195231:stateChanged
    def stateChanged( self, event ):
        
        c = self.c
        try:
            self.beginUpdate()
            index = self.book.getSelectedIndex()
            component = self.book.getComponentAt( index )
            chapter = self.chapters[ component ]
            c.frame.tree = chapter.tree
            self.current_chapter = chapter
            #chapter.tree.jtree.treeDidChange()
            c.beginUpdate()
            c.endUpdate()
            #c.selectPosition( chapter.getCurrentPosition() )
            self.current_chapter.undoer.setMenu( forceupdate = 1 )
            g.doHook( "chapter-changed", c = self.c, chapter = chapter )
        finally:
            self.endUpdate()
            
        #if chapter.root:
        #    chapter.root.linkAsRoot( None )
    
    #@+at   
    #     oldchapter = self.current_chapter
    #     index = self.book.getSelectedIndex()
    #     title = self.book.getTitleAt( index )
    #     self.current_chapter = title
    #     nwroot = self.chapters[ title ]
    #     oldroot = self.c.rootPosition().copy()
    #     self.chapters[ oldchapter ] = oldroot
    #     c.beginUpdate()
    #     c.setRootPosition( nwroot.copy() )
    #     c.endUpdate()
    # 
    # 
    #@-at
    #@-node:zorcanda!.20050924195231:stateChanged
    #@+node:zorcanda!.20050925125508:getChaptersIterator
    def iterateOverChapters( self ):
        
        for x in self.chaptersIterator():
            print x
            
        
    
    #@-node:zorcanda!.20050925125508:getChaptersIterator
    #@+node:zorcanda!.20050925153320:markNodesForChapterization
    def markNodesForChapterization( self ):
    
        if not self.chaptersIterationBlocked:    
            #for n in xrange( self.book.getTabCount() ):
            #    widget = self.book.getComponentAt( n )
            #    chapter = self.chapters[ widget ]
            for n in xrange( len(self.chapterlist)):
                chapter = self.chapterlist[ n ]
                rp = chapter.getRootPosition()
                rp_base = rp.copy()
                for z in rp.self_and_siblings_iter( copy = True ):
                    v = z.v
                    if not hasattr( v, "unknownAttributes" ):
                        v.unknownAttributes = {}
                    v.unknownAttributes[ 'chapter' ] = n
                    if z == rp_base:
                        v.unknownAttributes[ 'chapter_name' ] = chapter.name
        else:
            rp = self.getRootPosition()
            rp_base = rp.copy()
            for z in rp.self_and_siblings_iter( copy = True ):
                v = z.v
                if not hasattr( v, "unknownAttributs" ):
                    v.unknownAttributes = {}
                v.unknownAttributes[ 'chapter' ] = 0
                if z == rp_base:
                    v.unknownAttributes[ 'chapter_name' ] = self.current_chapter.name
                             
    
                    
    
    #@-node:zorcanda!.20050925153320:markNodesForChapterization
    #@+node:zorcanda!.20050925160118:utility
    #@+node:zorcanda!.20050925160118.1:changeChaptersName
    def changeChaptersName( self ):
           
        chapter = self.current_chapter
        if chapter.isMessaging(): return
        chapter.startMessaging()
        jp = swing.JPanel( java.awt.BorderLayout() )
        slider = Slider( jp, direction = Slider.down )
        #phaser = Phaser( jp )
        nlabel = swing.JLabel( "Chapter Name:" )
        jp.add( nlabel, java.awt.BorderLayout.NORTH )
        jtf = swing.JTextField()
        slider.setComponentToFocus( jtf )
        #phaser.setComponentToFocus( jtf )
        jtf.setText( str( chapter.name ) )
        jp.add( jtf )
        top = self.c.frame.top
        def closeAndChange():
            chapter.doneMessaging()
            nw_name = jtf.getText()
            book = self.book
            index = book.getSelectedIndex()
            old_name= book.getTitleAt( index ) 
            book.setTitleAt( index, nw_name )
            self.chaptersundoer.addEdit( self.UndoChangeChapterName( self, chapter, old_name, nw_name ) )
            chapter.name = nw_name
            slider.startRemoving()
            #phaser.phaseRemove()
        
        class aa( swing.AbstractAction ):
            def __init__( self, *args ):
                swing.AbstractAction.__init__( self, *args )
            
            def actionPerformed( self, ae ):
                closeAndChange()
        ks = swing.KeyStroke.getKeyStroke( "ENTER" )
        if ks:
            am = jtf.getActionMap()
            im = jtf.getInputMap()
            im.put( ks, "enter" )
            am.put( "enter", aa() )
        jp2 = swing.JPanel() 
        jb = swing.JButton( "Ok" )
        jb.actionPerformed = lambda event : closeAndChange()
        jp2.add( jb )
        jp.add( jp2, java.awt.BorderLayout.SOUTH )
        tree = self.c.frame.tree
        jtree = tree.jtree
        bg = jtree.getBackground()
        fg = jtree.getForeground()
        jp.setBackground( bg )
        jp.setForeground( fg )
        nlabel.setForeground( fg )
        jp2.setBackground( bg )
        jp2.setForeground( fg )
        lb = swing.border.LineBorder( fg )
        jp.setBorder( lb )
        main_widget = tree.getWidget()
        vrect = tree.jspane.getViewportBorderBounds()
        height = slider.getPreferredSize().height
        #height = phaser.getPreferredSize().height
        vrect.height = height
        slider.setBounds( vrect )
        #phaser.setBounds( vrect )
        gp = main_widget.getGlassPane()
        gp.setVisible( True )
        gp.add( slider )
        #gp.add( phaser )
    
    
    
    #@-node:zorcanda!.20050925160118.1:changeChaptersName
    #@+node:zorcanda!.20050925170403:moveNodeToChapter
    def moveNodeToChapter( self, pos, chapter ):
        
        c = self.c
        cpos = chapter.getCurrentPosition()
        if not cpos:
            cpos = chapter.getRootPosition()
            
        if cpos.isRoot():
            testroot = cpos.copy()
            testroot.moveToNext()
            if not testroot:
                return
        
        parent = cpos.getParent()    
        if parent:
            ok =  c.checkMoveWithParentWithWarning( pos.copy(), parent, True )
        else:
            ok = 1
            
        if not ok:
            return
        
        try:    
            self.beginUpdate()
            current = self.current_chapter
            c.beginUpdate()
            pos.unlink()
            c.endUpdate()
        
            self.current_chapter = chapter
            c.frame.tree = chapter.tree
            c.beginUpdate()
            pos.linkAfter( cpos )
            c.endUpdate()
        
    
            self.current_chapter = current
            c.frame.tree = current.tree
        finally:
            self.endUpdate()
    
    #@-node:zorcanda!.20050925170403:moveNodeToChapter
    #@+node:zorcanda!.20050929145330:copyNodeToChapter
    def copyNodeToChapter( self, pos, chapter ):
        
        c = self.c
        cpos = chapter.getCurrentPosition()
        if not cpos:
            cpos = chapter.getRootPosition()
        
        nwpos = pos.copyTreeAfter()    
        #if cpos.isRoot():
        #    testroot = cpos.copy()
        #    testroot.moveToNext()
        #    if not testroot:
        #        return
        
        #parent = cpos.getParent()    
        #if parent:
        #    ok =  c.checkMoveWithParentWithWarning( pos.copy(), parent, True )
        #else:
        #    ok = 1
            
        #if not ok:
        #    return
        try:
            self.beginUpdate()
            current = self.current_chapter
            c.beginUpdate()
            nwpos.unlink()
            c.endUpdate()
        
            self.current_chapter = chapter
            c.frame.tree = chapter.tree
            c.beginUpdate()
            nwpos.linkAfter( cpos )
            undo = leoSwingUndo.UndoableInsertNode( self.c, [ "Insert Node", nwpos.copy(), ], {} )
            chapter.undoer.addUndo( undo )
            c.endUpdate()
            self.current_chapter = current
            c.frame.tree = current.tree
            current.undoer.setMenu( forceupdate = 1 )
        finally:
            self.endUpdate()
    #@-node:zorcanda!.20050929145330:copyNodeToChapter
    #@+node:zorcanda!.20050929150232:cloneNodeToChapter
    def cloneNodeToChapter( self, pos, chapter ):
        
        c = self.c
        cpos = chapter.getCurrentPosition()
        if not cpos:
            cpos = chapter.getRootPosition()
        
        nwpos = pos.clone( pos.copy() )
            
        #if cpos.isRoot():
        #    testroot = cpos.copy()
        #    testroot.moveToNext()
        #    if not testroot:
        #        return
        
        parent = cpos.getParent()    
        if parent:
            ok =  c.checkMoveWithParentWithWarning( nwpos.copy(), parent, True )
        else:
            ok = 1
            
        if not ok:
            nwpos.unlink()
            c.beginUpdate()
            c.endUpdate()
            return
        
        try:
            self.beginUpdate()
            current = self.current_chapter
            c.beginUpdate()
            nwpos.unlink()
            c.endUpdate()
        
            self.current_chapter = chapter
            c.frame.tree = chapter.tree
            c.beginUpdate()
            nwpos.linkAfter( cpos )
            undo = leoSwingUndo.UndoableInsertNode( self.c, [ "Insert Node", nwpos.copy(), ], {} )
            chapter.undoer.addUndo( undo )
        finally:
            c.endUpdate()
        
    
        self.current_chapter = current
        c.frame.tree = current.tree
        self.endUpdate()
        current.undoer.setMenu( forceupdate = 1 )
    #@nonl
    #@-node:zorcanda!.20050929150232:cloneNodeToChapter
    #@+node:zorcanda!.20050925180928:testNode
    def testNode( self ):
        
        chapter = self.current_chapter
        pos = chapter.getCurrentPosition()
        
        print pos
        for ancestor in pos.self_and_parents_iter(): #copy = 1):
            print ancestor, ancestor.isCloned()
    #@nonl
    #@-node:zorcanda!.20050925180928:testNode
    #@+node:zorcanda!.20050925191536:swapChapters
    def swapChapters( self, chapter1, chapter2, undo = True ):
    
        try:    
            self.beginUpdate()
            widget1 = chapter1.tree.getWidget()
            widget2 = chapter2.tree.getWidget()
            index1 = self.book.indexOfComponent( widget1 )
            index2 = self.book.indexOfComponent( widget2 )
            jp = swing.JPanel() #place holder, keeps order
            self.book.setComponentAt( index1, jp )
            self.book.setComponentAt( index2, widget1 )
            self.book.setComponentAt( index1, widget2 )
            self.book.setTitleAt( index1, chapter2.name )
            self.book.setTitleAt( index2, chapter1.name )
            i1 = self.chapterlist.index( chapter1 )
            i2 = self.chapterlist.index( chapter2 )
            self.chapterlist[ i1 ] = chapter2
            self.chapterlist[ i2 ] = chapter1
            self.current_chapter = chapter2
            self.c.frame.tree = chapter2.tree
            self.c.beginUpdate()
            self.c.endUpdate()
            if undo:
                self.chaptersundoer.addEdit( self.UndoSwapChapters( self, chapter1, chapter2 )) 
        finally:
            self.endUpdate()
        
        
    #@nonl
    #@-node:zorcanda!.20050925191536:swapChapters
    #@+node:zorcanda!.20050927160420:mergeChapters
    def mergeChapters( self, chapter1, chapter2 ):
    
    	try:    
            self.beginUpdate()
        
            rp = chapter2.getRootPosition()
            nodes = []
            for z in rp.self_and_siblings_iter( copy = True ):
                nodes.append( z )
        
            for z in nodes:
                z.unlink()
            
            rp2 = chapter1.getRootPosition()
            for z in rp2.self_and_siblings_iter( copy = True ):
                pass   
            base = z.copy()
    
        
            self.c.beginUpdate()
        
            for z in nodes:
                z.linkAfter( base )
                base = z.copy()
            
            self.quietRemoveChapter( chapter2 )
            self.c.endUpdate()    
        finally:
            self.endUpdate()
    #@nonl
    #@-node:zorcanda!.20050927160420:mergeChapters
    #@+node:zorcanda!.20050926153953:selectChapter
    def selectChapter( self, chapter ):
        
        widget = chapter.tree.getWidget()
        index = self.book.indexOfComponent( widget )
        if index != -1:
            self.book.setSelectedComponent( widget )
        
    #@nonl
    #@-node:zorcanda!.20050926153953:selectChapter
    #@+node:zorcanda!.20051212104103:insertChapter
    def insertChapter( self, chapter ):
        
        self.chapterlist.append( chapter )
        tree = chapter.tree 
        self.trees_chapters[ tree ] = chapter
        widget = tree.getWidget()   
        self.chapters[ widget ] = chapter
        ic = self.IconCloser( self.icon, self.removeChapter )
        self.book.addTab( chapter.name, ic, widget )
    
    #@-node:zorcanda!.20051212104103:insertChapter
    #@+node:zorcanda!.20050927155819:findChapterForNode
    def findChapterForNode( self, p ):
        
        for n in xrange( self.book.getTabCount() ):
            widget = self.book.getComponentAt( n )
            chapter = self.chapters[ widget ]
            rp = chapter.getRootPosition()
            for z in rp.fromSelfAllNodes_iter( copy = True ):
                if z == p: return chapter
            
        return None
    #@nonl
    #@-node:zorcanda!.20050927155819:findChapterForNode
    #@+node:zorcanda!.20050927190138:turnNodeIntoChapter
    def turnNodeIntoChapter( self ):
        
        cp = self.current_chapter.getCurrentPosition()
        if cp.isRoot():
            testroot = cp.copy()
            testroot.moveToNext()
            if not testroot:
                return
        self.c.beginUpdate()
        cp.unlink()
        rp = self.current_chapter.getRootPosition()
        self.current_chapter.setCurrentPosition( rp )
        self.c.endUpdate()
        self.freshChapter( p = cp )
    #@nonl
    #@-node:zorcanda!.20050927190138:turnNodeIntoChapter
    #@-node:zorcanda!.20050925160118:utility
    #@+node:zorcanda!.20050926171214:import and export
    #@+others
    #@+node:zorcanda!.20050926171214.1:import outline
    def importOutline( self ):
        
        fc = swing.JFileChooser()
        fc.showOpenDialog( None )
        sfile = fc.getSelectedFile()
        if sfile:
            self.loadFileAsChapter( sfile.getAbsolutePath() )
        
    def loadFileAsChapter( self, fname ):
        
        c = self.c
        targetfile = java.io.File( fname )
        if not targetfile.exists() or targetfile.isDirectory():
            return
        
        mungedname = targetfile.getName()
        if mungedname.endswith( ".leo") : mungedname = mungedname[ : -4 ]
        def run():
            self.freshChapter( name = mungedname, edit = False, undo = False )
            
        dc = DefCallable( run )
        ft = dc.wrappedAsFutureTask()
        if java.awt.EventQueue.isDispatchThread():
            ft.run()
        else:
            swing.SwingUtilities.invokeAndWait( ft )
        
        edit = sel.UndoImport( self, self.current_chapter )
        self.chaptersundoer.addEdit( edit )
        c.frame.disableResizing()
        p = c.fileCommands.getLeoFileAsOutline( fname )
        c.frame.enableResizing()
        oldir = c.frame.openDirectory
        parent = targetfile.getParentFile()
        c.frame.openDirectory = parent.getAbsolutePath()
        c.atFileCommands.readAll( c.rootPosition().copy() ,partialFlag=False)
        c.frame.openDirectory= oldir
        self.deferedChapterization( c.rootPosition(), selectchapter = self.getSelectedChapterWidget(), edit = edit )
        
    
    
    #@-node:zorcanda!.20050926171214.1:import outline
    #@+node:zorcanda!.20050926171214.2:export outline
    def exportOutline( self ):
        
        self.chaptersIterationBlocked = 1
        self.beginUpdate()
        fc = swing.JFileChooser()
        fc.showSaveDialog( None )
        sfile = fc.getSelectedFile()
        if not sfile:
            g.es( "No file name entered." )
            return
        fileName = fc.getName( sfile )
        if not fileName.endswith( ".leo" ):
            fileName = "%s.leo" % fileName
        self.c.fileCommands.write_Leo_file( fileName, True )
        self.chaptersIterationBlocked = 0
        self.endUpdate()
        g.es( "Done Exporting %s as %s" % ( self.current_chapter.name, fileName ) )
    #@nonl
    #@-node:zorcanda!.20050926171214.2:export outline
    #@-others
    #@-node:zorcanda!.20050926171214:import and export
    #@+node:zorcanda!.20050925123140:adding and removing chapters
    #@+others
    #@+node:zorcanda!.20050924194020:addChapter
    def addChapter( self, name, p = None ):
        
    
        c = self.c
        chapter = self.Chapter()
        self.chapterlist.append( chapter )
        chapter.setUndoer( leoSwingUndo.leoSwingUndo( c ) )
        chapter.setRootPosition( p )
        chapter.setCurrentPosition( p )
        #self.current_chapter = current
        cm = self.ChapterModel( c , chapter) #, p )
        tree = leoSwingTree( frame = c.frame, model = cm, chapter= chapter )
        tree.createAuxilaryWidgets()
        #self.c.frame.tree = tree
        chapter.setTree( tree )
        chapter.name = name
        self.trees_chapters[ tree ] = chapter
        widget = tree.getWidget()
        
        self.chapters[ widget ] = chapter
        ic = self.IconCloser( self.icon, self.removeChapter )
        self.book.addTab( name, ic, widget )
    
        if not self.current_chapter:
            self.beginUpdate()
            self.current_chapter = chapter
            c.frame.tree = tree
            self.endUpdate()
    
        return tree
    
    
    
    #@-node:zorcanda!.20050924194020:addChapter
    #@+node:zorcanda!.20051206125814:addChapterForSettingsTree
    def addChapterForSettingsTree( self, name, p = None , controller = None):
        
        c = self.c
        chapter = self.current_chapter
        #chapter = self.Chapter()
        #chapter.setUndoer( leoSwingUndo.leoSwingUndo( c ) )
        chapter.setRootPosition( p )
        chapter.setCurrentPosition( p )
        #c.chapters.current_chapter = chapter
        #chapter = self.current_chapter
        cm = self.ChapterModel( c , chapter)
        import leoConfig
        tree = leoConfig.settingsTree( frame = c.frame, model = cm, chapter = chapter, controller = controller )
        chapter.setTree( tree )
        chapter.name = name
        self.trees_chapters[ tree ] = chapter
        widget = tree.getWidget()
        
        self.chapters[ widget ] = chapter
        self.book = self.getWidget()
        self.book.addTab( name, widget )
        if not self.current_chapter:
            self.beginUpdate()
            self.current_chapter = chapter
            c.frame.tree = tree
            self.endUpdate()
    
        return tree
    
    
    
    
    #@-node:zorcanda!.20051206125814:addChapterForSettingsTree
    #@+node:zorcanda!.20050925123140.1:freshChapter
    def freshChapter( self, p = None, name = None, edit = True, undo = True ):
        
        c = self.c
        if not p:
            t = leoNodes.tnode( headString = "NewHeadline" )
            v = leoNodes.vnode( c, t )
            p = leoNodes.position( v, [] )
        if not name:
            name = "New Chapter"
        tree = self.addChapter( name, p = p )                    
        chapter = self.trees_chapters[ tree ]
        if undo:
            self.chaptersundoer.addEdit( self.UndoAddChapter( self, chapter ) ) 
        try:
            self.beginUpdate()
            self.current_chapter = chapter
            c.frame.tree = tree
            p.linkAsRoot( None )
            #self.current_chapter = current 
            widget = tree.getWidget()
            self.book.setSelectedComponent( widget )   
        finally:
            self.endUpdate()
        tree.loaded = 1
        if edit:
            self.c.editPosition( p.copy() )
    #@nonl
    #@-node:zorcanda!.20050925123140.1:freshChapter
    #@+node:zorcanda!.20050925164351:removeChapter
    def removeChapter( self, chapter = None, undo = True ):
    
        tree = self.c.frame.tree
        vrect = tree.jspane.getViewportBorderBounds()
        main_widget = tree.getWidget()
        gp = main_widget.getGlassPane()
        bgc = tree.jtree.getBackground()
        fgc = tree.jtree.getForeground() 
        index = self.book.getSelectedIndex()
        component = self.book.getComponentAt( index )
        chapter = self.chapters[ component ]
        fg = self.book.getForegroundAt( index )
        bg = self.book.getBackgroundAt( index )
        if chapter.isMessaging() or self.isPromptingForRemove(): return
        chapter.startMessaging()
        self.startPromptingForRemove()
        self.book.setForegroundAt( index, bg )
        self.book.setBackgroundAt( index, fg )
        if self.book.getTabCount() == 1:
            def ok( chapter = chapter ):
                self.stopPromptingForRemove()
                chapter.doneMessaging()
                self.book.setForegroundAt( index, fg )
                self.book.setBackgroundAt( index, bg )
            buttons = ( ( "Ok", ok ), )
            sa = self.SliderMessageButtons( "Can't remove the only Chapter", buttons = buttons, bgc = bgc, fgc = fgc )
            gp.setVisible( True )
            swidget = sa.getSlider()
            height = swidget.getPreferredSize().height
            vrect.height = height
            swidget.setBounds( vrect )
            gp.add( swidget )
            return
        else:
            message = "Do you want to remove Chapter: %s ?" % chapter.name
            def yes( component = component, chapter = chapter ):
                self.book.remove( component )
                chapter.doneMessaging()
                self.chapterlist.remove( chapter )
                tree = chapter.tree 
                del self.trees_chapters[ tree ]
                del self.chapters[ component ]
                self.chaptersundoer.addEdit( self.UndoRemoveChapter( self, chapter ) )
                try:
                    index = self.book.getSelectedIndex()
                    component = self.book.getComponentAt( index )
                    #self.chapters[ widget ] = chapter
                    chapter = self.chapters[ component ]
                    self.beginUpdate()
                    self.current_chapter = chapter
                    self.c.frame.tree = chapter.tree
                finally:
                    self.endUpdate()
                self.stopPromptingForRemove()            
                g.doHook( "chapter-removed", c = self.c, chapter = chapter )
                
            def no( chapter = chapter ):
                self.stopPromptingForRemove()
                chapter.doneMessaging()
                self.book.setForegroundAt( index, fg )
                self.book.setBackgroundAt( index, bg )
                
            buttons = ( ( "Yes", yes ), ( "No", no ) )
            sa = self.SliderMessageButtons( message, buttons = buttons, bgc = bgc, fgc = fgc )
            gp.setVisible( True )
            swidget = sa.getSlider()
            height = swidget.getPreferredSize().height
            vrect.height = height
            swidget.setBounds( vrect )
            gp.add( swidget )            
               
    #@+at    
    #     index = self.book.getSelectedIndex()
    #     component = self.book.getComponentAt( index )
    #     chapter = self.chapters[ component ]
    #     rv = swing.JOptionPane.showConfirmDialog( None,
    #                                              "Do you want to remove 
    # Chapter: %s" % chapter.name,
    #                                              "Remove a Chapter?",
    # swing.JOptionPane.YES_NO_OPTION )
    #     if rv == swing.JOptionPane.NO_OPTION: return
    # 
    # 
    #     self.book.removeTabAt( index ) #removing does not fire a change 
    # event
    #     index = self.book.getSelectedIndex()
    #     component = self.book.getComponentAt( index )
    #     chapter = self.chapters[ component ]
    #     self.chapterlist.remove( chapter )
    #     try:
    #         self.beginUpdate()
    #         self.current_chapter = chapter
    #         self.c.frame.tree = chapter.tree
    #     finally:
    #         self.endUpdate()
    #     g.doHook( "chapter-removed", c = self.c, chapter = chapter )
    #@-at
    #@-node:zorcanda!.20050925164351:removeChapter
    #@+node:zorcanda!.20051212144004:quietRemoveChapter
    def quietRemoveChapter( self, chapter ):
        
        tree = chapter.tree
        component = tree.getWidget()
        self.book.remove( component )
        self.chapterlist.remove( chapter )
        del self.trees_chapters[ tree ]
        del self.chapters[ component ]    
    #@-node:zorcanda!.20051212144004:quietRemoveChapter
    #@-others
    #@-node:zorcanda!.20050925123140:adding and removing chapters
    #@+node:zorcanda!.20050925144509:transforming an Outline into Chapers components
    #@+others
    #@+node:zorcanda!.20050925144509.1:deferedChaperization
    def deferedChapterization( self, pos, selectchapter = None, edit = None ):
        
        x = lambda : self.breakOutlineIntoChapters( pos, selectchapter, edit )
        dc = DefCallable( x )
        ft = dc.wrappedAsFutureTask()
        swing.SwingUtilities.invokeLater( ft )
    #@-node:zorcanda!.20050925144509.1:deferedChaperization
    #@+node:zorcanda!.20050924193446.1:breakOutlineIntoChapters
    def breakOutlineIntoChapters( self, p, selectchapter = None, edit = None ):
        
        #self.loading = 1
        self.beginUpdate()
        #self.updateLock.unlock()
        n = 0 
        last_z = None
        p2 = p.copy()
        level_0 = []
        for z in p.self_and_siblings_iter( copy = True ):
            level_0.append( z )
        
        
        if level_0:
            p1 = level_0[ 0 ]
            v1 = p1.v
            if hasattr( v1, "unknownAttributes" ):
                uA = v1.unknownAttributes
                if uA.has_key( "chapter_name" ):
                    name = uA[ 'chapter_name' ]
                    i = self.book.getSelectedIndex()
                    self.book.setTitleAt( i, name )
                    if self.current_chapter: #This needs to be set here or its lost in the next save
                        self.current_chapter.name = name
                       
    
        for z in level_0:
            v = z.v
            name = "New Chapter"
            if hasattr( v, "unknownAttributes" ):
                if v.unknownAttributes.has_key( "chapter" ):
                    a_n = v.unknownAttributes[ "chapter" ]
                else:
                    a_n = n
                if v.unknownAttributes.has_key( "chapter_name" ):
                    name = v.unknownAttributes[ "chapter_name" ]
            else:
                a_n = n
       
            if a_n != n:
                #self.c.endUpdate()
                n = a_n
                #z.doDelete( p2 )
                z.unlink()
                tree = self.c.chapters.addChapter( name, z.copy() )
                widget = tree.getWidget()
                chapter = self.chapters[ widget ]
                self.c.frame.tree = chapter.tree
                self.current_chapter = chapter
                if edit and hasattr( edit, "addChapter" ):
                    edit.addChapter( chapter )
                ic = self.IconCloser( self.icon, self.removeChapter )
                self.book.addTab( name, ic, widget )
                #self.book.addTab( name, widget )
                self.book.setSelectedComponent( widget )
                #self.c.beginUpdate()
                last_z = z
                z.linkAsRoot( None )
                tree.loaded = 1
                continue
            
            if last_z:
                #z.moveAfter( last_z )
                z.unlink() 
                z.linkAfter( last_z )
            last_z = z           
        
        if not selectchapter:
            selectchapter = self.book.getComponentAt( 0 )       
        self.book.setSelectedComponent( selectchapter )
        self.c.beginUpdate()
        self.c.endUpdate()       
        self.endUpdate()
    
    
    #@-node:zorcanda!.20050924193446.1:breakOutlineIntoChapters
    #@-others
    #@-node:zorcanda!.20050925144509:transforming an Outline into Chapers components
    #@+node:zorcanda!.20050924212855:class ChaptersPopup
    class ChaptersPopup( aevent.MouseAdapter ):
        
        def __init__( self, chapters ):
            aevent.MouseAdapter.__init__( self )
            self.chapters = chapters
            self.copyNodeToChapter = self.CopyNodeToChapter( chapters )
            self.cloneNodeToChapter = self.CloneNodeToChapter( chapters )
            self.swapChapters = self.SwapChapters( chapters )
            self.mergeChapters = self.MergeChapters( chapters )
            self.enabled = True
            
        def disable( self ):
            self.enabled = False
            
        def enable( self ):
            self.enabled = True
            
        #@    @+others
        #@+node:zorcanda!.20050924213151:mousePressed
        def mousePressed( self, mE ):
                        
            if mE.getClickCount() == 1 and self.enabled:
                if mE.getButton() == mE.BUTTON3:
                    x = mE.getX()
                    y = mE.getY()
                    DefAction = self.chapters.DefAction        
                    popup = swing.JPopupMenu()            
                    popup.add( DefAction( "Add Chapter", self.chapters.freshChapter ) ) 
                    #popup.add( DefAction( "Remove Chapter", self.chapters.removeChapter ) )
                    #popup.add( DefAction( "ITERATE!", self.chapters.iterateOverChapters ) ) 
                    popup.add( DefAction( "Edit Chapters Name", self.chapters.changeChaptersName ) )
                    popup.addSeparator()
                    popup.add( self.copyNodeToChapter.getWidget() )
                    popup.add( self.cloneNodeToChapter.getWidget() )
                    popup.add( self.swapChapters.getWidget() )
                    popup.add( self.mergeChapters.getWidget() )
                    popup.add( DefAction( "Copy Node Into Chapter", self.chapters.turnNodeIntoChapter ) )
                    #popup.add( DefAction( "Test NODE", self.chapters.testNode ) )
                    popup.addSeparator()
                    menu = swing.JMenu( "Import/Export" )
                    popup.add( menu )
                    menu.add( DefAction( "Import Outline", self.chapters.importOutline ) )
                    menu.add( DefAction( "Export Chapter as Outline", self.chapters.exportOutline ) )
                    popup.addSeparator()
                    undoer = self.chapters.chaptersundoer
                    utext = undoer.getUndoPresentationName()
                    item = popup.add( DefAction( utext, undoer.undo ) )
                    if not undoer.canUndo():
                        item.setEnabled( False )
                        
                    rtext = undoer.getRedoPresentationName()
                    item = popup.add( DefAction( rtext, undoer.redo ) )
                    if not undoer.canRedo():
                        item.setEnabled( False )    
                                      
                    source = mE.getSource()                
                    popup.show( source, x, y )
        #@-node:zorcanda!.20050924213151:mousePressed
        #@+node:zorcanda!.20050925165541:class CopyNodeToChapter
        class CopyNodeToChapter( sevent.MenuListener ):
            
            def __init__( self, chapters ):
                self.chapters = chapters
                self.menu = swing.JMenu( "Copy Node To Chapter" )
                self.menu.addMenuListener( self )
                
            def getWidget( self ):
                return self.menu
                
            def menuSelected( self, me ):
                
                self.menu.removeAll()
                current = self.chapters.current_chapter
                cpos = current.getCurrentPosition()
                root = current.getRootPosition()
                #if cpos == root:
                #    roottest = cpos.copy()
                #    roottest.moveToNext()
                #    if not roottest:
                #        return
                
                for z in self.chapters.cycleThroughChapters( swap = 0 ):
                    if z == current: continue
                    jmi = swing.JMenuItem( z.name )
                    mvnd = lambda event, cpos = cpos.copy(), chapter = z: self.chapters.copyNodeToChapter( cpos, chapter )
                    jmi.actionPerformed = mvnd
                    self.menu.add( jmi )
            
            def menuDeselected( self, me ):
                pass
                
            def menuCanceled( self, me ):
                pass
        #@-node:zorcanda!.20050925165541:class CopyNodeToChapter
        #@+node:zorcanda!.20050929150523:class CloneNodeToChapter
        class CloneNodeToChapter( sevent.MenuListener ):
            
            def __init__( self, chapters ):
                self.chapters = chapters
                self.menu = swing.JMenu( "Clone Node To Chapter" )
                self.menu.addMenuListener( self )
                
            def getWidget( self ):
                return self.menu
                
            def menuSelected( self, me ):
                
                self.menu.removeAll()
                current = self.chapters.current_chapter
                cpos = current.getCurrentPosition()
                root = current.getRootPosition()
                #if cpos == root:
                #    roottest = cpos.copy()
                #    roottest.moveToNext()
                #    if not roottest:
                #        return
                
                for z in self.chapters.cycleThroughChapters( swap = 0 ):
                    if z == current: continue
                    jmi = swing.JMenuItem( z.name )
                    mvnd = lambda event, cpos = cpos.copy(), chapter = z: self.chapters.cloneNodeToChapter( cpos, chapter )
                    jmi.actionPerformed = mvnd
                    self.menu.add( jmi )
            
            def menuDeselected( self, me ):
                pass
                
            def menuCanceled( self, me ):
                pass
        #@-node:zorcanda!.20050929150523:class CloneNodeToChapter
        #@+node:zorcanda!.20050925191735:class SwapChapters
        class SwapChapters( sevent.MenuListener ):
            
            def __init__( self, chapters ):
                self.chapters = chapters
                self.menu = swing.JMenu( "Swap Chapters" )
                self.menu.addMenuListener( self )
                
            def getWidget( self ):
                return self.menu
                
            def menuSelected( self, me ):
                
                self.menu.removeAll()
                current = self.chapters.current_chapter
                
                for z in self.chapters.cycleThroughChapters( swap = 0 ):
                    if z == current: continue
                    jmi = swing.JMenuItem( z.name )
                    swapchap = lambda event,  chapter = z: self.chapters.swapChapters( current, chapter )
                    jmi.actionPerformed = swapchap
                    self.menu.add( jmi )
            
            def menuDeselected( self, me ):
                pass
                
            def menuCanceled( self, me ):
                pass
        #@-node:zorcanda!.20050925191735:class SwapChapters
        #@+node:zorcanda!.20050927161034:class MergeChapters
        class MergeChapters( sevent.MenuListener ):
            
            def __init__( self, chapters ):
                self.chapters = chapters
                self.menu = swing.JMenu( "Merge Chapters" )
                self.menu.addMenuListener( self )
                
            def getWidget( self ):
                return self.menu
                
            def menuSelected( self, me ):
                
                self.menu.removeAll()
                current = self.chapters.current_chapter
                
                for z in self.chapters.cycleThroughChapters( swap = 0 ):
                    if z == current: continue
                    jmi = swing.JMenuItem( z.name )
                    mergechapters = lambda event,  chapter = z: self.chapters.mergeChapters( current, chapter )
                    jmi.actionPerformed = mergechapters
                    self.menu.add( jmi )
            
            def menuDeselected( self, me ):
                pass
                
            def menuCanceled( self, me ):
                pass
        #@-node:zorcanda!.20050927161034:class MergeChapters
        #@-others
    #@nonl
    #@-node:zorcanda!.20050924212855:class ChaptersPopup
    #@+node:zorcanda!.20050925123408:Action Classes
    #@+others
    #@+node:zorcanda!.20050925123408.1:DefAction
    class DefAction( swing.AbstractAction ):
        
        def __init__( self, name, function ):
            swing.AbstractAction.__init__( self, name )
            self.function = function
        
        def actionPerformed( self, event ):
            self.function()
    #@nonl
    #@-node:zorcanda!.20050925123408.1:DefAction
    #@-others
    #@-node:zorcanda!.20050925123408:Action Classes
    #@+node:zorcanda!.20050924195603:class ChapterModel
    class ChapterModel( stree.TreeModel, java.lang.Runnable ):
        
        
        
        def __init__( self, c , chapter ):#, proot ):
    
            self.c = c
            self.tmlisteners = java.util.ArrayList();
            self._root = self._rootN( c, chapter ) # , proot )
            self._rTreePath = stree.TreePath( self._root ) 
            self.chapter = chapter
            self.drunning = 0
    
            
        def getChapter( self ):
            return self.chapter
    
        def getRoot( self ):
            return self._root
    
        def reload( self, full_reload = False ):
            
            
            if full_reload:
                t_r = self.c.frame.tree.tree_reloader
                #for z in self.c.rootPosition().allNodes_iter( copy = True ):
                for z in self._root.getRootPosition().allNodes_iter( copy = True ):
                    if z.isExpanded():
                        t_r.expand( z )
            
            import jarray
            a = jarray.zeros( 1, stree.TreeNode )
            a[ 0 ] = self._root
            e = sevent.TreeModelEvent( self._root, a )
            for z in list( self.tmlisteners ):
                z.treeStructureChanged( e )
    
                
        def dRun( self ):
            self.drunning = 1
            swing.SwingUtilities.invokeLater( self )
                
        def run( self ):
            
            try:
                import jarray
                a = jarray.zeros( 1, stree.TreeNode )
                a[ 0 ] = self._root
                e = sevent.TreeModelEvent( self._root, a )
                for z in list( self.tmlisteners ):
                    z.treeStructureChanged( e )
                if self.chapter.tree.jtree:
                    self.chapter.tree.jtree.fireTreeExpanded( self._rTreePath )
                    cp = self.chapter.getCurrentPosition()
                    cpp = self.getPathToRoot( cp )
                    self.chapter.tree.jtree.setSelectionPath( cpp )
            finally:
                self.drunning = 0
        
        def addTreeModelListener( self, listener ):
            self.tmlisteners.add( listener )
            
        def removeTreeModelListener( self, listener ):
            self.tmlisteners.remove( listener )
        
        def getChild( self, parent, ind ):
            if parent is self._root:
                return parent.getChildAt( ind ).copy()
            return parent.getNthChild( ind ).copy()
            
        def getChildCount( self, parent ):
            
            if parent is self._root:
                return parent.getChildCount()
            if parent:
                return parent.numberOfChildren()
            else:
                return 0
            
        def getIndexOfChild( self, parent, child ):
            if parent is self._root:
                return self._root.getIndex( child )
            else:
                return child.childIndex()
    
    
        
        def valueForPathChanged( self, path, value ):
    
            pos = path.getLastPathComponent()
            pos.setHeadString( value )
            
        def isLeaf( self, node ):
            if node is self._root: return False
            if node:
                if node.numberOfChildren(): return False
                else: return True
            else:
                return True
                
                
        def getPathToRoot( self, node, masterlist = None ):
            
            path = []
            #if not node:
            #    node = self.c.rootPosition()
            stopat = None
            if self.chapter.hoistStack:
                bunch = self.chapter.hoistStack[ -1 ]
                stopat = bunch.p.copy()
                
            while node and node.level() != 0:
                path.append( node.copy() )
                if node == stopat: break
                node = node.getParent()
                if masterlist:
                    if node in masterlist:
                        masterlist.remove( node )
            else:
                path.append( node.copy() )
            
            path.append( self._root )  
            path.reverse()
            tp = stree.TreePath( path )
            return tp
                
        class _rootN( stree.TreeNode ):
            
            def __init__( self, c, chapter ):#, proot ):
                self.c = c
                self.chapter = chapter
                self.v = None # These are for comparisons with positions, we must pretend to be a position
                self.stack = None
                
                #self.chapters = c.chapters
                #self.proot = proot
            def expand( self ): pass
            def contract( self ): pass
            
            def getChildIndex( self ):
                return -1
            
            def getRootPosition( self ):
                rp = self.chapter.getRootPosition()
                return rp
    
            
            def getChildAt(self, childIndex):
                rp = self.getRootPosition() #self.c.rootPosition()                
                #if len( self.c.hoistStack ) != 0: #Hoist Code
                if len( self.chapter.hoistStack ) != 0:
                    #rp = self.c.hoistStack[ -1 ].p.copy()
                    rp = self.chapter.hoistStack[ -1 ].p.copy()
                    def getParent( root = self ): #This slight modification to a copy allows the Tree to keep its expanded state
                        return root
                    rp.getParent = getParent
                    return rp #End of Hoist Code
                if not rp: return None
                i = 0
                for z in rp.siblings_iter():
                    if i == childIndex:
                        return z
                    i = i + 1
                return None       
            
            def getChildCount( self ):
                #rp = self.c.rootPosition()
                rp = self.getRootPosition()
                if len( self.chapter.hoistStack ) != 0:
                    return 1
                #if len( self.c.hoistStack ) != 0:
                #    return 1
                i = 0
                for z in rp.siblings_iter():
                    i = i + 1
                return i
            
            def getParent( self ):
                return None
                
            def getIndex( self, node):
                #rp = self.c.rootPosition()
                rp = self.getRootPosition()
                if len( self.chapter.hoistStack ) != 0:
                    return 0
                i = 0
                for z in rp.siblings_iter():
                    if z == node: return i
                    i = i + 1
                return -1
                
            def getAllowsChildren( self ):
                return True
                
            def isLeaf( self ):
                return False
                
            def equal( self, x ):
                if self is x: return True
                else: return False
                
            def equals( self, x ):
                if self is x: return True
                else:
                    return False
                
            def copy( self ):
                return self
                
            def bodyString( self ):
                return ""
                
            def headString( self ):
                return ""
                
            def children( self ):
                
                class _enum( util.Enumeration ):
                    
                    def __init__( self, iter ):
                        self.iter = iter
                        try:
                            self.next = iter.next()
                        except:
                            self.next = None
                    
                    def hasMoreElements( self ):
                        if self.next: return True
                        else: return False
                        
                    def nextElement( self ):
                        
                        try:
                            rt = self.next
                            self.next = iter.next()
                        finally:
                            return rt
                #rp = self.c.rootPosition()
                rp = self.getRootPosition()
                return _enum( rp.siblings_iter( copy = True ) )
                #return _enum( self.c.rootPosition.siblings_iter( copy = True ) )        
            
    
        
           
    
    
    
    
    
    #@-node:zorcanda!.20050924195603:class ChapterModel
    #@+node:zorcanda!.20050925114935:class Chapter
    class Chapter:
        
        def __init__( self ):
            
            self.root = None
            self.currentPosition = None
            self.tree = None
            self.name = None
            self.hoistStack = []
            self.undoer = None
            self.messaging = False
            
        def startMessaging( self ):
            self.messaging = True
        
        def isMessaging( self ):
            return self.messaging
            
        def doneMessaging( self ):
            self.messaging = False
            
        def isValid( self ):
            widget = self.tree.getWidget()
            if widget.getParent(): return True
            else:
                return False    
            
        def setUndoer( self, undoer ):
            self.undoer = undoer
            
        def getUndoer( self ):
            return self.undoer
            
        def getName( self ):
            return self.name
            
        def setName( self, name ):
            self.name = name
            
        
        def getTree( self ):
            return self.tree
            
        def setTree( self, tree ):
            self.tree = tree
        
        def setRootPosition( self, p ):
        
            if p:
                p = p.copy()
            self.root = p
    
    
        def getRootPosition( self ):
            
            p = self.root
            if p:
                p = p.copy()
            return p
        
        
        def setCurrentPosition( self, p ):
            
            if p:
                p = p.copy()        
            self.currentPosition = p
            
        
        def getCurrentPosition( self ):
            
            p = self.currentPosition
            if p:
                p = p.copy()
            return p
              
    #@-node:zorcanda!.20050925114935:class Chapter
    #@+node:zorcanda!.20051210143052:class SliderMessageButtons
    class SliderMessageButtons( sevent.AncestorListener ):
        '''A class that manages creates a message with 0 to N buttons for
           the user to select.  After selecting the button, the slider is removed.
           After removal the function corresponding to the button is fired'''
           
        def __init__( self, message, buttons = (), direction = Slider.down, bgc = None, fgc = None ):
            
            self.backingpanel = swing.JPanel( awt.BorderLayout() )
            self.slider = Slider( self.backingpanel, direction )
            if fgc:
                lb = swing.border.LineBorder( fgc )
                self.backingpanel.setBorder( lb )
            else:
                lb = swing.border.LineBorder( self.backingpanel.getForeground() )
                self.backingpanel.setBorder( lb )
            jl = swing.JLabel( message )
            jl.setHorizontalAlignment( swing.SwingConstants.CENTER )
            self.backingpanel.add( jl )
            jp2 = swing.JPanel()
            self.func = None
            for z in buttons:
                label = z[ 0 ]
                func = z[ 1 ]
                b = swing.JButton( label )
                b.actionPerformed = lambda event, func = func: self.__removeCall( func )
                jp2.add( b )
    
            self.backingpanel.add( jp2, awt.BorderLayout.SOUTH )
            self.slider.setSize( self.slider.getPreferredSize() )
            if not fgc is None:
                self.backingpanel.setForeground( fgc )
                jp2.setForeground( fgc )
                jl.setForeground( fgc )
            if not bgc is None:
                self.backingpanel.setBackground( bgc )
                jp2.setBackground( bgc )
                jl.setBackground( bgc )
            
        def __removeCall( self, func ):
            self.slider.addAncestorListener( self )
            self.slider.startRemoving()
            self.func = func
            
        def ancestorAdded( self, event):
            pass
            
        def ancestorMoved( self, event ):
            pass
            
        def ancestorRemoved( self, event ):
            if not self.func is None:
                self.func()
            
        def getSlider( self ):
            return self.slider
    
    #@-node:zorcanda!.20051210143052:class SliderMessageButtons
    #@+node:zorcanda!.20051211152605:IconCloser
    class IconCloser( swing.Icon, aevent.MouseAdapter ):
        
        def __init__( self, iicon, callback ):
            
            aevent.MouseAdapter.__init__( self )
            self.iicon = iicon
            self.component = None
            self.x = None
            self.y = None
            self.callback = callback
            
        def mousePressed( self, event ):
            
            if event.getButton() == event.BUTTON1:
                x = event.getX(); y = event.getY()
                rec = awt.Rectangle( self.x, self.y, self.iicon.getIconWidth(), self.iicon.getIconHeight() )
                if rec.contains( x,y ):
                    self.component.removeMouseListener( self )
                    self.component = None
                    dc = DefCallable(self.callback)
                    swing.SwingUtilities.invokeLater(dc.wrappedAsFutureTask())
            
        def getIconHeight( self ):
            
            return self.iicon.getIconHeight()
            
        def getIconWidth( self ):
            
            return self.iicon.getIconWidth()
            
        def paintIcon( self, jc, g, x, y ):
            
            if self.component == None:
                self.component = jc
                jc.addMouseListener( self )
            self.x = x
            self.y = y
            self.iicon.paintIcon( jc, g, x ,y )
            
    #@nonl
    #@-node:zorcanda!.20051211152605:IconCloser
    #@+node:zorcanda!.20050925152604:iterators
    #@+others
    #@+node:zorcanda!.20050925125327:chaptersIterator
    def chaptersIterator( self ):
    
        if not self.chaptersIterationBlocked:
            #for n in xrange( self.book.getTabCount() ):
            #    widget = self.book.getComponentAt( n )
            #    chapter = self.chapters[ widget ]
            for chapter in self.chapterlist:
                rp = chapter.getRootPosition()
                for z in rp.fromSelfAllNodes_iter( copy = True ):
                    yield z
        else:
            
            for z in self.c.allNodes_iter( copy = 1 ):
                yield z            
    
                    
    #@-node:zorcanda!.20050925125327:chaptersIterator
    #@+node:zorcanda!.20050925153320.1:topLevelSiblingsIterator
    def topLevelSiblingsIterator( self, ):
    
        if not self.chaptersIterationBlocked:
            #for n in xrange( self.book.getTabCount() ):
            #    widget = self.book.getComponentAt( n )
            #    chapter = self.chapters[ widget ]
            for chapter in self.chapterlist:
                rp = chapter.getRootPosition()
                for z in rp.self_and_siblings_iter( copy = True ):
                    yield z
        else:
            rp = self.c.rootPosition()
            for z in rp.self_and_siblings_iter( copy = True ):
                yield z
                
    #@-node:zorcanda!.20050925153320.1:topLevelSiblingsIterator
    #@+node:zorcanda!.20050925152604.1:cycleThroughChapters
    def cycleThroughChapters( self, swap = 1 ):
    
        if not self.chaptersIterationBlocked:
            current = self.current_chapter
            if swap: self.beginUpdate()
            #for n in xrange( self.book.getTabCount() ):
            #    widget = self.book.getComponentAt( n )
            #    chapter = self.chapters[ widget ]
            for chapter in self.chapterlist:
                if swap:    
                    self.current_chapter = chapter
                yield chapter
        
            self.current_chapter = current
            if swap: self.endUpdate()
        else:
            yield self.current_chapter
        
    #@-node:zorcanda!.20050925152604.1:cycleThroughChapters
    #@-others
    #@-node:zorcanda!.20050925152604:iterators
    #@+node:zorcanda!.20051212103009:Undo
    #@+others
    #@+node:zorcanda!.20051212103410:UndoRemoveChapter
    class UndoRemoveChapter( undo.UndoableEdit ):
        
        def __init__( self, chapters, chapter ):
            self.chapters = chapters
            self.chapter = chapter
            self.undone = False
            
        def addEdit( self, edit ): return False
        def canRedo( self ): return self.undone
        def canUndo( self ): return not self.undone
        def die( self ):
            self.chapters = None
            self.chapter = None
        def getPresentationName( self ): return "Undo Remove Chapter %s" % self.chapter.name
        def getRedoPresentationName( self ): return "Redo Removing %s" % self.chapter.name
        def getUndoPresentationName( self ): return "Undo Removing %s" % self.chapter.name
        def isSignificant( self ): return True
        def redo( self ):
            
            self.chapters.quietRemoveChapter( self.chapter )
            self.undone = False
            
        def replaceEdit( self, edit ): return False
        def undo( self ):
            
            self.chapters.insertChapter( self.chapter )
            self.undone = True
        
    #@-node:zorcanda!.20051212103410:UndoRemoveChapter
    #@+node:zorcanda!.20051212110427:UndoChangeChapterName
    class UndoChangeChapterName( undo.UndoableEdit ):
        
        def __init__( self, chapters, chapter, name1, name2 ):
            self.chapters = chapters
            self.chapter = chapter
            self.name1 = name1
            self.name2 = name2
            self.undone = False
            
        def addEdit( self, edit ): return False
        def canRedo( self ): return self.undone
        def canUndo( self ): return not self.undone
        def die( self ):
            self.chapters = None
            self.chapter = None
        def getPresentationName( self ): return "Undo Changing Chapter Name From %s to %s" % ( self.name1, self.name2 )
        def getRedoPresentationName( self ): return "Redo Changing Name From %s to %s" %  ( self.name1, self.name2 )
        def getUndoPresentationName( self ): return "Undo Changing Name From %s to %s" % ( self.name1, self.name2 )
        def isSignificant( self ): return True
        def redo( self ):
            
            book = self.chapters.book
            index = book.indexOfComponent( self.chapter.tree.getWidget() )
            book.setTitleAt( index, self.name2 )
            self.chapter.name = self.name2
            self.undone = False
            
        def replaceEdit( self, edit ): return False
        def undo( self ):
            
            book = self.chapters.book
            index = book.indexOfComponent( self.chapter.tree.getWidget() )
            book.setTitleAt( index, self.name1 )
            self.chapter.name = self.name1
            self.undone = True
    #@-node:zorcanda!.20051212110427:UndoChangeChapterName
    #@+node:zorcanda!.20051212143239:UndoAddChapter
    class UndoAddChapter( undo.UndoableEdit ):
        
        def __init__( self, chapters, chapter ):
            self.chapters = chapters
            self.chapter = chapter
            self.undone = False
            
        def addEdit( self, edit ): return False
        def canRedo( self ): return self.undone
        def canUndo( self ): return not self.undone
        def die( self ):
            self.chapters = None
            self.chapter = None
        def getPresentationName( self ): return "Undo Add Chapter"
        def getRedoPresentationName( self ): return "Redo Add Chapter"
        def getUndoPresentationName( self ): return "Undo Add Chapter"
        def isSignificant( self ): return True
        def redo( self ):
            
            self.chapters.insertChapter( self.chapter )
            self.undone = False
            
        def replaceEdit( self, edit ): return False
        def undo( self ):
            
            self.chapters.quietRemoveChapter( self.chapter )
            self.undone = True
        
    #@-node:zorcanda!.20051212143239:UndoAddChapter
    #@+node:zorcanda!.20051212144733:UndoImport
    class UndoImport( undo.UndoableEdit ):
        
        def __init__( self, chapters, chapter ):
            self.chapters = chapters
            self.chapter_list = []
            self.chapter_list.append( chapter )
            self.undone = False
        
        def addChapter( self, chapter ):
            self.chapter_list.append( chapter )
               
        def addEdit( self, edit ): return False
        def canRedo( self ): return self.undone
        def canUndo( self ): return not self.undone
        def die( self ):
            self.chapters = None
            self.chapter = None
        def getPresentationName( self ): return "Undo Import Outline"
        def getRedoPresentationName( self ): return "Redo Import Outline"
        def getUndoPresentationName( self ): return "Undo Import Outline"
        def isSignificant( self ): return True
        def redo( self ):
            
            for z in self.chapter_list:
                self.chapters.insertChapter( z )
            self.undone = False
            
        def replaceEdit( self, edit ): return False
        def undo( self ):
            
            for z in self.chapter_list:
                self.chapters.quietRemoveChapter( z )
            self.undone = True
        
    #@-node:zorcanda!.20051212144733:UndoImport
    #@+node:zorcanda!.20051212145433:UndoSwapChapters
    class UndoSwapChapters( undo.UndoableEdit ):
        
        def __init__( self, chapters, chapter1, chapter2 ):
            self.chapters = chapters
            self.chapter1 = chapter1
            self.chapter2 = chapter2
            self.undone = False
            
        def addEdit( self, edit ): return False
        def canRedo( self ): return self.undone
        def canUndo( self ): return not self.undone
        def die( self ):
            self.chapters = None
            self.chapter = None
        def getPresentationName( self ): return "Undo Swap Chapters %s , %s" % ( self.chapter1.name, self.chapter2.name )
        def getRedoPresentationName( self ): return "Redo Swap Chapters %s, %s" % ( self.chapter1.name , self.chapter2.name )
        def getUndoPresentationName( self ): return "Undo Swap Chapters %s, %s" % ( self.chapter1.name , self.chapter2.name )
        def isSignificant( self ): return True
        def redo( self ):
            
            self.chapters.swapChapters( self.chapter1, self.chapter2, undo = False )
            self.undone = False
            
        def replaceEdit( self, edit ): return False
        def undo( self ):
            
            self.chapters.swapChapters( self.chapter1, self.chapter2, undo = False )
            self.undone = True
        
    #@-node:zorcanda!.20051212145433:UndoSwapChapters
    #@-others
    #@nonl
    #@-node:zorcanda!.20051212103009:Undo
    #@-others
    
#@-node:zorcanda!.20050924193446:@thin Chapters.py
#@-leo
