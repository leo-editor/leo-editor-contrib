#@+leo-ver=4-thin-encoding=utf-8,.
#@+node:zorcanda!.20050425111414.1:@thin JyTest.py
import junit
import junit.framework.Assert
from junit.framework import AssertionFailedError
from java.lang import Throwable
from java.lang import Boolean

class JyTest( junit.framework.TestSuite ):
	'''Base class for jython/junit test cases to be subclassed from.  Passing a
	name parameter will function as the TestCase constructor with a named method
	parameter passed in; only the method name passed in will execute.  Otherwise
	all "test" methods will be executed when runTest is invoked.  In addition to the
 	"test" methods, or method, being invoked the setUp and tearDown methods/defs
	 will be invoked if they are overided.
	  note this class defines self.true and self.false for convenient access to Boolean
	TRUE and FALSE( can be usefull in the static Assert methods.

	 Also note that though the JyTest is not actually a TestCase and hence not a subclass
	 of Assert, that the Assert methods are added to the class.  There for they can be accessed
	like so: self.assertTrue( self.true ), self.fail(), etc... '''

	mdict = {} #need unique module name for this to work, shouldn't be a problem.

	def __init__( self, name = None ):
		#do not call the superclass constructor, there isn't any useful
		#initialisation to perform and also leads to a strange bug on
		#re-execution of the __init__ method in the TestRunner.
		tmethods = self._getTMethods()
		for z in tmethods:
			cMS = self._getCMString( z.__name__ )
			class meth_obj: #convenient object that holds references to the needed methods.
				def __init__( self, method, parent ):
					self.method = method
					self.setUp = parent.setUp
					self.tearDown = parent.tearDown
					
			m_obj = meth_obj( z, self )	
			JyTest.mdict[ cMS ] = m_obj
		
		if name:
			self.setName( name )
			cMS = self._getCMString( name )
			self.addTest( _MethodTestCase( cMS ) )
		else:			
			for z in tmethods:
				cMS = self._getCMString( z.__name__ )
				mtc = _MethodTestCase( cMS )
				self.addTest( mtc )
		
		self._addAssertMethods()
		self.true = Boolean.TRUE
		self.false = Boolean.FALSE
	
	def _addAssertMethods( self ):
		'''adds the Assert static methods to the JyTest instance'''
		self.__dict__.update( junit.framework.Assert.__dict__ )
		

	def run( self, result ):
	
		[ e.fixtureInPlace() for e in self.tests() ] #ensures that setUp and tearDown are not called in the individual method wrappers.
 		self.setUp()								 #is reset in the wrappers.
		junit.framework.TestSuite.run( self, result )
		self.tearDown()
	
	def _getCMString( self, name ):
		'''returns a string made up of the class and a method name'''
		return "%s.%s" %( self.__class__.__str__(), name )
	
	def _getTMethods( self ):
		'''returns all the methods that start with "test" in the JyTest subclass'''
		attr = dir( self.__class__ )
		tmethods = []
		for z in attr:
			if z.startswith( "test" ):
				tmethods.append( getattr( self, z ) )
		return tmethods
		
	def toString( self ):
		return self.__class__.__str__()
		
	def setUp( self ):
		pass
		
	def tearDown( self ):
		pass
			
		
	
	
class _MethodTestCase( junit.framework.TestCase ):
		'''This class enables the TestRunner to execute individual methods of
		   the JyTest instance.  Also enables the individual rerunning of
		   methods in the JyTest instance.  This is a private class'''
		def __init__( self, name = None ):
			
			self._results = None #this will be set in run, we use it to store results.
			self._makeFixture = 1
			if name:
				self.setName( name )
		
		def toString( self ):
			return self.getName().split( '.' )[ -1 ]
	
		def run( self, results ):
		
			self._results = results
			junit.framework.TestCase.run( self, results )
			
		def fixtureInPlace( self ):
			self._makeFixture = 0
			
		def fixtureRemoved( self ):
			self._makeFixture = 1		
	
		def runTest( self ):
			'''overrides the default runTest method so a jython subclass of this will}
		   	function in the framework.  JUnit is not sophisticated enough to deal with}
		   	Jython( its ability to discover "test" methods doesnt work with Jython )'''
		
			m_obj = JyTest.mdict[ self.getName() ]
			if self._makeFixture: m_obj.setUp()
			try:
				try:
					m_obj.method()
				except AssertionFailedError, x:
					self._results.addFailure( self, x )
				except Throwable, t:
					self._results.addError( self, t )
			finally:
				if self._makeFixture: m_obj.tearDown()
				self.fixtureRemoved()
#@-node:zorcanda!.20050425111414.1:@thin JyTest.py
#@-leo
