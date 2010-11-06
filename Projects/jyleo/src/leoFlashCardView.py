#@+leo-ver=4-thin
#@+node:zorcanda!.20050617104319:@thin leoFlashCardView.py
#@@language python

import javax.swing as swing
import java
import leoPlugins
from utilities.WeakMethod import WeakMethod

class FlashCardView:
    '''A class that takes a node and turns its children into flashcards.
       It processes the nodes like so: even numbered children are questions,
       odd numbered children are answers.  If there is a question without an answer
       it does not get added to the FlashCard stack.  Each node-question-answer,
       has its tree written into one text body.  Hence if there are complicated
       structures of text that are best stored in tree form, the user can do so''' 
    
    def __init__( self, c , frame):
        
        self.c = c
        self.parent = frame
        self.gui = self.createGui()
        frame.add( self.gui )
        self.cards = self.createFlashCardStack()
        if self.cards:
            self.current_card = self.cards[ 0 ]
            self.question( None )
        else:
            self.current_card =  self.QA( "", "" )
            
        self.checkValidActions()
        wm1 = WeakMethod( self, "sync" )
        leoPlugins.registerHandler( "select1" , wm1  )
    
    #@    @+others
    #@+node:zorcanda!.20050617104319.1:createGui
    def createGui( self ):
        
        jp = swing.JPanel( java.awt.BorderLayout() )
        self.jtp = jtp = swing.JEditorPane( "text/html", "" , editable = 0 )
        self.jsp = jsp = swing.JScrollPane( jtp )
        jb = self.jsp.getBorder()
        self.tb = tb = swing.border.TitledBorder( jb )
        self.tb2 = tb2 = swing.border.TitledBorder( tb, "", tb.CENTER, tb.BOTTOM )
        self.jsp.setBorder( self.tb2 )
        jp.add( jsp )
        jp2 = swing.JPanel()
        
        self.label = swing.JLabel()    
        self._question = question = swing.JButton( "Question" )
        question.actionPerformed = self.question
        self._answer = answer = swing.JButton( "Answer" )
        answer.actionPerformed = self.answer
        self._back = back = swing.JButton( "Back" )
        back.actionPerformed = self.back
        self._next = next = swing.JButton( "Next" )
        next.actionPerformed = self.next
        for z in ( question, answer, back, next ):
            jp2.add( z )
            
        jp.add( jp2, java.awt.BorderLayout.SOUTH )
        return jp
    #@-node:zorcanda!.20050617104319.1:createGui
    #@+node:zorcanda!.20050617104422:buttonActions
    def question( self, event ):
        
        txt = self.current_card.q
        self.jtp.setText( txt )
        self.jtp.setCaretPosition( 0 ) 
        self.checkValidActions()
        self.setQuestionLabel()
    
    def answer( self, event ):
        
        txt = self.current_card.a
        self.jtp.setText( txt )
        self.jtp.setCaretPosition( 0 )
        self.checkValidActions()
        self.setAnswerLabel()
    
    def back( self, event ):
        
        i = self.cards.index( self.current_card )
        i = i -1
        self.current_card = self.cards[ i ]
        #self.checkValidActions()
        self.question( event )
    
    def next( self, event ):
        
        i = self.cards.index( self.current_card )
        i = i + 1
        self.current_card = self.cards[ i ]
        self.question( event )
    #@-node:zorcanda!.20050617104422:buttonActions
    #@+node:zorcanda!.20050617105050:createFlashCardStack
    def createFlashCardStack( self ):
        
        c = self.c
        cp = c.currentPosition()
        self.tb.setTitle( cp.headString() )
        stack = []
        at = c.atFileCommands
        for z in cp.children_iter( copy = 1 ):
            at.write(z.copy(),nosentinels=True,toString=True,scriptWrite=True)
            data = "<pre>%s</pre>" % at.stringOutput
            stack.append( data )
    
        stack2 = []
        stack.reverse()
        if not ( len( stack ) >= 2 ) : return stack2 
        for z in xrange( len( stack )/2 ):
            question = stack.pop()
            answer = stack.pop()
            stack2.append( self.QA( question, answer ) )
        
        return stack2
        
            
    #@nonl
    #@-node:zorcanda!.20050617105050:createFlashCardStack
    #@+node:zorcanda!.20050617105330:checkValidActions
    def checkValidActions( self ):
        
        if self.cards:
            io = self.cards.index( self.current_card )
            cl = len( self.cards )
            if io == 0:
                self._back.setEnabled( 0 )
            else:
                self._back.setEnabled( 1 )
            
            if io == cl - 1:
                self._next.setEnabled( 0 )
            else:
                self._next.setEnabled( 1 )
                
            self._question.setEnabled( 1 )
            self._answer.setEnabled( 1 )
            
        
        else:
            for z in ( self._question, self._answer, self._back, self._next ):
                z.setEnabled( 0 )
        
    #@nonl
    #@-node:zorcanda!.20050617105330:checkValidActions
    #@+node:zorcanda!.20050617161037:sync
    def sync( self, arg = None, arg2 = None, force = 0, *args ):
        
        
        if not self.jtp.isShowing() and not force:
                return
              
        self.cards = self.createFlashCardStack()
        if self.cards:
            self.current_card = self.cards[ 0 ]
        self.checkValidActions()
        self.question( None )
        self.gui.repaint()
    #@nonl
    #@-node:zorcanda!.20050617161037:sync
    #@+node:zorcanda!.20050617173737:setQuestionLabel
    def setQuestionLabel( self ):
        
        if not self.cards:
            self.tb2.setTitle( "" )
        else:
            i = self.cards.index( self.current_card ) + 1
            if self.tb2.getTitle() == "":
                self.jsp.revalidate()
            self.tb2.setTitle( "Question #%s of %s" %( i, len( self.cards ) ) )
        self.jsp.repaint()
        
    def setAnswerLabel( self ):
        
        if not self.cards:
            self.tb2.setTitle( "" )
        else:
            i = self.cards.index( self.current_card ) +1
            if self.tb2.getTitle() == "":
                self.jsp.revalidate()
            self.tb2.setTitle( "Answer #%s of %s" %( i, len( self.cards ) ) )
        self.jsp.repaint()
    #@nonl
    #@-node:zorcanda!.20050617173737:setQuestionLabel
    #@+node:zorcanda!.20050617180419:class QA
    class QA:
        
        def __init__( self, q, a ):
            self.q = q
            self.a = a
    #@nonl
    #@-node:zorcanda!.20050617180419:class QA
    #@-others

#@-node:zorcanda!.20050617104319:@thin leoFlashCardView.py
#@-leo
