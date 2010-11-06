#@+leo-ver=4-thin
#@+node:pap.20041006184225:@thin plugin_manager.py
"""
A plugin to manage Leo's Plugins:

- Enables and disables plugins.
- Shows plugin details.
- Checks for conflicting hook handlers.
- Checks for and updates plugins from the web.
"""

__version__ = "0.5"
__plugin_name__ = "Plugin Manager"
__plugin_priority__ = 10000
__plugin_requires__ = ["plugin_menu"]

#@<< version history >>
#@+node:pap.20041006184225.2:<< version history >>
#@+at
# 
# 0.1 Paul Paterson: - Initial version
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
#@-at
#@nonl
#@-node:pap.20041006184225.2:<< version history >>
#@nl
#@<< imports >>
#@+node:pap.20041006184225.3:<< imports >>
import leoGlobals as g
import leoPlugins

import os
import sys

Pmw = g.importExtension("Pmw",    pluginName=__name__,verbose=True)
Tk  = g.importExtension('Tkinter',pluginName=__name__,verbose=True)

import fnmatch
import re
import sha
import urllib
import threading
import webbrowser
import sets
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
#@+node:ekr.20041231134702:topLevelMenu
def topLevelMenu():
    # This is called from plugins_menu plugin.
    # It should only be defined if the extension has been registered.
    """Manage the plugins"""
    dlg = ManagerDialog()
#@nonl
#@-node:ekr.20041231134702:topLevelMenu
#@+node:pap.20041006193459:Error Classes
class InvalidPlugin(Exception):
    """The plugin is invalid"""
    
class InvalidCollection(Exception):
    """The plugin collection is invalid"""
    
class InvalidManager(Exception):
    """The enable manager is invalid"""
