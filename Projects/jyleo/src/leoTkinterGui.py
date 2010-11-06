# -*- coding: utf-8 -*-
#@+leo-ver=4-thin
#@+node:ekr.20031218072017.4047:@thin leoTkinterGui.py
#@@first

"""Leo's Tkinter Gui module."""

#@@language python  
#@@tabwidth -4
#@@pagewidth 80

#@<< imports >>
#@+node:ekr.20041228050845:<< imports >>
import leoGlobals as g
import leoGui
import leoTkinterColorPanels
import leoTkinterComparePanel
import leoTkinterDialog
import leoTkinterFind
import leoTkinterFontPanel
import leoTkinterFrame
import leoTkinterPrefs
import tkFont
import Tkinter as Tk
import tkFileDialog
import string
import sys
#@nonl
#@-node:ekr.20041228050845:<< imports >>
#@nl

class tkinterGui(leoGui.leoGui):
    
    """A class encapulating all calls to tkinter."""
    
    #@    @+others
    #@+node:ekr.20031218072017.837: swingGui.__init__
    def __init__ (self):
    
        # Initialize the base class.
        leoGui.leoGui.__init__(self,"tkinter")
    
        self.bitmap_name = None
        self.bitmap = None
        self.win32clipboard = None
        self.defaultFont = None
        self.defaultFontFamily = None
    
        if 0: # This seems both dangerous and non-functional.
            if sys.platform == "win32":
                try:
                    import win32clipboard
                    self.win32clipboard = win32clipboard
                except:
                    g.es_exception()
    #@nonl
    #@-node:ekr.20031218072017.837: swingGui.__init__
    #@+node:ekr.20031218072017.4048:app.gui.Tkinter birth & death
    #@+node:ekr.20031218072017.4049:createRootWindow & allies
    def createRootWindow(self):
    
        """Create a hidden Tk root window."""
    
        if 0: # Use Tix.
            import Tix
            self.root = root = Tix.Tk()
            #@        << fix problems with menus (XP) >>
            #@+node:ekr.20041125050302:<< fix problems with menus (XP) >>
            try:
                import WmDefault
                WmDefault.setup(root)
                d = {'activebackground':'DarkBlue','activeforeground':'white'} # works
                # d = {'activebackground':'','activeforeground':''} # doesn't work
                WmDefault.addoptions(root,d)
            except ImportError:
                g.trace("can not import WMDefault")
            #@nonl
            #@-node:ekr.20041125050302:<< fix problems with menus (XP) >>
            #@nl
        else: # Use Tkinter.
            self.root = root = Tk.Tk()
    
        root.title("Leo Main Window")
        root.withdraw()
        
        self.setDefaultIcon()
        if g.app.config:
            self.getDefaultConfigFont(g.app.config)
            
        root.withdraw()
    
        return root
    #@nonl
    #@+node:ekr.20031218072017.1856:setDefaultIcon
    def setDefaultIcon(self):
        
        """Set the icon to be used in all Leo windows.
        
        This code does nothing for Tk versions before 8.4.3."""
        
        gui = self
    
        try:
            version = gui.root.getvar("tk_patchLevel")
            if g.CheckVersion(version,"8.4.3") and sys.platform == "win32": # 12/2/03
                # tk 8.4.3 or greater: load a 16 by 16 icon.
                path = g.os_path_join(g.app.loadDir,"..","Icons")
                if g.os_path_exists(path):
                    theFile = g.os_path_join(path,"LeoApp16.ico")
                    if g.os_path_exists(path):
                        self.bitmap = Tk.BitmapImage(theFile)
                    else:
                        g.es("LeoApp16.ico not in Icons directory", color="red")
                else:
                    g.es("Icons directory not found: "+path, color="red")
        except:
            print "exception setting bitmap"
            import traceback ; traceback.print_exc()
    #@nonl
    #@-node:ekr.20031218072017.1856:setDefaultIcon
    #@+node:ekr.20031218072017.2186:tkGui.getDefaultConfigFont
    def getDefaultConfigFont(self,config):
        
        """Get the default font from a new text widget."""
    
        if not self.defaultFontFamily:
            # WARNING: retain NO references to widgets or fonts here!
            t = Tk.Text()
            fn = t.cget("font")
            font = tkFont.Font(font=fn) 
            family = font.cget("family")
            self.defaultFontFamily = family[:]
            # print '***** getDefaultConfigFont',repr(family)
    
        config.defaultFont = None
        config.defaultFontFamily = self.defaultFontFamily
    #@nonl
    #@-node:ekr.20031218072017.2186:tkGui.getDefaultConfigFont
    #@-node:ekr.20031218072017.4049:createRootWindow & allies
    #@+node:ekr.20031218072017.4051:destroySelf
    def destroySelf (self):
    
        if 0: # Works in Python 2.1 and 2.2.  Leaves Python window open.
            self.root.destroy()
            
        else: # Works in Python 2.3.  Closes Python window.
            self.root.quit()
    #@nonl
    #@-node:ekr.20031218072017.4051:destroySelf
    #@+node:ekr.20031218072017.4052:finishCreate (not used: must be present)
    def finishCreate (self):
        
        pass
        
    #@-node:ekr.20031218072017.4052:finishCreate (not used: must be present)
    #@+node:ekr.20031218072017.4053:killGui (not used)
    def killGui(self,exitFlag=True):
        
        """Destroy a gui and terminate Leo if exitFlag is True."""
    
        pass # Not ready yet.
    
    #@-node:ekr.20031218072017.4053:killGui (not used)
    #@+node:ekr.20031218072017.4054:recreateRootWindow (not used)
    def recreateRootWindow(self):
        """A do-nothing base class to create the hidden root window of a gui
    
        after a previous gui has terminated with killGui(False)."""
        pass
    
    #@-node:ekr.20031218072017.4054:recreateRootWindow (not used)
    #@+node:ekr.20031218072017.4055:runMainLoop
    def runMainLoop(self):
    
        """Run tkinter's main loop."""
    
        # g.trace("tkinterGui")
        self.root.mainloop()
    #@nonl
    #@-node:ekr.20031218072017.4055:runMainLoop
    #@-node:ekr.20031218072017.4048:app.gui.Tkinter birth & death
    #@+node:ekr.20031218072017.4056:app.gui.Tkinter dialogs
    def runAboutLeoDialog(self,version,theCopyright,url,email):
        """Create and run a Tkinter About Leo dialog."""
        d = leoTkinterDialog.tkinterAboutLeo(version,theCopyright,url,email)
        return d.run(modal=False)
        
    def runAskLeoIDDialog(self):
        """Create and run a dialog to get g.app.LeoID."""
        d = leoTkinterDialog.tkinterAskLeoID()
        return d.run(modal=True)
    
    def runAskOkDialog(self,title,message=None,text="Ok"):
        """Create and run a Tkinter an askOK dialog ."""
        d = leoTkinterDialog.tkinterAskOk(title,message,text)
        return d.run(modal=True)
    
    def runAskOkCancelNumberDialog(self,title,message):
        """Create and run askOkCancelNumber dialog ."""
        d = leoTkinterDialog.tkinterAskOkCancelNumber(title,message)
        return d.run(modal=True)
    
    def runAskYesNoDialog(self,title,message=None):
        """Create and run an askYesNo dialog."""
        d = leoTkinterDialog.tkinterAskYesNo(title,message)
        return d.run(modal=True)
    
    def runAskYesNoCancelDialog(self,title,
        message=None,yesMessage="Yes",noMessage="No",defaultButton="Yes"):
        """Create and run an askYesNoCancel dialog ."""
        d = leoTkinterDialog.tkinterAskYesNoCancel(
            title,message,yesMessage,noMessage,defaultButton)
        return d.run(modal=True)
    #@nonl
    #@-node:ekr.20031218072017.4056:app.gui.Tkinter dialogs
    #@+node:ekr.20031218072017.4057:app.gui.Swing file dialogs
    # We no longer specify default extensions so that we can open and save files without extensions.
    
    def runOpenFileDialog(self,title,filetypes,defaultextension,multiple=False):
    
        """Create and run an Tkinter open file dialog ."""
        
        if multiple:
            # askopenfilenames requires Pythone 2.3 and Tk 8.4.
            if (
                g.CheckVersion(sys.version,"2.3") and
                g.CheckVersion(self.root.getvar("tk_patchLevel"),"8.4")
            ):
                files = tkFileDialog.askopenfilenames(title=title,filetypes=filetypes)
                # g.trace(files)
                return list(files)
            else:
                # Get one file and return it as a list.
                theFile = tkFileDialog.askopenfilename(title=title,filetypes=filetypes)
                return [theFile]
        else:
            # Return a single file name as a string.
            return tkFileDialog.askopenfilename(title=title, filetypes=filetypes)
    
    def runSaveFileDialog(self,initialfile,title,filetypes,defaultextension):
    
        """Create and run an Tkinter save file dialog ."""
    
        return tkFileDialog.asksaveasfilename(
            initialfile=initialfile,
            title=title,
            filetypes=filetypes)
    #@nonl
    #@-node:ekr.20031218072017.4057:app.gui.Swing file dialogs
    #@+node:ekr.20031218072017.4058:app.gui.Tkinter panels
    def createColorPanel(self,c):
        """Create a Tkinter color picker panel."""
        return leoTkinterColorPanels.leoTkinterColorPanel(c)
        
    def createComparePanel(self,c):
        """Create a Tkinter color picker panel."""
        return leoTkinterComparePanel.leoTkinterComparePanel(c)
    
    def createFindPanel(self,c):
        """Create a hidden Tkinter find panel."""
        panel = leoTkinterFind.leoTkinterFind(c)
        panel.top.withdraw()
        return panel
    
    def createFontPanel(self,c):
        """Create a Tkinter font panel."""
        return leoTkinterFontPanel.leoTkinterFontPanel(c)
        
    def createLeoFrame(self,title):
        """Create a new Leo frame."""
        gui = self
        return leoTkinterFrame.leoTkinterFrame(title,gui)
    
    def createPrefsPanel(self,c):
        """Create a Tkinter find panel."""
        return leoTkinterPrefs.leoTkinterPrefs(c)
    #@nonl
    #@-node:ekr.20031218072017.4058:app.gui.Tkinter panels
    #@+node:ekr.20031218072017.4059:app.gui.Tkinter.utils
    #@+node:ekr.20031218072017.844:Clipboard (swingGui)
    #@+at
    # 
    # The following are called only when g.app.gui.win32clipboard is not None, 
    # and
    # presently that never happens.
    #@-at
    #@nonl
    #@+node:ekr.20031218072017.845:replaceClipboardWith
    def replaceClipboardWith (self,s):
    
        # g.app.gui.win32clipboard is always None.
        wcb = g.app.gui.win32clipboard
    
        if wcb:
            try:
                wcb.OpenClipboard(0)
                wcb.EmptyClipboard()
                wcb.SetClipboardText(s)
                wcb.CloseClipboard()
            except:
                g.es_exception()
        else:
            self.root.clipboard_clear()
            self.root.clipboard_append(s)
    #@nonl
    #@-node:ekr.20031218072017.845:replaceClipboardWith
    #@+node:ekr.20031218072017.846:getTextFromClipboard
    def getTextFromClipboard (self):
        
        # g.app.gui.win32clipboard is always None.
        wcb = g.app.gui.win32clipboard
        
        if wcb:
            try:
                wcb.OpenClipboard(0)
                data = wcb.GetClipboardData()
                wcb.CloseClipboard()
                # g.trace(data)
                return data
            except TypeError:
                # g.trace(None)
                return None
            except:
                g.es_exception()
                return None
        else:
            try:
                s = self.root.selection_get(selection="CLIPBOARD")
                return s
            except:
                return None
    #@nonl
    #@-node:ekr.20031218072017.846:getTextFromClipboard
    #@-node:ekr.20031218072017.844:Clipboard (swingGui)
    #@+node:ekr.20031218072017.4060:Dialog
    #@+node:ekr.20031218072017.4061:get_window_info
    # WARNING: Call this routine _after_ creating a dialog.
    # (This routine inhibits the grid and pack geometry managers.)
    
    def get_window_info (self,top):
        
        top.update_idletasks() # Required to get proper info.
    
        # Get the information about top and the screen.
        geom = top.geometry() # geom = "WidthxHeight+XOffset+YOffset"
        dim,x,y = string.split(geom,'+')
        w,h = string.split(dim,'x')
        w,h,x,y = int(w),int(h),int(x),int(y)
        
        return w,h,x,y
    #@nonl
    #@-node:ekr.20031218072017.4061:get_window_info
    #@+node:ekr.20031218072017.4062:center_dialog
    def center_dialog(self,top):
    
        """Center the dialog on the screen.
    
        WARNING: Call this routine _after_ creating a dialog.
        (This routine inhibits the grid and pack geometry managers.)"""
    
        sw = top.winfo_screenwidth()
        sh = top.winfo_screenheight()
        w,h,x,y = self.get_window_info(top)
        
        # Set the new window coordinates, leaving w and h unchanged.
        x = (sw - w)/2
        y = (sh - h)/2
        top.geometry("%dx%d%+d%+d" % (w,h,x,y))
        
        return w,h,x,y
    #@nonl
    #@-node:ekr.20031218072017.4062:center_dialog
    #@+node:ekr.20031218072017.4063:create_labeled_frame
    # Returns frames w and f.
    # Typically the caller would pack w into other frames, and pack content into f.
    
    def create_labeled_frame (self,parent,
        caption=None,relief="groove",bd=2,padx=0,pady=0):
    
        # Create w, the master frame.
        w = Tk.Frame(parent)
        w.grid(sticky="news")
        
        # Configure w as a grid with 5 rows and columns.
        # The middle of this grid will contain f, the expandable content area.
        w.columnconfigure(1,minsize=bd)
        w.columnconfigure(2,minsize=padx)
        w.columnconfigure(3,weight=1)
        w.columnconfigure(4,minsize=padx)
        w.columnconfigure(5,minsize=bd)
        
        w.rowconfigure(1,minsize=bd)
        w.rowconfigure(2,minsize=pady)
        w.rowconfigure(3,weight=1)
        w.rowconfigure(4,minsize=pady)
        w.rowconfigure(5,minsize=bd)
    
        # Create the border spanning all rows and columns.
        border = Tk.Frame(w,bd=bd,relief=relief) # padx=padx,pady=pady)
        border.grid(row=1,column=1,rowspan=5,columnspan=5,sticky="news")
        
        # Create the content frame, f, in the center of the grid.
        f = Tk.Frame(w,bd=bd)
        f.grid(row=3,column=3,sticky="news")
        
        # Add the caption.
        if caption and len(caption) > 0:
            caption = Tk.Label(parent,text=caption,highlightthickness=0,bd=0)
            caption.tkraise(w)
            caption.grid(in_=w,row=0,column=2,rowspan=2,columnspan=3,padx=4,sticky="w")
    
        return w,f
    #@nonl
    #@-node:ekr.20031218072017.4063:create_labeled_frame
    #@-node:ekr.20031218072017.4060:Dialog
    #@+node:ekr.20031218072017.4064:Focus
    #@+node:ekr.20031218072017.4065:get_focus
    def get_focus(self,frame):
        
        """Returns the widget that has focus, or body if None."""
    
        return frame.top.focus_displayof()
        
    #@-node:ekr.20031218072017.4065:get_focus
    #@+node:ekr.20031218072017.2373:set_focus (app.gui)
    def set_focus(self,c,widget,tag=''):
        
        """Put the focus on the widget."""
        
        # g.trace(tag,widget)
        
        # g.trace(c.frame.top.wm_stackorder())
        
        if widget:
            widget.focus_set()
    
        if 0: # Causes a weird problem on some machines.
            if c.frame.top:
                focus = c.frame.top.focus_displayof()
                if focus != widget:
                    widget.focus_set()
    #@nonl
    #@-node:ekr.20031218072017.2373:set_focus (app.gui)
    #@-node:ekr.20031218072017.4064:Focus
    #@+node:ekr.20031218072017.4066:Font
    #@+node:ekr.20031218072017.2187:tkGui.getFontFromParams
    def getFontFromParams(self,family,size,slant,weight,defaultSize=12):
        
        family_name = family
        
        try:
            font = tkFont.Font(family=family,size=size,slant=slant,weight=weight)
            # if g.app.trace: g.trace(font)
            return font
        except:
            g.es("exception setting font from ",family_name)
            g.es("family,size,slant,weight:",family,size,slant,weight)
            # g.es_exception() # This just confuses people.
            return g.app.config.defaultFont
    #@nonl
    #@-node:ekr.20031218072017.2187:tkGui.getFontFromParams
    #@-node:ekr.20031218072017.4066:Font
    #@+node:ekr.20031218072017.4067:Icons
    #@+node:ekr.20031218072017.4068:attachLeoIcon & createLeoIcon
    def attachLeoIcon (self,w):
        
        """Try to attach a Leo icon to the Leo Window.
        
        Use tk's wm_iconbitmap function if available (tk 8.3.4 or greater).
        Otherwise, try to use the Python Imaging Library and the tkIcon package."""
    
        if self.bitmap != None:
            # We don't need PIL or tkicon: this is tk 8.3.4 or greater.
            try:
                w.wm_iconbitmap(self.bitmap)
            except:
                self.bitmap = None
        
        if self.bitmap == None:
            try:
                #@            << try to use the PIL and tkIcon packages to draw the icon >>
                #@+node:ekr.20031218072017.4069:<< try to use the PIL and tkIcon packages to draw the icon >>
                #@+at 
                #@nonl
                # This code requires Fredrik Lundh's PIL and tkIcon packages:
                # 
                # Download PIL    from 
                # http://www.pythonware.com/downloads/index.htm#pil
                # Download tkIcon from http://www.effbot.org/downloads/#tkIcon
                # 
                # Many thanks to Jonathan M. Gilligan for suggesting this 
                # code.
                #@-at
                #@@c
                
                import Image,tkIcon,_tkicon
                
                # Wait until the window has been drawn once before attaching the icon in OnVisiblity.
                def visibilityCallback(event,self=self,w=w):
                    try: self.leoIcon.attach(w.winfo_id())
                    except: pass
                w.bind("<Visibility>",visibilityCallback)
                if not self.leoIcon:
                    # Load a 16 by 16 gif.  Using .gif rather than an .ico allows us to specify transparency.
                    icon_file_name = g.os_path_join(g.app.loadDir,'..','Icons','LeoWin.gif')
                    icon_file_name = g.os_path_normpath(icon_file_name)
                    icon_image = Image.open(icon_file_name)
                    if 1: # Doesn't resize.
                        self.leoIcon = self.createLeoIcon(icon_image)
                    else: # Assumes 64x64
                        self.leoIcon = tkIcon.Icon(icon_image)
                #@nonl
                #@-node:ekr.20031218072017.4069:<< try to use the PIL and tkIcon packages to draw the icon >>
                #@nl
            except:
                # import traceback ; traceback.print_exc()
                self.leoIcon = None
    #@nonl
    #@+node:ekr.20031218072017.4070:createLeoIcon
    # This code is adapted from tkIcon.__init__
    # Unlike the tkIcon code, this code does _not_ resize the icon file.
    
    def createLeoIcon (self,icon):
        
        try:
            import Image,tkIcon,_tkicon
            
            i = icon ; m = None
            # create transparency mask
            if i.mode == "P":
                try:
                    t = i.info["transparency"]
                    m = i.point(lambda i, t=t: i==t, "1")
                except KeyError: pass
            elif i.mode == "RGBA":
                # get transparency layer
                m = i.split()[3].point(lambda i: i == 0, "1")
            if not m:
                m = Image.new("1", i.size, 0) # opaque
            # clear unused parts of the original image
            i = i.convert("RGB")
            i.paste((0, 0, 0), (0, 0), m)
            # create icon
            m = m.tostring("raw", ("1", 0, 1))
            c = i.tostring("raw", ("BGRX", 0, -1))
            return _tkicon.new(i.size, c, m)
        except:
            return None
    #@nonl
    #@-node:ekr.20031218072017.4070:createLeoIcon
    #@-node:ekr.20031218072017.4068:attachLeoIcon & createLeoIcon
    #@-node:ekr.20031218072017.4067:Icons
    #@+node:ekr.20031218072017.4071:Idle Time
    #@+node:ekr.20031218072017.4072:tkinterGui.setIdleTimeHook
    def setIdleTimeHook (self,idleTimeHookHandler,*args,**keys):
        
        # g.trace(idleTimeHookHandler,self.root)
    
        if self.root:
            self.root.after_idle(idleTimeHookHandler,*args,**keys)
    #@nonl
    #@-node:ekr.20031218072017.4072:tkinterGui.setIdleTimeHook
    #@+node:ekr.20031218072017.4073:setIdleTimeHookAfterDelay
    def setIdleTimeHookAfterDelay (self,delay,idleTimeHookHandler,*args,**keys):
        
        if self.root:
            g.app.root.after(g.app.idleTimeDelay,idleTimeHookHandler)
    #@nonl
    #@-node:ekr.20031218072017.4073:setIdleTimeHookAfterDelay
    #@-node:ekr.20031218072017.4071:Idle Time
    #@+node:ekr.20031218072017.4074:Indices
    #@+node:ekr.20031218072017.4075:firstIndex
    def firstIndex (self):
    
        return "1.0"
    #@nonl
    #@-node:ekr.20031218072017.4075:firstIndex
    #@+node:ekr.20031218072017.4076:lastIndex
    def lastIndex (self):
    
        return "end"
    #@nonl
    #@-node:ekr.20031218072017.4076:lastIndex
    #@+node:ekr.20031218072017.4077:moveIndexBackward
    def moveIndexBackward(self,index,n):
    
        return "%s-%dc" % (index,n)
    #@-node:ekr.20031218072017.4077:moveIndexBackward
    #@+node:ekr.20031218072017.4078:moveIndexForward & moveIndexToNextLine
    def moveIndexForward(self,t,index,n):
    
        newpos = t.index("%s+%dc" % (index,n))
        
        return g.choose(t.compare(newpos,"==","end"),None,newpos)
        
    def moveIndexToNextLine(self,t,index):
    
        newpos = t.index("%s linestart + 1lines" % (index))
        
        return g.choose(t.compare(newpos,"==","end"),None,newpos)
    #@nonl
    #@-node:ekr.20031218072017.4078:moveIndexForward & moveIndexToNextLine
    #@+node:ekr.20031218072017.4079:compareIndices
    def compareIndices (self,t,n1,rel,n2):
        return t.compare(n1,rel,n2)
    #@nonl
    #@-node:ekr.20031218072017.4079:compareIndices
    #@+node:ekr.20031218072017.4080:getindex
    def getindex(self,text,index):
        
        """Convert string index of the form line.col into a tuple of two ints."""
        
        return tuple(map(int,string.split(text.index(index), ".")))
    #@nonl
    #@-node:ekr.20031218072017.4080:getindex
    #@-node:ekr.20031218072017.4074:Indices
    #@+node:ekr.20031218072017.4081:Insert Point
    #@+node:ekr.20031218072017.4082:getInsertPoint
    def getInsertPoint(self,t):
    
        return t.index("insert")
    #@nonl
    #@-node:ekr.20031218072017.4082:getInsertPoint
    #@+node:ekr.20031218072017.4083:setInsertPoint
    def setInsertPoint (self,t,pos):
    
        return t.mark_set("insert",pos)
    #@nonl
    #@-node:ekr.20031218072017.4083:setInsertPoint
    #@-node:ekr.20031218072017.4081:Insert Point
    #@+node:ekr.20031218072017.4084:Selection
    #@+node:ekr.20031218072017.4085:getSelectionRange
    def getSelectionRange (self,t):
    
        return t.tag_ranges("sel")
    #@nonl
    #@-node:ekr.20031218072017.4085:getSelectionRange
    #@+node:ekr.20031218072017.4086:getTextSelection
    def getTextSelection (self,t):
        
        """Return a tuple representing the selected range of t, a Tk.Text widget.
        
        Return a tuple giving the insertion point if no range of text is selected."""
    
        # To get the current selection
        sel = t.tag_ranges("sel")  ## Do not remove:  remove entire routine instead!!
        if len(sel) == 2:
            return sel
        else:
            # 7/1/03: Return the insertion point if there is no selected text.
            insert = t.index("insert")
            return insert,insert
    #@nonl
    #@-node:ekr.20031218072017.4086:getTextSelection
    #@+node:ekr.20031218072017.4087:setSelectionRange
    def setSelectionRange(self,t,n1,n2):
    
        return g.app.gui.setTextSelection(t,n1,n2)
    #@nonl
    #@-node:ekr.20031218072017.4087:setSelectionRange
    #@+node:ekr.20031218072017.4088:setSelectionRangeWithLength
    def setSelectionRangeWithLength(self,t,start,length):
        
        return g.app.gui.setTextSelection(t,start,"%s+%dc" % (start,length))
    #@nonl
    #@-node:ekr.20031218072017.4088:setSelectionRangeWithLength
    #@+node:ekr.20031218072017.4089:setTextSelection
    def setTextSelection (self,t,start,end):
        
        """tk gui: set the selection range in Tk.Text widget t."""
    
        if not start or not end:
            return
    
        if t.compare(start, ">", end):
            start,end = end,start
            
        t.tag_remove("sel","1.0",start)
        t.tag_add("sel",start,end)
        t.tag_remove("sel",end,"end")
        t.mark_set("insert",end)
    #@nonl
    #@-node:ekr.20031218072017.4089:setTextSelection
    #@-node:ekr.20031218072017.4084:Selection
    #@+node:ekr.20031218072017.4090:Text
    #@+node:ekr.20031218072017.4091:getAllText
    def getAllText (self,t):
        
        """Return all the text of Tk.Text t converted to unicode."""
        
        s = t.get("1.0","end")
        if s is None:
            return u""
        else:
            return g.toUnicode(s,g.app.tkEncoding)
    #@nonl
    #@-node:ekr.20031218072017.4091:getAllText
    #@+node:ekr.20031218072017.4092:getCharAfterIndex
    def getCharAfterIndex (self,t,index):
        
        if t.compare(index + "+1c",">=","end"):
            return None
        else:
            ch = t.get(index + "+1c")
            return g.toUnicode(ch,g.app.tkEncoding)
    #@nonl
    #@-node:ekr.20031218072017.4092:getCharAfterIndex
    #@+node:ekr.20031218072017.4093:getCharAtIndex
    def getCharAtIndex (self,t,index):
        ch = t.get(index)
        return g.toUnicode(ch,g.app.tkEncoding)
    #@nonl
    #@-node:ekr.20031218072017.4093:getCharAtIndex
    #@+node:ekr.20031218072017.4094:getCharBeforeIndex
    def getCharBeforeIndex (self,t,index):
        
        index = t.index(index)
        if index == "1.0":
            return None
        else:
            ch = t.get(index + "-1c")
            return g.toUnicode(ch,g.app.tkEncoding)
    #@nonl
    #@-node:ekr.20031218072017.4094:getCharBeforeIndex
    #@+node:ekr.20031218072017.4095:getLineContainingIndex
    def getLineContainingIndex (self,t,index):
    
        line = t.get(index + " linestart", index + " lineend")
        return g.toUnicode(line,g.app.tkEncoding)
    #@nonl
    #@-node:ekr.20031218072017.4095:getLineContainingIndex
    #@+node:ekr.20031218072017.4096:replaceSelectionRangeWithText (leoTkinterGui)
    def replaceSelectionRangeWithText (self,t,start,end,text):
    
        t.delete(start,end)
        t.insert(start,text)
    #@nonl
    #@-node:ekr.20031218072017.4096:replaceSelectionRangeWithText (leoTkinterGui)
    #@-node:ekr.20031218072017.4090:Text
    #@+node:ekr.20031218072017.4097:Visibility
    #@+node:ekr.20031218072017.4098:makeIndexVisible
    def makeIndexVisible(self,t,index):
    
        return t.see(index)
    #@nonl
    #@-node:ekr.20031218072017.4098:makeIndexVisible
    #@-node:ekr.20031218072017.4097:Visibility
    #@-node:ekr.20031218072017.4059:app.gui.Tkinter.utils
    #@-others
#@nonl
#@-node:ekr.20031218072017.4047:@thin leoTkinterGui.py
#@-leo
