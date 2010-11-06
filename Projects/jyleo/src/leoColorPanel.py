#@+leo-ver=4-thin
#@+node:ekr.20031218072017.3626:@thin leoColorPanel.py
#@@language python
#@@tabwidth -4
#@@pagewidth 80

import leoGlobals as g

class leoColorPanel:
    
    """A base class to create Leo's color panel.
    
    Subclasses may create subsidiary panels."""
    
    #@    << define default color panel data >>
    #@+node:ekr.20031218072017.3627:<< define default color panel data >>
    colorPanelData = (
        #Dialog name,                option name,         default color),
        ("Brackets",          "section_name_brackets_color", "blue"),
        ("Comments",          "comment_color",               "red"),
        ("CWEB section names","cweb_section_name_color",     "red"),
        ("Directives",        "directive_color",             "blue"),
        ("Doc parts",         "doc_part_color",              "red"),
        ("Keywords" ,         "keyword_color",               "blue"),
        ("Leo Keywords",      "leo_keyword_color",           "blue"),
        ("Section Names",     "section_name_color",          "red"),
        ("Strings",           "string_color",   "#00aa00"), # Used by IDLE.
        ("Undefined Names",   "undefined_section_name_color","red") )
    #@nonl
    #@-node:ekr.20031218072017.3627:<< define default color panel data >>
    #@nl

    #@    @+others
    #@+node:ekr.20031218072017.3628:leoColorPanels.__init__
    def __init__ (self,c):
        
        self.c = c
        self.frame = c.frame
        self.top = None # Created in subclass.
    
        self.revertColors = {}
    
        for name,option_name,default_color in self.colorPanelData:
            self.revertColors[option_name] = c.config.getColor(option_name)
    #@nonl
    #@-node:ekr.20031218072017.3628:leoColorPanels.__init__
    #@+node:ekr.20031218072017.3629:Must be overridden in subclasses
    def bringToFront (self):
        self.oops()
    
    def oops(self):
        print "leoColorPanel oops:", g.callerName(2), "should be overridden in subclass"
    #@nonl
    #@-node:ekr.20031218072017.3629:Must be overridden in subclasses
    #@-others
#@-node:ekr.20031218072017.3626:@thin leoColorPanel.py
#@-leo
