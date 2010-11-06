//@+leo-ver=4-thin-encoding=utf-8,.
//@+node:zorcanda!.20050425111414:@thin JyTestSuite.java
//@@language java

import java.util.Comparator;
import java.util.Arrays;
import junit.framework.Test;
import junit.framework.TestSuite; 
import junit.swingui.TestRunner;
import org.python.util.PythonInterpreter;


//@<<class doc>>
//@+node:zorcanda!.20050425114834:<<class doc>>
/**
 * JyTestSuite is an extension to the JUnit TestSuite class that enables
 * the developer to build his TestCase instances in Jython.  A miniframework
 * within a framework.  The user will need the JUnit and Jython packages on his
 * classpath to use this classs.  
 * 
 * The Test should be subclassed from JyTest.py.  An example of this is:
 * 
 * import JyTest
 * 
 * class ExampleTest( JyTest.JyTest ):
 * 
 * 		def setUp( self ):
 * 			print "Setting up..."
 * 
 * 		def tearDown( self):
 * 			print "Tearing down..."
 * 
 *		def testPrint( self ):
 *			print "Testing print..."
 *
 * when added to the JyTestSuite via the addJyTest method and subsequently
 * running the JyTestSuite in one of the TestRunner classes you should see
 * "Testing print..." outputed on on standard out, as well as the setUp and tearDown
 * method messages.
 * 
 * An equivilent java version of this is:
 * 
 * import junit.framework.TestCase;
 * 
 * public class ExampleTest extends TestCase{
 * 
 *		public void setUp(){
 *			
 *			System.out.println( "Setting up..." );
 *
 *		}
 * 
 * 		public void tearDown(){
 * 
 * 			System.out.println( "Tearing down..." );
 * 
 * 		}
 * 
 * 		public void testPrint(){
 * 
 * 			System.out.println( "Testing prin..." );
 * 
 * 		}
 * 
 * 	}
 * 
 * Using this framework with TestSuite instances are simple as well.  An example:
 * import junit.framework.TestSuite
 * from JyTest import JyTest as jtc
 *
 *
 *
 *	class testSuite( junit.framework.TestSuite ):
 *		'''An example of using a TestSuite with JyTest'''
 *		def __init__( self ):
 *	
 *			self.addTest( _tc() )
 *			self.addTest( _tc2() )
 *			self.addTest( _tc3() )
 *
 * 		def toString( self ):
 *			return "a TestSuite with JyTests example"
 *
 *
 *	class _tx( jtc ):
 *		'''simple JyTest subclass'''
 *		def testP( self ):
 *			print "p"
 *	
 *	class _tc2( jtc ):
 *		'''simple JyTest subclass'''
 *		def testR( self ):
 *			print  "r"
 *
 *	class _tc3( jtc ):
 *		'''simple JyTest subclass'''
 *		def testZ( self ):
 *			print "z"
 * 
 * 	To use this test, for example you could feed the JyTestSuite class the name
 *  of this module, which should be testSuite, to it as a command line parameter.
 *  This in turn will load the suite as a test case.  This shows that it is possible
 *  to aggregate many jython test cases in a suite, simplifying testing further.
 * 
 * It should be apparent that the jython based test case requires less work to implement
 * at this point; Jython test cases are more succinct.  The benefits of the jython approach is 
 * that building unit tests in the JUnit framework will be less labor intensive and also enable
 * the developer to craft more unit tests than before in the alloted amount of time.
 * 
 * The class is capable of running as is( see main ) but is also intended to be used by other
 * classes in Java or Jython if it the need arrises.
 * 
 * current issues:
 * 1. Apparently you cant execute individual methods on a jython file.  To
 * 	  emulate this, pass the method name you want to execute to the constructor
 *    of a JyTest instance.  For example:
 * 
 * 		class OneMethod( JyTest ):
 * 
 * 			def __init__( self , name ):
 * 				JyTest.__init__( self, name ):
 * 
 * 			def testOne( self ):
 * 				print "one"
 * 
 * 			def testTwo( self ):
 * 				print "two"
 * 
 *		ometh = OneMethod( "testTwo" )
 *		#At this point ometh is keyed to execute the "testTwo" method.
 *
 * @version .1
 */
//@nonl
//@-node:zorcanda!.20050425114834:<<class doc>>
//@nl
  
public class JyTestSuite extends TestSuite {

	private static JyTestSuite _jts;
	private final PythonInterpreter _py;
	private final static String PATH = "path+=";
	
	/**
	 * This constructor initialises the PythonInterpreter that the JyTestSuite
	 * will use to execute the JyTest derived tests.
	 */
	public JyTestSuite() {
		
		super();
		_py = new PythonInterpreter();
		_py.exec( "import sys");
		
	}
	
    //@	@+others
    //@+node:zorcanda!.20050425114834.1:addToSysPath
    /**
     * Calling this method will append a file path to the Jython interpreter embedded
     * in the JyTestSuit instance.  This allows tests from multiple directories
     * to be imported by the addJyTest method; this method should be called before
     * addJyTest or a test case not on the current path will not be loaded.
     * @param path - the path to the jython test cases.
     */
    public final void addToSysPath( final String path ){
    	
    	try{
    
    		_py.exec("sys.path.append('" + path + "')");
    	
    	}
    	catch( Exception x ){
    		
    		System.err.println( "Error in import because of: " + x );
    		
    	}
    			
    }
    //@-node:zorcanda!.20050425114834.1:addToSysPath
    //@+node:zorcanda!.20050425114834.2:addJyTest
    /**
     * This method adds a jython test case to the instance.  It takes the name
     * of a module/testcase and instantiates a Test based off of the modules name.
     * @see main for javadoc example of this.
     * @param module - the module to be imported
     */
    
