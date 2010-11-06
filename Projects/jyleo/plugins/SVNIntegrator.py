#@+leo-ver=4-thin-encoding=utf-8,.
#@+node:zorcanda!.20050427192852:@thin SVNIntegrator.py
#@@language python   

import javax.swing as swing                  
import org.tmatesoft.svn.core.io as svnio   
import leoGlobals as g    
import org.tmatesoft.svn.core.internal.io.dav.DAVRepositoryFactory as DAVRepositoryFactory
import org.tmatesoft.svn.core.internal.io.svn.SVNRepositoryFactoryImpl as SVNRepositoryFactoryImpl
import org.tmatesoft.svn.core.internal.ws.fs.FSEntryFactory as FSEntryFactory
import org.tmatesoft.svn.core.SVNWorkspaceManager as SVNWorkspaceManager
import org.tmatesoft.svn.core as core
import org.tmatesoft.svn.core.io as iosvn
import org.tmatesoft.svn.util as utilsvn
import java
import javax.swing as swing
import javax.swing.tree as stree

DAVRepositoryFactory.setup()
SVNRepositoryFactoryImpl.setup()
FSEntryFactory.setup()

haveseen = {}
        
#@+others
#@+node:zorcanda!.20050501181716:init
def init():
    import leoPlugins
    leoPlugins.registerHandler( "start2", addToMenu )
    g.plugin_signon( __name__)	 
#@nonl
#@-node:zorcanda!.20050501181716:init
#@+node:zorcanda!.20050501181716.1:addToMenu
def addToMenu( tag, args):
    
    g.globalDirectiveList.append( "svn")
    if args.has_key( "c"):
        c = args[ 'c']
        if c not in haveseen:
            haveseen[ c ]= True
            menu = c.frame.menu
            pmenu = menu.getPluginMenu()
            svn_menu = swing.JMenu( "SVN")
            pmenu.add( svn_menu )
            node_item = swing.JMenuItem( "Save and Update Node")
            node_item.actionPerformed = lambda event: saveAndUpdateNode( c )
            svn_menu.add( node_item)
            node_item2 = swing.JMenuItem( "Revert Node")
            node_item2.actionPerformed = lambda event: revertNode( c)
            svn_menu.add( node_item2)
            
            node_item4 = swing.JMenuItem( "Status of Workspace")
            node_item4.actionPerformed = lambda event: status( c )
            svn_menu.add( node_item4 )
            
            node_item5 = swing.JMenuItem( "Add Node To Workspace")   
            node_item5.actionPerformed = lambda event: addNodeToWorkspace( c)
            svn_menu.add( node_item5)
            
            node_item6 = swing.JMenuItem( "Checkout")
            node_item6.actionPerformed = lambda event: checkout( c )
            svn_menu.add( node_item6)
            
            browsem = swing.JMenuItem( "Browse A Repository")
            browsem.actionPerformed = lambda event: browse( c )
            svn_menu.add( browsem )
            
            commit_menu = swing.JMenu( "Commit")
            svn_menu.add( commit_menu)
            commit_dir = swing.JMenuItem( "Commit Nodes Directory")
            commit_menu.add( commit_dir)
            commit_dir.actionPerformed = lambda event: commitDirectory( c )
