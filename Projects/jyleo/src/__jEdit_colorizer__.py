#@+leo-ver=4-thin
#@+node:ekr.20050529142847:@thin __jEdit_colorizer__.py
'''Replace colorizer with colorizer using jEdit language description files'''

#@@language python
#@@tabwidth -4
#@@pagewidth 80

__version__ = '0.13'
#@<< version history >>
#@+node:ekr.20050529142916.2:<< version history >>
#@@killcolor
#@+others
#@+node:ekr.20050607075752:0.1 through 0.5
#@+at
# 
# 0.1 EKR: Initial version:
#     - Split large methods into smaller methods.
# 0.2 EKR:
#     - Moved contentHandler and modeClass into the plugin.
#     - colorizer.__init__ reads python.xml, but does nothing with it.
# 0.3 EKR:
#     - Wrote and tested createRuleMatchers.
# 0.4 EKR:
#     - Basic syntax coloring now works.
# 0.5 EKR:
#     - Giant step forward 1: colorOneChunk and interrupt allow very fast 
# keyboard response.
#     - Giant step forward 2: no need for incremental coloring!
#     - Giant step forward 3: eliminated flashing & eliminated most calls to 
# removeAllTags.
#@-at
#@nonl
#@-node:ekr.20050607075752:0.1 through 0.5
#@+node:ekr.20050607080236:0.6 through 0.10
#@+at
# 
# 0.6 EKR:
#     - Removed unused code and ivars.
#     - Added support for keywords, including Leo keywords and expanded 
# word_chars.
#     - Added special rules for doc parts and section references.
#     - Most (all?) Python now is colored properly.
#     - Discovered a performance bug: it can take a long time on big text for 
# the cursor to appear.
# 0.7 EKR:
#     - Colorized start of @doc sections properly.
#     - Fixed bug involving at_line_start: must test i == 0 OR s[i-1] == '\n'.
#     - Added rules for @color and @nocolor.
#     - Added more entries to to-do list for Leo special cases.
# 0.8 EKR:
#     - Use a single dict for all keywords--an important speedup.
#     - Call init_keywords exactly once per mode.
#     - Defined tags for jEdit types.
#     - Fixed bug in exception handling in parse_jEdit_file: exceptions now 
# reported properly.
#     - Turned off inclusion of external general entities so dtd line gets 
# ignored.
# 0.9 EKR:
#     - Added colored_ranges dict, colorRangeWithTag & removeTagsFromRange.
#         - This keeps track of tags much more effectively than Tk does.
#     - A compromise looks best for eliminating flash with good performance:
#         - Don't interrupt colorOneChunk for non-incremental redraws.
#             - Doesn't really hurt performance: the cursor didn't blink in 
# the old way.
#         - Do interrupt colorOneChunk for incremental redraws.
#             - Key performance is optimal.
#             - There is no flash because no tags get needlessly destroyed.
#         - recolor_range calls invalidate_range so undo works properly.
# 0.10 EKR:
#     - use self.c.frame.top.after(50,self.colorOneChunk) to queue 
# non-incremental coloring.
#     - This causes instant display and prompt coloring, even for large text.
#     - Must call removeAllTags and removeAllImages when clearing the 
# colored_ranges dict.
#@-at
#@nonl
#@-node:ekr.20050607080236:0.6 through 0.10
#@+node:ekr.20050607075752.1:0.11 up
#@+at
# 
# 0.11 EKR:
#     - Supported no_line_break in match_span.
#     - Fixed bug in doAttribute so that "TRUE" is recognized correctly.
#     - Added span_eol rules to python.xml to handle non-terminated ' and " 
# strings.
#     - Added was_non_incremental state var and related logic.
#         - Never clear tags in colorizeAnyLanguage: it cause flash after 
# colorOneChunk exits.
#         - Instead, clear by hand was_non_incremental is True.
# 0.12 EKR:
#     - Only look up the rules which appear in 
# self.rulesDict.get(s[i],self.defaultRulesList)
#     - This should typically reduce the number of rules examined by a factor 
# of about 10.
# 0.13 EKR:
#     - Duplicated nullColorizer in this file so it derives from proper base 
# class.
#       This fixes the crash in the settings panel.
#     - colorRangeWithTag now always sets colored_ranges when doing any real 
# coloring.
#       This fixes a bug in which old tags weren't always cleared.
#     - Colorized hyperlinks and undefined sections correctly.
#     - Changed contentHandler so and parse_jEdit_file so parse_jEdit_file 
# returns a single mode.
#         - It is now an error for more than one mode to appear in an xml 
# file.
#     - Many changes to handle multiple rulesets properly:
#         - Added logic to initMode and initKeywords to handle multiple 
# rulesets.
#         - created rulesetClass.
#         - created following mode ivars:
#             - modeProperties, 
# rulesetProperties,presentProperty,rulesetAttributes.
# 0.14 EKR:
#     - Added support for delegated rulesets in modeClass, etc.
#     - Handled delegated rulesets in colorByDelegate.
#@-at
#@nonl
#@-node:ekr.20050607075752.1:0.11 up
#@-others
#@nonl
#@-node:ekr.20050529142916.2:<< version history >>
#@nl
#@<< to do >>
#@+node:ekr.20050601081132:<< to do >>
#@@nocolor
#@+at
# 
# - Handle c.xml:
#     - Make sure <markup> element in <keywords> element work in delegate.
# - Support NO_WORD_SEP, IGNORE_CASE and DEFAULT attributes in rules element.
#     - Later: support DIGIT_RE and HIGHLIGHT_DIGITS attributes in rules 
# element.
# 
# - Finish all rules:
#     - mark_previous and mark_following.
#     - match_regexp_helper.
# - Test colorizing of hyperlinks.
# 
#@-at
#@@c
#@@color

#@<< later >>
#@+node:ekr.20050603121815:<< later >>
#@@killcolor
#@+at
# - Support comment properties and self.comment_string:
#     - Conditionally add rules for comment ivars: 
# single_comment_start,block_comment_start,block_comment_end
#     - commentEnd - the comment end string, used by the Range Comment 
# command.
#     - commentStart - the comment start string, used by the Range Comment 
# command.
#     - lineComment - the line comm
# 
# - Support Show Invisibles.
#     Conditionally add rule for whitespace.
# 
# - Handle cweb section references correctly.
# 
# - Handle logic of setFirstLineState.
#     - Change match_doc_part: Start in doc mode for some @root's.
# 
# - Make sure pictures get drawn properly.
# 
# - Create forth.xml
# 
# - php.xml does not parse correctly.
#@-at
#@nonl
#@-node:ekr.20050603121815:<< later >>
#@nl
#@-node:ekr.20050601081132:<< to do >>
#@nl
#@<< imports >>
#@+node:ekr.20050529142916.3:<< imports >>
import leoGlobals as g
import leoPlugins

import os
import re
import string
import threading
import xml.sax
import xml.sax.saxutils

# php_re = re.compile("<?(\s|=|[pP][hH][pP])")
php_re = re.compile("<?(\s[pP][hH][pP])")
#@nonl
#@-node:ekr.20050529142916.3:<< imports >>
#@nl
#@<< define leoKeywords >>
#@+node:ekr.20050529143413:<< define leoKeywords >>
# leoKeywords is used by directivesKind, so it should be a module-level symbol.

# leoKeywords must be a list so that plugins may alter it.

leoKeywords = [
    "@","@all","@c","@code","@color","@comment",
    "@delims","@doc","@encoding","@end_raw",
    "@first","@header","@ignore",
    "@killcolor",
    "@language","@last","@lineending",
    "@nocolor","@noheader","@nowrap","@others",
    "@pagewidth","@path","@quiet","@raw","@root","@root-code","@root-doc",
    "@silent","@tabwidth","@terse",
    "@unit","@verbose","@wrap", ]
#@nonl
#@-node:ekr.20050529143413:<< define leoKeywords >>
#@nl
#@<< define default_colors_dict >>
#@+node:ekr.20050529143413.1:<< define default_colors_dict >>
# These defaults are sure to exist.

default_colors_dict = {
    # tag name       :(     option name,           default color),
    'comment'        :('comment_color',               'red'),
    'cwebName'       :('cweb_section_name_color',     'red'),
    'pp'             :('directive_color',             'blue'),
    'docPart'        :('doc_part_color',              'red'),
    'keyword'        :('keyword_color',               'blue'),
    'leoKeyword'     :('leo_keyword_color',           'blue'),
    'link'           :('section_name_color',          'red'),
    'nameBrackets'   :('section_name_brackets_color', 'blue'),
    'string'         :('string_color',                '#00aa00'), # Used by IDLE.
    'name'           :('undefined_section_name_color','red'),
    'latexBackground':('latex_background_color','white'),
    
    # jEdit tags.
    'comment1'  :('comment1_color', 'red'),
    'comment2'  :('comment2_color', 'red'),
    'comment3'  :('comment3_color', 'red'),
    'comment4'  :('comment4_color', 'red'),
    'function'  :('function_color', 'black'),
    'keyword1'  :('keyword1_color', 'blue'),
    'keyword2'  :('keyword2_color', 'blue'),
    'keyword3'  :('keyword3_color', 'blue'),
    'keyword4'  :('keyword4_color', 'blue'),
    'label'     :('label_color',    'black'),
    'literal1'  :('keyword1_color', 'black'),
    'literal2'  :('keyword2_color', 'black'),
    'literal3'  :('keyword3_color', 'black'),
    'literal4'  :('keyword4_color', 'black'),
    'markup'    :('markup_color',   'orange'), # What is the reasonable default?
    'operator'  :('operator_color', 'black'),
    }
#@nonl
#@-node:ekr.20050529143413.1:<< define default_colors_dict >>
#@nl

#@+others
#@+node:ekr.20050529142916.4:init
def init ():

    leoPlugins.registerHandler('start1',onStart1)
    g.plugin_signon(__name__)

    return True
#@nonl
#@-node:ekr.20050529142916.4:init
#@+node:ekr.20050529142916.5:onStart1
def onStart1 (tag, keywords):
    
    import leoColor
    
    leoColor.colorizer = baseColorizer
    
    leoColor.colorizer = colorizer
    
    leoColor.nullColorizer = nullColorizer
