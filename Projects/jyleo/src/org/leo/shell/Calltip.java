//@+leo-ver=4-thin
//@+node:zorcanda!.20051115114601:@thin Calltip.java
//@@language java
package org.leo.shell;
import javax.swing.*;
import java.lang.reflect.*;
import javax.swing.text.*;
import java.util.*;
import java.awt.*;
import java.awt.event.*;
import org.python.core.*;


public class Calltip implements KeyListener,UtilityBoxListener{

    JythonShell js;
    PopupFactory pf;
    Popup pu;
    JTextPane _jtp;
    
    public Calltip( JythonShell js ){
    
        this.js = js;
        this._jtp = (JTextPane)js.getShellComponent();
        pf = PopupFactory.getSharedInstance();
        js.getShellComponent().addKeyListener( this );
        js.addUtilityBoxListener( this );
        
    }


    public final void keyPressed( final KeyEvent event ){
        final int kc = event.getKeyCode();
        if( kc == event.VK_BACK_SPACE && pu != null ){
            int cp = _jtp.getCaretPosition(); 
            if( cp  == js.outputspot ) event.consume();
            Document doc = _jtp.getDocument();
            try{
                String s = doc.getText( cp -1, 1 );
                if( s.equals( "(" ) && pu != null ){
                    hide();
                }
            }
            catch( BadLocationException ble ){}           
            return;
             
        }
        if( kc == event.VK_DELETE ) hide();
        if( kc == event.VK_ESCAPE ) hide();
        if( event.isConsumed() ) return;
        final char which = event.getKeyChar(); 
        if( which == '(' ) calltip(); 

    }


    public final void keyReleased( final KeyEvent event ){

        //event.consume();

    } 

    public final void keyTyped( final KeyEvent event ){

        //event.consume();

    } 

    //@    @+others
    //@+node:zorcanda!.20051115114727:calltip
    public void calltip(){
    
        if( pu != null ){
            
            pu.hide();
            pu = null;
            
        }
    
        int start = js.startOfLine();
        int end = _jtp.getCaretPosition();
        final Document doc = _jtp.getDocument();
        String txt = null;
        try{
            txt = doc.getText( start, end - start );
        }
        catch( BadLocationException ble ){ return; }
    
        final String split1[] = txt.split( "\\s" );
        String nxsplit = txt;
        if( split1.length > 0 )
            nxsplit = split1[ split1.length -1 ];
        final String[] split2 = nxsplit.split( "\\." );
        
        //final String nxsplit2 = nxsplit.substring( 0, nxsplit.length() -1 );
        StringBuilder sb = null;
        PyObject po1 = js.getPyObject( split2 );
        if( po1 == null ){
    
            return;
        
        };
        
        PyObject docobj = null;
        if( po1 instanceof PyMethod ){
            PyMethod pm = (PyMethod)po1;
            PyObject po2 = pm.im_func;
            //System.out.println( po2.getClass() );
            if( po2 instanceof PyFunction ){
                
                PyFunction pf = (PyFunction)po2;
                docobj = pm;
                sb = calltip_python( pf, true );
        
            }
            else if( po2 instanceof PyReflectedFunction ){
            
                PyReflectedFunction prf = (PyReflectedFunction)po2;
                sb = calltip_java( prf, split2 );
    
            }
        }
        else if( po1 instanceof PyReflectedFunction ){
        
            PyReflectedFunction prf = (PyReflectedFunction)po1;
            sb = calltip_java( prf, split2 );
        
        
        }
        else if( po1 instanceof PyFunction ){
        
            PyFunction pf = (PyFunction)po1;
            docobj = pf;
            sb = calltip_python( pf, false );
        
        
        }
        else if( po1 instanceof PyJavaClass ){
        
            PyJavaClass pjc = (PyJavaClass)po1;
            Class clazz = null;
            try{
                clazz = Class.forName( pjc.__name__ );
                //System.out.println( clazz );
            }
            catch( Exception x ){ return; }
            sb = calltip_jconstructor( clazz );
            
        
        
        }
        else if( po1 instanceof PyClass ){
        
            PyClass pc = (PyClass)po1;
            String[] split3 = new String[ split2.length + 1];
            System.arraycopy( split2, 0, split3, 0 , split2.length );
            split3[ split3.length -1 ] = "__init__";
            PyObject po3 = js.getPyObject( split3 );
            if( po3 instanceof PyMethod ){
                PyMethod pm = (PyMethod)po3;
                PyFunction po2 = (PyFunction)pm.im_func;
                sb = calltip_python( po2, true );
            }
            docobj = po1;
        
        }
        StringBuilder ds = null;
        if( docobj != null ){
            try{
                
                Object o = docobj.__findattr__( "__doc__" );
                if( o != null && o != Py.None ){
                    ds = new StringBuilder();
                    String docstring = o.toString();
                    ds.append( "'''" );
                    ds.append( docstring );
                    ds.append( "'''" );
                    if( !docstring.endsWith( "\n" ) && sb != null )  ds.append( '\n' );
                
                }
            }
            catch( Exception x ){}
        }
    
        
        if( ( sb != null && sb.length() != 0 ) || ( ds != null && ds.length() != 0 ) ){
            try{
            
                Rectangle r = _jtp.modelToView( _jtp.getCaretPosition() );
                JPanel jp = new JPanel();
                jp.setBackground( Color.WHITE );
                jp.setForeground( Color.BLACK );
                JTextPane jtp = new JTextPane();
                Document doc2 = jtp.getDocument();
                if( ds != null ){
                
                    SimpleAttributeSet sas = new SimpleAttributeSet();
                    StyleConstants.setForeground( sas, Color.GREEN );
                    doc2.insertString( 0, ds.toString(), sas );
            
            
                }
            
                if( sb != null ){
            
                    SimpleAttributeSet sas = new SimpleAttributeSet();
                    StyleConstants.setForeground( sas, Color.BLUE );
                    doc2.insertString( jtp.getCaretPosition(), sb.toString(), sas );
            
            
                }
                jtp.setEditable( false );
                jp.add( jtp );
                Point p = new Point( r.x, r.y );
                SwingUtilities.convertPointToScreen( p, _jtp );
                pu = pf.getPopup( _jtp, jp, p.x, p.y - jp.getPreferredSize().height );
                pu.show();
            }
            catch( BadLocationException ble ){}
            
        }
    
    
    }
    
