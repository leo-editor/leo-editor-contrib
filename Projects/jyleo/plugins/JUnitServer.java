
import java.rmi.*;
import java.util.*; 
import junit.framework.TestResult; 


public interface JUnitServer extends Remote{


	public void addTest( String test ) throws RemoteException;
	public void runTests() throws RemoteException;
	public Vector<String> getFailures() throws RemoteException;
	public void reset() throws RemoteException;
	public void shutdown() throws RemoteException;
	

}