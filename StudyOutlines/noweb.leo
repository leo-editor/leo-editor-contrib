<?xml version="1.0" encoding="UTF-8"?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="47" clone_windows="0"/>
<globals body_outline_ratio="0.5">
	<global_window_position top="25" left="77" height="25" width="77"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences allow_rich_text="0">
</preferences>
<find_panel_settings>
	<find_string></find_string>
	<change_string></change_string>
</find_panel_settings>
<vnodes>
<v t="T1" a="MV"><vh>Read me</vh></v>
<v t="T2" a="E"><vh>notangle</vh>
<v t="T3"><vh>@root notangle.h</vh></v>
<v t="T4"><vh>@root notangle.c</vh>
<v t="T5"><vh>&lt;&lt; limbo &gt;&gt;</vh></v>
<v t="T6"><vh>&lt;&lt; includes &gt;&gt;</vh></v>
<v t="T7"><vh>emit_module_named</vh>
<v t="T8" a="E"><vh>&lt;&lt;quit if we couldn't find the root&gt;&gt;</vh></v>
</v>
<v t="T9"><vh>insist</vh>
<v t="T10"><vh>&lt;&lt;if [[line==NULL]] die of premature end of file&gt;&gt;</vh></v>
</v>
<v t="T11" a="M"><vh>read_defs</vh>
<v t="T12"><vh>&lt;&lt;repeat [[line = getline(in);]] until EOF, [[@defn]], or [[@text]]&gt;&gt;</vh></v>
<v t="T13"><vh>&lt;&lt;track line numbers, then [[continue]] unless [[line]] is [[@begin code]]&gt;&gt;</vh>
<v t="T14" a="CE"><vh>&lt;&lt;[[} else if (line]] contains [[@file]] or [[@line) {]] adjust [[loc]]&gt;&gt;</vh>
<v t="T15"><vh>&lt;&lt;save name from [[line]] ([[@file ...]]) into [[loc.filename]]&gt;&gt;</vh></v>
<v t="T16" a="E"><vh>&lt;&lt;save line number from [[line]] ([[@line ...]]) into [[loc.lineno]]&gt;&gt;</vh>
<v t="T17"><vh>&lt;&lt;fail if string [[temp]] contains a non-digit&gt;&gt;</vh></v>
</v>
</v>
</v>
<v t="T18"><vh>&lt;&lt;copy module name into [[modname]]&gt;&gt;</vh></v>
<v t="T14" a="C"><vh>&lt;&lt;[[} else if (line]] contains [[@file]] or [[@line) {]] adjust [[loc]]&gt;&gt;</vh>
<v t="T15"><vh>&lt;&lt;save name from [[line]] ([[@file ...]]) into [[loc.filename]]&gt;&gt;</vh></v>
<v t="T16" a="E"><vh>&lt;&lt;save line number from [[line]] ([[@line ...]]) into [[loc.lineno]]&gt;&gt;</vh>
<v t="T17"><vh>&lt;&lt;fail if string [[temp]] contains a non-digit&gt;&gt;</vh></v>
</v>
</v>
<v t="T19"><vh>&lt;&lt;complain of botched code chunk&gt;&gt;</vh></v>
</v>
<v t="T20"><vh>warn_dots</vh></v>
</v>
</v>
<v t="T21"><vh>noweave</vh>
<v t="T22"><vh>Limbo</vh></v>
<v t="T23"><vh>&lt;&lt; @ &gt;&gt;</vh></v>
<v t="T24"><vh>&lt;&lt;noweave&gt;&gt;</vh></v>
<v t="T25"><vh>&lt;&lt;initialization&gt;&gt;</vh></v>
<v t="T26"><vh>&lt;&lt;initialization&gt;&gt;</vh></v>
<v t="T27"><vh>&lt;&lt;scan options and arguments&gt;&gt;</vh></v>
<v t="T28"><vh>&lt;&lt;option printout for usage&gt;&gt;</vh></v>
<v t="T29"><vh>&lt;&lt;noweave man page option table&gt;&gt;</vh></v>
<v t="T30"><vh>&lt;&lt;insist first-pass options are self-consistent&gt;&gt;</vh></v>
<v t="T31"><vh>&lt;&lt;first pass {\tt noweave} options&gt;&gt;</vh></v>
<v t="T32"><vh>&lt;&lt;noweave man page indexing options&gt;&gt;</vh></v>
<v t="T33"><vh>&lt;&lt;first pass {\tt noweave} options&gt;&gt;</vh></v>
<v t="T34"><vh>&lt;&lt;noweave man page indexing options&gt;&gt;</vh></v>
<v t="T35"><vh>&lt;&lt;print all legal [[-autodefs]] or complain&gt;&gt;</vh></v>
<v t="T36"><vh>&lt;&lt;first pass {\tt noweave} options&gt;&gt;</vh></v>
<v t="T37"><vh>&lt;&lt;noweave man page option table&gt;&gt;</vh></v>
<v t="T38"><vh>&lt;&lt;first pass {\tt noweave} options&gt;&gt;</vh></v>
<v t="T39"><vh>&lt;&lt;noweave man page option table&gt;&gt;</vh></v>
<v t="T40"><vh>header</vh></v>
<v t="T41"><vh>&lt;&lt;noweave man page option table&gt;&gt;</vh></v>
<v t="T42"><vh>&lt;&lt;first pass {\tt noweave} options&gt;&gt;</vh></v>
<v t="T43"><vh>&lt;&lt;noweave man page option table&gt;&gt;</vh></v>
<v t="T44"><vh>&lt;&lt;man page: WEAVING section&gt;&gt;</vh></v>
<v t="T45"><vh>&lt;&lt;man page: INDEXING AND CROSS-REFERENCE section&gt;&gt;</vh></v>
<v t="T46"><vh>&lt;&lt;add [[$newfilter]] (could overflow)&gt;&gt;</vh></v>
<v t="T47"><vh>&lt;&lt;emit markup on standard output&gt;&gt;</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="T1">@ Warning!  Do not attempt to create derived files from this outline!  This outline is for study and illustration only!