#@nonl
#@-node:zorcanda!.20050501181716.1:addToMenu
#@+node:zorcanda!.20050430114018:status dict
status_dict = {

    core.SVNStatus.ADDED: "added",
    core.SVNStatus.CONFLICTED: "conflicted",
    core.SVNStatus.COPIED: "copied",
    core.SVNStatus.CORRUPTED: "corrupted",
    core.SVNStatus.DELETED: "deleted",
    core.SVNStatus.EXTERNAL: "external", 
    core.SVNStatus.IGNORED: "ignored",
    core.SVNStatus.MERGED: "merged",
    core.SVNStatus.MISSING: "missing",
    core.SVNStatus.MODIFIED: "modified",
    core.SVNStatus.MOVED: "moved",
    core.SVNStatus.NOT_MODIFIED: "not modified",
    core.SVNStatus.NOT_REVERTED: "not reverted",
    core.SVNStatus.OBSTRUCTED: "obstructed",
    core.SVNStatus.REPLACED: "replaced",
    core.SVNStatus.RESOLVED: "resolved",
    core.SVNStatus.RESTORED: "restored",
    core.SVNStatus.REVERTED: "reverted",
    core.SVNStatus.UNVERSIONED: "unversioned",
    core.SVNStatus.UPDATED: "updated"
}
#@-node:zorcanda!.20050430114018:status dict
#@+node:zorcanda!.20050428151028:syncNode
def saveAndUpdateNode( c ):
    
    at = c.atFileCommands
    p = c.currentPosition()
    if p.isAtThinFileNode():
        path = None
        
        path, statuspath = getPathAndBase( p )
        svn =  getRepositoryLocation( p )
        if svn == None:
            g.es( "No Repository Specified")
            return
        try:
            repository = getRepository( svn )
            if repository == None: return
            ws = SVNWorkspaceManager.createWorkspace( "file", path)
            ws.update( repository.getLatestRevision() )
            #status = ws.status( None, 0, Reporter(), 1,1,1 )
            status = ws.status( p.atThinFileNodeName(), 0)
            conflict = None
            
            if status.getContentsStatus() == status.CONFLICTED:
                conflict = True
        except java.lang.Exception, x:
            x.printStackTrace()
            g.es( "Node not in a Workspace")
            return
        
        npos = reload(c, p) 
        
        
    else:
        g.es( "@" +"thin is required to synchronize", color="RED" )
    
#@nonl
#@-node:zorcanda!.20050428151028:syncNode
#@+node:zorcanda!.20050430130341:status
def status( c ):
    
    p = c.currentPosition()
    try:
        path, base = getPathAndBase( p )
        ws = getWorkspace( path )
        lsh = LeoStatusHandler( path)
        s = ws.status( '', 0)
        ws.status( '', 0, lsh, 1,1,1)
        lsh.centerAndShow()
        
    except java.lang.Exception, x:
        x.printStackTrace()
        pass
#@nonl
#@-node:zorcanda!.20050430130341:status
#@+node:zorcanda!.20050430105934:commits
def commitNode( c ):
    p = c.currentPosition()
    path, base = getPathAndBase( p)
    ws = getWorkspace( path)
    if ws == None: return
    c.save()
    message = getMessage()   
    ws.commit(  message )	
    status( c )
def commitDirectory( c ):
    
    try:	
        p = c.currentPosition()
        path, base = getPathAndBase( p)
        ws = getWorkspace( path)
        if ws == None: return
        c.save()
        message = getMessage()
        ws.commit( message)
        status( c )
    except java.lang.Exception, x:
        x.printStackTrace()

    
#@nonl
#@-node:zorcanda!.20050430105934:commits
#@+node:zorcanda!.20050429153750:revertNode
def revertNode( c ):
    at = c.atFileCommands
    p = c.currentPosition()
    if p.isAtThinFileNode():

        path, statuspath = getPathAndBase( p )
        try:
            
            #ws = SVNWorkspaceManager.createWorkspace( "file", path)
            ws = getWorkspace( path)
            if ws == None: return
            ws.revert( p.atThinFileNodeName(), 0 )
                
        except java.lang.Exception, x:
            x.printStackTrace()
            pass
        
        npos = reload(c, p )
#@nonl
#@-node:zorcanda!.20050429153750:revertNode
#@+node:zorcanda!.20050429153750.1:reload
def reload( c, p):
    
    at = c.atFileCommands
    c.beginUpdate()
    npos = p.insertAfter()
    p.doDelete( npos )
    npos.setHeadString( p.headString())
    at.forceGnxOnPosition( npos)
    at.read(npos,thinFile=True)
    c.endUpdate()
    return npos
    
