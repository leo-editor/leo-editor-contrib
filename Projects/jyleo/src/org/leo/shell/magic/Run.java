//@+leo-ver=4-thin
//@+node:zorcanda!.20051122094602:@thin Run.java
//@@language java
package org.leo.shell.magic; 

import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand; 
import org.python.core.*;
import java.io.*;
import java.util.*; 
import java.util.regex.Pattern;
import javax.swing.SwingUtilities;


public class Run implements MagicCommand{

    JythonShell js;
    boolean listening;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
        listening = false;
    
    }
    
    public String getName(){ return "%run"; }
    public String getDescription(){
    
        return "%run: Run the named file inside the JythonShell as a program.\n"+
                "Usuage:\n"+
                "%run [-n -i -t [-N<N>] -d [-b<N>] -p [profile options]] file [args]\n"+
                "Options:\n"+
                " -n: name is NOT set to   main  , but to the running file s name without extension (as python does under import). This allows running scripts and reloading the definitions in them without calling code protected by an   if name ==   main     clause.\n"+
                "-i: run the file in JythonShell's namespace instead of an empty one. This is useful if you are experimenting with code written in a text editor which depends on variables defined interactively.\n"+
                "-t: print timing information at the end of the run.  If -t is given, an additional -N<N> option can be given, where <N> must be an integer indicating how many times you want the script to run. The final timing report will include total and per run results.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().startsWith( "%run " );
    
    }


    public boolean doMagicCommand( String command ){
    
    
        //@        <<command>>
        //@+node:zorcanda!.20051122094602.1:<<command>>
        
        String[] spieces = command.split( "\\s+" );
        LinkedList<String> switches = new LinkedList<String>();
        for( int i = 0; i < spieces.length; i ++ ){
        
            if( i == 0 ) continue;
            String cloption = spieces[ i ];
            if( !cloption.startsWith( "-" ) ) break;
            switches.add( cloption );
            command = command.replaceFirst( "\\" + cloption, "" );
        }
        
        String[] pieces = command.split( "\\s+", 3 );
        if( pieces.length >= 2 ){
            
            String fname = pieces[ 1 ];
            if( !fname.endsWith( ".py" ) ) fname += ".py";
            File test = new File( fname );
            if( !test.exists() ){
            
                String[] path = fname.split( "\\." );
                StringBuilder sb = new StringBuilder();
                for( int i = 0; i < path.length - 1; i ++ ){
                
                    sb.append( path[ i ] ).append( "/" );
                
                }
                if( sb.charAt( sb.length() -1 ) == '/' ) sb.deleteCharAt( sb.length() -1 );
                sb.append( ".py" );
                fname = search( sb.toString() );
                if( fname == null ) return true;
            
            }
        
            List<String> pyswitches;
            if( pieces.length == 3 )
                pyswitches = org.leo.shell.util.CommandLineParser.parseCommandLine( pieces[ 2 ] );
            else pyswitches = new ArrayList();
            
        
            PyDictionary locals = new PyDictionary();
            if( switches.contains( "-i" ) ) locals.update( js._pi.getLocals() );
        
        
            PyString __name__ = new PyString( "__name__" );
            if( switches.contains( "-n" )){
                
                String lname = pieces[ 1 ];
                if( lname.endsWith( ".py" ) ) lname = lname.replaceFirst( "\\.py$", "" );
                locals.__setitem__( __name__, new PyString( lname ) );
            
            }
            else locals.__setitem__( __name__ , new PyString( "__main__" ) );
            
            long time = 0l;
            int iterations = 1;
            boolean timeit = false;
            if( switches.contains( "-t" ) ) timeit = true;
            if( timeit ){
            
                Integer i = getNumberFromSwitches( switches, "-N" );
                if( i != null ) iterations = i;
            
            }
            
            boolean debug = false;
            int lineno = -1;
            if( switches.contains( "-d" ) ) debug = true;
            if( debug ){
                
                Integer i = getNumberFromSwitches( switches, "-b" );
                if( i != null ) lineno = i;
                runDebug( fname, lineno );
                return false;
            
            }
            
            boolean profile = switches.contains( "-p" );
            for( int i = 0; i < iterations; i++ ){
            
                long start = System.currentTimeMillis();
                run( fname, pyswitches, locals, profile );
                long end = System.currentTimeMillis();
                time += ( end - start );
        
            }
            if( timeit ){
            
                OutputStream stdout = js.getStandardOut();
                String message = String.format( "Time: %1$d with %1$d iterations\n", time, iterations );
                try{
                
                    stdout.write( message.getBytes() );
                
                }
                catch( IOException io ){}
            
            }
        }
        //@-node:zorcanda!.20051122094602.1:<<command>>
        //@nl
        return true;
    
    }
    
    //@    @+others
    //@+node:zorcanda!.20051122100318:search
    public String search( String file ){
    
        String classpath = System.getenv( "CLASSPATH" );
        String sep = System.getProperty( "path.separator" );
        String[] paths = classpath.split( Pattern.quote( sep ) );
        for( String path: paths ){
        
            File test = new File( path, file );
            if( test.exists() ) return test.getAbsolutePath();
        
        
        }
        
        return null;
    }
    //@nonl
    //@-node:zorcanda!.20051122100318:search
    //@+node:zorcanda!.20051122133226:run
    public void run( String fname, List<String> switches, PyDictionary locals, boolean profile  ){
        
        js._pi.exec( "import sys" );
        PyObject sys = js._pi.get( "sys" );
        PyList sysargv = (PyList)__builtin__.getattr( sys, new PyString( "argv" ) );
        PyList pl = new PyList( (PyObject)sysargv );
        sysargv.clear();
        sysargv.add( fname );
        sysargv.addAll( switches );
        if( profile ){
        
            String arg_str = String.format( "arg_str = 'execfile( \\'%1$s\\',{})'", fname ); 
            String[] pstrings = new String[]{
            
            "import profile",
            "prof = profile.Profile()",
            arg_str,
            "try:",
            "   prof = prof.runctx( arg_str, locals(), locals() )",
            "except SystemExit:",
            "   sys_exit = '''*** SystemExit exception caught in code being profiled.'''",
            "prof.print_stats()",
            };
            StringBuilder sb = new StringBuilder();
            for( String s: pstrings ) sb.append( s ).append( "\n" );
            js._pi.exec( sb.toString() );
        
        }
        else
            __builtin__.execfile_flags( fname, locals, locals, null );
        PyObject localmap = js._pi.getLocals();
        ((PyStringMap)localmap).update( locals );
        sysargv.clear();
        sysargv.addAll( pl );
    
    }
    //@-node:zorcanda!.20051122133226:run
    //@+node:zorcanda!.20051122144243:runDebug
    public void runDebug( final String fname, final int breakpoint ){
        
        class Runner implements Runnable{
        
            public void run(){
            
                StringBuilder sb = new StringBuilder();
                sb.append( "filename = '" + fname + "'" ).append( "\n" );
                String[] realpdb;
                if( breakpoint != -1 ){
                    sb.append( String.format( "bp = %1$d", breakpoint ) ).append( "\n" );
                    realpdb = pdb;   
                }
                else realpdb = pdb2;
                for( String s: realpdb )
                        sb.append( s ).append( "\n" );
    
                
                String command = sb.toString();
                ByteArrayInputStream bais = new ByteArrayInputStream( command.getBytes() );
                js._pi.execfile( bais, fname );
                org.leo.shell.util.InsertPrompt ip = new org.leo.shell.util.InsertPrompt( js, false );
                SwingUtilities.invokeLater( ip );
            
            }    
        
        
        
        }
        js.execute1( new Runner() );
    
    
    }
    //@-node:zorcanda!.20051122144243:runDebug
    //@+node:zorcanda!.20051122140454:getNumberFromSwitches
    public Integer getNumberFromSwitches( List<String> switches, String swname ){
    
    
        for( String s: switches ){
            
            if( s.startsWith( swname ) ){
                
                try{
                    String number = s.substring( 2 );
                    return Integer.valueOf( number );
                }
                catch( Exception x ){}
                
            }
            
        }
    
        return null;
    
    }
    //@nonl
    //@-node:zorcanda!.20051122140454:getNumberFromSwitches
    //@+node:zorcanda!.20051122143237:pdb array...
    private static String[] pdb = new String[]{
    "import pdb;import bdb",
    "deb = pdb.Pdb()",
    "bdb.Breakpoint.next = 1",
    "bdb.Breakpoint.bplist = {}",
    "bdb.Breakpoint.bpbynumber = [None]",
    "maxtries = 10",
    //"bp = %1$d",//int(opts.get('b',[1])[0])",
    "checkline = deb.checkline(filename,bp)",
    "ok = True",
    "if not checkline:",
    "    for bp in range(bp+1,bp+maxtries+1):",
    "        if deb.checkline(filename,bp):",
    "            break",
    "            ok = True",
    "        else:",
    "            msg = ('I failed to find a valid line to set '",
    "                                   'a breakpoint '",
    "                                   'after trying up to line: %s. '",
    "                                   'Please set a valid breakpoint manually '",
    "                                   'with the -b option.' % bp)",
    "            #error(msg)",
    "            #return",
    "            ok = False",
    "if ok:",
    "   deb.do_break('%s:%s' % (filename,bp))",
    "   print 'NOTE: Enter \\'c\\' at the'",
    "   print '(Pdb) prompt to start your script.'",
    "   deb.run('execfile(\\'%s\\')' % filename,{})"};
    //@nonl
    //@-node:zorcanda!.20051122143237:pdb array...
    //@+node:zorcanda!.20051122165623:pdb array2
    private static String[] pdb2 = new String[]{
    "import pdb",
    "deb = pdb.Pdb()",
    "deb.run('execfile(\\'%s\\')' % filename,{})"};
    //@nonl
    //@-node:zorcanda!.20051122165623:pdb array2
    //@-others

}
//@nonl
//@-node:zorcanda!.20051122094602:@thin Run.java
//@-leo