Warning! Present versions of Leo will not Tangle these files properly.  We would have to use @root trees instead of @file trees to have any hope of tangling these files correctly.

Note:  The noweb copyright states the following:

"You may use and distribute noweb for any purpose, for free. You may modify noweb and create derived works, provided you retain the copyright notice, but the result may not be called noweb without my written consent. You may do anything you like with programs created with noweb. You may even sell noweb itself, for example, as part of a CD-ROM distribution, provided that what you sell is the true, complete, and unmodified noweb."

So while this Leo file is intended to be a faithful representation of the original noweb files, it is a _modified_ version of noweb, and the files derived from this file may not be called noweb without the written consent of Norman Ramsey.  To repeat, I do not recommend making derived files from this outline; this outline is for study only.

</t>
<t tx="T2">@ This file illustrates how to use Leo to study noweb large programs, such as noweb itself.  I assert that these files are far easier to understand than the original noweb files.  In particular, it is now immediately clear just what functions are defined in each part of the outline.  It is also immediately clear just where sections are used and defined.  As always, the outline presents an ever-present overview of all parts of the code.

I have moved a few section definitions so that each section is defined in a child of the node that references it.  In all cases, I believe this clarifies the code, even when it interrupts the "narrative".  In some cases I have grouped a series of sections containing declarations, includes, etc. into a single node.  It would also be good style to create separate sections for different groups of declarations.  I believe outline structure often suggests a better organization for a file, and I have resisted the temptation to make such changes.  One could also criticize the programming style, but bear in mind that much of this code is almost 20 years old.

This file was originally created using leo.py's Import Noweb Files command for each @file node.  This command did most of the work of creating outlines from the flat .nw files.
@c

@ignore
@unit</t>
<t tx="T3">@root notangle.h

&lt;&lt; header &gt;&gt;</t>
<t tx="T4">@ The structure of the program is as follows: first we accumulate all of the module definitions, then we write out the definition of the root module (normally [["*"]]). The module definition information will be stored statically in a table supplied by [[modtrees.h]]; we'll cover the details later.

@root notangle.c

static char rcsid[] = "$Id: notangle.nw,v 2.15 2001/03/28 18:44:46 nr Exp nr $";
static char rcsname[] = "$Name: v2_10a $";
#define MAX_MODNAME 255

&lt;&lt; limbo &gt;&gt;
&lt;&lt; includes &gt;&gt;
&lt;&lt; function definitions &gt;&gt;
&lt;&lt; * &gt;&gt;</t>
<t tx="T5">@ % Copyright 1991 by Norman Ramsey.  All rights reserved.
% See file COPYRIGHT for more information.

@ 
\subsection{Tangling a single file}
A cheap imitation of tangle.
The idea is a very cheap implementation of tangle.
The markup of the file is described in file markup.ow.</t>
<t tx="T6">#include &lt;stdio.h&gt;
#include &lt;string.h&gt;
#include &lt;stdlib.h&gt;
#include &lt;ctype.h&gt;
#include "strsave.h"
#include "getline.h"
#include "modules.h"
#include "modtrees.h"
#include "errors.h"
#include "match.h"
#include "notangle.h"</t>
<t tx="T7">&lt;&lt;header&gt;&gt;=
void emit_module_named (FILE *out, char *rootname, char *locformat);

&lt;&lt;*&gt;&gt;=
void emit_module_named (FILE *out, char *rootname, char *locformat) {
    Module root = NULL; /* ptr to root module */

    root = lookup(rootname);
    &lt;&lt;quit if we couldn't find the root&gt;&gt;
    (void) expand(root,0,0,0,locformat,out);
    putc('\n',out);                     /* make output end with newline */
}</t>
<t tx="T8">@ Error checking is perenially dull.
@c

