//@+leo-ver=4-thin
//@+node:zorcanda!.20050322160447:@thin leoRadialMenu.java
//@@language java

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.awt.geom.*;

public class leoRadialMenu extends JPanel{

    JComponent parent;
    Mouser mouser;
    //@    @+others
    //@+node:zorcanda!.20050322160447.1:constructor
    public leoRadialMenu( JComponent parent ){
    
        super();
        setOpaque( false );
        this.parent = parent;
        mouser = new Mouser( this );
        parent.addMouseListener( mouser );
        setSize( 400, 400 );
        add( new RadialControl( "MOUSE" ) );
        //setSize( 400, 400 );
        
        
    }
    //@nonl
    //@-node:zorcanda!.20050322160447.1:constructor
    //@+node:zorcanda!.20050322162213:popup
    public void popup( int x, int y){
    
        Container tla = parent.getTopLevelAncestor();
        System.out.println( tla );
        JFrame jf = (JFrame)tla;
        JLayeredPane jlp = jf.getLayeredPane();
        jlp.add( this, JLayeredPane.POPUP_LAYER );
        this.setLocation( x, y );
        jlp.moveToFront( this );
    
    }
    
    
    //@-node:zorcanda!.20050322162213:popup
    //@+node:zorcanda!.20050322162145:class mouser
    private class Mouser extends MouseAdapter{
    
    leoRadialMenu parent;
    
    public Mouser( leoRadialMenu parent ){
    
        this.parent = parent;
    
    
    
    }
    
    
    public void mousePressed( MouseEvent mE ){
    
        Component source = mE.getComponent();
        Container tla = parent.getTopLevelAncestor();
        MouseEvent mE2 = SwingUtilities.convertMouseEvent( source, mE, tla );
        parent.popup( mE2.getX(), mE2.getY());
    
    
    }
    
    
    
    
    }
    //@-node:zorcanda!.20050322162145:class mouser
    //@+node:zorcanda!.20050323114117:class RadialControl
    class RadialControl extends JComponent{
    
    
        private String _text;
        public RadialControl( String text ){
            super();
            _text = text;
            setSize( 200, 200 );
            setPreferredSize( new Dimension( 200, 200 ) );
        
        }
    
        //@    @+others
        //@+node:zorcanda!.20050323114117.1:paint
        public void paint( Graphics g ){
        
            Graphics2D g2 = (Graphics2D)g;
            System.out.println( g.getClip() );
            FontMetrics fm = g.getFontMetrics();
            g2.setColor( Color.RED );
            int width = SwingUtilities.computeStringWidth( fm, _text );
            Ellipse2D.Double e2d = new Ellipse2D.Double( 0, 0, width, width );
            PathIterator pi = e2d.getPathIterator( null );
            double[] points = new double[ 6 ];
            while( !pi.isDone() ){
            
                System.out.println( pi.currentSegment( points ) );
                String data = String.format( "Spot %e, %e, (x,y )   %e, %e ( h,w )", points[ 0 ], points[ 1 ], points[ 2 ], points[ 3 ] );
                System.out.println( data );
                pi.next();
            
            }
            g2.draw( e2d );
            g2.drawString( _text, 0, width/2 );
            System.out.println( "PAINTING!!!" );
        
        
        
        
        }
        //@-node:zorcanda!.20050323114117.1:paint
        //@-others
    
    
    
    
    
    }
    //@nonl
    //@-node:zorcanda!.20050323114117:class RadialControl
    //@-others









}
//@-node:zorcanda!.20050322160447:@thin leoRadialMenu.java
//@-leo
