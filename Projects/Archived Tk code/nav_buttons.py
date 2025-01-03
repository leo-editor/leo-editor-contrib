#@+leo-ver=5-thin
#@+node:edream.110203113231.758: * @file nav_buttons.py
#@+<< docstring >>
#@+node:bob.20080103150617: ** << docstring >>
""" Adds navigation buttons to icon bar

This plugin adds buttons to the icon bar that:

- allow the selected position to be moved between recently visited positions

- pops up a dialog which shows recently visited positions and allows them
  to be selected.

- pops up a dialog which shows currently marked nodes and allows them to be
  selected.

In addition, the marks button and the previous/next arrow buttons have right 
click menus.

**Commands**

    show-recent-sections-dialog

    show-marks-dialog

**rClick menu generator commands**

    These minibuffer commands are for use in rClick and @popup menus. To include
    the menus generated by these commands:

        In @popup menus use '@item \*' in the headline and the name of the
        command as the first line of the body.

        In rClick menu tables use ('\*', <command-name>)

    nav-marks-menu:

        creates menu items for each marked headline that will select that headline
        when invoked.

    nav-prev-menu:

        creates menu items for each previously visited node that will select
        that headline when invoked. The items are created in the same order as
        the headlines would be visited by pressing the left arrow icon.

    nav-next-menu:

        creates menu items for each next-to-be-visited node that will
        select that headline when invoked. The items are created in the same
        order they would be visited by pressing the right arrow icon.

    Typical usage for these commands would be:

        @menu prev
            @item *    body = nav-prev-menu
"""
#@-<< docstring >>

#@@language python
#@@tabwidth -4

#@+<< imports >>
#@+node:ekr.20050219114353: ** << imports >>
import leo.core.leoGlobals as g

if g.app.gui.guiName() == 'tkinter':

    import leo.plugins.tkGui as tkGui
    leoTkinterDialog = tkGui.leoTkinterDialog
    tkinterListBoxDialog = tkGui.tkinterListBoxDialog

    try:
        import Tkinter as Tk
    except ImportError:
        Tk = None
else:
    class tkinterListBoxDialog: pass
    Tk = None

import os
#@-<< imports >>
__version__ = "1.15" # EKR: Don't touch this code without my permission!
#@+<< version history >>
#@+node:ekr.20050219114353.1: ** << version history >>
#@@killcolor
#@+at
# 
# 1.3 EKR:
# - Rewritten to use:
#     - init and onCreate functions.
#     - Common imageClass.
#     - per-commander dialogs.
#     - positions rather than vnodes.
# - Fixed numerous bugs.
# - The code is _much_ simpler than before.
# - Added marksInitiallyVisible and recentInitiallyVisible config
# constants.
# 1.4 EKR: 2 bug fixes
# - Allways fill the box when clicking on the 'Recent' button.
# - Use keywords.get('c') NOT self.c in hook handlers.  They may not be the same!
# - This is actually a bug in registerHandler, but it can't be
# fixed because there is no way to associate commanders with hook handlers.
# 1.5 EKR: Fixed crasher in tkinterListBoxDialog.go().
# updateMarks must set positionList ivar in the base class.
# 1.6 EKR: Use c.nodeHistory methods instead of raw ivars of the commander.
# 1.7 plumloco: Modified to be gui-independant.
# 1.8 EKR:
# - Added show-marks-dialog and show-recent-sections-dialog commands.
# - Select an item initially.
# - Added bindings for up and down arrows.
# 1.9 bobjack:
# - Fixed hook bugs.
#     - added module level hook dispatchers and a guard so that hooks
#       only get registered once.  Hooks handlers for non existent
#       commanders as the references in the hook list were keeping
#       these alive.
#     - changed mark hooks from open2, new2 to after-create-leo-frame
#       as open2 and new2 do not work
#     - removed open2 and new2 from recent hooks ditto.
# 1.10 bobjack:
# - Added rClick menus to left and right nav buttons
# - Added rClick menu to Marks button
# - Limited menu lengths to 30 items.
# 1.11 bobjack:
# - Added some docstrings.
# - Moved hook registration to init.
# 1.12 bobjack:
#     - bind prev and next buttons together if Tk and toolbar plugin enabled
# 1.13 EKR: Reverted to organization used in Leo 4.4.5, while retaining latest code.
# 1.14 EKR: Added guards for c.nodeHistory.
# 1.15 EKR: Import from tkGui as needed.
#@-<< version history >>