if (root==NULL) {
    errormsg(Fatal, "The root module @&lt;&lt;%s@&gt;&gt; was not defined.", rootname);
    return;
}</t>
<t tx="T9">&lt;&lt;*&gt;&gt;=
void insist(char *line, char *keyword, char *msg) {
  &lt;&lt;if [[line==NULL]] die of premature end of file&gt;&gt;
  if (!is_keyword(line,keyword))
    impossible(msg);
}

&lt;&lt;Function declarations&gt;&gt;=
void insist(char *line, char *keyword, char *msg);</t>
<t tx="T10">@ This is used in several places.  EKR.  It is bad style.
@c

if (line==NULL) {
    impossible("End of file occurred in mid-module");
}</t>
<t tx="T11">@  We loop looking for the start of a code chunk. When we find one, we get the name of the module in which the code is to appear.   Then we just keep adding lines to that module until we see a terminator. After we see the terminator we start all over again looking for another code chunk.

&lt;&lt;header&gt;&gt;=
void read_defs(FILE *in);              /* read module definitions */

&lt;&lt;*&gt;&gt;=
void read_defs(FILE *in) {
    char modname[MAX_MODNAME+1] = ""; /* name of module currently being read, 
                                         [[""]] if no module is being read */ 
    Module modptr = NULL;       /* ptr to current module, or NULL */
    char *line = NULL;          /* buffer for input */
    Location loc;

    while ((line = getline(in)) != NULL) {
        if (is_keyword(line, "fatal")) exit(1);
        &lt;&lt;track line numbers, then [[continue]] unless [[line]] is [[@begin code]]&gt;&gt;
        &lt;&lt;repeat [[line = getline(in);]] until EOF, [[@defn]], or [[@text]]&gt;&gt;
        insist(line,"defn","code chunk had no definition line");
        &lt;&lt;copy module name into [[modname]]&gt;&gt;
        warn_dots(modname);       /* names ending in ... aren't like web */
        modptr = insert(modname); /* find or add module in table */

        line = getline(in);
        insist(line,"nl","definition line not followed by newline");
        loc.lineno++;
        line = getline(in);
        while (line != NULL &amp;&amp; !is_end(line,"code")) {
            if (is_keyword(line,"nl")) {
                addnewline(modptr);
                loc.lineno++;
            } else if (is_keyword(line,"text")) {
                addstring(modptr,line+1+4+1,loc);
            } else if (is_keyword(line,"use")) {
                warn_dots(line+1+3+5);
                addmodule(modptr,line+1+3+1);
            } else if (is_index(line, "nl")) {
                loc.lineno++;
            &lt;&lt;[[} else if (line]] contains [[@file]] or [[@line) {]] adjust [[loc]]&gt;&gt;
            } else if (!is_keyword(line, "index"))
                &lt;&lt;complain of botched code chunk&gt;&gt;
            line = getline(in);
        }
        &lt;&lt;if [[line==NULL]] die of premature end of file&gt;&gt;
    }
}</t>
<t tx="T12">@c

do { line = getline(in);
} while (line != NULL &amp;&amp; !is_keyword(line,"defn") &amp;&amp; !is_keyword(line,"text"));</t>
<t tx="T13">@c

if (is_keyword(line, "nl") || is_index(line, "nl")) {
    loc.lineno++;
&lt;&lt;[[} else if (line]] contains [[@file]] or [[@line) {]] adjust [[loc]]&gt;&gt;
} 
if (!is_begin(line, "code"))
    continue;</t>
