//@+leo-ver=4-thin
//@+node:zorcanda!.20051003150005:@thin LeoFileReader.java
//@@language java

import java.io.*;
import java.nio.*;
import java.util.*;
import jconstants.AtFileConstants;
import static jconstants.AtFileConstants.*;
import static java.lang.System.err;
//import static java.lang.System.out;
import static java.lang.Math.*;

public abstract class LeoFileReader{

    
    public String _filename;
    public int cloneSibCount;
    public boolean done;
    public boolean inCode;
    public int indent;
    public int tab_width;
    public List<String> lastLines;
    public String leadingWs = "";
    public PositionSpecification root;
    public boolean rootSeen;
    public boolean updateWarningGiven;
    public boolean thinFile;
    public boolean importing;
    public boolean root_seen;
    public boolean raw;
    public List< AtFileConstants > endSentinelStack;
    public List< String > out;
    public List< List< String > > outStack;
    public List< String > docOut;
    public List< String > pending;
    public List< Integer > indentStack;
    public Object t;
    public List tStack;
    public Object lastThinNode;
    public List< Object > thinNodeStack;
    public int errors;
    
    public RandomAccessFile raFile;
    public CommanderSpecification c;
    public TnodeOperations t_op;
    
    public String startSentinelComment = "";
    public String endSentinelComment ="";
    public String encoding;
    
    public List _forcedGnxPositionList;
    
    public LeoFileReader( String filename, CommanderSpecification cs, TnodeOperations to ){
    
        _filename = filename;
        lastLines = new ArrayList< String >();
        endSentinelStack = new ArrayList< AtFileConstants >();
        out = new ArrayList< String >();
        outStack = new ArrayList< List< String > >();
        docOut = new ArrayList< String >();
        pending = new ArrayList< String >();
        indentStack = new ArrayList< Integer >();
        tStack = new ArrayList();
        thinNodeStack = new ArrayList< Object >();
        _forcedGnxPositionList = new ArrayList();
        c = cs;
        t_op = to;
        try{
            raFile = new RandomAccessFile( filename, "r" );
        }
        catch( FileNotFoundException fnfe ){
        
            System.out.println( fnfe );
        
        }
        
//@+at
// # Unstacked ivars...
// at.cloneSibCount = 0
// at.done = False
// at.inCode = True
// at.indent = 0 # Changed only for sentinels.
// at.lastLines = [] # The lines after @-leo
// at.leadingWs = ""
// at.root = p
// at.rootSeen = False
// at.updateWarningGiven = False
// 
// # Stacked ivars...
// at.endSentinelStack = [at.endLeo] # We have already handled the @+leo 
// sentinel.
// at.out = [] ; at.outStack = []
// at.t = p.v.t ; at.tStack = []
// at.lastThinNode = p.v ; at.thinNodeStack = [p.v]
//@-at
//@@c    
    
    }

    
    //@    @+others
    //@+node:zorcanda!.20051004132552:sentinelDict
    public static final Map< String, AtFileConstants > sentinelDict = new HashMap< String, AtFileConstants >();
    static{
        sentinelDict.put( "@comment", startComment );
        sentinelDict.put( "@delims", startDelims );
        sentinelDict.put( "@verbatim", startVerbatim );
        sentinelDict.put( "@verbatimAfterRef", startVerbatimAfterRef );
        sentinelDict.put( "@afterref", startAfterRef );
        sentinelDict.put( "@clone", startClone );
        sentinelDict.put( "@nl", startNl );
        sentinelDict.put( "@nonl", startNonl );
        sentinelDict.put( "@+body", startBody ); sentinelDict.put( "@-body", endBody );
        sentinelDict.put( "@+all", startAll ); sentinelDict.put( "@-all", endAll );
        sentinelDict.put( "@+at", startAt ); sentinelDict.put( "@-at", endAt) ;
        sentinelDict.put( "@+doc", startDoc ); sentinelDict.put( "@-doc", endDoc);
        sentinelDict.put( "@+leo", startLeo ); sentinelDict.put( "@-leo", endLeo );
        sentinelDict.put( "@+middle", startMiddle ); sentinelDict.put( "@-middle", endMiddle );
        sentinelDict.put( "@+node", startNode ); sentinelDict.put( "@-node", endNode );
        sentinelDict.put( "@+others", startOthers); sentinelDict.put( "@-others", endOthers );
    }
    
    //@+at
    // sentinelDict = {
    // 
    //     # Unpaired sentinels: 3.x and 4.x.
    //     "@comment" : startComment,
    //     "@delims" :  startDelims,
    //     "@verbatim": startVerbatim,
    // 
    //     # Unpaired sentinels: 3.x only.
    //     "@verbatimAfterRef": startVerbatimAfterRef,
    // 
    //     # Unpaired sentinels: 4.x only.
    //     "@afterref" : startAfterRef,
    //     "@clone"    : startClone,
    //     "@nl"       : startNl,
    //     "@nonl"     : startNonl,
    // 
    //     # Paired sentinels: 3.x only.
    //     "@+body":   startBody,   "@-body":   endBody,
    // 
    //     # Paired sentinels: 3.x and 4.x.
    //     "@+all":    startAll,    "@-all":    endAll,
    //     "@+at":     startAt,     "@-at":     endAt,
    //     "@+doc":    startDoc,    "@-doc":    endDoc,
    //     "@+leo":    startLeo,    "@-leo":    endLeo,
    //     "@+middle": startMiddle, "@-middle": endMiddle,
    //     "@+node":   startNode,   "@-node":   endNode,
    //     "@+others": startOthers, "@-others": endOthers,
    // }
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004132552:sentinelDict
    //@+node:zorcanda!.20051003153333:dispatch
    public void dispatch( AtFileConstants kind, String s, int i ){
    
        switch( kind ){
    
    
            case noSentinel:
                readNormalLine( s, i );
                break;
            case startAll:
                readStartAll( s, i );
                break;
            case startAt:
                readStartAt( s, i );
                break;
            case startDoc:
                readStartDoc( s, i );
                break;
            case startLeo:
                readStartLeo( s, i );
                break;
            case startMiddle:
                readStartMiddle( s, i );
                break;
            case startNode:
                readStartNode( s, i, -1 );
                break;
            case startOthers:
                readStartOthers( s, i );
                break;
            case endAll:
                readEndAll( s, i );
                break;
            case endAt:
                readEndAt( s, i );
                break;
            case endDoc:
                readEndDoc( s, i );
                break;
            case endLeo:
                readEndLeo( s, i );
                break;
            case endMiddle:
                readEndMiddle( s, i );
                break;
            case endNode:
                readEndNode( s, i, false );
                break;
            case endOthers:
                readEndOthers( s, i );
                break;
            case startAfterRef:
                readAfterRef( s, i );
                break;
            case startClone:
                readClone( s, i );
                break;
            case startComment:
                readComment( s, i );
                break;
            case startDelims:
                readDelims( s, i );
                break;
            case startDirective:
                readDirective( s, i );
                break;
            case startNl:
                readNl( s, i );
                break;
            case startNonl:
                readNonl( s, i );
                break;
            case startRef:
                readRef( s, i );
                break;
            case startVerbatim:
                readVerbatim( s, i );
                break;
            case endBody:
                ignoreOldSentinel( s,i );
                break;
            case startBody:
                ignoreOldSentinel( s, i );
                break;
            case startVerbatimAfterRef:
                ignoreOldSentinel( s, i );
                break;
        }
    
    }
    
