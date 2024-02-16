<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: https://leo-editor.github.io/leo-editor/leo_toc.html -->
<leo_file xmlns:leo="https://leo-editor.github.io/leo-editor/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20240129180143.1"><vh>startup</vh>
<v t="ekr.20240129180219.1"><vh>@settings</vh>
<v t="ekr.20240129180254.1"><vh>@string target-language = nim</vh></v>
<v t="ekr.20240202175323.1"><vh>@data history-list</vh></v>
<v t="ekr.20240203192653.1"><vh>Syntax coloring</vh>
<v t="ekr.20240203192653.2"><vh>@bool color-trailing-whitespace = False</vh></v>
<v t="ekr.20240203192653.3"><vh>@bool use-pygments = False</vh></v>
<v t="ekr.20240203192653.4"><vh>@bool use-pygments-styles = False</vh></v>
<v t="ekr.20240203192653.6"><vh>@string pygments-style-name = leonine</vh></v>
<v t="ekr.20240210062456.1"><vh>Colors: nim</vh>
<v t="ekr.20240210062456.2"><vh>@color nim.keyword1 = @solarized-blue</vh></v>
<v t="ekr.20240210062456.3"><vh>@color nim.keyword2 = @solarized-blue</vh></v>
<v t="ekr.20240210062456.4"><vh>@color nim.keyword3 = @solarized-blue</vh></v>
<v t="ekr.20240210062456.5"><vh>@color nim.keyword4 = @solarized-purple</vh></v>
<v t="ekr.20240210062456.6"><vh>@color nim.literal1 = @alt-solarized-green</vh></v>
<v t="ekr.20240210062456.7"><vh>@color nim.literal2 = @alt-solarized-green</vh></v>
<v t="ekr.20240210062456.8"><vh>@color nim.comment1 = #d33682</vh></v>
<v t="ekr.20240210062456.9"><vh>@color nim.comment2 = @solarized-red</vh></v>
<v t="ekr.20240210062456.10"><vh>@color nim.comment3 = @solarized-red</vh></v>
<v t="ekr.20240210062456.11"><vh>@color nim.comment4 = @solarized-red</vh></v>
</v>
</v>
</v>
<v t="ekr.20240202173243.1"><vh>@@button backup</vh></v>
<v t="ekr.20240202174102.1"><vh>@@button run</vh></v>
</v>
<v t="ekr.20240202173928.1"><vh>Read Me</vh></v>
<v t="ekr.20240202172609.1"><vh>Finding libpython</vh></v>
<v t="ekr.20240213095558.1"><vh>Stats</vh></v>
<v t="ekr.20240213013556.1"><vh>old python tokenizer code (from main)</vh></v>
<v t="ekr.20240208212339.1"><vh>@@@edit c:\scripts\run.cmd</vh></v>
<v t="ekr.20240202191059.1"><vh>@@@file leoTokens.nim</vh>
<v t="ekr.20240202191144.2"><vh>&lt;&lt; leoTokens.nim: docstring &gt;&gt;</vh></v>
<v t="ekr.20240209091439.1"><vh>&lt;&lt; leoTokens.nim: imports &gt;&gt;</vh></v>
<v t="ekr.20240209082624.1"><vh>proc: truncate</vh></v>
<v t="ekr.20240210121625.1"><vh>class Tokenizer_Tuple (Not used)</vh></v>
<v t="ekr.20240209001930.1"><vh>class InputToken</vh>
<v t="ekr.20240209051657.1"><vh>InputToken.to_string</vh></v>
<v t="ekr.20240209001930.2"><vh>InputToken.brief_dump</vh></v>
<v t="ekr.20240209001930.3"><vh>InputToken.dump</vh></v>
<v t="ekr.20240209001930.4"><vh>InputToken.dump_header</vh></v>
<v t="ekr.20240209001930.5"><vh>InputToken.error_dump</vh></v>
<v t="ekr.20240209001930.6"><vh>InputToken.show_val</vh></v>
</v>
<v t="ekr.20240202191144.21"><vh>class Tokenizer</vh>
<v t="ekr.20240202191144.22"><vh>Tokenizer.add_token</vh></v>
<v t="ekr.20240202191144.26"><vh>Tokenizer.do_token (the gem)</vh></v>
</v>
<v t="ekr.20240209094150.1"><vh>proc: main</vh>
<v t="ekr.20240213020102.1"><vh>&lt;&lt; Define the contents &gt;&gt;</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20240129180143.1"></t>
<t tx="ekr.20240129180219.1"></t>
<t tx="ekr.20240129180254.1"></t>
<t tx="ekr.20240202172609.1">@language rest
@wrap