<t tx="T14">@ The only tricky bit with the line numbers is to note that [[@line]] gives the line number of the {\em following} line, not of the line on which the [[@line]] appears.  That means [[loc.lineno]] must be decremented after it is  set, so that the next newline will increment it to the correct value.
@c

} else if (is_keyword(line,"file")) {
    &lt;&lt;save name from [[line]] ([[@file ...]]) into [[loc.filename]]&gt;&gt;
    loc.lineno = 1;
} else if (is_keyword(line, "line")) {
    &lt;&lt;save line number from [[line]] ([[@line ...]]) into [[loc.lineno]]&gt;&gt;
    loc.lineno--;</t>
<t tx="T15">@c

{ char temp[MAX_MODNAME+1];
  if (strlen(line) &gt;= MAX_MODNAME + strlen("@file "))
    overflow("file name size");
  strcpy(temp,line+strlen("@file "));
  temp[strlen(temp)-1]='\0';
  loc.filename = strsave(temp);
}</t>
<t tx="T16">@c

{ char temp[MAX_MODNAME+1];
  if (strlen(line) &gt;= MAX_MODNAME + strlen("@line "))
    overflow("file name size");
  strcpy(temp,line+strlen("@line "));
  temp[strlen(temp)-1]='\0';
  &lt;&lt;fail if string [[temp]] contains a non-digit&gt;&gt;
  loc.lineno = atoi(temp);
}</t>
<t tx="T17">@c

{ char *p;
  for (p = temp; *p; p++)
    if (!isdigit(*p)) 
      errormsg(Error, "non-numeric line number in `@line %s'", temp);
}</t>
<t tx="T18">@ When copying the module name or a file name, we have to strip the trailing newline.
@c

strcpy(modname,line+strlen("@defn "));
modname[strlen(modname)-1]='\0';
</t>
<t tx="T19">@c

errorat(loc.filename, loc.lineno, Error, "botched code chunk `%s'", line);</t>
<t tx="T20">@ In {\tt WEB}, module names ending in ``...'' may be prefixes for other names. We don't do anything like that here, but we do warn the user about ``...'' in case he's got a file converted from {\tt WEB}.

&lt;&lt;*&gt;&gt;=
static
void warn_dots(char *modname) {
  if (!strcmp(modname+strlen(modname)-3,"...")) 
    errormsg(Warning, "Module name @&lt;&lt;%s@&gt;&gt; isn't completed as in web", 
             modname);
}

&lt;&lt;Function declarations&gt;&gt;=
static void warn_dots(char *modname);          /* warn about names ending in ... */</t>
<t tx="T21">@ This is result of importing noweave.nw using the Import noweb files command.  IIRC, it has not been touched in any way.
@c
@ignore</t>
<t tx="T22">@ \section{Weaving a {\tt noweb} file into a \TeX file}
The copyright applies both to the {\tt noweb} source and to the
generated shell script.
</t>
<t tx="T23">&lt;&lt;copyright notice&gt;&gt;=
# Copyright 1991-1997 by Norman Ramsey.  All rights reserved.
# See file COPYRIGHT for more information.
# $Id: noweave.nw,v 1.6 1998/08/17 00:10:34 nr Exp nr $
</t>
<t tx="T24">@ Here's the organization of the source:

&lt;&lt;noweave&gt;&gt;=
#!/bin/sh
&lt;&lt;copyright notice&gt;&gt;
&lt;&lt;initialization&gt;&gt;
&lt;&lt;scan options and arguments&gt;&gt;
&lt;&lt;emit markup on standard output&gt;&gt; |
                                $backend $noindex $delay $shortxref
exit $?
&lt;&lt;if verbose, show back end&gt;&gt;=
if [ -n "$verbose" ]; then echo $backend $noindex $delay $shortxref 1&gt;&amp;2; fi</t>
<t tx="T25">@ The first item of initialization is to locate the {\tt noweb} library.

&lt;&lt;initialization&gt;&gt;= 
LIB=|LIBDIR|</t>
<t tx="T26">@
&lt;&lt;initialization&gt;&gt;=
markup=$LIB/markup backend=$LIB/totex
wrapper= delay= args= markopts= noweboptions= autodefs= verbose= shortxref=
noquote="-noquote" docanchor= noindex="-noindex"
filtera= filterb= filterc= filterd= filtere= filterf= filterg=
# following supported by change in totex back end
noquote=</t>
<t tx="T27">@ I make two passes over the arguments so as not to require that options be given in a certain order

&lt;&lt;scan options and arguments&gt;&gt;=
pass2setcmd="set ignore"
for i do
  pass2setcmd="$pass2setcmd '$i'"
done
arg=
while [ $# -gt 0 ]; do
  case $1 in
    &lt;&lt;first pass {\tt noweave} options&gt;&gt;
    -)  arg="$arg $1" ;;
    -*) echo "$0: Unrecognized option '$1'" 1&gt;&amp;2 ; &lt;&lt;show usage&gt;&gt;; exit 1 ;;
    *)  arg="$arg $1" ;;
  esac
  shift
done
&lt;&lt;insist first-pass options are self-consistent&gt;&gt;
if [ -z "$wrapper" ]; then wrapper=latex; fi
eval $pass2setcmd
shift
while [ $# -gt 0 ]; do
  case $1 in
    &lt;&lt;second pass {\tt noweave} options&gt;&gt;
  esac
  shift
done
&lt;&lt;old scan options and arguments&gt;&gt;=
pass2args="$*"
while [ $# -gt 0 ]; do
  case $1 in
    &lt;&lt;first pass {\tt noweave} options&gt;&gt;
    -*) echo "$0: Unrecognized option '$1'" 1&gt;&amp;2 ; &lt;&lt;show usage&gt;&gt;; exit 1 ;;
    *)  arg="$arg $1" ;;
  esac
  shift
done
if [ -z "$wrapper" ]; then wrapper=latex; fi
if [ -n "$pass2args" ]; then
  set ignoreme $pass2args
  shift
  while [ $# -gt 0 ]; do
    case $1 in
      &lt;&lt;second pass {\tt noweave} options&gt;&gt;
    esac
    shift
  done
fi
&lt;&lt;add [[$newopt]] to [[noweboptions]]&gt;&gt;=
if [ -z "$noweboptions" ] ; then noweboptions="$newopt"
else noweboptions="$noweboptions,$newopt"
fi
&lt;&lt;first pass {\tt noweave} options&gt;&gt;=
-latex)      if [ "$wrapper" != "none" ]; then wrapper=latex; fi ;;
-tex)        wrapper=tex ;;
-html)       if [ "$wrapper" != "none" ]; then wrapper=html; fi; 
             backend="$LIB/tohtml -localindex"
             noquote=""; docanchor="-docanchor 10" ;;
