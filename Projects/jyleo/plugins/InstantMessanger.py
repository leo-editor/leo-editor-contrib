#@+leo-ver=4-thin-encoding=utf-8,.
#@+node:zorcanda!.20050502170652:@thin InstantMessanger.py
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
import net.jxta.ext.config as econfig
import java

nPG = PeerGroupFactory.newNetPeerGroup()
class dListener( DiscoveryListener):
    
    def discoveryEvent( self, event ):
        print event
        sr = event.getSearchResults()
        for z in sr:
            print z.getClass() 
            print z.getAdvertisementType() 
            #print z.getBaseAdvertisementType() 
            print z.getAdvType() 
            print "-----------------"
            if z.getAdvType() == "jxta:PipeAdvertisement":
                print "BOOO"
                ps = nPG.getPipeService()
                print "ONE"
                print z.getPipeID() 
                try:
                    op = ps.createOutputPipe( z, 1000)
                except java.lang.Exception, x:
                    x.printStackTrace() 
                print "TWO"
                
                message = ep.Message()
                sme = ep.StringMessageElement( "Hi", "NOOBA", None)
                message.addMessageElement( sme )
                print "SENDINNGGGG!!!!"
                if op:
                    print op.send( message)

#nPG = None
discovery = None

try:
    #config = econfig.Configurator( "fred", "booooong")
    #config.setRendezVous( 1 )
    #for z in  config.getTransports():
    #    print z
    # #   for x in  z.getAddresses():
    #        print x
    #        print x.getAddress()
    #        address = x.getAddress()
    #         if str(address).startswith( "tcp"):
    #             uri = java.net.URI( "tcp://127.0.0.2:9705")
    #            x.setAddress( uri )
    #        print x.getPortRange() 
    
    #print config.getHome().getAbsolutePath() 
    #print config.save() 
    #nPG = PeerGroupFactory.newNetPeerGroup()
    print nPG.getPeerGroupName()
    print nPG.getPeerGroupID().toString()
    print nPG.getPeerName()
    print nPG.getPeerID() 
    af = doc.AdvertisementFactory
   # print ModuleSpecAdvertisement.getPipeAdvertisement()
    print "ONE"
    adv = af.newAdvertisement( PipeAdvertisement.getAdvertisementType())
    print "TWO"
    #print adv)
    ps = nPG.getPipeService()
    adv.setType( ps.UnicastType) 
    print adv.getAdvertisementType() 
    import net.jxta.id as jid
    id = jid.IDFactory.newPipeID( nPG.getPeerGroupID())
    adv.setPipeID( id )
    print "ADV id is %s" % adv.getPipeID() 
    pipe = ps.createInputPipe( adv )
    class _piper( java.lang.Thread):
        def run( self):
            while 1:
                print "WAITING"
                msg = pipe.waitForMessage()
                print msg
                for z in msg.getMessageElements():
                    print z
                print "DADA!!!!!"
    java.lang.Thread( _piper()).start()
    discovery = nPG.getDiscoveryService()
    ladds = discovery.getLocalAdvertisements( discovery.ADV, None, None)
    for x in ladds:
        if x.getAdvType() == "jxta:PipeAdvertisement":
            print "flush"
            discovery.flushAdvertisement( x )
    discovery.publish( adv )
    discovery.remotePublish( adv )#, discovery.INFINITE_LIFETIME )  
    print discovery.getAdvLifeTime( adv )
    discovery.addDiscoveryListener( dListener())
    class b( java.lang.Runnable):
        def run( self ):
            while 1:
                discovery.getRemoteAdvertisements( None, DiscoveryService.ADV,
                                                                          None, None, 20)
                java.lang.Thread.sleep( 60 * 1000)
    java.lang.Thread( b()).start()
    print nPG.isRendezvous() 
except PeerGroupException, pge:
    pge.printStackTrace()

#@-node:zorcanda!.20050502170652:@thin InstantMessanger.py
#@-leo
