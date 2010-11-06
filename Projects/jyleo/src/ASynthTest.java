import javax.swing.*;
import javax.swing.text.*;
import javax.swing.plaf.synth.*;
import java.awt.*; 
import java.io.*;




public class ASynthTest{


/*
How To use Notes:
ASynthTest is invoked like so:
java ASynthTest

You can pass a filename as the first argument and it will use that as the synth file.  It uses
the Class.getResourceAsStream method to open the file, so make sure the file is on the Classpath.
By default the class looks for a file called 'testsynth.xml'.  If it cant find it, the file will
be created in the current working directory and populated with synth data.

To specify which type of JTextComponent you wish to use, pass a number following the file name( if
there is no special file to use, type 'pass' as the first argument.  A numeric argument determines the
type of JTextComponent to use( default is a JTextPane ):
0 - JTextPane
1 - JTextArea
2 - JTextField

Experiences on Linux:
1. When the background is set by Synth, overiding that value appears to have no effect.  The new
background color only shows through if a window is placed over the top of the frame and then moved
away.
2. Foreground color does seem to be changed.



*/
    public static void main( String[] args ){
    
        
        File test = new File( "testsynth.xml" );
        if( !test.exists() )
            createTestsynthFile();
            
        final String synthfile;
        if( args.length > 0 && !args[ 0 ].equals( "pass" ) )
            synthfile = '/' + args[ 0 ];
        else
            synthfile = "/testsynth.xml";
            
            
        final SynthLookAndFeel slaf = new SynthLookAndFeel();
        try{
            Class clzz = slaf.getClass();
            InputStream is = clzz.getResourceAsStream( synthfile );

            if( is == null ){
            
                String message = String.format( "Synth File: %s , could not be loaded", synthfile );
                throw new IllegalArgumentException( message );
         
         
            }
            slaf.load( is, clzz );
            UIManager.setLookAndFeel( slaf );
            
         }
         catch( Exception x ){
         
            x.printStackTrace();
            System.exit( 0 );
         
         
         }
    
        
        JFrame top = new JFrame();
        top.setTitle( "Synth and JTextComponent Test" );
        top.setDefaultCloseOperation( top.EXIT_ON_CLOSE );
        top.setSize( 400, 400 );
        
        //Set JTextComponent
        JTextComponent jtc;
        if( args.length > 1 ){
            
            String arg2 = args[ 1 ];
            int which = 0;
            try{
            
                which = Integer.valueOf( arg2 );
            
            
            }
            catch( NumberFormatException nfe ){
            
                nfe.printStackTrace();
                
            
            
            }
            switch( which ){
            
                case 0:
                  jtc = new JTextPane();
                  break;
                case 1:
                  jtc = new JTextArea();
                  break;
                case 2:
                  jtc = new JTextField();
                  break; 
                case 4:
                    jtc = new JTextPane2();
                    break;
                 
                default:
                  jtc = new JTextPane();
            
            
            
            }
        
        
        
        }
        else  jtc = new JTextPane();
        
        top.add( jtc );
        top.setVisible( true );
        
        System.out.println( "-----Outputing Synth set values-----" );
        String foreground = String.format( "Foreground color is %s", jtc.getForeground() );
        String background = String.format( "Background color is %s", jtc.getBackground() );
        String opaque = String.format( "Opaque value is %s", jtc.isOpaque() );
        for( String s: new String[]{ foreground, background, opaque } )
            System.out.println( s );
            
            
        jtc.setBackground( Color.BLUE );
        jtc.setForeground( Color.GREEN );
        jtc.setOpaque( true );
        
        System.out.println( "-----Outputing reset values-------" );
        foreground = String.format( "Foreground color is %s", jtc.getForeground() );
        background = String.format( "Background color is %s", jtc.getBackground() );
        opaque = String.format( "Opaque value is %s", jtc.isOpaque() );
        for( String s: new String[]{ foreground, background, opaque } )
            System.out.println( s );
        
    
    
    
    }


    private static void createTestsynthFile(){
    
        try{
            File tsf = new File( "testsynth.xml" );
            FileOutputStream fos = new FileOutputStream( tsf );
            PrintWriter pw  = new PrintWriter( fos );
            pw.println( getTestsynthData() );
            pw.close();
            System.out.println( String.format( "Created textsynth.xml in %s", tsf.getCanonicalPath() ) );
        }
        catch( Exception x ){
        
            x.printStackTrace();
            System.out.println( "Could not create testsynth.xml, moving on..." );
        
        
        }
    
    
    
    }
    
    private static String getTestsynthData(){
    
        String data ="<synth>\n"
        +"<style id='test'>\n"
        +"<state>\n"
        +"   <color value='RED' type='BACKGROUND' />\n"
        +"   <color value='BLUE' type='FOREGROUND' />\n"
        +"</state>\n"
        +"</style>\n"
        +"<bind style='test' type='region' key='TextPane' />\n"
        +"<bind style='test' type='region' key='TextArea' />\n"
        +"<bind style='test' type='region' key='TextField' />\n"
        +"</synth>";
    
        return data;
    
    
    
    }


    public static class JTextPane2 extends JTextPane{
    
        volatile int _background_changes = 1;
    
        public JTextPane2(){
        
            super();
           // _background_changes = 0;
        
        
        
        }
    
        public void setBackground( Color c ){
            
            System.out.println( "Color passed in is " + c );
            System.out.println( "-----Current BG Color Value is " + getBackground() );
        
            System.out.println( "----------This is Stack Trace-----------" );
            Thread.dumpStack(); 
            System.out.println( "----------This is End of Stack Trace---------" );
            super.setBackground( c );
            System.out.println( "-----Changed BG Color Value is " + getBackground() );
  
        
        }
    
    
    }



}