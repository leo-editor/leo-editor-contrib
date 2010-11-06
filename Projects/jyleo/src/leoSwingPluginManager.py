#@+leo-ver=4-thin
#@+node:pap.20041006184225:@thin leoSwingPluginManager.py
"""
A plugin to manage Leo's Plugins:

- Enables and disables plugins.
- Shows plugin details.
- Checks for conflicting hook handlers.
- Checks for and updates plugins from the web.
"""

__version__ = "0.14"
__plugin_name__ = "Plugin Manager"
__plugin_priority__ = 10000
__plugin_requires__ = ["plugin_menu"]
__plugin_group__ = "Core"

#@<< version history >>
#@+node:pap.20041006184225.2:<< version history >>
#@+at
# 
# 0.1 Paul Paterson:
#     - Initial version
# 
# 0.2 EKR:
#     - The check for .ini files looks for the actual x.ini file.
#       (This required that spellpyx uses spellpyx.ini rather than 
# mod_spelling.ini.)
#     - Minor stylistic changes.
# 0.4 EKR:
#     - Added USE_PRIORITY switch.
#       Priority is non-functional, and isn't needed.
#       Leo loads plugins in the order in which they appear in 
# pluginsManager.txt.
#       Furthermore, this plugin preserves that order.
# 0.5 EKR:
#     - Make sure to do nothing if Pmw is not defined.
# 0.6 Paul Paterson:
#     - Fixed incorrect detection of version if single quotes used
#     - Now always detects a file as a plugin (previously only did this if it 
# imported leoPlugins)
#     - Fixed incorrect detection of handlers if single quotes used
#     - Fixed incorrect detection of multiple handlers in a single line.
# 0.7 EKR:
#     - Grrrrrrrrrr.  The Sets module is not defined in Python 2.2.
#       This must be replaced.  This is too important a plugin for it not to 
# work everywhere.
#     - Added better import tests, and message when import fails.
#     - Added an init method, although a simple raise would also work.
# 0.8 EKR:
#     - Well, that was easy.  Put sets.py from Python 2.4 in extensions 
# folder.
#     - Use g.importExtension rather than import to get sets module.
# 0.9 Paul Paterson:
#     - Remove the "not referenced" status. All plugins are not active or 
# inactive.
#     - Changed the list view to have the status at the end of the line
#     - Changed format of list view to be fixed font so that it looks cleaner
#     - Also changed format of conflict list view
#     - If a file contains "__not_a_plugin__ = True" then it will be omitted 
# from the list
#     - Now looks for and reports the __plugin_group__ in the view and list
#     - Can now filter the plugins by their __plugin__group__
#     - Set __plugin_group__ to "Core"
#     - Renamed active/inactive to on/off as this works better with the groups
#     - Added version history display to plugin view
# 0.10 Paul Paterson:
#     - Changed the names in the plugin list view to remove at_, mod_ and 
# capitalized
#     - Remove dblClick event from plugin list - it wasn't doing anything
#     - Can now be run stand-alone to aid in debugging problems
# 0.11 EKR:
#     - Use stand-alone leoGlobals module to simplify code.
# 0.12 EKR:
#     - Folded in some minor changes from Paul to support AutoTrees plugin.
# 0.13 Paul Paterson
#     - Fixed path in installPlugin that ignore the local_paths setting
#     - Generalized code to support LeoUpdate plugin.
# 0.14 EKR:
#     - Several methods now return if get.keywords('c') is None.
#       This may fix some startup bugs, or not.
#@-at
#@nonl
#@-node:pap.20041006184225.2:<< version history >>
#@nl
#@<< define importLeoGlobals >>
#@+node:ekr.20050329035844:<< define importLeoGlobals >>
def importLeoGlobals():
    
    '''
    Try to import leoGlobals from the leo/src directory, assuming that
    the script using this function is in a subdirectory of the leo directory.
    '''
    
    plugins_path = os.path.abspath(
        os.path.join(os.path.dirname(__file__),'..','src'))
    
    if plugins_path in sys.path:
        return None
    else:
        sys.path.append(plugins_path)
        try:
            import leoGlobals as g
            return g
        except ImportError:
            print 'can not import leoGlobals from %s' % (plugins_path)
            return None
#@nonl
#@-node:ekr.20050329035844:<< define importLeoGlobals >>
#@nl
#@<< imports >>
#@+node:pap.20041006184225.3:<< imports >>
#
# If these don't import then your Python install is hosed anyway so we don't
# protect the import statements
import fnmatch
import os
import re
import sha
import sys
import urllib
import threading
import traceback

try:
    import leoGlobals as g
    standalone = False
except ImportError:
    standalone = True
    g = importLeoGlobals()

ok = g is not None
if ok:
    try:
        #Pmw = g.importExtension("Pmw",    pluginName=__name__,verbose=True)
        #Tk  = g.importExtension('Tkinter',pluginName=__name__,verbose=True)
        #sets = g.importExtension('sets',  pluginName=__name__,verbose=True)
        import sets
        import leoPlugins
        import java
        import java.lang.String as jstring
        import javax.swing as swing
        import java.awt as awt
        import javax.swing.border as sborder
        import java.awt.event as aevent
        import javax.swing.event as sevent
        import javax.swing.table as stable
        import jarray
    except Exception:
        import sys
        s = 'plugins_manager.py: %s: %s' % (sys.exc_type,sys.exc_value)
        print s ; g.es(s,color='blue')
        ok = False
#@nonl
#@-node:pap.20041006184225.3:<< imports >>
#@nl
#@<< todo >>
#@+node:pap.20041009141528:<< todo >>
"""

Todo list:

- getting subset of plugins from CVS
- categorize plugins
- filter on categories
- size of plugin
- add required plugins to conflict check
- help for nomenclature

Done

- restore list top position when updating plugin list 
- proper view of remote file (colourized code)
- __requires__ list for plugins
- show __requires__
- proper dialog to show conflict list and error list from CVS

"""
#@nonl
#@-node:pap.20041009141528:<< todo >>
#@nl

USE_PRIORITY = False # True: show non-functional priority field.

#@+others
#@+node:ekr.20050213122944:init
def init():
    
    # Ok for unit testing: adds menu.
    if ok:
        g.plugin_signon(__name__)

    return ok
#@nonl
#@-node:ekr.20050213122944:init
#@+node:ekr.20041231134702:topLevelMenu
# This is called from plugins_menu plugin.
# It should only be defined if the extension has been registered.

def topLevelMenu():
    
    """Manage the plugins"""
    dlg = ManagerDialog()
#@nonl
#@-node:ekr.20041231134702:topLevelMenu
#@+node:zorcanda!.20050922131200:createPluginMenu
def createPluginsMenu():
    
    plugins = swing.JMenu( "Plugins" )
    jmi = swing.JMenuItem( "View Plugin Manager" )
    jmi.actionPerformed = lambda event: ManagerDialog()
    plugins.add( jmi )
    plugins.addSeparator()
    def createAbout( module = None):
        
        doc = ""
        if hasattr( module, "__doc__" ):
            doc = module.__doc__
        
        version = "Version ?"
        if hasattr( module, "__version__" ):
            version = "Version %s" % module.__version__
        
        jd = swing.JDialog()
        jd.setTitle( "About %s" % module.__name__ )
        jp = swing.JPanel( java.awt.BorderLayout() )
        jlabel = swing.JLabel( version, swing.SwingConstants.CENTER )
        jp.add( jlabel, java.awt.BorderLayout.NORTH )
        jtp = swing.JTextPane()
        jtp.setText( doc )
        jtp.setCaretPosition( 0 )
        jtp.setEditable( 0 )
        jsp = swing.JScrollPane( jtp )
        tk = java.awt.Toolkit.getDefaultToolkit()
        ss = tk.getScreenSize()
        ss.width = ss.width/ 2
        ss.height = ss.height / 2
        jsp.setPreferredSize( ss )
        jp.add( jsp )
        cpanel = swing.JPanel()
        close = swing.JButton( "Close" )
        close.actionPerformed = lambda event: jd.dispose()
        cpanel.add( close )
        jp.add( cpanel, java.awt.BorderLayout.SOUTH )
        jd.add( jp )
        jd.pack()
        g.app.gui.center_dialog( jd )
        jd.visible = 1
        
    import leoPlugins
    for z in leoPlugins.loadedModules:
        mod = leoPlugins.loadedModules[ z ]
        jmi = swing.JMenuItem( z )
        jmi.actionPerformed = lambda event, mod = mod: createAbout( module = mod )
        plugins.add( jmi )

    
    
    
    return plugins
    
#@-node:zorcanda!.20050922131200:createPluginMenu
#@+node:pap.20041006193459:Error Classes
class InvalidPlugin(Exception):
    """The plugin is invalid"""
    
class InvalidCollection(Exception):
    """The plugin collection is invalid"""
    
class InvalidManager(Exception):
    """The enable manager is invalid"""
#@-node:pap.20041006193459:Error Classes
#@+node:pap.20050305144720:inColumns

def inColumns(data, columnwidths):
    """Return the items of data with the specified column widths
    
    The list of widths should be one less than the list of data, eg
        inColumns((10,20,30), (5,5))
    """
    format = ""
    for col in columnwidths:
        format += "%%-%ds" % col
    format += "%s"
    #
    return format % data