#@nonl
#@-node:zorcanda!.20050429153750.1:reload
#@+node:zorcanda!.20050430135405:checkout
def checkout( c ):

    try:	
        p = c.currentPosition()
        co = CheckOuter()
        if not co.getOk():
            return
        
        revision = co.getRevision()
        path = co.getPath()
        svn = co.getSVN()
        repository = getRepository( svn)
        if repository == None: return
        
        
        
        dir = java.io.File( path )
        if dir.exists():
            if dir.isFile():
                return
        else:
            dir.mkdirs()
        
        
        ws = getWorkspace( dir.getAbsolutePath())
        wsfc = WSFileCapturer()
        ws.addWorkspaceListener( wsfc )
        ws.checkout( repository.getLocation(), revision, 0, 1)
        #rl = getRepositoryLocation( p )
        #ws = getWorkspace( p )
        c.beginUpdate()
        nnode = p.insertAfter()
        bs = "@path %s\n" % path
        bs += "@svn %s\n" % svn

        nnode.setHeadString( "SVN Checkout")
        nnode.setTnodeText( bs)
        files = wsfc.getFiles()
        at = c.atFileCommands
        for z in files:
            fpath = java.io.File( path, z)
            if fpath.isDirectory():
                continue
            
            nfile = file( fpath.getAbsolutePath(), 'r')
            scan_data = at.scanHeader( nfile, z)
            nfile.close()
            if scan_data[ 2 ]:
                thin_node = nnode.insertAsNthChild( 0 )
                thin_node.setHeadString( "@thin %s" % z)
                reload( c, thin_node )
            
        c.endUpdate()
    except java.lang.Exception, x:
        x.printStackTrace()
        
    
#@nonl
#@-node:zorcanda!.20050430135405:checkout
#@+node:zorcanda!.20050502104812:browse
def browse( c ):
    
    svnc = SVNConnector()
    center = swing.JPanel( java.awt.BorderLayout())
    center.add( svnc)
    label = swing.JLabel( "Status:")
    center.add( label, java.awt.BorderLayout.SOUTH)
    d = swing.JDialog()
    d.title = "Browse A Repository"
    cp = d.getContentPane()
    cp.setLayout( java.awt.BorderLayout())
    cp.add( center )
    jb = swing.JButton( "Browse")
    def view( event ):
        url = svnc.getUrl()
        can_connect = svnc.canConnect() 
        if can_connect:
            repository = getRepository( url)
            browseRepository( d, repository)
        else:
            label.setText( "Status: Cant Connect" )
    jb.actionPerformed = view
    cp.add( jb, java.awt.BorderLayout.SOUTH)
    d.pack()
    g.app.gui.center_dialog( d )
    d.visible = 1
#@nonl
#@-node:zorcanda!.20050502104812:browse
#@+node:zorcanda!.20050502114151:browseRepository
def browseRepository( parentframe, repository):

    browser = SVNBrowser( repository)
    parentframe.setContentPane( browser)
    parentframe.pack()
    g.app.gui.center_dialog( parentframe )
#@nonl
#@-node:zorcanda!.20050502114151:browseRepository
#@+node:zorcanda!.20050430133622:addNodeToWorkspace
def addNodeToWorkspace( c ):
    
    at = c.atFileCommands
    p = c.currentPosition()
    if p.isAtThinFileNode():
        
        path, base = getPathAndBase( p )
        svn =  getRepositoryLocation( p )
        if svn == None:
            return
            
        #repository = getRepository( svn )
        #if repository == None: return
        at.write( p, thinFile = 1)
        ws = getWorkspace( path)
        if ws == None: return
        print base
        print path
        base = p.atThinFileNodeName()
        ws.add( base, 1, 0)
        
        
            
    
#@nonl
#@-node:zorcanda!.20050430133622:addNodeToWorkspace
#@+node:zorcanda!.20050429154029:getPathAndBase
def getPathAndBase( p):
    path = None
    for z in p.self_and_parents_iter( copy = True):
        s = z.bodyString()  
        d = g.get_directives_dict(s)
        if d.has_key("path"):
            start = d[ 'path']
            end = s.find( "\n", start)
            if end == -1:
                s = s[ start:]
            else:
                s = s[ start: end]
                    
            stokens = s.split()
            if len( stokens)	>= 2:
                path = stokens[ 1 ]
                break
        
    if path == None:
        a =  p.atThinFileNodeName()
        ap =  g.os_path_abspath( a )
        f = java.io.File( ap )
        path = f.getParent()
            
    statuspath = g.os_path_abspath( p.atThinFileNodeName())	
    return path, statuspath
