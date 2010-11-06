//@+leo-ver=4-thin
//@+node:orkman.20050215122424:@thin leoBaseAtFile.java
//@@language java

import java.util.*;
import java.io.*;
import static java.lang.System.out;
import static java.lang.String.format;  
import static java.lang.Math.*;

public abstract class leoBaseAtFile{           
private int loopcounter;
private StringBuilder _sb;
private String _language;
private boolean _sentinels;
private boolean _toString;
private boolean _raw;
private boolean _thinFile;
private boolean _fileChangedFlag;
private boolean _writeAtFileNodesFlag;
private boolean _writeDirtyAtFileNodesFlag;
private Boolean _explicitLineEnding;
private Boolean _inCode;
private Boolean _root_seen;

private String _targetFileName;  
private String _outputFileName;
private String _default_directory;
private String _startSentinelComment;
private String _endSentinelComment;
private String _leadingWs;
private String _encoding;
private String _stringOutput;
private String _shortFileName;
private Integer _docKind;
private Integer _docDirective;
private Integer _page_width;
private List< String > _pending;
private int _indent;
private Integer _tabWidth;
private int _errors;
private String _output_newline = "\n";
private OutputStream _outputStream;
private Object _outputFile;
private PositionSpecification _root;
private CommanderSpecification _c;

static final Map< String, String > language_delims_dict = new HashMap< String, String >();
static final Map< String, Integer > table = new HashMap< String, Integer >();
public final static int noDirective		   =  1;
public final static int allDirective    =  2;
public final static int docDirective	   =  3;
public final static int atDirective		   =  4;
public final static int codeDirective	  =  5;
public final static int cDirective		    =  6;
public final static int othersDirective	=  7;
public final static int miscDirective	  =  8;
public final static int rawDirective    =  9;
public final static int endRawDirective = 10;    

public final static String[] leoKeywords = {
    "@","@all","@c","@code","@color","@comment",
    "@delims","@doc","@encoding","@end_raw",
    "@first","@header","@ignore",
    "@killcolor",
    "@language","@last","@lineending",
    "@nocolor","@noheader","@nowrap","@others",
    "@pagewidth","@path","@quiet","@raw","@root","@root-code","@root-doc",
    "@silent","@tabwidth","@terse",
    "@unit","@verbose","@wrap" };


    /*public void setOutputFileX( String name ){  

        _sb = new StringBuilder();


    }*/




    /*public String getData(){


        return _sb.toString();

    }*/
    


    
    //@    @+others
    //@+node:orkman.20050218151637:properties
    //@+node:orkman.20050218151637.1:indent
    
    
    
        
        public void setIndent( final int i ){
        
            _indent = i;
        
        }
        
        public int getIndent(){
        
        
            return _indent;
        
        }
        
        public void setRaw( final boolean b ){
        
            _raw = b;
        
        }
        
        public boolean getRaw(){
        
        
            return _raw;
        
        }
        
        public void setThinFile( final boolean b ){
        
            _thinFile = b;
        
        }
        
        public boolean getThinFile(){
        
            return _thinFile;
        
        }
        
        public void setLeadingWs( final String s ){
        
            _leadingWs = s;
        
        }
        
        public String getLeadingWs(){
        
            return _leadingWs;
        
        }
        
        public void setEncoding( final String s ){
        
            _encoding = s;
        
        
        }
        
        public String getEncoding(){
        
        
            return _encoding;
        
        }
        
        public void setTab_width( final Integer w ){
        
            if( w == null )
                _tabWidth = 0;
            else
                _tabWidth = w;
        
        }
        
        public Integer getTab_width(){
        
            return _tabWidth;
        
        
        }
    //@nonl
    //@-node:orkman.20050218151637.1:indent
    //@+node:orkman.20050218151957:language
    public void setLanguage( final String s ){
        
        _language = s;
        
    }
        
    public String getLanguage(){ return _language; }
    //@nonl
    //@-node:orkman.20050218151957:language
    //@+node:orkman.20050218151957.1:sentinels and toString
    public final void setSentinels( final boolean sentinel ){
        
        _sentinels = sentinel;
        
        
    }
        
    public final boolean getSentinels(){
        
        return _sentinels;
        
    }
    
    
    public final void setToString( final boolean ts ){
        
        _toString = ts;
        
        
    }
        
    public final boolean getToString(){
        
        return _toString;
        
    }
    //@nonl
    //@-node:orkman.20050218151957.1:sentinels and toString
    //@+node:orkman.20050218151957.2:startSentinelComment
    public void setStartSentinelComment( final String s ){
        
        _startSentinelComment = s;
        
    }
        
    public String getStartSentinelComment(){
        
        return _startSentinelComment;
        
    }
    //@nonl
    //@-node:orkman.20050218151957.2:startSentinelComment
    //@+node:orkman.20050218151957.3:endSentinelComment
    public void setEndSentinelComment( final String s ){
        
        _endSentinelComment = s;
        
    }
        
    public String getEndSentinelComment(){
        
        return _endSentinelComment;
        
        }
    //@nonl
    //@-node:orkman.20050218151957.3:endSentinelComment
    //@+node:orkman.20050218163003:outputStream
    public void setOutputStream( OutputStream os ){
    
        _outputStream = os;
    
    
    }
    
    public OutputStream getOutputStream(){
    
    
        return _outputStream;
    
    
    }
    //@nonl
    //@-node:orkman.20050218163003:outputStream
    //@+node:orkman.20050218164946:output_newline
    public void setOutput_newline( final String s ){
    
        _output_newline = s;
    
    
    }
    
    public String getOutput_newline(){
    
    
        return _output_newline;
    
    }
    //@nonl
    //@-node:orkman.20050218164946:output_newline
    //@+node:orkman.20050218201105:targetFileName
    public final void setTargetFileName( final String name ){
    
        _targetFileName = name;
    
    
    }
    
    public String getTargetFileName(){
    
    
        return _targetFileName;
    
    
    }
    //@nonl
    //@-node:orkman.20050218201105:targetFileName
    //@+node:orkman.20050218203635:outputFileName
    public final void setOutputFileName( final String name ){
    
        _outputFileName = name;
    
    
    }
    
    public final String getOutputFileName(){
    
    
        return _outputFileName;
    
    
    }
    //@nonl
    //@-node:orkman.20050218203635:outputFileName
    //@+node:orkman.20050218202304:root
    public void setRoot( PositionSpecification root ){
    
        _root = root.copy();
    
    }
    
    
    public PositionSpecification getRoot(){
    
    
        return _root.copy();
    
    
    }
    //@nonl
    //@-node:orkman.20050218202304:root
    //@+node:orkman.20050218203745:errors
    public final int getErrors(){
    
        return _errors;
    
    }
    
    
    public final void setErrors( int err ){
    
    
        _errors = err;
    
    
    }
    //@nonl
    //@-node:orkman.20050218203745:errors
    //@+node:orkman.20050219193305:c
    public final void setC( final CommanderSpecification c ){
    
    
        _c = c;
    
    
    
    }
    
    
    public final CommanderSpecification getC(){
    
        return _c;
        
    
    }
    //@nonl
    //@-node:orkman.20050219193305:c
    //@+node:orkman.20050219193458:fileChangedFlag
    public final void setFileChangedFlag( final boolean changed ){
    
        _fileChangedFlag = changed;
    
    
    }
    
    public final boolean getFileChangedFlag(){
    
        return _fileChangedFlag;
    
    
    }
    //@nonl
    //@-node:orkman.20050219193458:fileChangedFlag
    //@+node:orkman.20050219193617:writeAtFileNodesFlag
    public final void setWriteAtFileNodesFlag( final boolean flag ){
    
    
        _writeAtFileNodesFlag = flag;
    
    }
    
    public final boolean getWriteAtFileNodesFlag(){
    
    
        return _writeAtFileNodesFlag;
    
    
    }
    //@nonl
    //@-node:orkman.20050219193617:writeAtFileNodesFlag
    //@+node:orkman.20050219193807:writeDirtyAtFileNodesFlag
    public final void setWriteDirtyAtFileNodesFlag( final boolean flag ){
    
    
        _writeDirtyAtFileNodesFlag = flag;
    
    
    }
    
    
    public final boolean getWriteDirtyAtFileNodesFlag(){
    
        return _writeDirtyAtFileNodesFlag;
    
    
    }
    //@nonl
    //@-node:orkman.20050219193807:writeDirtyAtFileNodesFlag
    //@+node:orkman.20050219195933:docKind and docDirective
    public final void setDocKind( final Integer kind ){
    
        _docKind = kind;
    
    
    }
    
    public final Integer getDocKind(){
    
        return _docKind;
    
    
    }
    
    public final void setDocDirective( final Integer directive ){
    
        _docDirective = directive;
    
    
    }
    
    public final Integer getDocDirective(){
    
        return _docDirective;
    
    
    }
    //@nonl
    //@-node:orkman.20050219195933:docKind and docDirective
    //@+node:orkman.20050220105833:pending
    public final void setPending( final List< String > pending ){
    
        //if( pending == null ) _pending = null;
        //else
        //    _pending = new ArrayList< String >();
        //    Collections.addAll( _pending, pending );
        _pending = pending;
    
    
    
    }
    
    
    public final List< String > getPending(){
    
    
        return  _pending;
    
    
    
    }
    //@nonl
    //@-node:orkman.20050220105833:pending
    //@+node:orkman.20050220120532:page_width
    public final void setPage_width( final Integer width ){
    
    
        _page_width = width;
    
    
    }
    
    
    public final Integer getPage_width(){
    
    
    
        return _page_width;
    
    
    
    }
    //@nonl
    //@-node:orkman.20050220120532:page_width
    //@+node:orkman.20050220151614:default_directory
    public final void setDefault_directory( final String dir ){
    
    
        _default_directory = dir;
    
    
    }
    
    
    public final String getDefault_directory(){
    
    
    
        return _default_directory;
    
    
    
    }
    //@nonl
    //@-node:orkman.20050220151614:default_directory
    //@+node:orkman.20050220154414:explictLineEnding
    public final void setExplicitLineEnding( final Boolean flag ){
    
    
        _explicitLineEnding = flag;
    
    
    }
    
    public final Boolean getExplicitLineEnding(){
    
    
        return _explicitLineEnding;
    
    
    }
    //@nonl
    //@-node:orkman.20050220154414:explictLineEnding
    //@+node:orkman.20050220172358:stringOutput
    public final void setStringOutput( final String data ){
    
        _stringOutput = data;
    
    
    }
    
    public final String getStringOutput(){
    
    
        return _stringOutput;
    
    
    }
    //@nonl
    //@-node:orkman.20050220172358:stringOutput
    //@+node:orkman.20050220172600:shortFileName
    public final void setShortFileName( final String name ){
    
        _shortFileName = name;
    
    
    }
    
    
    public final String getShortFileName(){
    
    
        return _shortFileName;
    
    
    }
    //@nonl
    //@-node:orkman.20050220172600:shortFileName
    //@+node:orkman.20050220172806:outputFile
    public final void setOutputFile( final Object of ){
    
        _outputFile = of;
    
    
    }
    
    public final Object getOutputFile(){
    
    
        return _outputFile;
    
    
    }
    //@nonl
    //@-node:orkman.20050220172806:outputFile
    //@+node:orkman.20050220175416:inCode
    public final void setInCode( final Boolean flag ){
    
    
        _inCode = flag;
    
    
    
    }
    
    public final Boolean getInCode(){
    
    
        return _inCode;
    
    
    }
    //@nonl
    //@-node:orkman.20050220175416:inCode
    //@+node:orkman.20050220175640:root_seen
    public final void setRoot_seen( final Boolean flag ){
    
    
        _root_seen = flag;
    
    
    }
    
    public final Boolean getRoot_seen(){
    
    
        return _root_seen;
    
    
    
    }
    //@nonl
    //@-node:orkman.20050220175640:root_seen
    //@-node:orkman.20050218151637:properties
    //@+node:orkman.20050218131632:data from app --language_delims_dict
    
    //static Map< String, String > language_delims_dict = new HashMap< String, String >();
    
    static{
    final Map< String, String > ldd = language_delims_dict;
    
    ldd.put("ada" , "--" );
    ldd.put( "actionscript" , "// /* */" ); ///#jason 2003-07-03
    ldd.put( "c" , "// /* */" ); // # C, C++ or objective C.
    ldd.put( "csharp" , "// /* */" ); //,	# C#
    ldd.put( "css" , "/* */" ); //, # 4/1/04
    ldd.put( "cweb" , "@q@ @>" ); //, # Use the "cweb hack"
    ldd.put( "elisp" , ";" );
    ldd.put( "forth" , "\\_ _(_ _)" ); //, # Use the "REM hack"
    ldd.put( "fortran" , "C" );
    ldd.put( "fortran90" , "!" );
    ldd.put( "html" , "<!-- -->" );
    ldd.put( "java" , "// /* */" );
    ldd.put( "latex" , "%" );
    ldd.put( "pascal" , "// { }" );
    ldd.put( "perl" , "#" );
    ldd.put( "perlpod" , "# __=pod__ __=cut__"); //, # 9/25/02: The perlpod hack.
    ldd.put( "php" , "//" ); //
    ldd.put( "plain" , "#" ); //, # We must pick something.
    ldd.put( "python" , "#" );
    ldd.put( "rapidq" , "'" );//, # fil 2004-march-11
    ldd.put( "rebol" , ";" ); //,  # jason 2003-07-03
    ldd.put( "shell" , "#" ); //,  # shell scripts
    ldd.put( "tcltk" , "#" );
    ldd.put( "unknown" , "#" );// # Set when @comment is seen.
    }
    //@+at
    // self.language_delims_dict = {
    //     "ada" : "--",
    //     "actionscript" : "// /* */", #jason 2003-07-03
    //     "c" : "// /* */", # C, C++ or objective C.
    //     "csharp" : "// /* */",	# C#
    //     "css" : "/* */", # 4/1/04
    //     "cweb" : "@q@ @>", # Use the "cweb hack"
    //     "elisp" : ";",
    //     "forth" : "\\_ _(_ _)", # Use the "REM hack"
    //     "fortran" : "C",
    //     "fortran90" : "!",
    //     "html" : "<!-- -->",
    //     "java" : "// /* */",
    //     "latex" : "%",
    //     "pascal" : "// { }",
    //     "perl" : "#",
    //     "perlpod" : "# __=pod__ __=cut__", # 9/25/02: The perlpod hack.
    //     "php" : "//",
    //     "plain" : "#", # We must pick something.
    //     "python" : "#",
    //     "rapidq" : "'", # fil 2004-march-11
    //     "rebol" : ";",  # jason 2003-07-03
    //     "shell" : "#",  # shell scripts
    //     "tcltk" : "#",
    //     "unknown" : "#" } # Set when @comment is seen.
    //@-at
    //@nonl
    //@-node:orkman.20050218131632:data from app --language_delims_dict
    //@+node:orkman.20050219184107:table Map initialization
    static{
        //Map< String, Integer > table = new HashMap< String, Integer >();
        table.put( "@all", allDirective );
        table.put( "@c", cDirective );
        table.put( "@code", codeDirective );
        table.put( "@doc", docDirective );
        table.put( "@end_raw", endRawDirective );
        table.put( "@others", othersDirective );
        table.put( "@raw", rawDirective );
        
    }
    //@nonl
    //@-node:orkman.20050219184107:table Map initialization
    //@+node:orkman.20050215170549:abstracts
    //public abstract void onl();
    //public abstract void putIndent( int indent );
    //public abstract void os( String s );
    //public abstract void putEndDocLine();
    //public abstract void putDocLine( String s, int i );
    public abstract void putStartDocLine( String s, int i, int kind );
    //public abstract int putDirective( String s, int i ); //let this one be a lesson, understande the return types!
    public abstract void putAtAllLine( String s, int i, PositionSpecification p );
    //public abstract void putAtOthersLine( String s, int i, PositionSpecification p );
    public abstract void writeError( String s );
    public abstract void putInitialComment();
    public abstract void putOpenNodeSentinel( PositionSpecification p,boolean inAtAll, boolean inAtOthers, boolean middle );// inAtAll=False,inAtOthers=False,middle=False) );
    //def putCloseNodeSentinel(self,p,inAtAll=False,inAtOthers=False,middle=False):
    public abstract void putCloseNodeSentinel( PositionSpecification p, boolean inAtAll, boolean inAtOthers, boolean middle );
    public abstract int[] scanForClonedSibs( Object v );
    public abstract void closeWriteFile();
    public abstract boolean replaceTargetFileIfDifferent();
    public abstract boolean openFileForWriting( PositionSpecification root, String fileName, boolean toString );
    //def putAfterLastRef (self,s,start,delta):
    //public abstract void putAfterLastRef( String s, int start, int delta );
    //def putAfterMiddleRef (self,s,start,end,delta):
    //public abstract void putAfterMiddleRef( String s, int start, int end, int delta );
    //def initWriteIvars(self,root,targetFileName,nosentinels=False,thinFile=False,scriptWrite=False,toString=False):
    //public abstract void initWriteIvars( PositionSpecification root, String targetFileName, boolean nosentinels, boolean thinFile, boolean scriptWrite, boolean toString );
    public abstract void exception( String message );
    public abstract void error( String error );
    public abstract void writeException();
    public abstract void writeException( PositionSpecification root );
    public abstract void asisWrite( PositionSpecification root, boolean toString );
    public abstract void norefWrite( PositionSpecification root, boolean toString );
    public abstract void warnAboutOrphandAndIgnoredNodes();
    //public abstract void putPending( boolean split );
    //public abstract void initCommonIvars();
    //@nonl
    //@-node:orkman.20050215170549:abstracts
    //@+node:orkman.20050215183234:isSectionName
    public final Object[] isSectionName( final String s, final int i ){
    
        final Object[] rvalues = new Object[]{ false, -1 };
        if( ! match( s, i, "<<" ) ) return rvalues;
            
        final int j = find_on_line( s, i , ">>" );
        if( j != -1 ){
        
            rvalues[ 0 ] = true; rvalues[ 1 ] = i + 2;
            return rvalues;
        
        }
        else return rvalues;
    }
    
    
    
