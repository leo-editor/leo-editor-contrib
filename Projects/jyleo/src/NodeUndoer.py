#@+leo-ver=4-thin
#@+node:zorcanda!.20050831165127:@thin NodeUndoer.py
#@<<imports>>
#@+node:zorcanda!.20050907103944:<<imports>>
import java
import java.util as util
import javax.swing as swing
import javax.swing.undo as sundo
import javax.swing.event as sevent
import java.io as io
import jarray
import md5
import org.python.util as putil
import NodeUndoerBase
import LeoCompoundEdit
import leoGlobals as g
import zlib
import leoSwingUndo
import leoPlugins
import leoNodes
import base64
import pickle
import cPickle
from utilities.WeakMethod import WeakMethod
#@nonl
#@-node:zorcanda!.20050907103944:<<imports>>
#@nl
#commanders = util.WeakHashMap()
commanders = {}


class NodeUndoer:
    '''A class that manages NodeUndoerBase instances for tnodes'''
    
    undoers = {} #util.WeakHashMap()
    checksums = util.WeakHashMap()
    
    def __init__( self, c, umenu, rmenu, gtnu, gtnr, vunstack, clearundo ):
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
        wm1 = WeakMethod( self, "serializeForLeoFile" ); wm2 = WeakMethod( self, "unserializeFromLeoFile" )
        wm3 = WeakMethod( self, "checkSumViolation" )
        leoPlugins.registerHandler( "write-leo-file-data", wm1 )
        leoPlugins.registerHandler( "read-leo-file-data", wm2 )
        leoPlugins.registerHandler( "checksum-violation", wm3 )
    
    def undo( self ):
        
        if self.ignore: return
        self.ignore = 1
        self.umanager.undo()
        self.setMenu()
        self.ignore = 0
        return
        
    def redo( self ):
        
        if self.ignore: return
        self.ignore = 1
        self.umanager.redo()
        self.setMenu()
        self.ignore = 0
        return
        
    
    def setNode( self, p ):
        
        #print "SETTING NODE!!! %s" % t
        #print "FILEINDEX %s" % t.fileIndex
        #java.lang.Thread.dumpStack()
        v = p.v
        t = v.t
        #vid = v.vid
        
        if self.tnode:
            self.checksums[ self.tnode ] = md5.md5( self.tnode.bodyString ).hexdigest()
        
        #if self.undoers.containsKey( t ):
        if self.undoers.has_key( v ):
            #print "CONTAINTS %s" % t
            ua = self.undoers[ v ]
            print "--!!!!!!-- %s" % v
            print ua.__class__
            if ua.__class__ == leoSwingUndo.UndoBase:
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
                print "UNPICKLING!!!!!"
                ua = cPickle.loads( ua )
                print "UNPICKLED Is now %s %s" % ( ua, len( ua.undostack ) )
                self.undoers[ v ] = ua
                self.umanager = ua
            if self.checksums.containsKey( t ):
                checksum = self.checksums[ t ]
                amd5 = md5.md5( t.bodyString )
                if amd5.hexdigest() != checksum:
                    self.umanager.discardAllEdits()
                    print "DISCARDED EDITSS!!!!"
                    g.es( "Emptied undoer for %s:%s because of checksum mismatch" % ( t.headString, t ), color = "red" )
                    #self.tnode = t
                    #return
            for z in self.umanager.undostack:
                commanders[ z ] = self.c
                                    
        else:
            print "V not in Undoers %s" % v
            #print v.vid
            self.umanager = leoSwingUndo.UndoBase()
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
            self.c.frame.body._current_editor.setCaretPosition( spot )
            return
            
    def gotoNextRedoSpot( self ):
        ua = self.umanager.editToBeRedone()
        if ua:
            spot = ua.spot
            self.c.frame.body._current_editor.setCaretPosition( spot )
            return

    #@    @+others
    #@+node:zorcanda!.20050901150109:visualiseUndoStack
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
        #@+node:zorcanda!.20050906183758:<<_undoTo>>
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
        #@-node:zorcanda!.20050906183758:<<_undoTo>>
        #@nl
        uto.actionPerformed = _undoTo
        
        rto = swing.JButton( "Redo To" )
        bholder.add( rto )
        #@    <<_redoTo>>
        #@+node:zorcanda!.20050906183938:<<_redoTo>>
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
            
        #@-node:zorcanda!.20050906183938:<<_redoTo>>
        #@nl
        rto.actionPerformed = _redoTo
        
            
        jb = swing.JButton( "Close" )
        jb.actionPerformed = lambda event : jd.dispose()
        bholder.add( jb )
        jd.pack()
        g.app.gui.center_dialog( jd )
        jd.setModal( 1 )
        jd.show()
        
        
    #@-node:zorcanda!.20050901150109:visualiseUndoStack
    #@+node:zorcanda!.20050906110017:buildTableData
    def buildTableData( self ):
        
        data = util.Vector()
        editu = self.umanager.editToBeUndone()
        editr = self.umanager.editToBeRedone()
        umanager = self.umanager
        cu = cr = -1
        edits = umanager.getEdits()
        for z in edits:
            if z.__class__ == LeoCompoundEdit:
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
    
    
    #@-node:zorcanda!.20050906110017:buildTableData
    #@+node:zorcanda!.20050906110426:setDataForTable
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
    #@-node:zorcanda!.20050906110426:setDataForTable
    #@+node:zorcanda!.20050915162326:pickle and unpickle
    def serializeForLeoFile( self, tag, *args, **kwords ):
        
        if not args[ 0 ].has_key( "c" ): return
        c = args[ 0 ][ 'c' ]
        store = args[ 0 ][ 'store' ]
        if c == self.c:
            nwundoers = {}
            for z in self.undoers:
                if  self.undoers[ z ].__class__ == leoSwingUndo.UndoBase:
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
                            #print "A connection %s %s" % ( z, leoNodes.vid_vnode[ z ] )
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
            
    #@-node:zorcanda!.20050915162326:pickle and unpickle
    #@+node:zorcanda!.20050923111739:checkSumViolation
    def checkSumViolation( self, tag, *args, **kwords ):
        
        if not args[ 0 ].has_key( "c" ): return
        c = args[ 0 ][ 'c' ]
        filename = args[ 0 ][ 'filename' ]
        if c == self.c:
            self.checksums_ok = 0
            self.checksum_violations.append( filename )
    #@nonl
    #@-node:zorcanda!.20050923111739:checkSumViolation
    #@+node:zorcanda!.20050907104050:startCompounding stopCompounding
    def startCompounding( self, name ):
        self.compound = UndoableCompoundEvent( name )
        #self.compound = LeoCompoundEdit( name )
            
    def stopCompounding( self ):
            
        compound = self.compound
        compound.end()
        self.compound = None
        #print "COMPOUND is %s" % compound
        self.__addUndo( compound )
        self.setMenu()
    #@-node:zorcanda!.20050907104050:startCompounding stopCompounding
    #@+node:zorcanda!.20050906183457:infrastructure
    #@+others
    #@+node:zorcanda!.20050906113040:UneditableTableModel
    class UneditableTableModel( swing.table.DefaultTableModel ):
        
        def __init__( self ):
            swing.table.DefaultTableModel.__init__( self )
            
        def isCellEditable( self, row, column ):
            return 0
            
    #@-node:zorcanda!.20050906113040:UneditableTableModel
    #@+node:zorcanda!.20050901165934:PickleProxy
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
    #@-node:zorcanda!.20050901165934:PickleProxy
    #@-others
    #@nonl
    #@-node:zorcanda!.20050906183457:infrastructure
    #@+node:zorcanda!.20050906122041:UndoableProxyEvent
    class UndoableProxyEvent( sundo.UndoableEdit ):
    
           
        def __init__( self, event, owner, master , c):
            
            self.event = event
            self.owner = owner
            self.master = master
            self.c = c
            self.cp = c.currentPosition().copy()
            self._can_undo = event.canUndo()
            self._can_redo = event.canRedo()
            self.can_undo = self._can_undo
            self.can_redo = self._can_redo
            self.dieable = 0
            self.ignore = 0
            
        
        def __canRedo( self ):
            return self._can_redo == self.event.canRedo()
            
        def __canUndo( self ):
            return self._can_undo == self.event.canUndo()
                
                
        def addEdit( self, edit ):
            return 0
            
        def canRedo( self ):
            #if self.__canUndo():
            return self.can_redo
            #else:
            #    return self.event.canRedo()
            
        def canUndo( self ):
            #if self.__canRedo():
            return self.can_undo
            #else:
            #    return self.event.canUndo()
            
        def isAlive( self ):
            return self.can_redo or self.can_undo
        
        def invalidate( self ):
            self.c.undoer.killFromEvent( self )
            
        def die( self ):    
            self.can_undo = self.can_redo = 0
            #edits = self.owner.getEdits()
            #spot = edits.indexOf( self.event )
            #self.owner.trimEdits( spot, edits.size() )
        
            
        def getPresentationName( self ):
            return self.event.getPresentationName()
            
        def getRedoPresentationName( self ):
            
            if self.__canRedo():
                return self.event.getRedoPresentationName()
            elif self.isAlive():
                return "Expended %s" % self.event.getRedoPresentationName()
            else:
                return "Dead %s" % self.event.getRedoPresentationName()
            
        def getUndoPresentationName( self ):
            
            if self.__canUndo():
                return self.event.getUndoPresentationName()
            elif self.isAlive():
                return "Expended %s" % self.event.getUndoPresentationName()
            else:
                return "Dead %s" % self.event.getUndoPresentationName()
            
            
        def isSignificant( self ):
            return 1
        
        def sync( self ):
            self._can_redo = self.event.canRedo()
            self._can_undo = self.event.canUndo()
            
        def redo( self ):
            
            self.c.selectPosition( self.cp.copy() )
            self.can_redo = 0
            self.can_undo = 1
            if self.__canRedo():
                self.master.ignore = 1
                if not self.ignore:
                    self.owner.redo()
                self.master.ignore = 0
                self.master.setMenu()
                
            self.sync()
                
            
        def undo( self ):
            
            self.c.selectPosition( self.cp.copy() )
            self.can_undo = 0
            self.can_redo = 1
            if self.__canUndo():
                self.master.ignore = 1
                if not self.ignore:
                    self.owner.undo()
                self.master.ignore = 0
                self.master.setMenu()
                
            self.sync()
            
        def replaceEdit( self, edit ):
            return 0
            
    
    #@-node:zorcanda!.20050906122041:UndoableProxyEvent
    #@-others
    

                    
