#@+leo-ver=4-thin
#@+node:ekr.20031218072017.3822:@thin leoTkinterColorPanels.py
#@@language python
#@@tabwidth -4
#@@pagewidth 80

import leoGlobals as g
import leoColorPanel

import Tkinter as Tk
import tkColorChooser

#@<< define gui-dependent color panel data >>
#@+node:ekr.20031218072017.3823:<< define gui-dependent color panel data >>
colorNamesList = (
    "gray60", "gray70", "gray80", "gray85", "gray90", "gray95",
    "snow1", "snow2", "snow3", "snow4", "seashell1", "seashell2",
    "seashell3", "seashell4", "AntiqueWhite1", "AntiqueWhite2", "AntiqueWhite3",
    "AntiqueWhite4", "bisque1", "bisque2", "bisque3", "bisque4", "PeachPuff1",
    "PeachPuff2", "PeachPuff3", "PeachPuff4", "NavajoWhite1", "NavajoWhite2",
    "NavajoWhite3", "NavajoWhite4", "LemonChiffon1", "LemonChiffon2",
    "LemonChiffon3", "LemonChiffon4", "cornsilk1", "cornsilk2", "cornsilk3",
    "cornsilk4", "ivory1", "ivory2", "ivory3", "ivory4", "honeydew1", "honeydew2",
    "honeydew3", "honeydew4", "LavenderBlush1", "LavenderBlush2",
    "LavenderBlush3", "LavenderBlush4", "MistyRose1", "MistyRose2",
    "MistyRose3", "MistyRose4", "azure1", "azure2", "azure3", "azure4",
    "SlateBlue1", "SlateBlue2", "SlateBlue3", "SlateBlue4", "RoyalBlue1",
    "RoyalBlue2", "RoyalBlue3", "RoyalBlue4", "blue1", "blue2", "blue3", "blue4",
    "DodgerBlue1", "DodgerBlue2", "DodgerBlue3", "DodgerBlue4", "SteelBlue1",
    "SteelBlue2", "SteelBlue3", "SteelBlue4", "DeepSkyBlue1", "DeepSkyBlue2",
    "DeepSkyBlue3", "DeepSkyBlue4", "SkyBlue1", "SkyBlue2", "SkyBlue3",
    "SkyBlue4", "LightSkyBlue1", "LightSkyBlue2", "LightSkyBlue3",
    "LightSkyBlue4", "SlateGray1", "SlateGray2", "SlateGray3", "SlateGray4",
    "LightSteelBlue1", "LightSteelBlue2", "LightSteelBlue3",
    "LightSteelBlue4", "LightBlue1", "LightBlue2", "LightBlue3",
    "LightBlue4", "LightCyan1", "LightCyan2", "LightCyan3", "LightCyan4",
    "PaleTurquoise1", "PaleTurquoise2", "PaleTurquoise3", "PaleTurquoise4",
    "CadetBlue1", "CadetBlue2", "CadetBlue3", "CadetBlue4", "turquoise1",
    "turquoise2", "turquoise3", "turquoise4", "cyan1", "cyan2", "cyan3", "cyan4",
    "DarkSlateGray1", "DarkSlateGray2", "DarkSlateGray3",
    "DarkSlateGray4", "aquamarine1", "aquamarine2", "aquamarine3",
    "aquamarine4", "DarkSeaGreen1", "DarkSeaGreen2", "DarkSeaGreen3",
    "DarkSeaGreen4", "SeaGreen1", "SeaGreen2", "SeaGreen3", "SeaGreen4",
    "PaleGreen1", "PaleGreen2", "PaleGreen3", "PaleGreen4", "SpringGreen1",
    "SpringGreen2", "SpringGreen3", "SpringGreen4", "green1", "green2",
    "green3", "green4", "chartreuse1", "chartreuse2", "chartreuse3",
    "chartreuse4", "OliveDrab1", "OliveDrab2", "OliveDrab3", "OliveDrab4",
    "DarkOliveGreen1", "DarkOliveGreen2", "DarkOliveGreen3",
    "DarkOliveGreen4", "khaki1", "khaki2", "khaki3", "khaki4",
    "LightGoldenrod1", "LightGoldenrod2", "LightGoldenrod3",
    "LightGoldenrod4", "LightYellow1", "LightYellow2", "LightYellow3",
    "LightYellow4", "yellow1", "yellow2", "yellow3", "yellow4", "gold1", "gold2",
    "gold3", "gold4", "goldenrod1", "goldenrod2", "goldenrod3", "goldenrod4",
    "DarkGoldenrod1", "DarkGoldenrod2", "DarkGoldenrod3", "DarkGoldenrod4",
    "RosyBrown1", "RosyBrown2", "RosyBrown3", "RosyBrown4", "IndianRed1",
    "IndianRed2", "IndianRed3", "IndianRed4", "sienna1", "sienna2", "sienna3",
    "sienna4", "burlywood1", "burlywood2", "burlywood3", "burlywood4", "wheat1",
    "wheat2", "wheat3", "wheat4", "tan1", "tan2", "tan3", "tan4", "chocolate1",
    "chocolate2", "chocolate3", "chocolate4", "firebrick1", "firebrick2",
    "firebrick3", "firebrick4", "brown1", "brown2", "brown3", "brown4", "salmon1",
    "salmon2", "salmon3", "salmon4", "LightSalmon1", "LightSalmon2",
    "LightSalmon3", "LightSalmon4", "orange1", "orange2", "orange3", "orange4",
    "DarkOrange1", "DarkOrange2", "DarkOrange3", "DarkOrange4", "coral1",
    "coral2", "coral3", "coral4", "tomato1", "tomato2", "tomato3", "tomato4",
    "OrangeRed1", "OrangeRed2", "OrangeRed3", "OrangeRed4", "red1", "red2", "red3",
    "red4", "DeepPink1", "DeepPink2", "DeepPink3", "DeepPink4", "HotPink1",
    "HotPink2", "HotPink3", "HotPink4", "pink1", "pink2", "pink3", "pink4",
    "LightPink1", "LightPink2", "LightPink3", "LightPink4", "PaleVioletRed1",
    "PaleVioletRed2", "PaleVioletRed3", "PaleVioletRed4", "maroon1",
    "maroon2", "maroon3", "maroon4", "VioletRed1", "VioletRed2", "VioletRed3",
    "VioletRed4", "magenta1", "magenta2", "magenta3", "magenta4", "orchid1",
    "orchid2", "orchid3", "orchid4", "plum1", "plum2", "plum3", "plum4",
    "MediumOrchid1", "MediumOrchid2", "MediumOrchid3", "MediumOrchid4",
    "DarkOrchid1", "DarkOrchid2", "DarkOrchid3", "DarkOrchid4", "purple1",
    "purple2", "purple3", "purple4", "MediumPurple1", "MediumPurple2",
    "MediumPurple3", "MediumPurple4", "thistle1", "thistle2", "thistle3",
    "thistle4" )