#@-node:pap.20050305144720:inColumns
#@+node:pap.20050317185409:Standalone Operation (no longer used)
if 0:
    #@    @+others
    #@+node:pap.20050317185716:class NameSpace
    class NameSpace:
        """Just an object to dump properties in"""
        
        #@    @+others
        #@+node:pap.20050317190909:__init__
        def __init__(self, **kw):
            self.__dict__.update(kw)
        #@nonl
        #@-node:pap.20050317190909:__init__
        #@-others
    #@nonl
    #@-node:pap.20050317185716:class NameSpace
    #@+node:pap.20050317190014:class BlackHole
    class BlackHole:
        """Try to call a method on this and it will just dissapear into the void!"""
        
        #@    @+others
        #@+node:pap.20050317190014.1:__getattr__
        def __getattr__(self, name):
            """Return a black hole!"""
            return BlackHole()
        #@nonl
        #@-node:pap.20050317190014.1:__getattr__
        #@+node:pap.20050317190014.2:__call__
        def __call__(self, *args, **kw):
            """Call this .... """
            return None
        #@nonl
        #@-node:pap.20050317190014.2:__call__
        #@-others
    #@nonl
    #@-node:pap.20050317190014:class BlackHole
    #@+node:pap.20050317185409.1:class FakeLeoGlobals
    class FakeLeoGlobals:
        """A class to represent leoGlobals when were are running in standalone mode"""
        
        #@    @+others
        #@+node:pap.20050317185716.1:__init__
        def __init__(self):
            """Initialize the fake object"""
            self.app = NameSpace()
            self.app.root = Tk.Tk()
            self.app.gui = BlackHole()  
            self.app.loadDir = os.path.join(os.path.split(__file__)[0], "..", "src")
        
            self.Bunch = NameSpace
            
            for name in dir(os.path):
                setattr(self, "os_path_%s" % name, getattr(os.path, name))
            
        #@nonl
        #@-node:pap.20050317185716.1:__init__
        #@+node:pap.20050317191929:choose
        def choose(self, cond, a, b): # warning: evaluates all arguments
        
            if cond: return a
            else: return b
        #@nonl
        #@-node:pap.20050317191929:choose
        #@-others
    #@nonl
    #@-node:pap.20050317185409.1:class FakeLeoGlobals
    #@-others
#@nonl
#@-node:pap.20050317185409:Standalone Operation (no longer used)
#@+node:pap.20041009140132:UI
#@+node:zorcanda!.20050922121634:class PluginView

class PluginView( swing.JPanel, aevent.ComponentListener ):
    """Frame to display a plugin's information"""
    #@	<< class PluginView declarations >>
    #@+node:zorcanda!.20050922121634.1:<< class PluginView declarations >>
    
    #@-node:zorcanda!.20050922121634.1:<< class PluginView declarations >>
    #@nl
    #@	@+others
    #@+node:zorcanda!.20050922121634.2:__init__
    def __init__(self, parent, *args, **kw):
        """Initialize the view"""
        #Tk.Frame.__init__(self, parent, *args, **kw)
        swing.JPanel.__init__( self )
        self.addComponentListener( self )
        sl = swing.SpringLayout()
        self.setLayout( sl )
    
        
        name_label = swing.JLabel( "Name:" )
        self.add( name_label )
        self.name2 = self.EntryField( labelpos = 'w', label_text='Name:' )
        self.add( self.name2 )
        
        sl.putConstraint( sl.NORTH, self.name2, 0, sl.NORTH, self )
        sl.putConstraint( sl.WEST, self.name2, 0, sl.EAST, name_label )
        sl.putConstraint( sl.NORTH, name_label, 0, sl.NORTH, self )
        sl.putConstraint( sl.EAST, self, self.name2.getPreferredSize().width, sl.EAST, self.name2 )
        
        version_label = swing.JLabel( "Version:" )
        self.add( version_label )
        self.version = self.EntryField( labelpos = 'w', label_text='Version:' )
        self.add( self.version )
        sl.putConstraint( sl.NORTH, self.version, 0, sl.SOUTH, self.name2 )
        sl.putConstraint( sl.WEST, self.version, 0, sl.EAST, version_label )
        sl.putConstraint( sl.NORTH, version_label, 0, sl.SOUTH, self.name2 )
        
        status_label = swing.JLabel( "Status:" )
        self.add( status_label )
        self.status = self.EntryField( labelpos='w', label_text='Status:' )
        self.add( self.status )
        sl.putConstraint( sl.NORTH, self.status, 0, sl.SOUTH, self.version )
        sl.putConstraint( sl.WEST, self.status, 0 , sl.EAST, status_label )
        sl.putConstraint( sl.NORTH, status_label, 0, sl.SOUTH, self.version )
        
        group_label = swing.JLabel( "Group:" )
        self.add( group_label )
        self.group = self.EntryField( labelpos='w', label_text='Group:' )
        self.add( self.group )
        sl.putConstraint( sl.NORTH, self.group, 0, sl.SOUTH, self.status)
        sl.putConstraint( sl.WEST, self.group, 0, sl.EAST, group_label )
        sl.putConstraint( sl.NORTH, group_label, 0, sl.SOUTH, self.status )
    
    
        fn_group = swing.JLabel( "Filename:")
        self.add( fn_group )
        self.filename = self.EntryField( labelpos = 'w', label_text='Filename:' )
        self.add( self.filename )
        sl.putConstraint( sl.NORTH, self.filename, 0, sl.SOUTH, self.group)
        sl.putConstraint( sl.WEST, self.filename, 0, sl.EAST, fn_group )
        sl.putConstraint( sl.NORTH, fn_group, 0, sl.SOUTH, self.group )
    
        
        ini_group = swing.JLabel( "Has INI:" )
        self.add( ini_group )
        self.has_ini = self.EntryField( labelpos = 'w', label_text='Has INI:' )
        self.add( self.has_ini )
        sl.putConstraint( sl.NORTH, self.has_ini, 0, sl.SOUTH, self.filename )
        sl.putConstraint( sl.WEST, self.has_ini, 0, sl.EAST, ini_group )
        sl.putConstraint( sl.NORTH, ini_group, 0, sl.SOUTH, self.filename )
        
    
        htl_group = swing.JLabel( "Has top level:" )
        self.add( htl_group )
        self.has_toplevel = self.EntryField( labelpos='w', label_text='Has top level:' )
        self.add( self.has_toplevel )
        sl.putConstraint( sl.NORTH, self.has_toplevel, 0, sl.SOUTH, self.has_ini )
        sl.putConstraint( sl.WEST, self.has_toplevel, 0, sl.EAST, htl_group )
        sl.putConstraint( sl.NORTH, htl_group, 0, sl.SOUTH, self.has_ini )
        #sl.putConstraint( sl.EAST, htl_group, 0, sl.EAST, self.has_toplevel )
        
        sl.putConstraint( sl.EAST, name_label ,0 ,sl.EAST, htl_group )
        sl.putConstraint( sl.EAST, version_label ,0, sl.EAST, htl_group )
        sl.putConstraint( sl.EAST, status_label ,0, sl.EAST, htl_group )
        sl.putConstraint( sl.EAST, group_label  ,0, sl.EAST, htl_group )
        sl.putConstraint( sl.EAST, fn_group  ,0, sl.EAST, htl_group )
        sl.putConstraint( sl.EAST, ini_group  ,0, sl.EAST, htl_group )
    
        if USE_PRIORITY:
            #self.priority = Pmw.EntryField(self.top,
            #    labelpos = 'w',
            #    label_text = 'Priority:',
            #)
            
            #self.priority.pack(side="top", fill="x", expand=0)
            self.priority = self.EntryField( eftop, labelpos = 'w', label_text='Priority:' )
        
        
        self.text_panel = swing.JTabbedPane()
        self.add( self.text_panel ) #, awt.BorderLayout.CENTER )
        sl.putConstraint( sl.NORTH, self.text_panel, 5, sl.SOUTH, self.has_toplevel )
        sl.putConstraint( sl.EAST, self.text_panel, 5, sl.EAST, self )
        sl.putConstraint( sl.WEST, self.text_panel, 5, sl.WEST, self )
        
        description_panel = swing.JPanel()
        description_panel.setLayout( awt.GridLayout( 1, 1 ) )
        self.text_panel.addTab( 'Description', description_panel )
        version_panel = remote_list_page = swing.JPanel()
        version_panel.setLayout( awt.GridLayout( 1, 1 ) )
        self.text_panel.addTab( 'Version History', version_panel )
        tp_dimen = awt.Dimension( 200, 200 )
        self.text_panel.setPreferredSize( tp_dimen )
        self.text_panel.setMinimumSize( tp_dimen )
        self.text_panel.setMaximumSize( tp_dimen )
    
        self.description = swing.JTextArea()
        self.description.setEditable( False )
        #self.description.setLineWrap( True )
        view = swing.JScrollPane( self.description )
        border = view.getBorder()
        tborder = sborder.TitledBorder( border )
        tborder.setTitle( "Plugin Description" )
        view.setBorder( tborder )
        
        description_panel.add( view )
    
        self.version_history = swing.JTextArea()
        self.version_history.setEditable( False )
        #self.version_history.setLineWrap( True )
        view = swing.JScrollPane( self.version_history )
        border = view.getBorder()
        tborder = sborder.TitledBorder( border )
        tborder.setTitle( "Plugin History" )
        view.setBorder( tborder )
        version_panel.add( view )        
        
        
    
        self.jlists = swing.JPanel( awt.GridLayout( 1, 3 ) )    
        lav1 = self.getJList( "Commands" )
        self.commands = lav1[ 0 ]
        self.jlists.add( lav1[ 1 ] )
    
    
        lav2 = self.getJList( "Hooks" )
        self.handlers = lav2[ 0 ]
        self.jlists.add( lav2[ 1 ] )
        
        lav3 = self.getJList( "Requires" )
        self.requires = lav3[ 0 ]
        self.jlists.add( lav3[ 1 ] )
        
        self.add( self.jlists )
        sl.putConstraint( sl.NORTH, self.jlists, 5, sl.SOUTH, self.text_panel )
        sl.putConstraint( sl.EAST, self.jlists, 5, sl.EAST, self )
        sl.putConstraint( sl.WEST, self.jlists, 5, sl.WEST, self )
        sl.putConstraint( sl.SOUTH, self, 20, sl.SOUTH, self.jlists )
    
        
    #@+at    
    #     if USE_PRIORITY:
    #         Pmw.alignlabels([
    #             self.name, self.version, self.status, self.group,
    #             self.filename, self.has_ini, self.has_toplevel,
    #             self.priority,
    #         ])
    #     else:
    #          Pmw.alignlabels([
    #             self.name, self.version, self.status, self.group,
    #             self.filename, self.has_ini, self.has_toplevel,
    #         ])
    #@-at
    #@@c
        
    #@nonl
    #@-node:zorcanda!.20050922121634.2:__init__
    #@+node:zorcanda!.20050922121634.3:showPlugin
    
    def showPlugin(self, plugin):
        """Show a plugin"""
        self.name2.setentry(plugin.name)
        self.version.setentry(plugin.version)
        self.group.setentry(plugin.group)
        self.filename.setentry(g.os_path_abspath(plugin.filename)) # EKR
        self.status.setentry(plugin.enabled)
        self.has_ini.setentry(
            g.choose(plugin.has_config,"Yes","No"))
        self.has_toplevel.setentry(
            g.choose(plugin.has_toplevel,"Yes","No"))
        if USE_PRIORITY:
            self.priority.setentry(plugin.priority)
        
        self.description.setText( plugin.description.strip() )
        self.description.setCaretPosition( 0 )
        self.version_history.setText( plugin.versions.strip() )
        self.version_history.setCaretPosition( 0 )
        #self.description.settext(plugin.description.strip())
        #self.version_history.settext(plugin.versions.strip())
        self.commands.setlist(plugin.commands)
        self.handlers.setlist(plugin.handlers)
        self.requires.setlist(plugin.requires)
        
    #@nonl
    #@-node:zorcanda!.20050922121634.3:showPlugin
    #@+node:zorcanda!.20050922121634.4:def getJList
    class PVList( swing.JList ):
        
        def __init__( self ):
            swing.JList.__init__( self )
            self.setVisibleRowCount( 5 )
            #g = self.getGraphics()
            #fm = g.getFontMetrics()
            #width = fm.stringWidth( 'xxxxxxxxxx' )
            #self.setFixedCellWidth( width )
            
        def setlist( self, items ):
            
            
            import java.util.HashSet
            items2 = java.util.HashSet( items )
            self.setListData( items2.toArray() )
            #if items.__class__ == java.util.HashSet:
            #    self.setListData( items.toArray() )
            #else:
            #    self.setListData( items )
    
    def getJList( self, title ):
    
        jlist =  self.PVList()
        view = swing.JScrollPane( jlist )
        border = view.getBorder()
        tborder = sborder.TitledBorder( border )
        tborder.setTitle( title )
        view.setBorder( tborder )
        return jlist, view
    #@-node:zorcanda!.20050922121634.4:def getJList
    #@+node:zorcanda!.20050922121634.5:component listener methods
    def componentResized( self, event ):
        pass
        #sz = self.getSize()
        #sz.height = sz.height/3
        #self.text_panel.setPreferredSize( sz )
        #self.text_panel.setMaximumSize( sz )
        #self.jlists.setMaximumSize( sz )
        #self.jlists.setPreferredSize( sz )
        
    def componentHidden( self, event ):
        pass
        
    def componentMoved( self, event ):
        pass
        
    def componentShown( self, event ):
        pass
    #@nonl
    #@-node:zorcanda!.20050922121634.5:component listener methods
    #@+node:zorcanda!.20050922121634.6:class EntryField
    class EntryField( swing.JTextField ):
        
        def __init__( self, labelpos = 'west', label_text= "" ):
            
            #swing.JPanel.__init__( self )
            swing.JTextField.__init__( self, 15 )
            self.entry = self
            self.setMaximumSize( self.getPreferredSize() )
            self.setMinimumSize( self.getPreferredSize() )
            
            
    
        def setentry( self, data ):
            self.entry.setText( data )
            self.entry.setCaretPosition( 0 )
    #@nonl
    #@-node:zorcanda!.20050922121634.6:class EntryField
    #@-others
