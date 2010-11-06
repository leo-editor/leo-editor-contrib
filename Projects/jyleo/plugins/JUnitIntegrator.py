#@+leo-ver=4-thin-encoding=utf-8,.
#@+node:zorcanda!.20050425115109:@thin JUnitIntegrator.py
import junit.framework as jframework
import JyTest
import leoGlobals as g
import javax.swing as swing
import java

process = None
haveseen = {}

class ShutDown( java.lang.Thread):
	
	count = 0
	def __init__( self ):
		java.lang.Thread.__init__( self)
		self.setDaemon( True ) 
		ShutDown.count += 1
		
	def run( self):
		global process
		if process != None:
			try:
				process.destroy()
			except java.lang.Exeption, x:
				pass


def init():
	start()

def start():	
	import leoPlugins
	leoPlugins.registerHandler( "start2", addToMenu )
	g.plugin_signon( __name__)	

#@+others
#@+node:zorcanda!.20050427072515:addToMenu
def addToMenu( tag, args):
	
	
	if args.has_key( "c"):
		c = args[ 'c']
		if c not in haveseen:
			haveseen[ c ]= True
			menu = c.frame.menu
			pmenu = menu.getPluginMenu()
			jui_menu = swing.JMenu( "JUnit")
			pmenu.add( jui_menu )
			node_item = swing.JMenuItem( "Execute Node as JUnit Test")
			node_item.actionPerformed = lambda event: executeNodeAsJUnitTest( c )
			jui_menu.add( node_item)
			
			node_item2 = swing.JMenuItem( "Execute Nodes Marked as JUnit Tests")
			node_item2.actionPerformed = lambda event: executeNodesMarkedAsTests( c )
			jui_menu.add( node_item2)
			
			node_item3 = swing.JMenuItem( "Mark/Unmark Node as JUnit Test")
			node_item3.actionPerformed = lambda event : markNodeAsTest( c )
			jui_menu.add( node_item3 )
			
			node_item4 = swing.JMenuItem("Insert JyUnit Template")
			node_item4.actionPerformed = lambda event: insertJyUnitTest( c )
			jui_menu.add( node_item4)
#@nonl
#@-node:zorcanda!.20050427072515:addToMenu
#@+node:zorcanda!.20050425145530:executeNodeAsJUnitTest
def executeNodeAsJUnitTest(  c ):
	
	cp = c.currentPosition()
	data = writeNodeIntoString( c, cp )	
	ok = isStringCompilable( data )
	if ok == False:
		g.es( "%s not valid Python" % cp.headString() )
		cp.setBackground( java.awt.Color.YELLOW )
		return
		
	interface = startupServer()
	interface.addTest( data)
	interface.runTests()
	failures = interface.getFailures()
	interface.reset()	
	testResultColorization( cp, failures)
	interface.shutdown()
	
	
	
			
#@nonl
#@-node:zorcanda!.20050425145530:executeNodeAsJUnitTest
#@+node:zorcanda!.20050425170451:executeNodesMarkedAsTests
def executeNodesMarkedAsTests( c ):

	rp = c.rootPosition()
	jtests = []
	for z in rp.allNodes_iter( copy = True ):
		if hasattr( z.v, "unknownAttributes"):
			if z.v.unknownAttributes.has_key( "junit_test"):
				jtests.append( z )
				
	interface = startupServer()
	for z in jtests:
		
		code = writeNodeIntoString( c, z )
		ok = isStringCompilable( code )   
		if ok == False:
			g.es( "%s not valid Python" % z.headString() )
			z.setBackground( java.awt.Color.YELLOW )
			continue
			
		interface.reset()
		interface.addTest( code)
		interface.runTests()
		failures = interface.getFailures()
	
		testResultColorization( z, failures)
	interface.shutdown()

#@-node:zorcanda!.20050425170451:executeNodesMarkedAsTests
#@+node:zorcanda!.20050426120720:insertJyUnitTest
def insertJyUnitTest( c):
	
	cp = c.currentPosition()
	c.beginUpdate()
	new_node = cp.insertAfter()
	new_node.setHeadString( "New JyTest")
	bs = '''class NewTest( JyTest):
	def setUp( self ):
		pass
	
	def tearDown( self):
		pass
		
	# test* methods added should be done in their own nodes to enable colorization of test results.
	'''
	new_node.setTnodeText( bs )
	c.endUpdate()