    public final void addJyTest( final String module ){
    	
    	try{
    		int index = module.indexOf(':' );
    		String mod = null;
    		String method = null;
    		if( index != -1){
    			
    			String[] mm = module.split( ":");
    			mod = mm[ 0 ];
    			method = mm[ 1 ];
    							
    		}
    		else
    			mod = module;
    			
    		String istatement = "import " + mod;
    		_py.exec( istatement);
    		String tf = mod + "." + mod;
    		String cstatement = "_jy_test = " + tf + ( method == null? "()": "('"+ method + "' )" );
    		_py.exec( cstatement );
    		Test ts = (Test)_py.get( "_jy_test" ).__tojava__(Test.class);
    		this.addTest( ts );
    	
    	}
    	catch( Exception x ){
    		//one exception should not sink the whole test suite, but we pass it on as a err message
    	    //if there is an Exception in the method.
    		System.err.println( x );
    		
    		
    	}
    	
    }
    //@nonl
    //@-node:zorcanda!.20050425114834.2:addJyTest
    //@+node:zorcanda!.20050425114834.3:suite
    public static Test suite(){
    	
    	return _jts;
    	
    }
    //@nonl
    //@-node:zorcanda!.20050425114834.3:suite
    //@+node:zorcanda!.20050425114834.4:setStaticJyTestSuite
    /**
     * This method sets the static instance of the JyTestSuite.  This enables
     * the class to interoperate with the various test runners through the
     * suite method.
     * @see suite( functions as the accessor of the variable )
     * @param jts - that JyTestSuite that will become the statically contained instance.
     */
    public final static void setStaticJyTestSuite( final JyTestSuite jts ){
    	
    	_jts = jts;
    	
    }
    //@nonl
    //@-node:zorcanda!.20050425114834.4:setStaticJyTestSuite
    //@+node:zorcanda!.20050425114834.5:main
    /**
     * This main method creates and sets the static JyTestSuite.  The parameter is an
     * array of Strings that denotes the jython test classes to be added to the JyTestSuite.
     * The form expected is that there will be a file that contains a class with the same
     * name as the Jython file.  For example: "TestBeast" as a parameter will import
     * the jython module TestBeast.py and attempt to instantiate a class from that module
     * called TestBeast.  An example:
     * 
     * java JyTestSuite TestBeast
     * 
     * will execute the TestBeast jython test.
     * 
     * to add a path to where the Jython interpreter will look for a test case use
     * the parameter padd+=path from one to N times to add path data. '+=' implies addition to
     * while '=' implies overwriting, hence the unconvential usage here.
     * 
     * For example:
     * 
     * java JyTestSuite TestBeast padd+=/path/to/test/beast/ TestBeast2 padd+=/path/to/test/beast2/
     * 
     * this will add 2 paths to where Jython will search for TestBeast and TeastBeast2.
     * 
     * JyTest instances that should execute only one method should be referenced like so:
     * JyTest:methodname
     * 
     * for example:
     * 
     * 		AJythonTest:testThis
     * 
     * will set AJythonTest up to execute only its testThis method.
     * 
     * @param args - an array of test names to be added to the static JyTestSuite.
     */
    public synchronized static void main( final String[] args) {
    	
    	JyTestSuite jts = new JyTestSuite();
    	setStaticJyTestSuite( jts );
    	Arrays.sort( args, jts.new _PAddComparator() ); //make sure padd args come first.
    	for( int x = 0; x < args.length; x++ ){//adds jython tests.
    		
    		String sarg = args[ x ];
    		if( sarg.startsWith( PATH ) ){
    			
    			String[] path = sarg.split( "\\+=" ); // we need to escape the \ with \ so we can escape the +
    			jts.addToSysPath( path[ 1 ] );
    			
    		}
    		else
    			jts.addJyTest( sarg );
    	
    	}
    	
    	TestRunner.run(JyTestSuite.class);
    	
    	}
    
    	private	final 	class _PAddComparator implements Comparator{
    		//simple Comparator to ensure that path+= commands come before modules.
    		public final int compare( final Object one, final Object two){
    			
    			final String _one = (String)one;
    			final String _two = (String)two;
    			boolean _onePadd = false;
    			boolean _twoPadd = false;
    			if( _one.startsWith( PATH ) )
    				_onePadd = true;
    			if( _two.startsWith( PATH ) )
    				_twoPadd = true;
    			
    			return _compare( _onePadd, _twoPadd );
    			
    		}
    //@nonl
    //@-node:zorcanda!.20050425114834.5:main
    //@-others
	
	
	

	
	
	
	

	

	
	public String toString(){
		
		return "JyTestSuite( holds " + countTestCases() + " tests";
		
	}


	
			
			private final int _compare( final boolean one, final boolean two ){
				
				if( one == two ) return 0; //who cares which comes first
				else if( one && ( one != two ) ) return -1; //the padd= must come first
				else return 1;// the 2nd padd must come first, we know its true otherwise
								// the other tests would have got it.
				
			}
			
		}
		

}

//@-node:zorcanda!.20050425111414:@thin JyTestSuite.java
//@-leo
