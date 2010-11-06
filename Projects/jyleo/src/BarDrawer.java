//@+leo-ver=4-thin
//@+node:orkman.20050211155354:@thin BarDrawer.java
//@@language java
import java.awt.*;
import javax.swing.*;
import javax.swing.event.*;    
import javax.swing.text.*;
import java.util.*;
import java.util.concurrent.*;  


public final class BarDrawer implements Runnable, ChangeListener{


    final JLayeredPane _jlp;
    final JTextPane _jtp;
    final Color _bg;
    Rectangle _lastcoords, _oldcoords, _editor_rec;
    final ConcurrentLinkedQueue<Rectangle> _painter;
    
    public BarDrawer( final JLayeredPane jlp, final JTextPane jtp ){
    
        _jlp = jlp;
        _jtp = jtp;
        
        int ti = java.lang.Integer.decode( "#FFFFC6" );
        Color c = new Color( ti );
        _bg = new Color( c.getRed(), c.getGreen(), c.getBlue(), 50 ); 
        
        _lastcoords = null;
        _oldcoords = null;  
        _editor_rec = null;
        _painter = new ConcurrentLinkedQueue< Rectangle >();
    
    }
    
    public void run(){
    
        try{
        
        _jtp.paintImmediately( _painter.poll() );            
        final Graphics2D g = (Graphics2D)_jlp.getGraphics();
        g.setRenderingHint( RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_SPEED );
        g.setRenderingHint( RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_DISABLE );
        g.setColor( _bg );
        //final Rectangle rect = _painter.poll();
        g.fill( _painter.poll() );

        }
        catch( Exception x ){
        
            //not sure what to do at this point, not a critical error.
        
        }
       
    
    }
    
    public void stateChanged( final ChangeEvent ce ){
            
        try{

            
            final int pos = _jtp.getCaretPosition();
            final int start = Utilities.getRowStart( _jtp , pos );
            _oldcoords = _editor_rec;
            _editor_rec = _jtp.modelToView( start );

            final Rectangle lpane_rec = SwingUtilities.convertRectangle( _jtp, _editor_rec, _jlp );
            final Dimension size = _jtp.getPreferredSize();
            _lastcoords = new Rectangle( lpane_rec.x , lpane_rec.y, size.width, lpane_rec.height );
            
            if( _oldcoords != null )
                _oldcoords.width = _lastcoords.width; //the oldcords need to be reset so the whole line will be redrawn.
                _painter.offer( _oldcoords );
                _painter.offer( _lastcoords );
                EventQueue.invokeLater( this );
                  
            
        }
        catch( Exception x ){}  
    
    
    
    
    }



}
//@-node:orkman.20050211155354:@thin BarDrawer.java
//@-leo
