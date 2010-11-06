#@+leo-ver=4-thin
#@+node:zorcanda!.20050409134025:@thin leoSwingComparePanel.py
#@@language python  
#@@tabwidth -4
#@@pagewidth 80

import leoGlobals as g
import leoCompare
import javax.swing as swing
import java.awt as awt
import java.awt.event as aevent
import java
import javax.swing.border as sborder
import javax.swing.table as stable


class leoSwingComparePanel (leoCompare.leoCompare):
    
    """A class that creates Leo's compare panel."""

    #@    @+others
    #@+node:zorcanda!.20050409134025.1:Birth...
    #@+node:zorcanda!.20050409134025.2: tkinterComparePanel.__init__
    def __init__ (self,c):
        
        # Init the base class.
        leoCompare.leoCompare.__init__ (self,c)
        #leoTkinterDialog.leoTkinterDialog.__init__(self,"Compare files and directories",resizeable=False)
        self.c = c
    
        #@    << init tkinter compare ivars >>
        #@+node:zorcanda!.20050409134025.3:<< init tkinter compare ivars >>
        # Ivars pointing to Tk elements.
        self.browseEntries = []
        self.extensionEntry = None
        self.countEntry = None
        self.printButtons = []
            
        # No corresponding ivar in the leoCompare class.
        self.useOutputFileVar = self.IntVar()
        
        # These all correspond to ivars in leoCompare	
        self.appendOutputVar             = self.IntVar()
        
        self.ignoreBlankLinesVar         = self.IntVar()
        self.ignoreFirstLine1Var         = self.IntVar()
        self.ignoreFirstLine2Var         = self.IntVar()
        self.ignoreInteriorWhitespaceVar = self.IntVar()
        self.ignoreLeadingWhitespaceVar  = self.IntVar()
        self.ignoreSentinelLinesVar      = self.IntVar()
        
        self.limitToExtensionVar         = self.IntVar()
        self.makeWhitespaceVisibleVar    = self.IntVar()
        
        self.printBothMatchesVar         = self.IntVar()
        self.printMatchesVar             = self.IntVar()
        self.printMismatchesVar          = self.IntVar()
        self.printTrailingMismatchesVar  = self.IntVar()
        self.stopAfterMismatchVar        = self.IntVar()
        #@nonl
        #@-node:zorcanda!.20050409134025.3:<< init tkinter compare ivars >>
        #@nl
        
        # These ivars are set from Entry widgets.
        self.limitCount = 0
        self.limitToExtension = None
        self._dtm = self._DTM( [  "","Mismatches", ], 0 )
        # The default file name in the "output file name" browsers.
        self.defaultOutputFileName = "CompareResults.txt"
        
        self.createTopFrame()
        self.createFrame()
    #@-node:zorcanda!.20050409134025.2: tkinterComparePanel.__init__
    #@+node:zorcanda!.20050409135351:fake Tk vars
    class IntVar:
        
        def __init__( self ):
            
            self._val = 0
            
        def get( self ):
            return self._val
            
        def set( self, val ):
            self._val = val
    #@-node:zorcanda!.20050409135351:fake Tk vars
    #@+node:zorcanda!.20050410105922:class _DTM
    class _DTM( stable.DefaultTableModel ):
        
        def __init__( self, *args ):
            stable.DefaultTableModel.__init__( self, *args )
            
        def isCellEditable( self, row, column ):
            return False
            
    #@-node:zorcanda!.20050410105922:class _DTM
    #@+node:zorcanda!.20050409134025.4:finishCreate
    # Initialize ivars from config parameters.
    
    def finishCreate (self):
        
        c = self.c
        
        # File names.
        for i,option in (
            (0,"compare_file_1"),
            (1,"compare_file_2"),
            (2,"output_file") ):
                
            name = c.config.getString(option)
            if name and len(name) > 0:
                e = self.browseEntries[i]
                e.delete(0,"end")
                e.insert(0,name)
                
        name = c.config.getString("output_file")
        b = g.choose(name and len(name) > 0,1,0)
        self.useOutputFileVar.set(b)
    
        # File options.
        b = c.config.getBool("ignore_first_line_of_file_1")
        if b == None: b = 0
        self.ignoreFirstLine1Var.set(b)
        
        b = c.config.getBool("ignore_first_line_of_file_2")
        if b == None: b = 0
        self.ignoreFirstLine2Var.set(b)
        
        b = c.config.getBool("append_output_to_output_file")
        if b == None: b = 0
        self.appendOutputVar.set(b)
    
        ext = c.config.getString("limit_directory_search_extension")
        b = ext and len(ext) > 0
        b = g.choose(b and b != 0,1,0)
        self.limitToExtensionVar.set(b)
        if b:
            e = self.extensionEntry
            #e.delete(0,"end")
            e.setText( ext )
            #e.insert(0,ext)
            
        # Print options.
        b = c.config.getBool("print_both_lines_for_matches")
        if b == None: b = 0
        self.printBothMatchesVar.set(b)
        
        b = c.config.getBool("print_matching_lines")
        if b == None: b = 0
        self.printMatchesVar.set(b)
        
        b = c.config.getBool("print_mismatching_lines")
        if b == None: b = 0
        self.printMismatchesVar.set(b)
        
        b = c.config.getBool("print_trailing_lines")
        if b == None: b = 0
        self.printTrailingMismatchesVar.set(b)
        
        n = c.config.getInt("limit_count")
        b = n and n > 0
        b = g.choose(b and b != 0,1,0)
        self.stopAfterMismatchVar.set(b)
        if b:
            e = self.countEntry
            e.setText( str( n ) )
            #e.delete(0,"end")
            #e.insert(0,str(n))
    
        # bool options...
        for option,var,default in (
            # Whitespace options.
            ("ignore_blank_lines",self.ignoreBlankLinesVar,1),
            ("ignore_interior_whitespace",self.ignoreInteriorWhitespaceVar,0),
            ("ignore_leading_whitespace",self.ignoreLeadingWhitespaceVar,0),
            ("ignore_sentinel_lines",self.ignoreSentinelLinesVar,0),
            ("make_whitespace_visible", self.makeWhitespaceVisibleVar,0),
        ):
            b = c.config.getBool(option)
            if b is None: b = default
            var.set(b)
        
        if 0: # old code
            b = c.config.getBool("ignore_blank_lines")
            if b == None: b = 1 # unusual default.
            self.ignoreBlankLinesVar.set(b)
            
            b = c.config.getBool("ignore_interior_whitespace")
            if b == None: b = 0
            self.ignoreInteriorWhitespaceVar.set(b)
            
            b = c.config.getBool("ignore_leading_whitespace")
            if b == None: b = 0
            self.ignoreLeadingWhitespaceVar.set(b)
            
            b = c.config.getBool("ignore_sentinel_lines")
            if b == None: b = 0
            self.ignoreSentinelLinesVar.set(b)
            
            b = c.config.getBool("make_whitespace_visible")
            if b == None: b = 0
            self.makeWhitespaceVisibleVar.set(b)
    #@nonl
    #@-node:zorcanda!.20050409134025.4:finishCreate
    #@+node:zorcanda!.20050409135428:createTopFrame
    def createTopFrame( self ):
        
        self.frame = self.top = swing.JDialog()
        g.app.gui.addLAFListener( self.frame )
        self.top.title = "Compare files and directories"
    #@nonl
    #@-node:zorcanda!.20050409135428:createTopFrame
    #@+node:zorcanda!.20050409134025.5:createFrame
    def createFrame (self):
    
        gui = g.app.gui ; top = self.top
    
        #@    << create the organizer frames >>
        #@+node:zorcanda!.20050409134025.6:<< create the organizer frames >>
        #outer = Tk.Frame(self.frame, bd=2,relief="groove")
        #outer.pack(pady=4)
        
        sl = swing.SpringLayout()
        outer = self.top.getContentPane() #swing.JPanel()
        outer.setLayout( sl )
        #self.frame.add( outer )
        
        #row1 = Tk.Frame(outer)
        #row1.pack(pady=4)
        row1 = swing.JPanel( awt.GridLayout( 3, 4 ) )
        outer.add( row1 )
        sl.putConstraint( sl.NORTH, row1, 5, sl.NORTH, outer )
        
        
        row4 = swing.JPanel()
        outer.add( row4 )
        sl.putConstraint( sl.NORTH, row4, 5, sl.SOUTH, row1 )
        
        
        sl2 = swing.SpringLayout()
        options =  swing.JPanel( sl2 )#swing.Box.createHorizontalBox() #swing.JPanel( sl2 );
        
        outer.add( options )
        sl.putConstraint( sl.NORTH, options, 5, sl.SOUTH, row4 )
        
        #ws = Tk.Frame(options)
        #ws.pack(side="left",padx=4)
        ws = swing.JPanel()
        ws.setLayout( awt.GridLayout( 1, 1 ) )
        options.add( ws )
        sl2.putConstraint( sl2.NORTH, ws, 2, sl2.NORTH, options )
        sl2.putConstraint( sl2.WEST, ws, 5, sl2.WEST, options )
        
        pr = swing.JPanel()
        pr.setLayout( awt.GridLayout( 1, 1 ) )
        options.add( pr )
        sl2.putConstraint( sl2.NORTH, pr, 2, sl2.NORTH, options )
        sl2.putConstraint( sl2.WEST, pr, 10, sl2.EAST, ws )
        sl2.putConstraint( sl2.SOUTH, options, 5, sl2.SOUTH, pr )
        sl2.putConstraint( sl2.EAST, options, 5, sl2.EAST, pr )
        
        lower = swing.JPanel()
        outer.add( lower )
        sl.putConstraint( sl.NORTH, lower, 5, sl.SOUTH, options )
        sl.putConstraint( sl.EAST, lower, 0, sl.EAST, options )
        
        sl.putConstraint( sl.SOUTH, outer, 5, sl.SOUTH, lower )
        sl.putConstraint( sl.EAST, outer, 5, sl.EAST, row1 )
        #@-node:zorcanda!.20050409134025.6:<< create the organizer frames >>
        #@nl
        #@    << create the browser rows >>
        #@+node:zorcanda!.20050409134025.7:<< create the browser rows >>
        for row,text,text2,command,var in (
            (row1,"Compare path 1:","Ignore first line",self.onBrowse1,self.ignoreFirstLine1Var),
            (row1,"Compare path 2:","Ignore first line",self.onBrowse2,self.ignoreFirstLine2Var),
            (row1,"Output file:",   "Use output file",  self.onBrowse3,self.useOutputFileVar) ):
        
            #lab = Tk.Label(row,anchor="e",text=text,width=13)
            #lab.pack(side="left",padx=4)
            lab = swing.JLabel( text )
            row.add( lab )
            
            #e = Tk.Entry(row)
            #e.pack(side="left",padx=2)
            e = swing.JTextField( 15 )
            row.add( e )
            self.browseEntries.append(e)
            
            #b = Tk.Button(row,text="browse...",command=command)
            #b.pack(side="left",padx=6)
            b = swing.JButton( "browse..." )
            b.actionPerformed = lambda event, command = command: command()
            row.add( b )
        
            #b = Tk.Checkbutton(row,text=text2,anchor="w",variable=var,width=15)
            #b.pack(side="left")
            b = swing.JCheckBox( text2 )
            b.actionPerformed = lambda event, b=b, var=var: var.set( b.getModel().isSelected() )
            row.add( b )
        #@nonl
        #@-node:zorcanda!.20050409134025.7:<< create the browser rows >>
        #@nl
        #@    << create the extension row >>
        #@+node:zorcanda!.20050409134025.8:<< create the extension row >>
        #b = Tk.Checkbutton(row4,anchor="w",var=self.limitToExtensionVar,
        #    text="Limit directory compares to type:")
        #b.pack(side="left",padx=4)
        b = swing.JCheckBox( "Limit directory compares to type:" )
        b.actionPerformed = lambda event, b=b, var=self.limitToExtensionVar: var.set( b.getModel().isSelected() )
        row4.add( b )
        
        
        #self.extensionEntry = e = Tk.Entry(row4,width=6)
        #e.pack(side="left",padx=2)
        self.extensionEntry = e = swing.JTextField(5)
        row4.add( e )
        
        #b = Tk.Checkbutton(row4,anchor="w",var=self.appendOutputVar,
        #    text="Append output to output file")
        #b.pack(side="left",padx=4)
        
        b = swing.JCheckBox( "Append output to outputfile" )
        b.actionPerformed = lambda event, b = b, var = self.appendOutputVar: var.set( b.getModel().isSelected() )
        row4.add( b )
        #@-node:zorcanda!.20050409134025.8:<< create the extension row >>
        #@nl
        #@    << create the whitespace options frame >>
        #@+node:zorcanda!.20050409134025.9:<< create the whitespace options frame >>
        w,f = gui.create_labeled_frame(ws,caption="Whitespace options",relief="groove")
        
        
        f.setLayout( awt.GridLayout( 5, 1 ) )
          
        for text,var in (
            ("Ignore Leo sentinel lines", self.ignoreSentinelLinesVar),
            ("Ignore blank lines",        self.ignoreBlankLinesVar),
            ("Ignore leading whitespace", self.ignoreLeadingWhitespaceVar),
            ("Ignore interior whitespace",self.ignoreInteriorWhitespaceVar),
            ("Make whitespace visible",   self.makeWhitespaceVisibleVar) ):
            
            #b = Tk.Checkbutton(f,text=text,variable=var)
            #b.pack(side="top",anchor="w")
            b = swing.JCheckBox( text )
            b.actionPerformed = lambda event, b=b, var=var: var.set( b.getModel().isSelected() )
            f.add( b )
        
        
        #@-node:zorcanda!.20050409134025.9:<< create the whitespace options frame >>
        #@nl
        #@    << create the print options frame >>
        #@+node:zorcanda!.20050409134025.10:<< create the print options frame >>
        w,f = gui.create_labeled_frame(pr,caption="Print options",relief="groove")
        f.setLayout( awt.GridLayout( 5, 1 ) )
        
        #row = Tk.Frame(f)
        #row.pack(expand=1,fill="x")
        row = swing.JPanel()
        sl3 = swing.SpringLayout()
        row.setLayout( sl3 )
        f.add( row )
        pwidth = 0
        
        
        #b = Tk.Checkbutton(row,text="Stop after",variable=self.stopAfterMismatchVar)
        #b.pack(side="left",anchor="w")
        b = swing.JCheckBox( "Stop after" )
        b.actionPerformed = lambda event, var = self.stopAfterMismatchVar, b = b: var.set( b.getModel().isSelected() )
        row.add( b )
        sl3.putConstraint( sl3.NORTH, b, 1, sl3.NORTH, row )
        sl3.putConstraint( sl3.WEST, b, 1, sl3.WEST, row )
        
        #self.countEntry = e = Tk.Entry(row,width=4)
        #e.pack(side="left",padx=2)
        #e.insert(01,"1")
        self.countEntry = e = swing.JTextField(5)
        row.add( e )
        sl3.putConstraint( sl3.NORTH, e, 1, sl3.NORTH, row )
        sl3.putConstraint( sl3.WEST, e, 1, sl3.EAST, b )
        
        #lab = Tk.Label(row,text="mismatches")
        #lab.pack(side="left",padx=2)
        lab = swing.JLabel( "mismatches" )
        row.add( lab )
        sl3.putConstraint( sl3.NORTH, lab, 1, sl3.NORTH, row )
        sl3.putConstraint( sl3.WEST, lab, 1, sl3.EAST, e )
        sl3.putConstraint( sl3.SOUTH, row, 1, sl3.SOUTH, e )
        sl3.putConstraint( sl3.EAST, row, 1, sl3.EAST, lab )
        
        
        
        
        for padx,text,var in (    
            (0,  "Print matched lines",           self.printMatchesVar),
            (20, "Show both matching lines",      self.printBothMatchesVar),
            (0,  "Print mismatched lines",        self.printMismatchesVar),
            (0,  "Print unmatched trailing lines",self.printTrailingMismatchesVar) ):
            
            #b = Tk.Checkbutton(f,text=text,variable=var)
            #b.pack(side="top",anchor="w",padx=padx)
            b = swing.JCheckBox( text )
            b.actionPerformed = lambda event, b=b, var=var: var.set( b.getModel().isSelected() )
            f.add( b )
            self.printButtons.append(b)
        
        
        
        # To enable or disable the "Print both matching lines" button.
        b = self.printButtons[0]
        #b.configure(command=self.onPrintMatchedLines)
        
        #spacer = Tk.Frame(f)
        #spacer.pack(padx="1i")
        #@nonl
        #@-node:zorcanda!.20050409134025.10:<< create the print options frame >>
        #@nl
        #@    << create the compare buttons >>
        #@+node:zorcanda!.20050409134025.11:<< create the compare buttons >>
        for text,command in (
            ("Compare files",      self.onCompareFiles),
            ("Compare directories",self.onCompareDirectories) ):
            
            #b = Tk.Button(lower,text=text,command=command,width=18)
            #b.pack(side="left",padx=6)
            b = swing.JButton( text )
            b.actionPerformed = lambda event, command=command: command()
            lower.add( b )
        
        #@-node:zorcanda!.20050409134025.11:<< create the compare buttons >>
        #@nl
    
    
        top.pack()
        gui.center_dialog(top) # Do this _after_ building the dialog!
        self.finishCreate()
    #@nonl
    #@-node:zorcanda!.20050409134025.5:createFrame
    #@+node:zorcanda!.20050409134025.12:setIvarsFromWidgets
    def setIvarsFromWidgets (self):
    
        # File paths: checks for valid file name.
        e = self.browseEntries[0]
        self.fileName1 = e.getText()
        
        e = self.browseEntries[1]
        self.fileName2 = e.getText()
    
        # Ignore first line settings.
        self.ignoreFirstLine1 = self.ignoreFirstLine1Var.get()
        self.ignoreFirstLine2 = self.ignoreFirstLine2Var.get()
        
        # Output file: checks for valid file name.
        if self.useOutputFileVar.get():
            e = self.browseEntries[2]
            name = e.getText()
            if name != None and len(name) == 0:
                name = None
            self.outputFileName = name
        else:
            #self._dtm.setRowCount( 0 )
            self.outputFileName = None
    
        # Extension settings.
        if self.limitToExtensionVar.get():
            self.limitToExtension = self.extensionEntry.getText()
            if len(self.limitToExtension) == 0:
                self.limitToExtension = None
        else:
            self.limitToExtension = None
            
        self.appendOutput = self.appendOutputVar.get()
        
        # Whitespace options.
        self.ignoreBlankLines         = self.ignoreBlankLinesVar.get()
        self.ignoreInteriorWhitespace = self.ignoreInteriorWhitespaceVar.get()
        self.ignoreLeadingWhitespace  = self.ignoreLeadingWhitespaceVar.get()
        self.ignoreSentinelLines      = self.ignoreSentinelLinesVar.get()
        self.makeWhitespaceVisible    = self.makeWhitespaceVisibleVar.get()
        
        # Print options.
        self.printMatches            = self.printMatchesVar.get()
        self.printMismatches         = self.printMismatchesVar.get()
        self.printTrailingMismatches = self.printTrailingMismatchesVar.get()
        
        if self.printMatches:
            self.printBothMatches = self.printBothMatchesVar.get()
        else:
            self.printBothMatches = False
        
        if self.stopAfterMismatchVar.get():
            try:
                count = self.countEntry.get()
                self.limitCount = int(count)
            except: self.limitCount = 0
        else:
            self.limitCount = 0
    #@nonl
    #@-node:zorcanda!.20050409134025.12:setIvarsFromWidgets
    #@-node:zorcanda!.20050409134025.1:Birth...
    #@+node:zorcanda!.20050409134025.13:bringToFront
    def bringToFront(self):
        
        #self.top.deiconify()
        #self.top.lift()
        self.top.visible = 1
        self.top.toFront()
        
        
    #@nonl
    #@-node:zorcanda!.20050409134025.13:bringToFront
    #@+node:zorcanda!.20050409134025.14:browser
    def browser (self,n):
        
        types = [
            ("C/C++ files","*.c"),
            ("C/C++ files","*.cpp"),
            ("C/C++ files","*.h"),
            ("C/C++ files","*.hpp"),
            ("Java files","*.java"),
            ("Pascal files","*.pas"),
            ("Python files","*.py"),
            ("Text files","*.txt"),
            ("All files","*") ]
    
    
        import java.io as io
        f = io.File( "tmp" )
        parent = f.getParentFile()
        f = None
        
        fc = swing.JFileChooser( parent )
        fc.setDialogTitle( "Choose compare file" + n )
        
        
        haveseen = {}
        for z in types:
            if z[ 0 ] in haveseen:
                haveseen[ z[ 0 ] ].extend( z[1] )
            else:
                bf = self.brwsfilter( z )
                fc.addChoosableFileFilter( bf )
                haveseen[ z[ 0 ] ] = bf
            
        result = fc.showOpenDialog( self.top )
        if result == fc.APPROVE_OPTION:
            fileName = fc.getSelectedFile().getAbsolutePath()
        else:
            fileName = None
            
        #fileName = tkFileDialog.askopenfilename(
        #    title="Choose compare file" + n,
        #    filetypes=types,
        #    defaultextension=".txt")
            
        if fileName and len(fileName) > 0:
            # The dialog also warns about this, so this may never happen.
            if not g.os_path_exists(fileName):
                self.show("not found: " + fileName)
                fileName = None
        else: fileName = None
            
        return fileName
    #@nonl
    #@-node:zorcanda!.20050409134025.14:browser
    #@+node:zorcanda!.20050418134444:compare_directories (entry)
    # We ignore the filename portion of path1 and path2 if it exists.
    
    def compare_directories (self,path1,path2):
        
        # Ignore everything except the directory name.
        dir1 = g.os_path_dirname(path1)
        dir2 = g.os_path_dirname(path2)
        dir1 = g.os_path_normpath(dir1)
        dir2 = g.os_path_normpath(dir2)
        
        if dir1 == dir2:
            self.show("Directory names are identical.\nPlease pick distinct directories.")
            return
            
        try:
            list1 = os.listdir(dir1)
        except:
            self.show("invalid directory:" + dir1)
            return
        try:
            list2 = os.listdir(dir2)
        except:
            self.show("invalid directory:" + dir2)
            return
            
        if self.outputFileName:
            self.openOutputFile()
        ok = self.outputFileName == None or self.outputFile
        if not ok:
            return
    
        # Create files and files2, the lists of files to be compared.
        files1 = []
        files2 = []
        for f in list1:
            junk, ext = g.os_path_splitext(f)
            if self.limitToExtension:
                if ext == self.limitToExtension:
                    files1.append(f)
            else:
                files1.append(f)
        for f in list2:
            junk, ext = g.os_path_splitext(f)
            if self.limitToExtension:
                if ext == self.limitToExtension:
                    files2.append(f)
            else:
                files2.append(f)
    
        # Compare the files and set the yes, no and fail lists.
        yes = [] ; no = [] ; fail = []
        for f1 in files1:
            head,f2 = g.os_path_split(f1)
            if f2 in files2:
                try:
                    name1 = g.os_path_join(dir1,f1)
                    name2 = g.os_path_join(dir2,f2)
                    _file1 = java.io.File( name1 )
                    _file2 = java.io.File( name2 )
                    if _file1.length() == _file2.length():
                        val = self._filecmp( name1, name2 )                    
                    else:
                        val = False
                    #val = filecmp.cmp(name1,name2,0)
                    if val: yes.append(f1)
                    else:    no.append(f1)
                except:
                    self.show("exception in filecmp.cmp")
                    g.es_exception()
                    fail.append(f1)
            else:
                fail.append(f1)
        
        # Print the results.
        for kind, files in (
            ("----- matches --------",yes),
            ("----- mismatches -----",no),
            ("----- not found ------",fail)):
            self.show(kind)
            for f in files:
                self.show(f)
        
        if self.outputFile:
            self.outputFile.close()
            self.outputFile = None
    #@nonl
    #@-node:zorcanda!.20050418134444:compare_directories (entry)
    #@+node:zorcanda!.20050418134726:filecmp
    def filecmp (self,f1,f2):
    
        #val = filecmp.cmp(f1,f2)
        val = self._filecmp( f1, f2 )
        if 1:
            if val: self.show("equal")
            else:   self.show("*** not equal")
        else:
            self.show("filecmp.cmp returns:")
            if val: self.show(str(val)+ " (equal)")
            else:   self.show(str(val) + " (not equal)")
        return val
        
        
    def _filecmp( self, f1, f2 ):
        
        _file1 = java.io.File( f1 )
        _file2 = java.io.File( f2 )
        _fc1 = java.io.FileInputStream( _file1 ).getChannel()
        _fc2 = java.io.FileInputStream( _file2 ).getChannel()
        _bb1 = java.nio.ByteBuffer.allocateDirect( _fi1e1.length() )
        _bb2 = java.nio.ByteBuffer.allocateDirect( _file2.length() )
        _fc1.read( _bb1 )
        _fc2.read( _bb2 )
        _fc1.close(); _fc2.close()
        _bb1.position( 0 ); _bb2.position( 0 )
        c_result = _bb1.compareTo( _bb2 )
        if c_result == 0:
            val = True
        else:
            val = False
            
        return val
    #@nonl
    #@-node:zorcanda!.20050418134726:filecmp
    #@+node:zorcanda!.20050409174935:class brwsfilter
    import javax.swing.filechooser as ff
    class brwsfilter( ff.FileFilter ):
            
        def __init__( self, items ):
            self.items = items
            self.filters = []
            self.extend( items[ 1 ] )
                
        def accept( self, fvar ):
            name = fvar.getName()
            for ending in self.filters:
                if name.endswith( ending ): return True
                
            return False
            
        def extend( self, item ):
            self.filters.append( item.strip( '*' ) )
               
        def getDescription( self ):
            return self.items[ 0 ]
    #@nonl
    #@-node:zorcanda!.20050409174935:class brwsfilter
    #@+node:zorcanda!.20050409134025.15:Event handlers...
    #@+node:zorcanda!.20050409134025.16:onBrowse...
    def onBrowse1 (self):
        
        fileName = self.browser("1")
        if fileName:
            e = self.browseEntries[0]
            e.setText( fileName )
            #e.delete(0,"end")
            #e.insert(0,fileName)
        #self.top.deiconify()
        
    def onBrowse2 (self):
        
        fileName = self.browser("2")
        if fileName:
            e = self.browseEntries[1]
            e.setText( fileName )
            #e.delete(0,"end")
            #e.insert(0,fileName)
        #self.top.deiconify()
        
    def onBrowse3 (self): # Get the name of the output file.
    
        #fileName = tkFileDialog.asksaveasfilename(
        #    initialfile = self.defaultOutputFileName,
        #    title="Set output file",
        #    filetypes=[("Text files", "*.txt")],
        #    defaultextension=".txt")
        import java.io as io
        f = io.File( "tmp" )
        parent = f.getParentFile()
        f = None
        
        fc = swing.JFileChooser( parent )
        result = fc.showSaveDialog( self.top )
        if result == fc.APPROVE_OPTION:
            fileName = fc.getSelectedFile().getAbsolutePath()
        else:
            fileName = None
        
            
        if fileName and len(fileName) > 0:
            self.defaultOutputFileName = fileName
            self.useOutputFileVar.set(1) # The user will expect this.
            e = self.browseEntries[2]
            e.setText( fileName )
            #e.delete(0,"end")
            #e.insert(0,fileName)
    #@nonl
    #@-node:zorcanda!.20050409134025.16:onBrowse...
    #@+node:zorcanda!.20050409134025.17:onClose
    def onClose (self):
        
        self.top.withdraw()
    #@nonl
    #@-node:zorcanda!.20050409134025.17:onClose
    #@+node:zorcanda!.20050409134025.18:onCompare...
    def onCompareDirectories (self):
    
        self.setIvarsFromWidgets()
        self._dtm.setRowCount( 0 )
        self.compare_directories(self.fileName1,self.fileName2)
        if self._dtm.getRowCount() > 0:
            self.showMismatchTable()
    
    def onCompareFiles (self):
    
        self.setIvarsFromWidgets()
        self._dtm.setRowCount( 0 )
        self.compare_files(self.fileName1,self.fileName2)
        if self._dtm.getRowCount() > 0:
            self.showMismatchTable()
    #@nonl
    #@-node:zorcanda!.20050409134025.18:onCompare...
    #@+node:zorcanda!.20050409134025.19:onPrintMatchedLines
    def onPrintMatchedLines (self):
        
        v = self.printMatchesVar.get()
        b = self.printButtons[1]
        state = g.choose(v,"normal","disabled")
        b.configure(state=state)
    #@nonl
    #@-node:zorcanda!.20050409134025.19:onPrintMatchedLines
    #@-node:zorcanda!.20050409134025.15:Event handlers...
    #@+node:zorcanda!.20050410084633:utils
    #@+node:zorcanda!.20050410084633.1:show
    def show (self,s):
        
        # print s
        if self.outputFile:
            self.outputFile.write(s + '\n')
        elif self.c:
            #g.es(s)
            self._dtm.addRow( [ self._dtm.getRowCount() + 1 ,s ] )
        else:
            print s
            print
    #@nonl
    #@-node:zorcanda!.20050410084633.1:show
    #@+node:zorcanda!.20050410085508:showMismatchTable
    def showMismatchTable( self ):
        
        jf = swing.JFrame()
        
        jf.setDefaultCloseOperation( jf.DISPOSE_ON_CLOSE )
        cp = jf.getContentPane()
        cp.setLayout( awt.BorderLayout() )
        jt = swing.JTable( self._dtm )
        jt.setAutoResizeMode( jt.AUTO_RESIZE_ALL_COLUMNS )
        drend = self._dftcr()
        jt.setDefaultRenderer( java.lang.Object, drend )
        count = self._dtm.getRowCount()
        tmp_label = swing.JLabel( java.lang.String.valueOf( count ) )
        psize = tmp_label.getPreferredSize()
        column = jt.getColumn( "" )
        column.setPreferredWidth( psize.width + 10 )
        column.setMaxWidth( psize.width + 10 )
        sp = swing.JScrollPane( jt )
        sp.addComponentListener( drend )
        cp.add( sp, awt.BorderLayout.CENTER )
        jb = swing.JButton( "Close" )
        jb.actionPerformed = lambda event: jf.dispose()
        cp.add( jb, awt.BorderLayout.SOUTH )
        jf.pack()
        g.app.gui.center_dialog( jf )
        jf.visible = 1
        
    class _dftcr( stable.DefaultTableCellRenderer, aevent.ComponentListener ):
        
        def __init__( self ):
            stable.DefaultTableCellRenderer.__init__( self )
            self._component = swing.JTextArea()
            self._component.setLineWrap( True )
            self._label = swing.JTextField()
            self._label.setMargin( awt.Insets( 0, 0, 0, 0 ) )
            
            
        def getTableCellRendererComponent( self, table, value,isSelected, hasFocus, row, column):
        
            if column == 1:
                vrect = table.getVisibleRect()
                self._component.setText( value )
                size = self._component.getSize()
                size.width = vrect.width
                self._component.setSize( size )
                if isSelected:
                    self._component.setForeground( table.getSelectionForeground() )
                    self._component.setBackground( table.getSelectionBackground() )
                else:
                    self._component.setForeground( table.getForeground()) 
                    self._component.setBackground( table.getBackground() )
                
                table.setRowHeight( row, self._component.getPreferredSize().height )
                return self._component
            else:
                
                row = java.lang.String.valueOf( row + 1 )
                self._label.setText( row )
                if isSelected:
                    self._label.setForeground( table.getSelectionForeground() )
                    self._label.setBackground( table.getSelectionBackground() )
                else:
                    self._label.setForeground( table.getForeground()) 
                    self._label.setBackground( table.getBackground() ) 
                return self._label
            
        def componentHidden( self, event ):
            pass
            
        def componentMoved( self, event ):
            pass
            
        def componentResized( self, event ):
            
            pass
            #source = event.getSource()
            #vrect = source.getVisibleRect()
            #model = source.getModel()
            #csize = self._component.getSize()
            #csize.width = vrect.width
            #print self._component.getPreferredSize()
            #print self._component.getSize()
            #for z in xrange( model.getRowCount() ):
            #    value = model.getValueAt( z, 0 )
            #    self._component.setText( value )
            #    print self._component.getPreferredSize()
            #    print self._component.getSize()
            #    source.setRowHeight( z, self._component.getPreferredSize().height )
                
                
            
            
        def componentShown( self, event ):
        
            event.getSource().repaint()
    #@nonl
    #@-node:zorcanda!.20050410085508:showMismatchTable
    #@-node:zorcanda!.20050410084633:utils
    #@-others
#@nonl
#@-node:zorcanda!.20050409134025:@thin leoSwingComparePanel.py
#@-leo