#@nonl
#@-node:ekr.20050529142916.5:onStart1
#@+node:ekr.20050530065723.58:class contentHandler (xml.sax.saxutils.XMLGenerator)
class contentHandler (xml.sax.saxutils.XMLGenerator):
    
    '''A sax content handler class that handles jEdit language-description files.
    
    Creates mode that can be retrieved using getMode method.'''

    #@    @+others
    #@+node:ekr.20050530065723.59: __init__ & helpers
    def __init__ (self,c,fileName,trace=False,verbose=False):
    
        self.c = c
        self.fileName = fileName
        self.trace = trace
        self.verbose = verbose
        
        # Init the base class.
        xml.sax.saxutils.XMLGenerator.__init__(self)
        
        # Non-mode statistics.
        self.numberOfAttributes = 0
        self.numberOfElements = 0
        
        # Options...
        self.ignoreWs = True # True: don't print contents with only ws.
        self.newLineAfterStartElement = [
            'keywords','mode','props','property','rules','span','eol_span',
            # 'seq',
        ]
        
        # Printing options
        if verbose:
            self.printAllElements = True
            self.printCharacters = False or self.printAllElements
            self.printAttributes = False and not self.printAllElements
            self.printElements = [
                #'begin','end',
                #'eol_span',
                #'keyword1','keyword2','keyword3','keyword4',
                #'mark_previous',
                #'mode',
                #'props',
                #'property',
                #'rules',
                #'span',
                #'seq',
            ]
            
            if self.printAllElements:
                self.suppressContent = []
            else:
                self.suppressContent = ['keyword1','keyword2','keyword3','keyword4']
        else:
            self.printAllElements = False
            self.printCharacters = False
            self.printAttributes = False
            self.printElements = []
      
        # Semantics: most of these should be mode ivars.
        self.elementStack = []
        self.mode = None # The present mode, or None if outside all modes.
        self.modes = [] # All modes defined here or by imports.
    #@nonl
    #@-node:ekr.20050530065723.59: __init__ & helpers
    #@+node:ekr.20050530065723.60:helpers
    #@+node:ekr.20050530065723.61:attrsToList
    def attrsToList (self,attrs):
        
        '''Convert the attributes to a list of g.Bunches.
        
        attrs: an Attributes item passed to startElement.
        
        sep: the separator charater between attributes.'''
        
        return [
            g.Bunch(name=name,val=attrs.getValue(name))
            for name in attrs.getNames()
        ]
    #@nonl
    #@-node:ekr.20050530065723.61:attrsToList
    #@+node:ekr.20050530065723.62:attrsToString
    def attrsToString (self,attrs,sep='\n'):
        
        '''Convert the attributes to a string.
        
        attrs: an Attributes item passed to startElement.
        
        sep: the separator charater between attributes.'''
    
        result = [
            '%s="%s"' % (bunch.name,bunch.val)
            for bunch in self.attrsToList(attrs)
        ]
    
        return sep.join(result)
    #@nonl
    #@-node:ekr.20050530065723.62:attrsToString
    #@+node:ekr.20050530065723.63:clean
    def clean(self,s):
    
        return g.toEncodedString(s,"ascii")
    #@nonl
    #@-node:ekr.20050530065723.63:clean
    #@+node:ekr.20050530065723.64:error
    def error (self, message):
        
        print
        print
        print 'XML error: %s' % (message)
        print
    #@nonl
    #@-node:ekr.20050530065723.64:error
    #@+node:ekr.20050530065723.65:printStartElement
    def printStartElement(self,name,attrs):
    
        if attrs.getLength() > 0:
            print '<%s %s>' % (
                self.clean(name).strip(),
                self.attrsToString(attrs,sep=' ')),
        else:
            print '<%s>' % (self.clean(name).strip()),
    
        if name.lower() in self.newLineAfterStartElement:
            print
    #@nonl
    #@-node:ekr.20050530065723.65:printStartElement
    #@+node:ekr.20050530065723.66:printSummary
    def printSummary (self):
        
        print '-' * 10, 'non- mode statistics'
        print 'modes',len(self.modes)
        print 'elements', self.numberOfElements
    #@nonl
    #@-node:ekr.20050530065723.66:printSummary
    #@-node:ekr.20050530065723.60:helpers
    #@+node:ekr.20050530065723.67:sax over-rides
    #@+node:ekr.20050530065723.68: Do nothing...
    #@+node:ekr.20050530065723.69:other methods
    def ignorableWhitespace(self):
        g.trace()
    
    def processingInstruction (self,target,data):
        g.trace()
    
    def skippedEntity(self,name):
        g.trace(name)
    
    def startElementNS(self,name,qname,attrs):
        g.trace(name)
    
    def endElementNS(self,name,qname):
        g.trace(name)
    #@nonl
    #@-node:ekr.20050530065723.69:other methods
    #@+node:ekr.20050530065723.70:endDocument
    def endDocument(self):
    
        pass
    
    
    #@-node:ekr.20050530065723.70:endDocument
    #@+node:ekr.20050530065723.71:startDocument
    def startDocument(self):
        
        pass
    #@nonl
    #@-node:ekr.20050530065723.71:startDocument
    #@-node:ekr.20050530065723.68: Do nothing...
    #@+node:ekr.20050530065723.72:characters
    def characters(self,content):
        
        content = content.replace('\r','').strip()
        content = self.clean(content)
    
        elementName = self.elementStack and self.elementStack[-1]
        elementName = elementName.lower()
        
        if 1: # new code
            if self.printAllElements:
                print content,
            elif self.printCharacters and content and elementName not in self.suppressContent:
                print 'content:',elementName,repr(content)
        else:
            if self.printCharacters and content and elementName not in self.suppressContent:
                if self.printAllElements:
                    print content,
                else:
                    print 'content:',elementName,repr(content)
                
        if self.mode:
            self.mode.doContent(elementName,content)
        else:
            self.error('characters outside of mode')
    #@nonl
    #@-node:ekr.20050530065723.72:characters
    #@+node:ekr.20050530065723.73:endElement
    def endElement(self,name):
    
        self.doEndElement(name)
    
        name2 = self.elementStack.pop()
        assert name == name2
    #@nonl
    #@-node:ekr.20050530065723.73:endElement
    #@+node:ekr.20050530065723.74:startElement
    def startElement(self,name,attrs):
        
        if self.mode:
            self.mode.numberOfElements += 1
        else:
            self.numberOfElements += 1
            
        self.elementStack.append(name)
        self.doStartElement(name,attrs)
    #@nonl
    #@-node:ekr.20050530065723.74:startElement
    #@-node:ekr.20050530065723.67:sax over-rides
    #@+node:ekr.20050530065723.75:doStartElement
    def doStartElement (self,elementName,attrs):
        
        if self.printAllElements or elementName.lower() in self.printElements:
            self.printStartElement(elementName,attrs)
    
        elementName = elementName.lower()
        
        if elementName == 'mode':
            if self.mode:
                self.error('Multiple modes')
            else:
                self.mode = modeClass(self,self.fileName)
        elif self.mode:
            self.mode.startElement(elementName)
            for bunch in self.attrsToList(attrs):
                if self.printAttributes:
                    print 'attr:',elementName,bunch.name,'=',bunch.val
                self.mode.doAttribute(bunch.name,bunch.val)
        else:
            self.error('Start element appears outside of Mode:%s' % elementName)
            for bunch in self.attrsToList(attrs):
                self.error('Attribute appears outside of Mode:%s' % bunch.name)
    #@nonl
    #@-node:ekr.20050530065723.75:doStartElement
    #@+node:ekr.20050530065723.76:doEndElement
    def doEndElement (self,elementName):
        
        if self.printAllElements or elementName.lower() in self.printElements:
            print '</' + self.clean(elementName).strip() + '>'
            
        if elementName.lower() == 'mode':
            if self.verbose:
                self.mode.printSummary()
        elif self.mode:
            self.mode.endElement(elementName)
        else:
            self.error('End element appears outside of Mode:%s' % elementName)
            for bunch in self.attrsToList(attrs):
                self.error('Attribute appears outside of Mode:%s' %bunch.name)
    #@nonl
    #@-node:ekr.20050530065723.76:doEndElement
    #@+node:ekr.20050530071955:getMode
    def getMode (self):
        
        return self.mode
    #@nonl
    #@-node:ekr.20050530071955:getMode
    #@-others
