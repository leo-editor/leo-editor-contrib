<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: https://leo-editor.github.io/leo-editor/leo_toc.html -->
<leo_file xmlns:leo="https://leo-editor.github.io/leo-editor/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20240411163111.1"><vh>@startup</vh>
<v t="ekr.20240411171347.1"><vh>@settings</vh>
<v t="ekr.20240411171351.1"><vh>@data history-list</vh></v>
<v t="ekr.20240412072749.1"><vh>@string target-language = rust</vh></v>
</v>
<v t="ekr.20240411165644.1"><vh>@command test @key=ctrl+p</vh></v>
</v>
<v t="ekr.20240411163510.1"><vh>Read Me</vh></v>
<v t="ekr.20240411170811.1"><vh>## @edit Cargo.toml</vh></v>
<v t="ekr.20240411165212.1"><vh>## @file src/main.rs</vh></v>
<v t="ekr.20240412022135.1"><vh>## @file src/leotokens.rs</vh>
<v t="ekr.20240414172341.1"><vh>&lt;&lt; leoTokens.rs: global suppressions &gt;&gt;</vh></v>
<v t="ekr.20240414212026.1"><vh>&lt;&lt; leoTokens.rs: use statements &gt;&gt;</vh></v>
<v t="ekr.20240414210823.1"><vh>Classes (leoTokens.rs)</vh>
<v t="ekr.20240414163749.1"><vh>class Beautifier </vh>
<v t="ekr.20240415163731.1"><vh>Beautifier::add_output_string</vh></v>
<v t="ekr.20240416192621.1"><vh>Beautifier::add_input_token</vh></v>
<v t="ekr.20240414170132.1"><vh>Beautifier::beautify_all_files</vh></v>
<v t="ekr.20240415114328.1"><vh>Beautifier::beautify_one_file</vh>
<v t="ekr.20240416170422.1"><vh>&lt;&lt; show output_list &gt;&gt;</vh></v>
</v>
<v t="ekr.20240416172357.1"><vh>Beautifier::do_*</vh>
<v t="ekr.20240416154842.1"><vh>Handlers with values</vh>
<v t="ekr.20240416153903.1"><vh>do_Comment</vh></v>
<v t="ekr.20240416154346.1"><vh>do_Complex</vh></v>
<v t="ekr.20240416154933.1"><vh>do_Float</vh></v>
<v t="ekr.20240416154933.2"><vh>do_Int</vh></v>
<v t="ekr.20240416154934.1"><vh>do_Name</vh></v>
<v t="ekr.20240416153935.1"><vh>do_String</vh></v>
</v>
<v t="ekr.20240416155917.1"><vh>Handlers using lws</vh>
<v t="ekr.20240416155250.1"><vh>do_Dedent</vh></v>
<v t="ekr.20240416155952.1"><vh>do_Indent</vh></v>
<v t="ekr.20240416160309.1"><vh>do_Newline</vh></v>
<v t="ekr.20240416160310.1"><vh>do_NonLogicalNewline</vh></v>
</v>
<v t="ekr.20240416155517.1"><vh>Handlers w/o values</vh>
<v t="ekr.20240416154347.1"><vh>do_Amper</vh></v>
<v t="ekr.20240416161356.1"><vh>do_AmperEqual</vh></v>
<v t="ekr.20240416161357.1"><vh>do_And</vh></v>
<v t="ekr.20240416161357.2"><vh>do_As</vh></v>
<v t="ekr.20240416161357.3"><vh>do_Assert</vh></v>
<v t="ekr.20240416161357.4"><vh>do_Async</vh></v>
<v t="ekr.20240416161357.5"><vh>do_At</vh></v>
<v t="ekr.20240416161358.1"><vh>do_AtEqual</vh></v>
<v t="ekr.20240416161658.1"><vh>do_Await</vh></v>
<v t="ekr.20240416161823.1"><vh>do_Break</vh></v>
<v t="ekr.20240416161824.1"><vh>do_Case</vh></v>
<v t="ekr.20240416161824.2"><vh>do_CircumFlex</vh></v>
<v t="ekr.20240416162128.1"><vh>do_CircumflexEqual</vh></v>
<v t="ekr.20240416161955.1"><vh>do_Class</vh></v>
<v t="ekr.20240416161955.2"><vh>do_Colon</vh></v>
<v t="ekr.20240416161956.1"><vh>do_ColonEqual</vh></v>
<v t="ekr.20240416161956.2"><vh>do_Comma</vh></v>
<v t="ekr.20240416161956.3"><vh>do_Continue</vh></v>
<v t="ekr.20240416162226.1"><vh>do_Def</vh></v>
<v t="ekr.20240416162226.2"><vh>do_Del</vh></v>
<v t="ekr.20240416162226.3"><vh>do_Dot</vh></v>
<v t="ekr.20240416162226.4"><vh>do_DoubleSlash</vh></v>
<v t="ekr.20240416162226.5"><vh>do_DoubleSlashEqual</vh></v>
<v t="ekr.20240416162348.1"><vh>do_DoubleStar</vh></v>
<v t="ekr.20240416162349.1"><vh>do_DoubleStarEqual</vh></v>
<v t="ekr.20240416162349.2"><vh>do_Elif</vh></v>
<v t="ekr.20240416162349.3"><vh>do_Ellipsis</vh></v>
<v t="ekr.20240416162349.4"><vh>do_Else</vh></v>
<v t="ekr.20240416162540.1"><vh>do_EndOfFile</vh></v>
<v t="ekr.20240416162540.2"><vh>do_EqEqual</vh></v>
<v t="ekr.20240416162540.3"><vh>do_Equal</vh></v>
<v t="ekr.20240416162540.4"><vh>do_Except</vh></v>
<v t="ekr.20240416162541.1"><vh>do_False</vh></v>
<v t="ekr.20240416162722.1"><vh>do_Finally</vh></v>
<v t="ekr.20240416162723.1"><vh>do_For</vh></v>
<v t="ekr.20240416162723.2"><vh>do_From</vh></v>
<v t="ekr.20240416162723.3"><vh>do_Global</vh></v>
<v t="ekr.20240416162723.4"><vh>do_Greater</vh></v>
<v t="ekr.20240416162724.1"><vh>do_GreaterEqual</vh></v>
<v t="ekr.20240416162829.1"><vh>do_If</vh></v>
<v t="ekr.20240416162829.2"><vh>do_Import</vh></v>
<v t="ekr.20240416162829.3"><vh>do_In</vh></v>
<v t="ekr.20240416162830.1"><vh>do_Is</vh></v>
<v t="ekr.20240416162830.2"><vh>do_Lambda</vh></v>
<v t="ekr.20240416162927.1"><vh>do_Lbrace</vh></v>
<v t="ekr.20240416162927.2"><vh>do_LeftShift</vh></v>
<v t="ekr.20240416162928.1"><vh>do_LeftShiftEqual</vh></v>
<v t="ekr.20240416162928.2"><vh>do_Less</vh></v>
<v t="ekr.20240416162929.1"><vh>do_LessEqual</vh></v>
<v t="ekr.20240416163047.1"><vh>do_Lpar</vh></v>
<v t="ekr.20240416163047.2"><vh>do_Lsqb</vh></v>
<v t="ekr.20240416163047.3"><vh>do_Match</vh></v>
<v t="ekr.20240416163048.1"><vh>do_Minus</vh></v>
<v t="ekr.20240416163048.2"><vh>do_MinusEqual</vh></v>
<v t="ekr.20240416163333.1"><vh>do_None</vh></v>
<v t="ekr.20240416163334.1"><vh>do_Nonlocal</vh></v>
<v t="ekr.20240416163334.2"><vh>do_Not</vh></v>
<v t="ekr.20240416163334.3"><vh>do_NotEqual</vh></v>
<v t="ekr.20240416163429.1"><vh>do_Or</vh></v>
<v t="ekr.20240416163429.2"><vh>do_Pass</vh></v>
<v t="ekr.20240416163429.3"><vh>do_Percent</vh></v>
<v t="ekr.20240416163430.1"><vh>do_PercentEqual</vh></v>
<v t="ekr.20240416163547.1"><vh>do_Plus</vh></v>
<v t="ekr.20240416163546.1"><vh>do_PlusEqual</vh></v>
<v t="ekr.20240416163547.2"><vh>do_Raise</vh></v>
<v t="ekr.20240416163547.3"><vh>do_Rarrow</vh></v>
<v t="ekr.20240416163548.1"><vh>do_Rbrace</vh></v>
<v t="ekr.20240416163709.1"><vh>do_Return</vh></v>
<v t="ekr.20240416163710.1"><vh>do_RightShift</vh></v>
<v t="ekr.20240416163710.2"><vh>do_RightShiftEqual</vh></v>
<v t="ekr.20240416163710.3"><vh>do_Rpar</vh></v>
<v t="ekr.20240416163802.1"><vh>do_Rsqb</vh></v>
<v t="ekr.20240416163803.1"><vh>do_Semi</vh></v>
<v t="ekr.20240416163803.2"><vh>do_Slash</vh></v>
<v t="ekr.20240416163803.3"><vh>do_SlashEqual</vh></v>
<v t="ekr.20240416163804.1"><vh>do_Star</vh></v>
<v t="ekr.20240416163907.1"><vh>do_StarEqual</vh></v>
<v t="ekr.20240416163908.1"><vh>do_StartExpression</vh></v>
<v t="ekr.20240416165105.1"><vh>do_StartInteractive</vh></v>
<v t="ekr.20240416165106.1"><vh>do_StarModule</vh></v>
<v t="ekr.20240416163908.2"><vh>do_Tilde</vh></v>
<v t="ekr.20240416163908.3"><vh>do_True</vh></v>
<v t="ekr.20240416163909.1"><vh>do_Try</vh></v>
<v t="ekr.20240416164042.1"><vh>do_Type</vh></v>
<v t="ekr.20240416164043.1"><vh>do_Vbar</vh></v>
<v t="ekr.20240416164043.2"><vh>do_VbarEqual</vh></v>
<v t="ekr.20240416164043.3"><vh>do_While</vh></v>
<v t="ekr.20240416164043.4"><vh>do_With</vh></v>
<v t="ekr.20240416164136.1"><vh>do_Yield</vh></v>
</v>
</v>
<v t="ekr.20240415094152.1"><vh>Beautifier::enabled</vh></v>
<v t="ekr.20240415110308.1"><vh>Beautifier::get_args</vh></v>
<v t="ekr.20240416194752.1"><vh>Beautifier::make_input_list</vh></v>
<v t="ekr.20240416195405.1"><vh>Beautifier::make_output_list</vh></v>
<v t="ekr.20240415113508.1"><vh>Beautifier::new</vh></v>
<v t="ekr.20240415110844.1"><vh>Beautifier::show_args</vh></v>
<v t="ekr.20240415095415.1"><vh>Beautifier::show_help</vh></v>
<v t="ekr.20240415060106.1"><vh>Beautifier::show_output_list</vh></v>
<v t="ekr.20240415115653.1"><vh>Beautifier::tokenize_contents (prototype)</vh></v>
</v>
<v t="ekr.20240416192429.1"><vh>class InputTok</vh></v>
</v>
<v t="ekr.20240412090635.1"><vh>pub fn entry &amp; helpers</vh>
<v t="ekr.20240412091801.1"><vh>fn tokenize</vh>
<v t="ekr.20240414172640.1"><vh>&lt;&lt; tokenize: define contents &gt;&gt;</vh></v>
</v>
</v>
<v t="ekr.20240416010451.1"><vh>fn print_type &amp; type_of</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20240411163111.1"></t>
<t tx="ekr.20240411163510.1">@language rest
@wrap

