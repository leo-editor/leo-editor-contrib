//@+leo-ver=4-thin
//@+node:zorcanda!.20051116115841:@thin Bg.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.leo.shell.util.*;
import java.util.concurrent.*;
import javax.swing.text.*;
import java.io.IOException;
import java.io.OutputStream;
import org.python.core.*;
import org.python.util.*;
import java.awt.*;
import javax.swing.*;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

public class Bg implements MagicCommand{

    JythonShell js;
    Jobs jobs;
    
    
    public void setJythonShell( JythonShell shell ){
    
        jobs = new Jobs( shell );
        js = shell;
        js._pi.set( "jobs", jobs );
    
    }
    
    public String getName(){ return "%bg"; }
    public String getDescription(){
        return "%bg --> this magic command takes a method/function and runs it in a background thread.\n"+
        "For example:\n"+
        "%bg doit()\n"+
        "This executes doit in a thread.  The status of the operation can be seen by looking at the jobs object:\n"+
        "jobs.status()  #--> this prints out the status of the jobs.\n"+
        "Alternatively you can access the status like so:\n"+
        "jobs[ jobnumber ].result\n"+
        "jobnumber is printed out when the method/function is about to execute.\n"+
        "The result will be the return value of the method/function or it will tell you the job isn't finished yet.\n\n";
        
    } 

    public boolean handle( String command ){
    
        return command.startsWith( "%bg " );
    
    }

    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051116120603:<<command>>
        String line = command.substring( "%bg".length() );
        line= line.trim();
        String message = String.format( "\nJob Number %1$d has started...\n", jobs.getNextJobNumber() );
        SimpleAttributeSet sas = new SimpleAttributeSet();
        StyleConstants.setForeground( sas, Color.GREEN );
        StringInserter si = new StringInserter( message, (JTextPane)js.getShellComponent(), sas ,js );
        InsertPrompt ip = new InsertPrompt( js, false );
        Job job = new Job( js._pi, line, jobs.getNextJobNumber() , si, ip );
        jobs.submit( job );
        //@-node:zorcanda!.20051116120603:<<command>>
        //@nl
        return true;
    }

    //@    <<jobs class>>
    //@+node:zorcanda!.20051116134140:<<jobs class>>
    public static class Jobs{
    
        Map<Integer, Job> jobs;
        ExecutorService es;
        int jobnumber;
        JythonShell js;
        public Jobs( JythonShell js ){
        
            this.js = js;
            jobs = new LinkedHashMap< Integer, Job>();
            es = Executors.newCachedThreadPool(); 
            int jobnumber = 0;
        }
    
        public int getNextJobNumber(){
        
            return jobnumber;
            
        }
        
        public String toString(){
            
            return "jobs object";
        
        }
    
        public void status(){
        
            StringBuilder sb = new StringBuilder();
            for( Integer i: jobs.keySet() ){
            
                Job job = jobs.get( i );
                String status = job.getResult();
                sb.append( i ).append( ": " ).append( status );
                if( ! status.endsWith( "\n" ) ) sb.append( "\n" );
            
            
            }
            
            OutputStream out = js.getStandardOut();
            try{
                out.write( sb.toString().getBytes() );
            }
            catch( IOException io ){}
        
        
        }
    
        public Object __getitem__( int jobnumber ){
        
            return jobs.get( jobnumber );
        
        
        }
    
    
        
        public void submit( Job job ){
            
            jobs.put( jobnumber, job );
            es.submit( job );
            jobnumber++;
        
        }
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051116134140:<<jobs class>>
    //@nl

    public static class Job implements Runnable{
    
        InteractiveInterpreter pi;
        String job;
        int jn;
        StringInserter si;
        InsertPrompt ip;
        PyDictionary rv;
        String startmessage;
        PyInteger pjn;
        public Job( InteractiveInterpreter pi, String job, int jn , StringInserter si , InsertPrompt ip){
        
            this.pi = pi;
            this.job = job;
            this.jn = jn;
            this.si = si;
            this.ip = ip;
            rv = new PyDictionary();
            startmessage = "Not Finished Executing...";
            pjn = new PyInteger( jn );
            rv.__setitem__( pjn , new PyString( startmessage ) );
        }
        
        public String toString(){
        
            return String.format( "Job number %1$d", jn );
        
        }
        
        public String getResult(){
        
            return rv.__getitem__( pjn ).toString();
        
        }
    
        public void run(){
        
            try{
                
                try{
                    if( si != null ) SwingUtilities.invokeAndWait( si );
                    if( ip != null ) SwingUtilities.invokeAndWait( ip );
                }
                catch( InvocationTargetException ite ){}
                String executejob = String.format( "rv[ %1$d ] = %2$s", jn, job );
                PyDictionary pd = new PyDictionary();
                pd.__setitem__( new PyString( "rv" ), rv );
                Py.exec(Py.compile_flags( executejob, "<string>", "exec", null), pd, pi.getLocals() );
                if( rv.__getitem__( pjn ).toString().equals( startmessage ) )
                    rv.__setitem__( pjn, new PyString( "Finished Execution, no return value" ) );

            }
            catch( Exception x ){
            
                x.printStackTrace();
            
            }
        }
    
    
    
    }

}

//@-node:zorcanda!.20051116115841:@thin Bg.java
//@-leo