#@-node:zorcanda!.20050922121634:class PluginView
#@+node:zorcanda!.20050922121652:class PluginList

class PluginList( swing.JPanel, sevent.ListSelectionListener ):
    """Frame to display a list of plugins"""
    #@	<< class PluginList declarations >>
    #@+node:zorcanda!.20050922121652.1:<< class PluginList declarations >>
    filter_options = []
    title = "List"
    secondtitle = "Groups"
    
    
    #@-node:zorcanda!.20050922121652.1:<< class PluginList declarations >>
    #@nl
    #@	@+others
    #@+node:zorcanda!.20050922121652.2:__init__
    def __init__(self, parent, plugin_view, plugins ): #, *args, **kw):
        """Initialize the list"""
        
        swing.JPanel.__init__( self )
        sl = swing.SpringLayout()
        self.setLayout( sl )
    
        self.box = swing.JList()
        self.box.addListSelectionListener( self )
        self.box.setVisibleRowCount( 5 )
        view = swing.JScrollPane( self.box )
        border = view.getBorder()
        tborder = sborder.TitledBorder( border )
        tborder.setTitle( "Plugins" )
        view.setBorder( tborder )
        self.add( view )
        sl.putConstraint( sl.NORTH, view, 5, sl.NORTH, self )
    
    
        import java.lang.Object as jobject
        
        cl = swing.SpringLayout()
        c1 = swing.JPanel( cl )
        c1.setBorder( sborder.LineBorder.createBlackLineBorder() )
        label1 = swing.JLabel( self.title )
        c1.add( label1 )
        cl.putConstraint( cl.NORTH, label1, 0, cl.NORTH, c1 )
        
        self.filter = swing.JComboBox( self.filter_options )
        self.filter.addActionListener( self.Populater( self ) )                     
    
        c1.add( self.filter )
        cl.putConstraint( cl.NORTH, self.filter, 0, cl.SOUTH, label1 )
        cl.putConstraint( cl.SOUTH, c1, 0, cl.SOUTH, self.filter )
        cl.putConstraint( cl.EAST, c1, 0, cl.EAST, label1 )
        nsize = self.syncSize( label1.getPreferredSize(), self.filter.getPreferredSize() )
        label1.setPreferredSize( nsize )
        self.filter.setPreferredSize( nsize )
        
        self.add( c1 )
        sl.putConstraint( sl.NORTH, c1, 5, sl.SOUTH, view )
        sl.putConstraint( sl.WEST, c1, 5, sl.WEST, self )                       
    
    
        cl = swing.SpringLayout()
        c2 = swing.JPanel( cl )
        c2.setBorder( sborder.LineBorder.createBlackLineBorder() )
        label2 = swing.JLabel( self.secondtitle )
        c2.add( label2 )
        cl.putConstraint( cl.NORTH, label2, 0, cl.NORTH, c2 )
        
        self.secondfilter = swing.JComboBox( [ 'All',] )
        self.secondfilter.addActionListener( self.Populater( self ) )
        c2.add( self.secondfilter )
        nsize = self.syncSize( label2.getPreferredSize(), self.secondfilter.getPreferredSize() )
        label2.setPreferredSize( nsize )
        self.secondfilter.setPreferredSize( nsize )
        
        cl.putConstraint( sl.NORTH, self.secondfilter, 0, sl.SOUTH, label2 )
        cl.putConstraint( sl.SOUTH, c2, 0, cl.SOUTH, self.secondfilter )
        cl.putConstraint( sl.EAST, c2, 5, cl.EAST, label2 )
        
        self.add( c2 )
        sl.putConstraint( sl.NORTH, c2, 5, sl.SOUTH, view )
        sl.putConstraint( sl.WEST, c2, 5, sl.EAST, c1 )
        sl.putConstraint( sl.SOUTH, self, 5, sl.SOUTH, c1 )
        sl.putConstraint( sl.EAST, self, 5, sl.EAST, view )
        
        self.plugin_view = plugin_view
        self.plugins = plugins
    
    
    #@-node:zorcanda!.20050922121652.2:__init__
    #@+node:zorcanda!.20050922121652.3:syncSize
    def syncSize( self, s1, s2 ):
        
        nsize = awt.Dimension( 0, 0 )
        if s1.width > s2.width:
            nsize.width = s1.width
        else:
            nsize.width = s2.width
            
            
        if s1.height > s2.height:
            nsize.height = s1.height
        else:
            nsize.height = s2.height
            
        return nsize
    #@nonl
    #@-node:zorcanda!.20050922121652.3:syncSize
    #@+node:zorcanda!.20050922121652.4:onClick
    
    def onClick(self):
        self.valueChanged( None )
    
    def valueChanged( self, event ):
        """Select an item in the list"""
        #sels = self.box.getcurselection()
        sels = self.box.getSelectedValue()
        #if len(sels) == 0:
        #    pass
        #else:
        if sels == None: pass
        else:
            self.plugin_view.showPlugin( self.local_dict[ sels ] ) #self.local_dict[sels[0]])
            self.plugin_view.description.invalidate()
            self.plugin_view.version_history.invalidate()
            self.repaint()
            #self.invalidate()
    #@nonl
    #@-node:zorcanda!.20050922121652.4:onClick
    #@+node:zorcanda!.20050922121652.5:populateList
    
    def populateList(self, filter=None):
        """Populate the plugin list"""
        if not self.plugins:
            #self.box.setlist([])
            self.box.setListData( [] )
            return
        #if filter is None:
        #filter = self.filter.getcurselection()
        values = self.filter.getSelectedItem()
        filter = values
        #secondfilter = self.secondfilter.getcurselection()
        values = self.secondfilter.getSelectedItem()
        secondfilter = values
        #
        # Get old selection so that we can restore it    
        #current_text = self.box.getcurselection()
        current_text = self.box.getSelectedValue()
        if current_text:
            #current_index = self.listitems.index(current_text[0])
            current_index = self.listitems.index( current_text )
        #
        # Show the list
        #self.local_dict = dict([(self.plugins[name].asString(), self.plugins[name])
        #                            for name in self.plugins])
        self.local_dict = {}
        lddata = [(self.plugins[name].asString(), self.plugins[name]) for name in self.plugins]
        for z in lddata:
            self.local_dict[ z[ 0 ] ] = z[ 1 ]
            
        self.listitems = [self.plugins[name].asString() 
                            for name in self.plugins.sortedNames()
                            if filter in ("All", self.plugins[name].enabled) 
                            and secondfilter in ("All", self.plugins[name].group)]
        #self.box.setlist(self.listitems)   
        self.box.setListData( self.listitems ) 
        #
        if current_text:
            try:
                self.box.setSelectedValue( ( self.listitems[ current_index ], ), 1 )
                #self.box.setvalue((self.listitems[current_index],))
                #self.box.component("listbox").see(current_index)
            except IndexError:
                pass # Sometimes the list is just different!
            else:
                self.onClick()
    
    #@-node:zorcanda!.20050922121652.5:populateList
    #@+node:zorcanda!.20050922121652.6:getSelectedPlugin
    
    def getSelectedPlugin(self):
        """Return the selected plugin"""
        #sels = self.box.getcurselection()
        
        sels = self.box.getSelectedValue()
        if sels == None: return None
        #if len(sels) == 0:
        #    return None
        else:
            #return self.local_dict[sels[0]]
            return self.local_dict[ sels ]
    #@nonl
    #@-node:zorcanda!.20050922121652.6:getSelectedPlugin
    #@+node:zorcanda!.20050922121652.7:setSecondFilterList
    
    def setSecondFilterList(self, list_items):
        """Set the items to use in the second filter list"""
        #self.secondfilter.setitems(list_items)
        sf = self.secondfilter
        #sf.setOptions( list_items )
        sf.removeAllItems()
        for z in list_items:
            sf.addItem( z )
            
    #@-node:zorcanda!.20050922121652.7:setSecondFilterList
    #@+node:zorcanda!.20050922121652.8:class Populater
    class Populater( aevent.ActionListener ):
        
        def __init__( self, pl ):
            
            self.pl = pl
            
        def actionPerformed( self, event ):
            
            self.pl.populateList()
    #@nonl
    #@-node:zorcanda!.20050922121652.8:class Populater
    #@-others