    public final Object[] findSectionName( String s, final int i ){
    
        final int end = s.indexOf( '\n', i );
        final int n1;
        final int n2;
        if( end == -1 ){
        
            n1 = s.indexOf( "<<", i );
            n2 = s.indexOf( ">>", i );
        
        
        }
        else{
        
            s = s.substring( 0, end );
            n1 = s.indexOf( "<<", i );
            n2 = s.indexOf( ">>", i );
    
        
        
        }
    
        final boolean b = ( -1 < n1 ) &&  ( n1 < n2 );
        return new Object[]{ b, n1, n2 };
    
    }
    //@+at
    // def findSectionName(self,s,i):
    //     end = s.find('\n',i)
    //     if end == -1:
    //         n1 = s.find("<<",i)
    //         n2 = s.find(">>",i)
    //     else:
    //         n1 = s.find("<<",i,end)
    //         n2 = s.find(">>",i,end)
    // 
    //     return -1 < n1 < n2, n1, n2
    // 
    //@-at
    //@+at
    // # returns (flag, end). end is the index of the character after the 
    // section name.
    // 
    // def isSectionName(self,s,i):
    // 
    //     if not g.match(s,i,"<<"):
    //         return False, -1
    //     i = g.find_on_line(s,i,">>")
    //     if i:
    //         return True, i + 2
    //     else:
    //         return False, -1
    //@-at
    //@nonl
    //@-node:orkman.20050215183234:isSectionName
    //@+node:orkman.20050215132206:directiveKind4
    public final int directiveKind4( final String s, final int i ){
    
        final int ri = i;
    
        /*if( i < 0 ){
        
            ri = s.length() + i;
        
        
        }
        else
            ri = i; */
        try{
        final int n = s.length();
        if( ri >= n || s.charAt( ri ) != '@' ){
        
            final int j = skip_ws( s, ri );
            if( match_word( s, j, "@others" ) )
                return othersDirective;
            else if( match_word( s, j, "@all" ) )
                return allDirective;
            else
                return noDirective;
        
        
        
        }
    
        final String partial_s = s.substring( ri );
        if( ri + 1 > n || partial_s.startsWith( "@ " ) || partial_s.startsWith( "@\t" ) || partial_s.startsWith( "@\n" ) ){
            return _language.equals( "cweb" )? noDirective: atDirective;
        
        }
        
        if( _language != null && _language.equals( "cweb" ) && ( match_word( s, ri, "@c" ) || ri+1 >=n || ! Character.isLetter( s.charAt( ri + 1 ) ) ) )
            return noDirective;
            
            
    
        
        /*Map< String, Integer > table = new HashMap< String, Integer >();
        table.put( "@all", allDirective );
        table.put( "@c", cDirective );
        table.put( "@code", codeDirective );
        table.put( "@doc", docDirective );
        table.put( "@end_raw", endRawDirective );
        table.put( "@others", othersDirective );
        table.put( "@raw", rawDirective );*/ 
    
        for( String name: table.keySet() ){
            if( match_word( s, ri,  name ) ) return table.get( name );
        
        
        }
    
        for( String name: leoKeywords ){
            if( match_word( s, ri, name ) ) return miscDirective;
        
        }
    
        return noDirective;
        }
        catch( Exception x ){ x.printStackTrace(); }
        
        return 0;
    
    
    }
    
    
    //@+at
    // 
    // def directiveKind4(self,s,i):
    //     """Return the kind of at-directive or noDirective."""
    // 
    //     at = self
    //     n = len(s)
    //     if i >= n or s[i] != '@':
    //         j = g.skip_ws(s,i)
    //         if g.match_word(s,j,"@others"):
    //             return at.othersDirective
    //         elif g.match_word(s,j,"@all"):
    //             return at.allDirective
    //         else:
    //             return at.noDirective
    // 
    //     table = (
    //         ("@all",at.allDirective),
    //         ("@c",at.cDirective),
    //         ("@code",at.codeDirective),
    //         ("@doc",at.docDirective),
    //         ("@end_raw",at.endRawDirective),
    //         ("@others",at.othersDirective),
    //         ("@raw",at.rawDirective))
    // 
    //     # This code rarely gets executed, so simple code suffices.
    //     if i+1 >= n or g.match(s,i,"@ ") or g.match(s,i,"@\t") or 
    // g.match(s,i,"@\n"):
    //         # 10/25/02: @space is not recognized in cweb mode.
    //         # Noweb doc parts are _never_ scanned in cweb mode.
    //         return g.choose(at.language=="cweb",
    //             at.noDirective,at.atDirective)
    // 
    //     # @c and @(nonalpha) are not recognized in cweb mode.
    //     # We treat @(nonalpha) separately because @ is in the colorizer 
    // table.
    //     if at.language=="cweb" and (
    //         g.match_word(s,i,"@c") or
    //         i+1>= n or s[i+1] not in string.ascii_letters):
    //         return at.noDirective
    // 
    //     for name,directive in table:
    //         if g.match_word(s,i,name):
    //             return directive
    // 
    //     # Return miscDirective only for real directives.
    //     for name in leoColor.leoKeywords:
    //         if g.match_word(s,i,name):
    //             return at.miscDirective
    // 
    //     return at.noDirective
    //@-at
    //@nonl
    //@-node:orkman.20050215132206:directiveKind4
    //@+node:orkman.20050215143101:utilities
    private final int skip_ws( final String s, final int i ){
    
        final char[] cs = s.toCharArray();
        int ri = i;
        for( ; ri < cs.length; ri ++ )
            if( cs[ ri ] == '\t' || cs[ ri ] == ' ' )
                continue;
            else
                break;
        return ri;
        
    
    
    }
    
    public final int skip_line( final String s, final int i ){
    
        final int where = s.indexOf( '\n', i );
        if( where == -1 ) return s.length();
        else
            return where + 1;
    
    
    }
    
    //@+at
    // def skip_line (s,i):
    // 
    //     i = string.find(s,'\n',i)
    //     if i == -1: return len(s)
    //     else: return i + 1
    //@-at
    //@@c
    
    private final boolean match( final String s, final int i, final String pattern ){
    
        final int plength = pattern.length();
        if ( i + plength > s.length() ) return false;
        
        final String sub = s.substring( i, i + plength );
        return sub.equals( pattern );
    
    
    }
    
    //@+at
    // def match(s,i,pattern):
    //     #print 'pattern is: %s' % pattern
    //     #s2 = s[ i: i + len( pattern ) ]
    //     #print '%s , %s, %s, %s, %s' %( pattern, s2, s2 == pattern , len( 
    // s2 ), len( pattern ))
    //     #print s[ i: i + len( pattern ) ] == s
    //     #print jsys.currentTimeMillis()
    //     return s and pattern and s[ i: i + len( pattern ) ] == pattern
    //@-at
    //@@c
    
    private final boolean match_word( final String s, int i, final String pattern ){
    
        if( pattern == null ) return false;
        final int j = pattern.length();
        //final int slen = s.length();
        //final int ij = i + j;
        //if( i + j >= s.length() ) return true;
        //if( i + j >= s.length() ) return true;
        if( j == 0 ) return false;
        if( s.substring( i ).startsWith( pattern ) ) return true;
        else
            return false;
        //if( slen < ij )
        //    if( ! s.substring( i ).equals( pattern ) ) return false;
        //else
        //    if( !s.substring( i, ij ).equals( pattern ) ) return false;
        //if( ij >= slen ) return true;
        //final char c = s.charAt( i + j );
        //return !( Character.isLetterOrDigit( c ) || c ==  '_' );
    
    
    }
    
    //@+at
    // def match_word(s,i,pattern):
    // 
    //     if pattern == None: return False
    //     j = len(pattern)
    //     if j == 0: return False
    //     if s[ i: i + j ] != pattern:
    //         return False
    //     #if string.find(s,pattern,i,i+j) != i:
    //     #    return False
    //     if i+j >= len(s):
    //         return True
    //     c = s[i+j]
    //     return not( c.isalnum() or c == '_' )
    //     #return not (c in string.ascii_letters or c in string.digits or c 
    // == '_')
    // def find_on_line(s,i,pattern):
    // 
    //     # j = g.skip_line(s,i) ; g.trace(s[i:j])
    //     j = string.find(s,'\n',i)
    //     if j == -1: j = len(s)
    //     k = string.find(s,pattern,i,j)
    //     if k > -1: return k
    //     else: return None
    //@-at
    //@@c
    
    public int find_on_line( final String s, final int i, final String pattern ){
    
    
        int nw = s.substring( i ).indexOf( '\n' );
        if( nw == -1 ) nw = s.length();
        final int k = s.substring( i, nw ).indexOf( pattern );
        return k;
    
    
    
    
    }
    
    //@+at
    // def skip_to_end_of_line (s,i):
    // 
    //     i = string.find(s,'\n',i)
    //     if i == -1: return len(s)
    //     else: return i
    //@-at
    //@@c
    public int skip_to_end_of_line( final String s, int i ){
    
        i = s.indexOf( '\n', i );
        if( i == -1 ) return s.length();
        else return i;
    
    
    
    }
    
    //@+at
    // def skip_c_id(s,i):
    // 
    //     n = len(s)
    //     while i < n:
    //         c = s[i]
    //         if c in string.ascii_letters or c in string.digits or c == '_':
    //             i += 1
    //         else: break
    //     return i
    //@-at
    //@@c
    
    public int skip_c_id( final String s, int i ){
    
        final int n = s.length();
        while( i < n ){
        
            final char c = s.charAt( i );
            if( Character.isLetterOrDigit( c ) || c == '_' ) i += 1;
            else break;
        
        
        }
    
        return i;
    
    }
    
    //@+others
    //@+node:orkman.20050218124629:set_delims_from_string
    public String[] set_delims_from_string( final String s ){
    
        final String tag = "@comment";
        int i = 0;
        if( match_word( s, i, tag ) )
            i += tag.length();
        
        int count = 0;
        final String[] delims = new String[ 3 ];
        
        while( count < 3 && i < s.length() ){
        
            int j = i = skip_ws( s, i );
            while( i < s.length() && !is_ws( s.charAt( i ) ) && !is_nl( s, i ) )
                 i += 1;
            if( j == i ) break;
            delims[ count ] = s.substring( j, i );
            count++;
        
        }
        
        if( count == 2 ){
            delims[2] = delims[1];
            delims[1] = delims[0];
            delims[0] = null;
        
        
        }
    
        for( int x = 0; x < 3; x ++ ){
        
            if( delims[ x ] != null ){
            
                //delims[i] = string.replace(delims[i],"__",'\n') 
                //delims[i] = string.replace(delims[i],'_',' ')
                delims[ x ] =  delims[ x ].replace( "__", "\n" );
                delims[ x ] =  delims[ x ].replace( "_", " " );
            
            }
        
        
        
        }
        return delims;
    
    }
    
    //@+at
    // def set_delims_from_string(s):
    // 
    //     """Returns (delim1, delim2, delim2), the delims following the 
    // @comment directive.
    //     This code can be called from @languge logic, in which case s can 
    // point at @comment"""
    // 
    //     # Skip an optional @comment
    //     tag = "@comment"
    //     i = 0
    //     if g.match_word(s,i,tag):
    //         i += len(tag)
    //     count = 0 ; delims = [None, None, None]
    //     while count < 3 and i < len(s):
    //         i = j = g.skip_ws(s,i)
    //         while i < len(s) and not g.is_ws(s[i]) and not g.is_nl(s,i):
    //             i += 1
    //         if j == i: break
    //         delims[count] = s[j:i]
    //         count += 1
    //     # 'rr 09/25/02
    //     if count == 2: # delims[0] is always the single-line delim.
    //         delims[2] = delims[1]
    //         delims[1] = delims[0]
    //         delims[0] = None
    // 
    //     # 7/8/02: The "REM hack": replace underscores by blanks.
    //     # 9/25/02: The "perlpod hack": replace double underscores by 
    // newlines.
    //     for i in xrange(0,3):
    //         if delims[i]:
    //             delims[i] = string.replace(delims[i],"__",'\n')
    //             delims[i] = string.replace(delims[i],'_',' ')
    // 
    //     return delims[0], delims[1], delims[2]
    //@-at
    //@-node:orkman.20050218124629:set_delims_from_string
    //@+node:orkman.20050218130745:set_delims_from_language
    
    
    public String[] set_delims_from_language( final String language ){
    
        final String val = leoBaseAtFile.language_delims_dict.get( language );
        if( val != null ){
            final String[] delims = set_delims_from_string( val );
            if( delims[ 1 ] != null && delims[ 2 ] == null )
                return new String[]{ null, delims[ 0 ], delims[ 1 ] };
            else
                return delims;
        
        
        }
        else
            return new String[ 3 ];
    
    }
    
    //@+at
    // # Returns a tuple (single,start,end) of comment delims
    // 
    // def set_delims_from_language(language):
    // 
    //     val = app.language_delims_dict.get(language)
    //     if val:
    //         delim1,delim2,delim3 = g.set_delims_from_string(val)
    //         if delim2 and not delim3:
    //             return None,delim1,delim2
    //         else: # 0,1 or 3 params.
    //             return delim1,delim2,delim3
    //     else:
    //         return None, None, None # Indicate that no change should be 
    // made
    // 
    //@-at
    //@-node:orkman.20050218130745:set_delims_from_language
    //@+node:orkman.20050218134552:is_nl is_ws
    //@+at
    // def is_ws(c):
    // 
    //     return c == '\t' or c == ' '
    //@-at
    //@@c
    
    public boolean is_ws( final char c ){
    
    
        return c == '\t' || c == ' ';
    
    
    }
    
    //@+at
    // def is_nl(s,i):
    // 
    //     return i < len(s) and (s[i] == '\n' or s[i] == '\r')
    //@-at
    //@@c
    
