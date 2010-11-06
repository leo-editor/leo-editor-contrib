//@+leo-ver=4-thin
//@+node:zorcanda!.20051114093736.1:@thin Macro.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.LineListener;
import org.leo.shell.MagicCommand;
import java.io.IOException;
import java.io.OutputStream;
import java.util.*;
import java.lang.ref.*;
import org.python.core.*;


public class Macro implements MagicCommand,LineListener{

    JythonShell js;
    Map<String, LinesExecutor> macros;
    //ReferenceQueue<LinesExecutor> ref;
    
    public Macro(){
    
        macros = new HashMap<String, LinesExecutor>();
        //ref = new ReferenceQueue<LinesExecutor>();
    
    }
    
    public String getName(){ return "%macro"; }
    
    
    public String getDescription(){
    
        return "%macro --> this defines a macro that can be executed by using the name given:\n" +
        "An example:\n"+
        "%macro macex 9:10 11 12:13 4\n"+
        "This creates a macro called macex and puts line 9-10, 11 12-13 and 4 from the history into it\n" +
        "Hence entering macex and typing enter will cause those lines to rexecute.\n"+
        "To see the contents of the macro type: print macroname\n" +
        "This will print out the macro's contents.\n" +
        "To remove a macro: del macroname\n\n";
    
    }
    
    public String lineToExecute( String line ){
    
        String test = line.trim();
        if( macros.containsKey( test ) ){
        
         LinesExecutor le = macros.get( test );
         Object o = js._pi.get( test );
         if( o == le )
            return String.format( "%1$s()", test );
        else macros.remove( test );

         }
        return line;
    
    }
    
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
        js.addLineListener( this );
    
    }


    public boolean handle( String command ){
    
        return command.startsWith( "%macro" );
    
    }


    public boolean doMagicCommand( String command ){
        
        List<String> history = js.history;
        String[] chunks = command.split( "\\s+" );
        OutputStream out = js.getStandardOut();
        OutputStream err = js.getStandardErr();
        try{
            if( chunks.length < 3 ){
    
                String message = "%macro requires form: %macro macroname n1:n2 n3:n4 ... n5 n6\n";
                err.write( message.getBytes() );
                return false;    
    
            }
            String macro = chunks[ 1 ];
            StringBuilder sb = new StringBuilder();
            for( int i = 2; i < chunks.length; i ++ ) sb.append( chunks[ i ] ).append( " " );
            java.util.List<String> maclines = js.processHistoryString( sb.toString() );
            LinesExecutor le = new LinesExecutor( macro, maclines , js );
            macros.put( macro, le );
            js._pi.set( macro, le );
            
        }
        catch( IOException io ){}
        return false;

    }

    //@    <<class LinesExecutor>>
    //@+node:zorcanda!.20051114094008:<<class LinesExecutor>>
    public static class LinesExecutor extends PyObject{
    
        String name;
        java.util.List<String> contents;
        JythonShell js;
        public LinesExecutor( String name, java.util.List<String> contents, JythonShell js ){
        
            this.name = name;
            this.contents = contents;
            this.js = js;
        
        }
    
    
    
    
        
        public PyString __str__(){
        
            StringBuilder sb = new StringBuilder();
            for( String s: contents ) sb.append( s ).append( "\n" );
            return new PyString( sb.toString() );
        
        }
        
    
        public PyObject __call__(){
            
            for( String s: contents ){
                 if( s.startsWith( "%" ) ){
                 
                    js.magicCommand( s );
                 
                 }
                 else js._pi.exec( s );
            
            }
            return Py.None;
        
        }
    
    }
    //@nonl
    //@-node:zorcanda!.20051114094008:<<class LinesExecutor>>
    //@nl

}
//@-node:zorcanda!.20051114093736.1:@thin Macro.java
//@-leo