#@-node:zorcanda!.20050429154029:getPathAndBase
#@+node:zorcanda!.20050430100949:getRepositoryLocation
def getRepositoryLocation( p ):  
    svn = None
    for z in p.self_and_parents_iter( copy = True):
        s = z.bodyString()  
        d = g.get_directives_dict(s)
        if d.has_key("svn"):
            start = d[ 'svn']
            end = s.find( "\n", start)
            if end == -1:
                s = s[ start:]
            else:
                s = s[ start: end]
                    
            stokens = s.split()
            if len( stokens)	>= 2:
                svn = stokens[ 1 ]
                break	
    return svn

    
#@nonl
#@-node:zorcanda!.20050430100949:getRepositoryLocation
#@+node:zorcanda!.20050430101439:getRepository
def getRepository( url ):
    
    repository = None
    try:
        location = svnio.SVNRepositoryLocation.parseURL( url)
        repository = svnio.SVNRepositoryFactory.create( location)
    except java.lang.Exception, x:
        x.printStackTrace
        g.es( "Could not connect to repository %s" % url)
        return None
    return repository
#@nonl
#@-node:zorcanda!.20050430101439:getRepository
#@+node:zorcanda!.20050430105934.1:getWorkspace
def getWorkspace( path):
    
    try:
        ws = SVNWorkspaceManager.createWorkspace( "file", path)
        ws.addWorkspaceListener( LeoWSListener())
        return ws
    except java.lang.Exception, x:
        x.printStackTrace()
        g.es( "Could not create Workspace %s" % path)
#@nonl
#@-node:zorcanda!.20050430105934.1:getWorkspace
#@+node:zorcanda!.20050502100122:getMessage
def getMessage():
    
    d = swing.JDialog()
    d.setTitle( "Message")
    cp = d.getContentPane()
    cp.setLayout( java.awt.BorderLayout())
    jta = swing.JTextArea()
    jsp = swing.JScrollPane( jta ) 
    jsp.setPreferredSize( java.awt.Dimension( 250, 250 ) )
    cp.add( jsp )
    buttonpanel = swing.JPanel()
    cp.add( buttonpanel, java.awt.BorderLayout.SOUTH)
    write = swing.JButton( "Write")
    buttonpanel.add( write)
    write.actionPerformed = lambda event: d.dispose()
    d.pack()
    g.app.gui.center_dialog( d )
    d.setModal( 1 )
    d.visible = 1
    return jta.getText()
    
    
#@nonl
#@-node:zorcanda!.20050502100122:getMessage
#@+node:zorcanda!.20050502103811:setBorderToTitle
def setBorderToTitle( widget, title):
    
    border = widget.getBorder()
    tborder = swing.border.TitledBorder( border)
    tborder.setTitle( title )
    widget.setBorder( tborder )
#@nonl
#@-node:zorcanda!.20050502103811:setBorderToTitle
#@+node:zorcanda!.20050429160722:addNodesDirectoryToSVN
def addNodesDirectoryToSvn( c ):
    p = c.currentPosition()
    
    if p.isAtThinFileNode():
        p = c.currentPosition()
        path, base = getPathAndBase( p )
        try:
            print path
            ws = utilsvn.SVNUtil.createWorkspace( path, 0)
            wspath = utilsvn.SVNUtil.getWorkspacePath( ws, path)
            if len(java.lang.String( wspath).trim() ) == 0:
                wspath = None
            svn = getRepositoryLocation( p )
            if svn == None:
                g.es( "Could not find @svn directive")
                return
            location = getRepository( svn )
            if location == None:
                g.es( "Could not connect to repository")
                return
            
            loc = location.toString()
            f = java.io.File( path)
            token = ' / '
            token = token.strip()
            nstring = loc + token + f.getName()
            nlocation =  svnio.SVNRepositoryLocation.parseURL( nstring)
            ws.commit( nlocation, wspath, "HI THERE!" )
                    
        except java.lang.Exception, x: 
            
            x.printStackTrace()
            return