#@-node:pap.20041006193459:Error Classes
#@+node:pap.20041009140132:UI
#@+node:pap.20041008224318:class PluginView
class PluginView(Tk.Frame):
    """Frame to display a plugin's information"""
    
    #@    @+others
    #@+node:pap.20041008224318.1:PluginView.__init__
    def __init__(self, parent, *args, **kw):
        """Initialize the view"""
        Tk.Frame.__init__(self, parent, *args, **kw)
    
        self.top = Tk.Frame(self)
        self.top.pack(side="top", fill="both", expand=1)
        self.bottom = Tk.Frame(self)
        self.bottom.pack(side="top", fill="both")
        
        #@    @+others
        #@+node:pap.20041008230728:Name
        self.name = Pmw.EntryField(self.top,
                labelpos = 'w',
                label_text = 'Name:',
        )
        
        self.name.pack(side="top", fill="x", expand=0)
        #@nonl
        #@-node:pap.20041008230728:Name
        #@+node:pap.20041008230728.2:Version
        self.version = Pmw.EntryField(self.top,
                labelpos = 'w',
                label_text = 'Version:',
        )
        
        self.version.pack(side="top", fill="x", expand=0)
        #@-node:pap.20041008230728.2:Version
        #@+node:pap.20041008231028:Status
        self.status = Pmw.EntryField(self.top,
                labelpos = 'w',
                label_text = 'Status:',
        )
        
        self.status.pack(side="top", fill="x", expand=0)
        #@-node:pap.20041008231028:Status
        #@+node:pap.20041008230728.1:Filename
        self.filename = Pmw.EntryField(self.top,
                labelpos = 'w',
                label_text = 'Filename:',
        )
        
        self.filename.pack(side="top", fill="x", expand=0)
        #@-node:pap.20041008230728.1:Filename
        #@+node:pap.20041008231930:Has INI
        self.has_ini = Pmw.EntryField(self.top,
                labelpos = 'w',
                label_text = 'Has INI:',
        )
        
        self.has_ini.pack(side="top", fill="x", expand=0)
        #@nonl
        #@-node:pap.20041008231930:Has INI
        #@+node:pap.20041009135426:Has Top level
        self.has_toplevel = Pmw.EntryField(self.top,
                labelpos = 'w',
                label_text = 'Has top level:',
        )
        
        self.has_toplevel.pack(side="top", fill="x", expand=0)
        #@nonl
        #@-node:pap.20041009135426:Has Top level
        #@+node:pap.20041009135426.1:Priority
        if USE_PRIORITY:
            self.priority = Pmw.EntryField(self.top,
                labelpos = 'w',
                label_text = 'Priority:',
            )
            
            self.priority.pack(side="top", fill="x", expand=0)
        #@nonl
        #@-node:pap.20041009135426.1:Priority
        #@+node:pap.20041008231028.1:Description
        self.description = Pmw.ScrolledText(self.top,
                # borderframe = 1,
                labelpos = 'n',
                label_text='Plugin Description',
                columnheader = 0,
                rowheader = 0,
                rowcolumnheader = 0,
                usehullsize = 1,
                hull_width = 300,
                hull_height = 300,
                text_wrap='word',
                text_padx = 4,
                text_pady = 4,
        )
        self.description.pack(side="top", fill='both', expand=1)
        #@-node:pap.20041008231028.1:Description
        #@+node:pap.20041008231028.2:Commands
        self.commands = Pmw.ScrolledListBox(self.bottom,
                labelpos='n',
                label_text='Commands',
                listbox_height = 6,
                usehullsize = 1,
                hull_width = 150,
                hull_height = 100,
        )
        
        self.commands.pack(side="left", fill='both', expand=1)
        #@-node:pap.20041008231028.2:Commands
        #@+node:pap.20041008231028.3:Handlers
        self.handlers = Pmw.ScrolledListBox(self.bottom,
                labelpos='n',
                label_text='Hooks',
                listbox_height = 6,
                usehullsize = 1,
                hull_width = 150,
                hull_height = 100,
        )
        
        self.handlers.pack(side="left", fill='both', expand=1)
        #@-node:pap.20041008231028.3:Handlers
        #@+node:pap.20041009224739:Requires
        self.requires = Pmw.ScrolledListBox(self.bottom,
                labelpos='n',
                label_text='Requires',
                listbox_height = 6,
                usehullsize = 1,
                hull_width = 150,
                hull_height = 100,
        )
        
        self.requires.pack(side="left", fill='both', expand=1)
        #@-node:pap.20041009224739:Requires
        #@-others
        
        if USE_PRIORITY:
            Pmw.alignlabels([
                self.name, self.version, self.status,
                self.filename, self.has_ini, self.has_toplevel,
                self.priority, 
            ])
        else:
             Pmw.alignlabels([
                self.name, self.version, self.status,
                self.filename, self.has_ini, self.has_toplevel,
            ])
    #@nonl
    #@-node:pap.20041008224318.1:PluginView.__init__
    #@+node:pap.20041008224625:showPlugin
    def showPlugin(self, plugin):
        """Show a plugin"""
        self.name.setentry(plugin.name)
        self.version.setentry(plugin.version)
        self.filename.setentry(g.os_path_abspath(plugin.filename)) # EKR
        self.status.setentry(plugin.enabled)
        self.has_ini.setentry(
            g.choose(plugin.has_config,"Yes","No"))
        self.has_toplevel.setentry(
            g.choose(plugin.has_toplevel,"Yes","No"))
        if USE_PRIORITY:
            self.priority.setentry(plugin.priority)
        self.description.settext(plugin.description.strip())
        self.commands.setlist(plugin.commands)
        self.handlers.setlist(plugin.handlers)
        self.requires.setlist(plugin.requires)
    #@nonl
    #@-node:pap.20041008224625:showPlugin
    #@-others
