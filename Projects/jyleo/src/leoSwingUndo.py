#@+leo-ver=4-thin
#@+node:zorcanda!.20050609201329.1:@thin leoSwingUndo.py
import javax.swing.undo as undo
import javax.swing.event as sevent
#import NodeUndoerBase
import leoGlobals as g
import leoPlugins
import leoNodes
import zlib
import binascii
import pickle
import base64
from utilities.WeakMethod import WeakMethod    


#@<<UndoBase>>
#@+node:zorcanda!.20050915133147:<<UndoBase>>
class UndoBase:
    
    def __init__( self ):
        self.undostack = []
        self.undopointer = 0
    
    def setEditor( self, editor ):
        for z in self.undostack:
            if hasattr( z, "setEditor" ):
                z.setEditor( editor )
       
    def discardAllEdits( self ):
        self.undostack = []
        self.undopointer = 0
        
        
    def getEdits( self ):
        return util.ArrayList( self.undostack )
        
    def undoTo( self, edit ):
        
        l = util.ArrayList( self.undostack )
        iof = l.indexOf( edit )
        amount = self.undopointer - iof
        for z in xrange( amount ):
            self.undo()
            
    def redoTo( self, edit ):   
        
        l = util.ArrayList( self.undostack )
        iof = l.indexOf( edit )
        amount = iof - self.undopointer
        for z in xrange( amount + 1 ):
            self.redo()
        
    def addUndo( self, undo ):
        
        if self.undostack:
            self.undostack = self.undostack[ : self.undopointer ]
        self.undostack.append( undo )
        self.undopointer = len( self.undostack  )
    
    def editToBeUndone( self ):
    
        i = self.undopointer
        if i > 0:
            i -= 1
            e = self.undostack[ i ]
            return e
        return None
        
    def editToBeRedone( self ):
        
        i = self.undopointer
        c = len( self.undostack  )
        if i < c:
            e = self.undostack[ i ]
            return e
        return None
        
    def canUndo( self ):
        
        e = self.editToBeUndone()
        if e:
            return e.canUndo()
        return 0
        
    def canRedo( self ):
        
        e = self.editToBeRedone()
        if e:
            return e.canRedo()
        return 0

    def undo( self ):
        
        i = self.undopointer
        if i > 0:
            i -= 1
            self.undostack[ i ].undo()
            self.undopointer -= 1

        
    def redo( self ):

        self.undostack[ self.undopointer ].redo()
        self.undopointer += 1
        

    def getUndoPresentationName( self ):
        
        e = self.editToBeUndone()
        if e:
            return e.getUndoPresentationName()
        return "Can't Undo"
        
    def getRedoPresentationName( self ):
        
        e = self.editToBeRedone()
        if e:
            return e.getRedoPresentationName()
        return "Can't Redo"


#@-node:zorcanda!.20050915133147:<<UndoBase>>
#@nl
    

class leoSwingUndo( UndoBase ):
    '''A simplified refactored leoUndo, that is based off of the javax.swing.undo package.
       A user who wishes to add a new Undo to the UndoManager must:
           a. subclass javax.swing.undo.UndoableEdit
           b. add it to the leoSwingUndo instance through addUndo
           
       Most, if not all, of the Undoable classes take their methods from leoUndo.
       If there is an existing UndoableEdit that you want to plug into the undo manager
       wrap it in an UndoableEditDecorator and add it.'''
    
    def __init__( self, c ):
        
        #self._um = NUB2()#NodeUndoerBase()
        UndoBase.__init__( self )
        amount = str( g.app.config.getString( c, "undo_stack_size" ) )
        #if amount == "*":
        #    self._um.setLimit( java.lang.Integer.MAX_VALUE )
        #elif amount.isdigit():
        #    self._um.setLimit( int( amount ) )
        self.c = c
        self.checksums_ok = 1
        self.checksum_violations = []
        self.ignore_additions = 0
        self.compound = None
        #self.undostack = []
        #self.undopointer = 0
        self.redoMenuLabel = "Can't Redo"
        self.undoMenuLabel = "Can't Undo"
        self.which_undoer ={
        
            "Move Right": UndoableMoveTree,
            "Move Left": UndoableMoveTree,
            "Move Up": UndoableMoveTree,
            "Move Down": UndoableMoveTree,
            "Drag": UndoableMoveTree,      
            "Insert Node": UndoableInsertNode,
            "Paste Node": UndoableInsertNode,
            "Delete Node": UndoableDeleteNode,
            "Cut Node": UndoableDeleteNode,
            "Demote": UndoableDemote,
            "Premote": UndoablePromote,
            "Hoist": UndoableHoist,
            "De-Hoist" : UndoableDeHoist,
            "Clone Node": UndoableClone,
            "Sort Children": UndoableSortChildren,
            "Sort Siblings": UndoableSortSiblings,
            "Sort Top Level": UndoableSortTopLevel,
            
        }
        
        config = g.app.config
        if config.getBool( c, "store_central_undo" ):
            self.remove_ude = config.getBool( c, "use_text_undo" )
            wm1 = WeakMethod( self, "serializeForLeoFile" )
            wm2 = WeakMethod( self, "unserializeForLeoFile" )
            wm3 = WeakMethod( self, "checkSumViolation" )
            leoPlugins.registerHandler( "write-leo-file-data", wm1 )
            leoPlugins.registerHandler( "read-leo-file-data", wm2 )
            leoPlugins.registerHandler( "checksum-violation", wm3 )
        
    def addUndo( self, undo ):
        
        if not self.ignore_additions:
            
            if self.compound:
                self.compound.addEdit( undo )
                return
                        
            UndoBase.addUndo( self, undo )
            #self._um.addEdit( undo )
            #if self.undostack:
            #    #self.undostack = self.undostack[ self.undopointer : len( self.undostack  ) -1 ]
            #    self.undostack = self.undostack[ : self.undopointer ]
            #self.undostack.append( undo )
            #self.undopointer = len( self.undostack  )
            #self.undostack.append( undo )
            #self.undopointer += 1
        self.setMenu()
        

        
    def undo( self ):
        
        self.ignore_additions = 1
        UndoBase.undo( self )
        #self._um.undo()
        #i = self.undopointer
        #if i > 0:
        #    i -= 1
        #    self.undostack[ i ].undo()
        #    self.undopointer -= 1
        self.ignore_additions = 0
        self.setMenu()
        
    def redo( self ):
        
        self.ignore_additions = 1
        UndoBase.redo( self )
        #self._um.redo()
        #self.undostack[ self.undopointer ].redo()
        #self.undopointer += 1
        self.ignore_additions = 0
        self.setMenu()
        
    def grabLabels( self ):
        
        #self.redoMenuLabel = self._um.getRedoPresentationName()
        #self.undoMenuLabel = self._um.getUndoPresentationName()
        self.undoMenuLabel = self.getUndoPresentationName()
        self.redoMenuLabel = self.getRedoPresentationName()


        
    def killFromEvent( self, event ):
        
        edits = self._um.getEdits()
        i = edits.indexOf( event )
        if i != -1:
            self._um.trimEdits( i, edits.size() -1 )
            self.setMenu()
    
    def setMenu( self, forceupdate = 0 ):
        
        if not hasattr( self.c, 'frame' ): return
        u = self ; frame = u.c.frame
        if not self.c.frame.menu: return
        menu = self.c.frame.menu.getMenu( "Edit" )
        #nredolabel = self._um.getRedoPresentationName()
        nredolabel = self.getRedoPresentationName()
        if ( nredolabel != self.redoMenuLabel ) or forceupdate:
            enabled = self.canRedo()
            #frame.menu.setMenuLabel( menu, self.redoMenuLabel, nredolabel, enabled = enabled  )
            frame.menu.redoMenu.setText( nredolabel ); frame.menu.redoMenu.setEnabled( enabled )
        #nundolabel = self._um.getUndoPresentationName()
        nundolabel = self.getUndoPresentationName()
        if ( nundolabel != self.undoMenuLabel ) or forceupdate:
            enabled = self.canUndo()
            #frame.menu.setMenuLabel( menu, self.undoMenuLabel, nundolabel, enabled = enabled  )
            frame.menu.undoMenu.setText( nundolabel ); frame.menu.undoMenu.setEnabled( enabled )
        
        self.grabLabels()

        
    #@    @+others
    #@+node:zorcanda!.20050609202428:clearUndoState
    def clearUndoState( self ):
        
        #self._um.discardAllEdits()
        self.undostack = []
        self.undopointer = 0
        self.setMenu()
        
    #@-node:zorcanda!.20050609202428:clearUndoState
    #@+node:zorcanda!.20050609202536:setUndoParams
    def setUndoParams( self, *args, **kwords ):
        
        if self.ignore_additions: return
        which = args[ 0 ]
        if which in self.which_undoer:
            undoable_edit = self.which_undoer[ which ](  self.c, args, kwords )
            self.addUndo( undoable_edit )
        
    #@-node:zorcanda!.20050609202536:setUndoParams
    #@+node:zorcanda!.20050813125514:beforeClearRecentFiles
    def beforeClearRecentFiles (self):
        
        u = self ; p = u.c.currentPosition()
        
        bunch = u.createCommonBunch(p)
        bunch.oldRecentFiles = g.app.config.recentFiles[:]
    
        return bunch
    #@nonl
    #@-node:zorcanda!.20050813125514:beforeClearRecentFiles
    #@+node:zorcanda!.20050813125514.1:afterClearRecentFiles
    def afterClearRecentFiles (self,bunch):
        
        u = self
    
        bunch.newRecentFiles = g.app.config.recentFiles[:]
        
        bunch.undoType = 'Clear Recent Files'
        bunch.undoHelper = u.undoClearRecentFiles
        bunch.redoHelper = u.redoClearRecentFiles
        
        # Push the bunch, not a dict.
        #u.bead += 1
        #u.beads[u.bead:] = [bunch]
    
        # Recalculate the menu labels.
        #u.setUndoTypes()
    
        return bunch
    #@nonl
    #@-node:zorcanda!.20050813125514.1:afterClearRecentFiles
    #@+node:zorcanda!.20050813125627:createCommonBunch
    def createCommonBunch (self,p):
        
        '''Return a bunch containing all common undo info.
        This is mostly the info for recreating an empty node at position p.'''
        
        u = self ; c = u.c ; body = c.frame.body
        
        return g.Bunch(
            oldChanged = c.isChanged(),
            oldDirty = p.isDirty(),
            oldMarked = p.isMarked(),
            oldSel = body.getTextSelection(),
            p = p.copy(),
        )
    #@nonl
    #@-node:zorcanda!.20050813125627:createCommonBunch
    #@+node:zorcanda!.20050813125919:redoClearRecentFiles
    def redoClearRecentFiles (self):
        
        u = self ; c = u.c
    
        g.app.recentFiles = u.newRecentFiles[:]
        c.recentFiles = u.newRecentFiles[:]
        
        c.frame.menu.createRecentFilesMenuItems()
    #@nonl
    #@-node:zorcanda!.20050813125919:redoClearRecentFiles
    #@+node:zorcanda!.20050813125755:undoClearRecentFiles
    def undoClearRecentFiles (self):
        
        u = self ; c = u.c
        
        g.app.recentFiles = u.oldRecentFiles[:] 
        c.recentFiles = u.oldRecentFiles[:]
    
        c.frame.menu.createRecentFilesMenuItems()
    #@nonl
    #@-node:zorcanda!.20050813125755:undoClearRecentFiles
    #@+node:zorcanda!.20050923141714:pickling
    #@+others
    #@+node:zorcanda!.20050910121625:def serializeForLeoFile
    def serializeForLeoFile( self, tag, *args, **kwords ):
        
        if not args[ 0 ].has_key( "c" ): return
        c = args[ 0 ][ 'c' ]
        store = args[ 0 ][ 'store' ]
        if c == self.c:
            udata = ( self.undopointer, self.undostack )
            store.addData( "undostack", udata )
            
    #@-node:zorcanda!.20050910121625:def serializeForLeoFile
    #@+node:zorcanda!.20050910122916:def unserializeFromLeoFile
    def unserializeFromLeoFile( self, tag, *args, **kwords ):
    
        if not args[ 0 ].has_key( "c" ): return
        c = args[ 0 ][ 'c' ]
        store = args[ 0 ][ 'store' ]
        if c == self.c and self.checksums_ok:
            try:
                udata = store.getData( "undostack" )
                if udata:
                    self.undopointer = udata[ 0 ]
                    self.undostack = udata[ 1 ]
                    if self.remove_ude:
                        to_remove = []
                        rmv_amount = 0
                        for z in xrange( len( self.undostack ) ):
                            uevent = self.undostack[ z ]
                            if uevent.__class__ == UndoableDocumentEvent:
                                to_remove.append( uevent )
                                if self.undopointer >= z:
                                    rmv_amount += 1
                        self.undopointer -= rmv_amount
                        for z in to_remove:
                            self.undostack.remove( z )
                                    
                    for z in self.undostack:
                        if z.__class__ not in ( UndoableDocumentEvent, UndoableCompoundEvent ):
                            z.c = self.c
                        commanders[ z ] = self.c
                        if z.__class__ == UndoableCompoundEvent:
                            for x in z.undostack:
                                commanders[ x ] = self.c
             
                    self.setMenu()
                    g.es( "Undo Manager restored..." )
            except Exception, x:
                self.undostack = []
                self.undopointer = 0
                self.setMenu()
                g.es( "Resetting the Undo Manager..." )
                
        if not self.checksums_ok:
            g.es( "Undo Manager not restored because of file changes in: %s" % " ,".join( self.checksum_violations ) )
            self.checksums_ok = 1
            self.checksum_violations = []
                
    
    #@-node:zorcanda!.20050910122916:def unserializeFromLeoFile
    #@-others
    #@-node:zorcanda!.20050923141714:pickling
    #@+node:zorcanda!.20050923141714.1:compounding
    def startCompounding( self, name ):
        self.compound = UndoableCompoundEvent( name, p = self.c.currentPosition().copy() )
        #self.compound = LeoCompoundEdit( name )
            
    def stopCompounding( self ):
            
        compound = self.compound
        compound.end()
        self.compound = None
        self.addUndo( compound )
        self.setMenu()
    #@nonl
    #@-node:zorcanda!.20050923141714.1:compounding
    #@+node:zorcanda!.20050923111826:checkSumViolation
    def checkSumViolation( self, tag, *args, **kwords ):
        
        if not args[ 0 ].has_key( "c" ): return
        c = args[ 0 ][ 'c' ]
        filename = args[ 0 ][ 'filename' ]
        if c == self.c:
            self.checksums_ok = 0
            self.checksum_violations.append( filename )
    #@nonl
    #@-node:zorcanda!.20050923111826:checkSumViolation
    #@-others
    

