//@+leo-ver=4-thin
//@+node:zorcanda!.20050314160546:@thin EditorBackgroundMovie.java
//@@language java
import javax.swing.*;
import javax.media.*;
import javax.media.format.*;
import javax.media.control.*;
import javax.media.protocol.*;
import javax.media.bean.playerbean.*;
import java.awt.*;
import java.net.*;
import java.io.*;
import java.util.List;
import java.util.LinkedList;


public final class EditorBackgroundMovie extends JPanel implements ControllerListener{

    Player p;
    MediaPlayer mp;
    GridBagConstraints gbc;
    GridBagLayout gbl;
    final JPanel background;
    final java.util.List< JMenuBar > menus; 
    boolean loadok;
    boolean realized;
    
    
    public static void main( String[] args ){
    
        JFrame jf = new JFrame();
        JPanel jp = new JPanel();
        jf.add( jp );
        EditorBackgroundMovie ebm = new EditorBackgroundMovie( args[ 0 ], jp );
        jf.pack();
        jf.setVisible( true );
    
    
    }
    
    public EditorBackgroundMovie( final String moviepath, final JPanel parent ){
    
        super();
        menus = new LinkedList< JMenuBar>();
        background = parent;
        try{
        
            //background = parent;
            Manager.setHint( Manager.LIGHTWEIGHT_RENDERER, Boolean.TRUE );
            Manager.setHint( Manager.CACHING, Boolean.TRUE );
            gbl = new GridBagLayout();
            parent.setLayout( gbl );
            gbc = new GridBagConstraints();
            gbc.weightx = 1;
            gbc.weighty = 1;
            gbc.fill = 1;
            File f = new File( moviepath );
            if( f.exists() ){
                DataSource ds = Manager.createDataSource( f.toURL() );
                p = Manager.createPlayer( ds );
                mp = new MediaPlayer();
                mp.setPlayer( p );
                mp.setPlaybackLoop( true );
                mp.setFixedAspectRatio( false );
                //mp.setControlPanelVisible( true );
                
                mp.addControllerListener( this );
                mp.realize();
                loadok = true;
                
            }
        
        }
        catch( Exception x ){
            x.printStackTrace();
            loadok = false;
        }
    
    }


    public final void stop(){
    
        mp.stop();
    
    } 
    
    
    public final void start(){
        mp.setPlaybackLoop( true );
        mp.start();
    
    }
    
    public final boolean isRunning(){
    
        final int state = mp.getState();
        if( state == mp.Started ) return true;
        return false;
    
    
    }
    
    public final boolean loadOk(){
    
    
        return loadok;
    
    }
    
    public final void setVolume( final String volume ){
    
        final String oldlevel = mp.getVolumeLevel();
        try{
            mp.setVolumeLevel( volume );
            }
        catch( Exception x ){
        
            mp.setVolumeLevel( oldlevel );
        
        }
        
    
    }
    
    public final int getVolume(){
    
        String vl = mp.getVolumeLevel();
        if( vl == null ) vl = "0";
        return Integer.valueOf( vl ).intValue();
    
    
    
    }
    
    public Component getControlPanelComponent(){
    
    
        return mp.getControlPanelComponent();
    
    
    }
    
    public final void addControllerToMenu( JMenuBar j ){
    
        if( realized )
            j.add( mp.getControlPanelComponent() );
        else
            menus.add( j );
    
    
    }

     public final void controllerUpdate( ControllerEvent e ){
    
    
        if( e instanceof RealizeCompleteEvent ){
        
            Component c = mp.getVisualComponent();
            gbl.setConstraints( c, gbc );
            background.add( c );
            mp.start();
            Component cpc = mp.getControlPanelComponent();
            realized = true;
            for( JMenuBar j: menus )
                j.add( cpc );
        
        
        }
    
    
    
    
    }

 


}
//@-node:zorcanda!.20050314160546:@thin EditorBackgroundMovie.java
//@-leo