#@-node:pap.20041008224318:class PluginView
#@+node:pap.20041008225226:class PluginList
class PluginList(Tk.Frame):
    """Frame to display a list of plugins"""
    
    filter_options = []
    title = "List"
    
    #@    @+others
    #@+node:pap.20041008225226.1:__init__
    def __init__(self, parent, plugin_view, plugins, *args, **kw):
        """Initialize the list"""
        Tk.Frame.__init__(self, parent, *args, **kw)
        
        self.box = Pmw.ScrolledListBox(self,
                labelpos='nw',
                label_text='Plugins:',
                listbox_height = 6,
                selectioncommand=self.onClick,
                dblclickcommand=self.onDblClick,
                usehullsize = 1,
                hull_width = 300,
                hull_height = 200,
        )
        
        self.filter = Pmw.OptionMenu(self,
                labelpos = 'w',
                label_text = '%s:' % self.title,
                items = self.filter_options,
                menubutton_width = 16,
                command=self.populateList,
        )    
        
        self.filter.pack(side="top")
        self.box.pack(side="bottom", fill='both', expand=1)    
        
        self.plugin_view = plugin_view
        self.plugins = plugins
    #@nonl
    #@-node:pap.20041008225226.1:__init__
    #@+node:pap.20041006215903:onClick
    def onClick(self):
        """Select an item in the list"""
        sels = self.box.getcurselection()
        if len(sels) == 0:
            pass
        else:
            self.plugin_view.showPlugin(self.local_dict[sels[0]])
    #@nonl
    #@-node:pap.20041006215903:onClick
    #@+node:pap.20041006220101:onDblClick
    def onDblClick(self):
        """Double click an item in the list"""
        sels = self.box.getcurselection()
        if len(sels) == 0:
            g.es('No selection')
        else:
            g.es('DoubleClick:', sels[0]) 
    #@nonl
    #@-node:pap.20041006220101:onDblClick
    #@+node:pap.20041008223406:populateList
    def populateList(self, filter=None):
        """Populate the plugin list"""
        if not self.plugins:
            self.box.setlist([])
            return
        if filter is None:
            filter = self.filter.getcurselection()
        #
        # Get old selection so that we can restore it    
        current_text = self.box.getcurselection()
        if current_text:
            current_index = self.listitems.index(current_text[0])
        #
        # Show the list
        self.local_dict = dict([(self.plugins[name].asString(), self.plugins[name])
                                    for name in self.plugins])
        self.listitems = [self.plugins[name].asString() 
                            for name in self.plugins.sortedNames()
                            if filter in ("All", self.plugins[name].enabled)]
        self.box.setlist(self.listitems)    
        #
        if current_text:
            try:
                self.box.setvalue((self.listitems[current_index],))
                self.box.component("listbox").see(current_index)
            except IndexError:
                pass # Sometimes the list is just different!
            else:
                self.onClick()
    #@nonl
    #@-node:pap.20041008223406:populateList
    #@+node:pap.20041008233733:getSelectedPlugin
    def getSelectedPlugin(self):
        """Return the selected plugin"""
        sels = self.box.getcurselection()
        if len(sels) == 0:
            return None
        else:
            return self.local_dict[sels[0]]
    #@-node:pap.20041008233733:getSelectedPlugin
    #@-others
    


#@-node:pap.20041008225226:class PluginList
#@+node:pap.20041009013256:class LocalPluginList
class LocalPluginList(PluginList):
    """A list showing plugins based on the local file system"""
    
    title = "Locally Installed Plugins"
    filter_options = ['All', 'Active', 'Inactive', 'Not referenced']
#@nonl
#@-node:pap.20041009013256:class LocalPluginList
#@+node:pap.20041009013556:class RemotePluginList
class RemotePluginList(PluginList):
    """A list showing plugins based on a remote file system"""
    
    title = "Plugins on CVS"
    filter_options = ['All', 'Up to date', 'Update available', 'Changed', 'Not installed']
