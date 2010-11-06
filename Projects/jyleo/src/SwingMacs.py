#@+leo-ver=4-thin
#@+node:orkman.20050207150858:@thin SwingMacs.py
from __future__ import generators
import javax.swing as swing
import javax.swing.event as sevent
import javax.swing.text as stext
import java.awt.event as aevent
import java.util.regex as regex
import java.awt as awt
import java.lang 
import java.io
import string    
import re 
import copy
import leoGlobals as g
from utilities.DefCallable import DefCallable
from utilities.Slider import Slider
from utilities.WeakMethod import WeakMethod
import weakref
import leoLanguageManager
import LeoUtilities



True =1
False = 0
extensions = None

#@<< addCommand >>
#@+node:zorcanda!.20050313115453:<< addCommand >>
def addCommand(  name, command ):
    commandsFromPlugins[ name ] = command
    

#@-node:zorcanda!.20050313115453:<< addCommand >>
#@nl

class BaseCommand:
    pass 
    
class Information:
    def __init__( self, name, doc ):
        self.name = name
        self.doc = doc
        self.subinfos = []
        
    def addInformation( self, info ):
        self.subinfos.append( info )
        
    def infoToString( self ):
        
        format = "%s\n\t%s\n"
        strings = []
        first = format % ( self.name, self.doc )
        strings.append( first )
        for z in self.subinfos:
            n = format % ( z.name, z.doc )
            strings.append( n )
        return "".join( strings )
        