Error: unhandled exception: Could not load libpython.
Tried &lt;long list of dlls, all in the same directory&gt;.

=== Python must be on the path.

The most reliable way to find libpython is find_libpython python package:

pip install find_libpython
python -c 'import find_libpython; print(find_libpython.find_libpython())'

Then you can specify path to libpython using nimpy.py_lib.pyInitLibPath. Tracking issue: #171.

https://github.com/yglukhov/nimpy/issues/171
python3 -c 'import find_libpython; print(find_libpython.find_libpython())'

C:\Repos\leo-editor&gt;python -c "import find_libpython; print(find_libpython.find_libpython())"
C:\Python\Python3.12\python312.dll
</t>
<t tx="ekr.20240202173243.1">"""
Back up this .leo file.

os.environ['LEO_BACKUP'] must be the path to an existing (writable) directory.
"""
c.backup_helper(sub_dir='nim')
</t>
<t tx="ekr.20240202173928.1">@language rest

This outline contains code that transliterates a small part of leoTokens.py into Nim.

See #3662: https://github.com/leo-editor/leo-editor/issues/3662

I have deleted the corresponding repo.

PR #3717: https://github.com/leo-editor/leo-editor/pull/3717
discusses the code found here.
</t>
<t tx="ekr.20240202174102.1">g.cls()
if c.changed:
    c.save()
g.execute_shell_commands("run")</t>
<t tx="ekr.20240202175323.1">run
expand-body-pane
execute-script
backup
</t>
<t tx="ekr.20240202191059.1"># Leo's copyright notice is based on the MIT license:
# https://leo-editor.github.io/leo-editor/license.html

&lt;&lt; leoTokens.nim: docstring &gt;&gt;
&lt;&lt; leoTokens.nim: imports &gt;&gt;

{.hint[XDeclaredButNotUsed]:off.}
{. warning[UnusedImport]:off .}

@others

main()
echo("done")

@language nim
@tabwidth -4
@pagewidth 70
</t>
<t tx="ekr.20240202191144.2">#[
leoTokens.py: A token-based beautifier for Python.

Use Leo https://leo-editor.github.io/leo-editor/ to study this code!
]#
</t>
<t tx="ekr.20240202191144.21">#[
Use Python's tokenizer module to create InputTokens
See: https://docs.python.org/3/library/tokenize.html
]#

type
    Tokenizer = object  ### of RootObj
        contents: string
        offsets: seq[int] = @[]  # Index of start of each line.
        prev_offset: int = -1
        token_index: int = 0
        token_list: seq[InputToken] = @[]
        # Describing the scanned f-string...
        fstring_line: string = ""           ### was None,
        fstring_line_number: int = 0        ### was None
        fstring_values: seq[string] = @[]  # was None

@others
</t>
<t tx="ekr.20240202191144.22">#[
Add an InputToken to the token list.

Convert fstrings to simple strings.
]#