#@nonl
#@-node:pap.20041009013556:class RemotePluginList
#@+node:pap.20041006215108:class ManagerDialog
class ManagerDialog:
    """The dialog to show manager functions"""
    
    #@    @+others
    #@+node:pap.20041006215108.1:ManagerDialog._init__
    def __init__(self):
        """Initialise the dialog"""
        
        #@    << create top level window >>
        #@+node:ekr.20041010110321:<< create top level window >>
        root = g.app.root
        self.top = top = Tk.Toplevel(root)
        g.app.gui.attachLeoIcon(self.top)
        top.title("Plugin Manager")
        #@nonl
        #@-node:ekr.20041010110321:<< create top level window >>
        #@nl
        self.initLocalCollection()
        #@    << create frames >>
        #@+node:ekr.20041010110321.1:<< create frames >>
        self.frame = frame = Tk.Frame(top)
        frame.pack(side="top", fill='both', expand=1, padx=5, pady=5)   
        
        self.upper = Tk.Frame(frame)
        self.upper.pack(side="top", fill='both', expand=1, padx=5, pady=5)
         
        self.lower = Tk.Frame(frame)
        self.lower.pack(side="top", fill='x', expand=0, padx=5)
        #@nonl
        #@-node:ekr.20041010110321.1:<< create frames >>
        #@nl
        #@    << create pluginView >>
        #@+node:pap.20041006223915.1:<< create pluginView >>
        self.plugin_view = PluginView(self.upper)
        self.plugin_view.pack(side="right", fill='both', expand=1, padx=5, pady=5)
        #@nonl
        #@-node:pap.20041006223915.1:<< create pluginView >>
        #@nl
        #@    << create PluginList >>
        #@+node:pap.20041006223915:<< create PluginList >>
        self.notebook = notebook = Pmw.NoteBook(self.upper)
        notebook.pack(side="left", fill='both', expand=1, padx=5, pady=5)
        
        self.local_list_page = local_list_page = notebook.add('Installed Plugins')
        self.remote_list_page = remote_list_page = notebook.add('CVS Plugins')
        notebook.tab('Installed Plugins').focus_set()
        #notebook.setnaturalsize()
        
        self.plugin_list = LocalPluginList(local_list_page, self.plugin_view, self.local)
        self.plugin_list.pack(side="top", fill='both', expand=1)
        self.remote_plugin_list = RemotePluginList(remote_list_page, self.plugin_view, None)
        self.remote_plugin_list.pack(side="top", fill='both', expand=1)
        #@nonl
        #@-node:pap.20041006223915:<< create PluginList >>
        #@nl
        #@    << create local buttons >>
        #@+node:pap.20041006223915.2:<< create local buttons >>
        self.buttonBox = Pmw.ButtonBox(
            self.local_list_page,
            labelpos = 'nw',
            frame_borderwidth = 2,
            frame_relief = 'groove')
        
        # Add some buttons to the ButtonBox.
        self.buttonBox.add('Enable', command = self.enablePlugin)
        self.buttonBox.add('Disable', command = self.disablePlugin)
        #self.buttonBox.add('Check for Updates', command = self.checkUpdates)
        self.buttonBox.add('Check Conflicts', command = self.checkConflicts)
        
        self.buttonBox.pack(side="top", padx=5)
        #@nonl
        #@-node:pap.20041006223915.2:<< create local buttons >>
        #@nl
        #@    << create remote buttons >>
        #@+node:pap.20041009020000:<< create remote buttons >>
        self.buttonBox = Pmw.ButtonBox(
            self.remote_list_page,
            labelpos = 'nw',
            frame_borderwidth = 2,
            frame_relief = 'groove')
        
        # Add some buttons to the ButtonBox.
        self.buttonBox.add('Install', command = self.installPlugin)
        self.buttonBox.add('View', command = self.viewPlugin)
        self.buttonBox.add('Check for Updates', command = self.checkUpdates)
        
        self.buttonBox.pack(side="top", padx=5)
        #@nonl
        #@-node:pap.20041009020000:<< create remote buttons >>
        #@nl
        #@    << create message bar >>
        #@+node:pap.20041006224808:<< create message bar >>
        self.messagebar = Pmw.MessageBar(self.lower,
                entry_width = 40,
                entry_relief='groove',
                labelpos = 'w',
                label_text = 'Status:')
        
        self.messagebar.pack(side="top", fill='x', expand=1, padx=5, pady=1)
        #@-node:pap.20041006224808:<< create message bar >>
        #@nl
        self.plugin_list.populateList("All")
        
        top.grab_set() # Make the dialog a modal dialog.
        top.focus_force() # Get all keystrokes.
        root.wait_window(top)
    #@nonl
    #@-node:pap.20041006215108.1:ManagerDialog._init__
    #@+node:pap.20041006224151:enablePlugin
    def enablePlugin(self):
        """Enable a plugin"""
        plugin = self.plugin_list.getSelectedPlugin()
        if not plugin: return
        
        self.local.enablePlugin(plugin,self.enable)
        self.plugin_list.populateList()
    #@nonl
    #@-node:pap.20041006224151:enablePlugin
    #@+node:pap.20041006224206:disablePlugin
    def disablePlugin(self):
        """Disable a plugin"""
        plugin = self.plugin_list.getSelectedPlugin()
        if not plugin: return
        
        self.local.disablePlugin(plugin,self.enable)
        self.plugin_list.populateList()
    #@nonl
    #@-node:pap.20041006224206:disablePlugin
    #@+node:pap.20041006221212:initLocalCollection
    def initLocalCollection(self):
        """Initialize the local plugin collection"""
    
        # Get the local plugins information
        self.local = LocalPluginCollection()
        self.local.initFrom(g.os_path_join(g.app.loadDir,"..","plugins"))
    
        # Get the active status of the plugins
        self.enable = EnableManager()
        self.enable.initFrom(g.os_path_join(g.app.loadDir,"..","plugins"))
        self.local.setEnabledStateFrom(self.enable)
        
    #@nonl
    #@-node:pap.20041006221212:initLocalCollection
    #@+node:pap.20041006224216:checkUpdates
    def checkUpdates(self):
        """Check for updates"""
        url = r"cvs.sourceforge.net/viewcvs.py/leo/leo/plugins"
        self.status_message = "Searching for plugin list"
        self.messagebar.message("busy", "Searching for plugin list")
        #@    << define callbackPrint >>
        #@+node:ekr.20041010111700.1:<< define callbackPrint >>
        def callbackPrint(text):
            """A callback to send status information"""
            self.remote_plugin_list.populateList() 
            self.messagebar.message("busy", text)
            self.top.update()
        #@nonl
        #@-node:ekr.20041010111700.1:<< define callbackPrint >>
        #@nl
        self.remote = CVSPluginCollection()
        self.remote_plugin_list.plugins = self.remote
        try: 
            errors = self.remote.initFrom(url,callbackPrint)    
        except Exception, err:
            #@        << put up a  connection failed dialog >>
            #@+node:pap.20041009163613:<< put up a connection failed dialog >>
            dialog = Pmw.MessageDialog(self.top,
                title = 'CVS Error',
                defaultbutton = 0,
                message_text = 'Error retrieving CVS plugin information: %s' % err)
            dialog.iconname('CVS')      
            dialog.activate()
            #@-node:pap.20041009163613:<< put up a connection failed dialog >>
            #@nl
        else:
            if errors:
                #@            << put up a file error dialog >>
                #@+node:pap.20041009163613.1:<< put up a file error dialog >>
                #@@c
                
                dialog = ListReportDialog('CVS File Errors',
                                          'Errors',
                                          ["%s - %s" % item for item in errors],
                                          500)
                
                #@-node:pap.20041009163613.1:<< put up a file error dialog >>
                #@nl
        self.messagebar.resetmessages('busy')        
        self.remote.setEnabledStateFrom(self.local)
        self.remote_plugin_list.populateList()     
    #@nonl
    #@-node:pap.20041006224216:checkUpdates
    #@+node:pap.20041009020000.1:installPlugin
    def installPlugin(self):
        """Install the selected plugin"""
    
        # Write the file
        plugin = self.remote_plugin_list.getSelectedPlugin()        
        if not plugin: return
    
        self.messagebar.message("busy", "Writing file")
        plugin.writeTo(g.os_path_join(g.app.loadDir,"..","plugins"))
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
    #@nonl
    #@-node:pap.20041009020000.1:installPlugin
    #@+node:pap.20041009020000.2:viewPlugin
    def viewPlugin(self):
        """View the selected plugin in a web browser"""
        plugin = self.remote_plugin_list.getSelectedPlugin()
        if plugin:
            webbrowser.open(plugin.getViewFilename())
    #@nonl
    #@-node:pap.20041009020000.2:viewPlugin
    #@+node:pap.20041009025708:checkConflicts
    def checkConflicts(self):
        """Check for plugin conflicts"""
        plugin = self.plugin_list.getSelectedPlugin() 
        if not plugin:
            return 
        conflicts = self.local.getConflicts(plugin)
        if not conflicts:
            dialog = Pmw.MessageDialog(self.top,
                title = 'No conflicts',
                defaultbutton = 0,
                message_text = 'There are no conflicts for %s.' % plugin.name)
            dialog.iconname('Conflicts')
            dialog.activate()
        else:
            dialog = ListReportDialog(
                'Potential Conflicts for %s' % plugin.name,
                'Conflicts',
                ["%s - %s" % (item[1], item[0]) for item in conflicts],
                400)
    #@nonl
    #@-node:pap.20041009025708:checkConflicts
    #@-others
