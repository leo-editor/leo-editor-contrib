//@+leo-ver=4-thin
//@+node:zorcanda!.20051119115311:@thin Ed.java
//@@language java
package org.leo.shell.magic;


import org.leo.shell.JythonShell;
import org.leo.shell.MagicCommand;
import org.leo.shell.actions.*;
import org.leo.shell.util.InsertPrompt;
import org.leo.shell.color.JythonColorizer;
import org.leo.shell.magic.editor.*;
import org.leo.shell.widget.MessageBorder;
import org.python.core.*;
import java.awt.event.*;
import java.awt.*;
import java.util.*;
import java.util.concurrent.FutureTask;
import java.util.concurrent.ExecutionException;
import javax.swing.*;
//import javax.swing.border.*;
import javax.swing.event.*;
import javax.swing.text.*;

public class Ed implements MagicCommand{

    JythonShell js;
    LinkedList<String> previous;
    
    public Ed(){
    
        previous = new LinkedList<String>();
    
    }
    
    public void setJythonShell( JythonShell shell ){
    
        js = shell;
    
    }
    
    public static class JTextPane2 extends JTextPane{
    
        JythonColorizer jc;
        public JTextPane2(){
        
            getDocument().addDocumentListener( new DocumentListener2() );
        
        }

        public void setJythonColorizer( JythonColorizer jc ){
        
            this.jc = jc;
        
        }
        
        //@        <<document listener2>>
        //@+node:zorcanda!.20051119173035.2:<<document listener2>>
        public class DocumentListener2 implements DocumentListener, Runnable{
                    
            boolean colortoend;
                    
            public void insertUpdate( DocumentEvent de ){
                    
                AbstractDocument doc = (AbstractDocument)de.getDocument();
                String what = "";
                try{
                        
                    what = doc.getText( de.getOffset(), de.getLength() );
                        
                }
                catch( BadLocationException ble ){}
                if( what.equals( "'" ) || what.equals( "\"" ) || what.equals( "#" ) ){
                        
                    Element e = doc.getParagraphElement( de.getOffset() );
                    Element end = doc.getParagraphElement( de.getLength() );
                    if( e!=end) colortoend = true;
                        
                }
                SwingUtilities.invokeLater( this );
                if( what.equals( "\n" ) ){
                        
                    Element e = doc.getParagraphElement( de.getOffset() );
                    try{
                            
                        String line = doc.getText( e.getStartOffset(), ( e.getEndOffset() - 1) - e.getStartOffset() );
                        Indenter indent = new Indenter( doc, e.getEndOffset(), line );
                        SwingUtilities.invokeLater( indent );
                            
                    }
                    catch( BadLocationException ble ){}
                        
                        
                }
                    
            }
            public void removeUpdate( DocumentEvent de ){ 
                    
                Document doc = de.getDocument();
                try{
                    String text = doc.getText( de.getOffset(), de.getLength() );
                    if( text.equals( "\"" ) || text.equals( "'" ) || text.equals( "#" ) ) colortoend = true;
                }
                catch( BadLocationException ble ){}
                SwingUtilities.invokeLater( this );
                    
            }
                    
            public void changedUpdate( DocumentEvent de ){}
                    
            public void run(){
                        
                boolean colortoend = this.colortoend;
                this.colortoend = false;
                Document doc = getDocument();
                int start = JTextPane2.this.jc.startOfLine();
                int end = JTextPane2.this.jc.endOfLine();
                if( colortoend ){
                    end = doc.getLength();   
                }
                String line = "";
                try{
                    line = doc.getText( start, end - start );
                }
                catch( BadLocationException ble ){}
                JTextPane2.this.jc.colorize( line, "", getCaretPosition(),  start, end );
                
            }
                    
        
                
        }
        //@-node:zorcanda!.20051119173035.2:<<document listener2>>
        //@nl
    }
    
    //@    <<return>>
    //@+node:zorcanda!.20051119173035.1:<<return>>
    public static class Return extends AbstractAction{
        