    //@+others
    //@+node:zorcanda!.20051003161741:readNormalLine
    public void readNormalLine( String s, int i ){
        
        //System.out.println( "READ NORMAL LINE!: " + inCode );
        if( inCode ){
        
            if( !raw ){
            
                s = removeLeadingWhitespace( s, indent, tab_width );
            
            }
            //System.out.println("OUT ADDING:" + s );
            out.add( s );
        }
        else{
        
            if( endSentinelComment.length() == 0 )
                i = skip_ws( s, 0 );
            if( match( s, i, startSentinelComment ) ){
            
                i += startSentinelComment.length();
                if( match( s, i, " " ) ) i += 1;
            
            }
            else i = skipIndent( s, 0, indent );
            
            //System.out.println( "S is:'" + s + "'" );
            //System.out.println( "I is :" + i );
            //System.out.println( i + " " + "'" + s + "'" + " " + s.length() );
            String line = s.substring( i, s.length() - 1 );
            if( line.equals( line.trim() ) )
                docOut.add( line + '\n' );
            else
                docOut.add( line );    
            //System.out.println( "DOC OUT NOW:" + docOut );
        }
    
    }
    //@nonl
    //@-node:zorcanda!.20051003161741:readNormalLine
    //@+node:zorcanda!.20051003162351:readNormalLine
    //@+at
    // def readNormalLine (self,s,i):
    // 
    //     at = self
    //     if at.inCode:
    //         if not at.raw:
    //             s = g.removeLeadingWhitespace(s,at.indent,at.tab_width)
    //         at.out.append(s)
    //     else:
    //@-at
    //@@c
            //@        << Skip the leading stuff >>
            //@+node:zorcanda!.20051003162351.1:<< Skip the leading stuff >>
            //@+at
            // if len(at.endSentinelComment) == 0:
            //     # Skip the single comment delim and a blank.
            //     i = g.skip_ws(s,0)
            //     if g.match(s,i,at.startSentinelComment):
            //         i += len(at.startSentinelComment)
            //         if g.match(s,i," "): i += 1
            // else:
            //     i = at.skipIndent(s,0,at.indent)
            // 
            //@-at
            //@-node:zorcanda!.20051003162351.1:<< Skip the leading stuff >>
            //@nl
            //@        << Append s to docOut >>
            //@+node:zorcanda!.20051003162351.2:<< Append s to docOut >>
            //@+at
            // line = s[i:-1] # remove newline for rstrip.
            // 
            // if line == line.rstrip():
            //     # no trailing whitespace: the newline is real.
            //     at.docOut.append(line + '\n')
            // else:
            //     # trailing whitespace: the newline is fake.
            //     at.docOut.append(line)
            //@-at
            //@nonl
            //@-node:zorcanda!.20051003162351.2:<< Append s to docOut >>
            //@nl
    //@nonl
    //@-node:zorcanda!.20051003162351:readNormalLine
    //@+node:zorcanda!.20051004133016:readStartAll (4.2)
    public void readStartAll( String s, int i ){
    
        int j = skip_ws( s, i );
        String leadingWs = s.substring( i, j );
        //;if( leadingWs.length() > 0 )
        out.add( leadingWs + "@all\n" );
        endSentinelStack.add( endAll );
    
    }
    
    
    //@+at
    // def readStartAll (self,s,i):
    //     """Read an @+all sentinel."""
    // 
    //     at = self
    //     j = g.skip_ws(s,i)
    //     leadingWs = s[i:j]
    //     if leadingWs:
    //         assert(g.match(s,j,"@+all"))
    //     else:
    //         assert(g.match(s,j,"+all"))
    // 
    //     # Make sure that the generated at-all is properly indented.
    //     at.out.append(leadingWs + "@all\n")
    //     at.endSentinelStack.append(at.endAll)
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004133016:readStartAll (4.2)
    //@+node:zorcanda!.20051004133047:readStartAt & readStartDoc
    public void readStartAt( String s, int i ){
    
        i += 3; int j = skip_ws( s, i ); String ws = s.substring( i,j );
        docOut = new ArrayList< String >();
        docOut.add( '@' + ws + '\n' );
        //System.out.println( "docOut now:" + docOut );
        inCode = false;
        endSentinelStack.add( endAt );
    
    
    }
    
    
    //@+at
    // def readStartAt (self,s,i):
    //     """Read an @+at sentinel."""
    //     at = self ; assert(g.match(s,i,"+at"))
    //     if 0:# new code: append whatever follows the sentinel.
    //         i += 3 ; j = at.skipToEndSentinel(s,i) ; follow = s[i:j]
    //         at.out.append('@' + follow) ; at.docOut = []
    //     else:
    //         i += 3 ; j = g.skip_ws(s,i) ; ws = s[i:j]
    //         at.docOut = ['@' + ws + '\n'] # This newline may be removed by 
    // a following @nonl
    //     at.inCode = False
    //     at.endSentinelStack.append(at.endAt)
    //@-at
    //@@c
    
    public void readStartDoc( String s, int i ){
    
        i += 4; int j = skip_ws( s, i ); String ws = s.substring( i, j );
        docOut = new ArrayList< String >();
        docOut.add( '@' + ws + '\n' );
        //System.out.println( "DOC OUT" + docOut );
        inCode = false;
        endSentinelStack.add( endDoc );
    
    }
    
    
    
    //@+at    
    // def readStartDoc (self,s,i):
    //     """Read an @+doc sentinel."""
    //     at = self ; assert(g.match(s,i,"+doc"))
    //     if 0: # new code: append whatever follows the sentinel.
    //         i += 4 ; j = at.skipToEndSentinel(s,i) ; follow = s[i:j]
    //         at.out.append('@' + follow) ; at.docOut = []
    //     else:
    //         i += 4 ; j = g.skip_ws(s,i) ; ws = s[i:j]
    //         at.docOut = ["@doc" + ws + '\n'] # This newline may be removed 
    // by a following @nonl
    //     at.inCode = False
    //     at.endSentinelStack.append(at.endDoc)
    //@-at
    //@@c
    
    
    public int skipToEndSentinel( String s, int i ){
    
        String end = endSentinelComment;
        if( end.length() > 0 ){
        
            int j = s.indexOf( end, i );
            if( j == -1 ) return skip_to_end_of_line( s, i );
            else return j;
        
        }
        else return skip_to_end_of_line( s, i );
    
    }
    
    
    //@+at
    // def skipToEndSentinel(self,s,i):
    //     at = self
    //     end = at.endSentinelComment
    //     if end:
    //         j = s.find(end,i)
    //         if j == -1:
    //             return g.skip_to_end_of_line(s,i)
    //         else:
    //             return j
    //     else:
    //         return g.skip_to_end_of_line(s,i)
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004133047:readStartAt & readStartDoc
    //@+node:zorcanda!.20051004133107:readStartLeo
    public void readStartLeo( String s, int i ){
    
    
    
    
    }
    
    
    //@+at
    // def readStartLeo (self,s,i):
    //     """Read an unexpected @+leo sentinel."""
    // 
    //     at = self
    //     assert(g.match(s,i,"+leo"))
    //     at.readError("Ignoring unexpected @+leo sentinel")
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004133107:readStartLeo
    //@+node:zorcanda!.20051004133125:readStartMiddle
    public void readStartMiddle( String s, int i ){
    
    
        readStartNode( s, i, 1 );// true );
    
    
    }
    
    
    //@+at
    // def readStartMiddle (self,s,i):
    //     """Read an @+middle sentinel."""
    //     at = self
    //     at.readStartNode(s,i,middle=True)
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004133125:readStartMiddle
    //@+node:zorcanda!.20051004133138:readStartNode (4.x)
    public void readStartNode( String s, int i, int middle ){
        
        //System.out.println( "I starts at " + i + " Middle is " + middle + " " + s.length() );
        //System.out.println( s.substring( i ) );
        if( middle != -1 ){
        
            i += 8;
        
        }
        else i += 6;
    
        String gnx = null;
    
        if( thinFile ){
            //System.out.println( "I is " + i + " S is:" + s );
            int j = s.indexOf( ':', i );
            //System.out.println( "J is " + j );
            if( j == -1 ){
            
                readError( "Expecting gnx in @+node sentinel" );
                return;
            
            }
            else{
                
                gnx = s.substring( i, j );
                i = j + 1;
            
            }
        
        }
    
        String headline;
        if( endSentinelComment.length() == 0 ){
        
            headline = rtrim( s.substring( i, s.length() - 1 ) );        
            
        }
        else{
            
            //System.out.println( "END SentinelCOmment is:" + endSentinelComment );
            int k = s.lastIndexOf( endSentinelComment, i );
            if( k == -1 ) k = s.length();
            //System.out.println( "K is " + k + " I is " + i );
            headline = rtrim( s.substring( i, k ) );
            
        
        }
        
        if( startSentinelComment.charAt( startSentinelComment.length() - 1 ) == '@' )
            headline = headline.replace( "@@", "@" );
    //@+at    
    // # Set headline to the rest of the line.
    // # Don't strip leading whitespace."
    // 
    // if len(at.endSentinelComment) == 0:
    //     headline = s[i:-1].rstrip()
    // else:
    //     k = s.rfind(at.endSentinelComment,i)
    //     headline = s[i:k].rstrip() # works if k == -1
    // 
    // # Undo the CWEB hack: undouble @ signs if the opening comment delim 
    // ends in '@'.
    // if at.startSentinelComment[-1:] == '@':
    //     headline = headline.replace('@@','@')
    //@-at
    //@@c    
    
        if( ! root_seen ){
        
            root_seen = true;
    //@+at
    // if 0: # This doesn't work so well in cooperative environments.
    //     if not at.importing:
    // 
    //         h = headline.strip()
    //         if h[:5] == "@file":
    //             i,junk,junk = g.scanAtFileOptions(h)
    //             fileName = string.strip(h[i:])
    //             if fileName != at.targetFileName:
    //                 at.readError("File name in @node sentinel does not 
    // match file's name")
    //         elif h[:8] == "@rawfile":
    //             fileName = string.strip(h[8:])
    //             if fileName != at.targetFileName:
    //                 at.readError("File name in @node sentinel does not 
    // match file's name")
    //         else:
    //             at.readError("Missing @file in root @node sentinel")
    //@-at
    //@@c    
        }
        
        int[] data = skip_leading_ws_with_indent( s, 0 , tab_width );
        i = data[ 0 ];
        int newIndent = data[ 1 ];
        indentStack.add( indent ); indent = newIndent;
        //System.out.println( i + " i and INDENT IS NOW: " + indent );
        outStack.add( out ); out = new ArrayList< String >();
        tStack.add( t );
        
        if( importing ){
        
            PositionSpecification p = createImportedNode( root, c, headline );
            t = p.get_T();
        
        }
        else if( thinFile ){
            
            //System.out.println( lastThinNode );
            thinNodeStack.add( lastThinNode );
            //System.out.println( "PRE CTC4!" );
            lastThinNode =  createThinChild4( gnx, headline );
            //System.out.println( lastThinNode );
            t = t_op.getT( lastThinNode );//lastThinNode.get_T();
        
        }
        else t = findChild4( headline );
        
        
        endSentinelStack.add( endNode );
        
    }
    
    
    //@+at
    // def readStartNode (self,s,i,middle=False):
    //     """Read an @+node or @+middle sentinel."""
    //     at = self
    //     if middle:
    //         assert(g.match(s,i,"+middle:"))
    //         i += 8
    //     else:
    //         assert(g.match(s,i,"+node:"))
    //         i += 6
    //     if at.thinFile:
    //         << set gnx and bump i >>
    //     << Set headline, undoing the CWEB hack >>
    //     if not at.root_seen:
    //         at.root_seen = True
    //         << Check the filename in the sentinel >>
    // 
    //     i,newIndent = g.skip_leading_ws_with_indent(s,0,at.tab_width)
    //     at.indentStack.append(at.indent) ; at.indent = newIndent
    //     at.outStack.append(at.out) ; at.out = []
    //     at.tStack.append(at.t)
    // 
    //     if at.importing:
    //         p = at.createImportedNode(at.root,at.c,headline)
    //         at.t = p.v.t
    //     elif at.thinFile:
    //         at.thinNodeStack.append(at.lastThinNode)
    //         at.lastThinNode = v = at.createThinChild4(gnx,headline)
    //         at.t = v.t
    //     else:
    //         at.t = at.findChild4(headline)
    //     at.endSentinelStack.append(at.endNode)
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004133138:readStartNode (4.x)
    //@+node:zorcanda!.20051004133159:readStartOthers
    public void readStartOthers( String s, int i ){
    
    
        int j = skip_ws( s, i );
        //System.out.println( "I is " + i + " J is " + j + " For:" + s + " " + s.length() );
        String leadingWs = s.substring( i, j );
        if( leadingWs.length() > 0 );
        else;
        
        out.add( leadingWs + "@others\n" );
        endSentinelStack.add( endOthers );
    
    
    }
    
    
    
