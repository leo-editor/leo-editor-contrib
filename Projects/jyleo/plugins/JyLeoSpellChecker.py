#@+leo-ver=4-thin
#@+node:zorcanda!.20051111215311:@thin JyLeoSpellChecker.py
#@@language python

'''JyLeoSpellChecker takes the Jazzy Java library and builds a spellchecker
on top of it. Jazzy is an implementation of the ASpell spellchecking algorithm.  The plugin
creates a traditional spellchecker dialog to interact with the system.  The user will find
a "Spell Check" menu item under the Body menu in the Editor.  Each Editor gets its own Spell Checker instance.

To setup, the user must do 5 things:
1. Download the Jazzy jar file and the english.0 file.  Google for Jazzy spellchecker, this should locate the items for you.
2. Put the jazzy-core.jar file in the jars folder.  This will not be the item you download, but will be contained within what you
downloaded.
3. Put the english.0 file in the spellingdicts directory which resides in the plugins directory.
4. Configure which dictionary to use via editing which.txt.  Other dictionaries can be used, check out:
http://wordlist.sourceforge.net/ for more( recommended by Jazzy docs ).  This tells the plugin to use a specific dictionary.
5. Enable the plugin in the pluginsManager.txt file, or through the plugin manager.    
Enjoy!  
'''

version = .1 #Will there need to be more versions????

import javax.swing as swing
import javax.swing.border as sborder
import javax.swing.event as sevent
import java.io as io
import java.util as util
import java
import java.awt as awt
import javax.swing.text as stext 
import leoGlobals as g
import ClassLoaderBase
import os.path

#@<<ClassLoaderBase2>>
#@+node:zorcanda!.20051111215311.13:<<ClassLoaderBase2>>
class ClassLoaderBase2(ClassLoaderBase):
    
    def __init__( self, gdict ):
        ClassLoaderBase.__init__( self )
        self.dictionaryLocation = None
        self.dictionary = None
        self.gdict = gdict
    
    def walk( self, arg, path, namelist ):
        
        for z in namelist:
            if z.endswith ( ".jar" ) and z.startswith( "jazzy" ):
                self.addJar( g.os_path_join( path, z ) )

     
                
    def importClass( self, name, clazzname  ):
        
        clazz = self.loadClass( clazzname )
        self.resolve( clazz )
        self.gdict[ name ] = clazz
#@-node:zorcanda!.20051111215311.13:<<ClassLoaderBase2>>
#@nl
load_ok = True
try:
    
    clb2 = ClassLoaderBase2( globals() )
    path = g.os_path_join( g.app.loadDir, "..", "jars" )
    os.path.walk( path, clb2.walk, None ) #must find the jazzy-core.jar file...

    #we import the resources via this classloader because just adding the jar file to the sys.path is inadequate
    clb2.importClass( "SpellCheckListener", "com.swabunga.spell.event.SpellCheckListener" ) 
    clb2.importClass( "SpellChecker", "com.swabunga.spell.event.SpellChecker" )
    clb2.importClass( "SpellDictionaryHashMap", "com.swabunga.spell.engine.SpellDictionaryHashMap" )
    #clb2.importClass( "SpellDictionaryCachedDichoDisk", "com.swabunga.spell.engine.SpellDictionaryCachedDichoDisk" )
    clb2.importClass( "StringWordTokenizer", "com.swabunga.spell.event.StringWordTokenizer" )
    
    proppath = g.os_path_join( g.app.loadDir, "..", "plugins", "spellingdicts", "which.txt" ) #we start to determine which dictionary to use
    fis = io.FileInputStream( io.File( proppath ) )
    properties = util.Properties()
    properties.load( fis )
    fis.close()
    fis = None
    lfile = properties.getProperty( "dict" )
    dpath = g.os_path_join( g.app.loadDir, "..", "plugins", "spellingdicts", lfile )
    dictionary = SpellDictionaryHashMap( io.File( dpath ) )  
    
    import org.python.core.Py as Py #now we descend into the Jython internals...
    sstate = Py.getSystemState()
    cloader = sstate.getClassLoader()
    sstate.setClassLoader( clb2 )#we do this so the JyLeoSpellChecker class can implement SpellCheckListener, otherwise it fails
    
except java.lang.Exception:
    load_ok = False