#@-node:ekr.20031218072017.3823:<< define gui-dependent color panel data >>
#@nl

#@+others
#@+node:ekr.20031218072017.3824:class leoTkinterColorNamePanel
class leoTkinterColorNamePanel:
    
    """A class to create and run a Tkinter color name panel."""
    
    #@    @+others
    #@+node:ekr.20031218072017.3825:namePanel.__init__
    def __init__ (self,colorPanel,name,color):
        
        # No need for a base class.
        self.colorPanel = colorPanel
        self.name = name
        self.color = color
        self.revertColor = color
        
        self.createFrame(name,color)
    #@nonl
    #@-node:ekr.20031218072017.3825:namePanel.__init__
    #@+node:ekr.20031218072017.3826:getSelection
    def getSelection (self):
    
        box = self.box ; color = None
        
        # Get the family name if possible, or font otherwise.
        items = box.curselection()
    
        if len(items)> 0:
            try: # This shouldn't fail now.
                items = map(int, items)
                color = box.get(items[0])
            except:
                g.es("unexpected exception")
                g.es_exception()
    
        if not color:
            color = self.color
        return color
    #@nonl
    #@-node:ekr.20031218072017.3826:getSelection
    #@+node:ekr.20031218072017.3827:createFrame
    def createFrame (self,name,color):
        
        assert(name==self.name)
        assert(color==self.color)
        self.revertColor = color
        
        gui = g.app.gui
    
        self.top = top = Tk.Toplevel(g.app.root)
        top.title("Color names for " + '"' + name + '"')
        top.protocol("WM_DELETE_WINDOW", self.onOk)
    
        #@    << create color name panel >>
        #@+node:ekr.20031218072017.3828:<< create color name panel >>
        # Create organizer frames
        outer = Tk.Frame(top,bd=2,relief="groove")
        outer.pack(fill="both",expand=1)
        
        upper = Tk.Frame(outer)
        upper.pack(fill="both",expand=1)
        
        # A kludge to give vertical space to the listbox!
        spacer = Tk.Frame(upper) 
        spacer.pack(side="right",pady="2i") 
        
        lower = Tk.Frame(outer)
        # padx=20 gives more room to the Listbox!
        lower.pack(padx=40) # Not expanding centers the buttons.
        
        # Create and populate the listbox.
        self.box = box = Tk.Listbox(upper) # height doesn't seem to work.
        box.bind("<Double-Button-1>", self.onApply)
        
        if color not in colorNamesList:
            box.insert(0,color)
            
        names = list(colorNamesList) # It's actually a tuple.
        names.sort()
        for name in names:
            box.insert("end",name)
        
        bar = Tk.Scrollbar(box)
        bar.pack(side="right", fill="y")
        box.pack(padx=2,pady=2,expand=1,fill="both")
        
        bar.config(command=box.yview)
        box.config(yscrollcommand=bar.set)
            
        # Create the row of buttons.
        for text,command in (
            ("OK",self.onOk),
            ("Cancel",self.onCancel),
            ("Revert",self.onRevert),
            ("Apply",self.onApply) ):
                
            b = Tk.Button(lower,text=text,command=command)
            b.pack(side="left",pady=6,padx=4)
        #@nonl
        #@-node:ekr.20031218072017.3828:<< create color name panel >>
        #@nl
        self.select(color)
        
        gui.center_dialog(top) # Do this _after_ building the dialog!
        # top.resizable(0,0)
        
        # This must be a modal dialog.
        top.grab_set()
        top.focus_set() # Get all keystrokes.
    #@nonl
    #@-node:ekr.20031218072017.3827:createFrame
    #@+node:ekr.20031218072017.3829:onOk, onCancel, onRevert, OnApply
    def onApply (self,event=None):
        self.color = color = self.getSelection()
        self.colorPanel.update(self.name,color)
    
    def onOk (self):
        color = self.getSelection()
        self.colorPanel.update(self.name,color)
        self.top.destroy()
        
    def onCancel (self):
        self.onRevert()
        self.top.destroy()
        
    def onRevert (self):
        self.color = color = self.revertColor
        self.select(self.color)
        self.colorPanel.update(self.name,color)
    #@nonl
    #@-node:ekr.20031218072017.3829:onOk, onCancel, onRevert, OnApply
    #@+node:ekr.20031218072017.3830:select
    def select (self,color):
    
        # g.trace(color)
    
        # The name should be on the list!
        box = self.box
        for i in xrange(0,box.size()):
            item = box.get(i)
            if color == item:
                box.select_clear(0,"end")
                box.select_set(i)
                box.see(i)
                return
    
        # g.trace("not found:",color)
    #@nonl
    #@-node:ekr.20031218072017.3830:select
    #@-others