    //@+at
    // def readStartOthers (self,s,i):
    //     """Read an @+others sentinel."""
    // 
    //     at = self
    //     j = g.skip_ws(s,i)
    //     leadingWs = s[i:j]
    //     if leadingWs:
    //         assert(g.match(s,j,"@+others"))
    //     else:
    //         assert(g.match(s,j,"+others"))
    // 
    //     # Make sure that the generated at-others is properly indented.
    //     at.out.append(leadingWs + "@others\n")
    //     at.endSentinelStack.append(at.endOthers)
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004133159:readStartOthers
    //@+node:zorcanda!.20051004133215:readEndAll (4.2)
    public void readEndAll( String s, int i ) {
    
        popSentinelStack( endAll );
    
    }
    
    
    //@+at
    // def readEndAll (self,s,i):
    //     """Read an @-all sentinel."""
    //     at = self
    //     at.popSentinelStack(at.endAll)
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004133215:readEndAll (4.2)
    //@+node:zorcanda!.20051004133250:readEndAt & readEndDoc
    public void readEndAt( String s, int i ){
    
        readLastDocLine( "@" );
        popSentinelStack( endAt );
        inCode = true;
    
    
    
    }
    
    
    //@+at
    // def readEndAt (self,s,i):
    //     """Read an @-at sentinel."""
    // 
    //     at = self
    //     at.readLastDocLine("@")
    //     at.popSentinelStack(at.endAt)
    //     at.inCode = True
    //@-at
    //@@c
    
    public void readEndDoc( String s, int i ){
    
    
        readLastDocLine( "@doc" );
        popSentinelStack( endDoc );
        inCode = true;
    
    
    }
    
    
    
    //@+at        
    // def readEndDoc (self,s,i):
    //     """Read an @-doc sentinel."""
    // 
    //     at = self
    //     at.readLastDocLine("@doc")
    //     at.popSentinelStack(at.endDoc)
    //     at.inCode = True
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004133250:readEndAt & readEndDoc
    //@+node:zorcanda!.20051004133310:readEndLeo
    public void readEndLeo( String s, int i ){
    
        while( true ){
        
            //s = readLine( inputFile );
            s = readLine();
            if( s == null ) s = "";
            if( s.length() == 0 ) break;
            lastLines.add( s );
        
        }
        
        done = true;
    
    }
    
    //@+at
    // def readEndLeo (self,s,i):
    //     """Read an @-leo sentinel."""
    //     at = self
    // 
    //     # Ignore everything after @-leo.
    //     # Such lines were presumably written by @last.
    //     while 1:
    //         s = at.readLine(at.inputFile)
    //         if len(s) == 0: break
    //         at.lastLines.append(s) # Capture all trailing lines, even if 
    // empty.
    // 
    //     at.done = True
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004133310:readEndLeo
    //@+node:zorcanda!.20051004133329:readEndMiddle
    public void readEndMiddle( String s, int i ){
    
    
        readEndNode( s, i , true );
    
    
    }
    
    
    //@+at
    // def readEndMiddle (self,s,i):
    //     """Read an @-middle sentinel."""
    //     at = self
    //     at.readEndNode(s,i,middle=True)
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004133329:readEndMiddle
    //@+node:zorcanda!.20051004133343:readEndNode (4.x)
    public void readEndNode( String s, int i, boolean middle ){
    
        raw = false;
        //System.out.println( "Out is " + out );
        s = join( "", out );
    
        if( importing )    
            t_op.insert( t, 0, s );//t._bodyString.insert( 0, s );
        else if( middle );
        else{
            
            String old;
            boolean _hasBody = t_op.hasBody( t );
            boolean _hasTempBody = t_op.hasTempBodyString( t );
            String _body = t_op.getBody( t );
            if( _hasTempBody && !s.equals( t_op.getTempBodyString( t ) )) //t.getTempBodyString() ) )
                old = t_op.getTempBodyString( t ); //old = t.getTempBodyString();
            else if( _hasBody && !s.equals( _body ) )
                old = _body; //t_op.getBody( t );//old = t.getBody();
            else
                old = "";
                
            if( old.length() > 0 && t != root.get_T() ){
            
                //@            << indicate that the node has been changed >>
                //@+node:zorcanda!.20051004133343.1:<< indicate that the node has been changed >>
                
                 //@ << bump at.correctedLines and tell about the correction >>
                 //@+node:zorcanda!.20051004133343.2:<< bump at.correctedLines and tell about the correction >>
                 //@+at
                 // 
                 // # Report the number of corrected nodes.
                 // at.correctedLines += 1
                 // 
                 // found = False
                 // for p in at.perfectImportRoot.self_and_subtree_iter():
                 //     if p.v.t == at.t:
                 //         found = True ; break
                 // 
                 // if found:
                 //     if 0: # Not needed: we mark all corrected nodes.
                 //         g.es("Correcting %s" % 
                 // p.headString(),color="blue")
                 //     if 0: # For debugging.
                 //         print ; print '-' * 40
                 //         print "old",len(old)
                 //         for line in g.splitLines(old):
                 //             #line = line.replace(' ','< 
                 // >').replace('\t','<TAB>')
                 //             print repr(str(line))
                 //         print ; print '-' * 40
                 //         print "new",len(s)
                 //         for line in g.splitLines(s):
                 //             #line = line.replace(' ','< 
                 // >').replace('\t','<TAB>')
                 //             print repr(str(line))
                 //         print ; print '-' * 40
                 // else:
                 //     # This should never happen.
                 //     g.es("Correcting hidden node: t=%s" % 
                 // repr(at.t),color="red")
                 //@-at
                 //@nonl
                 //@-node:zorcanda!.20051004133343.2:<< bump at.correctedLines and tell about the correction >>
                 //@nl
                //@+at
                // if at.perfectImportRoot:
                //     << bump at.correctedLines and tell about the correction 
                // >>
                //     # p.setMarked()
                //     at.t.bodyString = s # Just etting at.t.tempBodyString 
                // won't work here.
                //     at.t.setDirty() # Mark the node dirty.  Ancestors will 
                // be marked dirty later.
                //     at.c.setChanged(True)
                // else:
                //     if not at.updateWarningGiven:
                //         at.updateWarningGiven = True
                //         # print "***",at.t,at.root.t
                //         g.es("Warning: updating changed text in %s" %
                //             (at.root.headString()),color="blue")
                //     # g.es("old...\n%s\n" % old)
                //     # g.es("new...\n%s\n" % s)
                //     # Just set the dirty bit. Ancestors will be marked 
                // dirty later.
                //     at.t.setDirty()
                //     if 1: # We must avoid the full setChanged logic here!
                //         c.changed = True
                //     else: # Far too slow for mass changes.
                //         at.c.setChanged(True)
                //@-at
                //@@c
                if( !updateWarningGiven ) updateWarningGiven = true;
                t_op.setDirty( t );//t.setDirty();
                c.setChanged2( true );
                //@nonl
                //@-node:zorcanda!.20051004133343.1:<< indicate that the node has been changed >>
                //@nl
            
            
            }
            //System.out.println( "SETTING TEMP FOR " + t_op.getHeadString( t ) );
            t_op.setTempBodyString( t, s ); //t.setTempBodyString( s );
            
        }
        
        t_op.setVisited( t ); //t.setVisited();
        indent = indentStack.remove( outStack.size() -1 );
        out = outStack.remove( outStack.size() -1 );
        t = tStack.remove( tStack.size() - 1 );
        if( thinFile && !importing ) lastThinNode = thinNodeStack.remove( thinNodeStack.size() - 1 );
        
        
        popSentinelStack( endNode );
        
        
    }
    
    
    //@+at
    // def readEndNode (self,s,i,middle=False):
    //     """Handle end-of-node processing for @-others and @-ref 
    // sentinels."""
    // 
    //     at = self ; c = at.c
    //     # End raw mode.
    //     at.raw = False
    //     # Set the temporary body text.
    //     s = ''.join(at.out)
    //     s = g.toUnicode(s,g.app.tkEncoding) # 9/28/03
    // 
    //     if at.importing:
    //         at.t.bodyString = s
    //     elif middle:
    //         pass # Middle sentinels never alter text.
    //     else:
    //         if hasattr(at.t,"tempBodyString") and s != at.t.tempBodyString:
    //             old = at.t.tempBodyString
    //         elif at.t.hasBody() and s != at.t.getBody():
    //             old = at.t.getBody()
    //         else:
    //             old = None
    //         # 9/4/04: Suppress this warning for the root: @first 
    // complicates matters.
    //         if old and not g.app.unitTesting and at.t != at.root.t:
    //             << indicate that the node has been changed >>
    //         #if at.t.headString == "NewHeadline2": raise Exception()
    //         at.t.tempBodyString = s
    // 
    //     # Indicate that the tnode has been set in the derived file.
    //     at.t.setVisited()
    // 
    //     # End the previous node sentinel.
    //     at.indent = at.indentStack.pop()
    //     at.out = at.outStack.pop()
    //     at.t = at.tStack.pop()
    //     if at.thinFile and not at.importing:
    //         at.lastThinNode = at.thinNodeStack.pop()
    // 
    //     at.popSentinelStack(at.endNode)
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004133343:readEndNode (4.x)
    //@+node:zorcanda!.20051004133359:readEndOthers
    public void readEndOthers( String s, int i ){
    
    
        popSentinelStack( endOthers );
    
    }
    
    
    //@+at
    // def readEndOthers (self,s,i):
    //     """Read an @-others sentinel."""
    //     at = self
    //     at.popSentinelStack(at.endOthers)
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004133359:readEndOthers
    //@+node:zorcanda!.20051004134037:readAfterRef
    public void readAfterRef( String s, int i ){
    
        //s = readLine( inputFile );
        s = readLine();
        out.add( s );
    
    }
    
