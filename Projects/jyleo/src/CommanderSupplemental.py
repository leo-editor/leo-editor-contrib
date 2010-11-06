#@+leo-ver=4-thin
#@+node:zorcanda!.20050516103136:@thin CommanderSupplemental.py
#@@language python
import leoGlobals as g

class CommanderSupplemental:
    
    def __init__( self, c ):
        self.c = c
    
    #@    @+others
    #@+node:zorcanda!.20050516103136.1:nodeToOutline
    def nodeToOutline( self ):
        
        c = self.c
        cp = c.currentPosition()
        limport = c.importCommands
        language = g.scanForAtLanguage( self.c, cp ) 
        langdict = {
            "c": limport.scanCText,
            "c++" : limport.scanCText,
            "lisp": limport.scanCText,
            "forth": limport.scanForthText,
            "java": lambda s,v : limport.scanJavaText(s,v, True),
            "pascal": limport.scanPascalText,
            "python": limport.scanPythonText,
            "php": limport.scanPHPText,
        
        
        
        }
        
        mungers = {
        
            'java': self._mungeJavaOutline,
            'python': self._mungePythonOutline,
        
        
        }
        
        if langdict.has_key( language ):
            c.beginUpdate()
            np = cp.insertAfter()
            hs = cp.headString()
            limport.tab_width = limport.getTabWidth()
            limport.methodName = cp.headString()
            #limport.root_Line = "@file"
            bs = cp.bodyString()
            bslines = bs.split( "\n" )
            nwlines = []
            for z in bslines:
                if z.strip() == "@others":
                    pass
                else:
                    nwlines.append( z )
            
            bs = '\n'.join( nwlines )
            langdict[ language ]( bs, np )
            if mungers.has_key( language ):
                mungers[ language ]( cp, np )
            c.endUpdate()
            
    #@nonl
    #@-node:zorcanda!.20050516103136.1:nodeToOutline
    #@+node:zorcanda!.20050516131814:outline mungers
    def _mungeJavaOutline( self,old_p, new_p ):
        
        hs = old_p.headString()
        child1 = new_p.getNthChild( 0 )
        child1.setHeadString( hs )
        child1.moveAfter( old_p )
        children = []
        for z in old_p.children_iter( copy = True ):
            children.append( z )
                    
        for z in children:
            z.moveToLastChildOf( child1 )
            
        old_p.doDelete( child1 )
        new_p.doDelete( child1 )
    
    
    def _mungePythonOutline( self, old_p, new_p ):
        pass
    #@nonl
    #@-node:zorcanda!.20050516131814:outline mungers
    #@-others
#@nonl
#@-node:zorcanda!.20050516103136:@thin CommanderSupplemental.py
#@-leo