method add_token(
    self: var Tokenizer, kind: string, line: string, line_number: int, value: string
) {.base.} =

    var tok_line = line
    var tok_line_number = line_number
    var tok_value = value

    if self.fstring_values == @[]:       ### Was None
        if kind == "fstring_start":
            self.fstring_line = line
            self.fstring_line_number = line_number
            self.fstring_values.add(value)
            return
    else:
        # Accumulating an f-string.
        ### self.fstring_values.add(value)
        if kind != "fstring_end":
            return
        # Create a single "string" token from the saved values.

        tok_value = ""  ## .join(self.fstring_values)
        for z in self.fstring_values:
            tok_value &amp;= z

        # Use the line and line number of the "string-start" token.
        tok_line = self.fstring_line
        tok_line_number = self.fstring_line_number
        # Clear the saved values.
        self.fstring_line = ""          ### Was None
        self.fstring_line_number = -1   ### Was None
        self.fstring_values = @[]

    let tok = InputToken(
        kind: kind, value: tok_value, index: self.token_index,
        line: tok_line, line_number: tok_line_number
    )
    self.token_index += 1
    self.token_list.add(tok)
</t>
<t tx="ekr.20240202191144.26">#[
Handle the given token, optionally including between-token whitespace.

https://docs.python.org/3/library/tokenize.html
https://docs.python.org/3/library/token.html

five_tuple is a named tuple with these fields:
- type:     The token type;
- string:   The token string.
- start:    (srow: int, scol: int) The row (line_number!) and column
            where the token begins in the source.
- end:      (erow: int, ecol: int)) The row (line_number!) and column
            where the token ends in the source;
- line:     The *physical line on which the token was found.
]#

method do_token(
    self: Tokenizer, contents: string, five_tuple: Tokenizer_Tuple
) {.base.} =

    discard

    # Unpack..
    # let tok_kind, val, start, end_i, line = five_tuple
    # let s_row, s_col = start  # row/col offsets of start of token.
    # let e_row, e_col = end_i  # row/col offsets of end of token.
    # let line_number = s_row
    # ### let kind = token_module.tok_name[tok_kind]  ###.lower()
    # let kind = "dummy"  ###
    # # Calculate the token's start/end offsets: character offsets into contents.
    # let s_offset: int = self.offsets[max(0, s_row - 1)] + s_col
    # let e_offset: int = self.offsets[max(0, e_row - 1)] + e_col
    # # tok_s is corresponding string in the line.
    # let tok_s = contents[s_offset..e_offset]
    # # Add any preceding between-token whitespace.
    # let ws = contents[self.prev_offset..s_offset]
    # if ws:  # Create the 'ws' pseudo-token.
        # self.add_token("ws", line, line_number, ws)
    # # Always add token, even if it contributes no text!
    # self.add_token(kind, line, line_number, tok_s)
    # # Update the ending offset.
    # self.prev_offset = e_offset
</t>
<t tx="ekr.20240203192653.1"></t>
<t tx="ekr.20240203192653.2"></t>
<t tx="ekr.20240203192653.3"></t>
<t tx="ekr.20240203192653.4"></t>
<t tx="ekr.20240203192653.6"></t>
<t tx="ekr.20240208212339.1">@language batch
@echo off
cls
echo run.cmd

rem Put Python3.12 at the *start* of the path.
set PATH=C:\Python\Python3.12;%PATH%
rem echo %PATH%

call cd-ekr-nim
call nim c -r --verbosity:0 leoTokens.nim</t>
<t tx="ekr.20240209001930.1">#[
    A class representing a token produced by the Tokenizer class.
]#

type
    InputToken = object  ### of RootObj
        ### context: string
        index: int
        kind: string
        line: string  # The entire line containing the token.
        line_number: int
        value: string

# Forward refs.
method show_val(token: InputToken, truncate_n: int = 8): string {.base.}           

@others
</t>
<t tx="ekr.20240209001930.2">method brief_dump(token: InputToken): string {.base.} =
    # Dump a token.
    return (
        &amp;"line: {token.line_number} index: " &amp;
        &amp;"{token.index:3} {token.kind:&gt;10} : " &amp;
        &amp;"{token.show_val(10):12}"
    )