#@-node:zorcanda!.20050922121652:class PluginList
#@+node:zorcanda!.20050922121723:class LocalPluginList

class LocalPluginList(PluginList):
    """A list showing plugins based on the local file system"""
    #@	<< class LocalPluginList declarations >>
    #@+node:zorcanda!.20050922121723.1:<< class LocalPluginList declarations >>
    title = "Locally Installed Plugins"
    filter_options = ['All', 'On', 'Off']
    
    #@-node:zorcanda!.20050922121723.1:<< class LocalPluginList declarations >>
    #@nl
#@-node:zorcanda!.20050922121723:class LocalPluginList
#@+node:zorcanda!.20050922121744:class RemotePluginList
class RemotePluginList(PluginList):
    """A list showing plugins based on a remote file system"""
    #@	<< class RemotePluginList declarations >>
    #@+node:zorcanda!.20050922121744.1:<< class RemotePluginList declarations >>
    title = "Plugins on CVS"
    filter_options = ['All', 'Up to date', 'Update available', 'Changed', 'Not installed']
    
    #@-node:zorcanda!.20050922121744.1:<< class RemotePluginList declarations >>
    #@nl
#@-node:zorcanda!.20050922121744:class RemotePluginList
#@+node:zorcanda!.20050922121802:class ManagerDialog
class ManagerDialog:
    """The dialog to show manager functions"""
    #@	<< class ManagerDialog declarations >>
    #@+node:zorcanda!.20050922121802.1:<< class ManagerDialog declarations >>
    
    #@-node:zorcanda!.20050922121802.1:<< class ManagerDialog declarations >>
    #@nl
    #@	@+others
    #@+node:zorcanda!.20050922121802.2:__init__
    def __init__(self):
        """Initialise the dialog"""
        
        
        root = g.app.root
        if standalone:
            self.top = top = root
        else:
            self.top = top = swing.JFrame()
        
        sl = swing.SpringLayout()
        cpane = top.getContentPane()
        cpane.setLayout( sl )
        g.app.gui.attachLeoIcon(self.top)
        top.setTitle( "Plugin Manager" )
           
        self.initLocalCollection()
       
        sl2 = swing.SpringLayout()
        self.frame = frame = swing.JPanel( sl2 )
        top.add( self.frame )
        sl.putConstraint( sl.NORTH, frame, 5, sl.NORTH, cpane )
          
        self.plugin_view = PluginView( cpane )
        cpane.add( self.plugin_view )
        sl.putConstraint( sl.NORTH, self.plugin_view, 5, sl.NORTH, cpane )
        sl.putConstraint( sl.WEST, self.plugin_view, 5, sl.EAST, frame )
        sl.putConstraint( sl.SOUTH, cpane, 5, sl.SOUTH, self.plugin_view )
        sl.putConstraint( sl.EAST, cpane, 5, sl.EAST, self.plugin_view )
            
        self.notebook = notebook = swing.JTabbedPane()
        frame.add( notebook, awt.BorderLayout.WEST )
        sl2.putConstraint( sl2.NORTH, notebook, 5, sl2.NORTH, frame )
        sl2.putConstraint( sl2.SOUTH, frame, 5, sl2.SOUTH, notebook )
        sl2.putConstraint( sl2.EAST, frame, 5, sl2.EAST, notebook )
        
        sl3 = swing.SpringLayout()
        self.local_list_page = local_list_page = swing.JPanel( sl3 )
        notebook.addTab( 'Installed Plugins', local_list_page )
        
        sl4 = swing.SpringLayout()
        self.remote_list_page = remote_list_page = swing.JPanel( sl4 ) 
        notebook.addTab( 'CVS Plugins', remote_list_page )
           
        self.plugin_list = LocalPluginList(local_list_page, self.plugin_view , self.local ) 
        local_list_page.add( self.plugin_list )
        sl3.putConstraint( sl3.NORTH, self.plugin_list, 5, sl3.NORTH, local_list_page )
        
        self.remote_plugin_list = RemotePluginList(remote_list_page, self.plugin_view , None )
        remote_list_page.add( self.remote_plugin_list )
        sl4.putConstraint( sl4.NORTH, self.remote_plugin_list, 5, sl4.NORTH, remote_list_page )
        
        self.plugin_list.setSecondFilterList(["All"] + self.local.getGroups())
        
        self.buttonBox = self.ButtonBox( )
        bpanel = self.buttonBox.getContainer()
        local_list_page.add( bpanel )
        sl3.putConstraint( sl3.NORTH, bpanel ,5, sl3.SOUTH, self.remote_plugin_list )
        sl3.putConstraint( sl3.SOUTH, local_list_page, 5, sl3.SOUTH, bpanel )
        sl3.putConstraint( sl3.EAST, local_list_page, 5, sl3.EAST, bpanel )
            
        self.buttonBox.add( 'Enable', command = self.enablePlugin )
        self.buttonBox.add( 'Disable', command = self.disablePlugin )
        self.buttonBox.add( 'Updates', command = self.checkUpdates )
        self.buttonBox.add( 'Conflicts', command = self.checkConflicts )
        
        self.buttonBox = self.ButtonBox( )
        bpanel = self.buttonBox.getContainer()
        remote_list_page.add( bpanel )
        sl4.putConstraint( sl4.NORTH, bpanel, 5, sl4.SOUTH, self.remote_plugin_list )
        sl4.putConstraint( sl4.SOUTH, remote_list_page, 5, sl4.SOUTH, bpanel )
        sl4.putConstraint( sl4.EAST, remote_list_page, 5, sl4.EAST, bpanel )
        
        # Add some buttons to the ButtonBox.
        self.buttonBox.add('Install', command = self.installPlugin)
        self.buttonBox.add('View', command = self.viewPlugin)
        self.buttonBox.add('Updates', command = self.checkUpdates)
            
        self.messagebar = self.MessageBar()
        cpane.add( self.messagebar )
        sl.putConstraint( sl.NORTH, self.messagebar, 5, sl.SOUTH, frame )
        sl.putConstraint( sl.WEST, self.messagebar, 5, sl.WEST, cpane )
        sl.putConstraint( sl.EAST, self.messagebar, 0, sl.EAST, frame )
        
        close_button = swing.JButton( "Close" )
        close_button.actionPerformed = lambda event: top.dispose()
        cpane.add( close_button )
        sl.putConstraint( sl.NORTH, close_button, 5, sl.SOUTH, self.messagebar )
              
        self.plugin_list.populateList("All")
        
    
        
        if standalone:
            top.setDefaultCloseOperation( top.EXIT_ON_CLOSE )
            
        else:
            top.setDefaultCloseOperation( top.DISPOSE_ON_CLOSE )
        top.pack()
        screen_size = awt.Toolkit.getDefaultToolkit().getScreenSize()
        center_x = screen_size.width/2
        center_y = screen_size.height/2
        
        md_size = top.getSize()
        center_x = center_x -( md_size.width/2 )
        center_y = center_y -( md_size.height/2 )
        top.setLocation( center_x, center_y )
        top.visible = 1
        
    
    #@-node:zorcanda!.20050922121802.2:__init__
    #@+node:zorcanda!.20050922121802.3:enablePlugin
    
    def enablePlugin(self):
        """Enable a plugin"""
        plugin = self.plugin_list.getSelectedPlugin()
        if not plugin: return
        
        self.local.enablePlugin(plugin,self.enable)
        self.plugin_list.populateList()
    #@-node:zorcanda!.20050922121802.3:enablePlugin
    #@+node:zorcanda!.20050922121802.4:disablePlugin
    
    def disablePlugin(self):
        """Disable a plugin"""
        plugin = self.plugin_list.getSelectedPlugin()
        if not plugin: return
        
        self.local.disablePlugin(plugin,self.enable)
        self.plugin_list.populateList()
    #@-node:zorcanda!.20050922121802.4:disablePlugin
    #@+node:zorcanda!.20050922121802.5:initLocalCollection
    
    def initLocalCollection(self):
        """Initialize the local plugin collection"""
    
        # Get the local plugins information
        self.local = LocalPluginCollection()
        
        self.local.initFrom(g.os_path_join( g.app.loadDir,"..","plugins"))
    
        # Get the active status of the plugins
        self.enable = EnableManager()
        self.enable.initFrom(g.os_path_join( g.app.loadDir,"..","plugins"))
        self.local.setEnabledStateFrom(self.enable)
    #@-node:zorcanda!.20050922121802.5:initLocalCollection
    #@+node:zorcanda!.20050922121802.6:checkUpdates
    
    def checkUpdates(self):
        """Check for updates"""
        url = r"cvs.sourceforge.net/viewcvs.py/leo/leo/plugins"
        self.status_message = "Searching for plugin list"
        self.messagebar.message("busy", "Searching for plugin list")
        
        def callbackPrint(text):
            """A callback to send status information"""
            self.remote_plugin_list.populateList() 
            self.messagebar.message("busy", text)
            #self.top.update()
        
        self.remote = CVSPluginCollection()
        self.remote_plugin_list.plugins = self.remote
        try: 
            errors = self.remote.initFrom(url,callbackPrint)    
        except Exception, err:
            
            #dialog = Pmw.MessageDialog(self.top,
            #    title = 'CVS Error',
            #    defaultbutton = 0,
            #    message_text = 'Error retrieving CVS plugin information: %s' % err)
            #dialog.iconname('CVS')      
            #dialog.activate()
            dialog = swing.JOptionPane.showMessageDialog(  self.top,
                                                          "Error retrieving CVS plugin information:\n %s" % err,
                                                          'CVS Error',
                                                          swing.JOptionPane.ERROR_MESSAGE )
        
        else:
            if errors:
                
                
                dialog = ListReportDialog('CVS File Errors',
                                          'Errors',
                                          ["%s - %s" % item for item in errors],
                                          500)
                
            
        self.messagebar.resetmessages('busy')        
        self.remote.setEnabledStateFrom(self.local)
        self.remote_plugin_list.populateList()   
        self.remote_plugin_list.setSecondFilterList(["All"] + self.remote.getGroups()) 
    #@-node:zorcanda!.20050922121802.6:checkUpdates
    #@+node:zorcanda!.20050922121802.7:installPlugin
    
    def installPlugin(self):
        """Install the selected plugin"""
    
        # Write the file
        plugin = self.remote_plugin_list.getSelectedPlugin()        
        if not plugin: return
    
        self.messagebar.message("busy", "Writing file")
        
        plugin.writeTo(g.os_path_join( g.app.loadDir,"..","plugins"))
        self.messagebar.message("busy", "Scanning local plugins") 
        # Go and check local filesystem for all plugins   
        self.initLocalCollection()
        # View is still pointing to the old list, so switch it now
        self.plugin_list.plugins = self.local
        self.plugin_list.populateList()
        plugin.enabled = "Up to date"
        # Update the current list too
        self.remote_plugin_list.populateList()
        self.messagebar.resetmessages('busy')
    #@-node:zorcanda!.20050922121802.7:installPlugin
    #@+node:zorcanda!.20050922121802.8:viewPlugin
    
    def viewPlugin(self):
        """View the selected plugin in a web browser"""
        plugin = self.remote_plugin_list.getSelectedPlugin()
        if plugin:
            webbrowser.open(plugin.getViewFilename())
    #@-node:zorcanda!.20050922121802.8:viewPlugin
    #@+node:zorcanda!.20050922121802.9:checkConflicts
    #@verbatim
    #@nonl
    
    def checkConflicts(self):
        """Check for plugin conflicts"""
        plugin = self.plugin_list.getSelectedPlugin() 
        if not plugin:
            return 
        conflicts = self.local.getConflicts(plugin)
        if not conflicts:
            #dialog = Pmw.MessageDialog(self.top,
            #    title = 'No conflicts',
            #    defaultbutton = 0,
            #    message_text = 'There are no conflicts for %s.' % plugin.name)
            #dialog.iconname('Conflicts')
            #dialog.activate()
            swing.JOptionPane.showMessageDialog( self.top,
                                                "There are no conflicts for %s" % plugin.name,
                                                "No conflicts",
                                                swing.JOptionPane.INFORMATION_MESSAGE )
                                                
        else:
            dialog = ListReportDialog(
                'Potential Conflicts for %s' % plugin.name,
                'Conflicts',
                [inColumns(item, [30]) for item in conflicts],
                400)
    
    #@-node:zorcanda!.20050922121802.9:checkConflicts
    #@+node:zorcanda!.20050922121802.10:class ButtonBox
    class ButtonBox:
        
        def __init__( self ): #, gbl, gbc ):
            
            #gbc.gridy = gbc.RELATIVE
            self.bgroup = swing.ButtonGroup()
            self.panel = swing.Box.createHorizontalBox()
            #gbl.setConstraints( self.panel, gbc )
            #parent.add( self.panel )
            
        def getContainer( self ):
            return self.panel
            
        def add( self, name, command = None ):
            
            jbutton = swing.JButton( name )
            jbutton.actionPerformed = self.createCallback( command )
            self.bgroup.add( jbutton )
            self.panel.add( jbutton )
    
        def createCallback( self, command ):
            
            return lambda event: command()
    #@nonl
    #@-node:zorcanda!.20050922121802.10:class ButtonBox
    #@+node:zorcanda!.20050922121802.11:class MessageBar
    class MessageBar( swing.JProgressBar ):
        
        def __init__( self ):
            
            swing.JProgressBar.__init__( self )
            self.messagebar = self
            self.messagebar.setStringPainted( 1 )
            self.messagebar.setString( "" )
            border = self.messagebar.getBorder()
            tborder = sborder.TitledBorder( border, 'Status:', sborder.TitledBorder.DEFAULT_JUSTIFICATION, sborder.TitledBorder.LEFT )
            self.messagebar.setBorder( tborder )
            ps = self.getPreferredSize()
            ps.width = ps.width * 2
            self.setPreferredSize( ps )
          
        
        
        def message( self, a, b ):
            
            if a == 'busy':
                self.messagebar.setString( b )
                self.messagebar.setIndeterminate( 1 )
                
        def resetmessages( self , a):
            
            self.messagebar.setString( "" )
            self.messagebar.setIndeterminate( 0 )
            
    #@-node:zorcanda!.20050922121802.11:class MessageBar
    #@-others
