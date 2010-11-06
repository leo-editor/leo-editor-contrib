#@+leo-ver=4-thin
#@+node:zorcanda!.20051117160341:@thin ComboBoxTest.py
import javax.swing as swing
import java.util as util
import sys
print sys.argv
print __name__
print globals()
print locals()

jf = swing.JFrame()
d = [ 'mooo', 'maaa', 'meee', 'yoooo' ]
v = util.Vector( d )
jcb = swing.JComboBox( v )
jcb.setEditable( 1 )
jf.add( jcb )

class aa( swing.AbstractAction ):
    def __init__( self ):
        swing.AbstractAction.__init__( self )
        self.count = 1
        
    def actionPerformed( self, event ):
        print self.count
        print event.getID()
        print event.getSource()
        self.count += 1
        print "-" * 5
        print event
        

jcb.addActionListener( aa() )

jf.visible = 1
#@nonl
#@-node:zorcanda!.20051117160341:@thin ComboBoxTest.py
#@-leo
