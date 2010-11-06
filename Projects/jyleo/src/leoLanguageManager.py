#@+leo-ver=4-thin
#@+node:zorcanda!.20050924111205:@thin leoLanguageManager.py
import leoGlobals as g
import os
import org.xml.sax as sax
import javax.xml.parsers as jparse
import java
import java.util as util
import java.util.regex as jregex
import java.awt as awt
import java.io as io
import javax.swing.text as stext
import copy


leoKeywords = [
    "@","@all","@c","@code","@color","@comment",
    "@delims","@doc","@encoding","@end_raw",
    "@first","@header","@ignore",
    "@killcolor",
    "@language","@last","@lineending",
    "@nocolor","@noheader","@nowrap","@others",
    "@pagewidth","@path","@quiet","@raw","@root","@root-code","@root-doc",
    "@silent","@tabwidth","@terse",
    "@unit","@verbose","@wrap" ] 


class __LanguageBundle:
    def __init__( self ):
        for z in dir( LanguageManager ):
            if not callable( getattr( LanguageManager, z ) ):
                setattr( self , z,  getattr( LanguageManager, z ) )
        


language_in_effect = {}
class LanguageManager:
    
    initialised = 0
    languages_in_effect = {}
    #language_data = {}
    comment_cache = {}
    indenters = {}
    #_underline = None
    _undefinedSectionNameColor = None
    _sectionNameColor = None
    _stringColor = None
    _commentColor = None
    _docColor = None
    _invisibleBlock = None
    _invisibleDot = None
    _which_invisible = None
    _punctuationColor = None
    _drawrectangle = None
    _rectanglecolor = None
    _numericcolor = None
    
    def getLanguageBundle( clazz, c ):
        
        if not clazz.initialised:
            clazz.scanLanguageFiles( c )
            clazz.initialised = 1
                    
        return __LanguageBundle()
        
    getLanguageBundle = classmethod( getLanguageBundle )
    
    def scanLanguageFiles( clazz, c ):
        
        from leoSwingFrame import getColorInstance
        createAttributeSet = clazz.createAttributeSet
        config = g.app.config
        underline = config.getBool( c, "underline_undefined_section_names" )
        color = config.getColor( c, "undefined_section_name_color" )
        clazz._undefinedSectionNameColor = createAttributeSet( getColorInstance( color, awt.Color.RED ) )
        font = config.getFontFromParams( c, "undsectionnamefont_text_font_family", "undsectionnamefont_text_font_size", None, "undsectionnamefont_text_font_weight" )
        LanguageManager.setFont( clazz._undefinedSectionNameColor, font )
        if underline:
            stext.StyleConstants.setUnderline( clazz._undefinedSectionNameColor, True )
        color = config.getColor( c, "section_name_color" )
        clazz._sectionNameColor  = createAttributeSet( getColorInstance( color, awt.Color.RED ) )
        font = config.getFontFromParams( c, "sectionnamefont_text_font_family", "sectionnamefont_text_font_size", None, "sectionnamefont_text_font_weight" )
        LanguageManager.setFont( clazz._sectionNameColor, font )
        color = config.getColor( c, "string_color" )
        clazz._stringColor = createAttributeSet( getColorInstance( color, awt.Color.GREEN ) )
        font = config.getFontFromParams( c, "stringfont_text_font_family", "stringfont_text_font_size", None, "stringfont_text_font_weight" )
        LanguageManager.setFont( clazz._stringColor, font )
        color = config.getColor( c, "comment_color" )
        clazz._commentColor = createAttributeSet( getColorInstance( color, awt.Color.RED ) )
        font = config.getFontFromParams( c, "commentfont_text_font_family", "commentfont_text_font_size", None, "commentfont_text_font_weight" )
        LanguageManager.setFont( clazz._commentColor, font )
        color = config.getColor( c, "doc_part_color" )
        clazz._docColor = createAttributeSet( getColorInstance( color, awt.Color.RED ) )
        font = config.getFontFromParams( c, "docpartfont_text_font_family", "docpartfont_text_font_size", None, "docpartfont_text_font_weight" )
        LanguageManager.setFont( clazz._docColor, font )
        color = config.getColor( c, "invisibles_block_color" )
        clazz._invisibleBlock =  getColorInstance( color, awt.Color.YELLOW ) 
        color = config.getColor( c, "invisibles_dot_color" )
        clazz._invisibleDot =  getColorInstance( color, awt.Color.RED ) 
        clazz._which_invisible = config.getString( c, "invisibles_type" );
        clazz._which_invisible = g.choose( clazz._which_invisible == 'block', 1, 0 )
        color = config.getColor( c, "punctuation_color" )
        clazz._punctuationColor = createAttributeSet( getColorInstance( color, awt.Color.RED ) )
        clazz._drawrectangle = config.getBool( c, 'draw_rectangle' )
        color = config.getColor( c, "rectangle_color" )
        clazz._rectanglecolor = getColorInstance( color, awt.Color.YELLOW ) 
        #self._stringColor = awt.Color.GREEN
        color = config.getColor( c, "folded_foreground_color" )
        clazz._ffColor = getColorInstance( color, awt.Color.RED )
        color = config.getColor( c, "folded_background_color" )
        clazz._fbColor = getColorInstance( color, awt.Color.YELLOW )
        color = config.getColor( c, "footnode_background_color" )
        clazz._fnbgColor = getColorInstance( color, awt.Color.GRAY )
        color = config.getColor( c, "footnode_foreground_color" )
        clazz._fnfgColor = getColorInstance( color, awt.Color.BLACK )
        color = config.getColor( c, "numeric_color" )
        clazz._numericcolor = createAttributeSet( getColorInstance( color, awt.Color.RED ) )
        font = config.getFontFromParams( c, "numeric_text_font_family", "numeric_text_font_size", None, "numeric_text_font_weight" )
        LanguageManager.setFont( clazz._numericcolor, font )        
        clazz.plain_keywords = java.util.HashMap()
        clazz.plain_keywords2 = []
        return
        
        color = config.getColor( c, "directive_color" )
        drkgrn = java.lang.Integer.decode( "#299C39" )
        dir_color = createAttributeSet( getColorInstance( color, awt.Color( drkgrn ) ) )
        font = config.getFontFromParams( c, "directivefont_text_font_family", "directivefont_text_font_size", None, "directivefont_text_font_weight" )
        LanguageManager.setFont( dir_color, font )

            
        color = config.getColor( c, "keyword_color" )
        kw_color = createAttributeSet( getColorInstance( color, awt.Color.BLUE ) )
        
        color = config.getColor( c, "section_name_brackets_color" )
        snb_color = createAttributeSet( getColorInstance( color, awt.Color.BLUE ) )

        #font = config.getFontFromParams( c, "body_text_font_family", "body_text_font_size", None, "body_text_font_weight")
        color1 = config.getColor( c, "keyword_color1" )
        kw_color1 = createAttributeSet( getColorInstance( color1, awt.Color.BLUE ) )
        font = config.getFontFromParams( c, "keywordfont1_text_font_family", "keywordfont1_text_font_size", None, "keywordfont1_text_font_weight" )
        LanguageManager.setFont( kw_color1, font )
        color2 = config.getColor( c, "keyword_color2" )
        kw_color2 = createAttributeSet( getColorInstance( color2, awt.Color.ORANGE ) )
        font = config.getFontFromParams( c, "keyword2_text_font_family", "keyword2_text_font_size", None, "keyword2_text_font_weight" )
        LanguageManager.setFont( kw_color2, font )
        color3 = config.getColor( c, "keyword_color3" )
        kw_color3 = createAttributeSet( getColorInstance( color3, awt.Color.GREEN ) )
        font = config.getFontFromParams( c, "keyword3_text_font_family", "keyword3_text_font_size", None, "keyword3_text_font_weight" )
        LanguageManager.setFont( kw_color3, font )
        literal2 = config.getColor( c, "literal_color2" )
        literal_color2 = createAttributeSet( getColorInstance( literal2, awt.Color.YELLOW ) )
        font = config.getFontFromParams( c, "literal2_text_font_family", "literal2_text_font_size", None, "literal2_text_font_weight" )
        LanguageManager.setFont( literal_color2, font )
        function = config.getColor( c, "function_color" )
        function_color = createAttributeSet( getColorInstance( function, awt.Color.YELLOW ) )
        font = config.getFontFromParams( c, "function_text_font_family", "function_text_font_size", None, "function_text_font_weight" )
        LanguageManager.setFont( function_color, font )
        convention = config.getColor( c, "convention_color" )
        convention_color = createAttributeSet( getColorInstance( convention, awt.Color.CYAN ) )
        font = config.getFontFromParams( c, "convention_text_font_family", "convention_text_font_size", None, "convention_text_font_weight" )
        LanguageManager.setFont( convention_color, font )
        operator = config.getColor( c, "operator_color" )
        operator_color = createAttributeSet( getColorInstance( operator, awt.Color.BLACK ) )
        font = config.getFontFromParams( c, "operator_text_font_family", "operator_text_font_size", None, "operator_text_font_weight" )
        LanguageManager.setFont( operator_color, font )
        return
        path = os.path.join(g.app.loadDir,'../','modes')
        path = os.path.normpath(path)
        dbf = jparse.DocumentBuilderFactory.newInstance()
        dbf.setIgnoringComments( 1 )
        dbf.setValidating( 0 )
        #print dbf.isValidating()
        #dbf.setValidating( 0 )
        #print dbf.getSchema()
        #print dbf.isNamespaceAware()
        #print dbf.isExpandEntityReferences()
        #print dbf.isXIncludeAware()
        #dbf.setExpandEntityReferences( 0 )
        #java.lang.Thread.currentThread().sleep( 2000 )
        db = dbf.newDocumentBuilder()
        #print db.isValidating()
        #java.lang.Thread.currentThread().sleep( 2000 )
    
        
        m_directory = java.io.File( path )
        files = m_directory.listFiles()
        for z in files:
            if str(z).endswith( ".xml" ):
                try:
                    doc = db.parse( z )
                except java.lang.Exception, x:
                    print x
                    continue
                
                lname = z.getName()[ : -4 ]
                de = doc.getDocumentElement()
                cn = de.getChildNodes()
                kw1 = de.getElementsByTagName( "KEYWORD1" )
                kw2 = de.getElementsByTagName( "KEYWORD2" )
                kw3 = de.getElementsByTagName( "KEYWORD3" )
                func = de.getElementsByTagName( "FUNCTION" )
                lit = de.getElementsByTagName( "LITERAL2" )
                conv = de.getElementsByTagName( "CONVENTION" )
                seq = de.getElementsByTagName( "SEQ" )
                props = de.getElementsByTagName( "PROPERTY" )
                hm = util.HashMap()
                #clazz.language_data[ lname ] = hm
                
                lineComment = startComment = endComment = None
                for prop in xrange( props.length ):
                    property = props.item( prop )
                    name = property.getAttribute( "NAME" )
                    if name == "lineComment":
                        lineComment = property.getAttribute( "VALUE" )
                    elif name == "commentStart":
                        startComment = property.getAttribute( "VALUE" )
                    elif name == "commentEnd":
                        endComment = property.getAttribute( "VALUE" )
                    elif name == "indentNextLine":
                        value = property.getAttribute( "VALUE" )
                        pat = jregex.Pattern.compile( value )
                        clazz.indenters[ lname ] = pat.matcher( "" )
                clazz.comment_cache[ lname ] = [ lineComment, startComment, endComment ]
                
                #operators = util.HashMap()
                for y in xrange( seq.length ):
                    item = seq.item( y )
                    if item.getAttribute( "TYPE" ) == "OPERATOR":
                        #print item.getTextContent()
                        hm.put( item.getTextContent(), operator_color )
                #hm.put( "__operators", operators )
                        
                sname = z.getName()[ : -4 ] + "_keywords"
                sname2 = sname + "2"
                s2_list = []
                setattr( clazz, sname, hm )
                setattr( clazz, sname2, s2_list )
                color_data = ( ( kw1, kw_color1 ), (kw2, kw_color2 ), 
                               ( kw3, kw_color3 ), ( func, function_color ), 
                               ( lit, literal_color2 ), ( conv, convention_color ) )
                for y in color_data:
                    for yl in xrange( y[ 0 ].length ):
                        item = y[ 0 ].item( yl )
                        hm.put( item.getTextContent(), y[ 1 ] )
                        s2_list.append( item.getTextContent() )
                         
                for y in leoKeywords:
                    hm.put( y, dir_color )
                    
                hm.put( '<<', snb_color )
                hm.put( '>>', snb_color )
                
    scanLanguageFiles = classmethod( scanLanguageFiles )
    
    #@    <<loadLanguage>>
    #@+node:zorcanda!.20051102091531:<<loadLanguage>>
    def loadLanguage( clazz, c, language ):
        
        if hasattr( clazz, language ):
            return getattr( clazz, language )
        from leoSwingFrame import getColorInstance
        config = g.app.config
        createAttributeSet = clazz.createAttributeSet
        try:
            hm = java.util.HashMap()
            #settattr( clazz, language, hm )
            color = config.getColor( c, "directive_color" )
            drkgrn = java.lang.Integer.decode( "#299C39" )
            dir_color = createAttributeSet( getColorInstance( color, awt.Color( drkgrn ) ) )
            font = config.getFontFromParams( c, "directivefont_text_font_family", "directivefont_text_font_size", None, "directivefont_text_font_weight" )
            LanguageManager.setFont( dir_color, font )
                
            color = config.getColor( c, "keyword_color" )
            kw_color = createAttributeSet( getColorInstance( color, awt.Color.BLUE ) )
            
            color = config.getColor( c, "section_name_brackets_color" )
            snb_color = createAttributeSet( getColorInstance( color, awt.Color.BLUE ) )
    
            #font = config.getFontFromParams( c, "body_text_font_family", "body_text_font_size", None, "body_text_font_weight")
            color1 = config.getColor( c, "keyword_color1" )
            kw_color1 = createAttributeSet( getColorInstance( color1, awt.Color.BLUE ) )
            font = config.getFontFromParams( c, "keywordfont1_text_font_family", "keywordfont1_text_font_size", None, "keywordfont1_text_font_weight" )
            LanguageManager.setFont( kw_color1, font )
            color2 = config.getColor( c, "keyword_color2" )
            kw_color2 = createAttributeSet( getColorInstance( color2, awt.Color.ORANGE ) )
            font = config.getFontFromParams( c, "keyword2_text_font_family", "keyword2_text_font_size", None, "keyword2_text_font_weight" )
            LanguageManager.setFont( kw_color2, font )
            color3 = config.getColor( c, "keyword_color3" )
            kw_color3 = createAttributeSet( getColorInstance( color3, awt.Color.GREEN ) )
            font = config.getFontFromParams( c, "keyword3_text_font_family", "keyword3_text_font_size", None, "keyword3_text_font_weight" )
            LanguageManager.setFont( kw_color3, font )
            literal2 = config.getColor( c, "literal_color2" )
            literal_color2 = createAttributeSet( getColorInstance( literal2, awt.Color.YELLOW ) )
            font = config.getFontFromParams( c, "literal2_text_font_family", "literal2_text_font_size", None, "literal2_text_font_weight" )
            LanguageManager.setFont( literal_color2, font )
            function = config.getColor( c, "function_color" )
            function_color = createAttributeSet( getColorInstance( function, awt.Color.YELLOW ) )
            font = config.getFontFromParams( c, "function_text_font_family", "function_text_font_size", None, "function_text_font_weight" )
            LanguageManager.setFont( function_color, font )
            convention = config.getColor( c, "convention_color" )
            convention_color = createAttributeSet( getColorInstance( convention, awt.Color.CYAN ) )
            font = config.getFontFromParams( c, "convention_text_font_family", "convention_text_font_size", None, "convention_text_font_weight" )
            LanguageManager.setFont( convention_color, font )
            operator = config.getColor( c, "operator_color" )
            operator_color = createAttributeSet( getColorInstance( operator, awt.Color.BLACK ) )
            font = config.getFontFromParams( c, "operator_text_font_family", "operator_text_font_size", None, "operator_text_font_weight" )
            LanguageManager.setFont( operator_color, font )
        
            for y in leoKeywords:
                hm.put( y, dir_color )                    
            hm.put( '<<', snb_color )
            hm.put( '>>', snb_color )
    
        
        
            path = os.path.join(g.app.loadDir,'../','modes')
            path = os.path.normpath(path)
            dbf = jparse.DocumentBuilderFactory.newInstance()
            dbf.setIgnoringComments( 1 )
            dbf.setValidating( 0 )    
            m_directory = java.io.File( path )
            lfile = java.io.File( m_directory, "%s.xml" % language )
            if not lfile.exists(): return hm
            try:
                db = dbf.newDocumentBuilder()
                doc = db.parse( lfile )
            except java.lang.Exception, x:
                print x
                return hm
                  
            lname = language
            de = doc.getDocumentElement()
            cn = de.getChildNodes()
            kw1 = de.getElementsByTagName( "KEYWORD1" )
            kw2 = de.getElementsByTagName( "KEYWORD2" )
            kw3 = de.getElementsByTagName( "KEYWORD3" )
            func = de.getElementsByTagName( "FUNCTION" )
            lit = de.getElementsByTagName( "LITERAL2" )
            conv = de.getElementsByTagName( "CONVENTION" )
            seq = de.getElementsByTagName( "SEQ" )
            props = de.getElementsByTagName( "PROPERTY" )
            #clazz.language_data[ lname ] = hm 
            ltokens = []
            for lt in ( kw1, kw2, kw3, func ):
                for n in xrange( lt.length ):
                    item = lt.item( n )
                    ltokens.append( item.getTextContent() )
            setattr( clazz, "%s_tokens" % lname, ltokens )          
            lineComment = startComment = endComment = None
            for prop in xrange( props.length ):
                property = props.item( prop )
                name = property.getAttribute( "NAME" )
                if name == "lineComment":
                    lineComment = property.getAttribute( "VALUE" )
                elif name == "commentStart":
                    startComment = property.getAttribute( "VALUE" )
                elif name == "commentEnd":
                    endComment = property.getAttribute( "VALUE" )
                elif name == "indentNextLine":
                    value = property.getAttribute( "VALUE" )
                    pat = jregex.Pattern.compile( value )
                    clazz.indenters[ lname ] = pat.matcher( "" )
            
            clazz.comment_cache[ lname ] = [ lineComment, startComment, endComment ]
                    
            #operators = util.HashMap()
            for y in xrange( seq.length ):
                item = seq.item( y )
                if item.getAttribute( "TYPE" ) == "OPERATOR":
                    hm.put( item.getTextContent(), operator_color )                  
            sname = language + "_keywords"
            sname2 = sname + "2"
            s2_list = []
            color_data = ( ( kw1, kw_color1 ), (kw2, kw_color2 ), 
                        ( kw3, kw_color3 ), ( func, function_color ), 
                        ( lit, literal_color2 ), ( conv, convention_color ) )
            for y in color_data:
                for yl in xrange( y[ 0 ].length ):
                    item = y[ 0 ].item( yl )
                    hm.put( item.getTextContent(), y[ 1 ] )
                    s2_list.append( item.getTextContent() )
                             
        finally:
            setattr( clazz, language, hm )
            return hm
    
    
    loadLanguage = classmethod( loadLanguage )
    #@-node:zorcanda!.20051102091531:<<loadLanguage>>
    #@nl
    
    def createAttributeSet( color ):
        sas = stext.SimpleAttributeSet()
        stext.StyleConstants.setForeground( sas, color )
        return sas
    
    createAttributeSet = staticmethod( createAttributeSet )
    
    def setFont( sas, font ):
        
        stext.StyleConstants.setFontFamily( sas, font.getFamily() )
        stext.StyleConstants.setFontSize( sas, font.getSize() )
        if font.isBold():
            stext.StyleConstants.setBold( sas, True )
        if font.isItalic():
            stext.StyleConstants.setItalic( sas, True )
    
    setFont = staticmethod( setFont )
    
    def setLanguageInEffect( c, language ):
        language_in_effect[ c ] = language
        
    setLanguageInEffect = staticmethod( setLanguageInEffect )
    
    def getLanguageInEffect( c ):
        if language_in_effect.has_key( c ):
            return language_in_effect[ c ]
        return None
        
    getLanguageInEffect = staticmethod( getLanguageInEffect )
    
                  

#@-node:zorcanda!.20050924111205:@thin leoLanguageManager.py
#@-leo