marksInitiallyVisible = False
recentInitiallyVisible = False

#@+others
#@+node:ekr.20050219114353.2: ** init
def init ():

    ok = Tk and g.app.gui.guiName() == "tkinter"

    if ok:
        g.registerHandler('after-create-leo-frame',onCreate)
        g.plugin_signon(__name__)

    return ok
#@+node:ekr.20050219115116: ** onCreate
def onCreate (tag,keywords):

    # Not ok for unit testing: can't use unitTestGui.
    if g.app.unitTesting or g.app.gui.guiName() != 'tkinter':
        return

    c = keywords.get("c")
    r = g.registerHandler

    images = imageClass()

    # Create the marks dialog and hooks.
    marks = marksDialog(c,images)
    marks.updateMarks()
    r(('set-mark','clear-mark'),marks.updateMarks)

    # Create the recent nodes dialog.
    recent = recentSectionsDialog(c,images)
    recent.updateRecent()
    r('select2',recent.updateRecent)
#@+node:ekr.20050219115859: ** class imageClass
class imageClass:

    """An image manager class."""

    #@+others
    #@+node:ekr.20050219115859.1: *3* ctor
    def __init__ (self):

        """Load the images needed for the module."""

        if not Tk:
            return

        self.path = g.os_path_join(g.app.loadDir,'..','Icons')

        # Create images and set ivars.
        for ivar,icon in (
            ('lt_nav_disabled_image','lt_arrow_disabled.gif'),
            ('lt_nav_enabled_image', 'lt_arrow_enabled.gif'),
            ('rt_nav_disabled_image','rt_arrow_disabled.gif'),
            ('rt_nav_enabled_image', 'rt_arrow_enabled.gif'),
        ):
            image = self.createImage(icon)
            setattr(self,ivar,image)
    #@+node:ekr.20050219115859.2: *3* createImage
    def createImage (self,iconName):

        """Load a single image from a file."""

        path = os.path.normpath(os.path.join(self.path,iconName))

        try:
            image = Tk.PhotoImage(master=g.app.root,file=path)
        except:
            g.es("can not load icon: %s" % iconName)
            image = None

        return image
    #@-others