#@<<UndoableDocumentEvent>>
#@+node:zorcanda!.20050831183609:<<UndoableDocumentEvent>>
class UndoableDocumentEvent3:#( sundo.UndoableEdit, io.Serializable ):
    '''A class that takes the current Editors document and does undo changes
       upon the data within the Editor.  It is assumed that the data in the document
       will be in sync with the changes represented within the UndoableDocumentEvent'''
       
    def __init__( self, c, event, txt = "" ):
        
        commanders[ self ] = c
        self.spot = event.getOffset()
        self.length = event.getLength()
        self.txt = txt

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
    
    #def __getstate__( self ):
    #    dic = self.__dict__
    #    import copy
    #    rv = copy.copy( dic )
    #    #del rv[ c ]
    #    return rv        
            
    def addEdit( self, edit ):
        return 0
        
    def canRedo( self ):
        return self.can_redo
        
    def canUndo( self ):
        
        return self.can_undo
        
    def die( self ):    
        self.can_undo = self.can_redo = 0
        #if die_listeners.has_key( self ):
        #    dlistener = die_listeners[ self ]
        #    if dlistener.dieable:
        #        print "WHACKING %s" % dlistener
        #        dlistener.invalidate()
    
        
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
        doc = c.frame.body._current_editor.getDocument()
        if self.etype == "insert":
            doc.insertString( self.spot, self.txt, None )
            return       
        elif self.etype == "remove":            
            doc.remove( self.spot, self.length )
            return    
        
    def undoEvent( self ):
        

        c = commanders.get( self )                
        doc = c.frame.body._current_editor.getDocument()
        if self.etype == "insert":
            print 'undoing spot %s %s %s' % ( self.spot, self.length, self.txt )
            doc.remove( self.spot, self.length )
            print 'undone %s' % self
            return  
        elif self.etype == "remove":
            doc.insertString( self.spot, self.txt, None )
            return 

    def getForTableModel( self ):
        return util.Vector( [ self.spot, self.txt, self.name, '' ] )
        