        JythonShell js;
        JTextPane jtp; 
        boolean execute;
        LinkedList<String> previous;
            
        public Return( JythonShell js, JTextPane jtp, LinkedList<String> previous ){
            
            this.js = js;
            this.jtp = jtp;
            execute = true;
            this.previous = previous;
        
        }
        
        public void setExecute( boolean value ){
            
            execute = value;
            
        }
            
        public void actionPerformed( ActionEvent ae ){
            
            //Container con = parent.getParent();
            //con.remove( parent );
            //JComponent widget = js.getWidget();
            //con.add( widget );
            //con.validate();
            //widget.repaint();
            js.moveWidgetToFront( "Shell" );
            String text = jtp.getText();
            previous.add( text );
            String[] lines = text.split( "\n" );
            java.util.List<String> script = Arrays.asList( lines );
            final FutureTask<Boolean> ft;
            if( execute )
                ft = js.processScript( script );
            else ft = null;
                
            final JTextComponent jtc = js.getShellComponent();
            jtc.requestFocus();
            String mungedline = text.replace( "\\", "\\\\" );
            mungedline = mungedline.replace( "\n", "\\n" );
            final String mungedline2 = mungedline.replace( "'", "\\'" );
            Runnable run = new Runnable(){
                
                public void run(){
    
                    Runnable run2 = new Runnable(){
                        
                        public void run(){
                            try{
                                ft.get();
                            }catch( InterruptedException ie ){
                                
                                return;//something bad has happened, let us not do anything more destructive
                            }
                            catch( ExecutionException ee ){
                                
                                return;//same as above...
                                
                            }
                            Document doc = jtc.getDocument();
                            try{
                                int cp = jtc.getCaretPosition();
                                doc.insertString( cp, "\n", null );
                                jtc.setCaretPosition( cp + 1 );
                            
                            }
                            catch( BadLocationException ble ){ ble.printStackTrace();}
                            js.addLineToExecute( "'" + mungedline2 + "'" );
                            js.execute1( js );
                            InsertPrompt ip = new InsertPrompt( js, false );
                            js.execute1( ip );
                        }
                    };
                    SwingUtilities.invokeLater( run2 );
                }
                
            };
            js.execute2( run );
        }
            
    }
    //@nonl
    //@-node:zorcanda!.20051119173035.1:<<return>>
    //@nl
    
    public String getName(){ return "%ed/%edit"; }
    public String getDescription(){ 
    
        //@	    <<description>>
        //@+node:zorcanda!.20051119201341:<<description>>
        return "%ed: Alias to %edit.\n"+
        "%edit: Bring up an editor and execute the resulting code.\n"+
        "Usage: %edit [options] [args]\n"+
        "%edit runs JythonShell's editor.\n"+
        
        "This command allows you to conveniently edit multi-line code right in your JythonShell session.\n"+ 
        "If called without arguments, %edit opens up an empty editor with a temporary file and will execute the contents of this file when you close it (don t forget to save it!).\n"+
        "Options:\n"+
        "-p: this will call the editor with the same data as the previous time it was used, regardless of how long ago (in your current session) it was.\n"+
        "-x: do not execute the edited code immediately upon exit. This is mainly useful if you are editing programs which need to be called with command line arguments, which you can then do using %run.\n"+
        "Arguments:\n"+
        "If arguments are given, the following possibilites exist:\n"+
        "- The arguments are numbers or pairs of colon-separated numbers (like 1 4:8 9). These are interpreted as lines of previous input to be loaded into the editor. The syntax is the same of the %macro command.\n"+
        "- If the argument doesn t start with a number, it is evaluated as a variable and its contents loaded into the editor. You can thus edit any string which contains python code (including the result of previous edits).\n\n"; 
        //@-node:zorcanda!.20051119201341:<<description>>
        //@nl
    
    } 

    public boolean handle( String command ){
        
        command = command.trim();
        return command.startsWith( "%ed" ) || command.startsWith( "%edit" );
    
    }

