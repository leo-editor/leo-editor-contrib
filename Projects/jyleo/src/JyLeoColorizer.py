#@+leo-ver=4-thin
#@+node:zorcanda!.20051024202308:@thin JyLeoColorizer.py
from __future__ import generators
import javax.swing as swing
import javax.swing.text as stext
import javax.swing.event as sevent
import java.util.concurrent as concurrent
import java.lang as jlang
import java
import string
import ColorizerRunnable
import weakref

class JyLeoColorizer( sevent.DocumentListener ):
    
    def __init__( self, editor, cdeterminer ):
        self.editor = weakref.proxy( editor )
        self.queue = concurrent.LinkedBlockingQueue()
        self.watch = 1
        self.clr = ColorizerRunnable( editor, cdeterminer, self.queue )
        cthread = jlang.Thread( self.clr ) #This thread does all the colorization for us
        cthread.setDaemon( True )
        cthread.setName( "Colorizer Thread" )
        cthread.start()
        editor.getDocument().addDocumentListener( self )
    
    def fullrecolorize( self ):
        doc = self.editor.getDocument()
        self.clr.positions.clear()
        try:
            self.watch = 0
            self.queue.offer( ( 0, doc.getLength(), None ) )
        finally:
            self.watch = 1
        
    def recolorizenow( self ):
        doc = self.editor.getDocument()
        self.queue.clear()
        self.clr.positions.clear()
        try:
            try:
                self.clr.colorizeline(  0, doc.getLength(), None )
            except java.lang.Exception, x:
                x.printStackTrace()
        finally:
            self.watch = 1
        
    def ignoreEvents( self ):
        self.watch = 0
        
    def watchEvents( self ):
        self.watch = 1
    
    def insertUpdate( self, event ):
        
        if self.watch:
            self.queue.offer( ( event.getOffset(), event.getLength(), event.getType() ) )
        
    def removeUpdate( self, event ):
        if self.watch:
            self.queue.offer( ( event.getOffset(), event.getLength(), event.getType() ) )
        
    def changedUpdate( self, event ):
        pass
    
    #@    @+others
    #@+node:zorcanda!.20051024203647:colorizer
    class colorizer( jlang.Runnable ):
            
        def __init__( self, queue, editor, cdeterminer ):
            #JyLeoColorizerBase.__init__( self, editor, cdeterminer, queue )
            self.queue = queue
            self.editor = editor
            self.cdeterminer = cdeterminer
            self.positions = []
            self.runn = 0
    #@+at    
    #     def run( self ):
    #         while 1:
    #             try:
    #                 spots = []
    #                 i = self.queue.take()
    #                 spots.append( i )
    #                 if self.queue.size():
    #                     self.queue.drainTo( spots )
    #                     spot1 = i[ 0 ]
    #                     length = i[ 1 ]
    #                     event = i[ 2 ]
    #                     for z in spots[ 1: ]:
    #                         if z[ 0 ] < spot1:
    #                             spot1 = z[ 0 ]
    #                         else:
    #                             add = z[ 0 ] - spot1
    #                             add += z[ 1 ]
    #                             length += add
    #                     i = ( spot1, length, event )
    # 
    #                 self.colorizeline( i )
    # 
    #             except java.lang.Exception, x:
    #                 print x
    #                 x.printStackTrace()
    #@-at
    #@@c            
                
        def colorizeline2( self, spots ):
                    
    
            dtype = spots[ 2 ]
            begin = spots[ 0 ]
    
            ctokens = self.cdeterminer.getColoredTokens()
            e = stext.Utilities.getParagraphElement( self.editor, begin )
            e2 = stext.Utilities.getParagraphElement( self.editor, spots[ 0 ] + spots[ 1 ] )
            start = e.getStartOffset()
            end = e2.getEndOffset()
            doc = self.editor.getDocument()
            line = doc.getText( start, end - start )
            w_atts = []
            sr1 = "<" + "<"
            sr2 = ">" + ">"
            sec_refs = doc._srs
            comments = self.cdeterminer.getCommentTokens()
            docing = False
            prevtoken = "\n"
            #for z in self.tokenize( line, start ):
            #( String data, int beginspot, String[] commenttokens, Document doc, List<PyTuple> positions )  
    #@+at  
    #         for z in JyLeoTokenizer( line, start, comments, doc, 
    # self.positions ):
    #             #print "'%s'" % z
    #             if docing:
    #                 if z != "@c":
    #                     w_atts.append( ( z, "p" ) )
    #                 else:
    #                     docing = False
    #             if z.startswith( '"' ) or z.startswith( "'" ):
    #                 w_atts.append( (  z , "p" ) )
    #             elif self.iscomment( z, comments ):
    #                 w_atts.append( ( z, "p" ) )
    #             elif z.startswith( sr1 ) and z.endswith( sr2 ):
    #                 guts = z[ 2: -2 ]
    #                 outer = ctokens.get( "<" + "<" )
    #                 if sec_refs.containsKey( guts ):
    #                     scolor = self.cdeterminer.getSectionReferenceColor()
    #                 else:
    #                     scolor = 
    # self.cdeterminer.getUndefinedSectionReferenceColor()
    #                 w_atts.append( ( sr1, outer ) )
    #                 w_atts.append( ( guts, scolor ) )
    #                 w_atts.append( ( sr2, outer ) )
    #             else:
    #                 if z.isspace() or not ctokens.containsKey( z ):
    #                     if z in string.punctuation:
    #                         w_atts.append( ( z, 
    # self.cdeterminer.getPunctuationColor() ) )
    #                     elif z.isspace():
    #                         w_atts.append(( z, "p" ))
    #                     elif z.isnumeric():
    #                         nsas = stext.SimpleAttributeSet()
    #                         stext.StyleConstants.setForeground( nsas, 
    # java.awt.Color.ORANGE )
    #                         w_atts.append( ( z, nsas ) )
    #                     else:
    #                         w_atts.append( ( z, None ) )
    #                 else:
    #                     w_atts.append( ( z, ctokens.get( z ) ) )
    #                     if z == "@" and prevtoken.endswith( "\n" ): docing = 
    # True
    #             prevtoken = z
    #@-at
    #@@c                 
            
            self.super__colorizeline( *spots )
            sas = stext.SimpleAttributeSet()
            stext.StyleConstants.setForeground( sas, java.awt.Color.BLUE )
            self.color( start, w_atts, doc, sas )
            
            #self.positions.sort( self.sortp )
            copyofp = copy.copy( self.positions )
            #print copyofp.__class__
            copyofp.sort( self.sortp )
            scolor = self.cdeterminer.getStringColor()
            scolor2 = self.cdeterminer.getDocColor()
            coloring = None
            colorstart = -1
            #print self.positions
            offsets = []
            comments = self.cdeterminer.getCommentTokens()
            commentcolor = self.cdeterminer.getCommentColor()
            #copyofp = copy.copy( self.positions )
    
            
    
            ignore1 = ignore2 = -1
            #print copyofp
            for z in copyofp:
                try:
                    offset = z[ 0 ].getOffset()
                    if offset > end and not coloring: 
                        #print "RETURNING!!!!!"
                        return
                    item = doc.getText( z[ 0 ].getOffset(), 1 )
                    if item != z[ 1 ]:
                        self.positions.remove( z )
                        if z[ 0 ].getOffset() == spots[ 0 ] and dtype == sevent.DocumentEvent.EventType.REMOVE:
                            start = stext.Utilities.getRowStart( self.editor, spots[ 0 ] )
                            return self.colorizeline( ( start, doc.getLength() - start, None )) 
                        continue
                    if z[ 0 ].getOffset() in offsets:
                        self.positions.remove( z )
                        if dtype == sevent.DocumentEvent.EventType.REMOVE and z[ 0 ].getOffset() == spots[ 0 ]:
                            start = stext.Utilities.getRowStart( self.editor, spots[ 0 ] )
                            return self.colorizeline( ( start, doc.getLength() - start, None )) 
                        continue
                    offsets.append( z[ 0 ].getOffset() )
                except java.lang.Exception, x:
                    self.positions.remove( z )
                    continue
                    
                if not coloring:
                    coloring = z[ 1 ]
                    colorstart = z[ 0 ].getOffset()
                    if colorstart > ignore1 and colorstart < ignore2:
                        #print "IGNORING %s" % coloring
                        coloring = None
                        continue
                    if coloring == '@':
                        end2 = stext.Utilities.getWordEnd( self.editor, colorstart + 1 )
                        start2 = stext.Utilities.getRowStart( self.editor, colorstart )
                        txt = doc.getText( colorstart , end2 - colorstart )
                        if txt.strip() not in ( "@", ) or start2 != colorstart:
                            coloring = None
                            if dtype == sevent.DocumentEvent.EventType.INSERT and colorstart + 1 == spots[ 0 ]:
                                return self.colorizeline( ( colorstart, doc.getLength() - colorstart, None ) )
                    elif coloring and self.ispossiblecomment( coloring, comments ):
                        l1 = len( comments[ 0 ] )
                        txt = doc.getText( colorstart, l1 )
                        if txt == comments[ 0 ]:
                            e = stext.Utilities.getParagraphElement( self.editor, colorstart )
                            end2 = e.getEndOffset()
                            doc.setCharacterAttributes( colorstart, end2 - colorstart, commentcolor, 1 )
                            ignore1 = colorstart;ignore2 = end2
                            coloring = None
                        elif txt == comments[ 1 ]:
                            pass
                        else:
                            coloring = None
                    continue
                if coloring in ( "'", '"' ):
                    if z[ 1 ] == coloring:
                        eoffset = z[ 0 ].getOffset()
                        emarker = stext.Utilities.getRowEnd( self.editor, eoffset )
                        cs = doc.getCharacterElement( colorstart )
                        ce = doc.getCharacterElement( eoffset )
                        if cs.getAttributes().isEqual( scolor )\
                        and ce.getAttributes().isEqual( scolor )\
                        and ( begin < colorstart or begin > emarker ):
                            pass
                        else:
                            doc.setCharacterAttributes( colorstart, eoffset + 1  - colorstart, scolor, 1 )
                        coloring = None
                        if dtype == sevent.DocumentEvent.EventType.INSERT and eoffset == spots[ 0 ]:
                            return self.colorizeline( ( colorstart, doc.getLength() - colorstart, None ) )
                elif coloring in( "@", ):
                    try:
                        offset = z[ 0 ].getOffset()
                        end2 = stext.Utilities.getWordEnd( self.editor, offset + 1 )
                        start2 = stext.Utilities.getRowStart( self.editor, offset )
                        if start2 == offset:
                            txt = doc.getText( start2 , end2 - start2 )
                            if txt.strip() in ("@c", ):
                                cs = doc.getCharacterElement( colorstart + 1 )
                                ce = doc.getCharacterElement( offset )
                                if cs.getAttributes().isEqual( scolor2 )\
                                and ce.getAttributes().isEqual( scolor2 )\
                                and ( begin < colorstart or begin > end2 ):
                                    pass
                                else:
                                    doc.setCharacterAttributes( colorstart + 1, offset - colorstart -1, scolor2, 1 )
                                coloring = None
                                if dtype == sevent.DocumentEvent.EventType.INSERT and start2 + 1 == spots[ 0 ]:
                                    return self.colorizeline( ( start2, doc.getLength() - start2, None ) )
                    except java.lang.Exception, x:
                        pass 
                elif coloring and self.ispossiblecomment( coloring, comments ):
                    
                    cend = comments[ 2 ]
                    offset = z[ 0 ].getOffset()
                    txt = doc.getText( offset, len( cend ) )
                    if txt == cend:
                        cs = doc.getCharacterElement( colorstart )
                        ce = doc.getCharacterElement( offset + len( cend ) )
                        if cs.getAttributes().isEqual( commentcolor )\
                        and ce.getAttributes().isEqual( commentcolor )\
                        and ( begin < colorstart or begin > offset ):
                            pass
                        else:
                            doc.setCharacterAttributes( colorstart, (offset + len( cend ) ) -colorstart, commentcolor, 1 )
                        coloring = None
                        if dtype == sevent.DocumentEvent.EventType.INSERT and ( offset <= spots[ 0 ] and offset + len( cend ) >= spots[ 0 ] ):
                            return self.colorizeline( ( offset, doc.getLength() - offset, None ) )
                    
                        
            if coloring:
                if coloring in ( "'", '"' ):
                    pass
                elif coloring == "@":
                    colorstart += 1 
                    scolor = scolor2
                else:
                    scolor = commentcolor    
                doc.setCharacterAttributes( colorstart, doc.getLength() - colorstart, scolor, 1 )
    
            
        #@    @+others
        #@+node:zorcanda!.20051025122824:tokenizer
        def tokenize( self, data, beginspot):
                        
            cword = ""
            spot = -1
            beginspot -= 1
            ignore = False
            doc = self.editor.getDocument()
            ctokens = self.cdeterminer.getCommentTokens()
            #print ctokens
            escaping = False
            for x in xrange( len(data) ):
                spot += 1
                beginspot += 1
                if spot >= len( data ): break
                z = data[ spot ]
                #print z, cword
                if z == "\\" or escaping:
                    #print "ESCAPE!!! %s" % cword
                    if escaping:
                        cword += z
                        yield cword
                        cword = ""
                        escaping = False
                        continue
                    else:
                        escaping = True
                        cword += z
                        continue
                if z in ( "@", '"',"'" ):
                    self.addPosition( beginspot, z, doc )  
                if z in ( '"', "'" ):
                    yield cword
                    cword = ""
                    dspot = spot + 1
                    while 1:
                        #print "DSPOTIN!!!"
                        i = data.find( z, dspot )
                        if i != -1:
                            if data[ i -1 ] == "\\":
                                dspot = i + 1
                                if dspot >= len( data ):
                                    i == -1
                                    break
                                continue
                            else: break
                        else: break
                    if i == -1:
                        yield data[ spot: ]
                        ignore = True
                        break
                    else:
                        rv = data[ spot : i + 1 ]
                        self.addPosition( beginspot + len( rv ) -1, z, doc )
                        yield rv
                        cword = ""
                        spot += len( rv ) - 1
                        beginspot += len( rv ) -1
                        continue
                elif z == '<':
                    if spot < len( data ):
                            
                        i = data.find( "<<", spot  )
                        if i !=  spot:
                            yield cword
                            yield z
                            cword = ""
                            continue
                        else:
                            i2 = data.find( ">>", spot )
                            if i2 == -1:
                                yield cword
                                yield z
                                cword = ""
                                continue
                            else:
                                rv = data[ i: i2 + 2 ]
                                yield cword
                                yield rv
                                spot += len( rv ) - 1
                                beginspot += len( rv ) - 1
                                cword = ""
                                continue
                elif cword.isspace() and not z.isspace():
                    yield cword
                    cword = ""
                elif z.isspace() and cword.isspace():
                    pass
                elif z == '@' and cword == '':
                    pass
                elif self.ispossiblecomment( cword, ctokens ) and self.ispossiblecomment( z , ctokens ):
                    pass
                elif cword in ctokens and not self.ispossiblecomment( z, ctokens ):
                    if cword == ctokens[ 0 ]:
                        i = data.find( "\n", spot )
                        addon = ""
                        if i == -1:
                            addon = data[ spot: ]
                        else:
                            addon = data[ spot:i]
                        
                        self.addPosition( ( beginspot - len( cword ) ), cword[ 0 ], doc )
                        cword += addon
                        if i == -1:
                            beginspot = len( data ) + 1 
                        else:
                            beginspot += len( addon ) -1
                            spot += len( addon ) -1               
                        yield cword
                        cword = ""
                        continue
                    if cword == ctokens[ 1 ]:
                        i = data.find( ctokens[ 2 ], spot )
                        addon = ""
                        if i == -1:
                            addon = data[ spot: ]
                        else:
                            addon = data[ spot:i + len( ctokens[ 2 ] ) ]
                            
                        self.addPosition( ( beginspot - len( cword ) ), cword[ 0 ], doc )
                        if i != -1:
                            self.addPosition( i , ctokens[ 2 ][ 0 ], doc )
                        
                        cword += addon
                        if i == -1:
                            beginspot = len( data ) + 1 
                        else:
                            beginspot += len( addon ) -1
                            spot += len( addon ) -1     
                        yield cword
                        cword = ""
                        continue
                    self.addPosition( ( beginspot - len( cword ) ), cword[ 0 ], doc )
                    cword = ""
                elif not z.isalnum():
                    yield cword
                    if not self.ispossiblecomment( z, ctokens ):
                        yield z
                        cword = ""
                        continue
                    else:
                        cword = ""
                        
                    
                cword += z
                
            if not ignore:       
                yield cword   
        #@-node:zorcanda!.20051025122824:tokenizer
        #@+node:zorcanda!.20051025224115:sortp
        def sortp( self, a, b ):
            offset1 = a[ 0 ].getOffset()
            offset2 = b[ 0 ].getOffset()
            if offset1 > offset2: return 1
            elif offset1 < offset2: return -1
            return 0
        #@nonl
        #@-node:zorcanda!.20051025224115:sortp
        #@+node:zorcanda!.20051025224115.1:addPosition
        def addPosition( self, i, c, doc ):
            ok = True
            #oset = z[ 0 ].getOffset()
            #start = java.lang.System.currentTimeMillis()
            for z in copy.copy( self.positions ):
                oset = z[ 0 ].getOffset()
                c2 = z[ 1 ]
                if i == oset and c2 == c:
                    ok = False
                    break
                elif i == oset and c2 != c:
                    self.positions.remove( z )
            if ok:
                data2 = ( doc.createPosition( i ), c )
                self.positions.append( data2 )
                
            #end = java.lang.System.currentTimeMillis()
            #print "pos add: %s" % ( end - start )
        #@nonl
        #@-node:zorcanda!.20051025224115.1:addPosition
        #@+node:zorcanda!.20051025225720:color
        def color2( self, spot, c_atts, doc, bsas ):
        
            for z in c_atts:
                size = len( z[ 0 ] )
                #print "COLOR:'%s', %s, '%s', %s" % (z[ 0 ], self.spot, self.doc.getText( self.spot, size ) , size )
                sas = z[ 1 ]
                if not sas: sas = bsas
                try:
                    cs = doc.getCharacterElement( spot )
                    ce = doc.getCharacterElement( spot + size -1 )
                    if sas != "p" and not ( cs.getAttributes().isEqual( sas ) and ce.getAttributes().isEqual( sas ) ):
                        doc.setCharacterAttributes( spot, size, sas , 1 )
                    #else:
                    #    print "pass %s" % sas
                except java.lang.Exception:
                    pass
                spot += size
        #@nonl
        #@-node:zorcanda!.20051025225720:color
        #@+node:zorcanda!.20051026120723:ispossiblecomment
        def ispossiblecomment( self, word, comments ):
            
            #print word, comments
            for z in comments:
                if z:
                    if z.startswith( word ): return True
                
            return False
            
        def iscomment( self, word, comments ):
            
            for z in comments:
                if z:
                    if word.startswith( z ): return True
        
            return False
        #@nonl
        #@-node:zorcanda!.20051026120723:ispossiblecomment
        #@-others
            
            
    #@-node:zorcanda!.20051024203647:colorizer
    #@-others
    
#@-node:zorcanda!.20051024202308:@thin JyLeoColorizer.py
#@-leo