#@-node:zorcanda!.20050831183609:<<UndoableDocumentEvent>>
#@nl
#@<<UndoableCompoundEvent>>
#@+node:zorcanda!.20050906155927:<<UndoableCompoundEvent>>
class UndoableCompoundEvent3:
    
    def __init__( self, pname ):
        #self.ce = sundo.CompoundEdit()
        self.pname = pname
        self.undostack = []
        self.can_undo = 1
        self.can_redo = 0
        
    def getPresentationName( self ):
        return self.pname
        
    def getRedoPresentationName( self ):
        return "Redo %s" % self.pname
        
    def getUndoPresentationName( self ):
        return "Undo %s" % self.pname
        
    def canUndo( self ):
        return self.can_undo
        #return self.ce.canUndo()
        
    def canRedo( self ):
        return self.can_redo
        #return self.ce.canRedo()
        
    def undo( self ):
        for z in self.undostack:
            print z
            z.undo()
        self.can_undo = 0
        self.can_redo = 1
        
    def redo( self ):
        
        self.undostack.reverse()
        for z in self.undostack:
            print z
            z.redo()
        
        self.undostack.reverse()
        self.can_undo = 1
        self.can_redo = 0
        
    def isSignificant( self ):
        return 1
        #return self.ce.isSignificant()
        
    def addEdit( self, edit ):
        self.undostack.insert( 0, edit )
        

    
    def die( self ):
        pass
        #return self.ce.die()
        
    def end( self ):
        pass
        #return self.ce.end()
        
        

            
        

#@-node:zorcanda!.20050906155927:<<UndoableCompoundEvent>>
#@nl




#@-node:zorcanda!.20050831165127:@thin NodeUndoer.py
#@-leo