#@<<Undoable classes>>
#@+node:zorcanda!.20050609222056:<<Undoable classes>>
#@+others
#@+node:zorcanda!.20050609201329.2:UndoableEditDecorator
class UndoableEditDecorator( undo.UndoableEdit ):
    
    def __init__( self, c, pos, ue ):
        
        self.c = c
        self.pos = pos.copy()
        self.ue = ue
        
    def addEdit( self, edit ):
        return 0
        
    def canRedo( self ):
        return self.ue.canRedo()
        
    def canUndo( self ):
        return self.ue.canUndo()
        
    def die( self ):
        self.ue.die()
        
    def getPresentatioName( self ):
        return self.ue.getPresentationName()
        
    def getRedoPresentationName( self ):
        return self.ue.getRedoPresentationName()
        
    def getUndoPresentationName( self ):
        return self.ue.getUndoPresentationName()
        
    def isSignificant( self ):
        return self.ue.isSignificant()
        
    def redo( self ):
        
        c = self.c
        cp = c.currentPosition()
        if cp != self.pos:
            c.beginUpdate()
            c.selectPosition( self.pos )
            c.endUpdate()
        self.ue.redo()
        
    def undo( self ):
        
        c = self.c
        cp = c.currentPosition()
        if cp != self.pos:        
            c.beginUpdate()
            c.selectPosition( self.pos )
            c.endUpdate()
        self.ue.undo()
        
    def replaceEdit( self, edit ):
        return 0

#@-node:zorcanda!.20050609201329.2:UndoableEditDecorator
#@+node:zorcanda!.20050831143939:UndoableDocumentEvent
class UndoableDocumentEvent( undo.UndoableEdit ):
    
    def __init__( self,c, event, txt = "", ustack = () ):
        
        self.c = c
        #if p:
        #    self.pos = p.copy()
        #else:      
        #    self.pos = c.currentPosition().copy()
        #self.event = event
        if not ustack:
            self.spot = event.getOffset()
            self.length = event.getLength()
            self.txt = txt
        else:
            self.spot = ustack[ 0 ]
            self.length = ustack[ 1 ]
            self.txt = ustack[ 2 ]
            
        self.can_undo = 1
        self.can_redo = 0
        if txt.isspace():
           name_txt = "%s whitespaces" % len( txt )
        else:
           name_txt = txt
        
        if not ustack:
            if event.getType() == sevent.DocumentEvent.EventType.INSERT:
                self.etype = "insert"
            elif event.getType() == sevent.DocumentEvent.EventType.REMOVE:
                self.etype = "remove"
        else:
            self.etype = ustack[ 3 ]
            
        if self.etype == "insert":
            self.name = "insert %s" % name_txt  
        elif self.etype == "remove":
            self.name = "remove %s" % name_txt
            
    def getAsTuple( self ):
        return ( self.spot, self.length, self.txt, self.etype ) 
            
    def addEdit( self, edit ):
        return 0
        
    def canRedo( self ):
        return self.can_redo
        
    def canUndo( self ):
        
        return self.can_undo
        
    def die( self ):
        
        self.can_undo = self.can_redo = 0
        #self.ue.die()
        
    def getPresentatioName( self ):
        return self.name 
        #return self.ue.getPresentationName()
        
    def getRedoPresentationName( self ):
        #return self.ue.getRedoPresentationName()
        return "Redo %s" % self.name
        
    def getUndoPresentationName( self ):
        #return self.ue.getUndoPresentationName()
        return "Undo %s" % self.name
        
    def isSignificant( self ):
        return 1
        #return self.ue.isSignificant()
        
    def redo( self ):
        
        #cp = self.c.currentPosition()
        #if cp != self.pos:
        #    self.c.selectPosition( self.pos.copy() )
        self.can_redo = 0
        self.can_undo = 1
        self.redoEvent()
        
    def undo( self ):
        
        #cp = self.c.currentPosition()
        #if cp != self.pos:
        #    self.c.selectPosition( self.pos.copy() )
        #self.undoEvent()
        self.can_undo = 0
        self.can_redo = 1
        self.undoEvent()
        
    def replaceEdit( self, edit ):
        return 0
        
    def redoEvent( self ):
        
        doc = self.c.frame.body._current_editor.getDocument()
        if self.etype == "insert":
            doc.insertString( self.spot, self.txt, None )
            return       
        elif self.etype == "remove":            
            doc.remove( self.spot, self.length )
            return    
        
    def undoEvent( self ):
        
        doc = self.c.frame.body._current_editor.getDocument()
        if self.etype == "insert":
            doc.remove( self.spot, self.length )
            return  
        elif self.etype == "remove":
            doc.insertString( self.spot, self.txt, None )
            return 

