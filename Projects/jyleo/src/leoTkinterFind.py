#@+leo-ver=4-thin
#@+node:ekr.20031218072017.3897:@thin leoTkinterFind.py
#@@language python
#@@tabwidth -4
#@@pagewidth 80  

import leoGlobals as g
import leoFind

import leoTkinterDialog
import Tkinter as Tk

#@+others
#@+node:ekr.20041025152343:class underlinedTkButton
class underlinedTkButton:
    
    #@    @+others
    #@+node:ekr.20041025152712:__init__
    def __init__(self,buttonType,parent_widget,**keywords):
    
        self.buttonType = buttonType
        self.parent_widget = parent_widget
        self.hotKey = None
        text = keywords['text']
    
        #@	<< set self.hotKey if '&' is in the string >>
        #@+node:ekr.20041025152712.2:<< set self.hotKey if '&' is in the string >>
        index = text.find('&')
        
        if index > -1:
        
            if index == len(text)-1:
                # The word ends in an ampersand.  Ignore it; there is no hot key.
                text = text[:-1]
            else:
                self.hotKey = text [index + 1]
                text = text[:index] + text[index+1:]
        #@nonl
        #@-node:ekr.20041025152712.2:<< set self.hotKey if '&' is in the string >>
        #@nl
        
        # Create the button...
    	if self.hotKey:
            keywords['text'] = text
            keywords['underline'] = index
    
        if buttonType.lower() == "button":
            self.button = Tk.Button(parent_widget,keywords)
        elif buttonType.lower() == "check":
            self.button = Tk.Checkbutton(parent_widget,keywords)
        elif buttonType.lower() == "radio":
            self.button = Tk.Radiobutton(parent_widget,keywords)
        else:
            g.trace("bad buttonType")
        
        self.text = text # for traces
    #@nonl
    #@-node:ekr.20041025152712:__init__
    #@+node:ekr.20041026080125:bindHotKey
    def bindHotKey (self,widget):
        
        if self.hotKey:
            for key in (self.hotKey.lower(),self.hotKey.upper()):
                widget.bind("<Alt-%s>" % key,self.callback)
    #@-node:ekr.20041026080125:bindHotKey
    #@+node:ekr.20041025152717:callback
    # The hot key has been hit.  Call the button's command.
    
    def callback (self, event):
        
        g.trace(self.text)
    
    	self.button.invoke ()
    #@-node:ekr.20041025152717:callback
    #@-others