    public boolean is_nl( final String s, final int i ){
    
        //return i < s.length() && ( s.indexOf( i ) == '\n' || s.indexOf( i ) == '\r' );
        return i < s.length() && ( s.charAt( i ) == '\n' || s.charAt( i ) == '\r' );
    
    
    }
    
    
    //@+at
    // def skip_nl (s,i):
    // 
    //     """Skips a single "logical" end-of-line character."""
    // 
    //     if g.match(s,i,"\r\n"): return i + 2
    //     elif g.match(s,i,'\n') or g.match(s,i,'\r'): return i + 1
    //     else: return i
    //@-at
    //@@c
    
    public int skip_nl( final String s, final int i ){
    
        if( match( s, i, "\r\n" ) ) return i + 2;
        else if ( match( s, i, "\n" ) || match( s, i, "\r" ) ) return i + 1;
        else return i;
    
    
    }
    //@nonl
    //@-node:orkman.20050218134552:is_nl is_ws
    //@+node:orkman.20050218155820:skip_leading_ws_with_indent
    public int[] skip_leading_ws_with_indent( final String s, int i, final int tab_width ){
    
        int count = 0; final int n = s.length();
        while( i < n ){
        
            final char ch = s.charAt( i );
            if( ch == ' ' ){
            
                count += 1;
                i += 1;
            
            }
            else if( ch == '\t' ){
            
                count += (abs(tab_width ) - ( count % abs( tab_width ) ) );
                i += 1;
            
            
            }
            else break;
        
        
        
        }
        return new int[]{ i, count };
    
    
    }
    
    
    
    //@+at
    // def skip_leading_ws_with_indent(s,i,tab_width):
    // 
    //     """Skips leading whitespace and returns (i, indent),
    //     - i points after the whitespace
    //     - indent is the width of the whitespace, assuming tab_width wide 
    // tabs."""
    // 
    //     count = 0 ; n = len(s)
    //     while i < n:
    //         ch = s[i]
    //         if ch == ' ':
    //             count += 1
    //             i += 1
    //         elif ch == '\t':
    //             count += (abs(tab_width) - (count % abs(tab_width)))
    //             i += 1
    //         else: break
    // 
    //     return i, count
    //@-at
    //@nonl
    //@-node:orkman.20050218155820:skip_leading_ws_with_indent
    //@-others
    //@-node:orkman.20050215143101:utilities
    //@+node:orkman.20050215170438:writing
    //@+others
    //@+node:orkman.20050215141201:putRefLine & allies
    //@+node:orkman.20050215141201.1:putRefLine
    //public abstract void putRefLine( String s, int i, int n1, int n2, Object p );
    
    public final void putRefLine( final String s, int i, int n1, int n2, final PositionSpecification p ){
    
    
        final Integer delta = putRefAt( s, i, n1, n2, p, null );
        if( delta == null ) return;
        
        while( true ){
        
            i = n2 + 2;
            final Object[] data = findSectionName( s, i );
            boolean hasRef = (Boolean)data[ 0 ]; n1 = (Integer)data[ 1 ]; n2 = (Integer)data[ 2 ];
            if( hasRef ){
        
                putAfterMiddleRef( s, i, n1, delta );
                putRefAt( s, n1, n1, n2, p, delta );
            
            }
            else break;
        
        
        }
        
        putAfterLastRef( s, i, delta );
    
    
    }
    //@+at
    // def putRefLine(self,s,i,n1,n2,p):
    //     """Put a line containing one or more references."""
    //     at = self
    //     # Compute delta only once.
    //     #print 'ref0'
    //     delta = self.putRefAt(s,i,n1,n2,p,delta=None)
    //     #print 'ref01'
    //     if delta is None: return # 11/23/03
    //     while 1:
    //         #print 'refing1'
    //         i = n2 + 2
    //         hasRef,n1,n2 = at.findSectionName(s,i)
    //         if hasRef:
    //             self.putAfterMiddleRef(s,i,n1,delta)
    //             self.putRefAt(s,n1,n1,n2,p,delta)
    //         else:
    //             break
    //     #print 'refing2'
    //     self.putAfterLastRef(s,i,delta)
    //@-at
    //@-node:orkman.20050215141201.1:putRefLine
    //@+node:orkman.20050215141201.2:putRefAt
    public abstract Integer putRefAt( String s, int i, int n1, int n2, Object p, Integer delta );
    //@+at
    // def putRefAt (self,s,i,n1,n2,p,delta):
    //     """Put a reference at s[n1:n2+2] from p."""
    //     at = self ; name = s[n1:n2+2]
    //     #print 'putRefAt1'
    //     ref = g.findReference(name,p)
    //     #print 'putRefAt2'
    //     if not ref:
    //         at.writeError(
    //             "undefined section: %s\n\treferenced from: %s" %
    //                 ( name,p.headString()))
    //         return None
    //     # Expand the ref.
    //     if not delta:
    //         junk,delta = g.skip_leading_ws_with_indent(s,i,at.tab_width)
    // 
    //     at.putLeadInSentinel(s,i,n1,delta)
    //     inBetween = []
    //     if at.thinFile: # @+-middle used only in thin files.
    //         parent = ref.parent()
    //         while not parent == p: #changed from: parent != p
    //             inBetween.append(parent)
    //             parent = parent.parent()
    //     at.indent += delta
    //     if at.leadingWs:
    //         at.putSentinel("@" + at.leadingWs + name)
    //     else:
    //         at.putSentinel("@" + name)
    //     if inBetween:
    //         # Bug fix: reverse the +middle sentinels, not the -middle 
    // sentinels.
    //         inBetween.reverse()
    //         for p2 in inBetween:
    //             at.putOpenNodeSentinel(p2,middle=True)
    //     at.putOpenNodeSentinel(ref)
    //     at.putBody(ref)
    //     at.putCloseNodeSentinel(ref)
    //     if inBetween:
    //         inBetween.reverse()
    //         for p2 in inBetween:
    //             at.putCloseNodeSentinel(p2,middle=True)
    //     at.indent -= delta
    //     return delta
    //@-at
    //@nonl
    //@-node:orkman.20050215141201.2:putRefAt
    //@+node:orkman.20050215141201.3:putAfterLastRef
    public final void putAfterLastRef( final String s,final int start, final int delta ){
    
    
        final int j = skip_ws( s, start );
        if( j < s.length() && s.charAt( j ) != '\n' ){
        
            final int end = skip_line( s, start );
            final String after = s.substring( start, end );
            _indent += delta;
            putSentinel( "@afterref" );
            os( after );
            if( _sentinels && !after.equals( "" ) && after.charAt( after.length() - 1 ) != '\n' )
                onl();
            _indent -= delta;
        
        
        }
        else{
        
            _indent += delta;
            putSentinel( "@nl" );
            _indent -= delta;
        
        
        
        }
    
    
    
    }
    
    //@+at
    // def putAfterLastRef (self,s,start,delta):
    //     """Handle whatever follows the last ref of a line."""
    //     at = self
    //     j = g.skip_ws(s,start)
    //     if j < len(s) and s[j] != '\n':
    //         end = g.skip_line(s,start)
    //         after = s[start:end] # Ends with a newline only if the line 
    // did.
    //         # Temporarily readjust delta to make @afterref look better.
    //         at.indent += delta
    //         at.putSentinel("@afterref")
    //         at.os(after)
    //         if at.sentinels and after and after[-1] != '\n':
    //             at.onl() # Add a newline if the line didn't end with one.
    //         at.indent -= delta
    //     else:
    //         # Temporarily readjust delta to make @nl look better.
    //         at.indent += delta
    //         at.putSentinel("@nl")
    //         at.indent -= delta
    //@-at
    //@nonl
    //@-node:orkman.20050215141201.3:putAfterLastRef
    //@+node:orkman.20050215141201.4:putAfterMiddleef
    public final void putAfterMiddleRef( final String s, final int start, final int end, final int delta ){
    
    
        if( start < end ){
        
            final String after = s.substring( start, end );
            _indent += delta;
            putSentinel( "@afterref" );
            os( after );
            putSentinel( "@nonl" );
            _indent -= delta;
        
        
        
        
        }
    
    
    
    }
    
    //@+at
    // def putAfterMiddleRef (self,s,start,end,delta):
    //     """Handle whatever follows a ref that is not the last ref of a 
    // line."""
    //     at = self
    //     if start < end:
    //         after = s[start:end]
    //         at.indent += delta
    //         at.putSentinel("@afterref")
    //         at.os(after) ; at.onl_sent() # Not a real newline.
    //         at.putSentinel("@nonl")
    //         at.indent -= delta
    //@-at
    //@nonl
    //@-node:orkman.20050215141201.4:putAfterMiddleef
    //@-node:orkman.20050215141201:putRefLine & allies
    //@+node:orkman.20050219184612:writeAll
    public boolean writeAll( boolean writeAtFileNodesFlag, boolean writeDirtyAtFileNodesFlag, boolean toString ){
        final List<Object> writtenFiles = new ArrayList<Object>();
        final CommanderSpecification c = _c;
        boolean mustAutoSave = false;
        try{
        PositionSpecification p;
        PositionSpecification after;
        if( _writeAtFileNodesFlag ){
        
            p = c.currentPosition();
            after = p.nodeAfterTree();
        
        
        }
        else{
        
            p = c.rootPosition();
            after = c.nullPosition();
        
        
        
        }
    //@+at
    // def 
    // writeAll(self,writeAtFileNodesFlag=False,writeDirtyAtFileNodesFlag=False,toString=False):
    //     """Write @file nodes in all or part of the outline"""
    // 
    //     at = self ; c = at.c
    //     writtenFiles = [] # Files that might be written again.
    //     mustAutoSave = False
    //     #print 'in Writing All'
    //     if writeAtFileNodesFlag:
    //         # Write all nodes in the selected tree.
    //         p = c.currentPosition()
    //         after = p.nodeAfterTree()
    //     else:
    //         # Write dirty nodes in the entire outline.
    //         p =  c.rootPosition()
    //         after = c.nullPosition()
    //@-at
    //@@c
        //@    << Clear all orphan bits >>
        //@+node:orkman.20050219184612.1:<< Clear all orphan bits >>
        //@+at 
        //@nonl
        // We must clear these bits because they may have been set on a 
        // previous write.
        // Calls to atFile::write may set the orphan bits in @file nodes.
        // If so, write_Leo_file will write the entire @file tree.
        //@-at
        //@@c
        //@+at    
        // for v2 in p.self_and_subtree_iter():
        //     v2.clearOrphan()
        //@-at
        //@@c
        final Iterator<PositionSpecification> ssi = p.getSelfAndSubtreeIterator();
        while( ssi.hasNext() ){
        
            final PositionSpecification next = ssi.next();
            next.clearOrphan();
        
        
        
        }
        //@nonl
        //@-node:orkman.20050219184612.1:<< Clear all orphan bits >>
        //@nl
    //@+at
    //     while p and not p == after: #changed from:  p != after
    //         #print p.v.t.headString
    //         if p.isAnyAtFileNode() or p.isAtIgnoreNode():
    //@-at
    //@@c
        while( p.isValid() && ! p.equal( after ) ){
    
            if( p.isAnyAtFileNode() || p.isAtIgnoreNode() ){
                //@            << handle v's tree >>
                //@+node:orkman.20050219184612.2:<< handle v's tree >>
                if( p.isDirty() || _writeAtFileNodesFlag || writtenFiles.contains( p.get_T() ) ){
                
                
                    _fileChangedFlag = false;
                    boolean autoSave = false;
                    if( p.isAtAsisFileNode() ){
                    
                        asisWrite( p, toString );
                        writtenFiles.add( p.get_T() );
                        autoSave = true;
                    
                    }
                    else if( p.isAtIgnoreNode() );
                    else if( p.isAtNorefFileNode() ){
                    
                        norefWrite( p, toString );
                        writtenFiles.add( p.get_T() );
                        autoSave = true;
                    
                    }
                    else if(  p.isAtNoSentFileNode() ){
                    
                        write( p, true, false, false, toString );
                        writtenFiles.add( p.get_T() );
                    
                    }
                    else if( p.isAtThinFileNode() ){
                    
                        write( p, false, true, false, toString );
                        writtenFiles.add( p.get_T() );
                    
                    
                    }
                    else if( p.isAtFileNode() ){
                    
                        write( p, false, false, false, toString );
                        writtenFiles.add( p.get_T() );
                        autoSave = true;
                    }
                
                    if( _fileChangedFlag && autoSave ) mustAutoSave = true;
                
                }
                
                
                //@+at
                // if p.v.isDirty() or writeAtFileNodesFlag or p.v.t in 
                // writtenFiles:
                // 
                //     at.fileChangedFlag = False
                //     autoSave = False
                //     #print 'writing p: %s' % p.v.t.headString
                //     # Tricky: @ignore not recognised in @silentfile nodes.
                //     if p.isAtAsisFileNode():
                //         at.asisWrite(p,toString=toString)
                //         writtenFiles.append(p.v.t) ; autoSave = True
                //     elif p.isAtIgnoreNode():
                //         pass
                //     elif p.isAtNorefFileNode():
                //         at.norefWrite(p,toString=toString)
                //         writtenFiles.append(p.v.t) ; autoSave = True
                //     elif p.isAtNoSentFileNode():
                //         at.write(p,nosentinels=True,toString=toString)
                //         writtenFiles.append(p.v.t) # No need for autosave
                //     elif p.isAtThinFileNode():
                //         #print 'at Thin'
                //         at.write(p,thinFile=True,toString=toString)
                //         writtenFiles.append(p.v.t) # No need for autosave.
                //     elif p.isAtFileNode():
                //         at.write(p,toString=toString)
                //         writtenFiles.append(p.v.t) ; autoSave = True
                // 
                //     if at.fileChangedFlag and autoSave: # Set by 
                // replaceTargetFileIfDifferent.
                //         mustAutoSave = True
                //@-at
                //@nonl
                //@-node:orkman.20050219184612.2:<< handle v's tree >>
                //@nl
    
                p.moveToNodeAfterTree();
            }
            else
                p.moveToThreadNext();
    
        }
    
        //@    << say the command is finished >>
        //@+node:orkman.20050219184612.3:<< say the command is finished >>
        if( _writeAtFileNodesFlag || _writeDirtyAtFileNodesFlag ){
        
            if( writtenFiles.size() > 0 )
                p.g_es( "finished" );
            else if( _writeAtFileNodesFlag )
                p.g_es( "no @file nodes in the selected tree" );
            else
                p.g_es( "no dirty @file nodes" );
        
        
        
        
        
        }
        
        //@+at
        // if writeAtFileNodesFlag or writeDirtyAtFileNodesFlag:
        //     if len(writtenFiles) > 0:
        //         g.es("finished")
        //     elif writeAtFileNodesFlag:
        //         g.es("no @file nodes in the selected tree")
        //     else:
        //         g.es("no dirty @file nodes")
        //@-at
        //@nonl
        //@-node:orkman.20050219184612.3:<< say the command is finished >>
        //@nl
        
    //@+at
    //     #print 'after writing all'
    //     print "Root is %s and it has %s" % ( self.root, len(self.root.stack 
    // ) )
    //     self.root = None
    //     return mustAutoSave
    //@-at
    //@@c
        }
        catch( Exception x ){
        
            x.printStackTrace();
        
        }
        
        return mustAutoSave;    
        
    }
    //@nonl
    //@-node:orkman.20050219184612:writeAll
    //@+node:orkman.20050218201105.1:write
    public void write( final PositionSpecification root, final boolean nosentinels, 
                       final boolean thinFile, final boolean scriptWrite, 
                       final boolean toString ){
    
    try{
    if( toString )
        _targetFileName = "<string-file>";
    else if( nosentinels )
        _targetFileName = root.atNoSentFileNodeName();
    else if( thinFile )
        _targetFileName = root.atThinFileNodeName();
    else
        _targetFileName = root.atFileNodeName();
    
        initWriteIvars(root,_targetFileName, nosentinels, thinFile, scriptWrite, toString);
    
        if( !openFileForWriting(root,_targetFileName,toString) )
            return;
            
        try{
    
            writeOpenFile(root,nosentinels,toString);
            if( toString ){
                closeWriteFile();
                //# Major bug: failure to clear this wipes out headlines!
                //# Minor bug: sometimes this causes slight problems...
                //at.root.v.t.tnodeList = [] 
                _root.clearTTnodeList();
            }
            else{
    
                closeWriteFile();
                //@            << set dirty and orphan bits on error >>
                //@+node:orkman.20050218201105.3:<< set dirty and orphan bits on error >>
                if( _errors > 0 || _root.isOrphan() ){
                
                    root.setOrphan();
                    root.setDirty();
                    //os.remove( _outputFileName )
                    new File( _outputFileName ).delete();
                    root.g_es( "Not written: " + _outputFileName );    
                
                
                }
                else{
                
                    root.clearOrphan();
                    root.clearDirty();
                    replaceTargetFileIfDifferent();
                
                
                }
                //@+at
                // # Setting the orphan and dirty flags tells Leo to write the 
                // tree..
                // 
                // if at.errors > 0 or at.root.isOrphan():
                //     root.setOrphan()
                //     root.setDirty() # Make _sure_ we try to rewrite this 
                // file.
                //     os.remove(at.outputFileName) # Delete the temp file.
                //     g.es("Not written: " + at.outputFileName)
                // else:
                //     root.clearOrphan()
                //     root.clearDirty()
                //     at.replaceTargetFileIfDifferent()
                //@-at
                //@nonl
                //@-node:orkman.20050218201105.3:<< set dirty and orphan bits on error >>
                //@nl
                
                }
        
        
        }
        catch( Exception x ){
    
            x.printStackTrace();
            if( toString ){
            
                exception( "exception preprocessing script" );
                root.clearTTnodeList();
            
            
            
            }
            else{
                x.printStackTrace();
                writeException();
                
                }
        
        
        
        
        
        }
        }
        catch( Exception x ){ x.printStackTrace(); }
    
    }
    
