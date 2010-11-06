#@+leo-ver=4-thin
#@+node:zorcanda!.20050401111120:@thin leoSwingHTMLView.py
import htmllib
import formatter
import javax.swing as swing
import java
import urllib

ACTIVATED = swing.event.HyperlinkEvent.EventType.ACTIVATED
ENTERED = swing.event.HyperlinkEvent.EventType.ENTERED
EXITED = swing.event.HyperlinkEvent.EventType.EXITED

class HtmlBrowserWindow( swing.JFrame ):
    
    def __init__( self, urlString="" ):
        swing.JFrame.__init__( self, title = "HTML Browser", size = ( 800, 600 ) )
        self.contentPane.layout = java.awt.BorderLayout()
        self.contentPane.add( self.buildTopPane( urlString ), java.awt.BorderLayout.NORTH )
        self.htmlPane = swing.JEditorPane( "text/html", "" , editable = 0, hyperlinkUpdate = self.followHyperlink,
                        size = (400, 400 ) )
        self.contentPane.add( swing.JScrollPane( self.htmlPane ), java.awt.BorderLayout.CENTER )
        self.status = swing.JLabel( " ", preferredSize=(500,20) )
        self.contentPane.add( self.status, java.awt.BorderLayout.SOUTH )
        print self.htmlPane.getContentType()
        print self.htmlPane.getDocument()
        
    def buildTopPane( self, startUrl ):
        label = swing.JLabel( "Go To" )
        self.field = swing.JTextField( preferredSize = (500, 20 ),
                    text=startUrl, actionPerformed=self.goToUrl )
        button = swing.JButton( "Go", size=(100,100),
                            actionPerformed=self.goToUrl )
        topPane = swing.JPanel()
        topPane.add( label )
        topPane.add( self.field )
        topPane.add( button )
        return topPane
        
    def goToUrl( self, event ):
        self.htmlPane.setPage( self.field.text )
        doc = self.htmlPane.getDocument()
        print doc.getStyleSheet()
        
    def followHyperlink( self, hlEvent ):
        if hlEvent.eventType == ACTIVATED:
                self.htmlPane.setPage( hlEvent.URL )
        elif hlEvent.eventType == ENTERED:
                self.status.text = hlEvent.URL.toString()
        elif hlEvent.eventType == EXITED:
            self.status.text = " "
    
    #@    @+others
    #@+node:zorcanda!.20050401112440.2:viewNodeAsHtml
    def viewNodeAsHtml( self, c ):
        
        #c = self.c
        cp = c.currentPosition()
        
        at = c.atFileCommands 
    
        at.write(cp.copy(),nosentinels=True,toString=True,scriptWrite=True)
    
        data = at.stringOutput 
        self.htmlPane.setText( data )
        self.show()
    
    #@-node:zorcanda!.20050401112440.2:viewNodeAsHtml
    #@-others
        
if __name__== "__main__":
        import sys
        print sys.argv[ 1 ]
        HtmlBrowserWindow( sys.argv[ 1 ] ).show()
        
#@nonl
#@-node:zorcanda!.20050401111120:@thin leoSwingHTMLView.py
#@-leo