if load_ok:
    #@    <<JyLeoSpellChecker>>
    #@+node:zorcanda!.20051111215311.1:<<JyLeoSpellChecker>>
    class JyLeoSpellChecker( SpellCheckListener ):
        
        def __init__( self, editor ):
            self.c = editor.c
            self.editor = editor.editor
            self.foldprotection = editor.foldprotection
            spelldict = dictionary
            self.spellchecker = SpellChecker( spelldict )
            self.spellchecker.addSpellCheckListener( self )
            b = swing.JMenuItem( "Spell Check" )
            editor.bodyMenu.addSeparator()
            editor.bodyMenu.add( b )
            b.actionPerformed = self.spellCheck
            self.createWidgets()
            
        def getChangeTo( self ):
            return self.possible.getText()
        
    
        
        #@    @+others
        #@+node:zorcanda!.20051111215311.2:changeAll
        def changeAll( self, event ):
                
            editor = self.editor
            word = self.getChangeTo()
            if word:
                txt = self.word.getText()
                if txt:
                    editor.setCaretPosition( 0 )
                    doc = editor.getDocument()
                    wtokenizer = StringWordTokenizer( doc.getText( 0, doc.getLength() ) )
                    try:
                        while wtokenizer.hasMoreWords():
                            txt2 = wtokenizer.nextWord()
                            start = wtokenizer.getCurrentWordPosition() 
                            end = wtokenizer.getCurrentWordEnd()
                            if not self.foldprotection.doLinesIntersectFold( start, end ):
                                if str( txt ) == str( txt2 ):                         
                                    doc.replace( start, end - start,  word , None ) 
                                    wtokenizer.replaceWord( word  )
                    except stext.BadLocationException, ble:
                        pass
        #@-node:zorcanda!.20051111215311.2:changeAll
        #@+node:zorcanda!.20051111215311.3:nextWord
        def nextWord( self  ):
            editor = self.editor
            try:
                while 1:
                    word = stext.Utilities.getNextWord( editor, editor.getCaretPosition() )
                    end = stext.Utilities.getWordEnd( editor, word )
                    editor.setCaretPosition( word )
                    doc = editor.getDocument()
                    txt = doc.getText( word, end - word )
                    ok = self.spellchecker.isCorrect( txt ) or self.spellchecker.isIgnored( txt )
                    if self.foldprotection.doLinesIntersectFold( word, end ): ok = True
                    elif not txt.isalnum(): ok = True
                    if not ok: break
            except stext.BadLocationException, ble:
                option = swing.JOptionPane.showConfirmDialog( None, "Reached the end of the Editor. " +\
                "Continue search from the start?", "Search from Start?", swing.JOptionPane.YES_NO_OPTION )
                if option == swing.JOptionPane.YES_OPTION:
                    editor.setCaretPosition( 0 )
                    return self.nextWord()
                else:
                    editor.setCaretPosition( editor.getCaretPosition() )
                    self.dialog.hide()
                    return
            editor.moveCaretPosition( end )
        #@nonl
        #@-node:zorcanda!.20051111215311.3:nextWord
        #@+node:zorcanda!.20051111215311.4:spellingError
        def spellingError( self, event ):
                
            word = event.getInvalidWord()
            self.word.setText( word )
            suggestions = event.getSuggestions()
            if suggestions:
                data = suggestions.toArray()
                self.jlist.setListData( data )
                if data:
                    self.jlist.setSelectedIndex( 0 )
                else:
                    self.possible.setText( "" )
            else:
                self.jlist.setListData( [] )
                self.possible.setText( "" )
                
                    
            if not self.dialog.isShowing(): 
                g.app.gui.center_dialog( self.dialog )
                self.dialog.show()
        #@nonl
        #@-node:zorcanda!.20051111215311.4:spellingError
        #@+node:zorcanda!.20051111215311.5:checkSelectedWord
        def checkSelectedWord( self ):
                
            editor = self.editor
            text = editor.getSelectedText()
            if text:
                swtokenizer = StringWordTokenizer( text )
                self.spellchecker.checkSpelling( swtokenizer )
                return True
            return False
        #@nonl
        #@-node:zorcanda!.20051111215311.5:checkSelectedWord
        #@+node:zorcanda!.20051111215311.6:checkNextWord
        def checkNextWord( self, event ):
            self.nextWord()
            self.checkSelectedWord()
        #@nonl
        #@-node:zorcanda!.20051111215311.6:checkNextWord
        #@+node:zorcanda!.20051111215311.7:spellCheck
        def spellCheck( self, event ):
                
            editor = self.c.frame.body.editor.editor
            stxt = editor.getSelectedText()
            self.word.setText( "" )
            self.jlist.setListData( [] )
            if not stxt:
                self.nextWord()
            if self.checkSelectedWord() and not self.dialog.isShowing():
                self.dialog.show()
        #@nonl
        #@-node:zorcanda!.20051111215311.7:spellCheck
        #@+node:zorcanda!.20051111215311.8:ignore
        def ignore( self, event ):
                
            word = self.word.getText()
            self.spellchecker.ignoreAll( word )
            self.nextWord()
            self.checkSelectedWord()
        #@nonl
        #@-node:zorcanda!.20051111215311.8:ignore
        #@+node:zorcanda!.20051111215311.9:add
        def add( self, event ):
            
            word = self.getChangeTo()
            if word:
                self.spellchecker.addToDictionary( word )
                self.spellchecker.checkSpelling( StringWordTokenizer( self.word.getText() ) )
        #@nonl
        #@-node:zorcanda!.20051111215311.9:add
        #@+node:zorcanda!.20051111215311.10:change
        def change( self, event ):
                
            word = self.getChangeTo()
            if self.editor.getSelectedText():
                self.editor.replaceSelection( word )
            self.nextWord()
            self.checkSelectedWord()
        #@nonl
        #@-node:zorcanda!.20051111215311.10:change
        #@+node:zorcanda!.20051111215311.11:getChangeTo
        def getChangeTo( self ):
            return self.possible.getText()
        #@nonl
        #@-node:zorcanda!.20051111215311.11:getChangeTo
        #@+node:zorcanda!.20051111215311.12:createWidgets
        def createWidgets( self ):
                
            self.dialog = swing.JDialog()
            self.dialog.setTitle( "Spell Checker" )
            cpane = self.dialog.getContentPane()
            blayout = swing.BoxLayout( cpane, swing.BoxLayout.Y_AXIS )
            cpane.setLayout( blayout )
            self.word = swing.JTextField()
            self.word.setEditable( False )
            cwborder = sborder.TitledBorder( "Current Word:" )
            self.word.setBorder( cwborder )
            cpane.add( self.word)
            self.possible = swing.JTextField()
            pborder = sborder.TitledBorder( "Change To:" )
            self.possible.setBorder( pborder )
            cpane.add( self.possible )
            center = swing.JPanel()
            blayout = swing.BoxLayout( center, swing.BoxLayout.X_AXIS )
            center.setLayout( blayout )
            self.jlist = swing.JList()
            self.jlist.setSelectionMode( swing.ListSelectionModel.SINGLE_SELECTION )
            self.jlist.setVisibleRowCount( 5 )
            class _listSelectionListener( sevent.ListSelectionListener ):
                def __init__( self, jlist, possible ):
                    self.jlist = jlist
                    self.possible = possible
                def valueChanged( self, event ):
                    self.possible.setText( str( self.jlist.getSelectedValue() ) )
            
            self.jlist.addListSelectionListener( _listSelectionListener( self.jlist, self.possible ) )
            spane = swing.JScrollPane( self.jlist )
            spborder = sborder.TitledBorder( "Suggestions" )
            spane.setBorder( spborder )
            center.add( spane )
            bpanel = swing.JPanel()
            blayout = swing.BoxLayout( bpanel, swing.BoxLayout.Y_AXIS )
            bpanel.setLayout( blayout )
            center.add( bpanel )
            change = swing.JButton( "Change" )
            change.actionPerformed = self.change
            changeall = swing.JButton( "Change All" )
            changeall.actionPerformed = self.changeAll
            ignore = swing.JButton( "Ignore All" )
            ignore.actionPerformed = self.ignore
            add = swing.JButton( "Add" )
            add.actionPerformed = self.add
            bpanel.add( change )
            bpanel.add( changeall )
            bpanel.add( ignore )
            bpanel.add( add )
            cpane.add( center )
            self.next = swing.JButton( "Next" )
            self.next.actionPerformed = self.checkNextWord
            self.close = swing.JButton( "Close" )
            self.close.actionPerformed = lambda event: self.dialog.hide()
            jpanel = swing.JPanel()
            jpanel.add( self.next ); jpanel.add( self.close )
            cpane.add( jpanel )
            self.dialog.pack()
        #@nonl
        #@-node:zorcanda!.20051111215311.12:createWidgets
        #@-others
        
    #@-node:zorcanda!.20051111215311.1:<<JyLeoSpellChecker>>
    #@nl

def onCreate( tag, kwords ):
    
    editor = kwords[ 'editor' ]
    JyLeoSpellChecker( editor )


def init():	
    if load_ok:
        import leoPlugins
        leoPlugins.registerHandler( "editor-created" ,onCreate)
        g.plugin_signon( __name__)

if load_ok:
    sstate.setClassLoader( cloader ) #set the loader back to what it was in the beginning.
#@-node:zorcanda!.20051111215311:@thin JyLeoSpellChecker.py
#@-leo