    //@+at
    // def  readAfterRef (self,s,i):
    //     """Read an @afterref sentinel."""
    //     at = self
    //     assert(g.match(s,i,"afterref"))
    //     # Append the next line to the text.
    //     s = at.readLine(at.inputFile)
    //     at.out.append(s)
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004134037:readAfterRef
    //@+node:zorcanda!.20051004134122:readClone
    public void readClone( String s, int i ){
    
        String tag = "clone";
        i = skip_ws( s, i + tag.length() );
        Integer[] data = skip_long( s, i );
        Integer junk = data[ 0 ];
        Integer val = data[ 1 ];
        
        if( val == null ) readError( "Invalid count in @clone sentinel" );
        else cloneSibCount = val;
    
    }
    
    //@+at
    // def readClone (self,s,i):
    //     at = self ; tag = "clone"
    // 
    //     assert(g.match(s,i,tag))
    //     # Skip the tag and whitespace.
    //     i = g.skip_ws(s,i+len(tag))
    //     # Get the clone count.
    //     junk,val = g.skip_long(s,i)
    //     if val == None:
    //         at.readError("Invalid count in @clone sentinel")
    //     else:
    //         at.cloneSibCount	 = val
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004134122:readClone
    //@+node:zorcanda!.20051004134139:readComment
    public void readComment( String s, int i ){
    
    
    
    }
    
    //@+at
    // def readComment (self,s,i):
    //     """Read an @comment sentinel."""
    // 
    //     assert(g.match(s,i,"comment"))
    // 
    //     # Just ignore the comment line!
    //@-at
    //@-node:zorcanda!.20051004134139:readComment
    //@+node:zorcanda!.20051004134203:readDelims
    public void readDelims( String s, int i ){
    
        int i0 = i - 1;
        i = skip_ws( s, i -1 + 7 );
    
        int j = i;
        while( i < s.length() && !is_ws( s.charAt( i ) ) && !is_nl( s, i ) ) i += 1;
        
        if( j < i ){
            
            startSentinelComment = s.substring( j, i );
            j = i = skip_ws( s, i );
            while( i < s.length() && !is_ws( s.charAt( i ) ) && !is_nl( s, i ) ) i += 1;
            
            String end = j < i? s.substring( j, i ): "";
            int i2 = skip_ws( s, i );
            if( end.equals( endSentinelComment ) && ( i2 >= s.length() || is_nl( s, i2 ) ) ){
            
                endSentinelComment = "";
                String line = s.substring( i0, j );
                line = rtrim ( line );
                out.add( line + '\n' );       
            
            }
            else{
            
                endSentinelComment = end;
                String line = s.substring( i0, i );
                line = rtrim( line );
                out.add( line + '\n' );
                    
            }
        
        }
        else{
        
            readError( "Bad @delims" );
            out.add( "@delims" );
        
        }
    
    }
    
    
    //@+at
    // def readDelims (self,s,i):
    //     """Read an @delims sentinel."""
    //     at = self
    //     assert(g.match(s,i-1,"@delims"));
    // 
    //     # Skip the keyword and whitespace.
    //     i0 = i-1
    //     i = g.skip_ws(s,i-1+7)
    //     # Get the first delim.
    //     j = i
    //     while i < len(s) and not g.is_ws(s[i]) and not g.is_nl(s,i):
    //         i += 1
    //     if j < i:
    //         at.startSentinelComment = s[j:i]
    //         # print "delim1:", at.startSentinelComment
    //         # Get the optional second delim.
    //         j = i = g.skip_ws(s,i)
    //         while i < len(s) and not g.is_ws(s[i]) and not g.is_nl(s,i):
    //             i += 1
    //         end = g.choose(j<i,s[j:i],"")
    //         i2 = g.skip_ws(s,i)
    //         if end == at.endSentinelComment and (i2 >= len(s) or 
    // g.is_nl(s,i2)):
    //             at.endSentinelComment = "" # Not really two params.
    //             line = s[i0:j]
    //             line = line.rstrip()
    //             at.out.append(line+'\n')
    //         else:
    //             at.endSentinelComment = end
    //             # print "delim2:",end
    //             line = s[i0:i]
    //             line = line.rstrip()
    //             at.out.append(line+'\n')
    //     else:
    //         at.readError("Bad @delims")
    //         # Append the bad @delims line to the body text.
    //         at.out.append("@delims")
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004134203:readDelims
    //@+node:zorcanda!.20051004134247:readDirective (@@)
    public void readDirective( String s, int i ){
    
    
        if( match_word( s,i, "@raw" ) ) raw = true;
        else if( match_word( s, i, "@end_raw" ) ) raw = false;
        
        String e = endSentinelComment;
        String s2 = s.substring( i );
        if( e.length() > 0 ){
        
            int k = s.lastIndexOf( e, i );
            if( k != -1 ) s2 = s.substring( i, k ) + '\n';
        
        
        }
        
        String start = startSentinelComment;
        if( start.length() > 0 && start.charAt( start.length() -1 ) != '@' )
            s2 = s2.replace( "@@", "@" );
            
        
        out.add( s2 );
    
    }
    
    //@<< handle @language >>
    //@+node:zorcanda!.20051004134247.1:<< handle @language >>
    //@+at
    // # Skip the keyword and whitespace.
    // i += len("@language")
    // i = g.skip_ws(s,i)
    // j = g.skip_c_id(s,i)
    // language = s[i:j]
    // 
    // delim1,delim2,delim3 = g.set_delims_from_language(language)
    // 
    // g.trace(g.get_line(s,i))
    // g.trace(delim1,delim2,delim3)
    // 
    // # Returns a tuple (single,start,end) of comment delims
    // if delim1:
    //     at.startSentinelComment = delim1
    //     at.endSentinelComment = "" # Must not be None.
    // elif delim2 and delim3:
    //     at.startSentinelComment = delim2
    //     at.endSentinelComment = delim3
    // else:
    //     line = g.get_line(s,i)
    //     g.es("Ignoring bad @@language sentinel: %s" % line,color="red")
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004134247.1:<< handle @language >>
    //@nl
    //@<< handle @comment >>
    //@+node:zorcanda!.20051004134247.2:<< handle @comment >>
    //@+at
    // j = g.skip_line(s,i)
    // line = s[i:j]
    // delim1,delim2,delim3 = g.set_delims_from_string(line)
    // 
    // #g.trace(g.get_line(s,i))
    // #g.trace(delim1,delim2,delim3)
    // 
    // # Returns a tuple (single,start,end) of comment delims
    // if delim1:
    //     self.startSentinelComment = delim1
    //     self.endSentinelComment = "" # Must not be None.
    // elif delim2 and delim3:
    //     self.startSentinelComment = delim2
    //     self.endSentinelComment = delim3
    // else:
    //     line = g.get_line(s,i)
    //     g.es("Ignoring bad @comment sentinel: %s" % line,color="red")
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004134247.2:<< handle @comment >>
    //@nl
    //@+at
    // def readDirective (self,s,i):
    //     """Read an @@sentinel."""
    //     at = self
    //     assert(g.match(s,i,"@")) # The first '@' has already been eaten.
    //     # g.trace(g.get_line(s,i))
    //     if g.match_word(s,i,"@raw"):
    //         at.raw = True
    //     elif g.match_word(s,i,"@end_raw"):
    //         at.raw = False
    //     e = at.endSentinelComment
    //     s2 = s[i:]
    //     if len(e) > 0:
    //         k = s.rfind(e,i)
    //         if k != -1:
    //             s2 = s[i:k] + '\n'
    //     start = at.startSentinelComment
    //     if start and len(start) > 0 and start[-1] == '@':
    //         s2 = s2.replace('@@','@')
    //     if 0: # New in 4.2.1: never change comment delims here...
    //         if g.match_word(s,i,"@language"):
    //             << handle @language >>
    //         elif g.match_word(s,i,"@comment"):
    //             << handle @comment >>
    // 
    //     at.out.append(s2)
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004134247:readDirective (@@)
    //@+node:zorcanda!.20051004134304:readNl
    public void readNl( String s, int i ){
    
        if( inCode ) out.add( "\n" );
        else docOut.add( "\n" );
    
    
    }
    