#@+node:edream.110203113231.775: ** class marksDialog (listBoxDialog)
class marksDialog (tkinterListBoxDialog):

    """A class to create the marks dialog."""

    #@+others
    #@+node:edream.110203113231.776: *3*  marksDialog.__init__
    def __init__ (self,c,images):

        """Create a Marks listbox dialog."""

        self.c = c
        self.images = images

        self.label = None
        self.title = 'Marks for %s' % g.shortFileName(c.mFileName) # c.frame.title

        # Init the base class and call self.createFrame.
        tkinterListBoxDialog.__init__(self,c,self.title,self.label)

        # Create the show-marks-dialog command.
        self.addCommand()


        if not marksInitiallyVisible:
            self.top.withdraw()

        self.addButtons()

        # Create the marks menu generator commands.
        self.addGeneratorCommands()

        c.bind(self.top,"<Up>",self.up)
        c.bind(self.top,"<Down>",self.down)
    #@+node:ekr.20050219131752: *3* addButtons
    def addButtons (self):

        """Add extra buttons to the dialog."""

        c = self.c ; images = self.images

        def marksButtonCallback(*args,**keys):
            self.top.deiconify()
            # No call to c.outerUpdate is needed here.

        self.marks_button = btn = c.frame.addIconButton(
            text="Marks",command=marksButtonCallback)

        c.bind(btn,'<Button-3>', self.rClickMarks)
    #@+node:bobjack.20080411192347.2: *3* rClickMarks
    def rClickMarks(self, event):

        """Show a popup menu to select a mark."""

        c = self.c

        menu_table = [('*', 'nav-marks-menu')]   

        g.doHook('rclick-popup', c=c, event=event, context_menu=menu_table)
    #@+node:ekr.20080311065442.2: *3* addCommand
    def addCommand (self):

        '''Create the show-marks-dialog command.'''

        c = self.c

        # The event arg is required to keep a unit test happy.
        def showMarksDialogCallback(event,*args,**keys):
            self.top.deiconify()

        c.k.registerCommand('show-marks-dialog',
            shortcut=None,func=showMarksDialogCallback)
    #@+node:bobjack.20080411192347.8: *3* addGeneratorCommands
    def addGeneratorCommands(self):

        """Register rClick minibuffer generator commands."""

        c = self.c

        for command in (
            'nav-marks-menu',
        ):    
            cb = getGeneratorCallback(self, c, command)
            c.k.registerCommand(command, shortcut=None, func=cb)
    #@+node:bobjack.20080411192347.9: *4* nav_marks_menu
    def nav_marks_menu(self, keywords):

        """Generate marks menu and prepend to menu_table."""

        c = self.c

        menu_table = []
        tnodeList = []
        for p in c.all_positions():
            if p.isMarked() and p.v not in tnodeList:
                tnodeList.append(p.v)
                cb = lambda event, keywords, p=p.copy(): self.gotoNode(p)
                menu_table.append((p.h.strip(), cb))

        keywords['rc_menu_table'][:0] = menu_table

    #@+node:bobjack.20080411192347.3: *4* gotoNode
    def gotoNode(self, p):

        """Select node `p`."""

        c = self.c

        if c.contractVisitedNodes:
           p.contract()

        c.treeSelectHelper(p)
    #@+node:edream.110203113231.777: *3* createFrame
    def createFrame(self):

        """Create the frame for a Marks listbox dialog."""

        tkinterListBoxDialog.createFrame(self)

        f = Tk.Frame(self.outerFrame)
        f.pack()

        self.addStdButtons(f)
    #@+node:ekr.20080311065442.3: *3* down/up
    def down (self,event):

        """Handle clicks on the dialogs 'down' button."""

        # Work around an old Python bug.  Convert strings to ints.
        items = self.box.curselection()
        try: items = map(int, items)
        except ValueError: pass

        if items:
            n = items[0]
            if n + 1 < len(self.positionList):
                self.box.selection_clear(n)
                self.box.selection_set(n+1)
        else:
            self.box.selection_set(0)

    def up (self,event):

        """Handle clicks on the dialogs 'up' button."""

        # Work around an old Python bug.  Convert strings to ints.
        items = self.box.curselection()
        try: items = map(int, items)
        except ValueError: pass

        if items: n = items[0]
        else:     n = 0
        self.box.selection_clear(n)
        self.box.selection_set(max(0,n-1))
    #@+node:edream.110203113231.779: *3* updateMarks
    def updateMarks(self,tag=None,keywords=None):

        '''Recreate the Marks listbox. A hook handler.'''

        # It is safe to use self.c as the module level dispatcher
        # ensures we only get events from our own controller.
        c = self.c

        self.box.delete(0,"end")

        # Bug fix 5/12/05: Set self.positionList for use by tkinterListBoxDialog.go().
        i = 0 ; self.positionList = [] ; tnodeList = []

        for p in c.all_positions():
            if p.isMarked() and p.v not in tnodeList:
                self.box.insert(i,p.h.strip())
                tnodeList.append(p.v)
                self.positionList.append(p.copy())
                i += 1

        self.box.selection_set(max(0,len(self.positionList)-1))
    #@-others