#@-node:zorcanda!.20050831143939:UndoableDocumentEvent
#@+node:zorcanda!.20050609212452:UndoableMoveTree
class UndoableMoveTree( undo.UndoableEdit ):
    
    def __init__( self, c, args, kwords ):
        
        self.c = c        
        self.oldParent = kwords[ 'oldParent' ]
        if self.oldParent:
            self.oldParent = self.oldParent.copy()
        else:
            self.oldParent = None
        self.oldN = kwords[ 'oldN' ]
        self.oldBack = kwords[ 'oldBack' ]
        if self.oldBack:
            self.oldBack = self.oldBack.copy()
        else:
            self.oldBack = None
            
        self.p = args[ 1 ].copy()
        self.name = args[ 0 ]
        self.parent = self.p.getParent()
        if self.parent:
            self.parent = self.parent.copy()
        else:
            self.parent = None
        self.back = self.p.getBack()
        if self.back:
            self.back = self.back.copy()
        else:
            self.back = None
        self.n = self.p.childIndex()
        
        self.can_undo = 1
        self.can_redo = 0
        
    
    def __getstate__( self ):
        
        d2 = {}
        d2.update( self.__dict__ )
        del d2[ 'c' ]
        return d2
        
        
    def addEdit( self, edit ):
        return 0
        
    def canRedo( self ):
        return self.can_redo
        #return self.ue.canRedo()
        
    def canUndo( self ):
        
        return self.can_undo
        
    def die( self ):
        
        self.can_undo = self.can_redo = 0
        #self.ue.die()
        
    def getPresentatioName( self ):
        return self.name 
        #return self.ue.getPresentationName()
        
    def getRedoPresentationName( self ):
        #return self.ue.getRedoPresentationName()
        return "Redo %s for %s" % ( self.name, self.p.v.t.headString )
        
    def getUndoPresentationName( self ):
        #return self.ue.getUndoPresentationName()
        return "Undo %s for %s" % ( self.name, self.p.v.t.headString )
        
    def isSignificant( self ):
        return 1
        #return self.ue.isSignificant()
        
    def redo( self ):
        
        if not self.can_redo: return
        self.redoMoveNode()
        self.can_redo = 0
        self.can_undo = 1
        
    def undo( self ):
        
        if not self.can_undo: return
        self.undoMoveNode()
        self.can_undo = 0
        self.can_redo = 1
        
    def replaceEdit( self, edit ):
        return 0
        

        
    #@    @+others
    #@+node:zorcanda!.20050609220159:undoMoveNode
    def undoMoveNode (self):
        
        u = self ; c = u.c
        
        # g.trace("oldParent",u.oldParent)
        c.beginUpdate()
        if u.oldParent:
            u.p.moveToNthChildOf(u.oldParent,u.oldN)
        elif u.oldBack:
            u.p.moveAfter(u.oldBack)
        else:
            oldRoot = c.rootPosition() # Bug fix: 4/9/04
            u.p.moveToRoot(oldRoot)
    
        c.selectVnode(u.p.copy())
        c.endUpdate()
        #c.selectPosition( u.p.copy() )
    #@nonl
    #@-node:zorcanda!.20050609220159:undoMoveNode
    #@+node:zorcanda!.20050609220159.1:redoMoveNode
    def redoMoveNode (self):
        
        u = self ; c = u.c
        
        c.beginUpdate()
        # g.trace(u.p)
        if u.parent:
            u.p.moveToNthChildOf(u.parent,u.n)
        elif u.back:
            u.p.moveAfter(u.back)
        else:
            oldRoot = c.rootPosition() # Bug fix: 4/9/04
            u.p.moveToRoot(oldRoot)
    
        #c.selectVnode(u.p)
        c.endUpdate()
        c.selectPosition( u.p.copy() )
    #@-node:zorcanda!.20050609220159.1:redoMoveNode
    #@-others
#@-node:zorcanda!.20050609212452:UndoableMoveTree
#@+node:zorcanda!.20050609222056.1:UndoableInsertNode
class UndoableInsertNode( undo.UndoableEdit ):
    
    def __init__( self, c, args, kwords ):
        
        self.c = c        
        self.select = kwords.get( 'select', None )
        self.p = args[ 1 ].copy()
        self.name = args[ 0 ]
        self.parent = self.p.getParent()
        if self.parent:
            self.parent = self.parent.copy()
        else:
            self.parent = None
        self.back = self.p.getBack()
        if self.back:
            self.back = self.back.copy()
        else:
            self.back = None
        self.n = self.p.childIndex()
        

        
        self.can_undo = 1
        self.can_redo = 0
        
    def __getstate__( self ):
        
        d2 = {}
        d2.update( self.__dict__ )
        del d2[ 'c' ]
        return d2 
        
    def addEdit( self, edit ):
        return 0
        
    def canRedo( self ):
        return self.can_redo
        #return self.ue.canRedo()
        
    def canUndo( self ):
        
        return self.can_undo
        
    def die( self ):
        
        self.can_undo = self.can_redo = 0
        #self.ue.die()
        
    def getPresentatioName( self ):
        return self.name 
        #return self.ue.getPresentationName()
        
    def getRedoPresentationName( self ):

        return "Redo %s for %s" % ( self.name, self.p.v.t.headString )
        
    def getUndoPresentationName( self ):
        #return self.ue.getUndoPresentationName()
        return "Undo %s for %s" % ( self.name, self.p.v.t.headString )
        
    def isSignificant( self ):
        return 1
        #return self.ue.isSignificant()
        
    def redo( self ):
        
        self.redoInsertNodes()
        self.can_redo = 0
        self.can_undo = 1
        
    def undo( self ):
        
        self.undoInsertNodes()
        self.can_undo = 0
        self.can_redo = 1
        
    def replaceEdit( self, edit ):
        return 0
        
        
        
    #@    @+others
    #@+node:zorcanda!.20050609222359:undoInsertNodes
    def undoInsertNodes (self):
        
        u = self ; c = u.c
        c.beginUpdate()
        c.selectVnode(u.p)
        c.deleteOutline()
        #if u.select:
        #    c.selectVnode(u.select)
        c.endUpdate()
        if u.select:
            c.selectPosition( u.select.copy() )
    #@nonl
    #@-node:zorcanda!.20050609222359:undoInsertNodes
    #@+node:zorcanda!.20050609222359.1:redoInsertNodes
    def redoInsertNodes (self):
        
        u = self ; c = u.c
        c.beginUpdate()
        if u.back:
            u.p.linkAfter(u.back)
        elif u.parent:
            u.p.linkAsNthChild(u.parent,0)
        else:
            oldRoot = c.rootPosition()
            u.p.linkAsRoot(oldRoot)
            
        # Restore all vnodeLists (and thus all clone marks).
        u.p.restoreLinksInTree()
    
        #c.selectVnode(u.p)
        c.endUpdate()
        c.selectPosition( u.p.copy() )
    #@nonl
    #@-node:zorcanda!.20050609222359.1:redoInsertNodes
    #@-others
