#@+leo-ver=4-thin
#@+node:ekr.20040919081244:@thin style_guide.py
"""This docstring should be a clear, concise description of
what the plugin does and how to use it.
"""

#@@language python
#@@tabwidth -4

#@<< about this plugin >>
#@+node:ekr.20040919082800:<< about this plugin >>
#@+at 
#@nonl
# This section tells what your plugin does and how to use it. You may include 
# as
# much detail as you like, but please try to be as clear and concise as 
# possible.
# 
# This is not the place for ramblings, snippets of code that didn't work, 
# ideas
# for improvements etc.
#@-at
#@nonl
#@-node:ekr.20040919082800:<< about this plugin >>
#@nl
__version__ = "1.0"
#@<< version history >>
#@+node:ekr.20040919082800.1:<< version history >>
#@+at
# 
# This node should contain a comment, starting with '@' as shown above.
# 
# This comment should discuss what makes each version unique. Some people like 
# to
# include a date. You may do so if you like, but I have never found that
# useful...
# 
# 1.0 EKR:  The initial style guide.
#@-at
#@nonl
#@-node:ekr.20040919082800.1:<< version history >>
#@nl
#@<< imports >>
#@+node:ekr.20040919082800.2:<< imports >>
# Almost all plugins will use these two imports.
import leoGlobals as g
import leoPlugins

# Please put imports on a separate line.
# Please do not use 'from x import y' or 'from x import *'.
import os
import sys

# Shows how to test for modules that may not exist...

Tk = g.importExtension('Tkinter',pluginName=__name__,verbose=True)
Pmw = g.importExtension("Pmw",pluginName=__name__,verbose=True)
#@nonl
#@-node:ekr.20040919082800.2:<< imports >>
#@nl
#@<< globals >>
#@+node:ekr.20040919082800.3:<< globals >>
#@+at
# 
# If your plugin uses lots of module-level globals, you may define them in 
# this
# section. You may also define a few globals in the root node.
# 
# However, having lots of globals is an indication that it might be best to
# recast your code using a class. The ivars of this class would replace the
# globals.
# 
# N.B. If your plugin uses data in an outline, it is almost always a bad idea 
# to
# access the data using g.top(). Instead, your plugin should define an 
# onCreate
# function as shown in other nodes. onCreate will create a class instance in
# which self.c is bound to a single commander.
#@-at
#@nonl
#@-node:ekr.20040919082800.3:<< globals >>
#@nl

#@+others
#@+node:ekr.20040919084039:onCreate
#@+at
# 
# This is the recommended way of:
# - Avoiding global variables.  The ivars of myClass take the place of 
# globals.
# - Making sure that your plugin always acts on the proper commander.
#   All methods of myClass use self.c to get the command, NOT g.top().
# 
#@-at
#@@c

def onCreate(tag, keywords):
    
    """
    This function is called whenever a new Leo window gets created.
    
    It creates a class instance in which self.c is bound permanently to c.
    """

    c = keywords.get("c")
    
    # Creates a class instance in which self.c is bound permanently to c.
    myClassInstance = myClass(c)
    
    # Now you can reliably bind other events _for c_ to class methods.
    leoPlugins.registerHandler("a-hook-name",myClassInstance.doWhatever)
#@nonl
#@-node:ekr.20040919084039:onCreate
#@+node:ekr.20040919084723:class myClass
class myClass:
    
    """
    A class illustrating how to bind a class instance permanently to a _particular_ window.
    All methods of this class should use self.c rather than c = g.top().
    """

    #@    @+others
    #@+node:ekr.20040919084723.1:myClass.__init__
    #@+at
    # 
    # Binding c to self.c as shown ensures that this class always acts on the 
    # same
    # commander, regardless of what Leo window is presently on top. This is 
    # crucial to
    # having your plugin work properly when multiple Leo windows are open.
    # 
    #@-at
    #@@c
    
    def __init__ (self,c):
        
        self.c = c
    #@nonl
    #@-node:ekr.20040919084723.1:myClass.__init__
    #@+node:ekr.20040919085218:myClass.doWhatever
    def doWhatever (self):
        
        """
        A method showing how to get the proper commander.
        """
        
        # self.c is always the commander this method should use.
        c = self.c
        
        # Now do whatever you want with c.
    #@nonl
    #@-node:ekr.20040919085218:myClass.doWhatever
    #@-others
#@nonl
#@-node:ekr.20040919084723:class myClass
#@+node:ekr.20040919085752:onStart2
def onStart2 (tag, keywords):
    
    """
    Showing how to define a global hook that affects all commanders.
    """

    import leoTkinterFrame
    log = leoTkinterFrame.leoTkinterLog
    
    # Replace frame.put with newPut. (not shown).
    g.funcToMethod(newPut,log,"put")
#@nonl
#@-node:ekr.20040919085752:onStart2
#@-others

# This statement needed only if the plugin uses modules that are not always available.
if Tk and Pmw and not g.app.unitTesting:
    g.trace('style_guide')
    # The following three lines needed only if the plugin uses a gui.
    if g.app.gui is None: 
        g.app.createTkGui(__file__)
    if g.app.gui.guiName() == "tkinter":
        # Shows how to create a class that binds self.c properly.
        leoPlugins.registerHandler("after-create-leo-frame", onCreate)
        # Shows how to create a hook that doesn't access commanders.
        leoPlugins.registerHandler("start2", onStart2)
        g.plugin_signon(__name__)
#@nonl
#@-node:ekr.20040919081244:@thin style_guide.py
#@-leo
