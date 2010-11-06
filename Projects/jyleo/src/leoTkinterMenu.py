#@+leo-ver=4-thin
#@+node:ekr.20031218072017.4100:@thin leoTkinterMenu.py
"""Tkinter menu handling for Leo."""

#@@language python
#@@tabwidth -4  
#@@pagewidth 80

import leoGlobals as g
import leoMenu
import Tkinter as Tk

class leoTkinterMenu (leoMenu.leoMenu):
    """A class that represents a Leo window."""
    #@    @+others
    #@+node:ekr.20031218072017.4101:Birth & death
    #@+node:ekr.20031218072017.4102:leoTkinterMenu.__init__
    def __init__ (self,frame):
        
        # Init the base class.
        leoMenu.leoMenu.__init__(self,frame)
        
        self.top = frame.top
        self.c = frame.c
        self.frame = frame
    #@nonl
    #@-node:ekr.20031218072017.4102:leoTkinterMenu.__init__
    #@-node:ekr.20031218072017.4101:Birth & death
    #@+node:ekr.20031218072017.4103:Tkinter menu bindings
    # See the Tk docs for what these routines are to do
    #@nonl
    #@+node:ekr.20031218072017.4104:9 Routines with Tk spellings
    #@+node:ekr.20031218072017.4105:add_cascade
    def add_cascade (self,parent,label,menu,underline):
        
        """Wrapper for the Tkinter add_cascade menu method."""
        
        return parent.add_cascade(label=label,menu=menu,underline=underline)
    
    #@-node:ekr.20031218072017.4105:add_cascade
    #@+node:ekr.20031218072017.4106:add_command
    def add_command (self,menu,**keys):
        
        """Wrapper for the Tkinter add_command menu method."""
    
        return menu.add_command(**keys)
        
    #@-node:ekr.20031218072017.4106:add_command
    #@+node:ekr.20031218072017.4107:add_separator
    def add_separator(self,menu):
        
        """Wrapper for the Tkinter add_separator menu method."""
    
        menu.add_separator()
        
    #@-node:ekr.20031218072017.4107:add_separator
    #@+node:ekr.20031218072017.4108:bind
    def bind (self,bind_shortcut,callback):
        
        """Wrapper for the Tkinter bind menu method."""
    
        return self.top.bind(bind_shortcut,callback)
        
    #@-node:ekr.20031218072017.4108:bind
    #@+node:ekr.20031218072017.4109:delete
    def delete (self,menu,realItemName):
        
        """Wrapper for the Tkinter delete menu method."""
    
        return menu.delete(realItemName)
    #@nonl
    #@-node:ekr.20031218072017.4109:delete
    #@+node:ekr.20031218072017.4110:delete_range
    def delete_range (self,menu,n1,n2):
        
        """Wrapper for the Tkinter delete menu method."""
    
        return menu.delete(n1,n2)
    
    #@-node:ekr.20031218072017.4110:delete_range
    #@+node:ekr.20031218072017.4111:destroy
    def destroy (self,menu):
        
        """Wrapper for the Tkinter destroy menu method."""
    
        return menu.destroy()
    
    #@-node:ekr.20031218072017.4111:destroy
    #@+node:ekr.20031218072017.4112:insert_cascade
    def insert_cascade (self,parent,index,label,menu,underline):
        
        """Wrapper for the Tkinter insert_cascade menu method."""
        
        return parent.insert_cascade(
            index=index,label=label,
            menu=menu,underline=underline)
    
    
    #@-node:ekr.20031218072017.4112:insert_cascade
    #@+node:ekr.20031218072017.4113:new_menu
    def new_menu(self,parent,tearoff=False):
        
        """Wrapper for the Tkinter new_menu menu method."""
    
        return Tk.Menu(parent,tearoff=tearoff)
    #@nonl
    #@-node:ekr.20031218072017.4113:new_menu
    #@-node:ekr.20031218072017.4104:9 Routines with Tk spellings
    #@+node:ekr.20031218072017.4114:8 Routines with other spellings
    #@+node:ekr.20041228063406:clearAccel
    def clearAccel(self,menu,name):
        
        realName = self.getRealMenuName(name)
        realName = realName.replace("&","")
    
        menu.entryconfig(realName,accelerator='')
    #@nonl
    #@-node:ekr.20041228063406:clearAccel
    #@+node:ekr.20031218072017.4115:createMenuBar
    def createMenuBar(self,frame):
    
        top = frame.top
        topMenu = Tk.Menu(top,postcommand=self.updateAllMenus)
        
        # Do gui-independent stuff.
        self.setMenu("top",topMenu)
        self.createMenusFromTables()
        
        top.config(menu=topMenu) # Display the menu.
    #@nonl
    #@-node:ekr.20031218072017.4115:createMenuBar
    #@+node:ekr.20031218072017.4116:createOpenWithMenuFromTable
    #@+at 
    #@nonl
    # Entries in the table passed to createOpenWithMenuFromTable are
    # tuples of the form (commandName,shortcut,data).
    # 
    # - command is one of "os.system", "os.startfile", "os.spawnl", 
    # "os.spawnv" or "exec".
    # - shortcut is a string describing a shortcut, just as for 
    # createMenuItemsFromTable.
    # - data is a tuple of the form (command,arg,ext).
    # 
    # Leo executes command(arg+path) where path is the full path to the temp 
    # file.
    # If ext is not None, the temp file has the given extension.
    # Otherwise, Leo computes an extension based on the @language directive in 
    # effect.
    #@-at
    #@@c
    
    def createOpenWithMenuFromTable (self,table):
    
        g.app.openWithTable = table # Override any previous table.
        # Delete the previous entry.
        parent = self.getMenu("File")
        label = self.getRealMenuName("Open &With...")
        amp_index = label.find("&")
        label = label.replace("&","")
        try:
            index = parent.index(label)
            parent.delete(index)
        except:
            try:
                index = parent.index("Open With...")
                parent.delete(index)
            except: return
        # Create the "Open With..." menu.
        openWithMenu = Tk.Menu(parent,tearoff=0)
        self.setMenu("Open With...",openWithMenu)
        parent.insert_cascade(index,label=label,menu=openWithMenu,underline=amp_index)
        # Populate the "Open With..." menu.
        shortcut_table = []
        for triple in table:
            if len(triple) == 3: # 6/22/03
                shortcut_table.append(triple)
            else:
                g.es("createOpenWithMenuFromTable: invalid data",color="red")
                return
                
        # for i in shortcut_table: print i
        self.createMenuItemsFromTable("Open &With...",shortcut_table,openWith=True)
    #@-node:ekr.20031218072017.4116:createOpenWithMenuFromTable
    #@+node:ekr.20031218072017.4117:defineMenuCallback (tk)
    def defineMenuCallback(self,command,name):
        
        # The first parameter must be event, and it must default to None.
        def callback(event=None,self=self,command=command,label=name):
            return self.c.doCommand(command,label,event)
    
        return callback
    #@nonl
    #@-node:ekr.20031218072017.4117:defineMenuCallback (tk)
    #@+node:ekr.20031218072017.4118:defineOpenWithMenuCallback
    def defineOpenWithMenuCallback(self,command):
        
        # The first parameter must be event, and it must default to None.
        def callback(event=None,self=self,data=command):
            return self.c.openWith(data=data)
    
        return callback
    #@nonl
    #@-node:ekr.20031218072017.4118:defineOpenWithMenuCallback
    #@+node:ekr.20031218072017.4119:disableMenu
    def disableMenu (self,menu,name):
        
        try:
            menu.entryconfig(name,state="disabled")
        except: 
            try:
                realName = self.getRealMenuName(name)
                realName = realName.replace("&","")
                menu.entryconfig(realName,state="disabled")
            except:
                print "disableMenu menu,name:",menu,name
                g.es_exception()
                pass
    #@-node:ekr.20031218072017.4119:disableMenu
    #@+node:ekr.20031218072017.4120:enableMenu
    # Fail gracefully if the item name does not exist.
    
    def enableMenu (self,menu,name,val):
        
        state = g.choose(val,"normal","disabled")
        try:
            menu.entryconfig(name,state=state)
        except:
            try:
                realName = self.getRealMenuName(name)
                realName = realName.replace("&","")
                menu.entryconfig(realName,state=state)
            except:
                print "enableMenu menu,name,val:",menu,name,val
                g.es_exception()
                pass
    #@nonl
    #@-node:ekr.20031218072017.4120:enableMenu
    #@+node:ekr.20031218072017.4121:setMenuLabel
    def setMenuLabel (self,menu,name,label,underline=-1):
    
        try:
            if type(name) == type(0):
                # "name" is actually an index into the menu.
                menu.entryconfig(name,label=label,underline=underline)
            else:
                # Bug fix: 2/16/03: use translated name.
                realName = self.getRealMenuName(name)
                realName = realName.replace("&","")
                # Bug fix: 3/25/03" use tranlasted label.
                label = self.getRealMenuName(label)
                label = label.replace("&","")
                menu.entryconfig(realName,label=label,underline=underline)
        except:
            print "setMenuLabel menu,name,label:",menu,name,label
            g.es_exception()
            pass
    #@nonl
    #@-node:ekr.20031218072017.4121:setMenuLabel
    #@-node:ekr.20031218072017.4114:8 Routines with other spellings
    #@-node:ekr.20031218072017.4103:Tkinter menu bindings
    #@-others
#@nonl
#@-node:ekr.20031218072017.4100:@thin leoTkinterMenu.py
#@-leo