-latex+html) if [ "$wrapper" != "none" ]; then wrapper=latex; fi; 
             backend="$LIB/tohtml -localindex -raw"
             noquote=""; docanchor="-docanchor 10" ;;
-ascii)      wrapper=none
             backend="$LIB/toascii" ;;
-troff)      wrapper=mm
             backend="$LIB/toroff" ;;
-n)          wrapper=none ;;
-backend)    backend="$2" ; shift ;;
-markup)     markup="$2"  ; shift ;;</t>
<t tx="T28">@ Note some versions of echo break on [[echo "-n..."]], echoing nothing  at all.  The leading space is claimed to prevent this problem.

&lt;&lt;option printout for usage&gt;&gt;=
echo "-latex		Emit LaTeX with headers and trailers (default)." 1&gt;&amp;2
echo "-tex		Emit plain TeX with headers and trailers." 1&gt;&amp;2
echo "-html		Emit HTML with headers and trailers." 1&gt;&amp;2
echo "-latex+html	Assume LaTeX in documentation, but use HTML in code." 1&gt;&amp;2
# echo "-ascii            Emit ASCII." 1&gt;&amp;2
echo "-troff            Emit troff (actually GNU groff)." 1&gt;&amp;2
echo " -n		Don't use any header or trailer." 1&gt;&amp;2
echo "-markup frontend  Parse input with frontend (e.g., numarkup)." 1&gt;&amp;2</t>
<t tx="T29">@ \iffalse

&lt;&lt;noweave man page option table&gt;&gt;=
.TP
.B \-latex
Emit LaTeX, including wrapper in 
.B article
style with the
.B noweb
package and page style. (Default)
.TP 
.B \-tex
Emit plain TeX, including wrapper with
.B nwmac
macros.
.TP
.B \-html
Emit HTML, using HTML wrapper.
The output is uninteresting without \fB-index\fP or \fB-x\fP.
The tags \fB&lt;nowebchunks&gt;\fP and \fB&lt;nowebindex&gt;\fP, on lines by themselves,
produce a list of chunks and an index of identifiers, respectively.
If these tags are not present, the list and index are placed at the end of the file.
.TP
.B \-latex+html
Assume documentation chunks are LaTeX, but generate HTML for code chunks,
suitably marked so conversion with 
.I latex2html(1)
yields reasonable output.
A LaTeX wrapper is implied, but can be turned off with \fB-n\fP.
.I Use of this option is 
.B deprecated; 
use
.B \-html
with 
.B "\-filter l2h"
instead.
&lt;&lt;noweave man page option table&gt;&gt;=
.TP
.B \-troff
Emit 
.IR troff (1)
markup (with no wrapper).
The result should be processed with 
.IR noroff (1).
Bug reports for 
.B \-troff
to Aharon Robbins
.B &lt;arnold@gnu.org&gt;.
&lt;&lt;bogus noweave man page option table&gt;&gt;=
.TP
.B \-ascii
Emit ASCII (with no wrapper).
Bug reports for 
.B \-ascii
to Phil Bewig
.B &lt;pbewig@netcom.com&gt;.
&lt;&lt;noweave man page option table&gt;&gt;=
.TP
.B \-n
Don't use any wrapper (header or trailer).
This option is useful when \fInoweave\fP's output will be
a part of a larger document.
See also 
.B \-delay.</t>
<t tx="T30">@ \fi A common bug seems to be using both [[-x]] and [[-index]] on the same command line, so I complain about it.

&lt;&lt;insist first-pass options are self-consistent&gt;&gt;=
if [ -n "$using_xref" -a -n "$using_index" ]; then
  echo "$0: you may not use -x with -index or -indexfrom (drop the -x)" 1&gt;&amp;2
  exit 1
fi
&lt;&lt;initialization&gt;&gt;=
using_index= using_xref=</t>
<t tx="T31">@
&lt;&lt;first pass {\tt noweave} options&gt;&gt;=
-filter)    shift                           ;;
-x)                           using_xref=1  ;;
-index)            noindex= ; using_index=1 ;;                 
-indexfrom) shift; noindex= ; using_index=1 ;;
&lt;&lt;second pass {\tt noweave} options&gt;&gt;=
-filter) 
    newfilter="$2" ; shift ;                  &lt;&lt;add [[$newfilter]] (could overflow)&gt;&gt; ;;
-x) newfilter="$LIB/noidx $docanchor $delay"; &lt;&lt;add [[$newfilter]] (could overflow)&gt;&gt; ;;
-index)  
    newfilter="$LIB/finduses $noquote" ;      &lt;&lt;add [[$newfilter]] (could overflow)&gt;&gt;
    newfilter="$LIB/noidx $docanchor $delay"; &lt;&lt;add [[$newfilter]] (could overflow)&gt;&gt; ;;