    //@+at
    // # This is the entry point to the write code.  root should be an @file 
    // vnode.
    // 
    // def 
    // write(self,root,nosentinels=False,thinFile=False,scriptWrite=False,toString=False):
    //     """Write a 4.x derived file."""
    //     at = self ; c = at.c
    //     c.endEditing() # Capture the current headline.
    //@-at
    //@@c
        //@    << set at.targetFileName >>
        //@+node:orkman.20050218201105.2:<< set at.targetFileName >>
        //@+at
        // if toString:
        //     at.targetFileName = "<string-file>"
        // elif nosentinels:
        //     at.targetFileName = root.atNoSentFileNodeName()
        // elif thinFile:
        //     at.targetFileName = root.atThinFileNodeName()
        // else:
        //     at.targetFileName = root.atFileNodeName()
        //@-at
        //@nonl
        //@-node:orkman.20050218201105.2:<< set at.targetFileName >>
        //@nl
    //@+at
    //     at.initWriteIvars(root,at.targetFileName,
    //         nosentinels=nosentinels,thinFile=thinFile,
    //         scriptWrite=scriptWrite,toString=toString)
    //     #print 'pre openFileForWriting'
    //     if not at.openFileForWriting(root,at.targetFileName,toString):
    //         return
    // 
    //     try:
    //         #print 'pre writeOpenFile'
    // at.writeOpenFile(root,nosentinels=nosentinels,toString=toString)
    //         if toString:
    //             at.closeWriteFile()
    //             # Major bug: failure to clear this wipes out headlines!
    //             # Minor bug: sometimes this causes slight problems...
    //             at.root.v.t.tnodeList = []
    //         else:
    //             at.closeWriteFile()
    //             << set dirty and orphan bits on error >>
    //     except:
    //         if toString:
    //             at.exception("exception preprocessing script")
    //             at.root.v.t.tnodeList = []
    //         else:
    //             at.writeException() # Sets dirty and orphan bits.
    // 
    //@-at
    //@-node:orkman.20050218201105.1:write
    //@+node:orkman.20050218142615:writeOpenFile
    public void writeOpenFile( final PositionSpecification root, final boolean nosentinels, final boolean toString ){
    
        root.clearAllVisitedInTree(); //# Clear both vnode and tnode bits.
        root.clearVisitedInTree();
    //@+at   
    //     s = root.v.t.bodyString
    //     tag = "@first"
    //     i = 0
    //     while g.match(s,i,tag):
    //         i += len(tag)
    //         i = g.skip_ws(s,i)
    //         j = i
    //         i = g.skip_to_end_of_line(s,i)
    //         # Write @first line, whether empty or not
    //         line = s[j:i]
    //         at.os(line) ; at.onl()
    //         i = g.skip_nl(s,i)
    //@-at
    //@@c
    
        final String s = root.bodyString();
        String tag = "@first";
        int i = 0;
        while( match( s, i, tag ) ){
        
            i += tag.length();
            i = skip_ws( s, i );
            final int j = i;
            i = skip_to_end_of_line( s, i );
            String line = s.substring( j, i );
            os( line ); onl();
            i = skip_nl( s, i );
        
        
        
        }
        
        putOpenLeoSentinel("@+leo-ver=4");
        putInitialComment();
        putOpenNodeSentinel(root, false, false, false );
        putBody(root, true, false);
        putCloseNodeSentinel(root, false, false, false );
        putSentinel("@-leo");
        root.setVisited();
    
    //@+at
    // tag = "@last"
    // 
    // # 4/17/04 Use g.splitLines to preserve trailing newlines.
    // lines = g.splitLines(root.v.t.bodyString)
    // n = len(lines) ; j = k = n - 1
    // 
    // # Scan backwards for @last directives.
    // while j >= 0:
    //     line = lines[j]
    //     if g.match(line,0,tag): j -= 1
    //     elif not line.strip():
    //         j -= 1
    //     else: break
    // # Write the @last lines.
    // for line in lines[j+1:k+1]:
    //     if g.match(line,0,tag):
    //         i = len(tag) ; i = g.skip_ws(line,i)
    //         at.os(line[i:])
    //@-at
    //@@c
    tag = "@last";
    final List< String > lines = new ArrayList<String>();
    StringBuilder sb = new StringBuilder();
    final char[] data = s.toCharArray();
    for( final char c: data ){
    
        sb.append( c );
        if( c== '\n' ){
            lines.add( sb.toString() );
            sb = new StringBuilder();
        
        
        }
    
    
    }
    if( !lines.contains( sb.toString() ) ) lines.add( sb.toString() );
    int n = lines.size(); 
    int j = n -1; int k = j;
    
    while( j >= 0 ){
    
        final String line = lines.get( j );
        if( match( line, 0, tag ) ) j -= 1;
        else if( line.trim().equals( "" ) ) j -= 1;
        else break;
        /*while j >= 0:
        line = lines[j]
        if g.match(line,0,tag): j -= 1
        elif not line.strip():
            j -= 1
        else: break*/
    
    
    
    
    }
    
    for( final String line: lines.subList( j + 1, k + 1 ) ){
    
        if( match( line, 0, tag ) ){
        
            i = tag.length(); i = skip_ws( line, i );
            os( line.substring( i ) );
        
        
        }
    }
    /*for line in lines[j+1:k+1]:
        if g.match(line,0,tag):
            i = len(tag) ; i = g.skip_ws(line,i)
            at.os(line[i:])*/
    
    
    
    
    //@+at
    // # New in 4.3: must be inited before calling this method.
    // 
    // def writeOpenFile(self,root,nosentinels=False,toString=False):
    // 
    //     """Do all writes except asis writes."""
    //     at = self ; c = at.c
    //     root.clearAllVisitedInTree() # Clear both vnode and tnode bits.
    //     root.clearVisitedInTree()
    //@-at
    //@@c
        //@    << put all @first lines in root >>
        //@+node:orkman.20050218142615.1:<< put all @first lines in root >> (4.x)
        //@+at 
        //@nonl
        // Write any @first lines.  These lines are also converted to 
        // @verbatim lines, so the read logic simply ignores lines preceding 
        // the @+leo sentinel.
        //@-at
        //@@c
        //@+at
        // s = root.v.t.bodyString
        // tag = "@first"
        // i = 0
        // while g.match(s,i,tag):
        //     i += len(tag)
        //     i = g.skip_ws(s,i)
        //     j = i
        //     i = g.skip_to_end_of_line(s,i)
        //     # Write @first line, whether empty or not
        //     line = s[j:i]
        //     at.os(line) ; at.onl()
        //     i = g.skip_nl(s,i)
        //@-at
        //@nonl
        //@-node:orkman.20050218142615.1:<< put all @first lines in root >> (4.x)
        //@nl
    //@+at
    //     # Put the main part of the file.
    //     at.putOpenLeoSentinel("@+leo-ver=4")
    //     at.putInitialComment()
    //     at.putOpenNodeSentinel(root)
    //     at.putBody(root)
    //     at.putCloseNodeSentinel(root)
    //     at.putSentinel("@-leo")
    //     root.setVisited()
    //@-at
    //@@c
        //@    << put all @last lines in root >>
        //@+node:orkman.20050218142615.2:<< put all @last lines in root >> (4.x)
        //@+at 
        //@nonl
        // Write any @last lines.  These lines are also converted to @verbatim 
        // lines, so the read logic simply ignores lines following the @-leo 
        // sentinel.
        //@-at
        //@@c
        //@+at
        // tag = "@last"
        // 
        // # 4/17/04 Use g.splitLines to preserve trailing newlines.
        // lines = g.splitLines(root.v.t.bodyString)
        // n = len(lines) ; j = k = n - 1
        // 
        // # Scan backwards for @last directives.
        // while j >= 0:
        //     line = lines[j]
        //     if g.match(line,0,tag): j -= 1
        //     elif not line.strip():
        //         j -= 1
        //     else: break
        // # Write the @last lines.
        // for line in lines[j+1:k+1]:
        //     if g.match(line,0,tag):
        //         i = len(tag) ; i = g.skip_ws(line,i)
        //         at.os(line[i:])
        //@-at
        //@nonl
        //@-node:orkman.20050218142615.2:<< put all @last lines in root >> (4.x)
        //@nl
    
        if( !toString && !nosentinels)
            warnAboutOrphandAndIgnoredNodes();
            
        }
    //@nonl
    //@-node:orkman.20050218142615:writeOpenFile
    //@+node:orkman.20050218135538:Writing 4,x sentinels...
    //@+node:orkman.20050218135538.1:nodeSentinelText 4.x
    public final String nodeSentinelText( final PositionSpecification p ){
    
    
        String h = p.headString();
        final String start = _startSentinelComment;
        final String end = _endSentinelComment;
        if( end != null && end.length() > 0 ){
        
            h = h.replace( start, "" );
            h = h.replace( end, "" );
        
        
        }
        
        if( _thinFile ){
            final String gnx = convertGnxToString( p.getTFileIndex() );
            return String.format( "%s:%s", gnx, h );
            
        }
        else return h;
    
    
    }
    //@+at
    // def nodeSentinelText(self,p):
    //     """Return the text of a @+node or @-node sentinel for p."""
    //     at = self ; h = p.headString()
    //@-at
    //@@c
        //@    << remove comment delims from h if necessary >>
        //@+node:orkman.20050218135538.2:<< remove comment delims from h if necessary >>
        //@+at 
        //@nonl
        // Bug fix 1/24/03:
        // 
        // If the present @language/@comment settings do not specify a 
        // single-line comment we remove all block comment delims from h.  
        // This prevents headline text from interfering with the parsing of 
        // node sentinels.
        //@-at
        //@@c
        
        //@+at
        // start = at.startSentinelComment
        // end = at.endSentinelComment
        // 
        // if end and len(end) > 0:
        //     h = h.replace(start,"")
        //     h = h.replace(end,"")
        //@-at
        //@nonl
        //@-node:orkman.20050218135538.2:<< remove comment delims from h if necessary >>
        //@nl
     
    //@+at 
    //     if at.thinFile:
    //         gnx = g.app.nodeIndices.toString(p.v.t.fileIndex)
    //         return "%s:%s" % (gnx,h)
    //     else:
    //         return h
    //@-at
    //@nonl
    //@-node:orkman.20050218135538.1:nodeSentinelText 4.x
    //@+node:orkman.20050218140138:convertGnxToString
    public final String convertGnxToString( final Object[] index ){
    
        final Object theId = index[ 0 ];
        final Object t = index[ 1 ];
        final Object n = index[ 2 ];
        
        if( n == null ) return String.format( "%s.%s", theId, t );
        else return String.format( "%s.%s.%s", theId, t, n );
    
    
    
    }
    
    
    //@+at
    // def toString (self,index,removeDefaultId=False):
    //     """Convert a gnx (a tuple) to its string representation"""
    // 
    //     theId,t,n = index
    // 
    //     if removeDefaultId and theId == self.defaultId:
    //         theId = ""
    // 
    //     if not n: # None or ""
    //         return "%s.%s" % (theId,t)
    //     else:
    //         return "%s.%s.%d" % (theId,t,n)
    //@-at
    //@nonl
    //@-node:orkman.20050218140138:convertGnxToString
    //@+node:orkman.20050218135538.3:putLeadInSentinel 4.x
    public final void putLeadInSentinel( final String s, final int i, final int j, final int delta ){
    
        _leadingWs = "";
        if( i == j ) return;
        int k = skip_ws( s, i );
        if( j == k ) _leadingWs = s.substring( i, j );
        else{
    //@+at
    //         # g.trace("indent",self.indent)
    //         self.putIndent(self.indent) # 1/29/04: fix bug reported by Dan 
    // Winkler.
    //         at.os(s[i:j]) ; at.onl_sent() # 10/21/03
    //         at.indent += delta # Align the @nonl with the following line.
    //         at.putSentinel("@nonl")
    //         at.indent -= delta # Let the caller set at.indent permanently
    //@-at
    //@@c    
            putIndent( _indent );
            os( s.substring( i, j ) );
            _indent += delta;
            putSentinel( "@nonl" );
            _indent -= delta;   
            
        
        }
        
    
    
    }
    
    //@+at
    // def putLeadInSentinel (self,s,i,j,delta):
    //     """Generate @nonl sentinels as needed to ensure a newline before a 
    // group of sentinels.
    //     Set at.leadingWs as needed for @+others and @+<< sentinels.
    // 
    //     i points at the start of a line.
    //     j points at @others or a section reference.
    //     delta is the change in at.indent that is about to happen and hasn't 
    // happened yet."""
    // 
    //     at = self
    //     at.leadingWs = "" # Set the default.
    //     if i == j:
    //         return # The @others or ref starts a line.
    // 
    //     k = g.skip_ws(s,i)
    //     if j == k:
    //         # Only whitespace before the @others or ref.
    //         at.leadingWs = s[i:j] # Remember the leading whitespace, 
    // including its spelling.
    //     else:
    //         # g.trace("indent",self.indent)
    //         self.putIndent(self.indent) # 1/29/04: fix bug reported by Dan 
    // Winkler.
    //         at.os(s[i:j]) ; at.onl_sent() # 10/21/03
    //         at.indent += delta # Align the @nonl with the following line.
    //         at.putSentinel("@nonl")
    //         at.indent -= delta # Let the caller set at.indent permanently.
    //@-at
    //@nonl
    //@-node:orkman.20050218135538.3:putLeadInSentinel 4.x
    //@+node:orkman.20050218135538.4:putCloseNodeSentinel 4.x
    
    
    //@+at
    // def 
    // putCloseNodeSentinel(self,p,inAtAll=False,inAtOthers=False,middle=False):
    //     at = self
    //     s = self.nodeSentinelText(p)
    //     if middle:
    //         at.putSentinel("@-middle:" + s)
    //     else:
    //         at.putSentinel("@-node:" + s)
    //@-at
    //@nonl
    //@-node:orkman.20050218135538.4:putCloseNodeSentinel 4.x
    //@+node:orkman.20050218135538.5:putOpenLeoSentinel 4.x
    public final void putOpenLeoSentinel( String s ){
    
    
        if( ! _sentinels ) return;
        
        if( _thinFile ) s += "-thin"; 
        
        final String encoding = _encoding.toLowerCase();
        if( !encoding.equals("utf-8") )
            s =  format( "%s-encoding=%s,.", s, encoding );
        
        putSentinel( s );  
    
    
    }
    
