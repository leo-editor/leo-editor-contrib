#@+leo-ver=4-thin-encoding=utf-8,.
#@+node:zorcanda!.20050504131954:@thin LeoCommunicator.py
import java
import javax.swing as swing
import net.jxta.peergroup.PeerGroup as PeerGroup
import net.jxta.peergroup.PeerGroupFactory as PeerGroupFactory
import net.jxta.exception.PeerGroupException as PeerGroupException
import net.jxta.discovery.DiscoveryService as DiscoveryService
import net.jxta.discovery.DiscoveryListener as DiscoveryListener
import net.jxta.discovery.DiscoveryEvent as DiscoveryEvent
import net.jxta.protocol.DiscoveryResponseMsg as DiscoveryResponseMsg
import net.jxta.protocol.PeerAdvertisement as PeerAdvertisement
import net.jxta.protocol.PipeAdvertisement as PipeAdvertisement
import net.jxta.protocol.ModuleSpecAdvertisement as ModuleSpecAdvertisement
import net.jxta.document as doc
import net.jxta.endpoint as ep
import net.jxta.credential as cred
import net.jxta.rendezvous as rdzv
import net.jxta.ext.config as econfig
import net.jxta.pipe as pipe
import net.jxta.socket as socket
import java.util.concurrent as concurrent


True = 1
False = 0

haveseen = {}