-indexfrom)
    newfilter="$LIB/finduses $noquote $2";    &lt;&lt;add [[$newfilter]] (could overflow)&gt;&gt;
    newfilter="$LIB/noidx $docanchor $delay"; &lt;&lt;add [[$newfilter]] (could overflow)&gt;&gt;
    shift ;;
&lt;&lt;option printout for usage&gt;&gt;=
echo "-x		Use the default cross-referencer (needs LaTeX or HTML)." 1&gt;&amp;2
echo "-index		Create index using identifiers defined in input files." 1&gt;&amp;2
echo "-indexfrom defs	Create index of identifers listed in file defs." 1&gt;&amp;2
echo "-filter cmd	Filter through 'cmd' before weaving; cmd could prettyprint" 1&gt;&amp;2
echo "			or perform other functions." 1&gt;&amp;2</t>
<t tx="T32">@ \iffalse

&lt;&lt;noweave man page indexing options&gt;&gt;=
.TP
.B \-x
For 
.I LaTeX,
add a page number to each chunk name identifying the location of that
chunk's definition, and emit cross-reference information relating definitions and uses.
For 
.I HTML,
create hypertext links between uses and definitions of chunks.
When
.B noweave -x
is used with
.I LaTeX,
the control sequence
.B "\\\\nowebchunks"
expands to a sorted list of all code chunks.
.TP
.B \-index
Build cross-reference information (or hypertext links) for defined identifiers.
Definitions are those found in the input files by
.B \-autodefs
.I language
or by
.BR \-filter btdefn.
Requires
.I LaTeX
or
.I HTML.
.B \-index
implies
.B \-x;
including both will generate strange-looking output.
.I noweave
does not generate
cross-references to identifiers that appear in quoted code (\fB@[[\fP...\fB@]]\fP),
but it does generate hypertext links.
When
.B noweave -index
is used with
.I LaTeX, 
the control sequence
.B "\\\\nowebindex"
expands to an index of identifiers.
.TP
.B \-indexfrom \fIindex\fP
Like 
.B \-index,
but the identifiers to be indexed are taken from file \fIindex\fP.
See
.I noindex(1).
&lt;&lt;noweave man page option table&gt;&gt;=
.TP
.B \-filter \fIcmd\fP
Filters the 
.I noweb
source through 
.I cmd
after converting it to tool form and before converting to
.I TeX.
.I noweave
looks for 
.I cmd
first on the user's
.B PATH,
then in
.B |LIBDIR|.
Such filters
can be used to add features to
.I noweave;
for an example, see
.B |LIBDIR|/noxref.krom.
.I Noweave
supports up to four filters; one can get more by shell trickery, 
for example, \fB-filter "icon.filter | noidx"\fP.
The \fB-autodefs\fP,
\fB-x\fP, \fB-index\fP, and \fB-indexfrom\fP options are implemented as filters.
Filters are executed with the shell's
.B eval
command, so
.I cmd
should be quoted accordingly.
&lt;&lt;description of -markup option&gt;&gt;</t>
<t tx="T33">@ \fi  Note that it would be appropriate to look for autodefs using [[[ -x $newfilter ]]], but that stupid DEC Ultrix doesn't support [[test -x]], so the best I can do in a portable way is [[test -r]].

&lt;&lt;first pass {\tt noweave} options&gt;&gt;=
-autodefs) newfilter="$LIB/autodefs.$2"
           if [ -r $newfilter ]; then &lt;&lt;add [[$newfilter]] (could overflow)&gt;&gt;
           else echo "$0: don't know how to find definitions for '$2'" 1&gt;&amp;2; exit 1
           fi
	   shift
           ;;
-showautodefs) &lt;&lt;print all legal [[-autodefs]] or complain&gt;&gt;; exit 1 ;;
&lt;&lt;option printout for usage&gt;&gt;=
echo "-autodefs lang	Source is in language 'lang'; find definitions automatically." 1&gt;&amp;2
echo "-showautodefs	List languages that can be used with -autodefs" 1&gt;&amp;2</t>
<t tx="T34">@ \iffalse

&lt;&lt;noweave man page indexing options&gt;&gt;=
.TP
.B \-autodefs \fIlang\fP
Discover identifier definitions automatically.
Code in chunks must be in language \fIlang\fP.
Permissible \fIlang\fPs vary but may include
.B tex
or 
.B icon.
Useless without
.B \-index,
which it must precede.
.TP
.B \-showautodefs
Show values of \fIlang\fP usable with \fB-autodefs\fP.</t>
<t tx="T35">@ \fi  Same note as above regarding [[test -x]] vs [[test -r]].

&lt;&lt;print all legal [[-autodefs]] or complain&gt;&gt;=
foundautodefs=
for i in $LIB/autodefs.*; do
  if [ -r $i ]; then
    echo "This `basename $0` supports -autodefs $i" | 
                        sed "s@$LIB/autodefs\.@@" 1&gt;&amp;2
    foundautodefs=$i
  fi
