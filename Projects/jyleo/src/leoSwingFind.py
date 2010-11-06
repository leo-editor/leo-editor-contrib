#@+leo-ver=4-thin
#@+node:mork.20050127121143:@thin leoSwingFind.py
import leoGlobals as g 
import leoFind  
import javax.swing as swing
import javax.swing.border as sborder
import javax.swing.table as stable
import javax.swing.event as sevent
import java.util.HashSet as hset
import java.awt as awt   
import java.awt.event as aevent
import java.lang
True = 1   
False = 0


class leoSwingFind (leoFind.leoFind ):

    """A class that implements Leo's tkinter find dialog."""

    #@    @+others
    #@+node:mork.20050127121143.1:Birth & death
    #@+node:mork.20050127121143.2:__init__
    def __init__(self,c, title="Find/Change",resizeable=False ):
        
        # Init the base classes...
    
        leoFind.leoFind.__init__(self, c)
        self.title = title
        g.app.findFrame = self
        #leoTkinterDialog.leoTkinterDialog.__init__(self,title,resizeable)
    
        #@    << init the tkinter ivars >>
        #@+node:mork.20050127121143.3:<< init the tkinter ivars >>
        self.dict = {}
          
        
        
        for key in self.intKeys:
            self.dict[key] = self.fakeIntTkVar()
        
        for key in self.newStringKeys:
            self.dict[key] = self.fakeStringTkVar()
            
        #self.s_text = Tk.Text() # Used by find.search()
        self.s_text = "HI" #AssertionError without
        #@nonl
        #@-node:mork.20050127121143.3:<< init the tkinter ivars >>
        #@nl
        self.c = c
        #self.createTopFrame() # Create the outer tkinter dialog frame.
        self.createFrame()
        self.lasPos = None
        self.reverse_flag = False
        self.selection = False
        
    #@-node:mork.20050127121143.2:__init__
    #@+node:orkman.20050222102419:fake TkVars --classes that look like Tk variables
    class fakeStringTkVar:
        
        def __init__( self ):
    
            self.sb = ""
        
        def get( self ):
            return self.sb
            
        def set( self, value ):  
    
            self.sb = value
            
    class fakeIntTkVar:
        
        def __init__( self ):
            self.val = 0
            
        def get( self ):
            return self.val
            
        def set( self, value ):
            self.val = value
    #@nonl
    #@-node:orkman.20050222102419:fake TkVars --classes that look like Tk variables
    #@+node:mork.20050127121143.4:destroySelf
    def destroySelf (self):
        
        self.top.destroy()
    #@nonl
    #@-node:mork.20050127121143.4:destroySelf
    #@+node:mork.20050127121143.5:find.createFrame
    def createFrame (self):
    
        # Create the find panel...
        #outer = Tk.Frame(self.frame,relief="groove",bd=2)
        #outer.pack(padx=2,pady=2)
        self.top = swing.JFrame()
        g.app.gui.addLAFListener( self.top )
        #self.top.setDefaultCloseOperation( swing.JFrame.EXIT_ON_CLOSE )
        self.top.title = self.title
        jtab = swing.JTabbedPane()
        self.top.add( jtab )
        cpane = swing.JPanel()
        jtab.addTab( "regular search", cpane )
        clnsearch = swing.JPanel()
        clnsearch.setName( "Leodialog" )
        jtab.addTab( "node search", clnsearch )
        #cpane = outer.getContentPane()
        cpane.setName( "Leodialog" )
        cpane.setLayout( awt.GridLayout( 3, 1 ) )
    
        
        #@    << Create the Find and Change panes >>
        #@+node:mork.20050127121143.6:<< Create the Find and Change panes >>
        #fc = Tk.Frame(outer, bd="1m")
        #fc.pack(anchor="n", fill="x", expand=1)
        findPanel = self.findPanel = swing.JTextArea()
        self.CutCopyPaste( findPanel )
        fspane = swing.JScrollPane( findPanel )
        
        self.changePanel = changePanel = swing.JTextArea()
        self.CutCopyPaste( changePanel )
        cpane2 = swing.JScrollPane( changePanel )
        splitpane = swing.JSplitPane( swing.JSplitPane.VERTICAL_SPLIT, fspane, cpane2 )
        splitpane.setDividerLocation( .5 )
        #outer.getContentPane().add( splitpane )
        cpane.add( splitpane )
        #outer.pack()
        
        
        # Removed unused height/width params: using fractions causes problems in some locales!
        #fpane = Tk.Frame(fc, bd=1)
        #cpane = Tk.Frame(fc, bd=1)
        
        #fpane.pack(anchor="n", expand=1, fill="x")
        #cpane.pack(anchor="s", expand=1, fill="x")
        
        # Create the labels and text fields...
        #flab = Tk.Label(fpane, width=8, text="Find:")
        #clab = Tk.Label(cpane, width=8, text="Change:")
        
        # Use bigger boxes for scripts.
        #self.find_text   = ftxt = Tk.Text(fpane,bd=1,relief="groove",height=4,width=20)
        #3self.change_text = ctxt = Tk.Text(cpane,bd=1,relief="groove",height=4,width=20)
        
        #fBar = Tk.Scrollbar(fpane,name='findBar')
        #cBar = Tk.Scrollbar(cpane,name='changeBar')
        
        # Add scrollbars.
        #for bar,txt in ((fBar,ftxt),(cBar,ctxt)):
        #    txt['yscrollcommand'] = bar.set
        #    bar['command'] = txt.yview
        #    bar.pack(side="right", fill="y")
        
        #flab.pack(side="left")
        #clab.pack(side="left")
        #ctxt.pack(side="right", expand=1, fill="both")
        #ftxt.pack(side="right", expand=1, fill="both")
        #@nonl
        #@-node:mork.20050127121143.6:<< Create the Find and Change panes >>
        #@nl
        #@    << Create four columns of radio and checkboxes >>
        #@+node:mork.20050127121143.7:<< Create four columns of radio and checkboxes >>
        #columnsFrame = Tk.Frame(outer,relief="groove",bd=2)
        #columnsFrame.pack(anchor="e",expand=1,padx="7p",pady="2p") # Don't fill.
        columnsFrame = swing.JPanel()
        columnsFrame.setLayout( swing.BoxLayout( columnsFrame, swing.BoxLayout.X_AXIS ) )
        cpane.add( columnsFrame, awt.BorderLayout.SOUTH )
        
        numberOfColumns = 4 # Number of columns
        columns = [] ; radioLists = [] ; checkLists = []; buttonGroups = []
        for i in xrange(numberOfColumns):
            #columns.append(Tk.Frame(columnsFrame,bd=1))
            jp = swing.JPanel()
            jp.setLayout( swing.BoxLayout( jp, swing.BoxLayout.Y_AXIS ) )
            columns.append( jp )
            radioLists.append([])
            checkLists.append([])
            buttonGroups.append( swing.ButtonGroup() )
        
        for i in xrange(numberOfColumns):
            columnsFrame.add( columns[ i ] )
            #columns[i].pack(side="left",padx="1p") # fill="y" Aligns to top. padx expands columns.
        
        radioLists[0] = [
            (self.dict["radio-find-type"],"Plain Search","plain-search"),  
            (self.dict["radio-find-type"],"Pattern Match Search","pattern-search"),
            (self.dict["radio-find-type"],"Script Search","script-search")]
        checkLists[0] = [
            ("Script Change",self.dict["script_change"])]
        checkLists[1] = [
            ("Whole Word",  self.dict["whole_word"]),
            ("Ignore Case", self.dict["ignore_case"]),
            ("Wrap Around", self.dict["wrap"]),
            ("Reverse",     self.dict["reverse"])]
        radioLists[2] = [
            (self.dict["radio-search-scope"],"Entire Outline","entire-outine"),
            (self.dict["radio-search-scope"],"Suboutline Only","suboutline-only"),  
            (self.dict["radio-search-scope"],"Node Only","node-only"),
            # I don't know what selection-only is supposed to do.
            (self.dict["radio-search-scope"],"Selection Only","selection-only")]
        checkLists[2] = []
        checkLists[3] = [
            ("Search Headline Text", self.dict["search_headline"]),
            ("Search Body Text",     self.dict["search_body"]),
            ("Mark Finds",           self.dict["mark_finds"]),
            ("Mark Changes",         self.dict["mark_changes"])]
            
            
        class rAction( swing.AbstractAction ):
            
            def __init__( self, name, var , val ):
                swing.AbstractAction.__init__( self, name )
                self.name = name
                self.var = var
                self.val = val
                
            def actionPerformed( self, aE ):
                self.var.set( self.val )
                
        class jcbAction( swing.AbstractAction ):
            
            def __init__( self, name, var ):
                swing.AbstractAction.__init__( self, name )
                self.var = var
                
            def actionPerformed( self, ae ):
            
                val = self.var.get()
                if val:
                    self.var.set( 0 )
                else:
                    self.var.set( 1 )
        
        for i in xrange(numberOfColumns):
            for var,name,val in radioLists[i]:
                aa = rAction( name, var, val )
                but = swing.JRadioButton( aa )
                columns[ i ].add( but )
                buttonGroups[ i ].add( but )
                #box = Tk.Radiobutton(columns[i],anchor="w",text=name,variable=var,value=val)
                #box.pack(fill="x")
                #box.bind("<1>", self.resetWrap)
                #if val == None: box.configure(state="disabled")
            for name, var in checkLists[i]:
                cbut = swing.JCheckBox( jcbAction( name, var ) )
                columns[ i ].add( cbut )
                #box = Tk.Checkbutton(columns[i],anchor="w",text=name,variable=var)
                #box.pack(fill="x")
                #box.bind("<1>", self.resetWrap)
                #if var is None: box.configure(state="disabled")
        
        for z in buttonGroups:
            
            elements = z.getElements()
            for x in elements:
                x.setSelected( True )
                break
        #@-node:mork.20050127121143.7:<< Create four columns of radio and checkboxes >>
        #@nl
        #@    << Create two rows of buttons >>
        #@+node:mork.20050127121143.8:<< Create two rows of buttons >>
        # Create the button panes
        secondGroup = swing.JPanel()
        secondGroup.setLayout( awt.GridLayout( 2, 3 , 10, 10 ) )
        cpane.add( secondGroup )
        #buttons  = Tk.Frame(outer,bd=1)
        #buttons2 = Tk.Frame(outer,bd=1)
        #buttons.pack (anchor="n",expand=1,fill="x")
        #buttons2.pack(anchor="n",expand=1,fill="x")
        class commandAA( swing.AbstractAction ):
            
            def __init__( self, name, command ):
                swing.AbstractAction.__init__( self, name )
                self.command = command
                
            def actionPerformed( self, aE ):
                self.command()
        
        
        # Create the first row of buttons
        #findButton=Tk.Button(buttons,width=8,text="Find",bd=4,command=self.findButton) # The default.
        #contextBox=Tk.Checkbutton(buttons,anchor="w",text="Show Context",variable=self.dict["batch"])
        #findAllButton=Tk.Button(buttons,width=8,text="Find All",command=self.findAllButton)
        findButton = swing.JButton( commandAA( "Find", self.findButton ) )
        contextBox = swing.JCheckBox( "Show Context" )
        findAllButton = swing.JButton( commandAA( "Find All", self.findAllButton ) )
        secondGroup.add( findButton )
        secondGroup.add( contextBox )
        secondGroup.add( findAllButton )
        
        #findButton.pack   (pady="1p",padx="25p",side="left")
        #contextBox.pack   (pady="1p",           side="left",expand=1)
        #findAllButton.pack(pady="1p",padx="25p",side="right",fill="x",)
        
        # Create the second row of buttons
        #changeButton    =Tk.Button(buttons2,width=8,text="Change",command=self.changeButton)
        #changeFindButton=Tk.Button(buttons2,        text="Change, Then Find",command=self.changeThenFindButton)
        #changeAllButton =Tk.Button(buttons2,width=8,text="Change All",command=self.changeAllButton)
        changeButton = swing.JButton( commandAA( "Change", self.changeButton ) )
        changeFindButton = swing.JButton( commandAA( "Change, Then Find", self.changeThenFindButton ) )
        changeAllButton = swing.JButton( commandAA( "Change All", self.changeAllButton ) )
        secondGroup.add( changeButton )
        secondGroup.add( changeFindButton )
        secondGroup.add( changeAllButton )
        
        #changeButton.pack    (pady="1p",padx="25p",side="left")
        #changeFindButton.pack(pady="1p",           side="left",expand=1)
        #changeAllButton.pack (pady="1p",padx="25p",side="right")
        #@nonl
        #@-node:mork.20050127121143.8:<< Create two rows of buttons >>
        #@nl
        
        self.createNodeSearchFrame( clnsearch )
        #self.top.setSize( 500, 500 )
        self.top.pack()
        size = self.top.getSize()
        size.width = size.width + 50
        self.top.setSize( size )
        splitpane.setDividerLocation( .5 )
        #outer.visible = True
        
        #for widget in (self.find_text, self.change_text):
        #    widget.bind ("<1>",  self.resetWrap)
        #    widget.bind("<Key>", self.resetWrap)
        #    widget.bind("<Control-a>",self.selectAll)
        #    #widget.bind(g.virtual_event_name("SelectAll"),self.selectAll)
        
        #for widget in (outer, self.find_text, self.change_text):
        #    widget.bind("<Key-Return>", self.findButton)
        #    widget.bind("<Key-Escape>", self.onCloseWindow)
        
        #self.top.protocol("WM_DELETE_WINDOW", self.onCloseWindow)
    
    
    #@-node:mork.20050127121143.5:find.createFrame
    #@+node:zorcanda!.20050404113128:createNodeSearchFrame
    def createNodeSearchFrame( self, clnpanel ):
        
        clnpanel.setLayout( awt.BorderLayout() )
        oclnpanel = clnpanel
        clnpanel = swing.Box.createHorizontalBox()
        oclnpanel.add( clnpanel, awt.BorderLayout.CENTER )
        
        
        jta = swing.JTextArea()
        self.CutCopyPaste( jta )
        tp = swing.JPanel( awt.GridLayout( 1, 1 ))
        self.nstext = jta
        sp = swing.JScrollPane( jta )
    
        border = sp.getBorder()
        tborder = sborder.TitledBorder( border )
        tborder.setTitle( "Base Text" )
        sp.setBorder( tborder )
        tp.add( sp )
        clnpanel.add( tp )
        
        
        bpanel = swing.JPanel()
        spl = swing.SpringLayout()
        bpanel.setLayout( spl )  
        executebox = swing.Box.createHorizontalBox()
        border = executebox.getBorder()
        tborder = sborder.TitledBorder( border )
        tborder.setTitle( "Searching" )
        executebox.setBorder( tborder )
        bpanel.add( executebox )
        spl.putConstraint( spl.NORTH, executebox, 5, spl.NORTH, bpanel )
        clnsearch = swing.JButton( "Clone Search" )
        clnsearch.actionPerformed = self.nodeSearch
        executebox.add( clnsearch )
        #spl.putConstraint( spl.NORTH, clnsearch, 5, spl.NORTH, bpanel )
        cpysearch = swing.JButton( "Copy Search" )
        cpysearch.actionPerformed = lambda event: self.nodeSearch( event, type='copy' ) 
        #bpanel.add( cpysearch )
        #spl.putConstraint( spl.NORTH, cpysearch, 5, spl.SOUTH, clnsearch )
        executebox.add( cpysearch )
        
        self.all_searches = rb1 = swing.JCheckBox( "Match Searches" )
        mtext = """Selecting causes the search system to only recognize a node if all searches match"""
        rb1.setToolTipText( mtext ) 
        bpanel.add( rb1 )
        spl.putConstraint( spl.NORTH, rb1, 5, spl.NORTH, bpanel )
        spl.putConstraint( spl.WEST, rb1, 5, spl.EAST, executebox )
        
        
        self.all_filters = rb2 = swing.JCheckBox( "Match Filters" )
        mtext = """Selecting causes the filter system to only filter out a node if all searches match"""
        rb2.setToolTipText( mtext )
        bpanel.add( rb2 )
        spl.putConstraint( spl.NORTH, rb2, 5, spl.SOUTH, rb1 )
        spl.putConstraint( spl.WEST, rb2, 5, spl.EAST, executebox )
        
        spl2 = swing.SpringLayout()
        sandf = swing.JPanel( spl2 )
        sandf.setPreferredSize( awt.Dimension( 275, 85 ) )
        border = sandf.getBorder()
        tborder = sborder.TitledBorder( border )
        tborder.setTitle( "Derive Searches and Filters" )
        sandf.setBorder( tborder )
        bpanel.add( sandf )
        spl.putConstraint( spl.NORTH, sandf, 5, spl.SOUTH, executebox )
        
        b1 = swing.JButton( "+ as Search" )
        b1.setActionCommand( "search" )
        b1.actionPerformed = self.addAsSearchOrExclude
        b2 = swing.JButton( "+ as Filter" )
        b2.setActionCommand( "filter" )
        b2.actionPerformed = self.addAsSearchOrExclude
        sandf.add( b1 ); sandf.add( b2 )
        spl2.putConstraint( spl2.NORTH, b1, 5, spl2.NORTH, executebox )
        spl2.putConstraint( spl2.NORTH, b2, 5, spl2.SOUTH, b1 )
        b3 = swing.JButton( "+ as Regex-Search" )
        b3.setActionCommand( "regex-search" )
        b3.actionPerformed = self.addAsSearchOrExclude
        sandf.add( b3 )
        spl2.putConstraint( spl2.NORTH, b3,5, spl2.NORTH, executebox )
        spl2.putConstraint( spl2.WEST, b3,5, spl2.EAST, b1 )
        #spl2.putConstraint( spl2.EAST, b3, 5, spl2.EAST, executebox )
        b4 = swing.JButton( "+ as Regex-Filter" )
        b4.setActionCommand( "regex-filter" )
        b4.actionPerformed = self.addAsSearchOrExclude
        sandf.add( b4 )
        spl2.putConstraint( spl2.NORTH, b4, 5, spl2.SOUTH, b1 )
        spl2.putConstraint( spl2.WEST, b4, 5, spl2.EAST, b2 )
        clear = swing.JButton( "Clear Text" )
        def clear_txt( event, text = jta ):
            
            jta.setText( "" )
        clear.actionPerformed = clear_txt
        bpanel.add( clear )
        spl.putConstraint( spl.NORTH, clear, 5, spl.SOUTH, sandf )
        
        
        clnpanel.add( bpanel )
        tp.setPreferredSize( awt.Dimension( 200, 100 ) )
        clnpanel.setPreferredSize( awt.Dimension( 200, 100 )) 
        
        class dtm2( stable.DefaultTableModel ):
            
            def __int__( self ):
                stable.DefaultTableModel.__init__( self )
                
            def isCellEditable( self, a, b ):
                if b == 1:
                    return False
                return True
            
        self.dtm = dtm = dtm2()
        dtm.addColumn( "Text" )
        dtm.addColumn( "Type" )
        jp = swing.JPanel( awt.BorderLayout() )
        self.table = jt = swing.JTable( dtm )
        jt.getColumn( "Text" ).setCellEditor( self._LeoTableCellEditor() )
        jt.getColumn( "Text" ).setCellRenderer( self._LeoTableCellRenderer() )
        
        rmv = swing.JButton( "Remove" )
        def rmv_row( event, jt = jt, dtm = dtm ):
            
            row = jt.getSelectedRow()
            if row != -1:
                dtm.removeRow( row )
            
        rmv.actionPerformed = rmv_row
        rmva = swing.JButton( "Clear" )
        def rmv_all( event, jt = jt, dtm = dtm ):
            
            rc = dtm.getRowCount()
            for z in xrange( rc ):
                dtm.removeRow( 0 )       
            
        rmva.actionPerformed = rmv_all   
        rmvp = swing.Box.createVerticalBox()
        rmvp.add( rmv )
        rmvp.add( rmva )
        jp.add( rmvp, awt.BorderLayout.EAST )
        jtsp = swing.JScrollPane( jt )
        border = jtsp.getBorder()
        tborder = sborder.TitledBorder( border )
        tborder.setTitle( "Searchers and Filters" )
        jtsp.setBorder( tborder )
        jp.add( jtsp )
    
        jp.setPreferredSize( clnpanel.getPreferredSize() )
        oclnpanel.add( jp, awt.BorderLayout.SOUTH )
        
    #@nonl
    #@-node:zorcanda!.20050404113128:createNodeSearchFrame
    #@+node:zorcanda!.20050404144122:addAsSearchOrExclude
    def addAsSearchOrExclude( self, event ):
        
        source = event.getSource()
        ac = source.getActionCommand()
        
        doc = self.nstext.getDocument()
        txt = doc.getText( 0, doc.getLength() )
        
        self.dtm.addRow( ( java.lang.String( txt ), ac ) )
    #@nonl
    #@-node:zorcanda!.20050404144122:addAsSearchOrExclude
    #@+node:mork.20050127121143.9:find.init
    def init (self,c):
    
        # N.B.: separate c.ivars are much more convenient than a dict.
        for key in self.intKeys:
            val = getattr(c, key + "_flag")
            val = g.choose(val,1,0) # 2/1/04: work around major Tk problem.
            self.dict[key].set(val)
            # g.trace(key,val)
    
        #@    << set find/change widgets >>
        #@+node:mork.20050127121143.10:<< set find/change widgets >>
        self.find_text.delete("1.0","end")
        self.find_text.insert("end",c.find_text)
        
        self.change_text.delete("1.0","end")
        self.change_text.insert("end",c.change_text)
        #@nonl
        #@-node:mork.20050127121143.10:<< set find/change widgets >>
        #@nl
        #@    << set radio buttons from ivars >>
        #@+node:mork.20050127121143.11:<< set radio buttons from ivars >>
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
        #@-node:mork.20050127121143.11:<< set radio buttons from ivars >>
        #@nl
    #@nonl
    #@-node:mork.20050127121143.9:find.init
    #@+node:mork.20050127121143.12:find.set_ivars
    def update_ivars2 (self ): #was called set_ivars
        
        # N.B.: separate c.ivars are much more convenient than a dict.
        c = self.c
        for key in self.intKeys:
            val = self.dict[key].get()
            setattr(c, key + "_flag", val)
            # g.trace(key,val)
    
        # Set ivars from radio buttons. 10/2/01: convert these to 1 or 0.
        find_type = self.dict["radio-find-type"].get()
        c.pattern_match_flag = g.choose(find_type == "pattern-search",1,0)
        c.script_search_flag = g.choose(find_type == "script-search",1,0)
    
        search_scope = self.dict["radio-search-scope"].get()
        c.suboutline_only_flag = g.choose(search_scope == "suboutline-only",1,0)
        c.node_only_flag       = g.choose(search_scope == "node-only",1,0)
        c.selection_only_flag  = g.choose(search_scope == "selection-only",1,0) # 11/9/03
    
        #s = self.find_text.get("1.0","end - 1c") # Remove trailing newline
        #s = g.toUnicode(s,g.app.tkEncoding) # 2/25/03
        #c.find_text = s
        s = self.findPanel.getText()
        c.find_text = s
    
        #s = self.change_text.get("1.0","end - 1c") # Remove trailing newline
        #s = g.toUnicode(s,g.app.tkEncoding) # 2/25/03
        #c.change_text = s
        s = self.changePanel.getText()
        c.change_text = s
    #@nonl
    #@-node:mork.20050127121143.12:find.set_ivars
    #@+node:orkman.20050222110706:find.update_ivars
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
        
        self.reverse_flag = self.dict[ 'reverse' ].get()
    
        #s = self.find_ctrl.get("1.0","end - 1c") # Remove trailing newline
        s = self.findPanel.getText()
        s = g.toUnicode(s,g.app.tkEncoding)
        self.find_text = s
    
        #s = self.change_ctrl.get("1.0","end - 1c") # Remove trailing newline
        s = self.changePanel.getText()
        s = g.toUnicode(s,g.app.tkEncoding)
        self.change_text = s
    #@nonl
    #@-node:orkman.20050222110706:find.update_ivars
    #@-node:mork.20050127121143.1:Birth & death
    #@+node:mork.20050127121143.13:onCloseWindow
    def onCloseWindow(self,event=None):
    
        self.top.dispose()
        self.top = None
    #@nonl
    #@-node:mork.20050127121143.13:onCloseWindow
    #@+node:mork.20050127121143.14:bringToFront
    def bringToFront (self):
        
        """Bring the tkinter Find Panel to the front."""
        
        c = g.top() ; #t = self.find_text ; 
        gui = g.app.gui
        t = self.findPanel
        width, height = gui._calculateCenteredPosition( self.top )
        self.top.setLocation( width, height )        
        #self.top.withdraw() # Helps bring the window to the front.
        #self.top.deiconify()
        #self.top.lift()
        self.top.visible = 1
    
        gui.set_focus(c,t)
        gui.setTextSelection (t, 0, len( t.getText() )) # Thanks Rich.
    #@-node:mork.20050127121143.14:bringToFront
    #@+node:mork.20050127121143.15:selectAll
    def selectAll (self,event=None):
    
        try:
            w = self.frame.focus_get()
            g.app.gui.setTextSelection(w,"1.0","end")
            return "break"
        except:
            return None # To keep pychecker happy.
    #@nonl
    #@-node:mork.20050127121143.15:selectAll
    #@+node:mork.20050127121143.16:Tkinter wrappers (leoTkinterFind)
    def gui_search (self,t,*args,**keys):
        nocase = keys[ 'nocase' ]
        backwards = keys[ 'backwards' ]
        regexp = keys[ 'regexp' ]
        stopindex = keys[ 'stopindex' ]
        
        if self.pattern_match:
            import java.util.regex as reg
            flags = 0
            if not regexp:
                flags = flags|reg.Pattern.LITERAL
            if nocase:
                flags = flags|reg.Pattern.CASE_INSENSITIVE
            flags = java.lang.Integer( flags )
        
            pat = args[ 0 ]
            pat = reg.Pattern.compile( pat, flags.intValue() )
            match = pat.matcher( java.lang.String( t ) )
            if stopindex:
                match = match.region( 0, stopindex )
            
            if backwards:
                start = -1
                end = -1
                while match.find():
                    start = match.start()
                    end = match.end()
                return start, end
            else:
                found = match.find()
                if found:
                    return ( match.start(), match.end() )
                else: return None, None
        else:
            if backwards:
                where = t.rfind( args[ 0 ] )
                if where != -1:
                    return where, where + len( args[ 0 ] )
                else:
                    return None, None
            else:
                match = java.lang.String( t ).indexOf( args[ 0 ] )
                if match != -1:
                    return match, match + len( args[ 0 ] )
                else:
                    return None, None
        #return t.search(*args,**keys)
    
    def init_s_ctrl (self,s):
        c = self.c ; #t = self.s_text	
        return c.frame.body.editor.editor
        #t.delete("1.0","end")
        #t.insert("end",s)
        #t.mark_set("insert",g.choose(c.reverse_flag,"end","1.0"))
        #return t
    #@-node:mork.20050127121143.16:Tkinter wrappers (leoTkinterFind)
    #@+node:orkman.20050201172607:search
    def search (self):
    
        """Searches the present headline or body text for c.find_text and returns True if found.
    
        c.whole_word_flag, c.ignore_case_flag, and c.pattern_match_flag control the search."""
        
        __pychecker__ = '--no-implicitreturns' # Suppress bad warning.
    
        self.p = self.c.currentPosition()
        c = self.c ; p = self.p 
        self.v = p
        se = 0
        index = 0
        stopindex = 0
        editor = self.c.frame.body.editor.editor
        caret_pos = editor.getCaretPosition()
        doc = editor.getDocument()
    
        if self.selection:
            txt = editor.getSelectedText()
        else:
            if self.reverse_flag:
                txt = doc.getText( 0, caret_pos )
            else:
                txt = doc.getText( caret_pos, doc.getLength() - caret_pos )
        #xt = editor.getText( caret_pos, len( txt ) )
        find_text = self.findPanel.getText()
        pos = self.gui_search(txt ,find_text,index,
                                stopindex=stopindex,backwards=self.reverse_flag,
                                regexp=self.pattern_match,nocase=self.ignore_case)
                        
        notin = ( None, -1 )        
        if self.node_only: 
            if pos[ 0 ] in notin and pos[ 1 ] in notin:
                return pos
            else:
                return pos[ 0 ] + caret_pos, pos[ 1 ] + caret_pos
        if self.selection:
            if pos[ 0 ] in notin and pos[ 1 ] in notin: return pos
            else:
                return pos[ 0 ] + caret_pos, pos[ 1 ] + caret_pos
        
        if pos[ 0 ] in notin and pos[ 1 ] in notin:
            #if self.suboutline_only:
            #    iterator = self.p.children_iter()
            #else:
            #    iterator = self.p.allNodes_iter()
            #    for z in iterator:
            #        if z == p: break
            
            self.v = z = self.selectNextVnode()
            while z:
                #if z == p: continue
                txt = z.bodyString()
                pos = self.gui_search(txt ,find_text,index,
                                stopindex=stopindex,backwards=self.reverse_flag,
                                regexp=self.pattern_match,nocase=self.ignore_case)
                if pos[ 0 ] not in ( None, -1 ) and pos[ 1 ] not in ( None, -1 ):
                    c.beginUpdate()
                    c.selectPosition( z )
                    c.endUpdate()
                    return pos
                else:
                    self.v = z = self.selectNextVnode()     
        else:
            if self.reverse_flag:
                npos = pos[ 1 ], pos[ 0 ]
            else:
                npos = pos[ 0 ] + caret_pos, pos[ 1 ] + caret_pos
            return npos
        
        return None, None        
        
    #@+at
    #     if self.lasPos and self.lasPos == v:
    #         ed = self.c.frame.body.editor.editor
    #         se = ed.getCaretPosition()
    #         t = ed.getText()
    #         t = t[ se: ]
    #         #t = ed.getText( se, len( ed.getText() ) - se  )
    #     else:
    #         t = v.bodyString()
    #         self.lasPos = v.copy()
    #     gui = g.app.gui
    # 
    #     assert(c and v)
    #     if c.selection_only_flag: # 11/9/03
    #         index,stopindex = self.selStart, self.selEnd
    #         # g.trace(index,stopindex,v)
    #         if index == stopindex:
    #             return None, None
    #     else:
    #         #index = gui.getInsertPoint(t)
    #         index = v.v.t.insertSpot
    #         stopindex = 
    # g.choose(c.reverse_flag,gui.firstIndex(),gui.lastIndex())
    #     sub_iter = self.v.allNodes_iter( copy = True )
    #     sub_iter.first = self.v.copy()
    #     for z in sub_iter:
    #         if self.lasPos and self.lasPos == z:
    #             ed = self.c.frame.body.editor.editor
    #             se = ed.getCaretPosition()
    #             t = ed.getText()
    #             t = t[ se: ]
    #         else:
    #             se = 0
    #             t = z.bodyString()
    #         try:
    #             pos = self.gui_search(t,c.find_text,index,
    #                 stopindex=stopindex,backwards=c.reverse_flag,
    #                 regexp=c.pattern_match_flag,nocase=c.ignore_case_flag)
    #         except:
    #             g.es_exception(full=False)
    #             self.errors += 1
    #             return None, None
    #         if not pos:
    #             continue
    # 
    #         t = self.c.frame.body.editor.editor
    #         self.c.beginUpdate()
    #         self.c.frame.tree.select( z )
    #         self.c.endUpdate()
    #         t.requestFocusInWindow()
    #         t.select( pos[ 0 ] + se  , pos[ 1 ] + se )
    #         return pos[ 0 ] + se, pos[ 1 ] + se
    # 
    #@-at
    #@-node:orkman.20050201172607:search
    #@+node:orkman.20050203185616:findButton --had to change
    def findButton( self ):
        
        self.setup_button()
        self.executeSearch()
    #@+at
    #     pos = self.search()
    #     if pos[ 0 ] and pos[ 1 ]:
    #         editor = self.c.frame.body.editor.editor
    #         editor.select( pos[ 0 ], pos[ 1 ] )
    #         #editor.setSelectionStart( pos[ 0 ] )
    #         #editor.setSelectionEnd( pos[ 1 ] )
    #         if len(self.change_text ) != 0:
    #             editor.replaceSelection( self.change_text )
    # 
    #@-at
    #@-node:orkman.20050203185616:findButton --had to change
    #@+node:orkman.20050222123034:executeSearch
    def executeSearch( self ):
        
        pos = self.search()
        if pos[ 0 ] not in ( None, -1 ) and pos[ 1 ] not in ( None, -1 ):
            editor = self.c.frame.body.editor.editor
            editor.setCaretPosition( pos[ 0 ] )
            editor.moveCaretPosition( pos[ 1 ] )
            
            if self.mark_finds:
                
                cp = self.c.currentPosition()
                cp.setMarked()
                self.c.frame.tree.redraw()
                
    #@-node:orkman.20050222123034:executeSearch
    #@+node:orkman.20050222122829:findNextCommand
    def findNextCommand( self, c ):
        
        self.executeSearch()
    #@nonl
    #@-node:orkman.20050222122829:findNextCommand
    #@+node:zorcanda!.20050404105556:changeAll
    def changeAll( self ):
        
        cp = self.c.currentPosition().copy()
        
        fdoc = self.findPanel.getDocument()
        cdoc = self.changePanel.getDocument()
        ftxt = self.findPanel.getText( 0, fdoc.getLength() )
        ctxt = self.changePanel.getText( 0, cdoc.getLength() )
        if self.pattern_match:
            import java.util.regex as reg
            pattern = reg.Pattern.compile( ftxt )
            matcher = pattern.matcher( java.lang.String( "" ) )
        for z in cp.allNodes_iter( copy = True ):
    
            changed = False
            txt = z.bodyString()
            if self.pattern_match:
                matcher.reset( java.lang.String( txt ) )
                ntxt = matcher.replaceAll( java.lang.String( ctxt ) )
            else:
                ntxt = txt.replace( ftxt, ctxt )
                    
            if txt != ntxt: changed = True
            if changed:
                z.setBodyStringOrPane( ntxt )
                if self.mark_changes:
                    z.setMarked()
                    
        self.c.frame.tree.redraw()
                
    
    #@-node:zorcanda!.20050404105556:changeAll
    #@+node:zorcanda!.20050404121856:clone and copy searching
    #@+node:zorcanda!.20050404121856.2:nodeSearch
    def nodeSearch( self, event, type = 'clone' ):
        
        all_searches = self.all_searches.isSelected()
        all_filters = self.all_filters.isSelected()
        dvector = self.dtm.getDataVector()
        if dvector.size() == 0: return
        search = []
        rsearch = []
        filter = []
        rfilter = []
        addto = { 'search': search, 'regex-search': rsearch,
                  'filter': filter, 'regex-filter': rfilter }
        for z in dvector:
            addto[ z[ 1 ] ].append( z[ 0 ] )
    
        bstring = 'Used All Searches: %s   Used All Filters: %s' %( all_searches, all_filters )
        bstring = bstring + '\n\nsearches: \n%s' % '\n'.join( search )
        bstring = bstring + '\n\nregex-searches: \n%s' % '\n'.join( rsearch )
        bstring = bstring + '\n\nfilters: \n%s' % '\n'.join( filter )
        bstring = bstring + '\n\nregex-filters: \n%s' % '\n'.join( rfilter )
        bstring = bstring + '\n\n@' + 'others'
    
        import java.util.regex as reg        
        for z in xrange( len( rfilter ) ):
            pat = reg.Pattern.compile( rfilter[ z ] )
            matcher = pat.matcher( java.lang.String( "" )) 
            rfilter[ z ] = matcher
            
        for z in xrange( len( rsearch ) ):
            pat = reg.Pattern.compile( rsearch[ z ] )
            matcher = pat.matcher( java.lang.String( "" ) )
            rsearch[ z ] = matcher
        
    
    
    
    
        
        c = self.c
        cp = self.c.currentPosition()
        if not cp.isValid(): return
        c.beginUpdate()
        if type == 'clone':
            chstring = "Clone Search Results:"
        else:
            chstring = "Copy Search Results:"
        container = self.createContainerNode( chstring, bstring )
        haveseen = {}
        haveseen[ container ] = None
        for z in cp.allNodes_iter( copy = True ):
            if z in haveseen: continue
            else:
                haveseen[ z ] = None
            
            if z.getParent() == container: continue
            elif z == container: continue
            bstring = z.bodyString()
            hstring = z.headString()
            found = False
    
            searchmatches = hset()
            if not found:
                for z2 in search:
                    if bstring.find( z2 ) != -1:
                        found = True
                        if not all_searches:
                            break
                    elif all_searches:
                        found = False
                        searchmatches.add( False )
                        break
            
           
            if not found or ( all_searches and False not in searchmatches ):
                for z2 in rsearch:
                    matcher = z2
                    matcher.reset( java.lang.String( bstring ) )
                    if matcher.find():
                        found = True
                        if not all_searches:
                            break
                    elif all_searches:
                        found = False
                        break    
            
            filtermatches = hset()
            if found:
                for z2 in filter:
                    if bstring.find( z2 ) != -1:
                        filtermatches.add( True )
                        if not all_filters:
                            found = False
                            break
                    elif all_filters:
                        filtermatches.add( False )
                        break
                
    
            
            filtermatches2 = hset()       
            if found:
                for z2 in rfilter:
                    matcher = z2
                    matcher.reset( java.lang.String( bstring ) )
                    if matcher.find():
                        filtermatches2.add( True )
                        if not all_filters:
                            found = False
                            break
                    elif all_filters:
                        filtermatches2.add( False )
                        break
                
            if all_filters and filtermatches.size() != 0 and filtermatches2.size() != 0 and  (
             ( False not in filtermatches ) and ( False not in filtermatches2 ) ):
                found = False
                
            if found:
                if type == 'clone':
                    cln = z.clone( z )
                    cln.moveToLastChildOf( container )
                else:
                    pos = container.insertAsLastChild()
                    cln = z.copyTreeFromSelfTo( pos )
              
        c.frame.tree.tree_reloader.expand( container )
        c.selectPosition( container )  
        c.endUpdate()     
    #@-node:zorcanda!.20050404121856.2:nodeSearch
    #@+node:zorcanda!.20050404121856.3:createContainerNode
    def createContainerNode( self, hs, bs ):
        
        c = self.c
        cp = c.currentPosition()
        np = cp.insertAfter()
        np.v.t.headString = hs
        np.v.t.bodyString = bs
        return np
    #@nonl
    #@-node:zorcanda!.20050404121856.3:createContainerNode
    #@-node:zorcanda!.20050404121856:clone and copy searching
    #@+node:zorcanda!.20050406132922:class CutCopyPaste
    class CutCopyPaste( aevent.MouseAdapter ):
        
        def __init__( self, jtcomponent ):
            
            self.jtcomponent = jtcomponent
            self.popup = popup = swing.JPopupMenu()
            i1 = swing.JMenuItem( "Cut" )
            i1.actionPerformed = lambda event: jtcomponent.cut()
            popup.add( i1 )
            i2 = swing.JMenuItem( "Copy" )
            i2.actionPerformed = lambda event: jtcomponent.copy()
            popup.add( i2 )
            i3 = swing.JMenuItem( "Paste" )
            i3.actionPerformed = lambda event: jtcomponent.paste()
            popup.add( i3 )
            i4 = swing.JMenuItem( "Select All" )
            i4.actionPerformed = lambda event: jtcomponent.selectAll()
            popup.add( i4 )
            jtcomponent.addMouseListener( self )
        
        def mousePressed( self, mevent ):
            
            if mevent.getButton() == mevent.BUTTON3:
                self.popup.show( self.jtcomponent, mevent.getX(), mevent.getY() )
            
    #@-node:zorcanda!.20050406132922:class CutCopyPaste
    #@+node:zorcanda!.20050406133908:class _LeoTableCellEditor
    class _LeoTableCellEditor( swing.AbstractCellEditor, stable.TableCellEditor ):
    
        def __init__( self ):
            swing.AbstractCellEditor.__init__( self )  
            self._row = None      
            self._rowh = None   
            self._table = None    
            self.to_be_reset = []
            self.lsners = []
            
        class _deselector( sevent.PopupMenuListener ):
            
            def __init__( self, ced ):
                self.ced = ced
                
            def popupMenuCanceled( self, e):
                self.ced.fireEditingStopped()
                
            def popupMenuWillBecomeInvisible( self, e):
                self.ced.fireEditingStopped()
                
            def popupMenuWillBecomeVisible( self, e):
                pass  
        
        class _lcr( swing.DefaultListCellRenderer ):
            
            def __init__( self , data):
                swing.DefaultListCellRenderer.__init__( self )
                self.data = data
                
            def getListCellRendererComponent( self, list, value, index, isSelected, cellHasFocus):
                
                jta = swing.JTextArea()
                jta.setLineWrap( True )
                jta.setText( self.data ) 
                return jta
                
        def getTableCellEditorComponent( self, table, value, isSelected, row, column):
            
    
                values = value.split( '\n' )
                self._value = value
                jcb = swing.JComboBox( ( values[ 0 ], ) )
                jcb.addPopupMenuListener( self._deselector( self ) )
                jcb.setEditable( False )
                jcb.setRenderer( self._lcr( value ) )
                if len( values ) > 5:
                    jcb.setMaximumRowCount( 0 )
                else:
                    jcb.setMaximumRowCount( 1 )
                if isSelected:
                    jcb.setForeground( table.getSelectionForeground() )
                    jcb.setBackground( table.getSelectionBackground() )
                else:
                    jcb.setForeground( table.getForeground() )
                    jcb.setBackground( table.getBackground() )
                return jcb
    
                
        def removeCellEditorListener( self, arg ):
            
            self.lsners.remove( arg )
            
        def addCellEditorListener( self, arg ):
            
            self.lsners.append( arg )
    
        def fireEditingStopped( self ):
            
            ce = sevent.ChangeEvent( self )
            for z in self.lsners:
                z.editingStopped( ce )
            
        def isCellEditable( self, evobj ):
            return True
            
        def shouldSelectCell( self, evobj ):
    
            return True
            
        def getCellEditorValue( self ):
            return self._value
            
            
        def stopCellEditing( self ):
            
            self.fireEditingStopped()
            return True
            
    #@-node:zorcanda!.20050406133908:class _LeoTableCellEditor
    #@+node:zorcanda!.20050406185416:class _LeoTableCellRenderer
    class _LeoTableCellRenderer( stable.DefaultTableCellRenderer ):
        
        def __init__( self ):
            stable.DefaultTableCellRenderer.__init__( self )
            
        def getTableCellRendererComponent( self, table, value, isSelected, hasFocus, row, column):
            
            jcb = swing.JComboBox( ( value.split( '\n' )[ 0 ], ) )
            if isSelected:
                jcb.setForeground( table.getSelectionForeground() )
                jcb.setBackground( table.getSelectionBackground() )
            else:
                jcb.setForeground( table.getForeground() )
                jcb.setBackground( table.getBackground() )
                
            return jcb
             
    
    #@-node:zorcanda!.20050406185416:class _LeoTableCellRenderer
    #@-others
#@nonl
#@-node:mork.20050127121143:@thin leoSwingFind.py
#@-leo
