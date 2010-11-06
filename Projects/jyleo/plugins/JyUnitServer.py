import AbstractJUnitServer
import java.rmi as jrmi
import java.rmi.registry as jregistry
import java.rmi.server as jrmis
import java
import JyTest
import junit.framework as jframework

registry = None

class JyUnitServer(  AbstractJUnitServer):
	
    def __init__( self):
	AbstractJUnitServer.__init__( self )
	self.tester = jframework.TestSuite()
	self.test_result = jframework.TestResult()
		
		
    def  addTest(  self, test ):
	
	
    	try:
    		tests = self.compileIntoJyTest( test)
    		
		for z in tests:
			self.tester.addTest( z())
			
	except:
		raise java.rmi.RemoteException( "Problem Compiling" )
	
	return None
		
    def runTests( self ):
	self.tester. run( self.test_result)
		
    def getFailures( self ):
    	failures = java.util.Vector()
    	
    	for z in self.test_result.failures(): 
    		
    		failures.add( z.failedTest().toString() ) 
	return failures
		
    def reset( self ):
    	self.test_result = jframework.TestResult()
    	self.tester = jframework.TestSuite()

    def shutdown( self ):
    	registry.unbind( "JyUnitServer")
    	class closer( java.lang.Runnable):
    		
    		def run( self ):
    			java.lang.Thread.currentThread().sleep( 10 )
    			java.lang.System.exit( 0 )
    	
    	java.lang.Thread( closer()).start()
    	
    	return
    	
    def compileIntoJyTest( self, code ):
    	try:
    		import imp
    		module = imp.new_module( "test")
    		code = compile(  str(code) , ".error", "exec")
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
    	except:
    		return None
        
    
	
		
if __name__ == '__main__':
	java.lang.System.setSecurityManager( jrmi.RMISecurityManager() )
	jus = JyUnitServer()
	registry = jregistry.LocateRegistry.createRegistry( 3000)
	registry.bind( "JyUnitServer",  jus )
	print "started"

