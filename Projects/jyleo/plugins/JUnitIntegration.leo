<?xml version="1.0" encoding="UTF-8"?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="7" clone_windows="0"/>
<globals body_outline_ratio="0.5">
	<global_window_position top="26" left="8" height="704" width="1014"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="zorcanda!.20050425111414"><vh>@thin JyTestSuite.java</vh></v>
<v t="zorcanda!.20050425111414.1"><vh>@thin JyTest.py</vh></v>
<v t="zorcanda!.20050426074224" tnodeList="zorcanda!.20050426074224"><vh>@file-nosent JUnitServer.java</vh></v>
<v t="zorcanda!.20050426075912" a="V" tnodeList="zorcanda!.20050426075912"><vh>@file-nosent AbstractJUnitServer.java</vh></v>
<v t="zorcanda!.20050426075051" a="T" tnodeList="zorcanda!.20050426075051,zorcanda!.20050426082940"><vh>@file-nosent JyUnitServer.py</vh>
<v t="zorcanda!.20050426082940"><vh>compileIntoJyTest</vh></v>
</v>
<v t="zorcanda!.20050425115109"><vh>@thin JUnitIntegrator.py</vh></v>
</vnodes>
<tnodes>
<t tx="zorcanda!.20050426074224">@language java

import java.rmi.*;
import java.util.*; 
import junit.framework.TestResult; 


public interface JUnitServer extends Remote{


	public void addTest( String test ) throws RemoteException;
	public void runTests() throws RemoteException;
	public Vector&lt;String&gt; getFailures() throws RemoteException;
	public void reset() throws RemoteException;
	public void shutdown() throws RemoteException;
	

}</t>
<t tx="zorcanda!.20050426075051">import AbstractJUnitServer
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
    	
    @others    
	
		
if __name__ == '__main__':
	java.lang.System.setSecurityManager( jrmi.RMISecurityManager() )
	jus = JyUnitServer()
	registry = jregistry.LocateRegistry.createRegistry( 3000)
	registry.bind( "JyUnitServer",  jus )
	print "started"

</t>
<t tx="zorcanda!.20050426075912">@language java

import java.rmi.*;
import java.rmi.server.*; 

public abstract class AbstractJUnitServer extends UnicastRemoteObject implements JUnitServer{


	public AbstractJUnitServer() throws RemoteException{
	
		super();
	
	
	}
	
}</t>
<t tx="zorcanda!.20050426082940">def compileIntoJyTest( self, code ):
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
    

</t>
</tnodes>
</leo_file>