#@-node:zorcanda!.20050609222056.1:UndoableInsertNode
#@+node:zorcanda!.20050609223349:UndoableDeleteNode
class UndoableDeleteNode( undo.UndoableEdit ):
    
    def __init__( self, c, args, kwords ):
        
        self.c = c        
        
        self.select = kwords[ 'select' ]
        self.p = args[ 1 ].copy()
        self.name = args[ 0 ]
        self.parent = self.p.getParent()
        if self.parent:
            self.parent = self.parent.copy()
        else:
            self.parent = None
        self.back = self.p.getBack()
        if self.back:
            self.back = self.back.copy()
        else:
            self.back = None
        self.n = self.p.childIndex()
        
        self.can_undo = 1
        self.can_redo = 0

    def __getstate__( self ):
        
        d2 = {}
        d2.update( self.__dict__ )
        del d2[ 'c' ]
        return d2
        
    def addEdit( self, edit ):
        return 0
        
    def canRedo( self ):
        return self.can_redo
        #return self.ue.canRedo()
        
    def canUndo( self ):
        
        return self.can_undo
        
    def die( self ):
        
        self.can_undo = self.can_redo = 0
        #self.ue.die()
        
    def getPresentatioName( self ):
        return self.name 
        #return self.ue.getPresentationName()
        
    def getRedoPresentationName( self ):
        #return self.ue.getRedoPresentationName()
        return "Redo %s for %s" % ( self.name, self.p.v.t.headString )
        
    def getUndoPresentationName( self ):
        #return self.ue.getUndoPresentationName()
        return "Undo %s for %s" % ( self.name, self.p.v.t.headString )
        
    def isSignificant( self ):
        return 1
        #return self.ue.isSignificant()
        
    def redo( self ):
        
        self.redoDeleteNode()
        self.can_redo = 0
        self.can_undo = 1
        
    def undo( self ):
        
        self.undoDeleteNode()
        self.can_undo = 0
        self.can_redo = 1
        
    def replaceEdit( self, edit ):
        return 0
        
    #@    @+others
    #@+node:zorcanda!.20050609223349.1:redoDeleteNode
    def redoDeleteNode (self):
        
        u = self ; c = u.c
        
        c.beginUpdate()
        c.selectVnode(u.p.copy())
        c.deleteOutline()
        c.endUpdate()
    #@nonl
    #@-node:zorcanda!.20050609223349.1:redoDeleteNode
    #@+node:zorcanda!.20050609223349.2:undoDeleteNode
    #@+at 
    #@nonl
    # Deleting a clone is _not_ the same as undoing a clone:
    # the clone may have been moved, so there is no necessary relationship 
    # between the two nodes.
    #@-at
    #@@c
    
    def undoDeleteNode (self):
        
        u = self ; c = u.c
        
        c.beginUpdate()
        if u.back:
            u.p.linkAfter(u.back)
        elif u.parent:
            u.p.linkAsNthChild(u.parent,0)
        else:
            oldRoot = c.rootPosition()
            u.p.linkAsRoot(oldRoot)
            
        # Restore all vnodeLists (and thus all clone marks).
        u.p.restoreLinksInTree()
    
        #c.selectVnode(u.p)
        c.endUpdate()
        c.selectPosition( u.p.copy() )
    #@nonl
    #@-node:zorcanda!.20050609223349.2:undoDeleteNode
    #@-others
#@nonl
#@-node:zorcanda!.20050609223349:UndoableDeleteNode
#@+node:zorcanda!.20050615142834:UndoableDemote
class UndoableDemote( undo.UndoableEdit ):
    
    def __init__( self, c, args, kwords ):
        
        self.c = c        
        
        self.lastChild = kwords[ 'lastChild' ].copy()
        self.p = args[ 1 ].copy()
        self.name = args[ 0 ]

        
        self.can_undo = 1
        self.can_redo = 0
            
    def __getstate__( self ):
        
        d2 = {}
        d2.update( self.__dict__ )
        del d2[ 'c' ]
        return d2 
        
    def addEdit( self, edit ):
        return 0
        
    def canRedo( self ):
        return self.can_redo
        #return self.ue.canRedo()
        
    def canUndo( self ):
        
        return self.can_undo
        
    def die( self ):
        
        self.can_undo = self.can_redo = 0
        #self.ue.die()
        
    def getPresentatioName( self ):
        return self.name 
        #return self.ue.getPresentationName()
        
    def getRedoPresentationName( self ):
        #return self.ue.getRedoPresentationName()
        return "Redo %s" % self.name
        
    def getUndoPresentationName( self ):
        #return self.ue.getUndoPresentationName()
        return "Undo %s" % self.name
        
    def isSignificant( self ):
        return 1
        #return self.ue.isSignificant()
        
    def redo( self ):
        
        self.redoDemote()
        self.can_redo = 0
        self.can_undo = 1
        
    def undo( self ):
        
        self.undoDemote()
        self.can_undo = 0
        self.can_redo = 1
        
    def replaceEdit( self, edit ):
        return 0
        
    #@    @+others
    #@+node:zorcanda!.20050615142834.1:redoDemote
    def redoDemote (self):
        
        u = self ; c = u.c
        c.beginUpdate()
        c.selectVnode(u.p.copy())
        c.demote()
        c.endUpdate()
    #@nonl
    #@-node:zorcanda!.20050615142834.1:redoDemote
    #@+node:zorcanda!.20050615142834.2:undoDemote
    def undoDemote (self):
        
        u = self ; c = u.c
        c.beginUpdate()
        p   = u.p.copy()
        ins = u.p.copy()
        last = u.lastChild
        assert(p.hasFirstChild)
        child = p.firstChild()
        
        # Do not undemote children up to last.
        # Do not use an iterator here.
        if last:
            while child and child != last:
                child = child.next()
            if child:
                child = child.next()
    
        while child:
            next = child.next()
            child.moveAfter(ins)
            ins = child
            child = next
        #c.selectVnode(p)
        c.endUpdate()
        c.selectPosition( p.copy() )
    #@nonl
    #@-node:zorcanda!.20050615142834.2:undoDemote
    #@-others
#@nonl
#@-node:zorcanda!.20050615142834:UndoableDemote
#@+node:zorcanda!.20050615143218:UndoablePromote
class UndoablePromote( undo.UndoableEdit ):
    
    def __init__( self, c, args, kwords ):
        
        self.c = c        
        
        self.lastChild = kwords[ 'lastChild' ].copy()
        self.p = args[ 1 ].copy()
        self.name = args[ 0 ]

        
        self.can_undo = 1
        self.can_redo = 0
        
    def __getstate__( self ):
        
        d2 = {}
        d2.update( self.__dict__ )
        del d2[ 'c' ]
        return d2 
        
    def addEdit( self, edit ):
        return 0
        
    def canRedo( self ):
        return self.can_redo
        #return self.ue.canRedo()
        
    def canUndo( self ):
        
        return self.can_undo
        
    def die( self ):
        
        self.can_undo = self.can_redo = 0
        #self.ue.die()
        
    def getPresentatioName( self ):
        return self.name 
        #return self.ue.getPresentationName()
        
    def getRedoPresentationName( self ):
        #return self.ue.getRedoPresentationName()
        return "Redo %s" % self.name
        
    def getUndoPresentationName( self ):
        #return self.ue.getUndoPresentationName()
        return "Undo %s" % self.name
        
    def isSignificant( self ):
        return 1
        #return self.ue.isSignificant()
        
    def redo( self ):
        
        self.redoPromote()
        self.can_redo = 0
        self.can_undo = 1
        
    def undo( self ):
        
        self.undoPromote()
        self.can_undo = 0
        self.can_redo = 1
        
    def replaceEdit( self, edit ):
        return 0
        
    #@    @+others
    #@+node:zorcanda!.20050615143218.1:redoPromote
    def redoPromote (self):
        
        u = self ; c = u.c
        c.beginUpdate()
        c.selectVnode(u.p.copy())
        c.promote()
        c.endUpdate()
        
    
    #@-node:zorcanda!.20050615143218.1:redoPromote
    #@+node:zorcanda!.20050615143218.2:undoPromote
    # Undoes the previous promote operation.
    def undoPromote (self):
        
        u = self ; c = u.c
        next = u.p.next()
        last = u.lastChild
        assert(next)
        c.beginUpdate()
        while next: # don't use an iterator here.
            p2 = next
            next = p2.next()
            n = u.p.numberOfChildren()
            p2.moveToNthChildOf(u.p,n)
            if p2 == last: break
        #c.selectVnode(u.p) 
        c.endUpdate()
        c.selectPosition( u.p.copy() )
    #@nonl
    #@-node:zorcanda!.20050615143218.2:undoPromote
    #@-others
#@nonl
#@-node:zorcanda!.20050615143218:UndoablePromote
#@+node:zorcanda!.20050615143551:UndoableHoist
class UndoableHoist( undo.UndoableEdit ):
    
    def __init__( self, c, args, kwords ):
        
        self.c = c        
        self.p = args[ 1 ].copy()
        self.name = args[ 0 ]

        
        self.can_undo = 1
        self.can_redo = 0
        
    def __getstate__( self ):
        
        d2 = {}
        d2.update( self.__dict__ )
        del d2[ 'c' ]
        return d2
        
    def addEdit( self, edit ):
        return 0
        
    def canRedo( self ):
        return self.can_redo
        #return self.ue.canRedo()
        
    def canUndo( self ):
        
        return self.can_undo
        
    def die( self ):
        
        self.can_undo = self.can_redo = 0
        #self.ue.die()
        
    def getPresentatioName( self ):
        return self.name 
        #return self.ue.getPresentationName()
        
    def getRedoPresentationName( self ):
        #return self.ue.getRedoPresentationName()
        return "Redo %s for %s" % ( self.name, self.p.v.t.headString )
        
    def getUndoPresentationName( self ):
        #return self.ue.getUndoPresentationName()
        return "Undo %s for %s" % ( self.name, self.p.v.t.headString )
        
    def isSignificant( self ):
        return 1
        #return self.ue.isSignificant()
        
    def redo( self ):
        
        self.redoHoist()
        self.can_redo = 0
        self.can_undo = 1
        
    def undo( self ):
        
        self.undoHoist()
        self.can_undo = 0
        self.can_redo = 1
        
    def replaceEdit( self, edit ):
        return 0
        
    #@    @+others
    #@+node:zorcanda!.20050615143551.1:redoHoist
    def redoHoist (self):
        
        u = self ; c = u.c
        c.beginUpdate()
        c.selectVnode(u.p.copy())
        c.hoist()
        u.updateSetChangedFlag = False
        c.endUpdate()
        
    
    
    #@-node:zorcanda!.20050615143551.1:redoHoist
    #@+node:zorcanda!.20050615143551.2:undoHoist
    def undoHoist (self):
        
        u = self ; c = u.c
        c.beginUpdate()
        c.selectVnode(u.p.copy())
        c.dehoist()
        u.updateSetChangedFlag = False
        c.endUpdate()
        
        
    #@-node:zorcanda!.20050615143551.2:undoHoist
    #@-others
