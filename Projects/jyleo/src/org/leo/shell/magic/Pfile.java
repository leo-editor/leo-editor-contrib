//@+leo-ver=4-thin
//@+node:zorcanda!.20051116154614:@thin Pfile.java
//@@language java
package org.leo.shell.magic;
import org.leo.shell.color.ColorConfiguration;
import org.leo.shell.color.JythonColorizer;
import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.leo.shell.widget.CutCopyPaste;
import org.leo.shell.widget.MessageBorder;
import javax.swing.text.*; 
import org.python.core.*;
import org.python.util.*; 
import java.io.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Pfile implements MagicCommand{

    JythonShell js;
    JTextPane pager;
    JScrollPane jsp;
    
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public String getName(){ return "%pfile"; }
    public String getDescription(){
    
        return "%pfile --> attempts to locate the source file of the passed in object\n" +
               "and displays the contents of the source in the shell.\n"+
               "Usage:\n" +
               "%pfile obj\n\n";
    
    } 

    public boolean handle( String command ){
    
        return command.trim().startsWith( "%pfile " );
    
    }

    public boolean doMagicCommand( final String command ){
    
        Runnable run = new Runnable(){
            public void run(){
                //@                <<command>>
                //@+node:zorcanda!.20051116154614.1:<<command>>
                final String[] parts = command.split( "\\s+" );
                if( parts.length == 2 ){
                
                    String template = "____rv = getfile( %1$s )\n";
                    String code = String.format( template, parts[ 1 ] );
                    js._pi.exec( getfile );
                    js._pi.exec( code );
                    PyObject rv = js._pi.get( "____rv" );
                    js._pi.exec( "del ____rv" );
                
                    if( rv != Py.None ){
                        
                        StringBuilder sb = new StringBuilder();
                        try{
                            String path = rv.toString();
                            RandomAccessFile raf = new RandomAccessFile( path, "r" );
                            while( true ){
                            
                                String line = raf.readLine();
                                if( line == null ) break;
                                sb.append( line ).append( "\n" );
                            
                            
                            }
                            raf.close();
                        }
                        catch( FileNotFoundException fnfe ){}
                        catch( IOException io ){}
                        if( sb.length() != 0 ){
                            
                            JythonColorizer jcolorizer = null;
                            if( !js.containsNamedWidget( "Pager" ) ){
                                pager = new JTextPane();
                                ColorConfiguration cc = js.getColorConfiguration();
                                pager.setForeground( cc.getForegroundColor() );
                                pager.setCaretColor( cc.getForegroundColor() );
                                pager.setBackground( cc.getBackgroundColor() );
                                jcolorizer = new JythonColorizer( js._pi, pager, js.getColorConfiguration() );
                                pager.putClientProperty( "jcolorizer", jcolorizer );
                                new CutCopyPaste( pager );
                                jsp = new JScrollPane( pager );
                                MessageBorder b = new MessageBorder( "Control-q to return to the Shell." );
                                jsp.setViewportBorder( b );
                                js.addWidget( jsp, "Pager" );
                                Action a = new AbstractAction(){
                                
                                    public void actionPerformed( ActionEvent ae ){
                                    
                                        js.moveWidgetToFront( "Shell" );
                                        js.getShellComponent().requestFocus();
                                    
                                    }
                                
                                };
                                KeyStroke ks = KeyStroke.getKeyStroke( "control Q" );
                                InputMap im = pager.getInputMap();
                                ActionMap am = pager.getActionMap();
                                im.put( ks, "cq" );
                                am.put( "cq", a );
                            }
                            else{
                                
                                pager.setText( "" );
                                jcolorizer = (JythonColorizer)pager.getClientProperty( "jcolorizer" );;
                            
                            }
                            
                            String text = sb.toString();
                            pager.setText( text );
                            jcolorizer.colorize( text, "", 0, 0, text.length() );
                            pager.setCaretPosition( 0 );
                            js.moveWidgetToFront( "Pager" );
                            pager.requestFocus();
                            
                        }
                        else{
                        
                        
                        }
                    }
                    
                }
                //@-node:zorcanda!.20051116154614.1:<<command>>
                //@nl
            }
        };
        SwingUtilities.invokeLater( run );
        return true;
    
    }

    //@    @+others
    //@+node:zorcanda!.20051116165824:getfile code
    static final String getfile = "import types\n"+
    "import sys\n"+
    "def ismethod(object):\n"+
    "    return isinstance(object, types.MethodType)\n"+
    "def ismodule(object):\n"+
    "    return isinstance(object, types.ModuleType)\n"+
    "def isclass(object):\n"+
    "    return isinstance(object, types.ClassType) or hasattr(object, '__bases__')\n"+
    "def isfunction(object):\n"+
    "    return isinstance(object, types.FunctionType)\n"+
    "def istraceback(object):\n"+
    "    return isinstance(object, types.TracebackType)\n"+
    "def isframe(object):\n"+
    "    return isinstance(object, types.FrameType)\n"+
    "def iscode(object):\n"+
    "    return isinstance(object, types.CodeType)\n" +
    "def getfile(object):\n"+
    "    if ismodule(object):\n"+
    "        if hasattr(object, '__file__'):\n"+
    "            return object.__file__\n"+
    "        raise TypeError('arg is a built-in module')\n"+
    "    if isclass(object):\n"+
    "        object = sys.modules.get(object.__module__)\n"+
    "        if hasattr(object, '__file__'):\n"+
    "            return object.__file__\n"+
    "        raise TypeError('arg is a built-in class')\n"+
    "    if ismethod(object):\n"+
    "        object = object.im_func\n"+
    "    if isfunction(object):\n"+
    "        object = object.func_code\n"+
    "    if istraceback(object):\n"+
    "        object = object.tb_frame\n"+
    "    if isframe(object):\n"+
    "        object = object.f_code\n"+
    "    if iscode(object):\n"+
    "        return object.co_filename\n"+
    "    raise TypeError('arg is not a module, class, method, '\n"+
    "                    'function, traceback, frame, or code object')\n";
    //@nonl
    //@-node:zorcanda!.20051116165824:getfile code
    //@-others

}
//@-node:zorcanda!.20051116154614:@thin Pfile.java
//@-leo
