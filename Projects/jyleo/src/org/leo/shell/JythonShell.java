//@+leo-ver=4-thin
//@+node:zorcanda!.20051114092424.2:@thin JythonShell.java
//@@language java
package org.leo.shell;

import org.python.util.*;
import org.python.core.*;
import org.python.parser.*;

import java.awt.*;
import java.awt.dnd.*;
import java.awt.datatransfer.*; 
import java.awt.event.*;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.MalformedURLException;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.text.*;
import javax.swing.filechooser.*;
import java.util.*;
import java.util.regex.*;
import java.text.*;
import java.io.*;
import javax.print.*;
import javax.print.attribute.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import javax.swing.undo.*;

import org.leo.shell.color.*;
import org.leo.shell.magic.*;
import org.leo.shell.actions.*;
import org.leo.shell.util.*;
import org.leo.shell.io.*;
import org.leo.shell.widget.*;
import org.leo.shell.alias.*;
import static org.leo.shell.color.ColorConfiguration.ColorConstant; 
import static org.leo.shell.PromptFormatter.ColoredToken;
import static org.leo.shell.UtilityBoxEvent.UBEventType;

public class JythonShell extends KeyAdapter implements UndoableEditListener, Callable<Boolean>, Documentation{
    
    final public InteractiveConsole _pi;
    
    Autoquoter aq;
    PasteAsScript pas;
    Paste paste;
    Copy copy;
    
    private JPanel base;
    private JPanel backingwidget;
    private CardLayout layout;
    private ImageJViewport imjvp;
    final private JTextPane _jtp;

    private JMenuBar _jmb;
    final public JScrollPane _jsp;
    private JList _autocompleter;
    private JMenuItem undo;
    private JMenuItem redo;
    
    public Set<MagicCommand> mcommands;
    java.util.List<LineListener> llisteners;//these three can alter lines for execution and for storing history, good hooks
    java.util.List<LineListener> qllisteners;
    java.util.List<LineListener> hllisteners;
    java.util.List<UtilityBoxListener> utilboxlisteners;
    java.util.List<Documentation> iudocproviders;
    final public java.util.List< String > lines;
    final public PyList history;
    public PyList output;
    PyList dhistory;
    PyList dstack;
    Map<Integer, Object> Out;
    final private Map<String, Macro >macros;
    final private Map<String, File> bookmarks;
    final private Set< String > abbrevs;

    final private ByteArrayInputStream in;
    public ListSelectionListener _lsl;
    ColorConfiguration colorconfig;
    SimpleAttributeSet outSet;
    SimpleAttributeSet errSet;
    boolean force_line_colorize = false;
    JythonColorizer colorizer;
    
    private File cwd;
    private Map<String,org.leo.shell.alias.Alias> aliasmap;
    
    private Abbreviation _lab;
    private final UndoManager udm;
    //private final UndoableEditSupport ues;
    private boolean init_done;
    private Callable closer;
    ExecutorService executor;
    ExecutorService executor2;
    public volatile boolean suspend;
    
    public LinkedBlockingQueue<String> standardin;
    public CyclicBarrier stdinbarrier;
    public CountDownLatch resettool;
    
    LinkedBlockingQueue<String> previousline;
    LinkedBlockingQueue<String> execute;

    int outputspot;
    int linenumber;
    volatile boolean last_more;
    
    String lastprompt;
    int lastpromptsize;
    volatile boolean pdbonexception;
    private Runnable nextprompt;    
    
    java.util.List<String> conventions;
    java.util.List<Integer> ignorekc;
    
    java.util.List<String> who;
    
    JSOutputStream stdout;
    JSOutputStream stderr;
    java.util.List<OutputStream> loggers;
    
    PromptFormatter primaryprompt;
    PromptFormatter secondaryprompt;
    PromptFormatter outputprompt;
    
    
    boolean autocall;
    boolean autoindent;
    boolean automagic;
    boolean supressing;
    String executingline;
    
    private static DataFlavor uriListFlavor;
    static{
        
        try{
            
            uriListFlavor = new DataFlavor( "text/uri-list;class=java.lang.String" );
            
        }
        catch( ClassNotFoundException cnfe ){ cnfe.printStackTrace(); }
    
    
    }    


    //@    @+others
    //@+node:zorcanda!.20051114092424.3:JythonShell
    public JythonShell(){
        
        //PySystemState.initialize(System.getProperties(),
        //                             opts.properties, opts.argv);
        //PySystemState.initialize();
        PySystemState.initialize(System.getProperties(),
                                     new java.util.Properties(), new String[]{});
        _pi = new InteractiveConsole();
        PyModule mod = imp.addModule("__main__");
        _pi.setLocals(mod.__dict__);
        PyJavaInstance pji = new PyJavaInstance( this );
        PySystemState psstate = Py.getSystemState();
        PyObject dh = pji.__findattr__( "displayHook" );
        psstate.__displayhook__ = dh;
        psstate.__dict__.__setitem__("displayhook", dh );
        PyObject eh = pji.__findattr__( "exceptHook" );
        psstate.__excepthook__ = eh;
        psstate.__dict__.__setitem__( "excepthook", eh );
        _pi.exec( "import sys;import os;import shutil" );
    
        llisteners = new ArrayList<LineListener>(); 
        qllisteners = new ArrayList<LineListener>();
        hllisteners = new ArrayList<LineListener>();
        utilboxlisteners = new LinkedList<UtilityBoxListener>();
        iudocproviders = new ArrayList<Documentation>();
        
        Comparator<String> aliascompare = new Comparator<String>(){
        
            public int compare( String s1, String s2 ){
            
                return s1.compareTo( s2 );
            
            }
            
            public boolean equals( Object o ){
                if( o == null ) return false;
                if( !( o instanceof Comparator ) ) return false;
                return true;
                
            }        
        
        
        };
        aliasmap = new TreeMap<String, org.leo.shell.alias.Alias>( aliascompare );
        qllisteners.add( new AliasConverter( this, aliasmap ) );
        addLineListener( new LineOutputSupresser( this ) );
        
        pdbonexception = false;
        //magic power data structures and such...
        lines = new Vector< String >();
        
        abbrevs = new HashSet< String >();
        final PySystemState pss = Py.getSystemState();
        final PyStringMap psm = (PyStringMap)pss.builtins;
        final PyList pl = psm.keys();
        for( int i = 0; i < pl.__len__(); i ++ )
            abbrevs.add( pl.__getitem__( i ).toString() );
            
        /*final String[] kwrds = PythonGrammarConstants.tokenImage;
        for( final String s: kwrds ){
            if( s.length() <= 2 ) continue;
            abbrevs.add( s.substring( 1, s.length() -1 ) );   
        }*/
        
        bookmarks = new HashMap<String,File>();
        conventions = new Vector<String>();
        conventions.add( "self" );
        ignorekc = new ArrayList<Integer>();
        history = new PyList(); //new LinkedList<String>();
        output = new PyList();
        dhistory = new PyList();
        dstack = new PyList();
        loggers = new ArrayList<OutputStream>();
        Out = new HashMap<Integer, Object>();
        _pi.set( "Out", Out );
        _pi.set( "_oh", Out );
        _pi.set( "In", history );
        _pi.set( "_ih", history );
        _pi.set( "_dh", dhistory );
        macros = new HashMap< String, Macro >();
        Comparator<MagicCommand> mcsorter = new Comparator<MagicCommand>(){
        
            public int compare( MagicCommand m1, MagicCommand m2 ){
            
                return m1.getName().compareTo( m2.getName() );
            
            }
        
            public boolean equals( Object o ){ 
                if( o == null ) return false;
                if( !( o instanceof Comparator ) ) return false;
                return true;
                
            }
        
        };
        mcommands = new TreeSet<MagicCommand>( mcsorter );
        createMagicCommands();
        setCurrentWorkingDirectory( new File( System.getProperty( "user.dir" ) ) );
        pushDStack( getCurrentWorkingDirectory() );
        
        for( final MagicCommand mc: mcommands ) abbrevs.add( mc.getName() );
        abbrevs.add( "self" );
        
        //the concurrency tools that makes life so much easier... :)
        standardin = new LinkedBlockingQueue<String>();
        previousline = new LinkedBlockingQueue<String>();
        execute = new LinkedBlockingQueue<String>();
        stdinbarrier = new CyclicBarrier( 2 );
        executor = Executors.newSingleThreadExecutor();
        executor2 = Executors.newSingleThreadExecutor();
        
        
        //start building the gui 
        _jtp = new JTextPane();
        backingwidget = new JPanel();
        layout = new CardLayout();
        backingwidget.setLayout( layout );
        base = new JPanel();
        backingwidget.add( base, "Shell" );
        base.setLayout( new BorderLayout() );
        pas = new PasteAsScript( this );
        paste = new Paste( this );
        copy = new Copy( this );
        addMenuBar( base ); 
        
        setColorConfiguration( new ColorConfiguration() );
        colorizer = new JythonColorizer( _pi, _jtp, colorconfig ); 
        addKeyStrokes();
        Font f = Font.decode( "DIALOG PLAIN 15" );
        if( f != null )
            _jtp.setFont( f );
    
        new CopyPaste( _jtp, this );
        imjvp = new ImageJViewport();
        JScrollPane jsp = _jsp = new JScrollPane();
        jsp.setViewport( imjvp );
        jsp.setViewportView( _jtp );
        jsp.addMouseWheelListener( new RemoveObjects( this ) );
        jsp.setHorizontalScrollBarPolicy( ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER );
        base.add( jsp, BorderLayout.CENTER );    
        _jtp.setText( _pi.getDefaultBanner() + '\n' );
        _jtp.setCaretPosition( _jtp.getDocument().getLength() );
        _jtp.setDoubleBuffered( true );
        _lsl = new _SelectionReturner( _jtp );
        new UnifiedHelp( this );
        new Autocompleter( this, _jtp );
        new Calltip( this );
        new ObjectWildCard( this );
        new SystemCommand( this );
        new DropFileMechanism( this );
        aq = new Autoquoter( this );
        _jtp.addKeyListener( this );
        
        primaryprompt = new DefaultPrimaryPrompt( getColorConfiguration() );
        secondaryprompt = new DefaultSecondaryPrompt( getColorConfiguration());
        outputprompt = new DefaultOutputPrompt( getColorConfiguration() );
    
        stdout = new JSOutputStream( _jtp, outSet, this );
        _pi.setOut( stdout );
        stderr = new JSOutputStream( _jtp, errSet, this );
        _pi.setErr( stderr );
        in = new ByteArrayInputStream( new byte[ 100 ] );
        BufferedInputStream bis = new BufferedInputStream( in );
        PyFile pf = new PyFile2( bis, "<stdin>", this );
        Py.getSystemState().stdin = pf;
        Py.getSystemState().__stdin__ = pf;
        
        who = new LinkedList<String>();
        autocall = true;
        autoindent = true;
        automagic = true;
        executingline = "";
         
        addInteractiveDocumentation( this );
        //Add some fancy undo power...
        udm = new UndoManager();
        _jtp.getDocument().addUndoableEditListener( this );
        undo.addActionListener( new ActionListener(){
        
            public final void actionPerformed( final ActionEvent ae ){
            
                udm.undo();    
                refreshUndoRedo();
                
            }
        
        
        } );
        redo.addActionListener( new ActionListener(){
        
            public final void actionPerformed( final ActionEvent ae ){
            
                udm.redo();
                refreshUndoRedo();
            
            }
        
        
        
        });
        
    
    }
    
    
    
    
    //@-node:zorcanda!.20051114092424.3:JythonShell
    //@+node:zorcanda!.20051117150934:exterior control/interaction
    //@+others
    //@+node:zorcanda!.20051114092424.4:getWidget
    public JComponent getWidget(){
    
        return backingwidget;
    
    }
    //@nonl
    //@-node:zorcanda!.20051114092424.4:getWidget
    //@+node:zorcanda!.20051128134703:widget opps
    public void addWidget( JComponent jc, String name ){
    
        backingwidget.add( jc, name );
    
    
    }
    
    public void moveWidgetToFront( String name ){
    
    
        layout.show( backingwidget, name );
    
    
    }
    
    public boolean containsNamedWidget( String name ){
    
        for( Component c: backingwidget.getComponents() ){
            
            String s = c.getName();
            if( s != null && s.equals( name ) ) return true;
            
        }
        return false;
    
    }
    
    
    public boolean containsWidget( Component comp ){
    
        for( Component c: backingwidget.getComponents() )
            if( c == comp ) return true;
    
        return false;
    }
    
    public Component getWidgetByName( String name ){
    
        for( Component c: backingwidget.getComponents() ){
            String s= c.getName();
            if( s != null && s.equals( name ) ) return c;
            
        }
        return null;
    
    }
    