    //@+at
    // def readNl (self,s,i):
    //     """Handle an @nonl sentinel."""
    //     at = self
    //     assert(g.match(s,i,"nl"))
    //     if at.inCode:
    //         at.out.append('\n')
    //     else:
    //         at.docOut.append('\n')
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004134304:readNl
    //@+node:zorcanda!.20051004134327:readNonl
    public void readNonl( String s, int i ){
    
    
        if( inCode ){
            String s2 = s;
            s = join( "", out );
            //System.out.println( s.substring( i, i + 4 ) );
            //System.out.println( s );
            if( s.length() > 0 && s.charAt( s.length() - 1 ) == '\n' ){
            
                out = new ArrayList();
                out.add( s.substring( 0, s.length() -1 ) );
            
            }
            else{
                System.out.println( s.charAt( s.length() -1 ) );
                System.out.println( s );
                System.out.println( s2 );
                readError( "unexpected @nonl directive in code part");
        
            }
        }
        else{
        
            s = join( "" , pending );
            if( s.length() > 0 ){
            
                if( s.length() > 0 && s.charAt( s.length() - 1 ) == '\n' ){
                
                    pending = new ArrayList<String>();
                    pending.add( s.substring( 0, s.length() - 1 ) );
                
                
                }
                else readError( "unexpected @nonl directive in pending doc part"); 
            
            
            
            }
            else{
            
                s = join( "", docOut );
                if( s.length() > 0 && s.charAt( s.length() - 1 ) == '\n' ){
                
                    docOut = new ArrayList< String >();
                    docOut.add( s.substring( 0, s.length() - 1 ) );  
                
                
                }
                else readError( "unexpected @nonl directive in doc part"); 
            
            }
        
        
        }
    
    
    }
    
    
    //@+at
    // def readNonl (self,s,i):
    //     """Handle an @nonl sentinel."""
    //     at = self
    //     assert(g.match(s,i,"nonl"))
    //     if at.inCode:
    //         s = ''.join(at.out)
    //         if s and s[-1] == '\n':
    //             at.out = [s[:-1]]
    //         else:
    //             g.trace("out:",s)
    //             at.readError("unexpected @nonl directive in code part")
    //     else:
    //         s = ''.join(at.pending)
    //         if s:
    //             if s and s[-1] == '\n':
    //                 at.pending = [s[:-1]]
    //             else:
    //                 g.trace("docOut:",s)
    //                 at.readError("unexpected @nonl directive in pending doc 
    // part")
    //         else:
    //             s = ''.join(at.docOut)
    //             if s and s[-1] == '\n':
    //                 at.docOut = [s[:-1]]
    //             else:
    //                 g.trace("docOut:",s)
    //                 at.readError("unexpected @nonl directive in doc part")
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004134327:readNonl
    //@+node:zorcanda!.20051004134357:readRef
    //@+at 
    //@nonl
    // The sentinel contains an @ followed by a section name in angle 
    // brackets.  This code is different from the code for the @@ sentinel: 
    // the expansion of the reference does not include a trailing newline.
    //@-at
    //@@c
    
    public void readRef( String s, int i ){
    
        int j = skip_ws( s, i );
        
        String line;
        if( endSentinelComment.length() == 0 ) line = s.substring( i, s.length() -1 ) ;
        else{
            
            int k = s.indexOf( endSentinelComment, i );
            line = s.substring( i, k );
            
        }
        
        String start = startSentinelComment;
        if( start.length() > 0 && start.charAt( start.length() -1 ) != '@' )
            line = line.replace( "@@", "@" );
    
        //System.out.println( "LINErEf:" + line );
        out.add( line );
        //System.out.println( "REF OUT:" + out );
    
    }
    
    
    //@+at
    // def readRef (self,s,i):
    //     """Handle an @<< sentinel."""
    //     at = self
    //     j = g.skip_ws(s,i)
    //     assert(g.match(s,j,"<<"))
    //     if len(at.endSentinelComment) == 0:
    //         line = s[i:-1] # No trailing newline
    //     else:
    //         k = s.find(at.endSentinelComment,i)
    //         line = s[i:k] # No trailing newline, whatever k is.
    //     # Undo the cweb hack.
    //     start = at.startSentinelComment
    //     if start and len(start) > 0 and start[-1] == '@':
    //         line = line.replace('@@','@')
    // 
    //     at.out.append(line)
    //@-at
    //@-node:zorcanda!.20051004134357:readRef
    //@+node:zorcanda!.20051004134422:readVerbatim
    public void readVerbatim( String s, int i ){
    
        //s = readLine( inputFile );
        s = readLine();
        i = skipIndent( s, 0, indent );
        out.add( s.substring( i ) );
    
    }
    
    
    //@+at
    // def readVerbatim (self,s,i):
    //     """Read an @verbatim sentinel."""
    //     at = self
    //     assert(g.match(s,i,"verbatim"))
    //     # Append the next line to the text.
    //     s = at.readLine(at.inputFile)
    //     i = at.skipIndent(s,0,at.indent)
    //     at.out.append(s[i:])
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004134422:readVerbatim
    //@+node:zorcanda!.20051005150233:readLastDocLine
    public void readLastDocLine( String tag ){
    
        String end = endSentinelComment;
        String start = startSentinelComment;
        String s = join( "", docOut );
        //System.out.println( "S:" + s );
        if( match( s, 0, tag ) )
            s = s.substring( tag.length() );
        else
            readError( "Missing start of doc part");
        
        //System.out.println( "END:" + end );
        //System.out.println( "START:" + start );
        //System.out.println( "RLDL HERE 1" ); 
        if( end.length() > 0 ){
        
            if( s.charAt( 0 ) == '\n' )  s = s.substring( 1 );
        
            if( match( s, 0, start ) ) s = s.substring( start.length() );
            else{
                readError("Missing start of doc part");
                return;
            
            }
            //System.out.println( " RLDL HERE -5" );
            if( s.charAt( s.length() -1 ) == '\n' ) s = s.substring( 0, s.length() -1 );
            
            if( s.endsWith( end ) )
                s = s.substring( 0, s.lastIndexOf( end ) );
            else{
            
                readError("Missing close block comment");
                return;
            
            
            }
        
        }
        //System.out.println( "RLDL HERE 12" ); 
        out.add( tag + s );
        docOut = new ArrayList< String >();    
    
    }
    
    
    //@+at
    // def readLastDocLine (self,tag):
    //     """Read the @c line that terminates the doc part.
    //     tag is @doc or @."""
    //     at = self
    //     end = at.endSentinelComment
    //     start = at.startSentinelComment
    //     s = ''.join(at.docOut)
    //     # Remove the @doc or @space.  We'll add it back at the end.
    //     if g.match(s,0,tag):
    //         s = s[len(tag):]
    //     else:
    //         at.readError("Missing start of doc part")
    //         return
    // 
    //     if end:
    //         # 9/3/04: Remove leading newline.
    //         if s[0] == '\n': s = s[1:]
    //         # Remove opening block delim.
    //         if g.match(s,0,start):
    //             s = s[len(start):]
    //         else:
    //             at.readError("Missing open block comment")
    //             g.trace(s)
    //             return
    //         # Remove trailing newline.
    //         if s[-1] == '\n': s = s[:-1]
    //         # Remove closing block delim.
    //         if s[-len(end):] == end:
    //             s = s[:-len(end)]
    //         else:
    //             at.readError("Missing close block comment")
    //             g.trace(s)
    //             g.trace(end)
    //             g.trace(start)
    //             return
    // 
    //     at.out.append(tag + s)
    //     at.docOut = []
    //@-at
    //@nonl
    //@-node:zorcanda!.20051005150233:readLastDocLine
    //@+node:zorcanda!.20051004134431:ignoreOldSentinel
    public void ignoreOldSentinel( String s, int i ){
    
    
    
    }
    
    
    
