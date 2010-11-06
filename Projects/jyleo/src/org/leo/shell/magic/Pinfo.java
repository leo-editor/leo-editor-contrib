//@+leo-ver=4-thin
//@+node:zorcanda!.20051117115313:@thin Pinfo.java
//@@language java
package org.leo.shell.magic;

import org.leo.shell.Documentation;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.leo.shell.LineListener;
import org.leo.shell.util.InsertPrompt;
import javax.swing.SwingUtilities;
import org.python.core.*;
import java.awt.*;
import javax.swing.text.*;
import java.util.*;

public class Pinfo implements MagicCommand,LineListener, Documentation{

    JythonShell js;
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
        js.addQuietLineListener( this );
        js.addInteractiveDocumentation( this );
    
    }
    
    public String getDocumentation(){
                
        return "Object Introspection:\n" +
        "Typing the reference name followed by a ? will create\n"+
        "a Object View which gives the user a variety of information\n"+
        "about the Object in question. Example:\n" +
        "a = 'meoooowwww'\n"+
        "a? #Upon Enter, a Panel will appear below showing Object information\n\n";    
        
    }

    public String lineToExecute( String line ){
    
        if( line.endsWith( "?" ) ){
            
            final String vline = line.substring( 0, line.length() -1 );
            Runnable run = new Runnable(){
            
                public void run(){
                    viewObject( vline );
                    js.insertPrompt( false );
                }
            };
            js.setNextPrompt( run );
            return null;
        }
        
        return line;
        
    }
    
    public String getName(){ return "%pinfo"; }
    public String getDescription(){
    
        return "%pinfo --> an alias for the ? object viewer syntax.\n"+
               "Usage:\n"+
               "%pinfo ref\n"+
               "If ref is valid, a widget containing info on the reference will appear.\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().startsWith( "%pinfo " );
    
    }

    public boolean doMagicCommand( final String command ){
    
        //@        <<command>>
        //@+node:zorcanda!.20051117115313.1:<<command>>
        final String[] pieces = command.split( "\\s+", 2 );
        
        
        if( pieces.length == 2 ){
        
            Runnable run = new Runnable(){
                public void run(){
                    viewObject( pieces[ 1 ] );
                    InsertPrompt ip = new InsertPrompt( js, false );
                    SwingUtilities.invokeLater( ip );
                }
            };
            js.setNextPrompt( run );
        }
        //@-node:zorcanda!.20051117115313.1:<<command>>
        //@nl
        return true;
    
    }

    //@    @+others
    //@+node:zorcanda!.20051204140940:viewObject
    public void viewObject( String line ){
        
        final JTextComponent _jtp = js.getShellComponent();
        final String[] tokens = line.split( "\\." );
        final PyObject py = js.getPyObject( tokens );
        final Document doc = _jtp.getDocument();
        if( py == null ){
        
            try{
    
                js.getStandardErr().write( ("No reference recognized for: " + line + "\n").getBytes() );
            }
            catch( final Exception x ){
                //x.printStackTrace();
            
            }
        
        }
        else{
        
            PyList pl = null;
            try{
                pl = (PyList)py.__dir__();
            }
            catch( Exception x ){
            
                pl = new PyList();
            
            }    
            Map<String, Vector<String>> methods = new LinkedHashMap< String, Vector< String > >();
            Vector<String> mname = new Vector<String>();
            methods.put( "Name", mname );
            Map<String, Vector<String>> attributes = new LinkedHashMap< String, Vector< String > >();
            Vector<String> aname = new Vector<String>();
            Vector<String> avalue = new Vector<String>();
            attributes.put( "Name", aname );
            attributes.put( "Value", avalue );
            PyObject ftype = PyType.fromClass( PyFunction.class );
            PyObject mtype = PyType.fromClass( PyMethod.class );
            PyObject rftype = PyType.fromClass( PyReflectedFunction.class );
            PyObject pbtype = PyType.fromClass( PyBuiltinFunction.class );
                for( Object oo: pl ){
                    String sr = oo.toString();
                    if( sr.equals( "__doc__" ) ) continue;
                    PyString ps = new PyString( sr );
                    try{
                        if( __builtin__.hasattr( py, ps ) ){
                            PyObject po = py.__findattr__( ps );
                            if( __builtin__.isinstance( po, rftype )|| 
                                __builtin__.isinstance( po, ftype )||
                                __builtin__.isinstance( po, mtype )||
                                __builtin__.isinstance( po, pbtype )) mname.add( ps.toString() );
                            else{
                            
                                aname.add( ps.toString() );
                                PyObject clazz = __builtin__.getattr( po, new PyString( "__class__" ) );
                                PyObject name = __builtin__.getattr( clazz, new PyString( "__name__" ) );
                                avalue.add( name.toString() );
                                        
                            }
                        }
                    }
                    catch( Exception x ){}
                }
    
    
            Object docs = null;
            PyString pydoc = new PyString( "__doc__" );
            try{
                if( __builtin__.hasattr( py, pydoc ) )
                    docs = __builtin__.getattr( py, pydoc );
            }
            catch( Exception x ){}
                
            try{
            
                final org.leo.shell.widget.ObjectViewer ov = new org.leo.shell.widget.ObjectViewer();
                String oname = js.getObjectName( py );
                try{
                    
                    PyObject clazz = __builtin__.getattr( py, new PyString( "__class__" ) );
                    Object o = __builtin__.getattr( clazz , new PyString( "__name__" ) ); 
                    oname = o.toString();
                
                }
                catch( Exception x ){}
                ov.setClassName( oname );
                if( docs != null )
                    ov.setDocString( docs.toString() );
                else
                    ov.setDocString( "None" );
                
                ov.setJythonAttributes( attributes);
                ov.setJavaMethods( methods );
    
                
                try{
                    PyObject clazz = __builtin__.getattr( py, new PyString( "__class__" ) );
                    PyObject __bases__ = __builtin__.getattr( clazz, new PyString( "__bases__" ) );
                    PyTuple ptbases = (PyTuple)__bases__;
                    Vector<String> bases = new Vector<String>();
                    for( int i = 0; i < ptbases.size(); i++  ){
                        PyObject c = ptbases.__getitem__( i );
                        Object name = __builtin__.getattr( c, new PyString( "__name__" ) );
                        bases.add( name.toString() );
                    }
                    ov.setBases( bases );
                }
                catch( Exception x ){}
                final Dimension ovps = ov.getPreferredSize();
                final Rectangle psjtp = _jtp.getVisibleRect();
                ovps.width = psjtp.width;
                ov.setMaximumSize( ovps );
                final SimpleAttributeSet sas = new SimpleAttributeSet();
                StyleConstants.setComponent( sas, ov );
                doc.insertString( _jtp.getCaretPosition(), "\n" , sas );
                return;
                
            
            }
            catch( final Exception x ){ 
                //x.printStackTrace();
            
            }
        
        }
    
    
    }
    
    //@-node:zorcanda!.20051204140940:viewObject
    //@-others

}
//@nonl
//@-node:zorcanda!.20051117115313:@thin Pinfo.java
//@-leo