#@-node:zorcanda!.20050922121802:class ManagerDialog
#@+node:zorcanda!.20050922121845:class ListReportDialog

class ListReportDialog:
    """Shows a list of items to report to the user
    
    The list is a list of strings. It is assumed that the
    strings are of the format 'abc - xyz' and this control
    presents a filter list based on the list of distinct 
    values for abc.
    
    """
    #@	<< class ListReportDialog declarations >>
    #@+node:zorcanda!.20050922121845.1:<< class ListReportDialog declarations >>
    #@-node:zorcanda!.20050922121845.1:<< class ListReportDialog declarations >>
    #@nl
    #@	@+others
    #@+node:zorcanda!.20050922121845.2:__init__
    def __init__(self, title, name, list_data, width=300):
        """Initialize the dialog"""
        
    
        root = g.app.root
        #self.top = top = Tk.Toplevel(root)
        #g.app.gui.attachLeoIcon(self.top)
        #top.title(title)
        
        self.top = top = swing.JDialog()
        top.title( title )
        
        #self.frame = frame = Tk.Frame(top)
        #frame.pack(side="top", fill='both', expand=1, padx=5, pady=5)
        self.frame = frame = swing.JPanel()
        top.add( frame )
        
        
        filter_options = self.getFilterOptions(list_data)
        self.list_data = list_data
        self.list_data.sort()
        
    #@+at    
    #     self.box = Pmw.ScrolledListBox(frame,
    #             labelpos='nw',
    #             label_text=name,
    #             listbox_height = 6,
    #             usehullsize = 1,
    #             hull_width = width,
    #             hull_height = 200,
    #             items = list_data,
    #     )
    #     self.box.pack(side="bottom", fill='both', expand=1)
    #     self.box.component("listbox").configure(font=("Courier", 10))
    #@-at
    #@@c
        self.box = swing.JList()
        view = swing.JScrollPane( self.box )
        border = view.getBorder()
        tborder = sborder.TitledBorder( border )
        tborder.setTitle( name )
        view.setBorder( tborder )
        frame.add( view )
        
        
        #self.filter = Pmw.OptionMenu(frame,
        #        labelpos = 'w',
        #        label_text = 'Filter:',
        #        items = filter_options,
        #        menubutton_width = 16,
        #        command=self.populateList,
        #)    
        
        #self.filter.pack(side="top")
        
        self.filter = swing.JOptionPane( 'Filter:',
                                         swing.JOptionPane.PLAIN_MESSAGE,
                                         swing.JOptionPane.DEFAULT_OPTION,
                                         None,
                                         filter_options )
                                        
        
        frame.add( self.filter )
        
            
        #top.grab_set() # Make the dialog a modal dialog.
        #top.focus_force() # Get all keystrokes.
        #root.wait_window(top)
    #@-node:zorcanda!.20050922121845.2:__init__
    #@+node:zorcanda!.20050922121845.3:getFilterOptions
    
    def getFilterOptions(self, list_data):
        """Return a list of filter items"""
        splitter = re.compile("\s{3,}")
        names = sets.Set()
        for item in list_data:
            names.add(splitter.split(item)[1].strip())
        name_list = list(names)
        name_list.sort()
        return ["All"] + name_list
    #@-node:zorcanda!.20050922121845.3:getFilterOptions
    #@+node:zorcanda!.20050922121845.4:populateList
    
    def populateList(self, filter):
        """Populate the list"""
    
        # Get old selection so that we can restore it    
        current_text = self.box.getcurselection()
        if current_text:
            current_index = self.list_data.index(current_text[0])
    
        listitems = [item for item in self.list_data
            if item.endswith("   %s" % filter) or filter == "All"]
    
        self.box.setlist(listitems)    
    
        if current_text:
            try:
                self.box.setvalue((listitems[current_index],))
                self.box.component("listbox").see(current_index)
            except IndexError:
                pass # Sometimes the list is just different!
    #@-node:zorcanda!.20050922121845.4:populateList
    #@-others