#@nonl
#@-node:zorcanda!.20050615143551:UndoableHoist
#@+node:zorcanda!.20050615143551.3:UndoableDeHoist
class UndoableDeHoist( undo.UndoableEdit ):
    
    def __init__( self, c, args, kwords ):
        
        self.c = c        
        self.p = args[ 1 ].copy()
        self.name = args[ 0 ]

        
        self.can_undo = 1
        self.can_redo = 0
        
    def __getstate__( self ):
        
        d2 = {}
        d2.update( self.__dict__ )
        del d2[ 'c' ]
        return d2 
        
    def addEdit( self, edit ):
        return 0
        
    def canRedo( self ):
        return self.can_redo
        #return self.ue.canRedo()
        
    def canUndo( self ):
        
        return self.can_undo
        
    def die( self ):
        
        self.can_undo = self.can_redo = 0
        #self.ue.die()
        
    def getPresentatioName( self ):
        return self.name 
        #return self.ue.getPresentationName()
        
    def getRedoPresentationName( self ):
        #return self.ue.getRedoPresentationName()
        return "Redo %s for %s" % ( self.name, self.p.v.t.headString )
        
    def getUndoPresentationName( self ):
        #return self.ue.getUndoPresentationName()
        return "Undo %s for %s" % ( self.name, self.p.v.t.headString )
        
    def isSignificant( self ):
        return 1
        #return self.ue.isSignificant()
        
    def redo( self ):
        
        self.redoDehoist()
        self.can_redo = 0
        self.can_undo = 1
        
    def undo( self ):
        
        self.undoDehoist()
        self.can_undo = 0
        self.can_redo = 1
        
    def replaceEdit( self, edit ):
        return 0
        
    #@    @+others
    #@+node:zorcanda!.20050615143551.4:redoDehoist
    def redoDehoist (self):
        
        u = self ; c = u.c
        c.beginUpdate()
        c.selectVnode(u.p.copy())
        c.dehoist()
        u.updateSetChangedFlag = False
        c.endUpdate()
    
    
    #@-node:zorcanda!.20050615143551.4:redoDehoist
    #@+node:zorcanda!.20050615143551.5:undoDehoist
    def undoDehoist (self):
        
        u = self ; c = u.c
        c.beginUpdate()
        c.selectVnode(u.p.copy())
        c.hoist()
        u.updateSetChangedFlag = False
        c.endUpdate()
    #@-node:zorcanda!.20050615143551.5:undoDehoist
    #@-others
#@nonl
#@-node:zorcanda!.20050615143551.3:UndoableDeHoist
#@+node:zorcanda!.20050615144917:UndoableClone
class UndoableClone( undo.UndoableEdit ):
    
    def __init__( self, c, args, kwords ):
        
        self.c = c        
        p = args[ 1 ].copy()
        self.p = p.copy()
        self.back = p.getBack()
        if self.back:
            self.back = self.back.copy()
        else:
            self.back = None
        self.name = args[ 0 ]

        
        self.can_undo = 1
        self.can_redo = 0
        
    def __getstate__( self ):
        
        d2 = {}
        d2.update( self.__dict__ )
        del d2[ 'c' ]
        return d2 
        
    def addEdit( self, edit ):
        return 0
        
    def canRedo( self ):
        return self.can_redo
        #return self.ue.canRedo()
        
    def canUndo( self ):
        
        return self.can_undo
        
    def die( self ):
        
        self.can_undo = self.can_redo = 0
        #self.ue.die()
        
    def getPresentatioName( self ):
        return self.name 
        #return self.ue.getPresentationName()
        
    def getRedoPresentationName( self ):
        #return self.ue.getRedoPresentationName()
        return "Redo %s for %s" % ( self.name, self.p.v.t.headString )
        
    def getUndoPresentationName( self ):
        #return self.ue.getUndoPresentationName()
        return "Undo %s for %s" % ( self.name, self.p.v.t.headString )
        
    def isSignificant( self ):
        return 1
        #return self.ue.isSignificant()
        
    def redo( self ):
        
        self.redoClone()
        self.can_redo = 0
        self.can_undo = 1
        
    def undo( self ):
        
        self.undoClone()
        self.can_undo = 0
        self.can_redo = 1
        
    def replaceEdit( self, edit ):
        return 0
        
    #@    @+others
    #@+node:zorcanda!.20050615144917.1:undoClone
    def undoClone (self):
        
        u = self ; c = u.c
        c.beginUpdate()
        c.selectVnode(u.p)
        c.deleteOutline()
        #c.selectVnode(u.back)
        c.endUpdate()
        c.selectPosition( u.back.copy() )
    #@nonl
    #@-node:zorcanda!.20050615144917.1:undoClone
    #@+node:zorcanda!.20050615144917.2:redoClone
    def redoClone (self):
        
        u = self ; c = u.c
        
        c.beginUpdate()
        if u.back:
            u.p.linkAfter(u.back)
        elif u.parent:
            u.p.linkAsNthChild(u.parent,0)
        else:
            oldRoot = c.rootPosition()
            u.p.linkAsRoot(oldRoot)
    
        #c.selectVnode(u.p)
        c.endUpdate()
        c.selectPosition( u.p.copy() )
    #@-node:zorcanda!.20050615144917.2:redoClone
    #@-others
#@nonl
#@-node:zorcanda!.20050615144917:UndoableClone
#@+node:zorcanda!.20050615145345:UndoableSortChildren
class UndoableSortChildren( undo.UndoableEdit ):
    
    def __init__( self, c, args, kwords ):
        
        self.c = c        
        self.p = args[ 1 ].copy()
        self.sort = kwords[ 'sort' ]
        self.name = args[ 0 ]

        
        self.can_undo = 1
        self.can_redo = 0
        
    def __getstate__( self ):
        
        d2 = {}
        d2.update( self.__dict__ )
        del d2[ 'c' ]
        return d2 
        
    def addEdit( self, edit ):
        return 0
        
    def canRedo( self ):
        return self.can_redo
        #return self.ue.canRedo()
        
    def canUndo( self ):
        
        return self.can_undo
        
    def die( self ):
        
        self.can_undo = self.can_redo = 0
        #self.ue.die()
        
    def getPresentationName( self ):
        return self.name 
        #return self.ue.getPresentationName()
        
    def getRedoPresentationName( self ):
        #return self.ue.getRedoPresentationName()
        return "Redo %s" % self.name
        
    def getUndoPresentationName( self ):
        #return self.ue.getUndoPresentationName()
        return "Undo %s" % self.name
        
    def isSignificant( self ):
        return 1
        #return self.ue.isSignificant()
        
    def redo( self ):
        
        self.redoSortChildren()
        self.can_redo = 0
        self.can_undo = 1
        
    def undo( self ):
        
        self.undoSortChildren()
        self.can_undo = 0
        self.can_redo = 1
        
    def replaceEdit( self, edit ):
        return 0
        
    #@    @+others
    #@+node:zorcanda!.20050615145345.1:undoSortChildren
    def undoSortChildren (self):
    
        u = self ; c = u.c
        assert(u.p)
        c.beginUpdate()
        c.endEditing()
        index = 0
        for child in u.sort:
            child.moveToNthChildOf(u.p,index)
            index += 1
        c.endUpdate()
    #@nonl
    #@-node:zorcanda!.20050615145345.1:undoSortChildren
    #@+node:zorcanda!.20050615145345.2:redoSortChildren
    def redoSortChildren (self):
        
        u = self ; c = u.c
        c.beginUpdate()
        c.selectVnode(u.p.copy())
        c.sortChildren()
        c.endUpdate()
    #@-node:zorcanda!.20050615145345.2:redoSortChildren
    #@-others