The Rust version of Leo's beautifier *must* generate pseudo 'ws' tokens, just as in leoTokens.py because 'ws' tokens are needed to support the @nobeautify directive.

Stats:

 file name: c:/Repos/leo-editor/leo/core/leoTokens.py
      read: 484.20µs
  tokenize: 11.9ms to 12.4ms
    tokens: 9739</t>
<t tx="ekr.20240411165212.1">mod leotokens;

fn main() {
    leotokens::entry();
}

@language rust
@tabwidth -4
</t>
<t tx="ekr.20240411165644.1">@language python

g.cls()
print('@command test')
import os
if c.isChanged():
    c.save()
root = r'C:\Repos\ekr-private\rust_beautifier'
os.chdir(root)
for command in (
    'cargo run -- --all --report --write c:/Repos/leo-editor/leo/core/leoTokens.py',
):
    print(command)
    os.system(command)
</t>
<t tx="ekr.20240411170811.1">@language toml

[package]
name = "rust_beautifier"
version = "0.1.0"
edition = "2021"

# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html

[dependencies]
# fstrings = "0.2.3"
# regex = "1.10.4"
textwrap = "0.16.1"
rustpython-parser = {version = "0.3.1", features = ["full-lexer"]}
</t>
<t tx="ekr.20240411171347.1"></t>
<t tx="ekr.20240411171351.1">test
</t>
<t tx="ekr.20240412022135.1">//! leoTokens.rs: A beautifier for Python that uses *only* tokens.

