#@+leo-ver=4-thin
#@+node:zorcanda!.20050518163508:@thin leoCompositeView.py
#@@language python

import java
import javax.swing as swing
import javax.swing.text as text
import javax.swing.event as sevent
import java.util.regex as regex
import leoSwingUndo
import SwingMacs 
import leoPlugins
import time
from utilities.WeakMethod import WeakMethod



class CompositeView( java.awt.event.FocusListener, sevent.UndoableEditListener ):
    '''A Class that takes a node and formats the subtree of the
    current node into a recursive widget, composed of editors within
    editors, within editors, within editors, etc... '''
    
    def __init__( self, c , parent = None ):
        
        self.c = c
        self.parent = parent
        p = c.currentPosition()
        self.p = p
        self.ignore_insert = 0
        self.pattern = pattern = java.util.regex.Pattern.compile( "<"+"<" + "[^<>]*" + ">"+">" )
        
        self.jtp = jtp = swing.JTextPane()
        #self.jtp.addFocusListener( self )
        jtf = swing.JTextField()
        mlabel = swing.JLabel()
        jp = swing.JPanel( java.awt.BorderLayout() )
        jp.add( mlabel, java.awt.BorderLayout.WEST )
        jp.add( jtf, java.awt.BorderLayout.CENTER)
        
        self.swingmacs = SwingMacs.SwingMacs( jtp, jtf, mlabel, p.c )
        self.swingmacs.kcb.addTabForColon( 1 )
        self._nodesyncher = self.NodeSyncher( p.copy(), jtp, self.swingmacs, self )
        doc = jtp.getDocument()      
        doc.addDocumentListener( self._nodesyncher )  
        bt = p.bodyString()
        if bt == "":
            bt = " "
            p.v.t._bodyString.insert( 0, bt )
        self._nodesyncher.ignore = 1
        self.ignore_insert = 1
        jtp.setText( bt )
        self._nodesyncher.ignore = 0
        #s = time.time()
        self.scanNode( p, jtp )
        self.ignore_insert = 0
        #s2 = time.time()
        #print "Time was %s" %( s2 - s )
        jtp.setCaretPosition( 0 )
        jsp = swing.JScrollPane( jtp )
        if parent:
            parent.add( jsp )
            parent.add( jp, java.awt.BorderLayout.SOUTH )
        else:
            jf = swing.JFrame()
            cp = jf.getContentPane()
            cp.setLayout( java.awt.BorderLayout() )
            cp.add( jsp )
            #jtf = swing.JTextField()
            cp.add( jp, java.awt.BorderLayout.SOUTH )
            jf.pack()
            jf.visible = 1
        
        wm1 = WeakMethod( self, "sync" )
        leoPlugins.registerHandler( "select1" , wm1 )
    
    def focusGained( self, event ):
        return
        self.p = p = self.c.currentPosition()
        bs = self.jtp.getText()
        #bs2 = p.bodyString()
        bs2 = p.v.t.bodyString
        if not bs == bs2:
            if bs2 == "":
                bs2 = " "
                p.v.t._bodyString.insert( 0, bs2 )
            self._nodesyncher.ignore = 1
            doc = self.jtp.getDocument()
            self.jtp.setText( bs2 )
            self._nodesyncher.ignore = 0 
            #self.jtp.setText( bs2 )
            #s = time.time()
            self.scanNode( p, self.jtp )
            #s2 = time.time()
            self.jtp.setCaretPosition( 0 )
            #print "fg Time was %s" % ( s2 - s )
        
    def focusLost( self, event ):
        pass
    
    def sync( self , arg = None, arg2 = None ,force = 0, *args):
        
        if not self.jtp.isShowing() and not force:
            return
        
        self.c.frame.body._current_editor = self.jtp
        p = self.c.currentPosition()
        self._nodesyncher.p = p
        self.p = p
        jtp = self.jtp
        bt = p.bodyString()
        if bt == "":
            bt = " "
        #doc = jtp.getDocument()
        #doc.remove( 0, doc.getLength() )
        
        self._nodesyncher.ignore = 1
        jtp.setText( bt )       
        self.scanNode( p, jtp )        
        jtp.setCaretPosition( 0 )
        self._nodesyncher.ignore = 0
        
                          
    #@    @+others
    #@+node:zorcanda!.20050518172249:class NodeSyncher
    class NodeSyncher( swing.event.DocumentListener, java.awt.event.FocusListener ):
        
        def __init__( self, p, widget, swingmacs, cv ):
            self.p = p
            self.widget = widget
            self.swingmacs = swingmacs
            widget.addFocusListener( self )
            self.cv = cv
            self.ignore = 0
            #widget.getDocument().addUndoableEditListener( cv )
            
        def changedUpdate( self, event ):
            pass
        
        def insertUpdate( self, event ):
            
            self.sync( event )
            
        def removeUpdate( self, event ):
        
            self.sync( event, which = 0 )
    
        def sync( self, event, which = 1 ):
            
            if self.ignore:
                return
        
            doc = event.getDocument()
            t = self.p.v.t
            offset = event.getOffset()
            length = event.getLength()
            c = self.p.c
            if which:
                txt = doc.getText( offset, length )
                print "ADDING TO TNODE!"
                t._bodyString.insert( offset, txt )
                dec_edit = leoSwingUndo.UndoableDocumentEvent( c, event, txt, p = self.p )
                c.undoer.addUndo( dec_edit )
            else:
                print "REMOVING FROM TNODE!"
                txt = t.bodyString[ offset : offset + length ]
                t._bodyString.delete( offset, offset + length )
                dec_edit = leoSwingUndo.UndoableDocumentEvent( c, event, txt, p = self.p )
                c.undoer.addUndo( dec_edit )
            
            
        def focusGained( self, event ):
            
            self.swingmacs.editor = self.widget
            self.p.c.frame.body._current_editor = self.widget
            
        
        def focusLost( self, event ):
            pass
    #@nonl
    #@-node:zorcanda!.20050518172249:class NodeSyncher
    #@+node:zorcanda!.20050518173335.1:def scanNode
    def scanNode( self, p, jtp  ):
    
        others, sections = self.divide( p.children_iter( copy = True ) )    
        rejects = self.addSectionReferences( p, jtp, sections )
        others.extend( rejects )
        self.addOthers( p, jtp, others )
    
    
                
    
               
    
    #@-node:zorcanda!.20050518173335.1:def scanNode
    #@+node:zorcanda!.20050607134632:def addSectionReferences
    def addSectionReferences( self, parent, editor, sec_references ):
        
        pstring = parent.bodyString()
        rejects = []
        for z in sec_references:
            hs = z.headString().strip()
            spot = pstring.find( hs )
            if spot != -1:
                jp = swing.JPanel( java.awt.BorderLayout() )
                jp.setOpaque( 0 )
                jb = swing.JCheckBox()
                jb.setToolTipText( "hide/show" )
                jb.setOpaque( 0 )
                jb.setSelected( 1 )
                jp.add( jb, java.awt.BorderLayout.NORTH )
                jtp = swing.JTextPane()
                jp.add( jtp )
                jb.actionPerformed = lambda event, jtp = jtp, jp = jp: self.add_remove( jtp, jp )
                jtp.addKeyListener( self.swingmacs.kcb )
                doc = jtp.getDocument()
                jtp.setText( z.bodyString() )
                doc.addDocumentListener( self.NodeSyncher( z.copy(), jtp, self.swingmacs, self ) )
                self.addBorder( jp, z.headString() )
                #jtp.setText( z.bodyString() )
                self.scanNode( z, jtp )
                sas = text.SimpleAttributeSet()
                text.StyleConstants.setComponent( sas, jp )
                doc = editor.getDocument()
                doc.setCharacterAttributes( spot, len( hs ), sas, 1 )
                #self.scanNode( z, jtp )
            else:
                rejects.append( z )
        return rejects
    #@nonl
    #@-node:zorcanda!.20050607134632:def addSectionReferences
    #@+node:zorcanda!.20050607134632.1:def addOthers
    def addOthers( self, parent, editor, others ):
        
        if others:
            bs = parent.bodyString()
            spot = bs.find( "@" + "others" )
            whitespace = 0
            if spot == -1 and bs.strip() == "":
                spot = 0
                #if len( bs ) == 0:
                #    bs = " "
                #    #editor.setText( bs )
                whitespace =1
                            
            if spot != -1:
                opanel = swing.JPanel( java.awt.BorderLayout() )
                jp = swing.Box.createVerticalBox()
                jp.setOpaque( 0 )
                opanel.setOpaque( 0 )
                jcb = swing.JCheckBox( "@others" )
                jcb.setToolTipText( "hide/show" )
                jcb.setOpaque( 0 )
                jcb.setSelected( 1 )
                opanel.add( jcb, java.awt.BorderLayout.NORTH )
                opanel.add( jp )
                jcb.actionPerformed = lambda event, jp = jp, opanel = opanel: self.add_remove( jp, opanel )
                sas = text.SimpleAttributeSet()
                text.StyleConstants.setComponent( sas, opanel )
                #doc = editor.getDocument()
                #if not whitespace:
                #    doc.setCharacterAttributes( spot, 7, sas, 1 )
                #else:
                #    doc.setCharacterAttributes( spot, 1, sas , 1 )
                for z in others:
                    jp2 = swing.JPanel( java.awt.BorderLayout() )
                    jp2.setOpaque( 0 )
                    jb = swing.JCheckBox()
                    jb.setToolTipText( "hide/show" )
                    jb.setOpaque( 0 )
                    jb.setSelected( 1 )
                    jp2.add( jb, java.awt.BorderLayout.NORTH )
                    tp = swing.JTextPane()
                    jb.actionPerformed = lambda event, tp = tp, jp2 = jp2: self.add_remove( tp, jp2 )    
                    jp2.add( tp )
                    tp.addKeyListener( self.swingmacs.kcb )
                    bs = z.bodyString()
                    if bs == "":
                        bs = " "
                        p.v.t._bodyString.insert( 0, bs )
                    tp.setText( bs )
                    doc = tp.getDocument()            
                    doc.addDocumentListener( self.NodeSyncher( z.copy(), tp, self.swingmacs, self ) )
                    self.addBorder( jp2, z.headString() )
                    bs = z.bodyString()
                    jp.add( jp2 )
                    self.scanNode( z, tp )
                
                doc = editor.getDocument()
                if not whitespace:
                    doc.setCharacterAttributes( spot, 7, sas, 1 )
                else:
                    doc.setCharacterAttributes( spot, 1, sas , 1 )
    #@-node:zorcanda!.20050607134632.1:def addOthers
    #@+node:zorcanda!.20050607134106:def divide
    def divide( self, children_iterator ):
        
        others = []
        sections = []
        for z in children_iterator:
            hs = z.headString()
            matcher = self.pattern.matcher( java.lang.String( hs ) )
            if matcher.matches():
                    sections.append( z )
            else:
                others.append( z )
            
        
        return others, sections
    #@nonl
    #@-node:zorcanda!.20050607134106:def divide
    #@+node:zorcanda!.20050607210840:def addBorder
    def addBorder( self, widget, title ):
        
        lborder = swing.border.LineBorder( java.awt.Color.RED )
        tborder = swing.border.TitledBorder( lborder, title )
        widget.setBorder( tborder )    
    #@-node:zorcanda!.20050607210840:def addBorder
    #@+node:zorcanda!.20050607213508:def add_remove
    def add_remove( self, widget1, widget2 ):
        '''this method enables the code folding'''
        if widget1.getParent() == None:
            widget2.add( widget1 )
        else:
            widget2.remove( widget1 )
    #@nonl
    #@-node:zorcanda!.20050607213508:def add_remove
    #@+node:zorcanda!.20050830131808:UndoableEditListener
    def undoableEditHappened( self, event ):
        
        if self.ignore_insert: return
        c = self.c
        cp = c.currentPosition().copy()
        edit = event.getEdit()
        #dec_edit = leoSwingUndo.UndoableEditDecorator( c, cp, edit )
        #c.undoer.addUndo( dec_edit )
        
        #undoType = "undo_edit_class"
        #c.undoer.setUndoTypingParams(p,undoType,oldText,newText,oldSel,newSel,oldYview=oldYview)
    #@-node:zorcanda!.20050830131808:UndoableEditListener
    #@-others
            
        
        
            
#@nonl
#@-node:zorcanda!.20050518163508:@thin leoCompositeView.py
#@-leo
