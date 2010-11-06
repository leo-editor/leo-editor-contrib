//@+leo-ver=4-thin
//@+node:zorcanda!.20051114094832:@thin History.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.leo.shell.util.InsertPrompt;
import java.util.*;
import javax.swing.SwingUtilities;
import java.io.OutputStream;
import java.io.IOException;


public class History implements MagicCommand{

    JythonShell js;
    public History(){
    
    
    
    }
    
    public String getName(){ return "%hist"; }
    public String getDescription(){
    
    
        return "%hist --> this has 3 forms and actions:\n" +
        "   %hist [ -n ]  --> this prints the total history or the last 40 items in it.\n" +
        "   %hist [ -n ] n1 --> this prints the last n1 items in the history.\n" +
        "   %hist [ -n ] n1 n2 --> this prints the items from index n1 to index n2.\n" +
        "   -n signifies that line numbers should not be printed out\n\n";
    
    } 
    
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }

    public boolean handle( String command ){
    
        return ( command.startsWith( "%hist " ) || command.trim().equals( "%hist" ) );
    
    
    }

    public boolean doMagicCommand( String command ){
    
    List<String> history = js.history;
    boolean option_n = false;
    int index = command.indexOf( "-n" );
    OutputStream out = js.getStandardOut();
    OutputStream err = js.getStandardErr();
    try{
        if( index != -1 ){
    
            String test = command.substring( 0, index );
            test = test.trim();
            if( test.equals( "%hist" ) ){
        
                option_n = true;
                command = command.replaceFirst( "\\-n", "" );
        
            }
      
    
        }
        String[] pieces = command.trim().split( "\\s+" );
        if( pieces.length == 2 ){ 
    
            //@            <<from>>
            //@+node:zorcanda!.20051114094845:<<from>>
            final String number1 = pieces[ 1 ];
            
            if( isNumber( number1 ) ){
            
                int amount = Integer.valueOf( number1 );
                if( amount > history.size() ){
                
                    String message = String.format( "Illegal Request: History size is %1$d request size is %2$d\n" , history.size(), amount );
                    err.write( message.getBytes() );
                    //js.badMagicCommand( message );
            	       //js.insertPrompt( false );
                    return false;
                
                }
                java.util.List<String> range = new ArrayList<String>( amount );
                int start = ( history.size() - amount );
                ListIterator<String> li = history.listIterator( start );
                while( li.hasNext() ) range.add( li.next() );
                //InsertPrompt ip = new InsertPrompt( js, false );
                outputList( range, !option_n , start );
                //java.util.List<Runnable> runners = new ArrayList<Runnable>();
                //runners.add( ip );
                //OutputList ol = new OutputList( range, start , js.getStandardOut(), !option_n,  runners );
                //js.execute1( ol );
                return false;
            
            }
            else{
            
                String message = "First parameter must be a number\n";
                err.write( message.getBytes() );
                //js.badMagicCommand( message );
                //js.insertPrompt( false );
                return false;
            
            }
            //@nonl
            //@-node:zorcanda!.20051114094845:<<from>>
            //@nl
    
        }
        if( pieces.length == 3 ){
            
                //@                <<range>>
                //@+node:zorcanda!.20051114095223:<<range>>
                final String number1 = pieces[ 1 ]; 
                final String number2 = pieces[ 2 ];
                if( isNumber( number1 ) && isNumber( number2 ) ){
                                
                    int start = Integer.valueOf( number1 );
                    int end = Integer.valueOf( number2 );
                    if( end > history.size() + 1 ) {
                    
                        String message = String.format( "Illegal Request: History size is %1$d request size is %2$d\n" , history.size(), end );
                        //js.badMagicCommand( message );
                	    //js.insertPrompt( false );
                        err.write( message.getBytes() );
                        return false;
                    
                    
                    }
                    java.util.List<String> range = history.subList( start, end );
                    outputList( range, !option_n, start );
                    //InsertPrompt ip = new InsertPrompt( js, false );
                    //java.util.List<Runnable> runners = new ArrayList<Runnable>();
                    //runners.add( ip );
                    //OutputList ol = new OutputList( range, start, js.getStandardOut(), !option_n, runners );
                    //js.execute1( ol );
                    return false;
                         
                }
                else{
                    
                    boolean n1 = isNumber( number1 );
                    boolean n2 = isNumber( number2 );
                    String message;
                    if( !n1 && !n2 ) message = "Both parameters must be numbers\n";
                    else if( !n1 ) message = "Parameter one must be a number\n";
                    else message = "Parameter two must be a number\n";
                    err.write( message.getBytes() );
                    //js.badMagicCommand( message );
                    //js.insertPrompt( false );
                    return false;
                
                }
                        
                //@-node:zorcanda!.20051114095223:<<range>>
                //@nl
        }   
        if( pieces.length == 1 ){
    
            java.util.List<String> range = null;
            int start = 0;
            if ( history.size() < 40 ){
            range = new ArrayList<String>();
            range.addAll( history );
            }
            else{
                range = history.subList( history.size() - 40, history.size() );
                start = history.size() - 40;    
        
            }
            outputList( range, !option_n, start );
            //InsertPrompt ip = new InsertPrompt( js, false );
            //java.util.List<Runnable> runners = new ArrayList<Runnable>();
            //runners.add( ip );
            //OutputList ol = new OutputList( range, start, js.getStandardOut(), !option_n, runners );
            //js.execute1( ol );
            return false;
    
        }

        err.write( ("Invalid Form For %hist:\n" +
                        "%hist [ -n ] \n" +
                        "%hist [ -n ] n1 \n" +
                        "%hist [ -n ] n1 n2 \n").getBytes() );
        //js.insertPrompt( false );
        return false;
    }
    catch( IOException io ){ return false; }

}

