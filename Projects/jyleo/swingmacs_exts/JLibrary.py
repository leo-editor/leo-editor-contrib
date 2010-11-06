#@+leo-ver=4-thin
#@+node:ekr.20041003172238:@thin JLibrary.py
"""A SwingMacs extension to store Leo trees in dumbdbm files."""

#@<< about this extension >>
#@+node:ekr.20041003172238.1:<< about this extension >>
#@+at
# 
# Note: there isnt such a thing as an anydbm file: it's whatever the anydbm 
# module
# uses).
# 
# Under Outline, there is an option called 'Open Library'. This will open an 
# PMW
# dialog with a list of the trees that you have saved. You can insert trees 
# stored
# in the library, remove them and add trees to the library. Be aware of 
# unicode,
# any characters outside of the ascii set gets turned into a ?. I found this
# problem in storing some trees from ed's Leo outline. Id like it to be able 
# to
# store unicode, but that may require a more specific db background, than 
# anydbm.
# Also note, that your library files may not be OS independent. If your python
# distribution does not have the backing db on another machine, it will not be
# able to open your library.
# 
# This should help people develop templates that they want to reuse between 
# Leo
# projects.  For example, Id like a template of many Java interfaces to be 
# easily
# accessable.  This solves my problem I think.
#@-at
#@-node:ekr.20041003172238.1:<< about this extension >>
#@nl

__version__ = ".1"

#@<< version history >>
#@+node:ekr.20041003172238.2:<< version history >>
#@+at
# 
# 0.1: created out of concepts in Library plugin
#@-at
#@-node:ekr.20041003172238.2:<< version history >>
#@nl
#@<< imports >>
#@+node:ekr.20041003172238.3:<< imports >>
import leoGlobals as g
import SwingMacs 

import dumbdbm
import javax.swing as swing
import javax.swing.event as sevent
import java.awt as awt
import java.util as util
import zlib
import java.util.zip as zipo
import java.io 
#import weakref

#Tk   = g.importExtension('Tkinter',pluginName=__name__,verbose=True)
#mw  = g.importExtension("Pmw",    pluginName=__name__,verbose=True)
#zlib = g.importExtension("zlib",   pluginName=__name__,verbose=True)
#@nonl
#@-node:ekr.20041003172238.3:<< imports >>
#@nl

haveseen = util.WeakHashMap() #   weakref.WeakKeyDictionary()