</t>
<t tx="ekr.20240209001930.3">method dump(token: InputToken): string {.base.} =
    # Dump a token and related links.
    return (
        &amp;"{token.line_number:4} {token.index:&gt;5} " &amp;
        &amp;"{token.kind:15} {token.show_val(100)}"
    )
</t>
<t tx="ekr.20240209001930.4">method dump_header(token: InputToken): string {.base.} =
    # Print the header for token.dump
    let pad = align(" ", 10)
    return (
        "\n" &amp;
        &amp;"line index kind {pad} value\n" &amp;
        &amp;"==== ===== ==== {pad} =====\n"
    )
</t>
<t tx="ekr.20240209001930.5">method error_dump(token: InputToken): string {.base.} =
    # Dump a token for error message.
    return (
        &amp;"index: {token.index:&lt;3} " &amp;
        &amp;"{token.kind:&gt;12} " &amp;
        &amp;"{token.show_val(20):&lt;20}"
    )
</t>
<t tx="ekr.20240209001930.6">method show_val(token: InputToken, truncate_n: int = 8): string {.base.} =
    # Return the token.value field.

    if token.kind == "ws" or token.kind == "indent":
        result = $(len(token.value))
    elif token.kind == "string" or startsWith(token.kind, "fstring"):
        # repr would be confusing.
        result = truncate(token.value, truncate_n)
    else:
        result = truncate(repr(token.value), truncate_n)
    return result
</t>
<t tx="ekr.20240209051657.1">method to_string(token: InputToken): string {.base.} =
    # Return the contribution of the token to the source file.
    return if token.value is string: token.value else: ""
</t>
<t tx="ekr.20240209082624.1">proc truncate(s: string, n: int): string =
    # Truncate string s to n characters.
    if s.len &lt;= n:
        return s
    return s[0..n - 4] &amp; "..."
</t>
<t tx="ekr.20240209091439.1">import nimpy

# enumerate: https://nim-lang.org/docs/enumerate.html
import std/enumerate

# std/str: https://nim-lang.org/docs/strutils.html
import std/strutils

# f-string: https://nim-lang.org/docs/strformat.html
import std/strformat

# i/o: https://nim-lang.org/docs/syncio.html
import std/syncio

# times: https://nim-lang.org/docs/times.html
import std/times

# nimpy...

# readline: https://docs.python.org/3/library/io.html#io.IOBase.readline
# let io = pyImport("io")

# token modle: https://docs.python.org/3/library/token.html
# let token_module = pyImport("token")

# tokenize module: https://docs.python.org/3/library/tokenize.html
let tokenize_module = pyImport("tokenize")
let TokenInfo = tokenize_module.TokenInfo
</t>
<t tx="ekr.20240209094150.1">proc to_nanosec(d: Duration): string =
    let n = d.inNanoseconds
    return &amp;"{n}"

proc main() =    
    let long = true
    let short = not long

    # Echo the file name.
    let file_name = r"C:\Repos\leo-editor\leo\core\leoAst.py"
    if long:
        echo file_name

    let t1 = now()
    &lt;&lt; Define the contents &gt;&gt;
    let t2 = now()
    let read_time = (t2 - t1)
        
    # Create an empty token list.
    type tokenizer_tuple = tuple[kind: string, value: string]
    var tokens_list = newSeq[tokenizer_tuple]()

    # Create a dummy tokenizer:
    var tokens = newSeq[tokenizer_tuple]()
    for line in splitLines(contents, true):  # Keep newlines.
        tokens.add((kind: "line", value: line))

    # Report the tokenize time.
    let t3 = now()
    let convert_time = (t3 - t2)
    if long:
        echo "Times in nano sec."
        echo &amp;"   Read:  {to_nanosec(read_time)}"
        echo &amp;"Convert:  {to_nanosec(convert_time)}"
        echo &amp;" Budget: 10_000"

    if short:
        echo(&amp;"len(tokens_list): {len(tokens_list)}")
        for i, z in enumerate(tokens_list):
            echo(&amp;"{i:2} {z}")
