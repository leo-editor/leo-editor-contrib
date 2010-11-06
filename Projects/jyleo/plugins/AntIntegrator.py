#@+leo-ver=4-thin
#@+node:zorcanda!.20050426160140:@thin AntIntegrator.py
"""AntIntegrator allows the user to execute Ant files from within jyleo.  Download Ant
and install in the jars folder.  Or have the CLASSPATH pointing towards the relevant Ant
jars"""

import org.apache.tools.ant as atools
import leoGlobals as g
import java
import java.io as io
import javax.swing as swing

haveseen={}

def executeAnt( c ):
    
    class eA( java.lang.Runnable):
        def run( self):
            cp = c.currentPosition()
            executePositionAsAntFile( c, cp)
    t = java.lang.Thread( eA())
    t.setDaemon( True)
    t.start() 
    
def executePositionsMarkedAsAntFiles( c ):

    class epAsAf( java.lang.Runnable):
        def run( self):
            rp = c.rootPosition()
            ant_files = []
            for z in rp.allNodes_iter( copy = True ):
                if hasattr( z.v, 'unknownAttributes'):
                    ua = z.v.unknownAttributes
                    if ua.has_key( "ant_file"):
                        ant_files.append( z )
    
            for z in ant_files:
                executePositionAsAntFile( c, z )
    
    t = java.lang.Thread( epAsAf())
    t.setDaemon( True)
    t.start() 
                
    
def init():	
    import leoPlugins
    leoPlugins.registerHandler( "start2", addToMenu )
    g.plugin_signon( __name__)
            

#@+others
#@+node:zorcanda!.20050426190831:addToMenu
def addToMenu( tag, args):
    
    if args.has_key( "c"):
        c = args[ 'c']
        if c not in haveseen:
            haveseen[ c ]= True
            menu = c.frame.menu
            pmenu = menu.getPluginMenu()
            ant_menu = swing.JMenu( "Ant")
            pmenu.add( ant_menu)
            ant1_mitem = swing.JMenuItem( "Execute Node in Ant")			
            ant1_mitem.actionPerformed = lambda event : executeAnt( c )
            ant_menu.add( ant1_mitem)
            
            ant2_mitem = swing.JMenuItem( "Execute Ant Nodes in Ant")
            ant2_mitem.actionPerformed = lambda event: executePositionsMarkedAsAntFiles( c )
            ant_menu.add( ant2_mitem )
            
            ant3_mitem =swing.JMenuItem( "Mark/Unmark Node as Ant Project")
            ant3_mitem.actionPerformed = lambda event: markAsAntProject( c )
            ant_menu.add( ant3_mitem)
#@nonl
#@-node:zorcanda!.20050426190831:addToMenu
#@+node:zorcanda!.20050426190614:class OSFilter
class OSFilter( java.io.OutputStream):
    '''A class that sends OutputStream write calls to a
    widget'''
    def __init__( self,  is_error = False):
        java.io.OutputStream.__init__( self )
        self.is_error = is_error
    
    def write( self, *args ):
    
        if len( args)> 1:
            data = args[ 0]
            start = args[ 1]
            length = args[ 2 ]
            s = java.lang.String( data[ start: start + length] )
            if self.is_error == True: 
                
                g.es( s, color = "RED")
            else:
                g.es( s )

#@-node:zorcanda!.20050426190614:class OSFilter
#@+node:zorcanda!.20050426182826:markAsAntProject
def markAsAntProject( c ):
    
    cp = c.currentPosition()
    if hasattr( cp.v, "unknownAttributes"):
        ua = cp.v.unknownAttributes
    else:
        ua = cp.v.unknownAttributes = {}
    
    if ua.has_key( "ant_file"):
        del ua[ "ant_file"]
        cp.setIcon( None )
        c.beginUpdate()
        c.endUpdate()
        return
        
    ua[ 'ant_file'] = True	
    import base64
    data  = base64.decodestring( bd )
    s = java.lang.String( data )
    cp.setIcon( s.getBytes( ))
    c.frame.tree.jtree.repaint()
    
#@-node:zorcanda!.20050426182826:markAsAntProject
#@+node:zorcanda!.20050426184802:executePositionAsAntFile
def executePositionAsAntFile( c, cp ):
    
    at = c.atFileCommands 

    at.write(cp.copy(),nosentinels=True,toString=True,scriptWrite=True)

    data = at.stringOutput 
    _file = java.io.File( ".")
    tmpfile = java.io.File.createTempFile( "ant", "xml", _file)
    pw = java.io.PrintWriter( tmpfile)
    for z in data.split( "\n"):
        pw.println( z)
    pw.close()
    filename = tmpfile.getAbsolutePath()
    project = atools.Project()
    dlogger = atools.DefaultLogger()
    dlogger.setMessageOutputLevel( atools.Project.MSG_INFO )
    bout = OSFilter()
    ps = java.io.PrintStream( bout )
    berr = OSFilter( is_error = True )
    eps = java.io.PrintStream( berr)
    dlogger.setOutputPrintStream( ps )
    dlogger.setErrorPrintStream( eps )
    
    project.addBuildListener( dlogger)
    g.es( "--------------", color="GREEN")
    try:
        project.fireBuildStarted() 
        project.init()
        project.setUserProperty( "ant.file", tmpfile.getAbsolutePath())
        helper = atools.ProjectHelper.getProjectHelper()
        helper.parse( project, tmpfile)
        project.executeTarget( project.getDefaultTarget())
        project.fireBuildFinished( None )
    except atools.BuildException, be:
        project.fireBuildFinished( be )
    
    if tmpfile.exists():
        tmpfile.delete()
#@-node:zorcanda!.20050426184802:executePositionAsAntFile
#@+node:zorcanda!.20050426182703:image as base64
bd='''R0lGODlhDwALAIQSAKkufK47hLRIjLlVlb9incRvpcl8rcp9rc+JtdSXvtmkxt+xzuS+1unL3urL
3u/Y5vTl7/ry9////////////////////////////////////////////////////////yH+FUNy
ZWF0ZWQgd2l0aCBUaGUgR0lNUAAsAAAAAA8ACwAABUEgII5kaZ7mQ6CkAyQEoUTSMAqSBEFFkv8F
BeBn+EkQEkdOlHsAiouIcGFwAggF0wLgsAUChhNChHAmWFtWKTwKAQA7'''
#@-node:zorcanda!.20050426182703:image as base64
#@-others




    
    
#@nonl
#@-node:zorcanda!.20050426160140:@thin AntIntegrator.py
#@-leo