    //@+at
    // def putOpenLeoSentinel(self,s):
    //     """Write @+leo sentinel."""
    // 
    //     at = self
    //     if not at.sentinels:
    //         return # Handle @nosentinelsfile.
    //     if at.thinFile:
    //         s = s + "-thin"
    // 
    //     encoding = at.encoding.lower()
    //     if encoding != "utf-8":
    //         # New in 4.2: encoding fields end in ",."
    //         s = s + "-encoding=%s,." % (encoding)
    //     at.putSentinel(s)
    //@-at
    //@nonl
    //@-node:orkman.20050218135538.5:putOpenLeoSentinel 4.x
    //@+node:orkman.20050218135538.6:putOpenNodeSentinel (sets tnodeList) 4.x
    //@+at
    // def 
    // putOpenNodeSentinel(self,p,inAtAll=False,inAtOthers=False,middle=False):
    //     """Write @+node sentinel for p."""
    //     at = self
    // 
    //     if not inAtAll and p.isAtFileNode() and p != at.root:
    //         at.writeError("@file not valid in: " + p.headString())
    //         return
    //     # g.trace(at.thinFile,p)
    //     s = at.nodeSentinelText(p)
    //     if middle:
    //         at.putSentinel("@+middle:" + s)
    //     else:
    //         at.putSentinel("@+node:" + s)
    // 
    //     if not at.thinFile:
    //         # Append the n'th tnode to the root's tnode list.
    //         at.root.v.t.tnodeList.append(p.v.t)
    //@-at
    //@nonl
    //@-node:orkman.20050218135538.6:putOpenNodeSentinel (sets tnodeList) 4.x
    //@+node:orkman.20050218135538.7:apply the cweb hack to s
    //@+at 
    //@nonl
    // The cweb hack:
    // 
    // If the opening comment delim ends in '@', double all '@' signs except 
    // the first, which is "doubled" by the trailing '@' in the opening 
    // comment delimiter.
    //@-at
    //@@c
    //@+at
    // start = at.startSentinelComment
    // if start and start[-1] == '@':
    //     assert(s and s[0]=='@')
    //     s = s.replace('@','@@')[1:]
    //@-at
    //@nonl
    //@-node:orkman.20050218135538.7:apply the cweb hack to s
    //@-node:orkman.20050218135538:Writing 4,x sentinels...
    //@+node:orkman.20050218162606:os and allies
    // Note:  self.outputFile may be either a fileLikeObject or a real file.
    
    //@+node:orkman.20050218165447:oblank, oblanks & otabs
    public final void oblank(){
    
        os( " " );
    
    
    }
    
    public final void oblanks( final int n ){
    
        final int ab = abs( n );
        final char[] c = new char[ ab ];
        Arrays.fill( c, ' ' );
        final String blanks = new String( c );
        os( blanks );
    
    
    }
    
    public final void otabs( final int n ){
    
        final int ab = abs( n );
        final char[] c = new char[ ab ];
        Arrays.fill( c, '\t' );
        final String tabs = new String( c );
        os( tabs );
    
    }
    
    //@+at
    // def oblank(self):
    //     self.os(' ')
    // 
    // def oblanks (self,n):
    //     self.os(' ' * abs(n))
    // def otabs(self,n):
    //     self.os('\t' * abs(n))
    //@-at
    //@nonl
    //@-node:orkman.20050218165447:oblank, oblanks & otabs
    //@+node:orkman.20050218162606.2:onl & onl_sent
    public final void onl(){
    
    
        os( _output_newline );
    
    
    }
    
    public final void onl_sent(){   
    
        if( _sentinels )
            onl();
    
    
    }
    
    //@+at
    // def onl(self):
    //     """Write a newline to the output stream."""
    // 
    //     self.os(self.output_newline)
    // def onl_sent(self):
    //     """Write a newline to the output stream, provided we are outputting 
    // sentinels."""
    // 
    //     if self.sentinels:
    //         self.onl()
    //@-at
    //@nonl
    //@-node:orkman.20050218162606.2:onl & onl_sent
    //@+node:orkman.20050218162606.3:os
    public abstract void os( final String s );
    //@+at
    // public void os( final String s ){
    // 
    // 
    //     try{
    //         System.out.println( "IM HERE SOMEHOW?" );
    //         if( s != null && _outputStream != null ){
    //             final byte[] encoded_s = s.getBytes( _encoding );
    //             _outputStream.write( encoded_s );
    //         }
    //     }
    //     catch( final Exception x ){
    // 
    //         x.printStackTrace();
    //     }
    // 
    // 
    // 
    // 
    // }
    // 
    // 
    //@-at
    //@+at
    // def os (self,s):
    //     """Write a string to the output stream.
    //     All output produced by leoAtFile module goes here."""
    //     at = self
    //     if s and at.outputFile:
    //         try:
    //             #print at.encoding
    //             #print java.lang.System.currentTimeMillis()
    //             s = g.toEncodedString(s,at.encoding,reportErrors=True)
    //             at.outputFile.write(s)
    //             #at.outputFile.append( s )
    //             #print java.lang.System.currentTimeMillis()
    //         except:
    //             at.exception("exception writing:" + s)
    //@-at
    //@nonl
    //@-node:orkman.20050218162606.3:os
    //@-node:orkman.20050218162606:os and allies
    //@+node:orkman.20050215170438.1:putSentinel (applies cweb hack) 4.x
    public final void putSentinel( String s ){
    
        if( !_sentinels ) return;
        
        putIndent( _indent );
        os( _startSentinelComment );
        final String start = _startSentinelComment;
        //if start and start[-1] == '@':
        //assert(s and s[0]=='@
        final int slen = start.length();
    
        
        if( start != null && slen > 0 && start.charAt( slen - 1 ) == '@' ){
            
            s = s.replace( "@", "@@" ).substring( 1 );
            
        }
            //s = s.replace('@','@@')[1:]
        
        os( s ); //dont misinterpret the comments to bellow that the code belongs in the above if
        if( _endSentinelComment != null )
            os( _endSentinelComment );
        onl();
    
        
    
    }
    
    
    //@+at
    // # This method outputs all sentinels.
    // 
    // def putSentinel(self,s):
    // 
    //     "Write a sentinel whose text is s, applying the CWEB hack if 
    // needed."
    //     at = self
    // 
    //     if not at.sentinels:
    //         return # Handle @file-nosent
    // 
    //     at.putIndent(at.indent)
    //     at.os(at.startSentinelComment)
    //     << apply the cweb hack to s >>
    //@-at
    //@+at 
    //@nonl
    // The cweb hack:
    // 
    // If the opening comment delim ends in '@', double all '@' signs except 
    // the first, which is "doubled" by the trailing '@' in the opening 
    // comment delimiter.
    // 
    // 
    // start = at.startSentinelComment
    // if start and start[-1] == '@':
    //     assert(s and s[0]=='@')
    //     s = s.replace('@','@@')[1:]
    //     at.os(s)
    //     if at.endSentinelComment:
    //         at.os(at.endSentinelComment)
    //     at.onl()
    //@-at
    //@-node:orkman.20050215170438.1:putSentinel (applies cweb hack) 4.x
    //@+node:orkman.20050215141052:putCodeLine
    public final void putCodeLine( final String s, final int i ){
    
        final int k = skip_ws( s, i );
        if( match( s, k , _startSentinelComment + '@' ) )
            putSentinel( "@verbatim" );
        
        final int j = skip_line( s, i );
        final String line = s.substring( i, j );
        
        if( !line.equals( "" ) && !_raw )
            putIndent( _indent );
        
        final int line_length = line.length();  
        
        if( line_length > 0 && line.substring( line_length - 1 ).equals( "\n" ) ){
        
            os( line.substring( 0, line_length -1 ) );
            onl();
        
        
        }
        else{ 
    
        
                os( line );
                
                
                }
    
    
    }
    //@+at
    // def putCodeLine (self,s,i):
    //     """Put a normal code line."""
    //     at = self
    //     # Put @verbatim sentinel if required.
    //     k = g.skip_ws(s,i)
    //     if g.match(s,k,self.startSentinelComment + '@'):
    //         self.putSentinel("@verbatim")
    // 
    //     j = g.skip_line(s,i)
    //     line = s[i:j]
    // 
    //     # c.config.write_strips_blank_lines
    //     if 0: # 7/22/04: Don't put any whitespace in otherwise blank lines.
    //         if line.strip(): # The line has non-empty content.
    //             if not at.raw:
    //                 at.putIndent(at.indent)
    //             if line[-1:]=="\n":
    //                 at.os(line[:-1])
    //                 at.onl()
    //             else:
    //                 at.os(line)
    //         elif line and line[-1] == '\n':
    //             at.onl()
    //         else:
    //             g.trace("Can't happen: completely empty line")
    //     else:
    //         # 1/29/04: Don't put leading indent if the line is empty!
    //         if line and not at.raw:
    //             at.putIndent(at.indent)
    //         if line[-1:]=="\n":
    //             at.os(line[:-1])
    //             at.onl()
    //         else:
    //             at.os(line)
    //@-at
    //@nonl
    //@-node:orkman.20050215141052:putCodeLine
    //@+node:orkman.20050218150820:putIndent
    public final void putIndent( final int n ){
    
        if( n != 0 ){
        
            final int w = _tabWidth;
            if( w > 1 ){
            
                final int q = n/w;
                final int r = n%w;
                otabs( q );
                oblanks( r );
            
            }
            else oblanks( n );
            
        
        
        }
    
    
    
    }
    
    
    //@+at
    // def putIndent(self,n):
    //     """Put tabs and spaces corresponding to n spaces, assuming that we 
    // are at the start of a line."""
    // 
    //     if n != 0:
    //         w = self.tab_width
    //         if w > 1:
    //             q,r = divmod(n,w)
    //             self.otabs(q)
    //             self.oblanks(r)
    //         else:
    //             self.oblanks(n)
    //@-at
    //@nonl
    //@-node:orkman.20050218150820:putIndent
    //@+node:orkman.20050218152144:putInitialComment
    //@+at
    // def putInitialComment (self):
    //     c = self.c
    //     s2 = c.config.output_initial_comment
    //     if s2:
    //         lines = string.split(s2,"\\n")
    //         for line in lines:
    //             line = line.replace("@date",time.asctime())
    //             if len(line)> 0:
    //                 self.putSentinel("@comment " + line)
    //@-at
    //@nonl
    //@-node:orkman.20050218152144:putInitialComment
    //@+node:orkman.20050219195121:writing doc lines...
    //@+node:orkman.20050219195121.1:putBlankDocLine
    public final void putBlankDocLine(){
    
    
        putPending( false );
        if( _endSentinelComment == null || _endSentinelComment.equals( "" ) ){
        
            putIndent( _indent );    
            os( _startSentinelComment );
            oblank();
        
        
        
        }
        onl();
    
    
    }
    
    //@+at
    // def putBlankDocLine (self):
    //     at = self
    //     at.putPending(split=False)
    // 
    //     if not at.endSentinelComment:
    //         at.putIndent(at.indent)
    //         at.os(at.startSentinelComment) ; at.oblank()
    // 
    //     at.onl()
    //@-at
    //@nonl
    //@-node:orkman.20050219195121.1:putBlankDocLine
    //@+node:orkman.20050219195121.2:putStartDocLine
    //@+at
    // def putStartDocLine (self,s,i,kind):
    //     """Write the start of a doc part."""
    //     at = self ; at.docKind = kind
    //     sentinel = g.choose(kind == at.docDirective,"@+doc","@+at")
    //     directive = g.choose(kind == at.docDirective,"@doc","@")
    //     if 0: # New code: put whatever follows the directive in the 
    // sentinel
    //         # Skip past the directive.
    //         i += len(directive)
    //         j = g.skip_to_end_of_line(s,i)
    //         follow = s[i:j]
    //         # Put the opening @+doc or @-doc sentinel, including whatever 
    // follows the directive.
    //         at.putSentinel(sentinel + follow)
    // 
    //         # Put the opening comment if we are using block comments.
    //         if at.endSentinelComment:
    //             at.putIndent(at.indent)
    //             at.os(at.startSentinelComment) ; at.onl()
    //     else: # old code.
    //         # Skip past the directive.
    //         i += len(directive)
    //         # Get the trailing whitespace.
    //         j = g.skip_ws(s,i)
    //         ws = s[i:j]
    //         # Put the opening @+doc or @-doc sentinel, including trailing 
    // whitespace.
    //         at.putSentinel(sentinel + ws)
    //         # Put the opening comment.
    //         if at.endSentinelComment:
    //             at.putIndent(at.indent)
    //             at.os(at.startSentinelComment) ; at.onl()
    //         # Put an @nonl sentinel if there is significant text following 
    // @doc or @.
    //         if not g.is_nl(s,j):
    //             # Doesn't work if we are using block comments.
    //             at.putSentinel("@nonl")
    //             at.putDocLine(s,j)
    //@-at
    //@nonl
    //@-node:orkman.20050219195121.2:putStartDocLine
    //@+node:orkman.20050219195121.3:putDocLine
    public final void putDocLine( String s, int i ){
    
        final int j = skip_line( s, i );
        s = s.substring( i, j );
        
        final int leading;
        if( _endSentinelComment != null && !_endSentinelComment.equals( "" ) )
            leading = _indent;
        else
            leading = _indent + _startSentinelComment.length() + 1;
            
        if( s.length() == 0 || s.charAt( 0 ) == '\n' ){
        
            putBlankDocLine();
            
            }
        else{
            //@        << append words to pending line, splitting the line if needed >>
            //@+node:orkman.20050219195121.4:<< append words to pending line, splitting the line if needed >>
            i = 0;
            while( i < s.length() ){
            
            
                int word1 = i;
                final int word2 = i = skip_ws( s, i );
                while( i < s.length() && ( s.charAt( i ) != ' ' || s.charAt( i ) != '\t' ) )
                    i += 1;
                    
                final int word3 = i = skip_ws( s, i );
                final String _pstring = pendingToString();
                if( ( leading + word3 - word1 + _pstring.length() ) >= _page_width ){
                
                    if( _pending != null && _pending.size() != 0 ){
                        putPending( true );
                        _pending.clear();
                        _pending.add( s.substring( word2, word3 ) );
                        
                    }
                    else{
                    
                        _pending.clear();
                        _pending.add( s.substring( word2, word3 ) );
                    
                    
                    
                    }
                
                
                
                }
                else _pending.add( s.substring( word1, word3 ) );
            
            
            
            }
            putPending( false );
            
            
            
            //@+at 
            //@nonl
            // All inserted newlines are preceeded by whitespace:
            // we remove trailing whitespace from lines that have not been 
            // split.
            //@-at
            //@@c
            //@+at
            // i = 0
            // while i < len(s):
            // 
            //     # Scan to the next word.
            //     word1 = i # Start of the current word.
            //     word2 = i = g.skip_ws(s,i)
            //     while i < len(s) and s[i] not in (' ','\t'):
            //         i += 1
            //     word3 = i = g.skip_ws(s,i)
            //     # g.trace(s[word1:i])
            //     if leading + word3 - word1 + len(''.join(at.pending)) >= 
            // at.page_width:
            //         if at.pending:
            //             # g.trace("splitting long line.")
            //             # Ouput the pending line, and start a new line.
            //             at.putPending(split=True)
            //             at.pending = [s[word2:word3]]
            //         else:
            //             # Output a long word on a line by itself.
            //             # g.trace("long word:",s[word2:word3])
            //             at.pending = [s[word2:word3]]
            //             at.putPending(split=True)
            //     else:
            //         # Append the entire word to the pending line.
            //         # g.trace("appending",s[word1:word3])
            //         at.pending.append(s[word1:word3])
            // # Output the remaining line: no more is left.
            // at.putPending(split=False)
            //@-at
            //@-node:orkman.20050219195121.4:<< append words to pending line, splitting the line if needed >>
            //@nl
            
            }
    
    }
    //@+at
    // def putDocLine (self,s,i):
    //     """Handle one line of a doc part.
    //     Output complete lines and split long lines and queue pending lines.
    //     Inserted newlines are always preceded by whitespace."""
    //     at = self
    //     j = g.skip_line(s,i)
    //     s = s[i:j]
    // 
    //     if at.endSentinelComment:
    //         leading = at.indent
    //     else:
    //         leading = at.indent + len(at.startSentinelComment) + 1
    // 
    //     if not s or s[0] == '\n':
    //         # A blank line.
    //         at.putBlankDocLine()
    //     else:
    // 
    //         << append words to pending line, splitting the line if needed 
    // >>
    //@-at
    //@-node:orkman.20050219195121.3:putDocLine
    //@+node:orkman.20050219195121.5:putEndDocLine
    public final void putEndDocLine(){
    
    
        putPending( false );
        if( _endSentinelComment != null && !_endSentinelComment.equals( "" ) ){
        
            putIndent( _indent );
            os( _endSentinelComment );
            onl();
        
        
        }
        
        final String sentinel = _docKind == docDirective ? "@-doc": "@-at";
        putSentinel( sentinel );
    
    }
    //@+at
    // def putEndDocLine (self):
    //     """Write the conclusion of a doc part."""
    //     at = self
    //     at.putPending(split=False)
    //     # Put the closing delimiter if we are using block comments.
    //     if at.endSentinelComment:
    //         at.putIndent(at.indent)
    //         at.os(at.endSentinelComment)
    //         at.onl() # Note: no trailing whitespace.
    // 
    //     sentinel = g.choose(at.docKind == at.docDirective,"@-doc","@-at")
    //     at.putSentinel(sentinel)
    //@-at
    //@nonl
    //@-node:orkman.20050219195121.5:putEndDocLine
    //@+node:orkman.20050219195121.6:putPending
    public final void putPending( final boolean split ){
    
        try{
        StringBuilder s = new StringBuilder();
        for( final String ps: _pending )
            s.append( ps );
         
        _pending.clear();
        
        final int slen = s.length();
        if( slen != 0 && s.charAt( slen -1 ) == '\n' ){        
            
            //s = s.setLength( 0 );
            //s.append( '\n' );
            s = s.deleteCharAt( slen -1 );
            //s = (StringBuilder)s.subSequence( 0, slen - 1 );
            
            }
            
            
            
            
        s.insert( 0 , '1' ); //so we can trim()
        String s2 = s.toString();
        if( ! split ){
            s2 = s2.trim();
            s2 = s2.substring( 1 );
            if( s2.equals( "" ) ){
                return;
                
                
            }
            
            }
        
        
        putIndent( _indent );
        if( _endSentinelComment == null || _endSentinelComment.equals( "" ) ){
        
            os( _startSentinelComment );
            oblank();
        
        
        }
        
        os( s2 );
        onl();
        }
        catch( Exception x ){
        
            x.printStackTrace();
        
        }
    
    
    }
    