#@-node:zorcanda!.20050922121845:class ListReportDialog
#@-node:pap.20041009140132:UI
#@+node:pap.20041009140132.1:Implementation
#@+node:pap.20041006184225.6:class Plugin
class Plugin:   
    """Represents a single plugin instance"""
    
    # Class properties.
    max_name_width = 30
    max_group_width = 10
    
    #@    @+others
    #@+node:pap.20041006185727.1:__init__
    def __init__(self):
        """Initialize the plugin"""
        self.filename = None
        self.name = None
        self.is_plugin = False
        self.version = None
        self.description = ''
        self.handlers = []
        self.commands = []
        self.has_config = False
        self.can_read = False
        self.hash = None
        self.enabled = "Unknown"
        self.priority = None
        self.has_toplevel = False
        self.requires = []
        self.group = None
        self.versions = ''
        self.contents_valid = False
        
    #@nonl
    #@-node:pap.20041006185727.1:__init__
    #@+node:pap.20041006193013:initFrom
    def initFrom(self, location):
        """Initialize the plugin from the specified location"""
    
        # Initial properties
        self.filename = location
        self.name = self.getName(location)
        self.nicename = self.getNiceName(self.name)
    
        # Get the contents of the file
        try:
            text = self.getContents()
            self.getDetails(text)
        except InvalidPlugin, err:
            print 'InvalidPlugin',str(err)
            self.description = str(err)
        except:
            g.es('Unexpected exception in initFrom')
            g.es_exception()
    #@nonl
    #@-node:pap.20041006193013:initFrom
    #@+node:ekr.20041113095851:Must be overridden in subclasses...
    #@+node:pap.20041006212105:getName
    def getName(self, location):
    
        """Determine the plugin name from the location"""
    
        raise NotImplementedError("Must Override")
    #@-node:pap.20041006212105:getName
    #@+node:pap.20041006193239:getContents
    def getContents(self):
    
        """Return the contents of the file"""
    
        raise NotImplementedError("Must override")    
        
    #@nonl
    #@-node:pap.20041006193239:getContents
    #@-node:ekr.20041113095851:Must be overridden in subclasses...
    #@+node:pap.20050317183038:getNiceName
    def getNiceName(self, name):
        """Return a nice version of the plugin name
        
        Historically some plugins had "at_" and "mod_" prefixes to their
        name which makes the name look a little ugly in the lists. There is
        no real reason why the majority of users need to know the underlying
        name so here we create a nice readable version.
        
        """
        lname = name.lower()
        if lname.startswith("at_"):
            name = name[3:]
        elif lname.startswith("mod_"):
            name = name[4:]
        return name.capitalize()
    #@-node:pap.20050317183038:getNiceName
    #@+node:pap.20041006194759:getDetails
    def getDetails(self, text):
        """Get the details of the plugin
        
        We look for
            __version__
            hooks
            config
            commands
        """
        # The following line tried to detect plugins by looking 
        # for self.hasImport(text, "leoPlugins") - now we assume all .py are plugins
        self.is_plugin = not self.hasPattern(text, '__not_a_plugin__\s*=\s*True(?!")')
        self.version = self.getPattern(text, r'__version__\s*=\s*[\'"](.*?)[\'"]', "-")
        self.group = self.getPattern(text, r'__plugin_group__\s*=\s*[\'"](.*?)[\'"]', "-")
        # Allow both single and double triple-quoted strings.
        match1 = self.getMatch(text, r'"""(.*?)"""')
        match2 = self.getMatch(text, r"'''(.*?)'''")
        pat1 = match1 and match1.group(1)
        pat2 = match2 and match2.group(1)
        if pat1 and pat2:
            # Take the first pattern that appears.
            self.description = g.choose(match1.start() < match2.start(),pat1,pat2)
        else:
            # Take whatever.
            self.description = pat1 or pat2 or 'Unknown'
        # g.trace('%4d %s' % (len(self.description),self.name))
        self.commands = sets.Set(self.getPatterns(text, "def cmd_(\w*?)\("))
        # Get a list of the handlers
        handler_list = self.getPattern(text, r'registerHandler\((.*?)\)')
        if handler_list:
            self.handlers = sets.Set(self.getPatterns(handler_list, r'["\'](.*?)["\']'))
        else:
            self.handlers = sets.Set()
        # Look for the matching .ini file.
        ini_file_name = g.os_path_join(
            g.app.loadDir,"..","plugins",
            self.getName(self.filename)+".ini")
        ini_file_name = g.os_path_abspath(ini_file_name)
        self.has_config = g.os_path_exists(ini_file_name)
        self.hash = sha.sha(text).hexdigest()
        self.can_read = True
        if USE_PRIORITY:
            self.priority = self.getPattern(text, r'__plugin_priority__\s*=\s*(.*?)$', "-")
        self.has_toplevel = self.hasPattern(text, "def topLevelMenu")
        self.getVersionHistory(text)
    #@nonl
    #@-node:pap.20041006194759:getDetails
    #@+node:pap.20041006200000:hasPattern
    def hasPattern(self, text, pattern):
        
        """Return True if the text contains the pattern"""
    
        return self.getPattern(text, pattern) is not None
    #@nonl
    #@-node:pap.20041006200000:hasPattern
    #@+node:pap.20041009230351:hasImport
    def hasImport(self, text, module_name):
    
        """Return True if the text includes an import of the module"""
        if self.hasPattern(text, "import %s" % module_name):
            return True
    
        if self.hasPattern(text, "from %s import" % module_name):
            return True
    
        return False
    #@nonl
    #@-node:pap.20041009230351:hasImport
    #@+node:ekr.20050121183012:getMatch (new)
    def getMatch(self, text, pattern):
    
        """Return a single match for the specified pattern in the text"""
        
        return re.search(pattern,text,re.MULTILINE + re.DOTALL)
    #@nonl
    #@-node:ekr.20050121183012:getMatch (new)
    #@+node:pap.20041006194759.1:getPattern
    def getPattern(self, text, pattern, default=None):
    
        """Return a single match for the specified pattern in the text or the default"""
    
        matches = self.getPatterns(text, pattern)
        if matches:
            return matches[0]
        else:
            return default
    #@nonl
    #@-node:pap.20041006194759.1:getPattern
    #@+node:pap.20041006194917:getPatterns
    def getPatterns(self, text, pattern):
    
        """Return all matches of the pattern in the text"""
    
        exp = re.compile(pattern, re.MULTILINE + re.DOTALL)
    
        return exp.findall(text)
    #@nonl
    #@-node:pap.20041006194917:getPatterns
    #@+node:pap.20041006220611:asString
    def asString(self, detail=False):
        
        """Return a string representation"""
    
        if not detail:
            if self.version <> "-":
                body = "%(nicename)s (v%(version)s)" % self.__dict__
            else:
                body = "%(nicename)s" % self.__dict__                        
            return inColumns((body, self.group, self.enabled), [self.max_name_width, self.max_group_width])
        else:
            return (
                "Name: %(nicename)s\n"
                "Version: %(version)s\n"
                "Active: %(enabled)s\n"
                "File: %(filename)s\n"
                "\n"
                "Description:\n%(description)s\n\n"
                "Has config file: %(has_config)s\n"
                "Commands: %(commands)s\n"
                "Handlers: %(handlers)s\n" % self.__dict__
            )
    #@nonl
    #@-node:pap.20041006220611:asString
    #@+node:pap.20041009023004:writeTo
    def writeTo(self, location):
    
        """Write this plugin to the file location"""
    
        # Don't write if contents are invalid
        if not self.contents_valid:
            return 
            
        filename = os.path.join(location, "%s.py" % self.name)
        try:
            f = file(filename, "w")
        except (IOError, OSError), err:
            raise InvalidPlugin(
                "Unable to open plugin file '%s': %s" % (filename, err))
        try:
            try:
                f.write(self.text)
            finally:
                f.close()
        except Exception, err:
            raise InvalidPlugin(
                "Unable to write plugin file '%s': %s" % (filename, err))
    #@-node:pap.20041009023004:writeTo
    #@+node:pap.20050305165333:getVersionHistory
    def getVersionHistory(self, text):
        """Try to extract the version history of this plugin
        
        This is all guesswork! We look for a Leo node called "Version history"
        or one called "Change log". If we find it then we assume that the contents
        are the version history.
        
        This only works if the plugin was developed in Leo as a @thin file.
        
        """
        #if self.group == "Core":
        #    import pdb; pdb.set_trace()
        extractor =r'.*\+node\S+?\<\< %s \>\>.*?\#\@\+at(.*)\#\@\-at.*\-node.*?\<\< %s \>\>.*'
        for name in ("version history", "change log"):
            searcher = re.compile(extractor % (name, name), re.DOTALL+re.M)
            match = searcher.match(text)
            if match:
                version_text = match.groups()[0]
                self.versions = version_text.replace("#", "")
                return
        
    #@nonl
    #@-node:pap.20050305165333:getVersionHistory
    #@+node:pap.20041009225149:getRequiredModules
    def getRequiredModules(self, plugin_collection):
        """Determine which modules are also required by this plugin
        
        We check for,
         - importing Tk and PMW
         - other plugins which are imported (using plugin_collection)
         - a __plugin_requires__ definition
         
        """
        requires = []
        #@    << Check UI toolkits >>
        #@+node:pap.20041009230050:<< Check UI toolkits >>
        # Check for UI toolkits
        if self.hasImport(self.text, "Tkinter"):
            requires.append("Tkinter")
            
        if self.hasImport(self.text, "Pmw"):
            requires.append("Pmw")
        #@nonl
        #@-node:pap.20041009230050:<< Check UI toolkits >>
        #@nl
        #@    << Check other plugins >>
        #@+node:pap.20041009230652:<< Check other plugins >>
        # Check for importing other plugin files
        
        imports = self.getPatterns(self.text, "import (\w+)") + \
                  self.getPatterns(self.text, "from (\w+) import")
                  
        for module_name in imports:
            if module_name in plugin_collection and module_name <> self.name:
                requires.append(module_name)
                
        #@nonl
        #@-node:pap.20041009230652:<< Check other plugins >>
        #@nl
        #@    << Directives >>
        #@+node:pap.20041009230953:<< Directives >>
        # Look for __plugin_requires__ directive
        
        directive_text = self.getPattern(self.text, r'__plugin_requires__\s*=\s*(.*?)$', "[]")
        
        try:
            directive = eval(directive_text)
        except:
            g.es("__plugin_requires__ not understood for %s: '%s'" % (
                    self.name, directive_text))    
        else: 
            if isinstance(directive, (str, unicode)):
                requires.append(directive)
            else:
                requires.extend(directive)
        #@nonl
        #@-node:pap.20041009230953:<< Directives >>
        #@nl
        self.requires = sets.Set(requires)
    #@nonl
    #@-node:pap.20041009225149:getRequiredModules
    #@-others