    public boolean doMagicCommand( final String command ){
    
        Runnable run = new Runnable(){
            public void run(){
                //@                <<command>>
                //@+node:zorcanda!.20051119115311.1:<<command>>
                boolean execute = true;
                boolean setprevious = false;
                
                String[] pieces = command.split( "\\s+" );
                int i = 0;
                if( pieces.length > 1 ){
                
                    String test1 = pieces[ 1 ];
                    if( test1.equals( "-x" ) ){ execute = false;i++;}
                    if( test1.equals( "-p" ) ){ setprevious = true;i++;}
                    
                    if( pieces.length >= 3 ){
                    
                        String test2 = pieces[ 2 ];
                        if( test2.equals( "-x" ) ){ execute = false;i++;}
                        if( test2.equals( "-p" ) ){ setprevious = true;i++;}    
                    
                    }
                
                
                }
                
                java.util.List<String> hlist = null;
                if( pieces.length > i + 1 && Character.isDigit( pieces[ i + 1 ].charAt( 0 ) ) ){
                
                    StringBuilder sb = new StringBuilder();
                    for( ; i < pieces.length; i++ ) sb.append( pieces[ i ] ).append( " " );
                    if( sb.length() > 0 )
                        hlist = js.processHistoryString( sb.toString() );
                
                }
                else if( pieces.length > i + 1 ){
                
                    PyObject po = js.getPyObject( pieces[ i +1 ].split( "\\." ) );
                    if( po instanceof PyString ){
                    
                        String s = po.toString();
                        String[] ppieces = s.split( "\n" );
                        hlist = Arrays.asList( ppieces );
                    
                    
                    }
                }
                
                
                try{
                
                    JTextPane2 jtp = null;
                    JythonColorizer jcolor = null;
                    if( js.containsNamedWidget( "Editor" ) ){
                        JScrollPane jsp = (JScrollPane)js.getWidgetByName( "Editor");
                        jtp = (JTextPane2)jsp.getViewport().getView();
                        jtp.setText( "" );
                        jcolor = (JythonColorizer)jtp.getClientProperty( "jcolorizer" );
                        js.moveWidgetToFront( "Editor" );
                    }
                    else{
                        jtp = new JTextPane2();
                        jtp.addAncestorListener( new FocusRequestor() );
                        JTextComponent jtc = js.getShellComponent();
                        jtp.setForeground( jtc.getForeground() );
                        jtp.setBackground( jtc.getBackground() );
                        jtp.setCaretColor( jtc.getCaretColor() );
                        jtp.setFont( jtc.getFont() );
                        jcolor = new JythonColorizer( js._pi, jtp, js.getColorConfiguration() );
                        jtp.putClientProperty( "jcolorizer", jcolor );
                        jtp.setJythonColorizer( jcolor );
                        JScrollPane jsp = new JScrollPane( jtp );
                        jsp.setName( "Editor" );
                        String message = "Type Control-h to view Editor keystrokes.";
                        jsp.setViewportBorder( new MessageBorder( message ) );
                        JComponent jc = js.getWidget();
                    
                        KeyStroke tab = KeyStroke.getKeyStroke( KeyEvent.VK_TAB, 0 );
                        registerKeyStrokeAction( jtp, tab, "tab", new TabCompletion( jtp, jcolor ) ); 
                        Return ret = new Return( js, jtp, previous );
                        ret.setExecute( execute );
                        KeyStroke cq = KeyStroke.getKeyStroke( "control Q" );
                        registerKeyStrokeAction( jtp, cq, "cq", ret );
                        KeyStroke eol = KeyStroke.getKeyStroke( "control K" );
                        registerKeyStrokeAction( jtp, eol, "ck", new DeleteToEndOfLine( jtp ) );
                        KeyStroke ca = KeyStroke.getKeyStroke( "control A" );
                        registerKeyStrokeAction( jtp, ca, "ca", new org.leo.shell.magic.editor.StartOfLine() );
                        KeyStroke ce = KeyStroke.getKeyStroke( "control E" );
                        registerKeyStrokeAction( jtp, ce, "ce", new org.leo.shell.magic.editor.EndOfLine() );
                        KeyStroke cc = KeyStroke.getKeyStroke( "control C" );
                        registerKeyStrokeAction( jtp, cc, "cc", TransferHandler.getCopyAction() );
                        KeyStroke cx = KeyStroke.getKeyStroke( "control X" );
                        registerKeyStrokeAction( jtp, cx, "cx", TransferHandler.getCutAction() );
                        KeyStroke cp = KeyStroke.getKeyStroke( "control P" );
                        registerKeyStrokeAction( jtp, cp, "cp", TransferHandler.getPasteAction() );
                        Action flip = new AbstractAction(){
                            public void actionPerformed( ActionEvent ae ){ js.moveWidgetToFront( "Help" );}
                        };
                        KeyStroke ch = KeyStroke.getKeyStroke( "control H" );
                        registerKeyStrokeAction( jtp, ch, "ch", flip );
                        js.addWidget( jsp, "Editor" );
                        js.moveWidgetToFront( "Editor" );
                    }
                    
                    if( setprevious && previous.size() > 0 ){
                        String last = previous.getLast();
                        jtp.setText( last );
                        jcolor.colorize( last, "", 0, 0, last.length() );
                    }
                    else if ( hlist != null ){
                    
                        StringBuilder sb = new StringBuilder();
                        for( String s: hlist ) sb.append( s ).append( "\n" );
                        String text = sb.toString();
                        jtp.setText( text );
                        jcolor.colorize( text, "", 0, 0, text.length() );
                  
                    }
                
                    if( !js.containsNamedWidget( "Help" ) ){
                        Action flip2 = new AbstractAction(){
                            public void actionPerformed( ActionEvent ae ){ js.moveWidgetToFront( "Editor" );}
                        };
                        Help help = new Help( flip2, jtp );
                        JComponent hwidget = help.getWidget();
                        hwidget.setName( "Help" );
                        js.addWidget( hwidget, "Help" );
                    }
                    
                    jtp.requestFocus();
                    
                }
                catch( Exception x ){
                    x.printStackTrace();
                
                }
                //@-node:zorcanda!.20051119115311.1:<<command>>
                //@nl
            }
        };
        SwingUtilities.invokeLater( run );
        return true;
    
    }
    
