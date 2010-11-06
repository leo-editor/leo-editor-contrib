//@+leo-ver=4-thin
//@+node:zorcanda!.20051115104433:@thin Autocompleter.java
//@@language java
package org.leo.shell;

import org.leo.shell.color.ColorConfiguration;
import javax.swing.*;
import javax.swing.text.*;
import java.util.*;
import java.awt.*;
import java.awt.event.*;
import org.python.core.*;

public class Autocompleter implements KeyListener, UtilityBoxListener, Documentation{

    JTextPane _jtp;
    JList _autocompleter;
    Popup pu2;
    PopupFactory pf;
    JythonShell js;
    
    public Autocompleter( JythonShell js, JTextPane _jtp ){
    
        this.js = js;
        this._jtp = _jtp;
        pf = PopupFactory.getSharedInstance();
        js.getShellComponent().addKeyListener( this );
        js.addUtilityBoxListener( this );
        js.addInteractiveDocumentation( this );
    
    }
    
    public String getDocumentation(){
    
        return "Autocompletion:\n"+
        "Upon typing '.' the JythonShell will scan the object for attributes and "+
        "methods.  Upon finding these items a popup will appear allowing the user to select "+
        "items for completion.  To navigate the box, use the up and down arrow keys.  To choose a "+
        "completeion, press Tab.  To dismiss, press Esc\n";
    
    
    }

    public final void keyPressed( final KeyEvent event ){

        //@        <<keymanipulation>>
        //@+node:zorcanda!.20051115105044:<<key manipulation>>
        final char which = event.getKeyChar();
        final int kc = event.getKeyCode();
        String opmodifiers = event.getKeyModifiersText( event.getModifiers() );
        if( _autocompleter != null ){
            
            if( event.VK_SHIFT == kc ) return;
            if( event.VK_TAB == kc ){
                
                try{
                    
                    event.consume();
                    final String val = (String)_autocompleter.getSelectedValue();
                    pu2.hide();
                    _autocompleter = null;
                    final Document doc = _jtp.getDocument();
                    final String line = doc.getText( js.outputspot, _jtp.getCaretPosition() - js.outputspot );
                    final String[] tokens = line.split( "\\." );
                    if( tokens.length > 1 && !line.endsWith( "." )){
                        
                        final int tk_len = tokens[ tokens.length - 1 ].length();
                        int end = js.endOfLine();
                        doc.remove( end - tk_len, tk_len );
                        end = js.endOfLine();
                        _jtp.setCaretPosition( end );
                            
                    }
                    doc.insertString( _jtp.getCaretPosition(), val, null );
                    return;
                    
                }
                catch( final Exception x ){
                    x.printStackTrace();
                    
                }
                
            }
            else if( event.VK_UP == kc || event.VK_DOWN == kc ){
                
                event.consume();
                int index = _autocompleter.getSelectedIndex();
                if( event.VK_UP == kc ) index--;
                else index++;
                _autocompleter.setSelectedIndex( index );
                _autocompleter.ensureIndexIsVisible( index );
                return;
                
                
                
            }
                
            try{
                    
                if( !Character.isLetterOrDigit( which ) && event.VK_BACK_SPACE != kc && which != '_' ){
                    
                    //background.remove( _ac_frame );
                    pu2.hide();
                    _autocompleter = null;
                    pu2 = null;
                    //background.revalidate();  
                    
                }
                else{
                    
                        
                    String line = js.get_input( _jtp.getCaretPosition() ) + which;
                    final String[] tokens = line.split( "\\.");
                        
                    if( tokens.length >= 2 ){
                
                        final String token = tokens[ tokens.length -1 ];
                        final int next = _autocompleter.getNextMatch( token, 0, Position.Bias.Forward );
                        if( next != -1 ){
                        
                            _autocompleter.setSelectedIndex( next );
                            _autocompleter.ensureIndexIsVisible( next );
                            
                        }
                        
                
                    
                    
                        }
                    
                    }
                }
                    
                catch( Exception x ){
                    x.printStackTrace();
        
                
                }
            
            
        }
        if( kc == event.VK_ESCAPE ) hide(); 
        if( which == '.' ) autocomplete(); 
        //@nonl
        //@-node:zorcanda!.20051115105044:<<key manipulation>>
        //@nl

    }


    
    public final void keyReleased( final KeyEvent event ){

        //event.consume();

    }

    public final void keyTyped( final KeyEvent event ){

        //event.consume(); 


    }

