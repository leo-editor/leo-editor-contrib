<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo (http://webpages.charter.net/edreamleo/front.html) -->
<?xml-stylesheet ekr_test?>
<leo_file xmlns:leo="http://www.leo-editor.org/2011/leo" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20110601212241.1422"><vh>Old Tk code</vh>
<v t="ekr.20110601212241.1431"><vh>From Leo's core</vh>
<v t="ekr.20110601212241.1432"><vh>app.createTkGui</vh></v>
<v t="ekr.20110601212241.1433"><vh>g.createStandAloneTkApp</vh></v>
<v t="ekr.20110601212241.1434"><vh>cantImportDialog &amp; helpers</vh>
<v t="ekr.20110601212241.1435"><vh>createDialogFrame</vh></v>
<v t="ekr.20110601212241.1436"><vh>createDialogButtons</vh></v>
<v t="ekr.20110601212241.1437"><vh>center</vh></v>
<v t="ekr.20110601212241.1438"><vh>get_window_info</vh></v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20110601212241.1422"></t>
<t tx="ekr.20110601212241.1431"></t>
<t tx="ekr.20110601212241.1432">def createTkGui (self,fileName='',verbose=False):

    """A convenience routines for plugins to 
    create the default Tk gui class."""

    app = self

    try:
        import tkinter as Tk
    except ImportError:
        try:
            import Tkinter as Tk
        except ImportError:
            Tk = None

    Pmw = g.importExtension('Pmw',pluginName='startup',verbose=False)

    if Tk and Pmw:
        app.pluginsController.loadOnePlugin('leo.plugins.tkGui',verbose=verbose)
        if app.gui and fileName and verbose:
            print('tkGui created in %s' % fileName)
</t>
<t tx="ekr.20110601212241.1433"># This must be defined in leoGlobals: g.app.gui doesn't exist yet.

# This was used by the old plugins manager.

def createStandAloneTkApp(pluginName=''):

    '''Create a Tk version of the g.app object for 'stand-alone' plugins.'''

    if not g.app:
        # Important: these references do not make Leo's core gui-dependent.
        # In other words, this function is called only when Tkinter should be the gui.
        import Tkinter as Tk
        Pmw = g.importExtension('Pmw',pluginName=pluginName,verbose=True)
        if Tk and Pmw:
            import leo.core.leoApp as leoApp
            import leo.core.leoGui as leoGui
            g.app = leoApp.LeoApp()
            g.app.root = Tk.Tk()
            Pmw.initialise(g.app.root)
            g.app.gui = leoGui.nullGui('&lt;stand-alone app gui&gt;')
            g.computeStandardDirectories()
    return g.app
</t>
<t tx="ekr.20110601212241.1434">def cantImportDialog (pluginName,moduleName):

    '''Attempt to show a Tk dialog if an import fails.
    Yes, this is a small Tk dependency, but it can't be helped.'''

    message = '''
%s requires the %s module.
Official distributions contain this module in Leo's extensions folder,
but this module may be missing if you get Leo from cvs.
''' % (pluginName,moduleName)

    if g.app.killed:
        return

    if g.app.unitTesting:
        g.pr('g.importExtension: can not import %s' % moduleName)
        return

    # Requires minimal further imports.
    try:
        import Tkinter as Tk
        root = g.app.root or Tk.Tk()
        title = 'Can not import %s' % moduleName
        top = createDialogFrame(Tk,root,title,message)
        root.wait_window(top)
    except ImportError:
        g.pr('Can not import %s' % moduleName)
        g.pr('Can not import Tkinter')
        g.pr('Leo must now exit')
        g.pr(g.callers())
</t>
<t tx="ekr.20110601212241.1435">def createDialogFrame(Tk,root,title,message):

    """Create the Tk.Toplevel widget for a leoTkinterDialog."""

    top = Tk.Toplevel(root)
    top.title(title)

    def onKey(event,top=top):
        if event.char.lower() in ('\n','\r'):
            top.destroy()
    top.bind("&lt;Key&gt;",onKey)

    f = Tk.Frame(top)
    f.pack(side="top",expand=1,fill="both")

    label = Tk.Label(f,text=message)
    label.pack(pady=10)

    def okButton(top=top):
        top.destroy()

    buttons = {"text":'OK',"command":okButton,"default":True}, # Singleton tuple.
    createDialogButtons(Tk,top,buttons)

    center(top)
    top.lift()
    top.focus_force()

    if not g.app.unitTesting: # Attach the icon at idle time.
        def attachIconCallback(top=top):
            g.app.gui.attachLeoIcon(top)
        top.after_idle(attachIconCallback)

    return top
</t>
<t tx="ekr.20110601212241.1436">def createDialogButtons (Tk,top,buttons):

    """Create a row of buttons.

    buttons is a list of dictionaries containing the properties of each button."""

    f = Tk.Frame(top)
    f.pack(side="top",padx=30)

    for d in buttons:
        text = d.get("text","&lt;missing button name&gt;")
        isDefault = d.get("default",False)
        underline = d.get("underline",0)
        command = d.get("command",None)
        bd = g.choose(isDefault,4,2)

        b = Tk.Button(f,width=6,text=text,bd=bd,underline=underline,command=command)
        b.pack(side="left",padx=5,pady=10)
</t>
<t tx="ekr.20110601212241.1437">def center(top):

    """Center the dialog on the screen.

    WARNING: Call this routine _after_ creating a dialog.
    (This routine inhibits the grid and pack geometry managers.)"""

    sw = top.winfo_screenwidth()
    sh = top.winfo_screenheight()
    w,h,x,y = g.get_window_info(top)

    # Set the new window coordinates, leaving w and h unchanged.
    x = (sw - w)/2
    y = (sh - h)/2
    top.geometry("%dx%d%+d%+d" % (w,h,x,y))

    return w,h,x,y
</t>
<t tx="ekr.20110601212241.1438"># WARNING: Call this routine _after_ creating a dialog.
# (This routine inhibits the grid and pack geometry managers.)

def get_window_info (top):

    # This is an emergency measure: this call is NOT a major Tk-dependency.
    top.update_idletasks() # Required to get proper info.

    # Get the information about top and the screen.
    geom = top.geometry() # geom = "WidthxHeight+XOffset+YOffset"
    dim,x,y = geom.split('+')
    w,h = dim.split('x')
    w,h,x,y = int(w),int(h),int(x),int(y)

    return w,h,x,y
</t>
</tnodes>
</leo_file>
