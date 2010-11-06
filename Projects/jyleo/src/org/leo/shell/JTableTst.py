#@+leo-ver=4-thin
#@+node:zorcanda!.20051120132459:@thin JTableTst.py
import javax.swing as swing
import javax.swing.event as sevent
import javax.swing.table as table
import java

#@<<double table model>>
#@+node:zorcanda!.20051120164602:<<double table model>>
class ListSelectionModelDecorator( swing.ListSelectionModel ):

    def __init__( self, internals, which = 1 ):
        self.internals = internals
        self.which = which

    def addListSelectionListener( self, x):
        if self.which:
            self.internals.addRowListener( x )
        else:
            self.internals.addColumnListener( x )
        
    def addSelectionInterval(self, index0, index1):
        pass
    def clearSelection( self ):
        pass 
    def getAnchorSelectionIndex( self ):
        
        if not self.internals.anchor: return -1
        if self.which:
            return self.internals.anchor[ 0 ]
        else:
            return self.internals.anchor[ 1 ]
             
    def getLeadSelectionIndex( self ):
        
        if not self.internals.lead: return -1
        if self.which:
            return self.internals.lead[ 0 ]
        else:
            return self.internals.lead[ 1 ]
        
    def getMaxSelectionIndex( self ):
        pass
    def getMinSelectionIndex( self ):
        pass
        
    def getSelectionMode( self ):
        pass
    def getValueIsAdjusting( self ):
        return False
        
    def insertIndexInterval( self, index, length, before):
        pass
    def isSelectedIndex( self, index):
        pass 
    def isSelectionEmpty( self ):
        pass 
    def removeIndexInterval( self, index0, index1):
        pass
    def removeListSelectionListener( self, x):
        if self.which:
            self.internals.removeRowListener( x )
        else:
            self.internals.removeColumnListener( x )
        
    def removeSelectionInterval( self, index0, index1):
        pass
    def setAnchorSelectionIndex( self, index):
        pass
    def setLeadSelectionIndex( self, index):
        pass
    def setSelectionInterval( self, index0, index1):
        pass
    def setSelectionMode( self, selectionMode):
        pass
        
    def setValueIsAdjusting( self, valueIsAdjusting ):
        pass

#@-node:zorcanda!.20051120164602:<<double table model>>
#@nl
#@<<table internals>>
#@+node:zorcanda!.20051120164634:<<table internals>>
class Internals:
    
    def __init__( self ):
        self.selections = {}
        self.rowlisteners = []
        self.columnlisteners = []
        self.lead = None
        self.anchor = None

    def addSelection( self, a, b ):
        self.selections[ (a,b ) ] = None
        self.lead = ( a, b )
        lse1 = sevent.ListSelectionEvent( self, a,a,False )
        lse2 = sevent.ListSelectionEvent( self, b,b,False ) 
        for z in self.rowlisteners:
            print z
            z.valueChanged( lse1 )
        for z in self.columnlisteners:
            print z
            z.valueChanged( lse2 ) 
        print "DONES"

    def isSelected( self, a,b ):
        x = (a,b )
        return self.selections.has_key( x )
        
    def removeSelection( self, a, b ):
        x = (a,b )
        del self.selections[ x ]
        lse1 = sevent.ListSelectionEvent( self, a,a,False )
        lse2 = sevent.ListSelectionEvent( self, b,b,False )
        for z in self.rowlisteners:
            print z
            z.valueChanged( lse1 )
        for z in self.columnlisteners:
            print z
            z.valueChanged( lse2 )
        print "DONE"
        
    def addRowListener( self, listener ):
        if listener not in self.rowlisteners:
            self.rowlisteners.append( listener )
            
    def removeRowListener( self, listener ):
        if listener in self.rowlisteners:
            self.rowlisteners.remove( listener )
            
    def addColumnListener( self, listener ):
        if listener not in self.columnlisteners:
            self.columnlisteners.append( listener )
            
    def removeColumnListener( self, listener ):
        if listener in self.columnlisteners:
            self.columnlisteners.remove( listener )
            

#@-node:zorcanda!.20051120164634:<<table internals>>
#@nl

internals = Internals()
lsl1 = ListSelectionModelDecorator( internals )
lsl2 = ListSelectionModelDecorator( internals, which = 0 )
        
class JTable2( swing.JTable ):
    def __init__( self ):
        swing.JTable.__init__( self )
        self.selectedPairs = []
    
    def isCellSelected( self, a, b ):
        
        sm1 = self.getSelectionModel()
        return sm1.internals.isSelected( a, b )
        
    def changeSelection( self, a,b,c,d ):
        
        print c,d
        sm1 = self.getSelectionModel()
        if sm1.internals.isSelected( a, b ):
            sm1.internals.removeSelection( a, b )
        else:
            sm1.internals.addSelection( a,b )
        
        
jf = swing.JFrame();
jt = JTable2()
jsp = swing.JScrollPane( jt )
jf.add( jsp )
jt.setColumnSelectionAllowed( True )
#jt.setRowSelectionAllowed( False )
a = [ [ 'a','b','c'], [ 'd','e','f'], [ 'x','x','x'], ['z','z','z'] ]
b = [ 'cat', 'dog', 'moo' ]
dtm = table.DefaultTableModel( a, b )
jt.setModel( dtm )


jt.setSelectionModel( lsl1 )
cm = jt.getColumnModel()
cm.setSelectionModel( lsl2 )
jf.pack()
jf.visible = 1

#@-node:zorcanda!.20051120132459:@thin JTableTst.py
#@-leo