#@+node:edream.110203113231.780: ** class recentSectionsDialog (tkinterListBoxDialog)
class recentSectionsDialog (tkinterListBoxDialog):

    """A class to create the recent sections dialog"""

    #@+others
    #@+node:edream.110203113231.781: *3* __init__  recentSectionsDialog
    def __init__ (self,c,images):

        """Create a Recent Sections listbox dialog."""

        self.c = c
        self.images = images
        self.label = None
        self.title = "Recent nodes for %s" % g.shortFileName(c.mFileName)
        self.lt_nav_button = self.rt_nav_button = None # Created by createFrame.

        # Create the show-recent-sections-dialog command.
        self.addCommand()

        # Add 'Recent' button to icon bar.
        self.addIconBarButtons()

        # Init the base class. (calls createFrame)
        # N.B.  The base class contains positionList ivar.
        tkinterListBoxDialog.__init__(self,c,self.title,self.label)

        self.fillbox() # Must be done initially.

        if not recentInitiallyVisible:
            self.top.withdraw()

        self.updateButtons()

        self.addGeneratorCommands()

        c.bind(self.top,"<Up>",self.up)
        c.bind(self.top,"<Down>",self.down)
    #@+node:ekr.20080311065442.1: *3* addCommand
    def addCommand (self):

        '''Create the show-recent-sections-dialog command.'''

        c = self.c

        # The event arg is required to keep a unit test happy.
        def recentSectionsCommandCallback(event,*args,**keys):
            self.fillbox(forceUpdate=True)
            self.top.deiconify()

        c.k.registerCommand('show-recent-sections-dialog',
            shortcut=None,func=recentSectionsCommandCallback)
    #@+node:bobjack.20080411192347.5: *3* addGeneratorCommands
    def addGeneratorCommands(self):

        """Register rClick minibuffer generator commands."""

        c = self.c

        for command in (
            'nav-prev-menu',
            'nav-next-menu',
            'nav-recent-menu',
        ):

            cb = getGeneratorCallback(self, c, command)
            c.k.registerCommand(command, shortcut=None, func=cb)
    #@+node:bobjack.20080411192347.7: *4* nav_prev_menu
    def nav_prev_menu(self, keywords):

        """Handler for minibuffer command nav-prev-menu."""

        c = self.c

        h = c.nodeHistory
        if not h: return

        menu_table = []

        if h.beadPointer > -1:
            count = 0
            for p, ch in h.beadList[:h.beadPointer]:
                cb = lambda event, keywords, count=count: self.gotoNode(count)
                menu_table[:0] = [(p.h, cb)]
                count += 1

        keywords['rc_menu_table'][:0] = menu_table

    #@+node:bobjack.20080411192347.11: *4* nav_next_menu
    def nav_next_menu(self, keywords):

        """Handler for minibuffer command nav-next-menu."""

        c = self.c

        h = c.nodeHistory
        if not h: return

        menu_table = []

        if h.beadPointer + 1 < len(h.beadList):
            count = h.beadPointer + 1
            for p, ch in h.beadList[h.beadPointer+1:]:
                cb = lambda event, keywords, count=count: self.gotoNode(count)
                menu_table.append((p.h, cb))
                count += 1

        keywords['rc_menu_table'][:0] = menu_table
    #@+node:bobjack.20080411162443.4: *4* gotoNode
    def gotoNode(self, ptr):

        '''Goto the node in the beadList indexed by ptr.'''

        c = self.c
        h = self.c.nodeHistory
        if not h: return

        p, chapter = h.beadList[ptr]
        h.beadPointer = ptr
        h.selectChapter(chapter)

        if c.contractVisitedNodes:
            g.trace('contracting node')
            p.contract()

        c.treeSelectHelper(p)
    #@+node:edream.110203113231.782: *3* addFrameButtons
    def addFrameButtons (self):

        """Add buttons to the listbox dialog."""

        self.buttonFrame = f = Tk.Frame(self.outerFrame)
        f.pack()

        row1 = Tk.Frame(f)
        row1.pack()

        # Create the back and forward buttons, cloning the images & commands of the already existing buttons.
        image   = self.lt_nav_iconFrame_button.cget("image")
        command = self.lt_nav_iconFrame_button.cget("command")

        self.lt_nav_button = b = Tk.Button(row1,image=image,command=command)
        b.pack(side="left",pady=2,padx=5)

        image   = self.rt_nav_iconFrame_button.cget("image")
        command = self.rt_nav_iconFrame_button.cget("command")

        self.rt_nav_button = b = Tk.Button(row1,image=image,command=command)
        b.pack(side="left",pady=2,padx=5)

        row2 = Tk.Frame(f)
        row2.pack()
        self.addStdButtons(row2)

        row3 = Tk.Frame(f)
        row3.pack()

        self.clear_button = b =  Tk.Button(row3,text="Clear All",
            width=6,command=self.clearAll)
        b.pack(side="left",pady=2,padx=5)

        self.delete_button = b =  Tk.Button(row3,text="Delete",
            width=6,command=self.deleteEntry)
        b.pack(side="left",pady=2,padx=5)
    #@+node:ekr.20050219131336: *3* addIconBarButtons
    def addIconBarButtons (self):

        """Create buttons and add them to the icon bar."""

        c = self.c ; images = self.images

        # Add 'Recent' button to icon bar.
        def recentButtonCallback(*args,**keys):
            self.fillbox(forceUpdate=True)
            self.top.deiconify()
            # No call to c.outerUpdate is needed here.

        self.sections_button = btn = c.frame.addIconButton(
            text="Recent",command=recentButtonCallback)

        #c.bind(btn,'<Button-3>', self.rClickRecent)

        # Add left and right arrows to icon bar.
        self.lt_nav_disabled_image = images.lt_nav_disabled_image
        self.lt_nav_enabled_image  = images.lt_nav_enabled_image
        self.rt_nav_disabled_image = images.rt_nav_disabled_image
        self.rt_nav_enabled_image  = images.rt_nav_enabled_image

        useTkFrame = g.app.gui.guiName() == 'tkinter' and hasattr(c.frame, 'getIconButton')

        if useTkFrame:
            getButton = c.frame.getIconButton
            self.nav_button_frame = bf = Tk.Frame(self.c.frame.top)
        else:
            getButton = c.frame.addIconButton

        self.lt_nav_iconFrame_button = btnl = getButton(
            image=self.lt_nav_disabled_image,
            command=c.goPrevVisitedNode)

        c.bind(btnl,'<Button-3>', self.rClickLeft)

        self.rt_nav_iconFrame_button = btnr = getButton(
            image=self.rt_nav_disabled_image,
            command=c.goNextVisitedNode)

        c.bind(btnr,'<Button-3>', self.rClickRight)

        if useTkFrame:

            for btn in (btnl, btnr):
                btn.pack(in_=bf, side='left')

            bf.leoDragHandle = (btnl, btnr)
            self.c.frame.addIconWidget(bf)

        # Don't dim the button when it is inactive.
        for b in (self.lt_nav_iconFrame_button,self.rt_nav_iconFrame_button):
            fg = b.cget("foreground")
            b.configure(disabledforeground=fg)

        # Package these buttons for the recentSectionsDialog class in leoTkinterDialog.py
        self.nav_buttons = (self.lt_nav_iconFrame_button, self.rt_nav_iconFrame_button)
    #@+node:bobjack.20080411162443.2: *3* rClickLeft
    def rClickLeft(self, event):

        """Show a popup menu to choose a previously visited node."""

        c = self.c

        menu = [('*', 'nav-prev-menu')]
        g.doHook('rclick-popup', c=c, event=event, context_menu=menu)
    #@+node:bobjack.20080411162443.3: *3* rClickRight
    def rClickRight(self,event):

        """Show a popup menu to choose a previously visited node."""

        c = self.c

        menu = [('*', 'nav-next-menu')]
        g.doHook('rclick-popup', c=c, event=event, context_menu=menu)

    #@+node:bobjack.20080413153103.3: *3* rClickRecent

    #@+at
    # def rClickRecent(self,event):
    # 
    #     """Show a popup menu to choose a previously visited node."""
    # 
    #     c = self.c
    # 
    #     menu = [
    #         (' Prev ', ''),
    #         ('*', 'nav-prev-menu'),
    #         ('|', ''),
    #         (' Next ', ''),
    #         ('*', 'nav-next-menu'),
    #     ]
    #     g.doHook('rclick-popup', c=c, event=event, context_menu=menu)
    #@+node:edream.110203113231.783: *3* clearAll
    def clearAll (self,event=None):

        """Handle clicks in the "Delete" button of the Recent Sections listbox dialog."""

        c = self.c

        self.positionList = []
        if c.nodeHistory:
            c.nodeHistory.clear()
        self.fillbox()
        self.updateButtons()

    #@+node:edream.110203113231.784: *3* createFrame
    def createFrame(self):

        """Create the frame of a Recent Sections listbox dialog."""

        tkinterListBoxDialog.createFrame(self)
        self.addFrameButtons()
    #@+node:edream.110203113231.785: *3* deleteEntry
    def deleteEntry (self,event=None):

        """Handle clicks in the "Delete" button of a Recent Sections listbox dialog."""

        c = self.c ; box = self.box

        # Work around an old Python bug.  Convert strings to ints.
        items = box.curselection()
        try:
            items = map(int, items)
        except ValueError: pass

        if items:
            n = items[0]
            p = self.positionList[n]
            del self.positionList[n]
            c.nodeHistory.remove(p)
            self.fillbox()
            self.updateButtons()
    #@+node:edream.110203113231.786: *3* destroy
    def destroy (self,event=None):

        """Hide a Recent Sections listbox dialog and mark it inactive.

        This is an escape from possible performance penalties"""

        # This is enough to disable fillbox.
        self.top.withdraw()
    #@+node:ekr.20080311065442.4: *3* down/up
    def down (self,event):

        """Handle clicks on the dialogs 'down' button."""

        # Work around an old Python bug.  Convert strings to ints.
        items = self.box.curselection()
        try: items = map(int, items)
        except ValueError: pass

        if items:
            n = items[0]
            if n + 1 < len(self.positionList):
                self.box.selection_clear(n)
                self.box.selection_set(n+1)
        else:
            self.box.selection_set(0)

    def up (self,event):

        """Handle clicks on the dialogs 'up' button."""

        # Work around an old Python bug.  Convert strings to ints.
        items = self.box.curselection()
        try: items = map(int, items)
        except ValueError: pass

        if items: n = items[0]
        else:     n = 0
        self.box.selection_clear(n)
        self.box.selection_set(max(0,n-1))
    #@+node:edream.110203113231.787: *3* fillbox
    def fillbox(self,forceUpdate=False):

        """Update the Recent Sections listbox."""

        # Only fill the box if the dialog is visible.
        # This is an important protection against bad performance.
        if not forceUpdate and self.top.state() != "normal":
            return

        c = self.c
        if not c.nodeHistory: return

        self.box.delete(0,"end")
        self.positionList = []
        i = 0
        for data in c.nodeHistory.beadList:
            p,theChapter = data
            self.box.insert(i,p.h.strip())
            self.positionList.append(p.copy())
            i += 1

        n = len(c.nodeHistory.beadList)
        p = c.nodeHistory.beadPointer
        self.box.selection_set(max(0,(min(p,n-1))))
    #@+node:ekr.20050219122657: *3* updateButtons
    def updateButtons (self):

        """Update nav buttons to reflect current state."""

        c = self.c
        if not hasattr(c,'nodeHistory') or not c.nodeHistory: return

        for b,b2,enabled_image,disabled_image,cond in (
            (
                self.lt_nav_button,self.lt_nav_iconFrame_button,
                self.lt_nav_enabled_image,self.lt_nav_disabled_image,
                c.nodeHistory.canGoToPrevVisited()),
            (
                self.rt_nav_button,self.rt_nav_iconFrame_button,
                self.rt_nav_enabled_image,self.rt_nav_disabled_image,
                c.nodeHistory.canGoToNextVisited()),
        ):
            # Disabled state makes the icon look bad.
            image = g.choose(cond,enabled_image,disabled_image)
            b.configure(image=image,state='normal')
            b2.configure(image=image,state='normal')
    #@+node:ekr.20050219162434: *3* updateRecent
    def updateRecent(self,tag=None,keywords=None):

        """Recreate the Recent listbox. A hook handler"""

        # It is safe to use self.c as the module level dispatcher
        # ensures we only get events from our own controller.

        c = self.c

        self.fillbox(forceUpdate=False)
        self.updateButtons()
    #@-others
#@+node:bobjack.20080412173602.2: ** getGeneratorCallback
def getGeneratorCallback(obj, c, command):

    """Convert a call to  rClick generator command to a method call on `obj`.

    The method call will be on `obj` , the method name will be calculated from
    `command` by replacing all '-' with '_'.

    The method will be supplied with keyword arguments from theContextMenuController
    and it's return value will be put in same.

    Maybe put this in rClick ???
    """

    def cb(event, obj=obj, c=c, command=command):
        cm = c.theContextMenuController
        method = getattr(obj, command.replace('-','_'))
        cm.mb_retval = method(cm.mb_keywords)

    return cb
#@-others
#@-leo