#@-node:zorcanda!.20050429160722:addNodesDirectoryToSVN
#@+node:zorcanda!.20050430110915:class LeoWSListener
class LeoWSListener( core.ISVNWorkspaceListener ):
    
    def committed( self, path, kind):
        
        g.es( "%s %s" % ( path, status_dict[ kind ]) )
        
    def modified( self, path, kind):
        print "MODIFIED"
        print path
        print kind
        print status_dict[ kind]
        
    def updated( self, path, contentStatus, propertiesStatus, revision):
        #print path
        #print contentStatus
        pass
        
        
#@nonl
#@-node:zorcanda!.20050430110915:class LeoWSListener
#@+node:zorcanda!.20050430144157:class WSFileCapturer
class WSFileCapturer( core.SVNWorkspaceAdapter ):
    
    def __init__( self):
        core.SVNWorkspaceAdapter.__init__( self )
        self.files =  []
        
    def updated( self, path, status, ps, revision):
        
        if status == core.SVNStatus.ADDED:
            self.files.append( path )
    
    def getFiles( self ):
        return self.files

#@-node:zorcanda!.20050430144157:class WSFileCapturer
#@+node:zorcanda!.20050430130341.1:class LeoStatusHandler
class LeoStatusHandler( core.ISVNStatusHandler ):
    
    
    
    def __init__( self, name ):
        self.jf = swing.JFrame()
        self.jf.title = "status for %s" % name
        self.jta = swing.JTable()
        self.tmodel = swing.table.DefaultTableModel( 
            [ "path", "status", "revision"],
            0
        )
        self.jta.setModel( self.tmodel )
        jsp = swing.JScrollPane( self.jta)
        self.jf.add( jsp)
        #self.jf.pack()
        #self.jf.visible = 1
        jb = swing.JButton( "Close")
        jb.actionPerformed = lambda event: self.jf.dispose()
        jp = swing.JPanel()
        jp.add( jb )
        self.jf.add( jp, java.awt.BorderLayout.SOUTH)
    
    def centerAndShow( self ):
        self.jf.pack()
        g.app.gui.center_dialog( self.jf )
        self.jf.visible = 1 
        
    def handleStatus( self, path, status):
        #print "HANDLE %s " % path
        #s = "%s %s\n" %( path,  status_dict[ status.getContentsStatus()] )
        #self.jta.append( s )
        row = []
        row.append( path)
        row.append( status_dict[status.getContentsStatus() ])
        row.append( status.getRevision()) 
        self.tmodel.addRow( row )