    //@+at
    // def putPending (self,split):
    //     """Write the pending part of a doc part.
    //     We retain trailing whitespace iff the split flag is True."""
    //     at = self ; s = ''.join(at.pending) ; at.pending = []
    //     # g.trace("split",s)
    //     # Remove trailing newline temporarily.  We'll add it back later.
    //     if s and s[-1] == '\n':
    //         s = s[:-1]
    // 
    //     if not split:
    //         s = s.rstrip()
    //         if not s:
    //             return
    // 
    //     at.putIndent(at.indent)
    // 
    //     if not at.endSentinelComment:
    //         at.os(at.startSentinelComment) ; at.oblank()
    // 
    //     at.os(s) ; at.onl()
    //@-at
    //@nonl
    //@-node:orkman.20050219195121.6:putPending
    //@+node:zorcanda!.20050511174314:pendingToString
    private final String pendingToString(){
    
        final StringBuilder sb = new StringBuilder();
        for( final String s: _pending )
            sb.append( s );
            
        
        return sb.toString();
    
    
    
    
    }
    //@nonl
    //@-node:zorcanda!.20050511174314:pendingToString
    //@-node:orkman.20050219195121:writing doc lines...
    //@+node:orkman.20050215185022:putBody
    /*public void putBody( PositionSpecification p ){
    
        putBody( p, 1, 0 );
    
    }*/
    
    public void putBody( final PositionSpecification p, final boolean putCloseSentinel, final boolean oneNodeOnly ){
    
        try{
    
        final leoBaseAtFile at = this;
        final StringBuilder _s = new StringBuilder( p.bodyString() );
        int slength = _s.length();
        p.setTVisited();
        p.setVisited();
        if( !_thinFile ){
        
            p.setWriteBit();
            
            }
        boolean inCode = true;
        
        /*if s:
        trailingNewlineFlag = s and s[-1] == '\n'
        if at.sentinels and not trailingNewlineFlag:
            s = s + '\n'
    else:
        trailingNewlineFlag = True # don't need to generate an @nonl*/
        boolean trailingNewlineFlag = false;
        if( slength > 0 ){
        
            trailingNewlineFlag = slength > 0 && _s.charAt( slength -1 ) == '\n'? true: false;
            if( _sentinels && !trailingNewlineFlag ) //s = s + '\n';
                    _s.append( '\n' );
        }
        else trailingNewlineFlag = true;
    
    
        int i = 0;
        //int lc = loopcounter;
        final String s = _s.toString();
        final int slen2 = s.length();
        while( i < slen2 ){ //s.length() ){
        
            int next_i = skip_line( s, i );
            int kind = directiveKind4( s, i );
            //@        << handle line at s[i] >>
            //@+node:orkman.20050215185022.2:<< handle line at s[i] >>
            if( kind == noDirective ){
            
                if( ! oneNodeOnly ){
                    if( inCode ){
                    
                        final Object[] data = findSectionName( s, i );
                        final boolean hasRef = (Boolean)data[ 0 ];
                        final int n1 = (Integer)data[ 1 ];
                        final int n2 = (Integer)data[ 2 ];
                        if( hasRef && !_raw )
                            putRefLine( s, i, n1, n2, p );
                        else
                            putCodeLine( s, i );
                        
                    
                    }
                    else putDocLine( s, i );
                
                
                
                }
             /*   if not oneNodeOnly:
                    if inCode:
                        hasRef,n1,n2 = at.findSectionName(s,i)
                        if hasRef and not at.raw:
                            at.putRefLine(s,i,n1,n2,p)
                        else:
                            at.putCodeLine(s,i)
                    else:
                        at.putDocLine(s,i)*/
            
            
            }
            else if ( kind == docDirective || kind == atDirective ){
            
                if( !inCode ) putEndDocLine();
                putStartDocLine(  s, i, kind );
                inCode = false;
            
            
                /*assert(not at.pending)
                if not inCode: # Bug fix 12/31/04: handle adjacent doc parts.
                    at.putEndDocLine()
                at.putStartDocLine(s,i,kind)
                inCode = False*/
            
            
            
            }
            else if( kind == cDirective || kind == codeDirective ){
                
                if( !inCode ) putEndDocLine();
                putDirective( s, i );
                inCode = true;
                
                /*# Only @c and @code end a doc part.
                if not inCode:
                    at.putEndDocLine()
                at.putDirective(s,i)
                inCode = True*/
            
            
            
            
            }
            else if( kind == allDirective ){
            
                if( !oneNodeOnly ){
                
                    if( inCode ) putAtAllLine( s, i , p );
                    else putDocLine( s, i );
                
                
                
                }
                    
                    /*
                    if not oneNodeOnly:
                    if inCode: at.putAtAllLine(s,i,p)
                    else: at.putDocLine(s,i)*/
            
            
            }
            else if( kind == othersDirective ){
            
                if( ! oneNodeOnly ){
                
                    if( inCode ) putAtOthersLine( s, i, p );
                    else putDocLine( s, i );
                
                
                
                }
                /*if not oneNodeOnly:
                    if inCode: at.putAtOthersLine(s,i,p)
                    else: at.putDocLine(s,i)*/
            
            }
            else if( kind == rawDirective ){
            
            
                _raw = true;
                putSentinel( "@@raw" );
               /* at.raw = True
                at.putSentinel("@@raw") */
            
            
            }
            else if( kind == endRawDirective ){
            
                _raw = false;
                putSentinel( "@@end_raw" );
                i = skip_line( s, i );
                /*at.raw = False
                at.putSentinel("@@end_raw")
                i = g.skip_line(s,i)*/
            
            
            }
            else if( kind == miscDirective ){
            
                putDirective( s, i );
               //at.putDirective(s,i)
            
            }
            else{
                
                assert( false );
                
                }
            
            
            //@+at
            // if kind == at.noDirective:
            //     if not oneNodeOnly:
            //         if inCode:
            //             hasRef,n1,n2 = at.findSectionName(s,i)
            //             if hasRef and not at.raw:
            //                 at.putRefLine(s,i,n1,n2,p)
            //             else:
            //                 at.putCodeLine(s,i)
            //         else:
            //             at.putDocLine(s,i)
            // elif kind in (at.docDirective,at.atDirective):
            //     assert(not at.pending)
            //     if not inCode: # Bug fix 12/31/04: handle adjacent doc 
            // parts.
            //         at.putEndDocLine()
            //     at.putStartDocLine(s,i,kind)
            //     inCode = False
            // elif kind in (at.cDirective,at.codeDirective):
            //     # Only @c and @code end a doc part.
            //     if not inCode:
            //         at.putEndDocLine()
            //     at.putDirective(s,i)
            //     inCode = True
            // elif kind == at.allDirective:
            //     if not oneNodeOnly:
            //         if inCode: at.putAtAllLine(s,i,p)
            //         else: at.putDocLine(s,i)
            // elif kind == at.othersDirective:
            //     if not oneNodeOnly:
            //         if inCode: at.putAtOthersLine(s,i,p)
            //         else: at.putDocLine(s,i)
            // elif kind == at.rawDirective:
            //     at.raw = True
            //     at.putSentinel("@@raw")
            // elif kind == at.endRawDirective:
            //     at.raw = False
            //     at.putSentinel("@@end_raw")
            //     i = g.skip_line(s,i)
            // elif kind == at.miscDirective:
            //     at.putDirective(s,i)
            // else:
            //     assert(0) # Unknown directive.
            //@-at
            //@nonl
            //@-node:orkman.20050215185022.2:<< handle line at s[i] >>
            //@nl
            i = next_i;
        
        }
    
        if( !inCode ) putEndDocLine();
        if( _sentinels && !trailingNewlineFlag ) putSentinel( "@nonl" );
        }
        catch( Throwable x ){
            
        
            x.printStackTrace();
            //if( loopcounter >= 140 )System.exit( 0 );
        
        }
    
    }
    