class SwingMacs:
    '''A class that adds Emac derived commands and keystrokes to a JTextPane'''    
        
        
    #@    @+others
    #@+node:orkman.20050210125253:What is SwingMacs?
    #@+at
    # The answer is simple: SwingMacs is a component of the jython Leo port.  
    # It is derived from the CPython
    # Leo plugins temacs and usetemacs.  Though it would be wonderful just to 
    # use those plugins, they
    # were targeted at the Tk and its Text widget( hence the 't' in temacs ).  
    # The two technologies are different enough to warrent
    # a new implementation.  Though as much reuse as possible is going to be 
    # attempted.  The implementation strategy is:
    #     1. Copy and Paste a node from temacs into SwingMacs.
    #     2. Analyze the node and begin the transition to Java/Jython/Swing.
    # Tags being absent from the JTextPane leads to the emulation of Tags 
    # through character Attributes.  The main
    # SwingMacs Emacs object shall contain these tag emulator methods.  The 
    # developer should not have to think in Attributes
    # when implementing a method that needs the simplicity of tags.  He will 
    # be able to use the SwingMacs virtual tag
    # methods -- tags whose only existence is in a concept.
    # 
    # 
    #@-at
    #@@c
    #@nonl
    #@-node:orkman.20050210125253:What is SwingMacs?
    #@+node:zorcanda!.20060110143053:symtable
    symtable ={
    'home':'home',
    'shift end':'1',
    'shift right':'6',
    'shift shift':'?',
    'tab':'tab',
    'num lock':'num lock',
    'shift semicolon':':',
    'shift comma':'<',
    'f9':'f9',
    'f8':'f8',
    'minus':'-',
    'f7':'f7',
    'f6':'f6',
    'f5':'f5',
    'f4':'f4',
    'f3':'f3',
    'f2':'f2',
    'f1':'f1',
    'enter':'enter',
    'shift page down':'3',
    'down':'?',
    'semicolon':';',
    'numpad /':'/',
    'caps lock':'?',
    'numpad -':'numpad -',
    'numpad +':'numpad +',
    'numpad *':'numpad *',
    'shift back slash':'|',
    'scroll lock':'?',
    'back slash':'\\',
    'begin':'?',
    'shift back quote':'~',
    'equals':'=',
    'back quote':'`',
    'page down':'page down',
    'z':'z',
    'y':'y',
    'x':'x',
    'insert':'?',
    'shift close bracket':'}',
    'w':'w',
    'v':'v',
    'print screen':'print screen',
    'u':'u',
    't':'t',
    'shift slash':'?',
    's':'s',
    'r':'r',
    'q':'q',
    'p':'p',
    'o':'o',
    'shift quote':'"',
    'n':'n',
    'up':'up',
    'm':'m',
    'l':'l',
    'k':'k',
    'j':'j',
    'i':'i',
    'end':'end',
    'h':'h',
    'g':'g',
    'f':'f',
    'e':'e',
    'd':'d',
    'c':'c',
    'b':'b',
    'shift home':'7',
    'a':'a',
    'left':'left',
    'shift 9':'(',
    'shift 8':'*',
    'shift 7':'&',
    'shift 6':'^',
    'shift 5':'%',
    'shift 4':'$',
    'shift 3':'#',
    'shift 2':'@',
    'right':'right',
    'shift 1':'!',
    'shift open bracket':'{',
    'shift 0':')',
    'pause':'pause',
    'f12':'f12',
    'f11':'f11',
    'period':'.',
    'f10':'f10',
    'space':'space',
    'comma':',',
    'shift equals':'+',
    'shift minus':'_',
    '9':'9',
    '8':'8',
    'shift down':'2',
    '7':'7',
    '6':'6',
    '5':'5',
    'shift backspace':'backspace',
    '4':'4',
    '3':'3',
    '2':'2',
    '1':'1',
    '0':'0',
    'shift up':'8',
    'page up':'page up',
    'shift begin':'5',
    'backspace':'backspace',
    'delete':'delete',
    'open bracket':'[',
    'shift period':'>',
    'slash':'/',
    'escape':'escape',
    'shift page up':'9',
    'quote':"'",
    'close bracket':']',
    'shift left':'4',
    }
    #@-node:zorcanda!.20060110143053:symtable
    #@+node:orkman.20050213110948:constructor: __init__
    def __init__( self, editor, minibuffer, commandlabel, c , extracommands = None ):
        global extensions
        if extensions == None:
            x = self.lookForExtensions()
            extensions = x
            
        self.editor = editor
        self.minibuffer = minibuffer
        self.commandlabel = commandlabel
        self.c = c
        #self.modeStrategies = []
        self.kbdquit_command = None
        self.defineStrategyObjects()
        self.defineStrategiesForKeystrokes()
        
        self.kcb = self.KeyProcessor( self )
        self.editor.addKeyListener( self.kcb )
        #if g.app.config.getBool( c, "complete_tags" ):
        tm = self.TagMatcher( self )
        self.editor.addKeyListener( tm )
        
        self._stateManager = self.stateManager( self )
        self._stateManager2 = self.stateManager( self )
        self.command_help = []
        self.keystroke_help = []
        self.addCompleters()
        self.block_moving = 0
        
    
            
    #@nonl
    #@-node:orkman.20050213110948:constructor: __init__
    #@+node:zorcanda!.20050604091242:management listening
    #@+others
    #@+node:zorcanda!.20050604091242.1:addCompleters
    def addCompleters( self ):
        
        manager = g.app.config.manager
        wm1 = WeakMethod( self, "managementListener" )
        manager.addNotificationDef( "complete-<", wm1 )
        manager.addNotificationDef( "complete-(", wm1 )
        manager.addNotificationDef( "complete-[", wm1 )
        manager.addNotificationDef( "complete-{", wm1 )
        manager.addNotificationDef( "complete-'", wm1 )
        manager.addNotificationDef( 'complete-"', wm1 ) 
    
    #@+at
    #     if config.getBool( self.c, "complete-<" ):
    #         self.swingmacs.addCompleter( "<", ">" )
    #     if config.getBool( self.c, "complete-(" ):
    #         self.swingmacs.addCompleter( "(", ")" )
    #     if config.getBool( self.c, "complete-[" ):
    #         self.swingmacs.addCompleter( "[", "]" )
    #     if config.getBool( self.c, "complete-{"):
    #         self.swingmacs.addCompleter( "{", "}" )
    #     if config.getBool( self.c, "complete-'" ):
    #         self.swingmacs.addCompleter( "'", "'" )
    #     if config.getBool( self.c, 'complete-"' ):
    #         self.swingmacs.addCompleter( '"', '"' )
    #     if config.getBool( self.c, "add_tab_for-:" ):
    #         self.swingmacs.addTabForColon( True )
    #@-at
    #@-node:zorcanda!.20050604091242.1:addCompleters
    #@+node:zorcanda!.20050604091242.2:managementListener
    def managementListener( self, notification= None, handback = None ):
        
        source = notification.getSource().toString()
        source = source.lstrip( "MBean:name=" )
        use = g.app.config.getBool( self.c, source )
        completer = source[ -1 ]
        if use:
            completions = {
                '(': ')',
                '{': '}',
                '<': '>',
                '[':']',
                '"': '"',
                "'" : "'",        
            }
            self.kcb.addCompleter( completer, completions[ completer ] )
        else:
            self.kcb.removeCompleter( completer )
            
    #@-node:zorcanda!.20050604091242.2:managementListener
    #@-others
    #@-node:zorcanda!.20050604091242:management listening
    #@+node:zorcanda!.20050313142453:lookForExtensions
    def lookForExtensions( self ):
    
        import sys   
        
        path,file = g.os_path_split( g.app.loadDir )
        try:    
            tlevel = java.io.File( path )
            directories = tlevel.listFiles()
            exts = []
            for z in directories:
                if z.isDirectory() and z.getName() == 'swingmacs_exts':
                
                    sys.path.append( z.getAbsolutePath() )
                    files = z.listFiles()
                    for z1 in files:
                        if z1.isFile() and z1.getName().endswith( '.py' ):
                            exts.append( z1 ) 
                
                    break
        finally:
            pass
                
        
        mods = []
        for z in exts:
            try:
                name = z.getName()
                name = name[ : -3 ]
                mod = __import__( name )
                mods.append( mod )
                
            finally:
                pass
                
        return mods        
            
            
            
                  
        
    #@nonl
    #@-node:zorcanda!.20050313142453:lookForExtensions
    #@+node:zorcanda!.20050411132825:addCompleter
    def addCompleter( self, ch, ch2 ):
        self.kcb.addCompleter( ch, ch2 )
        
    
    def addTabForColon( self, torf ):
        self.kcb.addTabForColon( torf )
    #@nonl
    #@-node:zorcanda!.20050411132825:addCompleter
    #@+node:zorcanda!.20050314142845:How to write an extension( alpha doc level )
    #@+at
    # An extension is defined like so:
    # 1. a function called:
    #     getCommands()
    # returns a dictionary of command names and command classes, an example:
    #     return {  "j-library": JLibrary_Loc }
    # this in turn causes an instance of the command class to be instatiated.
    # Instantiation involves passing the emacs instance to the command via
    # the costructor
    # 
    #     returned_dict[ "akey" ]( self )   #self is the emacs instance
    # 
    # the instance is then asked for new commands via a call to its 
    # 'addToAltX' method,
    # which returns a list of commands:
    #     return [ 'zoom-to-home', 'release-window' ]
    # after this the command is queried to see if it has an 'addToKeyStrokes' 
    # method.  If so
    # it is called.  This is to return keystrokes that activate the command:
    #     return [ 'Ctrl W', ]
    # all commands and keystrokes that are bound to the command object result 
    # in a call to
    # its __call__ method which should be defined like so:
    #     def __call__( self, event, command ):
    #         ....code....
    # 
    #@-at
    #@-node:zorcanda!.20050314142845:How to write an extension( alpha doc level )
    #@+node:orkman.20050213110511:helper classes
    #@+others
    #@+node:orkman.20050207162016:stateManager
    class stateManager:
        
        def __init__( self, emacs):
            self.state = None
            self.emacs = emacs
            
            
        def hasState( self ):
            return self.state
            
        def setState( self, state ):
            self.state = state
            
        def filterTo( self, event, command ):
            #return self.emacs.strategyObjects[ self.state ]( event, command )
            return self.state( event, command )
            
        def clear( self ):
            self.state = None
            
            
    #@nonl
    #@-node:orkman.20050207162016:stateManager
    #@+node:orkman.20050213105021:KeyProcessor  -- KeyListener calls and newline analyzer
    class KeyProcessor( aevent.KeyListener ):
    
        #@    @+others
        #@+node:orkman.20050213105021.1:__init__
        def __init__( self, emacs ):
            self.emacs = emacs
            self.kRconsume = False
            self.kTconsume = False
            self.completers = {}
            self.tab_for_colon = False  
            self.tab_width = g.app.config.getInt( emacs.c, "tab_width" )
            import leoPlugins
            wm1 = WeakMethod( self, "newNodeSelected" )
            leoPlugins.registerHandler( "select1", wm1 )
            self.block_moving = 0
            
        #@nonl
        #@-node:orkman.20050213105021.1:__init__
        #@+node:zorcanda!.20050411132747:addCompleter
        def addCompleter( self, ch, ch2 ):
            self.completers[ ch ] = ch2
        
        def addTabForColon( self, torf ):
            self.tab_for_colon = torf
            
        #@nonl
        #@-node:zorcanda!.20050411132747:addCompleter
        #@+node:zorcanda!.20050604091924:removeCompleter
        def removeCompleter( self, ch ):
            del self.completers[ ch ]
        #@-node:zorcanda!.20050604091924:removeCompleter
        #@+node:orkman.20050213105021.2:keyReleased
        def keyReleased( self,event ):
            if self.kRconsume:
                self.kRconsume = False
                event.consume()
        #@nonl
        #@-node:orkman.20050213105021.2:keyReleased
        #@+node:orkman.20050213105021.3:keyTyped
        def keyTyped( self, event ):
            if self.kTconsume:
                self.kTconsume = False
                event.consume()
        #@nonl
        #@-node:orkman.20050213105021.3:keyTyped
        #@+node:orkman.20050213105021.4:keyPressed
        def keyPressed( self, event ):
             
            modifiers = event.getModifiers()
            mtxt = event.getKeyModifiersText(modifiers)
            mtxt = self.mungeModifiers(mtxt)
            ktxt = event.getKeyText(event.getKeyCode())
            if ktxt:
                ktxt = ktxt.lower()
                if event.isShiftDown():
                    ktxt = "shift %s" % ktxt
                if SwingMacs.symtable.has_key(ktxt):
                    ktxt = SwingMacs.symtable[ktxt]
            kc = event.getKeyChar()
            if mtxt == ktxt:
                command = mtxt
            else:
                command = '%s %s' % (mtxt, ktxt)
                command = command.strip()
            command = command.lower()
            #print "command '%s'" % command
            consume = self.emacs.masterCommand( event, command )
            #print "Consume %s %s" %( command, consume )
            if consume: #this blocks the event from going elsewhere, like the DocumentModel
                self.kTconsume = True
                self.kRconsume = True
                event.consume()
                return
            else:
                self.kTconsume = self.kRconsume = False
            
            kc = event.getKeyChar()
            
            stxt = self.emacs.editor.getSelectedText()
            if stxt:
                #@        <<attempt block movement>>
                #@+node:zorcanda!.20050907102256:<<attempt block movement>>
                if java.lang.Character.isWhitespace( kc ) and kc != '\n':
                    if kc == '\t' and self.tab_width == -4:
                        kc = " " * 4
                    txt = stxt.split( "\n" )
                    ntxt = []
                    for z in txt:
                        ntxt.append( "%s%s" % ( kc, z ) )
                    ntxt = "\n".join( ntxt )
                    start = self.emacs.editor.getSelectionStart()
                    self.emacs.block_moving = start
                    self.emacs.startCompounding( "Block Move Forward" )
                    self.emacs.editor.replaceSelection( ntxt )
                    self.emacs.stopCompounding()
                    #self.emacs.block_moving = 0
                    event.consume()
                    self.kTconsume = self.kRconsume = True
                    self.emacs.editor.select( start, start + len( ntxt ) )
                    return
                elif command == "delete":
                    event.consume(); self.kTconsume = self.kRconsume = True
                    self.emacs.editor.replaceSelection( "" )
                    self.emacs.keyboardQuit()
                    return
                elif command == "backspace":
                    txt = stxt.split( "\n" )
                    ok = 1
                    for z in txt:
                        if not z or not java.lang.Character.isWhitespace( z[ 0 ] ):
                            ok = 0
                            break
                            
                    event.consume()
                    self.kTconsume = self.kRconsume = True
                    if ok:
                        ntxt = []
                        for z in txt:
                            ntxt.append( z[ 1 : ] )
                        ntxt = "\n".join( ntxt )
                        start = self.emacs.editor.getSelectionStart()
                        self.emacs.block_moving = start
                        self.emacs.startCompounding( "Block Move Back" )
                        self.emacs.editor.replaceSelection( ntxt )
                        self.emacs.stopCompounding()
                        #self.emacs.block_moving = 0
                        self.emacs.editor.select( start, start + len( ntxt ) )
                    return
                #@<<numpad ->>
                #@+node:zorcanda!.20051101122957:<<numpad ->>
                elif command == "numpad -":
                    editor = self.emacs.editor
                    start = editor.getSelectionStart()
                    end = editor.getSelectionEnd()
                    doc = editor.getDocument()
                    e = doc.getParagraphElement( start )
                    rstart = e.getStartOffset()
                    self.kTconsume = self.kRconsume = True
                    event.consume()
                    if rstart == 0:
                        c = self.emacs.c
                        cp = c.currentPosition()
                        p = cp.copy()
                        p = p.threadBack()
                        if p:
                            caretp = editor.getCaretPosition()
                            cstart = True
                            if caretp == end: cstart = False
                            self.emacs.startCompounding( "Block Move Up" )
                            self.emacs.block_moving = -2
                            editor.replaceSelection( "" )
                            self.emacs.stopCompounding()
                            bs = p.bodyString()
                            if bs.endswith( "\n" ):
                                nbs = "%s%s" %( bs, stxt )
                                spot = len( bs )
                            else:
                                nbs = "%s\n%s" % ( bs, stxt )
                                spot = len( bs ) + 1
                            c.selectPosition( p )
                            doc = editor.getDocument()
                            self.emacs.startCompounding( "Block Move" )
                            dlen = doc.getLength()
                            if bs.endswith( "\n" ):
                                doc.insertString( doc.getLength(), stxt, None )
                            else:
                                stxt = "%s%s" % ( "\n", stxt )
                                doc.insertString( doc.getLength(), stxt , None )
                            self.emacs.block_moving = 0
                            estart = doc.getParagraphElement( dlen + 1)
                            eend = doc.getParagraphElement( dlen + len( stxt ) )
                            if cstart:
                                editor.setCaretPosition( eend.getEndOffset() - 1 )
                                editor.moveCaretPosition( estart.getStartOffset() )
                            else:
                                editor.setCaretPosition( estart.getStartOffset() )
                                editor.moveCaretPosition( eend.getEndOffset() -1 )
                            self.emacs.stopCompounding() 
                        return
                    self.emacs.startCompounding( "Block Move Up" )
                    self.emacs.block_moving = -2
                    foldprotection = self.emacs.c.frame.body.editor.foldprotection
                    foldprotection.moveSelectionUp()
                    self.emacs.block_moving = 0
                    self.emacs.stopCompounding()
                    return
                #@nonl
                #@-node:zorcanda!.20051101122957:<<numpad ->>
                #@nl
                #@<<numpad +>>
                #@+node:zorcanda!.20051101155321:<<numpad +>>
                elif command == "numpad +":
                    editor = self.emacs.editor
                    start = editor.getSelectionStart()
                    end = editor.getSelectionEnd()
                    self.kTconsume = self.kRconsume = True
                    event.consume()
                    doc = editor.getDocument()
                    e = doc.getParagraphElement( end )
                    ep = doc.getEndPosition()
                    if e.getEndOffset() == ep.getOffset():
                        c = self.emacs.c
                        cp = c.currentPosition() 
                        p = cp.copy()
                        p = p.threadNext()
                        if p:
                            caretp = editor.getCaretPosition()
                            cstart = True
                            if caretp == end:
                                cstart = False
                            self.emacs.startCompounding( "Block Move Down" )
                            self.emacs.block_moving = -2
                            editor.replaceSelection( "" )
                            self.emacs.stopCompounding()
                            bs = p.bodyString()
                            spot = 0
                            c.selectPosition( p )
                            doc = editor.getDocument()
                            self.emacs.startCompounding( "Block Move" )
                            if bs.startswith( "\n" ):
                                doc.insertString( 0, stxt, None )
                            else:
                                stxt = "%s\n" % stxt
                                doc.insertString( 0, stxt, None ) 
                            self.emacs.block_moving = 0
                            eend = doc.getParagraphElement( len( stxt ) )
                            if cstart:
                                editor.setCaretPosition( eend.getEndOffset() - 1 )
                                editor.moveCaretPosition( 0 )
                            else:
                                editor.setCaretPosition( 0 )
                                editor.moveCaretPosition( eend.getEndOffset() -1 )
                            self.emacs.stopCompounding()
                        return
                
                    self.emacs.startCompounding( "Block Move Down" )
                    self.emacs.block_moving = -2
                    foldprotection = self.emacs.c.frame.body.editor.foldprotection
                    foldprotection.moveSelectionDown()
                    self.emacs.block_moving = 0
                    self.emacs.stopCompounding()
                
                    return
                #@nonl
                #@-node:zorcanda!.20051101155321:<<numpad +>>
                #@nl
                #@-node:zorcanda!.20050907102256:<<attempt block movement>>
                #@nl
            
            self.emacs.block_moving = -1
            editor = self.emacs.editor
            if self.tab_for_colon and kc == '\n':
                event.consume()
                self.insertPreviousLeadAndNewline()
                
            if self.completers.has_key( kc ):
                editor = self.emacs.editor
                doc = editor.getDocument()
                pos = editor.getCaretPosition()
                try:
                
                    pc = doc.getText( pos -1, 1 )
                    if pc in ( '"', "'" ): return
                
                except:
                    pass
                event.consume()
                self.kTconsume = True
                self.kRconsume = True
                ac = self.completers[ kc ]
                #editor = self.emacs.editor
                if kc in ( "'", '"' ):
                    doc.insertString( pos, '%s%s' % ( kc, ac ), None )
                    editor.setCaretPosition( pos + 1 )
                else:
                    doc.insertString( pos, '%s  %s' %( kc, ac ), None )
                    editor.setCaretPosition( pos + 2 )
                if hasattr( self.emacs.c.frame.body.editor, "autocompleter"):
                    self.emacs.c.frame.body.editor.autocompleter.hideAutoBox() 
                return
        
            #@    <<tab consumption>>
            #@+node:zorcanda!.20050907102906:<<tab consumption>>
            if kc == '\t' and self.tab_width == -4:
                self.kTconsume = True
                self.kRconsume = True
                event.consume()
                editor = self.emacs.editor
                doc = editor.getDocument()
                pos = editor.getCaretPosition()
                try:
                    
                    doc.insertString( pos, " " * 4, None )
                    return
                    
                except:
                    pass
            #@nonl
            #@-node:zorcanda!.20050907102906:<<tab consumption>>
            #@nl
            
            #@    <<attempt node movement>>
            #@+node:zorcanda!.20050907102624:<<attempt node movement>>
            #@+at
            # if command in ( "Up", "Down" ):
            #     cp = self.emacs.editor.getCaretPosition()
            #     doc = self.emacs.editor.getDocument()
            #     if command == "Up":
            #         e = doc.getParagraphElement( cp )
            #         rs = e.getStartOffset()
            #         if rs == 0:
            #             curp = self.emacs.c.currentPosition().copy()
            #             p = curp.threadBack()
            #             if p:
            #                 self.kTconsume = self.kRconsume = True
            #                 event.consume()
            #                 self.emacs.c.selectPosition( p )
            #                 self.emacs.editor.setCaretPosition( 
            # doc.getLength() )
            #     else:
            #         e = doc.getParagraphElement( cp )
            #         e2 = doc.getEndPosition()
            #         if e.getEndOffset() == e2.getOffset():
            #             curp = self.emacs.c.currentPosition().copy()
            #             p = curp.threadNext()
            #             if p:
            #                 self.kTconsume = self.kRconsume = True
            #                 event.consume()
            #                 self.emacs.c.selectPosition( p )
            #                 self.emacs.editor.setCaretPosition( 0 )
            #@-at
            #@-node:zorcanda!.20050907102624:<<attempt node movement>>
            #@nl
            
        
        #@-node:orkman.20050213105021.4:keyPressed
        #@+node:zorcanda!.20050809135627:newNodeSelected
        def newNodeSelected( self, *args ):
            
            if not self.block_moving:
                self.emacs.block_moving = -1
        #@nonl
        #@-node:zorcanda!.20050809135627:newNodeSelected
        #@+node:orkman.20050213105513:insertPreviousLeadAndNewline -- for autoindentation on newline
        def insertPreviousLeadAndNewline( self ):
            #@    << why is this code here? >>
            #@+node:orkman.20050213105513.1:<< why is this code here? >>
            '''
            Originally this was in the leoSwingBody class.  This seemed right, it is core functionaliy.  But
            In light of SwingMacs I reconsidered where it should go.  Temacs was a plugin, SwingMacs is core.
            SwingMacs is responsible for processing key presses and such, consuming them if they are not to get
            to the DocumentModel.  By placing this method in leoSwingBody, the Key processing responsibilities get
            spread out.  Hence it makes more sense to move this method here, the responsibilites stay clearer.
            '''
            #@nonl
            #@-node:orkman.20050213105513.1:<< why is this code here? >>
            #@nl
            
            editor = self.emacs.editor
            doc = editor.getDocument()
            pos = editor.getCaretPosition()
            #start_text = doc.getText( 0, pos )
            paragraph = doc.getParagraphElement( pos )
            start = paragraph.getStartOffset()
            #end = paragraph.getEndOffset()
            #ind = start_text.rfind( '\n' )
            start_text = doc.getText( start, pos - start ) # end - start )
            #ind = start_text.rfind( '\n' )
            ind = 0
        
            if ind > 0:
                line = start_text[ ind: ].strip( '\n' )
            else:
                line = start_text.strip( '\n' )
            
            i = len( line.lstrip() )
            
            if i == 0:
                    instring = line
            else:
                instring = line[ : -i ]
        
            #instring = '\n%s' % instring
            #spaces = self.calculateExtraSpaces( line.lstrip() )
            #instring = "\n%s%s" %( spaces, instring )
            instring = '\n%s' % instring
            #printspaces
            #instring = "%s%s" %( spaces, instring )
            c = self.emacs.c
            #cp = c.currentPosition().copy()
            #language = g.scanForAtLanguage( c, cp )
            LanguageManager = leoLanguageManager.LanguageManager
            language = LanguageManager.getLanguageInEffect( c )
            if LanguageManager.indenters.has_key( language ):
                matcher = LanguageManager.indenters[ language ]
                #matcher = g.indenters[ language ]
                matcher.reset( line )
                if matcher.matches():
                    if self.tab_width == -4:
                        instring += " " * 4
                    else:
                        instring += "\t"
            doc.insertString( pos, instring, None )
        #@-node:orkman.20050213105513:insertPreviousLeadAndNewline -- for autoindentation on newline
        #@+node:zorcanda!.20050522115325:calculateExtraSpaces
        def calculateExtraSpaces( self, line ):
            
            
            endsWithColon = False
            hasUncompleteBracket = False
            
            count1 = 0
            for z in line:
                if z == '[':
                    count += 1
                elif z == ']':
                    count -= 1
                    
            
            count2 = 0
            last2 = None
            ll = len( line ) -1
            while ll >= 0:
                char = line[ ll ]
                if char == '(':
                    count2 += 1
                    last2 = ll
                elif char == ')':
                    count2 -= 1
                    
                ll -= 1
                    
                    
            if count2 > 0:
                nwline = line[ : last2 ]
                ws = []
                for z in nwline:
                    if z.isspace():
                        ws.append( z )
                    else:
                        ws.append( ' ' )
                
            
                return ''.join( ws )
                
            
            return ''    
                
                
            
            
            
        
        
        #@-node:zorcanda!.20050522115325:calculateExtraSpaces
        #@+node:zorcanda!.20051101121752:swaplines
        def swaplines( self, line1s, line1e, line2s, line2e ):
            
            editor = self.emacs.c.frame.body.editor
         
            
            doc = editor.editor.getDocument()
            pos1s = doc.createPosition( line1s )
            pos1e = doc.createPosition( line1e -1 )
            line1 = doc.getText( line1s, ( line1e - line1s ) -1 )
            
            pos2s = doc.createPosition( line2s )
            pos2e = doc.createPosition( line2e -1 )
            line2 = doc.getText( line2s, ( line2e - line2s ) -1 )
        
            doc.replace( pos2s.getOffset(), pos2e.getOffset() - pos2s.getOffset(), line1, None )
            doc.replace( pos1s.getOffset(), pos1e.getOffset() - pos1s.getOffset(), line2, None )
            
            #print pos2s.getOffset(), pos1s.getOffset()
        
            
            
        #@nonl
        #@-node:zorcanda!.20051101121752:swaplines
        #@+node:zorcanda!.20060106193923:mungeModifiers
        def mungeModifiers(self, text):
            
            pieces = text.split("+")
            nwpieces = []
            for z in pieces:
                nz = z.lower()
                if nz != "shift":
                    nwpieces.append(nz)
            
            nwpieces.sort()
            return " ".join(nwpieces)
        #@nonl
        #@-node:zorcanda!.20060106193923:mungeModifiers
        #@-others
    #@-node:orkman.20050213105021:KeyProcessor  -- KeyListener calls and newline analyzer
    #@+node:zorcanda!.20050520221746:TagMatcher -- matches html/xml style tags
    class TagMatcher( aevent.KeyAdapter ):
        
        def __init__( self, emacs ):
            aevent.KeyAdapter.__init__( self )
            self.emacs = emacs 
            self.configureMatching()
            wm1 = WeakMethod( self, "configureMatching" )
            g.app.config.manager.addNotificationDef( "complete_tags", wm1 )
            
        def configureMatching( self, notification = None, handback = None ):
            
            on = g.app.config.getBool( self.emacs.c, "complete_tags" )
            self.on = on
        
        def keyPressed( self, event ):
        
            if self.on and event.getKeyChar() == ">":
                
                editor = self.emacs.editor
                pos = editor.getCaretPosition()
                #start = stext.Utilities.getRowStart( editor, pos )
                paragraph = editor.getDocument().getParagraphElement( pos )
                start = paragraph.getStartOffset()
                doc = editor.getDocument()
                txt = doc.getText( start, pos - start )
            
                txt = list( txt )
                txt.reverse()
                matchone = 0
                matchtwo = 0
                data = []
                if txt:
                    if txt[ 0 ] == "/": return
                else:
                    return
                    
                for z in txt:    
                    if z == "<" and not matchone:
                        matchone = 1
                        data.append( z )
                        continue
                    elif z == "<" and matchone:
                        matchtwo = 1
                        break
                    elif matchone:
                        break
                    if not matchone:
                        data.append( z )
                
                if not data: return
                elif len( data ) == 1 and data[ 0 ] == "<": return
                elif len( data ) > 1 and not data[ -2 ].isalpha(): return
                
                if matchone and not matchtwo:
                
                    data.reverse()
                    data.insert( 1, "/" )
                    element = ''.join( data )
                    pieces = element.split()
                    endelement = "%s%s" % (  pieces[ 0 ], ">" )
                    doc.insertString( pos, endelement , None )
                    editor.setCaretPosition( pos )
                    
    
    #@-node:zorcanda!.20050520221746:TagMatcher -- matches html/xml style tags
    #@+node:zorcanda!.20050310170120:TabCompleter
    class TabCompleter:
    
        def __init__( self, data ):
            self.data = data
            self.current = None
            self.current_iter = None
        
        def getCompletionList( self ):
            if self.current:
                return list( self.current )
            return []
        
        def reset( self ):
            self.current = None
            
        def extend( self, data ):
            for z in data:
                if z in self.data: continue
                self.data.append( z )
            
        def lookFor( self, txt ):
            
            nwdata = []
            for z in self.data:
                if z.startswith( txt ):
                    nwdata.append( z )
                    
            if len( nwdata ) > 0:
                nwdata.sort()
                self.current = nwdata 
                self.current_iter = iter( nwdata )
                return True
            else:
                return False
    
        def getNext( self ):
            
            try:
                return self.current_iter.next()        
            except:
                
                self.current_iter = iter( self.current )
                return self.getNext()
        
                
    #@-node:zorcanda!.20050310170120:TabCompleter
    #@-others
    #@nonl
    #@-node:orkman.20050213110511:helper classes
    #@+node:orkman.20050213110235:defineStrategyObjects
    def defineStrategyObjects( self ):
    
    #@+at        
    #     self.strategyObjects = {
    #     'incremental': self.incremental( self ),
    #     'dynamic-abbrev' : self.dynamicabbrevs( self ),
    #     'formatter' : self.formatter( self ),
    #     'killbuffer': self.killbuffer( self ),
    #     'deleter': self.deleter( self ),
    #      #'xcommand': self.alt_x_handler( self ),
    #     'rectangles': self.rectangles( self ),
    #     'zap': self.zap( self ),
    #     'comment': self.comment( self ),
    #     'movement': self.movement( self ),
    #     'transpose': self.transpose( self ),
    #     'capitalization': self.capitalization( self ),
    #     'replacement': self.replacement( self ),
    #     'sorters': self.sorters( self ),
    #     'lines': self.lines( self ),
    #     'tabs': self.tabs( self ),
    #     'registers': self.registers( self ),
    #     'selection': self.selection( self ),
    #     'completion': self.symbolcompletion( self ),
    #     'sexps': self.balanced_parentheses( self ),
    #     'tags': self.tags( self ),
    #     }
    #@-at
    #@@c
        self.strategyObjects = []
        for z in dir( self ):
    
            item = getattr( self, z )
            if hasattr( item, "__bases__" ):
                if BaseCommand in item.__bases__:
                    self.strategyObjects.append( item( self ) )
        
        self.ax = ax = self.alt_x_handler( self )
        self.strategyObjects.append( ax )
        self.strategyObjects.append( self.ctrl_x_handler( self ) )
        self.strategyObjects.append( self.ctrl_u_handler( self ) )
        kbdquit = self.getKeyStrokeForCommand( "keyboard-quit" )
        if kbdquit [ 0 ]:
            self.kbdquit_command = kbdquit[ 0 ]
    
        #self.strategyObjects[ 'xcommand' ] = self.alt_x_handler( self )
        #self.strategyObjects[ 'ctrlx' ] = self.ctrl_x_handler( self )
        #self.strategyObjects[ 'ctrlu' ] = self.ctrl_u_handler( self )
        
        for z in extensions:
            try:
                add = z.getCommands()
                continue
                for z in add.keys():
                    try:
                        sO = add[ z ]( self )
                        self.strategyObjects[ z ] = sO
                        ncommands = sO.addToAltX()
                        for z in ncommands:
                            self.strategyObjects[ 'xcommand' ].commands[ z ] = sO
                    finally:
                        pass
            finally:
                pass    
    
        #self.strategyObjects[ 'xcommand' ].createTabCompleter()
        ax.createTabCompleter()
    
    
    
    
    
    
    
    #@-node:orkman.20050213110235:defineStrategyObjects
    #@+node:orkman.20050213110404:defineStrategiesForKeystrokes
    def defineStrategiesForKeystrokes( self ):
            
        self.callbacks = {}
        for z in self.strategyObjects:
            if hasattr( z, "getKeystrokes" ):
                kstrokes = z.getKeystrokes()
                for ks in kstrokes:
                    self.callbacks[ ks ] = z
        
        return
        
        cmds = self.strategyObjects
        callbacks = {
            
            'Ctrl S': cmds[ 'incremental' ],
            'Ctrl R': cmds[ 'incremental' ],
            'Alt Slash': cmds[ 'dynamic-abbrev' ],
            'Ctrl+Alt Slash': cmds[ 'dynamic-abbrev' ],
            'Ctrl+Alt Back Slash': cmds[ 'formatter' ],
            'Alt Back Slash': cmds[ 'formatter' ],
            'Alt+Shift 6': cmds[ 'formatter' ],
            'Ctrl K': cmds[ 'killbuffer' ],
            'Alt Y': cmds[ 'killbuffer' ],
            'Ctrl Y': cmds[ 'killbuffer' ],
            'Ctrl W': cmds[ 'killbuffer' ],
            'Alt W': cmds[ 'killbuffer' ],
            'Delete': cmds[ 'deleter' ],
            'Ctrl D': cmds[ 'deleter' ],
            'Alt X': cmds[ 'xcommand' ],
            'Alt+Shift Period': cmds[ 'movement' ],
            'Alt+Shift Comma': cmds[ 'movement' ],
            'Ctrl Left': cmds[ 'movement'],
            'Ctrl Right': cmds[ 'movement'],
            'Alt M': cmds[ 'movement' ],
            'Ctrl A': cmds[ 'movement' ],
            'Ctrl E': cmds[ 'movement' ],
            'Alt Z': cmds[ 'zap' ],
            'Ctrl Space': cmds[ 'selection' ],
            'Ctrl X': cmds[ 'ctrlx' ],
            'Alt T': cmds[ 'transpose' ],
            'Ctrl+Alt I': cmds[ 'completion' ],
            'Ctrl+Alt F': cmds[ 'sexps' ],
            'Ctrl+Alt B': cmds[ 'sexps' ],
            'Ctrl+Alt K': cmds[ 'sexps' ],
            'Ctrl+Alt Delete': cmds[ 'sexps' ],
            'Alt Period': cmds[ 'tags' ],
            'Alt+Shift 8': cmds[ 'tags' ],
            'Ctrl U': cmds[ 'ctrlu' ],
            
            }
            
        for z in cmds.keys():
            sO = cmds[ z ]
            if hasattr( sO, 'addToKeyStrokes' ):
                nstrokes = sO.addToKeyStrokes()
                if nstrokes:
                    for z in nstrokes.keys():
                        callbacks[ z ] = nstrokes[ z ]
            
        self.callbacks = callbacks
        
    
    
    
    #@-node:orkman.20050213110404:defineStrategiesForKeystrokes
    #@+node:zorcanda!.20050907100351:forwarding methods
    #@+others
    #@+node:zorcanda!.20050907100351.1:startCompounding stopCompounding
    def startCompounding( self, identifier ):
        
        if self.c.frame.body.editor._node_undoer:
            self.c.frame.body.editor._node_undoer.startCompounding( identifier )
        else:
            self.c.undoer.startCompounding( identifier )
        
    def stopCompounding( self ):
        
        if self.c.frame.body.editor._node_undoer:
            self.c.frame.body.editor._node_undoer.stopCompounding()
        else:
            self.c.undoer.stopCompounding()
    #@nonl
    #@-node:zorcanda!.20050907100351.1:startCompounding stopCompounding
    #@-others
    #@-node:zorcanda!.20050907100351:forwarding methods
    #@+node:zorcanda!.20050417172712:addCommands
    def addCommands( self, command, commands ):
        
        #xcommand = self.strategyObjects[ 'xcommand' ]
        xcommand = self.ax
        for z in commands:
            xcommand.commands[ z ] = command
            xcommand.keys.append( z )
            
            
        #self.strategyObjects[ command.getName() ] = command
        self.strategyObjects.append( command )
        
            
        
    
    
    
    #@-node:zorcanda!.20050417172712:addCommands
    #@+node:orkman.20050213110803:masterCommand -- all processing goes through here
    def masterCommand( self, event, command ):
        '''All processing goes through here.  'consume' is a flag to the
           KeyProcessor instance indicating if it should stop the event from
           propagating by consuming the event'''
            
            
        consume = False
        if command == self.kbdquit_command:
            return self.keyboardQuit( event )
        #if command == 'Ctrl G':
        #    return self.keyboardQuit( event )
          
        if self._stateManager.hasState():
            return self._stateManager.filterTo( event, command )
                    
        if self.callbacks.has_key( command ):
            consume = self.callbacks[ command ]( event, command )
            
        if self._stateManager2.hasState():
            self._stateManager2.filterTo( event, command )
        
            
        return consume
    #@nonl
    #@-node:orkman.20050213110803:masterCommand -- all processing goes through here
    #@+node:orkman.20050223114739:setCommandText
    def setCommandText( self, txt ):
        
        self.commandlabel.setText( txt )
        
    #@-node:orkman.20050223114739:setCommandText
    #@+node:orkman.20050210204001:help
    def getHelp2( self ):
        
        helptext ='''
        
        keystrokes:
        
        keyboard quit:
            Ctrl-g: quits any current command. 
        
        selecting:
            Ctrl-Spacebar : starts selecting.  To stop Ctrl-g.  In select mode, where you move the cursor
            is where the selection goes to.
            Ctrl-Spacebar on a selected region will Fold the text.  To Unfold
            a fold hit Ctrl-Spacebar when the cursor is on the fold.
            
            Also, when selected you can perform selective movement.  What this means is that by pressing
            keypad - or + you can move the selected block up( - ) or down( + ).  Entering a space will push
            the block forward one space. Backspace moves it back one space. Tab moves it forward tab width.
        
        kill and yanking:
            Ctrl-k : kills to end of line and inserts data into killbuffer
            Ctrl-w: kills region and inserts data into killbuffer
            Alt-w: copys region and inserts data into killbuffer   
            Ctrl-y: inserts first item in the killbuffer
            Alt-y: inserts next item in the killbuffer; allows the user to cycle 
               through the killbuffer, selecting the desired 'killed' text.
               
               
        deleting:    
            Ctrl-d: deletes next character.
            Delete: deletes previous character.
        
        
        dynamic abbreviations:
            Alt-/ : cycles through all words that match the starting word, which is used as a prefix.
            Ctrl-Alt-/ : takes current word, using it as a prefix and finds the common 
                        prefix among the matching prefix words. 'ea' with the words ( eat,
                        eats, eater ) will become 'eat' upon execution of this command.
            Tab : takes the current word, using it as a prefix and tries to match it against the current
                  language in effect.  So if we were in python:
                      yi(Tab)
                      becomes:
                      yield
                        
        symbol completion:
            Alt Ctrl I : takes the start of the current word and completes it if it matches a keyword
                         of the current language in effect.  The user can cycle through the matches if there
                         are multiple matches.  For example:
                             d( Alt Ctrl I )
                             del
                             del( Alt Ctrl I )
                             def
                     
                     
        incremental search:
            Ctrl-s : starts incremental search forward
            Ctrl-r : starts incremental search backward
        
        
        formating:
            Ctrl-Alt-\ : takes the current selection and formats each line so that it has the same indentation
                     as the first line in the selection.
            Alt-\: deletes the surrounding whitespace
            Alt-^: joins line to previous line. 
            
        transposing:
            Alt-t: marks a word for moving.  2nd execution on word, trades positions of 1rst word with 2nd word. 
                     
        movement:
            Alt-< (less then sign ): move to the beginning of buffer
            Alt-> (greater then sign ): move to the end of the buffer
            Ctrl a: move to the beginning of line
            Ctrl e: move to end of the line
            Alt m: move to the end of the indentation on the current line.
            
        balanced parentheses or sexps:
            Ctrl Alt f: moves forward to matching parentheses.
            Ctrl Alt b: moves backwards to matching parentheses 
            Ctrl Alt k: kills the sexp forward. Can subsequently be yanked
            Ctrl Alt Delete: kills the sexp backward. Can subsequently be yanked
        
        
        zapping:
            Alt-z: zaps to the character specified by the user.
        
        Ctrl x: This keystroke prepares SwingMacs for another keystroke.  These are:
            Ctrl o: This deletes blanklines surrounding the current line. 
            
        tags:
            tags are definitions of language constructs.  Language specific tags:
                Python: def and class
                Java: class and methods
                
            keystrokes:
                Alt-. : queries the user for the tag they wish to goto.  If Enter is typed
                        the current word is used for the tag
                Ctrl-U Alt-. : goes to the next definition of a tag.  Useful if there are multiple
                               definitions for a tag.
                Alt-* : pops the buffer/node back to the last place Alt-. and friends were executed.
                        This can be executed multiple times, if Alt-. was executed multiple times,
                        taking the user back to where he started jumping.
        
        
        '''
        
        addstring = "\n".join( self.keystroke_help )
        
        helptext += addstring
        
        return helptext
    
    #@-node:orkman.20050210204001:help
    #@+node:zorcanda!.20051220101531:help2
    def getHelp( self ):
        
        strokes = []
        commands = self.ax.commands
        haveseen = []
        for z in commands.keys():
            command = commands[ z ]
            if command in haveseen: continue
            haveseen.append( command )
            if hasattr( command, "getKeyStrokeInfo" ):
                ksi = command.getKeyStrokeInfo()
                istring = ksi.infoToString()
                strokes.append( istring )
        
        strokes.sort()
        return "\n".join( strokes )
    #@-node:zorcanda!.20051220101531:help2
    #@+node:zorcanda!.20050418121158:add*Help
    def addCommandHelp( self, chelp ):
    
        self.command_help.append( chelp )
        
    def addKeyStrokeHelp( self, kshelp ):
        
        self.keystroke_help.append( kshelp )
    #@nonl
    #@-node:zorcanda!.20050418121158:add*Help
    #@+node:orkman.20050207164014:keyboardQuit
    def keyboardQuit( self, event=None ):
        
        self._stateManager.clear()
        self._stateManager2.clear()
        self.minibuffer.setText( '' )
        self.clearHighlights()
        sa = stext.SimpleAttributeSet()
        sa.addAttribute( 'dy-ab', 'dy-ab' )
        sa.addAttribute( 'kb', 'kb' )
        self.clearAttributes( sa )
        self.setCommandText( "" )
        for z in self.strategyObjects:
            if hasattr( z, "keyboardQuit" ):
                z.keyboardQuit()
                
        
        cp = self.editor.getCaretPosition()
        self.editor.setCaretPosition( cp )
        return True
    #@-node:orkman.20050207164014:keyboardQuit
    #@+node:zorcanda!.20050311123715:beep
    def beep( self ):
        
        tk = awt.Toolkit.getDefaultToolkit()
        tk.beep()
        
    #@-node:zorcanda!.20050311123715:beep
    #@+node:zorcanda!.20050311140549:determineLanguage
    def determineLanguage( self ):
        
        pos = self.c.currentPosition()
        #language = g.scanForAtLanguage( self.c, pos )
        language = LeoUtilities.scanForLanguage( pos )
        return language
        
    #@-node:zorcanda!.20050311140549:determineLanguage
    #@+node:zorcanda!.20050312123359:getTabWidth
    def getTabWidth( self ):
        
        return abs( self.c.tab_width )
    #@nonl
    #@-node:zorcanda!.20050312123359:getTabWidth
    #@+node:orkman.20050207164550:eventToMinibuffer
    def eventToMinibuffer( self, event ):
    
        code = event.getKeyCode()
        code = event.getKeyText( code )
        txt = self.minibuffer.getText()
        if code == 'Backspace':
            txt = txt[ : -1 ]
        else:
            char = event.getKeyChar()
            if java.lang.Character.isDefined( char ):
                txt = '%s%s' %( txt, char )
        self.minibuffer.setText( txt )
        return txt
        
    def setMinibufferText( self, txt ):
        self.minibuffer.setText( txt )
    
    def getMinibufferText( self ):
        return self.minibuffer.getText()
        
    #@-node:orkman.20050207164550:eventToMinibuffer
    #@+node:orkman.20050209165908:text operations
    def getText( self ):
        
        doc = self.editor.getDocument()
        txt = doc.getText( 0, doc.getLength() )
        return txt
        
        
    def getTextSlice( self, frm, to ):
        
        txt = self.getText()
        return txt[ frm: to ]
        
        
    def replaceText( self, frm, to, txt ):
        
        try:
            doc = self.editor.getStyledDocument()
            doc.replace( frm, to - frm, txt, None )
        except java.lang.Exception, x:
            print x
    
    def insertText(self, pos, txt):
        try:
            doc = self.editor.getStyledDocument()
            doc.insertString( pos, txt, None)
        except java.lang.Exception,x:
            print x
    #@-node:orkman.20050209165908:text operations
    #@+node:orkman.20050209170444:word operations
    def getWordStart( self ):
        
        pos = self.editor.getCaretPosition()
        #start = stext.Utilities.getWordStart( self.editor, pos ) --this method acts screwy
        doc = self.editor.getStyledDocument()
        e = doc.getParagraphElement( pos )
        txt = doc.getText( e.getStartOffset(), pos - e.getStartOffset() )
        tlist = list( txt )
        tlist.reverse()
        wrd = []
        for z in tlist:
            if not z.isalnum() and z != "_":
                break
            else: wrd.insert( 0, z )
        if not wrd: return None
        else: return "".join( wrd )
        
    #@+at
    #     txt = doc.getText( 0, pos )
    #     txtlines = txt.splitlines()
    #     try:
    #         line = txtlines[ -1 ]
    #         chunks = line.split()
    #         c2 = []
    #         for z in chunks[ : ]:
    #             [ c2.append( x ) for x in z.split( '.' ) ]
    #         chunks = c2
    #         word = chunks[ -1 ]
    #         for z in xrange( len( word ) ):
    #             w = word[ z ]
    #             if w.isalnum() or w=='_': break
    #         word = word[ z: ]
    #     except:
    #         return None
    #     return word
    #@-at
    #@@c
        
    def getWordStartIndex( self, i = None ):
        
        pos = self.editor.getCaretPosition()
        doc = self.editor.getStyledDocument()
        e = doc.getParagraphElement( pos )
        txt = doc.getText( e.getStartOffset(), pos - e.getStartOffset() )
        tlist = list( txt )
        tlist.reverse()
        z = 0
        for z in xrange( len( tlist ) ):
            pos -= 1 #moving back one...
            if tlist[ z ] not in ( '_', '-' ) and ( tlist[ z ].isspace() or not tlist[ z ].isalnum() ):
                pos += 1 #we have gone too far, move back one place and get out of the loop
                break
        return pos
        #return pos - z
        #start = stext.Utilities.getWordStart( self.editor, pos ) ---this method acts screwy, thats why Im not using it.
        
        
    def getWordEndIndex( self, i = None ):
        pos = self.editor.getCaretPosition()
        doc = self.editor.getStyledDocument()
        e = doc.getParagraphElement( pos )
        txt = doc.getText( pos, e.getEndOffset() - pos )
        z = 0
        for z in xrange( len( txt ) ):
            l = txt[z]
            if l != '_' and ( l.isspace() or not l.isalnum() ):
                break
        
    
        return pos + z
        
    
    #@-node:orkman.20050209170444:word operations
    #@+node:zorcanda!.20050808123300:line operations
    def getPreviousLine( self, pos ):
        
        #lines and rows are two different things!!!!!
        editor = self.editor
        #txt = editor.getText()
        #ntxt = txt[ : pos ]
        #ntxt = ntxt.split( "\n" )
        #if len( ntxt ) < 2:
        #    return None
        #line = ntxt[ -2 ]
        #spot = pos - ( len( line ) + len( ntxt[ -1 ] ) )
        #return ( spot, line )
        
        
        #if txt[ pos ] != '\n':
        #    start = txt.rfind( '\n', 0, pos )
        #else:
        #    start = pos
        #if start < 0:
        #    return None
        #start = start - 1
        #nstart = txt.rfind( '\n', 0, start )
        #if nstart == -1:
        #    nstart = 0
        #else:
        #    nstart += 1
        #doc = editor.getDocument()
        #txt = doc.getText( nstart, start - nstart )
        cparagraph = stext.Utilities.getParagraphElement( editor, pos )
        start = cparagraph.getStartOffset()
        #start = stext.Utilities.getRowStart( editor, pos )
        if start <= 0:
            return None
        
        start = start - 1
        paragraph = stext.Utilities.getParagraphElement( editor, start )
        nstart = paragraph.getStartOffset()
        #nstart = stext.Utilities.getRowStart( editor, start )
        doc = editor.getDocument()
        txt = doc.getText( nstart, start - nstart )
        return ( nstart, txt )
        
    #    editor = self.emacs.editor
    #    pos = editor.getCaretPosition()
    #    if pos != -1:
    #        
    #        txt = editor.getText()
    #        start = txt.rfind( '\n', 0, pos )
    #        if start == -1: start = 0
    #        else:
    #            if start != 0:
    #                start = txt.rfind( '\n', 0, start )
    #                if start == -1: start = 0
    #                else: 
    #                    start += 1
    #        
    #        end = txt.find( '\n', pos )
    #        if end == -1: end = len( txt )
        
        
    def getNextLine( self, pos ):
        editor = self.editor
        doc = editor.getDocument()
        #end = stext.Utilities.getRowEnd( editor, pos )
        cparagraph = stext.Utilities.getParagraphElement( editor, pos )
        end = cparagraph.getEndOffset()
        #txt = editor.getText()
        #end = txt.find( '\n', pos )
        if  ( end -1 ) >= doc.getLength() or end == -1:
            return None
        #end = end + 1
        #nend = txt.find( '\n', end )
        #if nend == -1:
        #    nend = doc.getLength()
        paragraph = stext.Utilities.getParagraphElement( editor, end )
        nend = paragraph.getEndOffset()
    
        txt = doc.getText( paragraph.getStartOffset(), paragraph.getEndOffset() - paragraph.getStartOffset() )
        if txt:
            if txt[ -1 ] == '\n':
                txt = txt[ : -1 ]
        #print "END is \n%s\nEND" % txt
        return ( paragraph.getStartOffset(), txt ) 
    #@nonl
    #@-node:zorcanda!.20050808123300:line operations
    #@+node:orkman.20050210105230:findPre
    def findPre( self, a, b ):
        st = ''
        for z in a:
            st1 = st + z
            if b.startswith( st1 ):
                st = st1
            else:
                return st
        return st  
    #@-node:orkman.20050210105230:findPre
    #@+node:orkman.20050209180255:attribute and highlight operations, position operations
    def getAttributeRanges( self, name ):
        
        dsd = self.editor.getStyledDocument()
        alen = dsd.getLength()
        range = []
        for z in xrange( alen ):
            element = dsd.getCharacterElement( z )
            as = element.getAttributes()
            if as.containsAttribute( name, name ):
                range.append( z )
                
        return range
        
        
        
    def addAttributeToRange( self, name, value, offset, length, color = None ):
        
        
        dsd = self.editor.getStyledDocument()
        sa = stext.SimpleAttributeSet()
        sa.addAttribute( name, value )
        dsd.setCharacterAttributes( offset, length, sa, True )
        if color != None:
            self.addHighlight( offset, length+offset, color )
    
    def clearAttributes( self, attrset ):
        dsd = self.editor.getStyledDocument()
        alen = dsd.getLength()
        for z in xrange( alen ):
            element = dsd.getCharacterElement( z )
            as = element.getAttributes()
            if as.containsAttributes( attrset ):
                mas = stext.SimpleAttributeSet() #We have to make a clean one and copy the data into it!  The one returned is immutable
                mas.addAttributes( as )
                mas.removeAttributes( attrset ) #we remove the tag from here.
                amount = as.getEndOffset() - as.getStartOffset() #very important to do it like this, giving each character an attribute caused colorization problems/doing the whole thing at once seems to have cleared those problems up.
                dsd.setCharacterAttributes( z, amount, mas, True )            
        
    def clearAttribute( self, name ):
        dsd = self.editor.getStyledDocument()
        alen = dsd.getLength()
        for z in xrange( alen ):
            element = dsd.getCharacterElement( z )
            as = element.getAttributes()
            if as.containsAttribute( name, name ):
                mas = stext.SimpleAttributeSet() #We have to make a clean one and copy the data into it!  The one returned is immutable
                mas.addAttributes( as )
                mas.removeAttribute( name ) #we remove the tag from here.
                amount = as.getEndOffset() - as.getStartOffset() #very important to do it like this, giving each character an attribute caused colorization problems
                dsd.setCharacterAttributes( z, amount, mas, True )
        
    def clearHighlights( self ):
        
        self.editor.getHighlighter().removeAllHighlights()    
        
    
    def addHighlight( self, start, end, color ):
        
        highlighter = self.editor.getHighlighter()
        painter = stext.DefaultHighlighter.DefaultHighlightPainter( color )
        highlighter.addHighlight( start, end, painter )
        
    def getHighlights( self ):
        
        highlighter = self.editor.getHighlighter()
        return highlighter.getHighlights()
        
        
    def removeTextWithAttribute( self, name ):
        
        arange = self.getAttributeRanges( name )
        dsd = self.editor.getStyledDocument()
        alen = len( arange )
        if alen:
            dsd.remove( arange[ 0 ], alen )
        
    def insertTextWithAttribute( self, txt, name ):
        
        sa = stext.SimpleAttributeSet()
        sa.addAttribute( name, name )
        pos = self.editor.getCaretPosition()
        dsd = self.editor.getStyledDocument()
        dsd.insertString( pos, txt, sa )
    
    
    def insertTextGetPositions( self, txt ):
        
        pos = self.editor.getCaretPosition()
        doc = self.editor.getDocument()
        doc.insertString( pos, txt, None )
        p1 = doc.createPosition( pos )
        p2 = doc.createPosition( pos + len( txt ) )
        return ( p1, p2, txt )
        
        
    def removeTextWithPositions( self, pos1, pos2 ):
        
        try:
            doc = self.editor.getDocument()
            doc.remove( pos1.getOffset(), pos2.getOffset() - pos1.getOffset() )   
        except:
            pass
        
    def isPositionRangeValid( self, pos1, pos2, txt ):
                   
        try:        
            doc = self.editor.getDocument()
            txt2 = doc.getText( pos1.getOffset(), pos2.getOffset() - pos1.getOffset() )
            return txt == txt2
        except:
            pass
        
        return False
    #@-node:orkman.20050209180255:attribute and highlight operations, position operations
    #@+node:zorcanda!.20050528101434:addToKillBuffer
    def addToKillbuffer( self, text ):
        
        #self.strategyObjects[ 'killbuffer' ].insertIntoKillbuffer( text )
        for z in self.strategyObjects:
            if z.__class__.__name__ == 'killbuffer':
                z.insertIntoKillbuffer( text )
                return
                
    
    
    #@-node:zorcanda!.20050528101434:addToKillBuffer
    #@+node:zorcanda!.20050729130838:junk
            
        
            
            
    
             
    
             
             
            
            
            
            
            
    
    
            
    
    
    #@-node:zorcanda!.20050729130838:junk
    #@+node:zorcanda!.20051215220838:getKeyStrokesForCommands
    def getKeyStrokesForCommands( self, commands ):
        
    
        rdict = {}
        for z in commands:
            kstroke = self.getKeyStrokeForCommand( z )
            if kstroke[ 0 ]:
                rdict[ kstroke[ 0 ] ] = kstroke[ 1 ]
        return rdict
        
    
    def getKeyStrokeForCommand( self, command ):
        
        c = self.c
        rv = g.app.config.getShortcut( c, command )
        rv = list(rv)
        if rv[ 1 ]:
            try:
                rv[1] = rv[1].lower()
                ftoken = rv[ 1 ].split()
                rv2 = ftoken[ 0 ].split( "-" )
                for z in xrange( len(rv2)):
                    rv2[z] = rv2[z].strip()
                nwlist = rv2[ : -1 ]
                nwlist.sort()
                nwlist.append( rv2[ -1 ] )   
                nwtxt = " ".join( nwlist )
                return ( nwtxt, command )
            except Exception, x:
                #print x
                pass
        return ( None , None )
        
    
    #@-node:zorcanda!.20051215220838:getKeyStrokesForCommands
    #@+node:zorcanda!.20060109122503:configureStrategyWithKeystrokes
    def configureStrategyWithKeystrokes(self, strategy, kstrokes, cmddict ):
        
        strategy.kstrokes_info = {}
        for z in kstrokes.keys():
            cmd = kstrokes[ z ]
            cmddict[ z ] = cmddict[ cmd ]
            strategy.kstrokes_info[ z ] = strategy.info_structures[ cmd ]
        strategy.kstuple = tuple( kstrokes.keys() )      
    #@-node:zorcanda!.20060109122503:configureStrategyWithKeystrokes
    #@+node:orkman.20050210110555:keystroke and command Strategies
    #@+at
    # This node organizes the classes that implement a rough cut of the 
    # Strategy pattern for the keystrokes.
    # Each recognized keystroke goes to the masterCommand, but the 
    # masterCommand just decides on the code that
    # should be executed, in this case it delegates the call to a Strategy 
    # object that decides upon what methods
    # to process the key stroke.  This has these benefits:
    # 1. State is broken further from the container Object( Emacs ).
    # 2. Changes to the processing methods no longer has global consequences.  
    # It is conceivable that a different Strategy could
    # be swapped in by configuration or some other means.  All a strategy has 
    # to do is implement the __call__ operator to have
    # the event and keystroke passed into it.
    # 
    # This design is based off of the lessons learned in the temacs plugin for 
    # CPython Leo.  Its evolution followed this pattern:
    # 1. It started as a flat function based module.  Though a useful learning 
    # experiment this grew too large and became
    #     hard to think about.  Changes were becoming difficult.
    # 2. At this point it became apparent that more structure was needed.  It 
    # was refactored( in Refactoring this is a 'Big Refactoring')
    # into a class, with some helper classes.  This eased the ability to 
    # reason about and modify the code.
    # 3. After working with this big class, it became apparent again that a 
    # further restructuring was needed.  The idea of breaking
    # the methods that were grouped under one rubric into further classes 
    # arose; the Strategy pattern seemed to be what was called for.
    # And here we are in SwingMacs making the first cut at this new decomposed 
    # design for the Jython port.
    # 
    # 
    #@-at
    #@@c
    
    
    
    
    #@+others
    #@+node:zorcanda!.20051215120835:scrolling
    class scrolling( BaseCommand ):
        
        def __init__( self, emacs ):
            self.emacs = emacs
            self.commands = {
                'scroll-tree-mode': self.scrollTree
            }
            self.defineInfoStructures()
            self.ctuple = tuple( self.commands.keys() )
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands)    
                
        def __call__( self, event, command ):
            
            return self.commands[command](command)
            
        #@    @+others
        #@+node:zorcanda!.20051215120835.1:scrollTree
        def scrollTree( self, command ):
            
            self.emacs._stateManager.setState( self )  
            self.emacs.setCommandText( "Scrolling Tree Mode" )
            self.emacs.setMinibufferText( "" )
            tree = self.emacs.c.frame.tree
            if command == "up":
                tree.scrollUp()
                self.emacs.setMinibufferText( command )
            elif command == "down":
                tree.scrollDown()
                self.emacs.setMinibufferText( command )
            elif command == "right":
                tree.scrollRight()
                self.emacs.setMinibufferText( command )
            elif command == "left":
                tree.scrollLeft()
                self.emacs.setMinibufferText( command )
            return True
        #@nonl
        #@-node:zorcanda!.20051215120835.1:scrollTree
        #@+node:zorcanda!.20051215130245:getAltXCommands getKeystrokes
        def getAltXCommands( self ):
            return self.ctuple
            
            
        def getKeystrokes( self ):   
            return self.kstuple
            
            
        
        #@-node:zorcanda!.20051215130245:getAltXCommands getKeystrokes
        #@+node:zorcanda!.20051215130214:keyboardQuit
        def keyboardQuit( self ):
            pass
        #@-node:zorcanda!.20051215130214:keyboardQuit
        #@+node:zorcanda!.20051215130453:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
            
            header = '''--------'''    
            sum = Information( "Scrolling", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
               
            self.info_structures = {}
            for z in ( ( "scroll-tree-mode", "in scroll-tree-mode the tree can be scrolled by typing the up, down, left, and right arrow keys.  All other keys are ignored." ), ):
                info = Information( z[ 0 ], z[ 1 ] )
                self.info_structures[ z[ 0 ] ] = info 
        
            
        #@nonl
        #@-node:zorcanda!.20051215130453:information
        #@-others
    #@nonl
    #@-node:zorcanda!.20051215120835:scrolling
    #@+node:zorcanda!.20051212171614:apropos
    class apropos( BaseCommand ):
        
        def __init__( self, emacs ):
            self.emacs = emacs
            self.prompt = "Apropos symbol(regexp):"
            self.mode = 0
            c = self.emacs.c
            fg = g.app.config.getColor( c, 'body_text_foreground_color' )
            bg = g.app.config.getColor( c, 'body_text_background_color' )
            sc = g.app.config.getColor( c, 'body_selection_color' )
            stc = g.app.config.getColor( c, 'body_text_selected_color' )
            from leoSwingFrame import getColorInstance
            self.fg = getColorInstance( fg, awt.Color.GRAY )
            self.bg = getColorInstance( bg, awt.Color.WHITE )
            self.sc = getColorInstance( sc, awt.Color.GREEN )
            self.stc = getColorInstance( stc, awt.Color.WHITE )
            self.defineInfoStructures()
        
        def __call__( self, event, command ):
            
            if not self.mode:
                self.startApropos()
                return True
            else:
                if command == 'Enter':
                    self.searchForApropos()
                    return self.emacs.keyboardQuit( event )
                else:
                    self.emacs.eventToMinibuffer( event )
                    return True
            
        #@    @+others
        #@+node:zorcanda!.20051213113722:startApropos
        def startApropos( self ):
            self.mode = 1
            self.emacs._stateManager.setState( self )  
            self.emacs.setCommandText( self.prompt )
            self.emacs.setMinibufferText( "" )
            
        #@-node:zorcanda!.20051213113722:startApropos
        #@+node:zorcanda!.20051213132238:searchForApropos
        def searchForApropos( self ):
            
            stxt = self.emacs.getMinibufferText()
            ax = self.emacs.ax
            commands = ax.getAltXCommands()
            infolist = []
            haveseen = []
            regex1 = regex.Pattern.compile( stxt ).matcher( "" )
            regex2 = regex.Pattern.compile( stxt ).matcher( "" )
            for z in commands.keys():
                item = commands[ z ]
                if item in haveseen: continue
                if hasattr( item , "getInformation" ):
                    haveseen.append( item )
                    infodict = item.getInformation()
                    for z2 in infodict.keys():
                        info = infodict[ z2 ]
                        name = info.name
                        doc = info.doc
                        regex1.reset( name ); regex2.reset( doc )
                        if regex1.find() or regex2.find():
                            infolist.append( "%s\n\t%s\n" % ( name, doc ) )    
            
            infolist.sort()
            istring = "\n".join( infolist )
            jtp = swing.JTextPane()
            jtp.setForeground( self.fg )
            jtp.setBackground( self.bg )
            jtp.setSelectedTextColor( self.stc )
            jtp.setSelectionColor( self.sc )
            jtp.setEditable( False )
            jtp.setText( istring )
            jtp.setCaretPosition( 0 )
            jsp = swing.JScrollPane( jtp )
            jb = swing.JButton( "x" )
            jb.setToolTipText( "Press to Close Apropos" )
            jb.setBorder( None )
            jp = swing.JPanel( awt.BorderLayout() )
            jp.add( jsp )
            jp.add( jb, awt.BorderLayout.WEST )
            log = self.emacs.c.frame.log
            log.addTab( "Apropos", jp )
            log.selectTab( jp )
            def close( event ):
                log.removeTab( jp )
            jb.actionPerformed = close
            
            
        
        #@-node:zorcanda!.20051213132238:searchForApropos
        #@+node:zorcanda!.20051212171643:getAltXCommands getKeystrokes
        def getAltXCommands( self ):
            return ( 'apropos', )
            
            
        def getKeystrokes( self ):
            return ()
            
            
        
        #@-node:zorcanda!.20051212171643:getAltXCommands getKeystrokes
        #@+node:zorcanda!.20051212175023:keyboardQuit
        def keyboardQuit( self ):
            self.mode = 0
        #@-node:zorcanda!.20051212175023:keyboardQuit
        #@+node:zorcanda!.20051213171303:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
        #@+at
        # def getKeyStrokeInfo( self ):
        #     sum = Information( "",  "" )
        #     for z in self.kstrokes_info:
        #         item = self.kstrokes_info[ z ]
        #         info = Information( z, item.doc )
        #         sum.addInformation( info )
        #     return sum
        #@-at
        #@@c    
        
        def getSummaryInfo( self ):
            
            header = '''--------'''    
            sum = Information( "Apropos", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
               
            self.info_structures = {}
            for z in ( ( "apropos", "show all commands that match the regex passed in.  Matching occurs either in the command name or in the command description.  For example with the 'apropos' command it would match on the command and in the text when searched with 'apro'." ), ):
                info = Information( z[ 0 ], z[ 1 ] )
                self.info_structures[ z[ 0 ] ] = info 
        
            
        #@nonl
        #@-node:zorcanda!.20051213171303:information
        #@-others
    
    #@-node:zorcanda!.20051212171614:apropos
    #@+node:zorcanda!.20051214133956:editors
    class editors( BaseCommand ):
        
        def __init__( self, emacs ):
            self.emacs = emacs
            self.commands = {
                'switch-editor' : self.switchEditor
            }
            self.defineInfoStructures()
        
        def __call__( self, event, command ):
            
            rval = self.commands[ command ]()        
            self.emacs.keyboardQuit( event )
            return rval        
            
        #@    @+others
        #@+node:zorcanda!.20051214134357:switchEditor
        def switchEditor( self ):
        
            c = self.emacs.c
            c.frame.body.nextEditor()
            return True
        #@nonl
        #@-node:zorcanda!.20051214134357:switchEditor
        #@+node:zorcanda!.20051214134014:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
            
            header = '''--------'''    
            sum = Information( "Editors", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
               
            self.info_structures = {}
            for z in ( ( "switch-editor", 'go to next editor.' ), ):
                info = Information( z[ 0 ], z[ 1 ] )
                self.info_structures[ z[ 0 ] ] = info 
        
            
        #@nonl
        #@-node:zorcanda!.20051214134014:information
        #@+node:zorcanda!.20051214134020:keyboardQuit
        def keyboardQuit( self ):
            self.mode = 0
        #@-node:zorcanda!.20051214134020:keyboardQuit
        #@+node:zorcanda!.20051214134357.1:getAltXCommands getKeystrokes
        def getAltXCommands( self ):
            return ( 'switch-editor', )
            
            
        def getKeystrokes( self ):
            return ()
            
            
        
        #@-node:zorcanda!.20051214134357.1:getAltXCommands getKeystrokes
        #@-others
    #@nonl
    #@-node:zorcanda!.20051214133956:editors
    #@+node:orkman.20050207152619:incremental search
    class incremental( BaseCommand ):
        
        def __init__( self, emacs ):
    
            self.emacs = emacs
            self.defineInfoStructures()
            self.iway = None
            i = java.lang.Integer.decode( '#63c6de' )
            self.highlight = awt.Color( i )
            self.commands = { 
            
                "isearch-forward": self.startIncrementalForward,
                "isearch-backward": self.startIncrementalBackward 
            
            }
            self.ctuple = tuple( self.commands.keys() )
            
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands)    
            self.barrier_reached = False
            
        
        def __call__( self, event, command ):
            
            component = event.getSource()
            stxt = component.getText()
            pos = component.getCaretPosition()
            if self.commands.has_key( command ):
                self.commands[ command ]( command )
                if not self.emacs.minibuffer.getText():
                    return True
            elif command == 'Enter':
                return self.emacs.keyboardQuit( event )
            else:
                self.setMiniBuffer( event )
            
    
            if event.getKeyChar() == aevent.KeyEvent.CHAR_UNDEFINED :
                return True
            
            if not self.barrier_reached or self.commands.has_key( command ):
                dc = DefCallable( lambda : self.incrementalSearch( event , command, stxt, pos) )
                swing.SwingUtilities.invokeLater( dc.wrappedAsFutureTask() )  
            return True
            
        def setMiniBuffer( self, event ):
            self.emacs.eventToMinibuffer( event )
            
        #@    @+others
        #@+node:orkman.20050210110734:startIncremental
        def startIncrementalForward( self, command ):
        
            self.iway = 'forward'
            self.emacs._stateManager.setState( self )  
            self.emacs.setCommandText( "I-Search:" )
            
        def startIncrementalBackward( self, command ):
            
            self.iway = 'backward'
            self.emacs._stateManager.setState( self )  
            self.emacs.setCommandText( "I-Search:" )
            
        #@-node:orkman.20050210110734:startIncremental
        #@+node:zorcanda!.20051219144941:isForward isBackward
        def isForward( self, command ):
        
            return self.__testMethod( self.startIncrementalForward, command )
                
        
        def isBackward( self, command ):
            
            return self.__testMethod(  self.startIncrementalBackward, command )
                
                
        def __testMethod( self, method, command ):
                    
            if self.commands.has_key( command ):
                method2 = self.commands[ command ]
                if method == method2: return True
                return False
            else:
                return False
        
            
        #@nonl
        #@-node:zorcanda!.20051219144941:isForward isBackward
        #@+node:orkman.20050210110734.1:incrementalSearch
        def incrementalSearch( self, event, command, stxt, pos ):
                
            self.emacs.clearHighlights()
            txt = self.emacs.minibuffer.getText()
            c = self.emacs.c
            source = event.getSource()
            if self.iway == 'forward':
                if not self.isForward( command ) and pos >= len( txt ): #this enables the user to enter text and have the search move forward a bit, not a whole token
                    pos = pos - len( txt )
                i = self.forwardSearch( pos, txt, stxt )
                if i != -1:
                    pos = pos + i + len( txt )
                else: #prepare to check next node, or check next node
                    if not self.barrier_reached:
                        self.barrier_reached = True
                        self.emacs.setCommandText( "Reached End of Node. isearch-forward to continue search." )
                        return True
                    cp = c.currentPosition()
                    if self.barrier_reached:
                        self.barrier_reached = False
                        cp = c.currentPosition()
                        i = -1
                        tn = cp.threadNext()
                        if tn:
                            c.frame.tree.select( tn )
                            i = self.forwardSearch( 0, txt, tn.bodyString() )
                            if i != -1:
                                pos = i + len( txt )
            else:
                if not self.isBackward( command ) and ( pos + len( txt ) ) <= len( stxt ): #This enables the user to enter text and have the search move backwards a bit not a whole search
                    pos = pos + len( txt )
                i = self.backwardSearch( pos, txt, stxt )
                if i != -1:
                    pos = i
                else: #start from the back again
                    if not self.barrier_reached:
                        self.barrier_reached = True
                        self.emacs.setCommandText( "Reached Top Of Node, isearch-backward to continue search." )
                        return True
                    if self.barrier_reached:
                        self.barrier_reached = False
                        cp = c.currentPosition()
                        tb = cp.threadBack()
                        if tb:
                            c.frame.tree.select( tb )
                            bs = tb.bodyString()
                            i = self.backwardSearch( len( bs ), txt, bs )
                            if i != -1:
                                pos = i
        
            if i == -1: 
                self.emacs.setCommandText( "Failed I-Search:" )
                return True
            dhl = self.deferedHighlight( source, pos, self.iway, self.highlight, len( txt ), self.emacs )   
            swing.SwingUtilities.invokeLater( dhl )  
            self.emacs.setCommandText( "I-Search:" )
            return True
        
        
        #@-node:orkman.20050210110734.1:incrementalSearch
        #@+node:orkman.20050223124157:forward and backward search
        def forwardSearch( self, pos, txt, stxt ):
            
            _stxt = stxt[ pos : ]
            return _stxt.find( txt )
            
        
        def backwardSearch( self, pos, txt, stxt ):
            
            end = len( stxt ) - pos
            if end != 0:
                stxt = stxt[ : -end ]
            return stxt.rfind( txt )
        #@nonl
        #@-node:orkman.20050223124157:forward and backward search
        #@+node:zorcanda!.20050720215058:class deferedHighlight
        class deferedHighlight( java.lang.Runnable ):
            
            def __init__( self, source, pos, iway, highlight, length, emacs ):
                self.source = source
                self.pos = pos
                self.iway = iway
                self.highlight = highlight
                self.length = length
                self.emacs = emacs
                
                
                
            def run( self ):
                source = self.source; pos = self.pos
                source.setCaretPosition( pos )
                if self.iway == 'forward':
                    start = pos - self.length
                    self.emacs.addHighlight( start, start + self.length, self.highlight ) 
                else:
                    self.emacs.addHighlight( pos, pos + self.length, self.highlight )
        #@-node:zorcanda!.20050720215058:class deferedHighlight
        #@+node:zorcanda!.20050728181730:getCommands getKeystrokes
        def getAltXCommands( self ):
            return self.ctuple
            
            
        def getKeystrokes( self ):   
            return self.kstuple
            
        #@-node:zorcanda!.20050728181730:getCommands getKeystrokes
        #@+node:zorcanda!.20050729154147:keyboardQuit
        def keyboardQuit( self ):
            self.barrier_reached = False
        #@nonl
        #@-node:zorcanda!.20050729154147:keyboardQuit
        #@+node:zorcanda!.20051219153135:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
            
            header = '''--------'''    
            sum = Information( "Incremental Search", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
            
        def getKeyStrokeInfo( self ):
           
            sum = Information( "",  "" )
            for z in self.kstrokes_info: 
                item = self.kstrokes_info[ z ]
                info = Information( z, item.doc )
                sum.addInformation( info )
            
            return sum
            
        
        def defineInfoStructures( self ):
               
            self.info_structures = {}
            for z in ( ( "isearch-forward", "starts forward incremental search" ), 
                       ( "isearch-backward", "starts backward incremental search" ) ):
                info = Information( z[ 0 ], z[ 1 ] )
                self.info_structures[ z[ 0 ] ] = info 
        
            
        #@nonl
        #@-node:zorcanda!.20051219153135:information
        #@-others
            
    
    
    
    #@-node:orkman.20050207152619:incremental search
    #@+node:orkman.20050209165307:dynamic-abbrevs
    class dynamicabbrevs( BaseCommand ):
        
        
        def __init__( self, emacs ):
            self.emacs = emacs
            self.dynaregex = re.compile( r'[%s%s\-_]+' %( string.ascii_letters, string.digits ) ) #for dynamic abbreviations
            self.searchtext = None
            self.returnlist = []
            self.tlist = []
            self.ind = 0 #last spot wordindex returned
            self.dynamiclist = java.util.TreeSet()
            self.added_languages = []
            self.positions = None
            self.tpositions = None
            self.createDynamicList()
            import leoPlugins
            wm1 = WeakMethod( self, "valueChanged" )
            leoPlugins.registerHandler( "select1", wm1 )
            self.commands = {
                "dabbrev-expand": self.dynamicExpansion,
                "dabbrev-completion": self.dynamicExpansion2,
                "keyword-complete": self.tab
            }
            
            self.ctuple = tuple(self.commands.keys())
            self.defineInfoStructures()
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands)        
            
        def __call__( self, event, command ):
            
            return self.commands[command](event)
    
            
        #@    @+others
        #@+node:orkman.20050209165621:dynamicExpansion
        def dynamicExpansion( self, event ):#, store = {'rlist': [], 'stext': ''} ):
            
            word = self.emacs.getWordStart()
            ind = self.emacs.getWordStartIndex()
            
            if not word:
                self.clearDynamic()
                return   
            elif word and self.searchtext == None:
                self.searchtext = word
                self.ind = ind
            elif not word.startswith( self.searchtext ) or self.ind != ind:
        
                self.clearDynamic()
                self.searchtext = word
                self.ind = ind
        
            
            if self.positions and self.emacs.isPositionRangeValid( *self.positions ): #indicates that expansion has started
                self.emacs.removeTextWithPositions( self.positions[ 0 ], self.positions[ 1 ] )
                if self.returnlist:
                    txt = self.returnlist.pop()
                    self.positions = self.emacs.insertTextGetPositions( txt )
                else:
                    self.getDynamicList( self.searchtext, self.returnlist )#rebuild
                    if self.returnlist:
                        txt = self.returnlist.pop()
                        self.positions = self.emacs.insertTextGetPositions( txt )
                    #self.emacs.insertTextWithAttribute( txt, tag )
                    #self.emacs.insertTextWithAttribute( self.searchtext , tag )
                return   
            elif self.searchtext:
                self.returnlist = []
                self.getDynamicList( self.searchtext, self.returnlist )
                if self.returnlist:
                    start = self.emacs.getWordStartIndex()
                    ntxt = self.returnlist.pop()
                    self.emacs.replaceText( start, start + len( word ), "" )
                    self.positions = self.emacs.insertTextGetPositions( ntxt )
                    #self.emacs.addAttributeToRange( tag, tag, start, len( ntxt ) )
                    
        
        
        
        #@-node:orkman.20050209165621:dynamicExpansion
        #@+node:orkman.20050209165627:dynamicExpansion2
        def dynamicExpansion2( self, event ):
            
            i = self.emacs.getWordStartIndex()
            i2 = self.emacs.getWordEndIndex() 
            txt = self.emacs.getTextSlice( i, i2 )
            rlist = []
            self.getDynamicList( txt, rlist )
            if txt in rlist:
                rlist.remove(txt)
            dEstring = reduce( self.emacs.findPre, rlist )
            try:
                if dEstring:
                    self.emacs.replaceText( i, i2, dEstring )        
            except java.lang.Exception, x:
                print x
        #@nonl
        #@-node:orkman.20050209165627:dynamicExpansion2
        #@+node:zorcanda!.20051206180545:tab
        def tab( self, event ):
            
            word = self.emacs.getWordStart()
            ind = self.emacs.getWordStartIndex()
            
            if not word:
                self.clearTab()
                return False  
            elif word and self.searchtext == None:
                self.searchtext = word
                self.ind = ind
            elif not word.startswith( self.searchtext ) or self.ind != ind:
        
                self.clearTab()
                self.searchtext = word
                self.ind = ind
        
            
            if self.tpositions and self.emacs.isPositionRangeValid( *self.tpositions ): #indicates that expansion has started
                self.emacs.removeTextWithPositions( self.tpositions[ 0 ], self.tpositions[ 1 ] )
                if self.tlist:
                    txt = self.tlist.pop()
                    self.tpositions = self.emacs.insertTextGetPositions( txt )
                else:
                    self.getTabList( self.searchtext, self.tlist )#rebuild
                    if self.tlist:
                        txt = self.tlist.pop()
                        self.tpositions = self.emacs.insertTextGetPositions( txt )
                    else:
                        return False
                return True  
            elif self.searchtext:
                self.tlist = []
                self.getTabList( self.searchtext, self.tlist )
                if self.tlist:
                    start = self.emacs.getWordStartIndex()
                    ntxt = self.tlist.pop()
                    self.emacs.replaceText( start, start + len( word ), "" )
                    self.tpositions = self.emacs.insertTextGetPositions( ntxt )
                    return True
                else:
                    return False
        
        #@-node:zorcanda!.20051206180545:tab
        #@+node:orkman.20050209165908.1:getDynamicList
        def getDynamicList( self, txt , rlist ):
        
             ttext = self.emacs.getText()   
             self.addToDynamicList( ttext )
        #@+at
        #      import LeoUtilities
        #      language = LeoUtilities.scanForLanguage( 
        # self.emacs.c.currentPosition() )
        #      if language not in self.added_languages:
        #         import leoLanguageManager
        #         if hasattr( leoLanguageManager.LanguageManager, language ):
        #             tokens = getattr( leoLanguageManager.LanguageManager, 
        # language )
        #             for z in tokens.keySet():
        #                 self.dynamiclist.add( z )
        #             self.added_languages.append( language )
        #@-at
        #@@c
                        
             started = 0
             for z in self.dynamiclist:
                if z.startswith( txt ):
                     if not started:
                         started = 1
                     rlist.append( z )
                     continue
                if started:
                    break
                    
             def cmplen( a,b ):
                if len( a ) < len( b ): return 1
                elif len( a ) > len( b ): return -1
                return 0 
             rlist.sort( cmplen )
             if rlist:
                rlist.insert( 0, rlist.pop() )
             return rlist
        
        #@+at
        #      ttext = self.emacs.getText()
        #      items = self.dynaregex.findall( ttext ) #make a big list of 
        # what we are considering a 'word'
        #      if items:
        #          for word in items:
        #              if not word.startswith( txt ) or word == txt: continue 
        # #dont need words that dont match or == the pattern
        #              if word not in rlist:
        #                  rlist.append( word )
        #              else:
        #                  rlist.remove( word )
        #                  rlist.append( word )
        # 
        # 
        #@-at
        #@-node:orkman.20050209165908.1:getDynamicList
        #@+node:zorcanda!.20051206180838:getTabList
        def getTabList( self, txt , rlist ):
        
        
             editor = self.emacs.c.frame.body.editor
             cdeterminer = editor.cdeterminer
             tokens = cdeterminer.getColoredTokens()
             for z in tokens.keySet():
                if( z.startswith( txt ) ):
                    rlist.append( z )          
                        
             
             if rlist:      
                def cmplen( a,b ):
                    if len( a ) < len( b ): return 1
                    elif len( a ) > len( b ): return -1
                    return 0 
                rlist.sort( cmplen )
             return rlist
        
        
        
        
        #@-node:zorcanda!.20051206180838:getTabList
        #@+node:zorcanda!.20050729164112:addToDynamicList
        def addToDynamicList( self, ttext ):
        
            items = self.dynaregex.findall( ttext )
            for z in items:
                self.dynamiclist.add( z )
        #@nonl
        #@-node:zorcanda!.20050729164112:addToDynamicList
        #@+node:orkman.20050209215951:clearDynamic
        def clearDynamic( self ):
        
            self.returnlist = []
            self.searchtext = None
            self.ind = None
            self.positions = None
        
        def clearTab( self ):
            self.tlist = []
            self.searchtext = None
            self.ind = None
            self.tpositions = None
            
        
        
        #@-node:orkman.20050209215951:clearDynamic
        #@+node:zorcanda!.20050720141603:createDynamicList
        def createDynamicList( self ):
            
            c = self.emacs.c
            class _buildDynamicList:
                
                def __init__( self, c, da ):
                    self.c = c
                    self.da = da
                    
                def __call__( self ):
                    
                    rp = self.c.rootPosition().copy()
                    for z in rp.allNodes_iter( copy = 1 ):
                        btx = z.bodyString()
                        items = self.da.dynaregex.findall( btx )
                        self.da.dynamiclist.addAll( items )
                    #path,file = g.os_path_split(g.app.loadDir) 
                    g.es( "dynamic list built: dynamic abbreviations online" )
                    
            
            dc = DefCallable( _buildDynamicList( c, self ) )
            c.frame.gui.addStartupTask( dc.wrappedAsFutureTask() )
            
        
        #@-node:zorcanda!.20050720141603:createDynamicList
        #@+node:zorcanda!.20050729163706:valueChanged
        def valueChanged( self, *args ):
            
            values = args[ 1 ]
            o_p = values[ "old_p" ]
            if hasattr( o_p, 'v' ) and o_p.v:
                self.addToDynamicList( o_p.bodyString() )
            
        
        #@-node:zorcanda!.20050729163706:valueChanged
        #@+node:zorcanda!.20050728181941:getCommands getKeystrokes
        def getAltXCommands( self ):
            return self.ctuple   
            
            
        def getKeystrokes( self ):   
            return self.kstuple
        
        #@+at
        # def getCommands( self ):
        #     return ()
        # def getKeystrokes( self ):
        #     return ( 'alt slash' ,'alt ctrl slash', 'tab' )
        # 
        #@-at
        #@-node:zorcanda!.20050728181941:getCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.1:keyboardQuit
        def keyboardQuit( self ):
            pass
        #@nonl
        #@-node:zorcanda!.20050729154147.1:keyboardQuit
        #@+node:zorcanda!.20051213112732:getInformation
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        def getKeyStrokeInfo( self ):
           
            sum = Information( "",  "" )
            for z in self.kstrokes_info: 
                item = self.kstrokes_info[ z ]
                info = Information( z, item.doc )
                sum.addInformation( info )
            
            return sum
            
        
        def getSummaryInfo( self ):
            
            header = '''--------'''    
            sum = Information( "Dynamic Abbreviations", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
               
            self.info_structures = {}
            for z in ( ("dabbrev-expand", "Expand the word in the editor before point as a dynamic abbrev, by searching in the abbrev list for words starting with that abbreviation."),
                       ("dabbrev-completion", "Complete the word before point as a dynamic abbrev.  This completes to the common prefix of all possible matches."),
                       ("keyword-complete", "Completes the word against the current languages keywords and conventions."),):
                info = Information( z[ 0 ], z[ 1 ] )
                self.info_structures[ z[ 0 ] ] = info 
        #@nonl
        #@-node:zorcanda!.20051213112732:getInformation
        #@-others
    
    #@-node:orkman.20050209165307:dynamic-abbrevs
    #@+node:orkman.20050210201413:formatter
    class formatter( BaseCommand ):
        
        def __init__( self, emacs ):
            
            self.emacs = emacs
            self.commands = {
            
            'indent-region': self.indentRegionToFirstLine,
            'indent-rigidly': self.indentRigidly,  
            'indent-relative': self.indentRelative,
            'delete-blank-lines': self.deleteBlankLines,
            'delete-horizontal-space': self.deleteSurroundingSpaces,
            'delete-indentation': self.joinLineToPrevious,
            
            }
            self.ctuple = tuple(self.commands.keys())
            self.defineInfoStructures()
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands)
            
        def __call__( self, event, command ):
            
            
            rval = self.commands[ command ]()        
            self.emacs.keyboardQuit( event )
            return rval
                    
        #@    @+others
        #@+node:orkman.20050210201413.1:indent-region
        def indentRegionToFirstLine( self ):
            
            editor = self.emacs.editor
            start = editor.getSelectionStart()
            end = editor.getSelectionEnd()
            if start != end:
                sstart = stext.Utilities.getRowStart( editor, start )
                send = stext.Utilities.getRowEnd( editor, end )
                doc = editor.getStyledDocument()
                txt = doc.getText( sstart, send - sstart )
                lines = txt.splitlines()
                firstline = lines[ 0 ]
                ws_start = []
                for z in firstline:
                    if z.isspace():
                        ws_start.append( z )
                    else:
                        break
                        
                ws_segment = ''.join( ws_start )
                nwlines = [ firstline, ]
                for x in lines[ 1: ]:
                    x_nws = x.lstrip()
                    x_new = '%s%s' % ( ws_segment, x_nws )
                    nwlines.append( x_new )
                    
                new_txt = '\n'.join( nwlines )
                pos = editor.getCaretPosition()
                try:
                    self.emacs.startCompounding( "Indent Region" ) 
                    doc.replace( sstart, send - sstart, new_txt, None )
                finally:
                    self.emacs.stopCompounding()
            return True
                
                    
        
        #@-node:orkman.20050210201413.1:indent-region
        #@+node:zorcanda!.20050312121738:indent-rigidly
        def indentRigidly( self ):
            
            editor = self.emacs.editor
            txt = editor.getSelectedText()
            if txt == None: return True
            
            txtlines = txt.splitlines( True )
            ntxtlines = []
            for z in txtlines:
                
                nline = '\t%s' % z
                ntxtlines.append( nline )
                
            
            ntxt = ''.join( ntxtlines )
            pos = editor.getCaretPosition()
            try:
                self.emacs.startCompounding( "Indent Rigidly" )
                editor.replaceSelection( ntxt )
            finally:
                self.emacs.stopCompounding()
            editor.setCaretPosition( pos )
            return True
            
        #@-node:zorcanda!.20050312121738:indent-rigidly
        #@+node:zorcanda!.20050312173225:indent-relative
        def indentRelative( self ):
        
            editor = self.emacs.editor
            sd = editor.getStyledDocument()
            pos = editor.getCaretPosition()
            
            txt = editor.getText()
            
            
            plstart, plend = self.definePreviousLine()
            
            if plstart == -1 or plend == -1:
                sd.insertString( pos, '\t', None )
                return True         
               
        
            ltxt = txt[ plstart: plend ]
        
            
            find = txt.rfind( '\n', 0, pos )
            find += 1
            rlpos = pos - find
            
            if rlpos > ( len( ltxt ) -1 ):
                sd.insertString( pos, '\t', None )
                return True
                
            addon = []
            for z in ltxt[ : rlpos ]:
                if z.isspace():
                    addon.append( z )
                else:
                    addon.append( ' ' )
                    
            add = ''.join( addon )
            
            if ltxt[ rlpos ].isspace():
                addon = []
                for z in ltxt[ rlpos: ]:
                    if z.isspace():
                        addon.append( z )
                    else:
                        break
                add = add + ''.join( addon )
            else:
                addon = []
                for z in ltxt[ rlpos: ]:
                    if z.isspace(): break
                    else:
                        addon.append( ' ' )
                
                add = add + ''.join( addon )
                rlpos += len( addon )
                addon = []
                for z in ltxt[ rlpos: ]:
                    if z.isspace():
                        addon.append( z )
                    else:
                        break
                add = add + ''.join( addon )
            try:
                self.emacs.startCompounding( "Indent Relative" )
                if txt[ find: pos ].isspace():               
                    sd.replace( find, pos - find, '' , None )
                    sd.insertString( find, add, None )
                else:
                    atext = txt[ find: pos ]
                    atext = atext.rstrip()
                    atext = atext + add[ len( atext ) -1 : ]
                    sd.replace( find, pos - find, '', None )
                    sd.insertString( find, atext, None )
            finally:
                self.emacs.stopCompounding()
                 
            return True
                               
                
            
            
        
        #@-node:zorcanda!.20050312173225:indent-relative
        #@+node:zorcanda!.20050523140526:deleteSurroundingSpaces
        def deleteSurroundingSpaces( self ):
            
            editor = self.emacs.editor
            pos = editor.getCaretPosition()    
            if pos != -1:
                
                start = stext.Utilities.getRowStart( editor, pos )
                end = stext.Utilities.getRowEnd( editor, pos )
                doc = editor.getDocument()
                txt = doc.getText( start, end - start )
                rpos = pos - start
                part1 = txt[ : rpos ]
                part1 = part1.rstrip()
                part2 = txt[ rpos: ]
                part2 = part2.lstrip()
                doc.replace( start, end - start, "%s%s" %( part1, part2 ), None )
                editor.setCaretPosition( start + len( part1 ) )
        #@-node:zorcanda!.20050523140526:deleteSurroundingSpaces
        #@+node:zorcanda!.20050523141645:joinLineToPrevious
        def joinLineToPrevious( self ):
            
            plstart, plend = self.definePreviousLine()
            if plstart == -1 or plend == -1:
                return
                
            editor = self.emacs.editor
            pos = editor.getCaretPosition() 
            if pos != -1:
                
                doc = editor.getDocument()
                start = stext.Utilities.getRowStart( editor, pos )
                end = stext.Utilities.getRowEnd( editor, pos )
                txt = doc.getText( start, end - start )
                txt = ' %s' % txt.lstrip()
                doc.remove( start, end - start )
                doc.insertString( plend, txt, None )
                editor.setCaretPosition( plend )
                
        
        
        #@-node:zorcanda!.20050523141645:joinLineToPrevious
        #@+node:zorcanda!.20050523143816:deleteBlankLines
        def deleteBlankLines( self ):
        
            editor = self.emacs.editor
            pos = editor.getCaretPosition()
            if pos != -1:
                
                doc = editor.getDocument()
                start = stext.Utilities.getRowStart( editor, pos )
                end = stext.Utilities.getRowEnd( editor, pos )
                txt = doc.getText( 0, doc.getLength() )
                cline = txt[ start: end ] + '\n'
                
                first = txt[ : start ]
                lines = first.splitlines( 1 )
                lines.reverse()
                #line = lines[ 0 ]
                #del lines[ 0 ]
                #line = lines.pop()
                cpos_minus = 0
                if cline.isspace():
                    for z in xrange( len( lines )):
                        if lines[ 0 ].isspace() or lines[ 0 ] == "":                    
                            cpos_minus += len( lines[ 0 ] )
                            del lines[ 0 ]
                        else:
                            break
                lines.reverse()
                #lines.append( line )
                
                
                end = txt[ end: ]
                lines2 = end.splitlines( 1 )
                #line = lines2[ 0 ]
                #del lines2[ 0 ]
                for z in xrange( len( lines2 ) ):
                    if lines2[ 0 ].isspace() or lines2[ 0 ] == "":
                        #lines2.pop()
                        del lines2[ 0 ]
                    else:
                        break
                #lines2.insert( 0, line )
                fpart = ''.join( lines )
                spart = ''.join( lines2 )
                nwtext = '%s%s%s' %( fpart, cline, spart )
                doc.replace( 0, doc.getLength(), nwtext, None )
                editor.setCaretPosition( pos - cpos_minus )
                return True
                
                
                    
        
        #@-node:zorcanda!.20050523143816:deleteBlankLines
        #@+node:zorcanda!.20050312183416:definePreviousLine
        def definePreviousLine( self ):
            
            editor = self.emacs.editor
            pos = editor.getCaretPosition()
            
            txt = editor.getText()
            find = txt.rfind( '\n', 0, pos )
            if find == -1:
                return -1, -1
            else:
                find2 = txt.rfind( '\n', 0, find )
                if ( find2 - 1 ) == find:
                    return -1, -1
                elif find2 == -1:
                    find2 = 0
                else:
                    find2 += 1    
        
            return find2, find
        #@nonl
        #@-node:zorcanda!.20050312183416:definePreviousLine
        #@+node:zorcanda!.20050728181941.2:getCommands getKeystrokes
        def getAltXCommands( self ):
            
            return self.ctuple
            
        def getCtrlXCommands( self ):   
            return ( 'Ctrl O' , )
            
        def getKeystrokes( self ):
            
            return self.kstuple
        
        
            
        #@-node:zorcanda!.20050728181941.2:getCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.3:keyboardQuit
        def keyboardQuit( self ):
            pass
        #@nonl
        #@-node:zorcanda!.20050729154147.3:keyboardQuit
        #@+node:zorcanda!.20051213154517:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        def getKeyStrokeInfo( self ):
           
            sum = Information( "",  "" )
            for z in self.kstrokes_info: 
                item = self.kstrokes_info[ z ]
                info = Information( z, item.doc )
                sum.addInformation( info )
            
            return sum
            
        
        def getSummaryInfo( self ):
            
            header = '''--------'''    
            sum = Information( "Indenting", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
               
            self.info_structures = {}
            for z in ( ( 'indent-region', 'indents region to the indentation of the first line in the region.' ),
                       ( 'indent-rigidly', 'indents region by a tab.' ),
                       ( 'indent-relative', '''indents by these rules:
                1. If no previous line, indents by a tab
                2. If a previous line, will indent to the first word of that line.  This process
                continues from word to word on the previous line.''' ),
                       ( 'delete-blank-lines', "delete blank lines around the current line"),
                       ( 'delete-horizontal-space', "delete spaces and tabs around the point"),
                       ( 'delete-indentation', 'Join two lines by deleting the intervening newline, along with any indentation following it') ):
                info = Information( z[ 0 ], z[ 1 ] )
                self.info_structures[ z[ 0 ] ] = info 
                
        
        
            
        #@nonl
        #@-node:zorcanda!.20051213154517:information
        #@-others
    
    #@-node:orkman.20050210201413:formatter
    #@+node:orkman.20050210202559:killbuffer
    class killbuffer( BaseCommand ):
        
        def __init__( self, emacs ):
            self.emacs = emacs
            self.killbuffer = []
            self.cliptext = None
            self.defineInfoStructures()
            self.commands = {
              'kill-line' : self.killToEndOfLine,
              'yank': self.yank,
              'yank-pop': self.walkKB,
              'kill-region': self.killRegion,
              'kill-ring-save': self.copyRegion,
            
            }
            
            self.ctuple = tuple( self.commands.keys() ) 
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands)        
        
            #for killbuffer
            self.last_clipboard = None
            self.kbiterator = self.iterateKillBuffer()
            self.reset = False
            self.lastKBSpot = None
            self.lastRange = None
            
            
        def __call__( self, event, command ):
            
            self.commands[ command ]()
            self.emacs.keyboardQuit( event )
            return True    
            
        #@    @+others
        #@+node:orkman.20050212113553:kill
        def kill( self, frm, end ):
            
            editor = self.emacs.editor
            doc = editor.getStyledDocument()
            if frm != end:
                txt = doc.getText( frm, end - frm )
                doc.replace( frm, end - frm, "", None )
                self.insertIntoKillbuffer( txt )
                g.app.gui.replaceClipboardWith( txt )
            else:
                if frm != doc.getLength():
                    doc.replace( frm, 1, "", None )
        #@nonl
        #@-node:orkman.20050212113553:kill
        #@+node:orkman.20050212114641:insertIntoKillbuffer
        def insertIntoKillbuffer( self, txt ):
            
            self.killbuffer.insert( 0, txt )
            self.reset = True
        #@nonl
        #@-node:orkman.20050212114641:insertIntoKillbuffer
        #@+node:orkman.20050210202559.1:killToEndOfLine
        def killToEndOfLine( self ):
            
            editor = self.emacs.editor
            pos = editor.getCaretPosition()
            end = stext.Utilities.getRowEnd( editor, pos )
            try:
                self.emacs.startCompounding( "Kill To End Of Line" )
                self.kill( pos, end  )    
            finally:
                self.emacs.stopCompounding()
            return True
            
        
        #@-node:orkman.20050210202559.1:killToEndOfLine
        #@+node:orkman.20050212115022:copyRegion
        def copyRegion( self ):
        
            region = self.getRegion()
            if region:
                editor = self.emacs.editor
                doc = editor.getStyledDocument()
                start = region[ 0 ]
                end = region[ 1 ]
                txt = doc.getText( start, end-start )
                self.insertIntoKillbuffer( txt )
            return True
        #@-node:orkman.20050212115022:copyRegion
        #@+node:orkman.20050212114308:killRegion
        def killRegion( self ):
            
            region = self.getRegion()
            if region:
                try:
                    self.emacs.startCompounding( "Kill Region" )
                    self.kill( *region )
                finally:
                    self.emacs.stopCompounding()
            return True
        #@nonl
        #@-node:orkman.20050212114308:killRegion
        #@+node:orkman.20050212115022.1:getRegion
        def getRegion( self ):
        
            editor = self.emacs.editor
            start = editor.getSelectionStart()
            end = editor.getSelectionEnd()
            if end == start: return None
            else:
                return start, end    
        #@-node:orkman.20050212115022.1:getRegion
        #@+node:orkman.20050212095512:walkKB
        def walkKB( self ):
        
            pos = self.emacs.editor.getCaretPosition()
            if pos != self.lastKBSpot:
                self.lastRange = None
            self.lastKBSpot = pos
            clip_text = self.doesClipboardOfferNewData() #  self.getClipboard()     
            if self.killbuffer or clip_text:
                    if clip_text:
                        txt = clip_text
                    else:
                        txt = self.kbiterator.next()   
                    if self.lastRange:
                        self.emacs.replaceText( self.lastRange[0], self.lastRange[1], txt)
                        self.lastRange = (self.lastRange[ 0 ], self.lastRange[0] + len(txt))
                    else:
                        self.emacs.insertText(pos, txt)
                        self.lastRange = (pos, pos + len(txt))
                    self.emacs.editor.setCaretPosition( pos )
        
                    
            return True
        
        #@-node:orkman.20050212095512:walkKB
        #@+node:orkman.20050210203511:yank
        def yank( self ):
            return self.walkKB()
        #@nonl
        #@-node:orkman.20050210203511:yank
        #@+node:orkman.20050212100715:iterateKillBuffer
        def iterateKillBuffer( self ):
        
            while 1:
                if self.killbuffer:
                    self.last_clipboard = None
                    for z in self.killbuffer:
                        if self.reset:
                            self.reset = False
                            break        
                        yield z
                        
        
                
                    
        #@-node:orkman.20050212100715:iterateKillBuffer
        #@+node:orkman.20050212100208:doesClipboardOfferNewData
        def doesClipboardOfferNewData( self  ):
            
            ctxt = None
            try:
                #ctxt = tbuffer.selection_get( selection='CLIPBOARD' )
                ctxt = g.app.gui.getTextFromClipboard()
                if ctxt != self.last_clipboard or not self.killbuffer:
                    self.last_clipboard = ctxt
                    if self.killbuffer and self.killbuffer[ 0 ] == ctxt:
                        return None
                    return ctxt
                else:
                    return None
                
            except:
                return None
                
            return None
        #@nonl
        #@-node:orkman.20050212100208:doesClipboardOfferNewData
        #@+node:zorcanda!.20050728181941.3:getAltXCommands getKeystrokes
        def getAltXCommands( self ):
            return self.ctuple
            
            
        def getKeystrokes( self ): 
            return self.kstuple
            
        #@-node:zorcanda!.20050728181941.3:getAltXCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.4:keyboardQuit
        def keyboardQuit( self ):
            pass
        #@nonl
        #@-node:zorcanda!.20050729154147.4:keyboardQuit
        #@+node:zorcanda!.20060109125001:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
            
            header = '''--------'''    
            sum = Information( "Killing and Yanking", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
            
        def getKeyStrokeInfo( self ):
           
            sum = Information( "",  "" )
            for z in self.kstrokes_info: 
                item = self.kstrokes_info[ z ]
                info = Information( z, item.doc )
                sum.addInformation( info )
            
            return sum
            
        
        def defineInfoStructures( self ):
               
            self.info_structures = {}
            for z in ( ( "kill-line", "kills to the end of the line and appends to killbuffer" ), 
                       ( "kill-region", "kills the current selection and appends to killbuffer" ),
                       ( "kill-ring-save", "copies the current selection and appends to killbuffer"),
                       ( "yank", "yanks from the killbuffer and inserts"),
                       ( "yank-pop", "yanks from the killbuffer and allows the repeated yanking"), ):
                info = Information( z[ 0 ], z[ 1 ] )
                self.info_structures[ z[ 0 ] ] = info 
        
        #@-node:zorcanda!.20060109125001:information
        #@-others
    
    #@-node:orkman.20050210202559:killbuffer
    #@+node:orkman.20050212120210:deleter
    class deleter( BaseCommand ):
        
        def __init__( self, emacs ):
            self.emacs = emacs
            self.commands = {
                'delete-char': self.deleteNextChar,
                'delete-backward-char': self.deletePreviousChar,        
            }
            self.ctuple = tuple(self.commands.keys())
            self.defineInfoStructures()
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands)
            
        def __call__( self, event, command ):
            
            self.commands[ command ]()
    
                
        #@    @+others
        #@+node:orkman.20050212120210.1:deletePreviousChar
        def deletePreviousChar( self ):
            
            editor = self.emacs.editor
            sstart = editor.getSelectionStart()
            send = editor.getSelectionEnd()
            if sstart != send: return False
            pos = editor.getCaretPosition()
            if pos != 0:
                doc = editor.getStyledDocument()
                spos = pos -1
                doc.replace( spos, 1 , "", None )
            return True
        #@nonl
        #@-node:orkman.20050212120210.1:deletePreviousChar
        #@+node:orkman.20050212120620:deleteNextChar
        def deleteNextChar( self ):
            
            editor = self.emacs.editor
            pos = editor.getCaretPosition()
            doc = editor.getStyledDocument()
            if pos != doc.getLength():
                doc.replace( pos, 1 , "", None )
            return True
        #@-node:orkman.20050212120620:deleteNextChar
        #@+node:zorcanda!.20050728181941.4:getCommands getKeystrokes
        def getAltXCommands( self ):
            return self.ctuple   
            
            
        def getKeystrokes( self ):   
            return self.kstuple
            
        #@-node:zorcanda!.20050728181941.4:getCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.5:keyboardQuit
        def keyboardQuit( self ):
            pass
        #@nonl
        #@-node:zorcanda!.20050729154147.5:keyboardQuit
        #@+node:zorcanda!.20060109145237:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
        
            
            header = '''--------'''   
            sum = Information( "Deleting", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
        
            self.info_structures = {}
            for z in ( ( 'delete-char', "delete next character" ),
                       ( 'delete-backward-char', 'delete previous character') ):
                info = Information( z[ 0 ], z[ 1 ] )
                self.info_structures[ z[ 0 ] ] = info
            
            
        #@-node:zorcanda!.20060109145237:information
        #@-others
    #@-node:orkman.20050212120210:deleter
    #@+node:orkman.20050212121301:alt_x_handler
    class alt_x_handler:
        
        def __init__( self, emacs ):
            self.emacs = emacs
            self.defineCommands()
            self.last_command = None
            self.keys = []
            self.createViewer()
        
        def getAltXCommands( self ):
            return copy.copy( self.commands )
            
        def defineCommands( self ):
            
            sO = self.emacs.strategyObjects
            self.commands = {}
            for z in sO:
                if hasattr( z, "getAltXCommands" ):
                    commands = z.getAltXCommands()
                    for x in commands:
                        self.commands[ x ] = z
                        
            
            
        def createTabCompleter( self ):
            self.keys = self.commands.keys()
            self.tbCompleter = self.emacs.TabCompleter( self.keys )
           
        def __call__( self, event, command ):
            
            if command == 'alt x':
                self.tbCompleter.reset()
                self.last_command = None
                self.emacs._stateManager.setState( self ) 
                self.emacs.setCommandText( "alt-x:" )
                return True
            
            if command == 'tab':
                
                txt = self.emacs.minibuffer.getText()
                if self.last_command == None or not txt.startswith( self.last_command ):
                    txt = self.emacs.minibuffer.getText()
                    fnd = self.tbCompleter.lookFor( txt )
                    if fnd:
                        clist = self.tbCompleter.getCompletionList()
                        clist.append( "\n" )
                        lasstring = "\n".join( clist ) 
                        self.viewer.setText( lasstring )
                        self.viewer.setCaretPosition( 0 )
                        if self.jsp.getParent() is None:
                            c = self.emacs.c
                            log = c.frame.log
                            log.addTab( "Completions", self.jsp )
                            log.selectTab( self.jsp )
                        self.last_command = txt
                        next = self.tbCompleter.getNext()
                        i = self.viewer.getText().find( next + "\n" )
                        if i != -1:
                            try:
                                doc = self.viewer.getDocument()
                                doc.setCharacterAttributes( 0, doc.getLength(), self.sas2, True )
                                doc.setCharacterAttributes( i, len( next ), self.sas, True )
                                doc.setParagraphAttributes( 0, doc.getLength(), self.alignment, True )
                                self.viewer.setCaretPosition( i )
                            except java.lang.Exception, x:
                                x.printStackTrace()
    
                        self.emacs.minibuffer.setText( next )
                else :
                    next = self.tbCompleter.getNext()
                    i = self.viewer.getText().find( next + "\n" )
                    if i != -1:
                        try:
                            doc = self.viewer.getDocument()
                            doc.setCharacterAttributes( 0, doc.getLength(), self.sas2, True )
                            doc.setCharacterAttributes( i, len( next ), self.sas, True )
                            self.viewer.setCaretPosition( i )
                        except java.lang.Exception, x:
                            x.printStackTrace()
                    self.emacs.minibuffer.setText( next )
                return True
            
            if command == 'enter':
                self.detachViewer()
                return self.execute( event, command )
            else:
                self.emacs.eventToMinibuffer( event )
                return True    
        
        def execute( self, event, command ):
            
            txt = self.emacs.minibuffer.getText()
            if self.commands.has_key( txt ):
                return self.commands[ txt ]( event, txt )
            else:
                self.emacs.keyboardQuit( event )
                self.emacs.setCommandText( "Command Not Defined" )
         
    
        #@    @+others
        #@+node:zorcanda!.20051212194903:createViewer
        def createViewer( self ):
            
            self.viewer = swing.JTextPane()
            c = self.emacs.c
            fg = g.app.config.getColor( c, 'body_text_foreground_color' )
            bg = g.app.config.getColor( c, 'body_text_background_color' )
            sc = g.app.config.getColor( c, 'body_selection_color' )
            stc = g.app.config.getColor( c, 'body_text_selected_color' )
            from leoSwingFrame import getColorInstance
            fg = getColorInstance( fg, awt.Color.GRAY )
            bg = getColorInstance( bg, awt.Color.WHITE )
            sc = getColorInstance( sc, awt.Color.GREEN )
            stc = getColorInstance( stc, awt.Color.WHITE )
            self.viewer.setBackground( bg ); self.viewer.setForeground( fg );
            self.alignment = stext.SimpleAttributeSet()
            stext.StyleConstants.setAlignment( self.alignment, stext.StyleConstants.ALIGN_CENTER )
            self.sas = stext.SimpleAttributeSet()
            stext.StyleConstants.setForeground( self.sas, stc )
            stext.StyleConstants.setBackground( self.sas, sc )
            self.sas2 = stext.SimpleAttributeSet()
            self.viewer.setEditable( False )
            self.jsp = swing.JScrollPane( self.viewer )    
        
        #@-node:zorcanda!.20051212194903:createViewer
        #@+node:zorcanda!.20050310184934:getCommandHelp
        def getCommandHelp( self ):
            
            commands = [ "Commands are accessed by the Alt-X keystroke.  This will put the system in command mode.",
                         "The user can type in the name of the command in the minibuffer and execute it with an Enter keypress.",
                        "",    
                        "A shortcut to accessing commands is to type a prefix of the command in the minibuffer and hit Tab.",
                        "",
                        "For example:",
                        "op(Tab press )",
                        "could become:",
                        "open-rectangle",
                        "",
                        "the user then just has to type Enter and the open-rectangle command is executed.  Also by repeatedly",
                        "typing Tab the user will cycle through all commands that start with the entered prefix.  So if there",
                        "were 5 commands, for example, that started with 'op' the user could cycle through them and choose the",
                        "one that he wanted to execute.\n\n" ] #I don't use triple quotes here, well because it does not do what I envision in Leo
            commands = "\n".join( commands ) 
        
        
            help = {}
            haveseen = []
            for z in self.commands.keys():
                command = self.commands[ z ]
                if command in haveseen: continue
                haveseen.append( command )
                if hasattr( command, "getSummaryInfo" ):
                    sinfo = command.getSummaryInfo()
                    help[ sinfo.name ] = sinfo.infoToString()
            
            helpkeys = help.keys()
            helpkeys.sort()
            hlist = []
            for z in helpkeys:
                hlist.append( help[ z ] )
            hlist.append( "\n" )
            hstring = "\n".join( hlist )     
            more_help = '\n'.join( self.emacs.command_help )
            commands += hstring
            commands += more_help
            return commands
        
        
        #@-node:zorcanda!.20050310184934:getCommandHelp
        #@+node:zorcanda!.20050729151901:getCommands getKeystrokes
        def getCommands( self ):
            return ()
            
            
        def getKeystrokes( self ):
            
            return  ( 'alt x', )
            
        #@-node:zorcanda!.20050729151901:getCommands getKeystrokes
        #@+node:zorcanda!.20051212173537:matchCommandWithRegex
        def matchCommandWithString( self, regex ):
            
            rlist = []
            for z in self.commands.keys():
                if z.startswith( regex ):
                    rlist.append( z )
                    
            return rlist
        #@nonl
        #@-node:zorcanda!.20051212173537:matchCommandWithRegex
        #@+node:zorcanda!.20050729154147.6:keyboardQuit
        def keyboardQuit( self ):
            self.detachViewer()
        
        def detachViewer( self ):   
            if not self.jsp.getParent() is None:
                c = self.emacs.c
                log = c.frame.log
                log.removeTab( self.jsp )
        #@nonl
        #@-node:zorcanda!.20050729154147.6:keyboardQuit
        #@-others
        
    
    
    
    
    
    
    
    
    
    
    
    
    #@-node:orkman.20050212121301:alt_x_handler
    #@+node:zorcanda!.20050523143029:ctrl_x_handler
    class ctrl_x_handler:
        
        def __init__( self, emacs ):
            self.emacs = emacs
            self.defineCommands()
            self.last_command = None
            self.keys = []
            
        def defineCommands( self ):
            
            self.commands = {}
            sO = self.emacs.strategyObjects
            for z in sO:
                if hasattr( z, "getCtrlXCommands" ):
                    cmds = z.getCtrlXCommands()
                    for x in cmds:
                        self.commands[ x ] = z
            
            return
            #sO = self.emacs.strategyObjects
            #self.commands = {
            #
            #    'Ctrl O': sO[ 'formatter' ],
            #    
            #    
            #    }
            
        def __call__( self, event, command ):
            
            if command == 'Ctrl X':
                #self.tbCompleter.reset()
                self.last_command = None
                self.emacs._stateManager.setState( self ) 
                self.emacs.setCommandText( "Ctrl-x:" )
                return True
                
            if command in self.commands:
                return self.commands[ command ]( event, command )
                
        #@    @+others
        #@+node:zorcanda!.20050729151901.1:getCommands getKeystrokes
        def getCommands( self ):
            return ()
            
            
        def getKeystrokes( self ):
            
            return  ( 'Ctrl X', )
            
        #@-node:zorcanda!.20050729151901.1:getCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.7:keyboardQuit
        def keyboardQuit( self ):
            pass
        #@nonl
        #@-node:zorcanda!.20050729154147.7:keyboardQuit
        #@-others
        
    #@-node:zorcanda!.20050523143029:ctrl_x_handler
    #@+node:zorcanda!.20050528193454:ctrl_u handler
    class ctrl_u_handler:
        
        def __init__( self, emacs ):
            self.emacs = emacs
            self.defineCommands()
            self.last_command = None
            self.keys = []
            
        def defineCommands( self ):
            
            self.commands = {}
            sO = self.emacs.strategyObjects
            for z in sO:
                if hasattr( z, "getCtrlUCommands" ):
                    cmds = z.getCtrlUCommands()
                    for x in cmds:
                        self.commands[ x ] = z
            
            return
            
            
            sO = self.emacs.strategyObjects
            self.commands = {
            
                'Alt Period': sO[ 'tags' ],
                
                
                }
            
        def __call__( self, event, command ):
            
            if command == 'Ctrl U':
                #self.tbCompleter.reset()
                self.last_command = None
                self.emacs._stateManager.setState( self ) 
                self.emacs.setCommandText( "Ctrl-u:" )
                return True
                
            if command in self.commands:
                return self.commands[ command ]( event, "Ctrl U %s" % command )
                
        #@    @+others
        #@+node:zorcanda!.20050729151901.2:getCommands getKeystrokes
        def getCommands( self ):
            return ()
            
            
        def getKeystrokes( self ):
            
            return  ( 'Ctrl U', )
            
        #@-node:zorcanda!.20050729151901.2:getCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.8:keyboardQuit
        def keyboardQuit( self ):
            pass
        #@nonl
        #@-node:zorcanda!.20050729154147.8:keyboardQuit
        #@-others
    #@nonl
    #@-node:zorcanda!.20050528193454:ctrl_u handler
    #@+node:zorcanda!.20050310144300:rectangles
    class rectangles( BaseCommand ):
        
        
        def __init__( self, emacs ):
            self.emacs = emacs
            self.commands = {
            
            'open-rectangle': self.openRectangle,
            'delete-rectangle': self.deleteRectangle,
            'clear-rectangle': self.clearRectangle,
            'delete-whitespace-rectangle': self.deleteWhiteSpaceRectangle,
            'string-insert-rectangle': self.stringInsertRectangle,
            'string-rectangle': self.stringRectangle,
            'kill-rectangle': self.killRectangle,
            'yank-rectangle': self.yankRectangle,
            
            }
            
            self.mode = None
            #emacs.modeStrategies.append( self )
            self.last_killed_rectangle = None
            self.ctuple = tuple(self.commands.keys())
            self.defineInfoStructures()
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands)     
            
        def __call__( self, event, command ):
            
            if self.mode:
                if command == 'Enter':
                    if self.mode == 1:
                        self.stringInsertRectangle()
                        return self.emacs.keyboardQuit( event )
                    elif self.mode == 2:
                        self.stringRectangle()
                        return self.emacs.keyboardQuit( event )
                else:
                    return  self.emacs.eventToMinibuffer( event )
            
            if command in self.commands:
                quit = self.commands[ command ]()
                if quit:
                    return self.emacs.keyboardQuit( event )
                else: return True
            
        #@    @+others
        #@+node:zorcanda!.20050310172920:definePoints
        def definePoints( self, start, end ):
        
            txt = self.emacs.editor.getText()
            rl_start = txt.rfind( '\n', 0, start )
            if rl_start == -1: rl_start = 0
            else: 
                rl_start = rl_start + 1
                
            pos = start - rl_start
                
            rl_end = txt.rfind( '\n', 0, end )
            if rl_end == -1: rl_end = 0
            else:
                rl_end = rl_end + 1  
                
            pos2 = end - rl_end
            
            return pos, pos2, rl_start, rl_end
               
            
        
        #@-node:zorcanda!.20050310172920:definePoints
        #@+node:zorcanda!.20050311121612:insertText
        def insertText( self, rl_start, end, ntxt ):
         
            sd = self.emacs.editor.getStyledDocument()
            sd.remove( rl_start, end - rl_start )
            sd.insertString( rl_start, ntxt, None ) 
            return True 
        #@nonl
        #@-node:zorcanda!.20050311121612:insertText
        #@+node:zorcanda!.20050310153830:open-rectangle
        def openRectangle( self ):
                
            editor = self.emacs.editor
            start = editor.getSelectionStart()
            end = editor.getSelectionEnd()
            if start == end: return True
            if start > -1:
                txt = editor.getText()
                
                pos, pos2, rl_start, rl_end = self.definePoints( start, end )  
                txt = txt[ rl_start: end ]
            
                
                insert = ' ' * ( pos2  - pos )
        
                txtline = txt.split( '\n' )
        
                ntxtlines = [  ]
                for z in txtline[ : ]:
                    if( len( z ) - 1 ) < pos:
                        ntxtlines.append( z )
                    else:
                        nwline = '%s%s%s' %( z[ :pos ], insert, z[ pos : ] )
                        ntxtlines.append( nwline )
                
                if txt[ -1 ] == '\n': ntxtlines.append( '\n' )            
                ntxt = '\n'.join( ntxtlines ) 
                try:
                    self.emacs.startCompounding( "Open Rectangle" ) 
                    rv = self.insertText( rl_start, end, ntxt )
                finally:
                    self.emacs.stopCompounding()
                return rv
        #@-node:zorcanda!.20050310153830:open-rectangle
        #@+node:zorcanda!.20050310182257:clear-rectangle
        def clearRectangle( self ):
            
            
            editor = self.emacs.editor
            start = editor.getSelectionStart()
            end = editor.getSelectionEnd()
            if start == end: return True
            if start > -1:
            
                txt = editor.getText()
                
                pos, pos2, rl_start, rl_end = self.definePoints( start, end )
                txt = txt[ rl_start: end ]
            
                replace = ' ' * ( pos2  - pos )
                txtline = txt.split( '\n' )
        
                ntxtlines = [  ]
                for z in txtline[ : ]:
                    if( len( z ) - 1 ) < pos:
                        ntxtlines.append( z )
                    else:
                        nwline = '%s%s%s' %( z[ :pos ], replace, z[ pos2 : ] )
                        ntxtlines.append( nwline )
                
                if txt[ -1 ] == '\n': ntxtlines.append( '\n' )            
                ntxt = '\n'.join( ntxtlines ) 
                
                try:
                    self.emacs.startCompounding( "Clear Rectangle" ) 
                    rv = self.insertText( rl_start, end, txt )
                finally:
                    self.emacs.stopCompounding()
                return rv
                #sd = editor.getStyledDocument()
                #sd.remove( rl_start, end - rl_start )
                #sd.insertString( rl_start, ntxt, None )     
                #return True 
        #@nonl
        #@-node:zorcanda!.20050310182257:clear-rectangle
        #@+node:zorcanda!.20050311102520:kill-rectangle
        def killRectangle( self ):
            
            editor = self.emacs.editor
            start = editor.getSelectionStart()
            end = editor.getSelectionEnd()
            if start == end: return True
            if start > -1:
                
                txt = editor.getText()
                
                pos, pos2, rl_start, rl_end = self.definePoints( start, end )
                txt = txt[ rl_start: end ]
            
        
                txtline = txt.split( '\n' )
        
                ntxtlines = [  ]
                oldlines = []
                for z in txtline[ : ]:
                    if( len( z ) - 1 ) < pos:
                        ntxtlines.append( z )
                        oldlines.append( z )
                    else:
                        nwline = '%s%s' %( z[ :pos ], z[ pos2 : ] )
                        ntxtlines.append( nwline )
                        oldlines.append( z[ pos: pos2 ] )
                
                if txt[ -1 ] == '\n': ntxtlines.append( '\n' )            
                ntxt = '\n'.join( ntxtlines ) 
                
                #sd = editor.getStyledDocument()
                #sd.remove( rl_start, end - rl_start )
                #sd.insertString( rl_start, ntxt, None )
                self.last_killed_rectangle = oldlines 
                try:
                    self.emacs.startCompounding( "Kill Rectangle" ) 
                    rv = self.insertText( rl_start, end, ntxt )   
                finally:
                    self.emacs.stopCompounding()
                return rv
                #return True 
        #@nonl
        #@-node:zorcanda!.20050311102520:kill-rectangle
        #@+node:zorcanda!.20050311102817:yank-rectangle
        def yankRectangle( self ):
            
            if self.last_killed_rectangle == None: return True
            
            editor = self.emacs.editor
            start = editor.getCaretPosition()
            
            if start > -1:
                self.emacs.startCompounding( "Yank Rectangle" )
                txt = editor.getText()
                
                rl_start = txt.rfind( '\n', 0, start )
                if rl_start == -1: rl_start = 0
                else: 
                    rl_start = rl_start + 1
                    
                
                pos = start - rl_start
                
                sd = editor.getStyledDocument()
                start2 = rl_start
                for itext in self.last_killed_rectangle:
                    
                    if sd.getLength() < start2:
                        sd.insertString( sd.getLength(), '%s%s' %( itext, '\n' ), None )
                        start2 += len( itext ) + 1
                    else:
                        if( sd.getText( start2 , 1 ) == '\n' ):
                            sd.insertString( start2, itext, None )
                            nspot = start2 + len( itext )
                        else:
                            sd.insertString( start2 + pos, itext, None )
                            nspot = start2 + pos + len( itext )
              
                        ftxt = sd.getText( 0, sd.getLength() )
                        where = ftxt.find( '\n', nspot )
                        if where == -1:
                            sd.insertString( sd.getLength(), '\n', None )
                            start2 = sd.getLength() + 1
                        else:
                            start2 = where + 1   
                    
                self.emacs.stopCompounding()
                return True     
        
        #@-node:zorcanda!.20050311102817:yank-rectangle
        #@+node:zorcanda!.20050310172646:delete-rectangle
        def deleteRectangle( self ):
            
            editor = self.emacs.editor
            start = editor.getSelectionStart()
            end = editor.getSelectionEnd()
            if start == end: return True
            if start > -1:
                
                txt = editor.getText()
                
                pos, pos2, rl_start, rl_end = self.definePoints( start, end )
                txt = txt[ rl_start: end ]
            
        
                txtline = txt.split( '\n' )
        
                ntxtlines = [  ]
                for z in txtline[ : ]:
                    if( len( z ) - 1 ) < pos:
                        ntxtlines.append( z )
                    else:
                        nwline = '%s%s' %( z[ :pos ], z[ pos2 : ] )
                        ntxtlines.append( nwline )
                
                if txt[ -1 ] == '\n': ntxtlines.append( '\n' )            
                ntxt = '\n'.join( ntxtlines ) 
                
                #sd = editor.getStyledDocument()
                #sd.remove( rl_start, end - rl_start )
                #sd.insertString( rl_start, ntxt, None )     
                #return True
                try:
                    self.emacs.startCompounding( "Delete Rectangle" ) 
                    rv = self.insertText( rl_start, end, ntxt )
                finally:
                    self.emacs.stopCompounding()
                return rv
        
                
        #@nonl
        #@-node:zorcanda!.20050310172646:delete-rectangle
        #@+node:zorcanda!.20050310183117:delete-whitespace-rectangle
        def deleteWhiteSpaceRectangle( self ):
            
            editor = self.emacs.editor
            start = editor.getSelectionStart()
            end = editor.getSelectionEnd()
            if start == end: return True
            if start > -1:
                
                txt = editor.getText()
                
                pos, pos2, rl_start, rl_end = self.definePoints( start, end )
                txt = txt[ rl_start: end ]
                txtline = txt.split( '\n' )
        
                ntxtlines = [  ]
                for z in txtline[ : ]:
                    if( len( z ) - 1 ) < pos:
                        ntxtlines.append( z )
                    else:
                        if z[ pos ].isspace():
                            space_text = z[ pos: pos2 ]
                            space_text = space_text.lstrip()
                            nwline = '%s%s%s' % ( z[ :pos ], space_text, z[ pos2 : ] )
                        else:
                            nwline = z
                        ntxtlines.append( nwline )
                
                if txt[ -1 ] == '\n': ntxtlines.append( '\n' )            
                ntxt = '\n'.join( ntxtlines ) 
                try:
                    self.emacs.startCompounding( "Delete Whitespace Rectangle" ) 
                    rv = self.insertText( tl_start, end, ntxt )
                finally:
                    self.emacs.stopCompounding()
                #sd = editor.getStyledDocument()
                #sd.remove( rl_start, end - rl_start )
                #sd.insertString( rl_start, ntxt, None )      
                #return True
        #@nonl
        #@-node:zorcanda!.20050310183117:delete-whitespace-rectangle
        #@+node:zorcanda!.20050311102030:string-rectangle
        def stringRectangle( self ):
            
            if self.mode == None:
                self.mode = 2
                self.emacs.setCommandText( "string-rectangle" )
                self.emacs.minibuffer.setText( "" )
                self.emacs._stateManager.setState( self )
                return False
                
                
            self.mode = None
            string_txt = self.emacs.minibuffer.getText()
            
            editor = self.emacs.editor
            start = editor.getSelectionStart()
            end = editor.getSelectionEnd()
            if start == end: return True
            if start > -1:
            
                txt = editor.getText()
                
                pos, pos2, rl_start, rl_end = self.definePoints( start, end )
                txt = txt[ rl_start: end ]
                txtline = txt.split( '\n' )
        
                ntxtlines = [  ]
                for z in txtline[ : ]:
                    if( len( z ) - 1 ) < pos:
                        ntxtlines.append( z )
                    else:
                        nwline = '%s%s%s' % ( z[ :pos ], string_txt , z[ pos2 : ] )
                        ntxtlines.append( nwline )
                
                if txt[ -1 ] == '\n': ntxtlines.append( '\n' )            
                ntxt = '\n'.join( ntxtlines ) 
                
                try:
                    self.emacs.startCompounding( "String Rectangle" ) 
                    rv = self.insertText( rl_start, end, ntxt )
                finally:
                    self.emacs.stopCompounding()
                return rv
                #sd = editor.getStyledDocument()
                #sd.remove( rl_start, end - rl_start )
                #sd.insertString( rl_start, ntxt, None )         
                #return True 
            
        #@-node:zorcanda!.20050311102030:string-rectangle
        #@+node:zorcanda!.20050311095932:string-insert-rectangle
        def stringInsertRectangle( self ):
            
            if self.mode == None:
                self.mode = 1
                self.emacs.setCommandText( "string-insert-rectangle" )
                self.emacs.minibuffer.setText( "" )
                self.emacs._stateManager.setState( self )
                return False
                
                
            self.mode = None
            string_txt = self.emacs.minibuffer.getText()
            
            editor = self.emacs.editor
            start = editor.getSelectionStart()
            end = editor.getSelectionEnd()
            if start == end: return True
            if start > -1:
                
                txt = editor.getText()
                
                pos, pos2, rl_start, rl_end = self.definePoints( start, end )
                txt = txt[ rl_start: end ]
                txtline = txt.split( '\n' )
        
                ntxtlines = [  ]
                for z in txtline[ : ]:
                    if( len( z ) - 1 ) < pos:
                        ntxtlines.append( z )
                    else:
                        nwline = '%s%s%s' % ( z[ :pos ], string_txt , z[ pos : ] )
                        ntxtlines.append( nwline )
                
                if txt[ -1 ] == '\n': ntxtlines.append( '\n' )            
                ntxt = '\n'.join( ntxtlines ) 
                try:
                    self.emacs.startCompounding( "String Insert Rectangle" ) 
                    rv = self.insertText( rl_start, end, ntxt )
                finally:
                    self.emacs.stopCompounding()
                return rv
                #sd = editor.getStyledDocument()
                #sd.remove( rl_start, end - rl_start )
                #sd.insertString( rl_start, ntxt, None )         
                #return True 
        #@-node:zorcanda!.20050311095932:string-insert-rectangle
        #@+node:zorcanda!.20050728181941.5:getCommands getKeystrokes
        def getAltXCommands( self ):
            return self.ctuple   
            
            
        def getKeystrokes( self ):   
            return self.kstuple
            
        
        #@-node:zorcanda!.20050728181941.5:getCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.9:keyboardQuit
        def keyboardQuit( self ):
            self.mode = None
        #@nonl
        #@-node:zorcanda!.20050729154147.9:keyboardQuit
        #@+node:zorcanda!.20051213160912:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
        
            
            header = '''--------
        A Rectangle is defined by connecting 4 parallel points derived from
        the begining of the selction and the end of the selction.
            
        These commands operate on Rectangles:'''   
            sum = Information( "Rectangles", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
        
            self.info_structures = {}
            for z in ( ( 'open-rectangle', 'inserts a whitespace equal to the rectangles width into each rectangle line.' ),
                        ( 'clear-rectangle', 'wipes out character content within the rectangle and replaces it with whitespace.' ),
                        ( 'delete-rectangle', 'removes characters within the rectangle.'),
                        ( 'kill-rectangle', 'removes characters within the rectangle and stores the data in the kill rectangle'),
                        ( 'yank-rectangle', 'inserts the data last stored by the kill-rectangle command' ),
                        ( 'delete-whitespace-rectangle', 'removes whitespace from the begining of each line in the rectangle.'),
                        ( 'string-rectangle', 'replaces each section of the rectangle with a user specified string.' ),
                        ( 'string-insert-rectangle', 'inserts a user specified string into each section of the rectangle.' ) ):
                info = Information( z[ 0 ], z[ 1 ] )
                self.info_structures[ z[ 0 ] ] = info
            
            
        #@-node:zorcanda!.20051213160912:information
        #@-others
            
    
    
    
    
    
    #@-node:zorcanda!.20050310144300:rectangles
    #@+node:zorcanda!.20050311123122:zap
    class zap( BaseCommand ):
        
        def __init__( self, emacs ):
            
            self.emacs = emacs
            self.mode = None
            self.commands = {
             
                'zap-to-char': self.zap
            
            }
            self.ctuple = tuple(self.commands.keys())
            self.defineInfoStructures()
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands)
            
        def __call__( self, event, command ):
            
            if self.mode == None:
                
                self.mode = 1
                self.emacs._stateManager.setState( self )
                self.emacs.setCommandText( "Zap To Character:" )
                self.emacs.minibuffer.setText( "" )
                return True
                
            if command == 'Enter':
                c = self.emacs.minibuffer.getText()
                if len( c ) > 1:
                    self.emacs.keyboardQuit( event )
                    self.emacs.setCommandText( "Text longer than one Character" )
                    return True
                
                self.zap( c )
                return self.emacs.keyboardQuit( event )
            
            else:
                kc = event.getKeyChar()
                if java.lang.Character.isDefined( kc ):
                    message = self.zap( kc )
                    self.emacs.keyboardQuit( event )
                    if message:
                        self.emacs.setCommandText( message )
                    return True
                else:
                    return True
                
                
        #@    @+others
        #@+node:zorcanda!.20050311123122.1:zap
        def zap( self, c ):
            
            editor = self.emacs.editor
            doc = editor.getStyledDocument()
            pos = editor.getCaretPosition()
            txt = editor.getText( pos, ( doc.getLength() - 1 ) - pos  )
            ind = txt.find( c )
            if ind == -1:
                self.emacs.beep()
                return "Search Failed: '%s'" % c
            else:
                try:
                    self.emacs.startCompounding( "Zap To %s" % c )
                    doc.remove( pos, ind + 1 )
                finally:
                    self.emacs.stopCompounding()
        #@nonl
        #@-node:zorcanda!.20050311123122.1:zap
        #@+node:zorcanda!.20050728181941.6:getCommands getKeystrokes
        def getAltXCommands( self ):
            return self.ctuple   
            
            
        def getKeystrokes( self ):   
            return self.kstuple 
            
        #@-node:zorcanda!.20050728181941.6:getCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.10:keyboardQuit
        def keyboardQuit( self ):
            self.mode = None
        #@nonl
        #@-node:zorcanda!.20050729154147.10:keyboardQuit
        #@+node:zorcanda!.20051213112732.1:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
            
            header = '''--------
            Zapping queries for a character from the current caret position.  If it finds the character,
            all data between the caret and including that character is removed.'''    
            sum = Information( "Zapping", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
            
            
            self.info_structures = {}
            ztc = 'zaps to the specified character.'
            zti = Information( "zap-to-char" , ztc )
            self.info_structures[ "zap-to-char" ] = zti
        #@nonl
        #@-node:zorcanda!.20051213112732.1:information
        #@-others
        
    #@-node:zorcanda!.20050311123122:zap
    #@+node:zorcanda!.20050311140549.1:comment
    class comment( BaseCommand ):
    
        def __init__( self, emacs ):
            
            self.emacs = emacs
            self.commands ={
            
                'comment-region': self.commentRegion,
                'comment-kill': self.commentKill,
                    
            }
            self.ctuple = tuple(self.commands.keys())
            self.defineInfoStructures()
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands)
            
        def __call__( self, event, command ):
            
            
            message = self.commands[ command ]()
            if message:
                self.emacs.keyboardQuit( event )
                self.emacs.setCommandText( message )
                self.emacs.beep()
                return True
            else:
                return self.emacs.keyboardQuit( event )
                
            
        #@    @+others
        #@+node:zorcanda!.20050311140549.2:comment-region
        def commentRegion( self ):
            
            language = self.emacs.determineLanguage()
            delim1,delim2, delim3 = g.set_delims_from_language( language )
            
            editor = self.emacs.editor
            sel = editor.getSelectedText()
            if sel == None: return
            
            lines = sel.splitlines( True )
            nwlines = []
            for z in lines:
                
                if z.find( delim1 ) != -1:
                    nwline = z.replace( delim1, "" )
                    nwlines.append( nwline )
                else:
                    z2 = z.lstrip()
                    ins = ( len( z ) - len( z2 ) )
                    if ins == -1: ins = 0
                    nwline = '%s%s%s' %( z[ : ins ], delim1, z[ ins: ] )
                    nwlines.append( nwline )
                
            
            nwtext = ''.join( nwlines )
            try:
                self.emacs.startCompounding( "Comment Region" )
                editor.replaceSelection( nwtext )
            finally:
                self.emacs.stopCompounding()
        
        #@-node:zorcanda!.20050311140549.2:comment-region
        #@+node:zorcanda!.20050311143148:comment-kill
        def commentKill( self ):
            
            
            editor = self.emacs.editor
            pos = editor.getCaretPosition()
            if pos == -1: return "Invalid Caret position"
            else:
                txt = editor.getText()
                i = txt.rfind( '\n', 0, pos )
                if i == -1: i = 0
                else: i += 1
                
                i2 = txt.find( '\n', pos )
                if i2 == -1: i2 = len( txt )
                
                line = txt[ i: i2 ]
                language = self.emacs.determineLanguage()
                delim1,delim2, delim3 = g.set_delims_from_language( language )
                
                where = line.find( delim1 )
                if where == -1: return "No comment found"
                
                else:
                    nline = line[ :where ]
                    
                    sdoc = editor.getStyledDocument()
                    try:
                        self.emacs.startCompounding( "Comment Kill" )
                        sdoc.replace( i, len( line ), nline, None )
                    finally:
                        self.emacs.stopCompounding()
                    if ( pos - i ) < where: editor.setCaretPosition( pos )
                    return
                
                    
            
        #@-node:zorcanda!.20050311143148:comment-kill
        #@+node:zorcanda!.20050728181941.7:getCommands getKeystrokes
        def getAltXCommands( self ):
            return self.ctuple   
            
            
        def getKeystrokes( self ):   
            return self.kstuple
            
        #@-node:zorcanda!.20050728181941.7:getCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.11:keyboardQuit
        def keyboardQuit( self ):
            pass
        #@nonl
        #@-node:zorcanda!.20050729154147.11:keyboardQuit
        #@+node:zorcanda!.20051213141724:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
            
            header = '--------\n'    
            sum = Information( "Comments", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
        
            self.info_structures = {}
            crc = 'comments the selected region with the comment character for the current language.  If a line within the region is commented, it will remove the comments instead of commenting.'
            cr = Information( "comment-region" , crc )
            self.info_structures[ "comment-region" ] = cr
            
            crc2 = "removes the comment on the current line" 
            cr2 = Information( "comment-kill", crc2 )
            self.info_structures[ "comment-kill" ] = cr2
            
            
        #@-node:zorcanda!.20051213141724:information
        #@-others
        
    
    #@-node:zorcanda!.20050311140549.1:comment
    #@+node:zorcanda!.20050311150743:movement
    class movement( BaseCommand ):
        
        def __init__( self, emacs ):
            
            self.emacs = emacs
            self.commands = {
            
                'beginning-of-buffer': self.beginningOfBuffer,
                'end-of-buffer': self.endOfBuffer,
                'beginning-of-line': self.beginningOfLine,
                'end-of-line': self.endOfLine,
                'start-of-word': self.startOfWord,
                'end-of-word': self.endOfWord,
                'goto-line': self.goto,
                'goto-char': self.gotoChar,
                'move-to-indent-start': self.moveToIndentStart
                
            
            }
            self.defineInfoStructures()
            self.ctuple = tuple( self.commands.keys() )       
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands)               
            self.mode = None
    
            
        def __call__( self, event, command ):
            
            if self.mode:
                
                if command == 'Enter':
                    if self.mode == 1:
                        message = self.goto()
                    else:
                        message = self.gotoChar()
                        
                    if message:
                        self.emacs.keyboardQuit( event )
                        self.emacs.setCommandText( message )
                        self.emacs.beep()
                        return True
                    else:
                        return self.emacs.keyboardQuit( event )
                    
                else:
                    return self.emacs.eventToMinibuffer( event )
            self.commands[ command ]()
            return True
            
        
        #@    @+others
        #@+node:zorcanda!.20050311150743.1:beginning-of-buffer
        def beginningOfBuffer( self ):
        
            editor = self.emacs.editor
            editor.setCaretPosition( 0 )
            
        
        #@-node:zorcanda!.20050311150743.1:beginning-of-buffer
        #@+node:zorcanda!.20050311150743.2:end-of-buffer
        def endOfBuffer( self ):
            
            editor = self.emacs.editor
            sdoc = editor.getStyledDocument()
            editor.setCaretPosition( sdoc.getLength() -1 )
            
        
        #@-node:zorcanda!.20050311150743.2:end-of-buffer
        #@+node:zorcanda!.20050311151807:beginning-of-line
        def beginningOfLine( self ):
            
            editor = self.emacs.editor
            pos = editor.getCaretPosition()
            if pos != -1:
                
                txt = editor.getText()
                where = txt.rfind( '\n', 0, pos )
                if where == -1: where = 0
                else: where +=1
                #print stext.Utilities.getRowStart( editor, pos )
                #print where
                #spot = stext.Utilities.getRowStart( editor, pos )
                paragraph = stext.Utilities.getParagraphElement( editor, pos )
                spot = paragraph.getStartOffset()
                editor.setCaretPosition( spot )
                
                #editor.setCaretPosition( where )
        
        #@-node:zorcanda!.20050311151807:beginning-of-line
        #@+node:zorcanda!.20050311151807.1:end-of-line
        def endOfLine( self ):
            
            editor = self.emacs.editor
            pos = editor.getCaretPosition()
            if pos != -1:
                
                #txt = editor.getText()
                #where = txt.find( '\n', pos )
                #if where == -1: where = len( txt )
                #elif where != 0:
                #    where -= 1
                #print stext.Utilities.getRowEnd( editor, pos )
                #print where
                spot = stext.Utilities.getRowEnd( editor, pos )
                doc = editor.getDocument()
                txt = doc.getText( pos, spot - pos )
                ltxt = list( txt )
                ltxt.reverse()
                z = 0
                for z in xrange( len( ltxt ) ):
                    if not ltxt[ z ].isspace(): break
                    
                if z != len( ltxt ): spot -= z
                else: spot -= 1
                #if spot < 0: return
                #paragraph = stext.Utilities.getParagraphElement( editor, pos )
                #spot = paragraph.getEndOffset()
                #if spot > 0:
                #    spot = spot - 1
                #print spot
                #prvword = stext.Utilities.getPreviousWord( editor, spot )
                #text =
                #print prvword
                #espot = stext.Utilities.getNextWord( editor, prvword )
                editor.setCaretPosition( spot )
                
                #editor.setCaretPosition( where )
                
        #@-node:zorcanda!.20050311151807.1:end-of-line
        #@+node:zorcanda!.20050311154238:goto
        def goto( self ):
            
            if self.mode == None:
                self.mode = 1
                self.emacs._stateManager.setState( self )
                self.emacs.minibuffer.setText( "" )
                self.emacs.setCommandText( "Goto Line:" )
                return True
                
                
                
            line = self.emacs.minibuffer.getText()
            if not line.isdigit(): 
                return "Is Not a Number"
               
            line = int( line )
            editor = self.emacs.editor
            
            txt = editor.getText()
            txtlines = txt.splitlines( True )
            if len( txtlines ) < line:
                editor.setCaretPosition( len( txt ) )
            else:
                txtlines = txtlines[ : line ]
                length =  len( ''.join( txtlines ) )
                editor.setCaretPosition( length - len( txtlines[ -1 ] ) )
            
            
        #@-node:zorcanda!.20050311154238:goto
        #@+node:zorcanda!.20050311154238.1:gotoChar
        def gotoChar( self ):
            
            if self.mode == None:
                self.mode = 2
                self.emacs._stateManager.setState( self )
                self.emacs.minibuffer.setText( "" )
                self.emacs.setCommandText( "Goto Char:" )
                return True
                
            line = self.emacs.minibuffer.getText()
            if not line.isdigit(): 
                return "Is Not a Number"
                
                
            number = int( line )
            editor = self.emacs.editor
            ltxt = len( editor.getText() )
            if ltxt < number:
                editor.setCaretPosition( ltxt )
            else:
                editor.setCaretPosition( number )
                
        
            
        #@-node:zorcanda!.20050311154238.1:gotoChar
        #@+node:zorcanda!.20050512112449:startOfWord
        def startOfWord( self):
            
            doc = self.emacs.editor.getDocument()
            cpos = self.emacs.editor.getCaretPosition()
            txt = doc.getText( 0, cpos )
            txt = list( txt)
            txt.reverse()
            if len( txt) == 0: return
            i = 0
            if not self.isWordCharacter( txt[ 0 ]):
                for z in txt:
                    if not self.isWordCharacter( z ):
                        i += 1
                    else:
                        break
            
            for z in txt[ i: ]:
                if not self.isWordCharacter( z ):
                    break
                else:
                    i += 1
        
            cpos -= i
            self.emacs.editor.setCaretPosition( cpos )
            
        #@-node:zorcanda!.20050512112449:startOfWord
        #@+node:zorcanda!.20050512112449.1:endOfWord
        def endOfWord( self ):
            
            doc = self.emacs.editor.getDocument()
            cpos = self.emacs.editor.getCaretPosition()
            txt = doc.getText( cpos, doc.getLength() - cpos )
            txt = list( txt)
            #txt.reverse()
            if len( txt) == 0: return
            i = 0
            if not self.isWordCharacter( txt[ 0 ]):
                for z in txt:
                    if not self.isWordCharacter( z ):
                        i += 1
                    else:
                        break
            
            for z in txt[ i: ]:
                if not self.isWordCharacter( z ):
                    break
                else:
                    i += 1
        
            cpos += i
            self.emacs.editor.setCaretPosition( cpos )
           
        #@nonl
        #@-node:zorcanda!.20050512112449.1:endOfWord
        #@+node:zorcanda!.20050523135303:beginning of indentation
        def moveToIndentStart( self ):
        
            editor = self.emacs.editor
            pos = editor.getCaretPosition()
            if pos != -1:
                
                #txt = editor.getText()
                start = stext.Utilities.getRowStart( editor, pos )
                end = stext.Utilities.getRowEnd( editor, pos )
                doc = editor.getDocument()
                txt = doc.getText( start, end - start )
                add = 0
                for z in txt:
                    if not z.isspace():
                        break
                    else:
                        add +=1
                                
                editor.setCaretPosition( start + add )    
        #@-node:zorcanda!.20050523135303:beginning of indentation
        #@+node:zorcanda!.20050512113820:isWord
        def isWordCharacter( self, c ):
            
            if c in string.ascii_letters:
                return True
            elif c in string.digits:
                return True
            elif c in ( "_"):
                return True
            return False
        #@nonl
        #@-node:zorcanda!.20050512113820:isWord
        #@+node:zorcanda!.20050728181941.8:getCommands getKeystrokes
        def getAltXCommands( self ):    
            return self.ctuple
            
        def getKeystrokes( self ):
            return self.kstuple
            
        #@-node:zorcanda!.20050728181941.8:getCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.12:keyboardQuit
        def keyboardQuit( self ):
            
            self.mode = None
        #@nonl
        #@-node:zorcanda!.20050729154147.12:keyboardQuit
        #@+node:zorcanda!.20051213145555:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
            
            header = '--------\n'    
            sum = Information( "Movement", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
        
            self.info_structures = {}
            crc = 'moves the caret to the line specified by the user.'
            cr = Information( "goto-line" , crc )
            self.info_structures[ "goto-line" ] = cr
            
            crc2 = "moves the caret to the character specified by the user."
            cr2 = Information( "goto-char", crc2 )
            self.info_structures[ "goto-char" ] = cr2
            
            crc3 = "moves the caret to the beginning of the buffer"
            cr3 = Information( "beginning-of-buffer", crc3)
            self.info_structures[ "beginning-of-buffer" ] = cr3
            
            crc4 = "moves the caret to the end of the buffer"
            cr4 = Information( "end-of-buffer", crc4)
            self.info_structures["end-of-buffer"] = cr4
            
            crc5  = "moves the caret to the start of the line"
            cr5 = Information("beginning-of-line", crc5)
            self.info_structures["beginning-of-line"] = cr5
            
            crc6 = "moves the caret to the end of the line"
            cr6 = Information("end-of-line", crc6)
            self.info_structures["end-of-line"] = cr6
            
            crc7 = "moves the caret to the start of the word"
            cr7 = Information("start-of-word", crc7)
            self.info_structures["start-of-word"] = cr7
            
            crc8 = "moves the caret to the end of the word"
            cr8 = Information("end-of-word",crc8)
            self.info_structures["end-of-word"] = cr8
            
            crc9 = "moves the caret to the start of indentation"
            cr9 = Information("move-to-indent-start",crc9)
            self.info_structures["move-to-indent-start"] = cr9
            
        
        #@-node:zorcanda!.20051213145555:information
        #@-others
    
    
    #@-node:zorcanda!.20050311150743:movement
    #@+node:zorcanda!.20050528093036:balanced parenthesis or sexp
    class balanced_parentheses( BaseCommand ):
        
        def __init__( self, emacs ):
            self.emacs = emacs
            self.sexps = {
            
                '(': ')',
                ')':'(',
                '[':']',
                ']':'[',
                '<':'>',
                '>':'<',
                '{':'}',
                '}':'{',
            
            
            
            }
            
            self.forwards = ( "(", "<", "{", "[" )
            self.backwards = ( ")", ">", "}", "]" )
            self.commands = {
                "forward-sexp" : self.forwardSexp,
                "backward-sexp": self.backwardSexp,
                "kill-sexp": self.killSexpForward,
                "backward-kill-sexp": self.killSexpBackward
            
            
            }
            self.defineInfoStructures()
            self.ctuple = tuple( self.commands.keys() )       
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands)         
            
        def __call__( self, event , command ):
            
            self.commands[ command ]()
            return True
            
            
        
        def forwardSexp( self ):
            
            editor = self.emacs.editor
            doc = editor.getDocument()
            cp = editor.getCaretPosition()
            if cp + 1 == doc.getLength(): return
            txt = doc.getText( cp, doc.getLength() - cp )
            sp = txt[ 0 ]
            if sp not in self.forwards or len( txt ) == 1: return
            matcher = self.sexps[ sp ]
            i = 1
            i2 = 0
            for z in txt[ 1: ]:
                i2 += 1
                if z == sp:
                    i += 1
                    continue
                elif z == matcher:
                    i -= 1
                if i == 0: break
            if i == 0:
                editor.setCaretPosition( cp + i2 )
        
        def backwardSexp( self ):
            
            editor = self.emacs.editor
            doc = editor.getDocument()
            cp = editor.getCaretPosition()
            txt = doc.getText( 0, cp + 1 )
            sexp = txt[ -1 ]
            if sexp not in self.backwards or len( txt ) == 1: return
            matcher = self.sexps[ sexp ]
            i = 1
            i2 = 0
            t2 = list( txt )
            t2.reverse()
            for z in t2[ 1: ]:
                i2 += 1
                if z == sexp:
                    i += 1
                    continue
                elif z == matcher:
                    i -= 1
                if i == 0:
                    break
            
            if i == 0:
                editor.setCaretPosition( cp - i2 )
     
        #@    @+others
        #@+node:zorcanda!.20050528100638:killSexpForward and Backward
        def killSexpForward( self ):
            
            editor = self.emacs.editor
            doc = editor.getDocument()
            cp = editor.getCaretPosition()
            self.forwardSexp()
            cp2 = editor.getCaretPosition()
            if cp != cp2:
                txt = doc.getText( cp, ( cp2 - cp ) + 1 )
                self.emacs.addToKillbuffer( txt )
                try:
                    self.emacs.startCompounding( "Kill Sexp Forwards" )
                    doc.remove( cp, ( cp2 - cp ) + 1)
                finally:
                    self.emacs.stopCompounding()
                
        def killSexpBackward( self ):
            
            editor = self.emacs.editor
            doc = editor.getDocument()
            cp = editor.getCaretPosition()
            self.backwardSexp()
            cp2 = editor.getCaretPosition()
            if cp != cp2:
                txt = doc.getText( cp2, ( cp - cp2 ) + 1)
                self.emacs.addToKillbuffer( txt )
                try:
                    self.emacs.startCompounding( "Kill Sexp Backwards" )
                    doc.remove( cp2, ( cp - cp2 ) + 1)
                finally:
                    self.emacs.stopCompounding()
        #@-node:zorcanda!.20050528100638:killSexpForward and Backward
        #@+node:zorcanda!.20050728181941.9:getCommands getKeystrokes
        def getAltXCommands( self ):    
            return self.ctuple 
            
        def getKeystrokes( self ):
            return self.kstuple
            
        #@-node:zorcanda!.20050728181941.9:getCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.13:keyboardQuit
        def keyboardQuit( self ):
            pass
        #@nonl
        #@-node:zorcanda!.20050729154147.13:keyboardQuit
        #@+node:zorcanda!.20060109185153:information
        def getInformationAbout( self, name ): 
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
            
            header = '--------\n'    
            sum = Information( "Capitalization", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
        
            self.info_structures = {}
            for z in ( ("forward-sexp", "Move forward over a balanced expression"),
                       ("backward-sexp", "Move backward over a balanced expression"),
                       ("kill-sexp", "Kill balanced expression forward"),
                       ("backward-kill-sexp", "Kill balanced expression backward")
                      ):
                info = Information( z[ 0 ], z[ 1 ] )
                self.info_structures[ z[ 0 ] ] = info
                
        #@nonl
        #@-node:zorcanda!.20060109185153:information
        #@-others
    #@nonl
    #@-node:zorcanda!.20050528093036:balanced parenthesis or sexp
    #@+node:zorcanda!.20050528154411:tags
    class tags( java.lang.Runnable, BaseCommand ):
        
        #tags_table = {}
        
        def __init__( self, emacs ):
            
            self.emacs = emacs
            #self.emacs.c.frame.tree.jtree.addTreeSelectionListener( self )
            self.last_tag = None
            self.pop_back = []
            self.positions = []
            self.tag_table = {}
            self.last_command = None
            self.__defineLanguageRecognizers()
            self.__defineLanguageMatchers()
            self.xs = java.util.concurrent.Executors.newSingleThreadScheduledExecutor()
            import leoPlugins
            wm1 = WeakMethod( self, "valueChanged" )
            leoPlugins.registerHandler( "select1", wm1 )
            self.mode = None
            #emacs.modeStrategies.append( self )
            self.commands = {
            
                "find-tag": self.gotoTag,
                "find-alternative-tag": self.alternativeDefinition,
                "pop-tag-mark": self.popBack,
            
            
            }
            
            self.tab_completer = self.emacs.TabCompleter( [] )
            dc = DefCallable( self.defineTagsTable )
            g.app.gui.addStartupTask( dc )
            self.defineInfoStructures()
            self.ctuple = tuple( self.commands.keys() )       
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands)  
        
        def __defineLanguageMatchers( self ):
            
            reg1 = java.util.regex.Pattern.compile( java.lang.String( "^\s*(def\s+\w+\s*)" ) )
            reg2 = java.util.regex.Pattern.compile( java.lang.String(  "^\s*(class\s+\w+\s*)" ) )
            self.python_matchers = ( reg1.matcher( java.lang.String( "" ) ), reg2.matcher( java.lang.String( "" ) ) )
            
        
        def __call__( self, event, command ):
            
            if self.mode:
                if command == 'Enter':
                    self.gotoTag()
                    return self.emacs.keyboardQuit( event )
                elif command == 'Tab':
                
                    txt = self.emacs.minibuffer.getText()
                    if self.last_command == None or not txt.startswith( self.last_command ):
                        txt = self.emacs.minibuffer.getText()                
                        fnd = self.tab_completer.lookFor( txt )
                        if fnd:
                            self.last_command = txt
                            self.emacs.minibuffer.setText( self.tab_completer.getNext() )
                    else :
                        self.emacs.minibuffer.setText( self.tab_completer.getNext() )
                    return True
                else:
                    return self.emacs.eventToMinibuffer( event )   
            
            rv = self.commands[ command ]()
            self.tab_completer.reset()
            self.last_command = None
            if rv:
                self.emacs.keyboardQuit( event )
            return True
            
            
        #@    @+others
        #@+node:zorcanda!.20050531130856:__defineLanguageRecognizers
        def __defineLanguageRecognizers( self ):
            
            sstring = java.lang.String( "" )
            pattern = regex.Pattern.compile( "(class|interface)\s*(\w+)" )
            self.java_class = pattern.matcher( sstring )
            pattern = regex.Pattern.compile( "((public|private|protected)\s+)?(final\s+)?(static\s+)?(new\s+){0}\w+\s*(\w+)\s*\\(" )
            self.java_method = pattern.matcher( sstring )
        #@nonl
        #@-node:zorcanda!.20050531130856:__defineLanguageRecognizers
        #@+node:zorcanda!.20050528154411.1:gotoTag
        def gotoTag( self ):
            
            if self.mode == None:
                self.emacs.setCommandText( "Goto tag:" )
                self.emacs.minibuffer.setText( "" )
                self.emacs._stateManager.setState( self )    
                self.mode = 1
                return
                
            if self.mode == 1:
                
                tag = self.emacs.minibuffer.getText()
                if not tag:
                    wsi = self.emacs.getWordStartIndex()
                    wse = self.emacs.getWordEndIndex()
                    tag = self.emacs.getTextSlice( wsi, wse )
                if tag in self.tag_table:
                    td = self.tag_table[ tag ]
                    self.last_tag = ( tag, td[ 0 ] )
                    p = td[ 0 ][ -1 ]
                    c = self.emacs.c
                    cp = c.currentPosition()
                    self.pop_back.append( cp.copy() )
                    c.beginUpdate()
                    c.selectPosition( p.copy() )
                    c.endUpdate()
                    dgl = self.DeferedGotoLine( self.emacs.c, p, td[ 0 ][ 0 ] )
                    dc = DefCallable( dgl )
                    ft = dc.wrappedAsFutureTask()
                    java.awt.EventQueue.invokeLater( ft )
                    #self.emacs.keyboardQuit( event )
                    return True
                else:
                    g.es( "Could not find definition for %s" % tag )
                    #self.emacs.keyboardQuit( event)
                    return True
        
        #@-node:zorcanda!.20050528154411.1:gotoTag
        #@+node:zorcanda!.20050528193932:alternativeDefinition
        def alternativeDefinition( self ):
            
            if self.last_tag:
                
                tag , td = self.last_tag
                tags = self.tag_table[ tag ]
                i = tags.index( td )
                if i + 1 == len( tags ):
                    i = 0
                else:
                    i += 1
                
                td = tags[ i ]
                self.last_tag = ( tag, td )
                p = td[ -1 ]
                c = self.emacs.c
                cp = c.currentPosition()
                self.pop_back.append( cp.copy() )
                c.beginUpdate()
                c.selectPosition( p.copy() )
                c.endUpdate()
                dgl = self.DeferedGotoLine( self.emacs.c, p, td[ 0 ] )
                dc = DefCallable( dgl )
                ft = dc.wrappedAsFutureTask()
                java.awt.EventQueue.invokeLater( ft )
                #self.emacs.keyboardQuit( event )
                return True
        
        
        #@-node:zorcanda!.20050528193932:alternativeDefinition
        #@+node:zorcanda!.20050531101443:popBack
        def popBack( self ):
        
            if self.pop_back:
                p = self.pop_back.pop()
                c = self.emacs.c
                c.beginUpdate()
                c.selectPosition( p )
                c.endUpdate()
            
           
        
        #@-node:zorcanda!.20050531101443:popBack
        #@+node:zorcanda!.20050528154425:defineTagsTable
        def defineTagsTable( self ):
        
            c = self.emacs.c
            cp = c.rootPosition()
            for z in cp.allNodes_iter( copy = True ):
                tags = self.scanForTags( z )
                if tags:
                    for x in tags:
                        if self.tag_table.has_key( x[ 1 ] ):
                            self.tag_table[ x[ 1 ] ].append( x )
                        else:                    
                            self.tag_table[ x[ 1 ] ] = []
                            self.tag_table[ x[ 1 ] ].append( x )
                            
            self.tab_completer.extend( self.tag_table.keys() ) 
            g.es( "tag table built" )
            self.xs.scheduleAtFixedRate( self, 30000, 30000, java.util.concurrent.TimeUnit.MILLISECONDS ) 
        #@-node:zorcanda!.20050528154425:defineTagsTable
        #@+node:zorcanda!.20050528154749:scanForTags
        def scanForTags( self, p ):
            #print "SCANNING FOR TAGS!"
            #language = g.scanForAtLanguage( self.emacs.c, p )
            language = LeoUtilities.scanForLanguage( p )
            if language == None: language = 'python'
            if language == 'python':
                tags = []
                try:
                    #reg1 = "^\s*(def\s+\w+\s*)"
                    #reg2 = "^\s*(class\s+\w+\s*)"
                    #regs = ( reg1, reg2 )
                    tnt = p.v.t._bodyString
                    matches = LeoUtilities.scanFor( self.python_matchers , tnt )
                    #print matches
                    for z in matches:
                        tags.append( ( z[ 0 ], z[ 1 ], p ) )
                    #bs = p.bodyString()
                    #data = bs.split( '\n' )
                    # tags = []
                    #for z in data:
                    #    txt = z.lstrip()
                    #    txtpieces = txt.split()
                    #    if len( txtpieces )> 1 and txtpieces[ 0 ] in ( "class", "def" ):
                    #        ntxt = txtpieces[ 1 ]
                    #        i1 = ntxt.find( "(" )
                    #        i2 = ntxt.find( ":" )
                    #        if i1 != -1: 
                    #            ntxt = ntxt[ : i1 ]
                    #        elif i2 != -1:
                    #            ntxt = ntxt[ : i2 ]
                    #        
                    #        tags.append( ( txt, ntxt, p ) )
                except Exception, x:
                    print x
                except java.lang.Exception, r:
                    print r            
                     
                return tags
            elif language == 'java':
                #@        <<java>>
                #@+node:zorcanda!.20050531112641:<<java>>
                bs = p.bodyString()
                data = bs.split( '\n' )
                tags = []
                for z in data:
                    #regex looking for methods
                    #regular scan for looking for class and interface
                    #class interface takes precedence over methods
                    try:
                        stxt = z.lstrip()
                        txt = java.lang.String( stxt )
                        self.java_class.reset( txt )
                        self.java_method.reset( txt )
                        start = end = -1
                        if self.java_class.find():
                            gc = self.java_class.groupCount()
                            ntxt = self.java_class.group( gc )
                        elif self.java_method.find():
                            gc = self.java_method.groupCount()
                            ntxt = self.java_method.group( gc )
                        else:
                            gc = 0
                        
                        if gc:
                            tags.append( (stxt, ntxt, p ) ) 
                    except Exception, x:
                        print x
                
                
                return tags
                #@nonl
                #@-node:zorcanda!.20050531112641:<<java>>
                #@nl
            else:
                return None
        
        #@-node:zorcanda!.20050528154749:scanForTags
        #@+node:zorcanda!.20050528154749.1:valueChanged
        def valueChanged( self, *args ):
            
            values = args[ 1 ]
            self.positions.append( values[ 'new_p' ].copy() )
        #@-node:zorcanda!.20050528154749.1:valueChanged
        #@+node:zorcanda!.20050528155247:run
        def run( self ):
            
            cp = self.emacs.c.currentPosition().copy()
            if cp not in self.positions:
                self.positions.append( cp )
                
            for z in self.positions:
                tags = self.scanForTags( z )
                if tags:
                    for x in tags:   
                        if self.tag_table.has_key( x[ 1 ] ):
                            self.tag_table[ x[ 1 ] ].append( x ) 
                        else:
                            self.tag_table[ x[ 1 ] ] = []
                            self.tag_table[ x[ 1 ] ].append( x )
                        self.tab_completer.extend( x[ 1 ] )
                            
            self.positions = []
        
        #@-node:zorcanda!.20050528155247:run
        #@+node:zorcanda!.20050528185814:class DeferedGotoLine
        class DeferedGotoLine:
            
            def __init__( self, c, pos, tag ):
                self.c = c
                self.pos = pos
                self.tag = tag
                
            def __call__( self ):
                
                bs = self.pos.bodyString()
                where = bs.find( self.tag )
                if where != -1:
                    self.c.frame.body.editor.editor.setCaretPosition( where )
                    
                
        #@-node:zorcanda!.20050528185814:class DeferedGotoLine
        #@+node:zorcanda!.20050728181941.10:getCommands getKeystrokes
        def getAltXCommands( self ):    
            return self.ctuple 
            
        def getKeystrokes( self ):
            return self.kstuple
            
        def getCtrlUCommands( self ):
            return ( 'Alt Period', )
            
            
        
        #@-node:zorcanda!.20050728181941.10:getCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.14:keyboardQuit
        def keyboardQuit( self ):
            
            self.mode = None
        #@nonl
        #@-node:zorcanda!.20050729154147.14:keyboardQuit
        #@+node:zorcanda!.20060109193520:information
        def getInformationAbout( self, name ): 
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
            
            header = 'Tags are locations within the outline where definitions of methods are located.\n'    
            sum = Information( "Tags", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
        
            self.info_structures = {}
            for z in ( ("find-tag", "find first definition of tag"),
                       ("find-alternative-tag", "find next alternate definition of last tag specified"),
                       ("pop-tag-mark", "pop back to where you previously invoked M-. and friends")
                      ):
                info = Information( z[ 0 ], z[ 1 ] )
                self.info_structures[ z[ 0 ] ] = info
                
                
        #@-node:zorcanda!.20060109193520:information
        #@-others
        
    
    
    
    
    #@-node:zorcanda!.20050528154411:tags
    #@+node:zorcanda!.20050311160343:transpose
    class transpose( BaseCommand ):
        
        def __init__( self, emacs ):
            
            self.emacs = emacs
            self.commands = {
            
                'transpose-lines': self.transposeLines,
                'reverse-region': self.reverseRegion,
                'transpose-words': self.transposeWords,
            
            
            }
            self.ctuple = tuple(self.commands.keys())
            self.defineInfoStructures()
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands)
            
        def __call__( self, event, command ):
            
        
            if not self.commands[ command ]():
                return self.emacs.keyboardQuit( event )  
            return True
            
            
        #@    @+others
        #@+node:zorcanda!.20050311160343.1:transpose-lines
        def transposeLines( self ):
            
            editor = self.emacs.editor
            pos = editor.getCaretPosition()
            if pos != -1:
                
                txt = editor.getText()
                start = txt.rfind( '\n', 0, pos )
                if start == -1: start = 0
                else:
                    if start != 0:
                        start = txt.rfind( '\n', 0, start )
                        if start == -1: start = 0
                        else: 
                            start += 1
                
                end = txt.find( '\n', pos )
                if end == -1: end = len( txt )
                   
            
                lines = txt[ start: end ]
                lines_split = lines.split( '\n' )
                if not len( lines_split ) == 2: return
                l1, l2 = lines_split[ 0 ], lines_split[ 1 ]
                
                nwlines = '%s\n%s' %( l2, l1 )
                sdoc = editor.getStyledDocument()
                try:
                    self.emacs.startCompounding( "Transpose Lines" )
                    sdoc.replace( start, len( lines ), nwlines, None )
                finally:
                    self.emacs.stopCompounding()
                
                
                
                
        #@-node:zorcanda!.20050311160343.1:transpose-lines
        #@+node:zorcanda!.20050311215703:reverse-region
        def reverseRegion( self ):
            
            editor = self.emacs.editor
            txt = editor.getSelectedText()
            if txt == None: return
            txtlines = txt.splitlines( True )
            txtlines.reverse()
            if not txt.endswith( '\n' ):
                txtlines[ 0 ] = '%s\n' % txtlines[ 0 ]
            ntxt = ''.join( txtlines )
            try:
                self.emacs.startCompounding( "Reverse Region" )
                editor.replaceSelection( ntxt )
            finally:
                self.emacs.stopCompounding()
        #@-node:zorcanda!.20050311215703:reverse-region
        #@+node:zorcanda!.20050524093817:transpose-words
        def transposeWords( self ):
            
            editor = self.emacs.editor
            pos = editor.getCaretPosition()
            if pos != -1:
                
                ranges = self.emacs.getAttributeRanges( "trans-word" )
                if ranges:
                    start = self.emacs.getWordStartIndex()
                    end = self.emacs.getWordEndIndex()
                    doc = editor.getDocument()
                    w1 = doc.getText( start, end - start )
                    w2 = doc.getText( ranges[ 0 ], ranges[ -1 ] - ranges[ 0 ] )
                    doc.replace( ranges[ 0 ], ranges[ -1 ] - ranges[ 0 ], w1, None )
                    start = self.emacs.getWordStartIndex()
                    end = self.emacs.getWordEndIndex()
                    try:
                        self.emacs.startCompounding( "Transpose Words" )
                        doc.replace( start, end - start, w2, None )
                    finally:
                        self.emacs.stopCompounding()
                    self.emacs.clearAttribute( "trans-word" )
                    return
                
                else:
                    start = self.emacs.getWordStartIndex()
                    end = self.emacs.getWordEndIndex()
                    self.emacs.addAttributeToRange( 'trans-word', "trans-word" , start, end-start, color = java.awt.Color.YELLOW )
        
                return True
        #@-node:zorcanda!.20050524093817:transpose-words
        #@+node:zorcanda!.20050728181941.11:getCommands getKeystrokes
        def getAltXCommands( self ):
            return self.ctuple   
            
            
        def getKeystrokes( self ):   
            return self.kstuple
            
        #@-node:zorcanda!.20050728181941.11:getCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.15:keyboardQuit
        def keyboardQuit( self ):
            pass
        #@nonl
        #@-node:zorcanda!.20050729154147.15:keyboardQuit
        #@+node:zorcanda!.20051213151213:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
            
            header = '--------\n'    
            sum = Information( "Transposition", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
            
            self.info_structures = {}
            crc = 'swaps the current line with the line above it.'
            cr = Information( "transpose-lines" , crc )
            self.info_structures[ "transpose-lines" ] = cr
            
            crc2 = "takes region and reverses the ordering of the lines, last becomes first, first last."
            cr2 = Information( "reverse-region", crc2 )
            self.info_structures[ "reverse-region" ] = cr2
            
            crc3 = "takes two words and transposes them."
            cr3 = Information("transpose-words", crc3)
            self.info_structures["transpose-words"] = cr3
        
            
            
        #@-node:zorcanda!.20051213151213:information
        #@-others
        
    
    #@-node:zorcanda!.20050311160343:transpose
    #@+node:zorcanda!.20050311163509:capitalization
    class capitalization( BaseCommand ):
        
        def __init__( self, emacs ):
            self.emacs = emacs
            self.commands ={
            
                'capitalize-region': self.capitalizeRegion,
                'upcase-region': self.upcaseRegion,
                'downcase-region': self.downcaseRegion,
                'capitalize-word': self.capitalizeWord,
                'downcase-word': self.downcaseWord,
                'upcase-word': self.upcaseWord,
            
            
            }
            self.ctuple = tuple(self.commands.keys())
            self.defineInfoStructures()
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands)
            
        def __call__( self, event, command ):
            
            message = self.commands[ command ]()
            if message:
                self.emacs.keyboardQuit( event )
                self.emacs.setCommandText( message )
                self.emacs.beep()
                return True
                
            return self.emacs.keyboardQuit( event )
            
    
        #@    @+others
        #@+node:zorcanda!.20050311163509.1:capitalize-region
        def capitalizeRegion( self ):
        
            editor = self.emacs.editor
            stext = editor.getSelectedText()
            if stext == None:
                return "Region not selected"
                
            ntext = []
            lc = ' '
            for z in stext:
                if lc.isspace():
                    z2 = z.capitalize()
                    ntext.append( z2 )
                else:
                    ntext.append( z )
                lc = z
                
            ntext = ''.join( ntext )
            try:
                self.emacs.startCompounding( "Capitalize Region" )
                editor.replaceSelection( ntext )
            finally:
                self.emacs.stopCompounding()
        #@-node:zorcanda!.20050311163509.1:capitalize-region
        #@+node:zorcanda!.20050311163509.2:upcase-region
        def upcaseRegion( self ):
            
            editor = self.emacs.editor
            stext = editor.getSelectedText()
            if stext == None:
                return "Region not selected"
                
            ntext = stext.upper()
            try:
                self.emacs.startCompounding( "Upcase Region" )
                editor.replaceSelection( ntext )
            finally:
                self.emacs.stopCompounding()
            
        
        #@-node:zorcanda!.20050311163509.2:upcase-region
        #@+node:zorcanda!.20050311163509.3:downcase-region
        def downcaseRegion( self ):
        
            editor = self.emacs.editor
            stext = editor.getSelectedText()
            if stext == None:
                return "Region not selected"
                
            ntext = stext.lower()
            try:
                self.emacs.startCompounding( "Downcase Region" )
                editor.replaceSelection( ntext )
            finally:
                self.emacs.stopCompounding()
        #@-node:zorcanda!.20050311163509.3:downcase-region
        #@+node:zorcanda!.20050312111617:capitalize-word
        def capitalizeWord( self ):
            
            start, end = self.emacs.getWordStartIndex(), self.emacs.getWordEndIndex()
            
            if start != -1:
                
                sdoc = self.emacs.editor.getStyledDocument()
                txt = sdoc.getText( start, end - start )
                txt = txt.capitalize()
                pos = self.emacs.editor.getCaretPosition()
                try:
                    self.emacs.startCompounding( "Capitalize Word" )
                    sdoc.replace( start, len( txt ), txt, None )  
                finally:
                    self.emacs.stopCompounding()
                self.emacs.editor.setCaretPosition( pos )
        
                
        #@nonl
        #@-node:zorcanda!.20050312111617:capitalize-word
        #@+node:zorcanda!.20050312111617.1:upcase-word
        def upcaseWord( self ):
            
            start, end = self.emacs.getWordStartIndex(), self.emacs.getWordEndIndex()
            
            if start != -1:
                
                sdoc = self.emacs.editor.getStyledDocument()
                txt = sdoc.getText( start, end - start )
                txt = txt.upper()
                pos = self.emacs.editor.getCaretPosition()
                try:
                    self.emacs.startCompounding( "Upcase Word" )
                    sdoc.replace( start, len( txt ), txt, None )
                finally:
                    self.emacs.stopCompounding()
                self.emacs.editor.setCaretPosition( pos )
            
        #@-node:zorcanda!.20050312111617.1:upcase-word
        #@+node:zorcanda!.20050312111617.2:downcase-word
        def downcaseWord( self ):
        
            start, end = self.emacs.getWordStartIndex(), self.emacs.getWordEndIndex()
            
            if start != -1:
                
                sdoc = self.emacs.editor.getStyledDocument()
                txt = sdoc.getText( start, end - start )
                txt = txt.lower()
                pos = self.emacs.editor.getCaretPosition()
                try:
                    self.emacs.startCompounding( "Downcase Word" )
                    sdoc.replace( start, len( txt ), txt, None )
                finally:
                    self.emacs.stopCompounding()
                self.emacs.editor.setCaretPosition( pos )
            
        #@-node:zorcanda!.20050312111617.2:downcase-word
        #@+node:zorcanda!.20050728181941.12:getCommands getKeystrokes
        def getAltXCommands( self ):
            return self.ctuple  
            
            
        def getKeystrokes( self ):   
            return self.kstuple
            
        #@-node:zorcanda!.20050728181941.12:getCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.16:keyboardQuit
        def keyboardQuit( self ):
            pass
        #@nonl
        #@-node:zorcanda!.20050729154147.16:keyboardQuit
        #@+node:zorcanda!.20051213152144:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
            
            header = '--------\n'    
            sum = Information( "Capitalization", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
        
            self.info_structures = {}
            for z in ( ( 'upcase-region' ,'Upper cases all the text in the selection.' ),
                        ( 'downcase-region', 'Lower cases all the text in the selection.' ),
                        ( 'capitalize-region', 'Capitalizes all the text in the selection.' ),
                        ( 'upcase-word', 'Upper cases the current word.' ),
                        ( 'downcase-word', 'Lower cases the current word.' ),
                        ('capitalize-word', 'Capitalizes the current word.' ) ):
                info = Information( z[ 0 ], z[ 1 ] )
                self.info_structures[ z[ 0 ] ] = info
            
        
            
            
        #@-node:zorcanda!.20051213152144:information
        #@-others
    #@nonl
    #@-node:zorcanda!.20050311163509:capitalization
    #@+node:zorcanda!.20050311165606:replacement
    class replacement( BaseCommand ):
        import java.util.regex as regex
        
        def __init__( self, emacs ):
            
            self.emacs = emacs
            self.commands = {
            
                'query-replace': self.queryReplace,
                'query-replace-regexp': self.queryReplaceRegexp,
                'replace-string': self.replaceString,
                
            
            }
            self.mode = None
            self.submode = None
            
            self.search = None
            self.replacement = None
            self.compoundname = None
            self.ctuple = tuple(self.commands.keys())
            self.defineInfoStructures()
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands)
            
            
        def __call__( self, event, command ):
            
            if self.mode:
                if self.mode in( 1, 2 ):
                    qcommand = g.choose( self.mode == 1, self.queryReplace, self.queryReplaceRegexp )
                    if self.submode in( 1, 2 ):
                        if command == 'Enter':
                            return qcommand()
                        else:
                            return self.emacs.eventToMinibuffer( event )   
                    if self.submode == 3:
                        message = self.doReplacement( event )
                        if message == None:
                            message = qcommand()
                        if message not in( True, False ) and message:
                            self.emacs.keyboardQuit( event )
                            self.emacs.minibuffer.setText( "" )
                            self.emacs.setCommandText( message )
                            return True
                        return True
                elif self.mode == 3:
                    if command == 'Enter':
                        message = self.replaceString()
                        if message not in ( True, False ) and message:
                            self.emacs.keyboardQuit( event )
                            self.emacs.minibuffer.setText( "" )
                            self.emacs.setCommandText( message )
                            return True
                        else: return True
                    else:
                        return self.emacs.eventToMinibuffer( event )
            
            return self.commands[ command ]()
            
            
        #@    @+others
        #@+node:zorcanda!.20050311165606.1:query-replace
        def queryReplace( self ):
            self.compoundname = "Query Replace"
            if self.mode == None:
                self.mode = 1
                self.submode = 1
                self.emacs.setCommandText( "Query For:" )
                self.emacs.minibuffer.setText( "" )
                self.emacs._stateManager.setState( self )
                return True
            
            if self.submode == 1:
                
                self.search = self.emacs.minibuffer.getText()
                self.emacs.minibuffer.setText( "" )
                self.emacs.setCommandText( "Replace With:" )
                self.submode = 2
                return True
                
            if self.submode == 2:
                
                self.replacement = self.emacs.minibuffer.getText()
                self.emacs.minibuffer.setText( "" )
                self.submode = 3
                
                
            if self.submode == 3:
                
                editor = self.emacs.editor
                pos = editor.getCaretPosition()
                txt = editor.getText()
                where = txt.find( self.search, pos )
                if where == -1:
                    editor.setCaretPosition( editor.getSelectionEnd() )
                    return "No more matches found"
                else:
                    editor.setSelectionStart( where )
                    editor.setSelectionEnd( where + len( self.search ) )
                    self.emacs.setCommandText( "Replace %s with %s ? y/n(! replaces all)" %( self.search, self.replacement ) )
                    return True
                    
                
        
        #@-node:zorcanda!.20050311165606.1:query-replace
        #@+node:zorcanda!.20050311165606.2:query-replace-regexp
        def queryReplaceRegexp( self ):
            self.compoundname = "Query Replace Regexp"
            if self.mode == None:
                self.mode = 2
                self.submode = 1
                self.emacs.setCommandText( "Query For:" )
                self.emacs.minibuffer.setText( "" )
                self.emacs._stateManager.setState( self )
                return True
            
            if self.submode == 1:
                
                search = self.emacs.minibuffer.getText()
                import java.util.regex
                self.search = java.util.regex.Pattern.compile( search )
                self.emacs.minibuffer.setText( "" )
                self.emacs.setCommandText( "Replace With:" )
                self.submode = 2
                return True
                
            if self.submode == 2:
                
                self.replacement = self.emacs.minibuffer.getText()
                self.emacs.minibuffer.setText( "" )
                self.submode = 3
                
                
            if self.submode == 3:
                
                editor = self.emacs.editor
                pos = editor.getCaretPosition()
                txt = editor.getText()
                
                import java.lang.String
                match = self.search.matcher( java.lang.String( txt[ pos: ] ) )
                found = match.find()
                if found:
                    start = match.start()
                    end = match.end()
                else:
                    start = end = -1
                if start == -1:
                    editor.setCaretPosition( editor.getSelectionEnd() )
                    return "No more matches found"
                else:
                    editor.setSelectionStart( pos + start )
                    editor.setSelectionEnd( pos + end )
                    self.emacs.setCommandText( "Replace %s with %s ? y/n(! replaces all)" %( editor.getSelectedText(), self.replacement ) )
                    return True
            
        #@-node:zorcanda!.20050311165606.2:query-replace-regexp
        #@+node:zorcanda!.20050311165732:replace-string
        def replaceString( self ):
        
            if self.mode == None:
                self.mode = 3
                self.submode = 1
                self.emacs.setCommandText( "Replace String:" )
                self.emacs.minibuffer.setText( "" )
                self.emacs._stateManager.setState( self )
                return True
            
            if self.submode == 1:
                
                self.search = self.emacs.minibuffer.getText()
                self.emacs.minibuffer.setText( "" )
                self.emacs.setCommandText( "Replace %s With:" % self.search )
                self.submode = 2
                return True    
                
            if self.submode == 2:
                
                replacement = self.emacs.minibuffer.getText()
                editor = self.emacs.editor
                pos = editor.getCaretPosition()
                txt = editor.getText()[ pos: ]
                amount = txt.count( self.search )
                ntxt = txt.replace( self.search, replacement )
                sd = editor.getStyledDocument()
                try:
                    self.emacs.startCompounding( "Replace String" )
                    sd.replace( pos, len( txt ), ntxt, None )
                finally:
                    self.emacs.stopCompounding()
                editor.setCaretPosition( pos )
                return "%s occurances of %s replaced with %s" %( amount, self.search, replacement )
                
            
        
        #@-node:zorcanda!.20050311165732:replace-string
        #@+node:zorcanda!.20050311170911:doReplacement
        def doReplacement( self, event ):
            
            
            kc = event.getKeyChar()
            
            if not java.lang.Character.isDefined( kc ): return False
            elif kc == 'y':
                try:
                    self.emacs.startCompounding( self.compoundname )
                    self.emacs.editor.replaceSelection( self.replacement )
                finally:
                    self.emacs.stopCompounding()
            elif kc =='!':
                return self.replaceAll()
                
            else:
                pass
        #@nonl
        #@-node:zorcanda!.20050311170911:doReplacement
        #@+node:zorcanda!.20050311205755:replaceAll
        def replaceAll( self ):
            
            editor = self.emacs.editor
            spos = editor.getSelectionStart()
            editor.setCaretPosition( spos )
            cp = editor.getCaretPosition()
            txt = editor.getText()[ cp : ]
            sd = editor.getStyledDocument()
            
            if self.mode == 1:
                amount = txt.count( self.search )
                ntxt = txt.replace( self.search, self.replacement )
                try:
                    self.emacs.startCompounding( self.compoundname )
                    sd.replace( cp, len( txt ), ntxt, None )
                finally:
                    self.emacs.stopCompounding()
                editor.setCaretPosition( spos )
                return '%s instances of %s replaced with %s' %( amount, self.search, self.replacement )
            else:
                import java.lang.String
                txt_s = java.lang.String( txt )
                scount = txt.count( self.replacement )
                #natxt = self.search.split( txt_s )
                #print "natxt len is %s" % len( natxt )
                matcher = self.search.matcher( txt_s )
                ntxt = matcher.replaceAll( self.replacement )
                ncount = ntxt.count( self.replacement )
                #ntxt = self.replacement.join( natxt )
                try:
                    self.emacs.startCompounding( self.compoundname )
                    sd.replace( cp, len( txt ), ntxt, None )
                finally:
                    self.emacs.stopCompounding()
                editor.setCaretPosition( spos )
                return '%s instances of %s replaced with %s' %( ncount - scount, self.search.pattern(), self.replacement )
                
                
                
        #@-node:zorcanda!.20050311205755:replaceAll
        #@+node:zorcanda!.20050728181941.13:getCommands getKeystrokes
        def getAltXCommands( self ):
            return self.ctuple 
            
            
        def getKeystrokes( self ):   
            return self.kstuple
            
        #@-node:zorcanda!.20050728181941.13:getCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.17:keyboardQuit
        def keyboardQuit( self ):
            
            self.mode = None
        #@nonl
        #@-node:zorcanda!.20050729154147.17:keyboardQuit
        #@+node:zorcanda!.20051213153111:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
            
            header = '''--------
        SwingMacs has several different query and replace commands.  Each asks the user
        for a search string/pattern and text to replace matches with.  Each has different
        levels of interactivity.'''       
            sum = Information( "Querying and Replacing", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
            
        
            self.info_structures = {}
            for z in ( ( 'query-replace' , 'asks the user for a string to match and a string to replace.  Is asked for each individual word if replacement is desired. "!" replaces all.' ),
                        ( 'query-replace-regexp', 'asks the user for a regular expression to match and a string to replace.  Is asked for each individual word if replacement is desired. "!" replaces all.  The regular expressions are executed from the java.util.regex package, see details in javadoc.'),
                        ( 'replace-string', 'asks user for a string to match and a replacement string.  Upon execution all matches are replaced.' ) ):
                info = Information( z[ 0 ], z[ 1 ] )
                self.info_structures[ z[ 0 ] ] = info
            
        
            
            
        #@-node:zorcanda!.20051213153111:information
        #@-others
        
    
    
    
    
    #@-node:zorcanda!.20050311165606:replacement
    #@+node:zorcanda!.20050311214332:sorters
    class sorters( BaseCommand ):
        
        def __init__( self, emacs ):
            self.emacs = emacs
            self.commands ={
            
                'sort-lines': self.sortLines
            
            }
            self.ctuple = tuple(self.commands.keys())
            self.defineInfoStructures()
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands)
            
        def __call__( self, event, command ):
            
            self.commands[ command ]()
            return self.emacs.keyboardQuit( event )
            
        #@    @+others
        #@+node:zorcanda!.20050311214332.1:sort-lines
        def sortLines( self ):
            
            editor = self.emacs.editor
            txt = editor.getSelectedText()
            if txt == None: return
            txtlines = txt.splitlines()
            txtlines.sort()
            ntxt = '\n'.join( txtlines )
            if txt[ -1 ] == '\n': ntxt = '%s\n' % ntxt
            try:
                self.emacs.startCompounding( "Sort Lines" )
                editor.replaceSelection( ntxt )
            finally:
                self.emacs.stopCompounding()
        
        #@-node:zorcanda!.20050311214332.1:sort-lines
        #@+node:zorcanda!.20050728181941.14:getCommands getKeystrokes
        def getAltXCommands( self ):
            return self.ctuple 
            
            
        def getKeystrokes( self ):   
            return self.kstuple
        #@-node:zorcanda!.20050728181941.14:getCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.18:keyboardQuit
        def keyboardQuit( self ):
            pass
        #@nonl
        #@-node:zorcanda!.20050729154147.18:keyboardQuit
        #@+node:zorcanda!.20051213153649:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
            
            header = '--------\n'    
            sum = Information( "Sorting", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
        
            self.info_structures = {}
            cr = Information( "sort-lines" , 'sorts the selected lines of text.' )
            self.info_structures[ "sort-lines" ] = cr
            
            
            
        #@-node:zorcanda!.20051213153649:information
        #@-others
        
    #@-node:zorcanda!.20050311214332:sorters
    #@+node:zorcanda!.20050312114506:lines
    class lines( BaseCommand ):
        import java.util.regex as regexp
        
        def __init__( self, emacs ):
            
            self.emacs = emacs
            self.mode = None
            self.commands= {
            
                'keep-lines': self.keepLines,
                'flush-lines': self.flushLines,
            
            
            }
            self.defineInfoStructures()
            self.ctuple = tuple(self.commands.keys())
            self.defineInfoStructures()
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands)
            
            
        def __call__( self, event, command ):
            
            if self.mode:
                if self.mode in ( 1, 2 ):
                    if command == 'Enter':
                        if self.mode == 1:
                            self.keepLines()
                        else:
                            self.flushLines()
                        self.emacs.keyboardQuit( event )
                        return True
                    else:
                        return self.emacs.eventToMinibuffer( event )
                
            
            return self.commands[ command ]()
            
            
        #@    @+others
        #@+node:zorcanda!.20050312114506.1:keep-lines
        def keepLines( self ):
            import java.util.regex as regexp
            if self.mode == None:
                self.mode = 1
                self.emacs.setCommandText( "Keep lines( containing match for regexp ):" )
                self.emacs.minibuffer.setText( "" )
                self.emacs._stateManager.setState( self )
                return True
            
            
        
            pattern = self.emacs.minibuffer.getText()
            regex = regexp.Pattern.compile( java.lang.String( pattern ) )
            
            editor = self.emacs.editor
            pos = editor.getCaretPosition()
            txt = editor.getText()
            start = txt.rfind( '\n', 0, pos )
            if start == -1: start = 0
            else: start += 1
            
            
            ntxt = txt[ start: ]
            ntxt_lines = ntxt.splitlines( True )
        
            matcher = regex.matcher( java.lang.String( ntxt_lines[ 0 ] ) )
            keepers = []
            for z in ntxt_lines:
                matcher.reset( java.lang.String( z ) )
                found = matcher.find()
                if found: keepers.append( z )
                
                
            keeptxt = ''.join( keepers )
            
            sdoc = editor.getStyledDocument()
            try:
                self.emacs.startCompounding( "Keep Lines" )
                sdoc.replace( start, len( ntxt ), keeptxt, None )
            finally:
                self.emacs.stopCompounding()
            if ( sdoc.getLength() - 1 ) >= pos:
                editor.setCaretPosition( pos )
            
                
                
        
        
        #@-node:zorcanda!.20050312114506.1:keep-lines
        #@+node:zorcanda!.20050312114506.2:flush-lines
        def flushLines( self ):
        
            import java.util.regex as regexp
            if self.mode == None:
                self.mode = 2
                self.emacs.setCommandText( "Flush lines( containing match for regexp ):" )
                self.emacs.minibuffer.setText( "" )
                self.emacs._stateManager.setState( self )
                return True
            
            
        
            pattern = self.emacs.minibuffer.getText()
            regex = regexp.Pattern.compile( java.lang.String( pattern ) )
            
            editor = self.emacs.editor
            pos = editor.getCaretPosition()
            txt = editor.getText()
            start = txt.rfind( '\n', 0, pos )
            if start == -1: start = 0
            else: start += 1
            
            
            ntxt = txt[ start: ]
            ntxt_lines = ntxt.splitlines( True )
        
            matcher = regex.matcher( java.lang.String( ntxt_lines[ 0 ] ) )
            keepers = []
            for z in ntxt_lines:
                matcher.reset( java.lang.String( z ) )
                found = matcher.find()
                if found: continue
                keepers.append( z )
                
                
            keeptxt = ''.join( keepers )
            
            sdoc = editor.getStyledDocument()
            try:
                self.emacs.startCompounding( "Flush Lines" )
                sdoc.replace( start, len( ntxt ), keeptxt, None )
            finally:
                self.emacs.stopCompounding()
            if ( sdoc.getLength() - 1 ) >= pos:
                editor.setCaretPosition( pos )
            
        #@-node:zorcanda!.20050312114506.2:flush-lines
        #@+node:zorcanda!.20050728181941.15:getCommands getKeystrokes
        def getAltXCommands( self ):
            return self.ctuple 
            
            
        def getKeystrokes( self ):   
            return self.kstuple 
            
        #@-node:zorcanda!.20050728181941.15:getCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.19:keyboardQuit
        def keyboardQuit( self ):
            self.mode = None
        #@nonl
        #@-node:zorcanda!.20050729154147.19:keyboardQuit
        #@+node:zorcanda!.20051213154040:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
            
            header = '--------\n'    
            sum = Information( "Lines", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
        
            self.info_structures = {}
            for z in ( ( 'flush-lines', 'removes lines that match a regular expression. The regular expressions are executed from the java.util.regex package, see details in javadoc.' ),
                       ( 'keep-lines', 'keeps lines that match a regular expression.  Same regular expression details as flush-lines.' ) ):
                
                cr = Information( z[ 0 ], z[ 1 ] )
                self.info_structures[ z[ 0 ] ] = cr
            
            
            
        #@-node:zorcanda!.20051213154040:information
        #@-others
        
    
    
    #@-node:zorcanda!.20050312114506:lines
    #@+node:zorcanda!.20050312122805:tabs
    class tabs( BaseCommand ):
        
        def __init__( self, emacs ):
            
            self.emacs = emacs
            self.commands ={
            
                'tabify': self.tabify,
                'untabify': self.untabify,
            
            
            
            }
            self.ctuple = tuple(self.commands.keys())
            self.defineInfoStructures()
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands) 
            
        def __call__( self, event, command ):
            
            
            rval = self.commands[ command ]()
            self.emacs.keyboardQuit( event )
            return rval
            
        #@    @+others
        #@+node:zorcanda!.20050312122805.1:tabify
        def tabify( self ):
        
            #tw = self.emacs.getTabWidth()
            editor = self.emacs.editor
            txt = editor.getSelectedText()
            if txt == None: return True
            
            #space_replace = ' ' * tw
            ntxt = txt.replace( ' ', '\t' )
            pos = editor.getCaretPosition()
            try:
                self.emacs.startCompounding( "Tabify" )
                editor.replaceSelection( ntxt )
            finally:
                self.emacs.stopCompounding()
            editor.setCaretPosition( pos )
            return True
            
            
        
        
        #@-node:zorcanda!.20050312122805.1:tabify
        #@+node:zorcanda!.20050312122805.2:untabify
        def untabify( self ):
            
            #tw = self.emacs.getTabWidth()
            editor = self.emacs.editor
            txt = editor.getSelectedText()
            if txt == None: return True
            
            #space_replace = ' ' * tw
            ntxt = txt.replace( '\t', ' ' )
            pos = editor.getCaretPosition()
            try:
                self.emacs.startCompounding( "Untabify" )
                editor.replaceSelection( ntxt )
            finally:
                self.emacs.stopCompounding()
            editor.setCaretPosition( pos )
            return True
            
        #@-node:zorcanda!.20050312122805.2:untabify
        #@+node:zorcanda!.20050728181941.16:getCommands getKeystrokes
        def getAltXCommands( self ):
            return self.ctuple 
            
            
        def getKeystrokes( self ):   
            return self.kstuple 
            
        #@-node:zorcanda!.20050728181941.16:getCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.20:keyboardQuit
        def keyboardQuit( self ):
            pass
        #@nonl
        #@-node:zorcanda!.20050729154147.20:keyboardQuit
        #@+node:zorcanda!.20051213155956:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
        
            
            header = '--------\n'    
            sum = Information( "Tabs", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
        
            self.info_structures = {}
            for z in ( ( 'tabify', 'changes spaces in selected region into tabs.'),
                       ( 'untabify', 'changes tabs in selected region into spaces.' ) ):
                info = Information( z[ 0 ], z[ 1 ] )
                self.info_structures[ z[ 0 ] ] = info
            
            
        #@-node:zorcanda!.20051213155956:information
        #@-others
        
    #@-node:zorcanda!.20050312122805:tabs
    #@+node:zorcanda!.20050312155939:registers
    class registers( BaseCommand ):
        
        def __init__( self, emacs ):
            
            self.emacs = emacs
            self.mode = None
            self.submode = None
            #emacs.modeStrategies.append( self )
            self.registers = {}
            self.commands = {
            
                'copy-to-register': self.copyToRegister,
                'insert-register': self.insertRegister,
                'append-to-register': self.appendToRegister,
                'prepend-to-register': self.prependToRegister,
                
            
            }
            self.mode_command ={
            
                1: self.copyToRegister,
                3: self.appendToRegister,
                4: self.prependToRegister,
            
            
            
            }
            self.defineInfoStructures()
            self.ctuple = tuple(self.commands.keys())
            self.defineInfoStructures()
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands) 
            
        def __call__( self, event, command ):
    
            if self.mode:
                if self.mode in ( 1, 3, 4 ):
                    self.emacs.eventToMinibuffer( event )
                    message =   self.mode_command[ self.mode ]()           #self.copyToRegister()
                    if message not in ( True, False ) and message:
                        self.emacs.keyboardQuit( event )
                        self.emacs.setCommandText( message )
                        return True
                    else:
                        return self.emacs.keyboardQuit( event )
                elif self.mode == 2:
                    self.emacs.eventToMinibuffer( event )
                    message = self.insertRegister()
                    if message not in( True, False ) and message:
                        self.emacs.keyboardQuit( event )
                        self.emacs.setCommandText( message )
                        return True
                    return self.emacs.keyboardQuit( event )
            
            return self.commands[ command ]()
            
        #@    @+others
        #@+node:zorcanda!.20050312160220:copy-to-register
        def copyToRegister( self ):
         
            if self.mode == None:
                
                self.mode = 1
                self.emacs.minibuffer.setText( "" )
                self.emacs._stateManager.setState( self )
                self.emacs.setCommandText( "Copy To Which Register( a-z )?" )
                return True
                
                
            register = self.emacs.minibuffer.getText()
            self.emacs.minibuffer.setText( "" )
            if not java.lang.Character.isLetter( register ):
                return 'Character is not a Letter'
                
            register = register.lower()
            txt = self.emacs.editor.getSelectedText()
            if txt == None:
                return 'Region not defined'
                
            self.registers[ register ] = txt
            self.emacs.editor.setCaretPosition( self.emacs.editor.getCaretPosition() )
            
                
            
        
        #@-node:zorcanda!.20050312160220:copy-to-register
        #@+node:zorcanda!.20050312160220.1:insert-register
        def insertRegister( self ):
         
            if self.mode == None:
                
                self.mode = 2
                self.emacs.minibuffer.setText( "" )
                self.emacs._stateManager.setState( self )
                self.emacs.setCommandText( "Insert From Which Register( a-z )?" )
                return True
                
                
            
            
            register = self.emacs.minibuffer.getText()
            if not java.lang.Character.isLetter( register ):
                return 'Character is not a Letter'
                
            register = register.lower()
            if not self.registers.has_key( register ):
                return 'Register %s empty' % register
                
            data = self.registers[ register ]
            sdoc = self.emacs.editor.getStyledDocument()
            sdoc.insertString( self.emacs.editor.getCaretPosition(), data, None )
        
                
            
            
        #@-node:zorcanda!.20050312160220.1:insert-register
        #@+node:zorcanda!.20050312171820:append-to-register
        def appendToRegister( self ):
        
            if self.mode == None:
                
                self.mode = 3
                self.emacs.minibuffer.setText( "" )
                self.emacs._stateManager.setState( self )
                self.emacs.setCommandText( "Append To Which Register( a-z )?" )
                return True
                
                
            register = self.emacs.minibuffer.getText()
            self.emacs.minibuffer.setText( "" )
            if not java.lang.Character.isLetter( register ):
                return 'Character is not a Letter'
                
            register = register.lower()
            txt = self.emacs.editor.getSelectedText()
            if txt == None:
                return 'Region not defined'
                
            if self.registers.has_key( register ):
                data = self.registers[ register ]
                ndata = '%s%s' %( data, txt )
                self.registers[ register ] = ndata
            else:
                self.registers[ register ] = txt
                
            self.emacs.editor.setCaretPosition( self.emacs.editor.getCaretPosition() )
            
        #@-node:zorcanda!.20050312171820:append-to-register
        #@+node:zorcanda!.20050312171820.1:prepend-to-register
        def prependToRegister( self ):
        
            if self.mode == None:
                
                self.mode = 4
                self.emacs.minibuffer.setText( "" )
                self.emacs._stateManager.setState( self )
                self.emacs.setCommandText( "Prepend To Which Register( a-z )?" )
                return True
                
                
            register = self.emacs.minibuffer.getText()
            self.emacs.minibuffer.setText( "" )
            if not java.lang.Character.isLetter( register ):
                return 'Character is not a Letter'
                
            register = register.lower()
            txt = self.emacs.editor.getSelectedText()
            if txt == None:
                return 'Region not defined'
                
            if self.registers.has_key( register ):
                data = self.registers[ register ]
                ndata = '%s%s' %( txt, data )
                self.registers[ register ] = ndata
            else:
                self.registers[ register ] = txt
                
            self.emacs.editor.setCaretPosition( self.emacs.editor.getCaretPosition() )
            
            
        
        #@-node:zorcanda!.20050312171820.1:prepend-to-register
        #@+node:zorcanda!.20050728181941.17:getAltXCommands getKeystrokes
        def getAltXCommands( self ):
            return self.ctuple
            
            
        def getKeystrokes( self ):   
            return self.kstuple 
        #@-node:zorcanda!.20050728181941.17:getAltXCommands getKeystrokes
        #@+node:zorcanda!.20050729154147.21:keyboardQuit
        def keyboardQuit( self ):
            self.mode = None
        #@nonl
        #@-node:zorcanda!.20050729154147.21:keyboardQuit
        #@+node:zorcanda!.20051213160357:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
        
            
            header = '''--------
        Registers are places, defined by the letters a-z, where the user can store data temporarily.  There are a variety of register commands:'''   
            sum = Information( "Registers", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
        
            self.info_structures = {}
            for z in ( ( 'copy-to-register', 'copy the selected text to a register specified by the user.' ),
                        ( 'append-to-register', 'copy the selected text to the end of a register.' ),
                        ( 'prepend-to-register', 'copy the selected text to the beginning of a register.' ),
                        ( 'insert-register', 'insert a register into the current buffer.' ) ):
                info = Information( z[ 0 ], z[ 1 ] )
                self.info_structures[ z[ 0 ] ] = info
            
            
        #@-node:zorcanda!.20051213160357:information
        #@-others
        
    
    #@-node:zorcanda!.20050312155939:registers
    #@+node:zorcanda!.20050519094216:selection
    class selection( sevent.DocumentListener, BaseCommand ):
    
        def __init__( self, emacs ):
            
            self.emacs = emacs
            self.emacs.editor.getDocument().addDocumentListener( self )
            self.start = None
            self.commands = {
                "set-mark-command": self.startSelection      
            }
            self.ctuple = tuple(self.commands.keys())
            self.defineInfoStructures()
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands) 
            
            
        def __call__( self, event, command ):
            
            
            if self.commands.has_key( command ):
                return self.commands[ command ]()
            elif self.emacs._stateManager2.hasState() == self:
                if not java.lang.Character.isWhitespace( event.getKeyChar() ) and command not in ("Backspace", "F" ):
                    self.select()
                
            
        def startSelection( self ):
            
            self.start = self.emacs.editor.getCaretPosition()
            sstart = self.emacs.editor.getSelectionStart()
            send = self.emacs.editor.getSelectionEnd()
            foldprotection = self.emacs.c.frame.body.editor.foldprotection
            fold = foldprotection.getFold( self.start, self.start )
            if fold:
                foldprotection.removeFold( fold )
                return
            elif sstart != send:
                foldprotection.foldSelection()
                return self.emacs.keyboardQuit()
            self.emacs._stateManager2.setState( self )
            return True
        
        def executeSelection( self ):
    
            if self.start == -2: pass
            elif self.start != -1:
                editor = self.emacs.editor
                cp = editor.getCaretPosition()
                editor.setCaretPosition( self.start )
                editor.moveCaretPosition( cp )
            else:
                self.emacs.keyboardQuit()    
        
            
        def select( self ):
            dc = DefCallable( self.executeSelection )
            ft = dc.wrappedAsFutureTask()
            java.awt.EventQueue.invokeLater( ft )
            
        def changedUpdate( self, event ):
            pass
            
        def insertUpdate( self, event ):
            pass
            
        def removeUpdate( self, event ):
            
            if self.emacs.block_moving == -1:
                self.start = -1 
            else:
                self.start = self.emacs.block_moving
                  
        
        #@    @+others
        #@+node:zorcanda!.20050728181941.18:getAltXCommands getKeystrokes
        def getAltXCommands( self ):
            return self.ctuple
            
            
        def getKeystrokes( self ):   
            return self.kstuple
            
        #@-node:zorcanda!.20050728181941.18:getAltXCommands getKeystrokes
        #@+node:zorcanda!.20050729153829:keyboardQuit
        def keyboardQuit( self ):
            pass
        #@nonl
        #@-node:zorcanda!.20050729153829:keyboardQuit
        #@+node:zorcanda!.20060109130254:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        def getKeyStrokeInfo( self ):
           
            sum = Information( "",  "" )
            for z in self.kstrokes_info: 
                item = self.kstrokes_info[ z ]
                info = Information( z, item.doc )
                sum.addInformation( info )
            
            return sum
            
        
        def getSummaryInfo( self ):
            
            header = '''--------'''    
            sum = Information( "Marking", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
               
            self.info_structures = {}
            for z in ( ( 'set-mark-command', 'sets the mark where the cursor is at, subsequent movement via keyboard selects text' ),):
                info = Information( z[ 0 ], z[ 1 ] )
                self.info_structures[ z[ 0 ] ] = info 
        
            
        #@nonl
        #@-node:zorcanda!.20060109130254:information
        #@-others
        
    
    #@-node:zorcanda!.20050519094216:selection
    #@+node:zorcanda!.20051102134821:quoters
    class quoters( BaseCommand ):
    
        def __init__( self, emacs ):
            
    
            self.emacs = emacs
            self.commands = {
            
                "single-quote-selection": self.singleQuote,
                "double-quote-selection": self.doubleQuote,
                "tripled-quote-selection": self.tripledQuote,
                "triples-quote-selection": self.triplesQuote,
            
                
            }
            self.ctuple = tuple(self.commands.keys())
            self.defineInfoStructures()
            kstrokes = emacs.getKeyStrokesForCommands( self.commands.keys() )
            emacs.configureStrategyWithKeystrokes(self, kstrokes, self.commands)
            
            
        def __call__( self, event, command ):
            
            
            if self.commands.has_key( command ):
                return self.commands[ command ]()
    
    
        #@    @+others
        #@+node:zorcanda!.20051102135220:quote
        def singleQuote( self ):
            return self.quote( "'" )
            
        def doubleQuote( self ):
            return self.quote( '"' )
            
        def tripledQuote( self ):
            return self.quote( '"""' )
        
        def triplesQuote( self ):
            return self.quote( "'''" )
        
        
        def quote( self, token ):
            
            editor = self.emacs.editor
            start = editor.getSelectionStart()
            end = editor.getSelectionEnd()
            if start == end: return
            doc = editor.getDocument()
            txt = doc.getText( start, end - start )
            try:
                self.emacs.startCompounding( "Quote with %s" % token )
                editor.replaceSelection( "%s%s%s" %( token, txt, token ) )
            finally:
                self.emacs.stopCompounding()
            self.emacs.keyboardQuit()
        #@nonl
        #@-node:zorcanda!.20051102135220:quote
        #@+node:zorcanda!.20051102135220.1:getAltXCommands getKeystrokes
        def getAltXCommands( self ):
            return self.ctuple
            
            
        def getKeystrokes( self ):   
            return self.kstuple
        #@-node:zorcanda!.20051102135220.1:getAltXCommands getKeystrokes
        #@+node:zorcanda!.20051102135220.2:keyboardQuit
        def keyboardQuit( self ):
            pass
        #@nonl
        #@-node:zorcanda!.20051102135220.2:keyboardQuit
        #@+node:zorcanda!.20051213161510:information
        def getInformationAbout( self, name ):
            
            if self.info_structures.has_key( name ):
                return self.info_structures[ name ]
            return None
            
            
        def getInformation( self ):
            
            return copy.copy( self.info_structures )
            
        
        def getSummaryInfo( self ):
        
            
            header = '--------\n'   
            sum = Information( "Quoters", header )
            for z in self.info_structures:
                item = self.info_structures[ z ]
                sum.addInformation( item )
            
            return sum
        
        def defineInfoStructures( self ):
        
            self.info_structures = {}
            for z in ( ( "single-quote-selection" , "places single quotes around the selection." ),
                       ( "double-quote-selection", "places double quotes around the selection." ),
                       ( "tripled-quote-selection",  'places triple " around the selection.' ),
                       ("triples-quote-selection", "places triple ' around the selection." ) ):
                info = Information( z[ 0 ], z[ 1 ] )
                self.info_structures[ z[ 0 ] ] = info
            
            
        #@-node:zorcanda!.20051213161510:information
        #@-others
    #@-node:zorcanda!.20051102134821:quoters
    #@-others
    #@nonl
    #@-node:orkman.20050210110555:keystroke and command Strategies
    #@+node:zorcanda!.20050704092406:other editor emulators
    #@+others
    #@+node:zorcanda!.20050704092406.1:vi_emulation
    class vi_emulation:
        
        def __init__( self, c ):
            self.c = c
            self.mode = None
            
            #@        <<define vi keystrokes>>
            #@+node:zorcanda!.20050704092406.2:<<define vi keystrokes>>
            self.vi_keystrokes = {
            
                'dd': self.deleteLine,
                'i': self.insert,
            
            
            
            
            
            
            }
            #@nonl
            #@-node:zorcanda!.20050704092406.2:<<define vi keystrokes>>
            #@nl
            
        def __call__( self, event, command ):
            
            
            if self.mode:
                return self.mode( event, command )
            return self.vi_keystrokes[ command ]( event, command )
    #@nonl
    #@-node:zorcanda!.20050704092406.1:vi_emulation
    #@+node:zorcanda!.20050704092406.3:cut
    def cut( self, event ):
        pass
    #@nonl
    #@-node:zorcanda!.20050704092406.3:cut
    #@+node:zorcanda!.20050704092406.4:deleteLine
    def deleteLine( self, event, command ):
        pass
        
    #@-node:zorcanda!.20050704092406.4:deleteLine
    #@+node:zorcanda!.20050704092406.5:insert
    def insert( self, event, command ):
        pass
    #@nonl
    #@-node:zorcanda!.20050704092406.5:insert
    #@-others
    #@-node:zorcanda!.20050704092406:other editor emulators
    #@-others
    
    
        
        
#@-node:orkman.20050207150858:@thin SwingMacs.py
#@-leo