#@+others
#@+node:zorcanda!.20050313120424:class JLibrary_Loc
class JLibrary_Loc( sevent.ListSelectionListener ):
    
    #@    @+others
    #@+node:zorcanda!.20050313120424.1:__init__
    def __init__( self, emacs  ):
        
        self.emacs = emacs
        path,file = g.os_path_split(g.app.loadDir)
        path = g.os_path_join(path,"swingmacs_exts","lib_locations.txt") 
        self.path = path
        llfile = java.io.File( path )
        data = []
        if llfile.exists():
            fos = java.io.FileInputStream( llfile )
            isr = java.io.InputStreamReader( fos )
            brd = java.io.BufferedReader( isr )
            
            while 1:
                line = brd.readLine()
                if line == None:
                    break
                else:
                    data.append( line )
                    
        else:
            llfile.createNewFile()
    
        
        self.libraries = {}
        for z in data:
            nl = z.split( '=' )
            if len( nl ) == 2:
                name, location = nl
                self.libraries[ name ] = location
                
        
        self.jd = None
    
    #@-node:zorcanda!.20050313120424.1:__init__
    #@+node:zorcanda!.20050313120815:__call__
    def __call__( self, event, command ):
        
        
        self.emacs.keyboardQuit( event )
        if self.jd == None:
            self.createGui()
        #data = self.db.keys()
        #data.sort()
        data = self.libraries.keys()
        data.sort()
        dlm = swing.DefaultListModel()
        for z in data:
            dlm.addElement( z )
        self.libs.setModel( dlm )
        if len( data ) != 0:
            self.libs.setSelectedIndex( 0 )
        
        jd = self.jd 
        jd.validate()
        jd.pack()
        x, y = g.app.gui._calculateCenteredPosition( jd )
        jd.setLocation( x, y )
        jd.show()
        return True
        
        
    
    
    #@-node:zorcanda!.20050313120815:__call__
    #@+node:zorcanda!.20050313205859:sync
    def sync( self ):
        
        try:
            lib_loc = java.io.File( '%s.tmp' % self.path )
            pwriter = java.io.PrintWriter( lib_loc )
        
            for z in self.libraries:
            
                line = '%s=%s' %( z, self.libraries[ z ] )
                pwriter.println( line )
            
        
            pwriter.close()
            lib_loc.renameTo( java.io.File( self.path ) )
        finally:
            pass
            
            
        data = self.libraries.keys()
        data.sort()
        dlm = swing.DefaultListModel()
        for z in data:
            dlm.addElement( z )
        self.libs.setModel( dlm )
        if len( data ) != 0:
            self.libs.setSelectedIndex( 0 ) 
            
        
            
    #@nonl
    #@-node:zorcanda!.20050313205859:sync
    #@+node:zorcanda!.20050313135217:createGui
    def createGui( self ):
        
        
        self.jd = jd = swing.JDialog()
        self.jd.setName( "Leodialog" )
        jd.setTitle( "Libraries" )
        jdc = jd.getContentPane()
        self.libs = lib = swing.JList()
        self.libs.setName( "Autolist" )
        lib.setVisibleRowCount( 5 )
        view = swing.JScrollPane( lib )
        jdc.add( view, awt.BorderLayout.NORTH )
        create = swing.JButton( "Create" )
        create.actionPerformed = self.create
        add = swing.JButton( "Add" )
        add.actionPerformed = self.add 
        move = swing.JButton( "Move" )
        move.actionPerformed = self.move
        remove = swing.JButton( "Remove" )
        remove.actionPerformed = self.remove
        _open = swing.JButton( "Open" )
        _open.actionPerformed = self.open 
        close = swing.JButton( "Close" )
        close.actionPerformed = self.close
        
        topjp = swing.JPanel()
        topjp.setLayout( awt.GridLayout( 2, 1 ) )
        jdc.add( topjp, awt.BorderLayout.SOUTH )
        
        self.message = swing.JTextField()
        mp = swing.JPanel()
        gbl = awt.GridBagLayout()
        mp.setLayout( gbl )
        gbc = awt.GridBagConstraints()
        gbc.weightx = 1.0
        gbc.weighty = 1.0
        gbc.fill = 1
        gbl.setConstraints( self.message, gbc )
        mp.add( self.message )
        
        topjp.add( mp )# , awt.BorderLayout.NORTH )
        
        jp = swing.JPanel()
        jp.setLayout( awt.GridLayout( 1, 6 ) )
        jp.add( create )
        jp.add( add )
        jp.add( move )
        jp.add( remove )
        jp.add( _open )
        jp.add( close )
        topjp.add( jp )#, awt.BorderLayout.SOUTH ) 
    
    #@-node:zorcanda!.20050313135217:createGui
    #@+node:zorcanda!.20050313123137:create
    def create( self, *args ):
        
        fc = swing.JFileChooser()
        fc.showDialog( self.jd, "Create" )
        
        path = fc.getSelectedFile()
        if path:
            if not path.isDirectory():
                if not path.exists():
                    apath = path.getAbsolutePath()   
                                 
                    if not apath.endswith( ".zip" ):
                        apath = '%s.zip' % apath
                    
                    try:    
                        nfile = java.io.File( apath )
                        fs = java.io.FileOutputStream( nfile )
                        zfos = java.util.zip.ZipOutputStream( fs )
                        zfos.putNextEntry( java.util.zip.ZipEntry( "" ) )
                        zfos.setLevel( 9 )
                        zfos.finish()
                        zfos.close()
                    
                        
                        storepath = nfile.getName().rstrip( '.zip' )
                        self.libraries[ storepath ] = apath
                        self.sync()
                        self.message.setText( "%s Creation Successful" % storepath )
                    except java.lang.Exception, x:
                        x.printStackTrace()
                        self.message.setText( "Could not create %s" % apath )
                         
    
    #@-node:zorcanda!.20050313123137:create
    #@+node:zorcanda!.20050313214057:move
    def move( self, *args ):
        
        svalue = self.libs.getSelectedValue()
        if svalue != None:
            
            jfc = swing.JFileChooser()
            jfc.setSelectedFile( java.io.File( self.libraries[ svalue ] ) )
            jfc.showDialog( self.jd, "Move %s To" % svalue )
            sfile = jfc.getSelectedFile()
            if sfile == None:
                sfile = jfc.getCurrentDirectory()
            
            print sfile   
            if sfile != None:
                try:
                    if sfile.isDirectory():
                        tobemoved = java.io.File( self.libraries[ svalue ] )
                        name = tobemoved.getName()
                        nlocation = java.io.File( sfile, name )
                        tobemoved.renameTo( nlocation )
                        self.libraries[ svalue ] = nlocation.getAbsolutePath()
                        self.sync()
                        self.message.setText( "Moved %s Ok" % svalue )
                        
                    else: 
                    
                
                        tobemoved = java.io.File( self.libraries[ svalue ] )
                        del self.libraries[ svalue ]
                        tobemoved.renameTo( sfile )
                        name = sfile.getName()
                        name = name.rstrip( '.zip' )
                        self.libraries[ name ] = sfile.getAbsolutePath()
                        self.sync()
                        self.message.setText( "Moved %s Ok" % svalue )
                    
                except:
                    self.message.setText( "Problems Moving %s" % svalue )       
    #@-node:zorcanda!.20050313214057:move
    #@+node:zorcanda!.20050313123137.1:remove
    def remove( self, *args ):
        
        jlist = self.libs
        sv = jlist.getSelectedValue()
        model = jlist.getModel()
        model.removeElement( sv )
        
        del self.libraries[ sv ]
        self.sync()
        self.message.setText( "Removed %s from path store" % sv )
        
        
    
    
    
    
    
    #@-node:zorcanda!.20050313123137.1:remove
    #@+node:zorcanda!.20050313123137.2:open
    def open( self, *args ):
    
        val = self.libs.getSelectedValue()
        path = self.libraries[ val ]
        if not path.endswith( '.zip' ):
            path = '%s.zip' % path
            
        exists = java.io.File( path )
        if exists.exists():
            
            jl = JLibrary( self.emacs.c, path )
            jl.getDialog()
        
    
    
    
    #@-node:zorcanda!.20050313123137.2:open
    #@+node:zorcanda!.20050313211106:close
    def close( self, *args ):
        
        self.jd.hide()
    #@nonl
    #@-node:zorcanda!.20050313211106:close
    #@+node:zorcanda!.20050313211536:add
    def add( self, *args ):
    
        jfc = swing.JFileChooser()
        jfc.showOpenDialog( self.jd )
        
        
        addto = jfc.getSelectedFile()
        if addto != None and addto.isFile():
            
            try:
                ziptest = java.util.zip.ZipFile( addto )
                name = addto.getName()
                if name.endswith( '.zip' ):
                    name = name.rstrip( '.zip' )
                
                self.libraries[ name ] = addto.getAbsolutePath()
                self.sync()
                self.message.setText( "Added %s Ok" % name )
            
            except:
                self.message.setText( "Could not add %s" % addto.getName() )
                
                
            
    
    #@-node:zorcanda!.20050313211536:add
    #@+node:zorcanda!.20050313211750:valueChanged
    def valueChanged( self, event ):
        
        val = self.libs.getSelectedValue()
        if val != None:
            message = self.libraries[ val ]
        else:
            message = ""
            
        self.setToolTipText( message )
        
    #@nonl
    #@-node:zorcanda!.20050313211750:valueChanged
    #@+node:zorcanda!.20050313142612:addToAltX
    def addToAltX( self ):
        
        return [ 'j-library', ]
    #@nonl
    #@-node:zorcanda!.20050313142612:addToAltX
    #@+node:zorcanda!.20050313143600:addToKeyStrokes
    def addToKeyStrokes( self ):
        return None
    #@nonl
    #@-node:zorcanda!.20050313143600:addToKeyStrokes
    #@-others
    