#@nonl
#@-node:zorcanda!.20050430130341.1:class LeoStatusHandler
#@+node:zorcanda!.20050430140013:class CheckOuter
class CheckOuter( swing.JDialog):
    
    def __init__( self ):
        swing.JDialog.__init__( self )
        self.repository = None
        self.createChain()
        
        self.next() 
        self.setModal( 1 )
        g.app.gui.center_dialog( self )
        self.visible = 1
        

    def getRevision( self ):
        return self.revision
        
        
    def getPath( self):
        return self.path
        
    def getSVN( self):
        return self.svn 
        #return self.svn.getText()
        
    def getOk( self):
        return self.ok
        
    def setCanceled( self ):
        self.ok = False
        self.dispose()
    
    def setCheckout( self ):
        self.ok = True
        self.dispose()
    
    #@    @+others
    #@+node:zorcanda!.20050501175021:createChain
    def createChain( self ):
        
        self.panelChain = []
        self.panelChain.append( self.__getSVNConnection)
        self.panelChain.append( self.__getRepositoryView)
        self.panelChain.append( self.__getPlaceView )
        self.panelChain.reverse() 
    #@nonl
    #@-node:zorcanda!.20050501175021:createChain
    #@+node:zorcanda!.20050501175021.1:__getSVNConnection
    def __getSVNConnection( self )	:
        
        panel = swing.JPanel( java.awt.BorderLayout())
        connector = SVNConnector()
        cpanel = swing.JPanel( java.awt.BorderLayout())
        cpanel.add( connector)
        mlabel = swing.JLabel( "Status:")
        cpanel.add( mlabel, java.awt.BorderLayout.SOUTH)
        panel.add( cpanel)
        #jtf = swing.JTextField( 15 )
        #border = jtf.getBorder()
        #tborder = swing.border.TitledBorder( border)
        #tborder.setTitle( "SVN Repository Location")
        #jtf.setBorder( tborder)
        #panel.add( jtf )
        
        def checkRepository( event ):
            #location = jtf.getText()
            if not connector.canConnect():
                 mlabel.setText( "Can't Reach %s" % connector.getUrl())  
                 return
            location = connector.getUrl()
            self.repository = getRepository( location)
            if self.repository:
                self.svn = location
                self.next() 
    
                    
        jb = swing.JButton( "Connect to Repository")
        jb.actionPerformed = checkRepository
        buttonpanel = swing.JPanel()
        buttonpanel.add( jb )
        panel.add( buttonpanel, java.awt.BorderLayout.SOUTH)
        return panel
    #@nonl
    #@-node:zorcanda!.20050501175021.1:__getSVNConnection
    #@+node:zorcanda!.20050501175413:__getRepositoryView
    def __getRepositoryView( self ):
        
        panel = swing.JPanel( java.awt.BorderLayout())
        # jtree = swing.JTree()
        #rmodel = RepositoryModel( self.repository , self.revision) 
        #jtree.setModel( rmodel )
        #jsp = swing.JScrollPane( jtree)
        #panel.add( jsp )
        browser = SVNBrowser( self.repository)
        panel.add( browser )
        
        def setTarget( event ):
            sp = browser.jtree.getSelectionPath() 
            if sp != None:
                path = sp.getPath()
                nwpath = []
                for z in path:
                    nwpath.append( z.toString())
                self.svn = '/'.join( nwpath)
                self.revision = browser.getRevision() 
                self.next() 
            
        jb = swing.JButton( "Select Node To Check Out")
        jb.actionPerformed = setTarget
        buttonpanel = swing.JPanel()
        buttonpanel.add( jb)
        panel.add( buttonpanel, java.awt.BorderLayout.SOUTH)
        return panel
    #@nonl
    #@-node:zorcanda!.20050501175413:__getRepositoryView
    #@+node:zorcanda!.20050501175413.1:__getPlaceView
    def __getPlaceView( self ):
            
        panel = swing.JPanel()
        jfc = swing.JFileChooser()
        jfc.setFileSelectionMode( jfc.DIRECTORIES_ONLY )
            
        class SelectDirectory( java.awt.event.ActionListener ): 
                
            def __init__( self, co):
                self.co = co
                
            def actionPerformed( self ,event ):
                ro = java.lang.String(  event.getActionCommand() )
                if ro.equals( jfc.APPROVE_SELECTION):
                    self.co.dispose()
                    self.co.ok = True 
                    self.co.path = jfc.getSelectedFile().getAbsolutePath()
                        
                elif ro.equals( jfc.CANCEL_SELECTION):
                    self.co.dispose()
                    self.co.ok = False
            
        jfc.addActionListener( SelectDirectory( self ))
        panel.add( jfc )
        return panel
    #@nonl
    #@-node:zorcanda!.20050501175413.1:__getPlaceView
    #@-others
        
    def next( self):
       
       next = self.panelChain.pop()
       self.setContentPane( next())
       self.pack()
       g.app.gui.center_dialog( self )
    
    
