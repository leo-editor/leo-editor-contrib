<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet ekr_test?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20050502102905" a="M"><vh>Read me</vh></v>
<v t="ekr.20050502102905.1"><vh>@file c++lib.w</vh>
<v t="ekr.20050502102905.2"><vh>Limbo</vh></v>
</v>
<v t="ekr.20050502102905.3" a="E"><vh>@file common.w</vh>
<v t="ekr.20050502102905.4"><vh>Limbo</vh></v>
<v t="ekr.20050502102905.5"><vh>** Introduction</vh>
<v t="ekr.20050502102905.6"><vh>@&lt;Definitions that should agree with \.{CTANGLE} and \.{CWEAVE}@&gt;</vh>
<v t="ekr.20050502102905.7"><vh>common_init</vh>
<v t="ekr.20050502102905.8"><vh>@&lt;Set the default options common to \.{CTANGLE} and \.{CWEAVE}@&gt;</vh></v>
<v t="ekr.20050502102905.9"><vh>@&lt;Scan arguments and open output files@&gt;</vh></v>
</v>
</v>
<v t="ekr.20050502102905.10"><vh>Character pairs</vh></v>
</v>
<v t="ekr.20050502102905.11" a="E"><vh>** Input Routines</vh>
<v t="ekr.20050502102905.12"><vh>input_ln</vh></v>
<v t="ekr.20050502102905.13"><vh>line, max_include_depth</vh></v>
<v t="ekr.20050502102905.14"><vh>defines</vh></v>
<v t="ekr.20050502102905.15" a="E"><vh>prime_the_change_buffer</vh>
<v t="ekr.20050502102905.16"><vh>@&lt;Skip over comment lines in the change file; |return| if end of file@&gt;</vh></v>
<v t="ekr.20050502102905.17"><vh>@&lt;Skip to the next nonblank line; |return| if end of file@&gt;</vh></v>
<v t="ekr.20050502102905.18"><vh>@&lt;Move |buffer| and |limit| to |change_buffer| and |change_limit|@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.19"><vh>check_change</vh>
<v t="ekr.20050502102905.20"><vh>@&lt;If the current line starts with \.{@@y}...@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.21"><vh>reset_input</vh>
<v t="ekr.20050502102905.22"><vh>@&lt;Open input files@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.23"><vh>get_line</vh>
<v t="ekr.20050502102905.24"><vh>defines</vh></v>
<v t="ekr.20050502102905.25"><vh>@&lt;Read from |cur_file| and maybe turn on |changing|@&gt;</vh></v>
<v t="ekr.20050502102905.26"><vh>@&lt;Read from |change_file| and maybe turn off |changing|@&gt;</vh></v>
<v t="ekr.20050502102905.27"><vh>@&lt;Try to open include file, abort push if unsuccessful, go to |restart|@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.28"><vh>check_complete</vh></v>
</v>
<v t="ekr.20050502102905.29"><vh>** Storage of names and strings</vh>
<v t="ekr.20050502102905.30"><vh>Names and strings</vh></v>
<v t="ekr.20050502102905.31"><vh>The hash table</vh></v>
<v t="ekr.20050502102905.32"><vh>id_lookup</vh>
<v t="ekr.20050502102905.33"><vh>@&lt;Compute the hash code |h|@&gt;</vh></v>
<v t="ekr.20050502102905.34"><vh>@&lt;Compute the name location |p|@&gt;</vh></v>
<v t="ekr.20050502102905.35"><vh>@&lt;Predeclaration of procedures@&gt;</vh></v>
<v t="ekr.20050502102905.36"><vh>@&lt;Enter a new name into the table at position |p|@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.37"><vh>byte_mem and links</vh></v>
<v t="ekr.20050502102905.38"><vh>print_section_name</vh></v>
<v t="ekr.20050502102905.39"><vh>sprint_section_name</vh></v>
<v t="ekr.20050502102905.40"><vh>print_prefix_name</vh></v>
<v t="ekr.20050502102905.41"><vh>web_strcmp</vh></v>
<v t="ekr.20050502102905.42"><vh>add_section_name</vh></v>
<v t="ekr.20050502102905.43"><vh>extend_section_name</vh></v>
<v t="ekr.20050502102905.44"><vh>section_lookup</vh>
<v t="ekr.20050502102905.45"><vh>@&lt;Look for matches for new name among...@&gt;</vh></v>
<v t="ekr.20050502102905.46"><vh>@&lt;If no match found, add new name to tree@&gt;</vh></v>
<v t="ekr.20050502102905.47"><vh>@&lt;If one match found, check for compatibility and return match@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.48"><vh>section_name_cmp</vh></v>
<v t="ekr.20050502102905.49"><vh>@&lt;More elements of |name_info| structure@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.50"><vh>** Reporting errors to the user</vh>
<v t="ekr.20050502102905.51"><vh>err_print</vh>
<v t="ekr.20050502102905.52"><vh>@&lt;Print error location based on input buffer@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.53"><vh>wrap_up</vh>
<v t="ekr.20050502102905.54"><vh>@&lt;Print the job |history|@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.55"><vh>fatal</vh></v>
<v t="ekr.20050502102905.56"><vh>overflow</vh></v>
<v t="ekr.20050502102905.57"><vh>confusion</vh></v>
</v>
<v t="ekr.20050502102905.58"><vh>** Command line arguments</vh>
<v t="ekr.20050502102905.59"><vh>scan_args</vh>
<v t="ekr.20050502102905.60"><vh>@&lt;Handle flag argument@&gt;</vh></v>
<v t="ekr.20050502102905.61"><vh>@&lt;Make |change_file_name| from |fname|@&gt;</vh></v>
<v t="ekr.20050502102905.62"><vh>@&lt;Override |tex_file_name| and |C_file_name|@&gt;</vh></v>
<v t="ekr.20050502102905.63"><vh>@&lt;Make |web_file_name|...@&gt;</vh></v>
<v t="ekr.20050502102905.64"><vh>@&lt;Print usage error message and quit@&gt;</vh></v>
<v t="ekr.20050502102905.65"><vh>@&lt;Complain about argument length@&gt;</vh></v>
</v>
</v>
<v t="ekr.20050502102905.66"><vh>** Output</vh>
<v t="ekr.20050502102905.67"><vh>declarations</vh></v>
<v t="ekr.20050502102905.68"><vh>@&lt;Predeclaration of procedures@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.69"><vh>Index</vh></v>
</v>
<v t="ekr.20050502102905.70"><vh>@file ctangle.w</vh>
<v t="ekr.20050502102905.71"><vh>Limbo</vh></v>
<v t="ekr.20050502102905.72"><vh>** Introduction</vh>
<v t="ekr.20050502102905.73"><vh>@&lt;Predeclaration of procedures@&gt;</vh></v>
<v t="ekr.20050502102905.74"><vh>main</vh></v>
</v>
<v t="ekr.20050502102905.75"><vh>Data structures</vh>
<v t="ekr.20050502102905.76"><vh>defines</vh></v>
<v t="ekr.20050502102905.77"><vh>* Data structures exclusive to CTangle</vh>
<v t="ekr.20050502102905.78"><vh>@&lt;Glob...@&gt;</vh></v>
<v t="ekr.20050502102905.79"><vh>equiv</vh></v>
<v t="ekr.20050502102905.80"><vh>names_match</vh></v>
<v t="ekr.20050502102905.81"><vh>init_node</vh></v>
</v>
<v t="ekr.20050502102905.82"><vh>* Tokens</vh>
<v t="ekr.20050502102905.83"><vh>store_two_bytes</vh></v>
</v>
</v>
<v t="ekr.20050502102905.84"><vh>Output</vh>
<v t="ekr.20050502102905.85"><vh>** Stacks for output</vh>
<v t="ekr.20050502102905.86"><vh>defines</vh></v>
<v t="ekr.20050502102905.87"><vh>push_level</vh></v>
<v t="ekr.20050502102905.88"><vh>pop_level</vh></v>
<v t="ekr.20050502102905.89"><vh>get_output</vh>
<v t="ekr.20050502102905.90"><vh>@&lt;Expand section |a-024000|, |goto restart|@&gt;</vh></v>
</v>
</v>
<v t="ekr.20050502102905.91"><vh>* Producing the output</vh>
<v t="ekr.20050502102905.92"><vh>defines</vh></v>
<v t="ekr.20050502102905.93"><vh>flush_buffer</vh></v>
<v t="ekr.20050502102905.94"><vh>defines</vh></v>
</v>
<v t="ekr.20050502102905.95"><vh>* The big output switch</vh>
<v t="ekr.20050502102905.96"><vh>phase_two</vh>
<v t="ekr.20050502102905.97"><vh>@&lt;Output macro definitions if appropriate@&gt;</vh></v>
<v t="ekr.20050502102905.98"><vh>@&lt;Write all the named output files@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.99"><vh>output_defs</vh></v>
<v t="ekr.20050502102905.100"><vh>out_char</vh>
<v t="ekr.20050502102905.101"><vh>@&lt;Case of an identifier@&gt;</vh></v>
<v t="ekr.20050502102905.102"><vh>@&lt;Case of a sec...@&gt;</vh></v>
<v t="ekr.20050502102905.103"><vh>@&lt;Cases like \.{!=}@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.104"><vh>@&lt;Set init...@&gt;</vh></v>
</v>
</v>
<v t="ekr.20050502102905.105"><vh>Input</vh>
<v t="ekr.20050502102905.106"><vh>** Introduction to the input phase</vh>
<v t="ekr.20050502102905.107"><vh>control codes</vh></v>
<v t="ekr.20050502102905.108"><vh>skip_ahead</vh></v>
<v t="ekr.20050502102905.109"><vh>skip_comment</vh></v>
</v>
<v t="ekr.20050502102905.110"><vh>* Inputting the next token</vh>
<v t="ekr.20050502102905.111"><vh>get_next</vh>
<v t="ekr.20050502102905.112"><vh>@&lt;Compress two-symbol operator@&gt;</vh></v>
<v t="ekr.20050502102905.113"><vh>@&lt;Get an identifier@&gt;</vh></v>
<v t="ekr.20050502102905.114"><vh>@&lt;Get a constant@&gt;</vh></v>
<v t="ekr.20050502102905.115"><vh>@&lt;Get a string@&gt;</vh></v>
<v t="ekr.20050502102905.116"><vh>@&lt;Get control code and possible section name@&gt;</vh>
<v t="ekr.20050502102905.117"><vh>@&lt;Scan an ASCII constant@&gt;</vh></v>
<v t="ekr.20050502102905.118"><vh>@&lt;Scan the section name...@&gt;</vh>
<v t="ekr.20050502102905.119"><vh>@&lt;If it's not there, add |cur_section_name| to...@&gt;</vh></v>
<v t="ekr.20050502102905.120"><vh>@&lt;Put section name...@&gt;</vh>
<v t="ekr.20050502102905.121"><vh>@&lt;If end of name or erroneous nesting,...@&gt;</vh></v>
</v>
</v>
<v t="ekr.20050502102905.122"><vh>@&lt;Scan a verbatim string@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.123"><vh>@&lt;Set initial values@&gt;</vh></v>
</v>
</v>
<v t="ekr.20050502102905.124"><vh>* Scanning a macro definition</vh>
<v t="ekr.20050502102905.125"><vh>scan_repl</vh>
<v t="ekr.20050502102905.126"><vh>@&lt;Insert the line number into |tok_mem|@&gt;</vh></v>
<v t="ekr.20050502102905.127"><vh>@&lt;In cases that |a| is...@&gt;</vh>
<v t="ekr.20050502102905.128"><vh>@&lt;Was an `@@'...@&gt;</vh></v>
<v t="ekr.20050502102905.129"><vh>@&lt;Copy a string...@&gt;</vh></v>
<v t="ekr.20050502102905.130"><vh>@&lt;Copy an ASCII constant@&gt;</vh></v>
</v>
</v>
</v>
<v t="ekr.20050502102905.131"><vh>* Scanning a section</vh>
<v t="ekr.20050502102905.132"><vh>scan_section</vh>
<v t="ekr.20050502102905.133"><vh>@&lt;Skip ahead until |next_control| ...@&gt;</vh></v>
<v t="ekr.20050502102905.134"><vh>@&lt;Scan a definition@&gt;</vh></v>
<v t="ekr.20050502102905.135"><vh>@&lt;If section is not being defined, |continue|@&gt;</vh></v>
<v t="ekr.20050502102905.136"><vh>@&lt;Scan the \CEE/...@&gt;</vh>
<v t="ekr.20050502102905.137"><vh>@&lt;Insert the section number...@&gt;</vh></v>
<v t="ekr.20050502102905.138"><vh>@&lt;Update the data...@&gt;</vh></v>
</v>
</v>
<v t="ekr.20050502102905.139"><vh>phase_one</vh></v>
<v t="ekr.20050502102905.140"><vh>skip_limbo</vh>
<v t="ekr.20050502102905.141"><vh>@&lt;Read in transliteration of a character@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.142"><vh>print_stats</vh></v>
<v t="ekr.20050502102905.143"><vh>@</vh></v>
</v>
</v>
</v>
<v t="ekr.20050502102905.144"><vh>@file cweave.w</vh>
<v t="ekr.20050502102905.145"><vh>Limbo</vh></v>
<v t="ekr.20050502102905.146"><vh>** Introduction</vh>
<v t="ekr.20050502102905.147"><vh>@&lt;Predeclaration of procedures@&gt;</vh></v>
<v t="ekr.20050502102905.148"><vh>main</vh>
<v t="ekr.20050502102905.149"><vh>@&lt;Store all the reserved words@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.150"><vh>Data structures</vh>
<v t="ekr.20050502102905.151"><vh>defines</vh></v>
<v t="ekr.20050502102905.152"><vh>* Data structures exclusive to CWeave</vh>
<v t="ekr.20050502102905.153"><vh>defines</vh></v>
<v t="ekr.20050502102905.154"><vh>new_xref</vh></v>
<v t="ekr.20050502102905.155"><vh>new_section_xref</vh></v>
<v t="ekr.20050502102905.156"><vh>set_file_flag</vh></v>
<v t="ekr.20050502102905.157"><vh>tokens</vh></v>
<v t="ekr.20050502102905.158"><vh>names_match, init_p, init_node</vh></v>
</v>
</v>
</v>
<v t="ekr.20050502102905.159"><vh>* Lexical scanning</vh>
<v t="ekr.20050502102905.160"><vh>defines</vh></v>
<v t="ekr.20050502102905.161" a="M"><vh>skip_limbo</vh>
<v t="ekr.20050502102905.162"><vh>@&lt;Process simple format in limbo@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.163"><vh>skip_TeX</vh></v>
</v>
<v t="ekr.20050502102905.164"><vh>* Inputting the next token</vh>
<v t="ekr.20050502102905.165"><vh>Includes</vh></v>
<v t="ekr.20050502102905.166"><vh>get_next</vh>
<v t="ekr.20050502102905.167"><vh>@&lt;Raise prep...@&gt;</vh>
<v t="ekr.20050502102905.168"><vh>@&lt;Check if next token is |include|@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.169"><vh>@&lt;Check if we're at the end of a preprocessor command@&gt;</vh></v>
<v t="ekr.20050502102905.170"><vh>@&lt;Compress two-symbol operator@&gt;</vh></v>
<v t="ekr.20050502102905.171"><vh>@&lt;Get an identifier@&gt;</vh></v>
<v t="ekr.20050502102905.172"><vh>@&lt;Get a constant@&gt;</vh></v>
<v t="ekr.20050502102905.173"><vh>@&lt;Get a string@&gt;</vh></v>
<v t="ekr.20050502102905.174"><vh>@&lt;Get control code and possible section name@&gt;</vh>
<v t="ekr.20050502102905.175"><vh>@&lt;Scan the section name and make |cur_section| point to it@&gt;</vh></v>
<v t="ekr.20050502102905.176"><vh>@&lt;Scan a verbatim string@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.177"><vh>@&lt;Put section name...@&gt;</vh>
<v t="ekr.20050502102905.178"><vh>@&lt;If end of name...@&gt;</vh></v>
</v>
</v>
<v t="ekr.20050502102905.179"><vh>@&lt;Predeclaration of procedures@&gt;</vh></v>
<v t="ekr.20050502102905.180"><vh>skip_restricted</vh></v>
</v>
<v t="ekr.20050502102905.181"><vh>** Phase one processing</vh>
<v t="ekr.20050502102905.182"><vh>phase_one</vh>
<v t="ekr.20050502102905.183"><vh>@&lt;Store cross-reference data...@&gt;</vh>
<v t="ekr.20050502102905.184"><vh>@&lt;Store cross-references in the \TEX/ part of a section@&gt;</vh>
<v t="ekr.20050502102905.185"><vh>@&lt;Replace |"@@@@"| by |"@@"| @&gt;</vh></v>
</v>
<v t="ekr.20050502102905.186"><vh>@&lt;Store cross-references in the definition part of a section@&gt;</vh>
<v t="ekr.20050502102905.187"><vh>@&lt;Process a format definition@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.188"><vh>@&lt;Store cross-references in the \CEE/ part of a section@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.189"><vh>@&lt;Print error messages about un...@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.190"><vh>C_xref</vh></v>
<v t="ekr.20050502102905.191"><vh>outer_xref</vh></v>
<v t="ekr.20050502102905.192"><vh>section_check</vh></v>
</v>
<v t="ekr.20050502102905.193"><vh>* Low-level output routines</vh>
<v t="ekr.20050502102905.194"><vh>flush_buffer</vh></v>
<v t="ekr.20050502102905.195"><vh>flush_line</vh></v>
<v t="ekr.20050502102905.196"><vh>@&lt;Set initial values@&gt;</vh></v>
<v t="ekr.20050502102905.197"><vh>out_str</vh></v>
<v t="ekr.20050502102905.198"><vh>break_out</vh>
<v t="ekr.20050502102905.199"><vh>@&lt;Print warning message, break the line, |return|@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.200"><vh>out_section</vh></v>
<v t="ekr.20050502102905.201"><vh>out_name</vh></v>
</v>
<v t="ekr.20050502102905.202"><vh>* Routines that copy \TEX/ material</vh>
<v t="ekr.20050502102905.203"><vh>copy_TeX</vh></v>
<v t="ekr.20050502102905.204"><vh>copy_comment</vh>
<v t="ekr.20050502102905.205"><vh>@&lt;Check for end of comment@&gt;</vh></v>
<v t="ekr.20050502102905.206"><vh>@&lt;Copy special things when |c=='@@'...@&gt;</vh></v>
<v t="ekr.20050502102905.207"><vh>@&lt;Clear |bal| and |return|@&gt;</vh></v>
</v>
</v>
<v t="ekr.20050502102905.208"><vh>** Parsing</vh>
<v t="ekr.20050502102905.209"><vh>defines</vh></v>
<v t="ekr.20050502102905.210"><vh>print_cat</vh></v>
<v t="ekr.20050502102905.211"><vh>token lists</vh></v>
<v t="ekr.20050502102905.212"><vh>table</vh></v>
</v>
<v t="ekr.20050502102905.213"><vh>* Implementing the production</vh>
<v t="ekr.20050502102905.214"><vh>defines</vh></v>
<v t="ekr.20050502102905.215"><vh>print_text</vh>
<v t="ekr.20050502102905.216"><vh>@&lt;Print token |r|...@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.217"><vh>Production rules</vh></v>
<v t="ekr.20050502102905.218"><vh>app_str, big_app, big_app1</vh></v>
<v t="ekr.20050502102905.219"><vh>find_first_ident</vh></v>
<v t="ekr.20050502102905.220"><vh>make_reserved</vh></v>
<v t="ekr.20050502102905.221"><vh>make_underlined</vh></v>
<v t="ekr.20050502102905.222"><vh>underline_xref</vh>
<v t="ekr.20050502102905.223"><vh>@&lt;Insert new cross-reference at |q|, not at beginning of list@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.224"><vh>reduce</vh></v>
<v t="ekr.20050502102905.225"><vh>squash</vh>
<v t="ekr.20050502102905.226"><vh>@&lt;Print a snapsh...@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.227" a="M"><vh>translate</vh>
<v t="ekr.20050502102905.228"><vh>@&lt;If tracing,...@&gt;</vh></v>
<v t="ekr.20050502102905.229" a="M"><vh>@&lt;Reduce the scraps using the productions until no more rules apply@&gt;</vh>
<v t="ekr.20050502102905.230"><vh>@&lt;Make sure the entries |pp| through |pp+3| of |cat| are defined@&gt;</vh></v>
<v t="ekr.20050502102905.231" a="M"><vh>@&lt;Match a production at |pp|, or increase |pp| if there is no match@&gt;</vh>
<v t="ekr.20050502102905.232"><vh>Cases</vh>
<v t="ekr.20050502102905.233"><vh>@&lt;Cases for |exp|@&gt;</vh></v>
<v t="ekr.20050502102905.234"><vh>@&lt;Cases for |lpar|@&gt;</vh></v>
<v t="ekr.20050502102905.235"><vh>@&lt;Cases for |unop|@&gt;</vh></v>
<v t="ekr.20050502102905.236"><vh>@&lt;Cases for |ubinop|@&gt;</vh></v>
<v t="ekr.20050502102905.237"><vh>@&lt;Cases for |binop|@&gt;</vh></v>
<v t="ekr.20050502102905.238"><vh>@&lt;Cases for |cast|@&gt;</vh></v>
<v t="ekr.20050502102905.239"><vh>@&lt;Cases for |sizeof_like|@&gt;</vh></v>
<v t="ekr.20050502102905.240"><vh>@&lt;Cases for |int_like|@&gt;</vh></v>
<v t="ekr.20050502102905.241"><vh>@&lt;Cases for |public_like|@&gt;</vh></v>
<v t="ekr.20050502102905.242"><vh>@&lt;Cases for |colcol|@&gt;</vh></v>
<v t="ekr.20050502102905.243"><vh>@&lt;Cases for |decl_head|@&gt;</vh></v>
<v t="ekr.20050502102905.244"><vh>@&lt;Cases for |decl|@&gt;</vh></v>
<v t="ekr.20050502102905.245"><vh>@&lt;Cases for |base|@&gt;</vh></v>
<v t="ekr.20050502102905.246"><vh>@&lt;Cases for |struct_like|@&gt;</vh></v>
<v t="ekr.20050502102905.247"><vh>@&lt;Cases for |struct_head|@&gt;</vh></v>
<v t="ekr.20050502102905.248"><vh>@&lt;Cases for |fn_decl|@&gt;</vh></v>
<v t="ekr.20050502102905.249"><vh>@&lt;Cases for |function|@&gt;</vh></v>
<v t="ekr.20050502102905.250"><vh>@&lt;Cases for |lbrace|@&gt;</vh></v>
<v t="ekr.20050502102905.251"><vh>@&lt;Cases for |if_like|@&gt;</vh></v>
<v t="ekr.20050502102905.252"><vh>@&lt;Cases for |else_like|@&gt;</vh></v>
<v t="ekr.20050502102905.253"><vh>@&lt;Cases for |else_head|@&gt;</vh></v>
<v t="ekr.20050502102905.254"><vh>@&lt;Cases for |if_clause|@&gt;</vh></v>
<v t="ekr.20050502102905.255"><vh>@&lt;Cases for |if_head|@&gt;</vh></v>
<v t="ekr.20050502102905.256"><vh>@&lt;Cases for |do_like|@&gt;</vh></v>
<v t="ekr.20050502102905.257"><vh>@&lt;Cases for |case_like|@&gt;</vh></v>
<v t="ekr.20050502102905.258"><vh>@&lt;Cases for |catch_like|@&gt;</vh></v>
<v t="ekr.20050502102905.259"><vh>@&lt;Cases for |tag|@&gt;</vh></v>
<v t="ekr.20050502102905.260"><vh>@&lt;Cases for |stmt|@&gt;</vh></v>
<v t="ekr.20050502102905.261"><vh>@&lt;Cases for |semi|@&gt;</vh></v>
<v t="ekr.20050502102905.262"><vh>@&lt;Cases for |lproc|@&gt;</vh></v>
<v t="ekr.20050502102905.263"><vh>@&lt;Cases for |section_scrap|@&gt;</vh></v>
<v t="ekr.20050502102905.264"><vh>@&lt;Cases for |insert|@&gt;</vh></v>
<v t="ekr.20050502102905.265"><vh>@&lt;Cases for |prelangle|@&gt;</vh></v>
<v t="ekr.20050502102905.266"><vh>@&lt;Cases for |prerangle|@&gt;</vh></v>
<v t="ekr.20050502102905.267"><vh>@&lt;Cases for |langle|@&gt;</vh></v>
<v t="ekr.20050502102905.268"><vh>@&lt;Cases for |template_like|@&gt;</vh></v>
<v t="ekr.20050502102905.269"><vh>@&lt;Cases for |new_like|@&gt;</vh></v>
<v t="ekr.20050502102905.270"><vh>@&lt;Cases for |new_exp|@&gt;</vh></v>
<v t="ekr.20050502102905.271"><vh>@&lt;Cases for |ftemplate|@&gt;</vh></v>
<v t="ekr.20050502102905.272"><vh>@&lt;Cases for |for_like|@&gt;</vh></v>
<v t="ekr.20050502102905.273"><vh>@&lt;Cases for |raw_ubin|@&gt;</vh></v>
<v t="ekr.20050502102905.274"><vh>@&lt;Cases for |const_like|@&gt;</vh></v>
<v t="ekr.20050502102905.275"><vh>@&lt;Cases for |raw_int|@&gt;</vh></v>
<v t="ekr.20050502102905.276"><vh>@&lt;Cases for |operator_like|@&gt;</vh></v>
<v t="ekr.20050502102905.277"><vh>@&lt;Cases for |typedef_like|@&gt;</vh></v>
<v t="ekr.20050502102905.278"><vh>@&lt;Cases for |delete_like|@&gt;</vh></v>
<v t="ekr.20050502102905.279"><vh>@&lt;Cases for |question|@&gt;</vh></v>
</v>
</v>
</v>
<v t="ekr.20050502102905.280"><vh>@&lt;Combine the irreducible scraps that remain@&gt;</vh>
<v t="ekr.20050502102905.281"><vh>@&lt;If semi-tracing, show the irreducible scraps@&gt;</vh></v>
</v>
</v>
</v>
<v t="ekr.20050502102905.282"><vh>* Initializing the scraps</vh>
<v t="ekr.20050502102905.283"><vh>defines</vh></v>
<v t="ekr.20050502102905.284"><vh>@&lt;Append the scr...@&gt;</vh>
<v t="ekr.20050502102905.285"><vh>@&lt;Make sure that there is room for the new...@&gt;</vh></v>
<v t="ekr.20050502102905.286"><vh>@&lt;Cases involving nonstandard characters@&gt;</vh></v>
<v t="ekr.20050502102905.287"><vh>@&lt;Append a string or constant@&gt;</vh></v>
<v t="ekr.20050502102905.288"><vh>@&lt;Append a \TEX/ string, without forming a scrap@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.289"><vh>app_cur_id</vh></v>
<v t="ekr.20050502102905.290"><vh>C_translate</vh></v>
<v t="ekr.20050502102905.291"><vh>outer_parse</vh></v>
</v>
<v t="ekr.20050502102905.292"><vh>* Output of tokens</vh>
<v t="ekr.20050502102905.293"><vh>defines</vh></v>
<v t="ekr.20050502102905.294"><vh>push_level</vh></v>
<v t="ekr.20050502102905.295"><vh>pop_level</vh></v>
<v t="ekr.20050502102905.296"><vh>get_output</vh></v>
<v t="ekr.20050502102905.297"><vh>output_C</vh></v>
<v t="ekr.20050502102905.298"><vh>make_output</vh>
<v t="ekr.20050502102905.299"><vh>@&lt;Output saved...@&gt;</vh></v>
<v t="ekr.20050502102905.300"><vh>@&lt;Output a control...@&gt;</vh>
<v t="ekr.20050502102905.301"><vh>@&lt;Look ahead for strongest line break, |goto reswitch|@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.302"><vh>@&lt;Output an identifier@&gt;</vh></v>
<v t="ekr.20050502102905.303"><vh>@&lt;Output a section name@&gt;</vh>
<v t="ekr.20050502102905.304"><vh>@&lt;Output the text...@&gt;</vh>
<v t="ekr.20050502102905.305"><vh>@&lt;Skip next char...@&gt;</vh></v>
<v t="ekr.20050502102905.306"><vh>@&lt;Copy the \CEE/ text into the |buffer| array@&gt;</vh>
<v t="ekr.20050502102905.307"><vh>@&lt;Copy a quoted char...@&gt;</vh></v>
</v>
</v>
</v>
</v>
</v>
<v t="ekr.20050502102905.308"><vh>** Phase two processing</vh>
<v t="ekr.20050502102905.309"><vh>phase_two</vh>
<v t="ekr.20050502102905.310"><vh>@&lt;Translate the current section@&gt;</vh>
<v t="ekr.20050502102905.311"><vh>@&lt;Output the code for the beginning of a new section@&gt;</vh></v>
<v t="ekr.20050502102905.312"><vh>@&lt;Translate the \TEX/ part of the current section@&gt;</vh></v>
<v t="ekr.20050502102905.313"><vh>@&lt;Translate the definition part of the current section@&gt;</vh>
<v t="ekr.20050502102905.314"><vh>@&lt;Start a macro definition@&gt;</vh></v>
<v t="ekr.20050502102905.315"><vh>@&lt;Start a format...@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.316"><vh>@&lt;Translate the \CEE/...@&gt;</vh>
<v t="ekr.20050502102905.317"><vh>@&lt;Check that '='...@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.318"><vh>@&lt;Emit the scrap...@&gt;</vh></v>
<v t="ekr.20050502102905.319"><vh>@&lt;Show cross-references to this section@&gt;</vh></v>
<v t="ekr.20050502102905.320"><vh>@&lt;Output the code for the end of a section@&gt;</vh></v>
</v>
</v>
<v t="ekr.20050502102905.321"><vh>footnote</vh>
<v t="ekr.20050502102905.322"><vh>@&lt;Output all the section numbers on the reference list |cur_xref|@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.323"><vh>finish_C</vh></v>
</v>
<v t="ekr.20050502102905.324"><vh>** Phase three processing</vh>
<v t="ekr.20050502102905.325"><vh>phase_three</vh>
<v t="ekr.20050502102905.326"><vh>@&lt;Tell about changed sections@&gt;</vh></v>
<v t="ekr.20050502102905.327"><vh>@&lt;Do the first pass of sorting@&gt;</vh></v>
<v t="ekr.20050502102905.328"><vh>@&lt;Sort and output...@&gt;</vh>
<v t="ekr.20050502102905.329"><vh>@&lt;Split the list...@&gt;</vh></v>
<v t="ekr.20050502102905.330"><vh>@&lt;Output index...@&gt;</vh>
<v t="ekr.20050502102905.331"><vh>@&lt;Output the name...@&gt;</vh></v>
<v t="ekr.20050502102905.332"><vh>@&lt;Output the cross-references at |cur_name|@&gt;</vh>
<v t="ekr.20050502102905.333"><vh>@&lt;Invert the cross-reference list at |cur_name|, making |cur_xref| the head@&gt;</vh></v>
</v>
</v>
</v>
<v t="ekr.20050502102905.334"><vh>@&lt;Output all the section names@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.335"><vh>unbucket</vh></v>
<v t="ekr.20050502102905.336"><vh>section_print</vh></v>
<v t="ekr.20050502102905.337"><vh>print_stats</vh></v>
</v>
<v t="ekr.20050502102905.338"><vh>** Index</vh></v>
</v>
<v t="ekr.20050502102905.339"><vh>@file prod.w</vh>
<v t="ekr.20050502102905.340"><vh>Limbo</vh></v>
</v>
<v t="ekr.20050502102905.341"><vh>@file wc.w</vh>
<v t="ekr.20050502102905.342"><vh>Limbo</vh></v>
<v t="ekr.20050502102905.343"><vh>* Introduction</vh></v>
<v t="ekr.20050502102905.344"><vh>declarations</vh></v>
<v t="ekr.20050502102905.345"><vh>@&lt;The main program@&gt;</vh>
<v t="ekr.20050502102905.346"><vh>@&lt;Variables local to |main|@&gt;</vh></v>
<v t="ekr.20050502102905.347"><vh>@&lt;Set up o...@&gt;</vh></v>
<v t="ekr.20050502102905.348" a="M"><vh>@&lt;Process all the files@&gt;</vh>
<v t="ekr.20050502102905.349"><vh>@&lt;If a file is given, try to open |*(++argv)|; |continue| if unsuccessful@&gt;</vh></v>
<v t="ekr.20050502102905.350"><vh>@&lt;Close file@&gt;</vh></v>
<v t="ekr.20050502102905.351"><vh>Buffering &amp; totals</vh></v>
<v t="ekr.20050502102905.352"><vh>@&lt;Scan file@&gt;</vh>
<v t="ekr.20050502102905.353"><vh>@&lt;Fill |buffer| if it is empty; |break| at end of file@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.354"><vh>@&lt;Write statistics for file@&gt;</vh></v>
<v t="ekr.20050502102905.355"><vh>@&lt;Upda...@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.356"><vh>@&lt;Print the grand totals if there were multiple files@&gt;</vh></v>
</v>
<v t="ekr.20050502102905.357"><vh>wc_print</vh></v>
<v t="ekr.20050502102905.358"><vh>* Index</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20050502102905">@nocolor

Warning!  Do not attempt to create derived files from this outline!  This outline is for study and illustration only!

Warning! Present versions of Leo will not Tangle these files properly, for a number of reasons.  First,  Leo does not support CWEB's ... convention used to elide section names.  Second, Leo does not support CWEB's @d and @f control codes.  Third, we would have to use @root trees instead of @file trees to have any hope of tangling these files correctly.  In particular, we would have to move the highest-level code into the @root nodes.  I didn't want to do that in order to preserve the presentation of the original as much as possible.

This file illustrates how to use Leo to study CWEB large programs, such as CWEB itself.  I assert that these files are far easier to understand than the original CWEB files.  In particular, it is now immediately clear just what functions are defined in each part of the outline.  It is also immediately clear just where sections are used and defined.  As always, the outline presents an ever-present overview of all parts of the code.

I have moved a few section definitions so that each section is defined in a child of the node that references it.  In all cases, I believe this clarifies the code, even when it interrupts the "narrative".  In some cases I have grouped a series of sections containing declarations, includes, etc. into a single node.  It would also be good style to create separate sections for different groups of declarations.  I believe outline structure often suggests a better organization for a file, and I have resisted the temptation to make such changes.  One could also criticize the programming style, but bear in mind that much of this code is almost 20 years old.

This file was originally created using leo.py's Import CWEB Files command for each @file node.  This command did most of the work of creating outlines from the flat .w files.  Several hours of work were required to group related sections into related nodes.

Edward K. Ream
June 4, 2002</t>
<t tx="ekr.20050502102905.1">@language cweb
@ignore
@others</t>
<t tx="ekr.20050502102905.10">@* The character set. \.{CWEB} uses the conventions of \CEE/ programs found in the standard \.{ctype.h} header file.

@&lt;Include files@&gt;=
#include &lt;ctype.h&gt;

@ A few character pairs are encoded internally as single characters, using the definitions below. These definitions are consistent with an extension of ASCII code originally developed at MIT and explained in Appendix~C of {\sl The \TEX/book\/}; thus, users who have such a character set can type things like \.{\char'32} and \.{\char'4} instead of \.{!=} and \.{\&amp;\&amp;}. (However, their files will not be too portable until more people adopt the extended code.)  If the character set is not ASCII, the definitions given here may conflict with existing characters; in such cases, other arbitrary codes should be substituted. The indexes to \.{CTANGLE} and \.{CWEAVE} mention every case where similar codes may have to be changed in order to avoid character conflicts. Look for the entry ``ASCII code dependencies'' in those indexes.  @^ASCII code dependencies@&gt; @^system dependencies@&gt;

@d and_and 04 /* `\.{\&amp;\&amp;}'\,; corresponds to MIT's {\tentex\char'4} */
@d lt_lt 020 /* `\.{&lt;&lt;}'\,;  corresponds to MIT's {\tentex\char'20} */
@d gt_gt 021 /* `\.{&gt;&gt;}'\,;  corresponds to MIT's {\tentex\char'21} */
@d plus_plus 013 /* `\.{++}'\,;  corresponds to MIT's {\tentex\char'13} */
@d minus_minus 01 /* `\.{--}'\,;  corresponds to MIT's {\tentex\char'1} */
@d minus_gt 031 /* `\.{-&gt;}'\,;  corresponds to MIT's {\tentex\char'31} */
@d not_eq 032 /* `\.{!=}'\,;  corresponds to MIT's {\tentex\char'32} */
@d lt_eq 034 /* `\.{&lt;=}'\,;  corresponds to MIT's {\tentex\char'34} */
@d gt_eq 035 /* `\.{&gt;=}'\,;  corresponds to MIT's {\tentex\char'35} */
@d eq_eq 036 /* `\.{==}'\,;  corresponds to MIT's {\tentex\char'36} */
@d or_or 037 /* `\.{\v\v}'\,;  corresponds to MIT's {\tentex\char'37} */
@d dot_dot_dot 016 /* `\.{...}'\,;  corresponds to MIT's {\tentex\char'16} */
@d colon_colon 06 /* `\.{::}'\,;  corresponds to MIT's {\tentex\char'6} */
@d period_ast 026 /* `\.{.*}'\,;  corresponds to MIT's {\tentex\char'26} */
@d minus_gt_ast 027 /* `\.{-&gt;*}'\,;  corresponds to MIT's {\tentex\char'27} */
</t>
<t tx="ekr.20050502102905.100">@ A many-way switch is used to send the output.  Note that this function is not called if |out_state==verbatim|, except perhaps with arguments |'\n'| (protect the newline), |string| (end the string), or |constant| (end the constant).

@&lt;Predeclaration of procedures@&gt;=
static void out_char();

@ @c
static void
out_char(cur_char)
eight_bits cur_char;
{
  char *j, *k; /* pointer into |byte_mem| */
restart:
    switch (cur_char) {
      case '\n': if (protect &amp;&amp; out_state!=verbatim) C_putc(' ');
        if (protect || out_state==verbatim) C_putc('\\');
        flush_buffer(); if (out_state!=verbatim) out_state=normal; break;
      @/@t\4@&gt;@&lt;Case of an identifier@&gt;;
      @/@t\4@&gt;@&lt;Case of a section number@&gt;;
      @/@t\4@&gt;@&lt;Cases like \.{!=}@&gt;;
      case '=': case '&gt;': C_putc(cur_char); C_putc(' ');
        out_state=normal; break;
      case join: out_state=unbreakable; break;
      case constant: if (out_state==verbatim) {
          out_state=num_or_id; break;
        }
        if(out_state==num_or_id) C_putc(' '); out_state=verbatim; break;
      case string: if (out_state==verbatim) out_state=normal;
        else out_state=verbatim; break;
      case '/': C_putc('/'); out_state=post_slash; break;
      case '*': if (out_state==post_slash) C_putc(' ');
        /* fall through */
      default: C_putc(cur_char); out_state=normal; break;
    }
}
</t>
<t tx="ekr.20050502102905.101">@ @&lt;Case of an identifier@&gt;=
case identifier:
  if (out_state==num_or_id) C_putc(' ');
  j=(cur_val+name_dir)-&gt;byte_start;
  k=(cur_val+name_dir+1)-&gt;byte_start;
  while (j&lt;k) {
    if ((unsigned char)(*j)&lt;0200) C_putc(*j);
@^high-bit character handling@&gt;
    else C_printf("%s",translit[(unsigned char)(*j)-0200]);
    j++;
  }
  out_state=num_or_id; break;
</t>
<t tx="ekr.20050502102905.102">@ @&lt;Case of a sec...@&gt;=
case section_number:
  if (cur_val&gt;0) C_printf("/*%d:*/",cur_val);
  else if(cur_val&lt;0) C_printf("/*:%d*/",-cur_val);
  else if (protect) {
    cur_byte +=4; /* skip line number and file name */
    cur_char = '\n';
    goto restart;
  } else {
    sixteen_bits a;
    a=0400* *cur_byte++;
    a+=*cur_byte++; /* gets the line number */
    C_printf("\n#line %d \"",a);
@:line}{\.{\#line}@&gt;
    cur_val=*cur_byte++;
    cur_val=0400*(cur_val-0200)+ *cur_byte++; /* points to the file name */
    for (j=(cur_val+name_dir)-&gt;byte_start, k=(cur_val+name_dir+1)-&gt;byte_start;
         j&lt;k; j++) {
      if (*j=='\\' || *j=='"') C_putc('\\');
      C_putc(*j);
    }
    C_printf("%s","\"\n");
  }
  break;
</t>
<t tx="ekr.20050502102905.103">@ @&lt;Cases like \.{!=}@&gt;=
case plus_plus: C_putc('+'); C_putc('+'); out_state=normal; break;
case minus_minus: C_putc('-'); C_putc('-'); out_state=normal; break;
case minus_gt: C_putc('-'); C_putc('&gt;'); out_state=normal; break;
case gt_gt: C_putc('&gt;'); C_putc('&gt;'); out_state=normal; break;
case eq_eq: C_putc('='); C_putc('='); out_state=normal; break;
case lt_lt: C_putc('&lt;'); C_putc('&lt;'); out_state=normal; break;
case gt_eq: C_putc('&gt;'); C_putc('='); out_state=normal; break;
case lt_eq: C_putc('&lt;'); C_putc('='); out_state=normal; break;
case not_eq: C_putc('!'); C_putc('='); out_state=normal; break;
case and_and: C_putc('&amp;'); C_putc('&amp;'); out_state=normal; break;
case or_or: C_putc('|'); C_putc('|'); out_state=normal; break;
case dot_dot_dot: C_putc('.'); C_putc('.'); C_putc('.'); out_state=normal;
    break;
case colon_colon: C_putc(':'); C_putc(':'); out_state=normal; break;
case period_ast: C_putc('.'); C_putc('*'); out_state=normal; break;
case minus_gt_ast: C_putc('-'); C_putc('&gt;'); C_putc('*'); out_state=normal;
    break;
</t>
<t tx="ekr.20050502102905.104">@ When an identifier is output to the \CEE/ file, characters in the range 128--255 must be changed into something else, so the \CEE/ compiler won't complain.  By default, \.{CTANGLE} converts the character with code $16 x+y$ to the three characters `\.X$xy$', but a different transliteration table can be specified.  Thus a German might want {\it gr\"un\/} to appear as a still readable \.{gruen}. This makes debugging a lot less confusing.

@d translit_length 10

@&lt;Global variables@&gt;=
char translit[128][translit_length];

@ @&lt;Set init...@&gt;=
{
  int i;
  for (i=0;i&lt;128;i++) sprintf(translit[i],"X%02X",(unsigned)(128+i));
}
</t>
<t tx="ekr.20050502102905.105"></t>
<t tx="ekr.20050502102905.106">@** Introduction to the input phase.
We have now seen that \.{CTANGLE} will be able to output the full
\CEE/ program, if we can only get that program into the byte memory in
the proper format. The input process is something like the output process
in reverse, since we compress the text as we read it in and we expand it
as we write it out.

There are three main input routines. The most interesting is the one that gets
the next token of a \CEE/ text; the other two are used to scan rapidly past
\TEX/ text in the \.{CWEB} source code. One of the latter routines will jump to
the next token that starts with `\.{@@}', and the other skips to the end
of a \CEE/ comment.</t>
<t tx="ekr.20050502102905.107">@ Control codes in \.{CWEB} begin with `\.{@@}', and the next character identifies the code. Some of these are of interest only to \.{CWEAVE}, so \.{CTANGLE} ignores them; the others are converted by \.{CTANGLE} into internal code numbers by the |ccode| table below. The ordering of these internal code numbers has been chosen to simplify the program logic; larger numbers are given to the control codes that denote more significant milestones.

@d ignore 0 /* control code of no interest to \.{CTANGLE} */
@d ord 0302 /* control code for `\.{@@'}' */
@d control_text 0303 /* control code for `\.{@@t}', `\.{@@\^}', etc. */
@d translit_code 0304 /* control code for `\.{@@l}' */
@d output_defs_code 0305 /* control code for `\.{@@h}' */
@d format_code 0306 /* control code for `\.{@@f}' */
@d definition 0307 /* control code for `\.{@@d}' */
@d begin_C 0310 /* control code for `\.{@@c}' */
@d section_name 0311 /* control code for `\.{@@&lt;}' */
@d new_section 0312 /* control code for `\.{@@\ }' and `\.{@@*}' */

@&lt;Global variables@&gt;=
eight_bits ccode[256]; /* meaning of a char following \.{@@} */

@ @&lt;Set ini...@&gt;= {
  int c; /* must be |int| so the |for| loop will end */
  for (c=0; c&lt;256; c++) ccode[c]=ignore;
  ccode[' ']=ccode['\t']=ccode['\n']=ccode['\v']=ccode['\r']=ccode['\f']
   =ccode['*']=new_section;
  ccode['@@']='@@'; ccode['=']=string;
  ccode['d']=ccode['D']=definition;
  ccode['f']=ccode['F']=ccode['s']=ccode['S']=format_code;
  ccode['c']=ccode['C']=ccode['p']=ccode['P']=begin_C;
  ccode['^']=ccode[':']=ccode['.']=ccode['t']=ccode['T']=
   ccode['q']=ccode['Q']=control_text;
  ccode['h']=ccode['H']=output_defs_code;
  ccode['l']=ccode['L']=translit_code;
  ccode['&amp;']=join;
  ccode['&lt;']=ccode['(']=section_name;
  ccode['\'']=ord;
}
</t>
<t tx="ekr.20050502102905.108">@ The |skip_ahead| procedure reads through the input at fairly high speed until finding the next non-ignorable control code, which it returns.

@c
eight_bits
skip_ahead() /* skip to next control code */
{
  eight_bits c; /* control code found */
  while (1) {
    if (loc&gt;limit &amp;&amp; (get_line()==0)) return(new_section);
    *(limit+1)='@@';
    while (*loc!='@@') loc++;
    if (loc&lt;=limit) {
      loc++; c=ccode[(eight_bits)*loc]; loc++;
      if (c!=ignore || *(loc-1)=='&gt;') return(c);
    }
  }
}</t>
<t tx="ekr.20050502102905.109">@ The |skip_comment| procedure reads through the input at somewhat high speed in order to pass over comments, which \.{CTANGLE} does not transmit to the output. If the comment is introduced by \.{/*}, |skip_comment| proceeds until finding the end-comment token \.{*/} or a newline; in the latter case |skip_comment| will be called again by |get_next|, since the comment is not finished.  This is done so that the each newline in the \CEE/ part of a section is copied to the output; otherwise the \&amp;{\#line} commands inserted into the \CEE/ file by the output routines become useless. On the other hand, if the comment is introduced by \.{//} (i.e., if it is a \CPLUSPLUS/ ``short comment''), it always is simply delimited by the next newline. The boolean argument |is_long_comment| distinguishes between the two types of comments.  If |skip_comment| comes to the end of the section, it prints an error message. No comment, long or short, is allowed to contain `\.{@@\ }' or `\.{@

@*}'.

@&lt;Global variables@&gt;=
boolean comment_continues=0; /* are we scanning a comment? */

@ @c
int skip_comment(is_long_comment) /* skips over comments */
boolean is_long_comment;
{
  char c; /* current character */
  while (1) {
    if (loc&gt;limit) {
      if (is_long_comment) {
        if(get_line()) return(comment_continues=1);
        else{
          err_print("! Input ended in mid-comment");
@.Input ended in mid-comment@&gt;
          return(comment_continues=0);
        }
      }
      else return(comment_continues=0);
    }
    c=*(loc++);
    if (is_long_comment &amp;&amp; c=='*' &amp;&amp; *loc=='/') {
      loc++; return(comment_continues=0);
    }
    if (c=='@@') {
      if (ccode[(eight_bits)*loc]==new_section) {
        err_print("! Section name ended in mid-comment"); loc--;
@.Section name ended in mid-comment@&gt;
        return(comment_continues=0);
      }
      else loc++;
    }
  }
}
</t>
<t tx="ekr.20050502102905.11">@** Input routines.  The lowest level of input to the \.{CWEB} programs is performed by |input_ln|, which must be told which file to read from. The return value of |input_ln| is 1 if the read is successful and 0 if not (generally this means the file has ended). The conventions of \TEX/ are followed; i.e., the characters of the next line of the file are copied into the |buffer| array, and the global variable |limit| is set to the first unoccupied position. Trailing blanks are ignored. The value of |limit| must be strictly less than |buf_size|, so that |buffer[buf_size-1]| is never filled.  Since |buf_size| is strictly less than |long_buf_size|, some of \.{CWEB}'s routines use the fact that it is safe to refer to |*(limit+2)| without overstepping the bounds of the array.

@d buf_size 100 /* for \.{CWEAVE} and \.{CTANGLE} */
@d longest_name 1000
@d long_buf_size (buf_size+longest_name) /* for \.{CWEAVE} */
@d xisspace(c) (isspace(c)&amp;&amp;((unsigned char)c&lt;0200))
@d xisupper(c) (isupper(c)&amp;&amp;((unsigned char)c&lt;0200))

@&lt;Definitions that should agree with \.{CTANGLE} and \.{CWEAVE}@&gt;=
char buffer[long_buf_size]; /* where each line of input goes */
char *buffer_end=buffer+buf_size-2; /* end of |buffer| */
char *limit=buffer; /* points to the last character in the buffer */
char *loc=buffer; /* points to the next character to be read from the buffer */</t>
<t tx="ekr.20050502102905.110">@* Inputting the next token.

@d constant 03

@&lt;Global variables@&gt;=
name_pointer cur_section_name; /* name of section just scanned */
int no_where; /* suppress |print_where|? */

@ @&lt;Include...@&gt;=
#include &lt;ctype.h&gt; /* definition of |isalpha|, |isdigit| and so on */
#include &lt;stdlib.h&gt; /* definition of |exit| */
</t>
<t tx="ekr.20050502102905.111">@ As one might expect, |get_next| consists mostly of a big switch that branches to the various special cases that can arise.

@d isxalpha(c) ((c)=='_' || (c)=='$')
  /* non-alpha characters allowed in identifier */

@d ishigh(c) ((unsigned char)(c)&gt;0177)
@^high-bit character handling@&gt;

@c
eight_bits
get_next() /* produces the next input token */
{
  static int preprocessing=0;
  eight_bits c; /* the current character */
  while (1) {
    if (loc&gt;limit) {
      if (preprocessing &amp;&amp; *(limit-1)!='\\') preprocessing=0;
      if (get_line()==0) return(new_section);
      else if (print_where &amp;&amp; !no_where) {
          print_where=0;
          @&lt;Insert the line number into |tok_mem|@&gt;;
        }
        else return ('\n');
    }
    c=*loc;
    if (comment_continues || (c=='/' &amp;&amp; (*(loc+1)=='*' || *(loc+1)=='/'))) {
      skip_comment(comment_continues||*(loc+1)=='*');
          /* scan to end of comment or newline */
      if (comment_continues) return('\n');
      else continue;
    }
    loc++;
    if (xisdigit(c) || c=='\\' || c=='.') @&lt;Get a constant@&gt;@;
    else if (c=='\'' || c=='"' || (c=='L'&amp;&amp;(*loc=='\'' || *loc=='"')))
        @&lt;Get a string@&gt;@;
    else if (isalpha(c) || isxalpha(c) || ishigh(c))
      @&lt;Get an identifier@&gt;@;
    else if (c=='@@') @&lt;Get control code and possible section name@&gt;@;
    else if (xisspace(c)) {
        if (!preprocessing || loc&gt;limit) continue;
          /* we don't want a blank after a final backslash */
        else return(' '); /* ignore spaces and tabs, unless preprocessing */
    }
    else if (c=='#' &amp;&amp; loc==buffer+1) preprocessing=1;
    mistake: @&lt;Compress two-symbol operator@&gt;@;
    return(c);
  }
}</t>
<t tx="ekr.20050502102905.112">@ The following code assigns values to the combinations \.{++}, \.{--}, \.{-&gt;}, \.{&gt;=}, \.{&lt;=}, \.{==}, \.{&lt;&lt;}, \.{&gt;&gt;}, \.{!=}, \.{||} and \.{\&amp;\&amp;}, and to the \CPLUSPLUS/ combinations \.{...}, \.{::}, \.{.*} and \.{-&gt;*}. The compound assignment operators (e.g., \.{+=}) are treated as separate tokens.

@d compress(c) if (loc++&lt;=limit) return(c)

@&lt;Compress two-symbol operator@&gt;=
switch(c) {
  case '+': if (*loc=='+') compress(plus_plus); break;
  case '-': if (*loc=='-') {compress(minus_minus);}
    else if (*loc=='&gt;') if (*(loc+1)=='*') {loc++; compress(minus_gt_ast);}
                        else compress(minus_gt); break;
  case '.': if (*loc=='*') {compress(period_ast);}
            else if (*loc=='.' &amp;&amp; *(loc+1)=='.') {
              loc++; compress(dot_dot_dot);
            }
            break;
  case ':': if (*loc==':') compress(colon_colon); break;
  case '=': if (*loc=='=') compress(eq_eq); break;
  case '&gt;': if (*loc=='=') {compress(gt_eq);}
    else if (*loc=='&gt;') compress(gt_gt); break;
  case '&lt;': if (*loc=='=') {compress(lt_eq);}
    else if (*loc=='&lt;') compress(lt_lt); break;
  case '&amp;': if (*loc=='&amp;') compress(and_and); break;
  case '|': if (*loc=='|') compress(or_or); break;
  case '!': if (*loc=='=') compress(not_eq); break;
}
</t>
<t tx="ekr.20050502102905.113">@ @&lt;Get an identifier@&gt;= {
  id_first=--loc;
  while (isalpha(*++loc) || isdigit(*loc) || isxalpha(*loc) || ishigh(*loc));
  id_loc=loc; return(identifier);
}
</t>
<t tx="ekr.20050502102905.114">@ @&lt;Get a constant@&gt;= {
  id_first=loc-1;
  if (*id_first=='.' &amp;&amp; !xisdigit(*loc)) goto mistake; /* not a constant */
  if (*id_first=='\\') while (xisdigit(*loc)) loc++; /* octal constant */
  else {
    if (*id_first=='0') {
      if (*loc=='x' || *loc=='X') { /* hex constant */
        loc++; while (xisxdigit(*loc)) loc++; goto found;
      }
    }
    while (xisdigit(*loc)) loc++;
    if (*loc=='.') {
    loc++;
    while (xisdigit(*loc)) loc++;
    }
    if (*loc=='e' || *loc=='E') { /* float constant */
      if (*++loc=='+' || *loc=='-') loc++;
      while (xisdigit(*loc)) loc++;
    }
  }
  found: while (*loc=='u' || *loc=='U' || *loc=='l' || *loc=='L'
             || *loc=='f' || *loc=='F') loc++;
  id_loc=loc;
  return(constant);
}
</t>
<t tx="ekr.20050502102905.115">@ \CEE/ strings and character constants, delimited by double and single quotes, respectively, can contain newlines or instances of their own delimiters if they are protected by a backslash.  We follow this convention, but do not allow the string to be longer than |longest_name|.

@&lt;Get a string@&gt;= {
  char delim = c; /* what started the string */
  id_first = section_text+1;
  id_loc = section_text; *++id_loc=delim;
  if (delim=='L') { /* wide character constant */
    delim=*loc++; *++id_loc=delim;
  }
  while (1) {
    if (loc&gt;=limit) {
      if(*(limit-1)!='\\') {
        err_print("! String didn't end"); loc=limit; break;
@.String didn't end@&gt;
      }
      if(get_line()==0) {
        err_print("! Input ended in middle of string"); loc=buffer; break;
@.Input ended in middle of string@&gt;
      }
      else if (++id_loc&lt;=section_text_end) *id_loc='\n'; /* will print as
      \.{"\\\\\\n"} */
    }
    if ((c=*loc++)==delim) {
      if (++id_loc&lt;=section_text_end) *id_loc=c;
      break;
    }
    if (c=='\\') {
      if (loc&gt;=limit) continue;
      if (++id_loc&lt;=section_text_end) *id_loc = '\\';
      c=*loc++;
    }
    if (++id_loc&lt;=section_text_end) *id_loc=c;
  }
  if (id_loc&gt;=section_text_end) {
    printf("\n! String too long: ");
@.String too long@&gt;
    term_write(section_text+1,25);
    err_print("...");
  }
  id_loc++;
  return(string);
}
</t>
<t tx="ekr.20050502102905.116">@ After an \.{@@} sign has been scanned, the next character tells us whether there is more work to do.

@&lt;Get control code and possible section name@&gt;= {
  c=ccode[(eight_bits)*loc++];
  switch(c) {
    case ignore: continue;
    case output_defs_code: output_defs_seen=1; return(c);
    case translit_code: err_print("! Use @@l in limbo only"); continue;
@.Use @@l in limbo...@&gt;
    case control_text: while ((c=skip_ahead())=='@@');
      /* only \.{@@@@} and \.{@@&gt;} are expected */
      if (*(loc-1)!='&gt;')
        err_print("! Double @@ should be used in control text");
@.Double @@ should be used...@&gt;
      continue;
    case section_name:
      cur_section_name_char=*(loc-1);
      @&lt;Scan the section name and make |cur_section_name| point to it@&gt;;
    case string: @&lt;Scan a verbatim string@&gt;;
    case ord: @&lt;Scan an ASCII constant@&gt;;
    default: return(c);
  }
}
</t>
<t tx="ekr.20050502102905.117">@ After scanning a valid ASCII constant that follows \.{@@'}, this code plows ahead until it finds the next single quote. (Special care is taken if the quote is part of the constant.) Anything after a valid ASCII constant is ignored; thus, \.{@@'\\nopq'} gives the same result as \.{@@'\\n'}.

@&lt;Scan an ASCII constant@&gt;=
  id_first=loc;
  if (*loc=='\\') {
    if (*++loc=='\'') loc++;
  }
  while (*loc!='\'') {
    if (*loc=='@@') {
      if (*(loc+1)!='@@')
        err_print("! Double @@ should be used in ASCII constant");
@.Double @@ should be used...@&gt;
      else loc++;
    }
    loc++;
    if (loc&gt;limit) {
        err_print("! String didn't end"); loc=limit-1; break;
@.String didn't end@&gt;
    }
  }
  loc++;
  return(ord);
</t>
<t tx="ekr.20050502102905.118">@ @&lt;Scan the section name...@&gt;= {
  char *k; /* pointer into |section_text| */
  @&lt;Put section name into |section_text|@&gt;;
  if (k-section_text&gt;3 &amp;&amp; strncmp(k-2,"...",3)==0)
    cur_section_name=section_lookup(section_text+1,k-3,1); /* 1 means is a prefix */
  else cur_section_name=section_lookup(section_text+1,k,0);
  if (cur_section_name_char=='(')
    @&lt;If it's not there, add |cur_section_name| to the output file stack, or complain we're out of room@&gt;;
  return(section_name);
}
</t>
<t tx="ekr.20050502102905.119">@ @&lt;If it's not there, add |cur_section_name| to the output file stack, or complain we're out of room@&gt;=
{
  for (an_output_file=cur_out_file;
        an_output_file&lt;end_output_files; an_output_file++)
            if (*an_output_file==cur_section_name) break;
  if (an_output_file==end_output_files) {
    if (cur_out_file&gt;output_files)
        *--cur_out_file=cur_section_name;
    else {
      overflow("output files");
    }
  }
}
</t>
<t tx="ekr.20050502102905.12">@
@&lt;Include files@&gt;=
#include &lt;stdio.h&gt;

@ In the unlikely event that your standard I/O library does not support |feof|, |getc|, and |ungetc| you may have to change things here. @^system dependencies@&gt;

@c
int input_ln(fp) /* copies a line into |buffer| or returns 0 */
FILE *fp; /* what file to read from */
{
  register int  c=EOF; /* character read; initialized so some compilers won't complain */
  register char *k;  /* where next character goes */
  if (feof(fp)) return(0);  /* we have hit end-of-file */
  limit = k = buffer;  /* beginning of buffer */
  while (k&lt;=buffer_end &amp;&amp; (c=getc(fp)) != EOF &amp;&amp; c!='\n')
    if ((*(k++) = c) != ' ') limit = k;
  if (k&gt;buffer_end)
    if ((c=getc(fp))!=EOF &amp;&amp; c!='\n') {
      ungetc(c,fp); loc=buffer; err_print("! Input line too long");
@.Input line too long@&gt;
  }
  if (c==EOF &amp;&amp; limit==buffer) return(0);  /* there was nothing after
    the last newline */
  return(1);
}</t>
<t tx="ekr.20050502102905.120">@ @&lt;Put section name...@&gt;=
k=section_text;
while (1) {
  if (loc&gt;limit &amp;&amp; get_line()==0) {
    err_print("! Input ended in section name");
@.Input ended in section name@&gt;
    loc=buffer+1; break;
  }
  c=*loc;
  @&lt;If end of name or erroneous nesting, |break|@&gt;;
  loc++; if (k&lt;section_text_end) k++;
  if (xisspace(c)) {
    c=' '; if (*(k-1)==' ') k--;
  }
*k=c;
}
if (k&gt;=section_text_end) {
  printf("\n! Section name too long: ");
@.Section name too long@&gt;
  term_write(section_text+1,25);
  printf("..."); mark_harmless;
}
if (*k==' ' &amp;&amp; k&gt;section_text) k--;
</t>
<t tx="ekr.20050502102905.121">@ @&lt;If end of name or erroneous nesting,...@&gt;=
if (c=='@@') {
  c=*(loc+1);
  if (c=='&gt;') {
    loc+=2; break;
  }
  if (ccode[(eight_bits)c]==new_section) {
    err_print("! Section name didn't end"); break;
@.Section name didn't end@&gt;
  }
  if (ccode[(eight_bits)c]==section_name) {
    err_print("! Nesting of section names not allowed"); break;
@.Nesting of section names...@&gt;
  }
  *(++k)='@@'; loc++; /* now |c==*loc| again */
}
</t>
<t tx="ekr.20050502102905.122">@ At the present point in the program we have |*(loc-1)==string|; we set |id_first| to the beginning of the string itself, and |id_loc| to its ending-plus-one location in the buffer.  We also set |loc| to the position just after the ending delimiter.

@&lt;Scan a verbatim string@&gt;= {
  id_first=loc++; *(limit+1)='@@'; *(limit+2)='&gt;';
  while (*loc!='@@' || *(loc+1)!='&gt;') loc++;
  if (loc&gt;=limit) err_print("! Verbatim string didn't end");
@.Verbatim string didn't end@&gt;
  id_loc=loc; loc+=2;
  return(string);
}
</t>
<t tx="ekr.20050502102905.123">@ Section names are placed into the |section_text| array with consecutive spaces, tabs, and carriage-returns replaced by single spaces. There will be no spaces at the beginning or the end. (We set |section_text[0]=' '| to facilitate this, since the |section_lookup| routine uses |section_text[1]| as the first character of the name.)

@&lt;Set initial values@&gt;=section_text[0]=' ';
</t>
<t tx="ekr.20050502102905.124">@* Scanning a macro definition. The rules for generating the replacement texts corresponding to macros and \CEE/ texts of a section are almost identical; the only differences are that  \yskip \item{a)}Section names are not allowed in macros; in fact, the appearance of a section name terminates such macros and denotes the name of the current section.  \item{b)}The symbols \.{@

@d} and \.{@@f} and \.{@@c} are not allowed after
section names, while they terminate macro definitions.

\item{c)}Spaces are inserted after right parentheses in macros, because the
ANSI \CEE/ preprocessor sometimes requires it.

\yskip Therefore there is a single procedure |scan_repl| whose parameter
|t| specifies either |macro| or |section_name|. After |scan_repl| has
acted, |cur_text| will point to the replacement text just generated, and
|next_control| will contain the control code that terminated the activity.

@d macro  0
@d app_repl(c)  {if (tok_ptr==tok_mem_end) overflow("token"); *tok_ptr++=c;}

@&lt;Global variables@&gt;=
text_pointer cur_text; /* replacement text formed by |scan_repl| */
eight_bits next_control;</t>
<t tx="ekr.20050502102905.125">@ @c
void
scan_repl(t) /* creates a replacement text */
eight_bits t;
{
  sixteen_bits a; /* the current token */
  if (t==section_name) {@&lt;Insert the line number into |tok_mem|@&gt;;}
  while (1) switch (a=get_next()) {
      @&lt;In cases that |a| is a non-|char| token (|identifier|,
        |section_name|, etc.), either process it and change |a| to a byte
        that should be stored, or |continue| if |a| should be ignored,
        or |goto done| if |a| signals the end of this replacement text@&gt;@;
      case ')': app_repl(a);
        if (t==macro) app_repl(' ');
        break;
      default: app_repl(a); /* store |a| in |tok_mem| */
    }
  done: next_control=(eight_bits) a;
  if (text_ptr&gt;text_info_end) overflow("text");
  cur_text=text_ptr; (++text_ptr)-&gt;tok_start=tok_ptr;
}
</t>
<t tx="ekr.20050502102905.126">@ Here is the code for the line number: first a |sixteen_bits| equal to |0150000|; then the numeric line number; then a pointer to the file name.

@&lt;Insert the line number into |tok_mem|@&gt;=
store_two_bytes(0150000);
if (changing) id_first=change_file_name;
else id_first=cur_file_name;
id_loc=id_first+strlen(id_first);
if (changing) store_two_bytes((sixteen_bits)change_line);
else store_two_bytes((sixteen_bits)cur_line);
{int a=id_lookup(id_first,id_loc,0)-name_dir; app_repl((a / 0400)+0200);
  app_repl(a % 0400);}
</t>
<t tx="ekr.20050502102905.127">@ @&lt;In cases that |a| is...@&gt;=
case identifier: a=id_lookup(id_first,id_loc,0)-name_dir;
  app_repl((a / 0400)+0200);
  app_repl(a % 0400); break;
case section_name: if (t!=section_name) goto done;
  else {
    @&lt;Was an `@@' missed here?@&gt;;
    a=cur_section_name-name_dir;
    app_repl((a / 0400)+0250);
    app_repl(a % 0400);
    @&lt;Insert the line number into |tok_mem|@&gt;; break;
  }
case output_defs_code:
  a=output_defs_flag;
  app_repl((a / 0400)+0200);
  app_repl(a % 0400);
  @&lt;Insert the line number into |tok_mem|@&gt;; break;
case constant: case string:
  @&lt;Copy a string or verbatim construction or numerical constant@&gt;;
case ord:
  @&lt;Copy an ASCII constant@&gt;;
case definition: case format_code: case begin_C: if (t!=section_name) goto done;
  else {
    err_print("! @@d, @@f and @@c are ignored in C text"); continue;
@.@@d, @@f and @@c are ignored in C text@&gt;
  }
case new_section: goto done;
</t>
<t tx="ekr.20050502102905.128">@ @&lt;Was an `@@'...@&gt;= {
  char *try_loc=loc;
  while (*try_loc==' ' &amp;&amp; try_loc&lt;limit) try_loc++;
  if (*try_loc=='+' &amp;&amp; try_loc&lt;limit) try_loc++;
  while (*try_loc==' ' &amp;&amp; try_loc&lt;limit) try_loc++;
  if (*try_loc=='=') err_print ("! Missing `@@ ' before a named section");
@.Missing `@@ '...@&gt;
  /* user who isn't defining a section should put newline after the name,
     as explained in the manual */
}
</t>
<t tx="ekr.20050502102905.129">@ @&lt;Copy a string...@&gt;=
  app_repl(a); /* |string| or |constant| */
  while (id_first &lt; id_loc) { /* simplify \.{@@@@} pairs */
    if (*id_first=='@@') {
      if (*(id_first+1)=='@@') id_first++;
      else err_print("! Double @@ should be used in string");
@.Double @@ should be used...@&gt;
    }
    app_repl(*id_first++);
  }
  app_repl(a); break;
</t>
<t tx="ekr.20050502102905.13">@ Now comes the problem of deciding which file to read from next. Recall that the actual text that \.{CWEB} should process comes from two streams: a |web_file|, which can contain possibly nested include commands \.{@@i}, and a |change_file|, which might also contain includes.  The |web_file| together with the currently open include files form a stack |file|, whose names are stored in a parallel stack |file_name|.  The boolean |changing| tells whether or not we're reading from the |change_file|.  The line number of each open file is also kept for error reporting and for the benefit of \.{CTANGLE}.

@f line x /* make |line| an unreserved word */
@d max_include_depth 10 /* maximum number of source files open
  simultaneously, not counting the change file */
</t>
<t tx="ekr.20050502102905.130">@ This section should be rewritten on machines that don't use ASCII code internally. @^ASCII code dependencies@&gt;

@&lt;Copy an ASCII constant@&gt;= {
  int c=(eight_bits) *id_first;
  if (c=='\\') {
    c=*++id_first;
    if (c&gt;='0' &amp;&amp; c&lt;='7') {
      c-='0';
      if (*(id_first+1)&gt;='0' &amp;&amp; *(id_first+1)&lt;='7') {
        c=8*c+*(++id_first) - '0';
        if (*(id_first+1)&gt;='0' &amp;&amp; *(id_first+1)&lt;='7' &amp;&amp; c&lt;32)
          c=8*c+*(++id_first)- '0';
      }
    }
    else switch (c) {
    case 't':c='\t';@+break;
    case 'n':c='\n';@+break;
    case 'b':c='\b';@+break;
    case 'f':c='\f';@+break;
    case 'v':c='\v';@+break;
    case 'r':c='\r';@+break;
    case 'a':c='\7';@+break;
    case '?':c='?';@+break;
    case 'x':
      if (xisdigit(*(id_first+1))) c=*(++id_first)-'0';
      else if (xisxdigit(*(id_first+1))) {
        ++id_first;
        c=toupper(*id_first)-'A'+10;
      }
      if (xisdigit(*(id_first+1))) c=16*c+*(++id_first)-'0';
      else if (xisxdigit(*(id_first+1))) {
        ++id_first;
        c=16*c+toupper(*id_first)-'A'+10;
      }
      break;
    case '\\':c='\\';@+break;
    case '\'':c='\'';@+break;
    case '\"':c='\"';@+break;
    default: err_print("! Unrecognized escape sequence");
@.Unrecognized escape sequence@&gt;
    }
  }@/
  /* at this point |c| should have been converted to its ASCII code number */
  app_repl(constant);
  if (c&gt;=100) app_repl('0'+c/100);
  if (c&gt;=10) app_repl('0'+(c/10)%10);
  app_repl('0'+c%10);
  app_repl(constant);
}
break;
</t>
<t tx="ekr.20050502102905.131">@* Scanning a section. The |scan_section| procedure starts when `\.{@@\ }' or `\.{@

@*}' has been sensed in the input, and it proceeds until the end of that section.  It uses |section_count| to keep track of the current section number; with luck, \.{CWEAVE} and \.{CTANGLE} will both assign the same numbers to sections.

@&lt;Global variables@&gt;=
extern sixteen_bits section_count; /* the current section number */</t>
<t tx="ekr.20050502102905.132">@ The body of |scan_section| is a loop where we look for control codes that are significant to \.{CTANGLE}: those that delimit a definition, the \CEE/ part of a module, or a new module.

@c
void
scan_section()
{
  name_pointer p; /* section name for the current section */
  text_pointer q; /* text for the current section */
  sixteen_bits a; /* token for left-hand side of definition */
  section_count++; @+ no_where=1;
  if (*(loc-1)=='*' &amp;&amp; show_progress) { /* starred section */
    printf("*%d",section_count); update_terminal;
  }
  next_control=0;
  while (1) {
    @&lt;Skip ahead until |next_control| corresponds to \.{@@d}, \.{@@&lt;},
      \.{@@\ } or the like@&gt;;
    if (next_control == definition) {  /* \.{@@d} */
        @&lt;Scan a definition@&gt;@;
        continue;
    }
    if (next_control == begin_C) {  /* \.{@@c} or \.{@@p} */
      p=name_dir; break;
    }
    if (next_control == section_name) { /* \.{@@&lt;} or \.{@@(} */
      p=cur_section_name;
      @&lt;If section is not being defined, |continue| @&gt;;
      break;
    }
    return; /* \.{@@\ } or \.{@@*} */
  }
  no_where=print_where=0;
  @&lt;Scan the \CEE/ part of the current section@&gt;;
}</t>
<t tx="ekr.20050502102905.133">@ At the top of this loop, if |next_control==section_name|, the section name has already been scanned (see |

@&lt;Get control code
and...@&gt;|).  Thus, if we encounter |next_control==section_name| in the
skip-ahead process, we should likewise scan the section name, so later
processing will be the same in both cases.

@&lt;Skip ahead until |next_control| ...@&gt;=
while (next_control&lt;definition)
      /* |definition| is the lowest of the ``significant'' codes */
  if((next_control=skip_ahead())==section_name){
    loc-=2; next_control=get_next();
  }
</t>
<t tx="ekr.20050502102905.134">@ @&lt;Scan a definition@&gt;= {
  while ((next_control=get_next())=='\n'); /*allow newline before definition */
  if (next_control!=identifier) {
    err_print("! Definition flushed, must start with identifier");
@.Definition flushed...@&gt;
    continue;
  }
  app_repl(((a=id_lookup(id_first,id_loc,0)-name_dir) / 0400)+0200);
        /* append the lhs */
  app_repl(a % 0400);
  if (*loc!='(') { /* identifier must be separated from replacement text */
    app_repl(string); app_repl(' '); app_repl(string);
  }
  scan_repl(macro);
  cur_text-&gt;text_link=0; /* |text_link==0| characterizes a macro */
}
</t>
<t tx="ekr.20050502102905.135">@ If the section name is not followed by \.{=} or \.{+=}, no \CEE/ code is forthcoming: the section is being cited, not being defined.  This use is illegal after the definition part of the current section has started, except inside a comment, but \.{CTANGLE} does not enforce this rule; it simply ignores the offending section name and everything following it, up to the next significant control code.

@&lt;If section is not being defined, |continue|@&gt;=
while ((next_control=get_next())=='+'); /* allow optional \.{+=} */
if (next_control!='=' &amp;&amp; next_control!=eq_eq)
  continue;
</t>
<t tx="ekr.20050502102905.136">@ @&lt;Scan the \CEE/...@&gt;=
@&lt;Insert the section number into |tok_mem|@&gt;;
scan_repl(section_name); /* now |cur_text| points to the replacement text */
@&lt;Update the data structure so that the replacement text is accessible@&gt;;
</t>
<t tx="ekr.20050502102905.137">@ @&lt;Insert the section number...@&gt;=
store_two_bytes((sixteen_bits)(0150000+section_count));
  /* |0150000==0320*0400| */
</t>
<t tx="ekr.20050502102905.138">@ @&lt;Update the data...@&gt;=
if (p==name_dir||p==0) { /* unnamed section, or bad section name */
  (last_unnamed)-&gt;text_link=cur_text-text_info; last_unnamed=cur_text;
}
else if (p-&gt;equiv==(char *)text_info) p-&gt;equiv=(char *)cur_text;
  /* first section of this name */
else {
  q=(text_pointer)p-&gt;equiv;
  while (q-&gt;text_link&lt;section_flag)
    q=q-&gt;text_link+text_info; /* find end of list */
  q-&gt;text_link=cur_text-text_info;
}
cur_text-&gt;text_link=section_flag;
  /* mark this replacement text as a nonmacro */
</t>
<t tx="ekr.20050502102905.139">@ @&lt;Predec...@&gt;=
void phase_one();

@ @c
void
phase_one() {
  phase=1;
  section_count=0;
  reset_input();
  skip_limbo();
  while (!input_has_ended) scan_section();
  check_complete();
  phase=2;
}
</t>
<t tx="ekr.20050502102905.14">@d max_file_name_length 60
@d cur_file file[include_depth] /* current file */
@d cur_file_name file_name[include_depth] /* current file name */
@d cur_line line[include_depth] /* number of current line in current file */
@d web_file file[0] /* main source file */
@d web_file_name file_name[0] /* main source file name */

@&lt;Definitions that should agree with \.{CTANGLE} and \.{CWEAVE}@&gt;=
int include_depth; /* current level of nesting */
FILE *file[max_include_depth]; /* stack of non-change files */
FILE *change_file; /* change file */
char file_name[max_include_depth][max_file_name_length];
  /* stack of non-change file names */
char change_file_name[max_file_name_length]; /* name of change file */
char alt_web_file_name[max_file_name_length]; /* alternate name to try */
int line[max_include_depth]; /* number of current line in the stacked files */
int change_line; /* number of current line in change file */
int change_depth; /* where \.{@@y} originated during a change */
boolean input_has_ended; /* if there is no more input */
boolean changing; /* if the current line is from |change_file| */
boolean web_file_open=0; /* if the web file is being read */</t>
<t tx="ekr.20050502102905.140">@ Only a small subset of the control codes is legal in limbo, so limbo processing is straightforward.

@&lt;Predeclaration of procedures@&gt;=
void skip_limbo();

@ @c
void
skip_limbo()
{
  char c;
  while (1) {
    if (loc&gt;limit &amp;&amp; get_line()==0) return;
    *(limit+1)='@@';
    while (*loc!='@@') loc++;
    if (loc++&lt;=limit) {
      c=*loc++;
      if (ccode[(eight_bits)c]==new_section) break;
      switch (ccode[(eight_bits)c]) {
        case translit_code: @&lt;Read in transliteration of a character@&gt;; break;
        case format_code: case '@@': break;
        case control_text: if (c=='q' || c=='Q') {
          while ((c=skip_ahead())=='@@');
          if (*(loc-1)!='&gt;')
            err_print("! Double @@ should be used in control text");
@.Double @@ should be used...@&gt;
          break;
          } /* otherwise fall through */
        default: err_print("! Double @@ should be used in limbo");
@.Double @@ should be used...@&gt;
      }
    }
  }
}
</t>
<t tx="ekr.20050502102905.141">@ @&lt;Read in transliteration of a character@&gt;=
  while(xisspace(*loc)&amp;&amp;loc&lt;limit) loc++;
  loc+=3;
  if (loc&gt;limit || !xisxdigit(*(loc-3)) || !xisxdigit(*(loc-2)) @|
         || (*(loc-3)&gt;='0' &amp;&amp; *(loc-3)&lt;='7') || !xisspace(*(loc-1)))
    err_print("! Improper hex number following @@l");
@.Improper hex number...@&gt;
  else {
    unsigned i;
    char *beg;
    sscanf(loc-3,"%x",&amp;i);
    while(xisspace(*loc)&amp;&amp;loc&lt;limit) loc++;
    beg=loc;
    while(loc&lt;limit&amp;&amp;(xisalpha(*loc)||xisdigit(*loc)||*loc=='_')) loc++;
    if (loc-beg&gt;=translit_length)
      err_print("! Replacement string in @@l too long");
@.Replacement string in @@l...@&gt;
    else{
      strncpy(translit[i-0200],beg,loc-beg);
      translit[i-0200][loc-beg]='\0';
    }
  }
</t>
<t tx="ekr.20050502102905.142">@ Because on some systems the difference between two pointers is a |long| but not an |int|, we use \.{\%ld} to print these quantities.

@c
void
print_stats() {
  printf("\nMemory usage statistics:\n");
  printf("%ld names (out of %ld)\n",
          (long)(name_ptr-name_dir),(long)max_names);
  printf("%ld replacement texts (out of %ld)\n",
          (long)(text_ptr-text_info),(long)max_texts);
  printf("%ld bytes (out of %ld)\n",
          (long)(byte_ptr-byte_mem),(long)max_bytes);
  printf("%ld tokens (out of %ld)\n",
          (long)(tok_ptr-tok_mem),(long)max_toks);
}</t>
<t tx="ekr.20050502102905.143">@** Index.
Here is a cross-reference table for \.{CTANGLE}.
All sections in which an identifier is
used are listed with that identifier, except that reserved words are
indexed only when they appear in format definitions, and the appearances
of identifiers in section names are not indexed. Underlined entries
correspond to where the identifier was declared. Error messages and
a few other things like ``ASCII code dependencies'' are indexed here too.</t>
<t tx="ekr.20050502102905.144">@language cweb
@ignore
@others</t>
<t tx="ekr.20050502102905.145">@ % This file is part of CWEB.
% This program by Silvio Levy and Donald E. Knuth
% is based on a program by Knuth.
% It is distributed WITHOUT ANY WARRANTY, express or implied.
% Version 3.61 --- July 2000
% (essentially the same as version 3.6, which added
%  recently introduced features of standard C++ to version 3.4)

% Copyright (C) 1987,1990,1993,2000 Silvio Levy and Donald E. Knuth

% Permission is granted to make and distribute verbatim copies of this
% document provided that the copyright notice and this permission notice
% are preserved on all copies.

% Permission is granted to copy and distribute modified versions of this
% document under the conditions for verbatim copying, provided that the
% entire resulting derived work is given a different name and distributed
% under the terms of a permission notice identical to this one.

% Here is TeX material that gets inserted after \input cwebmac
\def\hang{\hangindent 3em\indent\ignorespaces}
\def\pb{$\.|\ldots\.|$} % C brackets (|...|)
\def\v{\char'174} % vertical (|) in typewriter font
\def\dleft{[\![} \def\dright{]\!]} % double brackets
\mathchardef\RA="3221 % right arrow
\mathchardef\BA="3224 % double arrow
\def\({} % ) kludge for alphabetizing certain section names
\def\TeXxstring{\\{\TEX/\_string}}
\def\skipxTeX{\\{skip\_\TEX/}}
\def\copyxTeX{\\{copy\_\TEX/}}

\def\title{CWEAVE (Version 3.61)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The {\ttitlefont CWEAVE} processor}
  \vskip 15pt
  \centerline{(Version 3.61)}
  \vfill}
\def\botofcontents{\vfill
\noindent
Copyright \copyright\ 1987, 1990, 1993, 2000 Silvio Levy and Donald E. Knuth
\bigskip\noindent
Permission is granted to make and distribute verbatim copies of this
document provided that the copyright notice and this permission notice
are preserved on all copies.

\smallskip\noindent
Permission is granted to copy and distribute modified versions of this
document under the conditions for verbatim copying, provided that the
entire resulting derived work is given a different name and distributed
under the terms of a permission notice identical to this one.
}
\pageno=\contentspagenumber \advance\pageno by 1
\let\maybe=\iftrue
@s not_eq normal @q unreserve a C++ keyword @&gt;</t>
<t tx="ekr.20050502102905.146">@** Introduction. This is the \.{CWEAVE} program by Silvio Levy and Donald E. Knuth, based on \.{WEAVE} by Knuth. We are thankful to Steve Avery, Nelson Beebe, Hans-Hermann Bode (to whom the original \CPLUSPLUS/ adaptation is due), Klaus Guntermann, Norman Ramsey, Tomas Rokicki, Joachim Schnitter, Joachim Schrod, Lee Wittenberg, Saroj Mahapatra, Cesar Augusto Rorato Crusius, and others who have contributed improvements.  The ``banner line'' defined here should be changed whenever \.{CWEAVE} is modified.

@d banner "This is CWEAVE (Version 3.61)\n"

@c @&lt;Include files@&gt;@/
@h
@&lt;Common code for \.{CWEAVE} and \.{CTANGLE}@&gt;@/
@&lt;Typedef declarations@&gt;@/
@&lt;Global variables@&gt;@/
@&lt;Predeclaration of procedures@&gt;
</t>
<t tx="ekr.20050502102905.147">@ We predeclare several standard system functions here instead of including their system header files, because the names of the header files are not as standard as the names of the functions. (For example, some \CEE/ environments have \.{&lt;string.h&gt;} where others have \.{&lt;strings.h&gt;}.)

@&lt;Predeclaration of procedures@&gt;=
extern int strlen(); /* length of string */
extern int strcmp(); /* compare strings lexicographically */
extern char* strcpy(); /* copy one string to another */
extern int strncmp(); /* compare up to $n$ string characters */
extern char* strncpy(); /* copy up to $n$ string characters */
</t>
<t tx="ekr.20050502102905.148">@ \.{CWEAVE} has a fairly straightforward outline.  It operates in three phases: First it inputs the source file and stores cross-reference data, then it inputs the source once again and produces the \TEX/ output file, finally it sorts and outputs the index.  Please read the documentation for \.{common}, the set of routines common to \.{CTANGLE} and \.{CWEAVE}, before proceeding further.

@c
int main (ac, av)
int ac; /* argument count */
char **av; /* argument values */
{
  argc=ac; argv=av;
  program=cweave;
  make_xrefs=force_lines=1; /* controlled by command-line options */
  common_init();
  @&lt;Set initial values@&gt;;
  if (show_banner) printf(banner); /* print a ``banner line'' */
  @&lt;Store all the reserved words@&gt;;
  phase_one(); /* read all the user's text and store the cross-references */
  phase_two(); /* read all the text again and translate it to \TEX/ form */
  phase_three(); /* output the cross-reference index */
  return wrap_up(); /* and exit gracefully */
}</t>
<t tx="ekr.20050502102905.149">@ We have to get \CEE/'s reserved words into the hash table, and the simplest way to do this is to insert them every time \.{CWEAVE} is run.  Fortunately there are relatively few reserved words. (Some of these are not strictly ``reserved,'' but are defined in header files of the ISO Standard \CEE/ Library.) @^reserved words@&gt;

@&lt;Store all the reserved words@&gt;=
id_lookup("and",NULL,alfop);
id_lookup("and_eq",NULL,alfop);
id_lookup("asm",NULL,sizeof_like);
id_lookup("auto",NULL,int_like);
id_lookup("bitand",NULL,alfop);
id_lookup("bitor",NULL,alfop);
id_lookup("bool",NULL,raw_int);
id_lookup("break",NULL,case_like);
id_lookup("case",NULL,case_like);
id_lookup("catch",NULL,catch_like);
id_lookup("char",NULL,raw_int);
id_lookup("class",NULL,struct_like);
id_lookup("clock_t",NULL,raw_int);
id_lookup("compl",NULL,alfop);
id_lookup("const",NULL,const_like);
id_lookup("const_cast",NULL,raw_int);
id_lookup("continue",NULL,case_like);
id_lookup("default",NULL,case_like);
id_lookup("define",NULL,define_like);
id_lookup("defined",NULL,sizeof_like);
id_lookup("delete",NULL,delete_like);
id_lookup("div_t",NULL,raw_int);
id_lookup("do",NULL,do_like);
id_lookup("double",NULL,raw_int);
id_lookup("dynamic_cast",NULL,raw_int);
id_lookup("elif",NULL,if_like);
id_lookup("else",NULL,else_like);
id_lookup("endif",NULL,if_like);
id_lookup("enum",NULL,struct_like);
id_lookup("error",NULL,if_like);
id_lookup("explicit",NULL,int_like);
id_lookup("export",NULL,int_like);
id_lookup("extern",NULL,int_like);
id_lookup("FILE",NULL,raw_int);
id_lookup("float",NULL,raw_int);
id_lookup("for",NULL,for_like);
id_lookup("fpos_t",NULL,raw_int);
id_lookup("friend",NULL,int_like);
id_lookup("goto",NULL,case_like);
id_lookup("if",NULL,if_like);
id_lookup("ifdef",NULL,if_like);
id_lookup("ifndef",NULL,if_like);
id_lookup("include",NULL,if_like);
id_lookup("inline",NULL,int_like);
id_lookup("int",NULL,raw_int);
id_lookup("jmp_buf",NULL,raw_int);
id_lookup("ldiv_t",NULL,raw_int);
id_lookup("line",NULL,if_like);
id_lookup("long",NULL,raw_int);
id_lookup("mutable",NULL,int_like);
id_lookup("namespace",NULL,struct_like);
id_lookup("new",NULL,new_like);
id_lookup("not",NULL,alfop);
id_lookup("not_eq",NULL,alfop);
id_lookup("NULL",NULL,custom);
id_lookup("offsetof",NULL,raw_int);
id_lookup("operator",NULL,operator_like);
id_lookup("or",NULL,alfop);
id_lookup("or_eq",NULL,alfop);
id_lookup("pragma",NULL,if_like);
id_lookup("private",NULL,public_like);
id_lookup("protected",NULL,public_like);
id_lookup("ptrdiff_t",NULL,raw_int);
id_lookup("public",NULL,public_like);
id_lookup("register",NULL,int_like);
id_lookup("reinterpret_cast",NULL,raw_int);
id_lookup("return",NULL,case_like);
id_lookup("short",NULL,raw_int);
id_lookup("sig_atomic_t",NULL,raw_int);
id_lookup("signed",NULL,raw_int);
id_lookup("size_t",NULL,raw_int);
id_lookup("sizeof",NULL,sizeof_like);
id_lookup("static",NULL,int_like);
id_lookup("static_cast",NULL,raw_int);
id_lookup("struct",NULL,struct_like);
id_lookup("switch",NULL,for_like);
id_lookup("template",NULL,template_like);
id_lookup("this",NULL,custom);
id_lookup("throw",NULL,case_like);
id_lookup("time_t",NULL,raw_int);
id_lookup("try",NULL,else_like);
id_lookup("typedef",NULL,typedef_like);
id_lookup("typeid",NULL,raw_int);
id_lookup("typename",NULL,struct_like);
id_lookup("undef",NULL,if_like);
id_lookup("union",NULL,struct_like);
id_lookup("unsigned",NULL,raw_int);
id_lookup("using",NULL,int_like);
id_lookup("va_dcl",NULL,decl); /* Berkeley's variable-arg-list convention */
id_lookup("va_list",NULL,raw_int); /* ditto */
id_lookup("virtual",NULL,int_like);
id_lookup("void",NULL,raw_int);
id_lookup("volatile",NULL,const_like);
id_lookup("wchar_t",NULL,raw_int);
id_lookup("while",NULL,for_like);
id_lookup("xor",NULL,alfop);
id_lookup("xor_eq",NULL,alfop);
res_wd_end=name_ptr;
id_lookup("TeX",NULL,custom);
id_lookup("make_pair",NULL,func_template);
</t>
<t tx="ekr.20050502102905.15">@ When |changing==0|, the next line of |change_file| is kept in |change_buffer|, for purposes of comparison with the next line of |cur_file|. After the change file has been completely input, we set |change_limit=change_buffer|, so that no further matches will be made.  Here's a shorthand expression for inequality between the two lines:

@d lines_dont_match (change_limit-change_buffer != limit-buffer ||
  strncmp(buffer, change_buffer, limit-buffer))

@&lt;Other definitions@&gt;=
char change_buffer[buf_size]; /* next line of |change_file| */
char *change_limit; /* points to the last character in |change_buffer| */

@ Procedure |prime_the_change_buffer| sets |change_buffer| in preparation for the next matching operation. Since blank lines in the change file are not used for matching, we have |(change_limit==change_buffer &amp;&amp; !changing)| if and only if the change file is exhausted. This procedure is called only when |changing| is 1; hence error messages will be reported correctly.

@c
void
prime_the_change_buffer()
{
  change_limit=change_buffer; /* this value is used if the change file ends */
  @&lt;Skip over comment lines in the change file; |return| if end of file@&gt;;
  @&lt;Skip to the next nonblank line; |return| if end of file@&gt;;
  @&lt;Move |buffer| and |limit| to |change_buffer| and |change_limit|@&gt;;
}</t>
<t tx="ekr.20050502102905.150"></t>
<t tx="ekr.20050502102905.151">@ The following parameters were sufficient in the original \.{WEAVE} to handle \TEX/, so they should be sufficient for most applications of \.{CWEAVE}. If you change |max_bytes|, |max_names|, |hash_size|, or |buf_size| you have to change them also in the file |"common.w"|.

@d max_bytes 90000 /* the number of bytes in identifiers,
  index entries, and section names */
@d max_names 4000 /* number of identifiers, strings, section names;
  must be less than 10240; used in |"common.w"| */
@d max_sections 2000 /* greater than the total number of sections */
@d hash_size 353 /* should be prime */
@d buf_size 100 /* maximum length of input line, plus one */
@d longest_name 10000 /* section names and strings shouldn't be longer than this */
@d long_buf_size (buf_size+longest_name)
@d line_length 80 /* lines of \TEX/ output have at most this many characters;
  should be less than 256 */
@d max_refs 20000 /* number of cross-references; must be less than 65536 */
@d max_toks 20000 /* number of symbols in \CEE/ texts being parsed;
  must be less than 65536 */
@d max_texts 4000 /* number of phrases in \CEE/ texts being parsed;
  must be less than 10240 */
@d max_scraps 2000 /* number of tokens in \CEE/ texts being parsed */
@d stack_size 400 /* number of simultaneous output levels */

@ The next few sections contain stuff from the file |"common.w"| that must
be included in both |"ctangle.w"| and |"cweave.w"|. It appears in
file |"common.h"|, which needs to be updated when |"common.w"| changes.

@i common.h</t>
<t tx="ekr.20050502102905.152">@* Data structures exclusive to {\tt CWEAVE}. As explained in \.{common.w}, the field of a |name_info| structure that contains the |rlink| of a section name is used for a completely different purpose in the case of identifiers.  It is then called the |ilk| of the identifier, and it is used to distinguish between various types of identifiers, as follows:  \yskip\hang |normal| and |func_template| identifiers are part of the \CEE/ program that will  appear in italic type (or in typewriter type if all uppercase).  \yskip\hang |custom| identifiers are part of the \CEE/ program that will be typeset in special ways.  \yskip\hang |roman| identifiers are index entries that appear after \.{@@\^} in the \.{CWEB} file.  \yskip\hang |wildcard| identifiers are index entries that appear after \.{@@:} in the \.{CWEB} file.  \yskip\hang |typewriter| identifiers are index entries that appear after \.{@@.} in the \.{CWEB} file.  \yskip\hang |alfop|, \dots, |template_like| identifiers are \CEE/ or \CPLUSPLUS/ reserved words whose |ilk| explains how they are to be treated when \CEE/ code is being formatted.

@d ilk dummy.Ilk
@d normal 0 /* ordinary identifiers have |normal| ilk */
@d roman 1 /* normal index entries have |roman| ilk */
@d wildcard 2 /* user-formatted index entries have |wildcard| ilk */
@d typewriter 3 /* `typewriter type' entries have |typewriter| ilk */
@d abnormal(a) (a-&gt;ilk&gt;typewriter) /* tells if a name is special */
@d func_template 4 /* identifiers that can be followed by optional template */
@d custom 5 /* identifiers with user-given control sequence */
@d alfop 22 /* alphabetic operators like \&amp;{and} or \&amp;{not\_eq} */
@d else_like 26 /* \&amp;{else} */
@d public_like 40 /* \&amp;{public}, \&amp;{private}, \&amp;{protected} */
@d operator_like 41 /* \&amp;{operator} */
@d new_like 42 /* \&amp;{new} */
@d catch_like 43 /* \&amp;{catch} */
@d for_like 45 /* \&amp;{for}, \&amp;{switch}, \&amp;{while} */
@d do_like 46 /* \&amp;{do} */
@d if_like 47 /* \&amp;{if}, \&amp;{ifdef}, \&amp;{endif}, \&amp;{pragma}, \dots */
@d delete_like 48 /* \&amp;{delete} */
@d raw_ubin 49 /* `\.\&amp;' or `\.*' when looking for \&amp;{const} following */
@d const_like 50 /* \&amp;{const}, \&amp;{volatile} */
@d raw_int 51 /* \&amp;{int}, \&amp;{char}, \dots; also structure and class names  */
@d int_like 52 /* same, when not followed by left parenthesis or \DC\ */
@d case_like 53 /* \&amp;{case}, \&amp;{return}, \&amp;{goto}, \&amp;{break}, \&amp;{continue} */
@d sizeof_like 54 /* \&amp;{sizeof} */
@d struct_like 55 /* \&amp;{struct}, \&amp;{union}, \&amp;{enum}, \&amp;{class} */
@d typedef_like 56 /* \&amp;{typedef} */
@d define_like 57 /* \&amp;{define} */
@d template_like 58 /* \&amp;{template} */
</t>
<t tx="ekr.20050502102905.153">@ We keep track of the current section number in |section_count|, which is the total number of sections that have started.  Sections which have been altered by a change file entry have their |changed_section| flag turned on during the first phase.

@&lt;Global variables@&gt;=
boolean change_exists; /* has any section changed? */

@ The other large memory area in \.{CWEAVE} keeps the cross-reference data. All uses of the name |p| are recorded in a linked list beginning at |p-&gt;xref|, which points into the |xmem| array. The elements of |xmem| are structures consisting of an integer, |num|, and a pointer |xlink| to another element of |xmem|.  If |x=p-&gt;xref| is a pointer into |xmem|, the value of |x-&gt;num| is either a section number where |p| is used, or |cite_flag| plus a section number where |p| is mentioned, or |def_flag| plus a section number where |p| is defined; and |x-&gt;xlink| points to the next such cross-reference for |p|, if any. This list of cross-references is in decreasing order by section number. The next unused slot in |xmem| is |xref_ptr|. The linked list ends at |&amp;xmem[0]|.  The global variable |xref_switch| is set either to |def_flag| or to zero, depending on whether the next cross-reference to an identifier is to be underlined or not in the index. This switch is set to |def_flag| when \.{@@!} or \.{@

@d} is scanned, and it is cleared to zero when
the next identifier or index entry cross-reference has been made.
Similarly, the global variable |section_xref_switch| is either
|def_flag| or |cite_flag| or zero, depending
on whether a section name is being defined, cited or used in \CEE/ text.

@&lt;Typedef declarations@&gt;=
typedef struct xref_info {
  sixteen_bits num; /* section number plus zero or |def_flag| */
  struct xref_info *xlink; /* pointer to the previous cross-reference */
} xref_info;
typedef xref_info *xref_pointer;

@ @&lt;Global...@&gt;=
xref_info xmem[max_refs]; /* contains cross-reference information */
xref_pointer xmem_end = xmem+max_refs-1;
xref_pointer xref_ptr; /* the largest occupied position in |xmem| */
sixteen_bits xref_switch,section_xref_switch; /* either zero or |def_flag| */

@ A section that is used for multi-file output (with the \.{@@(} feature) has a special first cross-reference whose |num| field is |file_flag|.

@d file_flag (3*cite_flag)
@d def_flag (2*cite_flag)
@d cite_flag 10240 /* must be strictly larger than |max_sections| */
@d xref equiv_or_xref

@&lt;Set initial values@&gt;=
xref_ptr=xmem; name_dir-&gt;xref=(char*)xmem; xref_switch=0; section_xref_switch=0;
xmem-&gt;num=0; /* sentinel value */</t>
<t tx="ekr.20050502102905.154">@ A new cross-reference for an identifier is formed by calling |new_xref|, which discards duplicate entries and ignores non-underlined references to one-letter identifiers or \CEE/'s reserved words.  If the user has sent the |no_xref| flag (the \.{-x} option of the command line), it is unnecessary to keep track of cross-references for identifiers. If one were careful, one could probably make more changes around section 100 to avoid a lot of identifier looking up.

@d append_xref(c) if (xref_ptr==xmem_end) overflow("cross-reference");
  else (++xref_ptr)-&gt;num=c;
@d no_xref (flags['x']==0)
@d make_xrefs flags['x'] /* should cross references be output? */
@d is_tiny(p) ((p+1)-&gt;byte_start==(p)-&gt;byte_start+1)
@d unindexed(a) (a&lt;res_wd_end &amp;&amp; a-&gt;ilk&gt;=custom)
      /* tells if uses of a name are to be indexed */

@c
void
new_xref(p)
name_pointer p;
{
  xref_pointer q; /* pointer to previous cross-reference */
  sixteen_bits m, n; /* new and previous cross-reference value */
  if (no_xref) return;
  if ((unindexed(p) || is_tiny(p)) &amp;&amp; xref_switch==0) return;
  m=section_count+xref_switch; xref_switch=0; q=(xref_pointer)p-&gt;xref;
  if (q != xmem) {
    n=q-&gt;num;
    if (n==m || n==m+def_flag) return;
    else if (m==n+def_flag) {
        q-&gt;num=m; return;
    }
  }
  append_xref(m); xref_ptr-&gt;xlink=q; p-&gt;xref=(char*)xref_ptr;
}</t>
<t tx="ekr.20050502102905.155">@ The cross-reference lists for section names are slightly different. Suppose that a section name is defined in sections $m_1$, \dots, $m_k$, cited in sections $n_1$, \dots, $n_l$, and used in sections $p_1$, \dots, $p_j$.  Then its list will contain $m_1+|def_flag|$, \dots, $m_k+|def_flag|$, $n_1+|cite_flag|$, \dots, $n_l+|cite_flag|$, $p_1$, \dots, $p_j$, in this order.  Although this method of storage takes quadratic time with respect to the length of the list, under foreseeable uses of \.{CWEAVE} this inefficiency is insignificant.

@c
void
new_section_xref(p)
name_pointer p;
{
  xref_pointer q,r; /* pointers to previous cross-references */
  q=(xref_pointer)p-&gt;xref; r=xmem;
  if (q&gt;xmem)
        while (q-&gt;num&gt;section_xref_switch) {r=q; q=q-&gt;xlink;}
  if (r-&gt;num==section_count+section_xref_switch)
        return; /* don't duplicate entries */
  append_xref(section_count+section_xref_switch);
  xref_ptr-&gt;xlink=q; section_xref_switch=0;
  if (r==xmem) p-&gt;xref=(char*)xref_ptr;
  else r-&gt;xlink=xref_ptr;
}</t>
<t tx="ekr.20050502102905.156">@ The cross-reference list for a section name may also begin with |file_flag|. Here's how that flag gets put~in.

@c
void
set_file_flag(p)
name_pointer p;
{
  xref_pointer q;
  q=(xref_pointer)p-&gt;xref;
  if (q-&gt;num==file_flag) return;
  append_xref(file_flag);
  xref_ptr-&gt;xlink = q;
  p-&gt;xref = (char *)xref_ptr;
}</t>
<t tx="ekr.20050502102905.157">@ A third large area of memory is used for sixteen-bit `tokens', which appear in short lists similar to the strings of characters in |byte_mem|. Token lists are used to contain the result of \CEE/ code translated into \TEX/ form; further details about them will be explained later. A |text_pointer| variable is an index into |tok_start|.

@&lt;Typedef declarations@&gt;=
typedef sixteen_bits token;
typedef token *token_pointer;
typedef token_pointer *text_pointer;

@ The first position of |tok_mem| that is unoccupied by replacement text is called |tok_ptr|, and the first unused location of |tok_start| is called |text_ptr|. Thus, we usually have |*text_ptr==tok_ptr|.

@&lt;Global variables@&gt;=
token tok_mem[max_toks]; /* tokens */
token_pointer tok_mem_end = tok_mem+max_toks-1; /* end of |tok_mem| */
token_pointer tok_start[max_texts]; /* directory into |tok_mem| */
token_pointer tok_ptr; /* first unused position in |tok_mem| */
text_pointer text_ptr; /* first unused position in |tok_start| */
text_pointer tok_start_end = tok_start+max_texts-1; /* end of |tok_start| */
token_pointer max_tok_ptr; /* largest value of |tok_ptr| */
text_pointer max_text_ptr; /* largest value of |text_ptr| */

@ @&lt;Set init...@&gt;=
tok_ptr=tok_mem+1; text_ptr=tok_start+1; tok_start[0]=tok_mem+1;
tok_start[1]=tok_mem+1;
max_tok_ptr=tok_mem+1; max_text_ptr=tok_start+1;</t>
<t tx="ekr.20050502102905.158">@ Here are the three procedures needed to complete |id_lookup|:

@c
int names_match(p,first,l,t)
name_pointer p; /* points to the proposed match */
char *first; /* position of first character of string */
int l; /* length of identifier */
eight_bits t; /* desired ilk */
{
  if (length(p)!=l) return 0;
  if (p-&gt;ilk!=t &amp;&amp; !(t==normal &amp;&amp; abnormal(p))) return 0;
  return !strncmp(first,p-&gt;byte_start,l);
}

void
init_p(p,t)
name_pointer p;
eight_bits t;
{
  p-&gt;ilk=t; p-&gt;xref=(char*)xmem;
}

void
init_node(p)
name_pointer p;
{
  p-&gt;xref=(char*)xmem;
}</t>
<t tx="ekr.20050502102905.159">@* Lexical scanning. Let us now consider the subroutines that read the \.{CWEB} source file and break it into meaningful units. There are four such procedures: One simply skips to the next `\.{@@\ }' or `\.{@

@*}' that begins a
section; another passes over the \TEX/ text at the beginning of a
section; the third passes over the \TEX/ text in a \CEE/ comment;
and the last, which is the most interesting, gets the next token of
a \CEE/ text.  They all use the pointers |limit| and |loc| into
the line of input currently being studied.</t>
<t tx="ekr.20050502102905.16">@ While looking for a line that begins with \.{@@x} in the change file, we allow lines that begin with \.{@@}, as long as they don't begin with \.{@@y}, \.{@@z}, or \.{@@i} (which would probably mean that the change file is fouled up).

@&lt;Skip over comment lines in the change file; |return| if end of file@&gt;=
while(1) {
  change_line++;
  if (!input_ln(change_file)) return;
  if (limit&lt;buffer+2) continue;
  if (buffer[0]!='@@') continue;
  if (xisupper(buffer[1])) buffer[1]=tolower(buffer[1]);
  if (buffer[1]=='x') break;
  if (buffer[1]=='y' || buffer[1]=='z' || buffer[1]=='i') {
    loc=buffer+2;
    err_print("! Missing @@x in change file");
@.Missing @@x...@&gt;
  }
}
</t>
<t tx="ekr.20050502102905.160">@ Control codes in \.{CWEB}, which begin with `\.{@@}', are converted into a numeric code designed to simplify \.{CWEAVE}'s logic; for example, larger numbers are given to the control codes that denote more significant milestones, and the code of |new_section| should be the largest of all. Some of these numeric control codes take the place of |char| control codes that will not otherwise appear in the output of the scanning routines. @^ASCII code dependencies@&gt;

@d ignore 00 /* control code of no interest to \.{CWEAVE} */
@d verbatim 02 /* takes the place of extended ASCII \.{\char2} */
@d begin_short_comment 03 /* \CPLUSPLUS/ short comment */
@d begin_comment '\t' /* tab marks will not appear */
@d underline '\n' /* this code will be intercepted without confusion */
@d noop 0177 /* takes the place of ASCII delete */
@d xref_roman 0203 /* control code for `\.{@@\^}' */
@d xref_wildcard 0204 /* control code for `\.{@@:}' */
@d xref_typewriter 0205 /* control code for `\.{@@.}' */
@d TeX_string 0206 /* control code for `\.{@@t}' */
@f TeX_string TeX
@d ord 0207 /* control code for `\.{@@'}' */
@d join 0210 /* control code for `\.{@@\&amp;}' */
@d thin_space 0211 /* control code for `\.{@@,}' */
@d math_break 0212 /* control code for `\.{@@\v}' */
@d line_break 0213 /* control code for `\.{@@/}' */
@d big_line_break 0214 /* control code for `\.{@@\#}' */
@d no_line_break 0215 /* control code for `\.{@@+}' */
@d pseudo_semi 0216 /* control code for `\.{@@;}' */
@d macro_arg_open 0220 /* control code for `\.{@@[}' */
@d macro_arg_close 0221 /* control code for `\.{@@]}' */
@d trace 0222 /* control code for `\.{@@0}', `\.{@@1}' and `\.{@@2}' */
@d translit_code 0223 /* control code for `\.{@@l}' */
@d output_defs_code 0224 /* control code for `\.{@@h}' */
@d format_code 0225 /* control code for `\.{@@f}' and `\.{@@s}' */
@d definition 0226 /* control code for `\.{@@d}' */
@d begin_C 0227 /* control code for `\.{@@c}' */
@d section_name 0230 /* control code for `\.{@@&lt;}' */
@d new_section 0231 /* control code for `\.{@@\ }' and `\.{@@*}' */

@ Control codes are converted to \.{CWEAVE}'s internal representation by means of the table |ccode|.

@&lt;Global variables@&gt;=
eight_bits ccode[256]; /* meaning of a char following \.{@@} */

@ @&lt;Set ini...@&gt;=
{int c; for (c=0; c&lt;256; c++) ccode[c]=0;}
ccode[' ']=ccode['\t']=ccode['\n']=ccode['\v']=ccode['\r']=ccode['\f']
   =ccode['*']=new_section;
ccode['@@']='@@'; /* `quoted' at sign */
ccode['=']=verbatim;
ccode['d']=ccode['D']=definition;
ccode['f']=ccode['F']=ccode['s']=ccode['S']=format_code;
ccode['c']=ccode['C']=ccode['p']=ccode['P']=begin_C;
ccode['t']=ccode['T']=TeX_string;
ccode['l']=ccode['L']=translit_code;
ccode['q']=ccode['Q']=noop;
ccode['h']=ccode['H']=output_defs_code;
ccode['&amp;']=join; ccode['&lt;']=ccode['(']=section_name;
ccode['!']=underline; ccode['^']=xref_roman;
ccode[':']=xref_wildcard; ccode['.']=xref_typewriter; ccode[',']=thin_space;
ccode['|']=math_break; ccode['/']=line_break; ccode['#']=big_line_break;
ccode['+']=no_line_break; ccode[';']=pseudo_semi;
ccode['[']=macro_arg_open; ccode[']']=macro_arg_close;
ccode['\'']=ord;
@&lt;Special control codes for debugging@&gt;@;

@ Users can write \.{@@2}, \.{@@1}, and \.{@@0} to turn tracing fully on, partly on, and off, respectively.

@&lt;Special control codes for debugging@&gt;=
ccode['0']=ccode['1']=ccode['2']=trace;
</t>
<t tx="ekr.20050502102905.161">@ The |skip_limbo| routine is used on the first pass to skip through portions of the input that are not in any sections, i.e., that precede the first section. After this procedure has been called, the value of |input_has_ended| will tell whether or not a section has actually been found.  There's a complication that we will postpone until later: If the \.{@@s} operation appears in limbo, we want to use it to adjust the default interpretation of identifiers.

@&lt;Predeclaration of procedures@&gt;=
void skip_limbo();

@ @c
void
skip_limbo() {
  while(1) {
    if (loc&gt;limit &amp;&amp; get_line()==0) return;
    *(limit+1)='@@';
    while (*loc!='@@') loc++; /* look for '@@', then skip two chars */
    if (loc++ &lt;=limit) { int c=ccode[(eight_bits)*loc++];
      if (c==new_section) return;
      if (c==noop) skip_restricted();
      else if (c==format_code) @&lt;Process simple format in limbo@&gt;;
    }
  }
}
</t>
<t tx="ekr.20050502102905.162">@ During the definition and \CEE/ parts of a section, cross-references are made for all identifiers except reserved words. However, the right identifier in a format definition is not referenced, and the left identifier is referenced only if it has been explicitly underlined (preceded by \.{@@!}). The \TEX/ code in comments is, of course, ignored, except for \CEE/ portions enclosed in \pb; the text of a section name is skipped entirely, even if it contains \pb\ constructions.  The variables |lhs| and |rhs| point to the respective identifiers involved in a format definition.

@&lt;Global variables@&gt;=
name_pointer lhs, rhs; /* pointers to |byte_start| for format identifiers */
name_pointer res_wd_end; /* pointer to the first nonreserved identifier */

@ A much simpler processing of format definitions occurs when the definition is found in limbo.

@&lt;Process simple format in limbo@&gt;=
{
  if (get_next()!=identifier)
    err_print("! Missing left identifier of @@s");
@.Missing left identifier...@&gt;
  else {
    lhs=id_lookup(id_first,id_loc,normal);
    if (get_next()!=identifier)
      err_print("! Missing right identifier of @@s");
@.Missing right identifier...@&gt;
    else {
      rhs=id_lookup(id_first,id_loc,normal);
      lhs-&gt;ilk=rhs-&gt;ilk;
    }
  }
}
</t>
<t tx="ekr.20050502102905.163">@ The |skip_TeX| routine is used on the first pass to skip through the \TEX/ code at the beginning of a section. It returns the next control code or `\.{\v}' found in the input. A |new_section| is assumed to exist at the very end of the file.

@f skip_TeX TeX

@c
unsigned
skip_TeX() /* skip past pure \TEX/ code */
{
  while (1) {
    if (loc&gt;limit &amp;&amp; get_line()==0) return(new_section);
    *(limit+1)='@@';
    while (*loc!='@@' &amp;&amp; *loc!='|') loc++;
    if (*loc++ =='|') return('|');
    if (loc&lt;=limit) return(ccode[(eight_bits)*(loc++)]);
  }
}</t>
<t tx="ekr.20050502102905.164">@*1 Inputting the next token. As stated above, \.{CWEAVE}'s most interesting lexical scanning routine is the |get_next| function that inputs the next token of \CEE/ input. However, |get_next| is not especially complicated.  The result of |get_next| is either a |char| code for some special character, or it is a special code representing a pair of characters (e.g., `\.{!=}'), or it is the numeric value computed by the |ccode| table, or it is one of the following special codes:  \yskip\hang |identifier|: In this case the global variables |id_first| and |id_loc| will have been set to the beginning and ending-plus-one locations in the buffer, as required by the |id_lookup| routine.  \yskip\hang |string|: The string will have been copied into the array |section_text|; |id_first| and |id_loc| are set as above (now they are pointers into |section_text|).  \yskip\hang |constant|: The constant is copied into |section_text|, with slight modifications; |id_first| and |id_loc| are set.  \yskip\noindent Furthermore, some of the control codes cause |get_next| to take additional actions:  \yskip\hang |xref_roman|, |xref_wildcard|, |xref_typewriter|, |TeX_string|, |verbatim|: The values of |id_first| and |id_loc| will have been set to the beginning and ending-plus-one locations in the buffer.  \yskip\hang |section_name|: In this case the global variable |cur_section| will point to the |byte_start| entry for the section name that has just been scanned. The value of |cur_section_char| will be |'('| if the section name was preceded by \.{@@(} instead of \.{@

@&lt;}.

\yskip\noindent If |get_next| sees `\.{@@!}'
it sets |xref_switch| to |def_flag| and goes on to the next token.

@d constant 0200 /* \CEE/ constant */
@d string 0201 /* \CEE/ string */
@d identifier 0202 /* \CEE/ identifier or reserved word */

@&lt;Global variables@&gt;=
name_pointer cur_section; /* name of section just scanned */
char cur_section_char; /* the character just before that name */</t>
<t tx="ekr.20050502102905.165">@ @&lt;Include...@&gt;=
#include &lt;ctype.h&gt; /* definition of |isalpha|, |isdigit| and so on */
#include &lt;stdlib.h&gt; /* definition of |exit| */
</t>
<t tx="ekr.20050502102905.166">@ As one might expect, |get_next| consists mostly of a big switch that branches to the various special cases that can arise. \CEE/ allows underscores to appear in identifiers, and some \CEE/ compilers even allow the dollar sign.

@d isxalpha(c) ((c)=='_' || (c)=='$')
   /* non-alpha characters allowed in identifier */
@d ishigh(c) ((eight_bits)(c)&gt;0177)
@^high-bit character handling@&gt;

@&lt;Predeclaration of procedures@&gt;=
eight_bits get_next();
@ @c
eight_bits
get_next() /* produces the next input token */
{@+eight_bits c; /* the current character */
  while (1) {
    @&lt;Check if we're at the end of a preprocessor command@&gt;;
    if (loc&gt;limit &amp;&amp; get_line()==0) return(new_section);
    c=*(loc++);
    if (xisdigit(c) || c=='\\' || c=='.') @&lt;Get a constant@&gt;@;
    else if (c=='\'' || c=='"' || (c=='L'&amp;&amp;(*loc=='\'' || *loc=='"'))@|
           || (c=='&lt;' &amp;&amp; sharp_include_line==1))
        @&lt;Get a string@&gt;@;
    else if (xisalpha(c) || isxalpha(c) || ishigh(c))
      @&lt;Get an identifier@&gt;@;
    else if (c=='@@') @&lt;Get control code and possible section name@&gt;@;
    else if (xisspace(c)) continue; /* ignore spaces and tabs */
    if (c=='#' &amp;&amp; loc==buffer+1) @&lt;Raise preprocessor flag@&gt;;
    mistake: @&lt;Compress two-symbol operator@&gt;@;
    return(c);
  }
}
</t>
<t tx="ekr.20050502102905.167">@ Because preprocessor commands do not fit in with the rest of the syntax of \CEE/, we have to deal with them separately.  One solution is to enclose such commands between special markers.  Thus, when a \.\# is seen as the first character of a line, |get_next| returns a special code |left_preproc| and raises a flag |preprocessing|.  We can use the same internal code number for |left_preproc| as we do for |ord|, since |get_next| changes |ord| into a string.

@d left_preproc ord /* begins a preprocessor command */
@d right_preproc 0217 /* ends a preprocessor command */

@&lt;Global variables@&gt;=
boolean preprocessing=0; /* are we scanning a preprocessor command? */

@ @&lt;Raise prep...@&gt;= {
  preprocessing=1;
  @&lt;Check if next token is |include|@&gt;;
  return (left_preproc);
}
</t>
<t tx="ekr.20050502102905.168">@ An additional complication is the freakish use of \.&lt; and \.&gt; to delimit a file name in lines that start with \.{\#include}.  We must treat this file name as a string.

@&lt;Global variables@&gt;=
boolean sharp_include_line=0; /* are we scanning a |#include| line? */

@ @&lt;Check if next token is |include|@&gt;=
while (loc&lt;=buffer_end-7 &amp;&amp; xisspace(*loc)) loc++;
if (loc&lt;=buffer_end-6 &amp;&amp; strncmp(loc,"include",7)==0) sharp_include_line=1;
</t>
<t tx="ekr.20050502102905.169">@ When we get to the end of a preprocessor line, we lower the flag and send a code |right_preproc|, unless the last character was a \.\\.

@&lt;Check if we're at the end of a preprocessor command@&gt;=
  while (loc==limit-1 &amp;&amp; preprocessing &amp;&amp; *loc=='\\')
    if (get_line()==0) return(new_section); /* still in preprocessor mode */
  if (loc&gt;=limit &amp;&amp; preprocessing) {
    preprocessing=sharp_include_line=0;
    return(right_preproc);
  }
</t>
<t tx="ekr.20050502102905.17">@ Here we are looking at lines following the \.{@@x}.

@&lt;Skip to the next nonblank line; |return| if end of file@&gt;=
do {
  change_line++;
  if (!input_ln(change_file)) {
    err_print("! Change file ended after @@x");
@.Change file ended...@&gt;
    return;
  }
} while (limit==buffer);
</t>
<t tx="ekr.20050502102905.170">@ The following code assigns values to the combinations \.{++}, \.{--}, \.{-&gt;}, \.{&gt;=}, \.{&lt;=}, \.{==}, \.{&lt;&lt;}, \.{&gt;&gt;}, \.{!=}, \.{\v\v}, and \.{\&amp;\&amp;}, and to the \CPLUSPLUS/ combinations \.{...}, \.{::}, \.{.*} and \.{-&gt;*}. The compound assignment operators (e.g., \.{+=}) are treated as separate tokens.

@d compress(c) if (loc++&lt;=limit) return(c)

@&lt;Compress two-symbol operator@&gt;=
switch(c) {
  case '/': if (*loc=='*') {compress(begin_comment);}
    else if (*loc=='/') compress(begin_short_comment); break;
  case '+': if (*loc=='+') compress(plus_plus); break;
  case '-': if (*loc=='-') {compress(minus_minus);}
    else if (*loc=='&gt;') if (*(loc+1)=='*') {loc++; compress(minus_gt_ast);}
                        else compress(minus_gt); break;
  case '.': if (*loc=='*') {compress(period_ast);}
            else if (*loc=='.' &amp;&amp; *(loc+1)=='.') {
              loc++; compress(dot_dot_dot);
            }
            break;
  case ':': if (*loc==':') compress(colon_colon); break;
  case '=': if (*loc=='=') compress(eq_eq); break;
  case '&gt;': if (*loc=='=') {compress(gt_eq);}
    else if (*loc=='&gt;') compress(gt_gt); break;
  case '&lt;': if (*loc=='=') {compress(lt_eq);}
    else if (*loc=='&lt;') compress(lt_lt); break;
  case '&amp;': if (*loc=='&amp;') compress(and_and); break;
  case '|': if (*loc=='|') compress(or_or); break;
  case '!': if (*loc=='=') compress(not_eq); break;
}
</t>
<t tx="ekr.20050502102905.171">@ @&lt;Get an identifier@&gt;= {
  id_first=--loc;
  while (isalpha(*++loc) || isdigit(*loc) || isxalpha(*loc) || ishigh(*loc));
  id_loc=loc; return(identifier);
}
</t>
<t tx="ekr.20050502102905.172">@ Different conventions are followed by \TEX/ and \CEE/ to express octal and hexadecimal numbers; it is reasonable to stick to each convention within its realm.  Thus the \CEE/ part of a \.{CWEB} file has octals introduced by \.0 and hexadecimals by \.{0x}, but \.{CWEAVE} will print with \TeX/ macros that the user can redefine to fit the context. In order to simplify such macros, we replace some of the characters.  Notice that in this section and the next, |id_first| and |id_loc| are pointers into the array |section_text|, not into |buffer|.

@&lt;Get a constant@&gt;= {
  id_first=id_loc=section_text+1;
  if (*(loc-1)=='\\') {*id_loc++='~';
  while (xisdigit(*loc)) *id_loc++=*loc++;} /* octal constant */
  else if (*(loc-1)=='0') {
    if (*loc=='x' || *loc=='X') {*id_loc++='^'; loc++;
      while (xisxdigit(*loc)) *id_loc++=*loc++;} /* hex constant */
    else if (xisdigit(*loc)) {*id_loc++='~';
      while (xisdigit(*loc)) *id_loc++=*loc++;} /* octal constant */
    else goto dec; /* decimal constant */
  }
  else { /* decimal constant */
    if (*(loc-1)=='.' &amp;&amp; !xisdigit(*loc)) goto mistake; /* not a constant */
    dec: *id_loc++=*(loc-1);
    while (xisdigit(*loc) || *loc=='.') *id_loc++=*loc++;
    if (*loc=='e' || *loc=='E') { /* float constant */
      *id_loc++='_'; loc++;
      if (*loc=='+' || *loc=='-') *id_loc++=*loc++;
      while (xisdigit(*loc)) *id_loc++=*loc++;
    }
  }
  while (*loc=='u' || *loc=='U' || *loc=='l' || *loc=='L'
         || *loc=='f' || *loc=='F') {
    *id_loc++='$'; *id_loc++=toupper(*loc); loc++;
  }
  return(constant);
}
</t>
<t tx="ekr.20050502102905.173">@ \CEE/ strings and character constants, delimited by double and single quotes, respectively, can contain newlines or instances of their own delimiters if they are protected by a backslash.  We follow this convention, but do not allow the string to be longer than |longest_name|.

@&lt;Get a string@&gt;= {
  char delim = c; /* what started the string */
  id_first = section_text+1;
  id_loc = section_text;
  if (delim=='\'' &amp;&amp; *(loc-2)=='@@') {*++id_loc='@@'; *++id_loc='@@';}
  *++id_loc=delim;
  if (delim=='L') { /* wide character constant */
    delim=*loc++; *++id_loc=delim;
  }
  if (delim=='&lt;') delim='&gt;'; /* for file names in |#include| lines */
  while (1) {
    if (loc&gt;=limit) {
      if(*(limit-1)!='\\') {
        err_print("! String didn't end"); loc=limit; break;
@.String didn't end@&gt;
      }
      if(get_line()==0) {
        err_print("! Input ended in middle of string"); loc=buffer; break;
@.Input ended in middle of string@&gt;
      }
    }
    if ((c=*loc++)==delim) {
      if (++id_loc&lt;=section_text_end) *id_loc=c;
      break;
    }
    if (c=='\\') if (loc&gt;=limit) continue;
      else if (++id_loc&lt;=section_text_end) {
        *id_loc = '\\'; c=*loc++;
      }
    if (++id_loc&lt;=section_text_end) *id_loc=c;
  }
  if (id_loc&gt;=section_text_end) {
    printf("\n! String too long: ");
@.String too long@&gt;
    term_write(section_text+1,25);
    printf("..."); mark_error;
  }
  id_loc++;
  return(string);
}
</t>
<t tx="ekr.20050502102905.174">@ After an \.{@@} sign has been scanned, the next character tells us whether there is more work to do.

@&lt;Get control code and possible section name@&gt;= {
  c=*loc++;
  switch(ccode[(eight_bits)c]) {
    case translit_code: err_print("! Use @@l in limbo only"); continue;
@.Use @@l in limbo...@&gt;
    case underline: xref_switch=def_flag; continue;
    case trace: tracing=c-'0'; continue;
    case xref_roman: case xref_wildcard: case xref_typewriter:
    case noop: case TeX_string: c=ccode[c]; skip_restricted(); return(c);
    case section_name:
      @&lt;Scan the section name and make |cur_section| point to it@&gt;;
    case verbatim: @&lt;Scan a verbatim string@&gt;;
    case ord: @&lt;Get a string@&gt;;
    default: return(ccode[(eight_bits)c]);
  }
}
</t>
<t tx="ekr.20050502102905.175">@ The occurrence of a section name sets |xref_switch| to zero, because the section name might (for example) follow \&amp;{int}.

@&lt;Scan the section name and make |cur_section| point to it@&gt;= {
  char *k; /* pointer into |section_text| */
  cur_section_char=*(loc-1);
  @&lt;Put section name into |section_text|@&gt;;
  if (k-section_text&gt;3 &amp;&amp; strncmp(k-2,"...",3)==0)
        cur_section=section_lookup(section_text+1,k-3,1); /* 1 indicates a prefix */
  else cur_section=section_lookup(section_text+1,k,0);
  xref_switch=0; return(section_name);
}
</t>
<t tx="ekr.20050502102905.176">@ At the present point in the program we have |*(loc-1)==verbatim|; we set |id_first| to the beginning of the string itself, and |id_loc| to its ending-plus-one location in the buffer.  We also set |loc| to the position just after the ending delimiter.

@&lt;Scan a verbatim string@&gt;= {
  id_first=loc++; *(limit+1)='@@'; *(limit+2)='&gt;';
  while (*loc!='@@' || *(loc+1)!='&gt;') loc++;
  if (loc&gt;=limit) err_print("! Verbatim string didn't end");
@.Verbatim string didn't end@&gt;
  id_loc=loc; loc+=2;
  return (verbatim);
}
</t>
<t tx="ekr.20050502102905.177">@ Section names are placed into the |section_text| array with consecutive spaces, tabs, and carriage-returns replaced by single spaces. There will be no spaces at the beginning or the end. (We set |section_text[0]=' '| to facilitate this, since the |section_lookup| routine uses |section_text[1]| as the first character of the name.)

@&lt;Set initial values@&gt;=section_text[0]=' ';

@ @&lt;Put section name...@&gt;=
k=section_text;
while (1) {
  if (loc&gt;limit &amp;&amp; get_line()==0) {
    err_print("! Input ended in section name");
@.Input ended in section name@&gt;
    loc=buffer+1; break;
  }
  c=*loc;
  @&lt;If end of name or erroneous control code, |break|@&gt;;
  loc++; if (k&lt;section_text_end) k++;
  if (xisspace(c)) {
    c=' '; if (*(k-1)==' ') k--;
  }
*k=c;
}
if (k&gt;=section_text_end) {
  printf("\n! Section name too long: ");
@.Section name too long@&gt;
  term_write(section_text+1,25);
  printf("..."); mark_harmless;
}
if (*k==' ' &amp;&amp; k&gt;section_text) k--;
</t>
<t tx="ekr.20050502102905.178">@ @&lt;If end of name...@&gt;=
if (c=='@@') {
  c=*(loc+1);
  if (c=='&gt;') {
    loc+=2; break;
  }
  if (ccode[(eight_bits)c]==new_section) {
    err_print("! Section name didn't end"); break;
@.Section name didn't end@&gt;
  }
  if (c!='@@') {
    err_print("! Control codes are forbidden in section name"); break;
@.Control codes are forbidden...@&gt;
  }
  *(++k)='@@'; loc++; /* now |c==*loc| again */
}
</t>
<t tx="ekr.20050502102905.179"></t>
<t tx="ekr.20050502102905.18">@
@&lt;Move |buffer| and |limit| to |change_buffer| and |change_limit|@&gt;=
{
  change_limit=change_buffer-buffer+limit;
  strncpy(change_buffer,buffer,limit-buffer+1);
}
</t>
<t tx="ekr.20050502102905.180">@ This function skips over a restricted context at relatively high speed.

@&lt;Predeclaration of procedures@&gt;=
void skip_restricted();

@ @c
void
skip_restricted()
{
  id_first=loc; *(limit+1)='@@';
false_alarm:
  while (*loc!='@@') loc++;
  id_loc=loc;
  if (loc++&gt;limit) {
    err_print("! Control text didn't end"); loc=limit;
@.Control text didn't end@&gt;
  }
  else {
    if (*loc=='@@'&amp;&amp;loc&lt;=limit) {loc++; goto false_alarm;}
    if (*loc++!='&gt;')
      err_print("! Control codes are forbidden in control text");
@.Control codes are forbidden...@&gt;
  }
}
</t>
<t tx="ekr.20050502102905.181">@** Phase one processing. We now have accumulated enough subroutines to make it possible to carry out \.{CWEAVE}'s first pass over the source file. If everything works right, both phase one and phase two of \.{CWEAVE} will assign the same numbers to sections, and these numbers will agree with what \.{CTANGLE} does.  The global variable |next_control| often contains the most recent output of |get_next|; in interesting cases, this will be the control code that ended a section or part of a section.

@&lt;Global variables@&gt;=
eight_bits next_control; /* control code waiting to be acting upon */</t>
<t tx="ekr.20050502102905.182">@ The overall processing strategy in phase one has the following straightforward outline.

@&lt;Predeclaration of procedures@&gt;=
void phase_one();

@ @c
void
phase_one() {
  phase=1; reset_input(); section_count=0;
  skip_limbo(); change_exists=0;
  while (!input_has_ended)
    @&lt;Store cross-reference data for the current section@&gt;;
  changed_section[section_count]=change_exists;
    /* the index changes if anything does */
  phase=2; /* prepare for second phase */
  @&lt;Print error messages about unused or undefined section names@&gt;;
}
</t>
<t tx="ekr.20050502102905.183">@ @&lt;Store cross-reference data...@&gt;=
{
  if (++section_count==max_sections) overflow("section number");
  changed_section[section_count]=changing;
     /* it will become 1 if any line changes */
  if (*(loc-1)=='*' &amp;&amp; show_progress) {
    printf("*%d",section_count);
    update_terminal; /* print a progress report */
  }
  @&lt;Store cross-references in the \TEX/ part of a section@&gt;;
  @&lt;Store cross-references in the definition part of a section@&gt;;
  @&lt;Store cross-references in the \CEE/ part of a section@&gt;;
  if (changed_section[section_count]) change_exists=1;
}
</t>
<t tx="ekr.20050502102905.184">@ In the \TEX/ part of a section, cross-reference entries are made only for the identifiers in \CEE/ texts enclosed in \pb, or for control texts enclosed in \.{@@\^}$\,\ldots\,$\.{@@&gt;} or \.{@@.}$\,\ldots\,$\.{@@&gt;} or \.{@@:}$\,\ldots\,$\.{@@&gt;}.

@&lt;Store cross-references in the \TEX/ part of a section@&gt;=
while (1) {
  switch (next_control=skip_TeX()) {
    case translit_code: err_print("! Use @@l in limbo only"); continue;
@.Use @@l in limbo...@&gt;
    case underline: xref_switch=def_flag; continue;
    case trace: tracing=*(loc-1)-'0'; continue;
    case '|': C_xref(section_name); break;
    case xref_roman: case xref_wildcard: case xref_typewriter:
    case noop: case section_name:
      loc-=2; next_control=get_next(); /* scan to \.{@@&gt;} */
      if (next_control&gt;=xref_roman &amp;&amp; next_control&lt;=xref_typewriter) {
        @&lt;Replace |"@@@@"| by |"@@"| @&gt;@;
        new_xref(id_lookup(id_first, id_loc,next_control-identifier));
      }
      break;
  }
  if (next_control&gt;=format_code) break;
}
</t>
<t tx="ekr.20050502102905.185">@ @&lt;Replace |"@@@@"| by |"@@"| @&gt;=
{
  char *src=id_first,*dst=id_first;
  while(src&lt;id_loc){
    if(*src=='@@') src++;
    *dst++=*src++;
  }
  id_loc=dst;
  while (dst&lt;src) *dst++=' '; /* clean up in case of error message display */
}
</t>
<t tx="ekr.20050502102905.186">@ When we get to the following code we have |next_control&gt;=format_code|.

@&lt;Store cross-references in the definition part of a section@&gt;=
while (next_control&lt;=definition) { /* |format_code| or |definition| */
  if (next_control==definition) {
    xref_switch=def_flag; /* implied \.{@@!} */
    next_control=get_next();
  } else @&lt;Process a format definition@&gt;;
  outer_xref();
}
</t>
<t tx="ekr.20050502102905.187">@ Error messages for improper format definitions will be issued in phase two. Our job in phase one is to define the |ilk| of a properly formatted identifier, and to remove cross-references to identifiers that we now discover should be unindexed.

@&lt;Process a format definition@&gt;= {
  next_control=get_next();
  if (next_control==identifier) {
    lhs=id_lookup(id_first, id_loc,normal); lhs-&gt;ilk=normal;
    if (xref_switch) new_xref(lhs);
    next_control=get_next();
    if (next_control==identifier) {
      rhs=id_lookup(id_first, id_loc,normal);
      lhs-&gt;ilk=rhs-&gt;ilk;
      if (unindexed(lhs)) { /* retain only underlined entries */
        xref_pointer q,r=NULL;
        for (q=(xref_pointer)lhs-&gt;xref;q&gt;xmem;q=q-&gt;xlink)
          if (q-&gt;num&lt;def_flag)
            if (r) r-&gt;xlink=q-&gt;xlink;
            else lhs-&gt;xref=(char*)q-&gt;xlink;
          else r=q;
      }
      next_control=get_next();
    }
  }
}
</t>
<t tx="ekr.20050502102905.188">@ Finally, when the \TEX/ and definition parts have been treated, we have |next_control&gt;=begin_C|.

@&lt;Store cross-references in the \CEE/ part of a section@&gt;=
if (next_control&lt;=section_name) {  /* |begin_C| or |section_name| */
  if (next_control==begin_C) section_xref_switch=0;
  else {
    section_xref_switch=def_flag;
    if(cur_section_char=='(' &amp;&amp; cur_section!=name_dir)
      set_file_flag(cur_section);
  }
  do {
    if (next_control==section_name &amp;&amp; cur_section!=name_dir)
      new_section_xref(cur_section);
    next_control=get_next(); outer_xref();
  } while ( next_control&lt;=section_name);
}
</t>
<t tx="ekr.20050502102905.189">@ @&lt;Print error messages about un...@&gt;=section_check(root)
</t>
<t tx="ekr.20050502102905.19">@ The following procedure is used to see if the next change entry should go into effect; it is called only when |changing| is 0. The idea is to test whether or not the current contents of |buffer| matches the current contents of |change_buffer|. If not, there's nothing more to do; but if so, a change is called for: All of the text down to the \.{@@y} is supposed to match. An error message is issued if any discrepancy is found. Then the procedure prepares to read the next line from |change_file|.  When a match is found, the current section is marked as changed unless the first line after the \.{@@x} and after the \.{@@y} both start with either |'@

@*'| or |'@

@ '| (possibly preceded by whitespace).  This procedure is called only when |buffer&lt;limit|, i.e., when the current line is nonempty.

@d if_section_start_make_pending(b) {@+*limit='!';
  for (loc=buffer;xisspace(*loc);loc++) ;
  *limit=' ';
  if (*loc=='@@' &amp;&amp; (xisspace(*(loc+1)) || *(loc+1)=='*')) change_pending=b;
}

@c
void
check_change() /* switches to |change_file| if the buffers match */
{
  int n=0; /* the number of discrepancies found */
  if (lines_dont_match) return;
  change_pending=0;
  if (!changed_section[section_count]) {
    if_section_start_make_pending(1);
    if (!change_pending) changed_section[section_count]=1;
  }
  while (1) {
    changing=1; print_where=1; change_line++;
    if (!input_ln(change_file)) {
      err_print("! Change file ended before @@y");
@.Change file ended...@&gt;
      change_limit=change_buffer; changing=0;
      return;
    }
    if (limit&gt;buffer+1 &amp;&amp; buffer[0]=='@@') {
      if (xisupper(buffer[1])) buffer[1]=tolower(buffer[1]);
      @&lt;If the current line starts with \.{@@y}, report any discrepancies and |return|@&gt;;
    }
    @&lt;Move |buffer| and |limit|...@&gt;;
    changing=0; cur_line++;
    while (!input_ln(cur_file)) { /* pop the stack or quit */
      if (include_depth==0) {
        err_print("! CWEB file ended during a change");
@.CWEB file ended...@&gt;
        input_has_ended=1; return;
      }
      include_depth--; cur_line++;
    }
    if (lines_dont_match) n++;
  }
}</t>
<t tx="ekr.20050502102905.190">@ The |C_xref| subroutine stores references to identifiers in \CEE/ text material beginning with the current value of |next_control| and continuing until |next_control| is `\.\{' or `\.{\v}', or until the next ``milestone'' is passed (i.e., |next_control&gt;=format_code|). If |next_control&gt;=format_code| when |C_xref| is called, nothing will happen; but if |next_control=='|'| upon entry, the procedure assumes that this is the `\.{\v}' preceding \CEE/ text that is to be processed.  The parameter |spec_ctrl| is used to change this behavior. In most cases |C_xref| is called with |spec_ctrl==ignore|, which triggers the default processing described above. If |spec_ctrl==section_name|, section names will be gobbled. This is used when \CEE/ text in the \TEX/ part or inside comments is parsed: It allows for section names to appear in \pb, but these strings will not be entered into the cross reference lists since they are not definitions of section names.  The program uses the fact that our internal code numbers satisfy the relations |xref_roman==identifier+roman| and |xref_wildcard==identifier +wildcard| and |xref_typewriter==identifier+typewriter|, as well as |normal==0|.

@&lt;Predeclaration of procedures@&gt;=
void C_xref();

@ @c
void
C_xref( spec_ctrl ) /* makes cross-references for \CEE/ identifiers */
  eight_bits spec_ctrl;
{
  name_pointer p; /* a referenced name */
  while (next_control&lt;format_code || next_control==spec_ctrl) {
    if (next_control&gt;=identifier &amp;&amp; next_control&lt;=xref_typewriter) {
      if (next_control&gt;identifier) @&lt;Replace |"@@@@"| by |"@@"| @&gt;@;
      p=id_lookup(id_first, id_loc,next_control-identifier); new_xref(p);
    }
    if (next_control==section_name) {
      section_xref_switch=cite_flag;
      new_section_xref(cur_section);
    }
    next_control=get_next();
    if (next_control=='|' || next_control==begin_comment ||
        next_control==begin_short_comment) return;
  }
}
</t>
<t tx="ekr.20050502102905.191">@ The |outer_xref| subroutine is like |C_xref| except that it begins with |next_control!='|'| and ends with |next_control&gt;=format_code|. Thus, it handles \CEE/ text with embedded comments.

@&lt;Predeclaration of procedures@&gt;=
void outer_xref();

@ @c
void
outer_xref() /* extension of |C_xref| */
{
  int bal; /* brace level in comment */
  while (next_control&lt;format_code)
    if (next_control!=begin_comment &amp;&amp; next_control!=begin_short_comment)
      C_xref(ignore);
    else {
      boolean is_long_comment=(next_control==begin_comment);
      bal=copy_comment(is_long_comment,1); next_control='|';
      while (bal&gt;0) {
        C_xref(section_name); /* do not reference section names in comments */
        if (next_control=='|') bal=copy_comment(is_long_comment,bal);
        else bal=0; /* an error message will occur in phase two */
      }
    }
}
</t>
<t tx="ekr.20050502102905.192">@ After phase one has looked at everything, we want to check that each section name was both defined and used.  The variable |cur_xref| will point to cross-references for the current section name of interest.

@&lt;Global variables@&gt;=
xref_pointer cur_xref; /* temporary cross-reference pointer */
boolean an_output; /* did |file_flag| precede |cur_xref|? */

@ The following recursive procedure walks through the tree of section names and prints out anomalies. @^recursion@&gt;

@&lt;Predeclaration of procedures@&gt;=
void section_check();

@ @c
void
section_check(p)
name_pointer p; /* print anomalies in subtree |p| */
{
  if (p) {
    section_check(p-&gt;llink);
    cur_xref=(xref_pointer)p-&gt;xref;
    if (cur_xref-&gt;num==file_flag) {an_output=1; cur_xref=cur_xref-&gt;xlink;}
    else an_output=0;
    if (cur_xref-&gt;num &lt;def_flag) {
      printf("\n! Never defined: &lt;"); print_section_name(p); putchar('&gt;'); mark_harmless;
@.Never defined: &lt;section name&gt;@&gt;
    }
    while (cur_xref-&gt;num &gt;=cite_flag) cur_xref=cur_xref-&gt;xlink;
    if (cur_xref==xmem &amp;&amp; !an_output) {
      printf("\n! Never used: &lt;"); print_section_name(p); putchar('&gt;'); mark_harmless;
@.Never used: &lt;section name&gt;@&gt;
    }
    section_check(p-&gt;rlink);
  }
}
</t>
<t tx="ekr.20050502102905.193">@* Low-level output routines. The \TEX/ output is supposed to appear in lines at most |line_length| characters long, so we place it into an output buffer. During the output process, |out_line| will hold the current line number of the line about to be output.

@&lt;Global variables@&gt;=
char out_buf[line_length+1]; /* assembled characters */
char *out_ptr; /* just after last character in |out_buf| */
char *out_buf_end = out_buf+line_length; /* end of |out_buf| */
int out_line; /* number of next line to be output */</t>
<t tx="ekr.20050502102905.194">@ The |flush_buffer| routine empties the buffer up to a given breakpoint, and moves any remaining characters to the beginning of the next line. If the |per_cent| parameter is 1 a |'%'| is appended to the line that is being output; in this case the breakpoint |b| should be strictly less than |out_buf_end|. If the |per_cent| parameter is |0|, trailing blanks are suppressed. The characters emptied from the buffer form a new line of output; if the |carryover| parameter is true, a |"%"| in that line will be carried over to the next line (so that \TEX/ will ignore the completion of commented-out text).

@d c_line_write(c) fflush(active_file),fwrite(out_buf+1,sizeof(char),c,active_file)
@d tex_putc(c) putc(c,active_file)
@d tex_new_line putc('\n',active_file)
@d tex_printf(c) fprintf(active_file,c)

@c
void
flush_buffer(b,per_cent,carryover)
char *b;  /* outputs from |out_buf+1| to |b|,where |b&lt;=out_ptr| */
boolean per_cent,carryover;
{
  char *j; j=b; /* pointer into |out_buf| */
  if (! per_cent) /* remove trailing blanks */
    while (j&gt;out_buf &amp;&amp; *j==' ') j--;
  c_line_write(j-out_buf);
  if (per_cent) tex_putc('%');
  tex_new_line; out_line++;
  if (carryover)
    while (j&gt;out_buf)
      if (*j--=='%' &amp;&amp; (j==out_buf || *j!='\\')) {
        *b--='%'; break;
      }
  if (b&lt;out_ptr) strncpy(out_buf+1,b+1,out_ptr-b);
  out_ptr-=b-out_buf;
}</t>
<t tx="ekr.20050502102905.195">@ When we are copying \TEX/ source material, we retain line breaks that occur in the input, except that an empty line is not output when the \TEX/ source line was nonempty. For example, a line of the \TEX/ file that contains only an index cross-reference entry will not be copied. The |finish_line| routine is called just before |get_line| inputs a new line, and just after a line break token has been emitted during the output of translated \CEE/ text.

@c
void
finish_line() /* do this at the end of a line */
{
  char *k; /* pointer into |buffer| */
  if (out_ptr&gt;out_buf) flush_buffer(out_ptr,0,0);
  else {
    for (k=buffer; k&lt;=limit; k++)
      if (!(xisspace(*k))) return;
    flush_buffer(out_buf,0,0);
  }
}</t>
<t tx="ekr.20050502102905.196">@ In particular, the |finish_line| procedure is called near the very beginning of phase two. We initialize the output variables in a slightly tricky way so that the first line of the output file will be `\.{\\input cwebmac}'.

@&lt;Set initial values@&gt;=
out_ptr=out_buf+1; out_line=1; active_file=tex_file;
*out_ptr='c'; tex_printf("\\input cwebma");
</t>
<t tx="ekr.20050502102905.197">@ When we wish to append one character |c| to the output buffer, we write `|out(c)|'; this will cause the buffer to be emptied if it was already full.  If we want to append more than one character at once, we say |out_str(s)|, where |s| is a string containing the characters.  A line break will occur at a space or after a single-nonletter \TEX/ control sequence.

@d out(c) {if (out_ptr&gt;=out_buf_end) break_out(); *(++out_ptr)=c;}

@c
void
out_str(s) /* output characters from |s| to end of string */
char *s;
{
  while (*s) out(*s++);
}</t>
<t tx="ekr.20050502102905.198">@ The |break_out| routine is called just before the output buffer is about to overflow. To make this routine a little faster, we initialize position 0 of the output buffer to `\.\\'; this character isn't really output.

@&lt;Set initial values@&gt;=
out_buf[0]='\\';

@ A long line is broken at a blank space or just before a backslash that isn't preceded by another backslash. In the latter case, a |'%'| is output at the break.

@&lt;Predeclaration of procedures@&gt;=
void break_out();

@ @c
void
break_out() /* finds a way to break the output line */
{
  char *k=out_ptr; /* pointer into |out_buf| */
  while (1) {
    if (k==out_buf) @&lt;Print warning message, break the line, |return|@&gt;;
    if (*k==' ') {
      flush_buffer(k,0,1); return;
    }
    if (*(k--)=='\\' &amp;&amp; *k!='\\') { /* we've decreased |k| */
      flush_buffer(k,1,1); return;
    }
  }
}
</t>
<t tx="ekr.20050502102905.199">@ We get to this section only in the unusual case that the entire output line consists of a string of backslashes followed by a string of nonblank non-backslashes. In such cases it is almost always safe to break the line by putting a |'%'| just before the last character.

@&lt;Print warning message, break the line, |return|@&gt;=
{
  printf("\n! Line had to be broken (output l. %d):\n",out_line);
@.Line had to be broken@&gt;
  term_write(out_buf+1, out_ptr-out_buf-1);
  new_line; mark_harmless;
  flush_buffer(out_ptr-1,1,1); return;
}
</t>
<t tx="ekr.20050502102905.2">@ @q This file defines standard C++ namespaces and classes @&gt;
@q Please send corrections to saroj-tamasa@@worldnet.att.net @&gt;
@s std int
@s rel_ops int
@s bitset int
@s char_traits int
@s deque int
@s list int
@s map int
@s multimap int
@s multiset int
@s pair int
@s set int
@s stack int
@s exception int
@s logic_error int
@s runtime_error int
@s domain_error int
@s invalid_argument int
@s length_error int
@s out_of_range int
@s range_error int
@s overflow_error int
@s underflow_error int
@s back_insert_iterator int
@s front_insert_iterator int
@s insert_iterator int
@s reverse_iterator int
@s istream_iterator int
@s ostream_iterator int
@s istreambuf_iterator int
@s ostreambuf_iterator int
@s iterator_traits int
@s queue int
@s vector int
@s basic_string int
@s string int
@s auto_ptr int
@s valarray int
@s ios_base int
@s basic_ios int
@s basic_streambuf int
@s basic_istream int
@s basic_ostream int
@s basic_iostream int
@s basic_stringbuf int
@s basic_istringstream int
@s basic_ostringstream int
@s basic_stringstream int
@s basic_filebuf int
@s basic_ifstream int
@s basic_ofstream int
@s basic_fstream int
@s ctype int
@s collate int
@s collate_byname int
@s streambuf int
@s istream int
@s ostream int
@s iostream int
@s stringbuf int
@s istringstream int
@s ostringstream int
@s stringstream int
@s filebuf int
@s ifstream int
@s ofstream int
@s fstream int
@s wstreambuf int
@s wistream int
@s wostream int
@s wiostram int
@s wstringbuf int
@s wistringstream int
@s wostringstream int
@s wstringstream int
@s wfilebuf int
@s wifstream int
@s wofstream int
@s wfstream int
@s streamoff int
@s streamsize int
@s fpos int
@s streampos int
@s wstreampos int</t>
<t tx="ekr.20050502102905.20">@
@&lt;If the current line starts with \.{@@y}...@&gt;=
if (buffer[1]=='x' || buffer[1]=='z') {
  loc=buffer+2; err_print("! Where is the matching @@y?");
@.Where is the match...@&gt;
  }
else if (buffer[1]=='y') {
  if (n&gt;0) {
    loc=buffer+2;
    printf("\n! Hmm... %d ",n);
    err_print("of the preceding lines failed to match");
@.Hmm... n of the preceding...@&gt;
  }
  change_depth=include_depth;
  return;
}
</t>
<t tx="ekr.20050502102905.200">@ Here is a macro that outputs a section number in decimal notation. The number to be converted by |out_section| is known to be less than |def_flag|, so it cannot have more than five decimal digits.  If the section is changed, we output `\.{\\*}' just after the number.

@c
void
out_section(n)
sixteen_bits n;
{
  char s[6];
  sprintf(s,"%d",n); out_str(s);
  if(changed_section[n]) out_str ("\\*");
@.\\*@&gt;
}</t>
<t tx="ekr.20050502102905.201">@ The |out_name| procedure is used to output an identifier or index entry, enclosing it in braces.

@c
void
out_name(p,quote_xalpha)
name_pointer p;
boolean quote_xalpha;
{
  char *k, *k_end=(p+1)-&gt;byte_start; /* pointers into |byte_mem| */
  out('{');
  for (k=p-&gt;byte_start; k&lt;k_end; k++) {
    if (isxalpha(*k) &amp;&amp; quote_xalpha) out('\\');
@.\\\$@&gt;
@.\\\_@&gt;
    out(*k);
  }
  out('}');
}</t>
<t tx="ekr.20050502102905.202">@* Routines that copy \TEX/ material. During phase two, we use subroutines |copy_limbo|, |copy_TeX|, and |copy_comment| in place of the analogous |skip_limbo|, |skip_TeX|, and |skip_comment| that were used in phase one. (Well, |copy_comment| was actually written in such a way that it functions as |skip_comment| in phase one.)  The |copy_limbo| routine, for example, takes \TEX/ material that is not part of any section and transcribes it almost verbatim to the output file. The use of `\.{@@}' signs is severely restricted in such material: `\.{@@@@}' pairs are replaced by singletons; `\.{@@l}' and `\.{@@q}' and `\.{@@s}' are interpreted.

@c
void
copy_limbo()
{
  char c;
  while (1) {
    if (loc&gt;limit &amp;&amp; (finish_line(), get_line()==0)) return;
    *(limit+1)='@@';
    while (*loc!='@@') out(*(loc++));
    if (loc++&lt;=limit) {
      c=*loc++;
      if (ccode[(eight_bits)c]==new_section) break;
      switch (ccode[(eight_bits)c]) {
        case translit_code: out_str("\\ATL"); break;
@.\\ATL@&gt;
        case '@@': out('@@'); break;
        case noop: skip_restricted(); break;
        case format_code: if (get_next()==identifier) get_next();
          if (loc&gt;=limit) get_line(); /* avoid blank lines in output */
          break; /* the operands of \.{@@s} are ignored on this pass */
        default: err_print("! Double @@ should be used in limbo");
@.Double @@ should be used...@&gt;
        out('@@');
      }
    }
  }
}</t>
<t tx="ekr.20050502102905.203">@ The |copy_TeX| routine processes the \TEX/ code at the beginning of a
section; for example, the words you are now reading were copied in this
way. It returns the next control code or `\.{\v}' found in the input.
We don't copy spaces or tab marks into the beginning of a line. This
makes the test for empty lines in |finish_line| work.

@ @f copy_TeX TeX
@c
eight_bits
copy_TeX()
{
  char c; /* current character being copied */
  while (1) {
    if (loc&gt;limit &amp;&amp; (finish_line(), get_line()==0)) return(new_section);
    *(limit+1)='@@';
    while ((c=*(loc++))!='|' &amp;&amp; c!='@@') {
      out(c);
      if (out_ptr==out_buf+1 &amp;&amp; (xisspace(c))) out_ptr--;
    }
    if (c=='|') return('|');
    if (loc&lt;=limit) return(ccode[(eight_bits)*(loc++)]);
  }
}</t>
<t tx="ekr.20050502102905.204">@ The |copy_comment| function issues a warning if more braces are opened than closed, and in the case of a more serious error it supplies enough braces to keep \TEX/ from complaining about unbalanced braces. Instead of copying the \TEX/ material into the output buffer, this function copies it into the token memory (in phase two only). The abbreviation |app_tok(t)| is used to append token |t| to the current token list, and it also makes sure that it is possible to append at least one further token without overflow.

@d app_tok(c) {if (tok_ptr+2&gt;tok_mem_end) overflow("token"); *(tok_ptr++)=c;}

@&lt;Predeclaration of procedures@&gt;=
int copy_comment();

@ @c
int copy_comment(is_long_comment,bal) /* copies \TEX/ code in comments */
boolean is_long_comment; /* is this a traditional \CEE/ comment? */
int bal; /* brace balance */
{
  char c; /* current character being copied */
  while (1) {
    if (loc&gt;limit) {
      if (is_long_comment) {
        if (get_line()==0) {
          err_print("! Input ended in mid-comment");
@.Input ended in mid-comment@&gt;
          loc=buffer+1; goto done;
        }
      }
      else {
        if (bal&gt;1) err_print("! Missing } in comment");
@.Missing \} in comment@&gt;
        goto done;
      }
    }
    c=*(loc++);
    if (c=='|') return(bal);
    if (is_long_comment) @&lt;Check for end of comment@&gt;;
    if (phase==2) {
      if (ishigh(c)) app_tok(quoted_char);
      app_tok(c);
    }
    @&lt;Copy special things when |c=='@@', '\\'|@&gt;;
    if (c=='{') bal++;
    else if (c=='}') {
      if(bal&gt;1) bal--;
      else {err_print("! Extra } in comment");
@.Extra \} in comment@&gt;
        if (phase==2) tok_ptr--;
      }
    }
  }
done:@&lt;Clear |bal| and |return|@&gt;;
}
</t>
<t tx="ekr.20050502102905.205">@ @&lt;Check for end of comment@&gt;=
if (c=='*' &amp;&amp; *loc=='/') {
  loc++;
  if (bal&gt;1) err_print("! Missing } in comment");
@.Missing \} in comment@&gt;
  goto done;
}
</t>
<t tx="ekr.20050502102905.206">@ @&lt;Copy special things when |c=='@@'...@&gt;=
if (c=='@@') {
  if (*(loc++)!='@@') {
    err_print("! Illegal use of @@ in comment");
@.Illegal use of @@...@&gt;
    loc-=2; if (phase==2) *(tok_ptr-1)=' '; goto done;
  }
}
else if (c=='\\' &amp;&amp; *loc!='@@')
  if (phase==2) app_tok(*(loc++)) else loc++;
</t>
<t tx="ekr.20050502102905.207">@ We output enough right braces to keep \TEX/ happy.

@&lt;Clear |bal| and |return|@&gt;=
if (phase==2) while (bal-- &gt;0) app_tok('}');
return(0);
</t>
<t tx="ekr.20050502102905.208">@** Parsing.
The most intricate part of \.{CWEAVE} is its mechanism for converting
\CEE/-like code into \TEX/ code, and we might as well plunge into this
aspect of the program now. A ``bottom up'' approach is used to parse the
\CEE/-like material, since \.{CWEAVE} must deal with fragmentary
constructions whose overall ``part of speech'' is not known.

At the lowest level, the input is represented as a sequence of entities
that we shall call {\it scraps}, where each scrap of information consists
of two parts, its {\it category} and its {\it translation}. The category
is essentially a syntactic class, and the translation is a token list that
represents \TEX/ code. Rules of syntax and semantics tell us how to
combine adjacent scraps into larger ones, and if we are lucky an entire
\CEE/ text that starts out as hundreds of small scraps will join
together into one gigantic scrap whose translation is the desired \TEX/
code. If we are unlucky, we will be left with several scraps that don't
combine; their translations will simply be output, one by one.

The combination rules are given as context-sensitive productions that are
applied from left to right. Suppose that we are currently working on the
sequence of scraps $s_1\,s_2\ldots s_n$. We try first to find the longest
production that applies to an initial substring $s_1\,s_2\ldots\,$; but if
no such productions exist, we try to find the longest production
applicable to the next substring $s_2\,s_3\ldots\,$; and if that fails, we
try to match $s_3\,s_4\ldots\,$, etc.

A production applies if the category codes have a given pattern. For
example, one of the productions (see rule~3) is
$$\hbox{|exp| }\left\{\matrix{\hbox{|binop|}\cr\hbox{|ubinop|}}\right\}
\hbox{ |exp| }\RA\hbox{ |exp|}$$
and it means that three consecutive scraps whose respective categories are
|exp|, |binop| (or |ubinop|),
and |exp| are converted to one scrap whose category
is |exp|.  The translations of the original
scraps are simply concatenated.  The case of
$$\hbox{|exp| |comma| |exp| $\RA$ |exp|} \hskip4emE_1C\,\\{opt}9\,E_2$$
(rule 4) is only slightly more complicated:
Here the resulting |exp| translation
consists not only of the three original translations, but also of the
tokens |opt| and 9 between the translations of the
|comma| and the following |exp|.
In the \TEX/ file, this will specify an optional line break after the
comma, with penalty 90.

At each opportunity the longest possible production is applied.  For
example, if the current sequence of scraps is |int_like| |cast|
|lbrace|, rule 31 is applied; but if the sequence is |int_like| |cast|
followed by anything other than |lbrace|, rule 32 takes effect.

Translation rules such as `$E_1C\,\\{opt}9\,E_2$' above use subscripts
to distinguish between translations of scraps whose categories have the
same initial letter; these subscripts are assigned from left to right.</t>
<t tx="ekr.20050502102905.209">@ Here is a list of the category codes that scraps can have. (A few others, like |int_like|, have already been defined; the |cat_name| array contains a complete list.)

@d exp 1 /* denotes an expression, including perhaps a single identifier */
@d unop 2 /* denotes a unary operator */
@d binop 3 /* denotes a binary operator */
@d ubinop 4
  /* denotes an operator that can be unary or binary, depending on context */
@d cast 5 /* denotes a cast */
@d question 6 /* denotes a question mark and possibly the expressions flanking it */
@d lbrace 7 /* denotes a left brace */
@d rbrace 8 /* denotes a right brace */
@d decl_head 9 /* denotes an incomplete declaration */
@d comma 10 /* denotes a comma */
@d lpar 11 /* denotes a left parenthesis or left bracket */
@d rpar 12 /* denotes a right parenthesis or right bracket */
@d prelangle 13 /* denotes `$&lt;$' before we know what it is */
@d prerangle 14 /* denotes `$&gt;$' before we know what it is */
@d langle 15 /* denotes `$&lt;$' when it's used as angle bracket in a template */
@d colcol 18 /* denotes `::' */
@d base 19 /* denotes a colon that introduces a base specifier */
@d decl 20 /* denotes a complete declaration */
@d struct_head 21 /* denotes the beginning of a structure specifier */
@d stmt 23 /* denotes a complete statement */
@d function 24 /* denotes a complete function */
@d fn_decl 25 /* denotes a function declarator */
@d semi 27 /* denotes a semicolon */
@d colon 28 /* denotes a colon */
@d tag 29 /* denotes a statement label */
@d if_head 30 /* denotes the beginning of a compound conditional */
@d else_head 31 /* denotes a prefix for a compound statement */
@d if_clause 32 /* pending \.{if} together with a condition */
@d lproc 35 /* begins a preprocessor command */
@d rproc 36 /* ends a preprocessor command */
@d insert 37 /* a scrap that gets combined with its neighbor */
@d section_scrap 38 /* section name */
@d dead 39 /* scrap that won't combine */
@d ftemplate 59 /* \\{make\_pair} */
@d new_exp 60 /* \&amp;{new} and a following type identifier */
@d begin_arg 61 /* \.{@@[} */
@d end_arg 62 /* \.{@@]} */

@&lt;Global variables@&gt;=
char cat_name[256][12];
eight_bits cat_index;

@ @&lt;Set in...@&gt;=
    for (cat_index=0;cat_index&lt;255;cat_index++)
      strcpy(cat_name[cat_index],"UNKNOWN");
@.UNKNOWN@&gt;
    strcpy(cat_name[exp],"exp");
    strcpy(cat_name[unop],"unop");
    strcpy(cat_name[binop],"binop");
    strcpy(cat_name[ubinop],"ubinop");
    strcpy(cat_name[cast],"cast");
    strcpy(cat_name[question],"?");
    strcpy(cat_name[lbrace],"{"@q}@&gt;);
    strcpy(cat_name[rbrace],@q{@&gt;"}");
    strcpy(cat_name[decl_head],"decl_head");
    strcpy(cat_name[comma],",");
    strcpy(cat_name[lpar],"(");
    strcpy(cat_name[rpar],")");
    strcpy(cat_name[prelangle],"&lt;");
    strcpy(cat_name[prerangle],"&gt;");
    strcpy(cat_name[langle],"\\&lt;");
    strcpy(cat_name[colcol],"::");
    strcpy(cat_name[base],"\\:");
    strcpy(cat_name[decl],"decl");
    strcpy(cat_name[struct_head],"struct_head");
    strcpy(cat_name[alfop],"alfop");
    strcpy(cat_name[stmt],"stmt");
    strcpy(cat_name[function],"function");
    strcpy(cat_name[fn_decl],"fn_decl");
    strcpy(cat_name[else_like],"else_like");
    strcpy(cat_name[semi],";");
    strcpy(cat_name[colon],":");
    strcpy(cat_name[tag],"tag");
    strcpy(cat_name[if_head],"if_head");
    strcpy(cat_name[else_head],"else_head");
    strcpy(cat_name[if_clause],"if()");
    strcpy(cat_name[lproc],"#{"@q}@&gt;);
    strcpy(cat_name[rproc],@q{@&gt;"#}");
    strcpy(cat_name[insert],"insert");
    strcpy(cat_name[section_scrap],"section");
    strcpy(cat_name[dead],"@@d");
    strcpy(cat_name[public_like],"public");
    strcpy(cat_name[operator_like],"operator");
    strcpy(cat_name[new_like],"new");
    strcpy(cat_name[catch_like],"catch");
    strcpy(cat_name[for_like],"for");
    strcpy(cat_name[do_like],"do");
    strcpy(cat_name[if_like],"if");
    strcpy(cat_name[delete_like],"delete");
    strcpy(cat_name[raw_ubin],"ubinop?");
    strcpy(cat_name[const_like],"const");
    strcpy(cat_name[raw_int],"raw");
    strcpy(cat_name[int_like],"int");
    strcpy(cat_name[case_like],"case");
    strcpy(cat_name[sizeof_like],"sizeof");
    strcpy(cat_name[struct_like],"struct");
    strcpy(cat_name[typedef_like],"typedef");
    strcpy(cat_name[define_like],"define");
    strcpy(cat_name[template_like],"template");
    strcpy(cat_name[ftemplate],"ftemplate");
    strcpy(cat_name[new_exp],"new_exp");
    strcpy(cat_name[begin_arg],"@@["@q]@&gt;);
    strcpy(cat_name[end_arg],@q[@&gt;"@@]");
    strcpy(cat_name[0],"zero");
</t>
<t tx="ekr.20050502102905.21">@ The |reset_input| procedure, which gets \.{CWEB} ready to read the user's \.{CWEB} input, is used at the beginning of phase one of \.{CTANGLE}, phases one and two of \.{CWEAVE}.

@c
void
reset_input()
{
  limit=buffer; loc=buffer+1; buffer[0]=' ';
  @&lt;Open input files@&gt;;
  include_depth=0; cur_line=0; change_line=0;
  change_depth=include_depth;
  changing=1; prime_the_change_buffer(); changing=!changing;
  limit=buffer; loc=buffer+1; buffer[0]=' '; input_has_ended=0;
}</t>
<t tx="ekr.20050502102905.210">@ This code allows \.{CWEAVE} to display its parsing steps.

@c
void
print_cat(c) /* symbolic printout of a category */
eight_bits c;
{
  printf(cat_name[c]);
}</t>
<t tx="ekr.20050502102905.211">@ The token lists for translated \TEX/ output contain some special control symbols as well as ordinary characters. These control symbols are interpreted by \.{CWEAVE} before they are written to the output file.  \yskip\hang |break_space| denotes an optional line break or an en space;  \yskip\hang |force| denotes a line break;  \yskip\hang |big_force| denotes a line break with additional vertical space;  \yskip\hang |preproc_line| denotes that the line will be printed flush left;  \yskip\hang |opt| denotes an optional line break (with the continuation line indented two ems with respect to the normal starting position)---this code is followed by an integer |n|, and the break will occur with penalty $10n$;  \yskip\hang |backup| denotes a backspace of one em;  \yskip\hang |cancel| obliterates any |break_space|, |opt|, |force|, or |big_force| tokens that immediately precede or follow it and also cancels any |backup| tokens that follow it;  \yskip\hang |indent| causes future lines to be indented one more em;  \yskip\hang |outdent| causes future lines to be indented one less em.  \yskip\noindent All of these tokens are removed from the \TEX/ output that comes from \CEE/ text between \pb\ signs; |break_space| and |force| and |big_force| become single spaces in this mode. The translation of other \CEE/ texts results in \TEX/ control sequences \.{\\1}, \.{\\2}, \.{\\3}, \.{\\4}, \.{\\5}, \.{\\6}, \.{\\7}, \.{\\8} corresponding respectively to |indent|, |outdent|, |opt|, |backup|, |break_space|, |force|, |big_force| and |preproc_line|. However, a sequence of consecutive `\.\ ', |break_space|, |force|, and/or |big_force| tokens is first replaced by a single token (the maximum of the given ones).  The token |math_rel| will be translated into \.{\\MRL\{}, and it will get a matching \.\} later. Other control sequences in the \TEX/ output will be `\.{\\\\\{}$\,\ldots\,$\.\}' surrounding identifiers, `\.{\\\&amp;\{}$\,\ldots\,$\.\}' surrounding reserved words, `\.{\\.\{}$\,\ldots\,$\.\}' surrounding strings, `\.{\\C\{}$\,\ldots\,$\.\}$\,$|force|' surrounding comments, and `\.{\\X$n$:}$\,\ldots\,$\.{\\X}' surrounding section names, where |n| is the section number.

@d math_rel 0206
@d big_cancel 0210 /* like |cancel|, also overrides spaces */
@d cancel 0211 /* overrides |backup|, |break_space|, |force|, |big_force| */
@d indent 0212 /* one more tab (\.{\\1}) */
@d outdent 0213 /* one less tab (\.{\\2}) */
@d opt 0214 /* optional break in mid-statement (\.{\\3}) */
@d backup 0215 /* stick out one unit to the left (\.{\\4}) */
@d break_space 0216 /* optional break between statements (\.{\\5}) */
@d force 0217 /* forced break between statements (\.{\\6}) */
@d big_force 0220 /* forced break with additional space (\.{\\7}) */
@d preproc_line 0221 /* begin line without indentation (\.{\\8}) */
@^high-bit character handling@&gt;

@d quoted_char 0222
        /* introduces a character token in the range |0200|--|0377| */
@d end_translation 0223 /* special sentinel token at end of list */
@d inserted 0224 /* sentinel to mark translations of inserts */
@d qualifier 0225 /* introduces an explicit namespace qualifier */
</t>
<t tx="ekr.20050502102905.212">@ The raw input is converted into scraps according to the following table, which gives category codes followed by the translations. \def\stars {\.{**}}% The symbol `\stars' stands for `\.{\\\&amp;\{{\rm identifier}\}}', i.e., the identifier itself treated as a reserved word. The right-hand column is the so-called |mathness|, which is explained further below.  An identifier |c| of length 1 is translated as \.{\\\v c} instead of as \.{\\\\\{c\}}. An identifier \.{CAPS} in all caps is translated as \.{\\.\{CAPS\}} instead of as \.{\\\\\{CAPS\}}. An identifier that has become a reserved word via |typedef| is translated with \.{\\\&amp;} replacing \.{\\\\} and |raw_int| replacing |exp|.  A string of length greater than 20 is broken into pieces of size at most~20 with discretionary breaks in between.  \yskip\halign{\quad#\hfil&amp;\quad#\hfil&amp;\quad\hfil#\hfil\cr \.{!=}&amp;|binop|: \.{\\I}&amp;yes\cr \.{&lt;=}&amp;|binop|: \.{\\Z}&amp;yes\cr \.{&gt;=}&amp;|binop|: \.{\\G}&amp;yes\cr \.{==}&amp;|binop|: \.{\\E}&amp;yes\cr \.{\&amp;\&amp;}&amp;|binop|: \.{\\W}&amp;yes\cr \.{\v\v}&amp;|binop|: \.{\\V}&amp;yes\cr \.{++}&amp;|unop|: \.{\\PP}&amp;yes\cr \.{--}&amp;|unop|: \.{\\MM}&amp;yes\cr \.{-&gt;}&amp;|binop|: \.{\\MG}&amp;yes\cr \.{&gt;&gt;}&amp;|binop|: \.{\\GG}&amp;yes\cr \.{&lt;&lt;}&amp;|binop|: \.{\\LL}&amp;yes\cr \.{::}&amp;|colcol|: \.{\\DC}&amp;maybe\cr \.{.*}&amp;|binop|: \.{\\PA}&amp;yes\cr \.{-&gt;*}&amp;|binop|: \.{\\MGA}&amp;yes\cr \.{...}&amp;|raw_int|: \.{\\,\\ldots\\,}&amp;yes\cr \."string\."&amp;|exp|: \.{\\.\{}string with special characters quoted\.\}&amp;maybe\cr \.{@@=}string\.{@@&gt;}&amp;|exp|: \.{\\vb\{}string with special characters   quoted\.\}&amp;maybe\cr \.{@@'7'}&amp;|exp|: \.{\\.\{@@'7'\}}&amp;maybe\cr \.{077} or \.{\\77}&amp;|exp|: \.{\\T\{\\\~77\}}&amp;maybe\cr \.{0x7f}&amp;|exp|: \.{\\T\{\\\^7f\}}&amp;maybe\cr \.{77}&amp;|exp|: \.{\\T\{77\}}&amp;maybe\cr \.{77L}&amp;|exp|: \.{\\T\{77\\\$L\}}&amp;maybe\cr \.{0.1E5}&amp;|exp|: \.{\\T\{0.1\\\_5\}}&amp;maybe\cr \.+&amp;|ubinop|: \.+&amp;yes\cr \.-&amp;|ubinop|: \.-&amp;yes\cr \.*&amp;|raw_ubin|: \.*&amp;yes\cr \./&amp;|binop|: \./&amp;yes\cr \.&lt;&amp;|prelangle|: \.{\\langle}&amp;yes\cr \.=&amp;|binop|: \.{\\K}&amp;yes\cr \.&gt;&amp;|prerangle|: \.{\\rangle}&amp;yes\cr \..&amp;|binop|: \..&amp;yes\cr \.{\v}&amp;|binop|: \.{\\OR}&amp;yes\cr \.\^&amp;|binop|: \.{\\XOR}&amp;yes\cr \.\%&amp;|binop|: \.{\\MOD}&amp;yes\cr \.?&amp;|question|: \.{\\?}&amp;yes\cr \.!&amp;|unop|: \.{\\R}&amp;yes\cr \.\~&amp;|unop|: \.{\\CM}&amp;yes\cr \.\&amp;&amp;|raw_ubin|: \.{\\AND}&amp;yes\cr \.(&amp;|lpar|: \.(&amp;maybe\cr \.[&amp;|lpar|: \.[&amp;maybe\cr \.)&amp;|rpar|: \.)&amp;maybe\cr \.]&amp;|rpar|: \.]&amp;maybe\cr \.\{&amp;|lbrace|: \.\{&amp;yes\cr \.\}&amp;|lbrace|: \.\}&amp;yes\cr \.,&amp;|comma|: \.,&amp;yes\cr \.;&amp;|semi|: \.;&amp;maybe\cr \.:&amp;|colon|: \.:&amp;no\cr \.\# (within line)&amp;|ubinop|: \.{\\\#}&amp;yes\cr \.\# (at beginning)&amp;|lproc|:  |force| |preproc_line| \.{\\\#}&amp;no\cr end of \.\# line&amp;|rproc|:  |force|&amp;no\cr identifier&amp;|exp|: \.{\\\\\{}identifier with underlines and              dollar signs quoted\.\}&amp;maybe\cr \.{and}&amp;|alfop|: \stars&amp;yes\cr \.{and\_eq}&amp;|alfop|: \stars&amp;yes\cr \.{asm}&amp;|sizeof_like|: \stars&amp;maybe\cr \.{auto}&amp;|int_like|: \stars&amp;maybe\cr \.{bitand}&amp;|alfop|: \stars&amp;yes\cr \.{bitor}&amp;|alfop|: \stars&amp;yes\cr \.{bool}&amp;|raw_int|: \stars&amp;maybe\cr \.{break}&amp;|case_like|: \stars&amp;maybe\cr \.{case}&amp;|case_like|: \stars&amp;maybe\cr \.{catch}&amp;|catch_like|: \stars&amp;maybe\cr \.{char}&amp;|raw_int|: \stars&amp;maybe\cr \.{class}&amp;|struct_like|: \stars&amp;maybe\cr \.{clock\_t}&amp;|raw_int|: \stars&amp;maybe\cr \.{compl}&amp;|alfop|: \stars&amp;yes\cr \.{const}&amp;|const_like|: \stars&amp;maybe\cr \.{const\_cast}&amp;|raw_int|: \stars&amp;maybe\cr \.{continue}&amp;|case_like|: \stars&amp;maybe\cr \.{default}&amp;|case_like|: \stars&amp;maybe\cr \.{define}&amp;|define_like|: \stars&amp;maybe\cr \.{defined}&amp;|sizeof_like|: \stars&amp;maybe\cr \.{delete}&amp;|delete_like|: \stars&amp;maybe\cr \.{div\_t}&amp;|raw_int|: \stars&amp;maybe\cr \.{do}&amp;|do_like|: \stars&amp;maybe\cr \.{double}&amp;|raw_int|: \stars&amp;maybe\cr \.{dynamic\_cast}&amp;|raw_int|: \stars&amp;maybe\cr \.{elif}&amp;|if_like|: \stars&amp;maybe\cr \.{else}&amp;|else_like|: \stars&amp;maybe\cr \.{endif}&amp;|if_like|: \stars&amp;maybe\cr \.{enum}&amp;|struct_like|: \stars&amp;maybe\cr \.{error}&amp;|if_like|: \stars&amp;maybe\cr \.{explicit}&amp;|int_like|: \stars&amp;maybe\cr \.{export}&amp;|int_like|: \stars&amp;maybe\cr \.{extern}&amp;|int_like|: \stars&amp;maybe\cr \.{FILE}&amp;|raw_int|: \stars&amp;maybe\cr \.{float}&amp;|raw_int|: \stars&amp;maybe\cr \.{for}&amp;|for_like|: \stars&amp;maybe\cr \.{fpos\_t}&amp;|raw_int|: \stars&amp;maybe\cr \.{friend}&amp;|int_like|: \stars&amp;maybe\cr \.{goto}&amp;|case_like|: \stars&amp;maybe\cr \.{if}&amp;|if_like|: \stars&amp;maybe\cr \.{ifdef}&amp;|if_like|: \stars&amp;maybe\cr \.{ifndef}&amp;|if_like|: \stars&amp;maybe\cr \.{include}&amp;|if_like|: \stars&amp;maybe\cr \.{inline}&amp;|int_like|: \stars&amp;maybe\cr \.{int}&amp;|raw_int|: \stars&amp;maybe\cr \.{jmp\_buf}&amp;|raw_int|: \stars&amp;maybe\cr \.{ldiv\_t}&amp;|raw_int|: \stars&amp;maybe\cr \.{line}&amp;|if_like|: \stars&amp;maybe\cr \.{long}&amp;|raw_int|: \stars&amp;maybe\cr \.{make\_pair}&amp;|ftemplate|: \.{\\\\\{make\\\_pair\}}&amp;maybe\cr \.{mutable}&amp;|int_like|: \stars&amp;maybe\cr \.{namespace}&amp;|struct_like|: \stars&amp;maybe\cr \.{new}&amp;|new_like|: \stars&amp;maybe\cr \.{not}&amp;|alfop|: \stars&amp;yes\cr \.{not\_eq}&amp;|alfop|: \stars&amp;yes\cr \.{NULL}&amp;|exp|: \.{\\NULL}&amp;yes\cr \.{offsetof}&amp;|raw_int|: \stars&amp;maybe\cr \.{operator}&amp;|operator_like|: \stars&amp;maybe\cr \.{or}&amp;|alfop|: \stars&amp;yes\cr \.{or\_eq}&amp;|alfop|: \stars&amp;yes\cr \.{pragma}&amp;|if_like|: \stars&amp;maybe\cr \.{private}&amp;|public_like|: \stars&amp;maybe\cr \.{protected}&amp;|public_like|: \stars&amp;maybe\cr \.{ptrdiff\_t}&amp;|raw_int|: \stars&amp;maybe\cr \.{public}&amp;|public_like|: \stars&amp;maybe\cr \.{register}&amp;|int_like|: \stars&amp;maybe\cr \.{reinterpret\_cast}&amp;|raw_int|: \stars&amp;maybe\cr \.{return}&amp;|case_like|: \stars&amp;maybe\cr \.{short}&amp;|raw_int|: \stars&amp;maybe\cr \.{sig\_atomic\_t}&amp;|raw_int|: \stars&amp;maybe\cr \.{signed}&amp;|raw_int|: \stars&amp;maybe\cr \.{size\_t}&amp;|raw_int|: \stars&amp;maybe\cr \.{sizeof}&amp;|sizeof_like|: \stars&amp;maybe\cr \.{static}&amp;|int_like|: \stars&amp;maybe\cr \.{static\_cast}&amp;|raw_int|: \stars&amp;maybe\cr \.{struct}&amp;|struct_like|: \stars&amp;maybe\cr \.{switch}&amp;|for_like|: \stars&amp;maybe\cr \.{template}&amp;|template_like|: \stars&amp;maybe\cr \.{TeX}&amp;|exp|: \.{\\TeX}&amp;yes\cr \.{this}&amp;|exp|: \.{\\this}&amp;yes\cr \.{throw}&amp;|case_like|: \stars&amp;maybe\cr \.{time\_t}&amp;|raw_int|: \stars&amp;maybe\cr \.{try}&amp;|else_like|: \stars&amp;maybe\cr \.{typedef}&amp;|typedef_like|: \stars&amp;maybe\cr \.{typeid}&amp;|raw_int|: \stars&amp;maybe\cr \.{typename}&amp;|struct_like|: \stars&amp;maybe\cr \.{undef}&amp;|if_like|: \stars&amp;maybe\cr \.{union}&amp;|struct_like|: \stars&amp;maybe\cr \.{unsigned}&amp;|raw_int|: \stars&amp;maybe\cr \.{using}&amp;|int_like|: \stars&amp;maybe\cr \.{va\_dcl}&amp;|decl|: \stars&amp;maybe\cr \.{va\_list}&amp;|raw_int|: \stars&amp;maybe\cr \.{virtual}&amp;|int_like|: \stars&amp;maybe\cr \.{void}&amp;|raw_int|: \stars&amp;maybe\cr \.{volatile}&amp;|const_like|: \stars&amp;maybe\cr \.{wchar\_t}&amp;|raw_int|: \stars&amp;maybe\cr \.{while}&amp;|for_like|: \stars&amp;maybe\cr \.{xor}&amp;|alfop|: \stars&amp;yes\cr \.{xor\_eq}&amp;|alfop|: \stars&amp;yes\cr \.{@@,}&amp;|insert|: \.{\\,}&amp;maybe\cr \.{@@\v}&amp;|insert|:  |opt| \.0&amp;maybe\cr \.{@@/}&amp;|insert|:  |force|&amp;no\cr \.{@@\#}&amp;|insert|:  |big_force|&amp;no\cr \.{@@+}&amp;|insert|:  |big_cancel| \.{\{\}} |break_space|   \.{\{\}} |big_cancel|&amp;no\cr \.{@@;}&amp;|semi|: &amp;maybe\cr \.{@@[@q]@&gt;}&amp;|begin_arg|: &amp;maybe\cr \.{@q[@&gt;@@]}&amp;|end_arg|: &amp;maybe\cr \.{@@\&amp;}&amp;|insert|: \.{\\J}&amp;maybe\cr \.{@@h}&amp;|insert|: |force| \.{\\ATH} |force|&amp;no\cr \.{@

@&lt;}\thinspace section name\thinspace\.{@@&gt;}&amp;|section_scrap|:
 \.{\\X}$n$\.:translated section name\.{\\X}&amp;maybe\cr
\.{@@(@q)@&gt;}\thinspace section name\thinspace\.{@@&gt;}&amp;|section_scrap|:
 \.{\\X}$n$\.{:\\.\{}section name with special characters
      quoted\.{\ \}\\X}&amp;maybe\cr
\.{/*}comment\.{*/}&amp;|insert|: |cancel|
      \.{\\C\{}translated comment\.\} |force|&amp;no\cr
\.{//}comment&amp;|insert|: |cancel|
      \.{\\SHC\{}translated comment\.\} |force|&amp;no\cr
}

\smallskip
The construction \.{@@t}\thinspace stuff\/\thinspace\.{@@&gt;} contributes
\.{\\hbox\{}\thinspace  stuff\/\thinspace\.\} to the following scrap.

@i prod.w
</t>
<t tx="ekr.20050502102905.213">@* Implementing the productions. More specifically, a scrap is a structure consisting of a category |cat| and a |text_pointer| |trans|, which points to the translation in |tok_start|.  When \CEE/ text is to be processed with the grammar above, we form an array |scrap_info| containing the initial scraps. Our production rules have the nice property that the right-hand side is never longer than the left-hand side. Therefore it is convenient to use sequential allocation for the current sequence of scraps. Five pointers are used to manage the parsing:  \yskip\hang |pp| is a pointer into |scrap_info|.  We will try to match the category codes |pp-&gt;cat,@,@,(pp+1)-&gt;cat|$,\,\,\ldots\,$ to the left-hand sides of productions.  \yskip\hang |scrap_base|, |lo_ptr|, |hi_ptr|, and |scrap_ptr| are such that the current sequence of scraps appears in positions |scrap_base| through |lo_ptr| and |hi_ptr| through |scrap_ptr|, inclusive, in the |cat| and |trans| arrays. Scraps located between |scrap_base| and |lo_ptr| have been examined, while those in positions |&gt;=hi_ptr| have not yet been looked at by the parsing process.  \yskip\noindent Initially |scrap_ptr| is set to the position of the final scrap to be parsed, and it doesn't change its value. The parsing process makes sure that |lo_ptr&gt;=pp+3|, since productions have as many as four terms, by moving scraps from |hi_ptr| to |lo_ptr|. If there are fewer than |pp+3| scraps left, the positions up to |pp+3| are filled with blanks that will not match in any productions. Parsing stops when |pp==lo_ptr+1| and |hi_ptr==scrap_ptr+1|.  Since the |scrap| structure will later be used for other purposes, we declare its second element as a union.

@&lt;Typedef declarations@&gt;=
typedef struct {
  eight_bits cat;
  eight_bits mathness;
  union {
    text_pointer Trans;
    @&lt;Rest of |trans_plus| union@&gt;@;
  } trans_plus;
} scrap;
typedef scrap *scrap_pointer;</t>
<t tx="ekr.20050502102905.214">@ @d trans trans_plus.Trans /* translation texts of scraps */

@&lt;Global variables@&gt;=
scrap scrap_info[max_scraps]; /* memory array for scraps */
scrap_pointer scrap_info_end=scrap_info+max_scraps -1; /* end of |scrap_info| */
scrap_pointer pp; /* current position for reducing productions */
scrap_pointer scrap_base; /* beginning of the current scrap sequence */
scrap_pointer scrap_ptr; /* ending of the current scrap sequence */
scrap_pointer lo_ptr; /* last scrap that has been examined */
scrap_pointer hi_ptr; /* first scrap that has not been examined */
scrap_pointer max_scr_ptr; /* largest value assumed by |scrap_ptr| */

@ @&lt;Set init...@&gt;=
scrap_base=scrap_info+1;
max_scr_ptr=scrap_ptr=scrap_info;
</t>
<t tx="ekr.20050502102905.215">@ Token lists in |@!tok_mem| are composed of the following kinds of items for \TEX/ output.  \yskip\item{$\bullet$}Character codes and special codes like |force| and |math_rel| represent themselves;  \item{$\bullet$}|id_flag+p| represents \.{\\\\\{{\rm identifier $p$}\}};  \item{$\bullet$}|res_flag+p| represents \.{\\\&amp;\{{\rm identifier $p$}\}};  \item{$\bullet$}|section_flag+p| represents section name |p|;  \item{$\bullet$}|tok_flag+p| represents token list number |p|;  \item{$\bullet$}|inner_tok_flag+p| represents token list number |p|, to be translated without line-break controls.

@d id_flag 10240 /* signifies an identifier */
@d res_flag 2*id_flag /* signifies a reserved word */
@d section_flag 3*id_flag /* signifies a section name */
@d tok_flag 4*id_flag /* signifies a token list */
@d inner_tok_flag 5*id_flag /* signifies a token list in `\pb' */

@c
void
print_text(p) /* prints a token list for debugging; not used in |main| */
text_pointer p;
{
  token_pointer j; /* index into |tok_mem| */
  sixteen_bits r; /* remainder of token after the flag has been stripped off */
  if (p&gt;=text_ptr) printf("BAD");
  else for (j=*p; j&lt;*(p+1); j++) {
    r=*j%id_flag;
    switch (*j/id_flag) {
      case 1: printf("\\\\{"@q}@&gt;); print_id((name_dir+r)); printf(@q{@&gt;"}");
        break; /* |id_flag| */
      case 2: printf("\\&amp;{"@q}@&gt;); print_id((name_dir+r)); printf(@q{@&gt;"}");
        break; /* |res_flag| */
      case 3: printf("&lt;"); print_section_name((name_dir+r)); printf("&gt;");
        break; /* |section_flag| */
      case 4: printf("[[%d]]",r); break; /* |tok_flag| */
      case 5: printf("|[[%d]]|",r); break; /* |inner_tok_flag| */
      default: @&lt;Print token |r| in symbolic form@&gt;;
    }
  }
  fflush(stdout);
}</t>
<t tx="ekr.20050502102905.216">@ @&lt;Print token |r|...@&gt;=
switch (r) {
  case math_rel: printf("\\mathrel{"@q}@&gt;); break;
  case big_cancel: printf("[ccancel]"); break;
  case cancel: printf("[cancel]"); break;
  case indent: printf("[indent]"); break;
  case outdent: printf("[outdent]"); break;
  case backup: printf("[backup]"); break;
  case opt: printf("[opt]"); break;
  case break_space: printf("[break]"); break;
  case force: printf("[force]"); break;
  case big_force: printf("[fforce]"); break;
  case preproc_line: printf("[preproc]"); break;
  case quoted_char: j++; printf("[%o]",(unsigned)*j); break;
  case end_translation: printf("[quit]"); break;
  case inserted: printf("[inserted]"); break;
  default: putxchar(r);
}
</t>
<t tx="ekr.20050502102905.217">@ The production rules listed above are embedded directly into \.{CWEAVE}, since it is easier to do this than to write an interpretive system that would handle production systems in general. Several macros are defined here so that the program for each production is fairly short.  All of our productions conform to the general notion that some |k| consecutive scraps starting at some position |j| are to be replaced by a single scrap of some category |c| whose translation is composed from the translations of the disappearing scraps. After this production has been applied, the production pointer |pp| should change by an amount |d|. Such a production can be represented by the quadruple |(j,k,c,d)|. For example, the production `|exp@,comma@,exp| $\RA$ |exp|' would be represented by `|(pp,3,exp,-2)|'; in this case the pointer |pp| should decrease by 2 after the production has been applied, because some productions with |exp| in their second or third positions might now match, but no productions have |exp| in the fourth position of their left-hand sides. Note that the value of |d| is determined by the whole collection of productions, not by an individual one. The determination of |d| has been done by hand in each case, based on the full set of productions but not on the grammar of \CEE/ or on the rules for constructing the initial scraps.  We also attach a serial number to each production, so that additional information is available when debugging. For example, the program below contains the statement `|reduce(pp,3,exp,-2,4)|' when it implements the production just mentioned.  Before calling |reduce|, the program should have appended the tokens of the new translation to the |tok_mem| array. We commonly want to append copies of several existing translations, and macros are defined to simplify these common cases. For example, \\{app2}|(pp)| will append the translations of two consecutive scraps, |pp-&gt;trans| and |(pp+1)-&gt;trans|, to the current token list. If the entire new translation is formed in this way, we write `|squash(j,k,c,d,n)|' instead of `|reduce(j,k,c,d,n)|'. For example, `|squash(pp,3,exp,-2,3)|' is an abbreviation for `\\{app3}|(pp); reduce(pp,3,exp,-2,3)|'.  A couple more words of explanation: Both |big_app| and |app| append a token (while |big_app1| to |big_app4| append the specified number of scrap translations) to the current token list. The difference between |big_app| and |app| is simply that |big_app| checks whether there can be a conflict between math and non-math tokens, and intercalates a `\.{\$}' token if necessary.  When in doubt what to use, use |big_app|.  The |mathness| is an attribute of scraps that says whether they are to be printed in a math mode context or not.  It is separate from the ``part of speech'' (the |cat|) because to make each |cat| have a fixed |mathness| (as in the original \.{WEAVE}) would multiply the number of necessary production rules.  The low two bits (i.e. |mathness % 4|) control the left boundary. (We need two bits because we allow cases |yes_math|, |no_math| and |maybe_math|, which can go either way.) The next two bits (i.e. |mathness / 4|) control the right boundary. If we combine two scraps and the right boundary of the first has a different mathness from the left boundary of the second, we insert a \.{\$} in between.  Similarly, if at printing time some irreducible scrap has a |yes_math| boundary the scrap gets preceded or followed by a \.{\$}. The left boundary is |maybe_math| if and only if the right boundary is.  The code below is an exact translation of the production rules into \CEE/, using such macros, and the reader should have no difficulty understanding the format by comparing the code with the symbolic productions as they were listed earlier.

@d no_math 2 /* should be in horizontal mode */
@d yes_math 1 /* should be in math mode */
@d maybe_math 0 /* works in either horizontal or math mode */
@d big_app2(a) big_app1(a);big_app1(a+1)
@d big_app3(a) big_app2(a);big_app1(a+2)
@d big_app4(a) big_app3(a);big_app1(a+3)
@d app(a) *(tok_ptr++)=a
@d app1(a) *(tok_ptr++)=tok_flag+(int)((a)-&gt;trans-tok_start)

@&lt;Global variables@&gt;=
int cur_mathness, init_mathness;
</t>
<t tx="ekr.20050502102905.218">@ @c
void
app_str(s)
char *s;
{
  while (*s) app_tok(*(s++));
}

void
big_app(a)
token a;
{
        if (a==' ' || (a&gt;=big_cancel &amp;&amp; a&lt;=big_force)) /* non-math token */ {
                if (cur_mathness==maybe_math) init_mathness=no_math;
                else if (cur_mathness==yes_math) app_str("{}$");
                cur_mathness=no_math;
        }
        else {
                if (cur_mathness==maybe_math) init_mathness=yes_math;
                else if (cur_mathness==no_math) app_str("${}");
                cur_mathness=yes_math;
        }
        app(a);
}

void
big_app1(a)
scrap_pointer a;
{
  switch (a-&gt;mathness % 4) { /* left boundary */
  case (no_math):
    if (cur_mathness==maybe_math) init_mathness=no_math;
    else if (cur_mathness==yes_math) app_str("{}$");
    cur_mathness=a-&gt;mathness / 4; /* right boundary */
    break;
  case (yes_math):
    if (cur_mathness==maybe_math) init_mathness=yes_math;
    else if (cur_mathness==no_math) app_str("${}");
    cur_mathness=a-&gt;mathness / 4; /* right boundary */
    break;
  case (maybe_math): /* no changes */ break;
  }
  app(tok_flag+(int)((a)-&gt;trans-tok_start));
}
</t>
<t tx="ekr.20050502102905.219">@ In \CEE/, new specifier names can be defined via |typedef|, and we want to make the parser recognize future occurrences of the identifier thus defined as specifiers.  This is done by the procedure |make_reserved|, which changes the |ilk| of the relevant identifier.  We first need a procedure to recursively seek the first identifier in a token list, because the identifier might be enclosed in parentheses, as when one defines a function returning a pointer.  If the first identifier found is a keyword like `\&amp;{case}', we return the special value |case_found|; this prevents underlining of identifiers in case labels.  If the first identifier is the keyword `\&amp;{operator}', we give up; users who want to index definitions of overloaded \CPLUSPLUS/ operators should say, for example, `\.{@@!@@\^\\\&amp;\{operator\} \$+\{=\}\$@@&gt;}' (or, more properly alphebetized, `\.{@@!@@:operator+=\}\{\\\&amp;\{operator\} \$+\{=\}\$@@&gt;}').

@d no_ident_found (token_pointer)0 /* distinct from any identifier token */
@d case_found (token_pointer)1 /* likewise */
@d operator_found (token_pointer)2 /* likewise */

@c
token_pointer
find_first_ident(p)
text_pointer p;
{
  token_pointer q; /* token to be returned */
  token_pointer j; /* token being looked at */
  sixteen_bits r; /* remainder of token after the flag has been stripped off */
  if (p&gt;=text_ptr) confusion("find_first_ident");
  for (j=*p; j&lt;*(p+1); j++) {
    r=*j%id_flag;
    switch (*j/id_flag) {
      case 2: /* |res_flag| */
        if (name_dir[r].ilk==case_like) return case_found;
        if (name_dir[r].ilk==operator_like) return operator_found;
        if (name_dir[r].ilk!=raw_int) break;
      case 1: return j;
      case 4: case 5: /* |tok_flag| or |inner_tok_flag| */
        if ((q=find_first_ident(tok_start+r))!=no_ident_found)
          return q;
      default: ; /* char, |section_flag|, fall thru: move on to next token */
        if (*j==inserted) return no_ident_found; /* ignore inserts */
        else if (*j==qualifier) j++; /* bypass namespace qualifier */
    }
  }
  return no_ident_found;
}</t>
<t tx="ekr.20050502102905.22">@ The following code opens the input files. @^system dependencies@&gt;

@&lt;Open input files@&gt;=
if ((web_file=fopen(web_file_name,"r"))==NULL) {
  strcpy(web_file_name,alt_web_file_name);
  if ((web_file=fopen(web_file_name,"r"))==NULL)
       fatal("! Cannot open input file ", web_file_name);
}
@.Cannot open input file@&gt;
@.Cannot open change file@&gt;
web_file_open=1;
if ((change_file=fopen(change_file_name,"r"))==NULL)
       fatal("! Cannot open change file ", change_file_name);
</t>
<t tx="ekr.20050502102905.220">@ The scraps currently being parsed must be inspected for any occurrence of the identifier that we're making reserved; hence the |for| loop below.

@c
void
make_reserved(p) /* make the first identifier in |p-&gt;trans| like |int| */
scrap_pointer p;
{
  sixteen_bits tok_value; /* the name of this identifier, plus its flag*/
  token_pointer tok_loc; /* pointer to |tok_value| */
  if ((tok_loc=find_first_ident(p-&gt;trans))&lt;=operator_found)
    return; /* this should not happen */
  tok_value=*tok_loc;
  for (;p&lt;=scrap_ptr; p==lo_ptr? p=hi_ptr: p++) {
    if (p-&gt;cat==exp) {
      if (**(p-&gt;trans)==tok_value) {
        p-&gt;cat=raw_int;
        **(p-&gt;trans)=tok_value%id_flag+res_flag;
      }
    }
  }
  (name_dir+(sixteen_bits)(tok_value%id_flag))-&gt;ilk=raw_int;
  *tok_loc=tok_value%id_flag+res_flag;
}</t>
<t tx="ekr.20050502102905.221">@ In the following situations we want to mark the occurrence of an identifier as a definition: when |make_reserved| is just about to be used; after a specifier, as in |char **argv|; before a colon, as in \\{found}:; and in the declaration of a function, as in \\{main}()$\{\ldots;\}$.  This is accomplished by the invocation of |make_underlined| at appropriate times.  Notice that, in the declaration of a function, we find out that the identifier is being defined only after it has been swallowed up by an |exp|.

@c
void
make_underlined(p)
/* underline the entry for the first identifier in |p-&gt;trans| */
scrap_pointer p;
{
  token_pointer tok_loc; /* where the first identifier appears */
  if ((tok_loc=find_first_ident(p-&gt;trans))&lt;=operator_found)
    return; /* this happens, for example, in |case found:| */
  xref_switch=def_flag;
  underline_xref(*tok_loc%id_flag+name_dir);
}</t>
<t tx="ekr.20050502102905.222">@ We cannot use |new_xref| to underline a cross-reference at this point because this would just make a new cross-reference at the end of the list. We actually have to search through the list for the existing cross-reference.

@&lt;Predeclaration of procedures@&gt;=
void  underline_xref();

@ @c
void
underline_xref(p)
name_pointer p;
{
  xref_pointer q=(xref_pointer)p-&gt;xref; /* pointer to cross-reference being examined */
  xref_pointer r; /* temporary pointer for permuting cross-references */
  sixteen_bits m; /* cross-reference value to be installed */
  sixteen_bits n; /* cross-reference value being examined */
  if (no_xref) return;
  m=section_count+xref_switch;
  while (q != xmem) {
    n=q-&gt;num;
    if (n==m) return;
    else if (m==n+def_flag) {
        q-&gt;num=m; return;
    }
    else if (n&gt;=def_flag &amp;&amp; n&lt;m) break;
    q=q-&gt;xlink;
  }
  @&lt;Insert new cross-reference at |q|, not at beginning of list@&gt;;
}
</t>
<t tx="ekr.20050502102905.223">@ We get to this section only when the identifier is one letter long, so it didn't get a non-underlined entry during phase one.  But it may have got some explicitly underlined entries in later sections, so in order to preserve the numerical order of the entries in the index, we have to insert the new cross-reference not at the beginning of the list (namely, at |p-&gt;xref|), but rather right before |q|.

@&lt;Insert new cross-reference at |q|, not at beginning of list@&gt;=
  append_xref(0); /* this number doesn't matter */
  xref_ptr-&gt;xlink=(xref_pointer)p-&gt;xref; r=xref_ptr;
  p-&gt;xref=(char*)xref_ptr;
  while (r-&gt;xlink!=q) {r-&gt;num=r-&gt;xlink-&gt;num; r=r-&gt;xlink;}
  r-&gt;num=m; /* everything from |q| on is left undisturbed */
</t>
<t tx="ekr.20050502102905.224">@ Now here's the |reduce| procedure used in our code for productions.  The `|freeze_text|' macro is used to give official status to a token list. Before saying |freeze_text|, items are appended to the current token list, and we know that the eventual number of this token list will be the current value of |text_ptr|. But no list of that number really exists as yet, because no ending point for the current list has been stored in the |tok_start| array. After saying |freeze_text|, the old current token list becomes legitimate, and its number is the current value of |text_ptr-1| since |text_ptr| has been increased. The new current token list is empty and ready to be appended to. Note that |freeze_text| does not check to see that |text_ptr| hasn't gotten too large, since it is assumed that this test was done beforehand.

@d freeze_text *(++text_ptr)=tok_ptr

@c
void
reduce(j,k,c,d,n)
scrap_pointer j;
eight_bits c;
short k, d, n;
{
  scrap_pointer i, i1; /* pointers into scrap memory */
  j-&gt;cat=c; j-&gt;trans=text_ptr;
  j-&gt;mathness=4*cur_mathness+init_mathness;
  freeze_text;
  if (k&gt;1) {
    for (i=j+k, i1=j+1; i&lt;=lo_ptr; i++, i1++) {
      i1-&gt;cat=i-&gt;cat; i1-&gt;trans=i-&gt;trans;
      i1-&gt;mathness=i-&gt;mathness;
    }
    lo_ptr=lo_ptr-k+1;
  }
  pp=(pp+d&lt;scrap_base? scrap_base: pp+d);
  @&lt;Print a snapshot of the scrap list if debugging @&gt;;
  pp--; /* we next say |pp++| */
}</t>
<t tx="ekr.20050502102905.225">@ Here's the |squash| procedure, which takes advantage of the simplification that occurs when |k==1|.

@c
void
squash(j,k,c,d,n)
scrap_pointer j;
eight_bits c;
short k, d, n;
{
  scrap_pointer i; /* pointers into scrap memory */
  if (k==1) {
    j-&gt;cat=c; pp=(pp+d&lt;scrap_base? scrap_base: pp+d);
    @&lt;Print a snapshot...@&gt;;
    pp--; /* we next say |pp++| */
    return;
  }
  for (i=j; i&lt;j+k; i++) big_app1(i);
  reduce(j,k,c,d,n);
}</t>
<t tx="ekr.20050502102905.226">@ If \.{CWEAVE} is being run in debugging mode, the production numbers and current stack categories will be printed out when |tracing| is set to 2; a sequence of two or more irreducible scraps will be printed out when |tracing| is set to 1.

@&lt;Global variables@&gt;=
int tracing; /* can be used to show parsing details */

@ @&lt;Print a snapsh...@&gt;=
{ scrap_pointer k; /* pointer into |scrap_info| */
  if (tracing==2) {
    printf("\n%d:",n);
    for (k=scrap_base; k&lt;=lo_ptr; k++) {
      if (k==pp) putxchar('*'); else putxchar(' ');
      if (k-&gt;mathness %4 ==  yes_math) putchar('+');
      else if (k-&gt;mathness %4 ==  no_math) putchar('-');
      print_cat(k-&gt;cat);
      if (k-&gt;mathness /4 ==  yes_math) putchar('+');
      else if (k-&gt;mathness /4 ==  no_math) putchar('-');
    }
    if (hi_ptr&lt;=scrap_ptr) printf("..."); /* indicate that more is coming */
  }
}
</t>
<t tx="ekr.20050502102905.227">@ The |translate| function assumes that scraps have been stored in positions |scrap_base| through |scrap_ptr| of |cat| and |trans|. It applies productions as much as possible. The result is a token list containing the translation of the given sequence of scraps.  After calling |translate|, we will have |text_ptr+3&lt;=max_texts| and |tok_ptr+6&lt;=max_toks|, so it will be possible to create up to three token lists with up to six tokens without checking for overflow. Before calling |translate|, we should have |text_ptr&lt;max_texts| and |scrap_ptr&lt;max_scraps|, since |translate| might add a new text and a new scrap before it checks for overflow.

@c
text_pointer
translate() /* converts a sequence of scraps */
{
  scrap_pointer i, /* index into |cat| */
  j; /* runs through final scraps */
  pp=scrap_base; lo_ptr=pp-1; hi_ptr=pp;
  @&lt;If tracing, print an indication of where we are@&gt;;
  @&lt;Reduce the scraps...@&gt;;
  @&lt;Combine the irreducible scraps that remain@&gt;;
}</t>
<t tx="ekr.20050502102905.228">@ @&lt;If tracing,...@&gt;=
if (tracing==2) {
  printf("\nTracing after l. %d:\n",cur_line); mark_harmless;
@.Tracing after...@&gt;
  if (loc&gt;buffer+50) {
    printf("...");
    term_write(loc-51,51);
  }
  else term_write(buffer,loc-buffer);
}
</t>
<t tx="ekr.20050502102905.229">@ And here now is the code that applies productions as long as possible. Before applying the production mechanism, we must make sure it has good input (at least four scraps, the length of the lhs of the longest rules), and that there is enough room in the memory arrays to hold the appended tokens and texts.  Here we use a very conservative test; it's more important to make sure the program will still work if we change the production rules (within reason) than to squeeze the last bit of space from the memory arrays.

@d safe_tok_incr 20
@d safe_text_incr 10
@d safe_scrap_incr 10

@&lt;Reduce the scraps using the productions until no more rules apply@&gt;=
while (1) {
  @&lt;Make sure the entries |pp| through |pp+3| of |cat| are defined@&gt;;
  if (tok_ptr+safe_tok_incr&gt;tok_mem_end) {
    if (tok_ptr&gt;max_tok_ptr) max_tok_ptr=tok_ptr;
    overflow("token");
  }
  if (text_ptr+safe_text_incr&gt;tok_start_end) {
    if (text_ptr&gt;max_text_ptr) max_text_ptr=text_ptr;
    overflow("text");
  }
  if (pp&gt;lo_ptr) break;
  init_mathness=cur_mathness=maybe_math;
  @&lt;Match a production...@&gt;;
}
</t>
<t tx="ekr.20050502102905.23">@ The |get_line| procedure is called when |loc&gt;limit|; it puts the next line of merged input into the buffer and updates the other variables appropriately. A space is placed at the right end of the line. This procedure returns |!input_has_ended| because we often want to check the value of that variable after calling the procedure.  If we've just changed from the |cur_file| to the |change_file|, or if the |cur_file| has changed, we tell \.{CTANGLE} to print this information in the \CEE/ file by means of the |print_where| flag.

@d max_sections 2000 /* number of identifiers, strings, section names;
  must be less than 10240 */

@&lt;Definitions that should agree with \.{CTANGLE} and \.{CWEAVE}@&gt;=
typedef unsigned short sixteen_bits;
sixteen_bits section_count; /* the current section number */
boolean changed_section[max_sections]; /* is the section changed? */
boolean change_pending; /* if the current change is not yet recorded in
  |changed_section[section_count]| */
boolean print_where=0; /* should \.{CTANGLE} print line and file info? */

@
@c
int get_line() /* inputs the next line */
{
  restart:
  if (changing &amp;&amp; include_depth==change_depth)
   @&lt;Read from |change_file| and maybe turn off |changing|@&gt;;
  if (! changing || include_depth&gt;change_depth) {
    @&lt;Read from |cur_file| and maybe turn on |changing|@&gt;;
    if (changing &amp;&amp; include_depth==change_depth) goto restart;
  }
  loc=buffer; *limit=' ';
  if (*buffer=='@@' &amp;&amp; (*(buffer+1)=='i' || *(buffer+1)=='I')) {
    loc=buffer+2;
    while (loc&lt;=limit &amp;&amp; (*loc==' '||*loc=='\t'||*loc=='"')) loc++;
    if (loc&gt;=limit) {
      err_print("! Include file name not given");
@.Include file name ...@&gt;
      goto restart;
    }
    if (include_depth&gt;=max_include_depth-1) {
      err_print("! Too many nested includes");
@.Too many nested includes@&gt;
      goto restart;
    }
    include_depth++; /* push input stack */
    @&lt;Try to open include file, abort push if unsuccessful, go to |restart|@&gt;;
  }
  return (!input_has_ended);
}</t>
<t tx="ekr.20050502102905.230">@ If we get to the end of the scrap list, category codes equal to zero are stored, since zero does not match anything in a production.

@&lt;Make sure the entries |pp| through |pp+3| of |cat| are defined@&gt;=
if (lo_ptr&lt;pp+3) {
  while (hi_ptr&lt;=scrap_ptr &amp;&amp; lo_ptr!=pp+3) {
    (++lo_ptr)-&gt;cat=hi_ptr-&gt;cat; lo_ptr-&gt;mathness=(hi_ptr)-&gt;mathness;
    lo_ptr-&gt;trans=(hi_ptr++)-&gt;trans;
  }
  for (i=lo_ptr+1;i&lt;=pp+3;i++) i-&gt;cat=0;
}
</t>
<t tx="ekr.20050502102905.231">@ Let us consider the big switch for productions now, before looking at its context. We want to design the program so that this switch works, so we might as well not keep ourselves in suspense about exactly what code needs to be provided with a proper environment.

@d cat1 (pp+1)-&gt;cat
@d cat2 (pp+2)-&gt;cat
@d cat3 (pp+3)-&gt;cat
@d lhs_not_simple (pp-&gt;cat!=public_like
        &amp;&amp; pp-&gt;cat!=semi
        &amp;&amp; pp-&gt;cat!=prelangle
        &amp;&amp; pp-&gt;cat!=prerangle
        &amp;&amp; pp-&gt;cat!=template_like
        &amp;&amp; pp-&gt;cat!=new_like
        &amp;&amp; pp-&gt;cat!=new_exp
        &amp;&amp; pp-&gt;cat!=ftemplate
        &amp;&amp; pp-&gt;cat!=raw_ubin
        &amp;&amp; pp-&gt;cat!=const_like
        &amp;&amp; pp-&gt;cat!=raw_int
        &amp;&amp; pp-&gt;cat!=operator_like)
 /* not a production with left side length 1 */

@&lt;Match a production at |pp|, or increase |pp| if there is no match@&gt;= {
  if (cat1==end_arg &amp;&amp; lhs_not_simple)
    if (pp-&gt;cat==begin_arg) squash(pp,2,exp,-2,124);
    else squash(pp,2,end_arg,-1,125);
  else if (cat1==insert) squash(pp,2,pp-&gt;cat,-2,0);
  else if (cat2==insert) squash(pp+1,2,(pp+1)-&gt;cat,-1,0);
  else if (cat3==insert) squash(pp+2,2,(pp+2)-&gt;cat,0,0);
  else
  switch (pp-&gt;cat) {
    case exp: @&lt;Cases for |exp|@&gt;; @+break;
    case lpar: @&lt;Cases for |lpar|@&gt;; @+break;
    case unop: @&lt;Cases for |unop|@&gt;; @+break;
    case ubinop: @&lt;Cases for |ubinop|@&gt;; @+break;
    case binop: @&lt;Cases for |binop|@&gt;; @+break;
    case cast: @&lt;Cases for |cast|@&gt;; @+break;
    case sizeof_like: @&lt;Cases for |sizeof_like|@&gt;; @+break;
    case int_like: @&lt;Cases for |int_like|@&gt;; @+break;
    case public_like: @&lt;Cases for |public_like|@&gt;; @+break;
    case colcol: @&lt;Cases for |colcol|@&gt;; @+break;
    case decl_head: @&lt;Cases for |decl_head|@&gt;; @+break;
    case decl: @&lt;Cases for |decl|@&gt;; @+break;
    case base: @&lt;Cases for |base|@&gt;; @+break;
    case struct_like: @&lt;Cases for |struct_like|@&gt;; @+break;
    case struct_head: @&lt;Cases for |struct_head|@&gt;; @+break;
    case fn_decl: @&lt;Cases for |fn_decl|@&gt;; @+break;
    case function: @&lt;Cases for |function|@&gt;; @+break;
    case lbrace: @&lt;Cases for |lbrace|@&gt;; @+break;
    case if_like: @&lt;Cases for |if_like|@&gt;; @+break;
    case else_like: @&lt;Cases for |else_like|@&gt;; @+break;
    case else_head: @&lt;Cases for |else_head|@&gt;; @+break;
    case if_clause: @&lt;Cases for |if_clause|@&gt;; @+break;
    case if_head: @&lt;Cases for |if_head|@&gt;; @+break;
    case do_like: @&lt;Cases for |do_like|@&gt;; @+break;
    case case_like: @&lt;Cases for |case_like|@&gt;; @+break;
    case catch_like: @&lt;Cases for |catch_like|@&gt;; @+break;
    case tag: @&lt;Cases for |tag|@&gt;; @+break;
    case stmt: @&lt;Cases for |stmt|@&gt;; @+break;
    case semi: @&lt;Cases for |semi|@&gt;; @+break;
    case lproc: @&lt;Cases for |lproc|@&gt;; @+break;
    case section_scrap: @&lt;Cases for |section_scrap|@&gt;; @+break;
    case insert: @&lt;Cases for |insert|@&gt;; @+break;
    case prelangle: @&lt;Cases for |prelangle|@&gt;; @+break;
    case prerangle: @&lt;Cases for |prerangle|@&gt;; @+break;
    case langle: @&lt;Cases for |langle|@&gt;; @+break;
    case template_like: @&lt;Cases for |template_like|@&gt;; @+break;
    case new_like: @&lt;Cases for |new_like|@&gt;; @+break;
    case new_exp: @&lt;Cases for |new_exp|@&gt;; @+break;
    case ftemplate: @&lt;Cases for |ftemplate|@&gt;; @+break;
    case for_like: @&lt;Cases for |for_like|@&gt;; @+break;
    case raw_ubin: @&lt;Cases for |raw_ubin|@&gt;; @+break;
    case const_like: @&lt;Cases for |const_like|@&gt;; @+break;
    case raw_int: @&lt;Cases for |raw_int|@&gt;; @+break;
    case operator_like: @&lt;Cases for |operator_like|@&gt;; @+break;
    case typedef_like: @&lt;Cases for |typedef_like|@&gt;; @+break;
    case delete_like: @&lt;Cases for |delete_like|@&gt;; @+break;
    case question: @&lt;Cases for |question|@&gt;; @+break;
  }
  pp++; /* if no match was found, we move to the right */
}
</t>
<t tx="ekr.20050502102905.232"></t>
<t tx="ekr.20050502102905.233">@ Now comes the code that tries to match each production starting with a particular type of scrap. Whenever a match is discovered, the |squash| or |reduce| macro will cause the appropriate action to be performed, followed by |goto found|.

@&lt;Cases for |exp|@&gt;=
if (cat1==lbrace || cat1==int_like || cat1==decl) {
  make_underlined(pp); big_app1(pp); big_app(indent); app(indent);
  reduce(pp,1,fn_decl,0,1);
}
else if (cat1==unop) squash(pp,2,exp,-2,2);
else if ((cat1==binop || cat1==ubinop) &amp;&amp; cat2==exp)
        squash(pp,3,exp,-2,3);
else if (cat1==comma &amp;&amp; cat2==exp) {
  big_app2(pp);
  app(opt); app('9'); big_app1(pp+2); reduce(pp,3,exp,-2,4);
}
else if (cat1==lpar &amp;&amp; cat2==rpar &amp;&amp; cat3==colon) squash(pp+3,1,base,0,5);
else if (cat1==cast &amp;&amp; cat2==colon) squash(pp+2,1,base,0,5);
else if (cat1==semi) squash(pp,2,stmt,-1,6);
else if (cat1==colon) {
  make_underlined (pp);  squash(pp,2,tag,-1,7);
}
else if (cat1==rbrace) squash(pp,1,stmt,-1,8);
else if (cat1==lpar &amp;&amp; cat2==rpar &amp;&amp; (cat3==const_like || cat3==case_like)) {
  big_app1(pp+2); big_app(' '); big_app1(pp+3); reduce(pp+2,2,rpar,0,9);
}
else if (cat1==cast &amp;&amp; (cat2==const_like || cat2==case_like)) {
  big_app1(pp+1); big_app(' '); big_app1(pp+2); reduce(pp+1,2,cast,0,9);
}
else if (cat1==exp || cat1==cast) squash(pp,2,exp,-2,10);
</t>
<t tx="ekr.20050502102905.234">@ @&lt;Cases for |lpar|@&gt;=
if ((cat1==exp||cat1==ubinop) &amp;&amp; cat2==rpar) squash(pp,3,exp,-2,11);
else if (cat1==rpar) {
  big_app1(pp); app('\\'); app(','); big_app1(pp+1);
@.\\,@&gt;
  reduce(pp,2,exp,-2,12);
}
else if ((cat1==decl_head || cat1==int_like || cat1==cast) &amp;&amp; cat2==rpar)
 squash(pp,3,cast,-2,13);
else if ((cat1==decl_head || cat1==int_like || cat1==exp) &amp;&amp; cat2==comma) {
  big_app3(pp); app(opt); app('9'); reduce(pp,3,lpar,-1,14);
}
else if (cat1==stmt || cat1==decl) {
  big_app2(pp); big_app(' '); reduce(pp,2,lpar,-1,15);
}
</t>
<t tx="ekr.20050502102905.235">@ @&lt;Cases for |unop|@&gt;=
if (cat1==exp || cat1==int_like) squash(pp,2,exp,-2,16);
</t>
<t tx="ekr.20050502102905.236">@ @&lt;Cases for |ubinop|@&gt;=
if (cat1==cast &amp;&amp; cat2==rpar) {
  big_app('{'); big_app1(pp); big_app('}'); big_app1(pp+1);
  reduce(pp,2,cast,-2,17);
}
else if (cat1==exp || cat1==int_like) {
  big_app('{'); big_app1(pp); big_app('}'); big_app1(pp+1);
  reduce(pp,2,cat1,-2,18);
}
else if (cat1==binop) {
  big_app(math_rel); big_app1(pp); big_app('{'); big_app1(pp+1); big_app('}');
  big_app('}'); reduce(pp,2,binop,-1,19);
}
</t>
<t tx="ekr.20050502102905.237">@ @&lt;Cases for |binop|@&gt;=
if (cat1==binop) {
  big_app(math_rel); big_app('{'); big_app1(pp); big_app('}');
  big_app('{'); big_app1(pp+1); big_app('}');
  big_app('}'); reduce(pp,2,binop,-1,20);
}
</t>
<t tx="ekr.20050502102905.238">@ @&lt;Cases for |cast|@&gt;=
if (cat1==lpar) squash(pp,2,lpar,-1,21);
else if (cat1==exp) {
  big_app1(pp); big_app(' '); big_app1(pp+1); reduce(pp,2,exp,-2,21);
}
else if (cat1==semi) squash(pp,1,exp,-2,22);
</t>
<t tx="ekr.20050502102905.239">@ @&lt;Cases for |sizeof_like|@&gt;=
if (cat1==cast) squash(pp,2,exp,-2,23);
else if (cat1==exp) {
  big_app1(pp); big_app(' '); big_app1(pp+1); reduce(pp,2,exp,-2,24);
}
</t>
<t tx="ekr.20050502102905.24">@ When an \.{@@i} line is found in the |cur_file|, we must temporarily stop reading it and start reading from the named include file.  The \.{@@i} line should give a complete file name with or without double quotes. If the environment variable \.{CWEBINPUTS} is set, or if the compiler flag of the same name was defined at compile time, \.{CWEB} will look for include files in the directory thus named, if it cannot find them in the current directory. (Colon-separated paths are not supported.) The remainder of the \.{@@i} line after the file name is ignored.

@d too_long() {include_depth--;
        err_print("! Include file name too long"); goto restart;}

@&lt;Include files@&gt;=
#include &lt;stdlib.h&gt; /* declaration of |getenv| and |exit| */
</t>
<t tx="ekr.20050502102905.240">@ @&lt;Cases for |int_like|@&gt;=
if (cat1==int_like|| cat1==struct_like) {
  big_app1(pp); big_app(' '); big_app1(pp+1); reduce(pp,2,cat1,-2,25);
}
else if (cat1==exp &amp;&amp; (cat2==raw_int||cat2==struct_like))
  squash(pp,2,int_like,-2,26);
else if (cat1==exp || cat1==ubinop || cat1==colon) {
  big_app1(pp); big_app(' '); reduce(pp,1,decl_head,-1,27);
}
else if (cat1==semi || cat1==binop) squash(pp,1,decl_head,0,28);
</t>
<t tx="ekr.20050502102905.241">@ @&lt;Cases for |public_like|@&gt;=
if (cat1==colon) squash(pp,2,tag,-1,29);
else squash(pp,1,int_like,-2,30);
</t>
<t tx="ekr.20050502102905.242">@ @&lt;Cases for |colcol|@&gt;=
if (cat1==exp||cat1==int_like) {
  app(qualifier); squash(pp,2,cat1,-2,31);
}@+else if (cat1==colcol) squash(pp,2,colcol,-1,32);
</t>
<t tx="ekr.20050502102905.243">@ @&lt;Cases for |decl_head|@&gt;=
if (cat1==comma) {
  big_app2(pp); big_app(' '); reduce(pp,2,decl_head,-1,33);
}
else if (cat1==ubinop) {
  big_app1(pp); big_app('{'); big_app1(pp+1); big_app('}');
  reduce(pp,2,decl_head,-1,34);
}
else if (cat1==exp &amp;&amp; cat2!=lpar &amp;&amp; cat2!=exp &amp;&amp; cat2!=cast) {
  make_underlined(pp+1); squash(pp,2,decl_head,-1,35);
}
else if ((cat1==binop||cat1==colon) &amp;&amp; cat2==exp &amp;&amp; (cat3==comma ||
    cat3==semi || cat3==rpar))
  squash(pp,3,decl_head,-1,36);
else if (cat1==cast) squash(pp,2,decl_head,-1,37);
else if (cat1==lbrace || cat1==int_like || cat1==decl) {
  big_app1(pp); big_app(indent); app(indent); reduce(pp,1,fn_decl,0,38);
}
else if (cat1==semi) squash(pp,2,decl,-1,39);
</t>
<t tx="ekr.20050502102905.244">@ @&lt;Cases for |decl|@&gt;=
if (cat1==decl) {
  big_app1(pp); big_app(force); big_app1(pp+1);
  reduce(pp,2,decl,-1,40);
}
else if (cat1==stmt || cat1==function) {
  big_app1(pp); big_app(big_force);
  big_app1(pp+1); reduce(pp,2,cat1,-1,41);
}
</t>
<t tx="ekr.20050502102905.245">@ @&lt;Cases for |base|@&gt;=
if (cat1==int_like || cat1==exp) {
  if (cat2==comma) {
    big_app1(pp); big_app(' '); big_app2(pp+1);
    app(opt); app('9'); reduce(pp,3,base,0,42);
  }
  else if (cat2==lbrace) {
    big_app1(pp); big_app(' '); big_app1(pp+1); big_app(' '); big_app1(pp+2);
    reduce(pp,3,lbrace,-2,43);
  }
}
</t>
<t tx="ekr.20050502102905.246">@ @&lt;Cases for |struct_like|@&gt;=
if (cat1==lbrace) {
  big_app1(pp); big_app(' '); big_app1(pp+1); reduce(pp,2,struct_head,0,44);
}
else if (cat1==exp||cat1==int_like) {
  if (cat2==lbrace || cat2==semi) {
    make_underlined(pp+1); make_reserved(pp+1);
    big_app1(pp); big_app(' '); big_app1(pp+1);
    if (cat2==semi) reduce(pp,2,decl_head,0,45);
    else {
      big_app(' '); big_app1(pp+2);reduce(pp,3,struct_head,0,46);
    }
  }
  else if (cat2==colon) squash(pp+2,1,base,2,47);
  else if (cat2!=base) {
    big_app1(pp); big_app(' '); big_app1(pp+1); reduce(pp,2,int_like,-2,48);
  }
}
</t>
<t tx="ekr.20050502102905.247">@ @&lt;Cases for |struct_head|@&gt;=
if ((cat1==decl || cat1==stmt || cat1==function) &amp;&amp; cat2==rbrace) {
  big_app1(pp); big_app(indent); big_app(force); big_app1(pp+1);
  big_app(outdent); big_app(force);  big_app1(pp+2);
  reduce(pp,3,int_like,-2,49);
}
else if (cat1==rbrace) {
  big_app1(pp); app_str("\\,"); big_app1(pp+1);
@.\\,@&gt;
  reduce(pp,2,int_like,-2,50);
}
</t>
<t tx="ekr.20050502102905.248">@ @&lt;Cases for |fn_decl|@&gt;=
if (cat1==decl) {
  big_app1(pp); big_app(force); big_app1(pp+1); reduce(pp,2,fn_decl,0,51);
}
else if (cat1==stmt) {
  big_app1(pp); app(outdent); app(outdent); big_app(force);
  big_app1(pp+1); reduce(pp,2,function,-1,52);
}
</t>
<t tx="ekr.20050502102905.249">@ @&lt;Cases for |function|@&gt;=
if (cat1==function || cat1==decl || cat1==stmt) {
  big_app1(pp); big_app(big_force); big_app1(pp+1); reduce(pp,2,cat1,-1,53);
}
</t>
<t tx="ekr.20050502102905.25">@
@&lt;Read from |cur_file| and maybe turn on |changing|@&gt;= {
  cur_line++;
  while (!input_ln(cur_file)) { /* pop the stack or quit */
    print_where=1;
    if (include_depth==0) {input_has_ended=1; break;}
    else {
      fclose(cur_file); include_depth--;
      if (changing &amp;&amp; include_depth==change_depth) break;
      cur_line++;
    }
  }
  if (!changing &amp;&amp; !input_has_ended)
   if (limit-buffer==change_limit-change_buffer)
    if (buffer[0]==change_buffer[0])
      if (change_limit&gt;change_buffer) check_change();
}
</t>
<t tx="ekr.20050502102905.250">@ @&lt;Cases for |lbrace|@&gt;=
if (cat1==rbrace) {
  big_app1(pp); app('\\'); app(','); big_app1(pp+1);
@.\\,@&gt;
  reduce(pp,2,stmt,-1,54);
}
else if ((cat1==stmt||cat1==decl||cat1==function) &amp;&amp; cat2==rbrace) {
  big_app(force); big_app1(pp);  big_app(indent); big_app(force);
  big_app1(pp+1); big_app(force); big_app(backup);  big_app1(pp+2);
  big_app(outdent); big_app(force); reduce(pp,3,stmt,-1,55);
}
else if (cat1==exp) {
  if (cat2==rbrace) squash(pp,3,exp,-2,56);
  else if (cat2==comma &amp;&amp; cat3==rbrace) squash(pp,4,exp,-2,56);
}
</t>
<t tx="ekr.20050502102905.251">@ @&lt;Cases for |if_like|@&gt;=
if (cat1==exp) {
  big_app1(pp); big_app(' '); big_app1(pp+1); reduce(pp,2,if_clause,0,57);
}
</t>
<t tx="ekr.20050502102905.252">@ @&lt;Cases for |else_like|@&gt;=
if (cat1==colon) squash(pp+1,1,base,1,58);
else if (cat1==lbrace) squash(pp,1,else_head,0,59);
else if (cat1==stmt) {
  big_app(force); big_app1(pp); big_app(indent); big_app(break_space);
  big_app1(pp+1); big_app(outdent); big_app(force);
  reduce(pp,2,stmt,-1,60);
}
</t>
<t tx="ekr.20050502102905.253">@ @&lt;Cases for |else_head|@&gt;=
if (cat1==stmt || cat1==exp) {
  big_app(force); big_app1(pp); big_app(break_space); app(noop);
  big_app(cancel); big_app1(pp+1); big_app(force);
  reduce(pp,2,stmt,-1,61);
}
</t>
<t tx="ekr.20050502102905.254">@ @&lt;Cases for |if_clause|@&gt;=
if (cat1==lbrace) squash(pp,1,if_head,0,62);
else if (cat1==stmt) {
  if (cat2==else_like) {
    big_app(force); big_app1(pp); big_app(indent); big_app(break_space);
    big_app1(pp+1); big_app(outdent); big_app(force); big_app1(pp+2);
    if (cat3==if_like) {
      big_app(' '); big_app1(pp+3); reduce(pp,4,if_like,0,63);
    }@+else reduce(pp,3,else_like,0,64);
  }
  else squash(pp,1,else_like,0,65);
}
</t>
<t tx="ekr.20050502102905.255">@ @&lt;Cases for |if_head|@&gt;=
if (cat1==stmt || cat1==exp) {
  if (cat2==else_like) {
    big_app(force); big_app1(pp); big_app(break_space); app(noop);
    big_app(cancel); big_app1(pp+1); big_app(force); big_app1(pp+2);
    if (cat3==if_like) {
      big_app(' '); big_app1(pp+3); reduce(pp,4,if_like,0,66);
    }@+else reduce(pp,3,else_like,0,67);
  }
  else squash(pp,1,else_head,0,68);
}
</t>
<t tx="ekr.20050502102905.256">@ @&lt;Cases for |do_like|@&gt;=
if (cat1==stmt &amp;&amp; cat2==else_like &amp;&amp; cat3==semi) {
  big_app1(pp); big_app(break_space); app(noop); big_app(cancel);
  big_app1(pp+1); big_app(cancel); app(noop); big_app(break_space);
  big_app2(pp+2); reduce(pp,4,stmt,-1,69);
}
</t>
<t tx="ekr.20050502102905.257">@ @&lt;Cases for |case_like|@&gt;=
if (cat1==semi) squash(pp,2,stmt,-1,70);
else if (cat1==colon) squash(pp,2,tag,-1,71);
else if (cat1==exp) {
  big_app1(pp); big_app(' ');  big_app1(pp+1);  reduce(pp,2,exp,-2,72);
}
</t>
<t tx="ekr.20050502102905.258">@ @&lt;Cases for |catch_like|@&gt;=
if (cat1==cast || cat1==exp) {
  big_app2(pp); big_app(indent); big_app(indent); reduce(pp,2,fn_decl,0,73);
}
</t>
<t tx="ekr.20050502102905.259">@ @&lt;Cases for |tag|@&gt;=
if (cat1==tag) {
  big_app1(pp); big_app(break_space); big_app1(pp+1); reduce(pp,2,tag,-1,74);
}
else if (cat1==stmt||cat1==decl||cat1==function) {
  big_app(force); big_app(backup); big_app1(pp); big_app(break_space);
  big_app1(pp+1); reduce(pp,2,cat1,-1,75);
}
</t>
<t tx="ekr.20050502102905.26">@
@&lt;Read from |change_file| and maybe turn off |changing|@&gt;= {
  change_line++;
  if (!input_ln(change_file)) {
    err_print("! Change file ended without @@z");
@.Change file ended...@&gt;
    buffer[0]='@@'; buffer[1]='z'; limit=buffer+2;
  }
  if (limit&gt;buffer) { /* check if the change has ended */
    if (change_pending) {
      if_section_start_make_pending(0);
      if (change_pending) {
        changed_section[section_count]=1; change_pending=0;
      }
    }
    *limit=' ';
    if (buffer[0]=='@@') {
      if (xisupper(buffer[1])) buffer[1]=tolower(buffer[1]);
      if (buffer[1]=='x' || buffer[1]=='y') {
        loc=buffer+2;
        err_print("! Where is the matching @@z?");
@.Where is the match...@&gt;
      }
      else if (buffer[1]=='z') {
        prime_the_change_buffer(); changing=!changing; print_where=1;
      }
    }
  }
}
</t>
<t tx="ekr.20050502102905.260">@ The user can decide at run-time whether short statements should be grouped together on the same line.

@d force_lines flags['f'] /* should each statement be on its own line? */
@&lt;Cases for |stmt|@&gt;=
if (cat1==stmt||cat1==decl||cat1==function) {
  big_app1(pp);
  if (cat1==function) big_app(big_force);
  else if (cat1==decl) big_app(big_force);
  else if (force_lines) big_app(force);
  else big_app(break_space);
  big_app1(pp+1); reduce(pp,2,cat1,-1,76);
}
</t>
<t tx="ekr.20050502102905.261">@ @&lt;Cases for |semi|@&gt;=
big_app(' '); big_app1(pp); reduce(pp,1,stmt,-1,77);
</t>
<t tx="ekr.20050502102905.262">@ @&lt;Cases for |lproc|@&gt;=
if (cat1==define_like) make_underlined(pp+2);
if (cat1==else_like || cat1==if_like ||cat1==define_like)
  squash(pp,2,lproc,0,78);
else if (cat1==rproc) {
  app(inserted); big_app2(pp); reduce(pp,2,insert,-1,79);
} else if (cat1==exp || cat1==function) {
  if (cat2==rproc) {
    app(inserted); big_app1(pp); big_app(' '); big_app2(pp+1);
    reduce(pp,3,insert,-1,80);
  }
  else if (cat2==exp &amp;&amp; cat3==rproc &amp;&amp; cat1==exp) {
    app(inserted); big_app1(pp); big_app(' '); big_app1(pp+1); app_str(" \\5");
@.\\5@&gt;
    big_app2(pp+2); reduce(pp,4,insert,-1,80);
  }
}
</t>
<t tx="ekr.20050502102905.263">@ @&lt;Cases for |section_scrap|@&gt;=
if (cat1==semi) {
  big_app2(pp); big_app(force); reduce(pp,2,stmt,-2,81);
}
else squash(pp,1,exp,-2,82);
</t>
<t tx="ekr.20050502102905.264">@ @&lt;Cases for |insert|@&gt;=
if (cat1)
  squash(pp,2,cat1,0,83);
</t>
<t tx="ekr.20050502102905.265">@ @&lt;Cases for |prelangle|@&gt;=
init_mathness=cur_mathness=yes_math;
app('&lt;'); reduce(pp,1,binop,-2,84);
</t>
<t tx="ekr.20050502102905.266">@ @&lt;Cases for |prerangle|@&gt;=
init_mathness=cur_mathness=yes_math;
app('&gt;'); reduce(pp,1,binop,-2,85);
</t>
<t tx="ekr.20050502102905.267">@ @&lt;Cases for |langle|@&gt;=
if (cat1==prerangle) {
  big_app1(pp); app('\\'); app(','); big_app1(pp+1);
@.\\,@&gt;
  reduce(pp,2,cast,-1,86);
}
else if (cat1==decl_head || cat1==int_like || cat1==exp) {
  if (cat2==prerangle) squash(pp,3,cast,-1,87);
  else if (cat2==comma) {
    big_app3(pp); app(opt); app('9'); reduce(pp,3,langle,0,88);
  }
}
</t>
<t tx="ekr.20050502102905.268">@ @&lt;Cases for |template_like|@&gt;=
if (cat1==exp &amp;&amp; cat2==prelangle) squash(pp+2,1,langle,2,89);
else if (cat1==exp || cat1==raw_int) {
  big_app1(pp); big_app(' '); big_app1(pp+1); reduce(pp,2,cat1,-2,90);
}@+ else squash(pp,1,raw_int,0,91);
</t>
<t tx="ekr.20050502102905.269">@ @&lt;Cases for |new_like|@&gt;=
if (cat1==lpar &amp;&amp; cat2==exp &amp;&amp; cat3==rpar) squash(pp,4,new_like,0,92);
else if (cat1==cast) {
  big_app1(pp); big_app(' '); big_app1(pp+1); reduce(pp,2,exp,-2,93);
}
else if (cat1!=lpar) squash(pp,1,new_exp,0,94);
</t>
<t tx="ekr.20050502102905.27">@
@&lt;Try to open include file, abort push if unsuccessful, go to |restart|@&gt;= {
  char temp_file_name[max_file_name_length];
  char *cur_file_name_end=cur_file_name+max_file_name_length-1;
  char *k=cur_file_name, *kk;
  int l; /* length of file name */

  while (*loc!=' '&amp;&amp;*loc!='\t'&amp;&amp;*loc!='"'&amp;&amp;k&lt;=cur_file_name_end) *k++=*loc++;
  if (k&gt;cur_file_name_end) too_long();
@.Include file name ...@&gt;
  *k='\0';
  if ((cur_file=fopen(cur_file_name,"r"))!=NULL) {
    cur_line=0; print_where=1;
    goto restart; /* success */
  }
  kk=getenv("CWEBINPUTS");
  if (kk!=NULL) {
    if ((l=strlen(kk))&gt;max_file_name_length-2) too_long();
    strcpy(temp_file_name,kk);
  }
  else {
#ifdef CWEBINPUTS
    if ((l=strlen(CWEBINPUTS))&gt;max_file_name_length-2) too_long();
    strcpy(temp_file_name,CWEBINPUTS);
#else
    l=0;
#endif /* |CWEBINPUTS| */
  }
  if (l&gt;0) {
    if (k+l+2&gt;=cur_file_name_end)  too_long();
@.Include file name ...@&gt;
    for (; k&gt;= cur_file_name; k--) *(k+l+1)=*k;
    strcpy(cur_file_name,temp_file_name);
    cur_file_name[l]='/'; /* \UNIX/ pathname separator */
    if ((cur_file=fopen(cur_file_name,"r"))!=NULL) {
      cur_line=0; print_where=1;
      goto restart; /* success */
    }
  }
  include_depth--; err_print("! Cannot open include file"); goto restart;
}
</t>
<t tx="ekr.20050502102905.270">@ @&lt;Cases for |new_exp|@&gt;=
if (cat1==int_like || cat1==const_like) {
  big_app1(pp); big_app(' '); big_app1(pp+1); reduce(pp,2,new_exp,0,95);
}
else if (cat1==struct_like &amp;&amp; (cat2==exp || cat2==int_like)) {
  big_app1(pp); big_app(' '); big_app1(pp+1); big_app(' ');
  big_app1(pp+2); reduce(pp,3,new_exp,0,96);
}
else if (cat1==raw_ubin) {
  big_app1(pp); big_app('{'); big_app1(pp+1); big_app('}');
  reduce(pp,2,new_exp,0,97);
}
else if (cat1==lpar) squash(pp,1,exp,-2,98);
else if (cat1==exp) {
  big_app1(pp); big_app(' '); reduce(pp,1,exp,-2,98);
}
else if (cat1!=raw_int &amp;&amp; cat1!=struct_like &amp;&amp; cat1!=colcol)
  squash(pp,1,exp,-2,99);
</t>
<t tx="ekr.20050502102905.271">@ @&lt;Cases for |ftemplate|@&gt;=
if (cat1==prelangle) squash(pp+1,1,langle,1,100);
else squash(pp,1,exp,-2,101);
</t>
<t tx="ekr.20050502102905.272">@ @&lt;Cases for |for_like|@&gt;=
if (cat1==exp) {
  big_app1(pp); big_app(' '); big_app1(pp+1); reduce(pp,2,else_like,-2,102);
}
</t>
<t tx="ekr.20050502102905.273">@ @&lt;Cases for |raw_ubin|@&gt;=
if (cat1==const_like) {
  big_app2(pp); app_str("\\ "); reduce(pp,2,raw_ubin,0,103);
@.\\\ @&gt;
} else squash(pp,1,ubinop,-2,104);
</t>
<t tx="ekr.20050502102905.274">@ @&lt;Cases for |const_like|@&gt;=
squash(pp,1,int_like,-2,105);
</t>
<t tx="ekr.20050502102905.275">@ @&lt;Cases for |raw_int|@&gt;=
if (cat1==prelangle) squash(pp+1,1,langle,1,106);
else if (cat1==colcol) squash(pp,2,colcol,-1,107);
else if (cat1==cast) squash(pp,2,raw_int,0,108);
else if (cat1==lpar) squash(pp,1,exp,-2,109);
else if (cat1!=langle) squash(pp,1,int_like,-3,110);
</t>
<t tx="ekr.20050502102905.276">@ @&lt;Cases for |operator_like|@&gt;=
if (cat1==binop || cat1==unop || cat1==ubinop) {
  if (cat2==binop) break;
  big_app1(pp); big_app('{'); big_app1(pp+1); big_app('}');
  reduce(pp,2,exp,-2,111);
}
else if (cat1==new_like || cat1==delete_like) {
  big_app1(pp); big_app(' '); big_app1(pp+1); reduce(pp,2,exp,-2,112);
}
else if (cat1==comma) squash(pp,2,exp,-2,113);
else if (cat1!=raw_ubin) squash(pp,1,new_exp,0,114);
</t>
<t tx="ekr.20050502102905.277">@ @&lt;Cases for |typedef_like|@&gt;=
if ((cat1==int_like || cat1==cast) &amp;&amp; (cat2==comma || cat2==semi))
  squash(pp+1,1,exp,-1,115);
else if (cat1==int_like) {
  big_app1(pp); big_app(' '); big_app1(pp+1); reduce(pp,2,typedef_like,0,116);
}
else if (cat1==exp &amp;&amp; cat2!=lpar &amp;&amp; cat2!=exp &amp;&amp; cat2!=cast) {
  make_underlined(pp+1); make_reserved(pp+1);
  big_app1(pp); big_app(' '); big_app1(pp+1); reduce(pp,2,typedef_like,0,117);
}
else if (cat1==comma) {
  big_app2(pp); big_app(' '); reduce(pp,2,typedef_like,0,118);
}
else if (cat1==semi) squash(pp,2,decl,-1,119);
else if (cat1==ubinop &amp;&amp; (cat2==ubinop || cat2==cast)) {
  big_app('{'); big_app1(pp+1); big_app('}'); big_app1(pp+2);
  reduce(pp+1,2,cat2,0,120);
}
</t>
<t tx="ekr.20050502102905.278">@ @&lt;Cases for |delete_like|@&gt;=
if (cat1==lpar &amp;&amp; cat2==rpar) {
  big_app2(pp); app('\\'); app(','); big_app1(pp+2);
@.\\,@&gt;
  reduce(pp,3,delete_like,0,121);
}
else if (cat1==exp) {
  big_app1(pp); big_app(' '); big_app1(pp+1); reduce(pp,2,exp,-2,122);
}
</t>
<t tx="ekr.20050502102905.279">@ @&lt;Cases for |question|@&gt;=
if (cat1==exp &amp;&amp; (cat2==colon || cat2==base)) {
  (pp+2)-&gt;mathness=5*yes_math; /* this colon should be in math mode */
  squash(pp,3,binop,-2,123);
}
</t>
<t tx="ekr.20050502102905.28">@ At the end of the program, we will tell the user if the change file had a line that didn't match any relevant line in |web_file|.

@c
void
check_complete(){
  if (change_limit!=change_buffer) { /* |changing| is 0 */
    strncpy(buffer,change_buffer,change_limit-change_buffer+1);
    limit=buffer+(int)(change_limit-change_buffer);
    changing=1; change_depth=include_depth; loc=buffer;
    err_print("! Change file entry did not match");
@.Change file entry did not match@&gt;
  }
}</t>
<t tx="ekr.20050502102905.280">@ If the initial sequence of scraps does not reduce to a single scrap, we concatenate the translations of all remaining scraps, separated by blank spaces, with dollar signs surrounding the translations of scraps where appropriate.

@&lt;Combine the irreducible scraps that remain@&gt;= {
  @&lt;If semi-tracing, show the irreducible scraps@&gt;;
  for (j=scrap_base; j&lt;=lo_ptr; j++) {
    if (j!=scrap_base) app(' ');
    if (j-&gt;mathness % 4 == yes_math) app('$');
    app1(j);
    if (j-&gt;mathness / 4 == yes_math) app('$');
    if (tok_ptr+6&gt;tok_mem_end) overflow("token");
  }
  freeze_text; return(text_ptr-1);
}
</t>
<t tx="ekr.20050502102905.281">@ @&lt;If semi-tracing, show the irreducible scraps@&gt;=
if (lo_ptr&gt;scrap_base &amp;&amp; tracing==1) {
  printf("\nIrreducible scrap sequence in section %d:",section_count);
@.Irreducible scrap sequence...@&gt;
  mark_harmless;
  for (j=scrap_base; j&lt;=lo_ptr; j++) {
    printf(" "); print_cat(j-&gt;cat);
  }
}
</t>
<t tx="ekr.20050502102905.282">@* Initializing the scraps. If we are going to use the powerful production mechanism just developed, we must get the scraps set up in the first place, given a \CEE/ text. A table of the initial scraps corresponding to \CEE/ tokens appeared above in the section on parsing; our goal now is to implement that table. We shall do this by implementing a subroutine called |C_parse| that is analogous to the |C_xref| routine used during phase one.  Like |C_xref|, the |C_parse| procedure starts with the current value of |next_control| and it uses the operation |next_control=get_next()| repeatedly to read \CEE/ text until encountering the next `\.{\v}' or `\.{/*}', or until |next_control&gt;=format_code|. The scraps corresponding to what it reads are appended into the |cat| and |trans| arrays, and |scrap_ptr| is advanced.

@c
void
C_parse(spec_ctrl) /* creates scraps from \CEE/ tokens */
  eight_bits spec_ctrl;
{
  int count; /* characters remaining before string break */
  while (next_control&lt;format_code || next_control==spec_ctrl) {
    @&lt;Append the scrap appropriate to |next_control|@&gt;;
    next_control=get_next();
    if (next_control=='|' || next_control==begin_comment ||
        next_control==begin_short_comment) return;
  }
}</t>
<t tx="ekr.20050502102905.283">@ The following macro is used to append a scrap whose tokens have just been appended:

@d app_scrap(c,b) {
  (++scrap_ptr)-&gt;cat=(c); scrap_ptr-&gt;trans=text_ptr;
  scrap_ptr-&gt;mathness=5*(b); /* no no, yes yes, or maybe maybe */
  freeze_text;
}
</t>
<t tx="ekr.20050502102905.284">@ @&lt;Append the scr...@&gt;=
@&lt;Make sure that there is room for the new scraps, tokens, and texts@&gt;;
switch (next_control) {
  case section_name:
    app(section_flag+(int)(cur_section-name_dir));
    app_scrap(section_scrap,maybe_math);
    app_scrap(exp,yes_math);@+break;
  case string: case constant: case verbatim: @&lt;Append a string or constant@&gt;;
   @+break;
  case identifier: app_cur_id(1);@+break;
  case TeX_string: @&lt;Append a \TEX/ string, without forming a scrap@&gt;;@+break;
  case '/': case '.':
    app(next_control); app_scrap(binop,yes_math);@+break;
  case '&lt;': app_str("\\langle");@+app_scrap(prelangle,yes_math);@+break;
@.\\langle@&gt;
  case '&gt;': app_str("\\rangle");@+app_scrap(prerangle,yes_math);@+break;
@.\\rangle@&gt;
  case '=': app_str("\\K"); app_scrap(binop,yes_math);@+break;
@.\\K@&gt;
  case '|': app_str("\\OR"); app_scrap(binop,yes_math);@+break;
@.\\OR@&gt;
  case '^': app_str("\\XOR"); app_scrap(binop,yes_math);@+break;
@.\\XOR@&gt;
  case '%': app_str("\\MOD"); app_scrap(binop,yes_math);@+break;
@.\\MOD@&gt;
  case '!': app_str("\\R"); app_scrap(unop,yes_math);@+break;
@.\\R@&gt;
  case '~': app_str("\\CM"); app_scrap(unop,yes_math);@+break;
@.\\CM@&gt;
  case '+': case '-': app(next_control); app_scrap(ubinop,yes_math);@+break;
  case '*': app(next_control); app_scrap(raw_ubin,yes_math);@+break;
  case '&amp;': app_str("\\AND"); app_scrap(raw_ubin,yes_math);@+break;
@.\\AND@&gt;
  case '?': app_str("\\?"); app_scrap(question,yes_math);@+break;
@.\\?@&gt;
  case '#': app_str("\\#"); app_scrap(ubinop,yes_math);@+break;
@.\\\#@&gt;
  case ignore: case xref_roman: case xref_wildcard:
  case xref_typewriter: case noop:@+break;
  case '(': case '[': app(next_control); app_scrap(lpar,maybe_math);@+break;
  case ')': case ']': app(next_control); app_scrap(rpar,maybe_math);@+break;
  case '{': app_str("\\{"@q}@&gt;); app_scrap(lbrace,yes_math);@+break;
@.\\\{@&gt;@q}@&gt;
  case '}': app_str(@q{@&gt;"\\}"); app_scrap(rbrace,yes_math);@+break;
@q{@&gt;@.\\\}@&gt;
  case ',': app(','); app_scrap(comma,yes_math);@+break;
  case ';': app(';'); app_scrap(semi,maybe_math);@+break;
  case ':': app(':'); app_scrap(colon,no_math);@+break;@/
  @t\4@&gt;  @&lt;Cases involving nonstandard characters@&gt;@;
  case thin_space: app_str("\\,"); app_scrap(insert,maybe_math);@+break;
@.\\,@&gt;
  case math_break: app(opt); app_str("0");
    app_scrap(insert,maybe_math);@+break;
  case line_break: app(force); app_scrap(insert,no_math);@+break;
  case left_preproc: app(force); app(preproc_line);
    app_str("\\#"); app_scrap(lproc,no_math);@+break;
@.\\\#@&gt;
  case right_preproc: app(force); app_scrap(rproc,no_math);@+break;
  case big_line_break: app(big_force); app_scrap(insert,no_math);@+break;
  case no_line_break: app(big_cancel); app(noop); app(break_space);
    app(noop); app(big_cancel);
    app_scrap(insert,no_math);@+break;
  case pseudo_semi: app_scrap(semi,maybe_math);@+break;
  case macro_arg_open: app_scrap(begin_arg,maybe_math);@+break;
  case macro_arg_close: app_scrap(end_arg,maybe_math);@+break;
  case join: app_str("\\J"); app_scrap(insert,no_math);@+break;
@.\\J@&gt;
  case output_defs_code: app(force); app_str("\\ATH"); app(force);
    app_scrap(insert,no_math);@+break;
@.\\ATH@&gt;
  default: app(inserted); app(next_control);
    app_scrap(insert,maybe_math);@+break;
}
</t>
<t tx="ekr.20050502102905.285">@ @&lt;Make sure that there is room for the new...@&gt;=
if (scrap_ptr+safe_scrap_incr&gt;scrap_info_end ||
  tok_ptr+safe_tok_incr&gt;tok_mem_end @| ||
  text_ptr+safe_text_incr&gt;tok_start_end) {
  if (scrap_ptr&gt;max_scr_ptr) max_scr_ptr=scrap_ptr;
  if (tok_ptr&gt;max_tok_ptr) max_tok_ptr=tok_ptr;
  if (text_ptr&gt;max_text_ptr) max_text_ptr=text_ptr;
  overflow("scrap/token/text");
}
</t>
<t tx="ekr.20050502102905.286">@ Some nonstandard characters may have entered \.{CWEAVE} by means of standard ones. They are converted to \TEX/ control sequences so that it is possible to keep \.{CWEAVE} from outputting unusual |char| codes.

@&lt;Cases involving nonstandard characters@&gt;=
case not_eq: app_str("\\I");@+app_scrap(binop,yes_math);@+break;
@.\\I@&gt;
case lt_eq: app_str("\\Z");@+app_scrap(binop,yes_math);@+break;
@.\\Z@&gt;
case gt_eq: app_str("\\G");@+app_scrap(binop,yes_math);@+break;
@.\\G@&gt;
case eq_eq: app_str("\\E");@+app_scrap(binop,yes_math);@+break;
@.\\E@&gt;
case and_and: app_str("\\W");@+app_scrap(binop,yes_math);@+break;
@.\\W@&gt;
case or_or: app_str("\\V");@+app_scrap(binop,yes_math);@+break;
@.\\V@&gt;
case plus_plus: app_str("\\PP");@+app_scrap(unop,yes_math);@+break;
@.\\PP@&gt;
case minus_minus: app_str("\\MM");@+app_scrap(unop,yes_math);@+break;
@.\\MM@&gt;
case minus_gt: app_str("\\MG");@+app_scrap(binop,yes_math);@+break;
@.\\MG@&gt;
case gt_gt: app_str("\\GG");@+app_scrap(binop,yes_math);@+break;
@.\\GG@&gt;
case lt_lt: app_str("\\LL");@+app_scrap(binop,yes_math);@+break;
@.\\LL@&gt;
case dot_dot_dot: app_str("\\,\\ldots\\,");@+app_scrap(raw_int,yes_math);
  @+break;
@.\\,@&gt;
@.\\ldots@&gt;
case colon_colon: app_str("\\DC");@+app_scrap(colcol,maybe_math);@+break;
@.\\DC@&gt;
case period_ast: app_str("\\PA");@+app_scrap(binop,yes_math);@+break;
@.\\PA@&gt;
case minus_gt_ast: app_str("\\MGA");@+app_scrap(binop,yes_math);@+break;
@.\\MGA@&gt;
</t>
<t tx="ekr.20050502102905.287">@ The following code must use |app_tok| instead of |app| in order to protect against overflow. Note that |tok_ptr+1&lt;=max_toks| after |app_tok| has been used, so another |app| is legitimate before testing again.  Many of the special characters in a string must be prefixed by `\.\\' so that \TEX/ will print them properly. @^special string characters@&gt;

@&lt;Append a string or constant@&gt;=
count= -1;
if (next_control==constant) app_str("\\T{"@q}@&gt;);
@.\\T@&gt;
else if (next_control==string) {
  count=20; app_str("\\.{"@q}@&gt;);
}
@.\\.@&gt;
else app_str("\\vb{"@q}@&gt;);
@.\\vb@&gt;
while (id_first&lt;id_loc) {
  if (count==0) { /* insert a discretionary break in a long string */
     app_str(@q(@&gt;@q{@&gt;"}\\)\\.{"@q}@&gt;); count=20;
@q(@&gt;@.\\)@&gt;
  }
@^high-bit character handling@&gt;
  if((eight_bits)(*id_first)&gt;0177) {
    app_tok(quoted_char);
    app_tok((eight_bits)(*id_first++));
  }
  else {
    switch (*id_first) {
      case  ' ':case '\\':case '#':case '%':case '$':case '^':
      case '{': case '}': case '~': case '&amp;': case '_': app('\\'); break;
@.\\\ @&gt;
@.\\\\@&gt;
@.\\\#@&gt;
@.\\\%@&gt;
@.\\\$@&gt;
@.\\\^@&gt;
@.\\\{@&gt;@q}@&gt;
@q{@&gt;@.\\\}@&gt;
@.\\\~@&gt;
@.\\\&amp;@&gt;
@.\\\_@&gt;
      case '@@': if (*(id_first+1)=='@@') id_first++;
        else err_print("! Double @@ should be used in strings");
@.Double @@ should be used...@&gt;
    }
    app_tok(*id_first++);
  }
  count--;
}
app(@q{@&gt;'}');
app_scrap(exp,maybe_math);
</t>
<t tx="ekr.20050502102905.288">@ We do not make the \TEX/ string into a scrap, because there is no telling what the user will be putting into it; instead we leave it open, to be picked up by the next scrap. If it comes at the end of a section, it will be made into a scrap when |finish_C| is called.  There's a known bug here, in cases where an adjacent scrap is |prelangle| or |prerangle|. Then the \TEX/ string can disappear when the \.{\\langle} or \.{\\rangle} becomes \.{&lt;} or \.{&gt;}. For example, if the user writes \.{\v x&lt;@@ty@@&gt;\v}, the \TEX/ string \.{\\hbox\{y\}} eventually becomes part of an |insert| scrap, which is combined with a |prelangle| scrap and eventually lost. The best way to work around this bug is probably to enclose the \.{@@t...@@&gt;} in \.{@@[...@@]} so that the \TEX/ string is treated as an expression. @^bug, known@&gt;

@&lt;Append a \TEX/ string, without forming a scrap@&gt;=
app_str("\\hbox{"@q}@&gt;);
@^high-bit character handling@&gt;
while (id_first&lt;id_loc)
  if((eight_bits)(*id_first)&gt;0177) {
    app_tok(quoted_char);
    app_tok((eight_bits)(*id_first++));
  }
  else {
    if (*id_first=='@@') id_first++;
    app_tok(*id_first++);
  }
app(@q{@&gt;'}');
</t>
<t tx="ekr.20050502102905.289">@ The function |app_cur_id| appends the current identifier to the token list; it also builds a new scrap if |scrapping==1|.

@&lt;Predeclaration of procedures@&gt;=
void app_cur_id();

@ @c
void
app_cur_id(scrapping)
boolean scrapping; /* are we making this into a scrap? */
{
  name_pointer p=id_lookup(id_first,id_loc,normal);
  if (p-&gt;ilk&lt;=custom) { /* not a reserved word */
    app(id_flag+(int)(p-name_dir));
    if (scrapping) app_scrap(p-&gt;ilk==func_template? ftemplate: exp,
                             p-&gt;ilk==custom? yes_math: maybe_math);
@.\\NULL@&gt;
  } else {
    app(res_flag+(int)(p-name_dir));
    if (scrapping) {
      if (p-&gt;ilk==alfop) app_scrap(ubinop,yes_math)@;
      else app_scrap(p-&gt;ilk,maybe_math);
    }
  }
}
</t>
<t tx="ekr.20050502102905.29">@** Storage of names and strings. Both \.{CWEAVE} and \.{CTANGLE} store identifiers, section names and other strings in a large array of |char|s, called |byte_mem|. Information about the names is kept in the array |name_dir|, whose elements are structures of type |name_info|, containing a pointer into the |byte_mem| array (the address where the name begins) and other data. A |name_pointer| variable is a pointer into |name_dir|.

@d max_bytes 90000 /* the number of bytes in identifiers,
  index entries, and section names; must be less than $2^{24}$ */</t>
<t tx="ekr.20050502102905.290">@ When the `\.{\v}' that introduces \CEE/ text is sensed, a call on |C_translate| will return a pointer to the \TEX/ translation of that text. If scraps exist in |scrap_info|, they are unaffected by this translation process.

@c
text_pointer
C_translate()
{
  text_pointer p; /* points to the translation */
  scrap_pointer save_base; /* holds original value of |scrap_base| */
  save_base=scrap_base; scrap_base=scrap_ptr+1;
  C_parse(section_name); /* get the scraps together */
  if (next_control!='|') err_print("! Missing '|' after C text");
@.Missing '|'...@&gt;
  app_tok(cancel); app_scrap(insert,maybe_math);
        /* place a |cancel| token as a final ``comment'' */
  p=translate(); /* make the translation */
  if (scrap_ptr&gt;max_scr_ptr) max_scr_ptr=scrap_ptr;
  scrap_ptr=scrap_base-1; scrap_base=save_base; /* scrap the scraps */
  return(p);
}</t>
<t tx="ekr.20050502102905.291">@ The |outer_parse| routine is to |C_parse| as |outer_xref| is to |C_xref|: It constructs a sequence of scraps for \CEE/ text until |next_control&gt;=format_code|. Thus, it takes care of embedded comments.  The token list created from within `\pb' brackets is output as an argument to \.{\\PB}, if the user has invoked \.{CWEAVE} with the \.{+e} flag. Although \.{cwebmac} ignores \.{\\PB}, other macro packages might use it to localize the special meaning of the macros that mark up program text.

@d make_pb flags['e']

@c
void
outer_parse() /* makes scraps from \CEE/ tokens and comments */
{
  int bal; /* brace level in comment */
  text_pointer p, q; /* partial comments */
  while (next_control&lt;format_code)
    if (next_control!=begin_comment &amp;&amp; next_control!=begin_short_comment)
      C_parse(ignore);
    else {
      boolean is_long_comment=(next_control==begin_comment);
      @&lt;Make sure that there is room for the new...@&gt;;
      app(cancel); app(inserted);
      if (is_long_comment) app_str("\\C{"@q}@&gt;);
@.\\C@&gt;
      else app_str("\\SHC{"@q}@&gt;);
@.\\SHC@&gt;
      bal=copy_comment(is_long_comment,1); next_control=ignore;
      while (bal&gt;0) {
        p=text_ptr; freeze_text; q=C_translate();
         /* at this point we have |tok_ptr+6&lt;=max_toks| */
        app(tok_flag+(int)(p-tok_start));
        if (make_pb) app_str("\\PB{");
@.\\PB@&gt;
        app(inner_tok_flag+(int)(q-tok_start));
        if (make_pb)  app_tok('}');
        if (next_control=='|') {
          bal=copy_comment(is_long_comment,bal);
          next_control=ignore;
        }
        else bal=0; /* an error has been reported */
      }
      app(force); app_scrap(insert,no_math);
        /* the full comment becomes a scrap */
    }
}</t>
<t tx="ekr.20050502102905.292">@* Output of tokens.
So far our programs have only built up multi-layered token lists in
\.{CWEAVE}'s internal memory; we have to figure out how to get them into
the desired final form. The job of converting token lists to characters in
the \TEX/ output file is not difficult, although it is an implicitly
recursive process. Four main considerations had to be kept in mind when
this part of \.{CWEAVE} was designed.  (a) There are two modes of output:
|outer| mode, which translates tokens like |force| into line-breaking
control sequences, and |inner| mode, which ignores them except that blank
spaces take the place of line breaks. (b) The |cancel| instruction applies
to adjacent token or tokens that are output, and this cuts across levels
of recursion since `|cancel|' occurs at the beginning or end of a token
list on one level. (c) The \TEX/ output file will be semi-readable if line
breaks are inserted after the result of tokens like |break_space| and
|force|.  (d) The final line break should be suppressed, and there should
be no |force| token output immediately after `\.{\\Y\\B}'.</t>
<t tx="ekr.20050502102905.293">@ The output process uses a stack to keep track of what is going on at different ``levels'' as the token lists are being written out. Entries on this stack have three parts:  \yskip\hang |end_field| is the |tok_mem| location where the token list of a particular level will end;  \yskip\hang |tok_field| is the |tok_mem| location from which the next token on a particular level will be read;  \yskip\hang |mode_field| is the current mode, either |inner| or |outer|.  \yskip\noindent The current values of these quantities are referred to quite frequently, so they are stored in a separate place instead of in the |stack| array. We call the current values |cur_end|, |cur_tok|, and |cur_mode|.  The global variable |stack_ptr| tells how many levels of output are currently in progress. The end of output occurs when an |end_translation| token is found, so the stack is never empty except when we first begin the output process.

@d inner 0 /* value of |mode| for \CEE/ texts within \TEX/ texts */
@d outer 1 /* value of |mode| for \CEE/ texts in sections */

@&lt;Typedef declarations@&gt;= typedef int mode;
typedef struct {
  token_pointer end_field; /* ending location of token list */
  token_pointer tok_field; /* present location within token list */
  boolean mode_field; /* interpretation of control tokens */
} output_state;
typedef output_state *stack_pointer;

@ @d cur_end cur_state.end_field /* current ending location in |tok_mem| */
@d cur_tok cur_state.tok_field /* location of next output token in |tok_mem| */
@d cur_mode cur_state.mode_field /* current mode of interpretation */
@d init_stack stack_ptr=stack;cur_mode=outer /* initialize the stack */

@&lt;Global variables@&gt;=
output_state cur_state; /* |cur_end|, |cur_tok|, |cur_mode| */
output_state stack[stack_size]; /* info for non-current levels */
stack_pointer stack_ptr; /* first unused location in the output state stack */
stack_pointer stack_end=stack+stack_size-1; /* end of |stack| */
stack_pointer max_stack_ptr; /* largest value assumed by |stack_ptr| */

@ @&lt;Set init...@&gt;=
max_stack_ptr=stack;
</t>
<t tx="ekr.20050502102905.294">@ To insert token-list |p| into the output, the |push_level| subroutine is called; it saves the old level of output and gets a new one going. The value of |cur_mode| is not changed.

@c
void
push_level(p) /* suspends the current level */
text_pointer p;
{
  if (stack_ptr==stack_end) overflow("stack");
  if (stack_ptr&gt;stack) { /* save current state */
    stack_ptr-&gt;end_field=cur_end;
    stack_ptr-&gt;tok_field=cur_tok;
    stack_ptr-&gt;mode_field=cur_mode;
  }
  stack_ptr++;
  if (stack_ptr&gt;max_stack_ptr) max_stack_ptr=stack_ptr;
  cur_tok=*p; cur_end=*(p+1);
}</t>
<t tx="ekr.20050502102905.295">@ Conversely, the |pop_level| routine restores the conditions that were in force when the current level was begun. This subroutine will never be called when |stack_ptr==1|.

@c
void
pop_level()
{
  cur_end=(--stack_ptr)-&gt;end_field;
  cur_tok=stack_ptr-&gt;tok_field; cur_mode=stack_ptr-&gt;mode_field;
}</t>
<t tx="ekr.20050502102905.296">@ The |get_output| function returns the next byte of output that is not a reference to a token list. It returns the values |identifier| or |res_word| or |section_code| if the next token is to be an identifier (typeset in italics), a reserved word (typeset in boldface), or a section name (typeset by a complex routine that might generate additional levels of output). In these cases |cur_name| points to the identifier or section name in question.

@&lt;Global variables@&gt;=
name_pointer cur_name;

@ @d res_word 0201 /* returned by |get_output| for reserved words */
@d section_code 0200 /* returned by |get_output| for section names */

@c
eight_bits
get_output() /* returns the next token of output */
{
  sixteen_bits a; /* current item read from |tok_mem| */
  restart: while (cur_tok==cur_end) pop_level();
  a=*(cur_tok++);
  if (a&gt;=0400) {
    cur_name=a % id_flag + name_dir;
    switch (a / id_flag) {
      case 2: return(res_word); /* |a==res_flag+cur_name| */
      case 3: return(section_code); /* |a==section_flag+cur_name| */
      case 4: push_level(a % id_flag + tok_start); goto restart;
        /* |a==tok_flag+cur_name| */
      case 5: push_level(a % id_flag + tok_start); cur_mode=inner; goto restart;
        /* |a==inner_tok_flag+cur_name| */
      default: return(identifier); /* |a==id_flag+cur_name| */
    }
  }
  return(a);
}</t>
<t tx="ekr.20050502102905.297">@ The real work associated with token output is done by |make_output|. This procedure appends an |end_translation| token to the current token list, and then it repeatedly calls |get_output| and feeds characters to the output buffer until reaching the |end_translation| sentinel. It is possible for |make_output| to be called recursively, since a section name may include embedded \CEE/ text; however, the depth of recursion never exceeds one level, since section names cannot be inside of section names.  A procedure called |output_C| does the scanning, translation, and output of \CEE/ text within `\pb' brackets, and this procedure uses |make_output| to output the current token list. Thus, the recursive call of |make_output| actually occurs when |make_output| calls |output_C| while outputting the name of a section. @^recursion@&gt;

@c
void
output_C() /* outputs the current token list */
{
  token_pointer save_tok_ptr;
  text_pointer save_text_ptr;
  sixteen_bits save_next_control; /* values to be restored */
  text_pointer p; /* translation of the \CEE/ text */
  save_tok_ptr=tok_ptr; save_text_ptr=text_ptr;
  save_next_control=next_control; next_control=ignore; p=C_translate();
  app(inner_tok_flag+(int)(p-tok_start));
  if (make_pb) {
    out_str("\\PB{"); make_output(); out('}');
@.\\PB@&gt;
  }@+else make_output(); /* output the list */
  if (text_ptr&gt;max_text_ptr) max_text_ptr=text_ptr;
  if (tok_ptr&gt;max_tok_ptr) max_tok_ptr=tok_ptr;
  text_ptr=save_text_ptr; tok_ptr=save_tok_ptr; /* forget the tokens */
  next_control=save_next_control; /* restore |next_control| to original state */
}</t>
<t tx="ekr.20050502102905.298">@ Here is \.{CWEAVE}'s major output handler.

@&lt;Predeclaration of procedures@&gt;=
void make_output();

@ @c
void
make_output() /* outputs the equivalents of tokens */
{
  eight_bits a, /* current output byte */
  b; /* next output byte */
  int c; /* count of |indent| and |outdent| tokens */
  char scratch[longest_name]; /* scratch area for section names */
  char *k, *k_limit; /* indices into |scratch| */
  char *j; /* index into |buffer| */
  char *p; /* index into |byte_mem| */
  char delim; /* first and last character of string being copied */
  char *save_loc, *save_limit; /* |loc| and |limit| to be restored */
  name_pointer cur_section_name; /* name of section being output */
  boolean save_mode; /* value of |cur_mode| before a sequence of breaks */
  app(end_translation); /* append a sentinel */
  freeze_text; push_level(text_ptr-1);
  while (1) {
    a=get_output();
    reswitch: switch(a) {
      case end_translation: return;
      case identifier: case res_word: @&lt;Output an identifier@&gt;; break;
      case section_code: @&lt;Output a section name@&gt;; break;
      case math_rel: out_str("\\MRL{"@q}@&gt;);
@.\\MRL@&gt;
      case noop: case inserted: break;
      case cancel: case big_cancel: c=0; b=a;
        while (1) {
          a=get_output();
          if (a==inserted) continue;
          if ((a&lt;indent &amp;&amp; !(b==big_cancel&amp;&amp;a==' ')) || a&gt;big_force) break;
          if (a==indent) c++; else if (a==outdent) c--;
          else if (a==opt) a=get_output();
        }
        @&lt;Output saved |indent| or |outdent| tokens@&gt;;
        goto reswitch;
      case indent: case outdent: case opt: case backup: case break_space:
      case force: case big_force: case preproc_line:
	  	@&lt;Output a control,look ahead in case of line breaks, possibly |goto reswitch|@&gt;; break;
      case quoted_char: out(*(cur_tok++));
      case qualifier: break;
      default: out(a); /* otherwise |a| is an ordinary character */
    }
  }
}
</t>
<t tx="ekr.20050502102905.299">@ @&lt;Output saved...@&gt;=
  for (;c&gt;0;c--) out_str("\\1");
@.\\1@&gt;
  for (;c&lt;0;c++) out_str("\\2");
@.\\2@&gt;
</t>
<t tx="ekr.20050502102905.3">@language cweb
@ignore
@others</t>
<t tx="ekr.20050502102905.30">@d max_names 4000 /* number of identifiers, strings, section names;
  must be less than 10240 */

@&lt;Definitions that should agree with \.{CTANGLE} and \.{CWEAVE}@&gt;=
typedef struct name_info {
  char *byte_start; /* beginning of the name in |byte_mem| */
  @&lt;More elements of |name_info| structure@&gt;@;
} name_info; /* contains information about an identifier or section name */
typedef name_info *name_pointer; /* pointer into array of |name_info|s */
char byte_mem[max_bytes]; /* characters of names */
char *byte_mem_end = byte_mem+max_bytes-1; /* end of |byte_mem| */
name_info name_dir[max_names]; /* information about names */
name_pointer name_dir_end = name_dir+max_names-1; /* end of |name_dir| */

@ The actual sequence of characters in the name pointed to by a |name_pointer p| appears in positions |p-&gt;byte_start| to |(p+1)-&gt;byte_start-1|, inclusive. The |print_id| macro prints this text on the user's terminal.

@d length(c) (c+1)-&gt;byte_start-(c)-&gt;byte_start /* the length of a name */
@d print_id(c) term_write((c)-&gt;byte_start,length((c))) /* print identifier */

@ The names of identifiers are found by computing a hash address |h| and then looking at strings of bytes signified by the |name_pointer|s |hash[h]|, |hash[h]-&gt;link|, |hash[h]-&gt;link-&gt;link|, \dots, until either finding the desired name or encountering the null pointer.

@&lt;More elements of |name_info| structure@&gt;=
struct name_info *link;

@ The first unused position in |byte_mem| and |name_dir| is kept in |byte_ptr| and |name_ptr|, respectively.  Thus we usually have |name_ptr-&gt;byte_start==byte_ptr|, and certainly we want to keep |name_ptr&lt;=name_dir_end| and |byte_ptr&lt;=byte_mem_end|.

@&lt;Definitions that should agree with \.{CTANGLE} and \.{CWEAVE}@&gt;=
name_pointer name_ptr; /* first unused position in |byte_start| */
char *byte_ptr; /* first unused position in |byte_mem| */

@
@&lt;Initialize pointers@&gt;=
name_dir-&gt;byte_start=byte_ptr=byte_mem; /* position zero in both arrays */
name_ptr=name_dir+1; /* |name_dir[0]| will be used only for error recovery */
name_ptr-&gt;byte_start=byte_mem; /* this makes name 0 of length zero */
</t>
<t tx="ekr.20050502102905.300">@ The current mode does not affect the behavior of \.{CWEAVE}'s output routine except when we are outputting control tokens.

@&lt;Output a control...@&gt;=
if (a&lt;break_space || a==preproc_line) {
  if (cur_mode==outer) {
    out('\\'); out(a-cancel+'0');
@.\\1@&gt;
@.\\2@&gt;
@.\\3@&gt;
@.\\4@&gt;
@.\\8@&gt;
    if (a==opt) {
      b=get_output(); /* |opt| is followed by a digit */
      if (b!='0' || force_lines==0) out(b)@;
      else out_str("{-1}"); /* |force_lines| encourages more \.{@@\v} breaks */
    }
  } else if (a==opt) b=get_output(); /* ignore digit following |opt| */
  }
else @&lt;Look ahead for strongest line break, |goto reswitch|@&gt;
</t>
<t tx="ekr.20050502102905.301">@ If several of the tokens |break_space|, |force|, |big_force| occur in a row, possibly mixed with blank spaces (which are ignored), the largest one is used. A line break also occurs in the output file, except at the very end of the translation. The very first line break is suppressed (i.e., a line break that follows `\.{\\Y\\B}').

@&lt;Look ahead for strongest line break, |goto reswitch|@&gt;= {
  b=a; save_mode=cur_mode; c=0;
  while (1) {
    a=get_output();
    if (a==inserted) continue;
    if (a==cancel || a==big_cancel) {
      @&lt;Output saved |indent| or |outdent| tokens@&gt;;
      goto reswitch; /* |cancel| overrides everything */
    }
    if ((a!=' ' &amp;&amp; a&lt;indent) || a==backup || a&gt;big_force) {
      if (save_mode==outer) {
        if (out_ptr&gt;out_buf+3 &amp;&amp; strncmp(out_ptr-3,"\\Y\\B",4)==0)
          goto reswitch;
        @&lt;Output saved |indent| or |outdent| tokens@&gt;;
        out('\\'); out(b-cancel+'0');
@.\\5@&gt;
@.\\6@&gt;
@.\\7@&gt;
        if (a!=end_translation) finish_line();
      }
      else if (a!=end_translation &amp;&amp; cur_mode==inner) out(' ');
      goto reswitch;
    }
    if (a==indent) c++;
    else if (a==outdent) c--;
    else if (a==opt) a=get_output();
    else if (a&gt;b) b=a; /* if |a==' '| we have |a&lt;b| */
  }
}
</t>
<t tx="ekr.20050502102905.302">@ An identifier of length one does not have to be enclosed in braces, and it looks slightly better if set in a math-italic font instead of a (slightly narrower) text-italic font. Thus we output `\.{\\\v}\.{a}' but `\.{\\\\\{aa\}}'.

@&lt;Output an identifier@&gt;=
out('\\');
if (a==identifier) {
  if (cur_name-&gt;ilk==custom &amp;&amp; !doing_format) {
 custom_out:
    for (p=cur_name-&gt;byte_start;p&lt;(cur_name+1)-&gt;byte_start;p++)
      out(*p=='_'? 'x': *p=='$'? 'X': *p);
    break;
  } else if (is_tiny(cur_name)) out('|')@;
@.\\|@&gt;
  else { delim='.';
    for (p=cur_name-&gt;byte_start;p&lt;(cur_name+1)-&gt;byte_start;p++)
      if (xislower(*p)) { /* not entirely uppercase */
         delim='\\'; break;
      }
  out(delim);
  }
@.\\\\@&gt;
@.\\.@&gt;
}@+else if (cur_name-&gt;ilk==alfop) {
  out('X');
  goto custom_out;
}@+else out('&amp;'); /* |a==res_word| */
@.\\\&amp;@&gt;
if (is_tiny(cur_name)) {
  if (isxalpha((cur_name-&gt;byte_start)[0]))
    out('\\');
  out((cur_name-&gt;byte_start)[0]);
}
else out_name(cur_name,1);
</t>
<t tx="ekr.20050502102905.303">@ The remaining part of |make_output| is somewhat more complicated. When we output a section name, we may need to enter the parsing and translation routines, since the name may contain \CEE/ code embedded in \pb\ constructions. This \CEE/ code is placed at the end of the active input buffer and the translation process uses the end of the active |tok_mem| area.

@&lt;Output a section name@&gt;= {
  out_str("\\X");
@.\\X@&gt;
  cur_xref=(xref_pointer)cur_name-&gt;xref;
  if (cur_xref-&gt;num==file_flag) {an_output=1; cur_xref=cur_xref-&gt;xlink;}
  else an_output=0;
  if (cur_xref-&gt;num&gt;=def_flag) {
    out_section(cur_xref-&gt;num-def_flag);
    if (phase==3) {
      cur_xref=cur_xref-&gt;xlink;
      while (cur_xref-&gt;num&gt;=def_flag) {
        out_str(", ");
        out_section(cur_xref-&gt;num-def_flag);
      cur_xref=cur_xref-&gt;xlink;
      }
    }
  }
  else out('0'); /* output the section number, or zero if it was undefined */
  out(':');
  if (an_output) out_str("\\.{"@q}@&gt;);
@.\\.@&gt;
  @&lt;Output the text of the section name@&gt;;
  if (an_output) out_str(@q{@&gt;" }");
  out_str("\\X");
}
</t>
<t tx="ekr.20050502102905.304">@ @&lt;Output the text...@&gt;=
sprint_section_name(scratch,cur_name);
k=scratch;
k_limit=scratch+strlen(scratch);
cur_section_name=cur_name;
while (k&lt;k_limit) {
  b=*(k++);
  if (b=='@@') @&lt;Skip next character, give error if not `\.{@@}'@&gt;;
  if (an_output)
    switch (b) {
 case  ' ':case '\\':case '#':case '%':case '$':case '^':
 case '{': case '}': case '~': case '&amp;': case '_':
    out('\\'); /* falls through */
@.\\\ @&gt;
@.\\\\@&gt;
@.\\\#@&gt;
@.\\\%@&gt;
@.\\\$@&gt;
@.\\\^@&gt;
@.\\\{@&gt;@q}@&gt;
@q{@&gt;@.\\\}@&gt;
@.\\\~@&gt;
@.\\\&amp;@&gt;
@.\\\_@&gt;
 default: out(b);
    }
  else if (b!='|') out(b)
  else {
    @&lt;Copy the \CEE/ text into the |buffer| array@&gt;;
    save_loc=loc; save_limit=limit; loc=limit+2; limit=j+1;
    *limit='|'; output_C();
    loc=save_loc; limit=save_limit;
  }
}
</t>
<t tx="ekr.20050502102905.305">@ @&lt;Skip next char...@&gt;=
if (*k++!='@@') {
  printf("\n! Illegal control code in section name: &lt;");
@.Illegal control code...@&gt;
  print_section_name(cur_section_name); printf("&gt; "); mark_error;
}
</t>
<t tx="ekr.20050502102905.306">@ The \CEE/ text enclosed in \pb\ should not contain `\.{\v}' characters, except within strings. We put a `\.{\v}' at the front of the buffer, so that an error message that displays the whole buffer will look a little bit sensible. The variable |delim| is zero outside of strings, otherwise it equals the delimiter that began the string being copied.

@&lt;Copy the \CEE/ text into the |buffer| array@&gt;=
j=limit+1; *j='|'; delim=0;
while (1) {
  if (k&gt;=k_limit) {
    printf("\n! C text in section name didn't end: &lt;");
@.C text...didn't end@&gt;
    print_section_name(cur_section_name); printf("&gt; "); mark_error; break;
  }
  b=*(k++);
  if (b=='@@' || (b=='\\' &amp;&amp; delim!=0))
     @&lt;Copy a quoted character into the buffer@&gt;
  else {
    if (b=='\'' || b=='"')
      if (delim==0) delim=b;
      else if (delim==b) delim=0;
    if (b!='|' || delim!=0) {
      if (j&gt;buffer+long_buf_size-3) overflow("buffer");
      *(++j)=b;
    }
    else break;
  }
}
</t>
<t tx="ekr.20050502102905.307">@ @&lt;Copy a quoted char...@&gt;= {
  if (j&gt;buffer+long_buf_size-4) overflow("buffer");
  *(++j)=b; *(++j)=*(k++);
}
</t>
<t tx="ekr.20050502102905.308">@** Phase two processing. We have assembled enough pieces of the puzzle in order to be ready to specify the processing in \.{CWEAVE}'s main pass over the source file. Phase two is analogous to phase one, except that more work is involved because we must actually output the \TEX/ material instead of merely looking at the \.{CWEB} specifications.
</t>
<t tx="ekr.20050502102905.309">@&lt;Predeclaration of procedures@&gt;=
void phase_two();

@ @c
void
phase_two() {
reset_input(); if (show_progress) printf("\nWriting the output file...");
@.Writing the output file...@&gt;
section_count=0; format_visible=1; copy_limbo();
finish_line(); flush_buffer(out_buf,0,0); /* insert a blank line, it looks nice */
while (!input_has_ended) @&lt;Translate the current section@&gt;;
}
</t>
<t tx="ekr.20050502102905.31">@ The hash table itself consists of |hash_size| entries of type |name_pointer|, and is updated by the |id_lookup| procedure, which finds a given identifier and returns the appropriate |name_pointer|. The matching is done by the function |names_match|, which is slightly different in \.{CWEAVE} and \.{CTANGLE}.  If there is no match for the identifier, it is inserted into the table.

@d hash_size 353 /* should be prime */

@&lt;Definitions that should agree with \.{CTANGLE} and \.{CWEAVE}@&gt;=
typedef name_pointer *hash_pointer;
name_pointer hash[hash_size]; /* heads of hash lists */
hash_pointer hash_end = hash+hash_size-1; /* end of |hash| */
hash_pointer h; /* index into hash-head array */

@
@&lt;Predeclaration of procedures@&gt;=
extern int names_match();

@ Initially all the hash lists are empty.

@&lt;Initialize pointers@&gt;=
for (h=hash; h&lt;=hash_end; *h++=NULL) ;
</t>
<t tx="ekr.20050502102905.310">@ The output file will contain the control sequence \.{\\Y} between non-null sections of a section, e.g., between the \TEX/ and definition parts if both are nonempty. This puts a little white space between the parts when they are printed. However, we don't want \.{\\Y} to occur between two definitions within a single section. The variables |out_line| or |out_ptr| will change if a section is non-null, so the following macros `|save_position|' and `|emit_space_if_needed|' are able to handle the situation:

@d save_position save_line=out_line; save_place=out_ptr
@d emit_space_if_needed if (save_line!=out_line || save_place!=out_ptr)
  out_str("\\Y");
  space_checked=1
@.\\Y@&gt;

@&lt;Global variables@&gt;=
int save_line; /* former value of |out_line| */
char *save_place; /* former value of |out_ptr| */
int sec_depth; /* the integer, if any, following \.{@@*} */
boolean space_checked; /* have we done |emit_space_if_needed|? */
boolean format_visible; /* should the next format declaration be output? */
boolean doing_format=0; /* are we outputting a format declaration? */
boolean group_found=0; /* has a starred section occurred? */

@ @&lt;Translate the current section@&gt;= {
  section_count++;
  @&lt;Output the code for the beginning of a new section@&gt;;
  save_position;
  @&lt;Translate the \TEX/ part of the current section@&gt;;
  @&lt;Translate the definition part of the current section@&gt;;
  @&lt;Translate the \CEE/ part of the current section@&gt;;
  @&lt;Show cross-references to this section@&gt;;
  @&lt;Output the code for the end of a section@&gt;;
}
</t>
<t tx="ekr.20050502102905.311">@ Sections beginning with the \.{CWEB} control sequence `\.{@@\ }' start in the output with the \TEX/ control sequence `\.{\\M}', followed by the section number. Similarly, `\.{@

@*}' sections lead to the control sequence `\.{\\N}'. In this case there's an additional parameter, representing one plus the specified depth, immediately after the \.{\\N}. If the section has changed, we put \.{\\*} just after the section number.

@&lt;Output the code for the beginning of a new section@&gt;=
if (*(loc-1)!='*') out_str("\\M");
@.\\M@&gt;
else {
  while (*loc == ' ') loc++;
  if (*loc=='*') { /* ``top'' level */
    sec_depth = -1;
    loc++;
  }
  else {
    for (sec_depth=0; xisdigit(*loc);loc++)
      sec_depth = sec_depth*10 + (*loc) -'0';
  }
  while (*loc == ' ') loc++; /* remove spaces before group title */
  group_found=1;
  out_str("\\N");
@.\\N@&gt;
  {@+ char s[32];@+sprintf(s,"{%d}",sec_depth+1);@+out_str(s);@+}
  if (show_progress)
  printf("*%d",section_count); update_terminal; /* print a progress report */
}
out_str("{");out_section(section_count); out_str("}");
</t>
<t tx="ekr.20050502102905.312">@ In the \TEX/ part of a section, we simply copy the source text, except that index entries are not copied and \CEE/ text within \pb\ is translated.

@&lt;Translate the \TEX/ part of the current section@&gt;= do {
  next_control=copy_TeX();
  switch (next_control) {
    case '|': init_stack; output_C(); break;
    case '@@': out('@@'); break;
    case TeX_string: case noop:
    case xref_roman: case xref_wildcard: case xref_typewriter:
    case section_name: loc-=2; next_control=get_next(); /* skip to \.{@@&gt;} */
      if (next_control==TeX_string)
        err_print("! TeX string should be in C text only"); break;
@.TeX string should be...@&gt;
    case thin_space: case math_break: case ord:
    case line_break: case big_line_break: case no_line_break: case join:
    case pseudo_semi: case macro_arg_open: case macro_arg_close:
    case output_defs_code:
        err_print("! You can't do that in TeX text"); break;
@.You can't do that...@&gt;
  }
} while (next_control&lt;format_code);
</t>
<t tx="ekr.20050502102905.313">@ When we get to the following code we have |next_control&gt;=format_code|, and the token memory is in its initial empty state.

@&lt;Translate the definition part of the current section@&gt;=
space_checked=0;
while (next_control&lt;=definition) { /* |format_code| or |definition| */
  init_stack;
  if (next_control==definition) @&lt;Start a macro definition@&gt;@;
  else @&lt;Start a format definition@&gt;;
  outer_parse(); finish_C(format_visible); format_visible=1;
  doing_format=0;
}
</t>
<t tx="ekr.20050502102905.314">@ Keeping in line with the conventions of the \CEE/ preprocessor (and otherwise contrary to the rules of \.{CWEB}) we distinguish here between the case that `\.(' immediately follows an identifier and the case that the two are separated by a space.  In the latter case, and if the identifier is not followed by `\.(' at all, the replacement text starts immediately after the identifier.  In the former case, it starts after we scan the matching `\.)'.

@&lt;Start a macro definition@&gt;= {
  if (save_line!=out_line || save_place!=out_ptr || space_checked) app(backup);
  if(!space_checked){emit_space_if_needed;save_position;}
  app_str("\\D"); /* this will produce `\&amp;{define }' */
@.\\D@&gt;
  if ((next_control=get_next())!=identifier)
    err_print("! Improper macro definition");
@.Improper macro definition@&gt;
  else {
    app('$'); app_cur_id(0);
    if (*loc=='(')
  reswitch: switch (next_control=get_next()) {
      case '(': case ',': app(next_control); goto reswitch;
      case identifier: app_cur_id(0); goto reswitch;
      case ')': app(next_control); next_control=get_next(); break;
      default: err_print("! Improper macro definition"); break;
    }
    else next_control=get_next();
    app_str("$ "); app(break_space);
    app_scrap(dead,no_math); /* scrap won't take part in the parsing */
  }
}
</t>
<t tx="ekr.20050502102905.315">@ @&lt;Start a format...@&gt;= {
  doing_format=1;
  if(*(loc-1)=='s' || *(loc-1)=='S') format_visible=0;
  if(!space_checked){emit_space_if_needed;save_position;}
  app_str("\\F"); /* this will produce `\&amp;{format }' */
@.\\F@&gt;
  next_control=get_next();
  if (next_control==identifier) {
    app(id_flag+(int)(id_lookup(id_first, id_loc,normal)-name_dir));
    app(' ');
    app(break_space); /* this is syntactically separate from what follows */
    next_control=get_next();
    if (next_control==identifier) {
      app(id_flag+(int)(id_lookup(id_first, id_loc,normal)-name_dir));
      app_scrap(exp,maybe_math); app_scrap(semi,maybe_math);
      next_control=get_next();
    }
  }
  if (scrap_ptr!=scrap_info+2) err_print("! Improper format definition");
@.Improper format definition@&gt;
}
</t>
<t tx="ekr.20050502102905.316">@ Finally, when the \TEX/ and definition parts have been treated, we have |next_control&gt;=begin_C|. We will make the global variable |this_section| point to the current section name, if it has a name.

@&lt;Global variables@&gt;=
name_pointer this_section; /* the current section name, or zero */

@ @&lt;Translate the \CEE/...@&gt;=
this_section=name_dir;
if (next_control&lt;=section_name) {
  emit_space_if_needed; init_stack;
  if (next_control==begin_C) next_control=get_next();
  else {
    this_section=cur_section;
    @&lt;Check that '=' or '==' follows this section name, and emit the scraps to start the section definition@&gt;;
  }
  while  (next_control&lt;=section_name) {
    outer_parse();
    @&lt;Emit the scrap for a section name if present@&gt;;
  }
  finish_C(1);
}
</t>
<t tx="ekr.20050502102905.317">@ The title of the section and an $\E$ or $\mathrel+\E$ are made into a scrap that should not take part in the parsing.

@&lt;Check that '='...@&gt;=
do next_control=get_next();
  while (next_control=='+'); /* allow optional `\.{+=}' */
if (next_control!='=' &amp;&amp; next_control!=eq_eq)
  err_print("! You need an = sign after the section name");
@.You need an = sign...@&gt;
  else next_control=get_next();
if (out_ptr&gt;out_buf+1 &amp;&amp; *out_ptr=='Y' &amp;&amp; *(out_ptr-1)=='\\') app(backup);
    /* the section name will be flush left */
@.\\Y@&gt;
app(section_flag+(int)(this_section-name_dir));
cur_xref=(xref_pointer)this_section-&gt;xref;
if(cur_xref-&gt;num==file_flag) cur_xref=cur_xref-&gt;xlink;
app_str("${}");
if (cur_xref-&gt;num!=section_count+def_flag) {
  app_str("\\mathrel+"); /*section name is multiply defined*/
  this_section=name_dir; /*so we won't give cross-reference info here*/
}
app_str("\\E"); /* output an equivalence sign */
@.\\E@&gt;
app_str("{}$");
app(force); app_scrap(dead,no_math);
        /* this forces a line break unless `\.{@@+}' follows */
</t>
<t tx="ekr.20050502102905.318">@ @&lt;Emit the scrap...@&gt;=
if (next_control&lt;section_name) {
  err_print("! You can't do that in C text");
@.You can't do that...@&gt;
  next_control=get_next();
}
else if (next_control==section_name) {
  app(section_flag+(int)(cur_section-name_dir));
  app_scrap(section_scrap,maybe_math);
  next_control=get_next();
}
</t>
<t tx="ekr.20050502102905.319">@ Cross references relating to a named section are given after the section ends.

@&lt;Show cross-references to this section@&gt;=
if (this_section&gt;name_dir) {
  cur_xref=(xref_pointer)this_section-&gt;xref;
  if (cur_xref-&gt;num==file_flag){an_output=1;cur_xref=cur_xref-&gt;xlink;}
  else an_output=0;
  if (cur_xref-&gt;num&gt;def_flag)
    cur_xref=cur_xref-&gt;xlink; /* bypass current section number */
  footnote(def_flag); footnote(cite_flag); footnote(0);
}
</t>
<t tx="ekr.20050502102905.32">@ Here is the main procedure for finding identifiers:

@c
name_pointer
id_lookup(first,last,t) /* looks up a string in the identifier table */
char *first; /* first character of string */
char *last; /* last character of string plus one */
char t; /* the |ilk|; used by \.{CWEAVE} only */
{
  char *i=first; /* position in |buffer| */
  int h; /* hash code */
  int l; /* length of the given identifier */
  name_pointer p; /* where the identifier is being sought */
  if (last==NULL) for (last=first; *last!='\0'; last++);
  l=last-first; /* compute the length */
  @&lt;Compute the hash code |h|@&gt;;
  @&lt;Compute the name location |p|@&gt;;
  if (p==name_ptr) @&lt;Enter a new name into the table at position |p|@&gt;;
  return(p);
}</t>
<t tx="ekr.20050502102905.320">@ @&lt;Output the code for the end of a section@&gt;=
out_str("\\fi"); finish_line();
@.\\fi@&gt;
flush_buffer(out_buf,0,0); /* insert a blank line, it looks nice */
</t>
<t tx="ekr.20050502102905.321">@ The |footnote| procedure gives cross-reference information about multiply defined section names (if the |flag| parameter is |def_flag|), or about references to a section name (if |flag==cite_flag|), or to its uses (if |flag==0|). It assumes that |cur_xref| points to the first cross-reference entry of interest, and it leaves |cur_xref| pointing to the first element not printed.  Typical outputs: `\.{\\A101.}'; `\.{\\Us 370\\ET1009.}'; `\.{\\As 8, 27\\*\\ETs64.}'.  Note that the output of \.{CWEAVE} is not English-specific; users may supply new definitions for the macros \.{\\A}, \.{\\As}, etc.

@&lt;Predeclaration of procedures@&gt;=
void footnote();

@ @c
void
footnote(flag) /* outputs section cross-references */
sixteen_bits flag;
{
  xref_pointer q; /* cross-reference pointer variable */
  if (cur_xref-&gt;num&lt;=flag) return;
  finish_line(); out('\\');
@.\\A@&gt;
@.\\Q@&gt;
@.\\U@&gt;
  out(flag==0? 'U': flag==cite_flag? 'Q': 'A');
  @&lt;Output all the section numbers on the reference list |cur_xref|@&gt;;
  out('.');
}
</t>
<t tx="ekr.20050502102905.322">@ The following code distinguishes three cases, according as the number of cross-references is one, two, or more than two. Variable |q| points to the first cross-reference, and the last link is a zero.

@&lt;Output all the section numbers on the reference list |cur_xref|@&gt;=
q=cur_xref; if (q-&gt;xlink-&gt;num&gt;flag) out('s'); /* plural */
while (1) {
  out_section(cur_xref-&gt;num-flag);
  cur_xref=cur_xref-&gt;xlink; /* point to the next cross-reference to output */
  if (cur_xref-&gt;num&lt;=flag) break;
  if (cur_xref-&gt;xlink-&gt;num&gt;flag) out_str(", "); /* not the last */
  else {out_str("\\ET"); /* the last */
@.\\ET@&gt;
  if (cur_xref != q-&gt;xlink) out('s'); /* the last of more than two */
  }
}
</t>
<t tx="ekr.20050502102905.323">@ The |finish_C| procedure outputs the translation of the current scraps, preceded by the control sequence `\.{\\B}' and followed by the control sequence `\.{\\par}'. It also restores the token and scrap memories to their initial empty state.  A |force| token is appended to the current scraps before translation takes place, so that the translation will normally end with \.{\\6} or \.{\\7} (the \TEX/ macros for |force| and |big_force|). This \.{\\6} or \.{\\7} is replaced by the concluding \.{\\par} or by \.{\\Y\\par}.

@&lt;Predeclaration of procedures@&gt;=
void finish_C();

@ @c
void
finish_C(visible) /* finishes a definition or a \CEE/ part */
  boolean visible; /* nonzero if we should produce \TEX/ output */
{
  text_pointer p; /* translation of the scraps */
  if (visible) {
    out_str("\\B"); app_tok(force); app_scrap(insert,no_math);
    p=translate();
@.\\B@&gt;
    app(tok_flag+(int)(p-tok_start)); make_output(); /* output the list */
    if (out_ptr&gt;out_buf+1)
      if (*(out_ptr-1)=='\\')
@.\\6@&gt;
@.\\7@&gt;
@.\\Y@&gt;
        if (*out_ptr=='6') out_ptr-=2;
        else if (*out_ptr=='7') *out_ptr='Y';
    out_str("\\par"); finish_line();
  }
  if (text_ptr&gt;max_text_ptr) max_text_ptr=text_ptr;
  if (tok_ptr&gt;max_tok_ptr) max_tok_ptr=tok_ptr;
  if (scrap_ptr&gt;max_scr_ptr) max_scr_ptr=scrap_ptr;
  tok_ptr=tok_mem+1; text_ptr=tok_start+1; scrap_ptr=scrap_info;
    /* forget the tokens and the scraps */
}
</t>
<t tx="ekr.20050502102905.324">@** Phase three processing. We are nearly finished! \.{CWEAVE}'s only remaining task is to write out the index, after sorting the identifiers and index entries.  If the user has set the |no_xref| flag (the \.{-x} option on the command line), just finish off the page, omitting the index, section name list, and table of contents.

@&lt;Predeclaration of procedures@&gt;=
void phase_three();</t>
<t tx="ekr.20050502102905.325">@ @c
void
phase_three() {
if (no_xref) {
  finish_line();
  out_str("\\end");
@.\\end@&gt;
  finish_line();
}
else {
  phase=3; if (show_progress) printf("\nWriting the index...");
@.Writing the index...@&gt;
  finish_line();
  if ((idx_file=fopen(idx_file_name,"w"))==NULL)
    fatal("! Cannot open index file ",idx_file_name);
@.Cannot open index file@&gt;
  if (change_exists) {
    @&lt;Tell about changed sections@&gt;; finish_line(); finish_line();
  }
  out_str("\\inx"); finish_line();
@.\\inx@&gt;
  active_file=idx_file; /* change active file to the index file */
  @&lt;Do the first pass of sorting@&gt;;
  @&lt;Sort and output the index@&gt;;
  finish_line(); fclose(active_file); /* finished with |idx_file| */
  active_file=tex_file; /* switch back to |tex_file| for a tic */
  out_str("\\fin"); finish_line();
@.\\fin@&gt;
  if ((scn_file=fopen(scn_file_name,"w"))==NULL)
    fatal("! Cannot open section file ",scn_file_name);
@.Cannot open section file@&gt;
  active_file=scn_file; /* change active file to section listing file */
  @&lt;Output all the section names@&gt;;
  finish_line(); fclose(active_file); /* finished with |scn_file| */
  active_file=tex_file;
  if (group_found) out_str("\\con");@+else out_str("\\end");
@.\\con@&gt;
@.\\end@&gt;
  finish_line();
  fclose(active_file);
}
if (show_happiness) printf("\nDone.");
check_complete(); /* was all of the change file used? */
}
</t>
<t tx="ekr.20050502102905.326">@ Just before the index comes a list of all the changed sections, including the index section itself.

@&lt;Global variables@&gt;=
sixteen_bits k_section; /* runs through the sections */

@ @&lt;Tell about changed sections@&gt;= {
  /* remember that the index is already marked as changed */
  k_section=0;
  while (!changed_section[++k_section]);
  out_str("\\ch ");
@.\\ch@&gt;
  out_section(k_section);
  while (k_section&lt;section_count) {
    while (!changed_section[++k_section]);
    out_str(", "); out_section(k_section);
  }
  out('.');
}
</t>
<t tx="ekr.20050502102905.327">@ A left-to-right radix sorting method is used, since this makes it easy to adjust the collating sequence and since the running time will be at worst proportional to the total length of all entries in the index. We put the identifiers into 102 different lists based on their first characters. (Uppercase letters are put into the same list as the corresponding lowercase letters, since we want to have `$t&lt;\\{TeX}&lt;\&amp;{to}$'.) The list for character |c| begins at location |bucket[c]| and continues through the |blink| array.

@&lt;Global variables@&gt;=
name_pointer bucket[256];
name_pointer next_name; /* successor of |cur_name| when sorting */
name_pointer blink[max_names]; /* links in the buckets */

@ To begin the sorting, we go through all the hash lists and put each entry having a nonempty cross-reference list into the proper bucket.

@&lt;Do the first pass of sorting@&gt;= {
int c;
for (c=0; c&lt;=255; c++) bucket[c]=NULL;
for (h=hash; h&lt;=hash_end; h++) {
  next_name=*h;
  while (next_name) {
    cur_name=next_name; next_name=cur_name-&gt;link;
    if (cur_name-&gt;xref!=(char*)xmem) {
      c=(eight_bits)((cur_name-&gt;byte_start)[0]);
      if (xisupper(c)) c=tolower(c);
      blink[cur_name-name_dir]=bucket[c]; bucket[c]=cur_name;
    }
  }
}
}
</t>
<t tx="ekr.20050502102905.328">@ During the sorting phase we shall use the |cat| and |trans| arrays from
\.{CWEAVE}'s parsing algorithm and rename them |depth| and |head|. They now
represent a stack of identifier lists for all the index entries that have
not yet been output. The variable |sort_ptr| tells how many such lists are
present; the lists are output in reverse order (first |sort_ptr|, then
|sort_ptr-1|, etc.). The |j|th list starts at |head[j]|, and if the first
|k| characters of all entries on this list are known to be equal we have
|depth[j]==k|.

@ @&lt;Rest of |trans_plus| union@&gt;=
name_pointer Head;

@ @d depth cat /* reclaims memory that is no longer needed for parsing */
@d head trans_plus.Head /* ditto */
@f sort_pointer int
@d sort_pointer scrap_pointer /* ditto */
@d sort_ptr scrap_ptr /* ditto */
@d max_sorts max_scraps /* ditto */

@&lt;Global variables@&gt;=
eight_bits cur_depth; /* depth of current buckets */
char *cur_byte; /* index into |byte_mem| */
sixteen_bits cur_val; /* current cross-reference number */
sort_pointer max_sort_ptr; /* largest value of |sort_ptr| */

@ @&lt;Set init...@&gt;=
max_sort_ptr=scrap_info;

@ The desired alphabetic order is specified by the |collate| array; namely, $|collate|[0]&lt;|collate|[1]&lt;\cdots&lt;|collate|[100]$.

@&lt;Global variables@&gt;=
eight_bits collate[102+128]; /* collation order */
@^high-bit character handling@&gt;

@ We use the order $\hbox{null}&lt;\.\ &lt;\hbox{other characters}&lt;{}$\.\_${}&lt; \.A=\.a&lt;\cdots&lt;\.Z=\.z&lt;\.0&lt;\cdots&lt;\.9.$ Warning: The collation mapping needs to be changed if ASCII code is not being used. @^ASCII code dependencies@&gt; @^high-bit character handling@&gt;  We initialize |collate| by copying a few characters at a time, because some \CEE/ compilers choke on long strings.

@&lt;Set initial values@&gt;=
collate[0]=0;
strcpy(collate+1," \1\2\3\4\5\6\7\10\11\12\13\14\15\16\17");
/* 16 characters + 1 = 17 */
strcpy(collate+17,"\20\21\22\23\24\25\26\27\30\31\32\33\34\35\36\37");
/* 16 characters + 17 = 33 */
strcpy(collate+33,"!\42#$%&amp;'()*+,-./:;&lt;=&gt;?@@[\\]^`{|}~_");
/* 32 characters + 33 = 65 */
strcpy(collate+65,"abcdefghijklmnopqrstuvwxyz0123456789");
/* (26 + 10) characters + 65 = 101 */
strcpy(collate+101,"\200\201\202\203\204\205\206\207\210\211\212\213\214\215\216\217");
/* 16 characters + 101 = 117 */
strcpy(collate+117,"\220\221\222\223\224\225\226\227\230\231\232\233\234\235\236\237");
/* 16 characters + 117 = 133 */
strcpy(collate+133,"\240\241\242\243\244\245\246\247\250\251\252\253\254\255\256\257");
/* 16 characters + 133 = 149 */
strcpy(collate+149,"\260\261\262\263\264\265\266\267\270\271\272\273\274\275\276\277");
/* 16 characters + 149 = 165 */
strcpy(collate+165,"\300\301\302\303\304\305\306\307\310\311\312\313\314\315\316\317");
/* 16 characters + 165 = 181 */
strcpy(collate+181,"\320\321\322\323\324\325\326\327\330\331\332\333\334\335\336\337");
/* 16 characters + 181 = 197 */
strcpy(collate+197,"\340\341\342\343\344\345\346\347\350\351\352\353\354\355\356\357");
/* 16 characters + 197 = 213 */
strcpy(collate+213,"\360\361\362\363\364\365\366\367\370\371\372\373\374\375\376\377");
/* 16 characters + 213 = 229 */

@ @&lt;Sort and output...@&gt;=
sort_ptr=scrap_info; unbucket(1);
while (sort_ptr&gt;scrap_info) {
  cur_depth=sort_ptr-&gt;depth;
  if (blink[sort_ptr-&gt;head-name_dir]==0 || cur_depth==infinity)
    @&lt;Output index entries for the list at |sort_ptr|@&gt;@;
  else @&lt;Split the list at |sort_ptr| into further lists@&gt;;
}
</t>
<t tx="ekr.20050502102905.329">@ @&lt;Split the list...@&gt;= {
  eight_bits c;
  next_name=sort_ptr-&gt;head;
  do {
    cur_name=next_name; next_name=blink[cur_name-name_dir];
    cur_byte=cur_name-&gt;byte_start+cur_depth;
    if (cur_byte==(cur_name+1)-&gt;byte_start) c=0; /* hit end of the name */
    else {
      c=(eight_bits) *cur_byte;
      if (xisupper(c)) c=tolower(c);
    }
  blink[cur_name-name_dir]=bucket[c]; bucket[c]=cur_name;
  } while (next_name);
  --sort_ptr; unbucket(cur_depth+1);
}
</t>
<t tx="ekr.20050502102905.33">@ A simple hash code is used: If the sequence of character codes is $c_1c_2\ldots c_n$, its hash value will be $$(2^{n-1}c_1+2^{n-2}c_2+\cdots+c_n)\,\bmod\,|hash_size|.$$

@&lt;Compute the hash code |h|@&gt;=
h=(unsigned char)*i;
while (++i&lt;last) h=(h+h+(int)((unsigned char)*i)) % hash_size;
@^high-bit character handling@&gt;
</t>
<t tx="ekr.20050502102905.330">@ @&lt;Output index...@&gt;= {
  cur_name=sort_ptr-&gt;head;
  do {
    out_str("\\I");
@.\\I@&gt;
    @&lt;Output the name at |cur_name|@&gt;;
    @&lt;Output the cross-references at |cur_name|@&gt;;
    cur_name=blink[cur_name-name_dir];
  } while (cur_name);
  --sort_ptr;
}
</t>
<t tx="ekr.20050502102905.331">@ @&lt;Output the name...@&gt;=
switch (cur_name-&gt;ilk) {
  case normal: case func_template: if (is_tiny(cur_name)) out_str("\\|");
    else {char *j;
      for (j=cur_name-&gt;byte_start;j&lt;(cur_name+1)-&gt;byte_start;j++)
        if (xislower(*j)) goto lowcase;
      out_str("\\."); break;
lowcase: out_str("\\\\");
    }
  break;
@.\\|@&gt;
@.\\.@&gt;
@.\\\\@&gt;
  case wildcard: out_str("\\9");@+ goto not_an_identifier;
@.\\9@&gt;
  case typewriter: out_str("\\.");
@.\\.@&gt;
  case roman: not_an_identifier: out_name(cur_name,0); goto name_done;
  case custom: {char *j; out_str("$\\");
    for (j=cur_name-&gt;byte_start;j&lt;(cur_name+1)-&gt;byte_start;j++)
      out(*j=='_'? 'x': *j=='$'? 'X': *j);
    out('$');
    goto name_done;
    }
  default: out_str("\\&amp;");
@.\\\&amp;@&gt;
}
out_name(cur_name,1);
name_done:@;
</t>
<t tx="ekr.20050502102905.332">@ Section numbers that are to be underlined are enclosed in `\.{\\[}$\,\ldots\,$\.]'.

@&lt;Output the cross-references at |cur_name|@&gt;=
@&lt;Invert the cross-reference list at |cur_name|, making |cur_xref| the head@&gt;;
do {
  out_str(", "); cur_val=cur_xref-&gt;num;
  if (cur_val&lt;def_flag) out_section(cur_val);
  else {out_str("\\["); out_section(cur_val-def_flag); out(']');}
@.\\[@&gt;
  cur_xref=cur_xref-&gt;xlink;
} while (cur_xref!=xmem);
out('.'); finish_line();
</t>
<t tx="ekr.20050502102905.333">@ List inversion is best thought of as popping elements off one stack and pushing them onto another. In this case |cur_xref| will be the head of the stack that we push things onto.

@&lt;Global variables@&gt;=
xref_pointer next_xref, this_xref;
  /* pointer variables for rearranging a list */

@ @&lt;Invert the cross-reference list at |cur_name|, making |cur_xref| the head@&gt;=
this_xref=(xref_pointer)cur_name-&gt;xref; cur_xref=xmem;
do {
  next_xref=this_xref-&gt;xlink; this_xref-&gt;xlink=cur_xref;
  cur_xref=this_xref; this_xref=next_xref;
} while (this_xref!=xmem);
</t>
<t tx="ekr.20050502102905.334">@ @&lt;Output all the section names@&gt;=section_print(root)
</t>
<t tx="ekr.20050502102905.335">@ Procedure |unbucket| goes through the buckets and adds nonempty lists to the stack, using the collating sequence specified in the |collate| array. The parameter to |unbucket| tells the current depth in the buckets. Any two sequences that agree in their first 255 character positions are regarded as identical.

@d infinity 255 /* $\infty$ (approximately) */

@&lt;Predeclaration of procedures@&gt;=
void  unbucket();

@ @c
void
unbucket(d) /* empties buckets having depth |d| */
eight_bits d;
{
  int c;  /* index into |bucket|; cannot be a simple |char| because of sign
    comparison below*/
  for (c=100+128; c&gt;= 0; c--) if (bucket[collate[c]]) {
@^high-bit character handling@&gt;
    if (sort_ptr&gt;=scrap_info_end) overflow("sorting");
    sort_ptr++;
    if (sort_ptr&gt;max_sort_ptr) max_sort_ptr=sort_ptr;
    if (c==0) sort_ptr-&gt;depth=infinity;
    else sort_ptr-&gt;depth=d;
    sort_ptr-&gt;head=bucket[collate[c]]; bucket[collate[c]]=NULL;
  }
}
</t>
<t tx="ekr.20050502102905.336">@ The following recursive procedure walks through the tree of section names and prints them. @^recursion@&gt;

@&lt;Predeclaration of procedures@&gt;=
void section_print();

@ @c
void
section_print(p) /* print all section names in subtree |p| */
name_pointer p;
{
  if (p) {
    section_print(p-&gt;llink); out_str("\\I");
@.\\I@&gt;
    tok_ptr=tok_mem+1; text_ptr=tok_start+1; scrap_ptr=scrap_info; init_stack;
    app(p-name_dir+section_flag); make_output();
    footnote(cite_flag);
    footnote(0); /* |cur_xref| was set by |make_output| */
    finish_line();@/
    section_print(p-&gt;rlink);
  }
}
</t>
<t tx="ekr.20050502102905.337">@ Because on some systems the difference between two pointers is a |long| rather than an |int|, we use \.{\%ld} to print these quantities.

@c
void
print_stats() {
  printf("\nMemory usage statistics:\n");
@.Memory usage statistics:@&gt;
  printf("%ld names (out of %ld)\n",
            (long)(name_ptr-name_dir),(long)max_names);
  printf("%ld cross-references (out of %ld)\n",
            (long)(xref_ptr-xmem),(long)max_refs);
  printf("%ld bytes (out of %ld)\n",
            (long)(byte_ptr-byte_mem),(long)max_bytes);
  printf("Parsing:\n");
  printf("%ld scraps (out of %ld)\n",
            (long)(max_scr_ptr-scrap_info),(long)max_scraps);
  printf("%ld texts (out of %ld)\n",
            (long)(max_text_ptr-tok_start),(long)max_texts);
  printf("%ld tokens (out of %ld)\n",
            (long)(max_tok_ptr-tok_mem),(long)max_toks);
  printf("%ld levels (out of %ld)\n",
            (long)(max_stack_ptr-stack),(long)stack_size);
  printf("Sorting:\n");
  printf("%ld levels (out of %ld)\n",
            (long)(max_sort_ptr-scrap_info),(long)max_scraps);
}</t>
<t tx="ekr.20050502102905.338">@** Index.
If you have read and understood the code for Phase III above, you know what
is in this index and how it got here. All sections in which an identifier is
used are listed with that identifier, except that reserved words are
indexed only when they appear in format definitions, and the appearances
of identifiers in section names are not indexed. Underlined entries
correspond to where the identifier was declared. Error messages, control
sequences put into the output, and a few
other things like ``recursion'' are indexed here too.</t>
<t tx="ekr.20050502102905.339">@language cweb
@ignore
@others</t>
<t tx="ekr.20050502102905.34">@ If the identifier is new, it will be placed in position |p=name_ptr|, otherwise |p| will point to its existing location.

@&lt;Compute the name location |p|@&gt;=
p=hash[h];
while (p &amp;&amp; !names_match(p,first,l,t)) p=p-&gt;link;
if (p==NULL) {
  p=name_ptr; /* the current identifier is new */
  p-&gt;link=hash[h]; hash[h]=p; /* insert |p| at beginning of hash list */
}
</t>
<t tx="ekr.20050502102905.340">@ % This file is part of CWEB.
% This program by Silvio Levy and Donald E. Knuth
% is based on a program by Knuth.
% It is distributed WITHOUT ANY WARRANTY, express or implied.
% Version 3.6 --- May 2000
%
@ Here is a table of all the productions.  Each production that
combines two or more consecutive scraps implicitly inserts a {\tt \$}
where necessary, that is, between scraps whose abutting boundaries
have different |mathness|.  In this way we never get double {\tt\$\$}.

% The following kludge is needed because \newcount, \newdimen, and \+
% are "\outer" control sequences that cannot be used in skipped text!
\fi \newcount\prodno \newdimen\midcol \let\+\relax \ifon

\def\v{\char'174} 
\mathchardef\RA="3221 % right arrow
\mathchardef\BA="3224 % double arrow

A translation is provided when the resulting scrap is not merely a
juxtaposition of the scraps it comes from.  An asterisk$^*$ next to a scrap
means that its first identifier gets an underlined entry in the index,
via the function |make_underlined|.  Two asterisks$^{**}$ means that both
|make_underlined| and |make_reserved| are called; that is, the
identifier's ilk becomes |raw_int|.  A dagger \dag\ before the
production number refers to the notes at the end of this section,
which deal with various exceptional cases.

We use \\{in}, \\{out}, \\{back} and
\\{bsp} as shorthands for |indent|, |outdent|, |backup| and
|break_space|, respectively.

\begingroup \lineskip=4pt
\def\alt #1 #2
{$\displaystyle\Bigl\{\!\matrix{\strut\hbox{#1}\cr
   \strut\hbox{#2}\cr}\!\Bigr\}$ }
\def\altt #1 #2 #3
{$\displaystyle\Biggl\{\!\matrix{\strut\hbox{#1}\cr\hbox{#2}\cr
   \strut\hbox{#3}\cr}\!\Biggr\}$ }
\def\malt #1 #2
{$\displaystyle\matrix{\strut\hbox{#1}\hfill\cr\strut\hbox{#2}\hfill\cr}$}
\def\maltt #1 #2 #3
{$\displaystyle\matrix{\strut\hbox{#1}\hfill\cr\hbox{#2}\hfill\cr
   \strut\hbox{#3}\hfill\cr}$}
\yskip
\prodno=0 \midcol=2.5in
\def\theprodno{\number\prodno \global\advance\prodno by1\enspace}
\def\dagit{\dag\theprodno}
\def\+#1&amp;#2&amp;#3&amp;#4\cr{\def\next{#1}%
 \line{\hbox to 2em{\hss
  \ifx\next\empty\theprodno\else\next\fi}\strut
  \ignorespaces#2\hfil\hbox to\midcol{$\RA$
  \ignorespaces#3\hfil}\quad \hbox to1.45in{\ignorespaces#4\hfil}}}
\+\relax &amp; LHS &amp; RHS \hfill Translation &amp; Example\cr
\yskip
\+&amp; \altt\\{any} {\\{any} \\{any}} {\\{any} \\{any} \\{any}}
|insert| &amp; \altt\\{any} {\\{any} \\{any}} {\\{any} \\{any} \\{any}}
&amp; stmt; \ /$\ast\,$comment$\,*$/\cr
\+&amp; |exp| \altt|lbrace| |int_like| |decl|
    &amp; |fn_decl| \altt|lbrace| |int_like| |decl|
        \hfill $F=E^*\,|in|\,|in|$ &amp; \malt {\\{main}()$\{$}
           {\\{main}$(\\{ac},\\{av})$ \&amp;{int} \\{ac};} \cr
\+&amp; |exp| |unop| &amp; |exp| &amp; |x++|\cr
\+&amp; |exp| \alt |binop| |ubinop| |exp| &amp; |exp| &amp; \malt {|x/y|} {|x+y|} \cr
\+&amp; |exp| |comma| |exp| &amp; |exp| \hfill $EC\,|opt|9\,E$&amp; |f(x,y)|\cr
\+&amp; |exp| \alt {|lpar| |rpar|} |cast| |colon| &amp;
    |exp| \alt {|lpar| |rpar|} |cast| |base| &amp;
     \malt \&amp;C|()|: {\&amp;C|int i)|:} \cr
\+&amp; |exp| |semi| &amp; |stmt| &amp; |x=0;|\cr
\+&amp; |exp| |colon| &amp; |tag| \hfill $E^*C$ &amp; |found:|\cr
\+&amp; |exp| |rbrace| &amp; |stmt| |rbrace| &amp; end of \&amp;{enum} list\cr
\+&amp; |exp| \alt {|lpar| |rpar|} |cast|  \alt|const_like| |case_like| &amp;
      |exp| \alt {|lpar| |rpar|} |cast|  \hfill
       \alt $R=R\.\ C$ $C_1=C_1\.\ C_2$ &amp; 
      \malt {|f() const|} {|f(int) throw|} \cr
\+&amp; |exp| \alt |exp| |cast| &amp; |exp| &amp; |time()|\cr
\+&amp; |lpar| \alt |exp| |ubinop| |rpar| &amp; |exp| &amp; \malt{|(x)|} {|(*)|} \cr
\+&amp; |lpar| |rpar| &amp; |exp| \hfill $L\.{\\,}R$ &amp; functions, declarations\cr
\+&amp; |lpar| \altt |decl_head| |int_like| |cast| |rpar| &amp; |cast| &amp; |(char*)|\cr
\+&amp; |lpar| \altt |decl_head| |int_like| |exp| |comma| &amp; |lpar| \hfill
     $L$\,\altt $D$ $I$ $E$ $C$\,|opt|9 &amp; |(int,|\cr
\+&amp; |lpar| \alt |stmt| |decl| &amp; |lpar| \hfill \alt {$LS\.\ $} {$LD\.\ $} &amp;
    \malt {|(k=5;|} {|(int k=5;|} \cr
\+&amp; |unop| \alt |exp| |int_like| &amp; |exp| &amp;
      \malt |!x| |~|\&amp;C \cr
\+&amp; |ubinop| |cast| |rpar| &amp; |cast| |rpar| \hfill
      $C=\.\{U\.\}C$ &amp; |*|\&amp;{CPtr}) \cr
\+&amp; |ubinop| \alt|exp| |int_like| &amp; \alt|exp| |int_like| \hfill
  \.\{$U$\.\}\alt$E$ $I$ &amp; \malt |*x| |*|\&amp;{CPtr} \cr
\+&amp; |ubinop| |binop| &amp; |binop| \hfill $|math_rel|\,U\.\{B\.\}\.\}$ &amp; |*=|\cr
\+&amp; |binop| |binop| &amp; |binop| \hfill
                        $|math_rel|\,\.\{B_1\.\}\.\{B_2\.\}\.\}$ &amp; |&gt;&gt;=|\cr
\+&amp; |cast| \alt |lpar| |exp| &amp; \alt |lpar| |exp| \hfill
  \alt $CL$ $C\.\ E$ &amp; \malt |(double)(x+2)| |(double)x| \cr
\+&amp; |cast| |semi| &amp; |exp| |semi| &amp; |(int);|\cr
\+&amp; |sizeof_like| |cast| &amp; |exp| &amp; |sizeof (double)|\cr
\+&amp; |sizeof_like| |exp| &amp; |exp| \hfill $S\.\ E$ &amp; |sizeof x|\cr
\+&amp; |int_like| \alt|int_like| |struct_like| &amp;
        \alt|int_like| |struct_like| \hfill $I\.\ $\alt $I$ $S$
        \unskip&amp; |extern char|\cr
\+&amp; |int_like| |exp| \alt|raw_int| |struct_like| &amp;
         |int_like| \alt|raw_int| |struct_like| &amp; |extern "Ada" int|\cr
\+&amp; |int_like| \altt|exp| |ubinop| |colon| &amp;
   |decl_head| \altt|exp| |ubinop| |colon| \hfill
         $D=I$\.\  &amp; \maltt|int x| |int*x| |unsigned:| \cr
\+&amp; |int_like| \alt |semi| |binop| &amp; |decl_head| \alt |semi| |binop| &amp;
        \malt |int x;| {\&amp;{int} $f(\&amp;{int}=4)$} \cr
\+&amp; |public_like| |colon| &amp; |tag| &amp; \&amp;{private}:\cr
\+&amp; |public_like| &amp; |int_like| &amp; \&amp;{private}\cr
\+&amp; |colcol| \alt|exp| |int_like| &amp; \alt|exp| |int_like| \hfill
     |qualifier| $C$ \alt$E$ $I$ &amp; \&amp;C\DC$x$\cr
\+&amp; |colcol| |colcol| &amp; |colcol| &amp; \&amp;C\DC\&amp;B\DC\cr
\+&amp; |decl_head| |comma| &amp; |decl_head| \hfill $DC\.\ $ &amp; |int x,|\cr
\+&amp; |decl_head| |ubinop| &amp; |decl_head| \hfill $D\.\{U\.\}$ &amp; |int *|\cr
\+\dagit&amp; |decl_head| |exp| &amp; |decl_head| \hfill $DE^*$ &amp; |int x|\cr
\+&amp; |decl_head| \alt|binop| |colon| |exp| \altt|comma| |semi| |rpar| &amp;
     |decl_head| \altt|comma| |semi| |rpar| \hfill
     $D=D$\alt $B$ $C$ \unskip$E$ &amp; \malt {\&amp;{int} $f(\&amp;{int}\ x=2)$} |int b:1| \cr
\+&amp; |decl_head| |cast| &amp; |decl_head| &amp; |int f(int)|\cr
\+&amp; |decl_head| \altt|int_like| |lbrace| |decl| &amp; |fn_decl|
                   \altt|int_like| |lbrace| |decl| \hfill $F=D\,|in|\,|in|$
                             &amp; |long time () {|\cr
\+&amp; |decl_head| |semi| &amp; |decl| &amp; |int n;|\cr
\+&amp; |decl| |decl| &amp; |decl| \hfill $D_1\,|force|\,D_2$ &amp; |int n;double x;|\cr
\+&amp; |decl| \alt|stmt| |function| &amp; \alt|stmt| |function|
        \hfill $D\,|big_force|\,$\alt $S$ $F$ \unskip&amp; \&amp;{extern} $n$;
            \\{main} ()|{}|\cr
\+&amp; |base| \alt |int_like| |exp| |comma| &amp; |base| \hfill
     $B$\.\ \alt $I$ $E$ \unskip$C$\,|opt|9
 &amp; \malt {: \&amp;{public} \&amp;A,} {: $i(5)$,} \cr
\+&amp; |base| \alt |int_like| |exp| |lbrace| &amp; |lbrace| \hfill
     $B$\.\ \alt $I$ $E$ \unskip\.\ $L$ &amp; \&amp;D : \&amp;{public} \&amp;A $\{$\cr
\+&amp; |struct_like| |lbrace| &amp; |struct_head| \hfill $S\.\ L$ &amp; |struct {|\cr
\+&amp; |struct_like| \alt|exp| |int_like| |semi| &amp; |decl_head| |semi|
     \hfill $S\.\ $\alt $E^{**}$ $I^{**}$ &amp; \&amp;{struct} \&amp;{forward};\cr
\+&amp; |struct_like| \alt|exp| |int_like| |lbrace| &amp; |struct_head| \hfill
     $S\.\ $\alt $E^{**}$ $I^{**}$ \unskip $\.\ L$ &amp;
              \&amp;{struct} \&amp;{name\_info} $\{$\cr
\+&amp; |struct_like| \alt|exp| |int_like| |colon| &amp;
    |struct_like| \alt|exp| |int_like| |base| &amp; |class| \&amp;C :\cr
\+\dagit&amp; |struct_like| \alt|exp| |int_like| &amp; |int_like|
        \hfill $S\.\ $\alt$E$ $I$ &amp; \&amp;{struct} \&amp;{name\_info} $z$;\cr
\+&amp; |struct_head| \altt|decl| |stmt| |function| |rbrace| &amp; |int_like|\hfill
         $S\,\\{in}\,|force|$\altt$D$ $S$ $F$ $\\{out}\,|force|\,R$ &amp;
                                        |struct {| declaration |}|\cr
\+&amp; |struct_head| |rbrace| &amp; |int_like|\hfill $S\.{\\,}R$ &amp; |class C{}|\cr
\+&amp; |fn_decl| |decl| &amp; |fn_decl| \hfill $F\,|force|\,D$
                                       &amp; $f(z)$ \&amp;{double} $z$; \cr
\+&amp; |fn_decl| |stmt| &amp; |function| \hfill $F\,|out|\,|out|\,|force|\,S$
                                       &amp; \\{main}() {\dots}\cr
\+&amp; |function| \altt|stmt| |decl| |function| &amp; \altt |stmt| |decl| |function|
   \hfill $F\,|big_force|\,$\altt $S$ $D$ $F$ &amp; outer block\cr
\+&amp; |lbrace| |rbrace| &amp; |stmt| \hfill $L\.{\\,}R$ &amp; empty statement\cr
\advance\midcol35pt
\+&amp; |lbrace| \altt|stmt| |decl| |function| |rbrace| &amp; |stmt| \hfill
     $|force|\,L\,\\{in}\,|force|\,S\,
                |force|\,\\{back}\,R\,\\{out}\,|force|$ &amp; compound statement\cr
\advance\midcol-20pt
\+&amp; |lbrace| |exp| [|comma|] |rbrace| &amp; |exp| &amp; initializer\cr
\+&amp; |if_like| |exp| &amp; |if_clause| \hfill $I\.{\ }E$ &amp; |if (z)|\cr
\+&amp; |else_like| |colon| &amp; |else_like| |base| &amp; \&amp;{try} :\cr
\+&amp; |else_like| |lbrace| &amp; |else_head| |lbrace| &amp; \&amp;{else} $\{$\cr
\+&amp; |else_like| |stmt| &amp; |stmt| \hfill
       $|force|\,E\,\\{in}\,\\{bsp}\,S\,\\{out}\,|force|$ &amp; |else x=0;|\cr
\+&amp; |else_head| \alt|stmt| |exp|  &amp; |stmt| \hfill
      $|force|\,E\,\\{bsp}\,|noop|\,|cancel|\,S\,\\{bsp}$ &amp; |else{x=0;}|\cr
\+&amp; |if_clause| |lbrace| &amp; |if_head| |lbrace| &amp; |if (x) {|\cr
\+&amp; |if_clause| |stmt| |else_like| |if_like| &amp; |if_like| \hfill
    $|force|\,I\,\\{in}\,\\{bsp}\,S\,\\{out}\,|force|\,E\,\.\ I$ &amp;
     |if (x) y; else if|\cr
\+&amp; |if_clause| |stmt| |else_like| &amp; |else_like| \hfill
    $|force|\,I\,\\{in}\,\\{bsp}\,S\,\\{out}\,|force|\,E$ &amp;
   |if (x) y; else|\cr
\+&amp; |if_clause| |stmt| &amp; |else_like| |stmt| &amp; |if (x)|\cr
\+&amp; |if_head| \alt|stmt| |exp| |else_like| |if_like| &amp; |if_like| \hfill
    $|force|\,I\,\\{bsp}\,|noop|\,|cancel|\,S\,|force|\,E\,\.\ I$ &amp;
     |if (x){y;}else if|\cr
\+&amp; |if_head| \alt|stmt| |exp| |else_like| &amp; |else_like| \hfill
    $|force|\,I\,\\{bsp}\,|noop|\,|cancel|\,S\,|force|\,E$ &amp;
   |if (x){y;}else|\cr
\+&amp; |if_head| \alt|stmt| |exp| &amp; |else_head| \alt|stmt| |exp| &amp; |if (x){y;}|\cr
\advance\midcol20pt
\+&amp; |do_like| |stmt| |else_like| |semi| &amp; |stmt| \hfill
      $D\,\\{bsp}\,|noop|\,|cancel|\,S\,|cancel|\,|noop|\,\\{bsp}\,ES$%
      &amp;       |do f(x); while (g(x));|\cr
\advance\midcol-20pt
\+&amp; |case_like| |semi| &amp; |stmt| &amp; |return;|\cr
\+&amp; |case_like| |colon| &amp; |tag| &amp; |default:|\cr
\+&amp; |case_like| |exp| &amp; |exp| \hfill $C\.\ E$ &amp; |return 0|\cr
\+&amp; |catch_like| \alt|cast| |exp| &amp; |fn_decl| \hfill
    $C$\alt $C$ $E$ \\{in}\,\\{in} &amp; |catch (...)|\cr
\+&amp; |tag| |tag| &amp; |tag| \hfill $T_1\,\\{bsp}\,T_2$ &amp; |case 0: case 1:|\cr
\+&amp; |tag| \altt|stmt| |decl| |function| &amp; \altt|stmt| |decl| |function|
       \hfill $|force|\,\\{back}\,T\,\\{bsp}\,S$ &amp; |case 0: z=0;|\cr
\+\dagit&amp; |stmt| \altt|stmt| |decl| |function| &amp;
   \altt|stmt| |decl| |function|
      \hfill $S\,$\altt$|force|\,S$ $|big_force|\,D$ $|big_force|\,F$ &amp;
      |x=1;y=2;|\cr
\+&amp; |semi| &amp; |stmt| \hfill \.\ $S$&amp; empty statement\cr
\+\dagit&amp; |lproc| \altt |if_like| |else_like| |define_like| &amp; |lproc| &amp;
         \maltt {{\bf \#include}} {\bf\#else} {\bf\#define} \cr
\+&amp; |lproc| |rproc| &amp; |insert| &amp; {\bf\#endif} \cr
\+&amp; |lproc| \alt {|exp| [|exp|]} |function| |rproc| &amp; |insert| \hfill
    $I$\.\ \alt {$E{[\.{\ \\5}E]}$} {$F$} &amp;
 \malt{{\bf\#define} $a$\enspace 1} {{\bf\#define} $a$\enspace$\{\,b;\,\}$} \cr
\+&amp; |section_scrap| |semi| &amp; |stmt|\hfill $MS$ |force|
   &amp;$\langle\,$section name$\,\rangle$;\cr
\+&amp; |section_scrap| &amp; |exp| &amp;$\langle\,$section name$\,\rangle$\cr
\+&amp; |insert| |any| &amp; |any| &amp; \.{\v\#include\v}\cr
\+&amp; |prelangle| &amp; |binop| \hfill \.&lt; &amp; $&lt;$ not in template\cr
\+&amp; |prerangle| &amp; |binop| \hfill \.&gt; &amp; $&gt;$ not in template\cr
\+&amp; |langle| |prerangle| &amp; |cast| \hfill $L\.{\\,}P$ &amp; $\langle\,\rangle$\cr
\+&amp; |langle| \altt|decl_head| |int_like| |exp| |prerangle| &amp; |cast| &amp;
     $\langle\&amp;{class}\,\&amp;C\rangle$\cr
\+&amp; |langle| \altt|decl_head| |int_like| |exp| |comma| &amp; |langle| \hfill
     $L$\,\altt $D$ $I$ $E$ $C$\,|opt|9 &amp; $\langle\&amp;{class}\,\&amp;C,$\cr
\+&amp; |template_like| |exp| |prelangle| &amp; |template_like| |exp| |langle| &amp;
  \&amp;{template} $a\langle100\rangle$\cr
\+&amp; |template_like| \alt|exp| |raw_int| &amp; \alt|exp| |raw_int| \hfill
    $T$\.\ \alt$E$ $R$ &amp; \&amp;C\DC\&amp;{template} |a()|\cr
\+&amp; |template_like| &amp; |raw_int| &amp; \&amp;{template}$\langle\&amp;{class}\,\&amp;T\rangle$\cr
\+&amp; |new_like| |lpar| |exp| |rpar| &amp; |new_like| &amp; \&amp;{new}(\\{nothrow})\cr
\+&amp; |new_like| |cast| &amp; |exp| \hfill $N\.\ C$ &amp; |new(int*)|\cr
\+\dagit&amp; |new_like| &amp; |new_exp| &amp; \&amp;{new} \&amp;C|()|\cr
\+&amp; |new_exp| \alt|int_like| |const_like| &amp; |new_exp| \hfill
    $N$\.\ \alt $I$ $C$ &amp; |new const int|\cr
\+&amp; |new_exp| |struct_like| \alt |exp| |int_like| &amp; |new_exp| \hfill
    $N\.\ S$\.\ \alt $E$ $I$ &amp; \&amp;{new} \&amp;{struct} \&amp;S\cr
\+&amp; |new_exp| |raw_ubin| &amp; |new_exp| \hfill $N\.\{R\.\}$ &amp; |new int*[2]|\cr
\+&amp; |new_exp| \alt |lpar| |exp| &amp; |exp| \alt |lpar| |exp| \hfill
    $E=N$\,\alt {} {\.\ } &amp; \malt |operator[](int)| {|new int(2)|} \cr
\+\dagit&amp; |new_exp| &amp; |exp| &amp; |new int;|\cr
\+&amp; |ftemplate| |prelangle| &amp; |ftemplate| |langle| &amp; |make_pair&lt;int,int&gt;|\cr
\+&amp; |ftemplate| &amp; |exp| &amp; |make_pair(1,2)|\cr
\+&amp; |for_like| |exp| &amp; |else_like| \hfill $F\.\ E$ &amp; |while (1)|\cr
\+&amp; |raw_ubin| |const_like| &amp; |raw_ubin| \hfill $RC$\.{\\\ }
     &amp; $*$\&amp;{const} |x|\cr
\+&amp; |raw_ubin| &amp; |ubinop| &amp; $*$ |x|\cr
\+&amp; |const_like| &amp; |int_like| &amp; \&amp;{const} |x|\cr
\+&amp; |raw_int| |prelangle| &amp; |raw_int| |langle| &amp; \&amp;C$\langle$\cr
\+&amp; |raw_int| |colcol| &amp; |colcol| &amp; \&amp;C\DC\cr
\+&amp; |raw_int| |cast| &amp; |raw_int| &amp; \&amp;C$\langle\&amp;{class}\ \&amp;T\rangle$\cr
\+&amp; |raw_int| |lpar| &amp; |exp| |lpar| &amp; \&amp;{complex}$(x,y)$\cr
\+\dagit&amp; |raw_int| &amp; |int_like|   &amp; \&amp;{complex} |z|\cr
\+\dagit&amp; |operator_like| \altt|binop| |unop| |ubinop| &amp; |exp|
    \hfill $O$\.\{\altt $B$ $U$ $U$ \unskip\.\} &amp; |operator+|\cr
\+&amp; |operator_like| \alt|new_like| |delete_like| &amp; |exp| \hfill
    $O$\.\ \alt $N$ $S$ &amp; |operator delete|\cr
\+&amp; |operator_like| |comma| &amp; |exp| &amp; \&amp;{operator},\cr
\+\dagit&amp; |operator_like| &amp; |new_exp| &amp; |operator char*|\cr
\advance\midcol-8pt
\+&amp; |typedef_like| \alt|int_like| |cast| \alt|comma| |semi| &amp;
    |typedef_like| |exp| \alt|comma| |semi| &amp; \&amp;{typedef} \&amp;{int} \&amp;I,\cr
\advance\midcol+8pt
\+&amp; |typedef_like| |int_like| &amp; |typedef_like| \hfill $T\.\ I$ &amp;
    \&amp;{typedef} \&amp;{char}\cr
\+\dagit&amp; |typedef_like| |exp| &amp; |typedef_like| \hfill $T\.\ E^{**}$ &amp;
    \&amp;{typedef} \&amp;I \.{@@[@@]} (|*|\&amp;P)\cr
\+&amp; |typedef_like| |comma| &amp; |typedef_like| \hfill $TC\.\ $ &amp;
    \&amp;{typedef} \&amp;{int} \&amp;x,\cr
\+&amp; |typedef_like| |semi| &amp; |decl| &amp; \&amp;{typedef} \&amp;{int} $\&amp;x,\&amp;y$;\cr
\+&amp; |typedef_like| |ubinop| \alt |cast| |ubinop| &amp; 
    |typedef_like| \alt |cast| |ubinop| \hfill
    \alt $C=\.\{U\.\}C$ $U_2=\.\{U_1\.\}U_2$ \unskip &amp;
    \&amp;{typedef} |*|{}|*|(\&amp;{CPtr})\cr
\+&amp; |delete_like| |lpar| |rpar| &amp; |delete_like|\hfill $DL\.{\\,}R$ &amp;
    \&amp;{delete}|[]| \cr
\+&amp; |delete_like| |exp| &amp; |exp| \hfill $D\.\ E$ &amp; |delete p| \cr
\+\dagit&amp; |question| |exp| \alt |colon| |base| &amp; |binop| &amp;
    \malt |?x:| |?f():| \cr
\+&amp; |begin_arg| |end_arg| &amp; |exp| &amp; \.{@@[}\&amp;{char}$*$\.{@@]}\cr
\+&amp; |any_other| |end_arg| &amp; |end_arg| &amp;    \&amp;{char}$*$\.{@@]}\cr
\yskip
\yskip
\yskip
\parindent=0pt
\dag{\bf Notes}
\yskip
Rule 35: The |exp| must not be immediately followed by |lpar|, |exp|,
 or~|cast|.

Rule 48: The |exp| or |int_like| must not be immediately followed by |base|.

Rule 76: The |force| in the |stmt| line becomes \\{bsp} if \.{CWEAVE} has
been invoked with the \.{-f} option.

Rule 78: The |define_like| case calls |make_underlined| on the following scrap.

Rule 94: The |new_like| must not be immediately followed by |lpar|.

Rule 99: The |new_exp| must not be immediately followed by |raw_int|,
|struct_like|, or |colcol|.

Rule 110: The |raw_int| must not be immediately followed by |langle|.

Rule 111: The operator after |operator_like|
must not be immediately followed by a |binop|.

Rule 114: The |operator_like| must not be immediately followed by
|raw_ubin|.

Rule 117: The |exp| must not be immediately followed by |lpar|, |exp|,
or |cast|.

Rule 123: The mathness of the |colon| or |base| changes to `yes'.

\endgroup</t>
<t tx="ekr.20050502102905.341">@language cweb
@ignore
@others</t>
<t tx="ekr.20050502102905.342">@ % wc: An example of CWEB by Silvio Levy and Donald E. Knuth

\nocon % omit table of contents
\datethis % print date on listing
\def\SPARC{SPARC\-\kern.1em station}

</t>
<t tx="ekr.20050502102905.343">@* An example of {\tt CWEB}.  This example, based on a program by
Klaus Guntermann and Joachim Schrod [{\sl TUGboat\/ \bf7} (1986),
135--137] presents the ``word count'' program from \UNIX/, rewritten in
\.{CWEB} to demonstrate literate programming in \CEE/.  The level of
detail in this document is intentionally high, for didactic purposes;
many of the things spelled out here don't need to be explained in
other programs.

The purpose of \.{wc} is to count lines, words, and/or characters in a
list of files. The number of lines in a file is the number of newline
characters it contains. The number of characters is the file length in bytes.
A ``word'' is a maximal sequence of consecutive characters other than
newline, space, or tab, containing at least one visible ASCII code.
(We assume that the standard ASCII code is in use.)

This version of \.{wc} has a nonstandard ``silent'' option (\.{-s}),
which suppresses printing except for the grand totals over all files.

@ Most \.{CWEB} programs share a common structure.  It's probably a good idea to state the overall structure explicitly at the outset, even though the various parts could all be introduced in unnamed sections of the code if we wanted to add them piecemeal.  Here, then, is an overview of the file \.{wc.c} that is defined by this \.{CWEB} program \.{wc.w}:

@c
@&lt;Header files to include@&gt;@/
@&lt;Global variables@&gt;@/
@&lt;Functions@&gt;@/
@&lt;The main program@&gt;</t>
<t tx="ekr.20050502102905.344">@ We must include the standard I/O definitions, since we want to send formatted output to |stdout| and |stderr|.

@&lt;Header files to include@&gt;=
#include &lt;stdio.h&gt;

@  The |status| variable will tell the operating system if the run was successful or not, and |prog_name| is used in case there's an error message to be printed.

@d OK 0 /* |status| code for successful run */
@d usage_error 1 /* |status| code for improper syntax */
@d cannot_open_file 2 /* |status| code for file access error */

@&lt;Global variables@&gt;=
int status=OK; /* exit status of command, initially |OK| */
char *prog_name; /* who we are */</t>
<t tx="ekr.20050502102905.345">@ Now we come to the general layout of the |main| function.

@&lt;The main program@&gt;=
main (argc,argv)
    int argc; /* the number of arguments on the \UNIX/ command line */
    char **argv; /* the arguments themselves, an array of strings */
{
  @&lt;Variables local to |main|@&gt;@;
  prog_name=argv[0];
  @&lt;Set up option selection@&gt;;
  @&lt;Process all the files@&gt;;
  @&lt;Print the grand totals if there were multiple files @&gt;;
  exit(status);
}

@ Incidentally, a test of this program against the system \.{wc}
command on a \SPARC\ showed that the ``official'' \.{wc} was slightly
slower. Furthermore, although that \.{wc} gave an appropriate error
message for the options `\.{-abc}', it made no complaints about the
options `\.{-labc}'! Dare we suggest that the system routine might have been
better if its programmer had used a more literate approach?</t>
<t tx="ekr.20050502102905.346">@ If the first argument begins with a `\.{-}', the user is choosing the desired counts and specifying the order in which they should be displayed.  Each selection is given by the initial character (lines, words, or characters).  For example, `\.{-cl}' would cause just the number of characters and the number of lines to be printed, in that order. The default, if no special argument is given, is `\.{-lwc}'.  We do not process this string now; we simply remember where it is. It will be used to control the formatting at output time.  If the `\.{-}' is immediately followed by `\.{s}', only summary totals are printed.

@&lt;Variables local to |main|@&gt;=
int file_count; /* how many files there are */
char *which; /* which counts to print */
int silent=0; /* nonzero if the silent option was selected */</t>
<t tx="ekr.20050502102905.347">@ Here's the code to open the file.  A special trick allows us to handle input from |stdin| when no name is given. Recall that the file descriptor to |stdin| is~0; that's what we use as the default initial value.

@&lt;Variables local to |main|@&gt;=
int fd=0; /* file descriptor, initialized to |stdin| */

@ @&lt;Set up o...@&gt;=
which="lwc"; /* if no option is given, print all three values */
if (argc&gt;1 &amp;&amp; *argv[1] == '-') {
  argv[1]++;
  if (*argv[1]=='s') silent=1,argv[1]++;
  if (*argv[1]) which=argv[1];
  argc--; argv++;
}
file_count=argc-1;</t>
<t tx="ekr.20050502102905.348">@ Now we scan the remaining arguments and try to open a file, if possible.  The file is processed and its statistics are given. We use a |do|~\dots~|while| loop because we should read from the standard input if no file name is given.

@&lt;Process all the files@&gt;=
argc--;
do@+{
  @&lt;If a file is given, try to open |*(++argv)|; |continue| if unsuccessful@&gt;;
  @&lt;Initialize pointers and counters@&gt;;
  @&lt;Scan file@&gt;;
  @&lt;Write statistics for file@&gt;;
  @&lt;Close file@&gt;;
  @&lt;Update grand totals@&gt;; /* even if there is only one file */
}@+while (--argc&gt;0);</t>
<t tx="ekr.20050502102905.349">@ @d READ_ONLY 0 /* read access code for system |open| routine */

@&lt;If a file is given, try to open |*(++argv)|; |continue| if unsuccessful@&gt;=
if (file_count&gt;0 &amp;&amp; (fd=open(*(++argv),READ_ONLY))&lt;0) {
  fprintf (stderr, "%s: cannot open file %s\n", prog_name, *argv);
@.cannot open file@&gt;
  status|=cannot_open_file;
  file_count--;
  continue;
}</t>
<t tx="ekr.20050502102905.35">@ The information associated with a new identifier must be initialized in a slightly different way in \.{CWEAVE} than in \.{CTANGLE}; hence the |init_p| procedure.

@&lt;Predeclaration of procedures@&gt;=
void init_p();
</t>
<t tx="ekr.20050502102905.350">@ @&lt;Close file@&gt;=
close(fd);</t>
<t tx="ekr.20050502102905.351">@ We will do some homemade buffering in order to speed things up: Characters will be read into the |buffer| array before we process them. To do this we set up appropriate pointers and counters.

@d buf_size BUFSIZ /* \.{stdio.h}'s |BUFSIZ| is chosen for efficiency*/

@&lt;Variables local to |main|@&gt;=
char buffer[buf_size]; /* we read the input into this array */
register char *ptr; /* the first unprocessed character in |buffer| */
register char *buf_end; /* the first unused position in |buffer| */
register int c; /* current character, or number of characters just read */
int in_word; /* are we within a word? */
long word_count, line_count, char_count; /* number of words, lines, 
    and characters found in the file so far */
	
@ @&lt;Init...@&gt;=
ptr=buf_end=buffer; line_count=word_count=char_count=0; in_word=0;

@ The grand totals must be initialized to zero at the beginning of the program. If we made these variables local to |main|, we would have to do this initialization explicitly; however, \CEE/'s globals are automatically zeroed. (Or rather, ``statically zeroed.'') (Get it?) @^Joke@&gt;

@&lt;Global variables@&gt;=
long tot_word_count, tot_line_count, tot_char_count;
 /* total number of words, lines, and chars */</t>
<t tx="ekr.20050502102905.352">@ The present section, which does the counting that is \.{wc}'s {\it raison d'\^etre}, was actually one of the simplest to write. We look at each character and change state if it begins or ends a word.

@&lt;Scan file@&gt;=
while (1) {
  @&lt;Fill |buffer| if it is empty; |break| at end of file@&gt;;
  c=*ptr++;
  if (c&gt;' ' &amp;&amp; c&lt;0177) { /* visible ASCII codes */
    if (!in_word) {word_count++; in_word=1;}
    continue;
  }
  if (c=='\n') line_count++;
  else if (c!=' ' &amp;&amp; c!='\t') continue;
  in_word=0; /* |c| is newline, space, or tab */
}</t>
<t tx="ekr.20050502102905.353">@ Buffered I/O allows us to count the number of characters almost for free.

@&lt;Fill |buffer| if it is empty; |break| at end of file@&gt;=
if (ptr&gt;=buf_end) {
  ptr=buffer; c=read(fd,ptr,buf_size);
  if (c&lt;=0) break;
  char_count+=c; buf_end=buffer+c;
}</t>
<t tx="ekr.20050502102905.354">@ It's convenient to output the statistics by defining a new function |wc_print|; then the same function can be used for the totals. Additionally we must decide here if we know the name of the file we have processed or if it was just |stdin|.

@&lt;Write statistics for file@&gt;=
if (!silent) {
  wc_print(which, char_count, word_count, line_count);
  if (file_count) printf (" %s\n", *argv); /* not |stdin| */
  else printf ("\n"); /* |stdin| */
}</t>
<t tx="ekr.20050502102905.355">@ @&lt;Upda...@&gt;=
tot_line_count+=line_count;
tot_word_count+=word_count;
tot_char_count+=char_count;</t>
<t tx="ekr.20050502102905.356">@ We might as well improve a bit on \UNIX/'s \.{wc} by displaying the number of files too.

@&lt;Print the grand totals if there were multiple files@&gt;=
if (file_count&gt;1 || silent) {
  wc_print(which, tot_char_count, tot_word_count, tot_line_count);
  if (!file_count) printf("\n");
  else printf(" total in %d file%s\n",file_count,file_count&gt;1?"s":"");
}</t>
<t tx="ekr.20050502102905.357">@ Here now is the function that prints the values according to the specified options.  The calling routine is supposed to supply a newline. If an invalid option character is found we inform the user about proper usage of the command. Counts are printed in 8-digit fields so that they will line up in columns.

@d print_count(n) printf("%8ld",n)

@&lt;Functions@&gt;=
wc_print(which, char_count, word_count, line_count)
char *which; /* which counts to print */
long char_count, word_count, line_count; /* given totals */
{
  while (*which) 
    switch (*which++) {
    case 'l': print_count(line_count); break;
    case 'w': print_count(word_count); break;
    case 'c': print_count(char_count); break;
    default: if ((status &amp; usage_error)==0) {
        fprintf (stderr, "\nUsage: %s [-lwc] [filename ...]\n", prog_name);
@.Usage: ...@&gt;
        status|=usage_error;
      }
    }
}</t>
<t tx="ekr.20050502102905.358">@* Index.
Here is a list of the identifiers used, and where they appear. Underlined
entries indicate the place of definition. Error messages are also shown.</t>
<t tx="ekr.20050502102905.36">@
@&lt;Enter a new name into the table at position |p|@&gt;= {
  if (byte_ptr+l&gt;byte_mem_end) overflow("byte memory");
  if (name_ptr&gt;=name_dir_end) overflow("name");
  strncpy(byte_ptr,first,l);
  (++name_ptr)-&gt;byte_start=byte_ptr+=l;
  if (program==cweave) init_p(p,t);
}
</t>
<t tx="ekr.20050502102905.37">@ The names of sections are stored in |byte_mem| together with the identifier names, but a hash table is not used for them because \.{CTANGLE} needs to be able to recognize a section name when given a prefix of that name. A conventional binary search tree is used to retrieve section names, with fields called |llink| and |rlink| (where |llink| takes the place of |link|).  The root of this tree is stored in |name_dir-&gt;rlink|; this will be the only information in |name_dir[0]|.  Since the space used by |rlink| has a different function for identifiers than for section names, we declare it as a |union|.

@d llink link /* left link in binary search tree for section names */
@d rlink dummy.Rlink /* right link in binary search tree for section names */
@d root name_dir-&gt;rlink /* the root of the binary search tree
  for section names */

@&lt;More elements of |name_info| structure@&gt;=
union {
  struct name_info *Rlink; /* right link in binary search tree for section
    names */
  char Ilk; /* used by identifiers in \.{CWEAVE} only */
} dummy;

@
@&lt;Initialize pointers@&gt;=
root=NULL; /* the binary search tree starts out with nothing in it */
</t>
<t tx="ekr.20050502102905.38">@ If |p| is a |name_pointer| variable, as we have seen, |p-&gt;byte_start| is the beginning of the area where the name corresponding to |p| is stored.  However, if |p| refers to a section name, the name may need to be stored in chunks, because it may ``grow'': a prefix of the section name may be encountered before the full name.  Furthermore we need to know the length of the shortest prefix of the name that was ever encountered.  We solve this problem by inserting two extra bytes at |p-&gt;byte_start|, representing the length of the shortest prefix, when |p| is a section name. Furthermore, the last byte of the name will be a blank space if |p| is a prefix. In the latter case, the name pointer |p+1| will allow us to access additional chunks of the name: The second chunk will begin at the name pointer |(p+1)-&gt;link|, and if it too is a prefix (ending with blank) its |link| will point to additional chunks in the same way. Null links are represented by |name_dir|.

@d first_chunk(p)  ((p)-&gt;byte_start+2)
@d prefix_length(p) (int)((unsigned char)*((p)-&gt;byte_start)*256 +
                (unsigned char)*((p)-&gt;byte_start+1))

@d set_prefix_length(p,m) (*((p)-&gt;byte_start)=(m)/256,
                 *((p)-&gt;byte_start+1)=(m)%256)
@c
void
print_section_name(p)
name_pointer p;
{
  char *ss, *s = first_chunk(p);
  name_pointer q = p+1;
  while (p!=name_dir) {
    ss = (p+1)-&gt;byte_start-1;
    if (*ss==' ' &amp;&amp; ss&gt;=s) {
      term_write(s,ss-s); p=q-&gt;link; q=p;
    } else {
      term_write(s,ss+1-s); p=name_dir; q=NULL;
    }
    s = p-&gt;byte_start;
  }
  if (q) term_write("...",3); /* complete name not yet known */
}</t>
<t tx="ekr.20050502102905.39">@
@c
void
sprint_section_name(dest,p)
  char*dest;
  name_pointer p;
{
  char *ss, *s = first_chunk(p);
  name_pointer q = p+1;
  while (p!=name_dir) {
    ss = (p+1)-&gt;byte_start-1;
    if (*ss==' ' &amp;&amp; ss&gt;=s) {
      p=q-&gt;link; q=p;
    } else {
      ss++; p=name_dir;
    }
    strncpy(dest,s,ss-s), dest+=ss-s;
    s = p-&gt;byte_start;
  }
  *dest='\0';
}</t>
<t tx="ekr.20050502102905.4">@ % This file is part of CWEB.
% This program by Silvio Levy and Donald E. Knuth
% is based on a program by Knuth.
% It is distributed WITHOUT ANY WARRANTY, express or implied.
% Version 3.61 --- July 2000 (works with later versions too)

% Copyright (C) 1987,1990,1993,2000 Silvio Levy and Donald E. Knuth

% Permission is granted to make and distribute verbatim copies of this
% document provided that the copyright notice and this permission notice
% are preserved on all copies.

% Permission is granted to copy and distribute modified versions of this
% document under the conditions for verbatim copying, provided that the
% entire resulting derived work is given a different name and distributed
% under the terms of a permission notice identical to this one.

\def\v{\char'174} % vertical (|) in typewriter font

\def\title{Common code for CTANGLE and CWEAVE (Version 3.61)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont Common code for {\ttitlefont CTANGLE} and
    {\ttitlefont CWEAVE}}
  \vskip 15pt
  \centerline{(Version 3.61)}
  \vfill}
\def\botofcontents{\vfill
\noindent
Copyright \copyright\ 1987, 1990, 1993, 2000 Silvio Levy and Donald E. Knuth
\bigskip\noindent
Permission is granted to make and distribute verbatim copies of this
document provided that the copyright notice and this permission notice
are preserved on all copies.

\smallskip\noindent
Permission is granted to copy and distribute modified versions of this
document under the conditions for verbatim copying, provided that the
entire resulting derived work is given a different name and distributed
under the terms of a permission notice identical to this one.
}

\pageno=\contentspagenumber \advance\pageno by 1
\let\maybe=\iftrue
@s not_eq normal @q unreserve a C++ keyword @&gt;
</t>
<t tx="ekr.20050502102905.40">@
@c
void
print_prefix_name(p)
name_pointer p;
{
  char *s = first_chunk(p);
  int l = prefix_length(p);
  term_write(s,l);
  if (s+l&lt;(p+1)-&gt;byte_start) term_write("...",3);
}</t>
<t tx="ekr.20050502102905.41">@ When we compare two section names, we'll need a function analogous to |strcmp|. But we do not assume the strings are null-terminated, and we keep an eye open for prefixes and extensions.

@d less 0 /* the first name is lexicographically less than the second */
@d equal 1 /* the first name is equal to the second */
@d greater 2 /* the first name is lexicographically greater than the second */
@d prefix 3 /* the first name is a proper prefix of the second */
@d extension 4 /* the first name is a proper extension of the second */

@c
int web_strcmp(j,j_len,k,k_len) /* fuller comparison than |strcmp| */
  char *j, *k; /* beginning of first and second strings */
  int j_len, k_len; /* length of strings */
{
  char *j1=j+j_len, *k1=k+k_len;
  while (k&lt;k1 &amp;&amp; j&lt;j1 &amp;&amp; *j==*k) k++, j++;
  if (k==k1) if (j==j1) return equal;
    else return extension;
  else if (j==j1) return prefix;
  else if (*j&lt;*k) return less;
  else return greater;
}</t>
<t tx="ekr.20050502102905.42">@ Adding a section name to the tree is straightforward if we know its parent and whether it's the |rlink| or |llink| of the parent.  As a special case, when the name is the first section being added, we set the ``parent'' to |NULL|.  When a section name is created, it has only one chunk, which however may be just a prefix; the full name will hopefully be unveiled later.  Obviously, |prefix_length| starts out as the length of the first chunk, though it may decrease later.  The information associated with a new node must be initialized differently in \.{CWEAVE} and \.{CTANGLE}; hence the |init_node| procedure, which is defined differently in \.{cweave.w} and \.{ctangle.w}.

@&lt;Predeclaration of procedures@&gt;=
extern void init_node();

@
@c
name_pointer
add_section_name(par,c,first,last,ispref) /* install a new node in the tree */
name_pointer par; /* parent of new node */
int c; /* right or left? */
char *first; /* first character of section name */
char *last; /* last character of section name, plus one */
int ispref; /* are we adding a prefix or a full name? */
{
  name_pointer p=name_ptr; /* new node */
  char *s=first_chunk(p);
  int name_len=last-first+ispref; /* length of section name */
  if (s+name_len&gt;byte_mem_end) overflow("byte memory");
  if (name_ptr+1&gt;=name_dir_end) overflow("name");
  (++name_ptr)-&gt;byte_start=byte_ptr=s+name_len;
  if (ispref) {
    *(byte_ptr-1)=' ';
    name_len--;
    name_ptr-&gt;link=name_dir;
    (++name_ptr)-&gt;byte_start=byte_ptr;
  }
  set_prefix_length(p,name_len);
  strncpy(s,first,name_len);
  p-&gt;llink=NULL;
  p-&gt;rlink=NULL;
  init_node(p);
  return par==NULL ? (root=p) : c==less ? (par-&gt;llink=p) : (par-&gt;rlink=p);
}</t>
<t tx="ekr.20050502102905.43">@
@c
void
extend_section_name(p,first,last,ispref)
name_pointer p; /* name to be extended */
char *first; /* beginning of extension text */
char *last; /* one beyond end of extension text */
int ispref; /* are we adding a prefix or a full name? */
{
  char *s;
  name_pointer q=p+1;
  int name_len=last-first+ispref;
  if (name_ptr&gt;=name_dir_end) overflow("name");
  while (q-&gt;link!=name_dir) q=q-&gt;link;
  q-&gt;link=name_ptr;
  s=name_ptr-&gt;byte_start;
  name_ptr-&gt;link=name_dir;
  if (s+name_len&gt;byte_mem_end) overflow("byte memory");
  (++name_ptr)-&gt;byte_start=byte_ptr=s+name_len;
  strncpy(s,first,name_len);
  if (ispref) *(byte_ptr-1)=' ';
}</t>
<t tx="ekr.20050502102905.44">@ The |section_lookup| procedure is supposed to find a section name that matches a new name, installing the new name if it doesn't match an existing one. The new name is the string between |first| and |last|; a ``match'' means that the new name exactly equals or is a prefix or extension of a name in the tree.

@c
name_pointer
section_lookup(first,last,ispref) /* find or install section name in tree */
char *first, *last; /* first and last characters of new name */
int ispref; /* is the new name a prefix or a full name? */
{
  int c=0; /* comparison between two names; initialized so some compilers won't complain */
  name_pointer p=root; /* current node of the search tree */
  name_pointer q=NULL; /* another place to look in the tree */
  name_pointer r=NULL; /* where a match has been found */
  name_pointer par=NULL; /* parent of |p|, if |r| is |NULL|;
            otherwise parent of |r| */
  int name_len=last-first+1;
  @&lt;Look for matches for new name among shortest prefixes, complaining
        if more than one is found@&gt;;
  @&lt;If no match found, add new name to tree@&gt;;
  @&lt;If one match found, check for compatibility and return match@&gt;;
}</t>
<t tx="ekr.20050502102905.45">@ A legal new name matches an existing section name if and only if it matches the shortest prefix of that section name.  Therefore we can limit our search for matches to shortest prefixes, which eliminates the need for chunk-chasing at this stage.

@&lt;Look for matches for new name among...@&gt;=
while (p) { /* compare shortest prefix of |p| with new name */
  c=web_strcmp(first,name_len,first_chunk(p),prefix_length(p));
  if (c==less || c==greater) { /* new name does not match |p| */
    if (r==NULL) /* no previous matches have been found */
      par=p;
    p=(c==less?p-&gt;llink:p-&gt;rlink);
  } else { /* new name matches |p| */
    if (r!=NULL) {  /* and also |r|: illegal */
      printf("\n! Ambiguous prefix: matches &lt;");
@.Ambiguous prefix ... @&gt;
      print_prefix_name(p);
      printf("&gt;\n and &lt;");
      print_prefix_name(r);
      err_print("&gt;");
      return name_dir; /* the unsection */
    }
    r=p; /* remember match */
    p=p-&gt;llink; /* try another */
    q=r-&gt;rlink; /* we'll get back here if the new |p| doesn't match */
  }
  if (p==NULL)
    p=q, q=NULL; /* |q| held the other branch of |r| */
}
</t>
<t tx="ekr.20050502102905.46">@
@&lt;If no match found, add new name to tree@&gt;=
  if (r==NULL) /* no matches were found */
    return add_section_name(par,c,first,last+1,ispref);
</t>
<t tx="ekr.20050502102905.47">@ Although error messages are given in anomalous cases, we do return the unique best match when a discrepancy is found, because users often change a title in one place while forgetting to change it elsewhere.

@&lt;If one match found, check for compatibility and return match@&gt;=
switch(section_name_cmp(&amp;first,name_len,r)) {
              /* compare all of |r| with new name */
  case prefix:
    if (!ispref) {
      printf("\n! New name is a prefix of &lt;");
@.New name is a prefix...@&gt;
      print_section_name(r);
      err_print("&gt;");
    }
    else if (name_len&lt;prefix_length(r)) set_prefix_length(r,name_len);
    /* fall through */
  case equal: return r;
  case extension: if (!ispref || first&lt;=last)
        extend_section_name(r,first,last+1,ispref);
      return r;
  case bad_extension:
      printf("\n! New name extends &lt;");
@.New name extends...@&gt;
      print_section_name(r);
      err_print("&gt;");
    return r;
  default: /* no match: illegal */
    printf("\n! Section name incompatible with &lt;");
@.Section name incompatible...@&gt;
    print_prefix_name(r);
    printf("&gt;,\n which abbreviates &lt;");
    print_section_name(r);
    err_print("&gt;");
    return r;
}
</t>
<t tx="ekr.20050502102905.48">@ The return codes of |section_name_cmp|, which compares a string with the full name of a section, are those of |web_strcmp| plus |bad_extension|, used when the string is an extension of a supposedly already complete section name.  This function has a side effect when the comparison string is an extension: It advances the address of the first character of the string by an amount equal to the length of the known part of the section name.  The name \.{@

@&lt;foo...@@&gt;} should be an acceptable ``abbreviation''
for \.{@@&lt;foo@@&gt;}. If such an abbreviation comes after the complete
name, there's no trouble recognizing it. If it comes before the
complete name, we simply append a null chunk. This logic requires
us to regard \.{@@&lt;foo...@@&gt;} as an ``extension'' of itself.

@d bad_extension 5

@&lt;Predeclaration of procedures@&gt;=
int section_name_cmp();

@
@c
int section_name_cmp(pfirst,len,r)
char **pfirst; /* pointer to beginning of comparison string */
int len; /* length of string */
name_pointer r; /* section name being compared */
{
  char *first=*pfirst; /* beginning of comparison string */
  name_pointer q=r+1; /* access to subsequent chunks */
  char *ss, *s=first_chunk(r);
  int c; /* comparison */
  int ispref; /* is chunk |r| a prefix? */
  while (1) {
    ss=(r+1)-&gt;byte_start-1;
    if (*ss==' ' &amp;&amp; ss&gt;=r-&gt;byte_start) ispref=1,q=q-&gt;link;
    else ispref=0,ss++,q=name_dir;
    switch(c=web_strcmp(first,len,s,ss-s)) {
    case equal: if (q==name_dir)
        if (ispref) {
          *pfirst=first+(ss-s);
          return extension; /* null extension */
        } else return equal;
      else return (q-&gt;byte_start==(q+1)-&gt;byte_start)? equal: prefix;
    case extension:
      if (!ispref) return bad_extension;
      first += ss-s;
      if (q!=name_dir) {len -= ss-s; s=q-&gt;byte_start; r=q; continue;}
      *pfirst=first; return extension;
    default: return c;
    }
  }
}</t>
<t tx="ekr.20050502102905.49">@ The last component of |name_info| is different for \.{CTANGLE} and \.{CWEAVE}.  In \.{CTANGLE}, if |p| is a pointer to a section name, |p-&gt;equiv| is a pointer to its replacement text, an element of the array |text_info|.  In \.{CWEAVE}, on the other hand, if |p| points to an identifier, |p-&gt;xref| is a pointer to its list of cross-references, an element of the array |xmem|.  The make-up of |text_info| and |xmem| is discussed in the \.{CTANGLE} and \.{CWEAVE} source files, respectively; here we just declare a common field |equiv_or_xref| as a pointer to a |char|.

@&lt;More elements of |name_info| structure@&gt;=
char *equiv_or_xref; /* info corresponding to names */
</t>
<t tx="ekr.20050502102905.5">@** Introduction.  This file contains code common to both \.{CTANGLE} and \.{CWEAVE}, which roughly concerns the following problems: character uniformity, input routines, error handling and parsing of command line.  We have tried to concentrate in this file all the system dependencies, so as to maximize portability.  In the texts below we will sometimes use \.{CWEB} to refer to either of the two component programs, if no confusion can arise.  The file begins with a few basic definitions.

@c
@&lt;Include files@&gt;@/
@h
@&lt;Definitions that should agree with \.{CTANGLE} and \.{CWEAVE}@&gt;@/
@&lt;Other definitions@&gt;@/
@&lt;Predeclaration of procedures@&gt;@/
</t>
<t tx="ekr.20050502102905.50">@** Reporting errors to the user. A global variable called |history| will contain one of four values at the end of every run: |spotless| means that no unusual messages were printed; |harmless_message| means that a message of possible interest was printed but no serious errors were detected; |error_message| means that at least one error was found; |fatal_message| means that the program terminated abnormally. The value of |history| does not influence the behavior of the program; it is simply computed for the convenience of systems that might want to use such information.

@d spotless 0 /* |history| value for normal jobs */
@d harmless_message 1 /* |history| value when non-serious info was printed */
@d error_message 2 /* |history| value when an error was noted */
@d fatal_message 3 /* |history| value when we had to stop prematurely */
@d mark_harmless {if (history==spotless) history=harmless_message;}
@d mark_error history=error_message

@&lt;Definitions that should agree with \.{CTANGLE} and \.{CWEAVE}@&gt;=
int history=spotless; /* indicates how bad this run was */</t>
<t tx="ekr.20050502102905.51">@ The command `|err_print("! Error message")|' will report a syntax error to the user, by printing the error message at the beginning of a new line and then giving an indication of where the error was spotted in the source file. Note that no period follows the error message, since the error routine will automatically supply a period. A newline is automatically supplied if the string begins with |"!"|.

@&lt;Predeclaration of procedures@&gt;=
void  err_print();

@
@c
void
err_print(s) /* prints `\..' and location of error message */
char *s;
{
  char *k,*l; /* pointers into |buffer| */
  printf(*s=='!'? "\n%s" : "%s",s);
  if(web_file_open) @&lt;Print error location based on input buffer@&gt;;
  update_terminal; mark_error;
}</t>
<t tx="ekr.20050502102905.52">@ The error locations can be indicated by using the global variables |loc|, |cur_line|, |cur_file_name| and |changing|, which tell respectively the first unlooked-at position in |buffer|, the current line number, the current file, and whether the current line is from |change_file| or |cur_file|. This routine should be modified on systems whose standard text editor has special line-numbering conventions. @^system dependencies@&gt;

@&lt;Print error location based on input buffer@&gt;=
{if (changing &amp;&amp; include_depth==change_depth)
  printf(". (l. %d of change file)\n", change_line);
else if (include_depth==0) printf(". (l. %d)\n", cur_line);
  else printf(". (l. %d of include file %s)\n", cur_line, cur_file_name);
l= (loc&gt;=limit? limit: loc);
if (l&gt;buffer) {
  for (k=buffer; k&lt;l; k++)
    if (*k=='\t') putchar(' ');
    else putchar(*k); /* print the characters already read */
  putchar('\n');
  for (k=buffer; k&lt;l; k++) putchar(' '); /* space out the next line */
}
for (k=l; k&lt;limit; k++) putchar(*k); /* print the part not yet read */
if (*limit=='|') putchar('|'); /* end of \CEE/ text in section names */
putchar(' '); /* to separate the message from future asterisks */
}
</t>
<t tx="ekr.20050502102905.53">@ When no recovery from some error has been provided, we have to wrap up and quit as graciously as possible.  This is done by calling the function |wrap_up| at the end of the code.  \.{CTANGLE} and \.{CWEAVE} have their own notions about how to print the job statistics.

@&lt;Predeclaration of procedures@&gt;=
int wrap_up();
extern void print_stats();

@ Some implementations may wish to pass the |history| value to the operating system so that it can be used to govern whether or not other programs are started. Here, for instance, we pass the operating system a status of 0 if and only if only harmless messages were printed. @^system dependencies@&gt;

@c
int wrap_up() {
  putchar('\n');
  if (show_stats)
    print_stats(); /* print statistics about memory usage */
  @&lt;Print the job |history|@&gt;;
  if (history &gt; harmless_message) return(1);
  else return(0);
}</t>
<t tx="ekr.20050502102905.54">@
@&lt;Print the job |history|@&gt;=
switch (history) {
case spotless: if (show_happiness) printf("(No errors were found.)\n"); break;
case harmless_message:
  printf("(Did you see the warning message above?)\n"); break;
case error_message:
  printf("(Pardon me, but I think I spotted something wrong.)\n"); break;
case fatal_message: printf("(That was a fatal error, my friend.)\n");
} /* there are no other cases */
</t>
<t tx="ekr.20050502102905.55">@ When there is no way to recover from an error, the |fatal| subroutine is invoked. This happens most often when |overflow| occurs.

@&lt;Predeclaration of procedures@&gt;=
void fatal(), overflow();

@ The two parameters to |fatal| are strings that are essentially concatenated to print the final error message.

@c void
fatal(s,t)
  char *s,*t;
{
  if (*s) printf(s);
  err_print(t);
  history=fatal_message; exit(wrap_up());
}

</t>
<t tx="ekr.20050502102905.56">@ An overflow stop occurs if \.{CWEB}'s tables aren't large enough.

@c void
overflow(t)
  char *t;
{
  printf("\n! Sorry, %s capacity exceeded",t); fatal("","");
}
@.Sorry, capacity exceeded@&gt;
</t>
<t tx="ekr.20050502102905.57">@ Sometimes the program's behavior is far different from what it should be, and \.{CWEB} prints an error message that is really for the \.{CWEB} maintenance person, not the user. In such cases the program says |confusion("indication of where we are")|.

@d confusion(s) fatal("! This can't happen: ",s)
@.This can't happen@&gt;
</t>
<t tx="ekr.20050502102905.58">@** Command line arguments. The user calls \.{CWEAVE} and \.{CTANGLE} with arguments on the command line. These are either file names or flags to be turned off (beginning with |"-"|) or flags to be turned on (beginning with |"+"|). The following globals are for communicating the user's desires to the rest of the program. The various file name variables contain strings with the names of those files. Most of the 128 flags are undefined but available for future extensions.

@d show_banner flags['b'] /* should the banner line be printed? */
@d show_progress flags['p'] /* should progress reports be printed? */
@d show_stats flags['s'] /* should statistics be printed at end of run? */
@d show_happiness flags['h'] /* should lack of errors be announced? */

@&lt;Definitions that should agree with \.{CTANGLE} and \.{CWEAVE}@&gt;=
int argc; /* copy of |ac| parameter to |main| */
char **argv; /* copy of |av| parameter to |main| */
char C_file_name[max_file_name_length]; /* name of |C_file| */
char tex_file_name[max_file_name_length]; /* name of |tex_file| */
char idx_file_name[max_file_name_length]; /* name of |idx_file| */
char scn_file_name[max_file_name_length]; /* name of |scn_file| */
boolean flags[128]; /* an option for each 7-bit code */</t>
<t tx="ekr.20050502102905.59">@ We now must look at the command line arguments and set the file names accordingly.  At least one file name must be present: the \.{CWEB} file.  It may have an extension, or it may omit the extension to get |".w"| or |".web"| added.  The \TEX/ output file name is formed by replacing the \.{CWEB} file name extension by |".tex"|, and the \CEE/ file name by replacing the extension by |".c"|, after removing the directory name (if any).  If there is a second file name present among the arguments, it is the change file, again either with an extension or without one to get |".ch"|. An omitted change file argument means that |"/dev/null"| should be used, when no changes are desired. @^system dependencies@&gt;  If there's a third file name, it will be the output file.

@&lt;Predeclaration of procedures@&gt;=
void scan_args();

@
@c
void
scan_args()
{
  char *dot_pos; /* position of |'.'| in the argument */
  char *name_pos; /* file name beginning, sans directory */
  register char *s; /* register for scanning strings */
  boolean found_web=0,found_change=0,found_out=0;
             /* have these names been seen? */
  boolean flag_change;

  while (--argc &gt; 0) {
    if ((**(++argv)=='-'||**argv=='+')&amp;&amp;*(*argv+1)) @&lt;Handle flag argument@&gt;@;
    else {
      s=name_pos=*argv;@+dot_pos=NULL;
      while (*s) {
        if (*s=='.') dot_pos=s++;
        else if (*s=='/') dot_pos=NULL,name_pos=++s;
        else s++;
      }
      if (!found_web) @&lt;Make
       |web_file_name|, |tex_file_name|, and |C_file_name|@&gt;@;
      else if (!found_change) @&lt;Make |change_file_name| from |fname|@&gt;@;
      else if (!found_out) @&lt;Override |tex_file_name| and |C_file_name|@&gt;@;
        else @&lt;Print usage error message and quit@&gt;;
    }
  }
  if (!found_web) @&lt;Print usage error message and quit@&gt;;
  if (found_change&lt;=0) strcpy(change_file_name,"/dev/null");
}</t>
<t tx="ekr.20050502102905.6">@ In certain cases \.{CTANGLE} and \.{CWEAVE} should do almost, but not quite, the same thing.  In these cases we've written common code for both, differentiating between the two by means of the global variable |program|.

@d ctangle 0
@d cweave 1

@&lt;Definitions that should agree with \.{CTANGLE} and \.{CWEAVE}@&gt;=
typedef short boolean;
boolean program; /* \.{CWEAVE} or \.{CTANGLE}? */
</t>
<t tx="ekr.20050502102905.60">@ @&lt;Handle flag argument@&gt;=
{
  if (**argv=='-') flag_change=0;
  else flag_change=1;
  for(dot_pos=*argv+1;*dot_pos&gt;'\0';dot_pos++)
    flags[*dot_pos]=flag_change;
}
</t>
<t tx="ekr.20050502102905.61">@ @&lt;Make |change_file_name| from |fname|@&gt;=
{
  if (strcmp(*argv,"-")==0) found_change=-1;
  else {
    if (s-*argv &gt; max_file_name_length-4)
      @&lt;Complain about argument length@&gt;;
    if (dot_pos==NULL)
      sprintf(change_file_name,"%s.ch",*argv);
    else strcpy(change_file_name,*argv);
    found_change=1;
  }
}
</t>
<t tx="ekr.20050502102905.62">@ @&lt;Override |tex_file_name| and |C_file_name|@&gt;=
{
  if (s-*argv &gt; max_file_name_length-5)
    @&lt;Complain about argument length@&gt;;
  if (dot_pos==NULL) {
    sprintf(tex_file_name,"%s.tex",*argv);
    sprintf(idx_file_name,"%s.idx",*argv);
    sprintf(scn_file_name,"%s.scn",*argv);
    sprintf(C_file_name,"%s.c",*argv);
  } else {
    strcpy(tex_file_name,*argv);
    strcpy(C_file_name,*argv);
    if (flags['x']) { /* indexes will be generated */
      *dot_pos=0;
      sprintf(idx_file_name,"%s.idx",*argv);
      sprintf(scn_file_name,"%s.scn",*argv);
    }
  }
  found_out=1;
}
</t>
<t tx="ekr.20050502102905.63">@ We use all of |*argv| for the |web_file_name| if there is a |'.'| in it, otherwise we add |".w"|. If this file can't be opened, we prepare an |alt_web_file_name| by adding |"web"| after the dot. The other file names come from adding other things after the dot.  We must check that there is enough room in |web_file_name| and the other arrays for the argument.

@&lt;Make |web_file_name|...@&gt;=
{
  if (s-*argv &gt; max_file_name_length-5)
    @&lt;Complain about argument length@&gt;;
  if (dot_pos==NULL)
    sprintf(web_file_name,"%s.w",*argv);
  else {
    strcpy(web_file_name,*argv);
    *dot_pos=0; /* string now ends where the dot was */
  }
  sprintf(alt_web_file_name,"%s.web",*argv);
  sprintf(tex_file_name,"%s.tex",name_pos); /* strip off directory name */
  sprintf(idx_file_name,"%s.idx",name_pos);
  sprintf(scn_file_name,"%s.scn",name_pos);
  sprintf(C_file_name,"%s.c",name_pos);
  found_web=1;
}
</t>
<t tx="ekr.20050502102905.64">@ @&lt;Print usage error message and quit@&gt;=
{
if (program==ctangle)
  fatal(
"! Usage: ctangle [options] webfile[.w] [{changefile[.ch]|-} [outfile[.c]]]\n"
   ,"");
@.Usage:@&gt;
else fatal(
"! Usage: cweave [options] webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n"
   ,"");
}
</t>
<t tx="ekr.20050502102905.65">@ @&lt;Complain about argument length@&gt;= fatal("! Filename too long\n", *argv);
@.Filename too long@&gt;
</t>
<t tx="ekr.20050502102905.66">@** Output. Here is the code that opens the output file: @^system dependencies@&gt;

@&lt;Definitions that should agree with \.{CTANGLE} and \.{CWEAVE}@&gt;=
FILE *C_file; /* where output of \.{CTANGLE} goes */
FILE *tex_file; /* where output of \.{CWEAVE} goes */
FILE *idx_file; /* where index from \.{CWEAVE} goes */
FILE *scn_file; /* where list of sections from \.{CWEAVE} goes */
FILE *active_file; /* currently active file for \.{CWEAVE} output */</t>
<t tx="ekr.20050502102905.67">@ The |update_terminal| procedure is called when we want to make sure that everything we have output to the terminal so far has actually left the computer's internal buffers and been sent. @^system dependencies@&gt;

@d update_terminal fflush(stdout) /* empty the terminal output buffer */

@ Terminal output uses |putchar| and |putc| when we have to translate from \.{CWEB}'s code into the external character code, and |printf| when we just want to print strings. Several macros make other kinds of output convenient. @^system dependencies@&gt;

@d new_line putchar('\n') @d putxchar putchar
@d term_write(a,b) fflush(stdout),fwrite(a,sizeof(char),b,stdout)
@d C_printf(c,a) fprintf(C_file,c,a)
@d C_putc(c) putc(c,C_file) /* isn't \CEE/ wonderfully consistent? */
</t>
<t tx="ekr.20050502102905.68">@ We predeclare several standard system functions here instead of including their system header files, because the names of the header files are not as standard as the names of the functions. (For example, some \CEE/ environments have \.{&lt;string.h&gt;} where others have \.{&lt;strings.h&gt;}.)

@&lt;Predeclaration of procedures@&gt;=
extern int strlen(); /* length of string */
extern int strcmp(); /* compare strings lexicographically */
extern char* strcpy(); /* copy one string to another */
extern int strncmp(); /* compare up to $n$ string characters */
extern char* strncpy(); /* copy up to $n$ string characters */
</t>
<t tx="ekr.20050502102905.69">@** Index.
</t>
<t tx="ekr.20050502102905.7">@ \.{CWEAVE} operates in three phases: First it inputs the source file and stores cross-reference data, then it inputs the source once again and produces the \TEX/ output file, and finally it sorts and outputs the index. Similarly, \.{CTANGLE} operates in two phases. The global variable |phase| tells which phase we are in.

@&lt;Other definitions@&gt;= int phase; /* which phase are we in? */

@ There's an initialization procedure that gets both \.{CTANGLE} and \.{CWEAVE} off to a good start. We will fill in the details of this procedure later.

@c
void
common_init()
{
  @&lt;Initialize pointers@&gt;;
  @&lt;Set the default options common to \.{CTANGLE} and \.{CWEAVE}@&gt;;
  @&lt;Scan arguments and open output files@&gt;;
}</t>
<t tx="ekr.20050502102905.70">@language cweb
@ignore
@others</t>
<t tx="ekr.20050502102905.71">@ % This file is part of CWEB.
% This program by Silvio Levy and Donald E. Knuth
% is based on a program by Knuth.
% It is distributed WITHOUT ANY WARRANTY, express or implied.
% Version 3.62 --- September 2000
% (same as Version 3.5 except for minor typographic/stylistic corrections)
% (also quotes backslashes in file names of #line directives)

% Copyright (C) 1987,1990,1993,2000 Silvio Levy and Donald E. Knuth

% Permission is granted to make and distribute verbatim copies of this
% document provided that the copyright notice and this permission notice
% are preserved on all copies.

% Permission is granted to copy and distribute modified versions of this
% document under the conditions for verbatim copying, provided that the
% entire resulting derived work is given a different name and distributed
% under the terms of a permission notice identical to this one.

% Here is TeX material that gets inserted after \input cwebmac
\def\hang{\hangindent 3em\indent\ignorespaces}
\def\pb{$\.|\ldots\.|$} % C brackets (|...|)
\def\v{\char'174} % vertical (|) in typewriter font
\mathchardef\RA="3221 % right arrow
\mathchardef\BA="3224 % double arrow

\def\title{CTANGLE (Version 3.62)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The {\ttitlefont CTANGLE} processor}
  \vskip 15pt
  \centerline{(Version 3.62)}
  \vfill}
\def\botofcontents{\vfill
\noindent
Copyright \copyright\ 1987, 1990, 1993, 2000 Silvio Levy and Donald E. Knuth
\bigskip\noindent
Permission is granted to make and distribute verbatim copies of this
document provided that the copyright notice and this permission notice
are preserved on all copies.

\smallskip\noindent
Permission is granted to copy and distribute modified versions of this
document under the conditions for verbatim copying, provided that the
entire resulting derived work is given a different name and distributed
under the terms of a permission notice identical to this one.
}
\pageno=\contentspagenumber \advance\pageno by 1
\let\maybe=\iftrue
@s not_eq normal @q unreserve a C++ keyword @&gt;

</t>
<t tx="ekr.20050502102905.72">@** Introduction. This is the \.{CTANGLE} program by Silvio Levy and Donald E. Knuth, based on \.{TANGLE} by Knuth. We are thankful to Nelson Beebe, Hans-Hermann Bode (to whom the \CPLUSPLUS/ adaptation is due), Klaus Guntermann, Norman Ramsey, Tomas Rokicki, Joachim Schnitter, Joachim Schrod, Lee Wittenberg, and others who have contributed improvements.  The ``banner line'' defined here should be changed whenever \.{CTANGLE} is modified.

@d banner "This is CTANGLE (Version 3.62)\n"

@c
@&lt;Include files@&gt;@/
@h
@&lt;Common code for \.{CWEAVE} and \.{CTANGLE}@&gt;@/
@&lt;Typedef declarations@&gt;@/
@&lt;Global variables@&gt;@/
@&lt;Predeclaration of procedures@&gt;@/
</t>
<t tx="ekr.20050502102905.73">@ We predeclare several standard system functions here instead of including their system header files, because the names of the header files are not as standard as the names of the functions. (For example, some \CEE/ environments have \.{&lt;string.h&gt;} where others have \.{&lt;strings.h&gt;}.)

@&lt;Predeclaration of procedures@&gt;=
extern int strlen(); /* length of string */
extern int strcmp(); /* compare strings lexicographically */
extern char* strcpy(); /* copy one string to another */
extern int strncmp(); /* compare up to $n$ string characters */
extern char* strncpy(); /* copy up to $n$ string characters */
</t>
<t tx="ekr.20050502102905.74">@ \.{CTANGLE} has a fairly straightforward outline.  It operates in two phases: First it reads the source file, saving the \CEE/ code in compressed form; then it shuffles and outputs the code.  Please read the documentation for \.{common}, the set of routines common to \.{CTANGLE} and \.{CWEAVE}, before proceeding further.

@c
int main (ac, av)
int ac;
char **av;
{
  argc=ac; argv=av;
  program=ctangle;
  @&lt;Set initial values@&gt;;
  common_init();
  if (show_banner) printf(banner); /* print a ``banner line'' */
  phase_one(); /* read all the user's text and compress it into |tok_mem| */
  phase_two(); /* output the contents of the compressed tables */
  return wrap_up(); /* and exit gracefully */
}</t>
<t tx="ekr.20050502102905.75"></t>
<t tx="ekr.20050502102905.76">@ The following parameters were sufficient in the original \.{TANGLE} to handle \TEX/, so they should be sufficient for most applications of \.{CTANGLE}. If you change |max_bytes|, |max_names|, or |hash_size| you should also change them in the file |"common.w"|.

@d max_bytes 90000 /* the number of bytes in identifiers,
  index entries, and section names; used in |"common.w"| */

@d max_toks 270000 /* number of bytes in compressed \CEE/ code */
@d max_names 4000 /* number of identifiers, strings, section names;
  must be less than 10240; used in |"common.w"| */

@d max_texts 2500 /* number of replacement texts, must be less than 10240 */
@d hash_size 353 /* should be prime; used in |"common.w"| */
@d longest_name 10000 /* section names shouldn't be longer than this */
@d stack_size 50 /* number of simultaneous levels of macro expansion */
@d buf_size 100 /* for \.{CWEAVE} and \.{CTANGLE} */

@ The next few sections contain stuff from the file |"common.w"| that must
be included in both |"ctangle.w"| and |"cweave.w"|. It appears in
file |"common.h"|, which needs to be updated when |"common.w"| changes.

@i common.h
</t>
<t tx="ekr.20050502102905.77">@* Data structures exclusive to {\tt CTANGLE}. We've already seen that the |byte_mem| array holds the names of identifiers, strings, and sections; the |tok_mem| array holds the replacement texts for sections. Allocation is sequential, since things are deleted only during Phase II, and only in a last-in-first-out manner.  A \&amp;{text} variable is a structure containing a pointer into |tok_mem|, which tells where the corresponding text starts, and an integer |text_link|, which, as we shall see later, is used to connect pieces of text that have the same name.  All the \&amp;{text}s are stored in the array |text_info|, and we use a |text_pointer| variable to refer to them.  The first position of |tok_mem| that is unoccupied by replacement text is called |tok_ptr|, and the first unused location of |text_info| is called |text_ptr|.  Thus we usually have the identity |text_ptr-&gt;tok_start==tok_ptr|.  If your machine does not support |unsigned char| you should change the definition of \&amp;{eight\_bits} to |unsigned short|. @^system dependencies@&gt;

@&lt;Typedef declarations@&gt;=
typedef struct {
  eight_bits *tok_start; /* pointer into |tok_mem| */
  sixteen_bits text_link; /* relates replacement texts */
} text;
typedef text *text_pointer;</t>
<t tx="ekr.20050502102905.78">@ @&lt;Glob...@&gt;=
text text_info[max_texts];
text_pointer text_info_end=text_info+max_texts-1;
text_pointer text_ptr; /* first unused position in |text_info| */
eight_bits tok_mem[max_toks];
eight_bits *tok_mem_end=tok_mem+max_toks-1;
eight_bits *tok_ptr; /* first unused position in |tok_mem| */

@ @&lt;Set init...@&gt;=
text_info-&gt;tok_start=tok_ptr=tok_mem;
text_ptr=text_info+1; text_ptr-&gt;tok_start=tok_mem;
  /* this makes replacement text 0 of length zero */
</t>
<t tx="ekr.20050502102905.79">@ If |p| is a pointer to a section name, |p-&gt;equiv| is a pointer to its replacement text, an element of the array |text_info|.

@d equiv equiv_or_xref /* info corresponding to names */

@ @&lt;Set init...@&gt;=
name_dir-&gt;equiv=(char *)text_info; /* the undefined section has no replacement text */
</t>
<t tx="ekr.20050502102905.8">@ The |flags| will be initially zero. Some of them are set to~1 before scanning the arguments; if additional flags are 1 by default they should be set before calling |common_init|.

@&lt;Set the default options common to \.{CTANGLE} and \.{CWEAVE}@&gt;=
show_banner=show_happiness=show_progress=1;
</t>
<t tx="ekr.20050502102905.80">@ Here's the procedure that decides whether a name of length |l| starting at position |first| equals the identifier pointed to by |p|:

@c
int names_match(p,first,l)
name_pointer p; /* points to the proposed match */
char *first; /* position of first character of string */
int l; /* length of identifier */
{
  if (length(p)!=l) return 0;
  return !strncmp(first,p-&gt;byte_start,l);
}</t>
<t tx="ekr.20050502102905.81">@ The common lookup routine refers to separate routines |init_node| and |init_p| when the data structure grows. Actually |init_p| is called only by \.{CWEAVE}, but we need to declare a dummy version so that the loader won't complain of its absence.

@c
void
init_node(node)
name_pointer node;
{
    node-&gt;equiv=(char *)text_info;
}
void
init_p() {}</t>
<t tx="ekr.20050502102905.82">@* Tokens. Replacement texts, which represent \CEE/ code in a compressed format, appear in |tok_mem| as mentioned above. The codes in these texts are called `tokens'; some tokens occupy two consecutive eight-bit byte positions, and the others take just one byte.  If $p$ points to a replacement text, |p-&gt;tok_start| is the |tok_mem| position of the first eight-bit code of that text. If |p-&gt;text_link==0|, this is the replacement text for a macro, otherwise it is the replacement text for a section. In the latter case |p-&gt;text_link| is either equal to |section_flag|, which means that there is no further text for this section, or |p-&gt;text_link| points to a continuation of this replacement text; such links are created when several sections have \CEE/ texts with the same name, and they also tie together all the \CEE/ texts of unnamed sections. The replacement text pointer for the first unnamed section appears in |text_info-&gt;text_link|, and the most recent such pointer is |last_unnamed|.

@d section_flag max_texts /* final |text_link| in section replacement texts */

@&lt;Global variables@&gt;=
text_pointer last_unnamed; /* most recent replacement text of unnamed section */

@ @&lt;Set init...@&gt;= last_unnamed=text_info; text_info-&gt;text_link=0;

@ If the first byte of a token is less than |0200|, the token occupies a single byte. Otherwise we make a sixteen-bit token by combining two consecutive bytes |a| and |b|. If |0200&lt;=a&lt;0250|, then |(a-0200)@t${}\times2^8$@&gt;+b| points to an identifier; if |0250&lt;=a&lt;0320|, then |(a-0250)@t${}\times2^8$@&gt;+b| points to a section name (or, if it has the special value |output_defs_flag|, to the area where the preprocessor definitions are stored); and if |0320&lt;=a&lt;0400|, then |(a-0320)@t${}\times2^8$@&gt;+b| is the number of the section in which the current replacement text appears.  Codes less than |0200| are 7-bit |char| codes that represent themselves. Some of the 7-bit codes will not be present, however, so we can use them for special purposes. The following symbolic names are used:  \yskip \hang |join| denotes the concatenation of adjacent items with no space or line breaks allowed between them (the \.{@@\&amp;} operation of \.{CWEB}).  \hang |string| denotes the beginning or end of a string, verbatim construction or numerical constant. @^ASCII code dependencies@&gt;

@d string 02 /* takes the place of extended ASCII \.{\char2} */
@d join 0177 /* takes the place of ASCII delete */
@d output_defs_flag (2*024000-1)
</t>
<t tx="ekr.20050502102905.83">@ The following procedure is used to enter a two-byte value into |tok_mem| when a replacement text is being generated.

@c
void
store_two_bytes(x)
sixteen_bits x;
{
  if (tok_ptr+2&gt;tok_mem_end) overflow("token");
  *tok_ptr++=x&gt;&gt;8; /* store high byte */
  *tok_ptr++=x&amp;0377; /* store low byte */
}</t>
<t tx="ekr.20050502102905.84"></t>
<t tx="ekr.20050502102905.85">@** Stacks for output.  The output process uses a stack to keep track of what is going on at different ``levels'' as the sections are being written out.  Entries on this stack have five parts:  \yskip\hang |end_field| is the |tok_mem| location where the replacement text of a particular level will end;  \hang |byte_field| is the |tok_mem| location from which the next token on a particular level will be read;  \hang |name_field| points to the name corresponding to a particular level;  \hang |repl_field| points to the replacement text currently being read at a particular level;  \hang |section_field| is the section number, or zero if this is a macro.  \yskip\noindent The current values of these five quantities are referred to quite frequently, so they are stored in a separate place instead of in the |stack| array. We call the current values |cur_end|, |cur_byte|, |cur_name|, |cur_repl|, and |cur_section|.  The global variable |stack_ptr| tells how many levels of output are currently in progress. The end of all output occurs when the stack is empty, i.e., when |stack_ptr==stack|.

@&lt;Typedef declarations@&gt;=
typedef struct {
  eight_bits *end_field; /* ending location of replacement text */
  eight_bits *byte_field; /* present location within replacement text */
  name_pointer name_field; /* |byte_start| index for text being output */
  text_pointer repl_field; /* |tok_start| index for text being output */
  sixteen_bits section_field; /* section number or zero if not a section */
} output_state;
typedef output_state *stack_pointer;</t>
<t tx="ekr.20050502102905.86">@ @d cur_end cur_state.end_field /* current ending location in |tok_mem| */
@d cur_byte cur_state.byte_field /* location of next output byte in |tok_mem|*/
@d cur_name cur_state.name_field /* pointer to current name being expanded */
@d cur_repl cur_state.repl_field /* pointer to current replacement text */
@d cur_section cur_state.section_field /* current section number being expanded */

@&lt;Global variables@&gt;=
output_state cur_state; /* |cur_end|, |cur_byte|, |cur_name|, |cur_repl|,
  and |cur_section| */
output_state stack[stack_size+1]; /* info for non-current levels */
stack_pointer stack_ptr; /* first unused location in the output state stack */
stack_pointer stack_end=stack+stack_size; /* end of |stack| */

@ To get the output process started, we will perform the following initialization steps. We may assume that |text_info-&gt;text_link| is nonzero, since it points to the \CEE/ text in the first unnamed section that generates code; if there are no such sections, there is nothing to output, and an error message will have been generated before we do any of the initialization.

@&lt;Initialize the output stacks@&gt;=
stack_ptr=stack+1; cur_name=name_dir; cur_repl=text_info-&gt;text_link+text_info;
cur_byte=cur_repl-&gt;tok_start; cur_end=(cur_repl+1)-&gt;tok_start; cur_section=0;
</t>
<t tx="ekr.20050502102905.87">@ When the replacement text for name |p| is to be inserted into the output, the following subroutine is called to save the old level of output and get the new one going.  We assume that the \CEE/ compiler can copy structures. @^system dependencies@&gt;

@c
void
push_level(p) /* suspends the current level */
name_pointer p;
{
  if (stack_ptr==stack_end) overflow("stack");
  *stack_ptr=cur_state;
  stack_ptr++;
  if (p!=NULL) { /* |p==NULL| means we are in |output_defs| */
    cur_name=p; cur_repl=(text_pointer)p-&gt;equiv;
    cur_byte=cur_repl-&gt;tok_start; cur_end=(cur_repl+1)-&gt;tok_start;
    cur_section=0;
  }
}</t>
<t tx="ekr.20050502102905.88">@ When we come to the end of a replacement text, the |pop_level| subroutine does the right thing: It either moves to the continuation of this replacement text or returns the state to the most recently stacked level.

@c
void
pop_level(flag) /* do this when |cur_byte| reaches |cur_end| */
int flag; /* |flag==0| means we are in |output_defs| */
{
  if (flag &amp;&amp; cur_repl-&gt;text_link&lt;section_flag) { /* link to a continuation */
    cur_repl=cur_repl-&gt;text_link+text_info; /* stay on the same level */
    cur_byte=cur_repl-&gt;tok_start; cur_end=(cur_repl+1)-&gt;tok_start;
    return;
  }
  stack_ptr--; /* go down to the previous level */
  if (stack_ptr&gt;stack) cur_state=*stack_ptr;
}</t>
<t tx="ekr.20050502102905.89">@ The heart of the output procedure is the function |get_output|, which produces the next token of output and sends it on to the lower-level function |out_char|. The main purpose of |get_output| is to handle the necessary stacking and unstacking. It sends the value |section_number| if the next output begins or ends the replacement text of some section, in which case |cur_val| is that section's number (if beginning) or the negative of that value (if ending). (A section number of 0 indicates not the beginning or ending of a section, but a \&amp;{\#line} command.) And it sends the value |identifier| if the next output is an identifier, in which case |cur_val| points to that identifier name.

@d section_number 0201 /* code returned by |get_output| for section numbers */
@d identifier 0202 /* code returned by |get_output| for identifiers */

@&lt;Global variables@&gt;=
int cur_val; /* additional information corresponding to output token */

@ If |get_output| finds that no more output remains, it returns with |stack_ptr==stack|. @^high-bit character handling@&gt;

@c
void
get_output() /* sends next token to |out_char| */
{
  sixteen_bits a; /* value of current byte */
  restart: if (stack_ptr==stack) return;
  if (cur_byte==cur_end) {
    cur_val=-((int)cur_section); /* cast needed because of sign extension */
    pop_level(1);
    if (cur_val==0) goto restart;
    out_char(section_number); return;
  }
  a=*cur_byte++;
  if (out_state==verbatim &amp;&amp; a!=string &amp;&amp; a!=constant &amp;&amp; a!='\n')
    C_putc(a); /* a high-bit character can occur in a string */
  else if (a&lt;0200) out_char(a); /* one-byte token */
  else {
    a=(a-0200)*0400+*cur_byte++;
    switch (a/024000) { /* |024000==(0250-0200)*0400| */
      case 0: cur_val=a; out_char(identifier); break;
      case 1: if (a==output_defs_flag) output_defs();
        else @&lt;Expand section |a-024000|, |goto restart|@&gt;;
        break;
      default: cur_val=a-050000; if (cur_val&gt;0) cur_section=cur_val;
        out_char(section_number);
    }
  }
}</t>
<t tx="ekr.20050502102905.9">@
@&lt;Scan arguments and open output files@&gt;=
scan_args();
if (program==ctangle) {
  if ((C_file=fopen(C_file_name,"w"))==NULL)
    fatal("! Cannot open output file ", C_file_name);
@.Cannot open output file@&gt;
}
else {
  if ((tex_file=fopen(tex_file_name,"w"))==NULL)
    fatal("! Cannot open output file ", tex_file_name);
}
</t>
<t tx="ekr.20050502102905.90">@ The user may have forgotten to give any \CEE/ text for a section name, or the \CEE/ text may have been associated with a different name by mistake.

@&lt;Expand section |a-024000|, |goto restart|@&gt;=
{
  a-=024000;
  if ((a+name_dir)-&gt;equiv!=(char *)text_info) push_level(a+name_dir);
  else if (a!=0) {
    printf("\n! Not present: &lt;");
    print_section_name(a+name_dir); err_print("&gt;");
@.Not present: &lt;section name&gt;@&gt;
  }
  goto restart;
}
</t>
<t tx="ekr.20050502102905.91">@* Producing the output.
The |get_output| routine above handles most of the complexity of output
generation, but there are two further considerations that have a nontrivial
effect on \.{CTANGLE}'s algorithms.</t>
<t tx="ekr.20050502102905.92">@ First, we want to make sure that the output has spaces and line breaks in the right places (e.g., not in the middle of a string or a constant or an identifier, not at a `\.{@@\&amp;}' position where quantities are being joined together, and certainly after an \.= because the \CEE/ compiler thinks \.{=-} is ambiguous).  The output process can be in one of following states:  \yskip\hang |num_or_id| means that the last item in the buffer is a number or identifier, hence a blank space or line break must be inserted if the next item is also a number or identifier.  \yskip\hang |unbreakable| means that the last item in the buffer was followed by the \.{@@\&amp;} operation that inhibits spaces between it and the next item.  \yskip\hang |verbatim| means we're copying only character tokens, and that they are to be output exactly as stored.  This is the case during strings, verbatim constructions and numerical constants.  \yskip\hang |post_slash| means we've just output a slash.  \yskip\hang |normal| means none of the above.  \yskip\noindent Furthermore, if the variable |protect| is positive, newlines are preceded by a `\.\\'.

@d normal 0 /* non-unusual state */
@d num_or_id 1 /* state associated with numbers and identifiers */
@d post_slash 2 /* state following a \./ */
@d unbreakable 3 /* state associated with \.{@@\&amp;} */
@d verbatim 4 /* state in the middle of a string */

@&lt;Global variables@&gt;=
eight_bits out_state; /* current status of partial output */
boolean protect; /* should newline characters be quoted? */
</t>
<t tx="ekr.20050502102905.93">@ Here is a routine that is invoked when we want to output the current line. During the output process, |cur_line| equals the number of the next line to be output.

@c
void
flush_buffer() /* writes one line to output file */
{
  C_putc('\n');
  if (cur_line % 100 == 0 &amp;&amp; show_progress) {
    printf(".");
    if (cur_line % 500 == 0) printf("%d",cur_line);
    update_terminal; /* progress report */
  }
  cur_line++;
}</t>
<t tx="ekr.20050502102905.94">@ Second, we have modified the original \.{TANGLE} so that it will write output on multiple files. If a section name is introduced in at least one place by \.{@@(} instead of \.{@

@&lt;}, we treat it as the name of a file.
All these special sections are saved on a stack, |output_files|.
We write them out after we've done the unnamed section.

@d max_files 256
@&lt;Global variables@&gt;=
name_pointer output_files[max_files];
name_pointer *cur_out_file, *end_output_files, *an_output_file;
char cur_section_name_char; /* is it |'&lt;'| or |'('| */
char output_file_name[longest_name]; /* name of the file */

@ We make |end_output_files| point just beyond the end of |output_files|. The stack pointer |cur_out_file| starts out there. Every time we see a new file, we decrement |cur_out_file| and then write it in.

@&lt;Set initial values@&gt;=
cur_out_file=end_output_files=output_files+max_files;
</t>
<t tx="ekr.20050502102905.95">@* The big output switch.  Here then is the routine that does the output.
</t>
<t tx="ekr.20050502102905.96">@&lt;Predeclaration of procedures@&gt;=
void phase_two();

@ @c
void
phase_two () {
  web_file_open=0;
  cur_line=1;
  @&lt;Initialize the output stacks@&gt;;
  @&lt;Output macro definitions if appropriate@&gt;;
  if (text_info-&gt;text_link==0 &amp;&amp; cur_out_file==end_output_files) {
    printf("\n! No program text was specified."); mark_harmless;
@.No program text...@&gt;
  }
  else {
    if(cur_out_file==end_output_files) {
      if(show_progress)
        printf("\nWriting the output file (%s):",C_file_name);
    }
    else {
      if (show_progress) {
        printf("\nWriting the output files:");
@.Writing the output...@&gt;
        printf(" (%s)",C_file_name);
        update_terminal;
      }
      if (text_info-&gt;text_link==0) goto writeloop;
    }
    while (stack_ptr&gt;stack) get_output();
    flush_buffer();
writeloop:   @&lt;Write all the named output files@&gt;;
    if(show_happiness) printf("\nDone.");
  }
}
</t>
<t tx="ekr.20050502102905.97">@ If a \.{@@h} was not encountered in the input, we go through the list of replacement texts and copy the ones that refer to macros, preceded by the \.{\#define} preprocessor command.

@&lt;Output macro definitions if appropriate@&gt;=
  if (!output_defs_seen)
    output_defs();
</t>
<t tx="ekr.20050502102905.98">@ To write the named output files, we proceed as for the unnamed section. The only subtlety is that we have to open each one.

@&lt;Write all the named output files@&gt;=
for (an_output_file=end_output_files; an_output_file&gt;cur_out_file;) {
    an_output_file--;
    sprint_section_name(output_file_name,*an_output_file);
    fclose(C_file);
    C_file=fopen(output_file_name,"w");
    if (C_file ==0) fatal("! Cannot open output file:",output_file_name);
@.Cannot open output file@&gt;
    printf("\n(%s)",output_file_name); update_terminal;
    cur_line=1;
    stack_ptr=stack+1;
    cur_name= (*an_output_file);
    cur_repl= (text_pointer)cur_name-&gt;equiv;
    cur_byte=cur_repl-&gt;tok_start;
    cur_end=(cur_repl+1)-&gt;tok_start;
    while (stack_ptr &gt; stack) get_output();
    flush_buffer();
}
</t>
<t tx="ekr.20050502102905.99">@ @&lt;Glob...@&gt;=
boolean output_defs_seen=0;

@ @&lt;Predecl...@&gt;=
void output_defs();

@ @c
void
output_defs()
{
  sixteen_bits a;
  push_level(NULL);
  for (cur_text=text_info+1; cur_text&lt;text_ptr; cur_text++)
    if (cur_text-&gt;text_link==0) { /* |cur_text| is the text for a macro */
      cur_byte=cur_text-&gt;tok_start;
      cur_end=(cur_text+1)-&gt;tok_start;
      C_printf("%s","#define ");
      out_state=normal;
      protect=1; /* newlines should be preceded by |'\\'| */
      while (cur_byte&lt;cur_end) {
        a=*cur_byte++;
        if (cur_byte==cur_end &amp;&amp; a=='\n') break; /* disregard a final newline */
        if (out_state==verbatim &amp;&amp; a!=string &amp;&amp; a!=constant &amp;&amp; a!='\n')
          C_putc(a); /* a high-bit character can occur in a string */
@^high-bit character handling@&gt;
        else if (a&lt;0200) out_char(a); /* one-byte token */
        else {
          a=(a-0200)*0400+*cur_byte++;
          if (a&lt;024000) { /* |024000==(0250-0200)*0400| */
            cur_val=a; out_char(identifier);
          }
          else if (a&lt;050000) { confusion("macro defs have strange char");}
          else {
            cur_val=a-050000; cur_section=cur_val; out_char(section_number);
          }
      /* no other cases */
        }
      }
      protect=0;
      flush_buffer();
    }
  pop_level(0);
}
</t>
</tnodes>
</leo_file>