    //@-node:zorcanda!.20051128134703:widget opps
    //@+node:zorcanda!.20051114092424.5:setVisible
    public final  void setVisible( final boolean b ){
    
        if( !init_done ){
            init_done = true;
            AncestorListener run = new AncestorListener(){
                public void ancestorAdded( AncestorEvent ae ){
                    
                    DefaultStyledDocument doc = (DefaultStyledDocument)_jtp.getDocument();
                    ColorConfiguration cc = getColorConfiguration();
                    SimpleAttributeSet sas = new SimpleAttributeSet();
                    StyleConstants.setForeground( sas, cc.getOutPromptColor() );
                    SimpleAttributeSet sas2 = new SimpleAttributeSet();
                    StyleConstants.setForeground( sas2, cc.getOutPromptColor().brighter() );
    
                    try{
                        Position end = doc.getEndPosition();
                        doc.insertString( _jtp.getCaretPosition(), "JythonShell -- An enhanced Interactive Jython\n", sas );
                        _jtp.setCaretPosition( end.getOffset() -1 );
                        doc.insertString( _jtp.getCaretPosition(), "How to get help:\n", sas2 );
                        _jtp.setCaretPosition( end.getOffset() -1 );
                        doc.insertString( _jtp.getCaretPosition(), "? -> unified help.\n", sas2 );
                        _jtp.setCaretPosition( end.getOffset() -1 );
                        doc.insertString( _jtp.getCaretPosition(), "%magic ->  magic commands.\n", sas2 );
                        _jtp.setCaretPosition( end.getOffset() -1 );
                        doc.insertString( _jtp.getCaretPosition(), "%keystroke -> keystrokes.\n", sas2 );
                        _jtp.setCaretPosition( end.getOffset() -1 );
                        doc.insertString( _jtp.getCaretPosition(), "%iuse -> interactive features.\n", sas2 );
                        _jtp.setCaretPosition( end.getOffset() -1 ); //we do this intricate dance because in one embedding situation
                        //I saw that the order here got reversed!
                    }
                    catch( BadLocationException ble ){}
                    insertPrompt( false );
                    outputspot = _jtp.getCaretPosition();
                    _jtp.removeAncestorListener( this );
                }
                
                public void ancestorRemoved( AncestorEvent event ){}
                public void ancestorMoved( AncestorEvent event ){}
            };
            //SwingUtilities.invokeLater( run );
            _jtp.addAncestorListener( run );
        }
        //_frame.setVisible( b );
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051114092424.5:setVisible
    //@+node:zorcanda!.20051114092424.68:getDelegate
    public final JythonDelegate getDelegate(){
    
        return new JythonDelegate( this );
    
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051114092424.68:getDelegate
    //@+node:zorcanda!.20051114134115:addLineListener
    public void addLineListener( LineListener ll ){
    
        llisteners.add( ll );
    
    }
    
    public void removeLineListener( LineListener ll ){
    
    
        llisteners.remove( ll );
    
    
    }
    
    public void addQuietLineListener( LineListener ll ){
    
        qllisteners.add( ll );
    
    }
    
    public void removeQuietLineListener( LineListener ll ){
    
        qllisteners.remove( ll );
    
    }
    
    public void addHistoryLineListener( LineListener ll ){
    
        hllisteners.add( ll );
    
    }
    
    public void removeHistoryLineListener( LineListener ll ){
    
        hllisteners.remove( ll );
    
    }
    //@-node:zorcanda!.20051114134115:addLineListener
    //@+node:zorcanda!.20051128185551:addUtilityBoxListener
    public void addUtilityBoxListener( UtilityBoxListener ubl ){
    
        utilboxlisteners.add( ubl );
    
    }
    
    public void removeUtilityBoxListener( UtilityBoxListener ubl ){
    
    
        utilboxlisteners.remove( ubl );
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051128185551:addUtilityBoxListener
    //@+node:zorcanda!.20051120231925:supressOutput
    public void supressOutput(){
        
        stdout.supress();stderr.supress();
        supressing = true;
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051120231925:supressOutput
    //@-others
    //@nonl
    //@-node:zorcanda!.20051117150934:exterior control/interaction
    //@+node:zorcanda!.20051114092424.6:constructor helpers
    //@+others
    //@+node:zorcanda!.20051114092424.7:addMenuBar
    public final void addMenuBar( final JPanel jc ){
    
        _jmb = new JMenuBar();
        jc.add( _jmb, BorderLayout.NORTH );
        final JMenu jm = new JMenu( "File" );
        _jmb.add( jm );
        final Action o = new AbstractAction( "Open" ){
        
            public final void actionPerformed( final ActionEvent ae ){
            
                JythonShell.this.open();
            
            
            }
        
        
        };    
        jm.add( o );
        final Action s = new AbstractAction( "Save" ){
            public final void actionPerformed( final ActionEvent ae ){
            
                JythonShell.this.save();
            
            }
        };
        jm.add( s );
    
        jm.addSeparator();
        /*final Action p = new AbstractAction( "Print" ){
        
        
            public final void actionPerformed( final ActionEvent ae ){
            
            
                JythonShell.this.print();
            
            
            }
        
        
        
        };
        
        jm.add( p );
        jm.addSeparator();*/
        final AbstractAction x = new AbstractAction( "Close" ){
        
            public final void actionPerformed( final ActionEvent ae ){ JythonShell.this.close(); }
        
        };
        jm.add( x );
        
        final JMenu edit = new JMenu( "Edit" );
        _jmb.add( edit );
        undo = new JMenuItem( "Cant Undo" );
        undo.setEnabled( false );
        redo = new JMenuItem( "Cant Redo" );
        redo.setEnabled( false );
        edit.add( undo );
        edit.add( redo );
        edit.addSeparator();
        
        JMenuItem cpy = edit.add( copy );
        KeyStroke cw = KeyStroke.getKeyStroke( "control W" );
        cpy.setAccelerator( cw );
        
        JMenuItem pst = edit.add( paste );
        KeyStroke cy = KeyStroke.getKeyStroke( "control Y" );
        pst.setAccelerator( cy );
    
        JMenuItem jpas = edit.add( pas );
        KeyStroke ay = KeyStroke.getKeyStroke( "alt Y" );
        jpas.setAccelerator( ay );
    
        
        final JMenu help = new JMenu ( "Help" );
        _jmb.add( help );
        final AbstractAction ab = new AbstractAction( "JythonShell Help" ){
        
            public final void actionPerformed( final ActionEvent ae ){ JythonShell.this.help();}
        
        };
        JMenuItem jhelp = help.add( ab );
    
    }
    
    
    //@-node:zorcanda!.20051114092424.7:addMenuBar
    //@+node:zorcanda!.20051115165856:addKeyStrokes
    public void addKeyStrokes(){
    
        KeyStroke ck = KeyStroke.getKeyStroke( "control K" );
        addToInputActionMaps( ck,"ck", new DeleteToEndOfLine( _jtp ) );
        KeyStroke delete = KeyStroke.getKeyStroke( "DELETE" );
        addToInputActionMaps( delete,"delete", new RemoveLine( this ) );
        KeyStroke start = KeyStroke.getKeyStroke( "control A" );
        addToInputActionMaps( start, "ca", new StartOfLine( this ) );
        KeyStroke end = KeyStroke.getKeyStroke( "control E" );
        addToInputActionMaps( end, "ce", new EndOfLine( this ) );
        KeyStroke da = KeyStroke.getKeyStroke(KeyEvent.VK_SLASH, InputEvent.ALT_MASK  );
        addToInputActionMaps( da, "da", new DynamicAbbreviation( this ) );
        KeyStroke up = KeyStroke.getKeyStroke( KeyEvent.VK_UP, 0 );
        KeyStroke down = KeyStroke.getKeyStroke( KeyEvent.VK_DOWN, 0 );
        UpDownArrows uda = new UpDownArrows( this );
        addToInputActionMaps( up, "up", uda.getUp() );
        addToInputActionMaps( down, "down", uda.getDown() );
        KeyStroke tab = KeyStroke.getKeyStroke( KeyEvent.VK_TAB, 0 );
        addToInputActionMaps( tab, "tab", new TabCompletion( _jtp, colorizer ) );
        SearchInputHistory sch = new SearchInputHistory( this );
        KeyStroke cp = KeyStroke.getKeyStroke( "control P" );
        addToInputActionMaps( cp, "cp", sch.getPreviousUp() );
        KeyStroke nd = KeyStroke.getKeyStroke( "control N" );
        addToInputActionMaps( nd, "cn", sch.getNextDown() );
        KeyStroke cr = KeyStroke.getKeyStroke( "control R" );
        addToInputActionMaps( cr, "cr", new ReverseIncrementalSearch( this ) );
        KeyStroke cz = KeyStroke.getKeyStroke( "control Z" );
        addToInputActionMaps( cz, "cz", new SupressOutput( this ) );
        KeyStroke ct = KeyStroke.getKeyStroke( "control T" );
        addToInputActionMaps( ct, "tc", new TripleQuotes( this ) );
        KeyStroke esc = KeyStroke.getKeyStroke( "ESCAPE" );
        addToInputActionMaps( esc, "esc", new CloseUtilityBoxes( this )) ;
        KeyStroke ay = KeyStroke.getKeyStroke( "alt Y" );
        addToInputActionMaps( ay, "ay", pas );
        KeyStroke cy = KeyStroke.getKeyStroke( "control Y" );
        addToInputActionMaps( cy, "cy", paste );
        KeyStroke cw = KeyStroke.getKeyStroke( "control W" );
        addToInputActionMaps( cw, "cw", copy );
    
    }
    
    //@-node:zorcanda!.20051115165856:addKeyStrokes
    //@+node:zorcanda!.20051119135643:addToInputActionMaps
    private void addToInputActionMaps( KeyStroke ks, Object object, Action action ){
    
        InputMap im = _jtp.getInputMap();
        ActionMap am = _jtp.getActionMap();
        im.put( ks, object );
        am.put( object, action );
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051119135643:addToInputActionMaps
    //@+node:zorcanda!.20051119171938:isRegisteredKeyStroke
    public boolean isRegisteredKeyStroke( KeyStroke ks ){
    
        InputMap im = _jtp.getInputMap();
        KeyStroke[] kst = im.keys();
        for( KeyStroke k: kst )
            if( k.equals( ks ) ) return true;
        return false;
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051119171938:isRegisteredKeyStroke
    //@-others
    //@-node:zorcanda!.20051114092424.6:constructor helpers
    //@+node:zorcanda!.20051121172308:addAlias removeAlias
    public void addAlias( String name, org.leo.shell.alias.Alias alias ){
    
        aliasmap.put( name, alias );
    
    }
    
    public void removeAlias( String name ){
    
        if( aliasmap.containsKey( name ))  aliasmap.remove( name );
        
    
    }
    
    public Iterator<org.leo.shell.alias.Alias> getAliases(){
    
    
        return aliasmap.values().iterator();
    
    }
    //@nonl
    //@-node:zorcanda!.20051121172308:addAlias removeAlias
    //@+node:zorcanda!.20051114092424.8:configuring methods
    public void addToConventions( String word ){
    
        conventions.add( word );
    
    }
    
    
    public final void setBackgroundImage( Image i, float alpha ){
    
        imjvp.setImage( i );
        imjvp.setAlpha( alpha );
        _jtp.setOpaque( false );
        _jsp.setOpaque( false );
        _jsp.getViewport().setOpaque( false );
        _jsp.repaint();
        
    }
    
    public final void setFont( final Font f ){
    
        _jtp.setFont( f );
    
    }
    
    public final Font getFont(){
    
        return _jtp.getFont();
    
    
    }
    
    public void setPrimaryPrompt( PromptFormatter pf ){
    
        primaryprompt = pf;
    
    }
    
    public PromptFormatter getPrimaryPrompt(){ return primaryprompt;}
    
    public void setSecondaryPrompt( PromptFormatter pf ){
    
        secondaryprompt = pf;
    
    }
    
    public PromptFormatter getSecondaryPrompt(){ return secondaryprompt;}
    
    public void setOutputPrompt( PromptFormatter pf ){
    
        outputprompt = pf;
    
    }
    
    public PromptFormatter getOutputPrompt(){ return outputprompt; }
    
    
    public ColorConfiguration getColorConfiguration(){
    
        return colorconfig;
    
    }
    
    public void setColorConfiguration( ColorConfiguration cc ){
    
        colorconfig = cc;
        _jtp.setBackground( cc.getBackgroundColor() );//_bg  );
        _jtp.setForeground( cc.getForegroundColor() );//_fg );
        _jtp.setCaretColor( cc.getForegroundColor() );//_fg );
        outSet = new SimpleAttributeSet();
        StyleConstants.setForeground( outSet, cc.getOutColor() );//_outColor );
        StyleConstants.setFirstLineIndent( outSet, 0 );
        errSet = new SimpleAttributeSet();
        StyleConstants.setForeground( errSet, cc.getErrColor() );// _errColor );
        StyleConstants.setFirstLineIndent( errSet, 0 );
        ColorConfigurationListener ccl = new JSColorConfigurationListener( this );
        cc.registerColorConfigurationListener( ccl );
    
    }
    
    
    
    
    
    //@-node:zorcanda!.20051114092424.8:configuring methods
    //@+node:zorcanda!.20051114092424.9:undoableEditHappened
    public void undoableEditHappened( final UndoableEditEvent ude ){
    
        final UndoableEdit ue = ude.getEdit();
        final String type = ue.getPresentationName();
        if( !type.equals( "style change" ) ){
        
            udm.addEdit( ue );
            refreshUndoRedo();
        
        }
    
    }
    
    public final void refreshUndoRedo(){
    
        final boolean canredo = udm.canRedo();    
        redo.setEnabled( canredo );
        if( canredo )
            redo.setText( udm.getRedoPresentationName() );
        else
            redo.setText( "Cant Redo" );
            
        final boolean canundo = udm.canUndo();
        undo.setEnabled( canundo );
        if( canundo )
            undo.setText( udm.getUndoPresentationName() );
        else
            undo.setText( "Cant Undo" );
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051114092424.9:undoableEditHappened
    //@+node:zorcanda!.20051117150610:execution related...
    //@+others
    //@+node:zorcanda!.20051114092424.10:call
    public final Boolean call(){
    
        try{
            
            Boolean more = false;
            String line = execute.take();
            String test = line;
            try{
                for( LineListener ll: llisteners.toArray( new LineListener[]{} ) ){;
                    line = ll.lineToExecute( line );
                    if( line == null ) return false;
                }
                if( !test.equals( line ) ) outputLineInfo( line );
                for( LineListener ll: qllisteners.toArray( new LineListener[]{} ) ){
                    line = ll.lineToExecute( line );
                    if( line == null ) return false;
                
                }
            }catch( LineListenerException lle ){
            
                return false;
            
            }
            
            previousline.offer( line );
            closeUtilityBoxes();
            if( !last_more && line.trim().equals( "" ) ){
                return false;
            }
            try{          
        	       
                String[] pieces = line.split( "\\s+" );
                if( automagic 
                    && isMagicCommand( "%" + line ) 
                    && getPyObject( pieces[ 0 ].split( "\\." ) ) == null ) line = "%" + line;
                if( autocall ) line = autocall( line );
    
                boolean append_tail = last_more;
                try{
                    PyStringMap po = (PyStringMap)_pi.getLocals();
                    po = po.copy();
                    executingline = line;
                    //System.out.println( "EXECUTE:" + line );
                    if( line.startsWith( "%" ) ){
                        
                        magicCommand( line );
                        last_more = false;
                    
                    }
                    else{
                        _pi.set( "__aliasmap", aliasmap );
                        last_more = more = _pi.push( line );
                        _pi.exec( "del __aliasmap" );
                    }
                    
                    for( OutputStream log: loggers ){
                    
                        try{
                        
                            log.write( line.getBytes() );
                            log.write( "\n".getBytes() );
                        
                        }
                        catch( IOException io ){}
                    
                    
                    }                
    
    
    
                    PyStringMap po2 = (PyStringMap)_pi.getLocals();
                    po2 = po2.copy();
                    PyList keys = po.keys();
                    while( keys.__len__() != 0 ){
                    
                        PyObject key = keys.pop();
                        if( po2.has_key( key ) )
                            po2.__delitem__( key );
                    
                    }
                    for( Object o: po2.keys() ){
                        String s = o.toString();
                        if( !(s.startsWith( "_" ) || s.startsWith( "_i" ) ) )
                            who.add( s );
                     
                     }
                }
                finally{
                    if( append_tail ){
                    
                        String tail = (String)history.remove( history.size() -1 ).toString();
                        tail = String.format( "%1$s\n%2$s", tail, line );
                        history.add( tail ); 
                    
                    
                    }
                    else{
                        try{
                            for( LineListener ll: hllisteners.toArray( new LineListener[]{} ) ){
                                line = ll.lineToExecute( line );
                                if( line == null ) break;
                
                            }
                            if( line != null ) history.add( line );
                        }
                        catch( LineListenerException lle ){}
                    }
                
                    int hsize = history.size();
                    if( hsize >= 4 ) _pi.set( "_iii", history.get( hsize - 4 ) );
                    if( hsize >= 3 ) _pi.set( "_ii", history.get( hsize - 3 ) );
                    if( hsize >= 2 ) _pi.set( "_i", history.get( hsize - 2 ) );            
                    if( !more ){
                    
                        String variable = String.format( "_i%1$d", linenumber );
                        _pi.set( variable, history.get( hsize -1 ) );
                        colorizer.clearPositions();
                        linenumber++;
                        stdout.liberate();stderr.liberate();supressing = false;
                 
                    }
                
                }
            }
            catch( Exception x ){
        
                x.printStackTrace();
                more = false;
            
            }
            return more;
    
        
        }
        catch( InterruptedException ie ){}
    
        return false;
    
    }
    //@-node:zorcanda!.20051114092424.10:call
    //@+node:zorcanda!.20051118234638:autocall
    public String autocall( String line ){
        
        String[] split = line.split( "\\s+" );
        if( split.length > 1 ){
            String split1 = split[ 1 ];
            char c = split1.charAt( 0 );
            if( !Character.isLetterOrDigit( c ) && c != '_' ) return line;
            String[] split2 = split[ 0 ].split( "\\." );
            PyObject po = getPyObject( split2 );
            if( po != null && !(po instanceof PyClass) ){
                
                boolean callable = __builtin__.callable( po );
                if( callable ){
                    
                    String args = line.substring( split[ 0 ].length() );
                    line = String.format( "%1$s( %2$s )", split[ 0 ], args );
                    outputLineInfo( line );
                    
                }
                
                
            }
            else if( split2.length == 1  && Py.getSystemState().builtins.__finditem__( new PyString( split2[ 0 ] ) ) != null ){
                    
                po = Py.getSystemState().builtins.__finditem__( new PyString( split2[ 0 ] ) );
                boolean callable = __builtin__.callable( po );
                if( callable ){
                        
                    String args = line.substring( split[ 0 ].length() );
                    line = String.format( "%1$s( %2$s )", split[ 0 ], args );
    	            outputLineInfo( line );
                        
                }
                    
            }
        }     
        return line;
    }
    //@nonl
    //@-node:zorcanda!.20051118234638:autocall
    //@+node:zorcanda!.20051118234010:outputLineInfo
    public void outputLineInfo( String line ){
    
        SimpleAttributeSet sas = new SimpleAttributeSet();
        setIndent( lastprompt, "--> " , sas );
        DefaultStyledDocument doc = (DefaultStyledDocument)_jtp.getDocument();
        int cp = _jtp.getCaretPosition();
        //doc.insertString( cp, "--> " + line + "\n" , null);
        String totalline = "--> " + line + "\n";
        colorize( totalline, totalline, cp, cp, cp + totalline.length() );
        Element e = doc.getParagraphElement( cp );
        //doc.setCharacterAttributes( cp, 4, outpSet , false );
        doc.setParagraphAttributes( e.getStartOffset() ,(e.getEndOffset() - 1 ) - e.getStartOffset(), sas , false );
        _jtp.setCaretPosition( cp + line.length() + 5 );
    
    }
    //@nonl
    //@-node:zorcanda!.20051118234010:outputLineInfo
    //@+node:zorcanda!.20051117120531:addLineToExecute
    public void addLineToExecute( String line ){
    
        execute.add( line );
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051117120531:addLineToExecute
    //@+node:zorcanda!.20051114100300:execute1 execute2
    //execute1 is for running the JythonShell itself, this the pattern the shell follows.
    public void execute1( Runnable run ){
    
        executor.submit( run );
    
    
    }
    
    public void execute1( Callable call ){
    
        executor.submit( call );
    
    }
    
    //execute2 is intended for a non-shell runnable or callable to execute.  Task running in execute2 can then schedule the shell to run in execute1
    public void execute2( Runnable run ){
    
        executor2.submit( run );
    
    
    }
    
    public void execute2( Callable call ){
    
        executor2.submit( call );
    
    
    }
    //@-node:zorcanda!.20051114100300:execute1 execute2
    //@-others
    //@nonl
    //@-node:zorcanda!.20051117150610:execution related...
    //@+node:zorcanda!.20051117150852:prompt related...
    //@+others
    //@+node:zorcanda!.20051114092424.11:get_input
    public String get_input( int spot ){
    
        DefaultStyledDocument sdd = (DefaultStyledDocument)_jtp.getDocument();
        Element e = Utilities.getParagraphElement( _jtp, spot );
        int start = e.getStartOffset();
        int end = e.getEndOffset() - 1;
        if( outputspot > start && outputspot <= end ) start = outputspot;
    
        
        try{
            
            return sdd.getText( start, end - start );
        }
        catch( BadLocationException ble ){}
        return "";
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051114092424.11:get_input
    //@+node:zorcanda!.20051114092424.12:insertPrompt
    public final void insertPrompt( final boolean more ){
    
    
        final SimpleAttributeSet sas2 = new SimpleAttributeSet();
        final SimpleAttributeSet indent = new SimpleAttributeSet();
        StyleConstants.setFirstLineIndent( indent, 0 );
        StyleConstants.setForeground( sas2, _jtp.getForeground() );
        PromptFormatter formatter = null;
        
        String prompt;
        final int prompt_size;
        String addwhitespace = "";
        if( more ){
            final Document doc = _jtp.getDocument();
            try{
                String previous = previousline.peek();
                if( previous != null && autoindent ){
    
                    boolean addtab = previous.trim().endsWith( ":" );
                    char[] line;
                    line = previousline.take().toCharArray();//pre.toCharArray();
                    final StringBuilder sb = new StringBuilder();
                    for( final char c: line ){
                    
                        if( c != '\n' && Character.isWhitespace( c ) ) sb.append( c );
                        else break;
                    
                    }
    
                    
                    if( addtab ) sb.append( "    " );
                    addwhitespace = sb.toString();
                
                    
    
                }  
                }
                catch( final Exception x ){
                
                    x.printStackTrace();
                    
                }
            
            
            prompt = secondaryprompt.getPrompt( linenumber );
            formatter = secondaryprompt;
    
            
            prompt_size = prompt.length();
            //StyleConstants.setForeground( sas, colorconfig.getPromptTwoColor() );//_p2c );
            //setIndent( lastprompt, prompt, indent );
            setIndent2( secondaryprompt.coloredPrompt( linenumber ), indent, lastpromptsize );
            if( autoindent ){
                prompt += addwhitespace;
                // += addwhitespace;
            }
            
        }
        else{
            
            formatter = primaryprompt;
            lastprompt = prompt = primaryprompt.getPrompt( linenumber );
            prompt_size = prompt.length();
            //StyleConstants.setForeground( sas, colorconfig.getPromptOneColor() );//_p1c );
    
        }
        
        try{
            
            int ospot = _jtp.getCaretPosition();
            final DefaultStyledDocument doc = (DefaultStyledDocument)_jtp.getDocument();
            int cp = _jtp.getCaretPosition();
            Iterator<ColoredToken> promptpieces = formatter.coloredPrompt( linenumber );
            while( promptpieces.hasNext() ){
            
                ColoredToken ct = promptpieces.next();
                doc.insertString( cp, ct.data, ct.atts );
                cp += ct.data.length();
            
            
            }
            doc.insertString( cp, addwhitespace, null );
            cp = _jtp.getCaretPosition();
            int end = endOfLine();
            _jtp.setCaretPosition( end );
            doc.insertString( _jtp.getCaretPosition(), "", sas2 );
            outputspot = ospot + prompt_size;
            previousline.clear();
            doc.setParagraphAttributes( startOfLine(), 0, indent, false );
            lastpromptsize = (int)(getPromptLength( formatter.coloredPrompt( linenumber ) ) + StyleConstants.getFirstLineIndent( indent ));
        
        }
        catch( final Exception x ){
            x.printStackTrace();
        
        }      
        udm.discardAllEdits();       
        refreshUndoRedo();
        
    }
    //@nonl
    //@-node:zorcanda!.20051114092424.12:insertPrompt
    //@+node:zorcanda!.20051118231212:setIndent
    public void setIndent( String one, String two, MutableAttributeSet sas ){
    
        Graphics g = _jtp.getGraphics();
        if( g != null ){
        
            FontMetrics fm = g.getFontMetrics();
            int width = fm.stringWidth( one );
            int width2 = fm.stringWidth( two );
            g.dispose();
            if( width > width2 ){
    
                StyleConstants.setFirstLineIndent( sas, width - width2 );           
            
            }
        
    
        }
    
    }
    //@nonl
    //@-node:zorcanda!.20051118231212:setIndent
    //@+node:zorcanda!.20051128175051:setIndent2
    public void setIndent2( Iterator<ColoredToken> pit, MutableAttributeSet sas, int width2 ){
            
        int totalwidth = getPromptLength( pit );
        if( totalwidth < width2 ){
    
            StyleConstants.setFirstLineIndent( sas, width2 - totalwidth );           
            
        }
        
    }
    //@-node:zorcanda!.20051128175051:setIndent2
    //@+node:zorcanda!.20051128175803:getPromptLength
    public int getPromptLength( Iterator<ColoredToken> pit ){
    
        StyledDocument sd = (StyledDocument)_jtp.getDocument();
        Graphics2D g = (Graphics2D)_jtp.getGraphics();
        if( g != null ){
    
            int totalwidth = 0;
            while( pit.hasNext() ){
                ColoredToken ct = pit.next();           
                Font f;
                if( ct.atts.getAttribute( StyleConstants.FontFamily ) != null 
                    || ct.atts.getAttribute( StyleConstants.FontSize ) != null
                    || StyleConstants.isBold( ct.atts ) || StyleConstants.isItalic( ct.atts )
                    || StyleConstants.isSubscript( ct.atts ) || StyleConstants.isSuperscript( ct.atts ) ){
                    
                    Font dfont = _jtp.getFont();
                    int size = dfont.getSize();
                    if( ct.atts.getAttribute( StyleConstants.FontSize ) != null )
                        size = StyleConstants.getFontSize( ct.atts );
                    if( StyleConstants.isSubscript( ct.atts ) || StyleConstants.isSuperscript( ct.atts ) )
                        size -= 2;
                        
                    String family = dfont.getFamily();
                    if( ct.atts.getAttribute( StyleConstants.FontFamily ) != null )
                        family = StyleConstants.getFontFamily( ct.atts );            
                    
                    int style = dfont.getStyle();
                    if( StyleConstants.isBold( ct.atts ) )
                        style |= Font.BOLD;
                    if( StyleConstants.isItalic( ct.atts ) )
                        style |= Font.ITALIC;
                    
                    f = new Font( family, style, size );
    
                }
                else f = _jtp.getFont();
                g.setFont( f );
                FontMetrics fm = g.getFontMetrics();
                int width = fm.stringWidth( ct.data );
                totalwidth += width;
            
            }
            g.dispose();
            return totalwidth;
        }
        return 0;       
    }
    //@nonl
    //@-node:zorcanda!.20051128175803:getPromptLength
    //@-others
    //@-node:zorcanda!.20051117150852:prompt related...
    //@+node:zorcanda!.20051117150852.1:hooks...
    //@+at
    // These methods replace the displayHook and exceptHook of the regular 
    // interpreter.
    //@-at
    //@@c
    //@+others
    //@+node:zorcanda!.20051115233249:displayHook
    public void displayHook( PyObject o ){
    
            if (o == Py.None)
                 return;
    
            PySystemState sys = Py.getThreadState().systemState;
            sys.builtins.__setitem__("_", Py.None);
            PyObject orepr = o.__repr__();
            
    
            try{
                String ostring = outputprompt.getPrompt( linenumber );
                //_jtp.getDocument().insertString( _jtp.getCaretPosition(), ostring, outpSet );
                int cp = _jtp.getCaretPosition();
                Document doc = _jtp.getDocument();
                if( !supressing ){
    
                    Iterator<ColoredToken> tokens = outputprompt.coloredPrompt( linenumber );
                    while( tokens.hasNext() ){
                    
                        ColoredToken ct = tokens.next();
                        doc.insertString( cp, ct.data, ct.atts );
                        cp += ct.data.length();
                    
                    }
                    _jtp.setCaretPosition(  cp  );//_jtp.getCaretPosition() + ostring.length() );
                }
            }
            catch( BadLocationException ble ){}
            if( output.size() -1 == linenumber ){
                output.remove( linenumber );
                output.append( o );
            }
            else
                output.append( o );
            if( !supressing ) 
                Py.println( orepr );
            sys.builtins.__setitem__("_", o);
            int olength = output.size();
            if( olength > 2 ) _pi.set( "___", output.get( olength - 3 ) );
            if( olength > 1 ) _pi.set( "__", output.get( olength -2 ) );
            String name = String.format( "_%1$s", linenumber );
            _pi.set( name, o );
            Out.put( output.size() -1, o );
            
    
    }
    //@nonl
    //@-node:zorcanda!.20051115233249:displayHook
    //@+node:zorcanda!.20051116110751:exceptHook
    public void exceptHook(PyObject type, PyObject value, PyObject tb)//, PyObject file)
        {
            StdoutWrapper stderr = Py.stderr;
    
            colorizer.clearPositions();
            if (tb instanceof PyTraceback)
                stderr.print(((PyTraceback) tb).dumpStack());
            if (__builtin__.isinstance(value, (PyClass) Py.SyntaxError)) {
                stderr.println("  File \""+value.__findattr__("filename")+
                               "\", line "+value.__findattr__("lineno"));
                PyObject text = value.__findattr__("text");
                if (text != Py.None && text.__len__() != 0) {
                    stderr.println("\t"+text);
                    String space = "\t";
                    int col = ((PyInteger)value.__findattr__("offset").__int__()).getValue();
                    for(int j=1; j<col; j++)
                        space = space+" ";
                    stderr.println(space+"^");
                }
            }
    
            if (value instanceof PyJavaInstance) {
                Object javaError = value.__tojava__(Throwable.class);
    
                if (javaError != null && javaError != Py.NoConversion) {
                    stderr.println(getStackTrace((Throwable)javaError));
                }
            }
            stderr.println(formatException(type, value, tb));
            if( pdbonexception )
                _pi.exec( "import pdb;pdb.pm()" );
        }
    //@-node:zorcanda!.20051116110751:exceptHook
    //@+node:zorcanda!.20051116111114:getStackTrace
    String getStackTrace(Throwable javaError) {
            ByteArrayOutputStream buf = new ByteArrayOutputStream();
            javaError.printStackTrace(new PrintStream(buf));
    
            String str = buf.toString();
            int index = -1;
            if (index == -1)
                index = str.indexOf(
                    "at org.python.core.PyReflectedConstructor.call");
            if (index == -1)
                index = str.indexOf("at org.python.core.PyReflectedMethod.call");
            if (index == -1)
                index = str.indexOf(
                    "at org/python/core/PyReflectedConstructor.call");
            if (index == -1)
                index = str.indexOf("at org/python/core/PyReflectedMethod.call");
    
            if (index != -1)
                index = str.lastIndexOf("\n", index);
    
            int index0 = str.indexOf("\n");
    
            if (index >= index0)
                str = str.substring(index0+1,index+1);
    
            return str;
        }
    //@nonl
    //@-node:zorcanda!.20051116111114:getStackTrace
    //@+node:zorcanda!.20051116111014:formatException
    String formatException(PyObject type, PyObject value, PyObject tb) {
            StringBuffer buf = new StringBuffer();
    
            PyObject typeName;
            if (type instanceof PyClass) {
                buf.append(((PyClass) type).__name__);
            } else { 
                buf.append(type.__str__());
            }
            if (value != Py.None) {
                buf.append(": ");
                if (__builtin__.isinstance(value, (PyClass) Py.SyntaxError)) {
                    buf.append(value.__getitem__(0).__str__());
                } else {
                    buf.append(value.__str__());
                }
            }
            return buf.toString();
        }
    //@nonl
    //@-node:zorcanda!.20051116111014:formatException
    //@-others
    //@nonl
    //@-node:zorcanda!.20051117150852.1:hooks...
    //@+node:zorcanda!.20051114092424.13:keyPressed
    public final void keyPressed( final KeyEvent event ){
        
        if( event.isConsumed() ) return;
        final char which = event.getKeyChar();
        final int kc = event.getKeyCode();
        String opmodifiers = event.getKeyModifiersText( event.getModifiers() );
        if( opmodifiers.equals( "Ctrl" ) && ignorekc.contains( kc ) ) return;
        if( opmodifiers.equals( "Alt" ) && kc == KeyEvent.VK_P ) return;
    
        KeyStroke ks = KeyStroke.getKeyStrokeForEvent( event );
        if( isRegisteredKeyStroke( ks ) ) return;
        
        if( suspend ){
            event.consume();
            return;
        
        
        }
        if( outputspot > _jtp.getCaretPosition() ){
        
            try{
                event.consume();
                _jtp.setCaretPosition( outputspot );
                return;
            }
            catch( IllegalArgumentException iae ){
            
                Document doc = _jtp.getDocument();
                _jtp.setCaretPosition( doc.getEndPosition().getOffset() );
                return;
            
            }
        
        
        }
        
        if( which == '\n' ){
        
            event.consume();
            closeUtilityBoxes(); 
            udm.discardAllEdits();
            refreshUndoRedo();
            final Document doc = _jtp.getDocument();
            final int cp = _jtp.getCaretPosition();
            try{
                
            String line = get_input( cp );
            _jtp.setCaretPosition( endOfLine() );
            if( opmodifiers.equals( "Ctrl" ) ){
                if( line.trim().equals( "" ) ){
                
                    doc.insertString( _jtp.getCaretPosition(), "\n", null );
                    line = "";
                
                }
                else{
                    doc.insertString( _jtp.getCaretPosition(), ":\n", null );
                    line += ":";   
                }
            }
            else
                doc.insertString( _jtp.getCaretPosition() , "\n", null );    
            final StringBuilder sb = new StringBuilder();
            for( final char c: line.toCharArray() ){
                
                if( Character.isLetterOrDigit( c ) )
                    sb.append( c );
                else{
                
                    abbrevs.add( sb.toString() );
                    sb.delete( 0, sb.length() );
                    
                    }
                
                
                }
            if( sb.length() != 0 ) abbrevs.add( sb.toString() );
            lines.add( line );      
            
            if( stdinbarrier.getNumberWaiting() != 0 ){
            
                standardin.put( line );
                resettool = new CountDownLatch(1);
                stdinbarrier.await();
                resettool.await();
                resettool = null;
                stdinbarrier.reset();
                return;
            
            }
            
    
            execute.add( line );
            final FutureTask<Boolean> ft = new FutureTask<Boolean>( this );
            execute1( ft );
            Runnable r = new Runnable(){
            
                public void run(){
                    try{
    
                        final boolean more = ft.get();
                        Runnable next = getNextPrompt( more );
                        SwingUtilities.invokeAndWait( next );
    
                    }
                    catch( Exception x ){}
                }
            };
            execute1( r );
            return;
            
            }
            catch( final Exception x ){
                try{
    
                    getStandardErr().write( (x.toString()+"\n").getBytes() );
                    insertPrompt( false );
                
                }
                catch( final Exception xx ){
                    xx.printStackTrace();
                
                }
            
            }
        
        }
        else{
            
            try{
     
                if( kc == event.VK_BACK_SPACE ){
                    if( _jtp.getCaretPosition() -1 < outputspot ) event.consume();
                    return; // very important to return here!
                }
                
                if( !Character.isDefined( event.getKeyChar() ) )return;
                event.consume();
                final char k = event.getKeyChar();
                int end = endOfLine();
                String line = get_input( _jtp.getCaretPosition() );
                String original_line = line;
                int cp = _jtp.getCaretPosition();
                int splitpoint = cp - outputspot;//start;
                Map< Character, Character > chars = new HashMap< Character, Character >();
                chars.put( '[', ']' );
                chars.put( '(', ')' );
                chars.put( '{', '}' );
                chars.put( '"', '"' );
                chars.put( '\'', '\'' );
                String part1 = line.substring( 0, splitpoint );
                String part2 = line.substring( splitpoint );
                String k2 = "";
                boolean backone = false;
                if( chars.containsKey( k ) ){
                
                     k2 = chars.get( k ).toString();
        
                    
                    }
                
                line = part1 + k + k2 + part2;
                colorize( line, k+k2, _jtp.getCaretPosition(),  outputspot, end );
                _jtp.setCaretPosition( cp + 1 );
            
            }
            catch( final Exception x ){
                //x.printStackTrace();
            
            }
        
        
        
        
        }
        
    
    
    }
    
    //@+others
    //@+node:zorcanda!.20051114092424.14:keyReleased
    public final void keyReleased( final KeyEvent event ){
     
        KeyStroke ks = KeyStroke.getKeyStrokeForEvent( event );
        if( isRegisteredKeyStroke( ks ) ) return;
        event.consume();
    
    }
    //@nonl
    //@-node:zorcanda!.20051114092424.14:keyReleased
    //@+node:zorcanda!.20051114092424.15:keyTyped
    public final void keyTyped( final KeyEvent event ){
    
        KeyStroke ks = KeyStroke.getKeyStrokeForEvent( event );
        if( isRegisteredKeyStroke( ks ) ) return; 
        event.consume();
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051114092424.15:keyTyped
    //@-others
    //@nonl
    //@-node:zorcanda!.20051114092424.13:keyPressed
    //@+node:zorcanda!.20051114092424.16:shell special powers...
    //@+others
    //@+node:zorcanda!.20051114092424.19:getters
    //@+others
    //@+node:zorcanda!.20051114092424.20:getPyObject
    public final PyObject getPyObject( final String[] split2 ){ // such a simple method, is so vital...
    
        PyObject po1 = null;
        try{
            for( String s: split2 ){
        
                if( po1 == null ){
            
                    po1 = _pi.get( s );
                    continue;
                
                    }
                else{
            
                    po1 = po1.__findattr__( new PyString( s ) );
    
                    if( po1 == null ) break;
            
            
            
                } 
            
            }
        }catch( Exception x ){}
    
        return po1;
        
    }
    //@nonl
    //@-node:zorcanda!.20051114092424.20:getPyObject
    //@+node:zorcanda!.20051114092424.24:getObjectName
    public String getObjectName( PyObject py ){
    
        return py.getType().fastGetName();
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051114092424.24:getObjectName
    //@+node:zorcanda!.20051115142135:getBuiltin
    public Object getBuiltin( String name ){
    
        
        PySystemState pss = Py.getSystemState();
        //System.out.println( pss.builtins.getClass() );
        PyStringMap builtins = (PyStringMap)pss.builtins;
        //System.out.println( builtins );
        PyObject po = builtins.get( new PyString( name ) );
        if( po != null ){
    
            java.util.List<Method> methods = new LinkedList<Method>();
            Method[] dmethods = __builtin__.class.getDeclaredMethods();
            for( Method m : dmethods ){
            
                if( m.getName().equals( name ) ) methods.add( m );
            
            }
            if( methods.size() != 0 ) return methods;
            return po;
    
        }
        return null;
    
    }
    //@nonl
    //@-node:zorcanda!.20051115142135:getBuiltin
    //@-others
    //@nonl
    //@-node:zorcanda!.20051114092424.19:getters
    //@+node:zorcanda!.20051129120236:checkForJythonReference
    public void checkForJythonReference( String[] pieces ){
        
        for( int i = 0; i < pieces.length; i ++ ){
                
            String s = pieces[ i ];
            if( s.startsWith( "$" ) ){
                
                String nwpiece = s.substring( 1 );
                PyObject po = getPyObject( nwpiece.split( "\\." ) );
                if( po == null ) pieces[ i ] = nwpiece;
                else pieces[ i ] = po.__repr__().toString();
                
                
            }
            
            
        }
        
    }
    
    public String checkForJythonReference( String s ){
    
    
        Pattern p = Pattern.compile( "\\${1,2}\\w+|\\$\\{.+\\}" );
        Matcher m = p.matcher( s );
        StringBuffer sb = new StringBuffer();
        while( m.find() ){
            
            int start = m.start();
            int end = m.end();
            boolean isenv = false;
            String sstring = s.substring( start, end );
            if( sstring.startsWith( "$$" ) ) isenv = true;
            sstring = sstring.substring( 1 );
            PyObject po = getPyObject( sstring.split( "\\." ) );
            if( po != null ) m.appendReplacement( sb, Matcher.quoteReplacement( po.__repr__().toString() ) );
            else if( sstring.startsWith( "{" ) && sstring.endsWith( "}" ) ){
            
                String string2 = sstring.substring( 1, sstring.length() -1 );
                PyObject po2 = _pi.eval( string2 );
                if( po2 != null ) m.appendReplacement( sb, Matcher.quoteReplacement( po2.__repr__().toString() ) );
                else m.appendReplacement( sb, Matcher.quoteReplacement( sstring ) );
            
            }
            else if( isenv ){
            
                String estring = sstring.substring( 1 );
                String evar = System.getenv( estring );
                if( evar != null ) m.appendReplacement( sb, Matcher.quoteReplacement( evar ) );
                else m.appendReplacement( sb, Matcher.quoteReplacement( sstring ) );
            
            
            }
            else m.appendReplacement( sb, Matcher.quoteReplacement( sstring ) );
        
        }
        m.appendTail( sb );
        return sb.toString();
    
    }
    //@nonl
    //@-node:zorcanda!.20051129120236:checkForJythonReference
    //@+node:zorcanda!.20051201144046:bookmarks
    public void addBookmark( String bm, File directory ){
    
        bookmarks.put( bm, directory );
    
    
    }
    
    public File getBookmark( String bm ){
    
        if( bookmarks.containsKey( bm ) )
            return bookmarks.get( bm );
        return null;
        
    }
    
    public void removeBookmark( String bm ){
    
    
        if( bookmarks.containsKey( bm ) ) bookmarks.remove( bm );
    
    
    }
    
    public void clearBookmarks(){
    
        bookmarks.clear();
    
    }
    
    public Iterator<Map.Entry<String,File>> getBookmarks(){
    
    
        return bookmarks.entrySet().iterator();
    
    }
    
    
    //@-node:zorcanda!.20051201144046:bookmarks
    //@+node:zorcanda!.20051201213228:dhistory
    public PyList getDirectoryHistory(){
    
        return new PyList( (PyObject)dhistory );
    
    
    }
    
    public void addDirectoryToHistory( File directory ){
    
        dhistory.add( directory.toString() );
    
    }
    
    public String getDirectoryHistryEntryN( int n ){
    
        if( dhistory.size() < Math.abs(n) ) return null;
        PyInteger pi = new PyInteger( n );
        return dhistory.__getitem__( pi ).toString();
    
    }
    //@nonl
    //@-node:zorcanda!.20051201213228:dhistory
    //@+node:zorcanda!.20051202092942:directory stack
    public PyList getDirectoryStack(){
    
        return new PyList( (PyObject)dstack );
    
    }
    
    
    public String getTopOfDStack(){
    
        return dstack.get( 0 ).toString();
    
    }
    
    public String popDStack(){
        
        if( dstack.size() == 1 ) return null;
        return dstack.remove( 0 ).toString();
    
    
    }
    
    
    public void pushDStack( File f ){
    
        setCurrentWorkingDirectory( f );
        dstack.add( 0, f.toString() );
    
    
    }
    
    
    //@-node:zorcanda!.20051202092942:directory stack
    //@+node:zorcanda!.20051114141257:magic command methods..
    //@+others
    //@+node:zorcanda!.20051114092424.26:magicCommand
    public final boolean magicCommand( final String command ){
    
        MagicCommand handler = null;
        for( MagicCommand mc: mcommands ){
        
            if( mc.handle( command ) ){
            
                handler = mc;
                break;
            
            }
        
        
        }
        if( handler != null ) return handler.doMagicCommand( command );
        else{
            try{
                
                getStandardErr().write( "Magic Command not recognized\n".getBytes() );
            
            }
            catch( IOException io ){}
        
        }
        return true;
    
    }
    //@nonl
    //@-node:zorcanda!.20051114092424.26:magicCommand
    //@+node:zorcanda!.20051203104946:isMagicCommand
    public boolean isMagicCommand( String command ){
    
       if( command == null ) return false;
       for( MagicCommand mc: mcommands )if( mc.handle( command ) ) return true;
       return false;
    
    }
    //@nonl
    //@-node:zorcanda!.20051203104946:isMagicCommand
    //@+node:zorcanda!.20051114130526:createMagicCommands
    private void createMagicCommands(){
    
        Class[] commands = new Class[]{
        
            Macro.class, History.class, Debugger.class, Prun.class, Threads.class,
            XSLT.class, Serialize.class, Deserialize.class, Clean.class, Swing.class,
            Pwd.class, See.class, Cd.class, Ps.class, Ls.class, Send.class, Wait.class,
            Kill.class, Clear.class, Lsmagic.class, Magic.class, Url.class, Bg.class, Pfile.class,
            Pdoc.class, Pinfo.class, P.class, R.class, Env.class, Save.class, Who.class, Whos.class,
            Autocall.class, Autoindent.class, Sc.class, Sx.class, Who_ls.class, Ed.class, Reset.class,
            org.leo.shell.magic.Alias.class, Rehash.class, Rehashx.class, Unalias.class, Run.class,
            Keystrokes.class, Bookmark.class, Dhist.class, Dirs.class, Popd.class, Pushd.class,
            Automagic.class, Logstart.class, Logoff.class, Logon.class, Logstate.class, Bgprocess.class,
            Runlog.class, Iuse.class
        
        };
    
        for( Class z: commands ){
            try{
                MagicCommand mc = (MagicCommand)z.newInstance();
                registerMagicCommand( mc );
            }
            catch( InstantiationException ie ){}
            catch( IllegalAccessException iae ){}
        
        }
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051114130526:createMagicCommands
    //@+node:zorcanda!.20051114141257.1:registerMagicCommand
    public void registerMagicCommand( MagicCommand mc ){
        
        if( mc == null ) return;
        mc.setJythonShell( this );
        mcommands.add( mc );
    
    }
    
    public void unregisterMagicCommand( MagicCommand mc ){
    
        if( mc == null ) return;
        mcommands.remove( mc );
    
    }
    //@nonl
    //@-node:zorcanda!.20051114141257.1:registerMagicCommand
    //@+node:zorcanda!.20051128182312:createMagicCommandFromJython
    public MagicCommand createMagicCommandFromJython( String name, String code ){
    
        try{   
            StringBuilder sb = new StringBuilder();
            sb.append( "import org.leo.shell.MagicCommand as MagicCommand\n" ).append( code );
            code = sb.toString();
            byte[] data = code.getBytes();
            ByteArrayInputStream bais = new ByteArrayInputStream( data );
            PyObject po = imp.createFromSource( name, bais, code );
            PyClass mcommand = (PyClass) __builtin__.getattr( po, new PyString( name )  );
            PyObject instance =  mcommand.__call__( new PyObject[]{}, new String[]{} );
            MagicCommand mc = (MagicCommand)Py.tojava( instance, MagicCommand.class );
            mc.setJythonShell( this );
            return mc;
        }
        catch( Exception x ){}
        return null;
    
    }
    //@nonl
    //@-node:zorcanda!.20051128182312:createMagicCommandFromJython
    //@-others
    //@-node:zorcanda!.20051114141257:magic command methods..
    //@+node:zorcanda!.20051114092424.57:dynamic abbreviations
    //@+others
    //@+node:zorcanda!.20051114092424.58:dynamicAbbreviation
    public final void dynamicAbbreviation(){
    
        //int start = startOfLine();
        int end = _jtp.getCaretPosition();
        final Document doc = _jtp.getDocument();
    
        try{
        String line = doc.getText( outputspot, end - outputspot );
        
    
        final String[] pieces = line.split( "[^\\w^%]");//"\\W" );
        final String current;
        if( pieces.length > 0 ) current = pieces[ pieces.length -1 ];
        else
            current = line;
        
        
        String astart = current;
        if( _lab != null && _lab.current.equals( current ) && ( _lab.spos == end - current.length() ) ){
        
    
            astart = _lab.start;
        
        
        }
        
        final String nabbrev = findNextAbbreviation( astart, current );
            
        if( nabbrev != null ){
                _lab = new Abbreviation( astart, nabbrev, end - current.length() );
                String nline;
                if( line.length() != current.length() ){
                
                    nline = line.substring( 0, line.length() - current.length() );
                    
                    }
                else
                    nline = "";
                    
                nline = nline + nabbrev;
                doc.remove( outputspot, end - outputspot );
                colorize( nline, nline, outputspot, outputspot, end );
            
            }
        
        }
        catch( final Exception x ){
        
            x.printStackTrace();
    
        }
    
    }
    //@-node:zorcanda!.20051114092424.58:dynamicAbbreviation
    //@+node:zorcanda!.20051114092424.59:findNextAbbreviation
    public final String findNextAbbreviation( final String start, final String current ){
    
        final LinkedList<String> llist = new LinkedList<String>();
        for( final String s: abbrevs ){
        
            if( s.startsWith( start ) ) llist.add( s );
            
        }
          
        if( llist.size() > 0 ){
        
            final int index = llist.indexOf( current );
            final int size = llist.size();
            if( index == -1 ||  ( index == size -1 ) )
                return llist.get( 0 );
            else{
            
                return llist.get( index + 1 );
            
            
            
            }         
             
            
            }
        else return null;
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051114092424.59:findNextAbbreviation
    //@-others
    //@-node:zorcanda!.20051114092424.57:dynamic abbreviations
    //@-others
    //@-node:zorcanda!.20051114092424.16:shell special powers...
    //@+node:zorcanda!.20051114092424.60:startOfLine endOfLine
    public final int startOfLine(){
    
        
        try{
            
            Element e = Utilities.getParagraphElement( _jtp, _jtp.getCaretPosition() );
            return e.getStartOffset();
            
        
        }
        catch( final Exception x ){
            x.printStackTrace();
        
        }
        
        return 0;
    
    }
    
    
    
    public int endOfLine(){
    
        try{
    
                
            Element e = Utilities.getParagraphElement( _jtp, _jtp.getCaretPosition() );
            return e.getEndOffset() -1;
        
        }
        catch( final Exception x ){
            x.printStackTrace();
        
        }
        return 0;
    
    
    }
    
    //@-node:zorcanda!.20051114092424.60:startOfLine endOfLine
    //@+node:zorcanda!.20051114092424.62:colorize
    public final void colorize( final String line, final String insert, final int insertspot, final int start, final int end ){
    
        colorizer.colorize( line, insert, insertspot, start, end );
    
    }
    //@-node:zorcanda!.20051114092424.62:colorize
    //@+node:zorcanda!.20051128184338:closeUtilityBoxes
    public void closeUtilityBoxes(){
    
        UtilityBoxEvent ube = new UtilityBoxEvent( this, UBEventType.Close );
        for( UtilityBoxListener ubl: utilboxlisteners.toArray( new UtilityBoxListener[]{} ) )
            ubl.utilityBoxClose( ube );
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051128184338:closeUtilityBoxes
    //@+node:zorcanda!.20051114092424.67:processScript
    public final FutureTask<Boolean> processScript( final java.util.List<String> script ){
    
        //admittedly, we could do this from any method, but this just makes it easier to use. :)
        _jtp.setCaretPosition( getOutputSpot() );
        ScriptExecutor se = new ScriptExecutor( this, script );
        return se.submit();
       
    }
    
    
    
    //@-node:zorcanda!.20051114092424.67:processScript
    //@+node:zorcanda!.20051119192239:processHistoryString
    public java.util.List<String> processHistoryString( String hstring ){
    
        String[] pieces = hstring.split( "\\s+" );
        LinkedList<String> hitems = new LinkedList<String>();
        for( String chunk: pieces ){
            try{
                int isslice = chunk.indexOf( ":" );
                if( isslice != -1 ){
                    
                    String part1 = chunk.substring( 0, isslice );
                    String part2 = chunk.substring( isslice + 1 );
                    int s1 = Integer.valueOf( part1 );
                    int s2 = Integer.valueOf( part2 );
                    java.util.List<String> subhistory = history.subList( s1, s2 );
                    for( String s: subhistory ) hitems.add( s );
                    
            
                }         
                else{
                
                    int lspot = Integer.valueOf( chunk );
                    String line = history.get( lspot ).toString();
                    hitems.add( line );
                
                
                }
            }
            catch( NumberFormatException nfe ){}
            catch( IndexOutOfBoundsException iobe ){}
        }
        
        return hitems;
    }
    //@nonl
    //@-node:zorcanda!.20051119192239:processHistoryString
    //@+node:zorcanda!.20051203102709:getNextPrompt
    public synchronized Runnable getNextPrompt( boolean more ){
    
        if( nextprompt == null ){
        
            return new InsertPrompt( this, more );
            
        
        }
        Runnable run = nextprompt;
        nextprompt = null;
        return run;
    
    
    }
    
    
    public synchronized void setNextPrompt( Runnable run ){
    
        nextprompt = run;
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051203102709:getNextPrompt
    //@+node:zorcanda!.20051203115121:setAutomagic getAutomagic
    public void setAutomagic( boolean status ){
    
        automagic = status;
    
    }
    
    public boolean getAutomagic(){
    
        return automagic;
    
    }
    //@nonl
    //@-node:zorcanda!.20051203115121:setAutomagic getAutomagic
    //@+node:zorcanda!.20051203121403:addLogger removeLogger
    public void addLogger( OutputStream log ){
    
        loggers.add( log );
    
    }
    
    public void removeLogger( OutputStream log ){
    
        if( loggers.contains( log ) ) loggers.remove( log );
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051203121403:addLogger removeLogger
    //@+node:zorcanda!.20051117150852.2:miscellaneous getter/setters
    //@+others
    //@+node:zorcanda!.20051114102804:getShellComponent getCurrentWorkingDirectory,etc...
    public JTextComponent getShellComponent(){
    
    
        return _jtp;
        
    
    }
    
    public File getCurrentWorkingDirectory(){
    
        return cwd;
    
    
    }
    
    public void setCurrentWorkingDirectory( File f ){
    
        cwd = f;
        addDirectoryToHistory( f );
    
    }
    //@-node:zorcanda!.20051114102804:getShellComponent getCurrentWorkingDirectory,etc...
    //@+node:zorcanda!.20051114100300.1:stdout stderr
    public OutputStream getStandardOut(){
    
        return stdout;
    
    
    }
    
    public OutputStream getStandardErr(){
    
    
        return stderr;
    
    }
    //@nonl
    //@-node:zorcanda!.20051114100300.1:stdout stderr
    //@+node:zorcanda!.20051115173211:get set OutputSpot
    public int getOutputSpot(){
    
        return outputspot;
    
    }
    
    public void setOutputSpot( int spot ){
    
        outputspot = spot;
    
    }
    //@nonl
    //@-node:zorcanda!.20051115173211:get set OutputSpot
    //@+node:zorcanda!.20051116111716:get set PdbOn
    public void setPdbOnException( boolean on ){
    
        pdbonexception = on;
    
    
    }
    
    public boolean getPdbOnException(){
    
    
        return pdbonexception;
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051116111716:get set PdbOn
    //@+node:zorcanda!.20051118222459:getWho
    public java.util.List<String> getWho(){
    
        return who;
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051118222459:getWho
    //@+node:zorcanda!.20051118234638.1:getAutocall setAutocall
    public boolean getAutocall(){
    
        return autocall;
    
    }
    
    public void setAutocall( boolean value ){
    
        autocall = value;
    
    }
    //@nonl
    //@-node:zorcanda!.20051118234638.1:getAutocall setAutocall
    //@+node:zorcanda!.20051119000519:getAutoindent setAutoindent
    public void setAutoindent( boolean value ){
    
        autoindent = value;
    
    }
    
    public boolean getAutoindent(){
    
        return autoindent;
    
    }
    //@nonl
    //@-node:zorcanda!.20051119000519:getAutoindent setAutoindent
    //@-others
    //@-node:zorcanda!.20051117150852.2:miscellaneous getter/setters
    //@+node:zorcanda!.20051204145237:Documentations stuff..
    //@+node:zorcanda!.20051129164017.1:getDocumentation
    public String getDocumentation(){
    
        String separator = "---------------\n";
        String draggin = "Draging Files into The Shell:\n"+
        "This has the happy effect of executing the contents of "+
        "the file as a script.  Drag away!\n\n";
    
    
        String input = "Input caching system:\n"+
        "The JythonShell offers numbered prompts (In/Out) with input and output caching. All input is saved and can be retrieved as variables (besides the usual arrow key recall). The following GLOBAL variables always exist (so don t overwrite them!): _i: stores previous input. _ii: next previous. _iii: next-next previous. _ih : a list of all input _ih[n] is the input from line n and this list is aliased to the global variable In. If you overwrite In with a variable of your own, you can remake the assignment to the internal list with a simple  In=_ih . Additionally, global variables named _i<n> are dynamically created (<n> being the prompt counter), such that _i<n> == _ih[<n>] == In[<n>]. For example, what you typed at prompt 14 is available as _i14, _ih[14] and In[14].\n" +
        "This allows you to easily cut and paste multi line interactive prompts by printing them out: they print like a clean string, without prompt characters. You can also manipulate them like regular variables (they are strings), modify or exec them (typing  exec _i9  will re-execute the contents of input prompt 9,  exec In[9:14]+In[18]  will re-execute lines 9 through 13 and line 18). You can also re-execute multiple lines of input easily by using the magic %macro function (which automates the process and allows re-execution without having to type  exec  every time). The macro system also allows you to re-execute previous lines which include magic function calls (which require special processing).  A history function %hist allows you to see any part of your input history by printing a range of the _i variables.\n\n";
        
        
        String output = "Output caching system:\n"+
        "For output that is returned from actions, a system similar to the input cache exists but using _ instead of _i. Only actions that produce a result (NOT assignments, for example) are cached. If you are familiar with Mathematica, JythonShell's _ variables behave exactly like Mathematica s % variables. The following GLOBAL variables always exist (so don t overwrite them!): _ (a single underscore) : stores previous output, like Python s default interpreter. __ (two underscores): next previous. ___ (three underscores): next-next previous. Additionally, global variables named _<n> are dynamically created (<n> being the prompt counter), such that the result of output <n> is always available as _<n> (don t use the angle brackets, just the number, e.g. _21). These global variables are all stored in a global dictionary (not a list, since it only has entries for lines which returned a result) available under the names _oh and Out (similar to _ih and In). So the output from line 12 can be obtained as _12, Out[12] or _oh[12]. If you accidentally overwrite the Out variable you can recover it by typing  Out=_oh  at the prompt.\n\n";
        
        
        String dhist = "Directory history:\n"+
        "Your history of visited directories is kept in the global list _dh, and the magic %cd command can be used to go to any entry in that list. The %dhist command allows you to view this history.\n\n";
        
        StringBuilder sb = new StringBuilder();
        sb.append( draggin );
        sb.append( separator );
        sb.append( input );
        sb.append( separator );
        sb.append( output );
        sb.append( separator );
        sb.append( dhist );
        return sb.toString();
    
    }
    //@nonl
    //@-node:zorcanda!.20051129164017.1:getDocumentation
    //@+node:zorcanda!.20051201134044:getKeystrokeDescriptions
    public String getKeystrokeDescriptions(){
        
        StringBuilder sb = new StringBuilder();
        final String keystrokes = "Keystrokes:\n"+
        "-------------\n"+ 
        "Enter -- this processes the current line from the prompt to the end,\n regardless of where the cursor is at\n"+
        "Ctrl Enter -- This keystroke has two meanings:\n" +
        "1. process the current line with a ':' appended to the end of it,\n regardless of where the cursor is at.\nThis is the behavior if there is character data on the line\n" +
        "2. If the line is pure whitespace, then the line is interpreted as a '' string with a length of 0.\n\n";
        
        sb.append( keystrokes ); 
        
        InputMap im = _jtp.getInputMap();
        ActionMap am = _jtp.getActionMap();
        Map<String,String> docs = new HashMap<String,String>();
        for( KeyStroke ks: im.keys() ){
        
            Object value = im.get( ks );
            ActionListener al = (ActionListener)am.get( value );
            if( al instanceof Documentation ){
            
                Documentation doc = (Documentation)al;
                String description = doc.getDocumentation();
                String keystroke = String.format( "%1$s %2$s", 
                                                  KeyEvent.getKeyModifiersText( ks.getModifiers() ),
                                                  KeyEvent.getKeyText( ks.getKeyCode() ) ).trim();
                docs.put( keystroke, description );
             
             }
        
        }
        java.util.List<String> keys = new ArrayList<String>( docs.keySet() );
        Collections.sort( keys );
        for( String s: keys ){
        
            sb.append( s );
            sb.append( " ---> " );
            sb.append( docs.get( s ) ); 
            sb.append( "\n" );       
        
        }
    
        return sb.toString();
    
    }
    //@nonl
    //@-node:zorcanda!.20051201134044:getKeystrokeDescriptions
    //@+node:zorcanda!.20051129152250:getMagicDescriptions
    public String getMagicDescriptions(){
    
        StringBuilder sb = new StringBuilder();
        for( MagicCommand mc: mcommands ){
            sb.append( mc.getName() ).append( "\n" );
            String description = mc.getDescription();
            if( description.endsWith( "\n" ) && !description.endsWith( "\n\n" ) ) description += "\n";
            else if( !description.endsWith( "\n\n" ) ) description += "\n\n";
            sb.append( description );
            sb.append( "------------------\n" );
    
        }
        sb.append( "\n" );
        return sb.toString();
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051129152250:getMagicDescriptions
    //@+node:zorcanda!.20051204145237.1:getInteractiveDescriptions
    public String getInteractiveDescriptions(){
    
        StringBuilder sb = new StringBuilder();
        sb.append( "Shell Interactive Use:\n" );
        char[] c = new char[ 15 ];
        Arrays.fill( c, '-' );
        String separator = new String( c );
        for( Documentation doc: iudocproviders ){
            sb.append( separator ).append( "\n" );
            String dstring = doc.getDocumentation();
            sb.append( dstring );
            if( dstring.endsWith( "\n\n" ) );
            else if( dstring.endsWith( "\n" ) ) sb.append( "\n" );
            else sb.append( "\n\n" );
        
        
        }
        return sb.toString();
    
    }
    
    public void addInteractiveDocumentation( Documentation doc ){
    
        iudocproviders.add( doc );
    
    }
    //@nonl
    //@-node:zorcanda!.20051204145237.1:getInteractiveDescriptions
    //@+node:zorcanda!.20051204163152:getUnifiedHelp
    public String getUnifiedHelp(){
    
        final StringBuilder sb = new StringBuilder(); 
        
        sb.append( getKeystrokeDescriptions() );    
        sb.append( getInteractiveDescriptions() );
    
        final String magic = "Magic Commands:\n"+
        "----------------\n" +
        "Entering one of the following commands will cause its\n"+
        "corresponding command to execute:\n\n";
        sb.append( magic );
        sb.append( getMagicDescriptions() );
    
        
        final String note = "A Note on JPIDs and the CWD:\n"+
        "-----------------------------\n"+
        "JPIDs are not PIDs of the OS.  They are a system by which the JythonShell\n"+
        "can keep track of Processes created by it, and means by which the user can\n"+
        "manipulate those Processes.\n\n"+
        "The CWD does not indicate what the process is working in.  It is intended to function\n"+
        "with the Magic Commands.  This system does not interoperate with java.io.File or Jython\n"+
        "open.  To achieve interopability the user should use the magic command of the form:\n"+
        "%cwd reference\n"+
        "This will place a java.io.File in the reference.  The File instance is a copy of the CWD\n"+
        "File and will allow the user to open, write, create, close streams and such in the JythonShell's\n"+
        "CWD\n";
        
        sb.append( note );
        return sb.toString();
        
    }
    //@-node:zorcanda!.20051204163152:getUnifiedHelp
    //@-node:zorcanda!.20051204145237:Documentations stuff..
    //@+node:zorcanda!.20051114092424.70:menu actions
    //@+node:zorcanda!.20051114092424.71:print
    public final void print(){
    
        final String data = _jtp.getText();
        final HashDocAttributeSet hatt = new HashDocAttributeSet();
        final SimpleDoc sdoc = new SimpleDoc(  data , DocFlavor.STRING.TEXT_PLAIN , hatt );
        final PrintService[] pservices = PrintServiceLookup.lookupPrintServices( DocFlavor.STRING.TEXT_PLAIN , hatt );
        
        if( pservices.length != 0 ){
        
            final HashPrintRequestAttributeSet hpattset = new HashPrintRequestAttributeSet();
            final PrintService ps = ServiceUI.printDialog( null, 50, 50, pservices, pservices[ 0 ], DocFlavor.STRING.TEXT_PLAIN, hpattset );
            if( ps != null ){
                
                final DocPrintJob dpj = ps.createPrintJob();
                //dpj.addPrintJobListener( self.PrintJobReporter() )
                try{
                
                    dpj.print( sdoc, hpattset );
                }
                catch( final Exception x ){
                    
                    x.printStackTrace();
                
                }
                
                }
    
            }
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051114092424.71:print
    //@+node:zorcanda!.20051114092424.72:open
    public final void open(){
    
        final JFileChooser jfc = new JFileChooser();
        javax.swing.filechooser.FileFilter pff = new javax.swing.filechooser.FileFilter(){
        
            public boolean accept( File f ){
            
                String name = f.getName();
                if( name.endsWith( ".py" ) ) return true;
                else if( f.isDirectory() ) return true;
                return false;
            
            }
        
            public String getDescription(){ return ".py files"; };
        
        };
        jfc.setFileFilter( pff );
        if( jfc.APPROVE_OPTION  ==jfc.showOpenDialog( base ) ){
        
            try{
            
                final File f = jfc.getSelectedFile();
                final FileReader fr = new FileReader( f );
                final BufferedReader br = new BufferedReader( fr );
                final Vector<String> execute = new Vector<String>();
                while( true ){
                
                    String data = br.readLine();
                
                    if( data == null ) break;
                    if( data.startsWith( ">>>" ) || data.startsWith( "..." ) )
                        data = data.substring( 3 );
                    execute.add( data );
                    
                }     
                br.close();    
                processScript( execute );
                 
            }
            catch( final Exception x ){
                
                x.printStackTrace();
            
            }
           
        
        }
    
    
    
    
    
    }
    //@-node:zorcanda!.20051114092424.72:open
    //@+node:zorcanda!.20051114092424.73:save
    public final void save(){
    
    
        final JFileChooser jfc = new JFileChooser();
        if( jfc.APPROVE_OPTION  ==jfc.showSaveDialog( base ) ){
        
            try{
                final File f = jfc.getSelectedFile();
                final PrintWriter pw = new PrintWriter( f );
                for( final String data: lines ){
                
                    pw.println( data );
                    
                    }
                pw.close();
            }
            catch( final Exception x ){
                
                x.printStackTrace();
            
            }
        
        
        
        }
    
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051114092424.73:save
    //@+node:zorcanda!.20051114092424.74:close
    public final void close(){
    
        //_frame.setVisible( false );
        //_frame.dispose();
        try{
            if( closer != null ) closer.call();
        }
        catch( Exception x ){}
    
    }
    
    public final void setCloser( Callable call ){
    
        closer = call;
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051114092424.74:close
    //@+node:zorcanda!.20051114092424.75:help
    public final void help(){
    
        final JFrame jf = new JFrame();
        jf.setTitle( "JythonShell Help" );
        jf.setLayout( new BorderLayout() );
        jf.setDefaultCloseOperation( jf.DISPOSE_ON_CLOSE );
        jf.setSize( base.getSize() );
        jf.setLocation( base.getLocation() );
        final JTextArea jta = new JTextArea();
        jta.setLineWrap( true );
        jta.setEditable( false );
        jta.setForeground( colorconfig.getForegroundColor() );//_fg );
        jta.setBackground( colorconfig.getBackgroundColor() );//_bg );
        jta.setFont( _jtp.getFont() );    
        jta.setText( getUnifiedHelp() );
        jta.setCaretPosition( 0 );
        final JScrollPane jsp = new JScrollPane( jta );
        jsp.setHorizontalScrollBarPolicy( jsp.HORIZONTAL_SCROLLBAR_NEVER );
        jf.add( jsp, BorderLayout.CENTER );
        final JPanel jp = new JPanel();
        final AbstractAction clz = new AbstractAction( "Close "){
        
            public final void actionPerformed( final ActionEvent ae ){
            
                jf.setVisible( false );
                jf.dispose();
            
            }
        
        
        };
        final JButton close = new JButton( clz );
        jp.add( close );
        jf.add( jp, BorderLayout.SOUTH );
        jf.setVisible( true );
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051114092424.75:help
    //@+node:zorcanda!.20051114092424.77:getCut
    //@+at
    // public final Action getCut(){
    // 
    //     final Action cut = new AbstractAction( "Cut" ){
    //         public final void actionPerformed( final ActionEvent ae ){
    //             _jtp.cut();
    //         }
    //     };
    // 
    // 
    //     return cut;
    // }
    //@-at
    //@nonl
    //@-node:zorcanda!.20051114092424.77:getCut
    //@+node:zorcanda!.20051204173158:getPasteAsScript
    public Action getPasteAsScript(){ return pas;}
    //@nonl
    //@-node:zorcanda!.20051204173158:getPasteAsScript
    //@-node:zorcanda!.20051114092424.70:menu actions
    //@+node:zorcanda!.20051114092424.78:helper classes
    //@+others
    //@+node:zorcanda!.20051114092424.81:class JythonDelegate
    public final static class JythonDelegate{
    
        final JythonShell _js;
    
        public JythonDelegate( final JythonShell js ){
        
            _js = js;
        
        
        }
    
        public final void addToMenu( final JComponent jm ){
            
            final int count = _js._jmb.getComponentCount();
            _js._jmb.add( jm, count -1 );
        
        
        }
        
        
        public final void processAsScript( final java.util.List<String> data ){
        
            _js.processScript( data );
        
        
        }
        
        public final void requestFocusInWindow(){
        
        
            _js._jtp.requestFocusInWindow();
        
        
        }
        
        public final void remove( final int pos ){
        
            try{
        
                _js._jtp.getDocument().remove( pos, 1 );
                
            }
            catch( BadLocationException ble ){}
        
        }
        
        public final void setReference( Object ref, Object data ){
        
        
            _js._pi.set( ref.toString(), data );
        
        
        }
        
        public final Object getReference( final String ref ){
        
            return _js.getPyObject( ref.split( "\\." ) );
        
        
        }
    
        public final int insertWidget( final JComponent jc ){
        
            final Document doc = _js._jtp.getDocument();
            int remove_pos = 0;
            try{
            
                final SimpleAttributeSet sas = new SimpleAttributeSet();
                StyleConstants.setComponent( sas, jc );
                doc.insertString( _js._jtp.getCaretPosition(), "\n", sas );
                remove_pos = _js._jtp.getCaretPosition();
                doc.insertString( remove_pos, "\n", sas );
                _js.insertPrompt( false );
            
            }
            catch( BadLocationException ble ){
            
            }
            
            return remove_pos;
        
        } 
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051114092424.81:class JythonDelegate
    //@+node:zorcanda!.20051114092424.97:class _SelectionReturner
    public final static class _SelectionReturner implements ListSelectionListener{
    
        private final JTextPane _jtp;
    
        public _SelectionReturner( final JTextPane jtp ){
        
            _jtp = jtp;
        
        }
    
        public final void valueChanged( final ListSelectionEvent lse ){
        
        
            _jtp.requestFocusInWindow();
        
        
        }
    
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051114092424.97:class _SelectionReturner
    //@+node:zorcanda!.20051114092424.101:class RemoveObjects
    public static class RemoveObjects implements MouseWheelListener{
    
        JythonShell js;
        
        public RemoveObjects( JythonShell js ){
        
            this.js = js;
        
        }
    
        public void mouseWheelMoved( MouseWheelEvent me ){
        
            js.closeUtilityBoxes();
        
        }
    
    
    }
    //@-node:zorcanda!.20051114092424.101:class RemoveObjects
    //@+node:zorcanda!.20051128210759:class DropFileMechanism
    //@+at
    // public static class DropFileMechanism extends DropTargetAdapter{
    // 
    //     JythonShell js;
    //     public DropFileMechanism( JythonShell js ){
    //         super();
    //         this.js = js;
    //         DropTarget dt = new DropTarget( js.getShellComponent(), this );
    //         dt.setDefaultActions( DnDConstants.ACTION_COPY );
    //     }
    // 
    //     public void drop( DropTargetDropEvent dte ){
    //         boolean gotData = false;
    //         try{
    //             dte.acceptDrop( DnDConstants.ACTION_COPY );
    //             Transferable trans = dte.getTransferable();
    //             if( trans.isDataFlavorSupported( 
    // DataFlavor.javaFileListFlavor ) ){
    //                 try{
    //                     java.util.List<File> files = 
    // (java.util.List<File>)trans.getTransferData( 
    // DataFlavor.javaFileListFlavor );
    //                     for( File f: files ){
    //                         FileInputStream fis = new FileInputStream( f );
    //                         BufferedReader br = new BufferedReader( new 
    // InputStreamReader( fis ) );
    //                         LinkedList<String> script = new 
    // LinkedList<String>();
    //                         String s = null;
    //                         while( ( s = br.readLine() ) != null ) 
    // script.add( s );
    //                         br.close();
    //                         js.processScript( script );
    //                     }
    //                     gotData = true;
    //                 }
    //                 catch( UnsupportedFlavorException ufe ){}
    //                 catch( IOException io ){}
    //                 return;
    //             }
    //             else if ( trans.isDataFlavorSupported( 
    // DataFlavor.stringFlavor )){
    //                 try{
    //                     String s = (String)trans.getTransferData( 
    // DataFlavor.stringFlavor );
    //                     URL url = new URL( s );
    //                     InputStream is = url.openStream();
    //                     BufferedReader br = new BufferedReader( new 
    // InputStreamReader( is ) );
    //                     String line = null;
    //                     LinkedList<String> script = new 
    // LinkedList<String>();
    //                     while( ( line = br.readLine() ) != null ){
    //                         script.add( line );
    //                     }
    //                     br.close();
    //                     gotData = true;
    //                     js.processScript( script );
    //                 }
    //                 catch( UnsupportedFlavorException ufe ){}
    //                 catch( MalformedURLException mue ){}
    //                 catch( IOException io ){}
    //                 }
    //             }
    //             finally{
    //                 dte.dropComplete( gotData );
    //                 js.getShellComponent().requestFocus();
    //             }
    //         return;
    // 
    //     }
    // 
    // 
    // }
    //@-at
    //@nonl
    //@-node:zorcanda!.20051128210759:class DropFileMechanism
    //@+node:zorcanda!.20051129094647:class DropFileMechanism
    public static class DropFileMechanism extends TransferHandler{
    
        JythonShell js;
        TransferHandler delegate;
        public DropFileMechanism( JythonShell js ){
            super();
            this.js = js;
            JTextComponent sc = js.getShellComponent();
            delegate = sc.getTransferHandler();
            sc.setTransferHandler( this );
            
        
        
        }
        
        @Override
        public void exportToClipboard( JComponent comp, Clipboard clipboard, int action ){
        
        
            delegate.exportToClipboard( comp, clipboard, action );
        
        }
        
        @Override
        public boolean canImport( JComponent c, DataFlavor[] transfers ){
        
            for( DataFlavor df: transfers ){
    
                if( df.isFlavorTextType() ) return true;
                else if( df.isFlavorJavaFileListType() ) return true;
                
            }
            return false;
        
        }
        
        @Override
        public boolean importData( JComponent c, Transferable trans ){
            
            boolean gotData = false;
            DataFlavor[] flavors = trans.getTransferDataFlavors();
            boolean ok = false;
            for( DataFlavor flavor: flavors ){
            
                if( flavor.isFlavorJavaFileListType() ){
                    ok = true;
                    break;
                }
                else if( flavor.equals( uriListFlavor ) ){
                    ok = true;
                    break;
                
                }
            
            }
            if( !ok ) return delegate.importData( c, trans );
            try{
                if( trans.isDataFlavorSupported( DataFlavor.javaFileListFlavor ) ){
                
                    try{
                        java.util.List<File> files = (java.util.List<File>)trans.getTransferData( DataFlavor.javaFileListFlavor );
                        for( File f: files ){
                        
                            FileInputStream fis = new FileInputStream( f );
                            BufferedReader br = new BufferedReader( new InputStreamReader( fis ) );
                            LinkedList<String> script = new LinkedList<String>();
                            String s = null;
                            while( ( s = br.readLine() ) != null ) script.add( s );
                            br.close();
                            js.processScript( script );
                           
                        
                        }
                        gotData = true;
                    }
                    catch( UnsupportedFlavorException ufe ){}
                    catch( IOException io ){}
            
                }
                else if ( trans.isDataFlavorSupported( uriListFlavor )){
                    
                    
                    try{
                        String s = (String)trans.getTransferData( DataFlavor.stringFlavor );
                        URL url = new URL( s );
                        InputStream is = url.openStream();
                        BufferedReader br = new BufferedReader( new InputStreamReader( is ) );
                        String line = null;
                        LinkedList<String> script = new LinkedList<String>();
                        while( ( line = br.readLine() ) != null ){
                    
                            script.add( line );
                        
                    
                        }
                        br.close();
                        gotData = true;
                        js.processScript( script );
                
                    }
                    catch( UnsupportedFlavorException ufe ){ ufe.printStackTrace(); }
                    catch( MalformedURLException mue ){ mue.printStackTrace();} 
                    catch( IOException io ){ io.printStackTrace(); }
                    }
                }
                finally{
                
                    //dte.dropComplete( gotData );
                
                }
                return gotData;
    
        }
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051129094647:class DropFileMechanism
    //@+node:zorcanda!.20051120203436:class JSColorConfigurationListener
    public static class JSColorConfigurationListener implements ColorConfigurationListener{
    
        JythonShell js;
        public JSColorConfigurationListener( JythonShell js ){
        
            this.js = js;
        
        }
        
        public void colorChanged( ColorEvent ce ){
        
            ColorConfiguration cc = (ColorConfiguration)ce.getSource();
            if( cc == js.colorconfig ){
            
                ColorConstant constant = ce.getColorConstant();
                switch( constant ){
                
                
                    //@                <<case statement>>
                    //@+node:zorcanda!.20051120203847:<<case statement>>
                    case Background:
                        js._jtp.setBackground( cc.getBackgroundColor() );
                        break;
                    case Foreground:
                        js._jtp.setForeground( cc.getForegroundColor() );
                        js._jtp.setCaretColor( cc.getForegroundColor() );
                        break;
                    case Out:
                        SimpleAttributeSet outSet = new SimpleAttributeSet();
                        StyleConstants.setForeground( outSet, cc.getOutColor() );
                        StyleConstants.setFirstLineIndent( outSet, 0 );
                        js.outSet = outSet;
                        break;
                    case Error:
                        SimpleAttributeSet errSet = new SimpleAttributeSet();
                        StyleConstants.setForeground( errSet, cc.getErrColor() );
                        StyleConstants.setFirstLineIndent( errSet, 0 );
                        js.errSet = errSet;
                    //@nonl
                    //@-node:zorcanda!.20051120203847:<<case statement>>
                    //@nl
                
                
                
                
                }
    
            
            }
        
            
        
        }
    
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051120203436:class JSColorConfigurationListener
    //@+node:zorcanda!.20051116144852:prompts
    public static class DefaultPrimaryPrompt extends PromptFormatter implements ColorConfigurationListener{
        
        ColoredToken ct1;
        ColoredToken ct2;
        SimpleAttributeSet ncolor;
        public DefaultPrimaryPrompt( ColorConfiguration cc ){
        
            super( cc );
            configure();
            cc.registerColorConfigurationListener( this ); 
        
        }
        
        private void configure(){
        
            ColorConfiguration cc = getColorConfiguration();
            SimpleAttributeSet sas = new SimpleAttributeSet();
            StyleConstants.setForeground( sas, cc.getPromptOneColor() );
            ct1 = new ColoredToken( "In [", sas );
            ct2 = new ColoredToken( "]: ", sas );
            ncolor = new SimpleAttributeSet();
            StyleConstants.setForeground( ncolor, cc.getPromptOneNumberColor() );    
        
        
        }
        
        public void colorChanged( ColorEvent ce ){
        
            switch( ce.getColorConstant() ){
            
                case Promptone:
                    configure();
                    break;
                case Promptonenumber:
                    configure();
                    break;
            
            
            }
        
        
        }
    
        public Iterator<ColoredToken> coloredPrompt( int linenumber ){
        
            String number = String.valueOf( linenumber );
            ArrayList<ColoredToken> al = new ArrayList<ColoredToken>( 3 );
            al.add( ct1 );
            ColoredToken ctnum = new ColoredToken( number, ncolor );
            al.add( ctnum );
            al.add( ct2 );
            return al.iterator();
        
        
        }
    
        public String getPrompt( int linenumber ){
            
            return String.format( "In [%1$d]: ", linenumber );
    
        }
        
    
    }
    
    public static class DefaultSecondaryPrompt extends PromptFormatter implements ColorConfigurationListener{
    
    
        ColoredToken ct1;
        java.util.List<ColoredToken> cprompts;
        public DefaultSecondaryPrompt( ColorConfiguration cc ){
        
            super( cc );
            configure();
            cc.registerColorConfigurationListener( this );
            
        }
        
        private void configure(){
            
            ColorConfiguration cc = getColorConfiguration();
            SimpleAttributeSet sas = new SimpleAttributeSet();
            StyleConstants.setForeground( sas, cc.getPromptTwoColor() );
            ct1 = new ColoredToken( "...: ", sas );
            cprompts = new ArrayList<ColoredToken>(1);
            cprompts.add( ct1 );        
        
        }
    
        public void colorChanged( ColorEvent ce ){
        
            switch( ce.getColorConstant() ){
            
                case Prompttwo:
                    configure();
                    break;
            
            }    
        
        
        } 
    
        public Iterator<ColoredToken> coloredPrompt( int linenumber ){
        
            return cprompts.iterator();
        
        
        }
    
    
        public String getPrompt( int linenumber ){
        
            return "...: ";
        
        }
        
        
    }
    
    
    public static class DefaultOutputPrompt extends PromptFormatter implements ColorConfigurationListener{
    
        ColoredToken ct1;
        ColoredToken ct2;
        SimpleAttributeSet ncolor;
        public DefaultOutputPrompt( ColorConfiguration cc ){
        
            super( cc );
            configure();
            cc.registerColorConfigurationListener( this ); 
        
        }
        
        private void configure(){
        
            ColorConfiguration cc = getColorConfiguration();
            SimpleAttributeSet sas = new SimpleAttributeSet();
            StyleConstants.setForeground( sas, cc.getOutPromptColor() );
            ct1 = new ColoredToken( "Out [", sas );
            ct2 = new ColoredToken( "]: ", sas );
            ncolor = new SimpleAttributeSet();
            StyleConstants.setForeground( ncolor, cc.getOutPromptNumberColor() );    
        
        
        
        }
    
        public void colorChanged( ColorEvent ce ){
        
            switch( ce.getColorConstant() ){
            
                case Outprompt:
                    configure();
                    break;
                case Outpromptnumber:
                    configure();
                    break;
            
            
            }    
            
        
        }
    
        public Iterator<ColoredToken> coloredPrompt( int linenumber ){
        
            String number = String.valueOf( linenumber );
            ArrayList<ColoredToken> al = new ArrayList<ColoredToken>( 3 );
            al.add( ct1 );
            ColoredToken ctnum = new ColoredToken( number, ncolor );
            al.add( ctnum );
            al.add( ct2 ); 
            return al.iterator();
        
        
        }
    
        public String getPrompt( int linenumber ){
    
            return String.format( "Out [%1$d]: ", linenumber );
           
        }
        
    
    }
    //@nonl
    //@-node:zorcanda!.20051116144852:prompts
    //@-others
    //@-node:zorcanda!.20051114092424.78:helper classes
    //@+node:zorcanda!.20051114092424.104:main
    public static final void main( final String[] args ){
    
        Runnable start = new Runnable(){
        
            public void run(){
                JythonShell js = new JythonShell();
                js.setVisible( true );
                JComponent base = js.getWidget();
                final JFrame jf = new JFrame();
                jf.add( base );
                jf.setDefaultCloseOperation( jf.DISPOSE_ON_CLOSE );
                jf.setTitle( "Jython Shell" );
                jf.setSize( new Dimension( 500, 500 ) );
                Callable close = new Callable(){
        
                    public Object call(){
            
                        jf.setVisible( false );
                        jf.dispose();
                        System.exit( 0 );
                        return null;
            
                    }
        
                };
                js.setCloser( close );
                if( args.length != 0 ){
        
                    String imagelocation = args[ 0 ];
                    ImageIcon ii = new ImageIcon( imagelocation );
                    js.setBackgroundImage( ii.getImage(), 1.0f );
    
                }
                jf.setVisible( true );
                
            }
        };
        System.setProperty( "swing.boldMetal", "false" );
        SwingUtilities.invokeLater( start );
    }
    //this is a demonstration of a Jython magic command, doesn't do anything useful
    private static String mockmcommand = "class z( MagicCommand ):\n"+
    "    def setJythonShell( self, js ):\n"+
    "        self.js = js\n"+
    "    def getName( self ): return '%fullscreen'\n"+
    "    def getDescription( self ): return '%fullscreen --> turns shell into fullscreen mode, this is not a core mc, but a demonstration of a Jython written magic command.'\n"+
    "    def handle( self, command ): return command.strip() == \"%fullscreen\"\n"+
    "    def doMagicCommand( self, command ):\n"+
    "        import java.awt as awt\n"+
    "        import javax.swing as swing\n"+
    "        import org.leo.shell.util.InsertPrompt as InsertPrompt\n"+
    "        ge = awt.GraphicsEnvironment.getLocalGraphicsEnvironment()\n"+
    "        gd = ge.getDefaultScreenDevice()\n"+
    "        if gd.isFullScreenSupported():\n"+
    "            window = swing.JWindow()\n"+
    "            window.add( self.js.getWidget() )\n"+
    "            #window.setIgnoreRepaint( True )\n"+
    "            gd.setFullScreenWindow( window )\n"+
    "            self.js.getShellComponent().requestFocus()\n"+
    "        else:\n"+
    "            print 'Full screen mode not supported\\\n'\n"+
    "        ip = InsertPrompt( self.js, False )\n"+
    "        swing.SwingUtilities.invokeLater( ip )\n";
    
    //@-node:zorcanda!.20051114092424.104:main
    //@-others






}




//@-node:zorcanda!.20051114092424.2:@thin JythonShell.java
//@-leo