    //@+at
    // 
    // # oneNodeOnly is no longer used.
    // 
    // def putBody(self,p,putCloseSentinel=True,oneNodeOnly=False):
    //     """ Generate the body enclosed in sentinel lines."""
    // 
    //     at = self ; s = p.bodyString()
    //     p.v.t.setVisited() # Suppress orphans check.
    //     p.v.setVisited() # Make sure v is never expanded again.
    //     if not at.thinFile:
    //         p.v.t.setWriteBit() # Mark the tnode to be written.
    //     if not at.thinFile and not s: return
    //     inCode = True
    //     #print 'putBody1'
    //     << Make sure all lines end in a newline >>
    //     i = 0
    // 
    //     while i < len(s):
    //         #print len( s ), i, self.targetFileName, p.v.t.headString
    //         next_i = g.skip_line(s,i)
    //         assert(next_i > i)
    //         kind = at.directiveKind4(s,i)
    //         << handle line at s[i] >>
    //         i = next_i
    // 
    //     if not inCode:
    //         at.putEndDocLine()
    //     if at.sentinels and not trailingNewlineFlag:
    //         at.putSentinel("@nonl")
    // 
    //@-at
    //@-node:orkman.20050215185022:putBody
    //@+node:orkman.20050218122434:putDirective  (handles @delims,@comment,@language) 4.x
    //@+at 
    //@nonl
    // It is important for PHP and other situations that @first and @last 
    // directives get translated to verbatim lines that do _not_ include what 
    // follows the @first & @last directives.
    //@-at
    //@@c
    
    
    public final int putDirective( final String s, int i ){
    
        final String tag = "@delims";
        //final StringBuilder s2 = new StringBuilder( s );
        final int k = i;
        int j = skip_to_end_of_line( s, i );
        final String directive = s.substring( i, j );
        if( match_word( s, k, "@delims" ) ){
        
            //@        << handle @delims >>
            //@+node:orkman.20050218122434.1:<< handle @delims >>
            while( i < s.length() && !is_ws( s.charAt( i ) ) && !is_nl( s, i ) )
                i += 1;
                
            if( j < i ){
            
                _startSentinelComment = s.substring( j, i );
                j = i = skip_ws( s, i );
                while( i < s.length() && !is_ws( s.charAt( i ) ) && !is_nl( s, i ) )
                    i += 1;
                _endSentinelComment = j<i ? s.substring( j, i ): "";
            
            }
            else writeError( "Bad @delims directive" );
            
            
            //@+at
            // # Put a space to protect the last delim.
            // self.putSentinel(directive + " ") # 10/23/02: put @delims, not 
            // @@delims
            // 
            // # Skip the keyword and whitespace.
            // j = i = g.skip_ws(s,k+len(tag))
            // 
            // # Get the first delim.
            // while i < len(s) and not g.is_ws(s[i]) and not g.is_nl(s,i):
            //     i += 1
            // if j < i:
            //     self.startSentinelComment = s[j:i]
            //     # Get the optional second delim.
            //     j = i = g.skip_ws(s,i)
            //     while i < len(s) and not g.is_ws(s[i]) and not 
            // g.is_nl(s,i):
            //         i += 1
            //     self.endSentinelComment = g.choose(j<i, s[j:i], "")
            // else:
            //     self.writeError("Bad @delims directive")
            //@-at
            //@nonl
            //@-node:orkman.20050218122434.1:<< handle @delims >>
            //@nl
        
        }
        else if( match_word( s, k, "@language" ) ){
        
            //@        << handle @language >>
            //@+node:orkman.20050218122434.2:<< handle @language >>
            putSentinel( '@' + directive );
            
            i = k + "@language".length();
            i = skip_ws( s, i );
            j = skip_c_id( s, i );
            final String language = s.substring( i, j );
            
            final String[] delims = set_delims_from_language( language );
            final String delim1 = delims[ 0 ]; final String delim2 = delims[ 1 ]; final String delim3 = delims[ 2 ];
            
            if( delim1 != null ){
                _startSentinelComment = delim1;
                _endSentinelComment = "";
            
            
            }
            else if( delim2 != null && delim3 != null ){
                
                _startSentinelComment = delim2;
                _endSentinelComment = delim3;
            
            
            }
            else{
                
               //line = get_line( s, i );
            
            
            }
            
            
            
            //@+at
            // self.putSentinel("@" + directive)
            // 
            // # Skip the keyword and whitespace.
            // i = k + len("@language")
            // i = g.skip_ws(s,i)
            // j = g.skip_c_id(s,i)
            // language = s[i:j]
            // 
            // delim1,delim2,delim3 = g.set_delims_from_language(language)
            // 
            // # g.trace(delim1,delim2,delim3)
            // 
            // # Returns a tuple (single,start,end) of comment delims
            // if delim1:
            //     self.startSentinelComment = delim1
            //     self.endSentinelComment = ""
            // elif delim2 and delim3:
            //     self.startSentinelComment = delim2
            //     self.endSentinelComment = delim3
            // else:
            //     line = g.get_line(s,i)
            //     g.es("Ignoring bad @language directive: %s" % 
            // line,color="blue")
            //@-at
            //@nonl
            //@-node:orkman.20050218122434.2:<< handle @language >>
            //@nl
        
        }
        else if( match_word( s, k, "@comment" ) ){
        
            //@        << handle @comment >>
            //@+node:orkman.20050218122434.3:<< handle @comment >>
            putSentinel( '@' + directive );
            j = skip_line( s, i );
            final String line = s.substring( i, j  );
            final String[] delims = set_delims_from_string( line );
            final String delim1 = delims[ 0 ]; final String delim2 = delims[ 1 ]; final String delim3 = delims[ 2 ];
            
            if( delim1 != null ){
            
                _startSentinelComment = delim1;
                _endSentinelComment = null;
            
            
            }
            else if ( delim2 != null && delim3 != null ){
            
                _startSentinelComment = delim2;
                _endSentinelComment = delim3;
            
            }
            else{
            
            
            
            }
            
            
            //@+at
            // self.putSentinel("@" + directive)
            // 
            // j = g.skip_line(s,i)
            // line = s[i:j]
            // delim1,delim2,delim3 = g.set_delims_from_string(line)
            // 
            // # g.trace(delim1,delim2,delim3)
            // 
            // # Returns a tuple (single,start,end) of comment delims
            // if delim1:
            //     self.startSentinelComment = delim1
            //     self.endSentinelComment = None
            // elif delim2 and delim3:
            //     self.startSentinelComment = delim2
            //     self.endSentinelComment = delim3
            // else:
            //     g.es("Ignoring bad @comment directive: %s" % 
            // line,color="blue")
            //@-at
            //@nonl
            //@-node:orkman.20050218122434.3:<< handle @comment >>
            //@nl
        
        }
        else if( match_word( s, k, "@last" ) ) putSentinel( "@@last" );
        else if( match_word( s, k, "@first" ) ) putSentinel( "@@first" );
        else putSentinel( '@' + directive );
        i = skip_line( s, k );
        
    
    //@+at
    // def putDirective(self,s,i):
    //     """Output a sentinel a directive or reference s."""
    // 
    //     tag = "@delims"
    //     assert(i < len(s) and s[i] == '@')
    //     k = i
    //     j = g.skip_to_end_of_line(s,i)
    //     directive = s[i:j]
    //     if g.match_word(s,k,"@delims"):
    // 
    //         << handle @delims >>
    // 
    //     elif g.match_word(s,k,"@language"):
    // 
    //         << handle @language >>
    // 
    //     elif g.match_word(s,k,"@comment"):
    // 
    //         << handle @comment >>
    // 
    //     elif g.match_word(s,k,"@last"):
    //         self.putSentinel("@@last") # 10/27/03: Convert to an verbatim 
    // line _without_ anything else.
    //     elif g.match_word(s,k,"@first"):
    //         self.putSentinel("@@first") # 10/27/03: Convert to an verbatim 
    // line _without_ anything else.
    //     else:
    //         self.putSentinel("@" + directive)
    //     i = g.skip_line(s,k)
    //     return i
    //@-at
    //@@c
    
        return i;   
        
    }
    //@-node:orkman.20050218122434:putDirective  (handles @delims,@comment,@language) 4.x
    //@+node:orkman.20050215185022.1:Make sure all lines end in a newline
    //@+at
    // # 11/20/03: except in nosentinel mode.
    // # 1/30/04: and especially in scripting mode.
    // # If we add a trailing newline, we'll generate an @nonl sentinel below.
    // 
    // if s:
    //     trailingNewlineFlag = s and s[-1] == '\n'
    //     if at.sentinels and not trailingNewlineFlag:
    //         s = s + '\n'
    // else:
    //     trailingNewlineFlag = True # don't need to generate an @nonl
    //@-at
    //@nonl
    //@-node:orkman.20050215185022.1:Make sure all lines end in a newline
    //@+node:orkman.20050217115715:@others
    //@+node:orkman.20050217115715.1:inAtOthers
    public final boolean inAtOthers( final PositionSpecification p ){
    
        if( p.isVisited() ) return false;
    
        final String h = p.headString(); final int i = skip_ws( h, 0 );
        final Object[] data = isSectionName( h, i );
        final boolean isSection = (Boolean)data[ 0 ];
        if( isSection )
            return false;
        if( p.isAtIgnoreNode() )
            return false;
        else
            return true;
    
    }
    
    
    //@+at
    // def inAtOthers(self,p):
    //     """Returns True if p should be included in the expansion of the 
    // at-others directive
    //     in the body text of p's parent."""
    // 
    //     # Return False if this has been expanded previously.
    //     if  p.v.isVisited():
    //         # g.trace("previously visited",p.v)
    //         return False
    //     # Return False if this is a definition node.
    //     h = p.headString() ; i = g.skip_ws(h,0)
    //     isSection,junk = self.isSectionName(h,i)
    //     if isSection:
    //         # g.trace("is section",p)
    //         return False
    // 
    //     # Return False if p's body contains an @ignore directive.
    //     if p.isAtIgnoreNode():
    //         # g.trace("is @ignore",p)
    //         return False
    //     else:
    //         # g.trace("ok",p)
    //         return True
    //@-at
    //@nonl
    //@-node:orkman.20050217115715.1:inAtOthers
    //@+node:orkman.20050217115715.2:putAtOthersChild
    public final void putAtOthersChild( final PositionSpecification p ){
    
        final int[] data = scanForClonedSibs( p.acquireV() );
        final int clonedSibs = data[ 0 ];
        final int thisClonedSibIndex = data[ 1 ];
        if( clonedSibs > 1 && thisClonedSibIndex == 1 )
            writeError( "Cloned siblings are not valid in @thin trees" );
            
        putOpenNodeSentinel( p, false, true, false );
        putBody( p, true, false );
        final Iterator< PositionSpecification > ci = p.getChildrenIterator();
        while( ci.hasNext() ){
            final PositionSpecification child = ci.next();
            if( inAtOthers( child ) )
                putAtOthersChild( child );
        
        
        
        }
        putCloseNodeSentinel( p, false, true, false );
    
    
    }
    
    
    //@+at
    // def putAtOthersChild(self,p):
    //     at = self
    // 
    //     clonedSibs,thisClonedSibIndex = at.scanForClonedSibs(p.v)
    //     if clonedSibs > 1 and thisClonedSibIndex == 1:
    //         at.writeError("Cloned siblings are not valid in @thin trees")
    // 
    //     at.putOpenNodeSentinel(p,inAtOthers=True)
    //     at.putBody(p)
    //     # Insert expansions of all children.
    //     for child in p.children_iter():
    //         if at.inAtOthers(child):
    //             at.putAtOthersChild(child)
    //     at.putCloseNodeSentinel(p,inAtOthers=True)
    //@-at
    //@-node:orkman.20050217115715.2:putAtOthersChild
    //@+node:orkman.20050217115715.3:putAtOthersLine
    public final void putAtOthersLine( final String s, final int i, final PositionSpecification p ){
    
    
        final int[] data = skip_leading_ws_with_indent( s, i , _tabWidth );
        final int j = data[ 0 ];
        final int delta = data[ 1 ];
        
        putLeadInSentinel( s, i, j, delta );
        
        _indent += delta;
        if( _leadingWs != null && !_leadingWs.equals( "" ) ){
    
            putSentinel( "@" + _leadingWs + "@+others" );
            
            }
        else{
        
            putSentinel( "@+others" );
            
            }
            
        final Iterator< PositionSpecification > ci = p.getChildrenIterator();
        while( ci.hasNext() ){
        
            final PositionSpecification child = ci.next();
            if( inAtOthers( child ) )
                putAtOthersChild( child );
        
        
        }
        
        putSentinel( "@-others" );
        _indent -= delta;
    
    
    }
    