#@-node:zorcanda!.20050313120424:class JLibrary_Loc
#@+node:ekr.20041003172238.4:class JLibrary
class JLibrary:
    '''This class presents an interface through which a Libray can be used.
    It alsoprovides a gui dialog to interact with the Library.'''
    openlibs = {}
    
    #@    @+others
    #@+node:ekr.20041003172238.5:__init__
    def __init__( self, c, path):
        
        self.c = c
        self.path = path
        
        self.db = java.io.File( path )
        self.size = self.db.length()
        
        
        
        
        # Set self.db.
        #if JLibrary.openlibs.has_key( path ):
        #    self.db = JLibrary.openlibs[ path ]
        #elif g.os_path_exists( path ):
        #    self.db = dumbdbm.open( path, "rw" )
        #    JLibrary.openlibs[ path ] = self.db
        #else:
        #    self.db = dumbdbm.open( path, "c" ) 
        #    JLibrary.openlibs[ path ] = self.db
    
    #@-node:ekr.20041003172238.5:__init__
    #@+node:ekr.20041003172238.6:add (unicode)
    def add( self, name, data ):
        
    
       
        zf = java.util.zip.ZipFile( self.db )
        entries = zf.entries()
        data_list = []
        sname = str( name )
        for z in entries:
            if z.getName() == sname: continue
            z2 = java.util.zip.ZipEntry( z.getName() )
            ins = zf.getInputStream( z )
            data2 = []
            while 1:
                i = ins.read()
                if i == -1: break
                else: data2.append( i )
            data_list.append( ( z2, data2 ) )
            
        zf.close()
        
       
        #fos = java.io.FileOutputStream( self.db )
        bos = java.io.ByteArrayOutputStream()
        zos = java.util.zip.ZipOutputStream( bos )
        zos.setLevel( 9 )
    
        for z in data_list:
            zos.putNextEntry( z[ 0 ] )
            zos.write( z[ 1 ], 0, len( z[ 1 ] ) )
            zos.closeEntry()
            
            
        nze = java.util.zip.ZipEntry( name )
        zos.putNextEntry( nze )
        bytes = data.getBytes()
        zos.write( bytes, 0, len( bytes ) )
        zos.closeEntry()
        zos.finish()
        
        barray = bos.toByteArray()
        zos.close()
       
        #fos = java.io.FileOutputStream( self.db )
        #fos.write( barray, 0, len( barray ) )
         
        try:
            
            tmpfile = java.io.File( '%s.tmp' % self.db.getAbsolutePath() )
            fos = java.io.FileOutputStream( tmpfile )
            fos.write( barray, 0, len( barray ) )
            fos.close()   
            tmpfile.renameTo( self.db )
            self.db = java.io.File( self.db.getAbsolutePath() )
            
        finally:
            pass
        
        
      
    
    #@-node:ekr.20041003172238.6:add (unicode)
    #@+node:ekr.20041003172238.7:remove
    def remove( self, name ):
        
        #del self.db[ name ]
        #self.db.sync()
        zf = java.util.zip.ZipFile( self.db )
        entries = zf.entries()
        
        zentries = []
        for z in entries:
            if z.hashCode() ==  name.hashCode(): 
                continue
            z2 = java.util.zip.ZipEntry( z.getName() )
            istream = zf.getInputStream( z )
            bytes = []
            while 1:
                data = istream.read()
                if data == -1: break
                else: bytes.append( data )
            
            zentries.append( ( z2, bytes ) )
         
        zf.close()   
        #entries2 = zf.entries()
        bos = java.io.ByteArrayOutputStream()
        zos = java.util.zip.ZipOutputStream( bos )
        for z in zentries:
            zos.putNextEntry( z[ 0 ] )
            zos.write( z[ 1 ] )
            zos.closeEntry()
        
        zos.finish()
        ba = bos.toByteArray()
        try:
            tmpfile = java.io.File( '%s.tmp' % self.db.getAbsolutePath() )
            fos = java.io.FileOutputStream( tmpfile )
            fos.write( ba, 0, len( ba ) )
            fos.close()   
            zos.close()
            tmpfile.renameTo( self.db )
            self.db = java.io.File( self.db.getAbsolutePath() )
            
        finally:
            pass
            
        
    
    #@-node:ekr.20041003172238.7:remove
    #@+node:ekr.20041003172238.8:names
    def names( self ):
    
        zf = java.util.zip.ZipFile( self.db )
        entries = zf.entries()
        rlist = []
        for z in entries:
            rlist.append( z )
            
        rlist.sort()
        return rlist
        
    
    #@-node:ekr.20041003172238.8:names
    #@+node:ekr.20041003172238.9:retrieve (unicode)
    def retrieve( self, name ):
        
    
        zf = java.util.zip.ZipFile( self.db )
        ins = zf.getInputStream( name )
        bytes = []
        while 1:
            data = ins.read()
            if data == -1: break
            else: bytes.append( data )
            
        
    
        return str( java.lang.String( bytes ) )
        
    #@+at
    #     data = self.db[ name ]
    #     #print "'%s'" % data
    #     print len( data )
    #     data = java.lang.String( data )
    #     barray = data.getBytes()
    #     bais = java.io.ByteArrayInputStream( barray )
    #     inflater = java.util.zip.Inflater()
    #     iis = java.util.zip.InflaterInputStream( bais, inflater )
    #     #isr = java.io.InputStreamReader( iis )
    #     #br = java.io.BufferedReader( isr )
    #     bytes = []
    #     try:
    #         while 1:
    #             ndata = iis.read()
    #             if ndata == -1: break
    #             else: bytes.append( ndata )
    #     finally:
    #         print len( bytes )
    #     return str( java.lang.String( bytes ) )
    #     #data = zlib.decompress( data )
    #     # return unicode( data )
    #     #return g.toUnicode(data,"utf-8",reportErrors=True)
    # 
    # 
    # 
    # 
    #@-at
    #@-node:ekr.20041003172238.9:retrieve (unicode)
    #@+node:ekr.20041003172238.10:getDialog
    def getDialog( self ):
        
        
        
        self.dialog = swing.JDialog()
        self.dialog.setName( "Leodialog" )
        self.dialog.setTitle( self.path )
        self.dialog.getContentPane().setOpaque( False )
        #pass
        b = swing.JButton( "Close" )
        self.dialog.add( b, awt.BorderLayout.SOUTH )
        b.actionPerformed = lambda *args: self.dialog.dispose()
        self.addList( self.dialog )
        self.dialog.pack()
        x, y = g.app.gui._calculateCenteredPosition( self.dialog )
        self.dialog.setLocation( x, y )
        self.dialog.visible = 1
        
        #self.dialog = Pmw.Dialog( buttons = ( 'Close' ,) , title =  self.path)
        #butbox = self.dialog.component( 'buttonbox' )
        #close = butbox.button( 0 )
        #close.configure( foreground = 'blue', background = 'white' )
        #hull = self.dialog.component( 'hull' )
        #sh = hull.winfo_screenheight()/4 
        #sw = hull.winfo_screenwidth()/4
        #hull.geometry( str( 325 )+"x"+str( 325 )+"+"+str(sw)+"+"+str(sh) )   
        #frame = Tk.Frame( hull)
        #frame.pack( fill = 'both', expand = 1 )
        #self.addList( frame )
    
    #@-node:ekr.20041003172238.10:getDialog
    #@+node:ekr.20041003172238.11:addList
    def addList( self, frame ):
        
        self.lbox = swing.JList()
        self.lbox.setName( "Autolist" )
        view = swing.JScrollPane( self.lbox )
        self.lbox.setVisibleRowCount( 5 )
        frame.add( view )
        self.setListContents()
        jp = swing.JPanel()
        jp.setLayout( awt.GridLayout( 3, 1 ) )
        frame.add( jp, awt.BorderLayout.EAST )
        
        for z in (  ( "Insert into outline", self.insert ),
                    ( "Remove from list" , self.delete ),
                    ( "Add Current Node to list", self.addCurrentNode ), ):
            jb = swing.JButton( z[ 0 ] )
            jb.actionPerformed = z[ 1 ]
            jp.add( jb )
    
    #@+at
    #     self.lbox = Pmw.ScrolledListBox( frame )
    #     lb = self.lbox.component( 'listbox' )
    #     lb.configure( background = 'white', foreground = 'blue' )
    #     self.setListContents()
    #     self.lbox.pack( side = 'left' )
    #     frame2 = Tk.Frame( frame )
    #     frame2.pack( side = 'right' )
    #     insert = Tk.Button( frame2, text = 'Insert into outline' )
    #     insert.configure( background = 'white', foreground = 'blue' )
    #     insert.configure( command = self.insert )
    #     insert.pack()
    #     remove = Tk.Button( frame2, text = 'Remove from list' )
    #     remove.configure( background = 'white', foreground = 'blue' )
    #     remove.configure( command = self.delete )
    #     remove.pack()
    #     add = Tk.Button( frame2, text = 'Add Current Node to list' )
    #     add.configure( background = 'white', foreground = 'blue' )
    #     add.configure( command = self.addCurrentNode )
    #     add.pack()
    #@-at
    #@-node:ekr.20041003172238.11:addList
    #@+node:ekr.20041003172238.12:setListContents
    def setListContents( self ):
        
        items = self.names()
        #items.sort()
        mod = swing.DefaultListModel()
        slvalue = self.lbox.getSelectedValue()
        for z in items:
            mod.addElement( z )
        self.lbox.setModel( mod )
        self.dialog.pack()
        if slvalue != None and slvalue in items:
            self.lbox.setSelectedValue( slvalue )
        else:
            if len( items ) > 0:
                self.lbox.setSelectedIndex( 0 )
        
        #self.lbox.setlist( items )
    
    #@-node:ekr.20041003172238.12:setListContents
    #@+node:ekr.20041003172238.13:insert
    def insert( self, *args ):
        
        c = self.c
        item = self.lbox.getSelectedValue()
        s = self.retrieve( item )
        g.app.gui.replaceClipboardWith(s)
        self.c.pasteOutline()
    
    #@-node:ekr.20041003172238.13:insert
    #@+node:ekr.20041003172238.14:delete
    def delete( self, *args ):
        
        c = self.c
        #item = self.lbox.getvalue()
        item = self.lbox.getSelectedValue()
        #if len( item ) == 0: return
        #item = item[ 0 ]
        self.remove( item )
        self.setListContents()
    #@-node:ekr.20041003172238.14:delete
    #@+node:ekr.20041003172238.15:addCurrentNode
    def addCurrentNode( self, *args ):
        
        c = self.c 
        p = c.currentPosition()
        hs = java.lang.String( p.headString())
        s =  java.lang.String( c.fileCommands.putLeoOutline() )
        self.add( hs, s )
        self.setListContents()
    #@-node:ekr.20041003172238.15:addCurrentNode
    #@-others
#@nonl
#@-node:ekr.20041003172238.4:class JLibrary
#@+node:zorcanda!.20050313141346:getCommands
def getCommands():
    
    return {
    
        'j-list' : JLibrary_Loc
    
    
    
    
    }
#@nonl
#@-node:zorcanda!.20050313141346:getCommands
#@-others

#@-node:ekr.20041003172238:@thin JLibrary.py
#@-leo
