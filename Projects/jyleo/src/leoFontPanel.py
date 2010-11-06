#@+leo-ver=4-thin
#@+node:ekr.20031218072017.3652:@thin leoFontPanel.py
#@@language python
#@@tabwidth -4
#@@pagewidth 80

import leoGlobals as g
    
class leoFontPanel:
    
    """The base class for Leo's font panel."""

    #@    @+others
    #@+node:ekr.20031218072017.3653:fontPanel.__init__
    def __init__ (self,c):
    
        self.c = c
        self.frame = c.frame
        self.default_font = None # Should be set in subclasses.
        self.last_selected_font = None
    #@nonl
    #@-node:ekr.20031218072017.3653:fontPanel.__init__
    #@+node:ekr.20031218072017.3654:Must be overridden in subclasses
    def bringToFront(self):
        
        self.oops()
        
    def oops(self):
    
        print ("leoTkinterFontPanel oops:",
            g.callerName(2),
            "should be overridden in subclass")
    #@nonl
    #@-node:ekr.20031218072017.3654:Must be overridden in subclasses
    #@-others
#@nonl
#@-node:ekr.20031218072017.3652:@thin leoFontPanel.py
#@-leo