#@nonl
#@-node:pap.20041006184225.6:class Plugin
#@+node:pap.20041006192557:class LocalPlugin(Plugin)
class LocalPlugin(Plugin):
    """A plugin on the local file system"""
    
    #@    @+others
    #@+node:pap.20041006212131:getName
    def getName(self, location):
    
        """Determine the plugin name from the location"""
        
        # return os.path.split(os.path.splitext(location)[0])[1]
        head,ext = g.os_path_splitext(location)
        path,name = g.os_path_split(head)
        return name
    #@nonl
    #@-node:pap.20041006212131:getName
    #@+node:pap.20041006193459.1:getContents
    def getContents(self):
    
        """Return the contents of the file"""
        
        self.contents_valid = False
    
        try:
            f = file(self.filename, "r")
        except (IOError, OSError), err:
            s = "Unable to open plugin file '%s': %s" % (self.name, err)
            print s
            raise InvalidPlugin(s)
        try:
            try:
                self.text = text = f.read()
            finally:
                f.close()
        except Exception, err:
            s = "Unable to read plugin file '%s': %s" % (self.name, err)
            print s
            raise InvalidPlugin(s)              
        
        self.contents_valid = True
        
        return text
        
        
    #@-node:pap.20041006193459.1:getContents
    #@-others
#@nonl
#@-node:pap.20041006192557:class LocalPlugin(Plugin)
#@+node:pap.20041006203049:class CVSPlugin
class CVSPlugin(Plugin):
     """A plugin on CVS"""
     
     #@     @+others
     #@+node:pap.20041006212238:getName
     def getName(self, location):
     
         """Determine the plugin name from the location"""
     
         return re.match("(.*)/(.*?)\.py\?", location).groups()[1]
     #@nonl
     #@-node:pap.20041006212238:getName
     #@+node:pap.20041006213006:getContents
     def getContents(self):
     
         """Return the contents of the file"""
         
         self.contents_valid = False
     
         # Connect to CVS
         try:
             url = urllib.urlopen(self.filename)
         except Exception, err:
             raise InvalidPlugin("Could not get connection to CVS: %s" % err)
     
         # Get the page with file content
         try:
             try:
                 self.text = text = url.read()
             finally:
                 url.close()
         except Exception, err:
             raise InvalidPlugin("Could not read file '%s' from CVS: %s" % (self.filename, err))
             
         self.contents_valid = True
         
         return text        
     #@nonl
     #@-node:pap.20041006213006:getContents
     #@+node:pap.20041009224435:getViewFilename
     def getViewFilename(self):
         
         """Return the url to view the file"""
     
         return self.filename.replace(r"/*checkout*", "") + "&view=markup"
     #@-node:pap.20041009224435:getViewFilename
     #@-others
#@nonl
#@-node:pap.20041006203049:class CVSPlugin
#@+node:pap.20041006190628:class PluginCollection
class PluginCollection(dict):

    """Represents a collection of plugins"""
    
    plugin_class = None
    
    #@    @+others
    #@+node:pap.20041006192257:__init__
    def __init__(self):
        """Initialize the plugin collection"""
    #@-node:pap.20041006192257:__init__
    #@+node:pap.20041006191239:initFrom
    def initFrom(self, location, callback=None):
        """Initialize the collection from the filesystem location.
        Returns a list of errors that occured.
        """
        if callback: callback("Looking for list of files")
        errors = []
        plugin_files = self.getFilesMatching(location)  
        for plugin_file in plugin_files:
            if callback: callback("Processing %s" % plugin_file)    
            plugin = self.plugin_class()
            # Get details
            try:
                plugin.initFrom(plugin_file)
            except Exception, err:
                errors.append((plugin_file, err))
            # Store anything that looks like a plugin
            if plugin.is_plugin:
                self[plugin.name] = plugin
    
        # Now we have to go back through and check for dependencies
        # We cannot do this up front because we need to know the names
        # of other plugins to detect the dependencies
        for plugin in self.values():
            plugin.getRequiredModules(self)
    
        return errors
    #@-node:pap.20041006191239:initFrom
    #@+node:pap.20041006191829:getAllFiles
    def getAllFiles(self, location):
        
        """Return all the files in the location"""
    
        raise NotImplementedError("Must override")    
    #@-node:pap.20041006191829:getAllFiles
    #@+node:pap.20041006221438:sortedNames
    def sortedNames(self):
    
        """Return a list of the plugin names sorted alphabetically
        
        We use decorate, sort, undecorate to sort by the nice name!
        
        """
    
        names = [(item.nicename, item.name) for item in self.values()]
        names.sort()
        return [name[1] for name in names]
    #@-node:pap.20041006221438:sortedNames
    #@+node:pap.20041008220723:setEnabledStateFrom
    def setEnabledStateFrom(self, enabler):
    
        """Set the enabled state of each plugin using the enabler object"""
        for name in self:
            if name in enabler.actives:
                self[name].enabled = "On"
            else:
                self[name].enabled = "Off" 
    #@-node:pap.20041008220723:setEnabledStateFrom
    #@+node:pap.20041008233947:enablePlugin
    def enablePlugin(self, plugin, enabler):
        """Enable a plugin"""
        plugin.enabled = "On"
        enabler.updateState(plugin)
    #@nonl
    #@-node:pap.20041008233947:enablePlugin
    #@+node:pap.20041008234033:disablePlugin
    def disablePlugin(self, plugin, enabler):
        """Enable a plugin"""
        plugin.enabled = "Off"
        enabler.updateState(plugin)
    #@nonl
    #@-node:pap.20041008234033:disablePlugin
    #@+node:pap.20041009025708.1:getConflicts
    def getConflicts(self, plugin):
    
        """Find conflicting hook handlers for this plugin"""
    
        conflicts = []
        for this_plugin in self.values():
            # g.trace(plugin.handlers,this_plugin.handlers)
            if this_plugin.name <> plugin.name:
                for conflict in plugin.handlers.intersection(this_plugin.handlers):
                    conflicts.append((this_plugin.name, conflict))
    
        return conflicts
            
    #@nonl
    #@-node:pap.20041009025708.1:getConflicts
    #@+node:pap.20050305161126:getGroups
    def getGroups(self):
        """Return a list of the Plugin group names"""
        groups = list(sets.Set([plugin.group for plugin in self.values()]))
        groups.sort()
        return groups
    #@nonl
    #@-node:pap.20050305161126:getGroups
    #@-others