public boolean isNumber( String data ){

    for( char c: data.toCharArray() ){
        if( !Character.isDigit( c ) ) return false;   
    
    }
    return true;   
    
    
    
    }

    //@    @+others
    //@+node:zorcanda!.20051115193608:class OutputList
    public static class OutputList implements Runnable{
    
        java.util.List<String> range;
        java.util.List<Runnable> tailactions;
        int start;
        OutputStream stdout;
        boolean linenumbering;
        public OutputList( java.util.List<String> l, int start, OutputStream out, boolean linenumbering, java.util.List<Runnable> tailactions ){
         
            range = l;
            this.start = start;        
            this.tailactions = tailactions;
            stdout = out;
            this.linenumbering = linenumbering;
        }        
            
        public void run(){
    
            for( int i = 0; i < range.size(); i ++){
                String s = range.get( i );
                String s2 = "";
                if( linenumbering )
                    s2 = String.format( "%1$d: %2$s\n", start++, s );
                else
                    s2 = String.format( "%1$s\n", s );
                try{
                    stdout.write( s2.getBytes() );
                }
                catch( IOException io ){}
     
            }
            for( Runnable runner: tailactions )
                SwingUtilities.invokeLater( runner );
        }  
    }
    //@nonl
    //@-node:zorcanda!.20051115193608:class OutputList
    //@+node:zorcanda!.20051202153629:outputList
    private void outputList( java.util.List<String> range, boolean linenumbering, int start ) throws IOException{
    
        OutputStream stdout = js.getStandardOut();
        for( int i = 0; i < range.size(); i ++){
            String s = range.get( i );
            String s2 = "";
            if( linenumbering )
                s2 = String.format( "%1$d: %2$s\n", start++, s );
            else
                s2 = String.format( "%1$s\n", s );
            stdout.write( s2.getBytes() );
    
     
        }
    
    }
    //@nonl
    //@-node:zorcanda!.20051202153629:outputList
    //@-others


}
//@nonl
//@-node:zorcanda!.20051114094832:@thin History.java
//@-leo