#@nonl
#@-node:ekr.20050530065723.58:class contentHandler (xml.sax.saxutils.XMLGenerator)
#@+node:ekr.20050530065723.49:class modeClass
class modeClass:
    
    '''A class representing one jEdit language-description mode.
    
    Use getters to access the attributes, properties and rules of this mode.'''
    
    #@    @+others
    #@+node:ekr.20050530065723.50: mode.__init__
    def __init__ (self,contentHandler,fileName):
    
        self.contentHandler = contentHandler
        self.fileName = fileName # The file from which the mode was imported.
        self.verbose = self.contentHandler.verbose
    
        # Mode statistics...
        self.numberOfAttributes = 0
        self.numberOfElements = 0
        self.numberOfErrors = 0
        self.numberOfPropertyAttributes = 0
        self.numberOfRuleAttributes = 0
        
        # List of boolean attributes.
        self.boolAttrs = [
            'at_line_start','at_whitespace_end','at_word_start',
            'exclude_match','highlight_digits','ignore_case',
            'no_escape','no_line_break','no_word_break','no_word_sep',]
    
        # List of elements that start a rule.
        self.ruleElements = [
            'eol_span','eol_span_regexp','import','keywords',
            'mark_following','mark_previous','seq','seq_regexp',
            'span','span_regexp','terminate',]
    
        if 0: # Not used at present.
            self.seqSpanElements = [
                'eol_span','eol_span_regexp','seq','seq_regexp',
                'span','span_regexp',]
    
        # Mode semantics.
        self.attributes = {}
        self.inProps = False
        self.inRules = False
        self.keywords = None
        self.modeProperties = []
        self.presentProperty = None # A bunch to be assigned to modeProperties or rulesetProperties.
        self.rule = None
        self.rulesets = []
        self.rules = [] # The rules of the present rules element.
        self.rulesetProperties = []
        self.rulesetAttributes = {} # The attributes of the present rules element.
    #@nonl
    #@-node:ekr.20050530065723.50: mode.__init__
    #@+node:ekr.20050530073825: mode.__str__ & __repr__
    def __str__ (self):
        
        return '<modeClass for %s>' % self.fileName
        
    __repr__ = __str__
    #@nonl
    #@-node:ekr.20050530073825: mode.__str__ & __repr__
    #@+node:ekr.20050530081700: Printing...
    #@+node:ekr.20050530075602:printModeAttributes, printRulesetAttributes & printAttributesHelper
    def printModeAttributes (self):
        
        self.printAttributesHelper('mode attributes',self.attributes)
        
    def printRulesetAttributes (self,ruleset,tag=None):
    
        if not tag: tag = 'main ruleset'
        
        self.printAttributesHelper(tag,ruleset.attributes)
        
    def printAttributesHelper (self,kind,attrs):
        
        print '%-20s' % (kind),'attrs:',attrs
    #@nonl
    #@-node:ekr.20050530075602:printModeAttributes, printRulesetAttributes & printAttributesHelper
    #@+node:ekr.20050530080452:printProperty
    def printProperty (self,theProperty):
        
        # A property is a bunch.
        d = theProperty.attributes
        if d:
            self.printAttributesHelper('property',d)
    #@nonl
    #@-node:ekr.20050530080452:printProperty
    #@+node:ekr.20050530075602.1:printRule
    def printRule (self,rule):
        
        # A rule is a g.Bunch.
        if rule.name == 'keywords':
            print '%-20s' % ('rule:keywords'),
            for key in ('keyword1','keyword2','keyword3','keyword4','markup',):
                theList = rule.get(key,[])
                print key,len(theList),
            print
        else:
            d = rule.attributes
            d2 = rule.get('contents')
            if d or d2:
                print '%-20s' % ('rule:'+rule.name),
                if d and d2: print 'attrs:',d,'chars:',d2
                elif d:  print 'attrs:',d
                else:    print 'chars:',d2
    #@nonl
    #@-node:ekr.20050530075602.1:printRule
    #@+node:ekr.20050607221915:printRuleset
    def printRuleset (self,ruleset,tag):
        
        self.printRulesetAttributes(ruleset,tag)
    
        for rule in self.rulesets[0].rules:
            self.printRule(rule)
    #@nonl
    #@-node:ekr.20050607221915:printRuleset
    #@+node:ekr.20050530065723.56:printSummary
    def printSummary (self,printStats=True):
    
        if printStats:
            print '-' * 10, 'mode statistics'
            print 'elements',self.numberOfElements
            print 'errors',self.numberOfErrors
            print 'mode attributes',self.numberOfAttributes
            print 'property attributes',self.numberOfPropertyAttributes
            print 'rule attributes',self.numberOfRuleAttributes
    
        self.printModeAttributes()
        
        for bunch in self.modeProperties:
            self.printProperty(bunch)
    
        self.printRuleset(self.rulesets[0],tag='main ruleset')
    #@nonl
    #@-node:ekr.20050530065723.56:printSummary
    #@-node:ekr.20050530081700: Printing...
    #@+node:ekr.20050530065723.51:doAttribute
    def doAttribute (self,name,val):
        
        name = str(name.lower())
        
        if name in self.boolAttrs:
            val = g.choose(val.lower()=='true',True,False)
        else:
            val = str(val) # Do NOT lower this value!
    
        if self.rule:
            d = self.rule.get('attributes')
            d [name] = val
            self.numberOfRuleAttributes += 1
        elif self.presentProperty:
            d = self.presentProperty.get('attributes')
            d [name] = val
            self.numberOfPropertyAttributes += 1
        elif self.inRules:
            self.rulesetAttributes[name] = val
            self.numberOfAttributes += 1
        else:
            self.attributes[name] = val
            self.numberOfAttributes += 1
    #@nonl
    #@-node:ekr.20050530065723.51:doAttribute
    #@+node:ekr.20050530065723.52:doContent
    def doContent (self,elementName,content):
        
        if not content:
            return
        
        name = str(elementName.lower())
    
        if name in ('keyword1','keyword2','keyword3','keyword4','markup',):
            if self.inRule('keywords'):
                theList = self.rule.get(name,[])
                theList.append(content)
                self.rule[name] = theList
            elif name != 'markup':
                self.error('%d not in keywords' % name)
    
        elif self.rule:
            d = self.rule.get('contents',{})
            s = d.get(name,'')
            d [name] = s + content
            self.rule['contents'] = d
    #@nonl
    #@-node:ekr.20050530065723.52:doContent
    #@+node:ekr.20050530065723.53:endElement
    def endElement (self,elementName):
    
        name = elementName.lower()
        
        if name == 'props':
            self.inProps = True
        if name == 'rules':
            self.inRules = False
            ruleset = rulesetClass(self.rulesetAttributes,self.keywords,self.rulesetProperties,self.rules)
            self.rulesets.append(ruleset)
            #g.trace('rules...\n',g.listToString(self.rules))
            #g.trace('ruleset attributes...\n',g.dictToString(self.rulesetAttributes))
        if name == 'property':
            bunch = self.presentProperty
            if bunch:
                if self.inRules:
                    self.rulesetProperties.append(bunch)
                else:
                    self.modeProperties.append(bunch)
            else:
                self.error('end %s not matched by start %s' % (name,name))
            self.presentProperty = None
        if name in self.ruleElements:
            if self.inRule(name):
                self.rules.append(self.rule)
                self.rule = None
            else:
                self.error('end %s not matched by start %s' % (name,name))
    #@nonl
    #@-node:ekr.20050530065723.53:endElement
    #@+node:ekr.20050530065723.54:error
    def error (self,message):
        
        self.numberOfErrors += 1
    
        self.contentHandler.error(message)
    #@nonl
    #@-node:ekr.20050530065723.54:error
    #@+node:ekr.20050530074431:getters
    def getAttributes (self):
        return self.attributes
        
    def getAttributesForRuleset (self,ruleset):
        bunch = ruleset
        return bunch.attributes
        
    def getFileName (self):
        return self.fileName
        
    def getKeywords (self,n,ruleset):
        bunch = ruleset
        keywords = bunch.keywords
        if keywords:
            return keywords.get('keyword%d'%(n),[])
        return []
    
    def getLanguage (self):
        path,name = g.os_path_split(self.fileName)
        language,ext = g.os_path_splitext(name)
        return language
    
    def getPropertiesForMode (self):
        return self.props
        
    def getPropertiesForRuleset (self,name=''):
        bunch = self.getRuleset(name)
        if bunch:
            return bunch.properties
        else:
            return []
        
    def getRuleset(self,name=''):
        if not name:
            return self.rulesets[0] # Return the main ruleset.
        for ruleset in self.rulesets:
            if ruleset.name.lower()==name.lower():
                return ruleset
        else: return None
    
    def getRulesets(self):
        return self.rulesets
        
    def getRulesForRuleset (self,name=''):
        bunch = self.getRuleset(name)
        if bunch:
            return bunch.rules
        else:
            return []
    #@nonl
    #@-node:ekr.20050530074431:getters
    #@+node:ekr.20050530065723.55:inRule
    def inRule (self,elementName):
    
        return self.rule and self.rule.get('name') == elementName
    #@nonl
    #@-node:ekr.20050530065723.55:inRule
    #@+node:ekr.20050530065723.57:startElement
    def startElement (self,elementName):
    
        name = elementName.lower()
        
        if name == 'props':
            self.inProps = True
        if name == 'rules':
            self.inRules = True
            self.attributes=[]
            self.keywords=[]
            self.rulesetProperties=[]
            self.rules=[]
        if name == 'property':
            if self.inProps:
                self.presentProperty = g.bunch(name=name,attributes={})
            else:
                self.error('property not in props element')
        if name in self.ruleElements:
            if self.inRules:
                self.rule = g.bunch(name=name,attributes={})
                if name == 'keywords':
                    self.keywords = self.rule
            else:
                self.error('%s not in rules element' % name)
    #@nonl
    #@-node:ekr.20050530065723.57:startElement
    #@-others
#@nonl
#@-node:ekr.20050530065723.49:class modeClass
#@+node:ekr.20050607073917.1:class rulesetClass
class rulesetClass:
    
    #@    @+others
    #@+node:ekr.20050607073917.2:ctor
    def __init__ (self,attributes,keywords,properties,rules):
            
        self.name=attributes.get('set','')
        self.attributes=attributes.copy() # A dict.
        self.properties=properties[:] # A list.
        self.keywords=keywords # A bunch.
        self.rules=rules[:] # A list.
        
        if self.name:
            g.trace('ruleset',self.name)
            
        self.defaultColor = self.attributes.get('default')
    #@nonl
    #@-node:ekr.20050607073917.2:ctor
    #@-others