    //@    @+others
    //@+node:zorcanda!.20051119172641:indentating
    public static class Indenter implements Runnable{
    
        Document doc;
        int spot;
        String previous;
        public Indenter( Document doc, int spot, String previous ){
        
            this.doc = doc;
            this.spot = spot;
            this.previous = previous;
            
        }
        
        public void run(){
        
            boolean addtab = previous.trim().endsWith( ":" );
            char[] line = previous.toCharArray();
            final StringBuilder sb = new StringBuilder();
            for( final char c: line ){
                    
                if( c != '\n' && Character.isWhitespace( c ) ) sb.append( c );
                else break;
                    
            }
    
                    
            if( addtab ) sb.append( "    " );
            String addwhitespace = sb.toString();
            try{
                
                doc.insertString( spot, addwhitespace, null );
            
            }
            catch( BadLocationException ble ){}
            
        }
    }
    //@nonl
    //@-node:zorcanda!.20051119172641:indentating
    //@+node:zorcanda!.20051121131107:registerKeyStrokeAction
    public void registerKeyStrokeAction( JTextComponent jtc, KeyStroke ks, Object object, Action action ){
    
        InputMap im = jtc.getInputMap();
        ActionMap am = jtc.getActionMap();
        im.put( ks, object );
        am.put( object, action );
    
    }
    //@nonl
    //@-node:zorcanda!.20051121131107:registerKeyStrokeAction
    //@+node:zorcanda!.20051121132959:class Help
    public static class Help{
    
        JTextPane help;
        JScrollPane jsp;
        
