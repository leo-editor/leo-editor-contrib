#@+leo-ver=4-thin-encoding=utf-8,.
#@+node:zorcanda!.20050507112435:@thin CommunicatorRendezvous.py
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
import net.jxta.rendezvous as rdzv
import net.jxta.pipe as pipe
import net.jxta.document as doc
import net.jxta.socket as socket
import java

class RDZListener( rdzv.RendezvousListener):
    def rendezvousEvent( self, event): 
        print event
        
class PeerListener( java.lang.Runnable):
    
    class _PL2( java.lang.Runnable):
        def __init__( self, grp, socket):
            self.grp = grp
            self.socket = socket
            
        def run( self ):
            
            os = self.socket.getOutputStream()
            rsv = self.grp.getRendezVousService()
            dsv = self.grp.getDiscoveryService()
            
            for z in rsv.getConnectedPeers():
                pass   
            ins = self.socket.getInputStream()
            ladds = dsv.getLocalAdvertisements( dsv.PEER, None, None)
            for z in ladds:
                try:
                    print z
                    print ins.read()
                    print ins.available()
                    #if i != 1:
                    #    self.socket.close()
                    #    return
                    sform = z.toString()#.getBytes()
                    print "I amg herer"
                    sform = java.lang.String( sform).getBytes()
                    print "BOOOBAA %s" % len( sform)
                    #bytes = java.lang.String( len( sform) )
                    import jarray
                    bytes = jarray.zeros( 2, 'b')
                    #print  "Beeeigges %s" % bytes
                    print "Iam now here!"
                    print "OOGGGAAAAAA"
                    os.write( bytes )
                    print "yeahhh"
                    os.flush()
                    print ins.read()
                    print ins.available()
                    print "my turn!"
                    os.write( sform )
                    os.flush()
                    print "no more my turn!"
                except java.lang.Exception, x:
                    x.printStackTrace()
            print "Closing!"
            #os.write( -1)
            #os.write( -1)
            ins.read()
            
            eb = java.lang.String( "end").getBytes()
            os.write( eb)
            os.flush()
            ins.read()
            os.write( eb)
            os.flush()
            print "wrote -1!"
            os.close() 
            ins = self.socket.getInputStream()
            ins.read( eb, 0, len( eb))
            ins.close()
            self.socket.close()
            print "is socket closed? %s" % self.socket.isClosed()
            #self.socket.close()
            
    def __init__( self, grp, adv):
        self.grp = grp
        self.adv = adv
        self.executor = java.util.concurrent.Executors.newCachedThreadPool()
        
    def run( self ):
        
        print self.adv.toString()
        ss =  socket.JxtaServerSocket( self.grp, self.adv)
        ss.setSoTimeout( 0 )
        while 1:
            try:
                print "Socket Started!"
                nsocket = ss.accept()
                print "A Connection!"
                self.executor.submit( self._PL2( self.grp, nsocket))
            except java.lang.Exception, x:
                x.printStackTrace()
                

npg = PeerGroupFactory.newNetPeerGroup()
rs = npg.getRendezVousService()
rs.startRendezVous()
discovery = npg.getDiscoveryService() 
locals = discovery.getLocalAdvertisements( discovery.GROUP,  "Name", "LeoCommunicator")
if locals.hasMoreElements():
    for z in locals:
        print z
        implAdv = z
        ng = npg.newGroup( z )
        #rint ng
    print "Rendezvous has advertisement for LeoCommunicator group"
else:
    implAdv = npg.getAllPurposePeerGroupImplAdvertisement() 
    ng = npg.newGroup( None, implAdv,  "LeoCommunicator",
                             "A group of Leo instances that communicate")
    discovery.publish( implAdv )               
    print "Created LeoCommunicator group"

ndiscovery = ng.getDiscoveryService()
locals = ndiscovery.getLocalAdvertisements( discovery.ADV,  "Name", "LeoCommunicator")
if locals.hasMoreElements():
    adv = locals.nextElement()
else:
    af = doc.AdvertisementFactory
    adv = af.newAdvertisement( PipeAdvertisement.getAdvertisementType())
    ps = ng.getPipeService()
    adv.setType( ps.UnicastType)  
    import net.jxta.id as jid
    id = jid.IDFactory.newPipeID( ng.getPeerGroupID())
    adv.setPipeID( id )
    adv.setName( "LeoCommunicator" )
    ndiscovery = ng.getDiscoveryService()
    ndiscovery.publish( adv )

pl = PeerListener( ng, adv)
thread = java.lang.Thread( pl )
thread.start()

#print discovery.remotePublish( implAdv)
#print "REmote publish"
rs.addListener( RDZListener())
print "RDZ added"

discovery2 = ng.getDiscoveryService()
locals = discovery2.getLocalAdvertisements( discovery.ADV,  "Name", "LeoPropagate")
if locals.hasMoreElements():
    adv = locals.nextElement()
    
else:
    group = ng
    ps = group.getPipeService()
    af = doc.AdvertisementFactory
    adv = af.newAdvertisement( PipeAdvertisement.getAdvertisementType())
    #ps = self.netGroup.getPipeService()
    adv.setType( ps.PropagateType)  
    import net.jxta.id as jid
    id = jid.IDFactory.newPipeID( group.getPeerGroupID())
    adv.setPipeID( id )
    adv.setName( "LeoPropagate" )
    discovery2.publish( adv)
    print "NEW Propagate Pipe!"

#rs1 = ng.getRendezVousService()
#rs1.startRendezVous()
#receiver = Receiver( ng, adv )
print 'end'
#@-node:zorcanda!.20050507112435:@thin CommunicatorRendezvous.py
#@-leo