#@nonl
#@-node:ekr.20050607073917.1:class rulesetClass
#@+node:ekr.20050606214036:class colorizer (baseColorizer)
class baseColorizer:

    '''New colorizer using jEdit language description files'''
    #@    @+others
    #@+node:ekr.20050529143413.24:Birth and init
    #@+node:ekr.20050602150957:__init__
    def __init__(self,c):
        # Copies of ivars.
        self.c = c
        self.frame = c.frame
        self.body = c.frame.body
        self.p = None
        # Config settings.
        self.comment_string = None # Set by scanColorDirectives on @comment
        self.showInvisibles = False # True: show "invisible" characters.
        self.underline_undefined = c.config.getBool("underline_undefined_section_names")
        self.use_hyperlinks = c.config.getBool("use_hyperlinks")
        # State ivars...
        self.colored_ranges = {}
            # Keys are indices, values are tags.
        self.chunk_count = 0
        self.color_pass = 0
        self.comment_string = None # Can be set by @comment directive.
        self.defaultRulesList = []
        self.enabled = True # Set to False by unit tests.
        self.flag = True # True unless in range of @nocolor
        self.keywordNumber = 0 # The kind of keyword for keywordsColorHelper.
        self.kill_chunk = False
        self.language = 'python' # set by scanColorDirectives.
        self.ranges = 0
        self.redoColoring = False # May be set by plugins.
        self.redoingColoring = False
        self.was_non_incremental = False # True: we are coloring as the result of a non-incremental call.
        # Data...
        self.keywords = {} # Keys are keywords, values are 0..5.
        self.modes = {} # Keys are languages, values are bunches describing the mode.
        self.mode = None # The mode object for the present language.
        self.prev_mode = None
        self.present_ruleset = None
        self.rulesDict = {}
        self.tags = [
            "blank","comment","cwebName","docPart","keyword","leoKeyword",
            "latexModeBackground","latexModeKeyword",
            "latexBackground","latexKeyword",
            "link","name","nameBrackets","pp","string","tab",
            "elide","bold","bolditalic","italic", # new for wiki styling.
            # Leo jEdit tags...
            '@color', '@nocolor', 'doc_part', 'section_ref',
            # jEdit tags.
            'comment1','comment2','comment3','comment4',
            'function',
            'keyword1','keyword2','keyword3','keyword4',
            'label',
            'literal1','literal2','literal3','literal4',
            'markup',
            'operator',
        ]
        self.word_chars = {} # Inited by init_keywords().
        self.setFontFromConfig()
        self.defineAndExtendForthWords()
    #@nonl
    #@-node:ekr.20050602150957:__init__
    #@+node:ekr.20050529143413.33:configure_tags
    def configure_tags (self):
    
        c = self.c
    
        for name in default_colors_dict.keys(): # Python 2.1 support.
            option_name,default_color = default_colors_dict[name]
            option_color = c.config.getColor(option_name)
            color = g.choose(option_color,option_color,default_color)
            # Must use foreground, not fg.
            try:
                self.body.tag_configure(name, foreground=color)
            except: # Recover after a user error.
                self.body.tag_configure(name, foreground=default_color)
        
        # underline=var doesn't seem to work.
        if 0: # self.use_hyperlinks: # Use the same coloring, even when hyperlinks are in effect.
            self.body.tag_configure("link",underline=1) # defined
            self.body.tag_configure("name",underline=0) # undefined
        else:
            self.body.tag_configure("link",underline=0)
            if self.underline_undefined:
                self.body.tag_configure("name",underline=1)
            else:
                self.body.tag_configure("name",underline=0)
                
        # Only create tags for whitespace when showing invisibles.
        if self.showInvisibles:
            for name,option_name,default_color in (
                ("blank","show_invisibles_space_background_color","Gray90"),
                ("tab",  "show_invisibles_tab_background_color",  "Gray80")):
                option_color = c.config.getColor(option_name)
                color = g.choose(option_color,option_color,default_color)
                try:
                    self.body.tag_configure(name,background=color)
                except: # Recover after a user error.
                    self.body.tag_configure(name,background=default_color)
            
        # Colors for latex characters.  Should be user options...
        
        if 1: # Alas, the selection doesn't show if a background color is specified.
            self.body.tag_configure("latexModeBackground",foreground="black")
            self.body.tag_configure("latexModeKeyword",foreground="blue")
            self.body.tag_configure("latexBackground",foreground="black")
            self.body.tag_configure("latexKeyword",foreground="blue")
        else: # Looks cool, and good for debugging.
            self.body.tag_configure("latexModeBackground",foreground="black",background="seashell1")
            self.body.tag_configure("latexModeKeyword",foreground="blue",background="seashell1")
            self.body.tag_configure("latexBackground",foreground="black",background="white")
            self.body.tag_configure("latexKeyword",foreground="blue",background="white")
            
        # Tags for wiki coloring.
        if self.showInvisibles:
            self.body.tag_configure("elide",background="yellow")
        else:
            self.body.tag_configure("elide",elide="1")
        self.body.tag_configure("bold",font=self.bold_font)
        self.body.tag_configure("italic",font=self.italic_font)
        self.body.tag_configure("bolditalic",font=self.bolditalic_font)
        for name in self.color_tags_list:
            self.body.tag_configure(name,foreground=name)
    #@nonl
    #@-node:ekr.20050529143413.33:configure_tags
    #@+node:ekr.20050529143413.27:defineAndExtendForthWords
    def defineAndExtendForthWords(self):
        
        # Default forth keywords: extended by leo-forthwords.txt.
        self.forth_keywords = [
            "variable", "constant", "code", "end-code",
            "dup", "2dup", "swap", "2swap", "drop", "2drop",
            "r>", ">r", "2r>", "2>r",
            "if", "else", "then",
            "begin", "again", "until", "while", "repeat",
            "v-for", "v-next", "exit",
            "meta", "host", "target", "picasm", "macro",
            "needs", "include",
            "'", "[']",":", ";","@", "!", ",", "1+", "+", "-",
            "<", "<=", "=", ">=", ">",
            "invert", "and", "or",
        ]
        
        # Forth words which define other words: extended by leo-forthdefwords.txt.
        self.forth_definingwords = [":", "variable", "constant", "code",]
        
        # Forth words which start strings: extended by leo-forthstringwords.txt.
        self.forth_stringwords = ['s"', '."', '"', '."','abort"',]
        
        # Forth words to be rendered in boldface: extended by leo-forthboldwords.txt.
        self.forth_boldwords = []
        
        # Forth words to be rendered in italics: extended by leo-forthitalicwords.txt.
        self.forth_italicwords = []
        
        # Forth bold-italics words: extemded leo-forthbolditalicwords.txt if present
        # Note: on some boxen, bold italics may show in plain bold.
        self.forth_bolditalicwords = []
        
        # Associate files with lists: probably no need to edit this.
        forth_items = (
            (self.forth_definingwords, "leo-forthdefwords.txt", "defining words"),
            (self.forth_keywords, "leo-forthwords.txt", "words"),
            (self.forth_stringwords, "leo-forthstringwords.txt", "string words"),
            (self.forth_boldwords, "leo-forthboldwords.txt", "bold words"),
            (self.forth_bolditalicwords, "leo-forthbolditalicwords.txt", "bold-italic words"),
            (self.forth_italicwords, "leo-forthitalicwords.txt", "italic words"),
        )
        
        # Add entries from files (if they exist) and to the corresponding wordlists.
        for (lst, path, typ) in forth_items:
            try:
                extras = []
                path = g.os_path_join(g.app.loadDir,"..","plugins",path)
                for line in file(path).read().strip().split("\n"):
                    line = line.strip()
                    if line and line[0] != '\\':
                        extras.append(line)
                if extras:
                    if 0: # I find this annoying.  YMMV.
                        if not g.app.unitTesting and not g.app.batchMode:
                            print "Found extra forth %s" % typ + ": " + " ".join(extras)
                    lst.extend(extras)
            except IOError:
                # print "Not found",path
                pass
    #@nonl
    #@-node:ekr.20050529143413.27:defineAndExtendForthWords
    #@+node:ekr.20050602152743:init_keywords
    def init_keywords (self,mode,ruleset):
        
        '''Initialize the keywords for the present language.
        
         Set word_chars to all non-alpha characters appearing in any keyword'''
    
        # Add any new user keywords to leoKeywords.
        for d in g.globalDirectiveList:
            name = '@' + d
            if name not in leoKeywords:
                leoKeywords.append(name)
        # Create a single keywords dict.
        keywords = {}
        for key in leoKeywords:
            keywords[key] = 0
    
        for i in (1,2,3,4):
            keys = mode.getKeywords(i,ruleset)
            for key in keys:
                if keywords.get(key):
                    print 'keyword %s defined in multiple places' % key
                keywords[key] = i
        # g.trace(len(keywords.keys()))
        # Create the word_chars list. 
        word_chars = {}
        for ch in string.letters:
            word_chars[ch] = None
        for keys in keywords.keys():
            for word in keys:
                for ch in word:
                    word_chars[ch] = None
        if 0: # Testing.
            #@        << compute extra_word_chars >>
            #@+node:ekr.20050607073917:<< compute extra_word_chars >>
            extra_word_chars = {}
            for ch in word_chars:
                if ch not in string.letters and ch not in extra_word_chars:
                    extra_word_chars[ch] = None
            #@nonl
            #@-node:ekr.20050607073917:<< compute extra_word_chars >>
            #@nl
                
        return keywords,word_chars
    #@nonl
    #@-node:ekr.20050602152743:init_keywords
    #@+node:ekr.20050602150619:init_mode
    def init_mode (self,language):
        
        # bunch = self.modes.get(language)
        bunch = self.modes.get(language)
        if bunch:
            self.mode = bunch.mode
            self.defaultRulesList=bunch.defaultRulesList
            self.keywords = bunch.keywords
            self.rulesDict=bunch.rulesDict
            self.word_chars = bunch.word_chars
        else:
            self.mode = mode = self.parse_jEdit_file(language)
            if mode:
                g.trace(language)
                # Handle only the main rulese here.
                rulesets = mode.getRulesets()
                self.present_ruleset = ruleset = rulesets[0]
                # mode.printSummary (printStats=False)
                self.keywords,self.word_chars = self.init_keywords(mode,ruleset)
                    # Sets self.word_chars: must be called before createRuleMatchers.
                self.createRuleMatchers(ruleset.rules)
                    # Sets self.defaultRulesList & self.rulesDict.
                bunch = g.bunch(mode=mode,
                    defaultRulesList=self.defaultRulesList,
                    keywords=self.keywords,
                    rulesDict=self.rulesDict,
                    word_chars=self.word_chars)
                self.modes[language] = bunch
            elif language:
                g.trace('No language description for %s' % language)
    #@nonl
    #@-node:ekr.20050602150619:init_mode
    #@+node:ekr.20050530065723.47:parse_jEdit_file
    def parse_jEdit_file(self,fileName,verbose=False):
        
        if not fileName:
            return None
        
        if not fileName.endswith('.xml'):
            fileName = fileName + '.xml'
    
        path = os.path.join(g.app.loadDir,'../','modes',fileName)
        path = os.path.normpath(path)
        
        try: f = open(path)
        except IOError:
            g.trace('can not open %s'%path)
            return None
    
        try:
            try:
                mode = None
                parser = xml.sax.make_parser()
                # Do not include external general entities.
                # The actual feature name is "http://xml.org/sax/features/external-general-entities"
                parser.setFeature(xml.sax.handler.feature_external_ges,0)
                handler = contentHandler(self.c,fileName,verbose=verbose)
                parser.setContentHandler(handler)
                parser.parse(f)
                # if verbose: handler.printSummary()
                mode = handler.getMode()
            except:
                g.es('unexpected exception parsing %s' % (fileName),color='red')
                g.es_exception()
        finally:
            f.close()
            return mode
    #@nonl
    #@-node:ekr.20050530065723.47:parse_jEdit_file
    #@+node:ekr.20050529143413.81:scanColorDirectives
    def scanColorDirectives(self,p):
        
        """Scan position p and p's ancestors looking for @comment, @language and @root directives,
        setting corresponding colorizer ivars.
        """
    
        p = p.copy() ; c = self.c
        if c == None: return # self.c may be None for testing.
    
        self.language = language = c.target_language
        self.comment_string = None
        self.rootMode = None # None, "code" or "doc"
        
        for p in p.self_and_parents_iter():
            # g.trace(p)
            s = p.v.t.bodyString
            theDict = g.get_directives_dict(s)
            #@        << Test for @comment or @language >>
            #@+node:ekr.20050529143413.82:<< Test for @comment or @language >>
            # @comment and @language may coexist in the same node.
            
            if theDict.has_key("comment"):
                k = theDict["comment"]
                self.comment_string = s[k:]
            
            if theDict.has_key("language"):
                i = theDict["language"]
                language,junk,junk,junk = g.set_language(s,i)
                self.language = language
            
            if theDict.has_key("comment") or theDict.has_key("language"):
                break
            #@nonl
            #@-node:ekr.20050529143413.82:<< Test for @comment or @language >>
            #@nl
            #@        << Test for @root, @root-doc or @root-code >>
            #@+node:ekr.20050529143413.83:<< Test for @root, @root-doc or @root-code >>
            if theDict.has_key("root") and not self.rootMode:
            
                k = theDict["root"]
                if g.match_word(s,k,"@root-code"):
                    self.rootMode = "code"
                elif g.match_word(s,k,"@root-doc"):
                    self.rootMode = "doc"
                else:
                    doc = c.config.at_root_bodies_start_in_doc_mode
                    self.rootMode = g.choose(doc,"doc","code")
            #@nonl
            #@-node:ekr.20050529143413.83:<< Test for @root, @root-doc or @root-code >>
            #@nl
    
        return self.language # For use by external routines.
    #@nonl
    #@-node:ekr.20050529143413.81:scanColorDirectives
    #@+node:ekr.20050529143413.29:setFontFromConfig
    def setFontFromConfig (self):
        
        c = self.c
        
        self.bold_font = c.config.getFontFromParams(
            "body_text_font_family", "body_text_font_size",
            "body_text_font_slant",  "body_text_font_weight",
            c.config.defaultBodyFontSize, tag = "colorer bold")
        
        if self.bold_font:
            self.bold_font.configure(weight="bold")
        
        self.italic_font = c.config.getFontFromParams(
            "body_text_font_family", "body_text_font_size",
            "body_text_font_slant",  "body_text_font_weight",
            c.config.defaultBodyFontSize, tag = "colorer italic")
            
        if self.italic_font:
            self.italic_font.configure(slant="italic",weight="normal")
        
        self.bolditalic_font = c.config.getFontFromParams(
            "body_text_font_family", "body_text_font_size",
            "body_text_font_slant",  "body_text_font_weight",
            c.config.defaultBodyFontSize, tag = "colorer bold italic")
            
        if self.bolditalic_font:
            self.bolditalic_font.configure(weight="bold",slant="italic")
            
        self.color_tags_list = []
        self.image_references = []
    #@nonl
    #@-node:ekr.20050529143413.29:setFontFromConfig
    #@+node:ekr.20050529143413.87:updateSyntaxColorer
    def updateSyntaxColorer (self,p):
    
        p = p.copy()
        # self.flag is True unless an unambiguous @nocolor is seen.
        self.flag = self.useSyntaxColoring(p)
        self.scanColorDirectives(p)
    #@nonl
    #@-node:ekr.20050529143413.87:updateSyntaxColorer
    #@+node:ekr.20050529143413.88:useSyntaxColoring
    def useSyntaxColoring (self,p):
        
        """Return True unless p is unambiguously under the control of @nocolor."""
        
        p = p.copy() ; first = p.copy()
        val = True ; self.killcolorFlag = False
        for p in p.self_and_parents_iter():
            # g.trace(p)
            s = p.v.t.bodyString
            theDict = g.get_directives_dict(s)
            no_color = theDict.has_key("nocolor")
            color = theDict.has_key("color")
            kill_color = theDict.has_key("killcolor")
            # A killcolor anywhere disables coloring.
            if kill_color:
                val = False ; self.killcolorFlag = True ; break
            # A color anywhere in the target enables coloring.
            if color and p == first:
                val = True ; break
            # Otherwise, the @nocolor specification must be unambiguous.
            elif no_color and not color:
                val = False ; break
            elif color and not no_color:
                val = True ; break
    
        return val
    #@-node:ekr.20050529143413.88:useSyntaxColoring
    #@-node:ekr.20050529143413.24:Birth and init
    #@+node:ekr.20050529145203:Entry points
    #@+node:ekr.20050529143413.30:colorize (Main entry point)
    def colorize(self,p,incremental=False):
        
        '''The main colorizer entry point.'''
        
        # g.trace(incremental)
    
        if self.enabled:
            self.incremental=incremental 
            self.updateSyntaxColorer(p)
            return self.colorizeAnyLanguage(p)
        else:
            return "ok" # For unit testing.
    #@nonl
    #@-node:ekr.20050529143413.30:colorize (Main entry point)
    #@+node:ekr.20050529143413.28:disable
    def disable (self):
    
        print "disabling all syntax coloring"
        self.enabled=False
        
    def enable (self):
        self.enabled=True
    #@nonl
    #@-node:ekr.20050529143413.28:disable
    #@+node:ekr.20050529145203.1:recolor_range
    def recolor_range(self,p,leading,trailing):
        
        '''An entry point for the colorer called from incremental undo code.
        Colorizes the lines between the leading and trailing lines.'''
        
        # g.trace(leading,trailing)
        
        if self.enabled:
            self.incremental=True
            self.invalidate_range(leading,trailing)
            self.updateSyntaxColorer(p)
            return self.colorizeAnyLanguage(p,leading=leading,trailing=trailing)
        else:
            return "ok" # For unit testing.
    #@nonl
    #@-node:ekr.20050529145203.1:recolor_range
    #@+node:ekr.20050529143413.84:schedule & idle_colorize
    def schedule(self,p,incremental=0):
        
        __pychecker__ = '--no-argsused'
        # p not used, but it is difficult to remove.
    
        if self.enabled:
            self.incremental=incremental
            g.app.gui.setIdleTimeHook(self.idle_colorize)
            
    def idle_colorize(self):
    
        # New in 4.3b1: make sure the colorizer still exists!
        if hasattr(self,'enabled') and self.enabled:
            p = self.c.currentPosition()
            if p:
                self.incremental=False
                self.colorize(p)
    #@nonl
    #@-node:ekr.20050529143413.84:schedule & idle_colorize
    #@-node:ekr.20050529145203:Entry points
    #@+node:ekr.20050529150436:Colorizer code
    #@+node:ekr.20050601042620:colorAll
    def colorAll(self,s):
        
        '''Colorize all of s.'''
    
        # Init ivars used by colorOneChunk.
        self.chunk_s = s
        self.chunk_i = 0
        self.chunk_last_i = 0
        self.kill_chunk = False
    
        self.colorOneChunk()
    #@-node:ekr.20050601042620:colorAll
    #@+node:ekr.20050529143413.31:colorizeAnyLanguage
    def colorizeAnyLanguage (self,p,leading=None,trailing=None):
        
        '''Color the body pane.  All coloring starts here.'''
        
        self.init_mode(self.language)
        if self.killcolorFlag or not self.mode:
            self.removeAllTags() ; return
        try:
            c = self.c
            self.p = p
            self.redoColoring = False
            self.redoingColoring = False
            self.was_non_incremental = not self.incremental
            # g.trace('was_non_incremental',self.was_non_incremental)
            if not self.incremental:
                # g.trace('removing tags')
                if 0: # removing tags causes flash at idle time.
                    self.removeAllTags()
                    self.removeAllImages()
                self.colored_ranges = {}
            self.configure_tags()
            g.doHook("init-color-markup",colorer=self,p=self.p,v=self.p)
            s = self.body.getAllText()
            self.colorAll(s)
            if self.redoColoring: # Set only from plugins.
                self.recolor_all()
            return "ok" # for unit testing.
        except Exception:
            g.es_exception()
            return "error" # for unit testing.
    #@nonl
    #@-node:ekr.20050529143413.31:colorizeAnyLanguage
    #@+node:ekr.20050601105358:colorOneChunk
    def colorOneChunk(self,allowBreak=True):
        '''Colorize a fixed number of tokens.
        If not done, queue this method again to continue coloring later.'''
        s,i = self.chunk_s,self.chunk_i
        count = 0 ; self.chunk_count += 1
        # g.trace('%3d'%(self.chunk_count),self.incremental)
        if not self.incremental:
            self.incremental = True
            #@        << queue up this method the first time >>
            #@+node:ekr.20050605130806:<< queue up this method the first time >>
            self.chunk_s,self.chunk_i = s,i
            self.c.frame.top.after(50,self.colorOneChunk)
            #@nonl
            #@-node:ekr.20050605130806:<< queue up this method the first time >>
            #@nl
            return
        while i < len(s):
            count += 1
            # Exit only after finishing the row.  This reduces flash.
            if i == 0 or s[i-1] == '\n':
                if self.kill_chunk: return
                if self.incremental and allowBreak:
                    if count >= 50:
                        #@                    << queue up this method >>
                        #@+node:ekr.20050601162452.1:<< queue up this method >>
                        self.chunk_s,self.chunk_i = s,i
                        self.c.frame.top.after_idle(self.colorOneChunk)
                        #@nonl
                        #@-node:ekr.20050601162452.1:<< queue up this method >>
                        #@nl
                        return
            for f,kind,token_type,delegate in self.rulesDict.get(s[i],self.defaultRulesList):
                n = f(self,s,i)
                if n > 0:
                    self.doRule(s,i,i+n,kind,token_type,delegate)
                    i += n
                    break
            else:
                if self.present_ruleset.defaultColor:
                    self.colorRangeWithTag(s,i,i+1,self.present_ruleset.defaultColor.lower())
                # g.trace('no match')
                i += 1
    
        self.removeTagsFromRange(s,self.chunk_last_i,len(s))
    #@nonl
    #@-node:ekr.20050601105358:colorOneChunk
    #@+node:ekr.20050601065451:doColor & helpers
    def doColor(self,s,i,j,token_type):
    
        helpers = {
            'doc_part':self.docPartColorHelper,
            'section_ref':self.sectionRefColorHelper,
            'keywords':self.keywordsColorHelper,
            '@color':self.atColorColorHelper,
            '@nocolor':self.atNocolorColorHelper,
        }
        
        # not in range of @nocolor.
        if self.flag:
            # g.trace(i,j,token_type)
            helper = helpers.get(token_type,self.defaultColorHelper)
            helper(token_type,s,i,j)
    #@nonl
    #@+node:ekr.20050603051440:atColorColorHelper & atNocolorColorHelper
    def atColorColorHelper (self,token_type,s,i,j):
        
        # Enable coloring.
        self.flag = True
    
        # Color the Leo keyword.
        self.keywordNumber = 0
        self.keywordsColorHelper(token_type,s,i,j)
        
    def atNocolorColorHelper (self,token_type,s,i,j):
        
        if self.flag:
            # Color the Leo keyword.
            self.keywordNumber = 0
            self.keywordsColorHelper(token_type,s,i,j)
        
        # Disable coloring until next @color
        self.flag = False
    #@nonl
    #@-node:ekr.20050603051440:atColorColorHelper & atNocolorColorHelper
    #@+node:ekr.20050602205810.4:colorRangeWithTag
    def colorRangeWithTag (self,s,i,j,tag):
    
        if self.was_non_incremental:
            must_color = True
            self.removeOldTagsFromRange(s,self.chunk_last_i,j)
        elif self.rangeColoredWithTag(i,j,tag):
            must_color = False
            # Remove the old tags to i.
            self.removeTagsFromRange(s,self.chunk_last_i,i)
        else:
            must_color = True
            # Remove the old tags to j.
            self.removeTagsFromRange(s,self.chunk_last_i,j)
    
        if must_color:
            # Remember the new tags.
            for k in xrange(i,j):
                self.colored_ranges[k] = tag
    
            # Do the real coloring.
            row,col = g.convertPythonIndexToRowCol(s,i)
            x1 = '%d.%d' % (row+1,col)
            row,col = g.convertPythonIndexToRowCol(s,j)
            x2 = '%d.%d' % (row+1,col)
            self.body.tag_add(tag,x1,x2)
    
        self.chunk_last_i = j
    #@nonl
    #@-node:ekr.20050602205810.4:colorRangeWithTag
    #@+node:ekr.20050602205810.3:defaultColorHelper
    def defaultColorHelper(self,token_type,s,i,j):
    
        d = {
            'seq': None,
            'literal1': 'string',
            'literal2': 'string',
            # 'keywords': 'keywords',
            'comment1': 'comment',
            'comment2': 'comment',
            'comment3': 'comment',
            'comment4': 'comment',
            'operator': None,
            # 'function': 'comment', # just for testing.
        }
        
        tag = d.get(token_type)
        if tag:
            self.colorRangeWithTag(s,i,j,tag)
    #@nonl
    #@-node:ekr.20050602205810.3:defaultColorHelper
    #@+node:ekr.20050602205810:docPartColorHelper
    def docPartColorHelper (self,token_type,s,i,j):
        
        i2 = g.choose(s[i:i+4] == '@doc',i+4,i+1)
        if   s[j-5:j] == '@code': j2 = j-5
        elif s[j-2:j] == '@c': j2 = j-2
        else: j2 = j
        
        # g.trace(i,i2,j2,j)
    
        self.colorRangeWithTag(s,i,i2,'leoKeyword')
        self.colorRangeWithTag(s,i2,j2,'docPart')
        self.colorRangeWithTag(s,j2,j,'leoKeyword')
    #@nonl
    #@-node:ekr.20050602205810:docPartColorHelper
    #@+node:ekr.20050603202319:invalidate_range
    def invalidate_range (self,i,j):
        
        for k in xrange(i,j):
            self.colored_ranges[k] = None
    #@nonl
    #@-node:ekr.20050603202319:invalidate_range
    #@+node:ekr.20050602205810.2:keywordsColorHelper
    def keywordsColorHelper (self,token_type,s,i,j):
        
        theList = ('leoKeyword','keyword1','keyword2','keyword3','keyword4',)
    
        tag = theList[self.keywordNumber]
    
        if tag:
            self.colorRangeWithTag(s,i,j,tag)
    #@nonl
    #@-node:ekr.20050602205810.2:keywordsColorHelper
    #@+node:ekr.20050603190206:rangeColoredWithTag
    def rangeColoredWithTag(self,i,j,tag):
        
        for k in xrange(i,j):
            if tag != self.colored_ranges.get(k):
                return False
        return True
    #@nonl
    #@-node:ekr.20050603190206:rangeColoredWithTag
    #@+node:ekr.20050605185452:removeOldTagsFromLine (not used)
    #@+at 
    #@nonl
    # Line-by line processing does not work because some tokens span multiple 
    # lines.
    #@-at
    #@@c
    
    def removeOldTagsFromLine(self,s,i):
    
        row,col = g.convertPythonIndexToRowCol(s,i)
        x1 = '%d.0' % (row+1)
        x2 = '%d.0' % (row+2)
        
        # g.trace('remove',x1,x2)
        
        for tag in self.tags:
            self.body.tag_remove(tag,x1,x2)
        
        for tag in self.color_tags_list:
            self.body.tag_remove(tag,x1,x2)
    #@nonl
    #@-node:ekr.20050605185452:removeOldTagsFromLine (not used)
    #@+node:ekr.20050605183244:removeOldTagsFromRange
    def removeOldTagsFromRange(self,s,i,j):
        
        '''Remove all tags from range without using the colored_ranges dict.
        
        This is executed when a non-incremental redraw clears the colored_ranges dict.'''
    
        row,col = g.convertPythonIndexToRowCol(s,i)
        x1 = '%d.%d' % (row+1,col)
        row,col = g.convertPythonIndexToRowCol(s,j)
        x2 = '%d.%d' % (row+1,col)
                
        for tag in self.tags:
            self.body.tag_remove(tag,x1,x2)
        
        for tag in self.color_tags_list:
            self.body.tag_remove(tag,x1,x2)
    #@nonl
    #@-node:ekr.20050605183244:removeOldTagsFromRange
    #@+node:ekr.20050603174749:removeTagsFromRange
    def removeTagsFromRange (self,s,i,j):
        
        tags = {}
        for k in xrange(i,j):
            tag = self.colored_ranges.get(k)
            if tag: # Must remove the tag, even if it will be reapplied (to a possibly different range).
                tags[tag] = None
                self.colored_ranges[k] = None
    
        row,col = g.convertPythonIndexToRowCol(s,i)
        x1 = '%d.%d' % (row+1,col)
        row,col = g.convertPythonIndexToRowCol(s,j)
        x2 = '%d.%d' % (row+1,col)
        
        # g.trace('row',row+1)
    
        for tag in tags.keys():
            # g.trace(tag,x1,x2)
            self.body.tag_remove(tag,x1,x2)
    #@nonl
    #@-node:ekr.20050603174749:removeTagsFromRange
    #@+node:ekr.20050602205810.1:sectionRefColorHelper
    ## To do: this assumes the 2-character brackets.
    
    def sectionRefColorHelper (self,token_type,s,i,j):
        
        # g.trace(i,j,s[i:j])
        
        self.colorRangeWithTag(s,i,i+2,'nameBrackets')
    
        ref = g.findReference(s[i:j],self.p)
        if ref:
            if self.use_hyperlinks:
                #@            << set the hyperlink >>
                #@+node:ekr.20050607065634:<< set the hyperlink >>
                # Set the bindings to vnode callbacks.
                # Create the tag.
                # Create the tag name.
                tagName = "hyper" + str(self.hyperCount)
                self.hyperCount += 1
                self.body.tag_delete(tagName)
                self.tag(tagName,i+2,j)
                
                ref.tagName = tagName
                self.body.tag_bind(tagName,"<Control-1>",ref.OnHyperLinkControlClick)
                self.body.tag_bind(tagName,"<Any-Enter>",ref.OnHyperLinkEnter)
                self.body.tag_bind(tagName,"<Any-Leave>",ref.OnHyperLinkLeave)
                #@nonl
                #@-node:ekr.20050607065634:<< set the hyperlink >>
                #@nl
            else:
                self.colorRangeWithTag(s,i+2,j-2,'link')
        else:
            self.colorRangeWithTag(s,i+2,j-2,'name')
    
        self.colorRangeWithTag(s,j-2,j,'nameBrackets')
    #@nonl
    #@-node:ekr.20050602205810.1:sectionRefColorHelper
    #@-node:ekr.20050601065451:doColor & helpers
    #@+node:ekr.20050601162452.3:doRule & colorByDelegate
    def doRule (self,s,i,j,kind,token_type,delegate):
        
        if kind == 'mark_following':
            pass
        
        elif kind == 'mark_previous':
            if 0: # This make no sense at all.
                if prev:
                    i2,j2,token_type2 = self.prev
                    g.trace('mark_previous',i2,j2,token_type2)
                    self.doColor(s,i2,j2,token_type) # Use the type specified in the mark_previous.
                    self.prev = None
        elif delegate:
            self.colorByDelegate(delegate,s,i,j,token_type)
            self.prev = (i,j,token_type)
        else:
            # g.trace('%3d %2d'%(i,j),state,repr(s[i:i+n]))
            self.doColor(s,i,j,token_type)
            self.prev = (i,j,token_type)
    #@nonl
    #@+node:ekr.20050607212958:colorByDelegate
    def colorByDelegate(self,delegate,s,i,j,token_type):
        
        # g.trace(delegate,repr(s[i:j]))
        
        if -1 == delegate.find('::'):
            # Use the ruleset in the present mode.
            rulesetName = delegate
        else:
            # file::ruleset
            file,rulesetName = delegate.split('::')
            self.init_mode(file)
            
        ruleset = self.mode.getRuleset(name=rulesetName)
        if ruleset:
            # self.mode.printRuleset(ruleset,tag=delegate)
            # Save ivars
            ### Bug: this doesn't handle nested delegates.
            ### Fix: don't save here:  move the ivars to the ruleset class and keep a stack of rulesets.
            self.save_present_ruleset = self.present_ruleset
            self.save_keywords = self.keywords # A bunch.
            self.save_word_chars = self.word_chars.copy()
            self.save_defaultRulesList = self.defaultRulesList[:]
            self.save_rulesDict = self.rulesDict.copy()
            # Set ivars for the delegated string only.
            # Sart at the real zero so row/column numbers are computed properly.
            self.chunk_s = s[0:j+1]
            self.chunk_i = i # Required.
            self.present_ruleset = ruleset
            self.keywords,self.word_chars = self.init_keywords(self.mode,ruleset)
            self.createRuleMatchers(ruleset.rules) # Sets self.defaultRulesList & self.rulesDict.
            # Do the coloring with no break.
            self.colorOneChunk(allowBreak=False) 
            # Restore ivars.
            self.chunk_s = s
            self.chunk_i = j+1
            self.present_ruleset = self.save_present_ruleset
            self.keywords = self.save_keywords
            self.word_chars = self.save_word_chars
            self.defaultRulesList = self.save_defaultRulesList
            self.rulesDict = self.save_rulesDict
    #@nonl
    #@-node:ekr.20050607212958:colorByDelegate
    #@-node:ekr.20050601162452.3:doRule & colorByDelegate
    #@+node:ekr.20050602144940:interrupt
    # This is needed, even without threads.
    def interrupt(self):
        '''Interrupt colorOneChunk'''
        self.kill_chunk = True
    #@nonl
    #@-node:ekr.20050602144940:interrupt
    #@+node:ekr.20050529143413.42:recolor_all
    def recolor_all (self):
    
        # This code is executed only if graphics characters will be inserted by user markup code.
        
        # Pass 1:  Insert all graphics characters.
        self.removeAllImages()
        s = self.body.getAllText()
        lines = s.split('\n')
        
        self.color_pass = 1
        self.line_index = 1
        state = self.setFirstLineState()
        for s in lines:
            state = self.colorizeLine(s,state)
            self.line_index += 1
        
        # Pass 2: Insert one blank for each previously inserted graphic.
        self.color_pass = 2
        self.line_index = 1
        state = self.setFirstLineState()
        for s in lines:
            #@        << kludge: insert a blank in s for every image in the line >>
            #@+node:ekr.20050529143413.43:<< kludge: insert a blank in s for every image in the line >>
            #@+at 
            #@nonl
            # A spectacular kludge.
            # 
            # Images take up a real index, yet the get routine does not return 
            # any character for them!
            # In order to keep the colorer in synch, we must insert dummy 
            # blanks in s at the positions corresponding to each image.
            #@-at
            #@@c
            
            inserted = 0
            
            for photo,image,line_index,i in self.image_references:
                if self.line_index == line_index:
                    n = i+inserted ; 	inserted += 1
                    s = s[:n] + ' ' + s[n:]
            #@-node:ekr.20050529143413.43:<< kludge: insert a blank in s for every image in the line >>
            #@nl
            state = self.colorizeLine(s,state)
            self.line_index += 1
    #@nonl
    #@-node:ekr.20050529143413.42:recolor_all
    #@-node:ekr.20050529150436:Colorizer code
    #@+node:ekr.20050529143413.89:Utils
    #@+at 
    #@nonl
    # These methods are like the corresponding functions in leoGlobals.py 
    # except they issue no error messages.
    #@-at
    #@+node:ekr.20050601044345:get_word (not used)
    def get_word(self,s,i):
    
        j = i
        while j < len(s) and s[j] in self.word_chars:
            j += 1
    
        return s[i:j]
    #@nonl
    #@-node:ekr.20050601044345:get_word (not used)
    #@+node:ekr.20050529143413.90:index & tag
    def index (self,i):
        
        return self.body.convertRowColumnToIndex(self.line_index,i)
            
    def tag (self,name,i,j):
    
        self.body.tag_add(name,self.index(i),self.index(j))
    #@nonl
    #@-node:ekr.20050529143413.90:index & tag
    #@+node:ekr.20050529143413.86:removeAllImages
    def removeAllImages (self):
        
        for photo,image,line_index,i in self.image_references:
            try:
                self.body.deleteCharacter(image) # 10/27/03
            except:
                pass # The image may have been deleted earlier.
        
        self.image_references = []
    #@nonl
    #@-node:ekr.20050529143413.86:removeAllImages
    #@+node:ekr.20050529143413.80:removeAllTags & removeTagsFromLines
    def removeAllTags (self):
        
        # Warning: the following DOES NOT WORK: self.body.tag_delete(self.tags)
        for tag in self.tags:
            self.body.tag_delete(tag)
    
        for tag in self.color_tags_list:
            self.body.tag_delete(tag)
        
    def removeTagsFromLine (self):
        
        # print "removeTagsFromLine",self.line_index
        for tag in self.tags:
            self.body.tag_remove(tag,self.index(0),self.index("end"))
            
        for tag in self.color_tags_list:
            self.body.tag_remove(tag,self.index(0),self.index("end"))
    #@nonl
    #@-node:ekr.20050529143413.80:removeAllTags & removeTagsFromLines
    #@-node:ekr.20050529143413.89:Utils
    #@+node:ekr.20050529180421.47:Rule matching methods
    #@+node:ekr.20050530112849:createRuleMatchers
    def createRuleMatchers (self,rules):
        
        self.defaultRulesList = []
        self.rulesDict = {}
    
        # Put the Leo rules first on each list.
        for key,createMatcher in (
            ('@',self.createAtColorMatcher),
            ('@',self.createAtNocolorMatcher),
            ('@',self.createDocPartMatcher),
            ('<',self.createSectionRefMatcher),
        ):
            f,name,token_type,delegate = createMatcher()
            rulesList = self.rulesDict.get(key,[])
            rulesList.append((f,name,token_type,delegate),)
            self.rulesDict[key] = rulesList
            
        for rule in rules:
            self.createRuleMatcher(rule)
            
        if 0:
            total = 0 ; n = len(self.rulesDict.keys())
            for key in self.rulesDict.keys():
                theList = self.rulesDict.get(key,[])
                total += len(theList)
            total += len(self.defaultRulesList)
            print 'mean length of rules list: %0.3f' % (float(total)/float(n+1))
    #@nonl
    #@-node:ekr.20050530112849:createRuleMatchers
    #@+node:ekr.20050530112849.1:createRuleMatcher
    def createRuleMatcher (self,rule):
        
        name = rule.name ; d = rule.attributes or {}
        token_type    = d.get('type','<no type>').lower()
        at_line_start = d.get('at_line_start',False)
        at_ws_end     = d.get('at_ws_end',False)
        at_word_start = d.get('at_word_start',False)
        delegate      = d.get('delegate','')
        no_line_break = d.get('no_line_break',False)
        d2 = rule.get('contents',{})
        seq     = d2.get(name,'')
        begin   = d2.get('begin','')
        end     = d2.get('end','')
        
        if name == 'eol_span':
            keys = [seq[0]]
            def f(self,s,i,seq=seq,
                at_line_start=at_line_start,at_ws_end=at_ws_end,at_word_start=at_word_start
            ):
                return self.match_eol_span(s,i,seq,at_line_start,at_ws_end,at_word_start)
        elif name == 'eol_span_regexp':
            keys = [seq[0]]
            def f(self,s,i,seq=seq,
                at_line_start=at_line_start,at_ws_end=at_ws_end,at_word_start=at_word_start
            ):
                return self.match_eol_span_regexp(s,i,seq,
                    at_line_start,at_ws_end,at_word_start)
        elif name == 'keywords':
            keys = self.word_chars
            def f(self,s,i):
                return self.match_keywords(s,i)
            token_type = 'keywords'
        elif name in ('mark_following','mark_previous','seq'):
            keys = [seq[0]]
            def f(self,s,i,seq=seq,
                at_line_start=at_line_start,at_ws_end=at_ws_end,at_word_start=at_word_start
            ):
                return self.match_seq(s,i,seq,at_line_start,at_ws_end,at_word_start)
        elif name == 'seq_regexp':
            keys = [hash_char]
            def f(self,s,i,seq=seq,hash_char=hash_char,
                at_line_start=at_line_start,at_ws_end=at_ws_end,at_word_start=at_word_start
            ):
                return self.match_seq_regexp(s,i,seq,hash_char,
                    at_line_start,at_ws_end,at_word_start)
        elif name == 'span':
            keys = [begin[0]]
            def f(self,s,i,begin=begin,end=end,
                at_line_start=at_line_start,at_ws_end=at_ws_end,
                at_word_start=at_word_start,no_line_break=no_line_break
            ):
                return self.match_span(s,i,begin,end,
                    at_line_start,at_ws_end,at_word_start,no_line_break)
        elif name == 'span_regexp':
            keys = [hash_char]
            def f(self,s,i,begin=begin,end=end,hash_char=hash_char,
                at_line_start=at_line_start,at_ws_end=at_ws_end,
                at_word_start=at_word_start,no_line_break=no_line_break
            ):
                return self.match_span_regexp(s,i,begin,end,hash_char,
                    at_line_start,at_ws_end,at_word_start,no_line_break)
        else:
            keys = []
            g.trace('no function for %s' % name)
            def f(self,s,i):
                return 0
    
        # Put f,name,token_type,delegate in the rulesDict or defaultRulesList.
        for key in keys:
            if key in string.printable:
                rulesList = self.rulesDict.get(key,[])
                rulesList.append((f,name,token_type,delegate),)
                self.rulesDict[key] = rulesList
            else:
                self.defaultRulesList.append((f,name,token_type,delegate),)
    
        # g.trace('%-25s'%(name+':'+token_type),at_line_start,at_ws_end,at_word_start,repr(seq),repr(begin),repr(end))
    #@nonl
    #@-node:ekr.20050530112849.1:createRuleMatcher
    #@+node:ekr.20050602204708:createDocPartMatcher & createSectionRefMatcher
    def createDocPartMatcher (self):
        
        def f(self,s,i):
            return self.match_doc_part(s,i)
    
        name = token_type = 'doc_part'
        delegate = ''
        return f,name,token_type,delegate
    
    def createSectionRefMatcher (self):
        
        def f(self,s,i):
            return self.match_section_ref(s,i)
    
        name = token_type = 'section_ref'
        delegate = ''
        return f,name,token_type,delegate
    #@nonl
    #@-node:ekr.20050602204708:createDocPartMatcher & createSectionRefMatcher
    #@+node:ekr.20050603043840:createAtColorMatcher & createAtNocolorMatcher
    def createAtColorMatcher (self):
        
        def f(self,s,i):
            return self.match_at_color(s,i)
    
        name = token_type = '@color'
        delegate = ''
        return f,name,token_type,delegate
    
    def createAtNocolorMatcher (self):
        
        def f(self,s,i):
            return self.match_at_nocolor(s,i)
    
        name = token_type = '@nocolor'
        delegate = ''
        return f,name,token_type,delegate
    #@nonl
    #@-node:ekr.20050603043840:createAtColorMatcher & createAtNocolorMatcher
    #@+node:ekr.20050603043840.1:match_at_color
    def match_at_color (self,s,i):
    
        seq = '@color'
        
        if i != 0 and s[i-1] != '\n': return 0
    
        if g.match_word(s,i,seq):
            # g.trace(i)
            self.flag = True # Enable coloring now so @color itself gets colored.
            return len(seq)
        else:
            return 0
    #@-node:ekr.20050603043840.1:match_at_color
    #@+node:ekr.20050603043840.2:match_at_nocolor
    def match_at_nocolor (self,s,i):
        
        seq = '@nocolor'
        
        if i != 0 and s[i-1] != '\n':
            return 0
    
        if g.match_word(s,i,seq):
            self.keywordNumber = 0
            return len(seq)
        else:
            return 0
    #@nonl
    #@-node:ekr.20050603043840.2:match_at_nocolor
    #@+node:ekr.20050529190857:match_keywords
    # This is a time-critical method.
    def match_keywords (self,s,i):
        
        '''Return the length of the keyword if present position matches any keyword.
        Otherwise, return 0.'''
        
        # We must be at the start of a word.
        if i > 0 and s[i-1] in self.word_chars:
            return 0
            
        # Get the word as quickly as possible.
        j = i ; n = len(s) ; w = self.word_chars
        while j < n and s[j] in w:
            j += 1
       
        k = self.keywords.get(s[i:j],-1)
        if k > -1:
            self.keywordNumber = k
            # g.trace(i,s[i:j])
            return j-i
        else:
            return 0
    #@nonl
    #@-node:ekr.20050529190857:match_keywords
    #@+node:ekr.20050529182335:match_regexp_helper (TO DO)
    def match_regexp_helper (self,s,i,seq):
        
        '''Return the length of the matching text if seq (a regular expression) matches the present position.'''
        
        ### We may want to return a match object too.
        
        return 0 ### Not ready yet.
    #@nonl
    #@-node:ekr.20050529182335:match_regexp_helper (TO DO)
    #@+node:ekr.20050601045930:match_eol_span
    def match_eol_span (self,s,i,seq,at_line_start,at_ws_end,at_word_start):
        
        '''Return the length of the rest of line if SEQ matches s[i:]
        Return 0 if no match.
    
        'at_line_start':    True: sequence must start the line.
        'at_ws_end':        True: sequence must be first non-whitespace text of the line.
        'at_word_start':    True: sequence must start a word.'''
    
        if at_line_start and i != 0 and s[i-1] != '\n': return 0
        if at_ws_end and i != g.skip_ws(s,0): return 0
        if at_word_start and i > 0 and s[i-1] not in self.word_chars: return 0
        
        # g.trace(i,repr(s[i]),repr(seq))
    
        if g.match(s,i,seq):
            j = g.skip_to_end_of_line(s,i)
            return j - i 
        else:
            return 0
    #@-node:ekr.20050601045930:match_eol_span
    #@+node:ekr.20050601063317:match_eol_span_regexp
    def match_eol_span_regexp (self,s,i,seq,at_line_start,at_ws_end,at_word_start,hash_char):
        
        '''Return the length of rest if the line if seq (a regx) matches s[i:]
        Return 0 if no match.
    
        'at_line_start':    True: sequence must start the line.
        'at_ws_end':        True: sequence must be first non-whitespace text of the line.
        'at_word_start':    True: sequence must start a word.
        'hash_char':        The first character of the regexp (for speed).'''
    
        if at_line_start and i != 0 and s[i-1] != '\n': return 0
        if at_ws_end and i != g.skip_ws(s,0): return 0
        if at_word_start and i > 0 and s[i-1] not in self.word_chars: return 0
        
        # Test hash_char first to increase speed.
        if i < len(s) and s[i] == hash_char:
            n = self.match_regexp_helper(s,i,seq)
            if n > 0:
                j = g.skip_to_end_of_line(s,i)
                return j - i
            else:
                return 0
        else:
            return 0
    #@nonl
    #@-node:ekr.20050601063317:match_eol_span_regexp
    #@+node:ekr.20050529182335.1:match_seq, match_mark_following/previous
    def match_seq (self,s,i,seq,at_line_start,at_ws_end,at_word_start):
        
        '''Return the length of a matched SEQ or 0 if no match.
    
        'at_line_start':    True: sequence must start the line.
        'at_ws_end':        True: sequence must be first non-whitespace text of the line.
        'at_word_start':    True: sequence must start a word.'''
    
        if at_line_start and i != 0 and s[i-1] != '\n': return 0
        if at_ws_end and i != g.skip_ws(s,0): return 0
        if at_word_start and i > 0 and s[i-1] not in self.word_chars: return 0
    
        if g.match(s,i,seq): return len(seq)
        else: return 0
    
    # For spans & marks, seq comes from the contents.
    match_mark_following  = match_seq
    match_mark_previous   = match_seq
    #@nonl
    #@-node:ekr.20050529182335.1:match_seq, match_mark_following/previous
    #@+node:ekr.20050602211219:match_section_ref
    def match_section_ref (self,s,i):
        
        if not g.match(s,i,'<<'):
            return 0
            
        val = g.find_on_line(s,i+2,'>>')
        if val is not None:
            return val + 2 - i
        else:
            return 0
    #@nonl
    #@-node:ekr.20050602211219:match_section_ref
    #@+node:ekr.20050602211253:match_doc_part
    def match_doc_part (self,s,i):
        
        if i >= len(s) or s[i] != '@':
            return 0
    
        if i + 1 >= len(s):
            return 1
            
        if not g.match_word(s,i,'@doc') and not s[i+1] in (' ','\t','\n'):
            return 0
    
        j = i
        while 1:
            k = s.find('@c',j)
            if k == -1:
                return len(s) - i
            if s[k-1] != '\n' or (not g.match_word(s,k,'@c') and not g.match_word(s,k,'@code')):
                j = j + k + 1
                continue
            elif g.match_word(s,k,'@c'):
                return k + 2 - i
            else:
                return k + 5 - i
    #@nonl
    #@-node:ekr.20050602211253:match_doc_part
    #@+node:ekr.20050529215620:match_seq_regexp
    def match_seq_regexp (self,s,i,seq,hash_char,
        at_line_start,at_ws_end,at_word_start):
        
        '''Return the length of a matched SEQ_REGEXP or 0 if no match.
    
        'at_line_start':    True: sequence must start the line.
        'at_ws_end':        True: sequence must be first non-whitespace text of the line.
        'at_word_start':    True: sequence must start a word.
        'hash_char':        The first character of the regexp (for speed).'''
    
        if at_line_start and i != 0 and s[i-1] != '\n': return 0
        if at_ws_end and i != g.skip_ws(s,0): return 0
        if at_word_start and i > 0 and s[i-1] not in self.word_chars: return 0
        
        # Test hash_char first to increase speed.
        if i < len(s) and s[i] == hash_char:
            return self.match_regexp_helper(s,i,seq)
        else:
            return 0
    #@nonl
    #@-node:ekr.20050529215620:match_seq_regexp
    #@+node:ekr.20050529185208.2:match_span
    def match_span (self,s,i,begin,end,
        at_line_start,at_ws_end,at_word_start,no_line_break):
        
        '''Return the length of a matched SPAN or 0 if no match.
    
        'at_line_start':    True: sequence must start the line.
        'at_ws_end':        True: sequence must be first non-whitespace text of the line.
        'at_word_start':    True: sequence must start a word.
        'no_line_break':    True: sequence must not cross a line.'''
        
        if at_line_start and i != 0 and s[i-1] != '\n': return 0
        if at_ws_end and i != g.skip_ws(s,0): return 0
        if at_word_start and i > 0 and s[i-1] not in self.word_chars: return 0
    
        if g.match(s,i,begin):
            j = s.find(end,i+len(begin))
            if j > -1:
                # g.trace(no_line_break,i,j,repr(s[i:j]))
                if no_line_break and '\n' in s[i:j]:
                    return 0
                else:
                    return j + len(end) - i
            else:
                return 0
        else:
            return 0
    #@-node:ekr.20050529185208.2:match_span
    #@+node:ekr.20050529215732:match_span_regexp
    def match_span_regexp (self,s,i,begin,end,hash_char,
        at_line_start,at_ws_end,at_word_start,no_line_break):
        
        '''Return the length of a matched SPAN_REGEXP or 0 if no match.
    
        'at_line_start':    True: sequence must start the line.
        'at_ws_end':        True: sequence must be first non-whitespace text of the line.
        'at_word_start':    True: sequence must start a word.
        'at_word_start':    True: sequence must start a word.
        'hash_char':        The first character of the regexp (for speed).'''
        
        if at_line_start and i != 0 and s[i-1] != '\n': return 0
        if at_ws_end and i != g.skip_ws(s,0): return 0
        if at_word_start and i > 0 and s[i-1] not in self.word_chars: return 0
        
        # Test hash_char first to increase speed.
        if i < len(s) and s[i] == hash_char:
            n = self.match_regexp_helper(s,i,begin)
            # We may have to allow $n here, in which case we must use a regex object?
            if n > 0 and g.match(s,i+n,end):
                return n + len(end)
        else:
            return 0
    #@nonl
    #@-node:ekr.20050529215732:match_span_regexp
    #@-node:ekr.20050529180421.47:Rule matching methods
    #@-others

class colorizer (baseColorizer):
    pass
#@nonl
#@-node:ekr.20050606214036:class colorizer (baseColorizer)
#@+node:ekr.20050606213440:class nullColorizer (colorizer)
class nullColorizer (colorizer):
    
    """A do-nothing colorer class"""
    
    #@    @+others
    #@+node:ekr.20050606213440.1:__init__
    def __init__ (self,c):
        
        colorizer.__init__(self,c) # init the base class.
    
        self.c = c
        self.enabled = False
    #@-node:ekr.20050606213440.1:__init__
    #@+node:ekr.20050606213440.2:entry points
    def colorize(self,p,incremental=False): pass
    
    def disable(self): pass
        
    def enable(self): pass
        
    def idle_colorize(self): pass
            
    def recolor_range(self,p,leading,trailing): pass
    
    def scanColorDirectives(self,p): pass
        
    def schedule(self,p,incremental=0): pass
    
    def updateSyntaxColorer (self,p): pass
    #@nonl
    #@-node:ekr.20050606213440.2:entry points
    #@-others
#@nonl
#@-node:ekr.20050606213440:class nullColorizer (colorizer)
#@-others
#@nonl
#@-node:ekr.20050529142847:@thin __jEdit_colorizer__.py
#@-leo