        public Help( Action end, JTextComponent reference ){
        
            help = new JTextPane();
            help.setForeground( reference.getForeground() );
            help.setBackground( reference.getBackground() );
            help.setFont( reference.getFont() );
            help.addAncestorListener( new FocusRequestor() );
            help.setEditable( false );
            KeyStroke cq = KeyStroke.getKeyStroke( "control Q" );
            InputMap im = help.getInputMap();
            ActionMap am = help.getActionMap();
            im.put( cq, "cq" );
            am.put( "cq", end );
            jsp = new JScrollPane( help );
            jsp.setViewportBorder( new MessageBorder( "Control-q to return to the Editor." ) );
            addHelpText();
        }
    
        public JComponent getWidget(){ return jsp; }
    
        private void addHelpText(){
            
            StringBuilder sb = new StringBuilder();
            String[] keystrokes = new String[]{
                "Control-a --> move position to beginning of line.",
                "Control-e --> move position to end of line.",
                "Control-k --> remove text from position to end of line.",
                "Control-c --> copies selection to clipboard.",
                "Control-x --> cuts selection to clipboard.",
                "Control-p --> pastes clipboard to editor.",
                "Control-q --> quit editor, return to shell.",
                "Tab --> either completes the current word as a python keyword or adds 4 spaces."
            };
            for( String s: keystrokes ) sb.append( s ).append( "\n" );
            help.setText( sb.toString() );
            help.setCaretPosition( 0 );
            
        }
    
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051121132959:class Help
    //@+node:zorcanda!.20051121135748:class FocusRequestor
    public static class FocusRequestor implements AncestorListener{
    
        public void ancestorRemoved(AncestorEvent event){}
        public void 	ancestorMoved(AncestorEvent event){}
        public void ancestorAdded( AncestorEvent ae ){
            
            JComponent component = ae.getComponent();
            component.requestFocus();
    
        }
    
    }
    //@nonl
    //@-node:zorcanda!.20051121135748:class FocusRequestor
    //@+node:zorcanda!.20051119195542:NewHeadline
    //@+at
    // "def ismethod(object):\n"+
    // "    return isinstance(object, types.MethodType)\n"+
    // "def ismodule(object):\n"+
    // "    return isinstance(object, types.ModuleType)\n"+
    // "def isclass(object):\n"+
    // "    return isinstance(object, types.ClassType) or hasattr(object, 
    // '__bases__')\n"+
    // "def isfunction(object):\n"+
    // "    return isinstance(object, types.FunctionType)\n"+
    // "def istraceback(object):\n"+
    // "    return isinstance(object, types.TracebackType)\n"+
    // "def isframe(object):\n"+
    // "    return isinstance(object, types.FrameType)\n"+
    // "def iscode(object):\n"+
    // "    return isinstance(object, types.CodeType)\n" +
    // def findsource(object):
    //     file = getsourcefile(object) or getfile(object)
    //     lines = linecache.getlines(file)
    //     if not lines:
    //         raise IOError('could not get source code')
    // 
    //     if ismodule(object):
    //         return lines, 0
    // 
    //     if isclass(object):
    //         name = object.__name__
    //         pat = re.compile(r'^\s*class\s*' + name + r'\b')
    //         for i in range(len(lines)):
    //             if pat.match(lines[i]): return lines, i
    //         else:
    //             raise IOError('could not find class definition')
    // 
    //     if ismethod(object):
    //         object = object.im_func
    //     if isfunction(object):
    //         object = object.func_code
    //     if istraceback(object):
    //         object = object.tb_frame
    //     if isframe(object):
    //         object = object.f_code
    //     if iscode(object):
    //         if not hasattr(object, 'co_firstlineno'):
    //             raise IOError('could not find function definition')
    //         lnum = object.co_firstlineno - 1
    //         pat = re.compile(r'^(\s*def\s)|(.*\slambda(:|\s))|^(\s*@)')
    //         while lnum > 0:
    //             if pat.match(lines[lnum]): break
    //             lnum = lnum - 1
    //         return lines, lnum
    //     raise IOError('could not find code object')
    //@-at
    //@nonl
    //@-node:zorcanda!.20051119195542:NewHeadline
    //@-others

}
//@nonl
//@-node:zorcanda!.20051119115311:@thin Ed.java
//@-leo