&lt;&lt; leoTokens.rs: global suppressions &gt;&gt;
&lt;&lt; leoTokens.rs: use statements &gt;&gt;

@others

@language rust
@tabwidth -4
@pagewidth 70
</t>
<t tx="ekr.20240412072749.1"></t>
<t tx="ekr.20240412090635.1">pub fn entry() {

    if false {
        tokenize();
        return;
    }
    // Main line of beautifier.
    let mut x = Beautifier::new();
    if x.enabled("--help") || x.enabled("-h") {
        x.show_help();
        return;
    }
    x.show_args();
    x.beautify_all_files();
}
</t>
<t tx="ekr.20240412091801.1">fn tokenize() {
    &lt;&lt; tokenize: define contents &gt;&gt;
    println!("fn tokenize");
    println!("\nSource:\n{contents}");

    for debug in [true, false].iter() {

        println!("{}", if *debug {"Tokens..."} else {"\nBeautified:"});

        let results = lex(contents, Mode::Module);  // An iterator yielding Option(Tok).
        let mut count = 0;
        let mut lws = String::new();
        for (i, result) in results.enumerate() {
            use Tok::*;
            let token = result.ok().unwrap();
            let (ref tok_class, tok_range) = token;
            let tok_value = &amp;contents[tok_range];

            if *debug {
                let s = format!("{tok_class}");
                print!("\nToken: {s:20} {:?}", tok_value);
            }
            else {
                // Comment(value), Name(name)
                #[allow(unused_variables)]
                match tok_class {
                    Comment(value) =&gt; {
                        // print!("{value} ");  // Wrong!
                        print!("{tok_value}");
                    },
                    Dedent =&gt; {
                        lws.pop();
                        lws.pop();
                        print!("{lws}");
                    },
                    Def =&gt; {
                        print!("{tok_value} ");
                    },
                    Indent =&gt; {
                        lws.push_str("    ");
                        print!("{lws}");
                    },
                    Name {name} =&gt; {
                        print!("{tok_value} ");
                    },
                    Newline =&gt; {
                        print!("{tok_value}");
                        print!("{lws}");
                        if false {  // old
                            println!("");
                            print!("{lws}");
                        }
                    },
                    NonLogicalNewline =&gt; {
                        println!("");
                        print!("{lws}");
                    },
                    Return =&gt; {
                        print!("{tok_value} ");
                    },
                    Tok::String {value, kind, triple_quoted} =&gt; {
                        // correct.
                        print!("{tok_value}");
                        if false {  // incorrect.
                            let quote = if *triple_quoted {"'''"} else {"'"};
                            print!("{:?}:{quote}{value}{quote}", kind);
                        }
                    },
                    _ =&gt; {
                        print!("{tok_value}");
                        if false {
                            // to_string quotes values!
                            let s = tok_class.to_string().replace("'", "");
                            print!("{s}");
                        }
                    },
                }
            }
            count = i
        }
        if *debug {
            println!("\n{count} tokens")
        }
    }
}
</t>
<t tx="ekr.20240414163749.1">#[derive(Debug)]
pub struct Beautifier {
    args: Vec&lt;String&gt;,
    files_list: Vec&lt;String&gt;,
    input_list: Vec&lt;InputTok&gt;,
    output_list: Vec&lt;String&gt;,
}