done
if [ -z "$foundautodefs" ]; then
  echo "This `basename $0` does not support -autodefs"
fi</t>
<t tx="T36">@ Here's an embarrassing hack --- if we spot \verb+-option shortxref+  or \verb+-option longxref+ on the command line, we pass something suitable to the back end, in case we're doing HTML.

&lt;&lt;first pass {\tt noweave} options&gt;&gt;=
-option) newopt="$2"; shift
         if [ "X$newopt" = "Xshortxref" ]; then shortxref="-shortxref"; fi
         if [ "X$newopt" = "Xlongxref" ];  then shortxref="-longxref";  fi
         &lt;&lt;add [[$newopt]] to [[noweboptions]]&gt;&gt; ;;
&lt;&lt;option printout for usage&gt;&gt;=
echo '-option opt	Add \noweboptions{opt} to header (latex only)' 1&gt;&amp;2</t>
<t tx="T37">@ \iffalse

&lt;&lt;noweave man page option table&gt;&gt;=
.TP 
.B \-option \fIopt\fP
Adds \fB\enoweboptions{\fP\fIopt\fP\fB}\fP to the
.I LaTeX
header.
See 
.I nowebstyle(1) 
for values of
.I opt.
Normally useful only with the
.B \-latex
option, but 
.B "\-option longxref"
works black magic with 
.B \-html.</t>
<t tx="T38">@ \fi

&lt;&lt;first pass {\tt noweave} options&gt;&gt;=
# -nodelay) delay= ;;
-delay)   delay="-delay" ; wrapper=none ;;
&lt;&lt;option printout for usage&gt;&gt;=
echo "-delay		Delay markup until after first documentation chunk." 1&gt;&amp;2</t>
<t tx="T39">@ \iffalse

&lt;&lt;noweave man page option table&gt;&gt;=
.TP
.B \-delay
By default, 
.I noweave
puts file-name and other information into the output before the first chunk
of the program.
.B \-delay
delays that information until after the first documentation chunk, making
act a little bit like the 
.I WEB
``limbo.''
The option is typically used to enable a user to put a specialized
.I LaTeX
.B "\\\\documentclass"
command and other preamble material in the first documentation chunk.
This option also forces trailing cross-referencing information to be emitted
just before the final chunk, instead of at the end of the document;
the final chunk is expected to contain
.B "\\\\end{document}."
The 
.B \-delay
option implies the
.B \-n 
option.</t>
<t tx="T40">@ \fi % .TP % .B \-nodelay % Don't delay, put file-name and other information right after header. (Default) % @ \fi

&lt;&lt;first pass {\tt noweave} options&gt;&gt;=
-t*) markopts="$markopts $1" ;;
&lt;&lt;option printout for usage&gt;&gt;=
echo "-tk		Expand tab stops every k columns" 1&gt;&amp;2
echo "-t		Copy tabs to the output" 1&gt;&amp;2</t>
<t tx="T41">@ \iffalse

&lt;&lt;noweave man page option table&gt;&gt;=
.TP
.B \-t\fIk\fP
Expand tabs with stops every \fIk\fP columns.
(Default is to expand every 8 columns.)
.TP
.B \-t
Copy tabs to the output.</t>
<t tx="T42">@ \fi

&lt;&lt;first pass {\tt noweave} options&gt;&gt;=
-v) echo 'RCS version name $Name:  $' 1&gt;&amp;2
    echo 'RCS id $Id: noweave.nw,v 1.6 1998/08/17 00:10:34 nr Exp nr $' 1&gt;&amp;2
    verbose=1 ;;
&lt;&lt;option printout for usage&gt;&gt;=
echo "-v		Print pipeline and RCS info on standard error" 1&gt;&amp;2</t>
<t tx="T43">@ \iffalse

&lt;&lt;noweave man page option table&gt;&gt;=
.TP
.B \-v
Print the pipeline and RCS info on standard error.</t>
<t tx="T44">@ \fi \iffalse

&lt;&lt;man page: WEAVING section&gt;&gt;=
Output from \fInoweave\fP can
be used in \fITeX\fP documents that 
.B "\\\\input nwmac,"
in \fILaTeX\fP documents that  use the
.B noweb
package (see \fInowebstyle(1)\fP),
and in \fIHTML\fP documents to be browsed with 
.I Mosaic(1).
.I Noweave
treats code chunks somewhat like
.I LaTeX list environments.
If the ``\fB@ \fP'' that terminates a code chunk is followed immediately by text,
that text follows the code chunk without a paragraph break.
If the rest of the line is blank, 
.I noweave
puts 
.I TeX
into ``vertical mode,'' and later text starts a fresh, indented paragraph.
.PP
No page breaks occur in the middle of code chunks unless necessary to avoid
an overfull vbox.
The documentation chunk immediately preceding a code chunk appears on
the same page as that code chunk unless doing so would violate the previous rule.
.PP
.I Noweave
inserts no extra newlines in its \fITeX\fP output, so the line numbers given
in
.I TeX
error messages are the same as those in the input file.
.PP
.I noweave
has
options that dictate choice of 
formatter
and that support different formatting idioms and tools.
Basic options are described here; options related to index
and cross-reference information are described in the 
INDEXING AND CROSS-REFERENCE section.
&lt;&lt;noweave man page option table&gt;&gt;</t>
<t tx="T45">@
&lt;&lt;man page: INDEXING AND CROSS-REFERENCE section&gt;&gt;=</t>
<t tx="T46">@ \fi