    //@+others
    //@+node:zorcanda!.20051115114727.1:calltip_jconstructor
    public StringBuilder calltip_jconstructor( Class clazz ){
    
        Constructor[] cons = clazz.getConstructors();
        StringBuilder sb = new StringBuilder();
        
        for( Constructor m: cons ){ 
            
            String name = clazz.getSimpleName();
            Class[] params = m.getParameterTypes();
            sb.append( name ).append( "( " );
            for( Class c: params ){
        
                sb.append( c.getSimpleName() );
                sb.append( ", " );
        
            }
            if( params.length != 0 ){
                int li = sb.lastIndexOf( ", " );
                if( li != -1 )
                    sb.delete( li, li + 2 );
            }
            sb.append( ")" );
        
            Class[] exceptions = m.getExceptionTypes();
            if( exceptions.length > 0 ) sb.append( " throws " );
            for( Class c: exceptions ) sb.append( c.getSimpleName() ).append( ", " );
            if( exceptions.length > 0 ){
        
                int li = sb.lastIndexOf( ", " );
                if( li != -1 )
                    sb.delete( li, li + 2 );
        
            }
            sb.append( "\n" );
        
        }
        if( sb.length() > 0 )
            sb.deleteCharAt( sb.length() -1 );
        return sb;
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051115114727.1:calltip_jconstructor
    //@+node:zorcanda!.20051115114727.2:prettyPrintJavaMethod
    public String prettyPrintJavaMethod( Method m ){
    
    
        Class returntype = m.getReturnType();
        String name = m.getName();
        Class[] params = m.getParameterTypes();
        
        StringBuilder sb = new StringBuilder();
        sb.append( returntype.getSimpleName() ).append( " " );
        sb.append( name ).append( "( " );
        for( Class c: params ){
        
            sb.append( c.getSimpleName() );
            sb.append( ", " );
        
        }
        if( params.length != 0 ){
            int li = sb.lastIndexOf( ", " );
            if( li != -1 )
                sb.delete( li, li + 2 );
        }
        sb.append( ")" );
        
        Class[] exceptions = m.getExceptionTypes();
        if( exceptions.length > 0 ) sb.append( " throws " );
        for( Class c: exceptions ) sb.append( c.getSimpleName() ).append( ", " );
        if( exceptions.length > 0 ){
        
            int li = sb.lastIndexOf( ", " );
            if( li != -1 )
                sb.delete( li, li + 2 );
        
        }
        return sb.toString();
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051115114727.2:prettyPrintJavaMethod
    //@+node:zorcanda!.20051115114727.3:calltip_java
    public StringBuilder calltip_java( PyReflectedFunction prf, String[] split2 ){
        
        StringBuilder sb = new StringBuilder();
        String[] split3 = new String[ split2.length -1 ];
        System.arraycopy( split2, 0, split3, 0, split3.length );
        PyObject po3 = js.getPyObject( split3 );
        PyJavaClass pjc = null;
    
        if( po3 instanceof PyJavaInstance ){
            PyJavaInstance pji = (PyJavaInstance)po3;
            pjc = (PyJavaClass)pji.instclass;
        }
        else if( po3 instanceof PyJavaClass ){
        
            pjc = (PyJavaClass )po3;
        
        }
        else return null;
    
        Class clazz = null;
        try{
            clazz = Class.forName( pjc.__name__ );
            
        }
        catch( Exception x ){ return null; }
        Method[] ms = clazz.getMethods();
        java.util.List<Method> methods = new ArrayList<Method>();
        String methodname = split2[ split2.length -1 ];
        for( Method m: ms )if( m.getName().equals( methodname ) ) methods.add( m );
        sb = new StringBuilder();
        for( Method m: methods )
            sb.append( prettyPrintJavaMethod( m ) ).append( "\n" );
        if( sb.length() != 0 )
            sb.deleteCharAt( sb.length() -1 );
        return sb;
    
    }
    //@nonl
    //@-node:zorcanda!.20051115114727.3:calltip_java
    //@+node:zorcanda!.20051115114727.4:calltip_python
    public StringBuilder calltip_python( PyFunction pf, boolean ignoreself ){
    
        StringBuilder sb = new StringBuilder();
        //PyFunction pf = (PyFunction)po2;
        PyTableCode ptc = (PyTableCode)pf.func_code;
        boolean sargs = ptc.args;
        boolean skwords = ptc.keywords;
        int argcount = ptc.co_argcount;
        if( sargs ) argcount++;
        if( skwords ) argcount++;
        Map<Integer, StringBuilder> args = new HashMap< Integer, StringBuilder >();
        int id = 1;
        String[] varnames = null;
        if( ignoreself && ptc.co_varnames.length > 0 ){
            varnames = new String[ ptc.co_varnames.length -1 ];
            System.arraycopy( ptc.co_varnames, 1, varnames, 0, varnames.length );
            argcount--;
        
        }
        else varnames = ptc.co_varnames;
        for( String s: varnames ){
            if( argcount == 0 ) break;
            argcount--;
            args.put( id, new StringBuilder( s ) );
            id++;
                
        }
        id--;
                
        StringBuilder ksb = null;
        if( skwords ){
                
            ksb = args.get( id );
            ksb.insert( 0, "**" );
            args.remove( id );
            id--;
                    
        }
        StringBuilder asb = null;
        if( sargs ){
                
            asb = args.get( id );
            asb.insert( 0, "*" );
            args.remove( id );
            id--;            
            
        }
                
        java.util.List<StringBuilder> defaults = new ArrayList<StringBuilder>();
        if( pf.func_defaults != null ){
                
            java.util.List df = Arrays.asList( pf.func_defaults );
            Collections.reverse( df );
            for( Object o: df ){
                    
                StringBuilder sb2 = args.get( id );
                sb2.append( "=" ).append( o.toString() );
                args.remove( id );
                id--;  
                defaults.add( sb2 );
                    
            }
                
                
        }
        Collections.reverse( defaults );
                
        boolean preceding = false;
        sb.append( pf.__name__ );
        sb.append( "-> " );
        sb.append( "( " );
        int size = args.size();
        for( int z = 1; z <= size; z ++ ){
            preceding = true;
            StringBuilder param = args.get( z );
            sb.append( param );
            if( z != size )
                sb.append( ", " );
                
                
        }
                
        if( defaults.size() > 0 )
            
            sb.append( ", " );
            for( int z = 0; z <= defaults.size() -1 ; z ++ ){
                preceding = true;
                StringBuilder def = defaults.get( z );
                sb.append( def );
                if( z != defaults.size() -1 ) sb.append( ", " );
                
                
            }
        if( asb != null ){
                
            if( preceding )
                sb.append( ", " );
            sb.append( asb );
            preceding = true;
                
        }
                
        if( ksb != null ){
                    
            if( preceding )
                sb.append( ", " );
            sb.append( ksb );
                
                
        }
        sb.append( " )" );
        return sb;
    
    }
    //@nonl
    //@-node:zorcanda!.20051115114727.4:calltip_python
    //@-others
    //@nonl
    //@-node:zorcanda!.20051115114727:calltip
    //@+node:zorcanda!.20051115115833:hide
    public void hide(){
    
        if( pu != null ){
        
            pu.hide();
            pu = null;
        
        
        }
    
    
    
    }
    
    public boolean isShowing(){
    
        return pu != null;
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051115115833:hide
    //@+node:zorcanda!.20051128185812:utilityBoxListener
    public void utilityBoxShown( UtilityBoxEvent ube ){
    
    
    
    
    }
    
    public void utilityBoxClose( UtilityBoxEvent ube ){
    
        hide();
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051128185812:utilityBoxListener
    //@-others

}
//@nonl
//@-node:zorcanda!.20051115114601:@thin Calltip.java
//@-leo