    //@    @+others
    //@+node:zorcanda!.20051115105044.1:showAutocompleter
    public final void showAutocompleter( final Vector<String> v ){
    
        Collections.sort( v );
        int cpos = _jtp.getCaretPosition();
        Rectangle vpos = null;
        try{
        
            vpos = _jtp.modelToView( cpos );  
        
        }
        catch( Exception x ){
            
            x.printStackTrace();
            return;
        
        
        }
        if( vpos == null ) return;
        Iterator<String> si = v.iterator();
        while( si.hasNext() ){
        
            String s = si.next();
            if( s.trim().equals( "" ) ) si.remove(); // if we don't purge bad values, the list has a terrible visual appearance.
        
        
        }
        final JList jl = new JList( v );
        ColorConfiguration cc = js.getColorConfiguration();
        jl.setForeground( cc.getForegroundColor() );//js._fg );
        jl.setBackground( cc.getBackgroundColor() ); //js._bg );
        jl.addListSelectionListener( js._lsl );
        jl.setSelectedIndex( 0 );
        jl.setLayoutOrientation( JList.VERTICAL );
        final JScrollPane jsp = new JScrollPane( jl );
        if( v.size() >= 5 ){
            jl.setVisibleRowCount( 5 );
        
        }
        else
            jl.setVisibleRowCount( v.size() );
    
        Dimension jlsize =  jl.getPreferredScrollableViewportSize();
        JScrollBar jsb = jsp.getVerticalScrollBar();
        Dimension jsbsize = jsb.getPreferredSize();
        jlsize.width = jlsize.width + jsbsize.width;
        jsp.setPreferredSize( jlsize ); 
        jsp.setMinimumSize( jlsize );
        jsp.setHorizontalScrollBarPolicy( jsp.HORIZONTAL_SCROLLBAR_NEVER );
        Dimension jsps = jsp.getPreferredSize();
    
        Point p = new Point( vpos.x, vpos.y );
        SwingUtilities.convertPointToScreen( p, _jtp );
        Rectangle vrect = js._jsp.getViewport().getVisibleRect();
        Point p2 = new Point( vrect.x + vrect.width, vrect.y + vrect.height );
        SwingUtilities.convertPointToScreen( p2, js._jsp.getViewport() );
        if( p.y < p2.y/2 ){
            pu2 = pf.getPopup( _jtp, jsp, p.x , p.y + vpos.height  );
        
        }
        else{
            pu2 = pf.getPopup( _jtp, jsp, p.x, p.y - jsps.height );
            
        }
        pu2.show();
        _autocompleter = jl;
        //_ac_frame = jp;
    
    }
    
    
    //@-node:zorcanda!.20051115105044.1:showAutocompleter
    //@+node:zorcanda!.20051115105044.2:autocomplete
    public final void autocomplete(){
    
    
        try{
        
        int start = js.startOfLine();
        int end = _jtp.getCaretPosition();
        final Document doc = _jtp.getDocument();
        String txt = doc.getText( start, end - start );
        
    
        final String split1[] = txt.split( "\\s" );
        String nxsplit = txt;
        if( split1.length > 0 )
            nxsplit = split1[ split1.length -1 ];
        final String[] split2 = nxsplit.split( "\\." );
        
        final String nxsplit2 = nxsplit.substring( 0, nxsplit.length() -1 );
        
        PyObject po1 = js.getPyObject( split2 );
        
        //err.reset();
        //out.reset();
        if( po1 == null ) return;
        PyList pl = (PyList)po1.__dir__();
        
        //LinkedHashSet<String> lhs = new LinkedHashSet();
        //Vector< String > atts = getAttributes( po1 ).get( "Attribute" );
        //Vector< String > fields = getFields( po1 ).get( "Field" );
        //Vector< String > methods = getMethods( po1 ).get( "Method" );
    
        
        //lhs.addAll( atts );
        //lhs.addAll( fields );
        //lhs.addAll( methods );
        
        
        
        final Vector< String > v = new Vector<String>();
        for( Object o: pl.toArray() )
            v.add( (String)o );
        
        //out.reset();
        //err.reset();
        //System.out.println( v );
        if( v.size() != 0 ) showAutocompleter( v );
        
        
        }
        
        
        
        catch( Exception x ){
        
            x.printStackTrace();
        
        }
    
    
    }
    
    
    
    //@-node:zorcanda!.20051115105044.2:autocomplete
    //@+node:zorcanda!.20051115120438:hide
    public void hide(){
    
        if( pu2 != null ){
        
            pu2.hide();
            pu2 = null;
            _autocompleter = null;
        
        }
    
    
    
    }
    
    public boolean isShowing(){
    
        return pu2 != null;
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051115120438:hide
    //@+node:zorcanda!.20051128185733:utilityBoxListener
    public void utilityBoxShown( UtilityBoxEvent ube ){
    
    
    
    
    }
    
    public void utilityBoxClose( UtilityBoxEvent ube ){
    
        hide();
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051128185733:utilityBoxListener
    //@-others

}
//@nonl
//@-node:zorcanda!.20051115104433:@thin Autocompleter.java
//@-leo
