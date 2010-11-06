#@+leo-ver=4-thin
#@+node:zorcanda!.20060110141749:@thin KTableMaker.py
import javax.swing as swing
import java.awt as awt
import java.awt.event as aevent
import java

jf = swing.JFrame()
jtp = swing.JTextPane()
jf.add(jtp)

items = {}

class listener(aevent.KeyAdapter):
    
    def __init__( self ):
        aevent.KeyAdapter.__init__(self)
        
    def keyPressed(self, event):
        
        kcode = event.getKeyCode()
        ktext = event.getKeyText(kcode)
        char = event.getKeyChar()
        if( event.isShiftDown() ):
            ktext = "shift %s" % ktext
        ktext = ktext.lower()
        items[ ktext ] = char
        
jtp.addKeyListener( listener())

jb = swing.JButton( "Close")
jf.add( jb, awt.BorderLayout.SOUTH)
def dooit(event):
    f = open( "table.txt", "w")
    for z in items.keys():
        print z
        f.write( "'%s':'%s'\n" % ( z, items[z] ) )
    f.close()
    java.lang.System.exit(0)

jb.actionPerformed = dooit
jf.pack()
jf.visible = 1
        
#@nonl
#@-node:zorcanda!.20060110141749:@thin KTableMaker.py
#@-leo