#@nonl
#@-node:zorcanda!.20050615145345:UndoableSortChildren
#@+node:zorcanda!.20050615145705:UndoableSortSiblings
class UndoableSortSiblings( undo.UndoableEdit ):
    
    def __init__( self, c, args, kwords ):
        
        self.c = c        
        self.p = args[ 1 ].copy()
        self.sort = kwords[ 'sort' ]
        self.name = args[ 0 ]

        
        self.can_undo = 1
        self.can_redo = 0
        
    def __getstate__( self ):
        
        d2 = {}
        d2.update( self.__dict__ )
        del d2[ 'c' ]
        return d2
        
    def addEdit( self, edit ):
        return 0
        
    def canRedo( self ):
        return self.can_redo
        #return self.ue.canRedo()
        
    def canUndo( self ):
        
        return self.can_undo
        
    def die( self ):
        
        self.can_undo = self.can_redo = 0
        #self.ue.die()
        
    def getPresentationName( self ):
        return self.name 
        #return self.ue.getPresentationName()
        
    def getRedoPresentationName( self ):
        #return self.ue.getRedoPresentationName()
        return "Redo %s" % self.name
        
    def getUndoPresentationName( self ):
        #return self.ue.getUndoPresentationName()
        return "Undo %s" % self.name
        
    def isSignificant( self ):
        return 1
        #return self.ue.isSignificant()
        
    def redo( self ):
        
        self.redoSortSiblings()
        self.can_redo = 0
        self.can_undo = 1
        
    def undo( self ):
        
        self.undoSortSiblings()
        self.can_undo = 0
        self.can_redo = 1
        
    def replaceEdit( self, edit ):
        return 0
        
    #@    @+others
    #@+node:zorcanda!.20050615145705.1:undoSortSiblings
    def undoSortSiblings (self):
        
        u = self ; c = u.c
    
        parent = u.p.parent()
        assert(u.p and parent)
        c.beginUpdate()
        c.endEditing()
        index = 0
        for sib in u.sort:
            sib.moveToNthChildOf(parent,index)
            index += 1
        parent.setDirty()
        c.endUpdate()
    #@-node:zorcanda!.20050615145705.1:undoSortSiblings
    #@+node:zorcanda!.20050615145705.2:redoSortSiblings
    def redoSortSiblings (self):
        
        u = self ; c = u.c
        c.beginUpdate()
        c.selectVnode(u.p.copy())
        c.sortSiblings()
        c.endUpdate()
        #c.selectPosition( u.p.copy() )
    
    #@-node:zorcanda!.20050615145705.2:redoSortSiblings
    #@-others
#@nonl
#@-node:zorcanda!.20050615145705:UndoableSortSiblings
#@+node:zorcanda!.20050615150114:UndoableSortTopLevel
class UndoableSortTopLevel( undo.UndoableEdit ):
    
    def __init__( self, c, args, kwords ):
        
        self.c = c        
        self.p = args[ 1 ].copy()
        self.sort = kwords[ 'sort' ]
        self.name = args[ 0 ]

        
        self.can_undo = 1
        self.can_redo = 0
        
    def __getstate__( self ):
        
        d2 = {}
        d2.update( self.__dict__ )
        del d2[ 'c' ]
        return d2 
        
    def addEdit( self, edit ):
        return 0
        
    def canRedo( self ):
        return self.can_redo
        #return self.ue.canRedo()
        
    def canUndo( self ):
        
        return self.can_undo
        
    def die( self ):
        
        self.can_undo = self.can_redo = 0
        #self.ue.die()
        
    def getPresentationName( self ):
        return self.name 
        #return self.ue.getPresentationName()
        
    def getRedoPresentationName( self ):
        #return self.ue.getRedoPresentationName()
        return "Redo %s" % self.name
        
    def getUndoPresentationName( self ):
        #return self.ue.getUndoPresentationName()
        return "Undo %s" % self.name
        
    def isSignificant( self ):
        return 1
        #return self.ue.isSignificant()
        
    def redo( self ):
        
        self.redoSortTopLevel()
        self.can_redo = 0
        self.can_undo = 1
        
    def undo( self ):
        
        self.undoSortTopLevel()
        self.can_undo = 0
        self.can_redo = 1
        
    def replaceEdit( self, edit ):
        return 0
        
    #@    @+others
    #@+node:zorcanda!.20050615150114.1:undoSortTopLevel
    def undoSortTopLevel (self):
        
        u = self ; c = u.c
        root = c.rootPosition()
        c.beginUpdate()
        c.endEditing()
        v = u.sort[0]
        v.moveToRoot(oldRoot=root)
        for next in u.sort[1:]:
            next.moveAfter(v)
            v = next
            
        #u.p = None # don't mark u.p dirty
        c.endUpdate()
    #@-node:zorcanda!.20050615150114.1:undoSortTopLevel
    #@+node:zorcanda!.20050615150114.2:redoSortTopLevel
    def redoSortTopLevel (self):
        
        u = self ; c = u.c
        c.beginUpdate()
        c.selectVnode(u.p.copy())
        c.sortTopLevel()
        #u.p = None # don't mark u.p dirty
        c.endUpdate()
        #c.selectPosition( u.p.copy() )
    #@nonl
    #@-node:zorcanda!.20050615150114.2:redoSortTopLevel
    #@-others
#@nonl
#@-node:zorcanda!.20050615150114:UndoableSortTopLevel
#@+node:zorcanda!.20050615150344:UndoableChangeHeadline
class UndoableChangeHeadline( undo.UndoableEdit ):
    
    def __init__( self, c, args, kwords ):
        
        self.c = c        
        self.p = args[ 1 ].copy()
        self.sort = kwords[ 'sort' ]
        self.name = args[ 0 ]

        
        self.can_undo = 1
        self.can_redo = 0
        
    def __getstate__( self ):
        
        d2 = {}
        d2.update( self.__dict__ )
        del d2[ 'c' ]
        return d2 
        
    def addEdit( self, edit ):
        return 0
        
    def canRedo( self ):
        return self.can_redo
        #return self.ue.canRedo()
        
    def canUndo( self ):
        
        return self.can_undo
        
    def die( self ):
        
        self.can_undo = self.can_redo = 0
        #self.ue.die()
        
    def getPresentationName( self ):
        return self.name 
        #return self.ue.getPresentationName()
        
    def getRedoPresentationName( self ):
        #return self.ue.getRedoPresentationName()
        return "Redo %s" % self.name
        
    def getUndoPresentationName( self ):
        #return self.ue.getUndoPresentationName()
        return "Undo %s" % self.name
        
    def isSignificant( self ):
        return 1
        #return self.ue.isSignificant()
        
    def redo( self ):
        
        self.redoChangeHeadline()
        self.can_redo = 0
        self.can_undo = 1
        
    def undo( self ):
        
        self.undoChangeHeadline()
        self.can_undo = 0
        self.can_redo = 1
        
    def replaceEdit( self, edit ):
        return 0
        
    #@    @+others
    #@+node:zorcanda!.20050615150344.1:undoChangeHeadline
    def undoChangeHeadline (self):
        
        u = self ; c = u.c
        
        # g.trace(u.oldText)
        c.beginUpdate()
        u.p.setHeadStringOrHeadline(u.oldText)
        
        #c.selectVnode(u.p)
        c.endUpdate()
        c.selectPosition( u.p.copy() )
    
        
    #@nonl
    #@-node:zorcanda!.20050615150344.1:undoChangeHeadline
    #@+node:zorcanda!.20050615150344.2:redoChangeHeadline
    def redoChangeHeadline (self):
        
        u = self ; c = u.c
        
        # g.trace(u.newText)
        c.beginUpdate()
        u.p.setHeadStringOrHeadline(u.newText)
        
        #c.selectVnode(u.p)
        c.endUpdate()
        c.selectPosition( u.p.copy() )
    #@nonl
    #@-node:zorcanda!.20050615150344.2:redoChangeHeadline
    #@-others
#@nonl
#@-node:zorcanda!.20050615150344:UndoableChangeHeadline
#@+node:zorcanda!.20050923115035:UndoableDocumentEvent
class UndoableDocumentEvent:#( sundo.UndoableEdit, io.Serializable ):
    '''A class that takes the current Editors document and does undo changes
       upon the data within the Editor.  It is assumed that the data in the document
       will be in sync with the changes represented within the UndoableDocumentEvent'''
       
    def __init__( self, c, event, txt = "", p = None ):
        
        commanders[ self ] = c
        self.spot = event.getOffset()
        self.length = event.getLength()
        self.txt = txt
        self.p = p

        self.can_undo = 1
        self.can_redo = 0
        if self.txt.isspace():
           name_txt = "%s whitespaces" % len( self.txt )
        else:
           name_txt = self.txt
        
        if event.getType() == sevent.DocumentEvent.EventType.INSERT:
            self.etype = "insert"
        elif event.getType() == sevent.DocumentEvent.EventType.REMOVE:
            self.etype = "remove"

            
            
        if self.etype == "insert":
            self.name = "insert %s" % name_txt  
        elif self.etype == "remove":
            self.name = "remove %s" % name_txt
        
        self.editor = None
    #def __getstate__( self ):
    #    dic = self.__dict__
    #    import copy
    #    rv = copy.copy( dic )
    #    #del rv[ c ]
    #    return rv        
    
    def setEditor( self, editor ):
        self.editor = editor
            
    def addEdit( self, edit ):
        return 0
        
    def canRedo( self ):
        return self.can_redo
        
    def canUndo( self ):
        
        return self.can_undo
        
    def die( self ):    
        self.can_undo = self.can_redo = 0
    
        
    def getPresentationName( self ):
        return self.name 
        
    def getRedoPresentationName( self ):
        return "Redo %s" % self.name
        
    def getUndoPresentationName( self ):
        return "Undo %s" % self.name
        
    def isSignificant( self ):
        return 1
        
    def redo( self ):
        
        self.can_redo = 0
        self.can_undo = 1
        self.redoEvent()
        
    def undo( self ):
        
        self.can_undo = 0
        self.can_redo = 1
        self.undoEvent()
        
    def replaceEdit( self, edit ):
        return 0
        
    def redoEvent( self ):
        
        c = commanders.get( self )
        if self.p:
            c.selectPosition( self.p.copy() )
        doc = self.editor.getDocument()
        if self.etype == "insert":
            doc.insertString( self.spot, self.txt, None )
            return       
        elif self.etype == "remove":            
            doc.remove( self.spot, self.length )
            return    
        
    def undoEvent( self ):
        

        c = commanders.get( self )
        if self.p:
            c.selectPosition( self.p.copy() )                
        doc = self.editor.getDocument()
        if self.etype == "insert":
            doc.remove( self.spot, self.length )
            return  
        elif self.etype == "remove":
            doc.insertString( self.spot, self.txt, None )
            return 

    def getForTableModel( self ):
        return util.Vector( [ self.spot, self.txt, self.name, '' ] )
        