&lt;&lt;add [[$newfilter]] (could overflow)&gt;&gt;=
if   [ -z "$filtera" ]; then
  filtera="$newfilter"
elif [ -z "$filterb" ]; then
  filterb="$newfilter"
elif [ -z "$filterc" ]; then
  filterc="$newfilter"
elif [ -z "$filterd" ]; then
  filterd="$newfilter"
elif [ -z "$filtere" ]; then
  filtere="$newfilter"
elif [ -z "$filterf" ]; then
  filterf="$newfilter"
elif [ -z "$filterg" ]; then
  filterg="$newfilter"
else
  echo "$0: ran out of filters" 1&gt;&amp;2
  exit 1
fi
&lt;&lt;show usage&gt;&gt;=
echo "Usage: $0 [options] [files]" 1&gt;&amp;2
echo "Options recognized are:" 1&gt;&amp;2
&lt;&lt;option printout for usage&gt;&gt;</t>
<t tx="T47">@ To avoid inserting any extra newlines into the output,  I use [[@literal]]to insert headers and trailers. The altered [[PATH]] provides a convenience to people who want to use simple names to refer to filters in [[$LIB]].

&lt;&lt;emit markup on standard output&gt;&gt;=
(
header=
case $wrapper in
  none) ;;
  latex)  header="@header $wrapper $noweboptions" 
	  trailer="@trailer $wrapper" ;;
  *)  header="@header $wrapper$arg" 
      trailer="@trailer $wrapper" ;;
esac
if [ -n "$header" ]; then echo "$header"; fi
PATH="$PATH:$LIB" 
export PATH
&lt;&lt;if verbose, make noise about pipeline&gt;&gt;
&lt;&lt;if verbose, show back end&gt;&gt;
if   [ -z "$filtera" ]; then
  $markup $markopts $arg
elif [ -z "$filterb" ]; then
  $markup $markopts $arg | eval $filtera
elif [ -z "$filterc" ]; then
  $markup $markopts $arg | eval $filtera | eval $filterb
elif [ -z "$filterd" ]; then
  $markup $markopts $arg | eval $filtera | eval $filterb | eval $filterc
elif [ -z "$filtere" ]; then
  $markup $markopts $arg | eval $filtera | eval $filterb | eval $filterc |
                           eval $filterd
elif [ -z "$filterf" ]; then
  $markup $markopts $arg | eval $filtera | eval $filterb | eval $filterc |
                           eval $filterd | eval $filtere
elif [ -z "$filterg" ]; then
  $markup $markopts $arg | eval $filtera | eval $filterb | eval $filterc |
                           eval $filterd | eval $filtere | eval $filterf
else
  $markup $markopts $arg | eval $filtera | eval $filterb | eval $filterc |
                           eval $filterd | eval $filtere | eval $filterf |
                           eval $filterg
fi
if [ -n "$trailer" ]; then echo $trailer; fi
)
&lt;&lt;if verbose, make noise about pipeline&gt;&gt;=
if [ -n "$verbose" ]; then
  if [ -n "$header" -o -n "$trailer" ]; then
    parenpfx="("
    if [ -n "$header" ]; then echo "(echo $header" 1&gt;&amp;2; parenpfx=" "; fi
    echo "$parenpfx$markup" $markopts $arg 1&gt;&amp;2
    if [ -n "$trailer" ]; then echo " echo $trailer" 1&gt;&amp;2; fi
    echo ") |" 1&gt;&amp;2
  else
    echo $markup $markopts $arg '|' 1&gt;&amp;2
  fi
  if   [ -n "$filtera" ]; then echo $filtera '|' 1&gt;&amp;2; fi
  if   [ -n "$filterb" ]; then echo $filterb '|' 1&gt;&amp;2; fi
  if   [ -n "$filterc" ]; then echo $filterc '|' 1&gt;&amp;2; fi
  if   [ -n "$filterd" ]; then echo $filterd '|' 1&gt;&amp;2; fi
  if   [ -n "$filtere" ]; then echo $filtere '|' 1&gt;&amp;2; fi
  if   [ -n "$filterf" ]; then echo $filterf '|' 1&gt;&amp;2; fi
  if   [ -n "$filterg" ]; then echo $filterg '|' 1&gt;&amp;2; fi
fi</t>
</tnodes>
</leo_file>