</t>
<t tx="ekr.20240210062456.1"></t>
<t tx="ekr.20240210062456.10"></t>
<t tx="ekr.20240210062456.11"></t>
<t tx="ekr.20240210062456.2">Official keywords and type names.</t>
<t tx="ekr.20240210062456.3">Constants: true, false, none.</t>
<t tx="ekr.20240210062456.4">Uppercase constants defined in system.</t>
<t tx="ekr.20240210062456.5">Procs.</t>
<t tx="ekr.20240210062456.6">Strings.</t>
<t tx="ekr.20240210062456.7"></t>
<t tx="ekr.20240210062456.8">Standard Leo comment color.</t>
<t tx="ekr.20240210062456.9">Nim nested comment.</t>
<t tx="ekr.20240210121625.1">type
    Tokenizer_Tuple = tuple[
        kind: string,
        value: string,
        # # # # start: tuple[s_row: int, s_col: int],
        # # # start0: int,
        # # # start1: int,
        # # # # end_i: tuple[e_row: int, e_col: int],
        # # # end0: int,
        # # # end1: int,
        # # # line: string,
    ]
</t>
<t tx="ekr.20240213013556.1">@language nim

if false:
    var token = InputToken(kind:"test", value:"value")
    echo()
    # echo(&amp;"token: {token}")
    # echo(token.brief_dump())
    echo(token.dump_header())
    echo(token.dump())

iterator nim_readline(contents: string): string =
    for line in splitLines(contents, true):  # Keep newlines.
        yield line

# Create a python generator.
let text_stream = io.StringIO(contents)
let readline = text_stream.readline
let tokens = tokenize_module.generate_tokens(readline)

# List the tokens.
tokens are 5-tuples (TokenInfo named tuples)

let d = token_module.tok_name
for token in tokens:

    let kind_s = toLowerAscii($d[token[0]])
    let value_s = $token[1]
    let start0: int = parseInt($token[2][0])
    let start1: int = parseInt($token[2][1])
    let end0: int = parseInt($token[3][0])
    let end1: int = parseInt($token[3][1])
    let start_s = &amp;"({start0}:{start1})"
    let end_s = &amp;"({end0}:{end1})"
    let line_s = strip($token[4])
    # Add a new token to the tokens list.
    let new_tuple: tokenizer_tuple = (kind: kind_s, value: value_s)
    tokens_list.add(new_tuple)

    if short:
        echo (&amp;"{kind_s:&gt;12}: {value_s:&lt;20} {start_s:8} {end_s:8} {line_s}")
    
if false:  # Performance test.
    # Add a dummy token tuple
    let new_tuple: tokenizer_tuple = (kind: "", value: "")
    tokens_list.add(new_tuple)
</t>
<t tx="ekr.20240213020102.1">var contents: string
if long:
    contents = readFile(file_name)
    # echo &amp;"{file_name} len: {len(s)}"
else:
    contents = dedent(
        """
            # def spam():
                # pass
        """
    )
</t>
<t tx="ekr.20240213095558.1">@language rest
@wrap

tbo: 0.1 sec. dirty: 0 checked: 1 beautified: 0 in leo\core\leoAst.py
tbo: 100 milli sec.
budget: 10 mill sec. = 10000 micro sec. = 10000000

Times in nano sec.
   Read:  0999000
Convert:  2030400
 Budget: 10000000

Times in micro sec.
   Read:   999.0
Convert:  2030.4
 Budget: 10000.0

Times in milli sec.
   Read:  1.0
Convert:  2.0
 Budget: 10.0

Nim: 577 milli sec.</t>
</tnodes>
</leo_file>