#@-node:zorcanda!.20050923115035:UndoableDocumentEvent
#@+node:zorcanda!.20050923115137:UndoableCompoundEvent
class UndoableCompoundEvent:
    
    def __init__( self, pname, p = None ):

        self.pname = pname
        self.undostack = []
        self.can_undo = 1
        self.can_redo = 0
        self.p = p
    
    def setEditor( self, editor ):
        for z in self.undostack:
            if hasattr( z, "setEditor" ):
                z.setEditor( editor )
       
    def getPresentationName( self ):
        return self.pname
        
    def getRedoPresentationName( self ):
        return "Redo %s" % self.pname
        
    def getUndoPresentationName( self ):
        return "Undo %s" % self.pname
        
    def canUndo( self ):
        return self.can_undo
        
    def canRedo( self ):
        return self.can_redo
        
    def undo( self ):
        
        if self.p:
            self.p.c.selectPosition( self.p.copy() )
        for z in self.undostack:
            z.undo()
        self.can_undo = 0
        self.can_redo = 1
        
    def redo( self ):
        
        if self.p:
            self.p.c.selectPosition( self.p.copy() )
        self.undostack.reverse()
        for z in self.undostack:
            z.redo()
        
        self.undostack.reverse()
        self.can_undo = 1
        self.can_redo = 0
        
    def isSignificant( self ):
        return 1
        #return self.ce.isSignificant()
        
    def addEdit( self, edit ):
        self.undostack.insert( 0, edit )
        
    def getEdits( self ):
        return self.undostack
    
    def die( self ):
        
        self.undostack = None
        
    def end( self ):
        pass

        
        

            
        


#@-node:zorcanda!.20050923115137:UndoableCompoundEvent
#@-others
#@-node:zorcanda!.20050609222056:<<Undoable classes>>
#@nl

#@<<Node Undoer>>
#@+node:zorcanda!.20050923114946:<<NodeUndoer>>
#@<<imports>>
#@+node:zorcanda!.20050923114946.1:<<imports>>
import java
import java.util as util
import javax.swing as swing
import javax.swing.undo as sundo
#import javax.swing.event as sevent
#import java.io as io
import jarray
import md5
#import org.python.util as putil
#import NodeUndoerBase
#import LeoCompoundEdit
import leoGlobals as g
import zlib
#import leoSwingUndo
import leoPlugins
import leoNodes
import base64
import pickle
import cPickle
#@-node:zorcanda!.20050923114946.1:<<imports>>
#@nl
#commanders = util.WeakHashMap()
commanders = {}