#@-node:ekr.20031218072017.3824:class leoTkinterColorNamePanel
#@+node:ekr.20031218072017.3831:class leoTkinterColorPanel
class leoTkinterColorPanel (leoColorPanel.leoColorPanel):
    
    """A class to create and run a Tkinter color panel."""

    #@    @+others
    #@+node:ekr.20031218072017.3832:colorPanel.__init__
    def __init__ (self,c):
        
        """Create a tkinter color panel."""
        
        # Init the base class
        leoColorPanel.leoColorPanel.__init__(self,c)
        
        # For communication with callbacks.
        self.changed_options = []
        self.buttons = {}
        self.nameButtons = {}
        self.option_names = {}
    
        self.createFrame()
    #@nonl
    #@-node:ekr.20031218072017.3832:colorPanel.__init__
    #@+node:ekr.20031218072017.3833:bringToFront
    def bringToFront(self):
        
        self.top.deiconify()
        self.top.lift()
    #@-node:ekr.20031218072017.3833:bringToFront
    #@+node:ekr.20031218072017.1875:createFrame (color panel)
    def createFrame (self):
        
        c = self.c ; gui = g.app.gui
        self.top = top = Tk.Toplevel(g.app.root)
        top.title("Syntax colors for " + c.frame.shortFileName()) # DS, 10/28/03
        top.protocol("WM_DELETE_WINDOW", self.onOk)
        gui.attachLeoIcon(top)
    
        #@    << create color panel >>
        #@+node:ekr.20031218072017.1876:<< create color panel >>
        outer = Tk.Frame(top,bd=2,relief="groove")
        outer.pack(anchor="n",pady=2,ipady=1,expand=1,fill="x")
        
        # Create all the rows.
        for name,option_name,default_color in self.colorPanelData:
            # Get the color.
            option_color = c.config.getColor(option_name)
            color = g.choose(option_color,option_color,default_color)
            # Create the row.
            f = Tk.Frame(outer,bd=2)
            f.pack()
            
            lab=Tk.Label(f,text=name,width=17,anchor="e")
        
            b1 = Tk.Button(f,text="",state="disabled",bg=color,width=4)
            self.buttons[name]=b1 # For callback.
            self.option_names[name]=option_name # For callback.
            
            b2 = Tk.Button(f,width=12,text=option_color)
            self.nameButtons[name]=b2
            
            # 9/15/02: Added self=self to remove Python 2.1 warning.
            callback = lambda name=name,self=self:self.showColorPicker(name)
            b3 = Tk.Button(f,text="Color Picker...",command=callback)
        
            # 9/15/02: Added self=self to remove Python 2.1 warning.
            callback = lambda name=name,color=color,self=self:self.showColorName(name,color)
            b4 = Tk.Button(f,text="Color Name...",command=callback)
        
            lab.pack(side="left",padx=3)
            b1.pack (side="left",padx=3)
            b2.pack (side="left",padx=3)
            b3.pack (side="left",padx=3)
            b4.pack (side="left",padx=3)
            
        # Create the Ok, Cancel & Revert buttons
        f = Tk.Frame(outer,bd=2)
        f.pack()
        b = Tk.Button(f,width=6,text="OK",command=self.onOk)
        b.pack(side="left",padx=4)
        b = Tk.Button(f,width=6,text="Cancel",command=self.onCancel)
        b.pack(side="left",padx=4,expand=1,fill="x")
        b = Tk.Button(f,width=6,text="Revert",command=self.onRevert)
        b.pack(side="right",padx=4)
        #@nonl
        #@-node:ekr.20031218072017.1876:<< create color panel >>
        #@nl
    
        gui.center_dialog(top) # Do this _after_ building the dialog!
        top.resizable(0,0)
    #@nonl
    #@-node:ekr.20031218072017.1875:createFrame (color panel)
    #@+node:ekr.20031218072017.3834:showColorPicker
    def showColorPicker (self,name):
        
        c = self.c
        option_name = self.option_names[name]
        color = c.config.getColor(option_name)
        rgb,val = tkColorChooser.askcolor(color=color)
        if val != None:
            self.update(name,val)
    #@nonl
    #@-node:ekr.20031218072017.3834:showColorPicker
    #@+node:ekr.20031218072017.3835:showColorName
    def showColorName (self,name,color):
        
        """Bring up a tkinter color name panel."""
        
        # No need to use an app gui routine: this is all Tk code.
        leoTkinterColorNamePanel(self,name,color)
    #@nonl
    #@-node:ekr.20031218072017.3835:showColorName
    #@+node:ekr.20031218072017.3836:colorPanel.onOk, onCancel, onRevert
    def onOk (self):
        # Update the revert colors
        for name in self.changed_options:
            option_name = self.option_names[name]
            self.revertColors[option_name] = self.c.config.getColor(option_name)
        self.changed_options = []
        if 1: # Hide the window, preserving its position.
            self.top.withdraw()
        else: # works.
            self.c.frame.colorPanel = None
            self.top.destroy()
        
    def onCancel (self):
        self.onRevert()
        if 1: # Hide the window, preserving its position.
            self.top.withdraw()
        else: # works.
            self.c.frame.colorPanel = None
            self.top.destroy()
        
    def onRevert (self):
        c = self.c
        for name in self.changed_options:
            option_name = self.option_names[name]
            old_val = self.revertColors[option_name]
            # Update the current settings.
            c.config.setString(option_name,old_val)
            # Update the buttons.
            b = self.buttons[name]
            b.configure(bg=old_val)
            b = self.nameButtons[name]
            b.configure(text=str(old_val))
        self.changed_options = []
        self.c.recolor()
    #@nonl
    #@-node:ekr.20031218072017.3836:colorPanel.onOk, onCancel, onRevert
    #@+node:ekr.20031218072017.3837:update
    def update (self,name,val):
        
        c = self.c
        # g.es(str(name) + " = " + str(val))
        
        # Put the new color in the button.
        b = self.buttons[name]
        b.configure(bg=val)
        option_name = self.option_names[name]
        
        # Put the new color name or value in the name button.
        b = self.nameButtons[name]
        if type(val) == "" or type(val) == u"":
            b.configure(text=val) # Prevents unwanted quotes in the name.
        else:
            b.configure(text=str(val))
        
        # Save the changed option names for revert and cancel.
        if name not in self.changed_options:
            self.changed_options.append(name)
    
        # Set the new value and recolor.
        c.config.setString(option_name,val)
        self.c.recolor()
    #@nonl
    #@-node:ekr.20031218072017.3837:update
    #@-others
#@nonl
#@-node:ekr.20031218072017.3831:class leoTkinterColorPanel
#@-others
#@nonl
#@-node:ekr.20031218072017.3822:@thin leoTkinterColorPanels.py
#@-leo