#@nonl
#@-node:zorcanda!.20050430140013:class CheckOuter
#@+node:zorcanda!.20050430160218:class RepositoryModel
class RepositoryModel( stree.TreeModel ):
    '''A class that models a SVN Repository and Revision,
    for a JTree view'''

    #@    @+others
    #@+node:zorcanda!.20050501180920:__init__
    def __init__( self, repository, revision):    
        
        self.repository = repository   
        self._listeners = []
        self._root = repository.getLocation()
        self._rrepos = repository       
        self._revision = revision 
                
        self.children = []
        col = java.util.Vector()
        self._rrepos.getDir( "", 
                                    self._revision,
                                    java.util.HashMap(),
                                    col )	
        for z in col:
            de = self.DEWrapper( z, self )
            self.children.append( de )
    #@nonl
    #@-node:zorcanda!.20050501180920:__init__
    #@+node:zorcanda!.20050501180920.1:addTreeModelListener
    def addTreeModelListener( self, listener):
        self._listeners.append( listener)
    #@nonl
    #@-node:zorcanda!.20050501180920.1:addTreeModelListener
    #@+node:zorcanda!.20050501181502:getChild
    def getChild( self, parent, index):
        
        if parent == self._root:
            return self.children[ index]
        else:
            return parent.getChildren()[ index]
                
    #@nonl
    #@-node:zorcanda!.20050501181502:getChild
    #@+node:zorcanda!.20050501181502.1:getChildCount
    def getChildCount( self, parent):
        if parent == self._root:
            return len( self.children)
        else:
            return len( parent.getChildren()) 
    #@nonl
    #@-node:zorcanda!.20050501181502.1:getChildCount
    #@+node:zorcanda!.20050501181502.2:getIndexOfChild
    def getIndexOfChild( self, parent, child):
    
        if parent == self._root:
            return self.children.index( child)
        else:
            return parent.getChildren().index( child )
    #@nonl
    #@-node:zorcanda!.20050501181502.2:getIndexOfChild
    #@+node:zorcanda!.20050501181502.3:getRoot
    def getRoot( self ):
        return self._root
    #@nonl
    #@-node:zorcanda!.20050501181502.3:getRoot
    #@+node:zorcanda!.20050501181502.4:isLeaf
    def isLeaf( self, node):
        if node == self._root:
            return False
        else:
            kind = node.de.getKind()
            if kind == iosvn.SVNNodeKind.FILE:
                return True
            elif kind == iosvn.SVNNodeKind.DIR:
                return False
    #@nonl
    #@-node:zorcanda!.20050501181502.4:isLeaf
    #@+node:zorcanda!.20050501181502.5:removeTreeModelListener
    def removeTreeModelListener( self, listener):
        self._listeners.remove( listener)
    #@nonl
    #@-node:zorcanda!.20050501181502.5:removeTreeModelListener
    #@+node:zorcanda!.20050501181502.6:valueForPathChanged
    def valueForPathChanged( self, path, nwvalue):  
        pass
    #@nonl
    #@-node:zorcanda!.20050501181502.6:valueForPathChanged
    #@+node:zorcanda!.20050430180805:class DEWrapper
    class DEWrapper( java.lang.Object ):
            
        def __init__( self, de, rm , parentpath = "" ):
            java.lang.Object.__init__( self )
            self.de = de
            self.rm = rm
            self.children = None
            self.parentpath = parentpath
                
        def toString( self ):
            
            return self.de.getName()
                
        def getChildren( self ):
            if self.children == None:
                self._getChildren()
            return self.children
            
        def _getChildren( self):
            de = self.de 
            rm = self.rm
            self.children = []
            if de.getKind() == iosvn.SVNNodeKind.DIR:
                col = java.util.Vector()
                if self.parentpath != "":
                    tp = self.parentpath + "/" + de.getName()
                else:
                    tp = de.getName()
                rm._rrepos.getDir( tp,
                        rm._revision,
                        java.util.HashMap(),
                        col )
                for z in col:
                    de = RepositoryModel.DEWrapper( z, rm, parentpath = tp) 
                    self.children.append( de )
    #@-node:zorcanda!.20050430180805:class DEWrapper
    #@-others
