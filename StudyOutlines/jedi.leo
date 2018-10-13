<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20180516073049.1"><vh>@settings</vh>
<v t="ekr.20180516073122.1"><vh>@bool run-pyflakes-on-write = False</vh></v>
</v>
<v t="ekr.20180516071358.1"><vh>Recursive import script</vh></v>
<v t="ekr.20180516073042.1"><vh>Logs</vh>
<v t="ekr.20180516072403.1"><vh>pyflakes errors</vh></v>
<v t="ekr.20180519065831.1"><vh>jedi import log</vh></v>
<v t="ekr.20180519070921.1"><vh>parso import log</vh></v>
</v>
<v t="ekr.20180519070853.2"><vh>@path C:/Anaconda3/Lib/site-packages/parso</vh>
<v t="ekr.20180519070853.3"><vh>@clean cache.py</vh>
<v t="ekr.20180519070853.4"><vh>Declarations</vh></v>
<v t="ekr.20180519070853.5"><vh>_get_default_cache_path</vh></v>
<v t="ekr.20180519070853.6"><vh>class _NodeCacheItem</vh>
<v t="ekr.20180519070853.7"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519070853.8"><vh>load_module</vh></v>
<v t="ekr.20180519070853.9"><vh>_load_from_file_system</vh></v>
<v t="ekr.20180519070853.10"><vh>save_module</vh></v>
<v t="ekr.20180519070853.11"><vh>_save_to_file_system</vh></v>
<v t="ekr.20180519070853.12"><vh>clear_cache</vh></v>
<v t="ekr.20180519070853.13"><vh>_get_hashed_path</vh></v>
<v t="ekr.20180519070853.14"><vh>_get_cache_directory_path</vh></v>
</v>
<v t="ekr.20180519070853.15"><vh>@clean grammar.py</vh>
<v t="ekr.20180519070853.16"><vh>Declarations (parso.grammar.py)</vh></v>
<v t="ekr.20180519070853.17"><vh>class Grammar</vh>
<v t="ekr.20180519070853.18"><vh>__init__</vh></v>
<v t="ekr.20180519070853.19"><vh>parse</vh></v>
<v t="ekr.20180519070853.20"><vh>Grammar._parse **</vh></v>
<v t="ekr.20180519070853.21"><vh>_get_token_namespace</vh></v>
<v t="ekr.20180519070853.22"><vh>iter_errors</vh></v>
<v t="ekr.20180519070853.23"><vh>_get_normalizer</vh></v>
<v t="ekr.20180519070853.24"><vh>_normalize</vh></v>
<v t="ekr.20180519070853.25"><vh>_get_normalizer_issues</vh></v>
<v t="ekr.20180519070853.26"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519070853.27"><vh>class PythonGrammar</vh>
<v t="ekr.20180519070853.28"><vh>__init__</vh></v>
<v t="ekr.20180519070853.29"><vh>_tokenize_lines</vh></v>
<v t="ekr.20180519070853.30"><vh>_tokenize</vh></v>
</v>
<v t="ekr.20180519070853.31"><vh>load_grammar</vh></v>
</v>
<v t="ekr.20180519070853.32"><vh>@clean normalizer.py</vh>
<v t="ekr.20180519070853.33"><vh>Declarations</vh></v>
<v t="ekr.20180519070853.34"><vh>class _NormalizerMeta</vh>
<v t="ekr.20180519070853.35"><vh>__new__</vh></v>
</v>
<v t="ekr.20180519070853.36"><vh>class Normalizer</vh>
<v t="ekr.20180519070853.37"><vh>__init__</vh></v>
<v t="ekr.20180519070853.38"><vh>_instantiate_rules</vh></v>
<v t="ekr.20180519070853.39"><vh>walk</vh></v>
<v t="ekr.20180519070853.40"><vh>visit</vh></v>
<v t="ekr.20180519070853.41"><vh>visit_node</vh></v>
<v t="ekr.20180519070853.42"><vh>_check_type_rules</vh></v>
<v t="ekr.20180519070853.43"><vh>visit_leaf</vh></v>
<v t="ekr.20180519070853.44"><vh>initialize</vh></v>
<v t="ekr.20180519070853.45"><vh>finalize</vh></v>
<v t="ekr.20180519070853.46"><vh>add_issue</vh></v>
<v t="ekr.20180519070853.47"><vh>register_rule</vh></v>
<v t="ekr.20180519070853.48"><vh>_register_rule</vh></v>
</v>
<v t="ekr.20180519070853.49"><vh>class NormalizerConfig</vh>
<v t="ekr.20180519070853.50"><vh>create_normalizer</vh></v>
</v>
<v t="ekr.20180519070853.51"><vh>class Issue</vh>
<v t="ekr.20180519070853.52"><vh>__init__</vh></v>
<v t="ekr.20180519070853.53"><vh>__eq__</vh></v>
<v t="ekr.20180519070853.54"><vh>__ne__</vh></v>
<v t="ekr.20180519070853.55"><vh>__hash__</vh></v>
<v t="ekr.20180519070853.56"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519070853.57"><vh>class Rule</vh>
<v t="ekr.20180519070853.58"><vh>__init__</vh></v>
<v t="ekr.20180519070853.59"><vh>is_issue</vh></v>
<v t="ekr.20180519070853.60"><vh>get_node</vh></v>
<v t="ekr.20180519070853.61"><vh>_get_message</vh></v>
<v t="ekr.20180519070853.62"><vh>add_issue</vh></v>
<v t="ekr.20180519070853.63"><vh>feed_node</vh></v>
</v>
</v>
<v t="ekr.20180519070853.64"><vh>@clean parser.py</vh>
<v t="ekr.20180519070853.65"><vh>Declarations</vh></v>
<v t="ekr.20180519070853.66"><vh>class ParserSyntaxError</vh>
<v t="ekr.20180519070853.67"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519070853.68"><vh>class BaseParser</vh>
<v t="ekr.20180519070853.69"><vh>__init__</vh></v>
<v t="ekr.20180519070853.70"><vh>parse</vh></v>
<v t="ekr.20180519070853.71"><vh>error_recovery</vh></v>
<v t="ekr.20180519070853.72"><vh>convert_node</vh></v>
<v t="ekr.20180519070853.73"><vh>convert_leaf</vh></v>
</v>
</v>
<v t="ekr.20180519070853.74"><vh>@clean tree.py</vh>
<v t="ekr.20180519070853.75"><vh>Declarations</vh></v>
<v t="ekr.20180519070853.76"><vh>search_ancestor</vh></v>
<v t="ekr.20180519070853.77"><vh>class NodeOrLeaf</vh>
<v t="ekr.20180519070853.78"><vh>get_root_node</vh></v>
<v t="ekr.20180519070853.79"><vh>get_next_sibling</vh></v>
<v t="ekr.20180519070853.80"><vh>get_previous_sibling</vh></v>
<v t="ekr.20180519070853.81"><vh>get_previous_leaf</vh></v>
<v t="ekr.20180519070853.82"><vh>get_next_leaf</vh></v>
<v t="ekr.20180519070853.83"><vh>start_pos</vh></v>
<v t="ekr.20180519070853.84"><vh>end_pos</vh></v>
<v t="ekr.20180519070853.85"><vh>get_start_pos_of_prefix</vh></v>
<v t="ekr.20180519070853.86"><vh>get_first_leaf</vh></v>
<v t="ekr.20180519070853.87"><vh>get_last_leaf</vh></v>
<v t="ekr.20180519070853.88"><vh>get_code</vh></v>
</v>
<v t="ekr.20180519070853.89"><vh>class Leaf</vh>
<v t="ekr.20180519070853.90"><vh>__init__</vh></v>
<v t="ekr.20180519070853.91"><vh>start_pos</vh></v>
<v t="ekr.20180519070853.92"><vh>start_pos</vh></v>
<v t="ekr.20180519070853.93"><vh>get_start_pos_of_prefix</vh></v>
<v t="ekr.20180519070853.94"><vh>get_first_leaf</vh></v>
<v t="ekr.20180519070853.95"><vh>get_last_leaf</vh></v>
<v t="ekr.20180519070853.96"><vh>get_code</vh></v>
<v t="ekr.20180519070853.97"><vh>end_pos</vh></v>
<v t="ekr.20180519070853.98"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519070853.99"><vh>class TypedLeaf</vh>
<v t="ekr.20180519070853.100"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519070853.101"><vh>class BaseNode</vh>
<v t="ekr.20180519070853.102"><vh>__init__</vh></v>
<v t="ekr.20180519070853.103"><vh>start_pos</vh></v>
<v t="ekr.20180519070853.104"><vh>get_start_pos_of_prefix</vh></v>
<v t="ekr.20180519070853.105"><vh>end_pos</vh></v>
<v t="ekr.20180519070853.106"><vh>_get_code_for_children</vh></v>
<v t="ekr.20180519070853.107"><vh>get_code</vh></v>
<v t="ekr.20180519070853.108"><vh>get_leaf_for_position</vh></v>
<v t="ekr.20180519070853.109"><vh>get_first_leaf</vh></v>
<v t="ekr.20180519070853.110"><vh>get_last_leaf</vh></v>
<v t="ekr.20180519070853.111"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519070853.112"><vh>class Node</vh>
<v t="ekr.20180519070853.113"><vh>__init__</vh></v>
<v t="ekr.20180519070853.114"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519070853.115"><vh>class ErrorNode</vh></v>
<v t="ekr.20180519070853.116"><vh>class ErrorLeaf</vh>
<v t="ekr.20180519070853.117"><vh>__init__</vh></v>
<v t="ekr.20180519070853.118"><vh>__repr__</vh></v>
</v>
</v>
<v t="ekr.20180519070853.119"><vh>@clean utils.py</vh>
<v t="ekr.20180519070853.120"><vh>Declarations</vh></v>
<v t="ekr.20180519070853.121"><vh>split_lines</vh></v>
<v t="ekr.20180519070853.122"><vh>python_bytes_to_unicode</vh></v>
<v t="ekr.20180519070853.123"><vh>version_info</vh></v>
<v t="ekr.20180519070853.124"><vh>_parse_version</vh></v>
<v t="ekr.20180519070853.125"><vh>class PythonVersionInfo</vh>
<v t="ekr.20180519070853.126"><vh>__gt__</vh></v>
<v t="ekr.20180519070853.127"><vh>__eq__</vh></v>
<v t="ekr.20180519070853.128"><vh>__ne__</vh></v>
</v>
<v t="ekr.20180519070853.129"><vh>parse_version_string</vh></v>
</v>
<v t="ekr.20180519070853.130"><vh>@clean _compatibility.py</vh>
<v t="ekr.20180519070853.131"><vh>Declarations</vh></v>
<v t="ekr.20180519070853.132"><vh>use_metaclass</vh></v>
<v t="ekr.20180519070853.133"><vh>u</vh></v>
<v t="ekr.20180519070853.134"><vh>utf8_repr</vh></v>
</v>
<v t="ekr.20180519070853.135"><vh>@clean __init__.py</vh>
<v t="ekr.20180519070853.136"><vh>Declarations</vh></v>
<v t="ekr.20180519070853.137"><vh>parse</vh></v>
</v>
<v t="ekr.20180519070853.138"><vh>@path .git</vh>
<v t="ekr.20180519070853.141"><vh>@path logs</vh>
<v t="ekr.20180519070853.142"><vh>@path refs</vh></v>
</v>
<v t="ekr.20180519070853.144"><vh>@path objects</vh></v>
<v t="ekr.20180519070853.178"><vh>@path refs</vh></v>
</v>
<v t="ekr.20180519070854.1"><vh>@path pgen2</vh>
<v t="ekr.20180519070854.2"><vh>@clean grammar.py</vh>
<v t="ekr.20180519070854.3"><vh>Declarations</vh></v>
<v t="ekr.20180519070854.4"><vh>class Grammar</vh>
<v t="ekr.20180519070854.5"><vh>__init__</vh></v>
<v t="ekr.20180519070854.6"><vh>dump</vh></v>
<v t="ekr.20180519070854.7"><vh>load</vh></v>
<v t="ekr.20180519070854.8"><vh>copy</vh></v>
<v t="ekr.20180519070854.9"><vh>report</vh></v>
</v>
</v>
<v t="ekr.20180519070854.10"><vh>@clean parse.py</vh>
<v t="ekr.20180519070854.11"><vh>Declarations</vh></v>
<v t="ekr.20180519070854.12"><vh>class InternalParseError</vh>
<v t="ekr.20180519070854.13"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519070854.14"><vh>class Stack</vh>
<v t="ekr.20180519070854.15"><vh>get_tos_nodes</vh></v>
</v>
<v t="ekr.20180519070854.16"><vh>token_to_ilabel</vh></v>
<v t="ekr.20180519070854.17"><vh>class PgenParser</vh>
<v t="ekr.20180519070854.18"><vh>__init__</vh></v>
<v t="ekr.20180519070854.19"><vh>parse</vh></v>
<v t="ekr.20180519070854.20"><vh>add_token</vh></v>
<v t="ekr.20180519070854.21"><vh>_shift</vh></v>
<v t="ekr.20180519070854.22"><vh>_push</vh></v>
<v t="ekr.20180519070854.23"><vh>_pop</vh></v>
</v>
</v>
<v t="ekr.20180519070854.24"><vh>@clean pgen.py</vh>
<v t="ekr.20180519070854.25"><vh>Declarations</vh></v>
<v t="ekr.20180519070854.26"><vh>class ParserGenerator</vh>
<v t="ekr.20180519070854.27"><vh>__init__</vh></v>
<v t="ekr.20180519070854.28"><vh>make_grammar</vh></v>
<v t="ekr.20180519070854.29"><vh>_make_first</vh></v>
<v t="ekr.20180519070854.30"><vh>_make_label</vh></v>
<v t="ekr.20180519070854.31"><vh>_addfirstsets</vh></v>
<v t="ekr.20180519070854.32"><vh>_calcfirst</vh></v>
<v t="ekr.20180519070854.33"><vh>_parse</vh></v>
<v t="ekr.20180519070854.34"><vh>_make_dfa</vh></v>
<v t="ekr.20180519070854.35"><vh>_dump_nfa</vh></v>
<v t="ekr.20180519070854.36"><vh>_dump_dfa</vh></v>
<v t="ekr.20180519070854.37"><vh>_simplify_dfa</vh></v>
<v t="ekr.20180519070854.38"><vh>_parse_rhs</vh></v>
<v t="ekr.20180519070854.39"><vh>_parse_alt</vh></v>
<v t="ekr.20180519070854.40"><vh>_parse_item</vh></v>
<v t="ekr.20180519070854.41"><vh>_parse_atom</vh></v>
<v t="ekr.20180519070854.42"><vh>_expect</vh></v>
<v t="ekr.20180519070854.43"><vh>_gettoken</vh></v>
<v t="ekr.20180519070854.44"><vh>_raise_error</vh></v>
</v>
<v t="ekr.20180519070854.45"><vh>class NFAState</vh>
<v t="ekr.20180519070854.46"><vh>__init__</vh></v>
<v t="ekr.20180519070854.47"><vh>addarc</vh></v>
</v>
<v t="ekr.20180519070854.48"><vh>class DFAState</vh>
<v t="ekr.20180519070854.49"><vh>__init__</vh></v>
<v t="ekr.20180519070854.50"><vh>addarc</vh></v>
<v t="ekr.20180519070854.51"><vh>unifystate</vh></v>
<v t="ekr.20180519070854.52"><vh>__eq__</vh></v>
</v>
<v t="ekr.20180519070854.53"><vh>generate_grammar</vh></v>
</v>
<v t="ekr.20180519070854.54"><vh>@clean __init__.py</vh></v>
</v>
<v t="ekr.20180519070854.56"><vh>@path python</vh>
<v t="ekr.20180519070854.57"><vh>@clean diff.py</vh>
<v t="ekr.20180519070854.58"><vh>Declarations</vh></v>
<v t="ekr.20180519070854.59"><vh>_get_last_line</vh></v>
<v t="ekr.20180519070854.60"><vh>_ends_with_newline</vh></v>
<v t="ekr.20180519070854.61"><vh>_flows_finished</vh></v>
<v t="ekr.20180519070854.62"><vh>suite_or_file_input_is_valid</vh></v>
<v t="ekr.20180519070854.63"><vh>_is_flow_node</vh></v>
<v t="ekr.20180519070854.64"><vh>class _PositionUpdatingFinished</vh></v>
<v t="ekr.20180519070854.65"><vh>_update_positions</vh></v>
<v t="ekr.20180519070854.66"><vh>class DiffParser</vh>
<v t="ekr.20180519070854.67"><vh>__init__</vh></v>
<v t="ekr.20180519070854.68"><vh>_reset</vh></v>
<v t="ekr.20180519070854.69"><vh>update</vh></v>
<v t="ekr.20180519070854.70"><vh>_enabled_debugging</vh></v>
<v t="ekr.20180519070854.71"><vh>_copy_from_old_parser</vh></v>
<v t="ekr.20180519070854.72"><vh>_get_old_line_stmt</vh></v>
<v t="ekr.20180519070854.73"><vh>_get_before_insertion_node</vh></v>
<v t="ekr.20180519070854.74"><vh>_parse</vh></v>
<v t="ekr.20180519070854.75"><vh>_try_parse_part</vh></v>
<v t="ekr.20180519070854.76"><vh>_diff_tokenize</vh></v>
</v>
<v t="ekr.20180519070854.77"><vh>class _NodesStackNode</vh>
<v t="ekr.20180519070854.78"><vh>__init__</vh></v>
<v t="ekr.20180519070854.79"><vh>close</vh></v>
<v t="ekr.20180519070854.80"><vh>add</vh></v>
<v t="ekr.20180519070854.81"><vh>get_last_line</vh></v>
</v>
<v t="ekr.20180519070854.82"><vh>class _NodesStack</vh>
<v t="ekr.20180519070854.83"><vh>__init__</vh></v>
<v t="ekr.20180519070854.84"><vh>is_empty</vh></v>
<v t="ekr.20180519070854.85"><vh>parsed_until_line</vh></v>
<v t="ekr.20180519070854.86"><vh>_get_insertion_node</vh></v>
<v t="ekr.20180519070854.87"><vh>_close_tos</vh></v>
<v t="ekr.20180519070854.88"><vh>add_parsed_nodes</vh></v>
<v t="ekr.20180519070854.89"><vh>_remove_endmarker</vh></v>
<v t="ekr.20180519070854.90"><vh>copy_nodes</vh></v>
<v t="ekr.20180519070854.91"><vh>_copy_nodes</vh></v>
<v t="ekr.20180519070854.92"><vh>_update_tos</vh></v>
<v t="ekr.20180519070854.93"><vh>close</vh></v>
</v>
</v>
<v t="ekr.20180519070854.94"><vh>@clean errors.py</vh>
<v t="ekr.20180519070854.95"><vh>Declarations</vh></v>
<v t="ekr.20180519070854.96"><vh>_iter_stmts</vh></v>
<v t="ekr.20180519070854.97"><vh>_get_comprehension_type</vh></v>
<v t="ekr.20180519070854.98"><vh>_is_future_import</vh></v>
<v t="ekr.20180519070854.99"><vh>_remove_parens</vh></v>
<v t="ekr.20180519070854.100"><vh>_iter_params</vh></v>
<v t="ekr.20180519070854.101"><vh>_is_future_import_first</vh></v>
<v t="ekr.20180519070854.102"><vh>_iter_definition_exprs_from_lists</vh></v>
<v t="ekr.20180519070854.103"><vh>_get_expr_stmt_definition_exprs</vh></v>
<v t="ekr.20180519070854.104"><vh>_get_for_stmt_definition_exprs</vh></v>
<v t="ekr.20180519070854.105"><vh>class _Context</vh>
<v t="ekr.20180519070854.106"><vh>__init__</vh></v>
<v t="ekr.20180519070854.107"><vh>is_async_funcdef</vh></v>
<v t="ekr.20180519070854.108"><vh>is_function</vh></v>
<v t="ekr.20180519070854.109"><vh>add_name</vh></v>
<v t="ekr.20180519070854.110"><vh>finalize</vh></v>
<v t="ekr.20180519070854.111"><vh>_analyze_names</vh></v>
<v t="ekr.20180519070854.112"><vh>add_block</vh></v>
<v t="ekr.20180519070854.113"><vh>add_context</vh></v>
<v t="ekr.20180519070854.114"><vh>close_child_context</vh></v>
</v>
<v t="ekr.20180519070854.115"><vh>class ErrorFinder</vh>
<v t="ekr.20180519070854.116"><vh>__init__</vh></v>
<v t="ekr.20180519070854.117"><vh>initialize</vh></v>
<v t="ekr.20180519070854.118"><vh>visit</vh></v>
<v t="ekr.20180519070854.119"><vh>visit_node</vh></v>
<v t="ekr.20180519070854.120"><vh>visit_leaf</vh></v>
<v t="ekr.20180519070854.121"><vh>_add_indentation_error</vh></v>
<v t="ekr.20180519070854.122"><vh>_add_syntax_error</vh></v>
<v t="ekr.20180519070854.123"><vh>add_issue</vh></v>
<v t="ekr.20180519070854.124"><vh>finalize</vh></v>
</v>
<v t="ekr.20180519070854.125"><vh>class IndentationRule</vh>
<v t="ekr.20180519070854.126"><vh>_get_message</vh></v>
</v>
<v t="ekr.20180519070854.127"><vh>class _ExpectIndentedBlock</vh>
<v t="ekr.20180519070854.128"><vh>get_node</vh></v>
<v t="ekr.20180519070854.129"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.130"><vh>class ErrorFinderConfig</vh></v>
<v t="ekr.20180519070854.131"><vh>class SyntaxRule</vh>
<v t="ekr.20180519070854.132"><vh>_get_message</vh></v>
</v>
<v t="ekr.20180519070854.133"><vh>class _InvalidSyntaxRule</vh>
<v t="ekr.20180519070854.134"><vh>get_node</vh></v>
<v t="ekr.20180519070854.135"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.136"><vh>class _AwaitOutsideAsync</vh>
<v t="ekr.20180519070854.137"><vh>is_issue</vh></v>
<v t="ekr.20180519070854.138"><vh>get_error_node</vh></v>
</v>
<v t="ekr.20180519070854.139"><vh>class _BreakOutsideLoop</vh>
<v t="ekr.20180519070854.140"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.141"><vh>class _ContinueChecks</vh>
<v t="ekr.20180519070854.142"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.143"><vh>class _YieldFromCheck</vh>
<v t="ekr.20180519070854.144"><vh>get_node</vh></v>
<v t="ekr.20180519070854.145"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.146"><vh>class _NameChecks</vh>
<v t="ekr.20180519070854.147"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.148"><vh>class _StringChecks</vh>
<v t="ekr.20180519070854.149"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.150"><vh>class _StarCheck</vh>
<v t="ekr.20180519070854.151"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.152"><vh>class _StarStarCheck</vh>
<v t="ekr.20180519070854.153"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.154"><vh>class _ReturnAndYieldChecks</vh>
<v t="ekr.20180519070854.155"><vh>get_node</vh></v>
<v t="ekr.20180519070854.156"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.157"><vh>class _BytesAndStringMix</vh>
<v t="ekr.20180519070854.158"><vh>_is_bytes_literal</vh></v>
<v t="ekr.20180519070854.159"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.160"><vh>class _TrailingImportComma</vh>
<v t="ekr.20180519070854.161"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.162"><vh>class _ImportStarInFunction</vh>
<v t="ekr.20180519070854.163"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.164"><vh>class _FutureImportRule</vh>
<v t="ekr.20180519070854.165"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.166"><vh>class _StarExprRule</vh>
<v t="ekr.20180519070854.167"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.168"><vh>class _StarExprParentRule</vh>
<v t="ekr.20180519070854.169"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.170"><vh>class _AnnotatorRule</vh>
<v t="ekr.20180519070854.171"><vh>get_node</vh></v>
<v t="ekr.20180519070854.172"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.173"><vh>class _ArgumentRule</vh>
<v t="ekr.20180519070854.174"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.175"><vh>class _NonlocalModuleLevelRule</vh>
<v t="ekr.20180519070854.176"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.177"><vh>class _ArglistRule</vh>
<v t="ekr.20180519070854.178"><vh>message</vh></v>
<v t="ekr.20180519070854.179"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.180"><vh>class _ParameterRule</vh>
<v t="ekr.20180519070854.181"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.182"><vh>class _TryStmtRule</vh>
<v t="ekr.20180519070854.183"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.184"><vh>class _FStringRule</vh>
<v t="ekr.20180519070854.185"><vh>_check_format_spec</vh></v>
<v t="ekr.20180519070854.186"><vh>_check_fstring_expr</vh></v>
<v t="ekr.20180519070854.187"><vh>is_issue</vh></v>
<v t="ekr.20180519070854.188"><vh>_check_fstring_contents</vh></v>
</v>
<v t="ekr.20180519070854.189"><vh>class _CheckAssignmentRule</vh>
<v t="ekr.20180519070854.190"><vh>_check_assignment</vh></v>
</v>
<v t="ekr.20180519070854.191"><vh>class _CompForRule</vh>
<v t="ekr.20180519070854.192"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.193"><vh>class _ExprStmtRule</vh>
<v t="ekr.20180519070854.194"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.195"><vh>class _WithItemRule</vh>
<v t="ekr.20180519070854.196"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.197"><vh>class _DelStmtRule</vh>
<v t="ekr.20180519070854.198"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.199"><vh>class _ExprListRule</vh>
<v t="ekr.20180519070854.200"><vh>is_issue</vh></v>
</v>
<v t="ekr.20180519070854.201"><vh>class _ForStmtRule</vh>
<v t="ekr.20180519070854.202"><vh>is_issue</vh></v>
</v>
</v>
<v t="ekr.20180519070854.203"><vh>@clean parser.py</vh>
<v t="ekr.20180519070854.204"><vh>Declarations</vh></v>
<v t="ekr.20180519070854.205"><vh>class Parser</vh>
<v t="ekr.20180519070854.206"><vh>__init__</vh></v>
<v t="ekr.20180519070854.207"><vh>parse</vh></v>
<v t="ekr.20180519070854.208"><vh>convert_node</vh></v>
<v t="ekr.20180519070854.209"><vh>convert_leaf</vh></v>
<v t="ekr.20180519070854.210"><vh>error_recovery</vh></v>
<v t="ekr.20180519070854.211"><vh>_stack_removal</vh></v>
<v t="ekr.20180519070854.212"><vh>_recovery_tokenize</vh></v>
</v>
</v>
<v t="ekr.20180519070854.213"><vh>@clean pep8.py</vh>
<v t="ekr.20180519070854.214"><vh>Declarations</vh></v>
<v t="ekr.20180519070854.215"><vh>class IndentationTypes</vh></v>
<v t="ekr.20180519070854.216"><vh>class IndentationNode</vh>
<v t="ekr.20180519070854.217"><vh>__init__</vh></v>
<v t="ekr.20180519070854.218"><vh>__repr__</vh></v>
<v t="ekr.20180519070854.219"><vh>get_latest_suite_node</vh></v>
</v>
<v t="ekr.20180519070854.220"><vh>class BracketNode</vh>
<v t="ekr.20180519070854.221"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519070854.222"><vh>class ImplicitNode</vh>
<v t="ekr.20180519070854.223"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519070854.224"><vh>class BackslashNode</vh>
<v t="ekr.20180519070854.225"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519070854.226"><vh>_is_magic_name</vh></v>
<v t="ekr.20180519070854.227"><vh>class PEP8Normalizer</vh>
<v t="ekr.20180519070854.228"><vh>__init__</vh></v>
<v t="ekr.20180519070854.229"><vh>visit_node</vh></v>
<v t="ekr.20180519070854.230"><vh>_visit_node</vh></v>
<v t="ekr.20180519070854.231"><vh>_check_tabs_spaces</vh></v>
<v t="ekr.20180519070854.232"><vh>_get_wanted_blank_lines_count</vh></v>
<v t="ekr.20180519070854.233"><vh>_reset_newlines</vh></v>
<v t="ekr.20180519070854.234"><vh>visit_leaf</vh></v>
<v t="ekr.20180519070854.235"><vh>_visit_part</vh></v>
<v t="ekr.20180519070854.236"><vh>_check_line_length</vh></v>
<v t="ekr.20180519070854.237"><vh>_check_spacing</vh></v>
<v t="ekr.20180519070854.238"><vh>_analyse_non_prefix</vh></v>
<v t="ekr.20180519070854.239"><vh>add_issue</vh></v>
</v>
<v t="ekr.20180519070854.240"><vh>class PEP8NormalizerConfig</vh>
<v t="ekr.20180519070854.241"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519070854.242"><vh>class BlankLineAtEnd</vh>
<v t="ekr.20180519070854.243"><vh>is_issue</vh></v>
</v>
</v>
<v t="ekr.20180519070854.244"><vh>@clean prefix.py</vh>
<v t="ekr.20180519070854.245"><vh>Declarations</vh></v>
<v t="ekr.20180519070854.246"><vh>class PrefixPart</vh>
<v t="ekr.20180519070854.247"><vh>__init__</vh></v>
<v t="ekr.20180519070854.248"><vh>end_pos</vh></v>
<v t="ekr.20180519070854.249"><vh>create_spacing_part</vh></v>
<v t="ekr.20180519070854.250"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519070854.251"><vh>split_prefix</vh></v>
</v>
<v t="ekr.20180519070854.252"><vh>@@clean token.py</vh>
<v t="ekr.20180519070854.253"><vh>Declarations</vh></v>
<v t="ekr.20180519070854.254"><vh>generate_token_id</vh></v>
</v>
<v t="ekr.20180519070854.255"><vh>@clean tokenize.py</vh>
<v t="ekr.20180519070854.256"><vh>Declarations</vh></v>
<v t="ekr.20180519070854.257"><vh>group</vh></v>
<v t="ekr.20180519070854.258"><vh>maybe</vh></v>
<v t="ekr.20180519070854.259"><vh>_all_string_prefixes</vh></v>
<v t="ekr.20180519070854.260"><vh>_compile</vh></v>
<v t="ekr.20180519070854.261"><vh>_get_token_collection</vh></v>
<v t="ekr.20180519070854.262"><vh>_create_token_collection</vh></v>
<v t="ekr.20180519070854.263"><vh>class Token</vh>
<v t="ekr.20180519070854.264"><vh>end_pos</vh></v>
</v>
<v t="ekr.20180519070854.265"><vh>class PythonToken</vh>
<v t="ekr.20180519070854.266"><vh>_get_type_name</vh></v>
<v t="ekr.20180519070854.267"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519070854.268"><vh>class FStringNode</vh>
<v t="ekr.20180519070854.269"><vh>__init__</vh></v>
<v t="ekr.20180519070854.270"><vh>open_parentheses</vh></v>
<v t="ekr.20180519070854.271"><vh>close_parentheses</vh></v>
<v t="ekr.20180519070854.272"><vh>allow_multiline</vh></v>
<v t="ekr.20180519070854.273"><vh>is_in_expr</vh></v>
</v>
<v t="ekr.20180519070854.274"><vh>_check_fstring_ending</vh></v>
<v t="ekr.20180519070854.275"><vh>_find_fstring_string</vh></v>
<v t="ekr.20180519070854.276"><vh>tokenize</vh></v>
<v t="ekr.20180519070854.277"><vh>_print_tokens</vh></v>
<v t="ekr.20180519070854.278"><vh>tokenize_lines</vh></v>
</v>
<v t="ekr.20180519070854.279"><vh>@clean tree.py</vh>
<v t="ekr.20180519070854.280"><vh>Declarations</vh></v>
<v t="ekr.20180519070854.281"><vh>class DocstringMixin</vh>
<v t="ekr.20180519070854.282"><vh>get_doc_node</vh></v>
</v>
<v t="ekr.20180519070854.283"><vh>class PythonMixin</vh>
<v t="ekr.20180519070854.284"><vh>get_name_of_position</vh></v>
</v>
<v t="ekr.20180519070854.285"><vh>class PythonLeaf</vh>
<v t="ekr.20180519070854.286"><vh>_split_prefix</vh></v>
<v t="ekr.20180519070854.287"><vh>get_start_pos_of_prefix</vh></v>
</v>
<v t="ekr.20180519070854.288"><vh>class _LeafWithoutNewlines</vh>
<v t="ekr.20180519070854.289"><vh>end_pos</vh></v>
</v>
<v t="ekr.20180519070854.290"><vh>class PythonBaseNode</vh></v>
<v t="ekr.20180519070854.291"><vh>class PythonNode</vh></v>
<v t="ekr.20180519070854.292"><vh>class PythonErrorNode</vh></v>
<v t="ekr.20180519070854.293"><vh>class PythonErrorLeaf</vh></v>
<v t="ekr.20180519070854.294"><vh>class EndMarker</vh></v>
<v t="ekr.20180519070854.295"><vh>class Newline</vh>
<v t="ekr.20180519070854.296"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519070854.297"><vh>class Name</vh>
<v t="ekr.20180519070854.298"><vh>__repr__</vh></v>
<v t="ekr.20180519070854.299"><vh>is_definition</vh></v>
<v t="ekr.20180519070854.300"><vh>get_definition</vh></v>
</v>
<v t="ekr.20180519070854.301"><vh>class Literal</vh></v>
<v t="ekr.20180519070854.302"><vh>class Number</vh></v>
<v t="ekr.20180519070854.303"><vh>class String</vh>
<v t="ekr.20180519070854.304"><vh>string_prefix</vh></v>
<v t="ekr.20180519070854.305"><vh>_get_payload</vh></v>
</v>
<v t="ekr.20180519070854.306"><vh>class FStringString</vh></v>
<v t="ekr.20180519070854.307"><vh>class FStringStart</vh></v>
<v t="ekr.20180519070854.308"><vh>class FStringEnd</vh></v>
<v t="ekr.20180519070854.309"><vh>class _StringComparisonMixin</vh>
<v t="ekr.20180519070854.310"><vh>__eq__</vh></v>
<v t="ekr.20180519070854.311"><vh>__ne__</vh></v>
<v t="ekr.20180519070854.312"><vh>__hash__</vh></v>
</v>
<v t="ekr.20180519070854.313"><vh>class Operator</vh></v>
<v t="ekr.20180519070854.314"><vh>class Keyword</vh></v>
<v t="ekr.20180519070854.315"><vh>class Scope</vh>
<v t="ekr.20180519070854.316"><vh>__init__</vh></v>
<v t="ekr.20180519070854.317"><vh>iter_funcdefs</vh></v>
<v t="ekr.20180519070854.318"><vh>iter_classdefs</vh></v>
<v t="ekr.20180519070854.319"><vh>iter_imports</vh></v>
<v t="ekr.20180519070854.320"><vh>_search_in_scope</vh></v>
<v t="ekr.20180519070854.321"><vh>get_suite</vh></v>
<v t="ekr.20180519070854.322"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519070854.323"><vh>class Module</vh>
<v t="ekr.20180519070854.324"><vh>__init__</vh></v>
<v t="ekr.20180519070854.325"><vh>_iter_future_import_names</vh></v>
<v t="ekr.20180519070854.326"><vh>_has_explicit_absolute_import</vh></v>
<v t="ekr.20180519070854.327"><vh>get_used_names</vh></v>
</v>
<v t="ekr.20180519070854.328"><vh>class Decorator</vh></v>
<v t="ekr.20180519070854.329"><vh>class ClassOrFunc</vh>
<v t="ekr.20180519070854.330"><vh>name</vh></v>
<v t="ekr.20180519070854.331"><vh>get_decorators</vh></v>
</v>
<v t="ekr.20180519070854.332"><vh>class Class</vh>
<v t="ekr.20180519070854.333"><vh>__init__</vh></v>
<v t="ekr.20180519070854.334"><vh>get_super_arglist</vh></v>
</v>
<v t="ekr.20180519070854.335"><vh>_create_params</vh></v>
<v t="ekr.20180519070854.336"><vh>class Function</vh>
<v t="ekr.20180519070854.337"><vh>__init__</vh></v>
<v t="ekr.20180519070854.338"><vh>_get_param_nodes</vh></v>
<v t="ekr.20180519070854.339"><vh>get_params</vh></v>
<v t="ekr.20180519070854.340"><vh>name</vh></v>
<v t="ekr.20180519070854.341"><vh>iter_yield_exprs</vh></v>
<v t="ekr.20180519070854.342"><vh>iter_return_stmts</vh></v>
<v t="ekr.20180519070854.343"><vh>iter_raise_stmts</vh></v>
<v t="ekr.20180519070854.344"><vh>is_generator</vh></v>
<v t="ekr.20180519070854.345"><vh>annotation</vh></v>
</v>
<v t="ekr.20180519070854.346"><vh>class Lambda</vh>
<v t="ekr.20180519070854.347"><vh>__init__</vh></v>
<v t="ekr.20180519070854.348"><vh>name</vh></v>
<v t="ekr.20180519070854.349"><vh>_get_param_nodes</vh></v>
<v t="ekr.20180519070854.350"><vh>annotation</vh></v>
<v t="ekr.20180519070854.351"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519070854.352"><vh>class Flow</vh></v>
<v t="ekr.20180519070854.353"><vh>class IfStmt</vh>
<v t="ekr.20180519070854.354"><vh>get_test_nodes</vh></v>
<v t="ekr.20180519070854.355"><vh>get_corresponding_test_node</vh></v>
<v t="ekr.20180519070854.356"><vh>is_node_after_else</vh></v>
</v>
<v t="ekr.20180519070854.357"><vh>class WhileStmt</vh></v>
<v t="ekr.20180519070854.358"><vh>class ForStmt</vh>
<v t="ekr.20180519070854.359"><vh>get_testlist</vh></v>
<v t="ekr.20180519070854.360"><vh>get_defined_names</vh></v>
</v>
<v t="ekr.20180519070854.361"><vh>class TryStmt</vh>
<v t="ekr.20180519070854.362"><vh>get_except_clause_tests</vh></v>
</v>
<v t="ekr.20180519070854.363"><vh>class WithStmt</vh>
<v t="ekr.20180519070854.364"><vh>get_defined_names</vh></v>
<v t="ekr.20180519070854.365"><vh>get_test_node_from_name</vh></v>
</v>
<v t="ekr.20180519070854.366"><vh>class Import</vh>
<v t="ekr.20180519070854.367"><vh>get_path_for_name</vh></v>
<v t="ekr.20180519070854.368"><vh>is_nested</vh></v>
<v t="ekr.20180519070854.369"><vh>is_star_import</vh></v>
</v>
<v t="ekr.20180519070854.370"><vh>class ImportFrom</vh>
<v t="ekr.20180519070854.371"><vh>get_defined_names</vh></v>
<v t="ekr.20180519070854.372"><vh>_aliases</vh></v>
<v t="ekr.20180519070854.373"><vh>get_from_names</vh></v>
<v t="ekr.20180519070854.374"><vh>level</vh></v>
<v t="ekr.20180519070854.375"><vh>_as_name_tuples</vh></v>
<v t="ekr.20180519070854.376"><vh>get_paths</vh></v>
</v>
<v t="ekr.20180519070854.377"><vh>class ImportName</vh>
<v t="ekr.20180519070854.378"><vh>get_defined_names</vh></v>
<v t="ekr.20180519070854.379"><vh>level</vh></v>
<v t="ekr.20180519070854.380"><vh>get_paths</vh></v>
<v t="ekr.20180519070854.381"><vh>_dotted_as_names</vh></v>
<v t="ekr.20180519070854.382"><vh>is_nested</vh></v>
<v t="ekr.20180519070854.383"><vh>_aliases</vh></v>
</v>
<v t="ekr.20180519070854.384"><vh>class KeywordStatement</vh>
<v t="ekr.20180519070854.385"><vh>type</vh></v>
<v t="ekr.20180519070854.386"><vh>keyword</vh></v>
</v>
<v t="ekr.20180519070854.387"><vh>class AssertStmt</vh>
<v t="ekr.20180519070854.388"><vh>assertion</vh></v>
</v>
<v t="ekr.20180519070854.389"><vh>class GlobalStmt</vh>
<v t="ekr.20180519070854.390"><vh>get_global_names</vh></v>
</v>
<v t="ekr.20180519070854.391"><vh>class ReturnStmt</vh></v>
<v t="ekr.20180519070854.392"><vh>class YieldExpr</vh></v>
<v t="ekr.20180519070854.393"><vh>_defined_names</vh></v>
<v t="ekr.20180519070854.394"><vh>class ExprStmt</vh>
<v t="ekr.20180519070854.395"><vh>get_defined_names</vh></v>
<v t="ekr.20180519070854.396"><vh>get_rhs</vh></v>
<v t="ekr.20180519070854.397"><vh>yield_operators</vh></v>
</v>
<v t="ekr.20180519070854.398"><vh>class Param</vh>
<v t="ekr.20180519070854.399"><vh>__init__</vh></v>
<v t="ekr.20180519070854.400"><vh>star_count</vh></v>
<v t="ekr.20180519070854.401"><vh>default</vh></v>
<v t="ekr.20180519070854.402"><vh>annotation</vh></v>
<v t="ekr.20180519070854.403"><vh>_tfpdef</vh></v>
<v t="ekr.20180519070854.404"><vh>name</vh></v>
<v t="ekr.20180519070854.405"><vh>get_defined_names</vh></v>
<v t="ekr.20180519070854.406"><vh>position_index</vh></v>
<v t="ekr.20180519070854.407"><vh>get_parent_function</vh></v>
<v t="ekr.20180519070854.408"><vh>get_code</vh></v>
<v t="ekr.20180519070854.409"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519070854.410"><vh>class CompFor</vh>
<v t="ekr.20180519070854.411"><vh>get_defined_names</vh></v>
</v>
</v>
<v t="ekr.20180519070854.412"><vh>@clean __init__.py</vh></v>
</v>
</v>
<v t="ekr.20180519065720.2"><vh>@path C:/Anaconda3/Lib/site-packages/jedi</vh>
<v t="ekr.20180519065720.3"><vh>@clean cache.py</vh>
<v t="ekr.20180519065720.4"><vh>Declarations (jedi.cache.py)</vh></v>
<v t="ekr.20180519065720.5"><vh>underscore_memoization</vh></v>
<v t="ekr.20180519065720.6"><vh>clear_time_caches</vh></v>
<v t="ekr.20180519065720.7"><vh>call_signature_time_cache</vh></v>
<v t="ekr.20180519065720.8"><vh>time_cache</vh></v>
<v t="ekr.20180519065720.9"><vh>memoize_method</vh></v>
</v>
<v t="ekr.20180519065720.10"><vh>@clean debug.py</vh>
<v t="ekr.20180519065720.11"><vh>Declarations</vh></v>
<v t="ekr.20180519065720.12"><vh>_lazy_colorama_init</vh></v>
<v t="ekr.20180519065720.13"><vh>reset_time</vh></v>
<v t="ekr.20180519065720.14"><vh>increase_indent</vh></v>
<v t="ekr.20180519065720.15"><vh>dbg</vh></v>
<v t="ekr.20180519065720.16"><vh>warning</vh></v>
<v t="ekr.20180519065720.17"><vh>speed</vh></v>
<v t="ekr.20180519065720.18"><vh>print_to_stdout</vh></v>
</v>
<v t="ekr.20180519065720.19"><vh>@clean parser_utils.py</vh>
<v t="ekr.20180519065720.20"><vh>Declarations (jedi.parser_utils.py)</vh></v>
<v t="ekr.20180519065720.21"><vh>get_executable_nodes</vh></v>
<v t="ekr.20180519065720.22"><vh>get_comp_fors</vh></v>
<v t="ekr.20180519065720.23"><vh>for_stmt_defines_one_name</vh></v>
<v t="ekr.20180519065720.24"><vh>get_flow_branch_keyword</vh></v>
<v t="ekr.20180519065720.25"><vh>get_statement_of_position</vh></v>
<v t="ekr.20180519065720.26"><vh>clean_scope_docstring</vh></v>
<v t="ekr.20180519065720.27"><vh>safe_literal_eval</vh></v>
<v t="ekr.20180519065720.28"><vh>get_call_signature</vh></v>
<v t="ekr.20180519065720.29"><vh>get_doc_with_call_signature</vh></v>
<v t="ekr.20180519065720.30"><vh>move</vh></v>
<v t="ekr.20180519065720.31"><vh>get_following_comment_same_line</vh></v>
<v t="ekr.20180519065720.32"><vh>is_scope</vh></v>
<v t="ekr.20180519065720.33"><vh>get_parent_scope</vh></v>
<v t="ekr.20180519065720.34"><vh>get_cached_code_lines</vh></v>
</v>
<v t="ekr.20180519065720.35"><vh>@clean refactoring.py</vh>
<v t="ekr.20180519065720.36"><vh>Declarations</vh></v>
<v t="ekr.20180519065720.37"><vh>class Refactoring</vh>
<v t="ekr.20180519065720.38"><vh>__init__</vh></v>
<v t="ekr.20180519065720.39"><vh>old_files</vh></v>
<v t="ekr.20180519065720.40"><vh>new_files</vh></v>
<v t="ekr.20180519065720.41"><vh>diff</vh></v>
</v>
<v t="ekr.20180519065720.42"><vh>rename</vh></v>
<v t="ekr.20180519065720.43"><vh>_rename</vh></v>
<v t="ekr.20180519065720.44"><vh>extract</vh></v>
<v t="ekr.20180519065720.45"><vh>inline</vh></v>
</v>
<v t="ekr.20180519065720.46"><vh>@clean settings.py</vh>
<v t="ekr.20180519065720.47"><vh>Declarations</vh></v>
</v>
<v t="ekr.20180519065720.48"><vh>@clean utils.py</vh>
<v t="ekr.20180519065720.49"><vh>Declarations</vh></v>
<v t="ekr.20180519065720.50"><vh>setup_readline</vh></v>
<v t="ekr.20180519065720.51"><vh>version_info</vh></v>
</v>
<v t="ekr.20180519065720.52"><vh>@clean _compatibility.py</vh>
<v t="ekr.20180519065720.53"><vh>Declarations</vh></v>
<v t="ekr.20180519065720.54"><vh>class DummyFile</vh>
<v t="ekr.20180519065720.55"><vh>__init__</vh></v>
<v t="ekr.20180519065720.56"><vh>read</vh></v>
<v t="ekr.20180519065720.57"><vh>close</vh></v>
</v>
<v t="ekr.20180519065720.58"><vh>find_module_py34</vh></v>
<v t="ekr.20180519065720.59"><vh>find_module_py33</vh></v>
<v t="ekr.20180519065720.60"><vh>find_module_pre_py33</vh></v>
<v t="ekr.20180519065720.61"><vh>_iter_modules</vh></v>
<v t="ekr.20180519065720.62"><vh>class ImplicitNSInfo</vh>
<v t="ekr.20180519065720.63"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519065720.64"><vh>class Python3Method</vh>
<v t="ekr.20180519065720.65"><vh>__init__</vh></v>
<v t="ekr.20180519065720.66"><vh>__get__</vh></v>
</v>
<v t="ekr.20180519065720.67"><vh>use_metaclass</vh></v>
<v t="ekr.20180519065720.68"><vh>u</vh></v>
<v t="ekr.20180519065720.69"><vh>cast_path</vh></v>
<v t="ekr.20180519065720.70"><vh>force_unicode</vh></v>
<v t="ekr.20180519065720.71"><vh>literal_eval</vh></v>
<v t="ekr.20180519065720.72"><vh>no_unicode_pprint</vh></v>
<v t="ekr.20180519065720.73"><vh>print_to_stderr</vh></v>
<v t="ekr.20180519065720.74"><vh>utf8_repr</vh></v>
<v t="ekr.20180519065720.75"><vh>pickle_load</vh></v>
<v t="ekr.20180519065720.76"><vh>pickle_dump</vh></v>
<v t="ekr.20180519065720.77"><vh>class GeneralizedPopen</vh>
<v t="ekr.20180519065720.78"><vh>__init__</vh></v>
</v>
</v>
<v t="ekr.20180519065720.79"><vh>@clean __init__.py</vh>
<v t="ekr.20180519065720.80"><vh>Declarations</vh></v>
</v>
<v t="ekr.20180519065720.81"><vh>@clean __main__.py</vh>
<v t="ekr.20180519065720.82"><vh>Declarations</vh></v>
<v t="ekr.20180519065720.83"><vh>_start_linter</vh></v>
</v>
<v t="ekr.20180519065720.84"><vh>@path .git</vh>
<v t="ekr.20180519065720.87"><vh>@path logs</vh>
<v t="ekr.20180519065720.88"><vh>@path refs</vh></v>
</v>
<v t="ekr.20180519065720.90"><vh>@path objects</vh></v>
<v t="ekr.20180519065721.32"><vh>@path refs</vh></v>
</v>
<v t="ekr.20180519065721.35"><vh>@path api</vh>
<v t="ekr.20180519065721.36"><vh>@clean classes.py</vh>
<v t="ekr.20180519065721.37"><vh>Declarations</vh></v>
<v t="ekr.20180519065721.38"><vh>_sort_names_by_start_pos</vh></v>
<v t="ekr.20180519065721.39"><vh>defined_names</vh></v>
<v t="ekr.20180519065721.40"><vh>class BaseDefinition</vh>
<v t="ekr.20180519065721.41"><vh>__init__</vh></v>
<v t="ekr.20180519065721.42"><vh>name</vh></v>
<v t="ekr.20180519065721.43"><vh>type</vh></v>
<v t="ekr.20180519065721.44"><vh>_path</vh></v>
<v t="ekr.20180519065721.45"><vh>module_name</vh></v>
<v t="ekr.20180519065721.46"><vh>in_builtin_module</vh></v>
<v t="ekr.20180519065721.47"><vh>line</vh></v>
<v t="ekr.20180519065721.48"><vh>column</vh></v>
<v t="ekr.20180519065721.49"><vh>docstring</vh></v>
<v t="ekr.20180519065721.50"><vh>description</vh></v>
<v t="ekr.20180519065721.51"><vh>full_name</vh></v>
<v t="ekr.20180519065721.52"><vh>goto_assignments</vh></v>
<v t="ekr.20180519065721.53"><vh>_goto_definitions</vh></v>
<v t="ekr.20180519065721.54"><vh>params</vh></v>
<v t="ekr.20180519065721.55"><vh>parent</vh></v>
<v t="ekr.20180519065721.56"><vh>__repr__</vh></v>
<v t="ekr.20180519065721.57"><vh>get_line_code</vh></v>
</v>
<v t="ekr.20180519065721.58"><vh>class Completion</vh>
<v t="ekr.20180519065721.59"><vh>__init__</vh></v>
<v t="ekr.20180519065721.60"><vh>_complete</vh></v>
<v t="ekr.20180519065721.61"><vh>complete</vh></v>
<v t="ekr.20180519065721.62"><vh>name_with_symbols</vh></v>
<v t="ekr.20180519065721.63"><vh>docstring</vh></v>
<v t="ekr.20180519065721.64"><vh>description</vh></v>
<v t="ekr.20180519065721.65"><vh>__repr__</vh></v>
<v t="ekr.20180519065721.66"><vh>follow_definition</vh></v>
</v>
<v t="ekr.20180519065721.67"><vh>class Definition</vh>
<v t="ekr.20180519065721.68"><vh>__init__</vh></v>
<v t="ekr.20180519065721.69"><vh>description</vh></v>
<v t="ekr.20180519065721.70"><vh>desc_with_module</vh></v>
<v t="ekr.20180519065721.71"><vh>defined_names</vh></v>
<v t="ekr.20180519065721.72"><vh>is_definition</vh></v>
<v t="ekr.20180519065721.73"><vh>__eq__</vh></v>
<v t="ekr.20180519065721.74"><vh>__ne__</vh></v>
<v t="ekr.20180519065721.75"><vh>__hash__</vh></v>
</v>
<v t="ekr.20180519065721.76"><vh>class CallSignature</vh>
<v t="ekr.20180519065721.77"><vh>__init__</vh></v>
<v t="ekr.20180519065721.78"><vh>index</vh></v>
<v t="ekr.20180519065721.79"><vh>bracket_start</vh></v>
<v t="ekr.20180519065721.80"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519065721.81"><vh>class _Help</vh>
<v t="ekr.20180519065721.82"><vh>__init__</vh></v>
<v t="ekr.20180519065721.83"><vh>_get_contexts</vh></v>
<v t="ekr.20180519065721.84"><vh>docstring</vh></v>
</v>
</v>
<v t="ekr.20180519065721.85"><vh>@clean completion.py</vh>
<v t="ekr.20180519065721.86"><vh>Declarations</vh></v>
<v t="ekr.20180519065721.87"><vh>get_call_signature_param_names</vh></v>
<v t="ekr.20180519065721.88"><vh>filter_names</vh></v>
<v t="ekr.20180519065721.89"><vh>get_user_scope</vh></v>
<v t="ekr.20180519065721.90"><vh>get_flow_scope_node</vh></v>
<v t="ekr.20180519065721.91"><vh>class Completion</vh>
<v t="ekr.20180519065721.92"><vh>__init__</vh></v>
<v t="ekr.20180519065721.93"><vh>completions</vh></v>
<v t="ekr.20180519065721.94"><vh>_get_context_completions</vh></v>
<v t="ekr.20180519065721.95"><vh>_get_keyword_completion_names</vh></v>
<v t="ekr.20180519065721.96"><vh>_global_completions</vh></v>
<v t="ekr.20180519065721.97"><vh>_trailer_completions</vh></v>
<v t="ekr.20180519065721.98"><vh>_parse_dotted_names</vh></v>
<v t="ekr.20180519065721.99"><vh>_get_importer_names</vh></v>
<v t="ekr.20180519065721.100"><vh>_get_class_context_completions</vh></v>
</v>
</v>
<v t="ekr.20180519065721.101"><vh>@clean environment.py</vh>
<v t="ekr.20180519065721.102"><vh>Declarations</vh></v>
<v t="ekr.20180519065721.103"><vh>class InvalidPythonEnvironment</vh></v>
<v t="ekr.20180519065721.104"><vh>class _BaseEnvironment</vh>
<v t="ekr.20180519065721.105"><vh>get_grammar</vh></v>
<v t="ekr.20180519065721.106"><vh>_sha256</vh></v>
</v>
<v t="ekr.20180519065721.107"><vh>class Environment</vh>
<v t="ekr.20180519065721.108"><vh>__init__</vh></v>
<v t="ekr.20180519065721.109"><vh>_get_version</vh></v>
<v t="ekr.20180519065721.110"><vh>__repr__</vh></v>
<v t="ekr.20180519065721.111"><vh>get_evaluator_subprocess</vh></v>
<v t="ekr.20180519065721.112"><vh>_get_subprocess</vh></v>
<v t="ekr.20180519065721.113"><vh>get_sys_path</vh></v>
</v>
<v t="ekr.20180519065721.114"><vh>class SameEnvironment</vh>
<v t="ekr.20180519065721.115"><vh>__init__</vh></v>
<v t="ekr.20180519065721.116"><vh>_get_version</vh></v>
</v>
<v t="ekr.20180519065721.117"><vh>class InterpreterEnvironment</vh>
<v t="ekr.20180519065721.118"><vh>__init__</vh></v>
<v t="ekr.20180519065721.119"><vh>get_evaluator_subprocess</vh></v>
<v t="ekr.20180519065721.120"><vh>get_sys_path</vh></v>
</v>
<v t="ekr.20180519065721.121"><vh>_get_virtual_env_from_var</vh></v>
<v t="ekr.20180519065721.122"><vh>_calculate_sha256_for_file</vh></v>
<v t="ekr.20180519065721.123"><vh>get_default_environment</vh></v>
<v t="ekr.20180519065721.124"><vh>get_cached_default_environment</vh></v>
<v t="ekr.20180519065721.125"><vh>find_virtualenvs</vh></v>
<v t="ekr.20180519065721.126"><vh>find_system_environments</vh></v>
<v t="ekr.20180519065721.127"><vh>_get_python_prefix</vh></v>
<v t="ekr.20180519065721.128"><vh>get_system_environment</vh></v>
<v t="ekr.20180519065721.129"><vh>create_environment</vh></v>
<v t="ekr.20180519065721.130"><vh>_get_executable_path</vh></v>
<v t="ekr.20180519065721.131"><vh>_get_executables_from_windows_registry</vh></v>
<v t="ekr.20180519065721.132"><vh>_is_safe</vh></v>
<v t="ekr.20180519065721.133"><vh>_is_unix_safe_simple</vh></v>
<v t="ekr.20180519065721.134"><vh>_is_unix_admin</vh></v>
</v>
<v t="ekr.20180519065721.135"><vh>@clean exceptions.py</vh>
<v t="ekr.20180519065721.136"><vh>class _JediError</vh></v>
<v t="ekr.20180519065721.137"><vh>class InternalError</vh></v>
<v t="ekr.20180519065721.138"><vh>class WrongVersion</vh></v>
</v>
<v t="ekr.20180519065721.139"><vh>@clean helpers.py</vh>
<v t="ekr.20180519065721.140"><vh>Declarations</vh></v>
<v t="ekr.20180519065721.141"><vh>sorted_definitions</vh></v>
<v t="ekr.20180519065721.142"><vh>get_on_completion_name</vh></v>
<v t="ekr.20180519065721.143"><vh>_get_code</vh></v>
<v t="ekr.20180519065721.144"><vh>class OnErrorLeaf</vh>
<v t="ekr.20180519065721.145"><vh>error_leaf</vh></v>
</v>
<v t="ekr.20180519065721.146"><vh>_get_code_for_stack</vh></v>
<v t="ekr.20180519065721.147"><vh>get_stack_at_position</vh></v>
<v t="ekr.20180519065721.148"><vh>class Stack</vh>
<v t="ekr.20180519065721.149"><vh>get_node_names</vh></v>
<v t="ekr.20180519065721.150"><vh>get_nodes</vh></v>
</v>
<v t="ekr.20180519065721.151"><vh>get_possible_completion_types</vh></v>
<v t="ekr.20180519065721.152"><vh>evaluate_goto_definition</vh></v>
<v t="ekr.20180519065721.153"><vh>_get_index_and_key</vh></v>
<v t="ekr.20180519065721.154"><vh>_get_call_signature_details_from_error_node</vh></v>
<v t="ekr.20180519065721.155"><vh>get_call_signature_details</vh></v>
<v t="ekr.20180519065721.156"><vh>cache_call_signatures</vh></v>
</v>
<v t="ekr.20180519065721.157"><vh>@clean interpreter.py</vh>
<v t="ekr.20180519065721.158"><vh>Declarations</vh></v>
<v t="ekr.20180519065721.159"><vh>_create</vh></v>
<v t="ekr.20180519065721.160"><vh>class NamespaceObject</vh>
<v t="ekr.20180519065721.161"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519065721.162"><vh>class MixedModuleContext</vh>
<v t="ekr.20180519065721.163"><vh>__init__</vh></v>
<v t="ekr.20180519065721.164"><vh>get_node</vh></v>
<v t="ekr.20180519065721.165"><vh>get_filters</vh></v>
<v t="ekr.20180519065721.166"><vh>code_lines</vh></v>
<v t="ekr.20180519065721.167"><vh>__getattr__</vh></v>
</v>
</v>
<v t="ekr.20180519065721.168"><vh>@clean keywords.py</vh>
<v t="ekr.20180519065721.169"><vh>Declarations</vh></v>
<v t="ekr.20180519065721.170"><vh>get_operator</vh></v>
<v t="ekr.20180519065721.171"><vh>class KeywordName</vh>
<v t="ekr.20180519065721.172"><vh>__init__</vh></v>
<v t="ekr.20180519065721.173"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065721.174"><vh>class Keyword</vh>
<v t="ekr.20180519065721.175"><vh>__init__</vh></v>
<v t="ekr.20180519065721.176"><vh>names</vh></v>
<v t="ekr.20180519065721.177"><vh>py__doc__</vh></v>
<v t="ekr.20180519065721.178"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519065721.179"><vh>imitate_pydoc</vh></v>
</v>
<v t="ekr.20180519065721.180"><vh>@clean project.py</vh>
<v t="ekr.20180519065721.181"><vh>Declarations</vh></v>
<v t="ekr.20180519065721.182"><vh>_remove_duplicates_from_path</vh></v>
<v t="ekr.20180519065721.183"><vh>_force_unicode_list</vh></v>
<v t="ekr.20180519065721.184"><vh>class Project</vh>
<v t="ekr.20180519065721.185"><vh>_get_json_path</vh></v>
<v t="ekr.20180519065721.186"><vh>load</vh></v>
<v t="ekr.20180519065721.187"><vh>__init__</vh></v>
<v t="ekr.20180519065721.188"><vh>_get_base_sys_path</vh></v>
<v t="ekr.20180519065721.189"><vh>_get_sys_path</vh></v>
<v t="ekr.20180519065721.190"><vh>save</vh></v>
<v t="ekr.20180519065721.191"><vh>get_environment</vh></v>
<v t="ekr.20180519065721.192"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519065721.193"><vh>_is_potential_project</vh></v>
<v t="ekr.20180519065721.194"><vh>_is_django_path</vh></v>
<v t="ekr.20180519065721.195"><vh>get_default_project</vh></v>
</v>
<v t="ekr.20180519065721.196"><vh>@clean replstartup.py</vh>
<v t="ekr.20180519065721.197"><vh>Declarations</vh></v>
</v>
<v t="ekr.20180519065722.1"><vh>@clean __init__.py</vh>
<v t="ekr.20180519065722.2"><vh>Declarations</vh></v>
<v t="ekr.20180519065722.3"><vh>class Script</vh>
<v t="ekr.20180519065722.4"><vh>__init__</vh></v>
<v t="ekr.20180519065722.5"><vh>_get_module</vh></v>
<v t="ekr.20180519065722.6"><vh>__repr__</vh></v>
<v t="ekr.20180519065722.7"><vh>completions</vh></v>
<v t="ekr.20180519065722.8"><vh>goto_definitions</vh></v>
<v t="ekr.20180519065722.9"><vh>goto_assignments</vh></v>
<v t="ekr.20180519065722.10"><vh>usages</vh></v>
<v t="ekr.20180519065722.11"><vh>call_signatures</vh></v>
<v t="ekr.20180519065722.12"><vh>_analysis</vh></v>
</v>
<v t="ekr.20180519065722.13"><vh>class Interpreter</vh>
<v t="ekr.20180519065722.14"><vh>__init__</vh></v>
<v t="ekr.20180519065722.15"><vh>_get_module</vh></v>
</v>
<v t="ekr.20180519065722.16"><vh>names</vh></v>
<v t="ekr.20180519065722.17"><vh>preload_module</vh></v>
<v t="ekr.20180519065722.18"><vh>set_debug_function</vh></v>
</v>
</v>
<v t="ekr.20180519065722.20"><vh>@path common</vh>
<v t="ekr.20180519065722.21"><vh>@clean context.py</vh>
<v t="ekr.20180519065722.22"><vh>class BaseContext</vh>
<v t="ekr.20180519065722.23"><vh>__init__</vh></v>
<v t="ekr.20180519065722.24"><vh>get_root_context</vh></v>
</v>
<v t="ekr.20180519065722.25"><vh>class BaseContextSet</vh>
<v t="ekr.20180519065722.26"><vh>__init__</vh></v>
<v t="ekr.20180519065722.27"><vh>from_iterable</vh></v>
<v t="ekr.20180519065722.28"><vh>from_set</vh></v>
<v t="ekr.20180519065722.29"><vh>from_sets</vh></v>
<v t="ekr.20180519065722.30"><vh>__or__</vh></v>
<v t="ekr.20180519065722.31"><vh>__iter__</vh></v>
<v t="ekr.20180519065722.32"><vh>__bool__</vh></v>
<v t="ekr.20180519065722.33"><vh>__len__</vh></v>
<v t="ekr.20180519065722.34"><vh>__repr__</vh></v>
<v t="ekr.20180519065722.35"><vh>filter</vh></v>
<v t="ekr.20180519065722.36"><vh>__getattr__</vh></v>
</v>
</v>
<v t="ekr.20180519065722.37"><vh>@clean utils.py</vh>
<v t="ekr.20180519065722.38"><vh>Declarations</vh></v>
<v t="ekr.20180519065722.39"><vh>traverse_parents</vh></v>
</v>
<v t="ekr.20180519065722.40"><vh>@clean __init__.py</vh>
<v t="ekr.20180519065722.41"><vh>Declarations</vh></v>
</v>
</v>
<v t="ekr.20180519065722.43"><vh>@path evaluate</vh>
<v t="ekr.20180519065722.44"><vh>@clean analysis.py</vh>
<v t="ekr.20180519065722.45"><vh>Declarations</vh></v>
<v t="ekr.20180519065722.46"><vh>class Error</vh>
<v t="ekr.20180519065722.47"><vh>__init__</vh></v>
<v t="ekr.20180519065722.48"><vh>line</vh></v>
<v t="ekr.20180519065722.49"><vh>column</vh></v>
<v t="ekr.20180519065722.50"><vh>code</vh></v>
<v t="ekr.20180519065722.51"><vh>__unicode__</vh></v>
<v t="ekr.20180519065722.52"><vh>__str__</vh></v>
<v t="ekr.20180519065722.53"><vh>__eq__</vh></v>
<v t="ekr.20180519065722.54"><vh>__ne__</vh></v>
<v t="ekr.20180519065722.55"><vh>__hash__</vh></v>
<v t="ekr.20180519065722.56"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519065722.57"><vh>class Warning</vh></v>
<v t="ekr.20180519065722.58"><vh>add</vh></v>
<v t="ekr.20180519065722.59"><vh>_check_for_setattr</vh></v>
<v t="ekr.20180519065722.60"><vh>add_attribute_error</vh></v>
<v t="ekr.20180519065722.61"><vh>_check_for_exception_catch</vh></v>
</v>
<v t="ekr.20180519065722.62"><vh>@clean arguments.py</vh>
<v t="ekr.20180519065722.63"><vh>Declarations</vh></v>
<v t="ekr.20180519065722.64"><vh>try_iter_content</vh></v>
<v t="ekr.20180519065722.65"><vh>class AbstractArguments</vh>
<v t="ekr.20180519065722.66"><vh>eval_argument_clinic</vh></v>
<v t="ekr.20180519065722.67"><vh>eval_all</vh></v>
<v t="ekr.20180519065722.68"><vh>get_calling_nodes</vh></v>
<v t="ekr.20180519065722.69"><vh>unpack</vh></v>
<v t="ekr.20180519065722.70"><vh>get_params</vh></v>
</v>
<v t="ekr.20180519065722.71"><vh>class AnonymousArguments</vh>
<v t="ekr.20180519065722.72"><vh>get_params</vh></v>
</v>
<v t="ekr.20180519065722.73"><vh>class TreeArguments</vh>
<v t="ekr.20180519065722.74"><vh>__init__</vh></v>
<v t="ekr.20180519065722.75"><vh>_split</vh></v>
<v t="ekr.20180519065722.76"><vh>unpack</vh></v>
<v t="ekr.20180519065722.77"><vh>as_tree_tuple_objects</vh></v>
<v t="ekr.20180519065722.78"><vh>__repr__</vh></v>
<v t="ekr.20180519065722.79"><vh>get_calling_nodes</vh></v>
</v>
<v t="ekr.20180519065722.80"><vh>class ValuesArguments</vh>
<v t="ekr.20180519065722.81"><vh>__init__</vh></v>
<v t="ekr.20180519065722.82"><vh>unpack</vh></v>
<v t="ekr.20180519065722.83"><vh>get_calling_nodes</vh></v>
<v t="ekr.20180519065722.84"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519065722.85"><vh>_iterate_star_args</vh></v>
<v t="ekr.20180519065722.86"><vh>_star_star_dict</vh></v>
</v>
<v t="ekr.20180519065722.87"><vh>@clean base_context.py</vh>
<v t="ekr.20180519065722.88"><vh>Declarations</vh></v>
<v t="ekr.20180519065722.89"><vh>class Context</vh>
<v t="ekr.20180519065722.90"><vh>api_type</vh></v>
<v t="ekr.20180519065722.91"><vh>execute</vh></v>
<v t="ekr.20180519065722.92"><vh>execute_evaluated</vh></v>
<v t="ekr.20180519065722.93"><vh>iterate</vh></v>
<v t="ekr.20180519065722.94"><vh>get_item</vh></v>
<v t="ekr.20180519065722.95"><vh>eval_node</vh></v>
<v t="ekr.20180519065722.96"><vh>create_context</vh></v>
<v t="ekr.20180519065722.97"><vh>is_class</vh></v>
<v t="ekr.20180519065722.98"><vh>py__bool__</vh></v>
<v t="ekr.20180519065722.99"><vh>py__doc__</vh></v>
</v>
<v t="ekr.20180519065722.100"><vh>iterate_contexts</vh></v>
<v t="ekr.20180519065722.101"><vh>class TreeContext</vh>
<v t="ekr.20180519065722.102"><vh>__init__</vh></v>
<v t="ekr.20180519065722.103"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519065722.104"><vh>class ContextualizedNode</vh>
<v t="ekr.20180519065722.105"><vh>__init__</vh></v>
<v t="ekr.20180519065722.106"><vh>get_root_context</vh></v>
<v t="ekr.20180519065722.107"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065722.108"><vh>class ContextualizedName</vh>
<v t="ekr.20180519065722.109"><vh>name</vh></v>
<v t="ekr.20180519065722.110"><vh>assignment_indexes</vh></v>
</v>
<v t="ekr.20180519065722.111"><vh>class ContextSet</vh>
<v t="ekr.20180519065722.112"><vh>py__class__</vh></v>
<v t="ekr.20180519065722.113"><vh>iterate</vh></v>
</v>
<v t="ekr.20180519065722.114"><vh>iterator_to_context_set</vh></v>
</v>
<v t="ekr.20180519065722.115"><vh>@clean cache.py</vh>
<v t="ekr.20180519065722.116"><vh>Declarations</vh></v>
<v t="ekr.20180519065722.117"><vh>_memoize_default</vh></v>
<v t="ekr.20180519065722.118"><vh>evaluator_function_cache</vh></v>
<v t="ekr.20180519065722.119"><vh>evaluator_method_cache</vh></v>
<v t="ekr.20180519065722.120"><vh>evaluator_as_method_param_cache</vh></v>
<v t="ekr.20180519065722.121"><vh>class CachedMetaClass</vh>
<v t="ekr.20180519065722.122"><vh>__call__</vh></v>
</v>
</v>
<v t="ekr.20180519065722.123"><vh>@clean docstrings.py</vh>
<v t="ekr.20180519065722.124"><vh>Declarations</vh></v>
<v t="ekr.20180519065722.125"><vh>_get_numpy_doc_string_cls</vh></v>
<v t="ekr.20180519065722.126"><vh>_search_param_in_numpydocstr</vh></v>
<v t="ekr.20180519065722.127"><vh>_search_return_in_numpydocstr</vh></v>
<v t="ekr.20180519065722.128"><vh>_expand_typestr</vh></v>
<v t="ekr.20180519065722.129"><vh>_search_param_in_docstr</vh></v>
<v t="ekr.20180519065722.130"><vh>_strip_rst_role</vh></v>
<v t="ekr.20180519065722.131"><vh>_evaluate_for_statement_string</vh></v>
<v t="ekr.20180519065722.132"><vh>_execute_types_in_stmt</vh></v>
<v t="ekr.20180519065722.133"><vh>_execute_array_values</vh></v>
<v t="ekr.20180519065722.134"><vh>infer_param</vh></v>
<v t="ekr.20180519065722.135"><vh>infer_return_types</vh></v>
</v>
<v t="ekr.20180519065722.136"><vh>@clean dynamic.py</vh>
<v t="ekr.20180519065722.137"><vh>Declarations</vh></v>
<v t="ekr.20180519065722.138"><vh>class MergedExecutedParams</vh>
<v t="ekr.20180519065722.139"><vh>__init__</vh></v>
<v t="ekr.20180519065722.140"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065722.141"><vh>search_params</vh></v>
<v t="ekr.20180519065722.142"><vh>_search_function_executions</vh></v>
<v t="ekr.20180519065722.143"><vh>_get_lambda_name</vh></v>
<v t="ekr.20180519065722.144"><vh>_get_possible_nodes</vh></v>
<v t="ekr.20180519065722.145"><vh>_check_name_for_execution</vh></v>
</v>
<v t="ekr.20180519065722.146"><vh>@clean filters.py</vh>
<v t="ekr.20180519065722.147"><vh>Declarations</vh></v>
<v t="ekr.20180519065722.148"><vh>class AbstractNameDefinition</vh>
<v t="ekr.20180519065722.149"><vh>infer</vh></v>
<v t="ekr.20180519065722.150"><vh>goto</vh></v>
<v t="ekr.20180519065722.151"><vh>get_root_context</vh></v>
<v t="ekr.20180519065722.152"><vh>__repr__</vh></v>
<v t="ekr.20180519065722.153"><vh>execute</vh></v>
<v t="ekr.20180519065722.154"><vh>execute_evaluated</vh></v>
<v t="ekr.20180519065722.155"><vh>is_import</vh></v>
<v t="ekr.20180519065722.156"><vh>api_type</vh></v>
</v>
<v t="ekr.20180519065722.157"><vh>class AbstractTreeName</vh>
<v t="ekr.20180519065722.158"><vh>__init__</vh></v>
<v t="ekr.20180519065722.159"><vh>goto</vh></v>
<v t="ekr.20180519065722.160"><vh>is_import</vh></v>
<v t="ekr.20180519065722.161"><vh>string_name</vh></v>
<v t="ekr.20180519065722.162"><vh>start_pos</vh></v>
</v>
<v t="ekr.20180519065722.163"><vh>class ContextNameMixin</vh>
<v t="ekr.20180519065722.164"><vh>infer</vh></v>
<v t="ekr.20180519065722.165"><vh>get_root_context</vh></v>
<v t="ekr.20180519065722.166"><vh>api_type</vh></v>
</v>
<v t="ekr.20180519065722.167"><vh>class ContextName</vh>
<v t="ekr.20180519065722.168"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519065722.169"><vh>class TreeNameDefinition</vh>
<v t="ekr.20180519065722.170"><vh>infer</vh></v>
<v t="ekr.20180519065722.171"><vh>api_type</vh></v>
</v>
<v t="ekr.20180519065722.172"><vh>class ParamName</vh>
<v t="ekr.20180519065722.173"><vh>__init__</vh></v>
<v t="ekr.20180519065722.174"><vh>get_kind</vh></v>
<v t="ekr.20180519065722.175"><vh>infer</vh></v>
<v t="ekr.20180519065722.176"><vh>get_param</vh></v>
</v>
<v t="ekr.20180519065722.177"><vh>class AnonymousInstanceParamName</vh>
<v t="ekr.20180519065722.178"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065722.179"><vh>class AbstractFilter</vh>
<v t="ekr.20180519065722.180"><vh>_filter</vh></v>
<v t="ekr.20180519065722.181"><vh>get</vh></v>
<v t="ekr.20180519065722.182"><vh>values</vh></v>
</v>
<v t="ekr.20180519065722.183"><vh>class AbstractUsedNamesFilter</vh>
<v t="ekr.20180519065722.184"><vh>__init__</vh></v>
<v t="ekr.20180519065722.185"><vh>get</vh></v>
<v t="ekr.20180519065722.186"><vh>_convert_names</vh></v>
<v t="ekr.20180519065722.187"><vh>values</vh></v>
<v t="ekr.20180519065722.188"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519065722.189"><vh>class ParserTreeFilter</vh>
<v t="ekr.20180519065722.190"><vh>__init__</vh></v>
<v t="ekr.20180519065722.191"><vh>_filter</vh></v>
<v t="ekr.20180519065722.192"><vh>_is_name_reachable</vh></v>
<v t="ekr.20180519065722.193"><vh>_check_flows</vh></v>
</v>
<v t="ekr.20180519065722.194"><vh>class FunctionExecutionFilter</vh>
<v t="ekr.20180519065722.195"><vh>__init__</vh></v>
<v t="ekr.20180519065722.196"><vh>_convert_names</vh></v>
</v>
<v t="ekr.20180519065722.197"><vh>class AnonymousInstanceFunctionExecutionFilter</vh></v>
<v t="ekr.20180519065722.198"><vh>class GlobalNameFilter</vh>
<v t="ekr.20180519065722.199"><vh>__init__</vh></v>
<v t="ekr.20180519065722.200"><vh>_filter</vh></v>
</v>
<v t="ekr.20180519065722.201"><vh>class DictFilter</vh>
<v t="ekr.20180519065722.202"><vh>__init__</vh></v>
<v t="ekr.20180519065722.203"><vh>get</vh></v>
<v t="ekr.20180519065722.204"><vh>values</vh></v>
<v t="ekr.20180519065722.205"><vh>_convert</vh></v>
</v>
<v t="ekr.20180519065722.206"><vh>class MergedFilter</vh>
<v t="ekr.20180519065722.207"><vh>__init__</vh></v>
<v t="ekr.20180519065722.208"><vh>get</vh></v>
<v t="ekr.20180519065722.209"><vh>values</vh></v>
<v t="ekr.20180519065722.210"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519065722.211"><vh>class _BuiltinMappedMethod</vh>
<v t="ekr.20180519065722.212"><vh>__init__</vh></v>
<v t="ekr.20180519065722.213"><vh>py__call__</vh></v>
<v t="ekr.20180519065722.214"><vh>__getattr__</vh></v>
</v>
<v t="ekr.20180519065722.215"><vh>class SpecialMethodFilter</vh>
<v t="ekr.20180519065722.216"><vh>class SpecialMethodName</vh>
<v t="ekr.20180519065722.217"><vh>__init__</vh></v>
<v t="ekr.20180519065722.218"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065722.219"><vh>__init__</vh></v>
<v t="ekr.20180519065722.220"><vh>_convert</vh></v>
</v>
<v t="ekr.20180519065722.221"><vh>class _OverwriteMeta</vh>
<v t="ekr.20180519065722.222"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519065722.223"><vh>class AbstractObjectOverwrite</vh>
<v t="ekr.20180519065722.224"><vh>get_object</vh></v>
<v t="ekr.20180519065722.225"><vh>get_filters</vh></v>
</v>
<v t="ekr.20180519065722.226"><vh>class BuiltinOverwrite</vh>
<v t="ekr.20180519065722.227"><vh>__init__</vh></v>
<v t="ekr.20180519065722.228"><vh>get_object</vh></v>
<v t="ekr.20180519065722.229"><vh>py__class__</vh></v>
</v>
<v t="ekr.20180519065722.230"><vh>publish_method</vh></v>
<v t="ekr.20180519065722.231"><vh>get_global_filters</vh></v>
</v>
<v t="ekr.20180519065722.232"><vh>@clean finder.py</vh>
<v t="ekr.20180519065722.233"><vh>Declarations</vh></v>
<v t="ekr.20180519065722.234"><vh>class NameFinder</vh>
<v t="ekr.20180519065722.235"><vh>__init__</vh></v>
<v t="ekr.20180519065722.236"><vh>find</vh></v>
<v t="ekr.20180519065722.237"><vh>_get_origin_scope</vh></v>
<v t="ekr.20180519065722.238"><vh>get_filters</vh></v>
<v t="ekr.20180519065722.239"><vh>filter_name</vh></v>
<v t="ekr.20180519065722.240"><vh>_check_getattr</vh></v>
<v t="ekr.20180519065722.241"><vh>_names_to_types</vh></v>
</v>
<v t="ekr.20180519065722.242"><vh>_check_flow_information</vh></v>
<v t="ekr.20180519065722.243"><vh>_check_isinstance_type</vh></v>
</v>
<v t="ekr.20180519065722.244"><vh>@clean flow_analysis.py</vh>
<v t="ekr.20180519065722.245"><vh>Declarations</vh></v>
<v t="ekr.20180519065722.246"><vh>class Status</vh>
<v t="ekr.20180519065722.247"><vh>__init__</vh></v>
<v t="ekr.20180519065722.248"><vh>invert</vh></v>
<v t="ekr.20180519065722.249"><vh>__and__</vh></v>
<v t="ekr.20180519065722.250"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519065722.251"><vh>_get_flow_scopes</vh></v>
<v t="ekr.20180519065722.252"><vh>reachability_check</vh></v>
<v t="ekr.20180519065722.253"><vh>_break_check</vh></v>
<v t="ekr.20180519065722.254"><vh>_check_if</vh></v>
</v>
<v t="ekr.20180519065722.255"><vh>@clean helpers.py</vh>
<v t="ekr.20180519065722.256"><vh>Declarations</vh></v>
<v t="ekr.20180519065722.257"><vh>is_stdlib_path</vh></v>
<v t="ekr.20180519065722.258"><vh>deep_ast_copy</vh></v>
<v t="ekr.20180519065722.259"><vh>evaluate_call_of_leaf</vh></v>
<v t="ekr.20180519065722.260"><vh>call_of_leaf</vh></v>
<v t="ekr.20180519065722.261"><vh>get_names_of_node</vh></v>
<v t="ekr.20180519065722.262"><vh>get_module_names</vh></v>
<v t="ekr.20180519065722.263"><vh>predefine_names</vh></v>
<v t="ekr.20180519065722.264"><vh>is_compiled</vh></v>
<v t="ekr.20180519065722.265"><vh>is_string</vh></v>
<v t="ekr.20180519065722.266"><vh>is_literal</vh></v>
<v t="ekr.20180519065722.267"><vh>_get_safe_value_or_none</vh></v>
<v t="ekr.20180519065722.268"><vh>get_int_or_none</vh></v>
<v t="ekr.20180519065722.269"><vh>is_number</vh></v>
</v>
<v t="ekr.20180519065722.270"><vh>@clean imports.py</vh>
<v t="ekr.20180519065722.271"><vh>Declarations</vh></v>
<v t="ekr.20180519065722.272"><vh>class ModuleCache</vh>
<v t="ekr.20180519065722.273"><vh>__init__</vh></v>
<v t="ekr.20180519065722.274"><vh>add</vh></v>
<v t="ekr.20180519065722.275"><vh>iterate_modules_with_names</vh></v>
<v t="ekr.20180519065722.276"><vh>get</vh></v>
<v t="ekr.20180519065722.277"><vh>get_from_path</vh></v>
</v>
<v t="ekr.20180519065722.278"><vh>infer_import</vh></v>
<v t="ekr.20180519065722.279"><vh>class NestedImportModule</vh>
<v t="ekr.20180519065722.280"><vh>__init__</vh></v>
<v t="ekr.20180519065722.281"><vh>_get_nested_import_name</vh></v>
<v t="ekr.20180519065722.282"><vh>__getattr__</vh></v>
<v t="ekr.20180519065722.283"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519065722.284"><vh>_add_error</vh></v>
<v t="ekr.20180519065722.285"><vh>class ImportName</vh>
<v t="ekr.20180519065722.286"><vh>__init__</vh></v>
<v t="ekr.20180519065722.287"><vh>infer</vh></v>
<v t="ekr.20180519065722.288"><vh>goto</vh></v>
<v t="ekr.20180519065722.289"><vh>get_root_context</vh></v>
<v t="ekr.20180519065722.290"><vh>api_type</vh></v>
</v>
<v t="ekr.20180519065722.291"><vh>class SubModuleName</vh></v>
<v t="ekr.20180519065722.292"><vh>class Importer</vh>
<v t="ekr.20180519065722.293"><vh>__init__</vh></v>
<v t="ekr.20180519065722.294"><vh>str_import_path</vh></v>
<v t="ekr.20180519065722.295"><vh>sys_path_with_modifications</vh></v>
<v t="ekr.20180519065722.296"><vh>follow</vh></v>
<v t="ekr.20180519065722.297"><vh>_do_import</vh></v>
<v t="ekr.20180519065722.298"><vh>_generate_name</vh></v>
<v t="ekr.20180519065722.299"><vh>_get_module_names</vh></v>
<v t="ekr.20180519065722.300"><vh>completion_names</vh></v>
</v>
<v t="ekr.20180519065722.301"><vh>_load_module</vh></v>
<v t="ekr.20180519065722.302"><vh>add_module_to_cache</vh></v>
<v t="ekr.20180519065722.303"><vh>get_modules_containing_name</vh></v>
</v>
<v t="ekr.20180519065722.304"><vh>@clean jedi_typing.py</vh>
<v t="ekr.20180519065722.305"><vh>Declarations</vh></v>
<v t="ekr.20180519065722.306"><vh>factory</vh></v>
</v>
<v t="ekr.20180519065722.307"><vh>@clean lazy_context.py</vh>
<v t="ekr.20180519065722.308"><vh>Declarations</vh></v>
<v t="ekr.20180519065722.309"><vh>class AbstractLazyContext</vh>
<v t="ekr.20180519065722.310"><vh>__init__</vh></v>
<v t="ekr.20180519065722.311"><vh>__repr__</vh></v>
<v t="ekr.20180519065722.312"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065722.313"><vh>class LazyKnownContext</vh>
<v t="ekr.20180519065722.314"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065722.315"><vh>class LazyKnownContexts</vh>
<v t="ekr.20180519065722.316"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065722.317"><vh>class LazyUnknownContext</vh>
<v t="ekr.20180519065722.318"><vh>__init__</vh></v>
<v t="ekr.20180519065722.319"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065722.320"><vh>class LazyTreeContext</vh>
<v t="ekr.20180519065722.321"><vh>__init__</vh></v>
<v t="ekr.20180519065722.322"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065722.323"><vh>get_merged_lazy_context</vh></v>
<v t="ekr.20180519065722.324"><vh>class MergedLazyContexts</vh>
<v t="ekr.20180519065722.325"><vh>infer</vh></v>
</v>
</v>
<v t="ekr.20180519065722.326"><vh>@clean param.py</vh>
<v t="ekr.20180519065722.327"><vh>Declarations</vh></v>
<v t="ekr.20180519065722.328"><vh>_add_argument_issue</vh></v>
<v t="ekr.20180519065722.329"><vh>class ExecutedParam</vh>
<v t="ekr.20180519065722.330"><vh>__init__</vh></v>
<v t="ekr.20180519065722.331"><vh>infer</vh></v>
<v t="ekr.20180519065722.332"><vh>var_args</vh></v>
<v t="ekr.20180519065722.333"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519065722.334"><vh>get_params</vh></v>
<v t="ekr.20180519065722.335"><vh>_error_argument_count</vh></v>
<v t="ekr.20180519065722.336"><vh>_create_default_param</vh></v>
<v t="ekr.20180519065722.337"><vh>create_default_params</vh></v>
</v>
<v t="ekr.20180519065722.338"><vh>@clean parser_cache.py</vh>
<v t="ekr.20180519065722.339"><vh>Declarations</vh></v>
<v t="ekr.20180519065722.340"><vh>get_yield_exprs</vh></v>
</v>
<v t="ekr.20180519065722.341"><vh>@clean pep0484.py</vh>
<v t="ekr.20180519065722.342"><vh>Declarations</vh></v>
<v t="ekr.20180519065722.343"><vh>_evaluate_for_annotation</vh></v>
<v t="ekr.20180519065722.344"><vh>_evaluate_annotation_string</vh></v>
<v t="ekr.20180519065722.345"><vh>_fix_forward_reference</vh></v>
<v t="ekr.20180519065722.346"><vh>_get_forward_reference_node</vh></v>
<v t="ekr.20180519065722.347"><vh>_split_comment_param_declaration</vh></v>
<v t="ekr.20180519065722.348"><vh>infer_param</vh></v>
<v t="ekr.20180519065723.1"><vh>py__annotations__</vh></v>
<v t="ekr.20180519065723.2"><vh>infer_return_types</vh></v>
<v t="ekr.20180519065723.3"><vh>_get_typing_replacement_module</vh></v>
<v t="ekr.20180519065723.4"><vh>py__getitem__</vh></v>
<v t="ekr.20180519065723.5"><vh>find_type_from_comment_hint_for</vh></v>
<v t="ekr.20180519065723.6"><vh>find_type_from_comment_hint_with</vh></v>
<v t="ekr.20180519065723.7"><vh>find_type_from_comment_hint_assign</vh></v>
<v t="ekr.20180519065723.8"><vh>_find_type_from_comment_hint</vh></v>
</v>
<v t="ekr.20180519065723.9"><vh>@clean recursion.py</vh>
<v t="ekr.20180519065723.10"><vh>Declarations</vh></v>
<v t="ekr.20180519065723.11"><vh>class RecursionDetector</vh>
<v t="ekr.20180519065723.12"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519065723.13"><vh>execution_allowed</vh></v>
<v t="ekr.20180519065723.14"><vh>execution_recursion_decorator</vh></v>
<v t="ekr.20180519065723.15"><vh>class ExecutionRecursionDetector</vh>
<v t="ekr.20180519065723.16"><vh>__init__</vh></v>
<v t="ekr.20180519065723.17"><vh>pop_execution</vh></v>
<v t="ekr.20180519065723.18"><vh>push_execution</vh></v>
</v>
</v>
<v t="ekr.20180519065723.19"><vh>@clean stdlib.py</vh>
<v t="ekr.20180519065723.20"><vh>Declarations</vh></v>
<v t="ekr.20180519065723.21"><vh>class NotInStdLib</vh></v>
<v t="ekr.20180519065723.22"><vh>execute</vh></v>
<v t="ekr.20180519065723.23"><vh>_follow_param</vh></v>
<v t="ekr.20180519065723.24"><vh>argument_clinic</vh></v>
<v t="ekr.20180519065723.25"><vh>builtins_next</vh></v>
<v t="ekr.20180519065723.26"><vh>builtins_getattr</vh></v>
<v t="ekr.20180519065723.27"><vh>builtins_type</vh></v>
<v t="ekr.20180519065723.28"><vh>class SuperInstance</vh>
<v t="ekr.20180519065723.29"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519065723.30"><vh>builtins_super</vh></v>
<v t="ekr.20180519065723.31"><vh>builtins_reversed</vh></v>
<v t="ekr.20180519065723.32"><vh>builtins_isinstance</vh></v>
<v t="ekr.20180519065723.33"><vh>collections_namedtuple</vh></v>
<v t="ekr.20180519065723.34"><vh>_return_first_param</vh></v>
</v>
<v t="ekr.20180519065723.35"><vh>@clean syntax_tree.py</vh>
<v t="ekr.20180519065723.36"><vh>Declarations</vh></v>
<v t="ekr.20180519065723.37"><vh>_limit_context_infers</vh></v>
<v t="ekr.20180519065723.38"><vh>_py__stop_iteration_returns</vh></v>
<v t="ekr.20180519065723.39"><vh>eval_node</vh></v>
<v t="ekr.20180519065723.40"><vh>eval_trailer</vh></v>
<v t="ekr.20180519065723.41"><vh>eval_atom</vh></v>
<v t="ekr.20180519065723.42"><vh>eval_expr_stmt</vh></v>
<v t="ekr.20180519065723.43"><vh>_eval_expr_stmt</vh></v>
<v t="ekr.20180519065723.44"><vh>eval_or_test</vh></v>
<v t="ekr.20180519065723.45"><vh>eval_factor</vh></v>
<v t="ekr.20180519065723.46"><vh>_literals_to_types</vh></v>
<v t="ekr.20180519065723.47"><vh>_eval_comparison</vh></v>
<v t="ekr.20180519065723.48"><vh>_is_tuple</vh></v>
<v t="ekr.20180519065723.49"><vh>_is_list</vh></v>
<v t="ekr.20180519065723.50"><vh>_bool_to_context</vh></v>
<v t="ekr.20180519065723.51"><vh>_eval_comparison_part</vh></v>
<v t="ekr.20180519065723.52"><vh>_remove_statements</vh></v>
<v t="ekr.20180519065723.53"><vh>tree_name_to_contexts</vh></v>
<v t="ekr.20180519065723.54"><vh>_apply_decorators</vh></v>
<v t="ekr.20180519065723.55"><vh>check_tuple_assignments</vh></v>
<v t="ekr.20180519065723.56"><vh>eval_subscript_list</vh></v>
</v>
<v t="ekr.20180519065723.57"><vh>@clean sys_path.py</vh>
<v t="ekr.20180519065723.58"><vh>Declarations</vh></v>
<v t="ekr.20180519065723.59"><vh>_abs_path</vh></v>
<v t="ekr.20180519065723.60"><vh>_paths_from_assignment</vh></v>
<v t="ekr.20180519065723.61"><vh>_paths_from_list_modifications</vh></v>
<v t="ekr.20180519065723.62"><vh>check_sys_path_modifications</vh></v>
<v t="ekr.20180519065723.63"><vh>discover_buildout_paths</vh></v>
<v t="ekr.20180519065723.64"><vh>_get_paths_from_buildout_script</vh></v>
<v t="ekr.20180519065723.65"><vh>_get_parent_dir_with_file</vh></v>
<v t="ekr.20180519065723.66"><vh>_get_buildout_script_paths</vh></v>
<v t="ekr.20180519065723.67"><vh>dotted_path_in_sys_path</vh></v>
</v>
<v t="ekr.20180519065723.68"><vh>@clean usages.py</vh>
<v t="ekr.20180519065723.69"><vh>Declarations</vh></v>
<v t="ekr.20180519065723.70"><vh>_resolve_names</vh></v>
<v t="ekr.20180519065723.71"><vh>_dictionarize</vh></v>
<v t="ekr.20180519065723.72"><vh>_find_names</vh></v>
<v t="ekr.20180519065723.73"><vh>usages</vh></v>
</v>
<v t="ekr.20180519065723.74"><vh>@clean utils.py</vh>
<v t="ekr.20180519065723.75"><vh>Declarations</vh></v>
<v t="ekr.20180519065723.76"><vh>to_list</vh></v>
<v t="ekr.20180519065723.77"><vh>unite</vh></v>
<v t="ekr.20180519065723.78"><vh>class UncaughtAttributeError</vh></v>
<v t="ekr.20180519065723.79"><vh>safe_property</vh></v>
<v t="ekr.20180519065723.80"><vh>reraise_uncaught</vh></v>
<v t="ekr.20180519065723.81"><vh>class PushBackIterator</vh>
<v t="ekr.20180519065723.82"><vh>__init__</vh></v>
<v t="ekr.20180519065723.83"><vh>push_back</vh></v>
<v t="ekr.20180519065723.84"><vh>__iter__</vh></v>
<v t="ekr.20180519065723.85"><vh>next</vh></v>
<v t="ekr.20180519065723.86"><vh>__next__</vh></v>
</v>
<v t="ekr.20180519065723.87"><vh>ignored</vh></v>
<v t="ekr.20180519065723.88"><vh>indent_block</vh></v>
<v t="ekr.20180519065723.89"><vh>dotted_from_fs_path</vh></v>
</v>
<v t="ekr.20180519065723.90"><vh>@clean __init__.py</vh>
<v t="ekr.20180519065723.91"><vh>Declarations</vh></v>
<v t="ekr.20180519065723.92"><vh>class Evaluator</vh>
<v t="ekr.20180519065723.93"><vh>__init__</vh></v>
<v t="ekr.20180519065723.94"><vh>builtins_module</vh></v>
<v t="ekr.20180519065723.95"><vh>reset_recursion_limitations</vh></v>
<v t="ekr.20180519065723.96"><vh>get_sys_path</vh></v>
<v t="ekr.20180519065723.97"><vh>eval_element</vh></v>
<v t="ekr.20180519065723.98"><vh>_eval_element_if_evaluated</vh></v>
<v t="ekr.20180519065723.99"><vh>_eval_element_cached</vh></v>
<v t="ekr.20180519065723.100"><vh>goto_definitions</vh></v>
<v t="ekr.20180519065723.101"><vh>goto</vh></v>
<v t="ekr.20180519065723.102"><vh>create_context</vh></v>
<v t="ekr.20180519065723.103"><vh>parse_and_get_code</vh></v>
<v t="ekr.20180519065723.104"><vh>parse</vh></v>
</v>
</v>
<v t="ekr.20180519065723.106"><vh>@path compiled</vh>
<v t="ekr.20180519065723.107"><vh>@clean access.py</vh>
<v t="ekr.20180519065723.108"><vh>Declarations</vh></v>
<v t="ekr.20180519065723.109"><vh>_a_generator</vh></v>
<v t="ekr.20180519065723.110"><vh>safe_getattr</vh></v>
<v t="ekr.20180519065723.111"><vh>compiled_objects_cache</vh></v>
<v t="ekr.20180519065723.112"><vh>create_access</vh></v>
<v t="ekr.20180519065723.113"><vh>load_module</vh></v>
<v t="ekr.20180519065723.114"><vh>class AccessPath</vh>
<v t="ekr.20180519065723.115"><vh>__init__</vh></v>
<v t="ekr.20180519065723.116"><vh>__getstate__</vh></v>
<v t="ekr.20180519065723.117"><vh>__setstate__</vh></v>
</v>
<v t="ekr.20180519065723.118"><vh>create_access_path</vh></v>
<v t="ekr.20180519065723.119"><vh>_force_unicode_decorator</vh></v>
<v t="ekr.20180519065723.120"><vh>class DirectObjectAccess</vh>
<v t="ekr.20180519065723.121"><vh>__init__</vh></v>
<v t="ekr.20180519065723.122"><vh>__repr__</vh></v>
<v t="ekr.20180519065723.123"><vh>_create_access</vh></v>
<v t="ekr.20180519065723.124"><vh>_create_access_path</vh></v>
<v t="ekr.20180519065723.125"><vh>py__bool__</vh></v>
<v t="ekr.20180519065723.126"><vh>py__file__</vh></v>
<v t="ekr.20180519065723.127"><vh>py__doc__</vh></v>
<v t="ekr.20180519065723.128"><vh>py__name__</vh></v>
<v t="ekr.20180519065723.129"><vh>py__mro__accesses</vh></v>
<v t="ekr.20180519065723.130"><vh>py__getitem__</vh></v>
<v t="ekr.20180519065723.131"><vh>py__iter__list</vh></v>
<v t="ekr.20180519065723.132"><vh>py__class__</vh></v>
<v t="ekr.20180519065723.133"><vh>py__bases__</vh></v>
<v t="ekr.20180519065723.134"><vh>get_repr</vh></v>
<v t="ekr.20180519065723.135"><vh>is_class</vh></v>
<v t="ekr.20180519065723.136"><vh>ismethoddescriptor</vh></v>
<v t="ekr.20180519065723.137"><vh>dir</vh></v>
<v t="ekr.20180519065723.138"><vh>has_iter</vh></v>
<v t="ekr.20180519065723.139"><vh>is_allowed_getattr</vh></v>
<v t="ekr.20180519065723.140"><vh>getattr</vh></v>
<v t="ekr.20180519065723.141"><vh>get_safe_value</vh></v>
<v t="ekr.20180519065723.142"><vh>get_api_type</vh></v>
<v t="ekr.20180519065723.143"><vh>get_access_path_tuples</vh></v>
<v t="ekr.20180519065723.144"><vh>_get_objects_path</vh></v>
<v t="ekr.20180519065723.145"><vh>execute_operation</vh></v>
<v t="ekr.20180519065723.146"><vh>needs_type_completions</vh></v>
<v t="ekr.20180519065723.147"><vh>get_signature_params</vh></v>
<v t="ekr.20180519065723.148"><vh>negate</vh></v>
<v t="ekr.20180519065723.149"><vh>dict_values</vh></v>
<v t="ekr.20180519065723.150"><vh>is_super_class</vh></v>
<v t="ekr.20180519065723.151"><vh>get_dir_infos</vh></v>
</v>
<v t="ekr.20180519065723.152"><vh>_is_class_instance</vh></v>
<v t="ekr.20180519065723.153"><vh>class _SPECIAL_OBJECTS</vh></v>
<v t="ekr.20180519065723.154"><vh>get_special_object</vh></v>
</v>
<v t="ekr.20180519065723.155"><vh>@clean context.py</vh>
<v t="ekr.20180519065723.156"><vh>Declarations</vh></v>
<v t="ekr.20180519065723.157"><vh>class CheckAttribute</vh>
<v t="ekr.20180519065723.158"><vh>__init__</vh></v>
<v t="ekr.20180519065723.159"><vh>__get__</vh></v>
</v>
<v t="ekr.20180519065723.160"><vh>class CompiledObject</vh>
<v t="ekr.20180519065723.161"><vh>__init__</vh></v>
<v t="ekr.20180519065723.162"><vh>py__call__</vh></v>
<v t="ekr.20180519065723.163"><vh>py__class__</vh></v>
<v t="ekr.20180519065723.164"><vh>py__mro__</vh></v>
<v t="ekr.20180519065723.165"><vh>py__bases__</vh></v>
<v t="ekr.20180519065723.166"><vh>py__bool__</vh></v>
<v t="ekr.20180519065723.167"><vh>py__file__</vh></v>
<v t="ekr.20180519065723.168"><vh>is_class</vh></v>
<v t="ekr.20180519065723.169"><vh>py__doc__</vh></v>
<v t="ekr.20180519065723.170"><vh>get_param_names</vh></v>
<v t="ekr.20180519065723.171"><vh>__repr__</vh></v>
<v t="ekr.20180519065723.172"><vh>_parse_function_doc</vh></v>
<v t="ekr.20180519065723.173"><vh>api_type</vh></v>
<v t="ekr.20180519065723.174"><vh>_cls</vh></v>
<v t="ekr.20180519065723.175"><vh>get_filters</vh></v>
<v t="ekr.20180519065723.176"><vh>_ensure_one_filter</vh></v>
<v t="ekr.20180519065723.177"><vh>py__getitem__</vh></v>
<v t="ekr.20180519065723.178"><vh>py__iter__</vh></v>
<v t="ekr.20180519065723.179"><vh>py__name__</vh></v>
<v t="ekr.20180519065723.180"><vh>name</vh></v>
<v t="ekr.20180519065723.181"><vh>_execute_function</vh></v>
<v t="ekr.20180519065723.182"><vh>dict_values</vh></v>
<v t="ekr.20180519065723.183"><vh>get_safe_value</vh></v>
<v t="ekr.20180519065723.184"><vh>execute_operation</vh></v>
<v t="ekr.20180519065723.185"><vh>negate</vh></v>
<v t="ekr.20180519065723.186"><vh>is_super_class</vh></v>
</v>
<v t="ekr.20180519065723.187"><vh>class CompiledName</vh>
<v t="ekr.20180519065723.188"><vh>__init__</vh></v>
<v t="ekr.20180519065723.189"><vh>__repr__</vh></v>
<v t="ekr.20180519065723.190"><vh>api_type</vh></v>
<v t="ekr.20180519065723.191"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065723.192"><vh>class SignatureParamName</vh>
<v t="ekr.20180519065723.193"><vh>__init__</vh></v>
<v t="ekr.20180519065723.194"><vh>string_name</vh></v>
<v t="ekr.20180519065723.195"><vh>get_kind</vh></v>
<v t="ekr.20180519065723.196"><vh>is_keyword_param</vh></v>
<v t="ekr.20180519065723.197"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065723.198"><vh>class UnresolvableParamName</vh>
<v t="ekr.20180519065723.199"><vh>__init__</vh></v>
<v t="ekr.20180519065723.200"><vh>get_kind</vh></v>
<v t="ekr.20180519065723.201"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065723.202"><vh>class CompiledContextName</vh>
<v t="ekr.20180519065723.203"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519065723.204"><vh>class EmptyCompiledName</vh>
<v t="ekr.20180519065723.205"><vh>__init__</vh></v>
<v t="ekr.20180519065723.206"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065723.207"><vh>class CompiledObjectFilter</vh>
<v t="ekr.20180519065723.208"><vh>__init__</vh></v>
<v t="ekr.20180519065723.209"><vh>get</vh></v>
<v t="ekr.20180519065723.210"><vh>_get</vh></v>
<v t="ekr.20180519065723.211"><vh>_get_cached_name</vh></v>
<v t="ekr.20180519065723.212"><vh>values</vh></v>
<v t="ekr.20180519065723.213"><vh>_create_name</vh></v>
</v>
<v t="ekr.20180519065723.214"><vh>_parse_function_doc</vh></v>
<v t="ekr.20180519065723.215"><vh>create_from_name</vh></v>
<v t="ekr.20180519065723.216"><vh>_normalize_create_args</vh></v>
<v t="ekr.20180519065723.217"><vh>create_from_access_path</vh></v>
<v t="ekr.20180519065723.218"><vh>create_cached_compiled_object</vh></v>
</v>
<v t="ekr.20180519065723.219"><vh>@clean fake.py</vh>
<v t="ekr.20180519065723.220"><vh>Declarations</vh></v>
<v t="ekr.20180519065723.221"><vh>_get_path_dict</vh></v>
<v t="ekr.20180519065723.222"><vh>class FakeDoesNotExist</vh></v>
<v t="ekr.20180519065723.223"><vh>_load_faked_module</vh></v>
<v t="ekr.20180519065723.224"><vh>_search_scope</vh></v>
<v t="ekr.20180519065723.225"><vh>get_faked_with_parent_context</vh></v>
<v t="ekr.20180519065723.226"><vh>get_faked_module</vh></v>
</v>
<v t="ekr.20180519065723.227"><vh>@clean getattr_static.py</vh>
<v t="ekr.20180519065723.228"><vh>Declarations</vh></v>
<v t="ekr.20180519065723.229"><vh>_check_instance</vh></v>
<v t="ekr.20180519065723.230"><vh>_check_class</vh></v>
<v t="ekr.20180519065723.231"><vh>_is_type</vh></v>
<v t="ekr.20180519065723.232"><vh>_shadowed_dict_newstyle</vh></v>
<v t="ekr.20180519065723.233"><vh>_static_getmro_newstyle</vh></v>
<v t="ekr.20180519065723.234"><vh>_safe_hasattr</vh></v>
<v t="ekr.20180519065723.235"><vh>_safe_is_data_descriptor</vh></v>
<v t="ekr.20180519065723.236"><vh>getattr_static</vh></v>
</v>
<v t="ekr.20180519065723.237"><vh>@clean mixed.py</vh>
<v t="ekr.20180519065723.238"><vh>Declarations</vh></v>
<v t="ekr.20180519065723.239"><vh>class MixedObject</vh>
<v t="ekr.20180519065723.240"><vh>__init__</vh></v>
<v t="ekr.20180519065723.241"><vh>py__getattribute__</vh></v>
<v t="ekr.20180519065723.242"><vh>get_filters</vh></v>
<v t="ekr.20180519065723.243"><vh>__repr__</vh></v>
<v t="ekr.20180519065723.244"><vh>__getattr__</vh></v>
</v>
<v t="ekr.20180519065723.245"><vh>class MixedName</vh>
<v t="ekr.20180519065723.246"><vh>start_pos</vh></v>
<v t="ekr.20180519065723.247"><vh>start_pos</vh></v>
<v t="ekr.20180519065723.248"><vh>infer</vh></v>
<v t="ekr.20180519065723.249"><vh>api_type</vh></v>
</v>
<v t="ekr.20180519065723.250"><vh>class MixedObjectFilter</vh>
<v t="ekr.20180519065723.251"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519065723.252"><vh>_load_module</vh></v>
<v t="ekr.20180519065723.253"><vh>_get_object_to_check</vh></v>
<v t="ekr.20180519065723.254"><vh>_find_syntax_node_name</vh></v>
<v t="ekr.20180519065723.255"><vh>_create</vh></v>
</v>
<v t="ekr.20180519065723.256"><vh>@clean __init__.py</vh>
<v t="ekr.20180519065723.257"><vh>Declarations</vh></v>
<v t="ekr.20180519065723.258"><vh>builtin_from_name</vh></v>
<v t="ekr.20180519065723.259"><vh>create_simple_object</vh></v>
<v t="ekr.20180519065723.260"><vh>get_special_object</vh></v>
<v t="ekr.20180519065723.261"><vh>get_string_context_set</vh></v>
<v t="ekr.20180519065723.262"><vh>load_module</vh></v>
</v>
<v t="ekr.20180519065723.265"><vh>@path subprocess</vh>
<v t="ekr.20180519065723.266"><vh>@clean functions.py</vh>
<v t="ekr.20180519065723.267"><vh>Declarations</vh></v>
<v t="ekr.20180519065723.268"><vh>get_sys_path</vh></v>
<v t="ekr.20180519065723.269"><vh>load_module</vh></v>
<v t="ekr.20180519065723.270"><vh>get_compiled_method_return</vh></v>
<v t="ekr.20180519065723.271"><vh>get_special_object</vh></v>
<v t="ekr.20180519065723.272"><vh>create_simple_object</vh></v>
<v t="ekr.20180519065723.273"><vh>get_module_info</vh></v>
<v t="ekr.20180519065723.274"><vh>list_module_names</vh></v>
<v t="ekr.20180519065723.275"><vh>get_builtin_module_names</vh></v>
<v t="ekr.20180519065723.276"><vh>_test_raise_error</vh></v>
<v t="ekr.20180519065723.277"><vh>_test_print</vh></v>
<v t="ekr.20180519065723.278"><vh>_get_init_path</vh></v>
<v t="ekr.20180519065723.279"><vh>safe_literal_eval</vh></v>
</v>
<v t="ekr.20180519065723.280"><vh>@clean __init__.py</vh>
<v t="ekr.20180519065723.281"><vh>Declarations</vh></v>
<v t="ekr.20180519065723.282"><vh>get_subprocess</vh></v>
<v t="ekr.20180519065723.283"><vh>_get_function</vh></v>
<v t="ekr.20180519065723.284"><vh>class _EvaluatorProcess</vh>
<v t="ekr.20180519065723.285"><vh>__init__</vh></v>
<v t="ekr.20180519065723.286"><vh>get_or_create_access_handle</vh></v>
<v t="ekr.20180519065723.287"><vh>get_access_handle</vh></v>
<v t="ekr.20180519065723.288"><vh>set_access_handle</vh></v>
</v>
<v t="ekr.20180519065723.289"><vh>class EvaluatorSameProcess</vh>
<v t="ekr.20180519065723.290"><vh>__getattr__</vh></v>
</v>
<v t="ekr.20180519065723.291"><vh>class EvaluatorSubprocess</vh>
<v t="ekr.20180519065723.292"><vh>__init__</vh></v>
<v t="ekr.20180519065723.293"><vh>__getattr__</vh></v>
<v t="ekr.20180519065723.294"><vh>_convert_access_handles</vh></v>
<v t="ekr.20180519065723.295"><vh>__del__</vh></v>
</v>
<v t="ekr.20180519065723.296"><vh>class _CompiledSubprocess</vh>
<v t="ekr.20180519065723.297"><vh>__init__</vh></v>
<v t="ekr.20180519065723.298"><vh>_process</vh></v>
<v t="ekr.20180519065723.299"><vh>run</vh></v>
<v t="ekr.20180519065723.300"><vh>get_sys_path</vh></v>
<v t="ekr.20180519065723.301"><vh>kill</vh></v>
<v t="ekr.20180519065723.302"><vh>_send</vh></v>
<v t="ekr.20180519065723.303"><vh>delete_evaluator</vh></v>
</v>
<v t="ekr.20180519065723.304"><vh>class Listener</vh>
<v t="ekr.20180519065723.305"><vh>__init__</vh></v>
<v t="ekr.20180519065723.306"><vh>_get_evaluator</vh></v>
<v t="ekr.20180519065723.307"><vh>_run</vh></v>
<v t="ekr.20180519065723.308"><vh>listen</vh></v>
</v>
<v t="ekr.20180519065723.309"><vh>class AccessHandle</vh>
<v t="ekr.20180519065723.310"><vh>__init__</vh></v>
<v t="ekr.20180519065723.311"><vh>add_subprocess</vh></v>
<v t="ekr.20180519065723.312"><vh>__repr__</vh></v>
<v t="ekr.20180519065723.313"><vh>__getstate__</vh></v>
<v t="ekr.20180519065723.314"><vh>__setstate__</vh></v>
<v t="ekr.20180519065723.315"><vh>__getattr__</vh></v>
<v t="ekr.20180519065723.316"><vh>_workaround</vh></v>
<v t="ekr.20180519065723.317"><vh>_cached_results</vh></v>
</v>
</v>
<v t="ekr.20180519065724.1"><vh>@clean __main__.py</vh>
<v t="ekr.20180519065724.2"><vh>Declarations</vh></v>
<v t="ekr.20180519065724.3"><vh>_get_paths</vh></v>
</v>
</v>
</v>
<v t="ekr.20180519065724.5"><vh>@path context</vh>
<v t="ekr.20180519065724.6"><vh>@clean asynchronous.py</vh>
<v t="ekr.20180519065724.7"><vh>Declarations</vh></v>
<v t="ekr.20180519065724.8"><vh>class AsyncBase</vh>
<v t="ekr.20180519065724.9"><vh>__init__</vh></v>
<v t="ekr.20180519065724.10"><vh>name</vh></v>
<v t="ekr.20180519065724.11"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519065724.12"><vh>class Coroutine</vh>
<v t="ekr.20180519065724.13"><vh>_await</vh></v>
</v>
<v t="ekr.20180519065724.14"><vh>class CoroutineWrapper</vh>
<v t="ekr.20180519065724.15"><vh>py__stop_iteration_returns</vh></v>
</v>
<v t="ekr.20180519065724.16"><vh>class AsyncGenerator</vh>
<v t="ekr.20180519065724.17"><vh>py__aiter__</vh></v>
</v>
</v>
<v t="ekr.20180519065724.18"><vh>@clean function.py</vh>
<v t="ekr.20180519065724.19"><vh>Declarations (jedi/evaluate/context/function.py)</vh></v>
<v t="ekr.20180519065724.20"><vh>class LambdaName</vh>
<v t="ekr.20180519065724.21"><vh>__init__</vh></v>
<v t="ekr.20180519065724.22"><vh>start_pos</vh></v>
<v t="ekr.20180519065724.23"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065724.24"><vh>class FunctionContext</vh>
<v t="ekr.20180519065724.25"><vh>__init__</vh></v>
<v t="ekr.20180519065724.26"><vh>get_filters</vh></v>
<v t="ekr.20180519065724.27"><vh>infer_function_execution</vh></v>
<v t="ekr.20180519065724.28"><vh>get_function_execution</vh></v>
<v t="ekr.20180519065724.29"><vh>py__call__</vh></v>
<v t="ekr.20180519065724.30"><vh>py__class__</vh></v>
<v t="ekr.20180519065724.31"><vh>name</vh></v>
<v t="ekr.20180519065724.32"><vh>get_param_names</vh></v>
</v>
<v t="ekr.20180519065724.33"><vh>class FunctionExecutionContext</vh>
<v t="ekr.20180519065724.34"><vh>__init__</vh></v>
<v t="ekr.20180519065724.35"><vh>get_return_values</vh></v>
<v t="ekr.20180519065724.36"><vh>_get_yield_lazy_context</vh></v>
<v t="ekr.20180519065724.37"><vh>get_yield_lazy_contexts</vh></v>
<v t="ekr.20180519065724.38"><vh>get_filters</vh></v>
<v t="ekr.20180519065724.39"><vh>get_params</vh></v>
</v>
</v>
<v t="ekr.20180519065724.40"><vh>@clean instance.py</vh>
<v t="ekr.20180519065724.41"><vh>Declarations</vh></v>
<v t="ekr.20180519065724.42"><vh>class BaseInstanceFunctionExecution</vh>
<v t="ekr.20180519065724.43"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519065724.44"><vh>class InstanceFunctionExecution</vh>
<v t="ekr.20180519065724.45"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519065724.46"><vh>class AnonymousInstanceFunctionExecution</vh>
<v t="ekr.20180519065724.47"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519065724.48"><vh>class AbstractInstanceContext</vh>
<v t="ekr.20180519065724.49"><vh>__init__</vh></v>
<v t="ekr.20180519065724.50"><vh>is_class</vh></v>
<v t="ekr.20180519065724.51"><vh>py__call__</vh></v>
<v t="ekr.20180519065724.52"><vh>py__class__</vh></v>
<v t="ekr.20180519065724.53"><vh>py__bool__</vh></v>
<v t="ekr.20180519065724.54"><vh>get_function_slot_names</vh></v>
<v t="ekr.20180519065724.55"><vh>execute_function_slots</vh></v>
<v t="ekr.20180519065724.56"><vh>py__get__</vh></v>
<v t="ekr.20180519065724.57"><vh>get_filters</vh></v>
<v t="ekr.20180519065724.58"><vh>py__getitem__</vh></v>
<v t="ekr.20180519065724.59"><vh>py__iter__</vh></v>
<v t="ekr.20180519065724.60"><vh>name</vh></v>
<v t="ekr.20180519065724.61"><vh>_create_init_execution</vh></v>
<v t="ekr.20180519065724.62"><vh>create_init_executions</vh></v>
<v t="ekr.20180519065724.63"><vh>create_instance_context</vh></v>
<v t="ekr.20180519065724.64"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519065724.65"><vh>class CompiledInstance</vh>
<v t="ekr.20180519065724.66"><vh>__init__</vh></v>
<v t="ekr.20180519065724.67"><vh>name</vh></v>
<v t="ekr.20180519065724.68"><vh>create_instance_context</vh></v>
<v t="ekr.20180519065724.69"><vh>get_first_non_keyword_argument_contexts</vh></v>
</v>
<v t="ekr.20180519065724.70"><vh>class TreeInstance</vh>
<v t="ekr.20180519065724.71"><vh>__init__</vh></v>
<v t="ekr.20180519065724.72"><vh>name</vh></v>
</v>
<v t="ekr.20180519065724.73"><vh>class AnonymousInstance</vh>
<v t="ekr.20180519065724.74"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519065724.75"><vh>class CompiledInstanceName</vh>
<v t="ekr.20180519065724.76"><vh>__init__</vh></v>
<v t="ekr.20180519065724.77"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065724.78"><vh>class CompiledInstanceClassFilter</vh>
<v t="ekr.20180519065724.79"><vh>__init__</vh></v>
<v t="ekr.20180519065724.80"><vh>_create_name</vh></v>
</v>
<v t="ekr.20180519065724.81"><vh>class BoundMethod</vh>
<v t="ekr.20180519065724.82"><vh>__init__</vh></v>
<v t="ekr.20180519065724.83"><vh>get_function_execution</vh></v>
</v>
<v t="ekr.20180519065724.84"><vh>class CompiledBoundMethod</vh>
<v t="ekr.20180519065724.85"><vh>__init__</vh></v>
<v t="ekr.20180519065724.86"><vh>get_param_names</vh></v>
</v>
<v t="ekr.20180519065724.87"><vh>class InstanceNameDefinition</vh>
<v t="ekr.20180519065724.88"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065724.89"><vh>class SelfName</vh>
<v t="ekr.20180519065724.90"><vh>__init__</vh></v>
<v t="ekr.20180519065724.91"><vh>parent_context</vh></v>
</v>
<v t="ekr.20180519065724.92"><vh>class LazyInstanceClassName</vh>
<v t="ekr.20180519065724.93"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065724.94"><vh>class InstanceClassFilter</vh>
<v t="ekr.20180519065724.95"><vh>__init__</vh></v>
<v t="ekr.20180519065724.96"><vh>_equals_origin_scope</vh></v>
<v t="ekr.20180519065724.97"><vh>_access_possible</vh></v>
<v t="ekr.20180519065724.98"><vh>_filter</vh></v>
<v t="ekr.20180519065724.99"><vh>_convert_names</vh></v>
</v>
<v t="ekr.20180519065724.100"><vh>class SelfAttributeFilter</vh>
<v t="ekr.20180519065724.101"><vh>_filter</vh></v>
<v t="ekr.20180519065724.102"><vh>_filter_self_names</vh></v>
<v t="ekr.20180519065724.103"><vh>_check_flows</vh></v>
</v>
<v t="ekr.20180519065724.104"><vh>class InstanceVarArgs</vh>
<v t="ekr.20180519065724.105"><vh>__init__</vh></v>
<v t="ekr.20180519065724.106"><vh>_get_var_args</vh></v>
<v t="ekr.20180519065724.107"><vh>argument_node</vh></v>
<v t="ekr.20180519065724.108"><vh>trailer</vh></v>
<v t="ekr.20180519065724.109"><vh>unpack</vh></v>
<v t="ekr.20180519065724.110"><vh>get_calling_nodes</vh></v>
</v>
</v>
<v t="ekr.20180519065724.111"><vh>@clean iterable.py</vh>
<v t="ekr.20180519065724.112"><vh>Declarations</vh></v>
<v t="ekr.20180519065724.113"><vh>class IterableMixin</vh>
<v t="ekr.20180519065724.114"><vh>py__stop_iteration_returns</vh></v>
</v>
<v t="ekr.20180519065724.115"><vh>class GeneratorBase</vh>
<v t="ekr.20180519065724.116"><vh>py__next__</vh></v>
<v t="ekr.20180519065724.117"><vh>name</vh></v>
</v>
<v t="ekr.20180519065724.118"><vh>class Generator</vh>
<v t="ekr.20180519065724.119"><vh>__init__</vh></v>
<v t="ekr.20180519065724.120"><vh>py__iter__</vh></v>
<v t="ekr.20180519065724.121"><vh>py__stop_iteration_returns</vh></v>
<v t="ekr.20180519065724.122"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519065724.123"><vh>class CompForContext</vh>
<v t="ekr.20180519065724.124"><vh>from_comp_for</vh></v>
<v t="ekr.20180519065724.125"><vh>__init__</vh></v>
<v t="ekr.20180519065724.126"><vh>get_node</vh></v>
<v t="ekr.20180519065724.127"><vh>get_filters</vh></v>
</v>
<v t="ekr.20180519065724.128"><vh>comprehension_from_atom</vh></v>
<v t="ekr.20180519065724.129"><vh>class ComprehensionMixin</vh>
<v t="ekr.20180519065724.130"><vh>__init__</vh></v>
<v t="ekr.20180519065724.131"><vh>_get_comprehension</vh></v>
<v t="ekr.20180519065724.132"><vh>_get_comp_for</vh></v>
<v t="ekr.20180519065724.133"><vh>_eval_node</vh></v>
<v t="ekr.20180519065724.134"><vh>_get_comp_for_context</vh></v>
<v t="ekr.20180519065724.135"><vh>_nested</vh></v>
<v t="ekr.20180519065724.136"><vh>_iterate</vh></v>
<v t="ekr.20180519065724.137"><vh>py__iter__</vh></v>
<v t="ekr.20180519065724.138"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519065724.139"><vh>class Sequence</vh>
<v t="ekr.20180519065724.140"><vh>name</vh></v>
<v t="ekr.20180519065724.141"><vh>get_object</vh></v>
<v t="ekr.20180519065724.142"><vh>py__bool__</vh></v>
<v t="ekr.20180519065724.143"><vh>py__class__</vh></v>
<v t="ekr.20180519065724.144"><vh>parent</vh></v>
<v t="ekr.20180519065724.145"><vh>dict_values</vh></v>
</v>
<v t="ekr.20180519065724.146"><vh>class ListComprehension</vh>
<v t="ekr.20180519065724.147"><vh>py__getitem__</vh></v>
</v>
<v t="ekr.20180519065724.148"><vh>class SetComprehension</vh></v>
<v t="ekr.20180519065724.149"><vh>class DictComprehension</vh>
<v t="ekr.20180519065724.150"><vh>_get_comp_for</vh></v>
<v t="ekr.20180519065724.151"><vh>py__iter__</vh></v>
<v t="ekr.20180519065724.152"><vh>py__getitem__</vh></v>
<v t="ekr.20180519065724.153"><vh>dict_values</vh></v>
<v t="ekr.20180519065724.154"><vh>_imitate_values</vh></v>
<v t="ekr.20180519065724.155"><vh>_imitate_items</vh></v>
</v>
<v t="ekr.20180519065724.156"><vh>class GeneratorComprehension</vh></v>
<v t="ekr.20180519065724.157"><vh>class SequenceLiteralContext</vh>
<v t="ekr.20180519065724.158"><vh>__init__</vh></v>
<v t="ekr.20180519065724.159"><vh>py__getitem__</vh></v>
<v t="ekr.20180519065724.160"><vh>py__iter__</vh></v>
<v t="ekr.20180519065724.161"><vh>_values</vh></v>
<v t="ekr.20180519065724.162"><vh>_items</vh></v>
<v t="ekr.20180519065724.163"><vh>exact_key_items</vh></v>
<v t="ekr.20180519065724.164"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519065724.165"><vh>class DictLiteralContext</vh>
<v t="ekr.20180519065724.166"><vh>__init__</vh></v>
<v t="ekr.20180519065724.167"><vh>_imitate_values</vh></v>
<v t="ekr.20180519065724.168"><vh>_imitate_items</vh></v>
</v>
<v t="ekr.20180519065724.169"><vh>class _FakeArray</vh>
<v t="ekr.20180519065724.170"><vh>__init__</vh></v>
</v>
<v t="ekr.20180519065724.171"><vh>class FakeSequence</vh>
<v t="ekr.20180519065724.172"><vh>__init__</vh></v>
<v t="ekr.20180519065724.173"><vh>py__getitem__</vh></v>
<v t="ekr.20180519065724.174"><vh>py__iter__</vh></v>
<v t="ekr.20180519065724.175"><vh>py__bool__</vh></v>
<v t="ekr.20180519065724.176"><vh>__repr__</vh></v>
</v>
<v t="ekr.20180519065724.177"><vh>class FakeDict</vh>
<v t="ekr.20180519065724.178"><vh>__init__</vh></v>
<v t="ekr.20180519065724.179"><vh>py__iter__</vh></v>
<v t="ekr.20180519065724.180"><vh>py__getitem__</vh></v>
<v t="ekr.20180519065724.181"><vh>_values</vh></v>
<v t="ekr.20180519065724.182"><vh>dict_values</vh></v>
<v t="ekr.20180519065724.183"><vh>exact_key_items</vh></v>
</v>
<v t="ekr.20180519065724.184"><vh>class MergedArray</vh>
<v t="ekr.20180519065724.185"><vh>__init__</vh></v>
<v t="ekr.20180519065724.186"><vh>py__iter__</vh></v>
<v t="ekr.20180519065724.187"><vh>py__getitem__</vh></v>
<v t="ekr.20180519065724.188"><vh>_items</vh></v>
<v t="ekr.20180519065724.189"><vh>__len__</vh></v>
</v>
<v t="ekr.20180519065724.190"><vh>unpack_tuple_to_dict</vh></v>
<v t="ekr.20180519065724.191"><vh>check_array_additions</vh></v>
<v t="ekr.20180519065724.192"><vh>_check_array_additions</vh></v>
<v t="ekr.20180519065724.193"><vh>get_dynamic_array_instance</vh></v>
<v t="ekr.20180519065724.194"><vh>class _ArrayInstance</vh>
<v t="ekr.20180519065724.195"><vh>__init__</vh></v>
<v t="ekr.20180519065724.196"><vh>py__iter__</vh></v>
<v t="ekr.20180519065724.197"><vh>iterate</vh></v>
</v>
<v t="ekr.20180519065724.198"><vh>class Slice</vh>
<v t="ekr.20180519065724.199"><vh>__init__</vh></v>
<v t="ekr.20180519065724.200"><vh>obj</vh></v>
</v>
</v>
<v t="ekr.20180519065724.201"><vh>@clean klass.py</vh>
<v t="ekr.20180519065724.202"><vh>Declarations</vh></v>
<v t="ekr.20180519065724.203"><vh>apply_py__get__</vh></v>
<v t="ekr.20180519065724.204"><vh>class ClassName</vh>
<v t="ekr.20180519065724.205"><vh>__init__</vh></v>
<v t="ekr.20180519065724.206"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065724.207"><vh>class ClassFilter</vh>
<v t="ekr.20180519065724.208"><vh>_convert_names</vh></v>
</v>
<v t="ekr.20180519065724.209"><vh>class ClassContext</vh>
<v t="ekr.20180519065724.210"><vh>__init__</vh></v>
<v t="ekr.20180519065724.211"><vh>py__mro__</vh></v>
<v t="ekr.20180519065724.212"><vh>py__bases__</vh></v>
<v t="ekr.20180519065724.213"><vh>py__call__</vh></v>
<v t="ekr.20180519065724.214"><vh>py__class__</vh></v>
<v t="ekr.20180519065724.215"><vh>get_params</vh></v>
<v t="ekr.20180519065724.216"><vh>get_filters</vh></v>
<v t="ekr.20180519065724.217"><vh>is_class</vh></v>
<v t="ekr.20180519065724.218"><vh>get_function_slot_names</vh></v>
<v t="ekr.20180519065724.219"><vh>get_param_names</vh></v>
<v t="ekr.20180519065724.220"><vh>name</vh></v>
</v>
</v>
<v t="ekr.20180519065724.221"><vh>@clean module.py</vh>
<v t="ekr.20180519065724.222"><vh>Declarations</vh></v>
<v t="ekr.20180519065724.223"><vh>class _ModuleAttributeName</vh>
<v t="ekr.20180519065724.224"><vh>__init__</vh></v>
<v t="ekr.20180519065724.225"><vh>infer</vh></v>
</v>
<v t="ekr.20180519065724.226"><vh>class ModuleName</vh>
<v t="ekr.20180519065724.227"><vh>__init__</vh></v>
<v t="ekr.20180519065724.228"><vh>string_name</vh></v>
</v>
<v t="ekr.20180519065724.229"><vh>class ModuleContext</vh>
<v t="ekr.20180519065724.230"><vh>__init__</vh></v>
<v t="ekr.20180519065724.231"><vh>get_filters</vh></v>
<v t="ekr.20180519065724.232"><vh>star_imports</vh></v>
<v t="ekr.20180519065724.233"><vh>_module_attributes_dict</vh></v>
<v t="ekr.20180519065724.234"><vh>_string_name</vh></v>
<v t="ekr.20180519065724.235"><vh>name</vh></v>
<v t="ekr.20180519065724.236"><vh>_get_init_directory</vh></v>
<v t="ekr.20180519065724.237"><vh>py__name__</vh></v>
<v t="ekr.20180519065724.238"><vh>py__file__</vh></v>
<v t="ekr.20180519065724.239"><vh>py__package__</vh></v>
<v t="ekr.20180519065724.240"><vh>_py__path__</vh></v>
<v t="ekr.20180519065724.241"><vh>py__path__</vh></v>
<v t="ekr.20180519065724.242"><vh>_sub_modules_dict</vh></v>
<v t="ekr.20180519065724.243"><vh>py__class__</vh></v>
<v t="ekr.20180519065724.244"><vh>__repr__</vh></v>
</v>
</v>
<v t="ekr.20180519065724.245"><vh>@clean namespace.py</vh>
<v t="ekr.20180519065724.246"><vh>Declarations</vh></v>
<v t="ekr.20180519065724.247"><vh>class ImplicitNSName</vh>
<v t="ekr.20180519065724.248"><vh>__init__</vh></v>
<v t="ekr.20180519065724.249"><vh>infer</vh></v>
<v t="ekr.20180519065724.250"><vh>get_root_context</vh></v>
</v>
<v t="ekr.20180519065724.251"><vh>class ImplicitNamespaceContext</vh>
<v t="ekr.20180519065724.252"><vh>__init__</vh></v>
<v t="ekr.20180519065724.253"><vh>get_filters</vh></v>
<v t="ekr.20180519065724.254"><vh>name</vh></v>
<v t="ekr.20180519065724.255"><vh>py__file__</vh></v>
<v t="ekr.20180519065724.256"><vh>py__package__</vh></v>
<v t="ekr.20180519065724.257"><vh>py__path__</vh></v>
<v t="ekr.20180519065724.258"><vh>_sub_modules_dict</vh></v>
</v>
</v>
<v t="ekr.20180519065724.259"><vh>@clean __init__.py</vh>
<v t="ekr.20180519065724.260"><vh>Declarations</vh></v>
</v>
</v>
</v>
</v>
<v t="ekr.20180518134900.1"><vh>===== preloading</vh>
<v t="ekr.20180519070853.20"></v>
</v>
<v t="ekr.20180519071037.1"><vh>Found:parser_cache</vh>
<v t="ekr.20180519070853.5"></v>
<v t="ekr.20180519070853.9"></v>
<v t="ekr.20180519070853.20"></v>
<v t="ekr.20180519070853.12"></v>
<v t="ekr.20180519065720.6"></v>
<v t="ekr.20180519070853.16"></v>
<v t="ekr.20180519065720.4"></v>
<v t="ekr.20180519065720.20"></v>
<v t="ekr.20180519065724.19"></v>
<v t="ekr.20180519065720.34"></v>
<v t="ekr.20180519070853.8"></v>
<v t="ekr.20180519070853.10"></v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20180516071358.1">'''Recursively import all python files in a directory and clean the result.'''
@tabwidth -4 # For a better match.
g.cls()
c.recursiveImport(
    
    # dir_ = r'C:\Anaconda3\Lib\site-packages\jedi',
    dir_ = r'C:\Anaconda3\Lib\site-packages\parso',
    kind = '@clean', # '@auto', '@clean', '@nosent','@file',
    add_path=True,
    recursive = True,
    safe_at_file = False,
    theTypes = ['.py',] # ['.py', '.js','.vue',],
)
# c.expandAllSubheads()
</t>
<t tx="ekr.20180516072403.1">saved: jedi.leo

debug.py:25: redefinition of unused '_lazy_colorama_init' from line 6
ERROR: pyflakes: 1 error

refactoring.py:19: 'jedi.parser.python.tree as pt' imported but unused
refactoring.py:185: undefined name 'pr'

_compatibility.py:247: '__builtin__ as builtins' imported but unused
_compatibility.py:265: 'itertools.izip_longest as zip_longest' imported but unused

__init__.py:41: 'jedi.api.Script' imported but unused
__init__.py:41: 'jedi.api.Interpreter' imported but unused
__init__.py:41: 'jedi.api.NotFoundError' imported but unused
__init__.py:41: 'jedi.api.set_debug_function' imported but unused
__init__.py:42: 'jedi.api.preload_module' imported but unused
__init__.py:42: 'jedi.api.defined_names' imported but unused
__init__.py:42: 'jedi.api.names' imported but unused
__init__.py:43: 'jedi.settings' imported but unused

analysis.py:150: local variable 'colon' is assigned to but never used

iterable.py:353: undefined name 'create_evaluated_sequence_set'

precedence.py:7: 'jedi.parser.python.tree' imported but unused

tokenize.py:108: import 'u' from line 21 shadowed by loop variable
tokenize.py:238: undefined name 'endprog'
tokenize.py:241: undefined name 'contstr_start'

unchanged: __init__.py
__init__.py:1: 'jedi.parser.parser.ParserSyntaxError' imported but unused
__init__.py:2: 'jedi.parser.pgen2.pgen.generate_grammar' imported but unused
__init__.py:3: 'jedi.parser.python' imported but unused
__init__.py:8: undefined name 'Parser'
</t>
<t tx="ekr.20180516073042.1"></t>
<t tx="ekr.20180516073049.1"></t>
<t tx="ekr.20180516073122.1"></t>
<t tx="ekr.20180518134900.1">@language rest
@wrap

Caching:
parso.cache.parser_cache contains a pickled version of an entire file/module.

preload_module:
    Script(s, 1, len(s), None).completions()
Script.__init__:
    self._evaluator = Evaluator(self._grammar, sys_path=sys_path)
Evaluator.__init__:
    self.compiled_cache = {}  # see `evaluate.compiled.create()`
create, in evaluate.compiled.__init__.py:
    return CompiledObject(evaluator, obj, parent_context, faked)
CompiledObject.__init__:
    super(CompiledObject, self).__init__(evaluator, parent_context)
@language python

</t>
<t tx="ekr.20180519065720.10">@path C:/Anaconda3/Lib/site-packages/jedi/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065720.11">from jedi._compatibility import encoding, is_py3, u
import os
import time

</t>
<t tx="ekr.20180519065720.12">def _lazy_colorama_init():
    """
    Lazily init colorama if necessary, not to screw up stdout is debug not
    enabled.

    This version of the function does nothing.
    """
    pass

_inited=False

try:
    if os.name == 'nt':
        # Does not work on Windows, as pyreadline and colorama interfere
        raise ImportError
    else:
        # Use colorama for nicer console output.
        from colorama import Fore, init
        from colorama import initialise
        def _lazy_colorama_init():
            """
            Lazily init colorama if necessary, not to screw up stdout is
            debug not enabled.

            This version of the function does init colorama.
            """
            global _inited
            if not _inited:
                # pytest resets the stream at the end - causes troubles. Since
                # after every output the stream is reset automatically we don't
                # need this.
                initialise.atexit_done = True
                try:
                    init(strip=False)
                except Exception:
                    # Colorama fails with initializing under vim and is buggy in
                    # version 0.3.6.
                    pass
            _inited = True

except ImportError:
    class Fore(object):
        RED = ''
        GREEN = ''
        YELLOW = ''
        MAGENTA = ''
        RESET = ''

NOTICE = object()
WARNING = object()
SPEED = object()

enable_speed = False
enable_warning = False
enable_notice = False

# callback, interface: level, str
debug_function = None
_debug_indent = 0
_start_time = time.time()


</t>
<t tx="ekr.20180519065720.13">def reset_time():
    global _start_time, _debug_indent
    _start_time = time.time()
    _debug_indent = 0


</t>
<t tx="ekr.20180519065720.14">def increase_indent(func):
    """Decorator for makin """
    def wrapper(*args, **kwargs):
        global _debug_indent
        _debug_indent += 1
        try:
            return func(*args, **kwargs)
        finally:
            _debug_indent -= 1
    return wrapper


</t>
<t tx="ekr.20180519065720.15">def dbg(message, *args, **kwargs):
    """ Looks at the stack, to see if a debug message should be printed. """
    # Python 2 compatibility, because it doesn't understand default args
    color = kwargs.pop('color', 'GREEN')
    assert color

    if debug_function and enable_notice:
        i = ' ' * _debug_indent
        _lazy_colorama_init()
        debug_function(color, i + 'dbg: ' + message % tuple(u(repr(a)) for a in args))


</t>
<t tx="ekr.20180519065720.16">def warning(message, *args, **kwargs):
    format = kwargs.pop('format', True)
    assert not kwargs

    if debug_function and enable_warning:
        i = ' ' * _debug_indent
        if format:
            message = message % tuple(u(repr(a)) for a in args)
        debug_function('RED', i + 'warning: ' + message)


</t>
<t tx="ekr.20180519065720.17">def speed(name):
    if debug_function and enable_speed:
        now = time.time()
        i = ' ' * _debug_indent
        debug_function('YELLOW', i + 'speed: ' + '%s %s' % (name, now - _start_time))


</t>
<t tx="ekr.20180519065720.18">def print_to_stdout(color, str_out):
    """
    The default debug function that prints to standard out.

    :param str color: A string that is an attribute of ``colorama.Fore``.
    """
    col = getattr(Fore, color)
    _lazy_colorama_init()
    if not is_py3:
        str_out = str_out.encode(encoding, 'replace')
    print(col + str_out + Fore.RESET)


# debug_function = print_to_stdout
</t>
<t tx="ekr.20180519065720.19">@path C:/Anaconda3/Lib/site-packages/jedi/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065720.2"></t>
<t tx="ekr.20180519065720.20">import textwrap
from inspect import cleandoc

from parso.python import tree
from parso.cache import parser_cache

from jedi._compatibility import literal_eval, force_unicode

_EXECUTE_NODES = {'funcdef', 'classdef', 'import_from', 'import_name', 'test',
                  'or_test', 'and_test', 'not_test', 'comparison', 'expr',
                  'xor_expr', 'and_expr', 'shift_expr', 'arith_expr',
                  'atom_expr', 'term', 'factor', 'power', 'atom'}

_FLOW_KEYWORDS = (
    'try', 'except', 'finally', 'else', 'if', 'elif', 'with', 'for', 'while'
)


</t>
<t tx="ekr.20180519065720.21">def get_executable_nodes(node, last_added=False):
    """
    For static analysis.
    """
    result = []
    typ = node.type
    if typ == 'name':
        next_leaf = node.get_next_leaf()
        if last_added is False and node.parent.type != 'param' and next_leaf != '=':
            result.append(node)
    elif typ == 'expr_stmt':
        # I think evaluating the statement (and possibly returned arrays),
        # should be enough for static analysis.
        result.append(node)
        for child in node.children:
            result += get_executable_nodes(child, last_added=True)
    elif typ == 'decorator':
        # decorator
        if node.children[-2] == ')':
            node = node.children[-3]
            if node != '(':
                result += get_executable_nodes(node)
    else:
        try:
            children = node.children
        except AttributeError:
            pass
        else:
            if node.type in _EXECUTE_NODES and not last_added:
                result.append(node)

            for child in children:
                result += get_executable_nodes(child, last_added)

    return result


</t>
<t tx="ekr.20180519065720.22">def get_comp_fors(comp_for):
    yield comp_for
    last = comp_for.children[-1]
    while True:
        if last.type == 'comp_for':
            yield last
        elif not last.type == 'comp_if':
            break
        last = last.children[-1]


</t>
<t tx="ekr.20180519065720.23">def for_stmt_defines_one_name(for_stmt):
    """
    Returns True if only one name is returned: ``for x in y``.
    Returns False if the for loop is more complicated: ``for x, z in y``.

    :returns: bool
    """
    return for_stmt.children[1].type == 'name'


</t>
<t tx="ekr.20180519065720.24">def get_flow_branch_keyword(flow_node, node):
    start_pos = node.start_pos
    if not (flow_node.start_pos &lt; start_pos &lt;= flow_node.end_pos):
        raise ValueError('The node is not part of the flow.')

    keyword = None
    for i, child in enumerate(flow_node.children):
        if start_pos &lt; child.start_pos:
            return keyword
        first_leaf = child.get_first_leaf()
        if first_leaf in _FLOW_KEYWORDS:
            keyword = first_leaf
    return 0

</t>
<t tx="ekr.20180519065720.25">def get_statement_of_position(node, pos):
    for c in node.children:
        if c.start_pos &lt;= pos &lt;= c.end_pos:
            if c.type not in ('decorated', 'simple_stmt', 'suite') \
                    and not isinstance(c, (tree.Flow, tree.ClassOrFunc)):
                return c
            else:
                try:
                    return get_statement_of_position(c, pos)
                except AttributeError:
                    pass  # Must be a non-scope
    return None


</t>
<t tx="ekr.20180519065720.26">def clean_scope_docstring(scope_node):
    """ Returns a cleaned version of the docstring token. """
    node = scope_node.get_doc_node()
    if node is not None:
        # TODO We have to check next leaves until there are no new
        # leaves anymore that might be part of the docstring. A
        # docstring can also look like this: ``'foo' 'bar'
        # Returns a literal cleaned version of the ``Token``.
        cleaned = cleandoc(safe_literal_eval(node.value))
        # Since we want the docstr output to be always unicode, just
        # force it.
        return force_unicode(cleaned)
    return ''


</t>
<t tx="ekr.20180519065720.27">def safe_literal_eval(value):
    first_two = value[:2].lower()
    if first_two[0] == 'f' or first_two in ('fr', 'rf'):
        # literal_eval is not able to resovle f literals. We have to do that
        # manually, but that's right now not implemented.
        return ''

    try:
        return literal_eval(value)
    except SyntaxError:
        # It's possible to create syntax errors with literals like rb'' in
        # Python 2. This should not be possible and in that case just return an
        # empty string.
        # Before Python 3.3 there was a more strict definition in which order
        # you could define literals.
        return ''


</t>
<t tx="ekr.20180519065720.28">def get_call_signature(funcdef, width=72, call_string=None):
    """
    Generate call signature of this function.

    :param width: Fold lines if a line is longer than this value.
    :type width: int
    :arg func_name: Override function name when given.
    :type func_name: str

    :rtype: str
    """
    # Lambdas have no name.
    if call_string is None:
        if funcdef.type == 'lambdef':
            call_string = '&lt;lambda&gt;'
        else:
            call_string = funcdef.name.value
    if funcdef.type == 'lambdef':
        p = '(' + ''.join(param.get_code() for param in funcdef.get_params()).strip() + ')'
    else:
        p = funcdef.children[2].get_code()
    code = call_string + p

    return '\n'.join(textwrap.wrap(code, width))


</t>
<t tx="ekr.20180519065720.29">def get_doc_with_call_signature(scope_node):
    """
    Return a document string including call signature.
    """
    call_signature = None
    if scope_node.type == 'classdef':
        for funcdef in scope_node.iter_funcdefs():
            if funcdef.name.value == '__init__':
                call_signature = \
                    get_call_signature(funcdef, call_string=scope_node.name.value)
    elif scope_node.type in ('funcdef', 'lambdef'):
        call_signature = get_call_signature(scope_node)

    doc = clean_scope_docstring(scope_node)
    if call_signature is None:
        return doc
    return '%s\n\n%s' % (call_signature, doc)


</t>
<t tx="ekr.20180519065720.3">@path C:/Anaconda3/Lib/site-packages/jedi/
@others
@language python
@tabwidth -4
            return result
    return wrapper
</t>
<t tx="ekr.20180519065720.30">def move(node, line_offset):
    """
    Move the `Node` start_pos.
    """
    try:
        children = node.children
    except AttributeError:
        node.line += line_offset
    else:
        for c in children:
            move(c, line_offset)


</t>
<t tx="ekr.20180519065720.31">def get_following_comment_same_line(node):
    """
    returns (as string) any comment that appears on the same line,
    after the node, including the #
    """
    try:
        if node.type == 'for_stmt':
            whitespace = node.children[5].get_first_leaf().prefix
        elif node.type == 'with_stmt':
            whitespace = node.children[3].get_first_leaf().prefix
        elif node.type == 'funcdef':
            # actually on the next line
            whitespace = node.children[4].get_first_leaf().get_next_leaf().prefix
        else:
            whitespace = node.get_last_leaf().get_next_leaf().prefix
    except AttributeError:
        return None
    except ValueError:
        # TODO in some particular cases, the tree doesn't seem to be linked
        # correctly
        return None
    if "#" not in whitespace:
        return None
    comment = whitespace[whitespace.index("#"):]
    if "\r" in comment:
        comment = comment[:comment.index("\r")]
    if "\n" in comment:
        comment = comment[:comment.index("\n")]
    return comment


</t>
<t tx="ekr.20180519065720.32">def is_scope(node):
    return node.type in ('file_input', 'classdef', 'funcdef', 'lambdef', 'comp_for')


</t>
<t tx="ekr.20180519065720.33">def get_parent_scope(node, include_flows=False):
    """
    Returns the underlying scope.
    """
    scope = node.parent
    while scope is not None:
        if include_flows and isinstance(scope, tree.Flow):
            return scope
        if is_scope(scope):
            break
        scope = scope.parent
    return scope


</t>
<t tx="ekr.20180519065720.34">def get_cached_code_lines(grammar, path):
    """
    Basically access the cached code lines in parso. This is not the nicest way
    to do this, but we avoid splitting all the lines again.
    """
    return parser_cache[grammar._hashed][path].lines
</t>
<t tx="ekr.20180519065720.35">@path C:/Anaconda3/Lib/site-packages/jedi/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065720.36">"""
THIS is not in active development, please check
https://github.com/davidhalter/jedi/issues/667 first before editing.

Introduce some basic refactoring functions to |jedi|. This module is still in a
very early development stage and needs much testing and improvement.

.. warning:: I won't do too much here, but if anyone wants to step in, please
             do. Refactoring is none of my priorities

It uses the |jedi| `API &lt;api.html&gt;`_ and supports currently the
following functions (sometimes bug-prone):

- rename
- extract variable
- inline variable
"""
import difflib

from parso import python_bytes_to_unicode, split_lines
from jedi.evaluate import helpers


</t>
<t tx="ekr.20180519065720.37">class Refactoring(object):
    @others
</t>
<t tx="ekr.20180519065720.38">def __init__(self, change_dct):
    """
    :param change_dct: dict(old_path=(new_path, old_lines, new_lines))
    """
    self.change_dct = change_dct

</t>
<t tx="ekr.20180519065720.39">def old_files(self):
    dct = {}
    for old_path, (new_path, old_l, new_l) in self.change_dct.items():
        dct[old_path] = '\n'.join(old_l)
    return dct

</t>
<t tx="ekr.20180519065720.4">"""
This caching is very important for speed and memory optimizations. There's
nothing really spectacular, just some decorators. The following cache types are
available:

- ``time_cache`` can be used to cache something for just a limited time span,
  which can be useful if there's user interaction and the user cannot react
  faster than a certain time.

This module is one of the reasons why |jedi| is not thread-safe. As you can see
there are global variables, which are holding the cache information. Some of
these variables are being cleaned after every API usage.
"""
import time
from functools import wraps

from jedi import settings
from parso.cache import parser_cache

_time_caches = {}


</t>
<t tx="ekr.20180519065720.40">def new_files(self):
    dct = {}
    for old_path, (new_path, old_l, new_l) in self.change_dct.items():
        dct[new_path] = '\n'.join(new_l)
    return dct

</t>
<t tx="ekr.20180519065720.41">def diff(self):
    texts = []
    for old_path, (new_path, old_l, new_l) in self.change_dct.items():
        if old_path:
            udiff = difflib.unified_diff(old_l, new_l)
        else:
            udiff = difflib.unified_diff(old_l, new_l, old_path, new_path)
        texts.append('\n'.join(udiff))
    return '\n'.join(texts)


</t>
<t tx="ekr.20180519065720.42">def rename(script, new_name):
    """ The `args` / `kwargs` params are the same as in `api.Script`.
    :param new_name: The new name of the script.
    :param script: The source Script object.
    :return: list of changed lines/changed files
    """
    return Refactoring(_rename(script.usages(), new_name))


</t>
<t tx="ekr.20180519065720.43">def _rename(names, replace_str):
    """ For both rename and inline. """
    order = sorted(names, key=lambda x: (x.module_path, x.line, x.column),
                   reverse=True)

    def process(path, old_lines, new_lines):
        if new_lines is not None:  # goto next file, save last
            dct[path] = path, old_lines, new_lines

    dct = {}
    current_path = object()
    new_lines = old_lines = None
    for name in order:
        if name.in_builtin_module():
            continue
        if current_path != name.module_path:
            current_path = name.module_path

            process(current_path, old_lines, new_lines)
            if current_path is not None:
                # None means take the source that is a normal param.
                with open(current_path) as f:
                    source = f.read()

            new_lines = split_lines(python_bytes_to_unicode(source))
            old_lines = new_lines[:]

        nr, indent = name.line, name.column
        line = new_lines[nr - 1]
        new_lines[nr - 1] = line[:indent] + replace_str + \
            line[indent + len(name.name):]
    process(current_path, old_lines, new_lines)
    return dct


</t>
<t tx="ekr.20180519065720.44">def extract(script, new_name):
    """ The `args` / `kwargs` params are the same as in `api.Script`.
    :param operation: The refactoring operation to execute.
    :type operation: str
    :type source: str
    :return: list of changed lines/changed files
    """
    new_lines = split_lines(python_bytes_to_unicode(script.source))
    old_lines = new_lines[:]

    user_stmt = script._parser.user_stmt()

    # TODO care for multi-line extracts
    dct = {}
    if user_stmt:
        pos = script._pos
        line_index = pos[0] - 1
        # Be careful here. 'array_for_pos' does not exist in 'helpers'.
        arr, index = helpers.array_for_pos(user_stmt, pos)
        if arr is not None:
            start_pos = arr[index].start_pos
            end_pos = arr[index].end_pos

            # take full line if the start line is different from end line
            e = end_pos[1] if end_pos[0] == start_pos[0] else None
            start_line = new_lines[start_pos[0] - 1]
            text = start_line[start_pos[1]:e]
            for l in range(start_pos[0], end_pos[0] - 1):
                text += '\n' + str(l)
            if e is None:
                end_line = new_lines[end_pos[0] - 1]
                text += '\n' + end_line[:end_pos[1]]

            # remove code from new lines
            t = text.lstrip()
            del_start = start_pos[1] + len(text) - len(t)

            text = t.rstrip()
            del_end = len(t) - len(text)
            if e is None:
                new_lines[end_pos[0] - 1] = end_line[end_pos[1] - del_end:]
                e = len(start_line)
            else:
                e = e - del_end
            start_line = start_line[:del_start] + new_name + start_line[e:]
            new_lines[start_pos[0] - 1] = start_line
            new_lines[start_pos[0]:end_pos[0] - 1] = []

            # add parentheses in multi-line case
            open_brackets = ['(', '[', '{']
            close_brackets = [')', ']', '}']
            if '\n' in text and not (text[0] in open_brackets and text[-1] ==
                                     close_brackets[open_brackets.index(text[0])]):
                text = '(%s)' % text

            # add new line before statement
            indent = user_stmt.start_pos[1]
            new = "%s%s = %s" % (' ' * indent, new_name, text)
            new_lines.insert(line_index, new)
    dct[script.path] = script.path, old_lines, new_lines
    return Refactoring(dct)


</t>
<t tx="ekr.20180519065720.45">def inline(script):
    """
    :type script: api.Script
    """
    new_lines = split_lines(python_bytes_to_unicode(script.source))

    dct = {}

    definitions = script.goto_assignments()
    assert len(definitions) == 1
    stmt = definitions[0]._definition
    usages = script.usages()
    inlines = [r for r in usages
               if not stmt.start_pos &lt;= (r.line, r.column) &lt;= stmt.end_pos]
    inlines = sorted(inlines, key=lambda x: (x.module_path, x.line, x.column),
                     reverse=True)
    expression_list = stmt.expression_list()
    # don't allow multi-line refactorings for now.
    assert stmt.start_pos[0] == stmt.end_pos[0]
    index = stmt.start_pos[0] - 1

    line = new_lines[index]
    replace_str = line[expression_list[0].start_pos[1]:stmt.end_pos[1] + 1]
    replace_str = replace_str.strip()
    # tuples need parentheses
    if expression_list and isinstance(expression_list[0], pr.Array):
        arr = expression_list[0]
        if replace_str[0] not in ['(', '[', '{'] and len(arr) &gt; 1:
            replace_str = '(%s)' % replace_str

    # if it's the only assignment, remove the statement
    if len(stmt.get_defined_names()) == 1:
        line = line[:stmt.start_pos[1]] + line[stmt.end_pos[1]:]

    dct = _rename(inlines, replace_str)
    # remove the empty line
    new_lines = dct[script.path][2]
    if line.strip():
        new_lines[index] = line
    else:
        new_lines.pop(index)

    return Refactoring(dct)
</t>
<t tx="ekr.20180519065720.46">@path C:/Anaconda3/Lib/site-packages/jedi/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065720.47">"""
This module contains variables with global |jedi| settings. To change the
behavior of |jedi|, change the variables defined in :mod:`jedi.settings`.

Plugins should expose an interface so that the user can adjust the
configuration.


Example usage::

    from jedi import settings
    settings.case_insensitive_completion = True


Completion output
~~~~~~~~~~~~~~~~~

.. autodata:: case_insensitive_completion
.. autodata:: add_bracket_after_function
.. autodata:: no_completion_duplicates


Filesystem cache
~~~~~~~~~~~~~~~~

.. autodata:: cache_directory
.. autodata:: use_filesystem_cache


Parser
~~~~~~

.. autodata:: fast_parser


Dynamic stuff
~~~~~~~~~~~~~

.. autodata:: dynamic_array_additions
.. autodata:: dynamic_params
.. autodata:: dynamic_params_for_other_modules
.. autodata:: additional_dynamic_modules
.. autodata:: auto_import_modules


Caching
~~~~~~~

.. autodata:: call_signatures_validity


"""
import os
import platform

# ----------------
# completion output settings
# ----------------

case_insensitive_completion = True
"""
The completion is by default case insensitive.
"""

add_bracket_after_function = False
"""
Adds an opening bracket after a function, because that's normal behaviour.
Removed it again, because in VIM that is not very practical.
"""

no_completion_duplicates = True
"""
If set, completions with the same name don't appear in the output anymore,
but are in the `same_name_completions` attribute.
"""

# ----------------
# Filesystem cache
# ----------------

use_filesystem_cache = True
"""
Use filesystem cache to save once parsed files with pickle.
"""

if platform.system().lower() == 'windows':
    _cache_directory = os.path.join(os.getenv('APPDATA') or '~', 'Jedi',
                                    'Jedi')
elif platform.system().lower() == 'darwin':
    _cache_directory = os.path.join('~', 'Library', 'Caches', 'Jedi')
else:
    _cache_directory = os.path.join(os.getenv('XDG_CACHE_HOME') or '~/.cache',
                                    'jedi')
cache_directory = os.path.expanduser(_cache_directory)
"""
The path where the cache is stored.

On Linux, this defaults to ``~/.cache/jedi/``, on OS X to
``~/Library/Caches/Jedi/`` and on Windows to ``%APPDATA%\\Jedi\\Jedi\\``.
On Linux, if environment variable ``$XDG_CACHE_HOME`` is set,
``$XDG_CACHE_HOME/jedi`` is used instead of the default one.
"""

# ----------------
# parser
# ----------------

fast_parser = True
"""
Use the fast parser. This means that reparsing is only being done if
something has been changed e.g. to a function. If this happens, only the
function is being reparsed.
"""

# ----------------
# dynamic stuff
# ----------------

dynamic_array_additions = True
"""
check for `append`, etc. on arrays: [], {}, () as well as list/set calls.
"""

dynamic_params = True
"""
A dynamic param completion, finds the callees of the function, which define
the params of a function.
"""

dynamic_params_for_other_modules = True
"""
Do the same for other modules.
"""

additional_dynamic_modules = []
"""
Additional modules in which |jedi| checks if statements are to be found. This
is practical for IDEs, that want to administrate their modules themselves.
"""

dynamic_flow_information = True
"""
Check for `isinstance` and other information to infer a type.
"""

auto_import_modules = [
    'hashlib',  # setattr
]
"""
Modules that are not analyzed but imported, although they contain Python code.
This improves autocompletion for libraries that use ``setattr`` or
``globals()`` modifications a lot.
"""

# ----------------
# caching validity (time)
# ----------------

call_signatures_validity = 3.0
"""
Finding function calls might be slow (0.1-0.5s). This is not acceptible for
normal writing. Therefore cache it for a short time.
"""
</t>
<t tx="ekr.20180519065720.48">@path C:/Anaconda3/Lib/site-packages/jedi/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065720.49">"""
Utilities for end-users.
"""

from __future__ import absolute_import
import __main__
from collections import namedtuple
import logging
import traceback
import re
import os
import sys

from parso import split_lines

from jedi import Interpreter
from jedi.api.helpers import get_on_completion_name


READLINE_DEBUG = False


</t>
<t tx="ekr.20180519065720.5">def underscore_memoization(func):
    """
    Decorator for methods::

        class A(object):
            def x(self):
                if self._x:
                    self._x = 10
                return self._x

    Becomes::

        class A(object):
            @underscore_memoization
            def x(self):
                return 10

    A now has an attribute ``_x`` written by this decorator.
    """
    name = '_' + func.__name__

    def wrapper(self):
        try:
            return getattr(self, name)
        except AttributeError:
            result = func(self)
            setattr(self, name, result)
            return result

    return wrapper


</t>
<t tx="ekr.20180519065720.50">def setup_readline(namespace_module=__main__):
    """
    Install Jedi completer to :mod:`readline`.

    This function setups :mod:`readline` to use Jedi in Python interactive
    shell.  If you want to use a custom ``PYTHONSTARTUP`` file (typically
    ``$HOME/.pythonrc.py``), you can add this piece of code::

        try:
            from jedi.utils import setup_readline
            setup_readline()
        except ImportError:
            # Fallback to the stdlib readline completer if it is installed.
            # Taken from http://docs.python.org/2/library/rlcompleter.html
            print("Jedi is not installed, falling back to readline")
            try:
                import readline
                import rlcompleter
                readline.parse_and_bind("tab: complete")
            except ImportError:
                print("Readline is not installed either. No tab completion is enabled.")

    This will fallback to the readline completer if Jedi is not installed.
    The readline completer will only complete names in the global namespace,
    so for example::

        ran&lt;TAB&gt;

    will complete to ``range``

    with both Jedi and readline, but::

        range(10).cou&lt;TAB&gt;

    will show complete to ``range(10).count`` only with Jedi.

    You'll also need to add ``export PYTHONSTARTUP=$HOME/.pythonrc.py`` to
    your shell profile (usually ``.bash_profile`` or ``.profile`` if you use
    bash).

    """
    if READLINE_DEBUG:
        logging.basicConfig(
            filename='/tmp/jedi.log',
            filemode='a',
            level=logging.DEBUG
        )

    class JediRL(object):
        def complete(self, text, state):
            """
            This complete stuff is pretty weird, a generator would make
            a lot more sense, but probably due to backwards compatibility
            this is still the way how it works.

            The only important part is stuff in the ``state == 0`` flow,
            everything else has been copied from the ``rlcompleter`` std.
            library module.
            """
            if state == 0:
                sys.path.insert(0, os.getcwd())
                # Calling python doesn't have a path, so add to sys.path.
                try:
                    logging.debug("Start REPL completion: " + repr(text))
                    interpreter = Interpreter(text, [namespace_module.__dict__])

                    lines = split_lines(text)
                    position = (len(lines), len(lines[-1]))
                    name = get_on_completion_name(
                        interpreter._module_node,
                        lines,
                        position
                    )
                    before = text[:len(text) - len(name)]
                    completions = interpreter.completions()
                    logging.debug("REPL completions: %s", completions)
                except:
                    logging.error("REPL Completion error:\n" + traceback.format_exc())
                    raise
                finally:
                    sys.path.pop(0)

                self.matches = [before + c.name_with_symbols for c in completions]
            try:
                return self.matches[state]
            except IndexError:
                return None

    try:
        # Need to import this one as well to make sure it's executed before
        # this code. This didn't use to be an issue until 3.3. Starting with
        # 3.4 this is different, it always overwrites the completer if it's not
        # already imported here.
        import rlcompleter
        import readline
    except ImportError:
        print("Jedi: Module readline not available.")
    else:
        readline.set_completer(JediRL().complete)
        readline.parse_and_bind("tab: complete")
        # jedi itself does the case matching
        readline.parse_and_bind("set completion-ignore-case on")
        # because it's easier to hit the tab just once
        readline.parse_and_bind("set show-all-if-unmodified")
        readline.parse_and_bind("set show-all-if-ambiguous on")
        # don't repeat all the things written in the readline all the time
        readline.parse_and_bind("set completion-prefix-display-length 2")
        # No delimiters, Jedi handles that.
        readline.set_completer_delims('')


</t>
<t tx="ekr.20180519065720.51">def version_info():
    """
    Returns a namedtuple of Jedi's version, similar to Python's
    ``sys.version_info``.
    """
    Version = namedtuple('Version', 'major, minor, micro')
    from jedi import __version__
    tupl = re.findall('[a-z]+|\d+', __version__)
    return Version(*[x if i == 3 else int(x) for i, x in enumerate(tupl)])
</t>
<t tx="ekr.20180519065720.52">@path C:/Anaconda3/Lib/site-packages/jedi/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065720.53">"""
To ensure compatibility from Python ``2.7`` - ``3.x``, a module has been
created. Clearly there is huge need to use conforming syntax.
"""
import binascii
import errno
import sys
import os
import re
import pkgutil
import warnings
import inspect
import subprocess
try:
    import importlib
except ImportError:
    pass

is_py3 = sys.version_info[0] &gt;= 3
is_py33 = is_py3 and sys.version_info[1] &gt;= 3
is_py34 = is_py3 and sys.version_info[1] &gt;= 4
is_py35 = is_py3 and sys.version_info[1] &gt;= 5
py_version = int(str(sys.version_info[0]) + str(sys.version_info[1]))


</t>
<t tx="ekr.20180519065720.54">class DummyFile(object):
    @others
</t>
<t tx="ekr.20180519065720.55">def __init__(self, loader, string):
    self.loader = loader
    self.string = string

</t>
<t tx="ekr.20180519065720.56">def read(self):
    return self.loader.get_source(self.string)

</t>
<t tx="ekr.20180519065720.57">def close(self):
    del self.loader


</t>
<t tx="ekr.20180519065720.58">def find_module_py34(string, path=None, full_name=None):
    spec = None
    loader = None

    spec = importlib.machinery.PathFinder.find_spec(string, path)
    if spec is not None:
        # We try to disambiguate implicit namespace pkgs with non implicit namespace pkgs
        if not spec.has_location:
            full_name = string if not path else full_name
            implicit_ns_info = ImplicitNSInfo(full_name, spec.submodule_search_locations._path)
            return None, implicit_ns_info, False

        # we have found the tail end of the dotted path
        loader = spec.loader
    return find_module_py33(string, path, loader)


</t>
<t tx="ekr.20180519065720.59">def find_module_py33(string, path=None, loader=None, full_name=None):
    loader = loader or importlib.machinery.PathFinder.find_module(string, path)

    if loader is None and path is None:  # Fallback to find builtins
        try:
            with warnings.catch_warnings(record=True):
                # Mute "DeprecationWarning: Use importlib.util.find_spec()
                # instead." While we should replace that in the future, it's
                # probably good to wait until we deprecate Python 3.3, since
                # it was added in Python 3.4 and find_loader hasn't been
                # removed in 3.6.
                loader = importlib.find_loader(string)
        except ValueError as e:
            # See #491. Importlib might raise a ValueError, to avoid this, we
            # just raise an ImportError to fix the issue.
            raise ImportError("Originally  " + repr(e))

    if loader is None:
        raise ImportError("Couldn't find a loader for {}".format(string))

    try:
        is_package = loader.is_package(string)
        if is_package:
            if hasattr(loader, 'path'):
                module_path = os.path.dirname(loader.path)
            else:
                # At least zipimporter does not have path attribute
                module_path = os.path.dirname(loader.get_filename(string))
            if hasattr(loader, 'archive'):
                module_file = DummyFile(loader, string)
            else:
                module_file = None
        else:
            module_path = loader.get_filename(string)
            module_file = DummyFile(loader, string)
    except AttributeError:
        # ExtensionLoader has not attribute get_filename, instead it has a
        # path attribute that we can use to retrieve the module path
        try:
            module_path = loader.path
            module_file = DummyFile(loader, string)
        except AttributeError:
            module_path = string
            module_file = None
        finally:
            is_package = False

    if hasattr(loader, 'archive'):
        module_path = loader.archive

    return module_file, module_path, is_package


</t>
<t tx="ekr.20180519065720.6">def clear_time_caches(delete_all=False):
    """ Jedi caches many things, that should be completed after each completion
    finishes.

    :param delete_all: Deletes also the cache that is normally not deleted,
        like parser cache, which is important for faster parsing.
    """
    global _time_caches

    if delete_all:
        for cache in _time_caches.values():
            cache.clear()
        parser_cache.clear()
    else:
        # normally just kill the expired entries, not all
        for tc in _time_caches.values():
            # check time_cache for expired entries
            for key, (t, value) in list(tc.items()):
                if t &lt; time.time():
                    # delete expired entries
                    del tc[key]


</t>
<t tx="ekr.20180519065720.60">def find_module_pre_py33(string, path=None, full_name=None):
    # This import is here, because in other places it will raise a
    # DeprecationWarning.
    import imp
    try:
        module_file, module_path, description = imp.find_module(string, path)
        module_type = description[2]
        return module_file, module_path, module_type is imp.PKG_DIRECTORY
    except ImportError:
        pass

    if path is None:
        path = sys.path
    for item in path:
        loader = pkgutil.get_importer(item)
        if loader:
            try:
                loader = loader.find_module(string)
                if loader:
                    is_package = loader.is_package(string)
                    is_archive = hasattr(loader, 'archive')
                    module_path = loader.get_filename(string)
                    if is_package:
                        module_path = os.path.dirname(module_path)
                    if is_archive:
                        module_path = loader.archive
                    file = None
                    if not is_package or is_archive:
                        file = DummyFile(loader, string)
                    return file, module_path, is_package
            except ImportError:
                pass
    raise ImportError("No module named {}".format(string))


find_module = find_module_py33 if is_py33 else find_module_pre_py33
find_module = find_module_py34 if is_py34 else find_module
find_module.__doc__ = """
Provides information about a module.

This function isolates the differences in importing libraries introduced with
python 3.3 on; it gets a module name and optionally a path. It will return a
tuple containin an open file for the module (if not builtin), the filename
or the name of the module if it is a builtin one and a boolean indicating
if the module is contained in a package.
"""


</t>
<t tx="ekr.20180519065720.61">def _iter_modules(paths, prefix=''):
    # Copy of pkgutil.iter_modules adapted to work with namespaces

    for path in paths:
        importer = pkgutil.get_importer(path)

        if not isinstance(importer, importlib.machinery.FileFinder):
            # We're only modifying the case for FileFinder. All the other cases
            # still need to be checked (like zip-importing). Do this by just
            # calling the pkgutil version.
            for mod_info in pkgutil.iter_modules([path], prefix):
                yield mod_info
            continue

        # START COPY OF pkutils._iter_file_finder_modules.
        if importer.path is None or not os.path.isdir(importer.path):
            return

        yielded = {}

        try:
            filenames = os.listdir(importer.path)
        except OSError:
            # ignore unreadable directories like import does
            filenames = []
        filenames.sort()  # handle packages before same-named modules

        for fn in filenames:
            modname = inspect.getmodulename(fn)
            if modname == '__init__' or modname in yielded:
                continue

            # jedi addition: Avoid traversing special directories
            if fn.startswith('.') or fn == '__pycache__':
                continue

            path = os.path.join(importer.path, fn)
            ispkg = False

            if not modname and os.path.isdir(path) and '.' not in fn:
                modname = fn
                # A few jedi modifications: Don't check if there's an
                # __init__.py
                try:
                    os.listdir(path)
                except OSError:
                    # ignore unreadable directories like import does
                    continue
                ispkg = True

            if modname and '.' not in modname:
                yielded[modname] = 1
                yield importer, prefix + modname, ispkg
        # END COPY

iter_modules = _iter_modules if py_version &gt;= 34 else pkgutil.iter_modules


</t>
<t tx="ekr.20180519065720.62">class ImplicitNSInfo(object):
    """Stores information returned from an implicit namespace spec"""
    @others
if is_py3:
    all_suffixes = importlib.machinery.all_suffixes
else:
    def all_suffixes():
        # Is deprecated and raises a warning in Python 3.6.
        import imp
        return [suffix for suffix, _, _ in imp.get_suffixes()]


# unicode function
try:
    unicode = unicode
except NameError:
    unicode = str


# re-raise function
if is_py3:
    def reraise(exception, traceback):
        raise exception.with_traceback(traceback)
else:
    eval(compile("""
def reraise(exception, traceback):
    raise exception, None, traceback
""", 'blub', 'exec'))

reraise.__doc__ = """
Re-raise `exception` with a `traceback` object.

Usage::

    reraise(Exception, sys.exc_info()[2])

"""

</t>
<t tx="ekr.20180519065720.63">def __init__(self, name, paths):
    self.name = name
    self.paths = paths


</t>
<t tx="ekr.20180519065720.64">class Python3Method(object):
    @others
</t>
<t tx="ekr.20180519065720.65">def __init__(self, func):
    self.func = func

</t>
<t tx="ekr.20180519065720.66">def __get__(self, obj, objtype):
    if obj is None:
        return lambda *args, **kwargs: self.func(*args, **kwargs)
    else:
        return lambda *args, **kwargs: self.func(obj, *args, **kwargs)


</t>
<t tx="ekr.20180519065720.67">def use_metaclass(meta, *bases):
    """ Create a class with a metaclass. """
    if not bases:
        bases = (object,)
    return meta("Py2CompatibilityMetaClass", bases, {})


try:
    encoding = sys.stdout.encoding
    if encoding is None:
        encoding = 'utf-8'
except AttributeError:
    encoding = 'ascii'


</t>
<t tx="ekr.20180519065720.68">def u(string, errors='strict'):
    """Cast to unicode DAMMIT!
    Written because Python2 repr always implicitly casts to a string, so we
    have to cast back to a unicode (and we now that we always deal with valid
    unicode, because we check that in the beginning).
    """
    if isinstance(string, bytes):
        return unicode(string, encoding='UTF-8', errors=errors)
    return string


</t>
<t tx="ekr.20180519065720.69">def cast_path(obj):
    """
    Take a bytes or str path and cast it to unicode.

    Apparently it is perfectly fine to pass both byte and unicode objects into
    the sys.path. This probably means that byte paths are normal at other
    places as well.

    Since this just really complicates everything and Python 2.7 will be EOL
    soon anyway, just go with always strings.
    """
    return u(obj, errors='replace')


</t>
<t tx="ekr.20180519065720.7">def call_signature_time_cache(time_add_setting):
    """
    This decorator works as follows: Call it with a setting and after that
    use the function with a callable that returns the key.
    But: This function is only called if the key is not available. After a
    certain amount of time (`time_add_setting`) the cache is invalid.

    If the given key is None, the function will not be cached.
    """
    def _temp(key_func):
        dct = {}
        _time_caches[time_add_setting] = dct

        def wrapper(*args, **kwargs):
            generator = key_func(*args, **kwargs)
            key = next(generator)
            try:
                expiry, value = dct[key]
                if expiry &gt; time.time():
                    return value
            except KeyError:
                pass

            value = next(generator)
            time_add = getattr(settings, time_add_setting)
            if key is not None:
                dct[key] = time.time() + time_add, value
            return value
        return wrapper
    return _temp


</t>
<t tx="ekr.20180519065720.70">def force_unicode(obj):
    # Intentionally don't mix those two up, because those two code paths might
    # be different in the future (maybe windows?).
    return cast_path(obj)


try:
    import builtins  # module name in python 3
except ImportError:
    import __builtin__ as builtins


import ast


</t>
<t tx="ekr.20180519065720.71">def literal_eval(string):
    return ast.literal_eval(string)


try:
    from itertools import zip_longest
except ImportError:
    from itertools import izip_longest as zip_longest  # Python 2

try:
    FileNotFoundError = FileNotFoundError
except NameError:
    FileNotFoundError = IOError

try:
    NotADirectoryError = NotADirectoryError
except NameError:
    NotADirectoryError = IOError


</t>
<t tx="ekr.20180519065720.72">def no_unicode_pprint(dct):
    """
    Python 2/3 dict __repr__ may be different, because of unicode differens
    (with or without a `u` prefix). Normally in doctests we could use `pprint`
    to sort dicts and check for equality, but here we have to write a separate
    function to do that.
    """
    import pprint
    s = pprint.pformat(dct)
    print(re.sub("u'", "'", s))


</t>
<t tx="ekr.20180519065720.73">def print_to_stderr(*args):
    if is_py3:
        eval("print(*args, file=sys.stderr)")
    else:
        print &gt;&gt; sys.stderr, args


</t>
<t tx="ekr.20180519065720.74">def utf8_repr(func):
    """
    ``__repr__`` methods in Python 2 don't allow unicode objects to be
    returned. Therefore cast them to utf-8 bytes in this decorator.
    """
    def wrapper(self):
        result = func(self)
        if isinstance(result, unicode):
            return result.encode('utf-8')
        else:
            return result

    if is_py3:
        return func
    else:
        return wrapper


if is_py3:
    import queue
else:
    import Queue as queue


import pickle
if sys.version_info[:2] == (3, 3):
    """
    Monkeypatch the unpickler in Python 3.3. This is needed, because the
    argument `encoding='bytes'` is not supported in 3.3, but badly needed to
    communicate with Python 2.
    """

    class NewUnpickler(pickle._Unpickler):
        dispatch = dict(pickle._Unpickler.dispatch)

        def _decode_string(self, value):
            # Used to allow strings from Python 2 to be decoded either as
            # bytes or Unicode strings.  This should be used only with the
            # STRING, BINSTRING and SHORT_BINSTRING opcodes.
            if self.encoding == "bytes":
                return value
            else:
                return value.decode(self.encoding, self.errors)

        def load_string(self):
            data = self.readline()[:-1]
            # Strip outermost quotes
            if len(data) &gt;= 2 and data[0] == data[-1] and data[0] in b'"\'':
                data = data[1:-1]
            else:
                raise pickle.UnpicklingError("the STRING opcode argument must be quoted")
            self.append(self._decode_string(pickle.codecs.escape_decode(data)[0]))
        dispatch[pickle.STRING[0]] = load_string

        def load_binstring(self):
            # Deprecated BINSTRING uses signed 32-bit length
            len, = pickle.struct.unpack('&lt;i', self.read(4))
            if len &lt; 0:
                raise pickle.UnpicklingError("BINSTRING pickle has negative byte count")
            data = self.read(len)
            self.append(self._decode_string(data))
        dispatch[pickle.BINSTRING[0]] = load_binstring

        def load_short_binstring(self):
            len = self.read(1)[0]
            data = self.read(len)
            self.append(self._decode_string(data))
        dispatch[pickle.SHORT_BINSTRING[0]] = load_short_binstring

    def load(file, fix_imports=True, encoding="ASCII", errors="strict"):
        return NewUnpickler(file, fix_imports=fix_imports,
                            encoding=encoding, errors=errors).load()

    def loads(s, fix_imports=True, encoding="ASCII", errors="strict"):
        if isinstance(s, str):
            raise TypeError("Can't load pickle from unicode string")
        file = pickle.io.BytesIO(s)
        return NewUnpickler(file, fix_imports=fix_imports,
                            encoding=encoding, errors=errors).load()

    pickle.Unpickler = NewUnpickler
    pickle.load = load
    pickle.loads = loads


_PICKLE_PROTOCOL = 2
is_windows = sys.platform == 'win32'

# The Windows shell on Python 2 consumes all control characters (below 32) and expand on
# all Python versions \n to \r\n.
# pickle starting from protocol version 1 uses binary data, which could not be escaped by
# any normal unicode encoder. Therefore, the only bytes encoder which doesn't produce
# control characters is binascii.hexlify.


</t>
<t tx="ekr.20180519065720.75">def pickle_load(file):
    if is_windows:
        try:
            data = file.readline()
            data = binascii.unhexlify(data.strip())
            if is_py3:
                return pickle.loads(data, encoding='bytes')
            else:
                return pickle.loads(data)
        # Python on Windows don't throw EOF errors for pipes. So reraise them with
        # the correct type, which is cought upwards.
        except OSError:
            raise EOFError()
    else:
        if is_py3:
            return pickle.load(file, encoding='bytes')
        else:
            return pickle.load(file)


</t>
<t tx="ekr.20180519065720.76">def pickle_dump(data, file):
    if is_windows:
        try:
            data = pickle.dumps(data, protocol=_PICKLE_PROTOCOL)
            data = binascii.hexlify(data)
            file.write(data)
            file.write(b'\n')
            # On Python 3.3 flush throws sometimes an error even if the two file writes
            # should done it already before. This could be also computer / speed depending.
            file.flush()
        # Python on Windows don't throw EPIPE errors for pipes. So reraise them with
        # the correct type and error number.
        except OSError:
            raise IOError(errno.EPIPE, "Broken pipe")
    else:
        pickle.dump(data, file, protocol=_PICKLE_PROTOCOL)
        file.flush()


try:
    from inspect import Parameter
except ImportError:
    class Parameter(object):
        POSITIONAL_ONLY = object()
        POSITIONAL_OR_KEYWORD = object()
        VAR_POSITIONAL = object()
        KEYWORD_ONLY = object()
        VAR_KEYWORD = object()


</t>
<t tx="ekr.20180519065720.77">class GeneralizedPopen(subprocess.Popen):
    @others
</t>
<t tx="ekr.20180519065720.78">def __init__(self, *args, **kwargs):
    if os.name == 'nt':
        try:
            # Was introduced in Python 3.7.
            CREATE_NO_WINDOW = subprocess.CREATE_NO_WINDOW
        except AttributeError:
            CREATE_NO_WINDOW = 0x08000000
        kwargs['creationflags'] = CREATE_NO_WINDOW
    super(GeneralizedPopen, self).__init__(*args, **kwargs)
</t>
<t tx="ekr.20180519065720.79">@path C:/Anaconda3/Lib/site-packages/jedi/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065720.8">def time_cache(seconds):
    def decorator(func):
        cache = {}

        @wraps(func)
        def wrapper(*args, **kwargs):
            key = (args, frozenset(kwargs.items()))
            try:
                created, result = cache[key]
                if time.time() &lt; created + seconds:
                    return result
            except KeyError:
                pass
            result = func(*args, **kwargs)
            cache[key] = time.time(), result
            return result

        wrapper.clear_cache = lambda: cache.clear()
        return wrapper
    return decorator


</t>
<t tx="ekr.20180519065720.80">"""
Jedi is a static analysis tool for Python that can be used in IDEs/editors. Its
historic focus is autocompletion, but does static analysis for now as well.
Jedi is fast and is very well tested. It understands Python on a deeper level
than all other static analysis frameworks for Python.

Jedi has support for two different goto functions. It's possible to search for
related names and to list all names in a Python file and infer them. Jedi
understands docstrings and you can use Jedi autocompletion in your REPL as
well.

Jedi uses a very simple API to connect with IDE's. There's a reference
implementation as a `VIM-Plugin &lt;https://github.com/davidhalter/jedi-vim&gt;`_,
which uses Jedi's autocompletion.  We encourage you to use Jedi in your IDEs.
It's really easy.

To give you a simple example how you can use the Jedi library, here is an
example for the autocompletion feature:

&gt;&gt;&gt; import jedi
&gt;&gt;&gt; source = '''
... import datetime
... datetime.da'''
&gt;&gt;&gt; script = jedi.Script(source, 3, len('datetime.da'), 'example.py')
&gt;&gt;&gt; script
&lt;Script: 'example.py'&gt;
&gt;&gt;&gt; completions = script.completions()
&gt;&gt;&gt; completions                                         #doctest: +ELLIPSIS
[&lt;Completion: date&gt;, &lt;Completion: datetime&gt;, ...]
&gt;&gt;&gt; print(completions[0].complete)
te
&gt;&gt;&gt; print(completions[0].name)
date

As you see Jedi is pretty simple and allows you to concentrate on writing a
good text editor, while still having very good IDE features for Python.
"""

__version__ = '0.12.0'

from jedi.api import Script, Interpreter, set_debug_function, \
    preload_module, names
from jedi import settings
from jedi.api.environment import find_virtualenvs, find_system_environments, \
    get_default_environment, InvalidPythonEnvironment, create_environment, \
    get_system_environment
from jedi.api.exceptions import InternalError
</t>
<t tx="ekr.20180519065720.81">@path C:/Anaconda3/Lib/site-packages/jedi/
@others
if len(sys.argv) == 2 and sys.argv[1] == 'repl':
    # don't want to use __main__ only for repl yet, maybe we want to use it for
    # something else. So just use the keyword ``repl`` for now.
    print(join(dirname(abspath(__file__)), 'api', 'replstartup.py'))
elif len(sys.argv) &gt; 1 and sys.argv[1] == 'linter':
    _start_linter()
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065720.82">import sys
from os.path import join, dirname, abspath, isdir


</t>
<t tx="ekr.20180519065720.83">def _start_linter():
    """
    This is a pre-alpha API. You're not supposed to use it at all, except for
    testing. It will very likely change.
    """
    import jedi

    if '--debug' in sys.argv:
        jedi.set_debug_function()

    for path in sys.argv[2:]:
        if path.startswith('--'):
            continue
        if isdir(path):
            import fnmatch
            import os

            paths = []
            for root, dirnames, filenames in os.walk(path):
                for filename in fnmatch.filter(filenames, '*.py'):
                    paths.append(os.path.join(root, filename))
        else:
            paths = [path]

        try:
            for path in paths:
                for error in jedi.Script(path=path)._analysis():
                    print(error)
        except Exception:
            if '--pdb' in sys.argv:
                import traceback
                traceback.print_exc()
                import pdb
                pdb.post_mortem()
            else:
                raise


</t>
<t tx="ekr.20180519065720.84"></t>
<t tx="ekr.20180519065720.87"></t>
<t tx="ekr.20180519065720.88"></t>
<t tx="ekr.20180519065720.9">def memoize_method(method):
    """A normal memoize function."""
    @wraps(method)
    def wrapper(self, *args, **kwargs):
        cache_dict = self.__dict__.setdefault('_memoize_method_dct', {})
        dct = cache_dict.setdefault(method, {})
        key = (args, frozenset(kwargs.items()))
        try:
            return dct[key]
        except KeyError:
            result = method(self, *args, **kwargs)
            dct[key] = result
</t>
<t tx="ekr.20180519065720.90"></t>
<t tx="ekr.20180519065721.100">def _get_class_context_completions(self, is_function=True):
    """
    Autocomplete inherited methods when overriding in child class.
    """
    leaf = self._module_node.get_leaf_for_position(self._position, include_prefixes=True)
    cls = tree.search_ancestor(leaf, 'classdef')
    if isinstance(cls, (tree.Class, tree.Function)):
        # Complete the methods that are defined in the super classes.
        random_context = self._module_context.create_context(
            cls,
            node_is_context=True
        )
    else:
        return

    if cls.start_pos[1] &gt;= leaf.start_pos[1]:
        return

    filters = random_context.get_filters(search_global=False, is_instance=True)
    # The first dict is the dictionary of class itself.
    next(filters)
    for filter in filters:
        for name in filter.values():
            if (name.api_type == 'function') == is_function:
                yield name
</t>
<t tx="ekr.20180519065721.101">@path C:/Anaconda3/Lib/site-packages/jedi/api/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065721.102">"""
Environments are a way to activate different Python versions or Virtualenvs for
static analysis. The Python binary in that environment is going to be executed.
"""
import os
import re
import sys
import hashlib
import filecmp
from subprocess import PIPE
from collections import namedtuple
# When dropping Python 2.7 support we should consider switching to
# `shutil.which`.
from distutils.spawn import find_executable

from jedi._compatibility import GeneralizedPopen
from jedi.cache import memoize_method, time_cache
from jedi.evaluate.compiled.subprocess import get_subprocess, \
    EvaluatorSameProcess, EvaluatorSubprocess

import parso

_VersionInfo = namedtuple('VersionInfo', 'major minor micro')

_SUPPORTED_PYTHONS = ['3.6', '3.5', '3.4', '3.3', '2.7']
_SAFE_PATHS = ['/usr/bin', '/usr/local/bin']
_CURRENT_VERSION = '%s.%s' % (sys.version_info.major, sys.version_info.minor)


</t>
<t tx="ekr.20180519065721.103">class InvalidPythonEnvironment(Exception):
    """
    If you see this exception, the Python executable or Virtualenv you have
    been trying to use is probably not a correct Python version.
    """


</t>
<t tx="ekr.20180519065721.104">class _BaseEnvironment(object):
    @others
</t>
<t tx="ekr.20180519065721.105">@memoize_method
def get_grammar(self):
    version_string = '%s.%s' % (self.version_info.major, self.version_info.minor)
    return parso.load_grammar(version=version_string)

</t>
<t tx="ekr.20180519065721.106">@property
def _sha256(self):
    try:
        return self._hash
    except AttributeError:
        self._hash = _calculate_sha256_for_file(self.executable)
        return self._hash


</t>
<t tx="ekr.20180519065721.107">class Environment(_BaseEnvironment):
    """
    This class is supposed to be created by internal Jedi architecture. You
    should not create it directly. Please use create_environment or the other
    functions instead. It is then returned by that function.
    """
    @others
</t>
<t tx="ekr.20180519065721.108">def __init__(self, path, executable):
    self.path = os.path.abspath(path)
    """
    The path to an environment, matches ``sys.prefix``.
    """
    self.executable = os.path.abspath(executable)
    """
    The Python executable, matches ``sys.executable``.
    """
    self.version_info = self._get_version()
    """

    Like ``sys.version_info``. A tuple to show the current Environment's
    Python version.
    """

</t>
<t tx="ekr.20180519065721.109">def _get_version(self):
    try:
        process = GeneralizedPopen([self.executable, '--version'], stdout=PIPE, stderr=PIPE)
        stdout, stderr = process.communicate()
        retcode = process.poll()
        if retcode:
            raise InvalidPythonEnvironment()
    except OSError:
        raise InvalidPythonEnvironment()

    # Until Python 3.4 wthe version string is part of stderr, after that
    # stdout.
    output = stdout + stderr
    match = re.match(br'Python (\d+)\.(\d+)\.(\d+)', output)
    if match is None:
        raise InvalidPythonEnvironment("--version not working")

    return _VersionInfo(*[int(m) for m in match.groups()])

</t>
<t tx="ekr.20180519065721.110">def __repr__(self):
    version = '.'.join(str(i) for i in self.version_info)
    return '&lt;%s: %s in %s&gt;' % (self.__class__.__name__, version, self.path)

</t>
<t tx="ekr.20180519065721.111">def get_evaluator_subprocess(self, evaluator):
    return EvaluatorSubprocess(evaluator, self._get_subprocess())

</t>
<t tx="ekr.20180519065721.112">def _get_subprocess(self):
    return get_subprocess(self.executable)

</t>
<t tx="ekr.20180519065721.113">@memoize_method
def get_sys_path(self):
    """
    The sys path for this environment. Does not include potential
    modifications like ``sys.path.append``.

    :returns: list of str
    """
    # It's pretty much impossible to generate the sys path without actually
    # executing Python. The sys path (when starting with -S) itself depends
    # on how the Python version was compiled (ENV variables).
    # If you omit -S when starting Python (normal case), additionally
    # site.py gets executed.
    return self._get_subprocess().get_sys_path()


</t>
<t tx="ekr.20180519065721.114">class SameEnvironment(Environment):
    @others
</t>
<t tx="ekr.20180519065721.115">def __init__(self):
    super(SameEnvironment, self).__init__(sys.prefix, sys.executable)

</t>
<t tx="ekr.20180519065721.116">def _get_version(self):
    return _VersionInfo(*sys.version_info[:3])


</t>
<t tx="ekr.20180519065721.117">class InterpreterEnvironment(_BaseEnvironment):
    @others
</t>
<t tx="ekr.20180519065721.118">def __init__(self):
    self.version_info = _VersionInfo(*sys.version_info[:3])

</t>
<t tx="ekr.20180519065721.119">def get_evaluator_subprocess(self, evaluator):
    return EvaluatorSameProcess(evaluator)

</t>
<t tx="ekr.20180519065721.120">def get_sys_path(self):
    return sys.path


</t>
<t tx="ekr.20180519065721.121">def _get_virtual_env_from_var():
    var = os.environ.get('VIRTUAL_ENV')
    if var is not None:
        if var == sys.prefix:
            return SameEnvironment()

        try:
            return create_environment(var)
        except InvalidPythonEnvironment:
            pass


</t>
<t tx="ekr.20180519065721.122">def _calculate_sha256_for_file(path):
    sha256 = hashlib.sha256()
    with open(path, 'rb') as f:
        for block in iter(lambda: f.read(filecmp.BUFSIZE), b''):
            sha256.update(block)
    return sha256.hexdigest()


</t>
<t tx="ekr.20180519065721.123">def get_default_environment():
    """
    Tries to return an active Virtualenv. If there is no VIRTUAL_ENV variable
    set it will return the latest Python version installed on the system. This
    makes it possible to use as many new Python features as possible when using
    autocompletion and other functionality.

    :returns: :class:`Environment`
    """
    virtual_env = _get_virtual_env_from_var()
    if virtual_env is not None:
        return virtual_env

    for environment in find_system_environments():
        return environment

    # If no Python Environment is found, use the environment we're already
    # using.
    return SameEnvironment()


</t>
<t tx="ekr.20180519065721.124">@time_cache(seconds=10 * 60)  # 10 Minutes
def get_cached_default_environment():
    return get_default_environment()


</t>
<t tx="ekr.20180519065721.125">def find_virtualenvs(paths=None, **kwargs):
    """
    :param paths: A list of paths in your file system to be scanned for
        Virtualenvs. It will search in these paths and potentially execute the
        Python binaries. Also the VIRTUAL_ENV variable will be checked if it
        contains a valid Virtualenv.
    :param safe: Default True. In case this is False, it will allow this
        function to execute potential `python` environments. An attacker might
        be able to drop an executable in a path this function is searching by
        default. If the executable has not been installed by root, it will not
        be executed.

    :yields: :class:`Environment`
    """
    def py27_comp(paths=None, safe=True):
        if paths is None:
            paths = []

        _used_paths = set()

        # Using this variable should be safe, because attackers might be able
        # to drop files (via git) but not environment variables.
        virtual_env = _get_virtual_env_from_var()
        if virtual_env is not None:
            yield virtual_env
            _used_paths.add(virtual_env.path)

        for directory in paths:
            if not os.path.isdir(directory):
                continue

            directory = os.path.abspath(directory)
            for path in os.listdir(directory):
                path = os.path.join(directory, path)
                if path in _used_paths:
                    # A path shouldn't be evaluated twice.
                    continue
                _used_paths.add(path)

                try:
                    executable = _get_executable_path(path, safe=safe)
                    yield Environment(path, executable)
                except InvalidPythonEnvironment:
                    pass

    return py27_comp(paths, **kwargs)


</t>
<t tx="ekr.20180519065721.126">def find_system_environments():
    """
    Ignores virtualenvs and returns the Python versions that were installed on
    your system. This might return nothing, if you're running Python e.g. from
    a portable version.

    The environments are sorted from latest to oldest Python version.

    :yields: :class:`Environment`
    """
    for version_string in _SUPPORTED_PYTHONS:
        try:
            yield get_system_environment(version_string)
        except InvalidPythonEnvironment:
            pass


# TODO: the logic to find the Python prefix is much more complicated than that.
# See Modules/getpath.c for UNIX and PC/getpathp.c for Windows in CPython's
# source code. A solution would be to deduce it by running the Python
# interpreter and printing the value of sys.prefix.
</t>
<t tx="ekr.20180519065721.127">def _get_python_prefix(executable):
    if os.name != 'nt':
        return os.path.dirname(os.path.dirname(executable))
    landmark = os.path.join('Lib', 'os.py')
    prefix = os.path.dirname(executable)
    while prefix:
        if os.path.join(prefix, landmark):
            return prefix
        prefix = os.path.dirname(prefix)
    raise InvalidPythonEnvironment(
        "Cannot find prefix of executable %s." % executable)


# TODO: this function should probably return a list of environments since
# multiple Python installations can be found on a system for the same version.
</t>
<t tx="ekr.20180519065721.128">def get_system_environment(version):
    """
    Return the first Python environment found for a string of the form 'X.Y'
    where X and Y are the major and minor versions of Python.

    :raises: :exc:`.InvalidPythonEnvironment`
    :returns: :class:`Environment`
    """
    exe = find_executable('python' + version)
    if exe:
        if exe == sys.executable:
            return SameEnvironment()
        return Environment(_get_python_prefix(exe), exe)

    if os.name == 'nt':
        for prefix, exe in _get_executables_from_windows_registry(version):
            return Environment(prefix, exe)
    raise InvalidPythonEnvironment("Cannot find executable python%s." % version)


</t>
<t tx="ekr.20180519065721.129">def create_environment(path, safe=True):
    """
    Make it possible to create an environment by hand.

    :raises: :exc:`.InvalidPythonEnvironment`
    :returns: :class:`Environment`
    """
    return Environment(path, _get_executable_path(path, safe=safe))


</t>
<t tx="ekr.20180519065721.130">def _get_executable_path(path, safe=True):
    """
    Returns None if it's not actually a virtual env.
    """

    if os.name == 'nt':
        python = os.path.join(path, 'Scripts', 'python.exe')
    else:
        python = os.path.join(path, 'bin', 'python')
    if not os.path.exists(python):
        raise InvalidPythonEnvironment("%s seems to be missing." % python)

    if safe and not _is_safe(python):
        raise InvalidPythonEnvironment("The python binary is potentially unsafe.")
    return python


</t>
<t tx="ekr.20180519065721.131">def _get_executables_from_windows_registry(version):
    # The winreg module is named _winreg on Python 2.
    try:
      import winreg
    except ImportError:
      import _winreg as winreg

    # TODO: support Python Anaconda.
    sub_keys = [
      r'SOFTWARE\Python\PythonCore\{version}\InstallPath',
      r'SOFTWARE\Wow6432Node\Python\PythonCore\{version}\InstallPath',
      r'SOFTWARE\Python\PythonCore\{version}-32\InstallPath',
      r'SOFTWARE\Wow6432Node\Python\PythonCore\{version}-32\InstallPath'
    ]
    for root_key in [winreg.HKEY_CURRENT_USER, winreg.HKEY_LOCAL_MACHINE]:
        for sub_key in sub_keys:
            sub_key = sub_key.format(version=version)
            try:
                with winreg.OpenKey(root_key, sub_key) as key:
                    prefix = winreg.QueryValueEx(key, '')[0]
                    exe = os.path.join(prefix, 'python.exe')
                    if os.path.isfile(exe):
                        yield prefix, exe
            except WindowsError:
                pass


</t>
<t tx="ekr.20180519065721.132">def _is_safe(executable_path):
    # Resolve sym links. A venv typically is a symlink to a known Python
    # binary. Only virtualenvs copy symlinks around.
    real_path = os.path.realpath(executable_path)

    if _is_unix_safe_simple(real_path):
        return True

    # Just check the list of known Python versions. If it's not in there,
    # it's likely an attacker or some Python that was not properly
    # installed in the system.
    for environment in find_system_environments():
        if environment.executable == real_path:
            return True

        # If the versions don't match, just compare the binary files. If we
        # don't do that, only venvs will be working and not virtualenvs.
        # venvs are symlinks while virtualenvs are actual copies of the
        # Python files.
        # This still means that if the system Python is updated and the
        # virtualenv's Python is not (which is probably never going to get
        # upgraded), it will not work with Jedi. IMO that's fine, because
        # people should just be using venv. ~ dave
        if environment._sha256 == _calculate_sha256_for_file(real_path):
            return True
    return False


</t>
<t tx="ekr.20180519065721.133">def _is_unix_safe_simple(real_path):
    if _is_unix_admin():
        # In case we are root, just be conservative and
        # only execute known paths.
        return any(real_path.startswith(p) for p in _SAFE_PATHS)

    uid = os.stat(real_path).st_uid
    # The interpreter needs to be owned by root. This means that it wasn't
    # written by a user and therefore attacking Jedi is not as simple.
    # The attack could look like the following:
    # 1. A user clones a repository.
    # 2. The repository has an innocent looking folder called foobar. jedi
    #    searches for the folder and executes foobar/bin/python --version if
    #    there's also a foobar/bin/activate.
    # 3. The bin/python is obviously not a python script but a bash script or
    #    whatever the attacker wants.
    return uid == 0


</t>
<t tx="ekr.20180519065721.134">def _is_unix_admin():
    try:
        return os.getuid() == 0
    except AttributeError:
        return False  # Windows
</t>
<t tx="ekr.20180519065721.135">@path C:/Anaconda3/Lib/site-packages/jedi/api/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065721.136">class _JediError(Exception):
    pass


</t>
<t tx="ekr.20180519065721.137">class InternalError(_JediError):
    pass


</t>
<t tx="ekr.20180519065721.138">class WrongVersion(_JediError):
    pass
</t>
<t tx="ekr.20180519065721.139">@path C:/Anaconda3/Lib/site-packages/jedi/api/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065721.140">"""
Helpers for the API
"""
import re
from collections import namedtuple
from textwrap import dedent

from parso.python.parser import Parser
from parso.python import tree

from jedi._compatibility import u
from jedi.evaluate.syntax_tree import eval_atom
from jedi.evaluate.helpers import evaluate_call_of_leaf
from jedi.evaluate.compiled import get_string_context_set
from jedi.evaluate.base_context import ContextSet
from jedi.cache import call_signature_time_cache


CompletionParts = namedtuple('CompletionParts', ['path', 'has_dot', 'name'])


</t>
<t tx="ekr.20180519065721.141">def sorted_definitions(defs):
    # Note: `or ''` below is required because `module_path` could be
    return sorted(defs, key=lambda x: (x.module_path or '', x.line or 0, x.column or 0))


</t>
<t tx="ekr.20180519065721.142">def get_on_completion_name(module_node, lines, position):
    leaf = module_node.get_leaf_for_position(position)
    if leaf is None or leaf.type in ('string', 'error_leaf'):
        # Completions inside strings are a bit special, we need to parse the
        # string. The same is true for comments and error_leafs.
        line = lines[position[0] - 1]
        # The first step of completions is to get the name
        return re.search(r'(?!\d)\w+$|$', line[:position[1]]).group(0)
    elif leaf.type not in ('name', 'keyword'):
        return ''

    return leaf.value[:position[1] - leaf.start_pos[1]]


</t>
<t tx="ekr.20180519065721.143">def _get_code(code_lines, start_pos, end_pos):
    # Get relevant lines.
    lines = code_lines[start_pos[0] - 1:end_pos[0]]
    # Remove the parts at the end of the line.
    lines[-1] = lines[-1][:end_pos[1]]
    # Remove first line indentation.
    lines[0] = lines[0][start_pos[1]:]
    return ''.join(lines)


</t>
<t tx="ekr.20180519065721.144">class OnErrorLeaf(Exception):
    @others
</t>
<t tx="ekr.20180519065721.145">@property
def error_leaf(self):
    return self.args[0]


</t>
<t tx="ekr.20180519065721.146">def _get_code_for_stack(code_lines, module_node, position):
    leaf = module_node.get_leaf_for_position(position, include_prefixes=True)
    # It might happen that we're on whitespace or on a comment. This means
    # that we would not get the right leaf.
    if leaf.start_pos &gt;= position:
        # If we're not on a comment simply get the previous leaf and proceed.
        leaf = leaf.get_previous_leaf()
        if leaf is None:
            return u('')  # At the beginning of the file.

    is_after_newline = leaf.type == 'newline'
    while leaf.type == 'newline':
        leaf = leaf.get_previous_leaf()
        if leaf is None:
            return u('')

    if leaf.type == 'error_leaf' or leaf.type == 'string':
        if leaf.start_pos[0] &lt; position[0]:
            # On a different line, we just begin anew.
            return u('')

        # Error leafs cannot be parsed, completion in strings is also
        # impossible.
        raise OnErrorLeaf(leaf)
    else:
        user_stmt = leaf
        while True:
            if user_stmt.parent.type in ('file_input', 'suite', 'simple_stmt'):
                break
            user_stmt = user_stmt.parent

        if is_after_newline:
            if user_stmt.start_pos[1] &gt; position[1]:
                # This means that it's actually a dedent and that means that we
                # start without context (part of a suite).
                return u('')

        # This is basically getting the relevant lines.
        return _get_code(code_lines, user_stmt.get_start_pos_of_prefix(), position)


</t>
<t tx="ekr.20180519065721.147">def get_stack_at_position(grammar, code_lines, module_node, pos):
    """
    Returns the possible node names (e.g. import_from, xor_test or yield_stmt).
    """
    class EndMarkerReached(Exception):
        pass

    def tokenize_without_endmarker(code):
        # TODO This is for now not an official parso API that exists purely
        #   for Jedi.
        tokens = grammar._tokenize(code)
        for token_ in tokens:
            if token_.string == safeword:
                raise EndMarkerReached()
            elif token_.prefix.endswith(safeword):
                # This happens with comments.
                raise EndMarkerReached()
            else:
                yield token_

    # The code might be indedented, just remove it.
    code = dedent(_get_code_for_stack(code_lines, module_node, pos))
    # We use a word to tell Jedi when we have reached the start of the
    # completion.
    # Use Z as a prefix because it's not part of a number suffix.
    safeword = 'ZZZ_USER_WANTS_TO_COMPLETE_HERE_WITH_JEDI'
    code = code + ' ' + safeword

    p = Parser(grammar._pgen_grammar, error_recovery=True)
    try:
        p.parse(tokens=tokenize_without_endmarker(code))
    except EndMarkerReached:
        return Stack(p.pgen_parser.stack)
    raise SystemError("This really shouldn't happen. There's a bug in Jedi.")


</t>
<t tx="ekr.20180519065721.148">class Stack(list):
    @others
</t>
<t tx="ekr.20180519065721.149">def get_node_names(self, grammar):
    for dfa, state, (node_number, nodes) in self:
        yield grammar.number2symbol[node_number]

</t>
<t tx="ekr.20180519065721.150">def get_nodes(self):
    for dfa, state, (node_number, nodes) in self:
        for node in nodes:
            yield node


</t>
<t tx="ekr.20180519065721.151">def get_possible_completion_types(pgen_grammar, stack):
    def add_results(label_index):
        try:
            grammar_labels.append(inversed_tokens[label_index])
        except KeyError:
            try:
                keywords.append(inversed_keywords[label_index])
            except KeyError:
                t, v = pgen_grammar.labels[label_index]
                assert t &gt;= 256
                # See if it's a symbol and if we're in its first set
                inversed_keywords
                itsdfa = pgen_grammar.dfas[t]
                itsstates, itsfirst = itsdfa
                for first_label_index in itsfirst.keys():
                    add_results(first_label_index)

    inversed_keywords = dict((v, k) for k, v in pgen_grammar.keywords.items())
    inversed_tokens = dict((v, k) for k, v in pgen_grammar.tokens.items())

    keywords = []
    grammar_labels = []

    def scan_stack(index):
        dfa, state, node = stack[index]
        states, first = dfa
        arcs = states[state]

        for label_index, new_state in arcs:
            if label_index == 0:
                # An accepting state, check the stack below.
                scan_stack(index - 1)
            else:
                add_results(label_index)

    scan_stack(-1)

    return keywords, grammar_labels


</t>
<t tx="ekr.20180519065721.152">def evaluate_goto_definition(evaluator, context, leaf):
    if leaf.type == 'name':
        # In case of a name we can just use goto_definition which does all the
        # magic itself.
        return evaluator.goto_definitions(context, leaf)

    parent = leaf.parent
    if parent.type == 'atom':
        return context.eval_node(leaf.parent)
    elif parent.type == 'trailer':
        return evaluate_call_of_leaf(context, leaf)
    elif isinstance(leaf, tree.Literal):
        return eval_atom(context, leaf)
    elif leaf.type in ('fstring_string', 'fstring_start', 'fstring_end'):
        return get_string_context_set(evaluator)
    return []


CallSignatureDetails = namedtuple(
    'CallSignatureDetails',
    ['bracket_leaf', 'call_index', 'keyword_name_str']
)


</t>
<t tx="ekr.20180519065721.153">def _get_index_and_key(nodes, position):
    """
    Returns the amount of commas and the keyword argument string.
    """
    nodes_before = [c for c in nodes if c.start_pos &lt; position]
    if nodes_before[-1].type == 'arglist':
        nodes_before = [c for c in nodes_before[-1].children if c.start_pos &lt; position]

    key_str = None

    if nodes_before:
        last = nodes_before[-1]
        if last.type == 'argument' and last.children[1].end_pos &lt;= position:
            # Checked if the argument
            key_str = last.children[0].value
        elif last == '=':
            key_str = nodes_before[-2].value

    return nodes_before.count(','), key_str


</t>
<t tx="ekr.20180519065721.154">def _get_call_signature_details_from_error_node(node, position):
    for index, element in reversed(list(enumerate(node.children))):
        # `index &gt; 0` means that it's a trailer and not an atom.
        if element == '(' and element.end_pos &lt;= position and index &gt; 0:
            # It's an error node, we don't want to match too much, just
            # until the parentheses is enough.
            children = node.children[index:]
            name = element.get_previous_leaf()
            if name is None:
                continue
            if name.type == 'name' or name.parent.type in ('trailer', 'atom'):
                return CallSignatureDetails(
                    element,
                    *_get_index_and_key(children, position)
                )


</t>
<t tx="ekr.20180519065721.155">def get_call_signature_details(module, position):
    leaf = module.get_leaf_for_position(position, include_prefixes=True)
    if leaf.start_pos &gt;= position:
        # Whitespace / comments after the leaf count towards the previous leaf.
        leaf = leaf.get_previous_leaf()
        if leaf is None:
            return None

    if leaf == ')':
        if leaf.end_pos == position:
            leaf = leaf.get_next_leaf()

    # Now that we know where we are in the syntax tree, we start to look at
    # parents for possible function definitions.
    node = leaf.parent
    while node is not None:
        if node.type in ('funcdef', 'classdef'):
            # Don't show call signatures if there's stuff before it that just
            # makes it feel strange to have a call signature.
            return None

        for n in node.children[::-1]:
            if n.start_pos &lt; position and n.type == 'error_node':
                result = _get_call_signature_details_from_error_node(n, position)
                if result is not None:
                    return result

        if node.type == 'trailer' and node.children[0] == '(':
            leaf = node.get_previous_leaf()
            if leaf is None:
                return None
            return CallSignatureDetails(
                node.children[0], *_get_index_and_key(node.children, position))

        node = node.parent

    return None


</t>
<t tx="ekr.20180519065721.156">@call_signature_time_cache("call_signatures_validity")
def cache_call_signatures(evaluator, context, bracket_leaf, code_lines, user_pos):
    """This function calculates the cache key."""
    line_index = user_pos[0] - 1

    before_cursor = code_lines[line_index][:user_pos[1]]
    other_lines = code_lines[bracket_leaf.start_pos[0]:line_index]
    whole = ''.join(other_lines + [before_cursor])
    before_bracket = re.match(r'.*\(', whole, re.DOTALL)

    module_path = context.get_root_context().py__file__()
    if module_path is None:
        yield None  # Don't cache!
    else:
        yield (module_path, before_bracket, bracket_leaf.start_pos)
    yield evaluate_goto_definition(
        evaluator,
        context,
        bracket_leaf.get_previous_leaf()
    )
</t>
<t tx="ekr.20180519065721.157">@path C:/Anaconda3/Lib/site-packages/jedi/api/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065721.158">"""
TODO Some parts of this module are still not well documented.
"""

from jedi.evaluate.context import ModuleContext
from jedi.evaluate import compiled
from jedi.evaluate.compiled import mixed
from jedi.evaluate.compiled.access import create_access_path
from jedi.evaluate.base_context import Context


</t>
<t tx="ekr.20180519065721.159">def _create(evaluator, obj):
    return compiled.create_from_access_path(
        evaluator, create_access_path(evaluator, obj)
    )


</t>
<t tx="ekr.20180519065721.160">class NamespaceObject(object):
    @others
</t>
<t tx="ekr.20180519065721.161">def __init__(self, dct):
    self.__dict__ = dct


</t>
<t tx="ekr.20180519065721.162">class MixedModuleContext(Context):
    type = 'mixed_module'

    @others
</t>
<t tx="ekr.20180519065721.163">def __init__(self, evaluator, tree_module, namespaces, path, code_lines):
    self.evaluator = evaluator
    self._namespaces = namespaces

    self._namespace_objects = [NamespaceObject(n) for n in namespaces]
    self._module_context = ModuleContext(
        evaluator, tree_module,
        path=path,
        code_lines=code_lines
    )
    self.tree_node = tree_module

</t>
<t tx="ekr.20180519065721.164">def get_node(self):
    return self.tree_node

</t>
<t tx="ekr.20180519065721.165">def get_filters(self, *args, **kwargs):
    for filter in self._module_context.get_filters(*args, **kwargs):
        yield filter

    for namespace_obj in self._namespace_objects:
        compiled_object = _create(self.evaluator, namespace_obj)
        mixed_object = mixed.MixedObject(
            self.evaluator,
            parent_context=self,
            compiled_object=compiled_object,
            tree_context=self._module_context
        )
        for filter in mixed_object.get_filters(*args, **kwargs):
            yield filter

</t>
<t tx="ekr.20180519065721.166">@property
def code_lines(self):
    return self._module_context.code_lines

</t>
<t tx="ekr.20180519065721.167">def __getattr__(self, name):
    return getattr(self._module_context, name)
</t>
<t tx="ekr.20180519065721.168">@path C:/Anaconda3/Lib/site-packages/jedi/api/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065721.169">import pydoc

from jedi.evaluate.utils import ignored
from jedi.evaluate.filters import AbstractNameDefinition

try:
    from pydoc_data import topics as pydoc_topics
except ImportError:
    # Python 2
    try:
        import pydoc_topics
    except ImportError:
        # This is for Python 3 embeddable version, which dont have
        # pydoc_data module in its file python3x.zip.
        pydoc_topics = None


</t>
<t tx="ekr.20180519065721.170">def get_operator(evaluator, string, pos):
    return Keyword(evaluator, string, pos)


</t>
<t tx="ekr.20180519065721.171">class KeywordName(AbstractNameDefinition):
    api_type = u'keyword'

    @others
</t>
<t tx="ekr.20180519065721.172">def __init__(self, evaluator, name):
    self.evaluator = evaluator
    self.string_name = name
    self.parent_context = evaluator.builtins_module

</t>
<t tx="ekr.20180519065721.173">def infer(self):
    return [Keyword(self.evaluator, self.string_name, (0, 0))]


</t>
<t tx="ekr.20180519065721.174">class Keyword(object):
    api_type = u'keyword'

    @others
</t>
<t tx="ekr.20180519065721.175">def __init__(self, evaluator, name, pos):
    self.name = KeywordName(evaluator, name)
    self.start_pos = pos
    self.parent = evaluator.builtins_module

</t>
<t tx="ekr.20180519065721.176">@property
def names(self):
    """ For a `parsing.Name` like comparision """
    return [self.name]

</t>
<t tx="ekr.20180519065721.177">def py__doc__(self, include_call_signature=False):
    return imitate_pydoc(self.name.string_name)

</t>
<t tx="ekr.20180519065721.178">def __repr__(self):
    return '&lt;%s: %s&gt;' % (type(self).__name__, self.name)


</t>
<t tx="ekr.20180519065721.179">def imitate_pydoc(string):
    """
    It's not possible to get the pydoc's without starting the annoying pager
    stuff.
    """
    if pydoc_topics is None:
        return ''

    # str needed because of possible unicode stuff in py2k (pydoc doesn't work
    # with unicode strings)
    string = str(string)
    h = pydoc.help
    with ignored(KeyError):
        # try to access symbols
        string = h.symbols[string]
        string, _, related = string.partition(' ')

    get_target = lambda s: h.topics.get(s, h.keywords.get(s))
    while isinstance(string, str):
        string = get_target(string)

    try:
        # is a tuple now
        label, related = string
    except TypeError:
        return ''

    try:
        return pydoc_topics.topics[label].strip() if pydoc_topics else ''
    except KeyError:
        return ''
</t>
<t tx="ekr.20180519065721.180">@path C:/Anaconda3/Lib/site-packages/jedi/api/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065721.181">import os
import json

from jedi._compatibility import FileNotFoundError, NotADirectoryError
from jedi.api.environment import SameEnvironment, \
    get_cached_default_environment
from jedi.api.exceptions import WrongVersion
from jedi._compatibility import force_unicode
from jedi.evaluate.sys_path import discover_buildout_paths
from jedi.evaluate.cache import evaluator_as_method_param_cache
from jedi.common.utils import traverse_parents

_CONFIG_FOLDER = '.jedi'
_CONTAINS_POTENTIAL_PROJECT = 'setup.py', '.git', '.hg', 'requirements.txt', 'MANIFEST.in'

_SERIALIZER_VERSION = 1


</t>
<t tx="ekr.20180519065721.182">def _remove_duplicates_from_path(path):
    used = set()
    for p in path:
        if p in used:
            continue
        used.add(p)
        yield p


</t>
<t tx="ekr.20180519065721.183">def _force_unicode_list(lst):
    return list(map(force_unicode, lst))


</t>
<t tx="ekr.20180519065721.184">class Project(object):
    # TODO serialize environment
    _serializer_ignore_attributes = ('_environment',)
    _environment = None

    @others
</t>
<t tx="ekr.20180519065721.185">@staticmethod
def _get_json_path(base_path):
    return os.path.join(base_path, _CONFIG_FOLDER, 'project.json')

</t>
<t tx="ekr.20180519065721.186">@classmethod
def load(cls, path):
    """
    :param path: The path of the directory you want to use as a project.
    """
    with open(cls._get_json_path(path)) as f:
        version, data = json.load(f)

    if version == 1:
        self = cls.__new__()
        self.__dict__.update(data)
        return self
    else:
        raise WrongVersion(
            "The Jedi version of this project seems newer than what we can handle."
        )

</t>
<t tx="ekr.20180519065721.187">def __init__(self, path, **kwargs):
    """
    :param path: The base path for this project.
    :param sys_path: list of str. You can override the sys path if you
        want. By default the ``sys.path.`` is generated from the
        environment (virtualenvs, etc).
    :param smart_sys_path: If this is enabled (default), adds paths from
        local directories. Otherwise you will have to rely on your packages
        being properly configured on the ``sys.path``.
    """
    def py2_comp(path, environment=None, sys_path=None,
                 smart_sys_path=True, _django=False):
        self._path = path
        if isinstance(environment, SameEnvironment):
            self._environment = environment

        self._sys_path = sys_path
        self._smart_sys_path = smart_sys_path
        self._django = _django

    py2_comp(path, **kwargs)

</t>
<t tx="ekr.20180519065721.188">def _get_base_sys_path(self, environment=None):
    if self._sys_path is not None:
        return self._sys_path

    # The sys path has not been set explicitly.
    if environment is None:
        environment = self.get_environment()

    sys_path = environment.get_sys_path()
    try:
        sys_path.remove('')
    except ValueError:
        pass
    return sys_path

</t>
<t tx="ekr.20180519065721.189">@evaluator_as_method_param_cache()
def _get_sys_path(self, evaluator, environment=None):
    """
    Keep this method private for all users of jedi. However internally this
    one is used like a public method.
    """
    suffixed = []
    prefixed = []

    sys_path = list(self._get_base_sys_path(environment))
    if self._smart_sys_path:
        prefixed.append(self._path)

        if evaluator.script_path is not None:
            suffixed += discover_buildout_paths(evaluator, evaluator.script_path)

            traversed = []
            for parent in traverse_parents(evaluator.script_path):
                traversed.append(parent)
                if parent == self._path:
                    # Don't go futher than the project path.
                    break

            # AFAIK some libraries have imports like `foo.foo.bar`, which
            # leads to the conclusion to by default prefer longer paths
            # rather than shorter ones by default.
            suffixed += reversed(traversed)

    if self._django:
        prefixed.append(self._path)

    path = prefixed + sys_path + suffixed
    return list(_force_unicode_list(_remove_duplicates_from_path(path)))

</t>
<t tx="ekr.20180519065721.190">def save(self):
    data = dict(self.__dict__)
    for attribute in self._serializer_ignore_attributes:
        data.pop(attribute, None)

    with open(self._get_json_path(self._path), 'wb') as f:
        return json.dump((_SERIALIZER_VERSION, data), f)

</t>
<t tx="ekr.20180519065721.191">def get_environment(self):
    if self._environment is None:
        return get_cached_default_environment()

    return self._environment

</t>
<t tx="ekr.20180519065721.192">def __repr__(self):
    return '&lt;%s: %s&gt;' % (self.__class__.__name__, self._path)


</t>
<t tx="ekr.20180519065721.193">def _is_potential_project(path):
    for name in _CONTAINS_POTENTIAL_PROJECT:
        if os.path.exists(os.path.join(path, name)):
            return True
    return False


</t>
<t tx="ekr.20180519065721.194">def _is_django_path(directory):
    """ Detects the path of the very well known Django library (if used) """
    try:
        with open(os.path.join(directory, 'manage.py'), 'rb') as f:
            return b"DJANGO_SETTINGS_MODULE" in f.read()
    except (FileNotFoundError, NotADirectoryError):
        return False

    return False


</t>
<t tx="ekr.20180519065721.195">def get_default_project(path=None):
    if path is None:
        path = os.getcwd()

    check = os.path.realpath(path)
    probable_path = None
    first_no_init_file = None
    for dir in traverse_parents(check, include_current=True):
        try:
            return Project.load(dir)
        except (FileNotFoundError, NotADirectoryError):
            pass

        if first_no_init_file is None:
            if os.path.exists(os.path.join(dir, '__init__.py')):
                # In the case that a __init__.py exists, it's in 99% just a
                # Python package and the project sits at least one level above.
                continue
            else:
                first_no_init_file = dir

        if _is_django_path(dir):
            return Project(dir, _django=True)

        if probable_path is None and _is_potential_project(dir):
            probable_path = dir

    if probable_path is not None:
        # TODO search for setup.py etc
        return Project(probable_path)

    if first_no_init_file is not None:
        return Project(first_no_init_file)

    curdir = path if os.path.isdir(path) else os.path.dirname(path)
    return Project(curdir)
</t>
<t tx="ekr.20180519065721.196">@path C:/Anaconda3/Lib/site-packages/jedi/api/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065721.197">"""
To use Jedi completion in Python interpreter, add the following in your shell
setup (e.g., ``.bashrc``)::

    export PYTHONSTARTUP="$(python -m jedi repl)"

Then you will be able to use Jedi completer in your Python interpreter::

    $ python
    Python 2.7.2+ (default, Jul 20 2012, 22:15:08)
    [GCC 4.6.1] on linux2
    Type "help", "copyright", "credits" or "license" for more information.
    &gt;&gt;&gt; import os
    &gt;&gt;&gt; os.path.join('a', 'b').split().in&lt;TAB&gt;            # doctest: +SKIP
    ..dex   ..sert

"""
import jedi.utils
from jedi import __version__ as __jedi_version__

print('REPL completion using Jedi %s' % __jedi_version__)
jedi.utils.setup_readline()

del jedi

# Note: try not to do many things here, as it will contaminate global
# namespace of the interpreter.
</t>
<t tx="ekr.20180519065721.32"></t>
<t tx="ekr.20180519065721.35"></t>
<t tx="ekr.20180519065721.36">@path C:/Anaconda3/Lib/site-packages/jedi/api/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065721.37">"""
The :mod:`jedi.api.classes` module contains the return classes of the API.
These classes are the much bigger part of the whole API, because they contain
the interesting information about completion and goto operations.
"""
import re

from parso.python.tree import search_ancestor

from jedi import settings
from jedi.evaluate.utils import ignored, unite
from jedi.cache import memoize_method
from jedi.evaluate import imports
from jedi.evaluate import compiled
from jedi.evaluate.imports import ImportName
from jedi.evaluate.context import instance
from jedi.evaluate.context import ClassContext, FunctionContext, FunctionExecutionContext
from jedi.api.keywords import KeywordName


</t>
<t tx="ekr.20180519065721.38">def _sort_names_by_start_pos(names):
    return sorted(names, key=lambda s: s.start_pos or (0, 0))


</t>
<t tx="ekr.20180519065721.39">def defined_names(evaluator, context):
    """
    List sub-definitions (e.g., methods in class).

    :type scope: Scope
    :rtype: list of Definition
    """
    filter = next(context.get_filters(search_global=True))
    names = [name for name in filter.values()]
    return [Definition(evaluator, n) for n in _sort_names_by_start_pos(names)]


</t>
<t tx="ekr.20180519065721.40">class BaseDefinition(object):
    _mapping = {
        'posixpath': 'os.path',
        'riscospath': 'os.path',
        'ntpath': 'os.path',
        'os2emxpath': 'os.path',
        'macpath': 'os.path',
        'genericpath': 'os.path',
        'posix': 'os',
        '_io': 'io',
        '_functools': 'functools',
        '_sqlite3': 'sqlite3',
        '__builtin__': '',
        'builtins': '',
    }

    _tuple_mapping = dict((tuple(k.split('.')), v) for (k, v) in {
        'argparse._ActionsContainer': 'argparse.ArgumentParser',
    }.items())

    @others
</t>
<t tx="ekr.20180519065721.41">def __init__(self, evaluator, name):
    self._evaluator = evaluator
    self._name = name
    """
    An instance of :class:`parso.reprsentation.Name` subclass.
    """
    self.is_keyword = isinstance(self._name, KeywordName)

    # generate a path to the definition
    self._module = name.get_root_context()
    if self.in_builtin_module():
        self.module_path = None
    else:
        self.module_path = self._module.py__file__()
        """Shows the file path of a module. e.g. ``/usr/lib/python2.7/os.py``"""

</t>
<t tx="ekr.20180519065721.42">@property
def name(self):
    """
    Name of variable/function/class/module.

    For example, for ``x = None`` it returns ``'x'``.

    :rtype: str or None
    """
    return self._name.string_name

</t>
<t tx="ekr.20180519065721.43">@property
def type(self):
    """
    The type of the definition.

    Here is an example of the value of this attribute.  Let's consider
    the following source.  As what is in ``variable`` is unambiguous
    to Jedi, :meth:`jedi.Script.goto_definitions` should return a list of
    definition for ``sys``, ``f``, ``C`` and ``x``.

    &gt;&gt;&gt; from jedi import Script
    &gt;&gt;&gt; source = '''
    ... import keyword
    ...
    ... class C:
    ...     pass
    ...
    ... class D:
    ...     pass
    ...
    ... x = D()
    ...
    ... def f():
    ...     pass
    ...
    ... for variable in [keyword, f, C, x]:
    ...     variable'''

    &gt;&gt;&gt; script = Script(source)
    &gt;&gt;&gt; defs = script.goto_definitions()

    Before showing what is in ``defs``, let's sort it by :attr:`line`
    so that it is easy to relate the result to the source code.

    &gt;&gt;&gt; defs = sorted(defs, key=lambda d: d.line)
    &gt;&gt;&gt; defs                           # doctest: +NORMALIZE_WHITESPACE
    [&lt;Definition module keyword&gt;, &lt;Definition class C&gt;,
     &lt;Definition instance D&gt;, &lt;Definition def f&gt;]

    Finally, here is what you can get from :attr:`type`:

    &gt;&gt;&gt; defs = [str(d.type) for d in defs]  # It's unicode and in Py2 has u before it.
    &gt;&gt;&gt; defs[0]
    'module'
    &gt;&gt;&gt; defs[1]
    'class'
    &gt;&gt;&gt; defs[2]
    'instance'
    &gt;&gt;&gt; defs[3]
    'function'

    """
    tree_name = self._name.tree_name
    resolve = False
    if tree_name is not None:
        # TODO move this to their respective names.
        definition = tree_name.get_definition()
        if definition is not None and definition.type == 'import_from' and \
                tree_name.is_definition():
            resolve = True

    if isinstance(self._name, imports.SubModuleName) or resolve:
        for context in self._name.infer():
            return context.api_type
    return self._name.api_type

</t>
<t tx="ekr.20180519065721.44">def _path(self):
    """The path to a module/class/function definition."""
    def to_reverse():
        name = self._name
        if name.api_type == 'module':
            try:
                name = list(name.infer())[0].name
            except IndexError:
                pass

        if name.api_type in 'module':
            module_contexts = name.infer()
            if module_contexts:
                module_context, = module_contexts
                for n in reversed(module_context.py__name__().split('.')):
                    yield n
            else:
                # We don't really know anything about the path here. This
                # module is just an import that would lead in an
                # ImportError. So simply return the name.
                yield name.string_name
                return
        else:
            yield name.string_name

        parent_context = name.parent_context
        while parent_context is not None:
            try:
                method = parent_context.py__name__
            except AttributeError:
                try:
                    yield parent_context.name.string_name
                except AttributeError:
                    pass
            else:
                for name in reversed(method().split('.')):
                    yield name
            parent_context = parent_context.parent_context
    return reversed(list(to_reverse()))

</t>
<t tx="ekr.20180519065721.45">@property
def module_name(self):
    """
    The module name.

    &gt;&gt;&gt; from jedi import Script
    &gt;&gt;&gt; source = 'import json'
    &gt;&gt;&gt; script = Script(source, path='example.py')
    &gt;&gt;&gt; d = script.goto_definitions()[0]
    &gt;&gt;&gt; print(d.module_name)                       # doctest: +ELLIPSIS
    json
    """
    return self._module.name.string_name

</t>
<t tx="ekr.20180519065721.46">def in_builtin_module(self):
    """Whether this is a builtin module."""
    return isinstance(self._module, compiled.CompiledObject)

</t>
<t tx="ekr.20180519065721.47">@property
def line(self):
    """The line where the definition occurs (starting with 1)."""
    start_pos = self._name.start_pos
    if start_pos is None:
        return None
    return start_pos[0]

</t>
<t tx="ekr.20180519065721.48">@property
def column(self):
    """The column where the definition occurs (starting with 0)."""
    start_pos = self._name.start_pos
    if start_pos is None:
        return None
    return start_pos[1]

</t>
<t tx="ekr.20180519065721.49">def docstring(self, raw=False, fast=True):
    r"""
    Return a document string for this completion object.

    Example:

    &gt;&gt;&gt; from jedi import Script
    &gt;&gt;&gt; source = '''\
    ... def f(a, b=1):
    ...     "Document for function f."
    ... '''
    &gt;&gt;&gt; script = Script(source, 1, len('def f'), 'example.py')
    &gt;&gt;&gt; doc = script.goto_definitions()[0].docstring()
    &gt;&gt;&gt; print(doc)
    f(a, b=1)
    &lt;BLANKLINE&gt;
    Document for function f.

    Notice that useful extra information is added to the actual
    docstring.  For function, it is call signature.  If you need
    actual docstring, use ``raw=True`` instead.

    &gt;&gt;&gt; print(script.goto_definitions()[0].docstring(raw=True))
    Document for function f.

    :param fast: Don't follow imports that are only one level deep like
        ``import foo``, but follow ``from foo import bar``. This makes
        sense for speed reasons. Completing `import a` is slow if you use
        the ``foo.docstring(fast=False)`` on every object, because it
        parses all libraries starting with ``a``.
    """
    return _Help(self._name).docstring(fast=fast, raw=raw)

</t>
<t tx="ekr.20180519065721.50">@property
def description(self):
    """A textual description of the object."""
    return self._name.string_name

</t>
<t tx="ekr.20180519065721.51">@property
def full_name(self):
    """
    Dot-separated path of this object.

    It is in the form of ``&lt;module&gt;[.&lt;submodule&gt;[...]][.&lt;object&gt;]``.
    It is useful when you want to look up Python manual of the
    object at hand.

    Example:

    &gt;&gt;&gt; from jedi import Script
    &gt;&gt;&gt; source = '''
    ... import os
    ... os.path.join'''
    &gt;&gt;&gt; script = Script(source, 3, len('os.path.join'), 'example.py')
    &gt;&gt;&gt; print(script.goto_definitions()[0].full_name)
    os.path.join

    Notice that it returns ``'os.path.join'`` instead of (for example)
    ``'posixpath.join'``. This is not correct, since the modules name would
    be ``&lt;module 'posixpath' ...&gt;```. However most users find the latter
    more practical.
    """
    path = list(self._path())
    # TODO add further checks, the mapping should only occur on stdlib.
    if not path:
        return None  # for keywords the path is empty

    with ignored(KeyError):
        path[0] = self._mapping[path[0]]
    for key, repl in self._tuple_mapping.items():
        if tuple(path[:len(key)]) == key:
            path = [repl] + path[len(key):]

    return '.'.join(path if path[0] else path[1:])

</t>
<t tx="ekr.20180519065721.52">def goto_assignments(self):
    if self._name.tree_name is None:
        return self

    names = self._evaluator.goto(self._name.parent_context, self._name.tree_name)
    return [Definition(self._evaluator, n) for n in names]

</t>
<t tx="ekr.20180519065721.53">def _goto_definitions(self):
    # TODO make this function public.
    return [Definition(self._evaluator, d.name) for d in self._name.infer()]

</t>
<t tx="ekr.20180519065721.54">@property
@memoize_method
def params(self):
    """
    Raises an ``AttributeError``if the definition is not callable.
    Otherwise returns a list of `Definition` that represents the params.
    """
    def get_param_names(context):
        param_names = []
        if context.api_type == 'function':
            param_names = list(context.get_param_names())
            if isinstance(context, instance.BoundMethod):
                param_names = param_names[1:]
        elif isinstance(context, (instance.AbstractInstanceContext, ClassContext)):
            if isinstance(context, ClassContext):
                search = u'__init__'
            else:
                search = u'__call__'
            names = context.get_function_slot_names(search)
            if not names:
                return []

            # Just take the first one here, not optimal, but currently
            # there's no better solution.
            inferred = names[0].infer()
            param_names = get_param_names(next(iter(inferred)))
            if isinstance(context, ClassContext):
                param_names = param_names[1:]
            return param_names
        elif isinstance(context, compiled.CompiledObject):
            return list(context.get_param_names())
        return param_names

    followed = list(self._name.infer())
    if not followed or not hasattr(followed[0], 'py__call__'):
        raise AttributeError()
    context = followed[0]  # only check the first one.

    return [Definition(self._evaluator, n) for n in get_param_names(context)]

</t>
<t tx="ekr.20180519065721.55">def parent(self):
    context = self._name.parent_context
    if context is None:
        return None

    if isinstance(context, FunctionExecutionContext):
        # TODO the function context should be a part of the function
        # execution context.
        context = FunctionContext(
            self._evaluator, context.parent_context, context.tree_node)
    return Definition(self._evaluator, context.name)

</t>
<t tx="ekr.20180519065721.56">def __repr__(self):
    return "&lt;%s %s&gt;" % (type(self).__name__, self.description)

</t>
<t tx="ekr.20180519065721.57">def get_line_code(self, before=0, after=0):
    """
    Returns the line of code where this object was defined.

    :param before: Add n lines before the current line to the output.
    :param after: Add n lines after the current line to the output.

    :return str: Returns the line(s) of code or an empty string if it's a
                 builtin.
    """
    if self.in_builtin_module():
        return ''

    lines = self._name.get_root_context().code_lines

    index = self._name.start_pos[0] - 1
    start_index = max(index - before, 0)
    return ''.join(lines[start_index:index + after + 1])


</t>
<t tx="ekr.20180519065721.58">class Completion(BaseDefinition):
    """
    `Completion` objects are returned from :meth:`api.Script.completions`. They
    provide additional information about a completion.
    """
    @others
</t>
<t tx="ekr.20180519065721.59">def __init__(self, evaluator, name, stack, like_name_length):
    super(Completion, self).__init__(evaluator, name)

    self._like_name_length = like_name_length
    self._stack = stack

    # Completion objects with the same Completion name (which means
    # duplicate items in the completion)
    self._same_name_completions = []

</t>
<t tx="ekr.20180519065721.60">def _complete(self, like_name):
    append = ''
    if settings.add_bracket_after_function \
            and self.type == 'Function':
        append = '('

    if self._name.api_type == 'param' and self._stack is not None:
        node_names = list(self._stack.get_node_names(self._evaluator.grammar._pgen_grammar))
        if 'trailer' in node_names and 'argument' not in node_names:
            append += '='

    name = self._name.string_name
    if like_name:
        name = name[self._like_name_length:]
    return name + append

</t>
<t tx="ekr.20180519065721.61">@property
def complete(self):
    """
    Return the rest of the word, e.g. completing ``isinstance``::

        isinstan# &lt;-- Cursor is here

    would return the string 'ce'. It also adds additional stuff, depending
    on your `settings.py`.

    Assuming the following function definition::

        def foo(param=0):
            pass

    completing ``foo(par`` would give a ``Completion`` which `complete`
    would be `am=`


    """
    return self._complete(True)

</t>
<t tx="ekr.20180519065721.62">@property
def name_with_symbols(self):
    """
    Similar to :attr:`name`, but like :attr:`name` returns also the
    symbols, for example assuming the following function definition::

        def foo(param=0):
            pass

    completing ``foo(`` would give a ``Completion`` which
    ``name_with_symbols`` would be "param=".

    """
    return self._complete(False)

</t>
<t tx="ekr.20180519065721.63">def docstring(self, raw=False, fast=True):
    if self._like_name_length &gt;= 3:
        # In this case we can just resolve the like name, because we
        # wouldn't load like &gt; 100 Python modules anymore.
        fast = False
    return super(Completion, self).docstring(raw=raw, fast=fast)

</t>
<t tx="ekr.20180519065721.64">@property
def description(self):
    """Provide a description of the completion object."""
    # TODO improve the class structure.
    return Definition.description.__get__(self)

</t>
<t tx="ekr.20180519065721.65">def __repr__(self):
    return '&lt;%s: %s&gt;' % (type(self).__name__, self._name.string_name)

</t>
<t tx="ekr.20180519065721.66">@memoize_method
def follow_definition(self):
    """
    Return the original definitions. I strongly recommend not using it for
    your completions, because it might slow down |jedi|. If you want to
    read only a few objects (&lt;=20), it might be useful, especially to get
    the original docstrings. The basic problem of this function is that it
    follows all results. This means with 1000 completions (e.g.  numpy),
    it's just PITA-slow.
    """
    defs = self._name.infer()
    return [Definition(self._evaluator, d.name) for d in defs]


</t>
<t tx="ekr.20180519065721.67">class Definition(BaseDefinition):
    """
    *Definition* objects are returned from :meth:`api.Script.goto_assignments`
    or :meth:`api.Script.goto_definitions`.
    """
    @others
</t>
<t tx="ekr.20180519065721.68">def __init__(self, evaluator, definition):
    super(Definition, self).__init__(evaluator, definition)

</t>
<t tx="ekr.20180519065721.69">@property
def description(self):
    """
    A description of the :class:`.Definition` object, which is heavily used
    in testing. e.g. for ``isinstance`` it returns ``def isinstance``.

    Example:

    &gt;&gt;&gt; from jedi import Script
    &gt;&gt;&gt; source = '''
    ... def f():
    ...     pass
    ...
    ... class C:
    ...     pass
    ...
    ... variable = f if random.choice([0,1]) else C'''
    &gt;&gt;&gt; script = Script(source, column=3)  # line is maximum by default
    &gt;&gt;&gt; defs = script.goto_definitions()
    &gt;&gt;&gt; defs = sorted(defs, key=lambda d: d.line)
    &gt;&gt;&gt; defs
    [&lt;Definition def f&gt;, &lt;Definition class C&gt;]
    &gt;&gt;&gt; str(defs[0].description)  # strip literals in python2
    'def f'
    &gt;&gt;&gt; str(defs[1].description)
    'class C'

    """
    typ = self.type
    tree_name = self._name.tree_name
    if typ in ('function', 'class', 'module', 'instance') or tree_name is None:
        if typ == 'function':
            # For the description we want a short and a pythonic way.
            typ = 'def'
        return typ + ' ' + self._name.string_name
    elif typ == 'param':
        code = search_ancestor(tree_name, 'param').get_code(
            include_prefix=False,
            include_comma=False
        )
        return typ + ' ' + code

    definition = tree_name.get_definition() or tree_name
    # Remove the prefix, because that's not what we want for get_code
    # here.
    txt = definition.get_code(include_prefix=False)
    # Delete comments:
    txt = re.sub('#[^\n]+\n', ' ', txt)
    # Delete multi spaces/newlines
    txt = re.sub('\s+', ' ', txt).strip()
    return txt

</t>
<t tx="ekr.20180519065721.70">@property
def desc_with_module(self):
    """
    In addition to the definition, also return the module.

    .. warning:: Don't use this function yet, its behaviour may change. If
        you really need it, talk to me.

    .. todo:: Add full path. This function is should return a
        `module.class.function` path.
    """
    position = '' if self.in_builtin_module else '@%s' % self.line
    return "%s:%s%s" % (self.module_name, self.description, position)

</t>
<t tx="ekr.20180519065721.71">@memoize_method
def defined_names(self):
    """
    List sub-definitions (e.g., methods in class).

    :rtype: list of Definition
    """
    defs = self._name.infer()
    return sorted(
        unite(defined_names(self._evaluator, d) for d in defs),
        key=lambda s: s._name.start_pos or (0, 0)
    )

</t>
<t tx="ekr.20180519065721.72">def is_definition(self):
    """
    Returns True, if defined as a name in a statement, function or class.
    Returns False, if it's a reference to such a definition.
    """
    if self._name.tree_name is None:
        return True
    else:
        return self._name.tree_name.is_definition()

</t>
<t tx="ekr.20180519065721.73">def __eq__(self, other):
    return self._name.start_pos == other._name.start_pos \
        and self.module_path == other.module_path \
        and self.name == other.name \
        and self._evaluator == other._evaluator

</t>
<t tx="ekr.20180519065721.74">def __ne__(self, other):
    return not self.__eq__(other)

</t>
<t tx="ekr.20180519065721.75">def __hash__(self):
    return hash((self._name.start_pos, self.module_path, self.name, self._evaluator))


</t>
<t tx="ekr.20180519065721.76">class CallSignature(Definition):
    """
    `CallSignature` objects is the return value of `Script.function_definition`.
    It knows what functions you are currently in. e.g. `isinstance(` would
    return the `isinstance` function. without `(` it would return nothing.
    """
    @others
</t>
<t tx="ekr.20180519065721.77">def __init__(self, evaluator, executable_name, bracket_start_pos, index, key_name_str):
    super(CallSignature, self).__init__(evaluator, executable_name)
    self._index = index
    self._key_name_str = key_name_str
    self._bracket_start_pos = bracket_start_pos

</t>
<t tx="ekr.20180519065721.78">@property
def index(self):
    """
    The Param index of the current call.
    Returns None if the index cannot be found in the curent call.
    """
    if self._key_name_str is not None:
        for i, param in enumerate(self.params):
            if self._key_name_str == param.name:
                return i
        if self.params:
            param_name = self.params[-1]._name
            if param_name.tree_name is not None:
                if param_name.tree_name.get_definition().star_count == 2:
                    return i
        return None

    if self._index &gt;= len(self.params):
        for i, param in enumerate(self.params):
            tree_name = param._name.tree_name
            if tree_name is not None:
                # *args case
                if tree_name.get_definition().star_count == 1:
                    return i
        return None
    return self._index

</t>
<t tx="ekr.20180519065721.79">@property
def bracket_start(self):
    """
    The indent of the bracket that is responsible for the last function
    call.
    """
    return self._bracket_start_pos

</t>
<t tx="ekr.20180519065721.80">def __repr__(self):
    return '&lt;%s: %s index %s&gt;' % \
        (type(self).__name__, self._name.string_name, self.index)


</t>
<t tx="ekr.20180519065721.81">class _Help(object):
    """
    Temporary implementation, will be used as `Script.help() or something in
    the future.
    """
    @others
</t>
<t tx="ekr.20180519065721.82">def __init__(self, definition):
    self._name = definition

</t>
<t tx="ekr.20180519065721.83">@memoize_method
def _get_contexts(self, fast):
    if isinstance(self._name, ImportName) and fast:
        return {}

    if self._name.api_type == 'statement':
        return {}

    return self._name.infer()

</t>
<t tx="ekr.20180519065721.84">def docstring(self, fast=True, raw=True):
    """
    The docstring ``__doc__`` for any object.

    See :attr:`doc` for example.
    """
    # TODO: Use all of the followed objects as output. Possibly divinding
    # them by a few dashes.
    for context in self._get_contexts(fast=fast):
        return context.py__doc__(include_call_signature=not raw)

    return ''
</t>
<t tx="ekr.20180519065721.85">@path C:/Anaconda3/Lib/site-packages/jedi/api/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065721.86">from parso.python import token
from parso.python import tree
from parso.tree import search_ancestor, Leaf

from jedi._compatibility import Parameter
from jedi import debug
from jedi import settings
from jedi.api import classes
from jedi.api import helpers
from jedi.evaluate import imports
from jedi.api import keywords
from jedi.evaluate.helpers import evaluate_call_of_leaf
from jedi.evaluate.filters import get_global_filters
from jedi.parser_utils import get_statement_of_position


</t>
<t tx="ekr.20180519065721.87">def get_call_signature_param_names(call_signatures):
    # add named params
    for call_sig in call_signatures:
        for p in call_sig.params:
            # Allow protected access, because it's a public API.
            if p._name.get_kind() in (Parameter.POSITIONAL_OR_KEYWORD,
                                      Parameter.KEYWORD_ONLY):
                yield p._name


</t>
<t tx="ekr.20180519065721.88">def filter_names(evaluator, completion_names, stack, like_name):
    comp_dct = {}
    if settings.case_insensitive_completion:
        like_name = like_name.lower()
    for name in completion_names:
        string = name.string_name
        if settings.case_insensitive_completion:
            string = string.lower()

        if string.startswith(like_name):
            new = classes.Completion(
                evaluator,
                name,
                stack,
                len(like_name)
            )
            k = (new.name, new.complete)  # key
            if k in comp_dct and settings.no_completion_duplicates:
                comp_dct[k]._same_name_completions.append(new)
            else:
                comp_dct[k] = new
                yield new


</t>
<t tx="ekr.20180519065721.89">def get_user_scope(module_context, position):
    """
    Returns the scope in which the user resides. This includes flows.
    """
    user_stmt = get_statement_of_position(module_context.tree_node, position)
    if user_stmt is None:
        def scan(scope):
            for s in scope.children:
                if s.start_pos &lt;= position &lt;= s.end_pos:
                    if isinstance(s, (tree.Scope, tree.Flow)):
                        return scan(s) or s
                    elif s.type in ('suite', 'decorated'):
                        return scan(s)
            return None

        scanned_node = scan(module_context.tree_node)
        if scanned_node:
            return module_context.create_context(scanned_node, node_is_context=True)
        return module_context
    else:
        return module_context.create_context(user_stmt)


</t>
<t tx="ekr.20180519065721.90">def get_flow_scope_node(module_node, position):
    node = module_node.get_leaf_for_position(position, include_prefixes=True)
    while not isinstance(node, (tree.Scope, tree.Flow)):
        node = node.parent

    return node


</t>
<t tx="ekr.20180519065721.91">class Completion:
    @others
</t>
<t tx="ekr.20180519065721.92">def __init__(self, evaluator, module, code_lines, position, call_signatures_method):
    self._evaluator = evaluator
    self._module_context = module
    self._module_node = module.tree_node
    self._code_lines = code_lines

    # The first step of completions is to get the name
    self._like_name = helpers.get_on_completion_name(self._module_node, code_lines, position)
    # The actual cursor position is not what we need to calculate
    # everything. We want the start of the name we're on.
    self._position = position[0], position[1] - len(self._like_name)
    self._call_signatures_method = call_signatures_method

</t>
<t tx="ekr.20180519065721.93">def completions(self):
    completion_names = self._get_context_completions()

    completions = filter_names(self._evaluator, completion_names,
                               self.stack, self._like_name)

    return sorted(completions, key=lambda x: (x.name.startswith('__'),
                                              x.name.startswith('_'),
                                              x.name.lower()))

</t>
<t tx="ekr.20180519065721.94">def _get_context_completions(self):
    """
    Analyzes the context that a completion is made in and decides what to
    return.

    Technically this works by generating a parser stack and analysing the
    current stack for possible grammar nodes.

    Possible enhancements:
    - global/nonlocal search global
    - yield from / raise from &lt;- could be only exceptions/generators
    - In args: */**: no completion
    - In params (also lambda): no completion before =
    """

    grammar = self._evaluator.grammar

    try:
        self.stack = helpers.get_stack_at_position(
            grammar, self._code_lines, self._module_node, self._position
        )
    except helpers.OnErrorLeaf as e:
        self.stack = None
        if e.error_leaf.value == '.':
            # After ErrorLeaf's that are dots, we will not do any
            # completions since this probably just confuses the user.
            return []
        # If we don't have a context, just use global completion.

        return self._global_completions()

    allowed_keywords, allowed_tokens = \
        helpers.get_possible_completion_types(grammar._pgen_grammar, self.stack)

    if 'if' in allowed_keywords:
        leaf = self._module_node.get_leaf_for_position(self._position, include_prefixes=True)
        previous_leaf = leaf.get_previous_leaf()

        indent = self._position[1]
        if not (leaf.start_pos &lt;= self._position &lt;= leaf.end_pos):
            indent = leaf.start_pos[1]

        if previous_leaf is not None:
            stmt = previous_leaf
            while True:
                stmt = search_ancestor(
                    stmt, 'if_stmt', 'for_stmt', 'while_stmt', 'try_stmt',
                    'error_node',
                )
                if stmt is None:
                    break

                type_ = stmt.type
                if type_ == 'error_node':
                    first = stmt.children[0]
                    if isinstance(first, Leaf):
                        type_ = first.value + '_stmt'
                # Compare indents
                if stmt.start_pos[1] == indent:
                    if type_ == 'if_stmt':
                        allowed_keywords += ['elif', 'else']
                    elif type_ == 'try_stmt':
                        allowed_keywords += ['except', 'finally', 'else']
                    elif type_ == 'for_stmt':
                        allowed_keywords.append('else')

    completion_names = list(self._get_keyword_completion_names(allowed_keywords))

    if token.NAME in allowed_tokens or token.INDENT in allowed_tokens:
        # This means that we actually have to do type inference.

        symbol_names = list(self.stack.get_node_names(grammar._pgen_grammar))

        nodes = list(self.stack.get_nodes())

        if nodes and nodes[-1] in ('as', 'def', 'class'):
            # No completions for ``with x as foo`` and ``import x as foo``.
            # Also true for defining names as a class or function.
            return list(self._get_class_context_completions(is_function=True))
        elif "import_stmt" in symbol_names:
            level, names = self._parse_dotted_names(nodes, "import_from" in symbol_names)

            only_modules = not ("import_from" in symbol_names and 'import' in nodes)
            completion_names += self._get_importer_names(
                names,
                level,
                only_modules=only_modules,
            )
        elif symbol_names[-1] in ('trailer', 'dotted_name') and nodes[-1] == '.':
            dot = self._module_node.get_leaf_for_position(self._position)
            completion_names += self._trailer_completions(dot.get_previous_leaf())
        else:
            completion_names += self._global_completions()
            completion_names += self._get_class_context_completions(is_function=False)

        if 'trailer' in symbol_names:
            call_signatures = self._call_signatures_method()
            completion_names += get_call_signature_param_names(call_signatures)

    return completion_names

</t>
<t tx="ekr.20180519065721.95">def _get_keyword_completion_names(self, keywords_):
    for k in keywords_:
        yield keywords.KeywordName(self._evaluator, k)

</t>
<t tx="ekr.20180519065721.96">def _global_completions(self):
    context = get_user_scope(self._module_context, self._position)
    debug.dbg('global completion scope: %s', context)
    flow_scope_node = get_flow_scope_node(self._module_node, self._position)
    filters = get_global_filters(
        self._evaluator,
        context,
        self._position,
        origin_scope=flow_scope_node
    )
    completion_names = []
    for filter in filters:
        completion_names += filter.values()
    return completion_names

</t>
<t tx="ekr.20180519065721.97">def _trailer_completions(self, previous_leaf):
    user_context = get_user_scope(self._module_context, self._position)
    evaluation_context = self._evaluator.create_context(
        self._module_context, previous_leaf
    )
    contexts = evaluate_call_of_leaf(evaluation_context, previous_leaf)
    completion_names = []
    debug.dbg('trailer completion contexts: %s', contexts)
    for context in contexts:
        for filter in context.get_filters(
                search_global=False, origin_scope=user_context.tree_node):
            completion_names += filter.values()
    return completion_names

</t>
<t tx="ekr.20180519065721.98">def _parse_dotted_names(self, nodes, is_import_from):
    level = 0
    names = []
    for node in nodes[1:]:
        if node in ('.', '...'):
            if not names:
                level += len(node.value)
        elif node.type == 'dotted_name':
            names += node.children[::2]
        elif node.type == 'name':
            names.append(node)
        elif node == ',':
            if not is_import_from:
                names = []
        else:
            # Here if the keyword `import` comes along it stops checking
            # for names.
            break
    return level, names

</t>
<t tx="ekr.20180519065721.99">def _get_importer_names(self, names, level=0, only_modules=True):
    names = [n.value for n in names]
    i = imports.Importer(self._evaluator, names, self._module_context, level)
    return i.completion_names(self._evaluator, only_modules=only_modules)

</t>
<t tx="ekr.20180519065722.1">@path C:/Anaconda3/Lib/site-packages/jedi/api/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.10">def usages(self, additional_module_paths=()):
    """
    Return :class:`classes.Definition` objects, which contain all
    names that point to the definition of the name under the cursor. This
    is very useful for refactoring (renaming), or to show all usages of a
    variable.

    .. todo:: Implement additional_module_paths

    :rtype: list of :class:`classes.Definition`
    """
    tree_name = self._module_node.get_name_of_position(self._pos)
    if tree_name is None:
        # Must be syntax
        return []

    names = usages.usages(self._get_module(), tree_name)

    definitions = [classes.Definition(self._evaluator, n) for n in names]
    return helpers.sorted_definitions(definitions)

</t>
<t tx="ekr.20180519065722.100">def iterate_contexts(contexts, contextualized_node=None, is_async=False):
    """
    Calls `iterate`, on all contexts but ignores the ordering and just returns
    all contexts that the iterate functions yield.
    """
    return ContextSet.from_sets(
        lazy_context.infer()
        for lazy_context in contexts.iterate(contextualized_node, is_async=is_async)
    )


</t>
<t tx="ekr.20180519065722.101">class TreeContext(Context):
    @others
</t>
<t tx="ekr.20180519065722.102">def __init__(self, evaluator, parent_context=None):
    super(TreeContext, self).__init__(evaluator, parent_context)
    self.predefined_names = {}

</t>
<t tx="ekr.20180519065722.103">def __repr__(self):
    return '&lt;%s: %s&gt;' % (self.__class__.__name__, self.tree_node)


</t>
<t tx="ekr.20180519065722.104">class ContextualizedNode(object):
    @others
</t>
<t tx="ekr.20180519065722.105">def __init__(self, context, node):
    self.context = context
    self.node = node

</t>
<t tx="ekr.20180519065722.106">def get_root_context(self):
    return self.context.get_root_context()

</t>
<t tx="ekr.20180519065722.107">def infer(self):
    return self.context.eval_node(self.node)


</t>
<t tx="ekr.20180519065722.108">class ContextualizedName(ContextualizedNode):
    # TODO merge with TreeNameDefinition?!
    @others
</t>
<t tx="ekr.20180519065722.109">@property
def name(self):
    return self.node

</t>
<t tx="ekr.20180519065722.11">def call_signatures(self):
    """
    Return the function object of the call you're currently in.

    E.g. if the cursor is here::

        abs(# &lt;-- cursor is here

    This would return the ``abs`` function. On the other hand::

        abs()# &lt;-- cursor is here

    This would return an empty list..

    :rtype: list of :class:`classes.CallSignature`
    """
    call_signature_details = \
        helpers.get_call_signature_details(self._module_node, self._pos)
    if call_signature_details is None:
        return []

    context = self._evaluator.create_context(
        self._get_module(),
        call_signature_details.bracket_leaf
    )
    definitions = helpers.cache_call_signatures(
        self._evaluator,
        context,
        call_signature_details.bracket_leaf,
        self._code_lines,
        self._pos
    )
    debug.speed('func_call followed')

    return [classes.CallSignature(self._evaluator, d.name,
                                  call_signature_details.bracket_leaf.start_pos,
                                  call_signature_details.call_index,
                                  call_signature_details.keyword_name_str)
            for d in definitions if hasattr(d, 'py__call__')]

</t>
<t tx="ekr.20180519065722.110">def assignment_indexes(self):
    """
    Returns an array of tuple(int, node) of the indexes that are used in
    tuple assignments.

    For example if the name is ``y`` in the following code::

        x, (y, z) = 2, ''

    would result in ``[(1, xyz_node), (0, yz_node)]``.
    """
    indexes = []
    node = self.node.parent
    compare = self.node
    while node is not None:
        if node.type in ('testlist', 'testlist_comp', 'testlist_star_expr', 'exprlist'):
            for i, child in enumerate(node.children):
                if child == compare:
                    indexes.insert(0, (int(i / 2), node))
                    break
            else:
                raise LookupError("Couldn't find the assignment.")
        elif isinstance(node, (ExprStmt, CompFor)):
            break

        compare = node
        node = node.parent
    return indexes


</t>
<t tx="ekr.20180519065722.111">class ContextSet(BaseContextSet):
    @others
NO_CONTEXTS = ContextSet()


</t>
<t tx="ekr.20180519065722.112">def py__class__(self):
    return ContextSet.from_iterable(c.py__class__() for c in self._set)

</t>
<t tx="ekr.20180519065722.113">def iterate(self, contextualized_node=None, is_async=False):
    from jedi.evaluate.lazy_context import get_merged_lazy_context
    type_iters = [c.iterate(contextualized_node, is_async=is_async) for c in self._set]
    for lazy_contexts in zip_longest(*type_iters):
        yield get_merged_lazy_context(
            [l for l in lazy_contexts if l is not None]
        )


</t>
<t tx="ekr.20180519065722.114">def iterator_to_context_set(func):
    def wrapper(*args, **kwargs):
        return ContextSet.from_iterable(func(*args, **kwargs))

    return wrapper
</t>
<t tx="ekr.20180519065722.115">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.116">"""
- the popular ``_memoize_default`` works like a typical memoize and returns the
  default otherwise.
- ``CachedMetaClass`` uses ``_memoize_default`` to do the same with classes.
"""

_NO_DEFAULT = object()


</t>
<t tx="ekr.20180519065722.117">def _memoize_default(default=_NO_DEFAULT, evaluator_is_first_arg=False, second_arg_is_evaluator=False):
    """ This is a typical memoization decorator, BUT there is one difference:
    To prevent recursion it sets defaults.

    Preventing recursion is in this case the much bigger use than speed. I
    don't think, that there is a big speed difference, but there are many cases
    where recursion could happen (think about a = b; b = a).
    """
    def func(function):
        def wrapper(obj, *args, **kwargs):
            # TODO These checks are kind of ugly and slow.
            if evaluator_is_first_arg:
                cache = obj.memoize_cache
            elif second_arg_is_evaluator:
                cache = args[0].memoize_cache  # needed for meta classes
            else:
                cache = obj.evaluator.memoize_cache

            try:
                memo = cache[function]
            except KeyError:
                memo = {}
                cache[function] = memo

            key = (obj, args, frozenset(kwargs.items()))
            if key in memo:
                return memo[key]
            else:
                if default is not _NO_DEFAULT:
                    memo[key] = default
                rv = function(obj, *args, **kwargs)
                memo[key] = rv
                return rv
        return wrapper

    return func


</t>
<t tx="ekr.20180519065722.118">def evaluator_function_cache(default=_NO_DEFAULT):
    def decorator(func):
        return _memoize_default(default=default, evaluator_is_first_arg=True)(func)

    return decorator


</t>
<t tx="ekr.20180519065722.119">def evaluator_method_cache(default=_NO_DEFAULT):
    def decorator(func):
        return _memoize_default(default=default)(func)

    return decorator


</t>
<t tx="ekr.20180519065722.12">def _analysis(self):
    self._evaluator.is_analysis = True
    self._evaluator.analysis_modules = [self._module_node]
    module = self._get_module()
    try:
        for node in get_executable_nodes(self._module_node):
            context = module.create_context(node)
            if node.type in ('funcdef', 'classdef'):
                # Resolve the decorators.
                tree_name_to_contexts(self._evaluator, context, node.children[1])
            elif isinstance(node, tree.Import):
                import_names = set(node.get_defined_names())
                if node.is_nested():
                    import_names |= set(path[-1] for path in node.get_paths())
                for n in import_names:
                    imports.infer_import(context, n)
            elif node.type == 'expr_stmt':
                types = context.eval_node(node)
                for testlist in node.children[:-1:2]:
                    # Iterate tuples.
                    unpack_tuple_to_dict(context, types, testlist)
            else:
                if node.type == 'name':
                    defs = self._evaluator.goto_definitions(context, node)
                else:
                    defs = evaluate_call_of_leaf(context, node)
                try_iter_content(defs)
            self._evaluator.reset_recursion_limitations()

        ana = [a for a in self._evaluator.analysis if self.path == a.path]
        return sorted(set(ana), key=lambda x: x.line)
    finally:
        self._evaluator.is_analysis = False


</t>
<t tx="ekr.20180519065722.120">def evaluator_as_method_param_cache():
    def decorator(call):
        return _memoize_default(second_arg_is_evaluator=True)(call)

    return decorator


</t>
<t tx="ekr.20180519065722.121">class CachedMetaClass(type):
    """
    This is basically almost the same than the decorator above, it just caches
    class initializations. Either you do it this way or with decorators, but
    with decorators you lose class access (isinstance, etc).
    """
    @others
</t>
<t tx="ekr.20180519065722.122">@evaluator_as_method_param_cache()
def __call__(self, *args, **kwargs):
    return super(CachedMetaClass, self).__call__(*args, **kwargs)
</t>
<t tx="ekr.20180519065722.123">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.124">"""
Docstrings are another source of information for functions and classes.
:mod:`jedi.evaluate.dynamic` tries to find all executions of functions, while
the docstring parsing is much easier. There are three different types of
docstrings that |jedi| understands:

- `Sphinx &lt;http://sphinx-doc.org/markup/desc.html#info-field-lists&gt;`_
- `Epydoc &lt;http://epydoc.sourceforge.net/manual-fields.html&gt;`_
- `Numpydoc &lt;https://github.com/numpy/numpy/blob/master/doc/HOWTO_DOCUMENT.rst.txt&gt;`_

For example, the sphinx annotation ``:type foo: str`` clearly states that the
type of ``foo`` is ``str``.

As an addition to parameter searching, this module also provides return
annotations.
"""

import re
from textwrap import dedent

from parso import parse, ParserSyntaxError

from jedi._compatibility import u
from jedi.evaluate.utils import indent_block
from jedi.evaluate.cache import evaluator_method_cache
from jedi.evaluate.base_context import iterator_to_context_set, ContextSet, \
    NO_CONTEXTS
from jedi.evaluate.lazy_context import LazyKnownContexts


DOCSTRING_PARAM_PATTERNS = [
    r'\s*:type\s+%s:\s*([^\n]+)',  # Sphinx
    r'\s*:param\s+(\w+)\s+%s:[^\n]*',  # Sphinx param with type
    r'\s*@type\s+%s:\s*([^\n]+)',  # Epydoc
]

DOCSTRING_RETURN_PATTERNS = [
    re.compile(r'\s*:rtype:\s*([^\n]+)', re.M),  # Sphinx
    re.compile(r'\s*@rtype:\s*([^\n]+)', re.M),  # Epydoc
]

REST_ROLE_PATTERN = re.compile(r':[^`]+:`([^`]+)`')


_numpy_doc_string_cache = None


</t>
<t tx="ekr.20180519065722.125">def _get_numpy_doc_string_cls():
    global _numpy_doc_string_cache
    try:
        from numpydoc.docscrape import NumpyDocString
        _numpy_doc_string_cache = NumpyDocString
    except ImportError as e:
        _numpy_doc_string_cache = e
    if isinstance(_numpy_doc_string_cache, ImportError):
        raise _numpy_doc_string_cache
    return _numpy_doc_string_cache


</t>
<t tx="ekr.20180519065722.126">def _search_param_in_numpydocstr(docstr, param_str):
    """Search `docstr` (in numpydoc format) for type(-s) of `param_str`."""
    try:
        # This is a non-public API. If it ever changes we should be
        # prepared and return gracefully.
        params = _get_numpy_doc_string_cls()(docstr)._parsed_data['Parameters']
    except (KeyError, AttributeError, ImportError):
        return []
    for p_name, p_type, p_descr in params:
        if p_name == param_str:
            m = re.match('([^,]+(,[^,]+)*?)(,[ ]*optional)?$', p_type)
            if m:
                p_type = m.group(1)
            return list(_expand_typestr(p_type))
    return []


</t>
<t tx="ekr.20180519065722.127">def _search_return_in_numpydocstr(docstr):
    """
    Search `docstr` (in numpydoc format) for type(-s) of function returns.
    """
    try:
        doc = _get_numpy_doc_string_cls()(docstr)
    except ImportError:
        return
    try:
        # This is a non-public API. If it ever changes we should be
        # prepared and return gracefully.
        returns = doc._parsed_data['Returns']
        returns += doc._parsed_data['Yields']
    except (KeyError, AttributeError):
        return
    for r_name, r_type, r_descr in returns:
        # Return names are optional and if so the type is in the name
        if not r_type:
            r_type = r_name
        for type_ in _expand_typestr(r_type):
            yield type_


</t>
<t tx="ekr.20180519065722.128">def _expand_typestr(type_str):
    """
    Attempts to interpret the possible types in `type_str`
    """
    # Check if alternative types are specified with 'or'
    if re.search('\\bor\\b', type_str):
        for t in type_str.split('or'):
            yield t.split('of')[0].strip()
    # Check if like "list of `type`" and set type to list
    elif re.search('\\bof\\b', type_str):
        yield type_str.split('of')[0]
    # Check if type has is a set of valid literal values eg: {'C', 'F', 'A'}
    elif type_str.startswith('{'):
        node = parse(type_str, version='3.6').children[0]
        if node.type == 'atom':
            for leaf in node.children[1].children:
                if leaf.type == 'number':
                    if '.' in leaf.value:
                        yield 'float'
                    else:
                        yield 'int'
                elif leaf.type == 'string':
                    if 'b' in leaf.string_prefix.lower():
                        yield 'bytes'
                    else:
                        yield 'str'
                # Ignore everything else.

    # Otherwise just work with what we have.
    else:
        yield type_str


</t>
<t tx="ekr.20180519065722.129">def _search_param_in_docstr(docstr, param_str):
    """
    Search `docstr` for type(-s) of `param_str`.

    &gt;&gt;&gt; _search_param_in_docstr(':type param: int', 'param')
    ['int']
    &gt;&gt;&gt; _search_param_in_docstr('@type param: int', 'param')
    ['int']
    &gt;&gt;&gt; _search_param_in_docstr(
    ...   ':type param: :class:`threading.Thread`', 'param')
    ['threading.Thread']
    &gt;&gt;&gt; bool(_search_param_in_docstr('no document', 'param'))
    False
    &gt;&gt;&gt; _search_param_in_docstr(':param int param: some description', 'param')
    ['int']

    """
    # look at #40 to see definitions of those params
    patterns = [re.compile(p % re.escape(param_str))
                for p in DOCSTRING_PARAM_PATTERNS]
    for pattern in patterns:
        match = pattern.search(docstr)
        if match:
            return [_strip_rst_role(match.group(1))]

    return _search_param_in_numpydocstr(docstr, param_str)


</t>
<t tx="ekr.20180519065722.13">class Interpreter(Script):
    """
    Jedi API for Python REPLs.

    In addition to completion of simple attribute access, Jedi
    supports code completion based on static code analysis.
    Jedi can complete attributes of object which is not initialized
    yet.

    &gt;&gt;&gt; from os.path import join
    &gt;&gt;&gt; namespace = locals()
    &gt;&gt;&gt; script = Interpreter('join("").up', [namespace])
    &gt;&gt;&gt; print(script.completions()[0].name)
    upper
    """

    @others
</t>
<t tx="ekr.20180519065722.130">def _strip_rst_role(type_str):
    """
    Strip off the part looks like a ReST role in `type_str`.

    &gt;&gt;&gt; _strip_rst_role(':class:`ClassName`')  # strip off :class:
    'ClassName'
    &gt;&gt;&gt; _strip_rst_role(':py:obj:`module.Object`')  # works with domain
    'module.Object'
    &gt;&gt;&gt; _strip_rst_role('ClassName')  # do nothing when not ReST role
    'ClassName'

    See also:
    http://sphinx-doc.org/domains.html#cross-referencing-python-objects

    """
    match = REST_ROLE_PATTERN.match(type_str)
    if match:
        return match.group(1)
    else:
        return type_str


</t>
<t tx="ekr.20180519065722.131">def _evaluate_for_statement_string(module_context, string):
    code = dedent(u("""
    def pseudo_docstring_stuff():
        '''
        Create a pseudo function for docstring statements.
        Need this docstring so that if the below part is not valid Python this
        is still a function.
        '''
    {}
    """))
    if string is None:
        return []

    for element in re.findall('((?:\w+\.)*\w+)\.', string):
        # Try to import module part in dotted name.
        # (e.g., 'threading' in 'threading.Thread').
        string = 'import %s\n' % element + string

    # Take the default grammar here, if we load the Python 2.7 grammar here, it
    # will be impossible to use `...` (Ellipsis) as a token. Docstring types
    # don't need to conform with the current grammar.
    grammar = module_context.evaluator.latest_grammar
    try:
        module = grammar.parse(code.format(indent_block(string)), error_recovery=False)
    except ParserSyntaxError:
        return []
    try:
        funcdef = next(module.iter_funcdefs())
        # First pick suite, then simple_stmt and then the node,
        # which is also not the last item, because there's a newline.
        stmt = funcdef.children[-1].children[-1].children[-2]
    except (AttributeError, IndexError):
        return []

    from jedi.evaluate.context import FunctionContext
    function_context = FunctionContext(
        module_context.evaluator,
        module_context,
        funcdef
    )
    func_execution_context = function_context.get_function_execution()
    # Use the module of the param.
    # TODO this module is not the module of the param in case of a function
    # call. In that case it's the module of the function call.
    # stuffed with content from a function call.
    return list(_execute_types_in_stmt(func_execution_context, stmt))


</t>
<t tx="ekr.20180519065722.132">def _execute_types_in_stmt(module_context, stmt):
    """
    Executing all types or general elements that we find in a statement. This
    doesn't include tuple, list and dict literals, because the stuff they
    contain is executed. (Used as type information).
    """
    definitions = module_context.eval_node(stmt)
    return ContextSet.from_sets(
        _execute_array_values(module_context.evaluator, d)
        for d in definitions
    )


</t>
<t tx="ekr.20180519065722.133">def _execute_array_values(evaluator, array):
    """
    Tuples indicate that there's not just one return value, but the listed
    ones.  `(str, int)` means that it returns a tuple with both types.
    """
    from jedi.evaluate.context.iterable import SequenceLiteralContext, FakeSequence
    if isinstance(array, SequenceLiteralContext):
        values = []
        for lazy_context in array.py__iter__():
            objects = ContextSet.from_sets(
                _execute_array_values(evaluator, typ)
                for typ in lazy_context.infer()
            )
            values.append(LazyKnownContexts(objects))
        return {FakeSequence(evaluator, array.array_type, values)}
    else:
        return array.execute_evaluated()


</t>
<t tx="ekr.20180519065722.134">@evaluator_method_cache()
def infer_param(execution_context, param):
    from jedi.evaluate.context.instance import AnonymousInstanceFunctionExecution

    def eval_docstring(docstring):
        return ContextSet.from_iterable(
            p
            for param_str in _search_param_in_docstr(docstring, param.name.value)
            for p in _evaluate_for_statement_string(module_context, param_str)
        )
    module_context = execution_context.get_root_context()
    func = param.get_parent_function()
    if func.type == 'lambdef':
        return NO_CONTEXTS

    types = eval_docstring(execution_context.py__doc__())
    if isinstance(execution_context, AnonymousInstanceFunctionExecution) and \
            execution_context.function_context.name.string_name == '__init__':
        class_context = execution_context.instance.class_context
        types |= eval_docstring(class_context.py__doc__())

    return types


</t>
<t tx="ekr.20180519065722.135">@evaluator_method_cache()
@iterator_to_context_set
def infer_return_types(function_context):
    def search_return_in_docstr(code):
        for p in DOCSTRING_RETURN_PATTERNS:
            match = p.search(code)
            if match:
                yield _strip_rst_role(match.group(1))
        # Check for numpy style return hint
        for type_ in _search_return_in_numpydocstr(code):
            yield type_

    for type_str in search_return_in_docstr(function_context.py__doc__()):
        for type_eval in _evaluate_for_statement_string(function_context.get_root_context(), type_str):
            yield type_eval
</t>
<t tx="ekr.20180519065722.136">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.137">"""
One of the really important features of |jedi| is to have an option to
understand code like this::

    def foo(bar):
        bar. # completion here
    foo(1)

There's no doubt wheter bar is an ``int`` or not, but if there's also a call
like ``foo('str')``, what would happen? Well, we'll just show both. Because
that's what a human would expect.

It works as follows:

- |Jedi| sees a param
- search for function calls named ``foo``
- execute these calls and check the input.
"""

from parso.python import tree
from jedi import settings
from jedi import debug
from jedi.evaluate.cache import evaluator_function_cache
from jedi.evaluate import imports
from jedi.evaluate.arguments import TreeArguments
from jedi.evaluate.param import create_default_params
from jedi.evaluate.helpers import is_stdlib_path
from jedi.evaluate.utils import to_list
from jedi.parser_utils import get_parent_scope
from jedi.evaluate.context import ModuleContext, instance
from jedi.evaluate.base_context import ContextSet



MAX_PARAM_SEARCHES = 20


</t>
<t tx="ekr.20180519065722.138">class MergedExecutedParams(object):
    """
    Simulates being a parameter while actually just being multiple params.
    """
    @others
</t>
<t tx="ekr.20180519065722.139">def __init__(self, executed_params):
    self._executed_params = executed_params

</t>
<t tx="ekr.20180519065722.14">def __init__(self, source, namespaces, **kwds):
    """
    Parse `source` and mixin interpreted Python objects from `namespaces`.

    :type source: str
    :arg  source: Code to parse.
    :type namespaces: list of dict
    :arg  namespaces: a list of namespace dictionaries such as the one
                      returned by :func:`locals`.

    Other optional arguments are same as the ones for :class:`Script`.
    If `line` and `column` are None, they are assumed be at the end of
    `source`.
    """
    try:
        namespaces = [dict(n) for n in namespaces]
    except Exception:
        raise TypeError("namespaces must be a non-empty list of dicts.")

    environment = kwds.get('environment', None)
    if environment is None:
        environment = InterpreterEnvironment()
    else:
        if not isinstance(environment, InterpreterEnvironment):
            raise TypeError("The environment needs to be an InterpreterEnvironment subclass.")

    super(Interpreter, self).__init__(source, environment=environment, **kwds)
    self.namespaces = namespaces

</t>
<t tx="ekr.20180519065722.140">def infer(self):
    return ContextSet.from_sets(p.infer() for p in self._executed_params)


</t>
<t tx="ekr.20180519065722.141">@debug.increase_indent
def search_params(evaluator, execution_context, funcdef):
    """
    A dynamic search for param values. If you try to complete a type:

    &gt;&gt;&gt; def func(foo):
    ...     foo
    &gt;&gt;&gt; func(1)
    &gt;&gt;&gt; func("")

    It is not known what the type ``foo`` without analysing the whole code. You
    have to look for all calls to ``func`` to find out what ``foo`` possibly
    is.
    """
    if not settings.dynamic_params:
        return create_default_params(execution_context, funcdef)

    evaluator.dynamic_params_depth += 1
    try:
        path = execution_context.get_root_context().py__file__()
        if path is not None and is_stdlib_path(path):
            # We don't want to search for usages in the stdlib. Usually people
            # don't work with it (except if you are a core maintainer, sorry).
            # This makes everything slower. Just disable it and run the tests,
            # you will see the slowdown, especially in 3.6.
            return create_default_params(execution_context, funcdef)

        if funcdef.type == 'lambdef':
            string_name = _get_lambda_name(funcdef)
            if string_name is None:
                return create_default_params(execution_context, funcdef)
        else:
            string_name = funcdef.name.value
        debug.dbg('Dynamic param search in %s.', string_name, color='MAGENTA')

        try:
            module_context = execution_context.get_root_context()
            function_executions = _search_function_executions(
                evaluator,
                module_context,
                funcdef,
                string_name=string_name,
            )
            if function_executions:
                zipped_params = zip(*list(
                    function_execution.get_params()
                    for function_execution in function_executions
                ))
                params = [MergedExecutedParams(executed_params) for executed_params in zipped_params]
                # Evaluate the ExecutedParams to types.
            else:
                return create_default_params(execution_context, funcdef)
        finally:
            debug.dbg('Dynamic param result finished', color='MAGENTA')
        return params
    finally:
        evaluator.dynamic_params_depth -= 1


</t>
<t tx="ekr.20180519065722.142">@evaluator_function_cache(default=None)
@to_list
def _search_function_executions(evaluator, module_context, funcdef, string_name):
    """
    Returns a list of param names.
    """
    compare_node = funcdef
    if string_name == '__init__':
        cls = get_parent_scope(funcdef)
        if isinstance(cls, tree.Class):
            string_name = cls.name.value
            compare_node = cls

    found_executions = False
    i = 0
    for for_mod_context in imports.get_modules_containing_name(
            evaluator, [module_context], string_name):
        if not isinstance(module_context, ModuleContext):
            return
        for name, trailer in _get_possible_nodes(for_mod_context, string_name):
            i += 1

            # This is a simple way to stop Jedi's dynamic param recursion
            # from going wild: The deeper Jedi's in the recursion, the less
            # code should be evaluated.
            if i * evaluator.dynamic_params_depth &gt; MAX_PARAM_SEARCHES:
                return

            random_context = evaluator.create_context(for_mod_context, name)
            for function_execution in _check_name_for_execution(
                    evaluator, random_context, compare_node, name, trailer):
                found_executions = True
                yield function_execution

        # If there are results after processing a module, we're probably
        # good to process. This is a speed optimization.
        if found_executions:
            return


</t>
<t tx="ekr.20180519065722.143">def _get_lambda_name(node):
    stmt = node.parent
    if stmt.type == 'expr_stmt':
        first_operator = next(stmt.yield_operators(), None)
        if first_operator == '=':
            first = stmt.children[0]
            if first.type == 'name':
                return first.value

    return None


</t>
<t tx="ekr.20180519065722.144">def _get_possible_nodes(module_context, func_string_name):
    try:
        names = module_context.tree_node.get_used_names()[func_string_name]
    except KeyError:
        return

    for name in names:
        bracket = name.get_next_leaf()
        trailer = bracket.parent
        if trailer.type == 'trailer' and bracket == '(':
            yield name, trailer


</t>
<t tx="ekr.20180519065722.145">def _check_name_for_execution(evaluator, context, compare_node, name, trailer):
    from jedi.evaluate.context.function import FunctionExecutionContext

    def create_func_excs():
        arglist = trailer.children[1]
        if arglist == ')':
            arglist = None
        args = TreeArguments(evaluator, context, arglist, trailer)
        if value_node.type == 'classdef':
            created_instance = instance.TreeInstance(
                evaluator,
                value.parent_context,
                value,
                args
            )
            for execution in created_instance.create_init_executions():
                yield execution
        else:
            yield value.get_function_execution(args)

    for value in evaluator.goto_definitions(context, name):
        value_node = value.tree_node
        if compare_node == value_node:
            for func_execution in create_func_excs():
                yield func_execution
        elif isinstance(value.parent_context, FunctionExecutionContext) and \
                compare_node.type == 'funcdef':
            # Here we're trying to find decorators by checking the first
            # parameter. It's not very generic though. Should find a better
            # solution that also applies to nested decorators.
            params = value.parent_context.get_params()
            if len(params) != 1:
                continue
            values = params[0].infer()
            nodes = [v.tree_node for v in values]
            if nodes == [compare_node]:
                # Found a decorator.
                module_context = context.get_root_context()
                execution_context = next(create_func_excs())
                for name, trailer in _get_possible_nodes(module_context, params[0].string_name):
                    if value_node.start_pos &lt; name.start_pos &lt; value_node.end_pos:
                        random_context = evaluator.create_context(execution_context, name)
                        iterator = _check_name_for_execution(
                            evaluator,
                            random_context,
                            compare_node,
                            name,
                            trailer
                        )
                        for function_execution in iterator:
                            yield function_execution
</t>
<t tx="ekr.20180519065722.146">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.147">"""
Filters are objects that you can use to filter names in different scopes. They
are needed for name resolution.
"""
from abc import abstractmethod

from parso.tree import search_ancestor

from jedi._compatibility import use_metaclass, Parameter
from jedi.cache import memoize_method
from jedi.evaluate import flow_analysis
from jedi.evaluate.base_context import ContextSet, Context
from jedi.parser_utils import get_parent_scope
from jedi.evaluate.utils import to_list


</t>
<t tx="ekr.20180519065722.148">class AbstractNameDefinition(object):
    start_pos = None
    string_name = None
    parent_context = None
    tree_name = None

    @others
</t>
<t tx="ekr.20180519065722.149">@abstractmethod
def infer(self):
    raise NotImplementedError

</t>
<t tx="ekr.20180519065722.15">def _get_module(self):
    return interpreter.MixedModuleContext(
        self._evaluator,
        self._module_node,
        self.namespaces,
        path=self.path,
        code_lines=self._code_lines,
    )


</t>
<t tx="ekr.20180519065722.150">@abstractmethod
def goto(self):
    # Typically names are already definitions and therefore a goto on that
    # name will always result on itself.
    return {self}

</t>
<t tx="ekr.20180519065722.151">def get_root_context(self):
    return self.parent_context.get_root_context()

</t>
<t tx="ekr.20180519065722.152">def __repr__(self):
    if self.start_pos is None:
        return '&lt;%s: %s&gt;' % (self.__class__.__name__, self.string_name)
    return '&lt;%s: %s@%s&gt;' % (self.__class__.__name__, self.string_name, self.start_pos)

</t>
<t tx="ekr.20180519065722.153">def execute(self, arguments):
    return self.infer().execute(arguments)

</t>
<t tx="ekr.20180519065722.154">def execute_evaluated(self, *args, **kwargs):
    return self.infer().execute_evaluated(*args, **kwargs)

</t>
<t tx="ekr.20180519065722.155">def is_import(self):
    return False

</t>
<t tx="ekr.20180519065722.156">@property
def api_type(self):
    return self.parent_context.api_type


</t>
<t tx="ekr.20180519065722.157">class AbstractTreeName(AbstractNameDefinition):
    @others
</t>
<t tx="ekr.20180519065722.158">def __init__(self, parent_context, tree_name):
    self.parent_context = parent_context
    self.tree_name = tree_name

</t>
<t tx="ekr.20180519065722.159">def goto(self):
    return self.parent_context.evaluator.goto(self.parent_context, self.tree_name)

</t>
<t tx="ekr.20180519065722.16">def names(source=None, path=None, encoding='utf-8', all_scopes=False,
          definitions=True, references=False, environment=None):
    """
    Returns a list of `Definition` objects, containing name parts.
    This means you can call ``Definition.goto_assignments()`` and get the
    reference of a name.
    The parameters are the same as in :py:class:`Script`, except or the
    following ones:

    :param all_scopes: If True lists the names of all scopes instead of only
        the module namespace.
    :param definitions: If True lists the names that have been defined by a
        class, function or a statement (``a = b`` returns ``a``).
    :param references: If True lists all the names that are not listed by
        ``definitions=True``. E.g. ``a = b`` returns ``b``.
    """
    def def_ref_filter(_def):
        is_def = _def._name.tree_name.is_definition()
        return definitions and is_def or references and not is_def

    def create_name(name):
        if name.parent.type == 'param':
            cls = ParamName
        else:
            cls = TreeNameDefinition
        is_module = name.parent.type == 'file_input'
        return cls(
            module_context.create_context(name if is_module else name.parent),
            name
        )

    # Set line/column to a random position, because they don't matter.
    script = Script(source, line=1, column=0, path=path, encoding=encoding, environment=environment)
    module_context = script._get_module()
    defs = [
        classes.Definition(
            script._evaluator,
            create_name(name)
        ) for name in get_module_names(script._module_node, all_scopes)
    ]
    return sorted(filter(def_ref_filter, defs), key=lambda x: (x.line, x.column))


</t>
<t tx="ekr.20180519065722.160">def is_import(self):
    imp = search_ancestor(self.tree_name, 'import_from', 'import_name')
    return imp is not None

</t>
<t tx="ekr.20180519065722.161">@property
def string_name(self):
    return self.tree_name.value

</t>
<t tx="ekr.20180519065722.162">@property
def start_pos(self):
    return self.tree_name.start_pos


</t>
<t tx="ekr.20180519065722.163">class ContextNameMixin(object):
    @others
</t>
<t tx="ekr.20180519065722.164">def infer(self):
    return ContextSet(self._context)

</t>
<t tx="ekr.20180519065722.165">def get_root_context(self):
    if self.parent_context is None:
        return self._context
    return super(ContextNameMixin, self).get_root_context()

</t>
<t tx="ekr.20180519065722.166">@property
def api_type(self):
    return self._context.api_type


</t>
<t tx="ekr.20180519065722.167">class ContextName(ContextNameMixin, AbstractTreeName):
    @others
</t>
<t tx="ekr.20180519065722.168">def __init__(self, context, tree_name):
    super(ContextName, self).__init__(context.parent_context, tree_name)
    self._context = context


</t>
<t tx="ekr.20180519065722.169">class TreeNameDefinition(AbstractTreeName):
    _API_TYPES = dict(
        import_name='module',
        import_from='module',
        funcdef='function',
        param='param',
        classdef='class',
    )

    @others
</t>
<t tx="ekr.20180519065722.17">def preload_module(*modules):
    """
    Preloading modules tells Jedi to load a module now, instead of lazy parsing
    of modules. Usful for IDEs, to control which modules to load on startup.

    :param modules: different module names, list of string.
    """
    for m in modules:
        s = "import %s as x; x." % m
        Script(s, 1, len(s), None).completions()


</t>
<t tx="ekr.20180519065722.170">def infer(self):
    # Refactor this, should probably be here.
    from jedi.evaluate.syntax_tree import tree_name_to_contexts
    return tree_name_to_contexts(self.parent_context.evaluator, self.parent_context, self.tree_name)

</t>
<t tx="ekr.20180519065722.171">@property
def api_type(self):
    definition = self.tree_name.get_definition(import_name_always=True)
    if definition is None:
        return 'statement'
    return self._API_TYPES.get(definition.type, 'statement')


</t>
<t tx="ekr.20180519065722.172">class ParamName(AbstractTreeName):
    api_type = u'param'

    @others
</t>
<t tx="ekr.20180519065722.173">def __init__(self, parent_context, tree_name):
    self.parent_context = parent_context
    self.tree_name = tree_name

</t>
<t tx="ekr.20180519065722.174">def get_kind(self):
    tree_param = search_ancestor(self.tree_name, 'param')
    if tree_param.star_count == 1:  # *args
        return Parameter.VAR_POSITIONAL
    if tree_param.star_count == 2:  # **kwargs
        return Parameter.VAR_KEYWORD

    parent = tree_param.parent
    for p in parent.children:
        if p.type == 'param':
            if p.star_count:
                return Parameter.KEYWORD_ONLY
            if p == tree_param:
                break
    return Parameter.POSITIONAL_OR_KEYWORD

</t>
<t tx="ekr.20180519065722.175">def infer(self):
    return self.get_param().infer()

</t>
<t tx="ekr.20180519065722.176">def get_param(self):
    params = self.parent_context.get_params()
    param_node = search_ancestor(self.tree_name, 'param')
    return params[param_node.position_index]


</t>
<t tx="ekr.20180519065722.177">class AnonymousInstanceParamName(ParamName):
    @others
</t>
<t tx="ekr.20180519065722.178">def infer(self):
    param_node = search_ancestor(self.tree_name, 'param')
    # TODO I think this should not belong here. It's not even really true,
    #      because classmethod and other descriptors can change it.
    if param_node.position_index == 0:
        # This is a speed optimization, to return the self param (because
        # it's known). This only affects anonymous instances.
        return ContextSet(self.parent_context.instance)
    else:
        return self.get_param().infer()


</t>
<t tx="ekr.20180519065722.179">class AbstractFilter(object):
    _until_position = None

    @others
</t>
<t tx="ekr.20180519065722.18">def set_debug_function(func_cb=debug.print_to_stdout, warnings=True,
                       notices=True, speed=True):
    """
    Define a callback debug function to get all the debug messages.

    If you don't specify any arguments, debug messages will be printed to stdout.

    :param func_cb: The callback function for debug messages, with n params.
    """
    debug.debug_function = func_cb
    debug.enable_warning = warnings
    debug.enable_notice = notices
    debug.enable_speed = speed
</t>
<t tx="ekr.20180519065722.180">def _filter(self, names):
    if self._until_position is not None:
        return [n for n in names if n.start_pos &lt; self._until_position]
    return names

</t>
<t tx="ekr.20180519065722.181">@abstractmethod
def get(self, name):
    raise NotImplementedError

</t>
<t tx="ekr.20180519065722.182">@abstractmethod
def values(self):
    raise NotImplementedError


</t>
<t tx="ekr.20180519065722.183">class AbstractUsedNamesFilter(AbstractFilter):
    name_class = TreeNameDefinition

    @others
</t>
<t tx="ekr.20180519065722.184">def __init__(self, context, parser_scope):
    self._parser_scope = parser_scope
    self._used_names = self._parser_scope.get_root_node().get_used_names()
    self.context = context

</t>
<t tx="ekr.20180519065722.185">def get(self, name):
    try:
        names = self._used_names[name]
    except KeyError:
        return []

    return self._convert_names(self._filter(names))

</t>
<t tx="ekr.20180519065722.186">def _convert_names(self, names):
    return [self.name_class(self.context, name) for name in names]

</t>
<t tx="ekr.20180519065722.187">def values(self):
    return self._convert_names(name for name_list in self._used_names.values()
                               for name in self._filter(name_list))

</t>
<t tx="ekr.20180519065722.188">def __repr__(self):
    return '&lt;%s: %s&gt;' % (self.__class__.__name__, self.context)


</t>
<t tx="ekr.20180519065722.189">class ParserTreeFilter(AbstractUsedNamesFilter):
    @others
</t>
<t tx="ekr.20180519065722.190">def __init__(self, evaluator, context, node_context=None, until_position=None,
             origin_scope=None):
    """
    node_context is an option to specify a second context for use cases
    like the class mro where the parent class of a new name would be the
    context, but for some type inference it's important to have a local
    context of the other classes.
    """
    if node_context is None:
        node_context = context
    super(ParserTreeFilter, self).__init__(context, node_context.tree_node)
    self._node_context = node_context
    self._origin_scope = origin_scope
    self._until_position = until_position

</t>
<t tx="ekr.20180519065722.191">def _filter(self, names):
    names = super(ParserTreeFilter, self)._filter(names)
    names = [n for n in names if self._is_name_reachable(n)]
    return list(self._check_flows(names))

</t>
<t tx="ekr.20180519065722.192">def _is_name_reachable(self, name):
    if not name.is_definition():
        return False
    parent = name.parent
    if parent.type == 'trailer':
        return False
    base_node = parent if parent.type in ('classdef', 'funcdef') else name
    return get_parent_scope(base_node) == self._parser_scope

</t>
<t tx="ekr.20180519065722.193">def _check_flows(self, names):
    for name in sorted(names, key=lambda name: name.start_pos, reverse=True):
        check = flow_analysis.reachability_check(
            context=self._node_context,
            context_scope=self._parser_scope,
            node=name,
            origin_scope=self._origin_scope
        )
        if check is not flow_analysis.UNREACHABLE:
            yield name

        if check is flow_analysis.REACHABLE:
            break


</t>
<t tx="ekr.20180519065722.194">class FunctionExecutionFilter(ParserTreeFilter):
    param_name = ParamName

    @others
</t>
<t tx="ekr.20180519065722.195">def __init__(self, evaluator, context, node_context=None,
             until_position=None, origin_scope=None):
    super(FunctionExecutionFilter, self).__init__(
        evaluator,
        context,
        node_context,
        until_position,
        origin_scope
    )

</t>
<t tx="ekr.20180519065722.196">@to_list
def _convert_names(self, names):
    for name in names:
        param = search_ancestor(name, 'param')
        if param:
            yield self.param_name(self.context, name)
        else:
            yield TreeNameDefinition(self.context, name)


</t>
<t tx="ekr.20180519065722.197">class AnonymousInstanceFunctionExecutionFilter(FunctionExecutionFilter):
    param_name = AnonymousInstanceParamName


</t>
<t tx="ekr.20180519065722.198">class GlobalNameFilter(AbstractUsedNamesFilter):
    @others
</t>
<t tx="ekr.20180519065722.199">def __init__(self, context, parser_scope):
    super(GlobalNameFilter, self).__init__(context, parser_scope)

</t>
<t tx="ekr.20180519065722.2">"""
The API basically only provides one class. You can create a :class:`Script` and
use its methods.

Additionally you can add a debug function with :func:`set_debug_function`.
Alternatively, if you don't need a custom function and are happy with printing
debug messages to stdout, simply call :func:`set_debug_function` without
arguments.

.. warning:: Please, note that Jedi is **not thread safe**.
"""
import os
import sys

import parso
from parso.python import tree

from jedi._compatibility import force_unicode, is_py3
from jedi.parser_utils import get_executable_nodes
from jedi import debug
from jedi import settings
from jedi import cache
from jedi.api import classes
from jedi.api import interpreter
from jedi.api import helpers
from jedi.api.completion import Completion
from jedi.api.environment import InterpreterEnvironment
from jedi.api.project import get_default_project
from jedi.evaluate import Evaluator
from jedi.evaluate import imports
from jedi.evaluate import usages
from jedi.evaluate.arguments import try_iter_content
from jedi.evaluate.helpers import get_module_names, evaluate_call_of_leaf
from jedi.evaluate.sys_path import dotted_path_in_sys_path
from jedi.evaluate.filters import TreeNameDefinition, ParamName
from jedi.evaluate.syntax_tree import tree_name_to_contexts
from jedi.evaluate.context import ModuleContext
from jedi.evaluate.context.iterable import unpack_tuple_to_dict

# Jedi uses lots and lots of recursion. By setting this a little bit higher, we
# can remove some "maximum recursion depth" errors.
sys.setrecursionlimit(3000)


</t>
<t tx="ekr.20180519065722.20"></t>
<t tx="ekr.20180519065722.200">@to_list
def _filter(self, names):
    for name in names:
        if name.parent.type == 'global_stmt':
            yield name


</t>
<t tx="ekr.20180519065722.201">class DictFilter(AbstractFilter):
    @others
</t>
<t tx="ekr.20180519065722.202">def __init__(self, dct):
    self._dct = dct

</t>
<t tx="ekr.20180519065722.203">def get(self, name):
    try:
        value = self._convert(name, self._dct[name])
    except KeyError:
        return []
    else:
        return list(self._filter([value]))

</t>
<t tx="ekr.20180519065722.204">def values(self):
    def yielder():
        for item in self._dct.items():
            try:
                yield self._convert(*item)
            except KeyError:
                pass
    return self._filter(yielder())

</t>
<t tx="ekr.20180519065722.205">def _convert(self, name, value):
    return value


</t>
<t tx="ekr.20180519065722.206">class MergedFilter(object):
    @others
</t>
<t tx="ekr.20180519065722.207">def __init__(self, *filters):
    self._filters = filters

</t>
<t tx="ekr.20180519065722.208">def get(self, name):
    return [n for filter in self._filters for n in filter.get(name)]

</t>
<t tx="ekr.20180519065722.209">def values(self):
    return [n for filter in self._filters for n in filter.values()]

</t>
<t tx="ekr.20180519065722.21">@path C:/Anaconda3/Lib/site-packages/jedi/common/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.210">def __repr__(self):
    return '%s(%s)' % (self.__class__.__name__, ', '.join(str(f) for f in self._filters))


</t>
<t tx="ekr.20180519065722.211">class _BuiltinMappedMethod(Context):
    """``Generator.__next__`` ``dict.values`` methods and so on."""
    api_type = u'function'

    @others
</t>
<t tx="ekr.20180519065722.212">def __init__(self, builtin_context, method, builtin_func):
    super(_BuiltinMappedMethod, self).__init__(
        builtin_context.evaluator,
        parent_context=builtin_context
    )
    self._method = method
    self._builtin_func = builtin_func

</t>
<t tx="ekr.20180519065722.213">def py__call__(self, params):
    # TODO add TypeError if params are given/or not correct.
    return self._method(self.parent_context)

</t>
<t tx="ekr.20180519065722.214">def __getattr__(self, name):
    return getattr(self._builtin_func, name)


</t>
<t tx="ekr.20180519065722.215">class SpecialMethodFilter(DictFilter):
    """
    A filter for methods that are defined in this module on the corresponding
    classes like Generator (for __next__, etc).
    """
    @others
</t>
<t tx="ekr.20180519065722.216">class SpecialMethodName(AbstractNameDefinition):
    api_type = u'function'

    @others
</t>
<t tx="ekr.20180519065722.217">def __init__(self, parent_context, string_name, value, builtin_context):
    callable_, python_version = value
    if python_version is not None and \
            python_version != parent_context.evaluator.environment.version_info.major:
        raise KeyError

    self.parent_context = parent_context
    self.string_name = string_name
    self._callable = callable_
    self._builtin_context = builtin_context

</t>
<t tx="ekr.20180519065722.218">def infer(self):
    for filter in self._builtin_context.get_filters():
        # We can take the first index, because on builtin methods there's
        # always only going to be one name. The same is true for the
        # inferred values.
        for name in filter.get(self.string_name):
            builtin_func = next(iter(name.infer()))
            break
        else:
            continue
        break
    return ContextSet(
        _BuiltinMappedMethod(self.parent_context, self._callable, builtin_func)
    )

</t>
<t tx="ekr.20180519065722.219">def __init__(self, context, dct, builtin_context):
    super(SpecialMethodFilter, self).__init__(dct)
    self.context = context
    self._builtin_context = builtin_context
    """
    This context is what will be used to introspect the name, where as the
    other context will be used to execute the function.

    We distinguish, because we have to.
    """

</t>
<t tx="ekr.20180519065722.22">class BaseContext(object):
    @others
</t>
<t tx="ekr.20180519065722.220">def _convert(self, name, value):
    return self.SpecialMethodName(self.context, name, value, self._builtin_context)


</t>
<t tx="ekr.20180519065722.221">class _OverwriteMeta(type):
    @others
</t>
<t tx="ekr.20180519065722.222">def __init__(cls, name, bases, dct):
    super(_OverwriteMeta, cls).__init__(name, bases, dct)

    base_dct = {}
    for base_cls in reversed(cls.__bases__):
        try:
            base_dct.update(base_cls.overwritten_methods)
        except AttributeError:
            pass

    for func in cls.__dict__.values():
        try:
            base_dct.update(func.registered_overwritten_methods)
        except AttributeError:
            pass
    cls.overwritten_methods = base_dct


</t>
<t tx="ekr.20180519065722.223">class AbstractObjectOverwrite(use_metaclass(_OverwriteMeta, object)):
    @others
</t>
<t tx="ekr.20180519065722.224">def get_object(self):
    raise NotImplementedError

</t>
<t tx="ekr.20180519065722.225">def get_filters(self, search_global, *args, **kwargs):
    yield SpecialMethodFilter(self, self.overwritten_methods, self.get_object())

    for filter in self.get_object().get_filters(search_global):
        yield filter


</t>
<t tx="ekr.20180519065722.226">class BuiltinOverwrite(Context, AbstractObjectOverwrite):
    special_object_identifier = None

    @others
</t>
<t tx="ekr.20180519065722.227">def __init__(self, evaluator):
    super(BuiltinOverwrite, self).__init__(evaluator, evaluator.builtins_module)

</t>
<t tx="ekr.20180519065722.228">@memoize_method
def get_object(self):
    from jedi.evaluate import compiled
    assert self.special_object_identifier
    return compiled.get_special_object(self.evaluator, self.special_object_identifier)

</t>
<t tx="ekr.20180519065722.229">def py__class__(self):
    return self.get_object().py__class__()


</t>
<t tx="ekr.20180519065722.23">def __init__(self, evaluator, parent_context=None):
    self.evaluator = evaluator
    self.parent_context = parent_context

</t>
<t tx="ekr.20180519065722.230">def publish_method(method_name, python_version_match=None):
    def decorator(func):
        dct = func.__dict__.setdefault('registered_overwritten_methods', {})
        dct[method_name] = func, python_version_match
        return func
    return decorator


</t>
<t tx="ekr.20180519065722.231">def get_global_filters(evaluator, context, until_position, origin_scope):
    """
    Returns all filters in order of priority for name resolution.

    For global name lookups. The filters will handle name resolution
    themselves, but here we gather possible filters downwards.

    &gt;&gt;&gt; from jedi._compatibility import u, no_unicode_pprint
    &gt;&gt;&gt; from jedi import Script
    &gt;&gt;&gt; script = Script(u('''
    ... x = ['a', 'b', 'c']
    ... def func():
    ...     y = None
    ... '''))
    &gt;&gt;&gt; module_node = script._module_node
    &gt;&gt;&gt; scope = next(module_node.iter_funcdefs())
    &gt;&gt;&gt; scope
    &lt;Function: func@3-5&gt;
    &gt;&gt;&gt; context = script._get_module().create_context(scope)
    &gt;&gt;&gt; filters = list(get_global_filters(context.evaluator, context, (4, 0), None))

    First we get the names from the function scope.

    &gt;&gt;&gt; no_unicode_pprint(filters[0])                    #doctest: +ELLIPSIS
    MergedFilter(&lt;ParserTreeFilter: ...&gt;, &lt;GlobalNameFilter: ...&gt;)
    &gt;&gt;&gt; sorted(str(n) for n in filters[0].values())
    ['&lt;TreeNameDefinition: func@(3, 4)&gt;', '&lt;TreeNameDefinition: x@(2, 0)&gt;']
    &gt;&gt;&gt; filters[0]._filters[0]._until_position
    (4, 0)
    &gt;&gt;&gt; filters[0]._filters[1]._until_position

    Then it yields the names from one level "lower". In this example, this is
    the module scope (including globals).
    As a side note, you can see, that the position in the filter is None on the
    globals filter, because there the whole module is searched.

    &gt;&gt;&gt; list(filters[1].values())  # package modules -&gt; Also empty.
    []
    &gt;&gt;&gt; sorted(name.string_name for name in filters[2].values())  # Module attributes
    ['__doc__', '__file__', '__name__', '__package__']

    Finally, it yields the builtin filter, if `include_builtin` is
    true (default).

    &gt;&gt;&gt; filters[3].values()                              #doctest: +ELLIPSIS
    [&lt;CompiledName: ...&gt;, ...]
    """
    from jedi.evaluate.context.function import FunctionExecutionContext
    while context is not None:
        # Names in methods cannot be resolved within the class.
        for filter in context.get_filters(
                search_global=True,
                until_position=until_position,
                origin_scope=origin_scope):
            yield filter
        if isinstance(context, FunctionExecutionContext):
            # The position should be reset if the current scope is a function.
            until_position = None

        context = context.parent_context

    # Add builtins to the global scope.
    for filter in evaluator.builtins_module.get_filters(search_global=True):
        yield filter
</t>
<t tx="ekr.20180519065722.232">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.233">"""
Searching for names with given scope and name. This is very central in Jedi and
Python. The name resolution is quite complicated with descripter,
``__getattribute__``, ``__getattr__``, ``global``, etc.

If you want to understand name resolution, please read the first few chapters
in http://blog.ionelmc.ro/2015/02/09/understanding-python-metaclasses/.

Flow checks
+++++++++++

Flow checks are not really mature. There's only a check for ``isinstance``.  It
would check whether a flow has the form of ``if isinstance(a, type_or_tuple)``.
Unfortunately every other thing is being ignored (e.g. a == '' would be easy to
check for -&gt; a is a string). There's big potential in these checks.
"""

from parso.python import tree
from parso.tree import search_ancestor
from jedi import debug
from jedi import settings
from jedi.evaluate.context import AbstractInstanceContext
from jedi.evaluate import compiled
from jedi.evaluate import analysis
from jedi.evaluate import flow_analysis
from jedi.evaluate.arguments import TreeArguments
from jedi.evaluate import helpers
from jedi.evaluate.context import iterable
from jedi.evaluate.filters import get_global_filters, TreeNameDefinition
from jedi.evaluate.base_context import ContextSet
from jedi.parser_utils import is_scope, get_parent_scope


</t>
<t tx="ekr.20180519065722.234">class NameFinder(object):
    @others
</t>
<t tx="ekr.20180519065722.235">def __init__(self, evaluator, context, name_context, name_or_str,
             position=None, analysis_errors=True):
    self._evaluator = evaluator
    # Make sure that it's not just a syntax tree node.
    self._context = context
    self._name_context = name_context
    self._name = name_or_str
    if isinstance(name_or_str, tree.Name):
        self._string_name = name_or_str.value
    else:
        self._string_name = name_or_str
    self._position = position
    self._found_predefined_types = None
    self._analysis_errors = analysis_errors

</t>
<t tx="ekr.20180519065722.236">@debug.increase_indent
def find(self, filters, attribute_lookup):
    """
    :params bool attribute_lookup: Tell to logic if we're accessing the
        attribute or the contents of e.g. a function.
    """
    names = self.filter_name(filters)
    if self._found_predefined_types is not None and names:
        check = flow_analysis.reachability_check(
            context=self._context,
            context_scope=self._context.tree_node,
            node=self._name,
        )
        if check is flow_analysis.UNREACHABLE:
            return ContextSet()
        return self._found_predefined_types

    types = self._names_to_types(names, attribute_lookup)

    if not names and self._analysis_errors and not types \
            and not (isinstance(self._name, tree.Name) and
                     isinstance(self._name.parent.parent, tree.Param)):
        if isinstance(self._name, tree.Name):
            if attribute_lookup:
                analysis.add_attribute_error(
                    self._name_context, self._context, self._name)
            else:
                message = ("NameError: name '%s' is not defined."
                           % self._string_name)
                analysis.add(self._name_context, 'name-error', self._name, message)

    return types

</t>
<t tx="ekr.20180519065722.237">def _get_origin_scope(self):
    if isinstance(self._name, tree.Name):
        scope = self._name
        while scope.parent is not None:
            # TODO why if classes?
            if not isinstance(scope, tree.Scope):
                break
            scope = scope.parent
        return scope
    else:
        return None

</t>
<t tx="ekr.20180519065722.238">def get_filters(self, search_global=False):
    origin_scope = self._get_origin_scope()
    if search_global:
        position = self._position

        # For functions and classes the defaults don't belong to the
        # function and get evaluated in the context before the function. So
        # make sure to exclude the function/class name.
        if origin_scope is not None:
            ancestor = search_ancestor(origin_scope, 'funcdef', 'classdef', 'lambdef')
            lambdef = None
            if ancestor == 'lambdef':
                # For lambdas it's even more complicated since parts will
                # be evaluated later.
                lambdef = ancestor
                ancestor = search_ancestor(origin_scope, 'funcdef', 'classdef')
            if ancestor is not None:
                colon = ancestor.children[-2]
                if position &lt; colon.start_pos:
                    if lambdef is None or position &lt; lambdef.children[-2].start_pos:
                        position = ancestor.start_pos

        return get_global_filters(self._evaluator, self._context, position, origin_scope)
    else:
        return self._context.get_filters(search_global, self._position, origin_scope=origin_scope)

</t>
<t tx="ekr.20180519065722.239">def filter_name(self, filters):
    """
    Searches names that are defined in a scope (the different
    ``filters``), until a name fits.
    """
    names = []
    if self._context.predefined_names and isinstance(self._name, tree.Name):
        node = self._name
        while node is not None and not is_scope(node):
            node = node.parent
            if node.type in ("if_stmt", "for_stmt", "comp_for"):
                try:
                    name_dict = self._context.predefined_names[node]
                    types = name_dict[self._string_name]
                except KeyError:
                    continue
                else:
                    self._found_predefined_types = types
                    break

    for filter in filters:
        names = filter.get(self._string_name)
        if names:
            if len(names) == 1:
                n, = names
                if isinstance(n, TreeNameDefinition):
                    # Something somewhere went terribly wrong. This
                    # typically happens when using goto on an import in an
                    # __init__ file. I think we need a better solution, but
                    # it's kind of hard, because for Jedi it's not clear
                    # that that name has not been defined, yet.
                    if n.tree_name == self._name:
                        if self._name.get_definition().type == 'import_from':
                            continue
            break

    debug.dbg('finder.filter_name %s in (%s): %s@%s',
              self._string_name, self._context, names, self._position)
    return list(names)

</t>
<t tx="ekr.20180519065722.24">def get_root_context(self):
    context = self
    while True:
        if context.parent_context is None:
            return context
        context = context.parent_context


</t>
<t tx="ekr.20180519065722.240">def _check_getattr(self, inst):
    """Checks for both __getattr__ and __getattribute__ methods"""
    # str is important, because it shouldn't be `Name`!
    name = compiled.create_simple_object(self._evaluator, self._string_name)

    # This is a little bit special. `__getattribute__` is in Python
    # executed before `__getattr__`. But: I know no use case, where
    # this could be practical and where Jedi would return wrong types.
    # If you ever find something, let me know!
    # We are inversing this, because a hand-crafted `__getattribute__`
    # could still call another hand-crafted `__getattr__`, but not the
    # other way around.
    names = (inst.get_function_slot_names(u'__getattr__') or
             inst.get_function_slot_names(u'__getattribute__'))
    return inst.execute_function_slots(names, name)

</t>
<t tx="ekr.20180519065722.241">def _names_to_types(self, names, attribute_lookup):
    contexts = ContextSet.from_sets(name.infer() for name in names)

    debug.dbg('finder._names_to_types: %s -&gt; %s', names, contexts)
    if not names and isinstance(self._context, AbstractInstanceContext):
        # handling __getattr__ / __getattribute__
        return self._check_getattr(self._context)

    # Add isinstance and other if/assert knowledge.
    if not contexts and isinstance(self._name, tree.Name) and \
            not isinstance(self._name_context, AbstractInstanceContext):
        flow_scope = self._name
        base_node = self._name_context.tree_node
        if base_node.type == 'comp_for':
            return contexts
        while True:
            flow_scope = get_parent_scope(flow_scope, include_flows=True)
            n = _check_flow_information(self._name_context, flow_scope,
                                        self._name, self._position)
            if n is not None:
                return n
            if flow_scope == base_node:
                break
    return contexts


</t>
<t tx="ekr.20180519065722.242">def _check_flow_information(context, flow, search_name, pos):
    """ Try to find out the type of a variable just with the information that
    is given by the flows: e.g. It is also responsible for assert checks.::

        if isinstance(k, str):
            k.  # &lt;- completion here

    ensures that `k` is a string.
    """
    if not settings.dynamic_flow_information:
        return None

    result = None
    if is_scope(flow):
        # Check for asserts.
        module_node = flow.get_root_node()
        try:
            names = module_node.get_used_names()[search_name.value]
        except KeyError:
            return None
        names = reversed([
            n for n in names
            if flow.start_pos &lt;= n.start_pos &lt; (pos or flow.end_pos)
        ])

        for name in names:
            ass = search_ancestor(name, 'assert_stmt')
            if ass is not None:
                result = _check_isinstance_type(context, ass.assertion, search_name)
                if result is not None:
                    return result

    if flow.type in ('if_stmt', 'while_stmt'):
        potential_ifs = [c for c in flow.children[1::4] if c != ':']
        for if_test in reversed(potential_ifs):
            if search_name.start_pos &gt; if_test.end_pos:
                return _check_isinstance_type(context, if_test, search_name)
    return result


</t>
<t tx="ekr.20180519065722.243">def _check_isinstance_type(context, element, search_name):
    try:
        assert element.type in ('power', 'atom_expr')
        # this might be removed if we analyze and, etc
        assert len(element.children) == 2
        first, trailer = element.children
        assert first.type == 'name' and first.value == 'isinstance'
        assert trailer.type == 'trailer' and trailer.children[0] == '('
        assert len(trailer.children) == 3

        # arglist stuff
        arglist = trailer.children[1]
        args = TreeArguments(context.evaluator, context, arglist, trailer)
        param_list = list(args.unpack())
        # Disallow keyword arguments
        assert len(param_list) == 2
        (key1, lazy_context_object), (key2, lazy_context_cls) = param_list
        assert key1 is None and key2 is None
        call = helpers.call_of_leaf(search_name)
        is_instance_call = helpers.call_of_leaf(lazy_context_object.data)
        # Do a simple get_code comparison. They should just have the same code,
        # and everything will be all right.
        normalize = context.evaluator.grammar._normalize
        assert normalize(is_instance_call) == normalize(call)
    except AssertionError:
        return None

    context_set = ContextSet()
    for cls_or_tup in lazy_context_cls.infer():
        if isinstance(cls_or_tup, iterable.Sequence) and cls_or_tup.array_type == 'tuple':
            for lazy_context in cls_or_tup.py__iter__():
                for context in lazy_context.infer():
                    context_set |= context.execute_evaluated()
        else:
            context_set |= cls_or_tup.execute_evaluated()
    return context_set
</t>
<t tx="ekr.20180519065722.244">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.245">from jedi.parser_utils import get_flow_branch_keyword, is_scope, get_parent_scope
from jedi.evaluate.recursion import execution_allowed


</t>
<t tx="ekr.20180519065722.246">class Status(object):
    lookup_table = {}

    @others
REACHABLE = Status(True, 'reachable')
UNREACHABLE = Status(False, 'unreachable')
UNSURE = Status(None, 'unsure')


</t>
<t tx="ekr.20180519065722.247">def __init__(self, value, name):
    self._value = value
    self._name = name
    Status.lookup_table[value] = self

</t>
<t tx="ekr.20180519065722.248">def invert(self):
    if self is REACHABLE:
        return UNREACHABLE
    elif self is UNREACHABLE:
        return REACHABLE
    else:
        return UNSURE

</t>
<t tx="ekr.20180519065722.249">def __and__(self, other):
    if UNSURE in (self, other):
        return UNSURE
    else:
        return REACHABLE if self._value and other._value else UNREACHABLE

</t>
<t tx="ekr.20180519065722.25">class BaseContextSet(object):
    @others
</t>
<t tx="ekr.20180519065722.250">def __repr__(self):
    return '&lt;%s: %s&gt;' % (type(self).__name__, self._name)


</t>
<t tx="ekr.20180519065722.251">def _get_flow_scopes(node):
    while True:
        node = get_parent_scope(node, include_flows=True)
        if node is None or is_scope(node):
            return
        yield node


</t>
<t tx="ekr.20180519065722.252">def reachability_check(context, context_scope, node, origin_scope=None):
    first_flow_scope = get_parent_scope(node, include_flows=True)
    if origin_scope is not None:
        origin_flow_scopes = list(_get_flow_scopes(origin_scope))
        node_flow_scopes = list(_get_flow_scopes(node))

        branch_matches = True
        for flow_scope in origin_flow_scopes:
            if flow_scope in node_flow_scopes:
                node_keyword = get_flow_branch_keyword(flow_scope, node)
                origin_keyword = get_flow_branch_keyword(flow_scope, origin_scope)
                branch_matches = node_keyword == origin_keyword
                if flow_scope.type == 'if_stmt':
                    if not branch_matches:
                        return UNREACHABLE
                elif flow_scope.type == 'try_stmt':
                    if not branch_matches and origin_keyword == 'else' \
                            and node_keyword == 'except':
                        return UNREACHABLE
                break

        # Direct parents get resolved, we filter scopes that are separate
        # branches.  This makes sense for autocompletion and static analysis.
        # For actual Python it doesn't matter, because we're talking about
        # potentially unreachable code.
        # e.g. `if 0:` would cause all name lookup within the flow make
        # unaccessible. This is not a "problem" in Python, because the code is
        # never called. In Jedi though, we still want to infer types.
        while origin_scope is not None:
            if first_flow_scope == origin_scope and branch_matches:
                return REACHABLE
            origin_scope = origin_scope.parent

    return _break_check(context, context_scope, first_flow_scope, node)


</t>
<t tx="ekr.20180519065722.253">def _break_check(context, context_scope, flow_scope, node):
    reachable = REACHABLE
    if flow_scope.type == 'if_stmt':
        if flow_scope.is_node_after_else(node):
            for check_node in flow_scope.get_test_nodes():
                reachable = _check_if(context, check_node)
                if reachable in (REACHABLE, UNSURE):
                    break
            reachable = reachable.invert()
        else:
            flow_node = flow_scope.get_corresponding_test_node(node)
            if flow_node is not None:
                reachable = _check_if(context, flow_node)
    elif flow_scope.type in ('try_stmt', 'while_stmt'):
        return UNSURE

    # Only reachable branches need to be examined further.
    if reachable in (UNREACHABLE, UNSURE):
        return reachable

    if context_scope != flow_scope and context_scope != flow_scope.parent:
        flow_scope = get_parent_scope(flow_scope, include_flows=True)
        return reachable &amp; _break_check(context, context_scope, flow_scope, node)
    else:
        return reachable


</t>
<t tx="ekr.20180519065722.254">def _check_if(context, node):
    with execution_allowed(context.evaluator, node) as allowed:
        if not allowed:
            return UNSURE

        types = context.eval_node(node)
        values = set(x.py__bool__() for x in types)
        if len(values) == 1:
            return Status.lookup_table[values.pop()]
        else:
            return UNSURE
</t>
<t tx="ekr.20180519065722.255">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.256">import copy
import sys
import re
import os
from itertools import chain
from contextlib import contextmanager

from parso.python import tree

from jedi._compatibility import unicode
from jedi.parser_utils import get_parent_scope
from jedi.evaluate.compiled import CompiledObject


</t>
<t tx="ekr.20180519065722.257">def is_stdlib_path(path):
    # Python standard library paths look like this:
    # /usr/lib/python3.5/...
    # TODO The implementation below is probably incorrect and not complete.
    if 'dist-packages' in path or 'site-packages' in path:
        return False

    base_path = os.path.join(sys.prefix, 'lib', 'python')
    return bool(re.match(re.escape(base_path) + '\d.\d', path))


</t>
<t tx="ekr.20180519065722.258">def deep_ast_copy(obj):
    """
    Much, much faster than copy.deepcopy, but just for parser tree nodes.
    """
    # If it's already in the cache, just return it.
    new_obj = copy.copy(obj)

    # Copy children
    new_children = []
    for child in obj.children:
        if isinstance(child, tree.Leaf):
            new_child = copy.copy(child)
            new_child.parent = new_obj
        else:
            new_child = deep_ast_copy(child)
            new_child.parent = new_obj
        new_children.append(new_child)
    new_obj.children = new_children

    return new_obj


</t>
<t tx="ekr.20180519065722.259">def evaluate_call_of_leaf(context, leaf, cut_own_trailer=False):
    """
    Creates a "call" node that consist of all ``trailer`` and ``power``
    objects.  E.g. if you call it with ``append``::

        list([]).append(3) or None

    You would get a node with the content ``list([]).append`` back.

    This generates a copy of the original ast node.

    If you're using the leaf, e.g. the bracket `)` it will return ``list([])``.

    We use this function for two purposes. Given an expression ``bar.foo``,
    we may want to
      - infer the type of ``foo`` to offer completions after foo
      - infer the type of ``bar`` to be able to jump to the definition of foo
    The option ``cut_own_trailer`` must be set to true for the second purpose.
    """
    trailer = leaf.parent
    # The leaf may not be the last or first child, because there exist three
    # different trailers: `( x )`, `[ x ]` and `.x`. In the first two examples
    # we should not match anything more than x.
    if trailer.type != 'trailer' or leaf not in (trailer.children[0], trailer.children[-1]):
        if trailer.type == 'atom':
            return context.eval_node(trailer)
        return context.eval_node(leaf)

    power = trailer.parent
    index = power.children.index(trailer)
    if cut_own_trailer:
        cut = index
    else:
        cut = index + 1

    if power.type == 'error_node':
        start = index
        while True:
            start -= 1
            base = power.children[start]
            if base.type != 'trailer':
                break
        trailers = power.children[start + 1: index + 1]
    else:
        base = power.children[0]
        trailers = power.children[1:cut]

    if base == 'await':
        base = trailers[0]
        trailers = trailers[1:]

    values = context.eval_node(base)
    from jedi.evaluate.syntax_tree import eval_trailer
    for trailer in trailers:
        values = eval_trailer(context, values, trailer)
    return values


</t>
<t tx="ekr.20180519065722.26">def __init__(self, *args):
    self._set = set(args)

</t>
<t tx="ekr.20180519065722.260">def call_of_leaf(leaf):
    """
    Creates a "call" node that consist of all ``trailer`` and ``power``
    objects.  E.g. if you call it with ``append``::

        list([]).append(3) or None

    You would get a node with the content ``list([]).append`` back.

    This generates a copy of the original ast node.

    If you're using the leaf, e.g. the bracket `)` it will return ``list([])``.
    """
    # TODO this is the old version of this call. Try to remove it.
    trailer = leaf.parent
    # The leaf may not be the last or first child, because there exist three
    # different trailers: `( x )`, `[ x ]` and `.x`. In the first two examples
    # we should not match anything more than x.
    if trailer.type != 'trailer' or leaf not in (trailer.children[0], trailer.children[-1]):
        if trailer.type == 'atom':
            return trailer
        return leaf

    power = trailer.parent
    index = power.children.index(trailer)

    new_power = copy.copy(power)
    new_power.children = list(new_power.children)
    new_power.children[index + 1:] = []

    if power.type == 'error_node':
        start = index
        while True:
            start -= 1
            if power.children[start].type != 'trailer':
                break
        transformed = tree.Node('power', power.children[start:])
        transformed.parent = power.parent
        return transformed

    return power


</t>
<t tx="ekr.20180519065722.261">def get_names_of_node(node):
    try:
        children = node.children
    except AttributeError:
        if node.type == 'name':
            return [node]
        else:
            return []
    else:
        return list(chain.from_iterable(get_names_of_node(c) for c in children))


</t>
<t tx="ekr.20180519065722.262">def get_module_names(module, all_scopes):
    """
    Returns a dictionary with name parts as keys and their call paths as
    values.
    """
    names = chain.from_iterable(module.get_used_names().values())
    if not all_scopes:
        # We have to filter all the names that don't have the module as a
        # parent_scope. There's None as a parent, because nodes in the module
        # node have the parent module and not suite as all the others.
        # Therefore it's important to catch that case.
        names = [n for n in names if get_parent_scope(n).parent in (module, None)]
    return names


</t>
<t tx="ekr.20180519065722.263">@contextmanager
def predefine_names(context, flow_scope, dct):
    predefined = context.predefined_names
    predefined[flow_scope] = dct
    try:
        yield
    finally:
        del predefined[flow_scope]


</t>
<t tx="ekr.20180519065722.264">def is_compiled(context):
    return isinstance(context, CompiledObject)


</t>
<t tx="ekr.20180519065722.265">def is_string(context):
    if context.evaluator.environment.version_info.major == 2:
        str_classes = (unicode, bytes)
    else:
        str_classes = (unicode,)
    return is_compiled(context) and isinstance(context.get_safe_value(default=None), str_classes)


</t>
<t tx="ekr.20180519065722.266">def is_literal(context):
    return is_number(context) or is_string(context)


</t>
<t tx="ekr.20180519065722.267">def _get_safe_value_or_none(context, accept):
    if is_compiled(context):
        value = context.get_safe_value(default=None)
        if isinstance(value, accept):
            return value


</t>
<t tx="ekr.20180519065722.268">def get_int_or_none(context):
    return _get_safe_value_or_none(context, int)


</t>
<t tx="ekr.20180519065722.269">def is_number(context):
    return _get_safe_value_or_none(context, (int, float)) is not None
</t>
<t tx="ekr.20180519065722.27">@classmethod
def from_iterable(cls, iterable):
    return cls.from_set(set(iterable))

</t>
<t tx="ekr.20180519065722.270">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.271">"""
:mod:`jedi.evaluate.imports` is here to resolve import statements and return
the modules/classes/functions/whatever, which they stand for. However there's
not any actual importing done. This module is about finding modules in the
filesystem. This can be quite tricky sometimes, because Python imports are not
always that simple.

This module uses imp for python up to 3.2 and importlib for python 3.3 on; the
correct implementation is delegated to _compatibility.

This module also supports import autocompletion, which means to complete
statements like ``from datetim`` (cursor at the end would return ``datetime``).
"""
import os

from parso.python import tree
from parso.tree import search_ancestor
from parso import python_bytes_to_unicode

from jedi._compatibility import unicode, ImplicitNSInfo, force_unicode
from jedi import debug
from jedi import settings
from jedi.parser_utils import get_cached_code_lines
from jedi.evaluate import sys_path
from jedi.evaluate import helpers
from jedi.evaluate import compiled
from jedi.evaluate import analysis
from jedi.evaluate.utils import unite, dotted_from_fs_path
from jedi.evaluate.cache import evaluator_method_cache
from jedi.evaluate.filters import AbstractNameDefinition
from jedi.evaluate.base_context import ContextSet, NO_CONTEXTS


</t>
<t tx="ekr.20180519065722.272">class ModuleCache(object):
    @others
# This memoization is needed, because otherwise we will infinitely loop on
# certain imports.
@evaluator_method_cache(default=NO_CONTEXTS)
</t>
<t tx="ekr.20180519065722.273">def __init__(self):
    self._path_cache = {}
    self._name_cache = {}

</t>
<t tx="ekr.20180519065722.274">def add(self, module, name):
    path = module.py__file__()
    self._path_cache[path] = module
    self._name_cache[name] = module

</t>
<t tx="ekr.20180519065722.275">def iterate_modules_with_names(self):
    return self._name_cache.items()

</t>
<t tx="ekr.20180519065722.276">def get(self, name):
    return self._name_cache[name]

</t>
<t tx="ekr.20180519065722.277">def get_from_path(self, path):
    return self._path_cache[path]


</t>
<t tx="ekr.20180519065722.278">def infer_import(context, tree_name, is_goto=False):
    module_context = context.get_root_context()
    import_node = search_ancestor(tree_name, 'import_name', 'import_from')
    import_path = import_node.get_path_for_name(tree_name)
    from_import_name = None
    evaluator = context.evaluator
    try:
        from_names = import_node.get_from_names()
    except AttributeError:
        # Is an import_name
        pass
    else:
        if len(from_names) + 1 == len(import_path):
            # We have to fetch the from_names part first and then check
            # if from_names exists in the modules.
            from_import_name = import_path[-1]
            import_path = from_names

    importer = Importer(evaluator, tuple(import_path),
                        module_context, import_node.level)

    types = importer.follow()

    #if import_node.is_nested() and not self.nested_resolve:
    #    scopes = [NestedImportModule(module, import_node)]

    if not types:
        return NO_CONTEXTS

    if from_import_name is not None:
        types = unite(
            t.py__getattribute__(
                from_import_name,
                name_context=context,
                is_goto=is_goto,
                analysis_errors=False
            )
            for t in types
        )
        if not is_goto:
            types = ContextSet.from_set(types)

        if not types:
            path = import_path + [from_import_name]
            importer = Importer(evaluator, tuple(path),
                                module_context, import_node.level)
            types = importer.follow()
            # goto only accepts `Name`
            if is_goto:
                types = set(s.name for s in types)
    else:
        # goto only accepts `Name`
        if is_goto:
            types = set(s.name for s in types)

    debug.dbg('after import: %s', types)
    return types


</t>
<t tx="ekr.20180519065722.279">class NestedImportModule(tree.Module):
    """
    TODO while there's no use case for nested import module right now, we might
        be able to use them for static analysis checks later on.
    """
    @others
</t>
<t tx="ekr.20180519065722.28">@classmethod
def from_set(cls, set_):
    self = cls()
    self._set = set_
    return self

</t>
<t tx="ekr.20180519065722.280">def __init__(self, module, nested_import):
    self._module = module
    self._nested_import = nested_import

</t>
<t tx="ekr.20180519065722.281">def _get_nested_import_name(self):
    """
    Generates an Import statement, that can be used to fake nested imports.
    """
    i = self._nested_import
    # This is not an existing Import statement. Therefore, set position to
    # 0 (0 is not a valid line number).
    zero = (0, 0)
    names = [unicode(name) for name in i.namespace_names[1:]]
    name = helpers.FakeName(names, self._nested_import)
    new = tree.Import(i._sub_module, zero, zero, name)
    new.parent = self._module
    debug.dbg('Generated a nested import: %s', new)
    return helpers.FakeName(str(i.namespace_names[1]), new)

</t>
<t tx="ekr.20180519065722.282">def __getattr__(self, name):
    return getattr(self._module, name)

</t>
<t tx="ekr.20180519065722.283">def __repr__(self):
    return "&lt;%s: %s of %s&gt;" % (self.__class__.__name__, self._module,
                               self._nested_import)


</t>
<t tx="ekr.20180519065722.284">def _add_error(context, name, message=None):
    # Should be a name, not a string!
    if message is None:
        name_str = str(name.value) if isinstance(name, tree.Name) else name
        message = 'No module named ' + name_str
    if hasattr(name, 'parent'):
        analysis.add(context, 'import-error', name, message)
    else:
        debug.warning('ImportError without origin: ' + message)


</t>
<t tx="ekr.20180519065722.285">class ImportName(AbstractNameDefinition):
    start_pos = (1, 0)
    _level = 0

    @others
</t>
<t tx="ekr.20180519065722.286">def __init__(self, parent_context, string_name):
    self.parent_context = parent_context
    self.string_name = string_name

</t>
<t tx="ekr.20180519065722.287">def infer(self):
    return Importer(
        self.parent_context.evaluator,
        [self.string_name],
        self.parent_context,
        level=self._level,
    ).follow()

</t>
<t tx="ekr.20180519065722.288">def goto(self):
    return [m.name for m in self.infer()]

</t>
<t tx="ekr.20180519065722.289">def get_root_context(self):
    # Not sure if this is correct.
    return self.parent_context.get_root_context()

</t>
<t tx="ekr.20180519065722.29">@classmethod
def from_sets(cls, sets):
    """
    Used to work with an iterable of set.
    """
    aggregated = set()
    sets = list(sets)
    for set_ in sets:
        if isinstance(set_, BaseContextSet):
            aggregated |= set_._set
        else:
            aggregated |= set_
    return cls.from_set(aggregated)

</t>
<t tx="ekr.20180519065722.290">@property
def api_type(self):
    return 'module'


</t>
<t tx="ekr.20180519065722.291">class SubModuleName(ImportName):
    _level = 1


</t>
<t tx="ekr.20180519065722.292">class Importer(object):
    @others
</t>
<t tx="ekr.20180519065722.293">def __init__(self, evaluator, import_path, module_context, level=0):
    """
    An implementation similar to ``__import__``. Use `follow`
    to actually follow the imports.

    *level* specifies whether to use absolute or relative imports. 0 (the
    default) means only perform absolute imports. Positive values for level
    indicate the number of parent directories to search relative to the
    directory of the module calling ``__import__()`` (see PEP 328 for the
    details).

    :param import_path: List of namespaces (strings or Names).
    """
    debug.speed('import %s' % (import_path,))
    self._evaluator = evaluator
    self.level = level
    self.module_context = module_context
    try:
        self.file_path = module_context.py__file__()
    except AttributeError:
        # Can be None for certain compiled modules like 'builtins'.
        self.file_path = None

    if level:
        base = module_context.py__package__().split('.')
        if base == [''] or base == ['__main__']:
            base = []
        if level &gt; len(base):
            path = module_context.py__file__()
            if path is not None:
                import_path = list(import_path)
                p = path
                for i in range(level):
                    p = os.path.dirname(p)
                dir_name = os.path.basename(p)
                # This is not the proper way to do relative imports. However, since
                # Jedi cannot be sure about the entry point, we just calculate an
                # absolute path here.
                if dir_name:
                    # TODO those sys.modules modifications are getting
                    # really stupid. this is the 3rd time that we're using
                    # this. We should probably refactor.
                    if path.endswith(os.path.sep + 'os.py'):
                        import_path.insert(0, 'os')
                    else:
                        import_path.insert(0, dir_name)
                else:
                    _add_error(
                        module_context, import_path[-1],
                        message='Attempted relative import beyond top-level package.'
                    )
                    import_path = []
            # If no path is defined in the module we have no ideas where we
            # are in the file system. Therefore we cannot know what to do.
            # In this case we just let the path there and ignore that it's
            # a relative path. Not sure if that's a good idea.
        else:
            # Here we basically rewrite the level to 0.
            base = tuple(base)
            if level &gt; 1:
                base = base[:-level + 1]

            import_path = base + tuple(import_path)
    self.import_path = import_path

</t>
<t tx="ekr.20180519065722.294">@property
def str_import_path(self):
    """Returns the import path as pure strings instead of `Name`."""
    return tuple(
        name.value if isinstance(name, tree.Name) else name
        for name in self.import_path
    )

</t>
<t tx="ekr.20180519065722.295">def sys_path_with_modifications(self):
    sys_path_mod = self._evaluator.get_sys_path() \
                   + sys_path.check_sys_path_modifications(self.module_context)

    if self.import_path and self.file_path is not None \
            and self._evaluator.environment.version_info.major == 2:
        # Python2 uses an old strange way of importing relative imports.
        sys_path_mod.append(force_unicode(os.path.dirname(self.file_path)))

    return sys_path_mod

</t>
<t tx="ekr.20180519065722.296">def follow(self):
    if not self.import_path:
        return NO_CONTEXTS
    return self._do_import(self.import_path, self.sys_path_with_modifications())

</t>
<t tx="ekr.20180519065722.297">def _do_import(self, import_path, sys_path):
    """
    This method is very similar to importlib's `_gcd_import`.
    """
    import_parts = [
        force_unicode(i.value if isinstance(i, tree.Name) else i)
        for i in import_path
    ]

    # Handle "magic" Flask extension imports:
    # ``flask.ext.foo`` is really ``flask_foo`` or ``flaskext.foo``.
    if len(import_path) &gt; 2 and import_parts[:2] == ['flask', 'ext']:
        # New style.
        ipath = ('flask_' + str(import_parts[2]),) + import_path[3:]
        modules = self._do_import(ipath, sys_path)
        if modules:
            return modules
        else:
            # Old style
            return self._do_import(('flaskext',) + import_path[2:], sys_path)

    module_name = '.'.join(import_parts)
    try:
        return ContextSet(self._evaluator.module_cache.get(module_name))
    except KeyError:
        pass

    if len(import_path) &gt; 1:
        # This is a recursive way of importing that works great with
        # the module cache.
        bases = self._do_import(import_path[:-1], sys_path)
        if not bases:
            return NO_CONTEXTS
        # We can take the first element, because only the os special
        # case yields multiple modules, which is not important for
        # further imports.
        parent_module = list(bases)[0]

        # This is a huge exception, we follow a nested import
        # ``os.path``, because it's a very important one in Python
        # that is being achieved by messing with ``sys.modules`` in
        # ``os``.
        if import_parts == ['os', 'path']:
            return parent_module.py__getattribute__('path')

        try:
            method = parent_module.py__path__
        except AttributeError:
            # The module is not a package.
            _add_error(self.module_context, import_path[-1])
            return NO_CONTEXTS
        else:
            paths = method()
            debug.dbg('search_module %s in paths %s', module_name, paths)
            for path in paths:
                # At the moment we are only using one path. So this is
                # not important to be correct.
                if not isinstance(path, list):
                    path = [path]
                code, module_path, is_pkg = self._evaluator.compiled_subprocess.get_module_info(
                    string=import_parts[-1],
                    path=path,
                    full_name=module_name
                )
                if module_path is not None:
                    break
            else:
                _add_error(self.module_context, import_path[-1])
                return NO_CONTEXTS
    else:
        debug.dbg('search_module %s in %s', import_parts[-1], self.file_path)
        # Override the sys.path. It works only good that way.
        # Injecting the path directly into `find_module` did not work.
        code, module_path, is_pkg = self._evaluator.compiled_subprocess.get_module_info(
            string=import_parts[-1],
            full_name=module_name,
            sys_path=sys_path,
        )
        if module_path is None:
            # The module is not a package.
            _add_error(self.module_context, import_path[-1])
            return NO_CONTEXTS

    module = _load_module(
        self._evaluator, module_path, code, sys_path,
        module_name=module_name,
        safe_module_name=True,
    )

    if module is None:
        # The file might raise an ImportError e.g. and therefore not be
        # importable.
        return NO_CONTEXTS

    return ContextSet(module)

</t>
<t tx="ekr.20180519065722.298">def _generate_name(self, name, in_module=None):
    # Create a pseudo import to be able to follow them.
    if in_module is None:
        return ImportName(self.module_context, name)
    return SubModuleName(in_module, name)

</t>
<t tx="ekr.20180519065722.299">def _get_module_names(self, search_path=None, in_module=None):
    """
    Get the names of all modules in the search_path. This means file names
    and not names defined in the files.
    """
    sub = self._evaluator.compiled_subprocess

    names = []
    # add builtin module names
    if search_path is None and in_module is None:
        names += [self._generate_name(name) for name in sub.get_builtin_module_names()]

    if search_path is None:
        search_path = self.sys_path_with_modifications()

    for name in sub.list_module_names(search_path):
        names.append(self._generate_name(name, in_module=in_module))
    return names

</t>
<t tx="ekr.20180519065722.3">class Script(object):
    """
    A Script is the base for completions, goto or whatever you want to do with
    |jedi|.

    You can either use the ``source`` parameter or ``path`` to read a file.
    Usually you're going to want to use both of them (in an editor).

    The script might be analyzed in a different ``sys.path`` than |jedi|:

    - if `sys_path` parameter is not ``None``, it will be used as ``sys.path``
      for the script;

    - if `sys_path` parameter is ``None`` and ``VIRTUAL_ENV`` environment
      variable is defined, ``sys.path`` for the specified environment will be
      guessed (see :func:`jedi.evaluate.sys_path.get_venv_path`) and used for
      the script;

    - otherwise ``sys.path`` will match that of |jedi|.

    :param source: The source code of the current file, separated by newlines.
    :type source: str
    :param line: The line to perform actions on (starting with 1).
    :type line: int
    :param column: The column of the cursor (starting with 0).
    :type column: int
    :param path: The path of the file in the file system, or ``''`` if
        it hasn't been saved yet.
    :type path: str or None
    :param encoding: The encoding of ``source``, if it is not a
        ``unicode`` object (default ``'utf-8'``).
    :type encoding: str
    :param source_encoding: The encoding of ``source``, if it is not a
        ``unicode`` object (default ``'utf-8'``).
    :type encoding: str
    :param sys_path: ``sys.path`` to use during analysis of the script
    :type sys_path: list
    :param environment: TODO
    :type sys_path: Environment
    """
    @others
</t>
<t tx="ekr.20180519065722.30">def __or__(self, other):
    return type(self).from_set(self._set | other._set)

</t>
<t tx="ekr.20180519065722.300">def completion_names(self, evaluator, only_modules=False):
    """
    :param only_modules: Indicates wheter it's possible to import a
        definition that is not defined in a module.
    """
    from jedi.evaluate.context import ModuleContext
    from jedi.evaluate.context.namespace import ImplicitNamespaceContext
    names = []
    if self.import_path:
        # flask
        if self.str_import_path == ('flask', 'ext'):
            # List Flask extensions like ``flask_foo``
            for mod in self._get_module_names():
                modname = mod.string_name
                if modname.startswith('flask_'):
                    extname = modname[len('flask_'):]
                    names.append(self._generate_name(extname))
            # Now the old style: ``flaskext.foo``
            for dir in self.sys_path_with_modifications():
                flaskext = os.path.join(dir, 'flaskext')
                if os.path.isdir(flaskext):
                    names += self._get_module_names([flaskext])

        for context in self.follow():
            # Non-modules are not completable.
            if context.api_type != 'module':  # not a module
                continue
            # namespace packages
            if isinstance(context, ModuleContext) and context.py__file__().endswith('__init__.py'):
                paths = context.py__path__()
                names += self._get_module_names(paths, in_module=context)

            # implicit namespace packages
            elif isinstance(context, ImplicitNamespaceContext):
                paths = context.paths
                names += self._get_module_names(paths, in_module=context)

            if only_modules:
                # In the case of an import like `from x.` we don't need to
                # add all the variables.
                if ('os',) == self.str_import_path and not self.level:
                    # os.path is a hardcoded exception, because it's a
                    # ``sys.modules`` modification.
                    names.append(self._generate_name('path', context))

                continue

            for filter in context.get_filters(search_global=False):
                names += filter.values()
    else:
        # Empty import path=completion after import
        if not self.level:
            names += self._get_module_names()

        if self.file_path is not None:
            path = os.path.abspath(self.file_path)
            for i in range(self.level - 1):
                path = os.path.dirname(path)
            names += self._get_module_names([path])

    return names


</t>
<t tx="ekr.20180519065722.301">def _load_module(evaluator, path=None, code=None, sys_path=None,
                 module_name=None, safe_module_name=False):
    try:
        return evaluator.module_cache.get(module_name)
    except KeyError:
        pass
    try:
        return evaluator.module_cache.get_from_path(path)
    except KeyError:
        pass

    if isinstance(path, ImplicitNSInfo):
        from jedi.evaluate.context.namespace import ImplicitNamespaceContext
        module = ImplicitNamespaceContext(
            evaluator,
            fullname=path.name,
            paths=path.paths,
        )
    else:
        if sys_path is None:
            sys_path = evaluator.get_sys_path()

        dotted_path = path and dotted_from_fs_path(path, sys_path)
        if path is not None and path.endswith(('.py', '.zip', '.egg')) \
                and dotted_path not in settings.auto_import_modules:

            module_node = evaluator.parse(
                code=code, path=path, cache=True, diff_cache=True,
                cache_path=settings.cache_directory)

            from jedi.evaluate.context import ModuleContext
            module = ModuleContext(
                evaluator, module_node,
                path=path,
                code_lines=get_cached_code_lines(evaluator.grammar, path),
            )
        else:
            module = compiled.load_module(evaluator, path=path, sys_path=sys_path)

    if module is not None and module_name is not None:
        add_module_to_cache(evaluator, module_name, module, safe=safe_module_name)

    return module


</t>
<t tx="ekr.20180519065722.302">def add_module_to_cache(evaluator, module_name, module, safe=False):
    if not safe and '.' not in module_name:
        # We cannot add paths with dots, because that would collide with
        # the sepatator dots for nested packages. Therefore we return
        # `__main__` in ModuleWrapper.py__name__(), which is similar to
        # Python behavior.
        return
    evaluator.module_cache.add(module, module_name)


</t>
<t tx="ekr.20180519065722.303">def get_modules_containing_name(evaluator, modules, name):
    """
    Search a name in the directories of modules.
    """
    def check_directories(paths):
        for p in paths:
            if p is not None:
                # We need abspath, because the seetings paths might not already
                # have been converted to absolute paths.
                d = os.path.dirname(os.path.abspath(p))
                for file_name in os.listdir(d):
                    path = os.path.join(d, file_name)
                    if file_name.endswith('.py'):
                        yield path

    def check_fs(path):
        with open(path, 'rb') as f:
            code = python_bytes_to_unicode(f.read(), errors='replace')
            if name in code:
                e_sys_path = evaluator.get_sys_path()
                module_name = sys_path.dotted_path_in_sys_path(e_sys_path, path)
                module = _load_module(
                    evaluator, path, code,
                    sys_path=e_sys_path, module_name=module_name
                )
                return module

    # skip non python modules
    used_mod_paths = set()
    for m in modules:
        try:
            path = m.py__file__()
        except AttributeError:
            pass
        else:
            used_mod_paths.add(path)
        yield m

    if not settings.dynamic_params_for_other_modules:
        return

    additional = set(os.path.abspath(p) for p in settings.additional_dynamic_modules)
    # Check the directories of used modules.
    paths = (additional | set(check_directories(used_mod_paths))) \
            - used_mod_paths

    # Sort here to make issues less random.
    for p in sorted(paths):
        # make testing easier, sort it - same results on every interpreter
        m = check_fs(p)
        if m is not None and not isinstance(m, compiled.CompiledObject):
            yield m
</t>
<t tx="ekr.20180519065722.304">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.305">"""
This module is not intended to be used in jedi, rather it will be fed to the
jedi-parser to replace classes in the typing module
"""

try:
    from collections import abc
except ImportError:
    # python 2
    import collections as abc


</t>
<t tx="ekr.20180519065722.306">def factory(typing_name, indextypes):
    class Iterable(abc.Iterable):
        def __iter__(self):
            while True:
                yield indextypes[0]()

    class Iterator(Iterable, abc.Iterator):
        def next(self):
            """ needed for python 2 """
            return self.__next__()

        def __next__(self):
            return indextypes[0]()

    class Sequence(abc.Sequence):
        def __getitem__(self, index):
            return indextypes[0]()

    class MutableSequence(Sequence, abc.MutableSequence):
        pass

    class List(MutableSequence, list):
        pass

    class Tuple(Sequence, tuple):
        def __getitem__(self, index):
            if indextypes[1] == Ellipsis:
                # https://www.python.org/dev/peps/pep-0484/#the-typing-module
                # Tuple[int, ...] means a tuple of ints of indetermined length
                return indextypes[0]()
            else:
                return indextypes[index]()

    class AbstractSet(Iterable, abc.Set):
        pass

    class MutableSet(AbstractSet, abc.MutableSet):
        pass

    class KeysView(Iterable, abc.KeysView):
        pass

    class ValuesView(abc.ValuesView):
        def __iter__(self):
            while True:
                yield indextypes[1]()

    class ItemsView(abc.ItemsView):
        def __iter__(self):
            while True:
                yield (indextypes[0](), indextypes[1]())

    class Mapping(Iterable, abc.Mapping):
        def __getitem__(self, item):
            return indextypes[1]()

        def keys(self):
            return KeysView()

        def values(self):
            return ValuesView()

        def items(self):
            return ItemsView()

    class MutableMapping(Mapping, abc.MutableMapping):
        pass

    class Dict(MutableMapping, dict):
        pass

    dct = {
        "Sequence": Sequence,
        "MutableSequence": MutableSequence,
        "List": List,
        "Iterable": Iterable,
        "Iterator": Iterator,
        "AbstractSet": AbstractSet,
        "MutableSet": MutableSet,
        "Mapping": Mapping,
        "MutableMapping": MutableMapping,
        "Tuple": Tuple,
        "KeysView": KeysView,
        "ItemsView": ItemsView,
        "ValuesView": ValuesView,
        "Dict": Dict,
    }
    return dct[typing_name]
</t>
<t tx="ekr.20180519065722.307">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.308">from jedi.evaluate.base_context import ContextSet, NO_CONTEXTS

</t>
<t tx="ekr.20180519065722.309">class AbstractLazyContext(object):
    @others
</t>
<t tx="ekr.20180519065722.31">def __iter__(self):
    for element in self._set:
        yield element

</t>
<t tx="ekr.20180519065722.310">def __init__(self, data):
    self.data = data

</t>
<t tx="ekr.20180519065722.311">def __repr__(self):
    return '&lt;%s: %s&gt;' % (self.__class__.__name__, self.data)

</t>
<t tx="ekr.20180519065722.312">def infer(self):
    raise NotImplementedError


</t>
<t tx="ekr.20180519065722.313">class LazyKnownContext(AbstractLazyContext):
    """data is a context."""
    @others
</t>
<t tx="ekr.20180519065722.314">def infer(self):
    return ContextSet(self.data)


</t>
<t tx="ekr.20180519065722.315">class LazyKnownContexts(AbstractLazyContext):
    """data is a ContextSet."""
    @others
</t>
<t tx="ekr.20180519065722.316">def infer(self):
    return self.data


</t>
<t tx="ekr.20180519065722.317">class LazyUnknownContext(AbstractLazyContext):
    @others
</t>
<t tx="ekr.20180519065722.318">def __init__(self):
    super(LazyUnknownContext, self).__init__(None)

</t>
<t tx="ekr.20180519065722.319">def infer(self):
    return NO_CONTEXTS


</t>
<t tx="ekr.20180519065722.32">def __bool__(self):
    return bool(self._set)

</t>
<t tx="ekr.20180519065722.320">class LazyTreeContext(AbstractLazyContext):
    @others
</t>
<t tx="ekr.20180519065722.321">def __init__(self, context, node):
    super(LazyTreeContext, self).__init__(node)
    self._context = context
    # We need to save the predefined names. It's an unfortunate side effect
    # that needs to be tracked otherwise results will be wrong.
    self._predefined_names = dict(context.predefined_names)

</t>
<t tx="ekr.20180519065722.322">def infer(self):
    old, self._context.predefined_names = \
        self._context.predefined_names, self._predefined_names
    try:
        return self._context.eval_node(self.data)
    finally:
        self._context.predefined_names = old


</t>
<t tx="ekr.20180519065722.323">def get_merged_lazy_context(lazy_contexts):
    if len(lazy_contexts) &gt; 1:
        return MergedLazyContexts(lazy_contexts)
    else:
        return lazy_contexts[0]


</t>
<t tx="ekr.20180519065722.324">class MergedLazyContexts(AbstractLazyContext):
    """data is a list of lazy contexts."""
    @others
</t>
<t tx="ekr.20180519065722.325">def infer(self):
    return ContextSet.from_sets(l.infer() for l in self.data)
</t>
<t tx="ekr.20180519065722.326">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.327">from collections import defaultdict

from jedi.evaluate.utils import PushBackIterator
from jedi.evaluate import analysis
from jedi.evaluate.lazy_context import LazyKnownContext, \
    LazyTreeContext, LazyUnknownContext
from jedi.evaluate import docstrings
from jedi.evaluate import pep0484
from jedi.evaluate.context import iterable


</t>
<t tx="ekr.20180519065722.328">def _add_argument_issue(parent_context, error_name, lazy_context, message):
    if isinstance(lazy_context, LazyTreeContext):
        node = lazy_context.data
        if node.parent.type == 'argument':
            node = node.parent
        analysis.add(parent_context, error_name, node, message)


</t>
<t tx="ekr.20180519065722.329">class ExecutedParam(object):
    """Fake a param and give it values."""
    @others
</t>
<t tx="ekr.20180519065722.33">def __len__(self):
    return len(self._set)

</t>
<t tx="ekr.20180519065722.330">def __init__(self, execution_context, param_node, lazy_context):
    self._execution_context = execution_context
    self._param_node = param_node
    self._lazy_context = lazy_context
    self.string_name = param_node.name.value

</t>
<t tx="ekr.20180519065722.331">def infer(self):
    pep0484_hints = pep0484.infer_param(self._execution_context, self._param_node)
    doc_params = docstrings.infer_param(self._execution_context, self._param_node)
    if pep0484_hints or doc_params:
        return pep0484_hints | doc_params

    return self._lazy_context.infer()

</t>
<t tx="ekr.20180519065722.332">@property
def var_args(self):
    return self._execution_context.var_args

</t>
<t tx="ekr.20180519065722.333">def __repr__(self):
    return '&lt;%s: %s&gt;' % (self.__class__.__name__, self.string_name)


</t>
<t tx="ekr.20180519065722.334">def get_params(execution_context, var_args):
    result_params = []
    param_dict = {}
    funcdef = execution_context.tree_node
    parent_context = execution_context.parent_context

    for param in funcdef.get_params():
        param_dict[param.name.value] = param
    unpacked_va = list(var_args.unpack(funcdef))
    var_arg_iterator = PushBackIterator(iter(unpacked_va))

    non_matching_keys = defaultdict(lambda: [])
    keys_used = {}
    keys_only = False
    had_multiple_value_error = False
    for param in funcdef.get_params():
        # The value and key can both be null. There, the defaults apply.
        # args / kwargs will just be empty arrays / dicts, respectively.
        # Wrong value count is just ignored. If you try to test cases that are
        # not allowed in Python, Jedi will maybe not show any completions.
        key, argument = next(var_arg_iterator, (None, None))
        while key is not None:
            keys_only = True
            try:
                key_param = param_dict[key]
            except KeyError:
                non_matching_keys[key] = argument
            else:
                if key in keys_used:
                    had_multiple_value_error = True
                    m = ("TypeError: %s() got multiple values for keyword argument '%s'."
                         % (funcdef.name, key))
                    for node in var_args.get_calling_nodes():
                        analysis.add(parent_context, 'type-error-multiple-values',
                                     node, message=m)
                else:
                    keys_used[key] = ExecutedParam(execution_context, key_param, argument)
            key, argument = next(var_arg_iterator, (None, None))

        try:
            result_params.append(keys_used[param.name.value])
            continue
        except KeyError:
            pass

        if param.star_count == 1:
            # *args param
            lazy_context_list = []
            if argument is not None:
                lazy_context_list.append(argument)
                for key, argument in var_arg_iterator:
                    # Iterate until a key argument is found.
                    if key:
                        var_arg_iterator.push_back((key, argument))
                        break
                    lazy_context_list.append(argument)
            seq = iterable.FakeSequence(execution_context.evaluator, u'tuple', lazy_context_list)
            result_arg = LazyKnownContext(seq)
        elif param.star_count == 2:
            # **kwargs param
            dct = iterable.FakeDict(execution_context.evaluator, dict(non_matching_keys))
            result_arg = LazyKnownContext(dct)
            non_matching_keys = {}
        else:
            # normal param
            if argument is None:
                # No value: Return an empty container
                if param.default is None:
                    result_arg = LazyUnknownContext()
                    if not keys_only:
                        for node in var_args.get_calling_nodes():
                            m = _error_argument_count(funcdef, len(unpacked_va))
                            analysis.add(parent_context, 'type-error-too-few-arguments',
                                         node, message=m)
                else:
                    result_arg = LazyTreeContext(parent_context, param.default)
            else:
                result_arg = argument

        result_params.append(ExecutedParam(execution_context, param, result_arg))
        if not isinstance(result_arg, LazyUnknownContext):
            keys_used[param.name.value] = result_params[-1]

    if keys_only:
        # All arguments should be handed over to the next function. It's not
        # about the values inside, it's about the names. Jedi needs to now that
        # there's nothing to find for certain names.
        for k in set(param_dict) - set(keys_used):
            param = param_dict[k]

            if not (non_matching_keys or had_multiple_value_error or
                    param.star_count or param.default):
                # add a warning only if there's not another one.
                for node in var_args.get_calling_nodes():
                    m = _error_argument_count(funcdef, len(unpacked_va))
                    analysis.add(parent_context, 'type-error-too-few-arguments',
                                 node, message=m)

    for key, lazy_context in non_matching_keys.items():
        m = "TypeError: %s() got an unexpected keyword argument '%s'." \
            % (funcdef.name, key)
        _add_argument_issue(
            parent_context,
            'type-error-keyword-argument',
            lazy_context,
            message=m
        )

    remaining_arguments = list(var_arg_iterator)
    if remaining_arguments:
        m = _error_argument_count(funcdef, len(unpacked_va))
        # Just report an error for the first param that is not needed (like
        # cPython).
        first_key, lazy_context = remaining_arguments[0]
        if var_args.get_calling_nodes():
            # There might not be a valid calling node so check for that first.
            _add_argument_issue(parent_context, 'type-error-too-many-arguments', lazy_context, message=m)
    return result_params


</t>
<t tx="ekr.20180519065722.335">def _error_argument_count(funcdef, actual_count):
    params = funcdef.get_params()
    default_arguments = sum(1 for p in params if p.default or p.star_count)

    if default_arguments == 0:
        before = 'exactly '
    else:
        before = 'from %s to ' % (len(params) - default_arguments)
    return ('TypeError: %s() takes %s%s arguments (%s given).'
            % (funcdef.name, before, len(params), actual_count))


</t>
<t tx="ekr.20180519065722.336">def _create_default_param(execution_context, param):
    if param.star_count == 1:
        result_arg = LazyKnownContext(
            iterable.FakeSequence(execution_context.evaluator, u'tuple', [])
        )
    elif param.star_count == 2:
        result_arg = LazyKnownContext(
            iterable.FakeDict(execution_context.evaluator, {})
        )
    elif param.default is None:
        result_arg = LazyUnknownContext()
    else:
        result_arg = LazyTreeContext(execution_context.parent_context, param.default)
    return ExecutedParam(execution_context, param, result_arg)


</t>
<t tx="ekr.20180519065722.337">def create_default_params(execution_context, funcdef):
    return [_create_default_param(execution_context, p)
            for p in funcdef.get_params()]
</t>
<t tx="ekr.20180519065722.338">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.339">from jedi.evaluate.cache import evaluator_function_cache


</t>
<t tx="ekr.20180519065722.34">def __repr__(self):
    return '%s(%s)' % (self.__class__.__name__, ', '.join(str(s) for s in self._set))

</t>
<t tx="ekr.20180519065722.340">@evaluator_function_cache()
def get_yield_exprs(evaluator, funcdef):
    return list(funcdef.iter_yield_exprs())
</t>
<t tx="ekr.20180519065722.341">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.342">"""
PEP 0484 ( https://www.python.org/dev/peps/pep-0484/ ) describes type hints
through function annotations. There is a strong suggestion in this document
that only the type of type hinting defined in PEP0484 should be allowed
as annotations in future python versions.

The (initial / probably incomplete) implementation todo list for pep-0484:
v Function parameter annotations with builtin/custom type classes
v Function returntype annotations with builtin/custom type classes
v Function parameter annotations with strings (forward reference)
v Function return type annotations with strings (forward reference)
v Local variable type hints
v Assigned types: `Url = str\ndef get(url:Url) -&gt; str:`
v Type hints in `with` statements
x Stub files support
x support `@no_type_check` and `@no_type_check_decorator`
x support for typing.cast() operator
x support for type hint comments for functions, `# type: (int, str) -&gt; int`.
    See comment from Guido https://github.com/davidhalter/jedi/issues/662
"""

import os
import re

from parso import ParserSyntaxError, parse, split_lines
from parso.python import tree

from jedi._compatibility import unicode, force_unicode
from jedi.evaluate.cache import evaluator_method_cache
from jedi.evaluate import compiled
from jedi.evaluate.base_context import NO_CONTEXTS, ContextSet
from jedi.evaluate.lazy_context import LazyTreeContext
from jedi.evaluate.context import ModuleContext
from jedi.evaluate.helpers import is_string
from jedi import debug
from jedi import parser_utils


</t>
<t tx="ekr.20180519065722.343">def _evaluate_for_annotation(context, annotation, index=None):
    """
    Evaluates a string-node, looking for an annotation
    If index is not None, the annotation is expected to be a tuple
    and we're interested in that index
    """
    context_set = context.eval_node(_fix_forward_reference(context, annotation))
    return context_set.execute_evaluated()


</t>
<t tx="ekr.20180519065722.344">def _evaluate_annotation_string(context, string, index=None):
    node = _get_forward_reference_node(context, string)
    if node is None:
        return NO_CONTEXTS

    context_set = context.eval_node(node)
    if index is not None:
        context_set = context_set.filter(
            lambda context: context.array_type == u'tuple'
                            and len(list(context.py__iter__())) &gt;= index
        ).py__getitem__(index)
    return context_set.execute_evaluated()


</t>
<t tx="ekr.20180519065722.345">def _fix_forward_reference(context, node):
    evaled_nodes = context.eval_node(node)
    if len(evaled_nodes) != 1:
        debug.warning("Eval'ed typing index %s should lead to 1 object, "
                      " not %s" % (node, evaled_nodes))
        return node

    evaled_context = list(evaled_nodes)[0]
    if is_string(evaled_context):
        result = _get_forward_reference_node(context, evaled_context.get_safe_value())
        if result is not None:
            return result

    return node


</t>
<t tx="ekr.20180519065722.346">def _get_forward_reference_node(context, string):
    try:
        new_node = context.evaluator.grammar.parse(
            force_unicode(string),
            start_symbol='eval_input',
            error_recovery=False
        )
    except ParserSyntaxError:
        debug.warning('Annotation not parsed: %s' % string)
        return None
    else:
        module = context.tree_node.get_root_node()
        parser_utils.move(new_node, module.end_pos[0])
        new_node.parent = context.tree_node
        return new_node


</t>
<t tx="ekr.20180519065722.347">def _split_comment_param_declaration(decl_text):
    """
    Split decl_text on commas, but group generic expressions
    together.

    For example, given "foo, Bar[baz, biz]" we return
    ['foo', 'Bar[baz, biz]'].

    """
    try:
        node = parse(decl_text, error_recovery=False).children[0]
    except ParserSyntaxError:
        debug.warning('Comment annotation is not valid Python: %s' % decl_text)
        return []

    if node.type == 'name':
        return [node.get_code().strip()]

    params = []
    try:
        children = node.children
    except AttributeError:
        return []
    else:
        for child in children:
            if child.type in ['name', 'atom_expr', 'power']:
                params.append(child.get_code().strip())

    return params


</t>
<t tx="ekr.20180519065722.348">@evaluator_method_cache()
def infer_param(execution_context, param):
    """
    Infers the type of a function parameter, using type annotations.
    """
    annotation = param.annotation
    if annotation is None:
        # If no Python 3-style annotation, look for a Python 2-style comment
        # annotation.
        # Identify parameters to function in the same sequence as they would
        # appear in a type comment.
        all_params = [child for child in param.parent.children
                      if child.type == 'param']

        node = param.parent.parent
        comment = parser_utils.get_following_comment_same_line(node)
        if comment is None:
            return NO_CONTEXTS

        match = re.match(r"^#\s*type:\s*\(([^#]*)\)\s*-&gt;", comment)
        if not match:
            return NO_CONTEXTS
        params_comments = _split_comment_param_declaration(match.group(1))

        # Find the specific param being investigated
        index = all_params.index(param)
        # If the number of parameters doesn't match length of type comment,
        # ignore first parameter (assume it's self).
        if len(params_comments) != len(all_params):
            debug.warning(
                "Comments length != Params length %s %s",
                params_comments, all_params
            )
        from jedi.evaluate.context.instance import BaseInstanceFunctionExecution
        if isinstance(execution_context, BaseInstanceFunctionExecution):
            if index == 0:
                # Assume it's self, which is already handled
                return NO_CONTEXTS
            index -= 1
        if index &gt;= len(params_comments):
            return NO_CONTEXTS

        param_comment = params_comments[index]
        return _evaluate_annotation_string(
            execution_context.get_root_context(),
            param_comment
        )
    module_context = execution_context.get_root_context()
    return _evaluate_for_annotation(module_context, annotation)


</t>
<t tx="ekr.20180519065722.35">def filter(self, filter_func):
    return type(self).from_iterable(filter(filter_func, self._set))

</t>
<t tx="ekr.20180519065722.36">def __getattr__(self, name):
    def mapper(*args, **kwargs):
        return type(self).from_sets(
            getattr(context, name)(*args, **kwargs)
            for context in self._set
        )
    return mapper
</t>
<t tx="ekr.20180519065722.37">@path C:/Anaconda3/Lib/site-packages/jedi/common/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.38">import os


</t>
<t tx="ekr.20180519065722.39">def traverse_parents(path, include_current=False):
    if not include_current:
        path = os.path.dirname(path)

    previous = None
    while previous != path:
        yield path
        previous = path
        path = os.path.dirname(path)
</t>
<t tx="ekr.20180519065722.4">def __init__(self, source=None, line=None, column=None, path=None,
             encoding='utf-8', sys_path=None, environment=None):
    self._orig_path = path
    # An empty path (also empty string) should always result in no path.
    self.path = os.path.abspath(path) if path else None

    if source is None:
        # TODO add a better warning than the traceback!
        with open(path, 'rb') as f:
            source = f.read()

    # Load the Python grammar of the current interpreter.
    self._grammar = parso.load_grammar()

    if sys_path is not None and not is_py3:
        sys_path = list(map(force_unicode, sys_path))

    # Load the Python grammar of the current interpreter.
    project = get_default_project(
        os.path.dirname(self.path)if path else os.getcwd()
    )
    # TODO deprecate and remove sys_path from the Script API.
    if sys_path is not None:
        project._sys_path = sys_path
    self._evaluator = Evaluator(
        project, environment=environment, script_path=self.path
    )
    self._project = project
    debug.speed('init')
    self._module_node, source = self._evaluator.parse_and_get_code(
        code=source,
        path=self.path,
        cache=False,  # No disk cache, because the current script often changes.
        diff_cache=True,
        cache_path=settings.cache_directory
    )
    debug.speed('parsed')
    self._code_lines = parso.split_lines(source, keepends=True)
    self._code = source
    line = max(len(self._code_lines), 1) if line is None else line
    if not (0 &lt; line &lt;= len(self._code_lines)):
        raise ValueError('`line` parameter is not in a valid range.')

    line_string = self._code_lines[line - 1]
    line_len = len(line_string)
    if line_string.endswith('\r\n'):
        line_len -= 1
    if line_string.endswith('\n'):
        line_len -= 1

    column = line_len if column is None else column
    if not (0 &lt;= column &lt;= line_len):
        raise ValueError('`column` parameter is not in a valid range.')
    self._pos = line, column
    self._path = path

    cache.clear_time_caches()
    debug.reset_time()

</t>
<t tx="ekr.20180519065722.40">@path C:/Anaconda3/Lib/site-packages/jedi/common/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.41">from jedi.common.context import BaseContextSet, BaseContext
</t>
<t tx="ekr.20180519065722.43"></t>
<t tx="ekr.20180519065722.44">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.45">"""
Module for statical analysis.
"""
from parso.python import tree

from jedi._compatibility import force_unicode
from jedi import debug
from jedi.evaluate.compiled import CompiledObject
from jedi.evaluate.helpers import is_string


CODES = {
    'attribute-error': (1, AttributeError, 'Potential AttributeError.'),
    'name-error': (2, NameError, 'Potential NameError.'),
    'import-error': (3, ImportError, 'Potential ImportError.'),
    'type-error-too-many-arguments': (4, TypeError, None),
    'type-error-too-few-arguments': (5, TypeError, None),
    'type-error-keyword-argument': (6, TypeError, None),
    'type-error-multiple-values': (7, TypeError, None),
    'type-error-star-star': (8, TypeError, None),
    'type-error-star': (9, TypeError, None),
    'type-error-operation': (10, TypeError, None),
    'type-error-not-iterable': (11, TypeError, None),
    'type-error-isinstance': (12, TypeError, None),
    'type-error-not-subscriptable': (13, TypeError, None),
    'value-error-too-many-values': (14, ValueError, None),
    'value-error-too-few-values': (15, ValueError, None),
}


</t>
<t tx="ekr.20180519065722.46">class Error(object):
    @others
</t>
<t tx="ekr.20180519065722.47">def __init__(self, name, module_path, start_pos, message=None):
    self.path = module_path
    self._start_pos = start_pos
    self.name = name
    if message is None:
        message = CODES[self.name][2]
    self.message = message

</t>
<t tx="ekr.20180519065722.48">@property
def line(self):
    return self._start_pos[0]

</t>
<t tx="ekr.20180519065722.49">@property
def column(self):
    return self._start_pos[1]

</t>
<t tx="ekr.20180519065722.5">def _get_module(self):
    name = '__main__'
    if self.path is not None:
        n = dotted_path_in_sys_path(self._evaluator.get_sys_path(), self.path)
        if n is not None:
            name = n

    module = ModuleContext(
        self._evaluator, self._module_node, self.path,
        code_lines=self._code_lines
    )
    imports.add_module_to_cache(self._evaluator, name, module)
    return module

</t>
<t tx="ekr.20180519065722.50">@property
def code(self):
    # The class name start
    first = self.__class__.__name__[0]
    return first + str(CODES[self.name][0])

</t>
<t tx="ekr.20180519065722.51">def __unicode__(self):
    return '%s:%s:%s: %s %s' % (self.path, self.line, self.column,
                                self.code, self.message)

</t>
<t tx="ekr.20180519065722.52">def __str__(self):
    return self.__unicode__()

</t>
<t tx="ekr.20180519065722.53">def __eq__(self, other):
    return (self.path == other.path and self.name == other.name and
            self._start_pos == other._start_pos)

</t>
<t tx="ekr.20180519065722.54">def __ne__(self, other):
    return not self.__eq__(other)

</t>
<t tx="ekr.20180519065722.55">def __hash__(self):
    return hash((self.path, self._start_pos, self.name))

</t>
<t tx="ekr.20180519065722.56">def __repr__(self):
    return '&lt;%s %s: %s@%s,%s&gt;' % (self.__class__.__name__,
                                  self.name, self.path,
                                  self._start_pos[0], self._start_pos[1])


</t>
<t tx="ekr.20180519065722.57">class Warning(Error):
    pass


</t>
<t tx="ekr.20180519065722.58">def add(node_context, error_name, node, message=None, typ=Error, payload=None):
    exception = CODES[error_name][1]
    if _check_for_exception_catch(node_context, node, exception, payload):
        return

    # TODO this path is probably not right
    module_context = node_context.get_root_context()
    module_path = module_context.py__file__()
    instance = typ(error_name, module_path, node.start_pos, message)
    debug.warning(str(instance), format=False)
    node_context.evaluator.analysis.append(instance)


</t>
<t tx="ekr.20180519065722.59">def _check_for_setattr(instance):
    """
    Check if there's any setattr method inside an instance. If so, return True.
    """
    from jedi.evaluate.context import ModuleContext
    module = instance.get_root_context()
    if not isinstance(module, ModuleContext):
        return False

    node = module.tree_node
    try:
        stmts = node.get_used_names()['setattr']
    except KeyError:
        return False

    return any(node.start_pos &lt; stmt.start_pos &lt; node.end_pos
               for stmt in stmts)


</t>
<t tx="ekr.20180519065722.6">def __repr__(self):
    return '&lt;%s: %s&gt;' % (self.__class__.__name__, repr(self._orig_path))

</t>
<t tx="ekr.20180519065722.60">def add_attribute_error(name_context, lookup_context, name):
    message = ('AttributeError: %s has no attribute %s.' % (lookup_context, name))
    from jedi.evaluate.context.instance import AbstractInstanceContext, CompiledInstanceName
    # Check for __getattr__/__getattribute__ existance and issue a warning
    # instead of an error, if that happens.
    typ = Error
    if isinstance(lookup_context, AbstractInstanceContext):
        slot_names = lookup_context.get_function_slot_names(u'__getattr__') + \
            lookup_context.get_function_slot_names(u'__getattribute__')
        for n in slot_names:
            # TODO do we even get here?
            if isinstance(name, CompiledInstanceName) and \
                    n.parent_context.obj == object:
                typ = Warning
                break

        if _check_for_setattr(lookup_context):
            typ = Warning

    payload = lookup_context, name
    add(name_context, 'attribute-error', name, message, typ, payload)


</t>
<t tx="ekr.20180519065722.61">def _check_for_exception_catch(node_context, jedi_name, exception, payload=None):
    """
    Checks if a jedi object (e.g. `Statement`) sits inside a try/catch and
    doesn't count as an error (if equal to `exception`).
    Also checks `hasattr` for AttributeErrors and uses the `payload` to compare
    it.
    Returns True if the exception was catched.
    """
    def check_match(cls, exception):
        try:
            return isinstance(cls, CompiledObject) and cls.is_super_class(exception)
        except TypeError:
            return False

    def check_try_for_except(obj, exception):
        # Only nodes in try
        iterator = iter(obj.children)
        for branch_type in iterator:
            colon = next(iterator)
            suite = next(iterator)
            if branch_type == 'try' \
                    and not (branch_type.start_pos &lt; jedi_name.start_pos &lt;= suite.end_pos):
                return False

        for node in obj.get_except_clause_tests():
            if node is None:
                return True  # An exception block that catches everything.
            else:
                except_classes = node_context.eval_node(node)
                for cls in except_classes:
                    from jedi.evaluate.context import iterable
                    if isinstance(cls, iterable.Sequence) and \
                            cls.array_type == 'tuple':
                        # multiple exceptions
                        for lazy_context in cls.py__iter__():
                            for typ in lazy_context.infer():
                                if check_match(typ, exception):
                                    return True
                    else:
                        if check_match(cls, exception):
                            return True

    def check_hasattr(node, suite):
        try:
            assert suite.start_pos &lt;= jedi_name.start_pos &lt; suite.end_pos
            assert node.type in ('power', 'atom_expr')
            base = node.children[0]
            assert base.type == 'name' and base.value == 'hasattr'
            trailer = node.children[1]
            assert trailer.type == 'trailer'
            arglist = trailer.children[1]
            assert arglist.type == 'arglist'
            from jedi.evaluate.arguments import TreeArguments
            args = list(TreeArguments(node_context.evaluator, node_context, arglist).unpack())
            # Arguments should be very simple
            assert len(args) == 2

            # Check name
            key, lazy_context = args[1]
            names = list(lazy_context.infer())
            assert len(names) == 1 and is_string(names[0])
            assert force_unicode(names[0].get_safe_value()) == payload[1].value

            # Check objects
            key, lazy_context = args[0]
            objects = lazy_context.infer()
            return payload[0] in objects
        except AssertionError:
            return False

    obj = jedi_name
    while obj is not None and not isinstance(obj, (tree.Function, tree.Class)):
        if isinstance(obj, tree.Flow):
            # try/except catch check
            if obj.type == 'try_stmt' and check_try_for_except(obj, exception):
                return True
            # hasattr check
            if exception == AttributeError and obj.type in ('if_stmt', 'while_stmt'):
                if check_hasattr(obj.children[1], obj.children[3]):
                    return True
        obj = obj.parent

    return False
</t>
<t tx="ekr.20180519065722.62">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.63">from parso.python import tree

from jedi._compatibility import zip_longest
from jedi import debug
from jedi.evaluate import analysis
from jedi.evaluate.lazy_context import LazyKnownContext, LazyKnownContexts, \
    LazyTreeContext, get_merged_lazy_context
from jedi.evaluate.filters import ParamName
from jedi.evaluate.base_context import NO_CONTEXTS
from jedi.evaluate.context import iterable
from jedi.evaluate.param import get_params, ExecutedParam


</t>
<t tx="ekr.20180519065722.64">def try_iter_content(types, depth=0):
    """Helper method for static analysis."""
    if depth &gt; 10:
        # It's possible that a loop has references on itself (especially with
        # CompiledObject). Therefore don't loop infinitely.
        return

    for typ in types:
        try:
            f = typ.py__iter__
        except AttributeError:
            pass
        else:
            for lazy_context in f():
                try_iter_content(lazy_context.infer(), depth + 1)


</t>
<t tx="ekr.20180519065722.65">class AbstractArguments(object):
    context = None
    argument_node = None
    trailer = None

    @others
</t>
<t tx="ekr.20180519065722.66">def eval_argument_clinic(self, parameters):
    """Uses a list with argument clinic information (see PEP 436)."""
    iterator = self.unpack()
    for i, (name, optional, allow_kwargs) in enumerate(parameters):
        key, argument = next(iterator, (None, None))
        if key is not None:
            raise NotImplementedError
        if argument is None and not optional:
            debug.warning('TypeError: %s expected at least %s arguments, got %s',
                          name, len(parameters), i)
            raise ValueError
        values = NO_CONTEXTS if argument is None else argument.infer()

        if not values and not optional:
            # For the stdlib we always want values. If we don't get them,
            # that's ok, maybe something is too hard to resolve, however,
            # we will not proceed with the evaluation of that function.
            debug.warning('argument_clinic "%s" not resolvable.', name)
            raise ValueError
        yield values

</t>
<t tx="ekr.20180519065722.67">def eval_all(self, funcdef=None):
    """
    Evaluates all arguments as a support for static analysis
    (normally Jedi).
    """
    for key, lazy_context in self.unpack():
        types = lazy_context.infer()
        try_iter_content(types)

</t>
<t tx="ekr.20180519065722.68">def get_calling_nodes(self):
    raise NotImplementedError

</t>
<t tx="ekr.20180519065722.69">def unpack(self, funcdef=None):
    raise NotImplementedError

</t>
<t tx="ekr.20180519065722.7">def completions(self):
    """
    Return :class:`classes.Completion` objects. Those objects contain
    information about the completions, more than just names.

    :return: Completion objects, sorted by name and __ comes last.
    :rtype: list of :class:`classes.Completion`
    """
    debug.speed('completions start')
    completion = Completion(
        self._evaluator, self._get_module(), self._code_lines,
        self._pos, self.call_signatures
    )
    completions = completion.completions()
    debug.speed('completions end')
    return completions

</t>
<t tx="ekr.20180519065722.70">def get_params(self, execution_context):
    return get_params(execution_context, self)


</t>
<t tx="ekr.20180519065722.71">class AnonymousArguments(AbstractArguments):
    @others
</t>
<t tx="ekr.20180519065722.72">def get_params(self, execution_context):
    from jedi.evaluate.dynamic import search_params
    return search_params(
        execution_context.evaluator,
        execution_context,
        execution_context.tree_node
    )


</t>
<t tx="ekr.20180519065722.73">class TreeArguments(AbstractArguments):
    @others
</t>
<t tx="ekr.20180519065722.74">def __init__(self, evaluator, context, argument_node, trailer=None):
    """
    The argument_node is either a parser node or a list of evaluated
    objects. Those evaluated objects may be lists of evaluated objects
    themselves (one list for the first argument, one for the second, etc).

    :param argument_node: May be an argument_node or a list of nodes.
    """
    self.argument_node = argument_node
    self.context = context
    self._evaluator = evaluator
    self.trailer = trailer  # Can be None, e.g. in a class definition.

</t>
<t tx="ekr.20180519065722.75">def _split(self):
    if self.argument_node is None:
        return

    # Allow testlist here as well for Python2's class inheritance
    # definitions.
    if not (self.argument_node.type in ('arglist', 'testlist') or (
            # in python 3.5 **arg is an argument, not arglist
            (self.argument_node.type == 'argument') and
             self.argument_node.children[0] in ('*', '**'))):
        yield 0, self.argument_node
        return

    iterator = iter(self.argument_node.children)
    for child in iterator:
        if child == ',':
            continue
        elif child in ('*', '**'):
            yield len(child.value), next(iterator)
        elif child.type == 'argument' and \
                child.children[0] in ('*', '**'):
            assert len(child.children) == 2
            yield len(child.children[0].value), child.children[1]
        else:
            yield 0, child

</t>
<t tx="ekr.20180519065722.76">def unpack(self, funcdef=None):
    named_args = []
    for star_count, el in self._split():
        if star_count == 1:
            arrays = self.context.eval_node(el)
            iterators = [_iterate_star_args(self.context, a, el, funcdef)
                         for a in arrays]
            for values in list(zip_longest(*iterators)):
                # TODO zip_longest yields None, that means this would raise
                # an exception?
                yield None, get_merged_lazy_context(
                    [v for v in values if v is not None]
                )
        elif star_count == 2:
            arrays = self.context.eval_node(el)
            for dct in arrays:
                for key, values in _star_star_dict(self.context, dct, el, funcdef):
                    yield key, values
        else:
            if el.type == 'argument':
                c = el.children
                if len(c) == 3:  # Keyword argument.
                    named_args.append((c[0].value, LazyTreeContext(self.context, c[2]),))
                else:  # Generator comprehension.
                    # Include the brackets with the parent.
                    comp = iterable.GeneratorComprehension(
                        self._evaluator, self.context, self.argument_node.parent)
                    yield None, LazyKnownContext(comp)
            else:
                yield None, LazyTreeContext(self.context, el)

    # Reordering var_args is necessary, because star args sometimes appear
    # after named argument, but in the actual order it's prepended.
    for named_arg in named_args:
        yield named_arg

</t>
<t tx="ekr.20180519065722.77">def as_tree_tuple_objects(self):
    for star_count, argument in self._split():
        if argument.type == 'argument':
            argument, default = argument.children[::2]
        else:
            default = None
        yield argument, default, star_count

</t>
<t tx="ekr.20180519065722.78">def __repr__(self):
    return '&lt;%s: %s&gt;' % (self.__class__.__name__, self.argument_node)

</t>
<t tx="ekr.20180519065722.79">def get_calling_nodes(self):
    from jedi.evaluate.dynamic import MergedExecutedParams
    old_arguments_list = []
    arguments = self

    while arguments not in old_arguments_list:
        if not isinstance(arguments, TreeArguments):
            break

        old_arguments_list.append(arguments)
        for name, default, star_count in reversed(list(arguments.as_tree_tuple_objects())):
            if not star_count or not isinstance(name, tree.Name):
                continue

            names = self._evaluator.goto(arguments.context, name)
            if len(names) != 1:
                break
            if not isinstance(names[0], ParamName):
                break
            param = names[0].get_param()
            if isinstance(param, MergedExecutedParams):
                # For dynamic searches we don't even want to see errors.
                return []
            if not isinstance(param, ExecutedParam):
                break
            if param.var_args is None:
                break
            arguments = param.var_args
            break

    if arguments.argument_node is not None:
        return [arguments.argument_node]
    if arguments.trailer is not None:
        return [arguments.trailer]
    return []


</t>
<t tx="ekr.20180519065722.8">def goto_definitions(self):
    """
    Return the definitions of a the path under the cursor.  goto function!
    This follows complicated paths and returns the end, not the first
    definition. The big difference between :meth:`goto_assignments` and
    :meth:`goto_definitions` is that :meth:`goto_assignments` doesn't
    follow imports and statements. Multiple objects may be returned,
    because Python itself is a dynamic language, which means depending on
    an option you can have two different versions of a function.

    :rtype: list of :class:`classes.Definition`
    """
    leaf = self._module_node.get_name_of_position(self._pos)
    if leaf is None:
        leaf = self._module_node.get_leaf_for_position(self._pos)
        if leaf is None:
            return []

    context = self._evaluator.create_context(self._get_module(), leaf)
    definitions = helpers.evaluate_goto_definition(self._evaluator, context, leaf)

    names = [s.name for s in definitions]
    defs = [classes.Definition(self._evaluator, name) for name in names]
    # The additional set here allows the definitions to become unique in an
    # API sense. In the internals we want to separate more things than in
    # the API.
    return helpers.sorted_definitions(set(defs))

</t>
<t tx="ekr.20180519065722.80">class ValuesArguments(AbstractArguments):
    @others
</t>
<t tx="ekr.20180519065722.81">def __init__(self, values_list):
    self._values_list = values_list

</t>
<t tx="ekr.20180519065722.82">def unpack(self, funcdef=None):
    for values in self._values_list:
        yield None, LazyKnownContexts(values)

</t>
<t tx="ekr.20180519065722.83">def get_calling_nodes(self):
    return []

</t>
<t tx="ekr.20180519065722.84">def __repr__(self):
    return '&lt;%s: %s&gt;' % (self.__class__.__name__, self._values_list)


</t>
<t tx="ekr.20180519065722.85">def _iterate_star_args(context, array, input_node, funcdef=None):
    try:
        iter_ = array.py__iter__
    except AttributeError:
        if funcdef is not None:
            # TODO this funcdef should not be needed.
            m = "TypeError: %s() argument after * must be a sequence, not %s" \
                % (funcdef.name.value, array)
            analysis.add(context, 'type-error-star', input_node, message=m)
    else:
        for lazy_context in iter_():
            yield lazy_context


</t>
<t tx="ekr.20180519065722.86">def _star_star_dict(context, array, input_node, funcdef):
    from jedi.evaluate.context.instance import CompiledInstance
    if isinstance(array, CompiledInstance) and array.name.string_name == 'dict':
        # For now ignore this case. In the future add proper iterators and just
        # make one call without crazy isinstance checks.
        return {}
    elif isinstance(array, iterable.Sequence) and array.array_type == 'dict':
        return array.exact_key_items()
    else:
        if funcdef is not None:
            m = "TypeError: %s argument after ** must be a mapping, not %s" \
                % (funcdef.name.value, array)
            analysis.add(context, 'type-error-star-star', input_node, message=m)
        return {}
</t>
<t tx="ekr.20180519065722.87">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065722.88">"""
Contexts are the "values" that Python would return. However Contexts are at the
same time also the "contexts" that a user is currently sitting in.

A ContextSet is typically used to specify the return of a function or any other
static analysis operation. In jedi there are always multiple returns and not
just one.
"""
from parso.python.tree import ExprStmt, CompFor

from jedi import debug
from jedi._compatibility import Python3Method, zip_longest, unicode
from jedi.parser_utils import clean_scope_docstring, get_doc_with_call_signature
from jedi.common import BaseContextSet, BaseContext


</t>
<t tx="ekr.20180519065722.89">class Context(BaseContext):
    """
    Should be defined, otherwise the API returns empty types.
    """

    predefined_names = {}
    tree_node = None
    """
    To be defined by subclasses.
    """

    @others
</t>
<t tx="ekr.20180519065722.9">def goto_assignments(self, follow_imports=False):
    """
    Return the first definition found, while optionally following imports.
    Multiple objects may be returned, because Python itself is a
    dynamic language, which means depending on an option you can have two
    different versions of a function.

    :rtype: list of :class:`classes.Definition`
    """
    def filter_follow_imports(names, check):
        for name in names:
            if check(name):
                for result in filter_follow_imports(name.goto(), check):
                    yield result
            else:
                yield name

    tree_name = self._module_node.get_name_of_position(self._pos)
    if tree_name is None:
        return []
    context = self._evaluator.create_context(self._get_module(), tree_name)
    names = list(self._evaluator.goto(context, tree_name))

    if follow_imports:
        def check(name):
            return name.is_import()
    else:
        def check(name):
            return isinstance(name, imports.SubModuleName)

    names = filter_follow_imports(names, check)

    defs = [classes.Definition(self._evaluator, d) for d in set(names)]
    return helpers.sorted_definitions(defs)

</t>
<t tx="ekr.20180519065722.90">@property
def api_type(self):
    # By default just lower name of the class. Can and should be
    # overwritten.
    return self.__class__.__name__.lower()

</t>
<t tx="ekr.20180519065722.91">@debug.increase_indent
def execute(self, arguments):
    """
    In contrast to py__call__ this function is always available.

    `hasattr(x, py__call__)` can also be checked to see if a context is
    executable.
    """
    if self.evaluator.is_analysis:
        arguments.eval_all()

    debug.dbg('execute: %s %s', self, arguments)
    from jedi.evaluate import stdlib
    try:
        # Some stdlib functions like super(), namedtuple(), etc. have been
        # hard-coded in Jedi to support them.
        return stdlib.execute(self.evaluator, self, arguments)
    except stdlib.NotInStdLib:
        pass

    try:
        func = self.py__call__
    except AttributeError:
        debug.warning("no execution possible %s", self)
        return NO_CONTEXTS
    else:
        context_set = func(arguments)
        debug.dbg('execute result: %s in %s', context_set, self)
        return context_set

    return self.evaluator.execute(self, arguments)

</t>
<t tx="ekr.20180519065722.92">def execute_evaluated(self, *value_list):
    """
    Execute a function with already executed arguments.
    """
    from jedi.evaluate.arguments import ValuesArguments
    arguments = ValuesArguments([ContextSet(value) for value in value_list])
    return self.execute(arguments)

</t>
<t tx="ekr.20180519065722.93">def iterate(self, contextualized_node=None, is_async=False):
    debug.dbg('iterate %s', self)
    try:
        if is_async:
            iter_method = self.py__aiter__
        else:
            iter_method = self.py__iter__
    except AttributeError:
        if contextualized_node is not None:
            from jedi.evaluate import analysis
            analysis.add(
                contextualized_node.context,
                'type-error-not-iterable',
                contextualized_node.node,
                message="TypeError: '%s' object is not iterable" % self)
        return iter([])
    else:
        return iter_method()

</t>
<t tx="ekr.20180519065722.94">def get_item(self, index_contexts, contextualized_node):
    from jedi.evaluate.compiled import CompiledObject
    from jedi.evaluate.context.iterable import Slice, Sequence
    result = ContextSet()

    for index in index_contexts:
        if isinstance(index, Slice):
            index = index.obj
        if isinstance(index, CompiledObject):
            try:
                index = index.get_safe_value()
            except ValueError:
                pass

        if type(index) not in (float, int, str, unicode, slice, bytes):
            # If the index is not clearly defined, we have to get all the
            # possiblities.
            if isinstance(self, Sequence) and self.array_type == 'dict':
                result |= self.dict_values()
            else:
                result |= iterate_contexts(ContextSet(self))
            continue

        # The actual getitem call.
        try:
            getitem = self.py__getitem__
        except AttributeError:
            from jedi.evaluate import analysis
            # TODO this context is probably not right.
            analysis.add(
                contextualized_node.context,
                'type-error-not-subscriptable',
                contextualized_node.node,
                message="TypeError: '%s' object is not subscriptable" % self
            )
        else:
            try:
                result |= getitem(index)
            except IndexError:
                result |= iterate_contexts(ContextSet(self))
            except KeyError:
                # Must be a dict. Lists don't raise KeyErrors.
                result |= self.dict_values()
    return result

</t>
<t tx="ekr.20180519065722.95">def eval_node(self, node):
    return self.evaluator.eval_element(self, node)

</t>
<t tx="ekr.20180519065722.96">@Python3Method
def py__getattribute__(self, name_or_str, name_context=None, position=None,
                       search_global=False, is_goto=False,
                       analysis_errors=True):
    """
    :param position: Position of the last statement -&gt; tuple of line, column
    """
    if name_context is None:
        name_context = self
    from jedi.evaluate import finder
    f = finder.NameFinder(self.evaluator, self, name_context, name_or_str,
                          position, analysis_errors=analysis_errors)
    filters = f.get_filters(search_global)
    if is_goto:
        return f.filter_name(filters)
    return f.find(filters, attribute_lookup=not search_global)

def create_context(self, node, node_is_context=False, node_is_object=False):
    return self.evaluator.create_context(self, node, node_is_context, node_is_object)

</t>
<t tx="ekr.20180519065722.97">def is_class(self):
    return False

</t>
<t tx="ekr.20180519065722.98">def py__bool__(self):
    """
    Since Wrapper is a super class for classes, functions and modules,
    the return value will always be true.
    """
    return True

</t>
<t tx="ekr.20180519065722.99">def py__doc__(self, include_call_signature=False):
    try:
        self.tree_node.get_doc_node
    except AttributeError:
        return ''
    else:
        if include_call_signature:
            return get_doc_with_call_signature(self.tree_node)
        else:
            return clean_scope_docstring(self.tree_node)
    return None


</t>
<t tx="ekr.20180519065723.1">def py__annotations__(funcdef):
    return_annotation = funcdef.annotation
    if return_annotation:
        dct = {'return': return_annotation}
    else:
        dct = {}
    for function_param in funcdef.get_params():
        param_annotation = function_param.annotation
        if param_annotation is not None:
            dct[function_param.name.value] = param_annotation
    return dct


</t>
<t tx="ekr.20180519065723.10">"""
Recursions are the recipe of |jedi| to conquer Python code. However, someone
must stop recursions going mad. Some settings are here to make |jedi| stop at
the right time. You can read more about them :ref:`here &lt;settings-recursion&gt;`.

Next to :mod:`jedi.evaluate.cache` this module also makes |jedi| not
thread-safe. Why?  ``execution_recursion_decorator`` uses class variables to
count the function calls.

.. _settings-recursion:

Settings
~~~~~~~~~~

Recursion settings are important if you don't want extremly
recursive python code to go absolutely crazy.

The default values are based on experiments while completing the |jedi| library
itself (inception!). But I don't think there's any other Python library that
uses recursion in a similarly extreme way. Completion should also be fast and
therefore the quality might not always be maximal.

.. autodata:: recursion_limit
.. autodata:: total_function_execution_limit
.. autodata:: per_function_execution_limit
.. autodata:: per_function_recursion_limit
"""

from contextlib import contextmanager

from jedi import debug
from jedi.evaluate.base_context import NO_CONTEXTS


recursion_limit = 15
"""
Like ``sys.getrecursionlimit()``, just for |jedi|.
"""
total_function_execution_limit = 200
"""
This is a hard limit of how many non-builtin functions can be executed.
"""
per_function_execution_limit = 6
"""
The maximal amount of times a specific function may be executed.
"""
per_function_recursion_limit = 2
"""
A function may not be executed more than this number of times recursively.
"""


</t>
<t tx="ekr.20180519065723.100">def goto_definitions(self, context, name):
    def_ = name.get_definition(import_name_always=True)
    if def_ is not None:
        type_ = def_.type
        if type_ == 'classdef':
            return [ClassContext(self, context, name.parent)]
        elif type_ == 'funcdef':
            return [FunctionContext(self, context, name.parent)]

        if type_ == 'expr_stmt':
            is_simple_name = name.parent.type not in ('power', 'trailer')
            if is_simple_name:
                return eval_expr_stmt(context, def_, name)
        if type_ == 'for_stmt':
            container_types = context.eval_node(def_.children[3])
            cn = ContextualizedNode(context, def_.children[3])
            for_types = iterate_contexts(container_types, cn)
            c_node = ContextualizedName(context, name)
            return check_tuple_assignments(self, c_node, for_types)
        if type_ in ('import_from', 'import_name'):
            return imports.infer_import(context, name)

    return helpers.evaluate_call_of_leaf(context, name)

</t>
<t tx="ekr.20180519065723.101">def goto(self, context, name):
    definition = name.get_definition(import_name_always=True)
    if definition is not None:
        type_ = definition.type
        if type_ == 'expr_stmt':
            # Only take the parent, because if it's more complicated than just
            # a name it's something you can "goto" again.
            is_simple_name = name.parent.type not in ('power', 'trailer')
            if is_simple_name:
                return [TreeNameDefinition(context, name)]
        elif type_ == 'param':
            return [ParamName(context, name)]
        elif type_ in ('funcdef', 'classdef'):
            return [TreeNameDefinition(context, name)]
        elif type_ in ('import_from', 'import_name'):
            module_names = imports.infer_import(context, name, is_goto=True)
            return module_names

    par = name.parent
    node_type = par.type
    if node_type == 'argument' and par.children[1] == '=' and par.children[0] == name:
        # Named param goto.
        trailer = par.parent
        if trailer.type == 'arglist':
            trailer = trailer.parent
        if trailer.type != 'classdef':
            if trailer.type == 'decorator':
                context_set = context.eval_node(trailer.children[1])
            else:
                i = trailer.parent.children.index(trailer)
                to_evaluate = trailer.parent.children[:i]
                if to_evaluate[0] == 'await':
                    to_evaluate.pop(0)
                context_set = context.eval_node(to_evaluate[0])
                for trailer in to_evaluate[1:]:
                    context_set = eval_trailer(context, context_set, trailer)
            param_names = []
            for context in context_set:
                try:
                    get_param_names = context.get_param_names
                except AttributeError:
                    pass
                else:
                    for param_name in get_param_names():
                        if param_name.string_name == name.value:
                            param_names.append(param_name)
            return param_names
    elif node_type == 'dotted_name':  # Is a decorator.
        index = par.children.index(name)
        if index &gt; 0:
            new_dotted = helpers.deep_ast_copy(par)
            new_dotted.children[index - 1:] = []
            values = context.eval_node(new_dotted)
            return unite(
                value.py__getattribute__(name, name_context=context, is_goto=True)
                for value in values
            )

    if node_type == 'trailer' and par.children[0] == '.':
        values = helpers.evaluate_call_of_leaf(context, name, cut_own_trailer=True)
        return unite(
            value.py__getattribute__(name, name_context=context, is_goto=True)
            for value in values
        )
    else:
        stmt = tree.search_ancestor(
            name, 'expr_stmt', 'lambdef'
        ) or name
        if stmt.type == 'lambdef':
            stmt = name
        return context.py__getattribute__(
            name,
            position=stmt.start_pos,
            search_global=True, is_goto=True
        )

</t>
<t tx="ekr.20180519065723.102">def create_context(self, base_context, node, node_is_context=False, node_is_object=False):
    def parent_scope(node):
        while True:
            node = node.parent

            if parser_utils.is_scope(node):
                return node
            elif node.type in ('argument', 'testlist_comp'):
                if node.children[1].type == 'comp_for':
                    return node.children[1]
            elif node.type == 'dictorsetmaker':
                for n in node.children[1:4]:
                    # In dictionaries it can be pretty much anything.
                    if n.type == 'comp_for':
                        return n

    def from_scope_node(scope_node, child_is_funcdef=None, is_nested=True, node_is_object=False):
        if scope_node == base_node:
            return base_context

        is_funcdef = scope_node.type in ('funcdef', 'lambdef')
        parent_scope = parser_utils.get_parent_scope(scope_node)
        parent_context = from_scope_node(parent_scope, child_is_funcdef=is_funcdef)

        if is_funcdef:
            if isinstance(parent_context, AnonymousInstance):
                func = BoundMethod(
                    self, parent_context, parent_context.class_context,
                    parent_context.parent_context, scope_node
                )
            else:
                func = FunctionContext(
                    self,
                    parent_context,
                    scope_node
                )
            if is_nested and not node_is_object:
                return func.get_function_execution()
            return func
        elif scope_node.type == 'classdef':
            class_context = ClassContext(self, parent_context, scope_node)
            if child_is_funcdef:
                # anonymous instance
                return AnonymousInstance(self, parent_context, class_context)
            else:
                return class_context
        elif scope_node.type == 'comp_for':
            if node.start_pos &gt;= scope_node.children[-1].start_pos:
                return parent_context
            return CompForContext.from_comp_for(parent_context, scope_node)
        raise Exception("There's a scope that was not managed.")

    base_node = base_context.tree_node

    if node_is_context and parser_utils.is_scope(node):
        scope_node = node
    else:
        if node.parent.type in ('funcdef', 'classdef') and node.parent.name == node:
            # When we're on class/function names/leafs that define the
            # object itself and not its contents.
            node = node.parent
        scope_node = parent_scope(node)
    return from_scope_node(scope_node, is_nested=True, node_is_object=node_is_object)

</t>
<t tx="ekr.20180519065723.103">def parse_and_get_code(self, code=None, path=None, **kwargs):
    if self.allow_different_encoding:
        if code is None:
            with open(path, 'rb') as f:
                code = f.read()
        code = python_bytes_to_unicode(code, errors='replace')

    return self.grammar.parse(code=code, path=path, **kwargs), code

</t>
<t tx="ekr.20180519065723.104">def parse(self, *args, **kwargs):
    return self.parse_and_get_code(*args, **kwargs)[0]
</t>
<t tx="ekr.20180519065723.106"></t>
<t tx="ekr.20180519065723.107">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/compiled/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065723.108">import inspect
import types
import sys
from textwrap import dedent
import operator as op
from collections import namedtuple

from jedi import debug
from jedi._compatibility import unicode, is_py3, is_py34, builtins, \
    py_version, force_unicode, print_to_stderr
from jedi.evaluate.compiled.getattr_static import getattr_static
from jedi.evaluate.utils import dotted_from_fs_path


MethodDescriptorType = type(str.replace)
# These are not considered classes and access is granted even though they have
# a __class__ attribute.
NOT_CLASS_TYPES = (
    types.BuiltinFunctionType,
    types.CodeType,
    types.FrameType,
    types.FunctionType,
    types.GeneratorType,
    types.GetSetDescriptorType,
    types.LambdaType,
    types.MemberDescriptorType,
    types.MethodType,
    types.ModuleType,
    types.TracebackType,
    MethodDescriptorType
)

if is_py3:
    NOT_CLASS_TYPES += (
        types.MappingProxyType,
        types.SimpleNamespace
    )
    if is_py34:
        NOT_CLASS_TYPES += (types.DynamicClassAttribute,)


# Those types don't exist in typing.
MethodDescriptorType = type(str.replace)
WrapperDescriptorType = type(set.__iter__)
# `object.__subclasshook__` is an already executed descriptor.
object_class_dict = type.__dict__["__dict__"].__get__(object)
ClassMethodDescriptorType = type(object_class_dict['__subclasshook__'])

</t>
<t tx="ekr.20180519065723.109">def _a_generator(foo):
    """Used to have an object to return for generators."""
    yield 42
    yield foo


_sentinel = object()

# Maps Python syntax to the operator module.
COMPARISON_OPERATORS = {
    '==': op.eq,
    '!=': op.ne,
    'is': op.is_,
    'is not': op.is_not,
    '&lt;': op.lt,
    '&lt;=': op.le,
    '&gt;': op.gt,
    '&gt;=': op.ge,
}

_OPERATORS = {
    '+': op.add,
    '-': op.sub,
}
_OPERATORS.update(COMPARISON_OPERATORS)

ALLOWED_DESCRIPTOR_ACCESS = (
    types.FunctionType,
    types.GetSetDescriptorType,
    types.MemberDescriptorType,
    MethodDescriptorType,
    WrapperDescriptorType,
    ClassMethodDescriptorType,
    staticmethod,
    classmethod,
)


</t>
<t tx="ekr.20180519065723.11">class RecursionDetector(object):
    @others
</t>
<t tx="ekr.20180519065723.110">def safe_getattr(obj, name, default=_sentinel):
    try:
        attr, is_get_descriptor = getattr_static(obj, name)
    except AttributeError:
        if default is _sentinel:
            raise
        return default
    else:
        if type(attr) in ALLOWED_DESCRIPTOR_ACCESS:
            # In case of descriptors that have get methods we cannot return
            # it's value, because that would mean code execution.
            return getattr(obj, name)
    return attr


SignatureParam = namedtuple(
    'SignatureParam',
    'name has_default default has_annotation annotation kind_name'
)


</t>
<t tx="ekr.20180519065723.111">def compiled_objects_cache(attribute_name):
    def decorator(func):
        """
        This decorator caches just the ids, oopposed to caching the object itself.
        Caching the id has the advantage that an object doesn't need to be
        hashable.
        """
        def wrapper(evaluator, obj, parent_context=None):
            cache = getattr(evaluator, attribute_name)
            # Do a very cheap form of caching here.
            key = id(obj)
            try:
                cache[key]
                return cache[key][0]
            except KeyError:
                # TODO wuaaaarrghhhhhhhh
                if attribute_name == 'mixed_cache':
                    result = func(evaluator, obj, parent_context)
                else:
                    result = func(evaluator, obj)
                # Need to cache all of them, otherwise the id could be overwritten.
                cache[key] = result, obj, parent_context
                return result
        return wrapper

    return decorator


</t>
<t tx="ekr.20180519065723.112">def create_access(evaluator, obj):
    return evaluator.compiled_subprocess.get_or_create_access_handle(obj)


</t>
<t tx="ekr.20180519065723.113">def load_module(evaluator, path=None, name=None, sys_path=None):
    if sys_path is None:
        sys_path = list(evaluator.get_sys_path())
    if path is not None:
        dotted_path = dotted_from_fs_path(path, sys_path=sys_path)
    else:
        dotted_path = name

    temp, sys.path = sys.path, sys_path
    try:
        __import__(dotted_path)
    except ImportError:
        # If a module is "corrupt" or not really a Python module or whatever.
        debug.warning('Module %s not importable in path %s.', dotted_path, path)
        return None
    except Exception:
        # Since __import__ pretty much makes code execution possible, just
        # catch any error here and print it.
        import traceback
        print_to_stderr("Cannot import:\n%s" % traceback.format_exc())
        return None
    finally:
        sys.path = temp

    # Just access the cache after import, because of #59 as well as the very
    # complicated import structure of Python.
    module = sys.modules[dotted_path]
    return create_access_path(evaluator, module)


</t>
<t tx="ekr.20180519065723.114">class AccessPath(object):
    @others
</t>
<t tx="ekr.20180519065723.115">def __init__(self, accesses):
    self.accesses = accesses

# Writing both of these methods here looks a bit ridiculous. However with
# the differences of Python 2/3 it's actually necessary, because we will
# otherwise have a accesses attribute that is bytes instead of unicode.
</t>
<t tx="ekr.20180519065723.116">def __getstate__(self):
    return self.accesses

</t>
<t tx="ekr.20180519065723.117">def __setstate__(self, value):
    self.accesses = value


</t>
<t tx="ekr.20180519065723.118">def create_access_path(evaluator, obj):
    access = create_access(evaluator, obj)
    return AccessPath(access.get_access_path_tuples())


</t>
<t tx="ekr.20180519065723.119">def _force_unicode_decorator(func):
    return lambda *args, **kwargs: force_unicode(func(*args, **kwargs))


</t>
<t tx="ekr.20180519065723.12">def __init__(self):
    self.pushed_nodes = []


</t>
<t tx="ekr.20180519065723.120">class DirectObjectAccess(object):
    @others
</t>
<t tx="ekr.20180519065723.121">def __init__(self, evaluator, obj):
    self._evaluator = evaluator
    self._obj = obj

</t>
<t tx="ekr.20180519065723.122">def __repr__(self):
    return '%s(%s)' % (self.__class__.__name__, self.get_repr())

</t>
<t tx="ekr.20180519065723.123">def _create_access(self, obj):
    return create_access(self._evaluator, obj)

</t>
<t tx="ekr.20180519065723.124">def _create_access_path(self, obj):
    return create_access_path(self._evaluator, obj)

</t>
<t tx="ekr.20180519065723.125">def py__bool__(self):
    return bool(self._obj)

</t>
<t tx="ekr.20180519065723.126">def py__file__(self):
    try:
        return self._obj.__file__
    except AttributeError:
        return None

</t>
<t tx="ekr.20180519065723.127">def py__doc__(self, include_call_signature=False):
    return force_unicode(inspect.getdoc(self._obj)) or u''

</t>
<t tx="ekr.20180519065723.128">def py__name__(self):
    if not _is_class_instance(self._obj) or \
            inspect.ismethoddescriptor(self._obj):  # slots
        cls = self._obj
    else:
        try:
            cls = self._obj.__class__
        except AttributeError:
            # happens with numpy.core.umath._UFUNC_API (you get it
            # automatically by doing `import numpy`.
            return None

    try:
        return force_unicode(cls.__name__)
    except AttributeError:
        return None

</t>
<t tx="ekr.20180519065723.129">def py__mro__accesses(self):
    return tuple(self._create_access_path(cls) for cls in self._obj.__mro__[1:])

</t>
<t tx="ekr.20180519065723.13">@contextmanager
def execution_allowed(evaluator, node):
    """
    A decorator to detect recursions in statements. In a recursion a statement
    at the same place, in the same module may not be executed two times.
    """
    pushed_nodes = evaluator.recursion_detector.pushed_nodes

    if node in pushed_nodes:
        debug.warning('catched stmt recursion: %s @%s', node,
                      node.start_pos)
        yield False
    else:
        try:
            pushed_nodes.append(node)
            yield True
        finally:
            pushed_nodes.pop()


</t>
<t tx="ekr.20180519065723.130">def py__getitem__(self, index):
    if type(self._obj) not in (str, list, tuple, unicode, bytes, bytearray, dict):
        # Get rid of side effects, we won't call custom `__getitem__`s.
        return None

    return self._create_access_path(self._obj[index])

</t>
<t tx="ekr.20180519065723.131">def py__iter__list(self):
    if type(self._obj) not in (str, list, tuple, unicode, bytes, bytearray, dict):
        # Get rid of side effects, we won't call custom `__getitem__`s.
        return []

    lst = []
    for i, part in enumerate(self._obj):
        if i &gt; 20:
            # Should not go crazy with large iterators
            break
        lst.append(self._create_access_path(part))
    return lst

</t>
<t tx="ekr.20180519065723.132">def py__class__(self):
    return self._create_access_path(self._obj.__class__)

</t>
<t tx="ekr.20180519065723.133">def py__bases__(self):
    return [self._create_access_path(base) for base in self._obj.__bases__]

</t>
<t tx="ekr.20180519065723.134">@_force_unicode_decorator
def get_repr(self):
    builtins = 'builtins', '__builtin__'

    if inspect.ismodule(self._obj):
        return repr(self._obj)
    # Try to avoid execution of the property.
    if safe_getattr(self._obj, '__module__', default='') in builtins:
        return repr(self._obj)

    type_ = type(self._obj)
    if type_ == type:
        return type.__repr__(self._obj)

    if safe_getattr(type_, '__module__', default='') in builtins:
        # Allow direct execution of repr for builtins.
        return repr(self._obj)
    return object.__repr__(self._obj)

</t>
<t tx="ekr.20180519065723.135">def is_class(self):
    return inspect.isclass(self._obj)

</t>
<t tx="ekr.20180519065723.136">def ismethoddescriptor(self):
    return inspect.ismethoddescriptor(self._obj)

</t>
<t tx="ekr.20180519065723.137">def dir(self):
    return list(map(force_unicode, dir(self._obj)))

</t>
<t tx="ekr.20180519065723.138">def has_iter(self):
    try:
        iter(self._obj)
        return True
    except TypeError:
        return False

</t>
<t tx="ekr.20180519065723.139">def is_allowed_getattr(self, name):
    # TODO this API is ugly.
    try:
        attr, is_get_descriptor = getattr_static(self._obj, name)
    except AttributeError:
        return False, False
    else:
        if is_get_descriptor and type(attr) not in ALLOWED_DESCRIPTOR_ACCESS:
            # In case of descriptors that have get methods we cannot return
            # it's value, because that would mean code execution.
            return True, True
    return True, False

</t>
<t tx="ekr.20180519065723.14">def execution_recursion_decorator(default=NO_CONTEXTS):
    def decorator(func):
        def wrapper(execution, **kwargs):
            detector = execution.evaluator.execution_recursion_detector
            allowed = detector.push_execution(execution)
            try:
                if allowed:
                    result = default
                else:
                    result = func(execution, **kwargs)
            finally:
                detector.pop_execution()
            return result
        return wrapper
    return decorator


</t>
<t tx="ekr.20180519065723.140">def getattr(self, name, default=_sentinel):
    try:
        return self._create_access(getattr(self._obj, name))
    except AttributeError:
        # Happens e.g. in properties of
        # PyQt4.QtGui.QStyleOptionComboBox.currentText
        # -&gt; just set it to None
        if default is _sentinel:
            raise
        return self._create_access(default)

</t>
<t tx="ekr.20180519065723.141">def get_safe_value(self):
    if type(self._obj) in (bool, bytes, float, int, str, unicode, slice):
        return self._obj
    raise ValueError("Object is type %s and not simple" % type(self._obj))

</t>
<t tx="ekr.20180519065723.142">def get_api_type(self):
    obj = self._obj
    if self.is_class():
        return u'class'
    elif inspect.ismodule(obj):
        return u'module'
    elif inspect.isbuiltin(obj) or inspect.ismethod(obj) \
            or inspect.ismethoddescriptor(obj) or inspect.isfunction(obj):
        return u'function'
    # Everything else...
    return u'instance'

</t>
<t tx="ekr.20180519065723.143">def get_access_path_tuples(self):
    accesses = [create_access(self._evaluator, o) for o in self._get_objects_path()]
    return [(access.py__name__(), access) for access in accesses]

</t>
<t tx="ekr.20180519065723.144">def _get_objects_path(self):
    def get():
        obj = self._obj
        yield obj
        try:
            obj = obj.__objclass__
        except AttributeError:
            pass
        else:
            yield obj

        try:
            # Returns a dotted string path.
            imp_plz = obj.__module__
        except AttributeError:
            # Unfortunately in some cases like `int` there's no __module__
            if not inspect.ismodule(obj):
                yield builtins
        else:
            if imp_plz is None:
                # Happens for example in `(_ for _ in []).send.__module__`.
                yield builtins
            else:
                try:
                    # TODO use sys.modules, __module__ can be faked.
                    yield sys.modules[imp_plz]
                except KeyError:
                    # __module__ can be something arbitrary that doesn't exist.
                    yield builtins

    return list(reversed(list(get())))

</t>
<t tx="ekr.20180519065723.145">def execute_operation(self, other_access_handle, operator):
    other_access = other_access_handle.access
    op = _OPERATORS[operator]
    return self._create_access_path(op(self._obj, other_access._obj))

</t>
<t tx="ekr.20180519065723.146">def needs_type_completions(self):
    return inspect.isclass(self._obj) and self._obj != type

</t>
<t tx="ekr.20180519065723.147">def get_signature_params(self):
    obj = self._obj
    if py_version &lt; 33:
        raise ValueError("inspect.signature was introduced in 3.3")
    if py_version == 34:
        # In 3.4 inspect.signature are wrong for str and int. This has
        # been fixed in 3.5. The signature of object is returned,
        # because no signature was found for str. Here we imitate 3.5
        # logic and just ignore the signature if the magic methods
        # don't match object.
        # 3.3 doesn't even have the logic and returns nothing for str
        # and classes that inherit from object.
        user_def = inspect._signature_get_user_defined_method
        if (inspect.isclass(obj)
                and not user_def(type(obj), '__init__')
                and not user_def(type(obj), '__new__')
                and (obj.__init__ != object.__init__
                     or obj.__new__ != object.__new__)):
            raise ValueError

    try:
        signature = inspect.signature(obj)
    except (RuntimeError, TypeError):
        # Reading the code of the function in Python 3.6 implies there are
        # at least these errors that might occur if something is wrong with
        # the signature. In that case we just want a simple escape for now.
        raise ValueError
    return [
        SignatureParam(
            name=p.name,
            has_default=p.default is not p.empty,
            default=self._create_access_path(p.default),
            has_annotation=p.annotation is not p.empty,
            annotation=self._create_access_path(p.annotation),
            kind_name=str(p.kind)
        ) for p in signature.parameters.values()
    ]

</t>
<t tx="ekr.20180519065723.148">def negate(self):
    return self._create_access_path(-self._obj)

</t>
<t tx="ekr.20180519065723.149">def dict_values(self):
    return [self._create_access_path(v) for v in self._obj.values()]

</t>
<t tx="ekr.20180519065723.15">class ExecutionRecursionDetector(object):
    """
    Catches recursions of executions.
    """
    @others
</t>
<t tx="ekr.20180519065723.150">def is_super_class(self, exception):
    return issubclass(exception, self._obj)

</t>
<t tx="ekr.20180519065723.151">def get_dir_infos(self):
    """
    Used to return a couple of infos that are needed when accessing the sub
    objects of an objects
    """
    # TODO is_allowed_getattr might raise an AttributeError
    tuples = dict(
        (force_unicode(name), self.is_allowed_getattr(name))
        for name in self.dir()
    )
    return self.needs_type_completions(), tuples


</t>
<t tx="ekr.20180519065723.152">def _is_class_instance(obj):
    """Like inspect.* methods."""
    try:
        cls = obj.__class__
    except AttributeError:
        return False
    else:
        return cls != type and not issubclass(cls, NOT_CLASS_TYPES)


if py_version &gt;= 35:
    exec(compile(dedent("""
        async def _coroutine(): pass
        _coroutine = _coroutine()
        CoroutineType = type(_coroutine)
        _coroutine.close()  # Prevent ResourceWarning
    """), 'blub', 'exec'))
    _coroutine_wrapper = _coroutine.__await__()
else:
    _coroutine = None
    _coroutine_wrapper = None

if py_version &gt;= 36:
    exec(compile(dedent("""
        async def _async_generator():
            yield
        _async_generator = _async_generator()
        AsyncGeneratorType = type(_async_generator)
    """), 'blub', 'exec'))
else:
    _async_generator = None

</t>
<t tx="ekr.20180519065723.153">class _SPECIAL_OBJECTS(object):
    FUNCTION_CLASS = types.FunctionType
    METHOD_CLASS = type(DirectObjectAccess.py__bool__)
    MODULE_CLASS = types.ModuleType
    GENERATOR_OBJECT = _a_generator(1.0)
    BUILTINS = builtins
    COROUTINE = _coroutine
    COROUTINE_WRAPPER = _coroutine_wrapper
    ASYNC_GENERATOR = _async_generator


</t>
<t tx="ekr.20180519065723.154">def get_special_object(evaluator, identifier):
    obj = getattr(_SPECIAL_OBJECTS, identifier)
    return create_access_path(evaluator, obj)
</t>
<t tx="ekr.20180519065723.155">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/compiled/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065723.156">"""
Imitate the parser representation.
"""
import re
from functools import partial

from jedi import debug
from jedi._compatibility import force_unicode, Parameter
from jedi.cache import underscore_memoization, memoize_method
from jedi.evaluate.filters import AbstractFilter, AbstractNameDefinition, \
    ContextNameMixin
from jedi.evaluate.base_context import Context, ContextSet
from jedi.evaluate.lazy_context import LazyKnownContext
from jedi.evaluate.compiled.access import _sentinel
from jedi.evaluate.cache import evaluator_function_cache
from . import fake


</t>
<t tx="ekr.20180519065723.157">class CheckAttribute(object):
    """Raises an AttributeError if the attribute X isn't available."""
    @others
</t>
<t tx="ekr.20180519065723.158">def __init__(self, func):
    self.func = func
    # Remove the py in front of e.g. py__call__.
    self.check_name = force_unicode(func.__name__[2:])

</t>
<t tx="ekr.20180519065723.159">def __get__(self, instance, owner):
    if instance is None:
        return self

    # This might raise an AttributeError. That's wanted.
    if self.check_name == '__iter__':
        # Python iterators are a bit strange, because there's no need for
        # the __iter__ function as long as __getitem__ is defined (it will
        # just start with __getitem__(0). This is especially true for
        # Python 2 strings, where `str.__iter__` is not even defined.
        if not instance.access_handle.has_iter():
            raise AttributeError
    else:
        instance.access_handle.getattr(self.check_name)
    return partial(self.func, instance)


</t>
<t tx="ekr.20180519065723.16">def __init__(self, evaluator):
    self._evaluator = evaluator

    self._recursion_level = 0
    self._parent_execution_funcs = []
    self._funcdef_execution_counts = {}
    self._execution_count = 0

</t>
<t tx="ekr.20180519065723.160">class CompiledObject(Context):
    @others
</t>
<t tx="ekr.20180519065723.161">def __init__(self, evaluator, access_handle, parent_context=None, faked_class=None):
    super(CompiledObject, self).__init__(evaluator, parent_context)
    self.access_handle = access_handle
    # This attribute will not be set for most classes, except for fakes.
    self.tree_node = faked_class

</t>
<t tx="ekr.20180519065723.162">@CheckAttribute
def py__call__(self, params):
    if self.tree_node is not None and self.tree_node.type == 'funcdef':
        from jedi.evaluate.context.function import FunctionContext
        return FunctionContext(
            self.evaluator,
            parent_context=self.parent_context,
            funcdef=self.tree_node
        ).py__call__(params)
    if self.access_handle.is_class():
        from jedi.evaluate.context import CompiledInstance
        return ContextSet(CompiledInstance(self.evaluator, self.parent_context, self, params))
    else:
        return ContextSet.from_iterable(self._execute_function(params))

</t>
<t tx="ekr.20180519065723.163">@CheckAttribute
def py__class__(self):
    return create_from_access_path(self.evaluator, self.access_handle.py__class__())

</t>
<t tx="ekr.20180519065723.164">@CheckAttribute
def py__mro__(self):
    return (self,) + tuple(
        create_from_access_path(self.evaluator, access)
        for access in self.access_handle.py__mro__accesses()
    )

</t>
<t tx="ekr.20180519065723.165">@CheckAttribute
def py__bases__(self):
    return tuple(
        create_from_access_path(self.evaluator, access)
        for access in self.access_handle.py__bases__()
    )

</t>
<t tx="ekr.20180519065723.166">def py__bool__(self):
    return self.access_handle.py__bool__()

</t>
<t tx="ekr.20180519065723.167">def py__file__(self):
    return self.access_handle.py__file__()

</t>
<t tx="ekr.20180519065723.168">def is_class(self):
    return self.access_handle.is_class()

</t>
<t tx="ekr.20180519065723.169">def py__doc__(self, include_call_signature=False):
    return self.access_handle.py__doc__()

</t>
<t tx="ekr.20180519065723.17">def pop_execution(self):
    self._parent_execution_funcs.pop()
    self._recursion_level -= 1

</t>
<t tx="ekr.20180519065723.170">def get_param_names(self):
    try:
        signature_params = self.access_handle.get_signature_params()
    except ValueError:  # Has no signature
        params_str, ret = self._parse_function_doc()
        tokens = params_str.split(',')
        if self.access_handle.ismethoddescriptor():
            tokens.insert(0, 'self')
        for p in tokens:
            parts = p.strip().split('=')
            yield UnresolvableParamName(self, parts[0])
    else:
        for signature_param in signature_params:
            yield SignatureParamName(self, signature_param)

</t>
<t tx="ekr.20180519065723.171">def __repr__(self):
    return '&lt;%s: %s&gt;' % (self.__class__.__name__, self.access_handle.get_repr())

</t>
<t tx="ekr.20180519065723.172">@underscore_memoization
def _parse_function_doc(self):
    doc = self.py__doc__()
    if doc is None:
        return '', ''

    return _parse_function_doc(doc)

</t>
<t tx="ekr.20180519065723.173">@property
def api_type(self):
    return self.access_handle.get_api_type()

</t>
<t tx="ekr.20180519065723.174">@underscore_memoization
def _cls(self):
    """
    We used to limit the lookups for instantiated objects like list(), but
    this is not the case anymore. Python itself
    """
    # Ensures that a CompiledObject is returned that is not an instance (like list)
    return self

</t>
<t tx="ekr.20180519065723.175">def get_filters(self, search_global=False, is_instance=False,
                until_position=None, origin_scope=None):
    yield self._ensure_one_filter(is_instance)

</t>
<t tx="ekr.20180519065723.176">@memoize_method
def _ensure_one_filter(self, is_instance):
    """
    search_global shouldn't change the fact that there's one dict, this way
    there's only one `object`.
    """
    return CompiledObjectFilter(self.evaluator, self, is_instance)

</t>
<t tx="ekr.20180519065723.177">@CheckAttribute
def py__getitem__(self, index):
    access = self.access_handle.py__getitem__(index)
    if access is None:
        return ContextSet()

    return ContextSet(create_from_access_path(self.evaluator, access))

</t>
<t tx="ekr.20180519065723.178">@CheckAttribute
def py__iter__(self):
    for access in self.access_handle.py__iter__list():
        yield LazyKnownContext(create_from_access_path(self.evaluator, access))

</t>
<t tx="ekr.20180519065723.179">def py__name__(self):
    return self.access_handle.py__name__()

</t>
<t tx="ekr.20180519065723.18">def push_execution(self, execution):
    funcdef = execution.tree_node

    # These two will be undone in pop_execution.
    self._recursion_level += 1
    self._parent_execution_funcs.append(funcdef)

    module = execution.get_root_context()
    if module == self._evaluator.builtins_module:
        # We have control over builtins so we know they are not recursing
        # like crazy. Therefore we just let them execute always, because
        # they usually just help a lot with getting good results.
        return False

    if self._recursion_level &gt; recursion_limit:
        return True

    if self._execution_count &gt;= total_function_execution_limit:
        return True
    self._execution_count += 1

    if self._funcdef_execution_counts.setdefault(funcdef, 0) &gt;= per_function_execution_limit:
        return True
    self._funcdef_execution_counts[funcdef] += 1

    if self._parent_execution_funcs.count(funcdef) &gt; per_function_recursion_limit:
        return True
    return False
</t>
<t tx="ekr.20180519065723.180">@property
def name(self):
    name = self.py__name__()
    if name is None:
        name = self.access_handle.get_repr()
    return CompiledContextName(self, name)

</t>
<t tx="ekr.20180519065723.181">def _execute_function(self, params):
    from jedi.evaluate import docstrings
    from jedi.evaluate.compiled import builtin_from_name
    if self.api_type != 'function':
        return

    for name in self._parse_function_doc()[1].split():
        try:
            # TODO wtf is this? this is exactly the same as the thing
            # below. It uses getattr as well.
            self.evaluator.builtins_module.access_handle.getattr(name)
        except AttributeError:
            continue
        else:
            bltn_obj = builtin_from_name(self.evaluator, name)
            for result in bltn_obj.execute(params):
                yield result
    for type_ in docstrings.infer_return_types(self):
        yield type_

</t>
<t tx="ekr.20180519065723.182">def dict_values(self):
    return ContextSet.from_iterable(
        create_from_access_path(self.evaluator, access)
        for access in self.access_handle.dict_values()
    )

</t>
<t tx="ekr.20180519065723.183">def get_safe_value(self, default=_sentinel):
    try:
        return self.access_handle.get_safe_value()
    except ValueError:
        if default == _sentinel:
            raise
        return default

</t>
<t tx="ekr.20180519065723.184">def execute_operation(self, other, operator):
    return create_from_access_path(
        self.evaluator,
        self.access_handle.execute_operation(other.access_handle, operator)
    )

</t>
<t tx="ekr.20180519065723.185">def negate(self):
    return create_from_access_path(self.evaluator, self.access_handle.negate())

</t>
<t tx="ekr.20180519065723.186">def is_super_class(self, exception):
    return self.access_handle.is_super_class(exception)


</t>
<t tx="ekr.20180519065723.187">class CompiledName(AbstractNameDefinition):
    @others
</t>
<t tx="ekr.20180519065723.188">def __init__(self, evaluator, parent_context, name):
    self._evaluator = evaluator
    self.parent_context = parent_context
    self.string_name = name

</t>
<t tx="ekr.20180519065723.189">def __repr__(self):
    try:
        name = self.parent_context.name  # __name__ is not defined all the time
    except AttributeError:
        name = None
    return '&lt;%s: (%s).%s&gt;' % (self.__class__.__name__, name, self.string_name)

</t>
<t tx="ekr.20180519065723.19">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065723.190">@property
def api_type(self):
    return next(iter(self.infer())).api_type

</t>
<t tx="ekr.20180519065723.191">@underscore_memoization
def infer(self):
    return ContextSet(create_from_name(
        self._evaluator, self.parent_context, self.string_name
    ))


</t>
<t tx="ekr.20180519065723.192">class SignatureParamName(AbstractNameDefinition):
    api_type = u'param'

    @others
</t>
<t tx="ekr.20180519065723.193">def __init__(self, compiled_obj, signature_param):
    self.parent_context = compiled_obj.parent_context
    self._signature_param = signature_param

</t>
<t tx="ekr.20180519065723.194">@property
def string_name(self):
    return self._signature_param.name

</t>
<t tx="ekr.20180519065723.195">def get_kind(self):
    return getattr(Parameter, self._signature_param.kind_name)

</t>
<t tx="ekr.20180519065723.196">def is_keyword_param(self):
    return self._signature_param

</t>
<t tx="ekr.20180519065723.197">def infer(self):
    p = self._signature_param
    evaluator = self.parent_context.evaluator
    contexts = ContextSet()
    if p.has_default:
        contexts = ContextSet(create_from_access_path(evaluator, p.default))
    if p.has_annotation:
        annotation = create_from_access_path(evaluator, p.annotation)
        contexts |= annotation.execute_evaluated()
    return contexts


</t>
<t tx="ekr.20180519065723.198">class UnresolvableParamName(AbstractNameDefinition):
    api_type = u'param'

    @others
</t>
<t tx="ekr.20180519065723.199">def __init__(self, compiled_obj, name):
    self.parent_context = compiled_obj.parent_context
    self.string_name = name

</t>
<t tx="ekr.20180519065723.2">@evaluator_method_cache()
def infer_return_types(function_context):
    """
    Infers the type of a function's return value,
    according to type annotations.
    """
    annotation = py__annotations__(function_context.tree_node).get("return", None)
    if annotation is None:
        # If there is no Python 3-type annotation, look for a Python 2-type annotation
        node = function_context.tree_node
        comment = parser_utils.get_following_comment_same_line(node)
        if comment is None:
            return NO_CONTEXTS

        match = re.match(r"^#\s*type:\s*\([^#]*\)\s*-&gt;\s*([^#]*)", comment)
        if not match:
            return NO_CONTEXTS

        return _evaluate_annotation_string(
            function_context.get_root_context(),
            match.group(1).strip()
        )

    module_context = function_context.get_root_context()
    return _evaluate_for_annotation(module_context, annotation)


_typing_module = None
_typing_module_code_lines = None


</t>
<t tx="ekr.20180519065723.20">"""
Implementations of standard library functions, because it's not possible to
understand them with Jedi.

To add a new implementation, create a function and add it to the
``_implemented`` dict at the bottom of this module.

Note that this module exists only to implement very specific functionality in
the standard library. The usual way to understand the standard library is the
compiled module that returns the types for C-builtins.
"""
import re

import parso

from jedi._compatibility import force_unicode
from jedi import debug
from jedi.evaluate.arguments import ValuesArguments
from jedi.evaluate import analysis
from jedi.evaluate import compiled
from jedi.evaluate.context.instance import InstanceFunctionExecution, \
    AbstractInstanceContext, CompiledInstance, BoundMethod, \
    AnonymousInstanceFunctionExecution
from jedi.evaluate.base_context import ContextualizedNode, \
    NO_CONTEXTS, ContextSet
from jedi.evaluate.context import ClassContext, ModuleContext
from jedi.evaluate.context import iterable
from jedi.evaluate.lazy_context import LazyTreeContext
from jedi.evaluate.syntax_tree import is_string

# Now this is all part of fake tuples in Jedi. However super doesn't work on
# __init__ and __new__ doesn't work at all. So adding this to nametuples is
# just the easiest way.
_NAMEDTUPLE_INIT = """
    def __init__(_cls, {arg_list}):
        'A helper function for namedtuple.'
        self.__iterable = ({arg_list})

    def __iter__(self):
        for i in self.__iterable:
            yield i

    def __getitem__(self, y):
        return self.__iterable[y]

"""


</t>
<t tx="ekr.20180519065723.200">def get_kind(self):
    return Parameter.POSITIONAL_ONLY

</t>
<t tx="ekr.20180519065723.201">def infer(self):
    return ContextSet()


</t>
<t tx="ekr.20180519065723.202">class CompiledContextName(ContextNameMixin, AbstractNameDefinition):
    @others
</t>
<t tx="ekr.20180519065723.203">def __init__(self, context, name):
    self.string_name = name
    self._context = context
    self.parent_context = context.parent_context


</t>
<t tx="ekr.20180519065723.204">class EmptyCompiledName(AbstractNameDefinition):
    """
    Accessing some names will raise an exception. To avoid not having any
    completions, just give Jedi the option to return this object. It infers to
    nothing.
    """
    @others
</t>
<t tx="ekr.20180519065723.205">def __init__(self, evaluator, name):
    self.parent_context = evaluator.builtins_module
    self.string_name = name

</t>
<t tx="ekr.20180519065723.206">def infer(self):
    return ContextSet()


</t>
<t tx="ekr.20180519065723.207">class CompiledObjectFilter(AbstractFilter):
    name_class = CompiledName

    @others
docstr_defaults = {
    'floating point number': u'float',
    'character': u'str',
    'integer': u'int',
    'dictionary': u'dict',
    'string': u'str',
}


</t>
<t tx="ekr.20180519065723.208">def __init__(self, evaluator, compiled_object, is_instance=False):
    self._evaluator = evaluator
    self._compiled_object = compiled_object
    self._is_instance = is_instance

</t>
<t tx="ekr.20180519065723.209">def get(self, name):
    return self._get(
        name,
        lambda: self._compiled_object.access_handle.is_allowed_getattr(name),
        lambda: self._compiled_object.access_handle.dir(),
        check_has_attribute=True
    )

</t>
<t tx="ekr.20180519065723.21">class NotInStdLib(LookupError):
    pass


</t>
<t tx="ekr.20180519065723.210">def _get(self, name, allowed_getattr_callback, dir_callback, check_has_attribute=False):
    """
    To remove quite a few access calls we introduced the callback here.
    """
    has_attribute, is_descriptor = allowed_getattr_callback()
    if check_has_attribute and not has_attribute:
        return []

    # Always use unicode objects in Python 2 from here.
    name = force_unicode(name)

    if is_descriptor or not has_attribute:
        return [self._get_cached_name(name, is_empty=True)]

    if self._is_instance and name not in dir_callback():
        return []
    return [self._get_cached_name(name)]

</t>
<t tx="ekr.20180519065723.211">@memoize_method
def _get_cached_name(self, name, is_empty=False):
    if is_empty:
        return EmptyCompiledName(self._evaluator, name)
    else:
        return self._create_name(name)

</t>
<t tx="ekr.20180519065723.212">def values(self):
    from jedi.evaluate.compiled import builtin_from_name
    names = []
    needs_type_completions, dir_infos = self._compiled_object.access_handle.get_dir_infos()
    for name in dir_infos:
        names += self._get(
            name,
            lambda: dir_infos[name],
            lambda: dir_infos.keys(),
        )

    # ``dir`` doesn't include the type names.
    if not self._is_instance and needs_type_completions:
        for filter in builtin_from_name(self._evaluator, u'type').get_filters():
            names += filter.values()
    return names

</t>
<t tx="ekr.20180519065723.213">def _create_name(self, name):
    return self.name_class(self._evaluator, self._compiled_object, name)


</t>
<t tx="ekr.20180519065723.214">def _parse_function_doc(doc):
    """
    Takes a function and returns the params and return value as a tuple.
    This is nothing more than a docstring parser.

    TODO docstrings like utime(path, (atime, mtime)) and a(b [, b]) -&gt; None
    TODO docstrings like 'tuple of integers'
    """
    doc = force_unicode(doc)
    # parse round parentheses: def func(a, (b,c))
    try:
        count = 0
        start = doc.index('(')
        for i, s in enumerate(doc[start:]):
            if s == '(':
                count += 1
            elif s == ')':
                count -= 1
            if count == 0:
                end = start + i
                break
        param_str = doc[start + 1:end]
    except (ValueError, UnboundLocalError):
        # ValueError for doc.index
        # UnboundLocalError for undefined end in last line
        debug.dbg('no brackets found - no param')
        end = 0
        param_str = u''
    else:
        # remove square brackets, that show an optional param ( = None)
        def change_options(m):
            args = m.group(1).split(',')
            for i, a in enumerate(args):
                if a and '=' not in a:
                    args[i] += '=None'
            return ','.join(args)

        while True:
            param_str, changes = re.subn(r' ?\[([^\[\]]+)\]',
                                         change_options, param_str)
            if changes == 0:
                break
    param_str = param_str.replace('-', '_')  # see: isinstance.__doc__

    # parse return value
    r = re.search(u'-[&gt;-]* ', doc[end:end + 7])
    if r is None:
        ret = u''
    else:
        index = end + r.end()
        # get result type, which can contain newlines
        pattern = re.compile(r'(,\n|[^\n-])+')
        ret_str = pattern.match(doc, index).group(0).strip()
        # New object -&gt; object()
        ret_str = re.sub(r'[nN]ew (.*)', r'\1()', ret_str)

        ret = docstr_defaults.get(ret_str, ret_str)

    return param_str, ret


</t>
<t tx="ekr.20180519065723.215">def create_from_name(evaluator, compiled_object, name):
    faked = None
    try:
        faked = fake.get_faked_with_parent_context(compiled_object, name)
    except fake.FakeDoesNotExist:
        pass

    access = compiled_object.access_handle.getattr(name, default=None)
    return create_cached_compiled_object(
        evaluator, access, parent_context=compiled_object, faked=faked
    )


</t>
<t tx="ekr.20180519065723.216">def _normalize_create_args(func):
    """The cache doesn't care about keyword vs. normal args."""
    def wrapper(evaluator, obj, parent_context=None, faked=None):
        return func(evaluator, obj, parent_context, faked)
    return wrapper


</t>
<t tx="ekr.20180519065723.217">def create_from_access_path(evaluator, access_path):
    parent_context = None
    for name, access in access_path.accesses:
        try:
            if parent_context is None:
                faked = fake.get_faked_module(evaluator, access_path.accesses[0][0])
            else:
                faked = fake.get_faked_with_parent_context(parent_context, name)
        except fake.FakeDoesNotExist:
            faked = None

        parent_context = create_cached_compiled_object(evaluator, access, parent_context, faked)
    return parent_context


</t>
<t tx="ekr.20180519065723.218">@_normalize_create_args
@evaluator_function_cache()
def create_cached_compiled_object(evaluator, access_handle, parent_context, faked):
    return CompiledObject(evaluator, access_handle, parent_context, faked)
</t>
<t tx="ekr.20180519065723.219">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/compiled/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065723.22">def execute(evaluator, obj, arguments):
    if isinstance(obj, BoundMethod):
        raise NotInStdLib()

    try:
        obj_name = obj.name.string_name
    except AttributeError:
        pass
    else:
        if obj.parent_context == evaluator.builtins_module:
            module_name = 'builtins'
        elif isinstance(obj.parent_context, ModuleContext):
            module_name = obj.parent_context.name.string_name
        else:
            module_name = ''

        # for now we just support builtin functions.
        try:
            func = _implemented[module_name][obj_name]
        except KeyError:
            pass
        else:
            return func(evaluator, obj, arguments)
    raise NotInStdLib()


</t>
<t tx="ekr.20180519065723.220">"""
Loads functions that are mixed in to the standard library. E.g. builtins are
written in C (binaries), but my autocompletion only understands Python code. By
mixing in Python code, the autocompletion should work much better for builtins.
"""

import os
from itertools import chain

from jedi._compatibility import unicode

fake_modules = {}


</t>
<t tx="ekr.20180519065723.221">def _get_path_dict():
    path = os.path.dirname(os.path.abspath(__file__))
    base_path = os.path.join(path, 'fake')
    dct = {}
    for file_name in os.listdir(base_path):
        if file_name.endswith('.pym'):
            dct[file_name[:-4]] = os.path.join(base_path, file_name)
    return dct


_path_dict = _get_path_dict()


</t>
<t tx="ekr.20180519065723.222">class FakeDoesNotExist(Exception):
    pass


</t>
<t tx="ekr.20180519065723.223">def _load_faked_module(evaluator, module_name):
    try:
        return fake_modules[module_name]
    except KeyError:
        pass

    check_module_name = module_name
    if module_name == '__builtin__' and evaluator.environment.version_info.major == 2:
        check_module_name = 'builtins'

    try:
        path = _path_dict[check_module_name]
    except KeyError:
        fake_modules[module_name] = None
        return

    with open(path) as f:
        source = f.read()

    fake_modules[module_name] = m = evaluator.latest_grammar.parse(unicode(source))

    if check_module_name != module_name:
        # There are two implementations of `open` for either python 2/3.
        # -&gt; Rename the python2 version (`look at fake/builtins.pym`).
        open_func = _search_scope(m, 'open')
        open_func.children[1].value = 'open_python3'
        open_func = _search_scope(m, 'open_python2')
        open_func.children[1].value = 'open'
    return m


</t>
<t tx="ekr.20180519065723.224">def _search_scope(scope, obj_name):
    for s in chain(scope.iter_classdefs(), scope.iter_funcdefs()):
        if s.name.value == obj_name:
            return s


</t>
<t tx="ekr.20180519065723.225">def get_faked_with_parent_context(parent_context, name):
    if parent_context.tree_node is not None:
        # Try to search in already clearly defined stuff.
        found = _search_scope(parent_context.tree_node, name)
        if found is not None:
            return found
    raise FakeDoesNotExist


</t>
<t tx="ekr.20180519065723.226">def get_faked_module(evaluator, string_name):
    module = _load_faked_module(evaluator, string_name)
    if module is None:
        raise FakeDoesNotExist
    return module
</t>
<t tx="ekr.20180519065723.227">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/compiled/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065723.228">"""
A static version of getattr.
This is a backport of the Python 3 code with a little bit of additional
information returned to enable Jedi to make decisions.
"""

import types

from jedi._compatibility import py_version

_sentinel = object()


</t>
<t tx="ekr.20180519065723.229">def _check_instance(obj, attr):
    instance_dict = {}
    try:
        instance_dict = object.__getattribute__(obj, "__dict__")
    except AttributeError:
        pass
    return dict.get(instance_dict, attr, _sentinel)


</t>
<t tx="ekr.20180519065723.23">def _follow_param(evaluator, arguments, index):
    try:
        key, lazy_context = list(arguments.unpack())[index]
    except IndexError:
        return NO_CONTEXTS
    else:
        return lazy_context.infer()


</t>
<t tx="ekr.20180519065723.230">def _check_class(klass, attr):
    for entry in _static_getmro(klass):
        if _shadowed_dict(type(entry)) is _sentinel:
            try:
                return entry.__dict__[attr]
            except KeyError:
                pass
    return _sentinel


</t>
<t tx="ekr.20180519065723.231">def _is_type(obj):
    try:
        _static_getmro(obj)
    except TypeError:
        return False
    return True


</t>
<t tx="ekr.20180519065723.232">def _shadowed_dict_newstyle(klass):
    dict_attr = type.__dict__["__dict__"]
    for entry in _static_getmro(klass):
        try:
            class_dict = dict_attr.__get__(entry)["__dict__"]
        except KeyError:
            pass
        else:
            if not (type(class_dict) is types.GetSetDescriptorType and
                    class_dict.__name__ == "__dict__" and
                    class_dict.__objclass__ is entry):
                return class_dict
    return _sentinel


</t>
<t tx="ekr.20180519065723.233">def _static_getmro_newstyle(klass):
    return type.__dict__['__mro__'].__get__(klass)


if py_version &gt;= 30:
    _shadowed_dict = _shadowed_dict_newstyle
    _get_type = type
    _static_getmro = _static_getmro_newstyle
else:
    def _shadowed_dict(klass):
        """
        In Python 2 __dict__ is not overwritable:

            class Foo(object): pass
            setattr(Foo, '__dict__', 4)

            Traceback (most recent call last):
              File "&lt;stdin&gt;", line 1, in &lt;module&gt;
            TypeError: __dict__ must be a dictionary object

        It applies to both newstyle and oldstyle classes:

            class Foo(object): pass
            setattr(Foo, '__dict__', 4)
            Traceback (most recent call last):
              File "&lt;stdin&gt;", line 1, in &lt;module&gt;
            AttributeError: attribute '__dict__' of 'type' objects is not writable

        It also applies to instances of those objects. However to keep things
        straight forward, newstyle classes always use the complicated way of
        accessing it while oldstyle classes just use getattr.
        """
        if type(klass) is _oldstyle_class_type:
            return getattr(klass, '__dict__', _sentinel)
        return _shadowed_dict_newstyle(klass)

    class _OldStyleClass:
        pass

    _oldstyle_instance_type = type(_OldStyleClass())
    _oldstyle_class_type = type(_OldStyleClass)

    def _get_type(obj):
        type_ = object.__getattribute__(obj, '__class__')
        if type_ is _oldstyle_instance_type:
            # Somehow for old style classes we need to access it directly.
            return obj.__class__
        return type_

    def _static_getmro(klass):
        if type(klass) is _oldstyle_class_type:
            def oldstyle_mro(klass):
                """
                Oldstyle mro is a really simplistic way of look up mro:
                https://stackoverflow.com/questions/54867/what-is-the-difference-between-old-style-and-new-style-classes-in-python
                """
                yield klass
                for base in klass.__bases__:
                    for yield_from in oldstyle_mro(base):
                        yield yield_from

            return oldstyle_mro(klass)

        return _static_getmro_newstyle(klass)


</t>
<t tx="ekr.20180519065723.234">def _safe_hasattr(obj, name):
    return _check_class(_get_type(obj), name) is not _sentinel


</t>
<t tx="ekr.20180519065723.235">def _safe_is_data_descriptor(obj):
    return _safe_hasattr(obj, '__set__') or _safe_hasattr(obj, '__delete__')


</t>
<t tx="ekr.20180519065723.236">def getattr_static(obj, attr, default=_sentinel):
    """Retrieve attributes without triggering dynamic lookup via the
       descriptor protocol,  __getattr__ or __getattribute__.

       Note: this function may not be able to retrieve all attributes
       that getattr can fetch (like dynamically created attributes)
       and may find attributes that getattr can't (like descriptors
       that raise AttributeError). It can also return descriptor objects
       instead of instance members in some cases. See the
       documentation for details.

       Returns a tuple `(attr, is_get_descriptor)`. is_get_descripter means that
       the attribute is a descriptor that has a `__get__` attribute.
    """
    instance_result = _sentinel
    if not _is_type(obj):
        klass = _get_type(obj)
        dict_attr = _shadowed_dict(klass)
        if (dict_attr is _sentinel or type(dict_attr) is types.MemberDescriptorType):
            instance_result = _check_instance(obj, attr)
    else:
        klass = obj

    klass_result = _check_class(klass, attr)

    if instance_result is not _sentinel and klass_result is not _sentinel:
        if _safe_hasattr(klass_result, '__get__') \
                and _safe_is_data_descriptor(klass_result):
            # A get/set descriptor has priority over everything.
            return klass_result, True

    if instance_result is not _sentinel:
        return instance_result, False
    if klass_result is not _sentinel:
        return klass_result, _safe_hasattr(klass_result, '__get__')

    if obj is klass:
        # for types we check the metaclass too
        for entry in _static_getmro(type(klass)):
            if _shadowed_dict(type(entry)) is _sentinel:
                try:
                    return entry.__dict__[attr], False
                except KeyError:
                    pass
    if default is not _sentinel:
        return default, False
    raise AttributeError(attr)
</t>
<t tx="ekr.20180519065723.237">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/compiled/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065723.238">"""
Used only for REPL Completion.
"""

import inspect
import os

from jedi.parser_utils import get_cached_code_lines

from jedi import settings
from jedi.evaluate import compiled
from jedi.cache import underscore_memoization
from jedi.evaluate import imports
from jedi.evaluate.base_context import Context, ContextSet
from jedi.evaluate.context import ModuleContext
from jedi.evaluate.cache import evaluator_function_cache
from jedi.evaluate.compiled.getattr_static import getattr_static
from jedi.evaluate.compiled.access import compiled_objects_cache
from jedi.evaluate.compiled.context import create_cached_compiled_object


</t>
<t tx="ekr.20180519065723.239">class MixedObject(object):
    """
    A ``MixedObject`` is used in two ways:

    1. It uses the default logic of ``parser.python.tree`` objects,
    2. except for getattr calls. The names dicts are generated in a fashion
       like ``CompiledObject``.

    This combined logic makes it possible to provide more powerful REPL
    completion. It allows side effects that are not noticable with the default
    parser structure to still be completeable.

    The biggest difference from CompiledObject to MixedObject is that we are
    generally dealing with Python code and not with C code. This will generate
    fewer special cases, because we in Python you don't have the same freedoms
    to modify the runtime.
    """
    @others
</t>
<t tx="ekr.20180519065723.24">def argument_clinic(string, want_obj=False, want_context=False, want_arguments=False):
    """
    Works like Argument Clinic (PEP 436), to validate function params.
    """
    clinic_args = []
    allow_kwargs = False
    optional = False
    while string:
        # Optional arguments have to begin with a bracket. And should always be
        # at the end of the arguments. This is therefore not a proper argument
        # clinic implementation. `range()` for exmple allows an optional start
        # value at the beginning.
        match = re.match('(?:(?:(\[),? ?|, ?|)(\w+)|, ?/)\]*', string)
        string = string[len(match.group(0)):]
        if not match.group(2):  # A slash -&gt; allow named arguments
            allow_kwargs = True
            continue
        optional = optional or bool(match.group(1))
        word = match.group(2)
        clinic_args.append((word, optional, allow_kwargs))

    def f(func):
        def wrapper(evaluator, obj, arguments):
            debug.dbg('builtin start %s' % obj, color='MAGENTA')
            result = NO_CONTEXTS
            try:
                lst = list(arguments.eval_argument_clinic(clinic_args))
            except ValueError:
                pass
            else:
                kwargs = {}
                if want_context:
                    kwargs['context'] = arguments.context
                if want_obj:
                    kwargs['obj'] = obj
                if want_arguments:
                    kwargs['arguments'] = arguments
                result = func(evaluator, *lst, **kwargs)
            finally:
                debug.dbg('builtin end: %s', result, color='MAGENTA')
            return result

        return wrapper
    return f


</t>
<t tx="ekr.20180519065723.240">def __init__(self, evaluator, parent_context, compiled_object, tree_context):
    self.evaluator = evaluator
    self.parent_context = parent_context
    self.compiled_object = compiled_object
    self._context = tree_context
    self.access_handle = compiled_object.access_handle

# We have to overwrite everything that has to do with trailers, name
# lookups and filters to make it possible to route name lookups towards
# compiled objects and the rest towards tree node contexts.
</t>
<t tx="ekr.20180519065723.241">def py__getattribute__(*args, **kwargs):
    return Context.py__getattribute__(*args, **kwargs)

</t>
<t tx="ekr.20180519065723.242">def get_filters(self, *args, **kwargs):
    yield MixedObjectFilter(self.evaluator, self)

</t>
<t tx="ekr.20180519065723.243">def __repr__(self):
    return '&lt;%s: %s&gt;' % (type(self).__name__, self.access_handle.get_repr())

</t>
<t tx="ekr.20180519065723.244">def __getattr__(self, name):
    return getattr(self._context, name)


</t>
<t tx="ekr.20180519065723.245">class MixedName(compiled.CompiledName):
    """
    The ``CompiledName._compiled_object`` is our MixedObject.
    """
    @others
</t>
<t tx="ekr.20180519065723.246">@property
def start_pos(self):
    contexts = list(self.infer())
    if not contexts:
        # This means a start_pos that doesn't exist (compiled objects).
        return 0, 0
    return contexts[0].name.start_pos

</t>
<t tx="ekr.20180519065723.247">@start_pos.setter
def start_pos(self, value):
    # Ignore the __init__'s start_pos setter call.
    pass

</t>
<t tx="ekr.20180519065723.248">@underscore_memoization
def infer(self):
    access_handle = self.parent_context.access_handle
    # TODO use logic from compiled.CompiledObjectFilter
    access_handle = access_handle.getattr(self.string_name, default=None)
    return ContextSet(
        _create(self._evaluator, access_handle, parent_context=self.parent_context)
    )

</t>
<t tx="ekr.20180519065723.249">@property
def api_type(self):
    return next(iter(self.infer())).api_type


</t>
<t tx="ekr.20180519065723.25">@argument_clinic('iterator[, default], /')
def builtins_next(evaluator, iterators, defaults):
    """
    TODO this function is currently not used. It's a stab at implementing next
    in a different way than fake objects. This would be a bit more flexible.
    """
    if evaluator.environment.version_info.major == 2:
        name = 'next'
    else:
        name = '__next__'

    context_set = NO_CONTEXTS
    for iterator in iterators:
        if isinstance(iterator, AbstractInstanceContext):
            context_set = ContextSet.from_sets(
                n.infer()
                for filter in iterator.get_filters(include_self_names=True)
                for n in filter.get(name)
            ).execute_evaluated()
    if context_set:
        return context_set
    return defaults


</t>
<t tx="ekr.20180519065723.250">class MixedObjectFilter(compiled.CompiledObjectFilter):
    name_class = MixedName

    @others
</t>
<t tx="ekr.20180519065723.251">def __init__(self, evaluator, mixed_object, is_instance=False):
    super(MixedObjectFilter, self).__init__(
        evaluator, mixed_object, is_instance)
    self._mixed_object = mixed_object

#def _create(self, name):
    #return MixedName(self._evaluator, self._compiled_object, name)


</t>
<t tx="ekr.20180519065723.252">@evaluator_function_cache()
def _load_module(evaluator, path):
    module_node = evaluator.grammar.parse(
        path=path,
        cache=True,
        diff_cache=True,
        cache_path=settings.cache_directory
    ).get_root_node()
    # python_module = inspect.getmodule(python_object)
    # TODO we should actually make something like this possible.
    #evaluator.modules[python_module.__name__] = module_node
    return module_node


</t>
<t tx="ekr.20180519065723.253">def _get_object_to_check(python_object):
    """Check if inspect.getfile has a chance to find the source."""
    if (inspect.ismodule(python_object) or
            inspect.isclass(python_object) or
            inspect.ismethod(python_object) or
            inspect.isfunction(python_object) or
            inspect.istraceback(python_object) or
            inspect.isframe(python_object) or
            inspect.iscode(python_object)):
        return python_object

    try:
        return python_object.__class__
    except AttributeError:
        raise TypeError  # Prevents computation of `repr` within inspect.


</t>
<t tx="ekr.20180519065723.254">def _find_syntax_node_name(evaluator, access_handle):
    # TODO accessing this is bad, but it probably doesn't matter that much,
    # because we're working with interpreteters only here.
    python_object = access_handle.access._obj
    try:
        python_object = _get_object_to_check(python_object)
        path = inspect.getsourcefile(python_object)
    except TypeError:
        # The type might not be known (e.g. class_with_dict.__weakref__)
        return None
    if path is None or not os.path.exists(path):
        # The path might not exist or be e.g. &lt;stdin&gt;.
        return None

    module_node = _load_module(evaluator, path)

    if inspect.ismodule(python_object):
        # We don't need to check names for modules, because there's not really
        # a way to write a module in a module in Python (and also __name__ can
        # be something like ``email.utils``).
        code_lines = get_cached_code_lines(evaluator.grammar, path)
        return module_node, module_node, path, code_lines

    try:
        name_str = python_object.__name__
    except AttributeError:
        # Stuff like python_function.__code__.
        return None

    if name_str == '&lt;lambda&gt;':
        return None  # It's too hard to find lambdas.

    # Doesn't always work (e.g. os.stat_result)
    try:
        names = module_node.get_used_names()[name_str]
    except KeyError:
        return None
    names = [n for n in names if n.is_definition()]

    try:
        code = python_object.__code__
        # By using the line number of a code object we make the lookup in a
        # file pretty easy. There's still a possibility of people defining
        # stuff like ``a = 3; foo(a); a = 4`` on the same line, but if people
        # do so we just don't care.
        line_nr = code.co_firstlineno
    except AttributeError:
        pass
    else:
        line_names = [name for name in names if name.start_pos[0] == line_nr]
        # There's a chance that the object is not available anymore, because
        # the code has changed in the background.
        if line_names:
            names = line_names

    code_lines = get_cached_code_lines(evaluator.grammar, path)
    # It's really hard to actually get the right definition, here as a last
    # resort we just return the last one. This chance might lead to odd
    # completions at some points but will lead to mostly correct type
    # inference, because people tend to define a public name in a module only
    # once.
    return module_node, names[-1].parent, path, code_lines


</t>
<t tx="ekr.20180519065723.255">@compiled_objects_cache('mixed_cache')
def _create(evaluator, access_handle, parent_context, *args):
    compiled_object = create_cached_compiled_object(
        evaluator, access_handle, parent_context=parent_context.compiled_object)

    result = _find_syntax_node_name(evaluator, access_handle)
    if result is None:
        return compiled_object

    module_node, tree_node, path, code_lines = result

    if parent_context.tree_node.get_root_node() == module_node:
        module_context = parent_context.get_root_context()
    else:
        module_context = ModuleContext(
            evaluator, module_node,
            path=path,
            code_lines=code_lines,
        )
        # TODO this __name__ is probably wrong.
        name = compiled_object.get_root_context().py__name__()
        if name is not None:
            imports.add_module_to_cache(evaluator, name, module_context)

    tree_context = module_context.create_context(
        tree_node,
        node_is_context=True,
        node_is_object=True
    )
    if tree_node.type == 'classdef':
        if not access_handle.is_class():
            # Is an instance, not a class.
            tree_context, = tree_context.execute_evaluated()

    return MixedObject(
        evaluator,
        parent_context,
        compiled_object,
        tree_context=tree_context
    )
</t>
<t tx="ekr.20180519065723.256">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/compiled/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065723.257">from jedi._compatibility import unicode
from jedi.evaluate.compiled.context import CompiledObject, CompiledName, \
    CompiledObjectFilter, CompiledContextName, create_from_access_path, \
    create_from_name


</t>
<t tx="ekr.20180519065723.258">def builtin_from_name(evaluator, string):
    builtins = evaluator.builtins_module
    return create_from_name(evaluator, builtins, string)


</t>
<t tx="ekr.20180519065723.259">def create_simple_object(evaluator, obj):
    """
    Only allows creations of objects that are easily picklable across Python
    versions.
    """
    assert isinstance(obj, (int, float, str, bytes, unicode, slice, complex))
    return create_from_access_path(
        evaluator,
        evaluator.compiled_subprocess.create_simple_object(obj)
    )


</t>
<t tx="ekr.20180519065723.26">@argument_clinic('object, name[, default], /')
def builtins_getattr(evaluator, objects, names, defaults=None):
    # follow the first param
    for obj in objects:
        for name in names:
            if is_string(name):
                return obj.py__getattribute__(force_unicode(name.get_safe_value()))
            else:
                debug.warning('getattr called without str')
                continue
    return NO_CONTEXTS


</t>
<t tx="ekr.20180519065723.260">def get_special_object(evaluator, identifier):
    return create_from_access_path(
        evaluator,
        evaluator.compiled_subprocess.get_special_object(identifier)
    )


</t>
<t tx="ekr.20180519065723.261">def get_string_context_set(evaluator):
    return builtin_from_name(evaluator, u'str').execute_evaluated()


</t>
<t tx="ekr.20180519065723.262">def load_module(evaluator, **kwargs):
    access_path = evaluator.compiled_subprocess.load_module(**kwargs)
    if access_path is None:
        return None
    return create_from_access_path(evaluator, access_path)
</t>
<t tx="ekr.20180519065723.265"></t>
<t tx="ekr.20180519065723.266">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/compiled/subprocess/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065723.267">import sys
import os

from jedi._compatibility import find_module, cast_path, force_unicode, \
    iter_modules, all_suffixes, print_to_stderr
from jedi.evaluate.compiled import access
from jedi import parser_utils


</t>
<t tx="ekr.20180519065723.268">def get_sys_path():
    return list(map(cast_path, sys.path))


</t>
<t tx="ekr.20180519065723.269">def load_module(evaluator, **kwargs):
    return access.load_module(evaluator, **kwargs)


</t>
<t tx="ekr.20180519065723.27">@argument_clinic('object[, bases, dict], /')
def builtins_type(evaluator, objects, bases, dicts):
    if bases or dicts:
        # It's a type creation... maybe someday...
        return NO_CONTEXTS
    else:
        return objects.py__class__()


</t>
<t tx="ekr.20180519065723.270">def get_compiled_method_return(evaluator, id, attribute, *args, **kwargs):
    handle = evaluator.compiled_subprocess.get_access_handle(id)
    return getattr(handle.access, attribute)(*args, **kwargs)


</t>
<t tx="ekr.20180519065723.271">def get_special_object(evaluator, identifier):
    return access.get_special_object(evaluator, identifier)


</t>
<t tx="ekr.20180519065723.272">def create_simple_object(evaluator, obj):
    return access.create_access_path(evaluator, obj)


</t>
<t tx="ekr.20180519065723.273">def get_module_info(evaluator, sys_path=None, full_name=None, **kwargs):
    if sys_path is not None:
        sys.path, temp = sys_path, sys.path
    try:
        module_file, module_path, is_pkg = find_module(full_name=full_name, **kwargs)
    except ImportError:
        return None, None, None
    finally:
        if sys_path is not None:
            sys.path = temp

    code = None
    if is_pkg:
        # In this case, we don't have a file yet. Search for the
        # __init__ file.
        if module_path.endswith(('.zip', '.egg')):
            code = module_file.loader.get_source(full_name)
        else:
            module_path = _get_init_path(module_path)
    elif module_file:
        if module_path.endswith(('.zip', '.egg')):
            # Unfortunately we are reading unicode here already, not byes.
            # It seems however hard to get bytes, because the zip importer
            # logic just unpacks the zip file and returns a file descriptor
            # that we cannot as easily access. Therefore we just read it as
            # a string.
            code = module_file.read()
        else:
            # Read the code with a binary file, because the binary file
            # might not be proper unicode. This is handled by the parser
            # wrapper.
            with open(module_path, 'rb') as f:
                code = f.read()

        module_file.close()

    return code, cast_path(module_path), is_pkg


</t>
<t tx="ekr.20180519065723.274">def list_module_names(evaluator, search_path):
    return [
        name
        for module_loader, name, is_pkg in iter_modules(search_path)
    ]


</t>
<t tx="ekr.20180519065723.275">def get_builtin_module_names(evaluator):
    return list(map(force_unicode, sys.builtin_module_names))


</t>
<t tx="ekr.20180519065723.276">def _test_raise_error(evaluator, exception_type):
    """
    Raise an error to simulate certain problems for unit tests.
    """
    raise exception_type


</t>
<t tx="ekr.20180519065723.277">def _test_print(evaluator, stderr=None, stdout=None):
    """
    Force some prints in the subprocesses. This exists for unit tests.
    """
    if stderr is not None:
        print_to_stderr(stderr)
        sys.stderr.flush()
    if stdout is not None:
        print(stdout)
        sys.stdout.flush()


</t>
<t tx="ekr.20180519065723.278">def _get_init_path(directory_path):
    """
    The __init__ file can be searched in a directory. If found return it, else
    None.
    """
    for suffix in all_suffixes():
        path = os.path.join(directory_path, '__init__' + suffix)
        if os.path.exists(path):
            return path
    return None


</t>
<t tx="ekr.20180519065723.279">def safe_literal_eval(evaluator, value):
    return parser_utils.safe_literal_eval(value)
</t>
<t tx="ekr.20180519065723.28">class SuperInstance(AbstractInstanceContext):
    """To be used like the object ``super`` returns."""
    @others
</t>
<t tx="ekr.20180519065723.280">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/compiled/subprocess/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065723.281">"""
Makes it possible to do the compiled analysis in a subprocess. This has two
goals:

1. Making it safer - Segfaults and RuntimeErrors as well as stdout/stderr can
   be ignored and dealt with.
2. Make it possible to handle different Python versions as well as virtualenvs.
"""

import os
import sys
import subprocess
import socket
import errno
import weakref
import traceback
from functools import partial

from jedi._compatibility import queue, is_py3, force_unicode, \
    pickle_dump, pickle_load, GeneralizedPopen
from jedi.cache import memoize_method
from jedi.evaluate.compiled.subprocess import functions
from jedi.evaluate.compiled.access import DirectObjectAccess, AccessPath, \
    SignatureParam
from jedi.api.exceptions import InternalError

_subprocesses = {}

_MAIN_PATH = os.path.join(os.path.dirname(__file__), '__main__.py')


</t>
<t tx="ekr.20180519065723.282">def get_subprocess(executable):
    try:
        return _subprocesses[executable]
    except KeyError:
        sub = _subprocesses[executable] = _CompiledSubprocess(executable)
        return sub


</t>
<t tx="ekr.20180519065723.283">def _get_function(name):
    return getattr(functions, name)


</t>
<t tx="ekr.20180519065723.284">class _EvaluatorProcess(object):
    @others
</t>
<t tx="ekr.20180519065723.285">def __init__(self, evaluator):
    self._evaluator_weakref = weakref.ref(evaluator)
    self._evaluator_id = id(evaluator)
    self._handles = {}

</t>
<t tx="ekr.20180519065723.286">def get_or_create_access_handle(self, obj):
    id_ = id(obj)
    try:
        return self.get_access_handle(id_)
    except KeyError:
        access = DirectObjectAccess(self._evaluator_weakref(), obj)
        handle = AccessHandle(self, access, id_)
        self.set_access_handle(handle)
        return handle

</t>
<t tx="ekr.20180519065723.287">def get_access_handle(self, id_):
    return self._handles[id_]

</t>
<t tx="ekr.20180519065723.288">def set_access_handle(self, handle):
    self._handles[handle.id] = handle


</t>
<t tx="ekr.20180519065723.289">class EvaluatorSameProcess(_EvaluatorProcess):
    """
    Basically just an easy access to functions.py. It has the same API
    as EvaluatorSubprocess and does the same thing without using a subprocess.
    This is necessary for the Interpreter process.
    """
    @others
</t>
<t tx="ekr.20180519065723.29">def __init__(self, evaluator, cls):
    su = cls.py_mro()[1]
    super().__init__(evaluator, su and su[0] or self)


</t>
<t tx="ekr.20180519065723.290">def __getattr__(self, name):
    return partial(_get_function(name), self._evaluator_weakref())


</t>
<t tx="ekr.20180519065723.291">class EvaluatorSubprocess(_EvaluatorProcess):
    @others
</t>
<t tx="ekr.20180519065723.292">def __init__(self, evaluator, compiled_subprocess):
    super(EvaluatorSubprocess, self).__init__(evaluator)
    self._used = False
    self._compiled_subprocess = compiled_subprocess

</t>
<t tx="ekr.20180519065723.293">def __getattr__(self, name):
    func = _get_function(name)

    def wrapper(*args, **kwargs):
        self._used = True

        result = self._compiled_subprocess.run(
            self._evaluator_weakref(),
            func,
            args=args,
            kwargs=kwargs,
        )
        # IMO it should be possible to create a hook in pickle.load to
        # mess with the loaded objects. However it's extremely complicated
        # to work around this so just do it with this call. ~ dave
        return self._convert_access_handles(result)

    return wrapper

</t>
<t tx="ekr.20180519065723.294">def _convert_access_handles(self, obj):
    if isinstance(obj, SignatureParam):
        return SignatureParam(*self._convert_access_handles(tuple(obj)))
    elif isinstance(obj, tuple):
        return tuple(self._convert_access_handles(o) for o in obj)
    elif isinstance(obj, list):
        return [self._convert_access_handles(o) for o in obj]
    elif isinstance(obj, AccessHandle):
        try:
            # Rewrite the access handle to one we're already having.
            obj = self.get_access_handle(obj.id)
        except KeyError:
            obj.add_subprocess(self)
            self.set_access_handle(obj)
    elif isinstance(obj, AccessPath):
        return AccessPath(self._convert_access_handles(obj.accesses))
    return obj

</t>
<t tx="ekr.20180519065723.295">def __del__(self):
    if self._used:
        self._compiled_subprocess.delete_evaluator(self._evaluator_id)


</t>
<t tx="ekr.20180519065723.296">class _CompiledSubprocess(object):
    _crashed = False

    @others
</t>
<t tx="ekr.20180519065723.297">def __init__(self, executable):
    self._executable = executable
    self._evaluator_deletion_queue = queue.deque()

</t>
<t tx="ekr.20180519065723.298">@property
@memoize_method
def _process(self):
    parso_path = sys.modules['parso'].__file__
    args = (
        self._executable,
        _MAIN_PATH,
        os.path.dirname(os.path.dirname(parso_path))
    )
    return GeneralizedPopen(
        args,
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
    )

</t>
<t tx="ekr.20180519065723.299">def run(self, evaluator, function, args=(), kwargs={}):
    # Delete old evaluators.
    while True:
        try:
            evaluator_id = self._evaluator_deletion_queue.pop()
        except IndexError:
            break
        else:
            self._send(evaluator_id, None)

    assert callable(function)
    return self._send(id(evaluator), function, args, kwargs)

</t>
<t tx="ekr.20180519065723.3">def _get_typing_replacement_module(grammar):
    """
    The idea is to return our jedi replacement for the PEP-0484 typing module
    as discussed at https://github.com/davidhalter/jedi/issues/663
    """
    global _typing_module, _typing_module_code_lines
    if _typing_module is None:
        typing_path = \
            os.path.abspath(os.path.join(__file__, "../jedi_typing.py"))
        with open(typing_path) as f:
            code = unicode(f.read())
        _typing_module = grammar.parse(code)
        _typing_module_code_lines = split_lines(code, keepends=True)
    return _typing_module, _typing_module_code_lines


</t>
<t tx="ekr.20180519065723.30">@argument_clinic('[type[, obj]], /', want_context=True)
def builtins_super(evaluator, types, objects, context):
    # TODO make this able to detect multiple inheritance super
    if isinstance(context, (InstanceFunctionExecution,
                            AnonymousInstanceFunctionExecution)):
        su = context.instance.py__class__().py__bases__()
        return su[0].infer().execute_evaluated()
    return NO_CONTEXTS


</t>
<t tx="ekr.20180519065723.300">def get_sys_path(self):
    return self._send(None, functions.get_sys_path, (), {})

</t>
<t tx="ekr.20180519065723.301">def kill(self):
    self._crashed = True
    try:
        subprocess = _subprocesses[self._executable]
    except KeyError:
        # Fine it was already removed from the cache.
        pass
    else:
        # In the `!=` case there is already a new subprocess in place
        # and we don't need to do anything here anymore.
        if subprocess == self:
            del _subprocesses[self._executable]

    self._process.kill()
    self._process.wait()

</t>
<t tx="ekr.20180519065723.302">def _send(self, evaluator_id, function, args=(), kwargs={}):
    if self._crashed:
        raise InternalError("The subprocess %s has crashed." % self._executable)

    if not is_py3:
        # Python 2 compatibility
        kwargs = {force_unicode(key): value for key, value in kwargs.items()}

    data = evaluator_id, function, args, kwargs
    try:
        pickle_dump(data, self._process.stdin)
    except (socket.error, IOError) as e:
        # Once Python2 will be removed we can just use `BrokenPipeError`.
        # Also, somehow in windows it returns EINVAL instead of EPIPE if
        # the subprocess dies.
        if e.errno not in (errno.EPIPE, errno.EINVAL):
            # Not a broken pipe
            raise
        self.kill()
        raise InternalError("The subprocess %s was killed. Maybe out of memory?"
                            % self._executable)

    try:
        is_exception, traceback, result = pickle_load(self._process.stdout)
    except EOFError:
        self.kill()
        raise InternalError("The subprocess %s has crashed." % self._executable)

    if is_exception:
        # Replace the attribute error message with a the traceback. It's
        # way more informative.
        result.args = (traceback,)
        raise result
    return result

</t>
<t tx="ekr.20180519065723.303">def delete_evaluator(self, evaluator_id):
    """
    Currently we are not deleting evalutors instantly. They only get
    deleted once the subprocess is used again. It would probably a better
    solution to move all of this into a thread. However, the memory usage
    of a single evaluator shouldn't be that high.
    """
    # With an argument - the evaluator gets deleted.
    self._evaluator_deletion_queue.append(evaluator_id)


</t>
<t tx="ekr.20180519065723.304">class Listener(object):
    @others
</t>
<t tx="ekr.20180519065723.305">def __init__(self):
    self._evaluators = {}
    # TODO refactor so we don't need to process anymore just handle
    # controlling.
    self._process = _EvaluatorProcess(Listener)

</t>
<t tx="ekr.20180519065723.306">def _get_evaluator(self, function, evaluator_id):
    from jedi.evaluate import Evaluator

    try:
        evaluator = self._evaluators[evaluator_id]
    except KeyError:
        from jedi.api.environment import InterpreterEnvironment
        evaluator = Evaluator(
            # The project is not actually needed. Nothing should need to
            # access it.
            project=None,
            environment=InterpreterEnvironment()
        )
        self._evaluators[evaluator_id] = evaluator
    return evaluator

</t>
<t tx="ekr.20180519065723.307">def _run(self, evaluator_id, function, args, kwargs):
    if evaluator_id is None:
        return function(*args, **kwargs)
    elif function is None:
        del self._evaluators[evaluator_id]
    else:
        evaluator = self._get_evaluator(function, evaluator_id)

        # Exchange all handles
        args = list(args)
        for i, arg in enumerate(args):
            if isinstance(arg, AccessHandle):
                args[i] = evaluator.compiled_subprocess.get_access_handle(arg.id)
        for key, value in kwargs.items():
            if isinstance(value, AccessHandle):
                kwargs[key] = evaluator.compiled_subprocess.get_access_handle(value.id)

        return function(evaluator, *args, **kwargs)

</t>
<t tx="ekr.20180519065723.308">def listen(self):
    stdout = sys.stdout
    # Mute stdout/stderr. Nobody should actually be able to write to those,
    # because stdout is used for IPC and stderr will just be annoying if it
    # leaks (on module imports).
    sys.stdout = open(os.devnull, 'w')
    sys.stderr = open(os.devnull, 'w')
    stdin = sys.stdin
    if sys.version_info[0] &gt; 2:
        stdout = stdout.buffer
        stdin = stdin.buffer

    while True:
        try:
            payload = pickle_load(stdin)
        except EOFError:
            # It looks like the parent process closed. Don't make a big fuss
            # here and just exit.
            exit(1)
        try:
            result = False, None, self._run(*payload)
        except Exception as e:
            result = True, traceback.format_exc(), e

        pickle_dump(result, file=stdout)


</t>
<t tx="ekr.20180519065723.309">class AccessHandle(object):
    @others
</t>
<t tx="ekr.20180519065723.31">@argument_clinic('sequence, /', want_obj=True, want_arguments=True)
def builtins_reversed(evaluator, sequences, obj, arguments):
    # While we could do without this variable (just by using sequences), we
    # want static analysis to work well. Therefore we need to generated the
    # values again.
    key, lazy_context = next(arguments.unpack())
    cn = None
    if isinstance(lazy_context, LazyTreeContext):
        # TODO access private
        cn = ContextualizedNode(lazy_context._context, lazy_context.data)
    ordered = list(sequences.iterate(cn))

    rev = list(reversed(ordered))
    # Repack iterator values and then run it the normal way. This is
    # necessary, because `reversed` is a function and autocompletion
    # would fail in certain cases like `reversed(x).__iter__` if we
    # just returned the result directly.
    seq = iterable.FakeSequence(evaluator, u'list', rev)
    arguments = ValuesArguments([ContextSet(seq)])
    return ContextSet(CompiledInstance(evaluator, evaluator.builtins_module, obj, arguments))


</t>
<t tx="ekr.20180519065723.310">def __init__(self, subprocess, access, id_):
    self.access = access
    self._subprocess = subprocess
    self.id = id_

</t>
<t tx="ekr.20180519065723.311">def add_subprocess(self, subprocess):
    self._subprocess = subprocess

</t>
<t tx="ekr.20180519065723.312">def __repr__(self):
    try:
        detail = self.access
    except AttributeError:
        detail = '#' + str(self.id)
    return '&lt;%s of %s&gt;' % (self.__class__.__name__, detail)

</t>
<t tx="ekr.20180519065723.313">def __getstate__(self):
    return self.id

</t>
<t tx="ekr.20180519065723.314">def __setstate__(self, state):
    self.id = state

</t>
<t tx="ekr.20180519065723.315">def __getattr__(self, name):
    if name in ('id', 'access') or name.startswith('_'):
        raise AttributeError("Something went wrong with unpickling")

    #if not is_py3: print &gt;&gt; sys.stderr, name
    #print('getattr', name, file=sys.stderr)
    return partial(self._workaround, force_unicode(name))

</t>
<t tx="ekr.20180519065723.316">def _workaround(self, name, *args, **kwargs):
    """
    TODO Currently we're passing slice objects around. This should not
    happen. They are also the only unhashable objects that we're passing
    around.
    """
    if args and isinstance(args[0], slice):
        return self._subprocess.get_compiled_method_return(self.id, name, *args, **kwargs)
    return self._cached_results(name, *args, **kwargs)

</t>
<t tx="ekr.20180519065723.317">@memoize_method
def _cached_results(self, name, *args, **kwargs):
    #if type(self._subprocess) == EvaluatorSubprocess:
        #print(name, args, kwargs,
            #self._subprocess.get_compiled_method_return(self.id, name, *args, **kwargs)
        #)
    return self._subprocess.get_compiled_method_return(self.id, name, *args, **kwargs)
</t>
<t tx="ekr.20180519065723.32">@argument_clinic('obj, type, /', want_arguments=True)
def builtins_isinstance(evaluator, objects, types, arguments):
    bool_results = set()
    for o in objects:
        cls = o.py__class__()
        try:
            mro_func = cls.py__mro__
        except AttributeError:
            # This is temporary. Everything should have a class attribute in
            # Python?! Maybe we'll leave it here, because some numpy objects or
            # whatever might not.
            bool_results = set([True, False])
            break

        mro = mro_func()

        for cls_or_tup in types:
            if cls_or_tup.is_class():
                bool_results.add(cls_or_tup in mro)
            elif cls_or_tup.name.string_name == 'tuple' \
                    and cls_or_tup.get_root_context() == evaluator.builtins_module:
                # Check for tuples.
                classes = ContextSet.from_sets(
                    lazy_context.infer()
                    for lazy_context in cls_or_tup.iterate()
                )
                bool_results.add(any(cls in mro for cls in classes))
            else:
                _, lazy_context = list(arguments.unpack())[1]
                if isinstance(lazy_context, LazyTreeContext):
                    node = lazy_context.data
                    message = 'TypeError: isinstance() arg 2 must be a ' \
                              'class, type, or tuple of classes and types, ' \
                              'not %s.' % cls_or_tup
                    analysis.add(lazy_context._context, 'type-error-isinstance', node, message)

    return ContextSet.from_iterable(
        compiled.builtin_from_name(evaluator, force_unicode(str(b)))
        for b in bool_results
    )


</t>
<t tx="ekr.20180519065723.33">def collections_namedtuple(evaluator, obj, arguments):
    """
    Implementation of the namedtuple function.

    This has to be done by processing the namedtuple class template and
    evaluating the result.

    """
    collections_context = obj.parent_context
    _class_template_set = collections_context.py__getattribute__(u'_class_template')
    if not _class_template_set:
        # Namedtuples are not supported on Python 2.6, early 2.7, because the
        # _class_template variable is not defined, there.
        return NO_CONTEXTS

    # Process arguments
    # TODO here we only use one of the types, we should use all.
    # TODO this is buggy, doesn't need to be a string
    name = list(_follow_param(evaluator, arguments, 0))[0].get_safe_value()
    _fields = list(_follow_param(evaluator, arguments, 1))[0]
    if isinstance(_fields, compiled.CompiledObject):
        fields = _fields.get_safe_value().replace(',', ' ').split()
    elif isinstance(_fields, iterable.Sequence):
        fields = [
            v.get_safe_value()
            for lazy_context in _fields.py__iter__()
            for v in lazy_context.infer() if is_string(v)
        ]
    else:
        return NO_CONTEXTS

    def get_var(name):
        x, = collections_context.py__getattribute__(name)
        return x.get_safe_value()

    base = next(iter(_class_template_set)).get_safe_value()
    base += _NAMEDTUPLE_INIT
    # Build source code
    code = base.format(
        typename=name,
        field_names=tuple(fields),
        num_fields=len(fields),
        arg_list=repr(tuple(fields)).replace("u'", "").replace("'", "")[1:-1],
        repr_fmt=', '.join(get_var(u'_repr_template').format(name=name) for name in fields),
        field_defs='\n'.join(get_var(u'_field_template').format(index=index, name=name)
                             for index, name in enumerate(fields))
    )

    # Parse source code
    module = evaluator.grammar.parse(code)
    generated_class = next(module.iter_classdefs())
    parent_context = ModuleContext(
        evaluator, module, None,
        code_lines=parso.split_lines(code, keepends=True),
    )
    return ContextSet(ClassContext(evaluator, parent_context, generated_class))


</t>
<t tx="ekr.20180519065723.34">@argument_clinic('first, /')
def _return_first_param(evaluator, firsts):
    return firsts


_implemented = {
    'builtins': {
        'getattr': builtins_getattr,
        'type': builtins_type,
        'super': builtins_super,
        'reversed': builtins_reversed,
        'isinstance': builtins_isinstance,
    },
    'copy': {
        'copy': _return_first_param,
        'deepcopy': _return_first_param,
    },
    'json': {
        'load': lambda *args: NO_CONTEXTS,
        'loads': lambda *args: NO_CONTEXTS,
    },
    'collections': {
        'namedtuple': collections_namedtuple,
    },
}
</t>
<t tx="ekr.20180519065723.35">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065723.36">"""
Functions evaluating the syntax tree.
"""
import copy

from parso.python import tree

from jedi._compatibility import force_unicode, unicode
from jedi import debug
from jedi import parser_utils
from jedi.evaluate.base_context import ContextSet, NO_CONTEXTS, ContextualizedNode, \
    ContextualizedName, iterator_to_context_set, iterate_contexts
from jedi.evaluate import compiled
from jedi.evaluate import pep0484
from jedi.evaluate import recursion
from jedi.evaluate import helpers
from jedi.evaluate import analysis
from jedi.evaluate import imports
from jedi.evaluate import arguments
from jedi.evaluate.pep0484 import _evaluate_for_annotation
from jedi.evaluate.context import ClassContext, FunctionContext
from jedi.evaluate.context import iterable
from jedi.evaluate.context import TreeInstance, CompiledInstance
from jedi.evaluate.finder import NameFinder
from jedi.evaluate.helpers import is_string, is_literal, is_number, is_compiled
from jedi.evaluate.compiled.access import COMPARISON_OPERATORS


</t>
<t tx="ekr.20180519065723.37">def _limit_context_infers(func):
    """
    This is for now the way how we limit type inference going wild. There are
    other ways to ensure recursion limits as well. This is mostly necessary
    because of instance (self) access that can be quite tricky to limit.

    I'm still not sure this is the way to go, but it looks okay for now and we
    can still go anther way in the future. Tests are there. ~ dave
    """
    def wrapper(context, *args, **kwargs):
        n = context.tree_node
        evaluator = context.evaluator
        try:
            evaluator.inferred_element_counts[n] += 1
            if evaluator.inferred_element_counts[n] &gt; 300:
                debug.warning('In context %s there were too many inferences.', n)
                return NO_CONTEXTS
        except KeyError:
            evaluator.inferred_element_counts[n] = 1
        return func(context, *args, **kwargs)

    return wrapper


</t>
<t tx="ekr.20180519065723.38">def _py__stop_iteration_returns(generators):
    results = ContextSet()
    for generator in generators:
        try:
            method = generator.py__stop_iteration_returns
        except AttributeError:
            debug.warning('%s is not actually a generator', generator)
        else:
            results |= method()
    return results


</t>
<t tx="ekr.20180519065723.39">@debug.increase_indent
@_limit_context_infers
def eval_node(context, element):
    debug.dbg('eval_node %s@%s', element, element.start_pos)
    evaluator = context.evaluator
    typ = element.type
    if typ in ('name', 'number', 'string', 'atom', 'strings'):
        return eval_atom(context, element)
    elif typ == 'keyword':
        # For False/True/None
        if element.value in ('False', 'True', 'None'):
            return ContextSet(compiled.builtin_from_name(evaluator, element.value))
        # else: print e.g. could be evaluated like this in Python 2.7
        return NO_CONTEXTS
    elif typ == 'lambdef':
        return ContextSet(FunctionContext(evaluator, context, element))
    elif typ == 'expr_stmt':
        return eval_expr_stmt(context, element)
    elif typ in ('power', 'atom_expr'):
        first_child = element.children[0]
        children = element.children[1:]
        had_await = False
        if first_child.type == 'keyword' and first_child.value == 'await':
            had_await = True
            first_child = children.pop(0)

        context_set = eval_atom(context, first_child)
        for trailer in children:
            if trailer == '**':  # has a power operation.
                right = context.eval_node(children[1])
                context_set = _eval_comparison(
                    evaluator,
                    context,
                    context_set,
                    trailer,
                    right
                )
                break
            context_set = eval_trailer(context, context_set, trailer)

        if had_await:
            await_context_set = context_set.py__getattribute__(u"__await__")
            if not await_context_set:
                debug.warning('Tried to run py__await__ on context %s', context)
            context_set = ContextSet()
            return _py__stop_iteration_returns(await_context_set.execute_evaluated())
        return context_set
    elif typ in ('testlist_star_expr', 'testlist',):
        # The implicit tuple in statements.
        return ContextSet(iterable.SequenceLiteralContext(evaluator, context, element))
    elif typ in ('not_test', 'factor'):
        context_set = context.eval_node(element.children[-1])
        for operator in element.children[:-1]:
            context_set = eval_factor(context_set, operator)
        return context_set
    elif typ == 'test':
        # `x if foo else y` case.
        return (context.eval_node(element.children[0]) |
                context.eval_node(element.children[-1]))
    elif typ == 'operator':
        # Must be an ellipsis, other operators are not evaluated.
        # In Python 2 ellipsis is coded as three single dot tokens, not
        # as one token 3 dot token.
        if element.value not in ('.', '...'):
            origin = element.parent
            raise AssertionError("unhandled operator %s in %s " % (repr(element.value), origin))
        return ContextSet(compiled.builtin_from_name(evaluator, u'Ellipsis'))
    elif typ == 'dotted_name':
        context_set = eval_atom(context, element.children[0])
        for next_name in element.children[2::2]:
            # TODO add search_global=True?
            context_set = context_set.py__getattribute__(next_name, name_context=context)
        return context_set
    elif typ == 'eval_input':
        return eval_node(context, element.children[0])
    elif typ == 'annassign':
        return pep0484._evaluate_for_annotation(context, element.children[1])
    elif typ == 'yield_expr':
        if len(element.children) and element.children[1].type == 'yield_arg':
            # Implies that it's a yield from.
            element = element.children[1].children[1]
            generators = context.eval_node(element)
            return _py__stop_iteration_returns(generators)

        # Generator.send() is not implemented.
        return NO_CONTEXTS
    else:
        return eval_or_test(context, element)


</t>
<t tx="ekr.20180519065723.4">def py__getitem__(context, typ, node):
    if not typ.get_root_context().name.string_name == "typing":
        return None
    # we assume that any class using [] in a module called
    # "typing" with a name for which we have a replacement
    # should be replaced by that class. This is not 100%
    # airtight but I don't have a better idea to check that it's
    # actually the PEP-0484 typing module and not some other
    if node.type == "subscriptlist":
        nodes = node.children[::2]  # skip the commas
    else:
        nodes = [node]
    del node

    nodes = [_fix_forward_reference(context, node) for node in nodes]
    type_name = typ.name.string_name

    # hacked in Union and Optional, since it's hard to do nicely in parsed code
    if type_name in ("Union", '_Union'):
        # In Python 3.6 it's still called typing.Union but it's an instance
        # called _Union.
        return ContextSet.from_sets(context.eval_node(node) for node in nodes)
    if type_name in ("Optional", '_Optional'):
        # Here we have the same issue like in Union. Therefore we also need to
        # check for the instance typing._Optional (Python 3.6).
        return context.eval_node(nodes[0])

    module_node, code_lines = _get_typing_replacement_module(context.evaluator.latest_grammar)
    typing = ModuleContext(
        context.evaluator,
        module_node=module_node,
        path=None,
        code_lines=code_lines,
    )
    factories = typing.py__getattribute__("factory")
    assert len(factories) == 1
    factory = list(factories)[0]
    assert factory
    function_body_nodes = factory.tree_node.children[4].children
    valid_classnames = set(child.name.value
                           for child in function_body_nodes
                           if isinstance(child, tree.Class))
    if type_name not in valid_classnames:
        return None
    compiled_classname = compiled.create_simple_object(context.evaluator, type_name)

    from jedi.evaluate.context.iterable import FakeSequence
    args = FakeSequence(
        context.evaluator,
        u'tuple',
        [LazyTreeContext(context, n) for n in nodes]
    )

    result = factory.execute_evaluated(compiled_classname, args)
    return result


</t>
<t tx="ekr.20180519065723.40">def eval_trailer(context, base_contexts, trailer):
    trailer_op, node = trailer.children[:2]
    if node == ')':  # `arglist` is optional.
        node = None

    if trailer_op == '[':
        trailer_op, node, _ = trailer.children

        # TODO It's kind of stupid to cast this from a context set to a set.
        foo = set(base_contexts)
        # special case: PEP0484 typing module, see
        # https://github.com/davidhalter/jedi/issues/663
        result = ContextSet()
        for typ in list(foo):
            if isinstance(typ, (ClassContext, TreeInstance)):
                typing_module_types = pep0484.py__getitem__(context, typ, node)
                if typing_module_types is not None:
                    foo.remove(typ)
                    result |= typing_module_types

        return result | base_contexts.get_item(
            eval_subscript_list(context.evaluator, context, node),
            ContextualizedNode(context, trailer)
        )
    else:
        debug.dbg('eval_trailer: %s in %s', trailer, base_contexts)
        if trailer_op == '.':
            return base_contexts.py__getattribute__(
                name_context=context,
                name_or_str=node
            )
        else:
            assert trailer_op == '(', 'trailer_op is actually %s' % trailer_op
            args = arguments.TreeArguments(context.evaluator, context, node, trailer)
            return base_contexts.execute(args)


</t>
<t tx="ekr.20180519065723.41">def eval_atom(context, atom):
    """
    Basically to process ``atom`` nodes. The parser sometimes doesn't
    generate the node (because it has just one child). In that case an atom
    might be a name or a literal as well.
    """
    if atom.type == 'name':
        # This is the first global lookup.
        stmt = tree.search_ancestor(
            atom, 'expr_stmt', 'lambdef'
        ) or atom
        if stmt.type == 'lambdef':
            stmt = atom
        return context.py__getattribute__(
            name_or_str=atom,
            position=stmt.start_pos,
            search_global=True
        )

    elif isinstance(atom, tree.Literal):
        string = context.evaluator.compiled_subprocess.safe_literal_eval(atom.value)
        return ContextSet(compiled.create_simple_object(context.evaluator, string))
    elif atom.type == 'strings':
        # Will be multiple string.
        context_set = eval_atom(context, atom.children[0])
        for string in atom.children[1:]:
            right = eval_atom(context, string)
            context_set = _eval_comparison(context.evaluator, context, context_set, u'+', right)
        return context_set
    else:
        c = atom.children
        # Parentheses without commas are not tuples.
        if c[0] == '(' and not len(c) == 2 \
                and not(c[1].type == 'testlist_comp' and
                        len(c[1].children) &gt; 1):
            return context.eval_node(c[1])

        try:
            comp_for = c[1].children[1]
        except (IndexError, AttributeError):
            pass
        else:
            if comp_for == ':':
                # Dict comprehensions have a colon at the 3rd index.
                try:
                    comp_for = c[1].children[3]
                except IndexError:
                    pass

            if comp_for.type == 'comp_for':
                return ContextSet(iterable.comprehension_from_atom(
                    context.evaluator, context, atom
                ))

        # It's a dict/list/tuple literal.
        array_node = c[1]
        try:
            array_node_c = array_node.children
        except AttributeError:
            array_node_c = []
        if c[0] == '{' and (array_node == '}' or ':' in array_node_c):
            context = iterable.DictLiteralContext(context.evaluator, context, atom)
        else:
            context = iterable.SequenceLiteralContext(context.evaluator, context, atom)
        return ContextSet(context)


</t>
<t tx="ekr.20180519065723.42">@_limit_context_infers
def eval_expr_stmt(context, stmt, seek_name=None):
    with recursion.execution_allowed(context.evaluator, stmt) as allowed:
        # Here we allow list/set to recurse under certain conditions. To make
        # it possible to resolve stuff like list(set(list(x))), this is
        # necessary.
        if not allowed and context.get_root_context() == context.evaluator.builtins_module:
            try:
                instance = context.instance
            except AttributeError:
                pass
            else:
                if instance.name.string_name in ('list', 'set'):
                    c = instance.get_first_non_keyword_argument_contexts()
                    if instance not in c:
                        allowed = True

        if allowed:
            return _eval_expr_stmt(context, stmt, seek_name)
    return NO_CONTEXTS


</t>
<t tx="ekr.20180519065723.43">@debug.increase_indent
def _eval_expr_stmt(context, stmt, seek_name=None):
    """
    The starting point of the completion. A statement always owns a call
    list, which are the calls, that a statement does. In case multiple
    names are defined in the statement, `seek_name` returns the result for
    this name.

    :param stmt: A `tree.ExprStmt`.
    """
    debug.dbg('eval_expr_stmt %s (%s)', stmt, seek_name)
    rhs = stmt.get_rhs()
    context_set = context.eval_node(rhs)

    if seek_name:
        c_node = ContextualizedName(context, seek_name)
        context_set = check_tuple_assignments(context.evaluator, c_node, context_set)

    first_operator = next(stmt.yield_operators(), None)
    if first_operator not in ('=', None) and first_operator.type == 'operator':
        # `=` is always the last character in aug assignments -&gt; -1
        operator = copy.copy(first_operator)
        operator.value = operator.value[:-1]
        name = stmt.get_defined_names()[0].value
        left = context.py__getattribute__(
            name, position=stmt.start_pos, search_global=True)

        for_stmt = tree.search_ancestor(stmt, 'for_stmt')
        if for_stmt is not None and for_stmt.type == 'for_stmt' and context_set \
                and parser_utils.for_stmt_defines_one_name(for_stmt):
            # Iterate through result and add the values, that's possible
            # only in for loops without clutter, because they are
            # predictable. Also only do it, if the variable is not a tuple.
            node = for_stmt.get_testlist()
            cn = ContextualizedNode(context, node)
            ordered = list(cn.infer().iterate(cn))

            for lazy_context in ordered:
                dct = {for_stmt.children[1].value: lazy_context.infer()}
                with helpers.predefine_names(context, for_stmt, dct):
                    t = context.eval_node(rhs)
                    left = _eval_comparison(context.evaluator, context, left, operator, t)
            context_set = left
        else:
            context_set = _eval_comparison(context.evaluator, context, left, operator, context_set)
    debug.dbg('eval_expr_stmt result %s', context_set)
    return context_set


</t>
<t tx="ekr.20180519065723.44">def eval_or_test(context, or_test):
    iterator = iter(or_test.children)
    types = context.eval_node(next(iterator))
    for operator in iterator:
        right = next(iterator)
        if operator.type == 'comp_op':  # not in / is not
            operator = ' '.join(c.value for c in operator.children)

        # handle lazy evaluation of and/or here.
        if operator in ('and', 'or'):
            left_bools = set(left.py__bool__() for left in types)
            if left_bools == {True}:
                if operator == 'and':
                    types = context.eval_node(right)
            elif left_bools == {False}:
                if operator != 'and':
                    types = context.eval_node(right)
            # Otherwise continue, because of uncertainty.
        else:
            types = _eval_comparison(context.evaluator, context, types, operator,
                                     context.eval_node(right))
    debug.dbg('eval_or_test types %s', types)
    return types


</t>
<t tx="ekr.20180519065723.45">@iterator_to_context_set
def eval_factor(context_set, operator):
    """
    Calculates `+`, `-`, `~` and `not` prefixes.
    """
    for context in context_set:
        if operator == '-':
            if is_number(context):
                yield context.negate()
        elif operator == 'not':
            value = context.py__bool__()
            if value is None:  # Uncertainty.
                return
            yield compiled.create_simple_object(context.evaluator, not value)
        else:
            yield context


</t>
<t tx="ekr.20180519065723.46">def _literals_to_types(evaluator, result):
    # Changes literals ('a', 1, 1.0, etc) to its type instances (str(),
    # int(), float(), etc).
    new_result = NO_CONTEXTS
    for typ in result:
        if is_literal(typ):
            # Literals are only valid as long as the operations are
            # correct. Otherwise add a value-free instance.
            cls = compiled.builtin_from_name(evaluator, typ.name.string_name)
            new_result |= cls.execute_evaluated()
        else:
            new_result |= ContextSet(typ)
    return new_result


</t>
<t tx="ekr.20180519065723.47">def _eval_comparison(evaluator, context, left_contexts, operator, right_contexts):
    if not left_contexts or not right_contexts:
        # illegal slices e.g. cause left/right_result to be None
        result = (left_contexts or NO_CONTEXTS) | (right_contexts or NO_CONTEXTS)
        return _literals_to_types(evaluator, result)
    else:
        # I don't think there's a reasonable chance that a string
        # operation is still correct, once we pass something like six
        # objects.
        if len(left_contexts) * len(right_contexts) &gt; 6:
            return _literals_to_types(evaluator, left_contexts | right_contexts)
        else:
            return ContextSet.from_sets(
                _eval_comparison_part(evaluator, context, left, operator, right)
                for left in left_contexts
                for right in right_contexts
            )


</t>
<t tx="ekr.20180519065723.48">def _is_tuple(context):
    return isinstance(context, iterable.Sequence) and context.array_type == 'tuple'


</t>
<t tx="ekr.20180519065723.49">def _is_list(context):
    return isinstance(context, iterable.Sequence) and context.array_type == 'list'


</t>
<t tx="ekr.20180519065723.5">def find_type_from_comment_hint_for(context, node, name):
    return _find_type_from_comment_hint(context, node, node.children[1], name)


</t>
<t tx="ekr.20180519065723.50">def _bool_to_context(evaluator, bool_):
    return compiled.builtin_from_name(evaluator, force_unicode(str(bool_)))


</t>
<t tx="ekr.20180519065723.51">def _eval_comparison_part(evaluator, context, left, operator, right):
    l_is_num = is_number(left)
    r_is_num = is_number(right)
    if isinstance(operator, unicode):
        str_operator = operator
    else:
        str_operator = force_unicode(str(operator.value))

    if str_operator == '*':
        # for iterables, ignore * operations
        if isinstance(left, iterable.Sequence) or is_string(left):
            return ContextSet(left)
        elif isinstance(right, iterable.Sequence) or is_string(right):
            return ContextSet(right)
    elif str_operator == '+':
        if l_is_num and r_is_num or is_string(left) and is_string(right):
            return ContextSet(left.execute_operation(right, str_operator))
        elif _is_tuple(left) and _is_tuple(right) or _is_list(left) and _is_list(right):
            return ContextSet(iterable.MergedArray(evaluator, (left, right)))
    elif str_operator == '-':
        if l_is_num and r_is_num:
            return ContextSet(left.execute_operation(right, str_operator))
    elif str_operator == '%':
        # With strings and numbers the left type typically remains. Except for
        # `int() % float()`.
        return ContextSet(left)
    elif str_operator in COMPARISON_OPERATORS:
        if is_compiled(left) and is_compiled(right):
            # Possible, because the return is not an option. Just compare.
            try:
                return ContextSet(left.execute_operation(right, str_operator))
            except TypeError:
                # Could be True or False.
                pass
        else:
            if str_operator in ('is', '!=', '==', 'is not'):
                operation = COMPARISON_OPERATORS[str_operator]
                bool_ = operation(left, right)
                return ContextSet(_bool_to_context(evaluator, bool_))

        return ContextSet(_bool_to_context(evaluator, True), _bool_to_context(evaluator, False))
    elif str_operator == 'in':
        return NO_CONTEXTS

    def check(obj):
        """Checks if a Jedi object is either a float or an int."""
        return isinstance(obj, CompiledInstance) and \
            obj.name.string_name in ('int', 'float')

    # Static analysis, one is a number, the other one is not.
    if str_operator in ('+', '-') and l_is_num != r_is_num \
            and not (check(left) or check(right)):
        message = "TypeError: unsupported operand type(s) for +: %s and %s"
        analysis.add(context, 'type-error-operation', operator,
                     message % (left, right))

    return ContextSet(left, right)


</t>
<t tx="ekr.20180519065723.52">def _remove_statements(evaluator, context, stmt, name):
    """
    This is the part where statements are being stripped.

    Due to lazy evaluation, statements like a = func; b = a; b() have to be
    evaluated.
    """
    pep0484_contexts = \
        pep0484.find_type_from_comment_hint_assign(context, stmt, name)
    if pep0484_contexts:
        return pep0484_contexts

    return eval_expr_stmt(context, stmt, seek_name=name)


</t>
<t tx="ekr.20180519065723.53">def tree_name_to_contexts(evaluator, context, tree_name):

    context_set = ContextSet()
    module_node = context.get_root_context().tree_node
    if module_node is not None:
        names = module_node.get_used_names().get(tree_name.value, [])
        for name in names:
            expr_stmt = name.parent

            correct_scope = parser_utils.get_parent_scope(name) == context.tree_node

            if expr_stmt.type == "expr_stmt" and expr_stmt.children[1].type == "annassign" and correct_scope:
                context_set |= _evaluate_for_annotation(context, expr_stmt.children[1].children[1])

    if context_set:
        return context_set

    types = []
    node = tree_name.get_definition(import_name_always=True)
    if node is None:
        node = tree_name.parent
        if node.type == 'global_stmt':
            context = evaluator.create_context(context, tree_name)
            finder = NameFinder(evaluator, context, context, tree_name.value)
            filters = finder.get_filters(search_global=True)
            # For global_stmt lookups, we only need the first possible scope,
            # which means the function itself.
            filters = [next(filters)]
            return finder.find(filters, attribute_lookup=False)
        elif node.type not in ('import_from', 'import_name'):
            raise ValueError("Should not happen. type: %s", node.type)

    typ = node.type
    if typ == 'for_stmt':
        types = pep0484.find_type_from_comment_hint_for(context, node, tree_name)
        if types:
            return types
    if typ == 'with_stmt':
        types = pep0484.find_type_from_comment_hint_with(context, node, tree_name)
        if types:
            return types

    if typ in ('for_stmt', 'comp_for'):
        try:
            types = context.predefined_names[node][tree_name.value]
        except KeyError:
            cn = ContextualizedNode(context, node.children[3])
            for_types = iterate_contexts(
                cn.infer(),
                contextualized_node=cn,
                is_async=node.parent.type == 'async_stmt',
            )
            c_node = ContextualizedName(context, tree_name)
            types = check_tuple_assignments(evaluator, c_node, for_types)
    elif typ == 'expr_stmt':
        types = _remove_statements(evaluator, context, node, tree_name)
    elif typ == 'with_stmt':
        context_managers = context.eval_node(node.get_test_node_from_name(tree_name))
        enter_methods = context_managers.py__getattribute__(u'__enter__')
        return enter_methods.execute_evaluated()
    elif typ in ('import_from', 'import_name'):
        types = imports.infer_import(context, tree_name)
    elif typ in ('funcdef', 'classdef'):
        types = _apply_decorators(context, node)
    elif typ == 'try_stmt':
        # TODO an exception can also be a tuple. Check for those.
        # TODO check for types that are not classes and add it to
        # the static analysis report.
        exceptions = context.eval_node(tree_name.get_previous_sibling().get_previous_sibling())
        types = exceptions.execute_evaluated()
    else:
        raise ValueError("Should not happen. type: %s" % typ)
    return types


</t>
<t tx="ekr.20180519065723.54">def _apply_decorators(context, node):
    """
    Returns the function, that should to be executed in the end.
    This is also the places where the decorators are processed.
    """
    if node.type == 'classdef':
        decoratee_context = ClassContext(
            context.evaluator,
            parent_context=context,
            classdef=node
        )
    else:
        decoratee_context = FunctionContext(
            context.evaluator,
            parent_context=context,
            funcdef=node
        )
    initial = values = ContextSet(decoratee_context)
    for dec in reversed(node.get_decorators()):
        debug.dbg('decorator: %s %s', dec, values)
        dec_values = context.eval_node(dec.children[1])
        trailer_nodes = dec.children[2:-1]
        if trailer_nodes:
            # Create a trailer and evaluate it.
            trailer = tree.PythonNode('trailer', trailer_nodes)
            trailer.parent = dec
            dec_values = eval_trailer(context, dec_values, trailer)

        if not len(dec_values):
            debug.warning('decorator not found: %s on %s', dec, node)
            return initial

        values = dec_values.execute(arguments.ValuesArguments([values]))
        if not len(values):
            debug.warning('not possible to resolve wrappers found %s', node)
            return initial

        debug.dbg('decorator end %s', values)
    return values


</t>
<t tx="ekr.20180519065723.55">def check_tuple_assignments(evaluator, contextualized_name, context_set):
    """
    Checks if tuples are assigned.
    """
    lazy_context = None
    for index, node in contextualized_name.assignment_indexes():
        cn = ContextualizedNode(contextualized_name.context, node)
        iterated = context_set.iterate(cn)
        for _ in range(index + 1):
            try:
                lazy_context = next(iterated)
            except StopIteration:
                # We could do this with the default param in next. But this
                # would allow this loop to run for a very long time if the
                # index number is high. Therefore break if the loop is
                # finished.
                return ContextSet()
        context_set = lazy_context.infer()
    return context_set


</t>
<t tx="ekr.20180519065723.56">def eval_subscript_list(evaluator, context, index):
    """
    Handles slices in subscript nodes.
    """
    if index == ':':
        # Like array[:]
        return ContextSet(iterable.Slice(context, None, None, None))

    elif index.type == 'subscript' and not index.children[0] == '.':
        # subscript basically implies a slice operation, except for Python 2's
        # Ellipsis.
        # e.g. array[:3]
        result = []
        for el in index.children:
            if el == ':':
                if not result:
                    result.append(None)
            elif el.type == 'sliceop':
                if len(el.children) == 2:
                    result.append(el.children[1])
            else:
                result.append(el)
        result += [None] * (3 - len(result))

        return ContextSet(iterable.Slice(context, *result))
    elif index.type == 'subscriptlist':
        return NO_CONTEXTS

    # No slices
    return context.eval_node(index)
</t>
<t tx="ekr.20180519065723.57">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065723.58">import os

from jedi._compatibility import unicode, force_unicode, all_suffixes
from jedi.evaluate.cache import evaluator_method_cache
from jedi.evaluate.base_context import ContextualizedNode
from jedi.evaluate.helpers import is_string
from jedi.common.utils import traverse_parents
from jedi.parser_utils import get_cached_code_lines
from jedi import settings
from jedi import debug


</t>
<t tx="ekr.20180519065723.59">def _abs_path(module_context, path):
    if os.path.isabs(path):
        return path

    module_path = module_context.py__file__()
    if module_path is None:
        # In this case we have no idea where we actually are in the file
        # system.
        return None

    base_dir = os.path.dirname(module_path)
    path = force_unicode(path)
    return os.path.abspath(os.path.join(base_dir, path))


</t>
<t tx="ekr.20180519065723.6">def find_type_from_comment_hint_with(context, node, name):
    assert len(node.children[1].children) == 3, \
        "Can only be here when children[1] is 'foo() as f'"
    varlist = node.children[1].children[2]
    return _find_type_from_comment_hint(context, node, varlist, name)


</t>
<t tx="ekr.20180519065723.60">def _paths_from_assignment(module_context, expr_stmt):
    """
    Extracts the assigned strings from an assignment that looks as follows::

        sys.path[0:0] = ['module/path', 'another/module/path']

    This function is in general pretty tolerant (and therefore 'buggy').
    However, it's not a big issue usually to add more paths to Jedi's sys_path,
    because it will only affect Jedi in very random situations and by adding
    more paths than necessary, it usually benefits the general user.
    """
    for assignee, operator in zip(expr_stmt.children[::2], expr_stmt.children[1::2]):
        try:
            assert operator in ['=', '+=']
            assert assignee.type in ('power', 'atom_expr') and \
                len(assignee.children) &gt; 1
            c = assignee.children
            assert c[0].type == 'name' and c[0].value == 'sys'
            trailer = c[1]
            assert trailer.children[0] == '.' and trailer.children[1].value == 'path'
            # TODO Essentially we're not checking details on sys.path
            # manipulation. Both assigment of the sys.path and changing/adding
            # parts of the sys.path are the same: They get added to the end of
            # the current sys.path.
            """
            execution = c[2]
            assert execution.children[0] == '['
            subscript = execution.children[1]
            assert subscript.type == 'subscript'
            assert ':' in subscript.children
            """
        except AssertionError:
            continue

        cn = ContextualizedNode(module_context.create_context(expr_stmt), expr_stmt)
        for lazy_context in cn.infer().iterate(cn):
            for context in lazy_context.infer():
                if is_string(context):
                    abs_path = _abs_path(module_context, context.get_safe_value())
                    if abs_path is not None:
                        yield abs_path


</t>
<t tx="ekr.20180519065723.61">def _paths_from_list_modifications(module_context, trailer1, trailer2):
    """ extract the path from either "sys.path.append" or "sys.path.insert" """
    # Guarantee that both are trailers, the first one a name and the second one
    # a function execution with at least one param.
    if not (trailer1.type == 'trailer' and trailer1.children[0] == '.'
            and trailer2.type == 'trailer' and trailer2.children[0] == '('
            and len(trailer2.children) == 3):
        return

    name = trailer1.children[1].value
    if name not in ['insert', 'append']:
        return
    arg = trailer2.children[1]
    if name == 'insert' and len(arg.children) in (3, 4):  # Possible trailing comma.
        arg = arg.children[2]

    for context in module_context.create_context(arg).eval_node(arg):
        if is_string(context):
            abs_path = _abs_path(module_context, context.get_safe_value())
            if abs_path is not None:
                yield abs_path


</t>
<t tx="ekr.20180519065723.62">@evaluator_method_cache(default=[])
def check_sys_path_modifications(module_context):
    """
    Detect sys.path modifications within module.
    """
    def get_sys_path_powers(names):
        for name in names:
            power = name.parent.parent
            if power.type in ('power', 'atom_expr'):
                c = power.children
                if c[0].type == 'name' and c[0].value == 'sys' \
                        and c[1].type == 'trailer':
                    n = c[1].children[1]
                    if n.type == 'name' and n.value == 'path':
                        yield name, power

    if module_context.tree_node is None:
        return []

    added = []
    try:
        possible_names = module_context.tree_node.get_used_names()['path']
    except KeyError:
        pass
    else:
        for name, power in get_sys_path_powers(possible_names):
            expr_stmt = power.parent
            if len(power.children) &gt;= 4:
                added.extend(
                    _paths_from_list_modifications(
                        module_context, *power.children[2:4]
                    )
                )
            elif expr_stmt is not None and expr_stmt.type == 'expr_stmt':
                added.extend(_paths_from_assignment(module_context, expr_stmt))
    return added


</t>
<t tx="ekr.20180519065723.63">def discover_buildout_paths(evaluator, script_path):
    buildout_script_paths = set()

    for buildout_script_path in _get_buildout_script_paths(script_path):
        for path in _get_paths_from_buildout_script(evaluator, buildout_script_path):
            buildout_script_paths.add(path)

    return buildout_script_paths


</t>
<t tx="ekr.20180519065723.64">def _get_paths_from_buildout_script(evaluator, buildout_script_path):
    try:
        module_node = evaluator.parse(
            path=buildout_script_path,
            cache=True,
            cache_path=settings.cache_directory
        )
    except IOError:
        debug.warning('Error trying to read buildout_script: %s', buildout_script_path)
        return

    from jedi.evaluate.context import ModuleContext
    module = ModuleContext(
        evaluator, module_node, buildout_script_path,
        code_lines=get_cached_code_lines(evaluator.grammar, buildout_script_path),
    )
    for path in check_sys_path_modifications(module):
        yield path


</t>
<t tx="ekr.20180519065723.65">def _get_parent_dir_with_file(path, filename):
    for parent in traverse_parents(path):
        if os.path.isfile(os.path.join(parent, filename)):
            return parent
    return None


</t>
<t tx="ekr.20180519065723.66">def _get_buildout_script_paths(search_path):
    """
    if there is a 'buildout.cfg' file in one of the parent directories of the
    given module it will return a list of all files in the buildout bin
    directory that look like python files.

    :param search_path: absolute path to the module.
    :type search_path: str
    """
    project_root = _get_parent_dir_with_file(search_path, 'buildout.cfg')
    if not project_root:
        return
    bin_path = os.path.join(project_root, 'bin')
    if not os.path.exists(bin_path):
        return

    for filename in os.listdir(bin_path):
        try:
            filepath = os.path.join(bin_path, filename)
            with open(filepath, 'r') as f:
                firstline = f.readline()
                if firstline.startswith('#!') and 'python' in firstline:
                    yield filepath
        except (UnicodeDecodeError, IOError) as e:
            # Probably a binary file; permission error or race cond. because
            # file got deleted. Ignore it.
            debug.warning(unicode(e))
            continue


</t>
<t tx="ekr.20180519065723.67">def dotted_path_in_sys_path(sys_path, module_path):
    """
    Returns the dotted path inside a sys.path.
    """
    # First remove the suffix.
    for suffix in all_suffixes():
        if module_path.endswith(suffix):
            module_path = module_path[:-len(suffix)]
        break
    else:
        # There should always be a suffix in a valid Python file on the path.
        return None

    if module_path.startswith(os.path.sep):
        # The paths in sys.path most of the times don't end with a slash.
        module_path = module_path[1:]

    for p in sys_path:
        if module_path.startswith(p):
            rest = module_path[len(p):]
            if rest:
                split = rest.split(os.path.sep)
                for string in split:
                    if not string or '.' in string:
                        return None
                return '.'.join(split)

    return None
</t>
<t tx="ekr.20180519065723.68">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065723.69">from jedi.evaluate import imports
from jedi.evaluate.filters import TreeNameDefinition
from jedi.evaluate.context import ModuleContext


</t>
<t tx="ekr.20180519065723.7">def find_type_from_comment_hint_assign(context, node, name):
    return _find_type_from_comment_hint(context, node, node.children[0], name)


</t>
<t tx="ekr.20180519065723.70">def _resolve_names(definition_names, avoid_names=()):
    for name in definition_names:
        if name in avoid_names:
            # Avoiding recursions here, because goto on a module name lands
            # on the same module.
            continue

        if not isinstance(name, imports.SubModuleName):
            # SubModuleNames are not actually existing names but created
            # names when importing something like `import foo.bar.baz`.
            yield name

        if name.api_type == 'module':
            for name in _resolve_names(name.goto(), definition_names):
                yield name


</t>
<t tx="ekr.20180519065723.71">def _dictionarize(names):
    return dict(
        (n if n.tree_name is None else n.tree_name, n)
        for n in names
    )


</t>
<t tx="ekr.20180519065723.72">def _find_names(module_context, tree_name):
    context = module_context.create_context(tree_name)
    name = TreeNameDefinition(context, tree_name)
    found_names = set(name.goto())
    found_names.add(name)
    return _dictionarize(_resolve_names(found_names))


</t>
<t tx="ekr.20180519065723.73">def usages(module_context, tree_name):
    search_name = tree_name.value
    found_names = _find_names(module_context, tree_name)
    modules = set(d.get_root_context() for d in found_names.values())
    modules = set(m for m in modules if isinstance(m, ModuleContext))

    non_matching_usage_maps = {}
    for m in imports.get_modules_containing_name(module_context.evaluator, modules, search_name):
        for name_leaf in m.tree_node.get_used_names().get(search_name, []):
            new = _find_names(m, name_leaf)
            if any(tree_name in found_names for tree_name in new):
                found_names.update(new)
                for tree_name in new:
                    for dct in non_matching_usage_maps.get(tree_name, []):
                        # A usage that was previously searched for matches with
                        # a now found name. Merge.
                        found_names.update(dct)
                    try:
                        del non_matching_usage_maps[tree_name]
                    except KeyError:
                        pass
            else:
                for name in new:
                    non_matching_usage_maps.setdefault(name, []).append(new)
    return found_names.values()
</t>
<t tx="ekr.20180519065723.74">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065723.75">""" A universal module with functions / classes without dependencies. """
import sys
import contextlib
import functools
import re
import os

from jedi._compatibility import reraise


_sep = os.path.sep
if os.path.altsep is not None:
    _sep += os.path.altsep
_path_re = re.compile('(?:\.[^{0}]+|[{0}]__init__\.py)$'.format(re.escape(_sep)))
del _sep


</t>
<t tx="ekr.20180519065723.76">def to_list(func):
    def wrapper(*args, **kwargs):
        return list(func(*args, **kwargs))
    return wrapper


</t>
<t tx="ekr.20180519065723.77">def unite(iterable):
    """Turns a two dimensional array into a one dimensional."""
    return set(typ for types in iterable for typ in types)


</t>
<t tx="ekr.20180519065723.78">class UncaughtAttributeError(Exception):
    """
    Important, because `__getattr__` and `hasattr` catch AttributeErrors
    implicitly. This is really evil (mainly because of `__getattr__`).
    `hasattr` in Python 2 is even more evil, because it catches ALL exceptions.
    Therefore this class originally had to be derived from `BaseException`
    instead of `Exception`.  But because I removed relevant `hasattr` from
    the code base, we can now switch back to `Exception`.

    :param base: return values of sys.exc_info().
    """


</t>
<t tx="ekr.20180519065723.79">def safe_property(func):
    return property(reraise_uncaught(func))


</t>
<t tx="ekr.20180519065723.8">def _find_type_from_comment_hint(context, node, varlist, name):
    index = None
    if varlist.type in ("testlist_star_expr", "exprlist", "testlist"):
        # something like "a, b = 1, 2"
        index = 0
        for child in varlist.children:
            if child == name:
                break
            if child.type == "operator":
                continue
            index += 1
        else:
            return []

    comment = parser_utils.get_following_comment_same_line(node)
    if comment is None:
        return []
    match = re.match(r"^#\s*type:\s*([^#]*)", comment)
    if match is None:
        return []
    return _evaluate_annotation_string(context, match.group(1).strip(), index)
</t>
<t tx="ekr.20180519065723.80">def reraise_uncaught(func):
    """
    Re-throw uncaught `AttributeError`.

    Usage:  Put ``@rethrow_uncaught`` in front of the function
    which does **not** suppose to raise `AttributeError`.

    AttributeError is easily get caught by `hasattr` and another
    ``except AttributeError`` clause.  This becomes problem when you use
    a lot of "dynamic" attributes (e.g., using ``@property``) because you
    can't distinguish if the property does not exist for real or some code
    inside of the "dynamic" attribute through that error.  In a well
    written code, such error should not exist but getting there is very
    difficult.  This decorator is to help us getting there by changing
    `AttributeError` to `UncaughtAttributeError` to avoid unexpected catch.
    This helps us noticing bugs earlier and facilitates debugging.

    .. note:: Treating StopIteration here is easy.
              Add that feature when needed.
    """
    @functools.wraps(func)
    def wrapper(*args, **kwds):
        try:
            return func(*args, **kwds)
        except AttributeError:
            exc_info = sys.exc_info()
            reraise(UncaughtAttributeError(exc_info[1]), exc_info[2])
    return wrapper


</t>
<t tx="ekr.20180519065723.81">class PushBackIterator(object):
@others
</t>
<t tx="ekr.20180519065723.82">    def __init__(self, iterator):
        self.pushes = []
        self.iterator = iterator
        self.current = None

</t>
<t tx="ekr.20180519065723.83">    def push_back(self, value):
        self.pushes.append(value)

</t>
<t tx="ekr.20180519065723.84">    def __iter__(self):
        return self

</t>
<t tx="ekr.20180519065723.85">    def next(self):
        """ Python 2 Compatibility """
        return self.__next__()

</t>
<t tx="ekr.20180519065723.86">    def __next__(self):
        if self.pushes:
            self.current = self.pushes.pop()
        else:
            self.current = next(self.iterator)
        return self.current


</t>
<t tx="ekr.20180519065723.87">@contextlib.contextmanager
def ignored(*exceptions):
    """
    Context manager that ignores all of the specified exceptions. This will
    be in the standard library starting with Python 3.4.
    """
    try:
        yield
    except exceptions:
        pass


</t>
<t tx="ekr.20180519065723.88">def indent_block(text, indention='    '):
    """This function indents a text block with a default of four spaces."""
    temp = ''
    while text and text[-1] == '\n':
        temp += text[-1]
        text = text[:-1]
    lines = text.split('\n')
    return '\n'.join(map(lambda s: indention + s, lines)) + temp


</t>
<t tx="ekr.20180519065723.89">def dotted_from_fs_path(fs_path, sys_path):
    """
    Changes `/usr/lib/python3.4/email/utils.py` to `email.utils`.  I.e.
    compares the path with sys.path and then returns the dotted_path. If the
    path is not in the sys.path, just returns None.
    """
    if os.path.basename(fs_path).startswith('__init__.'):
        # We are calculating the path. __init__ files are not interesting.
        fs_path = os.path.dirname(fs_path)

    # prefer
    #   - UNIX
    #     /path/to/pythonX.Y/lib-dynload
    #     /path/to/pythonX.Y/site-packages
    #   - Windows
    #     C:\path\to\DLLs
    #     C:\path\to\Lib\site-packages
    # over
    #   - UNIX
    #     /path/to/pythonX.Y
    #   - Windows
    #     C:\path\to\Lib
    path = ''
    for s in sys_path:
        if (fs_path.startswith(s) and len(path) &lt; len(s)):
            path = s

    # - Window
    # X:\path\to\lib-dynload/datetime.pyd =&gt; datetime
    module_path = fs_path[len(path):].lstrip(os.path.sep).lstrip('/')
    # - Window
    # Replace like X:\path\to\something/foo/bar.py
    return _path_re.sub('', module_path).replace(os.path.sep, '.').replace('/', '.')
</t>
<t tx="ekr.20180519065723.9">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065723.90">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065723.91">"""
Evaluation of Python code in |jedi| is based on three assumptions:

* The code uses as least side effects as possible. Jedi understands certain
  list/tuple/set modifications, but there's no guarantee that Jedi detects
  everything (list.append in different modules for example).
* No magic is being used:

  - metaclasses
  - ``setattr()`` / ``__import__()``
  - writing to ``globals()``, ``locals()``, ``object.__dict__``
* The programmer is not a total dick, e.g. like `this
  &lt;https://github.com/davidhalter/jedi/issues/24&gt;`_ :-)

The actual algorithm is based on a principle called lazy evaluation.  That
said, the typical entry point for static analysis is calling
``eval_expr_stmt``. There's separate logic for autocompletion in the API, the
evaluator is all about evaluating an expression.

TODO this paragraph is not what jedi does anymore, it's similar, but not the
same.

Now you need to understand what follows after ``eval_expr_stmt``. Let's
make an example::

    import datetime
    datetime.date.toda# &lt;-- cursor here

First of all, this module doesn't care about completion. It really just cares
about ``datetime.date``. At the end of the procedure ``eval_expr_stmt`` will
return the ``date`` class.

To *visualize* this (simplified):

- ``Evaluator.eval_expr_stmt`` doesn't do much, because there's no assignment.
- ``Context.eval_node`` cares for resolving the dotted path
- ``Evaluator.find_types`` searches for global definitions of datetime, which
  it finds in the definition of an import, by scanning the syntax tree.
- Using the import logic, the datetime module is found.
- Now ``find_types`` is called again by ``eval_node`` to find ``date``
  inside the datetime module.

Now what would happen if we wanted ``datetime.date.foo.bar``? Two more
calls to ``find_types``. However the second call would be ignored, because the
first one would return nothing (there's no foo attribute in ``date``).

What if the import would contain another ``ExprStmt`` like this::

    from foo import bar
    Date = bar.baz

Well... You get it. Just another ``eval_expr_stmt`` recursion. It's really
easy. Python can obviously get way more complicated then this. To understand
tuple assignments, list comprehensions and everything else, a lot more code had
to be written.

Jedi has been tested very well, so you can just start modifying code. It's best
to write your own test first for your "new" feature. Don't be scared of
breaking stuff. As long as the tests pass, you're most likely to be fine.

I need to mention now that lazy evaluation is really good because it
only *evaluates* what needs to be *evaluated*. All the statements and modules
that are not used are just being ignored.
"""

from parso.python import tree
import parso
from parso import python_bytes_to_unicode

from jedi import debug
from jedi import parser_utils
from jedi.evaluate.utils import unite
from jedi.evaluate import imports
from jedi.evaluate import recursion
from jedi.evaluate.cache import evaluator_function_cache
from jedi.evaluate import compiled
from jedi.evaluate import helpers
from jedi.evaluate.filters import TreeNameDefinition, ParamName
from jedi.evaluate.base_context import ContextualizedName, ContextualizedNode, \
    ContextSet, NO_CONTEXTS, iterate_contexts
from jedi.evaluate.context import ClassContext, FunctionContext, \
    AnonymousInstance, BoundMethod
from jedi.evaluate.context.iterable import CompForContext
from jedi.evaluate.syntax_tree import eval_trailer, eval_expr_stmt, \
    eval_node, check_tuple_assignments


</t>
<t tx="ekr.20180519065723.92">class Evaluator(object):
    @others
</t>
<t tx="ekr.20180519065723.93">def __init__(self, project, environment=None, script_path=None):
    if environment is None:
        environment = project.get_environment()
    self.environment = environment
    self.script_path = script_path
    self.compiled_subprocess = environment.get_evaluator_subprocess(self)
    self.grammar = environment.get_grammar()

    self.latest_grammar = parso.load_grammar(version='3.6')
    self.memoize_cache = {}  # for memoize decorators
    self.module_cache = imports.ModuleCache()  # does the job of `sys.modules`.
    self.compiled_cache = {}  # see `evaluate.compiled.create()`
    self.inferred_element_counts = {}
    self.mixed_cache = {}  # see `evaluate.compiled.mixed._create()`
    self.analysis = []
    self.dynamic_params_depth = 0
    self.is_analysis = False
    self.project = project
    self.access_cache = {}

    self.reset_recursion_limitations()
    self.allow_different_encoding = True

</t>
<t tx="ekr.20180519065723.94">@property
@evaluator_function_cache()
def builtins_module(self):
    return compiled.get_special_object(self, u'BUILTINS')

</t>
<t tx="ekr.20180519065723.95">def reset_recursion_limitations(self):
    self.recursion_detector = recursion.RecursionDetector()
    self.execution_recursion_detector = recursion.ExecutionRecursionDetector(self)

</t>
<t tx="ekr.20180519065723.96">def get_sys_path(self):
    """Convenience function"""
    return self.project._get_sys_path(self, environment=self.environment)

</t>
<t tx="ekr.20180519065723.97">def eval_element(self, context, element):
    if isinstance(context, CompForContext):
        return eval_node(context, element)

    if_stmt = element
    while if_stmt is not None:
        if_stmt = if_stmt.parent
        if if_stmt.type in ('if_stmt', 'for_stmt'):
            break
        if parser_utils.is_scope(if_stmt):
            if_stmt = None
            break
    predefined_if_name_dict = context.predefined_names.get(if_stmt)
    # TODO there's a lot of issues with this one. We actually should do
    # this in a different way. Caching should only be active in certain
    # cases and this all sucks.
    if predefined_if_name_dict is None and if_stmt \
            and if_stmt.type == 'if_stmt' and self.is_analysis:
        if_stmt_test = if_stmt.children[1]
        name_dicts = [{}]
        # If we already did a check, we don't want to do it again -&gt; If
        # context.predefined_names is filled, we stop.
        # We don't want to check the if stmt itself, it's just about
        # the content.
        if element.start_pos &gt; if_stmt_test.end_pos:
            # Now we need to check if the names in the if_stmt match the
            # names in the suite.
            if_names = helpers.get_names_of_node(if_stmt_test)
            element_names = helpers.get_names_of_node(element)
            str_element_names = [e.value for e in element_names]
            if any(i.value in str_element_names for i in if_names):
                for if_name in if_names:
                    definitions = self.goto_definitions(context, if_name)
                    # Every name that has multiple different definitions
                    # causes the complexity to rise. The complexity should
                    # never fall below 1.
                    if len(definitions) &gt; 1:
                        if len(name_dicts) * len(definitions) &gt; 16:
                            debug.dbg('Too many options for if branch evaluation %s.', if_stmt)
                            # There's only a certain amount of branches
                            # Jedi can evaluate, otherwise it will take to
                            # long.
                            name_dicts = [{}]
                            break

                        original_name_dicts = list(name_dicts)
                        name_dicts = []
                        for definition in definitions:
                            new_name_dicts = list(original_name_dicts)
                            for i, name_dict in enumerate(new_name_dicts):
                                new_name_dicts[i] = name_dict.copy()
                                new_name_dicts[i][if_name.value] = ContextSet(definition)

                            name_dicts += new_name_dicts
                    else:
                        for name_dict in name_dicts:
                            name_dict[if_name.value] = definitions
        if len(name_dicts) &gt; 1:
            result = ContextSet()
            for name_dict in name_dicts:
                with helpers.predefine_names(context, if_stmt, name_dict):
                    result |= eval_node(context, element)
            return result
        else:
            return self._eval_element_if_evaluated(context, element)
    else:
        if predefined_if_name_dict:
            return eval_node(context, element)
        else:
            return self._eval_element_if_evaluated(context, element)

</t>
<t tx="ekr.20180519065723.98">def _eval_element_if_evaluated(self, context, element):
    """
    TODO This function is temporary: Merge with eval_element.
    """
    parent = element
    while parent is not None:
        parent = parent.parent
        predefined_if_name_dict = context.predefined_names.get(parent)
        if predefined_if_name_dict is not None:
            return eval_node(context, element)
    return self._eval_element_cached(context, element)

</t>
<t tx="ekr.20180519065723.99">@evaluator_function_cache(default=NO_CONTEXTS)
def _eval_element_cached(self, context, element):
    return eval_node(context, element)

</t>
<t tx="ekr.20180519065724.1">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/compiled/subprocess/
@others
if sys.version_info &gt; (3, 4):
    from importlib.machinery import PathFinder

    class _ExactImporter(object):
        def __init__(self, path_dct):
            self._path_dct = path_dct

        def find_module(self, fullname, path=None):
            if path is None and fullname in self._path_dct:
                p = self._path_dct[fullname]
                loader = PathFinder.find_module(fullname, path=[p])
                return loader
            return None

    # Try to import jedi/parso.
    sys.meta_path.insert(0, _ExactImporter(_get_paths()))
    from jedi.evaluate.compiled import subprocess  # NOQA
    sys.meta_path.pop(0)
else:
    import imp

    def load(name):
        paths = list(_get_paths().values())
        fp, pathname, description = imp.find_module(name, paths)
        return imp.load_module(name, fp, pathname, description)

    load('parso')
    load('jedi')
    from jedi.evaluate.compiled import subprocess  # NOQA

# And finally start the client.
subprocess.Listener().listen()
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065724.10">@property
def name(self):
    return self.get_object().name

</t>
<t tx="ekr.20180519065724.100">class SelfAttributeFilter(InstanceClassFilter):
    """
    This class basically filters all the use cases where `self.*` was assigned.
    """
    name_class = SelfName

    @others
</t>
<t tx="ekr.20180519065724.101">def _filter(self, names):
    names = self._filter_self_names(names)
    if isinstance(self._parser_scope, compiled.CompiledObject) and False:
        # This would be for builtin skeletons, which are not yet supported.
        return list(names)
    else:
        start, end = self._parser_scope.start_pos, self._parser_scope.end_pos
        return [n for n in names if start &lt; n.start_pos &lt; end]

</t>
<t tx="ekr.20180519065724.102">def _filter_self_names(self, names):
    for name in names:
        trailer = name.parent
        if trailer.type == 'trailer' \
                and len(trailer.children) == 2 \
                and trailer.children[0] == '.':
            if name.is_definition() and self._access_possible(name):
                yield name

</t>
<t tx="ekr.20180519065724.103">def _check_flows(self, names):
    return names


</t>
<t tx="ekr.20180519065724.104">class InstanceVarArgs(AbstractArguments):
    @others
</t>
<t tx="ekr.20180519065724.105">def __init__(self, execution_context, var_args):
    self._execution_context = execution_context
    self._var_args = var_args

</t>
<t tx="ekr.20180519065724.106">@memoize_method
def _get_var_args(self):
    return self._var_args

</t>
<t tx="ekr.20180519065724.107">@property
def argument_node(self):
    return self._var_args.argument_node

</t>
<t tx="ekr.20180519065724.108">@property
def trailer(self):
    return self._var_args.trailer

</t>
<t tx="ekr.20180519065724.109">def unpack(self, func=None):
    yield None, LazyKnownContext(self._execution_context.instance)
    for values in self._get_var_args().unpack(func):
        yield values

</t>
<t tx="ekr.20180519065724.11">def __repr__(self):
    return "&lt;%s of %s&gt;" % (type(self).__name__, self.func_execution_context)


</t>
<t tx="ekr.20180519065724.110">def get_calling_nodes(self):
    return self._get_var_args().get_calling_nodes()
</t>
<t tx="ekr.20180519065724.111">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/context/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065724.112">"""
Contains all classes and functions to deal with lists, dicts, generators and
iterators in general.

Array modifications
*******************

If the content of an array (``set``/``list``) is requested somewhere, the
current module will be checked for appearances of ``arr.append``,
``arr.insert``, etc.  If the ``arr`` name points to an actual array, the
content will be added

This can be really cpu intensive, as you can imagine. Because |jedi| has to
follow **every** ``append`` and check wheter it's the right array. However this
works pretty good, because in *slow* cases, the recursion detector and other
settings will stop this process.

It is important to note that:

1. Array modfications work only in the current module.
2. Jedi only checks Array additions; ``list.pop``, etc are ignored.
"""
from jedi import debug
from jedi import settings
from jedi._compatibility import force_unicode, is_py3
from jedi.cache import memoize_method
from jedi.evaluate import compiled
from jedi.evaluate import analysis
from jedi.evaluate import recursion
from jedi.evaluate.lazy_context import LazyKnownContext, LazyKnownContexts, \
    LazyTreeContext
from jedi.evaluate.helpers import get_int_or_none, is_string, \
    predefine_names, evaluate_call_of_leaf
from jedi.evaluate.utils import safe_property
from jedi.evaluate.utils import to_list
from jedi.evaluate.cache import evaluator_method_cache
from jedi.evaluate.filters import ParserTreeFilter, BuiltinOverwrite, \
    publish_method
from jedi.evaluate.base_context import ContextSet, NO_CONTEXTS, Context, \
    TreeContext, ContextualizedNode
from jedi.parser_utils import get_comp_fors


</t>
<t tx="ekr.20180519065724.113">class IterableMixin(object):
    @others
</t>
<t tx="ekr.20180519065724.114">def py__stop_iteration_returns(self):
    return ContextSet(compiled.builtin_from_name(self.evaluator, u'None'))


</t>
<t tx="ekr.20180519065724.115">class GeneratorBase(BuiltinOverwrite, IterableMixin):
    array_type = None
    special_object_identifier = u'GENERATOR_OBJECT'

    @others
</t>
<t tx="ekr.20180519065724.116">@publish_method('send')
@publish_method('next', python_version_match=2)
@publish_method('__next__', python_version_match=3)
def py__next__(self):
    return ContextSet.from_sets(lazy_context.infer() for lazy_context in self.py__iter__())

</t>
<t tx="ekr.20180519065724.117">@property
def name(self):
    return compiled.CompiledContextName(self, 'generator')


</t>
<t tx="ekr.20180519065724.118">class Generator(GeneratorBase):
    """Handling of `yield` functions."""
    @others
</t>
<t tx="ekr.20180519065724.119">def __init__(self, evaluator, func_execution_context):
    super(Generator, self).__init__(evaluator)
    self._func_execution_context = func_execution_context

</t>
<t tx="ekr.20180519065724.12">class Coroutine(AsyncBase):
    special_object_identifier = u'COROUTINE'

    @others
</t>
<t tx="ekr.20180519065724.120">def py__iter__(self):
    return self._func_execution_context.get_yield_lazy_contexts()

</t>
<t tx="ekr.20180519065724.121">def py__stop_iteration_returns(self):
    return self._func_execution_context.get_return_values()

</t>
<t tx="ekr.20180519065724.122">def __repr__(self):
    return "&lt;%s of %s&gt;" % (type(self).__name__, self._func_execution_context)


</t>
<t tx="ekr.20180519065724.123">class CompForContext(TreeContext):
    @others
</t>
<t tx="ekr.20180519065724.124">@classmethod
def from_comp_for(cls, parent_context, comp_for):
    return cls(parent_context.evaluator, parent_context, comp_for)

</t>
<t tx="ekr.20180519065724.125">def __init__(self, evaluator, parent_context, comp_for):
    super(CompForContext, self).__init__(evaluator, parent_context)
    self.tree_node = comp_for

</t>
<t tx="ekr.20180519065724.126">def get_node(self):
    return self.tree_node

</t>
<t tx="ekr.20180519065724.127">def get_filters(self, search_global, until_position=None, origin_scope=None):
    yield ParserTreeFilter(self.evaluator, self)


</t>
<t tx="ekr.20180519065724.128">def comprehension_from_atom(evaluator, context, atom):
    bracket = atom.children[0]
    if bracket == '{':
        if atom.children[1].children[1] == ':':
            cls = DictComprehension
        else:
            cls = SetComprehension
    elif bracket == '(':
        cls = GeneratorComprehension
    elif bracket == '[':
        cls = ListComprehension
    return cls(evaluator, context, atom)


</t>
<t tx="ekr.20180519065724.129">class ComprehensionMixin(object):
    @others
</t>
<t tx="ekr.20180519065724.13">@publish_method('__await__')
def _await(self):
    return ContextSet(CoroutineWrapper(self.evaluator, self.func_execution_context))


</t>
<t tx="ekr.20180519065724.130">def __init__(self, evaluator, defining_context, atom):
    super(ComprehensionMixin, self).__init__(evaluator)
    self._defining_context = defining_context
    self._atom = atom

</t>
<t tx="ekr.20180519065724.131">def _get_comprehension(self):
    "return 'a for a in b'"
    # The atom contains a testlist_comp
    return self._atom.children[1]

</t>
<t tx="ekr.20180519065724.132">def _get_comp_for(self):
    "return CompFor('for a in b')"
    return self._get_comprehension().children[1]

</t>
<t tx="ekr.20180519065724.133">def _eval_node(self, index=0):
    """
    The first part `x + 1` of the list comprehension:

        [x + 1 for x in foo]
    """
    return self._get_comprehension().children[index]

</t>
<t tx="ekr.20180519065724.134">@evaluator_method_cache()
def _get_comp_for_context(self, parent_context, comp_for):
    # TODO shouldn't this be part of create_context?
    return CompForContext.from_comp_for(parent_context, comp_for)

</t>
<t tx="ekr.20180519065724.135">def _nested(self, comp_fors, parent_context=None):
    comp_for = comp_fors[0]

    is_async = 'async' == comp_for.children[comp_for.children.index('for') - 1]

    input_node = comp_for.children[comp_for.children.index('in') + 1]
    parent_context = parent_context or self._defining_context
    input_types = parent_context.eval_node(input_node)
    # TODO: simulate await if self.is_async

    cn = ContextualizedNode(parent_context, input_node)
    iterated = input_types.iterate(cn, is_async=is_async)
    exprlist = comp_for.children[comp_for.children.index('for') + 1]
    for i, lazy_context in enumerate(iterated):
        types = lazy_context.infer()
        dct = unpack_tuple_to_dict(parent_context, types, exprlist)
        context_ = self._get_comp_for_context(
            parent_context,
            comp_for,
        )
        with predefine_names(context_, comp_for, dct):
            try:
                for result in self._nested(comp_fors[1:], context_):
                    yield result
            except IndexError:
                iterated = context_.eval_node(self._eval_node())
                if self.array_type == 'dict':
                    yield iterated, context_.eval_node(self._eval_node(2))
                else:
                    yield iterated

</t>
<t tx="ekr.20180519065724.136">@evaluator_method_cache(default=[])
@to_list
def _iterate(self):
    comp_fors = tuple(get_comp_fors(self._get_comp_for()))
    for result in self._nested(comp_fors):
        yield result

</t>
<t tx="ekr.20180519065724.137">def py__iter__(self):
    for set_ in self._iterate():
        yield LazyKnownContexts(set_)

</t>
<t tx="ekr.20180519065724.138">def __repr__(self):
    return "&lt;%s of %s&gt;" % (type(self).__name__, self._atom)


</t>
<t tx="ekr.20180519065724.139">class Sequence(BuiltinOverwrite, IterableMixin):
    api_type = u'instance'

    @others
</t>
<t tx="ekr.20180519065724.14">class CoroutineWrapper(AsyncBase):
    special_object_identifier = u'COROUTINE_WRAPPER'

    @others
</t>
<t tx="ekr.20180519065724.140">@property
def name(self):
    return compiled.CompiledContextName(self, self.array_type)

</t>
<t tx="ekr.20180519065724.141">@memoize_method
def get_object(self):
    compiled_obj = compiled.builtin_from_name(self.evaluator, self.array_type)
    only_obj, = compiled_obj.execute_evaluated(self)
    return only_obj

</t>
<t tx="ekr.20180519065724.142">def py__bool__(self):
    return None  # We don't know the length, because of appends.

</t>
<t tx="ekr.20180519065724.143">def py__class__(self):
    return compiled.builtin_from_name(self.evaluator, self.array_type)

</t>
<t tx="ekr.20180519065724.144">@safe_property
def parent(self):
    return self.evaluator.builtins_module

</t>
<t tx="ekr.20180519065724.145">def dict_values(self):
    return ContextSet.from_sets(
        self._defining_context.eval_node(v)
        for k, v in self._items()
    )


</t>
<t tx="ekr.20180519065724.146">class ListComprehension(ComprehensionMixin, Sequence):
    array_type = u'list'

    @others
</t>
<t tx="ekr.20180519065724.147">def py__getitem__(self, index):
    if isinstance(index, slice):
        return ContextSet(self)

    all_types = list(self.py__iter__())
    return all_types[index].infer()


</t>
<t tx="ekr.20180519065724.148">class SetComprehension(ComprehensionMixin, Sequence):
    array_type = u'set'


</t>
<t tx="ekr.20180519065724.149">class DictComprehension(ComprehensionMixin, Sequence):
    array_type = u'dict'

    @others
</t>
<t tx="ekr.20180519065724.15">def py__stop_iteration_returns(self):
    return self.func_execution_context.get_return_values()


</t>
<t tx="ekr.20180519065724.150">def _get_comp_for(self):
    return self._get_comprehension().children[3]

</t>
<t tx="ekr.20180519065724.151">def py__iter__(self):
    for keys, values in self._iterate():
        yield LazyKnownContexts(keys)

</t>
<t tx="ekr.20180519065724.152">def py__getitem__(self, index):
    for keys, values in self._iterate():
        for k in keys:
            if isinstance(k, compiled.CompiledObject):
                if k.get_safe_value(default=object()) == index:
                    return values
    return self.dict_values()

</t>
<t tx="ekr.20180519065724.153">def dict_values(self):
    return ContextSet.from_sets(values for keys, values in self._iterate())

</t>
<t tx="ekr.20180519065724.154">@publish_method('values')
def _imitate_values(self):
    lazy_context = LazyKnownContexts(self.dict_values())
    return ContextSet(FakeSequence(self.evaluator, u'list', [lazy_context]))

</t>
<t tx="ekr.20180519065724.155">@publish_method('items')
def _imitate_items(self):
    items = ContextSet.from_iterable(
        FakeSequence(
            self.evaluator, u'tuple'
            (LazyKnownContexts(keys), LazyKnownContexts(values))
        ) for keys, values in self._iterate()
    )

    return create_evaluated_sequence_set(self.evaluator, items, sequence_type=u'list')


</t>
<t tx="ekr.20180519065724.156">class GeneratorComprehension(ComprehensionMixin, GeneratorBase):
    pass


</t>
<t tx="ekr.20180519065724.157">class SequenceLiteralContext(Sequence):
    mapping = {'(': u'tuple',
               '[': u'list',
               '{': u'set'}

    @others
</t>
<t tx="ekr.20180519065724.158">def __init__(self, evaluator, defining_context, atom):
    super(SequenceLiteralContext, self).__init__(evaluator)
    self.atom = atom
    self._defining_context = defining_context

    if self.atom.type in ('testlist_star_expr', 'testlist'):
        self.array_type = u'tuple'
    else:
        self.array_type = SequenceLiteralContext.mapping[atom.children[0]]
        """The builtin name of the array (list, set, tuple or dict)."""

</t>
<t tx="ekr.20180519065724.159">def py__getitem__(self, index):
    """Here the index is an int/str. Raises IndexError/KeyError."""
    if self.array_type == u'dict':
        compiled_obj_index = compiled.create_simple_object(self.evaluator, index)
        for key, value in self._items():
            for k in self._defining_context.eval_node(key):
                if isinstance(k, compiled.CompiledObject) \
                        and k.execute_operation(compiled_obj_index, u'==').get_safe_value():
                    return self._defining_context.eval_node(value)
        raise KeyError('No key found in dictionary %s.' % self)

    # Can raise an IndexError
    if isinstance(index, slice):
        return ContextSet(self)
    else:
        return self._defining_context.eval_node(self._items()[index])

</t>
<t tx="ekr.20180519065724.16">class AsyncGenerator(AsyncBase):
    """Handling of `yield` functions."""
    special_object_identifier = u'ASYNC_GENERATOR'

    @others
</t>
<t tx="ekr.20180519065724.160">def py__iter__(self):
    """
    While values returns the possible values for any array field, this
    function returns the value for a certain index.
    """
    if self.array_type == u'dict':
        # Get keys.
        types = ContextSet()
        for k, _ in self._items():
            types |= self._defining_context.eval_node(k)
        # We don't know which dict index comes first, therefore always
        # yield all the types.
        for _ in types:
            yield LazyKnownContexts(types)
    else:
        for node in self._items():
            yield LazyTreeContext(self._defining_context, node)

        for addition in check_array_additions(self._defining_context, self):
            yield addition

</t>
<t tx="ekr.20180519065724.161">def _values(self):
    """Returns a list of a list of node."""
    if self.array_type == u'dict':
        return ContextSet.from_sets(v for k, v in self._items())
    else:
        return self._items()

</t>
<t tx="ekr.20180519065724.162">def _items(self):
    c = self.atom.children

    if self.atom.type in ('testlist_star_expr', 'testlist'):
        return c[::2]

    array_node = c[1]
    if array_node in (']', '}', ')'):
        return []  # Direct closing bracket, doesn't contain items.

    if array_node.type == 'testlist_comp':
        return array_node.children[::2]
    elif array_node.type == 'dictorsetmaker':
        kv = []
        iterator = iter(array_node.children)
        for key in iterator:
            op = next(iterator, None)
            if op is None or op == ',':
                kv.append(key)  # A set.
            else:
                assert op == ':'  # A dict.
                kv.append((key, next(iterator)))
                next(iterator, None)  # Possible comma.
        return kv
    else:
        return [array_node]

</t>
<t tx="ekr.20180519065724.163">def exact_key_items(self):
    """
    Returns a generator of tuples like dict.items(), where the key is
    resolved (as a string) and the values are still lazy contexts.
    """
    for key_node, value in self._items():
        for key in self._defining_context.eval_node(key_node):
            if is_string(key):
                yield key.get_safe_value(), LazyTreeContext(self._defining_context, value)

</t>
<t tx="ekr.20180519065724.164">def __repr__(self):
    return "&lt;%s of %s&gt;" % (self.__class__.__name__, self.atom)


</t>
<t tx="ekr.20180519065724.165">class DictLiteralContext(SequenceLiteralContext):
    array_type = u'dict'

    @others
</t>
<t tx="ekr.20180519065724.166">def __init__(self, evaluator, defining_context, atom):
    super(SequenceLiteralContext, self).__init__(evaluator)
    self._defining_context = defining_context
    self.atom = atom

</t>
<t tx="ekr.20180519065724.167">@publish_method('values')
def _imitate_values(self):
    lazy_context = LazyKnownContexts(self.dict_values())
    return ContextSet(FakeSequence(self.evaluator, u'list', [lazy_context]))

</t>
<t tx="ekr.20180519065724.168">@publish_method('items')
def _imitate_items(self):
    lazy_contexts = [
        LazyKnownContext(FakeSequence(
            self.evaluator, u'tuple',
            (LazyTreeContext(self._defining_context, key_node),
             LazyTreeContext(self._defining_context, value_node))
        )) for key_node, value_node in self._items()
    ]

    return ContextSet(FakeSequence(self.evaluator, u'list', lazy_contexts))


</t>
<t tx="ekr.20180519065724.169">class _FakeArray(SequenceLiteralContext):
    @others
</t>
<t tx="ekr.20180519065724.17">def py__aiter__(self):
    return self.func_execution_context.get_yield_lazy_contexts(is_async=True)
</t>
<t tx="ekr.20180519065724.170">def __init__(self, evaluator, container, type):
    super(SequenceLiteralContext, self).__init__(evaluator)
    self.array_type = type
    self.atom = container
    # TODO is this class really needed?


</t>
<t tx="ekr.20180519065724.171">class FakeSequence(_FakeArray):
    @others
</t>
<t tx="ekr.20180519065724.172">def __init__(self, evaluator, array_type, lazy_context_list):
    """
    type should be one of "tuple", "list"
    """
    super(FakeSequence, self).__init__(evaluator, None, array_type)
    self._lazy_context_list = lazy_context_list

</t>
<t tx="ekr.20180519065724.173">def py__getitem__(self, index):
    return self._lazy_context_list[index].infer()

</t>
<t tx="ekr.20180519065724.174">def py__iter__(self):
    return self._lazy_context_list

</t>
<t tx="ekr.20180519065724.175">def py__bool__(self):
    return bool(len(self._lazy_context_list))

</t>
<t tx="ekr.20180519065724.176">def __repr__(self):
    return "&lt;%s of %s&gt;" % (type(self).__name__, self._lazy_context_list)


</t>
<t tx="ekr.20180519065724.177">class FakeDict(_FakeArray):
    @others
</t>
<t tx="ekr.20180519065724.178">def __init__(self, evaluator, dct):
    super(FakeDict, self).__init__(evaluator, dct, u'dict')
    self._dct = dct

</t>
<t tx="ekr.20180519065724.179">def py__iter__(self):
    for key in self._dct:
        yield LazyKnownContext(compiled.create_simple_object(self.evaluator, key))

</t>
<t tx="ekr.20180519065724.18">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/context/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065724.180">def py__getitem__(self, index):
    if is_py3 and self.evaluator.environment.version_info.major == 2:
        # In Python 2 bytes and unicode compare.
        if isinstance(index, bytes):
            index_unicode = force_unicode(index)
            try:
                return self._dct[index_unicode].infer()
            except KeyError:
                pass
        elif isinstance(index, str):
            index_bytes = index.encode('utf-8')
            try:
                return self._dct[index_bytes].infer()
            except KeyError:
                pass

    return self._dct[index].infer()

</t>
<t tx="ekr.20180519065724.181">@publish_method('values')
def _values(self):
    return ContextSet(FakeSequence(
        self.evaluator, u'tuple',
        [LazyKnownContexts(self.dict_values())]
    ))

</t>
<t tx="ekr.20180519065724.182">def dict_values(self):
    return ContextSet.from_sets(lazy_context.infer() for lazy_context in self._dct.values())

</t>
<t tx="ekr.20180519065724.183">def exact_key_items(self):
    return self._dct.items()


</t>
<t tx="ekr.20180519065724.184">class MergedArray(_FakeArray):
    @others
</t>
<t tx="ekr.20180519065724.185">def __init__(self, evaluator, arrays):
    super(MergedArray, self).__init__(evaluator, arrays, arrays[-1].array_type)
    self._arrays = arrays

</t>
<t tx="ekr.20180519065724.186">def py__iter__(self):
    for array in self._arrays:
        for lazy_context in array.py__iter__():
            yield lazy_context

</t>
<t tx="ekr.20180519065724.187">def py__getitem__(self, index):
    return ContextSet.from_sets(lazy_context.infer() for lazy_context in self.py__iter__())

</t>
<t tx="ekr.20180519065724.188">def _items(self):
    for array in self._arrays:
        for a in array._items():
            yield a

</t>
<t tx="ekr.20180519065724.189">def __len__(self):
    return sum(len(a) for a in self._arrays)


</t>
<t tx="ekr.20180519065724.19">from parso.python import tree

from jedi._compatibility import use_metaclass
from jedi import debug
from jedi.evaluate.cache import evaluator_method_cache, CachedMetaClass
from jedi.evaluate import compiled
from jedi.evaluate import recursion
from jedi.evaluate import docstrings
from jedi.evaluate import pep0484
from jedi.evaluate import flow_analysis
from jedi.evaluate import helpers
from jedi.evaluate.arguments import AnonymousArguments
from jedi.evaluate.filters import ParserTreeFilter, FunctionExecutionFilter, \
    ContextName, AbstractNameDefinition, ParamName
from jedi.evaluate.base_context import ContextualizedNode, NO_CONTEXTS, \
    ContextSet, TreeContext
from jedi.evaluate.lazy_context import LazyKnownContexts, LazyKnownContext, \
    LazyTreeContext
from jedi.evaluate.context import iterable
from jedi.evaluate.context import asynchronous
from jedi import parser_utils
from jedi.evaluate.parser_cache import get_yield_exprs


</t>
<t tx="ekr.20180519065724.190">def unpack_tuple_to_dict(context, types, exprlist):
    """
    Unpacking tuple assignments in for statements and expr_stmts.
    """
    if exprlist.type == 'name':
        return {exprlist.value: types}
    elif exprlist.type == 'atom' and exprlist.children[0] in '([':
        return unpack_tuple_to_dict(context, types, exprlist.children[1])
    elif exprlist.type in ('testlist', 'testlist_comp', 'exprlist',
                           'testlist_star_expr'):
        dct = {}
        parts = iter(exprlist.children[::2])
        n = 0
        for lazy_context in types.iterate(exprlist):
            n += 1
            try:
                part = next(parts)
            except StopIteration:
                # TODO this context is probably not right.
                analysis.add(context, 'value-error-too-many-values', part,
                             message="ValueError: too many values to unpack (expected %s)" % n)
            else:
                dct.update(unpack_tuple_to_dict(context, lazy_context.infer(), part))
        has_parts = next(parts, None)
        if types and has_parts is not None:
            # TODO this context is probably not right.
            analysis.add(context, 'value-error-too-few-values', has_parts,
                         message="ValueError: need more than %s values to unpack" % n)
        return dct
    elif exprlist.type == 'power' or exprlist.type == 'atom_expr':
        # Something like ``arr[x], var = ...``.
        # This is something that is not yet supported, would also be difficult
        # to write into a dict.
        return {}
    elif exprlist.type == 'star_expr':  # `a, *b, c = x` type unpackings
        # Currently we're not supporting them.
        return {}
    raise NotImplementedError


</t>
<t tx="ekr.20180519065724.191">def check_array_additions(context, sequence):
    """ Just a mapper function for the internal _check_array_additions """
    if sequence.array_type not in ('list', 'set'):
        # TODO also check for dict updates
        return NO_CONTEXTS

    return _check_array_additions(context, sequence)


</t>
<t tx="ekr.20180519065724.192">@evaluator_method_cache(default=NO_CONTEXTS)
@debug.increase_indent
def _check_array_additions(context, sequence):
    """
    Checks if a `Array` has "add" (append, insert, extend) statements:

    &gt;&gt;&gt; a = [""]
    &gt;&gt;&gt; a.append(1)
    """
    from jedi.evaluate import arguments

    debug.dbg('Dynamic array search for %s' % sequence, color='MAGENTA')
    module_context = context.get_root_context()
    if not settings.dynamic_array_additions or isinstance(module_context, compiled.CompiledObject):
        debug.dbg('Dynamic array search aborted.', color='MAGENTA')
        return ContextSet()

    def find_additions(context, arglist, add_name):
        params = list(arguments.TreeArguments(context.evaluator, context, arglist).unpack())
        result = set()
        if add_name in ['insert']:
            params = params[1:]
        if add_name in ['append', 'add', 'insert']:
            for key, whatever in params:
                result.add(whatever)
        elif add_name in ['extend', 'update']:
            for key, lazy_context in params:
                result |= set(lazy_context.infer().iterate())
        return result

    temp_param_add, settings.dynamic_params_for_other_modules = \
        settings.dynamic_params_for_other_modules, False

    is_list = sequence.name.string_name == 'list'
    search_names = (['append', 'extend', 'insert'] if is_list else ['add', 'update'])

    added_types = set()
    for add_name in search_names:
        try:
            possible_names = module_context.tree_node.get_used_names()[add_name]
        except KeyError:
            continue
        else:
            for name in possible_names:
                context_node = context.tree_node
                if not (context_node.start_pos &lt; name.start_pos &lt; context_node.end_pos):
                    continue
                trailer = name.parent
                power = trailer.parent
                trailer_pos = power.children.index(trailer)
                try:
                    execution_trailer = power.children[trailer_pos + 1]
                except IndexError:
                    continue
                else:
                    if execution_trailer.type != 'trailer' \
                            or execution_trailer.children[0] != '(' \
                            or execution_trailer.children[1] == ')':
                        continue

                random_context = context.create_context(name)

                with recursion.execution_allowed(context.evaluator, power) as allowed:
                    if allowed:
                        found = evaluate_call_of_leaf(
                            random_context,
                            name,
                            cut_own_trailer=True
                        )
                        if sequence in found:
                            # The arrays match. Now add the results
                            added_types |= find_additions(
                                random_context,
                                execution_trailer.children[1],
                                add_name
                            )

    # reset settings
    settings.dynamic_params_for_other_modules = temp_param_add
    debug.dbg('Dynamic array result %s' % added_types, color='MAGENTA')
    return added_types


</t>
<t tx="ekr.20180519065724.193">def get_dynamic_array_instance(instance):
    """Used for set() and list() instances."""
    if not settings.dynamic_array_additions:
        return instance.var_args

    ai = _ArrayInstance(instance)
    from jedi.evaluate import arguments
    return arguments.ValuesArguments([ContextSet(ai)])


</t>
<t tx="ekr.20180519065724.194">class _ArrayInstance(object):
    """
    Used for the usage of set() and list().
    This is definitely a hack, but a good one :-)
    It makes it possible to use set/list conversions.

    In contrast to Array, ListComprehension and all other iterable types, this
    is something that is only used inside `evaluate/compiled/fake/builtins.py`
    and therefore doesn't need filters, `py__bool__` and so on, because
    we don't use these operations in `builtins.py`.
    """
    @others
</t>
<t tx="ekr.20180519065724.195">def __init__(self, instance):
    self.instance = instance
    self.var_args = instance.var_args

</t>
<t tx="ekr.20180519065724.196">def py__iter__(self):
    var_args = self.var_args
    try:
        _, lazy_context = next(var_args.unpack())
    except StopIteration:
        pass
    else:
        for lazy in lazy_context.infer().iterate():
            yield lazy

    from jedi.evaluate import arguments
    if isinstance(var_args, arguments.TreeArguments):
        additions = _check_array_additions(var_args.context, self.instance)
        for addition in additions:
            yield addition

</t>
<t tx="ekr.20180519065724.197">def iterate(self, contextualized_node=None, is_async=False):
    return self.py__iter__()


</t>
<t tx="ekr.20180519065724.198">class Slice(Context):
    @others
</t>
<t tx="ekr.20180519065724.199">def __init__(self, context, start, stop, step):
    super(Slice, self).__init__(
        context.evaluator,
        parent_context=context.evaluator.builtins_module
    )
    self._context = context
    # all of them are either a Precedence or None.
    self._start = start
    self._stop = stop
    self._step = step

</t>
<t tx="ekr.20180519065724.2">import sys
import os


</t>
<t tx="ekr.20180519065724.20">class LambdaName(AbstractNameDefinition):
    string_name = '&lt;lambda&gt;'
    api_type = u'function'

    @others
</t>
<t tx="ekr.20180519065724.200">@property
def obj(self):
    """
    Imitate CompiledObject.obj behavior and return a ``builtin.slice()``
    object.
    """
    def get(element):
        if element is None:
            return None

        result = self._context.eval_node(element)
        if len(result) != 1:
            # For simplicity, we want slices to be clear defined with just
            # one type.  Otherwise we will return an empty slice object.
            raise IndexError

        context, = result
        return get_int_or_none(context)

    try:
        return slice(get(self._start), get(self._stop), get(self._step))
    except IndexError:
        return slice(None, None, None)
</t>
<t tx="ekr.20180519065724.201">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/context/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065724.202">"""
Like described in the :mod:`parso.python.tree` module,
there's a need for an ast like module to represent the states of parsed
modules.

But now there are also structures in Python that need a little bit more than
that. An ``Instance`` for example is only a ``Class`` before it is
instantiated. This class represents these cases.

So, why is there also a ``Class`` class here? Well, there are decorators and
they change classes in Python 3.

Representation modules also define "magic methods". Those methods look like
``py__foo__`` and are typically mappable to the Python equivalents ``__call__``
and others. Here's a list:

====================================== ========================================
**Method**                             **Description**
-------------------------------------- ----------------------------------------
py__call__(params: Array)              On callable objects, returns types.
py__bool__()                           Returns True/False/None; None means that
                                       there's no certainty.
py__bases__()                          Returns a list of base classes.
py__mro__()                            Returns a list of classes (the mro).
py__iter__()                           Returns a generator of a set of types.
py__class__()                          Returns the class of an instance.
py__getitem__(index: int/str)          Returns a a set of types of the index.
                                       Can raise an IndexError/KeyError.
py__file__()                           Only on modules. Returns None if does
                                       not exist.
py__package__()                        Only on modules. For the import system.
py__path__()                           Only on modules. For the import system.
py__get__(call_object)                 Only on instances. Simulates
                                       descriptors.
py__doc__(include_call_signature:      Returns the docstring for a context.
          bool)
====================================== ========================================

"""
from jedi._compatibility import use_metaclass
from jedi.evaluate.cache import evaluator_method_cache, CachedMetaClass
from jedi.evaluate import compiled
from jedi.evaluate.lazy_context import LazyKnownContext
from jedi.evaluate.filters import ParserTreeFilter, TreeNameDefinition, \
    ContextName, AnonymousInstanceParamName
from jedi.evaluate.base_context import ContextSet, iterator_to_context_set, \
    TreeContext


</t>
<t tx="ekr.20180519065724.203">def apply_py__get__(context, base_context):
    try:
        method = context.py__get__
    except AttributeError:
        yield context
    else:
        for descriptor_context in method(base_context):
            yield descriptor_context


</t>
<t tx="ekr.20180519065724.204">class ClassName(TreeNameDefinition):
    @others
</t>
<t tx="ekr.20180519065724.205">def __init__(self, parent_context, tree_name, name_context):
    super(ClassName, self).__init__(parent_context, tree_name)
    self._name_context = name_context

</t>
<t tx="ekr.20180519065724.206">@iterator_to_context_set
def infer(self):
    # TODO this _name_to_types might get refactored and be a part of the
    # parent class. Once it is, we can probably just overwrite method to
    # achieve this.
    from jedi.evaluate.syntax_tree import tree_name_to_contexts
    inferred = tree_name_to_contexts(
        self.parent_context.evaluator, self._name_context, self.tree_name)

    for result_context in inferred:
        for c in apply_py__get__(result_context, self.parent_context):
            yield c


</t>
<t tx="ekr.20180519065724.207">class ClassFilter(ParserTreeFilter):
    name_class = ClassName

    @others
</t>
<t tx="ekr.20180519065724.208">def _convert_names(self, names):
    return [self.name_class(self.context, name, self._node_context)
            for name in names]


</t>
<t tx="ekr.20180519065724.209">class ClassContext(use_metaclass(CachedMetaClass, TreeContext)):
    """
    This class is not only important to extend `tree.Class`, it is also a
    important for descriptors (if the descriptor methods are evaluated or not).
    """
    api_type = u'class'

    @others
</t>
<t tx="ekr.20180519065724.21">def __init__(self, lambda_context):
    self._lambda_context = lambda_context
    self.parent_context = lambda_context.parent_context

</t>
<t tx="ekr.20180519065724.210">def __init__(self, evaluator, parent_context, classdef):
    super(ClassContext, self).__init__(evaluator, parent_context=parent_context)
    self.tree_node = classdef

</t>
<t tx="ekr.20180519065724.211">@evaluator_method_cache(default=())
def py__mro__(self):
    def add(cls):
        if cls not in mro:
            mro.append(cls)

    mro = [self]
    # TODO Do a proper mro resolution. Currently we are just listing
    # classes. However, it's a complicated algorithm.
    for lazy_cls in self.py__bases__():
        # TODO there's multiple different mro paths possible if this yields
        # multiple possibilities. Could be changed to be more correct.
        for cls in lazy_cls.infer():
            # TODO detect for TypeError: duplicate base class str,
            # e.g.  `class X(str, str): pass`
            try:
                mro_method = cls.py__mro__
            except AttributeError:
                # TODO add a TypeError like:
                """
                &gt;&gt;&gt; class Y(lambda: test): pass
                Traceback (most recent call last):
                  File "&lt;stdin&gt;", line 1, in &lt;module&gt;
                TypeError: function() argument 1 must be code, not str
                &gt;&gt;&gt; class Y(1): pass
                Traceback (most recent call last):
                  File "&lt;stdin&gt;", line 1, in &lt;module&gt;
                TypeError: int() takes at most 2 arguments (3 given)
                """
                pass
            else:
                add(cls)
                for cls_new in mro_method():
                    add(cls_new)
    return tuple(mro)

</t>
<t tx="ekr.20180519065724.212">@evaluator_method_cache(default=())
def py__bases__(self):
    arglist = self.tree_node.get_super_arglist()
    if arglist:
        from jedi.evaluate import arguments
        args = arguments.TreeArguments(self.evaluator, self.parent_context, arglist)
        return [value for key, value in args.unpack() if key is None]
    else:
        return [LazyKnownContext(compiled.builtin_from_name(self.evaluator, u'object'))]

</t>
<t tx="ekr.20180519065724.213">def py__call__(self, params):
    from jedi.evaluate.context import TreeInstance
    return ContextSet(TreeInstance(self.evaluator, self.parent_context, self, params))

</t>
<t tx="ekr.20180519065724.214">def py__class__(self):
    return compiled.builtin_from_name(self.evaluator, u'type')

</t>
<t tx="ekr.20180519065724.215">def get_params(self):
    from jedi.evaluate.context import AnonymousInstance
    anon = AnonymousInstance(self.evaluator, self.parent_context, self)
    return [AnonymousInstanceParamName(anon, param.name) for param in self.funcdef.get_params()]

</t>
<t tx="ekr.20180519065724.216">def get_filters(self, search_global, until_position=None, origin_scope=None, is_instance=False):
    if search_global:
        yield ParserTreeFilter(
            self.evaluator,
            context=self,
            until_position=until_position,
            origin_scope=origin_scope
        )
    else:
        for cls in self.py__mro__():
            if isinstance(cls, compiled.CompiledObject):
                for filter in cls.get_filters(is_instance=is_instance):
                    yield filter
            else:
                yield ClassFilter(
                    self.evaluator, self, node_context=cls,
                    origin_scope=origin_scope)

</t>
<t tx="ekr.20180519065724.217">def is_class(self):
    return True

</t>
<t tx="ekr.20180519065724.218">def get_function_slot_names(self, name):
    for filter in self.get_filters(search_global=False):
        names = filter.get(name)
        if names:
            return names
    return []

</t>
<t tx="ekr.20180519065724.219">def get_param_names(self):
    for name in self.get_function_slot_names(u'__init__'):
        for context_ in name.infer():
            try:
                method = context_.get_param_names
            except AttributeError:
                pass
            else:
                return list(method())[1:]
    return []

</t>
<t tx="ekr.20180519065724.22">@property
def start_pos(self):
    return self._lambda_context.tree_node.start_pos

</t>
<t tx="ekr.20180519065724.220">@property
def name(self):
    return ContextName(self, self.tree_node.name)
</t>
<t tx="ekr.20180519065724.221">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/context/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065724.222">import re
import os

from parso import python_bytes_to_unicode

from jedi.evaluate.cache import evaluator_method_cache
from jedi._compatibility import iter_modules, all_suffixes
from jedi.evaluate.filters import GlobalNameFilter, ContextNameMixin, \
    AbstractNameDefinition, ParserTreeFilter, DictFilter, MergedFilter
from jedi.evaluate import compiled
from jedi.evaluate.base_context import TreeContext
from jedi.evaluate.imports import SubModuleName, infer_import


</t>
<t tx="ekr.20180519065724.223">class _ModuleAttributeName(AbstractNameDefinition):
    """
    For module attributes like __file__, __str__ and so on.
    """
    api_type = u'instance'

    @others
</t>
<t tx="ekr.20180519065724.224">def __init__(self, parent_module, string_name):
    self.parent_context = parent_module
    self.string_name = string_name

</t>
<t tx="ekr.20180519065724.225">def infer(self):
    return compiled.get_string_context_set(self.parent_context.evaluator)


</t>
<t tx="ekr.20180519065724.226">class ModuleName(ContextNameMixin, AbstractNameDefinition):
    start_pos = 1, 0

    @others
</t>
<t tx="ekr.20180519065724.227">def __init__(self, context, name):
    self._context = context
    self._name = name

</t>
<t tx="ekr.20180519065724.228">@property
def string_name(self):
    return self._name


</t>
<t tx="ekr.20180519065724.229">class ModuleContext(TreeContext):
    api_type = u'module'
    parent_context = None

    @others
</t>
<t tx="ekr.20180519065724.23">def infer(self):
    return ContextSet(self._lambda_context)


</t>
<t tx="ekr.20180519065724.230">def __init__(self, evaluator, module_node, path, code_lines):
    super(ModuleContext, self).__init__(evaluator, parent_context=None)
    self.tree_node = module_node
    self._path = path
    self.code_lines = code_lines

</t>
<t tx="ekr.20180519065724.231">def get_filters(self, search_global, until_position=None, origin_scope=None):
    yield MergedFilter(
        ParserTreeFilter(
            self.evaluator,
            context=self,
            until_position=until_position,
            origin_scope=origin_scope
        ),
        GlobalNameFilter(self, self.tree_node),
    )
    yield DictFilter(self._sub_modules_dict())
    yield DictFilter(self._module_attributes_dict())
    for star_module in self.star_imports():
        yield next(star_module.get_filters(search_global))

# I'm not sure if the star import cache is really that effective anymore
# with all the other really fast import caches. Recheck. Also we would need
# to push the star imports into Evaluator.module_cache, if we reenable this.
</t>
<t tx="ekr.20180519065724.232">@evaluator_method_cache([])
def star_imports(self):
    modules = []
    for i in self.tree_node.iter_imports():
        if i.is_star_import():
            name = i.get_paths()[-1][-1]
            new = infer_import(self, name)
            for module in new:
                if isinstance(module, ModuleContext):
                    modules += module.star_imports()
            modules += new
    return modules

</t>
<t tx="ekr.20180519065724.233">@evaluator_method_cache()
def _module_attributes_dict(self):
    names = ['__file__', '__package__', '__doc__', '__name__']
    # All the additional module attributes are strings.
    return dict((n, _ModuleAttributeName(self, n)) for n in names)

</t>
<t tx="ekr.20180519065724.234">@property
def _string_name(self):
    """ This is used for the goto functions. """
    if self._path is None:
        return ''  # no path -&gt; empty name
    else:
        sep = (re.escape(os.path.sep),) * 2
        r = re.search(r'([^%s]*?)(%s__init__)?(\.py|\.so)?$' % sep, self._path)
        # Remove PEP 3149 names
        return re.sub(r'\.[a-z]+-\d{2}[mud]{0,3}$', '', r.group(1))

</t>
<t tx="ekr.20180519065724.235">@property
@evaluator_method_cache()
def name(self):
    return ModuleName(self, self._string_name)

</t>
<t tx="ekr.20180519065724.236">def _get_init_directory(self):
    """
    :return: The path to the directory of a package. None in case it's not
             a package.
    """
    for suffix in all_suffixes():
        ending = '__init__' + suffix
        py__file__ = self.py__file__()
        if py__file__ is not None and py__file__.endswith(ending):
            # Remove the ending, including the separator.
            return self.py__file__()[:-len(ending) - 1]
    return None

</t>
<t tx="ekr.20180519065724.237">def py__name__(self):
    for name, module in self.evaluator.module_cache.iterate_modules_with_names():
        if module == self and name != '':
            return name

    return '__main__'

</t>
<t tx="ekr.20180519065724.238">def py__file__(self):
    """
    In contrast to Python's __file__ can be None.
    """
    if self._path is None:
        return None

    return os.path.abspath(self._path)

</t>
<t tx="ekr.20180519065724.239">def py__package__(self):
    if self._get_init_directory() is None:
        return re.sub(r'\.?[^.]+$', '', self.py__name__())
    else:
        return self.py__name__()

</t>
<t tx="ekr.20180519065724.24">class FunctionContext(use_metaclass(CachedMetaClass, TreeContext)):
    """
    Needed because of decorators. Decorators are evaluated here.
    """
    api_type = u'function'

    @others
</t>
<t tx="ekr.20180519065724.240">def _py__path__(self):
    search_path = self.evaluator.get_sys_path()
    init_path = self.py__file__()
    if os.path.basename(init_path) == '__init__.py':
        with open(init_path, 'rb') as f:
            content = python_bytes_to_unicode(f.read(), errors='replace')
            # these are strings that need to be used for namespace packages,
            # the first one is ``pkgutil``, the second ``pkg_resources``.
            options = ('declare_namespace(__name__)', 'extend_path(__path__')
            if options[0] in content or options[1] in content:
                # It is a namespace, now try to find the rest of the
                # modules on sys_path or whatever the search_path is.
                paths = set()
                for s in search_path:
                    other = os.path.join(s, self.name.string_name)
                    if os.path.isdir(other):
                        paths.add(other)
                if paths:
                    return list(paths)
                # TODO I'm not sure if this is how nested namespace
                # packages work. The tests are not really good enough to
                # show that.
    # Default to this.
    return [self._get_init_directory()]

</t>
<t tx="ekr.20180519065724.241">@property
def py__path__(self):
    """
    Not seen here, since it's a property. The callback actually uses a
    variable, so use it like::

        foo.py__path__(sys_path)

    In case of a package, this returns Python's __path__ attribute, which
    is a list of paths (strings).
    Raises an AttributeError if the module is not a package.
    """
    path = self._get_init_directory()

    if path is None:
        raise AttributeError('Only packages have __path__ attributes.')
    else:
        return self._py__path__

</t>
<t tx="ekr.20180519065724.242">@evaluator_method_cache()
def _sub_modules_dict(self):
    """
    Lists modules in the directory of this module (if this module is a
    package).
    """
    path = self._path
    names = {}
    if path is not None and path.endswith(os.path.sep + '__init__.py'):
        mods = iter_modules([os.path.dirname(path)])
        for module_loader, name, is_pkg in mods:
            # It's obviously a relative import to the current module.
            names[name] = SubModuleName(self, name)

    # TODO add something like this in the future, its cleaner than the
    #   import hacks.
    # ``os.path`` is a hardcoded exception, because it's a
    # ``sys.modules`` modification.
    # if str(self.name) == 'os':
    #     names.append(Name('path', parent_context=self))

    return names

</t>
<t tx="ekr.20180519065724.243">def py__class__(self):
    return compiled.get_special_object(self.evaluator, u'MODULE_CLASS')

</t>
<t tx="ekr.20180519065724.244">def __repr__(self):
    return "&lt;%s: %s@%s-%s&gt;" % (
        self.__class__.__name__, self._string_name,
        self.tree_node.start_pos[0], self.tree_node.end_pos[0])
</t>
<t tx="ekr.20180519065724.245">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/context/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065724.246">import os
from itertools import chain

from jedi.evaluate.cache import evaluator_method_cache
from jedi.evaluate import imports
from jedi.evaluate.filters import DictFilter, AbstractNameDefinition
from jedi.evaluate.base_context import TreeContext, ContextSet


</t>
<t tx="ekr.20180519065724.247">class ImplicitNSName(AbstractNameDefinition):
    """
    Accessing names for implicit namespace packages should infer to nothing.
    This object will prevent Jedi from raising exceptions
    """
    @others
</t>
<t tx="ekr.20180519065724.248">def __init__(self, implicit_ns_context, string_name):
    self.parent_context = implicit_ns_context
    self.string_name = string_name

</t>
<t tx="ekr.20180519065724.249">def infer(self):
    return ContextSet(self.parent_context)

</t>
<t tx="ekr.20180519065724.25">def __init__(self, evaluator, parent_context, funcdef):
    """ This should not be called directly """
    super(FunctionContext, self).__init__(evaluator, parent_context)
    self.tree_node = funcdef

</t>
<t tx="ekr.20180519065724.250">def get_root_context(self):
    return self.parent_context


</t>
<t tx="ekr.20180519065724.251">class ImplicitNamespaceContext(TreeContext):
    """
    Provides support for implicit namespace packages
    """
    # Is a module like every other module, because if you import an empty
    # folder foobar it will be available as an object:
    # &lt;module 'foobar' (namespace)&gt;.
    api_type = u'module'
    parent_context = None

    @others
</t>
<t tx="ekr.20180519065724.252">def __init__(self, evaluator, fullname, paths):
    super(ImplicitNamespaceContext, self).__init__(evaluator, parent_context=None)
    self.evaluator = evaluator
    self._fullname = fullname
    self.paths = paths

</t>
<t tx="ekr.20180519065724.253">def get_filters(self, search_global, until_position=None, origin_scope=None):
    yield DictFilter(self._sub_modules_dict())

</t>
<t tx="ekr.20180519065724.254">@property
@evaluator_method_cache()
def name(self):
    string_name = self.py__package__().rpartition('.')[-1]
    return ImplicitNSName(self, string_name)

</t>
<t tx="ekr.20180519065724.255">def py__file__(self):
    return None

</t>
<t tx="ekr.20180519065724.256">def py__package__(self):
    """Return the fullname
    """
    return self._fullname

</t>
<t tx="ekr.20180519065724.257">@property
def py__path__(self):
    return lambda: [self.paths]

</t>
<t tx="ekr.20180519065724.258">@evaluator_method_cache()
def _sub_modules_dict(self):
    names = {}

    file_names = chain.from_iterable(os.listdir(path) for path in self.paths)
    mods = [
        file_name.rpartition('.')[0] if '.' in file_name else file_name
        for file_name in file_names
        if file_name != '__pycache__'
    ]

    for name in mods:
        names[name] = imports.SubModuleName(self, name)
    return names
</t>
<t tx="ekr.20180519065724.259">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/context/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065724.26">def get_filters(self, search_global, until_position=None, origin_scope=None):
    if search_global:
        yield ParserTreeFilter(
            self.evaluator,
            context=self,
            until_position=until_position,
            origin_scope=origin_scope
        )
    else:
        scope = self.py__class__()
        for filter in scope.get_filters(search_global=False, origin_scope=origin_scope):
            yield filter

</t>
<t tx="ekr.20180519065724.260">from jedi.evaluate.context.module import ModuleContext
from jedi.evaluate.context.klass import ClassContext
from jedi.evaluate.context.function import FunctionContext, FunctionExecutionContext
from jedi.evaluate.context.instance import AnonymousInstance, BoundMethod, \
    CompiledInstance, AbstractInstanceContext, TreeInstance
</t>
<t tx="ekr.20180519065724.27">def infer_function_execution(self, function_execution):
    """
    Created to be used by inheritance.
    """
    is_coroutine = self.tree_node.parent.type == 'async_stmt'
    is_generator = bool(get_yield_exprs(self.evaluator, self.tree_node))

    if is_coroutine:
        if is_generator:
            if self.evaluator.environment.version_info &lt; (3, 6):
                return NO_CONTEXTS
            return ContextSet(asynchronous.AsyncGenerator(self.evaluator, function_execution))
        else:
            if self.evaluator.environment.version_info &lt; (3, 5):
                return NO_CONTEXTS
            return ContextSet(asynchronous.Coroutine(self.evaluator, function_execution))
    else:
        if is_generator:
            return ContextSet(iterable.Generator(self.evaluator, function_execution))
        else:
            return function_execution.get_return_values()

</t>
<t tx="ekr.20180519065724.28">def get_function_execution(self, arguments=None):
    if arguments is None:
        arguments = AnonymousArguments()

    return FunctionExecutionContext(self.evaluator, self.parent_context, self, arguments)

</t>
<t tx="ekr.20180519065724.29">def py__call__(self, arguments):
    function_execution = self.get_function_execution(arguments)
    return self.infer_function_execution(function_execution)

</t>
<t tx="ekr.20180519065724.3">def _get_paths():
    # Get the path to jedi.
    _d = os.path.dirname
    _jedi_path = _d(_d(_d(_d(_d(__file__)))))
    _parso_path = sys.argv[1]
    # The paths are the directory that jedi and parso lie in.
    return {'jedi': _jedi_path, 'parso': _parso_path}


# Remove the first entry, because it's simply a directory entry that equals
# this directory.
del sys.path[0]

</t>
<t tx="ekr.20180519065724.30">def py__class__(self):
    # This differentiation is only necessary for Python2. Python3 does not
    # use a different method class.
    if isinstance(parser_utils.get_parent_scope(self.tree_node), tree.Class):
        name = u'METHOD_CLASS'
    else:
        name = u'FUNCTION_CLASS'
    return compiled.get_special_object(self.evaluator, name)

</t>
<t tx="ekr.20180519065724.31">@property
def name(self):
    if self.tree_node.type == 'lambdef':
        return LambdaName(self)
    return ContextName(self, self.tree_node.name)

</t>
<t tx="ekr.20180519065724.32">def get_param_names(self):
    function_execution = self.get_function_execution()
    return [ParamName(function_execution, param.name)
            for param in self.tree_node.get_params()]


</t>
<t tx="ekr.20180519065724.33">class FunctionExecutionContext(TreeContext):
    """
    This class is used to evaluate functions and their returns.

    This is the most complicated class, because it contains the logic to
    transfer parameters. It is even more complicated, because there may be
    multiple calls to functions and recursion has to be avoided. But this is
    responsibility of the decorators.
    """
    function_execution_filter = FunctionExecutionFilter

    @others
</t>
<t tx="ekr.20180519065724.34">def __init__(self, evaluator, parent_context, function_context, var_args):
    super(FunctionExecutionContext, self).__init__(evaluator, parent_context)
    self.function_context = function_context
    self.tree_node = function_context.tree_node
    self.var_args = var_args

</t>
<t tx="ekr.20180519065724.35">@evaluator_method_cache(default=NO_CONTEXTS)
@recursion.execution_recursion_decorator()
def get_return_values(self, check_yields=False):
    funcdef = self.tree_node
    if funcdef.type == 'lambdef':
        return self.eval_node(funcdef.children[-1])

    if check_yields:
        context_set = NO_CONTEXTS
        returns = get_yield_exprs(self.evaluator, funcdef)
    else:
        returns = funcdef.iter_return_stmts()
        context_set = docstrings.infer_return_types(self.function_context)
        context_set |= pep0484.infer_return_types(self.function_context)

    for r in returns:
        check = flow_analysis.reachability_check(self, funcdef, r)
        if check is flow_analysis.UNREACHABLE:
            debug.dbg('Return unreachable: %s', r)
        else:
            if check_yields:
                context_set |= ContextSet.from_sets(
                    lazy_context.infer()
                    for lazy_context in self._get_yield_lazy_context(r)
                )
            else:
                try:
                    children = r.children
                except AttributeError:
                    ctx = compiled.builtin_from_name(self.evaluator, u'None')
                    context_set |= ContextSet(ctx)
                else:
                    context_set |= self.eval_node(children[1])
        if check is flow_analysis.REACHABLE:
            debug.dbg('Return reachable: %s', r)
            break
    return context_set

</t>
<t tx="ekr.20180519065724.36">def _get_yield_lazy_context(self, yield_expr):
    if yield_expr.type == 'keyword':
        # `yield` just yields None.
        ctx = compiled.builtin_from_name(self.evaluator, u'None')
        yield LazyKnownContext(ctx)
        return

    node = yield_expr.children[1]
    if node.type == 'yield_arg':  # It must be a yield from.
        cn = ContextualizedNode(self, node.children[1])
        for lazy_context in cn.infer().iterate(cn):
            yield lazy_context
    else:
        yield LazyTreeContext(self, node)

</t>
<t tx="ekr.20180519065724.37">@recursion.execution_recursion_decorator(default=iter([]))
def get_yield_lazy_contexts(self, is_async=False):
    # TODO: if is_async, wrap yield statements in Awaitable/async_generator_asend
    for_parents = [(y, tree.search_ancestor(y, 'for_stmt', 'funcdef',
                                            'while_stmt', 'if_stmt'))
                   for y in get_yield_exprs(self.evaluator, self.tree_node)]

    # Calculate if the yields are placed within the same for loop.
    yields_order = []
    last_for_stmt = None
    for yield_, for_stmt in for_parents:
        # For really simple for loops we can predict the order. Otherwise
        # we just ignore it.
        parent = for_stmt.parent
        if parent.type == 'suite':
            parent = parent.parent
        if for_stmt.type == 'for_stmt' and parent == self.tree_node \
                and parser_utils.for_stmt_defines_one_name(for_stmt):  # Simplicity for now.
            if for_stmt == last_for_stmt:
                yields_order[-1][1].append(yield_)
            else:
                yields_order.append((for_stmt, [yield_]))
        elif for_stmt == self.tree_node:
            yields_order.append((None, [yield_]))
        else:
            types = self.get_return_values(check_yields=True)
            if types:
                yield LazyKnownContexts(types)
            return
        last_for_stmt = for_stmt

    for for_stmt, yields in yields_order:
        if for_stmt is None:
            # No for_stmt, just normal yields.
            for yield_ in yields:
                for result in self._get_yield_lazy_context(yield_):
                    yield result
        else:
            input_node = for_stmt.get_testlist()
            cn = ContextualizedNode(self, input_node)
            ordered = cn.infer().iterate(cn)
            ordered = list(ordered)
            for lazy_context in ordered:
                dct = {str(for_stmt.children[1].value): lazy_context.infer()}
                with helpers.predefine_names(self, for_stmt, dct):
                    for yield_in_same_for_stmt in yields:
                        for result in self._get_yield_lazy_context(yield_in_same_for_stmt):
                            yield result

</t>
<t tx="ekr.20180519065724.38">def get_filters(self, search_global, until_position=None, origin_scope=None):
    yield self.function_execution_filter(self.evaluator, self,
                                         until_position=until_position,
                                         origin_scope=origin_scope)

</t>
<t tx="ekr.20180519065724.39">@evaluator_method_cache()
def get_params(self):
    return self.var_args.get_params(self)
</t>
<t tx="ekr.20180519065724.40">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/context/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065724.41">from abc import abstractproperty

from jedi import debug
from jedi.evaluate import compiled
from jedi.evaluate import filters
from jedi.evaluate.base_context import Context, NO_CONTEXTS, ContextSet, \
    iterator_to_context_set
from jedi.evaluate.lazy_context import LazyKnownContext, LazyKnownContexts
from jedi.evaluate.cache import evaluator_method_cache
from jedi.evaluate.arguments import AbstractArguments, AnonymousArguments
from jedi.cache import memoize_method
from jedi.evaluate.context.function import FunctionExecutionContext, FunctionContext
from jedi.evaluate.context.klass import ClassContext, apply_py__get__
from jedi.evaluate.context import iterable
from jedi.parser_utils import get_parent_scope


</t>
<t tx="ekr.20180519065724.42">class BaseInstanceFunctionExecution(FunctionExecutionContext):
    @others
</t>
<t tx="ekr.20180519065724.43">def __init__(self, instance, *args, **kwargs):
    self.instance = instance
    super(BaseInstanceFunctionExecution, self).__init__(
        instance.evaluator, *args, **kwargs)


</t>
<t tx="ekr.20180519065724.44">class InstanceFunctionExecution(BaseInstanceFunctionExecution):
    @others
</t>
<t tx="ekr.20180519065724.45">def __init__(self, instance, parent_context, function_context, var_args):
    var_args = InstanceVarArgs(self, var_args)

    super(InstanceFunctionExecution, self).__init__(
        instance, parent_context, function_context, var_args)


</t>
<t tx="ekr.20180519065724.46">class AnonymousInstanceFunctionExecution(BaseInstanceFunctionExecution):
    function_execution_filter = filters.AnonymousInstanceFunctionExecutionFilter

    @others
</t>
<t tx="ekr.20180519065724.47">def __init__(self, instance, parent_context, function_context, var_args):
    super(AnonymousInstanceFunctionExecution, self).__init__(
        instance, parent_context, function_context, var_args)


</t>
<t tx="ekr.20180519065724.48">class AbstractInstanceContext(Context):
    """
    This class is used to evaluate instances.
    """
    api_type = u'instance'
    function_execution_cls = InstanceFunctionExecution

    @others
</t>
<t tx="ekr.20180519065724.49">def __init__(self, evaluator, parent_context, class_context, var_args):
    super(AbstractInstanceContext, self).__init__(evaluator, parent_context)
    # Generated instances are classes that are just generated by self
    # (No var_args) used.
    self.class_context = class_context
    self.var_args = var_args

</t>
<t tx="ekr.20180519065724.5"></t>
<t tx="ekr.20180519065724.50">def is_class(self):
    return False

</t>
<t tx="ekr.20180519065724.51">@property
def py__call__(self):
    names = self.get_function_slot_names(u'__call__')
    if not names:
        # Means the Instance is not callable.
        raise AttributeError

    def execute(arguments):
        return ContextSet.from_sets(name.execute(arguments) for name in names)

    return execute

</t>
<t tx="ekr.20180519065724.52">def py__class__(self):
    return self.class_context

</t>
<t tx="ekr.20180519065724.53">def py__bool__(self):
    # Signalize that we don't know about the bool type.
    return None

</t>
<t tx="ekr.20180519065724.54">def get_function_slot_names(self, name):
    # Python classes don't look at the dictionary of the instance when
    # looking up `__call__`. This is something that has to do with Python's
    # internal slot system (note: not __slots__, but C slots).
    for filter in self.get_filters(include_self_names=False):
        names = filter.get(name)
        if names:
            return names
    return []

</t>
<t tx="ekr.20180519065724.55">def execute_function_slots(self, names, *evaluated_args):
    return ContextSet.from_sets(
        name.execute_evaluated(*evaluated_args)
        for name in names
    )

</t>
<t tx="ekr.20180519065724.56">def py__get__(self, obj):
    # Arguments in __get__ descriptors are obj, class.
    # `method` is the new parent of the array, don't know if that's good.
    names = self.get_function_slot_names(u'__get__')
    if names:
        if isinstance(obj, AbstractInstanceContext):
            return self.execute_function_slots(names, obj, obj.class_context)
        else:
            none_obj = compiled.builtin_from_name(self.evaluator, u'None')
            return self.execute_function_slots(names, none_obj, obj)
    else:
        return ContextSet(self)

</t>
<t tx="ekr.20180519065724.57">def get_filters(self, search_global=None, until_position=None,
                origin_scope=None, include_self_names=True):
    if include_self_names:
        for cls in self.class_context.py__mro__():
            if not isinstance(cls, compiled.CompiledObject) \
                    or cls.tree_node is not None:
                # In this case we're excluding compiled objects that are
                # not fake objects. It doesn't make sense for normal
                # compiled objects to search for self variables.
                yield SelfAttributeFilter(self.evaluator, self, cls, origin_scope)

    for cls in self.class_context.py__mro__():
        if isinstance(cls, compiled.CompiledObject):
            yield CompiledInstanceClassFilter(self.evaluator, self, cls)
        else:
            yield InstanceClassFilter(self.evaluator, self, cls, origin_scope)

</t>
<t tx="ekr.20180519065724.58">def py__getitem__(self, index):
    try:
        names = self.get_function_slot_names(u'__getitem__')
    except KeyError:
        debug.warning('No __getitem__, cannot access the array.')
        return NO_CONTEXTS
    else:
        index_obj = compiled.create_simple_object(self.evaluator, index)
        return self.execute_function_slots(names, index_obj)

</t>
<t tx="ekr.20180519065724.59">def py__iter__(self):
    iter_slot_names = self.get_function_slot_names(u'__iter__')
    if not iter_slot_names:
        debug.warning('No __iter__ on %s.' % self)
        return

    for generator in self.execute_function_slots(iter_slot_names):
        if isinstance(generator, AbstractInstanceContext):
            # `__next__` logic.
            if self.evaluator.environment.version_info.major == 2:
                name = u'next'
            else:
                name = u'__next__'
            iter_slot_names = generator.get_function_slot_names(name)
            if iter_slot_names:
                yield LazyKnownContexts(
                    generator.execute_function_slots(iter_slot_names)
                )
            else:
                debug.warning('Instance has no __next__ function in %s.', generator)
        else:
            for lazy_context in generator.py__iter__():
                yield lazy_context

</t>
<t tx="ekr.20180519065724.6">@path C:/Anaconda3/Lib/site-packages/jedi/evaluate/context/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519065724.60">@abstractproperty
def name(self):
    pass

</t>
<t tx="ekr.20180519065724.61">def _create_init_execution(self, class_context, func_node):
    bound_method = BoundMethod(
        self.evaluator, self, class_context, self.parent_context, func_node
    )
    return self.function_execution_cls(
        self,
        class_context.parent_context,
        bound_method,
        self.var_args
    )

</t>
<t tx="ekr.20180519065724.62">def create_init_executions(self):
    for name in self.get_function_slot_names(u'__init__'):
        if isinstance(name, SelfName):
            yield self._create_init_execution(name.class_context, name.tree_name.parent)

</t>
<t tx="ekr.20180519065724.63">@evaluator_method_cache()
def create_instance_context(self, class_context, node):
    if node.parent.type in ('funcdef', 'classdef'):
        node = node.parent
    scope = get_parent_scope(node)
    if scope == class_context.tree_node:
        return class_context
    else:
        parent_context = self.create_instance_context(class_context, scope)
        if scope.type == 'funcdef':
            if scope.name.value == '__init__' and parent_context == class_context:
                return self._create_init_execution(class_context, scope)
            else:
                bound_method = BoundMethod(
                    self.evaluator, self, class_context,
                    parent_context, scope
                )
                return bound_method.get_function_execution()
        elif scope.type == 'classdef':
            class_context = ClassContext(self.evaluator, parent_context, scope)
            return class_context
        elif scope.type == 'comp_for':
            # Comprehensions currently don't have a special scope in Jedi.
            return self.create_instance_context(class_context, scope)
        else:
            raise NotImplementedError
    return class_context

</t>
<t tx="ekr.20180519065724.64">def __repr__(self):
    return "&lt;%s of %s(%s)&gt;" % (self.__class__.__name__, self.class_context,
                               self.var_args)


</t>
<t tx="ekr.20180519065724.65">class CompiledInstance(AbstractInstanceContext):
    @others
</t>
<t tx="ekr.20180519065724.66">def __init__(self, *args, **kwargs):
    super(CompiledInstance, self).__init__(*args, **kwargs)
    # I don't think that dynamic append lookups should happen here. That
    # sounds more like something that should go to py__iter__.
    self._original_var_args = self.var_args

    if self.class_context.name.string_name in ['list', 'set'] \
            and self.parent_context.get_root_context() == self.evaluator.builtins_module:
        # compare the module path with the builtin name.
        self.var_args = iterable.get_dynamic_array_instance(self)

</t>
<t tx="ekr.20180519065724.67">@property
def name(self):
    return compiled.CompiledContextName(self, self.class_context.name.string_name)

</t>
<t tx="ekr.20180519065724.68">def create_instance_context(self, class_context, node):
    if get_parent_scope(node).type == 'classdef':
        return class_context
    else:
        return super(CompiledInstance, self).create_instance_context(class_context, node)

</t>
<t tx="ekr.20180519065724.69">def get_first_non_keyword_argument_contexts(self):
    key, lazy_context = next(self._original_var_args.unpack(), ('', None))
    if key is not None:
        return NO_CONTEXTS

    return lazy_context.infer()


</t>
<t tx="ekr.20180519065724.7">from jedi.evaluate.filters import publish_method, BuiltinOverwrite
from jedi.evaluate.base_context import ContextSet


</t>
<t tx="ekr.20180519065724.70">class TreeInstance(AbstractInstanceContext):
    @others
</t>
<t tx="ekr.20180519065724.71">def __init__(self, evaluator, parent_context, class_context, var_args):
    super(TreeInstance, self).__init__(evaluator, parent_context,
                                       class_context, var_args)
    self.tree_node = class_context.tree_node

</t>
<t tx="ekr.20180519065724.72">@property
def name(self):
    return filters.ContextName(self, self.class_context.name.tree_name)


</t>
<t tx="ekr.20180519065724.73">class AnonymousInstance(TreeInstance):
    function_execution_cls = AnonymousInstanceFunctionExecution

    @others
</t>
<t tx="ekr.20180519065724.74">def __init__(self, evaluator, parent_context, class_context):
    super(AnonymousInstance, self).__init__(
        evaluator,
        parent_context,
        class_context,
        var_args=AnonymousArguments(),
    )


</t>
<t tx="ekr.20180519065724.75">class CompiledInstanceName(compiled.CompiledName):
    @others
</t>
<t tx="ekr.20180519065724.76">def __init__(self, evaluator, instance, parent_context, name):
    super(CompiledInstanceName, self).__init__(evaluator, parent_context, name)
    self._instance = instance

</t>
<t tx="ekr.20180519065724.77">@iterator_to_context_set
def infer(self):
    for result_context in super(CompiledInstanceName, self).infer():
        is_function = result_context.api_type == 'function'
        if result_context.tree_node is not None and is_function:
            parent_context = result_context.parent_context
            while parent_context.is_class():
                parent_context = parent_context.parent_context

            yield BoundMethod(
                result_context.evaluator, self._instance, self.parent_context,
                parent_context, result_context.tree_node
            )
        else:
            if is_function:
                yield CompiledBoundMethod(result_context)
            else:
                yield result_context


</t>
<t tx="ekr.20180519065724.78">class CompiledInstanceClassFilter(compiled.CompiledObjectFilter):
    name_class = CompiledInstanceName

    @others
</t>
<t tx="ekr.20180519065724.79">def __init__(self, evaluator, instance, compiled_object):
    super(CompiledInstanceClassFilter, self).__init__(
        evaluator,
        compiled_object,
        is_instance=True,
    )
    self._instance = instance

</t>
<t tx="ekr.20180519065724.8">class AsyncBase(BuiltinOverwrite):
    @others
</t>
<t tx="ekr.20180519065724.80">def _create_name(self, name):
    return self.name_class(
        self._evaluator, self._instance, self._compiled_object, name)


</t>
<t tx="ekr.20180519065724.81">class BoundMethod(FunctionContext):
    @others
</t>
<t tx="ekr.20180519065724.82">def __init__(self, evaluator, instance, class_context, *args, **kwargs):
    super(BoundMethod, self).__init__(evaluator, *args, **kwargs)
    self._instance = instance
    self._class_context = class_context

</t>
<t tx="ekr.20180519065724.83">def get_function_execution(self, arguments=None):
    if arguments is None:
        arguments = AnonymousArguments()
        return AnonymousInstanceFunctionExecution(
            self._instance, self.parent_context, self, arguments)
    else:
        return InstanceFunctionExecution(
            self._instance, self.parent_context, self, arguments)


</t>
<t tx="ekr.20180519065724.84">class CompiledBoundMethod(compiled.CompiledObject):
    @others
</t>
<t tx="ekr.20180519065724.85">def __init__(self, func):
    super(CompiledBoundMethod, self).__init__(
        func.evaluator, func.access_handle, func.parent_context, func.tree_node)

</t>
<t tx="ekr.20180519065724.86">def get_param_names(self):
    return list(super(CompiledBoundMethod, self).get_param_names())[1:]


</t>
<t tx="ekr.20180519065724.87">class InstanceNameDefinition(filters.TreeNameDefinition):
    @others
</t>
<t tx="ekr.20180519065724.88">def infer(self):
    return super(InstanceNameDefinition, self).infer()


</t>
<t tx="ekr.20180519065724.89">class SelfName(filters.TreeNameDefinition):
    """
    This name calculates the parent_context lazily.
    """
    @others
</t>
<t tx="ekr.20180519065724.9">def __init__(self, evaluator, func_execution_context):
    super(AsyncBase, self).__init__(evaluator)
    self.func_execution_context = func_execution_context

</t>
<t tx="ekr.20180519065724.90">def __init__(self, instance, class_context, tree_name):
    self._instance = instance
    self.class_context = class_context
    self.tree_name = tree_name

</t>
<t tx="ekr.20180519065724.91">@property
def parent_context(self):
    return self._instance.create_instance_context(self.class_context, self.tree_name)


</t>
<t tx="ekr.20180519065724.92">class LazyInstanceClassName(SelfName):
    @others
</t>
<t tx="ekr.20180519065724.93">@iterator_to_context_set
def infer(self):
    for result_context in super(LazyInstanceClassName, self).infer():
        if isinstance(result_context, FunctionContext):
            # Classes are never used to resolve anything within the
            # functions. Only other functions and modules will resolve
            # those things.
            parent_context = result_context.parent_context
            while parent_context.is_class():
                parent_context = parent_context.parent_context

            yield BoundMethod(
                result_context.evaluator, self._instance, self.class_context,
                parent_context, result_context.tree_node
            )
        else:
            for c in apply_py__get__(result_context, self._instance):
                yield c


</t>
<t tx="ekr.20180519065724.94">class InstanceClassFilter(filters.ParserTreeFilter):
    name_class = LazyInstanceClassName

    @others
</t>
<t tx="ekr.20180519065724.95">def __init__(self, evaluator, context, class_context, origin_scope):
    super(InstanceClassFilter, self).__init__(
        evaluator=evaluator,
        context=context,
        node_context=class_context,
        origin_scope=origin_scope
    )
    self._class_context = class_context

</t>
<t tx="ekr.20180519065724.96">def _equals_origin_scope(self):
    node = self._origin_scope
    while node is not None:
        if node == self._parser_scope or node == self.context:
            return True
        node = get_parent_scope(node)
    return False

</t>
<t tx="ekr.20180519065724.97">def _access_possible(self, name):
    return not name.value.startswith('__') or name.value.endswith('__') \
        or self._equals_origin_scope()

</t>
<t tx="ekr.20180519065724.98">def _filter(self, names):
    names = super(InstanceClassFilter, self)._filter(names)
    return [name for name in names if self._access_possible(name)]

</t>
<t tx="ekr.20180519065724.99">def _convert_names(self, names):
    return [self.name_class(self.context, self._class_context, name) for name in names]


</t>
<t tx="ekr.20180519065831.1">Refresh from disk fixed the following problems:

importing directory: C:\Anaconda3\Lib\site-packages\jedi
@auto failed: cache.py
inserting @ignore

@auto failed: utils.py
inserting @ignore</t>
<t tx="ekr.20180519070853.10">def save_module(hashed_grammar, path, module, lines, pickling=True, cache_path=None):
    try:
        p_time = None if path is None else os.path.getmtime(path)
    except OSError:
        p_time = None
        pickling = False

    item = _NodeCacheItem(module, lines, p_time)
    parser_cache.setdefault(hashed_grammar, {})[path] = item
    if pickling and path is not None:
        _save_to_file_system(hashed_grammar, path, item, cache_path=cache_path)


</t>
<t tx="ekr.20180519070853.100">def __init__(self, type, value, start_pos, prefix=''):
    super(TypedLeaf, self).__init__(value, start_pos, prefix)
    self.type = type


</t>
<t tx="ekr.20180519070853.101">class BaseNode(NodeOrLeaf):
    """
    The super class for all nodes.
    A node has children, a type and possibly a parent node.
    """
    __slots__ = ('children', 'parent')
    type = None

    @others
</t>
<t tx="ekr.20180519070853.102">def __init__(self, children):
    for c in children:
        c.parent = self
    self.children = children
    """
    A list of :class:`NodeOrLeaf` child nodes.
    """
    self.parent = None
    '''
    The parent :class:`BaseNode` of this leaf.
    None if this is the root node.
    '''

</t>
<t tx="ekr.20180519070853.103">@property
def start_pos(self):
    return self.children[0].start_pos

</t>
<t tx="ekr.20180519070853.104">def get_start_pos_of_prefix(self):
    return self.children[0].get_start_pos_of_prefix()

</t>
<t tx="ekr.20180519070853.105">@property
def end_pos(self):
    return self.children[-1].end_pos

</t>
<t tx="ekr.20180519070853.106">def _get_code_for_children(self, children, include_prefix):
    if include_prefix:
        return "".join(c.get_code() for c in children)
    else:
        first = children[0].get_code(include_prefix=False)
        return first + "".join(c.get_code() for c in children[1:])

</t>
<t tx="ekr.20180519070853.107">def get_code(self, include_prefix=True):
    return self._get_code_for_children(self.children, include_prefix)

</t>
<t tx="ekr.20180519070853.108">def get_leaf_for_position(self, position, include_prefixes=False):
    """
    Get the :py:class:`parso.tree.Leaf` at ``position``

    :param tuple position: A position tuple, row, column. Rows start from 1
    :param bool include_prefixes: If ``False``, ``None`` will be returned if ``position`` falls
        on whitespace or comments before a leaf
    :return: :py:class:`parso.tree.Leaf` at ``position``, or ``None``
    """
    def binary_search(lower, upper):
        if lower == upper:
            element = self.children[lower]
            if not include_prefixes and position &lt; element.start_pos:
                # We're on a prefix.
                return None
            # In case we have prefixes, a leaf always matches
            try:
                return element.get_leaf_for_position(position, include_prefixes)
            except AttributeError:
                return element


        index = int((lower + upper) / 2)
        element = self.children[index]
        if position &lt;= element.end_pos:
            return binary_search(lower, index)
        else:
            return binary_search(index + 1, upper)

    if not ((1, 0) &lt;= position &lt;= self.children[-1].end_pos):
        raise ValueError('Please provide a position that exists within this node.')
    return binary_search(0, len(self.children) - 1)

</t>
<t tx="ekr.20180519070853.109">def get_first_leaf(self):
    return self.children[0].get_first_leaf()

</t>
<t tx="ekr.20180519070853.11">def _save_to_file_system(hashed_grammar, path, item, cache_path=None):
    with open(_get_hashed_path(hashed_grammar, path, cache_path=cache_path), 'wb') as f:
        pickle.dump(item, f, pickle.HIGHEST_PROTOCOL)


</t>
<t tx="ekr.20180519070853.110">def get_last_leaf(self):
    return self.children[-1].get_last_leaf()

</t>
<t tx="ekr.20180519070853.111">@utf8_repr
def __repr__(self):
    code = self.get_code().replace('\n', ' ').strip()
    if not py_version &gt;= 30:
        code = code.encode(encoding, 'replace')
    return "&lt;%s: %s@%s,%s&gt;" % \
        (type(self).__name__, code, self.start_pos[0], self.start_pos[1])


</t>
<t tx="ekr.20180519070853.112">class Node(BaseNode):
    """Concrete implementation for interior nodes."""
    __slots__ = ('type',)

    @others
</t>
<t tx="ekr.20180519070853.113">def __init__(self, type, children):
    super(Node, self).__init__(children)
    self.type = type

</t>
<t tx="ekr.20180519070853.114">def __repr__(self):
    return "%s(%s, %r)" % (self.__class__.__name__, self.type, self.children)


</t>
<t tx="ekr.20180519070853.115">class ErrorNode(BaseNode):
    """
    A node that contains valid nodes/leaves that we're follow by a token that
    was invalid. This basically means that the leaf after this node is where
    Python would mark a syntax error.
    """
    __slots__ = ()
    type = 'error_node'


</t>
<t tx="ekr.20180519070853.116">class ErrorLeaf(Leaf):
    """
    A leaf that is either completely invalid in a language (like `$` in Python)
    or is invalid at that position. Like the star in `1 +* 1`.
    """
    __slots__ = ('original_type',)
    type = 'error_leaf'

    @others
</t>
<t tx="ekr.20180519070853.117">def __init__(self, original_type, value, start_pos, prefix=''):
    super(ErrorLeaf, self).__init__(value, start_pos, prefix)
    self.original_type = original_type

</t>
<t tx="ekr.20180519070853.118">def __repr__(self):
    return "&lt;%s: %s:%s, %s&gt;" % \
        (type(self).__name__, self.original_type, repr(self.value), self.start_pos)
</t>
<t tx="ekr.20180519070853.119">@path C:/Anaconda3/Lib/site-packages/parso/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070853.12">def clear_cache(cache_path=None):
    if cache_path is None:
        cache_path = _default_cache_path
    shutil.rmtree(cache_path)
    parser_cache.clear()


</t>
<t tx="ekr.20180519070853.120">from collections import namedtuple
import re
import sys
from ast import literal_eval

from parso._compatibility import unicode, total_ordering


Version = namedtuple('Version', 'major, minor, micro')


</t>
<t tx="ekr.20180519070853.121">def split_lines(string, keepends=False):
    r"""
    Intended for Python code. In contrast to Python's :py:meth:`str.splitlines`,
    looks at form feeds and other special characters as normal text. Just
    splits ``\n`` and ``\r\n``.
    Also different: Returns ``[""]`` for an empty string input.

    In Python 2.7 form feeds are used as normal characters when using
    str.splitlines. However in Python 3 somewhere there was a decision to split
    also on form feeds.
    """
    if keepends:
        lst = string.splitlines(True)

        # We have to merge lines that were broken by form feed characters.
        merge = []
        for i, line in enumerate(lst):
            if line.endswith('\f'):
                merge.append(i)

        for index in reversed(merge):
            try:
                lst[index] = lst[index] + lst[index + 1]
                del lst[index + 1]
            except IndexError:
                # index + 1 can be empty and therefore there's no need to
                # merge.
                pass

        # The stdlib's implementation of the end is inconsistent when calling
        # it with/without keepends. One time there's an empty string in the
        # end, one time there's none.
        if string.endswith('\n') or string == '':
            lst.append('')
        return lst
    else:
        return re.split('\n|\r\n', string)


</t>
<t tx="ekr.20180519070853.122">def python_bytes_to_unicode(source, encoding='utf-8', errors='strict'):
    """
    Checks for unicode BOMs and PEP 263 encoding declarations. Then returns a
    unicode object like in :py:meth:`bytes.decode`.

    :param encoding: See :py:meth:`bytes.decode` documentation.
    :param errors: See :py:meth:`bytes.decode` documentation. ``errors`` can be
        ``'strict'``, ``'replace'`` or ``'ignore'``.
    """
    def detect_encoding():
        """
        For the implementation of encoding definitions in Python, look at:
        - http://www.python.org/dev/peps/pep-0263/
        - http://docs.python.org/2/reference/lexical_analysis.html#encoding-declarations
        """
        byte_mark = literal_eval(r"b'\xef\xbb\xbf'")
        if source.startswith(byte_mark):
            # UTF-8 byte-order mark
            return 'utf-8'

        first_two_lines = re.match(br'(?:[^\n]*\n){0,2}', source).group(0)
        possible_encoding = re.search(br"coding[=:]\s*([-\w.]+)",
                                      first_two_lines)
        if possible_encoding:
            return possible_encoding.group(1)
        else:
            # the default if nothing else has been set -&gt; PEP 263
            return encoding

    if isinstance(source, unicode):
        # only cast str/bytes
        return source

    encoding = detect_encoding()
    if not isinstance(encoding, unicode):
        encoding = unicode(encoding, 'utf-8', 'replace')

    # Cast to unicode
    return unicode(source, encoding, errors)


</t>
<t tx="ekr.20180519070853.123">def version_info():
    """
    Returns a namedtuple of parso's version, similar to Python's
    ``sys.version_info``.
    """
    from parso import __version__
    tupl = re.findall(r'[a-z]+|\d+', __version__)
    return Version(*[x if i == 3 else int(x) for i, x in enumerate(tupl)])


</t>
<t tx="ekr.20180519070853.124">def _parse_version(version):
    match = re.match(r'(\d+)(?:\.(\d)(?:\.\d+)?)?$', version)
    if match is None:
        raise ValueError('The given version is not in the right format. '
                         'Use something like "3.2" or "3".')

    major = int(match.group(1))
    minor = match.group(2)
    if minor is None:
        # Use the latest Python in case it's not exactly defined, because the
        # grammars are typically backwards compatible?
        if major == 2:
            minor = "7"
        elif major == 3:
            minor = "6"
        else:
            raise NotImplementedError("Sorry, no support yet for those fancy new/old versions.")
    minor = int(minor)
    return PythonVersionInfo(major, minor)


</t>
<t tx="ekr.20180519070853.125">@total_ordering
class PythonVersionInfo(namedtuple('Version', 'major, minor')):
    @others
</t>
<t tx="ekr.20180519070853.126">def __gt__(self, other):
    if isinstance(other, tuple):
        if len(other) != 2:
            raise ValueError("Can only compare to tuples of length 2.")
        return (self.major, self.minor) &gt; other
    super(PythonVersionInfo, self).__gt__(other)

    return (self.major, self.minor)

</t>
<t tx="ekr.20180519070853.127">def __eq__(self, other):
    if isinstance(other, tuple):
        if len(other) != 2:
            raise ValueError("Can only compare to tuples of length 2.")
        return (self.major, self.minor) == other
    super(PythonVersionInfo, self).__eq__(other)

</t>
<t tx="ekr.20180519070853.128">def __ne__(self, other):
    return not self.__eq__(other)


</t>
<t tx="ekr.20180519070853.129">def parse_version_string(version=None):
    """
    Checks for a valid version number (e.g. `3.2` or `2.7.1` or `3`) and
    returns a corresponding version info that is always two characters long in
    decimal.
    """
    if version is None:
        version = '%s.%s' % sys.version_info[:2]
    if not isinstance(version, (unicode, str)):
        raise TypeError("version must be a string like 3.2.")

    return _parse_version(version)
</t>
<t tx="ekr.20180519070853.13">def _get_hashed_path(hashed_grammar, path, cache_path=None):
    directory = _get_cache_directory_path(cache_path=cache_path)

    file_hash = hashlib.sha256(path.encode("utf-8")).hexdigest()
    return os.path.join(directory, '%s-%s.pkl' % (hashed_grammar, file_hash))


</t>
<t tx="ekr.20180519070853.130">@path C:/Anaconda3/Lib/site-packages/parso/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070853.131">"""
To ensure compatibility from Python ``2.6`` - ``3.3``, a module has been
created. Clearly there is huge need to use conforming syntax.
"""
import sys
import platform

# Cannot use sys.version.major and minor names, because in Python 2.6 it's not
# a namedtuple.
py_version = int(str(sys.version_info[0]) + str(sys.version_info[1]))

# unicode function
try:
    unicode = unicode
except NameError:
    unicode = str

is_pypy = platform.python_implementation() == 'PyPy'


</t>
<t tx="ekr.20180519070853.132">def use_metaclass(meta, *bases):
    """ Create a class with a metaclass. """
    if not bases:
        bases = (object,)
    return meta("HackClass", bases, {})


try:
    encoding = sys.stdout.encoding
    if encoding is None:
        encoding = 'utf-8'
except AttributeError:
    encoding = 'ascii'


</t>
<t tx="ekr.20180519070853.133">def u(string):
    """Cast to unicode DAMMIT!
    Written because Python2 repr always implicitly casts to a string, so we
    have to cast back to a unicode (and we know that we always deal with valid
    unicode, because we check that in the beginning).
    """
    if py_version &gt;= 30:
        return str(string)

    if not isinstance(string, unicode):
        return unicode(str(string), 'UTF-8')
    return string


try:
    FileNotFoundError = FileNotFoundError
except NameError:
    FileNotFoundError = IOError


</t>
<t tx="ekr.20180519070853.134">def utf8_repr(func):
    """
    ``__repr__`` methods in Python 2 don't allow unicode objects to be
    returned. Therefore cast them to utf-8 bytes in this decorator.
    """
    def wrapper(self):
        result = func(self)
        if isinstance(result, unicode):
            return result.encode('utf-8')
        else:
            return result

    if py_version &gt;= 30:
        return func
    else:
        return wrapper


try:
    from functools import total_ordering
except ImportError:
    # Python 2.6
    def total_ordering(cls):
        """Class decorator that fills in missing ordering methods"""
        convert = {
            '__lt__': [('__gt__', lambda self, other: not (self &lt; other or self == other)),
                       ('__le__', lambda self, other: self &lt; other or self == other),
                       ('__ge__', lambda self, other: not self &lt; other)],
            '__le__': [('__ge__', lambda self, other: not self &lt;= other or self == other),
                       ('__lt__', lambda self, other: self &lt;= other and not self == other),
                       ('__gt__', lambda self, other: not self &lt;= other)],
            '__gt__': [('__lt__', lambda self, other: not (self &gt; other or self == other)),
                       ('__ge__', lambda self, other: self &gt; other or self == other),
                       ('__le__', lambda self, other: not self &gt; other)],
            '__ge__': [('__le__', lambda self, other: (not self &gt;= other) or self == other),
                       ('__gt__', lambda self, other: self &gt;= other and not self == other),
                       ('__lt__', lambda self, other: not self &gt;= other)]
        }
        roots = set(dir(cls)) &amp; set(convert)
        if not roots:
            raise ValueError('must define at least one ordering operation: &lt; &gt; &lt;= &gt;=')
        root = max(roots)       # prefer __lt__ to __le__ to __gt__ to __ge__
        for opname, opfunc in convert[root]:
            if opname not in roots:
                opfunc.__name__ = opname
                opfunc.__doc__ = getattr(int, opname).__doc__
                setattr(cls, opname, opfunc)
        return cls
</t>
<t tx="ekr.20180519070853.135">@path C:/Anaconda3/Lib/site-packages/parso/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070853.136">r"""
Parso is a Python parser that supports error recovery and round-trip parsing
for different Python versions (in multiple Python versions). Parso is also able
to list multiple syntax errors in your python file.

Parso has been battle-tested by jedi_. It was pulled out of jedi to be useful
for other projects as well.

Parso consists of a small API to parse Python and analyse the syntax tree.

.. _jedi: https://github.com/davidhalter/jedi

A simple example:

&gt;&gt;&gt; import parso
&gt;&gt;&gt; module = parso.parse('hello + 1', version="3.6")
&gt;&gt;&gt; expr = module.children[0]
&gt;&gt;&gt; expr
PythonNode(arith_expr, [&lt;Name: hello@1,0&gt;, &lt;Operator: +&gt;, &lt;Number: 1&gt;])
&gt;&gt;&gt; print(expr.get_code())
hello + 1
&gt;&gt;&gt; name = expr.children[0]
&gt;&gt;&gt; name
&lt;Name: hello@1,0&gt;
&gt;&gt;&gt; name.end_pos
(1, 5)
&gt;&gt;&gt; expr.end_pos
(1, 9)

To list multiple issues:

&gt;&gt;&gt; grammar = parso.load_grammar()
&gt;&gt;&gt; module = grammar.parse('foo +\nbar\ncontinue')
&gt;&gt;&gt; error1, error2 = grammar.iter_errors(module)
&gt;&gt;&gt; error1.message
'SyntaxError: invalid syntax'
&gt;&gt;&gt; error2.message
"SyntaxError: 'continue' not properly in loop"
"""

from parso.parser import ParserSyntaxError
from parso.grammar import Grammar, load_grammar
from parso.utils import split_lines, python_bytes_to_unicode


__version__ = '0.2.0'


</t>
<t tx="ekr.20180519070853.137">def parse(code=None, **kwargs):
    """
    A utility function to avoid loading grammars.
    Params are documented in :py:meth:`parso.Grammar.parse`.

    :param str version: The version used by :py:func:`parso.load_grammar`.
    """
    version = kwargs.pop('version', None)
    grammar = load_grammar(version=version)
    return grammar.parse(code, **kwargs)
</t>
<t tx="ekr.20180519070853.138"></t>
<t tx="ekr.20180519070853.14">def _get_cache_directory_path(cache_path=None):
    if cache_path is None:
        cache_path = _default_cache_path
    directory = os.path.join(cache_path, _VERSION_TAG)
    if not os.path.exists(directory):
        os.makedirs(directory)
    return directory
</t>
<t tx="ekr.20180519070853.141"></t>
<t tx="ekr.20180519070853.142"></t>
<t tx="ekr.20180519070853.144"></t>
<t tx="ekr.20180519070853.15">@path C:/Anaconda3/Lib/site-packages/parso/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070853.16">import hashlib
import os

from parso._compatibility import FileNotFoundError, is_pypy
from parso.pgen2.pgen import generate_grammar
from parso.utils import split_lines, python_bytes_to_unicode, parse_version_string
from parso.python.diff import DiffParser
from parso.python.tokenize import tokenize_lines, tokenize
from parso.python import token
from parso.cache import parser_cache, load_module, save_module
from parso.parser import BaseParser
from parso.python.parser import Parser as PythonParser
from parso.python.errors import ErrorFinderConfig
from parso.python import pep8

_loaded_grammars = {}


</t>
<t tx="ekr.20180519070853.17">class Grammar(object):
    """
    :py:func:`parso.load_grammar` returns instances of this class.

    Creating custom grammars by calling this is not supported, yet.
    """
    #:param text: A BNF representation of your grammar.
    _error_normalizer_config = None
    _token_namespace = None
    _default_normalizer_config = pep8.PEP8NormalizerConfig()

    @others
</t>
<t tx="ekr.20180519070853.178"></t>
<t tx="ekr.20180519070853.18">def __init__(self, text, tokenizer, parser=BaseParser, diff_parser=None):
    self._pgen_grammar = generate_grammar(
        text,
        token_namespace=self._get_token_namespace()
    )
    self._parser = parser
    self._tokenizer = tokenizer
    self._diff_parser = diff_parser
    self._hashed = hashlib.sha256(text.encode("utf-8")).hexdigest()

</t>
<t tx="ekr.20180519070853.19">def parse(self, code=None, **kwargs):
    """
    If you want to parse a Python file you want to start here, most likely.

    If you need finer grained control over the parsed instance, there will be
    other ways to access it.

    :param str code: A unicode or bytes string. When it's not possible to
        decode bytes to a string, returns a
        :py:class:`UnicodeDecodeError`.
    :param bool error_recovery: If enabled, any code will be returned. If
        it is invalid, it will be returned as an error node. If disabled,
        you will get a ParseError when encountering syntax errors in your
        code.
    :param str start_symbol: The grammar symbol that you want to parse. Only
        allowed to be used when error_recovery is False.
    :param str path: The path to the file you want to open. Only needed for caching.
    :param bool cache: Keeps a copy of the parser tree in RAM and on disk
        if a path is given. Returns the cached trees if the corresponding
        files on disk have not changed.
    :param bool diff_cache: Diffs the cached python module against the new
        code and tries to parse only the parts that have changed. Returns
        the same (changed) module that is found in cache. Using this option
        requires you to not do anything anymore with the cached modules
        under that path, because the contents of it might change. This
        option is still somewhat experimental. If you want stability,
        please don't use it.
    :param bool cache_path: If given saves the parso cache in this
        directory. If not given, defaults to the default cache places on
        each platform.

    :return: A subclass of :py:class:`parso.tree.NodeOrLeaf`. Typically a
        :py:class:`parso.python.tree.Module`.
    """
    if 'start_pos' in kwargs:
        raise TypeError("parse() got an unexpected keyword argument.")
    return self._parse(code=code, **kwargs)

</t>
<t tx="ekr.20180519070853.2"></t>
<t tx="ekr.20180519070853.20">def _parse(self, code=None, error_recovery=True, path=None,
           start_symbol=None, cache=False, diff_cache=False,
           cache_path=None, start_pos=(1, 0)):
    """
    Wanted python3.5 * operator and keyword only arguments. Therefore just
    wrap it all.
    start_pos here is just a parameter internally used. Might be public
    sometime in the future.
    """
    if code is None and path is None:
        raise TypeError("Please provide either code or a path.")

    if start_symbol is None:
        start_symbol = self._start_symbol

    if error_recovery and start_symbol != 'file_input':
        raise NotImplementedError("This is currently not implemented.")

    if cache and path is not None:
        module_node = load_module(self._hashed, path, cache_path=cache_path)
        if module_node is not None:
            return module_node

    if code is None:
        with open(path, 'rb') as f:
            code = f.read()

    code = python_bytes_to_unicode(code)

    lines = split_lines(code, keepends=True)
    if diff_cache:
        if self._diff_parser is None:
            raise TypeError("You have to define a diff parser to be able "
                            "to use this option.")
        try:
            module_cache_item = parser_cache[self._hashed][path]
        except KeyError:
            pass
        else:
            module_node = module_cache_item.node
            old_lines = module_cache_item.lines
            if old_lines == lines:
                return module_node

            new_node = self._diff_parser(
                self._pgen_grammar, self._tokenizer, module_node
            ).update(
                old_lines=old_lines,
                new_lines=lines
            )
            save_module(self._hashed, path, new_node, lines,
                        # Never pickle in pypy, it's slow as hell.
                        pickling=cache and not is_pypy,
                        cache_path=cache_path)
            return new_node

    tokens = self._tokenizer(lines, start_pos)

    p = self._parser(
        self._pgen_grammar,
        error_recovery=error_recovery,
        start_symbol=start_symbol
    )
    root_node = p.parse(tokens=tokens)

    if cache or diff_cache:
        save_module(self._hashed, path, root_node, lines,
                    # Never pickle in pypy, it's slow as hell.
                    pickling=cache and not is_pypy,
                    cache_path=cache_path)
    return root_node

</t>
<t tx="ekr.20180519070853.21">def _get_token_namespace(self):
    ns = self._token_namespace
    if ns is None:
        raise ValueError("The token namespace should be set.")
    return ns

</t>
<t tx="ekr.20180519070853.22">def iter_errors(self, node):
    """
    Given a :py:class:`parso.tree.NodeOrLeaf` returns a generator of
    :py:class:`parso.normalizer.Issue` objects. For Python this is
    a list of syntax/indentation errors.
    """
    if self._error_normalizer_config is None:
        raise ValueError("No error normalizer specified for this grammar.")

    return self._get_normalizer_issues(node, self._error_normalizer_config)

</t>
<t tx="ekr.20180519070853.23">def _get_normalizer(self, normalizer_config):
    if normalizer_config is None:
        normalizer_config = self._default_normalizer_config
        if normalizer_config is None:
            raise ValueError("You need to specify a normalizer, because "
                             "there's no default normalizer for this tree.")
    return normalizer_config.create_normalizer(self)

</t>
<t tx="ekr.20180519070853.24">def _normalize(self, node, normalizer_config=None):
    """
    TODO this is not public, yet.
    The returned code will be normalized, e.g. PEP8 for Python.
    """
    normalizer = self._get_normalizer(normalizer_config)
    return normalizer.walk(node)

</t>
<t tx="ekr.20180519070853.25">def _get_normalizer_issues(self, node, normalizer_config=None):
    normalizer = self._get_normalizer(normalizer_config)
    normalizer.walk(node)
    return normalizer.issues

</t>
<t tx="ekr.20180519070853.26">def __repr__(self):
    labels = self._pgen_grammar.number2symbol.values()
    txt = ' '.join(list(labels)[:3]) + ' ...'
    return '&lt;%s:%s&gt;' % (self.__class__.__name__, txt)


</t>
<t tx="ekr.20180519070853.27">class PythonGrammar(Grammar):
    _error_normalizer_config = ErrorFinderConfig()
    _token_namespace = token
    _start_symbol = 'file_input'

    @others
</t>
<t tx="ekr.20180519070853.28">def __init__(self, version_info, bnf_text):
    super(PythonGrammar, self).__init__(
        bnf_text,
        tokenizer=self._tokenize_lines,
        parser=PythonParser,
        diff_parser=DiffParser
    )
    self.version_info = version_info

</t>
<t tx="ekr.20180519070853.29">def _tokenize_lines(self, lines, start_pos):
    return tokenize_lines(lines, self.version_info, start_pos=start_pos)

</t>
<t tx="ekr.20180519070853.3">@path C:/Anaconda3/Lib/site-packages/parso/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070853.30">def _tokenize(self, code):
    # Used by Jedi.
    return tokenize(code, self.version_info)


</t>
<t tx="ekr.20180519070853.31">def load_grammar(**kwargs):
    """
    Loads a :py:class:`parso.Grammar`. The default version is the current Python
    version.

    :param str version: A python version string, e.g. ``version='3.3'``.
    """
    def load_grammar(language='python', version=None):
        if language == 'python':
            version_info = parse_version_string(version)

            file = os.path.join(
                'python',
                'grammar%s%s.txt' % (version_info.major, version_info.minor)
            )

            global _loaded_grammars
            path = os.path.join(os.path.dirname(__file__), file)
            try:
                return _loaded_grammars[path]
            except KeyError:
                try:
                    with open(path) as f:
                        bnf_text = f.read()

                    grammar = PythonGrammar(version_info, bnf_text)
                    return _loaded_grammars.setdefault(path, grammar)
                except FileNotFoundError:
                    message = "Python version %s is currently not supported." % version
                    raise NotImplementedError(message)
        else:
            raise NotImplementedError("No support for language %s." % language)

    return load_grammar(**kwargs)
</t>
<t tx="ekr.20180519070853.32">@path C:/Anaconda3/Lib/site-packages/parso/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070853.33">from contextlib import contextmanager

from parso._compatibility import use_metaclass


</t>
<t tx="ekr.20180519070853.34">class _NormalizerMeta(type):
    @others
</t>
<t tx="ekr.20180519070853.35">def __new__(cls, name, bases, dct):
    new_cls = type.__new__(cls, name, bases, dct)
    new_cls.rule_value_classes = {}
    new_cls.rule_type_classes = {}
    return new_cls


</t>
<t tx="ekr.20180519070853.36">class Normalizer(use_metaclass(_NormalizerMeta)):
    @others
</t>
<t tx="ekr.20180519070853.37">def __init__(self, grammar, config):
    self.grammar = grammar
    self._config = config
    self.issues = []

    self._rule_type_instances = self._instantiate_rules('rule_type_classes')
    self._rule_value_instances = self._instantiate_rules('rule_value_classes')

</t>
<t tx="ekr.20180519070853.38">def _instantiate_rules(self, attr):
    dct = {}
    for base in type(self).mro():
        rules_map = getattr(base, attr, {})
        for type_, rule_classes in rules_map.items():
            new = [rule_cls(self) for rule_cls in rule_classes]
            dct.setdefault(type_, []).extend(new)
    return dct

</t>
<t tx="ekr.20180519070853.39">def walk(self, node):
    self.initialize(node)
    value = self.visit(node)
    self.finalize()
    return value

</t>
<t tx="ekr.20180519070853.4">import time
import os
import sys
import hashlib
import gc
import shutil
import platform
import errno
import logging

try:
    import cPickle as pickle
except:
    import pickle

from parso._compatibility import FileNotFoundError

LOG = logging.getLogger(__name__)


_PICKLE_VERSION = 30
"""
Version number (integer) for file system cache.

Increment this number when there are any incompatible changes in
the parser tree classes.  For example, the following changes
are regarded as incompatible.

- A class name is changed.
- A class is moved to another module.
- A __slot__ of a class is changed.
"""

_VERSION_TAG = '%s-%s%s-%s' % (
    platform.python_implementation(),
    sys.version_info[0],
    sys.version_info[1],
    _PICKLE_VERSION
)
"""
Short name for distinguish Python implementations and versions.

It's like `sys.implementation.cache_tag` but for Python &lt; 3.3
we generate something similar.  See:
http://docs.python.org/3/library/sys.html#sys.implementation
"""

</t>
<t tx="ekr.20180519070853.40">def visit(self, node):
    try:
        children = node.children
    except AttributeError:
        return self.visit_leaf(node)
    else:
       with self.visit_node(node):
           return ''.join(self.visit(child) for child in children)

</t>
<t tx="ekr.20180519070853.41">@contextmanager
def visit_node(self, node):
    self._check_type_rules(node)
    yield

</t>
<t tx="ekr.20180519070853.42">def _check_type_rules(self, node):
    for rule in self._rule_type_instances.get(node.type, []):
        rule.feed_node(node)

</t>
<t tx="ekr.20180519070853.43">def visit_leaf(self, leaf):
    self._check_type_rules(leaf)

    for rule in self._rule_value_instances.get(leaf.value, []):
        rule.feed_node(leaf)

    return leaf.prefix + leaf.value

</t>
<t tx="ekr.20180519070853.44">def initialize(self, node):
    pass

</t>
<t tx="ekr.20180519070853.45">def finalize(self):
    pass

</t>
<t tx="ekr.20180519070853.46">def add_issue(self, node, code, message):
    issue = Issue(node, code, message)
    if issue not in self.issues:
        self.issues.append(issue)
    return True

</t>
<t tx="ekr.20180519070853.47">@classmethod
def register_rule(cls, **kwargs):
    """
    Use it as a class decorator::

        normalizer = Normalizer('grammar', 'config')
        @normalizer.register_rule(value='foo')
        class MyRule(Rule):
            error_code = 42
    """
    return cls._register_rule(**kwargs)

</t>
<t tx="ekr.20180519070853.48">@classmethod
def _register_rule(cls, value=None, values=(), type=None, types=()):
    values = list(values)
    types = list(types)
    if value is not None:
        values.append(value)
    if type is not None:
        types.append(type)

    if not values and not types:
        raise ValueError("You must register at least something.")

    def decorator(rule_cls):
        for v in values:
            cls.rule_value_classes.setdefault(v, []).append(rule_cls)
        for t in types:
            cls.rule_type_classes.setdefault(t, []).append(rule_cls)
        return rule_cls

    return decorator


</t>
<t tx="ekr.20180519070853.49">class NormalizerConfig(object):
    normalizer_class = Normalizer

    @others
</t>
<t tx="ekr.20180519070853.5">def _get_default_cache_path():
    if platform.system().lower() == 'windows':
        dir_ = os.path.join(os.getenv('LOCALAPPDATA') or '~', 'Parso', 'Parso')
    elif platform.system().lower() == 'darwin':
        dir_ = os.path.join('~', 'Library', 'Caches', 'Parso')
    else:
        dir_ = os.path.join(os.getenv('XDG_CACHE_HOME') or '~/.cache', 'parso')
    return os.path.expanduser(dir_)

_default_cache_path = _get_default_cache_path()
"""
The path where the cache is stored.

On Linux, this defaults to ``~/.cache/parso/``, on OS X to
``~/Library/Caches/Parso/`` and on Windows to ``%LOCALAPPDATA%\\Parso\\Parso\\``.
On Linux, if environment variable ``$XDG_CACHE_HOME`` is set,
``$XDG_CACHE_HOME/parso`` is used instead of the default one.
"""

parser_cache = {}


</t>
<t tx="ekr.20180519070853.50">def create_normalizer(self, grammar):
    if self.normalizer_class is None:
        return None

    return self.normalizer_class(grammar, self)


</t>
<t tx="ekr.20180519070853.51">class Issue(object):
    @others
</t>
<t tx="ekr.20180519070853.52">def __init__(self, node, code, message):
    self._node = node
    self.code = code
    """
    An integer code that stands for the type of error.
    """
    self.message = message
    """
    A message (string) for the issue.
    """
    self.start_pos = node.start_pos
    """
    The start position position of the error as a tuple (line, column). As
    always in |parso| the first line is 1 and the first column 0.
    """

</t>
<t tx="ekr.20180519070853.53">def __eq__(self, other):
    return self.start_pos == other.start_pos and self.code == other.code

</t>
<t tx="ekr.20180519070853.54">def __ne__(self, other):
    return not self.__eq__(other)

</t>
<t tx="ekr.20180519070853.55">def __hash__(self):
    return hash((self.code, self.start_pos))

</t>
<t tx="ekr.20180519070853.56">def __repr__(self):
    return '&lt;%s: %s&gt;' % (self.__class__.__name__, self.code)



</t>
<t tx="ekr.20180519070853.57">class Rule(object):
    code = None
    message = None

    @others
</t>
<t tx="ekr.20180519070853.58">def __init__(self, normalizer):
    self._normalizer = normalizer

</t>
<t tx="ekr.20180519070853.59">def is_issue(self, node):
    raise NotImplementedError()

</t>
<t tx="ekr.20180519070853.6">class _NodeCacheItem(object):
    @others
</t>
<t tx="ekr.20180519070853.60">def get_node(self, node):
    return node

</t>
<t tx="ekr.20180519070853.61">def _get_message(self, message):
    if message is None:
        message = self.message
        if message is None:
            raise ValueError("The message on the class is not set.")
    return message

</t>
<t tx="ekr.20180519070853.62">def add_issue(self, node, code=None, message=None):
    if code is None:
        code = self.code
        if code is None:
            raise ValueError("The error code on the class is not set.")

    message = self._get_message(message)

    self._normalizer.add_issue(node, code, message)

</t>
<t tx="ekr.20180519070853.63">def feed_node(self, node):
    if self.is_issue(node):
        issue_node = self.get_node(node)
        self.add_issue(issue_node)
</t>
<t tx="ekr.20180519070853.64">@path C:/Anaconda3/Lib/site-packages/parso/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070853.65">"""
The ``Parser`` tries to convert the available Python code in an easy to read
format, something like an abstract syntax tree. The classes who represent this
tree, are sitting in the :mod:`parso.tree` module.

The Python module ``tokenize`` is a very important part in the ``Parser``,
because it splits the code into different words (tokens).  Sometimes it looks a
bit messy. Sorry for that! You might ask now: "Why didn't you use the ``ast``
module for this? Well, ``ast`` does a very good job understanding proper Python
code, but fails to work as soon as there's a single line of broken code.

There's one important optimization that needs to be known: Statements are not
being parsed completely. ``Statement`` is just a representation of the tokens
within the statement. This lowers memory usage and cpu time and reduces the
complexity of the ``Parser`` (there's another parser sitting inside
``Statement``, which produces ``Array`` and ``Call``).
"""
from parso import tree
from parso.pgen2.parse import PgenParser


</t>
<t tx="ekr.20180519070853.66">class ParserSyntaxError(Exception):
    """
    Contains error information about the parser tree.

    May be raised as an exception.
    """
    @others
</t>
<t tx="ekr.20180519070853.67">def __init__(self, message, error_leaf):
    self.message = message
    self.error_leaf = error_leaf


</t>
<t tx="ekr.20180519070853.68">class BaseParser(object):
    node_map = {}
    default_node = tree.Node

    leaf_map = {
    }
    default_leaf = tree.Leaf

    @others
</t>
<t tx="ekr.20180519070853.69">def __init__(self, pgen_grammar, start_symbol='file_input', error_recovery=False):
    self._pgen_grammar = pgen_grammar
    self._start_symbol = start_symbol
    self._error_recovery = error_recovery

</t>
<t tx="ekr.20180519070853.7">def __init__(self, node, lines, change_time=None):
    self.node = node
    self.lines = lines
    if change_time is None:
        change_time = time.time()
    self.change_time = change_time


</t>
<t tx="ekr.20180519070853.70">def parse(self, tokens):
    start_number = self._pgen_grammar.symbol2number[self._start_symbol]
    self.pgen_parser = PgenParser(
        self._pgen_grammar, self.convert_node, self.convert_leaf,
        self.error_recovery, start_number
    )

    node = self.pgen_parser.parse(tokens)
    # The stack is empty now, we don't need it anymore.
    del self.pgen_parser
    return node

</t>
<t tx="ekr.20180519070853.71">def error_recovery(self, pgen_grammar, stack, arcs, typ, value, start_pos, prefix,
                   add_token_callback):
    if self._error_recovery:
        raise NotImplementedError("Error Recovery is not implemented")
    else:
        error_leaf = tree.ErrorLeaf('TODO %s' % typ, value, start_pos, prefix)
        raise ParserSyntaxError('SyntaxError: invalid syntax', error_leaf)

</t>
<t tx="ekr.20180519070853.72">def convert_node(self, pgen_grammar, type_, children):
    # TODO REMOVE symbol, we don't want type here.
    symbol = pgen_grammar.number2symbol[type_]
    try:
        return self.node_map[symbol](children)
    except KeyError:
        return self.default_node(symbol, children)

</t>
<t tx="ekr.20180519070853.73">def convert_leaf(self, pgen_grammar, type_, value, prefix, start_pos):
    try:
        return self.leaf_map[type_](value, start_pos, prefix)
    except KeyError:
        return self.default_leaf(value, start_pos, prefix)
</t>
<t tx="ekr.20180519070853.74">@path C:/Anaconda3/Lib/site-packages/parso/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070853.75">from abc import abstractmethod, abstractproperty
from parso._compatibility import utf8_repr, encoding, py_version


</t>
<t tx="ekr.20180519070853.76">def search_ancestor(node, *node_types):
    """
    Recursively looks at the parents of a node and returns the first found node
    that matches node_types. Returns ``None`` if no matching node is found.

    :param node: The ancestors of this node will be checked.
    :param node_types: type names that are searched for.
    :type node_types: tuple of str
    """
    while True:
        node = node.parent
        if node is None or node.type in node_types:
            return node


</t>
<t tx="ekr.20180519070853.77">class NodeOrLeaf(object):
    """
    The base class for nodes and leaves.
    """
    __slots__ = ()
    type = None
    '''
    The type is a string that typically matches the types of the grammar file.
    '''

    @others
</t>
<t tx="ekr.20180519070853.78">def get_root_node(self):
    """
    Returns the root node of a parser tree. The returned node doesn't have
    a parent node like all the other nodes/leaves.
    """
    scope = self
    while scope.parent is not None:
        scope = scope.parent
    return scope

</t>
<t tx="ekr.20180519070853.79">def get_next_sibling(self):
    """
    Returns the node immediately following this node in this parent's
    children list. If this node does not have a next sibling, it is None
    """
    # Can't use index(); we need to test by identity
    for i, child in enumerate(self.parent.children):
        if child is self:
            try:
                return self.parent.children[i + 1]
            except IndexError:
                return None

</t>
<t tx="ekr.20180519070853.8">def load_module(hashed_grammar, path, cache_path=None):
    """
    Returns a module or None, if it fails.
    """
    try:
        p_time = os.path.getmtime(path)
    except FileNotFoundError:
        return None

    try:
        module_cache_item = parser_cache[hashed_grammar][path]
        if p_time &lt;= module_cache_item.change_time:
            return module_cache_item.node
    except KeyError:
        return _load_from_file_system(hashed_grammar, path, p_time, cache_path=cache_path)


</t>
<t tx="ekr.20180519070853.80">def get_previous_sibling(self):
    """
    Returns the node immediately preceding this node in this parent's
    children list. If this node does not have a previous sibling, it is
    None.
    """
    # Can't use index(); we need to test by identity
    for i, child in enumerate(self.parent.children):
        if child is self:
            if i == 0:
                return None
            return self.parent.children[i - 1]

</t>
<t tx="ekr.20180519070853.81">def get_previous_leaf(self):
    """
    Returns the previous leaf in the parser tree.
    Returns `None` if this is the first element in the parser tree.
    """
    node = self
    while True:
        c = node.parent.children
        i = c.index(node)
        if i == 0:
            node = node.parent
            if node.parent is None:
                return None
        else:
            node = c[i - 1]
            break

    while True:
        try:
            node = node.children[-1]
        except AttributeError:  # A Leaf doesn't have children.
            return node

</t>
<t tx="ekr.20180519070853.82">def get_next_leaf(self):
    """
    Returns the next leaf in the parser tree.
    Returns None if this is the last element in the parser tree.
    """
    node = self
    while True:
        c = node.parent.children
        i = c.index(node)
        if i == len(c) - 1:
            node = node.parent
            if node.parent is None:
                return None
        else:
            node = c[i + 1]
            break

    while True:
        try:
            node = node.children[0]
        except AttributeError:  # A Leaf doesn't have children.
            return node

</t>
<t tx="ekr.20180519070853.83">@abstractproperty
def start_pos(self):
    """
    Returns the starting position of the prefix as a tuple, e.g. `(3, 4)`.

    :return tuple of int: (line, column)
    """

</t>
<t tx="ekr.20180519070853.84">@abstractproperty
def end_pos(self):
    """
    Returns the end position of the prefix as a tuple, e.g. `(3, 4)`.

    :return tuple of int: (line, column)
    """

</t>
<t tx="ekr.20180519070853.85">@abstractmethod
def get_start_pos_of_prefix(self):
    """
    Returns the start_pos of the prefix. This means basically it returns
    the end_pos of the last prefix. The `get_start_pos_of_prefix()` of the
    prefix `+` in `2 + 1` would be `(1, 1)`, while the start_pos is
    `(1, 2)`.

    :return tuple of int: (line, column)
    """

</t>
<t tx="ekr.20180519070853.86">@abstractmethod
def get_first_leaf(self):
    """
    Returns the first leaf of a node or itself if this is a leaf.
    """

</t>
<t tx="ekr.20180519070853.87">@abstractmethod
def get_last_leaf(self):
    """
    Returns the last leaf of a node or itself if this is a leaf.
    """

</t>
<t tx="ekr.20180519070853.88">@abstractmethod
def get_code(self, include_prefix=True):
    """
    Returns the code that was input the input for the parser for this node.

    :param include_prefix: Removes the prefix (whitespace and comments) of
        e.g. a statement.
    """


</t>
<t tx="ekr.20180519070853.89">class Leaf(NodeOrLeaf):
    '''
    Leafs are basically tokens with a better API. Leafs exactly know where they
    were defined and what text preceeds them.
    '''
    __slots__ = ('value', 'parent', 'line', 'column', 'prefix')

    @others
</t>
<t tx="ekr.20180519070853.9">def _load_from_file_system(hashed_grammar, path, p_time, cache_path=None):
    cache_path = _get_hashed_path(hashed_grammar, path, cache_path=cache_path)
    try:
        try:
            if p_time &gt; os.path.getmtime(cache_path):
                # Cache is outdated
                return None
        except OSError as e:
            if e.errno == errno.ENOENT:
                # In Python 2 instead of an IOError here we get an OSError.
                raise FileNotFoundError
            else:
                raise

        with open(cache_path, 'rb') as f:
            gc.disable()
            try:
                module_cache_item = pickle.load(f)
            finally:
                gc.enable()
    except FileNotFoundError:
        return None
    else:
        parser_cache.setdefault(hashed_grammar, {})[path] = module_cache_item
        LOG.debug('pickle loaded: %s', path)
        return module_cache_item.node


</t>
<t tx="ekr.20180519070853.90">def __init__(self, value, start_pos, prefix=''):
    self.value = value
    '''
    :py:func:`str` The value of the current token.
    '''
    self.start_pos = start_pos
    self.prefix = prefix
    '''
    :py:func:`str` Typically a mixture of whitespace and comments. Stuff
    that is syntactically irrelevant for the syntax tree.
    '''
    self.parent = None
    '''
    The parent :class:`BaseNode` of this leaf.
    '''

</t>
<t tx="ekr.20180519070853.91">@property
def start_pos(self):
    return self.line, self.column

</t>
<t tx="ekr.20180519070853.92">@start_pos.setter
def start_pos(self, value):
    self.line = value[0]
    self.column = value[1]

</t>
<t tx="ekr.20180519070853.93">def get_start_pos_of_prefix(self):
    previous_leaf = self.get_previous_leaf()
    if previous_leaf is None:
        return self.line - self.prefix.count('\n'), 0  # It's the first leaf.
    return previous_leaf.end_pos

</t>
<t tx="ekr.20180519070853.94">def get_first_leaf(self):
    return self

</t>
<t tx="ekr.20180519070853.95">def get_last_leaf(self):
    return self

</t>
<t tx="ekr.20180519070853.96">def get_code(self, include_prefix=True):
    if include_prefix:
        return self.prefix + self.value
    else:
        return self.value

</t>
<t tx="ekr.20180519070853.97">@property
def end_pos(self):
    lines = self.value.split('\n')
    end_pos_line = self.line + len(lines) - 1
    # Check for multiline token
    if self.line == end_pos_line:
        end_pos_column = self.column + len(lines[-1])
    else:
        end_pos_column = len(lines[-1])
    return end_pos_line, end_pos_column

</t>
<t tx="ekr.20180519070853.98">@utf8_repr
def __repr__(self):
    value = self.value
    if not value:
        value = self.type
    return "&lt;%s: %s&gt;" % (type(self).__name__, value)


</t>
<t tx="ekr.20180519070853.99">class TypedLeaf(Leaf):
    __slots__ = ('type',)
    @others
</t>
<t tx="ekr.20180519070854.1"></t>
<t tx="ekr.20180519070854.10">@path C:/Anaconda3/Lib/site-packages/parso/pgen2/
# Copyright 2004-2005 Elemental Security, Inc. All Rights Reserved.
# Licensed to PSF under a Contributor Agreement.

# Modifications:
# Copyright 2014 David Halter. Integration into Jedi.
# Modifications are dual-licensed: MIT and PSF.

@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070854.100">def _iter_params(parent_node):
    return (n for n in parent_node.children if n.type == 'param')


</t>
<t tx="ekr.20180519070854.101">def _is_future_import_first(import_from):
    """
    Checks if the import is the first statement of a file.
    """
    found_docstring = False
    for stmt in _iter_stmts(import_from.get_root_node()):
        if stmt.type == 'string' and not found_docstring:
            continue
        found_docstring = True

        if stmt == import_from:
            return True
        if stmt.type == 'import_from' and _is_future_import(stmt):
            continue
        return False


</t>
<t tx="ekr.20180519070854.102">def _iter_definition_exprs_from_lists(exprlist):
    for child in exprlist.children[::2]:
        if child.type == 'atom' and child.children[0] in ('(', '['):
            testlist_comp = child.children[0]
            if testlist_comp.type == 'testlist_comp':
                for expr in _iter_definition_exprs_from_lists(testlist_comp):
                    yield expr
                continue
            elif child.children[0] == '[':
                yield testlist_comp
                continue

        yield child

</t>
<t tx="ekr.20180519070854.103">def _get_expr_stmt_definition_exprs(expr_stmt):
    exprs = []
    for list_ in expr_stmt.children[:-2:2]:
        if list_.type in ('testlist_star_expr', 'testlist'):
            exprs += _iter_definition_exprs_from_lists(list_)
        else:
            exprs.append(list_)
    return exprs


</t>
<t tx="ekr.20180519070854.104">def _get_for_stmt_definition_exprs(for_stmt):
    exprlist = for_stmt.children[1]
    if exprlist.type != 'exprlist':
        return [exprlist]
    return list(_iter_definition_exprs_from_lists(exprlist))


</t>
<t tx="ekr.20180519070854.105">class _Context(object):
    @others
</t>
<t tx="ekr.20180519070854.106">def __init__(self, node, add_syntax_error, parent_context=None):
    self.node = node
    self.blocks = []
    self.parent_context = parent_context
    self._used_name_dict = {}
    self._global_names = []
    self._nonlocal_names = []
    self._nonlocal_names_in_subscopes = []
    self._add_syntax_error = add_syntax_error

</t>
<t tx="ekr.20180519070854.107">def is_async_funcdef(self):
    # Stupidly enough async funcdefs can have two different forms,
    # depending if a decorator is used or not.
    return self.is_function() \
        and self.node.parent.type in ('async_funcdef', 'async_stmt')

</t>
<t tx="ekr.20180519070854.108">def is_function(self):
    return self.node.type == 'funcdef'

</t>
<t tx="ekr.20180519070854.109">def add_name(self, name):
    parent_type = name.parent.type
    if parent_type == 'trailer':
        # We are only interested in first level names.
        return

    if parent_type == 'global_stmt':
        self._global_names.append(name)
    elif parent_type == 'nonlocal_stmt':
        self._nonlocal_names.append(name)
    else:
        self._used_name_dict.setdefault(name.value, []).append(name)

</t>
<t tx="ekr.20180519070854.11">"""
Parser engine for the grammar tables generated by pgen.

The grammar table must be loaded first.

See Parser/parser.c in the Python distribution for additional info on
how this parsing engine works.
"""

from parso.python import tokenize


</t>
<t tx="ekr.20180519070854.110">def finalize(self):
    """
    Returns a list of nonlocal names that need to be part of that scope.
    """
    self._analyze_names(self._global_names, 'global')
    self._analyze_names(self._nonlocal_names, 'nonlocal')

    # Python2.6 doesn't have dict comprehensions.
    global_name_strs = dict((n.value, n) for n in self._global_names)
    for nonlocal_name in self._nonlocal_names:
        try:
            global_name = global_name_strs[nonlocal_name.value]
        except KeyError:
            continue

        message = "name '%s' is nonlocal and global" % global_name.value
        if global_name.start_pos &lt; nonlocal_name.start_pos:
            error_name = global_name
        else:
            error_name = nonlocal_name
        self._add_syntax_error(error_name, message)

    nonlocals_not_handled = []
    for nonlocal_name in self._nonlocal_names_in_subscopes:
        search = nonlocal_name.value
        if search in global_name_strs or self.parent_context is None:
            message = "no binding for nonlocal '%s' found" % nonlocal_name.value
            self._add_syntax_error(nonlocal_name, message)
        elif not self.is_function() or \
                nonlocal_name.value not in self._used_name_dict:
            nonlocals_not_handled.append(nonlocal_name)
    return self._nonlocal_names + nonlocals_not_handled

</t>
<t tx="ekr.20180519070854.111">def _analyze_names(self, globals_or_nonlocals, type_):
    def raise_(message):
        self._add_syntax_error(base_name, message % (base_name.value, type_))

    params = []
    if self.node.type == 'funcdef':
        params = self.node.get_params()

    for base_name in globals_or_nonlocals:
        found_global_or_nonlocal = False
        # Somehow Python does it the reversed way.
        for name in reversed(self._used_name_dict.get(base_name.value, [])):
            if name.start_pos &gt; base_name.start_pos:
                # All following names don't have to be checked.
                found_global_or_nonlocal = True

            parent = name.parent
            if parent.type == 'param' and parent.name == name:
                # Skip those here, these definitions belong to the next
                # scope.
                continue

            if name.is_definition():
                if parent.type == 'expr_stmt' \
                        and parent.children[1].type == 'annassign':
                    if found_global_or_nonlocal:
                        # If it's after the global the error seems to be
                        # placed there.
                        base_name = name
                    raise_("annotated name '%s' can't be %s")
                    break
                else:
                    message = "name '%s' is assigned to before %s declaration"
            else:
                message = "name '%s' is used prior to %s declaration"

            if not found_global_or_nonlocal:
                raise_(message)
                # Only add an error for the first occurence.
                break

        for param in params:
            if param.name.value == base_name.value:
                raise_("name '%s' is parameter and %s"),

</t>
<t tx="ekr.20180519070854.112">@contextmanager
def add_block(self, node):
    self.blocks.append(node)
    yield
    self.blocks.pop()

</t>
<t tx="ekr.20180519070854.113">def add_context(self, node):
    return _Context(node, self._add_syntax_error, parent_context=self)

</t>
<t tx="ekr.20180519070854.114">def close_child_context(self, child_context):
    self._nonlocal_names_in_subscopes += child_context.finalize()


</t>
<t tx="ekr.20180519070854.115">class ErrorFinder(Normalizer):
    """
    Searches for errors in the syntax tree.
    """
    @others
</t>
<t tx="ekr.20180519070854.116">def __init__(self, *args, **kwargs):
    super(ErrorFinder, self).__init__(*args, **kwargs)
    self._error_dict = {}
    self.version = self.grammar.version_info

</t>
<t tx="ekr.20180519070854.117">def initialize(self, node):
    def create_context(node):
        if node is None:
            return None

        parent_context = create_context(node.parent)
        if node.type in ('classdef', 'funcdef', 'file_input'):
            return _Context(node, self._add_syntax_error, parent_context)
        return parent_context

    self.context = create_context(node) or _Context(node, self._add_syntax_error)
    self._indentation_count = 0

</t>
<t tx="ekr.20180519070854.118">def visit(self, node):
    if node.type == 'error_node':
        with self.visit_node(node):
           # Don't need to investigate the inners of an error node. We
           # might find errors in there that should be ignored, because
           # the error node itself already shows that there's an issue.
           return ''
    return super(ErrorFinder, self).visit(node)


</t>
<t tx="ekr.20180519070854.119">@contextmanager
def visit_node(self, node):
    self._check_type_rules(node)

    if node.type in _BLOCK_STMTS:
        with self.context.add_block(node):
            if len(self.context.blocks) == _MAX_BLOCK_SIZE:
                self._add_syntax_error(node, "too many statically nested blocks")
            yield
        return
    elif node.type == 'suite':
        self._indentation_count += 1
        if self._indentation_count == _MAX_INDENT_COUNT:
            self._add_indentation_error(node.children[1], "too many levels of indentation")

    yield

    if node.type == 'suite':
        self._indentation_count -= 1
    elif node.type in ('classdef', 'funcdef'):
        context = self.context
        self.context = context.parent_context
        self.context.close_child_context(context)

</t>
<t tx="ekr.20180519070854.12">class InternalParseError(Exception):
    """
    Exception to signal the parser is stuck and error recovery didn't help.
    Basically this shouldn't happen. It's a sign that something is really
    wrong.
    """

    @others
</t>
<t tx="ekr.20180519070854.120">def visit_leaf(self, leaf):
    if leaf.type == 'error_leaf':
        if leaf.original_type in ('indent', 'error_dedent'):
            # Indents/Dedents itself never have a prefix. They are just
            # "pseudo" tokens that get removed by the syntax tree later.
            # Therefore in case of an error we also have to check for this.
            spacing = list(leaf.get_next_leaf()._split_prefix())[-1]
            if leaf.original_type == 'indent':
                message = 'unexpected indent'
            else:
                message = 'unindent does not match any outer indentation level'
            self._add_indentation_error(spacing, message)
        else:
            if leaf.value.startswith('\\'):
                message = 'unexpected character after line continuation character'
            else:
                match = re.match('\\w{,2}("{1,3}|\'{1,3})', leaf.value)
                if match is None:
                    message = 'invalid syntax'
                else:
                    if len(match.group(1)) == 1:
                        message = 'EOL while scanning string literal'
                    else:
                        message = 'EOF while scanning triple-quoted string literal'
            self._add_syntax_error(leaf, message)
        return ''
    elif leaf.value == ':':
        parent = leaf.parent
        if parent.type in ('classdef', 'funcdef'):
            self.context = self.context.add_context(parent)

    # The rest is rule based.
    return super(ErrorFinder, self).visit_leaf(leaf)

</t>
<t tx="ekr.20180519070854.121">def _add_indentation_error(self, spacing, message):
    self.add_issue(spacing, 903, "IndentationError: " + message)

</t>
<t tx="ekr.20180519070854.122">def _add_syntax_error(self, node, message):
    self.add_issue(node, 901, "SyntaxError: " + message)

</t>
<t tx="ekr.20180519070854.123">def add_issue(self, node, code, message):
    # Overwrite the default behavior.
    # Check if the issues are on the same line.
    line = node.start_pos[0]
    args = (code, message, node)
    self._error_dict.setdefault(line, args)

</t>
<t tx="ekr.20180519070854.124">def finalize(self):
    self.context.finalize()

    for code, message, node in self._error_dict.values():
        self.issues.append(Issue(node, code, message))


</t>
<t tx="ekr.20180519070854.125">class IndentationRule(Rule):
    code = 903

    @others
</t>
<t tx="ekr.20180519070854.126">def _get_message(self, message):
    message = super(IndentationRule, self)._get_message(message)
    return "IndentationError: " + message


</t>
<t tx="ekr.20180519070854.127">@ErrorFinder.register_rule(type='error_node')
class _ExpectIndentedBlock(IndentationRule):
    message = 'expected an indented block'

    @others
</t>
<t tx="ekr.20180519070854.128">def get_node(self, node):
    leaf = node.get_next_leaf()
    return list(leaf._split_prefix())[-1]

</t>
<t tx="ekr.20180519070854.129">def is_issue(self, node):
    # This is the beginning of a suite that is not indented.
    return node.children[-1].type == 'newline'


</t>
<t tx="ekr.20180519070854.13">def __init__(self, msg, type, value, start_pos):
    Exception.__init__(self, "%s: type=%r, value=%r, start_pos=%r" %
                       (msg, tokenize.tok_name[type], value, start_pos))
    self.msg = msg
    self.type = type
    self.value = value
    self.start_pos = start_pos


</t>
<t tx="ekr.20180519070854.130">class ErrorFinderConfig(NormalizerConfig):
    normalizer_class = ErrorFinder


</t>
<t tx="ekr.20180519070854.131">class SyntaxRule(Rule):
    code = 901

    @others
</t>
<t tx="ekr.20180519070854.132">def _get_message(self, message):
    message = super(SyntaxRule, self)._get_message(message)
    return "SyntaxError: " + message


</t>
<t tx="ekr.20180519070854.133">@ErrorFinder.register_rule(type='error_node')
class _InvalidSyntaxRule(SyntaxRule):
    message = "invalid syntax"

    @others
</t>
<t tx="ekr.20180519070854.134">def get_node(self, node):
    return node.get_next_leaf()

</t>
<t tx="ekr.20180519070854.135">def is_issue(self, node):
    # Error leafs will be added later as an error.
    return node.get_next_leaf().type != 'error_leaf'


</t>
<t tx="ekr.20180519070854.136">@ErrorFinder.register_rule(value='await')
class _AwaitOutsideAsync(SyntaxRule):
    message = "'await' outside async function"

    @others
</t>
<t tx="ekr.20180519070854.137">def is_issue(self, leaf):
    return not self._normalizer.context.is_async_funcdef()

</t>
<t tx="ekr.20180519070854.138">def get_error_node(self, node):
    # Return the whole await statement.
    return node.parent


</t>
<t tx="ekr.20180519070854.139">@ErrorFinder.register_rule(value='break')
class _BreakOutsideLoop(SyntaxRule):
    message = "'break' outside loop"

    @others
</t>
<t tx="ekr.20180519070854.14">class Stack(list):
    @others
</t>
<t tx="ekr.20180519070854.140">def is_issue(self, leaf):
    in_loop = False
    for block in self._normalizer.context.blocks:
        if block.type in ('for_stmt', 'while_stmt'):
            in_loop = True
    return not in_loop


</t>
<t tx="ekr.20180519070854.141">@ErrorFinder.register_rule(value='continue')
class _ContinueChecks(SyntaxRule):
    message = "'continue' not properly in loop"
    message_in_finally = "'continue' not supported inside 'finally' clause"

    @others
</t>
<t tx="ekr.20180519070854.142">def is_issue(self, leaf):
    in_loop = False
    for block in self._normalizer.context.blocks:
        if block.type in ('for_stmt', 'while_stmt'):
            in_loop = True
        if block.type == 'try_stmt':
            last_block = block.children[-3]
            if last_block == 'finally' and leaf.start_pos &gt; last_block.start_pos:
                self.add_issue(leaf, message=self.message_in_finally)
                return False  # Error already added
    if not in_loop:
        return True


</t>
<t tx="ekr.20180519070854.143">@ErrorFinder.register_rule(value='from')
class _YieldFromCheck(SyntaxRule):
    message = "'yield from' inside async function"

    @others
</t>
<t tx="ekr.20180519070854.144">def get_node(self, leaf):
    return leaf.parent.parent  # This is the actual yield statement.

</t>
<t tx="ekr.20180519070854.145">def is_issue(self, leaf):
    return leaf.parent.type == 'yield_arg' \
            and self._normalizer.context.is_async_funcdef()


</t>
<t tx="ekr.20180519070854.146">@ErrorFinder.register_rule(type='name')
class _NameChecks(SyntaxRule):
    message = 'cannot assign to __debug__'
    message_keyword = 'assignment to keyword'
    message_none = 'cannot assign to None'

    @others
</t>
<t tx="ekr.20180519070854.147">def is_issue(self, leaf):
    self._normalizer.context.add_name(leaf)

    if leaf.value == '__debug__' and leaf.is_definition():
        if self._normalizer.version &lt; (3, 0):
            return True
        else:
            self.add_issue(leaf, message=self.message_keyword)
    if leaf.value == 'None' and self._normalizer.version &lt; (3, 0) \
            and leaf.is_definition():
        self.add_issue(leaf, message=self.message_none)


</t>
<t tx="ekr.20180519070854.148">@ErrorFinder.register_rule(type='string')
class _StringChecks(SyntaxRule):
    message = "bytes can only contain ASCII literal characters."

    @others
</t>
<t tx="ekr.20180519070854.149">def is_issue(self, leaf):
        string_prefix = leaf.string_prefix.lower()
        if 'b' in string_prefix \
                and self._normalizer.version &gt;= (3, 0) \
                and any(c for c in leaf.value if ord(c) &gt; 127):
            # b'ä'
            return True

        if 'r' not in string_prefix:
            # Raw strings don't need to be checked if they have proper
            # escaping.
            is_bytes = self._normalizer.version &lt; (3, 0)
            if 'b' in string_prefix:
                is_bytes = True
            if 'u' in string_prefix:
                is_bytes = False

            payload = leaf._get_payload()
            if is_bytes:
                payload = payload.encode('utf-8')
                func = codecs.escape_decode
            else:
                func = codecs.unicode_escape_decode

            try:
                with warnings.catch_warnings():
                    # The warnings from parsing strings are not relevant.
                    warnings.filterwarnings('ignore')
                    func(payload)
            except UnicodeDecodeError as e:
                self.add_issue(leaf, message='(unicode error) ' + str(e))
            except ValueError as e:
                self.add_issue(leaf, message='(value error) ' + str(e))


</t>
<t tx="ekr.20180519070854.15">def get_tos_nodes(self):
    tos = self[-1]
    return tos[2][1]


</t>
<t tx="ekr.20180519070854.150">@ErrorFinder.register_rule(value='*')
class _StarCheck(SyntaxRule):
    message = "named arguments must follow bare *"

    @others
</t>
<t tx="ekr.20180519070854.151">def is_issue(self, leaf):
    params = leaf.parent
    if params.type == 'parameters' and params:
        after = params.children[params.children.index(leaf) + 1:]
        after = [child for child in after
                 if child not in (',', ')') and not child.star_count]
        return len(after) == 0


</t>
<t tx="ekr.20180519070854.152">@ErrorFinder.register_rule(value='**')
class _StarStarCheck(SyntaxRule):
    # e.g. {**{} for a in [1]}
    # TODO this should probably get a better end_pos including
    #      the next sibling of leaf.
    message = "dict unpacking cannot be used in dict comprehension"

    @others
</t>
<t tx="ekr.20180519070854.153">def is_issue(self, leaf):
    if leaf.parent.type == 'dictorsetmaker':
        comp_for = leaf.get_next_sibling().get_next_sibling()
        return comp_for is not None and comp_for.type == 'comp_for'


</t>
<t tx="ekr.20180519070854.154">@ErrorFinder.register_rule(value='yield')
@ErrorFinder.register_rule(value='return')
class _ReturnAndYieldChecks(SyntaxRule):
    message = "'return' with value in async generator"
    message_async_yield = "'yield' inside async function"

    @others
</t>
<t tx="ekr.20180519070854.155">def get_node(self, leaf):
    return leaf.parent

</t>
<t tx="ekr.20180519070854.156">def is_issue(self, leaf):
    if self._normalizer.context.node.type != 'funcdef':
        self.add_issue(self.get_node(leaf), message="'%s' outside function" % leaf.value)
    elif self._normalizer.context.is_async_funcdef() \
            and any(self._normalizer.context.node.iter_yield_exprs()):
        if leaf.value == 'return' and leaf.parent.type == 'return_stmt':
            return True
        elif leaf.value == 'yield' \
                and leaf.get_next_leaf() != 'from' \
                and self._normalizer.version == (3, 5):
            self.add_issue(self.get_node(leaf), message=self.message_async_yield)


</t>
<t tx="ekr.20180519070854.157">@ErrorFinder.register_rule(type='strings')
class _BytesAndStringMix(SyntaxRule):
    # e.g. 's' b''
    message = "cannot mix bytes and nonbytes literals"

    @others
</t>
<t tx="ekr.20180519070854.158">def _is_bytes_literal(self, string):
    return 'b' in string.string_prefix.lower()

</t>
<t tx="ekr.20180519070854.159">def is_issue(self, node):
    first = node.children[0]
    if first.type == 'string' and self._normalizer.version &gt;= (3, 0):
        first_is_bytes = self._is_bytes_literal(first)
        for string in node.children[1:]:
            if first_is_bytes != self._is_bytes_literal(string):
                return True


</t>
<t tx="ekr.20180519070854.16">def token_to_ilabel(grammar, type_, value):
    # Map from token to label
    if type_ == tokenize.NAME:
        # Check for reserved words (keywords)
        try:
            return grammar.keywords[value]
        except KeyError:
            pass

    try:
        return grammar.tokens[type_]
    except KeyError:
        return None


</t>
<t tx="ekr.20180519070854.160">@ErrorFinder.register_rule(type='import_as_names')
class _TrailingImportComma(SyntaxRule):
    # e.g. from foo import a,
    message = "trailing comma not allowed without surrounding parentheses"

    @others
</t>
<t tx="ekr.20180519070854.161">def is_issue(self, node):
    if node.children[-1] == ',':
        return True


</t>
<t tx="ekr.20180519070854.162">@ErrorFinder.register_rule(type='import_from')
class _ImportStarInFunction(SyntaxRule):
    message = "import * only allowed at module level"

    @others
</t>
<t tx="ekr.20180519070854.163">def is_issue(self, node):
    return node.is_star_import() and self._normalizer.context.parent_context is not None


</t>
<t tx="ekr.20180519070854.164">@ErrorFinder.register_rule(type='import_from')
class _FutureImportRule(SyntaxRule):
    message = "from __future__ imports must occur at the beginning of the file"

    @others
</t>
<t tx="ekr.20180519070854.165">def is_issue(self, node):
    if _is_future_import(node):
        if not _is_future_import_first(node):
            return True

        for from_name, future_name in node.get_paths():
            name = future_name.value
            allowed_futures = list(ALLOWED_FUTURES)
            if self._normalizer.version &gt;= (3, 5):
                allowed_futures.append('generator_stop')

            if name == 'braces':
                self.add_issue(node, message = "not a chance")
            elif name == 'barry_as_FLUFL':
                m = "Seriously I'm not implementing this :) ~ Dave"
                self.add_issue(node, message=m)
            elif name not in ALLOWED_FUTURES:
                message = "future feature %s is not defined" % name
                self.add_issue(node, message=message)


</t>
<t tx="ekr.20180519070854.166">@ErrorFinder.register_rule(type='star_expr')
class _StarExprRule(SyntaxRule):
    message = "starred assignment target must be in a list or tuple"
    message_iterable_unpacking = "iterable unpacking cannot be used in comprehension"
    message_assignment = "can use starred expression only as assignment target"

    @others
</t>
<t tx="ekr.20180519070854.167">def is_issue(self, node):
    if node.parent.type not in _STAR_EXPR_PARENTS:
        return True
    if node.parent.type == 'testlist_comp':
        # [*[] for a in [1]]
        if node.parent.children[1].type == 'comp_for':
            self.add_issue(node, message=self.message_iterable_unpacking)
    if self._normalizer.version &lt;= (3, 4):
        n = search_ancestor(node, 'for_stmt', 'expr_stmt')
        found_definition = False
        if n is not None:
            if n.type == 'expr_stmt':
                exprs = _get_expr_stmt_definition_exprs(n)
            else:
                exprs = _get_for_stmt_definition_exprs(n)
            if node in exprs:
                found_definition = True

        if not found_definition:
            self.add_issue(node, message=self.message_assignment)


</t>
<t tx="ekr.20180519070854.168">@ErrorFinder.register_rule(types=_STAR_EXPR_PARENTS)
class _StarExprParentRule(SyntaxRule):
    @others
</t>
<t tx="ekr.20180519070854.169">def is_issue(self, node):
    if node.parent.type == 'del_stmt':
        self.add_issue(node.parent, message="can't use starred expression here")
    else:
        def is_definition(node, ancestor):
            if ancestor is None:
                return False

            type_ = ancestor.type
            if type_ == 'trailer':
                return False

            if type_ == 'expr_stmt':
                return node.start_pos &lt; ancestor.children[-1].start_pos

            return is_definition(node, ancestor.parent)

        if is_definition(node, node.parent):
            args = [c for c in node.children if c != ',']
            starred = [c for c in args if c.type == 'star_expr']
            if len(starred) &gt; 1:
                message = "two starred expressions in assignment"
                self.add_issue(starred[1], message=message)
            elif starred:
                count = args.index(starred[0])
                if count &gt;= 256:
                    message = "too many expressions in star-unpacking assignment"
                    self.add_issue(starred[0], message=message)


</t>
<t tx="ekr.20180519070854.17">class PgenParser(object):
    """Parser engine.

    The proper usage sequence is:

    p = Parser(grammar, [converter])  # create instance
    p.setup([start])                  # prepare for parsing
    &lt;for each input token&gt;:
        if p.add_token(...):           # parse a token
            break
    root = p.rootnode                 # root of abstract syntax tree

    A Parser instance may be reused by calling setup() repeatedly.

    A Parser instance contains state pertaining to the current token
    sequence, and should not be used concurrently by different threads
    to parse separate token sequences.

    See driver.py for how to get input tokens by tokenizing a file or
    string.

    Parsing is complete when add_token() returns True; the root of the
    abstract syntax tree can then be retrieved from the rootnode
    instance variable.  When a syntax error occurs, error_recovery()
    is called. There is no error recovery; the parser cannot be used
    after a syntax error was reported (but it can be reinitialized by
    calling setup()).

    """

    @others
</t>
<t tx="ekr.20180519070854.170">@ErrorFinder.register_rule(type='annassign')
class _AnnotatorRule(SyntaxRule):
    # True: int
    # {}: float
    message = "illegal target for annotation"

    @others
</t>
<t tx="ekr.20180519070854.171">def get_node(self, node):
    return node.parent

</t>
<t tx="ekr.20180519070854.172">def is_issue(self, node):
    type_ = None
    lhs = node.parent.children[0]
    lhs = _remove_parens(lhs)
    try:
        children = lhs.children
    except AttributeError:
        pass
    else:
        if ',' in children or lhs.type == 'atom' and children[0] == '(':
            type_ = 'tuple'
        elif lhs.type == 'atom' and children[0] == '[':
            type_ = 'list'
        trailer = children[-1]

    if type_ is None:
        if not (lhs.type == 'name'
                # subscript/attributes are allowed
                or lhs.type in ('atom_expr', 'power')
                    and trailer.type == 'trailer'
                    and trailer.children[0] != '('):
            return True
    else:
        # x, y: str
        message = "only single target (not %s) can be annotated"
        self.add_issue(lhs.parent, message=message % type_)


</t>
<t tx="ekr.20180519070854.173">@ErrorFinder.register_rule(type='argument')
class _ArgumentRule(SyntaxRule):
    @others
</t>
<t tx="ekr.20180519070854.174">def is_issue(self, node):
    first = node.children[0]
    if node.children[1] == '=' and first.type != 'name':
        if first.type == 'lambdef':
            # f(lambda: 1=1)
            message = "lambda cannot contain assignment"
        else:
            # f(+x=1)
            message = "keyword can't be an expression"
        self.add_issue(first, message=message)


</t>
<t tx="ekr.20180519070854.175">@ErrorFinder.register_rule(type='nonlocal_stmt')
class _NonlocalModuleLevelRule(SyntaxRule):
    message = "nonlocal declaration not allowed at module level"

    @others
</t>
<t tx="ekr.20180519070854.176">def is_issue(self, node):
    return self._normalizer.context.parent_context is None


</t>
<t tx="ekr.20180519070854.177">@ErrorFinder.register_rule(type='arglist')
class _ArglistRule(SyntaxRule):
    @others
</t>
<t tx="ekr.20180519070854.178">@property
def message(self):
    if self._normalizer.version &lt; (3, 7):
        return "Generator expression must be parenthesized if not sole argument"
    else:
        return "Generator expression must be parenthesized"

</t>
<t tx="ekr.20180519070854.179">def is_issue(self, node):
    first_arg = node.children[0]
    if first_arg.type == 'argument' \
            and first_arg.children[1].type == 'comp_for':
        # e.g. foo(x for x in [], b)
        return len(node.children) &gt;= 2
    else:
        arg_set = set()
        kw_only = False
        kw_unpacking_only = False
        is_old_starred = False
        # In python 3 this would be a bit easier (stars are part of
        # argument), but we have to understand both.
        for argument in node.children:
            if argument == ',':
                continue

            if argument in ('*', '**'):
                # Python &lt; 3.5 has the order engraved in the grammar
                # file.  No need to do anything here.
                is_old_starred = True
                continue
            if is_old_starred:
                is_old_starred = False
                continue

            if argument.type == 'argument':
                first = argument.children[0]
                if first in ('*', '**'):
                    if first == '*':
                        if kw_unpacking_only:
                            # foo(**kwargs, *args)
                            message = "iterable argument unpacking follows keyword argument unpacking"
                            self.add_issue(argument, message=message)
                    else:
                        kw_unpacking_only = True
                else:  # Is a keyword argument.
                    kw_only = True
                    if first.type == 'name':
                        if first.value in arg_set:
                            # f(x=1, x=2)
                            self.add_issue(first, message="keyword argument repeated")
                        else:
                            arg_set.add(first.value)
            else:
                if kw_unpacking_only:
                    # f(**x, y)
                    message = "positional argument follows keyword argument unpacking"
                    self.add_issue(argument, message=message)
                elif kw_only:
                    # f(x=2, y)
                    message = "positional argument follows keyword argument"
                    self.add_issue(argument, message=message)

</t>
<t tx="ekr.20180519070854.18">def __init__(self, grammar, convert_node, convert_leaf, error_recovery, start):
    """Constructor.

    The grammar argument is a grammar.Grammar instance; see the
    grammar module for more information.

    The parser is not ready yet for parsing; you must call the
    setup() method to get it started.

    The optional convert argument is a function mapping concrete
    syntax tree nodes to abstract syntax tree nodes.  If not
    given, no conversion is done and the syntax tree produced is
    the concrete syntax tree.  If given, it must be a function of
    two arguments, the first being the grammar (a grammar.Grammar
    instance), and the second being the concrete syntax tree node
    to be converted.  The syntax tree is converted from the bottom
    up.

    A concrete syntax tree node is a (type, nodes) tuple, where
    type is the node type (a token or symbol number) and nodes
    is a list of children for symbols, and None for tokens.

    An abstract syntax tree node may be anything; this is entirely
    up to the converter function.

    """
    self.grammar = grammar
    self.convert_node = convert_node
    self.convert_leaf = convert_leaf

    # Each stack entry is a tuple: (dfa, state, node).
    # A node is a tuple: (type, children),
    # where children is a list of nodes or None
    newnode = (start, [])
    stackentry = (self.grammar.dfas[start], 0, newnode)
    self.stack = Stack([stackentry])
    self.rootnode = None
    self.error_recovery = error_recovery

</t>
<t tx="ekr.20180519070854.180">@ErrorFinder.register_rule(type='parameters')
@ErrorFinder.register_rule(type='lambdef')
class _ParameterRule(SyntaxRule):
    # def f(x=3, y): pass
    message = "non-default argument follows default argument"

    @others
</t>
<t tx="ekr.20180519070854.181">def is_issue(self, node):
    param_names = set()
    default_only = False
    for p in _iter_params(node):
        if p.name.value in param_names:
            message = "duplicate argument '%s' in function definition"
            self.add_issue(p.name, message=message % p.name.value)
        param_names.add(p.name.value)

        if p.default is None and not p.star_count:
            if default_only:
                return True
        else:
            default_only = True


</t>
<t tx="ekr.20180519070854.182">@ErrorFinder.register_rule(type='try_stmt')
class _TryStmtRule(SyntaxRule):
    message = "default 'except:' must be last"

    @others
</t>
<t tx="ekr.20180519070854.183">def is_issue(self, try_stmt):
    default_except = None
    for except_clause in try_stmt.children[3::3]:
        if except_clause in ('else', 'finally'):
            break
        if except_clause == 'except':
            default_except = except_clause
        elif default_except is not None:
            self.add_issue(default_except, message=self.message)


</t>
<t tx="ekr.20180519070854.184">@ErrorFinder.register_rule(type='fstring')
class _FStringRule(SyntaxRule):
    _fstring_grammar = None
    message_nested = "f-string: expressions nested too deeply"
    message_conversion = "f-string: invalid conversion character: expected 's', 'r', or 'a'"

    @others
</t>
<t tx="ekr.20180519070854.185">def _check_format_spec(self, format_spec, depth):
    self._check_fstring_contents(format_spec.children[1:], depth)

</t>
<t tx="ekr.20180519070854.186">def _check_fstring_expr(self, fstring_expr, depth):
    if depth &gt;= 2:
        self.add_issue(fstring_expr, message=self.message_nested)

    conversion = fstring_expr.children[2]
    if conversion.type == 'fstring_conversion':
        name = conversion.children[1]
        if name.value not in ('s', 'r', 'a'):
            self.add_issue(name, message=self.message_conversion)

    format_spec = fstring_expr.children[-2]
    if format_spec.type == 'fstring_format_spec':
        self._check_format_spec(format_spec, depth + 1)

</t>
<t tx="ekr.20180519070854.187">def is_issue(self, fstring):
    self._check_fstring_contents(fstring.children[1:-1])

</t>
<t tx="ekr.20180519070854.188">def _check_fstring_contents(self, children, depth=0):
    for fstring_content in children:
        if fstring_content.type == 'fstring_expr':
            self._check_fstring_expr(fstring_content, depth)


</t>
<t tx="ekr.20180519070854.189">class _CheckAssignmentRule(SyntaxRule):
    @others
</t>
<t tx="ekr.20180519070854.19">def parse(self, tokens):
    for type_, value, start_pos, prefix in tokens:
        if self.add_token(type_, value, start_pos, prefix):
            break
    else:
        # We never broke out -- EOF is too soon -- Unfinished statement.
        # However, the error recovery might have added the token again, if
        # the stack is empty, we're fine.
        if self.stack:
            raise InternalParseError("incomplete input", type_, value, start_pos)
    return self.rootnode

</t>
<t tx="ekr.20180519070854.190">def _check_assignment(self, node, is_deletion=False):
    error = None
    type_ = node.type
    if type_ == 'lambdef':
        error = 'lambda'
    elif type_ == 'atom':
        first, second = node.children[:2]
        error = _get_comprehension_type(node)
        if error is None:
            if second.type == 'dictorsetmaker':
                error = 'literal'
            elif first in ('(', '['):
                if second.type == 'yield_expr':
                    error = 'yield expression'
                elif second.type == 'testlist_comp':
                    # This is not a comprehension, they were handled
                    # further above.
                    for child in second.children[::2]:
                        self._check_assignment(child, is_deletion)
                else:  # Everything handled, must be useless brackets.
                    self._check_assignment(second, is_deletion)
    elif type_ == 'keyword':
        error = 'keyword'
    elif type_ == 'operator':
        if node.value == '...':
            error = 'Ellipsis'
    elif type_ == 'comparison':
        error = 'comparison'
    elif type_ in ('string', 'number', 'strings'):
        error = 'literal'
    elif type_ == 'yield_expr':
        # This one seems to be a slightly different warning in Python.
        message = 'assignment to yield expression not possible'
        self.add_issue(node, message=message)
    elif type_ == 'test':
        error = 'conditional expression'
    elif type_ in ('atom_expr', 'power'):
        if node.children[0] == 'await':
            error = 'await expression'
        elif node.children[-2] == '**':
            error = 'operator'
        else:
            # Has a trailer
            trailer = node.children[-1]
            assert trailer.type == 'trailer'
            if trailer.children[0] == '(':
                error = 'function call'
    elif type_ in ('testlist_star_expr', 'exprlist', 'testlist'):
        for child in node.children[::2]:
            self._check_assignment(child, is_deletion)
    elif ('expr' in type_ and type_ != 'star_expr' # is a substring
          or '_test' in type_
          or type_ in ('term', 'factor')):
        error = 'operator'

    if error is not None:
        message = "can't %s %s" % ("delete" if is_deletion else "assign to", error)
        self.add_issue(node, message=message)


</t>
<t tx="ekr.20180519070854.191">@ErrorFinder.register_rule(type='comp_for')
class _CompForRule(_CheckAssignmentRule):
    message = "asynchronous comprehension outside of an asynchronous function"

    @others
</t>
<t tx="ekr.20180519070854.192">def is_issue(self, node):
    # Some of the nodes here are already used, so no else if
    expr_list = node.children[1 + int(node.children[0] == 'async')]
    if expr_list.type != 'expr_list':  # Already handled.
        self._check_assignment(expr_list)

    return node.children[0] == 'async' \
        and not self._normalizer.context.is_async_funcdef()


</t>
<t tx="ekr.20180519070854.193">@ErrorFinder.register_rule(type='expr_stmt')
class _ExprStmtRule(_CheckAssignmentRule):
    message = "illegal expression for augmented assignment"

    @others
</t>
<t tx="ekr.20180519070854.194">def is_issue(self, node):
    for before_equal in node.children[:-2:2]:
        self._check_assignment(before_equal)

    augassign = node.children[1]
    if augassign != '=' and augassign.type != 'annassign':  # Is augassign.
        return node.children[0].type in ('testlist_star_expr', 'atom', 'testlist')


</t>
<t tx="ekr.20180519070854.195">@ErrorFinder.register_rule(type='with_item')
class _WithItemRule(_CheckAssignmentRule):
    @others
</t>
<t tx="ekr.20180519070854.196">def is_issue(self, with_item):
    self._check_assignment(with_item.children[2])


</t>
<t tx="ekr.20180519070854.197">@ErrorFinder.register_rule(type='del_stmt')
class _DelStmtRule(_CheckAssignmentRule):
    @others
</t>
<t tx="ekr.20180519070854.198">def is_issue(self, del_stmt):
    child = del_stmt.children[1]

    if child.type != 'expr_list':  # Already handled.
        self._check_assignment(child, is_deletion=True)


</t>
<t tx="ekr.20180519070854.199">@ErrorFinder.register_rule(type='expr_list')
class _ExprListRule(_CheckAssignmentRule):
    @others
</t>
<t tx="ekr.20180519070854.2">@path C:/Anaconda3/Lib/site-packages/parso/pgen2/
# Copyright 2004-2005 Elemental Security, Inc. All Rights Reserved.
# Licensed to PSF under a Contributor Agreement.

# Modifications:
# Copyright 2014 David Halter. Integration into Jedi.
# Modifications are dual-licensed: MIT and PSF.

@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070854.20">def add_token(self, type_, value, start_pos, prefix):
    """Add a token; return True if this is the end of the program."""
    ilabel = token_to_ilabel(self.grammar, type_, value)

    # Loop until the token is shifted; may raise exceptions
    _gram = self.grammar
    _labels = _gram.labels
    _push = self._push
    _pop = self._pop
    _shift = self._shift
    while True:
        dfa, state, node = self.stack[-1]
        states, first = dfa
        arcs = states[state]
        # Look for a state with this label
        for i, newstate in arcs:
            t, v = _labels[i]
            if ilabel == i:
                # Look it up in the list of labels
                assert t &lt; 256
                # Shift a token; we're done with it
                _shift(type_, value, newstate, prefix, start_pos)
                # Pop while we are in an accept-only state
                state = newstate
                while states[state] == [(0, state)]:
                    _pop()
                    if not self.stack:
                        # Done parsing!
                        return True
                    dfa, state, node = self.stack[-1]
                    states, first = dfa
                # Done with this token
                return False
            elif t &gt;= 256:
                # See if it's a symbol and if we're in its first set
                itsdfa = _gram.dfas[t]
                itsstates, itsfirst = itsdfa
                if ilabel in itsfirst:
                    # Push a symbol
                    _push(t, itsdfa, newstate)
                    break  # To continue the outer while loop
        else:
            if (0, state) in arcs:
                # An accepting state, pop it and try something else
                _pop()
                if not self.stack:
                    # Done parsing, but another token is input
                    raise InternalParseError("too much input", type_, value, start_pos)
            else:
                self.error_recovery(self.grammar, self.stack, arcs, type_,
                                    value, start_pos, prefix, self.add_token)
                break

</t>
<t tx="ekr.20180519070854.200">def is_issue(self, expr_list):
    for expr in expr_list.children[::2]:
        self._check_assignment(expr)


</t>
<t tx="ekr.20180519070854.201">@ErrorFinder.register_rule(type='for_stmt')
class _ForStmtRule(_CheckAssignmentRule):
    @others
</t>
<t tx="ekr.20180519070854.202">def is_issue(self, for_stmt):
    # Some of the nodes here are already used, so no else if
    expr_list = for_stmt.children[1]
    if expr_list.type != 'expr_list':  # Already handled.
        self._check_assignment(expr_list)
</t>
<t tx="ekr.20180519070854.203">@path C:/Anaconda3/Lib/site-packages/parso/python/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070854.204">from parso.python import tree
from parso.python.token import (DEDENT, INDENT, ENDMARKER, NEWLINE, NUMBER,
                                STRING, tok_name, NAME, FSTRING_STRING,
                                FSTRING_START, FSTRING_END)
from parso.parser import BaseParser
from parso.pgen2.parse import token_to_ilabel


</t>
<t tx="ekr.20180519070854.205">class Parser(BaseParser):
    """
    This class is used to parse a Python file, it then divides them into a
    class structure of different scopes.

    :param pgen_grammar: The grammar object of pgen2. Loaded by load_grammar.
    """

    node_map = {
        'expr_stmt': tree.ExprStmt,
        'classdef': tree.Class,
        'funcdef': tree.Function,
        'file_input': tree.Module,
        'import_name': tree.ImportName,
        'import_from': tree.ImportFrom,
        'break_stmt': tree.KeywordStatement,
        'continue_stmt': tree.KeywordStatement,
        'return_stmt': tree.ReturnStmt,
        'raise_stmt': tree.KeywordStatement,
        'yield_expr': tree.YieldExpr,
        'del_stmt': tree.KeywordStatement,
        'pass_stmt': tree.KeywordStatement,
        'global_stmt': tree.GlobalStmt,
        'nonlocal_stmt': tree.KeywordStatement,
        'print_stmt': tree.KeywordStatement,
        'assert_stmt': tree.AssertStmt,
        'if_stmt': tree.IfStmt,
        'with_stmt': tree.WithStmt,
        'for_stmt': tree.ForStmt,
        'while_stmt': tree.WhileStmt,
        'try_stmt': tree.TryStmt,
        'comp_for': tree.CompFor,
        # Not sure if this is the best idea, but IMO it's the easiest way to
        # avoid extreme amounts of work around the subtle difference of 2/3
        # grammar in list comoprehensions.
        'list_for': tree.CompFor,
        # Same here. This just exists in Python 2.6.
        'gen_for': tree.CompFor,
        'decorator': tree.Decorator,
        'lambdef': tree.Lambda,
        'old_lambdef': tree.Lambda,
        'lambdef_nocond': tree.Lambda,
    }
    default_node = tree.PythonNode

    # Names/Keywords are handled separately
    _leaf_map = {
        STRING: tree.String,
        NUMBER: tree.Number,
        NEWLINE: tree.Newline,
        ENDMARKER: tree.EndMarker,
        FSTRING_STRING: tree.FStringString,
        FSTRING_START: tree.FStringStart,
        FSTRING_END: tree.FStringEnd,
    }

    @others
</t>
<t tx="ekr.20180519070854.206">def __init__(self, pgen_grammar, error_recovery=True, start_symbol='file_input'):
    super(Parser, self).__init__(pgen_grammar, start_symbol, error_recovery=error_recovery)

    self.syntax_errors = []
    self._omit_dedent_list = []
    self._indent_counter = 0

    # TODO do print absolute import detection here.
    # try:
    #     del python_grammar_no_print_statement.keywords["print"]
    # except KeyError:
    #     pass  # Doesn't exist in the Python 3 grammar.

    # if self.options["print_function"]:
    #     python_grammar = pygram.python_grammar_no_print_statement
    # else:

</t>
<t tx="ekr.20180519070854.207">def parse(self, tokens):
    if self._error_recovery:
        if self._start_symbol != 'file_input':
            raise NotImplementedError

        tokens = self._recovery_tokenize(tokens)

    node = super(Parser, self).parse(tokens)

    if self._start_symbol == 'file_input' != node.type:
        # If there's only one statement, we get back a non-module. That's
        # not what we want, we want a module, so we add it here:
        node = self.convert_node(
            self._pgen_grammar,
            self._pgen_grammar.symbol2number['file_input'],
            [node]
        )

    return node

</t>
<t tx="ekr.20180519070854.208">def convert_node(self, pgen_grammar, type, children):
    """
    Convert raw node information to a PythonBaseNode instance.

    This is passed to the parser driver which calls it whenever a reduction of a
    grammar rule produces a new complete node, so that the tree is build
    strictly bottom-up.
    """
    # TODO REMOVE symbol, we don't want type here.
    symbol = pgen_grammar.number2symbol[type]
    try:
        return self.node_map[symbol](children)
    except KeyError:
        if symbol == 'suite':
            # We don't want the INDENT/DEDENT in our parser tree. Those
            # leaves are just cancer. They are virtual leaves and not real
            # ones and therefore have pseudo start/end positions and no
            # prefixes. Just ignore them.
            children = [children[0]] + children[2:-1]
        elif symbol == 'list_if':
            # Make transitioning from 2 to 3 easier.
            symbol = 'comp_if'
        elif symbol == 'listmaker':
            # Same as list_if above.
            symbol = 'testlist_comp'
        return self.default_node(symbol, children)

</t>
<t tx="ekr.20180519070854.209">def convert_leaf(self, pgen_grammar, type, value, prefix, start_pos):
    # print('leaf', repr(value), token.tok_name[type])
    if type == NAME:
        if value in pgen_grammar.keywords:
            return tree.Keyword(value, start_pos, prefix)
        else:
            return tree.Name(value, start_pos, prefix)

    return self._leaf_map.get(type, tree.Operator)(value, start_pos, prefix)

</t>
<t tx="ekr.20180519070854.21">def _shift(self, type_, value, newstate, prefix, start_pos):
    """Shift a token.  (Internal)"""
    dfa, state, node = self.stack[-1]
    newnode = self.convert_leaf(self.grammar, type_, value, prefix, start_pos)
    node[-1].append(newnode)
    self.stack[-1] = (dfa, newstate, node)

</t>
<t tx="ekr.20180519070854.210">def error_recovery(self, pgen_grammar, stack, arcs, typ, value, start_pos, prefix,
                   add_token_callback):
    def get_symbol_and_nodes(stack):
        for dfa, state, (type_, nodes) in stack:
            symbol = pgen_grammar.number2symbol[type_]
            yield symbol, nodes

    tos_nodes = stack.get_tos_nodes()
    if tos_nodes:
        last_leaf = tos_nodes[-1].get_last_leaf()
    else:
        last_leaf = None

    if self._start_symbol == 'file_input' and \
            (typ == ENDMARKER or typ == DEDENT and '\n' not in last_leaf.value):
        def reduce_stack(states, newstate):
            # reduce
            state = newstate
            while states[state] == [(0, state)]:
                self.pgen_parser._pop()

                dfa, state, (type_, nodes) = stack[-1]
                states, first = dfa


        # In Python statements need to end with a newline. But since it's
        # possible (and valid in Python ) that there's no newline at the
        # end of a file, we have to recover even if the user doesn't want
        # error recovery.
        #print('x', pprint.pprint(stack))
        ilabel = token_to_ilabel(pgen_grammar, NEWLINE, value)

        dfa, state, (type_, nodes) = stack[-1]
        symbol = pgen_grammar.number2symbol[type_]
        states, first = dfa
        arcs = states[state]
        # Look for a state with this label
        for i, newstate in arcs:
            if ilabel == i:
                if symbol == 'simple_stmt':
                    # This is basically shifting
                    stack[-1] = (dfa, newstate, (type_, nodes))

                    reduce_stack(states, newstate)
                    add_token_callback(typ, value, start_pos, prefix)
                    return
                # Check if we're at the right point
                #for symbol, nodes in get_symbol_and_nodes(stack):
                #        self.pgen_parser._pop()

                        #break
                break
        #symbol = pgen_grammar.number2symbol[type_]

    if not self._error_recovery:
        return super(Parser, self).error_recovery(
            pgen_grammar, stack, arcs, typ, value, start_pos, prefix,
            add_token_callback)

    def current_suite(stack):
        # For now just discard everything that is not a suite or
        # file_input, if we detect an error.
        for index, (symbol, nodes) in reversed(list(enumerate(get_symbol_and_nodes(stack)))):
            # `suite` can sometimes be only simple_stmt, not stmt.
            if symbol == 'file_input':
                break
            elif symbol == 'suite' and len(nodes) &gt; 1:
                # suites without an indent in them get discarded.
                break
        return index, symbol, nodes

    index, symbol, nodes = current_suite(stack)

    # print('err', token.tok_name[typ], repr(value), start_pos, len(stack), index)
    if self._stack_removal(pgen_grammar, stack, arcs, index + 1, value, start_pos):
        add_token_callback(typ, value, start_pos, prefix)
    else:
        if typ == INDENT:
            # For every deleted INDENT we have to delete a DEDENT as well.
            # Otherwise the parser will get into trouble and DEDENT too early.
            self._omit_dedent_list.append(self._indent_counter)

        error_leaf = tree.PythonErrorLeaf(tok_name[typ].lower(), value, start_pos, prefix)
        stack[-1][2][1].append(error_leaf)

    if symbol == 'suite':
        dfa, state, node = stack[-1]
        states, first = dfa
        arcs = states[state]
        intended_label = pgen_grammar.symbol2label['stmt']
        # Introduce a proper state transition. We're basically allowing
        # there to be no valid statements inside a suite.
        if [x[0] for x in arcs] == [intended_label]:
            new_state = arcs[0][1]
            stack[-1] = dfa, new_state, node

</t>
<t tx="ekr.20180519070854.211">def _stack_removal(self, pgen_grammar, stack, arcs, start_index, value, start_pos):
    failed_stack = False
    found = False
    all_nodes = []
    for dfa, state, (type_, nodes) in stack[start_index:]:
        if nodes:
            found = True
        if found:
            failed_stack = True
            all_nodes += nodes
    if failed_stack:
        stack[start_index - 1][2][1].append(tree.PythonErrorNode(all_nodes))

    stack[start_index:] = []
    return failed_stack

</t>
<t tx="ekr.20180519070854.212">def _recovery_tokenize(self, tokens):
    for typ, value, start_pos, prefix in tokens:
        # print(tok_name[typ], repr(value), start_pos, repr(prefix))
        if typ == DEDENT:
            # We need to count indents, because if we just omit any DEDENT,
            # we might omit them in the wrong place.
            o = self._omit_dedent_list
            if o and o[-1] == self._indent_counter:
                o.pop()
                continue

            self._indent_counter -= 1
        elif typ == INDENT:
            self._indent_counter += 1
        yield typ, value, start_pos, prefix
</t>
<t tx="ekr.20180519070854.213">@path C:/Anaconda3/Lib/site-packages/parso/python/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070854.214">import re
from contextlib import contextmanager

from parso.python.errors import ErrorFinder, ErrorFinderConfig
from parso.normalizer import Rule
from parso.python.tree import search_ancestor, Flow, Scope


_IMPORT_TYPES = ('import_name', 'import_from')
_SUITE_INTRODUCERS = ('classdef', 'funcdef', 'if_stmt', 'while_stmt',
                      'for_stmt', 'try_stmt', 'with_stmt')
_NON_STAR_TYPES = ('term', 'import_from', 'power')
_OPENING_BRACKETS = '(', '[', '{'
_CLOSING_BRACKETS = ')', ']', '}'
_FACTOR = '+', '-', '~'
_ALLOW_SPACE = '*', '+', '-', '**', '/', '//', '@'
_BITWISE_OPERATOR = '&lt;&lt;', '&gt;&gt;', '|', '&amp;', '^'
_NEEDS_SPACE = ('=', '%', '-&gt;',
                '&lt;', '&gt;', '==', '&gt;=', '&lt;=', '&lt;&gt;', '!=',
                '+=', '-=', '*=', '@=', '/=', '%=', '&amp;=', '|=', '^=', '&lt;&lt;=',
                '&gt;&gt;=', '**=', '//=')
_NEEDS_SPACE += _BITWISE_OPERATOR
_IMPLICIT_INDENTATION_TYPES = ('dictorsetmaker', 'argument')
_POSSIBLE_SLICE_PARENTS = ('subscript', 'subscriptlist', 'sliceop')


</t>
<t tx="ekr.20180519070854.215">class IndentationTypes(object):
    VERTICAL_BRACKET = object()
    HANGING_BRACKET = object()
    BACKSLASH = object()
    SUITE = object()
    IMPLICIT = object()


</t>
<t tx="ekr.20180519070854.216">class IndentationNode(object):
    type = IndentationTypes.SUITE

    @others
</t>
<t tx="ekr.20180519070854.217">def __init__(self, config, indentation, parent=None):
    self.bracket_indentation = self.indentation = indentation
    self.parent = parent

</t>
<t tx="ekr.20180519070854.218">def __repr__(self):
    return '&lt;%s&gt;' % self.__class__.__name__

</t>
<t tx="ekr.20180519070854.219">def get_latest_suite_node(self):
    n = self
    while n is not None:
        if n.type == IndentationTypes.SUITE:
            return n

        n = n.parent


</t>
<t tx="ekr.20180519070854.22">def _push(self, type_, newdfa, newstate):
    """Push a nonterminal.  (Internal)"""
    dfa, state, node = self.stack[-1]
    newnode = (type_, [])
    self.stack[-1] = (dfa, newstate, node)
    self.stack.append((newdfa, 0, newnode))

</t>
<t tx="ekr.20180519070854.220">class BracketNode(IndentationNode):
    @others
</t>
<t tx="ekr.20180519070854.221">def __init__(self, config, leaf, parent, in_suite_introducer=False):
    self.leaf = leaf

    # Figure out here what the indentation is. For chained brackets
    # we can basically use the previous indentation.
    previous_leaf = leaf
    n = parent
    if n.type == IndentationTypes.IMPLICIT:
        n = n.parent
    while True:
        if hasattr(n, 'leaf') and previous_leaf.line != n.leaf.line:
            break

        previous_leaf = previous_leaf.get_previous_leaf()
        if not isinstance(n, BracketNode) or previous_leaf != n.leaf:
            break
        n = n.parent
    parent_indentation = n.indentation


    next_leaf = leaf.get_next_leaf()
    if '\n' in next_leaf.prefix:
        # This implies code like:
        # foobarbaz(
        #     a,
        #     b,
        # )
        self.bracket_indentation = parent_indentation \
            + config.closing_bracket_hanging_indentation
        self.indentation = parent_indentation + config.indentation
        self.type = IndentationTypes.HANGING_BRACKET
    else:
        # Implies code like:
        # foobarbaz(
        #           a,
        #           b,
        #           )
        expected_end_indent = leaf.end_pos[1]
        if '\t' in config.indentation:
            self.indentation = None
        else:
            self.indentation =  ' ' * expected_end_indent
        self.bracket_indentation = self.indentation
        self.type = IndentationTypes.VERTICAL_BRACKET

    if in_suite_introducer and parent.type == IndentationTypes.SUITE \
            and self.indentation == parent_indentation + config.indentation:
        self.indentation += config.indentation
        # The closing bracket should have the same indentation.
        self.bracket_indentation = self.indentation
    self.parent = parent


</t>
<t tx="ekr.20180519070854.222">class ImplicitNode(BracketNode):
    """
    Implicit indentation after keyword arguments, default arguments,
    annotations and dict values.
    """
    @others
</t>
<t tx="ekr.20180519070854.223">def __init__(self, config, leaf, parent):
    super(ImplicitNode, self).__init__(config, leaf, parent)
    self.type = IndentationTypes.IMPLICIT

    next_leaf = leaf.get_next_leaf()
    if leaf == ':' and '\n' not in next_leaf.prefix:
        self.indentation += ' '


</t>
<t tx="ekr.20180519070854.224">class BackslashNode(IndentationNode):
    type = IndentationTypes.BACKSLASH

    @others
</t>
<t tx="ekr.20180519070854.225">def __init__(self, config, parent_indentation, containing_leaf, spacing, parent=None):
    expr_stmt = search_ancestor(containing_leaf, 'expr_stmt')
    if expr_stmt is not None:
        equals = expr_stmt.children[-2]

        if '\t' in config.indentation:
            # TODO unite with the code of BracketNode
            self.indentation = None
        else:
            # If the backslash follows the equals, use normal indentation
            # otherwise it should align with the equals.
            if equals.end_pos == spacing.start_pos:
                self.indentation = parent_indentation + config.indentation
            else:
                # +1 because there is a space.
                self.indentation =  ' ' * (equals.end_pos[1] + 1)
    else:
        self.indentation = parent_indentation + config.indentation
    self.bracket_indentation = self.indentation
    self.parent = parent


</t>
<t tx="ekr.20180519070854.226">def _is_magic_name(name):
    return name.value.startswith('__') and name.value.endswith('__')


</t>
<t tx="ekr.20180519070854.227">class PEP8Normalizer(ErrorFinder):
    @others
</t>
<t tx="ekr.20180519070854.228">def __init__(self, *args, **kwargs):
    super(PEP8Normalizer, self).__init__(*args, **kwargs)
    self._previous_part = None
    self._previous_leaf = None
    self._on_newline = True
    self._newline_count = 0
    self._wanted_newline_count = None
    self._max_new_lines_in_prefix = 0
    self._new_statement = True
    self._implicit_indentation_possible = False
    # The top of stack of the indentation nodes.
    self._indentation_tos = self._last_indentation_tos = \
        IndentationNode(self._config, indentation='')
    self._in_suite_introducer = False

    if ' ' in self._config.indentation:
        self._indentation_type = 'spaces'
        self._wrong_indentation_char = '\t'
    else:
        self._indentation_type = 'tabs'
        self._wrong_indentation_char = ' '

</t>
<t tx="ekr.20180519070854.229">@contextmanager
def visit_node(self, node):
    with super(PEP8Normalizer, self).visit_node(node):
        with self._visit_node(node):
            yield

</t>
<t tx="ekr.20180519070854.23">def _pop(self):
    """Pop a nonterminal.  (Internal)"""
    popdfa, popstate, (type_, children) = self.stack.pop()
    # If there's exactly one child, return that child instead of creating a
    # new node.  We still create expr_stmt and file_input though, because a
    # lot of Jedi depends on its logic.
    if len(children) == 1:
        newnode = children[0]
    else:
        newnode = self.convert_node(self.grammar, type_, children)

    try:
        # Equal to:
        # dfa, state, node = self.stack[-1]
        # symbol, children = node
        self.stack[-1][2][1].append(newnode)
    except IndexError:
        # Stack is empty, set the rootnode.
        self.rootnode = newnode
</t>
<t tx="ekr.20180519070854.230">@contextmanager
def _visit_node(self, node):
    typ = node.type

    if typ in 'import_name':
        names = node.get_defined_names()
        if len(names) &gt; 1:
            for name in names[:1]:
                self.add_issue(name, 401, 'Multiple imports on one line')
    elif typ == 'lambdef':
        expr_stmt = node.parent
        # Check if it's simply defining a single name, not something like
        # foo.bar or x[1], where using a lambda could make more sense.
        if expr_stmt.type == 'expr_stmt' and any(n.type == 'name' for n in expr_stmt.children[:-2:2]):
            self.add_issue(node, 731, 'Do not assign a lambda expression, use a def')
    elif typ == 'try_stmt':
        for child in node.children:
            # Here we can simply check if it's an except, because otherwise
            # it would be an except_clause.
            if child.type == 'keyword' and child.value == 'except':
                self.add_issue(child, 722, 'Do not use bare except, specify exception instead')
    elif typ == 'comparison':
        for child in node.children:
            if child.type not in ('atom_expr', 'power'):
                continue
            if len(child.children) &gt; 2:
                continue
            trailer = child.children[1]
            atom = child.children[0]
            if trailer.type == 'trailer' and atom.type == 'name' \
                    and atom.value == 'type':
                self.add_issue(node, 721, "Do not compare types, use 'isinstance()")
                break
    elif typ == 'file_input':
        endmarker = node.children[-1]
        prev = endmarker.get_previous_leaf()
        prefix = endmarker.prefix
        if (not prefix.endswith('\n') and (
                prefix or prev is None or prev.value != '\n')):
            self.add_issue(endmarker, 292, "No newline at end of file")

    if typ in _IMPORT_TYPES:
        simple_stmt = node.parent
        module = simple_stmt.parent
        #if module.type == 'simple_stmt':
        if module.type == 'file_input':
            index = module.children.index(simple_stmt)
            for child in module.children[:index]:
                children = [child]
                if child.type == 'simple_stmt':
                    # Remove the newline.
                    children = child.children[:-1]

                found_docstring = False
                for c in children:
                    if c.type == 'string' and not found_docstring:
                        continue
                    found_docstring = True

                    if c.type == 'expr_stmt' and \
                            all(_is_magic_name(n) for n in c.get_defined_names()):
                        continue

                    if c.type in _IMPORT_TYPES or isinstance(c, Flow):
                        continue

                    self.add_issue(node, 402, 'Module level import not at top of file')
                    break
                else:
                    continue
                break

    implicit_indentation_possible = typ in _IMPLICIT_INDENTATION_TYPES
    in_introducer = typ in _SUITE_INTRODUCERS
    if in_introducer:
        self._in_suite_introducer = True
    elif typ == 'suite':
        if self._indentation_tos.type == IndentationTypes.BACKSLASH:
            self._indentation_tos = self._indentation_tos.parent

        self._indentation_tos = IndentationNode(
            self._config,
            self._indentation_tos.indentation + self._config.indentation,
            parent=self._indentation_tos
        )
    elif implicit_indentation_possible:
        self._implicit_indentation_possible = True
    yield
    if typ == 'suite':
        assert self._indentation_tos.type == IndentationTypes.SUITE
        self._indentation_tos = self._indentation_tos.parent
        # If we dedent, no lines are needed anymore.
        self._wanted_newline_count = None
    elif implicit_indentation_possible:
        self._implicit_indentation_possible = False
        if self._indentation_tos.type == IndentationTypes.IMPLICIT:
            self._indentation_tos = self._indentation_tos.parent
    elif in_introducer:
        self._in_suite_introducer = False
        if typ in ('classdef', 'funcdef'):
            self._wanted_newline_count = self._get_wanted_blank_lines_count()

</t>
<t tx="ekr.20180519070854.231">def _check_tabs_spaces(self, spacing):
    if self._wrong_indentation_char in spacing.value:
        self.add_issue(spacing, 101, 'Indentation contains ' + self._indentation_type)
        return True
    return False

</t>
<t tx="ekr.20180519070854.232">def _get_wanted_blank_lines_count(self):
    suite_node = self._indentation_tos.get_latest_suite_node()
    return int(suite_node.parent is None) + 1

</t>
<t tx="ekr.20180519070854.233">def _reset_newlines(self, spacing, leaf, is_comment=False):
    self._max_new_lines_in_prefix = \
        max(self._max_new_lines_in_prefix, self._newline_count)

    wanted = self._wanted_newline_count
    if wanted is not None:
        # Need to substract one
        blank_lines = self._newline_count - 1
        if wanted &gt; blank_lines and leaf.type != 'endmarker':
            # In case of a comment we don't need to add the issue, yet.
            if not is_comment:
                # TODO end_pos wrong.
                code = 302 if wanted == 2 else 301
                message = "expected %s blank line, found %s" \
                    % (wanted, blank_lines)
                self.add_issue(spacing, code, message)
                self._wanted_newline_count = None
        else:
            self._wanted_newline_count = None

    if not is_comment:
        wanted = self._get_wanted_blank_lines_count()
        actual = self._max_new_lines_in_prefix - 1

        val = leaf.value
        needs_lines = (
            val == '@' and leaf.parent.type == 'decorator'
            or (
                val == 'class'
                or val == 'async' and leaf.get_next_leaf() == 'def'
                or val == 'def' and self._previous_leaf != 'async'
            ) and leaf.parent.parent.type != 'decorated'
        )
        if needs_lines and actual &lt; wanted:
            func_or_cls = leaf.parent
            suite = func_or_cls.parent
            if suite.type == 'decorated':
                suite = suite.parent

            # The first leaf of a file or a suite should not need blank
            # lines.
            if suite.children[int(suite.type == 'suite')] != func_or_cls:
                code = 302 if wanted == 2 else 301
                message = "expected %s blank line, found %s" \
                    % (wanted, actual)
                self.add_issue(spacing, code, message)

        self._max_new_lines_in_prefix = 0

    self._newline_count = 0

</t>
<t tx="ekr.20180519070854.234">def visit_leaf(self, leaf):
    super(PEP8Normalizer, self).visit_leaf(leaf)
    for part in leaf._split_prefix():
        if part.type == 'spacing':
            # This part is used for the part call after for.
            break
        self._visit_part(part, part.create_spacing_part(), leaf)

    self._analyse_non_prefix(leaf)
    self._visit_part(leaf, part, leaf)

    # Cleanup
    self._last_indentation_tos = self._indentation_tos

    self._new_statement = leaf.type == 'newline'

    # TODO does this work? with brackets and stuff?
    if leaf.type == 'newline' and \
            self._indentation_tos.type == IndentationTypes.BACKSLASH:
        self._indentation_tos = self._indentation_tos.parent

    if leaf.value == ':' and leaf.parent.type in _SUITE_INTRODUCERS:
        self._in_suite_introducer = False
    elif leaf.value == 'elif':
        self._in_suite_introducer = True

    if not self._new_statement:
        self._reset_newlines(part, leaf)
        self._max_blank_lines = 0

    self._previous_leaf = leaf

    return leaf.value

</t>
<t tx="ekr.20180519070854.235">def _visit_part(self, part, spacing, leaf):
    value = part.value
    type_ = part.type
    if type_ == 'error_leaf':
        return

    if value == ',' and part.parent.type == 'dictorsetmaker':
        self._indentation_tos = self._indentation_tos.parent

    node = self._indentation_tos

    if type_ == 'comment':
        if value.startswith('##'):
            # Whole blocks of # should not raise an error.
            if value.lstrip('#'):
                self.add_issue(part, 266, "Too many leading '#' for block comment.")
        elif self._on_newline:
            if not re.match('#:? ', value) and not value == '#' \
                    and not (value.startswith('#!') and part.start_pos == (1, 0)):
                self.add_issue(part, 265, "Block comment should start with '# '")
        else:
            if not re.match('#:? [^ ]', value):
                self.add_issue(part, 262, "Inline comment should start with '# '")

        self._reset_newlines(spacing, leaf, is_comment=True)
    elif type_ == 'newline':
        if self._newline_count &gt; self._get_wanted_blank_lines_count():
            self.add_issue(part, 303, "Too many blank lines (%s)" % self._newline_count)
        elif leaf in ('def', 'class') \
                and leaf.parent.parent.type == 'decorated':
            self.add_issue(part, 304, "Blank lines found after function decorator")


        self._newline_count += 1

    if type_ == 'backslash':
        # TODO is this enough checking? What about ==?
        if node.type != IndentationTypes.BACKSLASH:
            if node.type != IndentationTypes.SUITE:
                self.add_issue(part, 502, 'The backslash is redundant between brackets')
            else:
                indentation = node.indentation
                if self._in_suite_introducer and node.type == IndentationTypes.SUITE:
                    indentation += self._config.indentation

                self._indentation_tos = BackslashNode(
                    self._config,
                    indentation,
                    part,
                    spacing,
                    parent=self._indentation_tos
                )
    elif self._on_newline:
        indentation = spacing.value
        if node.type == IndentationTypes.BACKSLASH \
                and self._previous_part.type == 'newline':
            self._indentation_tos = self._indentation_tos.parent

        if not self._check_tabs_spaces(spacing):
            should_be_indentation = node.indentation
            if type_ == 'comment':
                # Comments can be dedented. So we have to care for that.
                n = self._last_indentation_tos
                while True:
                    if len(indentation) &gt; len(n.indentation):
                        break

                    should_be_indentation = n.indentation

                    self._last_indentation_tos = n
                    if n == node:
                        break
                    n = n.parent

            if self._new_statement:
                if type_ == 'newline':
                    if indentation:
                        self.add_issue(spacing, 291, 'Trailing whitespace')
                elif indentation != should_be_indentation:
                    s = '%s %s' % (len(self._config.indentation), self._indentation_type)
                    self.add_issue(part, 111, 'Indentation is not a multiple of ' + s)
            else:
                if value in '])}':
                    should_be_indentation = node.bracket_indentation
                else:
                    should_be_indentation = node.indentation
                if self._in_suite_introducer and indentation == \
                            node.get_latest_suite_node().indentation \
                            + self._config.indentation:
                        self.add_issue(part, 129, "Line with same indent as next logical block")
                elif indentation != should_be_indentation:
                    if not self._check_tabs_spaces(spacing) and part.value != '\n':
                        if value in '])}':
                            if node.type == IndentationTypes.VERTICAL_BRACKET:
                                self.add_issue(part, 124, "Closing bracket does not match visual indentation")
                            else:
                                self.add_issue(part, 123, "Losing bracket does not match indentation of opening bracket's line")
                        else:
                            if len(indentation) &lt; len(should_be_indentation):
                                if node.type == IndentationTypes.VERTICAL_BRACKET:
                                    self.add_issue(part, 128, 'Continuation line under-indented for visual indent')
                                elif node.type == IndentationTypes.BACKSLASH:
                                    self.add_issue(part, 122, 'Continuation line missing indentation or outdented')
                                elif node.type == IndentationTypes.IMPLICIT:
                                    self.add_issue(part, 135, 'xxx')
                                else:
                                    self.add_issue(part, 121, 'Continuation line under-indented for hanging indent')
                            else:
                                if node.type == IndentationTypes.VERTICAL_BRACKET:
                                    self.add_issue(part, 127, 'Continuation line over-indented for visual indent')
                                elif node.type == IndentationTypes.IMPLICIT:
                                    self.add_issue(part, 136, 'xxx')
                                else:
                                    self.add_issue(part, 126, 'Continuation line over-indented for hanging indent')
    else:
        self._check_spacing(part, spacing)

    self._check_line_length(part, spacing)
    # -------------------------------
    # Finalizing. Updating the state.
    # -------------------------------
    if value and value in '()[]{}' and type_ != 'error_leaf' \
            and part.parent.type != 'error_node':
        if value in _OPENING_BRACKETS:
            self._indentation_tos = BracketNode(
                self._config, part,
                parent=self._indentation_tos,
                in_suite_introducer=self._in_suite_introducer
            )
        else:
            assert node.type != IndentationTypes.IMPLICIT
            self._indentation_tos = self._indentation_tos.parent
    elif value in ('=', ':') and self._implicit_indentation_possible \
            and part.parent.type in _IMPLICIT_INDENTATION_TYPES:
        indentation = node.indentation
        self._indentation_tos = ImplicitNode(
            self._config, part, parent=self._indentation_tos
        )

    self._on_newline = type_ in ('newline', 'backslash', 'bom')

    self._previous_part = part
    self._previous_spacing = spacing

</t>
<t tx="ekr.20180519070854.236">def _check_line_length(self, part, spacing):
    if part.type == 'backslash':
        last_column = part.start_pos[1] + 1
    else:
        last_column = part.end_pos[1]
    if last_column &gt; self._config.max_characters \
            and spacing.start_pos[1] &lt;= self._config.max_characters :
        # Special case for long URLs in multi-line docstrings or comments,
        # but still report the error when the 72 first chars are whitespaces.
        report = True
        if part.type == 'comment':
            splitted = part.value[1:].split()
            if len(splitted) == 1 \
                    and (part.end_pos[1] - len(splitted[0])) &lt; 72:
                report = False
        if report:
            self.add_issue(
                part,
                501,
                'Line too long (%s &gt; %s characters)' %
                    (last_column, self._config.max_characters),
            )

</t>
<t tx="ekr.20180519070854.237">def _check_spacing(self, part, spacing):
    def add_if_spaces(*args):
        if spaces:
            return self.add_issue(*args)

    def add_not_spaces(*args):
        if not spaces:
            return self.add_issue(*args)

    spaces = spacing.value
    prev = self._previous_part
    if prev is not None and prev.type == 'error_leaf' or part.type == 'error_leaf':
        return

    type_ = part.type
    if '\t' in spaces:
        self.add_issue(spacing, 223, 'Used tab to separate tokens')
    elif type_ == 'comment':
        if len(spaces) &lt; self._config.spaces_before_comment:
            self.add_issue(spacing, 261, 'At least two spaces before inline comment')
    elif type_ == 'newline':
        add_if_spaces(spacing, 291, 'Trailing whitespace')
    elif len(spaces) &gt; 1:
        self.add_issue(spacing, 221, 'Multiple spaces used')
    else:
        if prev in _OPENING_BRACKETS:
            message = "Whitespace after '%s'" % part.value
            add_if_spaces(spacing, 201, message)
        elif part in _CLOSING_BRACKETS:
            message = "Whitespace before '%s'" % part.value
            add_if_spaces(spacing, 202, message)
        elif part in (',', ';') or part == ':' \
                and part.parent.type not in  _POSSIBLE_SLICE_PARENTS:
            message = "Whitespace before '%s'" % part.value
            add_if_spaces(spacing, 203, message)
        elif prev == ':' and prev.parent.type in _POSSIBLE_SLICE_PARENTS:
            pass # TODO
        elif prev in (',', ';', ':'):
            add_not_spaces(spacing, 231, "missing whitespace after '%s'")
        elif part == ':':  # Is a subscript
            # TODO
            pass
        elif part in ('*', '**') and part.parent.type not in _NON_STAR_TYPES \
                or prev in ('*', '**') \
                and prev.parent.type not in _NON_STAR_TYPES:
            # TODO
            pass
        elif prev in _FACTOR and prev.parent.type == 'factor':
            pass
        elif prev == '@' and prev.parent.type == 'decorator':
            pass  # TODO should probably raise an error if there's a space here
        elif part in _NEEDS_SPACE or prev in _NEEDS_SPACE:
            if part == '=' and part.parent.type in ('argument', 'param') \
                    or prev == '=' and prev.parent.type in ('argument', 'param'):
                if part == '=':
                    param = part.parent
                else:
                    param = prev.parent
                if param.type == 'param' and param.annotation:
                    add_not_spaces(spacing, 252, 'Expected spaces around annotation equals')
                else:
                    add_if_spaces(spacing, 251, 'Unexpected spaces around keyword / parameter equals')
            elif part in _BITWISE_OPERATOR or prev in _BITWISE_OPERATOR:
                add_not_spaces(spacing, 227, 'Missing whitespace around bitwise or shift operator')
            elif part == '%' or prev == '%':
                add_not_spaces(spacing, 228, 'Missing whitespace around modulo operator')
            else:
                message_225 = 'Missing whitespace between tokens'
                add_not_spaces(spacing, 225, message_225)
        elif type_ == 'keyword' or prev.type == 'keyword':
            add_not_spaces(spacing, 275, 'Missing whitespace around keyword')
        else:
            prev_spacing = self._previous_spacing
            if prev in _ALLOW_SPACE and spaces != prev_spacing.value \
                    and '\n' not in self._previous_leaf.prefix:
                message = "Whitespace before operator doesn't match with whitespace after"
                self.add_issue(spacing, 229, message)

            if spaces and part not in _ALLOW_SPACE and prev not in _ALLOW_SPACE:
                message_225 = 'Missing whitespace between tokens'
                #print('xy', spacing)
                #self.add_issue(spacing, 225, message_225)
                # TODO why only brackets?
                if part in _OPENING_BRACKETS:
                    message = "Whitespace before '%s'" % part.value
                    add_if_spaces(spacing, 211, message)

</t>
<t tx="ekr.20180519070854.238">def _analyse_non_prefix(self, leaf):
    typ = leaf.type
    if typ == 'name' and leaf.value in ('l', 'O', 'I'):
        if leaf.is_definition():
            message = "Do not define %s named 'l', 'O', or 'I' one line"
            if leaf.parent.type == 'class' and leaf.parent.name == leaf:
                self.add_issue(leaf, 742, message % 'classes')
            elif leaf.parent.type == 'function' and leaf.parent.name == leaf:
                self.add_issue(leaf, 743, message % 'function')
            else:
                self.add_issuadd_issue(741, message % 'variables', leaf)
    elif leaf.value == ':':
        if isinstance(leaf.parent, (Flow, Scope)) and leaf.parent.type != 'lambdef':
            next_leaf = leaf.get_next_leaf()
            if next_leaf.type != 'newline':
                if leaf.parent.type == 'funcdef':
                    self.add_issue(next_leaf, 704, 'Multiple statements on one line (def)')
                else:
                    self.add_issue(next_leaf, 701, 'Multiple statements on one line (colon)')
    elif leaf.value == ';':
        if leaf.get_next_leaf().type in ('newline', 'endmarker'):
            self.add_issue(leaf, 703, 'Statement ends with a semicolon')
        else:
            self.add_issue(leaf, 702, 'Multiple statements on one line (semicolon)')
    elif leaf.value in ('==', '!='):
        comparison = leaf.parent
        index = comparison.children.index(leaf)
        left = comparison.children[index - 1]
        right = comparison.children[index + 1]
        for node in left, right:
            if node.type == 'keyword' or node.type == 'name':
                if node.value == 'None':
                    message = "comparison to None should be 'if cond is None:'"
                    self.add_issue(leaf, 711, message)
                    break
                elif node.value in ('True', 'False'):
                    message = "comparison to False/True should be 'if cond is True:' or 'if cond:'"
                    self.add_issue(leaf, 712, message)
                    break
    elif leaf.value in ('in', 'is'):
        comparison = leaf.parent
        if comparison.type == 'comparison' and comparison.parent.type == 'not_test':
            if leaf.value == 'in':
                self.add_issue(leaf, 713, "test for membership should be 'not in'")
            else:
                self.add_issue(leaf, 714, "test for object identity should be 'is not'")
    elif typ == 'string':
        # Checking multiline strings
        for i, line in enumerate(leaf.value.splitlines()[1:]):
            indentation = re.match('[ \t]*', line).group(0)
            start_pos = leaf.line + i, len(indentation)
            # TODO check multiline indentation.
    elif typ == 'endmarker':
        if self._newline_count &gt;= 2:
            self.add_issue(leaf, 391, 'Blank line at end of file')

</t>
<t tx="ekr.20180519070854.239">def add_issue(self, node, code, message):
    if self._previous_leaf is not None:
        if search_ancestor(self._previous_leaf, 'error_node') is not None:
            return
        if self._previous_leaf.type == 'error_leaf':
            return
    if search_ancestor(node, 'error_node') is not None:
        return
    if code in (901, 903):
        # 901 and 903 are raised by the ErrorFinder.
        super(PEP8Normalizer, self).add_issue(node, code, message)
    else:
        # Skip ErrorFinder here, because it has custom behavior.
        super(ErrorFinder, self).add_issue(node, code, message)


</t>
<t tx="ekr.20180519070854.24">@path C:/Anaconda3/Lib/site-packages/parso/pgen2/
# Copyright 2004-2005 Elemental Security, Inc. All Rights Reserved.
# Licensed to PSF under a Contributor Agreement.

# Modifications:
# Copyright 2014 David Halter. Integration into Jedi.
# Modifications are dual-licensed: MIT and PSF.

@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070854.240">class PEP8NormalizerConfig(ErrorFinderConfig):
    normalizer_class = PEP8Normalizer
    """
    Normalizing to PEP8. Not really implemented, yet.
    """
    @others
# TODO this is not yet ready.
#@PEP8Normalizer.register_rule(type='endmarker')
</t>
<t tx="ekr.20180519070854.241">def __init__(self, indentation=' ' * 4, hanging_indentation=None,
             max_characters=79, spaces_before_comment=2):
    self.indentation = indentation
    if hanging_indentation is None:
        hanging_indentation = indentation
    self.hanging_indentation = hanging_indentation
    self.closing_bracket_hanging_indentation = ''
    self.break_after_binary = False
    self.max_characters = max_characters
    self.spaces_before_comment = spaces_before_comment


</t>
<t tx="ekr.20180519070854.242">class BlankLineAtEnd(Rule):
    code = 392
    message = 'Blank line at end of file'

    @others
</t>
<t tx="ekr.20180519070854.243">def is_issue(self, leaf):
    return self._newline_count &gt;= 2
</t>
<t tx="ekr.20180519070854.244">@path C:/Anaconda3/Lib/site-packages/parso/python/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070854.245">import re
from codecs import BOM_UTF8

from parso.python.tokenize import group

unicode_bom = BOM_UTF8.decode('utf-8')


</t>
<t tx="ekr.20180519070854.246">class PrefixPart(object):
    @others
_comment = r'#[^\n\r\f]*'
_backslash = r'\\\r?\n'
_newline = r'\r?\n'
_form_feed = r'\f'
_only_spacing = '$'
_spacing = r'[ \t]*'
_bom = unicode_bom

_regex = group(
    _comment, _backslash, _newline, _form_feed, _only_spacing, _bom,
    capture=True
)
_regex = re.compile(group(_spacing, capture=True) + _regex)


_types = {
    '#': 'comment',
    '\\': 'backslash',
    '\f': 'formfeed',
    '\n': 'newline',
    '\r': 'newline',
    unicode_bom: 'bom'
}


</t>
<t tx="ekr.20180519070854.247">def __init__(self, leaf, typ, value, spacing='', start_pos=None):
    assert start_pos is not None
    self.parent = leaf
    self.type = typ
    self.value = value
    self.spacing = spacing
    self.start_pos = start_pos

</t>
<t tx="ekr.20180519070854.248">@property
def end_pos(self):
    if self.value.endswith('\n'):
        return self.start_pos[0] + 1, 0
    if self.value == unicode_bom:
        # The bom doesn't have a length at the start of a Python file.
        return self.start_pos
    return self.start_pos[0], self.start_pos[1] + len(self.value)

</t>
<t tx="ekr.20180519070854.249">def create_spacing_part(self):
    column = self.start_pos[1] - len(self.spacing)
    return PrefixPart(
        self.parent, 'spacing', self.spacing,
        start_pos=(self.start_pos[0], column)
    )

</t>
<t tx="ekr.20180519070854.25">from parso.pgen2 import grammar
from parso.python import token
from parso.python import tokenize
from parso.utils import parse_version_string


</t>
<t tx="ekr.20180519070854.250">def __repr__(self):
    return '%s(%s, %s, %s)' % (
        self.__class__.__name__,
        self.type,
        repr(self.value),
        self.start_pos
    )


</t>
<t tx="ekr.20180519070854.251">def split_prefix(leaf, start_pos):
    line, column = start_pos
    start = 0
    value = spacing = ''
    bom = False
    while start != len(leaf.prefix):
        match =_regex.match(leaf.prefix, start)
        spacing = match.group(1)
        value = match.group(2)
        if not value:
            break
        type_ = _types[value[0]]
        yield PrefixPart(
            leaf, type_, value, spacing,
            start_pos=(line, column + start - int(bom) + len(spacing))
        )
        if type_ == 'bom':
            bom = True

        start = match.end(0)
        if value.endswith('\n'):
            line += 1
            column = -start

    if value:
        spacing = ''
    yield PrefixPart(
        leaf, 'spacing', spacing,
        start_pos=(line, column + start)
    )
</t>
<t tx="ekr.20180519070854.252">@path C:/Anaconda3/Lib/site-packages/parso/python/
@others
@language python
@tabwidth -4
@ignore
# Can't be fixed without changing the code.
</t>
<t tx="ekr.20180519070854.253">from __future__ import absolute_import
from itertools import count
from token import *

from parso._compatibility import py_version


_counter = count(N_TOKENS)
# Never want to see this thing again.
del N_TOKENS

COMMENT = next(_counter)
tok_name[COMMENT] = 'COMMENT'

NL = next(_counter)
tok_name[NL] = 'NL'

# Sets the attributes that don't exist in these tok_name versions.
if py_version &gt;= 30:
    BACKQUOTE = next(_counter)
    tok_name[BACKQUOTE] = 'BACKQUOTE'
else:
    RARROW = next(_counter)
    tok_name[RARROW] = 'RARROW'
    ELLIPSIS = next(_counter)
    tok_name[ELLIPSIS] = 'ELLIPSIS'

if py_version &lt; 35:
    ATEQUAL = next(_counter)
    tok_name[ATEQUAL] = 'ATEQUAL'

ERROR_DEDENT = next(_counter)
tok_name[ERROR_DEDENT] = 'ERROR_DEDENT'

FSTRING_START = next(_counter)
tok_name[FSTRING_START] = 'FSTRING_START'
FSTRING_END = next(_counter)
tok_name[FSTRING_END] = 'FSTRING_END'
FSTRING_STRING = next(_counter)
tok_name[FSTRING_STRING] = 'FSTRING_STRING'
EXCLAMATION = next(_counter)
tok_name[EXCLAMATION] = 'EXCLAMATION'

# Map from operator to number (since tokenize doesn't do this)

opmap_raw = """\
( LPAR
) RPAR
[ LSQB
] RSQB
: COLON
, COMMA
; SEMI
+ PLUS
- MINUS
* STAR
/ SLASH
| VBAR
&amp; AMPER
&lt; LESS
&gt; GREATER
= EQUAL
. DOT
% PERCENT
` BACKQUOTE
{ LBRACE
} RBRACE
@ AT
== EQEQUAL
!= NOTEQUAL
&lt;&gt; NOTEQUAL
&lt;= LESSEQUAL
&gt;= GREATEREQUAL
~ TILDE
^ CIRCUMFLEX
&lt;&lt; LEFTSHIFT
&gt;&gt; RIGHTSHIFT
** DOUBLESTAR
+= PLUSEQUAL
-= MINEQUAL
*= STAREQUAL
/= SLASHEQUAL
%= PERCENTEQUAL
&amp;= AMPEREQUAL
|= VBAREQUAL
@= ATEQUAL
^= CIRCUMFLEXEQUAL
&lt;&lt;= LEFTSHIFTEQUAL
&gt;&gt;= RIGHTSHIFTEQUAL
**= DOUBLESTAREQUAL
// DOUBLESLASH
//= DOUBLESLASHEQUAL
-&gt; RARROW
... ELLIPSIS
! EXCLAMATION
"""

opmap = {}
for line in opmap_raw.splitlines():
    op, name = line.split()
    opmap[op] = globals()[name]


</t>
<t tx="ekr.20180519070854.254">def generate_token_id(string):
    """
    Uses a token in the grammar (e.g. `'+'` or `'and'`returns the corresponding
    ID for it. The strings are part of the grammar file.
    """
    try:
        return opmap[string]
    except KeyError:
        pass
    return globals()[string]
</t>
<t tx="ekr.20180519070854.255">@path C:/Anaconda3/Lib/site-packages/parso/python/
# -*- coding: utf-8 -*-
@others
if __name__ == "__main__":
    if len(sys.argv) &gt;= 2:
        path = sys.argv[1]
        with open(path) as f:
            code = f.read()
    else:
        code = sys.stdin.read()

    from parso.utils import python_bytes_to_unicode, parse_version_string

    if isinstance(code, bytes):
        code = python_bytes_to_unicode(code)

    for token in tokenize(code, parse_version_string()):
        print(token)
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070854.256">"""
This tokenizer has been copied from the ``tokenize.py`` standard library
tokenizer. The reason was simple: The standard library tokenizer fails
if the indentation is not right. To make it possible to do error recovery the
    tokenizer needed to be rewritten.

Basically this is a stripped down version of the standard library module, so
you can read the documentation there. Additionally we included some speed and
memory optimizations here.
"""
from __future__ import absolute_import

import sys
import string
import re
from collections import namedtuple
import itertools as _itertools
from codecs import BOM_UTF8

from parso.python.token import (tok_name, ENDMARKER, STRING, NUMBER, opmap,
                                NAME, ERRORTOKEN, NEWLINE, INDENT, DEDENT,
                                ERROR_DEDENT, FSTRING_STRING, FSTRING_START,
                                FSTRING_END)
from parso._compatibility import py_version
from parso.utils import split_lines


TokenCollection = namedtuple(
    'TokenCollection',
    'pseudo_token single_quoted triple_quoted endpats fstring_pattern_map always_break_tokens',
)

BOM_UTF8_STRING = BOM_UTF8.decode('utf-8')

_token_collection_cache = {}

if py_version &gt;= 30:
    # Python 3 has str.isidentifier() to check if a char is a valid identifier
    is_identifier = str.isidentifier
else:
    namechars = string.ascii_letters + '_'
    is_identifier = lambda s: s in namechars


</t>
<t tx="ekr.20180519070854.257">def group(*choices, **kwargs):
    capture = kwargs.pop('capture', False)  # Python 2, arrghhhhh :(
    assert not kwargs

    start = '('
    if not capture:
        start += '?:'
    return start + '|'.join(choices) + ')'


</t>
<t tx="ekr.20180519070854.258">def maybe(*choices):
    return group(*choices) + '?'


# Return the empty string, plus all of the valid string prefixes.
</t>
<t tx="ekr.20180519070854.259">def _all_string_prefixes(version_info, include_fstring=False, only_fstring=False):
    def different_case_versions(prefix):
        for s in _itertools.product(*[(c, c.upper()) for c in prefix]):
            yield ''.join(s)
    # The valid string prefixes. Only contain the lower case versions,
    #  and don't contain any permuations (include 'fr', but not
    #  'rf'). The various permutations will be generated.
    valid_string_prefixes = ['b', 'r', 'u']
    if version_info &gt;= (3, 0):
        valid_string_prefixes.append('br')

    result = set([''])
    if version_info &gt;= (3, 6) and include_fstring:
        f = ['f', 'fr']
        if only_fstring:
            valid_string_prefixes = f
            result = set()
        else:
            valid_string_prefixes += f
    elif only_fstring:
        return set()

    # if we add binary f-strings, add: ['fb', 'fbr']
    for prefix in valid_string_prefixes:
        for t in _itertools.permutations(prefix):
            # create a list with upper and lower versions of each
            #  character
            result.update(different_case_versions(t))
    if version_info &lt;= (2, 7):
        # In Python 2 the order cannot just be random.
        result.update(different_case_versions('ur'))
        result.update(different_case_versions('br'))
    return result


</t>
<t tx="ekr.20180519070854.26">class ParserGenerator(object):
    @others
</t>
<t tx="ekr.20180519070854.260">def _compile(expr):
    return re.compile(expr, re.UNICODE)


</t>
<t tx="ekr.20180519070854.261">def _get_token_collection(version_info):
    try:
        return _token_collection_cache[tuple(version_info)]
    except KeyError:
        _token_collection_cache[tuple(version_info)] = result = \
            _create_token_collection(version_info)
        return result


fstring_string_single_line = _compile(r'(?:[^{}\r\n]+|\{\{|\}\})+')
fstring_string_multi_line = _compile(r'(?:[^{}]+|\{\{|\}\})+')


</t>
<t tx="ekr.20180519070854.262">def _create_token_collection(version_info):
    # Note: we use unicode matching for names ("\w") but ascii matching for
    # number literals.
    Whitespace = r'[ \f\t]*'
    Comment = r'#[^\r\n]*'
    Name = r'\w+'

    if version_info &gt;= (3, 6):
        Hexnumber = r'0[xX](?:_?[0-9a-fA-F])+'
        Binnumber = r'0[bB](?:_?[01])+'
        Octnumber = r'0[oO](?:_?[0-7])+'
        Decnumber = r'(?:0(?:_?0)*|[1-9](?:_?[0-9])*)'
        Intnumber = group(Hexnumber, Binnumber, Octnumber, Decnumber)
        Exponent = r'[eE][-+]?[0-9](?:_?[0-9])*'
        Pointfloat = group(r'[0-9](?:_?[0-9])*\.(?:[0-9](?:_?[0-9])*)?',
                           r'\.[0-9](?:_?[0-9])*') + maybe(Exponent)
        Expfloat = r'[0-9](?:_?[0-9])*' + Exponent
        Floatnumber = group(Pointfloat, Expfloat)
        Imagnumber = group(r'[0-9](?:_?[0-9])*[jJ]', Floatnumber + r'[jJ]')
    else:
        Hexnumber = r'0[xX][0-9a-fA-F]+'
        Binnumber = r'0[bB][01]+'
        if version_info &gt;= (3, 0):
            Octnumber = r'0[oO][0-7]+'
        else:
            Octnumber = '0[oO]?[0-7]+'
        Decnumber = r'(?:0+|[1-9][0-9]*)'
        Intnumber = group(Hexnumber, Binnumber, Octnumber, Decnumber)
        Exponent = r'[eE][-+]?[0-9]+'
        Pointfloat = group(r'[0-9]+\.[0-9]*', r'\.[0-9]+') + maybe(Exponent)
        Expfloat = r'[0-9]+' + Exponent
        Floatnumber = group(Pointfloat, Expfloat)
        Imagnumber = group(r'[0-9]+[jJ]', Floatnumber + r'[jJ]')
    Number = group(Imagnumber, Floatnumber, Intnumber)

    # Note that since _all_string_prefixes includes the empty string,
    #  StringPrefix can be the empty string (making it optional).
    possible_prefixes = _all_string_prefixes(version_info)
    StringPrefix = group(*possible_prefixes)
    StringPrefixWithF = group(*_all_string_prefixes(version_info, include_fstring=True))
    fstring_prefixes = _all_string_prefixes(version_info, include_fstring=True, only_fstring=True)
    FStringStart = group(*fstring_prefixes)

    # Tail end of ' string.
    Single = r"[^'\\]*(?:\\.[^'\\]*)*'"
    # Tail end of " string.
    Double = r'[^"\\]*(?:\\.[^"\\]*)*"'
    # Tail end of ''' string.
    Single3 = r"[^'\\]*(?:(?:\\.|'(?!''))[^'\\]*)*'''"
    # Tail end of """ string.
    Double3 = r'[^"\\]*(?:(?:\\.|"(?!""))[^"\\]*)*"""'
    Triple = group(StringPrefixWithF + "'''", StringPrefixWithF + '"""')

    # Because of leftmost-then-longest match semantics, be sure to put the
    # longest operators first (e.g., if = came before ==, == would get
    # recognized as two instances of =).
    Operator = group(r"\*\*=?", r"&gt;&gt;=?", r"&lt;&lt;=?",
                     r"//=?", r"-&gt;",
                     r"[+\-*/%&amp;@`|^!=&lt;&gt;]=?",
                     r"~")

    Bracket = '[][(){}]'

    special_args = [r'\r?\n', r'[:;.,@]']
    if version_info &gt;= (3, 0):
        special_args.insert(0, r'\.\.\.')
    Special = group(*special_args)

    Funny = group(Operator, Bracket, Special)

    # First (or only) line of ' or " string.
    ContStr = group(StringPrefix + r"'[^\n'\\]*(?:\\.[^\n'\\]*)*" +
                    group("'", r'\\\r?\n'),
                    StringPrefix + r'"[^\n"\\]*(?:\\.[^\n"\\]*)*' +
                    group('"', r'\\\r?\n'))
    pseudo_extra_pool = [Comment, Triple]
    all_quotes = '"', "'", '"""', "'''"
    if fstring_prefixes:
        pseudo_extra_pool.append(FStringStart + group(*all_quotes))

    PseudoExtras = group(r'\\\r?\n|\Z', *pseudo_extra_pool)
    PseudoToken = group(Whitespace, capture=True) + \
        group(PseudoExtras, Number, Funny, ContStr, Name, capture=True)

    # For a given string prefix plus quotes, endpats maps it to a regex
    #  to match the remainder of that string. _prefix can be empty, for
    #  a normal single or triple quoted string (with no prefix).
    endpats = {}
    for _prefix in possible_prefixes:
        endpats[_prefix + "'"] = _compile(Single)
        endpats[_prefix + '"'] = _compile(Double)
        endpats[_prefix + "'''"] = _compile(Single3)
        endpats[_prefix + '"""'] = _compile(Double3)

    # A set of all of the single and triple quoted string prefixes,
    #  including the opening quotes.
    single_quoted = set()
    triple_quoted = set()
    fstring_pattern_map = {}
    for t in possible_prefixes:
        for quote in '"', "'":
            single_quoted.add(t + quote)

        for quote in '"""', "'''":
            triple_quoted.add(t + quote)

    for t in fstring_prefixes:
        for quote in all_quotes:
            fstring_pattern_map[t + quote] = quote

    ALWAYS_BREAK_TOKENS = (';', 'import', 'class', 'def', 'try', 'except',
                           'finally', 'while', 'with', 'return')
    pseudo_token_compiled = _compile(PseudoToken)
    return TokenCollection(
        pseudo_token_compiled, single_quoted, triple_quoted, endpats,
        fstring_pattern_map, ALWAYS_BREAK_TOKENS
    )


</t>
<t tx="ekr.20180519070854.263">class Token(namedtuple('Token', ['type', 'string', 'start_pos', 'prefix'])):
    @others
</t>
<t tx="ekr.20180519070854.264">@property
def end_pos(self):
    lines = split_lines(self.string)
    if len(lines) &gt; 1:
        return self.start_pos[0] + len(lines) - 1, 0
    else:
        return self.start_pos[0], self.start_pos[1] + len(self.string)


</t>
<t tx="ekr.20180519070854.265">class PythonToken(Token):
    @others
</t>
<t tx="ekr.20180519070854.266">def _get_type_name(self, exact=True):
    return tok_name[self.type]

</t>
<t tx="ekr.20180519070854.267">def __repr__(self):
    return ('TokenInfo(type=%s, string=%r, start=%r, prefix=%r)' %
            self._replace(type=self._get_type_name()))


</t>
<t tx="ekr.20180519070854.268">class FStringNode(object):
    @others
</t>
<t tx="ekr.20180519070854.269">def __init__(self, quote):
    self.quote = quote
    self.parentheses_count = 0
    self.previous_lines = ''
    self.last_string_start_pos = None
    # In the syntax there can be multiple format_spec's nested:
    # {x:{y:3}}
    self.format_spec_count = 0

</t>
<t tx="ekr.20180519070854.27">def __init__(self, bnf_text, token_namespace):
    self._bnf_text = bnf_text
    self.generator = tokenize.tokenize(
        bnf_text,
        version_info=parse_version_string('3.6')
    )
    self._gettoken()  # Initialize lookahead
    self.dfas, self.startsymbol = self._parse()
    self.first = {}  # map from symbol name to set of tokens
    self._addfirstsets()
    self._token_namespace = token_namespace

</t>
<t tx="ekr.20180519070854.270">def open_parentheses(self, character):
    self.parentheses_count += 1

</t>
<t tx="ekr.20180519070854.271">def close_parentheses(self, character):
    self.parentheses_count -= 1

</t>
<t tx="ekr.20180519070854.272">def allow_multiline(self):
    return len(self.quote) == 3

</t>
<t tx="ekr.20180519070854.273">def is_in_expr(self):
    return (self.parentheses_count - self.format_spec_count) &gt; 0


</t>
<t tx="ekr.20180519070854.274">def _check_fstring_ending(fstring_stack, token, from_start=False):
    fstring_end = float('inf')
    fstring_index = None
    for i, node in enumerate(fstring_stack):
        if from_start:
            if token.startswith(node.quote):
                fstring_index = i
                fstring_end = len(node.quote)
            else:
                continue
        else:
            try:
                end = token.index(node.quote)
            except ValueError:
                pass
            else:
                if fstring_index is None or end &lt; fstring_end:
                    fstring_index = i
                    fstring_end = end
    return fstring_index, fstring_end


</t>
<t tx="ekr.20180519070854.275">def _find_fstring_string(fstring_stack, line, lnum, pos):
    tos = fstring_stack[-1]
    if tos.is_in_expr():
        return '', pos
    else:
        new_pos = pos
        allow_multiline = tos.allow_multiline()
        if allow_multiline:
            match = fstring_string_multi_line.match(line, pos)
        else:
            match = fstring_string_single_line.match(line, pos)
        if match is None:
            string = tos.previous_lines
        else:
            if not tos.previous_lines:
                tos.last_string_start_pos = (lnum, pos)

            string = match.group(0)
            for fstring_stack_node in fstring_stack:
                try:
                    string = string[:string.index(fstring_stack_node.quote)]
                except ValueError:
                    pass  # The string was not found.

            new_pos += len(string)
            if allow_multiline and string.endswith('\n'):
                tos.previous_lines += string
                string = ''
            else:
                string = tos.previous_lines + string

        return string, new_pos


</t>
<t tx="ekr.20180519070854.276">def tokenize(code, version_info, start_pos=(1, 0)):
    """Generate tokens from a the source code (string)."""
    lines = split_lines(code, keepends=True)
    return tokenize_lines(lines, version_info, start_pos=start_pos)


</t>
<t tx="ekr.20180519070854.277">def _print_tokens(func):
    """
    A small helper function to help debug the tokenize_lines function.
    """
    def wrapper(*args, **kwargs):
        for token in func(*args, **kwargs):
            print(token)
            yield token

    return wrapper


# @_print_tokens
</t>
<t tx="ekr.20180519070854.278">def tokenize_lines(lines, version_info, start_pos=(1, 0)):
    """
    A heavily modified Python standard library tokenizer.

    Additionally to the default information, yields also the prefix of each
    token. This idea comes from lib2to3. The prefix contains all information
    that is irrelevant for the parser like newlines in parentheses or comments.
    """
    pseudo_token, single_quoted, triple_quoted, endpats, fstring_pattern_map, always_break_tokens, = \
        _get_token_collection(version_info)
    paren_level = 0  # count parentheses
    indents = [0]
    max = 0
    numchars = '0123456789'
    contstr = ''
    contline = None
    # We start with a newline. This makes indent at the first position
    # possible. It's not valid Python, but still better than an INDENT in the
    # second line (and not in the first). This makes quite a few things in
    # Jedi's fast parser possible.
    new_line = True
    prefix = ''  # Should never be required, but here for safety
    additional_prefix = ''
    first = True
    lnum = start_pos[0] - 1
    fstring_stack = []
    for line in lines:  # loop over lines in stream
        lnum += 1
        pos = 0
        max = len(line)
        if first:
            if line.startswith(BOM_UTF8_STRING):
                additional_prefix = BOM_UTF8_STRING
                line = line[1:]
                max = len(line)

            # Fake that the part before was already parsed.
            line = '^' * start_pos[1] + line
            pos = start_pos[1]
            max += start_pos[1]

            first = False

        if contstr:                                         # continued string
            endmatch = endprog.match(line)
            if endmatch:
                pos = endmatch.end(0)
                yield PythonToken(STRING, contstr + line[:pos], contstr_start, prefix)
                contstr = ''
                contline = None
            else:
                contstr = contstr + line
                contline = contline + line
                continue

        while pos &lt; max:
            if fstring_stack:
                string, pos = _find_fstring_string(fstring_stack, line, lnum, pos)
                if string:
                    yield PythonToken(
                        FSTRING_STRING, string,
                        fstring_stack[-1].last_string_start_pos,
                        # Never has a prefix because it can start anywhere and
                        # include whitespace.
                        prefix=''
                    )
                    fstring_stack[-1].previous_lines = ''
                    continue

                if pos == max:
                    break

                rest = line[pos:]
                fstring_index, end = _check_fstring_ending(fstring_stack, rest, from_start=True)

                if fstring_index is not None:
                    yield PythonToken(
                        FSTRING_END,
                        fstring_stack[fstring_index].quote,
                        (lnum, pos),
                        prefix=additional_prefix,
                    )
                    additional_prefix = ''
                    del fstring_stack[fstring_index:]
                    pos += end
                    continue

            pseudomatch = pseudo_token.match(line, pos)
            if not pseudomatch:                             # scan for tokens
                txt = line[pos:]
                if txt.endswith('\n'):
                    new_line = True
                yield PythonToken(ERRORTOKEN, txt, (lnum, pos), additional_prefix)
                additional_prefix = ''
                break

            prefix = additional_prefix + pseudomatch.group(1)
            additional_prefix = ''
            start, pos = pseudomatch.span(2)
            spos = (lnum, start)
            token = pseudomatch.group(2)
            if token == '':
                assert prefix
                additional_prefix = prefix
                # This means that we have a line with whitespace/comments at
                # the end, which just results in an endmarker.
                break
            initial = token[0]

            if new_line and initial not in '\r\n#':
                new_line = False
                if paren_level == 0 and not fstring_stack:
                    i = 0
                    while line[i] == '\f':
                        i += 1
                        # TODO don't we need to change spos as well?
                        start -= 1
                    if start &gt; indents[-1]:
                        yield PythonToken(INDENT, '', spos, '')
                        indents.append(start)
                    while start &lt; indents[-1]:
                        if start &gt; indents[-2]:
                            yield PythonToken(ERROR_DEDENT, '', (lnum, 0), '')
                            break
                        yield PythonToken(DEDENT, '', spos, '')
                        indents.pop()

            if fstring_stack:
                fstring_index, end = _check_fstring_ending(fstring_stack, token)
                if fstring_index is not None:
                    if end != 0:
                        yield PythonToken(ERRORTOKEN, token[:end], spos, prefix)
                        prefix = ''

                    yield PythonToken(
                        FSTRING_END,
                        fstring_stack[fstring_index].quote,
                        (lnum, spos[1] + 1),
                        prefix=prefix
                    )
                    del fstring_stack[fstring_index:]
                    pos -= len(token) - end
                    continue

            if (initial in numchars or                      # ordinary number
                    (initial == '.' and token != '.' and token != '...')):
                yield PythonToken(NUMBER, token, spos, prefix)
            elif initial in '\r\n':
                if any(not f.allow_multiline() for f in fstring_stack):
                    # Would use fstring_stack.clear, but that's not available
                    # in Python 2.
                    fstring_stack[:] = []

                if not new_line and paren_level == 0 and not fstring_stack:
                    yield PythonToken(NEWLINE, token, spos, prefix)
                else:
                    additional_prefix = prefix + token
                new_line = True
            elif initial == '#':  # Comments
                assert not token.endswith("\n")
                additional_prefix = prefix + token
            elif token in triple_quoted:
                endprog = endpats[token]
                endmatch = endprog.match(line, pos)
                if endmatch:                                # all on one line
                    pos = endmatch.end(0)
                    token = line[start:pos]
                    yield PythonToken(STRING, token, spos, prefix)
                else:
                    contstr_start = (lnum, start)           # multiple lines
                    contstr = line[start:]
                    contline = line
                    break
            elif initial in single_quoted or \
                    token[:2] in single_quoted or \
                    token[:3] in single_quoted:
                if token[-1] == '\n':                       # continued string
                    contstr_start = lnum, start
                    endprog = (endpats.get(initial) or endpats.get(token[1])
                               or endpats.get(token[2]))
                    contstr = line[start:]
                    contline = line
                    break
                else:                                       # ordinary string
                    yield PythonToken(STRING, token, spos, prefix)
            elif token in fstring_pattern_map:  # The start of an fstring.
                fstring_stack.append(FStringNode(fstring_pattern_map[token]))
                yield PythonToken(FSTRING_START, token, spos, prefix)
            elif is_identifier(initial):                      # ordinary name
                if token in always_break_tokens:
                    fstring_stack[:] = []
                    paren_level = 0
                    while True:
                        indent = indents.pop()
                        if indent &gt; start:
                            yield PythonToken(DEDENT, '', spos, '')
                        else:
                            indents.append(indent)
                            break
                yield PythonToken(NAME, token, spos, prefix)
            elif initial == '\\' and line[start:] in ('\\\n', '\\\r\n'):  # continued stmt
                additional_prefix += prefix + line[start:]
                break
            else:
                if token in '([{':
                    if fstring_stack:
                        fstring_stack[-1].open_parentheses(token)
                    else:
                        paren_level += 1
                elif token in ')]}':
                    if fstring_stack:
                        fstring_stack[-1].close_parentheses(token)
                    else:
                        paren_level -= 1
                elif token == ':' and fstring_stack \
                        and fstring_stack[-1].parentheses_count == 1:
                    fstring_stack[-1].format_spec_count += 1

                try:
                    # This check is needed in any case to check if it's a valid
                    # operator or just some random unicode character.
                    typ = opmap[token]
                except KeyError:
                    typ = ERRORTOKEN
                yield PythonToken(typ, token, spos, prefix)

    if contstr:
        yield PythonToken(ERRORTOKEN, contstr, contstr_start, prefix)
        if contstr.endswith('\n'):
            new_line = True

    end_pos = lnum, max
    # As the last position we just take the maximally possible position. We
    # remove -1 for the last new line.
    for indent in indents[1:]:
        yield PythonToken(DEDENT, '', end_pos, '')
    yield PythonToken(ENDMARKER, '', end_pos, additional_prefix)


</t>
<t tx="ekr.20180519070854.279">@path C:/Anaconda3/Lib/site-packages/parso/python/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070854.28">def make_grammar(self):
    c = grammar.Grammar(self._bnf_text)
    names = list(self.dfas.keys())
    names.sort()
    # TODO do we still need this?
    names.remove(self.startsymbol)
    names.insert(0, self.startsymbol)
    for name in names:
        i = 256 + len(c.symbol2number)
        c.symbol2number[name] = i
        c.number2symbol[i] = name
    for name in names:
        dfa = self.dfas[name]
        states = []
        for state in dfa:
            arcs = []
            for label, next in state.arcs.items():
                arcs.append((self._make_label(c, label), dfa.index(next)))
            if state.isfinal:
                arcs.append((0, dfa.index(state)))
            states.append(arcs)
        c.states.append(states)
        c.dfas[c.symbol2number[name]] = (states, self._make_first(c, name))
    c.start = c.symbol2number[self.startsymbol]
    return c

</t>
<t tx="ekr.20180519070854.280">"""
This is the syntax tree for Python syntaxes (2 &amp; 3).  The classes represent
syntax elements like functions and imports.

All of the nodes can be traced back to the `Python grammar file
&lt;https://docs.python.org/3/reference/grammar.html&gt;`_. If you want to know how
a tree is structured, just analyse that file (for each Python version it's a
bit different).

There's a lot of logic here that makes it easier for Jedi (and other libraries)
to deal with a Python syntax tree.

By using :py:meth:`parso.tree.NodeOrLeaf.get_code` on a module, you can get
back the 1-to-1 representation of the input given to the parser. This is
important if you want to refactor a parser tree.

&gt;&gt;&gt; from parso import parse
&gt;&gt;&gt; parser = parse('import os')
&gt;&gt;&gt; module = parser.get_root_node()
&gt;&gt;&gt; module
&lt;Module: @1-1&gt;

Any subclasses of :class:`Scope`, including :class:`Module` has an attribute
:attr:`iter_imports &lt;Scope.iter_imports&gt;`:

&gt;&gt;&gt; list(module.iter_imports())
[&lt;ImportName: import os@1,0&gt;]

Changes to the Python Grammar
-----------------------------

A few things have changed when looking at Python grammar files:

- :class:`Param` does not exist in Python grammar files. It is essentially a
  part of a ``parameters`` node.  |parso| splits it up to make it easier to
  analyse parameters. However this just makes it easier to deal with the syntax
  tree, it doesn't actually change the valid syntax.
- A few nodes like `lambdef` and `lambdef_nocond` have been merged in the
  syntax tree to make it easier to do deal with them.

Parser Tree Classes
-------------------
"""

import re

from parso._compatibility import utf8_repr, unicode
from parso.tree import Node, BaseNode, Leaf, ErrorNode, ErrorLeaf, \
    search_ancestor
from parso.python.prefix import split_prefix

_FLOW_CONTAINERS = set(['if_stmt', 'while_stmt', 'for_stmt', 'try_stmt',
                        'with_stmt', 'async_stmt', 'suite'])
_RETURN_STMT_CONTAINERS = set(['suite', 'simple_stmt']) | _FLOW_CONTAINERS
_FUNC_CONTAINERS = set(['suite', 'simple_stmt', 'decorated']) | _FLOW_CONTAINERS
_GET_DEFINITION_TYPES = set([
    'expr_stmt', 'comp_for', 'with_stmt', 'for_stmt', 'import_name',
    'import_from', 'param'
])
_IMPORTS = set(['import_name', 'import_from'])



</t>
<t tx="ekr.20180519070854.281">class DocstringMixin(object):
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.282">def get_doc_node(self):
    """
    Returns the string leaf of a docstring. e.g. ``r'''foo'''``.
    """
    if self.type == 'file_input':
        node = self.children[0]
    elif self.type in ('funcdef', 'classdef'):
        node = self.children[self.children.index(':') + 1]
        if node.type == 'suite':  # Normally a suite
            node = node.children[1]  # -&gt; NEWLINE stmt
    else:  # ExprStmt
        simple_stmt = self.parent
        c = simple_stmt.parent.children
        index = c.index(simple_stmt)
        if not index:
            return None
        node = c[index - 1]

    if node.type == 'simple_stmt':
        node = node.children[0]
    if node.type == 'string':
        return node
    return None


</t>
<t tx="ekr.20180519070854.283">class PythonMixin(object):
    """
    Some Python specific utitilies.
    """
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.284">def get_name_of_position(self, position):
    """
    Given a (line, column) tuple, returns a :py:class:`Name` or ``None`` if
    there is no name at that position.
    """
    for c in self.children:
        if isinstance(c, Leaf):
            if c.type == 'name' and c.start_pos &lt;= position &lt;= c.end_pos:
                return c
        else:
            result = c.get_name_of_position(position)
            if result is not None:
                return result
    return None


</t>
<t tx="ekr.20180519070854.285">class PythonLeaf(PythonMixin, Leaf):
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.286">def _split_prefix(self):
    return split_prefix(self, self.get_start_pos_of_prefix())

</t>
<t tx="ekr.20180519070854.287">def get_start_pos_of_prefix(self):
    """
    Basically calls :py:meth:`parso.tree.NodeOrLeaf.get_start_pos_of_prefix`.
    """
    # TODO it is really ugly that we have to override it. Maybe change
    #   indent error leafs somehow? No idea how, though.
    previous_leaf = self.get_previous_leaf()
    if previous_leaf is not None and previous_leaf.type == 'error_leaf' \
            and previous_leaf.original_type in ('indent', 'error_dedent'):
        previous_leaf = previous_leaf.get_previous_leaf()

    if previous_leaf is None:
        return self.line - self.prefix.count('\n'), 0  # It's the first leaf.
    return previous_leaf.end_pos



</t>
<t tx="ekr.20180519070854.288">class _LeafWithoutNewlines(PythonLeaf):
    """
    Simply here to optimize performance.
    """
    __slots__ = ()

    @others
# Python base classes
</t>
<t tx="ekr.20180519070854.289">@property
def end_pos(self):
    return self.line, self.column + len(self.value)


</t>
<t tx="ekr.20180519070854.29">def _make_first(self, c, name):
    rawfirst = self.first[name]
    first = {}
    for label in rawfirst:
        ilabel = self._make_label(c, label)
        ##assert ilabel not in first # XXX failed on &lt;&gt; ... !=
        first[ilabel] = 1
    return first

</t>
<t tx="ekr.20180519070854.290">class PythonBaseNode(PythonMixin, BaseNode):
    __slots__ = ()


</t>
<t tx="ekr.20180519070854.291">class PythonNode(PythonMixin, Node):
    __slots__ = ()


</t>
<t tx="ekr.20180519070854.292">class PythonErrorNode(PythonMixin, ErrorNode):
    __slots__ = ()


</t>
<t tx="ekr.20180519070854.293">class PythonErrorLeaf(ErrorLeaf, PythonLeaf):
    __slots__ = ()


</t>
<t tx="ekr.20180519070854.294">class EndMarker(_LeafWithoutNewlines):
    __slots__ = ()
    type = 'endmarker'


</t>
<t tx="ekr.20180519070854.295">class Newline(PythonLeaf):
    """Contains NEWLINE and ENDMARKER tokens."""
    __slots__ = ()
    type = 'newline'

    @others
</t>
<t tx="ekr.20180519070854.296">@utf8_repr
def __repr__(self):
    return "&lt;%s: %s&gt;" % (type(self).__name__, repr(self.value))


</t>
<t tx="ekr.20180519070854.297">class Name(_LeafWithoutNewlines):
    """
    A string. Sometimes it is important to know if the string belongs to a name
    or not.
    """
    type = 'name'
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.298">def __repr__(self):
    return "&lt;%s: %s@%s,%s&gt;" % (type(self).__name__, self.value,
                               self.line, self.column)

</t>
<t tx="ekr.20180519070854.299">def is_definition(self):
    """
    Returns True if the name is being defined.
    """
    return self.get_definition() is not None

</t>
<t tx="ekr.20180519070854.3">"""This module defines the data structures used to represent a grammar.

These are a bit arcane because they are derived from the data
structures used by Python's 'pgen' parser generator.

There's also a table here mapping operators to their names in the
token module; the Python tokenize module reports all operators as the
fallback token code OP, but the parser needs the actual token code.

"""

try:
    import cPickle as pickle
except:
    import pickle


</t>
<t tx="ekr.20180519070854.30">def _make_label(self, c, label):
    # XXX Maybe this should be a method on a subclass of converter?
    ilabel = len(c.labels)
    if label[0].isalpha():
        # Either a symbol name or a named token
        if label in c.symbol2number:
            # A symbol name (a non-terminal)
            if label in c.symbol2label:
                return c.symbol2label[label]
            else:
                c.labels.append((c.symbol2number[label], None))
                c.symbol2label[label] = ilabel
                c.label2symbol[ilabel] = label
                return ilabel
        else:
            # A named token (NAME, NUMBER, STRING)
            itoken = getattr(self._token_namespace, label, None)
            assert isinstance(itoken, int), label
            if itoken in c.tokens:
                return c.tokens[itoken]
            else:
                c.labels.append((itoken, None))
                c.tokens[itoken] = ilabel
                return ilabel
    else:
        # Either a keyword or an operator
        assert label[0] in ('"', "'"), label
        value = eval(label)
        if value[0].isalpha():
            # A keyword
            if value in c.keywords:
                return c.keywords[value]
            else:
                # TODO this might be an issue?! Using token.NAME here?
                c.labels.append((token.NAME, value))
                c.keywords[value] = ilabel
                return ilabel
        else:
            # An operator (any non-numeric token)
            itoken = self._token_namespace.generate_token_id(value)
            if itoken in c.tokens:
                return c.tokens[itoken]
            else:
                c.labels.append((itoken, None))
                c.tokens[itoken] = ilabel
                return ilabel

</t>
<t tx="ekr.20180519070854.300">def get_definition(self, import_name_always=False):
    """
    Returns None if there's on definition for a name.

    :param import_name_alway: Specifies if an import name is always a
        definition. Normally foo in `from foo import bar` is not a
        definition.
    """
    node = self.parent
    type_ = node.type
    if type_ in ('power', 'atom_expr'):
        # In `self.x = 3` self is not a definition, but x is.
        return None

    if type_ in ('funcdef', 'classdef'):
        if self == node.name:
            return node
        return None

    if type_ == 'except_clause':
        # TODO in Python 2 this doesn't work correctly. See grammar file.
        #      I think we'll just let it be. Python 2 will be gone in a few
        #      years.
        if self.get_previous_sibling() == 'as':
            return node.parent  # The try_stmt.
        return None

    while node is not None:
        if node.type == 'suite':
            return None
        if node.type in _GET_DEFINITION_TYPES:
            if self in node.get_defined_names():
                return node
            if import_name_always and node.type in _IMPORTS:
                return node
            return None
        node = node.parent
    return None



</t>
<t tx="ekr.20180519070854.301">class Literal(PythonLeaf):
    __slots__ = ()


</t>
<t tx="ekr.20180519070854.302">class Number(Literal):
    type = 'number'
    __slots__ = ()


</t>
<t tx="ekr.20180519070854.303">class String(Literal):
    type = 'string'
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.304">@property
def string_prefix(self):
    return re.match('\w*(?=[\'"])', self.value).group(0)

</t>
<t tx="ekr.20180519070854.305">def _get_payload(self):
    match = re.search(
        r'''('{3}|"{3}|'|")(.*)$''',
        self.value,
        flags=re.DOTALL
    )
    return match.group(2)[:-len(match.group(1))]


</t>
<t tx="ekr.20180519070854.306">class FStringString(Leaf):
    """
    f-strings contain f-string expressions and normal python strings. These are
    the string parts of f-strings.
    """
    type = 'fstring_string'
    __slots__ = ()


</t>
<t tx="ekr.20180519070854.307">class FStringStart(Leaf):
    """
    f-strings contain f-string expressions and normal python strings. These are
    the string parts of f-strings.
    """
    type = 'fstring_start'
    __slots__ = ()


</t>
<t tx="ekr.20180519070854.308">class FStringEnd(Leaf):
    """
    f-strings contain f-string expressions and normal python strings. These are
    the string parts of f-strings.
    """
    type = 'fstring_end'
    __slots__ = ()


</t>
<t tx="ekr.20180519070854.309">class _StringComparisonMixin(object):
    @others
</t>
<t tx="ekr.20180519070854.31">def _addfirstsets(self):
    names = list(self.dfas.keys())
    names.sort()
    for name in names:
        if name not in self.first:
            self._calcfirst(name)
        #print name, self.first[name].keys()

</t>
<t tx="ekr.20180519070854.310">def __eq__(self, other):
    """
    Make comparisons with strings easy.
    Improves the readability of the parser.
    """
    if isinstance(other, (str, unicode)):
        return self.value == other

    return self is other

</t>
<t tx="ekr.20180519070854.311">def __ne__(self, other):
    """Python 2 compatibility."""
    return not self.__eq__(other)

</t>
<t tx="ekr.20180519070854.312">def __hash__(self):
    return hash(self.value)


</t>
<t tx="ekr.20180519070854.313">class Operator(_LeafWithoutNewlines, _StringComparisonMixin):
    type = 'operator'
    __slots__ = ()


</t>
<t tx="ekr.20180519070854.314">class Keyword(_LeafWithoutNewlines, _StringComparisonMixin):
    type = 'keyword'
    __slots__ = ()


</t>
<t tx="ekr.20180519070854.315">class Scope(PythonBaseNode, DocstringMixin):
    """
    Super class for the parser tree, which represents the state of a python
    text file.
    A Scope is either a function, class or lambda.
    """
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.316">def __init__(self, children):
    super(Scope, self).__init__(children)

</t>
<t tx="ekr.20180519070854.317">def iter_funcdefs(self):
    """
    Returns a generator of `funcdef` nodes.
    """
    return self._search_in_scope('funcdef')

</t>
<t tx="ekr.20180519070854.318">def iter_classdefs(self):
    """
    Returns a generator of `classdef` nodes.
    """
    return self._search_in_scope('classdef')

</t>
<t tx="ekr.20180519070854.319">def iter_imports(self):
    """
    Returns a generator of `import_name` and `import_from` nodes.
    """
    return self._search_in_scope('import_name', 'import_from')

</t>
<t tx="ekr.20180519070854.32">def _calcfirst(self, name):
    dfa = self.dfas[name]
    self.first[name] = None  # dummy to detect left recursion
    state = dfa[0]
    totalset = {}
    overlapcheck = {}
    for label, next in state.arcs.items():
        if label in self.dfas:
            if label in self.first:
                fset = self.first[label]
                if fset is None:
                    raise ValueError("recursion for rule %r" % name)
            else:
                self._calcfirst(label)
                fset = self.first[label]
            totalset.update(fset)
            overlapcheck[label] = fset
        else:
            totalset[label] = 1
            overlapcheck[label] = {label: 1}
    inverse = {}
    for label, itsfirst in overlapcheck.items():
        for symbol in itsfirst:
            if symbol in inverse:
                raise ValueError("rule %s is ambiguous; %s is in the"
                                 " first sets of %s as well as %s" %
                                 (name, symbol, label, inverse[symbol]))
            inverse[symbol] = label
    self.first[name] = totalset

</t>
<t tx="ekr.20180519070854.320">def _search_in_scope(self, *names):
    def scan(children):
        for element in children:
            if element.type in names:
                yield element
            if element.type in _FUNC_CONTAINERS:
                for e in scan(element.children):
                    yield e

    return scan(self.children)

</t>
<t tx="ekr.20180519070854.321">def get_suite(self):
    """
    Returns the part that is executed by the function.
    """
    return self.children[-1]

</t>
<t tx="ekr.20180519070854.322">def __repr__(self):
    try:
        name = self.name.value
    except AttributeError:
        name = ''

    return "&lt;%s: %s@%s-%s&gt;" % (type(self).__name__, name,
                               self.start_pos[0], self.end_pos[0])


</t>
<t tx="ekr.20180519070854.323">class Module(Scope):
    """
    The top scope, which is always a module.
    Depending on the underlying parser this may be a full module or just a part
    of a module.
    """
    __slots__ = ('_used_names',)
    type = 'file_input'

    @others
</t>
<t tx="ekr.20180519070854.324">def __init__(self, children):
    super(Module, self).__init__(children)
    self._used_names = None

</t>
<t tx="ekr.20180519070854.325">def _iter_future_import_names(self):
    """
    :return: A list of future import names.
    :rtype: list of str
    """
    # In Python it's not allowed to use future imports after the first
    # actual (non-future) statement. However this is not a linter here,
    # just return all future imports. If people want to scan for issues
    # they should use the API.
    for imp in self.iter_imports():
        if imp.type == 'import_from' and imp.level == 0:
            for path in imp.get_paths():
                names = [name.value for name in path]
                if len(names) == 2 and names[0] == '__future__':
                    yield names[1]

</t>
<t tx="ekr.20180519070854.326">def _has_explicit_absolute_import(self):
    """
    Checks if imports in this module are explicitly absolute, i.e. there
    is a ``__future__`` import.
    Currently not public, might be in the future.
    :return bool:
    """
    for name in self._iter_future_import_names():
        if name == 'absolute_import':
            return True
    return False

</t>
<t tx="ekr.20180519070854.327">def get_used_names(self):
    """
    Returns all the :class:`Name` leafs that exist in this module. This
    includes both definitions and references of names.
    """
    if self._used_names is None:
        # Don't directly use self._used_names to eliminate a lookup.
        dct = {}

        def recurse(node):
            try:
                children = node.children
            except AttributeError:
                if node.type == 'name':
                    arr = dct.setdefault(node.value, [])
                    arr.append(node)
            else:
                for child in children:
                    recurse(child)

        recurse(self)
        self._used_names = dct
    return self._used_names


</t>
<t tx="ekr.20180519070854.328">class Decorator(PythonBaseNode):
    type = 'decorator'
    __slots__ = ()


</t>
<t tx="ekr.20180519070854.329">class ClassOrFunc(Scope):
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.33">def _parse(self):
    dfas = {}
    startsymbol = None
    # MSTART: (NEWLINE | RULE)* ENDMARKER
    while self.type != token.ENDMARKER:
        while self.type == token.NEWLINE:
            self._gettoken()
        # RULE: NAME ':' RHS NEWLINE
        name = self._expect(token.NAME)
        self._expect(token.COLON)
        a, z = self._parse_rhs()
        self._expect(token.NEWLINE)
        #self._dump_nfa(name, a, z)
        dfa = self._make_dfa(a, z)
        #self._dump_dfa(name, dfa)
        # oldlen = len(dfa)
        self._simplify_dfa(dfa)
        # newlen = len(dfa)
        dfas[name] = dfa
        #print name, oldlen, newlen
        if startsymbol is None:
            startsymbol = name
    return dfas, startsymbol

</t>
<t tx="ekr.20180519070854.330">@property
def name(self):
    """
    Returns the `Name` leaf that defines the function or class name.
    """
    return self.children[1]

</t>
<t tx="ekr.20180519070854.331">def get_decorators(self):
    """
    :rtype: list of :class:`Decorator`
    """
    decorated = self.parent
    if decorated.type == 'decorated':
        if decorated.children[0].type == 'decorators':
            return decorated.children[0].children
        else:
            return decorated.children[:1]
    else:
        return []


</t>
<t tx="ekr.20180519070854.332">class Class(ClassOrFunc):
    """
    Used to store the parsed contents of a python class.
    """
    type = 'classdef'
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.333">def __init__(self, children):
    super(Class, self).__init__(children)

</t>
<t tx="ekr.20180519070854.334">def get_super_arglist(self):
    """
    Returns the `arglist` node that defines the super classes. It returns
    None if there are no arguments.
    """
    if self.children[2] != '(':  # Has no parentheses
        return None
    else:
        if self.children[3] == ')':  # Empty parentheses
            return None
        else:
            return self.children[3]


</t>
<t tx="ekr.20180519070854.335">def _create_params(parent, argslist_list):
    """
    `argslist_list` is a list that can contain an argslist as a first item, but
    most not. It's basically the items between the parameter brackets (which is
    at most one item).
    This function modifies the parser structure. It generates `Param` objects
    from the normal ast. Those param objects do not exist in a normal ast, but
    make the evaluation of the ast tree so much easier.
    You could also say that this function replaces the argslist node with a
    list of Param objects.
    """
    def check_python2_nested_param(node):
        """
        Python 2 allows params to look like ``def x(a, (b, c))``, which is
        basically a way of unpacking tuples in params. Python 3 has ditched
        this behavior. Jedi currently just ignores those constructs.
        """
        return node.type == 'fpdef' and node.children[0] == '('

    try:
        first = argslist_list[0]
    except IndexError:
        return []

    if first.type in ('name', 'fpdef'):
        if check_python2_nested_param(first):
            return [first]
        else:
            return [Param([first], parent)]
    elif first == '*':
        return [first]
    else:  # argslist is a `typedargslist` or a `varargslist`.
        if first.type == 'tfpdef':
            children = [first]
        else:
            children = first.children
        new_children = []
        start = 0
        # Start with offset 1, because the end is higher.
        for end, child in enumerate(children + [None], 1):
            if child is None or child == ',':
                param_children = children[start:end]
                if param_children:  # Could as well be comma and then end.
                    if param_children[0] == '*' and param_children[1] == ',' \
                            or check_python2_nested_param(param_children[0]):
                        for p in param_children:
                            p.parent = parent
                        new_children += param_children
                    else:
                        new_children.append(Param(param_children, parent))
                    start = end
        return new_children


</t>
<t tx="ekr.20180519070854.336">class Function(ClassOrFunc):
    """
    Used to store the parsed contents of a python function.

    Children::

        0. &lt;Keyword: def&gt;
        1. &lt;Name&gt;
        2. parameter list (including open-paren and close-paren &lt;Operator&gt;s)
        3. or 5. &lt;Operator: :&gt;
        4. or 6. Node() representing function body
        3. -&gt; (if annotation is also present)
        4. annotation (if present)
    """
    type = 'funcdef'

    @others
</t>
<t tx="ekr.20180519070854.337">def __init__(self, children):
    super(Function, self).__init__(children)
    parameters = self.children[2]  # After `def foo`
    parameters.children[1:-1] = _create_params(parameters, parameters.children[1:-1])

</t>
<t tx="ekr.20180519070854.338">def _get_param_nodes(self):
    return self.children[2].children

</t>
<t tx="ekr.20180519070854.339">def get_params(self):
    """
    Returns a list of `Param()`.
    """
    return [p for p in self._get_param_nodes() if p.type == 'param']

</t>
<t tx="ekr.20180519070854.34">def _make_dfa(self, start, finish):
    # To turn an NFA into a DFA, we define the states of the DFA
    # to correspond to *sets* of states of the NFA.  Then do some
    # state reduction.  Let's represent sets as dicts with 1 for
    # values.
    assert isinstance(start, NFAState)
    assert isinstance(finish, NFAState)

    def closure(state):
        base = {}
        addclosure(state, base)
        return base

    def addclosure(state, base):
        assert isinstance(state, NFAState)
        if state in base:
            return
        base[state] = 1
        for label, next in state.arcs:
            if label is None:
                addclosure(next, base)

    states = [DFAState(closure(start), finish)]
    for state in states:  # NB states grows while we're iterating
        arcs = {}
        for nfastate in state.nfaset:
            for label, next in nfastate.arcs:
                if label is not None:
                    addclosure(next, arcs.setdefault(label, {}))
        for label, nfaset in arcs.items():
            for st in states:
                if st.nfaset == nfaset:
                    break
            else:
                st = DFAState(nfaset, finish)
                states.append(st)
            state.addarc(st, label)
    return states  # List of DFAState instances; first one is start

</t>
<t tx="ekr.20180519070854.340">@property
def name(self):
    return self.children[1]  # First token after `def`

</t>
<t tx="ekr.20180519070854.341">def iter_yield_exprs(self):
    """
    Returns a generator of `yield_expr`.
    """
    def scan(children):
        for element in children:
            if element.type in ('classdef', 'funcdef', 'lambdef'):
                continue

            try:
                nested_children = element.children
            except AttributeError:
                if element.value == 'yield':
                    if element.parent.type == 'yield_expr':
                        yield element.parent
                    else:
                        yield element
            else:
                for result in scan(nested_children):
                    yield result

    return scan(self.children)

</t>
<t tx="ekr.20180519070854.342">def iter_return_stmts(self):
    """
    Returns a generator of `return_stmt`.
    """
    def scan(children):
        for element in children:
            if element.type == 'return_stmt' \
                    or element.type == 'keyword' and element.value == 'return':
                yield element
            if element.type in _RETURN_STMT_CONTAINERS:
                for e in scan(element.children):
                    yield e

    return scan(self.children)

</t>
<t tx="ekr.20180519070854.343">def iter_raise_stmts(self):
    """
    Returns a generator of `raise_stmt`. Includes raise statements inside try-except blocks
    """
    def scan(children):
        for element in children:
            if element.type == 'raise_stmt' \
                    or element.type == 'keyword' and element.value == 'raise':
                yield element
            if element.type in _RETURN_STMT_CONTAINERS:
                for e in scan(element.children):
                    yield e

    return scan(self.children)

</t>
<t tx="ekr.20180519070854.344">def is_generator(self):
    """
    :return bool: Checks if a function is a generator or not.
    """
    return next(self.iter_yield_exprs(), None) is not None

</t>
<t tx="ekr.20180519070854.345">@property
def annotation(self):
    """
    Returns the test node after `-&gt;` or `None` if there is no annotation.
    """
    try:
        if self.children[3] == "-&gt;":
            return self.children[4]
        assert self.children[3] == ":"
        return None
    except IndexError:
        return None

</t>
<t tx="ekr.20180519070854.346">class Lambda(Function):
    """
    Lambdas are basically trimmed functions, so give it the same interface.

    Children::

         0. &lt;Keyword: lambda&gt;
         *. &lt;Param x&gt; for each argument x
        -2. &lt;Operator: :&gt;
        -1. Node() representing body
    """
    type = 'lambdef'
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.347">def __init__(self, children):
    # We don't want to call the Function constructor, call its parent.
    super(Function, self).__init__(children)
    # Everything between `lambda` and the `:` operator is a parameter.
    self.children[1:-2] = _create_params(self, self.children[1:-2])

</t>
<t tx="ekr.20180519070854.348">@property
def name(self):
    """
    Raises an AttributeError. Lambdas don't have a defined name.
    """
    raise AttributeError("lambda is not named.")

</t>
<t tx="ekr.20180519070854.349">def _get_param_nodes(self):
    return self.children[1:-2]

</t>
<t tx="ekr.20180519070854.35">def _dump_nfa(self, name, start, finish):
    print("Dump of NFA for", name)
    todo = [start]
    for i, state in enumerate(todo):
        print("  State", i, state is finish and "(final)" or "")
        for label, next in state.arcs:
            if next in todo:
                j = todo.index(next)
            else:
                j = len(todo)
                todo.append(next)
            if label is None:
                print("    -&gt; %d" % j)
            else:
                print("    %s -&gt; %d" % (label, j))

</t>
<t tx="ekr.20180519070854.350">@property
def annotation(self):
    """
    Returns `None`, lambdas don't have annotations.
    """
    return None

</t>
<t tx="ekr.20180519070854.351">def __repr__(self):
    return "&lt;%s@%s&gt;" % (self.__class__.__name__, self.start_pos)


</t>
<t tx="ekr.20180519070854.352">class Flow(PythonBaseNode):
    __slots__ = ()


</t>
<t tx="ekr.20180519070854.353">class IfStmt(Flow):
    type = 'if_stmt'
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.354">def get_test_nodes(self):
    """
    E.g. returns all the `test` nodes that are named as x, below:

        if x:
            pass
        elif x:
            pass
    """
    for i, c in enumerate(self.children):
        if c in ('elif', 'if'):
            yield self.children[i + 1]

</t>
<t tx="ekr.20180519070854.355">def get_corresponding_test_node(self, node):
    """
    Searches for the branch in which the node is and returns the
    corresponding test node (see function above). However if the node is in
    the test node itself and not in the suite return None.
    """
    start_pos = node.start_pos
    for check_node in reversed(list(self.get_test_nodes())):
        if check_node.start_pos &lt; start_pos:
            if start_pos &lt; check_node.end_pos:
                return None
                # In this case the node is within the check_node itself,
                # not in the suite
            else:
                return check_node

</t>
<t tx="ekr.20180519070854.356">def is_node_after_else(self, node):
    """
    Checks if a node is defined after `else`.
    """
    for c in self.children:
        if c == 'else':
            if node.start_pos &gt; c.start_pos:
                return True
    else:
        return False


</t>
<t tx="ekr.20180519070854.357">class WhileStmt(Flow):
    type = 'while_stmt'
    __slots__ = ()


</t>
<t tx="ekr.20180519070854.358">class ForStmt(Flow):
    type = 'for_stmt'
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.359">def get_testlist(self):
    """
    Returns the input node ``y`` from: ``for x in y:``.
    """
    return self.children[3]

</t>
<t tx="ekr.20180519070854.36">def _dump_dfa(self, name, dfa):
    print("Dump of DFA for", name)
    for i, state in enumerate(dfa):
        print("  State", i, state.isfinal and "(final)" or "")
        for label, next in state.arcs.items():
            print("    %s -&gt; %d" % (label, dfa.index(next)))

</t>
<t tx="ekr.20180519070854.360">def get_defined_names(self):
    return _defined_names(self.children[1])


</t>
<t tx="ekr.20180519070854.361">class TryStmt(Flow):
    type = 'try_stmt'
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.362">def get_except_clause_tests(self):
    """
    Returns the ``test`` nodes found in ``except_clause`` nodes.
    Returns ``[None]`` for except clauses without an exception given.
    """
    for node in self.children:
        if node.type == 'except_clause':
            yield node.children[1]
        elif node == 'except':
            yield None


</t>
<t tx="ekr.20180519070854.363">class WithStmt(Flow):
    type = 'with_stmt'
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.364">def get_defined_names(self):
    """
    Returns the a list of `Name` that the with statement defines. The
    defined names are set after `as`.
    """
    names = []
    for with_item in self.children[1:-2:2]:
        # Check with items for 'as' names.
        if with_item.type == 'with_item':
            names += _defined_names(with_item.children[2])
    return names

</t>
<t tx="ekr.20180519070854.365">def get_test_node_from_name(self, name):
    node = name.parent
    if node.type != 'with_item':
        raise ValueError('The name is not actually part of a with statement.')
    return node.children[0]


</t>
<t tx="ekr.20180519070854.366">class Import(PythonBaseNode):
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.367">def get_path_for_name(self, name):
    """
    The path is the list of names that leads to the searched name.

    :return list of Name:
    """
    try:
        # The name may be an alias. If it is, just map it back to the name.
        name = self._aliases()[name]
    except KeyError:
        pass

    for path in self.get_paths():
        if name in path:
            return path[:path.index(name) + 1]
    raise ValueError('Name should be defined in the import itself')

</t>
<t tx="ekr.20180519070854.368">def is_nested(self):
    return False  # By default, sub classes may overwrite this behavior

</t>
<t tx="ekr.20180519070854.369">def is_star_import(self):
    return self.children[-1] == '*'


</t>
<t tx="ekr.20180519070854.37">def _simplify_dfa(self, dfa):
    # This is not theoretically optimal, but works well enough.
    # Algorithm: repeatedly look for two states that have the same
    # set of arcs (same labels pointing to the same nodes) and
    # unify them, until things stop changing.

    # dfa is a list of DFAState instances
    changes = True
    while changes:
        changes = False
        for i, state_i in enumerate(dfa):
            for j in range(i + 1, len(dfa)):
                state_j = dfa[j]
                if state_i == state_j:
                    #print "  unify", i, j
                    del dfa[j]
                    for state in dfa:
                        state.unifystate(state_j, state_i)
                    changes = True
                    break

</t>
<t tx="ekr.20180519070854.370">class ImportFrom(Import):
    type = 'import_from'
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.371">def get_defined_names(self):
    """
    Returns the a list of `Name` that the import defines. The
    defined names are set after `import` or in case an alias - `as` - is
    present that name is returned.
    """
    return [alias or name for name, alias in self._as_name_tuples()]

</t>
<t tx="ekr.20180519070854.372">def _aliases(self):
    """Mapping from alias to its corresponding name."""
    return dict((alias, name) for name, alias in self._as_name_tuples()
                if alias is not None)

</t>
<t tx="ekr.20180519070854.373">def get_from_names(self):
    for n in self.children[1:]:
        if n not in ('.', '...'):
            break
    if n.type == 'dotted_name':  # from x.y import
        return n.children[::2]
    elif n == 'import':  # from . import
        return []
    else:  # from x import
        return [n]

</t>
<t tx="ekr.20180519070854.374">@property
def level(self):
    """The level parameter of ``__import__``."""
    level = 0
    for n in self.children[1:]:
        if n in ('.', '...'):
            level += len(n.value)
        else:
            break
    return level

</t>
<t tx="ekr.20180519070854.375">def _as_name_tuples(self):
    last = self.children[-1]
    if last == ')':
        last = self.children[-2]
    elif last == '*':
        return  # No names defined directly.

    if last.type == 'import_as_names':
        as_names = last.children[::2]
    else:
        as_names = [last]
    for as_name in as_names:
        if as_name.type == 'name':
            yield as_name, None
        else:
            yield as_name.children[::2]  # yields x, y -&gt; ``x as y``

</t>
<t tx="ekr.20180519070854.376">def get_paths(self):
    """
    The import paths defined in an import statement. Typically an array
    like this: ``[&lt;Name: datetime&gt;, &lt;Name: date&gt;]``.

    :return list of list of Name:
    """
    dotted = self.get_from_names()

    if self.children[-1] == '*':
        return [dotted]
    return [dotted + [name] for name, alias in self._as_name_tuples()]


</t>
<t tx="ekr.20180519070854.377">class ImportName(Import):
    """For ``import_name`` nodes. Covers normal imports without ``from``."""
    type = 'import_name'
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.378">def get_defined_names(self):
    """
    Returns the a list of `Name` that the import defines. The defined names
    is always the first name after `import` or in case an alias - `as` - is
    present that name is returned.
    """
    return [alias or path[0] for path, alias in self._dotted_as_names()]

</t>
<t tx="ekr.20180519070854.379">@property
def level(self):
    """The level parameter of ``__import__``."""
    return 0  # Obviously 0 for imports without from.

</t>
<t tx="ekr.20180519070854.38">def _parse_rhs(self):
    # RHS: ALT ('|' ALT)*
    a, z = self._parse_alt()
    if self.value != "|":
        return a, z
    else:
        aa = NFAState()
        zz = NFAState()
        aa.addarc(a)
        z.addarc(zz)
        while self.value == "|":
            self._gettoken()
            a, z = self._parse_alt()
            aa.addarc(a)
            z.addarc(zz)
        return aa, zz

</t>
<t tx="ekr.20180519070854.380">def get_paths(self):
    return [path for path, alias in self._dotted_as_names()]

</t>
<t tx="ekr.20180519070854.381">def _dotted_as_names(self):
    """Generator of (list(path), alias) where alias may be None."""
    dotted_as_names = self.children[1]
    if dotted_as_names.type == 'dotted_as_names':
        as_names = dotted_as_names.children[::2]
    else:
        as_names = [dotted_as_names]

    for as_name in as_names:
        if as_name.type == 'dotted_as_name':
            alias = as_name.children[2]
            as_name = as_name.children[0]
        else:
            alias = None
        if as_name.type == 'name':
            yield [as_name], alias
        else:
            # dotted_names
            yield as_name.children[::2], alias

</t>
<t tx="ekr.20180519070854.382">def is_nested(self):
    """
    This checks for the special case of nested imports, without aliases and
    from statement::

        import foo.bar
    """
    return bool([1 for path, alias in self._dotted_as_names()
                if alias is None and len(path) &gt; 1])

</t>
<t tx="ekr.20180519070854.383">def _aliases(self):
    """
    :return list of Name: Returns all the alias
    """
    return dict((alias, path[-1]) for path, alias in self._dotted_as_names()
                if alias is not None)


</t>
<t tx="ekr.20180519070854.384">class KeywordStatement(PythonBaseNode):
    """
    For the following statements: `assert`, `del`, `global`, `nonlocal`,
    `raise`, `return`, `yield`, `return`, `yield`.

    `pass`, `continue` and `break` are not in there, because they are just
    simple keywords and the parser reduces it to a keyword.
    """
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.385">@property
def type(self):
    """
    Keyword statements start with the keyword and end with `_stmt`. You can
    crosscheck this with the Python grammar.
    """
    return '%s_stmt' % self.keyword

</t>
<t tx="ekr.20180519070854.386">@property
def keyword(self):
    return self.children[0].value


</t>
<t tx="ekr.20180519070854.387">class AssertStmt(KeywordStatement):
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.388">@property
def assertion(self):
    return self.children[1]


</t>
<t tx="ekr.20180519070854.389">class GlobalStmt(KeywordStatement):
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.39">def _parse_alt(self):
    # ALT: ITEM+
    a, b = self._parse_item()
    while (self.value in ("(", "[") or
           self.type in (token.NAME, token.STRING)):
        c, d = self._parse_item()
        b.addarc(c)
        b = d
    return a, b

</t>
<t tx="ekr.20180519070854.390">def get_global_names(self):
    return self.children[1::2]


</t>
<t tx="ekr.20180519070854.391">class ReturnStmt(KeywordStatement):
    __slots__ = ()


</t>
<t tx="ekr.20180519070854.392">class YieldExpr(PythonBaseNode):
    type = 'yield_expr'
    __slots__ = ()


</t>
<t tx="ekr.20180519070854.393">def _defined_names(current):
    """
    A helper function to find the defined names in statements, for loops and
    list comprehensions.
    """
    names = []
    if current.type in ('testlist_star_expr', 'testlist_comp', 'exprlist', 'testlist'):
        for child in current.children[::2]:
            names += _defined_names(child)
    elif current.type in ('atom', 'star_expr'):
        names += _defined_names(current.children[1])
    elif current.type in ('power', 'atom_expr'):
        if current.children[-2] != '**':  # Just if there's no operation
            trailer = current.children[-1]
            if trailer.children[0] == '.':
                names.append(trailer.children[1])
    else:
        names.append(current)
    return names


</t>
<t tx="ekr.20180519070854.394">class ExprStmt(PythonBaseNode, DocstringMixin):
    type = 'expr_stmt'
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.395">def get_defined_names(self):
    """
    Returns a list of `Name` defined before the `=` sign.
    """
    names = []
    if self.children[1].type == 'annassign':
        names = _defined_names(self.children[0])
    return [
        name
        for i in range(0, len(self.children) - 2, 2)
        if '=' in self.children[i + 1].value
        for name in _defined_names(self.children[i])
    ] + names

</t>
<t tx="ekr.20180519070854.396">def get_rhs(self):
    """Returns the right-hand-side of the equals."""
    return self.children[-1]

</t>
<t tx="ekr.20180519070854.397">def yield_operators(self):
    """
    Returns a generator of `+=`, `=`, etc. or None if there is no operation.
    """
    first = self.children[1]
    if first.type == 'annassign':
        if len(first.children) &lt;= 2:
            return  # No operator is available, it's just PEP 484.

        first = first.children[2]
    yield first

    for operator in self.children[3::2]:
        yield operator


</t>
<t tx="ekr.20180519070854.398">class Param(PythonBaseNode):
    """
    It's a helper class that makes business logic with params much easier. The
    Python grammar defines no ``param`` node. It defines it in a different way
    that is not really suited to working with parameters.
    """
    type = 'param'

    @others
</t>
<t tx="ekr.20180519070854.399">def __init__(self, children, parent):
    super(Param, self).__init__(children)
    self.parent = parent
    for child in children:
        child.parent = self

</t>
<t tx="ekr.20180519070854.4">class Grammar(object):
    """Pgen parsing tables conversion class.

    Once initialized, this class supplies the grammar tables for the
    parsing engine implemented by parse.py.  The parsing engine
    accesses the instance variables directly.  The class here does not
    provide initialization of the tables; several subclasses exist to
    do this (see the conv and pgen modules).

    The load() method reads the tables from a pickle file, which is
    much faster than the other ways offered by subclasses.  The pickle
    file is written by calling dump() (after loading the grammar
    tables using a subclass).  The report() method prints a readable
    representation of the tables to stdout, for debugging.

    The instance variables are as follows:

    symbol2number -- a dict mapping symbol names to numbers.  Symbol
                     numbers are always 256 or higher, to distinguish
                     them from token numbers, which are between 0 and
                     255 (inclusive).

    number2symbol -- a dict mapping numbers to symbol names;
                     these two are each other's inverse.

    states        -- a list of DFAs, where each DFA is a list of
                     states, each state is a list of arcs, and each
                     arc is a (i, j) pair where i is a label and j is
                     a state number.  The DFA number is the index into
                     this list.  (This name is slightly confusing.)
                     Final states are represented by a special arc of
                     the form (0, j) where j is its own state number.

    dfas          -- a dict mapping symbol numbers to (DFA, first)
                     pairs, where DFA is an item from the states list
                     above, and first is a set of tokens that can
                     begin this grammar rule (represented by a dict
                     whose values are always 1).

    labels        -- a list of (x, y) pairs where x is either a token
                     number or a symbol number, and y is either None
                     or a string; the strings are keywords.  The label
                     number is the index in this list; label numbers
                     are used to mark state transitions (arcs) in the
                     DFAs.

    start         -- the number of the grammar's start symbol.

    keywords      -- a dict mapping keyword strings to arc labels.

    tokens        -- a dict mapping token numbers to arc labels.

    """

    @others
</t>
<t tx="ekr.20180519070854.40">def _parse_item(self):
    # ITEM: '[' RHS ']' | ATOM ['+' | '*']
    if self.value == "[":
        self._gettoken()
        a, z = self._parse_rhs()
        self._expect(token.RSQB)
        a.addarc(z)
        return a, z
    else:
        a, z = self._parse_atom()
        value = self.value
        if value not in ("+", "*"):
            return a, z
        self._gettoken()
        z.addarc(a)
        if value == "+":
            return a, z
        else:
            return a, a

</t>
<t tx="ekr.20180519070854.400">@property
def star_count(self):
    """
    Is `0` in case of `foo`, `1` in case of `*foo` or `2` in case of
    `**foo`.
    """
    first = self.children[0]
    if first in ('*', '**'):
        return len(first.value)
    return 0

</t>
<t tx="ekr.20180519070854.401">@property
def default(self):
    """
    The default is the test node that appears after the `=`. Is `None` in
    case no default is present.
    """
    has_comma = self.children[-1] == ','
    try:
        if self.children[-2 - int(has_comma)] == '=':
            return self.children[-1 - int(has_comma)]
    except IndexError:
        return None

</t>
<t tx="ekr.20180519070854.402">@property
def annotation(self):
    """
    The default is the test node that appears after `:`. Is `None` in case
    no annotation is present.
    """
    tfpdef = self._tfpdef()
    if tfpdef.type == 'tfpdef':
        assert tfpdef.children[1] == ":"
        assert len(tfpdef.children) == 3
        annotation = tfpdef.children[2]
        return annotation
    else:
        return None

</t>
<t tx="ekr.20180519070854.403">def _tfpdef(self):
    """
    tfpdef: see e.g. grammar36.txt.
    """
    offset = int(self.children[0] in ('*', '**'))
    return self.children[offset]

</t>
<t tx="ekr.20180519070854.404">@property
def name(self):
    """
    The `Name` leaf of the param.
    """
    if self._tfpdef().type == 'tfpdef':
        return self._tfpdef().children[0]
    else:
        return self._tfpdef()

</t>
<t tx="ekr.20180519070854.405">def get_defined_names(self):
    return [self.name]

</t>
<t tx="ekr.20180519070854.406">@property
def position_index(self):
    """
    Property for the positional index of a paramter.
    """
    index = self.parent.children.index(self)
    try:
        keyword_only_index = self.parent.children.index('*')
        if index &gt; keyword_only_index:
            # Skip the ` *, `
            index -= 2
    except ValueError:
        pass
    return index - 1

</t>
<t tx="ekr.20180519070854.407">def get_parent_function(self):
    """
    Returns the function/lambda of a parameter.
    """
    return search_ancestor(self, 'funcdef', 'lambdef')

</t>
<t tx="ekr.20180519070854.408">def get_code(self, include_prefix=True, include_comma=True):
    """
    Like all the other get_code functions, but includes the param
    `include_comma`.

    :param include_comma bool: If enabled includes the comma in the string output.
    """
    if include_comma:
        return super(Param, self).get_code(include_prefix)

    children = self.children
    if children[-1] == ',':
        children = children[:-1]
    return self._get_code_for_children(
        children,
        include_prefix=include_prefix
    )

</t>
<t tx="ekr.20180519070854.409">def __repr__(self):
    default = '' if self.default is None else '=%s' % self.default.get_code()
    return '&lt;%s: %s&gt;' % (type(self).__name__, str(self._tfpdef()) + default)


</t>
<t tx="ekr.20180519070854.41">def _parse_atom(self):
    # ATOM: '(' RHS ')' | NAME | STRING
    if self.value == "(":
        self._gettoken()
        a, z = self._parse_rhs()
        self._expect(token.RPAR)
        return a, z
    elif self.type in (token.NAME, token.STRING):
        a = NFAState()
        z = NFAState()
        a.addarc(z, self.value)
        self._gettoken()
        return a, z
    else:
        self._raise_error("expected (...) or NAME or STRING, got %s/%s",
                          self.type, self.value)

</t>
<t tx="ekr.20180519070854.410">class CompFor(PythonBaseNode):
    type = 'comp_for'
    __slots__ = ()

    @others
</t>
<t tx="ekr.20180519070854.411">def get_defined_names(self):
    """
    Returns the a list of `Name` that the comprehension defines.
    """
    # allow async for
    return _defined_names(self.children[self.children.index('for') + 1])
</t>
<t tx="ekr.20180519070854.412">@path C:/Anaconda3/Lib/site-packages/parso/python/
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070854.42">def _expect(self, type):
    if self.type != type:
        self._raise_error("expected %s(%s), got %s(%s)",
                          type, token.tok_name[type], self.type, self.value)
    value = self.value
    self._gettoken()
    return value

</t>
<t tx="ekr.20180519070854.43">def _gettoken(self):
    tup = next(self.generator)
    while tup[0] in (token.COMMENT, token.NL):
        tup = next(self.generator)
    self.type, self.value, self.begin, prefix = tup

</t>
<t tx="ekr.20180519070854.44">def _raise_error(self, msg, *args):
    if args:
        try:
            msg = msg % args
        except:
            msg = " ".join([msg] + list(map(str, args)))
    line = self._bnf_text.splitlines()[self.begin[0] - 1]
    raise SyntaxError(msg, ('&lt;grammar&gt;', self.begin[0],
                            self.begin[1], line))


</t>
<t tx="ekr.20180519070854.45">class NFAState(object):
    @others
</t>
<t tx="ekr.20180519070854.46">def __init__(self):
    self.arcs = []  # list of (label, NFAState) pairs

</t>
<t tx="ekr.20180519070854.47">def addarc(self, next, label=None):
    assert label is None or isinstance(label, str)
    assert isinstance(next, NFAState)
    self.arcs.append((label, next))


</t>
<t tx="ekr.20180519070854.48">class DFAState(object):
    @others
</t>
<t tx="ekr.20180519070854.49">def __init__(self, nfaset, final):
    assert isinstance(nfaset, dict)
    assert isinstance(next(iter(nfaset)), NFAState)
    assert isinstance(final, NFAState)
    self.nfaset = nfaset
    self.isfinal = final in nfaset
    self.arcs = {}  # map from label to DFAState

</t>
<t tx="ekr.20180519070854.5">def __init__(self, bnf_text):
    self.symbol2number = {}
    self.number2symbol = {}
    self.states = []
    self.dfas = {}
    self.labels = [(0, "EMPTY")]
    self.keywords = {}
    self.tokens = {}
    self.symbol2label = {}
    self.label2symbol = {}
    self.start = 256

</t>
<t tx="ekr.20180519070854.50">def addarc(self, next, label):
    assert isinstance(label, str)
    assert label not in self.arcs
    assert isinstance(next, DFAState)
    self.arcs[label] = next

</t>
<t tx="ekr.20180519070854.51">def unifystate(self, old, new):
    for label, next in self.arcs.items():
        if next is old:
            self.arcs[label] = new

</t>
<t tx="ekr.20180519070854.52">def __eq__(self, other):
    # Equality test -- ignore the nfaset instance variable
    assert isinstance(other, DFAState)
    if self.isfinal != other.isfinal:
        return False
    # Can't just return self.arcs == other.arcs, because that
    # would invoke this method recursively, with cycles...
    if len(self.arcs) != len(other.arcs):
        return False
    for label, next in self.arcs.items():
        if next is not other.arcs.get(label):
            return False
    return True

__hash__ = None  # For Py3 compatibility.


</t>
<t tx="ekr.20180519070854.53">def generate_grammar(bnf_text, token_namespace):
    """
    ``bnf_text`` is a grammar in extended BNF (using * for repetition, + for
    at-least-once repetition, [] for optional parts, | for alternatives and ()
    for grouping).

    It's not EBNF according to ISO/IEC 14977. It's a dialect Python uses in its
    own parser.
    """
    p = ParserGenerator(bnf_text, token_namespace)
    return p.make_grammar()
</t>
<t tx="ekr.20180519070854.54">@path C:/Anaconda3/Lib/site-packages/parso/pgen2/
# Copyright 2004-2005 Elemental Security, Inc. All Rights Reserved.
# Licensed to PSF under a Contributor Agreement.

# Modifications:
# Copyright 2006 Google, Inc. All Rights Reserved.
# Licensed to PSF under a Contributor Agreement.
# Copyright 2014 David Halter. Integration into Jedi.
# Modifications are dual-licensed: MIT and PSF.
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070854.56"></t>
<t tx="ekr.20180519070854.57">@path C:/Anaconda3/Lib/site-packages/parso/python/
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070854.58">"""
Basically a contains parser that is faster, because it tries to parse only
parts and if anything changes, it only reparses the changed parts.

It works with a simple diff in the beginning and will try to reuse old parser
fragments.
"""
import re
import difflib
from collections import namedtuple
import logging

from parso.utils import split_lines
from parso.python.parser import Parser
from parso.python.tree import EndMarker
from parso.python.tokenize import (NEWLINE, PythonToken, ERROR_DEDENT,
                                   ENDMARKER, INDENT, DEDENT)

LOG = logging.getLogger(__name__)


</t>
<t tx="ekr.20180519070854.59">def _get_last_line(node_or_leaf):
    last_leaf = node_or_leaf.get_last_leaf()
    if _ends_with_newline(last_leaf):
        return last_leaf.start_pos[0]
    else:
        return last_leaf.end_pos[0]


</t>
<t tx="ekr.20180519070854.6">def dump(self, filename):
    """Dump the grammar tables to a pickle file."""
    with open(filename, "wb") as f:
        pickle.dump(self.__dict__, f, 2)

</t>
<t tx="ekr.20180519070854.60">def _ends_with_newline(leaf, suffix=''):
    if leaf.type == 'error_leaf':
        typ = leaf.original_type
    else:
        typ = leaf.type

    return typ == 'newline' or suffix.endswith('\n')


</t>
<t tx="ekr.20180519070854.61">def _flows_finished(pgen_grammar, stack):
    """
    if, while, for and try might not be finished, because another part might
    still be parsed.
    """
    for dfa, newstate, (symbol_number, nodes) in stack:
        if pgen_grammar.number2symbol[symbol_number] in ('if_stmt', 'while_stmt',
                                                    'for_stmt', 'try_stmt'):
            return False
    return True


</t>
<t tx="ekr.20180519070854.62">def suite_or_file_input_is_valid(pgen_grammar, stack):
    if not _flows_finished(pgen_grammar, stack):
        return False

    for dfa, newstate, (symbol_number, nodes) in reversed(stack):
        if pgen_grammar.number2symbol[symbol_number] == 'suite':
            # If only newline is in the suite, the suite is not valid, yet.
            return len(nodes) &gt; 1
    # Not reaching a suite means that we're dealing with file_input levels
    # where there's no need for a valid statement in it. It can also be empty.
    return True


</t>
<t tx="ekr.20180519070854.63">def _is_flow_node(node):
    try:
        value = node.children[0].value
    except AttributeError:
        return False
    return value in ('if', 'for', 'while', 'try')


</t>
<t tx="ekr.20180519070854.64">class _PositionUpdatingFinished(Exception):
    pass


</t>
<t tx="ekr.20180519070854.65">def _update_positions(nodes, line_offset, last_leaf):
    for node in nodes:
        try:
            children = node.children
        except AttributeError:
            # Is a leaf
            node.line += line_offset
            if node is last_leaf:
                raise _PositionUpdatingFinished
        else:
            _update_positions(children, line_offset, last_leaf)


</t>
<t tx="ekr.20180519070854.66">class DiffParser(object):
    """
    An advanced form of parsing a file faster. Unfortunately comes with huge
    side effects. It changes the given module.
    """
    @others
</t>
<t tx="ekr.20180519070854.67">def __init__(self, pgen_grammar, tokenizer, module):
    self._pgen_grammar = pgen_grammar
    self._tokenizer = tokenizer
    self._module = module

</t>
<t tx="ekr.20180519070854.68">def _reset(self):
    self._copy_count = 0
    self._parser_count = 0

    self._nodes_stack = _NodesStack(self._module)

</t>
<t tx="ekr.20180519070854.69">def update(self, old_lines, new_lines):
    '''
    The algorithm works as follows:

    Equal:
        - Assure that the start is a newline, otherwise parse until we get
          one.
        - Copy from parsed_until_line + 1 to max(i2 + 1)
        - Make sure that the indentation is correct (e.g. add DEDENT)
        - Add old and change positions
    Insert:
        - Parse from parsed_until_line + 1 to min(j2 + 1), hopefully not
          much more.

    Returns the new module node.
    '''
    LOG.debug('diff parser start')
    # Reset the used names cache so they get regenerated.
    self._module._used_names = None

    self._parser_lines_new = new_lines

    self._reset()

    line_length = len(new_lines)
    sm = difflib.SequenceMatcher(None, old_lines, self._parser_lines_new)
    opcodes = sm.get_opcodes()
    LOG.debug('diff parser calculated')
    LOG.debug('diff: line_lengths old: %s, new: %s' % (len(old_lines), line_length))

    for operation, i1, i2, j1, j2 in opcodes:
        LOG.debug('diff code[%s] old[%s:%s] new[%s:%s]',
                  operation, i1 + 1, i2, j1 + 1, j2)

        if j2 == line_length and new_lines[-1] == '':
            # The empty part after the last newline is not relevant.
            j2 -= 1

        if operation == 'equal':
            line_offset = j1 - i1
            self._copy_from_old_parser(line_offset, i2, j2)
        elif operation == 'replace':
            self._parse(until_line=j2)
        elif operation == 'insert':
            self._parse(until_line=j2)
        else:
            assert operation == 'delete'

    # With this action all change will finally be applied and we have a
    # changed module.
    self._nodes_stack.close()

    last_pos = self._module.end_pos[0]
    if last_pos != line_length:
        current_lines = split_lines(self._module.get_code(), keepends=True)
        diff = difflib.unified_diff(current_lines, new_lines)
        raise Exception(
            "There's an issue (%s != %s) with the diff parser. Please report:\n%s"
            % (last_pos, line_length, ''.join(diff))
        )

    LOG.debug('diff parser end')
    return self._module

</t>
<t tx="ekr.20180519070854.7">def load(self, filename):
    """Load the grammar tables from a pickle file."""
    with open(filename, "rb") as f:
        d = pickle.load(f)
    self.__dict__.update(d)

</t>
<t tx="ekr.20180519070854.70">def _enabled_debugging(self, old_lines, lines_new):
    if self._module.get_code() != ''.join(lines_new):
        LOG.warning('parser issue:\n%s\n%s', ''.join(old_lines),
                        ''.join(lines_new))

</t>
<t tx="ekr.20180519070854.71">def _copy_from_old_parser(self, line_offset, until_line_old, until_line_new):
    copied_nodes = [None]

    last_until_line = -1
    while until_line_new &gt; self._nodes_stack.parsed_until_line:
        parsed_until_line_old = self._nodes_stack.parsed_until_line - line_offset
        line_stmt = self._get_old_line_stmt(parsed_until_line_old + 1)
        if line_stmt is None:
            # Parse 1 line at least. We don't need more, because we just
            # want to get into a state where the old parser has statements
            # again that can be copied (e.g. not lines within parentheses).
            self._parse(self._nodes_stack.parsed_until_line + 1)
        elif not copied_nodes:
            # We have copied as much as possible (but definitely not too
            # much). Therefore we just parse the rest.
            # We might not reach the end, because there's a statement
            # that is not finished.
            self._parse(until_line_new)
        else:
            p_children = line_stmt.parent.children
            index = p_children.index(line_stmt)

            copied_nodes = self._nodes_stack.copy_nodes(
                p_children[index:],
                until_line_old,
                line_offset
            )
            # Match all the nodes that are in the wanted range.
            if copied_nodes:
                self._copy_count += 1

                from_ = copied_nodes[0].get_start_pos_of_prefix()[0] + line_offset
                to = self._nodes_stack.parsed_until_line

                LOG.debug('diff actually copy %s to %s', from_, to)
        # Since there are potential bugs that might loop here endlessly, we
        # just stop here.
        assert last_until_line != self._nodes_stack.parsed_until_line \
            or not copied_nodes, last_until_line
        last_until_line = self._nodes_stack.parsed_until_line

</t>
<t tx="ekr.20180519070854.72">def _get_old_line_stmt(self, old_line):
    leaf = self._module.get_leaf_for_position((old_line, 0), include_prefixes=True)

    if _ends_with_newline(leaf):
        leaf = leaf.get_next_leaf()
    if leaf.get_start_pos_of_prefix()[0] == old_line:
        node = leaf
        while node.parent.type not in ('file_input', 'suite'):
            node = node.parent
        return node
    # Must be on the same line. Otherwise we need to parse that bit.
    return None

</t>
<t tx="ekr.20180519070854.73">def _get_before_insertion_node(self):
    if self._nodes_stack.is_empty():
        return None

    line = self._nodes_stack.parsed_until_line + 1
    node = self._new_module.get_last_leaf()
    while True:
        parent = node.parent
        if parent.type in ('suite', 'file_input'):
            assert node.end_pos[0] &lt;= line
            assert node.end_pos[1] == 0 or '\n' in self._prefix
            return node
        node = parent

</t>
<t tx="ekr.20180519070854.74">def _parse(self, until_line):
    """
    Parses at least until the given line, but might just parse more until a
    valid state is reached.
    """
    last_until_line = 0
    while until_line &gt; self._nodes_stack.parsed_until_line:
        node = self._try_parse_part(until_line)
        nodes = node.children

        self._nodes_stack.add_parsed_nodes(nodes)
        LOG.debug(
            'parse_part from %s to %s (to %s in part parser)',
            nodes[0].get_start_pos_of_prefix()[0],
            self._nodes_stack.parsed_until_line,
            node.end_pos[0] - 1
        )
        # Since the tokenizer sometimes has bugs, we cannot be sure that
        # this loop terminates. Therefore assert that there's always a
        # change.
        assert last_until_line != self._nodes_stack.parsed_until_line, last_until_line
        last_until_line = self._nodes_stack.parsed_until_line

</t>
<t tx="ekr.20180519070854.75">def _try_parse_part(self, until_line):
    """
    Sets up a normal parser that uses a spezialized tokenizer to only parse
    until a certain position (or a bit longer if the statement hasn't
    ended.
    """
    self._parser_count += 1
    # TODO speed up, shouldn't copy the whole list all the time.
    # memoryview?
    parsed_until_line = self._nodes_stack.parsed_until_line
    lines_after = self._parser_lines_new[parsed_until_line:]
    #print('parse_content', parsed_until_line, lines_after, until_line)
    tokens = self._diff_tokenize(
        lines_after,
        until_line,
        line_offset=parsed_until_line
    )
    self._active_parser = Parser(
        self._pgen_grammar,
        error_recovery=True
    )
    return self._active_parser.parse(tokens=tokens)

</t>
<t tx="ekr.20180519070854.76">def _diff_tokenize(self, lines, until_line, line_offset=0):
    is_first_token = True
    omitted_first_indent = False
    indents = []
    tokens = self._tokenizer(lines, (1, 0))
    stack = self._active_parser.pgen_parser.stack
    for typ, string, start_pos, prefix in tokens:
        start_pos = start_pos[0] + line_offset, start_pos[1]
        if typ == INDENT:
            indents.append(start_pos[1])
            if is_first_token:
                omitted_first_indent = True
                # We want to get rid of indents that are only here because
                # we only parse part of the file. These indents would only
                # get parsed as error leafs, which doesn't make any sense.
                is_first_token = False
                continue
        is_first_token = False

        # In case of omitted_first_indent, it might not be dedented fully.
        # However this is a sign for us that a dedent happened.
        if typ == DEDENT \
                or typ == ERROR_DEDENT and omitted_first_indent and len(indents) == 1:
            indents.pop()
            if omitted_first_indent and not indents:
                # We are done here, only thing that can come now is an
                # endmarker or another dedented code block.
                typ, string, start_pos, prefix = next(tokens)
                if '\n' in prefix:
                    prefix = re.sub(r'(&lt;=\n)[^\n]+$', '', prefix)
                else:
                    prefix = ''
                yield PythonToken(ENDMARKER, '', (start_pos[0] + line_offset, 0), prefix)
                break
        elif typ == NEWLINE and start_pos[0] &gt;= until_line:
            yield PythonToken(typ, string, start_pos, prefix)
            # Check if the parser is actually in a valid suite state.
            if suite_or_file_input_is_valid(self._pgen_grammar, stack):
                start_pos = start_pos[0] + 1, 0
                while len(indents) &gt; int(omitted_first_indent):
                    indents.pop()
                    yield PythonToken(DEDENT, '', start_pos, '')

                yield PythonToken(ENDMARKER, '', start_pos, '')
                break
            else:
                continue

        yield PythonToken(typ, string, start_pos, prefix)


</t>
<t tx="ekr.20180519070854.77">class _NodesStackNode(object):
    ChildrenGroup = namedtuple('ChildrenGroup', 'children line_offset last_line_offset_leaf')

    @others
</t>
<t tx="ekr.20180519070854.78">def __init__(self, tree_node, parent=None):
    self.tree_node = tree_node
    self.children_groups = []
    self.parent = parent

</t>
<t tx="ekr.20180519070854.79">def close(self):
    children = []
    for children_part, line_offset, last_line_offset_leaf in self.children_groups:
        if line_offset != 0:
            try:
                _update_positions(
                    children_part, line_offset, last_line_offset_leaf)
            except _PositionUpdatingFinished:
                pass
        children += children_part
    self.tree_node.children = children
    # Reset the parents
    for node in children:
        node.parent = self.tree_node

</t>
<t tx="ekr.20180519070854.8">def copy(self):
    """
    Copy the grammar.
    """
    new = self.__class__()
    for dict_attr in ("symbol2number", "number2symbol", "dfas", "keywords",
                      "tokens", "symbol2label"):
        setattr(new, dict_attr, getattr(self, dict_attr).copy())
    new.labels = self.labels[:]
    new.states = self.states[:]
    new.start = self.start
    return new

</t>
<t tx="ekr.20180519070854.80">def add(self, children, line_offset=0, last_line_offset_leaf=None):
    group = self.ChildrenGroup(children, line_offset, last_line_offset_leaf)
    self.children_groups.append(group)

</t>
<t tx="ekr.20180519070854.81">def get_last_line(self, suffix):
    line = 0
    if self.children_groups:
        children_group = self.children_groups[-1]
        last_leaf = children_group.children[-1].get_last_leaf()
        line = last_leaf.end_pos[0]

        # Calculate the line offsets
        offset = children_group.line_offset
        if offset:
            # In case the line_offset is not applied to this specific leaf,
            # just ignore it.
            if last_leaf.line &lt;= children_group.last_line_offset_leaf.line:
                line += children_group.line_offset

        # Newlines end on the next line, which means that they would cover
        # the next line. That line is not fully parsed at this point.
        if _ends_with_newline(last_leaf, suffix):
            line -= 1
    line += suffix.count('\n')
    if suffix and not suffix.endswith('\n'):
        # This is the end of a file (that doesn't end with a newline).
        line += 1
    return line


</t>
<t tx="ekr.20180519070854.82">class _NodesStack(object):
    endmarker_type = 'endmarker'

    @others
</t>
<t tx="ekr.20180519070854.83">def __init__(self, module):
    # Top of stack
    self._tos = self._base_node = _NodesStackNode(module)
    self._module = module
    self._last_prefix = ''
    self.prefix = ''

</t>
<t tx="ekr.20180519070854.84">def is_empty(self):
    return not self._base_node.children

</t>
<t tx="ekr.20180519070854.85">@property
def parsed_until_line(self):
    return self._tos.get_last_line(self.prefix)

</t>
<t tx="ekr.20180519070854.86">def _get_insertion_node(self, indentation_node):
    indentation = indentation_node.start_pos[1]

    # find insertion node
    node = self._tos
    while True:
        tree_node = node.tree_node
        if tree_node.type == 'suite':
            # A suite starts with NEWLINE, ...
            node_indentation = tree_node.children[1].start_pos[1]

            if indentation &gt;= node_indentation:  # Not a Dedent
                # We might be at the most outer layer: modules. We
                # don't want to depend on the first statement
                # having the right indentation.
                return node

        elif tree_node.type == 'file_input':
            return node

        node = self._close_tos()

</t>
<t tx="ekr.20180519070854.87">def _close_tos(self):
    self._tos.close()
    self._tos = self._tos.parent
    return self._tos

</t>
<t tx="ekr.20180519070854.88">def add_parsed_nodes(self, tree_nodes):
    tree_nodes = self._remove_endmarker(tree_nodes)
    if not tree_nodes:
        return

    assert tree_nodes[0].type != 'newline'

    node = self._get_insertion_node(tree_nodes[0])
    assert node.tree_node.type in ('suite', 'file_input')
    node.add(tree_nodes)
    self._update_tos(tree_nodes[-1])

</t>
<t tx="ekr.20180519070854.89">def _remove_endmarker(self, tree_nodes):
    """
    Helps cleaning up the tree nodes that get inserted.
    """
    last_leaf = tree_nodes[-1].get_last_leaf()
    is_endmarker = last_leaf.type == self.endmarker_type
    self._last_prefix = ''
    if is_endmarker:
        try:
            separation = last_leaf.prefix.rindex('\n') + 1
        except ValueError:
            pass
        else:
            # Remove the whitespace part of the prefix after a newline.
            # That is not relevant if parentheses were opened. Always parse
            # until the end of a line.
            last_leaf.prefix, self._last_prefix = \
                last_leaf.prefix[:separation], last_leaf.prefix[separation:]

    first_leaf = tree_nodes[0].get_first_leaf()
    first_leaf.prefix = self.prefix + first_leaf.prefix
    self.prefix = ''

    if is_endmarker:
        self.prefix = last_leaf.prefix

        tree_nodes = tree_nodes[:-1]
    return tree_nodes

</t>
<t tx="ekr.20180519070854.9">def report(self):
    """Dump the grammar tables to standard output, for debugging."""
    from pprint import pprint
    print("s2n")
    pprint(self.symbol2number)
    print("n2s")
    pprint(self.number2symbol)
    print("states")
    pprint(self.states)
    print("dfas")
    pprint(self.dfas)
    print("labels")
    pprint(self.labels)
    print("start", self.start)
</t>
<t tx="ekr.20180519070854.90">def copy_nodes(self, tree_nodes, until_line, line_offset):
    """
    Copies tree nodes from the old parser tree.

    Returns the number of tree nodes that were copied.
    """
    tos = self._get_insertion_node(tree_nodes[0])

    new_nodes, self._tos = self._copy_nodes(tos, tree_nodes, until_line, line_offset)
    return new_nodes

</t>
<t tx="ekr.20180519070854.91">def _copy_nodes(self, tos, nodes, until_line, line_offset):
    new_nodes = []

    new_tos = tos
    for node in nodes:
        if node.type == 'endmarker':
            # We basically removed the endmarker, but we are not allowed to
            # remove the newline at the end of the line, otherwise it's
            # going to be missing.
            try:
                self.prefix = node.prefix[:node.prefix.rindex('\n') + 1]
            except ValueError:
                pass
            # Endmarkers just distort all the checks below. Remove them.
            break

        if node.start_pos[0] &gt; until_line:
            break
        # TODO this check might take a bit of time for large files. We
        # might want to change this to do more intelligent guessing or
        # binary search.
        if _get_last_line(node) &gt; until_line:
            # We can split up functions and classes later.
            if node.type in ('classdef', 'funcdef') and node.children[-1].type == 'suite':
                new_nodes.append(node)
            break

        new_nodes.append(node)

    if not new_nodes:
        return [], tos

    last_node = new_nodes[-1]
    line_offset_index = -1
    if last_node.type in ('classdef', 'funcdef'):
        suite = last_node.children[-1]
        if suite.type == 'suite':
            suite_tos = _NodesStackNode(suite)
            # Don't need to pass line_offset here, it's already done by the
            # parent.
            suite_nodes, recursive_tos = self._copy_nodes(
                suite_tos, suite.children, until_line, line_offset)
            if len(suite_nodes) &lt; 2:
                # A suite only with newline is not valid.
                new_nodes.pop()
            else:
                suite_tos.parent = tos
                new_tos = recursive_tos
                line_offset_index = -2

    elif (new_nodes[-1].type in ('error_leaf', 'error_node') or
                      _is_flow_node(new_nodes[-1])):
        # Error leafs/nodes don't have a defined start/end. Error
        # nodes might not end with a newline (e.g. if there's an
        # open `(`). Therefore ignore all of them unless they are
        # succeeded with valid parser state.
        # If we copy flows at the end, they might be continued
        # after the copy limit (in the new parser).
        # In this while loop we try to remove until we find a newline.
        new_nodes.pop()
        while new_nodes:
            last_node = new_nodes[-1]
            if last_node.get_last_leaf().type == 'newline':
                break
            new_nodes.pop()

    if new_nodes:
        try:
            last_line_offset_leaf = new_nodes[line_offset_index].get_last_leaf()
        except IndexError:
            line_offset = 0
            # In this case we don't have to calculate an offset, because
            # there's no children to be managed.
            last_line_offset_leaf = None
        tos.add(new_nodes, line_offset, last_line_offset_leaf)
    return new_nodes, new_tos

</t>
<t tx="ekr.20180519070854.92">def _update_tos(self, tree_node):
    if tree_node.type in ('suite', 'file_input'):
        self._tos = _NodesStackNode(tree_node, self._tos)
        self._tos.add(list(tree_node.children))
        self._update_tos(tree_node.children[-1])
    elif tree_node.type in ('classdef', 'funcdef'):
        self._update_tos(tree_node.children[-1])

</t>
<t tx="ekr.20180519070854.93">def close(self):
    while self._tos is not None:
        self._close_tos()

    # Add an endmarker.
    try:
        last_leaf = self._module.get_last_leaf()
        end_pos = list(last_leaf.end_pos)
    except IndexError:
        end_pos = [1, 0]
    lines = split_lines(self.prefix)
    assert len(lines) &gt; 0
    if len(lines) == 1:
        end_pos[1] += len(lines[0])
    else:
        end_pos[0] += len(lines) - 1
        end_pos[1] = len(lines[-1])

    endmarker = EndMarker('', tuple(end_pos), self.prefix + self._last_prefix)
    endmarker.parent = self._module
    self._module.children.append(endmarker)
</t>
<t tx="ekr.20180519070854.94">@path C:/Anaconda3/Lib/site-packages/parso/python/
# -*- coding: utf-8 -*-
@others
@language python
@tabwidth -4
</t>
<t tx="ekr.20180519070854.95">import codecs
import warnings
import re
from contextlib import contextmanager

from parso.normalizer import Normalizer, NormalizerConfig, Issue, Rule
from parso.python.tree import search_ancestor
from parso.parser import ParserSyntaxError

_BLOCK_STMTS = ('if_stmt', 'while_stmt', 'for_stmt', 'try_stmt', 'with_stmt')
_STAR_EXPR_PARENTS = ('testlist_star_expr', 'testlist_comp', 'exprlist')
# This is the maximal block size given by python.
_MAX_BLOCK_SIZE = 20
_MAX_INDENT_COUNT = 100
ALLOWED_FUTURES = (
    'all_feature_names', 'nested_scopes', 'generators', 'division',
    'absolute_import', 'with_statement', 'print_function', 'unicode_literals',
)


</t>
<t tx="ekr.20180519070854.96">def _iter_stmts(scope):
    """
    Iterates over all statements and splits up  simple_stmt.
    """
    for child in scope.children:
        if child.type == 'simple_stmt':
            for child2 in child.children:
                if child2.type == 'newline' or child2 == ';':
                    continue
                yield child2
        else:
            yield child


</t>
<t tx="ekr.20180519070854.97">def _get_comprehension_type(atom):
    first, second = atom.children[:2]
    if second.type == 'testlist_comp' and second.children[1].type == 'comp_for':
        if first == '[':
            return 'list comprehension'
        else:
            return 'generator expression'
    elif second.type == 'dictorsetmaker' and second.children[-1].type == 'comp_for':
        if second.children[1] == ':':
            return 'dict comprehension'
        else:
            return 'set comprehension'
    return None


</t>
<t tx="ekr.20180519070854.98">def _is_future_import(import_from):
    # It looks like a __future__ import that is relative is still a future
    # import. That feels kind of odd, but whatever.
    # if import_from.level != 0:
        # return False
    from_names = import_from.get_from_names()
    return [n.value for n in from_names] == ['__future__']


</t>
<t tx="ekr.20180519070854.99">def _remove_parens(atom):
    """
    Returns the inner part of an expression like `(foo)`. Also removes nested
    parens.
    """
    try:
        children = atom.children
    except AttributeError:
        pass
    else:
        if len(children) == 3 and children[0] == '(':
            return _remove_parens(atom.children[1])
    return atom


</t>
<t tx="ekr.20180519070921.1">@auto failed: token.py
inserting @ignore</t>
<t tx="ekr.20180519071037.1"># flattened, ignore-case, head, body

# found 14 nodes</t>
</tnodes>
</leo_file>