#@-node:pap.20041006190628:class PluginCollection
#@+node:pap.20041006190817:class LocalPluginCollection
class LocalPluginCollection(PluginCollection):
    """Represents a plugin collection based on the local file system"""
    
    plugin_class = LocalPlugin
    
    #@    @+others
    #@+node:pap.20041006191803:getFilesMatching
    def getFilesMatching(self, location):
    
        """Return all the files matching the pattern"""
    
        return [filename for filename in self.getAllFiles(location)
                    if fnmatch.fnmatch(filename, "*.py")]
    #@nonl
    #@-node:pap.20041006191803:getFilesMatching
    #@+node:pap.20041006191803.1:getAllFiles
    def getAllFiles(self, location):
    
        """Return all the files in the location"""
    
        return [os.path.join(location, filename) for filename in os.listdir(location)]
    #@nonl
    #@-node:pap.20041006191803.1:getAllFiles
    #@-others
#@-node:pap.20041006190817:class LocalPluginCollection
#@+node:pap.20041006201849:class CVSPluginCollection
class CVSPluginCollection(PluginCollection):

    """Represents a plugin collection based located in a CVS repository"""
    
    plugin_class = CVSPlugin
    
    #@    @+others
    #@+node:pap.20041006202102:getFilesMatching
    def getFilesMatching(self, location):
        """Return all the files in the location"""
        #
        # Find files
        text = self.getListingPage(location)
        cvs_host, _, cvs_location = location.split("/", 2)
        filename = re.compile(r'href="/viewcvs.py/(%s)/(.*?\.py\?rev=.*?)\&view=auto"' % cvs_location)
        return [r"http://%s/viewcvs.py/*checkout*/%s/%s" % (cvs_host, item[0], item[1])
                    for item in filename.findall(text)]
    #@-node:pap.20041006202102:getFilesMatching
    #@+node:pap.20041006202703:getListingPage
    def getListingPage(self, location):
        """Return the HTML page with files listed"""
        #
        # Connect to CVS
        try:
            url = urllib.urlopen(r"http://%s" % location)
        except Exception, err:
            raise InvalidCollection("Could not get connection to CVS: %s" % err)
        #
        # Get the page with files listed
        try:
            try:
                text = url.read()
            finally:
                url.close()
        except Exception, err:
            raise InvalidCollection("Could not read from CVS: %s" % err)
        return text    
    #@nonl
    #@-node:pap.20041006202703:getListingPage
    #@+node:pap.20041009021201:setEnabledStateFrom
    def setEnabledStateFrom(self, collection):
        """Set the enabled state based on another collection"""
        for plugin in self.values():
            try:
                local_version = collection[plugin.name]
            except KeyError:
                plugin.enabled = "Not installed"
            else:
                if local_version.version < plugin.version:
                    plugin.enabled = "Update available"
                elif local_version.hash <> plugin.hash:
                    plugin.enabled = "Changed"
                else:
                    plugin.enabled = "Up to date"
    #@-node:pap.20041009021201:setEnabledStateFrom
    #@-others
#@-node:pap.20041006201849:class CVSPluginCollection
#@+node:pap.20041006232717:class EnableManager
class EnableManager:

    """Manages the enabled/disabled status of plugins"""
    
    #@    @+others
    #@+node:pap.20041006232717.1:initFrom
    def initFrom(self, location):
        """Initialize the manager from a folder"""
        manager_filename = os.path.join(location, "pluginsManager.txt")
        self.location = location
    
        # Get the text of the plugin manager file
        try:
            f = file(manager_filename, "r")
        except (IOError, OSError), err:
            raise InvalidManager("Unable to open plugin manager file '%s': %s" % 
                                    (manager_filename, err))
        try:
            try:
                self.text = text = f.read()
            finally:
                f.close()
        except Exception, err:
            raise InvalidManager("Unable to read manager file '%s': %s" % 
                                    (manager_filename, err))              
        self.parseManagerText(text)
    #@nonl
    #@-node:pap.20041006232717.1:initFrom
    #@+node:pap.20041009003552:writeFile
    def writeFile(self, location):
        """Initialize the manager from a folder"""
        manager_filename = os.path.join(location, "pluginsManager.txt")
    
        # Get the text of the plugin manager file
        try:
            f = file(manager_filename, "w")
        except (IOError, OSError), err:
            raise InvalidManager("Unable to open plugin manager file '%s': %s" % 
                                    (manager_filename, err))
        try:
            try:
                f.write(self.text)
            finally:
                f.close()
        except Exception, err:
            raise InvalidManager("Unable to write manager file '%s': %s" % 
                                    (manager_filename, err))              
        self.parseManagerText(self.text)
    #@nonl
    #@-node:pap.20041009003552:writeFile
    #@+node:pap.20041008200028:parseManagerText
    def parseManagerText(self, text):
        """Parse the text in the manager file"""
    
        # Regular expressions for scanning the file
        find_active = re.compile(r"^\s*(\w+)\.py", re.MULTILINE)
        find_inactive = re.compile(r"^\s*#\s*(\w+)\.py", re.MULTILINE)
        find_manager = re.compile(r"^\s*plugin_manager\.py", re.MULTILINE)
    
        if 1: # Put the first match in the starts dict.
            starts = {}
            for kind,iter in (
                ('on',find_active.finditer(text)),
                ('off',find_inactive.finditer(text)),
            ):
                for match in iter:
                    name = match.groups()[0]
                    start = match.start()
                    if start != -1:
                        bunch = starts.get(name)
                        if not bunch or bunch.start > start:
                          starts[name] = g.Bunch(
                            kind=kind,name=name,start=start,match=match)
                        
            self.actives = dict(
                [(bunch.name,bunch.match) for bunch in starts.values() if bunch.kind=='on'])
                
            self.inactives = dict(
                [(bunch.name,bunch.match) for bunch in starts.values() if bunch.kind=='off'])
                
            if 0: # debugging.
                starts2 = [(bunch.start,bunch.name,bunch.kind) for bunch in starts.values()]
                starts2.sort()
                g.trace(g.listToString(starts2,tag='starts2 list'))
                g.trace(g.dictToString(self.actives,tag='Active Plugins'))
                      
        else: # Original code.
            # Get active plugin defintions
            self.actives = dict([(match.groups()[0], match) 
                for match in find_active.finditer(text)])
        
            # Get inactive plugin definitions
            self.inactives = dict([(match.groups()[0], match) 
                for match in find_inactive.finditer(text)])
    
        # List of all plugins
        self.all = {}
        self.all.update(self.actives)
        self.all.update(self.inactives)
    
        # Locaction of the plugin_manager.py plugin - this is where
        # we add additional files
        self.manager = find_manager.search(text)
    #@nonl
    #@-node:pap.20041008200028:parseManagerText
    #@+node:pap.20041008234256:updateState
    def updateState(self, plugin):
        """Update the state for the given plugin"""
        # Get the filename for the new entry
        if plugin.enabled == "On":
            newentry = "%s.py" % plugin.name
        else:
            newentry = "#%s.py" % plugin.name 
    
        if plugin.name in self.all:
            # Plugin exists in the management file
            item = self.all[plugin.name]
            # TODO: Unicode issues with the following line??
            self.text = "%s%s%s" % (
                self.text[:item.start()],
                str(newentry),
                self.text[item.end():])      
        else:
            # Plugin doesn't exist - add it at a suitale place
            self.text = "%s%s\n%s" % (
                self.text[:self.manager.start()],
                str(newentry),
                self.text[self.manager.start():])
    
        self.writeFile(self.location)
    #@nonl
    #@-node:pap.20041008234256:updateState
    #@-others
#@nonl
#@-node:pap.20041006232717:class EnableManager
#@-node:pap.20041009140132.1:Implementation
#@-others

if __name__ == "__main__":
    if ok:
        g.createStandAloneApp(pluginName=__name__)
        topLevelMenu()
#@nonl
#@-node:pap.20041006184225:@thin leoSwingPluginManager.py
#@-leo