///// Temporary.
#[allow(dead_code)]
#[allow(non_snake_case)]
impl Beautifier {
    @others
}
</t>
<t tx="ekr.20240414170132.1">pub fn beautify_all_files(&amp;mut self) {
    for file_name in self.files_list.clone() {
        self.beautify_one_file(file_name);
    }
}

</t>
<t tx="ekr.20240414172341.1">// All suppressions are local to a class or statement.

// #![allow(non_snake_case)]
// #![allow(unused_imports)]
// #![allow(unreachable_code)]
// #![allow(unused_mut)]
// #![allow(unused_variables)]
</t>
<t tx="ekr.20240414172640.1">let contents = r#"
def test():
# Comment 1.
print('abc')
# Comment 2.
"#;

// print("xyz")
// print(rf'pdb')
// print(fr'pdb2')
// return bool(i &amp; 1)
</t>
<t tx="ekr.20240414210823.1"></t>
<t tx="ekr.20240414212026.1">use rustpython_parser::{lexer::lex, Mode, Tok};

use std::env;
use std::fs;
use std::fmt;
// use std::time;

use textwrap;
</t>
<t tx="ekr.20240415060106.1">fn show_output_list (&amp;self) {
    println!("\nOutput list...");
    for (i, arg) in self.output_list.iter().enumerate() {
        if i &gt; 0 {
            print!("{:?}", arg);
        }
    }
}
</t>
<t tx="ekr.20240415094152.1">fn enabled(&amp;self, arg: &amp;str) -&gt; bool {
    //! Beautifier::enabled: return true if the given command-line argument is enabled.
    //! Example:  x.enabled("--report");
    return self.args.contains(&amp;arg.to_string());

}
</t>
<t tx="ekr.20240415095415.1">fn show_help (&amp;self) {
    //! Beautifier::show_help: print the help messages.
    println!("{}", textwrap::dedent("
        Beautify or diff files.

        -h --help:      Print this help message and exit.
        --all:          Beautify all files, even unchanged files.
        --beautified:   Report beautified files individually, even if not written.
        --diff:         Show diffs instead of changing files.
        --report:       Print summary report.
        --write:        Write beautifed files (dry-run mode otherwise).
    "));
}
</t>
<t tx="ekr.20240415110308.1">fn get_args(&amp;mut self) {
    //! Beautifier::get_args: Set the args and files_list ivars.
    let args: Vec&lt;String&gt; = env::args().collect();
    let valid_args = vec![
        "--all", 
        "--beautified",
        "--diff",
        "-h", "--help",
        "--report",
        "--write",
    ];
    for (i, arg) in args.iter().enumerate() {
        if i &gt; 0 {
            if valid_args.contains(&amp;arg.as_str()) {
                self.args.push(arg.to_string())
            }
            else if 
                arg.as_str().starts_with("--") ||
                arg.as_str().starts_with("--")
            {
                println!("Ignoring invalid arg: {arg}");
            }
            else {
                println!("File: {arg}");
                self.files_list.push(arg.to_string());
            }
        }
    }
}
</t>
<t tx="ekr.20240415110844.1">fn show_args (&amp;self) {
    println!("Command-line arguments...");
    for (i, arg) in self.args.iter().enumerate() {
        if i &gt; 0 {
            println!("  {arg}");
        }
    }
    for file_arg in self.files_list.iter() {
        println!("  {file_arg}");
    }
}
</t>
<t tx="ekr.20240415113508.1">pub fn new() -&gt; Beautifier {
    let mut x = Beautifier {
        args: Vec::new(),
        files_list: Vec::new(),
        input_list: Vec::new(),
        output_list: Vec::new(),
    };
    x.get_args();
    return x;
}
</t>
<t tx="ekr.20240415114328.1">fn beautify_one_file(&amp;mut self, file_name: String) {
    // println!("beautifiy_one_file: {file_name}");
    self.output_list = Vec::new();
    // Read the file into contents (a String).
    let t1 = std::time::Instant::now();
    let contents = fs::read_to_string(file_name.clone())
        .expect("Error reading{file_name}");
    // print_type(&amp;contents, "contents");
    let t2 = t1.elapsed();
    // Tokenize.
    let t3 = std::time::Instant::now();
    let n_tokens = self.tokenize_contents(contents);
    let t4 = t3.elapsed();
    // Report
    if self.enabled("--report") {
        println!(" file name: {file_name}");
        println!("      read: {:.2?}", t2);
        println!("  tokenize: {:.2?}", t4);
        println!("    tokens: {n_tokens}");
    }
    // Show tokens.
    &lt;&lt; show output_list &gt;&gt;
}
</t>
<t tx="ekr.20240415115653.1">fn tokenize_contents(&amp;mut self, contents: String ) -&gt; u32 {

    let count = self.make_input_list(&amp;contents);
    
    // Simulate iterating the input list twice.
    for _z in &amp;self.input_list.clone() {
    }
    for _z in &amp;self.input_list.clone() {
    }

    // Simulate writing strings to the output list.
    // self.make_output_list();
    for _z in &amp;self.input_list.clone() {
    }
    return count;
}
</t>
<t tx="ekr.20240415163731.1">#[allow(unused_variables)]
fn add_output_string (&amp;mut self, kind: &amp;str, value: &amp;str) {
    //! Add one string to the output list.
    self.output_list.push(value.to_string())
}
</t>
<t tx="ekr.20240416010451.1">#[allow(dead_code)]
fn print_type&lt;T&gt;(_: &amp;T, tag: &amp;str) {
    println!("{tag} type: {}", std::any::type_name::&lt;T&gt;())
}
</t>
<t tx="ekr.20240416153903.1">fn do_Comment(&amp;mut self, tok_value: &amp;str) {
    // print!("{tok_value}");  // Correct.
    // print!("{value} ");  // Wrong!
    self.add_output_string("Comment", tok_value);
}
</t>
<t tx="ekr.20240416153935.1">fn do_String(&amp;mut self, tok_value: &amp;str) {
    // correct.
    // print!("{tok_value}");
    
    // incorrect.
        // let quote = if *triple_quoted {"'''"} else {"'"};
        // print!("{:?}:{quote}{value}{quote}", kind);

    self.add_output_string("String", tok_value);
}
</t>
<t tx="ekr.20240416154346.1">fn do_Complex(&amp;mut self, tok_value: &amp;str) {
    self.add_output_string("Complex", tok_value);
}
</t>
<t tx="ekr.20240416154347.1">fn do_Amper(&amp;mut self) {
    self.add_output_string("Amper", "&amp;");
}
</t>
<t tx="ekr.20240416154842.1"></t>
<t tx="ekr.20240416154933.1">fn do_Float(&amp;mut self, tok_value: &amp;str) {
    self.add_output_string("Float", tok_value);
}
</t>
<t tx="ekr.20240416154933.2">fn do_Int(&amp;mut self, tok_value: &amp;str) {
    self.add_output_string("Int", tok_value);
}
</t>
<t tx="ekr.20240416154934.1">fn do_Name(&amp;mut self, tok_value: &amp;str) {
    self.add_output_string("Name", tok_value);
}
</t>
<t tx="ekr.20240416155250.1">fn do_Dedent(&amp;mut self, tok_value: &amp;str) {
    self.add_output_string("Dedent", tok_value);
}
</t>
<t tx="ekr.20240416155517.1"></t>
<t tx="ekr.20240416155917.1"></t>
<t tx="ekr.20240416155952.1">fn do_Indent(&amp;mut self, tok_value: &amp;str) {
    self.add_output_string("Indent", tok_value);
}
</t>
<t tx="ekr.20240416160309.1">fn do_Newline(&amp;mut self) {
    self.add_output_string("Indent", "\n");
}
</t>
<t tx="ekr.20240416160310.1">fn do_NonLogicalNewline(&amp;mut self) {
    self.add_output_string("Indent", "\n");
}
</t>
<t tx="ekr.20240416161356.1">fn do_AmperEqual(&amp;mut self) {
    self.add_output_string("AmperEqual", "&amp;=");
}
</t>
<t tx="ekr.20240416161357.1">fn do_And(&amp;mut self) {
    self.add_output_string("And", "and");
}
</t>
<t tx="ekr.20240416161357.2">fn do_As(&amp;mut self) {
    self.add_output_string("As", "as");
}
</t>
<t tx="ekr.20240416161357.3">fn do_Assert(&amp;mut self) {
    self.add_output_string("Assert", "assert");
}
</t>
<t tx="ekr.20240416161357.4">fn do_Async(&amp;mut self) {
    self.add_output_string("Async", "async");
}
</t>
<t tx="ekr.20240416161357.5">fn do_At(&amp;mut self) {
    self.add_output_string("At", "@");
}
</t>
<t tx="ekr.20240416161358.1">fn do_AtEqual(&amp;mut self) {
    self.add_output_string("AtEqual", "@=");
}
</t>
<t tx="ekr.20240416161658.1">fn do_Await(&amp;mut self) {
    self.add_output_string("Await", "await");
}
</t>
<t tx="ekr.20240416161823.1">fn do_Break(&amp;mut self) {
    self.add_output_string("Break", "break");
}
</t>
<t tx="ekr.20240416161824.1">fn do_Case(&amp;mut self) {
    self.add_output_string("Case", "case");
}
</t>
<t tx="ekr.20240416161824.2">fn do_CircumFlex(&amp;mut self) {
    self.add_output_string("CircumFlex", "^");
}
</t>
<t tx="ekr.20240416161955.1">fn do_Class(&amp;mut self) {
    self.add_output_string("Class", "class");
}
</t>
<t tx="ekr.20240416161955.2">fn do_Colon(&amp;mut self) {
    self.add_output_string("Colon", ":");
}
</t>
<t tx="ekr.20240416161956.1">fn do_ColonEqual(&amp;mut self) {
    self.add_output_string("ColonEqual", ":=");
}
</t>
<t tx="ekr.20240416161956.2">fn do_Comma(&amp;mut self) {
    self.add_output_string("Comma", ",");
}
</t>
<t tx="ekr.20240416161956.3">fn do_Continue(&amp;mut self) {
    self.add_output_string("Continue", "continue");
}
</t>
<t tx="ekr.20240416162128.1">fn do_CircumflexEqual(&amp;mut self) {
    self.add_output_string("CircumflexEqual", "^=");
}
</t>
<t tx="ekr.20240416162226.1">fn do_Def(&amp;mut self) {
    self.add_output_string("Def", "def");
}
</t>
<t tx="ekr.20240416162226.2">fn do_Del(&amp;mut self) {
    self.add_output_string("Del", "del");
}
</t>
<t tx="ekr.20240416162226.3">fn do_Dot(&amp;mut self) {
    self.add_output_string("Dot", ".");
}
</t>
<t tx="ekr.20240416162226.4">fn do_DoubleSlash(&amp;mut self) {
    self.add_output_string("DoubleSlash", "//");
}
</t>
<t tx="ekr.20240416162226.5">fn do_DoubleSlashEqual(&amp;mut self) {
    self.add_output_string("DoubleSlashEqual", "//=");
}
</t>
<t tx="ekr.20240416162348.1">fn do_DoubleStar(&amp;mut self) {
    self.add_output_string("DoubleStar", "**");
}
</t>
<t tx="ekr.20240416162349.1">fn do_DoubleStarEqual(&amp;mut self) {
    self.add_output_string("DoubleStarEqual", "**=");
}
</t>
<t tx="ekr.20240416162349.2">fn do_Elif(&amp;mut self) {
    self.add_output_string("Elif", "elif");
}
</t>
<t tx="ekr.20240416162349.3">fn do_Ellipsis(&amp;mut self) {
    self.add_output_string("Ellipsis", "...");
}
</t>
<t tx="ekr.20240416162349.4">fn do_Else(&amp;mut self) {
    self.add_output_string("Else", "else");
}
</t>
<t tx="ekr.20240416162540.1">fn do_EndOfFile(&amp;mut self) {
    self.add_output_string("EndOfFile", "EOF");
}
</t>
<t tx="ekr.20240416162540.2">fn do_EqEqual(&amp;mut self) {
    self.add_output_string("EqEqual", "==");
}
</t>
<t tx="ekr.20240416162540.3">fn do_Equal(&amp;mut self) {
    self.add_output_string("Equal", "=");
}
</t>
<t tx="ekr.20240416162540.4">fn do_Except(&amp;mut self) {
    self.add_output_string("Except", "except");
}
</t>
<t tx="ekr.20240416162541.1">fn do_False(&amp;mut self) {
    self.add_output_string("False", "False");
}
</t>
<t tx="ekr.20240416162722.1">fn do_Finally(&amp;mut self) {
    self.add_output_string("Finally", "finally");
}
</t>
<t tx="ekr.20240416162723.1">fn do_For(&amp;mut self) {
    self.add_output_string("For", "for");
}
</t>
<t tx="ekr.20240416162723.2">fn do_From(&amp;mut self) {
    self.add_output_string("From", "from");
}
</t>
<t tx="ekr.20240416162723.3">fn do_Global(&amp;mut self) {
    self.add_output_string("Global", "global");
}
</t>
<t tx="ekr.20240416162723.4">fn do_Greater(&amp;mut self) {
    self.add_output_string("Greater", "&gt;");
}
</t>
<t tx="ekr.20240416162724.1">fn do_GreaterEqual(&amp;mut self) {
    self.add_output_string("GreaterEqual", "&gt;-");
}
</t>
<t tx="ekr.20240416162829.1">fn do_If(&amp;mut self) {
    self.add_output_string("If", "if");
}
</t>
<t tx="ekr.20240416162829.2">fn do_Import(&amp;mut self) {
    self.add_output_string("Import", "import");
}
</t>
<t tx="ekr.20240416162829.3">fn do_In(&amp;mut self) {
    self.add_output_string("In", "in");
}
</t>
<t tx="ekr.20240416162830.1">fn do_Is(&amp;mut self) {
    self.add_output_string("Is", "is");
}
</t>
<t tx="ekr.20240416162830.2">fn do_Lambda(&amp;mut self) {
    self.add_output_string("Lambda", "lambda");
}
</t>
<t tx="ekr.20240416162927.1">fn do_Lbrace(&amp;mut self) {
    self.add_output_string("Lbrace", "[");
}
</t>
<t tx="ekr.20240416162927.2">fn do_LeftShift(&amp;mut self) {
    self.add_output_string("LeftShift", "&lt;&lt;");
}
</t>
<t tx="ekr.20240416162928.1">fn do_LeftShiftEqual(&amp;mut self) {
    self.add_output_string("LeftShiftEqual", "&lt;&lt;=");
}
</t>
<t tx="ekr.20240416162928.2">fn do_Less(&amp;mut self) {
    self.add_output_string("Less", "&lt;");
}
</t>
<t tx="ekr.20240416162929.1">fn do_LessEqual(&amp;mut self) {
    self.add_output_string("LessEqual", "&lt;=");
}
</t>
<t tx="ekr.20240416163047.1">fn do_Lpar(&amp;mut self) {
    self.add_output_string("Lpar", "(");
}
</t>
<t tx="ekr.20240416163047.2">fn do_Lsqb(&amp;mut self) {
    self.add_output_string("Lsqb", "[");
}
</t>
<t tx="ekr.20240416163047.3">fn do_Match(&amp;mut self) {
    self.add_output_string("Match", "match");
}
</t>
<t tx="ekr.20240416163048.1">fn do_Minus(&amp;mut self) {
    self.add_output_string("Minus", "-");
}
</t>
<t tx="ekr.20240416163048.2">fn do_MinusEqual(&amp;mut self) {
    self.add_output_string("MinusEqual", "-=");
}
</t>
<t tx="ekr.20240416163333.1">fn do_None(&amp;mut self) {
    self.add_output_string("None", "None");
}
</t>
<t tx="ekr.20240416163334.1">fn do_Nonlocal(&amp;mut self) {
    self.add_output_string("Nonlocal", "nonlocal");
}
</t>
<t tx="ekr.20240416163334.2">fn do_Not(&amp;mut self) {
    self.add_output_string("Not", "not");
}
</t>
<t tx="ekr.20240416163334.3">fn do_NotEqual(&amp;mut self) {
    self.add_output_string("NotEqual", "!=");
}
</t>
<t tx="ekr.20240416163429.1">fn do_Or(&amp;mut self) {
    self.add_output_string("Or", "or");
}
</t>
<t tx="ekr.20240416163429.2">fn do_Pass(&amp;mut self) {
    self.add_output_string("Pass", "pass");
}
</t>
<t tx="ekr.20240416163429.3">fn do_Percent(&amp;mut self) {
    self.add_output_string("Percent", "%");
}
</t>
<t tx="ekr.20240416163430.1">fn do_PercentEqual(&amp;mut self) {
    self.add_output_string("PercentEqual", "%=");
}
</t>
<t tx="ekr.20240416163546.1">fn do_PlusEqual(&amp;mut self) {
    self.add_output_string("PlusEqual", "+=");
}
</t>
<t tx="ekr.20240416163547.1">fn do_Plus(&amp;mut self) {
    self.add_output_string("Plus", "+");
}
</t>
<t tx="ekr.20240416163547.2">fn do_Raise(&amp;mut self) {
    self.add_output_string("Raise", "raise");
}
</t>
<t tx="ekr.20240416163547.3">fn do_Rarrow(&amp;mut self) {
    self.add_output_string("Rarrow", "-&gt;");
}
</t>
<t tx="ekr.20240416163548.1">fn do_Rbrace(&amp;mut self) {
    self.add_output_string("Rbrace", "]");
}
</t>
<t tx="ekr.20240416163709.1">fn do_Return(&amp;mut self) {
    self.add_output_string("Return", "return");
}
</t>
<t tx="ekr.20240416163710.1">fn do_RightShift(&amp;mut self) {
    self.add_output_string("RightShift", "&gt;&gt;");
}
</t>
<t tx="ekr.20240416163710.2">fn do_RightShiftEqual(&amp;mut self) {
    self.add_output_string("RightShiftEqual", "&gt;&gt;=");
}
</t>
<t tx="ekr.20240416163710.3">fn do_Rpar(&amp;mut self) {
    self.add_output_string("Rpar", ")");
}
</t>
<t tx="ekr.20240416163802.1">fn do_Rsqb(&amp;mut self) {
    self.add_output_string("Rsqb", "]");
}
</t>
<t tx="ekr.20240416163803.1">fn do_Semi(&amp;mut self) {
    self.add_output_string("Semi", ";");
}
</t>
<t tx="ekr.20240416163803.2">fn do_Slash(&amp;mut self) {
    self.add_output_string("Slash", "/");
}
</t>
<t tx="ekr.20240416163803.3">fn do_SlashEqual(&amp;mut self) {
    self.add_output_string("SlashEqual", "/=");
}
</t>
<t tx="ekr.20240416163804.1">fn do_Star(&amp;mut self) {
    self.add_output_string("Star", "*");
}
</t>
<t tx="ekr.20240416163907.1">fn do_StarEqual(&amp;mut self) {
    self.add_output_string("StarEqual", "*=");
}
</t>
<t tx="ekr.20240416163908.1">fn do_StartExpression(&amp;mut self) {
    // self.add_output_string("StartExpression", "");
}
</t>
<t tx="ekr.20240416163908.2">fn do_Tilde(&amp;mut self) {
    self.add_output_string("Tilde", "~");
}
</t>
<t tx="ekr.20240416163908.3">fn do_True(&amp;mut self) {
    self.add_output_string("True", "True");
}
</t>
<t tx="ekr.20240416163909.1">fn do_Try(&amp;mut self) {
    self.add_output_string("Try", "try");
}
</t>
<t tx="ekr.20240416164042.1">fn do_Type(&amp;mut self) {
    self.add_output_string("Type", "type");
}
</t>
<t tx="ekr.20240416164043.1">fn do_Vbar(&amp;mut self) {
    self.add_output_string("Vbar", "|");
}
</t>
<t tx="ekr.20240416164043.2">fn do_VbarEqual(&amp;mut self) {
    self.add_output_string("VbarEqual", "|=");
}
</t>
<t tx="ekr.20240416164043.3">fn do_While(&amp;mut self) {
    self.add_output_string("While", "while");
}
</t>
<t tx="ekr.20240416164043.4">fn do_With(&amp;mut self) {
    self.add_output_string("With", "with");
}
</t>
<t tx="ekr.20240416164136.1">fn do_Yield(&amp;mut self) {
    self.add_output_string("Yield", "yield");
}
</t>
<t tx="ekr.20240416165105.1">fn do_StartInteractive(&amp;mut self) {
    // self.add_output_string("StartModule", "");
}
</t>
<t tx="ekr.20240416165106.1">fn do_StartModule(&amp;mut self) {
    // self.add_output_string("StartModule", "");
    println!("do_StartModule");
}
</t>
<t tx="ekr.20240416170422.1">if false {  // --show-output
    self.show_output_list()
}
</t>
<t tx="ekr.20240416172357.1"></t>
<t tx="ekr.20240416192429.1">// Only Clone is valid for String.
#[derive(Clone)]
struct InputTok {
    kind: String,
    value: String,
}

impl fmt::Debug for InputTok {
    fn fmt(&amp;self, f: &amp;mut fmt::Formatter&lt;'_&gt;) -&gt; fmt::Result {
        let kind_s = format!("{:?}", self.kind);
        let mut value = self.value.to_string();
        if true {
            return write!(f, "{value} ");
        }
        else {  // Debug format.
            value.truncate(60);
            // repr format is not useful.
            // let value_s = format!("{:?}", value);
            let value_s = format!("{}", value);
            return write!(f, "InputTok: {kind_s:&gt;10}: {value_s}");
        }
    }
}
</t>
<t tx="ekr.20240416192621.1">// #[allow(dead_code)]
fn add_input_token (&amp;mut self, kind: &amp;str, value: &amp;str) {
    //! Add one token to the output list.
    // println!("{:?}", kind);
    self.input_list.push(InputTok {
        kind: kind.to_string(),
        value: value.to_string(),
    });
}
</t>
<t tx="ekr.20240416194752.1">fn make_input_list(&amp;mut self, contents: &amp;str) -&gt; u32 {

    let mut count: u32 = 0;
    let results = lex(&amp;contents, Mode::Module);  // An iterator yielding Option(Tok).
    for result in results {
        use Tok::*;
        count += 1;
        let token = result.ok().unwrap();
        let (ref tok_class, tok_range) = token;
        let tok_value = &amp;contents[tok_range];

        // Variants names are necessary, but otherwise not used.
        #[allow(unused_variables)]
        let class_name = match tok_class {
            // Tokens with values...
            // Use tok_value for *all* values.
            Comment(value) =&gt; "Comment",  // No idea why parens are needed here.
            Complex { real, imag } =&gt; "Complex",
            Float { value } =&gt; "Float",
            Int { value } =&gt; "Int",
            Name { name } =&gt; "Name",
            Tok::String { value, kind, triple_quoted } =&gt; "String",
            
            // Common tokens...
            Class =&gt; "Class",
            Dedent =&gt; "Dedent",
            Def =&gt; "Def",
            Indent =&gt; "Indent",
            Newline =&gt; "Newline",
            NonLogicalNewline =&gt; "NonLogicalNewline",

            // All other tokens...
            Amper =&gt; "Amper",
            AmperEqual =&gt; "AmperEqual",
            And =&gt; "And",
            As =&gt; "As",
            Assert =&gt; "Assert",
            Async =&gt; "Async",
            At =&gt; "At",
            AtEqual =&gt; "AtEqual",
            Await =&gt; "Await",
            Break =&gt; "Break",
            Case =&gt; "Case",
            CircumFlex =&gt; "CircumFlex",
            CircumflexEqual =&gt; "CircumflexEqual",
            Colon =&gt; "Colon",
            ColonEqual =&gt; "ColonEqual",
            Comma =&gt; "Comma",
            Continue =&gt; "Continue",
            Del =&gt; "Del",
            Dot =&gt; "Dot",
            DoubleSlash =&gt; "DoubleSlash",
            DoubleSlashEqual =&gt; "DoubleSlashEqual",
            DoubleStar =&gt; "DoubleStar",
            DoubleStarEqual =&gt; "DoubleStarEqual",
            Elif =&gt; "Elif",
            Ellipsis =&gt; "Ellipsis",
            Else =&gt; "Else",
            EndOfFile =&gt; "EndOfFile",
            EqEqual =&gt; "EqEqual",
            Equal =&gt; "Equal",
            Except =&gt; "Except",
            False =&gt; "False",
            Finally =&gt; "Finally",
            For =&gt; "For",
            From =&gt; "From",
            Global =&gt; "Global",
            Greater =&gt; "Greater",
            GreaterEqual =&gt; "GreaterEqual",
            If =&gt; "If",
            Import =&gt; "Import",
            In =&gt; "In",
            Is =&gt; "Is",
            Lambda =&gt; "Lambda",
            Lbrace =&gt; "Lbrace",
            LeftShift =&gt; "LeftShift",
            LeftShiftEqual =&gt; "LeftShiftEqual",
            Less =&gt; "Less",
            LessEqual =&gt; "LessEqual",
            Lpar =&gt; "Lpar",
            Lsqb =&gt; "Lsqb",
            Match =&gt; "Match",
            Minus =&gt; "Minus",
            MinusEqual =&gt; "MinusEqual",
            None =&gt; "None",
            Nonlocal =&gt; "Nonlocal",
            Not =&gt; "Not",
            NotEqual =&gt; "NotEqual",
            Or =&gt; "Or",
            Pass =&gt; "Pass",
            Percent =&gt; "Percent",
            PercentEqual =&gt; "PercentEqual",
            Plus =&gt; "Plus",
            PlusEqual =&gt; "PlusEqual",
            Raise =&gt; "Raise",
            Rarrow =&gt; "Rarrow",
            Rbrace =&gt; "Rbrace",
            Return =&gt; "Return",
            RightShift =&gt; "RightShift",
            RightShiftEqual =&gt; "RightShiftEqual",
            Rpar =&gt; "Rpar",
            Rsqb =&gt; "Rsqb",
            Semi =&gt; "Semi",
            Slash =&gt; "Slash",
            SlashEqual =&gt; "SlashEqual",
            Star =&gt; "Star",
            StarEqual =&gt; "StarEqual",
            StartExpression =&gt; "StartExpression",
            StartInteractive =&gt; "StartInteractive",
            StartModule =&gt; "StartModule",
            Tilde =&gt; "Tilde",
            True =&gt; "True",
            Try =&gt; "Try",
            Type =&gt; "Type",
            Vbar =&gt; "Vbar",
            VbarEqual =&gt; "VbarEqual",
            While =&gt; "While",
            With =&gt; "With",
            Yield =&gt; "Yield",
        };
        self.add_input_token(class_name, tok_value);
    }
    return count;
}
</t>
<t tx="ekr.20240416195405.1">fn make_output_list(&amp;mut self) {

    //// Prototype only.
    for input_token in &amp;self.input_list.clone() {
        // println!("{:?}", input_token);
        self.add_output_string(input_token.kind.as_str(), input_token.value.as_str());
    }
}
</t>
</tnodes>
</leo_file>