class LeoCommunicator( DiscoveryListener):

    #@    @+others
    #@+node:zorcanda!.20050504131954.1:__init__
    def __init__( self, c ):
        
        self.c = c
        self.node_messages = {}
        self.peer_groups = {}
        self.executor = concurrent.Executors.newSingleThreadScheduledExecutor()
        self.createGui()
        #jf = swing.JFrame()
        #cp = jf.getContentPane()
        #cp.setLayout( java.awt.BorderLayout())
        #jp1 = swing.JPanel() 
        #jp2 = swing.JPanel()
        #cp.add( jp1, java.awt.BorderLayout.WEST)
        #cp.add( jp2, java.awt.BorderLayout.EAST) 
        
        #jp1 = swing.JPanel( java.awt.BorderLayout())
        #top = swing.Box.createHorizontalBox()
        #self.jta = jta = swing.JTextArea()
        #top2 = swing.Box.createVerticalBox()
        #top.add( top2)
        #jsp = swing.JScrollPane( jta )
        #top.add( jsp )
        #top.add( top2)
        #self.table = jl = swing.JTable()   
        #self.dtm = dtm = swing.table.DefaultTableModel()
        #dtm.addColumn( "From")
        #dtm.addColumn( "Node Name")
        #jl.setModel( dtm)
        #top2.add( swing.JScrollPane( jl ))
        #bpanel = swing.Box.createVerticalBox()
        #top2.add( bpanel)
        #ino = swing.JButton( "Insert Node Into Outline")
        #ino.actionPerformed = lambda event: self.insertNode()
        #bpanel.add(ino)
        #button2 = swing.JButton( "Send Current Node")
        #button2.actionPerformed = lambda event: self.sendNode()
        #bpanel.add( button2)        
        #jp1.add( top )
        #jp2 = swing.JPanel( java.awt.BorderLayout())
        #jp1.add( jp2, java.awt.BorderLayout.SOUTH)
        
        #self.available = available = swing.JList()
        #self.sendmessage = sendmessage = swing.JTextArea()
        #send = swing.JButton( "Send")
        #send.actionPerformed = lambda event: self.sendMessage()
        #jp2.add( swing.JScrollPane( available ), java.awt.BorderLayout.WEST)
        #jp2.add( swing.JScrollPane( sendmessage ), java.awt.BorderLayout.CENTER)
        #jp2.add( send, java.awt.BorderLayout.EAST)
        
        
        #cp.add( jp1 , java.awt.BorderLayout.CENTER) 
        #jp1.add( jsp )
        
        #jt = swing.JTable()
        #jsp2 = swing.JScrollPane( jt )
        #jp2.add( jt )
        #cp.add( jsp2, java.awt.BorderLayout.EAST)
        #jf.pack()
        #jf.visible = 1
        
        #self.original_pg = PeerGroupFactory.newNetPeerGroup()
        #implAdv = self.original_pg.getAllPurposePeerGroupImplAdvertisement() 
        #self.netGroup = self.original_pg.newGroup( None, implAdv, 
        #                                                                     "LeoCommunicator",
        #                                                                     "A group of Leo instances that communicate")
        #self.original_pg.getDiscoveryService().remotePublish( self.netGroup )    
        self.members = {}
        self.relister = self.MemberRelister( self )                              
        self.netGroup = PeerGroupFactory.newNetPeerGroup()      
        self.rdv = self.netGroup.getRendezVousService()     
        self.joined = False                        
        self.pipes = {}
        self.discovery = self.netGroup.getDiscoveryService()
        #self.discovery.addDiscoveryListener( self )
        # self.createInputPipe() 
        self.startSniffer() 
        #self.startListening()
        #self.createGui()
        
        
        
        
    #@nonl
    #@-node:zorcanda!.20050504131954.1:__init__
    #@+node:zorcanda!.20050510115510:createGui
    def createGui( self ):
        
        mpanel = swing.JPanel( java.awt.BorderLayout())
        self.available = jlist = swing.JList()
        jlist.setVisibleRowCount( 5 )
        jlsp = swing.JScrollPane( jlist )
        self.addTitledBorder( jlsp, "Members")
        
        #jlist.setListData( ("catssssssssss", "rats" ))
        mpanel.add( jlsp, java.awt.BorderLayout.WEST)
        jtp = swing.JTabbedPane()
        mpanel.add( jtp, java.awt.BorderLayout.CENTER)
        
        tpanel = swing.JPanel()
        slayout = swing.SpringLayout()
        tpanel.setLayout( slayout)
        jtp.addTab( "Messages", tpanel)
        self.jta = jta = swing.JTextArea()
        jsp = swing.JScrollPane( jta )
        self.addTitledBorder( jsp, "Instant Messages")
        jsp.setPreferredSize( java.awt.Dimension( 500, 200 ) )
        tpanel.add( jsp)
        slayout.putConstraint( slayout.NORTH, jsp, 5, slayout.NORTH, tpanel)
        slayout.putConstraint( slayout.EAST, tpanel, 5, slayout.EAST, jsp )
        self.sendmessage = jta2 = swing.JTextArea()
        jsp2 = swing.JScrollPane( jta2)
        self.addTitledBorder( jsp2, "Compose Message")
        jsp2.setPreferredSize( java.awt.Dimension( 250, 200 ))
        tpanel.add( jsp2 )
        slayout.putConstraint( slayout.NORTH, jsp2, 5, slayout.SOUTH, jsp)
        jb = swing.JButton( "Send Message")
        jb.actionPerformed = lambda event: self.sendMessage()
        tpanel.add( jb )
        slayout.putConstraint( slayout.NORTH, jb, 0, slayout.NORTH, jsp2 )
        slayout.putConstraint( slayout.WEST, jb, 5, slayout.EAST, jsp2 )
        jb2 = swing.JButton( "Clear")
        jb2.actionPerformed = lambda event: self.sendmessage.setText( "")
        tpanel.add( jb2)
        slayout.putConstraint( slayout.NORTH, jb2, 5, slayout.SOUTH, jb)
        slayout.putConstraint( slayout.WEST, jb2, 5, slayout.EAST, jsp2 )
        slayout.putConstraint( slayout.SOUTH, tpanel, 5, slayout.SOUTH, jsp2 )
        
        npanel = swing.JPanel()
        slayout = swing.SpringLayout()
        npanel.setLayout( slayout )
        jtp.addTab( "Nodes", npanel)
        self.table = jtable = swing.JTable()
    
        self.dtm = dtm = swing.table.DefaultTableModel()
        dtm.addColumn( "From")
        dtm.addColumn( "Node Name")
        jtable.setModel( dtm)
        jsp3 = swing.JScrollPane( jtable)
        jsp3.setPreferredSize( java.awt.Dimension( 500, 200 ))
        npanel.add( jsp3)
        slayout.putConstraint( slayout.NORTH, jsp3, 5, slayout.NORTH, npanel)
        slayout.putConstraint( slayout.EAST, npanel, 5, slayout.EAST, jsp3)
        jb3 = swing.JButton( "Send Current Node To")
        jb3.actionPerformed = lambda event: self.sendNode()
        npanel.add( jb3)
        slayout.putConstraint( slayout.NORTH, jb3, 5, slayout.SOUTH, jsp3)
        slayout.putConstraint( slayout.SOUTH, npanel, 5, slayout.SOUTH, jb3 )
        jb4 = swing.JButton( "Insert Selected Row")
        jb4.actionPerformed = lambda event: self.insertNode()
        npanel.add( jb4)
        slayout.putConstraint( slayout.NORTH, jb4, 0 , slayout.NORTH, jb3)
        slayout.putConstraint( slayout.EAST, jb4, 0, slayout.EAST, jsp3 )
        jf = swing.JFrame()
        jf.add( mpanel)
        jf.pack()
        jf.visible = 1
        
        
        
        
        
    #@nonl
    #@-node:zorcanda!.20050510115510:createGui
    #@+node:zorcanda!.20050510140833:addTitledBorder
    def addTitledBorder( self, widget, title):
        
        border = widget.getBorder()
        tborder = swing.border.TitledBorder( border)
        tborder.setTitle( title)
        widget.setBorder( tborder)
    #@nonl
    #@-node:zorcanda!.20050510140833:addTitledBorder
    #@+node:zorcanda!.20050504133428:sendMessage
    def sendMessage( self, message = None ):
        
        available = self.available
        val = available.getSelectedValue()
        if val != None:
            pipes = self.members[ val ]
            # print pipes
            print pipes.keys() 
            print len( pipes)
            try:
                group = pipes[ "group"]
                pservice = group.getPipeService()
                #opipe = pservice.createOutputPipe( adv, 10000)
                im = nm = None
                for key in pipes.keys():
                    if key.endswith( "InstantMessage"):
                        im = key
                    elif key.endswith( "NodeMessage"):
                        nm = key
                        
                if message == None:
                    message = self.getInstantMessage()
                    adv = pipes[ im ]
                else:
                    adv = pipes[ nm ]
               
                print adv     
                opipe = pservice.createOutputPipe( adv, 10000)
                print opipe
                opipe.send( message)
                print "SENT MESSAGE!"
                
                
            except java.lang.Exception, x:
                x.printStackTrace()
                print "BAD ONE!"
    #@nonl
    #@-node:zorcanda!.20050504133428:sendMessage
    #@+node:zorcanda!.20050507160858:joinGroup
    def joinGroup( self, adv ):
        
        print adv.getAdvertisementType()
        grp = self.netGroup.newGroup( adv )
        mservice = grp.getMembershipService()
        ac = cred.AuthenticationCredential( grp, None, None)
        auth = mservice.apply( ac )
        print "READY TO join %s" % auth.isReadyForJoin()
        if auth.isReadyForJoin():
            credential = mservice.join( auth )
            print credential
            print "BOOOGGAA"
            print "IS VALID %s" % credential.isValid()  
            print "NO"
            advertisements = self.createInputPipe( grp )
            #rsv = grp.getRendezVousService()
            #print rsv
            #print "CONNECTED TO RV %s" % rsv.isConnectedToRendezVous()
            
            self.joined = True
            self.lookForPeers( grp ) 
            self.peer_groups[ grp.getPeerGroupID() ] = grp
            self.announceAndReceive( grp, advertisements )
            print "whatda!"
        
    #@nonl
    #@-node:zorcanda!.20050507160858:joinGroup
    #@+node:zorcanda!.20050504142606:getInstantMessage
    def getInstantMessage( self ):
        txt = self.sendmessage.getText()
        message = ep.Message()
        name = self.netGroup.getPeerName()
        frm = ep.StringMessageElement( "from", name, None )
        message.addMessageElement( frm)
        sme = ep.StringMessageElement( "instantmessage", txt, None)
        message.addMessageElement( sme )
        return message
    #@nonl
    #@-node:zorcanda!.20050504142606:getInstantMessage
    #@+node:zorcanda!.20050504160152:getSpecialMessage
    def getSpecialMessage( self, name, text):
       
        message = ep.Message()
        frm = ep.StringMessageElement( "from", self.name, None )
        message.addMessageElement( frm)
        sme = ep.StringMessageElement( name, text, None)
        message.addMessageElement( sme )
        return message    
    #@nonl
    #@-node:zorcanda!.20050504160152:getSpecialMessage
    #@+node:zorcanda!.20050504134010:startSniffer
    def startSniffer( self ):
        
        self.executor.submit( self.GroupDiscoverer( self, "LeoCommunicator" ))
        
        
                
    #@nonl
    #@-node:zorcanda!.20050504134010:startSniffer
    #@+node:zorcanda!.20050504140235:createInputPipes
    def createInputPipe( self, group ):
        
        iadvs = []
        discovery = group.getDiscoveryService()
        for z in discovery.getLocalAdvertisements( self.discovery.ADV, None, None):
            if z.getAdvType() == "jxta:PipeAdvertisement":
                iadvs.append( z )
                
       
        for z in iadvs:
            discovery.flushAdvertisement( z )
                
        ps = group.getPipeService()
        pid = group.getPeerID()
        pipes = {}
        plistener = self.PipeListener( self, pipes )
        print plistener 
        print "PIP!!!!"
        self.pipes = {}
    
        adv = self._createPipeAdvertisement( "InstantMessage" , group)
        pipes[ adv.getPipeID() ] = self._processInstantMessage 
        discovery.publish( adv )
        print "Name is %s" % adv.getName()
        ps.createInputPipe( adv, plistener ) 
        
        #print "Pipe is %s" % self.input_pipe
        adv2 = self._createPipeAdvertisement( "NodeMessage" , group )
        pipes[ adv2.getPipeID()] = self._processNodeMessage
        print "PIPES len is now %s" % len( self.pipes)
        discovery.publish( adv2 )
        ps.createInputPipe( adv2, plistener)
        #print "Im"
        #print adv
        #print "NM"
        #print adv2
        
        advertisements = []
        advertisements.append( ( "Peer", group.getPeerAdvertisement() ))
        advertisements.append(( "InstantMessage", adv ))
        advertisements.append( ( "NodeMessage", adv2) )
        return advertisements
        # announcer = self.Annoncer( group, ?, advertisements)
        
        
        #self.startListening()
        
    #@nonl
    #@-node:zorcanda!.20050504140235:createInputPipes
    #@+node:zorcanda!.20050509113144:_createPipeAdvertisement
    def _createPipeAdvertisement( self, name, group ):
    
        ps = group.getPipeService()
        af = doc.AdvertisementFactory
        adv = af.newAdvertisement( PipeAdvertisement.getAdvertisementType())
        #ps = self.netGroup.getPipeService()
        adv.setType( ps.UnicastType)  
        import net.jxta.id as jid
        id = jid.IDFactory.newPipeID( group.getPeerGroupID())
        adv.setPipeID( id )
        adv.setName( name )
        #advertisement = adv
        #adv.setName( group.getPeerName() )
        #print group.getPeerName()
        #self.name = group.getPeerName()
        #discovery.publish( adv )
        return adv
        #adv.setName( self.netGroup.getPeerName() )
        #discovery.remotePublish( adv )
    #@nonl
    #@-node:zorcanda!.20050509113144:_createPipeAdvertisement
    #@+node:zorcanda!.20050509113734:_process Messages
    def _processInstantMessage( self, message):
        
        frm = message.getMessageElement( "from")
        frm = frm.toString()
        im = message.getMessageElement( "instantmessage")
        im = im.toString()
        msg = "%s : %s" %( frm, im )
        if not msg.endswith( "\n"):
            msg += "\n"
        self.jta.append( msg)
        
        
    def _processNodeMessage( self, message):
        print message
        print "A IM!"
    #@nonl
    #@-node:zorcanda!.20050509113734:_process Messages
    #@+node:zorcanda!.20050504142737:startListening
    def startListening( self ):
        
        class inserter( java.lang.Runnable):
            def __init__( self, jta, dtm, node_messages,message):
                self.jta = jta
                self.dtm = dtm
                self.message = message
                self.node_messages = node_messages
                
            def run( self ):
                
                print self.message
                who = self.message.getMessageElement( "from").toString()
                if self.message.getMessageElement( "instantmessage"):
                    txt = self.message.getMessageElement( "instantmessage").toString()
                    self.jta.append( "@%s: " % who)
                    self.jta.append(  txt  )
                    if not txt.endswith( "\n"):
                        self.jta.append( "\n")
                elif self.message.getMessageElement( "node"):
                    name = self.message.getMessageElement( "nodename").toString()
                    txt = self.message.getMessageElement( "node").toString()
                    vec = java.util.Vector()
                    vec.add( who); vec.add( name)
                    self.dtm.addRow( vec )
                    print vec
                    self.node_messages[ vec ] = txt
                    
                    
                    
        
        class listener( java.lang.Runnable):
            
            def __init__( self, communicator):
                self.communicator = communicator
            
            def run( self ):
                
                input_pipe = self.communicator.input_pipe
                node_messages = self.communicator.node_messages 
                while 1:
                    try:
                        message = input_pipe.waitForMessage()
                        print message
                        #element = message.getMessageElement( "instantmessage") 
                        insert = inserter( self.communicator.jta, self.communicator.dtm, node_messages , message)
                        java.awt.EventQueue.invokeLater( insert)
                        
                    except java.lang.Exception, x:
                        pass
                
        java.lang.Thread( listener( self )).start() 
        
    #@nonl
    #@-node:zorcanda!.20050504142737:startListening
    #@+node:zorcanda!.20050509155715:announce
    def announceAndReceive( self, grp , announcements):
        
        announcer = self.Announcer( grp, announcements, self)
        self.executor.submit( announcer )
        
    #@nonl
    #@-node:zorcanda!.20050509155715:announce
    #@+node:zorcanda!.20050507164555:lookForPeers
    def lookForPeers( self, grp ):
        
        discovery = grp.getDiscoveryService()
        discovery.addDiscoveryListener( self.D2Listener())
        self.executor.scheduleWithFixedDelay( self.PeerDiscoverer( self, discovery, grp ),
                                                                      0,
                                                                      60 ,
                                                                      concurrent.TimeUnit.SECONDS )
        
    #@-node:zorcanda!.20050507164555:lookForPeers
    #@+node:zorcanda!.20050504161751:insertNode
    def insertNode( self ):
    
        c = self.c
        cp = c.currentPosition()
        vec = self.dtm.getDataVector()
        row = self.table.getSelectedRow()
        print "ROW IS %s" % row
        if row == -1: return
        
        vec = vec.get( row )
        
        if self.node_messages.has_key( vec ):
            s = self.node_messages[ vec ]
        else:
            print "BLAHHH"
            return
        
        print s
        #c.beginUpdate()
        isLeo = g.match(s,0,g.app.prolog_prefix_string)
    
        if isLeo:
            p = c.fileCommands.getLeoOutline(s, 1 ) #reassignIndices)
        else:
            p = c.importCommands.convertMoreStringToOutlineAfter(s,current)
        
        print p
        c.beginUpdate()
        p.moveAfter( cp )
        c.endUpdate()
    #@nonl
    #@-node:zorcanda!.20050504161751:insertNode
    #@+node:zorcanda!.20050504161751.1:sendNode
    def sendNode( self ):
        
        c = self.c
        cp = c.currentPosition()
        s = c.fileCommands.putLeoOutline()
        message = self.getSpecialMessage( "node", s)
        sme = ep.StringMessageElement( "nodename", cp.headString(), None)
        message.addMessageElement( sme )
        self.sendMessage( message )
        
        
    #@nonl
    #@-node:zorcanda!.20050504161751.1:sendNode
    #@+node:zorcanda!.20050509115310:addMemberToList
    
    
    def addMemberToList( self, who, pipes ):
        
        self.members[ who] = pipes
        java.awt.EventQueue.invokeLater( self.relister)
        
    #@nonl
    #@-node:zorcanda!.20050509115310:addMemberToList
    #@+node:zorcanda!.20050509100828:class PipeListener
    class PipeListener( pipe.PipeMsgListener): 
        
        def __init__( self, communicator, pipes):
            self.communicator = communicator
            self.pipes = pipes
        
        def pipeMsgEvent( self, event):
            
            pipeID = event.getPipeID()
            print "YEAH IVE GOT A MESSAGE!"
            print pipeID
            print event.getMessage()
            print self.pipes
            if self.pipes.has_key( pipeID):
                self.pipes[ pipeID]( event.getMessage())
                
    #@nonl
    #@-node:zorcanda!.20050509100828:class PipeListener
    #@+node:zorcanda!.20050507175009:class PipeInspector
    class PipeInspector( DiscoveryListener, java.lang.Runnable):
        
        def __init__( self, grp, advertisement , communicator):
            
            self.grp = grp
            self.discovery = grp.getDiscoveryService()
            self.advertisement = advertisement
            self.communicator = communicator
            self.who = self.advertisement.getName()
            
        def run( self ):
            discovery = self.discovery
            print "Looking for %s" % self.advertisement.getPeerID().toString()
            print "For Peer %s" % self.advertisement.getName() 
            startid = self.advertisement.getPeerID().toString() + "*"
            discovery.getRemoteAdvertisements( self.advertisement.getPeerID().toString(),
                                                                      discovery.ADV,
                                                                      "Name",
                                                                      startid,
                                                                      5,
                                                                      self)
                                                                              
            
        def discoveryEvent( self, event):
            
            print "DE PINSPECTOR %s" % event
            pipes = {}
            i = 0
            for z in event.getSearchResults():
                print "Type is %s" % z.getAdvType()
           
                if z.getAdvType() == "jxta:PipeAdvertisement":
                    print z
                    print "i is %s" % i
                    i += 1
                    pipes[ z.getName()] = z
                    
            pipes[ "group"] = self.grp 
            self.communicator.addMemberToList( self.who, pipes) 
            
    #@nonl
    #@-node:zorcanda!.20050507175009:class PipeInspector
    #@+node:zorcanda!.20050508182602:class PeerDiscoverer
    class PeerDiscoverer( DiscoveryListener, java.lang.Runnable):
        
        def __init__( self, communicator, discovery, group):
            self.communicator = communicator
            self.discovery = discovery
            self.group = group
            
        def run( self ):
            discovery = self.discovery
            try:
                print "YEAHH!!! DISCOVER PEERS!!!!"
                discovery.getRemoteAdvertisements( None, discovery.ADV , "Name", "LeoCommunicator",5, self )
            except java.lang.Exception, x:
                        pass
            
        def discoveryEvent( self, event ):
            
            for z in event.getSearchResults():
                try:
                    print "You sunk my battleship %s" % z.getName()
                    if z.getAdvType() != "jxta:PipeAdvertisement":
                        print "IT was %s" % z.getAdvType()
                        continue
                    if z.getName() != "LeoCommunicator":
                        continue
                    print z.getAdvType()
                    print z
                    sock = socket.JxtaSocket()
                    sock.create( 1 )
                    print "To %s" %sock.getSoTimeout()
                    sock.setSoTimeout( 0 )
                    print sock 
                    print sock.connect( self.group, z )
                    print sock
                    print "BOOBAAA"
                    import jarray
                    if sock.isConnected():
                        #java.lang.Thread.sleep( 10000)
                        print "done sleeping "
                        ins = sock.getInputStream()
                        print ins.available()
                        print "available"
                        ba = jarray.zeros( ins.available(), 'b')
                        #print "Yadda %s" % ins.read()
                        x = []
                        #i = ins.read()
                        #print "START!"
                        #x.append( i )
                        import jarray
                        one = jarray.zeros( 1, 'b')
                        one[ 0 ] = 1
                        os = sock.getOutputStream()
                        
                        while 1:
                            
                            print "PREEE WRITEE!"
                            os.write( one)
                            os.flush()
                            print "one %s" % one
                            bytes = []
                            print "available %s" % ins.available()
                            bytes.append( ins.read())
                            print " two"
                            while ins.available() != 0:
                                print "three"
                                bytes.append( ins.read())
                            print "bytes are %s" % bytes    
                            os.write( one )
                            os.flush()
                            i = ins.read()
                            ba = jarray.zeros( ins.available() + 1, 'b')
                            ba[ 0 ] = i
                            i = ins.read( ba, 1, len( ba) -1)
                            x.append( ba )
                            if str(java.lang.String( ba)) == 'end':
                                #os = sock.getOutputStream()
                                os.write( ba)
                                os.flush()
                                os.close()
                                break
                            #print "I is %s" %  i
                            #print "available is %s" % ins.available()
                            #x.append( i )
                            #x.extend( ba )
                            #if i == -1:
                            #     print "---1@!"
                        
                        print java.lang.String( x[ 0 ] )
                        #ins.read( ba )
                        sock.close()
                        print java.lang.String( ba )
                except java.lang.Exception, x:
                    x.printStackTrace()
                    
                                              
    #@nonl
    #@-node:zorcanda!.20050508182602:class PeerDiscoverer
    #@+node:zorcanda!.20050509150407:class Announcer
    class Announcer( java.lang.Runnable, pipe.OutputPipeListener, DiscoveryListener):
        
        def __init__( self, grp,  advertisements, communicator):
            self.grp = grp
            self.advertisements = advertisements
            self.communicator = communicator
            
        def run( self ):
            
            discovery = self.grp.getDiscoveryService()
            discovery.getRemoteAdvertisements( None,
                                                                       discovery.ADV,
                                                                       "Name",
                                                                       "LeoPropagate",
                                                                        1,
                                                                        self )
        
        def discoveryEvent( self, event ):
            
            for z in event.getSearchResults():
                print z
                ps = self.grp.getPipeService()
                print ps.createOutputPipe(  z, self )
                receiver = self.communicator.Receiver( self.grp, z, self.communicator)
                
        def outputPipeEvent( self, event):
            
            print "OPIPE!"
            op = event.getOutputPipe()
            print op
            message = ep.Message()
            sme = ep.StringMessageElement( "type", "announce", None)
            message.addMessageElement( sme )
            print message
            for z, z1 in self.advertisements:
                 sme = ep.StringMessageElement( z, z1.toString(), None )
                 message.addMessageElement( sme )
            
            print message.toString()
            ok = op.send( message)
            print "SENT was %s" % ok
            print message
            print "SENT M!"
            
        
    #@nonl
    #@-node:zorcanda!.20050509150407:class Announcer
    #@+node:zorcanda!.20050509154017:class Receiver
    class Receiver( pipe.PipeMsgListener ):
    
        def __init__( self, grp, adv, communicator ):
            ps = grp.getPipeService()
            self.pipe = ip = ps.createInputPipe( adv, self)
            self.communicator = communicator
            self.group = grp
            #print "Ip is %s" % ip
            #print "adv is %s" % adv
            #print ip.getType()
            #print ip.getPipeID() 
            
        def pipeMsgEvent( self, event):
            print event
            print "RECEIVED SPECIAL EVENT!"
            print event.getMessage()
            message = event.getMessage()
            element = message.getMessageElement( "type")
            if element:
                element = element.toString()
            
            if element == "announce":
                elements = {}
                
                elements[ 'group'] = self.group
                peer = message.getMessageElement( "Peer")
                data = peer.getBytes( 0 )
                bais = java.io.ByteArrayInputStream( data )
                peerad = doc.AdvertisementFactory.newAdvertisement( doc.MimeMediaType.XMLUTF8, bais)
                padv = self.group.getPeerAdvertisement()
               
                elements[ "Peer"] = peerad
                name = peerad.getName()
                print name
               
                if padv.getPeerID() == peerad.getPeerID():
                    print "yadd"
                    return
                
                im = message.getMessageElement( "InstantMessage")
                data = im.getBytes( 0 )
                bais = java.io.ByteArrayInputStream( data) 
                imad = doc.AdvertisementFactory.newAdvertisement( doc.MimeMediaType.XMLUTF8, bais )
                elements[ "InstantMessage"] = imad
                
                nm = message.getMessageElement( "NodeMessage")
                data = nm.getBytes( 0 )
                bais = java.io.ByteArrayInputStream( data )
                nmad = doc.AdvertisementFactory.newAdvertisement( doc.MimeMediaType.XMLUTF8, bais)
                elements[ "NodeMessage"] = nmad
                
                self.communicator.addMemberToList( name, elements ) 
                #print elements
                
                        
    #@nonl
    #@-node:zorcanda!.20050509154017:class Receiver
    #@+node:zorcanda!.20050507200515:class GroupDiscoverer
    class GroupDiscoverer( DiscoveryListener, java.lang.Runnable):
        
        def __init__( self , communicator, name):
            self.communicator = communicator
            self.name = name
            
        def run( self ):
            
            discovery = self.communicator.discovery
            #discovery.getRemoteAdvertisements( None, DiscoveryService.GROUP,
            #                                                                  "Name", self.name, 1, self)
            print "SENT GROUP ADD SEARCH"      
            print "WE ARE CONNECTED %s" % self.communicator.rdv.isConnectedToRendezVous()              
            if not self.communicator.rdv.isConnectedToRendezVous():
                endpoint = ep.EndpointAddress( "tcp://127.0.0.1:9701")
                print endpoint
                print self.communicator.rdv.connectToRendezVous( endpoint )
                print "CAN I CONNECT!?! %s" % self.communicator.rdv.isConnectedToRendezVous()
            #self.communicator.rdv.addListener( self.RndListener() )
            print "SENDING QUERY!"
            discovery.getRemoteAdvertisements( None, DiscoveryService.GROUP,
                                                                       "Name", self.name, 1, self )
            
        def discoveryEvent( self, event):
            for z in event.getSearchResults():
            
                    print z.getAdvType()
                    if z.getAdvType() == "jxta:PGA":
                        #self.pipes[ z.getName()] = z
                        print "Name for z is %s" % z.getName() 
                        communicator = self.communicator
                        communicator.joinGroup( z )
                        break
    #@nonl
    #@-node:zorcanda!.20050507200515:class GroupDiscoverer
    #@+node:zorcanda!.20050509115553:class MemberRelister
    class MemberRelister( java.lang.Runnable):
        
        def __init__( self, communicator):
            self.communicator = communicator
            
        def run( self):
            
            mset = self.communicator.members.keys()
            mset.sort()
            self.communicator.available.setListData( mset )
            
    #@nonl
    #@-node:zorcanda!.20050509115553:class MemberRelister
    #@+node:zorcanda!.20050509140628:class RndListener
    class RndListener( rdzv.RendezvousListener): 
        
        def rendezvousEvent( self, event):
            print event
            
    #@nonl
    #@-node:zorcanda!.20050509140628:class RndListener
    #@+node:zorcanda!.20050509145016:class D2Listener
    class D2Listener( DiscoveryListener):
        
        def discoveryEvent( self, event):
            print "DEVENT"
            print event
            
    #@nonl
    #@-node:zorcanda!.20050509145016:class D2Listener
    #@-others
    
def init():
    import leoPlugins
    import leoGlobals as g
    leoPlugins.registerHandler( "start2", addToMenu )
    g.plugin_signon( __name__)    
    
def addToMenu( tags, args ):
    if args.has_key( "c"):
        c = args[ 'c']
        if c not in haveseen:
            haveseen[ c ]= True
	menu = c.frame.menu
	pmenu = menu.getPluginMenu()
	open_leocommunicator = swing.JMenuItem( "Open LeoCommunicator")
	open_leocommunicator.actionPerformed = lambda event: openLC( c )
	pmenu.add( open_leocommunicator )

communicators = {}
def openLC( c )	:
    
    if c in communicators:
        communicators[ c ].makeVisible()
    else:
        communicators[ c ] = LeoCommunicator( c )
    


if __name__ == "__main__":
    LeoCommunicator( None)
#@nonl
#@-node:zorcanda!.20050504131954:@thin LeoCommunicator.py
#@-leo