class NodeUndoer:
    '''A class that manages NodeUndoerBase instances for tnodes'''
    
    undoers = {} #util.WeakHashMap()
    checksums = util.WeakHashMap()
    
    def __init__( self, c, umenu, rmenu, gtnu, gtnr, vunstack, clearundo, editor ):
        '''c -> a commander
           umenu -> a JMenuItem that is the 'undo' action
           rmenu -> a JMenuItem that is the 'redo' action
           gtnu -> a JMenuItem that is the 'goto next undo' action
           gtnr -> a JMenuItem that is the 'goto next redo' action
           vunstack -> a JMenuItem that is the 'visualise undo stack' action
           clearundo -> a JMenuItem that is the 'clear undo stack' action
        '''
        
        self.c = c
        self.umenu = umenu
        umenu.actionPerformed = lambda event: self.undo()
        self.rmenu = rmenu
        rmenu.actionPerformed = lambda event: self.redo()
        self.gtnu = gtnu
        gtnu.actionPerformed = lambda event: self.gotoNextUndoSpot()
        self.gtnr = gtnr
        gtnr.actionPerformed = lambda event : self.gotoNextRedoSpot()
        self.umanager = None
        self.vunstack = vunstack
        vunstack.actionPerformed = lambda event: self.visualiseUndoStack()
        self.clearundo = clearundo
        clearundo.actionPerformed = lambda event: self.clearUndo()
        self.ignore = 0
        self.tnode = None
        self.compound = None 
        self.checksums_ok = 1
        self.checksum_violations = []
        self.editor = editor
        config = g.app.config
        if config.getBool( c, "store_text_undos" ): 
            wm1 = WeakMethod( self, "serializeForLeoFile" )
            wm2 = WeakMethod( self, "unserializeForLeoFile" )
            wm3 = WeakMethod( self, "checkSumViolation" )
            leoPlugins.registerHandler( "write-leo-file-data", wm1 )
            leoPlugins.registerHandler( "read-leo-file-data", wm2 )
            leoPlugins.registerHandler( "checksum-violation", wm3 )
    
    def undo( self ):
        
        if self.ignore: return
        self.ignore = 1
        self.umanager.setEditor( self.editor )
        self.umanager.undo()
        self.setMenu()
        self.ignore = 0
        return
        
    def redo( self ):
        
        if self.ignore: return
        self.ignore = 1
        self.umanager.setEditor( self.editor )
        self.umanager.redo()
        self.setMenu()
        self.ignore = 0
        return
    
    def checkSumNode( self, t ):
        
        amd5 = md5.md5( t.bodyString )
        hdigest = amd5.hexdigest()
        self.checksums[ t ] = hdigest
        return hdigest
                   
    
    def setNode( self, p ):
        
        v = p.v
        t = v.t
        #vid = v.vid
        
        if self.tnode:
            self.checksums[ self.tnode ] = md5.md5( self.tnode.bodyString ).hexdigest()
        
        #if self.undoers.containsKey( t ):
        if self.undoers.has_key( v ):
            ua = self.undoers[ v ]
            if ua.__class__ == UndoBase:
                self.umanager = self.undoers[ v ]
                #if self.checksums.containsKey( v ):
                #    checksum = self.checksums[ v ]
                #    amd5 = md5.md5( t.bodyString )
                #    if amd5.hexdigest() != checksum:
                #        self.umanager.discardAllEdits()
                #        g.es( "Emptied undoer for %s:%s because of checksum mismatch" % ( t.headString, t ), color = "red" )
                #        #self.tnode = t
                #        #return
                #for z in self.umanager.undostack:
                #    commanders[ z ] = self.c
            else:
                ua = cPickle.loads( ua )
                self.undoers[ v ] = ua
                self.umanager = ua
            if self.checksums.containsKey( t ):
                checksum = self.checksums[ t ]
                #amd5 = md5.md5( t.bodyString )
                hexdigest = self.checkSumNode( t )
                if amd5.hexdigest() != checksum:
                    self.umanager.discardAllEdits()
                    g.es( "Emptied undoer for %s:%s because of checksum mismatch" % ( t.headString, t ), color = "red" )
                    #self.tnode = t
                    #return
            for z in self.umanager.undostack:
                commanders[ z ] = self.c
                                    
        else:
            #print v.vid
            self.umanager = UndoBase()
            self.undoers[ v ] = self.umanager

        self.tnode = t
        self.setMenu()
        
    def __addUndo( self, undo ):
        #self.umanager.addEdit( undo )
        self.umanager.addUndo( undo )
        #upe = self.UndoableProxyEvent( undo, self.umanager, self, self.c )
        #self.c.undoer.addUndo( upe )
        #die_listeners[ undo ] = upe
        
        
    def addUndo( self, undo ):
        
        if not self.ignore:
            
            if self.compound:
                self.compound.addEdit( undo )
                return
            
            self.__addUndo( undo )                
    
        self.setMenu()
            
    def setMenu( self ):
        
        self.umenu.setText( self.umanager.getUndoPresentationName() )
        self.umenu.setEnabled( self.umanager.canUndo() )
        if self.umanager.canUndo():
            self.gtnu.setEnabled( 1 )
        else:
            self.gtnu.setEnabled( 0 )
        self.rmenu.setText( self.umanager.getRedoPresentationName() )    
        self.rmenu.setEnabled( self.umanager.canRedo() ) 
        if self.umanager.canRedo():
            self.gtnr.setEnabled( 1 )
        else:
            self.gtnr.setEnabled( 0 )
        
        self.c.undoer.setMenu()
               
    
    
    def getUStack( self, tnode ):
            
        if hasattr( tnode, 'unknownAttributes' ):
            uas = tnode.unknownAttributes
        else:
            tnode.unknownAttributes = uas = {}
        
        return uas
        

    def clearUndo( self ):
        
        self.umanager.discardAllEdits()
        self.setMenu()
        
    def gotoNextUndoSpot( self ):
        
        ua = self.umanager.editToBeUndone()
        if ua:
            spot = ua.spot
            self.editor.setCaretPosition( spot )
            return
            
    def gotoNextRedoSpot( self ):
        ua = self.umanager.editToBeRedone()
        if ua:
            spot = ua.spot
            self.editor.setCaretPosition( spot )
            return

    #@    @+others
    #@+node:zorcanda!.20050923114946.2:visualiseUndoStack
    def visualiseUndoStack( self ):
        
        umanager = self.umanager            
        table = swing.JTable( self.UneditableTableModel() )#( data, util.Vector( [ 'spot', 'data', 'action', 'redo/undo' ] ) )
        table.setSelectionMode( swing.ListSelectionModel.SINGLE_SELECTION )
        self.setDataForTable( table )
    
        
        jd = swing.JDialog()
        jd.setTitle( "Undo Stack" )
        cp = jd.getContentPane()
        cp.add( swing.JScrollPane( table ) )
        bholder = swing.JPanel()
        cp.add( bholder, java.awt.BorderLayout.SOUTH )
        uto = swing.JButton( "Undo To" )
        bholder.add( uto )
        #@    <<_undoTo>>
        #@+node:zorcanda!.20050923114946.3:<<_undoTo>>
        def _undoTo( event ):
            sr = table.getSelectedRow()
            if sr == -1:
                swing.JOptionPane.showMessageDialog( None,
                                                    "No Selected Row",
                                                    "Select A Row Please",
                                                    swing.JOptionPane.INFORMATION_MESSAGE )
                return
            edits = umanager.getEdits()
            undo = edits.get( sr )
            if not undo.canUndo():
                swing.JOptionPane.showMessageDialog( None, 
                                                    "Cant Undo To This Point", 
                                                    "Illegal Undo Selection", 
                                                    swing.JOptionPane.WARNING_MESSAGE )
                return
            self.ignore = 1
            umanager.undoTo( undo )
            self.ignore = 0
            self.setDataForTable( table )
        #@-node:zorcanda!.20050923114946.3:<<_undoTo>>
        #@nl
        uto.actionPerformed = _undoTo
        
        rto = swing.JButton( "Redo To" )
        bholder.add( rto )
        #@    <<_redoTo>>
        #@+node:zorcanda!.20050923114946.4:<<_redoTo>>
        def _redoTo( event ):
            sr = table.getSelectedRow()
            if sr == -1:
                swing.JOptionPane.showMessageDialog( None,
                                                    "No Selected Row",
                                                    "Select A Row Please",
                                                    swing.JOptionPane.INFORMATION_MESSAGE )
                return
            edits = umanager.getEdits()
            undo = edits.get( sr )
            if not undo.canRedo():
                swing.JOptionPane.showMessageDialog( None, 
                                                    "Cant Redo To This Point", 
                                                    "Illegal Redo Selection", 
                                                    swing.JOptionPane.WARNING_MESSAGE )
                return
                
            self.ignore = 1
            umanager.redoTo( undo )
            self.ignore = 0
            self.setDataForTable( table )
            
        #@-node:zorcanda!.20050923114946.4:<<_redoTo>>
        #@nl
        rto.actionPerformed = _redoTo
        
            
        jb = swing.JButton( "Close" )
        jb.actionPerformed = lambda event : jd.dispose()
        bholder.add( jb )
        jd.pack()
        g.app.gui.center_dialog( jd )
        jd.setModal( 1 )
        jd.show()
        
        
    #@-node:zorcanda!.20050923114946.2:visualiseUndoStack
    #@+node:zorcanda!.20050923114946.5:buildTableData
    def buildTableData( self ):
        
        data = util.Vector()
        editu = self.umanager.editToBeUndone()
        editr = self.umanager.editToBeRedone()
        umanager = self.umanager
        cu = cr = -1
        edits = umanager.getEdits()
        for z in edits:
            if z.__class__ == UndoableCompoundEvent: #LeoCompoundEdit:
                vec = java.util.Vector()
                edits2 = z.getEdits()
                spot = edits2[ 0 ].spot
                vec.add( spot )
                vec.add( "?" )
                vec.add( z.getPresentationName() )
                vec.add( "" )
            else:
                vec = z.getForTableModel()
                
            if z is editu:
                vec.set( 3, 'current undo' )
                cu = edits.indexOf( z )
            elif z.canUndo():
                vec.set( 3, 'undo' )
            if z is editr:
                vec.set( 3, 'current redo' )
                cr = edits.indexOf( z )
            elif z.canRedo():
                vec.set( 3, 'redo' )
            data.add( vec )
        
        return data, cu, cr
    
    
    #@-node:zorcanda!.20050923114946.5:buildTableData
    #@+node:zorcanda!.20050923114946.6:setDataForTable
    def setDataForTable( self, table ):
        
        data, cu, cr = self.buildTableData()
        dm = table.getModel()
        dm.setDataVector( data, util.Vector( [ 'spot', 'data', 'action', 'redo/undo' ] ) )
        lsm = table.getSelectionModel()
        if cu != -1:
            lsm.setLeadSelectionIndex( cu )
        elif cr != -1:
            lsm.setLeadSelectionIndex( cr )
            
            
        
    #@nonl
    #@-node:zorcanda!.20050923114946.6:setDataForTable
    #@+node:zorcanda!.20050923114946.7:pickle and unpickle
    def serializeForLeoFile( self, tag, *args, **kwords ):
        
        if not args[ 0 ].has_key( "c" ): return
        c = args[ 0 ][ 'c' ]
        store = args[ 0 ][ 'store' ]
        if c == self.c:
            nwundoers = {}
            for z in self.undoers:
                if  self.undoers[ z ].__class__ == UndoBase:
                    nwundoers[ z.vid ] = cPickle.dumps( self.undoers[ z ] )
                else:
                    nwundoers[ z.vid ] = self.undoers[ z ]
                    
            store.addData( "tundoer", nwundoers ) #the storage class does the rest of the work for us
            
    
    def unserializeFromLeoFile( self, tag, *args, **kwords ):
    
        if not args[ 0 ].has_key( "c" ): return
        c = args[ 0 ][ 'c' ]
        store = args[ 0 ][ 'store' ]
        if c == self.c and self.checksums_ok:
            try:
                udata = store.getData( "tundoer" )
                if udata:
                    for z in udata:
                        if leoNodes.vid_vnode.has_key( z ):
                            v = leoNodes.vid_vnode[ z ]
                            self.undoers[ v ] = udata[ z ]
    
            except:
                self.undostack = []
                self.undopointer = 0
    
        if not self.checksums_ok:
            self.checksums_ok = 1
            self.checksum_violations = []
            self.undostack = []
            self.undopointer = 0
            
    #@-node:zorcanda!.20050923114946.7:pickle and unpickle
    #@+node:zorcanda!.20050923114946.8:checkSumViolation
    def checkSumViolation( self, tag, *args, **kwords ):
        
        if not args[ 0 ].has_key( "c" ): return
        c = args[ 0 ][ 'c' ]
        filename = args[ 0 ][ 'filename' ]
        if c == self.c:
            self.checksums_ok = 0
            self.checksum_violations.append( filename )
    #@nonl
    #@-node:zorcanda!.20050923114946.8:checkSumViolation
    #@+node:zorcanda!.20050923114946.9:startCompounding stopCompounding
    def startCompounding( self, name ):
        self.compound = UndoableCompoundEvent( name )
        #self.compound = LeoCompoundEdit( name )
            
    def stopCompounding( self ):
            
        compound = self.compound
        compound.end()
        self.compound = None
        self.__addUndo( compound )
        self.setMenu()
    #@-node:zorcanda!.20050923114946.9:startCompounding stopCompounding
    #@+node:zorcanda!.20050923114946.10:infrastructure
    #@+others
    #@+node:zorcanda!.20050923114946.11:UneditableTableModel
    class UneditableTableModel( swing.table.DefaultTableModel ):
        
        def __init__( self ):
            swing.table.DefaultTableModel.__init__( self )
            
        def isCellEditable( self, row, column ):
            return 0
            
    #@-node:zorcanda!.20050923114946.11:UneditableTableModel
    #@+node:zorcanda!.20050923114946.12:PickleProxy
    class PickleProxy:
        '''This class exists to pickle the NodeUndoerBase instance into a form
           that can be safely stored in a Leo ua.'''
           
        def __init__( self, undoer, t ):
            self.undoer = undoer
            self.t = t
                
        def getPickleProxy( self ):
            
            try:
                #array = self.undoer.serializeSelf()
                data = pickle.dumps( self.undoer )
                ds = len( data )
                pp = zlib.compress( data, level = 9 )
                ps = len( pp )
                amd5 = md5.md5( self.t.bodyString )
                checksum = amd5.hexdigest()
                return pp, checksum 
            except Exception, x:
                return "", ""  
    #@-node:zorcanda!.20050923114946.12:PickleProxy
    #@-others
    #@nonl
    #@-node:zorcanda!.20050923114946.10:infrastructure
    #@-others
    






#@-node:zorcanda!.20050923114946:<<NodeUndoer>>
#@nl







#@-node:zorcanda!.20050609201329.1:@thin leoSwingUndo.py
#@-leo
