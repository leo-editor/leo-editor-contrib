#@+leo-ver=4-thin
#@+node:zorcanda!.20050831133305:@thin DocumentChain.py
import DocumentListener from javax.swing.event.DocumentListener

class DocumentSyncher( DocumentListener ):
    
    def __init__( self ):
        self.listeners = []
        
    
    def addListener( self, listener ):
        
        wr = java.lang.ref.WeakReference( listener )
        self.listeners.append( wr )
        
    
    def changedUpdate( self, event ):
        
        if self.ignore: return
        try:
            self.ignore = 1
            for z in self.listeners:
                referent = z.getReferent()
                if referent:
                    referent.changedUpdate( event )
        finally:
            self.ignore = 0
        
        
        
    def removeUpdate( self, event ):
        
        if self.ignore: return
        try:
            self.ignore = 1
            for z in self.listeners:
                referent = z.getReferent()
                if referent:
                    referent.removeUpdate( event )
        finally:
            self.ignore = 0
        
    def insertUpdate( self, event ):
        
        if self.ignore: return
        try:
            self.ignore = 1
            for z in self.listeners:
                referent = z.getReferent()
                if referent:
                    referent.insertUpdate( event )
        finally:
            self.ignore = 0

#@-node:zorcanda!.20050831133305:@thin DocumentChain.py
#@-leo