#@nonl
#@-node:ekr.20041025152343:class underlinedTkButton
#@+node:ekr.20041025152343.1:class leoTkinterFind
class leoTkinterFind (leoFind.leoFind,leoTkinterDialog.leoTkinterDialog):

    """A class that implements Leo's tkinter find dialog."""

    #@    @+others
    #@+node:ekr.20031218072017.3898:Birth & death
    #@+node:ekr.20031218072017.3899:__init__
    def __init__(self,c,resizeable=False,title=None):
    
        # g.trace("leoTkinterFind",c)
        
        # Init the base classes...
        leoFind.leoFind.__init__(self,c,title=title)
        leoTkinterDialog.leoTkinterDialog.__init__(self,self.title,resizeable)
    
        #@    << create the tkinter intVars >>
        #@+node:ekr.20031218072017.3900:<< create the tkinter intVars >>
        self.dict = {}
        
        for key in self.intKeys:
            self.dict[key] = Tk.IntVar()
        
        for key in self.newStringKeys:
            self.dict[key] = Tk.StringVar()
            
        self.s_ctrl = Tk.Text() # Used by find.search()
        #@nonl
        #@-node:ekr.20031218072017.3900:<< create the tkinter intVars >>
        #@nl
        
        self.createTopFrame() # Create the outer tkinter dialog frame.
        self.createFrame()
        self.init(c) # New in 4.3: init only once.
        
        # g.trace(self.top)
    #@nonl
    #@-node:ekr.20031218072017.3899:__init__
    #@+node:ekr.20031218072017.3901:destroySelf
    def destroySelf (self):
        
        self.top.destroy()
    #@nonl
    #@-node:ekr.20031218072017.3901:destroySelf
    #@+node:ekr.20031218072017.3902:find.createFrame
    def createFrame (self):
    
        # Create the find panel...
        outer = Tk.Frame(self.frame,relief="groove",bd=2)
        outer.pack(padx=2,pady=2)
    
        #@    << Create the Find and Change panes >>
        #@+node:ekr.20031218072017.3904:<< Create the Find and Change panes >>
        fc = Tk.Frame(outer, bd="1m")
        fc.pack(anchor="n", fill="x", expand=1)
        
        # Removed unused height/width params: using fractions causes problems in some locales!
        fpane = Tk.Frame(fc, bd=1)
        cpane = Tk.Frame(fc, bd=1)
        
        fpane.pack(anchor="n", expand=1, fill="x")
        cpane.pack(anchor="s", expand=1, fill="x")
        
        # Create the labels and text fields...
        flab = Tk.Label(fpane, width=8, text="Find:")
        clab = Tk.Label(cpane, width=8, text="Change:")
        
        # Use bigger boxes for scripts.
        self.find_ctrl   = ftxt = Tk.Text(fpane,bd=1,relief="groove",height=4,width=20)
        self.change_ctrl = ctxt = Tk.Text(cpane,bd=1,relief="groove",height=4,width=20)
        #@<< Bind Tab and control-tab >>
        #@+node:ekr.20041026092141:<< Bind Tab and control-tab >>
        def setFocus(w):
            w.focus_set()
            g.app.gui.setSelectionRange(w,"1.0","1.0")
            return "break"
            
        def toFind(event,w=ftxt): return setFocus(w)
        def toChange(event,w=ctxt): return setFocus(w)
            
        def insertTab(w):
            data = g.app.gui.getSelectionRange(w)
            if data: start,end = data
            else: start = end = g.app.gui.getInsertPoint(w)
            g.app.gui.replaceSelectionRangeWithText(w,start,end,"\t")
            return "break"
        
        def insertFindTab(event,w=ftxt): return insertTab(w)
        def insertChangeTab(event,w=ctxt): return insertTab(w)
        
        ftxt.bind("<Tab>",toChange)
        ctxt.bind("<Tab>",toFind)
        ftxt.bind("<Control-Tab>",insertFindTab)
        ctxt.bind("<Control-Tab>",insertChangeTab)
        #@nonl
        #@-node:ekr.20041026092141:<< Bind Tab and control-tab >>
        #@nl
        
        fBar = Tk.Scrollbar(fpane,name='findBar')
        cBar = Tk.Scrollbar(cpane,name='changeBar')
        
        # Add scrollbars.
        for bar,txt in ((fBar,ftxt),(cBar,ctxt)):
            txt['yscrollcommand'] = bar.set
            bar['command'] = txt.yview
            bar.pack(side="right", fill="y")
        
        flab.pack(side="left")
        clab.pack(side="left")
        ctxt.pack(side="right", expand=1, fill="both")
        ftxt.pack(side="right", expand=1, fill="both")
        #@nonl
        #@-node:ekr.20031218072017.3904:<< Create the Find and Change panes >>
        #@nl
        #@    << Create four columns of radio and checkboxes >>
        #@+node:ekr.20031218072017.3903:<< Create four columns of radio and checkboxes >>
        columnsFrame = Tk.Frame(outer,relief="groove",bd=2)
        columnsFrame.pack(anchor="e",expand=1,padx="7p",pady="2p") # Don't fill.
        
        numberOfColumns = 4 # Number of columns
        columns = [] ; radioLists = [] ; checkLists = []
        for i in xrange(numberOfColumns):
            columns.append(Tk.Frame(columnsFrame,bd=1))
            radioLists.append([])
            checkLists.append([])
        
        for i in xrange(numberOfColumns):
            columns[i].pack(side="left",padx="1p") # fill="y" Aligns to top. padx expands columns.
            
        # HotKeys used for check/radio buttons:  a,b,c,e,h,i,l,m,n,o,p,r,s,t,w
        
        radioLists[0] = [
            (self.dict["radio-find-type"],"P&Lain Search","plain-search"),  
            (self.dict["radio-find-type"],"&Pattern Match Search","pattern-search"),
            (self.dict["radio-find-type"],"&Script Search","script-search")]
        checkLists[0] = [
            ("Scrip&t Change",self.dict["script_change"])]
        checkLists[1] = [
            ("&Whole Word",  self.dict["whole_word"]),
            ("&Ignore Case", self.dict["ignore_case"]),
            ("Wrap &Around", self.dict["wrap"]),
            ("&Reverse",     self.dict["reverse"])]
        radioLists[2] = [
            (self.dict["radio-search-scope"],"&Entire Outline","entire-outine"),
            (self.dict["radio-search-scope"],"Suboutline &Only","suboutline-only"),  
            (self.dict["radio-search-scope"],"&Node Only","node-only"),
            # I don't know what selection-only is supposed to do.
            (self.dict["radio-search-scope"],"Selection Only",None)] #,"selection-only")]
        checkLists[2] = []
        checkLists[3] = [
            ("Search &Headline Text", self.dict["search_headline"]),
            ("Search &Body Text",     self.dict["search_body"]),
            ("&Mark Finds",           self.dict["mark_finds"]),
            ("Mark &Changes",         self.dict["mark_changes"])]
        
        for i in xrange(numberOfColumns):
            for var,name,val in radioLists[i]:
                box = underlinedTkButton("radio",columns[i],anchor="w",text=name,variable=var,value=val)
                box.button.pack(fill="x")
                box.button.bind("<1>", self.resetWrap)
                if val == None: box.button.configure(state="disabled")
                box.bindHotKey(ftxt)
                box.bindHotKey(ctxt)
            for name,var in checkLists[i]:
                box = underlinedTkButton("check",columns[i],anchor="w",text=name,variable=var)
                box.button.pack(fill="x")
                box.button.bind("<1>", self.resetWrap)
                box.bindHotKey(ftxt)
                box.bindHotKey(ctxt)
                if var is None: box.button.configure(state="disabled")
        #@nonl
        #@-node:ekr.20031218072017.3903:<< Create four columns of radio and checkboxes >>
        #@nl
        #@    << Create two rows of buttons >>
        #@+node:ekr.20031218072017.3905:<< Create two rows of buttons >>
        # Create the button panes
        buttons  = Tk.Frame(outer,bd=1)
        buttons2 = Tk.Frame(outer,bd=1)
        buttons.pack (anchor="n",expand=1,fill="x")
        buttons2.pack(anchor="n",expand=1,fill="x")
        
        # HotKeys used for check/radio buttons:  a,b,c,e,h,i,l,m,n,o,p,r,s,t,w
        # HotKeys used for plain buttons (enter),d,g,t
        
        # Create the first row of buttons
        findButton=Tk.Button(buttons,
            width=9,text="Find",bd=4,command=self.findButton) # The default.
        findButton.pack(pady="1p",padx="25p",side="left")
        
        contextBox = underlinedTkButton("check",buttons,
            anchor="w",text="Show Conte&xt",variable=self.dict["batch"])
        contextBox.button.pack(pady="1p",side="left",expand=1)
        contextBox.bindHotKey(ftxt)
        contextBox.bindHotKey(ctxt)
        
        findAllButton = underlinedTkButton("button",buttons,
            width=9,text="Fin&d All",command=self.findAllButton)
        findAllButton.button.pack(pady="1p",padx="25p",side="right",fill="x")
        findAllButton.bindHotKey(ftxt)
        findAllButton.bindHotKey(ctxt)
        
        # Create the second row of buttons
        changeButton = underlinedTkButton("button",buttons2,
            width=10,text="Chan&Ge",command=self.changeButton)
        changeButton.button.pack(pady="1p",padx="25p",side="left")
        changeButton.bindHotKey(ftxt)
        changeButton.bindHotKey(ctxt)
        
        changeFindButton = underlinedTkButton("button",buttons2,
            text="Change, &Then Find",command=self.changeThenFindButton)
        changeFindButton.button.pack(pady="1p",side="left",expand=1)
        changeFindButton.bindHotKey(ftxt)
        changeFindButton.bindHotKey(ctxt)
            
        changeAllButton = underlinedTkButton("button",buttons2,
            width=10,text="Change All",command=self.changeAllButton)
        changeAllButton.button.pack(pady="1p",padx="25p",side="right")
        changeAllButton.bindHotKey(ftxt)
        changeAllButton.bindHotKey(ctxt)
        #@nonl
        #@-node:ekr.20031218072017.3905:<< Create two rows of buttons >>
        #@nl
        
        for widget in (self.find_ctrl, self.change_ctrl):
            widget.bind ("<1>",  self.resetWrap)
            widget.bind("<Key>", self.resetWrap)
            widget.bind("<Control-a>",self.selectAll)
            #widget.bind(g.virtual_event_name("SelectAll"),self.selectAll)
        
        for widget in (outer, self.find_ctrl, self.change_ctrl):
            widget.bind("<Key-Return>", self.findButton)
            widget.bind("<Key-Escape>", self.onCloseWindow)
        
        self.top.protocol("WM_DELETE_WINDOW", self.onCloseWindow)
    #@-node:ekr.20031218072017.3902:find.createFrame
    #@+node:ekr.20031218072017.2059:find.init
    def init (self,c):
    
        # N.B.: separate c.ivars are much more convenient than a dict.
        for key in self.intKeys:
            # New in 4.3: get ivars from @settings.
            val = c.config.getBool(key)
            setattr(self,key,val)
            val = g.choose(val,1,0) # Work around major Tk problem.
            self.dict[key].set(val)
            # g.trace(key,val)
    
        #@    << set find/change widgets >>
        #@+node:ekr.20031218072017.2060:<< set find/change widgets >>
        self.find_ctrl.delete("1.0","end")
        self.change_ctrl.delete("1.0","end")
        
        # New in 4.3: Get setting from @settings.
        for w,setting in (
            (self.find_ctrl,"find_text"),
            (self.change_ctrl,"change_text"),
        ):
            s = c.config.getString(setting)
            if s is None: s = ""
            w.insert("end",s)
        #@nonl
        #@-node:ekr.20031218072017.2060:<< set find/change widgets >>
        #@nl
        #@    << set radio buttons from ivars >>
        #@+node:ekr.20031218072017.2061:<< set radio buttons from ivars >>
        found = False
        for var,setting in (
            ("pattern_match","pattern-search"),
            ("script_search","script-search")):
            val = self.dict[var].get()
            if val:
                self.dict["radio-find-type"].set(setting)
                found = True ; break
        if not found:
            self.dict["radio-find-type"].set("plain-search")
            
        found = False
        for var,setting in (
            ("suboutline_only","suboutline-only"),
            ("node_only","node-only"),
            ("selection_only","selection-only")): # 11/9/03
            val = self.dict[var].get()
            if val:
                self.dict["radio-search-scope"].set(setting)
                found = True ; break
        if not found:
            self.dict["radio-search-scope"].set("entire-outine")
        #@nonl
        #@-node:ekr.20031218072017.2061:<< set radio buttons from ivars >>
        #@nl
    #@nonl
    #@-node:ekr.20031218072017.2059:find.init
    #@-node:ekr.20031218072017.3898:Birth & death
    #@+node:ekr.20031218072017.1460:find.update_ivars
    def update_ivars (self):
        
        """Called just before doing a find to update ivars from the find panel."""
    
        for key in self.intKeys:
            val = self.dict[key].get()
            setattr(self, key, val) # No more _flag hack.
            # g.trace(key,val)
    
        # Set ivars from radio buttons. Convert these to 1 or 0.
        find_type = self.dict["radio-find-type"].get()
        self.pattern_match = g.choose(find_type == "pattern-search",1,0)
        self.script_search = g.choose(find_type == "script-search",1,0)
    
        search_scope = self.dict["radio-search-scope"].get()
        self.suboutline_only = g.choose(search_scope == "suboutline-only",1,0)
        self.node_only       = g.choose(search_scope == "node-only",1,0)
        self.selection       = g.choose(search_scope == "selection-only",1,0) # 11/9/03
    
        s = self.find_ctrl.get("1.0","end - 1c") # Remove trailing newline
        s = g.toUnicode(s,g.app.tkEncoding)
        self.find_text = s
    
        s = self.change_ctrl.get("1.0","end - 1c") # Remove trailing newline
        s = g.toUnicode(s,g.app.tkEncoding)
        self.change_text = s
    #@nonl
    #@-node:ekr.20031218072017.1460:find.update_ivars
    #@+node:ekr.20031218072017.3906:onCloseWindow
    def onCloseWindow(self,event=None):
    
        self.top.withdraw()
    #@nonl
    #@-node:ekr.20031218072017.3906:onCloseWindow
    #@+node:ekr.20031218072017.3907:bringToFront
    def bringToFront (self):
        
        """Bring the tkinter Find Panel to the front."""
        
        c = self.c ; t = self.find_ctrl ; gui = g.app.gui
                
        self.top.withdraw() # Helps bring the window to the front.
        self.top.deiconify()
        self.top.lift()
    
        gui.set_focus(c,t,tag='bringToFront')
        gui.setTextSelection (t,"1.0","end") # Thanks Rich.
    #@nonl
    #@-node:ekr.20031218072017.3907:bringToFront
    #@+node:EKR.20040603221140:selectAll
    def selectAll (self,event=None):
    
        try:
            w = self.frame.focus_get()
            g.app.gui.setTextSelection(w,"1.0","end")
            return "break"
        except:
            return None # To keep pychecker happy.
    #@nonl
    #@-node:EKR.20040603221140:selectAll
    #@+node:ekr.20031218072017.3908:Tkinter wrappers (leoTkinterFind)
    def gui_search (self,t,*args,**keys):
        return t.search(*args,**keys)
    
    def init_s_ctrl (self,s):
        c = self.c ; t = self.s_ctrl	
        t.delete("1.0","end")
        t.insert("end",s)
        t.mark_set("insert",g.choose(self.reverse,"end","1.0"))
        return t
    #@nonl
    #@-node:ekr.20031218072017.3908:Tkinter wrappers (leoTkinterFind)
    #@-others
#@nonl
#@-node:ekr.20041025152343.1:class leoTkinterFind
#@-others
#@nonl
#@-node:ekr.20031218072017.3897:@thin leoTkinterFind.py
#@-leo