#@nonl
#@-node:pap.20041006215108:class ManagerDialog
#@+node:pap.20041009233937:class ListReportDialog
class ListReportDialog:
    """Shows a list of items to report to the user
    
    The list is a list of strings. It is assumed that the
    strings are of the format 'abc - xyz' and this control
    presents a filter list based on the list of distinct 
    values for abc.
    
    """
    
    #@    @+others
    #@+node:pap.20041009233937.1:ListReportDialog.__init__
    def __init__(self, title, name, list_data, width=300):
        """Initialize the dialog"""
        
        #@    << create the top level frames >>
        #@+node:ekr.20041010111700:<< create the top level frames >>
        root = g.app.root
        self.top = top = Tk.Toplevel(root)
        g.app.gui.attachLeoIcon(self.top)
        top.title(title)
        
        self.frame = frame = Tk.Frame(top)
        frame.pack(side="top", fill='both', expand=1, padx=5, pady=5)
        #@nonl
        #@-node:ekr.20041010111700:<< create the top level frames >>
        #@nl
        filter_options = self.getFilterOptions(list_data)
        self.list_data = list_data
        #@    << create the ScrolledListBox >>
        #@+node:pap.20041009234256:<< create the ScrolledListBox >>
        self.box = Pmw.ScrolledListBox(frame,
                labelpos='nw',
                label_text=name,
                listbox_height = 6,
                usehullsize = 1,
                hull_width = width,
                hull_height = 200,
                items = list_data,
        )
        
        self.box.pack(side="bottom", fill='both', expand=1)    
        #@nonl
        #@-node:pap.20041009234256:<< create the ScrolledListBox >>
        #@nl
        #@    << create the OptionMenu >>
        #@+node:pap.20041009234256.1:<< create the OptionMenu >>
        self.filter = Pmw.OptionMenu(frame,
                labelpos = 'w',
                label_text = 'Filter:',
                items = filter_options,
                menubutton_width = 16,
                command=self.populateList,
        )    
        
        self.filter.pack(side="top")
        #@nonl
        #@-node:pap.20041009234256.1:<< create the OptionMenu >>
        #@nl
            
        top.grab_set() # Make the dialog a modal dialog.
        top.focus_force() # Get all keystrokes.
        root.wait_window(top)
    #@-node:pap.20041009233937.1:ListReportDialog.__init__
    #@+node:pap.20041009234850:getFilterOptions
    def getFilterOptions(self, list_data):
        """Return a list of filter items"""
        names = sets.Set()
        for item in list_data:
            names.add(item.split(" - ")[0].strip())
        name_list = list(names)
        name_list.sort()
        return ["All"] + name_list
    #@nonl
    #@-node:pap.20041009234850:getFilterOptions
    #@+node:pap.20041009235457:populateList
    def populateList(self, filter):
        """Populate the list"""
    
        # Get old selection so that we can restore it    
        current_text = self.box.getcurselection()
        if current_text:
            current_index = self.list_data.index(current_text[0])
    
        listitems = [item for item in self.list_data
            if item.startswith("%s -" % filter) or filter == "All"]
    
        self.box.setlist(listitems)    
    
        if current_text:
            try:
                self.box.setvalue((listitems[current_index],))
                self.box.component("listbox").see(current_index)
            except IndexError:
                pass # Sometimes the list is just different!
    #@-node:pap.20041009235457:populateList
    #@-others