    //@+at
    // def  ignoreOldSentinel (self,s,i):
    //     """Ignore an 3.x sentinel."""
    //     g.es("Ignoring 3.x sentinel: " + s.strip(), color="blue")
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004134431:ignoreOldSentinel
    //@-others
    
    
    //@+at
    // self.dispatch_dict = {
    //     # Plain line.
    //     self.noSentinel: self.readNormalLine,
    //     # Starting sentinels...
    //     self.startAll:    self.readStartAll,
    //     self.startAt:     self.readStartAt,
    //     self.startDoc:    self.readStartDoc,
    //     self.startLeo:    self.readStartLeo,
    //     self.startMiddle: self.readStartMiddle,
    //     self.startNode:   self.readStartNode,
    //     self.startOthers: self.readStartOthers,
    //     # Ending sentinels...
    //     self.endAll:    self.readEndAll,
    //     self.endAt:     self.readEndAt,
    //     self.endDoc:    self.readEndDoc,
    //     self.endLeo:    self.readEndLeo,
    //     self.endMiddle: self.readEndMiddle,
    //     self.endNode:   self.readEndNode,
    //     self.endOthers: self.readEndOthers,
    //     # Non-paired sentinels.
    //     self.startAfterRef:  self.readAfterRef,
    //     self.startClone:     self.readClone,
    //     self.startComment:   self.readComment,
    //     self.startDelims:    self.readDelims,
    //     self.startDirective: self.readDirective,
    //     self.startNl:        self.readNl,
    //     self.startNonl:      self.readNonl,
    //     self.startRef:       self.readRef,
    //     self.startVerbatim:  self.readVerbatim,
    //     # Ignored 3.x sentinels
    //     self.endBody:               self.ignoreOldSentinel,
    //     self.startBody:             self.ignoreOldSentinel,
    //     self.startVerbatimAfterRef: self.ignoreOldSentinel }
    //@-at
    //@nonl
    //@-node:zorcanda!.20051003153333:dispatch
    //@+node:zorcanda!.20051003151011:scanText4
    public List<String> scanText4( File theFile, String fileName, PositionSpecification p ){
    
    //@+at
    // at.cloneSibCount = 0
    // at.done = False
    // at.inCode = True
    // at.indent = 0 # Changed only for sentinels.
    // at.lastLines = [] # The lines after @-leo
    // at.leadingWs = ""
    // at.root = p
    // at.rootSeen = False
    // at.updateWarningGiven = False
    // 
    // # Stacked ivars...
    // at.endSentinelStack = [at.endLeo] # We have already handled the @+leo 
    // sentinel.
    // at.out = [] ; at.outStack = []
    // at.t = p.v.t ; at.tStack = []
    // at.lastThinNode = p.v ; at.thinNodeStack = [p.v]
    //@-at
    //@@c
        //System.out.println( "P is " + p );
        //System.out.println( "INCode was " + inCode );
        done = false;
        cloneSibCount = 0;
        inCode = true;
        indent = 0;
        leadingWs = "";
        out = new ArrayList< String >();
        outStack = new ArrayList< List<String > >();
        endSentinelStack = new ArrayList< AtFileConstants >(); endSentinelStack.add( endLeo );
        t = p.get_T(); tStack = new ArrayList();
        lastThinNode = p.get_V(); 
        thinNodeStack = new ArrayList();
        thinNodeStack.add( p.get_V() );
        
        
        while( errors == 0 && !done ){
        
            //String s = readLine( theFile );
            //System.out.println( "PRE READ!" );
            String s = readLine();
            if( s == null ){
                //System.out.println( "DONE READING!" );
                s = "";
            
            }
            if( s.length() == 0 ) break;
            AtFileConstants kind = sentinelKind4( s );
            int i;
            if( kind == noSentinel ) i = 0;
            else i = skipSentinelStart4(s,0);
            //System.out.println( "S:" + s );
            //System.out.println( "DISPATCHING " + kind );
            dispatch( kind, s, i );
            //System.out.println( "DONE DISPATCHING " + kind );        
            
            }
            
            //System.out.println( "FINISHED SCANTEXT4!" );
            return lastLines;
        }
    //@-node:zorcanda!.20051003151011:scanText4
    //@+node:zorcanda!.20051003162351.3:sentinelKind4
    //@+at
    // def sentinelKind4(self,s):
    //     """Return the kind of sentinel at s."""
    //     at = self
    // 
    //     i = g.skip_ws(s,0)
    //     if g.match(s,i,at.startSentinelComment):
    //         i += len(at.startSentinelComment)
    //     else:
    //         return at.noSentinel
    // 
    //     # Locally undo cweb hack here
    //     start = at.startSentinelComment
    //     if start and len(start) > 0 and start[-1] == '@':
    //         s = s[:i] + string.replace(s[i:],'@@','@')
    //     # 4.0: Look ahead for @[ws]@others and @[ws]<<
    //     if g.match(s,i,"@"):
    //         j = g.skip_ws(s,i+1)
    //         if j > i+1:
    //             # g.trace(ws,s)
    //             if g.match(s,j,"@+others"):
    //                 return at.startOthers
    //             elif g.match(s,j,"<<"):
    //                 return at.startRef
    //             else:
    //                 # No other sentinels allow whitespace following the '@'
    //                 return at.noSentinel
    // 
    //     # Do not skip whitespace here!
    //     if g.match(s,i,"@<<"): return at.startRef
    //     if g.match(s,i,"@@"):   return at.startDirective
    //     if not g.match(s,i,'@'): return at.noSentinel
    //     j = i # start of lookup
    //     i += 1 # skip the at sign.
    //     if g.match(s,i,'+') or g.match(s,i,'-'):
    //         i += 1
    //     i = g.skip_c_id(s,i)
    //     key = s[j:i]
    //     if len(key) > 0 and at.sentinelDict.has_key(key):
    //         return at.sentinelDict[key]
    //     else:
    //         return at.noSentinel
    //@-at
    //@nonl
    //@-node:zorcanda!.20051003162351.3:sentinelKind4
    //@+node:zorcanda!.20051003162351.4:sentinelKind4
    public AtFileConstants sentinelKind4( String s ){
    
        char[] ca = s.toCharArray();
        
        int i = skip_ws( s, 0 );
    
        if( s.substring( i ).startsWith( startSentinelComment ) )
            i += startSentinelComment.length();
        else
            return AtFileConstants.noSentinel;
        
        String start = startSentinelComment;
        int sl = start.length();
        if( sl > 0 && start.charAt( sl - 1 ) == '@' )
            s = s.substring( 0, i ) + s.substring( i ).replace( "@@", "@" );
            
        int j;
        if( match( s, i , "@" ) ){
        
            j = skip_ws( s, i + 1 );
            if( j > i + 1 ){
            
                if( match( s, j, "@+others" ) ) return AtFileConstants.startOthers;
                else if( match( s, j, "<<" ) ) return AtFileConstants.startRef;
                else return AtFileConstants.noSentinel;
            
            
            }  
        }
        
        if( match( s, i , "@<<" ) ) return AtFileConstants.startRef;
        if( match( s, i, "@@" ) ) return AtFileConstants.startDirective;
        if( !match( s, i , "@" ) ) return AtFileConstants.noSentinel;
        
        j = i;
        i += 1;
        
        if( match( s, i, "+" ) || match( s, i, "-" ) ) i += 1;
        //if g.match(s,i,'+') or g.match(s,i,'-'):
        //    i += 1
        
        //i = g.skip_c_id(s,i) 
        i = skip_c_id( s, i );
        String key = s.substring( j, i );
        if( sentinelDict.containsKey( key ) ) return sentinelDict.get( key );
        else
            return AtFileConstants.noSentinel;
    
    }
    
    
    
    
    
    
    
