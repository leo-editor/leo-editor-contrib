#@+leo-ver=4-thin
#@+node:zorcanda!.20051008203717:@thin LeoWebBrowser.py
#@<<what is the LeoWebBrowser?>>
#@+node:zorcanda!.20051211101535:<<what is the LeoWebBrowser?>>
"""The LeoWebBrowser is a simple plugin that embeds a systems native web browser
into jyleo.  Actually simple needs to be qualified: the user needs to set it up so
Java can run the jdic WebBrowser component.  I have put notes in the source about how I got it to work on
my Linux machine, the user may have an easier time if their OS is more modern than mine.
Google for JDIC and download the appropiate package for your operating system."""
#@-node:zorcanda!.20051211101535:<<what is the LeoWebBrowser?>>
#@nl

import javax.swing as swing
import leoGlobals as g
import java
import java.awt as awt
import java.net as net
from utilities.CutCopyPaste import CutCopyPaste
import org.jdesktop.jdic.browser as browser
import leoNodes

class LeoWebBrowser( browser.WebBrowserListener ):
    
    def __init__( self, c ):
        self.c = c
        self.browser = browser.WebBrowser()
        self.base = swing.JPanel( java.awt.BorderLayout() )
        self.base.add( self.browser )
        bf = swing.JToolBar()
        path = g.os_path_join( g.app.loadDir,"..","Icons/webbrowser", "left.png" )
        ii = swing.ImageIcon( path )
        self.bbutton = back = swing.JButton( ii )
        back.setText( "Back" )
        back.setHorizontalTextPosition( swing.SwingConstants.CENTER )
        back.setVerticalTextPosition( swing.SwingConstants.BOTTOM )
        back.actionPerformed = lambda event : self.back()
        bf.add( back )
        path = g.os_path_join( g.app.loadDir,"..","Icons/webbrowser", "right.png" )
        ii = swing.ImageIcon( path )
        self.fbutton = forward = swing.JButton( ii )
        forward.setText( "Forward" )
        forward.setHorizontalTextPosition( swing.SwingConstants.CENTER )
        forward.setVerticalTextPosition( swing.SwingConstants.BOTTOM )
        forward.actionPerformed = lambda event: self.forward()
        bf.add( forward )
        path = g.os_path_join( g.app.loadDir,"..","Icons/webbrowser", "reload.png" )
        ii = swing.ImageIcon( path )
        refresh = swing.JButton( ii )
        refresh.setText( "Reload" )
        refresh.setHorizontalTextPosition( swing.SwingConstants.CENTER )
        refresh.setVerticalTextPosition( swing.SwingConstants.BOTTOM )
        refresh.actionPerformed = lambda event: self.browser.refresh()
        bf.add( refresh )
        self.base.add( bf, java.awt.BorderLayout.NORTH )
        jp2 = swing.JPanel( java.awt.BorderLayout())
        self.jtf = swing.JTextField()
        CutCopyPaste( self.jtf )
        jp2.add( self.jtf )
        path = g.os_path_join( g.app.loadDir,"..","Icons", "do-it.gif" )
        ii = swing.ImageIcon( path )
        self.jb = swing.JButton( ii )
        self.jb.actionPerformed = self.go
        jp2.add( self.jb, java.awt.BorderLayout.EAST )
        jp3 = swing.JPanel( java.awt.GridLayout( 2, 1 ) )
        jp3.add( jp2 )
        jp4 = swing.JPanel()
        headline = swing.JButton( "Goto Headline" )
        headline.actionPerformed = self.goToHeadline
        jp4.add( headline )
        store = swing.JButton( "Store Page In Node" )
        store.actionPerformed = self.storePage
        jp4.add( store )
        feed = swing.JButton( "Feed Tree To Browser" )
        feed.actionPerformed = self.feedNodesBodyContents
        jp4.add( feed )
        jp3.add( jp4 )
        self.base.add( jp3, java.awt.BorderLayout.SOUTH )
        self.history = []
        self.historypointer = -1
        self.ignore = 0
        self.enableButtons()
        self.browser.addWebBrowserListener( self )
    
    def enableButtons( self ):
        
        if self.historypointer > 0:
            self.bbutton.setEnabled( True )
            item = self.history[ self.historypointer - 1 ] 
            if item.__class__ == leoNodes.position: text = item.headString()
            else: text = str( item )
            self.bbutton.setToolTipText( text )
        else:
            self.bbutton.setEnabled( False )
            self.bbutton.setToolTipText( "" )
        
        if self.historypointer >= 0 and self.historypointer < len( self.history ) -1:
            self.fbutton.setEnabled( True )
            item = self.history[ self.historypointer + 1 ]
            if item.__class__ == leoNodes.position: text = item.headString()
            else: text = str( item )
            self.fbutton.setToolTipText( text )
        else:
            self.fbutton.setEnabled( False )
            self.fbutton.setToolTipText( "" )
    
    def forward( self ):
        
        if self.historypointer == len( self.history ) -1 : return
        else:
            self.historypointer += 1
            item = self.history[ self.historypointer ]
            if item.__class__ == leoNodes.position:
                content = self.writeContent( item )
                self.browser.setContent( content )
                self.enableButtons()
            else:
                self.ignore = 1
                self.browser.setURL( item )
    
    
    
    def back( self ):
        
        if self.historypointer < 1: return
        else:
            self.historypointer -= 1
            item = self.history[ self.historypointer ]
            if item.__class__ == leoNodes.position:
                content = self.writeContent( item )
                self.browser.setContent( content )
                self.enableButtons()
            else:
                self.ignore = 1
                self.browser.setURL( item )
    
    def writeContent( self, position ):
        
        c = self.c
        at = c.atFileCommands 
        c.fileCommands.assignFileIndices() #We appear to have to do this or the nodes won't have file Indices and an exception is thrown
        at.write( position.copy(),nosentinels=True,toString=True,scriptWrite=True)
        data = at.stringOutput 
        return data
    
    def go( self, event ):
        
        text = self.jtf.getText()
        try:
            url = net.URL( text )
        except:
            url = None
            #swing.JOptionPane.showMessageDialog( 
        if url:
            self.browser.setURL( url )

    
    def feedNodesBodyContents( self, event ):
        
        c = self.c
        cp = c.currentPosition()
        data = self.writeContent( cp.copy() )
        #self.history.append( cp.copy() )
        item = cp.copy()
        self.history.insert( self.historypointer +1 , item )
        self.historypointer += 1
        self.history = self.history[ : self.historypointer + 1 ]
        self.browser.setContent( data )
        self.enableButtons()
        
    def storePage( self, event ):
        
        c = self.c
        c.beginUpdate()
        content = self.browser.getContent()
        url = self.browser.getURL()
        cp = c.currentPosition()
        nwp = cp.insertAfter()
        nwp.v.t.headString = url.toString()
        nwp.v.t.bodyString = content
        c.endUpdate()
        
    def goToHeadline( self, event ):
        
        c = self.c
        cp = c.currentPosition()
        headline = cp.headString()
        try:
            url = net.URL( headline.strip() )
        except:
            url = None
        
        if url:
            self.browser.setURL( url )

        
    def getWidget( self ):
        return self.base

    #@    @+others
    #@+node:zorcanda!.20051010123359:WebBrowserListener interface
    def documentCompleted( self, event):
        pass 
    
    def downloadCompleted( self, event):
        
        if not self.ignore:
            url = self.browser.getURL()
            #self.history.append( url )
            self.history.insert( self.historypointer + 1 , url )
            self.historypointer += 1
            self.history = self.history[ : self.historypointer + 1 ] 
        else:
            self.ignore = 0
        self.enableButtons()
            
    def downloadError( self, event):
        pass
         
    def downloadProgress( self, event):
        pass
         
    def downloadStarted( self, event):
        pass      
    
    def statusTextChange( self, event):
        pass 
    
    def titleChange( self, event):
        pass 
    #@nonl
    #@-node:zorcanda!.20051010123359:WebBrowserListener interface
    #@+node:zorcanda!.20051211100928:things I did to get this to work on Linux
    #@+at
    # direct the CLASSPATH to point at the JDIC.jar
    # set the LD_LIBRARY_PATH to point at the directory containing the JDIC 
    # .so's
    # --> Both of these should be in the JDIC distribution
    # set the MOZILLA_FIVE_HOME environment variable to point towards the home 
    # directory of my Mozilla installation
    # --> other systems may have an easier time doing this, mine is kind of 
    # dated.
    # 
    # 
    #@-at
    #@-node:zorcanda!.20051211100928:things I did to get this to work on Linux
    #@-others


def addHandler( tag, kwords ):
    
    c = kwords[ 'c' ]
    tab_manager = kwords[ 'tabmanager' ]
    lwb = LeoWebBrowser( c )
    tab_manager.add( "WebBrowser", lwb.getWidget() , switch = False )
    

def init():	
    import leoPlugins
    leoPlugins.registerHandler( "body_pane_added", addHandler )
    g.plugin_signon( __name__)
#@nonl
#@-node:zorcanda!.20051008203717:@thin LeoWebBrowser.py
#@-leo