#@nonl
#@-node:zorcanda!.20050426120720:insertJyUnitTest
#@+node:zorcanda!.20050425170638:compileIntoJyTest
def compileIntoJyTest( code ):
	import imp
	module = imp.new_module( "test")
	code = compile(  code , ".error", "exec")
	module.__dict__[ 'JyTest'] = JyTest.JyTest
	module.__dict__[ 'Assert'] = jframework.Assert
	exec code in module.__dict__
	tests = []
	for z in dir( module ):
		obj = module.__dict__[ z ] 
		if hasattr( obj, "__bases__"):
			bases = obj.__bases__
			if JyTest.JyTest in bases:
				tests.append( obj )	
	
	return tests
	
#@nonl
#@-node:zorcanda!.20050425170638:compileIntoJyTest
#@+node:zorcanda!.20050425172250:markNodeAsTest
def markNodeAsTest( c ):
	
	cp = c.currentPosition()
	if hasattr( cp.v, "unknownAttributes"):
		ua = cp.v.unknownAttributes
	else:
		ua = cp.v.unknownAttributes = {}
	
	if ua.has_key( "junit_test"):
		del ua[ "junit_test"]
		cp.setIcon( None)
		c.beginUpdate()
		c.endUpdate()
		return
	ua[ 'junit_test'] = True
	import base64
	import java
	data = base64.decodestring( bd )
	sdata = java.lang.String( data )
	cp.setIcon( sdata.getBytes() )   
	
#@nonl
#@-node:zorcanda!.20050425172250:markNodeAsTest
#@+node:zorcanda!.20050425170926:writeNodeIntoString
def writeNodeIntoString( c, cp ):
	
	at = c.atFileCommands 
	
	at.write(cp.copy(),nosentinels=True,toString=True,scriptWrite=True)
	
	data = at.stringOutput 	
	
	return data
	
#@nonl
#@-node:zorcanda!.20050425170926:writeNodeIntoString
#@+node:zorcanda!.20050426125108:isStringCompilable
def isStringCompilable( s ):
	
	try:
		compile( s, '.errors', 'exec')
	except:
		return False
	return True
#@nonl
#@-node:zorcanda!.20050426125108:isStringCompilable
#@+node:zorcanda!.20050425171328:testResultColorization
def testResultColorization( cp,  failures ):
	
	fc = failures.size() 
	if fc:
		cp.setBackground( java.awt.Color.RED)
	else:
		cp.setBackground( java.awt.Color.GREEN )
	
		
	

	for z in cp.subtree_iter( copy = True):
		bs = z.bodyString()
		ok = True
		for name in failures:
			
			if bs.find( name ) >= 0:
				ok = False
				break
		
		if ok == False:
			z.setBackground( java.awt.Color.RED)
		else:
			z.setBackground( java.awt.Color.GREEN)	
#@nonl
#@-node:zorcanda!.20050425171328:testResultColorization
#@+node:zorcanda!.20050426112748:startupServer
def startupServer():
	global process
	
	start_process = True
	if process != None: 
		try:
			xv = process.exitValue()
		except java.lang.Exception, x:
			start_process = False
			
	if start_process:
		
		if ShutDown.count == 0:
			java.lang.Runtime.getRuntime().addShutdownHook( ShutDown())
		import java.util as jutil
		v = java.util.Vector()
		v.add( java.lang.String("jython") )
		import JyUnitServer
		v.add( java.lang.String( JyUnitServer.__file__))
		pb = java.lang.ProcessBuilder( v )
		process = pb.start()
	
		ist = process.getInputStream()
		ist.read()
		import java.rmi as rmi
		java.lang.System.setSecurityManager( rmi.RMISecurityManager())
	
	
	import java.rmi.registry as jregistry
	r = jregistry.LocateRegistry.getRegistry( 3000)
	interface = r.lookup( "JyUnitServer")
	return  interface
#@nonl
#@-node:zorcanda!.20050426112748:startupServer
#@+node:zorcanda!.20050425194344:Icon Image as base64 string
bd='''R0lGODlhFAALAKEDAAQEBPwEBAT8BP///yH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAsAAAAABQA
CwAAAiOEj6ko3Qvdg8uZEG6OE2s2WYA3boYokuQhTeVViQe2UvZ9FwA7'''
#@nonl
#@-node:zorcanda!.20050425194344:Icon Image as base64 string
#@-others


	
	
#@-node:zorcanda!.20050425115109:@thin JUnitIntegrator.py
#@-leo