    //@+at
    // def putAtOthersLine (self,s,i,p):
    //     """Put the expansion of @others."""
    //     at = self
    //     j,delta = g.skip_leading_ws_with_indent(s,i,at.tab_width)
    //     at.putLeadInSentinel(s,i,j,delta)
    // 
    //     at.indent += delta
    //     if at.leadingWs:
    //         at.putSentinel("@" + at.leadingWs + "@+others")
    //     else:
    //         at.putSentinel("@+others")
    //     for child in p.children_iter():
    //         if at.inAtOthers(child):
    //             at.putAtOthersChild(child)
    // 
    //     at.putSentinel("@-others")
    //     at.indent -= delta
    //@-at
    //@nonl
    //@-node:orkman.20050217115715.3:putAtOthersLine
    //@-node:orkman.20050217115715:@others
    //@+node:orkman.20050220130419:atFile.scanAllDirectives
    //@+at 
    //@nonl
    // Once a directive is seen, no other related directives in nodes further 
    // up the tree have any effect.  For example, if an @color directive is 
    // seen in node p, no @color or @nocolor directives are examined in any 
    // ancestor of p.
    // 
    // This code is similar to Commands.scanAllDirectives, but it has been 
    // modified for use by the atFile class.
    //@-at
    //@@c
    //@+at
    // def 
    // scanAllDirectives(self,p,scripting=False,importing=False,reading=False):
    //     """Scan position p and p's ancestors looking for directives,
    //     setting corresponding atFile ivars.
    //     """
    // 
    //     c = self.c
    //@-at
    //@@c
    public void scanAllDirectives( PositionSpecification p, boolean scripting, boolean importing, boolean reading ){
    
        
        CommanderSpecification c = _c;
        String path = null;
        String base = null;
        //@    << Set ivars >>
        //@+node:orkman.20050220130419.1:<< Set ivars >>
        _page_width = c.acquirePage_width();
        _tabWidth = c.acquireTab_width();
        
        _default_directory = null;
        String[] delims = set_delims_from_language( c.acquireTarget_language() );
        String delim1 = delims[ 0 ]; String delim2 = delims[ 1 ]; String delim3 = delims[ 2 ];
        _language = c.acquireTarget_language();
        _encoding = c.acquireDefault_derived_file_encoding();
        _output_newline = c.acquireOutputNewline();
        
        
        //@+at
        // self.page_width = self.c.page_width
        // self.tab_width  = self.c.tab_width
        // 
        // self.default_directory = None # 8/2: will be set later.
        // 
        // delim1, delim2, delim3 = 
        // g.set_delims_from_language(c.target_language)
        // self.language = c.target_language
        // 
        // self.encoding = c.config.default_derived_file_encoding
        // self.output_newline = g.getOutputNewline(c=self.c) # 4/24/03: 
        // initialize from config settings.
        //@-at
        //@nonl
        //@-node:orkman.20050220130419.1:<< Set ivars >>
        //@nl
        //@    << Set path from @file node >>
        //@+node:orkman.20050220130419.2:<< Set path from @file node >>
        final String name = p.anyAtFileNodeName();
        String theDir = name != null? c.acquireOs_path_dirname( name ) : null;
        
        if( theDir != null && theDir.length() > 0 && c.g_os_path_isabs( theDir ) ){
            
            if( c.g_os_path_exists( theDir ) )
                _default_directory = theDir;
            else{
                _default_directory = c.g_makeAllNonExistentDirectories( theDir );
                if( _default_directory == null )
                    error( "Directory \"" + theDir + "\" does not exist" );
        
        
            }
        
        }
        
        
        //@+at
        // # An absolute path in an @file node over-rides everything else.
        // # A relative path gets appended to the relative path by the open 
        // logic.
        // 
        // name = p.anyAtFileNodeName() # 4/28/04
        // 
        // theDir = g.choose(name,g.os_path_dirname(name),None)
        // 
        // if theDir and len(theDir) > 0 and g.os_path_isabs(theDir):
        //     if g.os_path_exists(theDir):
        //         self.default_directory = theDir
        //     else: # 9/25/02
        //         self.default_directory = 
        // g.makeAllNonExistentDirectories(theDir)
        //         if not self.default_directory:
        //             self.error("Directory \"" + theDir + "\" does not 
        // exist")
        //@-at
        //@nonl
        //@-node:orkman.20050220130419.2:<< Set path from @file node >>
        //@nl
        Map old = new HashMap();
        Iterator< PositionSpecification > pi = p.getSelfAndParentsIterator();
    
    //@+at
    //     old = {}
    //     for p in p.self_and_parents_iter():
    //         s = p.v.t.bodyString
    //         theDict = g.get_directives_dict(s)
    //@-at
    //@@c
    
        while( pi.hasNext() ){
            
            p = pi.next();
            final String s = p.bodyString();
            Map theDict = c.g_get_directives_dict( s );
            //@        << Test for @path >>
            //@+node:orkman.20050220130419.3:<< Test for @path >>
            if( _default_directory == null && !old.containsKey( "path" ) && theDict.containsKey( "path" ) ){
            
            
                final Integer k = (Integer)theDict.get( "path" );
                //@    << compute relative path from s[k:] >>
                //@+node:orkman.20050220130419.4:<< compute relative path from s[k:] >>
                int j, i;
                j = i = k + "@path".length();
                i = skip_to_end_of_line( s, i );
                path = s.substring( j, i ).trim();
                
                //final int r_len = remove.length();
                //while( s.startsWith( remove ) )
                //    s = s.substring( r_len );
                //while( s.endsWith( remove ) )
                //    s = s.substring( 0, s.length() - r_len );
                //path = s;
                
                
                
                final int pend = path.length() - 1;
                if( path.length() > 2 && (
                     ( path.charAt( 0 ) == '<' && path.charAt( pend ) == '>' ) ||
                    ( path.charAt( 0 ) == '"' && path.charAt( pend ) == '"' ) ) )
                        path = path.substring( 1 , pend );
                path = path.trim();
                
                //@+at
                // j = i = k + len("@path")
                // i = g.skip_to_end_of_line(s,i)
                // path = string.strip(s[j:i])
                // 
                // # Remove leading and trailing delims if they exist.
                // if len(path) > 2 and (
                //     (path[0]=='<' and path[-1] == '>') or
                //     (path[0]=='"' and path[-1] == '"') ):
                //     path = path[1:-1]
                // path = path.strip()
                // 
                // if 0: # 11/14/02: we want a _relative_ path, not an 
                // absolute path.
                //     path = g.os_path_join(g.app.loadDir,path)
                //@-at
                //@nonl
                //@-node:orkman.20050220130419.4:<< compute relative path from s[k:] >>
                //@nl
                if( path != null && path.length() > 0 ){
                
                    base = c.g_getBaseDirectory();
                    
                    path = c.g_os_path_join( base, path );
                    
                    if( c.g_os_path_isabs( path ) ){
                        //@            << handle absolute path >>
                        //@+node:orkman.20050220130419.5:<< handle absolute path >>
                        if( c.g_os_path_exists( path ) )
                            _default_directory = path;
                        else{
                        
                            _default_directory = c.g_makeAllNonExistentDirectories( path );
                            if( _default_directory == null )
                                error( "invalid @path: " + path );
                        
                        
                        
                        }
                        //@+at
                        // # path is an absolute path.
                        // 
                        // if g.os_path_exists(path):
                        //     self.default_directory = path
                        // else: # 9/25/02
                        //     self.default_directory = 
                        // g.makeAllNonExistentDirectories(path)
                        //     if not self.default_directory:
                        //         self.error("invalid @path: " + path)
                        //@-at
                        //@-node:orkman.20050220130419.5:<< handle absolute path >>
                        //@nl
                    }
                    else{
                    
                        error("ignoring bad @path: " + path);
                    
                    }
                
                
                
                
                }
                else error("ignoring empty @path");
            
            
            
            
            
            }
            
            //@+at
            // # We set the current director to a path so future writes will 
            // go to that directory.
            // 
            // if not self.default_directory and not old.has_key("path") and 
            // theDict.has_key("path"):
            // 
            //     k = theDict["path"]
            //     << compute relative path from s[k:] >>
            //     if path and len(path) > 0:
            //         base = g.getBaseDirectory(c=c) # returns "" on error.
            //         path = g.os_path_join(base,path)
            //         if g.os_path_isabs(path):
            //             << handle absolute path >>
            //         else:
            //             self.error("ignoring bad @path: " + path)
            //     else:
            //         self.error("ignoring empty @path")
            //@-at
            //@nonl
            //@-node:orkman.20050220130419.3:<< Test for @path >>
            //@nl
            //@        << Test for @encoding >>
            //@+node:orkman.20050220130419.6:<< Test for @encoding >>
            if( ! old.containsKey( "encoding" ) && theDict.containsKey( "encoding" ) ){
            
            
                final String e = c.g_scanAtEncodingDirective( s, theDict );
                if( e != null )
                    _encoding = e;
            
            
            }
            
            //@+at
            // if not old.has_key("encoding") and theDict.has_key("encoding"):
            //     e = g.scanAtEncodingDirective(s,theDict)
            //     if e:
            //         self.encoding = e
            //@-at
            //@nonl
            //@-node:orkman.20050220130419.6:<< Test for @encoding >>
            //@nl
            //@        << Test for @comment and @language >>
            //@+node:orkman.20050220130419.7:<< Test for @comment and @language >>
            if( old.containsKey( "comment" ) || old.containsKey( "language" ) );
            else if( theDict.containsKey( "comment" ) ){
            
                final Integer k = (Integer)theDict.get( "comment" );
                delims = set_delims_from_string( s.substring( k ) );
                delim1 = delims[ 0 ]; delim2 = delims[ 1 ]; delim3 = delims[ 2 ];
                
            }
            else if( theDict.containsKey( "language" ) ){
            
                final Integer k = (Integer)theDict.get( "language" );
                delims = c.g_set_language(  s, k ); //s.substring( k ) );
                _language = delims[ 0 ]; delim1 = delims[ 1 ]; delim2 = delims[ 2 ]; delim3 = delims[ 3 ];
            
            
            }
            
            
            
            //@+at
            // # 10/17/02: @language and @comment may coexist in @file trees.
            // # For this to be effective the @comment directive should follow 
            // the @language directive.
            // 
            // # 1/23/05: Any previous @language or @comment prevents 
            // processing up the tree.
            // # This code is now like the code in tangle.scanAlldirectives.
            // 
            // if old.has_key("comment") or old.has_key("language"):
            //      pass # Do nothing more.
            // 
            // elif theDict.has_key("comment"):
            //     k = theDict["comment"]
            //     delim1, delim2, delim3 = g.set_delims_from_string(s[k:])
            // 
            // elif theDict.has_key("language"):
            //     k = theDict["language"]
            //     self.language,delim1,delim2,delim3 = g.set_language(s,k)
            //@-at
            //@nonl
            //@-node:orkman.20050220130419.7:<< Test for @comment and @language >>
            //@nl
            //@        << Test for @header and @noheader >>
            //@+node:orkman.20050220130419.8:<< Test for @header and @noheader >>
            if( theDict.containsKey( "header" ) && theDict.containsKey( "noheader" ) )
                p.g_es( "conflicting @header and @noheader directives");
            
            //@+at
            // # EKR: 10/10/02: perform the sames checks done by 
            // tangle.scanAllDirectives.
            // if theDict.has_key("header") and theDict.has_key("noheader"):
            //     g.es("conflicting @header and @noheader directives")
            //@-at
            //@nonl
            //@-node:orkman.20050220130419.8:<< Test for @header and @noheader >>
            //@nl
            //@        << Test for @lineending >>
            //@+node:orkman.20050220130419.9:<< Test for @lineending >>
            if( !old.containsKey( "lineending" ) && theDict.containsKey( "lineending" ) ){
            
            
                final String lineending = c.g_scanAtLineendingDirective(s,theDict);
                if( lineending != null ){
                
                    _explicitLineEnding = true;
                    _output_newline = lineending;
                
                
                } 
            
            
            
            
            }
            //@+at
            // if not old.has_key("lineending") and 
            // theDict.has_key("lineending"):
            //     lineending = g.scanAtLineendingDirective(s,theDict)
            //     if lineending:
            //         self.explicitLineEnding = True
            //         self.output_newline = lineending
            //@-at
            //@-node:orkman.20050220130419.9:<< Test for @lineending >>
            //@nl
            //@        << Test for @pagewidth >>
            //@+node:orkman.20050220130419.10:<< Test for @pagewidth >>
            if( theDict.containsKey( "pagewidth" ) && ! old.containsKey( "pagewidth" ) ){
            
                final Integer w = c.g_scanAtPagewidthDirective(s,theDict,true);
                if( w!= null && w > 0 )
                    _page_width = w;
            
            
            }
            //@+at
            // if theDict.has_key("pagewidth") and not 
            // old.has_key("pagewidth"):
            //     w = 
            // g.scanAtPagewidthDirective(s,theDict,issue_error_flag=True)
            //     if w and w > 0:
            //         self.page_width = w
            //@-at
            //@nonl
            //@-node:orkman.20050220130419.10:<< Test for @pagewidth >>
            //@nl
            //@        << Test for @tabwidth >>
            //@+node:orkman.20050220130419.11:<< Test for @tabwidth >>
            if( theDict.containsKey( "tabwidth" ) && ! old.containsKey( "tabwidth" ) ){
            
                final Integer w = c.g_scanAtTabwidthDirective( s, theDict, true );
                if( w != null && w != 0 )
                    _tabWidth = w;
            
            
            
            }
            
            //@+at
            // if theDict.has_key("tabwidth") and not old.has_key("tabwidth"):
            //     w = 
            // g.scanAtTabwidthDirective(s,theDict,issue_error_flag=True)
            //     if w and w != 0:
            //         self.tab_width = w
            // 
            //@-at
            //@-node:orkman.20050220130419.11:<< Test for @tabwidth >>
            //@nl
            old.putAll(theDict);
            
            
            }
    //@+at
    //         old.update(theDict)
    //@-at
    //@@c
        //@    << Set current directory >>
        //@+node:orkman.20050220130419.12:<< Set current directory >>
        if( c.hasFrame() && _default_directory == null ){
        
            base = c.g_getBaseDirectory();
            final String[] directories = new String[]{ c.acquireTangle_directory(), c.acquireFrOpenDirectory(), c.acquireOpenDirectory() };
            for( String theDir2: directories ){
                theDir = theDir2;
                if( theDir != null && theDir.length() > 0 ){
                    theDir = c.g_os_path_join( base, theDir );
                    if( c.g_os_path_isabs( theDir ) ){
                        if( c.g_os_path_exists( theDir ) ){
                             _default_directory = theDir; 
                             break;
                        
                        }
                        else _default_directory = c.g_makeAllNonExistentDirectories( theDir );
                    
                    
                    
                    
                    }
                
                
                
                
                
                }
            
            
            }
        
        }
        
        if( _default_directory == null && !scripting && !importing ){
        
        
            c.g_trace();
            error("No absolute directory specified anywhere.");
            _default_directory = "";    
        
        
        
        
        }
        
        //@+at
        // # This code is executed if no valid absolute path was specified in 
        // the @file node or in an @path directive.
        // 
        // if c.frame and not self.default_directory:
        //     base = g.getBaseDirectory(c=c) # returns "" on error.
        //     for theDir in 
        // (c.tangle_directory,c.frame.openDirectory,c.openDirectory):
        //         if theDir and len(theDir) > 0:
        //             theDir = g.os_path_join(base,theDir)
        //             if g.os_path_isabs(theDir): # Errors may result in 
        // relative or invalid path.
        //                 if g.os_path_exists(theDir):
        //                     self.default_directory = theDir ; break
        //                 else: # 9/25/02
        //                     self.default_directory = 
        // g.makeAllNonExistentDirectories(theDir)
        // 
        // if not self.default_directory and not scripting and not importing:
        //     # This should never happen: c.openDirectory should be a good 
        // last resort.
        //     g.trace()
        //     self.error("No absolute directory specified anywhere.")
        //     self.default_directory = ""
        //@-at
        //@-node:orkman.20050220130419.12:<< Set current directory >>
        //@nl
    //@+at
    //     if not importing and not reading:
    //@-at
    //@@c
          //  # 5/19/04: don't override comment delims when reading!
        if( !importing && !reading )
            //@        << Set comment strings from delims >>
            //@+node:orkman.20050220130419.13:<< Set comment strings from delims >>
            if( scripting ){
            
                delims = set_delims_from_language( "python" );
                delim1 = delims[ 0 ]; delim2 = delims[ 1 ]; delim3 = delims[ 2 ];
                _language = "python";
            
            
            }
            
            if( delim1 != null ){
            
                _startSentinelComment = delim1;
                _endSentinelComment = "";
            
            
            }
            else if ( delim2 != null && delim3 != null ){
            
                _startSentinelComment = delim2;
                _endSentinelComment = delim3;
                
            
            }
            else{
            
                p.g_es( "Unknown language: using Python comment delimiters" );
                final String o1 = String.format( "c.target_language: %s", c.acquireTarget_language() );
                p.g_es( o1 );
                final String o2 = String.format( "delim1,delim2,delim3: %s %s %s",delim1,delim2,delim3);
                p.g_es( o2 );
                _startSentinelComment = "#"; ///# This should never happen!
                _endSentinelComment = "";
            
            
            
            }
            //@+at
            // if scripting:
            //     # Force Python language.
            //     delim1,delim2,delim3 = g.set_delims_from_language("python")
            //     self.language = "python"
            // # Use single-line comments if we have a choice.
            // # 8/2/01: delim1,delim2,delim3 now correspond to line,start,end
            // 
            // if delim1:
            //     self.startSentinelComment = delim1
            //     self.endSentinelComment = "" # Must not be None.
            // elif delim2 and delim3:
            //     self.startSentinelComment = delim2
            //     self.endSentinelComment = delim3
            // else: # Emergency!
            //     # assert(0)
            //     g.es("Unknown language: using Python comment delimiters")
            //     g.es("c.target_language:",c.target_language)
            //     g.es("delim1,delim2,delim3:",delim1,delim2,delim3)
            //     self.startSentinelComment = "#" # This should never happen!
            //     self.endSentinelComment = ""
            // # 
            // g.trace(repr(self.startSentinelComment),repr(self.endSentinelComment))
            //@-at
            //@nonl
            //@-node:orkman.20050220130419.13:<< Set comment strings from delims >>
            //@nl
         
    }
    //@nonl
    //@-node:orkman.20050220130419:atFile.scanAllDirectives
    //@+node:orkman.20050220171955:initWriteIvars
    //@+at
    // def initWriteIvars(self,root,targetFileName,
    //     nosentinels=False,
    //     thinFile=False,
    //     scriptWrite=False,
    //     toString=False):
    //     print 'initing write vars'
    //     self.initCommonIvars()
    //@-at
    //@@c
    public void initWriteIvars( final PositionSpecification root, final String targetFileName,
                                final boolean nosentinels,final boolean thinFile,final boolean scriptWrite,
                                final boolean toString ){
                                
        initCommonIvars();
        //@    << init ivars for writing >>
        //@+node:orkman.20050220171955.1:<< init ivars for writing >>>
        _docKind = null;
        _explicitLineEnding = false;
        _fileChangedFlag = false;
        _shortFileName = "";
        _thinFile = false;
        
        if( toString ){
        
            _outputFile = _c.g_fileLikeObject();
            _stringOutput = "";
            _targetFileName = _outputFileName = "<string-file>";
            //self.outputFile = g.fileLikeObject()
            //self.stringOutput = ""
            //self.targetFileName = self.outputFileName = "<string-file>"
        
        
        
        }
        else{
        
            _outputFile = null; // # The temporary output file.
            _stringOutput = null;
            _targetFileName = _outputFileName = "";
        
        
        
        
        }
        
        
        //@+at
        // When tangling, we first write to a temporary output file. After 
        // tangling is
        // temporary file. Otherwise we delete the old target file and rename 
        // the temporary
        // file to be the target file.
        //@-at
        //@@c
        //@+at
        // self.docKind = None
        // self.explicitLineEnding = False # True: an @lineending directive 
        // specifies the ending.
        // self.fileChangedFlag = False # True: the file has actually been 
        // updated.
        // self.shortFileName = "" # short version of file name used for 
        // messages.
        // self.thinFile = False
        // 
        // if toString:
        //     self.outputFile = g.fileLikeObject()
        //     self.stringOutput = ""
        //     self.targetFileName = self.outputFileName = "<string-file>"
        // else:
        //     self.outputFile = None # The temporary output file.
        //     self.stringOutput = None
        //     self.targetFileName = self.outputFileName = u""
        //@-at
        //@nonl
        //@-node:orkman.20050220171955.1:<< init ivars for writing >>>
        //@nl
        scanAllDirectives( root, false ,false,false );
        if( scriptWrite ){
        
            _startSentinelComment = "#";
            _endSentinelComment = null;
        
        
        }
        
        _targetFileName = targetFileName;
        _sentinels = ! nosentinels;
        _thinFile = thinFile;
        _toString = toString;
        _root = root;   
        
    
        if( _errors == 0 ) //by having this line be _errors != 0, this caused major write bugs with any @ besides @file-thin!
            _root.clearTTnodeList();
        
        
        
        }
        
    //@+at
    //     self.scanAllDirectives(root)
    //     if scriptWrite:
    //         # Force Python comment delims for g.getScript.
    //         self.startSentinelComment = "#"
    //         self.endSentinelComment = None
    // 
    //     # Init state from arguments.
    //     self.targetFileName = targetFileName
    //     self.sentinels = not nosentinels
    //     self.thinFile = thinFile
    //     self.toString = toString
    //     self.root = root
    //     # Bug fix: 12/31/04: Init all other ivars even if there is an 
    // error.
    //     if not self.errors:
    //         self.root.v.t.tnodeList = []
    //@-at
    //@nonl
    //@-node:orkman.20050220171955:initWriteIvars
    //@+node:orkman.20050220174612:initCommonIvars
    //@+at
    // def initCommonIvars (self):
    //     """Init ivars common to both reading and writing.
    //     The defaults set here may be changed later."""
    //     # Note: Pychecker complains if about module attributes if we assign 
    // at.x instead of self.x.
    //     c = self.c
    //     if self.testing:
    //         # Save "permanent" ivars
    //         fileCommands = self.fileCommands
    //         dispatch_dict = self.dispatch_dict
    //         # Clear all ivars.
    //         g.clearAllIvars(self)
    //         # Restore permanent ivars
    //         self.testing = True
    //         self.c = c
    //         self.fileCommands = fileCommands
    //         self.dispatch_dict = dispatch_dict
    //@-at
    //@@c
    public final void initCommonIvars(){
    
        final CommanderSpecification c = _c;
        //@    << set defaults for arguments and options >>
        //@+node:orkman.20050220174612.1:<< set defaults for arguments and options >>
        _output_newline = c.acquireOutputNewline();     //c.getOutputNewline();
        
        _encoding = c.acquireDefault_derived_file_encoding();
        _endSentinelComment = "";
        _startSentinelComment = "";
        
        _default_directory = null;
        _page_width = null;
        _tabWidth = null;
        _language = null;
        
        
        //@+at
        // # These may be changed in initReadIvars or initWriteIvars.
        // 
        // # Support of output_newline option.
        // self.output_newline = g.getOutputNewline(c=c)
        // 
        // # Set by scanHeader when reading and scanAllDirectives when 
        // writing.
        // self.encoding = c.config.default_derived_file_encoding
        // self.endSentinelComment = ""
        // self.startSentinelComment = ""
        // 
        // # Set by scanAllDirectives when writing.
        // self.default_directory = None
        // self.page_width = None
        // self.tab_width  = None
        // self.startSentinelComment = ""
        // self.endSentinelComment = ""
        // self.language = None
        //@-at
        //@nonl
        //@-node:orkman.20050220174612.1:<< set defaults for arguments and options >>
        //@nl
        //@    << init common ivars >>
        //@+node:orkman.20050220174612.2:<< init common ivars >>
        _errors = 0;
        _inCode = true;
        _indent = 0;
        _pending = new ArrayList();
        _raw = false;
        _root = null;
        _root_seen = false;
        _toString = false;
        
        //@+at
        // # These may be set by initReadIvars or initWriteIvars.
        // 
        // self.errors = 0
        // self.inCode = True
        // self.indent = 0  # The unit of indentation is spaces, not tabs.
        // self.pending = util.ArrayList() #[]
        // self.raw = False # True: in @raw mode
        // self.root = None # The root of tree being read or written.
        // self.root_seen = False # True: root vnode has been handled in this 
        // file.
        // self.toString = False # True: sring-oriented read or write.
        //@-at
        //@nonl
        //@-node:orkman.20050220174612.2:<< init common ivars >>
        //@nl
        
        
    }
    //@nonl
    //@-node:orkman.20050220174612:initCommonIvars
    //@-others
    //@nonl
    //@-node:orkman.20050215170438:writing
    //@-others


}
//@nonl
//@-node:orkman.20050215122424:@thin leoBaseAtFile.java
//@-leo