    //@-node:zorcanda!.20051003162351.4:sentinelKind4
    //@+node:zorcanda!.20051004163027:rtrim
    public String rtrim( String s ){
    
        StringBuilder sb = new StringBuilder( s );
        sb.reverse();
        String trim = sb.toString();
        for( char ch: trim.toCharArray() ){
            
            if( Character.isWhitespace( ch ) ) sb.deleteCharAt( 0 );
            else break;
            
        }
        sb.reverse();
        return sb.toString();
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051004163027:rtrim
    //@+node:zorcanda!.20051004171809:join
    public String join( String joinstring, List<String> l ){
    
        StringBuilder sb = new StringBuilder();
        for( String s: l ){
        
            sb.append( s ).append( joinstring );
        
        }
    
        int lind = sb.lastIndexOf( joinstring );
        sb.delete( lind, sb.length() );
        return sb.toString();
    
    }
    //@nonl
    //@-node:zorcanda!.20051004171809:join
    //@+node:zorcanda!.20051005130109:readError
    public void readError( String error ){
    
    
        err.println( error );
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051005130109:readError
    //@+node:zorcanda!.20051005142646:readLine
    public String readLine(){
    
        String line = null;
        try{
            
            if( raFile == null )
                System.out.println( "RAFILE is " + raFile );
            line = raFile.readLine();
            if( line != null ) line = line + '\n';
            //System.out.println( "LINE:" + line );
            else line = "";
            
        }
        catch( IOException io ){}
        
        return line;
    
    
    }
    //@nonl
    //@-node:zorcanda!.20051005142646:readLine
    //@+node:zorcanda!.20051005145056:badEndSentinel, push/popSentinelStack
    public void popSentinelStack( AtFileConstants expectedKind ){
    
        if( endSentinelStack.size() > 0 && endSentinelStack.get( endSentinelStack.size() - 1 ) == expectedKind )
            endSentinelStack.remove( endSentinelStack.size() -1 );
        else
            badEndSentinel( expectedKind );
    
    
    }
    
    public void badEndSentinel( AtFileConstants expectedKind ){
    
    
        readError( "Bad Sentinel, was expecting " + expectedKind );
    
    
    }
    
    //@+at
    // def badEndSentinel (self,expectedKind):
    //     """Handle a mismatched ending sentinel."""
    // 
    //     at = self
    //     assert(at.endSentinelStack)
    //     s = "Ignoring %s sentinel.  Expecting %s" % (
    //         at.sentinelName(at.endSentinelStack[-1]),
    //         at.sentinelName(expectedKind))
    //     at.readError(s)
    // def popSentinelStack (self,expectedKind):
    //     """Pop an entry from endSentinelStack and check it."""
    //     at = self
    //     if at.endSentinelStack and at.endSentinelStack[-1] == expectedKind:
    //         at.endSentinelStack.pop()
    //     else:
    //         at.badEndSentinel(expectedKind)
    //@-at
    //@nonl
    //@-node:zorcanda!.20051005145056:badEndSentinel, push/popSentinelStack
    //@+node:zorcanda!.20051006121609:scanHeader  (3.x and 4.x)
    public Object[] scanHeader( String fileName ){
    
    
        List< String > firstLines = new ArrayList< String >();
        String tag = "@+leo";
        boolean valid = true; boolean new_df = false; boolean isThinDerivedFile = false;
    //@+at
    // s = at.readLine(theFile)
    // while len(s) > 0:
    //     j = s.find(tag)
    //     if j != -1: break
    //     firstLines.append(s) # Queue the line
    //     s = at.readLine(theFile)
    // n = len(s)
    // valid = n > 0
    //@-at
    //@@c
        String s = readLine();
        while( s.length() > 0 ){
        
            int j = s.indexOf( tag );
            if( j != -1 ) break;
            firstLines.add( s );
            s = readLine();
        
        
        
        }
        int n = s.length();
        valid = n > 0;
        String start = "", end = "";
        if( valid ){
        
            Object[] rv = parseLeoSentinel( s );
            valid = (Boolean)rv[ 0 ];
            new_df = (Boolean)rv[ 1 ];
            start = (String)rv[ 2 ];
            end = (String)rv[ 3 ];
            isThinDerivedFile = (Boolean)rv[ 4 ];
        
        
        }
        if( valid ){
        
            startSentinelComment = start;
            endSentinelComment = end;
        
        }
        else
            err.println("Bad @+leo sentinel in " + fileName);
            
        return new Object[]{ firstLines, new_df, isThinDerivedFile };
    }
    
    //@<< skip any non @+leo lines >>
    //@+node:zorcanda!.20051006121609.1:<< skip any non @+leo lines >>
    //@+at 
    //@nonl
    // Queue up the lines before the @+leo.  These will be used to add as 
    // parameters to the @first directives, if any.  Empty lines are ignored 
    // (because empty @first directives are ignored). NOTE: the function now 
    // returns a list of the lines before @+leo.
    // 
    // We can not call sentinelKind here because that depends on the comment 
    // delimiters we set here.  @first lines are written "verbatim", so 
    // nothing more needs to be done!
    //@-at
    //@@c
    //@+at
    // s = at.readLine(theFile)
    // while len(s) > 0:
    //     j = s.find(tag)
    //     if j != -1: break
    //     firstLines.append(s) # Queue the line
    //     s = at.readLine(theFile)
    // n = len(s)
    // valid = n > 0
    //@-at
    //@-node:zorcanda!.20051006121609.1:<< skip any non @+leo lines >>
    //@nl
    //@+at
    // def scanHeader(self,theFile,fileName):
    //     """Scan the @+leo sentinel.
    //     Sets self.encoding, and self.start/endSentinelComment.
    //     Returns (firstLines,new_df) where:
    //     firstLines contains all @first lines,
    //     new_df is True if we are reading a new-format derived file."""
    //     at = self
    //     firstLines = [] # The lines before @+leo.
    //     tag = "@+leo"
    //     valid = True ; new_df = False ; isThinDerivedFile = False
    //     << skip any non @+leo lines >>
    //     if valid:
    //         valid,new_df,start,end,isThinDerivedFile = 
    // at.parseLeoSentinel(s)
    //     if valid:
    //         at.startSentinelComment = start
    //         at.endSentinelComment = end
    //     else:
    //         at.error("Bad @+leo sentinel in " + fileName)
    //     # 
    // g.trace("start,end",repr(at.startSentinelComment),repr(at.endSentinelComment))
    //     return firstLines,new_df,isThinDerivedFile
    //@-at
    //@nonl
    //@-node:zorcanda!.20051006121609:scanHeader  (3.x and 4.x)
    //@+node:zorcanda!.20051006121951:parseLeoSentinel
    public Object[] parseLeoSentinel( String s ){
    
    
        boolean new_df = false; boolean valid = true; int n = s.length();
        boolean isThinDerivedFile = false;
        String encoding_tag = "-encoding=";
        String version_tag = "-ver=";
        String tag = "@+leo";
        String thin_tag = "-thin";
        String start= ""; String end = "";
        
        //@    << set the opening comment delim >>
        //@+node:zorcanda!.20051006121951.1:<< set the opening comment delim >>
        int i, j;
        i = j = skip_ws( s, 0 );
        while( i < n && ! match( s, i , tag ) && !is_nl( s, i ) ) i += 1;
        
        if( j< i ) start = s.substring( j, i );
        else valid = false;
        
        
        //@+at
        // # s contains the tag
        // i = j = g.skip_ws(s,0)
        // 
        // # The opening comment delim is the initial non-tag
        // while i < n and not g.match(s,i,tag) and not g.is_nl(s,i):
        //     i += 1
        // 
        // if j < i:
        //     start = s[j:i]
        // else:
        //     valid = False
        //@-at
        //@nonl
        //@-node:zorcanda!.20051006121951.1:<< set the opening comment delim >>
        //@nl
        //@    << make sure we have @+leo >>
        //@+node:zorcanda!.20051006121951.2:<< make sure we have @+leo >>
        //@+at 
        //@nonl
        // REM hack: leading whitespace is significant before the @+leo.  We 
        // do this so that sentinelKind need not skip whitespace following 
        // self.startSentinelComment.  This is correct: we want to be as 
        // restrictive as possible about what is recognized as a sentinel.  
        // This minimizes false matches.
        //@-at
        //@@c
        
        
        if( match( s, i , tag ) ) i += tag.length();
        else valid = false;
        
        
        //@+at
        // if 0: # Make leading whitespace significant.
        //     i = g.skip_ws(s,i)
        // 
        // if g.match(s,i,tag):
        //     i += len(tag)
        // else: valid = False
        //@-at
        //@nonl
        //@-node:zorcanda!.20051006121951.2:<< make sure we have @+leo >>
        //@nl
        //@    << read optional version param >>
        //@+node:zorcanda!.20051006121951.3:<< read optional version param >>
        new_df = match( s,i, version_tag );
        if( new_df ){
        
            i += version_tag.length();
            j = i;
            while( i < s.length() && ! is_nl( s, i ) && s.charAt( i ) != '-' ) i += 1;
        
        
            if( j < i );
            else valid = false;
        
        }
        
        //@+at
        // new_df = g.match(s,i,version_tag)
        // 
        // if new_df:
        //     # Skip to the next minus sign or end-of-line
        //     i += len(version_tag)
        //     j = i
        //     while i < len(s) and not g.is_nl(s,i) and s[i] != '-':
        //         i += 1
        // 
        //     if j < i:
        //         pass # version = s[j:i]
        //     else:
        //         valid = False
        //@-at
        //@-node:zorcanda!.20051006121951.3:<< read optional version param >>
        //@nl
        //@    << read optional thin param >>
        //@+node:zorcanda!.20051006121951.4:<< read optional thin param >>
        if( match( s, i, thin_tag ) ){
        
            i += tag.length();
            isThinDerivedFile = true;
        
        
        }
        
        
        //@+at
        // if g.match(s,i,thin_tag):
        //     i += len(tag)
        //     isThinDerivedFile = True
        //@-at
        //@nonl
        //@-node:zorcanda!.20051006121951.4:<< read optional thin param >>
        //@nl
        //@    << read optional encoding param >>
        //@+node:zorcanda!.20051006121951.5:<< read optional encoding param >>
        this.encoding = c.acquireDefault_derived_file_encoding();
        String encoding = null;
        
        if( match( s, i, encoding_tag ) ){
        
            i += encoding_tag.length();
            j = s.indexOf( ",.", i );
            if( j > -1 ) i = j + 1;
            else{
            
                j = s.indexOf( ".", i );
                if( j > -1 ){
                
                    encoding = s.substring( i, j );
                    i = j + 1;
                
                
                }    
                else encoding = null;
            
            }
        
            if( encoding != null ){
            
                if( c.g_isValidEncoding( encoding ) ) this.encoding = encoding;
                else err.println( "bad encoding in derived file:" + encoding );
            
            
            }
            else valid = false;
        
        }
        
        
        //@+at
        // # Set the default encoding
        // at.encoding = c.config.default_derived_file_encoding
        // 
        // if g.match(s,i,encoding_tag):
        //     # Read optional encoding param, e.g., -encoding=utf-8,
        //     i += len(encoding_tag)
        //     # Skip to the next end of the field.
        //     j = s.find(",.",i)
        //     if j > -1:
        //         # The encoding field was written by 4.2 or after:
        //         encoding = s[i:j]
        //         i = j + 1 # 6/8/04
        //     else:
        //         # The encoding field was written before 4.2.
        //         j = s.find('.',i)
        //         if j > -1:
        //             encoding = s[i:j]
        //             i = j + 1 # 6/8/04
        //         else:
        //             encoding = None
        //     # g.trace("encoding:",encoding)
        //     if encoding:
        //         if g.isValidEncoding(encoding):
        //             at.encoding = encoding
        //         else:
        //             print "bad encoding in derived file:",encoding
        //             g.es("bad encoding in derived file:",encoding)
        //     else:
        //         valid = False
        //@-at
        //@-node:zorcanda!.20051006121951.5:<< read optional encoding param >>
        //@nl
        //@    << set the closing comment delim >>
        //@+node:zorcanda!.20051006121951.6:<< set the closing comment delim >>
        i = j = skip_ws( s, i );
        while( i < n && ! is_ws( s.charAt( i ) ) && ! is_nl( s, i ) ) i += 1;
        
        //System.out.println( "J " + j + " I " + i );
        end = s.substring( j, i );
        
        
        //@+at
        // # The closing comment delim is the trailing non-whitespace.
        // i = j = g.skip_ws(s,i)
        // while i < n and not g.is_ws(s[i]) and not g.is_nl(s,i):
        //     i += 1
        // end = s[j:i]
        //@-at
        //@nonl
        //@-node:zorcanda!.20051006121951.6:<< set the closing comment delim >>
        //@nl
        return new Object[]{ valid, new_df, start, end, isThinDerivedFile };
    
    }
    
    //@+at
    // def parseLeoSentinel (self,s):
    //     at = self ; c = at.c
    //     new_df = False ; valid = True ; n = len(s)
    //     isThinDerivedFile = False
    //     encoding_tag = "-encoding="
    //     version_tag = "-ver="
    //     tag = "@+leo"
    //     thin_tag = "-thin"
    //     << set the opening comment delim >>
    //     << make sure we have @+leo >>
    //     << read optional version param >>
    //     << read optional thin param >>
    //     << read optional encoding param >>
    //     << set the closing comment delim >>
    //     return valid,new_df,start,end,isThinDerivedFile
    //@-at
    //@nonl
    //@-node:zorcanda!.20051006121951:parseLeoSentinel
    //@+node:zorcanda!.20051006105232:abstracts
    //@+node:zorcanda!.20051006101826:createThinChild4
    public abstract Object createThinChild4( String gnxString, String headline );
    
    
    //@+at
    // def createThinChild4 (self,gnxString,headline):
    // 
    //     """Find or create a new vnode whose parent is at.lastThinNode."""
    // 
    //     at = self ; v = at.root.v ; c = at.c ; indices = g.app.nodeIndices
    //     last = at.lastThinNode ; lastIndex = last.t.fileIndex
    //     gnx = indices.scanGnx(gnxString,0)
    //     #print "GNX is %s" % ( gnx, )
    //     #print "GNXSTRING IS %s" % gnxString
    //     if len( self._forcedGnxPositionList ) != 0 and last in 
    // self._forcedGnxPositionList:
    //         last.fileIndex = lastIndex=  gnx
    //         self._forcedGnxPositionList.remove( last )
    //     if 0:
    //         g.trace("last",last,last.t.fileIndex)
    // g.trace("args",indices.areEqual(gnx,last.t.fileIndex),gnxString,headline)
    //     # See if there is already a child with the proper index.
    //     child = at.lastThinNode.firstChild()
    //     while child and not indices.areEqual(gnx,child.t.fileIndex):
    //         child = child.next()
    // 
    //     if at.cloneSibCount > 1:
    //         n = at.cloneSibCount ; at.cloneSibCount = 0
    //         if child: clonedSibs,junk = at.scanForClonedSibs(child)
    //         else: clonedSibs = 0
    //         copies = n - clonedSibs
    //         # g.trace(copies,headline)
    //     else:
    //         if indices.areEqual(gnx,lastIndex):
    //             return last
    //         if child:
    //             return child
    //         copies = 1 # Create exactly one copy.
    // 
    // 
    //     while copies > 0:
    //         copies -= 1
    //         # Create the tnode only if it does not already exist.
    //         tnodesDict = c.fileCommands.tnodesDict
    //         t = tnodesDict.get(gnxString)
    //         if t:
    //             assert(indices.areEqual(t.fileIndex,gnx))
    //         else:
    //             t = leoNodes.tnode(bodyString=None,headString=headline)
    //             t.fileIndex = gnx
    //             tnodesDict[gnxString] = t
    //         parent = at.lastThinNode
    //         child = leoNodes.vnode(c,t)
    //         child.vid = gnxString
    //         #print 'gnxString is %s' % gnxString
    //         leoNodes.vid_vnode[ gnxString ] = child
    //         leoNodes.tid_tnode[ gnxString ] = t
    //         t.vnodeList.append(child)
    //         child.linkAsNthChild(parent,parent.numberOfChildren())
    //         # g.trace('creating last child %s\nof parent%s\n' % 
    // (child,parent))
    // 
    //     return child
    //@-at
    //@nonl
    //@-node:zorcanda!.20051006101826:createThinChild4
    //@+node:zorcanda!.20051006101943:createImportedNode
    public abstract PositionSpecification createImportedNode( PositionSpecification root, CommanderSpecification c, String headline );
    
    //@+at
    // def createImportedNode (self,root,c,headline):
    //     at = self
    // 
    //     if at.importRootSeen:
    //         p = root.insertAsLastChild()
    //         p.initHeadString(headline)
    //     else:
    //         # Put the text into the already-existing root node.
    //         p = root
    //         at.importRootSeen = True
    //     p.v.t.setVisited() # Suppress warning about unvisited node.
    //     return p
    //@-at
    //@nonl
    //@-node:zorcanda!.20051006101943:createImportedNode
    //@+node:zorcanda!.20051006102239:findChild4
    public abstract Object findChild4( String headline );
    
    
    
    //@+at
    // def findChild4 (self,headline):
    //     """Return the next tnode in at.root.t.tnodeList."""
    // 
    //     at = self ; v = at.root.v
    // 
    //     if not hasattr(v.t,"tnodeList"):
    //         at.readError("no tnodeList for " + repr(v))
    //         g.es("Write the @file node or use the Import Derived File 
    // command")
    //         g.trace("no tnodeList for ",v)
    //         return None
    //     if at.tnodeListIndex >= len(v.t.tnodeList):
    //         at.readError("bad tnodeList index: %d, %s" % 
    // (at.tnodeListIndex,repr(v)))
    //         g.trace("bad tnodeList 
    // index",at.tnodeListIndex,len(v.t.tnodeList),v)
    //         return None
    //     t = v.t.tnodeList[at.tnodeListIndex]
    //     assert(t)
    //     at.tnodeListIndex += 1
    // 
    //     # Get any vnode joined to t.
    //     try:
    //         v = t.vnodeList[0]
    //     except:
    //         at.readError("No vnodeList for tnode: %s" % repr(t))
    //         g.trace(at.tnodeListIndex)
    //         return None
    //     # Don't check the headline.  It simply causes problems.
    //     t.setVisited() # Supress warning about unvisited node.
    //     return t
    //@-at
    //@nonl
    //@-node:zorcanda!.20051006102239:findChild4
    //@-node:zorcanda!.20051006105232:abstracts
    //@+node:zorcanda!.20051006100445:skippers
    //@+others
    //@+node:zorcanda!.20051006100445.1:skipIndent
    public int skipIndent( String s, int i, int width ){
    
        int ws = 0; int n = s.length();
        while( i < n && ws < width ){
        
            if( s.charAt( i ) == '\t' ) ws += ( abs( tab_width ) - ( ws % abs( tab_width ) ) );
            else if( s.charAt( i ) == ' ' ) ws += 1;
            else break;
            i += 1;
        
        
        }
    
        return i;
    
    
    
    
    }
    
    //@+at
    // def skipIndent(self,s,i,width):
    // 
    //     ws = 0 ; n = len(s)
    //     while i < n and ws < width:
    //         if   s[i] == '\t': ws += (abs(self.tab_width) - (ws % 
    // abs(self.tab_width)))
    //         elif s[i] == ' ':  ws += 1
    //         else: break
    //         i += 1
    //     return i
    //@-at
    //@nonl
    //@-node:zorcanda!.20051006100445.1:skipIndent
    //@+node:zorcanda!.20051006101521:skip_long
    public Integer[] skip_long( String s, int i ){
    
        int val = 0;
        i = skip_ws( s, i );
        int n = s.length();
        char _cai = s.charAt( i );
        if( i > n || ( _cai != '+' || _cai != '-' || !Character.isDigit( _cai ) ) )
            return new Integer[]{ i, null };
            
        int j = i;
        if( _cai == '+' || _cai == '-' ) i +=1;
        while( i < n && Character.isDigit( s.charAt( i ) ) ) i += 1;
        try{
            
            val = Integer.valueOf( s.substring( j, i ) );
            return new Integer[]{ i, val };
        
        }
        catch( Exception x ){
        
            return new Integer[]{ i, null };
        
        }
        
    }
    
    
    //@+at
    // def skip_long(s,i):
    //     """Scan s[i:] for a valid int.
    //     Return (i, val) or (i, None) if s[i] does not point at a number.
    //     """
    // 
    //     digits = string.digits
    //     val = 0
    //     i = g.skip_ws(s,i)
    //     n = len(s)
    //     if i >= n or s[i] not in "+-" + digits:
    //         return i, None
    //     # Rewritten: 7/18/02.
    //     j = i
    //     if s[i] in '+-':    # whr allow sign if first digit
    //         i +=1
    //     while i < n and s[i] in digits:
    //         i += 1
    //     try: # 4/24/03: There may be no digits, which would raise an 
    // exception.
    //         val = int(s[j:i])
    //         return i, val
    //     except:
    //         return i,None
    //@-at
    //@-node:zorcanda!.20051006101521:skip_long
    //@+node:zorcanda!.20051006102133:skipSentinelStart4
    public int skipSentinelStart4( String s, int i ){
    
        String start = startSentinelComment;
        i = skip_ws( s, i );
        i += start.length();
        i = skip_ws( s, i );
        return i + 1;
    
    
    }
    
    
    //@+at
    // def skipSentinelStart4(self,s,i):
    //     """Skip the start of a sentinel."""
    // 
    //     start = self.startSentinelComment
    //     assert(start and len(start)>0)
    // 
    //     i = g.skip_ws(s,i)
    //     assert(g.match(s,i,start))
    //     i += len(start)
    // 
    //     # 7/8/02: Support for REM hack
    //     i = g.skip_ws(s,i)
    //     assert(i < len(s) and s[i] == '@')
    //     return i + 1
    //@-at
    //@-node:zorcanda!.20051006102133:skipSentinelStart4
    //@-others
    //@-node:zorcanda!.20051006100445:skippers
    //@+node:zorcanda!.20051004134925:utilities
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
    
        //if( pattern.equals( "@others" ) ) System.out.println( "LOOKING FOR OTHERS in: " + s + " at  " + i );
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
    //@+node:zorcanda!.20051004134925.1:set_delims_from_string
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
    //@-node:zorcanda!.20051004134925.1:set_delims_from_string
    //@+node:zorcanda!.20051004134925.2:set_delims_from_language
    
    
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
    //@-node:zorcanda!.20051004134925.2:set_delims_from_language
    //@+node:zorcanda!.20051004134925.3:is_nl is_ws
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
    //@-node:zorcanda!.20051004134925.3:is_nl is_ws
    //@+node:zorcanda!.20051004134925.4:skip_leading_ws_with_indent
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
    //@-node:zorcanda!.20051004134925.4:skip_leading_ws_with_indent
    //@+node:zorcanda!.20051004135405:removeLeadingWhitespace
    public String removeLeadingWhitespace( String s, int first_ws, int tab_width ){
    
        int j = 0; int ws = 0;
        //System.out.println( "FIRST_WS is " + first_ws );
        final char[] ca = s.toCharArray();
        for( final char ch: ca ){
            if( ws >= first_ws ) break;
            else if( ch == ' ' ){
            
                j += 1;
                ws += 1;
            
            
            }
            else if( ch == '\t' ){
                j += 1;
                ws += (abs( tab_width ) - ( ws % abs( tab_width ) ) );
            
            }
            else break;
        
        }
        if( j > 0 ) s = s.substring( j );
        return s;
    
    
    }
    
    
    
    
    //@+at
    // # Remove whitespace up to first_ws wide in s, given tab_width, the 
    // width of a tab.
    // 
    // def removeLeadingWhitespace (s,first_ws,tab_width):
    // 
    //     j = 0 ; ws = 0
    //     for ch in s:
    //         if ws >= first_ws:
    //             break
    //         elif ch == ' ':
    //             j += 1 ; ws += 1
    //         elif ch == '\t':
    //             j += 1 ; ws += (abs(tab_width) - (ws % abs(tab_width)))
    //         else: break
    //     if j > 0:
    //         s = s[j:]
    //     return s
    //@-at
    //@nonl
    //@-node:zorcanda!.20051004135405:removeLeadingWhitespace
    //@-others
    //@-node:zorcanda!.20051004134925:utilities
    //@-others




}
//@nonl
//@-node:zorcanda!.20051003150005:@thin LeoFileReader.java
//@-leo