#@-node:pap.20041009233937:class ListReportDialog
#@-node:pap.20041009140132:UI
#@+node:pap.20041009140132.1:Implementation
#@+node:pap.20041006184225.6:class Plugin
class Plugin:   
    """Represents a single plugin instance"""
    
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
        
    #@nonl
    #@-node:pap.20041006185727.1:__init__
    #@+node:pap.20041006193013:initFrom
    def initFrom(self, location):
        """Initialize the plugin from the specified location"""
    
        # Initial properties
        self.filename = location
        self.name = self.getName(location)
    
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
    #@+node:pap.20041006194759:getDetails
    def getDetails(self, text):
        """Get the details of the plugin
        
        We look for
            __version__
            hooks
            config
            commands
        """
        self.is_plugin = self.hasImport(text, "leoPlugins") 
        self.version = self.getPattern(text, r'__version__\s*=\s*"(.*?)"', "-")
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
        self.handlers = sets.Set(self.getPatterns(text, r'registerHandler\("(.*?)"'))
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
            return "%(enabled)s - %(name)s (v%(version)s)" % self.__dict__
        else:
            return (
                "Name: %(name)s\n"
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
    #@nonl
    #@-node:pap.20041009023004:writeTo
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
        #@@c
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
        #@@c
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
        #@@c
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
        
        # g.trace('local')
    
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
        return text
    #@nonl
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
         
         # g.trace('cvs')
     
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
        if callback: callback("Looking for list of plugins")
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
    
        """Return a list of the plugin names sorted alphabetically"""
    
        names = [item.name for item in self.values()]
        names.sort()
        return names
    #@nonl
    #@-node:pap.20041006221438:sortedNames
    #@+node:pap.20041008220723:setEnabledStateFrom
    def setEnabledStateFrom(self, enabler):
    
        """Set the enabled state of each plugin using the enabler object"""
        for name in self:
            if name in enabler.actives:
                self[name].enabled = "Active"
            elif name in enabler.inactives:
                self[name].enabled = "Inactive" 
            else:
                self[name].enabled = "Not referenced"
    #@nonl
    #@-node:pap.20041008220723:setEnabledStateFrom
    #@+node:pap.20041008233947:enablePlugin
    def enablePlugin(self, plugin, enabler):
        """Enable a plugin"""
        plugin.enabled = "Active"
        enabler.updateState(plugin)
    #@nonl
    #@-node:pap.20041008233947:enablePlugin
    #@+node:pap.20041008234033:disablePlugin
    def disablePlugin(self, plugin, enabler):
        """Enable a plugin"""
        plugin.enabled = "Inactive"
        enabler.updateState(plugin)
    #@nonl
    #@-node:pap.20041008234033:disablePlugin
    #@+node:pap.20041009025708.1:getConflicts
    def getConflicts(self, plugin):
    
        """Find conflicting hook handlers for this plugin"""
    
        conflicts = []
        for this_plugin in self.values():
            if this_plugin.name <> plugin.name:
                for conflict in plugin.handlers.intersection(this_plugin.handlers):
                    conflicts.append((this_plugin.name, conflict))
    
        return conflicts
            
    #@nonl
    #@-node:pap.20041009025708.1:getConflicts
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
                ('active',find_active.finditer(text)),
                ('inactive',find_inactive.finditer(text)),
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
                [(bunch.name,bunch.match) for bunch in starts.values() if bunch.kind=='active'])
                
            self.inactives = dict(
                [(bunch.name,bunch.match) for bunch in starts.values() if bunch.kind=='inactive'])
                
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
        if plugin.enabled == "Active":
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
    
        self.writeFile(g.os_path_join(g.app.loadDir,"..","plugins"))
    #@nonl
    #@-node:pap.20041008234256:updateState
    #@-others
#@nonl
#@-node:pap.20041006232717:class EnableManager
#@-node:pap.20041009140132.1:Implementation
#@-others

if Tk and Pmw: # Ok for unit testing: adds menu.
    g.plugin_signon(__name__)
#@nonl
#@-node:pap.20041006184225:@thin plugin_manager.py
#@-leo