#@nonl
#@-node:zorcanda!.20050430160218:class RepositoryModel
#@+node:zorcanda!.20050502102649:class SVNConnector
class SVNConnector( swing.JPanel):
    
    def __init__( self ):
        
        swing.JPanel.__init__( self )
        slayout = swing.SpringLayout()
        self.setLayout( slayout)
        schemes = [ 'svn://', 'svn+ssh://', 'http://', 'https://' ] 
        self.scheme_widget = scheme_widget = swing.JComboBox( schemes)
        scheme_widget.setEditable( 0 )
        setBorderToTitle( scheme_widget, "scheme:")
        self.add( scheme_widget)
        slayout.putConstraint( slayout.NORTH, scheme_widget, 5, slayout.NORTH, self)
        slayout.putConstraint( slayout.WEST, scheme_widget, 5, slayout.WEST, self )
         
        self.host = host = swing.JTextField( 15 )
        setBorderToTitle( host, "host:")
        self.add( host )
        slayout.putConstraint( slayout.NORTH, host, 5, slayout.NORTH, self)
        slayout.putConstraint( slayout.WEST, host, 5, slayout.EAST, scheme_widget)
        slayout.putConstraint( slayout.EAST, self, 5, slayout.EAST, host)
       
        pmodel = swing.SpinnerNumberModel( 3690, 0, 5000, 1)
        self.port = port = swing.JSpinner( pmodel )
        dformat = java.text.DecimalFormat()
        dformat.setGroupingSize( 8 )
        editor = swing.JSpinner.NumberEditor( port, dformat.toPattern() )
        port.setEditor( editor)
        port.revalidate() 
        # port.setEditor( port.getEditor()) 
        setBorderToTitle( port, "port:")
        self.add( port )
        slayout.putConstraint( slayout.NORTH, port, 5, slayout.SOUTH, scheme_widget)
        slayout.putConstraint( slayout.WEST, port, 5, slayout.WEST, self)
       
        self.path = path = swing.JTextField( 15 )
        setBorderToTitle( path, "path:")
        self.add( path )
        slayout.putConstraint( slayout.NORTH, path, 5, slayout.SOUTH, scheme_widget )
        slayout.putConstraint( slayout.WEST, path, 0, slayout.WEST, host )
        slayout.putConstraint( slayout.SOUTH, self, 5, slayout.SOUTH, path )
        
        
    def getScheme( self ):
        return self.scheme_widget.getSelectedItem()
        
    def getHost( self ):
        return self.host.getText()
        
    def getPort( self ):
        return self.port.getValue()
        
    def getPath( self ):
        return self.path.getText()

    def getUrl( self ):
        
        url = self.getScheme()
        url += self.getHost().strip( '/')
        url += ":%s" % self.getPort()
        path = "/%s" % self.getPath().strip( '/')       
        url += path
        return url

    def canConnect( self ):
        
        url = self.getUrl()
        repository = getRepository( url )
        try:
            repository.testConnection()
            return True
        except:
            return False
      
#@nonl
#@-node:zorcanda!.20050502102649:class SVNConnector
#@+node:zorcanda!.20050502114738:class SVNBrowser
class SVNBrowser( swing.JPanel ):
    
    def __init__( self, repository ):
        
        swing.JPanel.__init__( self )
        self.setLayout( java.awt.BorderLayout())
        self.revision = repository.getLatestRevision()
        self.repository = repository
        rmodel = RepositoryModel( repository, self.revision )
        self.jtree = swing.JTree( rmodel )
        spane = swing.JScrollPane( self.jtree )
        self.add( spane )
        #revisionpanel = swing.JPanel( java.awt.BorderLayout())
        revisionpanel = swing.Box.createHorizontalBox() 
        self.add( revisionpanel, java.awt.BorderLayout.SOUTH)
        spinnermodel = swing.SpinnerNumberModel( self.revision, 0, self.revision, 1)
        self.spinner = swing.JSpinner( spinnermodel) 
        # revisionpanel.add( self.spinner, java.awt.BorderLayout.WEST)
        revisionpanel.add( self.spinner)
        brws_revision = swing.JButton( "Browse To Revision")
        brws_revision.actionPerformed = lambda event: self.switchToRevision() 
        # revisionpanel.add( brws_revision, java.awt.BorderLayout.EAST )
        revisionpanel.add( brws_revision)

    def switchToRevision( self ):
        
        which = self.spinner.getValue()
        self.revision = which
        nwmodel = RepositoryModel( self.repository, which)
        self.jtree.setModel( nwmodel)
        self.revalidate()
        
    def getRevision( self ):
        
        return self.revision
        
#@nonl
#@-node:zorcanda!.20050502114738:class SVNBrowser
#@-others




#@-node:zorcanda!.20050427192852:@thin SVNIntegrator.py
#@-leo
