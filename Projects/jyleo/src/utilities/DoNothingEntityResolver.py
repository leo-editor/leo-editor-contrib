#@+leo-ver=4-thin
#@+node:zorcanda!.20050922112746:@thin DoNothingEntityResolver.py
import java.io as io
import org.xml.sax as sax


class DoNothingEntityResolver( sax.EntityResolver ): #This allows us to read XML files that have DTDs mentioned in their header area...
    def resolveEntity( self, arg1, arg2 ):
        ins = sax.InputSource()
        bais = io.ByteArrayInputStream([])
        ins.setByteStream( bais )
        sr = io.StringReader( "" )
        ins.setCharacterStream( sr )
        ins.setPublicId( arg1 )
        ins.setSystemId( arg2 )
        return ins
#@nonl
#@-node:zorcanda!.20050922112746:@thin DoNothingEntityResolver.py
#@-leo
