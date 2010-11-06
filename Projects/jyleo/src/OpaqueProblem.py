import javax.swing as swing
import java.awt as awt
import sys


if __name__ == "__main__": 
    
    if len( sys.argv ) > 1:
        uim = swing.UIManager
        nlf = uim.getSystemLookAndFeelClassName()
        uim.setLookAndFeel( nlf )
    else:
        pass
        
        
    jf = swing.JFrame()
    cp1 = jf.contentPane
    cp1.setBackground( awt.Color.RED )
    cp = swing.JPanel( awt.GridLayout( 2, 2 ))
    cp.setOpaque( 0) 
    cp1.add( cp )
    jt = swing.JTree()
    jt.setOpaque( 0 )
    cp.add( jt )
    jta = swing.JTextArea()
    jta.setText( "JTextArea" )
    jta.setOpaque( 0 )
    cp.add( jta )
    jtp = swing.JTextPane()
    jtp.setText( "JTextPane" )
    jtp.setOpaque( 0 )
    cp.add( jtp )
    jb = swing.JButton( "See Me" )
    jb.setOpaque( 0 )
    cp.add( jb )
    jf.pack()
    jf.visible = 1
    
